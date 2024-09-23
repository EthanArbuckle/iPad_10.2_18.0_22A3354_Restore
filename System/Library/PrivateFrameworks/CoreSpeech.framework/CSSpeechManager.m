@implementation CSSpeechManager

- (CSSpeechManager)init
{
  CSSpeechManager *v3;
  id v4;
  const char *v5;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *queue;
  dispatch_queue_t v9;
  OS_dispatch_queue *assetQueryQueue;
  uint64_t v11;
  NSMutableDictionary *audioProviders;
  CSAudioTapProvider *audioTapProvider;
  uint64_t v14;
  CSPostBuildInstallService *postBuildInstallService;
  objc_super v17;

  kdebug_trace();
  v17.receiver = self;
  v17.super_class = (Class)CSSpeechManager;
  v3 = -[CSSpeechManager init](&v17, sel_init);
  if (v3)
  {
    CSLogInitIfNeeded();
    objc_msgSend((id)objc_opt_class(), "description");
    v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v5 = (const char *)objc_msgSend(v4, "UTF8String");
    dispatch_get_global_queue(33, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = dispatch_queue_create_with_target_V2(v5, 0, v6);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v7;

    v9 = dispatch_queue_create("CSSpeechManager Asset Query Queue", 0);
    assetQueryQueue = v3->_assetQueryQueue;
    v3->_assetQueryQueue = (OS_dispatch_queue *)v9;

    if ((CSIsHorseman() & 1) != 0 || CSIsIOS())
      -[CSSpeechManager _createClearLoggingFileTimer](v3, "_createClearLoggingFileTimer");
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v11 = objc_claimAutoreleasedReturnValue();
    audioProviders = v3->_audioProviders;
    v3->_audioProviders = (NSMutableDictionary *)v11;

    audioTapProvider = v3->_audioTapProvider;
    v3->_audioTapProvider = 0;

    +[CSPostBuildInstallService sharedService](CSPostBuildInstallService, "sharedService");
    v14 = objc_claimAutoreleasedReturnValue();
    postBuildInstallService = v3->_postBuildInstallService;
    v3->_postBuildInstallService = (CSPostBuildInstallService *)v14;

    -[CSPostBuildInstallService registerPostBuildInstallService](v3->_postBuildInstallService, "registerPostBuildInstallService");
    v3->_isExclaveHardware = objc_msgSend(MEMORY[0x1E0D19260], "isExclaveHardware");
    v3->_assetHandler = (CSVoiceTriggerAssetHandler *)+[CSVoiceTriggerAssetHandler sharedHandler](CSVoiceTriggerAssetHandler, "sharedHandler");
  }
  kdebug_trace();
  return v3;
}

- (CSSpeechManager)initWithExclaveHardware:(BOOL)a3 assetHandler:(id)a4
{
  _BOOL8 v4;
  id v6;
  CSSpeechManager *v7;

  v4 = a3;
  v6 = a4;
  v7 = -[CSSpeechManager init](self, "init");
  -[CSSpeechManager setIsExclaveHardware:](v7, "setIsExclaveHardware:", v4);
  if (v6)
    -[CSSpeechManager setAssetHandler:](v7, "setAssetHandler:", v6);

  return v7;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)CSSpeechManager;
  -[CSSpeechManager dealloc](&v4, sel_dealloc);
}

- (void)startManager
{
  NSObject *v3;
  NSObject *queue;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v13 = "-[CSSpeechManager startManager]";
    _os_log_impl(&dword_1C2614000, v3, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__CSSpeechManager_startManager__block_invoke;
  block[3] = &unk_1E7C292C8;
  block[4] = self;
  dispatch_sync(queue, block);
  -[CSSpeechManager _startClearLoggingFilesTimer](self, "_startClearLoggingFilesTimer");
  if (objc_msgSend(MEMORY[0x1E0D19260], "supportHearstVoiceTrigger"))
  {
    objc_msgSend(MEMORY[0x1E0D190A8], "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setDelegate:forType:", self, 2);

    objc_msgSend(MEMORY[0x1E0D190A8], "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setDelegate:forType:", self, 3);

  }
  if (objc_msgSend(MEMORY[0x1E0D19260], "supportRemoraVoiceTrigger"))
  {
    objc_msgSend(MEMORY[0x1E0D190A8], "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDelegate:forType:", self, 8);

  }
  if (objc_msgSend(MEMORY[0x1E0D19260], "supportJarvisVoiceTrigger"))
  {
    objc_msgSend(MEMORY[0x1E0D190A8], "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setDelegate:forType:", self, 6);

  }
  +[CSOpportuneSpeakEventMonitor sharedInstance](CSOpportuneSpeakEventMonitor, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObserver:", self);

  objc_msgSend(MEMORY[0x1E0D19028], "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObserver:", self);

  objc_msgSend(MEMORY[0x1E0D19010], "createSharedAudioSession");
}

- (id)audioFingerprintProvider
{
  return 0;
}

- (CSAudioTapProvider)audioTapProvider
{
  return self->_audioTapProvider;
}

- (void)_getVoiceTriggerAssetIfNeeded:(id)a3
{
  id v3;
  id v4;
  void (**v5)(_QWORD, _QWORD, _QWORD);
  void *v6;
  _QWORD v7[4];
  id v8;

  v3 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __49__CSSpeechManager__getVoiceTriggerAssetIfNeeded___block_invoke;
  v7[3] = &unk_1E7C28D20;
  v4 = v3;
  v8 = v4;
  v5 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1C3BC4734](v7);
  if ((objc_msgSend(MEMORY[0x1E0D19260], "isLocalVoiceTriggerAvailable") & 1) != 0
    || objc_msgSend(MEMORY[0x1E0D19260], "supportBluetoothDeviceVoiceTrigger"))
  {
    +[CSVoiceTriggerAssetHandler sharedHandler](CSVoiceTriggerAssetHandler, "sharedHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "getVoiceTriggerAssetWithEndpointId:completion:", 0, v5);

  }
  else
  {
    v5[2](v5, 0, 0);
  }

}

- (id)_voiceTriggerEventNotifierCreateIfNeeded:(BOOL)a3
{
  CSVoiceTriggerEventsCoordinator *v4;
  CSVoiceTriggerEventsCoordinator *voiceTriggerEventsCoordinator;
  CSVoiceTriggerEventsCoordinator *v6;
  void *v7;
  id WeakRetained;
  CSVoiceTriggerEventsCoordinator *v9;
  id v10;

  if (a3 && !self->_voiceTriggerEventsCoordinator)
  {
    +[CSVoiceTriggerEventsCoordinator sharedInstance](CSVoiceTriggerEventsCoordinator, "sharedInstance");
    v4 = (CSVoiceTriggerEventsCoordinator *)objc_claimAutoreleasedReturnValue();
    voiceTriggerEventsCoordinator = self->_voiceTriggerEventsCoordinator;
    self->_voiceTriggerEventsCoordinator = v4;

    -[CSVoiceTriggerEventsCoordinator start](self->_voiceTriggerEventsCoordinator, "start");
    v6 = self->_voiceTriggerEventsCoordinator;
    +[CSVoiceTriggerStatistics sharedInstance](CSVoiceTriggerStatistics, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSVoiceTriggerEventsCoordinator registerObserver:](v6, "registerObserver:", v7);

    WeakRetained = objc_loadWeakRetained(&self->_clientController);
    if (WeakRetained)
    {
      v9 = self->_voiceTriggerEventsCoordinator;
      v10 = objc_loadWeakRetained(&self->_clientController);
      -[CSVoiceTriggerEventsCoordinator registerObserver:](v9, "registerObserver:", v10);

    }
  }
  return self->_voiceTriggerEventsCoordinator;
}

- (id)_preMyriadCoordinatorCreateIfNeeded:(BOOL)a3
{
  CSPreMyriadCoordinator *v4;
  CSPreMyriadCoordinator *preMyriadCoordinator;
  CSPreMyriadCoordinator *v6;
  void *v7;

  if (a3 && !self->_preMyriadCoordinator)
  {
    v4 = objc_alloc_init(CSPreMyriadCoordinator);
    preMyriadCoordinator = self->_preMyriadCoordinator;
    self->_preMyriadCoordinator = v4;

    v6 = self->_preMyriadCoordinator;
    -[CSSpeechManager _voiceTriggerEventNotifierCreateIfNeeded:](self, "_voiceTriggerEventNotifierCreateIfNeeded:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSPreMyriadCoordinator setDelegate:](v6, "setDelegate:", v7);

  }
  return self->_preMyriadCoordinator;
}

- (id)_voiceTriggerFileLoggerCreateIfNeeded:(BOOL)a3
{
  CSVoiceTriggerFileLogger *v4;
  CSVoiceTriggerFileLogger *voiceTriggerFileLogger;
  void *v6;

  if (a3 && !self->_voiceTriggerFileLogger)
  {
    v4 = objc_alloc_init(CSVoiceTriggerFileLogger);
    voiceTriggerFileLogger = self->_voiceTriggerFileLogger;
    self->_voiceTriggerFileLogger = v4;

    -[CSSpeechManager _voiceTriggerEventNotifierCreateIfNeeded:](self, "_voiceTriggerEventNotifierCreateIfNeeded:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "registerObserver:", self->_voiceTriggerFileLogger);

  }
  return self->_voiceTriggerFileLogger;
}

- (id)_myriadSelfTriggerCoordinatorIfNeeded:(BOOL)a3
{
  CSMyriadSelfTriggerCoordinator *v4;
  CSMyriadSelfTriggerCoordinator *myriadSelfTriggerCoordinator;

  if (a3 && !self->_myriadSelfTriggerCoordinator)
  {
    v4 = objc_alloc_init(CSMyriadSelfTriggerCoordinator);
    myriadSelfTriggerCoordinator = self->_myriadSelfTriggerCoordinator;
    self->_myriadSelfTriggerCoordinator = v4;

  }
  return self->_myriadSelfTriggerCoordinator;
}

- (void)_setupSpeakerRecognitionWithVTAsset:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  void *v7;
  CSVoiceProfileRetrainManager *v8;
  CSVoiceProfileRetrainManager *voiceTriggerRetrainer;
  void *v10;
  _QWORD v11[5];
  uint8_t buf[4];
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v13 = "-[CSSpeechManager _setupSpeakerRecognitionWithVTAsset:]";
    _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  v6 = CSIsIOS();
  if (v4 && v6)
  {
    -[CSVoiceProfileRetrainManager triggerVoiceProfileRetrainingWithAsset:](self->_voiceTriggerRetrainer, "triggerVoiceProfileRetrainingWithAsset:", v4);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D19260], "getSiriLanguageWithFallback:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[CSVoiceProfileRetrainManager sharedInstance](CSVoiceProfileRetrainManager, "sharedInstance");
    v8 = (CSVoiceProfileRetrainManager *)objc_claimAutoreleasedReturnValue();
    voiceTriggerRetrainer = self->_voiceTriggerRetrainer;
    self->_voiceTriggerRetrainer = v8;

    +[CSAssetManager sharedManager](CSAssetManager, "sharedManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __55__CSSpeechManager__setupSpeakerRecognitionWithVTAsset___block_invoke;
    v11[3] = &unk_1E7C28D98;
    v11[4] = self;
    objc_msgSend(v10, "assetOfType:providerType:language:completion:", 3, 0, v7, v11);

  }
}

- (void)_setupVoiceTriggerWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  OS_dispatch_queue *v6;
  NSObject *voiceTriggerQueue;
  OS_dispatch_queue *v8;
  OS_dispatch_queue *v9;
  NSObject *v10;
  CSBuiltInVoiceTrigger *v11;
  CSBuiltInVoiceTrigger *voiceTrigger;
  void *v13;
  CSBuiltInVoiceTrigger *v14;
  void *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  uint8_t buf[4];
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v20 = "-[CSSpeechManager _setupVoiceTriggerWithCompletion:]";
    _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  if (objc_msgSend(MEMORY[0x1E0D19260], "isLocalVoiceTriggerAvailable"))
  {
    if (CSIsWatch())
    {
      objc_msgSend(MEMORY[0x1E0D19260], "rootQueueWithFixedPriority:", *MEMORY[0x1E0D192E8]);
      v6 = (OS_dispatch_queue *)objc_claimAutoreleasedReturnValue();
      voiceTriggerQueue = self->_voiceTriggerQueue;
      self->_voiceTriggerQueue = v6;
    }
    else
    {
      v8 = (OS_dispatch_queue *)dispatch_queue_create("VoiceTrigger Queue", 0);
      v9 = self->_voiceTriggerQueue;
      self->_voiceTriggerQueue = v8;

      v10 = self->_voiceTriggerQueue;
      dispatch_get_global_queue(33, 0);
      voiceTriggerQueue = objc_claimAutoreleasedReturnValue();
      dispatch_set_target_queue(v10, voiceTriggerQueue);
    }

    v11 = -[CSBuiltInVoiceTrigger initWithTargetQueue:withSpeechManager:]([CSBuiltInVoiceTrigger alloc], "initWithTargetQueue:withSpeechManager:", self->_voiceTriggerQueue, self);
    voiceTrigger = self->_voiceTrigger;
    self->_voiceTrigger = v11;

    if (objc_msgSend(MEMORY[0x1E0D19260], "supportHomeKitAccessory"))
    {
      -[CSSpeechManager _preMyriadCoordinatorCreateIfNeeded:](self, "_preMyriadCoordinatorCreateIfNeeded:", 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[CSBuiltInVoiceTrigger setDelegate:](self->_voiceTrigger, "setDelegate:", v13);
      objc_msgSend(v13, "setBuiltInSeconPassProgressProvider:", self->_voiceTrigger);
    }
    else
    {
      v14 = self->_voiceTrigger;
      -[CSSpeechManager _voiceTriggerEventNotifierCreateIfNeeded:](self, "_voiceTriggerEventNotifierCreateIfNeeded:", 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[CSBuiltInVoiceTrigger setDelegate:](v14, "setDelegate:", v13);
    }

    +[CSVoiceTriggerXPCServiceProxy sharedInstance](CSVoiceTriggerXPCServiceProxy, "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "registerObserver:", self->_voiceTrigger);

  }
  -[CSSpeechManager _startVoiceTrigger](self, "_startVoiceTrigger");
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __52__CSSpeechManager__setupVoiceTriggerWithCompletion___block_invoke;
  v17[3] = &unk_1E7C28D48;
  v17[4] = self;
  v18 = v4;
  v16 = v4;
  -[CSSpeechManager _getVoiceTriggerAssetIfNeeded:](self, "_getVoiceTriggerAssetIfNeeded:", v17);

}

- (BOOL)_shouldSetupSelfTrigger
{
  if (-[CSSpeechManager _isAVVCRefChannelAvailable](self, "_isAVVCRefChannelAvailable"))
    return 1;
  else
    return objc_msgSend(MEMORY[0x1E0D19260], "supportAudioTappingSelfTrigger");
}

- (BOOL)_isAVVCRefChannelAvailable
{
  void *v3;
  uint64_t v4;

  if ((objc_msgSend(MEMORY[0x1E0D19260], "isExclaveHardware") & 1) != 0)
    return 0;
  v3 = (void *)MEMORY[0x1E0D19260];
  v4 = objc_msgSend(MEMORY[0x1E0D19090], "inputRecordingNumberOfChannels");
  return objc_msgSend(v3, "supportSelfTriggerSuppression:refChannelIdx:", v4, objc_msgSend(MEMORY[0x1E0D19090], "channelForOutputReference"));
}

- (void)_startVoiceTrigger
{
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[CSSpeechManager _startVoiceTrigger]";
    _os_log_impl(&dword_1C2614000, v3, OS_LOG_TYPE_DEFAULT, "%s VoiceTrigger will be started", (uint8_t *)&v4, 0xCu);
  }
  -[CSVoiceTriggerAssetHandler registerObserver:](self->_assetHandler, "registerObserver:", self);
  -[CSBuiltInVoiceTrigger start](self->_voiceTrigger, "start");
}

- (void)_startAllClients
{
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[CSSpeechManager _startAllClients]";
    _os_log_impl(&dword_1C2614000, v3, OS_LOG_TYPE_DEFAULT, "%s Starting all clients", (uint8_t *)&v4, 0xCu);
  }
  if (objc_msgSend(MEMORY[0x1E0D19260], "supportSmartVolume"))
    -[CSSmartSiriVolumeManager startSmartSiriVolume](self->_ssvManager, "startSmartSiriVolume");
  -[CSSelfTriggerController start](self->_selfTriggerController, "start");
}

- (void)registerSpeechController:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315394;
    v8 = "-[CSSpeechManager registerSpeechController:]";
    v9 = 2050;
    v10 = v4;
    _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_DEFAULT, "%s speechController = %{public}p", (uint8_t *)&v7, 0x16u);
  }
  -[CSVoiceTriggerEventsCoordinator registerObserver:](self->_voiceTriggerEventsCoordinator, "registerObserver:", v4);
  -[CSSpeechManager _myriadSelfTriggerCoordinatorIfNeeded:](self, "_myriadSelfTriggerCoordinatorIfNeeded:", -[CSSpeechManager _shouldSetupSelfTrigger](self, "_shouldSetupSelfTrigger"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDelegate:", v4);
  objc_storeWeak(&self->_clientController, v4);

}

- (void)registerSiriClientProxy:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315394;
    v8 = "-[CSSpeechManager registerSiriClientProxy:]";
    v9 = 2050;
    v10 = v4;
    _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_DEFAULT, "%s xpcListener = %{public}p", (uint8_t *)&v7, 0x16u);
  }
  -[CSSpeechManager _voiceTriggerEventNotifierCreateIfNeeded:](self, "_voiceTriggerEventNotifierCreateIfNeeded:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "registerObserver:", v4);

}

