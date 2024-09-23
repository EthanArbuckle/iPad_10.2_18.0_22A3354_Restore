@implementation AXSDDetectorStore

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global);
  return (id)sharedInstance_SharedSettings;
}

void __35__AXSDDetectorStore_sharedInstance__block_invoke()
{
  AXSDDetectorStore *v0;
  void *v1;

  v0 = objc_alloc_init(AXSDDetectorStore);
  v1 = (void *)sharedInstance_SharedSettings;
  sharedInstance_SharedSettings = (uint64_t)v0;

}

- (AXSDDetectorStore)init
{
  AXSDDetectorStore *v2;
  uint64_t v3;
  NSPointerArray *observers;
  uint64_t v5;
  NSMutableDictionary *detectors;
  uint64_t v7;
  NSMutableArray *purgedDetectors;
  uint64_t v9;
  AXUltronModelAssetManager *assetManager;
  void *v11;
  _QWORD v13[4];
  id v14;
  id location;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)AXSDDetectorStore;
  v2 = -[AXSDDetectorStore init](&v16, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD1748], "weakObjectsPointerArray");
    v3 = objc_claimAutoreleasedReturnValue();
    observers = v2->_observers;
    v2->_observers = (NSPointerArray *)v3;

    v5 = objc_opt_new();
    detectors = v2->_detectors;
    v2->_detectors = (NSMutableDictionary *)v5;

    v7 = objc_opt_new();
    purgedDetectors = v2->_purgedDetectors;
    v2->_purgedDetectors = (NSMutableArray *)v7;

    +[AXUltronModelAssetManager sharedInstance](AXUltronModelAssetManager, "sharedInstance");
    v9 = objc_claimAutoreleasedReturnValue();
    assetManager = v2->_assetManager;
    v2->_assetManager = (AXUltronModelAssetManager *)v9;

    -[AXUltronModelAssetManager addObserver:](v2->_assetManager, "addObserver:", v2);
    objc_initWeak(&location, v2);
    objc_msgSend(MEMORY[0x24BDFF278], "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __25__AXSDDetectorStore_init__block_invoke;
    v13[3] = &unk_24DDF6738;
    objc_copyWeak(&v14, &location);
    objc_msgSend(v11, "registerUpdateBlock:forRetrieveSelector:withListener:", v13, sel_kShotDetectors, v2);

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __25__AXSDDetectorStore_init__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_reloadCustomDetectors");

}

- (int64_t)totalDownloadSize
{
  void *v2;
  int64_t v3;

  +[AXUltronModelAssetManager sharedInstance](AXUltronModelAssetManager, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "totalSizeExpected");

  return v3;
}

- (int64_t)totalUnarchivedFileSize
{
  void *v2;
  int64_t v3;

  +[AXUltronModelAssetManager sharedInstance](AXUltronModelAssetManager, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "totalSizeOccupied");

  return v3;
}

- (unint64_t)numberOfObservers
{
  -[NSPointerArray compact](self->_observers, "compact");
  return -[NSPointerArray count](self->_observers, "count");
}

- (void)addObserver:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v4 = a3;
  AXLogUltron();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[AXSDDetectorStore addObserver:].cold.1((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);

  -[NSPointerArray addPointer:](self->_observers, "addPointer:", v4);
}

- (void)removeObserver:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;

  v4 = a3;
  AXLogUltron();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[AXSDDetectorStore removeObserver:].cold.1((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);

  if (-[NSPointerArray count](self->_observers, "count"))
  {
    v12 = 0;
    while (1)
    {
      -[NSPointerArray pointerAtIndex:](self->_observers, "pointerAtIndex:", v12);
      v13 = (id)objc_claimAutoreleasedReturnValue();
      if (v13 == v4)
        break;

      if (++v12 >= -[NSPointerArray count](self->_observers, "count"))
        goto LABEL_9;
    }
    -[NSPointerArray replacePointerAtIndex:withPointer:](self->_observers, "replacePointerAtIndex:withPointer:", v12, 0);

  }
LABEL_9:
  -[NSPointerArray compact](self->_observers, "compact");

}

- (BOOL)isAssetCatalogInstalled
{
  void *v2;
  char v3;

  +[AXUltronModelAssetManager sharedInstance](AXUltronModelAssetManager, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isAssetCatalogInstalled");

  return v3;
}

- (BOOL)areDetectorsReady
{
  _BOOL8 v3;
  NSObject *v4;
  void *v5;
  _BOOL8 v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = -[AXSDDetectorStore _areKShotDetectorsReady](self, "_areKShotDetectorsReady");
  if (AXIsSoundDetectionMedinaSupportEnabled())
  {
    AXLogUltron();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412290;
      v12 = v5;
      _os_log_impl(&dword_21ACD4000, v4, OS_LOG_TYPE_INFO, "Medina is Enabled. Are KShot Detectors Ready: %@", (uint8_t *)&v11, 0xCu);

    }
  }
  else
  {
    v6 = -[AXSDDetectorStore _areStandardDetectorsReady](self, "_areStandardDetectorsReady");
    AXLogUltron();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412546;
      v12 = v8;
      v13 = 2112;
      v14 = v9;
      _os_log_impl(&dword_21ACD4000, v7, OS_LOG_TYPE_INFO, "Are KShot Detectors Ready: %@. Are Standard Detectors Ready: %@.", (uint8_t *)&v11, 0x16u);

    }
    LOBYTE(v3) = v3 && v6;
  }
  return v3;
}

