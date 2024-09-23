@implementation HMAccessory(MediaSetup)

- (uint64_t)isHomePod
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "category");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "categoryType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x24BDD49E0]);
  return v3;
}

- (uint64_t)isPartOfHome:()MediaSetup
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v4 = a3;
  objc_msgSend(a1, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uniqueIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v6, "isEqual:", v7);
  return v8;
}

- (BOOL)isEndpoint
{
  void *v1;
  _BOOL8 v2;

  objc_msgSend(a1, "siriEndpointProfile");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1 != 0;

  return v2;
}

@end
