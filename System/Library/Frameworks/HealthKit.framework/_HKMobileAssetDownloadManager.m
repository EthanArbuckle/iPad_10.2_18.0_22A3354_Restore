@implementation _HKMobileAssetDownloadManager

- (_HKMobileAssetDownloadManager)initWithMobileAssetTypeName:(id)a3 queue:(id)a4
{
  id v6;
  id v7;
  _HKMobileAssetDownloadManager *v8;
  uint64_t v9;
  NSString *mobileAssetTypeName;
  NSMutableArray *v11;
  NSMutableArray *pendingOperations;
  NSMutableSet *v13;
  NSMutableSet *downloadingQueryParams;
  uint64_t v15;
  MADownloadOptions *mobileAssetDownloadOptions;
  objc_super v18;

  v6 = a3;
  v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)_HKMobileAssetDownloadManager;
  v8 = -[_HKMobileAssetDownloadManager init](&v18, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    mobileAssetTypeName = v8->_mobileAssetTypeName;
    v8->_mobileAssetTypeName = (NSString *)v9;

    v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    pendingOperations = v8->_pendingOperations;
    v8->_pendingOperations = v11;

    *(_WORD *)&v8->_shouldQueryLocalAssetsFirst = 256;
    v8->_maxNumberOfRetriesAllowed = 1;
    objc_storeStrong((id *)&v8->_queue, a4);
    v13 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    downloadingQueryParams = v8->_downloadingQueryParams;
    v8->_downloadingQueryParams = v13;

    v15 = objc_opt_new();
    mobileAssetDownloadOptions = v8->_mobileAssetDownloadOptions;
    v8->_mobileAssetDownloadOptions = (MADownloadOptions *)v15;

    v8->_mobileAssetQueryReturnTypes = 0;
  }

  return v8;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)_HKMobileAssetDownloadManager;
  -[_HKMobileAssetDownloadManager dealloc](&v4, sel_dealloc);
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@:%p mobileAssetTypeName:\"%@\">"), objc_opt_class(), self, self->_mobileAssetTypeName);
}

- (void)downloadAssetsWithQueryParams:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __63___HKMobileAssetDownloadManager_downloadAssetsWithQueryParams___block_invoke;
  v7[3] = &unk_1E37E6980;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)fetchAssetsWithQueryParams:(id)a3 onlyLocal:(BOOL)a4 completion:(id)a5
{
  -[_HKMobileAssetDownloadManager fetchAssetsWithQueryParams:onlyLocal:returnTypes:completion:](self, "fetchAssetsWithQueryParams:onlyLocal:returnTypes:completion:", a3, a4, self->_mobileAssetQueryReturnTypes, a5);
}

- (void)fetchAssetsWithQueryParams:(id)a3 onlyLocal:(BOOL)a4 returnTypes:(int64_t)a5 completion:(id)a6
{
  id v10;
  id v11;
  NSObject *queue;
  id v13;
  id v14;
  _QWORD block[5];
  id v16;
  id v17;
  int64_t v18;
  BOOL v19;

  v10 = a3;
  v11 = a6;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __93___HKMobileAssetDownloadManager_fetchAssetsWithQueryParams_onlyLocal_returnTypes_completion___block_invoke;
  block[3] = &unk_1E37F6B00;
  block[4] = self;
  v16 = v10;
  v19 = a4;
  v17 = v11;
  v18 = a5;
  v13 = v11;
  v14 = v10;
  dispatch_async(queue, block);

}

- (void)downloadMobileAssets:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65___HKMobileAssetDownloadManager_downloadMobileAssets_completion___block_invoke;
  block[3] = &unk_1E37E67E8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

