@implementation CSAssetManager

- (CSAssetManager)initWithDownloadOption:(id)a3
{
  id v5;
  CSAssetManager *v6;
  CSAssetManager *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *queue;
  uint64_t v10;
  NSMutableDictionary *observers;
  NSString *currentLanguageCode;
  uint64_t v13;
  NSString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  os_log_t *v26;
  NSObject *v27;
  NSString *v28;
  uint64_t v29;
  CSPolicy *enablePolicy;
  CSPolicy *v31;
  uint64_t v32;
  NSObject *v33;
  NSObject *v34;
  _QWORD block[4];
  CSAssetManager *v37;
  _QWORD v38[4];
  id v39;
  id location;
  objc_super v41;
  uint8_t buf[4];
  const char *v43;
  __int16 v44;
  NSString *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v41.receiver = self;
  v41.super_class = (Class)CSAssetManager;
  v6 = -[CSAssetManager init](&v41, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_downloadingOption, a3);
    v8 = dispatch_queue_create("Serial CSAssetManager queue", 0);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v8;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v10 = objc_claimAutoreleasedReturnValue();
    observers = v7->_observers;
    v7->_observers = (NSMutableDictionary *)v10;

    currentLanguageCode = v7->_currentLanguageCode;
    v7->_currentLanguageCode = (NSString *)CFSTR("en-US");

    objc_msgSend(MEMORY[0x1E0D19260], "getSiriLanguageWithFallback:", v7->_currentLanguageCode);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = v7->_currentLanguageCode;
    v7->_currentLanguageCode = (NSString *)v13;

    objc_msgSend(MEMORY[0x1E0D19158], "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObserver:", v7);

    +[CSVoiceTriggerAssetMetaUpdateMonitor sharedInstance](CSVoiceTriggerAssetMetaUpdateMonitor, "sharedInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObserver:", v7);

    +[CSSpeechEndpointAssetMetaUpdateMonitor sharedInstance](CSSpeechEndpointAssetMetaUpdateMonitor, "sharedInstance");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObserver:", v7);

    +[CSAdBlockerAssetMetaUpdateMonitor sharedInstance](CSAdBlockerAssetMetaUpdateMonitor, "sharedInstance");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObserver:", v7);

    +[CSSpeakerRecognitionAssetMetaUpdateMonitor sharedInstance](CSSpeakerRecognitionAssetMetaUpdateMonitor, "sharedInstance");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addObserver:", v7);

    +[CSAssetControllerFactory defaultController](CSAssetControllerFactory, "defaultController");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addObserver:forAssetType:", v7, 0);

    +[CSAssetControllerFactory defaultController](CSAssetControllerFactory, "defaultController");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addObserver:forAssetType:", v7, 1);

    +[CSAssetControllerFactory defaultController](CSAssetControllerFactory, "defaultController");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addObserver:forAssetType:", v7, 4);

    +[CSAssetControllerFactory defaultController](CSAssetControllerFactory, "defaultController");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addObserver:forAssetType:", v7, 3);

    +[CSAssetControllerFactory defaultController](CSAssetControllerFactory, "defaultController");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addObserver:forAssetType:", v7, 5);

    +[CSAssetControllerFactory defaultController](CSAssetControllerFactory, "defaultController");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addObserver:forAssetType:", v7, 7);

    v26 = (os_log_t *)MEMORY[0x1E0D18F30];
    v27 = *MEMORY[0x1E0D18F30];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F30], OS_LOG_TYPE_DEFAULT))
    {
      v28 = v7->_currentLanguageCode;
      *(_DWORD *)buf = 136315394;
      v43 = "-[CSAssetManager initWithDownloadOption:]";
      v44 = 2114;
      v45 = v28;
      _os_log_impl(&dword_1C2614000, v27, OS_LOG_TYPE_DEFAULT, "%s init-_currentLanguageCode: %{public}@", buf, 0x16u);
    }
    -[CSAssetManager _createPeriodicalDownloadTimer](v7, "_createPeriodicalDownloadTimer");
    objc_initWeak(&location, v7);
    +[CSAssetManagerEnablePolicyFactory assetManagerEnabledPolicy](CSAssetManagerEnablePolicyFactory, "assetManagerEnabledPolicy");
    v29 = objc_claimAutoreleasedReturnValue();
    enablePolicy = v7->_enablePolicy;
    v7->_enablePolicy = (CSPolicy *)v29;

    v31 = v7->_enablePolicy;
    v32 = MEMORY[0x1E0C809B0];
    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3221225472;
    v38[2] = __41__CSAssetManager_initWithDownloadOption___block_invoke;
    v38[3] = &unk_1E7C26D40;
    objc_copyWeak(&v39, &location);
    -[CSPolicy setCallback:](v31, "setCallback:", v38);
    if (-[CSPolicy isEnabled](v7->_enablePolicy, "isEnabled"))
    {
      v33 = *v26;
      if (os_log_type_enabled(*v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v43 = "-[CSAssetManager initWithDownloadOption:]";
        _os_log_impl(&dword_1C2614000, v33, OS_LOG_TYPE_DEFAULT, "%s Asset Manager Policy has been enabled, start fetching meta data now", buf, 0xCu);
      }
      v34 = v7->_queue;
      block[0] = v32;
      block[1] = 3221225472;
      block[2] = __41__CSAssetManager_initWithDownloadOption___block_invoke_19;
      block[3] = &unk_1E7C292C8;
      v37 = v7;
      dispatch_async(v34, block);

    }
    objc_destroyWeak(&v39);
    objc_destroyWeak(&location);
  }

  return v7;
}

