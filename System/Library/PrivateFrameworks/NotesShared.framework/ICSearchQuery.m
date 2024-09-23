@implementation ICSearchQuery

- (NSDictionary)queryResults
{
  void *v2;
  void *v3;
  void *v4;
  NSDictionary *v5;

  -[ICSearchQuery mutableQueryResults](self, "mutableQueryResults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");
  v4 = v3;
  if (!v3)
    v3 = (void *)MEMORY[0x1E0C9AA70];
  v5 = v3;

  return v5;
}

- (NSMutableDictionary)mutableQueryResults
{
  return self->_mutableQueryResults;
}

- (BOOL)run:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  dispatch_semaphore_t v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  BOOL v13;
  NSObject *v14;
  double v15;
  dispatch_time_t v16;
  intptr_t v17;
  NSObject *v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  int v22;
  void *v24;
  _QWORD v25[5];
  id v26;
  id location;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;

  -[ICSearchQuery searchQuery](self, "searchQuery");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    -[ICSearchQuery attributesToFetch](self, "attributesToFetch");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICSearchQuery setupWithAttributes:](self, "setupWithAttributes:", v6);

  }
  -[ICSearchQuery searchQuery](self, "searchQuery");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    -[ICSearchQuery cancel](self, "cancel");
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__41;
  v32 = __Block_byref_object_dispose__41;
  v33 = 0;
  v8 = dispatch_semaphore_create(0);
  -[ICSearchQuery setSynchronousSemaphore:](self, "setSynchronousSemaphore:", v8);

  objc_initWeak(&location, self);
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __21__ICSearchQuery_run___block_invoke;
  v25[3] = &unk_1E76CD710;
  objc_copyWeak(&v26, &location);
  v25[4] = &v28;
  -[ICSearchQuery searchQuery](self, "searchQuery");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setCompletionHandler:", v25);

  -[ICSearchQuery searchQuery](self, "searchQuery");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "start");

  -[ICSearchQuery synchronousSemaphore](self, "synchronousSemaphore");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
    goto LABEL_11;
  -[ICSearchQuery timeoutInterval](self, "timeoutInterval");
  v13 = v12 > 0.0;
  if (v12 <= 0.0)
  {
    -[ICSearchQuery synchronousSemaphore](self, "synchronousSemaphore");
    v19 = objc_claimAutoreleasedReturnValue();
    dispatch_semaphore_wait(v19, 0xFFFFFFFFFFFFFFFFLL);
    goto LABEL_13;
  }
  -[ICSearchQuery synchronousSemaphore](self, "synchronousSemaphore");
  v14 = objc_claimAutoreleasedReturnValue();
  -[ICSearchQuery timeoutInterval](self, "timeoutInterval");
  v16 = dispatch_time(0, (uint64_t)(v15 * 1000000000.0));
  v17 = dispatch_semaphore_wait(v14, v16);

  v18 = os_log_create("com.apple.notes", "SearchIndexer");
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    -[ICSearchQuery run:].cold.1();

  if (!v17)
  {
LABEL_11:
    v13 = 0;
    goto LABEL_14;
  }
  -[ICSearchQuery searchQuery](self, "searchQuery");
  v19 = objc_claimAutoreleasedReturnValue();
  -[NSObject cancel](v19, "cancel");
LABEL_13:

LABEL_14:
  if (-[ICSearchQuery wasForceStopped](self, "wasForceStopped"))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D63F58], 216, 0);
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = (void *)v29[5];
    v29[5] = v20;

  }
  if (a3)
    *a3 = objc_retainAutorelease((id)v29[5]);
  -[ICSearchQuery queryFinishedRunningWithError:](self, "queryFinishedRunningWithError:", v29[5]);
  if (v13 || v29[5] || -[ICSearchQuery wasForceStopped](self, "wasForceStopped"))
  {
    LOBYTE(v22) = 0;
  }
  else
  {
    -[ICSearchQuery searchQuery](self, "searchQuery");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v24, "isCancelled") ^ 1;

  }
  objc_destroyWeak(&v26);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v28, 8);

  return v22;
}

