@implementation AIAudiogramAssetManager

- (AIAudiogramAssetManager)initWithDelegate:(id)a3
{
  id v4;
  AIAudiogramAssetManager *v5;
  AIAudiogramAssetManager *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)AIAudiogramAssetManager;
  v5 = -[AIAudiogramAssetManager init](&v12, sel_init);
  v6 = v5;
  if (v5)
  {
    -[AIAudiogramAssetManager setDelegate:](v5, "setDelegate:", v4);
    objc_msgSend(MEMORY[0x24BDFDD48], "policy");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDFDD30], "assetControllerWithPolicy:qosClass:", v7, 25);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[AIAudiogramAssetManager setAssetController:](v6, "setAssetController:", v8);

    -[AIAudiogramAssetManager assetController](v6, "assetController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setUserInitiated:", 1);

    -[AIAudiogramAssetManager assetController](v6, "assetController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObserver:", v6);

  }
  return v6;
}

- (void)refreshAssets
{
  -[AIAudiogramAssetManager _refreshAssetsByForceUpdatingCatalog:](self, "_refreshAssetsByForceUpdatingCatalog:", 0);
}

- (void)_refreshAssetsByForceUpdatingCatalog:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  _BYTE buf[24];
  void *v15;
  uint64_t *v16;
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x24BDAC8D0];
  v10 = 0;
  v11 = &v10;
  v12 = 0x2050000000;
  v5 = (void *)getAXSettingsClass_softClass;
  v13 = getAXSettingsClass_softClass;
  if (!getAXSettingsClass_softClass)
  {
    *(_QWORD *)buf = MEMORY[0x24BDAC760];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __getAXSettingsClass_block_invoke;
    v15 = &unk_24FD6CE58;
    v16 = &v10;
    __getAXSettingsClass_block_invoke((uint64_t)buf);
    v5 = (void *)v11[3];
  }
  v6 = objc_retainAutorelease(v5);
  _Block_object_dispose(&v10, 8);
  objc_msgSend(v6, "sharedInstance", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAudiogramIngestionLastModelAccess:", CFAbsoluteTimeGetCurrent());

  if (v3)
    -[AIAudiogramAssetManager setDidForceCatalogRefresh:](self, "setDidForceCatalogRefresh:", 1);
  AXLogAudiogram();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = self;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v3;
    _os_log_impl(&dword_22FB4F000, v8, OS_LOG_TYPE_INFO, "[%@]: Audiogram Ingestion Model loading: Initiating refresh with catalog force update %d", buf, 0x12u);
  }

  -[AIAudiogramAssetManager assetController](self, "assetController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "refreshAssetsByForceUpdatingCatalog:updatingCatalogIfNeeded:catalogRefreshOverrideTimeout:completion:", v3, 1, 0, 0);

}

- (void)assetDidUpdateWithError:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  AIAudiogramAssetManager *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  AXLogAudiogram();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    -[AIAudiogramAssetManager latestDownloadedAsset](self, "latestDownloadedAsset");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138412546;
    v14 = self;
    v15 = 2112;
    v16 = v6;
    _os_log_impl(&dword_22FB4F000, v5, OS_LOG_TYPE_INFO, "[%@]: Audiogram Ingestion Model loading: Asset Did Update:\n%@", (uint8_t *)&v13, 0x16u);

  }
  -[AIAudiogramAssetManager delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AIAudiogramAssetManager latestDownloadedAsset](self, "latestDownloadedAsset");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[AIAudiogramAssetManager latestDownloadedAsset](self, "latestDownloadedAsset");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "properties");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[AIAudiogramAssetManager latestDownloadedAsset](self, "latestDownloadedAsset");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "modelDidUpdate:assetProperties:assetVersion:withError:", v9, v11, objc_msgSend(v12, "contentVersion"), v4);

}

