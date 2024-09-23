@implementation ACHMobileAssetProvider

- (ACHMobileAssetProvider)initWithMobileAssetDownloadManager:(id)a3
{
  id v5;
  ACHMobileAssetProvider *v6;
  ACHMobileAssetProvider *v7;
  id v8;
  uint64_t v9;
  NSUserDefaults *nanoUserDefaults;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ACHMobileAssetProvider;
  v6 = -[ACHMobileAssetProvider init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_mobileAssetDownloadManager, a3);
    v8 = objc_alloc(MEMORY[0x24BDBCF50]);
    v9 = objc_msgSend(v8, "initWithSuiteName:", *MEMORY[0x24BE01538]);
    nanoUserDefaults = v7->_nanoUserDefaults;
    v7->_nanoUserDefaults = (NSUserDefaults *)v9;

    v7->_downloadDelayOverride = -1.0;
  }

  return v7;
}

- (ACHMobileAssetProvider)init
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  ACHMobileAssetProvider *v7;

  v3 = objc_alloc(MEMORY[0x24BDD4228]);
  v4 = *MEMORY[0x24BE01938];
  HKCreateSerialDispatchQueue();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithMobileAssetTypeName:queue:", v4, v5);

  objc_msgSend(v6, "setShouldAutoDownloadRemoteAssets:", 0);
  objc_msgSend(v6, "setMobileAssetDownloadCompletionHandler:", &__block_literal_global_1);
  objc_msgSend(v6, "setErrorHandler:", &__block_literal_global_189);
  v7 = -[ACHMobileAssetProvider initWithMobileAssetDownloadManager:](self, "initWithMobileAssetDownloadManager:", v6);

  return v7;
}

void __30__ACHMobileAssetProvider_init__block_invoke()
{
  NSObject *v0;

  ACHLogAssets();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __30__ACHMobileAssetProvider_init__block_invoke_cold_1(v0);

}

void __30__ACHMobileAssetProvider_init__block_invoke_187(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  ACHLogAssets();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __30__ACHMobileAssetProvider_init__block_invoke_187_cold_1();

}

- (void)availableAssetsWithCompletion:(id)a3
{
  -[ACHMobileAssetProvider _fetchLocalAssetsWithCompletion:](self, "_fetchLocalAssetsWithCompletion:", a3);
  -[ACHMobileAssetProvider _downloadRemoteCatalogAndAssets](self, "_downloadRemoteCatalogAndAssets");
}

