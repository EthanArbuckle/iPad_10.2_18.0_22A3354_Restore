@implementation URLCompletionProvider

- (URLCompletionProvider)initWithBookmarkProvider:(id)a3 cloudTabStore:(id)a4 profileIdentifier:(id)a5 maxResults:(unint64_t)a6 searchableCollectionsMask:(int)a7
{
  uint64_t v7;
  id v13;
  id v14;
  id v15;
  URLCompletionProvider *v16;
  URLCompletionProvider *v17;
  URLCompletionDatabase *v18;
  URLCompletionDatabase *completionDatabase;
  id v20;
  dispatch_queue_t v21;
  OS_dispatch_queue *completionQueue;
  id v23;
  dispatch_queue_t v24;
  OS_dispatch_queue *cfCompletionQueue;
  void *v26;
  void *v27;
  URLCompletionProvider *v28;
  objc_super v30;

  v7 = *(_QWORD *)&a7;
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v30.receiver = self;
  v30.super_class = (Class)URLCompletionProvider;
  v16 = -[CompletionProvider init](&v30, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_bookmarkProvider, a3);
    v17->_maxResults = a6;
    pthread_mutex_init(&v17->_prefixMutex, 0);
    v17->_urlCompletionBackgroundTaskIdentifier = *MEMORY[0x1E0DC4878];
    v18 = -[URLCompletionDatabase initWithCloudTabStore:profileIdentifier:searchableCollectionsMask:bookmarkProvider:]([URLCompletionDatabase alloc], "initWithCloudTabStore:profileIdentifier:searchableCollectionsMask:bookmarkProvider:", v14, v15, v7, v13);
    completionDatabase = v17->_completionDatabase;
    v17->_completionDatabase = v18;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.mobilesafari.URLCompletionProvider.%p"), v17);
    v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v21 = dispatch_queue_create((const char *)objc_msgSend(v20, "UTF8String"), 0);
    completionQueue = v17->_completionQueue;
    v17->_completionQueue = (OS_dispatch_queue *)v21;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.mobilesafari.URLCompletionProvider.cf.%p"), v17);
    v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v24 = dispatch_queue_create((const char *)objc_msgSend(v23, "UTF8String"), 0);
    cfCompletionQueue = v17->_cfCompletionQueue;
    v17->_cfCompletionQueue = (OS_dispatch_queue *)v24;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    +[History sharedHistory](History, "sharedHistory");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "addObserver:selector:name:object:", v17, sel__historyDidChange_, *MEMORY[0x1E0D8B100], v27);
    objc_msgSend(v26, "addObserver:selector:name:object:", v17, sel__historyDidChange_, *MEMORY[0x1E0D8B0F8], v27);
    objc_msgSend(v26, "addObserver:selector:name:object:", v17, sel__historyDidChange_, *MEMORY[0x1E0D8B0E0], v27);
    objc_msgSend(v26, "addObserver:selector:name:object:", v17, sel__historyDidChange_, *MEMORY[0x1E0D8B0E8], v27);
    objc_msgSend(v26, "addObserver:selector:name:object:", v17, sel__bookmarksDidChange_, *MEMORY[0x1E0DCCC10], 0);
    objc_msgSend(v26, "addObserver:selector:name:object:", v17, sel__bookmarksDidChange_, *MEMORY[0x1E0DCCC00], 0);
    objc_msgSend(v26, "addObserver:selector:name:object:", v17, sel__bookmarksDidChange_, *MEMORY[0x1E0DCCC48], 0);
    objc_msgSend(v26, "addObserver:selector:name:object:", v17, sel__applicationDidEnterBackground_, *MEMORY[0x1E0DC4768], 0);
    v28 = v17;

  }
  return v17;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  pthread_mutex_destroy(&self->_prefixMutex);
  if (self->_urlCompletionBackgroundTaskIdentifier != *MEMORY[0x1E0DC4878])
    -[URLCompletionProvider _endURLCompletionBackgroundTask](self, "_endURLCompletionBackgroundTask");
  v4.receiver = self;
  v4.super_class = (Class)URLCompletionProvider;
  -[URLCompletionProvider dealloc](&v4, sel_dealloc);
}

