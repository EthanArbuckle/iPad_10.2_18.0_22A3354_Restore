@implementation FCPuzzleTypeController

- (FCPuzzleTypeController)initWithContentDatabase:(id)a3 context:(id)a4 assetManager:(id)a5 puzzleTypeRecordSource:(id)a6 configurationManager:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  FCPuzzleTypeController *v17;
  FCPuzzleTypeController *v18;
  NSCache *v19;
  NSCache *fastCache;
  void *v22;
  void *v23;
  objc_super v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if (!v14 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "assetManager != nil");
    *(_DWORD *)buf = 136315906;
    v26 = "-[FCPuzzleTypeController initWithContentDatabase:context:assetManager:puzzleTypeRecordSource:configurationManager:]";
    v27 = 2080;
    v28 = "FCPuzzleTypeController.m";
    v29 = 1024;
    v30 = 52;
    v31 = 2114;
    v32 = v22;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v15)
      goto LABEL_6;
  }
  else if (v15)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "puzzleTypeRecordSource != nil");
    *(_DWORD *)buf = 136315906;
    v26 = "-[FCPuzzleTypeController initWithContentDatabase:context:assetManager:puzzleTypeRecordSource:configurationManager:]";
    v27 = 2080;
    v28 = "FCPuzzleTypeController.m";
    v29 = 1024;
    v30 = 53;
    v31 = 2114;
    v32 = v23;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
LABEL_6:
  v24.receiver = self;
  v24.super_class = (Class)FCPuzzleTypeController;
  v17 = -[FCPuzzleTypeController init](&v24, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_assetManager, a5);
    objc_storeStrong((id *)&v18->_context, a4);
    objc_storeStrong((id *)&v18->_puzzleTypeRecordSource, a6);
    v19 = (NSCache *)objc_alloc_init(MEMORY[0x1E0C99D38]);
    fastCache = v18->_fastCache;
    v18->_fastCache = v19;

    -[NSCache setEvictsObjectsWhenApplicationEntersBackground:](v18->_fastCache, "setEvictsObjectsWhenApplicationEntersBackground:", 0);
  }

  return v18;
}

- (FCPuzzleTypeController)init
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Abstract method"));
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCPuzzleTypeController init]";
    v9 = 2080;
    v10 = "FCPuzzleTypeController.m";
    v11 = 1024;
    v12 = 43;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Abstract method"), "-[FCPuzzleTypeController init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (id)cachedPuzzleTypeForID:(id)a3
{
  return -[FCPuzzleTypeController _cachedPuzzleTypeForPuzzleTypeID:fastCacheOnly:](self, "_cachedPuzzleTypeForPuzzleTypeID:fastCacheOnly:", a3, 0);
}

- (void)_fetchPuzzleTypeForPuzzleTypeID:(id)a3 cachePolicy:(id)a4 qualityOfService:(int64_t)a5 callbackQueue:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  void *v16;
  id *v17;
  void *v18;
  _QWORD block[4];
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  if (v12)
  {
    v23 = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v23, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __119__FCPuzzleTypeController__fetchPuzzleTypeForPuzzleTypeID_cachePolicy_qualityOfService_callbackQueue_completionHandler___block_invoke;
    v21[3] = &unk_1E463B570;
    v17 = &v22;
    v22 = v15;
    -[FCPuzzleTypeController _fetchPuzzleTypesForPuzzleTypeIDs:cachePolicy:qualityOfService:callbackQueue:completionHandler:](self, "_fetchPuzzleTypesForPuzzleTypeIDs:cachePolicy:qualityOfService:callbackQueue:completionHandler:", v16, v13, a5, v14, v21);

LABEL_6:
    goto LABEL_7;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "puzzleTypeID != nil");
    *(_DWORD *)buf = 136315906;
    v25 = "-[FCPuzzleTypeController _fetchPuzzleTypeForPuzzleTypeID:cachePolicy:qualityOfService:callbackQueue:completionHandler:]";
    v26 = 2080;
    v27 = "FCPuzzleTypeController.m";
    v28 = 1024;
    v29 = 108;
    v30 = 2114;
    v31 = v18;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (!v15)
      goto LABEL_7;
    goto LABEL_5;
  }
  if (v15)
  {
LABEL_5:
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __119__FCPuzzleTypeController__fetchPuzzleTypeForPuzzleTypeID_cachePolicy_qualityOfService_callbackQueue_completionHandler___block_invoke_2;
    block[3] = &unk_1E463B598;
    v17 = &v20;
    v20 = v15;
    dispatch_async(v14, block);
    goto LABEL_6;
  }