- (int64_t)downloadedAssetDiskUsageInBytes
{
  void *v3;
  dispatch_semaphore_t v4;
  void *v5;
  NSObject *v6;
  int64_t v7;
  _QWORD v9[5];
  NSObject *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  -[ACHMobileAssetProvider _compatibilityVersionQueryParameters](self, "_compatibilityVersionQueryParameters");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = dispatch_semaphore_create(0);
  -[ACHMobileAssetProvider mobileAssetDownloadManager](self, "mobileAssetDownloadManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __57__ACHMobileAssetProvider_downloadedAssetDiskUsageInBytes__block_invoke;
  v9[3] = &unk_24D13A5E8;
  v9[4] = self;
  v11 = &v12;
  v6 = v4;
  v10 = v6;
  objc_msgSend(v5, "fetchAssetsWithQueryParams:onlyLocal:completion:", v3, 1, v9);

  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  v7 = v13[3];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __57__ACHMobileAssetProvider_downloadedAssetDiskUsageInBytes__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  void *v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    ACHLogAssets();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __57__ACHMobileAssetProvider_downloadedAssetDiskUsageInBytes__block_invoke_cold_1();

  }
  v20 = v6;
  ACHLogAssets();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v26 = objc_msgSend(v5, "count");
    _os_log_impl(&dword_21407B000, v8, OS_LOG_TYPE_DEFAULT, "Query returned %lu local assets for CacheDelete disk usage reporting", buf, 0xCu);
  }

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v9 = v5;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v22;
    v13 = *MEMORY[0x24BE66AB8];
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v22 != v12)
          objc_enumerationMutation(v9);
        v15 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        if (objc_msgSend(*(id *)(a1 + 32), "_assetIsInstalled:", v15))
        {
          objc_msgSend(v15, "attributes");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "objectForKeyedSubscript:", v13);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "longLongValue");

          ACHLogAssets();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134218242;
            v26 = v18;
            v27 = 2112;
            v28 = v15;
            _os_log_impl(&dword_21407B000, v19, OS_LOG_TYPE_DEFAULT, "Adding %ld bytes disk usage reporting for asset %@", buf, 0x16u);
          }

          *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) += v18;
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    }
    while (v11);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (int64_t)purgeAllDownloadedAssets
{
  void *v3;
  dispatch_semaphore_t v4;
  void *v5;
  NSObject *v6;
  int64_t v7;
  _QWORD v9[5];
  NSObject *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  -[ACHMobileAssetProvider _compatibilityVersionQueryParameters](self, "_compatibilityVersionQueryParameters");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = dispatch_semaphore_create(0);
  -[ACHMobileAssetProvider mobileAssetDownloadManager](self, "mobileAssetDownloadManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __50__ACHMobileAssetProvider_purgeAllDownloadedAssets__block_invoke;
  v9[3] = &unk_24D13A5E8;
  v9[4] = self;
  v11 = &v12;
  v6 = v4;
  v10 = v6;
  objc_msgSend(v5, "fetchAssetsWithQueryParams:onlyLocal:completion:", v3, 1, v9);

  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  v7 = v13[3];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __50__ACHMobileAssetProvider_purgeAllDownloadedAssets__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  uint64_t v29;
  __int16 v30;
  uint64_t v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    ACHLogAssets();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __50__ACHMobileAssetProvider_purgeAllDownloadedAssets__block_invoke_cold_1();

  }
  ACHLogAssets();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v29 = objc_msgSend(v5, "count");
    _os_log_impl(&dword_21407B000, v8, OS_LOG_TYPE_DEFAULT, "Query returned %lu local assets for CacheDelete purging", buf, 0xCu);
  }
  v21 = v6;

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v9 = v5;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v25;
    v13 = *MEMORY[0x24BE66AB8];
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v25 != v12)
          objc_enumerationMutation(v9);
        v15 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        if (objc_msgSend(*(id *)(a1 + 32), "_assetIsInstalled:", v15))
        {
          objc_msgSend(v15, "attributes");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "objectForKeyedSubscript:", v13);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "longLongValue");

          ACHLogAssets();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v29 = (uint64_t)v15;
            v30 = 2048;
            v31 = v18;
            _os_log_impl(&dword_21407B000, v19, OS_LOG_TYPE_DEFAULT, "Purging asset (%@) to reclaim %ld bytes of disk usage.", buf, 0x16u);
          }

          *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) += v18;
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    }
    while (v11);
  }

  objc_msgSend(*(id *)(a1 + 32), "mobileAssetDownloadManager");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __50__ACHMobileAssetProvider_purgeAllDownloadedAssets__block_invoke_191;
  v22[3] = &unk_24D13A610;
  v23 = *(id *)(a1 + 40);
  objc_msgSend(v20, "removeMobileAssets:completion:", v9, v22);

}

void __50__ACHMobileAssetProvider_purgeAllDownloadedAssets__block_invoke_191(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint8_t v8[16];

  v5 = a3;
  ACHLogAssets();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if ((a2 & 1) != 0)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_21407B000, v7, OS_LOG_TYPE_DEFAULT, "Successfully purged assets for CacheDelete", v8, 2u);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    __50__ACHMobileAssetProvider_purgeAllDownloadedAssets__block_invoke_191_cold_1();
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (BOOL)_assetIsInstalled:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  v4 = objc_msgSend(v3, "state") == 2 || objc_msgSend(v3, "state") == 3 || objc_msgSend(v3, "state") == 4;

  return v4;
}

- (void)_downloadRemoteCatalogAndAssets
{
  double v3;
  dispatch_time_t v4;
  NSObject *v5;
  _QWORD block[5];

  -[ACHMobileAssetProvider _downloadDelay](self, "_downloadDelay");
  v4 = dispatch_time(0, (uint64_t)(v3 * 1000000000.0));
  dispatch_get_global_queue(21, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __57__ACHMobileAssetProvider__downloadRemoteCatalogAndAssets__block_invoke;
  block[3] = &unk_24D13A338;
  block[4] = self;
  dispatch_after(v4, v5, block);

}

uint64_t __57__ACHMobileAssetProvider__downloadRemoteCatalogAndAssets__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "downloadRemoteCatalog");
}

