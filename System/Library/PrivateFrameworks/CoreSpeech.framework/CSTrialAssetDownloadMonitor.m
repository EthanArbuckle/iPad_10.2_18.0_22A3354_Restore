@implementation CSTrialAssetDownloadMonitor

- (CSTrialAssetDownloadMonitor)init
{
  CSTrialAssetDownloadMonitor *v3;
  objc_super v5;

  if ((objc_msgSend(MEMORY[0x1E0D19260], "isDarwinOS") & 1) != 0)
  {
    v3 = 0;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)CSTrialAssetDownloadMonitor;
    self = -[CSEventMonitor init](&v5, sel_init);
    v3 = self;
  }

  return v3;
}

- (void)_startMonitoringWithQueue:(id)a3
{
  id v3;
  NSDictionary *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  NSDictionary *trialClientDict;
  id obj;
  _QWORD v14[4];
  NSDictionary *v15;
  id v16;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  id location;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x1E0D19260], "supportTrialMitigationAssets"))
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", &unk_1E7C63D88, &unk_1E7C63DA0, 0);
  else
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", &unk_1E7C63DB8, &unk_1E7C63DD0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  obj = v5;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(obj);
        v9 = (void *)MEMORY[0x1E0D19260];
        v10 = objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "unsignedIntegerValue");
        v14[0] = MEMORY[0x1E0C809B0];
        v14[1] = 3221225472;
        v14[2] = __57__CSTrialAssetDownloadMonitor__startMonitoringWithQueue___block_invoke;
        v14[3] = &unk_1E7C27730;
        v15 = v4;
        objc_copyWeak(&v17, &location);
        v16 = v3;
        objc_msgSend(v9, "getTrialIdsForAssetType:withCompletion:", v10, v14);

        objc_destroyWeak(&v17);
      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    }
    while (v6);
  }

  trialClientDict = self->_trialClientDict;
  self->_trialClientDict = v4;

  objc_destroyWeak(&location);
}

- (BOOL)_handleSiriAttAssetTrailDownloadForNamespace:(id)a3
{
  id v4;
  void *v5;
  os_log_t *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;
  NSObject *v15;
  NSObject *v16;
  int v18;
  const char *v19;
  __int16 v20;
  const __CFString *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NSDictionary objectForKeyedSubscript:](self->_trialClientDict, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "refresh");
  v6 = (os_log_t *)MEMORY[0x1E0D18F60];
  v7 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v18 = 136315138;
    v19 = "-[CSTrialAssetDownloadMonitor _handleSiriAttAssetTrailDownloadForNamespace:]";
    _os_log_impl(&dword_1C2614000, v7, OS_LOG_TYPE_DEFAULT, "%s Got Trial experiment/rollout notification", (uint8_t *)&v18, 0xCu);
  }
  objc_msgSend(v5, "levelForFactor:withNamespaceName:", CFSTR("com.apple.siri.sp.invocation"), v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "directoryValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "path");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[CSTrialAssetDownloadMonitor _notifyTrialAssetDownloadForAssetType:](self, "_notifyTrialAssetDownloadForAssetType:", 0);
    objc_msgSend(v5, "levelForFactor:withNamespaceName:", CFSTR("com.apple.siri.sp.mitigation"), v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "directoryValue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "path");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      -[CSTrialAssetDownloadMonitor _notifyTrialAssetDownloadForAssetType:](self, "_notifyTrialAssetDownloadForAssetType:", 6);
      v14 = 1;
    }
    else
    {
      v16 = *v6;
      if (os_log_type_enabled(*v6, OS_LOG_TYPE_ERROR))
      {
        v18 = 136315394;
        v19 = "-[CSTrialAssetDownloadMonitor _handleSiriAttAssetTrailDownloadForNamespace:]";
        v20 = 2114;
        v21 = CFSTR("com.apple.siri.sp.mitigation");
        _os_log_error_impl(&dword_1C2614000, v16, OS_LOG_TYPE_ERROR, "%s ERR: null file download path for factor: %{public}@", (uint8_t *)&v18, 0x16u);
      }
      objc_msgSend(MEMORY[0x1E0D190B8], "sharedInstance");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "submitTrialIssueReport:", *MEMORY[0x1E0D193A0]);
      v14 = 0;
    }
    v8 = v11;
  }
  else
  {
    v15 = *v6;
    if (os_log_type_enabled(*v6, OS_LOG_TYPE_ERROR))
    {
      v18 = 136315394;
      v19 = "-[CSTrialAssetDownloadMonitor _handleSiriAttAssetTrailDownloadForNamespace:]";
      v20 = 2114;
      v21 = CFSTR("com.apple.siri.sp.invocation");
      _os_log_error_impl(&dword_1C2614000, v15, OS_LOG_TYPE_ERROR, "%s ERR: null file download path for factor: %{public}@", (uint8_t *)&v18, 0x16u);
    }
    objc_msgSend(MEMORY[0x1E0D190B8], "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "submitTrialIssueReport:", *MEMORY[0x1E0D193A0]);
    v14 = 0;
  }

  return v14;
}

