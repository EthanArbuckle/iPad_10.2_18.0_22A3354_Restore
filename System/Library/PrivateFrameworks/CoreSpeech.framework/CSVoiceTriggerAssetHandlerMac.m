@implementation CSVoiceTriggerAssetHandlerMac

- (CSVoiceTriggerAssetHandlerMac)init
{
  return -[CSVoiceTriggerAssetHandlerMac initWithVoiceTriggerAssetDownloadMonitor:languageCodeUpdateMonitor:uafAssetDownloadMonitor:assetManager:uafAssetManager:disableOnDeviceCompilation:](self, "initWithVoiceTriggerAssetDownloadMonitor:languageCodeUpdateMonitor:uafAssetDownloadMonitor:assetManager:uafAssetManager:disableOnDeviceCompilation:", 0, 0, 0, 0, 0, 0);
}

- (CSVoiceTriggerAssetHandlerMac)initWithDisableOnDeviceCompilation:(BOOL)a3
{
  return -[CSVoiceTriggerAssetHandlerMac initWithVoiceTriggerAssetDownloadMonitor:languageCodeUpdateMonitor:uafAssetDownloadMonitor:assetManager:uafAssetManager:disableOnDeviceCompilation:](self, "initWithVoiceTriggerAssetDownloadMonitor:languageCodeUpdateMonitor:uafAssetDownloadMonitor:assetManager:uafAssetManager:disableOnDeviceCompilation:", 0, 0, 0, 0, 0, a3);
}

- (CSVoiceTriggerAssetHandlerMac)initWithVoiceTriggerAssetDownloadMonitor:(id)a3 languageCodeUpdateMonitor:(id)a4 uafAssetDownloadMonitor:(id)a5 assetManager:(id)a6 uafAssetManager:(id)a7 disableOnDeviceCompilation:(BOOL)a8
{
  id v14;
  id v15;
  id v16;
  CSVoiceTriggerAssetHandlerMac *v17;
  dispatch_queue_t v18;
  OS_dispatch_queue *queue;
  uint64_t v20;
  NSMutableDictionary *cachedEndpointAssets;
  void **p_voiceTriggerAssetDownloadMonitor;
  uint64_t v23;
  void *v24;
  void **p_languageCodeUpdateMonitor;
  uint64_t v26;
  void *v27;
  void **p_uafAssetDownloadMonitor;
  uint64_t v29;
  void *v30;
  void **p_assetManager;
  uint64_t v32;
  void *v33;
  void **p_uafAssetManager;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  CSOnDeviceCompilationHandler *onDeviceCompilationHandler;
  id v41;
  id v42;
  objc_super v43;

  v42 = a3;
  v41 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v43.receiver = self;
  v43.super_class = (Class)CSVoiceTriggerAssetHandlerMac;
  v17 = -[CSVoiceTriggerAssetHandler init](&v43, sel_init);
  if (v17)
  {
    v18 = dispatch_queue_create("CSVoiceTriggerHandlerMacQueue", 0);
    queue = v17->_queue;
    v17->_queue = (OS_dispatch_queue *)v18;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v20 = objc_claimAutoreleasedReturnValue();
    cachedEndpointAssets = v17->_cachedEndpointAssets;
    v17->_cachedEndpointAssets = (NSMutableDictionary *)v20;

    p_voiceTriggerAssetDownloadMonitor = (void **)&v17->_voiceTriggerAssetDownloadMonitor;
    objc_storeStrong((id *)&v17->_voiceTriggerAssetDownloadMonitor, a3);
    if (!v17->_voiceTriggerAssetDownloadMonitor)
    {
      objc_msgSend(MEMORY[0x1E0D19270], "sharedInstance");
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = *p_voiceTriggerAssetDownloadMonitor;
      *p_voiceTriggerAssetDownloadMonitor = (void *)v23;

    }
    p_languageCodeUpdateMonitor = (void **)&v17->_languageCodeUpdateMonitor;
    objc_storeStrong((id *)&v17->_languageCodeUpdateMonitor, a4);
    if (!v17->_languageCodeUpdateMonitor)
    {
      objc_msgSend(MEMORY[0x1E0D19158], "sharedInstance");
      v26 = objc_claimAutoreleasedReturnValue();
      v27 = *p_languageCodeUpdateMonitor;
      *p_languageCodeUpdateMonitor = (void *)v26;

    }
    p_uafAssetDownloadMonitor = (void **)&v17->_uafAssetDownloadMonitor;
    objc_storeStrong((id *)&v17->_uafAssetDownloadMonitor, a5);
    if (!v17->_uafAssetDownloadMonitor)
    {
      objc_msgSend(MEMORY[0x1E0D19248], "sharedInstance");
      v29 = objc_claimAutoreleasedReturnValue();
      v30 = *p_uafAssetDownloadMonitor;
      *p_uafAssetDownloadMonitor = (void *)v29;

    }
    p_assetManager = (void **)&v17->_assetManager;
    objc_storeStrong((id *)&v17->_assetManager, a6);
    if (!v17->_assetManager)
    {
      +[CSAssetManager sharedManager](CSAssetManager, "sharedManager");
      v32 = objc_claimAutoreleasedReturnValue();
      v33 = *p_assetManager;
      *p_assetManager = (void *)v32;

    }
    p_uafAssetManager = (void **)&v17->_uafAssetManager;
    objc_storeStrong((id *)&v17->_uafAssetManager, a7);
    if (!v17->_uafAssetManager)
    {
      objc_msgSend(MEMORY[0x1E0D19240], "sharedInstance");
      v35 = objc_claimAutoreleasedReturnValue();
      v36 = *p_uafAssetManager;
      *p_uafAssetManager = (void *)v35;

    }
    -[CSVoiceTriggerAssetHandlerMac start](v17, "start");
    -[CSVoiceTriggerAssetHandlerMac setCachedAsset:](v17, "setCachedAsset:", 0);
    -[CSVoiceTriggerAssetHandlerMac setCachedAssistantAsset:](v17, "setCachedAssistantAsset:", 0);
    if (!a8 && !v17->_onDeviceCompilationHandler)
    {
      objc_msgSend(MEMORY[0x1E0D19180], "sharedHandler");
      v37 = objc_claimAutoreleasedReturnValue();
      onDeviceCompilationHandler = v17->_onDeviceCompilationHandler;
      v17->_onDeviceCompilationHandler = (CSOnDeviceCompilationHandler *)v37;

    }
  }

  return v17;
}

