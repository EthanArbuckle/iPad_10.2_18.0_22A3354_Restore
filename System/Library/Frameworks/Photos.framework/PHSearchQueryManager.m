@implementation PHSearchQueryManager

- (void)performSearch:(id)a3 resultsHandler:(id)a4
{
  id v7;
  id v8;
  void *v9;
  PHSearchQueryOptions *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHSearchQueryManager+SPI.m"), 18, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("searchText"));

    if (v9)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHSearchQueryManager+SPI.m"), 19, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("resultsHandler"));

    goto LABEL_3;
  }
  if (!v8)
    goto LABEL_5;
LABEL_3:
  v10 = objc_alloc_init(PHSearchQueryOptions);
  -[PHSearchQueryOptions setSuggestionLimit:](v10, "setSuggestionLimit:", 5);
  -[PHSearchQueryOptions setEnableQueryMatchDetails:](v10, "setEnableQueryMatchDetails:", 1);
  -[PHSearchQueryOptions setMaxRankedAssetSearchResults:](v10, "setMaxRankedAssetSearchResults:", 10);
  -[PHSearchQueryOptions setMaxRankedCollectionSearchResults:](v10, "setMaxRankedCollectionSearchResults:", 10);
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v7);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __58__PHSearchQueryManager_SPI__performSearch_resultsHandler___block_invoke;
  v15[3] = &unk_1E35DA8C8;
  v16 = v9;
  v12 = v9;
  -[PHSearchQueryManager performSearch:searchOptions:resultsHandler:](self, "performSearch:searchOptions:resultsHandler:", v11, v10, v15);

}

void __58__PHSearchQueryManager_SPI__performSearch_resultsHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  id v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t v35[128];
  uint8_t buf[4];
  void *v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v25 = a4;
  v6 = (void *)objc_opt_new();
  v7 = (void *)objc_opt_new();
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v26 = v5;
  objc_msgSend(v5, "searchResults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v31, v38, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v32 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        v14 = objc_msgSend(v13, "type");
        if ((unint64_t)(v14 - 2) < 3)
        {
          objc_msgSend(v13, "uuid");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v15);

LABEL_11:
          PLSearchBackendQueryGetLog();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v37 = v13;
            _os_log_impl(&dword_1991EC000, v16, OS_LOG_TYPE_ERROR, "Encountered result result with undefined type: %@", buf, 0xCu);
          }
          goto LABEL_13;
        }
        if (!v14)
          goto LABEL_11;
        if (v14 != 1)
          continue;
        objc_msgSend(v13, "uuid");
        v16 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v16);
LABEL_13:

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v31, v38, 16);
    }
    while (v10);
  }

  v17 = (void *)objc_opt_new();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  objc_msgSend(v26, "rankedAssetSearchResults");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v28;
    do
    {
      for (j = 0; j != v20; ++j)
      {
        if (*(_QWORD *)v28 != v21)
          objc_enumerationMutation(v18);
        objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * j), "uuid");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "addObject:", v23);

      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    }
    while (v20);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (PHSearchQueryManager)initWithPhotoLibrary:(id)a3
{
  id v6;
  PHSearchQueryManager *v7;
  PHSearchQueryManager *v8;
  NSMutableDictionary *v9;
  NSMutableDictionary *queryLock_batchQueriesInProgress;
  NSObject *v11;
  NSObject *v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *queryQueue;
  NSObject *v15;
  NSObject *v16;
  dispatch_queue_t v17;
  OS_dispatch_queue *batchQueryQueue;
  void *v20;
  objc_super v21;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHSearchQueryManager.m"), 63, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("photoLibrary"));

  }
  v21.receiver = self;
  v21.super_class = (Class)PHSearchQueryManager;
  v7 = -[PHSearchQueryManager init](&v21, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_photoLibrary, a3);
    v8->_spotlightSandboxExtensionHandle = -1;
    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    queryLock_batchQueriesInProgress = v8->_queryLock_batchQueriesInProgress;
    v8->_queryLock_batchQueriesInProgress = v9;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v11, QOS_CLASS_USER_INITIATED, 0);
    v12 = objc_claimAutoreleasedReturnValue();

    v13 = dispatch_queue_create("com.apple.photos.search.query_execution", v12);
    queryQueue = v8->_queryQueue;
    v8->_queryQueue = (OS_dispatch_queue *)v13;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v15 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v15, QOS_CLASS_USER_INITIATED, 0);
    v16 = objc_claimAutoreleasedReturnValue();

    v17 = dispatch_queue_create("com.apple.photos.search.query_execution", v16);
    batchQueryQueue = v8->_batchQueryQueue;
    v8->_batchQueryQueue = (OS_dispatch_queue *)v17;

    v8->_queryLock._os_unfair_lock_opaque = 0;
  }

  return v8;
}

- (id)initForTestingWithPhotoLibrary:(id)a3
{
  PHSearchQueryManager *v3;

  v3 = -[PHSearchQueryManager initWithPhotoLibrary:](self, "initWithPhotoLibrary:", a3);
  -[PHSearchQueryManager setIsTestingConfiguration:](v3, "setIsTestingConfiguration:", 1);
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  -[PHSearchQueryManager _releaseSpotlightSandboxExtension](self, "_releaseSpotlightSandboxExtension");
  v3.receiver = self;
  v3.super_class = (Class)PHSearchQueryManager;
  -[PHSearchQueryManager dealloc](&v3, sel_dealloc);
}

