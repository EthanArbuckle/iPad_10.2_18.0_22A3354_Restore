@implementation ATRestoreAssetLink

- (ATRestoreAssetLink)init
{
  ATRestoreAssetLink *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *queue;
  dispatch_queue_t v5;
  OS_dispatch_queue *callbackQueue;
  uint64_t v7;
  NSArray *allowedDataClasses;
  uint64_t v9;
  MBManager *mbManager;
  uint64_t v11;
  NSMutableArray *queuedAssets;
  uint64_t v13;
  NSMutableArray *activeAssets;
  void *v15;
  void *v16;
  const char *v17;
  NSObject *v18;
  _QWORD handler[4];
  id v21;
  id location;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)ATRestoreAssetLink;
  v2 = -[ATRestoreAssetLink init](&v23, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.atc.restorelink.queue", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    v5 = dispatch_queue_create("com.apple.atc.restorelink.callback", 0);
    callbackQueue = v2->_callbackQueue;
    v2->_callbackQueue = (OS_dispatch_queue *)v5;

    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("Photo"), CFSTR("MessagePart"), CFSTR("Book"), CFSTR("VoiceMemo"), CFSTR("File"), 0);
    v7 = objc_claimAutoreleasedReturnValue();
    allowedDataClasses = v2->_allowedDataClasses;
    v2->_allowedDataClasses = (NSArray *)v7;

    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0D4E0A8]), "initWithDelegate:eventQueue:", v2, v2->_queue);
    mbManager = v2->_mbManager;
    v2->_mbManager = (MBManager *)v9;

    v2->_restoreState = 2;
    v2->_isRestoring = 1;
    v11 = objc_opt_new();
    queuedAssets = v2->_queuedAssets;
    v2->_queuedAssets = (NSMutableArray *)v11;

    v13 = objc_opt_new();
    activeAssets = v2->_activeAssets;
    v2->_activeAssets = (NSMutableArray *)v13;

    +[ATDeviceSettings sharedInstance](ATDeviceSettings, "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v2->_batchingIsSupported = objc_msgSend(v15, "restoreBatchingEnabled");

    +[ATDeviceSettings sharedInstance](ATDeviceSettings, "sharedInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v2->_batchSize = objc_msgSend(v16, "restoreBatchSize");

    v2->_singleAssetMode = 0;
    objc_initWeak(&location, v2);
    v17 = (const char *)objc_msgSend(CFSTR("com.apple.MobileBackup.backgroundCellularAccessChanged"), "UTF8String");
    v18 = v2->_queue;
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __26__ATRestoreAssetLink_init__block_invoke;
    handler[3] = &unk_1E927C8C0;
    objc_copyWeak(&v21, &location);
    notify_register_dispatch(v17, &v2->_mbCellularAccessChangedNotificationToken, v18, handler);
    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (void)restoreSessionActiveWithCompletion:(id)a3
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
  v7[2] = __57__ATRestoreAssetLink_restoreSessionActiveWithCompletion___block_invoke;
  v7[3] = &unk_1E927D348;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)finishRestore
{
  -[MBManager finishRestore](self->_mbManager, "finishRestore");
}

- (void)processRestoreFailureForAsset:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  if ((objc_msgSend(v13, "isRestore") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ATRestoreAssetLink.m"), 129, CFSTR("processRestoreFailureForAsset called with asset that is not a restore: %@"), v13);

  }
  v5 = objc_alloc(MEMORY[0x1E0D4E0B8]);
  objc_msgSend(v13, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "dataclass");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "assetType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "prettyName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "error");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v5, "initWithIdentifier:dataclass:assetType:displayName:error:", v6, v7, v8, v9, v10);

  -[MBManager recordRestoreFailure:error:](self->_mbManager, "recordRestoreFailure:error:", v11, 0);
}

- (BOOL)hasProperNetworkConditions
{
  void *v3;
  void *v4;
  int IsCellular;
  char v6;

  objc_msgSend(MEMORY[0x1E0DDBF60], "sharedMonitor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isRemoteServerLikelyReachable"))
  {
    -[ATRestoreAssetLink _currentCellularPolicy](self, "_currentCellularPolicy");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "networkType");
    IsCellular = ICEnvironmentNetworkTypeIsCellular();
    if (v4)
      v6 = !IsCellular
        || (!objc_msgSend(v3, "isCurrentNetworkLinkExpensive")
         || objc_msgSend(v4, "allowsExpensiveNetworkAccess"))
        && (!objc_msgSend(v3, "isNetworkConstrained")
         || objc_msgSend(v4, "allowsConstrainedNetworkAccess"));
    else
      v6 = IsCellular ^ 1;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)open
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __26__ATRestoreAssetLink_open__block_invoke;
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
  block[2] = __27__ATRestoreAssetLink_close__block_invoke;
  block[3] = &unk_1E927E120;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (id)enqueueAssets:(id)a3 force:(BOOL)a4
{
  id v5;
  void *v6;
  NSObject *queue;
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD block[5];
  id v14;
  id v15;

  v5 = a3;
  v6 = (void *)objc_opt_new();
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__ATRestoreAssetLink_enqueueAssets_force___block_invoke;
  block[3] = &unk_1E927E198;
  block[4] = self;
  v14 = v5;
  v8 = v6;
  v15 = v8;
  v9 = v5;
  dispatch_sync(queue, block);
  v10 = v15;
  v11 = v8;

  return v11;
}