- (BOOL)_areStandardDetectorsReady
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  int v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDFF278], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "supportedSoundDetectionTypes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[AXSDDetectorStore detectorsByIdentifier](self, "detectorsByIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count")
    && (objc_msgSend(v5, "allValues"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "count"),
        v6,
        v7))
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v8 = v4;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v18;
LABEL_5:
      v12 = 0;
      while (1)
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(v5, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v12), (_QWORD)v17);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v13;
        if (!v13)
          break;
        v15 = objc_msgSend(v13, "isInstalled");

        if (!v15)
        {
          LOBYTE(v14) = 0;
          break;
        }
        if (v10 == ++v12)
        {
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
          LOBYTE(v14) = 1;
          if (v10)
            goto LABEL_5;
          break;
        }
      }
    }
    else
    {
      LOBYTE(v14) = 1;
    }

  }
  else
  {
    LOBYTE(v14) = 0;
  }

  return (char)v14;
}

- (BOOL)_areKShotDetectorsReady
{
  uint64_t v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  _QWORD v18[4];

  v18[3] = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BDFF1B8];
  v18[0] = *MEMORY[0x24BDFF1B0];
  v18[1] = v3;
  v18[2] = *MEMORY[0x24BDFF1A8];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 3);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v14 != v7)
        objc_enumerationMutation(v4);
      -[AXSDDetectorStore detectorWithName:](self, "detectorWithName:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v8), (_QWORD)v13);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (!v9)
        break;
      v11 = objc_msgSend(v9, "isInstalled");

      if (!v11)
      {
        LOBYTE(v10) = 0;
        break;
      }
      if (v6 == ++v8)
      {
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        LOBYTE(v10) = 1;
        if (v6)
          goto LABEL_3;
        break;
      }
    }
  }
  else
  {
    LOBYTE(v10) = 1;
  }

  return (char)v10;
}

- (BOOL)hasInProgressDownloads
{
  return -[AXUltronModelAssetManager hasInProgressDownloads](self->_assetManager, "hasInProgressDownloads");
}

- (void)loadDetectors
{
  if (AXIsSoundDetectionMedinaSupportEnabled())
    -[AXSDDetectorStore _createSDDetectors](self, "_createSDDetectors");
  -[AXUltronModelAssetManager refresh](self->_assetManager, "refresh");
  -[AXSDDetectorStore _reloadCustomDetectors](self, "_reloadCustomDetectors");
}

- (void)_createSDDetectors
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  AXSDDetector *v12;
  void *v13;
  id obj;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  AXSDSoundDetectionCategories();
  obj = (id)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v16)
  {
    v15 = *(_QWORD *)v22;
    do
    {
      v3 = 0;
      do
      {
        if (*(_QWORD *)v22 != v15)
          objc_enumerationMutation(obj);
        v17 = 0u;
        v18 = 0u;
        v19 = 0u;
        v20 = 0u;
        AXSDSoundDetectionTypesForCategory();
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
        if (v5)
        {
          v6 = v5;
          v7 = *(_QWORD *)v18;
          do
          {
            v8 = 0;
            do
            {
              if (*(_QWORD *)v18 != v7)
                objc_enumerationMutation(v4);
              v9 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v8);
              -[AXSDDetectorStore detectors](self, "detectors");
              v10 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "objectForKey:", v9);
              v11 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v11)
              {
                v12 = -[AXSDDetector initWithIdentifier:andName:]([AXSDDetector alloc], "initWithIdentifier:andName:", v9, v9);
                -[AXSDDetectorStore detectors](self, "detectors");
                v13 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v13, "setObject:forKey:", v12, v9);

              }
              ++v8;
            }
            while (v6 != v8);
            v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
          }
          while (v6);
        }

        ++v3;
      }
      while (v3 != v16);
      v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v16);
  }

}

- (void)_removeCustomDetectors
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  -[AXSDDetectorStore customDetectors](self, "customDetectors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v7);
        -[AXSDDetectorStore detectors](self, "detectors");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "identifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "removeObjectForKey:", v10);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

}

- (void)_reloadCustomDetectors
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  -[AXSDDetectorStore _removeCustomDetectors](self, "_removeCustomDetectors");
  objc_msgSend(MEMORY[0x24BDFF278], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodedKShotDetectors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v5, "objectForKey:", v10, (_QWORD)v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[AXSDDetectorStore detectors](self, "detectors");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setObject:forKey:", v11, v10);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

}

- (void)downloadDetectors
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  -[AXSDDetectorStore unInstalledDetectors](self, "unInstalledDetectors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v9, "identifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "objectForKey:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v11 || objc_msgSend(v11, "isOlderThanDetector:", v9))
        {
          objc_msgSend(v9, "identifier");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "setObject:forKey:", v9, v12);

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }
  objc_msgSend(v3, "allValues");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXSDDetectorStore _downloadAssetsFromDetectors:](self, "_downloadAssetsFromDetectors:", v13);

}

