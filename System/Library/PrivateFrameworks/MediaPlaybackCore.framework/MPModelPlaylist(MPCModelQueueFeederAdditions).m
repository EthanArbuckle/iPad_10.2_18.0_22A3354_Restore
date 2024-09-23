@implementation MPModelPlaylist(MPCModelQueueFeederAdditions)

+ (id)mqf_requiredSectionPlaybackProperties
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD v9[11];

  v9[10] = *MEMORY[0x24BDAC8D0];
  v0 = (void *)MEMORY[0x24BDDCB30];
  v1 = *MEMORY[0x24BDDBF48];
  v9[0] = *MEMORY[0x24BDDBF50];
  v9[1] = v1;
  v2 = *MEMORY[0x24BDDBF20];
  v9[2] = *MEMORY[0x24BDDBF70];
  v9[3] = v2;
  v3 = *MEMORY[0x24BDDBF18];
  v9[4] = *MEMORY[0x24BDDBF68];
  v9[5] = v3;
  v4 = *MEMORY[0x24BDDBF60];
  v9[6] = *MEMORY[0x24BDDBF58];
  v9[7] = v4;
  v5 = *MEMORY[0x24BDDBF28];
  v9[8] = *MEMORY[0x24BDDBF30];
  v9[9] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "propertySetWithProperties:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
