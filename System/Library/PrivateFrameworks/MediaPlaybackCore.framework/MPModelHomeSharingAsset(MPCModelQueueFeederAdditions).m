@implementation MPModelHomeSharingAsset(MPCModelQueueFeederAdditions)

+ (id)mqf_requiredItemPlaybackProperties
{
  void *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  _QWORD v5[4];

  v5[3] = *MEMORY[0x24BDAC8D0];
  v0 = (void *)MEMORY[0x24BDDCB30];
  v1 = *MEMORY[0x24BDDBE50];
  v5[0] = *MEMORY[0x24BDDBE58];
  v5[1] = v1;
  v5[2] = *MEMORY[0x24BDDBE48];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v5, 3);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "propertySetWithProperties:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