- (id)audioProviderWithUUID:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__6441;
  v16 = __Block_byref_object_dispose__6442;
  v17 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__CSSpeechManager_audioProviderWithUUID___block_invoke;
  block[3] = &unk_1E7C277D0;
  block[4] = self;
  v10 = v4;
  v11 = &v12;
  v6 = v4;
  dispatch_sync(queue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (id)audioProviderWithContext:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD v12[5];
  id v13;
  uint64_t *v14;
  _BYTE *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  _BYTE buf[24];
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "-[CSSpeechManager audioProviderWithContext:error:]";
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v6;
    _os_log_impl(&dword_1C2614000, v7, OS_LOG_TYPE_DEFAULT, "%s context = %{public}@", buf, 0x16u);
  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v23 = __Block_byref_object_copy__6441;
  v24 = __Block_byref_object_dispose__6442;
  v25 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__6441;
  v20 = __Block_byref_object_dispose__6442;
  v21 = 0;
  queue = self->_queue;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __50__CSSpeechManager_audioProviderWithContext_error___block_invoke;
  v12[3] = &unk_1E7C253B0;
  v12[4] = self;
  v14 = &v16;
  v9 = v6;
  v13 = v9;
  v15 = buf;
  dispatch_sync(queue, v12);
  if (a4)
    *a4 = objc_retainAutorelease((id)v17[5]);
  v10 = *(id *)(*(_QWORD *)&buf[8] + 40);

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(buf, 8);

  return v10;
}

- (id)audioProviderWithStreamID:(unint64_t)a3
{
  NSObject *queue;
  id v4;
  _QWORD block[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__6441;
  v11 = __Block_byref_object_dispose__6442;
  v12 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__CSSpeechManager_audioProviderWithStreamID___block_invoke;
  block[3] = &unk_1E7C26810;
  block[5] = &v7;
  block[6] = a3;
  block[4] = self;
  dispatch_sync(queue, block);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (id)fetchFallbackAudioSessionReleaseProvider
{
  NSObject *queue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__6441;
  v10 = __Block_byref_object_dispose__6442;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __59__CSSpeechManager_fetchFallbackAudioSessionReleaseProvider__block_invoke;
  v5[3] = &unk_1E7C29228;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)_getAudioRecorderWithError:(id *)a3
{
  id v5;
  CSAudioRecorder *v6;
  CSAudioRecorder *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  CSAudioRecorder *audioRecorder;
  NSObject *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  id v26;
  uint8_t v27[128];
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  if (self->_audioRecorder)
  {
    v5 = 0;
    if (a3)
LABEL_3:
      *a3 = objc_retainAutorelease(v5);
  }
  else
  {
    v26 = 0;
    +[CSAudioRecorderFactory audioRecorderWithQueue:error:](CSAudioRecorderFactory, "audioRecorderWithQueue:error:", 0, &v26);
    v8 = (CSAudioRecorder *)objc_claimAutoreleasedReturnValue();
    v5 = v26;
    if (!v8)
    {
      v9 = (void *)*MEMORY[0x1E0D18F60];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
      {
        v20 = v9;
        objc_msgSend(v5, "localizedDescription");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315394;
        v29 = "-[CSSpeechManager _getAudioRecorderWithError:]";
        v30 = 2114;
        v31 = v21;
        _os_log_error_impl(&dword_1C2614000, v20, OS_LOG_TYPE_ERROR, "%s Failed to create audio recorder : %{public}@", buf, 0x16u);

      }
    }
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    -[CSSpeechManager audioProviders](self, "audioProviders", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v23;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v23 != v13)
            objc_enumerationMutation(v10);
          v15 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v14);
          -[CSSpeechManager audioProviders](self, "audioProviders");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "objectForKey:", v15);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v17, "setAudioRecorder:", v8);
          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      }
      while (v12);
    }

    -[CSFallbackAudioSessionReleaseProvider setAudioRecorder:](self->_fallbackAudioSessionReleaseProvider, "setAudioRecorder:", v8);
    -[CSAudioRecorder registerObserver:](v8, "registerObserver:", self);
    +[CSAudioSessionMonitor sharedInstance](CSAudioSessionMonitor, "sharedInstance");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSAudioRecorder setAudioSessionEventDelegate:](v8, "setAudioSessionEventDelegate:", v18);

    audioRecorder = self->_audioRecorder;
    self->_audioRecorder = v8;

    if (a3)
      goto LABEL_3;
  }
  v6 = self->_audioRecorder;

  return v6;
}

- (void)audioProviderInvalidated:(id)a3 streamHandleId:(unint64_t)a4
{
  id v6;
  NSObject *queue;
  id v8;
  _QWORD block[4];
  id v10;
  CSSpeechManager *v11;
  unint64_t v12;

  v6 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__CSSpeechManager_audioProviderInvalidated_streamHandleId___block_invoke;
  block[3] = &unk_1E7C28B58;
  v11 = self;
  v12 = a4;
  v10 = v6;
  v8 = v6;
  dispatch_async(queue, block);

}

