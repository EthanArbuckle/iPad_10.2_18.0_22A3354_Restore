@implementation WFSerializedNameForEntityType

void __WFSerializedNameForEntityType_block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[21];
  _QWORD v13[22];

  v13[21] = *MEMORY[0x24BDAC8D0];
  v0 = *MEMORY[0x24BEC48D8];
  v12[0] = *MEMORY[0x24BEC48D0];
  v12[1] = v0;
  v13[0] = CFSTR("Movies");
  v13[1] = CFSTR("Artists");
  v1 = *MEMORY[0x24BEC4910];
  v12[2] = *MEMORY[0x24BEC4908];
  v12[3] = v1;
  v13[2] = CFSTR("Podcasts");
  v13[3] = CFSTR("Authors");
  v2 = *MEMORY[0x24BEC48F8];
  v12[4] = *MEMORY[0x24BEC48E8];
  v12[5] = v2;
  v13[4] = CFSTR("Artists");
  v13[5] = CFSTR("Tracks");
  v3 = *MEMORY[0x24BEC4900];
  v12[6] = *MEMORY[0x24BEC48E0];
  v12[7] = v3;
  v13[6] = CFSTR("Albums");
  v13[7] = CFSTR("Music Videos");
  v4 = *MEMORY[0x24BEC48C0];
  v12[8] = *MEMORY[0x24BEC48F0];
  v12[9] = v4;
  v13[8] = CFSTR("Songs");
  v13[9] = CFSTR("Authors");
  v5 = *MEMORY[0x24BEC4918];
  v12[10] = *MEMORY[0x24BEC48B8];
  v12[11] = v5;
  v13[10] = CFSTR("Audiobooks");
  v13[11] = CFSTR("Short Films");
  v6 = *MEMORY[0x24BEC4930];
  v12[12] = *MEMORY[0x24BEC4920];
  v12[13] = v6;
  v13[12] = CFSTR("Artists");
  v13[13] = CFSTR("Episodes");
  v7 = *MEMORY[0x24BEC4928];
  v12[14] = *MEMORY[0x24BEC4938];
  v12[15] = v7;
  v13[14] = CFSTR("Seasons");
  v13[15] = CFSTR("iPhone");
  v8 = *MEMORY[0x24BEC48C8];
  v12[16] = *MEMORY[0x24BEC4948];
  v12[17] = v8;
  v13[16] = CFSTR("iPad");
  v13[17] = CFSTR("Mac");
  v9 = *MEMORY[0x24BEC48A8];
  v12[18] = *MEMORY[0x24BEC4940];
  v12[19] = v9;
  v13[18] = CFSTR("iBooks");
  v13[19] = CFSTR("Artists");
  v12[20] = *MEMORY[0x24BEC48B0];
  v13[20] = CFSTR("Tracks");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, v12, 21);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)WFSerializedNameForEntityType_mapping;
  WFSerializedNameForEntityType_mapping = v10;

}

@end
