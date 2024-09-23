@implementation ATStoreDownloadService

- (ATStoreDownloadService)init
{
  ATStoreDownloadService *v2;
  NSOperationQueue *v3;
  NSOperationQueue *prepareOperationQueue;
  NSOperationQueue *v5;
  NSOperationQueue *downloadOperationQueue;
  NSOperationQueue *v7;
  NSOperationQueue *processAssetsOperationQueue;
  uint64_t v9;
  NSMutableDictionary *downloadOperations;
  uint64_t v11;
  NSMutableSet *observers;
  dispatch_queue_t v13;
  OS_dispatch_queue *callbackQueue;
  ICUnfairLock *v15;
  ICUnfairLock *lock;
  id v17;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)ATStoreDownloadService;
  v2 = -[ATStoreDownloadService init](&v19, sel_init);
  if (v2)
  {
    v3 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    prepareOperationQueue = v2->_prepareOperationQueue;
    v2->_prepareOperationQueue = v3;

    -[NSOperationQueue setMaxConcurrentOperationCount:](v2->_prepareOperationQueue, "setMaxConcurrentOperationCount:", 1);
    -[NSOperationQueue setQualityOfService:](v2->_prepareOperationQueue, "setQualityOfService:", -1);
    v5 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    downloadOperationQueue = v2->_downloadOperationQueue;
    v2->_downloadOperationQueue = v5;

    -[NSOperationQueue setMaxConcurrentOperationCount:](v2->_downloadOperationQueue, "setMaxConcurrentOperationCount:", 3);
    -[NSOperationQueue setQualityOfService:](v2->_downloadOperationQueue, "setQualityOfService:", -1);
    v7 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    processAssetsOperationQueue = v2->_processAssetsOperationQueue;
    v2->_processAssetsOperationQueue = v7;

    -[NSOperationQueue setMaxConcurrentOperationCount:](v2->_processAssetsOperationQueue, "setMaxConcurrentOperationCount:", 3);
    -[NSOperationQueue setQualityOfService:](v2->_processAssetsOperationQueue, "setQualityOfService:", -1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v9 = objc_claimAutoreleasedReturnValue();
    downloadOperations = v2->_downloadOperations;
    v2->_downloadOperations = (NSMutableDictionary *)v9;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v11 = objc_claimAutoreleasedReturnValue();
    observers = v2->_observers;
    v2->_observers = (NSMutableSet *)v11;

    v13 = dispatch_queue_create("com.apple.atc.ATStoreDownloadService.callback", MEMORY[0x1E0C80D50]);
    callbackQueue = v2->_callbackQueue;
    v2->_callbackQueue = (OS_dispatch_queue *)v13;

    v15 = (ICUnfairLock *)objc_alloc_init(MEMORY[0x1E0DDC0F8]);
    lock = v2->_lock;
    v2->_lock = v15;

    -[ATStoreDownloadService _prepareDownloadDirectory](v2, "_prepareDownloadDirectory");
    v17 = (id)objc_msgSend(MEMORY[0x1E0DDBEE0], "defaultManager");
  }
  return v2;
}

