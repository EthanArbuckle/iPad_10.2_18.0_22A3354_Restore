@implementation NSLocale(IntlPreferencesAdditions)

+ (id)deviceLanguageLocale
{
  void *v0;
  void *v1;
  void *v2;

  v0 = (void *)MEMORY[0x1E0C99DC8];
  objc_msgSend(MEMORY[0x1E0C99DC8], "deviceLanguage");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "localeWithLocaleIdentifier:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (uint64_t)deviceLanguageIdentifier
{
  return objc_msgSend(MEMORY[0x1E0C99DC8], "deviceLanguage");
}

+ (id)supportedCJLanguageIdentifiers
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99DC8], "systemLanguages");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "indexesOfObjectsPassingTest:", &__block_literal_global_5);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DC8], "systemLanguages");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectsAtIndexes:", v1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)canonicalLanguageAndScriptCodeIdentifierForIdentifier:()IntlPreferencesAdditions
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  BOOL v7;
  void *v8;
  void **v9;
  uint64_t *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v17;
  void *v18;
  _QWORD v19[2];
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DC8], "addLikelySubtagsForLocaleIdentifier:");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DC8], "componentsFromLocaleIdentifier:", v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = *MEMORY[0x1E0C997E8];
  objc_msgSend(v1, "objectForKeyedSubscript:", *MEMORY[0x1E0C997E8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0C99820];
  objc_msgSend(v1, "objectForKeyedSubscript:", *MEMORY[0x1E0C99820]);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v3)
    v7 = v5 == 0;
  else
    v7 = 1;
  if (v7)
  {
    if (!v3)
    {
      v12 = 0;
      goto LABEL_9;
    }
    v17 = v2;
    v18 = v3;
    v8 = (void *)MEMORY[0x1E0C99D80];
    v9 = &v18;
    v10 = &v17;
    v11 = 1;
  }
  else
  {
    v19[0] = v2;
    v19[1] = v4;
    v20[0] = v3;
    v20[1] = v5;
    v8 = (void *)MEMORY[0x1E0C99D80];
    v9 = (void **)v20;
    v10 = v19;
    v11 = 2;
  }
  objc_msgSend(v8, "dictionaryWithObjects:forKeys:count:", v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:
  v13 = (void *)MEMORY[0x1E0C99DC8];
  objc_msgSend(MEMORY[0x1E0C99DC8], "localeIdentifierFromComponents:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "canonicalLanguageIdentifierFromString:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (id)canonicalLocaleIdentifierFromComponents:()IntlPreferencesAdditions
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99DC8], "localeIdentifierFromComponents:");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DC8], "canonicalLocaleIdentifierFromString:", v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

+ (id)addLikelySubtagsForLocaleIdentifier:()IntlPreferencesAdditions
{
  id v3;
  void *v4;
  _BYTE v6[19];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = objc_retainAutorelease(a3);
  objc_msgSend(v3, "UTF8String");
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", v6, (int)uloc_addLikelySubtags(), 4);

  return v4;
}

+ (id)renderableUILanguages
{
  if (renderableUILanguages_onceToken != -1)
    dispatch_once(&renderableUILanguages_onceToken, &__block_literal_global_15);
  return (id)renderableUILanguages___renderableLanguages;
}

+ (id)renderableLocaleLanguages
{
  if (renderableLocaleLanguages_onceToken != -1)
    dispatch_once(&renderableLocaleLanguages_onceToken, &__block_literal_global_23);
  return (id)renderableLocaleLanguages___renderableLanguages;
}

+ (id)renderableLanguagesFromList:()IntlPreferencesAdditions
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  objc_msgSend(v3, "indexesOfObjectsPassingTest:", &__block_literal_global_25);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectsAtIndexes:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (void)setLocaleOnly:()IntlPreferencesAdditions
{
  id v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  __CFNotificationCenter *DarwinNotifyCenter;
  int v8;
  id v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v3, "length"))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLocale");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "localeIdentifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543618;
      v9 = v3;
      v10 = 2114;
      v11 = v5;
      _os_log_impl(&dword_1B96C1000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Setting locale to %{public}@. Current locale is %{public}@.", (uint8_t *)&v8, 0x16u);

    }
    v6 = (const __CFString *)*MEMORY[0x1E0C9B228];
    CFPreferencesSetAppValue(CFSTR("AppleLocale"), v3, (CFStringRef)*MEMORY[0x1E0C9B228]);
    CFPreferencesAppSynchronize(v6);
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("AppleDatePreferencesChangedNotification"), 0, 0, 1u);
    CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("AppleTimePreferencesChangedNotification"), 0, 0, 1u);
    CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("AppleNumberPreferencesChangedNotification"), 0, 0, 1u);
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    +[NSLocale(IntlPreferencesAdditions) setLocaleOnly:].cold.1((uint64_t)v3);
  }

}

+ (uint64_t)setLocaleAndResetTimeFormat:()IntlPreferencesAdditions
{
  objc_msgSend(MEMORY[0x1E0C99DC8], "setLocaleOnly:");
  return objc_msgSend(MEMORY[0x1E0C99DC8], "resetTimeFormat");
}

+ (void)resetTimeFormat
{
  const __CFString *v0;
  __CFNotificationCenter *DarwinNotifyCenter;

  v0 = (const __CFString *)*MEMORY[0x1E0C9B228];
  CFPreferencesSetAppValue(CFSTR("AppleICUForce12HourTime"), 0, (CFStringRef)*MEMORY[0x1E0C9B228]);
  CFPreferencesSetAppValue(CFSTR("AppleICUForce24HourTime"), 0, v0);
  CFPreferencesAppSynchronize(v0);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("AppleTimePreferencesChangedNotification"), 0, 0, 1u);
}

