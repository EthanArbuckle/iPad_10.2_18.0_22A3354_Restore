@implementation AXUltronModelAssetPolicy

- (id)assetType
{
  return +[AXUltronModelAssetPolicy ultronAssetType](AXUltronModelAssetPolicy, "ultronAssetType");
}

- (id)launchActivityIdentifier
{
  return CFSTR("com.apple.ax.SoundDetectionModels.LaunchActivity");
}

- (BOOL)shouldCopyLocally
{
  return 1;
}

- (id)assetsToDownloadFromRefreshedAssets:(id)a3
{
  return +[AXUltronModelAssetPolicy assetsToDownloadFromAssets:](AXUltronModelAssetPolicy, "assetsToDownloadFromAssets:", a3);
}

- (id)assetsToPurgeFromInstalledAssets:(id)a3
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __61__AXUltronModelAssetPolicy_assetsToPurgeFromInstalledAssets___block_invoke;
  v4[3] = &unk_1E95D39D8;
  v4[4] = self;
  objc_msgSend(a3, "ax_filteredArrayUsingBlock:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __61__AXUltronModelAssetPolicy_assetsToPurgeFromInstalledAssets___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _BOOL8 v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = +[AXUltronModelAssetPolicy _isUltronAssetCompatible:](AXUltronModelAssetPolicy, "_isUltronAssetCompatible:", v3);
  v5 = objc_msgSend(*(id *)(a1 + 32), "_assetUsedRecently");
  v6 = v4 & v5;
  if (!(v4 & v5))
  {
    v7 = v5;
    AXLogUltron();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v3, "ultronModelName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138412802;
      v14 = v9;
      v15 = 2112;
      v16 = v10;
      v17 = 2112;
      v18 = v11;
      _os_log_impl(&dword_1D3F8E000, v8, OS_LOG_TYPE_DEFAULT, "Purging asset: %@. Is Compatiable: %@, Used Recently: %@", (uint8_t *)&v13, 0x20u);

    }
  }

  return v6 ^ 1u;
}

+ (id)ultronAssetType
{
  return CFSTR("com.apple.MobileAsset.SoundDetectionModels");
}

+ (int64_t)minimumCompatibilityVersion
{
  void *v2;
  void *v3;
  int64_t v4;

  +[AXAssetMetadataStore store](AXAssetMetadataStore, "store");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "overrideMinimumCompatibilityVersionForAssetType:", CFSTR("com.apple.MobileAsset.SoundDetectionModels"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "integerValue");
  else
    v4 = 1;

  return v4;
}

+ (int64_t)maximumCompatibilityVersion
{
  void *v2;
  void *v3;
  int64_t v4;

  +[AXAssetMetadataStore store](AXAssetMetadataStore, "store");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "overrideMaximumCompatibilityVersionForAssetType:", CFSTR("com.apple.MobileAsset.SoundDetectionModels"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "integerValue");
  else
    v4 = 3;

  return v4;
}

+ (id)assetsToDownloadFromAssets:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v9;
  const __CFString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  AXLogAssetLoader();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v9 = 138412290;
    v10 = CFSTR("com.apple.MobileAsset.SoundDetectionModels");
    _os_log_impl(&dword_1D3F8E000, v5, OS_LOG_TYPE_INFO, "Asset type [%@] - will evaluate downloadable assets for items to download", (uint8_t *)&v9, 0xCu);
  }

  objc_msgSend(a1, "newestCompatiableAssetsFromAssets:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "ax_filteredArrayUsingBlock:", &__block_literal_global);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __55__AXUltronModelAssetPolicy_assetsToDownloadFromAssets___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isInstalled") ^ 1;
}

