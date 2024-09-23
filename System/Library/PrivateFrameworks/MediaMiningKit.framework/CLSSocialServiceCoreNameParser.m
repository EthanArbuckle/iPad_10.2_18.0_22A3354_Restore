@implementation CLSSocialServiceCoreNameParser

- (CLSSocialServiceCoreNameParser)init
{
  CLSSocialServiceCoreNameParser *v2;
  NPNameParser *v3;
  NPNameParser *nameParser;
  uint64_t v5;
  NSMutableDictionary *sexHintByCNIdentifier;
  void *v7;
  void *v8;
  uint64_t v9;
  NSDictionary *vocabularyByRelationshipByLocale;
  uint64_t v11;
  NSMutableDictionary *regularExpressionByRelationshipByLocale;
  void *v13;
  uint64_t v14;
  NSCharacterSet *nonLetterCharacterSet;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)CLSSocialServiceCoreNameParser;
  v2 = -[CLSSocialServiceCoreNameParser init](&v17, sel_init);
  if (v2)
  {
    v3 = (NPNameParser *)objc_alloc_init(MEMORY[0x1E0D17538]);
    nameParser = v2->_nameParser;
    v2->_nameParser = v3;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v5 = objc_claimAutoreleasedReturnValue();
    sexHintByCNIdentifier = v2->_sexHintByCNIdentifier;
    v2->_sexHintByCNIdentifier = (NSMutableDictionary *)v5;

    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "URLForResource:withExtension:", CFSTR("personRelationshipVocabulary"), CFSTR("plist"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfURL:", v8);
    v9 = objc_claimAutoreleasedReturnValue();
    vocabularyByRelationshipByLocale = v2->_vocabularyByRelationshipByLocale;
    v2->_vocabularyByRelationshipByLocale = (NSDictionary *)v9;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v11 = objc_claimAutoreleasedReturnValue();
    regularExpressionByRelationshipByLocale = v2->_regularExpressionByRelationshipByLocale;
    v2->_regularExpressionByRelationshipByLocale = (NSMutableDictionary *)v11;

    objc_msgSend(MEMORY[0x1E0CB3500], "letterCharacterSet");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "invertedSet");
    v14 = objc_claimAutoreleasedReturnValue();
    nonLetterCharacterSet = v2->_nonLetterCharacterSet;
    v2->_nonLetterCharacterSet = (NSCharacterSet *)v14;

  }
  return v2;
}

- (void)invalidateMemoryCaches
{
  NSMutableDictionary *v3;
  NSMutableDictionary *sexHintByCNIdentifier;
  NSDictionary *v5;
  NSDictionary *vocabularyByRelationshipByLocale;
  NSMutableDictionary *v7;
  NSMutableDictionary *regularExpressionByRelationshipByLocale;

  v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  sexHintByCNIdentifier = self->_sexHintByCNIdentifier;
  self->_sexHintByCNIdentifier = v3;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  vocabularyByRelationshipByLocale = self->_vocabularyByRelationshipByLocale;
  self->_vocabularyByRelationshipByLocale = v5;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v7 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  regularExpressionByRelationshipByLocale = self->_regularExpressionByRelationshipByLocale;
  self->_regularExpressionByRelationshipByLocale = v7;

}

- (unint64_t)sexHintForPerson:(id)a3 usingLocales:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  int v25;
  id v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "CNIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_sexHintByCNIdentifier, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v9)
  {
    objc_msgSend(v6, "firstName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "lowercaseString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v13, "length"))
    {
      v14 = objc_retainAutorelease(v13);
      if (objc_msgSend(v14, "UTF8String"))
      {
        v15 = -[NPNameParser genderMajorityForGivenName:](self->_nameParser, "genderMajorityForGivenName:", v14);
        if (v15)
        {
          if (v15 == 2)
            v11 = 2;
          else
            v11 = v15 == 1;
        }
        else
        {
          v18 = objc_msgSend(v6, "relationship");
          if (!v18)
            v18 = -[CLSSocialServiceCoreNameParser relationshipHintForPerson:usingLocales:](self, "relationshipHintForPerson:usingLocales:", v6, v7);
          v11 = -[CLSSocialServiceCoreNameParser _sexHintForRelationship:](self, "_sexHintForRelationship:", v18);
        }
      }
      else
      {
        +[CLSLogging sharedLogging](CLSLogging, "sharedLogging");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "loggingConnection");
        v17 = objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          v25 = 138412546;
          v26 = v6;
          v27 = 2112;
          v28 = v14;
          _os_log_error_impl(&dword_1CAB79000, v17, OS_LOG_TYPE_ERROR, "[CLSSocialServiceCoreNameParser] Person %@ has an invalid UTF8 given name (%@)", (uint8_t *)&v25, 0x16u);
        }

        v11 = 0;
      }
      if (objc_msgSend(v8, "length"))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v11);
        v19 = objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_sexHintByCNIdentifier, "setObject:forKeyedSubscript:", v19, v8);
      }
      else
      {
        +[CLSLogging sharedLogging](CLSLogging, "sharedLogging");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "loggingConnection");
        v19 = objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          v25 = 138412290;
          v26 = v6;
          _os_log_impl(&dword_1CAB79000, v19, OS_LOG_TYPE_INFO, "[CLSSocialServiceCoreNameParser] Person %@ does not have cnIdentifier, not adding to sex hint cache", (uint8_t *)&v25, 0xCu);
        }
      }

      if (v11)
        goto LABEL_24;
      +[CLSLogging sharedLogging](CLSLogging, "sharedLogging");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "loggingConnection");
      v22 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v6, "fullName");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = 138412290;
        v26 = v23;
        _os_log_impl(&dword_1CAB79000, v22, OS_LOG_TYPE_INFO, "[CLSSocialServiceCoreNameParser] No sex hint extracted from name %@", (uint8_t *)&v25, 0xCu);

      }
    }
    v11 = 0;