- (void)preheatSearch
{
  void *v3;
  NSObject *v4;
  id v5;
  dispatch_block_t v6;
  _QWORD block[4];
  id v8;

  -[PHSearchQueryManager photoLibrary](self, "photoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHSearchQueryManager queryQueue](self, "queryQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__PHSearchQueryManager_preheatSearch__block_invoke;
  block[3] = &unk_1E35DF110;
  v8 = v3;
  v5 = v3;
  v6 = dispatch_block_create(DISPATCH_BLOCK_DETACHED, block);
  dispatch_async(v4, v6);

}

- (int)performSearch:(id)a3 searchOptions:(id)a4 resultsHandler:(id)a5
{
  id v9;
  id v10;
  void *v11;
  PHSearchQuery *v12;
  void *v13;
  PHSearchQuery *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  NSObject *v18;
  id v19;
  NSObject *v20;
  os_signpost_id_t v21;
  NSObject *v22;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  int v28;
  NSObject *v29;
  void *v30;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  _QWORD v37[4];
  NSObject *v38;
  id v39;
  id v40;
  NSObject *v41;
  os_signpost_id_t v42;
  int v43;
  id location;
  _QWORD block[4];
  PHSearchQuery *v46;
  id v47;
  uint8_t buf[4];
  void *v49;
  __int16 v50;
  id v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v36 = a4;
  v10 = a5;
  if (!v9)
  {
    v32 = v10;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHSearchQueryManager.m"), 131, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("searchText"));

    v10 = v32;
  }
  v35 = v10;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHSearchQueryManager.m"), 132, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("resultsHandler"), 0);

  }
  -[PHSearchQueryManager currentSearchQuery](self, "currentSearchQuery");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "cancel");

  -[PHSearchQueryManager setCurrentQueryId:](self, "setCurrentQueryId:", -[PHSearchQueryManager currentQueryId](self, "currentQueryId") + 1);
  v12 = [PHSearchQuery alloc];
  -[PHSearchQueryManager photoLibrary](self, "photoLibrary");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[PHSearchQuery initWithSearchText:searchOptions:photoLibrary:queryIdentifier:batchIdentifier:](v12, "initWithSearchText:searchOptions:photoLibrary:queryIdentifier:batchIdentifier:", v9, v36, v13, -[PHSearchQueryManager currentQueryId](self, "currentQueryId"), 0);

  -[PHSearchQueryManager setCurrentSearchQuery:](self, "setCurrentSearchQuery:", v14);
  v15 = -[PHSearchQuery queryIdentifier](v14, "queryIdentifier");
  objc_msgSend(v36, "resultsHandlerQueue");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v16)
  {
    v18 = v16;
  }
  else
  {
    v18 = MEMORY[0x1E0C80D38];
    v19 = MEMORY[0x1E0C80D38];
  }

  if ((objc_msgSend((id)objc_opt_class(), "_isValidQueryText:", v9) & 1) != 0)
  {
    -[PHSearchQueryManager _acquireSpotlightSandboxExtensionIfNeeded](self, "_acquireSpotlightSandboxExtensionIfNeeded");
    objc_initWeak(&location, self);
    PLPhotosSearchGetLog();
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = os_signpost_id_generate(v20);
    v22 = v20;
    v23 = v22;
    if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1991EC000, v23, OS_SIGNPOST_INTERVAL_BEGIN, v21, "PLSearchBackendQuery", ", buf, 2u);
    }

    PLSearchBackendQueryGetLog();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[Query: %d]"), v15);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v49 = v25;
      _os_log_impl(&dword_1991EC000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@ ----- BEGIN SEARCH -----", buf, 0xCu);

    }
    -[PHSearchQueryManager queryQueue](self, "queryQueue");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3254779904;
    v37[2] = __67__PHSearchQueryManager_performSearch_searchOptions_resultsHandler___block_invoke_40;
    v37[3] = &unk_1E35D5190;
    v27 = v23;
    v41 = v27;
    v42 = v21;
    v43 = v15;
    objc_copyWeak(&v40, &location);
    v39 = v35;
    v38 = v18;
    +[PHSearchQuery performSearch:queryQueue:resultsHandler:](PHSearchQuery, "performSearch:queryQueue:resultsHandler:", v14, v26, v37);

    v28 = -[PHSearchQueryManager currentQueryId](self, "currentQueryId");
    objc_destroyWeak(&v40);

    objc_destroyWeak(&location);
  }
  else
  {
    PLSearchBackendQueryGetLog();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[Query: %d]"), v15);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v49 = v30;
      v50 = 2112;
      v51 = v9;
      _os_log_impl(&dword_1991EC000, v29, OS_LOG_TYPE_DEFAULT, "%{public}@ Query is invalid, returning early: %@.", buf, 0x16u);

    }
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __67__PHSearchQueryManager_performSearch_searchOptions_resultsHandler___block_invoke;
    block[3] = &unk_1E35DF368;
    v47 = v35;
    v46 = v14;
    dispatch_async(v18, block);
    v28 = -[PHSearchQueryManager currentQueryId](self, "currentQueryId");

  }
  return v28;
}