- (void)stopDownloadOfDetectors
{
  -[AXUltronModelAssetManager stopDownloadingAssets](self->_assetManager, "stopDownloadingAssets");
}

- (void)_downloadAssetsFromDetectors:(id)a3
{
  id v3;
  void *v4;
  int v5;
  NSObject *v6;
  id v7;
  const char *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  id v18;
  void *v19;
  NSObject *v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  id v30;
  __int16 v31;
  id v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  +[AXUltronModelAssetManager sharedInstance](AXUltronModelAssetManager, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hasInProgressDownloads");

  if (v5)
  {
    AXLogUltron();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v30 = (id)objc_opt_class();
      v7 = v30;
      v8 = "[%@]: not downloading detectors as there are already downloads in progress";
LABEL_24:
      _os_log_impl(&dword_21ACD4000, v6, OS_LOG_TYPE_INFO, v8, buf, 0xCu);

    }
  }
  else if (v3 && objc_msgSend(v3, "count"))
  {
    v6 = objc_opt_new();
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v24 = v3;
    v9 = v3;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v26 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
          if ((objc_msgSend(v14, "isCustom") & 1) == 0)
          {
            objc_msgSend(v14, "model");
            v15 = (void *)objc_claimAutoreleasedReturnValue();

            if (v15)
            {
              objc_msgSend(v14, "model");
              v16 = objc_claimAutoreleasedReturnValue();
              -[NSObject addObject:](v6, "addObject:", v16);
            }
            else
            {
              AXLogUltron();
              v16 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
              {
                v17 = (void *)objc_opt_class();
                v18 = v17;
                objc_msgSend(v14, "model");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412546;
                v30 = v17;
                v31 = 2112;
                v32 = v19;
                _os_log_error_impl(&dword_21ACD4000, v16, OS_LOG_TYPE_ERROR, "[%@]: candidate detector for download has no asset: %@", buf, 0x16u);

              }
            }

          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
      }
      while (v11);
    }

    AXLogUltron();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      v21 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138412546;
      v30 = v21;
      v31 = 2112;
      v32 = v9;
      v22 = v21;
      _os_log_impl(&dword_21ACD4000, v20, OS_LOG_TYPE_INFO, "[%@]: Downloading assets that need upgrading: %@", buf, 0x16u);

    }
    +[AXUltronModelAssetManager sharedInstance](AXUltronModelAssetManager, "sharedInstance");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "downloadAssets:", v6);

    v3 = v24;
  }
  else
  {
    AXLogUltron();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v30 = (id)objc_opt_class();
      v7 = v30;
      v8 = "[%@]: no detectors to download.";
      goto LABEL_24;
    }
  }

}

- (void)purgeDetectors
{
  void *v3;
  id v4;

  -[AXSDDetectorStore installedDetectors](self, "installedDetectors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ax_filteredArrayUsingBlock:", &__block_literal_global_12);
  v4 = (id)objc_claimAutoreleasedReturnValue();

  -[AXSDDetectorStore _purgeAssetsFromDetectors:](self, "_purgeAssetsFromDetectors:", v4);
}

BOOL __35__AXSDDetectorStore_purgeDetectors__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  _BOOL8 v3;
  void *v4;

  v2 = a2;
  if ((objc_msgSend(v2, "isCustom") & 1) != 0)
  {
    v3 = 0;
  }
  else
  {
    objc_msgSend(v2, "model");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v4 != 0;

  }
  return v3;
}

- (void)_purgeAssetsFromDetectors:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  id v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t v34[128];
  uint8_t buf[4];
  id v36;
  __int16 v37;
  id v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (v4 && objc_msgSend(v4, "count"))
  {
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v6 = v5;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v31;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v31 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * v10++), "setIsEnabled:", 0);
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
      }
      while (v8);
    }

    objc_msgSend(v6, "ax_mappedArrayUsingBlock:", &__block_literal_global_14);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[AXUltronModelAssetManager sharedInstance](AXUltronModelAssetManager, "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stopDownloadingAssets");

    AXLogUltron();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v14 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138412546;
      v36 = v14;
      v37 = 2112;
      v38 = v6;
      v15 = v14;
      _os_log_impl(&dword_21ACD4000, v13, OS_LOG_TYPE_INFO, "[%@]: Purging assets that are no longer needed: %@", buf, 0x16u);

    }
    +[AXUltronModelAssetManager sharedInstance](AXUltronModelAssetManager, "sharedInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "purgeAssets:", v11);

    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v17 = v11;
    v18 = -[NSObject countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v27;
      do
      {
        v21 = 0;
        do
        {
          if (*(_QWORD *)v27 != v20)
            objc_enumerationMutation(v17);
          v22 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v21);
          -[AXSDDetectorStore detectors](self, "detectors", (_QWORD)v26);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "assetId");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "removeObjectForKey:", v24);

          ++v21;
        }
        while (v19 != v21);
        v19 = -[NSObject countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
      }
      while (v19);
    }

  }
  else
  {
    AXLogUltron();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v36 = (id)objc_opt_class();
      v25 = v36;
      _os_log_impl(&dword_21ACD4000, v17, OS_LOG_TYPE_INFO, "[%@]: no detectors to purge.", buf, 0xCu);

    }
  }

}