- (BOOL)canEnqueueAsset:(id)a3
{
  void *v3;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  BOOL v12;
  void *v14;
  void *v15;

  v5 = a3;
  -[ATRestoreAssetLink allowedDataClasses](self, "allowedDataClasses");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dataclass");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "containsObject:", v7)
    && objc_msgSend(v5, "isDownload")
    && objc_msgSend(v5, "isRestore"))
  {
    objc_msgSend(v5, "dataclass");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("Application"));
    if ((v9 & 1) != 0 || (objc_msgSend(v5, "path"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      objc_msgSend(v5, "dataclass");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v10, "isEqualToString:", CFSTR("Application"))
        && objc_msgSend(v5, "assetParts") != 2)
      {
LABEL_15:

        v12 = 0;
        if ((v9 & 1) != 0)
          goto LABEL_20;
        goto LABEL_19;
      }
      objc_msgSend(v5, "dataclass");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v11, "isEqualToString:", CFSTR("Application")) & 1) != 0)
      {

        v12 = 1;
        if ((v9 & 1) != 0)
          goto LABEL_20;
        goto LABEL_19;
      }
      objc_msgSend(v5, "storeInfo");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
      {

        goto LABEL_15;
      }
      objc_msgSend(v5, "storePlist");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v15 == 0;

      if ((v9 & 1) != 0)
      {
LABEL_20:

        goto LABEL_12;
      }
    }
    else
    {
      v12 = 0;
    }
LABEL_19:

    goto LABEL_20;
  }
  v12 = 0;
LABEL_12:

  return v12;
}

- (void)cancelAssets:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[4];
  id v8;
  ATRestoreAssetLink *v9;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __35__ATRestoreAssetLink_cancelAssets___block_invoke;
  v7[3] = &unk_1E927E148;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (unint64_t)maximumBatchSize
{
  if (self->_batchingIsSupported)
    return self->_batchSize;
  else
    return 1;
}

- (BOOL)linkIsReady
{
  return 1;
}

- (unint64_t)priority
{
  return 50;
}

- (void)environmentMonitorDidChangeNetworkReachability:(id)a3
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__ATRestoreAssetLink_environmentMonitorDidChangeNetworkReachability___block_invoke;
  block[3] = &unk_1E927E120;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)managerDidFinishRestore:(id)a3
{
  NSObject *v4;
  uint64_t v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  void *v19;
  int v20;
  NSObject *callbackQueue;
  NSMutableArray *obj;
  _QWORD block[6];
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint8_t v33[128];
  uint8_t buf[4];
  uint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  _ATLogCategoryRestore();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = -[NSMutableArray count](self->_activeAssets, "count");
    *(_DWORD *)buf = 134217984;
    v35 = v5;
    _os_log_impl(&dword_1D1868000, v4, OS_LOG_TYPE_DEFAULT, "successfully restored %lu assets:", buf, 0xCu);
  }

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v6 = self->_activeAssets;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v29 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i);
        _ATLogCategoryRestore();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v35 = v11;
          _os_log_impl(&dword_1D1868000, v12, OS_LOG_TYPE_DEFAULT, "    %{public}@", buf, 0xCu);
        }

      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v8);
  }

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = self->_activeAssets;
  v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v25;
    v16 = MEMORY[0x1E0C809B0];
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v25 != v15)
          objc_enumerationMutation(obj);
        v18 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * j);
        objc_msgSend(v18, "dataclass");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "isEqualToString:", CFSTR("Application"));

        if (v20)
          objc_msgSend(v18, "setCompletedAssetParts:", 2);
        callbackQueue = self->_callbackQueue;
        block[0] = v16;
        block[1] = 3221225472;
        block[2] = __46__ATRestoreAssetLink_managerDidFinishRestore___block_invoke;
        block[3] = &unk_1E927E148;
        block[4] = self;
        block[5] = v18;
        dispatch_async(callbackQueue, block);
      }
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    }
    while (v14);
  }

  -[NSMutableArray removeObjectsInArray:](self->_queuedAssets, "removeObjectsInArray:", self->_activeAssets);
  -[NSMutableArray removeAllObjects](self->_activeAssets, "removeAllObjects");
  -[ATRestoreAssetLink _processQueuedAssets](self, "_processQueuedAssets");
}

