@implementation CNAutocompleteQueryCacheHelper

+ (id)cache_os_log
{
  if (cache_os_log_cn_once_token_0 != -1)
    dispatch_once(&cache_os_log_cn_once_token_0, &__block_literal_global_19);
  return (id)cache_os_log_cn_once_object_0;
}

void __46__CNAutocompleteQueryCacheHelper_cache_os_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contacts.autocomplete", "cache");
  v1 = (void *)cache_os_log_cn_once_object_0;
  cache_os_log_cn_once_object_0 = (uint64_t)v0;

}

- (CNAutocompleteQueryCacheHelper)initWithCache:(id)a3 searchString:(id)a4 serverSearchObservable:(id)a5
{
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  CNAutocompleteQueryCacheMissAuditor *v13;
  CNAutocompleteQueryCacheHelper *v14;

  v8 = (void *)MEMORY[0x1E0D13B70];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  objc_msgSend(v8, "defaultProvider");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_alloc_init(CNAutocompleteQueryCacheMissAuditor);
  v14 = -[CNAutocompleteQueryCacheHelper initWithCache:searchString:serverSearchObservable:cacheMissAuditor:schedulerProvider:](self, "initWithCache:searchString:serverSearchObservable:cacheMissAuditor:schedulerProvider:", v11, v10, v9, v13, v12);

  return v14;
}

- (CNAutocompleteQueryCacheHelper)initWithCache:(id)a3 searchString:(id)a4 serverSearchObservable:(id)a5 cacheMissAuditor:(id)a6 schedulerProvider:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  CNAutocompleteQueryCacheHelper *v18;
  CNAutocompleteQueryCacheHelper *v19;
  uint64_t v20;
  NSString *searchString;
  CNAutocompleteQueryCacheHelper *v22;
  objc_super v24;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v24.receiver = self;
  v24.super_class = (Class)CNAutocompleteQueryCacheHelper;
  v18 = -[CNAutocompleteQueryCacheHelper init](&v24, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_cache, a3);
    v20 = objc_msgSend(v14, "copy");
    searchString = v19->_searchString;
    v19->_searchString = (NSString *)v20;

    objc_storeStrong((id *)&v19->_serverSearchObservable, a5);
    objc_storeStrong((id *)&v19->_cacheMissAuditor, a6);
    objc_storeStrong((id *)&v19->_schedulerProvider, a7);
    v22 = v19;
  }

  return v19;
}

- (id)cachedResultsObservable
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[5];
  _QWORD v16[5];
  _QWORD v17[4];
  id v18;

  -[CNAutocompleteQueryCacheHelper searchString](self, "searchString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAutocompleteQueryCacheHelper cachedFutureForSearchString:](self, "cachedFutureForSearchString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(MEMORY[0x1E0D13AE8], "observableWithFuture:", v4);
  else
    objc_msgSend(MEMORY[0x1E0D13AE8], "emptyObservable");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __57__CNAutocompleteQueryCacheHelper_cachedResultsObservable__block_invoke;
  v17[3] = &unk_1E70DF838;
  v18 = v3;
  v7 = v3;
  objc_msgSend(v5, "map:", v17);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "filter:", &__block_literal_global_8_1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v16[0] = v6;
  v16[1] = 3221225472;
  v16[2] = __57__CNAutocompleteQueryCacheHelper_cachedResultsObservable__block_invoke_3;
  v16[3] = &unk_1E70DF2F8;
  v16[4] = self;
  objc_msgSend(v9, "doOnNext:", v16);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v15[0] = v6;
  v15[1] = 3221225472;
  v15[2] = __57__CNAutocompleteQueryCacheHelper_cachedResultsObservable__block_invoke_10;
  v15[3] = &unk_1E70DF320;
  v15[4] = self;
  objc_msgSend(v10, "doOnError:", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D13AE8], "emptyObservable");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "onError:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

