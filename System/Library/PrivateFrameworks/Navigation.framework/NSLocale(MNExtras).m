@implementation NSLocale(MNExtras)

+ (id)_localeOverridesForLocaleWithCountryCode:()MNExtras
{
  id v3;
  void *v4;

  v3 = a3;
  if (v3)
  {
    if (qword_1ED0C3FC0 != -1)
      dispatch_once(&qword_1ED0C3FC0, &__block_literal_global_8);
    objc_msgSend((id)_MergedGlobals_32, "objectForKey:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)_navigation_objectForKey:()MNExtras
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C99DC8];
  objc_msgSend(a1, "countryCode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_localeOverridesForLocaleWithCountryCode:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = v8;
  }
  else
  {
    objc_msgSend(a1, "objectForKey:", v4);
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;

  return v10;
}

- (uint64_t)_navigation_distanceUsesMetricSystem
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "objectForKey:", *MEMORY[0x1E0C997F0]);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0C997F8]);

  return v2;
}

- (uint64_t)_navigation_useYardsForShortDistances
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "objectForKey:", *MEMORY[0x1E0C997F0]);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0C99800]);

  return v2;
}

@end