- (void)audioRecorderWillBeDestroyed:(id)a3
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__CSSpeechManager_audioRecorderWillBeDestroyed___block_invoke;
  block[3] = &unk_1E7C292C8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)voiceTriggerAssetHandler:(id)a3 endpointId:(id)a4 didChangeCachedAsset:(id)a5
{
  NSObject *v6;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v6 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315138;
    v8 = "-[CSSpeechManager voiceTriggerAssetHandler:endpointId:didChangeCachedAsset:]";
    _os_log_impl(&dword_1C2614000, v6, OS_LOG_TYPE_DEFAULT, "%s Received VoiceTrigger cached asset change notification, let's reinitialize VoiceTrigger", (uint8_t *)&v7, 0xCu);
  }
  -[CSSpeechManager _reinitializeVoiceTriggerIfNeeded](self, "_reinitializeVoiceTriggerIfNeeded");
}

- (void)_reinitializeVoiceTriggerIfNeeded
{
  NSObject *assetQueryQueue;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  assetQueryQueue = self->_assetQueryQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __52__CSSpeechManager__reinitializeVoiceTriggerIfNeeded__block_invoke;
  v4[3] = &unk_1E7C27FF0;
  objc_copyWeak(&v5, &location);
  dispatch_async(assetQueryQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_setAssetForBuiltInVoiceTrigger:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  void (**v11)(_QWORD, _QWORD);
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  CSVoiceTriggerAssetHandler *assetHandler;
  NSObject *v17;
  void *v18;
  CSVoiceTriggerAssetHandler *v19;
  _QWORD v20[5];
  void (**v21)(_QWORD, _QWORD);
  id v22;
  _QWORD v23[5];
  id v24;
  id v25;
  _QWORD v26[5];
  id v27;
  id v28;
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  CSVoiceTriggerAssetHandler *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __62__CSSpeechManager__setAssetForBuiltInVoiceTrigger_completion___block_invoke;
  v26[3] = &unk_1E7C24B28;
  v26[4] = self;
  v9 = v6;
  v27 = v9;
  v10 = v7;
  v28 = v10;
  v11 = (void (**)(_QWORD, _QWORD))MEMORY[0x1C3BC4734](v26);
  v23[0] = v8;
  v23[1] = 3221225472;
  v23[2] = __62__CSSpeechManager__setAssetForBuiltInVoiceTrigger_completion___block_invoke_2;
  v23[3] = &unk_1E7C24B28;
  v23[4] = self;
  v12 = v9;
  v24 = v12;
  v13 = v10;
  v25 = v13;
  v14 = MEMORY[0x1C3BC4734](v23);
  v15 = (void *)v14;
  if (self->_isExclaveHardware)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      assetHandler = self->_assetHandler;
      v20[0] = v8;
      v20[1] = 3221225472;
      v20[2] = __62__CSSpeechManager__setAssetForBuiltInVoiceTrigger_completion___block_invoke_3;
      v20[3] = &unk_1E7C24B78;
      v20[4] = self;
      v21 = v11;
      v22 = v15;
      -[CSVoiceTriggerAssetHandler mapAssetToExclaveKit:completion:](assetHandler, "mapAssetToExclaveKit:completion:", v12, v20);

    }
    else
    {
      v17 = *MEMORY[0x1E0D18F60];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
      {
        v19 = self->_assetHandler;
        *(_DWORD *)buf = 136315394;
        v30 = "-[CSSpeechManager _setAssetForBuiltInVoiceTrigger:completion:]";
        v31 = 2112;
        v32 = v19;
        _os_log_error_impl(&dword_1C2614000, v17, OS_LOG_TYPE_ERROR, "%s Asset handler %@ does not support mapping asset to EK. This is a critical error", buf, 0x16u);
      }
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18E80], 118, 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *))v11)[2](v11, v18);

    }
  }
  else
  {
    (*(void (**)(uint64_t, _QWORD))(v14 + 16))(v14, 0);
  }

}

- (void)_reinitializeVoiceTriggerWithAsset:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315138;
    v8 = "-[CSSpeechManager _reinitializeVoiceTriggerWithAsset:]";
    _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_DEFAULT, "%s new asset available, change to new model", (uint8_t *)&v7, 0xCu);
  }
  if (v4)
  {
    -[CSSpeechManager _setAssetForBuiltInVoiceTrigger:completion:](self, "_setAssetForBuiltInVoiceTrigger:completion:", v4, 0);
    +[CSVoiceTriggerStatistics sharedInstance](CSVoiceTriggerStatistics, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "resetVTEstimationStatistics");

    if (objc_msgSend(MEMORY[0x1E0D19260], "supportBluetoothDeviceVoiceTrigger"))
    {
      -[CSVoiceTriggerFirstPassHearstAP setAsset:](self->_voiceTriggerFirstPassHearstAP, "setAsset:", v4);
      -[CSVoiceTriggerFirstPassHearst setAsset:](self->_voiceTriggerFirstPassHearst, "setAsset:", v4);
      -[CSVoiceTriggerFirstPassJarvis setAsset:](self->_voiceTriggerFirstPassJarvis, "setAsset:", v4);
      -[CSVoiceTriggerFirstPassJarvisAP setAsset:](self->_voiceTriggerFirstPassJarvisAP, "setAsset:", v4);
    }
    objc_msgSend(MEMORY[0x1E0D19260], "supportRemoraVoiceTrigger");
    -[CSSelfTriggerController setAsset:](self->_selfTriggerController, "setAsset:", v4);
    -[CSKeywordDetector setAsset:](self->_keywordDetector, "setAsset:", v4);
    -[CSSpeechManager _reinitializeSmartSiriVolumeWithAsset:](self, "_reinitializeSmartSiriVolumeWithAsset:", v4);
    if ((CSIsCommunalDevice() & 1) == 0)
      -[CSVoiceProfileRetrainManager triggerVoiceProfileRetrainingWithAsset:](self->_voiceTriggerRetrainer, "triggerVoiceProfileRetrainingWithAsset:", v4);
  }

}

- (void)_reinitializeSmartSiriVolumeWithAsset:(id)a3
{
  CSSmartSiriVolumeManager *ssvManager;

  ssvManager = self->_ssvManager;
  if (ssvManager)
    -[CSSmartSiriVolumeManager setAsset:](ssvManager, "setAsset:", a3);
}

- (void)_handleClearLoggingFileTimer
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315138;
    v7 = "-[CSSpeechManager _handleClearLoggingFileTimer]";
    _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s Trying to start clear logging files", (uint8_t *)&v6, 0xCu);
  }
  if (CSIsHorseman())
  {
    v3 = (void *)MEMORY[0x1E0D18FE8];
    objc_msgSend(MEMORY[0x1E0D19090], "daysBeforeRemovingLogFiles");
    objc_msgSend(v3, "removeLogFilesOlderThanNDays:");
  }
  else if (CSIsIOS())
  {
    v4 = (void *)MEMORY[0x1E0D18FE8];
    objc_msgSend(MEMORY[0x1E0D19090], "daysBeforeRemovingLogFiles");
    objc_msgSend(v4, "removeOpportunisticAudioLoggingOlderThanNDays:");
    v5 = (void *)MEMORY[0x1E0D18FE8];
    objc_msgSend(MEMORY[0x1E0D19090], "daysBeforeRemovingLogFiles");
    objc_msgSend(v5, "removeRemoteP2PLogFilesOlderThanNDays:");
  }
}

- (void)_createClearLoggingFileTimer
{
  NSObject *v3;
  OS_dispatch_source *v4;
  OS_dispatch_source *clearLoggingFileTimer;
  dispatch_time_t v6;
  NSObject *v7;
  _QWORD handler[5];
  uint8_t buf[4];
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v10 = "-[CSSpeechManager _createClearLoggingFileTimer]";
    _os_log_impl(&dword_1C2614000, v3, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  self->_clearLoggingFileTimerCount = 0;
  v4 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)self->_queue);
  clearLoggingFileTimer = self->_clearLoggingFileTimer;
  self->_clearLoggingFileTimer = v4;

  v6 = dispatch_time(0, 0);
  dispatch_source_set_timer((dispatch_source_t)self->_clearLoggingFileTimer, v6, 0x274A48C00000uLL, 0);
  v7 = self->_clearLoggingFileTimer;
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __47__CSSpeechManager__createClearLoggingFileTimer__block_invoke;
  handler[3] = &unk_1E7C292C8;
  handler[4] = self;
  dispatch_source_set_event_handler(v7, handler);
}

- (void)_startClearLoggingFilesTimer
{
  os_log_t *v3;
  NSObject *v4;
  NSObject *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (self->_clearLoggingFileTimer)
  {
    v3 = (os_log_t *)MEMORY[0x1E0D18F60];
    v4 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      v6 = 136315138;
      v7 = "-[CSSpeechManager _startClearLoggingFilesTimer]";
      _os_log_impl(&dword_1C2614000, v4, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v6, 0xCu);
    }
    if (self->_clearLoggingFileTimerCount < 1)
    {
      dispatch_resume((dispatch_object_t)self->_clearLoggingFileTimer);
      ++self->_clearLoggingFileTimerCount;
    }
    else
    {
      v5 = *v3;
      if (os_log_type_enabled(*v3, OS_LOG_TYPE_ERROR))
      {
        v6 = 136315138;
        v7 = "-[CSSpeechManager _startClearLoggingFilesTimer]";
        _os_log_error_impl(&dword_1C2614000, v5, OS_LOG_TYPE_ERROR, "%s Clear logging file timer is already started, ignore startClearLoggingFilesTimer request.", (uint8_t *)&v6, 0xCu);
      }
    }
  }
}

- (void)activationEventNotificationHandler:(id)a3 event:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *queue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  CSSpeechManager *v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  queue = self->_queue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __71__CSSpeechManager_activationEventNotificationHandler_event_completion___block_invoke;
  v15[3] = &unk_1E7C27310;
  v16 = v9;
  v17 = self;
  v18 = v8;
  v19 = v10;
  v12 = v10;
  v13 = v8;
  v14 = v9;
  dispatch_async(queue, v15);

}

- (void)CSAudioRouteChangeMonitor:(id)a3 didReceiveAudioRouteChangeEvent:(int64_t)a4
{
  NSObject *queue;
  _QWORD v5[6];

  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __77__CSSpeechManager_CSAudioRouteChangeMonitor_didReceiveAudioRouteChangeEvent___block_invoke;
  v5[3] = &unk_1E7C29178;
  v5[4] = self;
  v5[5] = a4;
  dispatch_async(queue, v5);
}

- (void)_setupForHearstIfNeededWithPrepareCompletion:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136315138;
    v10 = "-[CSSpeechManager _setupForHearstIfNeededWithPrepareCompletion:completion:]";
    _os_log_impl(&dword_1C2614000, v8, OS_LOG_TYPE_DEFAULT, "%s setup VoiceTrigger due to Hearst connection", (uint8_t *)&v9, 0xCu);
  }
  -[CSSpeechManager _setupForBluetoothDeviceIfNeededWithDeviceType:prepareCompletion:completion:](self, "_setupForBluetoothDeviceIfNeededWithDeviceType:prepareCompletion:completion:", 0, v6, v7);

}

- (void)_setupForJarvisIfNeededWithPrepareCompletion:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136315138;
    v10 = "-[CSSpeechManager _setupForJarvisIfNeededWithPrepareCompletion:completion:]";
    _os_log_impl(&dword_1C2614000, v8, OS_LOG_TYPE_DEFAULT, "%s setup VoiceTrigger due to Jarvis connection", (uint8_t *)&v9, 0xCu);
  }
  -[CSSpeechManager _setupForBluetoothDeviceIfNeededWithDeviceType:prepareCompletion:completion:](self, "_setupForBluetoothDeviceIfNeededWithDeviceType:prepareCompletion:completion:", 1, v6, v7);

}