- (void)enqueueAsset:(id)a3
{
  id v5;
  NSObject *v6;
  id v7;
  void *v8;
  uint64_t v9;
  ICUnfairLock *lock;
  id v11;
  NSMutableSet *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  NSObject *callbackQueue;
  void *v19;
  void *v20;
  void *v21;
  NSMutableDictionary *progressForAsset;
  void *v23;
  NSOperationQueue *prepareOperationQueue;
  id v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  _QWORD v30[5];
  id v31;
  id v32;
  SEL v33;
  _QWORD block[6];
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _QWORD v40[5];
  id v41;
  id v42;
  uint8_t v43[128];
  uint8_t buf[4];
  ATStoreDownloadService *v45;
  __int16 v46;
  id v47;
  __int16 v48;
  int v49;
  __int16 v50;
  int v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _ATLogCategoryStoreDownloads();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138544130;
    v45 = self;
    v46 = 2114;
    v47 = v5;
    v48 = 1024;
    v49 = objc_msgSend(v5, "powerRequired");
    v50 = 1024;
    v51 = objc_msgSend(v5, "canUseCellularData");
    _os_log_impl(&dword_1D1868000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ Enqueing download for asset %{public}@. requiresPower=%d, canUseCellularData=%d", buf, 0x22u);
  }

  v7 = -[ATStoreDownloadService _newPrepareOperationForAsset:](self, "_newPrepareOperationForAsset:", v5);
  v8 = v7;
  if (v7)
  {
    v9 = MEMORY[0x1E0C809B0];
    lock = self->_lock;
    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v40[2] = __39__ATStoreDownloadService_enqueueAsset___block_invoke;
    v40[3] = &unk_1E927E198;
    v40[4] = self;
    v28 = v7;
    v27 = v7;
    v41 = v27;
    v29 = v5;
    v11 = v5;
    v42 = v11;
    -[ICUnfairLock lockWithBlock:](lock, "lockWithBlock:", v40);
    v38 = 0u;
    v39 = 0u;
    v37 = 0u;
    v36 = 0u;
    v12 = self->_observers;
    v13 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v36, v43, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v37;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v37 != v15)
            objc_enumerationMutation(v12);
          v17 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * i);
          callbackQueue = self->_callbackQueue;
          block[0] = v9;
          block[1] = 3221225472;
          block[2] = __39__ATStoreDownloadService_enqueueAsset___block_invoke_2;
          block[3] = &unk_1E927E198;
          block[4] = v17;
          block[5] = self;
          v35 = v11;
          dispatch_async(callbackQueue, block);

        }
        v14 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v36, v43, 16);
      }
      while (v14);
    }

    objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", 100);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "progress");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addChild:withPendingUnitCount:", v20, 5);

    NSStringFromSelector(sel_fractionCompleted);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addObserver:forKeyPath:options:context:", self, v21, 3, v11);

    progressForAsset = self->_progressForAsset;
    objc_msgSend(v11, "identifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](progressForAsset, "setObject:forKey:", v19, v23);

    -[ATStoreDownloadService _updateStateForAsset:oldState:newState:](self, "_updateStateForAsset:oldState:newState:", v11, 0, 1);
    prepareOperationQueue = self->_prepareOperationQueue;
    v30[0] = v9;
    v30[1] = 3221225472;
    v30[2] = __39__ATStoreDownloadService_enqueueAsset___block_invoke_3;
    v30[3] = &unk_1E927CA78;
    v30[4] = self;
    v32 = v19;
    v33 = a2;
    v31 = v11;
    v25 = v19;
    objc_msgSend(v27, "performOnOperationQueue:completion:", prepareOperationQueue, v30);

    v5 = v29;
    v8 = v28;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ATError"), 21, 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATStoreDownloadService _finishAsset:withError:cancelPendingDownloads:](self, "_finishAsset:withError:cancelPendingDownloads:", v5, v26, 0);

  }
}

- (void)cancelAsset:(id)a3
{
  id v4;
  ICUnfairLock *lock;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __38__ATStoreDownloadService_cancelAsset___block_invoke;
  v7[3] = &unk_1E927E148;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[ICUnfairLock lockWithBlock:](lock, "lockWithBlock:", v7);

}

- (void)prioritizeAsset:(id)a3
{
  id v4;
  NSObject *v5;
  ICUnfairLock *lock;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  ATStoreDownloadService *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _ATLogCategoryStoreDownloads();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v11 = self;
    v12 = 2114;
    v13 = v4;
    _os_log_impl(&dword_1D1868000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ prioritizing download %{public}@", buf, 0x16u);
  }

  lock = self->_lock;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __42__ATStoreDownloadService_prioritizeAsset___block_invoke;
  v8[3] = &unk_1E927E148;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  -[ICUnfairLock lockWithBlock:](lock, "lockWithBlock:", v8);

}