id __47__AXSDDetectorStore__purgeAssetsFromDetectors___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  if ((objc_msgSend(v2, "isCustom") & 1) != 0)
  {
    v3 = 0;
  }
  else
  {
    objc_msgSend(v2, "model");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v3;
}

- (id)_detectorsNeedingUpgrade
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _QWORD v25[2];
  _QWORD v26[2];
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  -[AXSDDetectorStore unInstalledDetectors](self, "unInstalledDetectors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXSDDetectorStore detectorsByIdentifier](self, "detectorsByIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_opt_new();
  v6 = (void *)objc_opt_new();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v7 = v3;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v31, 16);
  if (v8)
  {
    v10 = v8;
    v11 = *(_QWORD *)v22;
    *(_QWORD *)&v9 = 138412546;
    v20 = v9;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v22 != v11)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v13, "identifier", v20);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "objectForKey:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v15)
        {
          AXLogUltron();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v28 = v13;
            _os_log_impl(&dword_21ACD4000, v16, OS_LOG_TYPE_INFO, "No installed detector found. %@ needs to be installed.", buf, 0xCu);
          }

          objc_msgSend(v6, "addObject:", v13);
          objc_msgSend(v13, "setNeedsUpdate:", 1);
        }
        if (objc_msgSend(v15, "isOlderThanDetector:", v13)
          && objc_msgSend(v15, "isCompatiable"))
        {
          AXLogUltron();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = v20;
            v28 = v15;
            v29 = 2112;
            v30 = v13;
            _os_log_impl(&dword_21ACD4000, v17, OS_LOG_TYPE_INFO, "Installed Detector: %@ needs upgrade to: %@", buf, 0x16u);
          }

          objc_msgSend(v5, "addObject:", v15);
          objc_msgSend(v6, "addObject:", v13);
          objc_msgSend(v15, "setNeedsUpdate:", 1);
        }

      }
      v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v31, 16);
    }
    while (v10);
  }

  v25[0] = CFSTR("old");
  v25[1] = CFSTR("new");
  v26[0] = v5;
  v26[1] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v26, v25, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (id)detectorWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  char v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[AXSDDetectorStore customDetectors](self, "customDetectors", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v21;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v21 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v10, "identifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqualToString:", v4);

        if ((v12 & 1) != 0)
        {
          v16 = v10;
          goto LABEL_15;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v7)
        continue;
      break;
    }
  }

  if (!AXIsSoundDetectionMedinaSupportEnabled())
    goto LABEL_13;
  AXSDSoundDetectionTypeForIdentifier();
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v5 = (void *)v13;
    -[AXSDDetectorStore detectors](self, "detectors");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKey:", v5);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {

LABEL_13:
      -[AXSDDetectorStore _detectorWithIdentifier:](self, "_detectorWithIdentifier:", v4);
      v16 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_16;
    }
    -[AXSDDetectorStore _createSDDetectors](self, "_createSDDetectors");
    -[AXSDDetectorStore detectors](self, "detectors");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectForKey:", v5);
    v16 = (id)objc_claimAutoreleasedReturnValue();

LABEL_15:
  }
  else
  {
    AXLogUltron();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[AXSDDetectorStore detectorWithIdentifier:].cold.1((uint64_t)v4, v18);

    v16 = 0;
  }
LABEL_16:

  return v16;
}

- (id)_detectorWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  int v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  id v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  -[AXSDDetectorStore installedDetectors](self, "installedDetectors");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v28 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        objc_msgSend(v11, "identifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqualToString:", v4);

        if (v13)
          objc_msgSend(v5, "addObject:", v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v8);
  }

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v14 = v5;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
  if (v15)
  {
    v16 = v15;
    v17 = 0;
    v18 = *(_QWORD *)v24;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v24 != v18)
          objc_enumerationMutation(v14);
        v20 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * j);
        if (v17)
        {
          if (objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * j), "isEnabled", (_QWORD)v23)
            || objc_msgSend(v17, "isOlderThanDetector:", v20))
          {
            v21 = v20;

            v17 = v21;
          }
        }
        else
        {
          v17 = v20;
        }
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    }
    while (v16);
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (id)detectorWithName:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (AXIsSoundDetectionMedinaSupportEnabled())
    -[AXSDDetectorStore _createSDDetectors](self, "_createSDDetectors");
  -[AXSDDetectorStore _detectorWithName:](self, "_detectorWithName:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_detectorWithName:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[AXSDDetectorStore detectors](self, "detectors", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v17 != v8)
        objc_enumerationMutation(v5);
      v10 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v9);
      -[AXSDDetectorStore detectors](self, "detectors");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKey:", v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "name");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "isEqualToString:", v4);

      if ((v14 & 1) != 0)
        break;

      if (v7 == ++v9)
      {
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v7)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    v12 = 0;
  }

  return v12;
}

