@implementation AXLanguageManager

+ (AXLanguageManager)sharedInstance
{
  if (sharedInstance_onceToken_4 != -1)
    dispatch_once(&sharedInstance_onceToken_4, &__block_literal_global_31);
  return (AXLanguageManager *)(id)sharedInstance__shared;
}

void __35__AXLanguageManager_sharedInstance__block_invoke()
{
  AXLanguageManager *v0;
  void *v1;

  v0 = objc_alloc_init(AXLanguageManager);
  v1 = (void *)sharedInstance__shared;
  sharedInstance__shared = (uint64_t)v0;

}

+ (BOOL)voiceOverSupportedInCurrentLanguage
{
  if (voiceOverSupportedInCurrentLanguage_onceToken != -1)
    dispatch_once(&voiceOverSupportedInCurrentLanguage_onceToken, &__block_literal_global_1);
  return (voiceOverSupportedInCurrentLanguage_Supported & 1) == 0;
}

void __56__AXLanguageManager_voiceOverSupportedInCurrentLanguage__block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v0 = objc_opt_new();
  v1 = (void *)voiceOverSupportedInCurrentLanguage_NonSupportedLanguages;
  voiceOverSupportedInCurrentLanguage_NonSupportedLanguages = v0;

  objc_msgSend((id)voiceOverSupportedInCurrentLanguage_NonSupportedLanguages, "addObject:", CFSTR("vi"));
  objc_msgSend((id)voiceOverSupportedInCurrentLanguage_NonSupportedLanguages, "addObject:", CFSTR("ca"));
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *MEMORY[0x1E0C997E8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = (id)voiceOverSupportedInCurrentLanguage_NonSupportedLanguages;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i);
        if ((objc_msgSend(v3, "hasPrefix:", v9, (_QWORD)v10) & 1) != 0
          || objc_msgSend(v3, "isEqualToString:", v9))
        {
          voiceOverSupportedInCurrentLanguage_Supported = 1;
          goto LABEL_12;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_12:

}

+ (id)nonlocalizedNameForLanguage:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  objc_msgSend(a3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("_"), CFSTR("-"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForLanguage:context:", v3, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v6 = (void *)nonlocalizedNameForLanguage__AXBundle;
    if (!nonlocalizedNameForLanguage__AXBundle)
    {
      NSOpenStepRootDirectory();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringByAppendingString:", CFSTR("System/Library/PreferenceBundles/AccessibilitySettings.bundle"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithPath:", v8);
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = (void *)nonlocalizedNameForLanguage__AXBundle;
      nonlocalizedNameForLanguage__AXBundle = v9;

      v6 = (void *)nonlocalizedNameForLanguage__AXBundle;
    }
    objc_msgSend(v6, "localizedStringForKey:value:table:", v3, v3, CFSTR("RegionNamesNonLocalized"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if ((objc_msgSend(v5, "isEqualToString:", v3) & 1) != 0)
    v11 = 0;
  else
    v11 = v5;

  return v11;
}

+ (id)commonPunctuationCharacters
{
  if (commonPunctuationCharacters_onceToken != -1)
    dispatch_once(&commonPunctuationCharacters_onceToken, &__block_literal_global_16);
  return (id)commonPunctuationCharacters_charSet;
}

void __48__AXLanguageManager_commonPunctuationCharacters__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("~!@#*$%&+|=(){}[]<>,./?;:'_-\"\\"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)commonPunctuationCharacters_charSet;
  commonPunctuationCharacters_charSet = v0;

}

+ (id)doNotTranslateWords
{
  if (doNotTranslateWords_onceToken != -1)
    dispatch_once(&doNotTranslateWords_onceToken, &__block_literal_global_20);
  return (id)doNotTranslateWords_Set;
}

void __40__AXLanguageManager_doNotTranslateWords__block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
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
  v0 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v1 = (void *)doNotTranslateWords_Set;
  doNotTranslateWords_Set = (uint64_t)v0;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "pathForResource:ofType:", CFSTR("DNTTerms"), CFSTR("plist"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithContentsOfFile:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v7);
        v9 = (void *)doNotTranslateWords_Set;
        objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "stringByTrimmingCharactersInSet:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObject:", v11);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v5);
  }

}

+ (id)stringByReplacingEmojiCharactersWithEmojiDescriptions:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0DBEF28], "stringByReplacingEmojiCharactersWithEmojiDescriptions:stringForPauses:language:rangeReplacements:appendEmojiSuffix:", a3, CFSTR(" \x1B\\pause=350\\ "), 0, 0, 0);
}

+ (id)stringByReplacingFatWidthCharactersWithBasicCharacters:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithRange:", 65296, 75);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "rangeOfCharacterFromSet:", v4);
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = v3;
  }
  else
  {
    v7 = v5;
    v8 = objc_msgSend(v3, "length");
    v9 = (void *)MEMORY[0x1E0CB37A0];
    objc_msgSend(v3, "substringToIndex:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithString:", v10);
    v6 = (id)objc_claimAutoreleasedReturnValue();

    if (v7 >= v8)
    {
      v11 = v7;
    }
    else
    {
      v11 = v7;
      do
      {
        v12 = objc_msgSend(v3, "characterAtIndex:", v7);
        if ((objc_msgSend(v4, "characterIsMember:", v12) & 1) != 0)
        {
          v13 = v7 - v11;
          if (v7 > v11)
          {
            objc_msgSend(v3, "substringWithRange:", v11, v13);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "appendString:", v14);

          }
          objc_msgSend(v6, "appendFormat:", CFSTR("%C "), v13, (unsigned __int16)(v12 + 288));
          v11 = ++v7;
        }
        else
        {
          ++v7;
        }
      }
      while (v7 != v8);
    }
    if (v8 > v11)
    {
      objc_msgSend(v3, "substringWithRange:", v11, v8 - v11);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "appendString:", v15);

    }
  }

  return v6;
}

- (AXLanguageManager)init
{
  AXLanguageManager *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  __CFNotificationCenter *DarwinNotifyCenter;
  AXLanguageManager *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)AXLanguageManager;
  v2 = -[AXLanguageManager init](&v13, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXLanguageManager setUserLocale:](v2, "setUserLocale:", v3);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", v2, sel__handleUserLocaleDidChange_, *MEMORY[0x1E0C99720], 0);

    v5 = objc_alloc_init(MEMORY[0x1E0CB3780]);
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "formUnionWithCharacterSet:", v6);

    objc_msgSend(MEMORY[0x1E0CB3500], "punctuationCharacterSet");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "formUnionWithCharacterSet:", v7);

    objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("0123456789•■"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "formUnionWithCharacterSet:", v8);

    objc_msgSend(MEMORY[0x1E0CB3500], "controlCharacterSet");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "formUnionWithCharacterSet:", v9);

    -[AXLanguageManager setCommonCharacters:](v2, "setCommonCharacters:", v5);
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)_updateLocaleForLanguagePreference, (CFStringRef)*MEMORY[0x1E0DDE1E0], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    v11 = v2;

  }
  return v2;
}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v4;
  objc_super v5;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

  v5.receiver = self;
  v5.super_class = (Class)AXLanguageManager;
  -[AXLanguageManager dealloc](&v5, sel_dealloc);
}

