@implementation NSLocale(InternationalSupportExtensions)

+ (id)_globalPreferredLanguages
{
  void *v0;
  void *v1;
  void *v2;
  CFPropertyListRef v3;
  uint64_t v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "persistentDomainForName:", *MEMORY[0x1E0CB2B58]);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("AppleLanguages"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2 || !objc_msgSend(v2, "count"))
  {
    v3 = CFPreferencesCopyValue(CFSTR("AppleLanguages"), (CFStringRef)*MEMORY[0x1E0C9B228], (CFStringRef)*MEMORY[0x1E0C9B240], (CFStringRef)*MEMORY[0x1E0C9B250]);

    v2 = (void *)v3;
  }
  if (!objc_msgSend(v2, "count"))
  {
    v6[0] = CFSTR("en-US");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
    v4 = objc_claimAutoreleasedReturnValue();

    v2 = (void *)v4;
  }
  return v2;
}

- (__CFString)numberingSystem
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  __CFString *v8;
  uint64_t v9;

  v1 = (void *)MEMORY[0x1E0C99DC8];
  objc_msgSend(a1, "localeIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "componentsFromLocaleIdentifier:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numbers"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "length") && (objc_msgSend(v5, "isEqualToString:", CFSTR("default")) & 1) == 0)
  {
    v8 = v5;
  }
  else
  {
    objc_msgSend(v4, "setObject:forKeyedSubscript:", CFSTR("default"), CFSTR("numbers"));
    objc_msgSend(MEMORY[0x1E0C99DC8], "localeIdentifierFromComponents:", v4);
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v6, "UTF8String");
    v7 = unumsys_open();
    v8 = CFSTR("latn");
    if (v7)
    {
      v9 = MEMORY[0x1DF0A3744](v7);
      if (v9)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v9);
        v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      unumsys_close();
    }

  }
  return v8;
}

+ (id)matchedLanguagesFromAvailableLanguages:()InternationalSupportExtensions forPreferredLanguages:
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  unint64_t v20;
  void *v21;
  void *v22;
  BOOL v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  void *v29;
  void *v30;
  void *v31;
  id obj;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint64_t v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v5;
  objc_msgSend(&unk_1EA16AA98, "arrayByAddingObjectsFromArray:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  obj = v6;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
  if (v8)
  {
    v9 = v8;
    v33 = *(_QWORD *)v35;
    v10 = *MEMORY[0x1E0C997E8];
    v11 = 0x1E0C99000uLL;
    v30 = v7;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v35 != v33)
          objc_enumerationMutation(obj);
        v13 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i);
        v14 = (void *)MEMORY[0x1E0CB34D0];
        v38 = v13;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v38, 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "preferredLocalizationsFromArray:forPreferences:", v7, v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "firstObject");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (v17)
        {
          objc_msgSend(*(id *)(v11 + 3528), "componentsFromLocaleIdentifier:", v13);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "objectForKeyedSubscript:", v10);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          v20 = v11;
          objc_msgSend(*(id *)(v11 + 3528), "componentsFromLocaleIdentifier:", v17);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "objectForKeyedSubscript:", v10);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          if (v19)
            v23 = v22 == 0;
          else
            v23 = 1;
          if (!v23)
          {
            if ((objc_msgSend(v19, "isEqualToString:", v22) & 1) != 0)
              goto LABEL_15;
            objc_msgSend(*(id *)(v11 + 3528), "_parentLocaleIdentifierForIdentifier:", v22);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v24, "isEqualToString:", v19))
            {

              goto LABEL_15;
            }
            objc_msgSend(*(id *)(v11 + 3528), "_parentLocaleIdentifierForIdentifier:", v19);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = objc_msgSend(v25, "isEqualToString:", v22);

            v7 = v30;
            if (v26)
LABEL_15:
              objc_msgSend(v31, "addObject:", v17);
          }

          v11 = v20;
        }

      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    }
    while (v9);
  }

  objc_msgSend(v31, "array");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  return v27;
}

+ (id)minimizedLanguagesFromLanguages:()InternationalSupportExtensions
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  int v21;
  const char *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  _QWORD v35[2];

  v35[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "preferredLocalizationsFromArray:forPreferences:", 0x1EA16A7B0, v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DC8], "baseLanguageFromLanguage:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x1E0CB34D0];
    objc_msgSend(MEMORY[0x1E0C99DC8], "_deviceLanguages");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "preferredLocalizationsFromArray:forPreferences:", v8, v3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = (void *)MEMORY[0x1E0CB34D0];
    v35[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "preferredLocalizationsFromArray:forPreferences:", 0x1EA16A7B0, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "firstObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DC8], "baseLanguageFromLanguage:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v5 && v6 && v14 && v15)
    {
      objc_msgSend(v16, "addObject:", v5);
      if ((objc_msgSend(v6, "isEqualToString:", v15) & 1) == 0)
        objc_msgSend(v17, "addObject:", v6);
      objc_msgSend(v17, "addObject:", v14);
      objc_msgSend(v17, "addObject:", v15);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      {
        objc_msgSend(v3, "componentsJoinedByString:", CFSTR(","));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 136316674;
        v22 = "+[NSLocale(InternationalSupportExtensions) minimizedLanguagesFromLanguages:]";
        v23 = 2114;
        v24 = v20;
        v25 = 2114;
        v26 = v5;
        v27 = 2114;
        v28 = v6;
        v29 = 2114;
        v30 = v10;
        v31 = 2114;
        v32 = v14;
        v33 = 2114;
        v34 = v15;
        _os_log_fault_impl(&dword_1DA9C5000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "%s: Unable to minimize languages. languages = [ %{public}@ ], minimizedLanguage = %{public}@, , minimizedLanguageBase = %{public}@, deviceLanguage = %{public}@, minimizedDeviceLanguage = %{public}@, minimizedDeviceLanguageBase = %{public}@", (uint8_t *)&v21, 0x48u);

      }
      objc_msgSend(v17, "addObjectsFromArray:", v3);
    }
    objc_msgSend(v17, "array");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v18 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v18;
}