- (void)addDownloadObserver:(id)a3
{
  id v4;
  ICUnfairLock *lock;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __46__ATStoreDownloadService_addDownloadObserver___block_invoke;
  v7[3] = &unk_1E927E148;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[ICUnfairLock lockWithBlock:](lock, "lockWithBlock:", v7);

}

- (void)removeDownloadObserver:(id)a3
{
  id v4;
  ICUnfairLock *lock;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __49__ATStoreDownloadService_removeDownloadObserver___block_invoke;
  v7[3] = &unk_1E927E148;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[ICUnfairLock lockWithBlock:](lock, "lockWithBlock:", v7);

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  char isKindOfClass;
  void *v13;
  int v14;
  int v15;
  double v16;
  id v17;

  v17 = a3;
  v10 = a5;
  v11 = a4;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0 && objc_msgSend(v17, "isEqualToString:", CFSTR("fractionCompleted")))
  {
    objc_msgSend(v10, "objectForKey:", *MEMORY[0x1E0CB2CB8]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "floatValue");
    v15 = v14;

    LODWORD(v16) = v15;
    -[ATStoreDownloadService _updateProgressForAsset:progress:](self, "_updateProgressForAsset:progress:", a6, v16);
  }

}

- (void)_prepareDownloadDirectory
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  __int128 v18;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  id v25;
  uint8_t v26[128];
  uint8_t buf[4];
  ATStoreDownloadService *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  +[ATStoreDownloadService downloadDirectoryPath](ATStoreDownloadService, "downloadDirectoryPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0;
  objc_msgSend(v3, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v2, 1, 0, &v25);
  v4 = v25;

  if (v4)
  {
    _ATLogCategoryStoreDownloads();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      v28 = self;
      v29 = 2114;
      v30 = v2;
      v31 = 2114;
      v32 = v4;
      _os_log_impl(&dword_1D1868000, v5, OS_LOG_TYPE_ERROR, "%{public}@ Encountered error creating directory %{public}@. error=%{public}@", buf, 0x20u);
    }

  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "enumeratorAtPath:", v2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v9)
  {
    v11 = v9;
    v12 = *(_QWORD *)v22;
    *(_QWORD *)&v10 = 138543874;
    v18 = v10;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v22 != v12)
          objc_enumerationMutation(v8);
        objc_msgSend(v2, "stringByAppendingPathComponent:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v13), v18);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = 0;
        objc_msgSend(v15, "removeItemAtPath:error:", v14, &v20);
        v16 = v20;

        if (v16)
        {
          _ATLogCategoryStoreDownloads();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v18;
            v28 = self;
            v29 = 2114;
            v30 = v14;
            v31 = 2114;
            v32 = v16;
            _os_log_impl(&dword_1D1868000, v17, OS_LOG_TYPE_ERROR, "%{public}@ Encountered error removing file in download directory. path=%{public}@ error=%{public}@", buf, 0x20u);
          }

        }
        objc_msgSend(v8, "skipDescendants");

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v11);
  }

}