LABEL_7:

}

void __119__FCPuzzleTypeController__fetchPuzzleTypeForPuzzleTypeID_cachePolicy_qualityOfService_callbackQueue_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
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

uint64_t __119__FCPuzzleTypeController__fetchPuzzleTypeForPuzzleTypeID_cachePolicy_qualityOfService_callbackQueue_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_fetchPuzzleTypesForPuzzleTypeIDs:(id)a3 cachePolicy:(id)a4 qualityOfService:(int64_t)a5 callbackQueue:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  int64_t v33;
  id v34;
  void *v35;
  NSObject *queue;
  _QWORD block[4];
  void *v38;
  id v39;
  _QWORD v40[4];
  id v41;
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _QWORD v47[10];
  _QWORD v48[6];
  uint8_t v49[128];
  uint8_t buf[4];
  const char *v51;
  __int16 v52;
  char *v53;
  __int16 v54;
  int v55;
  __int16 v56;
  void *v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  if (v12 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    if (v14)
      goto LABEL_4;
LABEL_26:
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "callbackQueue != nil");
      *(_DWORD *)buf = 136315906;
      v51 = "-[FCPuzzleTypeController _fetchPuzzleTypesForPuzzleTypeIDs:cachePolicy:qualityOfService:callbackQueue:completionHandler:]";
      v52 = 2080;
      v53 = "FCPuzzleTypeController.m";
      v54 = 1024;
      v55 = 133;
      v56 = 2114;
      v57 = v30;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      if (!v15)
        goto LABEL_30;
    }
    else if (!v15)
    {
      goto LABEL_30;
    }
    (*((void (**)(id, _QWORD, _QWORD))v15 + 2))(v15, 0, 0);
    goto LABEL_36;
  }
  v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "puzzleTypeIDs != nil");
  *(_DWORD *)buf = 136315906;
  v51 = "-[FCPuzzleTypeController _fetchPuzzleTypesForPuzzleTypeIDs:cachePolicy:qualityOfService:callbackQueue:completionHandler:]";
  v52 = 2080;
  v53 = "FCPuzzleTypeController.m";
  v54 = 1024;
  v55 = 132;
  v56 = 2114;
  v57 = v29;
  _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  if (!v14)
    goto LABEL_26;