- (int)performBatchSearch:(id)a3 searchOptions:(id)a4 resultsHandler:(id)a5
{
  id v9;
  id v10;
  NSObject *v11;
  int v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  int v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _BOOL4 v29;
  void *v30;
  NSObject *v31;
  int v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  int v37;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  NSObject *v45;
  void *v46;
  void *v47;
  os_signpost_id_t spid;
  id v49;
  void *v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  _QWORD v54[6];
  id v55;
  id v56;
  id v57;
  uint8_t *v58;
  uint64_t *v59;
  id v60[2];
  NSObject *v61;
  os_signpost_id_t v62;
  int v63;
  id location;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  uint64_t v69;
  uint64_t v70;
  void (*v71)(_QWORD *);
  void *v72;
  PHSearchQueryManager *v73;
  id v74;
  uint64_t *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t (*v78)(uint64_t);
  void *v79;
  PHSearchQueryManager *v80;
  uint64_t *v81;
  uint64_t v82;
  uint64_t *v83;
  uint64_t v84;
  int v85;
  uint8_t v86[4];
  uint64_t v87;
  __int16 v88;
  void *v89;
  uint8_t v90[128];
  uint8_t buf[8];
  uint8_t *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;

  v95 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v49 = a4;
  v10 = a5;
  v41 = v9;
  v47 = v10;
  if (objc_msgSend(v9, "count"))
  {
    if (v10)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHSearchQueryManager.m"), 196, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("searchTexts.count > 0"));

    if (v47)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHSearchQueryManager.m"), 197, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("resultsHandler"));

LABEL_3:
  v82 = 0;
  v83 = &v82;
  v84 = 0x2020000000;
  v85 = 0;
  v76 = MEMORY[0x1E0C809B0];
  v77 = 3221225472;
  v78 = __72__PHSearchQueryManager_performBatchSearch_searchOptions_resultsHandler___block_invoke;
  v79 = &unk_1E35DF920;
  v80 = self;
  v81 = &v82;
  PLRunWithUnfairLock();
  -[PHSearchQueryManager _acquireSpotlightSandboxExtensionIfNeeded](self, "_acquireSpotlightSandboxExtensionIfNeeded");
  PLSearchBackendQueryGetLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = *((_DWORD *)v83 + 6);
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = v12;
    _os_log_impl(&dword_1991EC000, v11, OS_LOG_TYPE_DEFAULT, "[Batch: %d] ----- BEGIN BATCH SEARCH -----", buf, 8u);
  }

  PLPhotosSearchGetLog();
  v13 = (id)objc_claimAutoreleasedReturnValue();
  spid = os_signpost_id_generate(v13);

  v14 = v13;
  v15 = v14;
  if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1991EC000, v15, OS_SIGNPOST_INTERVAL_BEGIN, spid, "PLSearchBackendBatchQuery", ", buf, 2u);
  }

  -[PHSearchQueryManager _searchQueriesFromSearchTexts:searchOptions:batchQueryID:](self, "_searchQueriesFromSearchTexts:searchOptions:batchQueryID:", v9, v49, *((unsigned int *)v83 + 6));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = (void *)objc_msgSend(v16, "count");
  *(_QWORD *)buf = 0;
  v92 = buf;
  v93 = 0x2020000000;
  v94 = 0;
  v69 = MEMORY[0x1E0C809B0];
  v70 = 3221225472;
  v71 = __72__PHSearchQueryManager_performBatchSearch_searchOptions_resultsHandler___block_invoke_46;
  v72 = &unk_1E35DEE50;
  v73 = self;
  v75 = &v82;
  v74 = v16;
  PLRunWithUnfairLock();
  v67 = 0u;
  v68 = 0u;
  v65 = 0u;
  v66 = 0u;
  v17 = v74;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v65, v90, 16);
  if (v18)
  {
    v52 = *(_QWORD *)v66;
    v44 = v17;
    v45 = v15;
    do
    {
      v53 = v18;
      for (i = 0; i != v53; ++i)
      {
        if (*(_QWORD *)v66 != v52)
          objc_enumerationMutation(v17);
        v20 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * i);
        v21 = objc_msgSend(v20, "queryIdentifier");
        PLSearchBackendQueryGetLog();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          v23 = *((_DWORD *)v83 + 6);
          if (v23)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[Batch: %d | Query: %d]"), *((unsigned int *)v83 + 6), v21);
            v24 = objc_claimAutoreleasedReturnValue();
            v51 = (void *)v24;
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[Query: %d]"), v21);
            v24 = objc_claimAutoreleasedReturnValue();
            v50 = (void *)v24;
          }
          objc_msgSend(v20, "searchText");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "string");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v86 = 138543618;
          v87 = v24;
          v88 = 2112;
          v89 = v26;
          _os_log_impl(&dword_1991EC000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@ Begin query: \"%@\", v86, 0x16u);

          v17 = v44;
          v15 = v45;

          v27 = v51;
          if (!v23)
            v27 = v50;

        }
        objc_initWeak(&location, self);
        objc_msgSend(v20, "searchText");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(v28, "length") == 0;

        if (v29)
        {
          PLSearchBackendQueryGetLog();
          v31 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            v32 = *((_DWORD *)v83 + 6);
            if (v32)
            {
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[Batch: %d | Query: %d]"), *((unsigned int *)v83 + 6), v21);
              v33 = objc_claimAutoreleasedReturnValue();
              v34 = (void *)v33;
              v35 = v43;
            }
            else
            {
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[Query: %d]"), v21);
              v33 = objc_claimAutoreleasedReturnValue();
              v35 = (void *)v33;
              v34 = v42;
            }
            *(_DWORD *)v86 = 138543362;
            v87 = v33;
            _os_log_impl(&dword_1991EC000, v31, OS_LOG_TYPE_DEFAULT, "%{public}@ Encountered empty query, moving on to next query.", v86, 0xCu);
            v42 = v34;
            v43 = v35;
            if (v32)
              v36 = v34;
            else
              v36 = v35;

          }
          ++*((_QWORD *)v92 + 3);
        }
        else
        {
          -[PHSearchQueryManager batchQueryQueue](self, "batchQueryQueue");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v54[0] = MEMORY[0x1E0C809B0];
          v54[1] = 3254779904;
          v54[2] = __72__PHSearchQueryManager_performBatchSearch_searchOptions_resultsHandler___block_invoke_50;
          v54[3] = &unk_1E35D5120;
          v59 = &v82;
          v63 = v21;
          v58 = buf;
          v54[4] = v20;
          objc_copyWeak(v60, &location);
          v60[1] = v46;
          v54[5] = self;
          v61 = v15;
          v62 = spid;
          v55 = v17;
          v57 = v47;
          v56 = v49;
          +[PHSearchQuery performSearch:queryQueue:resultsHandler:](PHSearchQuery, "performSearch:queryQueue:resultsHandler:", v20, v30, v54);

          objc_destroyWeak(v60);
        }
        objc_destroyWeak(&location);
      }
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v65, v90, 16);
    }
    while (v18);
  }

  v37 = *((_DWORD *)v83 + 6);
  _Block_object_dispose(buf, 8);

  _Block_object_dispose(&v82, 8);
  return v37;
}

