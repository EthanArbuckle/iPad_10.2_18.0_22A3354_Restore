@implementation IntlUtility

+ (id)sharedIntlUtility
{
  if (sharedIntlUtility_onceToken != -1)
    dispatch_once(&sharedIntlUtility_onceToken, &__block_literal_global_3);
  return (id)sharedIntlUtility_sIntlUtility;
}

- (id)languageList
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __27__IntlUtility_languageList__block_invoke;
  block[3] = &unk_1E7068DF0;
  block[4] = self;
  if (languageList___onceToken != -1)
    dispatch_once(&languageList___onceToken, block);
  return (id)languageList___languageToNativeNameMap;
}

- (id)localizedNameForScript:(signed __int16)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Script-%d"), a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", v3, &stru_1E70697F8, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)localizedLanguageForLanguage:(id)a3
{
  return -[IntlUtility displayNameForLanguage:context:displayLanguage:](self, "displayNameForLanguage:context:displayLanguage:", a3, 3, 0);
}

- (BOOL)canRenderLanguage:(id)a3
{
  id v3;
  CTFontRef UIFontForLanguage;
  const __CTFont *v5;
  void *v6;
  const __CFString *v7;
  __CFString *v8;
  const __CTFont *v9;
  const __CTFont *v10;
  CFStringRef v11;
  CFStringRef v12;
  BOOL v13;
  CFRange v15;

  v3 = a3;
  UIFontForLanguage = CTFontCreateUIFontForLanguage(kCTFontUIFontSystem, 12.0, 0);
  if (UIFontForLanguage)
  {
    v5 = UIFontForLanguage;
    objc_msgSend((id)objc_opt_class(), "normalizedLanguageIDFromString:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DC8], "exemplarForLanguage:", v6);
    v7 = (const __CFString *)objc_claimAutoreleasedReturnValue();
    v8 = (__CFString *)v7;
    if (v7
      && (v15.length = CFStringGetLength(v7), v15.location = 0, (v9 = CTFontCreateForString(v5, v8, v15)) != 0))
    {
      v10 = v9;
      v11 = CTFontCopyName(v9, (CFStringRef)*MEMORY[0x1E0CA83C0]);
      if (v11)
      {
        v12 = v11;
        v13 = CFEqual(v11, CFSTR("LastResort")) == 0;
        CFRelease(v12);
      }
      else
      {
        v13 = 1;
      }
      CFRelease(v10);
    }
    else
    {
      v13 = 0;
    }
    CFRelease(v5);

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

void __32__IntlUtility_sharedIntlUtility__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedIntlUtility_sIntlUtility;
  sharedIntlUtility_sIntlUtility = v0;

}

+ (id)stdLanguageIDs
{
  if (stdLanguageIDs_onceToken != -1)
    dispatch_once(&stdLanguageIDs_onceToken, &__block_literal_global_2);
  return (id)stdLanguageIDs_sStdLanguageIDs;
}

void __29__IntlUtility_stdLanguageIDs__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0C99DC8], "supportedLanguages");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)stdLanguageIDs_sStdLanguageIDs;
  stdLanguageIDs_sStdLanguageIDs = v0;

}

+ (id)baseSystemLanguages
{
  return (id)objc_msgSend(MEMORY[0x1E0C99DC8], "baseSystemLanguages");
}

+ (id)languageIdentifierFromIdentifier:(id)a3 withRegion:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x1E0C99DC8], "languageFromLanguage:byReplacingRegion:", a3, a4);
}

+ (id)baseLanguageIdentifierFromIdentifier:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0C99DC8], "baseLanguageFromLanguage:", a3);
}

+ (id)normalizedLanguageIDFromString:(id)a3
{
  id v4;
  void *v5;
  int v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)();
  void *v20;
  id v21;
  uint64_t block;
  uint64_t v23;
  void (*v24)();
  void *v25;
  id v26;

  v4 = a3;
  if (v4
    && (objc_msgSend((id)objc_opt_class(), "stdLanguageIDs"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "containsObject:", v4),
        v5,
        !v6)
    && (objc_msgSend(MEMORY[0x1E0C99DC8], "canonicalLanguageIdentifierFromString:", v4),
        (v7 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v8 = (void *)v7;
    v9 = MEMORY[0x1E0C809B0];
    block = MEMORY[0x1E0C809B0];
    v23 = 3221225472;
    v24 = __46__IntlUtility_normalizedLanguageIDFromString___block_invoke;
    v25 = &__block_descriptor_40_e5_v8__0l;
    v26 = a1;
    if (normalizedLanguageIDFromString____onceTokenForSpecialIDReplacements != -1)
      dispatch_once(&normalizedLanguageIDFromString____onceTokenForSpecialIDReplacements, &block);
    if (normalizedLanguageIDFromString__sSpecialIDReplacements
      && (objc_msgSend((id)normalizedLanguageIDFromString__sSpecialIDReplacements, "objectForKey:", v8),
          (v10 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v11 = (id)v10;
    }
    else
    {
      v17 = v9;
      v18 = 3221225472;
      v19 = __46__IntlUtility_normalizedLanguageIDFromString___block_invoke_2;
      v20 = &__block_descriptor_40_e5_v8__0l;
      v21 = a1;
      if (normalizedLanguageIDFromString____onceTokenForCanonicalLanguageIDs != -1)
        dispatch_once(&normalizedLanguageIDFromString____onceTokenForCanonicalLanguageIDs, &v17);
      v13 = objc_msgSend((id)normalizedLanguageIDFromString__sCanonicalLanguageIDs, "indexOfObject:", v8, v17, v18, v19, v20, v21, block, v23, v24, v25, v26);
      if (v13 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v14 = v13;
        objc_msgSend((id)objc_opt_class(), "stdLanguageIDs");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectAtIndex:", v14);
        v16 = objc_claimAutoreleasedReturnValue();

        v8 = (void *)v16;
      }
      v11 = v8;
      v8 = v11;
    }

  }
  else
  {
    v11 = v4;
  }

  return v11;
}

void __46__IntlUtility_normalizedLanguageIDFromString___block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  v0 = (void *)MEMORY[0x1E0C99D80];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLForResource:withExtension:", CFSTR("LanguageCodeExceptions"), CFSTR("plist"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "dictionaryWithContentsOfURL:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)normalizedLanguageIDFromString__sSpecialIDReplacements;
  normalizedLanguageIDFromString__sSpecialIDReplacements = v2;

}

void __46__IntlUtility_normalizedLanguageIDFromString___block_invoke_2()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99DE8];
  objc_msgSend((id)objc_opt_class(), "stdLanguageIDs");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "arrayWithCapacity:", objc_msgSend(v1, "count"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  objc_msgSend((id)objc_opt_class(), "stdLanguageIDs", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(MEMORY[0x1E0C99DC8], "canonicalLanguageIdentifierFromString:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v7));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "addObject:", v8);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v2);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)normalizedLanguageIDFromString__sCanonicalLanguageIDs;
  normalizedLanguageIDFromString__sCanonicalLanguageIDs = v9;

}

+ (id)capitalizeFirstWordOfName:(id)a3 accordingToLanguage:(id)a4
{
  id v5;
  void *v6;
  unsigned int v7;
  uint64_t v8;
  id v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _BYTE v17[256];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0C99DC8], "canonicalLanguageIdentifierFromString:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "length");
  if (v7 >= 0x80)
    v8 = 128;
  else
    v8 = v7;
  objc_msgSend(v5, "getCharacters:range:", v17, 0, v8);
  v9 = objc_retainAutorelease(v6);
  objc_msgSend(v9, "UTF8String");
  ubrk_open();
  ubrk_first();
  v10 = ubrk_next();
  ubrk_close();
  objc_msgSend(v5, "substringToIndex:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "capitalizedStringWithLocale:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "substringFromIndex:", v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringByAppendingString:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (id)alternateContinentOfRegion:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;

  v3 = alternateContinentOfRegion__onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&alternateContinentOfRegion__onceToken, &__block_literal_global_12);
  objc_msgSend((id)alternateContinentOfRegion__sAltContinentsForRegion, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __42__IntlUtility_alternateContinentOfRegion___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", CFSTR("AM"), CFSTR("150"), CFSTR("CY"), CFSTR("142"), CFSTR("EG"), CFSTR("150"), CFSTR("GE"), CFSTR("150"), CFSTR("GL"), CFSTR("150"), CFSTR("TR"), CFSTR("142"), CFSTR("RU"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)alternateContinentOfRegion__sAltContinentsForRegion;
  alternateContinentOfRegion__sAltContinentsForRegion = v0;

}

+ (void)enumeratePreferredCalendarsForLocaleID:(id)a3 usingBlock:(id)a4
{
  id v5;
  void (**v6)(_QWORD, _QWORD, _QWORD);
  uint64_t v7;
  void *v8;
  char v9;
  int v10;

  v5 = a4;
  v6 = (void (**)(_QWORD, _QWORD, _QWORD))v5;
  if (a3 && v5)
  {
    v10 = 0;
    objc_msgSend(objc_retainAutorelease(a3), "UTF8String");
    ucal_getKeywordValuesForLocale();
    v9 = 0;
    do
    {
      v7 = uenum_next();
      if (!v7)
        break;
      if (v10 > 0)
        break;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *, char *))v6)[2](v6, v8, &v9);

    }
    while (!v9);
    uenum_close();
  }

}