- (void)setAssetDownloadingOption:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[4];
  id v8;
  CSAssetManager *v9;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __44__CSAssetManager_setAssetDownloadingOption___block_invoke;
  v7[3] = &unk_1E7C292A0;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (id)assetForCurrentLanguageOfType:(unint64_t)a3
{
  NSString *v5;
  NSString *currentLanguageCode;
  _BOOL4 v7;
  void *v8;
  void *v9;
  NSString *v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0D19260], "getSiriLanguageWithFallback:", self->_currentLanguageCode);
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  currentLanguageCode = self->_currentLanguageCode;
  self->_currentLanguageCode = v5;

  v7 = -[CSAssetManager _canFetchRemoteAsset:](self, "_canFetchRemoteAsset:", a3);
  +[CSAssetControllerFactory defaultController](CSAssetControllerFactory, "defaultController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  v10 = self->_currentLanguageCode;
  if (v7)
    objc_msgSend(v8, "assetOfType:language:", a3, v10);
  else
    objc_msgSend(v8, "installedAssetOfType:language:", a3, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)allInstalledAssetsOfType:(unint64_t)a3 language:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  +[CSAssetControllerFactory defaultController](CSAssetControllerFactory, "defaultController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allInstalledAssetsOfType:language:", a3, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)assetForCurrentLanguageOfType:(unint64_t)a3 completion:(id)a4
{
  void *v6;
  NSString *currentLanguageCode;
  id v8;
  NSString *v9;
  NSString *v10;
  void *v11;
  NSString *v12;
  id v13;

  v6 = (void *)MEMORY[0x1E0D19260];
  currentLanguageCode = self->_currentLanguageCode;
  v8 = a4;
  objc_msgSend(v6, "getSiriLanguageWithFallback:", currentLanguageCode);
  v9 = (NSString *)objc_claimAutoreleasedReturnValue();
  v10 = self->_currentLanguageCode;
  self->_currentLanguageCode = v9;

  LODWORD(v6) = -[CSAssetManager _canFetchRemoteAsset:](self, "_canFetchRemoteAsset:", a3);
  +[CSAssetControllerFactory defaultController](CSAssetControllerFactory, "defaultController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = self->_currentLanguageCode;
  v13 = v11;
  if ((_DWORD)v6)
    objc_msgSend(v11, "assetOfType:language:completion:", a3, v12, v8);
  else
    objc_msgSend(v11, "installedAssetOfType:language:completion:", a3, v12, v8);

}

- (id)installedAssetForCurrentLanguageOfType:(unint64_t)a3
{
  NSString *v5;
  NSString *currentLanguageCode;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0D19260], "getSiriLanguageWithFallback:", self->_currentLanguageCode);
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  currentLanguageCode = self->_currentLanguageCode;
  self->_currentLanguageCode = v5;

  +[CSAssetControllerFactory defaultController](CSAssetControllerFactory, "defaultController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "installedAssetOfType:language:", a3, self->_currentLanguageCode);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)installedAssetForCurrentLanguageOfType:(unint64_t)a3 completion:(id)a4
{
  void *v6;
  NSString *currentLanguageCode;
  id v8;
  NSString *v9;
  NSString *v10;
  id v11;

  v6 = (void *)MEMORY[0x1E0D19260];
  currentLanguageCode = self->_currentLanguageCode;
  v8 = a4;
  objc_msgSend(v6, "getSiriLanguageWithFallback:", currentLanguageCode);
  v9 = (NSString *)objc_claimAutoreleasedReturnValue();
  v10 = self->_currentLanguageCode;
  self->_currentLanguageCode = v9;

  +[CSAssetControllerFactory defaultController](CSAssetControllerFactory, "defaultController");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "installedAssetOfType:language:completion:", a3, self->_currentLanguageCode, v8);

}

- (id)assetOfType:(unint64_t)a3 language:(id)a4
{
  id v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = -[CSAssetManager _canFetchRemoteAsset:](self, "_canFetchRemoteAsset:", a3);
  +[CSAssetControllerFactory defaultController](CSAssetControllerFactory, "defaultController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7)
    objc_msgSend(v8, "assetOfType:language:", a3, v6);
  else
    objc_msgSend(v8, "installedAssetOfType:language:", a3, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)assetOfType:(unint64_t)a3 language:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;

  v8 = a5;
  v9 = a4;
  LODWORD(self) = -[CSAssetManager _canFetchRemoteAsset:](self, "_canFetchRemoteAsset:", a3);
  +[CSAssetControllerFactory defaultController](CSAssetControllerFactory, "defaultController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if ((_DWORD)self)
    objc_msgSend(v10, "assetOfType:language:completion:", a3, v9, v8);
  else
    objc_msgSend(v10, "installedAssetOfType:language:completion:", a3, v9, v8);

}

- (void)assetOfType:(unint64_t)a3 language:(id)a4 compatibilityVersion:(unint64_t)a5 completion:(id)a6
{
  id v10;
  void *v11;
  id v12;

  v12 = a4;
  v10 = a6;
  if (-[CSAssetManager _canFetchRemoteAsset:](self, "_canFetchRemoteAsset:", a3))
  {
    +[CSAssetControllerFactory defaultController](CSAssetControllerFactory, "defaultController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "assetOfType:language:compatibilityVersion:completion:", a3, v12, a5, v10);

  }
  else if (v10)
  {
    (*((void (**)(id, _QWORD, _QWORD))v10 + 2))(v10, 0, 0);
  }

}

- (id)installedAssetOfType:(unint64_t)a3 language:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  +[CSAssetControllerFactory defaultController](CSAssetControllerFactory, "defaultController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "installedAssetOfType:language:", a3, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)installedAssetOfType:(unint64_t)a3 language:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;

  v7 = a5;
  v8 = a4;
  +[CSAssetControllerFactory defaultController](CSAssetControllerFactory, "defaultController");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "installedAssetOfType:language:completion:", a3, v8, v7);

}

- (void)assetOfType:(unint64_t)a3 providerType:(unint64_t)a4 language:(id)a5 completion:(id)a6
{
  id v8;
  id v9;
  id v11;

  if (a4 == 1)
  {
    v8 = a6;
    v9 = a5;
    +[CSTrialAssetManager sharedInstance](CSTrialAssetManager, "sharedInstance");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "getInstalledAssetofType:forLocale:completion:", a3, v9, v8);

  }
  else
  {
    v9 = a6;
    v11 = a5;
    -[CSAssetManager assetOfType:language:completion:](self, "assetOfType:language:completion:", a3);
  }

}

- (void)_fetchRemoteMetaData
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (-[CSAssetManager _canFetchRemoteAsset:](self, "_canFetchRemoteAsset:", 0))
  {
    +[CSAssetControllerFactory defaultController](CSAssetControllerFactory, "defaultController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "fetchRemoteMetaOfType:", 0);

  }
  else
  {
    v4 = *MEMORY[0x1E0D18F30];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F30], OS_LOG_TYPE_ERROR))
    {
      v11 = 136315138;
      v12 = "-[CSAssetManager _fetchRemoteMetaData]";
      _os_log_error_impl(&dword_1C2614000, v4, OS_LOG_TYPE_ERROR, "%s Cannot fetch VoiceTrigger asset meta data", (uint8_t *)&v11, 0xCu);
    }
  }
  if (objc_msgSend(MEMORY[0x1E0D19260], "supportHybridEndpointer")
    && -[CSAssetManager _canFetchRemoteAsset:](self, "_canFetchRemoteAsset:", 1))
  {
    +[CSAssetControllerFactory defaultController](CSAssetControllerFactory, "defaultController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "fetchRemoteMetaOfType:", 1);

  }
  if (objc_msgSend(MEMORY[0x1E0D19260], "supportLanguageDetector")
    && -[CSAssetManager _canFetchRemoteAsset:](self, "_canFetchRemoteAsset:", 2))
  {
    +[CSAssetControllerFactory defaultController](CSAssetControllerFactory, "defaultController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "fetchRemoteMetaOfType:", 2);

  }
  if (objc_msgSend(MEMORY[0x1E0D19260], "supportAdBlocker")
    && -[CSAssetManager _canFetchRemoteAsset:](self, "_canFetchRemoteAsset:", 4))
  {
    +[CSAssetControllerFactory defaultController](CSAssetControllerFactory, "defaultController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "fetchRemoteMetaOfType:", 4);

  }
  if (objc_msgSend(MEMORY[0x1E0D19260], "supportsSpeakerRecognitionAssets")
    && -[CSAssetManager _canFetchRemoteAsset:](self, "_canFetchRemoteAsset:", 3))
  {
    +[CSAssetControllerFactory defaultController](CSAssetControllerFactory, "defaultController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "fetchRemoteMetaOfType:", 3);

  }
  if (-[CSAssetManager _canFetchRemoteAsset:](self, "_canFetchRemoteAsset:", 5))
  {
    +[CSAssetControllerFactory defaultController](CSAssetControllerFactory, "defaultController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "fetchRemoteMetaOfType:", 5);

  }
  if (-[CSAssetManager _canFetchRemoteAsset:](self, "_canFetchRemoteAsset:", 7))
  {
    +[CSAssetControllerFactory defaultController](CSAssetControllerFactory, "defaultController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "fetchRemoteMetaOfType:", 7);

  }
}

- (BOOL)_canFetchRemoteAsset:(unint64_t)a3
{
  int v3;
  BOOL result;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v3 = a3;
  v10 = *MEMORY[0x1E0C80C00];
  switch(a3)
  {
    case 0uLL:
      result = -[CSAssetDownloadingOption allowVoiceTriggerAssetDownloading](self->_downloadingOption, "allowVoiceTriggerAssetDownloading");
      break;
    case 1uLL:
      result = -[CSAssetDownloadingOption allowEndpointAssetDownloading](self->_downloadingOption, "allowEndpointAssetDownloading");
      break;
    case 2uLL:
      result = -[CSAssetDownloadingOption allowLanguageDetectorAssetDownloading](self->_downloadingOption, "allowLanguageDetectorAssetDownloading");
      break;
    case 3uLL:
      result = -[CSAssetDownloadingOption allowSpeakerRecognitionAssetDownloading](self->_downloadingOption, "allowSpeakerRecognitionAssetDownloading");
      break;
    case 4uLL:
      result = -[CSAssetDownloadingOption allowAdBlockerAssetDownloading](self->_downloadingOption, "allowAdBlockerAssetDownloading");
      break;
    case 5uLL:
      result = -[CSAssetDownloadingOption allowVoiceTriggerAccessoryAssetDownloading](self->_downloadingOption, "allowVoiceTriggerAccessoryAssetDownloading");
      break;
    case 7uLL:
      result = -[CSAssetDownloadingOption allowGibraltarVoiceTriggerAssetDownloading](self->_downloadingOption, "allowGibraltarVoiceTriggerAssetDownloading");
      break;
    default:
      v5 = *MEMORY[0x1E0D18F30];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F30], OS_LOG_TYPE_ERROR))
      {
        v6 = 136315394;
        v7 = "-[CSAssetManager _canFetchRemoteAsset:]";
        v8 = 1026;
        v9 = v3;
        _os_log_error_impl(&dword_1C2614000, v5, OS_LOG_TYPE_ERROR, "%s Undefined assetType : %{public}u", (uint8_t *)&v6, 0x12u);
      }
      result = 0;
      break;
  }
  return result;
}

- (NSString)currentLanguageCode
{
  return self->_currentLanguageCode;
}

- (void)CSLanguageCodeUpdateMonitor:(id)a3 didReceiveLanguageCodeChanged:(id)a4
{
  id v6;
  NSString **p_currentLanguageCode;
  NSObject *v8;
  NSString *v9;
  int v10;
  const char *v11;
  __int16 v12;
  NSString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  p_currentLanguageCode = &self->_currentLanguageCode;
  objc_storeStrong((id *)p_currentLanguageCode, a4);
  v8 = *MEMORY[0x1E0D18F30];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F30], OS_LOG_TYPE_DEFAULT))
  {
    v9 = *p_currentLanguageCode;
    v10 = 136315394;
    v11 = "-[CSAssetManager CSLanguageCodeUpdateMonitor:didReceiveLanguageCodeChanged:]";
    v12 = 2114;
    v13 = v9;
    _os_log_impl(&dword_1C2614000, v8, OS_LOG_TYPE_DEFAULT, "%s _currentLanguageCode changed: %{public}@", (uint8_t *)&v10, 0x16u);
  }

}

