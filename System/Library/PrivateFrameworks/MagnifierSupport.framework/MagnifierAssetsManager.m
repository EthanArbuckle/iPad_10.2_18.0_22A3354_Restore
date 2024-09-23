@implementation MagnifierAssetsManager

+ (MagnifierAssetsManager)sharedInstance
{
  if (sharedInstance_onceToken[0] != -1)
    dispatch_once(sharedInstance_onceToken, &__block_literal_global_3);
  return (MagnifierAssetsManager *)(id)sharedInstance__Shared;
}

void __40__MagnifierAssetsManager_sharedInstance__block_invoke()
{
  MagnifierAssetsManager *v0;
  void *v1;

  v0 = objc_alloc_init(MagnifierAssetsManager);
  v1 = (void *)sharedInstance__Shared;
  sharedInstance__Shared = (uint64_t)v0;

}

- (MagnifierAssetsManager)init
{
  MagnifierAssetsManager *v2;
  uint64_t v3;
  AXMagnifierAssetPolicy *assetPolicy;
  uint64_t v5;
  AXAssetController *assetController;
  NSArray *v7;
  NSArray *cachedAssets;
  NSArray *v9;
  NSArray *cachedDownloadableAssets;
  NSArray *v11;
  NSArray *assetsNeedingDownload;
  NSDictionary *v13;
  NSDictionary *expectedDownloadSizes;
  NSDictionary *v15;
  NSDictionary *totalInstalledSizes;
  NSDictionary *v17;
  NSDictionary *assetDownloadPercent;
  void *v19;
  void *v20;
  uint64_t v21;
  AXAssetController *imageCaptionAssetController;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)MagnifierAssetsManager;
  v2 = -[MagnifierAssetsManager init](&v24, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDFDD68], "policy");
    v3 = objc_claimAutoreleasedReturnValue();
    assetPolicy = v2->_assetPolicy;
    v2->_assetPolicy = (AXMagnifierAssetPolicy *)v3;

    objc_msgSend(MEMORY[0x24BDFDD30], "assetControllerWithPolicy:qosClass:", v2->_assetPolicy, 25);
    v5 = objc_claimAutoreleasedReturnValue();
    assetController = v2->_assetController;
    v2->_assetController = (AXAssetController *)v5;

    -[AXAssetController setUserInitiated:](v2->_assetController, "setUserInitiated:", 1);
    -[AXAssetController addObserver:](v2->_assetController, "addObserver:", v2);
    v7 = (NSArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    cachedAssets = v2->_cachedAssets;
    v2->_cachedAssets = v7;

    v9 = (NSArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    cachedDownloadableAssets = v2->_cachedDownloadableAssets;
    v2->_cachedDownloadableAssets = v9;

    v11 = (NSArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    assetsNeedingDownload = v2->_assetsNeedingDownload;
    v2->_assetsNeedingDownload = v11;

    v13 = (NSDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    expectedDownloadSizes = v2->_expectedDownloadSizes;
    v2->_expectedDownloadSizes = v13;

    v15 = (NSDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    totalInstalledSizes = v2->_totalInstalledSizes;
    v2->_totalInstalledSizes = v15;

    v17 = (NSDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    assetDownloadPercent = v2->_assetDownloadPercent;
    v2->_assetDownloadPercent = v17;

    v19 = (void *)MEMORY[0x24BDFDD30];
    objc_msgSend(MEMORY[0x24BDFDD60], "policy");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "assetControllerWithPolicy:qosClass:", v20, 25);
    v21 = objc_claimAutoreleasedReturnValue();
    imageCaptionAssetController = v2->_imageCaptionAssetController;
    v2->_imageCaptionAssetController = (AXAssetController *)v21;

    -[AXAssetController setUserInitiated:](v2->_imageCaptionAssetController, "setUserInitiated:", 1);
    -[AXAssetController addObserver:](v2->_imageCaptionAssetController, "addObserver:", v2);
  }
  return v2;
}

- (id)baseURLForType:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  if (a3)
  {
    if (a3 != 1)
      return 0;
    v5 = 120;
  }
  else
  {
    v5 = 104;
  }
  return (id)objc_msgSend(*(id *)((char *)&self->super.isa + v5), "copy", v3, v4);
}

- (id)modelURLForType:(unint64_t)a3 timeout:(double)a4
{
  void *v6;
  void *v7;

  -[MagnifierAssetsManager baseURLForType:](self, "baseURLForType:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    self->_assetDownloadFailed = 0;
    -[MagnifierAssetsManager _modelURLForType:baseURL:](self, "_modelURLForType:baseURL:", a3, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
    self->_assetDownloadFailed = 1;
  }

  return v7;
}

- (id)downloadAssetsWithName:(id)a3
{
  id v4;
  NSArray *v5;
  NSArray *assetsNeedingDownload;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  NSDictionary *assetDownloadPercent;
  void *v16;
  void *v17;
  void *v18;
  AXAssetController *assetController;
  void *v20;
  uint64_t v21;
  NSDictionary *v22;
  void *v23;
  id v25;
  NSArray *obj;
  uint64_t v27;
  _QWORD v28[5];
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  void *v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[AXMagnifierAssetPolicy assetsToDownloadFromRefreshedAssets:](self->_assetPolicy, "assetsToDownloadFromRefreshedAssets:", self->_cachedDownloadableAssets);
  v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
  assetsNeedingDownload = self->_assetsNeedingDownload;
  self->_assetsNeedingDownload = v5;

  v7 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v25 = v4;
  if (-[NSArray count](self->_assetsNeedingDownload, "count"))
  {
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    obj = self->_assetsNeedingDownload;
    v8 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    if (v8)
    {
      v9 = v8;
      v27 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v30 != v27)
            objc_enumerationMutation(obj);
          v11 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
          objc_msgSend(v11, "properties", v25);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("AssetName"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "isEqualToString:", v4);

          if (v14)
          {
            assetDownloadPercent = self->_assetDownloadPercent;
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", 0.0);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "properties");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("AssetName"));
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSDictionary setValue:forKey:](assetDownloadPercent, "setValue:forKey:", v16, v18);

            assetController = self->_assetController;
            v33 = v11;
            objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v33, 1);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v28[0] = MEMORY[0x24BDAC760];
            v28[1] = 3221225472;
            v28[2] = __49__MagnifierAssetsManager_downloadAssetsWithName___block_invoke;
            v28[3] = &unk_24EF97D80;
            v28[4] = self;
            -[AXAssetController downloadAssets:successStartBlock:](assetController, "downloadAssets:successStartBlock:", v20, v28);

            objc_msgSend(v7, "arrayByAddingObject:", v11);
            v21 = objc_claimAutoreleasedReturnValue();

            v7 = (id)v21;
            v4 = v25;
          }
        }
        v9 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
      }
      while (v9);
    }

  }
  else
  {
    v22 = self->_assetDownloadPercent;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", 100.0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary setValue:forKey:](v22, "setValue:forKey:", v23, v25);

    v4 = v25;
  }

  return v7;
}