- (id)basicDescription
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("AXLanguageManager:<%p>. %lu lang maps"), self, -[NSArray count](self->_langMaps, "count"));
}

- (id)debugDescription
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  AXLanguageManager *v23;
  NSArray *obj;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB37A0];
  -[AXLanguageManager basicDescription](self, "basicDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@\n"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v23 = self;
  obj = self->_langMaps;
  v26 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
  if (v26)
  {
    v25 = *(_QWORD *)v33;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v33 != v25)
          objc_enumerationMutation(obj);
        v27 = v6;
        v7 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v6);
        objc_msgSend(v7, "description");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "appendFormat:", CFSTR("  %@\n"), v8);

        v30 = 0u;
        v31 = 0u;
        v28 = 0u;
        v29 = 0u;
        objc_msgSend(v7, "dialects");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v29;
          do
          {
            for (i = 0; i != v11; ++i)
            {
              if (*(_QWORD *)v29 != v12)
                objc_enumerationMutation(v9);
              v14 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
              objc_msgSend(v7, "userPreferredDialect");
              v15 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v14, "description");
              v16 = objc_claimAutoreleasedReturnValue();
              v17 = (void *)v16;
              if (v15 == v14)
                v18 = CFSTR("    USER-PREF %@\n");
              else
                v18 = CFSTR("    %@\n");
              objc_msgSend(v5, "appendFormat:", v18, v16);

            }
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
          }
          while (v11);
        }

        v6 = v27 + 1;
      }
      while (v27 + 1 != v26);
      v26 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    }
    while (v26);
  }

  -[AXLanguageManager dialectForSystemLanguage](v23, "dialectForSystemLanguage");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("system Lang dialect: %@\n"), v19);

  -[AXLanguageManager dialectForCurrentLocale](v23, "dialectForCurrentLocale");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("system current locale dialect: %@\n"), v20);

  -[AXLanguageManager dialectForCurrentRegion](v23, "dialectForCurrentRegion");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("system current region dialect: %@\n"), v21);

  return v5;
}

- (NSString)systemLanguageID
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "objectAtIndex:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    AXCLanguageCanonicalFormToGeneralLanguage();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[AXLanguageManager userLocale](self, "userLocale");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0C997E8]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    AXCLanguageCanonicalFormToGeneralLanguage();
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (NSString *)v5;
}

- (NSArray)langMaps
{
  NSArray *langMaps;
  NSArray *v4;
  NSArray *v5;

  langMaps = self->_langMaps;
  if (!langMaps)
  {
    -[AXLanguageManager _loadLangMaps](self, "_loadLangMaps");
    v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v5 = self->_langMaps;
    self->_langMaps = v4;

    langMaps = self->_langMaps;
  }
  return langMaps;
}

- (AXDialectMap)dialectForSystemLanguage
{
  AXDialectMap *dialectForSystemLanguage;

  dialectForSystemLanguage = self->_dialectForSystemLanguage;
  if (!dialectForSystemLanguage)
  {
    -[AXLanguageManager updateCachedDialects](self, "updateCachedDialects");
    dialectForSystemLanguage = self->_dialectForSystemLanguage;
    if (!dialectForSystemLanguage)
    {
      _AXLogWithFacility();
      dialectForSystemLanguage = self->_dialectForSystemLanguage;
    }
  }
  return dialectForSystemLanguage;
}

- (void)setDialectForSystemLanguage:(id)a3
{
  id v5;
  AXDialectMap **p_dialectForSystemLanguage;
  AXDialectMap *dialectForSystemLanguage;
  id v8;

  v5 = a3;
  dialectForSystemLanguage = self->_dialectForSystemLanguage;
  p_dialectForSystemLanguage = &self->_dialectForSystemLanguage;
  v8 = v5;
  if ((-[AXDialectMap isEqual:](dialectForSystemLanguage, "isEqual:") & 1) == 0)
    objc_storeStrong((id *)p_dialectForSystemLanguage, a3);

}

- (AXDialectMap)dialectForUserLocale
{
  void *v2;
  void *v3;
  void *v4;

  -[AXLanguageManager dialectForSystemLanguage](self, "dialectForSystemLanguage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "langMap");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "userLocaleDialect");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (AXDialectMap *)v4;
}

- (AXDialectMap)dialectForCurrentLocale
{
  AXDialectMap *dialectForCurrentLocale;

  dialectForCurrentLocale = self->_dialectForCurrentLocale;
  if (!dialectForCurrentLocale)
  {
    -[AXLanguageManager updateCachedDialects](self, "updateCachedDialects");
    dialectForCurrentLocale = self->_dialectForCurrentLocale;
  }
  return dialectForCurrentLocale;
}

- (AXDialectMap)dialectForCurrentRegion
{
  AXDialectMap *dialectForCurrentRegion;

  dialectForCurrentRegion = self->_dialectForCurrentRegion;
  if (!dialectForCurrentRegion)
  {
    -[AXLanguageManager updateCachedDialects](self, "updateCachedDialects");
    dialectForCurrentRegion = self->_dialectForCurrentRegion;
  }
  return dialectForCurrentRegion;
}

- (void)setDialectForCurrentLocale:(id)a3
{
  id v5;
  AXDialectMap **p_dialectForCurrentLocale;
  AXDialectMap *dialectForCurrentLocale;
  id v8;

  v5 = a3;
  dialectForCurrentLocale = self->_dialectForCurrentLocale;
  p_dialectForCurrentLocale = &self->_dialectForCurrentLocale;
  v8 = v5;
  if ((-[AXDialectMap isEqual:](dialectForCurrentLocale, "isEqual:") & 1) == 0)
    objc_storeStrong((id *)p_dialectForCurrentLocale, a3);

}

- (void)setDialectForCurrentRegion:(id)a3
{
  id v5;
  AXDialectMap **p_dialectForCurrentRegion;
  AXDialectMap *dialectForCurrentRegion;
  id v8;

  v5 = a3;
  dialectForCurrentRegion = self->_dialectForCurrentRegion;
  p_dialectForCurrentRegion = &self->_dialectForCurrentRegion;
  v8 = v5;
  if ((-[AXDialectMap isEqual:](dialectForCurrentRegion, "isEqual:") & 1) == 0)
    objc_storeStrong((id *)p_dialectForCurrentRegion, a3);

}

- (id)dialectForLanguageID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  id v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  void *v33;
  void *v34;
  char v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  id obj;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  uint8_t v50[128];
  uint8_t buf[4];
  void *v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v5 = v4;
    -[AXLanguageManager outputLanguageIdentifierForLanguage:](self, "outputLanguageIdentifierForLanguage:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v8 = v6;

      v5 = v8;
    }
    else
    {
      AXLogCommon();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v52 = v5;
        _os_log_impl(&dword_18C62B000, v10, OS_LOG_TYPE_INFO, "We passed in %@ to TTSPreferencesCopyDefaultOutputLanguageIdentifierForLanguage and got back nil", buf, 0xCu);
      }

    }
    -[AXLanguageManager dialectForSystemLanguage](self, "dialectForSystemLanguage");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "specificLanguageID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "hasPrefix:", v5);

    if (v13)
    {
      v14 = v11;
    }
    else
    {
      -[AXLanguageManager dialectForCurrentLocale](self, "dialectForCurrentLocale");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "specificLanguageID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "hasPrefix:", v5);

      if (v17)
      {
        v14 = v15;
      }
      else
      {
        -[AXLanguageManager dialectForCurrentRegion](self, "dialectForCurrentRegion");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "specificLanguageID");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "hasPrefix:", v5);

        if (v20)
        {
          v14 = v18;
        }
        else
        {
          v37 = v18;
          v38 = (id)objc_msgSend(v5, "rangeOfString:", CFSTR("-"));
          v45 = 0u;
          v46 = 0u;
          v47 = 0u;
          v48 = 0u;
          -[AXLanguageManager langMaps](self, "langMaps");
          obj = (id)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
          if (v21)
          {
            v22 = v21;
            v23 = *(_QWORD *)v46;
            v36 = v15;
            while (2)
            {
              for (i = 0; i != v22; ++i)
              {
                if (*(_QWORD *)v46 != v23)
                  objc_enumerationMutation(obj);
                v25 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
                objc_msgSend(v25, "generalLanguageID", v36);
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v5, "hasPrefix:", v26))
                {

LABEL_25:
                  if (v38 != (id)0x7FFFFFFFFFFFFFFFLL)
                  {
                    v43 = 0u;
                    v44 = 0u;
                    v41 = 0u;
                    v42 = 0u;
                    objc_msgSend(v25, "dialects");
                    v39 = (id)objc_claimAutoreleasedReturnValue();
                    v29 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
                    if (v29)
                    {
                      v30 = v29;
                      v31 = *(_QWORD *)v42;
                      while (2)
                      {
                        for (j = 0; j != v30; ++j)
                        {
                          if (*(_QWORD *)v42 != v31)
                            objc_enumerationMutation(v39);
                          v33 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * j);
                          objc_msgSend(v33, "specificLanguageID");
                          v34 = (void *)objc_claimAutoreleasedReturnValue();
                          v35 = objc_msgSend(v34, "isEqualToString:", v5);

                          if ((v35 & 1) != 0)
                          {
                            v14 = v33;

                            goto LABEL_37;
                          }
                        }
                        v30 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
                        if (v30)
                          continue;
                        break;
                      }
                    }

                  }
                  objc_msgSend(v25, "defaultDialect");
                  v14 = (id)objc_claimAutoreleasedReturnValue();
LABEL_37:

                  v15 = v36;
                  goto LABEL_38;
                }
                objc_msgSend(v25, "alternateLanguageIDs");
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                v28 = objc_msgSend(v27, "containsObject:", v5);

                if (v28)
                  goto LABEL_25;
              }
              v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
              v15 = v36;
              if (v22)
                continue;
              break;
            }
          }

          v14 = 0;