- (void)addObserver:(id)a3 forAssetType:(unint64_t)a4
{
  id v6;
  NSObject *queue;
  id v8;
  _QWORD block[5];
  id v10;
  unint64_t v11;

  v6 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__CSAssetManager_addObserver_forAssetType___block_invoke;
  block[3] = &unk_1E7C28B58;
  v10 = v6;
  v11 = a4;
  block[4] = self;
  v8 = v6;
  dispatch_async(queue, block);

}

- (void)removeObserver:(id)a3 forAssetType:(unint64_t)a4
{
  id v6;
  NSObject *queue;
  id v8;
  _QWORD block[5];
  id v10;
  unint64_t v11;

  v6 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__CSAssetManager_removeObserver_forAssetType___block_invoke;
  block[3] = &unk_1E7C28B58;
  v10 = v6;
  v11 = a4;
  block[4] = self;
  v8 = v6;
  dispatch_async(queue, block);

}

- (void)CSVoiceTriggerAssetMetaUpdateMonitor:(id)a3 didReceiveNewVoiceTriggerAssetMetaData:(BOOL)a4
{
  NSObject *queue;
  _QWORD block[5];

  if (a4)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __94__CSAssetManager_CSVoiceTriggerAssetMetaUpdateMonitor_didReceiveNewVoiceTriggerAssetMetaData___block_invoke;
    block[3] = &unk_1E7C292C8;
    block[4] = self;
    dispatch_async(queue, block);
  }
}

