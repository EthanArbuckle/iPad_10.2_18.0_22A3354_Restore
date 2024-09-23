@implementation HKCurrentLocaleCountryCodeProvider

- (id)currentCountryCode
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99DC8], "hk_testableCurrentLocale");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "countryCode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