+ (id)baseLanguageFromLanguage:()InternationalSupportExtensions
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  v5 = v4;
  if (objc_msgSend(v4, "length"))
  {
    objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "regionCode");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "length"))
    {

    }
    else
    {
      objc_msgSend(v6, "scriptCode");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "length");

      v5 = v4;
      if (!v9)
      {
LABEL_6:

        goto LABEL_7;
      }
    }
    objc_msgSend(MEMORY[0x1E0C99DC8], "_addLikelySubtagsForLocaleIdentifier:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DC8], "componentsFromLocaleIdentifier:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "mutableCopy");

    objc_msgSend(v12, "removeObjectForKey:", *MEMORY[0x1E0C997B0]);
    objc_msgSend(MEMORY[0x1E0C99DC8], "localeIdentifierFromComponents:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_normalizedLanguageIdentifierFromString:", v13);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_6;
  }
LABEL_7:

  return v5;
}

+ (id)_addLikelySubtagsForLocaleIdentifier:()InternationalSupportExtensions
{
  id v3;
  void *v4;
  _BYTE v6[157];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = objc_retainAutorelease(a3);
  objc_msgSend(v3, "UTF8String");
  uloc_addLikelySubtags();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)_normalizedLanguageIdentifierFromString:()InternationalSupportExtensions
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v4 = a3;
  if (v4
    && (objc_msgSend(a1, "_languagesToExemplarStrings"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v5, "objectForKey:", v4),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v6,
        v5,
        !v6))
  {
    objc_msgSend(MEMORY[0x1E0C99DC8], "canonicalLanguageIdentifierFromString:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v4;
    if (!v8
      || (objc_msgSend(&unk_1EA1663E8, "objectForKeyedSubscript:", v4),
          (v7 = (id)objc_claimAutoreleasedReturnValue()) == 0)
      && (objc_msgSend(&unk_1EA1663E8, "objectForKeyedSubscript:", v8),
          v7 = (id)objc_claimAutoreleasedReturnValue(),
          v9 = v8,
          !v7))
    {
      v7 = v9;
    }

  }
  else
  {
    v7 = v4;
  }

  return v7;
}

+ (void)_languagesToExemplarStrings
{
  return &unk_1EA166348;
}

+ (id)_deviceLanguages
{
  if (_deviceLanguages___onceToken != -1)
    dispatch_once(&_deviceLanguages___onceToken, &__block_literal_global_1);
  return (id)_deviceLanguages___deviceLanguages;
}

+ (uint64_t)deviceLanguage
{
  return objc_msgSend(MEMORY[0x1E0C99DC8], "_deviceLanguage");
}

+ (id)baseSystemLanguages
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__NSLocale_InternationalSupportExtensions__baseSystemLanguages__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (baseSystemLanguages___onceToken != -1)
    dispatch_once(&baseSystemLanguages___onceToken, block);
  return (id)baseSystemLanguages___baseSystemLanguages;
}