LABEL_24:

    goto LABEL_25;
  }
  v11 = objc_msgSend(v9, "integerValue");
LABEL_25:

  return v11;
}

- (unint64_t)_sexHintForRelationship:(unint64_t)a3
{
  if (a3 > 0x11)
    return 0;
  else
    return qword_1CABE8F80[a3];
}

- (id)_normalizeName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  __CFString *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t);
  void *v27;
  id v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    objc_msgSend(v4, "lowercaseString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "mutableCopy");

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "length");
    v24 = MEMORY[0x1E0C809B0];
    v25 = 3221225472;
    v26 = __49__CLSSocialServiceCoreNameParser__normalizeName___block_invoke;
    v27 = &unk_1E84F9230;
    v8 = v7;
    v28 = v8;
    CEMEnumerateEmojiTokensInStringWithBlock();
    if (objc_msgSend(v8, "count"))
    {
      v22 = 0u;
      v23 = 0u;
      v20 = 0u;
      v21 = 0u;
      objc_msgSend(v8, "reverseObjectEnumerator", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v29, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v21;
        do
        {
          v13 = 0;
          do
          {
            if (*(_QWORD *)v21 != v12)
              objc_enumerationMutation(v9);
            v14 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v13);
            v15 = (void *)MEMORY[0x1D1796094]();
            v16 = objc_msgSend(v14, "rangeValue");
            objc_msgSend(v6, "deleteCharactersInRange:", v16, v17);
            objc_autoreleasePoolPop(v15);
            ++v13;
          }
          while (v11 != v13);
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v29, 16);
        }
        while (v11);
      }

    }
    objc_msgSend(v6, "stringByTrimmingCharactersInSet:", self->_nonLetterCharacterSet);
    v18 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v18 = &stru_1E84F9D30;
  }

  return v18;
}

- (unint64_t)relationshipHintForPerson:(id)a3 usingLocales:(id)a4
{
  id v6;
  id v7;
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
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  unint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v37;
  uint64_t v38;
  id v39;
  id v40;
  uint64_t v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  CLSSocialServiceCoreNameParser *v46;
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
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "fullName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLSSocialServiceCoreNameParser _normalizeName:](self, "_normalizeName:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "nickname");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = self;
  -[CLSSocialServiceCoreNameParser _normalizeName:](self, "_normalizeName:", v10);
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "length") || objc_msgSend(v45, "length"))
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = 0u;
    v56 = 0u;
    v57 = 0u;
    v58 = 0u;
    v12 = v7;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v55, v61, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v56;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v56 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v55 + 1) + 8 * i), "languageCode");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (v17)
            objc_msgSend(v11, "addObject:", v17);

        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v55, v61, 16);
      }
      while (v14);
    }

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLSSocialServiceCoreNameParser _parentRelationships](v46, "_parentRelationships");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    v20 = v11;
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v51, v60, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v52;
      v39 = v7;
      v40 = v6;
      v43 = v19;
      v44 = v18;
      v42 = v20;
      v37 = *(_QWORD *)v52;
      do
      {
        v24 = 0;
        v38 = v22;
        do
        {
          if (*(_QWORD *)v52 != v23)
            objc_enumerationMutation(v20);
          v25 = *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * v24);
          if ((objc_msgSend(v18, "containsObject:", v25, v37) & 1) == 0)
          {
            v41 = v24;
            objc_msgSend(v18, "addObject:", v25);
            v49 = 0u;
            v50 = 0u;
            v47 = 0u;
            v48 = 0u;
            v26 = v19;
            v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v47, v59, 16);
            if (v27)
            {
              v28 = v27;
              v29 = *(_QWORD *)v48;
              while (2)
              {
                for (j = 0; j != v28; ++j)
                {
                  if (*(_QWORD *)v48 != v29)
                    objc_enumerationMutation(v26);
                  v31 = objc_msgSend(*(id *)(*((_QWORD *)&v47 + 1) + 8 * j), "unsignedIntegerValue");
                  -[CLSSocialServiceCoreNameParser _regularExpressionForRelationship:languageCode:](v46, "_regularExpressionForRelationship:languageCode:", v31, v25);
                  v32 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v32)
                  {
                    objc_msgSend(v32, "matchesInString:options:range:", v9, 0, 0, objc_msgSend(v9, "length"));
                    v33 = (void *)objc_claimAutoreleasedReturnValue();
                    if (!objc_msgSend(v33, "count"))
                    {
                      objc_msgSend(v32, "matchesInString:options:range:", v45, 0, 0, objc_msgSend(v45, "length"));
                      v34 = objc_claimAutoreleasedReturnValue();

                      v33 = (void *)v34;
                    }
                    v35 = objc_msgSend(v33, "count");

                    if (v35)
                    {

                      v7 = v39;
                      v6 = v40;
                      v19 = v43;
                      v18 = v44;
                      v20 = v42;
                      goto LABEL_35;
                    }
                  }

                }
                v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v47, v59, 16);
                if (v28)
                  continue;
                break;
              }
            }

            v19 = v43;
            v18 = v44;
            v24 = v41;
            v20 = v42;
            v23 = v37;
            v22 = v38;
          }
          ++v24;
        }
        while (v24 != v22);
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v51, v60, 16);
        v31 = 0;
        v7 = v39;
        v6 = v40;
      }
      while (v22);
    }
    else
    {
      v31 = 0;
    }