+ (id)defaultCalendarForLocaleID:(id)a3
{
  id v4;

  objc_msgSend(objc_retainAutorelease(a3), "UTF8String");
  uloc_getBaseName();
  ucal_open();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", ucal_getType());
  v4 = (id)objc_claimAutoreleasedReturnValue();
  ucal_close();
  if (!v4)
    v4 = (id)*MEMORY[0x1E0C996C8];
  return v4;
}

+ (id)lunarCalendarsForLocaleID:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  __CFString *v16;
  _QWORD block[5];

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__IntlUtility_lunarCalendarsForLocaleID___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (lunarCalendarsForLocaleID__onceToken != -1)
    dispatch_once(&lunarCalendarsForLocaleID__onceToken, block);
  if ((objc_msgSend((id)lunarCalendarsForLocaleID__sLunarCalendarList, "containsObject:", CFSTR("islamic")) & 1) != 0)
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x3032000000;
    v14 = __Block_byref_object_copy_;
    v15 = __Block_byref_object_dispose_;
    v16 = CFSTR("islamic-civil");
    v10[0] = v5;
    v10[1] = 3221225472;
    v10[2] = __41__IntlUtility_lunarCalendarsForLocaleID___block_invoke_43;
    v10[3] = &unk_1E7069198;
    v10[4] = &v11;
    +[IntlUtility enumeratePreferredCalendarsForLocaleID:usingBlock:](IntlUtility, "enumeratePreferredCalendarsForLocaleID:usingBlock:", v4, v10);
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend((id)lunarCalendarsForLocaleID__sLunarCalendarList, "count"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setArray:", lunarCalendarsForLocaleID__sLunarCalendarList);
    v7 = objc_msgSend(v6, "indexOfObject:", CFSTR("islamic"));
    objc_msgSend(v6, "replaceObjectAtIndex:withObject:", v7, v12[5]);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    _Block_object_dispose(&v11, 8);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", lunarCalendarsForLocaleID__sLunarCalendarList);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

void __41__IntlUtility_lunarCalendarsForLocaleID___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;

  v0 = (void *)MEMORY[0x1E0C99D20];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "URLForResource:withExtension:", CFSTR("LunarCalendars"), CFSTR("plist"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "arrayWithContentsOfURL:", v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)lunarCalendarsForLocaleID__sLunarCalendarList;
  lunarCalendarsForLocaleID__sLunarCalendarList = v3;

  if (!lunarCalendarsForLocaleID__sLunarCalendarList)
  {
    lunarCalendarsForLocaleID__sLunarCalendarList = (uint64_t)&unk_1E706DD10;

  }
}

void __41__IntlUtility_lunarCalendarsForLocaleID___block_invoke_43(uint64_t a1, void *a2, _BYTE *a3)
{
  id v6;

  v6 = a2;
  if (objc_msgSend(v6, "hasPrefix:", CFSTR("islamic-")))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    *a3 = 1;
  }

}

+ (id)preferredLunarCalendarForLocaleID:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id *v9;
  uint64_t *v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *, _BYTE *);
  void *v18;
  id v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v3 = a3;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy_;
  v25 = __Block_byref_object_dispose_;
  v26 = 0;
  +[IntlUtility lunarCalendarsForLocaleID:](IntlUtility, "lunarCalendarsForLocaleID:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __49__IntlUtility_preferredLunarCalendarForLocaleID___block_invoke;
  v18 = &unk_1E70691C0;
  v5 = v4;
  v19 = v5;
  v20 = &v21;
  +[IntlUtility enumeratePreferredCalendarsForLocaleID:usingBlock:](IntlUtility, "enumeratePreferredCalendarsForLocaleID:usingBlock:", v3, &v15);
  v6 = (void *)v22[5];
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99DC8], "componentsFromLocaleIdentifier:", v3, v15, v16, v17, v18);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0C997E8]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((_isChineseLanguageCode(v8) & 1) != 0)
    {
      v9 = (id *)MEMORY[0x1E0C996A0];
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("ar")) & 1) != 0)
    {
      v9 = (id *)MEMORY[0x1E0C996F0];
    }
    else
    {
      if (!objc_msgSend(v8, "isEqualToString:", CFSTR("he")))
      {
LABEL_9:

        v6 = (void *)v22[5];
        goto LABEL_10;
      }
      v9 = (id *)MEMORY[0x1E0C996D0];
    }
    v10 = v22;
    v11 = *v9;
    v12 = (void *)v10[5];
    v10[5] = (uint64_t)v11;

    goto LABEL_9;
  }