- (void)start
{
  id v3;

  -[CSVoiceTriggerAssetDownloadMonitor addObserver:](self->_voiceTriggerAssetDownloadMonitor, "addObserver:", self);
  -[CSLanguageCodeUpdateMonitor addObserver:](self->_languageCodeUpdateMonitor, "addObserver:", self);
  -[CSUAFDownloadMonitor addObserver:](self->_uafAssetDownloadMonitor, "addObserver:", self);
  objc_msgSend(MEMORY[0x1E0D19280], "sharedInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:", self);

}

- (void)_handleVoiceTriggerAssetWithCompletion:(id)a3
{
  void (**v4)(id, void *, _QWORD);
  void *v5;
  void *v6;
  _QWORD v7[5];
  void (**v8)(id, void *, _QWORD);

  v4 = (void (**)(id, void *, _QWORD))a3;
  -[CSVoiceTriggerAssetHandlerMac cachedAsset](self, "cachedAsset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    if (v4)
    {
      -[CSVoiceTriggerAssetHandlerMac cachedAsset](self, "cachedAsset");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v4[2](v4, v6, 0);

    }
  }
  else
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __72__CSVoiceTriggerAssetHandlerMac__handleVoiceTriggerAssetWithCompletion___block_invoke;
    v7[3] = &unk_1E7C28D48;
    v7[4] = self;
    v8 = v4;
    -[CSVoiceTriggerAssetHandlerMac _getVoiceTriggerAssetFromAssetManager:](self, "_getVoiceTriggerAssetFromAssetManager:", v7);

  }
}

- (void)_handleEndpointVoiceTriggerAsset:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, void *);
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  void (**v13)(id, _QWORD, void *);

  v6 = a3;
  v7 = (void (**)(id, _QWORD, void *))a4;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18E80], 114, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, 0, v9);
    goto LABEL_6;
  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->_cachedEndpointAssets, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0D19260], "getSiriLanguageWithEndpointId:fallbackLanguage:", v6, CFSTR("en-US"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __77__CSVoiceTriggerAssetHandlerMac__handleEndpointVoiceTriggerAsset_completion___block_invoke;
    v11[3] = &unk_1E7C25F00;
    v11[4] = self;
    v12 = v6;
    v13 = v7;
    -[CSVoiceTriggerAssetHandlerMac _getVoiceTriggerAssetFromAssetManagerWithLocale:completion:](self, "_getVoiceTriggerAssetFromAssetManagerWithLocale:completion:", v10, v11);

    goto LABEL_8;
  }
  if (v7)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_cachedEndpointAssets, "objectForKeyedSubscript:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *, void *))v7)[2](v7, v9, 0);
LABEL_6:

  }
LABEL_8:

}

- (void)getVoiceTriggerAssetWithEndpointId:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  _QWORD block[5];
  id v10;
  id v11;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __79__CSVoiceTriggerAssetHandlerMac_getVoiceTriggerAssetWithEndpointId_completion___block_invoke;
    block[3] = &unk_1E7C28EC8;
    block[4] = self;
    v10 = v6;
    v11 = v7;
    dispatch_async(queue, block);

  }
  else
  {
    -[CSVoiceTriggerAssetHandlerMac _handleVoiceTriggerAssetWithCompletion:](self, "_handleVoiceTriggerAssetWithCompletion:", v7);
  }

}