- (CSSearchQuery)searchQuery
{
  return self->_searchQuery;
}

- (BOOL)wasForceStopped
{
  return self->_wasForceStopped;
}

- (void)setSynchronousSemaphore:(id)a3
{
  objc_storeStrong((id *)&self->_synchronousSemaphore, a3);
}

void __21__ICSearchQuery_run___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  id WeakRetained;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;

  v4 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (objc_msgSend(WeakRetained, "wasForceStopped"))
  {
    v6 = os_log_create("com.apple.notes", "SearchIndexer");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      __21__ICSearchQuery_run___block_invoke_cold_1();

  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    if (v4)
    {
      v7 = os_log_create("com.apple.notes", "SearchIndexer");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        __21__ICSearchQuery_run___block_invoke_cold_2();

    }
    objc_msgSend(WeakRetained, "synchronousSemaphore");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(WeakRetained, "synchronousSemaphore");
      v9 = objc_claimAutoreleasedReturnValue();
      dispatch_semaphore_signal(v9);

      objc_msgSend(WeakRetained, "setSynchronousSemaphore:", 0);
    }
  }

}

- (OS_dispatch_semaphore)synchronousSemaphore
{
  return self->_synchronousSemaphore;
}

- (double)timeoutInterval
{
  return 0.0;
}

- (void)setupWithAttributes:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id location;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_initWeak(&location, self);
  v5 = -[ICSearchQuery newSearchQueryContext](self, "newSearchQueryContext");
  objc_msgSend(v5, "setFetchAttributes:", v4);
  -[ICSearchQuery rankingQueries](self, "rankingQueries");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRankingQueries:", v6);

  ICNotesAppBundleIdentifier();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBundleIDs:", v8);

  objc_msgSend(v5, "filterQueries");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "arrayByAddingObject:", CFSTR("_kMDItemUserActivityType != *"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFilterQueries:", v10);

  v17 = *MEMORY[0x1E0CB2AC0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v17, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setProtectionClasses:", v11);

  v12 = -[ICSearchQuery newSearchQueryWithContext:](self, "newSearchQueryWithContext:", v5);
  -[ICSearchQuery setSearchQuery:](self, "setSearchQuery:", v12);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __37__ICSearchQuery_setupWithAttributes___block_invoke;
  v14[3] = &unk_1E76CD760;
  objc_copyWeak(&v15, &location);
  -[ICSearchQuery searchQuery](self, "searchQuery");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setFoundItemsHandler:", v14);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

}

- (id)rankingQueries
{
  void *v3;
  void *v4;
  void *v5;

  -[ICSearchQuery rankingQueriesDefinition](self, "rankingQueriesDefinition");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[ICSearchQuery rankingQueriesDefinition](self, "rankingQueriesDefinition");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "rankingQueries");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[ICSearchQuery externalRankingQueries](self, "externalRankingQueries");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (ICRankingQueriesDefinition)rankingQueriesDefinition
{
  return self->_rankingQueriesDefinition;
}

- (NSArray)externalRankingQueries
{
  return self->_externalRankingQueries;
}

- (void)setSearchQuery:(id)a3
{
  objc_storeStrong((id *)&self->_searchQuery, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_externalRankingQueries, 0);
  objc_storeStrong((id *)&self->_mutableQueryResults, 0);
  objc_storeStrong((id *)&self->_searchQuery, 0);
  objc_storeStrong((id *)&self->_synchronousSemaphore, 0);
  objc_storeStrong((id *)&self->_rankingQueriesDefinition, 0);
}

- (ICSearchQuery)initWithExternalRankingQueries:(id)a3
{
  id v5;
  ICSearchQuery *v6;
  ICSearchQuery *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICSearchQuery;
  v6 = -[ICSearchQuery init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_externalRankingQueries, a3);

  return v7;
}

- (ICSearchQuery)initWithRankingQueriesDefinition:(id)a3
{
  id v5;
  ICSearchQuery *v6;
  ICSearchQuery *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICSearchQuery;
  v6 = -[ICSearchQuery init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_rankingQueriesDefinition, a3);

  return v7;
}

- (id)attributesToFetch
{
  return (id)objc_msgSend((id)objc_opt_class(), "defaultAttributesToReturnFromCoreSpotlight");
}

- (id)newSearchQueryContext
{
  return objc_alloc_init(MEMORY[0x1E0CA6B30]);
}

- (id)newSearchQueryWithContext:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;

  v3 = (objc_class *)MEMORY[0x1E0CA6B28];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithQueryString:queryContext:", &stru_1E76DB108, v4);

  return v5;
}