+ (id)compatibleAssetsFromRefreshedAssets:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  _QWORD v14[5];
  uint8_t buf[4];
  const __CFString *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[AXAssetMetadataStore store](AXAssetMetadataStore, "store");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "overrideMinimumCompatibilityVersionForAssetType:", CFSTR("com.apple.MobileAsset.SoundDetectionModels"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    AXLogAssetLoader();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      v16 = CFSTR("com.apple.MobileAsset.SoundDetectionModels");
      v17 = 2048;
      v18 = 1;
      v19 = 2048;
      v20 = objc_msgSend(v6, "integerValue");
      _os_log_impl(&dword_1D3F8E000, v7, OS_LOG_TYPE_INFO, "Asset type [%@] default minimumCompatibilityVersion=%ld BEING OVERRIDDEN: %ld", buf, 0x20u);
    }

  }
  +[AXAssetMetadataStore store](AXAssetMetadataStore, "store");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "overrideMaximumCompatibilityVersionForAssetType:", CFSTR("com.apple.MobileAsset.SoundDetectionModels"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    AXLogAssetLoader();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = objc_msgSend(v9, "integerValue");
      *(_DWORD *)buf = 138412802;
      v16 = CFSTR("com.apple.MobileAsset.SoundDetectionModels");
      v17 = 2048;
      v18 = 3;
      v19 = 2048;
      v20 = v11;
      _os_log_impl(&dword_1D3F8E000, v10, OS_LOG_TYPE_INFO, "Asset type [%@] default maximumCompatibilityVersion=%ld BEING OVERRIDDEN: %ld", buf, 0x20u);
    }

  }
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __64__AXUltronModelAssetPolicy_compatibleAssetsFromRefreshedAssets___block_invoke;
  v14[3] = &__block_descriptor_40_e24_B32__0__AXAsset_8Q16_B24l;
  v14[4] = a1;
  objc_msgSend(v4, "ax_filteredArrayUsingBlock:", v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

BOOL __64__AXUltronModelAssetPolicy_compatibleAssetsFromRefreshedAssets___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  unint64_t v4;
  _BOOL8 v5;
  unint64_t v6;

  v3 = a2;
  v4 = objc_msgSend(v3, "compatibilityVersion");
  if (v4 >= objc_msgSend(*(id *)(a1 + 32), "minimumCompatibilityVersion"))
  {
    v6 = objc_msgSend(v3, "compatibilityVersion");
    v5 = v6 <= objc_msgSend(*(id *)(a1 + 32), "maximumCompatibilityVersion");
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)newestCompatiableAssetsFromAssets:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t v30[128];
  uint8_t buf[4];
  const __CFString *v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  uint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(a1, "minimumCompatibilityVersion");
  v6 = objc_msgSend(a1, "maximumCompatibilityVersion");
  AXLogAssetLoader();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412802;
    v32 = CFSTR("com.apple.MobileAsset.SoundDetectionModels");
    v33 = 2048;
    v34 = v5;
    v35 = 2048;
    v36 = v6;
    _os_log_impl(&dword_1D3F8E000, v7, OS_LOG_TYPE_INFO, "Asset type [%@] - finding newest compatiable assets. Compat version range %ld-%ld", buf, 0x20u);
  }

  v25 = v4;
  objc_msgSend(a1, "compatibleAssetsFromRefreshedAssets:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_opt_new();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v27 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend(v15, "ultronModelName");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16)
        {
          objc_msgSend(v9, "objectForKey:", v16);
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = v17;
          if (!v17 || -[NSObject isOlderThanAsset:](v17, "isOlderThanAsset:", v15))
            objc_msgSend(v9, "setObject:forKey:", v15, v16);
        }
        else
        {
          AXLogAssetLoader();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
          {
            objc_msgSend(v15, "properties");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v32 = CFSTR("com.apple.MobileAsset.SoundDetectionModels");
            v33 = 2112;
            v34 = (uint64_t)v19;
            _os_log_fault_impl(&dword_1D3F8E000, v18, OS_LOG_TYPE_FAULT, "Asset type [%@] - Model name for properties %@ was nil", buf, 0x16u);

          }
        }

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v12);
  }

  AXLogAssetLoader();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v9, "allValues");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "count");
    *(_DWORD *)buf = 138412546;
    v32 = CFSTR("com.apple.MobileAsset.SoundDetectionModels");
    v33 = 2048;
    v34 = v22;
    _os_log_impl(&dword_1D3F8E000, v20, OS_LOG_TYPE_INFO, "Asset type [%@] - found %lu compatiable assets", buf, 0x16u);

  }
  objc_msgSend(v9, "allValues");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

+ (BOOL)_isUltronAssetCompatible:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  unint64_t v6;
  BOOL v7;
  unint64_t v8;
  void *v10;
  char v11;

  v3 = a3;
  if (AXRuntimeCheck_SupportsMedina())
  {
    objc_msgSend(v3, "ultronModelName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("kshot_general_appliance")) & 1) == 0)
    {
      objc_msgSend(v3, "ultronModelName");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v5, "isEqualToString:", CFSTR("kshot_hallucinator")))
      {
        objc_msgSend(v3, "ultronModelName");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("kshot_model_weights"));

        if ((v11 & 1) == 0)
          goto LABEL_7;
        goto LABEL_6;
      }

    }
  }
LABEL_6:
  v6 = objc_msgSend(v3, "compatibilityVersion");
  if (v6 >= +[AXUltronModelAssetPolicy minimumCompatibilityVersion](AXUltronModelAssetPolicy, "minimumCompatibilityVersion"))
  {
    v8 = objc_msgSend(v3, "compatibilityVersion");
    v7 = v8 <= +[AXUltronModelAssetPolicy maximumCompatibilityVersion](AXUltronModelAssetPolicy, "maximumCompatibilityVersion");
    goto LABEL_9;
  }
LABEL_7:
  v7 = 0;
LABEL_9:

  return v7;
}

- (BOOL)_assetUsedRecently
{
  void *v2;
  id v3;
  void *v4;
  double v5;
  double v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2050000000;
  v2 = (void *)getAXSettingsClass_softClass_1;
  v12 = getAXSettingsClass_softClass_1;
  if (!getAXSettingsClass_softClass_1)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __getAXSettingsClass_block_invoke_1;
    v8[3] = &unk_1E95D3900;
    v8[4] = &v9;
    __getAXSettingsClass_block_invoke_1((uint64_t)v8);
    v2 = (void *)v10[3];
  }
  v3 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v9, 8);
  objc_msgSend(v3, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "soundDetectionLastModelAccess");
  v6 = v5;

  return CFAbsoluteTimeGetCurrent() - v6 < 2592000.0;
}

@end