- (void)manager:(id)a3 didUpdateProgress:(float)a4 estimatedTimeRemaining:(unint64_t)a5
{
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *callbackQueue;
  _QWORD block[6];
  float v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v7 = self->_activeAssets;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
    v11 = MEMORY[0x1E0C809B0];
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v7);
        v13 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v12);
        callbackQueue = self->_callbackQueue;
        block[0] = v11;
        block[1] = 3221225472;
        block[2] = __71__ATRestoreAssetLink_manager_didUpdateProgress_estimatedTimeRemaining___block_invoke;
        block[3] = &unk_1E927E030;
        block[4] = v13;
        block[5] = self;
        v16 = a4;
        dispatch_async(callbackQueue, block);
        ++v12;
      }
      while (v9 != v12);
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v9);
  }

}

- (void)manager:(id)a3 didFailRestoreWithError:(id)a4
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  void *v16;
  NSObject *callbackQueue;
  NSObject *v18;
  void *v19;
  _QWORD block[5];
  id v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t v27[128];
  uint8_t buf[4];
  uint64_t v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  _ATLogCategoryRestore();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = -[NSMutableArray count](self->_activeAssets, "count");
    *(_DWORD *)buf = 134218242;
    v29 = v7;
    v30 = 2114;
    v31 = v5;
    _os_log_impl(&dword_1D1868000, v6, OS_LOG_TYPE_DEFAULT, "failed to restore %lu assets. err=%{public}@:", buf, 0x16u);
  }
  v19 = v5;

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v8 = self->_activeAssets;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v24 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
        _ATLogCategoryRestore();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v29 = v13;
          _os_log_impl(&dword_1D1868000, v14, OS_LOG_TYPE_DEFAULT, "    %{public}@", buf, 0xCu);
        }

      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v10);
  }

  if (-[ATRestoreAssetLink hasProperNetworkConditions](self, "hasProperNetworkConditions"))
  {
    v15 = v19;
    if (-[NSMutableArray count](self->_activeAssets, "count") != 1)
    {
      self->_singleAssetMode = 1;
      goto LABEL_19;
    }
    -[NSMutableArray firstObject](self->_activeAssets, "firstObject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray removeObject:](self->_queuedAssets, "removeObject:", v16);
    callbackQueue = self->_callbackQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __54__ATRestoreAssetLink_manager_didFailRestoreWithError___block_invoke;
    block[3] = &unk_1E927E198;
    block[4] = self;
    v21 = v16;
    v22 = v19;
    v18 = v16;
    dispatch_async(callbackQueue, block);

  }
  else
  {
    _ATLogCategoryRestore();
    v18 = objc_claimAutoreleasedReturnValue();
    v15 = v19;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1868000, v18, OS_LOG_TYPE_DEFAULT, "no connectivity - waiting for wifi to retry", buf, 2u);
    }
  }

LABEL_19:
  -[NSMutableArray removeAllObjects](self->_activeAssets, "removeAllObjects");
  -[ATRestoreAssetLink _processQueuedAssets](self, "_processQueuedAssets");

}

- (void)managerDidCancelRestore:(id)a3
{
  NSObject *callbackQueue;
  _QWORD block[5];

  callbackQueue = self->_callbackQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__ATRestoreAssetLink_managerDidCancelRestore___block_invoke;
  block[3] = &unk_1E927E120;
  block[4] = self;
  dispatch_async(callbackQueue, block);
}

- (void)managerDidLoseConnectionToService:(id)a3
{
  NSObject *v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  NSObject *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t buf[4];
  uint64_t v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (-[NSMutableArray count](self->_activeAssets, "count", a3))
  {
    _ATLogCategoryRestore();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1868000, v4, OS_LOG_TYPE_DEFAULT, "Lost connection to backupd while restoring assets:", buf, 2u);
    }

    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v5 = self->_activeAssets;
    v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v18, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v5);
          v10 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
          _ATLogCategoryRestore();
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v17 = v10;
            _os_log_impl(&dword_1D1868000, v11, OS_LOG_TYPE_DEFAULT, "    %{public}@", buf, 0xCu);
          }

        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v18, 16);
      }
      while (v7);
    }

    -[NSMutableArray removeAllObjects](self->_activeAssets, "removeAllObjects");
    -[ATRestoreAssetLink _processQueuedAssets](self, "_processQueuedAssets");
  }
}