id __57__CNAutocompleteQueryCacheHelper_cachedResultsObservable__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  CNAutocompleteResultTokenMatcher *v4;
  void *v5;
  void *v6;

  v3 = a2;
  v4 = -[CNAutocompleteResultTokenMatcher initWithSearchString:]([CNAutocompleteResultTokenMatcher alloc], "initWithSearchString:", *(_QWORD *)(a1 + 32));
  -[CNAutocompleteResultTokenMatcher filterAdapter](v4, "filterAdapter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_cn_filter:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

BOOL __57__CNAutocompleteQueryCacheHelper_cachedResultsObservable__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "count") != 0;
}

void __57__CNAutocompleteQueryCacheHelper_cachedResultsObservable__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend((id)objc_opt_class(), "cache_os_log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 134217984;
    v7 = objc_msgSend(v3, "count");
    _os_log_impl(&dword_1B9950000, v4, OS_LOG_TYPE_DEFAULT, "Using %lu filtered results from the cache", (uint8_t *)&v6, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "cacheMissAuditor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didReturnCachedResults:", v3);

}

void __57__CNAutocompleteQueryCacheHelper_cachedResultsObservable__block_invoke_10(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_msgSend((id)objc_opt_class(), "cache_os_log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138543362;
    v5 = v2;
    _os_log_impl(&dword_1B9950000, v3, OS_LOG_TYPE_DEFAULT, "Error filtering cached results: %{public}@", (uint8_t *)&v4, 0xCu);
  }

}

- (id)cachedFutureForSearchString:(id)a3
{
  id v4;
  CNCache *v5;
  NSObject *v6;
  CNCache *v7;
  void *v8;
  __int128 v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  __int128 v16;
  uint8_t buf[4];
  NSObject *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self->_cache;
  v6 = v4;
  v7 = v5;
  objc_sync_enter(v7);
  v8 = 0;
  *(_QWORD *)&v9 = 138412290;
  v16 = v9;
  v10 = v6;
  while (-[NSObject length](v10, "length", v16) && !v8)
  {
    -[CNCache objectForKeyedSubscript:](v7, "objectForKeyedSubscript:", v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend((id)objc_opt_class(), "cache_os_log");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = -[NSObject length](v10, "length");
        v13 = -[NSObject length](v6, "length");
        *(_DWORD *)buf = 138412802;
        v18 = v10;
        v19 = 2048;
        v20 = v12;
        v21 = 2048;
        v22 = v13;
        _os_log_impl(&dword_1B9950000, v11, OS_LOG_TYPE_DEFAULT, "Found entry in reuse cache (key “%@”, length %lu/%lu)", buf, 0x20u);
      }
    }
    else
    {
      objc_msgSend((id)objc_opt_class(), "cache_os_log");
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = v16;
        v18 = v10;
        _os_log_impl(&dword_1B9950000, v14, OS_LOG_TYPE_DEFAULT, "No cache entry for “%@”", buf, 0xCu);
      }

      objc_msgSend((id)objc_opt_class(), "stringByRemovingLastCharacterFromString:", v10);
      v11 = v10;
      v10 = objc_claimAutoreleasedReturnValue();
    }

  }
  objc_sync_exit(v7);

  return v8;
}