LABEL_10:
  v13 = v6;

  _Block_object_dispose(&v21, 8);
  return v13;
}

void __49__IntlUtility_preferredLunarCalendarForLocaleID___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v6;

  v6 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "containsObject:"))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a3 = 1;
  }

}

+ (id)localeForCalendarID:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0C99DC8];
  v4 = a3;
  objc_msgSend(v3, "currentLocale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[IntlUtility localeForCalendarID:andLocale:](IntlUtility, "localeForCalendarID:andLocale:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)localeForCalendarID:(id)a3 andLocale:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  const __CFString *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v29[3];

  v29[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)MEMORY[0x1E0C99E08];
  v7 = (void *)MEMORY[0x1E0C99DC8];
  objc_msgSend(a4, "localeIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "componentsFromLocaleIdentifier:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dictionaryWithDictionary:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0C996A0]))
  {
    v11 = *MEMORY[0x1E0C997E8];
    objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0C997E8]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(&unk_1E706DD28, "containsObject:", v12);

    if ((v13 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "preferredLocalizationsFromArray:forPreferences:", &unk_1E706DD28, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "firstObject");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = *MEMORY[0x1E0C99820];
      v29[0] = v11;
      v29[1] = v16;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 2);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "removeObjectsForKeys:", v17);

      objc_msgSend(MEMORY[0x1E0C99DC8], "componentsFromLocaleIdentifier:", v15);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addEntriesFromDictionary:", v18);

    }
    objc_msgSend(v10, "objectForKeyedSubscript:", v11);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "isEqualToString:", CFSTR("zh"));

    if (v20)
    {
      v21 = CFSTR("hanidays");
LABEL_9:
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v21, CFSTR("numbers"));
    }
  }
  else if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0C996D0]))
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0C997E8]);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "isEqualToString:", CFSTR("he"));

    if (v23)
    {
      v21 = CFSTR("hebr");
      goto LABEL_9;
    }
  }
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v5, CFSTR("calendar"));
  v24 = (void *)MEMORY[0x1E0C99DC8];
  objc_msgSend(MEMORY[0x1E0C99DC8], "localeIdentifierFromComponents:", v10);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "canonicalLocaleIdentifierFromString:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  return v27;
}

+ (BOOL)isLunarCalendarDefaultOn
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0C99DC8];
  objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "canonicalLanguageIdentifierFromString:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a1) = objc_msgSend(a1, "isLunarCalendarDefaultOnForLanguage:locale:", v6, v7);

  return (char)a1;
}

+ (BOOL)isLunarCalendarDefaultOnForLanguage:(id)a3 locale:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  int isChineseLanguageCode;
  int v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;

  v6 = a4;
  v7 = *MEMORY[0x1E0C997B0];
  v8 = a3;
  objc_msgSend(v6, "objectForKey:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DC8], "componentsFromLocaleIdentifier:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0C997E8]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  isChineseLanguageCode = _isChineseLanguageCode(v11);
  if ((objc_msgSend(v11, "isEqualToString:", CFSTR("he")) & 1) != 0
    || objc_msgSend(v9, "isEqualToString:", CFSTR("IL"))
    && !objc_msgSend(v11, "isEqualToString:", CFSTR("ar")))
  {
    if (objc_msgSend(v11, "isEqualToString:", CFSTR("ar")))
      objc_msgSend(&unk_1E706DD40, "containsObject:", v9);
  }
  else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("ar")) & 1) != 0)
  {
    if (((objc_msgSend(&unk_1E706DD40, "containsObject:", v9) | isChineseLanguageCode) & 1) == 0)
    {
LABEL_8:
      LOBYTE(v13) = 0;
      goto LABEL_16;
    }
  }
  else if (!isChineseLanguageCode)
  {
    goto LABEL_8;
  }
  objc_msgSend(v6, "localeIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "preferredLunarCalendarForLocaleID:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "localeIdentifier");
  v16 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "defaultCalendarForLocaleID:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "supportedCalendars");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v16) = objc_msgSend(v18, "containsObject:", v17);

  if ((v16 & 1) == 0)
  {
    v19 = (id)*MEMORY[0x1E0C996C8];

    v17 = v19;
  }
  if (v15)
    v13 = objc_msgSend(v17, "isEqualToString:", v15) ^ 1;
  else
    LOBYTE(v13) = 1;

LABEL_16:
  return v13;
}

+ (int64_t)yearlessYearForMonth:(int64_t)a3 withCalendar:(id)a4
{
  void *v5;
  int64_t v6;

  objc_msgSend(a4, "calendarIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0C996D0]) & 1) != 0)
  {
    v6 = 6;
  }
  else if ((objc_msgSend(v5, "hasPrefix:", CFSTR("islamic")) & 1) != 0)
  {
    v6 = 7;
  }
  else if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0C996A0]))
  {
    v6 = chineseLeapMonthExtendedYears[a3];
  }
  else
  {
    v6 = 1604;
  }

  return v6;
}

+ (BOOL)isYearlessDate:(id)a3 forCalendar:(id)a4
{
  id v5;
  id v6;
  BOOL v7;
  int64_t v8;
  void *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "year") == 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = 1;
  }
  else
  {
    if (!v6)
    {
      objc_msgSend(v5, "calendar");
      v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    v8 = +[IntlUtility yearlessYearForMonth:withCalendar:](IntlUtility, "yearlessYearForMonth:withCalendar:", objc_msgSend(v5, "month"), v6);
    objc_msgSend(v6, "calendarIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0C996A0]);

    if (v10)
    {
      v11 = objc_msgSend(v5, "era");
      v12 = objc_msgSend(v5, "year") + 60 * v11 - 61;
    }
    else
    {
      v12 = objc_msgSend(v5, "year");
    }
    v7 = v8 == v12;
  }

  return v7;
}

+ (void)setYearlessYear:(id)a3 forCalendar:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  int v8;
  id v9;

  v9 = a3;
  v5 = a4;
  if (!v5)
  {
    objc_msgSend(v9, "calendar");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = +[IntlUtility yearlessYearForMonth:withCalendar:](IntlUtility, "yearlessYearForMonth:withCalendar:", objc_msgSend(v9, "month"), v5);
  objc_msgSend(v5, "calendarIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0C996A0]);

  if (v8)
  {
    objc_msgSend(v9, "setEra:", v6 / 60 + 1);
    v6 = v6 % 60 + 1;
  }
  objc_msgSend(v9, "setYear:", v6);

}

+ (id)numberingSystemForLocaleID:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;

  objc_msgSend(MEMORY[0x1E0C99DC8], "componentsFromLocaleIdentifier:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numbers"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "length"))
  {
    v6 = v5;
  }
  else
  {
    objc_msgSend(v4, "setObject:forKeyedSubscript:", CFSTR("default"), CFSTR("numbers"));
    objc_msgSend(MEMORY[0x1E0C99DC8], "localeIdentifierFromComponents:", v4);
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v7, "UTF8String");
    v8 = unumsys_open();
    v6 = 0;
    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", MEMORY[0x1BCCC3444](v8));
      v6 = (id)objc_claimAutoreleasedReturnValue();
      unumsys_close();
    }

  }
  return v6;
}