- (void)_historyDidChange:(id)a3
{
  self->_historyWasModified = 1;
}

- (void)_bookmarksDidChange:(id)a3
{
  self->_bookmarksWereModified = 1;
  -[URLCompletionDatabase clearBookmarksCache](self->_completionDatabase, "clearBookmarksCache", a3);
}

- (id)_doUpdateForPrefix:(id)a3 filterResultsUsingProfileIdentifier:(id)a4 withSearchParameters:(id)a5
{
  id v8;
  id v9;
  id v10;
  _BOOL4 providesTopHits;
  id *v12;
  URLCompletionDatabase *completionDatabase;
  id v14;
  id v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  id v34;
  id v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (self->_bookmarksWereModified)
  {
    -[WBSURLCompletionDatabase clearBookmarkMatchesCachesKeepingEmptyValues:](self->_completionDatabase, "clearBookmarkMatchesCachesKeepingEmptyValues:", 0);
    self->_bookmarksWereModified = 0;
  }
  if (self->_historyWasModified)
  {
    self->_historyWasModified = 0;
    -[WBSURLCompletionDatabase clearMatchesCaches](self->_completionDatabase, "clearMatchesCaches");
  }
  else
  {
    -[WBSURLCompletionDatabase clearBookmarkMatchesCachesKeepingEmptyValues:](self->_completionDatabase, "clearBookmarkMatchesCachesKeepingEmptyValues:", 1);
  }
  providesTopHits = self->_providesTopHits;
  if (self->_providesTopHits)
    v12 = &v35;
  else
    v12 = 0;
  if (self->_providesTopHits)
    v35 = 0;
  completionDatabase = self->_completionDatabase;
  v34 = 0;
  -[WBSURLCompletionDatabase getBestMatchesForTypedString:filterResultsUsingProfileIdentifier:topHits:matches:limit:forQueryID:withSearchParameters:](completionDatabase, "getBestMatchesForTypedString:filterResultsUsingProfileIdentifier:topHits:matches:limit:forQueryID:withSearchParameters:", v8, v9, v12, &v34, self->_maxResults, -[WBSCompletionQuery queryID](self->_query, "queryID"), v10);
  if (providesTopHits)
    v14 = v35;
  else
    v14 = 0;
  v15 = v34;
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v14, "count") + objc_msgSend(v15, "count"));
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v17 = v14;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v30, v37, 16);
  if (v18)
  {
    v19 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v31 != v19)
          objc_enumerationMutation(v17);
        objc_msgSend(v16, "addObject:", *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i));
      }
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v30, v37, 16);
    }
    while (v18);
  }

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v21 = v15;
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v26, v36, 16);
  if (v22)
  {
    v23 = *(_QWORD *)v27;
    do
    {
      for (j = 0; j != v22; ++j)
      {
        if (*(_QWORD *)v27 != v23)
          objc_enumerationMutation(v21);
        objc_msgSend(v16, "addObject:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * j));
      }
      v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v26, v36, 16);
    }
    while (v22);
  }

  return v16;
}

- (unint64_t)maximumCachedCompletionCount
{
  if (-[NSArray count](self->_searchParametersList, "count"))
    return 8 * -[NSArray count](self->_searchParametersList, "count");
  else
    return 8;
}

