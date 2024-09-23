@implementation AXUltronModelAssetManager

+ (AXUltronModelAssetManager)sharedInstance
{
  if (sharedInstance_onceToken_5 != -1)
    dispatch_once(&sharedInstance_onceToken_5, &__block_literal_global_6);
  return (AXUltronModelAssetManager *)(id)sharedInstance__Shared;
}

void __43__AXUltronModelAssetManager_sharedInstance__block_invoke()
{
  AXUltronModelAssetManager *v0;
  void *v1;

  v0 = objc_alloc_init(AXUltronModelAssetManager);
  v1 = (void *)sharedInstance__Shared;
  sharedInstance__Shared = (uint64_t)v0;

}

- (AXUltronModelAssetManager)init
{
  AXUltronModelAssetManager *v2;
  NSMutableArray *v3;
  NSMutableArray *observers;
  NSMutableDictionary *v5;
  NSMutableDictionary *assetsTotalBytesWritten;
  NSMutableDictionary *v7;
  NSMutableDictionary *assetsTotalTimeExpected;
  NSMutableDictionary *v9;
  NSMutableDictionary *assetDownloadStalled;
  NSMutableDictionary *v11;
  NSMutableDictionary *assetsDownloading;
  NSMutableDictionary *v13;
  NSMutableDictionary *cachedAssets;
  void *v15;
  void *v16;
  uint64_t v17;
  AXAssetController *assetController;
  dispatch_queue_t v19;
  OS_dispatch_queue *assetDownloadQueue;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)AXUltronModelAssetManager;
  v2 = -[AXUltronModelAssetManager init](&v22, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    observers = v2->_observers;
    v2->_observers = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    assetsTotalBytesWritten = v2->_assetsTotalBytesWritten;
    v2->_assetsTotalBytesWritten = v5;

    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    assetsTotalTimeExpected = v2->_assetsTotalTimeExpected;
    v2->_assetsTotalTimeExpected = v7;

    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    assetDownloadStalled = v2->_assetDownloadStalled;
    v2->_assetDownloadStalled = v9;

    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    assetsDownloading = v2->_assetsDownloading;
    v2->_assetsDownloading = v11;

    v2->_previousReportedSize = 0;
    v2->_expectedDownloadSize = 0;
    v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    cachedAssets = v2->_cachedAssets;
    v2->_cachedAssets = v13;

    v15 = (void *)MEMORY[0x24BDFDD30];
    objc_msgSend(MEMORY[0x24BDFDD70], "policy");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "assetControllerWithPolicy:qosClass:", v16, 25);
    v17 = objc_claimAutoreleasedReturnValue();
    assetController = v2->_assetController;
    v2->_assetController = (AXAssetController *)v17;

    -[AXAssetController addObserver:](v2->_assetController, "addObserver:", v2);
    -[AXAssetController setUserInitiated:](v2->_assetController, "setUserInitiated:", 1);
    v19 = dispatch_queue_create("AXUltronModelAssetManagerDownloadQueue", 0);
    assetDownloadQueue = v2->_assetDownloadQueue;
    v2->_assetDownloadQueue = (OS_dispatch_queue *)v19;

  }
  return v2;
}

- (void)_resetDownloadTracking
{
  -[NSMutableDictionary removeAllObjects](self->_assetDownloadStalled, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_assetsTotalTimeExpected, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_assetsTotalBytesWritten, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_assetsDownloading, "removeAllObjects");
}

- (BOOL)isKShotAsset:(id)a3
{
  id v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;

  v3 = a3;
  objc_msgSend(v3, "ultronModelName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BDFF1B0]) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    objc_msgSend(v3, "ultronModelName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BDFF1B8]) & 1) != 0)
    {
      v5 = 1;
    }
    else
    {
      objc_msgSend(v3, "ultronModelName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x24BDFF1A8]);

    }
  }

  return v5;
}

- (void)addObserver:(id)a3
{
  id v4;
  NSObject *v5;

  v4 = a3;
  AXLogUltron();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[AXUltronModelAssetManager addObserver:].cold.1();

  if ((-[NSMutableArray containsObject:](self->_observers, "containsObject:", v4) & 1) == 0)
    -[NSMutableArray addObject:](self->_observers, "addObject:", v4);

}

- (void)removeObserver:(id)a3
{
  id v4;

  v4 = a3;
  if (-[NSMutableArray containsObject:](self->_observers, "containsObject:"))
    -[NSMutableArray removeObject:](self->_observers, "removeObject:", v4);

}