LABEL_35:

  }
  else
  {
    v31 = 0;
  }

  return v31;
}

- (id)_parentRelationships
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E8512200);
}

- (id)_regularExpressionForRelationship:(unint64_t)a3 languageCode:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *, void *);
  void *v18;
  id v19;
  id v20;

  v6 = a4;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_regularExpressionByRelationshipByLocale, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    goto LABEL_5;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](self->_vocabularyByRelationshipByLocale, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v15 = MEMORY[0x1E0C809B0];
    v16 = 3221225472;
    v17 = __81__CLSSocialServiceCoreNameParser__regularExpressionForRelationship_languageCode___block_invoke;
    v18 = &unk_1E84F9258;
    v9 = v7;
    v19 = v9;
    v10 = v6;
    v20 = v10;
    objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", &v15);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_regularExpressionByRelationshipByLocale, "setObject:forKeyedSubscript:", v9, v10, v15, v16, v17, v18);

  }
  if (v7)
  {
LABEL_5:
    objc_msgSend((id)objc_opt_class(), "_dictionaryKeyForPersonRelationship:", a3);
    v11 = objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = (void *)v11;
      objc_msgSend(v7, "objectForKeyedSubscript:", v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (NPNameParser)nameParser
{
  return (NPNameParser *)objc_getProperty(self, a2, 8, 1);
}

- (void)setNameParser:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSMutableDictionary)sexHintByCNIdentifier
{
  return self->_sexHintByCNIdentifier;
}

- (void)setSexHintByCNIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_sexHintByCNIdentifier, a3);
}

- (NSDictionary)vocabularyByRelationshipByLocale
{
  return self->_vocabularyByRelationshipByLocale;
}

- (void)setVocabularyByRelationshipByLocale:(id)a3
{
  objc_storeStrong((id *)&self->_vocabularyByRelationshipByLocale, a3);
}

- (NSMutableDictionary)regularExpressionByRelationshipByLocale
{
  return self->_regularExpressionByRelationshipByLocale;
}

- (void)setRegularExpressionByRelationshipByLocale:(id)a3
{
  objc_storeStrong((id *)&self->_regularExpressionByRelationshipByLocale, a3);
}

- (NSCharacterSet)nonLetterCharacterSet
{
  return self->_nonLetterCharacterSet;
}

- (void)setNonLetterCharacterSet:(id)a3
{
  objc_storeStrong((id *)&self->_nonLetterCharacterSet, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nonLetterCharacterSet, 0);
  objc_storeStrong((id *)&self->_regularExpressionByRelationshipByLocale, 0);
  objc_storeStrong((id *)&self->_vocabularyByRelationshipByLocale, 0);
  objc_storeStrong((id *)&self->_sexHintByCNIdentifier, 0);
  objc_storeStrong((id *)&self->_nameParser, 0);
}

void __81__CLSSocialServiceCoreNameParser__regularExpressionForRelationship_languageCode___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  id v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a3, "componentsJoinedByString:", CFSTR("|"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("^(%@)$"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = 0;
  objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", v8, 1, &v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v14;
  if (v10)
  {
    +[CLSLogging sharedLogging](CLSLogging, "sharedLogging");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "loggingConnection");
    v12 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      v16 = v13;
      v17 = 2112;
      v18 = v5;
      _os_log_error_impl(&dword_1CAB79000, v12, OS_LOG_TYPE_ERROR, "[CLSSocialServiceCoreNameParser] Error creating regular expression from relationship vocabulary for language %@ and relationship %@", buf, 0x16u);
    }

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v9, v5);
  }

}

void __49__CLSSocialServiceCoreNameParser__normalizeName___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "addObject:", v2);

}

+ (id)_dictionaryKeyForPersonRelationship:(unint64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("father");
  if (a3 != 10)
    v3 = 0;
  if (a3 == 9)
    return CFSTR("mother");
  else
    return (id)v3;
}

+ (unint64_t)_personRelationshipFromString:(id)a3
{
  id v3;
  unint64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("mother")) & 1) != 0)
  {
    v4 = 9;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("father")))
  {
    v4 = 10;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

@end