LABEL_4:
  if (v15)
  {
    if (objc_msgSend(v12, "count"))
    {
      if (v13)
      {
        v47[0] = MEMORY[0x1E0C809B0];
        v47[1] = 3221225472;
        v47[2] = __121__FCPuzzleTypeController__fetchPuzzleTypesForPuzzleTypeIDs_cachePolicy_qualityOfService_callbackQueue_completionHandler___block_invoke_5;
        v47[3] = &unk_1E46482A0;
        v47[4] = self;
        v47[5] = v12;
        v47[6] = v13;
        v47[7] = v14;
        v47[8] = v15;
        v47[9] = a5;
        __121__FCPuzzleTypeController__fetchPuzzleTypesForPuzzleTypeIDs_cachePolicy_qualityOfService_callbackQueue_completionHandler___block_invoke_5((uint64_t)v47);
      }
      else
      {
        v33 = a5;
        v35 = v15;
        queue = v14;
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = 0u;
        v44 = 0u;
        v45 = 0u;
        v46 = 0u;
        v34 = v12;
        v18 = v12;
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
        if (v19)
        {
          v20 = v19;
          v21 = *(_QWORD *)v44;
          do
          {
            for (i = 0; i != v20; ++i)
            {
              if (*(_QWORD *)v44 != v21)
                objc_enumerationMutation(v18);
              v23 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * i);
              -[FCPuzzleTypeController fastCache](self, "fastCache");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "objectForKey:", v23);
              v25 = (void *)objc_claimAutoreleasedReturnValue();

              if (v25)
                objc_msgSend(v16, "setObject:forKey:", v25, v23);
              else
                objc_msgSend(v17, "addObject:", v23);

            }
            v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
          }
          while (v20);
        }

        if (objc_msgSend(v17, "count"))
        {
          -[FCPuzzleTypeController _fetchOperationForPuzzleTypeWithIDs:](self, "_fetchOperationForPuzzleTypeWithIDs:", v17);
          v26 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "setQualityOfService:", v33);
          v15 = v35;
          v14 = queue;
          if (v33 == 9)
            v27 = -1;
          else
            v27 = v33 == 33 || v33 == 25;
          v13 = 0;
          v12 = v34;
          objc_msgSend(v26, "setRelativePriority:", v27);
          objc_msgSend(v26, "setFetchCompletionQueue:", queue);
          v40[0] = MEMORY[0x1E0C809B0];
          v40[1] = 3221225472;
          v40[2] = __121__FCPuzzleTypeController__fetchPuzzleTypesForPuzzleTypeIDs_cachePolicy_qualityOfService_callbackQueue_completionHandler___block_invoke_8;
          v40[3] = &unk_1E463B768;
          v41 = v16;
          v42 = v35;
          v28 = v16;
          objc_msgSend(v26, "setFetchCompletionBlock:", v40);
          objc_msgSend(MEMORY[0x1E0CB3828], "fc_sharedConcurrentQueue");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "addOperation:", v26);

        }
        else
        {
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __121__FCPuzzleTypeController__fetchPuzzleTypesForPuzzleTypeIDs_cachePolicy_qualityOfService_callbackQueue_completionHandler___block_invoke_10;
          block[3] = &unk_1E463B790;
          v38 = v16;
          v15 = v35;
          v39 = v35;
          v26 = v16;
          v14 = queue;
          dispatch_async(queue, block);

          v28 = v38;
          v13 = 0;
          v12 = v34;
        }

      }
    }
    else
    {
      v48[0] = MEMORY[0x1E0C809B0];
      v48[1] = 3221225472;
      v48[2] = __121__FCPuzzleTypeController__fetchPuzzleTypesForPuzzleTypeIDs_cachePolicy_qualityOfService_callbackQueue_completionHandler___block_invoke_3;
      v48[3] = &unk_1E463B2D0;
      v48[4] = v14;
      v48[5] = v15;
      __121__FCPuzzleTypeController__fetchPuzzleTypesForPuzzleTypeIDs_cachePolicy_qualityOfService_callbackQueue_completionHandler___block_invoke_3((uint64_t)v48);
    }
    goto LABEL_36;
  }
LABEL_30:
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "completionHandler != nil");
    *(_DWORD *)buf = 136315906;
    v51 = "-[FCPuzzleTypeController _fetchPuzzleTypesForPuzzleTypeIDs:cachePolicy:qualityOfService:callbackQueue:completionHandler:]";
    v52 = 2080;
    v53 = "FCPuzzleTypeController.m";
    v54 = 1024;
    v55 = 134;
    v56 = 2114;
    v57 = v31;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
LABEL_36:

}

void __121__FCPuzzleTypeController__fetchPuzzleTypesForPuzzleTypeIDs_cachePolicy_qualityOfService_callbackQueue_completionHandler___block_invoke_3(uint64_t a1)
{
  void *v1;
  NSObject *v2;
  _QWORD block[4];
  id v4;

  v1 = *(void **)(a1 + 40);
  if (v1)
  {
    v2 = *(NSObject **)(a1 + 32);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __121__FCPuzzleTypeController__fetchPuzzleTypesForPuzzleTypeIDs_cachePolicy_qualityOfService_callbackQueue_completionHandler___block_invoke_4;
    block[3] = &unk_1E463B598;
    v4 = v1;
    dispatch_async(v2, block);

  }
}

uint64_t __121__FCPuzzleTypeController__fetchPuzzleTypesForPuzzleTypeIDs_cachePolicy_qualityOfService_callbackQueue_completionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __121__FCPuzzleTypeController__fetchPuzzleTypesForPuzzleTypeIDs_cachePolicy_qualityOfService_callbackQueue_completionHandler___block_invoke_5(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  BOOL v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "_fetchOperationForPuzzleTypeWithIDs:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setQualityOfService:", *(_QWORD *)(a1 + 72));
  v3 = *(_QWORD *)(a1 + 72);
  v4 = v3 == 33 || v3 == 25;
  if (v3 == 9)
    v5 = -1;
  else
    v5 = v4;
  objc_msgSend(v2, "setRelativePriority:", v5);
  objc_msgSend(v2, "setCachePolicy:", objc_msgSend(*(id *)(a1 + 48), "cachePolicy"));
  objc_msgSend(*(id *)(a1 + 48), "maximumCachedAge");
  objc_msgSend(v2, "setMaximumCachedAge:");
  objc_msgSend(v2, "setFetchCompletionQueue:", *(_QWORD *)(a1 + 56));
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __121__FCPuzzleTypeController__fetchPuzzleTypesForPuzzleTypeIDs_cachePolicy_qualityOfService_callbackQueue_completionHandler___block_invoke_6;
  v7[3] = &unk_1E463B608;
  v8 = *(id *)(a1 + 64);
  objc_msgSend(v2, "setFetchCompletionBlock:", v7);
  objc_msgSend(MEMORY[0x1E0CB3828], "fc_sharedConcurrentQueue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addOperation:", v2);

}