- (void)removeMobileAssets:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *queue;
  id v14;
  id v15;
  _QWORD block[4];
  id v17;
  _HKMobileAssetDownloadManager *v18;
  id v19;
  _QWORD *v20;
  _QWORD *v21;
  _QWORD aBlock[5];
  id v23;
  _QWORD *v24;
  _QWORD *v25;
  _QWORD v26[3];
  uint64_t v27;
  _QWORD v28[3];
  char v29;
  _BYTE v30[24];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x2020000000;
  v29 = 1;
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x2020000000;
  v27 = 0;
  v27 = objc_msgSend(v6, "count");
  v8 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __63___HKMobileAssetDownloadManager_removeMobileAssets_completion___block_invoke;
  aBlock[3] = &unk_1E37F6B28;
  aBlock[4] = self;
  v24 = v26;
  v9 = v7;
  v23 = v9;
  v25 = v28;
  v10 = _Block_copy(aBlock);
  _HKInitializeLogging();
  v11 = (void *)HKLogMobileAsset;
  if (os_log_type_enabled((os_log_t)HKLogMobileAsset, OS_LOG_TYPE_DEBUG))
  {
    v12 = v11;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      -[_HKMobileAssetDownloadManager removeMobileAssets:completion:].cold.1((uint64_t)v30, objc_msgSend(v6, "count"), v12);

  }
  queue = self->_queue;
  block[0] = v8;
  block[1] = 3221225472;
  block[2] = __63___HKMobileAssetDownloadManager_removeMobileAssets_completion___block_invoke_195;
  block[3] = &unk_1E37F6B78;
  v19 = v10;
  v20 = v26;
  v17 = v6;
  v18 = self;
  v21 = v28;
  v14 = v10;
  v15 = v6;
  dispatch_async(queue, block);

  _Block_object_dispose(v26, 8);
  _Block_object_dispose(v28, 8);

}

- (void)_queue_fetchAssetsWithQuery:(id)a3 onlyLocal:(BOOL)a4 completion:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  NSString *mobileAssetTypeName;
  MADownloadOptions *mobileAssetDownloadOptions;
  NSObject *queue;
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  _QWORD *v21;
  _QWORD v22[5];
  NSObject *v23;
  _QWORD *v24;
  _QWORD v25[5];
  id v26;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x3032000000;
  v25[3] = __Block_byref_object_copy__56;
  v25[4] = __Block_byref_object_dispose__56;
  v26 = 0;
  v10 = dispatch_group_create();
  dispatch_group_enter(v10);
  v11 = MEMORY[0x1E0C809B0];
  if (v6)
  {
    dispatch_group_leave(v10);
  }
  else
  {
    v12 = (void *)MEMORY[0x1E0D4E038];
    mobileAssetTypeName = self->_mobileAssetTypeName;
    mobileAssetDownloadOptions = self->_mobileAssetDownloadOptions;
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __82___HKMobileAssetDownloadManager__queue_fetchAssetsWithQuery_onlyLocal_completion___block_invoke;
    v22[3] = &unk_1E37F6BA0;
    v24 = v25;
    v22[4] = self;
    v23 = v10;
    objc_msgSend(v12, "startCatalogDownload:options:then:", mobileAssetTypeName, mobileAssetDownloadOptions, v22);

  }
  queue = self->_queue;
  v18[0] = v11;
  v18[1] = 3221225472;
  v18[2] = __82___HKMobileAssetDownloadManager__queue_fetchAssetsWithQuery_onlyLocal_completion___block_invoke_2;
  v18[3] = &unk_1E37F6C18;
  v18[4] = self;
  v19 = v8;
  v20 = v9;
  v21 = v25;
  v16 = v9;
  v17 = v8;
  dispatch_group_notify(v10, queue, v18);

  _Block_object_dispose(v25, 8);
}

- (void)_queue_fetchAssetsWithLocalInformation:(BOOL)a3 shouldRequery:(BOOL)a4 queryParams:(id)a5 returnTypes:(int64_t)a6
{
  _BOOL4 v8;
  id v10;
  NSObject *v11;
  uint64_t v12;
  int64_t v13;
  void *v14;
  NSString *mobileAssetTypeName;
  MADownloadOptions *mobileAssetDownloadOptions;
  NSObject *queue;
  id v18;
  BOOL v19;
  _QWORD block[5];
  id v21;
  _QWORD *v22;
  int64_t v23;
  BOOL v24;
  BOOL v25;
  _QWORD v26[5];
  NSObject *v27;
  _QWORD *v28;
  _QWORD v29[5];
  id v30;

  v8 = a3;
  v10 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x3032000000;
  v29[3] = __Block_byref_object_copy__56;
  v29[4] = __Block_byref_object_dispose__56;
  v30 = 0;
  v11 = dispatch_group_create();
  dispatch_group_enter(v11);
  if (v8)
  {
    v12 = MEMORY[0x1E0C809B0];
    dispatch_group_leave(v11);
  }
  else
  {
    v19 = a4;
    v13 = a6;
    v14 = (void *)MEMORY[0x1E0D4E038];
    mobileAssetTypeName = self->_mobileAssetTypeName;
    mobileAssetDownloadOptions = self->_mobileAssetDownloadOptions;
    v12 = MEMORY[0x1E0C809B0];
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __110___HKMobileAssetDownloadManager__queue_fetchAssetsWithLocalInformation_shouldRequery_queryParams_returnTypes___block_invoke;
    v26[3] = &unk_1E37F6BA0;
    v28 = v29;
    v26[4] = self;
    v27 = v11;
    objc_msgSend(v14, "startCatalogDownload:options:then:", mobileAssetTypeName, mobileAssetDownloadOptions, v26);

    a6 = v13;
    a4 = v19;
  }
  queue = self->_queue;
  block[0] = v12;
  block[1] = 3221225472;
  block[2] = __110___HKMobileAssetDownloadManager__queue_fetchAssetsWithLocalInformation_shouldRequery_queryParams_returnTypes___block_invoke_2;
  block[3] = &unk_1E37F6CB8;
  block[4] = self;
  v21 = v10;
  v22 = v29;
  v23 = a6;
  v24 = a4;
  v25 = v8;
  v18 = v10;
  dispatch_group_notify(v11, queue, block);

  _Block_object_dispose(v29, 8);
}

