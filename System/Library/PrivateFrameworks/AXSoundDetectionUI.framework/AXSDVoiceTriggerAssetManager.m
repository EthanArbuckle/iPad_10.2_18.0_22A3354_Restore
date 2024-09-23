@implementation AXSDVoiceTriggerAssetManager

- (AXSDVoiceTriggerAssetManager)initWithDelegate:(id)a3
{
  id v4;
  AXSDVoiceTriggerAssetManager *v5;
  AXSDVoiceTriggerAssetManager *v6;
  uint64_t v7;
  AXVoiceTriggerAssetPolicy *assetPolicy;
  void *v9;
  void *v10;
  uint64_t v11;
  AXAssetController *assetController;
  NSObject *v13;
  void *v14;
  id v15;
  void *v16;
  objc_super v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  __int128 buf;
  Class (*v24)(uint64_t);
  void *v25;
  uint64_t *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)AXSDVoiceTriggerAssetManager;
  v5 = -[AXSDVoiceTriggerAssetManager init](&v18, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    objc_msgSend(MEMORY[0x24BDFDD78], "policy");
    v7 = objc_claimAutoreleasedReturnValue();
    assetPolicy = v6->_assetPolicy;
    v6->_assetPolicy = (AXVoiceTriggerAssetPolicy *)v7;

    v9 = (void *)MEMORY[0x24BDFDD30];
    -[AXSDVoiceTriggerAssetManager assetPolicy](v6, "assetPolicy");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "assetControllerWithPolicy:qosClass:", v10, 25);
    v11 = objc_claimAutoreleasedReturnValue();
    assetController = v6->_assetController;
    v6->_assetController = (AXAssetController *)v11;

    -[AXAssetController setUserInitiated:](v6->_assetController, "setUserInitiated:", 1);
    -[AXAssetController addObserver:](v6->_assetController, "addObserver:", v6);
    AXLogSoundActions();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v6;
      _os_log_impl(&dword_21ACD4000, v13, OS_LOG_TYPE_INFO, "[%@]: Voice Trigger Model loading: Initiating refresh", (uint8_t *)&buf, 0xCu);
    }

    v19 = 0;
    v20 = &v19;
    v21 = 0x2050000000;
    v14 = (void *)getAXSettingsClass_softClass;
    v22 = getAXSettingsClass_softClass;
    if (!getAXSettingsClass_softClass)
    {
      *(_QWORD *)&buf = MEMORY[0x24BDAC760];
      *((_QWORD *)&buf + 1) = 3221225472;
      v24 = __getAXSettingsClass_block_invoke;
      v25 = &unk_24DDF66B8;
      v26 = &v19;
      __getAXSettingsClass_block_invoke((uint64_t)&buf);
      v14 = (void *)v20[3];
    }
    v15 = objc_retainAutorelease(v14);
    _Block_object_dispose(&v19, 8);
    objc_msgSend(v15, "sharedInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setSoundActionsLastModelAccess:", CFAbsoluteTimeGetCurrent());

    -[AXAssetController refreshAssetsByForceUpdatingCatalog:updatingCatalogIfNeeded:catalogRefreshOverrideTimeout:completion:](v6->_assetController, "refreshAssetsByForceUpdatingCatalog:updatingCatalogIfNeeded:catalogRefreshOverrideTimeout:completion:", 0, 1, 0, 0);
  }

  return v6;
}

