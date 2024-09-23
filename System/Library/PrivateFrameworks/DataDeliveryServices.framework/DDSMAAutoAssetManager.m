@implementation DDSMAAutoAssetManager

- (id)assetsForQuery:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  int v13;
  int v15;
  id v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  _BOOL4 v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[DDSMAAutoAssetManager assetQueryResultsCache](self, "assetQueryResultsCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cachedAssetsForQuery:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = v6;
  }
  else if ((objc_msgSend(v4, "cachedOnly") & 1) != 0)
  {
    v7 = (id)MEMORY[0x1E0C9AA60];
  }
  else
  {
    -[DDSMAAutoAssetManager assetsAvailableOnDeviceForQuery:](self, "assetsAvailableOnDeviceForQuery:", v4);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[DDSMAAutoAssetManager assetQueryResultsCache](self, "assetQueryResultsCache");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "cacheAssets:forQuery:", v7, v4);

    QueryLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      +[DDSAsset debuggingIDsForAssets:](DDSAsset, "debuggingIDsForAssets:", v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138544130;
      v16 = v4;
      v17 = 2114;
      v18 = v10;
      v19 = 1024;
      v20 = 0;
      v21 = 1024;
      v22 = objc_msgSend(v4, "cachedOnly");
      _os_log_impl(&dword_1DA990000, v9, OS_LOG_TYPE_DEFAULT, "Updated cache for query: %{public}@ assets: %{public}@ was cached: %d, cachedOnly: %d", (uint8_t *)&v15, 0x22u);

    }
  }
  QueryLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    +[DDSAsset debuggingIDsForAssets:](DDSAsset, "debuggingIDsForAssets:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v4, "cachedOnly");
    v15 = 138544130;
    v16 = v4;
    v17 = 2114;
    v18 = v12;
    v19 = 1024;
    v20 = v6 != 0;
    v21 = 1024;
    v22 = v13;
    _os_log_impl(&dword_1DA990000, v11, OS_LOG_TYPE_DEFAULT, "assetsForQuery: %{public}@ final result: %{public}@ was cached: %d, cachedOnly: %d", (uint8_t *)&v15, 0x22u);

  }
  return v7;
}

- (DDSAssetQueryResultCache)assetQueryResultsCache
{
  return self->_assetQueryResultsCache;
}

- (DDSMAAutoAssetManager)init
{
  DDSMAAutoAssetProvider *v3;
  DDSMAAutoAssetManagerDataSource *v4;
  DDSMAAutoAssetManager *v5;

  v3 = objc_alloc_init(DDSMAAutoAssetProvider);
  v4 = objc_alloc_init(DDSMAAutoAssetManagerDataSource);
  v5 = -[DDSMAAutoAssetManager initWithProvider:dataSource:](self, "initWithProvider:dataSource:", v3, v4);

  return v5;
}

- (DDSMAAutoAssetManager)initWithProvider:(id)a3 dataSource:(id)a4
{
  id v7;
  id v8;
  DDSMAAutoAssetManager *v9;
  DDSMAAutoAssetManager *v10;
  DDSAssetQueryResultCache *v11;
  DDSAssetQueryResultCache *assetQueryResultsCache;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)DDSMAAutoAssetManager;
  v9 = -[DDSMAAutoAssetManager init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_provider, a3);
    objc_storeStrong((id *)&v10->_dataSource, a4);
    v11 = objc_alloc_init(DDSAssetQueryResultCache);
    assetQueryResultsCache = v10->_assetQueryResultsCache;
    v10->_assetQueryResultsCache = v11;

  }
  return v10;
}

+ (BOOL)isAutoAssetType:(id)a3
{
  return objc_msgSend(a3, "isEqualToString:", CFSTR("com.apple.MobileAsset.LinguisticDataAuto"));
}

- (id)autoAssetTypeForAsserType:(id)a3
{
  id v4;
  void *v5;
  char v6;
  __CFString *v7;
  NSObject *v8;
  uint8_t v10[16];

  v4 = a3;
  -[DDSMAAutoAssetManager dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "shouldDownloadAutoAsset");

  if ((v6 & 1) == 0)
  {
    AutoAssetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_1DA990000, v8, OS_LOG_TYPE_DEFAULT, "AutoAsset support is disabled", v10, 2u);
    }

    goto LABEL_7;
  }
  if (!objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.MobileAsset.LinguisticData")))
  {
LABEL_7:
    v7 = 0;
    goto LABEL_8;
  }
  v7 = CFSTR("com.apple.MobileAsset.LinguisticDataAuto");
LABEL_8:

  return v7;
}

