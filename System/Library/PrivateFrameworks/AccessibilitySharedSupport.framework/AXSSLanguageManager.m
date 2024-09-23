@implementation AXSSLanguageManager

+ (id)shared
{
  if (shared_onceToken != -1)
    dispatch_once(&shared_onceToken, &__block_literal_global_5);
  return (id)shared__shared;
}

void __29__AXSSLanguageManager_shared__block_invoke()
{
  AXSSLanguageManager *v0;
  void *v1;

  v0 = objc_alloc_init(AXSSLanguageManager);
  v1 = (void *)shared__shared;
  shared__shared = (uint64_t)v0;

}

+ (id)commonPunctuationCharacters
{
  if (commonPunctuationCharacters_onceToken != -1)
    dispatch_once(&commonPunctuationCharacters_onceToken, &__block_literal_global_1);
  return (id)commonPunctuationCharacters_charSet;
}

void __50__AXSSLanguageManager_commonPunctuationCharacters__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("~!@#*$%&+|=(){}[]<>,./?;:'_-\"\\"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)commonPunctuationCharacters_charSet;
  commonPunctuationCharacters_charSet = v0;

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
    if (v8 - 1 > v11)
    {
      objc_msgSend(v3, "substringWithRange:", v11, v8 - 1 - v11);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "appendString:", v15);

    }
  }

  return v6;
}

