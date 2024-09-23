@implementation MCAppEnforcedRestrictionUtilities

+ (id)enforcedRestrictionsForBundleID:(id)a3 restrictionPlistURL:(id)a4 countryCodes:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  const char *v22;
  NSObject *v23;
  uint32_t v24;
  uint64_t v25;
  void *v26;
  id v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[4];
  id v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_opt_new();
  if (!v9)
  {
    +[MCAppEnforcedRestrictionUtilities currentCountryCodes](MCAppEnforcedRestrictionUtilities, "currentCountryCodes");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfURL:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    v21 = _MCLogObjects;
    if (!os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
      goto LABEL_24;
    *(_DWORD *)buf = 138543362;
    v35 = v7;
    v22 = "Couldn't find restriction plist for app “%{public}@”";
    v23 = v21;
    v24 = 12;
LABEL_23:
    _os_log_impl(&dword_19ECC4000, v23, OS_LOG_TYPE_ERROR, v22, buf, v24);
    goto LABEL_24;
  }
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", CFSTR("MCWhitelistedLocales"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
LABEL_21:

    v25 = _MCLogObjects;
    if (!os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
      goto LABEL_24;
    *(_WORD *)buf = 0;
    v22 = "Restriction plist is malformatted";
    v23 = v25;
    v24 = 2;
    goto LABEL_23;
  }
  v28 = v9;
  v29 = v7;
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v14 = v13;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v31;
    while (2)
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v31 != v17)
          objc_enumerationMutation(v14);
        v19 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {

          v7 = v29;
          v9 = v28;
          goto LABEL_21;
        }
        objc_msgSend(v12, "addObject:", v19);
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
      if (v16)
        continue;
      break;
    }
  }

  v7 = v29;
  v9 = v28;
  if (objc_msgSend(v12, "count") && (objc_msgSend(v12, "intersectsSet:", v28) & 1) == 0)
  {
    +[MCAppEnforcedRestrictionUtilities appUnavailableInRegionRestrictionForBundleID:](MCAppEnforcedRestrictionUtilities, "appUnavailableInRegionRestrictionForBundleID:", v29);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addEntriesFromDictionary:", v20);

  }
LABEL_24:
  if (objc_msgSend(v10, "count"))
    v26 = (void *)objc_msgSend(v10, "copy");
  else
    v26 = 0;

  return v26;
}

+ (id)clientUUIDForBundleID:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), CFSTR("com.apple.profiled.appenforced"), a3);
}

+ (id)currentCountryCodes
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "countryCode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    objc_msgSend(v4, "addObject:", v3);
  }
  else
  {
    v6 = _MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19ECC4000, v6, OS_LOG_TYPE_ERROR, "Failed to retrieve a valid country code from NSLocale! Attempting fallback.", buf, 2u);
    }
    objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v30, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v21;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v21 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v11));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "countryCode");
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (v13)
            objc_msgSend(v5, "addObject:", v13);

          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v30, 16);
      }
      while (v9);
    }
    v14 = _MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543618;
      v25 = v5;
      v26 = 2114;
      v27 = v7;
      _os_log_impl(&dword_19ECC4000, v14, OS_LOG_TYPE_INFO, "Got country codes %{public}@ from languages %{public}@", buf, 0x16u);
    }

  }
  v15 = (void *)_MCLogObjects;
  if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEFAULT))
  {
    v16 = v15;
    objc_msgSend(v2, "localeIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v25 = v3;
    v26 = 2114;
    v27 = v17;
    v28 = 2114;
    v29 = v2;
    _os_log_impl(&dword_19ECC4000, v16, OS_LOG_TYPE_DEFAULT, "Reevaluating country code %{public}@ from locale identifier %{public}@ of currentLocale %{public}@", buf, 0x20u);

  }
  v18 = (void *)objc_msgSend(v5, "copy");

  return v18;
}

+ (id)appUnavailableInRegionRestrictionForBundleID:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C99E08];
  v4 = a3;
  objc_msgSend(v3, "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "MCSetUnionRestriction:values:", CFSTR("blockedAppBundleIDs"), v6);
  return v5;
}

@end