void __49__MagnifierAssetsManager_downloadAssetsWithName___block_invoke(uint64_t a1)
{
  NSObject *v2;

  AXLogAssetLoader();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __49__MagnifierAssetsManager_downloadAssetsWithName___block_invoke_cold_1(a1, v2);

}

- (void)assetController:(id)a3 didFinishRefreshingAssets:(id)a4 wasSuccessful:(BOOL)a5 error:(id)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  int v16;
  NSObject *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  void *v25;
  NSObject *v26;
  NSDictionary *expectedDownloadSizes;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSArray *v32;
  NSArray *cachedDownloadableAssets;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t i;
  void *v42;
  NSDictionary *totalInstalledSizes;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  AXAssetController *assetController;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t j;
  void *v61;
  NSDictionary *v62;
  void *v63;
  void *v64;
  void *v65;
  id v66;
  id v67;
  id v68;
  uint64_t v69;
  id obj;
  id obja;
  uint64_t v72;
  uint64_t v73;
  id v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  uint64_t v78;
  _QWORD v79[6];
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  _QWORD v88[6];
  _QWORD v89[6];
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  _BYTE v98[128];
  void *v99;
  _BYTE v100[128];
  _BYTE v101[128];
  uint8_t v102[128];
  uint8_t buf[4];
  MagnifierAssetsManager *v104;
  __int16 v105;
  id v106;
  __int16 v107;
  id v108;
  uint64_t v109;

  v7 = a5;
  v109 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  AXLogAssetLoader();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412802;
    v104 = self;
    v105 = 2112;
    v106 = v11;
    v107 = 2112;
    v108 = v12;
    _os_log_impl(&dword_2272F4000, v13, OS_LOG_TYPE_INFO, "[%@]: didFinishRefreshingAssets: (%@). error: %@", buf, 0x20u);
  }

  if (v7)
  {
    if (objc_msgSend(v11, "count")
      && (objc_msgSend(v11, "objectAtIndexedSubscript:", 0),
          v14 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v14, "assetType"),
          v15 = (void *)objc_claimAutoreleasedReturnValue(),
          v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("com.apple.MobileAsset.ImageCaptionModel")),
          v15,
          v14,
          v16))
    {
      -[MagnifierAssetsManager manageImageCaptionModelAssets:](self, "manageImageCaptionModelAssets:", v11);
    }
    else
    {
      v66 = v12;
      v68 = v10;
      v74 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      v94 = 0u;
      v95 = 0u;
      v96 = 0u;
      v97 = 0u;
      v67 = v11;
      v18 = v11;
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v94, v102, 16);
      if (v19)
      {
        v20 = v19;
        v21 = *(_QWORD *)v95;
        v69 = *(_QWORD *)v95;
        obj = v18;
        do
        {
          v22 = 0;
          v72 = v20;
          do
          {
            v23 = v21;
            if (*(_QWORD *)v95 != v21)
              objc_enumerationMutation(v18);
            v24 = v18;
            v75 = v22;
            v25 = *(void **)(*((_QWORD *)&v94 + 1) + 8 * v22);
            AXLogAssetLoader();
            v26 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412546;
              v104 = self;
              v105 = 2112;
              v106 = v24;
              _os_log_impl(&dword_2272F4000, v26, OS_LOG_TYPE_INFO, "[%@]: Refreshed Assets:\n%@", buf, 0x16u);
            }

            expectedDownloadSizes = self->_expectedDownloadSizes;
            objc_msgSend(v25, "downloadSize");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "properties");
            v77 = v25;
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("AssetName"));
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSDictionary setValue:forKey:](expectedDownloadSizes, "setValue:forKey:", v28, v30);

            v31 = v25;
            -[NSArray arrayByAddingObject:](self->_cachedDownloadableAssets, "arrayByAddingObject:", v25);
            v32 = (NSArray *)objc_claimAutoreleasedReturnValue();
            cachedDownloadableAssets = self->_cachedDownloadableAssets;
            self->_cachedDownloadableAssets = v32;

            if (objc_msgSend(v25, "isInstalled"))
            {
              -[MagnifierAssetsManager _updateDownloadedValuesForAsset:](self, "_updateDownloadedValuesForAsset:", v25);
              v34 = v74;
              objc_msgSend(v74, "arrayByAddingObject:", v25);
              v74 = (id)objc_claimAutoreleasedReturnValue();
              v18 = v24;
              v21 = v23;
            }
            else
            {
              objc_msgSend(v25, "properties");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("AssetName"));
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              -[MagnifierAssetsManager downloadAssetsWithName:](self, "downloadAssetsWithName:", v36);
              v37 = (void *)objc_claimAutoreleasedReturnValue();

              v92 = 0u;
              v93 = 0u;
              v90 = 0u;
              v91 = 0u;
              v34 = v37;
              v38 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v90, v101, 16);
              if (v38)
              {
                v39 = v38;
                v40 = *(_QWORD *)v91;
                do
                {
                  for (i = 0; i != v39; ++i)
                  {
                    if (*(_QWORD *)v91 != v40)
                      objc_enumerationMutation(v34);
                    v42 = *(void **)(*((_QWORD *)&v90 + 1) + 8 * i);
                    v89[0] = MEMORY[0x24BDAC760];
                    v89[1] = 3221225472;
                    v89[2] = __88__MagnifierAssetsManager_assetController_didFinishRefreshingAssets_wasSuccessful_error___block_invoke;
                    v89[3] = &unk_24EF97DA8;
                    v89[4] = self;
                    v89[5] = v42;
                    -[MagnifierAssetsManager _performWithLock:](self, "_performWithLock:", v89);
                    totalInstalledSizes = self->_totalInstalledSizes;
                    objc_msgSend(v42, "downloadSize");
                    v44 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v42, "properties");
                    v45 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v45, "objectForKeyedSubscript:", CFSTR("AssetName"));
                    v46 = (void *)objc_claimAutoreleasedReturnValue();
                    -[NSDictionary setValue:forKey:](totalInstalledSizes, "setValue:forKey:", v44, v46);

                  }
                  v39 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v90, v101, 16);
                }
                while (v39);
              }

              v21 = v69;
              v18 = obj;
              v20 = v72;
              v31 = v77;
            }

            objc_msgSend(MEMORY[0x24BDFDD38], "store");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v47, "recordLastAssetAccess:", v31);

            v88[0] = MEMORY[0x24BDAC760];
            v88[1] = 3221225472;
            v88[2] = __88__MagnifierAssetsManager_assetController_didFinishRefreshingAssets_wasSuccessful_error___block_invoke_2;
            v88[3] = &unk_24EF97DA8;
            v88[4] = self;
            v88[5] = v31;
            -[MagnifierAssetsManager _performWithLock:](self, "_performWithLock:", v88);
            v22 = v75 + 1;
          }
          while (v75 + 1 != v20);
          v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v94, v102, 16);
        }
        while (v20);
      }

      v48 = v74;
      if (objc_msgSend(v74, "count"))
      {
        -[AXMagnifierAssetPolicy assetsToPurgeFromInstalledAssets:](self->_assetPolicy, "assetsToPurgeFromInstalledAssets:", v18);
        v84 = 0u;
        v85 = 0u;
        v86 = 0u;
        v87 = 0u;
        obja = (id)objc_claimAutoreleasedReturnValue();
        v76 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v84, v100, 16);
        if (v76)
        {
          v73 = *(_QWORD *)v85;
          do
          {
            v49 = 0;
            do
            {
              if (*(_QWORD *)v85 != v73)
                objc_enumerationMutation(obja);
              v78 = v49;
              assetController = self->_assetController;
              v99 = *(void **)(*((_QWORD *)&v84 + 1) + 8 * v49);
              v50 = v99;
              objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v99, 1);
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              -[AXAssetController purgeAssets:completion:](assetController, "purgeAssets:completion:", v52, 0);

              objc_msgSend(v50, "properties");
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("AssetName"));
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              -[MagnifierAssetsManager downloadAssetsWithName:](self, "downloadAssetsWithName:", v54);
              v55 = (void *)objc_claimAutoreleasedReturnValue();

              v82 = 0u;
              v83 = 0u;
              v80 = 0u;
              v81 = 0u;
              v56 = v55;
              v57 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v80, v98, 16);
              if (v57)
              {
                v58 = v57;
                v59 = *(_QWORD *)v81;
                do
                {
                  for (j = 0; j != v58; ++j)
                  {
                    if (*(_QWORD *)v81 != v59)
                      objc_enumerationMutation(v56);
                    v61 = *(void **)(*((_QWORD *)&v80 + 1) + 8 * j);
                    v79[0] = MEMORY[0x24BDAC760];
                    v79[1] = 3221225472;
                    v79[2] = __88__MagnifierAssetsManager_assetController_didFinishRefreshingAssets_wasSuccessful_error___block_invoke_3;
                    v79[3] = &unk_24EF97DA8;
                    v79[4] = self;
                    v79[5] = v61;
                    -[MagnifierAssetsManager _performWithLock:](self, "_performWithLock:", v79);
                    v62 = self->_totalInstalledSizes;
                    objc_msgSend(v61, "downloadSize");
                    v63 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v61, "properties");
                    v64 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v64, "objectForKeyedSubscript:", CFSTR("AssetName"));
                    v65 = (void *)objc_claimAutoreleasedReturnValue();
                    -[NSDictionary setValue:forKey:](v62, "setValue:forKey:", v63, v65);

                  }
                  v58 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v80, v98, 16);
                }
                while (v58);
              }

              v49 = v78 + 1;
            }
            while (v78 + 1 != v76);
            v76 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v84, v100, 16);
          }
          while (v76);
        }

        v48 = v74;
      }
      self->_assetDownloadFailed = 0;

      v11 = v67;
      v10 = v68;
      v12 = v66;
    }
  }
  else
  {
    self->_assetDownloadFailed = 1;
    AXLogAssetLoader();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[MagnifierAssetsManager assetController:didFinishRefreshingAssets:wasSuccessful:error:].cold.1();

  }
}