- (id)autoAssetSelectorsForQuery:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint8_t v12[16];

  v4 = a3;
  -[DDSMAAutoAssetManager dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "shouldDownloadAutoAsset");

  if ((v6 & 1) != 0)
  {
    -[DDSMAAutoAssetManager dataSource](self, "dataSource");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "supportedAutoAssetSpecifiers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[DDSMAAutoAssetSelector createWithQuery:supportedAssetSpecifiers:](DDSMAAutoAssetSelector, "createWithQuery:supportedAssetSpecifiers:", v4, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    AutoAssetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_1DA990000, v10, OS_LOG_TYPE_DEFAULT, "AutoAsset support is disabled", v12, 2u);
    }

    v9 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v9;
}

- (id)autoAssetsForQuery:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t v23[128];
  uint8_t buf[4];
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DDSMAAutoAssetManager autoAssetSelectorsForQuery:](self, "autoAssetSelectorsForQuery:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v7 = v6;
    v8 = -[NSObject countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v8)
    {
      v9 = v8;
      v17 = v6;
      v18 = v4;
      v10 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v20 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
          -[DDSMAAutoAssetManager provider](self, "provider", v17, v18);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "autoAssetForAssetSelector:", v12);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (v14)
          {
            objc_msgSend(v5, "addObject:", v14);
          }
          else
          {
            AutoAssetLog();
            v15 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              v25 = v12;
              _os_log_impl(&dword_1DA990000, v15, OS_LOG_TYPE_DEFAULT, "Auto asset object cannot be created for asset selector: %{public}@", buf, 0xCu);
            }

          }
        }
        v9 = -[NSObject countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v9);
      v6 = v17;
      v4 = v18;
    }
  }
  else
  {
    AutoAssetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v25 = v4;
      _os_log_impl(&dword_1DA990000, v7, OS_LOG_TYPE_DEFAULT, "Auto asset is not supported for query: %{public}@", buf, 0xCu);
    }
  }

  return v5;
}

- (void)registerInterestInContentForQuery:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  id obj;
  _QWORD v14[6];
  __CFString *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t v20[128];
  uint8_t buf[4];
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  AutoAssetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v22 = v4;
    _os_log_impl(&dword_1DA990000, v5, OS_LOG_TYPE_DEFAULT, "Register interest in auto assets for query: %{public}@", buf, 0xCu);
  }

  -[DDSMAAutoAssetManager autoAssetsForQuery:](self, "autoAssetsForQuery:", v4);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    v9 = MEMORY[0x1E0C809B0];
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(obj);
        v11 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        -[DDSMAAutoAssetManager provider](self, "provider");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v14[0] = v9;
        v14[1] = 3221225472;
        v14[2] = __59__DDSMAAutoAssetManager_registerInterestInContentForQuery___block_invoke;
        v14[3] = &unk_1EA141F00;
        v14[4] = v11;
        v14[5] = self;
        v15 = CFSTR("dds-add-assertion-lock");
        objc_msgSend(v12, "interestInContentForAutoAsset:completion:", v11, v14);

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }

}

void __59__DDSMAAutoAssetManager_registerInterestInContentForQuery___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  __int128 v8;
  id v9;
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (!a2)
  {
    AutoAssetLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "assetSelector");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v11 = v4;
      _os_log_impl(&dword_1DA990000, v3, OS_LOG_TYPE_DEFAULT, "Interest in auto asset: %{public}@ submitted, now lock the auto asset to download the content", buf, 0xCu);

    }
    objc_msgSend(*(id *)(a1 + 40), "provider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(void **)(a1 + 48);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __59__DDSMAAutoAssetManager_registerInterestInContentForQuery___block_invoke_7;
    v7[3] = &unk_1EA141ED8;
    v8 = *(_OWORD *)(a1 + 32);
    v9 = v6;
    objc_msgSend(v5, "lockAutoAsset:forReason:withTimeout:completion:", (_QWORD)v8, v9, -1, v7);

  }
}