- (id)detectorWithAssetID:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[AXSDDetectorStore detectors](self, "detectors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)allDetectors
{
  void *v2;
  void *v3;

  -[AXSDDetectorStore detectors](self, "detectors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)supportedDetectors
{
  void *v2;
  void *v3;
  void *v4;

  -[AXSDDetectorStore detectors](self, "detectors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ax_filteredArrayUsingBlock:", &__block_literal_global_19);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __39__AXSDDetectorStore_supportedDetectors__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  if (objc_msgSend(v2, "isCustom"))
    v3 = objc_msgSend(v2, "isModelReady");
  else
    v3 = 1;

  return v3;
}

- (id)installedDetectors
{
  void *v2;
  void *v3;
  void *v4;

  -[AXSDDetectorStore detectors](self, "detectors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ax_filteredArrayUsingBlock:", &__block_literal_global_20);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __39__AXSDDetectorStore_installedDetectors__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isInstalled");
}

- (id)unInstalledDetectors
{
  void *v2;
  void *v3;
  void *v4;

  -[AXSDDetectorStore detectors](self, "detectors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ax_filteredArrayUsingBlock:", &__block_literal_global_21);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __41__AXSDDetectorStore_unInstalledDetectors__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isInstalled") ^ 1;
}

- (id)customDetectors
{
  void *v2;
  void *v3;
  void *v4;

  -[AXSDDetectorStore detectors](self, "detectors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ax_filteredArrayUsingBlock:", &__block_literal_global_22);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __36__AXSDDetectorStore_customDetectors__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isCustom");
}

- (id)enabledDetectors
{
  void *v2;
  void *v3;
  void *v4;

  -[AXSDDetectorStore detectors](self, "detectors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ax_filteredArrayUsingBlock:", &__block_literal_global_23);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __37__AXSDDetectorStore_enabledDetectors__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isEnabled");
}

- (id)_addDetectorForAXAsset:(id)a3
{
  id v4;
  AXSDDetector *v5;
  NSMutableDictionary *detectors;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  NSObject *v16;
  void *v17;
  id v18;
  void *v19;
  int v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = -[AXSDDetector initWithModel:]([AXSDDetector alloc], "initWithModel:", v4);
  detectors = self->_detectors;
  objc_msgSend(v4, "assetId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](detectors, "setObject:forKey:", v5, v7);

  if ((AXIsSoundDetectionMedinaSupportEnabled() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDFDD38], "store");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDFDD70], "ultronAssetType");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "valueForKey:forAssetType:", CFSTR("AXUltronAssetsInUse"), v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "mutableCopy");

    if (!v11)
      v11 = (void *)objc_opt_new();
    -[AXSDDetector identifier](v5, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKey:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(v4, "assetId");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v13, "isEqualToString:", v14);

      if (v15)
      {
        AXLogUltron();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          v17 = (void *)objc_opt_class();
          v18 = v17;
          -[AXSDDetector identifier](v5, "identifier");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = 138412802;
          v22 = v17;
          v23 = 2112;
          v24 = v13;
          v25 = 2112;
          v26 = v19;
          _os_log_impl(&dword_21ACD4000, v16, OS_LOG_TYPE_INFO, "[%@]: found asset id in metadata store: %@. setting detector: %@ to enabled", (uint8_t *)&v21, 0x20u);

        }
        -[AXSDDetector setIsEnabled:](v5, "setIsEnabled:", 1);
      }
    }

  }
  return v5;
}

- (id)allDetectorsByIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[AXSDDetectorStore detectors](self, "detectors", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v10, "identifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "objectForKey:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v12)
          v12 = (void *)objc_opt_new();
        objc_msgSend(v12, "addObject:", v10);
        objc_msgSend(v3, "setObject:forKey:", v12, v11);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  return v3;
}

- (id)detectorsByIdentifier
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  v4 = objc_alloc(MEMORY[0x24BDBCF20]);
  -[AXSDDetectorStore allDetectorsByIdentifier](self, "allDetectorsByIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithArray:", v6);

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        -[AXSDDetectorStore detectorWithIdentifier:](self, "detectorWithIdentifier:", v13, (_QWORD)v16);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
          objc_msgSend(v3, "setObject:forKey:", v14, v13);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v10);
  }

  return v3;
}

- (id)localizedNamesByIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  void *v19;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDFF278], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "supportedSoundDetectionTypes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)objc_opt_new();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v27 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i);
        AXSDSoundDetectionLocalizedTitleForType();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setValue:forKey:", v12, v11);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v8);
  }

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[AXSDDetectorStore customDetectors](self, "customDetectors", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v23;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v23 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * j);
        objc_msgSend(v18, "identifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "name");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setValue:forKey:", v20, v19);

      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    }
    while (v15);
  }

  return v5;
}

- (void)enableDetector:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  -[AXSDDetectorStore detectors](self, "detectors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "model");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "assetId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setIsEnabled:", 1);

  objc_msgSend(MEMORY[0x24BDFF278], "sharedInstance");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setDetectorIsEnabled:isEnabled:", v4, 1);

}