uint64_t __88__MagnifierAssetsManager_assetController_didFinishRefreshingAssets_wasSuccessful_error___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateAsset:", *(_QWORD *)(a1 + 40));
}

uint64_t __88__MagnifierAssetsManager_assetController_didFinishRefreshingAssets_wasSuccessful_error___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateAsset:", *(_QWORD *)(a1 + 40));
}

uint64_t __88__MagnifierAssetsManager_assetController_didFinishRefreshingAssets_wasSuccessful_error___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateAsset:", *(_QWORD *)(a1 + 40));
}

- (void)assetController:(id)a3 didFinishDownloadingAsset:(id)a4 wasSuccessful:(BOOL)a5 error:(id)a6 hasRemainingDownloads:(BOOL)a7
{
  _BOOL4 v8;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  char v14;
  NSArray *v15;
  NSArray *cachedAssets;
  NSObject *v17;
  int v18;
  MagnifierAssetsManager *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v8 = a5;
  v22 = *MEMORY[0x24BDAC8D0];
  v10 = a4;
  v11 = a6;
  if (v8)
  {
    AXLogAssetLoader();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v18 = 138412546;
      v19 = self;
      v20 = 2112;
      v21 = v10;
      _os_log_impl(&dword_2272F4000, v12, OS_LOG_TYPE_INFO, "[%@]:  Downloaded Asset:\n%@", (uint8_t *)&v18, 0x16u);
    }

    objc_msgSend(v10, "assetType");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("com.apple.MobileAsset.ImageCaptionModel"));

    if ((v14 & 1) == 0)
    {
      -[MagnifierAssetsManager _updateAsset:](self, "_updateAsset:", v10);
      -[NSArray arrayByAddingObject:](self->_cachedAssets, "arrayByAddingObject:", v10);
      v15 = (NSArray *)objc_claimAutoreleasedReturnValue();
      cachedAssets = self->_cachedAssets;
      self->_cachedAssets = v15;

      -[MagnifierAssetsManager _updateDownloadedValuesForAsset:](self, "_updateDownloadedValuesForAsset:", v10);
      self->_assetDownloadFailed = 0;
    }
  }
  else
  {
    self->_assetDownloadFailed = 1;
    AXLogAssetLoader();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[MagnifierAssetsManager assetController:didFinishDownloadingAsset:wasSuccessful:error:hasRemainingDownloads:].cold.1();

  }
}