LABEL_38:
          v18 = v37;
        }

      }
    }

    return v14;
  }
  else
  {
    _AXAssert();
    -[AXLanguageManager dialectForSystemLanguage](self, "dialectForSystemLanguage");
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (id)dialectsThatCanSpeakCharacter:(unsigned __int16)a3
{
  return -[AXLanguageManager dialectsThatCanSpeakCharacter:overridePreferredLanguages:allowTransliteration:](self, "dialectsThatCanSpeakCharacter:overridePreferredLanguages:allowTransliteration:", a3, 0, 1);
}

- (id)dialectsThatCanSpeakCharacter:(unsigned __int16)a3 overridePreferredLanguages:(id)a4
{
  return -[AXLanguageManager dialectsThatCanSpeakCharacter:overridePreferredLanguages:allowTransliteration:](self, "dialectsThatCanSpeakCharacter:overridePreferredLanguages:allowTransliteration:", a3, a4, 1);
}

- (id)_systemPreferredDialectThatCanSpeak:(id)a3
{
  unsigned int (**v4)(id, void *);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v10;
  void *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v4 = (unsigned int (**)(id, void *))a3;
  -[AXLanguageManager dialectForSystemLanguage](self, "dialectForSystemLanguage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4[2](v4, v5))
  {
    v12[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[AXLanguageManager dialectForCurrentLocale](self, "dialectForCurrentLocale");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4[2](v4, v7))
    {
      v11 = v7;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v11, 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[AXLanguageManager dialectForCurrentRegion](self, "dialectForCurrentRegion");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v4[2](v4, v8))
      {
        v10 = v8;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v10, 1);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v6 = (void *)MEMORY[0x1E0C9AA60];
      }

    }
  }

  return v6;
}

- (void)_addDialectMapsForLanguageCodes:(id)a3 toResults:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __63__AXLanguageManager__addDialectMapsForLanguageCodes_toResults___block_invoke;
  v7[3] = &unk_1E24C7F90;
  v8 = v5;
  v6 = v5;
  objc_msgSend(a3, "enumerateObjectsWithOptions:usingBlock:", 2, v7);

}

void __63__AXLanguageManager__addDialectMapsForLanguageCodes_toResults___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;

  AXCLanguageConvertToCanonicalForm();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 32);
  v4 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __63__AXLanguageManager__addDialectMapsForLanguageCodes_toResults___block_invoke_2;
  v15[3] = &unk_1E24C7F68;
  v10 = v2;
  v16 = v10;
  v5 = objc_msgSend(v3, "indexOfObjectPassingTest:", v15);
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_4;
  v6 = *(void **)(a1 + 32);
  v13[0] = v4;
  v13[1] = 3221225472;
  v13[2] = __63__AXLanguageManager__addDialectMapsForLanguageCodes_toResults___block_invoke_3;
  v13[3] = &unk_1E24C7F68;
  v7 = v10;
  v14 = v7;
  v5 = objc_msgSend(v6, "indexOfObjectPassingTest:", v13);

  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_4;
  v8 = *(void **)(a1 + 32);
  v11[0] = v4;
  v11[1] = 3221225472;
  v11[2] = __63__AXLanguageManager__addDialectMapsForLanguageCodes_toResults___block_invoke_4;
  v11[3] = &unk_1E24C7F68;
  v12 = v7;
  v5 = objc_msgSend(v8, "indexOfObjectPassingTest:", v11);

  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_4:
    objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "removeObjectAtIndex:", v5);
    objc_msgSend(*(id *)(a1 + 32), "insertObject:atIndex:", v9, 0);

  }
}

uint64_t __63__AXLanguageManager__addDialectMapsForLanguageCodes_toResults___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "specificLanguageID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqual:", v3);

  return v4;
}

uint64_t __63__AXLanguageManager__addDialectMapsForLanguageCodes_toResults___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "langMap");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "generalLanguageID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "hasPrefix:", v4);

  return v5;
}