- (void)CSAdBlockerMetaUpdateMonitor:(id)a3 didReceiveNewAdBlockerAssetMetaData:(BOOL)a4
{
  NSObject *v5;
  _QWORD block[5];

  if (a4)
  {
    dispatch_get_global_queue(-32768, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __83__CSAssetManager_CSAdBlockerMetaUpdateMonitor_didReceiveNewAdBlockerAssetMetaData___block_invoke;
    block[3] = &unk_1E7C292C8;
    block[4] = self;
    dispatch_async(v5, block);

  }
}

- (void)CSSpeakerRecognitionAssetMetaUpdateMonitor:(id)a3 didReceiveNewSpeakerRecognitionAssetMetaData:(BOOL)a4
{
  NSObject *v5;
  _QWORD block[5];

  if (a4)
  {
    dispatch_get_global_queue(-32768, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __106__CSAssetManager_CSSpeakerRecognitionAssetMetaUpdateMonitor_didReceiveNewSpeakerRecognitionAssetMetaData___block_invoke;
    block[3] = &unk_1E7C292C8;
    block[4] = self;
    dispatch_async(v5, block);

  }
}

- (void)CSSpeechEndpointAssetMetaUpdateMonitor:(id)a3 didReceiveNewSpeechEndpointAssetMetaData:(BOOL)a4
{
  NSObject *v5;
  _QWORD block[5];

  if (a4)
  {
    dispatch_get_global_queue(-32768, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __98__CSAssetManager_CSSpeechEndpointAssetMetaUpdateMonitor_didReceiveNewSpeechEndpointAssetMetaData___block_invoke;
    block[3] = &unk_1E7C292C8;
    block[4] = self;
    dispatch_async(v5, block);

  }
}

- (void)CSAssetController:(id)a3 didDownloadNewAssetForType:(unint64_t)a4
{
  NSObject *queue;
  _QWORD v5[6];

  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __63__CSAssetManager_CSAssetController_didDownloadNewAssetForType___block_invoke;
  v5[3] = &unk_1E7C29178;
  v5[4] = self;
  v5[5] = a4;
  dispatch_async(queue, v5);
}

- (void)_createPeriodicalDownloadTimer
{
  NSObject *v3;
  OS_dispatch_source *v4;
  OS_dispatch_source *downloadTimer;
  dispatch_time_t v6;
  NSObject *v7;
  _QWORD handler[4];
  id v9;
  uint8_t buf[4];
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0D18F30];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F30], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v11 = "-[CSAssetManager _createPeriodicalDownloadTimer]";
    _os_log_impl(&dword_1C2614000, v3, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  self->_downloadTimerCount = 0;
  v4 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)self->_queue);
  downloadTimer = self->_downloadTimer;
  self->_downloadTimer = v4;

  v6 = dispatch_time(0, 0);
  dispatch_source_set_timer((dispatch_source_t)self->_downloadTimer, v6, 0x4E9491800000uLL, 0);
  objc_initWeak((id *)buf, self);
  v7 = self->_downloadTimer;
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __48__CSAssetManager__createPeriodicalDownloadTimer__block_invoke;
  handler[3] = &unk_1E7C27FF0;
  objc_copyWeak(&v9, (id *)buf);
  dispatch_source_set_event_handler(v7, handler);
  objc_destroyWeak(&v9);
  objc_destroyWeak((id *)buf);
}