- (void)_processQueuedAssets
{
  BOOL v4;
  NSObject *v5;
  _BOOL4 v6;
  _BOOL4 batchingIsSupported;
  _BOOL4 singleAssetMode;
  unint64_t batchSize;
  int v10;
  int v11;
  unint64_t v12;
  NSMutableArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  NSObject *v26;
  uint64_t v27;
  NSMutableArray *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  uint64_t v33;
  NSObject *v34;
  void *v35;
  void *v36;
  int v37;
  MBManager *mbManager;
  void *v39;
  char v40;
  void *v41;
  void *v42;
  void *v43;
  int v44;
  MBManager *v45;
  void *v46;
  char v47;
  id v48;
  NSObject *v49;
  void *v50;
  MBManager *v51;
  char v52;
  id v53;
  void *v54;
  uint64_t v55;
  NSObject *v56;
  void *v57;
  MBManager *v58;
  void *v59;
  id v60;
  MBManager *v61;
  NSObject *v62;
  NSMutableArray *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t k;
  uint64_t v69;
  NSObject *callbackQueue;
  void *v71;
  void *v72;
  _QWORD block[6];
  id v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  void *v79;
  id v80;
  id v81;
  id v82;
  void *v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  _BYTE v92[128];
  _BYTE v93[128];
  uint8_t v94[128];
  uint8_t buf[4];
  _BYTE v96[10];
  id v97;
  int v98;
  __int16 v99;
  int v100;
  uint64_t v101;

  v101 = *MEMORY[0x1E0C80C00];
  v4 = -[ATRestoreAssetLink hasProperNetworkConditions](self, "hasProperNetworkConditions");
  _ATLogCategoryRestore();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      batchingIsSupported = self->_batchingIsSupported;
      singleAssetMode = self->_singleAssetMode;
      batchSize = self->_batchSize;
      v10 = -[NSMutableArray count](self->_queuedAssets, "count");
      v11 = -[NSMutableArray count](self->_activeAssets, "count");
      *(_DWORD *)buf = 67110144;
      *(_DWORD *)v96 = batchingIsSupported;
      *(_WORD *)&v96[4] = 1024;
      *(_DWORD *)&v96[6] = singleAssetMode;
      LOWORD(v97) = 1024;
      *(_DWORD *)((char *)&v97 + 2) = batchSize;
      HIWORD(v97) = 1024;
      v98 = v10;
      v99 = 1024;
      v100 = v11;
      _os_log_impl(&dword_1D1868000, v5, OS_LOG_TYPE_DEFAULT, "processing pending assets. _batchingIsSupported=%{BOOL}u, _singleAssetMode=%{BOOL}u, batch size=%d, _queuedAssets.count=%d, _activeAssets.count=%d", buf, 0x20u);
    }

    v12 = -[NSMutableArray count](self->_activeAssets, "count");
    if (v12 > -[NSMutableArray count](self->_queuedAssets, "count"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v71, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ATRestoreAssetLink.m"), 385, CFSTR("too many active assets. _activeAssets=%@"), self->_activeAssets);

    }
    if (!-[NSMutableArray count](self->_queuedAssets, "count"))
    {
      self->_singleAssetMode = 0;
      return;
    }
    if (!-[NSMutableArray count](self->_activeAssets, "count"))
    {
      v72 = (void *)objc_opt_new();
      v88 = 0u;
      v89 = 0u;
      v90 = 0u;
      v91 = 0u;
      v13 = self->_queuedAssets;
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v88, v94, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v89;
        while (2)
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v89 != v16)
              objc_enumerationMutation(v13);
            v18 = *(void **)(*((_QWORD *)&v88 + 1) + 8 * i);
            objc_msgSend(v18, "dataclass");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v19, "isEqualToString:", CFSTR("Application")))
            {

LABEL_25:
              if (!-[NSMutableArray count](self->_activeAssets, "count"))
              {
                -[NSMutableArray addObject:](self->_activeAssets, "addObject:", v18);
                objc_msgSend(v18, "dataclass");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                v24 = objc_msgSend(v23, "isEqualToString:", CFSTR("Application"));

                if (v24)
                  objc_msgSend(v18, "identifier");
                else
                  objc_msgSend(v18, "path");
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v72, "addObject:", v25);

              }
              goto LABEL_30;
            }
            objc_msgSend(v18, "dataclass");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = objc_msgSend(v20, "isEqualToString:", CFSTR("Book"));

            if (v21)
              goto LABEL_25;
            -[NSMutableArray addObject:](self->_activeAssets, "addObject:", v18);
            objc_msgSend(v18, "path");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v72, "addObject:", v22);

            if (!self->_batchingIsSupported || self->_singleAssetMode)
              goto LABEL_30;
          }
          v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v88, v94, 16);
          if (v15)
            continue;
          break;
        }
      }
