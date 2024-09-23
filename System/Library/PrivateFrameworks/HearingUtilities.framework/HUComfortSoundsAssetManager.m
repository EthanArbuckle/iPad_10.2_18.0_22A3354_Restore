@implementation HUComfortSoundsAssetManager

- (HUComfortSoundsAssetManager)init
{
  HUComfortSoundsAssetManager *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  AXAssetController *assetController;
  uint64_t v7;
  NSMutableDictionary *assetDownloadProgress;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)HUComfortSoundsAssetManager;
  v2 = -[HUComfortSoundsAssetManager init](&v10, sel_init);
  if (v2)
  {
    v3 = (void *)MEMORY[0x1E0CF2D70];
    objc_msgSend(MEMORY[0x1E0CF2D90], "policy");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "assetControllerWithPolicy:qosClass:", v4, 25);
    v5 = objc_claimAutoreleasedReturnValue();
    assetController = v2->_assetController;
    v2->_assetController = (AXAssetController *)v5;

    -[AXAssetController setUserInitiated:](v2->_assetController, "setUserInitiated:", 1);
    -[AXAssetController addObserver:](v2->_assetController, "addObserver:", v2);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v7 = objc_claimAutoreleasedReturnValue();
    assetDownloadProgress = v2->_assetDownloadProgress;
    v2->_assetDownloadProgress = (NSMutableDictionary *)v7;

    -[HUComfortSoundsAssetManager refreshAssets](v2, "refreshAssets");
  }
  return v2;
}

- (void)refreshAssets
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  uint8_t buf[4];
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  CSInitializeLogging();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Refreshing assets"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUComfortSoundsAssetManager refreshAssets]", 44, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)*MEMORY[0x1E0D2F918];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F918], OS_LOG_TYPE_DEFAULT))
  {
    v6 = objc_retainAutorelease(v4);
    v7 = v5;
    *(_DWORD *)buf = 136446210;
    v9 = objc_msgSend(v6, "UTF8String");
    _os_log_impl(&dword_1DE311000, v7, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
  -[AXAssetController refreshAssetsByForceUpdatingCatalog:updatingCatalogIfNeeded:catalogRefreshOverrideTimeout:completion:](self->_assetController, "refreshAssetsByForceUpdatingCatalog:updatingCatalogIfNeeded:catalogRefreshOverrideTimeout:completion:", objc_msgSend(MEMORY[0x1E0D2F990], "isInternalInstall"), 1, 0, 0);
}

- (NSDictionary)assetDownloadProgress
{
  HUComfortSoundsAssetManager *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)-[NSMutableDictionary copy](v2->_assetDownloadProgress, "copy");
  objc_sync_exit(v2);

  return (NSDictionary *)v3;
}