- (void)downloadAndNotifyTrialAssetsUpdateForNamespace:(id)a3 onQueue:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  CSTrialAssetDownloadMonitor *v10;

  v6 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __86__CSTrialAssetDownloadMonitor_downloadAndNotifyTrialAssetsUpdateForNamespace_onQueue___block_invoke;
  v8[3] = &unk_1E7C292A0;
  v9 = v6;
  v10 = self;
  v7 = v6;
  dispatch_async((dispatch_queue_t)a4, v8);

}

- (void)_notifyTrialAssetDownloadForAssetType:(unint64_t)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __69__CSTrialAssetDownloadMonitor__notifyTrialAssetDownloadForAssetType___block_invoke;
  v3[3] = &unk_1E7C28CD8;
  v3[4] = self;
  v3[5] = a3;
  -[CSEventMonitor enumerateObserversInQueue:](self, "enumerateObserversInQueue:", v3);
}

- (BOOL)_validateDownloadedAssetForAssetType:(unint64_t)a3
{
  void *v4;
  void *v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  +[CSTrialAssetManager sharedInstance](CSTrialAssetManager, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D19260], "getSiriLanguageWithFallback:", CFSTR("en-US"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __68__CSTrialAssetDownloadMonitor__validateDownloadedAssetForAssetType___block_invoke;
  v7[3] = &unk_1E7C277A8;
  v7[4] = &v8;
  v7[5] = a3;
  objc_msgSend(v4, "getInstalledAssetofType:forLocale:completion:", a3, v5, v7);

  LOBYTE(a3) = *((_BYTE *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return a3;
}

- (id)_trailStageDirectoryForAsset:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  char v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  id v21;
  id v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  id v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB3620];
  v4 = a3;
  objc_msgSend(v3, "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D19110], "sharedPreferences");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "trialBaseAssetDirectory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "stringByAppendingPathComponent:", v4);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "fileExistsAtPath:", v8))
  {
    v22 = 0;
    v9 = objc_msgSend(v5, "removeItemAtPath:error:", v8, &v22);
    v10 = v22;
    if ((v9 & 1) == 0)
    {
      v11 = (void *)*MEMORY[0x1E0D18F60];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
      {
        v19 = v11;
        objc_msgSend(v10, "localizedDescription");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315650;
        v24 = "-[CSTrialAssetDownloadMonitor _trailStageDirectoryForAsset:]";
        v25 = 2112;
        v26 = v8;
        v27 = 2114;
        v28 = v20;
        _os_log_error_impl(&dword_1C2614000, v19, OS_LOG_TYPE_ERROR, "%s Failed to delete dir at %@ with err: %{public}@", buf, 0x20u);

      }
      v12 = 0;
      goto LABEL_12;
    }
  }
  else
  {
    v10 = 0;
  }
  v13 = v10;
  v21 = v10;
  v14 = objc_msgSend(v5, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v8, 1, 0, &v21);
  v10 = v21;

  if ((v14 & 1) == 0)
  {
    v15 = (void *)*MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
    {
      v17 = v15;
      objc_msgSend(v10, "localizedDescription");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v24 = "-[CSTrialAssetDownloadMonitor _trailStageDirectoryForAsset:]";
      v25 = 2114;
      v26 = v8;
      v27 = 2114;
      v28 = v18;
      _os_log_error_impl(&dword_1C2614000, v17, OS_LOG_TYPE_ERROR, "%s Couldn't create voice trigger audio logging directory at path %{public}@ %{public}@", buf, 0x20u);

    }
    v8 = 0;
  }
  v8 = v8;
  v12 = v8;
LABEL_12:

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trialClientDict, 0);
}

void __68__CSTrialAssetDownloadMonitor__validateDownloadedAssetForAssetType___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  __CFString *v10;
  uint64_t v11;
  __CFString *v12;
  _QWORD v13[5];
  _QWORD v14[5];
  id v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x3032000000;
  v14[3] = __Block_byref_object_copy__20435;
  v14[4] = __Block_byref_object_dispose__20436;
  v15 = 0;
  v7 = *(_QWORD *)(a1 + 40);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __68__CSTrialAssetDownloadMonitor__validateDownloadedAssetForAssetType___block_invoke_39;
  v13[3] = &unk_1E7C27758;
  v13[4] = v14;
  objc_msgSend(MEMORY[0x1E0D19260], "getTrialIdsForAssetType:withCompletion:", v7, v13);
  if (v6)
  {
    v8 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
    {
      v11 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 136315394;
      v17 = "-[CSTrialAssetDownloadMonitor _validateDownloadedAssetForAssetType:]_block_invoke_2";
      v18 = 2048;
      v19 = v11;
      _os_log_error_impl(&dword_1C2614000, v8, OS_LOG_TYPE_ERROR, "%s ERR: failed to fetch asset for asset type %lu, posting to ABC ...", buf, 0x16u);
    }
    objc_msgSend(MEMORY[0x1E0D190B8], "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "submitTrialIssueReport:", *MEMORY[0x1E0D19390]);

    v10 = CFSTR("n/a");
  }
  else
  {
    objc_msgSend(v5, "configVersion");
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  }
  v12 = v10;
  AnalyticsSendEventLazy();

  _Block_object_dispose(v14, 8);
}