LABEL_30:

      _ATLogCategoryRestore();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        v27 = -[NSMutableArray count](self->_activeAssets, "count");
        *(_DWORD *)buf = 134217984;
        *(_QWORD *)v96 = v27;
        _os_log_impl(&dword_1D1868000, v26, OS_LOG_TYPE_DEFAULT, "starting restore of %lu assets:", buf, 0xCu);
      }

      v86 = 0u;
      v87 = 0u;
      v84 = 0u;
      v85 = 0u;
      v28 = self->_activeAssets;
      v29 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v84, v93, 16);
      if (v29)
      {
        v30 = v29;
        v31 = *(_QWORD *)v85;
        do
        {
          for (j = 0; j != v30; ++j)
          {
            if (*(_QWORD *)v85 != v31)
              objc_enumerationMutation(v28);
            v33 = *(_QWORD *)(*((_QWORD *)&v84 + 1) + 8 * j);
            _ATLogCategoryRestore();
            v34 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              *(_QWORD *)v96 = v33;
              _os_log_impl(&dword_1D1868000, v34, OS_LOG_TYPE_DEFAULT, "    %{public}@", buf, 0xCu);
            }

          }
          v30 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v84, v93, 16);
        }
        while (v30);
      }

      -[NSMutableArray firstObject](self->_activeAssets, "firstObject");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "dataclass");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend(v36, "isEqualToString:", CFSTR("Application"));

      if (v37)
      {
        mbManager = self->_mbManager;
        objc_msgSend(v72, "firstObject");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v83 = 0;
        v40 = -[MBManager restoreApplicationWithBundleID:failed:context:error:](mbManager, "restoreApplicationWithBundleID:failed:context:error:", v39, 0, 0, &v83);
        v41 = v83;
      }
      else
      {
        if (self->_batchingIsSupported)
        {
          -[NSMutableArray firstObject](self->_activeAssets, "firstObject");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "dataclass");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v44 = objc_msgSend(v43, "isEqualToString:", CFSTR("Book"));

          if (v44)
          {
            v45 = self->_mbManager;
            objc_msgSend(v72, "firstObject");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            v82 = 0;
            v47 = -[MBManager restoreBookWithPath:error:](v45, "restoreBookWithPath:error:", v46, &v82);
            v48 = v82;

            _ATLogCategoryRestore();
            v49 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v72, "firstObject");
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              *(_QWORD *)v96 = v50;
              *(_WORD *)&v96[8] = 2114;
              v97 = v48;
              _os_log_impl(&dword_1D1868000, v49, OS_LOG_TYPE_DEFAULT, "restoreBookWithPath. path='%@' err=%{public}@", buf, 0x16u);

            }
            if ((v47 & 1) != 0)
              goto LABEL_69;
            goto LABEL_59;
          }
          if (self->_batchingIsSupported)
          {
            v51 = self->_mbManager;
            v81 = 0;
            v52 = -[MBManager restoreFilesWithPaths:error:](v51, "restoreFilesWithPaths:error:", v72, &v81);
            v53 = v81;
            v48 = v53;
            if ((v52 & 1) == 0)
            {
              objc_msgSend(v53, "domain");
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v54, "isEqualToString:", CFSTR("MBErrorDomain")))
              {
                v55 = objc_msgSend(v48, "code");

                if (v55 == 216)
                {
                  _ATLogCategoryRestore();
                  v56 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138543362;
                    *(_QWORD *)v96 = v48;
                    _os_log_impl(&dword_1D1868000, v56, OS_LOG_TYPE_DEFAULT, "restoreFilesWithPaths not supported - disabling batching. err=%{public}@", buf, 0xCu);
                  }

                  self->_batchingIsSupported = 0;
                  -[NSMutableArray firstObject](self->_activeAssets, "firstObject");
                  v57 = (void *)objc_claimAutoreleasedReturnValue();
                  -[NSMutableArray removeAllObjects](self->_activeAssets, "removeAllObjects");
                  -[NSMutableArray addObject:](self->_activeAssets, "addObject:", v57);
                  v58 = self->_mbManager;
                  objc_msgSend(v57, "path");
                  v59 = (void *)objc_claimAutoreleasedReturnValue();
                  v80 = v48;
                  LOBYTE(v58) = -[MBManager restoreFileWithPath:error:](v58, "restoreFileWithPath:error:", v59, &v80);
                  v60 = v80;

                  v48 = v60;
                  if ((v58 & 1) != 0)
                    goto LABEL_69;
                }
              }
              else
              {

              }
              goto LABEL_59;
            }
LABEL_69:

            return;
          }
        }
        v61 = self->_mbManager;
        objc_msgSend(v72, "firstObject");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v79 = 0;
        v40 = -[MBManager restoreFileWithPath:error:](v61, "restoreFileWithPath:error:", v39, &v79);
        v41 = v79;
      }
      v48 = v41;

      if ((v40 & 1) == 0)
      {
LABEL_59:
        _ATLogCategoryRestore();
        v62 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          *(_QWORD *)v96 = v48;
          _os_log_impl(&dword_1D1868000, v62, OS_LOG_TYPE_ERROR, "Failed to dispatch restore request. err=%{public}@", buf, 0xCu);
        }

        v77 = 0u;
        v78 = 0u;
        v75 = 0u;
        v76 = 0u;
        v63 = self->_queuedAssets;
        v64 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v63, "countByEnumeratingWithState:objects:count:", &v75, v92, 16);
        if (v64)
        {
          v65 = v64;
          v66 = *(_QWORD *)v76;
          v67 = MEMORY[0x1E0C809B0];
          do
          {
            for (k = 0; k != v65; ++k)
            {
              if (*(_QWORD *)v76 != v66)
                objc_enumerationMutation(v63);
              v69 = *(_QWORD *)(*((_QWORD *)&v75 + 1) + 8 * k);
              callbackQueue = self->_callbackQueue;
              block[0] = v67;
              block[1] = 3221225472;
              block[2] = __42__ATRestoreAssetLink__processQueuedAssets__block_invoke;
              block[3] = &unk_1E927E198;
              block[4] = self;
              block[5] = v69;
              v74 = v48;
              dispatch_async(callbackQueue, block);

            }
            v65 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v63, "countByEnumeratingWithState:objects:count:", &v75, v92, 16);
          }
          while (v65);
        }

        -[NSMutableArray removeAllObjects](self->_activeAssets, "removeAllObjects");
        -[NSMutableArray removeAllObjects](self->_queuedAssets, "removeAllObjects");
        goto LABEL_69;
      }
      goto LABEL_69;
    }
  }
  else
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1868000, v5, OS_LOG_TYPE_DEFAULT, "not processing queued assets because restores are not allowed with current network conditions", buf, 2u);
    }

  }
}