+ (uint64_t)setLocaleAndResetCustomFormat:()IntlPreferencesAdditions
{
  objc_msgSend(MEMORY[0x1E0C99DC8], "setLocaleOnly:");
  return objc_msgSend(MEMORY[0x1E0C99DC8], "resetCustomFormats");
}

+ (void)resetCustomFormats
{
  uint64_t v0;
  id v1;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  v0 = *MEMORY[0x1E0CB2B58];
  objc_msgSend(v1, "removeObjectForKey:inDomain:", CFSTR("AppleICUDateFormatStrings"), *MEMORY[0x1E0CB2B58]);
  objc_msgSend(v1, "removeObjectForKey:inDomain:", CFSTR("AppleICUNumberSymbols"), v0);

}

+ (id)validateLocale:()IntlPreferencesAdditions
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DC8], "availableLocaleIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DC8], "componentsFromLocaleIdentifier:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0C997E8];
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0C997E8]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "containsObject:", v7))
  {
    v8 = v3;
  }
  else
  {
    v21 = v7;
    v22 = v3;
    objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v24;
      while (2)
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v24 != v12)
            objc_enumerationMutation(v9);
          v14 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
          objc_msgSend(MEMORY[0x1E0C99DC8], "componentsFromLocaleIdentifier:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "objectForKeyedSubscript:", v6);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if ((objc_msgSend(v4, "containsObject:", v16) & 1) != 0)
          {
            v3 = v22;
            objc_msgSend(MEMORY[0x1E0C99DC8], "canonicalLocaleIdentifier:withNewLanguageIdentifier:", v22, v14);
            v8 = (id)objc_claimAutoreleasedReturnValue();

            goto LABEL_13;
          }

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        if (v11)
          continue;
        break;
      }
    }

    v17 = (void *)MEMORY[0x1E0C99DC8];
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "localeIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "canonicalLocaleIdentifierFromString:", v19);
    v8 = (id)objc_claimAutoreleasedReturnValue();

    v3 = v22;
LABEL_13:
    v7 = v21;
  }

  return v8;
}

+ (void)setLocaleAfterLanguageChange:()IntlPreferencesAdditions
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = (void *)MEMORY[0x1E0C99DC8];
  v4 = a3;
  objc_msgSend(v3, "preferredLocale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localeIdentifier");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DC8], "canonicalLocaleIdentifier:withNewLanguageIdentifier:", v11, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DC8], "validateLocale:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1E0C99DC8];
  objc_msgSend(MEMORY[0x1E0C99DC8], "componentsFromLocaleIdentifier:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "canonicalLocaleIdentifierWithValidCalendarForComponents:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v10, "isEqualToString:", v11) & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DC8], "setLocaleAndResetCustomFormat:", v10);

}

+ (void)_insertFallbackLanguageIfNecessaryForRegion:()IntlPreferencesAdditions
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v3 = (void *)MEMORY[0x1E0C99DC8];
  v4 = a3;
  objc_msgSend(v3, "preferredLanguages");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[IntlUtility preferredLanguagesFromLanguages:byAddingFallbacksForRegion:](IntlUtility, "preferredLanguagesFromLanguages:byAddingFallbacksForRegion:", v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "count") && (objc_msgSend(v6, "isEqualToArray:", v7) & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DC8], "setPreferredLanguages:", v6);

}

+ (void)setLocaleAfterRegionChange:()IntlPreferencesAdditions
{
  void *v4;
  id v5;
  id v6;

  v4 = (void *)MEMORY[0x1E0C99DC8];
  v5 = a3;
  objc_msgSend(v4, "_insertFallbackLanguageIfNecessaryForRegion:", v5);
  objc_msgSend(a1, "localeIdentifierForRegionChange:", v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DC8], "setLocaleAndResetCustomFormat:", v6);
}

+ (id)canonicalLocaleIdentifierWithValidCalendarForComponents:()IntlPreferencesAdditions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  char v10;
  uint64_t v11;

  v3 = (void *)objc_msgSend(a3, "mutableCopy");
  objc_msgSend(MEMORY[0x1E0C99DC8], "canonicalLocaleIdentifierFromComponents:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[IntlUtility defaultCalendarForLocaleID:](IntlUtility, "defaultCalendarForLocaleID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("calendar"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v3, "objectForKey:", CFSTR("calendar"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", v5);

    if (v8)
    {
      objc_msgSend(v3, "removeObjectForKey:", CFSTR("calendar"));
LABEL_6:
      objc_msgSend(MEMORY[0x1E0C99DC8], "canonicalLocaleIdentifierFromComponents:", v3);
      v11 = objc_claimAutoreleasedReturnValue();

      v4 = (void *)v11;
    }
  }
  else
  {
    +[IntlUtility supportedCalendars](IntlUtility, "supportedCalendars");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "containsObject:", v5);

    if ((v10 & 1) == 0)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", *MEMORY[0x1E0C996C8], CFSTR("calendar"));
      goto LABEL_6;
    }
  }

  return v4;
}

