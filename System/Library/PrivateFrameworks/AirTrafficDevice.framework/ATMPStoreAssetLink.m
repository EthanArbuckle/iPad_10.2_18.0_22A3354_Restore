@implementation ATMPStoreAssetLink

- (ATMPStoreAssetLink)init
{
  ATMPStoreAssetLink *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *queue;
  dispatch_queue_t v5;
  OS_dispatch_queue *callbackQueue;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  MPStoreDownloadManager *downloadManager;
  uint64_t v14;
  NSMutableDictionary *assetMap;
  uint64_t v16;
  NSMutableDictionary *downloadsMap;
  objc_super v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t);
  void *v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;

  v19.receiver = self;
  v19.super_class = (Class)ATMPStoreAssetLink;
  v2 = -[ATMPStoreAssetLink init](&v19, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("ATMPStoreAssetLink", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    v5 = dispatch_queue_create("ATMPStoreAssetLink - callback", 0);
    callbackQueue = v2->_callbackQueue;
    v2->_callbackQueue = (OS_dispatch_queue *)v5;

    v25 = 0;
    v26 = &v25;
    v27 = 0x2050000000;
    v7 = (void *)getMPMediaQueryClass_softClass;
    v28 = getMPMediaQueryClass_softClass;
    if (!getMPMediaQueryClass_softClass)
    {
      v20 = MEMORY[0x1E0C809B0];
      v21 = 3221225472;
      v22 = __getMPMediaQueryClass_block_invoke;
      v23 = &unk_1E927E328;
      v24 = &v25;
      __getMPMediaQueryClass_block_invoke((uint64_t)&v20);
      v7 = (void *)v26[3];
    }
    v8 = objc_retainAutorelease(v7);
    _Block_object_dispose(&v25, 8);
    objc_msgSend(v8, "setFilteringDisabled:", 1);
    objc_msgSend(getMPMediaLibraryClass(), "defaultMediaLibrary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setCloudFilteringType:", 1);

    v25 = 0;
    v26 = &v25;
    v27 = 0x2050000000;
    v10 = (void *)getMPStoreDownloadManagerClass_softClass;
    v28 = getMPStoreDownloadManagerClass_softClass;
    if (!getMPStoreDownloadManagerClass_softClass)
    {
      v20 = MEMORY[0x1E0C809B0];
      v21 = 3221225472;
      v22 = __getMPStoreDownloadManagerClass_block_invoke;
      v23 = &unk_1E927E328;
      v24 = &v25;
      __getMPStoreDownloadManagerClass_block_invoke((uint64_t)&v20);
      v10 = (void *)v26[3];
    }
    v11 = objc_retainAutorelease(v10);
    _Block_object_dispose(&v25, 8);
    objc_msgSend(v11, "sharedManager");
    v12 = objc_claimAutoreleasedReturnValue();
    downloadManager = v2->_downloadManager;
    v2->_downloadManager = (MPStoreDownloadManager *)v12;

    -[MPStoreDownloadManager addObserver:forDownloads:](v2->_downloadManager, "addObserver:forDownloads:", v2, 0);
    v14 = objc_opt_new();
    assetMap = v2->_assetMap;
    v2->_assetMap = (NSMutableDictionary *)v14;

    v16 = objc_opt_new();
    downloadsMap = v2->_downloadsMap;
    v2->_downloadsMap = (NSMutableDictionary *)v16;

  }
  return v2;
}

- (BOOL)open
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __26__ATMPStoreAssetLink_open__block_invoke;
  block[3] = &unk_1E927E120;
  block[4] = self;
  dispatch_sync(queue, block);
  return 1;
}

- (void)close
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __27__ATMPStoreAssetLink_close__block_invoke;
  block[3] = &unk_1E927E120;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (id)enqueueAssets:(id)a3 force:(BOOL)a4
{
  id v6;
  NSObject *queue;
  id v8;
  id v9;
  _QWORD block[5];
  id v12;
  uint64_t *v13;
  _QWORD *v14;
  BOOL v15;
  _QWORD v16[5];
  id v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v6 = a3;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__1434;
  v22 = __Block_byref_object_dispose__1435;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v23 = (id)objc_claimAutoreleasedReturnValue();
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x3032000000;
  v16[3] = __Block_byref_object_copy__1434;
  v16[4] = __Block_byref_object_dispose__1435;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__ATMPStoreAssetLink_enqueueAssets_force___block_invoke;
  block[3] = &unk_1E927CD08;
  block[4] = self;
  v12 = v6;
  v15 = a4;
  v13 = &v18;
  v14 = v16;
  v8 = v6;
  dispatch_sync(queue, block);
  v9 = (id)v19[5];

  _Block_object_dispose(v16, 8);
  _Block_object_dispose(&v18, 8);

  return v9;
}