void __121__FCPuzzleTypeController__fetchPuzzleTypesForPuzzleTypeIDs_cachePolicy_qualityOfService_callbackQueue_completionHandler___block_invoke_6(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v3 = (void *)MEMORY[0x1E0C99E08];
  v4 = a2;
  objc_msgSend(v4, "fetchedObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dictionaryWithDictionary:", v5);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "fc_removeObjectsForKeysPassingTest:", &__block_literal_global_19_0);
  v6 = *(_QWORD *)(a1 + 32);
  objc_msgSend(v4, "error");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(uint64_t, id, void *))(v6 + 16))(v6, v8, v7);
}

uint64_t __121__FCPuzzleTypeController__fetchPuzzleTypesForPuzzleTypeIDs_cachePolicy_qualityOfService_callbackQueue_completionHandler___block_invoke_7()
{
  return +[FCTagController isTagAllowedForNewsVersion:](FCTagController, "isTagAllowedForNewsVersion:") ^ 1;
}

void __121__FCPuzzleTypeController__fetchPuzzleTypesForPuzzleTypeIDs_cachePolicy_qualityOfService_callbackQueue_completionHandler___block_invoke_8(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a2;
  if (!objc_msgSend(v8, "status"))
  {
    objc_msgSend(v8, "fetchedObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
      objc_msgSend(*(id *)(a1 + 32), "addEntriesFromDictionary:", v3);

  }
  objc_msgSend(*(id *)(a1 + 32), "fc_removeObjectsForKeysPassingTest:", &__block_literal_global_24_3);
  v6 = a1 + 32;
  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(v6 + 8);
  if (objc_msgSend(v4, "count"))
  {
    (*(void (**)(uint64_t, void *, _QWORD))(v5 + 16))(v5, v4, 0);
  }
  else
  {
    objc_msgSend(v8, "error");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, void *))(v5 + 16))(v5, v4, v7);

  }
}

uint64_t __121__FCPuzzleTypeController__fetchPuzzleTypesForPuzzleTypeIDs_cachePolicy_qualityOfService_callbackQueue_completionHandler___block_invoke_9()
{
  return +[FCTagController isTagAllowedForNewsVersion:](FCTagController, "isTagAllowedForNewsVersion:") ^ 1;
}

uint64_t __121__FCPuzzleTypeController__fetchPuzzleTypesForPuzzleTypeIDs_cachePolicy_qualityOfService_callbackQueue_completionHandler___block_invoke_10(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "fc_removeObjectsForKeysPassingTest:", &__block_literal_global_25_2);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __121__FCPuzzleTypeController__fetchPuzzleTypesForPuzzleTypeIDs_cachePolicy_qualityOfService_callbackQueue_completionHandler___block_invoke_11()
{
  return +[FCTagController isTagAllowedForNewsVersion:](FCTagController, "isTagAllowedForNewsVersion:") ^ 1;
}

- (void)fetchThumbnailUrlForPuzzle:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, void *, _QWORD);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  id v18;
  void (**v19)(id, void *, _QWORD);

  v6 = a3;
  v7 = (void (**)(id, void *, _QWORD))a4;
  v8 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v6, "puzzleType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("thumbnail-images-mapping-json-%@"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[FCPuzzleTypeController fastCache](self, "fastCache");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKey:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(v6, "publishDate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCPuzzleTypeController thumbnailSmallURLWithJSON:publishDate:](self, "thumbnailSmallURLWithJSON:publishDate:", v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
      v7[2](v7, v15, 0);

  }
  else
  {
    objc_msgSend(v6, "puzzleType");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __71__FCPuzzleTypeController_fetchThumbnailUrlForPuzzle_completionHandler___block_invoke;
    v17[3] = &unk_1E463B4B8;
    v17[4] = self;
    v18 = v6;
    v19 = v7;
    -[FCPuzzleTypeController fetchThumbnailJSONForPuzzleType:completionHandler:](self, "fetchThumbnailJSONForPuzzleType:completionHandler:", v16, v17);

  }
}