void __68__CSTrialAssetDownloadMonitor__validateDownloadedAssetForAssetType___block_invoke_39(uint64_t a1, int a2, id obj)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), obj);
}

id __68__CSTrialAssetDownloadMonitor__validateDownloadedAssetForAssetType___block_invoke_40(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  _QWORD v7[4];
  _QWORD v8[5];

  v8[4] = *MEMORY[0x1E0C80C00];
  v8[0] = MEMORY[0x1E0C9AAB0];
  v7[0] = CFSTR("updateReceived");
  v7[1] = CFSTR("updateSuccess");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 48));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v2;
  v7[2] = CFSTR("namespace");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  v7[3] = CFSTR("assetVersion");
  v8[2] = v4;
  v8[3] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __69__CSTrialAssetDownloadMonitor__notifyTrialAssetDownloadForAssetType___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "trialAssetDownloadMonitorDelegate:didInstallNewAsset:assetType:", *(_QWORD *)(a1 + 32), 1, *(_QWORD *)(a1 + 40));

}

void __86__CSTrialAssetDownloadMonitor_downloadAndNotifyTrialAssetsUpdateForNamespace_onQueue___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id *v3;
  void *v4;
  void *v5;
  void *v6;
  __CFString *v7;
  void *v8;
  os_log_t *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  NSObject *v13;
  os_log_t v14;
  NSObject *v15;
  __CFString *v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  id v21;
  os_log_t v22;
  void *v23;
  NSObject *v24;
  __CFString *v25;
  id v26;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  const __CFString *v30;
  __int16 v31;
  __CFString *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(MEMORY[0x1E0D19260], "getAssetTypeForNamespace:", *(_QWORD *)(a1 + 32));
  v3 = *(id **)(a1 + 40);
  if (!v2)
  {
    objc_msgSend(v3, "_handleSiriAttAssetTrailDownloadForNamespace:", *(_QWORD *)(a1 + 32));
    return;
  }
  objc_msgSend(v3[3], "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "refresh");
  objc_msgSend(v4, "levelForFactor:withNamespaceName:", CFSTR("AssetData"), *(_QWORD *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fileValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "path");
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v4, "levelForFactor:withNamespaceName:", CFSTR("isAssetArchived"), *(_QWORD *)(a1 + 32));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (os_log_t *)MEMORY[0x1E0D18F60];
    if (v8 && objc_msgSend(v8, "BOOLeanValue"))
    {
      v10 = *(void **)(a1 + 40);
      +[CSAssetController getAssetTypeStringForType:](CSAssetController, "getAssetTypeStringForType:", v2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "_trailStageDirectoryForAsset:", v11);
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();

      v13 = *v9;
      if (os_log_type_enabled(*v9, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315650;
        v28 = "-[CSTrialAssetDownloadMonitor downloadAndNotifyTrialAssetsUpdateForNamespace:onQueue:]_block_invoke";
        v29 = 2114;
        v30 = v7;
        v31 = 2114;
        v32 = v12;
        _os_log_impl(&dword_1C2614000, v13, OS_LOG_TYPE_INFO, "%s Downloaded asset, now extracting from %{public}@ to %{public}@", buf, 0x20u);
      }
      if ((objc_msgSend(MEMORY[0x1E0D19260], "extractArchiveFromDirectory:toDir:", v7, v12) & 1) == 0)
      {
        v19 = *v9;
        if (os_log_type_enabled(*v9, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v28 = "-[CSTrialAssetDownloadMonitor downloadAndNotifyTrialAssetsUpdateForNamespace:onQueue:]_block_invoke";
          v29 = 2114;
          v30 = v7;
          _os_log_error_impl(&dword_1C2614000, v19, OS_LOG_TYPE_ERROR, "%s ERR: Unable to unzip asset file %{public}@", buf, 0x16u);
        }
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = 0;
        objc_msgSend(v20, "removeItemAtPath:error:", v12, &v26);
        v21 = v26;

        if (v21)
        {
          v22 = *v9;
          if (os_log_type_enabled(*v9, OS_LOG_TYPE_ERROR))
          {
            v24 = v22;
            objc_msgSend(v21, "localizedDescription");
            v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136315650;
            v28 = "-[CSTrialAssetDownloadMonitor downloadAndNotifyTrialAssetsUpdateForNamespace:onQueue:]_block_invoke";
            v29 = 2112;
            v30 = v12;
            v31 = 2114;
            v32 = v25;
            _os_log_error_impl(&dword_1C2614000, v24, OS_LOG_TYPE_ERROR, "%s Failed to delete dir at %@ with err: %{public}@", buf, 0x20u);

          }
        }
        objc_msgSend(MEMORY[0x1E0D190B8], "sharedInstance");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "submitTrialIssueReport:", *MEMORY[0x1E0D193A0]);

        goto LABEL_18;
      }

    }
    objc_msgSend(v4, "levelForFactor:withNamespaceName:", CFSTR("AssetVersion"), *(_QWORD *)(a1 + 32));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = *v9;
    if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
    {
      v15 = v14;
      objc_msgSend(v5, "stringValue");
      v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v28 = "-[CSTrialAssetDownloadMonitor downloadAndNotifyTrialAssetsUpdateForNamespace:onQueue:]_block_invoke";
      v29 = 2050;
      v30 = (const __CFString *)v2;
      v31 = 2114;
      v32 = v16;
      _os_log_impl(&dword_1C2614000, v15, OS_LOG_TYPE_DEFAULT, "%s Downloaded trial asset type %{public}lu with version %{public}@", buf, 0x20u);

    }
    if (objc_msgSend(*(id *)(a1 + 40), "_validateDownloadedAssetForAssetType:", v2))
      objc_msgSend(*(id *)(a1 + 40), "_notifyTrialAssetDownloadForAssetType:", v2);
  }
  else
  {
    v17 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v28 = "-[CSTrialAssetDownloadMonitor downloadAndNotifyTrialAssetsUpdateForNamespace:onQueue:]_block_invoke";
      v29 = 2114;
      v30 = CFSTR("AssetData");
      _os_log_error_impl(&dword_1C2614000, v17, OS_LOG_TYPE_ERROR, "%s ERR: null file download path for factor: %{public}@", buf, 0x16u);
    }
    objc_msgSend(MEMORY[0x1E0D190B8], "sharedInstance");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "submitTrialIssueReport:", *MEMORY[0x1E0D193A0]);

  }
  v8 = v5;