- (void)notifyAssetsReady
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_5_2(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_4(&dword_21ACD4000, v1, v2, "Notifying Assets Ready to %lu observers", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_2_1();
}

- (void)notifyAssetsNotReady
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = self->_observers;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "assetsNotReadyForUltronManager:", self, (_QWORD)v8);
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void)notifyDownloadProgress:(int64_t)a3 totalSizeExpected:(int64_t)a4 totalRemainingTime:(double)a5 isStalled:(BOOL)a6
{
  _BOOL8 v6;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v6 = a6;
  v22 = *MEMORY[0x24BDAC8D0];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v11 = self->_observers;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v18;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v18 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v15);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v16, "assetManager:totalSizeExpected:downloadProgressTotalWritten:remainingTimeExpected:isStalled:", self, a4, a3, v6, a5, (_QWORD)v17);
        ++v15;
      }
      while (v13 != v15);
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v13);
  }

  self->_previousReportedSize = a3;
  self->_expectedDownloadSize = a4;
}

- (void)notifyRefreshAssets:(id)a3 wasSuccessful:(BOOL)a4 error:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  NSObject *v10;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v6 = a4;
  v22 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  AXLogUltron();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[AXUltronModelAssetManager notifyAssetsReady].cold.1((uint64_t)self);

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v11 = self->_observers;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v18;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v18 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v15);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v16, "assetManager:didFinishRefreshingAssets:wasSuccessful:error:", self, v8, v6, v9, (_QWORD)v17);
        ++v15;
      }
      while (v13 != v15);
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v13);
  }

}

- (void)notifyPurgeAssets:(id)a3 wasSuccessful:(BOOL)a4 error:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  NSObject *v10;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v6 = a4;
  v22 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  AXLogUltron();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[AXUltronModelAssetManager notifyPurgeAssets:wasSuccessful:error:].cold.1((uint64_t)self);

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v11 = self->_observers;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v18;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v18 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v15);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v16, "assetManager:didFinishPurgingAssets:wasSuccessful:error:", self, v8, v6, v9, (_QWORD)v17);
        ++v15;
      }
      while (v13 != v15);
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v13);
  }

}

- (void)notifyAssetsState
{
  int64_t v3;
  int64_t previousReportedSize;
  int64_t v5;
  int64_t expectedDownloadSize;
  uint64_t v7;
  int64_t v8;

  switch(-[AXUltronModelAssetManager assetStatus](self, "assetStatus"))
  {
    case 0:
    case 1:
      -[AXUltronModelAssetManager notifyAssetsNotReady](self, "notifyAssetsNotReady");
      break;
    case 2:
      v3 = -[AXUltronModelAssetManager _totalBytesOfAllAssetsWritten](self, "_totalBytesOfAllAssetsWritten");
      if (v3 <= self->_previousReportedSize)
        previousReportedSize = self->_previousReportedSize;
      else
        previousReportedSize = v3;
      v5 = -[AXUltronModelAssetManager _expectedCurrentlyDownloadingSize](self, "_expectedCurrentlyDownloadingSize");
      expectedDownloadSize = self->_expectedDownloadSize;
      if (v5 > expectedDownloadSize)
        expectedDownloadSize = v5;
      if (expectedDownloadSize <= 1)
        v7 = 1;
      else
        v7 = expectedDownloadSize;
      if (previousReportedSize / v7 > 0)
        previousReportedSize = v7 - 1;
      -[AXUltronModelAssetManager notifyDownloadProgress:totalSizeExpected:totalRemainingTime:isStalled:](self, "notifyDownloadProgress:totalSizeExpected:totalRemainingTime:isStalled:", previousReportedSize, v7, -[AXUltronModelAssetManager isAssetDownloadStalled](self, "isAssetDownloadStalled"), (double)-[AXUltronModelAssetManager _totalExpectedTimeOfAllAssets](self, "_totalExpectedTimeOfAllAssets"));
      break;
    case 3:
      -[AXUltronModelAssetManager _resetDownloadTracking](self, "_resetDownloadTracking");
      v8 = -[AXUltronModelAssetManager totalSizeOccupied](self, "totalSizeOccupied");
      -[AXUltronModelAssetManager notifyDownloadProgress:totalSizeExpected:totalRemainingTime:isStalled:](self, "notifyDownloadProgress:totalSizeExpected:totalRemainingTime:isStalled:", v8, v8, 0, 0.0);
      -[AXUltronModelAssetManager notifyAssetsReady](self, "notifyAssetsReady");
      break;
    default:
      return;
  }
}

- (id)localURLForDetector:(id)a3
{
  void *v3;
  void *v4;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_cachedAssets, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)localPathForKShotHallucinator
{
  void *v2;
  void *v3;
  void *v4;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_cachedAssets, "objectForKeyedSubscript:", *MEMORY[0x24BDFF1B0]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "URLByAppendingPathComponent:", *MEMORY[0x24BDFF178]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)localPathForKShotModelWeights
{
  void *v2;
  void *v3;
  void *v4;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_cachedAssets, "objectForKeyedSubscript:", *MEMORY[0x24BDFF1B8]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "URLByAppendingPathComponent:", *MEMORY[0x24BDFF190]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)localPathForKShotGeneralApplianceDetector
{
  void *v2;
  void *v3;
  void *v4;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_cachedAssets, "objectForKeyedSubscript:", *MEMORY[0x24BDFF1A8]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "URLByAppendingPathComponent:", *MEMORY[0x24BDFF170]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)isKShotUsingSoundPrint
{
  void *v2;
  char v3;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_cachedAssets, "objectForKeyedSubscript:", *MEMORY[0x24BDFF1A8]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isUsingSoundPrint");

  return v3;
}