void __59__DDSMAAutoAssetManager_registerInterestInContentForQuery___block_invoke_7(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  AutoAssetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v7)
    {
      objc_msgSend(*(id *)(a1 + 32), "assetSelector");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543362;
      v11 = v8;
      _os_log_impl(&dword_1DA990000, v6, OS_LOG_TYPE_DEFAULT, "Auto asset content is downloaded now unlock the auto asset: %{public}@", (uint8_t *)&v10, 0xCu);

    }
    objc_msgSend(*(id *)(a1 + 40), "provider");
    v6 = objc_claimAutoreleasedReturnValue();
    -[NSObject unlockAutoAsset:forReason:](v6, "unlockAutoAsset:forReason:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
  }
  else if (v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "assetSelector");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543618;
    v11 = v9;
    v12 = 2114;
    v13 = v5;
    _os_log_impl(&dword_1DA990000, v6, OS_LOG_TYPE_DEFAULT, "Auto asset lock failed for asset: %{public}@ with error: %{public}@", (uint8_t *)&v10, 0x16u);

  }
}

- (void)unregisterInterestInContentForAssetSelector:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  AutoAssetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138543362;
    v9 = v4;
    _os_log_impl(&dword_1DA990000, v5, OS_LOG_TYPE_DEFAULT, "Eliminate interest in content for asset selector: %{public}@", (uint8_t *)&v8, 0xCu);
  }

  -[DDSMAAutoAssetManager provider](self, "provider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assetSelector");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "eliminateInterestForAutoAsset:", v7);

}

- (void)lockAssetsForQuery:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  id obj;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  id v25;
  __int16 v26;
  id v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  AutoAssetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v25 = v4;
    _os_log_impl(&dword_1DA990000, v5, OS_LOG_TYPE_DEFAULT, "Locking auto asset for query: %{public}@", buf, 0xCu);
  }

  -[DDSMAAutoAssetManager autoAssetsForQuery:](self, "autoAssetsForQuery:", v4);
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v21 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        -[DDSMAAutoAssetManager provider](self, "provider");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = 0;
        objc_msgSend(v11, "lockAutoAssetSync:forReason:error:", v10, CFSTR("dds-periodic-update-lock"), &v19);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v19;

        AutoAssetLog();
        v14 = objc_claimAutoreleasedReturnValue();
        v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
        if (v12)
        {
          if (v15)
          {
            objc_msgSend(v10, "assetSelector");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v25 = v16;
            _os_log_impl(&dword_1DA990000, v14, OS_LOG_TYPE_DEFAULT, "Unlocking auto asset: %{public}@", buf, 0xCu);

          }
          -[DDSMAAutoAssetManager provider](self, "provider");
          v14 = objc_claimAutoreleasedReturnValue();
          -[NSObject unlockAutoAsset:forReason:](v14, "unlockAutoAsset:forReason:", v10, CFSTR("dds-periodic-update-lock"));
        }
        else if (v15)
        {
          objc_msgSend(v10, "assetSelector");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v25 = v17;
          v26 = 2114;
          v27 = v13;
          _os_log_impl(&dword_1DA990000, v14, OS_LOG_TYPE_DEFAULT, "Failed to lock the auto asset: %{public}@, with error: %{public}@", buf, 0x16u);

        }
      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    }
    while (v7);
  }

}

- (id)assetsAvailableOnDeviceForQuery:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v19;
  id v20;
  id obj;
  uint64_t v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  uint64_t v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v19 = a3;
  v20 = (id)objc_opt_new();
  -[DDSMAAutoAssetManager autoAssetsForQuery:](self, "autoAssetsForQuery:", v19);
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
  if (v4)
  {
    v5 = v4;
    v22 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v25 != v22)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        -[DDSMAAutoAssetManager provider](self, "provider");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = 0;
        objc_msgSend(v8, "lockAutoAssetSync:forReason:error:", v7, CFSTR("dds-asset-for-query"), &v23);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v23;

        if (v9)
        {
          v11 = objc_msgSend(v9, "compatibilityVersion");
          -[DDSMAAutoAssetManager dataSource](self, "dataSource");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "linguisticAssetCompatabilityVersion");

          if (v11 == v13)
          {
            objc_msgSend(v20, "addObject:", v9);
            -[DDSMAAutoAssetManager provider](self, "provider");
            v14 = objc_claimAutoreleasedReturnValue();
            -[NSObject unlockAutoAsset:forReason:](v14, "unlockAutoAsset:forReason:", v7, CFSTR("dds-asset-for-query"));
          }
          else
          {
            AutoAssetLog();
            v14 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v7, "assetSelector");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v17 = objc_msgSend(v9, "contentVersion");
              *(_DWORD *)buf = 138543618;
              v29 = v16;
              v30 = 2048;
              v31 = v17;
              _os_log_impl(&dword_1DA990000, v14, OS_LOG_TYPE_DEFAULT, "Skip auto asset: %{public}@ with content version: %lu due to mismatch in compatibility version", buf, 0x16u);

            }
          }
        }
        else
        {
          AutoAssetLog();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v7, "assetSelector");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v29 = v15;
            v30 = 2114;
            v31 = (uint64_t)v10;
            _os_log_impl(&dword_1DA990000, v14, OS_LOG_TYPE_DEFAULT, "Failed to lock the auto asset: %{public}@, with error: %{public}@", buf, 0x16u);

          }
        }

      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    }
    while (v5);
  }

  return v20;
}