+ (id)languageArrayAfterSettingLanguage:()IntlPreferencesAdditions fallback:toLanguageArray:
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  uint64_t v24;
  id v26;
  _QWORD v27[3];

  v27[2] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = (void *)objc_msgSend(a5, "mutableCopy");
  v10 = objc_msgSend(v9, "count");
  if (v7 && v10)
  {
    v11 = objc_msgSend(v9, "indexOfObject:", v7);
    v12 = v11;
    if (v8)
    {
      v13 = (void *)MEMORY[0x1E0CB34D0];
      v27[0] = CFSTR("zxx");
      v27[1] = v8;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 2);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v7;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v26, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "preferredLocalizationsFromArray:forPreferences:", v14, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "firstObject");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "isEqualToString:", v8) ^ 1;

      if (v12)
      {
LABEL_8:
        v19 = (void *)MEMORY[0x1E0C99DC8];
        objc_msgSend(v9, "firstObject");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "baseLanguageFromLanguage:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12 != 0x7FFFFFFFFFFFFFFFLL)
          objc_msgSend(v9, "removeObjectAtIndex:", v12);
        objc_msgSend(MEMORY[0x1E0C99DC8], "baseLanguageFromLanguage:", v7);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "isEqualToString:", v21);

        if (v23)
        {
          objc_msgSend(v9, "setObject:atIndexedSubscript:", v7, 0);
          if (!v18)
            goto LABEL_17;
        }
        else
        {
          objc_msgSend(v9, "insertObject:atIndex:", v7, 0);
          if (!v18)
          {
LABEL_17:

            goto LABEL_18;
          }
        }
        v24 = objc_msgSend(v9, "indexOfObject:", v8);
        if (v24 != 0x7FFFFFFFFFFFFFFFLL)
          objc_msgSend(v9, "removeObjectAtIndex:", v24);
        objc_msgSend(v9, "insertObject:atIndex:", v8, 1);
        goto LABEL_17;
      }
    }
    else
    {
      v18 = 0;
      if (v11)
        goto LABEL_8;
    }
    if (v18)
      goto LABEL_8;
  }
LABEL_18:

  return v9;
}

+ (void)setPreferredLanguageAndUpdateLocale:()IntlPreferencesAdditions
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DC8], "setLocaleAfterLanguageChange:", v3);
  objc_msgSend(MEMORY[0x1E0C99DC8], "componentsFromLocaleIdentifier:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v3;
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0C997B0]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = v10;
  if (!v5)
  {
    v7 = (void *)MEMORY[0x1E0C99DC8];
    objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLocale");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "regionCode");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "languageFromLanguage:byReplacingRegion:", v10, v9);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(MEMORY[0x1E0C99DC8], "setLanguageToPreferredLanguages:fallback:", v6, 0);

}

+ (void)setLanguageToPreferredLanguages:()IntlPreferencesAdditions fallback:
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;

  v5 = (void *)MEMORY[0x1E0C99DC8];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "preferredLanguages");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "languageArrayAfterSettingLanguage:fallback:toLanguageArray:", v7, v6, v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "count") && (objc_msgSend(v9, "isEqualToArray:", v8) & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DC8], "setPreferredLanguages:", v8);

}

+ (id)_preferencesForSetLanguageAndRegion:()IntlPreferencesAdditions
{
  __CFString *v3;
  void *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __CFString *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  void *v26;
  _QWORD v27[2];
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[__CFString length](v3, "length"))
  {
    v5 = CFSTR("en-001");

    v3 = v5;
  }
  v6 = (void *)MEMORY[0x1E0C99DC8];
  objc_msgSend(MEMORY[0x1E0C99DC8], "addLikelySubtagsForLocaleIdentifier:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "componentsFromLocaleIdentifier:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");

  objc_msgSend(MEMORY[0x1E0C99DC8], "localeIdentifierFromComponents:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[IntlUtility normalizedLanguageIDFromString:](IntlUtility, "normalizedLanguageIDFromString:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "countryCode");
  v13 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    v14 = *MEMORY[0x1E0C997B0];
    objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0C997B0]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_msgSend(v9, "objectForKeyedSubscript:", v14);
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = CFSTR("001");
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v13, v14);
    }
    objc_msgSend(MEMORY[0x1E0C99DC8], "languageFromLanguage:byReplacingRegion:", v11, v13);
    v16 = objc_claimAutoreleasedReturnValue();

    v11 = (void *)v16;
  }
  objc_msgSend(MEMORY[0x1E0C99DC8], "systemLanguages");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "containsObject:", v11);

  if ((v18 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0C99DC8], "baseLanguageFromLanguage:", v11);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DC8], "systemLanguages");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v20, "containsObject:", v19))
    {

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99DC8], "baseSystemLanguages");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "containsObject:", v19);

      if (!v22)
      {
        objc_msgSend(MEMORY[0x1E0C99DC8], "languageFromLanguage:byReplacingRegion:", CFSTR("en-001"), v13, v11);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v27[1] = v23;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 2);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v26, CFSTR("AppleLanguages"));

        goto LABEL_13;
      }
    }
  }
  v28[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v23, CFSTR("AppleLanguages"));
LABEL_13:

  objc_msgSend(MEMORY[0x1E0C99DC8], "canonicalLocaleIdentifierFromComponents:", v9);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v24, CFSTR("AppleLocale"));

  return v4;
}

