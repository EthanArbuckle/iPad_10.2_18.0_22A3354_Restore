@implementation PHSearchIndex

- (PHSearchIndex)init
{
  NSObject *v3;
  uint8_t v5[16];

  PLSearchUIQueryGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1991EC000, v3, OS_LOG_TYPE_ERROR, "Init unavailable for PHSearchIndex", v5, 2u);
  }

  return 0;
}

- (PHSearchIndex)initWithPhotoLibrary:(id)a3
{
  id v6;
  PHSearchIndex *v7;
  PHSearchIndex *v8;
  void *v10;
  objc_super v11;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHSearchIndex.m"), 53, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("photoLibrary"));

  }
  v11.receiver = self;
  v11.super_class = (Class)PHSearchIndex;
  v7 = -[PHSearchIndex init](&v11, sel_init);
  v8 = v7;
  if (v7)
    objc_storeStrong((id *)&v7->_photoLibrary, a3);

  return v8;
}

- (PLSearchIndexSceneTaxonomyProvider)sceneTaxonomyProvider
{
  PLSearchIndexSceneTaxonomyProvider *sceneTaxonomyProvider;
  PLSearchIndexSceneTaxonomyProvider *v4;
  PLSearchIndexSceneTaxonomyProvider *v5;

  sceneTaxonomyProvider = self->_sceneTaxonomyProvider;
  if (!sceneTaxonomyProvider)
  {
    v4 = (PLSearchIndexSceneTaxonomyProvider *)objc_alloc_init(MEMORY[0x1E0D71AD8]);
    v5 = self->_sceneTaxonomyProvider;
    self->_sceneTaxonomyProvider = v4;

    sceneTaxonomyProvider = self->_sceneTaxonomyProvider;
  }
  return sceneTaxonomyProvider;
}

- (void)setIsCheckingIfTheSearchIndexIsReady:(BOOL)a3
{
  PHSearchIndex *obj;

  obj = self;
  objc_sync_enter(obj);
  obj->_isCheckingIfTheSearchIndexIsReady = a3;
  objc_sync_exit(obj);

}

- (BOOL)isCheckingIfTheSearchIndexIsReady
{
  PHSearchIndex *v2;
  BOOL isCheckingIfTheSearchIndexIsReady;

  v2 = self;
  objc_sync_enter(v2);
  isCheckingIfTheSearchIndexIsReady = v2->_isCheckingIfTheSearchIndexIsReady;
  objc_sync_exit(v2);

  return isCheckingIfTheSearchIndexIsReady;
}

- (void)set_psiSearchIndex:(id)a3
{
  PSIDatabase *v4;
  PSIDatabase *psiSearchIndex;
  PHSearchIndex *obj;

  v4 = (PSIDatabase *)a3;
  obj = self;
  objc_sync_enter(obj);
  psiSearchIndex = obj->__psiSearchIndex;
  obj->__psiSearchIndex = v4;

  objc_sync_exit(obj);
}

- (PSIDatabase)_psiSearchIndex
{
  PHSearchIndex *v2;
  PSIDatabase *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->__psiSearchIndex;
  objc_sync_exit(v2);

  return v3;
}

- (PSIDatabase)psiSearchIndex
{
  void *v3;
  void *v4;

  -[PHSearchIndex _psiSearchIndex](self, "_psiSearchIndex");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[PHSearchIndex photoLibrary](self, "photoLibrary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHSearchIndex _openQueryConnectionToSearchIndexForPhotoLibrary:completion:](self, "_openQueryConnectionToSearchIndexForPhotoLibrary:completion:", v4, 0);

  }
  return -[PHSearchIndex _psiSearchIndex](self, "_psiSearchIndex");
}

- (PSIDatabase)unverifiedPsiSearchIndex
{
  void *v3;
  void *v4;
  PSIDatabase *v5;
  PHSearchIndex *v6;
  PSIDatabase *unverifiedPsiSearchIndex;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  PSIDatabase *v12;

  -[PHSearchIndex _psiSearchIndex](self, "_psiSearchIndex");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    v6 = self;
    objc_sync_enter(v6);
    unverifiedPsiSearchIndex = v6->_unverifiedPsiSearchIndex;
    if (!unverifiedPsiSearchIndex)
    {
      v8 = objc_alloc(MEMORY[0x1E0D71BF0]);
      -[PHSearchIndex photoLibrary](v6, "photoLibrary");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "pathManager");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v8, "initWithPathManager:options:", v10, 1);
      v12 = v6->_unverifiedPsiSearchIndex;
      v6->_unverifiedPsiSearchIndex = (PSIDatabase *)v11;

      unverifiedPsiSearchIndex = v6->_unverifiedPsiSearchIndex;
    }
    v5 = unverifiedPsiSearchIndex;
    objc_sync_exit(v6);

  }
  return v5;
}