- (BOOL)canEnqueueAsset:(id)a3
{
  id v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  char v8;
  BOOL v9;
  void *v10;

  v3 = a3;
  +[ATDeviceSettings sharedInstance](ATDeviceSettings, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "useNewDownloadService");

  if ((v5 & 1) != 0
    || (objc_msgSend(v3, "variantOptions"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v6, "objectForKey:", CFSTR("AssetParts")),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "unsignedIntegerValue"),
        v7,
        v6,
        (objc_msgSend(v3, "bypassStore") & 1) != 0))
  {
    v9 = 0;
  }
  else
  {
    objc_msgSend(v3, "dataclass");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "isEqualToString:", CFSTR("Media")))
    {
      if ((objc_msgSend(v3, "isRestore") & 1) != 0)
        v9 = 0;
      else
        v9 = v8 & 1;
    }
    else
    {
      v9 = 0;
    }

  }
  return v9;
}

- (void)cancelAssets:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[4];
  id v8;
  ATMPStoreAssetLink *v9;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__ATMPStoreAssetLink_cancelAssets___block_invoke;
  block[3] = &unk_1E927E148;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_sync(queue, block);

}

- (void)prioritizeAsset:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *queue;
  id v7;
  _QWORD v8[4];
  id v9;
  ATMPStoreAssetLink *v10;
  uint8_t buf[4];
  ATMPStoreAssetLink *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _ATLogCategoryStoreDownloads();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v12 = self;
    v13 = 2114;
    v14 = v4;
    _os_log_impl(&dword_1D1868000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ Prioritize %{public}@", buf, 0x16u);
  }

  queue = self->_queue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __38__ATMPStoreAssetLink_prioritizeAsset___block_invoke;
  v8[3] = &unk_1E927E148;
  v9 = v4;
  v10 = self;
  v7 = v4;
  dispatch_sync(queue, v8);

}

- (unint64_t)priority
{
  return 50;
}

- (unint64_t)maximumBatchSize
{
  return 3;
}

- (BOOL)linkIsReady
{
  return 1;
}

- (void)downloadManager:(id)a3 downloadDidFinish:(id)a4
{
  id v5;
  NSObject *v6;
  NSObject *queue;
  id v8;
  _QWORD v9[4];
  id v10;
  ATMPStoreAssetLink *v11;
  uint8_t buf[4];
  ATMPStoreAssetLink *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  _ATLogCategoryStoreDownloads();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v13 = self;
    v14 = 2114;
    v15 = v5;
    _os_log_impl(&dword_1D1868000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ download finished: %{public}@", buf, 0x16u);
  }

  queue = self->_queue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __56__ATMPStoreAssetLink_downloadManager_downloadDidFinish___block_invoke;
  v9[3] = &unk_1E927E148;
  v10 = v5;
  v11 = self;
  v8 = v5;
  dispatch_sync(queue, v9);

}

- (void)downloadManager:(id)a3 downloadDidProgress:(id)a4
{
  id v5;
  NSObject *queue;
  id v7;
  _QWORD block[4];
  id v9;
  ATMPStoreAssetLink *v10;

  v5 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__ATMPStoreAssetLink_downloadManager_downloadDidProgress___block_invoke;
  block[3] = &unk_1E927E148;
  v9 = v5;
  v10 = self;
  v7 = v5;
  dispatch_sync(queue, block);

}

- (void)downloadManager:(id)a3 didAddActiveDownloads:(id)a4 removeActiveDownloads:(id)a5
{
  id v7;
  id v8;
  NSObject *queue;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  ATMPStoreAssetLink *v14;
  id v15;

  v7 = a4;
  v8 = a5;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __82__ATMPStoreAssetLink_downloadManager_didAddActiveDownloads_removeActiveDownloads___block_invoke;
  block[3] = &unk_1E927E198;
  v13 = v7;
  v14 = self;
  v15 = v8;
  v10 = v8;
  v11 = v7;
  dispatch_sync(queue, block);

}