- (void)_startPeriodicalDownload
{
  os_log_t *v3;
  NSObject *v4;
  NSObject *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = (os_log_t *)MEMORY[0x1E0D18F30];
  v4 = *MEMORY[0x1E0D18F30];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F30], OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315138;
    v7 = "-[CSAssetManager _startPeriodicalDownload]";
    _os_log_impl(&dword_1C2614000, v4, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v6, 0xCu);
  }
  if (self->_downloadTimerCount < 1)
  {
    dispatch_resume((dispatch_object_t)self->_downloadTimer);
    ++self->_downloadTimerCount;
  }
  else
  {
    v5 = *v3;
    if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 136315138;
      v7 = "-[CSAssetManager _startPeriodicalDownload]";
      _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_DEFAULT, "%s Periodical downloading is already scheduled, ignore request.", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (void)_stopPeriodicalDownload
{
  os_log_t *v3;
  NSObject *v4;
  NSObject *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = (os_log_t *)MEMORY[0x1E0D18F30];
  v4 = *MEMORY[0x1E0D18F30];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F30], OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315138;
    v7 = "-[CSAssetManager _stopPeriodicalDownload]";
    _os_log_impl(&dword_1C2614000, v4, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v6, 0xCu);
  }
  if (self->_downloadTimerCount <= 0)
  {
    v5 = *v3;
    if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 136315138;
      v7 = "-[CSAssetManager _stopPeriodicalDownload]";
      _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_DEFAULT, "%s No periodical downloading is scheduled, ignore request.", (uint8_t *)&v6, 0xCu);
    }
  }
  else
  {
    dispatch_suspend((dispatch_object_t)self->_downloadTimer);
    --self->_downloadTimerCount;
  }
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_downloadTimer, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_downloadingOption, 0);
  objc_storeStrong((id *)&self->_currentLanguageCode, 0);
  objc_storeStrong((id *)&self->_enablePolicy, 0);
}