- (double)_downloadDelay
{
  uint32_t v3;
  void *v4;
  double v5;
  double downloadDelayOverride;
  NSObject *v7;

  v3 = arc4random_uniform(0xE10u);
  -[NSUserDefaults objectForKey:](self->_nanoUserDefaults, "objectForKey:", CFSTR("MobileAssetDownloadDelayOverride"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[NSUserDefaults doubleForKey:](self->_nanoUserDefaults, "doubleForKey:", CFSTR("MobileAssetDownloadDelayOverride"));
    downloadDelayOverride = v5;
  }
  else if (self->_downloadDelayOverride >= 0.0)
  {
    downloadDelayOverride = self->_downloadDelayOverride;
  }
  else
  {
    downloadDelayOverride = (double)(v3 + 1);
  }
  ACHLogAssets();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[ACHMobileAssetProvider _downloadDelay].cold.1(v7, downloadDelayOverride);

  return downloadDelayOverride;
}

- (void)_fetchLocalAssetsWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  -[ACHMobileAssetProvider _compatibilityVersionQueryParameters](self, "_compatibilityVersionQueryParameters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHMobileAssetProvider mobileAssetDownloadManager](self, "mobileAssetDownloadManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __58__ACHMobileAssetProvider__fetchLocalAssetsWithCompletion___block_invoke;
  v8[3] = &unk_24D13A660;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v6, "fetchAssetsWithQueryParams:onlyLocal:completion:", v5, 1, v8);

}

void __58__ACHMobileAssetProvider__fetchLocalAssetsWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint8_t buf[4];
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    ACHLogAssets();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __58__ACHMobileAssetProvider__fetchLocalAssetsWithCompletion___block_invoke_cold_1();

  }
  ACHLogAssets();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v15 = objc_msgSend(v5, "count");
    _os_log_impl(&dword_21407B000, v8, OS_LOG_TYPE_DEFAULT, "Query returned %lu local assets", buf, 0xCu);
  }

  v9 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  if (objc_msgSend(v5, "count"))
    objc_msgSend(v9, "addObjectsFromArray:", v5);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __58__ACHMobileAssetProvider__fetchLocalAssetsWithCompletion___block_invoke_195;
  v11[3] = &unk_24D13A638;
  v10 = *(void **)(a1 + 40);
  v12 = *(id *)(a1 + 32);
  v13 = v10;
  objc_msgSend(v12, "_processAssets:completion:", v9, v11);

}

void __58__ACHMobileAssetProvider__fetchLocalAssetsWithCompletion___block_invoke_195(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  ACHLogAssets();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 134218496;
    v12 = objc_msgSend(v9, "count");
    v13 = 2048;
    v14 = objc_msgSend(v7, "count");
    v15 = 2048;
    v16 = objc_msgSend(v8, "count");
    _os_log_impl(&dword_21407B000, v10, OS_LOG_TYPE_DEFAULT, "%lu assets are installed, %lu assets are not downloaded, removing %lu old assets", (uint8_t *)&v11, 0x20u);
  }

  objc_msgSend(*(id *)(a1 + 32), "_removeAssets:", v8);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)downloadRemoteCatalog
{
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id location;

  -[ACHMobileAssetProvider _compatibilityVersionQueryParameters](self, "_compatibilityVersionQueryParameters");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  -[ACHMobileAssetProvider mobileAssetDownloadManager](self, "mobileAssetDownloadManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __47__ACHMobileAssetProvider_downloadRemoteCatalog__block_invoke;
  v5[3] = &unk_24D13A6B0;
  objc_copyWeak(&v6, &location);
  objc_msgSend(v4, "fetchAssetsWithQueryParams:onlyLocal:completion:", v3, 0, v5);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);

}

void __47__ACHMobileAssetProvider_downloadRemoteCatalog__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  id *v10;
  id WeakRetained;
  _QWORD v12[4];
  id v13;
  uint8_t buf[4];
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    ACHLogAssets();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __47__ACHMobileAssetProvider_downloadRemoteCatalog__block_invoke_cold_1();

  }
  ACHLogAssets();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v15 = objc_msgSend(v5, "count");
    _os_log_impl(&dword_21407B000, v8, OS_LOG_TYPE_DEFAULT, "Query returned %lu remote assets", buf, 0xCu);
  }

  v9 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  if (objc_msgSend(v5, "count"))
    objc_msgSend(v9, "addObjectsFromArray:", v5);
  v10 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __47__ACHMobileAssetProvider_downloadRemoteCatalog__block_invoke_197;
  v12[3] = &unk_24D13A688;
  objc_copyWeak(&v13, v10);
  objc_msgSend(WeakRetained, "_processAssets:completion:", v9, v12);

  objc_destroyWeak(&v13);
}