- (AXSSLanguageManager)init
{
  AXSSLanguageManager *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  AXSSLanguageManager *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)AXSSLanguageManager;
  v2 = -[AXSSLanguageManager init](&v13, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXSSLanguageManager setUserLocale:](v2, "setUserLocale:", v3);

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

    -[AXSSLanguageManager setCommonCharacters:](v2, "setCommonCharacters:", v5);
    objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("αβγδεζηθικλμνξοπρσςτυφχψωΑΒΓΔΕΖΗΘΙΚΛΜΝΞΟΠΡΣΤΥΦΧΨΩ"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXSSLanguageManager setCommonGreekCharacters:](v2, "setCommonGreekCharacters:", v10);

    v11 = v2;
  }

  return v2;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[AXSSLanguageManager languageMaps](self, "languageMaps");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("AXSSLanguageManager:<%p>. %lu lang maps"), self, objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_preferredLanguage
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count"))
  {
    objc_msgSend(v2, "objectAtIndex:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    AXSSLanguageConvertToCanonicalForm(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }

  return v4;
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
    AXSSLanguageCanonicalFormToGeneralLanguage(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[AXSSLanguageManager userLocale](self, "userLocale");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0C997E8]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    AXSSLanguageCanonicalFormToGeneralLanguage(v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (NSString *)v5;
}

- (NSArray)languageMaps
{
  NSArray *languageMaps;
  NSArray *v4;
  NSArray *v5;

  languageMaps = self->_languageMaps;
  if (!languageMaps)
  {
    +[AXSSLanguageLoader loadLanguages](AXSSLanguageLoader, "loadLanguages");
    v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v5 = self->_languageMaps;
    self->_languageMaps = v4;

    languageMaps = self->_languageMaps;
  }
  return languageMaps;
}

- (AXSSDialectMap)dialectForSystemLanguage
{
  AXSSDialectMap *dialectForSystemLanguage;

  dialectForSystemLanguage = self->_dialectForSystemLanguage;
  if (!dialectForSystemLanguage)
  {
    -[AXSSLanguageManager updateCachedDialects](self, "updateCachedDialects");
    dialectForSystemLanguage = self->_dialectForSystemLanguage;
  }
  return dialectForSystemLanguage;
}

- (void)setDialectForSystemLanguage:(id)a3
{
  id v5;
  AXSSDialectMap **p_dialectForSystemLanguage;
  AXSSDialectMap *dialectForSystemLanguage;
  id v8;

  v5 = a3;
  dialectForSystemLanguage = self->_dialectForSystemLanguage;
  p_dialectForSystemLanguage = &self->_dialectForSystemLanguage;
  v8 = v5;
  if (!-[AXSSDialectMap isEqual:](dialectForSystemLanguage, "isEqual:"))
    objc_storeStrong((id *)p_dialectForSystemLanguage, a3);

}

- (AXSSDialectMap)dialectForCurrentLocale
{
  AXSSDialectMap *dialectForCurrentLocale;

  dialectForCurrentLocale = self->_dialectForCurrentLocale;
  if (!dialectForCurrentLocale)
  {
    -[AXSSLanguageManager updateCachedDialects](self, "updateCachedDialects");
    dialectForCurrentLocale = self->_dialectForCurrentLocale;
  }
  return dialectForCurrentLocale;
}

- (AXSSDialectMap)dialectForCurrentRegion
{
  AXSSDialectMap *dialectForCurrentRegion;

  dialectForCurrentRegion = self->_dialectForCurrentRegion;
  if (!dialectForCurrentRegion)
  {
    -[AXSSLanguageManager updateCachedDialects](self, "updateCachedDialects");
    dialectForCurrentRegion = self->_dialectForCurrentRegion;
  }
  return dialectForCurrentRegion;
}

- (void)setDialectForCurrentLocale:(id)a3
{
  id v5;
  AXSSDialectMap **p_dialectForCurrentLocale;
  AXSSDialectMap *dialectForCurrentLocale;
  id v8;

  v5 = a3;
  dialectForCurrentLocale = self->_dialectForCurrentLocale;
  p_dialectForCurrentLocale = &self->_dialectForCurrentLocale;
  v8 = v5;
  if (!-[AXSSDialectMap isEqual:](dialectForCurrentLocale, "isEqual:"))
    objc_storeStrong((id *)p_dialectForCurrentLocale, a3);

}

- (void)setDialectForCurrentRegion:(id)a3
{
  id v5;
  AXSSDialectMap **p_dialectForCurrentRegion;
  AXSSDialectMap *dialectForCurrentRegion;
  id v8;

  v5 = a3;
  dialectForCurrentRegion = self->_dialectForCurrentRegion;
  p_dialectForCurrentRegion = &self->_dialectForCurrentRegion;
  v8 = v5;
  if (!-[AXSSDialectMap isEqual:](dialectForCurrentRegion, "isEqual:"))
    objc_storeStrong((id *)p_dialectForCurrentRegion, a3);

}

- (id)dialectForLanguageID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  id v10;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  void *v30;
  void *v31;
  char v32;
  void *v33;
  id v34;
  id v35;
  id obj;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
    return 0;
  v5 = v4;
  if (objc_msgSend(v4, "hasPrefix:", CFSTR("zh")))
  {
    objc_msgSend(v5, "stringByReplacingOccurrencesOfString:withString:", CFSTR("Hant-"), &stru_1E5F9A110);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "stringByReplacingOccurrencesOfString:withString:", CFSTR("Hans-"), &stru_1E5F9A110);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[AXSSLanguageManager dialectForSystemLanguage](self, "dialectForSystemLanguage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "specificLanguageID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hasPrefix:", v5);

  if (v9)
  {
    v10 = v7;
  }
  else
  {
    -[AXSSLanguageManager dialectForCurrentLocale](self, "dialectForCurrentLocale");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "specificLanguageID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "hasPrefix:", v5);

    if (v14)
    {
      v10 = v12;
    }
    else
    {
      -[AXSSLanguageManager dialectForCurrentRegion](self, "dialectForCurrentRegion");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "specificLanguageID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "hasPrefix:", v5);

      if (v17)
      {
        v10 = v15;
      }
      else
      {
        v33 = v15;
        v34 = (id)objc_msgSend(v5, "rangeOfString:", CFSTR("-"));
        v41 = 0u;
        v42 = 0u;
        v43 = 0u;
        v44 = 0u;
        -[AXSSLanguageManager languageMaps](self, "languageMaps");
        obj = (id)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
        if (v18)
        {
          v19 = v18;
          v20 = *(_QWORD *)v42;
          while (2)
          {
            for (i = 0; i != v19; ++i)
            {
              if (*(_QWORD *)v42 != v20)
                objc_enumerationMutation(obj);
              v22 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
              objc_msgSend(v22, "generalLanguageID");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v5, "hasPrefix:", v23))
              {

LABEL_22:
                if (v34 != (id)0x7FFFFFFFFFFFFFFFLL)
                {
                  v39 = 0u;
                  v40 = 0u;
                  v37 = 0u;
                  v38 = 0u;
                  objc_msgSend(v22, "dialects");
                  v35 = (id)objc_claimAutoreleasedReturnValue();
                  v26 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
                  if (v26)
                  {
                    v27 = v26;
                    v28 = *(_QWORD *)v38;
                    while (2)
                    {
                      for (j = 0; j != v27; ++j)
                      {
                        if (*(_QWORD *)v38 != v28)
                          objc_enumerationMutation(v35);
                        v30 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * j);
                        objc_msgSend(v30, "specificLanguageID");
                        v31 = (void *)objc_claimAutoreleasedReturnValue();
                        v32 = objc_msgSend(v31, "isEqualToString:", v5);

                        if ((v32 & 1) != 0)
                        {
                          v10 = v30;

                          goto LABEL_34;
                        }
                      }
                      v27 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
                      if (v27)
                        continue;
                      break;
                    }
                  }

                }
                objc_msgSend(v22, "defaultDialect");
                v10 = (id)objc_claimAutoreleasedReturnValue();
LABEL_34:

                goto LABEL_35;
              }
              objc_msgSend(v22, "alternateLanguageIDs");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              v25 = objc_msgSend(v24, "containsObject:", v5);

              if (v25)
                goto LABEL_22;
            }
            v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
            if (v19)
              continue;
            break;
          }
        }

        v10 = 0;
LABEL_35:
        v15 = v33;
      }

    }
  }

  return v10;
}

