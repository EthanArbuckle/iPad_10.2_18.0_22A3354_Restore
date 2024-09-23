@implementation MPModelAlbum(MPCModelQueueFeederAdditions)

+ (id)mqf_requiredSectionPlaybackProperties
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[6];

  v13[5] = *MEMORY[0x24BDAC8D0];
  v0 = objc_alloc(MEMORY[0x24BDDCB30]);
  v1 = *MEMORY[0x24BDDBD80];
  v13[0] = *MEMORY[0x24BDDBDA0];
  v13[1] = v1;
  v2 = *MEMORY[0x24BDDBDA8];
  v13[2] = *MEMORY[0x24BDDBDC0];
  v13[3] = v2;
  v13[4] = *MEMORY[0x24BDDBDB0];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *MEMORY[0x24BDDC270];
  v4 = (void *)MEMORY[0x24BDDCB30];
  v10 = *MEMORY[0x24BDDBDD0];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v10, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "propertySetWithProperties:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v0, "initWithProperties:relationships:", v3, v7);

  return v8;
}

@end
