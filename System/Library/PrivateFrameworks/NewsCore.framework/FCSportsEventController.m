@implementation FCSportsEventController

- (FCSportsEventController)initWithContentDatabase:(id)a3 context:(id)a4 sportsEventRecordSource:(id)a5 tagController:(id)a6
{
  id v10;
  id v11;
  id v12;
  FCSportsEventController *v13;
  FCSportsEventController *v14;
  uint64_t v15;
  FCNewsAppConfigurationManager *appConfigurationManager;
  NSCache *v17;
  NSCache *fastCache;
  objc_super v20;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v20.receiver = self;
  v20.super_class = (Class)FCSportsEventController;
  v13 = -[FCSportsEventController init](&v20, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_context, a4);
    objc_storeStrong((id *)&v14->_sportsEventRecordSource, a5);
    objc_storeStrong((id *)&v14->_tagController, a6);
    objc_msgSend(v10, "news_core_ConfigurationManager");
    v15 = objc_claimAutoreleasedReturnValue();
    appConfigurationManager = v14->_appConfigurationManager;
    v14->_appConfigurationManager = (FCNewsAppConfigurationManager *)v15;

    v17 = (NSCache *)objc_alloc_init(MEMORY[0x1E0C99D38]);
    fastCache = v14->_fastCache;
    v14->_fastCache = v17;

  }
  return v14;
}

- (id)fastCachedSportsEventForID:(id)a3
{
  return -[FCSportsEventController _cachedSportsEventForSportsEventID:fastCacheOnly:](self, "_cachedSportsEventForSportsEventID:fastCacheOnly:", a3, 1);
}

- (id)slowCachedSportsEventForID:(id)a3
{
  return -[FCSportsEventController _cachedSportsEventForSportsEventID:fastCacheOnly:](self, "_cachedSportsEventForSportsEventID:fastCacheOnly:", a3, 0);
}

- (void)_refreshSportsEventsBasedOnAgeForSportsEventIDs:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  FCSportsEventController *v17;
  id obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v17 = self;
  v24 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v20 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v9, "loadDate", v17);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "dateByAddingTimeInterval:", 3600.0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v11, "fc_isEarlierThan:", v12);

        if (v13)
        {
          objc_msgSend(v9, "identifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v14);

        }
      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v6);
  }

  if (objc_msgSend(v4, "count"))
  {
    -[FCSportsEventController _fetchOperationForSportsEventsWithIDs:](v17, "_fetchOperationForSportsEventsWithIDs:", v4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setQualityOfService:", 17);
    objc_msgSend(v15, "setRelativePriority:", -1);
    +[FCCachePolicy ignoreCacheCachePolicy](FCCachePolicy, "ignoreCacheCachePolicy");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setCachePolicy:", v16);

    objc_msgSend(v15, "start");
  }

}

- (void)_fetchSportsEventForSportsEventID:(id)a3 cachePolicy:(id)a4 qualityOfService:(int64_t)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  if (!v10)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "sportsEventID != nil");
      *(_DWORD *)buf = 136315906;
      v19 = "-[FCSportsEventController _fetchSportsEventForSportsEventID:cachePolicy:qualityOfService:completionHandler:]";
      v20 = 2080;
      v21 = "FCSportsEventController.m";
      v22 = 1024;
      v23 = 114;
      v24 = 2114;
      v25 = v14;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      if (!v12)
        goto LABEL_6;
    }
    else if (!v12)
    {
      goto LABEL_6;
    }
    (*((void (**)(id, _QWORD, _QWORD))v12 + 2))(v12, 0, 0);
    goto LABEL_6;
  }
  v17 = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v17, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __108__FCSportsEventController__fetchSportsEventForSportsEventID_cachePolicy_qualityOfService_completionHandler___block_invoke;
  v15[3] = &unk_1E463B570;
  v16 = v12;
  -[FCSportsEventController _fetchSportsEventsForSportsEventIDs:cachePolicy:qualityOfService:completionHandler:](self, "_fetchSportsEventsForSportsEventIDs:cachePolicy:qualityOfService:completionHandler:", v13, v11, a5, v15);

LABEL_6:
}