- (int64_t)totalSizeOccupied
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  int64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[NSMutableDictionary allKeys](self->_cachedAssets, "allKeys", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v3);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_cachedAssets, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "unarchivedFileSize");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v6 += objc_msgSend(v10, "longLongValue");

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (int64_t)totalSizeExpected
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  int64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[NSMutableDictionary allKeys](self->_cachedAssets, "allKeys", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v3);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_cachedAssets, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "downloadSize");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v6 += objc_msgSend(v10, "longLongValue");

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)isAssetCatalogInstalled
{
  return -[AXAssetController isAssetCatalogInstalled](self->_assetController, "isAssetCatalogInstalled");
}

- (BOOL)hasInProgressDownloads
{
  return -[AXAssetController hasInProgressDownloads](self->_assetController, "hasInProgressDownloads");
}

- (void)stopDownloadingAssets
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  AXAssetController *assetController;
  _QWORD v11[5];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[NSMutableDictionary allValues](self->_cachedAssets, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    v7 = MEMORY[0x24BDAC760];
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v9, "isDownloading"))
        {
          assetController = self->_assetController;
          v11[0] = v7;
          v11[1] = 3221225472;
          v11[2] = __50__AXUltronModelAssetManager_stopDownloadingAssets__block_invoke;
          v11[3] = &unk_24DDF6EE8;
          v11[4] = v9;
          -[AXAssetController stopDownloadAsset:completion:](assetController, "stopDownloadAsset:completion:", v9, v11);
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }

}

void __50__AXUltronModelAssetManager_stopDownloadingAssets__block_invoke(uint64_t a1)
{
  NSObject *v2;

  AXLogUltron();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __50__AXUltronModelAssetManager_stopDownloadingAssets__block_invoke_cold_1(a1, v2);

}

- (void)downloadAssets:(id)a3
{
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  AXUltronModelAssetManager *v9;

  if ((-[AXAssetController hasInProgressDownloads](self->_assetController, "hasInProgressDownloads", a3) & 1) == 0)
  {
    -[NSMutableDictionary allValues](self->_cachedAssets, "allValues");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXUltronModelAssetManager assetDownloadQueue](self, "assetDownloadQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __44__AXUltronModelAssetManager_downloadAssets___block_invoke;
    v7[3] = &unk_24DDF6B58;
    v8 = v4;
    v9 = self;
    v6 = v4;
    dispatch_async(v5, v7);

  }
}

void __44__AXUltronModelAssetManager_downloadAssets___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;

  objc_msgSend(MEMORY[0x24BDFDD70], "assetsToDownloadFromAssets:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(void **)(v3 + 16);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __44__AXUltronModelAssetManager_downloadAssets___block_invoke_2;
  v6[3] = &unk_24DDF6F10;
  v7 = v2;
  v8 = v3;
  v5 = v2;
  objc_msgSend(v4, "downloadAssets:successStartBlock:", v5, v6);

}

void __44__AXUltronModelAssetManager_downloadAssets___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[6];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  AXLogUltron();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __44__AXUltronModelAssetManager_downloadAssets___block_invoke_2_cold_1(a1);

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = *(id *)(a1 + 32);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    v7 = MEMORY[0x24BDAC760];
    v8 = MEMORY[0x24BDAC9B8];
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v10 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9);
        v11[0] = v7;
        v11[1] = 3221225472;
        v11[2] = __44__AXUltronModelAssetManager_downloadAssets___block_invoke_188;
        v11[3] = &unk_24DDF6B58;
        v11[4] = *(_QWORD *)(a1 + 40);
        v11[5] = v10;
        dispatch_async(v8, v11);
        ++v9;
      }
      while (v5 != v9);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }

}

void __44__AXUltronModelAssetManager_downloadAssets___block_invoke_188(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  objc_msgSend(*(id *)(a1 + 40), "ultronModelName");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setObject:forKey:", MEMORY[0x24BDBD1C8], v2);

}

