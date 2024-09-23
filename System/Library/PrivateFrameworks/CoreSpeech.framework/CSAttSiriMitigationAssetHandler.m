@implementation CSAttSiriMitigationAssetHandler

- (CSAttSiriMitigationAssetHandler)init
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  CSAttSiriMitigationAssetHandler *v7;

  objc_msgSend(MEMORY[0x1E0D19110], "sharedPreferences");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isMitigationAssetOverridingEnabled");
  objc_msgSend(MEMORY[0x1E0D19110], "sharedPreferences");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fakeMitigationAssetPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[CSAttSiriMitigationAssetHandler initWithAssetManager:withUAFAssetManager:withUAFDownloadMonitor:withLanguageCodeUpdateMonitor:withAssetOverrideFlag:withOverrideAssetPath:](self, "initWithAssetManager:withUAFAssetManager:withUAFDownloadMonitor:withLanguageCodeUpdateMonitor:withAssetOverrideFlag:withOverrideAssetPath:", 0, 0, 0, 0, v4, v6);

  return v7;
}

- (CSAttSiriMitigationAssetHandler)initWithDisableOnDeviceCompilation
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  CSAttSiriMitigationAssetHandler *v7;
  uint64_t v9;

  objc_msgSend(MEMORY[0x1E0D19110], "sharedPreferences");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isMitigationAssetOverridingEnabled");
  objc_msgSend(MEMORY[0x1E0D19110], "sharedPreferences");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fakeMitigationAssetPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v9) = 1;
  v7 = -[CSAttSiriMitigationAssetHandler initWithAssetManager:withUAFAssetManager:withUAFDownloadMonitor:withLanguageCodeUpdateMonitor:withAssetOverrideFlag:withOverrideAssetPath:disableOnDeviceCompilation:](self, "initWithAssetManager:withUAFAssetManager:withUAFDownloadMonitor:withLanguageCodeUpdateMonitor:withAssetOverrideFlag:withOverrideAssetPath:disableOnDeviceCompilation:", 0, 0, 0, 0, v4, v6, v9);

  return v7;
}