- (id)_newPrepareOperationForAsset:(id)a3
{
  id v3;
  void *v4;
  __objc2_class **v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;

  v3 = a3;
  objc_msgSend(v3, "assetType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("Podcast")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("VideoPodcast")) & 1) != 0)
  {
    v5 = off_1E9271DC8;
    goto LABEL_11;
  }
  objc_msgSend(v3, "dataclass");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isEqualToString:", CFSTR("Book")) & 1) != 0)
  {

LABEL_7:
    v5 = off_1E9271D78;
    goto LABEL_11;
  }
  v7 = objc_msgSend(v4, "isEqualToString:", CFSTR("Audiobook"));

  if ((v7 & 1) != 0)
    goto LABEL_7;
  objc_msgSend(v3, "storeInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "endpointType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "integerValue");

  if ((objc_msgSend(v3, "isRestore") & (v10 < 2)) != 0)
    v5 = off_1E9271DB8;
  else
    v5 = off_1E9271DA8;
LABEL_11:
  v11 = (void *)objc_msgSend(objc_alloc(*v5), "initWithAsset:", v3);

  return v11;
}

- (id)_newAssetOperationForAsset:(id)a3 prepareOperationResult:(id)a4
{
  id v5;
  id v6;
  void *v7;
  __objc2_class **v8;
  void *v9;
  void *v11;
  int v12;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "assetType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "isEqualToString:", CFSTR("Podcast")) & 1) != 0
    || (objc_msgSend(v7, "isEqualToString:", CFSTR("VideoPodcast")) & 1) != 0)
  {
    v8 = off_1E9271DC0;
  }
  else
  {
    objc_msgSend(v5, "dataclass");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v11, "isEqualToString:", CFSTR("Book")) & 1) != 0)
    {

      v8 = off_1E9271D70;
    }
    else
    {
      v12 = objc_msgSend(v7, "isEqualToString:", CFSTR("Audiobook"));

      v8 = off_1E9271DA0;
      if (v12)
        v8 = off_1E9271D70;
    }
  }
  v9 = (void *)objc_msgSend(objc_alloc(*v8), "initWithAsset:prepareOperationResult:", v5, v6);

  return v9;
}

- (id)_newProcessAssetOperationForasset:(id)a3 assetsOperationResult:(id)a4
{
  id v5;
  id v6;
  void *v7;
  __objc2_class **v8;
  void *v9;
  void *v11;
  int v12;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "assetType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "isEqualToString:", CFSTR("Podcast")) & 1) != 0
    || (objc_msgSend(v7, "isEqualToString:", CFSTR("VideoPodcast")) & 1) != 0)
  {
    v8 = &off_1E9271DD0;
  }
  else
  {
    objc_msgSend(v5, "dataclass");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v11, "isEqualToString:", CFSTR("Book")) & 1) != 0)
    {

      v8 = off_1E9271D80;
    }
    else
    {
      v12 = objc_msgSend(v7, "isEqualToString:", CFSTR("Audiobook"));

      v8 = off_1E9271DB0;
      if (v12)
        v8 = off_1E9271D80;
    }
  }
  v9 = (void *)objc_msgSend(objc_alloc(*v8), "initWithAsset:assetsOperationResult:", v5, v6);

  return v9;
}

- (void)_updateStateForAsset:(id)a3 oldState:(int64_t)a4 newState:(int64_t)a5
{
  id v8;
  ICUnfairLock *lock;
  id v10;
  _QWORD v11[5];
  id v12;
  int64_t v13;
  int64_t v14;

  v8 = a3;
  lock = self->_lock;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __65__ATStoreDownloadService__updateStateForAsset_oldState_newState___block_invoke;
  v11[3] = &unk_1E927CAC8;
  v11[4] = self;
  v12 = v8;
  v13 = a4;
  v14 = a5;
  v10 = v8;
  -[ICUnfairLock lockWithBlock:](lock, "lockWithBlock:", v11);

}

- (void)_updateProgressForAsset:(id)a3 progress:(float)a4
{
  id v6;
  ICUnfairLock *lock;
  id v8;
  _QWORD v9[5];
  id v10;
  float v11;

  v6 = a3;
  lock = self->_lock;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __59__ATStoreDownloadService__updateProgressForAsset_progress___block_invoke;
  v9[3] = &unk_1E927E030;
  v9[4] = self;
  v10 = v6;
  v11 = a4;
  v8 = v6;
  -[ICUnfairLock lockWithBlock:](lock, "lockWithBlock:", v9);

}