void __108__FCSportsEventController__fetchSportsEventForSportsEventID_cachePolicy_qualityOfService_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3;
  id v5;
  void *v6;
  id v7;

  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
  {
    v5 = a3;
    objc_msgSend(a2, "allValues");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, id))(v3 + 16))(v3, v6, v5);

  }
}

- (void)_fetchSportsEventsForSportsEventIDs:(id)a3 cachePolicy:(id)a4 qualityOfService:(int64_t)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  int64_t v28;
  id v29;
  void (**v30)(_QWORD, _QWORD, _QWORD);
  _QWORD v31[4];
  id v32;
  void (**v33)(_QWORD, _QWORD, _QWORD);
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _QWORD v38[9];
  uint8_t v39[128];
  uint8_t buf[4];
  const char *v41;
  __int16 v42;
  char *v43;
  __int16 v44;
  int v45;
  __int16 v46;
  id v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  if (v10 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    if (v12)
      goto LABEL_4;
LABEL_28:
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      goto LABEL_29;
    v13 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "completionHandler != nil");
    *(_DWORD *)buf = 136315906;
    v41 = "-[FCSportsEventController _fetchSportsEventsForSportsEventIDs:cachePolicy:qualityOfService:completionHandler:]";
    v42 = 2080;
    v43 = "FCSportsEventController.m";
    v44 = 1024;
    v45 = 137;
    v46 = 2114;
    v47 = v13;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
    goto LABEL_6;
  }
  v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "sportsEventIDs != nil");
  *(_DWORD *)buf = 136315906;
  v41 = "-[FCSportsEventController _fetchSportsEventsForSportsEventIDs:cachePolicy:qualityOfService:completionHandler:]";
  v42 = 2080;
  v43 = "FCSportsEventController.m";
  v44 = 1024;
  v45 = 136;
  v46 = 2114;
  v47 = v27;
  _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  if (!v12)
    goto LABEL_28;
LABEL_4:
  if (v11)
  {
    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3221225472;
    v38[2] = __110__FCSportsEventController__fetchSportsEventsForSportsEventIDs_cachePolicy_qualityOfService_completionHandler___block_invoke_2;
    v38[3] = &unk_1E4648A20;
    v38[4] = self;
    v13 = v10;
    v38[5] = v13;
    v38[6] = v11;
    v38[7] = v12;
    v38[8] = a5;
    __110__FCSportsEventController__fetchSportsEventsForSportsEventIDs_cachePolicy_qualityOfService_completionHandler___block_invoke_2((uint64_t)v38);
LABEL_6:

    goto LABEL_29;
  }
  v28 = a5;
  v30 = (void (**)(_QWORD, _QWORD, _QWORD))v12;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v29 = v10;
  v16 = v10;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v35 != v19)
          objc_enumerationMutation(v16);
        v21 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i);
        -[FCSportsEventController fastCache](self, "fastCache");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "objectForKey:", v21);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        if (v23)
          objc_msgSend(v14, "setObject:forKey:", v23, v21);
        else
          objc_msgSend(v15, "addObject:", v21);

      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    }
    while (v18);
  }

  if (objc_msgSend(v15, "count"))
  {
    -[FCSportsEventController _fetchOperationForSportsEventsWithIDs:](self, "_fetchOperationForSportsEventsWithIDs:", v15);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setQualityOfService:", v28);
    v12 = v30;
    if (v28 == 9)
      v25 = -1;
    else
      v25 = v28 == 33 || v28 == 25;
    v10 = v29;
    objc_msgSend(v24, "setRelativePriority:", v25);
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __110__FCSportsEventController__fetchSportsEventsForSportsEventIDs_cachePolicy_qualityOfService_completionHandler___block_invoke_5;
    v31[3] = &unk_1E4640658;
    v33 = v30;
    v32 = v14;
    objc_msgSend(v24, "setFetchCompletionHandler:", v31);
    objc_msgSend(MEMORY[0x1E0CB3828], "fc_sharedConcurrentQueue");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "addOperation:", v24);

  }
  else
  {
    v12 = v30;
    ((void (**)(_QWORD, void *, _QWORD))v30)[2](v30, v14, 0);
    v10 = v29;
  }

  v11 = 0;
LABEL_29:

}