- (void)_downloadAssets
{
  _QWORD *v2;
  _DWORD *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend((id)OUTLINED_FUNCTION_7(a1, a2), "ultronModelName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  *v3 = 138412290;
  *v2 = v4;
  OUTLINED_FUNCTION_4_1(&dword_21ACD4000, v5, v6, "Tried to assign total bytes written to an asset type that we don't currently support - should not happen! %@");

  OUTLINED_FUNCTION_9_0();
}

void __44__AXUltronModelAssetManager__downloadAssets__block_invoke(uint64_t a1)
{
  NSObject *v2;

  AXLogUltron();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __44__AXUltronModelAssetManager_downloadAssets___block_invoke_2_cold_1(a1);

}

- (void)purgeAssets:(id)a3
{
  -[AXAssetController purgeAssets:completion:](self->_assetController, "purgeAssets:completion:", a3, &__block_literal_global_190);
}

- (void)_updateDownloadingAsset:(id)a3 totalBytesWritten:(int64_t)a4 isStalled:(BOOL)a5 expectedTimeRemaining:(double)a6
{
  _BOOL8 v7;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;

  v7 = a5;
  v10 = (void *)MEMORY[0x24BDD16E0];
  v11 = a3;
  objc_msgSend(v10, "numberWithLongLong:", a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_assetsTotalBytesWritten, "setObject:forKeyedSubscript:", v12, v11);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", (uint64_t)a6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_assetsTotalTimeExpected, "setObject:forKeyedSubscript:", v13, v11);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v7);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_assetDownloadStalled, "setObject:forKeyedSubscript:", v14, v11);

}

- (int64_t)_totalBytesOfAllAssetsWritten
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  int64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[NSMutableDictionary allKeys](self->_assetsTotalBytesWritten, "allKeys", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v3);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_assetsTotalBytesWritten, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v6 += objc_msgSend(v9, "longLongValue");

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (int64_t)_expectedCurrentlyDownloadingSize
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  int64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  NSMutableDictionary *assetsDownloading;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[NSMutableDictionary allValues](self->_cachedAssets, "allValues", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        assetsDownloading = self->_assetsDownloading;
        objc_msgSend(v9, "ultronModelName");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKey:](assetsDownloading, "objectForKey:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          objc_msgSend(v9, "downloadSize");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v6 += objc_msgSend(v13, "longLongValue");

        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (int64_t)_totalExpectedTimeOfAllAssets
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  int64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[NSMutableDictionary allKeys](self->_assetsTotalTimeExpected, "allKeys", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v3);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_assetsTotalTimeExpected, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v6 += objc_msgSend(v9, "longLongValue");

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)isAssetDownloadStalled
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  int v9;
  BOOL v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[NSMutableDictionary allKeys](self->_assetDownloadStalled, "allKeys", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_assetDownloadStalled, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "BOOLValue");

        if (!v9)
        {
          v10 = 0;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v5)
        continue;
      break;
    }
  }
  v10 = 1;
LABEL_11:

  return v10;
}

- (int64_t)assetStatus
{
  void *v3;
  void *v4;
  uint64_t v5;
  int64_t v6;
  void *v7;
  int v8;

  if (!-[NSMutableDictionary count](self->_cachedAssets, "count"))
    return 0;
  -[NSMutableDictionary allValues](self->_cachedAssets, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ax_filteredArrayUsingBlock:", &__block_literal_global_193);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "count");
  if (v5 == -[NSMutableDictionary count](self->_cachedAssets, "count"))
  {
    v6 = 3;
  }
  else
  {
    -[NSMutableDictionary allValues](self->_assetsDownloading, "allValues");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "containsObject:", MEMORY[0x24BDBD1C8]);

    if (v8)
      v6 = 2;
    else
      v6 = 1;
  }

  return v6;
}

uint64_t __40__AXUltronModelAssetManager_assetStatus__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isInstalled");
}

