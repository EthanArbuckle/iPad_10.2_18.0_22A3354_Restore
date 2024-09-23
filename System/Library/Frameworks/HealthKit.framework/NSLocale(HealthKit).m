@implementation NSLocale(HealthKit)

+ (void)hk_setTestLocale:()HealthKit
{
  id v3;
  void *v4;

  v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&_LocaleLock);
  v4 = (void *)_TestLocale;
  _TestLocale = (uint64_t)v3;

  os_unfair_lock_unlock((os_unfair_lock_t)&_LocaleLock);
}

+ (id)hk_testableCurrentLocale
{
  id v2;
  id v3;
  void *v4;

  os_unfair_lock_lock((os_unfair_lock_t)&_LocaleLock);
  v2 = (id)_TestLocale;
  os_unfair_lock_unlock((os_unfair_lock_t)&_LocaleLock);
  if (v2)
  {
    v3 = v2;
  }
  else
  {
    objc_msgSend(a1, "currentLocale");
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  v4 = v3;

  return v4;
}

+ (id)hk_testableAutoupdatingCurrentLocale
{
  id v2;
  id v3;
  void *v4;

  os_unfair_lock_lock((os_unfair_lock_t)&_LocaleLock);
  v2 = (id)_TestLocale;
  os_unfair_lock_unlock((os_unfair_lock_t)&_LocaleLock);
  if (v2)
  {
    v3 = v2;
  }
  else
  {
    objc_msgSend(a1, "autoupdatingCurrentLocale");
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  v4 = v3;

  return v4;
}

+ (void)hk_setTestPreferredLanguages:()HealthKit
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&_LocaleLock);
  v4 = objc_msgSend(v3, "copy");

  v5 = (void *)_TestPreferredLanguages;
  _TestPreferredLanguages = v4;

  os_unfair_lock_unlock((os_unfair_lock_t)&_LocaleLock);
}

+ (id)hk_testablePreferredLanguages
{
  id v2;
  id v3;
  void *v4;

  os_unfair_lock_lock((os_unfair_lock_t)&_LocaleLock);
  v2 = (id)_TestPreferredLanguages;
  os_unfair_lock_unlock((os_unfair_lock_t)&_LocaleLock);
  if (v2)
  {
    v3 = v2;
  }
  else
  {
    objc_msgSend(a1, "preferredLanguages");
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  v4 = v3;

  return v4;
}

+ (uint64_t)hk_isUSLocale
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "hk_testableAutoupdatingCurrentLocale");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "hk_isUSLocale");

  return v2;
}

- (uint64_t)hk_isUSLocale
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "localeIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "containsString:", CFSTR("US"));

  return v2;
}

- (uint64_t)hk_isEquivalent:()HealthKit
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;

  v4 = a3;
  if (a1 == v4)
  {
    v14 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      objc_msgSend(a1, "languageCode");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "languageCode");
      v7 = objc_claimAutoreleasedReturnValue();
      if (v6 == (void *)v7)
      {

      }
      else
      {
        v8 = (void *)v7;
        objc_msgSend(v5, "languageCode");
        v9 = objc_claimAutoreleasedReturnValue();
        if (!v9)
          goto LABEL_14;
        v10 = (void *)v9;
        objc_msgSend(a1, "languageCode");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "languageCode");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v11, "isEqualToString:", v12);

        if (!v13)
          goto LABEL_15;
      }
      objc_msgSend(a1, "countryCode");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "countryCode");
      v15 = objc_claimAutoreleasedReturnValue();
      if (v6 == (void *)v15)
      {

LABEL_17:
        v14 = 1;
        goto LABEL_18;
      }
      v8 = (void *)v15;
      objc_msgSend(v5, "countryCode");
      v16 = objc_claimAutoreleasedReturnValue();
      if (v16)
      {
        v17 = (void *)v16;
        objc_msgSend(a1, "countryCode");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "countryCode");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v18, "isEqualToString:", v19);

        if ((v20 & 1) != 0)
          goto LABEL_17;
LABEL_15:
        v14 = 0;
LABEL_18:

        goto LABEL_19;
      }
LABEL_14:

      goto LABEL_15;
    }
    v14 = 0;
  }
LABEL_19:

  return v14;
}

- (BOOL)hk_isIn24HourTime
{
  void *v1;
  _BOOL8 v2;

  objc_msgSend(MEMORY[0x1E0CB3578], "dateFormatFromTemplate:options:locale:", CFSTR("j"), 0, a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "rangeOfString:", CFSTR("H")) != 0x7FFFFFFFFFFFFFFFLL
    || objc_msgSend(v1, "rangeOfString:", CFSTR("k")) != 0x7FFFFFFFFFFFFFFFLL;

  return v2;
}

@end
