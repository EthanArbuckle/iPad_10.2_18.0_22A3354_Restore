@implementation CNAddressFormats

+ (id)addressFormats
{
  return (id)objc_msgSend(MEMORY[0x1E0D13B08], "addressFormats");
}

+ (id)addressFormatForCountryCode:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "addressFormats");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)supportedCountries
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__CNAddressFormats_supportedCountries__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (supportedCountries_cn_once_token_0 != -1)
    dispatch_once(&supportedCountries_cn_once_token_0, block);
  return (id)supportedCountries_cn_once_object_0;
}

void __38__CNAddressFormats_supportedCountries__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "makeSupportedCountries");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v3, "copy");
  v2 = (void *)supportedCountries_cn_once_object_0;
  supportedCountries_cn_once_object_0 = v1;

}

+ (id)makeSupportedCountries
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a1, "addressFormats");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "removeObject:", CFSTR("defaultKbdSettings"));
  objc_msgSend(v4, "removeObject:", CFSTR("yu"));
  objc_msgSend(v4, "_cn_map:", &__block_literal_global_140);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sortedArrayUsingComparator:", CNCountryInformationISOCountryCodeAscendingComparator);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)defaultKeyboardSettingsDictionary
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "addressFormats");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("defaultKbdSettings"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)countryCodeByLocaleLookup
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localeIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v3, "componentsSeparatedByString:", CFSTR("_"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v4, "count") < 2)
    {
      v6 = 0;
    }
    else
    {
      objc_msgSend(v4, "objectAtIndex:", 1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "lowercaseString");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)countryCodeByGlobalDefaultsLookup
{
  void *v2;
  void *v3;

  v2 = (void *)CFPreferencesCopyValue(CFSTR("Country"), (CFStringRef)*MEMORY[0x1E0C9B228], (CFStringRef)*MEMORY[0x1E0C9B240], (CFStringRef)*MEMORY[0x1E0C9B250]);
  objc_msgSend(v2, "lowercaseString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)fallbackCountryCode
{
  return CFSTR("us");
}

+ (id)usaStateNames
{
  if (usaStateNames_onceToken != -1)
    dispatch_once(&usaStateNames_onceToken, &__block_literal_global_14_5);
  return (id)usaStateNames_sStateNames;
}

void __33__CNAddressFormats_usaStateNames__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", CFSTR("Alabama"), CFSTR("Alaska"), CFSTR("Arizona"), CFSTR("Arkansas"), CFSTR("California"), CFSTR("Colorado"), CFSTR("Connecticut"), CFSTR("Delaware"), CFSTR("District of Columbia"), CFSTR("Florida"), CFSTR("Georgia"), CFSTR("Hawaii"), CFSTR("Idaho"), CFSTR("Illinois"), CFSTR("Indiana"), CFSTR("Iowa"), CFSTR("Kansas"),
         CFSTR("Kentucky"),
         CFSTR("Louisiana"),
         CFSTR("Maine"),
         CFSTR("Maryland"),
         CFSTR("Massachusetts"),
         CFSTR("Michigan"),
         CFSTR("Minnesota"),
         CFSTR("Mississippi"),
         CFSTR("Missouri"),
         CFSTR("Montana"),
         CFSTR("Nebraska"),
         CFSTR("Nevada"),
         CFSTR("New Hampshire"),
         CFSTR("New Jersey"),
         CFSTR("New Mexico"),
         CFSTR("New York"),
         CFSTR("North Carolina"),
         CFSTR("North Dakota"),
         CFSTR("Ohio"),
         CFSTR("Oklahoma"),
         CFSTR("Oregon"),
         CFSTR("Pennsylvania"),
         CFSTR("Rhode Island"),
         CFSTR("South Carolina"),
         CFSTR("South Dakota"),
         CFSTR("Tennessee"),
         CFSTR("Texas"),
         CFSTR("Utah"),
         CFSTR("Vermont"),
         CFSTR("Virginia"),
         CFSTR("Washington"),
         CFSTR("West Virginia"),
         CFSTR("Wisconsin"),
         CFSTR("Wyoming"),
         0);
  v1 = (void *)usaStateNames_sStateNames;
  usaStateNames_sStateNames = v0;

}

+ (id)usaStateAbbreviations
{
  if (usaStateAbbreviations_onceToken != -1)
    dispatch_once(&usaStateAbbreviations_onceToken, &__block_literal_global_118);
  return (id)usaStateAbbreviations_sStateAbbreviations;
}

void __41__CNAddressFormats_usaStateAbbreviations__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", CFSTR("AL"), CFSTR("AK"), CFSTR("AZ"), CFSTR("AR"), CFSTR("CA"), CFSTR("CO"), CFSTR("CT"), CFSTR("DE"), CFSTR("DC"), CFSTR("FL"), CFSTR("GA"), CFSTR("HI"), CFSTR("ID"), CFSTR("IL"), CFSTR("IN"), CFSTR("IA"), CFSTR("KS"),
         CFSTR("KY"),
         CFSTR("LA"),
         CFSTR("ME"),
         CFSTR("MD"),
         CFSTR("MA"),
         CFSTR("MI"),
         CFSTR("MN"),
         CFSTR("MS"),
         CFSTR("MO"),
         CFSTR("MT"),
         CFSTR("NE"),
         CFSTR("NV"),
         CFSTR("NH"),
         CFSTR("NJ"),
         CFSTR("NM"),
         CFSTR("NY"),
         CFSTR("NC"),
         CFSTR("ND"),
         CFSTR("OH"),
         CFSTR("OK"),
         CFSTR("OR"),
         CFSTR("PA"),
         CFSTR("RI"),
         CFSTR("SC"),
         CFSTR("SD"),
         CFSTR("TN"),
         CFSTR("TX"),
         CFSTR("UT"),
         CFSTR("VT"),
         CFSTR("VI"),
         CFSTR("WA"),
         CFSTR("WV"),
         CFSTR("WI"),
         CFSTR("WY"),
         0);
  v1 = (void *)usaStateAbbreviations_sStateAbbreviations;
  usaStateAbbreviations_sStateAbbreviations = v0;

}

@end