void __71__FCPuzzleTypeController_fetchThumbnailUrlForPuzzle_completionHandler___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  id v8;

  v3 = (void *)a1[4];
  v4 = (void *)a1[5];
  v5 = a2;
  objc_msgSend(v4, "publishDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "thumbnailSmallURLWithJSON:publishDate:", v5, v6);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  v7 = a1[6];
  if (v7)
    (*(void (**)(uint64_t, id, _QWORD))(v7 + 16))(v7, v8, 0);

}

- (void)fetchThumbnailJSONForPuzzleType:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, void *, _QWORD);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  FCResourcesFetchOperation *v14;
  void *v15;
  void *v16;
  FCResourcesFetchOperation *v17;
  _QWORD v18[5];
  id v19;
  void (**v20)(id, void *, _QWORD);
  _QWORD v21[5];
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, void *, _QWORD))a4;
  objc_msgSend(v6, "imageResourceID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v6, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("thumbnail-images-mapping-json-%@"), v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[FCPuzzleTypeController fastCache](self, "fastCache");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKey:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      if (v7)
        v7[2](v7, v13, 0);
    }
    else
    {
      v14 = [FCResourcesFetchOperation alloc];
      -[FCPuzzleTypeController context](self, "context");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v22[0] = v8;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[FCResourcesFetchOperation initWithContext:resourceIDs:downloadAssets:](v14, "initWithContext:resourceIDs:downloadAssets:", v15, v16, 1);

      -[FCFetchOperation setCachePolicy:](v17, "setCachePolicy:", 4);
      -[FCFetchOperation setMaximumCachedAge:](v17, "setMaximumCachedAge:", 604800.0);
      -[FCOperation setQualityOfService:](v17, "setQualityOfService:", 25);
      -[FCOperation setRelativePriority:](v17, "setRelativePriority:", 0);
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __76__FCPuzzleTypeController_fetchThumbnailJSONForPuzzleType_completionHandler___block_invoke_2;
      v18[3] = &unk_1E46482C8;
      v20 = v7;
      v18[4] = self;
      v19 = v11;
      -[FCFetchOperation setFetchCompletionBlock:](v17, "setFetchCompletionBlock:", v18);
      -[FCOperation start](v17, "start");

    }
  }
  else
  {
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __76__FCPuzzleTypeController_fetchThumbnailJSONForPuzzleType_completionHandler___block_invoke;
    v21[3] = &unk_1E463B598;
    v21[4] = v7;
    __76__FCPuzzleTypeController_fetchThumbnailJSONForPuzzleType_completionHandler___block_invoke((uint64_t)v21);
  }

}

void __76__FCPuzzleTypeController_fetchThumbnailJSONForPuzzleType_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB35C8];
  v6 = *MEMORY[0x1E0CB2D50];
  v7[0] = CFSTR("Image resourceID not available for the puzzle type.");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "errorWithDomain:code:userInfo:", CFSTR("FCErrorDomain"), 8, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, void *))(v5 + 16))(v5, 0, v4);

}

