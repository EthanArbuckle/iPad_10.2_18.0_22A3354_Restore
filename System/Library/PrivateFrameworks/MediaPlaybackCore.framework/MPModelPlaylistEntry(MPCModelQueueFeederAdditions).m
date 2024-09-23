@implementation MPModelPlaylistEntry(MPCModelQueueFeederAdditions)

+ (id)mqf_requiredItemPlaybackProperties
{
  id v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[3];
  _QWORD v8[4];

  v8[3] = *MEMORY[0x24BDAC8D0];
  v0 = objc_alloc(MEMORY[0x24BDDCB30]);
  v7[0] = *MEMORY[0x24BDDC350];
  objc_msgSend(MEMORY[0x24BDDC9D8], "mqf_requiredItemPlaybackProperties");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v1;
  v7[1] = *MEMORY[0x24BDDC358];
  objc_msgSend(MEMORY[0x24BDDCA28], "mqf_requiredItemPlaybackProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v2;
  v7[2] = *MEMORY[0x24BDDC348];
  objc_msgSend(MEMORY[0x24BDDC918], "mqf_requiredItemPlaybackProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, v7, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v0, "initWithProperties:relationships:", MEMORY[0x24BDBD1A8], v4);

  return v5;
}

@end
