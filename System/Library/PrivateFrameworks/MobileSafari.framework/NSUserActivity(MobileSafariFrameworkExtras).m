@implementation NSUserActivity(MobileSafariFrameworkExtras)

+ (id)_sf_windowCreationActivityFromSceneConnectionOptions:()MobileSafariFrameworkExtras
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  id v7;

  objc_msgSend(a3, "userActivities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "anyObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "activityType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.mobilesafari.UserActivity.create-window"));

  if (v6)
    v7 = v4;
  else
    v7 = 0;

  return v7;
}

+ (id)_sf_windowCreationActivityWithNavigationIntent:()MobileSafariFrameworkExtras
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB3898];
  v4 = a3;
  objc_msgSend(v3, "processInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "globallyUniqueString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  windowCreationNavigationIntentDictionary();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v4, v6);

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5920]), "initWithActivityType:", CFSTR("com.apple.mobilesafari.UserActivity.create-window"));
  objc_msgSend(v8, "setEligibleForHandoff:", 0);
  v11 = CFSTR("navigation-intent-id");
  v12[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setUserInfo:", v9);

  return v8;
}

+ (id)_sf_windowCreationActivityWithMode:()MobileSafariFrameworkExtras
{
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5920]), "initWithActivityType:", CFSTR("com.apple.mobilesafari.UserActivity.create-window"));
  objc_msgSend(v4, "setEligibleForHandoff:", 0);
  v8 = CFSTR("mode");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUserInfo:", v6);

  return v4;
}

+ (id)_sf_windowCreationActivityWithTabUUID:()MobileSafariFrameworkExtras tabGroupUUID:browserControllerUUID:
{
  objc_class *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;

  v7 = (objc_class *)MEMORY[0x1E0CA5920];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend([v7 alloc], "initWithActivityType:", CFSTR("com.apple.mobilesafari.UserActivity.create-window"));
  objc_msgSend(v11, "setEligibleForHandoff:", 0);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v10, CFSTR("tab-uuid"));

  objc_msgSend(v12, "setObject:forKeyedSubscript:", v9, CFSTR("tab-group-uuid"));
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v8, CFSTR("source-browser-controller-uuid"));

  objc_msgSend(v11, "setUserInfo:", v12);
  return v11;
}

+ (id)_sf_windowCreationActivityWithRecentlyClosedTabUUID:()MobileSafariFrameworkExtras browserControllerUUID:
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)MEMORY[0x1E0CA5920];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithActivityType:", CFSTR("com.apple.mobilesafari.UserActivity.create-window"));
  objc_msgSend(v5, "setEligibleForHandoff:", 0);
  v8 = CFSTR("recently-closed-tab-uuid");
  v9[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setUserInfo:", v6);
  return v5;
}

- (id)sf_windowCreationNavigationIntentID
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "userInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "safari_stringForKey:", CFSTR("navigation-intent-id"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)_sf_windowCreationNavigationIntent
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(a1, "sf_windowCreationNavigationIntentID");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1)
  {
    windowCreationNavigationIntentDictionary();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "objectForKeyedSubscript:", v1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)_sf_windowCreationTabUUID
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "userInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "safari_UUIDForKey:", CFSTR("tab-uuid"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)_sf_windowCreationTabGroupUUID
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "userInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "safari_UUIDForKey:", CFSTR("tab-group-uuid"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)_sf_windowCreationSourceBrowserControllerUUID
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "userInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "safari_UUIDForKey:", CFSTR("source-browser-controller-uuid"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)_sf_windowCreationRecentlyClosedTabUUID
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "userInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "safari_UUIDForKey:", CFSTR("recently-closed-tab-uuid"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)_sf_windowCreationMode
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "userInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "safari_numberForKey:", CFSTR("mode"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (void)_sf_invalidateWindowCreationData
{
  void *v1;
  id v2;

  objc_msgSend(a1, "sf_windowCreationNavigationIntentID");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    windowCreationNavigationIntentDictionary();
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "removeObjectForKey:", v2);

  }
}

@end