- (void)_getVoiceTriggerAssetFromAssetManager:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v4 = (void *)MEMORY[0x1E0D19260];
  v5 = a3;
  objc_msgSend(v4, "getSiriLanguageWithFallback:", CFSTR("en-US"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[CSVoiceTriggerAssetHandlerMac _getVoiceTriggerAssetFromAssetManagerWithLocale:completion:](self, "_getVoiceTriggerAssetFromAssetManagerWithLocale:completion:", v6, v5);

}

- (void)_getVoiceTriggerAssetFromAssetManagerWithLocale:(id)a3 completion:(id)a4
{
  -[CSVoiceTriggerAssetHandlerMac _getVoiceTriggerAssetFromAssetManagerWithLocale:bundleIdentifier:completion:](self, "_getVoiceTriggerAssetFromAssetManagerWithLocale:bundleIdentifier:completion:", a3, 0, a4);
}

- (void)_getVoiceTriggerAssetFromAssetManagerWithLocale:(id)a3 bundleIdentifier:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  void (**v14)(_QWORD, _QWORD);
  void *v15;
  CSUAFAssetManager *uafAssetManager;
  _QWORD v17[4];
  id v18;
  id v19;
  void (**v20)(_QWORD, _QWORD);
  _QWORD v21[5];
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;

  v8 = a3;
  v9 = a5;
  v10 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __109__CSVoiceTriggerAssetHandlerMac__getVoiceTriggerAssetFromAssetManagerWithLocale_bundleIdentifier_completion___block_invoke;
  v23[3] = &unk_1E7C28D48;
  v11 = v8;
  v24 = v11;
  v12 = v9;
  v25 = v12;
  v21[0] = v10;
  v21[1] = 3221225472;
  v21[2] = __109__CSVoiceTriggerAssetHandlerMac__getVoiceTriggerAssetFromAssetManagerWithLocale_bundleIdentifier_completion___block_invoke_13;
  v21[3] = &unk_1E7C25F28;
  v21[4] = self;
  v13 = (id)MEMORY[0x1C3BC4734](v23);
  v22 = v13;
  v14 = (void (**)(_QWORD, _QWORD))MEMORY[0x1C3BC4734](v21);
  if (a4)
  {
    (*((void (**)(id, _QWORD, _QWORD))v13 + 2))(v13, 0, 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D19260], "getSiriLanguageWithFallback:", CFSTR("en-US"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "isEqualToString:", v15) && (uafAssetManager = self->_uafAssetManager) != 0)
    {
      v17[0] = v10;
      v17[1] = 3221225472;
      v17[2] = __109__CSVoiceTriggerAssetHandlerMac__getVoiceTriggerAssetFromAssetManagerWithLocale_bundleIdentifier_completion___block_invoke_15;
      v17[3] = &unk_1E7C25F50;
      v19 = v13;
      v20 = v14;
      v18 = v11;
      -[CSUAFAssetManager getInstalledAssetofType:forLocale:completion:](uafAssetManager, "getInstalledAssetofType:forLocale:completion:", 0, v15, v17);

    }
    else
    {
      ((void (**)(_QWORD, id))v14)[2](v14, v11);
    }

  }
}

- (void)_checkNewAssetAvailablity
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __58__CSVoiceTriggerAssetHandlerMac__checkNewAssetAvailablity__block_invoke;
  v2[3] = &unk_1E7C28D98;
  v2[4] = self;
  -[CSVoiceTriggerAssetHandlerMac _getVoiceTriggerAssetFromAssetManager:](self, "_getVoiceTriggerAssetFromAssetManager:", v2);
}

- (void)_checkNewAssetAvailablityForEndpoint
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__CSVoiceTriggerAssetHandlerMac__checkNewAssetAvailablityForEndpoint__block_invoke;
  block[3] = &unk_1E7C292C8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)triggerAssetRefresh
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__CSVoiceTriggerAssetHandlerMac_triggerAssetRefresh__block_invoke;
  block[3] = &unk_1E7C292C8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)CSVoiceTriggerAssetDownloadMonitor:(id)a3 didInstallNewAsset:(BOOL)a4
{
  NSObject *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v5 = *MEMORY[0x1E0D18F30];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F30], OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315138;
    v7 = "-[CSVoiceTriggerAssetHandlerMac CSVoiceTriggerAssetDownloadMonitor:didInstallNewAsset:]";
    _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_DEFAULT, "%s new VoiceTrigger asset downloaded", (uint8_t *)&v6, 0xCu);
  }
  -[CSVoiceTriggerAssetHandlerMac _checkNewAssetAvailablity](self, "_checkNewAssetAvailablity");
  -[CSVoiceTriggerAssetHandlerMac _checkNewAssetAvailablityForEndpoint](self, "_checkNewAssetAvailablityForEndpoint");
}

- (void)CSLanguageCodeUpdateMonitor:(id)a3 didReceiveLanguageCodeChanged:(id)a4
{
  id v5;
  NSObject *v6;
  int v7;
  const char *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = *MEMORY[0x1E0D18F30];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F30], OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315394;
    v8 = "-[CSVoiceTriggerAssetHandlerMac CSLanguageCodeUpdateMonitor:didReceiveLanguageCodeChanged:]";
    v9 = 2114;
    v10 = v5;
    _os_log_impl(&dword_1C2614000, v6, OS_LOG_TYPE_DEFAULT, "%s Language Code Changed : %{public}@", (uint8_t *)&v7, 0x16u);
  }
  -[CSVoiceTriggerAssetHandlerMac _checkNewAssetAvailablity](self, "_checkNewAssetAvailablity");
  -[CSVoiceTriggerAssetHandlerMac _checkNewAssetAvailablityForEndpoint](self, "_checkNewAssetAvailablityForEndpoint");

}

- (void)assetDownloadMonitorDelegate:(id)a3 assetType:(unint64_t)a4
{
  id v6;
  NSObject *v7;
  int v8;
  const char *v9;
  __int16 v10;
  unint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (a4)
  {
    v7 = *MEMORY[0x1E0D18F30];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F30], OS_LOG_TYPE_INFO))
    {
      v8 = 136315394;
      v9 = "-[CSVoiceTriggerAssetHandlerMac assetDownloadMonitorDelegate:assetType:]";
      v10 = 2048;
      v11 = a4;
      _os_log_impl(&dword_1C2614000, v7, OS_LOG_TYPE_INFO, "%s Ignore UAF asset update for type: %lu", (uint8_t *)&v8, 0x16u);
    }
  }
  else
  {
    -[CSVoiceTriggerAssetHandlerMac _checkNewAssetAvailablity](self, "_checkNewAssetAvailablity");
    -[CSVoiceTriggerAssetHandlerMac _checkNewAssetAvailablityForEndpoint](self, "_checkNewAssetAvailablityForEndpoint");
  }

}