void __48__CSAssetManager__createPeriodicalDownloadTimer__block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0D18F30];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F30], OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[CSAssetManager _createPeriodicalDownloadTimer]_block_invoke";
    _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s Trying to start download meta data", (uint8_t *)&v4, 0xCu);
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_fetchRemoteMetaData");

}

void __63__CSAssetManager_CSAssetController_didDownloadNewAssetForType___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v5 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 40), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v14;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v14 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v11);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v12, "CSAssetManagerDidDownloadNewAsset:", *(_QWORD *)(a1 + 32));
          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v9);
    }

  }
}

uint64_t __98__CSAssetManager_CSSpeechEndpointAssetMetaUpdateMonitor_didReceiveNewSpeechEndpointAssetMetaData___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "assetForCurrentLanguageOfType:completion:", 1, 0);
}

uint64_t __106__CSAssetManager_CSSpeakerRecognitionAssetMetaUpdateMonitor_didReceiveNewSpeakerRecognitionAssetMetaData___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "assetForCurrentLanguageOfType:completion:", 3, 0);
}

uint64_t __83__CSAssetManager_CSAdBlockerMetaUpdateMonitor_didReceiveNewAdBlockerAssetMetaData___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "assetForCurrentLanguageOfType:completion:", 4, 0);
}

