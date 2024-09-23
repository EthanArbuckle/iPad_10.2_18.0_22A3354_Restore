@implementation SGFoundInAppsStrings

+ (id)resourceBundle
{
  return (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", *MEMORY[0x1E0D19D88]);
}

+ (id)localizedStringForKey:(id)a3 preferredLocalization:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  id v22;
  id v23;
  uint8_t buf[4];
  id v25;
  __int16 v26;
  NSObject *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(a1, "resourceBundle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v7)
  {
    v10 = (void *)MEMORY[0x1E0CB34D0];
    objc_msgSend(v8, "localizations");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "preferredLocalizationsFromArray:forPreferences:", v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v13, "count"))
    {

      v20 = 0;
      goto LABEL_19;
    }
    objc_msgSend(v13, "firstObject");
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v9, "pathForResource:ofType:inDirectory:forLocalization:", *MEMORY[0x1E0D19DF0], *MEMORY[0x1E0D19DE8], CFSTR("."), v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v23 = 0;
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfFile:options:error:", v14, 2, &v23);
    v16 = v23;
    if (v15)
    {
      v22 = 0;
      objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v15, 0, 0, &v22);
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = v22;

      if (!v17)
      {
        sgLogHandle();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v25 = v14;
          v26 = 2112;
          v27 = v18;
          _os_log_impl(&dword_1C3607000, v19, OS_LOG_TYPE_DEFAULT, "Could not parse localized strings from %@: %@", buf, 0x16u);
        }

      }
      -[NSObject objectForKeyedSubscript:](v17, "objectForKeyedSubscript:", v6);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      sgLogHandle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v25 = v14;
        v26 = 2112;
        v27 = v16;
        _os_log_impl(&dword_1C3607000, v17, OS_LOG_TYPE_DEFAULT, "Could not load localized strings from %@: %@", buf, 0x16u);
      }
      v20 = 0;
      v18 = v16;
    }

  }
  else
  {
    sgLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v25 = v7;
      _os_log_impl(&dword_1C3607000, v18, OS_LOG_TYPE_DEFAULT, "Could not get localized string path for localization '%@", buf, 0xCu);
    }
    v20 = 0;
  }

LABEL_19:
  return v20;
}

+ (id)foundInAppsStringLongVersionForAppName:(id)a3 contactName:(id)a4
{
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __75__SGFoundInAppsStrings_foundInAppsStringLongVersionForAppName_contactName___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  v5 = foundInAppsStringLongVersionForAppName_contactName___pasOnceToken5;
  v6 = a4;
  v13 = a3;
  if (v5 != -1)
    dispatch_once(&foundInAppsStringLongVersionForAppName_contactName___pasOnceToken5, block);
  _PASValidatedFormat_31494((void *)foundInAppsStringLongVersionForAppName_contactName___pasExprOnceResult, CFSTR("%@%@"), v7, v8, v9, v10, v11, v12, (uint64_t)v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)foundInAppsStringCompactVersionWithContactName:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__SGFoundInAppsStrings_foundInAppsStringCompactVersionWithContactName___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  v3 = foundInAppsStringCompactVersionWithContactName___pasOnceToken6;
  v10 = a3;
  if (v3 != -1)
    dispatch_once(&foundInAppsStringCompactVersionWithContactName___pasOnceToken6, block);
  _PASValidatedFormat_31494((void *)foundInAppsStringCompactVersionWithContactName___pasExprOnceResult, CFSTR("%@"), v4, v5, v6, v7, v8, v9, (uint64_t)v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)foundInAppsStringWithoutContactForAppName:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__SGFoundInAppsStrings_foundInAppsStringWithoutContactForAppName___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  v3 = foundInAppsStringWithoutContactForAppName___pasOnceToken7;
  v10 = a3;
  if (v3 != -1)
    dispatch_once(&foundInAppsStringWithoutContactForAppName___pasOnceToken7, block);
  _PASValidatedFormat_31494((void *)foundInAppsStringWithoutContactForAppName___pasExprOnceResult, CFSTR("%@"), v4, v5, v6, v7, v8, v9, (uint64_t)v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)foundInAppsStringForCheckInAction:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__SGFoundInAppsStrings_foundInAppsStringForCheckInAction___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  v3 = foundInAppsStringForCheckInAction___pasOnceToken8;
  v10 = a3;
  if (v3 != -1)
    dispatch_once(&foundInAppsStringForCheckInAction___pasOnceToken8, block);
  _PASValidatedFormat_31494((void *)foundInAppsStringForCheckInAction___pasExprOnceResult, CFSTR("%@"), v4, v5, v6, v7, v8, v9, (uint64_t)v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

void __58__SGFoundInAppsStrings_foundInAppsStringForCheckInAction___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1C3BD4F6C]();
  objc_msgSend(*(id *)(a1 + 32), "localizedStringForKey:preferredLocalization:", CFSTR("Checkin Action %@"), 0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "resourceBundle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Checkin Action %@"), &stru_1E7DB83A8, *MEMORY[0x1E0D19DF0]);
    v3 = objc_claimAutoreleasedReturnValue();

  }
  v5 = (void *)foundInAppsStringForCheckInAction___pasExprOnceResult;
  foundInAppsStringForCheckInAction___pasExprOnceResult = v3;

  objc_autoreleasePoolPop(v2);
}

void __66__SGFoundInAppsStrings_foundInAppsStringWithoutContactForAppName___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1C3BD4F6C]();
  objc_msgSend(*(id *)(a1 + 32), "localizedStringForKey:preferredLocalization:", CFSTR("Found in %@"), 0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "resourceBundle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Found in %@"), &stru_1E7DB83A8, *MEMORY[0x1E0D19DF0]);
    v3 = objc_claimAutoreleasedReturnValue();

  }
  v5 = (void *)foundInAppsStringWithoutContactForAppName___pasExprOnceResult;
  foundInAppsStringWithoutContactForAppName___pasExprOnceResult = v3;

  objc_autoreleasePoolPop(v2);
}

void __71__SGFoundInAppsStrings_foundInAppsStringCompactVersionWithContactName___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1C3BD4F6C]();
  objc_msgSend(*(id *)(a1 + 32), "localizedStringForKey:preferredLocalization:", CFSTR("Chatting with %@"), 0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "resourceBundle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Chatting with %@"), &stru_1E7DB83A8, *MEMORY[0x1E0D19DF0]);
    v3 = objc_claimAutoreleasedReturnValue();

  }
  v5 = (void *)foundInAppsStringCompactVersionWithContactName___pasExprOnceResult;
  foundInAppsStringCompactVersionWithContactName___pasExprOnceResult = v3;

  objc_autoreleasePoolPop(v2);
}

void __75__SGFoundInAppsStrings_foundInAppsStringLongVersionForAppName_contactName___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1C3BD4F6C]();
  objc_msgSend(*(id *)(a1 + 32), "localizedStringForKey:preferredLocalization:", CFSTR("Found in %@ with %@"), 0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "resourceBundle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Found in %@ with %@"), &stru_1E7DB83A8, *MEMORY[0x1E0D19DF0]);
    v3 = objc_claimAutoreleasedReturnValue();

  }
  v5 = (void *)foundInAppsStringLongVersionForAppName_contactName___pasExprOnceResult;
  foundInAppsStringLongVersionForAppName_contactName___pasExprOnceResult = v3;

  objc_autoreleasePoolPop(v2);
}

@end