- (id)_assetTypeForStoreKind:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;

  v3 = _assetTypeForStoreKind__onceToken_1416;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&_assetTypeForStoreKind__onceToken_1416, &__block_literal_global_1417);
  objc_msgSend((id)_assetTypeForStoreKind__assetTypeByStoreKind_1418, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_dataClassForStoreKind:(id)a3
{
  id v5;
  void *v6;
  void *v8;

  v5 = a3;
  if (_dataClassForStoreKind__onceToken_1408 != -1)
    dispatch_once(&_dataClassForStoreKind__onceToken_1408, &__block_literal_global_36);
  objc_msgSend((id)_dataClassForStoreKind__dataClassByKind_1409, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ATMPStoreAssetLink.m"), 324, CFSTR("Unknown dataclass for kind %@"), v5);

  }
  return v6;
}

- (void)_enqueueAssets:(id)a3
{
  id v3;
  uint64_t v4;
  __int128 v5;
  uint64_t i;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  __int128 v25;
  id obj;
  void *v28;
  void *v29;
  uint64_t v30;
  _QWORD v31[5];
  _QWORD v32[4];
  id v33;
  ATMPStoreAssetLink *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t v42;
  _QWORD v43[6];
  _QWORD v44[6];
  uint8_t v45[128];
  __int128 buf;
  void (*v47)(uint64_t);
  void *v48;
  uint64_t *v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "count");
  ATReportEventAddIntToScalarKey();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  obj = v3;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
  if (v4)
  {
    v30 = *(_QWORD *)v36;
    *(_QWORD *)&v5 = 138543362;
    v25 = v5;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v36 != v30)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
        objc_msgSend(v7, "identifier", v25);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "longLongValue");

        objc_msgSend(getMPMediaLibraryClass(), "defaultMediaLibrary");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "itemWithPersistentID:verifyExistence:", v9, 0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v7, "downloadOnly"))
          v12 = 2;
        else
          v12 = 0;
        v43[0] = CFSTR("MPStoreDownloadAttributeBackgroundRequest");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v7, "isForeground") ^ 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v44[0] = v13;
        v44[1] = MEMORY[0x1E0C9AAB0];
        v43[1] = CFSTR("MPStoreDownloadAttributeShouldRespectMusicCellularDataRestriction");
        v43[2] = CFSTR("MPStoreDownloadAttributeShouldRespectStoreCellularDataRestriction");
        v44[2] = MEMORY[0x1E0C9AAA0];
        v44[3] = CFSTR("com.apple.Music");
        v43[3] = CFSTR("MPStoreDownloadAttributeClientBundleIdentifier");
        v43[4] = CFSTR("MPStoreDownloadAttributeSkipInstall");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v7, "downloadOnly"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v44[4] = v14;
        v43[5] = CFSTR("MPStoreDownloadAttributeReason");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v12);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v44[5] = v15;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v44, v43, 6);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        v39 = 0;
        v40 = &v39;
        v41 = 0x2050000000;
        v17 = (void *)getMPStoreDownloadClass_softClass;
        v42 = getMPStoreDownloadClass_softClass;
        if (!getMPStoreDownloadClass_softClass)
        {
          *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
          *((_QWORD *)&buf + 1) = 3221225472;
          v47 = __getMPStoreDownloadClass_block_invoke;
          v48 = &unk_1E927E328;
          v49 = &v39;
          __getMPStoreDownloadClass_block_invoke((uint64_t)&buf);
          v17 = (void *)v40[3];
        }
        v18 = objc_retainAutorelease(v17);
        _Block_object_dispose(&v39, 8);
        objc_msgSend(v18, "storeDownloadForMediaItem:type:attributes:", v11, 1, v16);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (v19)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v9);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "setObject:forKey:", v7, v20);

          objc_msgSend(v28, "addObject:", v19);
        }
        else
        {
          _ATLogCategoryStoreDownloads();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            LODWORD(buf) = v25;
            *(_QWORD *)((char *)&buf + 4) = v7;
            _os_log_impl(&dword_1D1868000, v21, OS_LOG_TYPE_ERROR, "failed to create download for asset %{public}@ cancelling the asset download ", (uint8_t *)&buf, 0xCu);
          }

          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ATError"), 2, 0);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[ATMPStoreAssetLink _finishAsset:error:retryable:](self, "_finishAsset:error:retryable:", v7, v22, 1);

        }
      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
    }
    while (v4);
  }

  if (objc_msgSend(v28, "count"))
  {
    -[MPStoreDownloadManager addDownloads:](self->_downloadManager, "addDownloads:", v28);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    _ATLogCategoryStoreDownloads_Oversize();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = v23;
      _os_log_impl(&dword_1D1868000, v24, OS_LOG_TYPE_DEFAULT, "StoreDownloadManager returned %{public}@ added downloads", (uint8_t *)&buf, 0xCu);
    }

    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __37__ATMPStoreAssetLink__enqueueAssets___block_invoke;
    v32[3] = &unk_1E927CD98;
    v33 = v29;
    v34 = self;
    objc_msgSend(v23, "enumerateObjectsUsingBlock:", v32);

  }
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __37__ATMPStoreAssetLink__enqueueAssets___block_invoke_2;
  v31[3] = &unk_1E927CDC0;
  v31[4] = self;
  objc_msgSend(v29, "enumerateKeysAndObjectsUsingBlock:", v31);

}