- (void)_setupForRemoraIfNeededWithCompletion:(id)a3
{
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[CSSpeechManager _setupForRemoraIfNeededWithCompletion:]";
    _os_log_impl(&dword_1C2614000, v3, OS_LOG_TYPE_DEFAULT, "%s setup VoiceTrigger due to remora connection", (uint8_t *)&v4, 0xCu);
  }
}

- (void)_setupForBluetoothDeviceIfNeededWithDeviceType:(unint64_t)a3 prepareCompletion:(id)a4 completion:(id)a5
{
  void (**v8)(_QWORD);
  void (**v9)(_QWORD);
  _BOOL4 v10;
  _QWORD v11[5];
  void (**v12)(_QWORD);
  unint64_t v13;

  v8 = (void (**)(_QWORD))a4;
  v9 = (void (**)(_QWORD))a5;
  v10 = -[CSSpeechManager _prepareForBluetoothDeviceWithDeviceType:](self, "_prepareForBluetoothDeviceWithDeviceType:", a3);
  if (v8)
    v8[2](v8);
  if (v10)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __95__CSSpeechManager__setupForBluetoothDeviceIfNeededWithDeviceType_prepareCompletion_completion___block_invoke;
    v11[3] = &unk_1E7C24BE0;
    v11[4] = self;
    v13 = a3;
    v12 = v9;
    -[CSSpeechManager _getVoiceTriggerAssetIfNeeded:](self, "_getVoiceTriggerAssetIfNeeded:", v11);

  }
  else if (v9)
  {
    v9[2](v9);
  }

}

- (BOOL)_prepareForBluetoothDeviceWithDeviceType:(unint64_t)a3
{
  id v5;
  CSVoiceTriggerFirstPassHearst *voiceTriggerFirstPassHearst;
  unint64_t v7;
  CSVoiceTriggerFirstPassHearst *v8;
  CSVoiceTriggerFirstPassHearst *v9;
  CSVoiceTriggerFirstPassHearst *v10;
  void *v11;
  CSVoiceTriggerFirstPassHearstAP *v12;
  CSVoiceTriggerFirstPassHearstAP *voiceTriggerFirstPassHearstAP;
  CSVoiceTriggerFirstPassJarvis *voiceTriggerFirstPassJarvis;
  CSVoiceTriggerFirstPassJarvis *v15;
  CSVoiceTriggerFirstPassJarvis *v16;
  CSVoiceTriggerFirstPassJarvis *v17;
  void *v18;
  CSVoiceTriggerFirstPassJarvisAP *v19;
  CSVoiceTriggerFirstPassJarvisAP *voiceTriggerFirstPassJarvisAP;
  void *v21;

  v5 = -[CSSpeechManager _voiceTriggerFileLoggerCreateIfNeeded:](self, "_voiceTriggerFileLoggerCreateIfNeeded:", 1);
  if (a3 == 1)
  {
    voiceTriggerFirstPassJarvis = self->_voiceTriggerFirstPassJarvis;
    LOBYTE(v7) = voiceTriggerFirstPassJarvis == 0;
    if (!voiceTriggerFirstPassJarvis)
    {
      v15 = objc_alloc_init(CSVoiceTriggerFirstPassJarvis);
      v16 = self->_voiceTriggerFirstPassJarvis;
      self->_voiceTriggerFirstPassJarvis = v15;

      -[CSVoiceTriggerFirstPassJarvis start](self->_voiceTriggerFirstPassJarvis, "start");
      v17 = self->_voiceTriggerFirstPassJarvis;
      -[CSSpeechManager _voiceTriggerEventNotifierCreateIfNeeded:](self, "_voiceTriggerEventNotifierCreateIfNeeded:", 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[CSVoiceTriggerFirstPassJarvis setDelegate:](v17, "setDelegate:", v18);

    }
    if (!self->_voiceTriggerFirstPassJarvisAP)
    {
      v19 = objc_alloc_init(CSVoiceTriggerFirstPassJarvisAP);
      voiceTriggerFirstPassJarvisAP = self->_voiceTriggerFirstPassJarvisAP;
      self->_voiceTriggerFirstPassJarvisAP = v19;

      -[CSVoiceTriggerFirstPassJarvisAP start](self->_voiceTriggerFirstPassJarvisAP, "start");
      v7 = (unint64_t)self->_voiceTriggerFirstPassJarvisAP;
      goto LABEL_11;
    }
  }
  else
  {
    if (a3)
    {
      LOBYTE(v7) = 0;
      return v7;
    }
    voiceTriggerFirstPassHearst = self->_voiceTriggerFirstPassHearst;
    v7 = voiceTriggerFirstPassHearst == 0;
    if (!voiceTriggerFirstPassHearst)
    {
      v8 = objc_alloc_init(CSVoiceTriggerFirstPassHearst);
      v9 = self->_voiceTriggerFirstPassHearst;
      self->_voiceTriggerFirstPassHearst = v8;

      -[CSVoiceTriggerFirstPassHearst start](self->_voiceTriggerFirstPassHearst, "start");
      v10 = self->_voiceTriggerFirstPassHearst;
      -[CSSpeechManager _voiceTriggerEventNotifierCreateIfNeeded:](self, "_voiceTriggerEventNotifierCreateIfNeeded:", 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[CSVoiceTriggerFirstPassHearst setDelegate:](v10, "setDelegate:", v11);

    }
    if (!self->_voiceTriggerFirstPassHearstAP)
    {
      v12 = objc_alloc_init(CSVoiceTriggerFirstPassHearstAP);
      voiceTriggerFirstPassHearstAP = self->_voiceTriggerFirstPassHearstAP;
      self->_voiceTriggerFirstPassHearstAP = v12;

      -[CSVoiceTriggerFirstPassHearstAP start](self->_voiceTriggerFirstPassHearstAP, "start");
      v7 = (unint64_t)self->_voiceTriggerFirstPassHearstAP;
LABEL_11:
      -[CSSpeechManager _voiceTriggerEventNotifierCreateIfNeeded:](self, "_voiceTriggerEventNotifierCreateIfNeeded:", 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v7, "setDelegate:", v21);

      LOBYTE(v7) = 1;
    }
  }
  return v7;
}

- (void)_startForBluetoothDeviceWithDeviceType:(unint64_t)a3 asset:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  v6 = a4;
  if (!a3)
  {
    v7 = 168;
    v8 = 160;
    goto LABEL_5;
  }
  if (a3 == 1)
  {
    v7 = 152;
    v8 = 144;
LABEL_5:
    v9 = v6;
    objc_msgSend(*(id *)((char *)&self->super.isa + v8), "setAsset:", v6);
    objc_msgSend(*(id *)((char *)&self->super.isa + v7), "setAsset:", v9);
    v6 = v9;
  }

}

- (void)_prepareRemoraDeviceWithConnectedDeviceIds:(id)a3
{
  id v4;
  CSVoiceTriggerFirstPassRemora *v5;
  CSVoiceTriggerFirstPassRemora *voiceTriggerFirstPassRemora;
  id v7;

  if (!self->_voiceTriggerFirstPassRemora)
  {
    v4 = a3;
    v5 = objc_alloc_init(CSVoiceTriggerFirstPassRemora);
    voiceTriggerFirstPassRemora = self->_voiceTriggerFirstPassRemora;
    self->_voiceTriggerFirstPassRemora = v5;

    -[CSVoiceTriggerFirstPassRemora start](self->_voiceTriggerFirstPassRemora, "start");
    -[CSVoiceTriggerFirstPassRemora setConnectedDeviceIds:](self->_voiceTriggerFirstPassRemora, "setConnectedDeviceIds:", v4);

    -[CSSpeechManager _preMyriadCoordinatorCreateIfNeeded:](self, "_preMyriadCoordinatorCreateIfNeeded:", 1);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[CSVoiceTriggerFirstPassRemora setDelegate:](self->_voiceTriggerFirstPassRemora, "setDelegate:", v7);
    -[CSVoiceTriggerFirstPassRemora setSecondPassProgressDelegate:](self->_voiceTriggerFirstPassRemora, "setSecondPassProgressDelegate:", v7);
    objc_msgSend(v7, "setRemoraSecondPassProgressProvider:", self->_voiceTriggerFirstPassRemora);

  }
}

- (void)_teardownForBluetoothDevice
{
  NSObject *v3;
  CSVoiceTriggerFirstPassHearst *voiceTriggerFirstPassHearst;
  CSVoiceTriggerFirstPassJarvis *voiceTriggerFirstPassJarvis;
  CSVoiceTriggerFirstPassHearstAP *voiceTriggerFirstPassHearstAP;
  CSVoiceTriggerFirstPassJarvisAP *voiceTriggerFirstPassJarvisAP;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315138;
    v9 = "-[CSSpeechManager _teardownForBluetoothDevice]";
    _os_log_impl(&dword_1C2614000, v3, OS_LOG_TYPE_DEFAULT, "%s Teardown VoiceTrigger due to bluetooth device disconnection", (uint8_t *)&v8, 0xCu);
  }
  -[CSVoiceTriggerFirstPassHearst setDelegate:](self->_voiceTriggerFirstPassHearst, "setDelegate:", 0);
  voiceTriggerFirstPassHearst = self->_voiceTriggerFirstPassHearst;
  self->_voiceTriggerFirstPassHearst = 0;

  -[CSVoiceTriggerFirstPassJarvis setDelegate:](self->_voiceTriggerFirstPassJarvis, "setDelegate:", 0);
  voiceTriggerFirstPassJarvis = self->_voiceTriggerFirstPassJarvis;
  self->_voiceTriggerFirstPassJarvis = 0;

  -[CSVoiceTriggerFirstPassHearstAP setDelegate:](self->_voiceTriggerFirstPassHearstAP, "setDelegate:", 0);
  voiceTriggerFirstPassHearstAP = self->_voiceTriggerFirstPassHearstAP;
  self->_voiceTriggerFirstPassHearstAP = 0;

  -[CSVoiceTriggerFirstPassJarvisAP setDelegate:](self->_voiceTriggerFirstPassJarvisAP, "setDelegate:", 0);
  voiceTriggerFirstPassJarvisAP = self->_voiceTriggerFirstPassJarvisAP;
  self->_voiceTriggerFirstPassJarvisAP = 0;

}

- (void)CSAudioServerCrashMonitorDidReceiveServerRestart:(id)a3
{
  objc_msgSend(MEMORY[0x1E0D19010], "createSharedAudioSession", a3);
}