- (int)suggestionsForSearchQuery:(id)a3 rangeOfSuggestionText:(_NSRange)a4 searchQueryResult:(id)a5 suggestionsHandler:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  PHSearchQuery *v23;
  void *v24;
  uint64_t v25;
  NSObject *v26;
  os_signpost_id_t v27;
  NSObject *v28;
  NSObject *v29;
  void *v30;
  NSObject *v31;
  id v32;
  id v33;
  int v34;
  NSObject *v35;
  NSObject *v36;
  void *v37;
  uint64_t v38;
  const __CFString *v39;
  void *v40;
  uint64_t v41;
  const __CFString *v42;
  void *v44;
  NSObject *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v50;
  id v51;
  _QWORD v52[4];
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  NSObject *v58;
  os_signpost_id_t v59;
  int v60;
  int v61;
  uint8_t buf[16];
  _BYTE location[12];
  __int16 v64;
  const __CFString *v65;
  __int16 v66;
  id v67;
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v51 = a3;
  v10 = a5;
  v11 = a6;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHSearchQueryManager.m"), 283, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("suggestionsHandler"));

  }
  -[PHSearchQueryManager currentSearchQuery](self, "currentSearchQuery");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "cancel");

  objc_msgSend(v10, "searchQuery");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "queryIdentifier");

  objc_msgSend(v10, "searchQuery");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "batchIdentifier");

  v17 = objc_msgSend(v51, "length");
  if (v10 && v17)
  {
    +[PHSearchQueryAnnotation selectedSuggestionsFromQueryString:inRange:](PHSearchQueryAnnotation, "selectedSuggestionsFromQueryString:inRange:", v51, a4.location, a4.length);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v50, "count") == 1)
    {
      -[PHSearchQueryManager setCurrentQueryId:](self, "setCurrentQueryId:", -[PHSearchQueryManager currentQueryId](self, "currentQueryId") + 1);
      objc_msgSend(v10, "searchQuery");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "searchOptions");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)objc_msgSend(v19, "copy");

      objc_msgSend(v20, "setLimitSuggestionsToExactTextMatches:", 1);
      objc_msgSend(v50, "firstObject");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_alloc(MEMORY[0x1E0CB3498]);
      objc_msgSend(v47, "text");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = (void *)objc_msgSend(v21, "initWithString:", v22);

      v23 = [PHSearchQuery alloc];
      -[PHSearchQueryManager photoLibrary](self, "photoLibrary");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = -[PHSearchQuery initWithSearchText:searchOptions:photoLibrary:queryIdentifier:batchIdentifier:](v23, "initWithSearchText:searchOptions:photoLibrary:queryIdentifier:batchIdentifier:", v48, v20, v24, -[PHSearchQueryManager currentQueryId](self, "currentQueryId"), 0);

      v46 = (void *)v25;
      -[PHSearchQueryManager setCurrentSearchQuery:](self, "setCurrentSearchQuery:", v25);
      objc_initWeak((id *)location, self);
      PLPhotosSearchGetLog();
      v26 = (id)objc_claimAutoreleasedReturnValue();
      v27 = os_signpost_id_generate(v26);

      v28 = v26;
      v29 = v28;
      if (v27 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v28))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1991EC000, v29, OS_SIGNPOST_INTERVAL_BEGIN, v27, "PLSearchBackendSuggestionsQuery", ", buf, 2u);
      }
      v45 = v29;

      -[PHSearchQueryManager queryQueue](self, "queryQueue");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v52[0] = MEMORY[0x1E0C809B0];
      v52[1] = 3254779904;
      v52[2] = __109__PHSearchQueryManager_suggestionsForSearchQuery_rangeOfSuggestionText_searchQueryResult_suggestionsHandler___block_invoke;
      v52[3] = &unk_1E35D5270;
      v31 = v45;
      v58 = v31;
      v59 = v27;
      v60 = v14;
      objc_copyWeak(&v57, (id *)location);
      v53 = v10;
      v61 = v16;
      v32 = v48;
      v54 = v32;
      v56 = v11;
      v33 = v20;
      v55 = v33;
      +[PHSearchQuery suggestionsForSearchQuery:searchQueryResult:rangeOfSuggestionText:queryQueue:suggestionsHandler:](PHSearchQuery, "suggestionsForSearchQuery:searchQueryResult:rangeOfSuggestionText:queryQueue:suggestionsHandler:", v46, v53, a4.location, a4.length, v30, v52);

      v34 = -[PHSearchQueryManager currentQueryId](self, "currentQueryId");
      objc_destroyWeak(&v57);

      objc_destroyWeak((id *)location);
    }
    else
    {
      PLSearchBackendQueryGetLog();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        if ((_DWORD)v16)
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[Batch: %d | Query: %d]"), v16, v14);
        else
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[Query: %d]"), v14);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = objc_msgSend(v50, "count");
        v42 = CFSTR("contained multiple");
        *(_DWORD *)location = 138543874;
        *(_QWORD *)&location[4] = v40;
        if (!v41)
          v42 = CFSTR("did not contain any");
        v64 = 2114;
        v65 = v42;
        v66 = 2112;
        v67 = v51;
        _os_log_impl(&dword_1991EC000, v36, OS_LOG_TYPE_ERROR, "%{public}@ Unable to generate suggestions because the provided query string %{public}@ suggestions: \"%@\", location, 0x20u);

      }
      (*((void (**)(id, _QWORD, uint64_t, _QWORD))v11 + 2))(v11, MEMORY[0x1E0C9AA60], 3, 0);
      v34 = 0;
    }

  }
  else
  {
    PLSearchBackendQueryGetLog();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      if ((_DWORD)v16)
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[Batch: %d | Query: %d]"), v16, v14);
      else
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[Query: %d]"), v14);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v51, "length");
      v39 = CFSTR("search query result");
      if (!v38)
        v39 = CFSTR("search text");
      *(_DWORD *)location = 138543618;
      *(_QWORD *)&location[4] = v37;
      v64 = 2114;
      v65 = v39;
      _os_log_impl(&dword_1991EC000, v35, OS_LOG_TYPE_ERROR, "%{public}@ Unable to generate suggestions without %{public}@", location, 0x16u);

    }
    (*((void (**)(id, _QWORD, uint64_t, _QWORD))v11 + 2))(v11, MEMORY[0x1E0C9AA60], 3, 0);
    v34 = 0;
  }

  return v34;
}

- (void)cancelQueryWithQueryId:(int)a3
{
  uint64_t v3;
  void *v5;
  int v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v3 = *(_QWORD *)&a3;
  v15 = *MEMORY[0x1E0C80C00];
  -[PHSearchQueryManager currentSearchQuery](self, "currentSearchQuery");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "queryIdentifier");

  if (v6 == (_DWORD)v3)
  {
    -[PHSearchQueryManager currentSearchQuery](self, "currentSearchQuery");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "cancel");

    PLSearchBackendQueryGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[Query: %d]"), v3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[PHSearchQueryManager currentSearchQuery](self, "currentSearchQuery");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v12 = v9;
      v13 = 2112;
      v14 = v10;
      _os_log_impl(&dword_1991EC000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ Cancelled query: %@", buf, 0x16u);

    }
  }
}

- (void)cancelQueriesForBatchQueryId:(int)a3
{
  PLRunWithUnfairLock();
}