- (void)_finishAsset:(id)a3 error:(id)a4 retryable:(BOOL)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  NSMutableDictionary *assetMap;
  void *v13;
  NSMutableDictionary *downloadsMap;
  void *v15;
  NSObject *callbackQueue;
  id v17;
  id v18;
  void *v19;
  int v20;
  uint64_t v21;
  double v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t);
  void *v26;
  id v27;
  ATMPStoreAssetLink *v28;
  id v29;
  BOOL v30;

  v8 = a3;
  v9 = a4;
  objc_msgSend(v8, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "longLongValue");

  assetMap = self->_assetMap;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeObjectForKey:](assetMap, "removeObjectForKey:", v13);

  downloadsMap = self->_downloadsMap;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeObjectForKey:](downloadsMap, "removeObjectForKey:", v15);

  callbackQueue = self->_callbackQueue;
  v23 = MEMORY[0x1E0C809B0];
  v24 = 3221225472;
  v25 = __51__ATMPStoreAssetLink__finishAsset_error_retryable___block_invoke;
  v26 = &unk_1E927CDE8;
  v17 = v8;
  v27 = v17;
  v28 = self;
  v18 = v9;
  v29 = v18;
  v30 = a5;
  dispatch_async(callbackQueue, &v23);
  if (v18)
  {
    ATReportEventIncrementingScalarKey();
    objc_msgSend(v18, "domain", v23, v24, v25, v26, v27, v28);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "isEqualToString:", CFSTR("ATError"));

    if (v20)
    {
      v21 = objc_msgSend(v18, "code");
      if (v21 == 8 || v21 == 4 || v21 == 2)
        ATReportEventIncrementingScalarKey();
    }
  }
  else
  {
    ATReportEventIncrementingScalarKey();
    objc_msgSend(v17, "transferStartTime", v23, v24, v25, v26, v27, v28);
    if (v22 != 0.0)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
      objc_msgSend(v17, "transferStartTime");
      ATReportEventAddDoubleToScalarKey();
    }
  }

}

- (id)_errorForFinishedDownload:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "failureError");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isCanceled"))
  {
    v6 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend(v4, "failureError");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v16 = *MEMORY[0x1E0CB3388];
      objc_msgSend(v4, "failureError");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = v3;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }
    v10 = v6;
    v11 = 2;
  }
  else
  {
    if (objc_msgSend(v5, "code") != 103)
      goto LABEL_14;
    v9 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend(v4, "failureError");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v14 = *MEMORY[0x1E0CB3388];
      objc_msgSend(v4, "failureError");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v3;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }
    v10 = v9;
    v11 = 14;
  }
  objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("ATError"), v11, v8);
  v12 = objc_claimAutoreleasedReturnValue();

  if (v7)
  {

  }
  v5 = (void *)v12;
LABEL_14:

  return v5;
}

- (BOOL)isOpen
{
  return self->_open;
}

- (ATAssetLinkDelegate)delegate
{
  return (ATAssetLinkDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downloadsMap, 0);
  objc_storeStrong((id *)&self->_assetMap, 0);
  objc_storeStrong((id *)&self->_downloadManager, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __51__ATMPStoreAssetLink__finishAsset_error_retryable___block_invoke(uint64_t a1)
{
  id WeakRetained;

  if (*(_QWORD *)(a1 + 32))
  {
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 16));
    objc_msgSend(WeakRetained, "assetLink:didFinishAsset:error:retryable:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 56));

  }
}

void __37__ATMPStoreAssetLink__enqueueAssets___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  v3 = objc_msgSend(v6, "libraryItemIdentifier");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 48), "setObject:forKey:", v5, v4);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 56), "setObject:forKey:", v6, v4);
    objc_msgSend(*(id *)(a1 + 32), "removeObjectForKey:", v4);
  }

}