void __47__ACHMobileAssetProvider_downloadRemoteCatalog__block_invoke_197(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  id *v11;
  id WeakRetained;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  ACHLogAssets();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v21 = 134218496;
    v22 = objc_msgSend(v7, "count");
    v23 = 2048;
    v24 = objc_msgSend(v8, "count");
    v25 = 2048;
    v26 = objc_msgSend(v9, "count");
    _os_log_impl(&dword_21407B000, v10, OS_LOG_TYPE_DEFAULT, "Downloading %lu assets, removing %lu assets, %lu assets already installed", (uint8_t *)&v21, 0x20u);
  }

  v11 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained(v11);
  objc_msgSend(WeakRetained, "_removeAssets:", v8);

  if (objc_msgSend(v7, "count"))
  {
    v13 = objc_loadWeakRetained(v11);
    -[NSObject _downloadRemoteAssets:installedAssets:](v13, "_downloadRemoteAssets:installedAssets:", v7, v9);
  }
  else
  {
    ACHLogAssets();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      __47__ACHMobileAssetProvider_downloadRemoteCatalog__block_invoke_197_cold_1(v13, v14, v15, v16, v17, v18, v19, v20);
  }

}

- (void)_downloadRemoteAssets:(id)a3 installedAssets:(id)a4
{
  id v6;
  id v7;
  double v8;
  dispatch_time_t v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD block[5];
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  -[ACHMobileAssetProvider _downloadDelay](self, "_downloadDelay");
  v9 = dispatch_time(0, (uint64_t)(v8 * 1000000000.0));
  dispatch_get_global_queue(21, 0);
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __64__ACHMobileAssetProvider__downloadRemoteAssets_installedAssets___block_invoke;
  block[3] = &unk_24D13A700;
  block[4] = self;
  v14 = v6;
  v15 = v7;
  v11 = v7;
  v12 = v6;
  dispatch_after(v9, v10, block);

}

void __64__ACHMobileAssetProvider__downloadRemoteAssets_installedAssets___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  _QWORD v3[5];
  id v4;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __64__ACHMobileAssetProvider__downloadRemoteAssets_installedAssets___block_invoke_2;
  v3[3] = &unk_24D13A6D8;
  v3[4] = v1;
  v4 = *(id *)(a1 + 48);
  objc_msgSend(v1, "_downloadAssets:withCompletion:", v2, v3);

}

void __64__ACHMobileAssetProvider__downloadRemoteAssets_installedAssets___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void (**v8)(void);
  NSObject *v9;
  NSObject *v10;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "remoteDownloadCompleteCompletion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "remoteDownloadCompleteCompletion");
    v8 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v8[2]();

  }
  ACHLogAssets();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __64__ACHMobileAssetProvider__downloadRemoteAssets_installedAssets___block_invoke_2_cold_2();
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    __64__ACHMobileAssetProvider__downloadRemoteAssets_installedAssets___block_invoke_2_cold_1(a1, v5);
  }

}

- (void)_downloadAssets:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[4];
  id v18;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "count"))
  {
    -[ACHMobileAssetProvider mobileAssetDownloadManager](self, "mobileAssetDownloadManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __57__ACHMobileAssetProvider__downloadAssets_withCompletion___block_invoke;
    v17[3] = &unk_24D13A728;
    v18 = v7;
    objc_msgSend(v8, "downloadMobileAssets:completion:", v6, v17);

  }
  else
  {
    ACHLogAssets();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[ACHMobileAssetProvider _downloadAssets:withCompletion:].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);

    (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, MEMORY[0x24BDBD1A8], 0);
  }

}

void __57__ACHMobileAssetProvider__downloadAssets_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;

  v5 = a2;
  v6 = a3;
  ACHLogAssets();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    __57__ACHMobileAssetProvider__downloadAssets_withCompletion___block_invoke_cold_1(v5);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_removeAssets:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (objc_msgSend(v5, "count"))
  {
    -[ACHMobileAssetProvider mobileAssetDownloadManager](self, "mobileAssetDownloadManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeMobileAssets:completion:", v5, &__block_literal_global_198);

  }
}

void __40__ACHMobileAssetProvider__removeAssets___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v4;
  NSObject *v5;

  v4 = a3;
  if ((a2 & 1) == 0)
  {
    ACHLogAssets();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __40__ACHMobileAssetProvider__removeAssets___block_invoke_cold_1();

  }
}

