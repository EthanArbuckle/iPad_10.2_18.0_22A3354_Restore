@implementation AXSSKeyChord(Speaking)

- (uint64_t)accessibilitySpeakableDisplayValue
{
  return objc_msgSend(a1, "accessibilitySpeakableDisplayValueWithStyle:", 0);
}

- (id)accessibilitySpeakableDisplayValueWithStyle:()Speaking
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  BKSHIDServicesGetHardwareKeyboardLanguage();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = objc_msgSend(v5, "isEqualToString:", CFSTR("U.S."));
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localeIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_msgSend(v9, "isEqualToString:", CFSTR("en_US"));
  }
  objc_msgSend(a1, "_accessibilitySpeakableDisplayValueWithStyle:isUSKeyboard:", a3, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_accessibilitySpeakableDisplayValueWithStyle:()Speaking isUSKeyboard:
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x1E0CF40C0];
  objc_msgSend(a1, "displayValueWithStyle:isUSKeyboard:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "axAttributedStringWithString:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "setAttribute:forKey:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0CF42E8]);
  return v3;
}

- (uint64_t)fkaSpeakableDisplayValue
{
  return objc_msgSend(a1, "accessibilitySpeakableDisplayValueWithStyle:", 1);
}

@end