void __37__ATMPStoreAssetLink__enqueueAssets___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _ATLogCategoryStoreDownloads();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    v6 = 138543362;
    v7 = v4;
    _os_log_impl(&dword_1D1868000, v5, OS_LOG_TYPE_ERROR, "failed to enqueue asset %{public}@ for download", (uint8_t *)&v6, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "_finishAsset:error:retryable:", v4, 0, 1);
}

uint64_t __45__ATMPStoreAssetLink__dataClassForStoreKind___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v1 = (void *)_dataClassForStoreKind__dataClassByKind_1409;
  _dataClassForStoreKind__dataClassByKind_1409 = (uint64_t)v0;

  objc_msgSend((id)_dataClassForStoreKind__dataClassByKind_1409, "setObject:forKeyedSubscript:", CFSTR("Application"), *MEMORY[0x1E0DAF858]);
  objc_msgSend((id)_dataClassForStoreKind__dataClassByKind_1409, "setObject:forKeyedSubscript:", CFSTR("Book"), *MEMORY[0x1E0DAF810]);
  objc_msgSend((id)_dataClassForStoreKind__dataClassByKind_1409, "setObject:forKeyedSubscript:", CFSTR("Media"), *MEMORY[0x1E0DAF800]);
  objc_msgSend((id)_dataClassForStoreKind__dataClassByKind_1409, "setObject:forKeyedSubscript:", CFSTR("Media"), *MEMORY[0x1E0DAF830]);
  objc_msgSend((id)_dataClassForStoreKind__dataClassByKind_1409, "setObject:forKeyedSubscript:", CFSTR("Media"), *MEMORY[0x1E0DAF838]);
  objc_msgSend((id)_dataClassForStoreKind__dataClassByKind_1409, "setObject:forKeyedSubscript:", CFSTR("Media"), *MEMORY[0x1E0DAF840]);
  objc_msgSend((id)_dataClassForStoreKind__dataClassByKind_1409, "setObject:forKeyedSubscript:", CFSTR("Media"), *MEMORY[0x1E0DAF860]);
  objc_msgSend((id)_dataClassForStoreKind__dataClassByKind_1409, "setObject:forKeyedSubscript:", CFSTR("Media"), *MEMORY[0x1E0DAF878]);
  return objc_msgSend((id)_dataClassForStoreKind__dataClassByKind_1409, "setObject:forKeyedSubscript:", CFSTR("Media"), *MEMORY[0x1E0DAF848]);
}

uint64_t __45__ATMPStoreAssetLink__assetTypeForStoreKind___block_invoke()
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;

  v0 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v1 = (void *)_assetTypeForStoreKind__assetTypeByStoreKind_1418;
  _assetTypeForStoreKind__assetTypeByStoreKind_1418 = (uint64_t)v0;

  objc_msgSend((id)_assetTypeForStoreKind__assetTypeByStoreKind_1418, "setObject:forKeyedSubscript:", CFSTR("Audiobook"), *MEMORY[0x1E0DAF800]);
  objc_msgSend((id)_assetTypeForStoreKind__assetTypeByStoreKind_1418, "setObject:forKeyedSubscript:", CFSTR("Movie"), *MEMORY[0x1E0DAF830]);
  objc_msgSend((id)_assetTypeForStoreKind__assetTypeByStoreKind_1418, "setObject:forKeyedSubscript:", CFSTR("Music"), *MEMORY[0x1E0DAF838]);
  objc_msgSend((id)_assetTypeForStoreKind__assetTypeByStoreKind_1418, "setObject:forKeyedSubscript:", CFSTR("MusicVideo"), *MEMORY[0x1E0DAF840]);
  v2 = *MEMORY[0x1E0DAF848];
  objc_msgSend((id)_assetTypeForStoreKind__assetTypeByStoreKind_1418, "setObject:forKeyedSubscript:", CFSTR("Podcast"), *MEMORY[0x1E0DAF848]);
  objc_msgSend((id)_assetTypeForStoreKind__assetTypeByStoreKind_1418, "setObject:forKeyedSubscript:", CFSTR("TVEpisode"), *MEMORY[0x1E0DAF860]);
  v3 = *MEMORY[0x1E0DAF878];
  objc_msgSend((id)_assetTypeForStoreKind__assetTypeByStoreKind_1418, "setObject:forKeyedSubscript:", CFSTR("VideoPodcast"), *MEMORY[0x1E0DAF878]);
  objc_msgSend((id)_assetTypeForStoreKind__assetTypeByStoreKind_1418, "setObject:forKeyedSubscript:", CFSTR("iTunesU"), v2);
  return objc_msgSend((id)_assetTypeForStoreKind__assetTypeByStoreKind_1418, "setObject:forKeyedSubscript:", CFSTR("iTunesUVideo"), v3);
}