- (void)enableDetectorWithIdentifier:(id)a3
{
  id v4;

  -[AXSDDetectorStore detectorWithIdentifier:](self, "detectorWithIdentifier:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXSDDetectorStore enableDetector:](self, "enableDetector:", v4);

}

- (void)disableDetector:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  -[AXSDDetectorStore detectors](self, "detectors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "model");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "assetId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setIsEnabled:", 0);

  objc_msgSend(MEMORY[0x24BDFF278], "sharedInstance");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setDetectorIsEnabled:isEnabled:", v4, 0);

}

- (void)disableDetectorWithIdentifier:(id)a3
{
  id v4;

  -[AXSDDetectorStore detectorWithIdentifier:](self, "detectorWithIdentifier:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXSDDetectorStore disableDetector:](self, "disableDetector:", v4);

}

- (void)_enumerateObserversWithBlock:(id)a3
{
  void (**v4)(_QWORD);
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(_QWORD))a3;
  -[NSPointerArray compact](self->_observers, "compact");
  -[NSPointerArray allObjects](self->_observers, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        if (*(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9))
          v4[2](v4);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)_notifyObserversAvailableDetectorsDidUpdate:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __65__AXSDDetectorStore__notifyObserversAvailableDetectorsDidUpdate___block_invoke;
  v6[3] = &unk_24DDF6880;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[AXSDDetectorStore _enumerateObserversWithBlock:](self, "_enumerateObserversWithBlock:", v6);

}

void __65__AXSDDetectorStore__notifyObserversAvailableDetectorsDidUpdate___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "detectorStore:availableDetectorsDidUpdate:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)_notifyObserversDetectorsNeedUpdate:(id)a3 toDetectors:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __69__AXSDDetectorStore__notifyObserversDetectorsNeedUpdate_toDetectors___block_invoke;
  v10[3] = &unk_24DDF68A8;
  v10[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[AXSDDetectorStore _enumerateObserversWithBlock:](self, "_enumerateObserversWithBlock:", v10);

}

void __69__AXSDDetectorStore__notifyObserversDetectorsNeedUpdate_toDetectors___block_invoke(_QWORD *a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "detectorStore:detectorsNeedUpdate:toDetectors:", a1[4], a1[5], a1[6]);

}

- (void)_notifyObserversDidFinishRefreshingDetectors:(id)a3 wasSuccessful:(BOOL)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  BOOL v15;

  v8 = a3;
  v9 = a5;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __86__AXSDDetectorStore__notifyObserversDidFinishRefreshingDetectors_wasSuccessful_error___block_invoke;
  v12[3] = &unk_24DDF68D0;
  v12[4] = self;
  v13 = v8;
  v15 = a4;
  v14 = v9;
  v10 = v9;
  v11 = v8;
  -[AXSDDetectorStore _enumerateObserversWithBlock:](self, "_enumerateObserversWithBlock:", v12);

}

void __86__AXSDDetectorStore__notifyObserversDidFinishRefreshingDetectors_wasSuccessful_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "detectorStore:didFinishRefreshingDetectors:wasSuccessful:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 48));

}

- (void)_notifyObserversDetectorsAreReady
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __54__AXSDDetectorStore__notifyObserversDetectorsAreReady__block_invoke;
  v2[3] = &unk_24DDF68F8;
  v2[4] = self;
  -[AXSDDetectorStore _enumerateObserversWithBlock:](self, "_enumerateObserversWithBlock:", v2);
}

void __54__AXSDDetectorStore__notifyObserversDetectorsAreReady__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "detectorsReadyForDetectorStore:", *(_QWORD *)(a1 + 32));

}

- (void)_notifyObserversDetectorsDownloadProgress:(int64_t)a3 totalSizeExpected:(int64_t)a4 remainingTimeExpected:(double)a5 isStalled:(BOOL)a6
{
  _QWORD v6[8];
  BOOL v7;

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __113__AXSDDetectorStore__notifyObserversDetectorsDownloadProgress_totalSizeExpected_remainingTimeExpected_isStalled___block_invoke;
  v6[3] = &unk_24DDF6920;
  v6[4] = self;
  v6[5] = a4;
  v6[6] = a3;
  *(double *)&v6[7] = a5;
  v7 = a6;
  -[AXSDDetectorStore _enumerateObserversWithBlock:](self, "_enumerateObserversWithBlock:", v6);
}

void __113__AXSDDetectorStore__notifyObserversDetectorsDownloadProgress_totalSizeExpected_remainingTimeExpected_isStalled___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "detectorStore:totalSizeExpected:downloadProgressTotalWritten:remainingTimeExpected:isStalled:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 64), *(double *)(a1 + 56));

}

- (void)_notifyObserversDetectorsDownloadProgress:(int64_t)a3 totalSizeExpected:(int64_t)a4 remainingTimeExpected:(double)a5 isStalled:(BOOL)a6 error:(id)a7
{
  _QWORD v7[8];
  BOOL v8;

  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __119__AXSDDetectorStore__notifyObserversDetectorsDownloadProgress_totalSizeExpected_remainingTimeExpected_isStalled_error___block_invoke;
  v7[3] = &unk_24DDF6920;
  v7[4] = self;
  v7[5] = a4;
  v7[6] = a3;
  *(double *)&v7[7] = a5;
  v8 = a6;
  -[AXSDDetectorStore _enumerateObserversWithBlock:](self, "_enumerateObserversWithBlock:", v7, a4, a6, a7);
}