- (void)_queue_downloadAssets:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void (**v8)(_QWORD);
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _HKMobileAssetDownloadOperation *v13;
  OS_dispatch_queue *queue;
  MADownloadOptions *mobileAssetDownloadOptions;
  int64_t v16;
  _HKMobileAssetDownloadOperation *v17;
  id v18;
  id obj;
  _QWORD v20[6];
  void (**v21)(_QWORD);
  _QWORD *v22;
  _QWORD *v23;
  _QWORD *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _QWORD aBlock[4];
  id v30;
  _QWORD *v31;
  _QWORD *v32;
  _QWORD *v33;
  _QWORD v34[3];
  uint64_t v35;
  _QWORD v36[5];
  id v37;
  _QWORD v38[5];
  id v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v38[0] = 0;
  v38[1] = v38;
  v38[2] = 0x3032000000;
  v38[3] = __Block_byref_object_copy__56;
  v38[4] = __Block_byref_object_dispose__56;
  v39 = 0;
  v36[0] = 0;
  v36[1] = v36;
  v36[2] = 0x3032000000;
  v36[3] = __Block_byref_object_copy__56;
  v36[4] = __Block_byref_object_dispose__56;
  v37 = 0;
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x2020000000;
  v35 = 0;
  v35 = objc_msgSend(v6, "count");
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __66___HKMobileAssetDownloadManager__queue_downloadAssets_completion___block_invoke;
  aBlock[3] = &unk_1E37F6CE0;
  v31 = v34;
  v18 = v7;
  v30 = v18;
  v32 = v38;
  v33 = v36;
  v8 = (void (**)(_QWORD))_Block_copy(aBlock);
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = v6;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v40, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v26;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v26 != v10)
          objc_enumerationMutation(obj);
        v12 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v11);
        v13 = [_HKMobileAssetDownloadOperation alloc];
        queue = self->_queue;
        mobileAssetDownloadOptions = self->_mobileAssetDownloadOptions;
        v16 = -[_HKMobileAssetDownloadManager maxNumberOfRetriesAllowed](self, "maxNumberOfRetriesAllowed", v18);
        v20[0] = MEMORY[0x1E0C809B0];
        v20[1] = 3221225472;
        v20[2] = __66___HKMobileAssetDownloadManager__queue_downloadAssets_completion___block_invoke_2;
        v20[3] = &unk_1E37F6D08;
        v20[4] = self;
        v20[5] = v12;
        v22 = v38;
        v23 = v34;
        v24 = v36;
        v21 = v8;
        v17 = -[_HKMobileAssetDownloadOperation initWithAsset:queue:downloadOptions:maxNumberOfRetriesAllowed:completion:](v13, "initWithAsset:queue:downloadOptions:maxNumberOfRetriesAllowed:completion:", v12, queue, mobileAssetDownloadOptions, v16, v20);
        -[NSMutableArray addObject:](self->_pendingOperations, "addObject:", v17);
        -[_HKMobileAssetDownloadOperation run](v17, "run");

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v40, 16);
    }
    while (v9);
  }

  v8[2](v8);
  _Block_object_dispose(v34, 8);
  _Block_object_dispose(v36, 8);

  _Block_object_dispose(v38, 8);
}