void __82__ATMPStoreAssetLink_downloadManager_didAddActiveDownloads_removeActiveDownloads___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id WeakRetained;
  _QWORD v6[6];
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__1434;
  v12 = __Block_byref_object_dispose__1435;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v2 = MEMORY[0x1E0C809B0];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __82__ATMPStoreAssetLink_downloadManager_didAddActiveDownloads_removeActiveDownloads___block_invoke_2;
  v7[3] = &unk_1E927CD30;
  v3 = (void *)a1[4];
  v7[4] = a1[5];
  v7[5] = &v8;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v7);
  v6[0] = v2;
  v6[1] = 3221225472;
  v6[2] = __82__ATMPStoreAssetLink_downloadManager_didAddActiveDownloads_removeActiveDownloads___block_invoke_3;
  v6[3] = &unk_1E927CD30;
  v4 = (void *)a1[6];
  v6[4] = a1[5];
  v6[5] = &v8;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v6);
  WeakRetained = objc_loadWeakRetained((id *)(a1[5] + 16));
  objc_msgSend(WeakRetained, "assetLink:didTransitionAssetStates:", a1[5], v9[5]);

  _Block_object_dispose(&v8, 8);
}

void __82__ATMPStoreAssetLink_downloadManager_didAddActiveDownloads_removeActiveDownloads___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;

  v3 = objc_msgSend(a2, "libraryItemIdentifier");
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "setAssetState:", 1);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v6);
  }

}

void __82__ATMPStoreAssetLink_downloadManager_didAddActiveDownloads_removeActiveDownloads___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;

  v3 = objc_msgSend(a2, "libraryItemIdentifier");
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "setAssetState:", 0);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v6);
  }

}

void __58__ATMPStoreAssetLink_downloadManager_downloadDidProgress___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id WeakRetained;
  uint64_t v6;
  id v7;

  v2 = objc_msgSend(*(id *)(a1 + 32), "libraryItemIdentifier");
  v3 = *(void **)(*(_QWORD *)(a1 + 40) + 48);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v4);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 16));
    v6 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "percentComplete");
    objc_msgSend(WeakRetained, "assetLink:didUpdateAsset:progress:", v6, v7);

  }
}

void __56__ATMPStoreAssetLink_downloadManager_downloadDidFinish___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  void *v28;
  uint8_t buf[4];
  NSObject *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 32), "libraryItemIdentifier");
  v3 = *(void **)(*(_QWORD *)(a1 + 40) + 48);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 40), "_errorForFinishedDownload:", *(_QWORD *)(a1 + 32));
    v6 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_getDownloadFilePath");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    if (!v6 && v7)
    {
      objc_msgSend(MEMORY[0x1E0CF7678], "sharedInstance");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "dataclass");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v10;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v28, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "createAirlockForDataclasses:", v11);

      objc_msgSend(v5, "dataclass");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "pathForDataclass:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "lastPathComponent");
      v14 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringByAppendingPathComponent:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 0;
      LOBYTE(v14) = objc_msgSend(v16, "moveItemAtPath:toPath:error:", v8, v15, &v26);
      v6 = v26;

      if ((v14 & 1) != 0)
      {
        objc_msgSend(v5, "setPath:", v15);
      }
      else
      {
        _ATLogCategoryStoreDownloads();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v30 = v6;
          _os_log_impl(&dword_1D1868000, v18, OS_LOG_TYPE_ERROR, "failed to move download file to airlock. error=%{public}@", buf, 0xCu);
        }

      }
    }
    v19 = *(void **)(*(_QWORD *)(a1 + 40) + 56);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "removeObjectForKey:", v20);

    v21 = *(void **)(*(_QWORD *)(a1 + 40) + 48);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v2);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "removeObjectForKey:", v22);

    v23 = *(_QWORD *)(a1 + 40);
    v24 = *(void **)(v23 + 40);
    v27 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v27, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "removeObserver:forDownloads:", v23, v25);

    objc_msgSend(*(id *)(a1 + 40), "_finishAsset:error:retryable:", v5, v6, 1);
  }
  else
  {
    _ATLogCategoryStoreDownloads();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v17 = *(NSObject **)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      v30 = v17;
      _os_log_impl(&dword_1D1868000, v6, OS_LOG_TYPE_DEFAULT, "no pending asset found for download. download=%{public}@", buf, 0xCu);
    }
  }

}