- (id)queryResultsToAddFromBatch:(id)a3
{
  return a3;
}

- (void)forceStop
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_2(&dword_1BD918000, v0, v1, "%@ Force Stopped", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)cancel
{
  void *v3;

  -[ICSearchQuery searchQuery](self, "searchQuery");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancel");

  -[ICSearchQuery forceStop](self, "forceStop");
}

void __37__ICSearchQuery_setupWithAttributes___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  _BOOL4 v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  int v12;
  void *v13;
  int v14;
  _QWORD v15[6];
  uint8_t v16[4];
  id v17;
  __int16 v18;
  int v19;
  __int16 v20;
  int v21;
  __int128 buf;
  uint64_t v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = os_log_create("com.apple.notes", "SearchIndexer");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    __37__ICSearchQuery_setupWithAttributes___block_invoke_cold_3((uint64_t)WeakRetained, v3, v5);

  if (objc_msgSend(WeakRetained, "wasForceStopped"))
  {
    v6 = os_log_create("com.apple.notes", "SearchIndexer");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      __37__ICSearchQuery_setupWithAttributes___block_invoke_cold_1();
  }
  else if (v3)
  {
    objc_msgSend(WeakRetained, "queryResultsToAddFromBatch:", v3);
    v6 = objc_claimAutoreleasedReturnValue();
    if (-[NSObject count](v6, "count"))
    {
      objc_msgSend(WeakRetained, "mutableQueryResults");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7 == 0;

      if (v8)
      {
        v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        objc_msgSend(WeakRetained, "setMutableQueryResults:", v9);

      }
      v10 = os_log_create("com.apple.notes", "SearchIndexer");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        __37__ICSearchQuery_setupWithAttributes___block_invoke_cold_2(WeakRetained, v3, v10);

      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v23 = 0x2020000000;
      v24 = 0;
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __37__ICSearchQuery_setupWithAttributes___block_invoke_14;
      v15[3] = &unk_1E76CD738;
      v15[4] = WeakRetained;
      v15[5] = &buf;
      objc_msgSend(v3, "enumerateObjectsUsingBlock:", v15);
      v11 = os_log_create("com.apple.notes", "SearchIndexer");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        v12 = *(_DWORD *)(*((_QWORD *)&buf + 1) + 24);
        objc_msgSend(WeakRetained, "mutableQueryResults");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "count");
        *(_DWORD *)v16 = 138412802;
        v17 = WeakRetained;
        v18 = 1024;
        v19 = v12;
        v20 = 1024;
        v21 = v14;
        _os_log_debug_impl(&dword_1BD918000, v11, OS_LOG_TYPE_DEBUG, "%@ added %d items to a total of %d items", v16, 0x18u);

      }
      _Block_object_dispose(&buf, 8);
    }
  }
  else
  {
    v6 = os_log_create("com.apple.notes", "SearchIndexer");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = WeakRetained;
      _os_log_impl(&dword_1BD918000, v6, OS_LOG_TYPE_INFO, "%@ no items returned in foundItemsHandler", (uint8_t *)&buf, 0xCu);
    }
  }

}