void __76__FCPuzzleTypeController_fetchThumbnailJSONForPuzzleType_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  id v18;
  _QWORD v19[5];
  _QWORD v20[5];
  _QWORD v21[5];
  _QWORD v22[5];
  _QWORD v23[5];
  _QWORD v24[6];

  v18 = a2;
  objc_msgSend(v18, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __76__FCPuzzleTypeController_fetchThumbnailJSONForPuzzleType_completionHandler___block_invoke_3;
    v24[3] = &unk_1E463B2D0;
    v4 = *(void **)(a1 + 48);
    v24[4] = v18;
    v24[5] = v4;
    v5 = v4;
    __76__FCPuzzleTypeController_fetchThumbnailJSONForPuzzleType_completionHandler___block_invoke_3((uint64_t)v24);
  }
  else
  {
    objc_opt_class();
    objc_opt_class();
    objc_msgSend(v18, "fetchedObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v7 = v6;
      else
        v7 = 0;
    }
    else
    {
      v7 = 0;
    }
    v8 = v7;
    objc_msgSend(v8, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v10 = v9;
      else
        v10 = 0;
    }
    else
    {
      v10 = 0;
    }
    v5 = v10;

    if (v5)
    {
      objc_msgSend(v5, "fileURL");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v12, 0, 0);
          v13 = (id)objc_claimAutoreleasedReturnValue();
          v14 = v13;
          if (v13)
          {
            objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("smallImages"));
            v15 = (id)objc_claimAutoreleasedReturnValue();
            if (v15)
            {
              objc_msgSend(*(id *)(a1 + 32), "fastCache");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "setObject:forKey:", v15, *(_QWORD *)(a1 + 40));

              v17 = *(_QWORD *)(a1 + 48);
              if (v17)
                (*(void (**)(uint64_t, id, _QWORD))(v17 + 16))(v17, v15, 0);
            }
            else
            {
              v19[0] = MEMORY[0x1E0C809B0];
              v19[1] = 3221225472;
              v19[2] = __76__FCPuzzleTypeController_fetchThumbnailJSONForPuzzleType_completionHandler___block_invoke_8;
              v19[3] = &unk_1E463B598;
              v19[4] = *(_QWORD *)(a1 + 48);
              __76__FCPuzzleTypeController_fetchThumbnailJSONForPuzzleType_completionHandler___block_invoke_8((uint64_t)v19);
            }

          }
          else
          {
            v20[0] = MEMORY[0x1E0C809B0];
            v20[1] = 3221225472;
            v20[2] = __76__FCPuzzleTypeController_fetchThumbnailJSONForPuzzleType_completionHandler___block_invoke_7;
            v20[3] = &unk_1E463B598;
            v20[4] = *(_QWORD *)(a1 + 48);
            __76__FCPuzzleTypeController_fetchThumbnailJSONForPuzzleType_completionHandler___block_invoke_7((uint64_t)v20);
          }

        }
        else
        {
          v21[0] = MEMORY[0x1E0C809B0];
          v21[1] = 3221225472;
          v21[2] = __76__FCPuzzleTypeController_fetchThumbnailJSONForPuzzleType_completionHandler___block_invoke_6;
          v21[3] = &unk_1E463B598;
          v21[4] = *(_QWORD *)(a1 + 48);
          __76__FCPuzzleTypeController_fetchThumbnailJSONForPuzzleType_completionHandler___block_invoke_6((uint64_t)v21);
        }

      }
      else
      {
        v22[0] = MEMORY[0x1E0C809B0];
        v22[1] = 3221225472;
        v22[2] = __76__FCPuzzleTypeController_fetchThumbnailJSONForPuzzleType_completionHandler___block_invoke_5;
        v22[3] = &unk_1E463B598;
        v22[4] = *(_QWORD *)(a1 + 48);
        __76__FCPuzzleTypeController_fetchThumbnailJSONForPuzzleType_completionHandler___block_invoke_5((uint64_t)v22);
      }

    }
    else
    {
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __76__FCPuzzleTypeController_fetchThumbnailJSONForPuzzleType_completionHandler___block_invoke_4;
      v23[3] = &unk_1E463B598;
      v23[4] = *(_QWORD *)(a1 + 48);
      __76__FCPuzzleTypeController_fetchThumbnailJSONForPuzzleType_completionHandler___block_invoke_4((uint64_t)v23);
    }
  }

}

void __76__FCPuzzleTypeController_fetchThumbnailJSONForPuzzleType_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  if (v1)
  {
    objc_msgSend(*(id *)(a1 + 32), "error");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

  }
}

void __76__FCPuzzleTypeController_fetchThumbnailJSONForPuzzleType_completionHandler___block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB35C8];
  v6 = *MEMORY[0x1E0CB2D50];
  v7[0] = CFSTR("Resource object not found in fetched object.");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "errorWithDomain:code:userInfo:", CFSTR("FCErrorDomain"), 8, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, void *))(v5 + 16))(v5, 0, v4);

}

void __76__FCPuzzleTypeController_fetchThumbnailJSONForPuzzleType_completionHandler___block_invoke_5(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB35C8];
  v6 = *MEMORY[0x1E0CB2D50];
  v7[0] = CFSTR("File URL not available in fetched resource.");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "errorWithDomain:code:userInfo:", CFSTR("FCErrorDomain"), 8, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, void *))(v5 + 16))(v5, 0, v4);

}