- (void)opportuneSpeakEventMonitor:(id)a3 didStreamStateChanged:(BOOL)a4
{
  id v6;
  NSObject *queue;
  id v8;
  _QWORD block[5];
  id v10;
  BOOL v11;

  v6 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__CSSpeechManager_opportuneSpeakEventMonitor_didStreamStateChanged___block_invoke;
  block[3] = &unk_1E7C28888;
  v11 = a4;
  block[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(queue, block);

}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (OS_dispatch_queue)assetQueryQueue
{
  return self->_assetQueryQueue;
}

- (void)setAssetQueryQueue:(id)a3
{
  objc_storeStrong((id *)&self->_assetQueryQueue, a3);
}

- (CSAudioRecorder)audioRecorder
{
  return self->_audioRecorder;
}

- (void)setAudioRecorder:(id)a3
{
  objc_storeStrong((id *)&self->_audioRecorder, a3);
}

- (NSMutableDictionary)audioProviders
{
  return self->_audioProviders;
}

- (void)setAudioProviders:(id)a3
{
  objc_storeStrong((id *)&self->_audioProviders, a3);
}

- (void)setAudioTapProvider:(id)a3
{
  objc_storeStrong((id *)&self->_audioTapProvider, a3);
}

- (CSFallbackAudioSessionReleaseProvider)fallbackAudioSessionReleaseProvider
{
  return self->_fallbackAudioSessionReleaseProvider;
}

- (void)setFallbackAudioSessionReleaseProvider:(id)a3
{
  objc_storeStrong((id *)&self->_fallbackAudioSessionReleaseProvider, a3);
}

- (id)clientController
{
  return objc_loadWeakRetained(&self->_clientController);
}

- (void)setClientController:(id)a3
{
  objc_storeWeak(&self->_clientController, a3);
}

- (OS_dispatch_queue)voiceTriggerQueue
{
  return self->_voiceTriggerQueue;
}

- (void)setVoiceTriggerQueue:(id)a3
{
  objc_storeStrong((id *)&self->_voiceTriggerQueue, a3);
}

- (CSBuiltInVoiceTrigger)voiceTrigger
{
  return self->_voiceTrigger;
}

- (void)setVoiceTrigger:(id)a3
{
  objc_storeStrong((id *)&self->_voiceTrigger, a3);
}

- (CSVoiceTriggerEventsCoordinator)voiceTriggerEventsCoordinator
{
  return self->_voiceTriggerEventsCoordinator;
}

- (void)setVoiceTriggerEventsCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_voiceTriggerEventsCoordinator, a3);
}

- (CSPreMyriadCoordinator)preMyriadCoordinator
{
  return self->_preMyriadCoordinator;
}

- (void)setPreMyriadCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_preMyriadCoordinator, a3);
}

- (CSVoiceTriggerFileLogger)voiceTriggerFileLogger
{
  return self->_voiceTriggerFileLogger;
}

- (void)setVoiceTriggerFileLogger:(id)a3
{
  objc_storeStrong((id *)&self->_voiceTriggerFileLogger, a3);
}

- (CSSelfTriggerController)selfTriggerController
{
  return self->_selfTriggerController;
}

- (void)setSelfTriggerController:(id)a3
{
  objc_storeStrong((id *)&self->_selfTriggerController, a3);
}

- (CSKeywordDetector)keywordDetector
{
  return self->_keywordDetector;
}

- (void)setKeywordDetector:(id)a3
{
  objc_storeStrong((id *)&self->_keywordDetector, a3);
}

- (CSMyriadPHash)myriad
{
  return self->_myriad;
}

- (void)setMyriad:(id)a3
{
  objc_storeStrong((id *)&self->_myriad, a3);
}

- (CSMyriadSelfTriggerCoordinator)myriadSelfTriggerCoordinator
{
  return self->_myriadSelfTriggerCoordinator;
}

- (void)setMyriadSelfTriggerCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_myriadSelfTriggerCoordinator, a3);
}

- (CSVoiceTriggerFirstPassJarvis)voiceTriggerFirstPassJarvis
{
  return self->_voiceTriggerFirstPassJarvis;
}

- (void)setVoiceTriggerFirstPassJarvis:(id)a3
{
  objc_storeStrong((id *)&self->_voiceTriggerFirstPassJarvis, a3);
}

- (CSVoiceTriggerFirstPassJarvisAP)voiceTriggerFirstPassJarvisAP
{
  return self->_voiceTriggerFirstPassJarvisAP;
}

- (void)setVoiceTriggerFirstPassJarvisAP:(id)a3
{
  objc_storeStrong((id *)&self->_voiceTriggerFirstPassJarvisAP, a3);
}

- (CSVoiceTriggerFirstPassHearst)voiceTriggerFirstPassHearst
{
  return self->_voiceTriggerFirstPassHearst;
}

- (void)setVoiceTriggerFirstPassHearst:(id)a3
{
  objc_storeStrong((id *)&self->_voiceTriggerFirstPassHearst, a3);
}

- (CSVoiceTriggerFirstPassHearstAP)voiceTriggerFirstPassHearstAP
{
  return self->_voiceTriggerFirstPassHearstAP;
}

- (void)setVoiceTriggerFirstPassHearstAP:(id)a3
{
  objc_storeStrong((id *)&self->_voiceTriggerFirstPassHearstAP, a3);
}

- (CSVoiceTriggerFirstPassRemora)voiceTriggerFirstPassRemora
{
  return self->_voiceTriggerFirstPassRemora;
}

- (void)setVoiceTriggerFirstPassRemora:(id)a3
{
  objc_storeStrong((id *)&self->_voiceTriggerFirstPassRemora, a3);
}

- (CSVoiceProfileRetrainManager)voiceTriggerRetrainer
{
  return self->_voiceTriggerRetrainer;
}

- (void)setVoiceTriggerRetrainer:(id)a3
{
  objc_storeStrong((id *)&self->_voiceTriggerRetrainer, a3);
}

- (OS_dispatch_source)clearLoggingFileTimer
{
  return self->_clearLoggingFileTimer;
}

- (void)setClearLoggingFileTimer:(id)a3
{
  objc_storeStrong((id *)&self->_clearLoggingFileTimer, a3);
}

- (int64_t)clearLoggingFileTimerCount
{
  return self->_clearLoggingFileTimerCount;
}

- (void)setClearLoggingFileTimerCount:(int64_t)a3
{
  self->_clearLoggingFileTimerCount = a3;
}

- (CSOpportuneSpeakListnerTestService)opportuneSpeakListnerTestService
{
  return self->_opportuneSpeakListnerTestService;
}

- (void)setOpportuneSpeakListnerTestService:(id)a3
{
  objc_storeStrong((id *)&self->_opportuneSpeakListnerTestService, a3);
}

- (CSPostBuildInstallService)postBuildInstallService
{
  return self->_postBuildInstallService;
}

- (void)setPostBuildInstallService:(id)a3
{
  objc_storeStrong((id *)&self->_postBuildInstallService, a3);
}

- (CSSmartSiriVolumeManager)ssvManager
{
  return self->_ssvManager;
}

- (void)setSsvManager:(id)a3
{
  objc_storeStrong((id *)&self->_ssvManager, a3);
}

- (CSVoiceTriggerAssetHandler)assetHandler
{
  return self->_assetHandler;
}

- (void)setAssetHandler:(id)a3
{
  self->_assetHandler = (CSVoiceTriggerAssetHandler *)a3;
}

- (BOOL)isExclaveHardware
{
  return self->_isExclaveHardware;
}

- (void)setIsExclaveHardware:(BOOL)a3
{
  self->_isExclaveHardware = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ssvManager, 0);
  objc_storeStrong((id *)&self->_postBuildInstallService, 0);
  objc_storeStrong((id *)&self->_opportuneSpeakListnerTestService, 0);
  objc_storeStrong((id *)&self->_clearLoggingFileTimer, 0);
  objc_storeStrong((id *)&self->_voiceTriggerRetrainer, 0);
  objc_storeStrong((id *)&self->_voiceTriggerFirstPassRemora, 0);
  objc_storeStrong((id *)&self->_voiceTriggerFirstPassHearstAP, 0);
  objc_storeStrong((id *)&self->_voiceTriggerFirstPassHearst, 0);
  objc_storeStrong((id *)&self->_voiceTriggerFirstPassJarvisAP, 0);
  objc_storeStrong((id *)&self->_voiceTriggerFirstPassJarvis, 0);
  objc_storeStrong((id *)&self->_myriadSelfTriggerCoordinator, 0);
  objc_storeStrong((id *)&self->_myriad, 0);
  objc_storeStrong((id *)&self->_keywordDetector, 0);
  objc_storeStrong((id *)&self->_selfTriggerController, 0);
  objc_storeStrong((id *)&self->_voiceTriggerFileLogger, 0);
  objc_storeStrong((id *)&self->_preMyriadCoordinator, 0);
  objc_storeStrong((id *)&self->_voiceTriggerEventsCoordinator, 0);
  objc_storeStrong((id *)&self->_voiceTrigger, 0);
  objc_storeStrong((id *)&self->_voiceTriggerQueue, 0);
  objc_destroyWeak(&self->_clientController);
  objc_storeStrong((id *)&self->_fallbackAudioSessionReleaseProvider, 0);
  objc_storeStrong((id *)&self->_audioTapProvider, 0);
  objc_storeStrong((id *)&self->_audioProviders, 0);
  objc_storeStrong((id *)&self->_audioRecorder, 0);
  objc_storeStrong((id *)&self->_assetQueryQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __68__CSSpeechManager_opportuneSpeakEventMonitor_didStreamStateChanged___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  _QWORD v4[5];
  id v5;
  char v6;

  if (*(_BYTE *)(a1 + 48))
  {
    v2 = *(_QWORD **)(a1 + 32);
    v3 = (void *)v2[21];
    if (v3)
    {
      objc_msgSend(v3, "opportuneSpeakEventMonitor:didStreamStateChanged:", *(_QWORD *)(a1 + 40), 1);
    }
    else
    {
      v4[0] = MEMORY[0x1E0C809B0];
      v4[1] = 3221225472;
      v4[2] = __68__CSSpeechManager_opportuneSpeakEventMonitor_didStreamStateChanged___block_invoke_2;
      v4[3] = &unk_1E7C24C08;
      v4[4] = v2;
      v5 = *(id *)(a1 + 40);
      v6 = *(_BYTE *)(a1 + 48);
      objc_msgSend(v2, "_getVoiceTriggerAssetIfNeeded:", v4);

    }
  }
}

void __68__CSSpeechManager_opportuneSpeakEventMonitor_didStreamStateChanged___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;
  char v11;

  v3 = a2;
  v8[0] = MEMORY[0x1E0C809B0];
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v6 = *(NSObject **)(v4 + 16);
  v8[2] = __68__CSSpeechManager_opportuneSpeakEventMonitor_didStreamStateChanged___block_invoke_3;
  v8[3] = &unk_1E7C29278;
  v8[1] = 3221225472;
  v8[4] = v4;
  v9 = v3;
  v10 = v5;
  v11 = *(_BYTE *)(a1 + 48);
  v7 = v3;
  dispatch_async(v6, v8);

}

uint64_t __68__CSSpeechManager_opportuneSpeakEventMonitor_didStreamStateChanged___block_invoke_3(uint64_t a1)
{
  CSVoiceTriggerFirstPassHearstAP *v2;
  uint64_t v3;
  void *v4;
  _QWORD *v5;
  void *v6;
  void *v7;

  v2 = objc_alloc_init(CSVoiceTriggerFirstPassHearstAP);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 168);
  *(_QWORD *)(v3 + 168) = v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 168), "start");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 168), "setAsset:", *(_QWORD *)(a1 + 40));
  v5 = *(_QWORD **)(a1 + 32);
  v6 = (void *)v5[21];
  objc_msgSend(v5, "_voiceTriggerEventNotifierCreateIfNeeded:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDelegate:", v7);

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 168), "opportuneSpeakEventMonitor:didStreamStateChanged:", *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 56));
}

void __95__CSSpeechManager__setupForBluetoothDeviceIfNeededWithDeviceType_prepareCompletion_completion___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;
  uint64_t v11;

  v3 = a2;
  v4 = a1[4];
  v5 = (void *)a1[5];
  v6 = *(NSObject **)(v4 + 16);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[2] = __95__CSSpeechManager__setupForBluetoothDeviceIfNeededWithDeviceType_prepareCompletion_completion___block_invoke_2;
  v8[3] = &unk_1E7C258C8;
  v8[1] = 3221225472;
  v11 = a1[6];
  v8[4] = v4;
  v9 = v3;
  v10 = v5;
  v7 = v3;
  dispatch_async(v6, v8);

}