- (id)dialectForSpeechSynthesisVoiceID:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  id v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    -[AXSSLanguageManager languageMaps](self, "languageMaps");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    if (v22)
    {
      v6 = *(_QWORD *)v30;
      v24 = v5;
      v21 = *(_QWORD *)v30;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v30 != v6)
            objc_enumerationMutation(v5);
          v23 = v7;
          v8 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v7);
          v25 = 0u;
          v26 = 0u;
          v27 = 0u;
          v28 = 0u;
          objc_msgSend(v8, "dialects", v21);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
          if (v10)
          {
            v11 = v10;
            v12 = *(_QWORD *)v26;
            do
            {
              for (i = 0; i != v11; ++i)
              {
                if (*(_QWORD *)v26 != v12)
                  objc_enumerationMutation(v9);
                v14 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
                objc_msgSend(v14, "voiceIdentifier");
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                if ((objc_msgSend(v15, "hasPrefix:", v4) & 1) != 0)
                {
                  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
                  v16 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v14, "speakableCharacters");
                  v17 = (void *)objc_claimAutoreleasedReturnValue();
                  v18 = objc_msgSend(v16, "isSupersetOfSet:", v17);

                  if (!v18)
                  {
                    v19 = v14;

                    goto LABEL_22;
                  }
                }
                else
                {

                }
              }
              v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
            }
            while (v11);
          }

          v7 = v23 + 1;
          v5 = v24;
          v6 = v21;
        }
        while (v23 + 1 != v22);
        v22 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
      }
      while (v22);
    }

    v19 = 0;
  }
  else
  {
    -[AXSSLanguageManager dialectForSystemLanguage](self, "dialectForSystemLanguage");
    v19 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_22:

  return v19;
}

- (id)dialectsThatCanSpeakString:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  id v23;
  _QWORD v25[4];
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  -[AXSSLanguageManager languageMaps](self, "languageMaps");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v32 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        objc_msgSend(v11, "defaultDialect");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "canSpeakString:", v4);

        if (v13)
        {
          objc_msgSend(v11, "defaultDialect");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v14);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    }
    while (v8);
  }

  objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v17 = v15;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v28;
    do
    {
      for (j = 0; j != v19; ++j)
      {
        if (*(_QWORD *)v28 != v20)
          objc_enumerationMutation(v17);
        AXSSLanguageConvertToCanonicalForm(*(void **)(*((_QWORD *)&v27 + 1) + 8 * j));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addObject:", v22);

      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    }
    while (v19);
  }

  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __50__AXSSLanguageManager_dialectsThatCanSpeakString___block_invoke;
  v25[3] = &unk_1E5F990D8;
  v26 = v16;
  v23 = v16;
  objc_msgSend(v5, "sortUsingComparator:", v25);

  return v5;
}

uint64_t __50__AXSSLanguageManager_dialectsThatCanSpeakString___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;

  v5 = (void *)MEMORY[0x1E0CB37E8];
  v6 = *(void **)(a1 + 32);
  v7 = a3;
  objc_msgSend(v5, "numberWithUnsignedInteger:", objc_msgSend(v6, "indexOfObject:", a2));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0CB37E8];
  v10 = objc_msgSend(*(id *)(a1 + 32), "indexOfObject:", v7);

  objc_msgSend(v9, "numberWithUnsignedInteger:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v8, "compare:", v11);

  return v12;
}