- (void)assetController:(id)a3 asset:(id)a4 downloadProgressTotalWritten:(int64_t)a5 totalExpected:(int64_t)a6 isStalled:(BOOL)a7 expectedTimeRemaining:(double)a8
{
  id v11;
  NSObject *v12;
  void *v13;
  char v14;
  NSDictionary *assetDownloadPercent;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  MagnifierAssetsManager *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  int64_t v24;
  __int16 v25;
  int64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v11 = a4;
  AXLogAssetLoader();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v19 = 138413058;
    v20 = self;
    v21 = 2112;
    v22 = v11;
    v23 = 2048;
    v24 = a5;
    v25 = 2048;
    v26 = a6;
    _os_log_impl(&dword_2272F4000, v12, OS_LOG_TYPE_INFO, "[%@]: Downloading Asset:\n%@ %lld written, %lld expected.", (uint8_t *)&v19, 0x2Au);
  }

  objc_msgSend(v11, "assetType");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("com.apple.MobileAsset.ImageCaptionModel"));

  if ((v14 & 1) == 0)
  {
    assetDownloadPercent = self->_assetDownloadPercent;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", (double)a5 / (double)a6);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "properties");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("AssetName"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary setValue:forKey:](assetDownloadPercent, "setValue:forKey:", v16, v18);

  }
}