void __76__FCPuzzleTypeController_fetchThumbnailJSONForPuzzleType_completionHandler___block_invoke_6(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB35C8];
  v6 = *MEMORY[0x1E0CB2D50];
  v7[0] = CFSTR("Data not be created with contents of fetched resource's file path.");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "errorWithDomain:code:userInfo:", CFSTR("FCErrorDomain"), 8, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, void *))(v5 + 16))(v5, 0, v4);

}

void __76__FCPuzzleTypeController_fetchThumbnailJSONForPuzzleType_completionHandler___block_invoke_7(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB35C8];
  v6 = *MEMORY[0x1E0CB2D50];
  v7[0] = CFSTR("Images mapping json dictionary not available from contents of fetched resource's file path.");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "errorWithDomain:code:userInfo:", CFSTR("FCErrorDomain"), 8, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, void *))(v5 + 16))(v5, 0, v4);

}

void __76__FCPuzzleTypeController_fetchThumbnailJSONForPuzzleType_completionHandler___block_invoke_8(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB35C8];
  v6 = *MEMORY[0x1E0CB2D50];
  v7[0] = CFSTR("Small Images mapping json dictionary not available from the contents of fetched resource's file path.");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "errorWithDomain:code:userInfo:", CFSTR("FCErrorDomain"), 8, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, void *))(v5 + 16))(v5, 0, v4);

}

- (id)thumbnailSmallURLWithJSON:(id)a3 publishDate:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v15[4];
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v5 = a3;
  v6 = a4;
  v7 = objc_alloc(MEMORY[0x1E0C99D48]);
  v8 = (void *)objc_msgSend(v7, "initWithCalendarIdentifier:", *MEMORY[0x1E0C996C8]);
  objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithAbbreviation:", CFSTR("EST"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTimeZone:", v9);

  v10 = objc_msgSend(v8, "component:fromDate:", 512, v6);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("s%ld"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__61;
  v22 = __Block_byref_object_dispose__61;
  v23 = 0;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __64__FCPuzzleTypeController_thumbnailSmallURLWithJSON_publishDate___block_invoke;
  v15[3] = &unk_1E46482F0;
  v12 = v11;
  v16 = v12;
  v17 = &v18;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v15);
  v13 = (id)v19[5];

  _Block_object_dispose(&v18, 8);
  return v13;
}

void __64__FCPuzzleTypeController_thumbnailSmallURLWithJSON_publishDate___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a3;
  if (objc_msgSend(a2, "isEqualToString:", *(_QWORD *)(a1 + 32)))
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("defaultUrl"));
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

    *a4 = 1;
  }

}

- (id)_cachedPuzzleTypeForPuzzleTypeID:(id)a3 fastCacheOnly:(BOOL)a4
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
    -[FCPuzzleTypeController _cachedPuzzleTypesForPuzzleTypeIDs:fastCacheOnly:](self, "_cachedPuzzleTypesForPuzzleTypeIDs:fastCacheOnly:", v8, v4);
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
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "puzzleTypeID != nil");
      *(_DWORD *)buf = 136315906;
      v16 = "-[FCPuzzleTypeController _cachedPuzzleTypeForPuzzleTypeID:fastCacheOnly:]";
      v17 = 2080;
      v18 = "FCPuzzleTypeController.m";
      v19 = 1024;
      v20 = 380;
      v21 = 2114;
      v22 = v13;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    }
    v11 = 0;
  }

  return v11;
}

- (id)_cachedPuzzleTypesForPuzzleTypeIDs:(id)a3 fastCacheOnly:(BOOL)a4
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
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "puzzleTypeIDs != nil");
    *(_DWORD *)buf = 136315906;
    v30 = "-[FCPuzzleTypeController _cachedPuzzleTypesForPuzzleTypeIDs:fastCacheOnly:]";
    v31 = 2080;
    v32 = "FCPuzzleTypeController.m";
    v33 = 1024;
    v34 = 387;
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
        -[FCPuzzleTypeController fastCache](self, "fastCache");
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
    -[FCPuzzleTypeController puzzleTypeRecordSource](self, "puzzleTypeRecordSource");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "cachedRecordsWithIDs:", v7);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __75__FCPuzzleTypeController__cachedPuzzleTypesForPuzzleTypeIDs_fastCacheOnly___block_invoke;
    v22[3] = &unk_1E4648318;
    v22[4] = self;
    v23 = v6;
    objc_msgSend(v17, "enumerateRecordsAndInterestTokensWithBlock:", v22);

  }
  objc_msgSend(v6, "allValues");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCPuzzleTypeController _refreshPuzzleTypesBasedOnAgeForPuzzleTypes:](self, "_refreshPuzzleTypesBasedOnAgeForPuzzleTypes:", v18);

  return v6;
}

