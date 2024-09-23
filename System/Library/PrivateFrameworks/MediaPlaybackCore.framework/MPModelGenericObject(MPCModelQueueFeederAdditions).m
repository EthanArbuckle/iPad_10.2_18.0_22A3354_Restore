@implementation MPModelGenericObject(MPCModelQueueFeederAdditions)

+ (id)mqf_requiredItemPlaybackProperties
{
  id v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[6];
  _QWORD v11[7];

  v11[6] = *MEMORY[0x24BDAC8D0];
  v0 = objc_alloc(MEMORY[0x24BDDCB30]);
  v10[0] = *MEMORY[0x24BDDC2C0];
  objc_msgSend(MEMORY[0x24BDDC950], "mqf_requiredItemPlaybackProperties");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v1;
  v10[1] = *MEMORY[0x24BDDC2A8];
  objc_msgSend(MEMORY[0x24BDDC910], "mqf_requiredItemPlaybackProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v2;
  v10[2] = *MEMORY[0x24BDDC2B0];
  objc_msgSend(MEMORY[0x24BDDC918], "mqf_requiredItemPlaybackProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v3;
  v10[3] = *MEMORY[0x24BDDC2F8];
  objc_msgSend(MEMORY[0x24BDDC9D8], "mqf_requiredItemPlaybackProperties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[3] = v4;
  v10[4] = *MEMORY[0x24BDDC300];
  objc_msgSend(MEMORY[0x24BDDCA28], "mqf_requiredItemPlaybackProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[4] = v5;
  v10[5] = *MEMORY[0x24BDDC2D0];
  objc_msgSend(MEMORY[0x24BDDC978], "mqf_requiredItemPlaybackProperties");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[5] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, v10, 6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v0, "initWithProperties:relationships:", MEMORY[0x24BDBD1A8], v7);

  return v8;
}

+ (id)mqf_requiredSectionPlaybackProperties
{
  id v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[8];
  _QWORD v13[9];

  v13[8] = *MEMORY[0x24BDAC8D0];
  v0 = objc_alloc(MEMORY[0x24BDDCB30]);
  v12[0] = *MEMORY[0x24BDDC2B8];
  objc_msgSend(MEMORY[0x24BDDC948], "mqf_requiredSectionPlaybackProperties");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v1;
  v12[1] = *MEMORY[0x24BDDC278];
  objc_msgSend(MEMORY[0x24BDDC830], "mqf_requiredSectionPlaybackProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v2;
  v12[2] = *MEMORY[0x24BDDC280];
  objc_msgSend(MEMORY[0x24BDDC840], "mqf_requiredSectionPlaybackProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v3;
  v12[3] = *MEMORY[0x24BDDC298];
  objc_msgSend(MEMORY[0x24BDDC898], "mqf_requiredSectionPlaybackProperties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13[3] = v4;
  v12[4] = *MEMORY[0x24BDDC308];
  objc_msgSend(MEMORY[0x24BDDCA38], "mqf_requiredSectionPlaybackProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[4] = v5;
  v12[5] = *MEMORY[0x24BDDC310];
  objc_msgSend(MEMORY[0x24BDDCA48], "mqf_requiredSectionPlaybackProperties");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[5] = v6;
  v12[6] = *MEMORY[0x24BDDC2C8];
  objc_msgSend(MEMORY[0x24BDDC970], "mqf_requiredSectionPlaybackProperties");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[6] = v7;
  v12[7] = *MEMORY[0x24BDDC2D8];
  objc_msgSend(MEMORY[0x24BDDC988], "mqf_requiredSectionPlaybackProperties");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[7] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, v12, 8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v0, "initWithProperties:relationships:", MEMORY[0x24BDBD1A8], v9);

  return v10;
}

@end
