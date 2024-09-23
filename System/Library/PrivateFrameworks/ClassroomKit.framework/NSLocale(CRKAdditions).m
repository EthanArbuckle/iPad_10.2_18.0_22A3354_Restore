@implementation NSLocale(CRKAdditions)

+ (uint64_t)crk_showPhoneticNames
{
  void *v0;
  void *v1;
  uint64_t v2;

  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "languageCode");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("ja"));
  return v2;
}

@end
