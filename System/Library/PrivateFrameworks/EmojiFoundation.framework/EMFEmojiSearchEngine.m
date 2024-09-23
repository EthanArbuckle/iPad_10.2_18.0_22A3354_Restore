@implementation EMFEmojiSearchEngine

+ (BOOL)isLocaleSupported:(id)a3
{
  return +[EMFSearchEngineBundleLoader isLocaleSupported:](EMFSearchEngineBundleLoader, "isLocaleSupported:", a3);
}

- (EMFEmojiSearchEngine)init
{
  return -[EMFEmojiSearchEngine initWithLocale:](self, "initWithLocale:", 0);
}

- (EMFEmojiSearchEngine)initWithLocale:(id)a3
{
  id v4;
  void *v5;
  EMFEmojiSearchEngine *v6;

  v4 = a3;
  +[EMFSearchEngineBundleLoader assetBundleForLocale:](EMFSearchEngineBundleLoader, "assetBundleForLocale:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    self = -[EMFEmojiSearchEngine initWithLocale:andAssetBundle:](self, "initWithLocale:andAssetBundle:", v4, v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (EMFEmojiSearchEngine)initWithLocale:(id)a3 andAssetBundle:(id)a4
{
  id v6;
  EMFEmojiSearchEngine *v7;
  id v8;
  EMFIndexManager *v9;
  EMFDefaultAutocompleteCandidateProvider *v10;
  EMFStringStemmer *v11;

  v6 = a3;
  v7 = 0;
  if (v6 && a4)
  {
    v8 = a4;
    v9 = -[EMFIndexManager initWithBundle:]([EMFIndexManager alloc], "initWithBundle:", v8);
    v10 = -[EMFDefaultAutocompleteCandidateProvider initWithBundle:]([EMFDefaultAutocompleteCandidateProvider alloc], "initWithBundle:", v8);

    if (+[EMFStringStemmer supportsLocale:](EMFStringStemmer, "supportsLocale:", v6))
      v11 = -[EMFStringStemmer initWithLocale:]([EMFStringStemmer alloc], "initWithLocale:", v6);
    else
      v11 = 0;
    self = -[EMFEmojiSearchEngine initWithLocale:andIndexManager:andStringStemmer:andAutocompleteProvider:](self, "initWithLocale:andIndexManager:andStringStemmer:andAutocompleteProvider:", v6, v9, v11, v10);

    v7 = self;
  }

  return v7;
}

- (EMFEmojiSearchEngine)initWithLocale:(id)a3 andIndexManager:(id)a4 andStringStemmer:(id)a5 andAutocompleteProvider:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  EMFEmojiSearchEngine *v15;
  EMFEmojiSearchEngine *v16;
  EMFQueryLogger *v17;
  EMFQueryLogger *queryLogger;
  uint64_t v19;
  EMFQueryResultOverrideList *overrideList;
  objc_super v22;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v22.receiver = self;
  v22.super_class = (Class)EMFEmojiSearchEngine;
  v15 = -[EMFEmojiSearchEngine init](&v22, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_indexManager, a4);
    objc_storeStrong((id *)&v16->_locale, a3);
    objc_storeStrong((id *)&v16->_stringStemmer, a5);
    objc_storeStrong((id *)&v16->_autocompleteProvider, a6);
    objc_msgSend(v11, "localeIdentifier");
    v16->_localeData = (__EmojiLocaleDataWrapper *)CEMCreateEmojiLocaleData();
    v17 = -[EMFQueryLogger initWithEmojiLocaleData:]([EMFQueryLogger alloc], "initWithEmojiLocaleData:", v16->_localeData);
    queryLogger = v16->_queryLogger;
    v16->_queryLogger = v17;

    +[EMFQueryResultOverrideListLoader overrideListForLocale:](EMFQueryResultOverrideListLoader, "overrideListForLocale:", v11);
    v19 = objc_claimAutoreleasedReturnValue();
    overrideList = v16->_overrideList;
    v16->_overrideList = (EMFQueryResultOverrideList *)v19;

    v16->_enableAutocomplete = 1;
  }

  return v16;
}

