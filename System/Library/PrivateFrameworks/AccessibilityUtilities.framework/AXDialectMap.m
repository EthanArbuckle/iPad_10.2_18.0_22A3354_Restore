@implementation AXDialectMap

- (AXDialectMap)initWithLocale:(id)a3 specificLanguageID:(id)a4 speakableCharacters:(id)a5 secondaryLanguageRange:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  AXDialectMap *v14;
  AXDialectMap *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  AXDialectMap *v26;
  objc_super v28;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v28.receiver = self;
  v28.super_class = (Class)AXDialectMap;
  v14 = -[AXDialectMap init](&v28, sel_init);
  v15 = v14;
  if (v14)
  {
    -[AXDialectMap setLocale:](v14, "setLocale:", v10);
    -[AXDialectMap setSpeakableCharacters:](v15, "setSpeakableCharacters:", v12);
    -[AXDialectMap setSecondaryLanguageRange:](v15, "setSecondaryLanguageRange:", v13);
    if (v11)
    {
      objc_msgSend(v11, "stringByReplacingOccurrencesOfString:withString:", CFSTR("_"), CFSTR("-"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      AXCLanguageConvertToCanonicalForm();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXDialectMap setSpecificLanguageID:](v15, "setSpecificLanguageID:", v17);
    }
    else
    {
      -[AXDialectMap locale](v15, "locale");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "localeIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "stringByReplacingOccurrencesOfString:withString:", CFSTR("_"), CFSTR("-"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      AXCLanguageConvertToCanonicalForm();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXDialectMap setSpecificLanguageID:](v15, "setSpecificLanguageID:", v19);

    }
    -[AXDialectMap specificLanguageID](v15, "specificLanguageID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "hasPrefix:", CFSTR("zh"));

    if (v21)
    {
      -[AXDialectMap specificLanguageID](v15, "specificLanguageID");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "stringByReplacingOccurrencesOfString:withString:", CFSTR("Hant-"), &stru_1E24CAB08);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXDialectMap setSpecificLanguageID:](v15, "setSpecificLanguageID:", v23);

      -[AXDialectMap specificLanguageID](v15, "specificLanguageID");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "stringByReplacingOccurrencesOfString:withString:", CFSTR("Hans-"), &stru_1E24CAB08);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXDialectMap setSpecificLanguageID:](v15, "setSpecificLanguageID:", v25);

    }
    v26 = v15;
  }

  return v15;
}

- (id)basicDescription
{
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[AXDialectMap langMap](self, "langMap");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userPreferredDialect");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqual:", self))
    v6 = CFSTR("* ");
  else
    v6 = &stru_1E24CAB08;
  -[AXDialectMap voiceName](self, "voiceName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXDialectMap locale](self, "locale");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localeIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXDialectMap specificLanguageID](self, "specificLanguageID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@AXDialect <%p>. Voice:%@. LocaleID:%@ LangID:%@"), v6, self, v7, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (AXLanguageManager)langManager
{
  return +[AXLanguageManager sharedInstance](AXLanguageManager, "sharedInstance");
}

- (NSString)regionID
{
  void *v2;
  void *v3;

  -[AXDialectMap locale](self, "locale");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localeIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)languageNameInCurrentLocale
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  __CFString *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;

  -[AXDialectMap langManager](self, "langManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "userLocale");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[AXDialectMap locale](self, "locale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localeIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isEqualToString:", CFSTR("wuu_CN")) & 1) != 0)
  {
    v7 = CFSTR("Shanghainese");
LABEL_5:
    AXLocalizedStringWithLocale(v7, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("ar_001")))
  {
    v7 = CFSTR("Arabic");
    goto LABEL_5;
  }
  v8 = 0;
LABEL_7:

  if (v8)
  {
    v9 = v8;
  }
  else
  {
    v10 = *MEMORY[0x1E0C997E8];
    -[AXDialectMap locale](self, "locale");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "languageCode");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "displayNameForKey:value:", v10, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "capitalizedStringWithLocale:", v4);
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  return (NSString *)v9;
}