- (void)_finishAsset:(id)a3 withError:(id)a4 cancelPendingDownloads:(BOOL)a5
{
  id v8;
  id v9;
  NSObject *v10;
  ICUnfairLock *lock;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  BOOL v17;
  uint8_t buf[4];
  ATStoreDownloadService *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  _ATLogCategoryStoreDownloads();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v19 = self;
    v20 = 2114;
    v21 = v8;
    _os_log_impl(&dword_1D1868000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ Finished asset %{public}@", buf, 0x16u);
  }

  lock = self->_lock;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __72__ATStoreDownloadService__finishAsset_withError_cancelPendingDownloads___block_invoke;
  v14[3] = &unk_1E927CDE8;
  v14[4] = self;
  v15 = v8;
  v17 = a5;
  v16 = v9;
  v12 = v9;
  v13 = v8;
  -[ICUnfairLock lockWithBlock:](lock, "lockWithBlock:", v14);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_progressForAsset, 0);
  objc_storeStrong((id *)&self->_downloadOperations, 0);
  objc_storeStrong((id *)&self->_processAssetsOperationQueue, 0);
  objc_storeStrong((id *)&self->_downloadOperationQueue, 0);
  objc_storeStrong((id *)&self->_prepareOperationQueue, 0);
}

void __72__ATStoreDownloadService__finishAsset_withError_cancelPendingDownloads___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  _QWORD block[6];
  id v20;
  id v21;
  char v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t v27[128];
  uint8_t buf[4];
  uint64_t v29;
  __int16 v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObjectForKey:", v3);

  if (*(_BYTE *)(a1 + 56))
  {
    _ATLogCategoryStoreDownloads();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v29 = v5;
      v30 = 2114;
      v31 = v6;
      _os_log_impl(&dword_1D1868000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Cancelling remaining like assets for failed asset %{public}@", buf, 0x16u);
    }

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "cancelAllOperations");
  }
  v7 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObjectForKey:", v8);

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v9 = *(id *)(*(_QWORD *)(a1 + 32) + 48);
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v24;
    v13 = MEMORY[0x1E0C809B0];
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v24 != v12)
          objc_enumerationMutation(v9);
        v15 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v14);
        v16 = *(_QWORD *)(a1 + 32);
        v17 = *(void **)(a1 + 40);
        v18 = *(NSObject **)(v16 + 64);
        block[0] = v13;
        block[1] = 3221225472;
        block[2] = __72__ATStoreDownloadService__finishAsset_withError_cancelPendingDownloads___block_invoke_56;
        block[3] = &unk_1E927CAF0;
        block[4] = v15;
        block[5] = v16;
        v20 = v17;
        v21 = *(id *)(a1 + 48);
        v22 = *(_BYTE *)(a1 + 56);
        dispatch_async(v18, block);

        ++v14;
      }
      while (v11 != v14);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v11);
  }

}

uint64_t __72__ATStoreDownloadService__finishAsset_withError_cancelPendingDownloads___block_invoke_56(uint64_t a1)
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(*(id *)(a1 + 32), "ATStoreDownloadService:didFinishAsset:withError:cancelPendingAssetsInBatch:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(unsigned __int8 *)(a1 + 64));
  return result;
}

void __59__ATStoreDownloadService__updateProgressForAsset_progress___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  double v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  _QWORD v21[6];
  id v22;
  int v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t v28[128];
  uint8_t buf[4];
  uint64_t v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  double v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 && (objc_msgSend(v4, "isCancelled") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "setBytesRemaining:", objc_msgSend(*(id *)(a1 + 40), "totalBytes")- (unint64_t)(*(float *)(a1 + 48) * (double)(unint64_t)objc_msgSend(*(id *)(a1 + 40), "totalBytes")));
    _ATLogCategoryStoreDownloads();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "shortDescription");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)objc_opt_class();
      v9 = *(float *)(a1 + 48);
      *(_DWORD *)buf = 138544130;
      v30 = v6;
      v31 = 2114;
      v32 = v7;
      v33 = 2114;
      v34 = v8;
      v35 = 2048;
      v36 = v9;
      v10 = v8;
      _os_log_impl(&dword_1D1868000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}@ %{public}@ progress: %.2f", buf, 0x2Au);

    }
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v11 = *(id *)(*(_QWORD *)(a1 + 32) + 48);
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v25;
      v15 = MEMORY[0x1E0C809B0];
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v25 != v14)
            objc_enumerationMutation(v11);
          v17 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v16);
          v18 = *(_QWORD *)(a1 + 32);
          v19 = *(void **)(a1 + 40);
          v20 = *(NSObject **)(v18 + 64);
          v21[0] = v15;
          v21[1] = 3221225472;
          v21[2] = __59__ATStoreDownloadService__updateProgressForAsset_progress___block_invoke_53;
          v21[3] = &unk_1E927CB60;
          v21[4] = v17;
          v21[5] = v18;
          v22 = v19;
          v23 = *(_DWORD *)(a1 + 48);
          dispatch_async(v20, v21);

          ++v16;
        }
        while (v13 != v16);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v13);
    }

  }
}