- (id)_currentCellularPolicy
{
  MBCellularAccess *restoreCellularPolicy;
  MBManager *mbManager;
  void *v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  MBCellularAccess *v9;
  id v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  restoreCellularPolicy = self->_restoreCellularPolicy;
  if (!restoreCellularPolicy)
  {
    mbManager = self->_mbManager;
    v11 = 0;
    -[MBManager backgroundRestoreCellularAccessWithError:](mbManager, "backgroundRestoreCellularAccessWithError:", &v11);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v11;
    _ATLogCategoryRestore();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v6)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v13 = v6;
        _os_log_impl(&dword_1D1868000, v8, OS_LOG_TYPE_ERROR, "Failed to fetch restore cellular policy. err=%{public}@", buf, 0xCu);
      }
    }
    else
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v13 = v5;
        _os_log_impl(&dword_1D1868000, v8, OS_LOG_TYPE_DEFAULT, "Loaded mobile device cellular policy %{public}@", buf, 0xCu);
      }

      v9 = v5;
      v8 = self->_restoreCellularPolicy;
      self->_restoreCellularPolicy = v9;
    }

    restoreCellularPolicy = self->_restoreCellularPolicy;
  }
  return restoreCellularPolicy;
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

- (NSArray)allowedDataClasses
{
  return self->_allowedDataClasses;
}

- (void)setAllowedDataClasses:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (ATRestoreAssetLinkDelegate)restoreDelegate
{
  return (ATRestoreAssetLinkDelegate *)objc_loadWeakRetained((id *)&self->_restoreDelegate);
}

- (void)setRestoreDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_restoreDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_restoreDelegate);
  objc_storeStrong((id *)&self->_allowedDataClasses, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_activeAssets, 0);
  objc_storeStrong((id *)&self->_queuedAssets, 0);
  objc_storeStrong((id *)&self->_restoreCellularPolicy, 0);
  objc_storeStrong((id *)&self->_mbManager, 0);
}

void __42__ATRestoreAssetLink__processQueuedAssets__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0CB35C8], "at_ATErrorFromError:", *(_QWORD *)(a1 + 48));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "assetLink:didFinishAsset:error:retryable:", v2, v3, v4, 1);

}

void __46__ATRestoreAssetLink_managerDidCancelRestore___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "restoreDelegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "restoreAssetLinkDidCancelRestore:", *(_QWORD *)(a1 + 32));

}

void __54__ATRestoreAssetLink_manager_didFailRestoreWithError___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0CB35C8], "at_ATErrorFromError:", *(_QWORD *)(a1 + 48));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "assetLink:didFinishAsset:error:retryable:", v2, v3, v4, 1);

}

void __71__ATRestoreAssetLink_manager_didUpdateProgress_estimatedTimeRemaining___block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "assetState") != 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "setAssetState:", 1);
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 96));
    v3 = *(_QWORD *)(a1 + 40);
    v6[0] = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "assetLink:didTransitionAssetStates:", v3, v4);

  }
  objc_msgSend(*(id *)(a1 + 40), "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "assetLink:didUpdateAsset:progress:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), *(float *)(a1 + 48));

}

void __46__ATRestoreAssetLink_managerDidFinishRestore___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "assetLink:didFinishAsset:error:retryable:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), 0, 1);

}

uint64_t __69__ATRestoreAssetLink_environmentMonitorDidChangeNetworkReachability___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "count");
  if (result)
    return objc_msgSend(*(id *)(a1 + 32), "_processQueuedAssets");
  return result;
}

uint64_t __35__ATRestoreAssetLink_cancelAssets___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t);
  void *v8;
  uint64_t i;
  void *v10;
  id v11;
  void *v12;
  void (*v13)(uint64_t);
  void *v14;
  int v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v22;
  _QWORD block[6];
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v25;
    v6 = MEMORY[0x1E0C809B0];
    v7 = __35__ATRestoreAssetLink_cancelAssets___block_invoke_2;
    v8 = &unk_1E927E148;
    v22 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v25 != v5)
          objc_enumerationMutation(v2);
        v10 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "containsObject:", v10))
        {
          if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 40), "containsObject:", v10))
          {
            v11 = v2;
            v12 = v8;
            v13 = v7;
            objc_msgSend(v10, "dataclass");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("Application"));

            v16 = *(_QWORD *)(a1 + 40);
            v17 = *(void **)(v16 + 8);
            if (v15)
            {
              objc_msgSend(v10, "identifier");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "cancelApplicationRestoreWithBundleID:error:", v18, 0);

            }
            else
            {
              objc_msgSend(*(id *)(v16 + 8), "cancel");
            }
            objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 40), "removeObject:", v10);
            objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "removeObject:", v10);
            v7 = v13;
            v8 = v12;
            v2 = v11;
            v5 = v22;
          }
          v19 = *(_QWORD *)(a1 + 40);
          v20 = *(NSObject **)(v19 + 72);
          block[0] = v6;
          block[1] = 3221225472;
          block[2] = v7;
          block[3] = v8;
          block[4] = v19;
          block[5] = v10;
          dispatch_async(v20, block);
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v4);
  }

  return objc_msgSend(*(id *)(a1 + 40), "_processQueuedAssets");
}

