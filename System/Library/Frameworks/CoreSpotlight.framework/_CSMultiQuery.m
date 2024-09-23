@implementation _CSMultiQuery

+ (void)initialize
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  dispatch_queue_t v6;
  void *v7;

  objc_opt_self();
  v3 = (id)objc_claimAutoreleasedReturnValue();

  if (v3 == a1)
  {
    dispatch_queue_attr_make_initially_inactive(MEMORY[0x1E0C80D50]);
    v4 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_autorelease_frequency(v4, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = dispatch_queue_create("multiquery shared queue", v5);
    v7 = (void *)sTargetQueue;
    sTargetQueue = (uint64_t)v6;

    dispatch_queue_set_width();
    dispatch_activate((dispatch_object_t)sTargetQueue);
  }
}

- (_CSMultiQuery)initWithSimpleQueries:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;
  _CSMultiQuery *v9;
  dispatch_group_t v10;
  OS_dispatch_group *group;
  uint64_t v12;
  NSMutableArray *simpleQueryTokens;
  uint64_t v14;
  NSMutableArray *results;
  dispatch_queue_t v16;
  OS_dispatch_queue *queue;
  uint64_t v18;
  id completionHandler;
  unint64_t v20;
  _CSMultiQueryCountResult *v21;
  objc_super v23;

  v7 = a3;
  v8 = a4;
  v23.receiver = self;
  v23.super_class = (Class)_CSMultiQuery;
  v9 = -[_CSMultiQuery init](&v23, sel_init);
  if (v9)
  {
    v10 = dispatch_group_create();
    group = v9->_group;
    v9->_group = (OS_dispatch_group *)v10;

    objc_storeStrong((id *)&v9->_queries, a3);
    v9->_simple = 1;
    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v7, "count"));
    simpleQueryTokens = v9->_simpleQueryTokens;
    v9->_simpleQueryTokens = (NSMutableArray *)v12;

    v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v7, "count"));
    results = v9->_results;
    v9->_results = (NSMutableArray *)v14;

    v16 = dispatch_queue_create_with_target_V2("multiquery instance queue", 0, (dispatch_queue_t)sTargetQueue);
    queue = v9->_queue;
    v9->_queue = (OS_dispatch_queue *)v16;

    v18 = objc_msgSend(v8, "copy");
    completionHandler = v9->_completionHandler;
    v9->_completionHandler = (id)v18;

    if (objc_msgSend(v7, "count"))
    {
      v20 = 0;
      do
      {
        v21 = objc_alloc_init(_CSMultiQueryCountResult);
        -[NSMutableArray setObject:atIndexedSubscript:](v9->_results, "setObject:atIndexedSubscript:", v21, v20);

        ++v20;
      }
      while (objc_msgSend(v7, "count") > v20);
    }
  }

  return v9;
}