void __38__ATMPStoreAssetLink_prioritizeAsset___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "longLongValue");

  v4 = *(void **)(*(_QWORD *)(a1 + 40) + 56);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v14[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
    v7 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 40), "resumeDownloads:", v7);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 40), "prioritizeDownloads:", v7);
    objc_msgSend(*(id *)(a1 + 32), "setIsPrioritized:", 1);
  }
  else
  {
    _ATLogCategoryStoreDownloads();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(a1 + 32);
      v8 = *(_QWORD *)(a1 + 40);
      v10 = 138543618;
      v11 = v8;
      v12 = 2114;
      v13 = v9;
      _os_log_impl(&dword_1D1868000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ can't prioritize asset because no download was found. asset=%{public}@", (uint8_t *)&v10, 0x16u);
    }
  }

}

void __35__ATMPStoreAssetLink_cancelAssets___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  void *v25;
  void *v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v18, v27, 16);
  if (v3)
  {
    v5 = v3;
    v6 = *(_QWORD *)v19;
    *(_QWORD *)&v4 = 138543618;
    v17 = v4;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v19 != v6)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v8, "identifier", v17, (_QWORD)v18);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "longLongValue");

        v11 = *(void **)(*(_QWORD *)(a1 + 40) + 56);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKey:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          v14 = *(void **)(*(_QWORD *)(a1 + 40) + 40);
          v26 = v13;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v26, 1);
          v15 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "cancelDownloads:", v15);
        }
        else
        {
          _ATLogCategoryStoreDownloads();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            v16 = *(_QWORD *)(a1 + 40);
            *(_DWORD *)buf = v17;
            v23 = v16;
            v24 = 2114;
            v25 = v8;
            _os_log_impl(&dword_1D1868000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ can't cancel asset because no download was found. asset=%{public}@", buf, 0x16u);
          }
        }

      }
      v5 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v18, v27, 16);
    }
    while (v5);
  }

}

uint64_t __42__ATMPStoreAssetLink_enqueueAssets_force___block_invoke(uint64_t a1)
{
  unint64_t v2;
  __int128 v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t result;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  __int128 v23;
  id obj;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  uint64_t v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  void *v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "count");
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = *(id *)(a1 + 40);
  v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v38, 16);
  if (v25)
  {
    v4 = *(_QWORD *)v27;
    *(_QWORD *)&v3 = 138544130;
    v23 = v3;
    do
    {
      for (i = 0; i != v25; ++i)
      {
        if (*(_QWORD *)v27 != v4)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend(v6, "identifier", v23);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "longLongValue");

        v9 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKey:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
        {
          _ATLogCategoryStoreDownloads();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            v13 = v4;
            v14 = v2;
            v15 = *(_QWORD *)(a1 + 32);
            objc_msgSend(v11, "phaseIdentifier");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v23;
            v31 = v15;
            v2 = v14;
            v4 = v13;
            v32 = 2114;
            v33 = v11;
            v34 = 2114;
            v35 = v16;
            v36 = 2114;
            v37 = v6;
            _os_log_impl(&dword_1D1868000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ Matched enqueued download %{public}@ (%{public}@) for %{public}@", buf, 0x2Au);

          }
          v17 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v8);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setObject:forKey:", v6, v18);

          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addObject:", v6);
        }
        else if (*(_BYTE *)(a1 + 64) || v2 <= 2)
        {
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "addObject:", v6);
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addObject:", v6);
          ++v2;
        }

      }
      v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v38, 16);
    }
    while (v25);
  }

  result = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "count");
  if (result)
  {
    _ATLogCategoryStoreDownloads_Oversize();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = *(_QWORD *)(a1 + 32);
      v22 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
      *(_DWORD *)buf = 138543618;
      v31 = v21;
      v32 = 2114;
      v33 = v22;
      _os_log_impl(&dword_1D1868000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@ Enqueuing %{public}@ new assets to download", buf, 0x16u);
    }

    return objc_msgSend(*(id *)(a1 + 32), "_enqueueAssets:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
  }
  return result;
}

void __27__ATMPStoreAssetLink_close__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  _QWORD block[5];

  v1 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v1 + 8))
  {
    *(_BYTE *)(v1 + 8) = 0;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "allValues");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "count"))
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "removeObserver:forDownloads:", *(_QWORD *)(a1 + 32), v3);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(NSObject **)(v4 + 32);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __27__ATMPStoreAssetLink_close__block_invoke_2;
    block[3] = &unk_1E927E120;
    block[4] = v4;
    dispatch_async(v5, block);

  }
}

