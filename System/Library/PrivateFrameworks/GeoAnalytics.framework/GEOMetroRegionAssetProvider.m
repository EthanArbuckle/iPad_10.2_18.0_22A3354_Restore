@implementation GEOMetroRegionAssetProvider

- (GEOMetroRegionAssetProvider)init
{
  GEOMetroRegionAssetProvider *v2;
  NSCache *v3;
  NSCache *fileURLCache;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOMetroRegionAssetProvider;
  v2 = -[GEOMetroRegionAssetProvider init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSCache *)objc_alloc_init(MEMORY[0x24BDBCE40]);
    fileURLCache = v2->_fileURLCache;
    v2->_fileURLCache = v3;

    -[NSCache setName:](v2->_fileURLCache, "setName:", CFSTR("metro regions file URL cache"));
    -[GEOMetroRegionAssetProvider _updateCatalogAfterDelay:](v2, "_updateCatalogAfterDelay:", 5.0);
  }
  return v2;
}

+ (id)sharedProvider
{
  if (qword_254316CA8 != -1)
    dispatch_once(&qword_254316CA8, &__block_literal_global_12);
  return (id)_MergedGlobals_13;
}

void __45__GEOMetroRegionAssetProvider_sharedProvider__block_invoke()
{
  GEOMetroRegionAssetProvider *v0;
  void *v1;

  v0 = objc_alloc_init(GEOMetroRegionAssetProvider);
  v1 = (void *)_MergedGlobals_13;
  _MergedGlobals_13 = (uint64_t)v0;

}

+ (void)_downloadAsset:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init((Class)getMADownloadOptionsClass());
  objc_msgSend(v7, "setAllowsCellularAccess:", GEOConfigGetBOOL());
  objc_msgSend(v7, "setAllowsExpensiveAccess:", objc_msgSend(v7, "allowsCellularAccess"));
  objc_msgSend(v7, "setRequiresPowerPluggedIn:", GEOConfigGetBOOL() ^ 1);
  objc_msgSend(v7, "setDiscretionary:", GEOConfigGetBOOL());
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __57__GEOMetroRegionAssetProvider__downloadAsset_completion___block_invoke;
  v10[3] = &unk_250DC1358;
  v11 = v5;
  v12 = v6;
  v8 = v6;
  v9 = v5;
  objc_msgSend(v9, "startDownload:then:", v7, v10);

}

uint64_t __57__GEOMetroRegionAssetProvider__downloadAsset_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  void *v5;
  uint64_t result;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  GEOGetMetroRegionLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(a1 + 32), "getLocalUrl");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 134218242;
    v8 = a2;
    v9 = 2112;
    v10 = v5;
    _os_log_impl(&dword_23CBB4000, v4, OS_LOG_TYPE_INFO, "Got the asset download reply: %ld, and %@", (uint8_t *)&v7, 0x16u);

  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  return result;
}

+ (id)_maQueryForAssetCode:(id)a3
{
  id v3;
  void *v4;
  objc_class *v5;
  void *v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  v3 = a3;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2050000000;
  v4 = (void *)getMAAssetQueryClass_softClass;
  v12 = getMAAssetQueryClass_softClass;
  if (!getMAAssetQueryClass_softClass)
  {
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __getMAAssetQueryClass_block_invoke;
    v8[3] = &unk_250DC1318;
    v8[4] = &v9;
    __getMAAssetQueryClass_block_invoke((uint64_t)v8);
    v4 = (void *)v10[3];
  }
  v5 = objc_retainAutorelease(v4);
  _Block_object_dispose(&v9, 8);
  v6 = (void *)objc_msgSend([v5 alloc], "initWithType:", CFSTR("com.apple.MobileAsset.GeoPolygonDataAssets"));
  objc_msgSend(v6, "returnTypes:", 2);
  objc_msgSend(v6, "setDoNotBlockBeforeFirstUnlock:", 1);
  objc_msgSend(v6, "addKeyValuePair:with:", CFSTR("Type"), CFSTR("Metro"));
  objc_msgSend(v6, "addKeyValuePair:with:", CFSTR("FormatVersion"), CFSTR("1"));
  objc_msgSend(v6, "addKeyValuePair:with:", CFSTR("MetrosInCountry"), v3);

  return v6;
}