LABEL_18:

}

void __57__CSTrialAssetDownloadMonitor__startMonitoringWithQueue___block_invoke(id *a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0DC09C8], "clientWithIdentifier:", a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(a1[4], "setObject:forKey:", v6, v5);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __57__CSTrialAssetDownloadMonitor__startMonitoringWithQueue___block_invoke_2;
    v9[3] = &unk_1E7C27708;
    objc_copyWeak(&v11, a1 + 6);
    v10 = a1[5];
    v7 = (id)objc_msgSend(v6, "addUpdateHandlerForNamespaceName:usingBlock:", v5, v9);
    v8 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v13 = "-[CSTrialAssetDownloadMonitor _startMonitoringWithQueue:]_block_invoke";
      v14 = 2112;
      v15 = v5;
      _os_log_impl(&dword_1C2614000, v8, OS_LOG_TYPE_DEFAULT, "%s Adding client with namespace: %@ to asset manager", buf, 0x16u);
    }

    objc_destroyWeak(&v11);
  }

}

void __57__CSTrialAssetDownloadMonitor__startMonitoringWithQueue___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id WeakRetained;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315394;
    v8 = "-[CSTrialAssetDownloadMonitor _startMonitoringWithQueue:]_block_invoke_2";
    v9 = 2114;
    v10 = v3;
    _os_log_impl(&dword_1C2614000, v4, OS_LOG_TYPE_DEFAULT, "%s New trial asset for %{public}@ received, begin download", (uint8_t *)&v7, 0x16u);
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v3, "namespaceName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "downloadAndNotifyTrialAssetsUpdateForNamespace:onQueue:", v6, *(_QWORD *)(a1 + 32));

}

+ (CSTrialAssetDownloadMonitor)sharedInstance
{
  if (sharedInstance_onceToken_20490 != -1)
    dispatch_once(&sharedInstance_onceToken_20490, &__block_literal_global_20491);
  return (CSTrialAssetDownloadMonitor *)(id)sharedInstance_sharedManager;
}

void __45__CSTrialAssetDownloadMonitor_sharedInstance__block_invoke()
{
  CSTrialAssetDownloadMonitor *v0;
  void *v1;

  v0 = objc_alloc_init(CSTrialAssetDownloadMonitor);
  v1 = (void *)sharedInstance_sharedManager;
  sharedInstance_sharedManager = (uint64_t)v0;

}

@end
