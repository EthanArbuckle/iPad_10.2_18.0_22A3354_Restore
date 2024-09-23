@implementation NSUserDefaults(HKLocalCountrySetProvider)

+ (id)hk_localCountrySetOverrideUserDefaults
{
  void *v2;

  if (+[_HKBehavior isAppleInternalInstall](_HKBehavior, "isAppleInternalInstall"))
    v2 = (void *)objc_msgSend([a1 alloc], "initWithSuiteName:", CFSTR("com.apple.private.health.local-country-set-override"));
  else
    v2 = 0;
  return v2;
}

- (HKCountrySet)hk_countrySetForKey:()HKLocalCountrySetProvider
{
  void *v3;
  HKCountrySet *v4;

  objc_msgSend(a1, "hk_safeDictionaryIfExistsForKeyPath:error:", a3, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = -[HKCountrySet initWithDictionaryRepresentation:provenance:]([HKCountrySet alloc], "initWithDictionaryRepresentation:provenance:", v3, 100);
  else
    v4 = 0;

  return v4;
}

- (void)hk_setCountrySet:()HKLocalCountrySetProvider forKey:
{
  id v6;
  id v7;

  v6 = a4;
  objc_msgSend(a3, "dictionaryRepresentation");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setObject:forKey:", v7, v6);

}

@end
