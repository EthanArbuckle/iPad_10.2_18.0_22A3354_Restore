@implementation MPModelPodcastEpisode(MPCModelQueueFeederAdditions)

+ (id)mqf_requiredItemPlaybackProperties
{
  id v0;
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x24BDAC8D0];
  v0 = objc_alloc(MEMORY[0x24BDDCB30]);
  v1 = *MEMORY[0x24BDDBF88];
  v12[0] = *MEMORY[0x24BDDBFB8];
  v12[1] = v1;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *MEMORY[0x24BDDC370];
  v3 = (void *)MEMORY[0x24BDDCB30];
  v9 = *MEMORY[0x24BDDBFE8];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v9, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "propertySetWithProperties:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v0, "initWithProperties:relationships:", v2, v6);

  return v7;
}

@end