+ (id)supportedLanguages
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v1 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(a1, "_languagesToExemplarStrings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)exemplarForLanguage:()InternationalSupportExtensions
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  if (v4)
  {
    objc_msgSend(a1, "_languagesToExemplarStrings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0C99DC8], "canonicalLanguageIdentifierFromString:", v4);
      v7 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(a1, "_languagesToExemplarStrings");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKey:", v7);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      v4 = (id)v7;
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)languagesForRegion:()InternationalSupportExtensions subdivision:withThreshold:filter:
{
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;

  v10 = a3;
  v11 = a4;
  if (a6 == 2)
  {
    objc_msgSend(a1, "_supportedKeyboardLanguages");
    v12 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  if (a6 == 1)
  {
    objc_msgSend(MEMORY[0x1E0C99DC8], "systemLanguages");
    v12 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v13 = (void *)v12;
    goto LABEL_7;
  }
  v13 = 0;
LABEL_7:
  objc_msgSend(a1, "_languagesForRegion:subdivision:withThreshold:", v10, v11, a5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v13)
  {
    objc_msgSend(a1, "matchedLanguagesFromAvailableLanguages:forPreferredLanguages:", v13, v14);
    v16 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = v14;
  }
  v17 = v16;

  return v17;
}

+ (id)regionsForLanguage:()InternationalSupportExtensions withThreshold:
{
  id v3;
  int RegionsForLanguage;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  HIDWORD(v14) = 0;
  v3 = objc_retainAutorelease(a3);
  objc_msgSend(v3, "UTF8String");
  RegionsForLanguage = ualoc_getRegionsForLanguage();
  v6 = RegionsForLanguage;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", RegionsForLanguage);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1E0C80A78]();
  v9 = (char *)&v14 - v8;
  objc_msgSend(objc_retainAutorelease(v3), "UTF8String");
  ualoc_getRegionsForLanguage();
  if (SHIDWORD(v14) <= 0 && v6 >= 1)
  {
    v10 = v6;
    do
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v11);

      v9 += 24;
      --v10;
    }
    while (v10);
  }
  objc_msgSend(MEMORY[0x1E0C99E40], "orderedSetWithArray:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v12, "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v5;
}

+ (id)supportedRegions
{
  if (supportedRegions___onceToken != -1)
    dispatch_once(&supportedRegions___onceToken, &__block_literal_global_18);
  return (id)supportedRegions___supportedRegions;
}

+ (id)exemplarRegionForLanguage:()InternationalSupportExtensions
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "countryCode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "length"))
    goto LABEL_5;
  objc_msgSend(v3, "lowercaseString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("en"));

  if ((v7 & 1) == 0)
  {
    v9 = (void *)MEMORY[0x1E0C99DC8];
    objc_msgSend(MEMORY[0x1E0C99DC8], "_addLikelySubtagsForLocaleIdentifier:", v3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localeWithLocaleIdentifier:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "countryCode");
    v12 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v12;
LABEL_5:
    v8 = v5;
    v5 = v8;
    goto LABEL_6;
  }
  v8 = 0;
LABEL_6:

  return v8;
}

+ (uint64_t)availableContinents
{
  return objc_msgSend(a1, "_availableRegionsOfType:", 3);
}

+ (id)_availableRegionsOfType:()InternationalSupportExtensions
{
  void *v0;
  uint64_t v1;
  uint64_t i;
  void *v3;
  uint64_t v4;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  uregion_getAvailable();
  v1 = uenum_next();
  if (v1)
  {
    for (i = v1; ; i = v4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", i, 4);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v0, "addObject:", v3);

      v4 = uenum_next();
      if (!v4)
        break;
    }
  }
  uenum_close();
  return v0;
}

+ (uint64_t)containingContinentOfRegion:()InternationalSupportExtensions
{
  return objc_msgSend(a1, "_containingRegionOfType:forRegion:", 3, a3);
}

+ (id)_containingRegionOfType:()InternationalSupportExtensions forRegion:
{
  uint64_t v5;
  void *v8;
  int v9;

  v9 = 0;
  v5 = MEMORY[0x1DF0A37A4](objc_msgSend(objc_retainAutorelease(a4), "UTF8String"), &v9);
  if (v9 > 0 || v5 == 0)
    return 0;
  v8 = (void *)MEMORY[0x1DF0A378C](v5, a3);
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", MEMORY[0x1DF0A3798](), 4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v8;
}

+ (id)containingRegionOfRegion:()InternationalSupportExtensions
{
  uint64_t v3;
  void *v6;
  int v7;

  v7 = 0;
  v3 = MEMORY[0x1DF0A37A4](objc_msgSend(objc_retainAutorelease(a3), "UTF8String"), &v7);
  if (v7 > 0 || v3 == 0)
    return 0;
  v6 = (void *)MEMORY[0x1DF0A3780](v3);
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", MEMORY[0x1DF0A3798](), 4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

+ (id)scriptCodeFromLanguage:()InternationalSupportExtensions
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  if (objc_msgSend(v3, "length"))
  {
    objc_msgSend(MEMORY[0x1E0C99DC8], "_addLikelySubtagsForLocaleIdentifier:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DC8], "componentsFromLocaleIdentifier:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0C99820]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)languageFromLanguage:()InternationalSupportExtensions byReplacingRegion:
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v6 = a3;
  v7 = a4;
  v8 = v6;
  v9 = v8;
  if (objc_msgSend(v8, "length"))
  {
    v9 = v8;
    if (objc_msgSend(v7, "length"))
    {
      objc_msgSend(a1, "baseLanguageFromLanguage:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99DC8], "componentsFromLocaleIdentifier:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_msgSend(v11, "mutableCopy");

      objc_msgSend(v12, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0C997B0]);
      objc_msgSend(MEMORY[0x1E0C99DC8], "localeIdentifierFromComponents:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "_normalizedLanguageIdentifierFromString:", v13);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }

  return v9;
}

- (uint64_t)localizedStringForLanguage:()InternationalSupportExtensions context:
{
  return objc_msgSend(a1, "localizedStringForLanguage:context:length:", a3, a4, 0);
}

- (id)localizedStringForLanguage:()InternationalSupportExtensions context:length:
{
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v8 = a3;
  v9 = (void *)objc_opt_class();
  objc_msgSend(a1, "languageIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_displayNameForLanguage:displayLanguage:context:length:", v8, v10, a4, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)_displayNameForLanguage:()InternationalSupportExtensions displayLanguage:context:length:
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v10 = a4;
  v11 = a3;
  objc_msgSend((id)objc_opt_class(), "_normalizedLanguageIdentifierFromString:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_displayNameForNormalizedLanguage:context:displayLanguage:length:", v12, a5, v10, a6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v13, "isEqualToString:", v12))
    v14 = v11;
  else
    v14 = v13;
  v15 = v14;

  return v15;
}

- (id)localizedStringForRegion:()InternationalSupportExtensions context:short:
{
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v8 = a3;
  v9 = (void *)objc_opt_class();
  objc_msgSend(a1, "languageIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_displayNameForRegion:displayLanguage:context:short:", v8, v10, a4, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)_displayNameForRegion:()InternationalSupportExtensions displayLanguage:context:short:
{
  void *v6;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  int v17;
  int v18;
  id v19;
  id v20;
  int v21;
  char *v22;
  id v23;
  int v24;
  id v25;
  uint64_t v27;
  uint64_t v28;
  int v29;
  int v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = (void *)objc_opt_class();
  v14 = objc_msgSend(v12, "length");
  v15 = v12;
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    a1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "preferredLocalizations");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v13, "_normalizedLanguageIdentifierFromString:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {

  }
  if ((unint64_t)(a5 - 3) >= 3)
    v17 = 256;
  else
    v17 = 262 - a5;
  v28 = 0;
  if (a6)
    v18 = 513;
  else
    v18 = 512;
  v29 = v17;
  v30 = v18;
  v19 = objc_retainAutorelease(v16);
  objc_msgSend(v19, "UTF8String");
  uldn_openForContext();
  v20 = objc_retainAutorelease(v11);
  objc_msgSend(v20, "UTF8String");
  v21 = uldn_regionDisplayName();
  if (v21 >= 150)
  {
    v21 = 0;
    LODWORD(v28) = 15;
  }
  v22 = (char *)&v27 - ((2 * (v21 + 1) + 15) & 0x3FFFFFFF0);
  v23 = objc_retainAutorelease(v20);
  objc_msgSend(v23, "UTF8String");
  v24 = uldn_regionDisplayName();
  uldn_close();
  if ((int)v28 > 0
    || (objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCharacters:length:", v22, v24),
        (v25 = (id)objc_claimAutoreleasedReturnValue()) == 0))
  {
    v25 = v23;
  }

  return v25;
}

+ (id)relatedLanguagesForLanguage:()InternationalSupportExtensions
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _QWORD v35[3];

  v35[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (relatedLanguagesForLanguage____onceToken != -1)
    dispatch_once(&relatedLanguagesForLanguage____onceToken, &__block_literal_global_34);
  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)relatedLanguagesForLanguage____relatedLanguages, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "mostPreferredLanguageOf:withPreferredLanguages:forUsage:options:", v6, v7, 0, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend((id)relatedLanguagesForLanguage____relatedLanguages, "objectForKeyedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
  if (objc_msgSend(v9, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "countryCode");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v29 = v11;
    if (objc_msgSend(v11, "length"))
    {
      v26 = v8;
      v27 = v5;
      v28 = v4;
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v9, "count"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = 0u;
      v31 = 0u;
      v32 = 0u;
      v33 = 0u;
      v25 = v9;
      v13 = v9;
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v31;
        do
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v31 != v16)
              objc_enumerationMutation(v13);
            v18 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i);
            objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", v18);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "countryCode");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = objc_msgSend(v20, "length");

            if (v21)
            {
              objc_msgSend(v12, "addObject:", v18);
            }
            else
            {
              objc_msgSend(MEMORY[0x1E0C99DC8], "languageFromLanguage:byReplacingRegion:", v18, v29);
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "addObject:", v22);

            }
          }
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
        }
        while (v15);
      }

      v5 = v27;
      objc_msgSend(v27, "addObjectsFromArray:", v12);

      v4 = v28;
      v9 = v25;
      v8 = v26;
    }
    else
    {
      objc_msgSend(v5, "addObjectsFromArray:", v9);
    }

  }
  objc_msgSend(v5, "array");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