- (_CSMultiQuery)initWithQueries:(id)a3 completionHandler:(id)a4
{
  _CSMultiQuery *v7;
  dispatch_group_t v8;
  OS_dispatch_group *group;
  uint64_t v10;
  NSMutableArray *results;
  dispatch_queue_t v12;
  OS_dispatch_queue *queue;
  uint64_t v14;
  id completionHandler;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  _CSMultiQueryCountResult *v21;
  id v23;
  id v24;
  id obj;
  _QWORD v26[4];
  _CSMultiQuery *v27;
  id v28[2];
  id location;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  objc_super v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v24 = a3;
  v23 = a4;
  v34.receiver = self;
  v34.super_class = (Class)_CSMultiQuery;
  v7 = -[_CSMultiQuery init](&v34, sel_init);
  if (v7)
  {
    v8 = dispatch_group_create();
    group = v7->_group;
    v7->_group = (OS_dispatch_group *)v8;

    objc_storeStrong((id *)&v7->_queries, a3);
    v7->_simple = 0;
    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v24, "count"));
    results = v7->_results;
    v7->_results = (NSMutableArray *)v10;

    v12 = dispatch_queue_create_with_target_V2("multiquery instance queue", 0, (dispatch_queue_t)sTargetQueue);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v12;

    v14 = objc_msgSend(v23, "copy");
    completionHandler = v7->_completionHandler;
    v7->_completionHandler = (id)v14;

    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    obj = v24;
    v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    if (v16)
    {
      v17 = 0;
      v18 = *(_QWORD *)v31;
      do
      {
        v19 = 0;
        do
        {
          if (*(_QWORD *)v31 != v18)
            objc_enumerationMutation(obj);
          v20 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v19);
          v21 = objc_alloc_init(_CSMultiQueryCountResult);
          -[NSMutableArray setObject:atIndexedSubscript:](v7->_results, "setObject:atIndexedSubscript:", v21, v17 + v19);

          location = 0;
          objc_initWeak(&location, v20);
          v26[0] = MEMORY[0x1E0C809B0];
          v26[1] = 3221225472;
          v26[2] = __51___CSMultiQuery_initWithQueries_completionHandler___block_invoke;
          v26[3] = &unk_1E24050E0;
          objc_copyWeak(v28, &location);
          v27 = v7;
          v28[1] = (id)(v17 + v19);
          objc_msgSend(v20, "setCompletionHandler:", v26);

          objc_destroyWeak(v28);
          objc_destroyWeak(&location);
          ++v19;
        }
        while (v16 != v19);
        v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
        v17 += v19;
      }
      while (v16);
    }

  }
  return v7;
}

- (void)start
{
  NSObject *v3;
  os_signpost_id_t v4;
  NSObject *v5;
  NSObject *v6;
  NSUInteger v7;
  unint64_t v8;
  void *v9;
  NSObject *group;
  NSObject *queue;
  NSObject *v12;
  _QWORD block[4];
  NSObject *v14;
  _CSMultiQuery *v15;
  os_signpost_id_t v16;
  uint8_t buf[4];
  NSUInteger v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  self->_started = 1;
  logForCSLogCategoryQuery();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_signpost_id_make_with_pointer(v3, self);
  v5 = v3;
  v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    v7 = -[NSArray count](self->_queries, "count");
    *(_DWORD *)buf = 134217984;
    v18 = v7;
    _os_signpost_emit_with_name_impl(&dword_18C42F000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "CSMultiQuery", "start with %lu counting queries", buf, 0xCu);
  }

  if (-[NSArray count](self->_queries, "count"))
  {
    v8 = 0;
    do
    {
      dispatch_group_enter((dispatch_group_t)self->_group);
      if (self->_simple)
      {
        -[_CSMultiQuery startSimpleQueryAtIndex:](self, "startSimpleQueryAtIndex:", v8);
      }
      else
      {
        -[NSArray objectAtIndexedSubscript:](self->_queries, "objectAtIndexedSubscript:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "start");

      }
      ++v8;
    }
    while (v8 < -[NSArray count](self->_queries, "count"));
  }
  group = self->_group;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __22___CSMultiQuery_start__block_invoke;
  block[3] = &unk_1E2405108;
  v15 = self;
  v16 = v4;
  v14 = v6;
  v12 = v6;
  dispatch_group_notify(group, queue, block);

}

- (void)startSimpleQueryAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t HasResultsForQuery;
  void *v13;
  _QWORD v14[6];

  -[NSArray objectAtIndexedSubscript:](self->_queries, "objectAtIndexedSubscript:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __41___CSMultiQuery_startSimpleQueryAtIndex___block_invoke;
  v14[3] = &unk_1E2405130;
  v14[4] = self;
  v14[5] = a3;
  v6 = _Block_copy(v14);
  objc_msgSend(v5, "queryString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bundleIDs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "protectionClasses");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "keyboardLanguage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredLanguages");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  HasResultsForQuery = CSSimpleQueryHasResultsForQuery(v7, v8, v9, v10, v11, 0, v6);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", HasResultsForQuery);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray setObject:atIndexedSubscript:](self->_simpleQueryTokens, "setObject:atIndexedSubscript:", v13, a3);

}