+ (void)setLanguageAndRegion:()IntlPreferencesAdditions
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  objc_msgSend(a1, "_preferencesForSetLanguageAndRegion:");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (void *)MEMORY[0x1E0C99DC8];
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("AppleLanguages"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPreferredLanguages:", v3);

  v4 = (void *)MEMORY[0x1E0C99DC8];
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("AppleLocale"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localeWithLocaleIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "countryCode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_insertFallbackLanguageIfNecessaryForRegion:", v7);

  v8 = (void *)MEMORY[0x1E0C99DC8];
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("AppleLocale"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setLocaleAndResetCustomFormat:", v9);

}

+ (uint64_t)_usesTwelveHourClock
{
  void *v2;
  uint64_t v3;
  void *v4;
  char v5;
  uint64_t v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x1E0CB2B58];
  objc_msgSend(v2, "objectForKey:inDomain:", CFSTR("AppleICUForce12HourTime"), *MEMORY[0x1E0CB2B58]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  if ((v5 & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    objc_msgSend(v2, "objectForKey:inDomain:", CFSTR("AppleICUForce24HourTime"), v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "BOOLValue");

    if ((v8 & 1) != 0)
    {
      v6 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLocale");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "localeIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(a1, "_defaultUsesTwelveHourClockForLocaleIdentifier:", v10);

    }
  }

  return v6;
}

+ (uint64_t)_usesTwelveHourClockForLoginWindow
{
  const __CFString *v2;
  const __CFString *v3;
  const __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v2 = (const __CFString *)*MEMORY[0x1E0C9B228];
  v3 = (const __CFString *)*MEMORY[0x1E0C9B240];
  v4 = (const __CFString *)*MEMORY[0x1E0C9B250];
  v5 = (void *)CFPreferencesCopyValue(CFSTR("AppleICUForce12HourTime"), (CFStringRef)*MEMORY[0x1E0C9B228], (CFStringRef)*MEMORY[0x1E0C9B240], (CFStringRef)*MEMORY[0x1E0C9B250]);
  v6 = (void *)CFPreferencesCopyValue(CFSTR("AppleICUForce24HourTime"), v2, v3, v4);
  v7 = (void *)CFPreferencesCopyValue(CFSTR("AppleLocale"), v2, v3, v4);
  if ((objc_msgSend(v5, "BOOLValue") & 1) != 0)
  {
    v8 = 1;
  }
  else if ((objc_msgSend(v6, "BOOLValue") & 1) != 0)
  {
    v8 = 0;
  }
  else
  {
    v8 = objc_msgSend(a1, "_defaultUsesTwelveHourClockForLocaleIdentifier:", v7);
  }

  return v8;
}

+ (BOOL)_defaultUsesTwelveHourClockForLocaleIdentifier:()IntlPreferencesAdditions
{
  void *v0;
  id v1;
  void *v2;
  unint64_t v3;
  uint64_t v4;
  char v5;
  int v6;

  objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(v1, "setLocale:", v0);
  objc_msgSend(v1, "setDateStyle:", 0);
  objc_msgSend(v1, "setTimeStyle:", 1);
  objc_msgSend(v1, "dateFormat");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "length"))
  {
    v3 = 0;
    v4 = 0;
    v5 = 0;
    do
    {
      v6 = objc_msgSend(v2, "characterAtIndex:", v3);
      if (v6 == 104 || v6 == 75)
      {
        v4 += (v5 & 1) == 0;
      }
      else if (v6 == 39)
      {
        v5 ^= 1u;
      }
      ++v3;
    }
    while (v3 < objc_msgSend(v2, "length"));
  }
  else
  {
    v4 = 0;
  }

  return v4 != 0;
}

+ (void)_setUsesTwelveHourClock:()IntlPreferencesAdditions
{
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  id v9;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLocale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localeIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(a1, "_defaultUsesTwelveHourClockForLocaleIdentifier:", v6);

  v8 = *MEMORY[0x1E0CB2B58];
  if (v7 == a3)
  {
    objc_msgSend(v9, "removeObjectForKey:inDomain:", CFSTR("AppleICUForce12HourTime"), *MEMORY[0x1E0CB2B58]);
  }
  else
  {
    if (!a3)
    {
      objc_msgSend(v9, "removeObjectForKey:inDomain:", CFSTR("AppleICUForce12HourTime"), *MEMORY[0x1E0CB2B58]);
      objc_msgSend(v9, "setObject:forKey:inDomain:", MEMORY[0x1E0C9AAB0], CFSTR("AppleICUForce24HourTime"), v8);
      goto LABEL_7;
    }
    objc_msgSend(v9, "setObject:forKey:inDomain:", MEMORY[0x1E0C9AAB0], CFSTR("AppleICUForce12HourTime"), *MEMORY[0x1E0CB2B58]);
  }
  objc_msgSend(v9, "removeObjectForKey:inDomain:", CFSTR("AppleICUForce24HourTime"), v8);
LABEL_7:

}

+ (void)_setUsesTwelveHourClockForLoginWindow:()IntlPreferencesAdditions
{
  const __CFString *v5;
  const __CFString *v6;
  const __CFString *v7;
  const void *v8;
  const void *v9;
  id v10;

  v5 = (const __CFString *)*MEMORY[0x1E0C9B228];
  v6 = (const __CFString *)*MEMORY[0x1E0C9B240];
  v7 = (const __CFString *)*MEMORY[0x1E0C9B250];
  v10 = (id)CFPreferencesCopyValue(CFSTR("AppleLocale"), (CFStringRef)*MEMORY[0x1E0C9B228], (CFStringRef)*MEMORY[0x1E0C9B240], (CFStringRef)*MEMORY[0x1E0C9B250]);
  if (objc_msgSend(a1, "_defaultUsesTwelveHourClockForLocaleIdentifier:") == a3)
  {
    v8 = 0;
  }
  else
  {
    if (!a3)
    {
      CFPreferencesSetValue(CFSTR("AppleICUForce12HourTime"), 0, v5, v6, v7);
      v9 = (const void *)*MEMORY[0x1E0C9AE50];
      goto LABEL_7;
    }
    v8 = (const void *)*MEMORY[0x1E0C9AE50];
  }
  CFPreferencesSetValue(CFSTR("AppleICUForce12HourTime"), v8, v5, v6, v7);
  v9 = 0;
LABEL_7:
  CFPreferencesSetValue(CFSTR("AppleICUForce24HourTime"), v9, v5, v6, v7);

}