- (id)_generateAssetQueryFromQueryParams:(id)a3 returnTypes:(int64_t)a4
{
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  char isKindOfClass;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D4E050]), "initWithType:", self->_mobileAssetTypeName);
  objc_msgSend(v7, "setDoNotBlockBeforeFirstUnlock:", 1);
  objc_msgSend(v7, "returnTypes:", a4);
  if (a4 == 1)
    objc_msgSend(v7, "setDoNotBlockOnNetworkStatus:", 1);
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v8 = v6;
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
        objc_msgSend(v8, "objectForKeyedSubscript:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        objc_msgSend(v8, "objectForKeyedSubscript:", v13);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v17 = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) != 0 || (v17 & 1) != 0)
        {
          if ((isKindOfClass & 1) != 0)
            goto LABEL_11;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_HKMobileAssetDownloadManager.m"), 321, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("isString || isArray"));

          if ((isKindOfClass & 1) != 0)
          {
LABEL_11:
            objc_msgSend(v8, "objectForKeyedSubscript:", v13);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "addKeyValuePair:with:", v13, v18);
            goto LABEL_14;
          }
        }
        v20 = (void *)MEMORY[0x1E0C99DE8];
        objc_msgSend(v8, "objectForKeyedSubscript:", v13);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "arrayWithArray:", v18);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addKeyValueArray:with:", v13, v21);

LABEL_14:
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v10);
  }

  return v7;
}

- (void)_callDownloadCompletionHandlerWithAssets:(id)a3 queryParams:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __86___HKMobileAssetDownloadManager__callDownloadCompletionHandlerWithAssets_queryParams___block_invoke;
  block[3] = &unk_1E37E6738;
  block[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(queue, block);

}

- (void)_callErrorHandlerWithError:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __60___HKMobileAssetDownloadManager__callErrorHandlerWithError___block_invoke;
  v7[3] = &unk_1E37E6980;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (id)_errorWithDomain:(id)a3 code:(int64_t)a4
{
  void *v5;
  MADownloadOptions *mobileAssetDownloadOptions;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0CB35C8];
  v12[0] = CFSTR("Asset Type");
  v12[1] = CFSTR("Download Options");
  mobileAssetDownloadOptions = self->_mobileAssetDownloadOptions;
  v13[0] = self->_mobileAssetTypeName;
  v13[1] = mobileAssetDownloadOptions;
  v7 = (void *)MEMORY[0x1E0C99D80];
  v8 = a3;
  objc_msgSend(v7, "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "errorWithDomain:code:userInfo:", v8, a4, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)unitTesting_queue
{
  return self->_queue;
}

- (BOOL)shouldQueryLocalAssetsFirst
{
  return self->_shouldQueryLocalAssetsFirst;
}

- (void)setShouldQueryLocalAssetsFirst:(BOOL)a3
{
  self->_shouldQueryLocalAssetsFirst = a3;
}

- (BOOL)shouldAutoDownloadRemoteAssets
{
  return self->_shouldAutoDownloadRemoteAssets;
}

- (void)setShouldAutoDownloadRemoteAssets:(BOOL)a3
{
  self->_shouldAutoDownloadRemoteAssets = a3;
}

- (int64_t)maxNumberOfRetriesAllowed
{
  return self->_maxNumberOfRetriesAllowed;
}

- (void)setMaxNumberOfRetriesAllowed:(int64_t)a3
{
  self->_maxNumberOfRetriesAllowed = a3;
}

- (NSString)mobileAssetTypeName
{
  return self->_mobileAssetTypeName;
}

- (id)errorHandler
{
  return self->_errorHandler;
}

- (void)setErrorHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (int64_t)mobileAssetQueryReturnTypes
{
  return self->_mobileAssetQueryReturnTypes;
}

- (void)setMobileAssetQueryReturnTypes:(int64_t)a3
{
  self->_mobileAssetQueryReturnTypes = a3;
}

- (MADownloadOptions)mobileAssetDownloadOptions
{
  return self->_mobileAssetDownloadOptions;
}

- (void)setMobileAssetDownloadOptions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (id)mobileAssetDownloadCompletionHandler
{
  return self->_mobileAssetDownloadCompletionHandler;
}

- (void)setMobileAssetDownloadCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_mobileAssetDownloadCompletionHandler, 0);
  objc_storeStrong((id *)&self->_mobileAssetDownloadOptions, 0);
  objc_storeStrong(&self->_errorHandler, 0);
  objc_storeStrong((id *)&self->_mobileAssetTypeName, 0);
  objc_storeStrong((id *)&self->_retainedSelf, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_downloadingQueryParams, 0);
  objc_storeStrong((id *)&self->_pendingOperations, 0);
}

- (void)removeMobileAssets:(NSObject *)a3 completion:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a1 = 134217984;
  *(_QWORD *)(a1 + 4) = a2;
  OUTLINED_FUNCTION_4_5(&dword_19A0E6000, a3, (uint64_t)a3, "Beginning purge of %ld assets", (uint8_t *)a1);
}

@end