- (CSAttSiriMitigationAssetHandler)initWithAssetManager:(id)a3 withUAFAssetManager:(id)a4 withUAFDownloadMonitor:(id)a5 withLanguageCodeUpdateMonitor:(id)a6 withAssetOverrideFlag:(BOOL)a7 withOverrideAssetPath:(id)a8 disableOnDeviceCompilation:(BOOL)a9
{
  _BOOL4 v10;
  id v16;
  id v17;
  CSAttSiriMitigationAssetHandler *v18;
  dispatch_queue_t v19;
  OS_dispatch_queue *queue;
  void **p_assetManager;
  uint64_t v22;
  void *v23;
  void **p_uafDownloadMonitor;
  uint64_t v25;
  void *v26;
  void **p_uafAssetManager;
  uint64_t v28;
  void *v29;
  void **p_languageCodeUpdateMonitor;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  CSOnDeviceCompilationHandler *onDeviceCompilationHandler;
  uint64_t v35;
  NSHashTable *observers;
  id v38;
  id v39;
  id v40;
  objc_super v41;

  v10 = a7;
  v40 = a3;
  v39 = a4;
  v38 = a5;
  v16 = a6;
  v17 = a8;
  v41.receiver = self;
  v41.super_class = (Class)CSAttSiriMitigationAssetHandler;
  v18 = -[CSAttSiriMitigationAssetHandler init](&v41, sel_init);
  if (v18)
  {
    v19 = dispatch_queue_create("CSAttSiriMitigationAssetHandler", 0);
    queue = v18->_queue;
    v18->_queue = (OS_dispatch_queue *)v19;

    p_assetManager = (void **)&v18->_assetManager;
    objc_storeStrong((id *)&v18->_assetManager, a3);
    if (!v18->_assetManager)
    {
      +[CSAssetManager sharedManager](CSAssetManager, "sharedManager");
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = *p_assetManager;
      *p_assetManager = (void *)v22;

    }
    p_uafDownloadMonitor = (void **)&v18->_uafDownloadMonitor;
    objc_storeStrong((id *)&v18->_uafDownloadMonitor, a5);
    if (!v18->_uafDownloadMonitor)
    {
      objc_msgSend(MEMORY[0x1E0D19248], "sharedInstance");
      v25 = objc_claimAutoreleasedReturnValue();
      v26 = *p_uafDownloadMonitor;
      *p_uafDownloadMonitor = (void *)v25;

    }
    p_uafAssetManager = (void **)&v18->_uafAssetManager;
    objc_storeStrong((id *)&v18->_uafAssetManager, a4);
    if (!v18->_uafAssetManager)
    {
      objc_msgSend(MEMORY[0x1E0D19240], "sharedInstance");
      v28 = objc_claimAutoreleasedReturnValue();
      v29 = *p_uafAssetManager;
      *p_uafAssetManager = (void *)v28;

    }
    v18->_overrideEnabled = v10;
    if (v10)
      objc_storeStrong((id *)&v18->_overridePath, a8);
    p_languageCodeUpdateMonitor = (void **)&v18->_languageCodeUpdateMonitor;
    objc_storeStrong((id *)&v18->_languageCodeUpdateMonitor, a6);
    if (v18->_languageCodeUpdateMonitor)
    {
      if (a9)
        goto LABEL_16;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D19158], "sharedInstance");
      v31 = objc_claimAutoreleasedReturnValue();
      v32 = *p_languageCodeUpdateMonitor;
      *p_languageCodeUpdateMonitor = (void *)v31;

      if (a9)
      {
LABEL_16:
        -[CSAttSiriMitigationAssetHandler setCachedAssetWithOverride:](v18, "setCachedAssetWithOverride:", 0);
        -[CSAttSiriMitigationAssetHandler start](v18, "start");
        objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
        v35 = objc_claimAutoreleasedReturnValue();
        observers = v18->_observers;
        v18->_observers = (NSHashTable *)v35;

        goto LABEL_17;
      }
    }
    if (!v18->_onDeviceCompilationHandler)
    {
      objc_msgSend(MEMORY[0x1E0D19180], "sharedHandler");
      v33 = objc_claimAutoreleasedReturnValue();
      onDeviceCompilationHandler = v18->_onDeviceCompilationHandler;
      v18->_onDeviceCompilationHandler = (CSOnDeviceCompilationHandler *)v33;

    }
    goto LABEL_16;
  }
LABEL_17:

  return v18;
}

- (CSAttSiriMitigationAssetHandler)initWithAssetManager:(id)a3 withUAFAssetManager:(id)a4 withUAFDownloadMonitor:(id)a5 withLanguageCodeUpdateMonitor:(id)a6 withAssetOverrideFlag:(BOOL)a7 withOverrideAssetPath:(id)a8
{
  uint64_t v9;

  LOBYTE(v9) = 0;
  return -[CSAttSiriMitigationAssetHandler initWithAssetManager:withUAFAssetManager:withUAFDownloadMonitor:withLanguageCodeUpdateMonitor:withAssetOverrideFlag:withOverrideAssetPath:disableOnDeviceCompilation:](self, "initWithAssetManager:withUAFAssetManager:withUAFDownloadMonitor:withLanguageCodeUpdateMonitor:withAssetOverrideFlag:withOverrideAssetPath:disableOnDeviceCompilation:", a3, a4, a5, a6, a7, a8, v9);
}

- (void)start
{
  id v3;

  -[CSUAFDownloadMonitor addObserver:](self->_uafDownloadMonitor, "addObserver:", self);
  -[CSLanguageCodeUpdateMonitor addObserver:](self->_languageCodeUpdateMonitor, "addObserver:", self);
  objc_msgSend(MEMORY[0x1E0D19280], "sharedInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:", self);

}

- (void)registerObserver:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52__CSAttSiriMitigationAssetHandler_registerObserver___block_invoke;
  v7[3] = &unk_1E7C292A0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)unregisterObserver:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __54__CSAttSiriMitigationAssetHandler_unregisterObserver___block_invoke;
  v7[3] = &unk_1E7C292A0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)notifyObservers:(id)a3 endpointId:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__CSAttSiriMitigationAssetHandler_notifyObservers_endpointId___block_invoke;
  block[3] = &unk_1E7C291C0;
  block[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(queue, block);

}