- (id)completionsForQuery:(id)a3 isCFSearch:(BOOL)a4
{
  _BOOL8 v4;
  id v7;
  void *v8;
  objc_super v10;

  v4 = a4;
  v7 = a3;
  objc_storeStrong((id *)&self->_query, a3);
  v10.receiver = self;
  v10.super_class = (Class)URLCompletionProvider;
  -[CompletionProvider completionsForQuery:isCFSearch:](&v10, sel_completionsForQuery_isCFSearch_, v7, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)findCompletionsForKey:(id)a3 isCFSearch:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  void *v12;
  BOOL v13;
  void *v14;
  void *v15;
  id v16;
  objc_super v18;
  objc_super v19;

  v4 = a4;
  v6 = a3;
  -[URLCompletionProvider getKeyForQueryString:isCFSearch:](self, "getKeyForQueryString:isCFSearch:", v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19.receiver = self;
  v19.super_class = (Class)URLCompletionProvider;
  -[CompletionProvider findCompletionsForKey:isCFSearch:](&v19, sel_findCompletionsForKey_isCFSearch_, v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray firstObject](self->_searchParametersList, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isCFSearch");

  if (v10)
  {
    -[URLCompletionProvider getKeyForQueryString:isCFSearch:](self, "getKeyForQueryString:isCFSearch:", v6, 1);
    v11 = objc_claimAutoreleasedReturnValue();

    v18.receiver = self;
    v18.super_class = (Class)URLCompletionProvider;
    -[CompletionProvider findCompletionsForKey:isCFSearch:](&v18, sel_findCompletionsForKey_isCFSearch_, v11, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)v11;
  }
  else
  {
    v12 = 0;
  }
  if (v12)
    v13 = v8 == 0;
  else
    v13 = 1;
  if (v13)
    v14 = 0;
  else
    v14 = v12;
  if (v4)
    v15 = v14;
  else
    v15 = v8;
  v16 = v15;

  return v16;
}

- (void)clearCachedCompletions
{
  NSString *currentPrefix;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)URLCompletionProvider;
  -[CompletionProvider clearCachedCompletions](&v4, sel_clearCachedCompletions);
  currentPrefix = self->_currentPrefix;
  self->_currentPrefix = 0;

}

- (void)setQueryToComplete:(id)a3
{
  id v4;
  _opaque_pthread_mutex_t *p_prefixMutex;
  NSString *currentPrefix;
  void *v7;
  WBSCompletionQuery *v8;
  void *v9;
  NSString *v10;
  NSString *v11;
  NSArray *v12;
  NSObject *completionQueue;
  NSArray *v14;
  WBSCompletionQuery *v15;
  _QWORD v16[5];
  id v17;
  WBSCompletionQuery *v18;
  NSArray *v19;

  v4 = a3;
  p_prefixMutex = &self->_prefixMutex;
  pthread_mutex_lock(&self->_prefixMutex);
  currentPrefix = self->_currentPrefix;
  objc_msgSend(v4, "queryString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(currentPrefix) = -[NSString isEqualToString:](currentPrefix, "isEqualToString:", v7);

  if ((currentPrefix & 1) == 0)
  {
    v8 = self->_query;
    objc_msgSend(v4, "queryString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (NSString *)objc_msgSend(v9, "copy");
    v11 = self->_currentPrefix;
    self->_currentPrefix = v10;

    self->_needScheduleBackgroundTaskOnAppSuspend = 1;
    v12 = self->_searchParametersList;
    completionQueue = self->_completionQueue;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __44__URLCompletionProvider_setQueryToComplete___block_invoke;
    v16[3] = &unk_1E9CF32B8;
    v16[4] = self;
    v17 = v4;
    v18 = v8;
    v19 = v12;
    v14 = v12;
    v15 = v8;
    dispatch_async(completionQueue, v16);

  }
  pthread_mutex_unlock(p_prefixMutex);

}

void __44__URLCompletionProvider_setQueryToComplete___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  double v24;
  dispatch_time_t v25;
  BOOL v26;
  uint64_t v27;
  id v28;
  _QWORD v29[5];
  id v30;
  id v31;
  _QWORD *v32;
  uint64_t *v33;
  uint64_t v34;
  char v35;
  _QWORD block[5];
  id v37;
  id v38;
  id v39;
  _QWORD *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t (*v48)(uint64_t, uint64_t);
  void (*v49)(uint64_t);
  id v50;
  _QWORD v51[5];
  id v52;
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1D82A1AF4]();
  pthread_mutex_lock((pthread_mutex_t *)(*(_QWORD *)(a1 + 32) + 72));
  v3 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "copy");
  pthread_mutex_unlock((pthread_mutex_t *)(*(_QWORD *)(a1 + 32) + 72));
  objc_msgSend(*(id *)(a1 + 40), "queryString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  if ((v5 & 1) != 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "feedbackDispatcher");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "didBeginSearchOfType:withQuery:endpoint:", 1, *(_QWORD *)(a1 + 48), 0);

    objc_msgSend(*(id *)(a1 + 56), "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isCFSearch");

    v51[0] = 0;
    v51[1] = v51;
    v51[2] = 0x3032000000;
    v51[3] = __Block_byref_object_copy__13;
    v51[4] = __Block_byref_object_dispose__13;
    v52 = 0;
    v45 = 0;
    v46 = &v45;
    v47 = 0x3032000000;
    v48 = __Block_byref_object_copy__13;
    v49 = __Block_byref_object_dispose__13;
    v50 = 0;
    v9 = objc_msgSend(*(id *)(a1 + 40), "triggerEvent");
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v10 = *(id *)(a1 + 56);
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v41, v53, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v42;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v42 != v12)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v41 + 1) + 8 * v13++), "setIsForVoiceSearch:", v9 == 4);
        }
        while (v11 != v13);
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v41, v53, 16);
      }
      while (v11);
    }

    v14 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 48), "profileIdentifierToFilterResults");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 56), "lastObject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "_doUpdateForPrefix:filterResultsUsingProfileIdentifier:withSearchParameters:", v3, v15, v16);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)v46[5];
    v46[5] = v17;

    v19 = MEMORY[0x1E0C809B0];
    if (v8)
    {
      v20 = dispatch_group_create();
      v21 = *(_QWORD *)(a1 + 32);
      v22 = *(NSObject **)(v21 + 160);
      block[0] = v19;
      block[1] = 3221225472;
      block[2] = __44__URLCompletionProvider_setQueryToComplete___block_invoke_188;
      block[3] = &unk_1E9CF9CA8;
      v40 = v51;
      block[4] = v21;
      v37 = v3;
      v38 = *(id *)(a1 + 48);
      v39 = *(id *)(a1 + 56);
      dispatch_group_async(v20, v22, block);
      objc_msgSend(*(id *)(a1 + 56), "firstObject");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "CFSearchTimeout");
      v25 = dispatch_time(0, (uint64_t)(v24 * 1000000000.0));
      v26 = dispatch_group_wait(v20, v25) == 0;

      if (v26)
      {
        v27 = 0;
      }
      else
      {
        *(_BYTE *)(*(_QWORD *)(a1 + 32) + 65) = 1;
        *(_BYTE *)(*(_QWORD *)(a1 + 32) + 64) = 1;
        v27 = 2;
      }

    }
    else
    {
      v27 = 0;
    }
    v29[0] = v19;
    v29[1] = 3221225472;
    v29[2] = __44__URLCompletionProvider_setQueryToComplete___block_invoke_2;
    v29[3] = &unk_1E9CF9CD0;
    v29[4] = *(_QWORD *)(a1 + 32);
    v28 = *(id *)(a1 + 48);
    v35 = v8;
    v34 = v27;
    v30 = v28;
    v32 = v51;
    v31 = v3;
    v33 = &v45;
    dispatch_async(MEMORY[0x1E0C80D38], v29);

    _Block_object_dispose(&v45, 8);
    _Block_object_dispose(v51, 8);

  }
  objc_autoreleasePoolPop(v2);
}