- (void)cancel
{
  uint64_t v3;
  unint64_t v4;
  void *v5;
  uint64_t v6;

  if (self->_started)
  {
    v3 = 40;
    if (!self->_simple)
      v3 = 48;
    if (objc_msgSend(*(id *)((char *)&self->super.isa + v3), "count"))
    {
      v4 = 0;
      do
      {
        if (self->_simple)
        {
          -[NSMutableArray objectAtIndexedSubscript:](self->_simpleQueryTokens, "objectAtIndexedSubscript:", v4);
          v5 = (void *)objc_claimAutoreleasedReturnValue();
          CSSimpleQueryCancel(objc_msgSend(v5, "unsignedLongLongValue"));
        }
        else
        {
          -[NSArray objectAtIndexedSubscript:](self->_queries, "objectAtIndexedSubscript:", v4);
          v5 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "cancel");
        }

        ++v4;
        if (self->_simple)
          v6 = 40;
        else
          v6 = 48;
      }
      while (v4 < objc_msgSend(*(id *)((char *)&self->super.isa + v6), "count"));
    }
  }
}

+ (id)countingQueryWithStrings:(id)a3 contexts:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  CSSearchQuery *v16;
  CSSearchQuery *v17;
  _CSMultiQuery *v18;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v11 = objc_msgSend(v7, "count");
  if (v11 != objc_msgSend(v8, "count"))
  {
LABEL_8:
    v18 = 0;
    goto LABEL_9;
  }
  if (objc_msgSend(v8, "count"))
  {
    v12 = 0;
    while (1)
    {
      objc_msgSend(v8, "objectAtIndex:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectAtIndex:", v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)objc_msgSend(v13, "copy");
      objc_msgSend(v15, "setCounting:", 1);
      objc_msgSend(v15, "setFetchAttributes:", 0);
      objc_msgSend(v15, "setCompletionAttributes:", 0);
      objc_msgSend(v15, "setCompletionWeights:", 0);
      objc_msgSend(v15, "setCompletionResultCount:", 0);
      objc_msgSend(v15, "setMaxSuggestionCount:", 0);
      v16 = -[CSSearchQuery initWithQueryString:context:]([CSSearchQuery alloc], "initWithQueryString:context:", v14, v15);
      if (!v16)
        break;
      v17 = v16;
      objc_msgSend(v10, "addObject:", v16);

      if (++v12 >= (unint64_t)objc_msgSend(v8, "count"))
        goto LABEL_6;
    }

    goto LABEL_8;
  }
LABEL_6:
  v18 = -[_CSMultiQuery initWithQueries:completionHandler:]([_CSMultiQuery alloc], "initWithQueries:completionHandler:", v10, v9);
LABEL_9:

  return v18;
}

+ (id)countingQueryWithStrings:(id)a3 context:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  CSSearchQuery *v17;
  CSSearchQuery *v18;
  _CSMultiQuery *v19;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (objc_msgSend(v7, "count"))
  {
    v21 = v9;
    v11 = (void *)objc_msgSend(v8, "copy");
    objc_msgSend(v11, "setCounting:", 1);
    objc_msgSend(v11, "setFetchAttributes:", 0);
    objc_msgSend(v11, "setCompletionAttributes:", 0);
    objc_msgSend(v11, "setCompletionWeights:", 0);
    objc_msgSend(v11, "setCompletionResultCount:", 0);
    objc_msgSend(v11, "setMaxSuggestionCount:", 0);
    objc_msgSend(v11, "setCompletionOptions:", 0);
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v12 = v7;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v23;
      while (2)
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v23 != v15)
            objc_enumerationMutation(v12);
          v17 = -[CSSearchQuery initWithQueryString:context:]([CSSearchQuery alloc], "initWithQueryString:context:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v16), v11);
          if (!v17)
          {

            v19 = 0;
            v9 = v21;
            goto LABEL_12;
          }
          v18 = v17;
          objc_msgSend(v10, "addObject:", v17);

          ++v16;
        }
        while (v14 != v16);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
        if (v14)
          continue;
        break;
      }
    }

    v9 = v21;
    v19 = -[_CSMultiQuery initWithQueries:completionHandler:]([_CSMultiQuery alloc], "initWithQueries:completionHandler:", v10, v21);
