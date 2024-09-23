@implementation DCAssetFetcher

+ (id)sharedFetcher
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __31__DCAssetFetcher_sharedFetcher__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedFetcher_onceToken != -1)
    dispatch_once(&sharedFetcher_onceToken, block);
  return (id)sharedFetcher_sharedFetcher;
}

void __31__DCAssetFetcher_sharedFetcher__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedFetcher_sharedFetcher;
  sharedFetcher_sharedFetcher = (uint64_t)v1;

}

- (void)fetchPublicKeyAssetWithCompletion:(id)a3
{
  id v4;
  DCAssetFetcherContext *v5;

  v4 = a3;
  v5 = objc_alloc_init(DCAssetFetcherContext);
  -[DCAssetFetcherContext setAllowCatalogRefresh:](v5, "setAllowCatalogRefresh:", 0);
  -[DCAssetFetcher _fetchAssetWithContext:completionHandler:](self, "_fetchAssetWithContext:completionHandler:", v5, v4);

}

- (void)initiateMetadataFetchIgnoringCachesWithCompletion:(id)a3
{
  void (**v3)(id, uint64_t, _QWORD);
  NSObject *v4;
  uint8_t v5[16];

  v3 = (void (**)(id, uint64_t, _QWORD))a3;
  _DCLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_224FB2000, v4, OS_LOG_TYPE_DEFAULT, "Initiating an out of band catalog download", v5, 2u);
  }

  objc_msgSend(MEMORY[0x24BE66B90], "startCatalogDownload:then:", CFSTR("com.apple.MobileAsset.DeviceCheck"), &__block_literal_global_1);
  v3[2](v3, 1, 0);

}

void __68__DCAssetFetcher_initiateMetadataFetchIgnoringCachesWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  _DCLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 134217984;
    v5 = a2;
    _os_log_impl(&dword_224FB2000, v3, OS_LOG_TYPE_DEFAULT, "Initiated an out of band catalog download completed with result: %ld", (uint8_t *)&v4, 0xCu);
  }

}

- (void)_fetchAssetWithContext:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint8_t v9[16];

  v6 = a4;
  v7 = a3;
  _DCLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_224FB2000, v8, OS_LOG_TYPE_DEFAULT, "Querying...", v9, 2u);
  }

  -[DCAssetFetcher _queryMetadataWithContext:completion:](self, "_queryMetadataWithContext:completion:", v7, v6);
}

- (void)_queryMetadataWithContext:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, void *);
  NSObject *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, _QWORD, void *))a4;
  _DCLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 138412290;
    v14 = v6;
    _os_log_impl(&dword_224FB2000, v8, OS_LOG_TYPE_DEFAULT, "Starting to fetch asset with context: %@", (uint8_t *)&v13, 0xCu);
  }

  -[DCAssetFetcher _assetQuery](self, "_assetQuery");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "queryMetaDataSync");
  if ((objc_msgSend(v6, "ignoreCachedMetadata") & 1) != 0 || v10 == 2)
  {
    -[DCAssetFetcher _handleMissingMetadataWithContext:completion:](self, "_handleMissingMetadataWithContext:completion:", v6, v7);
  }
  else if (v10)
  {
    _DCLogSystem();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[DCAssetFetcher _queryMetadataWithContext:completion:].cold.1(v10, v11);

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.twobit.fetcherror"), -3000, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, 0, v12);

  }
  else
  {
    -[DCAssetFetcher _handleSuccessForQuery:completion:](self, "_handleSuccessForQuery:completion:", v9, v7);
  }

}

- (id)_assetQuery
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BE66BB0]), "initWithType:", CFSTR("com.apple.MobileAsset.DeviceCheck"));
}