+ (id)languagesByAddingRelatedLanguagesToLanguages:()InternationalSupportExtensions
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  id v23;
  uint64_t v24;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    v4 = (void *)MEMORY[0x1E0C99DC8];
    objc_msgSend(v3, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "scriptCodeFromLanguage:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("Latn"));

    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v23 = v3;
    v8 = v3;
    v26 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    if (v26)
    {
      v24 = *(_QWORD *)v35;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v35 != v24)
            objc_enumerationMutation(v8);
          v27 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * v9);
          v28 = v9;
          objc_msgSend(a1, "relatedLanguagesForLanguage:");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = 0u;
          v31 = 0u;
          v32 = 0u;
          v33 = 0u;
          v12 = v10;
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
          if (v13)
          {
            v14 = v13;
            v15 = *(_QWORD *)v31;
            do
            {
              for (i = 0; i != v14; ++i)
              {
                if (*(_QWORD *)v31 != v15)
                  objc_enumerationMutation(v12);
                v17 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i);
                if ((objc_msgSend(v8, "containsObject:", v17) & 1) == 0)
                {
                  if (!v7
                    || (objc_msgSend(MEMORY[0x1E0C99DC8], "scriptCodeFromLanguage:", v17),
                        v18 = (void *)objc_claimAutoreleasedReturnValue(),
                        v19 = objc_msgSend(v18, "isEqualToString:", CFSTR("Latn")),
                        v18,
                        v20 = v29,
                        (v19 & 1) == 0))
                  {
                    v20 = v11;
                  }
                  objc_msgSend(v20, "addObject:", v17);
                }
              }
              v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
            }
            while (v14);
          }

          objc_msgSend(v29, "addObject:", v27);
          objc_msgSend(v29, "addObjectsFromArray:", v11);

          v9 = v28 + 1;
        }
        while (v28 + 1 != v26);
        v26 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
      }
      while (v26);
    }

    v3 = v23;
  }
  objc_msgSend(v29, "array");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

+ (id)availableSpokenLanguages
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__NSLocale_InternationalSupportExtensions__availableSpokenLanguages__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (availableSpokenLanguages___onceToken != -1)
    dispatch_once(&availableSpokenLanguages___onceToken, block);
  return (id)availableSpokenLanguages___availableSpokenLanguages;
}

+ (id)spokenLanguagesForLanguage:()InternationalSupportExtensions
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0C99DC8];
  objc_msgSend(&unk_1EA168F08, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "matchedLanguagesFromAvailableLanguages:forPreferredLanguages:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(&unk_1EA168F08, "objectForKeyedSubscript:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v4, "languageCode");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v4, "languageCode");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v12;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v14, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v10 = (void *)MEMORY[0x1E0C9AA60];
    }

  }
  return v10;
}