+ (void)_unavailableAssetForAssetCode:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a4;
  objc_msgSend(a1, "_maQueryForAssetCode:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __72__GEOMetroRegionAssetProvider__unavailableAssetForAssetCode_completion___block_invoke;
  v10[3] = &unk_250DC1380;
  v11 = v7;
  v12 = v6;
  v8 = v7;
  v9 = v6;
  objc_msgSend(v8, "queryMetaDataWithError:", v10);

}

void __72__GEOMetroRegionAssetProvider__unavailableAssetForAssetCode_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint8_t v15[128];
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (a2)
  {
    GEOGetMetroRegionLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v5;
      _os_log_impl(&dword_23CBB4000, v6, OS_LOG_TYPE_ERROR, "MA query error : (%@)", buf, 0xCu);
    }
  }
  else
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    objc_msgSend(*(id *)(a1 + 32), "results", 0);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = -[NSObject countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v12;
      while (2)
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v12 != v9)
            objc_enumerationMutation(v6);
          if (objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10), "state") == 1)
          {
            (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

            goto LABEL_14;
          }
          ++v10;
        }
        while (v8 != v10);
        v8 = -[NSObject countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        if (v8)
          continue;
        break;
      }
    }
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
LABEL_14:

}

- (id)_bestAvailableAssetForAssetCode:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  id v15;
  id v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t v22[128];
  uint8_t buf[4];
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "_maQueryForAssetCode:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "queryMetaDataSync");
  GEOGetMetroRegionLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v24 = v5;
    _os_log_impl(&dword_23CBB4000, v6, OS_LOG_TYPE_INFO, "query result : %ld", buf, 0xCu);
  }

  objc_msgSend(v4, "results");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    GEOGetMetroRegionLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v24 = (uint64_t)v3;
      _os_log_impl(&dword_23CBB4000, v8, OS_LOG_TYPE_INFO, "query for '%@' has no results", buf, 0xCu);
    }
    goto LABEL_19;
  }
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(v4, "results", 0);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = -[NSObject countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (!v9)
  {
LABEL_19:
    v11 = 0;
    goto LABEL_21;
  }
  v10 = v9;
  v11 = 0;
  v12 = *(_QWORD *)v19;
  while (2)
  {
    for (i = 0; i != v10; ++i)
    {
      if (*(_QWORD *)v19 != v12)
        objc_enumerationMutation(v8);
      v14 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
      objc_msgSend(v14, "logAsset");
      if (objc_msgSend(v14, "state") == 1)
      {
        objc_msgSend((id)objc_opt_class(), "_downloadAsset:completion:", v14, 0);
      }
      else
      {
        if (objc_msgSend(v14, "state") == 2)
        {
          v16 = v14;

          v11 = v16;
          goto LABEL_21;
        }
        if (objc_msgSend(v14, "state") == 3)
        {
          v15 = v14;

          v11 = v15;
        }
      }
    }
    v10 = -[NSObject countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v10)
      continue;
    break;
  }
LABEL_21:

  return v11;
}

- (id)urlForInstalledCountryCode:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[NSCache objectForKey:](self->_fileURLCache, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = v5;
  }
  else
  {
    -[GEOMetroRegionAssetProvider _bestAvailableAssetForAssetCode:](self, "_bestAvailableAssetForAssetCode:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "getLocalFileUrl");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
      -[NSCache setObject:forKey:](self->_fileURLCache, "setObject:forKey:", v8, v4);
    v6 = v8;

  }
  return v6;
}