- (void)assetController:(id)a3 didFinishRefreshingAssets:(id)a4 wasSuccessful:(BOOL)a5 error:(id)a6
{
  _BOOL4 v7;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  unint64_t v14;
  AXAssetController *assetController;
  NSObject *v16;
  AXAsset *latestDownloadedAsset;
  _QWORD v18[5];
  id v19;
  id v20;
  uint8_t buf[4];
  AXSDVoiceTriggerAssetManager *v22;
  __int16 v23;
  AXAsset *v24;
  uint64_t v25;

  v7 = a5;
  v25 = *MEMORY[0x24BDAC8D0];
  v9 = a4;
  v10 = a6;
  if (v7)
  {
    objc_msgSend(v9, "lastObject");
    v11 = objc_claimAutoreleasedReturnValue();
    AXLogSoundActions();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v22 = self;
      v23 = 2112;
      v24 = (AXAsset *)v9;
      _os_log_impl(&dword_21ACD4000, v12, OS_LOG_TYPE_INFO, "[%@]: Voice Trigger Model loading:  Refreshed Assets:\n%@", buf, 0x16u);
    }

    if (-[NSObject isInstalled](v11, "isInstalled"))
    {
      AXLogSoundActions();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v22 = self;
        v23 = 2112;
        v24 = (AXAsset *)v9;
        _os_log_impl(&dword_21ACD4000, v13, OS_LOG_TYPE_INFO, "[%@]: Voice Trigger Model loading:  Newst asset already installed:\n%@", buf, 0x16u);
      }

      objc_storeStrong((id *)&self->_latestDownloadedAsset, v11);
      -[AXSDVoiceTriggerAssetManager assetDidUpdateWithError:](self, "assetDidUpdateWithError:", 0);
    }
    else if (self->_latestDownloadedAsset
           && (v14 = -[NSObject contentVersion](v11, "contentVersion"),
               v14 <= -[AXAsset contentVersion](self->_latestDownloadedAsset, "contentVersion")))
    {
      AXLogSoundActions();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        latestDownloadedAsset = self->_latestDownloadedAsset;
        *(_DWORD *)buf = 138412546;
        v22 = self;
        v23 = 2112;
        v24 = latestDownloadedAsset;
        _os_log_impl(&dword_21ACD4000, v16, OS_LOG_TYPE_INFO, "[%@]: Voice Trigger Model loading:  Latest asset up to date - keeping:\n%@", buf, 0x16u);
      }

    }
    else
    {
      assetController = self->_assetController;
      v18[0] = MEMORY[0x24BDAC760];
      v18[1] = 3221225472;
      v18[2] = __94__AXSDVoiceTriggerAssetManager_assetController_didFinishRefreshingAssets_wasSuccessful_error___block_invoke;
      v18[3] = &unk_24DDF6690;
      v18[4] = self;
      v19 = v9;
      v20 = v10;
      -[AXAssetController downloadAssets:successStartBlock:](assetController, "downloadAssets:successStartBlock:", v19, v18);

    }
  }
  else
  {
    AXLogSoundActions();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[AXSDVoiceTriggerAssetManager assetController:didFinishRefreshingAssets:wasSuccessful:error:].cold.1();
  }

}

void __94__AXSDVoiceTriggerAssetManager_assetController_didFinishRefreshingAssets_wasSuccessful_error___block_invoke(uint64_t a1, int a2)
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
  AXLogSoundActions();
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
      _os_log_impl(&dword_21ACD4000, v5, OS_LOG_TYPE_INFO, "[%@]: Voice Trigger Model loading:  Downloading Assets:\n%@", (uint8_t *)&v9, 0x16u);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    __94__AXSDVoiceTriggerAssetManager_assetController_didFinishRefreshingAssets_wasSuccessful_error___block_invoke_cold_1(a1, v5, v8);
  }

}