+ (id)spokenLanguagesForLanguages:()InternationalSupportExtensions includeLanguagesForRegion:
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  void *v25;
  void *v26;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  id obj;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSetWithCapacity:", objc_msgSend(v6, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4)
  {
    objc_msgSend(MEMORY[0x1E0C99E10], "orderedSetWithCapacity:", 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  obj = v6;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v43;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v43 != v11)
          objc_enumerationMutation(obj);
        v13 = *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * i);
        objc_msgSend(a1, "spokenLanguagesForLanguage:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObjectsFromArray:", v14);

        if (a4)
        {
          objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", v13);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "countryCode");
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (v16)
            objc_msgSend(v8, "addObject:", v16);

        }
      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
    }
    while (v10);
  }

  if (a4)
  {
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    v28 = v8;
    v29 = v8;
    v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
    if (v31)
    {
      v30 = *(_QWORD *)v39;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v39 != v30)
            objc_enumerationMutation(v29);
          v33 = v17;
          v18 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * v17);
          objc_msgSend(MEMORY[0x1E0C99DC8], "languagesForRegion:subdivision:withThreshold:filter:", v18, 0, 1, 0, v28);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = 0u;
          v35 = 0u;
          v36 = 0u;
          v37 = 0u;
          v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v34, v46, 16);
          if (v20)
          {
            v21 = v20;
            v22 = *(_QWORD *)v35;
            do
            {
              for (j = 0; j != v21; ++j)
              {
                if (*(_QWORD *)v35 != v22)
                  objc_enumerationMutation(v19);
                objc_msgSend(MEMORY[0x1E0C99DC8], "languageFromLanguage:byReplacingRegion:", *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * j), v18);
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(a1, "spokenLanguagesForLanguage:", v24);
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v7, "addObjectsFromArray:", v25);

              }
              v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v34, v46, 16);
            }
            while (v21);
          }

          v17 = v33 + 1;
        }
        while (v33 + 1 != v31);
        v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
      }
      while (v31);
    }

    v8 = v28;
  }
  objc_msgSend(v7, "array", v28);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return v26;
}

- (uint64_t)isEquivalentTo:()InternationalSupportExtensions
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v4 = a3;
  objc_msgSend(a1, "localeIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localeIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DC8], "_addLikelySubtagsForLocaleIdentifier:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DC8], "_addLikelySubtagsForLocaleIdentifier:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v7, "isEqualToString:", v8);
  return v9;
}

- (id)availableNumberingSystems
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0C99DC8];
  objc_msgSend(a1, "localeIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "componentsFromLocaleIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("numbers"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "length"))
    objc_msgSend(v2, "addObject:", v7);
  v19 = v7;
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0C997E8]);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  if (objc_msgSend(&unk_1EA16AC30, "containsObject:"))
    v8 = &unk_1EA16AC48;
  else
    v8 = &unk_1EA16AC60;
  v22 = 0uLL;
  v23 = 0uLL;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v21 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(v6, "setObject:forKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i), CFSTR("numbers"));
        objc_msgSend(MEMORY[0x1E0C99DC8], "localeIdentifierFromComponents:", v6);
        v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        objc_msgSend(v13, "UTF8String");
        v14 = unumsys_open();

        if (v14)
        {
          if (!MEMORY[0x1DF0A375C](v14) && MEMORY[0x1DF0A3750](v14) == 10)
          {
            v15 = MEMORY[0x1DF0A3744](v14);
            if (v15)
            {
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v15);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              if ((objc_msgSend(v2, "containsObject:", v16) & 1) == 0)
                objc_msgSend(v2, "addObject:", v16);

            }
          }
          unumsys_close();
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v10);
  }
  if ((objc_msgSend(v2, "containsObject:", CFSTR("latn")) & 1) == 0)
    objc_msgSend(v2, "addObject:", CFSTR("latn"));

  return v2;
}

- (id)localizedStringForNumberingSystem:()InternationalSupportExtensions short:
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v6 = (void *)MEMORY[0x1E0C99DC8];
  v7 = a3;
  objc_msgSend(a1, "localeIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "componentsFromLocaleIdentifier:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "mutableCopy");

  objc_msgSend(v10, "setObject:forKeyedSubscript:", v7, CFSTR("numbers"));
  v11 = (void *)objc_opt_new();
  v12 = (void *)MEMORY[0x1E0C99DC8];
  objc_msgSend(MEMORY[0x1E0C99DC8], "localeIdentifierFromComponents:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localeWithLocaleIdentifier:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setLocale:", v14);

  if (a4)
    v15 = &unk_1EA16AFF8;
  else
    v15 = &unk_1EA16B010;
  objc_msgSend(v11, "stringFromNumber:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)countryCodeTopLevelDomainsUsingPunycode:()InternationalSupportExtensions
{
  void *v0;
  int v1;
  int v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  id v12;
  uint64_t v13;
  void *v14;
  unint64_t v15;
  uint64_t v16;
  const UIDNA *v17;
  UIDNA *v18;
  int32_t v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  UIDNAInfo pInfo;
  UErrorCode pErrorCode;
  _BYTE v27[128];
  UChar dest[1024];
  UChar label[1024];
  uint64_t v30;

  v0 = (void *)MEMORY[0x1E0C80A78]();
  v2 = v1;
  v30 = *MEMORY[0x1E0C80C00];
  objc_msgSend(v0, "countryCode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lowercaseString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(&unk_1EA166398, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2 && objc_msgSend(v5, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v22 != v10)
            objc_enumerationMutation(v7);
          v12 = *(id *)(*((_QWORD *)&v21 + 1) + 8 * i);
          v13 = objc_msgSend(v12, "length", (_QWORD)v21);
          v14 = v12;
          if (v13)
          {
            v15 = v13;
            v14 = v12;
            if (objc_msgSend(v12, "characterAtIndex:", 0) >= 0x80)
            {
              v16 = v15 >= 0x400 ? 1024 : v15;
              objc_msgSend(v12, "getCharacters:range:", label, 0, v16);
              pErrorCode = U_ZERO_ERROR;
              v17 = (const UIDNA *)MEMORY[0x1DF0A36E4](0, &pErrorCode);
              v14 = v12;
              if (v17)
              {
                v14 = v12;
                if (pErrorCode == U_ZERO_ERROR)
                {
                  v18 = v17;
                  *(_QWORD *)&pInfo.reservedI2 = 0;
                  *(_QWORD *)&pInfo.size = 16;
                  v19 = uidna_labelToASCII(v17, label, v15, dest, 2048, &pInfo, &pErrorCode);
                  v14 = v12;
                  if (v19 >= 1)
                  {
                    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithCharacters:length:", dest, v19);

                  }
                  uidna_close(v18);
                }
              }
            }
          }

          objc_msgSend(v6, "addObject:", v14);
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
      }
      while (v9);
    }

  }
  else
  {
    v6 = v5;
  }
  return v6;
}

