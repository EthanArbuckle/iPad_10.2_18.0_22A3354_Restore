@implementation DNDModeConfigurationSmartTrigger(Record)

+ (uint64_t)newWithDictionaryRepresentation:()Record context:
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a3, "bs_safeNumberForKey:", CFSTR("enabledSetting"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedIntegerValue");

  return objc_msgSend(objc_alloc(MEMORY[0x1E0D1D698]), "initWithEnabledSetting:", v4);
}

- (id)dictionaryRepresentationWithContext:()Record
{
  void *v1;
  void *v2;
  _QWORD v4[2];
  _QWORD v5[3];

  v5[2] = *MEMORY[0x1E0C80C00];
  v4[0] = CFSTR("class");
  v4[1] = CFSTR("enabledSetting");
  v5[0] = CFSTR("DNDModeConfigurationSmartTrigger");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a1, "enabledSetting"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[1] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

@end
