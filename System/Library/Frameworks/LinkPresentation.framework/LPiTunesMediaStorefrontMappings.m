@implementation LPiTunesMediaStorefrontMappings

+ (id)storefrontIdentifierFromCountryCode:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  countryCodeToStorefrontMapping();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uppercaseString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (BOOL)isValidStorefrontCountryCode:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;

  v3 = a3;
  countryCodeToStorefrontMapping();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uppercaseString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6 != 0;

  return v7;
}

+ (id)defaultStorefrontCountryCode
{
  return CFSTR("US");
}

@end