uint64_t __63__AXLanguageManager__addDialectMapsForLanguageCodes_toResults___block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(a2, "langMap", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "alternateLanguageIDs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    while (2)
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        if ((objc_msgSend(*(id *)(a1 + 32), "hasPrefix:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v8)) & 1) != 0)
        {
          v9 = 1;
          goto LABEL_11;
        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }
  v9 = 0;
LABEL_11:

  return v9;
}

- (id)_preferredOverrideDialectsThatCanSpeak:(id)a3 dialectIsSecondary:(id)a4 overridePreferredLanguages:(id)a5 preferOverrides:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;
  uint64_t *v33;
  BOOL v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  _BYTE v41[128];
  uint64_t v42;

  v6 = a6;
  v42 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v35 = 0;
  v36 = &v35;
  v37 = 0x3032000000;
  v38 = __Block_byref_object_copy__9;
  v39 = __Block_byref_object_dispose__9;
  v40 = (id)objc_opt_new();
  -[AXLanguageManager langMaps](self, "langMaps");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __122__AXLanguageManager__preferredOverrideDialectsThatCanSpeak_dialectIsSecondary_overridePreferredLanguages_preferOverrides___block_invoke;
  v29[3] = &unk_1E24C7FB8;
  v34 = v6;
  v14 = v12;
  v30 = v14;
  v15 = v10;
  v31 = v15;
  v16 = v11;
  v32 = v16;
  v33 = &v35;
  objc_msgSend(v13, "enumerateObjectsWithOptions:usingBlock:", 0, v29);

  -[AXLanguageManager _addDialectMapsForLanguageCodes:toResults:](self, "_addDialectMapsForLanguageCodes:toResults:", v14, v36[5]);
  if (!v6 || !objc_msgSend((id)v36[5], "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0u;
    v28 = 0u;
    v26 = 0u;
    objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages", 0, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v25, v41, 16);
    if (v19)
    {
      v20 = *(_QWORD *)v26;
      do
      {
        v21 = 0;
        do
        {
          if (*(_QWORD *)v26 != v20)
            objc_enumerationMutation(v18);
          AXCLanguageConvertToCanonicalForm();
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if (v22)
            objc_msgSend(v17, "addObject:", v22);

          ++v21;
        }
        while (v19 != v21);
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v25, v41, 16);
      }
      while (v19);
    }

    -[AXLanguageManager _addDialectMapsForLanguageCodes:toResults:](self, "_addDialectMapsForLanguageCodes:toResults:", v17, v36[5]);
  }
  objc_msgSend((id)v36[5], "array");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v35, 8);
  return v23;
}

void __122__AXLanguageManager__preferredOverrideDialectsThatCanSpeak_dialectIsSecondary_overridePreferredLanguages_preferOverrides___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (!*(_BYTE *)(a1 + 64)
    || (v5 = *(void **)(a1 + 32),
        objc_msgSend(v3, "generalLanguageID"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        LODWORD(v5) = objc_msgSend(v5, "containsObject:", v6),
        v6,
        (_DWORD)v5))
  {
    v7 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v4, "defaultDialect");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v7) = (*(uint64_t (**)(uint64_t, void *))(v7 + 16))(v7, v8);

    if ((_DWORD)v7)
    {
      v9 = *(_QWORD *)(a1 + 48);
      if (v9)
      {
        objc_msgSend(v4, "defaultDialect");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = (*(uint64_t (**)(uint64_t, void *))(v9 + 16))(v9, v10);

        if ((v11 & 1) == 0)
        {
          v12 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
          objc_msgSend(v4, "defaultDialect");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "addObject:", v13);

        }
      }
    }
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    objc_msgSend(v4, "dialects", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v21 != v17)
            objc_enumerationMutation(v14);
          v19 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
          if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 40) + 16))())
            objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "addObject:", v19);
        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v16);
    }

  }
}

- (id)_dialectsThatCanSpeak:(id)a3 dialectIsSecondary:(id)a4 overridePreferredLanguages:(id)a5 preferOverrides:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  id v11;
  id v12;
  void *v13;
  int v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint8_t v22[16];

  v6 = a6;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = v12;
  if (v6)
  {
    if (objc_msgSend(v12, "count"))
    {
      v14 = 1;
      goto LABEL_8;
    }
    AXLogSpokenContentTextProcessing();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v22 = 0;
      _os_log_impl(&dword_18C62B000, v15, OS_LOG_TYPE_DEFAULT, "preferOverrides=YES but no overridePreferredLanguages provided. forcing preferOverrides=NO", v22, 2u);
    }

  }
  v14 = 0;
LABEL_8:
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    -[AXLanguageManager _preferredOverrideDialectsThatCanSpeak:dialectIsSecondary:overridePreferredLanguages:preferOverrides:](self, "_preferredOverrideDialectsThatCanSpeak:dialectIsSecondary:overridePreferredLanguages:preferOverrides:", v10, v11, v13, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObjectsFromArray:", v17);

    if (!objc_msgSend(v16, "count"))
    {
      -[AXLanguageManager _systemPreferredDialectThatCanSpeak:](self, "_systemPreferredDialectThatCanSpeak:", v10);
      v18 = objc_claimAutoreleasedReturnValue();
LABEL_13:
      v20 = (void *)v18;
      objc_msgSend(v16, "addObjectsFromArray:", v18);

    }
  }
  else
  {
    -[AXLanguageManager _systemPreferredDialectThatCanSpeak:](self, "_systemPreferredDialectThatCanSpeak:", v10);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObjectsFromArray:", v19);

    if (!objc_msgSend(v16, "count"))
    {
      -[AXLanguageManager _preferredOverrideDialectsThatCanSpeak:dialectIsSecondary:overridePreferredLanguages:preferOverrides:](self, "_preferredOverrideDialectsThatCanSpeak:dialectIsSecondary:overridePreferredLanguages:preferOverrides:", v10, v11, v13, 0);
      v18 = objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    }
  }

  return v16;
}

- (id)dialectsThatCanSpeakCharacter:(unsigned __int16)a3 overridePreferredLanguages:(id)a4 allowTransliteration:(BOOL)a5
{
  return -[AXLanguageManager dialectsThatCanSpeakCharacter:overridePreferredLanguages:allowTransliteration:preferOverrides:](self, "dialectsThatCanSpeakCharacter:overridePreferredLanguages:allowTransliteration:preferOverrides:", a3, a4, a5, 0);
}

- (id)dialectsThatCanSpeakCharacter:(unsigned __int16)a3 overridePreferredLanguages:(id)a4 allowTransliteration:(BOOL)a5 preferOverrides:(BOOL)a6
{
  _QWORD v7[4];
  unsigned __int16 v8;
  _QWORD v9[4];
  unsigned __int16 v10;
  BOOL v11;

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __115__AXLanguageManager_dialectsThatCanSpeakCharacter_overridePreferredLanguages_allowTransliteration_preferOverrides___block_invoke;
  v9[3] = &__block_descriptor_35_e22_B16__0__AXDialectMap_8l;
  v10 = a3;
  v11 = a5;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __115__AXLanguageManager_dialectsThatCanSpeakCharacter_overridePreferredLanguages_allowTransliteration_preferOverrides___block_invoke_2;
  v7[3] = &__block_descriptor_34_e22_B16__0__AXDialectMap_8l;
  v8 = a3;
  -[AXLanguageManager _dialectsThatCanSpeak:dialectIsSecondary:overridePreferredLanguages:preferOverrides:](self, "_dialectsThatCanSpeak:dialectIsSecondary:overridePreferredLanguages:preferOverrides:", v9, v7, a4, a6);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __115__AXLanguageManager_dialectsThatCanSpeakCharacter_overridePreferredLanguages_allowTransliteration_preferOverrides___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "canSpeakCharacter:allowTransliteration:", *(unsigned __int16 *)(a1 + 32), *(unsigned __int8 *)(a1 + 34));
}

