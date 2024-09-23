@implementation NSTimeZone(EventKitUI)

- (id)cityName
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__NSTimeZone_EventKitUI__cityName__block_invoke;
  block[3] = &unk_1E6018688;
  block[4] = a1;
  if (cityName_onceToken != -1)
    dispatch_once(&cityName_onceToken, block);
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "persistentDomainForName:", CFSTR("com.apple.mobilecal.timezones"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(a1, "name");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v6 = v3;
      goto LABEL_19;
    }
  }
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "persistentDomainForName:", CFSTR("com.apple.mobilecal"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    goto LABEL_14;
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0D0C4D0]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    || (v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CFA970]), "initWithProperties:", v8)) == 0)
  {

LABEL_14:
    objc_msgSend(MEMORY[0x1E0CFA978], "sharedManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "defaultCityForTimeZone:", a1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "localizedName:locale:", 4, v16);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v5)
      {
        objc_msgSend(a1, "name");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }
    goto LABEL_19;
  }
  v10 = v9;
  objc_msgSend(v9, "timeZone");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11
    && (objc_msgSend(a1, "name"),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v13 = objc_msgSend(v12, "isEqualToString:", v11),
        v12,
        v13))
  {
    objc_msgSend(v10, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  if (!v5)
    goto LABEL_14;
LABEL_19:

  return v5;
}

- (void)setCityName:()EventKitUI
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  objc_msgSend(a1, "cityName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v12, "isEqualToString:", v4);

  if ((v5 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "persistentDomainForName:", CFSTR("com.apple.mobilecal.timezones"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "mutableCopy");

    if (!v8)
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 1);
    objc_msgSend(a1, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", v12, v9);

    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setPersistentDomain:forName:", v8, CFSTR("com.apple.mobilecal.timezones"));

    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "synchronize");

  }
}

- (void)_cleanupDisallowedTimezonesIfNeeded
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  id v4;

  if (objc_msgSend(MEMORY[0x1E0CFA978], "willApplyTimeZoneChanges1"))
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "persistentDomainForName:", CFSTR("com.apple.mobilecal.timezones"));
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (id)objc_msgSend(v1, "mutableCopy");

    if (v4)
    {
      objc_msgSend(v4, "removeObjectsForKeys:", &unk_1E606F8A8);
      objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "setPersistentDomain:forName:", v4, CFSTR("com.apple.mobilecal.timezones"));

      objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "synchronize");

    }
  }
}

@end