- (id)_acceptListForCountryCode:(id)a3 name:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  id v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  -[GEOMetroRegionAssetProvider urlForInstalledCountryCode:](self, "urlForInstalledCountryCode:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x24BDBCE70];
  objc_msgSend(v7, "URLByAppendingPathComponent:", CFSTR("AcceptLists.plist"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  objc_msgSend(v8, "dictionaryWithContentsOfURL:error:", v9, &v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v15;

  if (v11)
  {
    GEOGetMetroRegionLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v11;
      _os_log_impl(&dword_23CBB4000, v12, OS_LOG_TYPE_ERROR, "query result : %@", buf, 0xCu);
    }

    v13 = 0;
  }
  else
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

- (id)homeMetroAcceptListForCountryCode:(id)a3
{
  return -[GEOMetroRegionAssetProvider _acceptListForCountryCode:name:](self, "_acceptListForCountryCode:name:", a3, CFSTR("metros"));
}

- (id)homeCountryCodeAcceptList
{
  return -[GEOMetroRegionAssetProvider _acceptListForCountryCode:name:](self, "_acceptListForCountryCode:name:", CFSTR("CCALLOW"), CFSTR("countries"));
}

+ (void)_downloadCatalogIfNeededThen:(id)a3
{
  void (**v4)(_QWORD);
  void *v5;
  _QWORD v6[4];
  void (**v7)(_QWORD);

  v4 = (void (**)(_QWORD))a3;
  objc_msgSend(a1, "_maQueryForAssetCode:", CFSTR("CCALLOW"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isCatalogFetchedWithinThePastFewDays:", 1))
  {
    v4[2](v4);
  }
  else
  {
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __60__GEOMetroRegionAssetProvider__downloadCatalogIfNeededThen___block_invoke;
    v6[3] = &unk_250DC13A8;
    v7 = v4;
    objc_msgSend(a1, "_updateCatalogWithResult:", v6);

  }
}

uint64_t __60__GEOMetroRegionAssetProvider__downloadCatalogIfNeededThen___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_updateCatalogAfterDelay:(double)a3
{
  NSObject *v5;
  dispatch_time_t v6;
  _QWORD block[5];

  dispatch_get_global_queue(9, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __56__GEOMetroRegionAssetProvider__updateCatalogAfterDelay___block_invoke;
  block[3] = &unk_250DC0660;
  block[4] = self;
  dispatch_after(v6, v5, block);

}

uint64_t __56__GEOMetroRegionAssetProvider__updateCatalogAfterDelay___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v4[5];

  v2 = (void *)objc_opt_class();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __56__GEOMetroRegionAssetProvider__updateCatalogAfterDelay___block_invoke_2;
  v4[3] = &unk_250DC13D0;
  v4[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(v2, "_updateCatalogWithResult:", v4);
}

uint64_t __56__GEOMetroRegionAssetProvider__updateCatalogAfterDelay___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_catalogDownloadFinishedWithResult:", a2);
}

+ (void)_updateCatalogWithResult:(id)a3
{
  id v3;
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v3 = a3;
  v4 = objc_alloc_init((Class)getMADownloadOptionsClass());
  objc_msgSend(v4, "setAllowsCellularAccess:", GEOConfigGetBOOL());
  objc_msgSend(v4, "setAllowsExpensiveAccess:", objc_msgSend(v4, "allowsCellularAccess"));
  objc_msgSend(v4, "setRequiresPowerPluggedIn:", GEOConfigGetBOOL() ^ 1);
  objc_msgSend(v4, "setDiscretionary:", GEOConfigGetBOOL());
  v8 = 0;
  v9 = &v8;
  v10 = 0x2050000000;
  v5 = (void *)getMAAssetClass_softClass;
  v11 = getMAAssetClass_softClass;
  if (!getMAAssetClass_softClass)
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __getMAAssetClass_block_invoke;
    v7[3] = &unk_250DC1318;
    v7[4] = &v8;
    __getMAAssetClass_block_invoke((uint64_t)v7);
    v5 = (void *)v9[3];
  }
  v6 = objc_retainAutorelease(v5);
  _Block_object_dispose(&v8, 8);
  objc_msgSend(v6, "startCatalogDownload:options:then:", CFSTR("com.apple.MobileAsset.GeoPolygonDataAssets"), v4, v3);

}

- (void)_catalogDownloadFinishedWithResult:(int64_t)a3
{
  NSObject *v5;
  unsigned int catalogLoadRetryMultiplier;
  double v7;
  void *v8;
  void *v9;
  id v10;
  int v11;
  int64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  GEOGetMetroRegionLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v11 = 134217984;
    v12 = a3;
    _os_log_impl(&dword_23CBB4000, v5, OS_LOG_TYPE_INFO, "catalog download reply: %ld", (uint8_t *)&v11, 0xCu);
  }

  if (a3)
  {
    catalogLoadRetryMultiplier = self->_catalogLoadRetryMultiplier;
    if (catalogLoadRetryMultiplier <= 0xB)
      self->_catalogLoadRetryMultiplier = ++catalogLoadRetryMultiplier;
    v7 = (double)(600 * catalogLoadRetryMultiplier);
  }
  else
  {
    v7 = 1800.0;
  }
  -[GEOMetroRegionAssetProvider _updateCatalogAfterDelay:](self, "_updateCatalogAfterDelay:", v7);
  objc_msgSend(MEMORY[0x24BE3CBB8], "sharedConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "countryCode");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[GEOMetroRegionAssetProvider urlForInstalledCountryCode:](self, "urlForInstalledCountryCode:", v9);
}

+ (void)preloadAssetForCountryCode:(id)a3 preloadQueue:(id)a4 completion:(id)a5
{
  id v8;
  NSObject *v9;
  id v10;
  dispatch_group_t v11;
  uint64_t v12;
  id v13;
  NSObject *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD *v18;
  _QWORD v19[4];
  id v20;
  NSObject *v21;
  _QWORD *v22;
  id v23;
  _QWORD v24[3];
  char v25;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = dispatch_group_create();
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x2020000000;
  v25 = 1;
  v12 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __82__GEOMetroRegionAssetProvider_preloadAssetForCountryCode_preloadQueue_completion___block_invoke;
  v19[3] = &unk_250DC1448;
  v13 = v8;
  v20 = v13;
  v14 = v11;
  v22 = v24;
  v23 = a1;
  v21 = v14;
  objc_msgSend(a1, "_downloadCatalogIfNeededThen:", v19);
  v16[0] = v12;
  v16[1] = 3221225472;
  v16[2] = __82__GEOMetroRegionAssetProvider_preloadAssetForCountryCode_preloadQueue_completion___block_invoke_4;
  v16[3] = &unk_250DC1470;
  v17 = v10;
  v18 = v24;
  v15 = v10;
  dispatch_group_notify(v14, v9, v16);

  _Block_object_dispose(v24, 8);
}

void __82__GEOMetroRegionAssetProvider_preloadAssetForCountryCode_preloadQueue_completion___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithObjects:", *(_QWORD *)(a1 + 32), CFSTR("CCALLOW"), 0);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v3 = v2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v15;
    v7 = MEMORY[0x24BDAC760];
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v3);
        v9 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v8);
        dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
        v10 = *(void **)(a1 + 56);
        v11[0] = v7;
        v11[1] = 3221225472;
        v11[2] = __82__GEOMetroRegionAssetProvider_preloadAssetForCountryCode_preloadQueue_completion___block_invoke_2;
        v11[3] = &unk_250DC1420;
        v12 = *(id *)(a1 + 40);
        v13 = *(_OWORD *)(a1 + 48);
        objc_msgSend(v10, "_unavailableAssetForAssetCode:completion:", v9, v11);

        ++v8;
      }
      while (v5 != v8);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v5);
  }

}