- (void)assetController:(id)a3 didFinishDownloadingAsset:(id)a4 wasSuccessful:(BOOL)a5 error:(id)a6 hasRemainingDownloads:(BOOL)a7
{
  _BOOL4 v8;
  id v10;
  id v11;
  NSObject *v12;
  NSObject *latestDownloadedAsset;
  AXAsset *v14;
  int v15;
  AXSDVoiceTriggerAssetManager *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v8 = a5;
  v19 = *MEMORY[0x24BDAC8D0];
  v10 = a4;
  v11 = a6;
  AXLogSoundActions();
  v12 = objc_claimAutoreleasedReturnValue();
  latestDownloadedAsset = v12;
  if (v8)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v15 = 138412546;
      v16 = self;
      v17 = 2112;
      v18 = v10;
      _os_log_impl(&dword_21ACD4000, latestDownloadedAsset, OS_LOG_TYPE_INFO, "[%@]: Voice Trigger Model loading:  Downloaded Asset:\n%@", (uint8_t *)&v15, 0x16u);
    }

    v14 = (AXAsset *)v10;
    latestDownloadedAsset = self->_latestDownloadedAsset;
    self->_latestDownloadedAsset = v14;
  }
  else if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    -[AXSDVoiceTriggerAssetManager assetController:didFinishDownloadingAsset:wasSuccessful:error:hasRemainingDownloads:].cold.1();
  }

  -[AXSDVoiceTriggerAssetManager assetDidUpdateWithError:](self, "assetDidUpdateWithError:", v11);
}

- (void)assetDidUpdateWithError:(id)a3
{
  id v4;
  NSObject *v5;
  AXAsset *latestDownloadedAsset;
  id WeakRetained;
  void *v8;
  int v9;
  AXSDVoiceTriggerAssetManager *v10;
  __int16 v11;
  AXAsset *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  AXLogSoundActions();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    latestDownloadedAsset = self->_latestDownloadedAsset;
    v9 = 138412546;
    v10 = self;
    v11 = 2112;
    v12 = latestDownloadedAsset;
    _os_log_impl(&dword_21ACD4000, v5, OS_LOG_TYPE_INFO, "[%@]: Voice Trigger Model loading:  Asset Did Update:\n%@", (uint8_t *)&v9, 0x16u);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  -[AXAsset localURL](self->_latestDownloadedAsset, "localURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "modelDidUpdate:assetVersion:withError:", v8, -[AXAsset contentVersion](self->_latestDownloadedAsset, "contentVersion"), v4);

}

- (AXAssetController)assetController
{
  return self->_assetController;
}

- (void)setAssetController:(id)a3
{
  objc_storeStrong((id *)&self->_assetController, a3);
}

- (AXVoiceTriggerAssetPolicy)assetPolicy
{
  return self->_assetPolicy;
}

- (void)setAssetPolicy:(id)a3
{
  objc_storeStrong((id *)&self->_assetPolicy, a3);
}

- (AXAsset)latestDownloadedAsset
{
  return self->_latestDownloadedAsset;
}

- (void)setLatestDownloadedAsset:(id)a3
{
  objc_storeStrong((id *)&self->_latestDownloadedAsset, a3);
}

- (AXSDVoiceTriggerAssetManagerDelegate)delegate
{
  return (AXSDVoiceTriggerAssetManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_latestDownloadedAsset, 0);
  objc_storeStrong((id *)&self->_assetPolicy, 0);
  objc_storeStrong((id *)&self->_assetController, 0);
}

- (void)assetController:didFinishRefreshingAssets:wasSuccessful:error:.cold.1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21ACD4000, v0, (uint64_t)v0, "[%@]: Voice Trigger Model loading:  Error refresing assets:\n%@", v1);
  OUTLINED_FUNCTION_2();
}

void __94__AXSDVoiceTriggerAssetManager_assetController_didFinishRefreshingAssets_wasSuccessful_error___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
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
  OUTLINED_FUNCTION_0(&dword_21ACD4000, a2, a3, "[%@]: Voice Trigger Model loading:  Error starting asset download:\n%@", (uint8_t *)&v5);
  OUTLINED_FUNCTION_2();
}

- (void)assetController:didFinishDownloadingAsset:wasSuccessful:error:hasRemainingDownloads:.cold.1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21ACD4000, v0, (uint64_t)v0, "[%@]: Voice Trigger Model loading: Download failed:\n%@", v1);
  OUTLINED_FUNCTION_2();
}

@end