- (void)dealloc
{
  __EmojiLocaleDataWrapper *localeData;
  objc_super v4;

  localeData = self->_localeData;
  if (localeData)
    CFRelease(localeData);
  v4.receiver = self;
  v4.super_class = (Class)EMFEmojiSearchEngine;
  -[EMFEmojiSearchEngine dealloc](&v4, sel_dealloc);
}

- (void)preheat
{
  id v2;

  -[EMFEmojiSearchEngine indexManager](self, "indexManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preheatIndexes");

}

- (id)performStringQuery:(id)a3
{
  id v4;
  NSObject *v5;
  os_signpost_id_t v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  BOOL v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  uint8_t v31[16];
  uint8_t buf[16];

  v4 = a3;
  emf_signpost_get_log();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_signpost_id_generate(v5);

  emf_signpost_get_log();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B3DE1000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "PerformSearchEngineQuery", (const char *)&unk_1B3E4DDFE, buf, 2u);
  }

  -[EMFEmojiSearchEngine indexManager](self, "indexManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stemmedIndex");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[EMFEmojiSearchEngine indexManager](self, "indexManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "defaultIndex");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    -[EMFEmojiSearchEngine _performStringQueryUntokenized:usingIndex:](self, "_performStringQueryUntokenized:usingIndex:", v4, v12);
    v13 = (id)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v13, "count"))
    {
      v13 = v13;
      v14 = 0;
      v15 = v13;
    }
    else
    {
      -[EMFEmojiSearchEngine indexManager](self, "indexManager");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "defaultIndex");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[EMFEmojiSearchEngine _performStringQueryOverride:usingIndex:](self, "_performStringQueryOverride:usingIndex:", v4, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = v18 != 0;
      if (v18)
      {
        v15 = v18;
      }
      else
      {
        -[EMFEmojiSearchEngine indexManager](self, "indexManager");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "defaultIndex");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[EMFEmojiSearchEngine _performStringQuery:usingIndex:shouldAutocomplete:shouldStem:](self, "_performStringQuery:usingIndex:shouldAutocomplete:shouldStem:", v4, v20, 1, 0);
        v15 = (id)objc_claimAutoreleasedReturnValue();

      }
    }
  }
  else
  {
    -[EMFEmojiSearchEngine _performStringQuery:usingIndex:shouldAutocomplete:shouldStem:](self, "_performStringQuery:usingIndex:shouldAutocomplete:shouldStem:", v4, v12, 1, 1);
    v15 = (id)objc_claimAutoreleasedReturnValue();

    v14 = 0;
    v13 = v11;
  }

  v21 = v15;
  v22 = objc_msgSend(v21, "count");
  v23 = v21;
  if (!v14)
  {
    v23 = v21;
    if (!v22)
    {
      -[EMFEmojiSearchEngine indexManager](self, "indexManager");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "stemmedIndex");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[EMFEmojiSearchEngine _performStringQuery:usingIndex:shouldAutocomplete:shouldStem:](self, "_performStringQuery:usingIndex:shouldAutocomplete:shouldStem:", v4, v25, 0, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  emf_signpost_get_log();
  v26 = objc_claimAutoreleasedReturnValue();
  v27 = v26;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
  {
    *(_WORD *)v31 = 0;
    _os_signpost_emit_with_name_impl(&dword_1B3DE1000, v27, OS_SIGNPOST_INTERVAL_END, v6, "PerformSearchEngineQuery", (const char *)&unk_1B3E4DDFE, v31, 2u);
  }

  v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E40]), "initWithArray:", v23);
  objc_msgSend(v28, "array");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  return v29;
}

