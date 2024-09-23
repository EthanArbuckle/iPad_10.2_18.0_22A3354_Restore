@implementation HUStoreUtilities

+ (NSURL)accessoryStoreURL
{
  void *v2;
  uint64_t v3;
  void *v4;
  __CFString *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "countryCode");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  v5 = &stru_1E6F60E80;
  if (v3)
    v5 = (__CFString *)v3;
  v6 = v5;

  v7 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("https://apple.com/go/homekit/accessories/%@"), v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "URLWithString:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v9;
}

+ (NSString)accessoryStoreButtonTitle
{
  return (NSString *)_HULocalizedStringWithDefaultValue(CFSTR("HUAccessoryStoreButtonTitle"), CFSTR("HUAccessoryStoreButtonTitle"), 1);
}

@end