- (void)CSVoiceTriggerEnabledMonitor:(id)a3 didReceiveEnabled:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *queue;
  _QWORD block[5];

  v4 = a4;
  v6 = a3;
  if (v4 && self->_onDeviceCompilationHandler)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __80__CSVoiceTriggerAssetHandlerMac_CSVoiceTriggerEnabledMonitor_didReceiveEnabled___block_invoke;
    block[3] = &unk_1E7C292C8;
    block[4] = self;
    dispatch_async(queue, block);
  }

}

- (void)mapAssetToExclaveKit:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  CSVoiceTriggerAssetHandlerMac *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__CSVoiceTriggerAssetHandlerMac_mapAssetToExclaveKit_completion___block_invoke;
  block[3] = &unk_1E7C28EC8;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

- (CSAsset)cachedAsset
{
  return (CSAsset *)objc_getProperty(self, a2, 32, 1);
}

- (void)setCachedAsset:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (CSAsset)cachedAssistantAsset
{
  return (CSAsset *)objc_getProperty(self, a2, 40, 1);
}

- (void)setCachedAssistantAsset:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSMutableDictionary)cachedEndpointAssets
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (void)setCachedEndpointAssets:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (CSVoiceTriggerAssetDownloadMonitor)voiceTriggerAssetDownloadMonitor
{
  return self->_voiceTriggerAssetDownloadMonitor;
}

- (void)setVoiceTriggerAssetDownloadMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_voiceTriggerAssetDownloadMonitor, a3);
}

- (CSLanguageCodeUpdateMonitor)languageCodeUpdateMonitor
{
  return self->_languageCodeUpdateMonitor;
}

- (void)setLanguageCodeUpdateMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_languageCodeUpdateMonitor, a3);
}

- (CSUAFDownloadMonitor)uafAssetDownloadMonitor
{
  return self->_uafAssetDownloadMonitor;
}

- (void)setUafAssetDownloadMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_uafAssetDownloadMonitor, a3);
}

- (CSAssetManager)assetManager
{
  return self->_assetManager;
}

- (void)setAssetManager:(id)a3
{
  objc_storeStrong((id *)&self->_assetManager, a3);
}

- (CSUAFAssetManager)uafAssetManager
{
  return self->_uafAssetManager;
}

- (void)setUafAssetManager:(id)a3
{
  objc_storeStrong((id *)&self->_uafAssetManager, a3);
}

- (CSOnDeviceCompilationHandler)onDeviceCompilationHandler
{
  return self->_onDeviceCompilationHandler;
}

- (void)setOnDeviceCompilationHandler:(id)a3
{
  objc_storeStrong((id *)&self->_onDeviceCompilationHandler, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_onDeviceCompilationHandler, 0);
  objc_storeStrong((id *)&self->_uafAssetManager, 0);
  objc_storeStrong((id *)&self->_assetManager, 0);
  objc_storeStrong((id *)&self->_uafAssetDownloadMonitor, 0);
  objc_storeStrong((id *)&self->_languageCodeUpdateMonitor, 0);
  objc_storeStrong((id *)&self->_voiceTriggerAssetDownloadMonitor, 0);
  objc_storeStrong((id *)&self->_cachedEndpointAssets, 0);
  objc_storeStrong((id *)&self->_cachedAssistantAsset, 0);
  objc_storeStrong((id *)&self->_cachedAsset, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __65__CSVoiceTriggerAssetHandlerMac_mapAssetToExclaveKit_completion___block_invoke(uint64_t *a1)
{
  os_log_t *v2;
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  int v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = (os_log_t *)MEMORY[0x1E0D18F30];
  v3 = *MEMORY[0x1E0D18F30];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F30], OS_LOG_TYPE_DEFAULT))
  {
    v10 = 136315138;
    v11 = "-[CSVoiceTriggerAssetHandlerMac mapAssetToExclaveKit:completion:]_block_invoke";
    _os_log_impl(&dword_1C2614000, v3, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v10, 0xCu);
  }
  if (!objc_msgSend((id)a1[4], "assetType"))
  {
    v7 = a1[4];
    v8 = *(void **)(a1[5] + 88);
    v9 = a1[6];
    v6 = v8;
    objc_msgSend(v6, "mapAssetToExclaveKit:completion:", v7, v9);
    goto LABEL_9;
  }
  v4 = *v2;
  if (os_log_type_enabled(*v2, OS_LOG_TYPE_ERROR))
  {
    v10 = 136315138;
    v11 = "-[CSVoiceTriggerAssetHandlerMac mapAssetToExclaveKit:completion:]_block_invoke";
    _os_log_error_impl(&dword_1C2614000, v4, OS_LOG_TYPE_ERROR, "%s UAFAssetManager is nil. This is an error", (uint8_t *)&v10, 0xCu);
  }
  v5 = a1[6];
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18E80], 2152, &unk_1E7C64958);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v6);
LABEL_9:

  }
}

