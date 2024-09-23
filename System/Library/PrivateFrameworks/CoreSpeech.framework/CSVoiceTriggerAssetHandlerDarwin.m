@implementation CSVoiceTriggerAssetHandlerDarwin

- (CSVoiceTriggerAssetHandlerDarwin)init
{
  CSVoiceTriggerAssetHandlerDarwin *v3;
  CSVoiceTriggerAssetHandlerDarwin *v4;
  CSVoiceTriggerAssetHandlerDarwin *v5;
  objc_super v7;

  if (objc_msgSend(MEMORY[0x1E0D19260], "isDarwinOS"))
  {
    v7.receiver = self;
    v7.super_class = (Class)CSVoiceTriggerAssetHandlerDarwin;
    v3 = -[CSVoiceTriggerAssetHandler init](&v7, sel_init);
    v4 = v3;
    if (v3)
    {
      -[CSVoiceTriggerAssetHandlerDarwin start](v3, "start");
      -[CSVoiceTriggerAssetHandlerDarwin setCachedAsset:](v4, "setCachedAsset:", 0);
    }
    self = v4;
    v5 = self;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)start
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0D191C8], "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:forAssetType:", self, 0);

  objc_msgSend(MEMORY[0x1E0D19158], "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:", self);

}

- (void)getVoiceTriggerAssetWithEndpointId:(id)a3 completion:(id)a4
{
  void (**v5)(id, void *, _QWORD);
  void *v6;
  void *v7;
  _QWORD v8[5];
  void (**v9)(id, void *, _QWORD);

  v5 = (void (**)(id, void *, _QWORD))a4;
  -[CSVoiceTriggerAssetHandlerDarwin cachedAsset](self, "cachedAsset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    if (v5)
    {
      -[CSVoiceTriggerAssetHandlerDarwin cachedAsset](self, "cachedAsset");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v5[2](v5, v7, 0);

    }
  }
  else
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __82__CSVoiceTriggerAssetHandlerDarwin_getVoiceTriggerAssetWithEndpointId_completion___block_invoke;
    v8[3] = &unk_1E7C28D48;
    v8[4] = self;
    v9 = v5;
    -[CSVoiceTriggerAssetHandlerDarwin _getVoiceTriggerAssetFromAssetManager:](self, "_getVoiceTriggerAssetFromAssetManager:", v8);

  }
}

- (void)_getVoiceTriggerAssetFromAssetManager:(id)a3
{
  void (**v3)(id, _QWORD, id);
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  id v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = (void (**)(id, _QWORD, id))a3;
  objc_msgSend(MEMORY[0x1E0D191C8], "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assetForCurrentLanguageOfType:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D19180], "sharedHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  objc_msgSend(v6, "compileAndUpdateDeviceCachesWithAsset:assetType:endpointId:errOut:", v5, 5, 0, &v10);
  v7 = v10;

  v8 = *MEMORY[0x1E0D18F30];
  v9 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F30], OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v9)
    {
      *(_DWORD *)buf = 136315394;
      v12 = "-[CSVoiceTriggerAssetHandlerDarwin _getVoiceTriggerAssetFromAssetManager:]";
      v13 = 2114;
      v14 = v7;
      _os_log_impl(&dword_1C2614000, v8, OS_LOG_TYPE_DEFAULT, "%s Fetching CSVoiceTriggerAsset failed with error error %{public}@", buf, 0x16u);
    }
    if (v3)
      v3[2](v3, 0, v7);
  }
  else
  {
    if (v9)
    {
      *(_DWORD *)buf = 136315394;
      v12 = "-[CSVoiceTriggerAssetHandlerDarwin _getVoiceTriggerAssetFromAssetManager:]";
      v13 = 2114;
      v14 = v5;
      _os_log_impl(&dword_1C2614000, v8, OS_LOG_TYPE_DEFAULT, "%s CSVoiceTriggerAsset found: %{public}@", buf, 0x16u);
    }
    if (v3)
      ((void (**)(id, void *, id))v3)[2](v3, v5, 0);
  }

}

- (void)_checkNewAssetAvailablity
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __61__CSVoiceTriggerAssetHandlerDarwin__checkNewAssetAvailablity__block_invoke;
  v2[3] = &unk_1E7C28D98;
  v2[4] = self;
  -[CSVoiceTriggerAssetHandlerDarwin _getVoiceTriggerAssetFromAssetManager:](self, "_getVoiceTriggerAssetFromAssetManager:", v2);
}

- (void)CSRemoteAssetManagerDidDownloadNewAsset:(id)a3
{
  NSObject *v4;
  NSObject *v5;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = *MEMORY[0x1E0D18F30];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F30], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v8 = "-[CSVoiceTriggerAssetHandlerDarwin CSRemoteAssetManagerDidDownloadNewAsset:]";
    _os_log_impl(&dword_1C2614000, v4, OS_LOG_TYPE_DEFAULT, "%s new VoiceTrigger asset downloaded", buf, 0xCu);
  }
  -[CSVoiceTriggerAssetHandler queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __76__CSVoiceTriggerAssetHandlerDarwin_CSRemoteAssetManagerDidDownloadNewAsset___block_invoke;
  block[3] = &unk_1E7C292C8;
  block[4] = self;
  dispatch_async(v5, block);

}

