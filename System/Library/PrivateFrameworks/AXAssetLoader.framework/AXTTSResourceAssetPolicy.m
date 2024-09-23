@implementation AXTTSResourceAssetPolicy

- (id)assetType
{
  return CFSTR("com.apple.MobileAsset.TTSAXResourceModelAssets");
}

- (id)launchActivityIdentifier
{
  return CFSTR("com.apple.ax.TTSResource.LaunchActivity");
}

- (BOOL)daemonShouldDownloadInBackgroundIfNeeded
{
  return 1;
}

- (BOOL)shouldDownloadAsset:(id)a3 withInstalledAssets:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  BOOL v11;
  NSObject *v12;
  void *v13;
  unint64_t v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void *v19;
  AXTTSResourceAssetPolicy *v20;
  id v21;

  v6 = a3;
  v7 = a4;
  -[AXTTSResourceAssetPolicy _voiceIdentifierForAsset:](self, "_voiceIdentifierForAsset:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v16 = MEMORY[0x1E0C809B0];
    v17 = 3221225472;
    v18 = __68__AXTTSResourceAssetPolicy_shouldDownloadAsset_withInstalledAssets___block_invoke;
    v19 = &unk_1E95D3978;
    v20 = self;
    v21 = v8;
    v10 = objc_msgSend(v7, "indexOfObjectPassingTest:", &v16);
    if (v10 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v11 = 0;
    }
    else
    {
      objc_msgSend(v7, "objectAtIndexedSubscript:", v10, v16, v17, v18, v19, v20);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v6, "contentVersion");
      v11 = v14 > objc_msgSend(v13, "contentVersion");

    }
  }
  else
  {
    AXLogAssetLoader();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[AXTTSResourceAssetPolicy shouldDownloadAsset:withInstalledAssets:].cold.1((uint64_t)v6, v12);

    v11 = 0;
  }

  return v11;
}

uint64_t __68__AXTTSResourceAssetPolicy_shouldDownloadAsset_withInstalledAssets___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(*(id *)(a1 + 32), "_voiceIdentifierForAsset:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(*(id *)(a1 + 40), "isEqualToString:", v3);

  return v4;
}

- (id)downloadOptionsForOperation:(unint64_t)a3 userInitiated:(BOOL)a4
{
  _BOOL8 v4;
  void *v5;
  objc_super v7;

  v4 = a4;
  v7.receiver = self;
  v7.super_class = (Class)AXTTSResourceAssetPolicy;
  -[AXAssetPolicy downloadOptionsForOperation:userInitiated:](&v7, sel_downloadOptionsForOperation_userInitiated_, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAllowsCellularAccess:", v4);
  return v5;
}

- (id)assetsToPurgeFromInstalledAssets:(id)a3 withRefreshedAssets:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(id *, void *);
  uint64_t i;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(id *, void *);
  uint64_t v21;
  id v22;
  void *v23;
  unint64_t v24;
  NSObject *v25;
  id v27;
  AXTTSResourceAssetPolicy *v28;
  id obj;
  _QWORD v30[5];
  id v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[4];
  id v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v27 = (id)objc_claimAutoreleasedReturnValue();
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  obj = v6;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v34;
    v11 = MEMORY[0x1E0C809B0];
    v12 = __81__AXTTSResourceAssetPolicy_assetsToPurgeFromInstalledAssets_withRefreshedAssets___block_invoke;
    v28 = self;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v34 != v10)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        -[AXTTSResourceAssetPolicy _voiceIdentifierForAsset:](self, "_voiceIdentifierForAsset:", v14, v27);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v30[0] = v11;
        v30[1] = 3221225472;
        v30[2] = v12;
        v30[3] = &unk_1E95D39A0;
        v30[4] = self;
        v16 = v15;
        v31 = v16;
        v32 = v14;
        v17 = objc_msgSend(v7, "indexOfObjectPassingTest:", v30);
        if (v17 != 0x7FFFFFFFFFFFFFFFLL)
        {
          v18 = v9;
          v19 = v10;
          v20 = v12;
          v21 = v11;
          v22 = v7;
          objc_msgSend(v7, "objectAtIndex:", v17);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v23, "contentVersion");
          if (v24 > objc_msgSend(v14, "contentVersion"))
            objc_msgSend(v27, "addObject:", v14);

          v11 = v21;
          v12 = v20;
          v7 = v22;
          v10 = v19;
          v9 = v18;
          self = v28;
        }

      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
    }
    while (v9);
  }

  AXLogAssetLoader();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v38 = v27;
    _os_log_impl(&dword_1D3F8E000, v25, OS_LOG_TYPE_INFO, "TTSResourceAssetPolicy will purge the following assets: %@", buf, 0xCu);
  }

  return v27;
}

uint64_t __81__AXTTSResourceAssetPolicy_assetsToPurgeFromInstalledAssets_withRefreshedAssets___block_invoke(id *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v3 = a2;
  objc_msgSend(a1[4], "_voiceIdentifierForAsset:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(a1[5], "isEqualToString:", v4))
  {
    objc_msgSend(a1[6], "assetId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "assetId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqualToString:", v6) ^ 1;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)_voiceIdentifierForAsset:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  __CFString *v6;
  void *v7;
  void *v8;

  v3 = a3;
  objc_msgSend(v3, "properties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("VoiceId"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = v5;
  }
  else
  {
    objc_msgSend(v3, "properties");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("Sample"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v8, "BOOLValue"))
      v6 = CFSTR("Sample");
    else
      v6 = 0;

  }
  return v6;
}

- (id)compatibilityVersion
{
  return &unk_1E95D7BD8;
}

- (void)shouldDownloadAsset:(uint64_t)a1 withInstalledAssets:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1D3F8E000, a2, OS_LOG_TYPE_ERROR, "Failed to get voice id for asset: %@", (uint8_t *)&v2, 0xCu);
}

@end
