@implementation AXSSDialectMap

- (AXSSDialectMap)initWithLocale:(id)a3 voiceName:(id)a4 specificLanguageID:(id)a5 voiceIdentifier:(id)a6 speakableCharacters:(id)a7 secondaryLanguageRange:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  AXSSDialectMap *v19;
  AXSSDialectMap *v20;
  uint64_t v21;
  void *specificLanguageID;
  void *v23;
  uint64_t v24;
  NSString *v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  AXSSDialectMap *v32;
  objc_super v34;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a7;
  v18 = a8;
  v34.receiver = self;
  v34.super_class = (Class)AXSSDialectMap;
  v19 = -[AXSSDialectMap init](&v34, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_locale, a3);
    objc_storeStrong((id *)&v20->_voiceName, a4);
    objc_storeStrong((id *)&v20->_speakableCharacters, a7);
    objc_storeStrong((id *)&v20->_secondaryLanguageRange, a8);
    if (v16)
    {
      objc_msgSend(v16, "stringByReplacingOccurrencesOfString:withString:", CFSTR("_"), CFSTR("-"));
      v21 = objc_claimAutoreleasedReturnValue();
      specificLanguageID = v20->_specificLanguageID;
      v20->_specificLanguageID = (NSString *)v21;
    }
    else
    {
      -[AXSSDialectMap locale](v20, "locale");
      specificLanguageID = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(specificLanguageID, "localeIdentifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "stringByReplacingOccurrencesOfString:withString:", CFSTR("_"), CFSTR("-"));
      v24 = objc_claimAutoreleasedReturnValue();
      v25 = v20->_specificLanguageID;
      v20->_specificLanguageID = (NSString *)v24;

    }
    -[AXSSDialectMap specificLanguageID](v20, "specificLanguageID");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "hasPrefix:", CFSTR("zh"));

    if (v27)
    {
      -[AXSSDialectMap specificLanguageID](v20, "specificLanguageID");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "stringByReplacingOccurrencesOfString:withString:", CFSTR("Hant-"), &stru_1E5F9A110);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXSSDialectMap setSpecificLanguageID:](v20, "setSpecificLanguageID:", v29);

      -[AXSSDialectMap specificLanguageID](v20, "specificLanguageID");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "stringByReplacingOccurrencesOfString:withString:", CFSTR("Hans-"), &stru_1E5F9A110);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXSSDialectMap setSpecificLanguageID:](v20, "setSpecificLanguageID:", v31);

    }
    v32 = v20;
  }

  return v20;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[AXSSDialectMap voiceName](self, "voiceName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXSSDialectMap locale](self, "locale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localeIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXSSDialectMap specificLanguageID](self, "specificLanguageID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("AXSSDialect <%p>. Voice:%@. LocaleID:%@ LangID:%@"), self, v4, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[AXSSDialectMap specificLanguageID](self, "specificLanguageID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "specificLanguageID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqual:", v7))
    {
      -[AXSSDialectMap voiceIdentifier](self, "voiceIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "voiceIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "isEqual:", v9);

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)canSpeakCharacter:(unsigned __int16)a3
{
  uint64_t v3;
  void *v5;
  char v6;
  void *v7;
  int v8;
  void *v9;
  char v10;

  v3 = a3;
  -[AXSSDialectMap speakableCharacters](self, "speakableCharacters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "characterIsMember:", v3);

  -[AXSSDialectMap specificLanguageID](self, "specificLanguageID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hasPrefix:", CFSTR("en"));

  if ((v6 & 1) != 0 || !v8)
    return v6;
  +[AXSSLanguageManager shared](AXSSLanguageManager, "shared");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isCommonGreekCharacter:", v3);

  return v10;
}

- (BOOL)canSpeakString:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  BOOL v8;
  unint64_t i;
  uint64_t v10;

  v4 = a3;
  if (v4)
  {
    +[AXSSLanguageManager shared](AXSSLanguageManager, "shared");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "length");
    if (v6)
    {
      v7 = v6;
      v8 = 0;
      for (i = 0; i != v7; v8 = i >= v7)
      {
        v10 = objc_msgSend(v4, "characterAtIndex:", i);
        if ((objc_msgSend(v5, "isCharacterCommon:", v10) & 1) == 0
          && !-[AXSSDialectMap canSpeakCharacter:](self, "canSpeakCharacter:", v10))
        {
          break;
        }
        ++i;
      }
    }
    else
    {
      v8 = 1;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)isDialectSecondaryForCharacter:(unsigned __int16)a3
{
  uint64_t v3;
  void *v4;

  v3 = a3;
  -[AXSSDialectMap secondaryLanguageRange](self, "secondaryLanguageRange");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v4, "characterIsMember:", v3);

  return v3;
}

- (NSString)regionID
{
  void *v2;
  void *v3;

  -[AXSSDialectMap locale](self, "locale");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localeIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (AXSSLanguageMap)languageMap
{
  return (AXSSLanguageMap *)objc_loadWeakRetained((id *)&self->_languageMap);
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
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)voiceName
{
  return self->_voiceName;
}

- (void)setVoiceName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)voiceIdentifier
{
  return self->_voiceIdentifier;
}

- (void)setVoiceIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSCharacterSet)speakableCharacters
{
  return self->_speakableCharacters;
}

- (void)setSpeakableCharacters:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
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
  objc_storeStrong((id *)&self->_voiceIdentifier, 0);
  objc_storeStrong((id *)&self->_voiceName, 0);
  objc_storeStrong((id *)&self->_specificLanguageID, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_destroyWeak((id *)&self->_languageMap);
}

@end