- (NSString)languageNameInNativeLocale
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  -[AXDialectMap locale](self, "locale");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localeIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXDialectMap locale](self, "locale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localeIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _languageAndRegionNameForNonConformingCodes(v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = v7;
  }
  else
  {
    -[AXDialectMap locale](self, "locale");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *MEMORY[0x1E0C997E8];
    -[AXDialectMap locale](self, "locale");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "languageCode");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "displayNameForKey:value:", v10, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[AXDialectMap locale](self, "locale");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "capitalizedStringWithLocale:", v14);
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  return (NSString *)v8;
}

- (NSString)languageNameAndLocaleInCurrentLocale
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  -[AXDialectMap langManager](self, "langManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "userLocale");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[AXDialectMap locale](self, "locale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localeIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _languageAndRegionNameForNonConformingCodes(v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = v7;
  }
  else
  {
    v9 = (void *)*MEMORY[0x1E0C997E0];
    -[AXDialectMap locale](self, "locale");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localeIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    _icuDisplayNameForLocale(v4, v9, v11);
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  return (NSString *)v8;
}

- (NSString)localeNameInCurrentLocale
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

  -[AXDialectMap langManager](self, "langManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "userLocale");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)*MEMORY[0x1E0C997B0];
  v6 = (void *)MEMORY[0x1E0C99DC8];
  -[AXDialectMap locale](self, "locale");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localeIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "componentsFromLocaleIdentifier:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  _icuDisplayNameForLocale(v4, v5, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "capitalizedStringWithLocale:", v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v12;
}

- (NSString)languageNameAndLocaleInNativeLocale
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;

  -[AXDialectMap locale](self, "locale");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localeIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXDialectMap locale](self, "locale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localeIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _languageAndRegionNameForNonConformingCodes(v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = v7;
  }
  else
  {
    -[AXDialectMap specificLanguageID](self, "specificLanguageID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[AXLanguageManager nonlocalizedNameForLanguage:](AXLanguageManager, "nonlocalizedNameForLanguage:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      -[AXDialectMap locale](self, "locale");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = *MEMORY[0x1E0C997E0];
      -[AXDialectMap locale](self, "locale");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "localeIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "displayNameForKey:value:", v12, v14);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
    -[AXDialectMap locale](self, "locale");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "capitalizedStringWithLocale:", v15);
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  return (NSString *)v8;
}

- (BOOL)isDialectSecondaryForCharacter:(unsigned __int16)a3
{
  uint64_t v3;
  void *v4;

  v3 = a3;
  -[AXDialectMap secondaryLanguageRange](self, "secondaryLanguageRange");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v4, "characterIsMember:", v3);

  return v3;
}

- (BOOL)canSpeakCharacter:(unsigned __int16)a3
{
  return -[AXDialectMap canSpeakCharacter:allowTransliteration:](self, "canSpeakCharacter:allowTransliteration:", a3, 1);
}