- (uint64_t)positionOfDayPeriodInFormattedTime
{
  void *v1;
  uint64_t v2;
  char v3;
  char v4;
  int v5;
  char v6;
  uint64_t v7;

  objc_msgSend(MEMORY[0x1E0CB3578], "dateFormatFromTemplate:options:locale:", CFSTR("j"), 0, a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v1, "length"))
  {
LABEL_16:
    v7 = 0;
    goto LABEL_17;
  }
  v2 = 0;
  v3 = 0;
  v4 = 0;
  while (1)
  {
    v5 = objc_msgSend(v1, "characterAtIndex:", v2);
    if (v5 != 39)
      break;
    v3 ^= 1u;
LABEL_10:
    if (++v2 >= (unint64_t)objc_msgSend(v1, "length"))
      goto LABEL_16;
  }
  if ((v3 & 1) != 0)
  {
    v3 = 1;
    goto LABEL_10;
  }
  v3 = 0;
  v6 = v5 - 66;
  if ((v5 - 66) > 0x29)
    goto LABEL_10;
  if (((1 << v6) & 0x24000000240) != 0)
  {
    v3 = 0;
    v4 = 1;
    goto LABEL_10;
  }
  if (((1 << v6) & 0x180000001) == 0)
    goto LABEL_10;
  if ((v4 & 1) != 0)
    v7 = 2;
  else
    v7 = 1;
LABEL_17:

  return v7;
}

+ (id)abbreviationsForLanguages:()InternationalSupportExtensions minimizeVariants:
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t k;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v38;
  void *v39;
  id obj;
  id obja;
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  _BYTE v57[128];
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v52, v58, 16);
  v38 = v6;
  v39 = v5;
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v53;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v53 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend((id)objc_opt_class(), "_normalizedLanguageIdentifierFromString:", *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * i));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(&unk_1EA1663C0, "objectForKeyedSubscript:", v11);
        v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
        if (!v12)
        {
          objc_msgSend(MEMORY[0x1E0C99DC8], "baseLanguageFromLanguage:", v11);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(&unk_1EA1663C0, "objectForKeyedSubscript:", v13);
          v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
          if (!v12)
          {
            objc_msgSend(MEMORY[0x1E0C99DC8], "ISOLanguageCodes");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", v11);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "languageCode");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = &stru_1EA15B8A8;
            if (objc_msgSend(v14, "containsObject:", v16))
            {
              objc_msgSend(v16, "uppercaseString");
              v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
            }

            v6 = v38;
            v5 = v39;
          }

        }
        objc_msgSend(v5, "addObject:", v12, v38, v39);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v52, v58, 16);
    }
    while (v8);
  }

  if (a4)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v43 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    obj = v5;
    v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v57, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v49;
      v22 = MEMORY[0x1E0C9AAB0];
      do
      {
        for (j = 0; j != v20; ++j)
        {
          if (*(_QWORD *)v49 != v21)
            objc_enumerationMutation(obj);
          objc_msgSend(*(id *)(*((_QWORD *)&v48 + 1) + 8 * j), "componentsSeparatedByString:", CFSTR(" "), v38, v39);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "objectAtIndexedSubscript:", 0);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "objectForKey:", v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          if (v26)
            v27 = v18;
          else
            v27 = v17;
          objc_msgSend(v27, "setObject:forKey:", v22, v25);

        }
        v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v57, 16);
      }
      while (v20);
    }

    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    obja = obj;
    v28 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v44, v56, 16);
    if (v28)
    {
      v29 = v28;
      v30 = *(_QWORD *)v45;
      do
      {
        for (k = 0; k != v29; ++k)
        {
          if (*(_QWORD *)v45 != v30)
            objc_enumerationMutation(obja);
          v32 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * k);
          objc_msgSend(v32, "componentsSeparatedByString:", CFSTR(" "), v38, v39);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "objectAtIndexedSubscript:", 0);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "objectForKey:", v34);
          v35 = (void *)objc_claimAutoreleasedReturnValue();

          if (v35)
            v36 = v32;
          else
            v36 = v34;
          objc_msgSend(v43, "addObject:", v36);

        }
        v29 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v44, v56, 16);
      }
      while (v29);
    }

    v6 = v38;
    v5 = v39;
  }
  else
  {
    v43 = v5;
  }

  return v43;
}

+ (uint64_t)displayNameForLanguage:()InternationalSupportExtensions displayLanguage:context:
{
  return objc_msgSend(a1, "_displayNameForLanguage:displayLanguage:context:length:", a3, a4, a5, 0);
}