- (id)dialectsThatCanSpeakCharacter:(unsigned __int16)a3
{
  uint64_t v3;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _QWORD v13[5];
  _QWORD v14[5];
  __int16 v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  void *v22;
  void *v23;
  _QWORD v24[2];

  v3 = a3;
  v24[1] = *MEMORY[0x1E0C80C00];
  -[AXSSLanguageManager dialectForSystemLanguage](self, "dialectForSystemLanguage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "canSpeakCharacter:", v3))
  {
    v24[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[AXSSLanguageManager dialectForCurrentLocale](self, "dialectForCurrentLocale");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v8, "canSpeakCharacter:", v3))
    {
      v23 = v8;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v23, 1);
      v7 = (id)objc_claimAutoreleasedReturnValue();
      v5 = v8;
      goto LABEL_9;
    }
    -[AXSSLanguageManager dialectForCurrentRegion](self, "dialectForCurrentRegion");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v5, "canSpeakCharacter:", v3))
    {
      v16 = 0;
      v17 = &v16;
      v18 = 0x3032000000;
      v19 = __Block_byref_object_copy__3;
      v20 = __Block_byref_object_dispose__3;
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v21 = (id)objc_claimAutoreleasedReturnValue();
      -[AXSSLanguageManager languageMaps](self, "languageMaps");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = MEMORY[0x1E0C809B0];
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __53__AXSSLanguageManager_dialectsThatCanSpeakCharacter___block_invoke;
      v14[3] = &unk_1E5F99100;
      v15 = v3;
      v14[4] = &v16;
      objc_msgSend(v9, "enumerateObjectsWithOptions:usingBlock:", 0, v14);

      objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13[0] = v10;
      v13[1] = 3221225472;
      v13[2] = __53__AXSSLanguageManager_dialectsThatCanSpeakCharacter___block_invoke_2;
      v13[3] = &unk_1E5F99150;
      v13[4] = &v16;
      objc_msgSend(v11, "enumerateObjectsWithOptions:usingBlock:", 2, v13);
      v7 = (id)v17[5];

      _Block_object_dispose(&v16, 8);
      goto LABEL_9;
    }
    v22 = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v22, 1);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v7 = (id)v6;
LABEL_9:

  return v7;
}

void __53__AXSSLanguageManager_dialectsThatCanSpeakCharacter___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  int v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "defaultDialect");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "canSpeakCharacter:", *(unsigned __int16 *)(a1 + 40));

  if (v4)
  {
    objc_msgSend(v9, "defaultDialect");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isDialectSecondaryForCharacter:", *(unsigned __int16 *)(a1 + 40));

    if ((v6 & 1) == 0)
    {
      v7 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
      objc_msgSend(v9, "defaultDialect");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v8);

    }
  }

}

void __53__AXSSLanguageManager_dialectsThatCanSpeakCharacter___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  AXSSLanguageConvertToCanonicalForm(a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __53__AXSSLanguageManager_dialectsThatCanSpeakCharacter___block_invoke_3;
  v9[3] = &unk_1E5F99128;
  v8 = v3;
  v10 = v8;
  v5 = objc_msgSend(v4, "indexOfObjectPassingTest:", v9);
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = v5;
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "objectAtIndexedSubscript:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "removeObjectAtIndex:", v6);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "insertObject:atIndex:", v7, 0);

  }
}

uint64_t __53__AXSSLanguageManager_dialectsThatCanSpeakCharacter___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "languageMap");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "generalLanguageID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "hasPrefix:", v4);

  return v5;
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
  -[AXSSLanguageManager dialectsThatCanSpeakCharacter:](self, "dialectsThatCanSpeakCharacter:", a3);
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
          AXSSLanguageConvertToCanonicalForm(*(void **)(*((_QWORD *)&v42 + 1) + 8 * v7));
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
                objc_msgSend(v14, "languageMap", v30);
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
    objc_msgSend(v18, "languageMap");
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

- (BOOL)isCharacterCommon:(unsigned __int16)a3
{
  uint64_t v3;
  void *v4;

  v3 = a3;
  -[AXSSLanguageManager commonCharacters](self, "commonCharacters");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v4, "characterIsMember:", v3);

  return v3;
}