void __119__AXSDDetectorStore__notifyObserversDetectorsDownloadProgress_totalSizeExpected_remainingTimeExpected_isStalled_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "detectorStore:totalSizeExpected:downloadProgressTotalWritten:remainingTimeExpected:isStalled:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 64), *(double *)(a1 + 56));

}

- (void)_notifyObserversDidFinishPurgingDetectors:(id)a3 wasSuccessful:(BOOL)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  BOOL v15;

  v8 = a3;
  v9 = a5;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __83__AXSDDetectorStore__notifyObserversDidFinishPurgingDetectors_wasSuccessful_error___block_invoke;
  v12[3] = &unk_24DDF68D0;
  v12[4] = self;
  v13 = v8;
  v15 = a4;
  v14 = v9;
  v10 = v9;
  v11 = v8;
  -[AXSDDetectorStore _enumerateObserversWithBlock:](self, "_enumerateObserversWithBlock:", v12);

}

void __83__AXSDDetectorStore__notifyObserversDidFinishPurgingDetectors_wasSuccessful_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "detectorStore:didFinishPurgingDetectors:wasSuccessful:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 48));

}

- (void)assetManager:(id)a3 didFinishRefreshingAssets:(id)a4 wasSuccessful:(BOOL)a5 error:(id)a6
{
  _BOOL8 v7;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  _QWORD v38[4];
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t v44[128];
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  uint64_t v48;
  __int16 v49;
  _BOOL4 v50;
  __int16 v51;
  id v52;
  uint64_t v53;

  v7 = a5;
  v53 = *MEMORY[0x24BDAC8D0];
  v9 = a4;
  v10 = a6;
  AXLogUltron();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = (void *)objc_opt_class();
    v13 = v12;
    *(_DWORD *)buf = 138413058;
    v46 = v12;
    v47 = 2048;
    v48 = objc_msgSend(v9, "count");
    v49 = 1024;
    v50 = v7;
    v51 = 2112;
    v52 = v10;
    _os_log_impl(&dword_21ACD4000, v11, OS_LOG_TYPE_INFO, "[%@]: assets did finish refreshing. assets: %lu - was successful: %d - error: %@", buf, 0x26u);

  }
  v14 = objc_alloc(MEMORY[0x24BDBCEF0]);
  -[NSMutableDictionary allKeys](self->_detectors, "allKeys");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v14, "initWithArray:", v15);

  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v17 = v9;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v41;
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v41 != v20)
          objc_enumerationMutation(v17);
        v22 = -[AXSDDetectorStore _addDetectorForAXAsset:](self, "_addDetectorForAXAsset:", *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * v21++));
      }
      while (v19 != v21);
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
    }
    while (v19);
  }

  v23 = objc_alloc(MEMORY[0x24BDBCEF0]);
  -[NSMutableDictionary allKeys](self->_detectors, "allKeys");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)objc_msgSend(v23, "initWithArray:", v24);

  -[AXSDDetectorStore detectors](self, "detectors");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "allValues");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXSDDetectorStore _notifyObserversDidFinishRefreshingDetectors:wasSuccessful:error:](self, "_notifyObserversDidFinishRefreshingDetectors:wasSuccessful:error:", v27, v7, v10);

  objc_msgSend(MEMORY[0x24BDFF278], "sharedInstance");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v26) = objc_msgSend(v28, "ultronSupportEnabled");

  if ((_DWORD)v26)
  {
    objc_msgSend(v25, "minusSet:", v16);
    if (objc_msgSend(v25, "count"))
    {
      -[AXSDDetectorStore detectors](self, "detectors");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "allValues");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v38[0] = MEMORY[0x24BDAC760];
      v38[1] = 3221225472;
      v38[2] = __80__AXSDDetectorStore_assetManager_didFinishRefreshingAssets_wasSuccessful_error___block_invoke;
      v38[3] = &unk_24DDF6948;
      v39 = v25;
      objc_msgSend(v30, "ax_filteredArrayUsingBlock:", v38);
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      -[AXSDDetectorStore _notifyObserversAvailableDetectorsDidUpdate:](self, "_notifyObserversAvailableDetectorsDidUpdate:", v31);
    }
    -[AXSDDetectorStore _detectorsNeedingUpgrade](self, "_detectorsNeedingUpgrade");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "objectForKey:", CFSTR("new"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXSDDetectorStore _downloadAssetsFromDetectors:](self, "_downloadAssetsFromDetectors:", v33);

    objc_msgSend(v32, "objectForKey:", CFSTR("old"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "objectForKey:", CFSTR("new"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXSDDetectorStore _notifyObserversDetectorsNeedUpdate:toDetectors:](self, "_notifyObserversDetectorsNeedUpdate:toDetectors:", v34, v35);

    -[AXSDDetectorStore installedDetectors](self, "installedDetectors");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "ax_filteredArrayUsingBlock:", &__block_literal_global_43);
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    -[AXSDDetectorStore _purgeAssetsFromDetectors:](self, "_purgeAssetsFromDetectors:", v37);
    if (-[AXSDDetectorStore areDetectorsReady](self, "areDetectorsReady"))
      -[AXSDDetectorStore _notifyObserversDetectorsAreReady](self, "_notifyObserversDetectorsAreReady");

  }
}