- (void)CSLanguageCodeUpdateMonitor:(id)a3 didReceiveLanguageCodeChanged:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = *MEMORY[0x1E0D18F30];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F30], OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315394;
    v9 = "-[CSVoiceTriggerAssetHandlerDarwin CSLanguageCodeUpdateMonitor:didReceiveLanguageCodeChanged:]";
    v10 = 2114;
    v11 = v5;
    _os_log_impl(&dword_1C2614000, v6, OS_LOG_TYPE_DEFAULT, "%s Language Code Changed : %{public}@", (uint8_t *)&v8, 0x16u);
  }
  -[CSVoiceTriggerAssetHandlerDarwin _checkNewAssetAvailablity](self, "_checkNewAssetAvailablity");
  +[CSVoiceTriggerAssetMetaUpdateMonitor sharedInstance](CSVoiceTriggerAssetMetaUpdateMonitor, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "notifyNewVoiceTriggerAssetMetaDataUpdated");

}

- (CSAsset)cachedAsset
{
  return (CSAsset *)objc_getProperty(self, a2, 24, 1);
}

- (void)setCachedAsset:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedAsset, 0);
}

uint64_t __76__CSVoiceTriggerAssetHandlerDarwin_CSRemoteAssetManagerDidDownloadNewAsset___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_checkNewAssetAvailablity");
}

void __61__CSVoiceTriggerAssetHandlerDarwin__checkNewAssetAvailablity__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  os_log_t *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  NSObject *v17;
  const char *v18;
  NSObject *v19;
  void *v20;
  int v21;
  const char *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  v8 = (os_log_t *)MEMORY[0x1E0D18F30];
  v9 = *MEMORY[0x1E0D18F30];
  if (!v5 || v6)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F30], OS_LOG_TYPE_ERROR))
    {
      v19 = v9;
      objc_msgSend(v7, "localizedDescription");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 136315394;
      v22 = "-[CSVoiceTriggerAssetHandlerDarwin _checkNewAssetAvailablity]_block_invoke";
      v23 = 2114;
      v24 = v20;
      _os_log_error_impl(&dword_1C2614000, v19, OS_LOG_TYPE_ERROR, "%s Asset Query failed : %{public}@", (uint8_t *)&v21, 0x16u);

      if (!v5)
        goto LABEL_14;
    }
    else if (!v5)
    {
      goto LABEL_14;
    }
    v9 = *v8;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = *(void **)(a1 + 32);
    v11 = v9;
    objc_msgSend(v10, "cachedAsset");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "path");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "path");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 136315650;
    v22 = "-[CSVoiceTriggerAssetHandlerDarwin _checkNewAssetAvailablity]_block_invoke";
    v23 = 2114;
    v24 = v13;
    v25 = 2114;
    v26 = v14;
    _os_log_impl(&dword_1C2614000, v11, OS_LOG_TYPE_DEFAULT, "%s cached asset:%{public}@, new asset:%{public}@", (uint8_t *)&v21, 0x20u);

  }
  objc_msgSend(*(id *)(a1 + 32), "cachedAsset");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "isEqualAsset:", v5);

  if (v16)
  {
    v17 = *v8;
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
    {
      v21 = 136315138;
      v22 = "-[CSVoiceTriggerAssetHandlerDarwin _checkNewAssetAvailablity]_block_invoke";
      v18 = "%s New asset is same as cached asset, ignore notification";
LABEL_13:
      _os_log_impl(&dword_1C2614000, v17, OS_LOG_TYPE_DEFAULT, v18, (uint8_t *)&v21, 0xCu);
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setCachedAsset:", v5);
    objc_msgSend(*(id *)(a1 + 32), "notifyObservers:endpointId:", v5, 0);
    v17 = *v8;
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
    {
      v21 = 136315138;
      v22 = "-[CSVoiceTriggerAssetHandlerDarwin _checkNewAssetAvailablity]_block_invoke";
      v18 = "%s New asset is different from cached one. Updating cached asset";
      goto LABEL_13;
    }
  }
LABEL_14:

}

void __82__CSVoiceTriggerAssetHandlerDarwin_getVoiceTriggerAssetWithEndpointId_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  uint64_t v6;
  id v7;

  v7 = a3;
  objc_msgSend(*(id *)(a1 + 32), "defaultFallbackModelIfNil:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(*(id *)(a1 + 32), "setCachedAsset:", v5);
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    (*(void (**)(uint64_t, void *, id))(v6 + 16))(v6, v5, v7);

}

@end