uint64_t __95__CSSpeechManager__setupForBluetoothDeviceIfNeededWithDeviceType_prepareCompletion_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_startForBluetoothDeviceWithDeviceType:asset:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40));
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __77__CSSpeechManager_CSAudioRouteChangeMonitor_didReceiveAudioRouteChangeEvent___block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = objc_msgSend(MEMORY[0x1E0D19260], "supportBluetoothDeviceVoiceTrigger");
  if ((_DWORD)result)
  {
    if ((unint64_t)(*(_QWORD *)(a1 + 40) - 2) < 4)
      return objc_msgSend(*(id *)(a1 + 32), "_setupForHearstIfNeededWithPrepareCompletion:completion:", 0, &__block_literal_global_66);
    result = CSIsWatch();
    v3 = *(_QWORD *)(a1 + 40);
    if ((_DWORD)result && v3 == 2)
    {
      return objc_msgSend(*(id *)(a1 + 32), "_setupForHearstIfNeededWithPrepareCompletion:completion:", 0, &__block_literal_global_66);
    }
    else if (v3 == 6)
    {
      return objc_msgSend(*(id *)(a1 + 32), "_teardownForBluetoothDevice");
    }
    else if (!v3)
    {
      return objc_msgSend(*(id *)(a1 + 32), "_setupForJarvisIfNeededWithPrepareCompletion:completion:", 0, &__block_literal_global_68);
    }
  }
  return result;
}

void __77__CSSpeechManager_CSAudioRouteChangeMonitor_didReceiveAudioRouteChangeEvent___block_invoke_67()
{
  NSObject *v0;
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v1 = 136315138;
    v2 = "-[CSSpeechManager CSAudioRouteChangeMonitor:didReceiveAudioRouteChangeEvent:]_block_invoke";
    _os_log_impl(&dword_1C2614000, v0, OS_LOG_TYPE_DEFAULT, "%s Setup for Jarvis completed", (uint8_t *)&v1, 0xCu);
  }
}

void __77__CSSpeechManager_CSAudioRouteChangeMonitor_didReceiveAudioRouteChangeEvent___block_invoke_2()
{
  NSObject *v0;
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v1 = 136315138;
    v2 = "-[CSSpeechManager CSAudioRouteChangeMonitor:didReceiveAudioRouteChangeEvent:]_block_invoke_2";
    _os_log_impl(&dword_1C2614000, v0, OS_LOG_TYPE_DEFAULT, "%s Setup for Hearst completed", (uint8_t *)&v1, 0xCu);
  }
}

void __71__CSSpeechManager_activationEventNotificationHandler_event_completion___block_invoke(uint64_t a1)
{
  void *v2;
  id *v3;
  id *v4;
  id *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[5];
  id v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  id v20;

  if (objc_msgSend(*(id *)(a1 + 32), "type") == 6)
  {
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __71__CSSpeechManager_activationEventNotificationHandler_event_completion___block_invoke_2;
    v16[3] = &unk_1E7C27310;
    v2 = *(void **)(a1 + 48);
    v17 = *(id *)(a1 + 40);
    v3 = &v18;
    v18 = v2;
    v4 = &v19;
    v19 = *(id *)(a1 + 32);
    v5 = &v20;
    v20 = *(id *)(a1 + 56);
    objc_msgSend(v17, "_setupForJarvisIfNeededWithPrepareCompletion:completion:", 0, v16);
  }
  else
  {
    v6 = objc_msgSend(*(id *)(a1 + 32), "type");
    v7 = *(void **)(a1 + 40);
    if (v6 == 8)
    {
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __71__CSSpeechManager_activationEventNotificationHandler_event_completion___block_invoke_3;
      v12[3] = &unk_1E7C27310;
      v12[4] = v7;
      v3 = &v13;
      v13 = *(id *)(a1 + 48);
      v4 = &v14;
      v14 = *(id *)(a1 + 32);
      v5 = &v15;
      v15 = *(id *)(a1 + 56);
      objc_msgSend(v7, "_setupForRemoraIfNeededWithCompletion:", v12);
    }
    else
    {
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __71__CSSpeechManager_activationEventNotificationHandler_event_completion___block_invoke_4;
      v8[3] = &unk_1E7C27310;
      v8[4] = v7;
      v3 = &v9;
      v9 = *(id *)(a1 + 48);
      v4 = &v10;
      v10 = *(id *)(a1 + 32);
      v5 = &v11;
      v11 = *(id *)(a1 + 56);
      objc_msgSend(v7, "_setupForHearstIfNeededWithPrepareCompletion:completion:", v8, 0);
    }
  }

}

void __71__CSSpeechManager_activationEventNotificationHandler_event_completion___block_invoke_2(_QWORD *a1)
{
  uint64_t v1;
  id v2;

  if (*(_QWORD *)(a1[4] + 144))
  {
    objc_msgSend(*(id *)(a1[4] + 144), "activationEventNotificationHandler:event:completion:", a1[5], a1[6], a1[7]);
  }
  else
  {
    v1 = a1[7];
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18E80], 602, 0);
    v2 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

  }
}

void __71__CSSpeechManager_activationEventNotificationHandler_event_completion___block_invoke_3(_QWORD *a1)
{
  uint64_t v1;
  id v2;

  if (*(_QWORD *)(a1[4] + 176))
  {
    objc_msgSend(*(id *)(a1[4] + 176), "activationEventNotificationHandler:event:completion:", a1[5], a1[6], a1[7]);
  }
  else
  {
    v1 = a1[7];
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18E80], 602, 0);
    v2 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

  }
}

void __71__CSSpeechManager_activationEventNotificationHandler_event_completion___block_invoke_4(_QWORD *a1)
{
  uint64_t v1;
  id v2;

  if (*(_QWORD *)(a1[4] + 160))
  {
    objc_msgSend(*(id *)(a1[4] + 160), "activationEventNotificationHandler:event:completion:", a1[5], a1[6], a1[7]);
  }
  else
  {
    v1 = a1[7];
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18E80], 602, 0);
    v2 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

  }
}

uint64_t __47__CSSpeechManager__createClearLoggingFileTimer__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleClearLoggingFileTimer");
}

void __62__CSSpeechManager__setAssetForBuiltInVoiceTrigger_completion___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t v3;
  id v4;

  v4 = a2;
  objc_msgSend(*(id *)(a1[4] + 80), "setAsset:forceExclaveToUsePreInstalledAsset:", a1[5], 1);
  v3 = a1[6];
  if (v3)
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);

}

void __62__CSSpeechManager__setAssetForBuiltInVoiceTrigger_completion___block_invoke_2(_QWORD *a1, void *a2)
{
  uint64_t v3;
  id v4;

  v4 = a2;
  objc_msgSend(*(id *)(a1[4] + 80), "setAsset:", a1[5]);
  v3 = a1[6];
  if (v3)
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);

}

void __62__CSSpeechManager__setAssetForBuiltInVoiceTrigger_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id v10;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__CSSpeechManager__setAssetForBuiltInVoiceTrigger_completion___block_invoke_4;
  block[3] = &unk_1E7C24B50;
  v8 = v3;
  v9 = v4;
  v10 = *(id *)(a1 + 48);
  v6 = v3;
  dispatch_async(v5, block);

}

uint64_t __62__CSSpeechManager__setAssetForBuiltInVoiceTrigger_completion___block_invoke_4(_QWORD *a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  int v6;
  const char *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v3 = a1[4];
    v6 = 136315394;
    v7 = "-[CSSpeechManager _setAssetForBuiltInVoiceTrigger:completion:]_block_invoke_4";
    v8 = 2112;
    v9 = v3;
    _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s Mapping asset to EK completed with error %@", (uint8_t *)&v6, 0x16u);
  }
  if (a1[4])
    v4 = a1[5];
  else
    v4 = a1[6];
  return (*(uint64_t (**)(void))(v4 + 16))();
}

void __52__CSSpeechManager__reinitializeVoiceTriggerIfNeeded__block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  _QWORD v3[4];
  id v4;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __52__CSSpeechManager__reinitializeVoiceTriggerIfNeeded__block_invoke_2;
  v3[3] = &unk_1E7C24B00;
  objc_copyWeak(&v4, v1);
  objc_msgSend(WeakRetained, "_getVoiceTriggerAssetIfNeeded:", v3);

  objc_destroyWeak(&v4);
}

void __52__CSSpeechManager__reinitializeVoiceTriggerIfNeeded__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id *v4;
  NSObject **WeakRetained;
  NSObject **v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v3 = a2;
  v4 = (id *)(a1 + 32);
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    v7 = WeakRetained[2];
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __52__CSSpeechManager__reinitializeVoiceTriggerIfNeeded__block_invoke_3;
    v8[3] = &unk_1E7C28E78;
    objc_copyWeak(&v10, v4);
    v9 = v3;
    dispatch_async(v7, v8);

    objc_destroyWeak(&v10);
  }

}

void __52__CSSpeechManager__reinitializeVoiceTriggerIfNeeded__block_invoke_3(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  id v4;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_reinitializeVoiceTriggerWithAsset:", *(_QWORD *)(a1 + 32));

  v4 = objc_loadWeakRetained(v2);
  objc_msgSend(v4, "_setupSpeakerRecognitionWithVTAsset:", *(_QWORD *)(a1 + 32));

}

void __48__CSSpeechManager_audioRecorderWillBeDestroyed___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[CSSpeechManager audioRecorderWillBeDestroyed:]_block_invoke";
    _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v5, 0xCu);
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "unregisterObserver:");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setAudioSessionEventDelegate:", 0);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 32);
  *(_QWORD *)(v3 + 32) = 0;

}

void __59__CSSpeechManager_audioProviderInvalidated_streamHandleId___block_invoke(uint64_t a1)
{
  os_log_t *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  int v15;
  const char *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v2 = (os_log_t *)MEMORY[0x1E0D18F60];
  v3 = (void *)*MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(void **)(a1 + 32);
    v5 = v3;
    objc_msgSend(v4, "UUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 48);
    v15 = 136315650;
    v16 = "-[CSSpeechManager audioProviderInvalidated:streamHandleId:]_block_invoke";
    v17 = 2114;
    v18 = v6;
    v19 = 2050;
    v20 = v7;
    _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_DEFAULT, "%s audioProvider[%{public}@] invalidated with streamHandleId : %{public}llu", (uint8_t *)&v15, 0x20u);

  }
  objc_msgSend(*(id *)(a1 + 32), "setAudioProviderDelegate:", 0);
  objc_msgSend(*(id *)(a1 + 40), "audioProviders");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 48));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(*(id *)(a1 + 40), "audioProviders");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 48));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeObjectForKey:", v12);

  }
  else
  {
    v13 = *v2;
    if (os_log_type_enabled(*v2, OS_LOG_TYPE_DEFAULT))
    {
      v14 = *(void **)(a1 + 48);
      v15 = 136315394;
      v16 = "-[CSSpeechManager audioProviderInvalidated:streamHandleId:]_block_invoke";
      v17 = 2050;
      v18 = v14;
      _os_log_impl(&dword_1C2614000, v13, OS_LOG_TYPE_DEFAULT, "%s No matched audioProvider found for streamHandleId : %{public}llu", (uint8_t *)&v15, 0x16u);
    }
  }
}

