@implementation HMDNetworkRouterWANRulesFromAddresses

void __HMDNetworkRouterWANRulesFromAddresses_block_invoke(uint64_t a1, uint64_t a2)
{
  HMDNetworkRouterWANICMPRule *v3;
  HMDNetworkRouterWANICMPRule *v4;
  id v5;

  +[HMDNetworkRouterIPAddress ipAddressFromRuleAddress:allowWildcard:](HMDNetworkRouterIPAddress, "ipAddressFromRuleAddress:allowWildcard:", a2, 1);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (*(_QWORD *)(a1 + 32))
    v3 = -[HMDNetworkRouterWANICMPRule initWithHostDNSName:hostIPStart:hostIPEnd:icmpTypes:]([HMDNetworkRouterWANICMPRule alloc], "initWithHostDNSName:hostIPStart:hostIPEnd:icmpTypes:", 0, v5, 0, *(_QWORD *)(a1 + 32));
  else
    v3 = -[HMDNetworkRouterWANPortRule initWithProtocol:hostDNSName:hostIPStart:hostIPEnd:hostPortStart:hostPortEnd:]([HMDNetworkRouterWANPortRule alloc], "initWithProtocol:hostDNSName:hostIPStart:hostIPEnd:hostPortStart:hostPortEnd:", *(_QWORD *)(a1 + 40), 0, v5, 0, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  v4 = v3;
  objc_msgSend(*(id *)(a1 + 64), "addObject:", v3);

}

@end