void __44__URLCompletionProvider_setQueryToComplete___block_invoke_188(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "profileIdentifierToFilterResults");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 56), "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_doUpdateForPrefix:filterResultsUsingProfileIdentifier:withSearchParameters:", v3, v8, v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

uint64_t __44__URLCompletionProvider_setQueryToComplete___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "feedbackDispatcher");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "didReceiveLocalResultsForQuery:", *(_QWORD *)(a1 + 40));

  if (*(_BYTE *)(a1 + 80))
  {
    v3 = *(void **)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 72);
    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 72));
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      v9[0] = v2;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    }
    objc_msgSend(v3, "setCompletions:forString:isCFSearch:", v5, *(_QWORD *)(a1 + 48), 1);
    if (v4)
    {

    }
  }
  v7 = *(void **)(a1 + 32);
  v6 = a1 + 32;
  objc_msgSend(v7, "setCompletions:forString:isCFSearch:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v6 + 32) + 8) + 40), *(_QWORD *)(v6 + 16), 0);
  return objc_msgSend(*(id *)v6, "_endURLCompletionBackgroundTask");
}

- (void)_applicationDidEnterBackground:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[5];

  v4 = a3;
  if (self->_needScheduleBackgroundTaskOnAppSuspend
    && self->_urlCompletionBackgroundTaskIdentifier == *MEMORY[0x1E0DC4878])
  {
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __56__URLCompletionProvider__applicationDidEnterBackground___block_invoke;
    v6[3] = &unk_1E9CF31B0;
    v6[4] = self;
    self->_urlCompletionBackgroundTaskIdentifier = objc_msgSend(v5, "beginBackgroundTaskWithName:expirationHandler:", CFSTR("com.apple.mobilesafari.URLCompletionTask"), v6);

  }
}