void __75__FCPuzzleTypeController__cachedPuzzleTypesForPuzzleTypeIDs_fastCacheOnly___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  FCPuzzleType *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  FCPuzzleType *v12;

  v5 = a3;
  v6 = a2;
  v7 = [FCPuzzleType alloc];
  objc_msgSend(*(id *)(a1 + 32), "assetManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[FCPuzzleType initWithPuzzleTypeRecord:assetManager:context:interestToken:](v7, "initWithPuzzleTypeRecord:assetManager:context:interestToken:", v6, v8, v9, v5);

  v10 = *(void **)(a1 + 40);
  -[FCPuzzleType identifier](v12, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKey:", v12, v11);

}

- (void)_refreshPuzzleTypesBasedOnAgeForPuzzleTypes:(id)a3
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
  FCPuzzleTypeController *v16;
  id obj;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v16 = self;
  v23 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v9, "loadDate", v16);
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
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v6);
  }

  if (objc_msgSend(v4, "count"))
  {
    -[FCPuzzleTypeController _fetchOperationForPuzzleTypeWithIDs:](v16, "_fetchOperationForPuzzleTypeWithIDs:", v4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setQualityOfService:", 17);
    objc_msgSend(v15, "setRelativePriority:", -1);
    objc_msgSend(v15, "setCachePolicy:", 1);
    objc_msgSend(v15, "start");

  }
}

- (void)_savePuzzleTypesToCache:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[FCPuzzleTypeController fastCache](self, "fastCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __50__FCPuzzleTypeController__savePuzzleTypesToCache___block_invoke;
  v7[3] = &unk_1E4648340;
  v8 = v5;
  v6 = v5;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v7);

}

void __50__FCPuzzleTypeController__savePuzzleTypesToCache___block_invoke(uint64_t a1, void *a2)
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

  -[FCPuzzleTypeController puzzleTypeRecordSource](self, "puzzleTypeRecordSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "jsonEncodableObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_fetchOperationForPuzzleTypeWithIDs:(id)a3
{
  id v4;
  FCPuzzleTypeFetchOperation *v5;
  void *v6;
  void *v7;
  void *v8;
  FCPuzzleTypeFetchOperation *v9;

  v4 = a3;
  v5 = [FCPuzzleTypeFetchOperation alloc];
  -[FCPuzzleTypeController puzzleTypeRecordSource](self, "puzzleTypeRecordSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCPuzzleTypeController assetManager](self, "assetManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCPuzzleTypeController context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[FCPuzzleTypeFetchOperation initWithPuzzleTypeIDs:puzzleTypeRecordSource:assetManager:context:delegate:](v5, "initWithPuzzleTypeIDs:puzzleTypeRecordSource:assetManager:context:delegate:", v4, v6, v7, v8, self);

  return v9;
}

- (void)puzzleTypeFetchOperation:(id)a3 didFetchPuzzleTypes:(id)a4
{
  -[FCPuzzleTypeController _savePuzzleTypesToCache:](self, "_savePuzzleTypesToCache:", a4);
}

- (FCAssetManager)assetManager
{
  return self->_assetManager;
}

- (void)setAssetManager:(id)a3
{
  objc_storeStrong((id *)&self->_assetManager, a3);
}

- (FCContentContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (FCPuzzleTypeRecordSource)puzzleTypeRecordSource
{
  return self->_puzzleTypeRecordSource;
}

- (void)setPuzzleTypeRecordSource:(id)a3
{
  objc_storeStrong((id *)&self->_puzzleTypeRecordSource, a3);
}

- (NSCache)fastCache
{
  return self->_fastCache;
}

- (void)setFastCache:(id)a3
{
  objc_storeStrong((id *)&self->_fastCache, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fastCache, 0);
  objc_storeStrong((id *)&self->_puzzleTypeRecordSource, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_assetManager, 0);
}

@end