uint64_t __115__AXLanguageManager_dialectsThatCanSpeakCharacter_overridePreferredLanguages_allowTransliteration_preferOverrides___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isDialectSecondaryForCharacter:", *(unsigned __int16 *)(a1 + 32));
}

- (id)dialectsThatCanSpeakString:(id)a3
{
  return -[AXLanguageManager dialectsThatCanSpeakString:overridePreferredLanguages:](self, "dialectsThatCanSpeakString:overridePreferredLanguages:", a3, 0);
}

- (id)dialectsThatCanSpeakString:(id)a3 overridePreferredLanguages:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v6 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __75__AXLanguageManager_dialectsThatCanSpeakString_overridePreferredLanguages___block_invoke;
  v10[3] = &unk_1E24C8020;
  v11 = v6;
  v7 = v6;
  -[AXLanguageManager _dialectsThatCanSpeak:dialectIsSecondary:overridePreferredLanguages:preferOverrides:](self, "_dialectsThatCanSpeak:dialectIsSecondary:overridePreferredLanguages:preferOverrides:", v10, 0, a4, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t __75__AXLanguageManager_dialectsThatCanSpeakString_overridePreferredLanguages___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "canSpeakString:", *(_QWORD *)(a1 + 32));
}

- (id)dialectThatCanSpeakCharacter:(unsigned __int16)a3
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  int v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  void *v27;
  char v28;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
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
  -[AXLanguageManager dialectsThatCanSpeakCharacter:overridePreferredLanguages:allowTransliteration:](self, "dialectsThatCanSpeakCharacter:overridePreferredLanguages:allowTransliteration:", a3, 0, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count") == 1)
  {
    objc_msgSend(v3, "firstObject");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
    if (v31)
    {
      v6 = *(_QWORD *)v43;
      v32 = v5;
      v33 = v3;
      v30 = *(_QWORD *)v43;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v43 != v6)
            objc_enumerationMutation(v5);
          AXCLanguageConvertToCanonicalForm();
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = 0u;
          v39 = 0u;
          v40 = 0u;
          v41 = 0u;
          v9 = v3;
          v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
          if (v10)
          {
            v11 = v10;
            v12 = *(_QWORD *)v39;
            while (2)
            {
              for (i = 0; i != v11; ++i)
              {
                if (*(_QWORD *)v39 != v12)
                  objc_enumerationMutation(v9);
                v14 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
                objc_msgSend(v14, "langMap", v30);
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v15, "generalLanguageID");
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                v17 = objc_msgSend(v8, "hasPrefix:", v16);

                if ((v17 & 1) != 0)
                {
                  v4 = v14;

                  v5 = v32;
                  v3 = v33;
                  goto LABEL_30;
                }
              }
              v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
              if (v11)
                continue;
              break;
            }
          }

          ++v7;
          v5 = v32;
          v3 = v33;
          v6 = v30;
        }
        while (v7 != v31);
        v31 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
      }
      while (v31);
    }

    objc_msgSend(v3, "firstObject");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "langMap");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "isAmbiguous");

    if (v20)
    {
      v36 = 0u;
      v37 = 0u;
      v34 = 0u;
      v35 = 0u;
      v21 = v3;
      v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v34, v46, 16);
      if (v22)
      {
        v23 = v22;
        v24 = *(_QWORD *)v35;
        while (2)
        {
          for (j = 0; j != v23; ++j)
          {
            if (*(_QWORD *)v35 != v24)
              objc_enumerationMutation(v21);
            v26 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * j);
            objc_msgSend(v26, "specificLanguageID", v30);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = objc_msgSend(v27, "isEqualToString:", CFSTR("en-US"));

            if ((v28 & 1) != 0)
            {
              v4 = v26;

              goto LABEL_30;
            }
          }
          v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v34, v46, 16);
          if (v23)
            continue;
          break;
        }
      }

    }
    objc_msgSend(v3, "firstObject", v30);
    v4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_30:

  }
  return v4;
}

- (id)outputLanguageIdentifierForLanguage:(id)a3
{
  return (id)AXCRemapLanguageCodeToFallbackIfNeccessary();
}

- (id)ambiguousDialectsFromUserKeyboardPreferences
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[AXLanguageManager preferredLanguageIDsFromUserSelectedKeyboards](self, "preferredLanguageIDsFromUserSelectedKeyboards");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        -[AXLanguageManager dialectForLanguageID:](self, "dialectForLanguageID:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v9), (_QWORD)v14);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "langMap");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isAmbiguous");

        if (v12)
          objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  return v4;
}

- (BOOL)isCharacterCommon:(unsigned __int16)a3
{
  uint64_t v3;
  void *v4;

  v3 = a3;
  -[AXLanguageManager commonCharacters](self, "commonCharacters");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v4, "characterIsMember:", v3);

  return v3;
}

- (BOOL)isStringComposedByCommonCharacters:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  BOOL v11;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    v5 = 0;
    v6 = 0;
    v7 = 0;
    v8 = 0;
    while (v5 == v8 + v7)
    {
      v8 = v5;
      v7 = v6;
      -[AXLanguageManager commonCharacters](self, "commonCharacters");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "rangeOfCharacterFromSet:options:range:", v9, 1, v6 + v5, objc_msgSend(v4, "length") - (v6 + v5));
      v6 = v10;

      if (v5 + v6 >= (unint64_t)objc_msgSend(v4, "length"))
      {
        v11 = v5 != 0x7FFFFFFFFFFFFFFFLL;
        goto LABEL_8;
      }
    }
    v11 = 0;
  }
  else
  {
    v11 = 1;
  }
LABEL_8:

  return v11;
}

- (void)updateCachedDialects
{
  AXLanguageManager *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t k;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t m;
  void *v40;
  void *v41;
  void *v42;
  int v43;
  uint64_t v44;
  void *v45;
  void *v46;
  id obj;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  AXLanguageManager *v51;
  uint64_t v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  _BYTE v73[128];
  _BYTE v74[128];
  _BYTE v75[128];
  _BYTE v76[128];
  _BYTE v77[128];
  uint64_t v78;

  v2 = self;
  v78 = *MEMORY[0x1E0C80C00];
  -[AXLanguageManager systemLanguageID](self, "systemLanguageID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXLanguageManager outputLanguageIdentifierForLanguage:](v2, "outputLanguageIdentifierForLanguage:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v71 = 0u;
  v72 = 0u;
  v69 = 0u;
  v70 = 0u;
  -[AXLanguageManager langMaps](v2, "langMaps");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v69, v77, 16);
  v51 = v2;
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v70;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v70 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * i);
        objc_msgSend(v10, "generalLanguageID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v4, "hasPrefix:", v11);

        if (v12)
        {
          objc_msgSend(v10, "defaultDialect");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[AXLanguageManager setDialectForSystemLanguage:](v2, "setDialectForSystemLanguage:", v13);
        }
        else
        {
          v67 = 0u;
          v68 = 0u;
          v65 = 0u;
          v66 = 0u;
          objc_msgSend(v10, "alternateLanguageIDs");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v65, v76, 16);
          if (v14)
          {
            v15 = v14;
            v16 = *(_QWORD *)v66;
            while (2)
            {
              for (j = 0; j != v15; ++j)
              {
                if (*(_QWORD *)v66 != v16)
                  objc_enumerationMutation(v13);
                if (objc_msgSend(v4, "hasPrefix:", *(_QWORD *)(*((_QWORD *)&v65 + 1) + 8 * j)))
                {
                  objc_msgSend(v10, "defaultDialect");
                  v18 = (void *)objc_claimAutoreleasedReturnValue();
                  v2 = v51;
                  -[AXLanguageManager setDialectForSystemLanguage:](v51, "setDialectForSystemLanguage:", v18);

                  goto LABEL_18;
                }
              }
              v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v65, v76, 16);
              if (v15)
                continue;
              break;
            }
            v2 = v51;
          }
        }