- (id)uncachedResultsObservable
{
  CNCache *v3;
  void *v4;
  CNCache *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;
  id (*v13)(uint64_t, void *);
  void *v14;
  CNAutocompleteQueryCacheHelper *v15;
  CNCache *v16;

  v3 = self->_cache;
  v4 = (void *)MEMORY[0x1E0D13AE8];
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __59__CNAutocompleteQueryCacheHelper_uncachedResultsObservable__block_invoke;
  v14 = &unk_1E70DF888;
  v15 = self;
  v16 = v3;
  v5 = v3;
  objc_msgSend(v4, "observableWithBlock:", &v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x1E0D137E0];
  -[CNAutocompleteQueryCacheHelper schedulerProvider](self, "schedulerProvider", v11, v12, v13, v14, v15);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "flatMap:schedulerProvider:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id __59__CNAutocompleteQueryCacheHelper_uncachedResultsObservable__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  id v17;
  id v18;
  _QWORD v20[4];
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  uint64_t v25;
  id v26;
  id v27;
  uint8_t buf[4];
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "searchString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(id *)(a1 + 40);
  objc_sync_enter(v5);
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = 0;
  }
  else
  {
    v7 = objc_alloc_init(MEMORY[0x1E0D13B20]);
    objc_msgSend(v7, "future");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v8, v4);

    objc_msgSend((id)objc_opt_class(), "cache_os_log");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v29 = v4;
      _os_log_impl(&dword_1B9950000, v9, OS_LOG_TYPE_DEFAULT, "No existing cache entry for “%@”", buf, 0xCu);
    }

  }
  objc_sync_exit(v5);

  v10 = objc_alloc_init(MEMORY[0x1E0D139B8]);
  v11 = *(void **)(a1 + 32);
  objc_msgSend(v11, "searchString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  if (v7)
  {
    objc_msgSend(v11, "remoteResultsForSearchString:andCompletePromise:", v12, v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v23[0] = v13;
    v23[1] = 3221225472;
    v23[2] = __59__CNAutocompleteQueryCacheHelper_uncachedResultsObservable__block_invoke_14;
    v23[3] = &unk_1E70DF860;
    v15 = *(id *)(a1 + 40);
    v16 = *(_QWORD *)(a1 + 32);
    v24 = v15;
    v25 = v16;
    v26 = v4;
    v27 = v7;
    objc_msgSend(v10, "addCancelationBlock:", v23);

    v12 = v24;
  }
  else
  {
    objc_msgSend(v11, "remoteResultsForSearchString:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }

  v20[0] = v13;
  v20[1] = 3221225472;
  v20[2] = __59__CNAutocompleteQueryCacheHelper_uncachedResultsObservable__block_invoke_16;
  v20[3] = &unk_1E70DEBB0;
  v21 = v3;
  v22 = v14;
  v17 = v14;
  v18 = v3;
  objc_msgSend(v10, "performBlock:", v20);

  return v10;
}

void __59__CNAutocompleteQueryCacheHelper_uncachedResultsObservable__block_invoke_14(uint64_t a1)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  objc_msgSend((id)objc_opt_class(), "cache_os_log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 48);
    v7 = 138412290;
    v8 = v4;
    _os_log_impl(&dword_1B9950000, v3, OS_LOG_TYPE_DEFAULT, "Server search cancelled; removing cache entry for key “%@”",
      (uint8_t *)&v7,
      0xCu);
  }

  v5 = *(void **)(a1 + 56);
  objc_msgSend(MEMORY[0x1E0D13A50], "userCanceledError");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "finishWithError:", v6);

  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", 0, *(_QWORD *)(a1 + 48));
  objc_sync_exit(v2);

}

uint64_t __59__CNAutocompleteQueryCacheHelper_uncachedResultsObservable__block_invoke_16(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "observerDidReceiveResult:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "observerDidComplete");
}

+ (id)stringByRemovingLastCharacterFromString:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_msgSend(v3, "substringToIndex:", objc_msgSend(v3, "rangeOfComposedCharacterSequenceAtIndex:", objc_msgSend(v3, "length") - 1));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)remoteResultsForSearchString:(id)a3
{
  void *v4;
  void *v5;
  _QWORD v7[5];

  -[CNAutocompleteQueryCacheHelper serverSearchObservable](self, "serverSearchObservable", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __63__CNAutocompleteQueryCacheHelper_remoteResultsForSearchString___block_invoke;
  v7[3] = &unk_1E70DF2F8;
  v7[4] = self;
  objc_msgSend(v4, "doOnNext:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __63__CNAutocompleteQueryCacheHelper_remoteResultsForSearchString___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "cacheMissAuditor");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "didReturnLiveResults:", v3);

}

- (id)remoteResultsForSearchString:(id)a3 andCompletePromise:(id)a4
{
  id v6;
  id v7;
  CNCache *v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  CNCache *v13;
  void *v14;
  void *v15;
  CNCache *v16;
  id v17;
  id v18;
  void *v19;
  CNCache *v20;
  id v21;
  void *v22;
  id v23;
  id v24;
  CNCache *v25;
  void *v26;
  _QWORD v28[4];
  CNCache *v29;
  CNAutocompleteQueryCacheHelper *v30;
  id v31;
  id v32;
  _QWORD v33[4];
  CNCache *v34;
  CNAutocompleteQueryCacheHelper *v35;
  id v36;
  _QWORD v37[4];
  CNCache *v38;
  CNAutocompleteQueryCacheHelper *v39;
  id v40;
  id v41;
  _QWORD v42[5];
  _QWORD v43[5];
  id v44;
  id v45;
  CNCache *v46;

  v6 = a3;
  v7 = a4;
  v8 = self->_cache;
  -[CNAutocompleteQueryCacheHelper serverSearchObservable](self, "serverSearchObservable");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v43[0] = MEMORY[0x1E0C809B0];
  v43[1] = 3221225472;
  v43[2] = __82__CNAutocompleteQueryCacheHelper_remoteResultsForSearchString_andCompletePromise___block_invoke;
  v43[3] = &unk_1E70DF8B0;
  v43[4] = self;
  v11 = v6;
  v44 = v11;
  v12 = v7;
  v45 = v12;
  v13 = v8;
  v46 = v13;
  objc_msgSend(v9, "doOnNext:", v43);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v42[0] = v10;
  v42[1] = 3221225472;
  v42[2] = __82__CNAutocompleteQueryCacheHelper_remoteResultsForSearchString_andCompletePromise___block_invoke_20;
  v42[3] = &unk_1E70DF2F8;
  v42[4] = self;
  objc_msgSend(v14, "doOnNext:", v42);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v37[0] = v10;
  v37[1] = 3221225472;
  v37[2] = __82__CNAutocompleteQueryCacheHelper_remoteResultsForSearchString_andCompletePromise___block_invoke_2;
  v37[3] = &unk_1E70DF8D8;
  v16 = v13;
  v38 = v16;
  v39 = self;
  v17 = v11;
  v40 = v17;
  v18 = v12;
  v41 = v18;
  objc_msgSend(v15, "doOnError:", v37);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v33[0] = v10;
  v33[1] = 3221225472;
  v33[2] = __82__CNAutocompleteQueryCacheHelper_remoteResultsForSearchString_andCompletePromise___block_invoke_21;
  v33[3] = &unk_1E70DEF28;
  v20 = v16;
  v34 = v20;
  v35 = self;
  v21 = v18;
  v36 = v21;
  objc_msgSend(v19, "doOnCompletion:", v33);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v28[0] = v10;
  v28[1] = 3221225472;
  v28[2] = __82__CNAutocompleteQueryCacheHelper_remoteResultsForSearchString_andCompletePromise___block_invoke_25;
  v28[3] = &unk_1E70DF860;
  v29 = v20;
  v30 = self;
  v31 = v21;
  v32 = v17;
  v23 = v17;
  v24 = v21;
  v25 = v20;
  objc_msgSend(v22, "doOnSubscribe:", v28);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return v26;
}

void __82__CNAutocompleteQueryCacheHelper_remoteResultsForSearchString_andCompletePromise___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (+[CNAutocompleteQueryCacheHelper shouldCacheResults:](CNAutocompleteQueryCacheHelper, "shouldCacheResults:", v3))
  {
    objc_msgSend(v3, "_cn_flatten");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "cache_os_log");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = objc_msgSend(v4, "count");
      v7 = *(_QWORD *)(a1 + 40);
      v12 = 134218242;
      v13 = v6;
      v14 = 2112;
      v15 = v7;
      _os_log_impl(&dword_1B9950000, v5, OS_LOG_TYPE_DEFAULT, "Caching %lu results for key “%@”", (uint8_t *)&v12, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 48), "finishWithResult:", v4);
  }
  else
  {
    v4 = *(id *)(a1 + 56);
    objc_sync_enter(v4);
    objc_msgSend((id)objc_opt_class(), "cache_os_log");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(a1 + 40);
      v12 = 138412290;
      v13 = v9;
      _os_log_impl(&dword_1B9950000, v8, OS_LOG_TYPE_DEFAULT, "Result set is not a candidate for caching; removing cache entry for key “%@”",
        (uint8_t *)&v12,
        0xCu);
    }

    v10 = *(void **)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CNContactAutocompleteErrorDomain"), 101, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "finishWithError:", v11);

    objc_msgSend(*(id *)(a1 + 56), "setObject:forKeyedSubscript:", 0, *(_QWORD *)(a1 + 40));
    objc_sync_exit(v4);
  }

}