- (void)setCachedAssetWithOverride:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  void *v11;
  CSAsset *v12;
  CSAsset *cachedAsset;
  CSOnDeviceCompilationHandler *onDeviceCompilationHandler;
  CSAsset *v15;
  id v16;
  NSObject *v17;
  id v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_overrideEnabled)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "fileExistsAtPath:", self->_overridePath);

    if (v6)
    {
      -[NSString stringByDeletingLastPathComponent](self->_overridePath, "stringByDeletingLastPathComponent");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D18FC0], "assetForAssetType:resourcePath:configVersion:assetProvider:", 6, v7, CFSTR("override-asset"), 2);
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = (void *)setCachedAssetWithOverride__overrideAsset;
      setCachedAssetWithOverride__overrideAsset = v8;

      v10 = *MEMORY[0x1E0D18F30];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F30], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v20 = "-[CSAttSiriMitigationAssetHandler setCachedAssetWithOverride:]";
        v21 = 2112;
        v22 = setCachedAssetWithOverride__overrideAsset;
        _os_log_impl(&dword_1C2614000, v10, OS_LOG_TYPE_DEFAULT, "%s Using override asset: %@", buf, 0x16u);
      }

    }
  }
  v11 = (void *)setCachedAssetWithOverride__overrideAsset;
  if (!setCachedAssetWithOverride__overrideAsset)
    v11 = v4;
  v12 = v11;
  cachedAsset = self->_cachedAsset;
  self->_cachedAsset = v12;

  onDeviceCompilationHandler = self->_onDeviceCompilationHandler;
  if (onDeviceCompilationHandler)
  {
    v15 = self->_cachedAsset;
    v18 = 0;
    -[CSOnDeviceCompilationHandler compileAndUpdateDeviceCachesWithAsset:assetType:endpointId:errOut:](onDeviceCompilationHandler, "compileAndUpdateDeviceCachesWithAsset:assetType:endpointId:errOut:", v15, 6, 0, &v18);
    v16 = v18;
    v17 = *MEMORY[0x1E0D18F30];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F30], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v20 = "-[CSAttSiriMitigationAssetHandler setCachedAssetWithOverride:]";
      v21 = 2112;
      v22 = (uint64_t)v16;
      _os_log_impl(&dword_1C2614000, v17, OS_LOG_TYPE_DEFAULT, "%s Compile override Mitigation asset to onDevice CacheIr with error: %@", buf, 0x16u);
    }

  }
}

- (void)getMitigationAssetWithEndpointId:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __79__CSAttSiriMitigationAssetHandler_getMitigationAssetWithEndpointId_completion___block_invoke;
  block[3] = &unk_1E7C28EC8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