+ (id)_languageIdentifiersForLanguage:()IntlPreferencesAdditions region:
{
  id v5;
  id v6;
  IPLanguageListManager *v7;
  void *v8;
  IPLanguageListManager *v9;
  void *v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = a3;
  v7 = [IPLanguageListManager alloc];
  v12[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[IPLanguageListManager initWithPreferredLanguages:](v7, "initWithPreferredLanguages:", v8);
  -[IPLanguageListManager setRegion:updateFirstLanguage:](v9, "setRegion:updateFirstLanguage:", v5, 0);

  -[IPLanguageListManager preferredLanguages](v9, "preferredLanguages");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)_localeIdentifierForLanguage:()IntlPreferencesAdditions region:
{
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v5 = (void *)MEMORY[0x1E0C99DC8];
  v6 = a4;
  objc_msgSend(v5, "localeWithLocaleIdentifier:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_localeIdentifierForRegionChangeFrom:to:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (void)enableDefaultKeyboardForPreferredLanguages
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  char v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  int v37;
  uint64_t v38;
  uint64_t j;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _BYTE v59[128];
  _BYTE v60[128];
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "firstObject");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  if (v1)
  {
    -[objc_class sharedInputModeController](IPUIKeyboardInputModeController(), "sharedInputModeController");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "suggestedInputModesForCurrentLocale");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    v44 = v3;
    v45 = v1;
    if (objc_msgSend(v3, "count"))
    {
      v57 = 0u;
      v58 = 0u;
      v55 = 0u;
      v56 = 0u;
      v4 = v3;
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v55, v61, 16);
      if (v5)
      {
        v6 = v5;
        v7 = *(_QWORD *)v56;
LABEL_5:
        v8 = 0;
        while (1)
        {
          if (*(_QWORD *)v56 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * v8);
          if ((objc_msgSend(v9, "enabled") & 1) != 0)
            break;
          if (v6 == ++v8)
          {
            v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v55, v61, 16);
            if (v6)
              goto LABEL_5;
            goto LABEL_11;
          }
        }
        objc_msgSend(v9, "identifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
          goto LABEL_15;
      }
      else
      {
LABEL_11:

      }
      objc_msgSend(v4, "objectAtIndex:", 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      IPUIKeyboardCanonicalInputModeName(v1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
LABEL_15:
    -[objc_class sharedInputModeController](IPUIKeyboardInputModeController(), "sharedInputModeController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "normalizedEnabledInputModeIdentifiers");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v46 = v13;
    if ((objc_msgSend(v13, "containsObject:", v10) & 1) == 0)
    {
      IPUIKeyboardInputModeGetBaseLanguage(v10);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v14, "isEqualToString:", CFSTR("zh")))
      {
        IPUIKeyboardInputModeGetLanguageWithRegion(v10);
        v15 = objc_claimAutoreleasedReturnValue();

        v14 = (void *)v15;
      }
      v53 = 0u;
      v54 = 0u;
      v51 = 0u;
      v52 = 0u;
      v16 = v13;
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v51, v60, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v52;
        while (2)
        {
          for (i = 0; i != v18; ++i)
          {
            if (*(_QWORD *)v52 != v19)
              objc_enumerationMutation(v16);
            v21 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
            IPUIKeyboardInputModeGetBaseLanguage(v21);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v22, "isEqualToString:", CFSTR("zh")))
            {
              IPUIKeyboardInputModeGetLanguageWithRegion(v21);
              v23 = objc_claimAutoreleasedReturnValue();

              v22 = (void *)v23;
            }
            if (objc_msgSend(v14, "isEqualToString:", v22))
            {
              v24 = v21;

              v10 = v24;
              goto LABEL_30;
            }

          }
          v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v51, v60, 16);
          if (v18)
            continue;
          break;
        }
      }
LABEL_30:

    }
    -[objc_class sharedInputModeController](IPUIKeyboardInputModeController(), "sharedInputModeController");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "supportedInputModeIdentifiers");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    IPUIKeyboardInputModeGetNormalizedIdentifier(v10);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = v26;
    v28 = objc_msgSend(v26, "containsObject:", v27);

    if ((v28 & 1) == 0)
    {
      IPUIKeyboardInputMode_Intl();
      v29 = objc_claimAutoreleasedReturnValue();

      v10 = (void *)v29;
    }
    v30 = (void *)MEMORY[0x1E0C99DE8];
    IPUIKeyboardInputModeGetIdentifierWithKeyboardLayouts(v10);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "arrayWithObject:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    -[objc_class sharedInputModeController](IPUIKeyboardInputModeController(), "sharedInputModeController");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "activeInputModeIdentifiers");
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v47, v59, 16);
    if (v35)
    {
      v36 = v35;
      v37 = 0;
      v38 = *(_QWORD *)v48;
      do
      {
        for (j = 0; j != v36; ++j)
        {
          if (*(_QWORD *)v48 != v38)
            objc_enumerationMutation(v34);
          v40 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * j);
          IPUIKeyboardCanonicalInputModeName(v40);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v10, "isEqualToString:", v41))
          {
            if (v37)
            {
              objc_msgSend(v32, "insertObject:atIndex:", v40, v37++);
            }
            else
            {
              objc_msgSend(v32, "replaceObjectAtIndex:withObject:", 0, v40);
              v37 = 1;
            }
          }
          else
          {
            objc_msgSend(v32, "addObject:", v40);
          }

        }
        v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v47, v59, 16);
      }
      while (v36);
    }

    -[objc_class sharedPreferencesController](IPUIKeyboardPreferencesController(), "sharedPreferencesController");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "saveInputModes:", v32);

    CFPreferencesSetAppValue(CFSTR("KeyboardLastUsed"), 0, CFSTR("com.apple.Preferences"));
    v1 = v45;
  }

}

