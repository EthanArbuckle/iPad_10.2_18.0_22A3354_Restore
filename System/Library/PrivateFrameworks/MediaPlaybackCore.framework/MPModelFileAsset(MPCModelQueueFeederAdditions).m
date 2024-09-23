@implementation MPModelFileAsset(MPCModelQueueFeederAdditions)

+ (id)mqf_requiredItemPlaybackProperties
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v8[10];

  v8[9] = *MEMORY[0x24BDAC8D0];
  v0 = (void *)MEMORY[0x24BDDCB30];
  v1 = *MEMORY[0x24BDDBE18];
  v8[0] = *MEMORY[0x24BDDBDF0];
  v8[1] = v1;
  v2 = *MEMORY[0x24BDDBE28];
  v8[2] = *MEMORY[0x24BDDBE20];
  v8[3] = v2;
  v3 = *MEMORY[0x24BDDBE08];
  v8[4] = *MEMORY[0x24BDDBE10];
  v8[5] = v3;
  v4 = *MEMORY[0x24BDDBDF8];
  v8[6] = *MEMORY[0x24BDDBE00];
  v8[7] = v4;
  v8[8] = *MEMORY[0x24BDDBE30];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "propertySetWithProperties:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
