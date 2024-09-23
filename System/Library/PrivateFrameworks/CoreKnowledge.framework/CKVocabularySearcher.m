@implementation CKVocabularySearcher

- (CKVocabularySearcher)initWithUserId:(id)a3 spanMatcher:(id)a4 prewarm:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  id v10;
  CKVocabularySearcher *v11;
  CKVocabularySearcher *v12;
  objc_super v14;

  v5 = a5;
  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CKVocabularySearcher;
  v11 = -[CKVocabularySearcher init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_userId, a3);
    objc_storeStrong((id *)&v12->_spanMatcher, a4);
    if (v5)
      -[SEMSpanMatcher prewarmIndexWithUserId:](v12->_spanMatcher, "prewarmIndexWithUserId:", v9);
  }

  return v12;
}

- (CKVocabularySearcher)init
{
  id v2;

  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("You must use factory method"), MEMORY[0x1E0C9AA70]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (id)searchCustomVocabulary:(id)a3 appIds:(id)a4 vocabularyTypes:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v8 = a3;
  v9 = a4;
  -[CKVocabularySearcher _convertTypes:](self, "_convertTypes:", a5);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (!a5 || v10)
  {
    -[CKVocabularySearcher _searcher](self, "_searcher");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "searchAppCustomVocabularyFTS:appIds:types:", v8, v9, v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    -[CKVocabularySearcher _convertResults:](self, "_convertResults:", v14);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v12;
}

- (id)searchCustomVocabularyWithWildcardPatterns:(id)a3 appIds:(id)a4 vocabularyTypes:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v8 = a3;
  v9 = a4;
  -[CKVocabularySearcher _convertTypes:](self, "_convertTypes:", a5);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (!a5 || v10)
  {
    -[CKVocabularySearcher _searcher](self, "_searcher");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "searchAppCustomVocabularyFTSWithWildcardPatterns:appIds:types:", v8, v9, v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    -[CKVocabularySearcher _convertResults:](self, "_convertResults:", v14);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v12;
}

- (id)matchSpansOfUtterance:(id)a3
{
  id v4;
  void *v5;
  SEMSpanMatcher *spanMatcher;
  NSString *userId;
  void *v8;
  id v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CKVocabularySearcher _queryFromTokenChain:](self, "_queryFromTokenChain:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    userId = self->_userId;
    spanMatcher = self->_spanMatcher;
    v14 = 0;
    -[SEMSpanMatcher matchSpans:userId:error:](spanMatcher, "matchSpans:userId:error:", v5, userId, &v14);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v14;
    if (v8)
    {
      -[CKVocabularySearcher _convertMatches:](self, "_convertMatches:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = CKLogContextVocabulary;
      if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v16 = "-[CKVocabularySearcher matchSpansOfUtterance:]";
        v17 = 2112;
        v18 = v9;
        v19 = 2112;
        v20 = v4;
        _os_log_error_impl(&dword_1A48B3000, v12, OS_LOG_TYPE_ERROR, "%s Failed match spans due to error: %@ input: %@", buf, 0x20u);
      }
      v10 = (void *)MEMORY[0x1E0C9AA60];
    }

  }
  else
  {
    v11 = CKLogContextVocabulary;
    if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v16 = "-[CKVocabularySearcher matchSpansOfUtterance:]";
      v17 = 2112;
      v18 = v4;
      _os_log_error_impl(&dword_1A48B3000, v11, OS_LOG_TYPE_ERROR, "%s Received invalid utteranceTokens input: %@", buf, 0x16u);
    }
    v10 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v10;
}

