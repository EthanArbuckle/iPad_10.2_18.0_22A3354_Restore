@implementation AXAuditAssetManager

+ (AXAuditAssetManager)shared
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __29__AXAuditAssetManager_shared__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (shared_onceToken != -1)
    dispatch_once(&shared_onceToken, block);
  return (AXAuditAssetManager *)(id)shared_instance;
}

void __29__AXAuditAssetManager_shared__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)shared_instance;
  shared_instance = v0;

}

- (AXAuditAssetManager)init
{
  AXAuditAssetManager *v2;
  uint64_t v3;
  AXIconVisionModelAssetPolicy *iconVisionModelAssetPolicy;
  uint64_t v5;
  AXElementVisionModelAssetPolicy *elementVisionModelAssetPolicy;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AXAuditAssetManager;
  v2 = -[AXAuditAssetManager init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDFDD58], "policy");
    v3 = objc_claimAutoreleasedReturnValue();
    iconVisionModelAssetPolicy = v2->__iconVisionModelAssetPolicy;
    v2->__iconVisionModelAssetPolicy = (AXIconVisionModelAssetPolicy *)v3;

    objc_msgSend(MEMORY[0x24BDFDD50], "policy");
    v5 = objc_claimAutoreleasedReturnValue();
    elementVisionModelAssetPolicy = v2->__elementVisionModelAssetPolicy;
    v2->__elementVisionModelAssetPolicy = (AXElementVisionModelAssetPolicy *)v5;

  }
  return v2;
}

- (void)downloadAssetsIfNecessary
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  v0 = 136315138;
  v1 = "-[AXAuditAssetManager downloadAssetsIfNecessary]";
  _os_log_debug_impl(&dword_235CE3000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%s", (uint8_t *)&v0, 0xCu);
  OUTLINED_FUNCTION_1();
}

- (void)assetController:(id)a3 didFinishRefreshingAssets:(id)a4 wasSuccessful:(BOOL)a5 error:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t i;
  void *v19;
  _BOOL8 v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t v36[128];
  uint8_t buf[4];
  const char *v38;
  __int16 v39;
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a6;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v9, "assetPolicy");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v38 = "-[AXAuditAssetManager assetController:didFinishRefreshingAssets:wasSuccessful:error:]";
    v39 = 2112;
    v40 = v12;
    _os_log_impl(&dword_235CE3000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: for policy: %@", buf, 0x16u);

  }
  if (a5)
  {
    if (objc_msgSend(v10, "count"))
    {
      v30 = v9;
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v38 = "-[AXAuditAssetManager assetController:didFinishRefreshingAssets:wasSuccessful:error:]";
        v39 = 2112;
        v40 = v10;
        _os_log_impl(&dword_235CE3000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: Found assets: %@", buf, 0x16u);
      }
      objc_msgSend(MEMORY[0x24BDBCEB8], "array", v11);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = 0u;
      v33 = 0u;
      v34 = 0u;
      v35 = 0u;
      v29 = v10;
      v13 = v10;
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v33;
        v17 = MEMORY[0x24BDACB70];
        do
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v33 != v16)
              objc_enumerationMutation(v13);
            v19 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
            if (objc_msgSend(v19, "isInstalled"))
            {
              if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 136315394;
                v38 = "-[AXAuditAssetManager assetController:didFinishRefreshingAssets:wasSuccessful:error:]";
                v39 = 2112;
                v40 = v19;
                _os_log_impl(&dword_235CE3000, v17, OS_LOG_TYPE_INFO, "%s: Asset already downloaded! Asset: %@", buf, 0x16u);
              }
            }
            else if ((objc_msgSend(v19, "isInstalled") & 1) == 0 && (objc_msgSend(v19, "isDownloading") & 1) == 0)
            {
              objc_msgSend(v31, "addObject:", v19);
            }
          }
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
        }
        while (v15);
      }

      v9 = v30;
      v11 = v28;
      if (objc_msgSend(v31, "count"))
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          v38 = "-[AXAuditAssetManager assetController:didFinishRefreshingAssets:wasSuccessful:error:]";
          v39 = 2112;
          v40 = v31;
          _os_log_impl(&dword_235CE3000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: Need to download assets: %@", buf, 0x16u);
        }
        objc_msgSend(v30, "downloadAssets:successStartBlock:", v31, &__block_literal_global_21);
      }

      v10 = v29;
    }
    else
    {
      v20 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v20)
        -[AXAuditAssetManager assetController:didFinishRefreshingAssets:wasSuccessful:error:].cold.1(v20, v21, v22, v23, v24, v25, v26, v27);
    }
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    -[AXAuditAssetManager assetController:didFinishRefreshingAssets:wasSuccessful:error:].cold.2();
  }

}

