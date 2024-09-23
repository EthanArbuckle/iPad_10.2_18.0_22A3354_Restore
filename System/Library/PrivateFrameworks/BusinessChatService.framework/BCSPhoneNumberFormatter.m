@implementation BCSPhoneNumberFormatter

+ (id)formattedPhoneNumberForPhoneNumber:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;

  v4 = a3;
  objc_msgSend(a1, "_countryCode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = PNCreateFormattedStringWithCountry();
  v7 = (void *)v6;
  if (v6)
    v8 = (void *)v6;
  else
    v8 = v4;
  v9 = v8;

  objc_msgSend(MEMORY[0x24BDD14A8], "controlCharacterSet");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringByTrimmingCharactersInSet:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)_countryCode
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  TUNetworkCountryCode();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    TUHomeCountryCode();
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return v5;
}

@end