void __27__ATMPStoreAssetLink_close__block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "assetLink:didCloseWithOutstandingAssets:", *(_QWORD *)(a1 + 32), 0);

}

void __26__ATMPStoreAssetLink_open__block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  BOOL v17;
  NSObject *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  NSObject *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  uint64_t v38;
  id obj;
  uint64_t v40;
  _QWORD block[5];
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint8_t buf[4];
  void *v48;
  __int16 v49;
  void *v50;
  __int16 v51;
  int v52;
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v1 + 8))
  {
    *(_BYTE *)(v1 + 8) = 1;
    v37 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "downloads");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v53, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v44;
      v6 = *MEMORY[0x1E0DAF988];
      v40 = *MEMORY[0x1E0DAF970];
      v35 = *MEMORY[0x1E0DAF998];
      v34 = *MEMORY[0x1E0DAFA00];
      v33 = *MEMORY[0x1E0DAF9E8];
      v36 = *MEMORY[0x1E0DAF988];
      do
      {
        v7 = 0;
        v38 = v4;
        do
        {
          if (*(_QWORD *)v44 != v5)
            objc_enumerationMutation(obj);
          v8 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * v7);
          _ATLogCategoryStoreDownloads();
          v9 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
          {
            v10 = *(void **)(a1 + 32);
            *(_DWORD *)buf = 138543618;
            v48 = v10;
            v49 = 2114;
            v50 = v8;
            _os_log_impl(&dword_1D1868000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ Found active download: %{public}@", buf, 0x16u);
          }

          objc_msgSend(v8, "_SSDownload");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = *(void **)(a1 + 32);
          objc_msgSend(v11, "valueForProperty:", v6);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "_dataClassForStoreKind:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v11, "valueForProperty:", v40);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "BOOLValue");

          if (objc_msgSend(v14, "isEqualToString:", CFSTR("Media")))
            v17 = v16 == 0;
          else
            v17 = 0;
          if (v17)
          {
            v18 = objc_alloc_init(MEMORY[0x1E0CF7680]);
            objc_msgSend(v11, "valueForProperty:", v35);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject setIdentifier:](v18, "setIdentifier:", v19);

            -[NSObject setDataclass:](v18, "setDataclass:", v14);
            -[NSObject setIsDownload:](v18, "setIsDownload:", 1);
            v20 = *(void **)(a1 + 32);
            objc_msgSend(v11, "valueForProperty:", v6);
            v21 = v5;
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "_assetTypeForStoreKind:", v22);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject setAssetType:](v18, "setAssetType:", v23);

            -[NSObject setVariantOptions:](v18, "setVariantOptions:", &unk_1E928B970);
            -[NSObject setIsRestore:](v18, "setIsRestore:", 0);
            objc_msgSend(v11, "valueForProperty:", v34);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject setPrettyName:](v18, "setPrettyName:", v24);

            objc_msgSend(v11, "valueForProperty:", v33);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject setIcon:](v18, "setIcon:", v25);

            -[NSObject setStorePID:](v18, "setStorePID:", objc_msgSend(v11, "persistentIdentifier"));
            v26 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v8, "libraryItemIdentifier"));
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "setObject:forKey:", v18, v27);

            v28 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v8, "libraryItemIdentifier"));
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "setObject:forKey:", v8, v29);

            v5 = v21;
            v4 = v38;
            v6 = v36;
            objc_msgSend(v37, "addObject:", v18);
          }
          else
          {
            _ATLogCategoryStoreDownloads();
            v18 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138543874;
              v48 = v8;
              v49 = 2114;
              v50 = v14;
              v51 = 1024;
              v52 = v16;
              _os_log_impl(&dword_1D1868000, v18, OS_LOG_TYPE_INFO, "ignoring active download:%{public}@. dataClass:%{public}@, isRestore%d", buf, 0x1Cu);
            }
          }

          ++v7;
        }
        while (v4 != v7);
        v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v53, 16);
      }
      while (v4);
    }

    v30 = *(_QWORD *)(a1 + 32);
    v31 = *(NSObject **)(v30 + 32);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __26__ATMPStoreAssetLink_open__block_invoke_10;
    block[3] = &unk_1E927E148;
    block[4] = v30;
    v42 = v37;
    v32 = v37;
    dispatch_async(v31, block);

  }
}

void __26__ATMPStoreAssetLink_open__block_invoke_10(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assetLink:didOpenWithPendingAssets:", v2, v3);

}

@end