- (id)performQuery:(id)a3 usingIndex:(id)a4
{
  id v6;
  id v7;
  EMFQueryEvaluator *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  v8 = -[EMFQueryEvaluator initWithIndex:andOverrideList:]([EMFQueryEvaluator alloc], "initWithIndex:andOverrideList:", v6, self->_overrideList);

  -[EMFQueryEvaluator performQuery:](v8, "performQuery:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[EMFQueryLogger logQueryResult:](self->_queryLogger, "logQueryResult:", v9);
  return v9;
}

- (id)_performStringQueryOverride:(id)a3 usingIndex:(id)a4
{
  id v6;
  id v7;
  EMFQueryEvaluator *v8;
  EMFQuery *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a4;
  v7 = a3;
  v8 = -[EMFQueryEvaluator initWithIndex:andOverrideList:]([EMFQueryEvaluator alloc], "initWithIndex:andOverrideList:", v6, self->_overrideList);

  v9 = -[EMFQuery initWithQueryString:andLocale:]([EMFQuery alloc], "initWithQueryString:andLocale:", v7, self->_locale);
  -[EMFQueryEvaluator performQuery:](v8, "performQuery:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[EMFQueryLogger logQueryResult:](self->_queryLogger, "logQueryResult:", v10);
  objc_msgSend(v10, "resultOverride");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(v10, "emojiStringMatchesUsingEmojiLocaleData:", self->_localeData);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)_performStringQueryUntokenized:(id)a3 usingIndex:(id)a4
{
  id v6;
  id v7;
  EMFQueryUntokenized *v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  v8 = -[EMFQuery initWithQueryString:andLocale:]([EMFQueryUntokenized alloc], "initWithQueryString:andLocale:", v7, self->_locale);

  if (-[EMFQueryUntokenized hasMultipleConstituentTokens](v8, "hasMultipleConstituentTokens"))
  {
    -[EMFEmojiSearchEngine performQuery:usingIndex:](self, "performQuery:usingIndex:", v8, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "emojiStringMatchesUsingEmojiLocaleData:", self->_localeData);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v10;
}

- (id)_performStringQuery:(id)a3 usingIndex:(id)a4 shouldAutocomplete:(BOOL)a5 shouldStem:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL4 v7;
  id v10;
  id v11;
  EMFQuery *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;

  v6 = a6;
  v7 = a5;
  v10 = a4;
  v11 = a3;
  v12 = -[EMFQuery initWithQueryString:andLocale:]([EMFQuery alloc], "initWithQueryString:andLocale:", v11, self->_locale);

  if (v6 && self->_stringStemmer)
    -[EMFQuery setStringStemmer:](v12, "setStringStemmer:");
  -[EMFEmojiSearchEngine performQuery:usingIndex:](self, "performQuery:usingIndex:", v12, v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "emojiStringMatchesUsingEmojiLocaleData:", self->_localeData);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v7 && self->_enableAutocomplete)
  {
    -[EMFEmojiSearchEngine _performAutocompletedQueryForQuery:usingIndex:](self, "_performAutocompletedQueryForQuery:usingIndex:", v12, v10);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "count");
    v18 = objc_msgSend(v16, "count");
    if ((unint64_t)(v18 + v17) >= 0x12C)
      v19 = 300;
    else
      v19 = v18 + v17;
    if (v19)
    {
      objc_msgSend(v15, "arrayByAddingObjectsFromArray:", v16);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "subarrayWithRange:", 0, v19);
      v21 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v21 = v15;
    }

  }
  else
  {
    v21 = v14;
  }

  return v21;
}