- (void)_openQueryConnectionToSearchIndexForPhotoLibrary:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  _QWORD block[4];
  id v13;
  void (**v14)(id, void *);
  id v15;
  id buf[2];

  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  -[PHSearchIndex _psiSearchIndex](self, "_psiSearchIndex");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    if (v7)
    {
      -[PHSearchIndex _psiSearchIndex](self, "_psiSearchIndex");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v7[2](v7, v9);

    }
  }
  else if (-[PHSearchIndex isCheckingIfTheSearchIndexIsReady](self, "isCheckingIfTheSearchIndexIsReady"))
  {
    PLSearchUIQueryGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_1991EC000, v10, OS_LOG_TYPE_INFO, "Already trying to open search index, subsequent request ignored", (uint8_t *)buf, 2u);
    }

    if (v7)
      v7[2](v7, 0);
  }
  else
  {
    -[PHSearchIndex setIsCheckingIfTheSearchIndexIsReady:](self, "setIsCheckingIfTheSearchIndexIsReady:", 1);
    objc_initWeak(buf, self);
    dispatch_get_global_queue(17, 0);
    v11 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __77__PHSearchIndex__openQueryConnectionToSearchIndexForPhotoLibrary_completion___block_invoke;
    block[3] = &unk_1E35D8D10;
    objc_copyWeak(&v15, buf);
    v13 = v6;
    v14 = v7;
    dispatch_async(v11, block);

    objc_destroyWeak(&v15);
    objc_destroyWeak(buf);
  }

}

- (void)preWarmSearchIndexSynchronously:(BOOL)a3 completion:(id)a4
{
  _BOOL4 v4;
  void (**v6)(id, void *);
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  NSObject *v14;
  id v15;
  void *v16;
  void *v17;
  __int16 v18[8];

  v4 = a3;
  v6 = (void (**)(id, void *))a4;
  -[PHSearchIndex _psiSearchIndex](self, "_psiSearchIndex");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    if (v6)
      v6[2](v6, v7);
  }
  else if (v4)
  {
    v8 = (void *)objc_opt_class();
    -[PHSearchIndex photoLibrary](self, "photoLibrary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v8) = objc_msgSend(v8, "_ensureSearchIndexIsReadyToBeQueriedForPhotoLibrary:", v9);

    if ((_DWORD)v8)
    {
      -[PHSearchIndex unverifiedPsiSearchIndex](self, "unverifiedPsiSearchIndex");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v10)
      {
        v12 = v10;
      }
      else
      {
        v15 = objc_alloc(MEMORY[0x1E0D71BF0]);
        -[PHSearchIndex photoLibrary](self, "photoLibrary");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "pathManager");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (id)objc_msgSend(v15, "initWithPathManager:options:", v17, 1);

      }
      -[PHSearchIndex set_psiSearchIndex:](self, "set_psiSearchIndex:", v12);
      if (v6)
        v6[2](v6, v12);

    }
    else
    {
      PLSearchUIQueryGetLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        v18[0] = 0;
        _os_log_impl(&dword_1991EC000, v14, OS_LOG_TYPE_INFO, "Unable to establish query connection to PSIDatabase", (uint8_t *)v18, 2u);
      }

      if (v6)
        v6[2](v6, 0);
    }
  }
  else
  {
    -[PHSearchIndex photoLibrary](self, "photoLibrary");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHSearchIndex _openQueryConnectionToSearchIndexForPhotoLibrary:completion:](self, "_openQueryConnectionToSearchIndexForPhotoLibrary:completion:", v13, v6);

  }
}