- (BOOL)_acquireSpotlightSandboxExtensionIfNeeded
{
  if (objc_msgSend(MEMORY[0x1E0D71B48], "spotlightPrivateIndexEnabled"))
    PLRunWithUnfairLock();
  return self->_spotlightSandboxExtensionHandle != -1;
}

- (void)_releaseSpotlightSandboxExtension
{
  if (objc_msgSend(MEMORY[0x1E0D71B48], "spotlightPrivateIndexEnabled"))
    PLRunWithUnfairLock();
}

- (id)_searchQueriesFromSearchTexts:(id)a3 searchOptions:(id)a4 batchQueryID:(int)a5
{
  uint64_t v5;
  id v8;
  id v9;
  void *v10;
  __int128 v11;
  unint64_t v12;
  void *v13;
  PHSearchQuery *v14;
  void *v15;
  PHSearchQuery *v16;
  NSObject *v17;
  void *v18;
  __int128 v20;
  uint8_t buf[4];
  int v22;
  uint64_t v23;

  v5 = *(_QWORD *)&a5;
  v23 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v8, "count"));
  if (objc_msgSend(v8, "count"))
  {
    v12 = 0;
    *(_QWORD *)&v11 = 67109120;
    v20 = v11;
    do
    {
      objc_msgSend(v8, "objectAtIndexedSubscript:", v12, v20);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v13, "length"))
      {
        v14 = [PHSearchQuery alloc];
        -[PHSearchQueryManager photoLibrary](self, "photoLibrary");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = -[PHSearchQuery initWithSearchText:searchOptions:photoLibrary:queryIdentifier:batchIdentifier:](v14, "initWithSearchText:searchOptions:photoLibrary:queryIdentifier:batchIdentifier:", v13, v9, v15, ++v12, v5);

        objc_msgSend(v10, "addObject:", v16);
      }
      else
      {
        PLSearchBackendQueryGetLog();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v20;
          v22 = v12;
          _os_log_impl(&dword_1991EC000, v17, OS_LOG_TYPE_ERROR, "Found empty search text in performBatchSearch for query %d, will not construct query", buf, 8u);
        }

        ++v12;
      }

    }
    while (objc_msgSend(v8, "count") > v12);
  }
  v18 = (void *)objc_msgSend(v10, "copy");

  return v18;
}

- (void)setCurrentSearchQuery:(id)a3
{
  PHSearchQuery *v4;
  PHSearchQuery *currentSearchQuery;
  PHSearchQueryManager *obj;

  v4 = (PHSearchQuery *)a3;
  obj = self;
  objc_sync_enter(obj);
  currentSearchQuery = obj->_currentSearchQuery;
  obj->_currentSearchQuery = v4;

  objc_sync_exit(obj);
}

- (PHSearchQuery)currentSearchQuery
{
  PHSearchQueryManager *v2;
  PHSearchQuery *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_currentSearchQuery;
  objc_sync_exit(v2);

  return v3;
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (OS_dispatch_queue)queryQueue
{
  return self->_queryQueue;
}

- (OS_dispatch_queue)batchQueryQueue
{
  return self->_batchQueryQueue;
}

- (int)currentQueryId
{
  return self->_currentQueryId;
}

- (void)setCurrentQueryId:(int)a3
{
  self->_currentQueryId = a3;
}

- (BOOL)isTestingConfiguration
{
  return self->_isTestingConfiguration;
}

- (void)setIsTestingConfiguration:(BOOL)a3
{
  self->_isTestingConfiguration = a3;
}

- (int)queryLock_currentBatchQueryId
{
  return self->_queryLock_currentBatchQueryId;
}

- (void)setQueryLock_currentBatchQueryId:(int)a3
{
  self->_queryLock_currentBatchQueryId = a3;
}

- (NSMutableDictionary)queryLock_batchQueriesInProgress
{
  return self->_queryLock_batchQueriesInProgress;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queryLock_batchQueriesInProgress, 0);
  objc_storeStrong((id *)&self->_batchQueryQueue, 0);
  objc_storeStrong((id *)&self->_queryQueue, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_currentSearchQuery, 0);
}

void __57__PHSearchQueryManager__releaseSpotlightSandboxExtension__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v3[16];

  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) != -1)
  {
    sandbox_extension_release();
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) = -1;
    PLSearchBackendQueryGetLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl(&dword_1991EC000, v2, OS_LOG_TYPE_DEFAULT, "Released sandbox extension for Spotlight index.", v3, 2u);
    }

  }
}

void __65__PHSearchQueryManager__acquireSpotlightSandboxExtensionIfNeeded__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  const char *v11;
  NSObject *v12;
  os_log_type_t v13;
  uint32_t v14;
  NSObject *v15;
  int v16;
  int v17;
  int v18;
  int v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v1 + 16) == -1)
  {
    objc_msgSend(*(id *)(v1 + 48), "pathManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "spotlightSearchIndexPath");
    v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v5 = objc_msgSend(v4, "fileSystemRepresentation");

    v6 = sandbox_extension_issue_file_to_self();
    if (v6)
    {
      v7 = (void *)v6;
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) = sandbox_extension_consume();
      v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
      PLSearchBackendQueryGetLog();
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (v8 == -1)
      {
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          v17 = *__error();
          v18 = 67109378;
          v19 = v17;
          v20 = 2080;
          v21 = v5;
          v11 = "Failed to consume sandbox extension token for Spotlight index. errno: %{darwin.errno}d, path: %s";
          v12 = v10;
          v13 = OS_LOG_TYPE_ERROR;
          v14 = 18;
          goto LABEL_11;
        }
      }
      else if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v18) = 0;
        v11 = "Issued sandbox extension for Spotlight index.";
        v12 = v10;
        v13 = OS_LOG_TYPE_DEFAULT;
        v14 = 2;
LABEL_11:
        _os_log_impl(&dword_1991EC000, v12, v13, v11, (uint8_t *)&v18, v14);
      }

      free(v7);
      return;
    }
    PLSearchBackendQueryGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = *__error();
      v18 = 67109378;
      v19 = v16;
      v20 = 2080;
      v21 = v5;
      _os_log_impl(&dword_1991EC000, v15, OS_LOG_TYPE_ERROR, "Failed to issue sandbox extension token to Spotlight index. errno: %{darwin.errno}d, path: %s", (uint8_t *)&v18, 0x12u);
    }

  }
}