+ (id)_sanitizedLanguageIdentifierFromKeyboardLanguage:()IntlPreferencesAdditions
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x1E0C99DC8];
  v5 = a3;
  objc_msgSend(v4, "currentLocale");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_sanitizedLanguageIdentifierFromKeyboardLanguage:currentLocale:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)_sanitizedLanguageIdentifierFromKeyboardLanguage:()IntlPreferencesAdditions currentLocale:
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *i;
  uint64_t v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  char v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v33;
  id v34;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!objc_msgSend(v6, "length"))
  {
    v10 = 0;
    goto LABEL_26;
  }
  objc_msgSend(MEMORY[0x1E0C99DC8], "componentsFromLocaleIdentifier:", v6);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "objectForKeyedSubscript:", *MEMORY[0x1E0C997E8]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  objc_msgSend(a1, "renderableUILanguages");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
  if (!v10)
    goto LABEL_25;
  v33 = v7;
  v34 = v6;
  v11 = *(_QWORD *)v37;
  v12 = *MEMORY[0x1E0C99820];
  while (2)
  {
    for (i = 0; i != v10; i = (char *)i + 1)
    {
      if (*(_QWORD *)v37 != v11)
        objc_enumerationMutation(v9);
      v14 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * (_QWORD)i);
      objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "languageCode");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v8, "isEqualToString:", v16);

      if (v17)
      {
        objc_msgSend(v35, "objectForKeyedSubscript:", v12);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v18;
        if (v18)
        {
          v20 = v18;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C99DC8], "scriptCodeFromLanguage:", v34);
          v20 = (id)objc_claimAutoreleasedReturnValue();
        }
        v21 = v20;

        objc_msgSend(v15, "scriptCode");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = v22;
        if (v22)
        {
          v24 = v22;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C99DC8], "scriptCodeFromLanguage:", v14);
          v24 = (id)objc_claimAutoreleasedReturnValue();
        }
        v25 = v24;

        v26 = objc_msgSend(v21, "isEqualToString:", v25);
        if ((v26 & 1) != 0)
        {

          v27 = *MEMORY[0x1E0C997B0];
          v7 = v33;
          objc_msgSend(v33, "objectForKey:", *MEMORY[0x1E0C997B0]);
          v9 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "objectForKeyedSubscript:", v27);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99DC8], "systemLanguages");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v6 = v34;
          objc_msgSend(MEMORY[0x1E0C99DC8], "canonicalLanguageIdentifierFromString:", v34);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v29, "containsObject:", v30) & 1) != 0)
          {
            v31 = objc_msgSend(v28, "length");

            if (!v31)
            {
LABEL_24:
              objc_msgSend(MEMORY[0x1E0C99DC8], "languageFromLanguage:byReplacingRegion:", v34, v9);
              v10 = (void *)objc_claimAutoreleasedReturnValue();

              goto LABEL_25;
            }
            v29 = v9;
            v9 = v28;
          }
          else
          {

          }
          goto LABEL_24;
        }
      }

    }
    v10 = (void *)objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    if (v10)
      continue;
    break;
  }
  v7 = v33;
  v6 = v34;
LABEL_25:

LABEL_26:
  return v10;
}

+ (id)languageIdentifierForRegisteringPreferredLanguageFromAddedKeyboardLanguage:()IntlPreferencesAdditions forPreferredLanguages:
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  char v15;
  int v16;
  void *v17;
  void *v18;
  int v19;
  id v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(a1, "_sanitizedLanguageIdentifierFromKeyboardLanguage:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0C99DC8], "baseLanguageFromLanguage:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v9 = v6;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v23;
      while (2)
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v23 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(MEMORY[0x1E0C99DC8], "baseLanguageFromLanguage:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i), (_QWORD)v22);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "isEqualToString:", v8);

          if ((v15 & 1) != 0)
          {
            v16 = 0;
            goto LABEL_12;
          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
        if (v11)
          continue;
        break;
      }
    }
    v16 = 1;
LABEL_12:

    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "bundleIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "isEqualToString:", CFSTR("com.apple.purplebuddy"));

    if (v19)
    {
      if ((v16 & (objc_msgSend(v8, "isEqualToString:", CFSTR("en")) ^ 1) & 1) == 0)
      {
LABEL_14:
        v20 = 0;
LABEL_18:

        goto LABEL_19;
      }
    }
    else if (!v16)
    {
      goto LABEL_14;
    }
    v20 = v7;
    goto LABEL_18;
  }
  v20 = 0;
LABEL_19:

  return v20;
}

+ (void)registerPreferredLanguageForAddedKeyboardLanguage:()IntlPreferencesAdditions
{
  void *v4;
  id v5;
  void *v6;
  double v7;
  void *v8;
  id v9;

  v4 = (void *)MEMORY[0x1E0C99DC8];
  v5 = a3;
  objc_msgSend(v4, "_globalPreferredLanguages");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "languageIdentifierForRegisteringPreferredLanguageFromAddedKeyboardLanguage:forPreferredLanguages:", v5, v6);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  v8 = v9;
  if (v9)
  {
    LODWORD(v7) = *MEMORY[0x1E0CB2D48];
    objc_msgSend(MEMORY[0x1E0C99DC8], "registerPreferredLanguage:usage:confidence:", v9, 2, v7);
    v8 = v9;
  }

}