- (void)serverDidUpdateAssetsWithType:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  AutoAssetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v4;
    _os_log_impl(&dword_1DA990000, v5, OS_LOG_TYPE_DEFAULT, "Updated the assets for asset type: %@", (uint8_t *)&v7, 0xCu);
  }

  -[DDSMAAutoAssetManager assetQueryResultsCache](self, "assetQueryResultsCache");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "clearCacheForAssetType:", v4);

}

- (void)fetchAssetUpdateStatusForQuery:(id)a3 callback:(id)a4
{
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  id obj;
  id v15;
  _QWORD v16[5];
  id v17;
  __int128 *p_buf;
  _QWORD *v19;
  _QWORD *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _QWORD v25[3];
  char v26;
  _QWORD v27[3];
  char v28;
  uint8_t v29[128];
  __int128 buf;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v15 = a4;
  AutoAssetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v11;
    _os_log_impl(&dword_1DA990000, v5, OS_LOG_TYPE_DEFAULT, "Fetch asset update status for query: %{public}@", (uint8_t *)&buf, 0xCu);
  }

  -[DDSMAAutoAssetManager autoAssetsForQuery:](self, "autoAssetsForQuery:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "count"))
  {
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v31 = 0x2020000000;
    v32 = 0;
    v32 = objc_msgSend(v12, "count");
    v27[0] = 0;
    v27[1] = v27;
    v27[2] = 0x2020000000;
    v28 = 0;
    v25[0] = 0;
    v25[1] = v25;
    v25[2] = 0x2020000000;
    v26 = 1;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    obj = v12;
    v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v22;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v22 != v7)
            objc_enumerationMutation(obj);
          v9 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v8);
          -[DDSMAAutoAssetManager provider](self, "provider", v11);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v16[0] = MEMORY[0x1E0C809B0];
          v16[1] = 3221225472;
          v16[2] = __65__DDSMAAutoAssetManager_fetchAssetUpdateStatusForQuery_callback___block_invoke;
          v16[3] = &unk_1EA141F28;
          p_buf = &buf;
          v19 = v27;
          v16[4] = v9;
          v20 = v25;
          v17 = v15;
          objc_msgSend(v10, "fetchUpdateStatusForAutoAsset:completion:", v9, v16);

          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
      }
      while (v6);
    }

    _Block_object_dispose(v25, 8);
    _Block_object_dispose(v27, 8);
    _Block_object_dispose(&buf, 8);
  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD))v15 + 2))(v15, 0, 0);
  }

}

void __65__DDSMAAutoAssetManager_fetchAssetUpdateStatusForQuery_callback___block_invoke(_QWORD *a1, char a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  char v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;

  v5 = a3;
  v6 = v5;
  --*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24);
  v7 = *(_QWORD *)(a1[7] + 8);
  if (*(_BYTE *)(v7 + 24))
    v8 = 1;
  else
    v8 = a2;
  *(_BYTE *)(v7 + 24) = v8;
  if (v5 && objc_msgSend(v5, "code") != 6201)
  {
    AutoAssetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __65__DDSMAAutoAssetManager_fetchAssetUpdateStatusForQuery_callback___block_invoke_cold_1((uint64_t)a1, (uint64_t)v6, v9);

    *(_BYTE *)(*(_QWORD *)(a1[8] + 8) + 24) = 0;
  }
  if (!*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24))
  {
    if (*(_BYTE *)(*(_QWORD *)(a1[8] + 8) + 24))
    {
      (*(void (**)(void))(a1[5] + 16))();
    }
    else
    {
      v10 = a1[5];
      DDSAssetDownloadUIError((void *)4);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v10 + 16))(v10, 0, v11);

    }
  }

}

