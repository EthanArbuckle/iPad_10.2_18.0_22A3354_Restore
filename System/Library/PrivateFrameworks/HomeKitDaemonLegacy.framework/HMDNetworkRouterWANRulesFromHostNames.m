@implementation HMDNetworkRouterWANRulesFromHostNames

void __HMDNetworkRouterWANRulesFromHostNames_block_invoke(uint64_t a1, void *a2)
{
  HMDNetworkRouterWANICMPRule *v4;
  HMDNetworkRouterWANICMPRule *v5;

  if (*(_QWORD *)(a1 + 32))
    v4 = -[HMDNetworkRouterWANICMPRule initWithHostDNSName:hostIPStart:hostIPEnd:icmpTypes:]([HMDNetworkRouterWANICMPRule alloc], "initWithHostDNSName:hostIPStart:hostIPEnd:icmpTypes:", a2, 0, 0, *(_QWORD *)(a1 + 32));
  else
    v4 = -[HMDNetworkRouterWANPortRule initWithProtocol:hostDNSName:hostIPStart:hostIPEnd:hostPortStart:hostPortEnd:]([HMDNetworkRouterWANPortRule alloc], "initWithProtocol:hostDNSName:hostIPStart:hostIPEnd:hostPortStart:hostPortEnd:", *(_QWORD *)(a1 + 40), a2, 0, 0, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  v5 = v4;

  objc_msgSend(*(id *)(a1 + 64), "addObject:", v5);
}

@end