- (void)assetController:(id)a3 didFinishPurgingAssets:(id)a4 wasSuccessful:(BOOL)a5 error:(id)a6
{
  _BOOL4 v7;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  int v13;
  MagnifierAssetsManager *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  _BOOL4 v18;
  uint64_t v19;

  v7 = a5;
  v19 = *MEMORY[0x24BDAC8D0];
  v9 = a4;
  v10 = a6;
  AXLogAssetLoader();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v10)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[MagnifierAssetsManager assetController:didFinishPurgingAssets:wasSuccessful:error:].cold.1();
  }
  else if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v13 = 138412802;
    v14 = self;
    v15 = 2048;
    v16 = objc_msgSend(v9, "count");
    v17 = 1024;
    v18 = v7;
    _os_log_debug_impl(&dword_2272F4000, v12, OS_LOG_TYPE_DEBUG, "[%@]: %lu number of assets purged. Success status: %d", (uint8_t *)&v13, 0x1Cu);
  }

}

- (id)_modelURLForType:(unint64_t)a3 baseURL:(id)a4
{
  id v5;
  void *v6;
  const __CFString *v7;
  void *v8;

  v5 = a4;
  v6 = v5;
  if (a3)
  {
    if (a3 != 1)
    {
      v8 = 0;
      goto LABEL_7;
    }
    v7 = CFSTR("SignDetector.mlmodel");
  }
  else
  {
    v7 = CFSTR("DoorAttributesClassifier.mlmodel");
  }
  objc_msgSend(v5, "URLByAppendingPathComponent:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:

  return v8;
}

- (id)assetPropertiesForModelType:(unint64_t)a3
{
  void *v3;

  if (a3 == 1)
  {
    -[MagnifierAssetsManager signDetectorAssetProperties](self, "signDetectorAssetProperties");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a3)
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionary");
    else
      -[MagnifierAssetsManager doorAttributesAssetProperties](self, "doorAttributesAssetProperties");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (void)_updateAsset:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  objc_msgSend(v13, "properties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("AssetName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "isEqualToString:", CFSTR("DoorAttributesClassifier")))
  {
    objc_msgSend(v13, "localURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    -[MagnifierAssetsManager setDoorAttributesBaseURL:](self, "setDoorAttributesBaseURL:", v7);

    objc_msgSend(v13, "properties");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copy");
    -[MagnifierAssetsManager setDoorAttributesAssetProperties:](self, "setDoorAttributesAssetProperties:", v9);
LABEL_5:

    goto LABEL_6;
  }
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("SignDetector")))
  {
    objc_msgSend(v13, "localURL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "copy");
    -[MagnifierAssetsManager setSignDetectorBaseURL:](self, "setSignDetectorBaseURL:", v11);

    objc_msgSend(v13, "properties");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copy");
    -[MagnifierAssetsManager setSignDetectorAssetProperties:](self, "setSignDetectorAssetProperties:", v9);
    goto LABEL_5;
  }
LABEL_6:
  -[MagnifierAssetsManager delegate](self, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "updateAssetURLs");

}