void __53__PHSearchQueryManager_cancelQueriesForBatchQueryId___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  int v15;
  uint64_t v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  void *v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 72);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v9, "cancel");
        PLSearchBackendQueryGetLog();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          if (objc_msgSend(v9, "batchIdentifier"))
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[Batch: %d | Query: %d]"), objc_msgSend(v9, "batchIdentifier"), objc_msgSend(v9, "queryIdentifier"));
          else
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[Query: %d]"), objc_msgSend(v9, "queryIdentifier"), v16);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v23 = v11;
          _os_log_impl(&dword_1991EC000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ Cancelled batch queries.", buf, 0xCu);

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
    }
    while (v6);
  }

  v12 = *(void **)(*(_QWORD *)(a1 + 32) + 72);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 40));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", 0, v13);

  PLSearchBackendQueryGetLog();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = *(_DWORD *)(a1 + 40);
    *(_DWORD *)buf = 67109120;
    LODWORD(v23) = v15;
    _os_log_impl(&dword_1991EC000, v14, OS_LOG_TYPE_DEFAULT, "[Batch: %d] Cancelled batch queries.", buf, 8u);
  }

}

void __109__PHSearchQueryManager_suggestionsForSearchQuery_rangeOfSuggestionText_searchQueryResult_suggestionsHandler___block_invoke(int32x2_t *a1, void *a2, uint64_t a3, void *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  os_signpost_id_t v11;
  __int32 v12;
  id WeakRetained;
  void *v14;
  void *v15;
  char v16;
  uint64_t v17;
  id v18;
  id v19;
  void (**v20)(_QWORD);
  void *v21;
  void *v22;
  NSObject *v23;
  id v24;
  _QWORD v25[4];
  void (**v26)(_QWORD);
  _QWORD aBlock[4];
  id v28;
  id v29;
  id v30;
  id v31;
  uint64_t v32;
  int32x2_t v33;
  char v34;
  uint8_t buf[4];
  __int32 v36;
  __int16 v37;
  int v38;
  __int16 v39;
  uint64_t v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a4;
  v9 = *(id *)&a1[9];
  v10 = v9;
  v11 = (os_signpost_id_t)a1[10];
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    v12 = a1[11].i32[0];
    *(_DWORD *)buf = 67109632;
    v36 = v12;
    v37 = 1024;
    v38 = 0;
    v39 = 2048;
    v40 = objc_msgSend(v7, "count");
    _os_signpost_emit_with_name_impl(&dword_1991EC000, v10, OS_SIGNPOST_INTERVAL_END, v11, "PLSearchBackendSuggestionsQuery", "Query: %d, Batch: %d, Suggestions: %tu", buf, 0x18u);
  }

  WeakRetained = objc_loadWeakRetained((id *)&a1[8]);
  objc_msgSend(*(id *)&a1[4], "searchQuery");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "currentSearchQuery");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v14, "isEqual:", v15) ^ 1;

  v17 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __109__PHSearchQueryManager_suggestionsForSearchQuery_rangeOfSuggestionText_searchQueryResult_suggestionsHandler___block_invoke_66;
  aBlock[3] = &unk_1E35DB728;
  v34 = v16;
  v33 = vrev64_s32(a1[11]);
  v28 = *(id *)&a1[5];
  v31 = *(id *)&a1[7];
  v18 = v7;
  v29 = v18;
  v32 = a3;
  v19 = v8;
  v30 = v19;
  v20 = (void (**)(_QWORD))_Block_copy(aBlock);
  if (objc_msgSend(WeakRetained, "isTestingConfiguration"))
  {
    v20[2](v20);
  }
  else
  {
    objc_msgSend(*(id *)&a1[6], "resultsHandlerQueue");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (v21)
    {
      v23 = v21;
    }
    else
    {
      v23 = MEMORY[0x1E0C80D38];
      v24 = MEMORY[0x1E0C80D38];
    }

    v25[0] = v17;
    v25[1] = 3221225472;
    v25[2] = __109__PHSearchQueryManager_suggestionsForSearchQuery_rangeOfSuggestionText_searchQueryResult_suggestionsHandler___block_invoke_67;
    v25[3] = &unk_1E35DF948;
    v26 = v20;
    dispatch_async(v23, v25);

  }
}

uint64_t __109__PHSearchQueryManager_suggestionsForSearchQuery_rangeOfSuggestionText_searchQueryResult_suggestionsHandler___block_invoke_66(uint64_t a1)
{
  int v2;
  NSObject *v3;
  _BOOL4 v4;
  void *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v10;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = *(unsigned __int8 *)(a1 + 80);
  PLSearchBackendQueryGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      if (*(_DWORD *)(a1 + 72))
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[Batch: %d | Query: %d]"), *(unsigned int *)(a1 + 72), *(unsigned int *)(a1 + 76));
      else
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[Query: %d]"), *(unsigned int *)(a1 + 76), v10);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v12 = v5;
      v13 = 2112;
      v14 = v6;
      v7 = "%{public}@ Suggestions query has changed and was cancelled: %@";
LABEL_12:
      _os_log_impl(&dword_1991EC000, v3, OS_LOG_TYPE_DEFAULT, v7, buf, 0x16u);

    }
  }
  else if (v4)
  {
    if (*(_DWORD *)(a1 + 72))
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[Batch: %d | Query: %d]"), *(unsigned int *)(a1 + 72), *(unsigned int *)(a1 + 76));
    else
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[Query: %d]"), *(unsigned int *)(a1 + 76), v10);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    v12 = v5;
    v13 = 2112;
    v14 = v8;
    v7 = "%{public}@ Completed suggestions query with suggestions: %@";
    goto LABEL_12;
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

uint64_t __109__PHSearchQueryManager_suggestionsForSearchQuery_rangeOfSuggestionText_searchQueryResult_suggestionsHandler___block_invoke_67(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __72__PHSearchQueryManager_performBatchSearch_searchOptions_resultsHandler___block_invoke(uint64_t result)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = ++*(_DWORD *)(*(_QWORD *)(result + 32) + 32);
  return result;
}

void __72__PHSearchQueryManager_performBatchSearch_searchOptions_resultsHandler___block_invoke_46(_QWORD *a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  v1 = a1[5];
  v2 = *(void **)(a1[4] + 72);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(*(_QWORD *)(a1[6] + 8) + 24));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v1, v3);

}

