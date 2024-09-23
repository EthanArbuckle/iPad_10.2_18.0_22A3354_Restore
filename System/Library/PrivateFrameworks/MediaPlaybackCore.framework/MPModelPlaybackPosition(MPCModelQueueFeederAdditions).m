@implementation MPModelPlaybackPosition(MPCModelQueueFeederAdditions)

+ (id)mqf_requiredItemPlaybackProperties
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;
  _QWORD v6[6];

  v6[5] = *MEMORY[0x24BDAC8D0];
  v0 = (void *)MEMORY[0x24BDDCB30];
  v1 = *MEMORY[0x24BDDBEF0];
  v6[0] = *MEMORY[0x24BDDBEE0];
  v6[1] = v1;
  v2 = *MEMORY[0x24BDDBF00];
  v6[2] = *MEMORY[0x24BDDBEF8];
  v6[3] = v2;
  v6[4] = *MEMORY[0x24BDDBF08];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "propertySetWithProperties:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