uint64_t __59__ATStoreDownloadService__updateProgressForAsset_progress___block_invoke_53(uint64_t a1)
{
  uint64_t result;
  double v3;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
  {
    LODWORD(v3) = *(_DWORD *)(a1 + 56);
    return objc_msgSend(*(id *)(a1 + 32), "ATStoreDownloadService:didUpdateProgressForAsset:progress:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v3);
  }
  return result;
}

void __65__ATStoreDownloadService__updateStateForAsset_oldState_newState___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  _QWORD block[6];
  id v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 48);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v16;
    v6 = MEMORY[0x1E0C809B0];
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v16 != v5)
          objc_enumerationMutation(v2);
        v8 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v7);
        v9 = *(_QWORD *)(a1 + 32);
        v10 = *(void **)(a1 + 40);
        v11 = *(NSObject **)(v9 + 64);
        block[0] = v6;
        block[1] = 3221225472;
        block[2] = __65__ATStoreDownloadService__updateStateForAsset_oldState_newState___block_invoke_2;
        block[3] = &unk_1E927CAA0;
        block[4] = v8;
        block[5] = v9;
        v13 = v10;
        v14 = *(_OWORD *)(a1 + 48);
        dispatch_async(v11, block);

        ++v7;
      }
      while (v4 != v7);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v4);
  }

}

uint64_t __65__ATStoreDownloadService__updateStateForAsset_oldState_newState___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(*(id *)(a1 + 32), "ATStoreDownloadService:didChangeStateForAsset:oldState:newState:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
  return result;
}

uint64_t __49__ATStoreDownloadService_removeDownloadObserver___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "removeObject:", *(_QWORD *)(a1 + 40));
}

uint64_t __46__ATStoreDownloadService_addDownloadObserver___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "addObject:", *(_QWORD *)(a1 + 40));
}

void __42__ATStoreDownloadService_prioritizeAsset___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  id v4;

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", v2);
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v3 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setQueuePriority:", 8);
    v3 = v4;
  }

}

void __38__ATStoreDownloadService_cancelAsset___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  _ATLogCategoryStoreDownloads();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(_QWORD *)(a1 + 40);
    v8 = 138543874;
    v9 = v6;
    v10 = 2114;
    v11 = v7;
    v12 = 2112;
    v13 = v4;
    _os_log_impl(&dword_1D1868000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ canceling download %{public}@, downloadOperation=%@", (uint8_t *)&v8, 0x20u);
  }

  if (v4)
    objc_msgSend(v4, "cancel");

}

void __39__ATStoreDownloadService_enqueueAsset___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  v1 = *(_QWORD *)(a1 + 40);
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  objc_msgSend(*(id *)(a1 + 48), "identifier");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v1, v3);

}

uint64_t __39__ATStoreDownloadService_enqueueAsset___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(*(id *)(a1 + 32), "ATStoreDownloadService:didEnqueueAsset:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  return result;
}