- (void)_cacheAsset:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v8;
  void *v9;
  NSMutableDictionary *cachedAssets;
  void *v11;
  int v12;
  void *v13;
  NSMutableDictionary *v14;
  void *v15;
  int v16;
  NSObject *v17;

  v4 = a3;
  objc_msgSend(v4, "ultronModelName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  AXSDSoundDetectionTypeForIdentifier();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 == (void *)*MEMORY[0x24BDFF248] || v6 == (void *)*MEMORY[0x24BDFF238])
  {
    if (!-[AXUltronModelAssetManager isKShotAsset:](self, "isKShotAsset:", v4))
    {
      AXLogUltron();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
        -[AXUltronModelAssetManager _cacheAsset:].cold.1(v4);

      goto LABEL_19;
    }
    objc_msgSend(v4, "ultronModelName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](self->_cachedAssets, "objectForKey:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    cachedAssets = self->_cachedAssets;
    if (v9)
    {
      -[NSMutableDictionary objectForKey:](cachedAssets, "objectForKey:", v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isOlderThanAsset:", v4);

      if (!v12)
      {
LABEL_11:

        goto LABEL_19;
      }
      cachedAssets = self->_cachedAssets;
    }
    -[NSMutableDictionary setObject:forKey:](cachedAssets, "setObject:forKey:", v4, v8);
    goto LABEL_11;
  }
  -[NSMutableDictionary objectForKey:](self->_cachedAssets, "objectForKey:", v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = self->_cachedAssets;
  if (!v13)
    goto LABEL_15;
  -[NSMutableDictionary objectForKey:](v14, "objectForKey:", v6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "isOlderThanAsset:", v4);

  if (v16)
  {
    v14 = self->_cachedAssets;
LABEL_15:
    -[NSMutableDictionary setObject:forKey:](v14, "setObject:forKey:", v4, v6);
  }
LABEL_19:

}

- (void)refresh
{
  -[AXUltronModelAssetManager refreshAssetsUpdatingCatalogIfNeeded:](self, "refreshAssetsUpdatingCatalogIfNeeded:", 1);
}

- (void)refreshAssetsUpdatingCatalogIfNeeded:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  __int128 buf;
  Class (*v17)(uint64_t);
  void *v18;
  uint64_t *v19;
  uint64_t v20;

  v3 = a3;
  v20 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDFF278], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "soundDetectionState");

  if (v6)
  {
    AXLogUltron();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", CFAbsoluteTimeGetCurrent());
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v8;
      _os_log_impl(&dword_21ACD4000, v7, OS_LOG_TYPE_DEFAULT, "Updating Sound Detection last model access time: %@", (uint8_t *)&buf, 0xCu);

    }
    v12 = 0;
    v13 = &v12;
    v14 = 0x2050000000;
    v9 = (void *)getAXSettingsClass_softClass_0;
    v15 = getAXSettingsClass_softClass_0;
    if (!getAXSettingsClass_softClass_0)
    {
      *(_QWORD *)&buf = MEMORY[0x24BDAC760];
      *((_QWORD *)&buf + 1) = 3221225472;
      v17 = __getAXSettingsClass_block_invoke_0;
      v18 = &unk_24DDF66B8;
      v19 = &v12;
      __getAXSettingsClass_block_invoke_0((uint64_t)&buf);
      v9 = (void *)v13[3];
    }
    v10 = objc_retainAutorelease(v9);
    _Block_object_dispose(&v12, 8);
    objc_msgSend(v10, "sharedInstance", v12);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setSoundDetectionLastModelAccess:", CFAbsoluteTimeGetCurrent());

  }
  -[AXAssetController refreshAssetsByForceUpdatingCatalog:updatingCatalogIfNeeded:catalogRefreshOverrideTimeout:completion:](self->_assetController, "refreshAssetsByForceUpdatingCatalog:updatingCatalogIfNeeded:catalogRefreshOverrideTimeout:completion:", 0, v3, 0, 0);
}

- (void)assetController:(id)a3 didFinishRefreshingAssets:(id)a4 wasSuccessful:(BOOL)a5 error:(id)a6
{
  id v7;
  id v8;
  id v9;
  id v10;

  v7 = a4;
  v10 = a6;
  v8 = v10;
  v9 = v7;
  AXPerformBlockAsynchronouslyOnMainThread();

}

uint64_t __91__AXUltronModelAssetManager_assetController_didFinishRefreshingAssets_wasSuccessful_error___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint8_t v18[16];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  if (!*(_BYTE *)(a1 + 56))
  {
    AXLogUltron();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __91__AXUltronModelAssetManager_assetController_didFinishRefreshingAssets_wasSuccessful_error___block_invoke_cold_1(a1, v8, v11, v12, v13, v14, v15, v16);
    goto LABEL_15;
  }
  objc_msgSend(*(id *)(a1 + 32), "_filterAssetsToCache:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v20 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(a1 + 32), "_cacheAsset:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i));
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v4);
  }
  AXLogUltron();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v18 = 0;
    _os_log_impl(&dword_21ACD4000, v7, OS_LOG_TYPE_INFO, "Done refreshing assets and was successful", v18, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "setExpectedDownloadSize:", 0);
  objc_msgSend(*(id *)(a1 + 32), "_supportedTypesFromAssets:", *(_QWORD *)(a1 + 40));
  v8 = objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(MEMORY[0x24BDFF278], "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject allObjects](v8, "allObjects");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setSupportedSoundDetectionTypes:", v10);

LABEL_15:
  }
  objc_msgSend(*(id *)(a1 + 32), "notifyRefreshAssets:wasSuccessful:error:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 48));
  return objc_msgSend(*(id *)(a1 + 32), "notifyAssetsState");
}

