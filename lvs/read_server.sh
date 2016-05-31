#!/bin/bash
VIP=192.168.122.100
case $1 in
    start)
	echo "Virtual Ipaddress is ${VIP}"
        ip addr add ${VIP}/32 dev lo
        ip route add ${VIP}/32 dev lo
        echo 1 > /proc/sys/net/ipv4/conf/lo/arp_ignore
        echo 2 > /proc/sys/net/ipv4/conf/lo/arp_announce
        echo 1 > /proc/sys/net/ipv4/conf/all/arp_ignore
        echo 2 > /proc/sys/net/ipv4/conf/all/arp_announce;;
    stop)
        ip add del ${VIP}/32 dev lo
        ip route del ${VIP}/32 dev lo
        echo 0 > /proc/sys/net/ipv4/conf/lo/arp_ignore
        echo 0 > /proc/sys/net/ipv4/conf/lo/arp_announce
        echo 0 > /proc/sys/net/ipv4/conf/all/arp_ignore
        echo 0 > /proc/sys/net/ipv4/conf/all/arp_announce;;
       *)
        echo 'Usaga: $0 {start|stop}'
        exit 0;;
esac

