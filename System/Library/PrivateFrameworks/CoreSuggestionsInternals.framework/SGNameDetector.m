@implementation SGNameDetector

- (SGNameDetector)initWithLanguage:(id)a3
{
  id v5;
  SGNameDetector *v6;
  SGNameDetector *v7;
  uint64_t v8;
  SGNameMappingTransformer *transformer;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SGNameDetector;
  v6 = -[SGNameDetector init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_language, a3);
    +[SGNameMappingTransformer instanceForNameDetector](SGNameMappingTransformer, "instanceForNameDetector");
    v8 = objc_claimAutoreleasedReturnValue();
    transformer = v7->_transformer;
    v7->_transformer = (SGNameMappingTransformer *)v8;

  }
  return v7;
}

- (id)tokenizerWithCoreNLPEnabled:(BOOL)a3
{
  SGTokenizerMappingTransformer *coreNLPTokenizer;
  SGTokenizerMappingTransformer **p_coreNLPTokenizer;
  SGTokenizerMappingTransformer *v6;
  SGTokenizerMappingTransformer *noCoreNLPTokenizer;
  SGTokenizerMappingTransformer *v8;

  if (a3)
  {
    p_coreNLPTokenizer = &self->_coreNLPTokenizer;
    coreNLPTokenizer = self->_coreNLPTokenizer;
    if (!coreNLPTokenizer)
    {
      +[SGTokenizerMappingTransformer forLocale:tagNames:trustCoreNLP:personalNameMapping:punctuationMapping:](SGTokenizerMappingTransformer, "forLocale:tagNames:trustCoreNLP:personalNameMapping:punctuationMapping:", self->_language, 1, 1, 0, 0);
      v6 = (SGTokenizerMappingTransformer *)objc_claimAutoreleasedReturnValue();
      noCoreNLPTokenizer = self->_coreNLPTokenizer;
      self->_coreNLPTokenizer = v6;
LABEL_6:

      coreNLPTokenizer = *p_coreNLPTokenizer;
    }
  }
  else
  {
    p_coreNLPTokenizer = &self->_noCoreNLPTokenizer;
    coreNLPTokenizer = self->_noCoreNLPTokenizer;
    if (!coreNLPTokenizer)
    {
      +[SGTokenizerMappingTransformer forLocale:tagNames:trustCoreNLP:personalNameMapping:punctuationMapping:](SGTokenizerMappingTransformer, "forLocale:tagNames:trustCoreNLP:personalNameMapping:punctuationMapping:", self->_language, 0, 0, 0, 0);
      v8 = (SGTokenizerMappingTransformer *)objc_claimAutoreleasedReturnValue();
      noCoreNLPTokenizer = self->_noCoreNLPTokenizer;
      self->_noCoreNLPTokenizer = v8;
      goto LABEL_6;
    }
  }
  return coreNLPTokenizer;
}

- (id)detectNames:(id)a3 algorithm:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v12;
  int v13;
  unint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[SGNameDetector tokenizerWithCoreNLPEnabled:](self, "tokenizerWithCoreNLPEnabled:", a4 == 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "transform:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  switch(a4)
  {
    case 2uLL:
      -[SGNameMappingTransformer transform:](self->_transformer, "transform:", v8);
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 0uLL:
      -[SGNameDetector _detectContactNames:](self, "_detectContactNames:", v8);
      v9 = objc_claimAutoreleasedReturnValue();
LABEL_7:
      v10 = (void *)v9;
      goto LABEL_8;
    case 1uLL:
      -[SGNameDetector _detectNLPNames:](self, "_detectNLPNames:", v8);
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
  }
  sgLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
  {
    v13 = 134217984;
    v14 = a4;
    _os_log_fault_impl(&dword_1C3607000, v12, OS_LOG_TYPE_FAULT, "Invalid value for SGNameDetectorAlgorithm: %lu", (uint8_t *)&v13, 0xCu);
  }

  if (_PASEvaluateLogFaultAndProbCrashCriteria())
    abort();
  v10 = 0;
LABEL_8:

  return v10;
}