- (id)_filterAssetsToCache:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v15 = v4;
  objc_msgSend(MEMORY[0x24BDFDD70], "compatibleAssetsFromRefreshedAssets:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v10);
        if (!AXIsSoundDetectionMedinaSupportEnabled()
          || -[AXUltronModelAssetManager isKShotAsset:](self, "isKShotAsset:", v11))
        {
          AXLogUltron();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v11, "ultronModelName");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v21 = v13;
            v22 = 2112;
            v23 = v11;
            _os_log_debug_impl(&dword_21ACD4000, v12, OS_LOG_TYPE_DEBUG, "Caching asset with name: %@. Asset: %@", buf, 0x16u);

          }
          objc_msgSend(v5, "addObject:", v11);
        }
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)_supportedTypesFromAssets:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void **v19;
  void **v20;
  uint64_t k;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v26;
  void *v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[16];
  _BYTE v43[128];
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  if (AXIsSoundDetectionMedinaSupportEnabled())
  {
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    AXSDSoundDetectionCategories();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v38, v45, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v39;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v39 != v8)
            objc_enumerationMutation(v5);
          v34 = 0u;
          v35 = 0u;
          v36 = 0u;
          v37 = 0u;
          AXSDSoundDetectionTypesForCategory();
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v34, v44, 16);
          if (v11)
          {
            v12 = v11;
            v13 = *(_QWORD *)v35;
            do
            {
              for (j = 0; j != v12; ++j)
              {
                if (*(_QWORD *)v35 != v13)
                  objc_enumerationMutation(v10);
                objc_msgSend(v4, "addObject:", *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * j));
              }
              v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v34, v44, 16);
            }
            while (v12);
          }

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v38, v45, 16);
      }
      while (v7);
    }

  }
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v28 = v3;
  objc_msgSend(MEMORY[0x24BDFDD70], "compatibleAssetsFromRefreshedAssets:", v3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v30, v43, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v31;
    v19 = (void **)MEMORY[0x24BDFF248];
    v20 = (void **)MEMORY[0x24BDFF238];
    do
    {
      for (k = 0; k != v17; ++k)
      {
        if (*(_QWORD *)v31 != v18)
          objc_enumerationMutation(v15);
        v22 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * k);
        objc_msgSend(v22, "ultronModelName");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        AXSDSoundDetectionTypeForIdentifier();
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        if (v24 == *v19 || v24 == *v20)
        {
          if (!-[AXUltronModelAssetManager isKShotAsset:](self, "isKShotAsset:", v22))
          {
            AXLogUltron();
            v26 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
              -[AXUltronModelAssetManager _supportedTypesFromAssets:].cold.1((uint64_t)v42, (uint64_t)v22);

          }
        }
        else
        {
          objc_msgSend(v4, "addObject:", v24);
        }

      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v30, v43, 16);
    }
    while (v17);
  }

  return v4;
}

- (void)assetController:(id)a3 asset:(id)a4 downloadProgressTotalWritten:(int64_t)a5 totalExpected:(int64_t)a6 isStalled:(BOOL)a7 expectedTimeRemaining:(double)a8
{
  id v8;
  id v9;

  v9 = a4;
  v8 = v9;
  AXPerformBlockAsynchronouslyOnMainThread();

}

void __126__AXUltronModelAssetManager_assetController_asset_downloadProgressTotalWritten_totalExpected_isStalled_expectedTimeRemaining___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;

  AXLogUltron();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __126__AXUltronModelAssetManager_assetController_asset_downloadProgressTotalWritten_totalExpected_isStalled_expectedTimeRemaining___block_invoke_cold_2(a1, v2);

  objc_msgSend(*(id *)(a1 + 40), "_cacheAsset:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "ultronModelName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  AXSDSoundDetectionTypeForIdentifier();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = *(void **)(a1 + 40);
  if (v4 == (void *)*MEMORY[0x24BDFF248] || v4 == (void *)*MEMORY[0x24BDFF238])
  {
    if (objc_msgSend(v5, "isKShotAsset:", *(_QWORD *)(a1 + 32)))
    {
      v7 = *(void **)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 32), "ultronModelName");
      v8 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "_updateDownloadingAsset:totalBytesWritten:isStalled:expectedTimeRemaining:", v8, *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 72), *(double *)(a1 + 64));
    }
    else
    {
      AXLogUltron();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
        __126__AXUltronModelAssetManager_assetController_asset_downloadProgressTotalWritten_totalExpected_isStalled_expectedTimeRemaining___block_invoke_cold_1((id *)(a1 + 32));
    }

  }
  else
  {
    objc_msgSend(v5, "_updateDownloadingAsset:totalBytesWritten:isStalled:expectedTimeRemaining:", v4, *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 72), *(double *)(a1 + 64));
  }
  v9 = *(void **)(*(_QWORD *)(a1 + 40) + 48);
  objc_msgSend(*(id *)(a1 + 32), "ultronModelName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", MEMORY[0x24BDBD1C8], v10);

  objc_msgSend(*(id *)(a1 + 40), "notifyAssetsState");
}

- (void)assetController:(id)a3 didFinishDownloadingAsset:(id)a4 wasSuccessful:(BOOL)a5 error:(id)a6 hasRemainingDownloads:(BOOL)a7
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a4;
  v11 = a6;
  v9 = v11;
  v10 = v8;
  AXPerformBlockAsynchronouslyOnMainThread();

}

