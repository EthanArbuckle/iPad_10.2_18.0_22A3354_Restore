@implementation ATXApplicationRecord

+ (BOOL)isAppClipForBundleId:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  uint64_t v9;

  v4 = a3;
  v5 = (void *)MEMORY[0x1A85A4F90]();
  v9 = 0;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5870]), "initWithBundleIdentifier:allowPlaceholder:error:", v4, 1, &v9);
  if (v9)
    v7 = 0;
  else
    v7 = objc_msgSend(a1, "isAppClipGivenAppRecord:", v6);

  objc_autoreleasePoolPop(v5);
  return v7;
}

+ (BOOL)isAppClipGivenAppRecord:(id)a3
{
  void *v3;
  BOOL v4;

  objc_msgSend(a3, "appClipMetadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

+ (BOOL)isInstalledAndNotRestrictedForBundle:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  int v12;
  int v13;
  NSObject *v14;
  uint64_t v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  int v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1A85A4F90]();
  if (objc_msgSend(a1, "isAppClipWebClipBundleId:", v4))
  {
    v6 = objc_msgSend(a1, "isWebClipInstalledWithBundleId:", v4);
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.Health"))
         && objc_msgSend(MEMORY[0x1E0D81588], "isiPad")
         && (objc_msgSend(MEMORY[0x1E0CB3898], "processInfo"), (v7 = (void *)objc_claimAutoreleasedReturnValue()) != 0)
         && (v8 = v7, objc_msgSend(v7, "operatingSystemVersion"), v8, v16 == 16))
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(a1, "recordForBundleId:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "applicationState");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isInstalled");
    v12 = objc_msgSend(v10, "isRestricted");
    v6 = v11 & (v12 ^ 1);
    if ((v6 & 1) == 0)
    {
      v13 = v12;
      __atxlog_handle_default();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        v18 = v4;
        v19 = 1024;
        v20 = v11;
        v21 = 1024;
        v22 = v13;
        _os_log_impl(&dword_1A49EF000, v14, OS_LOG_TYPE_DEFAULT, "ATXApplicationRecord for app: %@ installed: %{BOOL}d restricted: %{BOOL}d", buf, 0x18u);
      }

    }
  }
  objc_autoreleasePoolPop(v5);

  return v6;
}

+ (BOOL)isOffloadedForBundle:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  v5 = (void *)MEMORY[0x1A85A4F90]();
  objc_msgSend(a1, "recordForBundleId:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applicationState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isDowngraded"))
    v8 = objc_msgSend(v7, "isPlaceholder");
  else
    v8 = 0;

  objc_autoreleasePoolPop(v5);
  return v8;
}

+ (id)recordForBundleId:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  id v9;

  v3 = a3;
  v4 = (void *)MEMORY[0x1A85A4F90]();
  v9 = 0;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5870]), "initWithBundleIdentifier:allowPlaceholder:error:", v3, 1, &v9);
  v6 = v9;
  if (v6)
  {
    __atxlog_handle_default();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      +[ATXApplicationRecord recordForBundleId:].cold.2();
  }
  else
  {
    if (v5)
      goto LABEL_6;
    __atxlog_handle_default();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      +[ATXApplicationRecord recordForBundleId:].cold.1((uint64_t)v3, v7);
  }

LABEL_6:
  objc_autoreleasePoolPop(v4);

  return v5;
}

+ (BOOL)isAppClipWebClipBundleId:(id)a3
{
  return objc_msgSend(a3, "hasPrefix:", *MEMORY[0x1E0D10790]);
}

+ (id)companionBundleIdForBundleId:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;

  v4 = a3;
  v5 = (void *)MEMORY[0x1A85A4F90]();
  objc_msgSend(a1, "recordForBundleId:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "counterpartIdentifiers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (id)objc_msgSend(v8, "count");

    if (v9)
    {
      objc_msgSend(v7, "counterpartIdentifiers");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "firstObject");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v9 = v11;
      }
      else
      {
        __atxlog_handle_default();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
          +[ATXApplicationRecord companionBundleIdForBundleId:].cold.1();

        v9 = 0;
      }

    }
  }
  else
  {
    v9 = 0;
  }

  objc_autoreleasePoolPop(v5);
  return v9;
}