void __94__CSAssetManager_CSVoiceTriggerAssetMetaUpdateMonitor_didReceiveNewVoiceTriggerAssetMetaData___block_invoke(uint64_t a1)
{
  NSObject *v2;
  _QWORD block[5];

  if (objc_msgSend(*(id *)(a1 + 32), "_canFetchRemoteAsset:", 0))
  {
    dispatch_get_global_queue(-32768, 0);
    v2 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __94__CSAssetManager_CSVoiceTriggerAssetMetaUpdateMonitor_didReceiveNewVoiceTriggerAssetMetaData___block_invoke_2;
    block[3] = &unk_1E7C292C8;
    block[4] = *(_QWORD *)(a1 + 32);
    dispatch_async(v2, block);

  }
}

uint64_t __94__CSAssetManager_CSVoiceTriggerAssetMetaUpdateMonitor_didReceiveNewVoiceTriggerAssetMetaData___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "assetForCurrentLanguageOfType:completion:", 0, 0);
}

void __46__CSAssetManager_removeObserver_forAssetType___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = *(void **)(a1[4] + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a1[6]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = *(void **)(a1[4] + 32);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a1[6]);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObject:", a1[5]);

  }
}

void __43__CSAssetManager_addObserver_forAssetType___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v2 = *(void **)(a1[4] + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a1[6]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(void **)(a1[4] + 32);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a1[6]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, v7);

  }
  v8 = *(void **)(a1[4] + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a1[6]);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", a1[5]);

}