- (void)_performWithLock:(id)a3
{
  os_unfair_lock_s *p_lock;
  void (**v4)(_QWORD);

  p_lock = &self->_lock;
  v4 = (void (**)(_QWORD))a3;
  os_unfair_lock_lock(p_lock);
  v4[2](v4);

  os_unfair_lock_unlock(p_lock);
}

- (void)refreshAssets
{
  -[AXAssetController refreshAssetsByForceUpdatingCatalog:updatingCatalogIfNeeded:catalogRefreshOverrideTimeout:completion:](self->_assetController, "refreshAssetsByForceUpdatingCatalog:updatingCatalogIfNeeded:catalogRefreshOverrideTimeout:completion:", 0, 1, 0, 0);
}

- (int64_t)totalSizeOccupiedWithName:(id)a3
{
  void *v3;
  int64_t v4;

  -[NSDictionary objectForKeyedSubscript:](self->_totalInstalledSizes, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "longLongValue");

  return v4;
}

- (int64_t)totalSizeExpectedWithName:(id)a3
{
  void *v3;
  int64_t v4;

  -[NSDictionary objectForKeyedSubscript:](self->_expectedDownloadSizes, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "longLongValue");

  return v4;
}

- (double)totalDownloadedWithName:(id)a3
{
  void *v3;
  double v4;
  double v5;

  -[NSDictionary objectForKeyedSubscript:](self->_assetDownloadPercent, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleValue");
  v5 = v4;

  return v5;
}

- (void)_updateDownloadedValuesForAsset:(id)a3
{
  NSDictionary *totalInstalledSizes;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSDictionary *assetDownloadPercent;
  void *v10;
  void *v11;
  id v12;

  totalInstalledSizes = self->_totalInstalledSizes;
  v5 = a3;
  objc_msgSend(v5, "downloadSize");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "properties");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("AssetName"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary setValue:forKey:](totalInstalledSizes, "setValue:forKey:", v6, v8);

  assetDownloadPercent = self->_assetDownloadPercent;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", 100.0);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "properties");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("AssetName"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary setValue:forKey:](assetDownloadPercent, "setValue:forKey:", v12, v11);

}