void __59__CSSpeechManager_fetchFallbackAudioSessionReleaseProvider__block_invoke(uint64_t a1)
{
  CSFallbackAudioSessionReleaseProvider *v2;
  uint64_t v3;
  void *v4;

  v2 = -[CSFallbackAudioSessionReleaseProvider initWithAudioRecorder:]([CSFallbackAudioSessionReleaseProvider alloc], "initWithAudioRecorder:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32));
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 56);
  *(_QWORD *)(v3 + 56) = v2;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 56));
}

void __45__CSSpeechManager_audioProviderWithStreamID___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  void *v4;
  void *v5;
  os_log_t *v6;
  NSObject *v7;
  _BOOL4 v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  int v22;
  const char *v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD **)(a1 + 32);
  if (v2[4])
  {
    objc_msgSend(v2, "audioProviders");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 48));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = (os_log_t *)MEMORY[0x1E0D18F60];
    v7 = *MEMORY[0x1E0D18F60];
    v8 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT);
    if (v5)
    {
      if (v8)
      {
        v9 = *(_QWORD *)(a1 + 48);
        v22 = 136315394;
        v23 = "-[CSSpeechManager audioProviderWithStreamID:]_block_invoke";
        v24 = 2048;
        v25 = v9;
        _os_log_impl(&dword_1C2614000, v7, OS_LOG_TYPE_DEFAULT, "%s have matched audioProvider with stream handle id : %llu", (uint8_t *)&v22, 0x16u);
      }
      objc_msgSend(*(id *)(a1 + 32), "audioProviders");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 48));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKey:", v11);
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v14 = *(void **)(v13 + 40);
      *(_QWORD *)(v13 + 40) = v12;

      v15 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "audioStreamId");
      if (v15 != *(_QWORD *)(a1 + 48))
      {
        v16 = v15;
        v17 = *v6;
        if (os_log_type_enabled(*v6, OS_LOG_TYPE_ERROR))
        {
          v22 = 136315394;
          v23 = "-[CSSpeechManager audioProviderWithStreamID:]_block_invoke";
          v24 = 2048;
          v25 = v16;
          _os_log_error_impl(&dword_1C2614000, v17, OS_LOG_TYPE_ERROR, "%s provider's streamId(%tu) is invalid, return nil", (uint8_t *)&v22, 0x16u);
        }
        v18 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v19 = *(void **)(v18 + 40);
        *(_QWORD *)(v18 + 40) = 0;

      }
    }
    else if (v8)
    {
      v21 = *(_QWORD *)(a1 + 48);
      v22 = 136315394;
      v23 = "-[CSSpeechManager audioProviderWithStreamID:]_block_invoke";
      v24 = 2048;
      v25 = v21;
      _os_log_impl(&dword_1C2614000, v7, OS_LOG_TYPE_DEFAULT, "%s don't have matched audioProvider with stream handle id : %llu, need to create one later", (uint8_t *)&v22, 0x16u);
    }
  }
  else
  {
    v20 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
    {
      v22 = 136315138;
      v23 = "-[CSSpeechManager audioProviderWithStreamID:]_block_invoke";
      _os_log_error_impl(&dword_1C2614000, v20, OS_LOG_TYPE_ERROR, "%s No audioRecorder available, return nil for audioProvider", (uint8_t *)&v22, 0xCu);
    }
  }
}

void __50__CSSpeechManager_audioProviderWithContext_error___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  os_log_t *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  _QWORD v33[7];
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;
  id obj;
  uint8_t buf[4];
  const char *v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  uint64_t v44;
  _BYTE v45[24];
  uint64_t v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v3 + 40);
  objc_msgSend(v2, "_getAudioRecorderWithError:", &obj);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v3 + 40), obj);
  if (v4)
  {
    *(_QWORD *)v45 = 0;
    *(_QWORD *)&v45[8] = v45;
    *(_QWORD *)&v45[16] = 0x2020000000;
    v46 = 0;
    v34 = 0;
    v35 = &v34;
    v36 = 0x2020000000;
    v37 = 0;
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __50__CSSpeechManager_audioProviderWithContext_error___block_invoke_53;
    v33[3] = &unk_1E7C24AD8;
    v33[4] = v45;
    v33[5] = &v34;
    v5 = *(_QWORD *)(a1 + 40);
    v33[6] = *(_QWORD *)(a1 + 48);
    objc_msgSend(v4, "setContext:completion:", v5, v33);
    v6 = (os_log_t *)MEMORY[0x1E0D18F60];
    v7 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(void **)(a1 + 40);
      v9 = *(_QWORD *)(*(_QWORD *)&v45[8] + 24);
      *(_DWORD *)buf = 136315650;
      v40 = "-[CSSpeechManager audioProviderWithContext:error:]_block_invoke_2";
      v41 = 2114;
      v42 = v8;
      v43 = 2048;
      v44 = v9;
      _os_log_impl(&dword_1C2614000, v7, OS_LOG_TYPE_DEFAULT, "%s For Context : %{public}@, audioStreamId(%llu) has allocated", buf, 0x20u);
    }
    if (*(_QWORD *)(*(_QWORD *)&v45[8] + 24))
    {
      objc_msgSend(*(id *)(a1 + 32), "audioProviders");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(*(_QWORD *)&v45[8] + 24));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKey:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = *v6;
      v14 = os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT);
      if (v12)
      {
        if (v14)
        {
          v15 = *(void **)(*(_QWORD *)&v45[8] + 24);
          *(_DWORD *)buf = 136315394;
          v40 = "-[CSSpeechManager audioProviderWithContext:error:]_block_invoke";
          v41 = 2048;
          v42 = v15;
          _os_log_impl(&dword_1C2614000, v13, OS_LOG_TYPE_DEFAULT, "%s has match with audio stream handle id : %llu", buf, 0x16u);
        }
        objc_msgSend(*(id *)(a1 + 32), "audioProviders");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(*(_QWORD *)&v45[8] + 24));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "objectForKey:", v17);
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
        v20 = *(void **)(v19 + 40);
        *(_QWORD *)(v19 + 40) = v18;

        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setLatestRecordContext:streamType:", *(_QWORD *)(a1 + 40), v35[3]);
        goto LABEL_17;
      }
      if (v14)
      {
        v27 = *(void **)(*(_QWORD *)&v45[8] + 24);
        *(_DWORD *)buf = 136315394;
        v40 = "-[CSSpeechManager audioProviderWithContext:error:]_block_invoke";
        v41 = 2048;
        v42 = v27;
        _os_log_impl(&dword_1C2614000, v13, OS_LOG_TYPE_DEFAULT, "%s does not match with audio stream handle id(%llu), creating new audio provider", buf, 0x16u);
      }
      v28 = objc_alloc(MEMORY[0x1E0D19000]);
      v29 = (void *)objc_msgSend(v28, "initWithAudioStreamHandleId:audioStreamType:audioRecordContext:audioRecorder:", *(_QWORD *)(*(_QWORD *)&v45[8] + 24), v35[3], *(_QWORD *)(a1 + 40), v4);
      objc_msgSend(v29, "start");
      objc_msgSend(v29, "setAudioProviderDelegate:", *(_QWORD *)(a1 + 32));
      objc_msgSend(*(id *)(a1 + 32), "audioProviders");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(*(_QWORD *)&v45[8] + 24));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setObject:forKey:", v29, v31);

      v32 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v25 = *(NSObject **)(v32 + 40);
      *(_QWORD *)(v32 + 40) = v29;
    }
    else
    {
      v25 = *v6;
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "localizedDescription");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315394;
        v40 = "-[CSSpeechManager audioProviderWithContext:error:]_block_invoke";
        v41 = 2112;
        v42 = v26;
        _os_log_error_impl(&dword_1C2614000, v25, OS_LOG_TYPE_ERROR, "%s Failed to get audio stream handle ID : %{publid}@", buf, 0x16u);

      }
    }

LABEL_17:
    _Block_object_dispose(&v34, 8);
    _Block_object_dispose(v45, 8);
    goto LABEL_18;
  }
  v21 = (void *)*MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
  {
    v22 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    v23 = v21;
    objc_msgSend(v22, "localizedDescription");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v45 = 136315394;
    *(_QWORD *)&v45[4] = "-[CSSpeechManager audioProviderWithContext:error:]_block_invoke";
    *(_WORD *)&v45[12] = 2114;
    *(_QWORD *)&v45[14] = v24;
    _os_log_error_impl(&dword_1C2614000, v23, OS_LOG_TYPE_ERROR, "%s Failed to create audio recorder : %{public}@", v45, 0x16u);

  }
LABEL_18:

}

void __50__CSSpeechManager_audioProviderWithContext_error___block_invoke_53(_QWORD *a1, uint64_t a2, uint64_t a3, id obj)
{
  *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = a2;
  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = a3;
  objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), obj);
}

void __41__CSSpeechManager_audioProviderWithUUID___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;

  v2 = (void *)a1[5];
  v3 = *(void **)(a1[4] + 40);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __41__CSSpeechManager_audioProviderWithUUID___block_invoke_2;
  v6[3] = &unk_1E7C24AB0;
  v4 = v2;
  v5 = a1[6];
  v7 = v4;
  v8 = v5;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v6);

}

void __41__CSSpeechManager_audioProviderWithUUID___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  void *v7;
  int v8;
  id v9;

  v9 = a3;
  objc_msgSend(v9, "UUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v8)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
    *a4 = 1;
  }

}

void __52__CSSpeechManager__setupVoiceTriggerWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  id v11;
  NSObject *v12;
  void *v13;
  _QWORD block[4];
  id v15;
  uint64_t v16;
  id v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = (void *)*MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
    {
      v12 = v7;
      objc_msgSend(v6, "localizedDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v19 = "-[CSSpeechManager _setupVoiceTriggerWithCompletion:]_block_invoke";
      v20 = 2114;
      v21 = v13;
      _os_log_error_impl(&dword_1C2614000, v12, OS_LOG_TYPE_ERROR, "%s getVoiceTriggerAsset error : %{public}@", buf, 0x16u);

    }
  }
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(a1 + 40);
  v10 = *(NSObject **)(v8 + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__CSSpeechManager__setupVoiceTriggerWithCompletion___block_invoke_33;
  block[3] = &unk_1E7C28EC8;
  v15 = v5;
  v16 = v8;
  v17 = v9;
  v11 = v5;
  dispatch_async(v10, block);

}