- (BOOL)isCommonGreekCharacter:(unsigned __int16)a3
{
  uint64_t v3;
  void *v4;

  v3 = a3;
  -[AXSSLanguageManager commonGreekCharacters](self, "commonGreekCharacters");
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
      -[AXSSLanguageManager commonCharacters](self, "commonCharacters");
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
  AXSSLanguageManager *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t k;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t m;
  void *v35;
  void *v36;
  int v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t n;
  void *v49;
  void *v50;
  void *v51;
  int v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  id obj;
  AXSSLanguageManager *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
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
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  _BYTE v86[128];
  _BYTE v87[128];
  _BYTE v88[128];
  _BYTE v89[128];
  _BYTE v90[128];
  _BYTE v91[128];
  uint64_t v92;

  v2 = self;
  v92 = *MEMORY[0x1E0C80C00];
  -[AXSSLanguageManager systemLanguageID](self, "systemLanguageID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v82 = 0u;
  v83 = 0u;
  v84 = 0u;
  v85 = 0u;
  -[AXSSLanguageManager languageMaps](v2, "languageMaps");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v82, v91, 16);
  v58 = v2;
  v56 = v3;
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v83;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v83 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v82 + 1) + 8 * i);
        objc_msgSend(v9, "generalLanguageID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v3, "hasPrefix:", v10);

        if (v11)
        {
          -[AXSSLanguageManager _preferredLanguage](v2, "_preferredLanguage");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v78 = 0u;
          v79 = 0u;
          v80 = 0u;
          v81 = 0u;
          objc_msgSend(v9, "dialects");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v78, v90, 16);
          if (v20)
          {
            v21 = v20;
            v22 = *(_QWORD *)v79;
            while (2)
            {
              for (j = 0; j != v21; ++j)
              {
                if (*(_QWORD *)v79 != v22)
                  objc_enumerationMutation(v19);
                v24 = *(void **)(*((_QWORD *)&v78 + 1) + 8 * j);
                objc_msgSend(v24, "specificLanguageID");
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                v26 = objc_msgSend(v25, "isEqual:", v18);

                if (v26)
                {
                  v2 = v58;
                  -[AXSSLanguageManager setDialectForSystemLanguage:](v58, "setDialectForSystemLanguage:", v24);
                  goto LABEL_30;
                }
                v2 = v58;
              }
              v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v78, v90, 16);
              if (v21)
                continue;
              break;
            }
          }
LABEL_30:

          if (!v2->_dialectForSystemLanguage)
          {
            objc_msgSend(v9, "defaultDialect");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            -[AXSSLanguageManager setDialectForSystemLanguage:](v2, "setDialectForSystemLanguage:", v27);

          }
          v3 = v56;
          goto LABEL_33;
        }
        v76 = 0u;
        v77 = 0u;
        v74 = 0u;
        v75 = 0u;
        objc_msgSend(v9, "alternateLanguageIDs");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v74, v89, 16);
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v75;
          while (2)
          {
            for (k = 0; k != v14; ++k)
            {
              if (*(_QWORD *)v75 != v15)
                objc_enumerationMutation(v12);
              if (objc_msgSend(v3, "hasPrefix:", *(_QWORD *)(*((_QWORD *)&v74 + 1) + 8 * k)))
              {
                objc_msgSend(v9, "defaultDialect");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                v2 = v58;
                -[AXSSLanguageManager setDialectForSystemLanguage:](v58, "setDialectForSystemLanguage:", v17);

                goto LABEL_17;
              }
            }
            v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v74, v89, 16);
            v2 = v58;
            if (v14)
              continue;
            break;
          }
        }
