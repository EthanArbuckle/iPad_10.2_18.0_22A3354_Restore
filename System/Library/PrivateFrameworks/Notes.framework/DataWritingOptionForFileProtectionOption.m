@implementation DataWritingOptionForFileProtectionOption

void __DataWritingOptionForFileProtectionOption_block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[4];
  _QWORD v5[5];

  v5[4] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0CB2AB0];
  v4[0] = *MEMORY[0x1E0CB2AE0];
  v4[1] = v0;
  v5[0] = &unk_1E81F02B8;
  v5[1] = &unk_1E81F02D0;
  v1 = *MEMORY[0x1E0CB2AC0];
  v4[2] = *MEMORY[0x1E0CB2AB8];
  v4[3] = v1;
  v5[2] = &unk_1E81F02E8;
  v5[3] = &unk_1E81F0300;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 4);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)DataWritingOptionForFileProtectionOption_s_mappings;
  DataWritingOptionForFileProtectionOption_s_mappings = v2;

}

@end