+ (BOOL)isHiddenFromSpringBoardWithBundleId:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  v5 = (void *)MEMORY[0x1A85A4F90]();
  objc_msgSend(a1, "recordForBundleId:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "appTags");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "containsObject:", CFSTR("hidden"));

  }
  else
  {
    v9 = 0;
  }

  objc_autoreleasePoolPop(v5);
  return v9;
}

+ (BOOL)isWebClipInstalledWithBundleId:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;

  v3 = a3;
  v4 = (void *)MEMORY[0x1A85A4F90]();
  objc_msgSend(v3, "stringByReplacingOccurrencesOfString:withString:", *MEMORY[0x1E0D10790], &stru_1E4D5DB30);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D10840], "sharedStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "synchronouslyGetAppClipWithIdentifier:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 && objc_msgSend(v7, "isApplicationInstalled"))
  {
    objc_msgSend(v7, "title");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8 != 0;

  }
  else
  {
    v9 = 0;
  }

  objc_autoreleasePoolPop(v4);
  return v9;
}

+ (BOOL)isInstalledOrIsPlaceholderForBundle:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  v5 = (void *)MEMORY[0x1A85A4F90]();
  objc_msgSend(a1, "recordForBundleId:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applicationState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "isInstalled") & 1) != 0)
    v8 = 1;
  else
    v8 = objc_msgSend(v7, "isPlaceholder");

  objc_autoreleasePoolPop(v5);
  return v8;
}

+ (BOOL)isInstallingForBundle:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  v5 = (void *)MEMORY[0x1A85A4F90]();
  objc_msgSend(a1, "recordForBundleId:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applicationState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "isDowngraded") & 1) != 0)
    v8 = 0;
  else
    v8 = objc_msgSend(v7, "isPlaceholder");

  objc_autoreleasePoolPop(v5);
  return v8;
}

+ (BOOL)isInstalledForBundle:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  v5 = (void *)MEMORY[0x1A85A4F90]();
  objc_msgSend(a1, "recordForBundleId:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applicationState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isInstalled");

  objc_autoreleasePoolPop(v5);
  return v8;
}

+ (id)localizedShortnameForBundle:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = (void *)MEMORY[0x1A85A4F90]();
  objc_msgSend(a1, "recordForBundleId:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedShortName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v5);
  return v7;
}

+ (id)localizedNameForBundle:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = (void *)MEMORY[0x1A85A4F90]();
  objc_msgSend(a1, "recordForBundleId:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v5);
  return v7;
}

+ (BOOL)isLaunchProhibitedForBundle:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  v5 = (void *)MEMORY[0x1A85A4F90]();
  objc_msgSend(a1, "recordForBundleId:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isLaunchProhibited");

  objc_autoreleasePoolPop(v5);
  return v7;
}

+ (BOOL)isArcadeAppForBundle:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  v5 = (void *)MEMORY[0x1A85A4F90]();
  objc_msgSend(a1, "recordForBundleId:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isArcadeApp");

  objc_autoreleasePoolPop(v5);
  return v7;
}

+ (BOOL)isBackgroundAudioSupportedForBundle:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  v5 = (void *)MEMORY[0x1A85A4F90]();
  objc_msgSend(a1, "recordForBundleId:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UIBackgroundModes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "containsObject:", CFSTR("audio"));

  objc_autoreleasePoolPop(v5);
  return v8;
}

+ (BOOL)isEnterpriseAppForBundle:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  v5 = (void *)MEMORY[0x1A85A4F90]();
  objc_msgSend(a1, "recordForBundleId:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isProfileValidated");

  objc_autoreleasePoolPop(v5);
  return v7;
}

