@implementation WFSerializedNameForMediaType

void __WFSerializedNameForMediaType_block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[10];
  _QWORD v8[11];

  v8[10] = *MEMORY[0x24BDAC8D0];
  v0 = *MEMORY[0x24BEC4978];
  v7[0] = *MEMORY[0x24BEC4960];
  v7[1] = v0;
  v8[0] = CFSTR("Movies");
  v8[1] = CFSTR("Podcasts");
  v1 = *MEMORY[0x24BEC4970];
  v7[2] = *MEMORY[0x24BEC4968];
  v7[3] = v1;
  v8[2] = CFSTR("Music");
  v8[3] = CFSTR("Music Videos");
  v2 = *MEMORY[0x24BEC4980];
  v7[4] = *MEMORY[0x24BEC4958];
  v7[5] = v2;
  v8[4] = CFSTR("Audiobooks");
  v8[5] = CFSTR("Short Films");
  v3 = *MEMORY[0x24BEC4988];
  v7[6] = *MEMORY[0x24BEC4990];
  v7[7] = v3;
  v8[6] = CFSTR("TV Shows");
  v8[7] = CFSTR("Apps");
  v4 = *MEMORY[0x24BEC4950];
  v7[8] = *MEMORY[0x24BEC4998];
  v7[9] = v4;
  v8[8] = CFSTR("iBooks");
  v8[9] = CFSTR("All");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, v7, 10);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)WFSerializedNameForMediaType_mapping;
  WFSerializedNameForMediaType_mapping = v5;

}

@end