void __110__FCSportsEventController__fetchSportsEventsForSportsEventIDs_cachePolicy_qualityOfService_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  BOOL v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "_fetchOperationForSportsEventsWithIDs:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setQualityOfService:", *(_QWORD *)(a1 + 64));
  v3 = *(_QWORD *)(a1 + 64);
  v4 = v3 == 33 || v3 == 25;
  if (v3 == 9)
    v5 = -1;
  else
    v5 = v4;
  objc_msgSend(v2, "setRelativePriority:", v5);
  objc_msgSend(v2, "setCachePolicy:", *(_QWORD *)(a1 + 48));
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __110__FCSportsEventController__fetchSportsEventsForSportsEventIDs_cachePolicy_qualityOfService_completionHandler___block_invoke_3;
  v7[3] = &unk_1E4644930;
  v8 = *(id *)(a1 + 56);
  objc_msgSend(v2, "setFetchCompletionHandler:", v7);
  objc_msgSend(MEMORY[0x1E0CB3828], "fc_sharedConcurrentQueue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addOperation:", v2);

}

void __110__FCSportsEventController__fetchSportsEventsForSportsEventIDs_cachePolicy_qualityOfService_completionHandler___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  id v4;

  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    objc_msgSend(a2, "fc_dictionaryWithKeySelector:", sel_identifier);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
}

void __110__FCSportsEventController__fetchSportsEventsForSportsEventIDs_cachePolicy_qualityOfService_completionHandler___block_invoke_5(uint64_t a1, void *a2, uint64_t a3)
{
  id v4;

  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    objc_msgSend(a2, "fc_dictionaryWithKeySelector:", sel_identifier);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if (v4)
      objc_msgSend(*(id *)(a1 + 32), "addEntriesFromDictionary:", v4);
    objc_msgSend(*(id *)(a1 + 32), "fc_removeObjectsForKeysPassingTest:", &__block_literal_global_18);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
}

uint64_t __110__FCSportsEventController__fetchSportsEventsForSportsEventIDs_cachePolicy_qualityOfService_completionHandler___block_invoke_7()
{
  return +[FCTagController isTagAllowedForNewsVersion:](FCTagController, "isTagAllowedForNewsVersion:") ^ 1;
}

- (id)_cachedSportsEventForSportsEventID:(id)a3 fastCacheOnly:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v4 = a4;
  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = v6;
  if (v6)
  {
    v14 = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v14, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCSportsEventController _cachedSportsEventsForSportsEventID:fastCacheOnly:](self, "_cachedSportsEventsForSportsEventID:fastCacheOnly:", v8, v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "allValues");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "sportsEventID != nil");
      *(_DWORD *)buf = 136315906;
      v16 = "-[FCSportsEventController _cachedSportsEventForSportsEventID:fastCacheOnly:]";
      v17 = 2080;
      v18 = "FCSportsEventController.m";
      v19 = 1024;
      v20 = 211;
      v21 = 2114;
      v22 = v13;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    }
    v11 = 0;
  }

  return v11;
}

- (id)_cachedSportsEventsForSportsEventID:(id)a3 fastCacheOnly:(BOOL)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  _QWORD v22[5];
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t v28[128];
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  char *v32;
  __int16 v33;
  int v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "sportsEventIDs != nil");
    *(_DWORD *)buf = 136315906;
    v30 = "-[FCSportsEventController _cachedSportsEventsForSportsEventID:fastCacheOnly:]";
    v31 = 2080;
    v32 = "FCSportsEventController.m";
    v33 = 1024;
    v34 = 218;
    v35 = 2114;
    v36 = v20;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v25 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
        -[FCSportsEventController fastCache](self, "fastCache");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectForKey:", v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
          objc_msgSend(v6, "setObject:forKey:", v15, v13);
        else
          objc_msgSend(v7, "addObject:", v13);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v10);
  }

  if (objc_msgSend(v7, "count") && !a4)
  {
    -[FCSportsEventController sportsEventRecordSource](self, "sportsEventRecordSource");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "cachedRecordsWithIDs:", v7);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __77__FCSportsEventController__cachedSportsEventsForSportsEventID_fastCacheOnly___block_invoke;
    v22[3] = &unk_1E4648A68;
    v22[4] = self;
    v23 = v6;
    objc_msgSend(v17, "enumerateRecordsAndInterestTokensWithBlock:", v22);

  }
  objc_msgSend(v6, "allValues");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCSportsEventController _refreshSportsEventsBasedOnAgeForSportsEventIDs:](self, "_refreshSportsEventsBasedOnAgeForSportsEventIDs:", v18);

  return v6;
}