- (void)_getMitigationAssetWithEndpointId:(id)a3 completion:(id)a4
{
  id v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  void (**v9)(_QWORD, _QWORD, _QWORD);
  CSAsset *cachedAsset;
  CSUAFAssetManager *uafAssetManager;
  void *v12;
  id v13;
  void *v14;
  _QWORD v15[5];
  void (**v16)(_QWORD, _QWORD, _QWORD);
  _QWORD v17[4];
  id v18;

  v5 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v6 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __80__CSAttSiriMitigationAssetHandler__getMitigationAssetWithEndpointId_completion___block_invoke;
  v17[3] = &unk_1E7C28D20;
  v7 = v5;
  v18 = v7;
  v8 = MEMORY[0x1C3BC4734](v17);
  v9 = (void (**)(_QWORD, _QWORD, _QWORD))v8;
  cachedAsset = self->_cachedAsset;
  if (cachedAsset)
  {
    (*(void (**)(uint64_t, CSAsset *, _QWORD))(v8 + 16))(v8, cachedAsset, 0);
  }
  else
  {
    uafAssetManager = self->_uafAssetManager;
    if (uafAssetManager)
    {
      objc_msgSend(MEMORY[0x1E0D19260], "getSiriLanguageWithFallback:", CFSTR("en-US"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = v6;
      v15[1] = 3221225472;
      v15[2] = __80__CSAttSiriMitigationAssetHandler__getMitigationAssetWithEndpointId_completion___block_invoke_2;
      v15[3] = &unk_1E7C28D48;
      v15[4] = self;
      v16 = v9;
      -[CSUAFAssetManager getInstalledAssetofType:forLocale:completion:](uafAssetManager, "getInstalledAssetofType:forLocale:completion:", 6, v12, v15);

    }
    else
    {
      v13 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v14 = (void *)objc_msgSend(v13, "initWithDomain:code:userInfo:", *MEMORY[0x1E0D18E80], 1601, 0);
      ((void (**)(_QWORD, _QWORD, void *))v9)[2](v9, 0, v14);

    }
  }

}

- (void)triggerAssetRefresh
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__CSAttSiriMitigationAssetHandler_triggerAssetRefresh__block_invoke;
  block[3] = &unk_1E7C292C8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_receivedNewAssetUpdate:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  const char *v7;
  NSObject *v8;
  uint32_t v9;
  NSObject *v10;
  int v11;
  const char *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4 && objc_msgSend(v4, "assetProvider") != 2)
  {
    v10 = *MEMORY[0x1E0D18F30];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F30], OS_LOG_TYPE_DEFAULT))
    {
      v11 = 136315138;
      v12 = "-[CSAttSiriMitigationAssetHandler _receivedNewAssetUpdate:]";
      v7 = "%s Ignore MA asset update";
      v8 = v10;
      v9 = 12;
      goto LABEL_7;
    }
  }
  else
  {
    -[CSAttSiriMitigationAssetHandler setCachedAssetWithOverride:](self, "setCachedAssetWithOverride:", v5);
    -[CSAttSiriMitigationAssetHandler notifyObservers:endpointId:](self, "notifyObservers:endpointId:", v5, 0);
    v6 = *MEMORY[0x1E0D18F30];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F30], OS_LOG_TYPE_DEFAULT))
    {
      v11 = 136315394;
      v12 = "-[CSAttSiriMitigationAssetHandler _receivedNewAssetUpdate:]";
      v13 = 2112;
      v14 = v5;
      v7 = "%s Updated cache with new UAF asset %@";
      v8 = v6;
      v9 = 22;
LABEL_7:
      _os_log_impl(&dword_1C2614000, v8, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v11, v9);
    }
  }

}

- (id)getNeuralCombinerConfigFile
{
  return 0;
}

- (void)assetDownloadMonitorDelegate:(id)a3 assetType:(unint64_t)a4
{
  id v6;
  NSObject *queue;
  NSObject *v8;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  unint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (a4 == 6)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __74__CSAttSiriMitigationAssetHandler_assetDownloadMonitorDelegate_assetType___block_invoke;
    block[3] = &unk_1E7C292C8;
    block[4] = self;
    dispatch_async(queue, block);
  }
  else
  {
    v8 = *MEMORY[0x1E0D18F30];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F30], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v11 = "-[CSAttSiriMitigationAssetHandler assetDownloadMonitorDelegate:assetType:]";
      v12 = 2048;
      v13 = a4;
      _os_log_impl(&dword_1C2614000, v8, OS_LOG_TYPE_INFO, "%s Ignore Trial asset update for type: %lu", buf, 0x16u);
    }
  }

}