void __85__AXAuditAssetManager_assetController_didFinishRefreshingAssets_wasSuccessful_error___block_invoke(uint64_t a1, int a2)
{
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if (a2)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
    {
      v10 = 136315138;
      v11 = "-[AXAuditAssetManager assetController:didFinishRefreshingAssets:wasSuccessful:error:]_block_invoke";
      _os_log_impl(&dword_235CE3000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: Successfully downloaded assets!", (uint8_t *)&v10, 0xCu);
    }
  }
  else
  {
    v2 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v2)
      __85__AXAuditAssetManager_assetController_didFinishRefreshingAssets_wasSuccessful_error___block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

- (void)assetController:(id)a3 didFinishDownloadingAsset:(id)a4 wasSuccessful:(BOOL)a5 error:(id)a6 hasRemainingDownloads:(BOOL)a7
{
  id v10;
  id v11;
  id v12;
  int v13;
  const char *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  if (a5)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
    {
      v13 = 136315394;
      v14 = "-[AXAuditAssetManager assetController:didFinishDownloadingAsset:wasSuccessful:error:hasRemainingDownloads:]";
      v15 = 2112;
      v16 = v11;
      _os_log_impl(&dword_235CE3000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s: asset successfully installed! %@", (uint8_t *)&v13, 0x16u);
    }
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    -[AXAuditAssetManager assetController:didFinishDownloadingAsset:wasSuccessful:error:hasRemainingDownloads:].cold.1();
  }

}

- (AXIconVisionModelAssetPolicy)_iconVisionModelAssetPolicy
{
  return self->__iconVisionModelAssetPolicy;
}

- (void)set_iconVisionModelAssetPolicy:(id)a3
{
  objc_storeStrong((id *)&self->__iconVisionModelAssetPolicy, a3);
}

- (AXElementVisionModelAssetPolicy)_elementVisionModelAssetPolicy
{
  return self->__elementVisionModelAssetPolicy;
}

- (void)set_elementVisionModelAssetPolicy:(id)a3
{
  objc_storeStrong((id *)&self->__elementVisionModelAssetPolicy, a3);
}

- (NSArray)_assetControllers
{
  return self->__assetControllers;
}

- (void)set_assetControllers:(id)a3
{
  objc_storeStrong((id *)&self->__assetControllers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__assetControllers, 0);
  objc_storeStrong((id *)&self->__elementVisionModelAssetPolicy, 0);
  objc_storeStrong((id *)&self->__iconVisionModelAssetPolicy, 0);
}

- (void)assetController:(uint64_t)a3 didFinishRefreshingAssets:(uint64_t)a4 wasSuccessful:(uint64_t)a5 error:(uint64_t)a6 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_235CE3000, MEMORY[0x24BDACB70], a3, "%s: did not find any assets", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)assetController:didFinishRefreshingAssets:wasSuccessful:error:.cold.2()
{
  int v0[6];
  uint64_t v1;

  v1 = *MEMORY[0x24BDAC8D0];
  v0[0] = 136315394;
  OUTLINED_FUNCTION_2();
  _os_log_error_impl(&dword_235CE3000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s: asset refresh was not successful. Error: %@", (uint8_t *)v0, 0x16u);
  OUTLINED_FUNCTION_1();
}

void __85__AXAuditAssetManager_assetController_didFinishRefreshingAssets_wasSuccessful_error___block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_235CE3000, MEMORY[0x24BDACB70], a3, "%s: Asset download failed!", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)assetController:didFinishDownloadingAsset:wasSuccessful:error:hasRemainingDownloads:.cold.1()
{
  __int16 v0;
  uint64_t v1;
  int v2[5];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2[0] = 136315650;
  OUTLINED_FUNCTION_2();
  v3 = v0;
  v4 = v1;
  _os_log_error_impl(&dword_235CE3000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s: asset download was not successful: error: %@, asset: %@", (uint8_t *)v2, 0x20u);
}

@end