LABEL_12:

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

+ (id)countingQueryWithSuggestions:(id)a3 context:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  CSSearchQueryContext *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  CSSearchQuery *v21;
  void *v22;
  CSSearchQuery *v23;
  _CSMultiQuery *v24;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v26 = a5;
  v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v10 = v7;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v28;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v28 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v14);
        v16 = objc_alloc_init(CSSearchQueryContext);
        -[CSSearchQueryContext setCounting:](v16, "setCounting:", 1);
        objc_msgSend(v8, "bundleIDs");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[CSSearchQueryContext setBundleIDs:](v16, "setBundleIDs:", v17);

        objc_msgSend(v8, "protectionClasses");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[CSSearchQueryContext setProtectionClasses:](v16, "setProtectionClasses:", v18);

        objc_msgSend(v8, "filterQueries");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[CSSearchQueryContext setFilterQueries:](v16, "setFilterQueries:", v19);

        objc_msgSend(v8, "keyboardLanguage");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[CSSearchQueryContext setKeyboardLanguage:](v16, "setKeyboardLanguage:", v20);

        v21 = [CSSearchQuery alloc];
        objc_msgSend(v15, "queryString");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = -[CSSearchQuery initWithQueryString:queryContext:](v21, "initWithQueryString:queryContext:", v22, v16);

        objc_msgSend(v9, "addObject:", v23);
        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v12);
  }

  v24 = -[_CSMultiQuery initWithQueries:completionHandler:]([_CSMultiQuery alloc], "initWithQueries:completionHandler:", v9, v26);
  return v24;
}

+ (id)countingQueryForEmailsArrays:(id)a3 scope:(unint64_t)a4 context:(id)a5 contextualFilterQueries:(id)a6 includeSecondaryRecipients:(BOOL)a7 completionHandler:(id)a8
{
  _BOOL8 v9;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  CSSearchQueryContext *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  CSSearchQuery *v27;
  _CSMultiQuery *v28;
  id v30;
  id obj;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v9 = a7;
  v38 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a5;
  v32 = a6;
  v30 = a8;
  v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  obj = v13;
  v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v34;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v34 != v18)
          objc_enumerationMutation(obj);
        v20 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * v19);
        v21 = objc_alloc_init(CSSearchQueryContext);
        objc_msgSend(v14, "bundleIDs");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[CSSearchQueryContext setBundleIDs:](v21, "setBundleIDs:", v22);

        objc_msgSend(v14, "protectionClasses");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[CSSearchQueryContext setProtectionClasses:](v21, "setProtectionClasses:", v23);

        objc_msgSend(v14, "keyboardLanguage");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[CSSearchQueryContext setKeyboardLanguage:](v21, "setKeyboardLanguage:", v24);

        objc_msgSend(v14, "preferredLanguages");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[CSSearchQueryContext setPreferredLanguages:](v21, "setPreferredLanguages:", v25);

        +[_CSContactSearchResult generateQueryStringForContact:filterQueries:includeSecondaryRecipients:inputScope:](_CSContactSearchResult, "generateQueryStringForContact:filterQueries:includeSecondaryRecipients:inputScope:", v20, v32, v9, a4);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = -[CSSearchQuery initWithQueryString:queryContext:]([CSSearchQuery alloc], "initWithQueryString:queryContext:", v26, v21);
        objc_msgSend(v15, "addObject:", v27);

        ++v19;
      }
      while (v17 != v19);
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    }
    while (v17);
  }

  v28 = -[_CSMultiQuery initWithSimpleQueries:completionHandler:]([_CSMultiQuery alloc], "initWithSimpleQueries:completionHandler:", v15, v30);
  return v28;
}