LABEL_17:

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v82, v91, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_33:

  -[AXSSLanguageManager userLocale](v2, "userLocale");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "objectForKey:", *MEMORY[0x1E0C997E8]);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
  {
    v72 = 0u;
    v73 = 0u;
    v70 = 0u;
    v71 = 0u;
    -[AXSSLanguageManager languageMaps](v2, "languageMaps");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v70, v88, 16);
    if (v31)
    {
      v32 = v31;
      v33 = *(_QWORD *)v71;
      do
      {
        for (m = 0; m != v32; ++m)
        {
          if (*(_QWORD *)v71 != v33)
            objc_enumerationMutation(v30);
          v35 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * m);
          objc_msgSend(v35, "generalLanguageID");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = objc_msgSend(v29, "hasPrefix:", v36);

          if (v37)
          {
            objc_msgSend(v35, "defaultDialect");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            -[AXSSLanguageManager setDialectForCurrentLocale:](v2, "setDialectForCurrentLocale:", v38);

          }
        }
        v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v70, v88, 16);
      }
      while (v32);
    }

  }
  -[AXSSLanguageManager userLocale](v2, "userLocale");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = *MEMORY[0x1E0C997B0];
  objc_msgSend(v39, "objectForKey:", *MEMORY[0x1E0C997B0]);
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  if (v41)
  {
    v55 = v29;
    v68 = 0u;
    v69 = 0u;
    v66 = 0u;
    v67 = 0u;
    -[AXSSLanguageManager languageMaps](v2, "languageMaps");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v60 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v87, 16);
    if (v60)
    {
      v59 = *(_QWORD *)v67;
      do
      {
        v42 = 0;
        do
        {
          if (*(_QWORD *)v67 != v59)
            objc_enumerationMutation(obj);
          v61 = v42;
          v43 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * v42);
          v62 = 0u;
          v63 = 0u;
          v64 = 0u;
          v65 = 0u;
          objc_msgSend(v43, "dialects");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v62, v86, 16);
          if (v45)
          {
            v46 = v45;
            v47 = *(_QWORD *)v63;
            while (2)
            {
              for (n = 0; n != v46; ++n)
              {
                if (*(_QWORD *)v63 != v47)
                  objc_enumerationMutation(v44);
                v49 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * n);
                objc_msgSend(v49, "locale");
                v50 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v50, "objectForKey:", v40);
                v51 = (void *)objc_claimAutoreleasedReturnValue();
                v52 = objc_msgSend(v51, "hasSuffix:", v41);

                if (v52)
                {
                  -[AXSSLanguageManager setDialectForCurrentRegion:](v58, "setDialectForCurrentRegion:", v49);
                  goto LABEL_60;
                }
              }
              v46 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v62, v86, 16);
              if (v46)
                continue;
              break;
            }
          }
LABEL_60:

          v42 = v61 + 1;
        }
        while (v61 + 1 != v60);
        v60 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v87, 16);
      }
      while (v60);
    }

    v29 = v55;
    v3 = v56;
    v2 = v58;
  }
  if (!v2->_dialectForSystemLanguage)
  {
    if (v2->_dialectForCurrentLocale)
    {
      -[AXSSLanguageManager dialectForCurrentLocale](v2, "dialectForCurrentLocale");
      v53 = objc_claimAutoreleasedReturnValue();
LABEL_68:
      v54 = (void *)v53;
      -[AXSSLanguageManager setDialectForSystemLanguage:](v2, "setDialectForSystemLanguage:", v53);

      goto LABEL_69;
    }
    if (v2->_dialectForCurrentRegion)
    {
      -[AXSSLanguageManager dialectForCurrentRegion](v2, "dialectForCurrentRegion");
      v53 = objc_claimAutoreleasedReturnValue();
      goto LABEL_68;
    }
  }
LABEL_69:

}

- (void)_handleUserLocaleDidChange:(id)a3
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXSSLanguageManager setUserLocale:](self, "setUserLocale:", v4);

  -[AXSSLanguageManager updateCachedDialects](self, "updateCachedDialects");
}

- (void)setLanguageMaps:(id)a3
{
  objc_storeStrong((id *)&self->_languageMaps, a3);
}

- (NSLocale)userLocale
{
  return self->_userLocale;
}

- (void)setUserLocale:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSCharacterSet)commonCharacters
{
  return self->_commonCharacters;
}

- (void)setCommonCharacters:(id)a3
{
  objc_storeStrong((id *)&self->_commonCharacters, a3);
}

- (NSCharacterSet)commonGreekCharacters
{
  return self->_commonGreekCharacters;
}

- (void)setCommonGreekCharacters:(id)a3
{
  objc_storeStrong((id *)&self->_commonGreekCharacters, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commonGreekCharacters, 0);
  objc_storeStrong((id *)&self->_commonCharacters, 0);
  objc_storeStrong((id *)&self->_userLocale, 0);
  objc_storeStrong((id *)&self->_languageMaps, 0);
  objc_storeStrong((id *)&self->_dialectForCurrentRegion, 0);
  objc_storeStrong((id *)&self->_dialectForCurrentLocale, 0);
  objc_storeStrong((id *)&self->_dialectForSystemLanguage, 0);
}

@end