void __80__CSVoiceTriggerAssetHandlerMac_CSVoiceTriggerEnabledMonitor_didReceiveEnabled___block_invoke(uint64_t a1)
{
  void *v2;
  int *v3;
  os_log_t *v4;
  _QWORD *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  __int128 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  char *v22;
  int *v23;
  void *v24;
  void *v25;
  os_log_t *v26;
  void *v27;
  id v28;
  NSObject *v29;
  NSObject *v30;
  __int128 v31;
  id obj;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  id v38;
  uint8_t buf[4];
  const char *v40;
  __int16 v41;
  id v42;
  __int16 v43;
  id v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "cachedAsset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = &OBJC_IVAR___CSAudioInjectionEngine__delegate;
  v4 = (os_log_t *)MEMORY[0x1E0D18F30];
  if (v2)
  {
    v5 = *(_QWORD **)(a1 + 32);
    v6 = (void *)v5[12];
    objc_msgSend(v5, "cachedAsset");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = 0;
    objc_msgSend(v6, "compileAndUpdateDeviceCachesWithAsset:assetType:endpointId:errOut:", v7, 0, 0, &v38);
    v8 = v38;

    v9 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v40 = "-[CSVoiceTriggerAssetHandlerMac CSVoiceTriggerEnabledMonitor:didReceiveEnabled:]_block_invoke";
      v41 = 2112;
      v42 = v8;
      _os_log_impl(&dword_1C2614000, v9, OS_LOG_TYPE_DEFAULT, "%s VoiceTrigger is enabled, recompiling assets completed with error: %@", buf, 0x16u);
    }

  }
  else
  {
    v10 = *MEMORY[0x1E0D18F30];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F30], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v40 = "-[CSVoiceTriggerAssetHandlerMac CSVoiceTriggerEnabledMonitor:didReceiveEnabled:]_block_invoke";
      _os_log_impl(&dword_1C2614000, v10, OS_LOG_TYPE_DEFAULT, "%s asset is not cached, skip compilation", buf, 0xCu);
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "cachedEndpointAssets");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    objc_msgSend(*(id *)(a1 + 32), "cachedEndpointAssets");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "allKeys");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    obj = v13;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v34, v45, 16);
    if (v14)
    {
      v16 = v14;
      v17 = *(_QWORD *)v35;
      *(_QWORD *)&v15 = 136315650;
      v31 = v15;
      do
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v35 != v17)
            objc_enumerationMutation(obj);
          v19 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v18);
          objc_msgSend(*(id *)(a1 + 32), "cachedEndpointAssets", v31);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "objectForKeyedSubscript:", v19);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          if (v21)
          {
            v22 = *(char **)(a1 + 32);
            v23 = v3;
            v24 = *(void **)&v22[v3[31]];
            objc_msgSend(v22, "cachedEndpointAssets");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "objectForKeyedSubscript:", v19);
            v26 = v4;
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v33 = 0;
            objc_msgSend(v24, "compileAndUpdateDeviceCachesWithAsset:assetType:endpointId:errOut:", v27, 0, 0, &v33);
            v28 = v33;

            v4 = v26;
            v29 = *v26;
            if (os_log_type_enabled(*v26, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v31;
              v40 = "-[CSVoiceTriggerAssetHandlerMac CSVoiceTriggerEnabledMonitor:didReceiveEnabled:]_block_invoke";
              v41 = 2112;
              v42 = v19;
              v43 = 2112;
              v44 = v28;
              _os_log_impl(&dword_1C2614000, v29, OS_LOG_TYPE_DEFAULT, "%s VoiceTrigger is enabled, recompiling assets for endpointId: %@ completed with error: %@", buf, 0x20u);
            }

            v3 = v23;
          }
          ++v18;
        }
        while (v16 != v18);
        v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v45, 16);
      }
      while (v16);
    }

  }
  else
  {
    v30 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v40 = "-[CSVoiceTriggerAssetHandlerMac CSVoiceTriggerEnabledMonitor:didReceiveEnabled:]_block_invoke";
      _os_log_impl(&dword_1C2614000, v30, OS_LOG_TYPE_DEFAULT, "%s endpoint asset is not cached, skip compilation", buf, 0xCu);
    }
  }
}

void __52__CSVoiceTriggerAssetHandlerMac_triggerAssetRefresh__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  __int128 *p_buf;
  __int128 buf;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "cachedAsset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "assetProvider");

  if (v3 == 2)
  {
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v16 = 0x3032000000;
    v17 = __Block_byref_object_copy__12353;
    v18 = __Block_byref_object_dispose__12354;
    v19 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D19178]), "initWithDescription:", CFSTR("VTAssetRefresh"));
    objc_msgSend(*(id *)(a1 + 32), "cachedAsset");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "configVersion");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = *(void **)(*(_QWORD *)(a1 + 32) + 88);
    objc_msgSend(MEMORY[0x1E0D19260], "getSiriLanguageWithFallback:", CFSTR("en-US"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __52__CSVoiceTriggerAssetHandlerMac_triggerAssetRefresh__block_invoke_20;
    v11[3] = &unk_1E7C28D70;
    v8 = v5;
    v9 = *(_QWORD *)(a1 + 32);
    v12 = v8;
    v13 = v9;
    p_buf = &buf;
    objc_msgSend(v6, "getInstalledAssetofType:forLocale:completion:", 0, v7, v11);

    _Block_object_dispose(&buf, 8);
  }
  else
  {
    v10 = *MEMORY[0x1E0D18F30];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F30], OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 136315138;
      *(_QWORD *)((char *)&buf + 4) = "-[CSVoiceTriggerAssetHandlerMac triggerAssetRefresh]_block_invoke";
      _os_log_impl(&dword_1C2614000, v10, OS_LOG_TYPE_INFO, "%s Nothing to do", (uint8_t *)&buf, 0xCu);
    }
  }
}