+ (BOOL)isUPPValidatedForBundle:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  v5 = (void *)MEMORY[0x1A85A4F90]();
  objc_msgSend(a1, "recordForBundleId:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isUPPValidated");

  objc_autoreleasePoolPop(v5);
  return v7;
}

+ (BOOL)isBetaAppForBundle:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  v5 = (void *)MEMORY[0x1A85A4F90]();
  objc_msgSend(a1, "recordForBundleId:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isBeta");

  objc_autoreleasePoolPop(v5);
  return v7;
}

+ (id)genreForBundle:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = (void *)MEMORY[0x1A85A4F90]();
  objc_msgSend(a1, "recordForBundleId:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "iTunesMetadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "genre");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v5);
  return v8;
}

+ (unint64_t)genreIdForBundle:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;

  v4 = a3;
  v5 = (void *)MEMORY[0x1A85A4F90]();
  objc_msgSend(a1, "recordForBundleId:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "iTunesMetadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "genreIdentifier");

  objc_autoreleasePoolPop(v5);
  return v8;
}

+ (id)registrationDateForBundle:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = (void *)MEMORY[0x1A85A4F90]();
  objc_msgSend(a1, "recordForBundleId:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "registrationDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v5);
  return v7;
}

+ (BOOL)isRestoreInstallTypeForBundle:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;

  v4 = a3;
  v5 = (void *)MEMORY[0x1A85A4F90]();
  objc_msgSend(a1, "recordForBundleId:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "installType") == 2;

  objc_autoreleasePoolPop(v5);
  return v7;
}

+ (void)getDeviceManagementPolicyForBundle:(id)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  v7 = (void *)MEMORY[0x1A85A4F90]();
  objc_msgSend(a1, "recordForBundleId:", v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "getDeviceManagementPolicyWithCompletionHandler:", v6);

  objc_autoreleasePoolPop(v7);
}

+ (id)appInfoForBundle:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = (void *)MEMORY[0x1A85A4F90]();
  objc_msgSend(a1, "recordForBundleId:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CBD730], "appInfoWithApplicationRecord:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  objc_autoreleasePoolPop(v5);
  return v7;
}

+ (id)schemaWithoutFallbackForBundle:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = (void *)MEMORY[0x1A85A4F90]();
  objc_msgSend(a1, "recordForBundleId:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CBDB38], "schemaWithBundleRecord:fallbackToSystemSchema:", v6, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  objc_autoreleasePoolPop(v5);
  return v7;
}

+ (id)recordForAdamId:(unint64_t)a3
{
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  id v9;

  v4 = (void *)MEMORY[0x1A85A4F90](a1, a2);
  v9 = 0;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5870]), "initWithStoreItemIdentifier:error:", a3, &v9);
  v6 = v9;
  if (v6)
  {
    __atxlog_handle_default();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      +[ATXApplicationRecord recordForAdamId:].cold.1(a3, (uint64_t)v6, v7);

  }
  objc_autoreleasePoolPop(v4);
  return v5;
}