+ (void)unregisterPreferredLanguageForKeyboardLanguage:()IntlPreferencesAdditions
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  void *v9;
  int v10;
  BOOL v11;
  void *v12;
  id v13;

  objc_msgSend(a1, "_sanitizedLanguageIdentifierFromKeyboardLanguage:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v13 = v4;
    objc_msgSend(MEMORY[0x1E0C99DC8], "_globalPreferredLanguages");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v5, "count") >= 2)
    {
      v6 = objc_msgSend(v5, "indexOfObject:", v13);
      v7 = v6;
      if (v6)
        v8 = v6 == 0x7FFFFFFFFFFFFFFFLL;
      else
        v8 = 1;
      if (v8)
      {
        v10 = 0;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99DC8], "baseLanguageFromLanguage:", v13);
        v1 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = (void *)MEMORY[0x1E0C99DC8];
        objc_msgSend(MEMORY[0x1E0C99DC8], "_deviceLanguage");
        v2 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "baseLanguageFromLanguage:", v2);
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v1, "isEqualToString:", v3) ^ 1;
      }
      if (v7)
        v11 = v7 == 0x7FFFFFFFFFFFFFFFLL;
      else
        v11 = 1;
      if (!v11)
      {

        if (!v10)
          goto LABEL_16;
        goto LABEL_15;
      }
      if (v10)
      {
LABEL_15:
        v12 = (void *)objc_msgSend(v5, "mutableCopy");
        objc_msgSend(v12, "removeObjectAtIndex:", v7);
        objc_msgSend(MEMORY[0x1E0C99DC8], "setPreferredLanguages:", v12);

      }
    }
LABEL_16:

    v4 = v13;
  }

}

- (id)localeByChangingLanguageTo:()IntlPreferencesAdditions
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = (void *)MEMORY[0x1E0C99DC8];
  v5 = a3;
  v6 = (void *)objc_opt_class();
  objc_msgSend(a1, "localeIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "canonicalLocaleIdentifier:withNewLanguageIdentifier:", v7, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "localeWithLocaleIdentifier:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (uint64_t)archivedPreferences
{
  return objc_msgSend(a1, "archivedPreferencesWithHash:", 0);
}

+ (uint64_t)archivedPreferencesForTargetPlatform:()IntlPreferencesAdditions
{
  return objc_msgSend(a1, "_archivedPreferencesWithOverridingLanguages:targetPlatform:hash:", 0, a3, 0);
}

+ (uint64_t)archivedPreferencesWithHash:()IntlPreferencesAdditions
{
  return objc_msgSend(a1, "_archivedPreferencesWithOverridingLanguages:targetPlatform:hash:", 0, 0, a3);
}

+ (id)_archivedPreferencesWithOverridingLanguages:()IntlPreferencesAdditions targetPlatform:hash:
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  CC_SHA1_CTX v29;
  unsigned __int8 md[20];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  memset(&v29, 0, sizeof(v29));
  CC_SHA1_Init(&v29);
  if (objc_msgSend(v7, "count"))
  {
    v10 = (void *)objc_msgSend(v7, "copy");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "count");

    if (!v12)
      goto LABEL_6;
    objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v13, "copy");

  }
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, CFSTR("AppleLanguages"));
  IP_hashKeyValue(&v29, CFSTR("AppleLanguages"), v10);

LABEL_6:
  objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLocale");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "localeIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "length"))
  {
    if (a4 >= 2)
    {
      objc_msgSend(v14, "calendarIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      +[IntlUtility _supportedCalendarsOnEmbeddedSystems](IntlUtility, "_supportedCalendarsOnEmbeddedSystems");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "containsObject:", v16);

      if ((v18 & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0C99DC8], "componentsFromLocaleIdentifier:", v15);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = (void *)objc_msgSend(v19, "mutableCopy");

        objc_msgSend(v20, "setObject:forKeyedSubscript:", *MEMORY[0x1E0C996C8], CFSTR("calendar"));
        objc_msgSend(MEMORY[0x1E0C99DC8], "localeIdentifierFromComponents:", v20);
        v21 = objc_claimAutoreleasedReturnValue();

        v15 = (void *)v21;
      }

    }
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v15, CFSTR("AppleLocale"));
    IP_hashKeyValue(&v29, CFSTR("AppleLocale"), v15);
  }

  objc_msgSend(MEMORY[0x1E0C99DC8], "_preferredTemperatureUnit");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v22, "length"))
  {
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v22, CFSTR("AppleTemperatureUnit"));
    IP_hashKeyValue(&v29, CFSTR("AppleTemperatureUnit"), v22);
  }

  v23 = *MEMORY[0x1E0CB2B58];
  objc_msgSend(v9, "objectForKey:inDomain:", CFSTR("AppleICUForce12HourTime"), *MEMORY[0x1E0CB2B58]);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v24, CFSTR("AppleICUForce12HourTime"));
    IP_hashKeyValue(&v29, CFSTR("AppleICUForce12HourTime"), v24);
  }

  objc_msgSend(v9, "objectForKey:inDomain:", CFSTR("AppleICUForce24HourTime"), v23);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (v25)
  {
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v25, CFSTR("AppleICUForce24HourTime"));
    IP_hashKeyValue(&v29, CFSTR("AppleICUForce24HourTime"), v25);
  }

  objc_msgSend(MEMORY[0x1E0CB3B68], "_currentGlobalUserInflectionIfAvailable");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "externalRepresentation");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (v27)
  {
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v27, CFSTR("ArchivedInflection"));
    IP_hashKeyValue(&v29, CFSTR("ArchivedInflection"), v27);
  }

  CC_SHA1_Final(md, &v29);
  if (a5)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", md, 20);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

+ (id)_hashesFromAppPreferences:()IntlPreferencesAdditions
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _QWORD v24[2];
  _QWORD v25[2];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v18 = v4;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v21 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
          objc_msgSend(v6, "objectForKeyedSubscript:", v11, v18);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = 0;
          v13 = (id)objc_msgSend(a1, "_archivedPreferencesWithOverridingLanguages:targetPlatform:hash:", v12, 0, &v19);
          v24[0] = CFSTR("AppleLanguages");
          v24[1] = CFSTR("hash");
          v25[0] = v12;
          v25[1] = v19;
          v14 = (void *)MEMORY[0x1E0C99D80];
          v15 = v19;
          objc_msgSend(v14, "dictionaryWithObjects:forKeys:count:", v25, v24, 2);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v16, v11);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
      }
      while (v8);
    }

    v4 = v18;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (void)archivedPreferencesWithHashesForBundleIDs:()IntlPreferencesAdditions reply:
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __86__NSLocale_IntlPreferencesAdditions__archivedPreferencesWithHashesForBundleIDs_reply___block_invoke;
  v8[3] = &unk_1E7069568;
  v9 = v6;
  v10 = a1;
  v7 = v6;
  +[IntlUtility preferredLanguagesForBundleIDs:reply:](IntlUtility, "preferredLanguagesForBundleIDs:reply:", a3, v8);

}

