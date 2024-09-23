@implementation HFServiceItem(HUServiceItemServiceContainer)

- (id)hu_containedServices
{
  void *v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "service");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hf_isBridge");

  if (v5)
  {
    objc_msgSend(a1, "service");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "accessory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "hf_servicesBehindBridge");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "unionSet:", v8);

  }
  return v2;
}

- (uint64_t)hu_containedAccessories
{
  return objc_msgSend(MEMORY[0x1E0C99E60], "set");
}

@end