- (void)_processAssets:(id)a3 completion:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  id v16;
  void (**v17)(id, id, id, id);
  id obj;
  uint64_t v19;
  id v20;
  id v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _QWORD v27[6];
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v16 = a3;
  v17 = (void (**)(id, id, id, id))a4;
  -[ACHMobileAssetProvider _assetsGroupedByUniqueNameAndType:](self, "_assetsGroupedByUniqueNameAndType:", v16);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v6 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v20 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  objc_msgSend(v22, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
  if (v7)
  {
    v19 = *(_QWORD *)v41;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v41 != v19)
          objc_enumerationMutation(obj);
        objc_msgSend(v22, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * i));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = 0;
        v35 = &v34;
        v36 = 0x3032000000;
        v37 = __Block_byref_object_copy__1;
        v38 = __Block_byref_object_dispose__1;
        v39 = 0;
        v28 = 0;
        v29 = &v28;
        v30 = 0x3032000000;
        v31 = __Block_byref_object_copy__1;
        v32 = __Block_byref_object_dispose__1;
        v33 = 0;
        v27[0] = MEMORY[0x24BDAC760];
        v27[1] = 3221225472;
        v27[2] = __52__ACHMobileAssetProvider__processAssets_completion___block_invoke;
        v27[3] = &unk_24D13A790;
        v27[4] = &v34;
        v27[5] = &v28;
        -[ACHMobileAssetProvider _getCurrentAsssetAndOlderAssetsFromAssets:completion:](self, "_getCurrentAsssetAndOlderAssetsFromAssets:completion:", v9, v27);
        if (objc_msgSend((id)v35[5], "state") == 2)
          v10 = v20;
        else
          v10 = v21;
        objc_msgSend(v10, "addObject:", v35[5]);
        v25 = 0u;
        v26 = 0u;
        v23 = 0u;
        v24 = 0u;
        v11 = (id)v29[5];
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v44, 16);
        if (v12)
        {
          v13 = *(_QWORD *)v24;
          do
          {
            for (j = 0; j != v12; ++j)
            {
              if (*(_QWORD *)v24 != v13)
                objc_enumerationMutation(v11);
              v15 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * j);
              if (objc_msgSend(v15, "state") == 2)
                objc_msgSend(v6, "addObject:", v15);
            }
            v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v44, 16);
          }
          while (v12);
        }

        _Block_object_dispose(&v28, 8);
        _Block_object_dispose(&v34, 8);

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
    }
    while (v7);
  }

  if (v17)
    v17[2](v17, v21, v6, v20);

}

void __52__ACHMobileAssetProvider__processAssets_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

- (id)_assetsGroupedByUniqueNameAndType:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id obj;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v5)
  {
    v6 = v5;
    v19 = *(_QWORD *)v21;
    v7 = *MEMORY[0x24BE01950];
    v8 = *MEMORY[0x24BE01940];
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v21 != v19)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v10, "attributes");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKeyedSubscript:", v7);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v10, "attributes");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectForKeyedSubscript:", v8);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@-%@"), v12, v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "objectForKeyedSubscript:", v15);
        v16 = (id)objc_claimAutoreleasedReturnValue();
        if (!v16)
        {
          v16 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v16, v15);
        }
        objc_msgSend(v16, "addObject:", v10);

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v6);
  }

  return v4;
}

- (void)_getCurrentAsssetAndOlderAssetsFromAssets:(id)a3 completion:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void (**v10)(id, void *, void *);

  v10 = (void (**)(id, void *, void *))a4;
  v5 = a3;
  objc_msgSend(v5, "sortedArrayUsingComparator:", &__block_literal_global_205);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF0], "setWithArray:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "lastObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    objc_msgSend(v7, "removeObject:", v8);
  if (v10)
  {
    objc_msgSend(v7, "allObjects");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, v8, v9);

  }
}

uint64_t __79__ACHMobileAssetProvider__getCurrentAsssetAndOlderAssetsFromAssets_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;

  v4 = a3;
  v5 = a2;
  objc_msgSend(v5, "attributes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x24BE66A88];
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x24BE66A88]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "integerValue");

  objc_msgSend(v4, "attributes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "integerValue");

  objc_msgSend(v5, "attributes");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = *MEMORY[0x24BE66A90];
  objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x24BE66A90]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "integerValue");

  objc_msgSend(v4, "attributes");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectForKeyedSubscript:", v14);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "integerValue");

  objc_msgSend(v5, "attributes");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = *MEMORY[0x24BE66AB0];
  objc_msgSend(v20, "objectForKeyedSubscript:", *MEMORY[0x24BE66AB0]);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "integerValue");

  objc_msgSend(v4, "attributes");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v24, "objectForKeyedSubscript:", v21);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "integerValue");

  if (v9 < v12)
    return -1;
  if (v9 > v12)
    return 1;
  if (v16 < v19)
    return -1;
  if (v16 > v19)
    return 1;
  if (v23 >= v26)
    return v23 > v26;
  else
    return -1;
}

