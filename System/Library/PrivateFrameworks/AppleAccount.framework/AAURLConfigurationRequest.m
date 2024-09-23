@implementation AAURLConfigurationRequest

+ (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (id)urlString
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;
  uint64_t v7;
  void *v8;

  v2 = (void *)CFPreferencesCopyAppValue(CFSTR("ConfigurationPlistURL"), CFSTR("com.apple.appleaccount"));
  v3 = v2;
  if (!v2 || objc_msgSend(v2, "isEqualToString:", &stru_1E41752F8))
  {
    v4 = (void *)CFPreferencesCopyAppValue(CFSTR("ConfigurationDomain"), CFSTR("com.apple.appleaccount"));
    v5 = v4;
    if (v4 && (objc_msgSend(v4, "isEqualToString:", &stru_1E41752F8) & 1) == 0)
      v6 = v5;
    else
      v6 = CFSTR("icloud.com");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("https://setup.%@/configurations/init"), v6);
    v7 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v7;
  }
  objc_msgSend(v3, "stringByAppendingString:", CFSTR("?context=settings"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)urlRequest
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AAURLConfigurationRequest;
  -[AARequest urlRequest](&v5, sel_urlRequest);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  objc_msgSend(v3, "aa_addMultiUserDeviceHeaderIfEnabled");
  return v3;
}

@end