LABEL_18:

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v69, v77, 16);
    }
    while (v7);
  }

  -[AXLanguageManager userLocale](v2, "userLocale");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectForKey:", *MEMORY[0x1E0C997E8]);
  v20 = objc_claimAutoreleasedReturnValue();

  v49 = (void *)v20;
  if (v20)
  {
    v63 = 0u;
    v64 = 0u;
    v61 = 0u;
    v62 = 0u;
    -[AXLanguageManager langMaps](v2, "langMaps");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v61, v75, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v62;
      do
      {
        for (k = 0; k != v23; ++k)
        {
          if (*(_QWORD *)v62 != v24)
            objc_enumerationMutation(v21);
          v26 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * k);
          objc_msgSend(v26, "generalLanguageID");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = objc_msgSend(v49, "hasPrefix:", v27);

          if (v28)
          {
            objc_msgSend(v26, "defaultDialect");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            -[AXLanguageManager setDialectForCurrentLocale:](v2, "setDialectForCurrentLocale:", v29);

          }
        }
        v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v61, v75, 16);
      }
      while (v23);
    }

  }
  -[AXLanguageManager userLocale](v2, "userLocale");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = *MEMORY[0x1E0C997B0];
  objc_msgSend(v30, "objectForKey:", *MEMORY[0x1E0C997B0]);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (v32)
  {
    v46 = v4;
    v59 = 0u;
    v60 = 0u;
    v57 = 0u;
    v58 = 0u;
    -[AXLanguageManager langMaps](v2, "langMaps");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v50 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v74, 16);
    if (v50)
    {
      v48 = *(_QWORD *)v58;
      do
      {
        v33 = 0;
        do
        {
          if (*(_QWORD *)v58 != v48)
            objc_enumerationMutation(obj);
          v52 = v33;
          v34 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * v33);
          v53 = 0u;
          v54 = 0u;
          v55 = 0u;
          v56 = 0u;
          objc_msgSend(v34, "dialects");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v53, v73, 16);
          if (v36)
          {
            v37 = v36;
            v38 = *(_QWORD *)v54;
            while (2)
            {
              for (m = 0; m != v37; ++m)
              {
                if (*(_QWORD *)v54 != v38)
                  objc_enumerationMutation(v35);
                v40 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * m);
                objc_msgSend(v40, "locale");
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v41, "objectForKey:", v31);
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                v43 = objc_msgSend(v42, "hasSuffix:", v32);

                if (v43)
                {
                  -[AXLanguageManager setDialectForCurrentRegion:](v51, "setDialectForCurrentRegion:", v40);
                  goto LABEL_47;
                }
              }
              v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v53, v73, 16);
              if (v37)
                continue;
              break;
            }
          }
LABEL_47:

          v33 = v52 + 1;
        }
        while (v52 + 1 != v50);
        v50 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v74, 16);
      }
      while (v50);
    }

    v4 = v46;
    v2 = v51;
  }
  if (!v2->_dialectForSystemLanguage)
  {
    if (v2->_dialectForCurrentLocale)
    {
      -[AXLanguageManager dialectForCurrentLocale](v2, "dialectForCurrentLocale");
      v44 = objc_claimAutoreleasedReturnValue();
LABEL_55:
      v45 = (void *)v44;
      -[AXLanguageManager setDialectForSystemLanguage:](v2, "setDialectForSystemLanguage:", v44);

      goto LABEL_56;
    }
    if (v2->_dialectForCurrentRegion)
    {
      -[AXLanguageManager dialectForCurrentRegion](v2, "dialectForCurrentRegion");
      v44 = objc_claimAutoreleasedReturnValue();
      goto LABEL_55;
    }
  }
LABEL_56:

}

- (id)descriptionOfWord:(id)a3 forLanguage:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;

  v5 = (void *)MEMORY[0x1E0CF4928];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "descriptionOfWord:forLanguage:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSSet)preferredLanguageIDsFromUserSelectedKeyboards
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id obj;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (preferredLanguageIDsFromUserSelectedKeyboards_onceToken != -1)
    dispatch_once(&preferredLanguageIDsFromUserSelectedKeyboards_onceToken, &__block_literal_global_72);
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend((id)preferredLanguageIDsFromUserSelectedKeyboards_inputController, "safeValueForKey:", CFSTR("enabledInputModeIdentifiers"));
  obj = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v16 != v5)
          objc_enumerationMutation(obj);
        v7 = *(id *)(*((_QWORD *)&v15 + 1) + 8 * i);
        v8 = objc_msgSend(v7, "rangeOfString:", CFSTR("-"));
        v9 = v7;
        if (v8 != 0x7FFFFFFFFFFFFFFFLL)
        {
          objc_msgSend(v7, "substringToIndex:", v8);
          v9 = (void *)objc_claimAutoreleasedReturnValue();

        }
        v10 = objc_msgSend(v7, "rangeOfString:", CFSTR("@"));
        if (v10 != 0x7FFFFFFFFFFFFFFFLL)
        {
          objc_msgSend(v7, "substringToIndex:", v10);
          v11 = objc_claimAutoreleasedReturnValue();

          v9 = (void *)v11;
        }
        objc_msgSend(v9, "stringByReplacingOccurrencesOfString:withString:", CFSTR("_"), CFSTR("-"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "addObject:", v12);

      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v4);
  }

  return (NSSet *)v2;
}

