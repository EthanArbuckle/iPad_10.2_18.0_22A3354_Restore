@implementation CNPostalAddress(iOSABCompatibilityDeprecated)

+ (id)localizedAddressFormatDictionaryForCountryCode:()iOSABCompatibilityDeprecated
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a3, "lowercaseString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D13B08], "addressFormats");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
