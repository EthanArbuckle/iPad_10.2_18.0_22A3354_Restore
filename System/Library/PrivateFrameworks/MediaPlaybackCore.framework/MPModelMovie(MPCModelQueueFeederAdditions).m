@implementation MPModelMovie(MPCModelQueueFeederAdditions)

+ (id)mqf_requiredItemPlaybackProperties
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[3];
  _QWORD v13[3];
  _QWORD v14[10];

  v14[9] = *MEMORY[0x24BDAC8D0];
  v0 = objc_alloc(MEMORY[0x24BDDCB30]);
  v1 = *MEMORY[0x24BDDBE90];
  v14[0] = *MEMORY[0x24BDDBED0];
  v14[1] = v1;
  v2 = *MEMORY[0x24BDDBEA0];
  v14[2] = *MEMORY[0x24BDDBE98];
  v14[3] = v2;
  v3 = *MEMORY[0x24BDDBEC0];
  v14[4] = *MEMORY[0x24BDDBEC8];
  v14[5] = v3;
  v4 = *MEMORY[0x24BDDBEB8];
  v14[6] = *MEMORY[0x24BDDBEB0];
  v14[7] = v4;
  v14[8] = *MEMORY[0x24BDDBEA8];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDDC878], "mqf_requiredItemPlaybackProperties", *MEMORY[0x24BDDC320]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v6;
  v12[1] = *MEMORY[0x24BDDC328];
  objc_msgSend(MEMORY[0x24BDDC940], "mqf_requiredItemPlaybackProperties");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v7;
  v12[2] = *MEMORY[0x24BDDC330];
  objc_msgSend(MEMORY[0x24BDDCA00], "mqf_requiredItemPlaybackProperties");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, v12, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v0, "initWithProperties:relationships:", v5, v9);

  return v10;
}

@end