void __72__PHSearchQueryManager_performBatchSearch_searchOptions_resultsHandler___block_invoke_50(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  id WeakRetained;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  BOOL v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  int v21;
  NSObject *v22;
  NSObject *v23;
  os_signpost_id_t v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  id v28;
  id v29;
  uint64_t v30;
  id v31;
  void (**v32)(_QWORD);
  void *v33;
  void *v34;
  NSObject *v35;
  id v36;
  uint64_t v37;
  _QWORD block[4];
  void (**v39)(_QWORD);
  _QWORD aBlock[4];
  id v41;
  uint64_t v42;
  id v43;
  id v44;
  uint64_t v45;
  BOOL v46;
  uint64_t v47;
  uint64_t v48;
  void (*v49)(uint64_t);
  void *v50;
  uint64_t v51;
  uint64_t v52;
  uint8_t buf[4];
  _BYTE v54[18];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a4;
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
  PLSearchBackendQueryGetLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24))
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[Batch: %d | Query: %d]"), *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24), *(unsigned int *)(a1 + 120));
    else
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[Query: %d]"), *(unsigned int *)(a1 + 120), v37);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "searchText");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "string");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)v54 = v10;
    *(_WORD *)&v54[8] = 2112;
    *(_QWORD *)&v54[10] = v12;
    _os_log_impl(&dword_1991EC000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ Completed query: \"%@\".", buf, 0x16u);

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
  v14 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
  v15 = *(_QWORD *)(a1 + 96);
  v16 = MEMORY[0x1E0C809B0];
  v17 = v14 == v15;
  if (v14 == v15)
  {
    v18 = *(_QWORD *)(a1 + 40);
    v47 = MEMORY[0x1E0C809B0];
    v48 = 3221225472;
    v49 = __72__PHSearchQueryManager_performBatchSearch_searchOptions_resultsHandler___block_invoke_51;
    v50 = &unk_1E35DF920;
    v19 = *(_QWORD *)(a1 + 80);
    v51 = v18;
    v52 = v19;
    PLRunWithUnfairLock();
    PLSearchBackendQueryGetLog();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24);
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)v54 = v21;
      _os_log_impl(&dword_1991EC000, v20, OS_LOG_TYPE_DEFAULT, "[Batch: %d] ----- COMPLETED BATCH SEARCH -----", buf, 8u);
    }

    v22 = *(id *)(a1 + 104);
    v23 = v22;
    v24 = *(_QWORD *)(a1 + 112);
    if (v24 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
    {
      v25 = a3;
      v26 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24);
      v27 = objc_msgSend(*(id *)(a1 + 48), "count");
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)v54 = v26;
      a3 = v25;
      v16 = MEMORY[0x1E0C809B0];
      *(_WORD *)&v54[4] = 2048;
      *(_QWORD *)&v54[6] = v27;
      _os_signpost_emit_with_name_impl(&dword_1991EC000, v23, OS_SIGNPOST_INTERVAL_END, v24, "PLSearchBackendBatchQuery", "Batch: %d, Queries: %tu", buf, 0x12u);
    }

  }
  aBlock[0] = v16;
  aBlock[1] = 3221225472;
  aBlock[2] = __72__PHSearchQueryManager_performBatchSearch_searchOptions_resultsHandler___block_invoke_52;
  aBlock[3] = &unk_1E35DB700;
  v28 = v7;
  v41 = v28;
  v29 = *(id *)(a1 + 64);
  v30 = *(_QWORD *)(a1 + 32);
  v44 = v29;
  v45 = a3;
  v42 = v30;
  v46 = v17;
  v31 = v8;
  v43 = v31;
  v32 = (void (**)(_QWORD))_Block_copy(aBlock);
  if (objc_msgSend(WeakRetained, "isTestingConfiguration"))
  {
    v32[2](v32);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 56), "resultsHandlerQueue");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v33;
    if (v33)
    {
      v35 = v33;
    }
    else
    {
      v35 = MEMORY[0x1E0C80D38];
      v36 = MEMORY[0x1E0C80D38];
    }

    block[0] = v16;
    block[1] = 3221225472;
    block[2] = __72__PHSearchQueryManager_performBatchSearch_searchOptions_resultsHandler___block_invoke_2;
    block[3] = &unk_1E35DF948;
    v39 = v32;
    dispatch_async(v35, block);

  }
}

void __72__PHSearchQueryManager_performBatchSearch_searchOptions_resultsHandler___block_invoke_51(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 72);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setObject:forKeyedSubscript:", 0, v2);

}

void __72__PHSearchQueryManager_performBatchSearch_searchOptions_resultsHandler___block_invoke_52(uint64_t a1)
{
  void *v2;
  int v3;
  uint64_t v4;
  PHSearchQueryResult *v5;

  objc_msgSend(*(id *)(a1 + 32), "searchQuery");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isCancelled");

  v4 = *(_QWORD *)(a1 + 56);
  if (v3)
  {
    v5 = -[PHSearchQueryResult initWithSearchQuery:]([PHSearchQueryResult alloc], "initWithSearchQuery:", *(_QWORD *)(a1 + 40));
    (*(void (**)(uint64_t, PHSearchQueryResult *, uint64_t, _QWORD, _QWORD))(v4 + 16))(v4, v5, 2, 0, 0);

  }
  else
  {
    (*(void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(v4 + 16))(*(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 64), *(unsigned __int8 *)(a1 + 72), *(_QWORD *)(a1 + 48));
  }
}

uint64_t __72__PHSearchQueryManager_performBatchSearch_searchOptions_resultsHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __67__PHSearchQueryManager_performSearch_searchOptions_resultsHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  PHSearchQueryResult *v2;

  v1 = *(_QWORD *)(a1 + 40);
  v2 = -[PHSearchQueryResult initWithSearchQuery:]([PHSearchQueryResult alloc], "initWithSearchQuery:", *(_QWORD *)(a1 + 32));
  (*(void (**)(uint64_t, PHSearchQueryResult *, uint64_t, _QWORD))(v1 + 16))(v1, v2, 1, 0);

}