- (void)CSLanguageCodeUpdateMonitor:(id)a3 didReceiveLanguageCodeChanged:(id)a4
{
  CSUAFAssetManager *uafAssetManager;
  void *v6;
  _QWORD v7[5];

  -[CSAttSiriMitigationAssetHandler setCachedAssetWithOverride:](self, "setCachedAssetWithOverride:", 0, a4);
  uafAssetManager = self->_uafAssetManager;
  objc_msgSend(MEMORY[0x1E0D19260], "getSiriLanguageWithFallback:", CFSTR("en-US"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __93__CSAttSiriMitigationAssetHandler_CSLanguageCodeUpdateMonitor_didReceiveLanguageCodeChanged___block_invoke;
  v7[3] = &unk_1E7C28D98;
  v7[4] = self;
  -[CSUAFAssetManager getInstalledAssetofType:forLocale:completion:](uafAssetManager, "getInstalledAssetofType:forLocale:completion:", 6, v6, v7);

}

- (void)_getPreinstalledMitigationAssetForCurrentLocale:(id)a3
{
  id v3;
  id v4;
  void (**v5)(_QWORD, _QWORD, _QWORD);
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  id v21;
  NSObject *v22;
  id v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[3];
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __83__CSAttSiriMitigationAssetHandler__getPreinstalledMitigationAssetForCurrentLocale___block_invoke;
  v25[3] = &unk_1E7C28D20;
  v4 = v3;
  v26 = v4;
  v5 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1C3BC4734](v25);
  objc_msgSend(MEMORY[0x1E0D19260], "getSiriLanguageWithFallback:", CFSTR("en-US"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D18FC0], "fallBackAssetResourcePath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByAppendingPathComponent:", CFSTR("/PreinstalledAssets/preinstalledMeta.json"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "fileExistsAtPath:", v8);

  if ((v10 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0D18FC0], "decodeJson:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v13 = (void *)MEMORY[0x1E0CB3940];
      CSSystemRootDirectory();
      v24 = v6;
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v27[0] = v14;
      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("resourcePath"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v27[1] = v15;
      v27[2] = CFSTR("mitigation");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 3);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "pathWithComponents:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("configVersion"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D18FC0], "assetForAssetType:resourcePath:configVersion:assetProvider:", 6, v17, v18, 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *, _QWORD))v5)[2](v5, v19, 0);

      v6 = v24;
    }
    else
    {
      v22 = *MEMORY[0x1E0D18F30];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F30], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v29 = "-[CSAttSiriMitigationAssetHandler _getPreinstalledMitigationAssetForCurrentLocale:]";
        v30 = 2112;
        v31 = v6;
        v32 = 2112;
        v33 = v11;
        _os_log_error_impl(&dword_1C2614000, v22, OS_LOG_TYPE_ERROR, "%s Could not find AssetMeta for current locale: %@, preinstalledAssetMeta: %@. No mitigation functionality", buf, 0x20u);
      }
      v23 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v17 = (void *)objc_msgSend(v23, "initWithDomain:code:userInfo:", *MEMORY[0x1E0D18E80], 1601, 0);
      ((void (**)(_QWORD, _QWORD, void *))v5)[2](v5, 0, v17);
    }

  }
  else
  {
    v20 = *MEMORY[0x1E0D18F30];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F30], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v29 = "-[CSAttSiriMitigationAssetHandler _getPreinstalledMitigationAssetForCurrentLocale:]";
      v30 = 2114;
      v31 = v8;
      _os_log_error_impl(&dword_1C2614000, v20, OS_LOG_TYPE_ERROR, "%s Preinstalled model meta not found: %{public}@. No mitigation functionality.", buf, 0x16u);
    }
    v21 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v11 = (void *)objc_msgSend(v21, "initWithDomain:code:userInfo:", *MEMORY[0x1E0D18E80], 1601, 0);
    ((void (**)(_QWORD, _QWORD, void *))v5)[2](v5, 0, v11);
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
    block[2] = __82__CSAttSiriMitigationAssetHandler_CSVoiceTriggerEnabledMonitor_didReceiveEnabled___block_invoke;
    block[3] = &unk_1E7C292C8;
    block[4] = self;
    dispatch_async(queue, block);
  }

}

- (CSAsset)cachedAsset
{
  return (CSAsset *)objc_getProperty(self, a2, 16, 1);
}

- (void)setCachedAsset:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
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

- (CSUAFDownloadMonitor)uafDownloadMonitor
{
  return self->_uafDownloadMonitor;
}

- (void)setUafDownloadMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_uafDownloadMonitor, a3);
}

- (CSLanguageCodeUpdateMonitor)languageCodeUpdateMonitor
{
  return self->_languageCodeUpdateMonitor;
}

- (void)setLanguageCodeUpdateMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_languageCodeUpdateMonitor, a3);
}

- (BOOL)overrideEnabled
{
  return self->_overrideEnabled;
}

- (void)setOverrideEnabled:(BOOL)a3
{
  self->_overrideEnabled = a3;
}

- (NSString)overridePath
{
  return self->_overridePath;
}

- (void)setOverridePath:(id)a3
{
  objc_storeStrong((id *)&self->_overridePath, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
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
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_overridePath, 0);
  objc_storeStrong((id *)&self->_languageCodeUpdateMonitor, 0);
  objc_storeStrong((id *)&self->_uafDownloadMonitor, 0);
  objc_storeStrong((id *)&self->_uafAssetManager, 0);
  objc_storeStrong((id *)&self->_assetManager, 0);
  objc_storeStrong((id *)&self->_cachedAsset, 0);
}