uint64_t __56__URLCompletionProvider__applicationDidEnterBackground___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_endURLCompletionBackgroundTask");
}

- (void)_endURLCompletionBackgroundTask
{
  unint64_t v2;
  void *v4;

  self->_needScheduleBackgroundTaskOnAppSuspend = 0;
  v2 = *MEMORY[0x1E0DC4878];
  if (self->_urlCompletionBackgroundTaskIdentifier != *MEMORY[0x1E0DC4878])
  {
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "endBackgroundTask:", self->_urlCompletionBackgroundTaskIdentifier);

    self->_urlCompletionBackgroundTaskIdentifier = v2;
  }
}

- (id)getKeyForQueryString:(id)a3 isCFSearch:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a4;
  v6 = a3;
  -[NSArray firstObject](self->_searchParametersList, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isCFSearch");

  if ((v8 & 1) != 0)
  {
    v9 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("%lu-%@"), objc_msgSend(v10, "integerValue"), v6);
    v11 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = v6;
  }

  return v11;
}

- (unint64_t)cfErrorForQuery:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  unint64_t v8;

  objc_msgSend(a3, "queryString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[URLCompletionProvider findCompletionsForKey:isCFSearch:](self, "findCompletionsForKey:isCFSearch:", v4, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "count") == 1)
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqual:", &unk_1E9D622C0);

    if (v7)
      v8 = 2;
    else
      v8 = 0;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)providesTopHits
{
  return self->_providesTopHits;
}

- (void)setProvidesTopHits:(BOOL)a3
{
  self->_providesTopHits = a3;
}

- (WBSParsecSearchSession)parsecSearchSession
{
  return self->_parsecSearchSession;
}

- (void)setParsecSearchSession:(id)a3
{
  objc_storeStrong((id *)&self->_parsecSearchSession, a3);
}

- (NSArray)searchParametersList
{
  return self->_searchParametersList;
}

- (void)setSearchParametersList:(id)a3
{
  objc_storeStrong((id *)&self->_searchParametersList, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchParametersList, 0);
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_parsecSearchSession, 0);
  objc_storeStrong((id *)&self->_cfCompletionQueue, 0);
  objc_storeStrong((id *)&self->_completionQueue, 0);
  objc_storeStrong((id *)&self->_completionDatabase, 0);
  objc_storeStrong((id *)&self->_currentPrefix, 0);
  objc_storeStrong((id *)&self->_bookmarkProvider, 0);
}

@end