- (BOOL)assetDownloadFailed
{
  return self->_assetDownloadFailed;
}

- (void)downloadImageCaptionAssets
{
  AXAssetController *imageCaptionAssetController;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  imageCaptionAssetController = self->_imageCaptionAssetController;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __52__MagnifierAssetsManager_downloadImageCaptionAssets__block_invoke;
  v4[3] = &unk_24EF97DD0;
  objc_copyWeak(&v5, &location);
  -[AXAssetController refreshAssetsByForceUpdatingCatalog:updatingCatalogIfNeeded:catalogRefreshOverrideTimeout:completion:](imageCaptionAssetController, "refreshAssetsByForceUpdatingCatalog:updatingCatalogIfNeeded:catalogRefreshOverrideTimeout:completion:", 1, 1, 0, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __52__MagnifierAssetsManager_downloadImageCaptionAssets__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id WeakRetained;
  NSObject *v6;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (v4)
  {
    AXLogAssetLoader();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __52__MagnifierAssetsManager_downloadImageCaptionAssets__block_invoke_cold_1((uint64_t)WeakRetained, v4, v6);

  }
}

- (void)manageImageCaptionModelAssets:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  AXAssetController *imageCaptionAssetController;
  void *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDB18E0], "currentLanguageCode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentsSeparatedByString:", CFSTR("-"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(v6, "objectAtIndex:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDFDD28], "newsestCompatibleImageCaptionModelAssetFromAssets:withStage:language:isInstalled:isDownloadable:", v4, CFSTR("Stable"), v7, 1, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8
      || (objc_msgSend(MEMORY[0x24BDFDD28], "newsestCompatibleImageCaptionModelAssetFromAssets:withStage:language:isInstalled:isDownloadable:", v4, CFSTR("Stable"), v7, 0, 1), (v8 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      imageCaptionAssetController = self->_imageCaptionAssetController;
      v11[0] = v8;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXAssetController downloadAssets:successStartBlock:](imageCaptionAssetController, "downloadAssets:successStartBlock:", v10, &__block_literal_global_205);

    }
  }

}