void __35__ATRestoreAssetLink_cancelAssets___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ATError"), 2, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "assetLink:didFinishAsset:error:retryable:", v3, v2, v4, 1);

}

uint64_t __42__ATRestoreAssetLink_enqueueAssets_force___block_invoke(id *a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(*((id *)a1[4] + 4), "count"))
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v2 = a1[5];
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v11;
LABEL_4:
      v6 = 0;
      while (1)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v6);
        objc_msgSend(*((id *)a1[4] + 4), "addObject:", v7, (_QWORD)v10);
        objc_msgSend(a1[6], "addObject:", v7);
        v8 = objc_msgSend(*((id *)a1[4] + 4), "count");
        if (v8 >= objc_msgSend(a1[4], "maximumBatchSize"))
          break;
        if (v4 == ++v6)
        {
          v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
          if (v4)
            goto LABEL_4;
          break;
        }
      }
    }

  }
  return objc_msgSend(a1[4], "_processQueuedAssets", (_QWORD)v10);
}

void __27__ATRestoreAssetLink_close__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  _QWORD block[5];

  v1 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v1 + 88))
  {
    *(_BYTE *)(v1 + 88) = 0;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setDelegate:", 0);
    objc_msgSend(MEMORY[0x1E0DDBF60], "sharedMonitor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "unregisterObserver:", *(_QWORD *)(a1 + 32));

    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(NSObject **)(v4 + 72);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __27__ATRestoreAssetLink_close__block_invoke_2;
    block[3] = &unk_1E927E120;
    block[4] = v4;
    dispatch_async(v5, block);
  }
}

void __27__ATRestoreAssetLink_close__block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "assetLink:didCloseWithOutstandingAssets:", *(_QWORD *)(a1 + 32), 0);

}

void __26__ATRestoreAssetLink_open__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  _QWORD block[5];
  uint8_t buf[4];
  uint64_t v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 88))
  {
    _ATLogCategoryRestore();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = *(_QWORD *)(a1 + 32);
      v4 = *(unsigned __int8 *)(v3 + 49);
      *(_DWORD *)buf = 138543618;
      v10 = v3;
      v11 = 1024;
      v12 = v4;
      _os_log_impl(&dword_1D1868000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ open. _batchingIsSupported=%{BOOL}u", buf, 0x12u);
    }

    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 88) = 1;
    objc_msgSend(MEMORY[0x1E0DDBF60], "sharedMonitor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "registerObserver:", *(_QWORD *)(a1 + 32));

    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(NSObject **)(v6 + 72);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __26__ATRestoreAssetLink_open__block_invoke_34;
    block[3] = &unk_1E927E120;
    block[4] = v6;
    dispatch_async(v7, block);
  }
}

void __26__ATRestoreAssetLink_open__block_invoke_34(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "assetLink:didOpenWithPendingAssets:", *(_QWORD *)(a1 + 32), 0);

}

void __57__ATRestoreAssetLink_restoreSessionActiveWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  _QWORD block[4];
  id v11;
  _QWORD v12[5];
  id v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  _ATLogCategoryRestore();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(unsigned __int8 *)(v3 + 48);
    *(_DWORD *)buf = 138543618;
    v15 = v3;
    v16 = 1024;
    v17 = v4;
    _os_log_impl(&dword_1D1868000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ currentRestoreState %d", buf, 0x12u);
  }

  v5 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v5 + 48))
  {
    v6 = *(void **)(v5 + 8);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __57__ATRestoreAssetLink_restoreSessionActiveWithCompletion___block_invoke_23;
    v12[3] = &unk_1E927C910;
    v12[4] = v5;
    v13 = *(id *)(a1 + 40);
    objc_msgSend(v6, "fetchiCloudRestoreIsCompleteWithCompletion:", v12);
    v7 = v13;
  }
  else
  {
    v8 = *(void **)(a1 + 40);
    if (!v8)
      return;
    v9 = *(NSObject **)(v5 + 72);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __57__ATRestoreAssetLink_restoreSessionActiveWithCompletion___block_invoke_2_26;
    block[3] = &unk_1E927D970;
    v11 = v8;
    dispatch_async(v9, block);
    v7 = v11;
  }

}