- (id)displayNameForLanguage:()InternationalSupportExtensions displayLanguage:context:
{
  id v7;
  id v8;
  void *v9;

  v7 = a4;
  v8 = a3;
  objc_msgSend((id)objc_opt_class(), "_displayNameForLanguage:displayLanguage:context:length:", v8, v7, a5, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)displayNameForRegion:()InternationalSupportExtensions displayLanguage:context:short:
{
  id v9;
  id v10;
  void *v11;

  v9 = a4;
  v10 = a3;
  objc_msgSend((id)objc_opt_class(), "_displayNameForRegion:displayLanguage:context:short:", v10, v9, a5, a6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (uint64_t)isOnCalciumDevice
{
  os_eligibility_get_domain_answer();
  return 0;
}

+ (id)_displayNameForNormalizedLanguage:()InternationalSupportExtensions context:displayLanguage:length:
{
  id v10;
  id v11;
  void *v12;

  v10 = a5;
  v11 = a3;
  objc_msgSend(a1, "_displayNameForNormalizedLanguage:context:displayLanguage:length:isCalcium:", v11, a4, v10, a6, objc_msgSend(a1, "isOnCalciumDevice"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)_displayNameForNormalizedLanguage:()InternationalSupportExtensions context:displayLanguage:length:isCalcium:
{
  id v10;
  id v11;
  void *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  char v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  char v43;
  uint64_t v44;
  id v45;
  void *v47;
  void *v48;
  _QWORD v49[2];

  v49[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v47 = a1;
  v12 = (void *)objc_opt_class();
  v13 = 0x1E0CB3000uLL;
  if (objc_msgSend(v11, "length"))
  {
    objc_msgSend(v12, "_normalizedLanguageIdentifierFromString:", v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "preferredLocalizations");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "firstObject");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_normalizedLanguageIdentifierFromString:", v17);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v18 = 0x1E0C99000uLL;
  if (a7)
  {
    objc_msgSend(&unk_1EA1680A8, "objectForKeyedSubscript:", v10);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)MEMORY[0x1E0CB34D0];
    objc_msgSend(v19, "allKeys");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(&unk_1EA16AC78, "arrayByAddingObjectsFromArray:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v49[0] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "preferredLocalizationsFromArray:forPreferences:", v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "firstObject");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v25, "length"))
      goto LABEL_10;
    if ((objc_msgSend(v25, "isEqualToString:", CFSTR("zxx")) & 1) != 0)
      goto LABEL_10;
    objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "languageCode");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", v14);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "languageCode");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v27, "isEqualToString:", v29);

    if ((v30 & 1) != 0)
    {
      objc_msgSend(v19, "objectForKeyedSubscript:", v25);
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = 0x1E0CB3000;
      v18 = 0x1E0C99000;
      if (v31)
        goto LABEL_20;
    }
    else
    {
LABEL_10:

      v13 = 0x1E0CB3000uLL;
      v18 = 0x1E0C99000uLL;
    }
  }
  +[H objectForKeyedSubscript:](&unk_1EA168058, "objectForKeyedSubscript:", v10);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = *(void **)(v13 + 1232);
  objc_msgSend(v32, "allKeys");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(&unk_1EA16AC90, "arrayByAddingObjectsFromArray:", v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = v14;
  objc_msgSend(*(id *)(v18 + 3360), "arrayWithObjects:count:", &v48, 1);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "preferredLocalizationsFromArray:forPreferences:", v35, v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "firstObject");
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v38, "length"))
    goto LABEL_16;
  if ((objc_msgSend(v38, "isEqualToString:", CFSTR("zxx")) & 1) != 0)
    goto LABEL_16;
  objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "languageCode");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", v14);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "languageCode");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = objc_msgSend(v40, "isEqualToString:", v42);

  if ((v43 & 1) != 0)
  {
    objc_msgSend(v32, "objectForKeyedSubscript:", v38);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    if (v31)
      goto LABEL_20;
  }
  else
  {
LABEL_16:

  }
  objc_msgSend(objc_retainAutorelease(v14), "UTF8String");
  v44 = uldn_openForContext();
  if (v44)
  {
    objc_msgSend(v47, "_ICUdisplayNameForLanguage:capitalization:", v10, v44);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    uldn_close();
  }
  else
  {
    v31 = 0;
  }
LABEL_20:
  if (!objc_msgSend(v31, "length"))
  {
    v45 = v10;

    v31 = v45;
  }

  return v31;
}

+ (id)_minimizeSubtagsForLocaleIdentifier:()InternationalSupportExtensions
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE v14[157];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = objc_retainAutorelease(a3);
  objc_msgSend(v3, "UTF8String");
  uloc_minimizeSubtags();
  v4 = v3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v14);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DC8], "componentsFromLocaleIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x1E0C997B0];
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0C997B0]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "length"))
  {
    objc_msgSend(MEMORY[0x1E0C99DC8], "componentsFromLocaleIdentifier:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "length");

    if (!v11)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%@"), v5, v8);
      v12 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v12;
    }
  }

  return v5;
}