void __56__MagnifierAssetsManager_manageImageCaptionModelAssets___block_invoke()
{
  NSObject *v0;

  AXLogAssetLoader();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
    __56__MagnifierAssetsManager_manageImageCaptionModelAssets___block_invoke_cold_1(v0);

}

- (MagnifierAssetsManagerDelegate)delegate
{
  return (MagnifierAssetsManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSURL)doorAttributesBaseURL
{
  return self->_doorAttributesBaseURL;
}

- (void)setDoorAttributesBaseURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSDictionary)doorAttributesAssetProperties
{
  return self->_doorAttributesAssetProperties;
}

- (void)setDoorAttributesAssetProperties:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSURL)signDetectorBaseURL
{
  return self->_signDetectorBaseURL;
}

- (void)setSignDetectorBaseURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSDictionary)signDetectorAssetProperties
{
  return self->_signDetectorAssetProperties;
}

- (void)setSignDetectorAssetProperties:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signDetectorAssetProperties, 0);
  objc_storeStrong((id *)&self->_signDetectorBaseURL, 0);
  objc_storeStrong((id *)&self->_doorAttributesAssetProperties, 0);
  objc_storeStrong((id *)&self->_doorAttributesBaseURL, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_imageCaptionAssetController, 0);
  objc_storeStrong((id *)&self->_assetDownloadPercent, 0);
  objc_storeStrong((id *)&self->_totalInstalledSizes, 0);
  objc_storeStrong((id *)&self->_expectedDownloadSizes, 0);
  objc_storeStrong((id *)&self->_assetsNeedingDownload, 0);
  objc_storeStrong((id *)&self->_cachedDownloadableAssets, 0);
  objc_storeStrong((id *)&self->_cachedAssets, 0);
  objc_storeStrong((id *)&self->_assetPolicy, 0);
  objc_storeStrong((id *)&self->_assetController, 0);
}

void __49__MagnifierAssetsManager_downloadAssetsWithName___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "count");
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48);
  v6 = 134218242;
  v7 = v4;
  v8 = 2112;
  v9 = v5;
  _os_log_debug_impl(&dword_2272F4000, a2, OS_LOG_TYPE_DEBUG, "Successfully started downloading %lu assets:\n%@ ", (uint8_t *)&v6, 0x16u);
}

- (void)assetController:didFinishRefreshingAssets:wasSuccessful:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_2272F4000, v0, v1, "[%@]:  Error refresing assets:\n%@");
  OUTLINED_FUNCTION_2();
}

- (void)assetController:didFinishDownloadingAsset:wasSuccessful:error:hasRemainingDownloads:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_2272F4000, v0, v1, "[%@]: Download failed:\n%@");
  OUTLINED_FUNCTION_2();
}

- (void)assetController:didFinishPurgingAssets:wasSuccessful:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_2272F4000, v0, v1, "[%@]: Error purging assets: %@");
  OUTLINED_FUNCTION_2();
}

void __52__MagnifierAssetsManager_downloadImageCaptionAssets__block_invoke_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a2, "localizedDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = a1;
  v8 = 2112;
  v9 = v5;
  _os_log_error_impl(&dword_2272F4000, a3, OS_LOG_TYPE_ERROR, "%@: Could not refresh image caption assets from Magnifier: %@", (uint8_t *)&v6, 0x16u);

}

void __56__MagnifierAssetsManager_manageImageCaptionModelAssets___block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_2272F4000, log, OS_LOG_TYPE_DEBUG, "Successfully started downloading assets", v1, 2u);
}

@end