- (id)matchSpansOfString:(id)a3
{
  id v4;
  SEMSpanMatcher *spanMatcher;
  NSString *userId;
  void *v7;
  id v8;
  void *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  SEMSpanMatcher *v13;
  NSString *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  NSObject *v19;
  objc_class *v20;
  void *v21;
  objc_class *v22;
  void *v23;
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  id v28;
  id v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  _BYTE buf[24];
  void *v35;
  uint64_t *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v18 = (void *)CKLogContextVocabulary;
    if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
    {
      v19 = v18;
      v20 = (objc_class *)objc_opt_class();
      NSStringFromClass(v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (objc_class *)objc_opt_class();
      NSStringFromClass(v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = "-[CKVocabularySearcher matchSpansOfString:]";
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v21;
      *(_WORD *)&buf[22] = 2112;
      v35 = v23;
      _os_log_error_impl(&dword_1A48B3000, v19, OS_LOG_TYPE_ERROR, "%s Input must be nonnull object of class %@ received %@", buf, 0x20u);

    }
    goto LABEL_12;
  }
  if (!objc_msgSend(v4, "length"))
  {
    v24 = CKLogContextVocabulary;
    if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = "-[CKVocabularySearcher matchSpansOfString:]";
      _os_log_debug_impl(&dword_1A48B3000, v24, OS_LOG_TYPE_DEBUG, "%s Returning empty results for zero-length string input", buf, 0xCu);
    }
LABEL_12:
    v17 = (void *)MEMORY[0x1E0C9AA60];
    goto LABEL_21;
  }
  userId = self->_userId;
  spanMatcher = self->_spanMatcher;
  v29 = 0;
  -[SEMSpanMatcher indexLocaleWithUserId:error:](spanMatcher, "indexLocaleWithUserId:error:", userId, &v29);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v29;
  if (v7)
  {
    v30 = 0;
    v31 = &v30;
    v32 = 0x2050000000;
    v9 = (void *)getSEMTokenizerClass_softClass;
    v33 = getSEMTokenizerClass_softClass;
    if (!getSEMTokenizerClass_softClass)
    {
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __getSEMTokenizerClass_block_invoke;
      v35 = &unk_1E4D29880;
      v36 = &v30;
      __getSEMTokenizerClass_block_invoke((uint64_t)buf);
      v9 = (void *)v31[3];
    }
    v10 = objc_retainAutorelease(v9);
    _Block_object_dispose(&v30, 8);
    v11 = (void *)objc_msgSend([v10 alloc], "initWithLocale:", v7);
    objc_msgSend(v11, "queryFromText:", v4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = self->_userId;
    v13 = self->_spanMatcher;
    v28 = v8;
    -[SEMSpanMatcher matchSpans:userId:error:](v13, "matchSpans:userId:error:", v12, v14, &v28);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v28;

    if (v15)
    {
      -[CKVocabularySearcher _convertMatches:](self, "_convertMatches:", v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v26 = CKLogContextVocabulary;
      if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        *(_QWORD *)&buf[4] = "-[CKVocabularySearcher matchSpansOfString:]";
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v16;
        *(_WORD *)&buf[22] = 2112;
        v35 = v4;
        _os_log_error_impl(&dword_1A48B3000, v26, OS_LOG_TYPE_ERROR, "%s Failed match spans due to error: %@ input: %@", buf, 0x20u);
      }
      v17 = (void *)MEMORY[0x1E0C9AA60];
    }

    v8 = v16;
  }
  else
  {
    v25 = CKLogContextVocabulary;
    if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "-[CKVocabularySearcher matchSpansOfString:]";
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v8;
      _os_log_error_impl(&dword_1A48B3000, v25, OS_LOG_TYPE_ERROR, "%s Failed to resolve index locale: %@", buf, 0x16u);
    }
    v17 = (void *)MEMORY[0x1E0C9AA60];
  }

LABEL_21:
  return v17;
}

- (id)_searcher
{
  void *v3;
  objc_class *v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2050000000;
  v3 = (void *)getSEMAppCustomVocabularySearcherClass_softClass;
  v10 = getSEMAppCustomVocabularySearcherClass_softClass;
  if (!getSEMAppCustomVocabularySearcherClass_softClass)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __getSEMAppCustomVocabularySearcherClass_block_invoke;
    v6[3] = &unk_1E4D29880;
    v6[4] = &v7;
    __getSEMAppCustomVocabularySearcherClass_block_invoke((uint64_t)v6);
    v3 = (void *)v8[3];
  }
  v4 = objc_retainAutorelease(v3);
  _Block_object_dispose(&v7, 8);
  return (id)objc_msgSend([v4 alloc], "initWithUserId:", self->_userId);
}

- (id)_convertTypes:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  unsigned __int16 v11;
  unsigned __int16 v12;
  int v13;
  void *v14;
  id v15;
  NSObject *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  void *v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", 2);
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v19;
LABEL_4:
      v9 = 0;
      while (1)
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v9);
        v11 = objc_msgSend(v10, "integerValue", (_QWORD)v18);
        if (CKVCustomTypeIsValid(v11))
          v12 = v11;
        else
          v12 = 0;
        v13 = v12;
        if (!CKVCustomTypeIsValid(v12))
        {
          v16 = CKLogContextVocabulary;
          if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v23 = "-[CKVocabularySearcher _convertTypes:]";
            v24 = 2112;
            v25 = v10;
            _os_log_error_impl(&dword_1A48B3000, v16, OS_LOG_TYPE_ERROR, "%s Invalid vocabulary type: %@", buf, 0x16u);
          }

          v15 = 0;
          goto LABEL_22;
        }
        if (v13 == 1)
          break;
        if (v13 == 2)
        {
          v14 = &unk_1E4D31CE8;
LABEL_15:
          objc_msgSend(v4, "addObject:", v14);
        }
        if (v7 == ++v9)
        {
          v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
          if (v7)
            goto LABEL_4;
          goto LABEL_18;
        }
      }
      v14 = &unk_1E4D31CD0;
      goto LABEL_15;
    }
