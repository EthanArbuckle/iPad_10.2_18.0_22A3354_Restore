@implementation AXLangMap

- (AXLangMap)initWithLanguageID:(id)a3 isWestern:(BOOL)a4 isAmbiguous:(BOOL)a5 isRTL:(BOOL)a6 dialects:(id)a7 alternateLanguageIDs:(id)a8 associatedAmbiguousLanguages:(id)a9
{
  _BOOL8 v11;
  _BOOL8 v12;
  _BOOL8 v13;
  id v15;
  id v16;
  id v17;
  id v18;
  AXLangMap *v19;
  AXLangMap *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const __CFString *v27;
  uint64_t i;
  void *v29;
  void *v30;
  void *v31;
  AXLangMap *v32;
  const __CFString *v33;
  void *v34;
  int v35;
  AXLangMap *v36;
  void *v38;
  id v39;
  id v40;
  id v41;
  id v42;
  uint64_t v43;
  id obj;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  objc_super v49;
  _BYTE v50[128];
  uint64_t v51;

  v11 = a6;
  v12 = a5;
  v13 = a4;
  v51 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a7;
  v17 = a8;
  v18 = a9;
  v49.receiver = self;
  v49.super_class = (Class)AXLangMap;
  v19 = -[AXLangMap init](&v49, sel_init);
  v20 = v19;
  if (v19)
  {
    -[AXLangMap setWestern:](v19, "setWestern:", v13);
    -[AXLangMap setAmbiguous:](v20, "setAmbiguous:", v12);
    -[AXLangMap setRtl:](v20, "setRtl:", v11);
    v42 = v15;
    -[AXLangMap setGeneralLanguageID:](v20, "setGeneralLanguageID:", v15);
    v40 = v17;
    -[AXLangMap setAlternateLanguageIDs:](v20, "setAlternateLanguageIDs:", v17);
    v41 = v16;
    -[AXLangMap setDialects:](v20, "setDialects:", v16);
    v39 = v18;
    -[AXLangMap setAssociatedAmbiguousLanguages:](v20, "setAssociatedAmbiguousLanguages:", v18);
    v21 = (void *)_AXSQuickSpeakCopyPreferredLocalesForLanguages();
    -[AXLangMap generalLanguageID](v20, "generalLanguageID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = v21;
    objc_msgSend(v21, "objectForKey:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    -[AXLangMap dialects](v20, "dialects");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
    if (!v24)
      goto LABEL_13;
    v25 = v24;
    v26 = *(_QWORD *)v46;
    v27 = CFSTR("langMap");
    v43 = *(_QWORD *)v46;
    while (1)
    {
      for (i = 0; i != v25; ++i)
      {
        if (*(_QWORD *)v46 != v26)
          objc_enumerationMutation(obj);
        v29 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
        objc_msgSend(v29, "setValue:forKey:", v20, v27);
        objc_msgSend(v29, "specificLanguageID");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v30, "isEqualToString:", v23))
        {

        }
        else
        {
          objc_msgSend(v29, "locale");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "localeIdentifier");
          v32 = v20;
          v33 = v27;
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = objc_msgSend(v34, "isEqualToString:", v23);

          v27 = v33;
          v20 = v32;

          v26 = v43;
          if (!v35)
            continue;
        }
        -[AXLangMap setUserPreferredDialect:](v20, "setUserPreferredDialect:", v29);
      }
      v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
      if (!v25)
      {
LABEL_13:

        v36 = v20;
        v16 = v41;
        v15 = v42;
        v18 = v39;
        v17 = v40;
        break;
      }
    }
  }

  return v20;
}

- (id)basicDescription
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
  -[AXLangMap alternateLanguageIDs](self, "alternateLanguageIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    -[AXLangMap alternateLanguageIDs](self, "alternateLanguageIDs");
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
    v9 = &stru_1E24CAB08;
  }
  v12 = (void *)MEMORY[0x1E0CB3940];
  -[AXLangMap generalLanguageID](self, "generalLanguageID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[AXLangMap isWestern](self, "isWestern"))
    v14 = CFSTR("YES");
  else
    v14 = CFSTR("NO");
  if (-[AXLangMap isAmbiguous](self, "isAmbiguous"))
    v15 = CFSTR("YES");
  else
    v15 = CFSTR("NO");
  objc_msgSend(v12, "stringWithFormat:", CFSTR("AXLang <%p>. LangID:%@%@ western:%@ ambiguous:%@"), self, v13, v9, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)debugDescription
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("\nDialects:\n"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[AXLangMap dialects](self, "dialects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(v3, "appendFormat:", CFSTR("\t%@\n"), *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  -[AXLangMap userPreferredDialect](self, "userPreferredDialect");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("Preferred Dialect:%@\n"), v9);

  -[AXLangMap basicDescription](self, "basicDescription");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringByAppendingString:", v3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (AXDialectMap)userLocaleDialect
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
  AXLangMap *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  +[AXLanguageManager sharedInstance](AXLanguageManager, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "userLocale");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v18 = self;
  -[AXLangMap dialects](self, "dialects");
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

  -[AXLangMap dialects](v18, "dialects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v15 = (id)objc_claimAutoreleasedReturnValue();
LABEL_11:
  v16 = v15;

  return (AXDialectMap *)v16;
}

- (AXDialectMap)defaultDialect
{
  void *v3;

  -[AXLangMap userPreferredDialect](self, "userPreferredDialect");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    -[AXLangMap userPreferredDialect](self, "userPreferredDialect");
  else
    -[AXLangMap userLocaleDialect](self, "userLocaleDialect");
  return (AXDialectMap *)(id)objc_claimAutoreleasedReturnValue();
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
  -[AXLangMap dialects](self, "dialects", 0);
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

- (NSArray)dialects
{
  return self->_dialects;
}

- (void)setDialects:(id)a3
{
  objc_storeStrong((id *)&self->_dialects, a3);
}

- (BOOL)isWestern
{
  return self->_western;
}

- (void)setWestern:(BOOL)a3
{
  self->_western = a3;
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
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (AXDialectMap)userPreferredDialect
{
  return (AXDialectMap *)objc_loadWeakRetained((id *)&self->_userPreferredDialect);
}

- (void)setUserPreferredDialect:(id)a3
{
  objc_storeWeak((id *)&self->_userPreferredDialect, a3);
}

- (NSArray)alternateLanguageIDs
{
  return self->_alternateLanguageIDs;
}

- (void)setAlternateLanguageIDs:(id)a3
{
  objc_storeStrong((id *)&self->_alternateLanguageIDs, a3);
}

- (NSArray)associatedAmbiguousLanguages
{
  return self->_associatedAmbiguousLanguages;
}

- (void)setAssociatedAmbiguousLanguages:(id)a3
{
  objc_storeStrong((id *)&self->_associatedAmbiguousLanguages, a3);
}

- (BOOL)isRTL
{
  return self->_rtl;
}

- (void)setRtl:(BOOL)a3
{
  self->_rtl = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_associatedAmbiguousLanguages, 0);
  objc_storeStrong((id *)&self->_alternateLanguageIDs, 0);
  objc_destroyWeak((id *)&self->_userPreferredDialect);
  objc_storeStrong((id *)&self->_generalLanguageID, 0);
  objc_storeStrong((id *)&self->_dialects, 0);
  objc_storeStrong((id *)&self->userLocaleDialect, 0);
}

@end