- (void)startIndexingAndMonitoringSearchIndexStatus
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  PHSearchIndex *v20;
  id v21;
  id location;
  _QWORD block[4];
  id v24;

  -[PHSearchIndex photoLibrary](self, "photoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "photoLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assetsdClient");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "libraryInternalClient");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = _os_feature_enabled_impl();
  v8 = MEMORY[0x1E0C809B0];
  if (v7)
  {
    dispatch_get_global_queue(9, 0);
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = v8;
    block[1] = 3221225472;
    block[2] = __60__PHSearchIndex_startIndexingAndMonitoringSearchIndexStatus__block_invoke;
    block[3] = &unk_1E35DF110;
    v24 = v6;
    dispatch_async(v9, block);

  }
  -[PHSearchIndex searchIndexStatusTimer](self, "searchIndexStatusTimer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    objc_initWeak(&location, self);
    v11 = (void *)MEMORY[0x1E0C99E88];
    v18[0] = v8;
    v18[1] = 3221225472;
    v18[2] = __60__PHSearchIndex_startIndexingAndMonitoringSearchIndexStatus__block_invoke_3;
    v18[3] = &unk_1E35D8DA8;
    v19 = v6;
    objc_copyWeak(&v21, &location);
    v20 = self;
    objc_msgSend(v11, "scheduledTimerWithTimeInterval:repeats:block:", 1, v18, 10.0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHSearchIndex setSearchIndexStatusTimer:](self, "setSearchIndexStatusTimer:", v12);
    objc_msgSend(v12, "fire");

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }
  -[PHSearchIndex _psiSearchIndex](self, "_psiSearchIndex");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_get_global_queue(17, 0);
  v14 = objc_claimAutoreleasedReturnValue();
  v16[0] = v8;
  v16[1] = 3221225472;
  v16[2] = __60__PHSearchIndex_startIndexingAndMonitoringSearchIndexStatus__block_invoke_6;
  v16[3] = &unk_1E35DF110;
  v17 = v13;
  v15 = v13;
  dispatch_async(v14, v16);

}

- (void)stopIndexingAndMonitoringSearchIndexStatus
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (_os_feature_enabled_impl())
  {
    -[PHSearchIndex photoLibrary](self, "photoLibrary");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "photoLibrary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "assetsdClient");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "libraryInternalClient");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "pauseSearchIndexingWithCompletionHandler:", &__block_literal_global_41);
  }
  -[PHSearchIndex searchIndexStatusTimer](self, "searchIndexStatusTimer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  PLSearchUIQueryGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      LOWORD(v11) = 0;
      _os_log_impl(&dword_1991EC000, v9, OS_LOG_TYPE_INFO, "Photos Search Index Manager: Will stop monitoring the search indexing status", (uint8_t *)&v11, 2u);
    }

    objc_msgSend(v7, "invalidate");
    -[PHSearchIndex setSearchIndexStatusTimer:](self, "setSearchIndexStatusTimer:", 0);
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      -[PHSearchIndex _psiSearchIndex](self, "_psiSearchIndex");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412290;
      v12 = v10;
      _os_log_impl(&dword_1991EC000, v9, OS_LOG_TYPE_ERROR, "Photos Search Index Manager: Requested to stop monitoring indexing status for a search index that is not being monitored %@", (uint8_t *)&v11, 0xCu);

    }
  }

}

- (void)dealloc
{
  objc_super v3;

  -[PHSearchIndex set_psiSearchIndex:](self, "set_psiSearchIndex:", 0);
  -[PHSearchIndex setUnverifiedPsiSearchIndex:](self, "setUnverifiedPsiSearchIndex:", 0);
  v3.receiver = self;
  v3.super_class = (Class)PHSearchIndex;
  -[PHSearchIndex dealloc](&v3, sel_dealloc);
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (void)setSceneTaxonomyProvider:(id)a3
{
  objc_storeStrong((id *)&self->_sceneTaxonomyProvider, a3);
}

- (void)setUnverifiedPsiSearchIndex:(id)a3
{
  objc_storeStrong((id *)&self->_unverifiedPsiSearchIndex, a3);
}

- (NSTimer)searchIndexStatusTimer
{
  return self->_searchIndexStatusTimer;
}

- (void)setSearchIndexStatusTimer:(id)a3
{
  objc_storeStrong((id *)&self->_searchIndexStatusTimer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchIndexStatusTimer, 0);
  objc_storeStrong((id *)&self->_unverifiedPsiSearchIndex, 0);
  objc_storeStrong((id *)&self->_sceneTaxonomyProvider, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->__psiSearchIndex, 0);
}

uint64_t __60__PHSearchIndex_startIndexingAndMonitoringSearchIndexStatus__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "resumeSearchIndexingWithCompletionHandler:", &__block_literal_global_14350);
}