- (id)_detectNames:(id)a3 withNameSet:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  NSUInteger v21;
  NSUInteger v22;
  NSUInteger v23;
  NSUInteger v24;
  NSRange v25;
  uint64_t v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;
  NSRange v35;
  NSRange v36;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v5, "count"));
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v8 = v5;
  v28 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v28)
  {
    v9 = *(_QWORD *)v30;
    v10 = 1;
    v27 = *(_QWORD *)v30;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v30 != v9)
          objc_enumerationMutation(v8);
        v12 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v11);
        v13 = (void *)MEMORY[0x1C3BD4F6C]();
        objc_msgSend(v12, "lowercaseString");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v6, "containsObject:", v14);

        if (v15)
        {
          if ((v10 & 1) != 0)
          {
            objc_msgSend(v12, "stringWithNewContents:", CFSTR("SG_FEATURE_FULLNAME"));
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "addObject:", v16);
          }
          else
          {
            objc_msgSend(v7, "lastObject");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = v8;
            v19 = v7;
            v20 = v6;
            v21 = objc_msgSend(v17, "range");
            v23 = v22;
            v36.location = objc_msgSend(v12, "range");
            v36.length = v24;
            v35.location = v21;
            v6 = v20;
            v7 = v19;
            v8 = v18;
            v35.length = v23;
            v25 = NSUnionRange(v35, v36);
            +[SGTokenString stringWithString:range:](SGTokenString, "stringWithString:range:", CFSTR("SG_FEATURE_FULLNAME"), v25.location, v25.length);
            v16 = (void *)objc_claimAutoreleasedReturnValue();

            v9 = v27;
            objc_msgSend(v7, "setObject:atIndexedSubscript:", v16, objc_msgSend(v7, "count") - 1);
          }

        }
        v10 = v15 ^ 1;
        objc_autoreleasePoolPop(v13);
        ++v11;
      }
      while (v28 != v11);
      v28 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v28);
  }

  return v7;
}

- (id)detectNames:(id)a3 withNameSet:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  -[SGNameDetector tokenizerWithCoreNLPEnabled:](self, "tokenizerWithCoreNLPEnabled:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "transform:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[SGNameDetector _detectNames:withNameSet:](self, "_detectNames:withNameSet:", v9, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_detectContactNames:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  +[SGNameDetector _contactNames](SGNameDetector, "_contactNames");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGNameDetector _detectNames:withNameSet:](self, "_detectNames:withNameSet:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_detectNLPNames:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  int v11;
  int v12;
  int v13;
  void *v14;
  NSUInteger v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  NSUInteger v19;
  NSUInteger v20;
  NSUInteger v21;
  NSRange v22;
  void *v23;
  id obj;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;
  NSRange v33;
  NSRange v34;

  v32 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v26 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  obj = v3;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v28;
    LODWORD(v7) = -1;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v28 != v6)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        v10 = (void *)MEMORY[0x1C3BD4F6C]();
        if (objc_msgSend(v9, "confidence"))
        {
          v11 = objc_msgSend(v9, "confidence");
          v12 = v11;
          if ((_DWORD)v7 == -1)
          {
            objc_msgSend(v9, "stringWithNewContents:", CFSTR("SG_FEATURE_FULLNAME"));
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "addObject:", v23);
            LODWORD(v7) = v12;
          }
          else
          {
            if (v11 <= (int)v7)
              v13 = v7;
            else
              v13 = v11;
            v7 = (v13 + 1);
            objc_msgSend(v26, "lastObject");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = objc_msgSend(v14, "range");
            v16 = v10;
            v17 = v5;
            v18 = v6;
            v20 = v19;
            v34.location = objc_msgSend(v9, "range");
            v34.length = v21;
            v33.location = v15;
            v33.length = v20;
            v6 = v18;
            v5 = v17;
            v10 = v16;
            v22 = NSUnionRange(v33, v34);
            +[SGTokenString stringWithString:range:confidence:](SGTokenString, "stringWithString:range:confidence:", CFSTR("SG_FEATURE_FULLNAME"), v22.location, v22.length, v7);
            v23 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v26, "setObject:atIndexedSubscript:", v23, objc_msgSend(v26, "count") - 1);
          }

        }
        else
        {
          LODWORD(v7) = -1;
        }
        objc_autoreleasePoolPop(v10);
      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v5);
  }

  return v26;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transformer, 0);
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_coreNLPTokenizer, 0);
  objc_storeStrong((id *)&self->_noCoreNLPTokenizer, 0);
}

