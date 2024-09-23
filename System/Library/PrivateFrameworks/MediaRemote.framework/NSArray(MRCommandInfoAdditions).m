@implementation NSArray(MRCommandInfoAdditions)

- (uint64_t)mr_isCommandSupported:()MRCommandInfoAdditions
{
  _QWORD v4[4];
  int v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __57__NSArray_MRCommandInfoAdditions__mr_isCommandSupported___block_invoke;
  v4[3] = &__block_descriptor_36_e23_B16__0__MRCommandInfo_8l;
  v5 = a3;
  return objc_msgSend(a1, "mr_any:", v4);
}

- (uint64_t)mr_isCommandSupportedAndEnabled:()MRCommandInfoAdditions
{
  _QWORD v4[4];
  int v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __67__NSArray_MRCommandInfoAdditions__mr_isCommandSupportedAndEnabled___block_invoke;
  v4[3] = &__block_descriptor_36_e23_B16__0__MRCommandInfo_8l;
  v5 = a3;
  return objc_msgSend(a1, "mr_any:", v4);
}

- (uint64_t)mr_ifDisabledWhyDisabled:()MRCommandInfoAdditions
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v8[4];
  int v9;

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __60__NSArray_MRCommandInfoAdditions__mr_ifDisabledWhyDisabled___block_invoke;
  v8[3] = &__block_descriptor_36_e23_B16__0__MRCommandInfo_8l;
  v9 = a3;
  objc_msgSend(a1, "mr_first:", v8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "options");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kMRMediaRemoteCommandInfoDisabledReason"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "intValue");
  return v6;
}

@end