void __60__PHSearchIndex_startIndexingAndMonitoringSearchIndexStatus__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _QWORD v5[5];
  id v6;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __60__PHSearchIndex_startIndexingAndMonitoringSearchIndexStatus__block_invoke_4;
  v5[3] = &unk_1E35D8D80;
  objc_copyWeak(&v6, (id *)(a1 + 48));
  v5[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v4, "getSearchIndexProgress:", v5);
  objc_destroyWeak(&v6);

}

uint64_t __60__PHSearchIndex_startIndexingAndMonitoringSearchIndexStatus__block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateSearchMetadata");
}

void __60__PHSearchIndex_startIndexingAndMonitoringSearchIndexStatus__block_invoke_4(uint64_t a1, uint64_t a2, char a3)
{
  id WeakRetained;
  uint64_t v7;
  _QWORD v8[7];
  char v9;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __60__PHSearchIndex_startIndexingAndMonitoringSearchIndexStatus__block_invoke_5;
  v8[3] = &unk_1E35D8D58;
  v9 = a3;
  v7 = *(_QWORD *)(a1 + 32);
  v8[4] = WeakRetained;
  v8[5] = v7;
  v8[6] = a2;
  dispatch_async(MEMORY[0x1E0C80D38], v8);

}

void __60__PHSearchIndex_startIndexingAndMonitoringSearchIndexStatus__block_invoke_5(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    v6[0] = CFSTR("PHSearchIndexIndexingPausedKey");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 56));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v6[1] = CFSTR("PHSearchIndexItemsRemainingKey");
    v7[0] = v2;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v7[1] = v3;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "postNotificationName:object:userInfo:", CFSTR("PHSearchIndexIndexingStatusDidChangeNotification"), *(_QWORD *)(a1 + 40), v4);

  }
}

void __77__PHSearchIndex__openQueryConnectionToSearchIndexForPhotoLibrary_completion___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  int v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  id v15;
  uint8_t v16[16];

  v2 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v4 = objc_msgSend((id)objc_opt_class(), "_ensureSearchIndexIsReadyToBeQueriedForPhotoLibrary:", *(_QWORD *)(a1 + 32));

  if (v4)
  {
    v5 = objc_loadWeakRetained(v2);
    objc_msgSend(v5, "unverifiedPsiSearchIndex");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v8 = v6;
    }
    else
    {
      v11 = objc_alloc(MEMORY[0x1E0D71BF0]);
      objc_msgSend(*(id *)(a1 + 32), "pathManager");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (id)objc_msgSend(v11, "initWithPathManager:options:", v12, 1);

    }
    v13 = objc_loadWeakRetained(v2);
    objc_msgSend(v13, "set_psiSearchIndex:", v8);

    v14 = *(_QWORD *)(a1 + 40);
    if (v14)
      (*(void (**)(uint64_t, id))(v14 + 16))(v14, v8);

  }
  else
  {
    PLSearchUIQueryGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_1991EC000, v9, OS_LOG_TYPE_INFO, "Unable to establish query connection to PSIDatabase", v16, 2u);
    }

    v10 = *(_QWORD *)(a1 + 40);
    if (v10)
      (*(void (**)(uint64_t, _QWORD))(v10 + 16))(v10, 0);
  }
  v15 = objc_loadWeakRetained(v2);
  objc_msgSend(v15, "setIsCheckingIfTheSearchIndexIsReady:", 0);

}

+ (BOOL)_ensureSearchIndexIsReadyToBeQueriedForPhotoLibrary:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  const char *v10;
  NSObject *v11;
  os_log_type_t v12;
  uint32_t v13;
  id v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "photoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "assetsdClient");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "libraryInternalClient");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = 0;
  v6 = objc_msgSend(v5, "waitForSearchIndexExistenceWithError:", &v15);
  v7 = v15;
  PLSearchUIQueryGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v10 = "Search index exists on disk";
      v11 = v9;
      v12 = OS_LOG_TYPE_INFO;
      v13 = 2;
LABEL_6:
      _os_log_impl(&dword_1991EC000, v11, v12, v10, buf, v13);
    }
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v17 = v7;
    v10 = "Failed to find search index on disk with error: %@.";
    v11 = v9;
    v12 = OS_LOG_TYPE_ERROR;
    v13 = 12;
    goto LABEL_6;
  }

  return v6;
}

@end