void __52__CSVoiceTriggerAssetHandlerMac_triggerAssetRefresh__block_invoke_20(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  int v14;
  const char *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = v5;
  if (v5 && !a3)
  {
    objc_msgSend(v5, "configVersion");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7 && (objc_msgSend(v7, "isEqualToString:", *(_QWORD *)(a1 + 32)) & 1) == 0)
    {
      v9 = *MEMORY[0x1E0D18F30];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F30], OS_LOG_TYPE_DEFAULT))
      {
        v10 = *(_QWORD *)(a1 + 32);
        v14 = 136315650;
        v15 = "-[CSVoiceTriggerAssetHandlerMac triggerAssetRefresh]_block_invoke";
        v16 = 2112;
        v17 = v10;
        v18 = 2112;
        v19 = v8;
        _os_log_impl(&dword_1C2614000, v9, OS_LOG_TYPE_DEFAULT, "%s Triggering ABC for asset sync mismatch, before asset version: %@ after refresh asset version: %@", (uint8_t *)&v14, 0x20u);
      }
      objc_msgSend(MEMORY[0x1E0D190B8], "sharedInstance");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "submitTrialIssueReport:", *MEMORY[0x1E0D19398]);

      objc_msgSend(*(id *)(a1 + 40), "setCachedAsset:", v6);
    }

  }
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = 0;

}

void __69__CSVoiceTriggerAssetHandlerMac__checkNewAssetAvailablityForEndpoint__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  void *v8;
  void *v9;
  id obj;
  _QWORD v11[6];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v13;
    v5 = MEMORY[0x1E0C809B0];
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v13 != v4)
          objc_enumerationMutation(obj);
        v7 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0D19260], "getSiriLanguageWithEndpointId:fallbackLanguage:", v7, CFSTR("en-US"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = *(void **)(a1 + 32);
        v11[0] = v5;
        v11[1] = 3221225472;
        v11[2] = __69__CSVoiceTriggerAssetHandlerMac__checkNewAssetAvailablityForEndpoint__block_invoke_2;
        v11[3] = &unk_1E7C26A18;
        v11[4] = v9;
        v11[5] = v7;
        objc_msgSend(v9, "_getVoiceTriggerAssetFromAssetManagerWithLocale:completion:", v8, v11);

      }
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v3);
  }

}

void __69__CSVoiceTriggerAssetHandlerMac__checkNewAssetAvailablityForEndpoint__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  __int128 v13;

  v5 = a2;
  v6 = a3;
  v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __69__CSVoiceTriggerAssetHandlerMac__checkNewAssetAvailablityForEndpoint__block_invoke_3;
  v10[3] = &unk_1E7C27E78;
  v11 = v6;
  v12 = v5;
  v13 = *(_OWORD *)(a1 + 32);
  v8 = v5;
  v9 = v6;
  dispatch_async(v7, v10);

}

void __69__CSVoiceTriggerAssetHandlerMac__checkNewAssetAvailablityForEndpoint__block_invoke_3(uint64_t a1)
{
  void *v2;
  os_log_t *v3;
  void *v4;
  os_log_t v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  NSObject *v18;
  _QWORD *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  NSObject *v24;
  uint64_t v25;
  void *v26;
  NSObject *v27;
  NSObject *v28;
  void *v29;
  id v30;
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  id v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v3 = (os_log_t *)MEMORY[0x1E0D18F30];
  if (v2)
  {
    v4 = (void *)*MEMORY[0x1E0D18F30];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F30], OS_LOG_TYPE_ERROR))
    {
      v28 = v4;
      objc_msgSend(v2, "localizedDescription");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v32 = "-[CSVoiceTriggerAssetHandlerMac _checkNewAssetAvailablityForEndpoint]_block_invoke_3";
      v33 = 2114;
      v34 = v29;
      _os_log_error_impl(&dword_1C2614000, v28, OS_LOG_TYPE_ERROR, "%s Asset Query failed : %{public}@", buf, 0x16u);

    }
  }
  if (*(_QWORD *)(a1 + 40))
  {
    v5 = *v3;
    if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(void **)(a1 + 48);
      v7 = v5;
      objc_msgSend(v6, "cachedEndpointAssets");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 56));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "path");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "path");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v32 = "-[CSVoiceTriggerAssetHandlerMac _checkNewAssetAvailablityForEndpoint]_block_invoke";
      v33 = 2114;
      v34 = v10;
      v35 = 2114;
      v36 = v11;
      _os_log_impl(&dword_1C2614000, v7, OS_LOG_TYPE_DEFAULT, "%s cached asset:%{public}@, new asset:%{public}@", buf, 0x20u);

    }
    objc_msgSend(*(id *)(a1 + 48), "cachedEndpointAssets");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 56));
    v13 = objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v14 = (void *)v13;
      objc_msgSend(*(id *)(a1 + 48), "cachedEndpointAssets");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 56));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "isEqualAsset:", *(_QWORD *)(a1 + 40));

      if (v17)
      {
        v18 = *v3;
        if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          v32 = "-[CSVoiceTriggerAssetHandlerMac _checkNewAssetAvailablityForEndpoint]_block_invoke";
          _os_log_impl(&dword_1C2614000, v18, OS_LOG_TYPE_DEFAULT, "%s New asset is same as cached asset, ignore notification", buf, 0xCu);
        }
        return;
      }
    }
    else
    {

    }
    v19 = *(_QWORD **)(a1 + 48);
    v20 = (void *)v19[12];
    if (v20)
    {
      v21 = *(_QWORD *)(a1 + 40);
      v22 = *(_QWORD *)(a1 + 56);
      v30 = 0;
      objc_msgSend(v20, "compileAndUpdateDeviceCachesWithAsset:assetType:endpointId:errOut:", v21, 0, v22, &v30);
      v23 = v30;
      v24 = *v3;
      if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v32 = "-[CSVoiceTriggerAssetHandlerMac _checkNewAssetAvailablityForEndpoint]_block_invoke";
        v33 = 2112;
        v34 = v23;
        _os_log_impl(&dword_1C2614000, v24, OS_LOG_TYPE_DEFAULT, "%s Compile cached asset to onDevice CacheIr with error: %@", buf, 0x16u);
      }
      v19 = *(_QWORD **)(a1 + 48);
    }
    else
    {
      v23 = 0;
    }
    v25 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v19, "cachedEndpointAssets");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setObject:forKeyedSubscript:", v25, *(_QWORD *)(a1 + 56));

    objc_msgSend(*(id *)(a1 + 48), "notifyObservers:endpointId:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));
    v27 = *v3;
    if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v32 = "-[CSVoiceTriggerAssetHandlerMac _checkNewAssetAvailablityForEndpoint]_block_invoke";
      _os_log_impl(&dword_1C2614000, v27, OS_LOG_TYPE_DEFAULT, "%s New asset is different from cached one. Updating cached asset", buf, 0xCu);
    }

  }
}