void __82__CNAutocompleteQueryCacheHelper_remoteResultsForSearchString_andCompletePromise___block_invoke_20(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "cacheMissAuditor");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "didReturnLiveResults:", v3);

}

void __82__CNAutocompleteQueryCacheHelper_remoteResultsForSearchString_andCompletePromise___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  id v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(id *)(a1 + 32);
  objc_sync_enter(v4);
  objc_msgSend((id)objc_opt_class(), "cache_os_log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(a1 + 48);
    v7 = 138543618;
    v8 = v3;
    v9 = 2112;
    v10 = v6;
    _os_log_impl(&dword_1B9950000, v5, OS_LOG_TYPE_DEFAULT, "Server search failed with error %{public}@; removing cache entry for key “%@”",
      (uint8_t *)&v7,
      0x16u);
  }

  objc_msgSend(*(id *)(a1 + 56), "finishWithError:", v3);
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", 0, *(_QWORD *)(a1 + 48));
  objc_sync_exit(v4);

}

void __82__CNAutocompleteQueryCacheHelper_remoteResultsForSearchString_andCompletePromise___block_invoke_21(uint64_t a1)
{
  id v2;
  NSObject *v3;
  void *v4;
  int v5;
  const __CFString *v6;
  int v7;
  const __CFString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  objc_msgSend((id)objc_opt_class(), "cache_os_log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 48), "future");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isFinished");
    v6 = CFSTR("IS NOT");
    if (v5)
      v6 = CFSTR("IS");
    v7 = 138412290;
    v8 = v6;
    _os_log_impl(&dword_1B9950000, v3, OS_LOG_TYPE_DEFAULT, "Server complete; promise %@ finished",
      (uint8_t *)&v7,
      0xCu);

  }
  objc_sync_exit(v2);

}