+ (id)numberingSystemsFromArray:(id)a3 forLocaleID:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  v6 = a3;
  objc_msgSend(a1, "numberingSystemsForLocaleID:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __53__IntlUtility_numberingSystemsFromArray_forLocaleID___block_invoke;
  v12[3] = &unk_1E70691E8;
  v13 = v6;
  v8 = v6;
  objc_msgSend(v7, "indexesOfObjectsPassingTest:", v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectsAtIndexes:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

uint64_t __53__IntlUtility_numberingSystemsFromArray_forLocaleID___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2);
}

+ (id)numberingSystemsForLocaleID:(id)a3
{
  id v3;
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
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v3;
  objc_msgSend(MEMORY[0x1E0C99DC8], "componentsFromLocaleIdentifier:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("numbers"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "length") && (objc_msgSend(v4, "containsObject:", v7) & 1) == 0)
    objc_msgSend(v4, "addObject:", v7);
  v19 = v7;
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0C997E8]);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  if (objc_msgSend(&unk_1E706DD58, "containsObject:"))
    v8 = &unk_1E706DD70;
  else
    v8 = &unk_1E706DD88;
  v23 = 0uLL;
  v24 = 0uLL;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v22 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(v6, "setObject:forKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i), CFSTR("numbers"));
        objc_msgSend(MEMORY[0x1E0C99DC8], "localeIdentifierFromComponents:", v6);
        v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        objc_msgSend(v13, "UTF8String");
        v14 = unumsys_open();

        if (v14)
        {
          if (!MEMORY[0x1BCCC345C](v14) && MEMORY[0x1BCCC3450](v14) == 10)
          {
            v15 = MEMORY[0x1BCCC3444](v14);
            if (v15)
            {
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v15);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              if ((objc_msgSend(v4, "containsObject:", v16) & 1) == 0)
                objc_msgSend(v4, "addObject:", v16);

            }
          }
          unumsys_close();
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v10);
  }
  if ((objc_msgSend(v4, "containsObject:", CFSTR("latn")) & 1) == 0)
    objc_msgSend(v4, "addObject:", CFSTR("latn"));

  return v4;
}

+ (id)displayNameForNumberingSystemWithIdentifier:(id)a3 localeIdentifier:(id)a4 short:(BOOL)a5
{
  _BOOL4 v5;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v5 = a5;
  v7 = (void *)MEMORY[0x1E0C99DC8];
  v8 = a3;
  objc_msgSend(v7, "componentsFromLocaleIdentifier:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "mutableCopy");

  objc_msgSend(v10, "setObject:forKeyedSubscript:", v8, CFSTR("numbers"));
  v11 = (void *)objc_opt_new();
  v12 = (void *)MEMORY[0x1E0C99DC8];
  objc_msgSend(MEMORY[0x1E0C99DC8], "localeIdentifierFromComponents:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localeWithLocaleIdentifier:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setLocale:", v14);

  if (v5)
    v15 = &unk_1E706D9B8;
  else
    v15 = &unk_1E706D9D0;
  objc_msgSend(v11, "stringFromNumber:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (id)displayNameForNumberingSystemWithIdentifier:(id)a3 localeIdentifier:(id)a4
{
  return (id)objc_msgSend(a1, "displayNameForNumberingSystemWithIdentifier:localeIdentifier:short:", a3, a4, 0);
}

+ (id)shortDisplayNameForNumberingSystemWithIdentifier:(id)a3 localeIdentifier:(id)a4
{
  return (id)objc_msgSend(a1, "displayNameForNumberingSystemWithIdentifier:localeIdentifier:short:", a3, a4, 1);
}

void __27__IntlUtility_languageList__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DC8], "supportedLanguages");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "allObjects");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v1, "count"));
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v3 = v1;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", v8, (_QWORD)v13);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "localizedStringForLanguage:context:", v8, 3);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v10, "length"))
        {
          objc_msgSend((id)objc_opt_class(), "capitalizeFirstWordOfName:accordingToLanguage:", v10, v8);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v2, "setObject:forKeyedSubscript:", v11, v8);

        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v5);
  }

  v12 = (void *)languageList___languageToNativeNameMap;
  languageList___languageToNativeNameMap = (uint64_t)v2;

}

+ (BOOL)forceCapitalizationInLanguageLists
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__IntlUtility_forceCapitalizationInLanguageLists__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (forceCapitalizationInLanguageLists___onceToken != -1)
    dispatch_once(&forceCapitalizationInLanguageLists___onceToken, block);
  return forceCapitalizationInLanguageLists___capitalize;
}

void __49__IntlUtility_forceCapitalizationInLanguageLists__block_invoke()
{
  void *v0;
  char v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "localizedStringForKey:value:table:", CFSTR("ForceCapitalizationInLanguageLists"), CFSTR("0"), 0);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v11, "length"))
  {
    v1 = objc_msgSend(v11, "isEqualToString:", CFSTR("0"));
    forceCapitalizationInLanguageLists___capitalize = v1 ^ 1;
    if ((v1 & 1) == 0)
      goto LABEL_10;
  }
  else
  {
    forceCapitalizationInLanguageLists___capitalize = 0;
  }
  v2 = (void *)MEMORY[0x1E0C99DC8];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredLocalizations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "canonicalLanguageIdentifierFromString:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "length"))
  {
    objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForLanguage:context:", v6, 3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v8, "length"))
    {
      objc_msgSend(MEMORY[0x1E0CB3500], "uppercaseLetterCharacterSet");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "rangeOfCharacterFromSet:", v9);

      forceCapitalizationInLanguageLists___capitalize = v10 == 0;
    }

  }
LABEL_10:

}

+ (BOOL)canCapitalizeAutonymForLanguage:(id)a3
{
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "languageCode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("lut"));

  return v5 ^ 1;
}