void __82__GEOMetroRegionAssetProvider_preloadAssetForCountryCode_preloadQueue_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;
  __int128 v5;
  _QWORD v6[4];
  __int128 v7;

  if (a2)
  {
    v3 = *(void **)(a1 + 48);
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __82__GEOMetroRegionAssetProvider_preloadAssetForCountryCode_preloadQueue_completion___block_invoke_3;
    v6[3] = &unk_250DC13F8;
    v5 = *(_OWORD *)(a1 + 32);
    v4 = (id)v5;
    v7 = v5;
    objc_msgSend(v3, "_downloadAsset:completion:", a2, v6);

  }
  else
  {
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }
}

void __82__GEOMetroRegionAssetProvider_preloadAssetForCountryCode_preloadQueue_completion___block_invoke_3(uint64_t a1, uint64_t a2)
{
  unsigned __int8 *v2;
  unsigned __int8 v3;

  v2 = (unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  do
    v3 = __ldaxr(v2);
  while (__stlxr(v3 & (a2 == 0), v2));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __82__GEOMetroRegionAssetProvider_preloadAssetForCountryCode_preloadQueue_completion___block_invoke_4(uint64_t a1)
{
  uint64_t v1;
  unsigned __int8 v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = atomic_load((unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
  return (*(uint64_t (**)(uint64_t, _QWORD))(v1 + 16))(v1, v2 & 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileURLCache, 0);
}

@end