LABEL_18:

    v15 = v4;
LABEL_22:

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)_convertResults:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  int v10;
  uint64_t v11;
  CKVCustomTerm *v12;
  void *v13;
  void *v14;
  void *v15;
  CKVCustomTerm *v16;
  CKVocabularySearchResult *v17;
  void *v18;
  CKVocabularySearchResult *v19;
  id obj;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v22 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = v3;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v24 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        v10 = objc_msgSend(v9, "vocabularyType");
        if (v10 == 1)
          v11 = 1;
        else
          v11 = 2 * (v10 == 2);
        v12 = [CKVCustomTerm alloc];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%u"), v6 + i + 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "vocabularyString");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "vocabularyIdentifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = -[CKVCustomTerm initWithItemId:vocabularyType:term:vocabularyId:](v12, "initWithItemId:vocabularyType:term:vocabularyId:", v13, v11, v14, v15);

        v17 = [CKVocabularySearchResult alloc];
        objc_msgSend(v9, "originAppId");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = -[CKVocabularySearchResult initWithVocabularyItem:originAppId:](v17, "initWithVocabularyItem:originAppId:", v16, v18);

        if (v19)
          objc_msgSend(v22, "addObject:", v19);

      }
      v6 = (v6 + i);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v5);
  }

  return v22;
}

- (id)_queryFromTokenChain:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  objc_class *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v23;
  void *v24;
  id obj;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _QWORD v31[5];
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()))
  {
    v24 = v3;
    objc_msgSend(v3, "tokens");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count");

    if (v5)
    {
      v32 = 0;
      v33 = &v32;
      v34 = 0x2050000000;
      v6 = (void *)getSEMSpanMatchQueryBuilderClass_softClass;
      v35 = getSEMSpanMatchQueryBuilderClass_softClass;
      if (!getSEMSpanMatchQueryBuilderClass_softClass)
      {
        v31[0] = MEMORY[0x1E0C809B0];
        v31[1] = 3221225472;
        v31[2] = __getSEMSpanMatchQueryBuilderClass_block_invoke;
        v31[3] = &unk_1E4D29880;
        v31[4] = &v32;
        __getSEMSpanMatchQueryBuilderClass_block_invoke((uint64_t)v31);
        v6 = (void *)v33[3];
      }
      v7 = objc_retainAutorelease(v6);
      _Block_object_dispose(&v32, 8);
      v8 = [v7 alloc];
      objc_msgSend(v24, "locale");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "normalizedString");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = (void *)objc_msgSend(v8, "initWithLocale:originalText:", v9, v10);

      v29 = 0u;
      v30 = 0u;
      v27 = 0u;
      v28 = 0u;
      objc_msgSend(v24, "tokens");
      obj = (id)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
      if (v11)
      {
        v12 = *(_QWORD *)v28;
        do
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v28 != v12)
              objc_enumerationMutation(obj);
            v14 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
            objc_msgSend(v14, "value");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "cleanValue");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "normalizedValues");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = objc_msgSend(v14, "beginIndex");
            v19 = objc_msgSend(v14, "endIndex");
            v20 = objc_msgSend(v14, "isSignificant");
            LOBYTE(v23) = objc_msgSend(v14, "isWhitespace");
            objc_msgSend(v26, "addTokenWithValue:cleanValue:normalizedValues:beginIndex:endIndex:isSignificant:isWhitespace:", v15, v16, v17, v18, v19, v20, v23);

          }
          v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
        }
        while (v11);
      }

      objc_msgSend(v26, "build");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v21 = 0;
    }
    v3 = v24;
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (id)_convertMatches:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        +[CKVMatchingSpan matchingSpanFromSpanMatchResult:](CKVMatchingSpan, "matchingSpanFromSpanMatchResult:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9), (_QWORD)v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
          objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spanMatcher, 0);
  objc_storeStrong((id *)&self->_userId, 0);
}

+ (id)makeSearcher
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc((Class)objc_opt_class());
  objc_msgSend(getSEMSpanMatcherClass(), "indexMatcher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithUserId:spanMatcher:prewarm:", 0, v3, 0);

  return v4;
}

+ (id)makeSearcherForUserId:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = objc_alloc((Class)objc_opt_class());
  objc_msgSend(getSEMSpanMatcherClass(), "indexMatcher");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithUserId:spanMatcher:prewarm:", v3, v5, 1);

  return v6;
}

+ (void)initialize
{
  if (CKLogInit_onceToken != -1)
    dispatch_once(&CKLogInit_onceToken, &__block_literal_global_469);
}

@end