+ (id)_ICUdisplayNameForLanguage:()InternationalSupportExtensions capitalization:
{
  unsigned int v4;
  uint64_t v6;
  _BYTE v7[256];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (!a4)
    return 0;
  objc_msgSend(objc_retainAutorelease(a3), "UTF8String");
  v4 = uldn_localeDisplayName();
  if (v4 >= 0x80)
    v6 = 128;
  else
    v6 = v4;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCharacters:length:", v7, v6);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)_languagesForRegion:()InternationalSupportExtensions subdivision:withThreshold:
{
  id v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  float v28;
  float v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v34;
  void *v35;
  id v36;
  int LanguagesForRegion;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  _QWORD v46[2];
  void *v47;
  void *v48;
  void *v49;
  int v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  objc_msgSend(a3, "uppercaseString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "uppercaseString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = 0.05;
  if (a5 != 1)
    v11 = 0.0;
  if (a5 == 2)
    v12 = 0.6;
  else
    v12 = v11;
  if (objc_msgSend(v10, "length", v11))
  {
    objc_msgSend(a1, "_regionLanguageDataForRegionCode:subdivisionCode:", v9, v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("all"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    __90__NSLocale_InternationalSupportExtensions___languagesForRegion_subdivision_withThreshold___block_invoke((uint64_t)v14, v13, CFSTR("override"), a5);
    v15 = objc_claimAutoreleasedReturnValue();
    if (!v15
      || (v16 = (void *)v15,
          objc_msgSend(MEMORY[0x1E0C99E40], "orderedSetWithArray:", v15),
          v17 = (void *)objc_claimAutoreleasedReturnValue(),
          v16,
          !v17))
    {
      v48 = v13;
      v49 = v10;
      v18 = v9;
      objc_msgSend(v14, "keysSortedByValueUsingComparator:", &__block_literal_global_185);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = 0u;
      v52 = 0u;
      v53 = 0u;
      v54 = 0u;
      v21 = v19;
      v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v51, v55, 16);
      if (v22)
      {
        v23 = v22;
        v24 = *(_QWORD *)v52;
LABEL_11:
        v25 = 0;
        while (1)
        {
          if (*(_QWORD *)v52 != v24)
            objc_enumerationMutation(v21);
          v26 = *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * v25);
          objc_msgSend(v14, "objectForKeyedSubscript:", v26);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "floatValue");
          v29 = v28;

          if (v12 > v29)
            break;
          objc_msgSend(v20, "addObject:", v26);
          if (v23 == ++v25)
          {
            v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v51, v55, 16);
            if (v23)
              goto LABEL_11;
            break;
          }
        }
      }

      v30 = objc_msgSend(v20, "count");
      v9 = v18;
      v10 = v49;
      v13 = v48;
      if (v30)
      {
        __90__NSLocale_InternationalSupportExtensions___languagesForRegion_subdivision_withThreshold___block_invoke(v30, v48, CFSTR("remove"), a5);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v31, "count"))
          objc_msgSend(v20, "removeObjectsInArray:", v31);

      }
      objc_msgSend(MEMORY[0x1E0C99E40], "orderedSetWithArray:", v20);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_22;
  }
  objc_msgSend(a1, "_regionLanguageDataForRegionCode:subdivisionCode:", v9, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  __90__NSLocale_InternationalSupportExtensions___languagesForRegion_subdivision_withThreshold___block_invoke((uint64_t)v13, v13, CFSTR("override"), a5);
  v34 = objc_claimAutoreleasedReturnValue();
  if (!v34
    || (v35 = (void *)v34,
        objc_msgSend(MEMORY[0x1E0C99E40], "orderedSetWithArray:", v34),
        v17 = (void *)objc_claimAutoreleasedReturnValue(),
        v35,
        !v17))
  {
    v50 = 0;
    v36 = objc_retainAutorelease(v9);
    objc_msgSend(v36, "UTF8String");
    LanguagesForRegion = ualoc_getLanguagesForRegion();
    v48 = v13;
    v49 = v10;
    v47 = v9;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", LanguagesForRegion);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v46[1] = v46;
    MEMORY[0x1E0C80A78]();
    v39 = (char *)v46 - v38;
    objc_msgSend(objc_retainAutorelease(v36), "UTF8String");
    ualoc_getLanguagesForRegion();
    if (v50 <= 0 && LanguagesForRegion >= 1)
    {
      v40 = LanguagesForRegion;
      do
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v39);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99DC8], "canonicalLanguageIdentifierFromString:", v41);
        v42 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v42, "stringByReplacingOccurrencesOfString:withString:", CFSTR("_"), CFSTR("-"));
        v43 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v14, "addObject:", v43);
        v39 += 40;
        --v40;
      }
      while (v40);
    }
    v44 = objc_msgSend(v14, "count");
    v9 = v47;
    v10 = v49;
    v13 = v48;
    if (v44)
    {
      __90__NSLocale_InternationalSupportExtensions___languagesForRegion_subdivision_withThreshold___block_invoke(v44, v48, CFSTR("remove"), a5);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v45, "count"))
        objc_msgSend(v14, "removeObjectsInArray:", v45);

    }
    objc_msgSend(MEMORY[0x1E0C99E40], "orderedSetWithArray:", v14);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_22:

  }
  objc_msgSend(v17, "array");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  return v32;
}

+ (id)_regionLanguageDataForRegionCode:()InternationalSupportExtensions subdivisionCode:
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v5 = a4;
  objc_msgSend(&unk_1EA168EE0, "objectForKeyedSubscript:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", v5);
    v8 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v8;
  }

  return v7;
}

+ (void)_regionLanguageData
{
  return &unk_1EA168EE0;
}

+ (void)_supportedKeyboardLanguages
{
  return &unk_1EA16A780;
}

+ (__CFString)_parentLocaleIdentifierForIdentifier:()InternationalSupportExtensions
{
  id v3;
  void *v4;
  __CFString *v5;
  _BYTE v7[157];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = objc_retainAutorelease(a3);
  objc_msgSend(v3, "UTF8String");
  ualoc_getAppleParent();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByReplacingOccurrencesOfString:withString:", CFSTR("_"), CFSTR("-"));
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (-[__CFString isEqualToString:](v5, "isEqualToString:", v3))
  {

    v5 = CFSTR("root");
  }

  return v5;
}

@end