- (void)assetController:(id)a3 didFinishRefreshingAssets:(id)a4 wasSuccessful:(BOOL)a5 error:(id)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  id v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  unint64_t v18;
  void *v19;
  unint64_t v20;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  _QWORD v25[5];
  id v26;
  id v27;
  uint8_t buf[4];
  AIAudiogramAssetManager *v29;
  __int16 v30;
  id v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v7 = a5;
  v34 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  if (v7 && objc_msgSend(v11, "count"))
  {
    objc_msgSend(v11, "lastObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    AXLogAudiogram();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v29 = self;
      v30 = 2112;
      v31 = v11;
      _os_log_impl(&dword_22FB4F000, v14, OS_LOG_TYPE_INFO, "[%@]: Audiogram Ingestion Model loading: Refreshed Assets:\n%@", buf, 0x16u);
    }

    if (objc_msgSend(v13, "isInstalled"))
    {
      AXLogAudiogram();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v29 = self;
        v30 = 2112;
        v31 = v11;
        _os_log_impl(&dword_22FB4F000, v15, OS_LOG_TYPE_INFO, "[%@]: Audiogram Ingestion Model loading: Newest asset already installed:\n%@", buf, 0x16u);
      }

      -[AIAudiogramAssetManager setLatestDownloadedAsset:](self, "setLatestDownloadedAsset:", v13);
    }
    else
    {
      -[AIAudiogramAssetManager latestDownloadedAsset](self, "latestDownloadedAsset");
      v16 = objc_claimAutoreleasedReturnValue();
      if (!v16
        || (v17 = (void *)v16,
            v18 = objc_msgSend(v13, "contentVersion"),
            -[AIAudiogramAssetManager latestDownloadedAsset](self, "latestDownloadedAsset"),
            v19 = (void *)objc_claimAutoreleasedReturnValue(),
            v20 = objc_msgSend(v19, "contentVersion"),
            v19,
            v17,
            v18 > v20))
      {
        -[AIAudiogramAssetManager assetController](self, "assetController");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v25[0] = MEMORY[0x24BDAC760];
        v25[1] = 3221225472;
        v25[2] = __89__AIAudiogramAssetManager_assetController_didFinishRefreshingAssets_wasSuccessful_error___block_invoke;
        v25[3] = &unk_24FD6DC58;
        v25[4] = self;
        v26 = v11;
        v27 = v12;
        objc_msgSend(v21, "downloadAssets:successStartBlock:", v26, v25);

LABEL_24:
        goto LABEL_25;
      }
      AXLogAudiogram();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        -[AIAudiogramAssetManager latestDownloadedAsset](self, "latestDownloadedAsset");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v29 = self;
        v30 = 2112;
        v31 = v24;
        _os_log_impl(&dword_22FB4F000, v23, OS_LOG_TYPE_INFO, "[%@]: Audiogram Ingestion Model loading: Latest asset up to date - keeping:\n%@", buf, 0x16u);

      }
    }
    -[AIAudiogramAssetManager assetDidUpdateWithError:](self, "assetDidUpdateWithError:", 0);
    goto LABEL_24;
  }
  if (!v12)
  {
    if (objc_msgSend(v11, "count"))
    {
      v12 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "ax_errorWithDomain:description:", CFSTR("Audiogram model download error"), CFSTR("No assets found"));
      v12 = (id)objc_claimAutoreleasedReturnValue();
      if (!-[AIAudiogramAssetManager didForceCatalogRefresh](self, "didForceCatalogRefresh"))
        -[AIAudiogramAssetManager _refreshAssetsByForceUpdatingCatalog:](self, "_refreshAssetsByForceUpdatingCatalog:", 1);
    }
  }
  AXLogAudiogram();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412802;
    v29 = self;
    v30 = 2112;
    v31 = v11;
    v32 = 2112;
    v33 = v12;
    _os_log_error_impl(&dword_22FB4F000, v22, OS_LOG_TYPE_ERROR, "[%@]: Audiogram Ingestion Model loading: Error refresing assets %@:\n%@", buf, 0x20u);
  }

  -[AIAudiogramAssetManager assetDidUpdateWithError:](self, "assetDidUpdateWithError:", v12);
LABEL_25:

}

void __89__AIAudiogramAssetManager_assetController_didFinishRefreshingAssets_wasSuccessful_error___block_invoke(uint64_t a1, int a2)
{
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  AXLogAudiogram();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (a2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v7 = *(_QWORD *)(a1 + 40);
      v9 = 138412546;
      v10 = v6;
      v11 = 2112;
      v12 = v7;
      _os_log_impl(&dword_22FB4F000, v5, OS_LOG_TYPE_INFO, "[%@]: Audiogram Ingestion Model loading: Downloading Assets:\n%@", (uint8_t *)&v9, 0x16u);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    __89__AIAudiogramAssetManager_assetController_didFinishRefreshingAssets_wasSuccessful_error___block_invoke_cold_1(a1, v5, v8);
  }

}

