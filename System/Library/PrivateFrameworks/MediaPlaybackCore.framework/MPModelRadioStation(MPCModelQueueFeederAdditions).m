@implementation MPModelRadioStation(MPCModelQueueFeederAdditions)

+ (id)mqf_requiredSectionPlaybackProperties
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v8[10];

  v8[9] = *MEMORY[0x24BDAC8D0];
  v0 = objc_alloc(MEMORY[0x24BDDCB30]);
  v1 = *MEMORY[0x24BDDC050];
  v8[0] = *MEMORY[0x24BDDBFF0];
  v8[1] = v1;
  v2 = *MEMORY[0x24BDDC000];
  v8[2] = *MEMORY[0x24BDDBFF8];
  v8[3] = v2;
  v3 = *MEMORY[0x24BDDC078];
  v8[4] = *MEMORY[0x24BDDC080];
  v8[5] = v3;
  v4 = *MEMORY[0x24BDDC060];
  v8[6] = *MEMORY[0x24BDDC070];
  v8[7] = v4;
  v8[8] = *MEMORY[0x24BDDC058];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v0, "initWithProperties:relationships:", v5, MEMORY[0x24BDBD1B8]);

  return v6;
}

@end