void __39__ATStoreDownloadService_enqueueAsset___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  id v23;
  void *v24;
  __int128 v25;
  _QWORD v26[5];
  id v27;
  __int128 v28;
  _QWORD v29[5];
  id v30;
  id v31;
  uint8_t buf[4];
  uint64_t v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  id v37;
  __int16 v38;
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  _ATLogCategoryStoreDownloads();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138544130;
    v33 = v8;
    v34 = 2114;
    v35 = v9;
    v36 = 2114;
    v37 = v5;
    v38 = 2114;
    v39 = v6;
    _os_log_impl(&dword_1D1868000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ completed prepare operation for %{public}@. err=%{public}@. result=%{public}@", buf, 0x2Au);
  }

  if (v5)
  {
    if (objc_msgSend(v6, "cancelAllRemaining"))
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setMaxConcurrentOperationCount:", 1);
    objc_msgSend(*(id *)(a1 + 32), "_finishAsset:withError:cancelPendingDownloads:", *(_QWORD *)(a1 + 40), v5, objc_msgSend(v6, "cancelAllRemaining"));
  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setMaxConcurrentOperationCount:", 3);
    objc_msgSend(v6, "storeMediaResponseItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "storeInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setStoreMediaResponseItem:", v10);

    v12 = (void *)objc_msgSend(*(id *)(a1 + 32), "_newAssetOperationForAsset:prepareOperationResult:", *(_QWORD *)(a1 + 40), v6);
    if (!v12)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), CFSTR("ATStoreDownloadService.m"), 126, CFSTR("Failed to create asset operation for asset %@"), *(_QWORD *)(a1 + 40));

    }
    v13 = *(_QWORD *)(a1 + 32);
    v14 = *(void **)(a1 + 40);
    v15 = *(void **)(v13 + 72);
    v16 = MEMORY[0x1E0C809B0];
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __39__ATStoreDownloadService_enqueueAsset___block_invoke_23;
    v29[3] = &unk_1E927E198;
    v29[4] = v13;
    v30 = v12;
    v31 = v14;
    v17 = v12;
    objc_msgSend(v15, "lockWithBlock:", v29);
    v18 = *(void **)(a1 + 48);
    objc_msgSend(v17, "progress");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addChild:withPendingUnitCount:", v19, 90);

    objc_msgSend(*(id *)(a1 + 32), "_updateStateForAsset:oldState:newState:", *(_QWORD *)(a1 + 40), 1, 2);
    v20 = *(_QWORD *)(a1 + 32);
    v21 = *(void **)(a1 + 40);
    v22 = *(_QWORD *)(v20 + 16);
    v26[0] = v16;
    v26[1] = 3221225472;
    v26[2] = __39__ATStoreDownloadService_enqueueAsset___block_invoke_2_24;
    v26[3] = &unk_1E927CA78;
    v26[4] = v20;
    v27 = v21;
    v25 = *(_OWORD *)(a1 + 48);
    v23 = (id)v25;
    v28 = v25;
    objc_msgSend(v17, "performOnOperationQueue:completion:", v22, v26);

  }
}

void __39__ATStoreDownloadService_enqueueAsset___block_invoke_23(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  v1 = *(_QWORD *)(a1 + 40);
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  objc_msgSend(*(id *)(a1 + 48), "identifier");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v1, v3);

}