void __77__FCSportsEventController__cachedSportsEventsForSportsEventID_fastCacheOnly___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  FCSportsEvent *v25;
  void *v26;
  void *v27;
  FCSportsEvent *v28;
  void *v29;
  void *v30;
  objc_class *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  NSObject *log;
  _QWORD v39[6];
  _QWORD v40[4];
  id v41;
  uint64_t v42;
  id v43;
  uint8_t buf[4];
  void *v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  uint64_t v49;
  __int16 v50;
  uint64_t v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "tagController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "eventCompetitorTagIDs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "slowCachedTagsForIDs:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "eventCompetitorTagIDs");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v40[0] = MEMORY[0x1E0C809B0];
  v40[1] = 3221225472;
  v40[2] = __77__FCSportsEventController__cachedSportsEventsForSportsEventID_fastCacheOnly___block_invoke_2;
  v40[3] = &unk_1E463E090;
  v12 = v9;
  v13 = *(_QWORD *)(a1 + 32);
  v41 = v12;
  v42 = v13;
  v14 = v5;
  v43 = v14;
  objc_msgSend(v10, "fc_arrayByTransformingWithBlock:", v40);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = objc_msgSend(v15, "count");
  objc_msgSend(v14, "eventCompetitorTagIDs");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "count");

  if (v16 != v18)
  {
    v19 = (void *)FCDefaultLog;
    if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_ERROR))
    {
      log = v19;
      v31 = (objc_class *)objc_opt_class();
      NSStringFromClass(v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "base");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "identifier");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "eventCompetitorTagIDs");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v34, "count");
      v36 = objc_msgSend(v15, "count");
      *(_DWORD *)buf = 138544130;
      v45 = v32;
      v46 = 2114;
      v47 = v33;
      v48 = 2050;
      v49 = v35;
      v50 = 2050;
      v51 = v36;
      _os_log_error_impl(&dword_1A1B90000, log, OS_LOG_TYPE_ERROR, "%{public}@ failed to fetch all competitor tags for sports event with id=%{public}@. Expected %{public}lu tags, but got %{public}lu", buf, 0x2Au);

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "tagController");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "eventLeagueTagID");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "slowCachedTagForID:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "asSports");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    v24 = v23;
    v25 = [FCSportsEvent alloc];
    objc_msgSend(*(id *)(a1 + 32), "context");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "assetManager");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = -[FCSportsEvent initWithSportsEventRecord:eventCompetitorTags:eventLeagueTag:assetManager:interestToken:](v25, "initWithSportsEventRecord:eventCompetitorTags:eventLeagueTag:assetManager:interestToken:", v14, v15, v24, v27, v6);

    v29 = *(void **)(a1 + 40);
    -[FCSportsEvent identifier](v28, "identifier");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setObject:forKey:", v28, v30);

  }
  else
  {
    v39[0] = v11;
    v39[1] = 3221225472;
    v39[2] = __77__FCSportsEventController__cachedSportsEventsForSportsEventID_fastCacheOnly___block_invoke_22;
    v39[3] = &unk_1E463AD10;
    v39[4] = *(_QWORD *)(a1 + 32);
    v39[5] = v14;
    __77__FCSportsEventController__cachedSportsEventsForSportsEventID_fastCacheOnly___block_invoke_22((uint64_t)v39);
  }

}

