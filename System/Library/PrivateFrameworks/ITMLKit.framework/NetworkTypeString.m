@implementation NetworkTypeString

void __NetworkTypeString_block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[10];
  _QWORD v3[11];

  v3[10] = *MEMORY[0x1E0C80C00];
  v2[0] = &unk_1E9F8C818;
  v2[1] = &unk_1E9F8C830;
  v3[0] = CFSTR("None");
  v3[1] = CFSTR("2G");
  v2[2] = &unk_1E9F8C848;
  v2[3] = &unk_1E9F8C860;
  v3[2] = CFSTR("3G");
  v3[3] = CFSTR("4G");
  v2[4] = &unk_1E9F8C878;
  v2[5] = &unk_1E9F8C890;
  v3[4] = CFSTR("5G");
  v3[5] = CFSTR("6G");
  v2[6] = &unk_1E9F8C8A8;
  v2[7] = &unk_1E9F8C8C0;
  v3[6] = CFSTR("7G");
  v3[7] = CFSTR("8G");
  v2[8] = &unk_1E9F8C8D8;
  v2[9] = &unk_1E9F8C8F0;
  v3[8] = CFSTR("9G");
  v3[9] = CFSTR("WiFi");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 10);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)NetworkTypeString_networkTypeDictionary;
  NetworkTypeString_networkTypeDictionary = v0;

}

@end