- (id)displayNameForDialect:(id)a3 context:(unint64_t)a4 displayLanguage:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;

  v8 = a5;
  v9 = a3;
  objc_msgSend((id)objc_opt_class(), "normalizedLanguageIDFromString:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[IntlUtility UDisplayContextForIUDisplayNameContext:](IntlUtility, "UDisplayContextForIUDisplayNameContext:", a4);
  v11 = objc_retainAutorelease(v8);
  objc_msgSend(v11, "UTF8String");

  -[IntlUtility ICUdisplayNameForLanguage:capitalization:](self, "ICUdisplayNameForLanguage:capitalization:", v10, uldn_openForContext());
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  uldn_close();
  if (objc_msgSend(v12, "isEqualToString:", v10))
    v13 = v9;
  else
    v13 = v12;
  v14 = v13;

  return v14;
}

- (id)ICUdisplayNameForLanguage:(id)a3 capitalization:(ULocaleDisplayNames *)a4
{
  int v4;
  int v6;
  _BYTE v7[256];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (!a4)
    return 0;
  objc_msgSend(objc_retainAutorelease(a3), "UTF8String");
  v4 = uldn_localeDisplayName();
  if (v4 >= 128)
    v6 = 128;
  else
    v6 = v4;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCharacters:length:", v7, v6);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)displayNameForLocale:(id)a3 displayLanguage:(id)a4 capitalization:(unint64_t)a5 short:(BOOL)a6
{
  _BOOL4 v6;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  int v16;
  id v17;
  id v18;
  int v19;
  char *v20;
  id v21;
  int v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v27;
  int v28;
  int v29;
  int v30;
  int v31;
  uint64_t v32;

  v6 = a6;
  v32 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  if (!v10)
  {
    v11 = (void *)MEMORY[0x1E0C99DC8];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "preferredLocalizations");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "firstObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "canonicalLanguageIdentifierFromString:", v14);
    v10 = (id)objc_claimAutoreleasedReturnValue();

  }
  v29 = 0;
  v15 = +[IntlUtility UDisplayContextForIUDisplayNameContext:](IntlUtility, "UDisplayContextForIUDisplayNameContext:", a5);
  if (v6)
    v16 = 513;
  else
    v16 = 512;
  v30 = v15;
  v31 = v16;
  v28 = 0;
  v17 = objc_retainAutorelease(v10);
  objc_msgSend(v17, "UTF8String");
  uldn_openForContext();
  v18 = objc_retainAutorelease(v9);
  objc_msgSend(v18, "UTF8String");
  v19 = uldn_localeDisplayName();
  if (v19 >= 150)
  {
    v19 = 0;
    v28 = 15;
  }
  v20 = (char *)&v27 - ((2 * (v19 + 1) + 15) & 0x3FFFFFFF0);
  v21 = objc_retainAutorelease(v18);
  objc_msgSend(v21, "UTF8String");
  v22 = uldn_localeDisplayName();
  uldn_close();
  if (v28 <= 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCharacters:length:", v20, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v23 = 0;
  }
  if (v23)
    v24 = v23;
  else
    v24 = v21;
  v25 = v24;

  return v25;
}

+ (int)UDisplayContextForIUDisplayNameContext:(unint64_t)a3
{
  if (a3 - 1 >= 3)
    return 256;
  else
    return a3 + 256;
}

+ (id)preferredLanguagesForRegionWithoutFiltering:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0C99DC8], "languagesForRegion:subdivision:withThreshold:filter:", a3, 0, 1, 0);
}

+ (id)preferredLanguagesForRegion:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0C99DC8], "languagesForRegion:subdivision:withThreshold:filter:", a3, 0, 1, 1);
}

+ (id)filterLanguageList:(id)a3 forRegion:(id)a4 fromLanguages:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id obj;
  id v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v20 = a4;
  v8 = a5;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = v7;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v22 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@"), v13, v20);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        +[IntlUtility normalizedLanguageIDFromString:](IntlUtility, "normalizedLanguageIDFromString:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        do
        {
          if ((objc_msgSend(v8, "containsObject:", v15) & 1) != 0)
          {
            v13 = v15;
            v16 = v15;
            goto LABEL_12;
          }
          +[IntlUtility parentLocaleIdentifierForIdentifier:](IntlUtility, "parentLocaleIdentifierForIdentifier:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          v15 = v16;
        }
        while (!objc_msgSend(v16, "isEqualToString:", CFSTR("root")));
        if (!objc_msgSend(v8, "containsObject:", v13))
          goto LABEL_13;
LABEL_12:
        objc_msgSend(v19, "addObject:", v13);
LABEL_13:

      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v10);
  }

  return v19;
}

+ (id)preferredLanguagesFromLanguages:(id)a3 byAddingFallbacksForRegion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  char v18;
  void *v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_msgSend(v5, "mutableCopy");
  v8 = (void *)MEMORY[0x1E0C99DC8];
  +[IntlUtility preferredLanguagesForRegionWithoutFiltering:](IntlUtility, "preferredLanguagesForRegionWithoutFiltering:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "baseLanguageFromLanguage:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(&unk_1E706DDA0, "containsObject:", v11))
  {
    v20 = v7;
    v21 = v6;
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v12 = v5;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v23;
      while (2)
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v23 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(MEMORY[0x1E0C99DC8], "baseLanguageFromLanguage:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i), v20);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(&unk_1E706DDA0, "containsObject:", v17);

          if ((v18 & 1) != 0)
          {
            v7 = v20;
            v6 = v21;
            goto LABEL_14;
          }
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
        if (v14)
          continue;
        break;
      }
    }

    v6 = v21;
    objc_msgSend(MEMORY[0x1E0C99DC8], "languageFromLanguage:byReplacingRegion:", v11, v21);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "length"))
    {
      v7 = v20;
      if (objc_msgSend(v20, "count"))
        objc_msgSend(v20, "addObject:", v12);
    }
    else
    {
      v7 = v20;
    }
LABEL_14:

  }
  return v7;
}

+ (id)parentLocaleIdentifierForIdentifier:(id)a3
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

+ (id)_supportedCalendarsOnEmbeddedSystems
{
  uint64_t v2;
  _QWORD v4[4];

  v4[3] = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0C99708];
  v4[0] = *MEMORY[0x1E0C996C8];
  v4[1] = v2;
  v4[2] = *MEMORY[0x1E0C99698];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)restrictedCountryCodes
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E706DDB8);
}