void __82__CNAutocompleteQueryCacheHelper_remoteResultsForSearchString_andCompletePromise___block_invoke_25(uint64_t a1)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  objc_msgSend((id)objc_opt_class(), "cache_os_log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 48);
    v5 = *(_QWORD *)(a1 + 56);
    v7 = 138412546;
    v8 = v4;
    v9 = 2112;
    v10 = v5;
    _os_log_impl(&dword_1B9950000, v3, OS_LOG_TYPE_DEFAULT, "Caching the future of promise %@ for key “%@”", (uint8_t *)&v7, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 48), "future");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, *(_QWORD *)(a1 + 56));

  objc_sync_exit(v2);
}

- (id)observablesForSearchString:(id)a3 withCachedResults:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v20[5];
  _QWORD v21[5];
  _QWORD v22[5];
  _QWORD v23[4];
  id v24;

  v6 = a3;
  objc_msgSend(MEMORY[0x1E0D13AE8], "observableWithFuture:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __79__CNAutocompleteQueryCacheHelper_observablesForSearchString_withCachedResults___block_invoke;
  v23[3] = &unk_1E70DF838;
  v24 = v6;
  v9 = v6;
  objc_msgSend(v7, "map:", v23);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "filter:", &__block_literal_global_26);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v22[0] = v8;
  v22[1] = 3221225472;
  v22[2] = __79__CNAutocompleteQueryCacheHelper_observablesForSearchString_withCachedResults___block_invoke_3;
  v22[3] = &unk_1E70DF2F8;
  v22[4] = self;
  objc_msgSend(v11, "doOnNext:", v22);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v21[0] = v8;
  v21[1] = 3221225472;
  v21[2] = __79__CNAutocompleteQueryCacheHelper_observablesForSearchString_withCachedResults___block_invoke_27;
  v21[3] = &unk_1E70DF320;
  v21[4] = self;
  objc_msgSend(v12, "doOnError:", v21);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D13AE8], "emptyObservable");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "onError:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNAutocompleteQueryCacheHelper serverSearchObservable](self, "serverSearchObservable");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v8;
  v20[1] = 3221225472;
  v20[2] = __79__CNAutocompleteQueryCacheHelper_observablesForSearchString_withCachedResults___block_invoke_28;
  v20[3] = &unk_1E70DF2F8;
  v20[4] = self;
  objc_msgSend(v16, "doOnNext:", v20);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D13AF8], "pairWithFirst:second:", v15, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