uint64_t __80__AXSDDetectorStore_assetManager_didFinishRefreshingAssets_wasSuccessful_error___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "model");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "assetId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "containsObject:", v4);

  return v5;
}

uint64_t __80__AXSDDetectorStore_assetManager_didFinishRefreshingAssets_wasSuccessful_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  if ((objc_msgSend(v2, "isCustom") & 1) != 0)
    v3 = 0;
  else
    v3 = objc_msgSend(v2, "isCompatiable") ^ 1;

  return v3;
}

- (void)assetManager:(id)a3 totalSizeExpected:(int64_t)a4 downloadProgressTotalWritten:(int64_t)a5 remainingTimeExpected:(double)a6 isStalled:(BOOL)a7
{
  _BOOL8 v7;
  NSObject *v12;
  id v13;
  int v14;
  id v15;
  __int16 v16;
  int64_t v17;
  __int16 v18;
  int64_t v19;
  __int16 v20;
  _BOOL4 v21;
  uint64_t v22;

  v7 = a7;
  v22 = *MEMORY[0x24BDAC8D0];
  AXLogUltron();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    v14 = 138413058;
    v15 = (id)objc_opt_class();
    v16 = 2048;
    v17 = a5;
    v18 = 2048;
    v19 = a4;
    v20 = 1024;
    v21 = v7;
    v13 = v15;
    _os_log_debug_impl(&dword_21ACD4000, v12, OS_LOG_TYPE_DEBUG, "[%@]: - download progress total written: %lld, totalExpected: %lld, isStalled: %d", (uint8_t *)&v14, 0x26u);

  }
  -[AXSDDetectorStore _notifyObserversDetectorsDownloadProgress:totalSizeExpected:remainingTimeExpected:isStalled:](self, "_notifyObserversDetectorsDownloadProgress:totalSizeExpected:remainingTimeExpected:isStalled:", a5, a4, v7, a6);
}

- (void)assetManager:(id)a3 didFinishPurgingAssets:(id)a4 wasSuccessful:(BOOL)a5 error:(id)a6
{
  _BOOL8 v7;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  AXSDDetector *v19;
  AXSDDetector *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t v29[128];
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  id v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  id v37;
  uint64_t v38;

  v7 = a5;
  v38 = *MEMORY[0x24BDAC8D0];
  v9 = a4;
  v10 = a6;
  AXLogUltron();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v21 = (void *)objc_opt_class();
    v22 = (void *)MEMORY[0x24BDD16E0];
    v23 = v21;
    objc_msgSend(v22, "numberWithBool:", v7);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v31 = v21;
    v32 = 2112;
    v33 = v9;
    v34 = 2112;
    v35 = v24;
    v36 = 2112;
    v37 = v10;
    _os_log_debug_impl(&dword_21ACD4000, v11, OS_LOG_TYPE_DEBUG, "[%@]: - did finish purging assets: %@, was successful: %@, error: %@", buf, 0x2Au);

  }
  v12 = (void *)objc_opt_new();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v13 = v9;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v26;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v26 != v16)
          objc_enumerationMutation(v13);
        v18 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v17);
        v19 = [AXSDDetector alloc];
        v20 = -[AXSDDetector initWithModel:](v19, "initWithModel:", v18, (_QWORD)v25);
        objc_msgSend(v12, "addObject:", v20);

        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v15);
  }

  -[AXSDDetectorStore _notifyObserversDidFinishPurgingDetectors:wasSuccessful:error:](self, "_notifyObserversDidFinishPurgingDetectors:wasSuccessful:error:", v12, v7, v10);
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[AXSDDetectorStore detectors](self, "detectors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("[%@]: Number of Detectors: %lu"), v4, objc_msgSend(v5, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (NSMutableDictionary)detectors
{
  return self->_detectors;
}

- (void)setDetectors:(id)a3
{
  objc_storeStrong((id *)&self->_detectors, a3);
}

- (NSMutableArray)purgedDetectors
{
  return self->_purgedDetectors;
}

- (void)setPurgedDetectors:(id)a3
{
  objc_storeStrong((id *)&self->_purgedDetectors, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_purgedDetectors, 0);
  objc_storeStrong((id *)&self->_detectors, 0);
  objc_storeStrong((id *)&self->_assetManager, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

- (void)addObserver:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21ACD4000, a2, a3, "AXSDDetectorStore add observer: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)removeObserver:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21ACD4000, a2, a3, "AXSDDetectorStore remove observer: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)detectorWithIdentifier:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_21ACD4000, a2, OS_LOG_TYPE_ERROR, "Trying to retrieve a detector with an invalid identifier. Identifier: %@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_2();
}

@end