void __58__CSVoiceTriggerAssetHandlerMac__checkNewAssetAvailablity__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  os_log_t *v7;
  void *v8;
  os_log_t v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  NSObject *v17;
  _QWORD *v18;
  void *v19;
  id v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  id v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  id v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (os_log_t *)MEMORY[0x1E0D18F30];
  if (v6 && (v8 = (void *)*MEMORY[0x1E0D18F30], os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F30], OS_LOG_TYPE_ERROR)))
  {
    v23 = v8;
    objc_msgSend(v6, "localizedDescription");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v27 = "-[CSVoiceTriggerAssetHandlerMac _checkNewAssetAvailablity]_block_invoke";
    v28 = 2114;
    v29 = v24;
    _os_log_error_impl(&dword_1C2614000, v23, OS_LOG_TYPE_ERROR, "%s Asset Query failed : %{public}@", buf, 0x16u);

    if (!v5)
      goto LABEL_17;
  }
  else if (!v5)
  {
    goto LABEL_17;
  }
  v9 = *v7;
  if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
  {
    v10 = *(void **)(a1 + 32);
    v11 = v9;
    objc_msgSend(v10, "cachedAsset");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "path");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "path");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v27 = "-[CSVoiceTriggerAssetHandlerMac _checkNewAssetAvailablity]_block_invoke";
    v28 = 2114;
    v29 = v13;
    v30 = 2114;
    v31 = v14;
    _os_log_impl(&dword_1C2614000, v11, OS_LOG_TYPE_DEFAULT, "%s cached asset:%{public}@, new asset:%{public}@", buf, 0x20u);

  }
  objc_msgSend(*(id *)(a1 + 32), "cachedAsset");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "isEqualAsset:", v5);

  if (v16)
  {
    v17 = *v7;
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v27 = "-[CSVoiceTriggerAssetHandlerMac _checkNewAssetAvailablity]_block_invoke";
      _os_log_impl(&dword_1C2614000, v17, OS_LOG_TYPE_DEFAULT, "%s New asset is same as cached asset, ignore notification", buf, 0xCu);
    }
  }
  else
  {
    v18 = *(_QWORD **)(a1 + 32);
    v19 = (void *)v18[12];
    if (v19)
    {
      v25 = 0;
      objc_msgSend(v19, "compileAndUpdateDeviceCachesWithAsset:assetType:endpointId:errOut:", v5, 0, 0, &v25);
      v20 = v25;
      v21 = *v7;
      if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v27 = "-[CSVoiceTriggerAssetHandlerMac _checkNewAssetAvailablity]_block_invoke";
        v28 = 2112;
        v29 = v20;
        _os_log_impl(&dword_1C2614000, v21, OS_LOG_TYPE_DEFAULT, "%s Compile cached asset to onDevice CacheIr with error: %@", buf, 0x16u);
      }
      v18 = *(_QWORD **)(a1 + 32);
    }
    else
    {
      v20 = 0;
    }
    objc_msgSend(v18, "setCachedAsset:", v5);
    objc_msgSend(*(id *)(a1 + 32), "notifyObservers:endpointId:", v5, 0);
    v22 = *v7;
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v27 = "-[CSVoiceTriggerAssetHandlerMac _checkNewAssetAvailablity]_block_invoke";
      _os_log_impl(&dword_1C2614000, v22, OS_LOG_TYPE_DEFAULT, "%s New asset is different from cached one. Updating cached asset", buf, 0xCu);
    }

  }
LABEL_17:

}

void __109__CSVoiceTriggerAssetHandlerMac__getVoiceTriggerAssetFromAssetManagerWithLocale_bundleIdentifier_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  const char *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = *MEMORY[0x1E0D18F30];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F30], OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(_QWORD *)(a1 + 32);
    v10 = 136315650;
    v11 = "-[CSVoiceTriggerAssetHandlerMac _getVoiceTriggerAssetFromAssetManagerWithLocale:bundleIdentifier:completion:]_block_invoke";
    v12 = 2114;
    v13 = v8;
    v14 = 2114;
    v15 = v5;
    _os_log_impl(&dword_1C2614000, v7, OS_LOG_TYPE_DEFAULT, "%s CSVoiceTriggerAsset (%{public}@) found: %{public}@", (uint8_t *)&v10, 0x20u);
  }
  v9 = *(_QWORD *)(a1 + 40);
  if (v9)
    (*(void (**)(uint64_t, id, id))(v9 + 16))(v9, v5, v6);

}

void __109__CSVoiceTriggerAssetHandlerMac__getVoiceTriggerAssetFromAssetManagerWithLocale_bundleIdentifier_completion___block_invoke_13(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  v3 = *(void **)(a1 + 40);
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 80);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __109__CSVoiceTriggerAssetHandlerMac__getVoiceTriggerAssetFromAssetManagerWithLocale_bundleIdentifier_completion___block_invoke_2;
  v5[3] = &unk_1E7C28D20;
  v6 = v3;
  objc_msgSend(v4, "assetOfType:language:completion:", 0, a2, v5);

}