uint64_t __52__CSSpeechManager__setupVoiceTriggerWithCompletion___block_invoke_33(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  CSAudioTapProvider *v11;
  uint64_t v12;
  void *v13;
  CSSelfTriggerController *v14;
  uint64_t v15;
  void *v16;
  _QWORD *v17;
  void *v18;
  void *v19;
  _QWORD *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id WeakRetained;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t result;
  _QWORD v35[5];
  _QWORD v36[5];
  uint8_t buf[4];
  const char *v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v2 = (void *)*MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(a1 + 32);
    v4 = v2;
    objc_msgSend(v3, "resourcePath");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v38 = "-[CSSpeechManager _setupVoiceTriggerWithCompletion:]_block_invoke";
    v39 = 2112;
    v40 = v5;
    _os_log_impl(&dword_1C2614000, v4, OS_LOG_TYPE_DEFAULT, "%s VoiceTrigger initialization resourcePath: %@", buf, 0x16u);

  }
  if (objc_msgSend(MEMORY[0x1E0D19260], "supportSmartVolume"))
  {
    +[CSSmartSiriVolumeManager sharedInstance](CSSmartSiriVolumeManager, "sharedInstance");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 40);
    v8 = *(void **)(v7 + 224);
    *(_QWORD *)(v7 + 224) = v6;

    objc_msgSend(*(id *)(a1 + 40), "_reinitializeSmartSiriVolumeWithAsset:", *(_QWORD *)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 40), "_voiceTriggerEventNotifierCreateIfNeeded:", 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "registerObserver:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 224));

  }
  if (objc_msgSend(MEMORY[0x1E0D19260], "isLocalVoiceTriggerAvailable"))
    v10 = (id)objc_msgSend(*(id *)(a1 + 40), "_voiceTriggerFileLoggerCreateIfNeeded:", 1);
  if (objc_msgSend(MEMORY[0x1E0D19260], "isLocalVoiceTriggerAvailable"))
    objc_msgSend(*(id *)(a1 + 40), "_setAssetForBuiltInVoiceTrigger:completion:", *(_QWORD *)(a1 + 32), 0);
  if (objc_msgSend(*(id *)(a1 + 40), "_shouldSetupSelfTrigger"))
  {
    if (objc_msgSend(MEMORY[0x1E0D19260], "supportAudioTappingSelfTrigger"))
    {
      v11 = objc_alloc_init(CSAudioTapProvider);
      v12 = *(_QWORD *)(a1 + 40);
      v13 = *(void **)(v12 + 48);
      *(_QWORD *)(v12 + 48) = v11;

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 48), "setup");
    }
    v14 = -[CSSelfTriggerController initWithTargetQueue:audioTapProvider:avvcRefChannelAvailable:]([CSSelfTriggerController alloc], "initWithTargetQueue:audioTapProvider:avvcRefChannelAvailable:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 72), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 48), objc_msgSend(*(id *)(a1 + 40), "_isAVVCRefChannelAvailable"));
    v15 = *(_QWORD *)(a1 + 40);
    v16 = *(void **)(v15 + 112);
    *(_QWORD *)(v15 + 112) = v14;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 112), "setAsset:", *(_QWORD *)(a1 + 32));
    v17 = *(_QWORD **)(a1 + 40);
    v18 = (void *)v17[14];
    objc_msgSend(v17, "_myriadSelfTriggerCoordinatorIfNeeded:", 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "registerObserver:", v19);

    v20 = *(_QWORD **)(a1 + 40);
    v21 = (void *)v20[14];
    objc_msgSend(v20, "_voiceTriggerFileLoggerCreateIfNeeded:", 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "registerObserver:", v22);

    v23 = *(_QWORD *)(a1 + 40);
    if (*(_QWORD *)(v23 + 80))
      objc_msgSend(*(id *)(v23 + 112), "registerObserver:");
  }
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 64));

  if (WeakRetained)
  {
    objc_msgSend(*(id *)(a1 + 40), "_voiceTriggerEventNotifierCreateIfNeeded:", 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 64));
    objc_msgSend(v25, "registerObserver:", v26);

  }
  if ((objc_msgSend(MEMORY[0x1E0D19260], "supportHearstVoiceTrigger") & 1) != 0
    || (objc_msgSend(MEMORY[0x1E0D19260], "supportRemoraVoiceTrigger") & 1) != 0
    || objc_msgSend(MEMORY[0x1E0D19260], "supportJarvisVoiceTrigger"))
  {
    objc_msgSend(MEMORY[0x1E0D19018], "sharedInstance");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addObserver:", *(_QWORD *)(a1 + 40));

    objc_msgSend(MEMORY[0x1E0D19018], "sharedInstance");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = MEMORY[0x1E0C809B0];
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __52__CSSpeechManager__setupVoiceTriggerWithCompletion___block_invoke_38;
    v36[3] = &unk_1E7C26FD8;
    v36[4] = *(_QWORD *)(a1 + 40);
    objc_msgSend(v28, "getHearstRouteStatus:", v36);

    objc_msgSend(MEMORY[0x1E0D19018], "sharedInstance");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = v29;
    v35[1] = 3221225472;
    v35[2] = __52__CSSpeechManager__setupVoiceTriggerWithCompletion___block_invoke_42;
    v35[3] = &unk_1E7C284F8;
    v35[4] = *(_QWORD *)(a1 + 40);
    objc_msgSend(v30, "getJarvisConnected:", v35);

  }
  if ((CSIsCommunalDevice() & 1) == 0)
  {
    +[CSVoiceProfileRetrainManager sharedInstance](CSVoiceProfileRetrainManager, "sharedInstance");
    v31 = objc_claimAutoreleasedReturnValue();
    v32 = *(_QWORD *)(a1 + 40);
    v33 = *(void **)(v32 + 184);
    *(_QWORD *)(v32 + 184) = v31;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 184), "triggerVoiceProfileRetrainingWithAsset:", *(_QWORD *)(a1 + 32));
  }
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __52__CSSpeechManager__setupVoiceTriggerWithCompletion___block_invoke_38(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  uint64_t v5;
  NSObject *v6;
  _QWORD v7[6];
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v9 = "-[CSSpeechManager _setupVoiceTriggerWithCompletion:]_block_invoke";
    v10 = 2050;
    v11 = a2;
    _os_log_impl(&dword_1C2614000, v4, OS_LOG_TYPE_DEFAULT, "%s Hearst status: %{public}ld", buf, 0x16u);
  }
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(NSObject **)(v5 + 16);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52__CSSpeechManager__setupVoiceTriggerWithCompletion___block_invoke_39;
  v7[3] = &unk_1E7C29178;
  v7[4] = v5;
  v7[5] = a2;
  dispatch_async(v6, v7);
}

void __52__CSSpeechManager__setupVoiceTriggerWithCompletion___block_invoke_42(uint64_t a1, int a2)
{
  NSObject *v4;
  const __CFString *v5;
  uint64_t v6;
  NSObject *v7;
  _QWORD v8[5];
  char v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  const __CFString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v5 = CFSTR("NO");
    if (a2)
      v5 = CFSTR("YES");
    *(_DWORD *)buf = 136315394;
    v11 = "-[CSSpeechManager _setupVoiceTriggerWithCompletion:]_block_invoke";
    v12 = 2114;
    v13 = v5;
    _os_log_impl(&dword_1C2614000, v4, OS_LOG_TYPE_DEFAULT, "%s Jarvis connected ? %{public}@", buf, 0x16u);
  }
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(NSObject **)(v6 + 16);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __52__CSSpeechManager__setupVoiceTriggerWithCompletion___block_invoke_47;
  v8[3] = &unk_1E7C28480;
  v9 = a2;
  v8[4] = v6;
  dispatch_async(v7, v8);
}

uint64_t __52__CSSpeechManager__setupVoiceTriggerWithCompletion___block_invoke_47(uint64_t result)
{
  if (*(_BYTE *)(result + 40))
    return objc_msgSend(*(id *)(result + 32), "_setupForJarvisIfNeededWithPrepareCompletion:completion:", 0, &__block_literal_global_49);
  return result;
}

void __52__CSSpeechManager__setupVoiceTriggerWithCompletion___block_invoke_2_48()
{
  NSObject *v0;
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v1 = 136315138;
    v2 = "-[CSSpeechManager _setupVoiceTriggerWithCompletion:]_block_invoke_2";
    _os_log_impl(&dword_1C2614000, v0, OS_LOG_TYPE_DEFAULT, "%s Setup for Jarvis completed", (uint8_t *)&v1, 0xCu);
  }
}

uint64_t __52__CSSpeechManager__setupVoiceTriggerWithCompletion___block_invoke_39(uint64_t result)
{
  uint64_t v1;
  BOOL v2;

  v1 = *(_QWORD *)(result + 40);
  if (v1)
    v2 = v1 == 5;
  else
    v2 = 1;
  if (!v2)
    return objc_msgSend(*(id *)(result + 32), "_setupForHearstIfNeededWithPrepareCompletion:completion:", 0, &__block_literal_global_40_6479);
  return result;
}

void __52__CSSpeechManager__setupVoiceTriggerWithCompletion___block_invoke_2()
{
  NSObject *v0;
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v1 = 136315138;
    v2 = "-[CSSpeechManager _setupVoiceTriggerWithCompletion:]_block_invoke_2";
    _os_log_impl(&dword_1C2614000, v0, OS_LOG_TYPE_DEFAULT, "%s Setup for Hearst completed", (uint8_t *)&v1, 0xCu);
  }
}

void __55__CSSpeechManager__setupSpeakerRecognitionWithVTAsset___block_invoke(uint64_t a1, void *a2, void *a3)
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
  if (v6)
  {
    v7 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
    {
      v8 = 136315394;
      v9 = "-[CSSpeechManager _setupSpeakerRecognitionWithVTAsset:]_block_invoke";
      v10 = 2114;
      v11 = v6;
      _os_log_error_impl(&dword_1C2614000, v7, OS_LOG_TYPE_ERROR, "%s ERR: Failed to get SpeakerRecognition assets with error %{public}@", (uint8_t *)&v8, 0x16u);
    }
  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 184), "triggerVoiceProfileRetrainingWithAsset:", v5);
  }

}

uint64_t __49__CSSpeechManager__getVoiceTriggerAssetIfNeeded___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __31__CSSpeechManager_startManager__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  CSOpportuneSpeakListnerTestService *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t result;
  _QWORD v9[5];

  +[CSOnDeviceCachedIrPurgingHandler sharedHandler](CSOnDeviceCachedIrPurgingHandler, "sharedHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cleanUpCachedIrDir");

  +[CSOnDeviceCachedIrPurgingHandler sharedHandler](CSOnDeviceCachedIrPurgingHandler, "sharedHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startRegistration");

  v4 = objc_alloc_init(CSOpportuneSpeakListnerTestService);
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 208);
  *(_QWORD *)(v5 + 208) = v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 208), "start");
  v7 = *(void **)(a1 + 32);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __31__CSSpeechManager_startManager__block_invoke_2;
  v9[3] = &unk_1E7C292C8;
  v9[4] = v7;
  objc_msgSend(v7, "_setupVoiceTriggerWithCompletion:", v9);
  result = CSIsCommunalDevice();
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 32), "_setupSpeakerRecognitionWithVTAsset:", 0);
  return result;
}

void __31__CSSpeechManager_startManager__block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  _QWORD block[5];

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(NSObject **)(v1 + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__CSSpeechManager_startManager__block_invoke_3;
  block[3] = &unk_1E7C292C8;
  block[4] = v1;
  dispatch_async(v2, block);
}

uint64_t __31__CSSpeechManager_startManager__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_startAllClients");
}

+ (id)sharedManager
{
  return 0;
}

+ (id)sharedManagerForCoreSpeechDaemon
{
  if (sharedManagerForCoreSpeechDaemon_onceToken != -1)
    dispatch_once(&sharedManagerForCoreSpeechDaemon_onceToken, &__block_literal_global_6504);
  return (id)sharedManagerForCoreSpeechDaemon_sharedManagerInstanceForCorespeechd;
}

void __51__CSSpeechManager_sharedManagerForCoreSpeechDaemon__block_invoke()
{
  CSSpeechManager *v0;
  void *v1;

  v0 = objc_alloc_init(CSSpeechManager);
  v1 = (void *)sharedManagerForCoreSpeechDaemon_sharedManagerInstanceForCorespeechd;
  sharedManagerForCoreSpeechDaemon_sharedManagerInstanceForCorespeechd = (uint64_t)v0;

}

@end