+ (BOOL)upgradeAppleLanguagesFrom:(id)a3 to:(id)a4
{
  void *v4;
  char v5;

  +[ISMigrator migratorFromVersion:toVersion:](ISRootMigrator, "migratorFromVersion:toVersion:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "performMigration");

  return v5;
}

- (id)displayNameForLanguage:(id)a3 context:(unint64_t)a4 displayLanguage:(id)a5
{
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v7 = (void *)MEMORY[0x1E0C99DC8];
  v8 = a3;
  objc_msgSend(v7, "localeWithLocaleIdentifier:", a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForLanguage:context:", v8, objc_msgSend((id)objc_opt_class(), "formattingContextFromIUDisplayNameContext:", a4));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v10)
    v10 = v8;
  v12 = v10;

  return v12;
}

- (id)displayNameForRegion:(id)a3 displayLanguage:(id)a4 capitalization:(unint64_t)a5
{
  return -[IntlUtility displayNameForRegion:displayLanguage:capitalization:short:](self, "displayNameForRegion:displayLanguage:capitalization:short:", a3, a4, a5, 0);
}

- (id)displayNameForRegion:(id)a3 displayLanguage:(id)a4 capitalization:(unint64_t)a5 short:(BOOL)a6
{
  _BOOL8 v6;
  void *v9;
  id v10;
  id v11;
  void *v12;

  v6 = a6;
  v9 = (void *)MEMORY[0x1E0C99DC8];
  v10 = a4;
  v11 = a3;
  objc_msgSend(v9, "displayNameForRegion:displayLanguage:context:short:", v11, v10, objc_msgSend((id)objc_opt_class(), "formattingContextFromIUDisplayNameContext:", a5), v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (int64_t)formattingContextFromIUDisplayNameContext:(unint64_t)a3
{
  if (a3 - 1 >= 3)
    return 0;
  else
    return 6 - a3;
}

+ (id)preferredLanguageForBundleID:(id)a3
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

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CA5898], "bundleRecordWithBundleIdentifier:allowPlaceholder:error:", v4, 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(a1, "_preferredLanguagesForBundleID:withBundleRecord:", v4, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0C99DC8], "_globalPreferredLanguages");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithURL:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x1E0CB34D0];
    objc_msgSend(v8, "normalizedLocalizations");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "preferredLocalizationsFromArray:forPreferences:", v10, v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (id)_proposedOverrideLanguageFromLanguage:(id)a3 forLocalizations:(id)a4 preferredLanguages:(id)a5 regionCode:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  id v21;
  void *v22;
  uint64_t v23;
  void *v24;
  id v25;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  unsigned int v35;
  id v36;
  void *v37;
  id v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  id v44;
  void *v45;
  unsigned int (**v46)(_QWORD, _QWORD);
  _QWORD v47[4];
  id v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _QWORD v53[4];
  id v54;
  id v55;
  void *v56;
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (objc_msgSend(v9, "length")
    && objc_msgSend(v10, "count")
    && objc_msgSend(v11, "count")
    && objc_msgSend(v12, "length")
    && (objc_msgSend(v10, "containsObject:", v9) & 1) != 0)
  {
    v53[0] = MEMORY[0x1E0C809B0];
    v53[1] = 3221225472;
    v53[2] = __100__IntlUtility__proposedOverrideLanguageFromLanguage_forLocalizations_preferredLanguages_regionCode___block_invoke;
    v53[3] = &unk_1E7069210;
    v54 = v10;
    v13 = v9;
    v55 = v13;
    v46 = (unsigned int (**)(_QWORD, _QWORD))MEMORY[0x1BCCC31B0](v53);
    v45 = v13;
    objc_msgSend(MEMORY[0x1E0C99DC8], "baseLanguageFromLanguage:", v13);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v11, "count"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    v15 = v11;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v50;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v50 != v18)
            objc_enumerationMutation(v15);
          objc_msgSend(MEMORY[0x1E0C99DC8], "baseLanguageFromLanguage:", *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * i));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "addObject:", v20);

        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
      }
      while (v17);
    }

    v47[0] = MEMORY[0x1E0C809B0];
    v47[1] = 3221225472;
    v47[2] = __100__IntlUtility__proposedOverrideLanguageFromLanguage_forLocalizations_preferredLanguages_regionCode___block_invoke_2;
    v47[3] = &unk_1E7069238;
    v21 = v42;
    v48 = v21;
    objc_msgSend(v14, "indexesOfObjectsPassingTest:", v47);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v22, "count") && (v23 = objc_msgSend(v22, "firstIndex"), v23 != 0x7FFFFFFFFFFFFFFFLL))
    {
      v29 = v23;
      v44 = v21;
      while (1)
      {
        v30 = v22;
        v31 = (void *)objc_msgSend(v15, "mutableCopy");
        objc_msgSend(v31, "removeObjectAtIndex:", v29);
        objc_msgSend(v15, "objectAtIndexedSubscript:", v29);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "insertObject:atIndex:", v32, 0);

        if (((unsigned int (**)(_QWORD, void *))v46)[2](v46, v31))
          break;
        v22 = v30;
        v29 = objc_msgSend(v30, "indexGreaterThanIndex:", v29);

        if (v29 == 0x7FFFFFFFFFFFFFFFLL)
        {
          v24 = 0;
          v21 = v44;
          goto LABEL_16;
        }
      }
      objc_msgSend(v15, "objectAtIndexedSubscript:", v29);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      v21 = v44;
      v22 = v30;
    }
    else
    {
      v24 = 0;
    }
LABEL_16:
    if (!objc_msgSend(v24, "length"))
    {
      v41 = v22;
      v43 = v21;
      objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", v45);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "countryCode");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = objc_msgSend(v28, "length");

      if (v39)
      {
        v22 = v41;
        v21 = v43;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99DC8], "languageFromLanguage:byReplacingRegion:", v45, v12);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v56 = v40;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v56, 1);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "arrayByAddingObjectsFromArray:", v15);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = ((unsigned int (**)(_QWORD, void *))v46)[2](v46, v34);

        if (v35)
        {
          v36 = v40;

          v24 = v36;
        }
        v22 = v41;
        v21 = v43;

      }
    }
    if (!objc_msgSend(v24, "length"))
    {
      v37 = v22;
      v38 = v45;

      v24 = v38;
      v22 = v37;
    }
    v25 = v24;

  }
  else
  {
    v25 = v9;
  }

  return v25;
}

uint64_t __100__IntlUtility__proposedOverrideLanguageFromLanguage_forLocalizations_preferredLanguages_regionCode___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB34D0], "preferredLocalizationsFromArray:forPreferences:", *(_QWORD *)(a1 + 32), a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(a1 + 40));

  return v5;
}

uint64_t __100__IntlUtility__proposedOverrideLanguageFromLanguage_forLocalizations_preferredLanguages_regionCode___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isEqual:", *(_QWORD *)(a1 + 32));
}