+ (id)countingQueryWithPeopleSuggestions:(id)a3 filterQuery:(id)a4 context:(id)a5 completionHandler:(id)a6
{
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  CSSearchQueryContext *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  CSSearchQuery *v26;
  void *v27;
  CSSearchQuery *v28;
  _CSMultiQuery *v29;
  id v31;
  id obj;
  id v33;
  id v34;
  _QWORD v35[4];
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v34 = a4;
  v10 = a5;
  v31 = a6;
  v33 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  obj = v9;
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v38;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v38 != v13)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * v14);
        v16 = objc_alloc_init(CSSearchQueryContext);
        -[CSSearchQueryContext setCounting:](v16, "setCounting:", 1);
        objc_msgSend(v10, "bundleIDs");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[CSSearchQueryContext setBundleIDs:](v16, "setBundleIDs:", v17);

        objc_msgSend(v10, "protectionClasses");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[CSSearchQueryContext setProtectionClasses:](v16, "setProtectionClasses:", v18);

        objc_msgSend(v10, "keyboardLanguage");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[CSSearchQueryContext setKeyboardLanguage:](v16, "setKeyboardLanguage:", v19);

        objc_msgSend(v15, "currentToken");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "itemSummary");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "emailAddresses");
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v35[0] = MEMORY[0x1E0C809B0];
        v35[1] = 3221225472;
        v35[2] = __90___CSMultiQuery_countingQueryWithPeopleSuggestions_filterQuery_context_completionHandler___block_invoke;
        v35[3] = &unk_1E2405158;
        v36 = v23;
        v24 = v23;
        objc_msgSend(v22, "enumerateObjectsUsingBlock:", v35);
        objc_msgSend(v24, "componentsJoinedByString:", CFSTR(","));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = [CSSearchQuery alloc];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("((%@) && (FieldMatch(kMDItemRecipientEmailAddresses, %@)) && !(FieldMatch(kMDItemAuthorEmailAddresses, %@)))"), v34, v25, v25);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = -[CSSearchQuery initWithQueryString:queryContext:](v26, "initWithQueryString:queryContext:", v27, v16);

        objc_msgSend(v33, "addObject:", v28);
        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
    }
    while (v12);
  }

  v29 = -[_CSMultiQuery initWithQueries:completionHandler:]([_CSMultiQuery alloc], "initWithQueries:completionHandler:", v33, v31);
  return v29;
}

- (OS_dispatch_group)group
{
  return self->_group;
}

- (void)setGroup:(id)a3
{
  objc_storeStrong((id *)&self->_group, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_storeStrong(&self->_completionHandler, a3);
}

- (BOOL)simple
{
  return self->_simple;
}

- (void)setSimple:(BOOL)a3
{
  self->_simple = a3;
}

- (NSMutableArray)simpleQueryTokens
{
  return self->_simpleQueryTokens;
}

- (void)setSimpleQueryTokens:(id)a3
{
  objc_storeStrong((id *)&self->_simpleQueryTokens, a3);
}

- (NSArray)queries
{
  return self->_queries;
}

- (void)setQueries:(id)a3
{
  objc_storeStrong((id *)&self->_queries, a3);
}

- (NSMutableArray)results
{
  return self->_results;
}

- (void)setResults:(id)a3
{
  objc_storeStrong((id *)&self->_results, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_queries, 0);
  objc_storeStrong((id *)&self->_simpleQueryTokens, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_group, 0);
}

@end
