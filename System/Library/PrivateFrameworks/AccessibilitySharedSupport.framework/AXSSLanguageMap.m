@implementation AXSSLanguageMap

- (AXSSLanguageMap)initWithLanguageID:(id)a3 isWestern:(BOOL)a4 isAmbiguous:(BOOL)a5 isRTL:(BOOL)a6 dialects:(id)a7 alternateLanguageIDs:(id)a8 associatedAmbiguousLanguages:(id)a9
{
  id v16;
  id v17;
  AXSSLanguageMap *v18;
  AXSSLanguageMap *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  AXSSLanguageMap *v25;
  id v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  objc_super v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v28 = a3;
  v27 = a7;
  v16 = a8;
  v17 = a9;
  v33.receiver = self;
  v33.super_class = (Class)AXSSLanguageMap;
  v18 = -[AXSSLanguageMap init](&v33, sel_init);
  v19 = v18;
  if (v18)
  {
    v18->_western = a4;
    v18->_ambiguous = a5;
    v18->_rtl = a6;
    objc_storeStrong((id *)&v18->_generalLanguageID, a3);
    objc_storeStrong((id *)&v19->_alternateLanguageIDs, a8);
    objc_storeStrong((id *)&v19->_dialects, a7);
    objc_storeStrong((id *)&v19->_associatedAmbiguousLanguages, a9);
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    -[AXSSLanguageMap dialects](v19, "dialects", v27, v28, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v22; ++i)
        {
          if (*(_QWORD *)v30 != v23)
            objc_enumerationMutation(v20);
          objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * i), "setValue:forKey:", v19, CFSTR("languageMap"));
        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
      }
      while (v22);
    }

    v25 = v19;
  }

  return v19;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __CFString *v9;
  uint64_t v10;
  __CFString *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  const __CFString *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  -[AXSSLanguageMap alternateLanguageIDs](self, "alternateLanguageIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    -[AXSSLanguageMap alternateLanguageIDs](self, "alternateLanguageIDs");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v19;
      v9 = CFSTR(" AltLangs:");
      do
      {
        v10 = 0;
        v11 = v9;
        do
        {
          if (*(_QWORD *)v19 != v8)
            objc_enumerationMutation(v5);
          -[__CFString stringByAppendingFormat:](v11, "stringByAppendingFormat:", CFSTR("%@ "), *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v10));
          v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

          ++v10;
          v11 = v9;
        }
        while (v7 != v10);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v7);
    }
    else
    {
      v9 = CFSTR(" AltLangs:");
    }

  }
  else
  {
    v9 = &stru_1E5F9A110;
  }
  v12 = (void *)MEMORY[0x1E0CB3940];
  -[AXSSLanguageMap generalLanguageID](self, "generalLanguageID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[AXSSLanguageMap isWestern](self, "isWestern"))
    v14 = CFSTR("YES");
  else
    v14 = CFSTR("NO");
  if (-[AXSSLanguageMap isAmbiguous](self, "isAmbiguous"))
    v15 = CFSTR("YES");
  else
    v15 = CFSTR("NO");
  objc_msgSend(v12, "stringWithFormat:", CFSTR("AXSSLanguage <%p>. LangID:%@%@ western:%@ ambiguous:%@"), self, v13, v9, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (AXSSDialectMap)userLocaleDialect
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  id v15;
  void *v16;
  AXSSLanguageMap *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  +[AXSSLanguageManager shared](AXSSLanguageManager, "shared");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "userLocale");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v18 = self;
  -[AXSSLanguageMap dialects](self, "dialects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v10, "locale");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "localeIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "localeIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v12, "isEqualToString:", v13);

        if ((v14 & 1) != 0)
        {
          v15 = v10;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v7)
        continue;
      break;
    }
  }

  -[AXSSLanguageMap dialects](v18, "dialects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v15 = (id)objc_claimAutoreleasedReturnValue();
LABEL_11:
  v16 = v15;

  return (AXSSDialectMap *)v16;
}

- (id)dialectWithLocaleIdentifier:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("-"), CFSTR("_"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[AXSSLanguageMap dialects](self, "dialects", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "locale");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "localeIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqualToString:", v4);

        if ((v12 & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (BOOL)isWestern
{
  return self->_western;
}

- (void)setWestern:(BOOL)a3
{
  self->_western = a3;
}

- (BOOL)isRTL
{
  return self->_rtl;
}

- (void)setRtl:(BOOL)a3
{
  self->_rtl = a3;
}

- (BOOL)isAmbiguous
{
  return self->_ambiguous;
}

- (void)setAmbiguous:(BOOL)a3
{
  self->_ambiguous = a3;
}

- (NSString)generalLanguageID
{
  return self->_generalLanguageID;
}

- (void)setGeneralLanguageID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)alternateLanguageIDs
{
  return self->_alternateLanguageIDs;
}

- (void)setAlternateLanguageIDs:(id)a3
{
  objc_storeStrong((id *)&self->_alternateLanguageIDs, a3);
}

- (NSArray)dialects
{
  return self->_dialects;
}

- (void)setDialects:(id)a3
{
  objc_storeStrong((id *)&self->_dialects, a3);
}

- (NSArray)associatedAmbiguousLanguages
{
  return self->_associatedAmbiguousLanguages;
}

- (void)setAssociatedAmbiguousLanguages:(id)a3
{
  objc_storeStrong((id *)&self->_associatedAmbiguousLanguages, a3);
}

- (void)setDefaultDialect:(id)a3
{
  objc_storeStrong((id *)&self->_defaultDialect, a3);
}

- (void)setUserLocaleDialect:(id)a3
{
  objc_storeStrong((id *)&self->_userLocaleDialect, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userLocaleDialect, 0);
  objc_storeStrong((id *)&self->_defaultDialect, 0);
  objc_storeStrong((id *)&self->_associatedAmbiguousLanguages, 0);
  objc_storeStrong((id *)&self->_dialects, 0);
  objc_storeStrong((id *)&self->_alternateLanguageIDs, 0);
  objc_storeStrong((id *)&self->_generalLanguageID, 0);
}

@end