+ (id)archivedPreferencesWithHashesForBundleIDs:()IntlPreferencesAdditions
{
  void *v2;
  void *v3;

  +[IntlUtility preferredLanguagesForBundleIDs:](IntlUtility, "preferredLanguagesForBundleIDs:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_hashesFromAppPreferences:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (void)setArchivedPreferences:()IntlPreferencesAdditions
{
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
  void *v13;
  uint64_t v14;
  void *v15;
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;

  v21 = a3;
  objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("AppleLanguages"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("AppleLanguages"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v4, "count"))
      objc_msgSend(MEMORY[0x1E0C99DC8], "setPreferredLanguages:", v4);

  }
  objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("AppleLocale"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("AppleLocale"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v6, "length"))
      objc_msgSend(MEMORY[0x1E0C99DC8], "setLocaleOnly:", v6);

  }
  objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("AppleTemperatureUnit"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = v21;
  if (v7)
  {
    objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("AppleTemperatureUnit"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v9, "length"))
      objc_msgSend(MEMORY[0x1E0C99DC8], "_setPreferredTemperatureUnit:", v9);

    v8 = v21;
  }
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("AppleICUForce12HourTime"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {

  }
  else
  {
    objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("AppleICUForce24HourTime"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
      goto LABEL_20;
  }
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("AppleICUForce12HourTime"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = *MEMORY[0x1E0CB2B58];
  objc_msgSend(v12, "setObject:forKey:inDomain:", v13, CFSTR("AppleICUForce12HourTime"), *MEMORY[0x1E0CB2B58]);

  objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("AppleICUForce24HourTime"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKey:inDomain:", v15, CFSTR("AppleICUForce24HourTime"), v14);

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("AppleTimePreferencesChangedNotification"), 0, 0, 1u);
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("SignificantTimeChangeNotification"), 0, 0, 1u);

LABEL_20:
  objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("ArchivedInflection"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    v18 = objc_alloc(MEMORY[0x1E0CB3B68]);
    objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("ArchivedInflection"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v18, "initWithExternalRepresentation:error:", v19, 0);

    if (v20)
      objc_msgSend(v20, "_setAsGlobalUserInflection");

  }
}

- (id)selectableScriptCodes
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
  id v12;

  if (selectableScriptCodes_onceToken != -1)
    dispatch_once(&selectableScriptCodes_onceToken, &__block_literal_global_84);
  v2 = (void *)MEMORY[0x1E0C99DC8];
  objc_msgSend(a1, "localeIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "componentsFromLocaleIdentifier:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0C997E8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0C99DC8];
  objc_msgSend(a1, "localeIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addLikelySubtagsForLocaleIdentifier:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DC8], "componentsFromLocaleIdentifier:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0C99820]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)selectableScriptCodes_selectableScriptCodes, "objectForKeyedSubscript:", v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "containsObject:", v10))
    v12 = v11;
  else
    v12 = 0;

  return v12;
}

- (id)optionNameForSelectableScripts
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;

  v1 = (void *)MEMORY[0x1E0C99DC8];
  objc_msgSend(a1, "localeIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "componentsFromLocaleIdentifier:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0C997E8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v3) = objc_msgSend(v4, "isEqualToString:", CFSTR("my"));
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if ((_DWORD)v3)
    v7 = CFSTR("ENCODING");
  else
    v7 = CFSTR("SCRIPT");
  objc_msgSend(v5, "localizedStringForKey:value:table:", v7, &stru_1E70697F8, CFSTR("LocalizedSelectableScripts"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)optionNameWithColonForSelectableScripts
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;

  v1 = (void *)MEMORY[0x1E0C99DC8];
  objc_msgSend(a1, "localeIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "componentsFromLocaleIdentifier:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0C997E8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v3) = objc_msgSend(v4, "isEqualToString:", CFSTR("my"));
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if ((_DWORD)v3)
    v7 = CFSTR("ENCODING_COLON");
  else
    v7 = CFSTR("SCRIPT_COLON");
  objc_msgSend(v5, "localizedStringForKey:value:table:", v7, &stru_1E70697F8, CFSTR("LocalizedSelectableScripts"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)explanationTextForSelectableScripts
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v1 = (void *)MEMORY[0x1E0C99DC8];
  objc_msgSend(a1, "localeIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "componentsFromLocaleIdentifier:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0C997E8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "isEqualToString:", CFSTR("my")))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("ZAWGYI_EXPLANATION_TEXT"), &stru_1E70697F8, CFSTR("LocalizedSelectableScripts"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)displayNameForSelectableScriptCode:()IntlPreferencesAdditions
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB34D0];
  v4 = a3;
  objc_msgSend(v3, "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", v4, &stru_1E70697F8, CFSTR("LocalizedSelectableScripts"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (void)setLocaleOnly:()IntlPreferencesAdditions .cold.1(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLocale");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localeIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138543618;
  v5 = a1;
  v6 = 2114;
  v7 = v3;
  _os_log_fault_impl(&dword_1B96C1000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Invalid locale %{public}@. Current locale is %{public}@.", (uint8_t *)&v4, 0x16u);

}

@end