- (void)_handleMissingMetadataWithContext:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD v20[5];
  id v21;
  id v22;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  _DCLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_224FB2000, v8, OS_LOG_TYPE_DEFAULT, "Query sync result indicated missing asset catalog", buf, 2u);
  }

  if (objc_msgSend(v6, "allowCatalogRefresh"))
  {
    objc_msgSend(v6, "setAllowCatalogRefresh:", 0);
    objc_msgSend(v6, "setIgnoreCachedMetadata:", 0);
    _DCLogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_224FB2000, v9, OS_LOG_TYPE_DEFAULT, "Attempting to download catalog, waiting for result...", buf, 2u);
    }

    v10 = (void *)MEMORY[0x24BE66B90];
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __63__DCAssetFetcher__handleMissingMetadataWithContext_completion___block_invoke;
    v20[3] = &unk_24ED115E8;
    v22 = v7;
    v20[4] = self;
    v21 = v6;
    objc_msgSend(v10, "startCatalogDownload:then:", CFSTR("com.apple.MobileAsset.DeviceCheck"), v20);

    v11 = v22;
  }
  else
  {
    _DCLogSystem();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[DCAssetFetcher _handleMissingMetadataWithContext:completion:].cold.1(v12, v13, v14, v15, v16, v17, v18, v19);

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.twobit.fetcherror"), -3001, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v11);
  }

}

void __63__DCAssetFetcher__handleMissingMetadataWithContext_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  uint64_t v5;
  void *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  _DCLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 134217984;
    v8 = a2;
    _os_log_impl(&dword_224FB2000, v4, OS_LOG_TYPE_DEFAULT, "Catalog downloaded with result %ld...", (uint8_t *)&v7, 0xCu);
  }

  if (a2)
  {
    v5 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.twobit.fetcherror"), -3001, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v5 + 16))(v5, 0, v6);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_queryMetadataWithContext:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  }
}

- (void)_handleSuccessForQuery:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, void *, id);
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  unint64_t v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  uint8_t buf[4];
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, void *, id))a4;
  _DCLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "results");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134217984;
    v28 = objc_msgSend(v9, "count");
    _os_log_impl(&dword_224FB2000, v8, OS_LOG_TYPE_DEFAULT, "Query success, results count: %lu", buf, 0xCu);

  }
  objc_msgSend(v6, "results");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (v11)
  {
    objc_msgSend(v6, "results");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "count");

    if (v13 >= 2)
    {
      _DCLogSystem();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        -[DCAssetFetcher _handleSuccessForQuery:completion:].cold.1(v14, v15, v16, v17, v18, v19, v20, v21);

    }
    objc_msgSend(v6, "results");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "firstObject");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v26 = 0;
    -[DCAssetFetcher _validateAsset:error:](self, "_validateAsset:error:", v23, &v26);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v26;
    v7[2](v7, v24, v25);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.twobit.fetcherror"), -3100, 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, 0, v23);
  }

}

- (id)_validateAsset:(id)a3 error:(id *)a4
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v12;
  id v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  _DCLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = objc_msgSend(v5, "state");
    objc_msgSend(v5, "attributes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138412802;
    v13 = v5;
    v14 = 2048;
    v15 = v7;
    v16 = 2112;
    v17 = v8;
    _os_log_impl(&dword_224FB2000, v6, OS_LOG_TYPE_DEFAULT, "Attempting to validate asset: <%@ - %ld> - %@", (uint8_t *)&v12, 0x20u);

  }
  +[DCAsset assetWithMobileAsset:](DCAsset, "assetWithMobileAsset:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    +[DCBGSTaskController sharedInstance](DCBGSTaskController, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "publicKeyRefreshInterval");
    objc_msgSend(v10, "updateTaskWithIdentifier:withRefreshInterval:", CFSTR("com.apple.devicecheck.notify"));

  }
  else if (a4)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.twobit.fetcherror"), -3200, 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (void)_queryMetadataWithContext:(uint64_t)a1 completion:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 134217984;
  v3 = a1;
  _os_log_error_impl(&dword_224FB2000, a2, OS_LOG_TYPE_ERROR, "Unexpected query result: %ld", (uint8_t *)&v2, 0xCu);
}

- (void)_handleMissingMetadataWithContext:(uint64_t)a3 completion:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_0(&dword_224FB2000, a1, a3, "Catalog refetch not allowed, failing...", a5, a6, a7, a8, 0);
}

- (void)_handleSuccessForQuery:(uint64_t)a3 completion:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_0(&dword_224FB2000, a1, a3, "Unexpected result count detected!!!", a5, a6, a7, a8, 0);
}

@end
