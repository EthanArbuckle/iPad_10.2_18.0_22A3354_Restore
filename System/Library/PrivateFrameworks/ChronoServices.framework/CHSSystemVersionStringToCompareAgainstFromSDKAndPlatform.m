@implementation CHSSystemVersionStringToCompareAgainstFromSDKAndPlatform

void ___CHSSystemVersionStringToCompareAgainstFromSDKAndPlatform_block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[5];
  _QWORD v5[5];
  _QWORD v6[5];
  _QWORD v7[5];
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v8[0] = &unk_1E2A82AF0;
  v6[0] = &unk_1E2A82B08;
  v6[1] = &unk_1E2A82B20;
  v7[0] = CFSTR("14.0");
  v7[1] = CFSTR("17.0");
  v6[2] = &unk_1E2A82B38;
  v6[3] = &unk_1E2A82B50;
  v7[2] = CFSTR("17.0");
  v7[3] = CFSTR("17.0");
  v6[4] = &unk_1E2A82B68;
  v7[4] = CFSTR("17.0");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 5);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = &unk_1E2A82B08;
  v9[0] = v0;
  v4[0] = &unk_1E2A82B08;
  v4[1] = &unk_1E2A82B20;
  v5[0] = CFSTR("15.0");
  v5[1] = CFSTR("18.0");
  v4[2] = &unk_1E2A82B38;
  v4[3] = &unk_1E2A82B50;
  v5[2] = CFSTR("18.0");
  v5[3] = CFSTR("18.0");
  v4[4] = &unk_1E2A82B68;
  v5[4] = CFSTR("18.0");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 5);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)__sdkVersionPlatformToSystemVersion;
  __sdkVersionPlatformToSystemVersion = v2;

}

@end