+ (id)_preferredLanguagesForBundleID:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (objc_class *)MEMORY[0x1E0CA5870];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithBundleIdentifier:allowPlaceholder:error:", v5, 0, 0);
  objc_msgSend(a1, "_preferredLanguagesForBundleID:withAppRecord:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)_preferredLanguagesForBundleID:(id)a3 withBundleRecord:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a3;
  objc_msgSend(a4, "dataContainerURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)_CFPreferencesCopyValueWithContainer();
  if ((_NSIsNSArray() & 1) == 0)
  {

    v8 = 0;
  }

  return v8;
}

+ (void)preferredLanguagesForBundleID:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v6 = a3;
  v7 = a4;
  objc_msgSend(a1, "_getXPCConnectionForLocalizationSwitcher");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "remoteObjectProxy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __51__IntlUtility_preferredLanguagesForBundleID_reply___block_invoke;
    v10[3] = &unk_1E7069260;
    v11 = v7;
    objc_msgSend(v9, "preferredLanguagesForBundleID:reply:", v6, v10);

  }
  else
  {
    (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
  }

}

uint64_t __51__IntlUtility_preferredLanguagesForBundleID_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (void)preferredLanguagesForBundleIDs:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v6 = a3;
  v7 = a4;
  objc_msgSend(a1, "_getXPCConnectionForLocalizationSwitcher");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "remoteObjectProxy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __52__IntlUtility_preferredLanguagesForBundleIDs_reply___block_invoke;
    v10[3] = &unk_1E7069288;
    v11 = v7;
    objc_msgSend(v9, "preferredLanguagesForBundleIDs:reply:", v6, v10);

  }
  else
  {
    (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
  }

}

uint64_t __52__IntlUtility_preferredLanguagesForBundleIDs_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (id)preferredLanguagesForBundleIDs:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  _QWORD v18[5];

  v4 = a3;
  objc_msgSend(a1, "_getXPCConnectionForLocalizationSwitcher");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __46__IntlUtility_preferredLanguagesForBundleIDs___block_invoke;
  v18[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  v18[4] = a1;
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", v18);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x3032000000;
    v15 = __Block_byref_object_copy_;
    v16 = __Block_byref_object_dispose_;
    v17 = 0;
    v11[0] = v6;
    v11[1] = 3221225472;
    v11[2] = __46__IntlUtility_preferredLanguagesForBundleIDs___block_invoke_171;
    v11[3] = &unk_1E70692D0;
    v11[4] = &v12;
    objc_msgSend(v7, "preferredLanguagesForBundleIDs:reply:", v4, v11);
    v9 = (id)v13[5];
    _Block_object_dispose(&v12, 8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

void __46__IntlUtility_preferredLanguagesForBundleIDs___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  int v6;
  void *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v3 = a2;
    v4 = (void *)objc_opt_class();

    v6 = 138543618;
    v7 = v4;
    v8 = 2114;
    v9 = v3;
    v5 = v4;
    _os_log_impl(&dword_1B96C1000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[%{public}@]: Error obtaining remote object proxy, %{public}@", (uint8_t *)&v6, 0x16u);

  }
}

void __46__IntlUtility_preferredLanguagesForBundleIDs___block_invoke_171(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

+ (void)_setPreferredLanguage:(id)a3 forBundleID:(id)a4
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
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  char v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  void *v34;
  id v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  char v40;
  void *v41;
  char v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  _QWORD v51[4];
  id v52;
  id v53;
  id v54;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0CA5860], "applicationProxyForIdentifier:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0CB34D0];
  v49 = v8;
  objc_msgSend(v8, "bundleURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bundleWithURL:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v50 = v6;
  v48 = a1;
  if (v6)
  {
    objc_msgSend(v11, "normalizedLocalizations");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "countryCode");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_proposedOverrideLanguageFromLanguage:forLocalizations:preferredLanguages:regionCode:", v6, v12, v13, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E10], "orderedSetWithObject:", v16);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObjectsFromArray:", v17);

  }
  v18 = (void *)MEMORY[0x1E0CB34D0];
  objc_msgSend(v11, "normalizedLocalizations");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "array");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "preferredLocalizationsFromArray:forPreferences:", v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "firstObject");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = (void *)MEMORY[0x1E0CB34D0];
  objc_msgSend(v11, "normalizedLocalizations");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DC8], "_globalPreferredLanguages");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "preferredLocalizationsFromArray:forPreferences:", v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "firstObject");
  v27 = objc_claimAutoreleasedReturnValue();

  v28 = objc_msgSend(v22, "isEqualToString:", v27);
  v45 = v27;
  v47 = v22;
  if ((v28 & 1) != 0)
  {
    v29 = 0;
  }
  else
  {
    objc_msgSend(v6, "array", v27, v22);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v49, "dataContainerURL", v45);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "path");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  _CFPreferencesSetValueWithContainer();
  objc_msgSend(v11, "bundleIdentifier");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v32, "hasPrefix:", CFSTR("com.apple."));

  if (v33 && v31)
    _CFPreferencesSetValueWithContainer();
  objc_msgSend(MEMORY[0x1E0CF8850], "sharedDeviceConnection");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v51[0] = MEMORY[0x1E0C809B0];
  v51[1] = 3221225472;
  v51[2] = __49__IntlUtility__setPreferredLanguage_forBundleID___block_invoke;
  v51[3] = &unk_1E70692F8;
  v54 = v48;
  v35 = v29;
  v52 = v35;
  v36 = v6;
  v53 = v36;
  objc_msgSend(v34, "fetchWatchAppBundleIDForCompanionAppBundleID:completion:", v7, v51);

  objc_msgSend(v48, "perAppLanguageSelectionBundleIdentifiers");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSetWithArray:", v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = v38;
  v40 = v28 ^ 1;
  if (!v50)
    v40 = 0;
  if ((v40 & 1) != 0)
    objc_msgSend(v38, "addObject:", v7);
  else
    objc_msgSend(v38, "removeObject:", v7);
  objc_msgSend(v39, "array");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = objc_msgSend(v41, "isEqualToArray:", v37);

  if ((v42 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "array");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "setObject:forKey:inDomain:", v44, CFSTR("ApplePerAppLanguageSelectionBundleIdentifiers"), *MEMORY[0x1E0CB2B58]);

  }
}