+ (id)_contactNames
{
  if (_contactNames__pasOnceToken3 != -1)
    dispatch_once(&_contactNames__pasOnceToken3, &__block_literal_global_31733);
  objc_storeStrong((id *)&_contactNames_contactNames, (id)_contactNames__pasExprOnceResult);
  return (id)_contactNames_contactNames;
}

+ (id)_fetchContactNamesToLimit:(unint64_t)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_opt_new();
  +[SGNameDetector _fetchContactNamesToLimit:peopleSuggester:](SGNameDetector, "_fetchContactNamesToLimit:peopleSuggester:", a3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)_fetchContactNamesToLimit:(unint64_t)a3 peopleSuggester:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v36;
  id v37;
  NSObject *obj;
  uint64_t v39;
  uint64_t v40;
  uint64_t v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint8_t buf[16];
  _BYTE v52[128];
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v4 = a4;
  v5 = (void *)objc_opt_new();
  v6 = (void *)objc_opt_new();
  objc_msgSend(v4, "rankedGlobalSuggestionsFromContext:contactsOnly:", v6, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    obj = v7;
    v40 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v47, v53, 16);
    if (v40)
    {
      v36 = v7;
      v37 = v4;
      v8 = 0;
      v39 = *(_QWORD *)v48;
LABEL_4:
      v9 = 0;
      while (1)
      {
        v42 = v8;
        if (*(_QWORD *)v48 != v39)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * v9);
        v43 = 0u;
        v44 = 0u;
        v45 = 0u;
        v46 = 0u;
        objc_msgSend(v10, "recipients");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v43, v52, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v44;
          do
          {
            v15 = 0;
            do
            {
              if (*(_QWORD *)v44 != v14)
                objc_enumerationMutation(v11);
              v16 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * v15);
              v17 = (void *)MEMORY[0x1C3BD4F6C]();
              objc_msgSend(v16, "contact");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "givenName");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              v20 = objc_msgSend(v19, "length");

              if (v20)
              {
                objc_msgSend(v18, "givenName");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v21, "localizedLowercaseString");
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v5, "addObject:", v22);

              }
              objc_msgSend(v18, "familyName");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              v24 = objc_msgSend(v23, "length");

              if (v24)
              {
                objc_msgSend(v18, "familyName");
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v25, "localizedLowercaseString");
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v5, "addObject:", v26);

              }
              objc_msgSend(v18, "middleName");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              v28 = objc_msgSend(v27, "length");

              if (v28)
              {
                objc_msgSend(v18, "middleName");
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v29, "localizedLowercaseString");
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v5, "addObject:", v30);

              }
              objc_msgSend(v18, "nickname");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              v32 = objc_msgSend(v31, "length");

              if (v32)
              {
                objc_msgSend(v18, "nickname");
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v33, "localizedLowercaseString");
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v5, "addObject:", v34);

              }
              objc_autoreleasePoolPop(v17);
              ++v15;
            }
            while (v13 != v15);
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v43, v52, 16);
          }
          while (v13);
        }

        v8 = v42 + 1;
        if (v42 + 1 >= a3)
          break;
        if (++v9 == v40)
        {
          v40 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v47, v53, 16);
          if (v40)
            goto LABEL_4;
          break;
        }
      }
      v7 = v36;
      v4 = v37;
    }
  }
  else
  {
    sgLogHandle();
    obj = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(obj, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1C3607000, obj, OS_LOG_TYPE_ERROR, "SGNameDetector - Error querying contacts from people suggester.", buf, 2u);
    }
  }

  return v5;
}

void __31__SGNameDetector__contactNames__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1C3BD4F6C]();
  +[SGNameDetector _fetchContactNamesToLimit:](SGNameDetector, "_fetchContactNamesToLimit:", 500);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)_contactNames__pasExprOnceResult;
  _contactNames__pasExprOnceResult = v1;

  objc_autoreleasePoolPop(v0);
}

@end