- (void)updateAssetForQuery:(id)a3 callback:(id)a4
{
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  id obj;
  id v15;
  _QWORD v16[6];
  __CFString *v17;
  id v18;
  _QWORD *v19;
  __int128 *p_buf;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _QWORD v25[3];
  uint64_t v26;
  uint8_t v27[128];
  __int128 buf;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v15 = a4;
  AutoAssetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v12;
    _os_log_impl(&dword_1DA990000, v6, OS_LOG_TYPE_DEFAULT, "Update auto asset for query: %{public}@", (uint8_t *)&buf, 0xCu);
  }

  -[DDSMAAutoAssetManager autoAssetsForQuery:](self, "autoAssetsForQuery:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "count"))
  {
    v25[0] = 0;
    v25[1] = v25;
    v25[2] = 0x2020000000;
    v26 = 0;
    v26 = objc_msgSend(v13, "count");
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v29 = 0x3032000000;
    v30 = __Block_byref_object_copy__6;
    v31 = __Block_byref_object_dispose__6;
    v32 = (id)MEMORY[0x1E0C9AAB0];
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    obj = v13;
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v22;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v22 != v8)
            objc_enumerationMutation(obj);
          v10 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v9);
          -[DDSMAAutoAssetManager provider](self, "provider", v12);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v16[0] = MEMORY[0x1E0C809B0];
          v16[1] = 3221225472;
          v16[2] = __54__DDSMAAutoAssetManager_updateAssetForQuery_callback___block_invoke;
          v16[3] = &unk_1EA141F50;
          v16[4] = v10;
          v16[5] = self;
          v19 = v25;
          p_buf = &buf;
          v17 = CFSTR("dds-asset-download-ui-lock");
          v18 = v15;
          objc_msgSend(v11, "updateAutoAsset:forReason:completion:", v10, CFSTR("dds-asset-download-ui-lock"), v16);

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
      }
      while (v7);
    }

    _Block_object_dispose(&buf, 8);
    _Block_object_dispose(v25, 8);
  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD))v15 + 2))(v15, MEMORY[0x1E0C9AAB0], 0);
  }

}

void __54__DDSMAAutoAssetManager_updateAssetForQuery_callback___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  int v14;
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  --*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
  AutoAssetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v8)
    {
      objc_msgSend(*(id *)(a1 + 32), "assetSelector");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543362;
      v15 = v9;
      _os_log_impl(&dword_1DA990000, v7, OS_LOG_TYPE_DEFAULT, "Auto asset content is updated, now unlock the auto asset: %{public}@", (uint8_t *)&v14, 0xCu);

    }
    objc_msgSend(*(id *)(a1 + 40), "provider");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "unlockAutoAsset:forReason:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
    goto LABEL_5;
  }
  if (v8)
  {
    objc_msgSend(*(id *)(a1 + 32), "assetSelector");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543618;
    v15 = v12;
    v16 = 2114;
    v17 = v6;
    _os_log_impl(&dword_1DA990000, v7, OS_LOG_TYPE_DEFAULT, "Auto asset lock failed for asset: %{public}@ with error: %{public}@", (uint8_t *)&v14, 0x16u);

  }
  if (v6 && objc_msgSend(v6, "code") != 6201)
  {
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v10 = *(void **)(v13 + 40);
    *(_QWORD *)(v13 + 40) = MEMORY[0x1E0C9AAA0];
LABEL_5:

  }
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
  {
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40))
    {
      v11 = 0;
    }
    else
    {
      DDSAssetDownloadUIError((void *)2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

  }
}

- (DDSMAAutoAssetProvider)provider
{
  return self->_provider;
}

- (DDSMAAutoAssetManagerDataSource)dataSource
{
  return self->_dataSource;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetQueryResultsCache, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_provider, 0);
}

void __65__DDSMAAutoAssetManager_fetchAssetUpdateStatusForQuery_callback___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "assetSelector");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138543618;
  v7 = v5;
  v8 = 2114;
  v9 = a2;
  _os_log_error_impl(&dword_1DA990000, a3, OS_LOG_TYPE_ERROR, "Fetch auto asset update status failed for asset: %{public}@ with error: %{public}@", (uint8_t *)&v6, 0x16u);

}

@end