void __109__CSVoiceTriggerAssetHandlerMac__getVoiceTriggerAssetFromAssetManagerWithLocale_bundleIdentifier_completion___block_invoke_15(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  int v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    v8 = *MEMORY[0x1E0D18F30];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F30], OS_LOG_TYPE_INFO))
    {
      v9 = 136315138;
      v10 = "-[CSVoiceTriggerAssetHandlerMac _getVoiceTriggerAssetFromAssetManagerWithLocale:bundleIdentifier:completion:]_block_invoke";
      _os_log_impl(&dword_1C2614000, v8, OS_LOG_TYPE_INFO, "%s UAF assets not available, fallback to MA assets", (uint8_t *)&v9, 0xCu);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __109__CSVoiceTriggerAssetHandlerMac__getVoiceTriggerAssetFromAssetManagerWithLocale_bundleIdentifier_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = (void *)*MEMORY[0x1E0D18F30];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F30], OS_LOG_TYPE_ERROR))
    {
      v8 = v7;
      objc_msgSend(v6, "localizedDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 136315394;
      v11 = "-[CSVoiceTriggerAssetHandlerMac _getVoiceTriggerAssetFromAssetManagerWithLocale:bundleIdentifier:completion:"
            "]_block_invoke_2";
      v12 = 2114;
      v13 = v9;
      _os_log_error_impl(&dword_1C2614000, v8, OS_LOG_TYPE_ERROR, "%s Cannot get a VoiceTrigger mobile asset : %{public}@", (uint8_t *)&v10, 0x16u);

    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

uint64_t __79__CSVoiceTriggerAssetHandlerMac_getVoiceTriggerAssetWithEndpointId_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleEndpointVoiceTriggerAsset:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __77__CSVoiceTriggerAssetHandlerMac__handleEndpointVoiceTriggerAsset_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  id v12;
  _QWORD block[5];
  id v14;
  id v15;
  id v16;
  id v17;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(a1 + 40);
  v9 = *(NSObject **)(v7 + 24);
  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __77__CSVoiceTriggerAssetHandlerMac__handleEndpointVoiceTriggerAsset_completion___block_invoke_2;
  block[3] = &unk_1E7C27360;
  block[1] = 3221225472;
  block[4] = v7;
  v14 = v5;
  v15 = v8;
  v10 = *(id *)(a1 + 48);
  v16 = v6;
  v17 = v10;
  v11 = v6;
  v12 = v5;
  dispatch_async(v9, block);

}

void __77__CSVoiceTriggerAssetHandlerMac__handleEndpointVoiceTriggerAsset_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "defaultFallbackModelIfNil:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2
    && (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "setObject:forKeyedSubscript:", v2, *(_QWORD *)(a1 + 48)),
        (v3 = *(void **)(*(_QWORD *)(a1 + 32) + 96)) != 0))
  {
    v4 = *(_QWORD *)(a1 + 48);
    v9 = 0;
    objc_msgSend(v3, "compileAndUpdateDeviceCachesWithAsset:assetType:endpointId:errOut:", v2, 0, v4, &v9);
    v5 = v9;
    v6 = *MEMORY[0x1E0D18F30];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F30], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v11 = "-[CSVoiceTriggerAssetHandlerMac _handleEndpointVoiceTriggerAsset:completion:]_block_invoke_2";
      v12 = 2112;
      v13 = v5;
      _os_log_impl(&dword_1C2614000, v6, OS_LOG_TYPE_DEFAULT, "%s Compile cached asset to onDevice CacheIr with error: %@", buf, 0x16u);
    }
  }
  else
  {
    v5 = 0;
  }
  v7 = *(_QWORD *)(a1 + 64);
  if (v7)
  {
    if (*(_QWORD *)(a1 + 56) || !v5)
    {
      (*(void (**)(_QWORD, void *))(v7 + 16))(*(_QWORD *)(a1 + 64), v2);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "defaultFallbackModelIfNil:", 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *, id))(v7 + 16))(v7, v8, v5);

    }
  }

}

void __72__CSVoiceTriggerAssetHandlerMac__handleVoiceTriggerAssetWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "defaultFallbackModelIfNil:", a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6
    && (objc_msgSend(*(id *)(a1 + 32), "setCachedAsset:", v6), (v7 = *(void **)(*(_QWORD *)(a1 + 32) + 96)) != 0))
  {
    v12 = 0;
    objc_msgSend(v7, "compileAndUpdateDeviceCachesWithAsset:assetType:endpointId:errOut:", v6, 0, 0, &v12);
    v8 = v12;
    v9 = *MEMORY[0x1E0D18F30];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F30], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v14 = "-[CSVoiceTriggerAssetHandlerMac _handleVoiceTriggerAssetWithCompletion:]_block_invoke";
      v15 = 2112;
      v16 = v8;
      _os_log_impl(&dword_1C2614000, v9, OS_LOG_TYPE_DEFAULT, "%s Compile cached asset to onDevice CacheIr with error: %@", buf, 0x16u);
    }
  }
  else
  {
    v8 = 0;
  }
  v10 = *(_QWORD *)(a1 + 40);
  if (v10)
  {
    if (v5 || !v8)
    {
      (*(void (**)(_QWORD, void *, id))(v10 + 16))(*(_QWORD *)(a1 + 40), v6, v5);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "defaultFallbackModelIfNil:", 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *, id))(v10 + 16))(v10, v11, v8);

    }
  }

}

@end