void __49__IntlUtility__setPreferredLanguage_forBundleID___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  _BOOL4 v16;
  void *v17;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  const __CFString *v23;
  void *v24;
  _BYTE buf[24];
  void *v26;
  uint64_t *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = objc_opt_class();
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v6;
      v7 = *(id *)&buf[4];
      _os_log_impl(&dword_1B96C1000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[%{public}@]: Error obtaining watch app bundle ID, %{public}@", buf, 0x16u);

    }
  }
  else
  {
    v19 = 0;
    v20 = &v19;
    v21 = 0x2050000000;
    v8 = (void *)getNRPairedDeviceRegistryClass_softClass_0;
    v22 = getNRPairedDeviceRegistryClass_softClass_0;
    v9 = MEMORY[0x1E0C809B0];
    if (!getNRPairedDeviceRegistryClass_softClass_0)
    {
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __getNRPairedDeviceRegistryClass_block_invoke_0;
      v26 = &unk_1E7068E68;
      v27 = &v19;
      __getNRPairedDeviceRegistryClass_block_invoke_0((uint64_t)buf);
      v8 = (void *)v20[3];
    }
    v10 = objc_retainAutorelease(v8);
    _Block_object_dispose(&v19, 8);
    objc_msgSend(v10, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "getActivePairedDevice");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CF8850], "sharedDeviceConnection");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = CFSTR("AppleLanguages");
    v14 = *(_QWORD *)(a1 + 32);
    if (v14)
    {
      v15 = *(void **)(a1 + 32);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "array");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v16 = v14 == 0;
    v24 = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v9;
    v18[1] = 3221225472;
    v18[2] = __49__IntlUtility__setPreferredLanguage_forBundleID___block_invoke_177;
    v18[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
    v18[4] = *(_QWORD *)(a1 + 48);
    objc_msgSend(v13, "updatePreferencesForApplicationWithIdentifier:preferences:writingToPreferencesLocation:forPairedDevice:options:completion:", v5, v17, 1, v12, 1, v18);

    if (v16)
  }

}

void __49__IntlUtility__setPreferredLanguage_forBundleID___block_invoke_177(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  int v6;
  void *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v3 = a2;
    v4 = (void *)objc_opt_class();

    v6 = 138543618;
    v7 = v4;
    v8 = 2114;
    v9 = v3;
    v5 = v4;
    _os_log_impl(&dword_1B96C1000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[%{public}@]: Error updating preferences for watch app, %{public}@", (uint8_t *)&v6, 0x16u);

  }
}

+ (void)setPreferredLanguage:(id)a3 forBundleID:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(a1, "_setPreferredLanguage:forBundleID:", a3, v6);
  objc_msgSend(MEMORY[0x1E0D87DA0], "predicateMatchingBundleIdentifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D87E00]), "initWithExplanation:", CFSTR("Terminating app on per-app language change"));
  objc_msgSend(v8, "setMaximumTerminationResistance:", 40);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D87E10]), "initWithPredicate:context:", v7, v8);
  v16 = 0;
  v10 = objc_msgSend(v9, "acquireWithError:", &v16);
  v11 = v16;
  if ((v10 & 1) == 0 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v12 = (void *)objc_opt_class();
    *(_DWORD *)buf = 138543618;
    v18 = v12;
    v19 = 2114;
    v20 = v6;
    v13 = v12;
    _os_log_impl(&dword_1B96C1000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[%{public}@]: Error obtaining termination assertion on %{public}@", buf, 0x16u);

  }
  objc_msgSend(v9, "invalidate");
  objc_msgSend(a1, "_getXPCConnectionForLocalizationSwitcher");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "remoteObjectProxy");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "notifyPreferredLanguageChangedForBundleID:", v6);

}

+ (void)setPreferredLanguage:(id)a3 forBundleID:(id)a4 andRelaunchWithCompletion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(a1, "_setPreferredLanguage:forBundleID:", v10, v9);
  objc_msgSend(a1, "_getXPCConnectionForLocalizationSwitcher");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "remoteObjectProxy");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __74__IntlUtility_setPreferredLanguage_forBundleID_andRelaunchWithCompletion___block_invoke;
  v14[3] = &unk_1E7069320;
  v15 = v8;
  v13 = v8;
  objc_msgSend(v12, "setPreferredLanguage:forBundleID:andRelaunchWithReply:", v10, v9, v14);

}

uint64_t __74__IntlUtility_setPreferredLanguage_forBundleID_andRelaunchWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

+ (id)_getXPCConnectionForLocalizationSwitcher
{
  if (_getXPCConnectionForLocalizationSwitcher_onceToken != -1)
    dispatch_once(&_getXPCConnectionForLocalizationSwitcher_onceToken, &__block_literal_global_185);
  return (id)_getXPCConnectionForLocalizationSwitcher__connectionToService;
}

uint64_t __55__IntlUtility__getXPCConnectionForLocalizationSwitcher__block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.localizationswitcherd"), 4096);
  v1 = (void *)_getXPCConnectionForLocalizationSwitcher__connectionToService;
  _getXPCConnectionForLocalizationSwitcher__connectionToService = v0;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF232868);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)_getXPCConnectionForLocalizationSwitcher__connectionToService, "setRemoteObjectInterface:", v2);

  return objc_msgSend((id)_getXPCConnectionForLocalizationSwitcher__connectionToService, "resume");
}

+ (id)perAppLanguageSelectionBundleIdentifiers
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:inDomain:", CFSTR("ApplePerAppLanguageSelectionBundleIdentifiers"), *MEMORY[0x1E0CB2B58]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (void)subscribeToAppLanguageChanges:(id)a3
{
  id v3;
  id v4;
  xpc_object_t v5;
  _QWORD handler[4];
  id v7;
  uint8_t buf[4];
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __45__IntlUtility_subscribeToAppLanguageChanges___block_invoke;
  handler[3] = &unk_1E7069368;
  v7 = v3;
  v4 = v3;
  xpc_set_event_stream_handler("com.apple.IntlPreferences.events", 0, handler);
  v5 = xpc_dictionary_create(0, 0, 0);
  xpc_set_event();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    v9 = "per_app_language_changed";
    _os_log_impl(&dword_1B96C1000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "XPC event [%{public}s] registered.", buf, 0xCu);
  }

}

void __45__IntlUtility_subscribeToAppLanguageChanges___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  const char *string;
  const char *v5;
  uint64_t v6;
  void *reply;
  int v8;
  const char *v9;
  __int16 v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  string = xpc_dictionary_get_string(v3, (const char *)*MEMORY[0x1E0C81298]);
  v5 = xpc_dictionary_get_string(v3, "bundleID");
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136446466;
    v9 = string;
    v10 = 2082;
    v11 = v5;
    _os_log_impl(&dword_1B96C1000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "XPC event [%{public}s] received with bundle ID = [%{public}s]", (uint8_t *)&v8, 0x16u);
  }
  if (v5)
  {
    v6 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v5);
    reply = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, reply);
  }
  else
  {
    reply = xpc_dictionary_create_reply(v3);
    if (reply)
      xpc_dictionary_send_reply();
  }

}

+ (void)unsubscribeFromAppLanguageChanges
{
  int v2;
  const char *v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  xpc_set_event();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v2 = 136446210;
    v3 = "per_app_language_changed";
    _os_log_impl(&dword_1B96C1000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "XPC event [%{public}s] unregistered.", (uint8_t *)&v2, 0xCu);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mBidiTestedLanguagesArray, 0);
  objc_storeStrong((id *)&self->mBidiLanguagesArray, 0);
}

@end