void __66__AXLanguageManager_preferredLanguageIDsFromUserSelectedKeyboards__block_invoke()
{
  uint64_t v0;
  void *v1;

  -[objc_class safeValueForKey:](NSClassFromString(CFSTR("UIKeyboardInputModeController")), "safeValueForKey:", CFSTR("sharedInputModeController"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)preferredLanguageIDsFromUserSelectedKeyboards_inputController;
  preferredLanguageIDsFromUserSelectedKeyboards_inputController = v0;

}

- (id)characterSetForRanges:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v15;
  id obj;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "length"))
  {
    v4 = objc_alloc_init(MEMORY[0x1E0CB3780]);
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v15 = v3;
    objc_msgSend(v3, "componentsSeparatedByString:", CFSTR(" "));
    obj = (id)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v18;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v18 != v7)
            objc_enumerationMutation(obj);
          objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v8), "componentsSeparatedByString:", CFSTR("-"));
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "objectAtIndex:", 0);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "integerValue");
          objc_msgSend(v9, "objectAtIndex:", 1);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "integerValue");

          objc_msgSend(v4, "addCharactersInRange:", v11, v13);
          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v6);
    }

    v3 = v15;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)_loadLangMaps
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _UNKNOWN **v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  BOOL v27;
  void *v28;
  void *v29;
  AXDialectMap *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t j;
  uint64_t v37;
  AXLangMap *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t k;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v48;
  void *v49;
  id obj;
  uint64_t v51;
  void *v52;
  void *v53;
  uint64_t v54;
  unsigned int v55;
  unsigned int v56;
  unsigned int v57;
  void *v58;
  void *v59;
  uint64_t v60;
  void *v61;
  id v62;
  uint64_t v63;
  AXLanguageManager *v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _QWORD v69[5];
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  _BYTE v82[128];
  _BYTE v83[128];
  _BYTE v84[128];
  _BYTE v85[128];
  uint64_t v86;

  v86 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXLanguageManager _synthesisProviderDialectMapPerLanguage](self, "_synthesisProviderDialectMapPerLanguage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = self;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pathForResource:ofType:", CFSTR("SynthesizerLanguageMap-UnifiedSpeech"), CFSTR("plist"));
  v6 = objc_claimAutoreleasedReturnValue();

  v49 = (void *)v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfFile:", v6);
  v78 = 0u;
  v79 = 0u;
  v80 = 0u;
  v81 = 0u;
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "objectForKey:", CFSTR("languageMaps"));
  obj = (id)objc_claimAutoreleasedReturnValue();
  v7 = &off_1E24C2000;
  v54 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v78, v85, 16);
  if (v54)
  {
    v51 = *(_QWORD *)v79;
    v52 = v4;
    v53 = v3;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v79 != v51)
          objc_enumerationMutation(obj);
        v60 = v8;
        v9 = *(void **)(*((_QWORD *)&v78 + 1) + 8 * v8);
        objc_msgSend(v9, "objectForKey:", CFSTR("languageID"));
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKey:", CFSTR("alternateLanguageIDs"));
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKey:", CFSTR("ambiguousWithLanguages"));
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKey:", CFSTR("isAmbiguous"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = objc_msgSend(v10, "BOOLValue");

        objc_msgSend(v9, "objectForKey:", CFSTR("isWestern"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v56 = objc_msgSend(v11, "BOOLValue");

        objc_msgSend(v9, "objectForKey:", CFSTR("isRTL"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v55 = objc_msgSend(v12, "BOOLValue");

        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v74 = 0u;
        v75 = 0u;
        v76 = 0u;
        v77 = 0u;
        objc_msgSend(v9, "objectForKey:", CFSTR("localeLanguageMaps"));
        v62 = (id)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v74, v84, 16);
        if (v14)
        {
          v15 = v14;
          v63 = *(_QWORD *)v75;
          do
          {
            for (i = 0; i != v15; ++i)
            {
              if (*(_QWORD *)v75 != v63)
                objc_enumerationMutation(v62);
              v17 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * i);
              v18 = objc_alloc(MEMORY[0x1E0C99DC8]);
              objc_msgSend(v17, "objectForKey:", CFSTR("localeID"));
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              v20 = (void *)objc_msgSend(v18, "initWithLocaleIdentifier:", v19);

              objc_msgSend(v17, "objectForKey:", CFSTR("languageID"));
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "objectForKey:", CFSTR("speakableCharacterRanges"));
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              -[AXLanguageManager characterSetForRanges:](v64, "characterSetForRanges:", v22);
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "objectForKey:", CFSTR("supplementaryCharacterRanges"));
              v24 = (void *)objc_claimAutoreleasedReturnValue();

              -[AXLanguageManager characterSetForRanges:](v64, "characterSetForRanges:", v24);
              v25 = objc_claimAutoreleasedReturnValue();
              v26 = (void *)v25;
              if (v23)
                v27 = v25 == 0;
              else
                v27 = 1;
              if (!v27)
                objc_msgSend(v23, "formUnionWithCharacterSet:", v25);
              objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("secondaryLanguageRange"));
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              -[AXLanguageManager characterSetForRanges:](v64, "characterSetForRanges:", v28);
              v29 = (void *)objc_claimAutoreleasedReturnValue();

              v30 = -[AXDialectMap initWithLocale:specificLanguageID:speakableCharacters:secondaryLanguageRange:]([AXDialectMap alloc], "initWithLocale:specificLanguageID:speakableCharacters:secondaryLanguageRange:", v20, v21, v23, v29);
              objc_msgSend(v13, "addObject:", v30);

            }
            v15 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v74, v84, 16);
          }
          while (v15);
        }

        v4 = v52;
        objc_msgSend(v52, "objectForKey:", v61);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v70 = 0u;
        v71 = 0u;
        v72 = 0u;
        v73 = 0u;
        v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v70, v83, 16);
        v3 = v53;
        v7 = &off_1E24C2000;
        v33 = MEMORY[0x1E0C809B0];
        if (v32)
        {
          v34 = v32;
          v35 = *(_QWORD *)v71;
          do
          {
            for (j = 0; j != v34; ++j)
            {
              if (*(_QWORD *)v71 != v35)
                objc_enumerationMutation(v31);
              v37 = *(_QWORD *)(*((_QWORD *)&v70 + 1) + 8 * j);
              v69[0] = v33;
              v69[1] = 3221225472;
              v69[2] = __34__AXLanguageManager__loadLangMaps__block_invoke;
              v69[3] = &unk_1E24C8020;
              v69[4] = v37;
              if ((objc_msgSend(v13, "ax_containsObjectUsingBlock:", v69) & 1) == 0)
                objc_msgSend(v13, "addObject:", v37);
            }
            v34 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v70, v83, 16);
          }
          while (v34);
        }
        objc_msgSend(v52, "removeObjectForKey:", v61);
        v38 = -[AXLangMap initWithLanguageID:isWestern:isAmbiguous:isRTL:dialects:alternateLanguageIDs:associatedAmbiguousLanguages:]([AXLangMap alloc], "initWithLanguageID:isWestern:isAmbiguous:isRTL:dialects:alternateLanguageIDs:associatedAmbiguousLanguages:", v61, v56, v57, v55, v13, v59, v58);
        objc_msgSend(v53, "addObject:", v38);

        v8 = v60 + 1;
      }
      while (v60 + 1 != v54);
      v54 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v78, v85, 16);
    }
    while (v54);
  }

  v67 = 0u;
  v68 = 0u;
  v65 = 0u;
  v66 = 0u;
  objc_msgSend(v4, "allKeys");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v65, v82, 16);
  if (v40)
  {
    v41 = v40;
    v42 = *(_QWORD *)v66;
    do
    {
      for (k = 0; k != v41; ++k)
      {
        if (*(_QWORD *)v66 != v42)
          objc_enumerationMutation(v39);
        v44 = *(_QWORD *)(*((_QWORD *)&v65 + 1) + 8 * k);
        objc_msgSend(v4, "objectForKey:", v44);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = (void *)objc_msgSend(objc_alloc((Class)v7[388]), "initWithLanguageID:isWestern:isAmbiguous:isRTL:dialects:alternateLanguageIDs:associatedAmbiguousLanguages:", v44, 0, 0, 0, v45, 0, 0);
        objc_msgSend(v3, "addObject:", v46);

      }
      v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v65, v82, 16);
    }
    while (v41);
  }

  return v3;
}