void __39__ATStoreDownloadService_enqueueAsset___block_invoke_2_24(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  _QWORD v22[5];
  id v23;
  id v24;
  id v25;
  _QWORD v26[5];
  id v27;
  id v28;
  uint8_t buf[4];
  uint64_t v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  id v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  _ATLogCategoryStoreDownloads();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138544130;
    v30 = v8;
    v31 = 2114;
    v32 = v9;
    v33 = 2114;
    v34 = v5;
    v35 = 2114;
    v36 = v6;
    _os_log_impl(&dword_1D1868000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ completed assets download operation for %{public}@. err=%{public}@. result=%{public}@", buf, 0x2Au);
  }

  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "_finishAsset:withError:cancelPendingDownloads:", *(_QWORD *)(a1 + 40), v5, objc_msgSend(v6, "cancelAllRemaining"));
  }
  else
  {
    v10 = (void *)objc_msgSend(*(id *)(a1 + 32), "_newProcessAssetOperationForasset:assetsOperationResult:", *(_QWORD *)(a1 + 40), v6);
    if (!v10)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), CFSTR("ATStoreDownloadService.m"), 142, CFSTR("Failed to create process assets operation for asset %@"), *(_QWORD *)(a1 + 40));

    }
    v11 = *(_QWORD *)(a1 + 32);
    v12 = *(void **)(a1 + 40);
    v13 = *(void **)(v11 + 72);
    v14 = MEMORY[0x1E0C809B0];
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __39__ATStoreDownloadService_enqueueAsset___block_invoke_27;
    v26[3] = &unk_1E927E198;
    v26[4] = v11;
    v27 = v10;
    v28 = v12;
    v15 = v10;
    objc_msgSend(v13, "lockWithBlock:", v26);
    v16 = *(void **)(a1 + 48);
    objc_msgSend(v15, "progress");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addChild:withPendingUnitCount:", v17, 5);

    objc_msgSend(*(id *)(a1 + 32), "_updateStateForAsset:oldState:newState:", *(_QWORD *)(a1 + 40), 2, 3);
    v18 = *(_QWORD *)(a1 + 32);
    v19 = *(void **)(a1 + 40);
    v20 = *(_QWORD *)(v18 + 24);
    v22[0] = v14;
    v22[1] = 3221225472;
    v22[2] = __39__ATStoreDownloadService_enqueueAsset___block_invoke_2_28;
    v22[3] = &unk_1E927CA50;
    v22[4] = v18;
    v23 = v19;
    v24 = *(id *)(a1 + 48);
    v25 = v6;
    objc_msgSend(v15, "performOnOperationQueue:completion:", v20, v22);

  }
}

void __39__ATStoreDownloadService_enqueueAsset___block_invoke_27(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  v1 = *(_QWORD *)(a1 + 40);
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  objc_msgSend(*(id *)(a1 + 48), "identifier");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v1, v3);

}

void __39__ATStoreDownloadService_enqueueAsset___block_invoke_2_28(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  void *v17;
  void *v18;
  int v19;
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  id v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  _ATLogCategoryStoreDownloads();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(_QWORD *)(a1 + 40);
    v19 = 138544130;
    v20 = v8;
    v21 = 2114;
    v22 = v9;
    v23 = 2114;
    v24 = v5;
    v25 = 2114;
    v26 = v6;
    _os_log_impl(&dword_1D1868000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ completed process assets operation for %{public}@. err=%{public}@. result=%{public}@", (uint8_t *)&v19, 0x2Au);
  }

  v10 = *(void **)(a1 + 48);
  v11 = *(_QWORD *)(a1 + 32);
  NSStringFromSelector(sel_fractionCompleted);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeObserver:forKeyPath:", v11, v12);

  if (!v5)
  {
    v13 = *(void **)(a1 + 40);
    objc_msgSend(v6, "downloadFilePath");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setPath:", v14);

  }
  objc_msgSend(v6, "assetClientParams");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    v17 = *(void **)(a1 + 40);
    objc_msgSend(v6, "assetClientParams");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setClientParams:", v18);

  }
  LODWORD(v16) = 1.0;
  objc_msgSend(*(id *)(a1 + 32), "_updateProgressForAsset:progress:", *(_QWORD *)(a1 + 40), v16);
  objc_msgSend(*(id *)(a1 + 32), "_finishAsset:withError:cancelPendingDownloads:", *(_QWORD *)(a1 + 40), v5, objc_msgSend(*(id *)(a1 + 56), "cancelAllRemaining"));

}

+ (NSString)downloadDirectoryPath
{
  void *v2;
  void *v3;

  NSTemporaryDirectory();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("AirTraffic"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

+ (id)sharedService
{
  if (sharedService_onceToken != -1)
    dispatch_once(&sharedService_onceToken, &__block_literal_global_809);
  return (id)sharedService___sharedInstance;
}

void __39__ATStoreDownloadService_sharedService__block_invoke()
{
  ATStoreDownloadService *v0;
  void *v1;

  v0 = objc_alloc_init(ATStoreDownloadService);
  v1 = (void *)sharedService___sharedInstance;
  sharedService___sharedInstance = (uint64_t)v0;

}

@end