- (BOOL)hasSpeakableCharacters
{
  void *v2;
  BOOL v3;

  -[AXDialectMap speakableCharacters](self, "speakableCharacters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)canSpeakCharacter:(unsigned __int16)a3 allowTransliteration:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v5;
  void *v7;
  void *v8;
  char v9;
  void *v10;

  v4 = a4;
  v5 = a3;
  -[AXDialectMap speakableCharacters](self, "speakableCharacters");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    return 0;
  -[AXDialectMap speakableCharacters](self, "speakableCharacters");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "characterIsMember:", v5);
  if ((v9 & 1) == 0 && v4)
  {
    if (-[AXDialectMap speakingRequiresTransliteration](self, "speakingRequiresTransliteration"))
    {
      -[AXDialectMap _transliteratedSpeechCharacters](self, "_transliteratedSpeechCharacters");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v10, "characterIsMember:", v5);

    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (BOOL)canSpeakLongCharacter:(unsigned int)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  char v7;

  v3 = *(_QWORD *)&a3;
  -[AXDialectMap speakableCharacters](self, "speakableCharacters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    return 0;
  -[AXDialectMap speakableCharacters](self, "speakableCharacters");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "longCharacterIsMember:", v3);

  return v7;
}

- (BOOL)canSpeakString:(id)a3
{
  return -[AXDialectMap canSpeakString:allowsTransliteration:](self, "canSpeakString:allowsTransliteration:", a3, 1);
}

- (BOOL)canSpeakString:(id)a3 allowsTransliteration:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  BOOL v11;
  unint64_t i;
  uint64_t v13;

  v4 = a4;
  v6 = a3;
  if (v6
    && (-[AXDialectMap speakableCharacters](self, "speakableCharacters"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v7,
        v7))
  {
    +[AXLanguageManager sharedInstance](AXLanguageManager, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v6, "length");
    if (v9)
    {
      v10 = v9;
      v11 = 0;
      for (i = 0; i != v10; v11 = i >= v10)
      {
        v13 = objc_msgSend(v6, "characterAtIndex:", i);
        if ((objc_msgSend(v8, "isCharacterCommon:", v13) & 1) == 0
          && !-[AXDialectMap canSpeakCharacter:allowTransliteration:](self, "canSpeakCharacter:allowTransliteration:", v13, v4))
        {
          break;
        }
        ++i;
      }
    }
    else
    {
      v11 = 1;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)_languageIsKorean
{
  void *v2;
  void *v3;
  char v4;

  -[AXDialectMap locale](self, "locale");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "languageIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasPrefix:", CFSTR("ko"));

  return v4;
}

- (id)transliteratedStringForString:(id)a3
{
  id v4;
  id v5;
  void *v6;

  v4 = a3;
  if (-[AXDialectMap _languageIsKorean](self, "_languageIsKorean"))
  {
    -[AXDialectMap _stringByTransliterationHanjaToHangul:](self, "_stringByTransliterationHanjaToHangul:", v4);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = v4;
  }
  v6 = v5;

  return v6;
}

- (id)_transliteratedSpeechCharacters
{
  void *v2;

  if (-[AXDialectMap _languageIsKorean](self, "_languageIsKorean"))
  {
    +[AXDialectMap _hanjaCharacterSet](AXDialectMap, "_hanjaCharacterSet");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

+ (id)_hanjaToHangulMap
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__AXDialectMap__hanjaToHangulMap__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_hanjaToHangulMap_onceToken != -1)
    dispatch_once(&_hanjaToHangulMap_onceToken, block);
  return (id)_hanjaToHangulMap_hanjaToHangulMap;
}

void __33__AXDialectMap__hanjaToHangulMap__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "pathForResource:ofType:", CFSTR("hanjaToHangul"), CFSTR("plist"));
  v3 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfFile:", v3);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)_hanjaToHangulMap_hanjaToHangulMap;
  _hanjaToHangulMap_hanjaToHangulMap = v1;

}

+ (id)_hanjaCharacterSet
{
  if (_hanjaCharacterSet_onceToken != -1)
    dispatch_once(&_hanjaCharacterSet_onceToken, &__block_literal_global_30);
  return (id)_hanjaCharacterSet_hanjaCharacterSet;
}

void __34__AXDialectMap__hanjaCharacterSet__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  +[AXDialectMap _hanjaToHangulMap](AXDialectMap, "_hanjaToHangulMap");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  objc_msgSend(v0, "allKeys", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(v1, "appendString:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v6++));
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }

  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", v1);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)_hanjaCharacterSet_hanjaCharacterSet;
  _hanjaCharacterSet_hanjaCharacterSet = v7;

}