uint64_t __34__AXLanguageManager__loadLangMaps__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "specificLanguageID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "specificLanguageID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  return v5;
}

- (id)_synthesisProviderDialectMapPerLanguage
{
  void *v3;
  unint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  AXDialectMap *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  AXLanguageManager *v19;
  void *v20;
  void *v21;
  id obj;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  _QWORD v31[4];
  NSObject *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t buf[4];
  uint64_t v42;
  NSObject *v43;
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  objc_msgSend(MEMORY[0x1E0DBEF58], "allSynthesisProviderVoices");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
  if (v25)
  {
    v24 = *(_QWORD *)v38;
    v4 = 0x1E0C99000uLL;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v38 != v24)
          objc_enumerationMutation(obj);
        v26 = v5;
        v6 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * v5);
        v33 = 0u;
        v34 = 0u;
        v35 = 0u;
        v36 = 0u;
        v29 = v6;
        objc_msgSend(v6, "supportedLanguages");
        v27 = (id)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v33, v44, 16);
        if (v30)
        {
          v28 = *(_QWORD *)v34;
          do
          {
            for (i = 0; i != v30; ++i)
            {
              if (*(_QWORD *)v34 != v28)
                objc_enumerationMutation(v27);
              v8 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i);
              objc_msgSend(*(id *)(v4 + 3528), "localeWithLocaleIdentifier:", v8);
              v9 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v29, "supportedLanguages");
              v10 = (void *)objc_claimAutoreleasedReturnValue();
              -[AXLanguageManager _exemplarCharacterSetFromLanguages:](self, "_exemplarCharacterSetFromLanguages:", v10);
              v11 = (void *)objc_claimAutoreleasedReturnValue();

              if (v9)
              {
                v12 = [AXDialectMap alloc];
                objc_msgSend(v9, "exemplarCharacterSet");
                v13 = (void *)objc_claimAutoreleasedReturnValue();
                v14 = -[AXDialectMap initWithLocale:specificLanguageID:speakableCharacters:secondaryLanguageRange:](v12, "initWithLocale:specificLanguageID:speakableCharacters:secondaryLanguageRange:", v9, v8, v13, v11);

                objc_msgSend(v9, "languageCode");
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v3, "objectForKey:", v15);
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                if (v16)
                {
                  v31[0] = MEMORY[0x1E0C809B0];
                  v31[1] = 3221225472;
                  v31[2] = __60__AXLanguageManager__synthesisProviderDialectMapPerLanguage__block_invoke;
                  v31[3] = &unk_1E24C8020;
                  v17 = v14;
                  v32 = v17;
                  if ((objc_msgSend(v16, "ax_containsObjectUsingBlock:", v31) & 1) == 0)
                    objc_msgSend(v16, "addObject:", v17);
                  objc_msgSend(v3, "setObject:forKey:", v16, v15);
                  v18 = v32;
                }
                else
                {
                  v43 = v14;
                  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v43, 1);
                  v18 = (void *)objc_claimAutoreleasedReturnValue();
                  v19 = self;
                  v20 = v3;
                  v21 = (void *)objc_msgSend(v18, "mutableCopy");
                  objc_msgSend(v20, "setObject:forKey:", v21, v15);

                  v3 = v20;
                  self = v19;
                  v4 = 0x1E0C99000;
                }

              }
              else
              {
                AXTTSLogCommon();
                v14 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  v42 = v8;
                  _os_log_error_impl(&dword_18C62B000, v14, OS_LOG_TYPE_ERROR, "No locale found for %@", buf, 0xCu);
                }
              }

            }
            v30 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v33, v44, 16);
          }
          while (v30);
        }

        v5 = v26 + 1;
      }
      while (v26 + 1 != v25);
      v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
    }
    while (v25);
  }

  return v3;
}

uint64_t __60__AXLanguageManager__synthesisProviderDialectMapPerLanguage__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "specificLanguageID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "specificLanguageID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  return v5;
}

- (id)_exemplarCharacterSetFromLanguages:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0CB3780]);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v9), (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "exemplarCharacterSet");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "formUnionWithCharacterSet:", v11);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  return v4;
}

- (void)_handleUserLocaleDidChange:(id)a3
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXLanguageManager setUserLocale:](self, "setUserLocale:", v4);

  -[AXLanguageManager updateCachedDialects](self, "updateCachedDialects");
  -[AXLanguageManager set_unitTest_didUpdateForLocaleChange:](self, "set_unitTest_didUpdateForLocaleChange:", 1);
}

+ (id)nameForAlternativeVoiceIdentifier:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0DBEF18], "nameForVoiceIdentifier:", a3);
}

+ (id)dialectForAlternativeVoiceIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  v3 = a3;
  if (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0DBEF68]))
  {
    +[AXLanguageManager sharedInstance](AXLanguageManager, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dialectForLanguageID:", CFSTR("en-US"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else if (objc_msgSend(MEMORY[0x1E0DBEF18], "isSiriVoiceIdentifier:", v3))
  {
    TTSGetComponentsInNamedSiriVoiceIdentifier();
    v6 = 0;
    +[AXLanguageManager sharedInstance](AXLanguageManager, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dialectForLanguageID:", v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)didUpdateForLocaleChange
{
  _BOOL4 v3;

  v3 = -[AXLanguageManager _unitTest_didUpdateForLocaleChange](self, "_unitTest_didUpdateForLocaleChange");
  if (v3)
    -[AXLanguageManager set_unitTest_didUpdateForLocaleChange:](self, "set_unitTest_didUpdateForLocaleChange:", 0);
  return v3;
}

- (void)setLangMaps:(id)a3
{
  objc_storeStrong((id *)&self->_langMaps, a3);
}

- (NSCharacterSet)commonCharacters
{
  return self->_commonCharacters;
}

- (void)setCommonCharacters:(id)a3
{
  objc_storeStrong((id *)&self->_commonCharacters, a3);
}

- (NSLocale)userLocale
{
  return self->_userLocale;
}

- (void)setUserLocale:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (BOOL)_unitTest_didUpdateForLocaleChange
{
  return self->__unitTest_didUpdateForLocaleChange;
}

- (void)set_unitTest_didUpdateForLocaleChange:(BOOL)a3
{
  self->__unitTest_didUpdateForLocaleChange = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userLocale, 0);
  objc_storeStrong((id *)&self->_commonCharacters, 0);
  objc_storeStrong((id *)&self->_langMaps, 0);
  objc_storeStrong((id *)&self->_dialectForCurrentRegion, 0);
  objc_storeStrong((id *)&self->_dialectForCurrentLocale, 0);
  objc_storeStrong((id *)&self->_dialectForSystemLanguage, 0);
}

@end