void __82__CSAttSiriMitigationAssetHandler_CSVoiceTriggerEnabledMonitor_didReceiveEnabled___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(v1 + 16);
  if (v2)
  {
    v3 = *(void **)(v1 + 80);
    v7 = 0;
    objc_msgSend(v3, "compileAndUpdateDeviceCachesWithAsset:assetType:endpointId:errOut:", v2, 6, 0, &v7);
    v4 = v7;
    v5 = *MEMORY[0x1E0D18F30];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F30], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v9 = "-[CSAttSiriMitigationAssetHandler CSVoiceTriggerEnabledMonitor:didReceiveEnabled:]_block_invoke";
      v10 = 2112;
      v11 = v4;
      _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_DEFAULT, "%s VoiceTrigger is enabled, recompile the mitigation asset with error: %@", buf, 0x16u);
    }

  }
  else
  {
    v6 = *MEMORY[0x1E0D18F30];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F30], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v9 = "-[CSAttSiriMitigationAssetHandler CSVoiceTriggerEnabledMonitor:didReceiveEnabled:]_block_invoke";
      _os_log_impl(&dword_1C2614000, v6, OS_LOG_TYPE_DEFAULT, "%s mitigation cached assets are not set, skip recompilation", buf, 0xCu);
    }
  }
}

uint64_t __83__CSAttSiriMitigationAssetHandler__getPreinstalledMitigationAssetForCurrentLocale___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __93__CSAttSiriMitigationAssetHandler_CSLanguageCodeUpdateMonitor_didReceiveLanguageCodeChanged___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  const char *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = *MEMORY[0x1E0D18F30];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F30], OS_LOG_TYPE_INFO))
  {
    v8 = 136315394;
    v9 = "-[CSAttSiriMitigationAssetHandler CSLanguageCodeUpdateMonitor:didReceiveLanguageCodeChanged:]_block_invoke";
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_1C2614000, v7, OS_LOG_TYPE_INFO, "%s Received asset with err: %@", (uint8_t *)&v8, 0x16u);
  }
  objc_msgSend(*(id *)(a1 + 32), "_receivedNewAssetUpdate:", v5);

}

void __74__CSAttSiriMitigationAssetHandler_assetDownloadMonitorDelegate_assetType___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[5];

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  objc_msgSend(MEMORY[0x1E0D19260], "getSiriLanguageWithFallback:", CFSTR("en-US"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __74__CSAttSiriMitigationAssetHandler_assetDownloadMonitorDelegate_assetType___block_invoke_2;
  v4[3] = &unk_1E7C28D98;
  v4[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v2, "getInstalledAssetofType:forLocale:completion:", 6, v3, v4);

}

void __74__CSAttSiriMitigationAssetHandler_assetDownloadMonitorDelegate_assetType___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  const char *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = *MEMORY[0x1E0D18F30];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F30], OS_LOG_TYPE_INFO))
  {
    v8 = 136315394;
    v9 = "-[CSAttSiriMitigationAssetHandler assetDownloadMonitorDelegate:assetType:]_block_invoke_2";
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_1C2614000, v7, OS_LOG_TYPE_INFO, "%s Received asset with err: %@", (uint8_t *)&v8, 0x16u);
  }
  objc_msgSend(*(id *)(a1 + 32), "_receivedNewAssetUpdate:", v5);

}