- (id)_performAutocompletedQueryForQuery:(id)a3 usingIndex:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[13];
  _QWORD v20[5];
  id v21;
  _QWORD v22[5];
  id v23;
  _QWORD v24[5];
  EMFQuery *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  _QWORD v32[5];
  id v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;

  v6 = a3;
  v7 = a4;
  v40 = 0;
  v41 = &v40;
  v42 = 0x3032000000;
  v43 = __Block_byref_object_copy_;
  v44 = __Block_byref_object_dispose_;
  objc_msgSend(v6, "tokens");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = (id)objc_msgSend(v8, "mutableCopy");

  if (v41[5])
  {
    objc_msgSend(v6, "finalTokenUnanalyzed");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "integerForKey:", CFSTR("com.apple.EmojiFoundation.maxResults"));

      v34 = 0;
      v35 = &v34;
      if (v11)
        v12 = v11;
      else
        v12 = 300;
      v36 = 0x3032000000;
      v37 = __Block_byref_object_copy_;
      v38 = __Block_byref_object_dispose_;
      v39 = (id)objc_msgSend(v6, "copy");
      objc_msgSend((id)v35[5], "reset");
      v32[0] = 0;
      v32[1] = v32;
      v32[2] = 0x3032000000;
      v32[3] = __Block_byref_object_copy_;
      v32[4] = __Block_byref_object_dispose_;
      v33 = 0;
      v26 = 0;
      v27 = &v26;
      v28 = 0x3032000000;
      v29 = __Block_byref_object_copy_;
      v30 = __Block_byref_object_dispose_;
      v31 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E10]), "initWithCapacity:", v12);
      v24[0] = 0;
      v24[1] = v24;
      v24[2] = 0x3032000000;
      v24[3] = __Block_byref_object_copy_;
      v24[4] = __Block_byref_object_dispose_;
      v25 = -[EMFQuery initWithLocale:]([EMFQuery alloc], "initWithLocale:", self->_locale);
      v22[0] = 0;
      v22[1] = v22;
      v22[2] = 0x3032000000;
      v22[3] = __Block_byref_object_copy_;
      v22[4] = __Block_byref_object_dispose_;
      v13 = objc_alloc(MEMORY[0x1E0C99E20]);
      objc_msgSend(v6, "tokens");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "firstObject");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = (id)objc_msgSend(v13, "initWithObjects:", v15, 0);

      v20[0] = 0;
      v20[1] = v20;
      v20[2] = 0x3032000000;
      v20[3] = __Block_byref_object_copy_;
      v20[4] = __Block_byref_object_dispose_;
      v21 = v7;
      -[EMFEmojiSearchEngine autocompleteProvider](self, "autocompleteProvider");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __70__EMFEmojiSearchEngine__performAutocompletedQueryForQuery_usingIndex___block_invoke;
      v19[3] = &unk_1E66F9E88;
      v19[6] = v32;
      v19[7] = v22;
      v19[8] = &v40;
      v19[9] = v24;
      v19[4] = self;
      v19[5] = &v34;
      v19[10] = v20;
      v19[11] = &v26;
      v19[12] = v12;
      objc_msgSend(v16, "enumerateCandidatesMatchingPrefix:withEnumerationType:maxCandidates:usingBlock:", v9, 0, 20, v19);

      objc_msgSend((id)v27[5], "array");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      _Block_object_dispose(v20, 8);

      _Block_object_dispose(v22, 8);
      _Block_object_dispose(v24, 8);

      _Block_object_dispose(&v26, 8);
      _Block_object_dispose(v32, 8);

      _Block_object_dispose(&v34, 8);
    }
    else
    {
      v17 = (void *)MEMORY[0x1E0C9AA60];
    }

  }
  else
  {
    v17 = (void *)MEMORY[0x1E0C9AA60];
  }
  _Block_object_dispose(&v40, 8);

  return v17;
}

void __70__EMFEmojiSearchEngine__performAutocompletedQueryForQuery_usingIndex___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  void *v15;
  id v16;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setQueryString:", a2);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "tokens");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40)
    && (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "containsObject:") & 1) == 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "removeLastObject");
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "addObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "setTokens:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
    objc_msgSend(*(id *)(a1 + 32), "performQuery:usingIndex:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40));
    v16 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "emojiStringMatchesUsingEmojiLocaleData:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");
    v12 = *(_QWORD *)(a1 + 96);
    v13 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), "count");
    if (v11 >= v12 - v13)
      v14 = v12 - v13;
    else
      v14 = v11;
    objc_msgSend(v10, "subarrayWithRange:", 0, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), "addObjectsFromArray:", v15);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "addObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
    if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), "count") == *(_QWORD *)(a1 + 96))
      *a4 = 1;

  }
}

- (NSLocale)locale
{
  return self->_locale;
}

- (EMFIndexManager)indexManager
{
  return self->_indexManager;
}

- (EMFStringStemmer)stringStemmer
{
  return self->_stringStemmer;
}

- (EMFQueryResultOverrideList)overrideList
{
  return self->_overrideList;
}

- (BOOL)enableAutocomplete
{
  return self->_enableAutocomplete;
}

- (void)setEnableAutocomplete:(BOOL)a3
{
  self->_enableAutocomplete = a3;
}

- (EMFAutocompleteCandidateProvider)autocompleteProvider
{
  return self->_autocompleteProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_autocompleteProvider, 0);
  objc_storeStrong((id *)&self->_overrideList, 0);
  objc_storeStrong((id *)&self->_stringStemmer, 0);
  objc_storeStrong((id *)&self->_indexManager, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_queryLogger, 0);
}

@end