- (id)_compatibilityVersionQueryParameters
{
  void *v2;
  uint64_t i;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)objc_opt_new();
  for (i = 3; i != 8; ++i)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", i);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringValue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObject:", v5);

  }
  v8 = *MEMORY[0x24BE66A88];
  v9[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (_HKMobileAssetDownloadManager)mobileAssetDownloadManager
{
  return self->_mobileAssetDownloadManager;
}

- (void)setMobileAssetDownloadManager:(id)a3
{
  objc_storeStrong((id *)&self->_mobileAssetDownloadManager, a3);
}

- (NSUserDefaults)nanoUserDefaults
{
  return self->_nanoUserDefaults;
}

- (void)setNanoUserDefaults:(id)a3
{
  objc_storeStrong((id *)&self->_nanoUserDefaults, a3);
}

- (double)downloadDelayOverride
{
  return self->_downloadDelayOverride;
}

- (void)setDownloadDelayOverride:(double)a3
{
  self->_downloadDelayOverride = a3;
}

- (id)remoteDownloadCompleteCompletion
{
  return objc_getProperty(self, a2, 32, 1);
}

- (void)setRemoteDownloadCompleteCompletion:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_remoteDownloadCompleteCompletion, 0);
  objc_storeStrong((id *)&self->_nanoUserDefaults, 0);
  objc_storeStrong((id *)&self->_mobileAssetDownloadManager, 0);
}

void __30__ACHMobileAssetProvider_init__block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21407B000, log, OS_LOG_TYPE_ERROR, "Default asset download completion handler called. This is unexpected.", v1, 2u);
  OUTLINED_FUNCTION_5();
}

void __30__ACHMobileAssetProvider_init__block_invoke_187_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_21407B000, v0, v1, "Error with mobile assets: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __57__ACHMobileAssetProvider_downloadedAssetDiskUsageInBytes__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_21407B000, v0, v1, "Error querying local assets for CacheDelete disk usage reporting: %{public}@.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __50__ACHMobileAssetProvider_purgeAllDownloadedAssets__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_21407B000, v0, v1, "Error querying local assets for CacheDelete purging: %{public}@.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __50__ACHMobileAssetProvider_purgeAllDownloadedAssets__block_invoke_191_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_21407B000, v0, v1, "Error purging assets for CacheDelete: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_downloadDelay
{
  int v2;
  double v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 134217984;
  v3 = a2;
  _os_log_debug_impl(&dword_21407B000, log, OS_LOG_TYPE_DEBUG, "Mobile Assets download delay is %f", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_1();
}

void __58__ACHMobileAssetProvider__fetchLocalAssetsWithCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_21407B000, v0, v1, "Error querying local assets: %{public}@.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __47__ACHMobileAssetProvider_downloadRemoteCatalog__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_21407B000, v0, v1, "Error querying remote assets: %{public}@. Going ahead to attempt processing local assets", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __47__ACHMobileAssetProvider_downloadRemoteCatalog__block_invoke_197_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_21407B000, a1, a3, "No remote assets to download.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5();
}

void __64__ACHMobileAssetProvider__downloadRemoteAssets_installedAssets___block_invoke_2_cold_1(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  objc_msgSend(*(id *)(a1 + 40), "count");
  objc_msgSend(a2, "count");
  OUTLINED_FUNCTION_3(&dword_21407B000, v3, v4, "Combining installed assets count %lu with downloaded assets count: %lu", v5, v6, v7, v8, 0);
}

void __64__ACHMobileAssetProvider__downloadRemoteAssets_installedAssets___block_invoke_2_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_21407B000, v0, v1, "Error downloading assets: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_downloadAssets:(uint64_t)a3 withCompletion:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_21407B000, a1, a3, "No assets to download, calling completion with empty array and returning early", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5();
}

void __57__ACHMobileAssetProvider__downloadAssets_withCompletion___block_invoke_cold_1(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(a1, "count");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_21407B000, v1, v2, "Received downloaded asset count %lu, error: %@", v3, v4, v5, v6, v7);
}

void __40__ACHMobileAssetProvider__removeAssets___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_21407B000, v0, v1, "Error removing assets: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