- (id)assetWithId:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  -[HUComfortSoundsAssetManager availableAssets](self, "availableAssets");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __43__HUComfortSoundsAssetManager_assetWithId___block_invoke;
  v11[3] = &unk_1EA8E82C8;
  v6 = v4;
  v12 = v6;
  v7 = objc_msgSend(v5, "indexOfObjectPassingTest:", v11);

  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = 0;
  }
  else
  {
    -[HUComfortSoundsAssetManager availableAssets](self, "availableAssets");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndex:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

uint64_t __43__HUComfortSoundsAssetManager_assetWithId___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "assetId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (void)downloadAssetWithId:(id)a3
{
  uint64_t v4;
  void *v5;
  AXAssetController *assetController;
  void *v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  -[HUComfortSoundsAssetManager assetWithId:](self, "assetWithId:", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
  {
    assetController = self->_assetController;
    v10[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __51__HUComfortSoundsAssetManager_downloadAssetWithId___block_invoke;
    v8[3] = &unk_1EA8E82F0;
    v9 = v5;
    -[AXAssetController downloadAssets:successStartBlock:](assetController, "downloadAssets:successStartBlock:", v7, v8);

  }
}

void __51__HUComfortSoundsAssetManager_downloadAssetWithId___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  uint8_t buf[4];
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  CSInitializeLogging();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Started downloading %@"), *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUComfortSoundsAssetManager downloadAssetWithId:]_block_invoke", 78, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)*MEMORY[0x1E0D2F918];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F918], OS_LOG_TYPE_DEFAULT))
  {
    v5 = objc_retainAutorelease(v3);
    v6 = v4;
    *(_DWORD *)buf = 136446210;
    v8 = objc_msgSend(v5, "UTF8String");
    _os_log_impl(&dword_1DE311000, v6, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
}

- (void)removeAssetWithId:(id)a3
{
  uint64_t v4;
  void *v5;
  AXAssetController *assetController;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  -[HUComfortSoundsAssetManager assetWithId:](self, "assetWithId:", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
  {
    assetController = self->_assetController;
    v8[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXAssetController purgeAssets:completion:](assetController, "purgeAssets:completion:", v7, 0);

  }
}

- (void)assetController:(id)a3 didFinishRefreshingAssets:(id)a4 wasSuccessful:(BOOL)a5 error:(id)a6
{
  _BOOL4 v7;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  uint8_t buf[4];
  uint64_t v23;
  uint64_t v24;

  v7 = a5;
  v24 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = a6;
  CSInitializeLogging();
  if (v10 || !v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error loading assets %d = %@"), v7, v10);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUComfortSoundsAssetManager assetController:didFinishRefreshingAssets:wasSuccessful:error:]", 106, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)*MEMORY[0x1E0D2F918];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F918], OS_LOG_TYPE_DEFAULT))
    {
      v20 = objc_retainAutorelease(v18);
      v21 = v19;
      *(_DWORD *)buf = 136446210;
      v23 = objc_msgSend(v20, "UTF8String");
      _os_log_impl(&dword_1DE311000, v21, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Found Assets %@"), v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUComfortSoundsAssetManager assetController:didFinishRefreshingAssets:wasSuccessful:error:]", 98, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)*MEMORY[0x1E0D2F918];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F918], OS_LOG_TYPE_DEFAULT))
    {
      v14 = objc_retainAutorelease(v12);
      v15 = v13;
      *(_DWORD *)buf = 136446210;
      v23 = objc_msgSend(v14, "UTF8String");
      _os_log_impl(&dword_1DE311000, v15, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

    }
    objc_msgSend(v9, "sortedArrayUsingComparator:", &__block_literal_global_0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUComfortSoundsAssetManager setAvailableAssets:](self, "setAvailableAssets:", v16);

    -[HUComfortSoundsAssetManager delegate](self, "delegate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "availableAssetsDidUpdate");
  }

}

uint64_t __93__HUComfortSoundsAssetManager_assetController_didFinishRefreshingAssets_wasSuccessful_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v4 = a3;
  objc_msgSend(a2, "properties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForKey:", CFSTR("SoundGroup"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "properties");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "valueForKey:", CFSTR("SoundGroup"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "compare:", v8);

  return v9;
}

- (void)assetController:(id)a3 asset:(id)a4 downloadProgressTotalWritten:(int64_t)a5 totalExpected:(int64_t)a6 isStalled:(BOOL)a7 expectedTimeRemaining:(double)a8
{
  id v12;
  HUComfortSoundsAssetManager *v13;
  double v14;
  void *v15;
  NSMutableDictionary *assetDownloadProgress;
  void *v17;
  void *v18;
  id v19;

  v19 = a3;
  v12 = a4;
  v13 = self;
  objc_sync_enter(v13);
  *(float *)&v14 = (float)a5 / (float)a6;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  assetDownloadProgress = v13->_assetDownloadProgress;
  objc_msgSend(v12, "assetId");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](assetDownloadProgress, "setObject:forKeyedSubscript:", v15, v17);

  objc_sync_exit(v13);
  -[HUComfortSoundsAssetManager delegate](v13, "delegate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "assetDownloadDidUpdate");

}