void __54__CSAttSiriMitigationAssetHandler_triggerAssetRefresh__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD v12[5];
  id v13;

  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x3032000000;
  v12[3] = __Block_byref_object_copy__25755;
  v12[4] = __Block_byref_object_dispose__25756;
  v13 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D19178]), "initWithDescription:", CFSTR("MitigationAssetRefresh"));
  objc_msgSend(*(id *)(a1 + 32), "cachedAsset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "configVersion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  objc_msgSend(MEMORY[0x1E0D19260], "getSiriLanguageWithFallback:", CFSTR("en-US"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __54__CSAttSiriMitigationAssetHandler_triggerAssetRefresh__block_invoke_28;
  v8[3] = &unk_1E7C28D70;
  v6 = v3;
  v7 = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v10 = v7;
  v11 = v12;
  objc_msgSend(v4, "getInstalledAssetofType:forLocale:completion:", 6, v5, v8);

  _Block_object_dispose(v12, 8);
}

void __54__CSAttSiriMitigationAssetHandler_triggerAssetRefresh__block_invoke_28(uint64_t a1, void *a2, uint64_t a3)
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
        v15 = "-[CSAttSiriMitigationAssetHandler triggerAssetRefresh]_block_invoke";
        v16 = 2112;
        v17 = v10;
        v18 = 2112;
        v19 = v8;
        _os_log_impl(&dword_1C2614000, v9, OS_LOG_TYPE_DEFAULT, "%s Triggering ABC for asset sync mismatch, before asset version: %@ after refresh asset version: %@", (uint8_t *)&v14, 0x20u);
      }
      objc_msgSend(MEMORY[0x1E0D190B8], "sharedInstance");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "submitTrialIssueReport:", *MEMORY[0x1E0D19398]);

      objc_msgSend(*(id *)(a1 + 40), "setCachedAssetWithOverride:", v6);
    }

  }
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = 0;

}

uint64_t __80__CSAttSiriMitigationAssetHandler__getMitigationAssetWithEndpointId_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __80__CSAttSiriMitigationAssetHandler__getMitigationAssetWithEndpointId_completion___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;

  v5 = a2;
  v8 = v5;
  if (!v5 || a3)
  {
    v6 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v7 = (void *)objc_msgSend(v6, "initWithDomain:code:userInfo:", *MEMORY[0x1E0D18E80], 1601, 0);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setCachedAssetWithOverride:", v5);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

uint64_t __79__CSAttSiriMitigationAssetHandler_getMitigationAssetWithEndpointId_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_getMitigationAssetWithEndpointId:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __62__CSAttSiriMitigationAssetHandler_notifyObservers_endpointId___block_invoke(_QWORD *a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = *(id *)(a1[4] + 72);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v6);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v7, "mitigationAssetHandler:endpointId:didChangeCachedAsset:", a1[4], a1[5], a1[6], (_QWORD)v8);
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

uint64_t __54__CSAttSiriMitigationAssetHandler_unregisterObserver___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "removeObject:", *(_QWORD *)(a1 + 40));
}

uint64_t __52__CSAttSiriMitigationAssetHandler_registerObserver___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "addObject:", *(_QWORD *)(a1 + 40));
}

+ (id)sharedHandler
{
  if (sharedHandler_onceToken_25784 != -1)
    dispatch_once(&sharedHandler_onceToken_25784, &__block_literal_global_25785);
  return (id)sharedHandler_sharedHandler_25786;
}

+ (id)sharedHandlerDisabledOnDeviceCompilation
{
  if (sharedHandlerDisabledOnDeviceCompilation_onceToken_25781 != -1)
    dispatch_once(&sharedHandlerDisabledOnDeviceCompilation_onceToken_25781, &__block_literal_global_4);
  return (id)sharedHandlerDisabledOnDeviceCompilation_sharedHandler_25782;
}

void __75__CSAttSiriMitigationAssetHandler_sharedHandlerDisabledOnDeviceCompilation__block_invoke()
{
  CSAttSiriMitigationAssetHandler *v0;
  void *v1;

  v0 = -[CSAttSiriMitigationAssetHandler initWithDisableOnDeviceCompilation]([CSAttSiriMitigationAssetHandler alloc], "initWithDisableOnDeviceCompilation");
  v1 = (void *)sharedHandlerDisabledOnDeviceCompilation_sharedHandler_25782;
  sharedHandlerDisabledOnDeviceCompilation_sharedHandler_25782 = (uint64_t)v0;

}

void __48__CSAttSiriMitigationAssetHandler_sharedHandler__block_invoke()
{
  CSAttSiriMitigationAssetHandler *v0;
  void *v1;

  v0 = objc_alloc_init(CSAttSiriMitigationAssetHandler);
  v1 = (void *)sharedHandler_sharedHandler_25786;
  sharedHandler_sharedHandler_25786 = (uint64_t)v0;

}

@end
