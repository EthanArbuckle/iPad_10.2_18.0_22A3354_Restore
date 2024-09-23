@implementation WFLocalizedNameForMediaType

void __WFLocalizedNameForMediaType_block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[10];
  _QWORD v13[12];

  v13[10] = *MEMORY[0x24BDAC8D0];
  v12[0] = *MEMORY[0x24BEC4960];
  WFLocalizedStringWithKey(CFSTR("Movies (Media Type)"), CFSTR("Movies"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v0;
  v12[1] = *MEMORY[0x24BEC4978];
  WFLocalizedStringWithKey(CFSTR("Podcasts (Media Type)"), CFSTR("Podcasts"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v1;
  v12[2] = *MEMORY[0x24BEC4968];
  WFLocalizedStringWithKey(CFSTR("Music (Media Type)"), CFSTR("Music"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v2;
  v12[3] = *MEMORY[0x24BEC4970];
  WFLocalizedStringWithKey(CFSTR("Music Videos (Media Type)"), CFSTR("Music Videos"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13[3] = v3;
  v12[4] = *MEMORY[0x24BEC4958];
  WFLocalizedStringWithKey(CFSTR("Audiobooks (Media Type)"), CFSTR("Audiobooks"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13[4] = v4;
  v12[5] = *MEMORY[0x24BEC4980];
  WFLocalizedStringWithKey(CFSTR("Short Films (Media Type)"), CFSTR("Short Films"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[5] = v5;
  v12[6] = *MEMORY[0x24BEC4990];
  WFLocalizedStringWithKey(CFSTR("TV Shows (Media Type)"), CFSTR("TV Shows"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[6] = v6;
  v12[7] = *MEMORY[0x24BEC4988];
  WFLocalizedStringWithKey(CFSTR("Apps (Media Type)"), CFSTR("Apps"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[7] = v7;
  v12[8] = *MEMORY[0x24BEC4998];
  WFLocalizedStringWithKey(CFSTR("Books (Media Type)"), CFSTR("Books"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[8] = v8;
  v12[9] = *MEMORY[0x24BEC4950];
  WFLocalizedStringWithKey(CFSTR("All (Media Type)"), CFSTR("All"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[9] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, v12, 10);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)WFLocalizedNameForMediaType_mapping;
  WFLocalizedNameForMediaType_mapping = v10;

}

@end
