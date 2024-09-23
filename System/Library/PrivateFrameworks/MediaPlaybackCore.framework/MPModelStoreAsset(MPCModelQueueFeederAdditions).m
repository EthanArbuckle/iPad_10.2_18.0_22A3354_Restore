@implementation MPModelStoreAsset(MPCModelQueueFeederAdditions)

+ (id)mqf_requiredItemPlaybackProperties
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD v7[7];

  v7[6] = *MEMORY[0x24BDAC8D0];
  v0 = (void *)MEMORY[0x24BDDCB30];
  v1 = *MEMORY[0x24BDDC1C8];
  v7[0] = *MEMORY[0x24BDDC1B8];
  v7[1] = v1;
  v2 = *MEMORY[0x24BDDC1C0];
  v7[2] = *MEMORY[0x24BDDC1B0];
  v7[3] = v2;
  v3 = *MEMORY[0x24BDDC1D8];
  v7[4] = *MEMORY[0x24BDDC1D0];
  v7[5] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "propertySetWithProperties:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