uint64_t __113__AXUltronModelAssetManager_assetController_didFinishDownloadingAsset_wasSuccessful_error_hasRemainingDownloads___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  int v31;
  int v32;
  int v33;
  int v34;
  int v35;
  NSObject *v36;
  __int16 v37;
  _BYTE v38[20];
  int v39;
  __int16 v40;
  uint64_t v41;
  __int16 v42;
  int v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v2 = a1 + 40;
  objc_msgSend(*(id *)(a1 + 32), "_cacheAsset:", *(_QWORD *)(a1 + 40));
  if (*(_BYTE *)(v2 + 16))
  {
    objc_msgSend(*(id *)v2, "ultronModelName");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    AXSDSoundDetectionTypeForIdentifier();
    v4 = objc_claimAutoreleasedReturnValue();

    if (v4 == *MEMORY[0x24BDFF248] || v4 == *MEMORY[0x24BDFF238])
    {
      if (objc_msgSend(*(id *)(a1 + 32), "isKShotAsset:", *(_QWORD *)(a1 + 40)))
      {
        objc_msgSend(*(id *)v2, "downloadSize");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v6, "longLongValue");

        AXLogUltron();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        {
          v33 = *(unsigned __int8 *)(a1 + 56);
          v34 = *(unsigned __int8 *)(a1 + 57);
          v35 = 138413058;
          v36 = v4;
          v37 = 1024;
          *(_DWORD *)v38 = v33;
          *(_WORD *)&v38[4] = 2048;
          *(_QWORD *)&v38[6] = v7;
          *(_WORD *)&v38[14] = 1024;
          *(_DWORD *)&v38[16] = v34;
          _os_log_debug_impl(&dword_21ACD4000, v8, OS_LOG_TYPE_DEBUG, "Finished downloading asset: (%@). successful: %d. total size: %lld, hasRemainingDownloads: %d", (uint8_t *)&v35, 0x22u);
        }

        v9 = *(void **)(a1 + 32);
        objc_msgSend(*(id *)(a1 + 40), "ultronModelName");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "_updateDownloadingAsset:totalBytesWritten:isStalled:expectedTimeRemaining:", v10, v7, 0, 0.0);

      }
      else
      {
        AXLogUltron();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
          __113__AXUltronModelAssetManager_assetController_didFinishDownloadingAsset_wasSuccessful_error_hasRemainingDownloads___block_invoke_cold_2((id *)v2);

      }
    }
    else
    {
      objc_msgSend(*(id *)v2, "downloadSize");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "longLongValue");

      AXLogUltron();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(*(id *)(a1 + 40), "ultronModelName");
        v28 = objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(*(id *)(a1 + 40), "compatibilityVersion");
        v30 = objc_msgSend(*(id *)(a1 + 40), "contentVersion");
        v31 = *(unsigned __int8 *)(a1 + 56);
        v32 = *(unsigned __int8 *)(a1 + 57);
        v35 = 138413570;
        v36 = v28;
        v37 = 2048;
        *(_QWORD *)v38 = v29;
        *(_WORD *)&v38[8] = 2048;
        *(_QWORD *)&v38[10] = v30;
        *(_WORD *)&v38[18] = 1024;
        v39 = v31;
        v40 = 2048;
        v41 = v18;
        v42 = 1024;
        v43 = v32;
        _os_log_debug_impl(&dword_21ACD4000, v19, OS_LOG_TYPE_DEBUG, "Finished downloading asset: (%@ - CV: %lu - V: %lu). successful: %d. total size: %lld, hasRemainingDownloads: %d", (uint8_t *)&v35, 0x36u);

      }
      objc_msgSend(*(id *)(a1 + 32), "_updateDownloadingAsset:totalBytesWritten:isStalled:expectedTimeRemaining:", v4, v18, 0, 0.0);
    }
  }
  else
  {
    AXLogUltron();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __113__AXUltronModelAssetManager_assetController_didFinishDownloadingAsset_wasSuccessful_error_hasRemainingDownloads___block_invoke_cold_1(a1, v4, v11, v12, v13, v14, v15, v16);
  }

  objc_msgSend(*(id *)(a1 + 32), "_cacheAsset:", *(_QWORD *)(a1 + 40));
  v22 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  objc_msgSend(*(id *)(a1 + 40), "ultronModelName");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "objectForKey:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    v25 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
    objc_msgSend(*(id *)(a1 + 40), "ultronModelName");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setObject:forKey:", MEMORY[0x24BDBD1C0], v26);

  }
  return objc_msgSend(*(id *)(a1 + 32), "notifyAssetsState");
}

- (void)assetController:(id)a3 didFinishPurgingAssets:(id)a4 wasSuccessful:(BOOL)a5 error:(id)a6
{
  _BOOL8 v7;
  id v9;
  id v10;
  NSObject *v11;
  int v12;
  id v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v7 = a5;
  v16 = *MEMORY[0x24BDAC8D0];
  v9 = a4;
  v10 = a6;
  AXLogUltron();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = 138412546;
    v13 = v9;
    v14 = 2112;
    v15 = v10;
    _os_log_impl(&dword_21ACD4000, v11, OS_LOG_TYPE_INFO, "Did purge assets: (%@). result: %@", (uint8_t *)&v12, 0x16u);
  }

  -[AXUltronModelAssetManager notifyPurgeAssets:wasSuccessful:error:](self, "notifyPurgeAssets:wasSuccessful:error:", v9, v7, v10);
}

- (int64_t)previousReportedSize
{
  return self->_previousReportedSize;
}