void __44__CSAssetManager_setAssetDownloadingOption___block_invoke(uint64_t a1)
{
  int v2;
  os_log_t *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  int v8;
  NSObject *v9;
  int v10;
  const char *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "allowVoiceTriggerAssetDownloading"))
  {
    v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "allowVoiceTriggerAssetDownloading") ^ 1;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "setAllowVoiceTriggerAssetDownloading:", 1);
  }
  else
  {
    v2 = 0;
  }
  if (objc_msgSend(*(id *)(a1 + 32), "allowEndpointAssetDownloading"))
  {
    v2 |= objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "allowEndpointAssetDownloading") ^ 1;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "setAllowEndpointAssetDownloading:", 1);
  }
  if (objc_msgSend(*(id *)(a1 + 32), "allowLanguageDetectorAssetDownloading"))
  {
    v2 |= objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "allowLanguageDetectorAssetDownloading") ^ 1;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "setAllowLanguageDetectorAssetDownloading:", 1);
  }
  if (objc_msgSend(*(id *)(a1 + 32), "allowAdBlockerAssetDownloading"))
  {
    v2 |= objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "allowAdBlockerAssetDownloading") ^ 1;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "setAllowAdBlockerAssetDownloading:", 1);
  }
  if (objc_msgSend(*(id *)(a1 + 32), "allowSpeakerRecognitionAssetDownloading"))
  {
    v2 |= objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "allowSpeakerRecognitionAssetDownloading") ^ 1;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "setAllowSpeakerRecognitionAssetDownloading:", 1);
  }
  if (objc_msgSend(*(id *)(a1 + 32), "allowVoiceTriggerAccessoryAssetDownloading"))
  {
    v2 |= objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "allowVoiceTriggerAccessoryAssetDownloading") ^ 1;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "setAllowVoiceTriggerAccessoryAssetDownloading:", 1);
  }
  if (objc_msgSend(*(id *)(a1 + 32), "allowGibraltarVoiceTriggerAssetDownloading"))
  {
    LOBYTE(v2) = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "allowGibraltarVoiceTriggerAssetDownloading") ^ 1 | v2;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "setAllowGibraltarVoiceTriggerAssetDownloading:", 1);
  }
  v3 = (os_log_t *)MEMORY[0x1E0D18F30];
  v4 = (void *)*MEMORY[0x1E0D18F30];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F30], OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(void **)(*(_QWORD *)(a1 + 40) + 24);
    v6 = v4;
    objc_msgSend(v5, "description");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 136315394;
    v11 = "-[CSAssetManager setAssetDownloadingOption:]_block_invoke";
    v12 = 2112;
    v13 = v7;
    _os_log_impl(&dword_1C2614000, v6, OS_LOG_TYPE_DEFAULT, "%s %@", (uint8_t *)&v10, 0x16u);

  }
  if ((v2 & 1) != 0)
  {
    v8 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "isEnabled");
    v9 = *v3;
    if (v8)
    {
      if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
      {
        v10 = 136315138;
        v11 = "-[CSAssetManager setAssetDownloadingOption:]_block_invoke";
        _os_log_impl(&dword_1C2614000, v9, OS_LOG_TYPE_DEFAULT, "%s Need to fetch remote meta now, since we have new asset need to be downloaded", (uint8_t *)&v10, 0xCu);
      }
      objc_msgSend(*(id *)(a1 + 40), "_fetchRemoteMetaData");
      return;
    }
  }
  else
  {
    v9 = *v3;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 136315138;
    v11 = "-[CSAssetManager setAssetDownloadingOption:]_block_invoke";
    _os_log_impl(&dword_1C2614000, v9, OS_LOG_TYPE_DEFAULT, "%s Does not need to fetch remote meta now", (uint8_t *)&v10, 0xCu);
  }
}

void __41__CSAssetManager_initWithDownloadOption___block_invoke(uint64_t a1, int a2)
{
  NSObject *v4;
  const __CFString *v5;
  id *v6;
  id WeakRetained;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  char v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  const __CFString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = *MEMORY[0x1E0D18F30];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F30], OS_LOG_TYPE_DEFAULT))
  {
    v5 = CFSTR("DISABLED");
    if (a2)
      v5 = CFSTR("ENABLED");
    *(_DWORD *)buf = 136315394;
    v13 = "-[CSAssetManager initWithDownloadOption:]_block_invoke";
    v14 = 2114;
    v15 = v5;
    _os_log_impl(&dword_1C2614000, v4, OS_LOG_TYPE_DEFAULT, "%s Asset Manager Policy has been %{public}@", buf, 0x16u);
  }
  v6 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained(v6);
  objc_msgSend(WeakRetained, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __41__CSAssetManager_initWithDownloadOption___block_invoke_17;
  v9[3] = &unk_1E7C24C70;
  objc_copyWeak(&v10, v6);
  v11 = a2;
  dispatch_async(v8, v9);

  objc_destroyWeak(&v10);
}

uint64_t __41__CSAssetManager_initWithDownloadOption___block_invoke_19(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_startPeriodicalDownload");
}

void __41__CSAssetManager_initWithDownloadOption___block_invoke_17(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (*(_BYTE *)(a1 + 40))
    objc_msgSend(WeakRetained, "_startPeriodicalDownload");
  else
    objc_msgSend(WeakRetained, "_stopPeriodicalDownload");

}

+ (id)sharedManager
{
  if (sharedManager_onceToken_6901 != -1)
    dispatch_once(&sharedManager_onceToken_6901, &__block_literal_global_6902);
  return (id)sharedManager_sharedManager_6903;
}

void __31__CSAssetManager_sharedManager__block_invoke()
{
  CSAssetManager *v0;
  void *v1;
  CSAssetDownloadingOption *v2;

  v2 = objc_alloc_init(CSAssetDownloadingOption);
  v0 = -[CSAssetManager initWithDownloadOption:]([CSAssetManager alloc], "initWithDownloadOption:", v2);
  v1 = (void *)sharedManager_sharedManager_6903;
  sharedManager_sharedManager_6903 = (uint64_t)v0;

}

@end