- (void)assetController:(id)a3 didFinishDownloadingAsset:(id)a4 wasSuccessful:(BOOL)a5 error:(id)a6 hasRemainingDownloads:(BOOL)a7
{
  _BOOL4 v8;
  id v11;
  id v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  NSObject *v26;
  HUComfortSoundsAssetManager *v27;
  void *v28;
  NSMutableDictionary *assetDownloadProgress;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  NSObject *v38;
  uint64_t v39;
  id v40;
  uint8_t buf[4];
  uint64_t v42;
  uint64_t v43;

  v8 = a5;
  v43 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v40 = a6;
  v13 = 0.0;
  if (v8)
  {
    +[HUComfortSound comfortSoundWithAsset:](HUComfortSound, "comfortSoundWithAsset:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[HUComfortSoundsSettings sharedInstance](HUComfortSoundsSettings, "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "selectedComfortSound");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "soundGroup");
    if (v17 == objc_msgSend(v14, "soundGroup"))
    {
      +[HUComfortSoundsSettings sharedInstance](HUComfortSoundsSettings, "sharedInstance");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "selectedComfortSound");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v14, "isEqual:", v19);

      if ((v20 & 1) == 0)
      {
        +[HUComfortSoundsSettings sharedInstance](HUComfortSoundsSettings, "sharedInstance");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setSelectedComfortSound:", v14);

        CSInitializeLogging();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Resetting selected bg sound %@"), v14);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUComfortSoundsAssetManager assetController:didFinishDownloadingAsset:wasSuccessful:error:hasRemainingDownloads:]", 127, v22, v40);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = (void *)*MEMORY[0x1E0D2F918];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F918], OS_LOG_TYPE_DEFAULT))
        {
          v25 = objc_retainAutorelease(v23);
          v26 = v24;
          *(_DWORD *)buf = 136446210;
          v42 = objc_msgSend(v25, "UTF8String");
          _os_log_impl(&dword_1DE311000, v26, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

        }
      }
    }
    else
    {

    }
    v13 = 1.0;
  }
  v27 = self;
  objc_sync_enter(v27);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v13);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  assetDownloadProgress = v27->_assetDownloadProgress;
  objc_msgSend(v12, "assetId");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](assetDownloadProgress, "setObject:forKeyedSubscript:", v28, v30);

  objc_sync_exit(v27);
  -[HUComfortSoundsAssetManager delegate](v27, "delegate");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "assetDownloadDidUpdate");

  CSInitializeLogging();
  v32 = (void *)MEMORY[0x1E0CB3940];
  +[HUComfortSound comfortSoundWithAsset:](HUComfortSound, "comfortSoundWithAsset:", v12);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "stringWithFormat:", CFSTR("Finished downloading asset %@ - %@"), v12, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUComfortSoundsAssetManager assetController:didFinishDownloadingAsset:wasSuccessful:error:hasRemainingDownloads:]", 137, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = (void *)*MEMORY[0x1E0D2F918];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F918], OS_LOG_TYPE_DEFAULT))
  {
    v37 = objc_retainAutorelease(v35);
    v38 = v36;
    v39 = objc_msgSend(v37, "UTF8String");
    *(_DWORD *)buf = 136446210;
    v42 = v39;
    _os_log_impl(&dword_1DE311000, v38, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
}

- (void)assetController:(id)a3 didFinishPurgingAssets:(id)a4 wasSuccessful:(BOOL)a5 error:(id)a6
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  uint8_t buf[4];
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  CSInitializeLogging();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Finished purging assets %@"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HUComfortSoundsAssetManager assetController:didFinishPurgingAssets:wasSuccessful:error:]", 142, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)*MEMORY[0x1E0D2F918];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F918], OS_LOG_TYPE_DEFAULT))
  {
    v11 = objc_retainAutorelease(v9);
    v12 = v10;
    *(_DWORD *)buf = 136446210;
    v15 = objc_msgSend(v11, "UTF8String");
    _os_log_impl(&dword_1DE311000, v12, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
  -[HUComfortSoundsAssetManager delegate](self, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "availableAssetsDidUpdate");

}

- (NSArray)availableAssets
{
  return self->_availableAssets;
}

- (void)setAvailableAssets:(id)a3
{
  objc_storeStrong((id *)&self->_availableAssets, a3);
}

- (void)setAssetDownloadProgress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (HUComfortSoundsAssetManagerDelegate)delegate
{
  return (HUComfortSoundsAssetManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (AXAssetController)assetController
{
  return self->_assetController;
}

- (void)setAssetController:(id)a3
{
  objc_storeStrong((id *)&self->_assetController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_availableAssets, 0);
  objc_storeStrong((id *)&self->_assetDownloadProgress, 0);
}

@end