- (id)_stringByTransliterationHanjaToHangul:(id)a3
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  AXDialectMap *v30;
  SEL v31;
  void *v32;
  id v33;
  void *v34;

  v5 = a3;
  +[AXDialectMap _hanjaCharacterSet](AXDialectMap, "_hanjaCharacterSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "rangeOfCharacterFromSet:", v6) == 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = v5;
  }
  else
  {
    +[AXDialectMap _hanjaToHangulMap](AXDialectMap, "_hanjaToHangulMap");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v5;
    v10 = v8;
    v32 = v6;
    v33 = v5;
    v34 = v10;
    if (objc_msgSend(v9, "length"))
    {
      v30 = self;
      v31 = a2;
      v11 = 0;
      v12 = 0;
      v7 = v9;
      v13 = 0x7FFFFFFFFFFFFFFFLL;
      do
      {
        v14 = objc_msgSend(v9, "rangeOfComposedCharacterSequenceAtIndex:", v12);
        if (v14 != 0x7FFFFFFFFFFFFFFFLL)
        {
          v16 = v14;
          objc_msgSend(v9, "substringWithRange:", v14, v15);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "objectForKey:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = v18;
          if (v18)
          {
            v20 = v18;

            if (v13 != 0x7FFFFFFFFFFFFFFFLL)
              v16 = v13;
            v11 += objc_msgSend(v17, "length");
            v10 = v20;
          }
          else
          {
            v16 = 0x7FFFFFFFFFFFFFFFLL;
            if (v13 != 0x7FFFFFFFFFFFFFFFLL)
            {
              objc_msgSend(v10, "objectForKey:", CFSTR("T"));
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              v22 = v21;
              if (v21)
              {
                if (v11 != objc_msgSend(v21, "length"))
                  _AXAssert();
                if (v11 == objc_msgSend(v22, "length"))
                {
                  objc_msgSend(v7, "stringByReplacingCharactersInRange:withString:", v13, v11, v22);
                  v23 = objc_claimAutoreleasedReturnValue();

                  v7 = (id)v23;
                }
              }
              v24 = v34;

              --v12;
              v11 = 0;
              v16 = 0x7FFFFFFFFFFFFFFFLL;
              v10 = v24;
            }
          }

          v13 = v16;
        }
        if (v13 != 0x7FFFFFFFFFFFFFFFLL)
        {
          objc_msgSend(v10, "objectForKey:", CFSTR("T"));
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = v25;
          if (v25)
          {
            if (v11 != objc_msgSend(v25, "length"))
            {
              objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", v31, v30, CFSTR("AXDialectMap.m"), 378, CFSTR("Hanja to hangul transliteration tabler should only contain equal length mappings"));

            }
            objc_msgSend(v7, "stringByReplacingCharactersInRange:withString:", v13, v11, v26);
            v27 = objc_claimAutoreleasedReturnValue();

            v7 = (id)v27;
          }

        }
        ++v12;
      }
      while (v12 < objc_msgSend(v9, "length"));
    }
    else
    {
      v7 = v9;
    }

    v6 = v32;
    v5 = v33;
  }

  return v7;
}

- (AXLangMap)langMap
{
  return (AXLangMap *)objc_loadWeakRetained((id *)&self->_langMap);
}

- (void)setLangMap:(id)a3
{
  objc_storeWeak((id *)&self->_langMap, a3);
}

- (NSString)voiceName
{
  return self->_voiceName;
}

- (void)setVoiceName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSLocale)locale
{
  return self->_locale;
}

- (void)setLocale:(id)a3
{
  objc_storeStrong((id *)&self->_locale, a3);
}

- (NSString)specificLanguageID
{
  return self->_specificLanguageID;
}

- (void)setSpecificLanguageID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSCharacterSet)speakableCharacters
{
  return self->_speakableCharacters;
}

- (void)setSpeakableCharacters:(id)a3
{
  objc_storeStrong((id *)&self->_speakableCharacters, a3);
}

- (NSCharacterSet)secondaryLanguageRange
{
  return self->_secondaryLanguageRange;
}

- (void)setSecondaryLanguageRange:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryLanguageRange, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryLanguageRange, 0);
  objc_storeStrong((id *)&self->_speakableCharacters, 0);
  objc_storeStrong((id *)&self->_specificLanguageID, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_voiceName, 0);
  objc_destroyWeak((id *)&self->_langMap);
}

@end
