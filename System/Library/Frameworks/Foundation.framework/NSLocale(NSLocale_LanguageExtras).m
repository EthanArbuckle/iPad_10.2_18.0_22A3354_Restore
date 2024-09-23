@implementation NSLocale(NSLocale_LanguageExtras)

+ (uint64_t)_deviceLanguage
{
  return objc_msgSend(MEMORY[0x1E0C99DC8], "__effectiveLanguageForBundle:", _NSFoundationBundle());
}

+ (uint64_t)systemLanguages
{
  return 0x1E0FCCAC0;
}

+ (uint64_t)__effectiveLanguageForBundle:()NSLocale_LanguageExtras
{
  const __CFString *v4;
  const __CFString *v5;
  void *v6;
  id v7;
  uint64_t v8;

  v4 = (const __CFString *)*MEMORY[0x1E0C9B228];
  v5 = (const __CFString *)*MEMORY[0x1E0C9B230];
  v6 = (void *)CFPreferencesCopyValue(CFSTR("AppleLanguages"), (CFStringRef)*MEMORY[0x1E0C9B228], (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);
  if (!objc_msgSend(v6, "count"))
  {
    if (v6)
      CFRelease(v6);
    v6 = (void *)CFPreferencesCopyValue(CFSTR("AppleLanguages"), v4, (CFStringRef)*MEMORY[0x1E0C9B240], v5);
  }
  v7 = -[NSArray firstObject](+[NSBundle preferredLocalizationsFromArray:forPreferences:](NSBundle, "preferredLocalizationsFromArray:forPreferences:", objc_msgSend(a3, "localizations"), v6), "firstObject");
  v8 = objc_msgSend(MEMORY[0x1E0C99DC8], "canonicalLanguageIdentifierFromString:", v7);
  if (v6)
    CFRelease(v6);
  return v8;
}

+ (void)mostPreferredLanguageOf:()NSLocale_LanguageExtras withPreferredLanguages:forUsage:options:
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t BaseLanguageIdentifierFromIdentifier;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _BYTE v22[128];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  if ((a6 & 4) != 0)
  {
    v11 = (void *)objc_opt_new();
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v12 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v28, v27, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v29 != v14)
            objc_enumerationMutation(a3);
          BaseLanguageIdentifierFromIdentifier = GetBaseLanguageIdentifierFromIdentifier(*(void **)(*((_QWORD *)&v28 + 1)
                                                                                                  + 8 * i));
          if (BaseLanguageIdentifierFromIdentifier)
            objc_msgSend(v11, "addObject:", BaseLanguageIdentifierFromIdentifier);
        }
        v13 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v28, v27, 16);
      }
      while (v13);
    }
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v17 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v23, v22, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v24;
LABEL_18:
      v20 = 0;
      while (1)
      {
        if (*(_QWORD *)v24 != v19)
          objc_enumerationMutation(a4);
        v10 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v20);
        if ((objc_msgSend(v11, "containsObject:", GetBaseLanguageIdentifierFromIdentifier(v10)) & 1) != 0)
          break;
        if (v18 == ++v20)
        {
          v18 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v23, v22, 16);
          if (v18)
            goto LABEL_18;
          goto LABEL_24;
        }
      }
    }
    else
    {
LABEL_24:
      v10 = 0;
    }

  }
  else
  {
    v8 = -[NSArray firstObject](+[NSBundle preferredLocalizationsFromArray:forPreferences:](NSBundle, "preferredLocalizationsFromArray:forPreferences:", a3, a4), "firstObject");
    if (v8 && (v9 = v8, MatchesBaseLanguageInLanguageIDs(v8, a3)))
    {
      if (MatchesBaseLanguageInLanguageIDs(v9, a4))
        return v9;
      else
        return 0;
    }
    else
    {
      return 0;
    }
  }
  return v10;
}

+ (id)_preferredTemperatureUnit
{
  return (id)_CFLocaleCopyPreferredTemperatureUnit();
}

+ (id)preferredLocale
{
  return (id)_CFLocaleCopyPreferred();
}

+ (uint64_t)mostPreferredLanguageOf:()NSLocale_LanguageExtras forUsage:options:
{
  return objc_msgSend(a1, "mostPreferredLanguageOf:withPreferredLanguages:forUsage:options:", a3, objc_msgSend(a1, "preferredLanguages"), a4, a5);
}

+ (void)setPreferredLanguages:()NSLocale_LanguageExtras
{
  _SetPreferredLanguages(a3);
}

+ (void)registerPreferredLanguage:()NSLocale_LanguageExtras usage:confidence:
{
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const void *v10;
  void *v11;

  v7 = _NormalizedLanguageIDFromString(a4);
  if ((a5 & 3) != 0 && a1 > 0.5)
  {
    v8 = v7;
    v9 = (void *)_CFLocaleCopyPreferredLanguagesForCurrentUser();
    if (v9)
    {
      v10 = v9;
      v11 = (void *)objc_msgSend(v9, "mutableCopy");
      if ((objc_msgSend(v11, "containsObject:", v8) & 1) == 0)
      {
        objc_msgSend(v11, "addObject:", v8);
        _SetPreferredLanguages(v11);
      }

      CFRelease(v10);
    }
  }
}

+ (uint64_t)_setPreferredMeasurementSystem:()NSLocale_LanguageExtras
{
  return _CFLocaleSetPreferredMeasurementSystem();
}

+ (id)_preferredMeasurementSystem
{
  return (id)_CFLocaleCopyPreferredMeasurementSystem();
}

+ (uint64_t)_setPreferredTemperatureUnit:()NSLocale_LanguageExtras
{
  return _CFLocaleSetPreferredTemperatureUnit();
}

@end
