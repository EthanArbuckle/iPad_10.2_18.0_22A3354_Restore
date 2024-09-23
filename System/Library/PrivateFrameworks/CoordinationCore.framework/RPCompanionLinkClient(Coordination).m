@implementation RPCompanionLinkClient(Coordination)

+ (id)co_companionLinkClientForDiscovery
{
  id v1;

  v1 = objc_alloc_init(a1);
  objc_msgSend(v1, "setControlFlags:", 2052);
  return v1;
}

+ (id)co_companionLinkClientForDiscoveryOnDispatchQueue:()Coordination
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "co_companionLinkClientForDiscovery");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDispatchQueue:", v4);

  return v5;
}

+ (id)co_companionLinkClientToDevice:()Coordination
{
  id v4;
  id v5;

  v4 = a3;
  v5 = objc_alloc_init(a1);
  objc_msgSend(v5, "setControlFlags:", 0x20000400800);
  objc_msgSend(v5, "setDestinationDevice:", v4);

  return v5;
}

+ (id)co_companionLinkClientToDevice:()Coordination dispatchQueue:
{
  id v6;
  void *v7;

  v6 = a4;
  objc_msgSend(a1, "co_companionLinkClientToDevice:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDispatchQueue:", v6);

  return v7;
}

@end
