@implementation FCGeoUtilities

+ (BOOL)isRunningInSupportedRegion
{
  void *v2;
  char v3;
  int v4;
  void *v5;
  void *v6;

  NewsCoreUserDefaults();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("simulate_unsupported_region"));

  if ((v3 & 1) != 0)
  {
    LOBYTE(v4) = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D27008], "sharedConfiguration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "countryCode");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = objc_msgSend(v6, "isEqualToString:", CFSTR("CN")) ^ 1;
  }
  return v4;
}

+ (id)currentRegion
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0D27008], "sharedConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "countryCode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
