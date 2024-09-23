@implementation WFSerializedNameForAttribute

void __WFSerializedNameForAttribute_block_invoke()
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
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  _QWORD v15[27];
  _QWORD v16[28];

  v16[27] = *MEMORY[0x24BDAC8D0];
  v0 = *MEMORY[0x24BEC47D8];
  v15[0] = CFSTR("productID");
  v15[1] = v0;
  v16[0] = CFSTR("Product ID");
  v16[1] = CFSTR("Actor");
  v1 = *MEMORY[0x24BEC48A0];
  v15[2] = *MEMORY[0x24BEC4810];
  v15[3] = v1;
  v16[2] = CFSTR("Description");
  v16[3] = CFSTR("Title");
  v2 = *MEMORY[0x24BEC47E8];
  v15[4] = *MEMORY[0x24BEC4848];
  v15[5] = v2;
  v16[4] = CFSTR("Artist");
  v16[5] = CFSTR("Artist");
  v3 = *MEMORY[0x24BEC4818];
  v15[6] = *MEMORY[0x24BEC47F0];
  v15[7] = v3;
  v16[6] = CFSTR("Track");
  v16[7] = CFSTR("Director");
  v4 = *MEMORY[0x24BEC4898];
  v15[8] = *MEMORY[0x24BEC4838];
  v15[9] = v4;
  v16[8] = CFSTR("Language");
  v16[9] = CFSTR("Season");
  v5 = *MEMORY[0x24BEC4888];
  v15[10] = *MEMORY[0x24BEC4850];
  v15[11] = v5;
  v16[10] = CFSTR("Producer");
  v16[11] = CFSTR("Song");
  v6 = *MEMORY[0x24BEC4858];
  v15[12] = *MEMORY[0x24BEC47E0];
  v15[13] = v6;
  v16[12] = CFSTR("Album");
  v16[13] = CFSTR("Rating");
  v7 = *MEMORY[0x24BEC4840];
  v15[14] = *MEMORY[0x24BEC4828];
  v15[15] = v7;
  v16[14] = CFSTR("Genre");
  v16[15] = CFSTR("Movie");
  v8 = *MEMORY[0x24BEC4830];
  v15[16] = *MEMORY[0x24BEC4800];
  v15[17] = v8;
  v16[16] = CFSTR("Author");
  v16[17] = CFSTR("Keywords");
  v9 = *MEMORY[0x24BEC4860];
  v15[18] = *MEMORY[0x24BEC4868];
  v15[19] = v9;
  v16[18] = CFSTR("Release Year");
  v16[19] = CFSTR("Rating Index");
  v10 = *MEMORY[0x24BEC47F8];
  v15[20] = *MEMORY[0x24BEC4878];
  v15[21] = v10;
  v16[20] = CFSTR("Show");
  v16[21] = CFSTR("Artist");
  v11 = *MEMORY[0x24BEC4808];
  v15[22] = *MEMORY[0x24BEC4870];
  v15[23] = v11;
  v16[22] = CFSTR("Short Film");
  v16[23] = CFSTR("Composer");
  v12 = *MEMORY[0x24BEC4880];
  v15[24] = *MEMORY[0x24BEC4890];
  v15[25] = v12;
  v16[24] = CFSTR("Episode");
  v16[25] = CFSTR("Developer");
  v15[26] = *MEMORY[0x24BEC4820];
  v16[26] = CFSTR("Feature Film");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, v15, 27);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)WFSerializedNameForAttribute_mapping;
  WFSerializedNameForAttribute_mapping = v13;

}

@end