void __37__ICSearchQuery_setupWithAttributes___block_invoke_14(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  objc_msgSend(v8, "attributeSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ic_dataSourceIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("Modern"));
  if (!objc_msgSend(*(id *)(a1 + 32), "modernResultsOnly")
    || (objc_msgSend(*(id *)(a1 + 32), "modernResultsOnly") & v5) == 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "mutableQueryResults");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "uniqueIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", v8, v7);

    ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  }

}

+ (id)defaultAttributesToReturnFromCoreSpotlight
{
  uint64_t v2;
  uint64_t v3;
  _QWORD v5[7];

  v5[6] = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0CA6A88];
  v5[0] = *MEMORY[0x1E0D64110];
  v5[1] = v2;
  v5[2] = CFSTR("_ICItemSearchResultType");
  v5[3] = CFSTR("_ICItemRelatedNoteUniqueIdentifier");
  v3 = *MEMORY[0x1E0CA6198];
  v5[4] = *MEMORY[0x1E0CA60E0];
  v5[5] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 6);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setWasForceStopped:(BOOL)a3
{
  self->_wasForceStopped = a3;
}

- (BOOL)modernResultsOnly
{
  return self->_modernResultsOnly;
}

- (void)setRankingQueriesDefinition:(id)a3
{
  objc_storeStrong((id *)&self->_rankingQueriesDefinition, a3);
}

- (void)setMutableQueryResults:(id)a3
{
  objc_storeStrong((id *)&self->_mutableQueryResults, a3);
}

- (void)setExternalRankingQueries:(id)a3
{
  objc_storeStrong((id *)&self->_externalRankingQueries, a3);
}

- (void)run:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  v3 = 2112;
  v4 = v0;
  _os_log_debug_impl(&dword_1BD918000, v1, OS_LOG_TYPE_DEBUG, "Stopped waiting. %@ is %@", v2, 0x16u);
  OUTLINED_FUNCTION_1_0();
}

void __21__ICSearchQuery_run___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_2(&dword_1BD918000, v0, v1, "CompletionHandler of search query called, but search query was force stopped earlier: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __21__ICSearchQuery_run___block_invoke_cold_2()
{
  os_log_t v0;
  uint8_t v1[12];
  __int16 v2;
  const __CFString *v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  v2 = 2112;
  v3 = &stru_1E76DB108;
  _os_log_error_impl(&dword_1BD918000, v0, OS_LOG_TYPE_ERROR, "Error occured when running CSSearchQuery: %@. %@", v1, 0x16u);
  OUTLINED_FUNCTION_1_0();
}

void __37__ICSearchQuery_setupWithAttributes___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_2(&dword_1BD918000, v0, v1, "FoundItemsHandler of search query called, but search query was force stopped earlier: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __37__ICSearchQuery_setupWithAttributes___block_invoke_cold_2(void *a1, void *a2, NSObject *a3)
{
  int v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend(a2, "count");
  objc_msgSend(a1, "mutableQueryResults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412802;
  v8 = a1;
  v9 = 1024;
  v10 = v5;
  v11 = 1024;
  v12 = objc_msgSend(v6, "count");
  _os_log_debug_impl(&dword_1BD918000, a3, OS_LOG_TYPE_DEBUG, "%@ found %d items, attempting to add to existing %d items", (uint8_t *)&v7, 0x18u);

}

void __37__ICSearchQuery_setupWithAttributes___block_invoke_cold_3(uint64_t a1, void *a2, NSObject *a3)
{
  int v4;
  uint64_t v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = 138412546;
  v5 = a1;
  v6 = 1024;
  v7 = objc_msgSend(a2, "count");
  _os_log_debug_impl(&dword_1BD918000, a3, OS_LOG_TYPE_DEBUG, "%@ returned %d items", (uint8_t *)&v4, 0x12u);
}

@end