+ (id)bundleIdForAdamIdIfInstalled:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = (void *)MEMORY[0x1A85A4F90](a1, a2);
  objc_msgSend(a1, "recordForAdamId:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applicationState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isInstalled") && (objc_msgSend(v7, "isRestricted") & 1) == 0)
  {
    objc_msgSend(v6, "bundleIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  objc_autoreleasePoolPop(v5);
  return v8;
}

+ (id)parentAppBundleIdForClipBundleID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  id v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1A85A4F90]();
  v19 = 0;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5870]), "initWithBundleIdentifier:allowPlaceholder:error:", v4, 1, &v19);
  v7 = v19;
  if (v7)
  {
    __atxlog_handle_hero();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v21 = v7;
      _os_log_impl(&dword_1A49EF000, v8, OS_LOG_TYPE_INFO, "Could not get LSApplicationRecord inside parentAppBundleIdForClipBundleID. Error: %@", buf, 0xCu);
    }
    v9 = 0;
  }
  else
  {
    if (!v6)
    {
      v9 = 0;
      v10 = 0;
      goto LABEL_7;
    }
    objc_msgSend(v6, "entitlements");
    v8 = objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(a1, "isAppClipGivenAppRecord:", v6);
    v13 = objc_opt_class();
    -[NSObject objectForKey:ofClass:valuesOfClass:](v8, "objectForKey:ofClass:valuesOfClass:", CFSTR("com.apple.developer.parent-application-identifiers"), v13, objc_opt_class());
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v14;
    if (v12)
    {
      if (objc_msgSend(v14, "count"))
      {
        objc_msgSend(v9, "firstObject");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "rangeOfString:", CFSTR("."));

        if (v16 != 0x7FFFFFFFFFFFFFFFLL)
        {
          objc_msgSend(v9, "firstObject");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "substringFromIndex:", v16 + 1);
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          __atxlog_handle_hero();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v21 = v4;
            v22 = 2112;
            v23 = v9;
            _os_log_impl(&dword_1A49EF000, v18, OS_LOG_TYPE_DEFAULT, "CLIP app %@ parentAppIDs: %@", buf, 0x16u);
          }

          goto LABEL_6;
        }
      }
    }
  }
  v10 = 0;
LABEL_6:

LABEL_7:
  objc_autoreleasePoolPop(v5);

  return v10;
}

+ (BOOL)isSwiftPlaygroundsBundle:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a1, "recordForBundleId:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isSwiftPlaygroundsApp");

  return v4;
}

+ (BOOL)isSystemAppForBundleId:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = a3;
  v5 = (void *)MEMORY[0x1A85A4F90]();
  objc_msgSend(a1, "recordForBundleId:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "compatibilityObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "applicationType");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("System"));

  }
  else
  {
    v10 = 0;
  }

  objc_autoreleasePoolPop(v5);
  return v10;
}

+ (BOOL)isInternalAppForBundleId:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = a3;
  v5 = (void *)MEMORY[0x1A85A4F90]();
  objc_msgSend(a1, "recordForBundleId:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "compatibilityObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "applicationType");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("Internal"));

  }
  else
  {
    v10 = 0;
  }

  objc_autoreleasePoolPop(v5);
  return v10;
}

+ (BOOL)isInternalOrSystemAppForBundleId:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  if ((objc_msgSend(a1, "isInternalAppForBundleId:", v4) & 1) != 0)
    v5 = 1;
  else
    v5 = objc_msgSend(a1, "isSystemAppForBundleId:", v4);

  return v5;
}

+ (BOOL)isDeviceManagementPolicyOkForBundleId:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;

  v4 = a3;
  v5 = (void *)MEMORY[0x1A85A4F90]();
  objc_msgSend(a1, "recordForBundleId:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "compatibilityObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "deviceManagementPolicy") == 0;

  }
  else
  {
    v9 = 1;
  }

  objc_autoreleasePoolPop(v5);
  return v9;
}

+ (void)recordForBundleId:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1A49EF000, a2, OS_LOG_TYPE_ERROR, "Fetched nil record for bundle %@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_2();
}

+ (void)recordForBundleId:.cold.2()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1A49EF000, v0, (uint64_t)v0, "Couldn't fetch record for bundle %@, error: %@", v1);
  OUTLINED_FUNCTION_2();
}

+ (void)companionBundleIdForBundleId:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_0_0();
  _os_log_fault_impl(&dword_1A49EF000, v0, OS_LOG_TYPE_FAULT, "first counterpart identifier (%@) was not a string for bundle id: %@", v1, 0x16u);
  OUTLINED_FUNCTION_2();
}

+ (void)recordForAdamId:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = v5;
  v9 = 2112;
  v10 = a2;
  OUTLINED_FUNCTION_1(&dword_1A49EF000, a3, v6, "Couldn't fetch record for adam id %@, error: %@", (uint8_t *)&v7);

}

@end