id __77__FCSportsEventController__cachedSportsEventsForSportsEventID_fastCacheOnly___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  char v5;
  void *v6;
  _QWORD v8[5];
  id v9;
  id v10;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isSports");

  if ((v5 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __77__FCSportsEventController__cachedSportsEventsForSportsEventID_fastCacheOnly___block_invoke_3;
    v8[3] = &unk_1E463E068;
    v8[4] = *(_QWORD *)(a1 + 40);
    v9 = v3;
    v10 = *(id *)(a1 + 48);
    __77__FCSportsEventController__cachedSportsEventsForSportsEventID_fastCacheOnly___block_invoke_3((uint64_t)v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

uint64_t __77__FCSportsEventController__cachedSportsEventsForSportsEventID_fastCacheOnly___block_invoke_3(uint64_t a1)
{
  void *v2;
  NSObject *v4;
  objc_class *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = (void *)FCDefaultLog;
  if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_ERROR))
  {
    v4 = v2;
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "base");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543874;
    v11 = v6;
    v12 = 2114;
    v13 = v7;
    v14 = 2114;
    v15 = v9;
    _os_log_error_impl(&dword_1A1B90000, v4, OS_LOG_TYPE_ERROR, "%{public}@ encountered non-sports tag with id %{public}@ as a competitor tag for sports event with id %{public}@. Ignoring invalid competitor tag.", (uint8_t *)&v10, 0x20u);

  }
  return 0;
}

void __77__FCSportsEventController__cachedSportsEventsForSportsEventID_fastCacheOnly___block_invoke_22(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = (void *)FCOperationLog;
  if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_ERROR))
  {
    v3 = v2;
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "base");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "eventLeagueTagID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543874;
    v10 = v5;
    v11 = 2114;
    v12 = v7;
    v13 = 2114;
    v14 = v8;
    _os_log_error_impl(&dword_1A1B90000, v3, OS_LOG_TYPE_ERROR, "%{public}@ failed to get league tag for sports event record, sports event discarded; sportsEventRecord identifier="
      "%{public}@, leagueTag identifier=%{public}@",
      (uint8_t *)&v9,
      0x20u);

  }
}

- (void)_saveSportsEventsToCache:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[FCSportsEventController fastCache](self, "fastCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52__FCSportsEventController__saveSportsEventsToCache___block_invoke;
  v7[3] = &unk_1E4648A90;
  v8 = v5;
  v6 = v5;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v7);

}

void __52__FCSportsEventController__saveSportsEventsToCache___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "identifier");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v3, v4);

}

- (id)jsonEncodableObject
{
  void *v2;
  void *v3;

  -[FCSportsEventController sportsEventRecordSource](self, "sportsEventRecordSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "jsonEncodableObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_fetchOperationForSportsEventsWithIDs:(id)a3
{
  id v4;
  FCSportsEventsFetchOperation *v5;
  void *v6;
  void *v7;
  FCSportsEventsFetchOperation *v8;

  v4 = a3;
  v5 = [FCSportsEventsFetchOperation alloc];
  -[FCSportsEventController context](self, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCSportsEventController tagController](self, "tagController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[FCSportsEventsFetchOperation initWithContext:tagController:sportsEventIDs:delegate:](v5, "initWithContext:tagController:sportsEventIDs:delegate:", v6, v7, v4, self);

  return v8;
}

- (void)sportsEventsFetchOperation:(id)a3 didFetchSportsEvents:(id)a4
{
  -[FCSportsEventController _saveSportsEventsToCache:](self, "_saveSportsEventsToCache:", a4);
}

- (NSCache)fastCache
{
  return self->_fastCache;
}

- (void)setFastCache:(id)a3
{
  objc_storeStrong((id *)&self->_fastCache, a3);
}

- (FCContentContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (FCSportsEventRecordSource)sportsEventRecordSource
{
  return self->_sportsEventRecordSource;
}

- (void)setSportsEventRecordSource:(id)a3
{
  objc_storeStrong((id *)&self->_sportsEventRecordSource, a3);
}

- (FCTagRecordSource)tagRecordSource
{
  return self->_tagRecordSource;
}

- (void)setTagRecordSource:(id)a3
{
  objc_storeStrong((id *)&self->_tagRecordSource, a3);
}

- (FCTagController)tagController
{
  return self->_tagController;
}

- (void)setTagController:(id)a3
{
  objc_storeStrong((id *)&self->_tagController, a3);
}

- (FCNewsAppConfigurationManager)appConfigurationManager
{
  return self->_appConfigurationManager;
}

- (void)setAppConfigurationManager:(id)a3
{
  objc_storeStrong((id *)&self->_appConfigurationManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appConfigurationManager, 0);
  objc_storeStrong((id *)&self->_tagController, 0);
  objc_storeStrong((id *)&self->_tagRecordSource, 0);
  objc_storeStrong((id *)&self->_sportsEventRecordSource, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_fastCache, 0);
}

@end