id __79__CNAutocompleteQueryCacheHelper_observablesForSearchString_withCachedResults___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  CNAutocompleteResultTokenMatcher *v4;
  void *v5;
  void *v6;

  v3 = a2;
  v4 = -[CNAutocompleteResultTokenMatcher initWithSearchString:]([CNAutocompleteResultTokenMatcher alloc], "initWithSearchString:", *(_QWORD *)(a1 + 32));
  -[CNAutocompleteResultTokenMatcher filterAdapter](v4, "filterAdapter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_cn_filter:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

BOOL __79__CNAutocompleteQueryCacheHelper_observablesForSearchString_withCachedResults___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "count") != 0;
}

void __79__CNAutocompleteQueryCacheHelper_observablesForSearchString_withCachedResults___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend((id)objc_opt_class(), "cache_os_log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 134217984;
    v7 = objc_msgSend(v3, "count");
    _os_log_impl(&dword_1B9950000, v4, OS_LOG_TYPE_DEFAULT, "Using %lu filtered results from the cache", (uint8_t *)&v6, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "cacheMissAuditor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didReturnCachedResults:", v3);

}

void __79__CNAutocompleteQueryCacheHelper_observablesForSearchString_withCachedResults___block_invoke_27(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_msgSend((id)objc_opt_class(), "cache_os_log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138543362;
    v5 = v2;
    _os_log_impl(&dword_1B9950000, v3, OS_LOG_TYPE_DEFAULT, "Error filtering cached results: %{public}@", (uint8_t *)&v4, 0xCu);
  }

}

void __79__CNAutocompleteQueryCacheHelper_observablesForSearchString_withCachedResults___block_invoke_28(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "cacheMissAuditor");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "didReturnLiveResults:", v3);

}

+ (BOOL)shouldCacheResults:(id)a3
{
  return __ROR8__(0x8F5C28F5C28F5C29 * objc_msgSend(a3, "count"), 2) > 0x28F5C28F5C28F5CuLL;
}

- (CNCache)cache
{
  return self->_cache;
}

- (NSString)searchString
{
  return self->_searchString;
}

- (CNObservable)serverSearchObservable
{
  return self->_serverSearchObservable;
}

- (CNAutocompleteQueryCacheMissAuditor)cacheMissAuditor
{
  return self->_cacheMissAuditor;
}

- (CNSchedulerProvider)schedulerProvider
{
  return self->_schedulerProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_schedulerProvider, 0);
  objc_storeStrong((id *)&self->_cacheMissAuditor, 0);
  objc_storeStrong((id *)&self->_serverSearchObservable, 0);
  objc_storeStrong((id *)&self->_searchString, 0);
  objc_storeStrong((id *)&self->_cache, 0);
}

@end