void __57__ATRestoreAssetLink_restoreSessionActiveWithCompletion___block_invoke_23(uint64_t a1, char a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  id v13;
  char v14;

  v5 = a3;
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(a1 + 40);
  v8 = *(NSObject **)(v6 + 80);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __57__ATRestoreAssetLink_restoreSessionActiveWithCompletion___block_invoke_2;
  v10[3] = &unk_1E927C8E8;
  v11 = v5;
  v12 = v6;
  v14 = a2;
  v13 = v7;
  v9 = v5;
  dispatch_async(v8, v10);

}

uint64_t __57__ATRestoreAssetLink_restoreSessionActiveWithCompletion___block_invoke_2_26(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __57__ATRestoreAssetLink_restoreSessionActiveWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  NSObject *v4;
  int v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  int v9;
  void *v10;
  NSObject *v11;
  id v12;
  int8x16_t v13;
  _QWORD block[4];
  int8x16_t v15;
  id v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  int v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  _ATLogCategoryRestore();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v5 = *(unsigned __int8 *)(a1 + 56);
      v6 = *(_QWORD *)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 32), "msv_description");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v18 = v6;
      v19 = 1024;
      v20 = v5;
      v21 = 2114;
      v22 = v7;
      _os_log_impl(&dword_1D1868000, v4, OS_LOG_TYPE_ERROR, "%{public}@ mbManager reported restoreIsComplete:%d error=%{public}@", buf, 0x1Cu);

    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(_QWORD *)(a1 + 40);
    v9 = *(unsigned __int8 *)(a1 + 56);
    *(_DWORD *)buf = 138543618;
    v18 = v8;
    v19 = 1024;
    v20 = v9;
    _os_log_impl(&dword_1D1868000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ mbManager reported restoreIsComplete:%d", buf, 0x12u);
  }

  if (!*(_QWORD *)(a1 + 32))
    *(_BYTE *)(*(_QWORD *)(a1 + 40) + 48) = *(_BYTE *)(a1 + 56) ^ 1;
  v10 = *(void **)(a1 + 48);
  if (v10)
  {
    v11 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 72);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __57__ATRestoreAssetLink_restoreSessionActiveWithCompletion___block_invoke_24;
    block[3] = &unk_1E927E0A8;
    v16 = v10;
    v13 = *(int8x16_t *)(a1 + 32);
    v12 = (id)v13.i64[0];
    v15 = vextq_s8(v13, v13, 8uLL);
    dispatch_async(v11, block);

  }
}

uint64_t __57__ATRestoreAssetLink_restoreSessionActiveWithCompletion___block_invoke_24(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], *(unsigned __int8 *)(a1[4] + 48), a1[5]);
}

void __26__ATRestoreAssetLink_init__block_invoke(uint64_t a1)
{
  NSObject *v2;
  _QWORD *WeakRetained;
  void *v4;
  void *v5;
  _QWORD v6[4];
  _QWORD *v7;
  uint8_t buf[16];

  _ATLogCategoryRestore();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D1868000, v2, OS_LOG_TYPE_ERROR, "Restore cellular policy has changed - loading the new settings", buf, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = (void *)WeakRetained[1];
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __26__ATRestoreAssetLink_init__block_invoke_16;
    v6[3] = &unk_1E927C898;
    v7 = WeakRetained;
    objc_msgSend(v5, "fetchBackgroundRestoreCellularAccessWithCompletion:", v6);

  }
}

void __26__ATRestoreAssetLink_init__block_invoke_16(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  _QWORD *v10;
  NSObject *v11;
  _QWORD v12[4];
  NSObject *v13;
  id v14;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  _ATLogCategoryRestore();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v16 = v6;
      _os_log_impl(&dword_1D1868000, v8, OS_LOG_TYPE_ERROR, "Failed to fetch updated restore cellular policy. err=%{public}@", buf, 0xCu);
    }
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v16 = v9;
      v17 = 2114;
      v18 = v5;
      _os_log_impl(&dword_1D1868000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ Loaded updated restore cellular policy %{public}@", buf, 0x16u);
    }

    v10 = *(_QWORD **)(a1 + 32);
    v11 = v10[10];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __26__ATRestoreAssetLink_init__block_invoke_17;
    v12[3] = &unk_1E927E148;
    v13 = v10;
    v14 = v5;
    dispatch_async(v11, v12);

    v8 = v13;
  }

}

void __26__ATRestoreAssetLink_init__block_invoke_17(uint64_t a1)
{
  _QWORD *v2;
  NSObject *v3;
  _QWORD block[4];
  _QWORD *v5;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 24), *(id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_processQueuedAssets");
  v2 = *(_QWORD **)(a1 + 32);
  v3 = v2[9];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __26__ATRestoreAssetLink_init__block_invoke_2;
  block[3] = &unk_1E927E120;
  v5 = v2;
  dispatch_async(v3, block);

}

void __26__ATRestoreAssetLink_init__block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "restoreDelegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "restoreAssetLinkNetworkPolicyDidChange:", *(_QWORD *)(a1 + 32));

}

@end