- (void)assetController:(id)a3 didFinishDownloadingAsset:(id)a4 wasSuccessful:(BOOL)a5 error:(id)a6 hasRemainingDownloads:(BOOL)a7
{
  _BOOL4 v8;
  id v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  int v14;
  AIAudiogramAssetManager *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v8 = a5;
  v18 = *MEMORY[0x24BDAC8D0];
  v10 = a4;
  v11 = a6;
  AXLogAudiogram();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v8)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v14 = 138412546;
      v15 = self;
      v16 = 2112;
      v17 = v10;
      _os_log_impl(&dword_22FB4F000, v13, OS_LOG_TYPE_INFO, "[%@]: Audiogram Ingestion Model loading: Downloaded Asset:\n%@", (uint8_t *)&v14, 0x16u);
    }

    -[AIAudiogramAssetManager setLatestDownloadedAsset:](self, "setLatestDownloadedAsset:", v10);
  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[AIAudiogramAssetManager assetController:didFinishDownloadingAsset:wasSuccessful:error:hasRemainingDownloads:].cold.1((uint64_t)self, (uint64_t)v11, v13);

  }
  -[AIAudiogramAssetManager assetDidUpdateWithError:](self, "assetDidUpdateWithError:", v11);

}

- (void)assetController:(id)a3 asset:(id)a4 downloadProgressTotalWritten:(int64_t)a5 totalExpected:(int64_t)a6 isStalled:(BOOL)a7 expectedTimeRemaining:(double)a8
{
  _BOOL4 v9;
  NSObject *v13;
  float v14;
  void *v15;
  double v16;
  int v17;
  AIAudiogramAssetManager *v18;
  __int16 v19;
  int64_t v20;
  __int16 v21;
  int64_t v22;
  __int16 v23;
  _BOOL4 v24;
  __int16 v25;
  double v26;
  uint64_t v27;

  v9 = a7;
  v27 = *MEMORY[0x24BDAC8D0];
  AXLogAudiogram();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v17 = 138413314;
    v18 = self;
    v19 = 2048;
    v20 = a5;
    v21 = 2048;
    v22 = a6;
    v23 = 1024;
    v24 = v9;
    v25 = 2048;
    v26 = a8;
    _os_log_impl(&dword_22FB4F000, v13, OS_LOG_TYPE_INFO, "[%@]: Audiogram Ingestion Model progress %lli %lli %d %f", (uint8_t *)&v17, 0x30u);
  }

  if (a6 < 1)
    v14 = 0.0;
  else
    v14 = (float)a5 / (float)a6;
  -[AIAudiogramAssetManager delegate](self, "delegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v16 = v14;
  objc_msgSend(v15, "modelDownloadProgressDidUpdate:", v16);

}

- (AXAssetController)assetController
{
  return self->_assetController;
}

- (void)setAssetController:(id)a3
{
  objc_storeStrong((id *)&self->_assetController, a3);
}

- (AXAsset)latestDownloadedAsset
{
  return self->_latestDownloadedAsset;
}

- (void)setLatestDownloadedAsset:(id)a3
{
  objc_storeStrong((id *)&self->_latestDownloadedAsset, a3);
}

- (AIAudiogramAssetManagerDelegate)delegate
{
  return (AIAudiogramAssetManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)didForceCatalogRefresh
{
  return self->_didForceCatalogRefresh;
}

- (void)setDidForceCatalogRefresh:(BOOL)a3
{
  self->_didForceCatalogRefresh = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_latestDownloadedAsset, 0);
  objc_storeStrong((id *)&self->_assetController, 0);
}

void __89__AIAudiogramAssetManager_assetController_didFinishRefreshingAssets_wasSuccessful_error___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 48);
  v5 = 138412546;
  v6 = v3;
  v7 = 2112;
  v8 = v4;
  OUTLINED_FUNCTION_0_2(&dword_22FB4F000, a2, a3, "[%@]: Audiogram Ingestion Model loading: Error starting asset download:\n%@", (uint8_t *)&v5);
}

- (void)assetController:(NSObject *)a3 didFinishDownloadingAsset:wasSuccessful:error:hasRemainingDownloads:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  OUTLINED_FUNCTION_0_2(&dword_22FB4F000, a3, (uint64_t)a3, "[%@]: Audiogram Ingestion Model loading: Download failed:\n%@", (uint8_t *)&v3);
}

@end