- (void)setPreviousReportedSize:(int64_t)a3
{
  self->_previousReportedSize = a3;
}

- (int64_t)expectedDownloadSize
{
  return self->_expectedDownloadSize;
}

- (void)setExpectedDownloadSize:(int64_t)a3
{
  self->_expectedDownloadSize = a3;
}

- (NSMutableArray)cachedAXAssets
{
  return self->_cachedAXAssets;
}

- (void)setCachedAXAssets:(id)a3
{
  objc_storeStrong((id *)&self->_cachedAXAssets, a3);
}

- (OS_dispatch_queue)assetDownloadQueue
{
  return self->_assetDownloadQueue;
}

- (void)setAssetDownloadQueue:(id)a3
{
  objc_storeStrong((id *)&self->_assetDownloadQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetDownloadQueue, 0);
  objc_storeStrong((id *)&self->_cachedAXAssets, 0);
  objc_storeStrong((id *)&self->_cachedAssets, 0);
  objc_storeStrong((id *)&self->_assetsDownloading, 0);
  objc_storeStrong((id *)&self->_assetDownloadStalled, 0);
  objc_storeStrong((id *)&self->_assetsTotalTimeExpected, 0);
  objc_storeStrong((id *)&self->_assetsTotalBytesWritten, 0);
  objc_storeStrong((id *)&self->_assetController, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

- (void)addObserver:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2_0();
  _os_log_debug_impl(&dword_21ACD4000, v0, OS_LOG_TYPE_DEBUG, "Asset Manager add observer: %@", v1, 0xCu);
  OUTLINED_FUNCTION_2();
}

- (void)notifyPurgeAssets:(uint64_t)a1 wasSuccessful:error:.cold.1(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_5_2(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_4(&dword_21ACD4000, v1, v2, "Notifying Assets Purged to %lu observers", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_2_1();
}

void __50__AXUltronModelAssetManager_stopDownloadingAssets__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "ultronModelName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "assetId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = v4;
  v8 = 2112;
  v9 = v5;
  _os_log_debug_impl(&dword_21ACD4000, a2, OS_LOG_TYPE_DEBUG, "successfully stopped downloading asset: %@ - id: %@", (uint8_t *)&v6, 0x16u);

}

void __44__AXUltronModelAssetManager_downloadAssets___block_invoke_2_cold_1(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_8(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_4(&dword_21ACD4000, v1, v2, "Successfully started downloading %lu assets", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_2_1();
}

- (void)_cacheAsset:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "ultronModelName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2_4(&dword_21ACD4000, v2, v3, "Attempted to cache an asset type that we don't currently support - should not happen! %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_1();
}

void __91__AXUltronModelAssetManager_assetController_didFinishRefreshingAssets_wasSuccessful_error___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_21ACD4000, a2, a3, "Error refreshing assets: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)_supportedTypesFromAssets:(uint64_t)a1 .cold.1(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _DWORD *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend((id)OUTLINED_FUNCTION_7(a1, a2), "ultronModelName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  *v3 = 138412290;
  *v2 = v4;
  OUTLINED_FUNCTION_4_1(&dword_21ACD4000, v5, v6, "Received an asset type that we don't currently support - should not happen! %@");

  OUTLINED_FUNCTION_9_0();
}

void __126__AXUltronModelAssetManager_assetController_asset_downloadProgressTotalWritten_totalExpected_isStalled_expectedTimeRemaining___block_invoke_cold_1(id *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(*a1, "ultronModelName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2_4(&dword_21ACD4000, v2, v3, "Tried to update total bytes written for an asset type that we don't currently support - should not happen! %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_1();
}

void __126__AXUltronModelAssetManager_assetController_asset_downloadProgressTotalWritten_totalExpected_isStalled_expectedTimeRemaining___block_invoke_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 48);
  v4 = *(_QWORD *)(a1 + 56);
  v5 = *(unsigned __int8 *)(a1 + 72);
  v6 = 138413058;
  v7 = v2;
  v8 = 2048;
  v9 = v3;
  v10 = 2048;
  v11 = v4;
  v12 = 2048;
  v13 = v5;
  _os_log_debug_impl(&dword_21ACD4000, a2, OS_LOG_TYPE_DEBUG, "Downloading asset: (%@). bytes written: %lld of %lld. stalled: %ld", (uint8_t *)&v6, 0x2Au);
}

void __113__AXUltronModelAssetManager_assetController_didFinishDownloadingAsset_wasSuccessful_error_hasRemainingDownloads___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_21ACD4000, a2, a3, "Error downloading asset: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void __113__AXUltronModelAssetManager_assetController_didFinishDownloadingAsset_wasSuccessful_error_hasRemainingDownloads___block_invoke_cold_2(id *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(*a1, "ultronModelName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2_4(&dword_21ACD4000, v2, v3, "Attemped to mark download complete for an asset type that we don't currently support - should not happen! %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_1();
}

@end
