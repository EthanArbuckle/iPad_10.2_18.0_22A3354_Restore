@implementation VSUserAccountErrorStrings

void __VSUserAccountErrorStrings_block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v6[0] = &unk_1E93CC630;
  objc_msgSend(MEMORY[0x1E0CB34D0], "vs_frameworkBundle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "localizedStringForKey:value:table:", CFSTR("ERROR_DESCRIPTION_PROVIDER_MISMATCH"), 0, 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = &unk_1E93CC5E8;
  v7[0] = v1;
  objc_msgSend(MEMORY[0x1E0CB34D0], "vs_frameworkBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("ERROR_DESCRIPTION_SERVICE_UNAVAILABLE"), 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)VSUserAccountErrorStrings_errorStrings;
  VSUserAccountErrorStrings_errorStrings = v4;

}

@end