void __67__PHSearchQueryManager_performSearch_searchOptions_resultsHandler___block_invoke_40(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  os_signpost_id_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  __CFString *v15;
  __CFString *v16;
  id WeakRetained;
  void *v18;
  void *v19;
  char v20;
  uint64_t v21;
  id v22;
  id v23;
  void (**v24)(_QWORD);
  NSObject *v25;
  uint64_t v26;
  int v27;
  void *v28;
  void *v29;
  _QWORD block[4];
  void (**v31)(_QWORD);
  _QWORD aBlock[4];
  id v33;
  id v34;
  id v35;
  uint64_t v36;
  int v37;
  char v38;
  uint8_t buf[4];
  int v40;
  __int16 v41;
  int v42;
  __int16 v43;
  uint64_t v44;
  __int16 v45;
  uint64_t v46;
  __int16 v47;
  __CFString *v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a4;
  v9 = *(id *)(a1 + 56);
  v10 = v9;
  v11 = *(_QWORD *)(a1 + 64);
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    v27 = *(_DWORD *)(a1 + 72);
    objc_msgSend(v7, "searchResults");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v29, "count");
    objc_msgSend(v7, "rankedAssetSearchResults");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v28, "count");
    objc_msgSend(v7, "queryMatchDetails");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "queryEmbedding");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = CFSTR("YES");
    if (!v14)
      v15 = CFSTR("NO");
    v16 = v15;
    *(_DWORD *)buf = 67110146;
    v40 = v27;
    v41 = 1024;
    v42 = 0;
    v43 = 2048;
    v44 = v26;
    v45 = 2048;
    v46 = v12;
    v47 = 2112;
    v48 = v16;
    _os_signpost_emit_with_name_impl(&dword_1991EC000, v10, OS_SIGNPOST_INTERVAL_END, v11, "PLSearchBackendQuery", "Query: %d, Batch: %d, PHSearchResults: %tu, Top Assets: %tu, Query Embedding: %@", buf, 0x2Cu);

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(v7, "searchQuery");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "currentSearchQuery");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v18, "isEqual:", v19) ^ 1;

  v21 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __67__PHSearchQueryManager_performSearch_searchOptions_resultsHandler___block_invoke_41;
  aBlock[3] = &unk_1E35DB6D8;
  v38 = v20;
  v37 = *(_DWORD *)(a1 + 72);
  v22 = v7;
  v33 = v22;
  v35 = *(id *)(a1 + 40);
  v23 = v8;
  v34 = v23;
  v36 = a3;
  v24 = (void (**)(_QWORD))_Block_copy(aBlock);
  if (objc_msgSend(WeakRetained, "isTestingConfiguration"))
  {
    v24[2](v24);
  }
  else
  {
    v25 = *(NSObject **)(a1 + 32);
    block[0] = v21;
    block[1] = 3221225472;
    block[2] = __67__PHSearchQueryManager_performSearch_searchOptions_resultsHandler___block_invoke_42;
    block[3] = &unk_1E35DF948;
    v31 = v24;
    dispatch_async(v25, block);

  }
}

void __67__PHSearchQueryManager_performSearch_searchOptions_resultsHandler___block_invoke_41(uint64_t a1)
{
  int v2;
  NSObject *v3;
  _BOOL4 v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  PHSearchQueryResult *v9;
  void *v10;
  PHSearchQueryResult *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v2 = *(unsigned __int8 *)(a1 + 68);
  PLSearchBackendQueryGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[Query: %d]"), *(unsigned int *)(a1 + 64));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "searchQuery");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "searchText");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v17 = v5;
      v18 = 2112;
      v19 = v7;
      _os_log_impl(&dword_1991EC000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ Query has changed and was cancelled: %@", buf, 0x16u);

    }
    v8 = *(_QWORD *)(a1 + 48);
    v9 = [PHSearchQueryResult alloc];
    objc_msgSend(*(id *)(a1 + 32), "searchQuery");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[PHSearchQueryResult initWithSearchQuery:](v9, "initWithSearchQuery:", v10);
    (*(void (**)(uint64_t, PHSearchQueryResult *, uint64_t, _QWORD))(v8 + 16))(v8, v11, 2, *(_QWORD *)(a1 + 40));

  }
  else
  {
    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[Query: %d]"), *(unsigned int *)(a1 + 64));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v17 = v12;
      v18 = 2112;
      v19 = v13;
      _os_log_impl(&dword_1991EC000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ Query result: %@", buf, 0x16u);

    }
    PLSearchBackendQueryGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[Query: %d]"), *(unsigned int *)(a1 + 64));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v17 = v15;
      _os_log_impl(&dword_1991EC000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ ----- COMPLETED SEARCH -----", buf, 0xCu);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
}

uint64_t __67__PHSearchQueryManager_performSearch_searchOptions_resultsHandler___block_invoke_42(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __37__PHSearchQueryManager_preheatSearch__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  PLSearchBackendQueryGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = objc_msgSend(*(id *)(a1 + 32), "wellKnownPhotoLibraryIdentifier");
    objc_msgSend(*(id *)(a1 + 32), "photoLibraryURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 134218242;
    v11 = v3;
    v12 = 2112;
    v13 = v4;
    _os_log_impl(&dword_1991EC000, v2, OS_LOG_TYPE_DEFAULT, "Preheat Search for PhotoLibrary: %td, %@", (uint8_t *)&v10, 0x16u);

  }
  if (objc_msgSend(MEMORY[0x1E0D71B48], "spotlightPrivateIndexEnabled"))
  {
    objc_msgSend(*(id *)(a1 + 32), "pathManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "spotlightSearchIndexPath");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = (void *)MEMORY[0x1E0CA6B00];
    PLSearchFileProtectionTypes();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "prepareProtectionClasses:path:", v8, v6);

  }
  else
  {
    v9 = (void *)MEMORY[0x1E0CA6B90];
    PLSearchFileProtectionTypes();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "prepareProtectionClasses:", v6);
  }

}

+ (BOOL)currentSpotlightVersionSupportsExactMatchBehavior
{
  return 1;
}

+ (BOOL)_isValidQueryText:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;

  v3 = a3;
  if (objc_msgSend(v3, "length"))
  {
    objc_msgSend(v3, "string");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringByTrimmingCharactersInSet:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_msgSend(v6, "length") != 0;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

@end
