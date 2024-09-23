@implementation CSBuiltInVoiceTrigger

- (CSBuiltInVoiceTrigger)initWithTargetQueue:(id)a3 withSpeechManager:(id)a4 withAudioRouteChangeMonitor:(id)a5
{
  NSObject *v8;
  id v9;
  id v10;
  char *v11;
  dispatch_queue_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  CSVoiceTriggerSecondPass *v23;
  void *v24;
  void *v25;
  void **v26;
  uint64_t v27;
  void *v28;
  void **v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  dispatch_group_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  double v40;
  CSVoiceTriggerUserSelectedPhrase *v41;
  void *v42;
  id v43;
  void *v44;
  objc_super v46;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v46.receiver = self;
  v46.super_class = (Class)CSBuiltInVoiceTrigger;
  v11 = -[CSBuiltInVoiceTrigger init](&v46, sel_init);
  if (v11)
  {
    v12 = dispatch_queue_create("VoiceTrigger First Pass Queue", 0);
    v13 = (void *)*((_QWORD *)v11 + 7);
    *((_QWORD *)v11 + 7) = v12;

    if (v8)
      dispatch_set_target_queue(*((dispatch_object_t *)v11 + 7), v8);
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "UUIDString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("builtInVoiceTrigger-%@"), v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setName:", v16);

    objc_msgSend(v11, "_setupStateMachine");
    if (CSHasAOP())
    {
      v17 = objc_alloc_init(MEMORY[0x1E0D19268]);
      v18 = (void *)*((_QWORD *)v11 + 27);
      *((_QWORD *)v11 + 27) = v17;

      +[CSVoiceTriggerAOPModeEnabledPolicyFactory voiceTriggerAOPModeEnabledPolicy](CSVoiceTriggerAOPModeEnabledPolicyFactory, "voiceTriggerAOPModeEnabledPolicy");
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = (void *)*((_QWORD *)v11 + 25);
      *((_QWORD *)v11 + 25) = v19;

    }
    if (objc_msgSend(MEMORY[0x1E0D19260], "isExclaveHardware"))
    {
      objc_msgSend(MEMORY[0x1E0D190D8], "sharedClient");
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = (void *)*((_QWORD *)v11 + 44);
      *((_QWORD *)v11 + 44) = v21;

      objc_msgSend(v11, "_resetFirstExclaveAudioBufferMarkerIfNeeded");
    }
    if (objc_msgSend(v11, "_shouldSecondPassKeepAlive"))
    {
      v23 = -[CSVoiceTriggerSecondPass initWithPHSEnabled:]([CSVoiceTriggerSecondPass alloc], "initWithPHSEnabled:", 1);
      v24 = (void *)*((_QWORD *)v11 + 20);
      *((_QWORD *)v11 + 20) = v23;

      objc_msgSend(*((id *)v11 + 20), "setSecondPassClient:", 1);
      objc_msgSend(v11, "delegate");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*((id *)v11 + 20), "setDelegate:", v25);

    }
    v26 = (void **)(v11 + 304);
    objc_storeStrong((id *)v11 + 38, a4);
    if (!*((_QWORD *)v11 + 38))
    {
      +[CSSpeechManager sharedManagerForCoreSpeechDaemon](CSSpeechManager, "sharedManagerForCoreSpeechDaemon");
      v27 = objc_claimAutoreleasedReturnValue();
      v28 = *v26;
      *v26 = (void *)v27;

    }
    v29 = (void **)(v11 + 296);
    objc_storeStrong((id *)v11 + 37, a5);
    if (!*((_QWORD *)v11 + 37))
    {
      objc_msgSend(MEMORY[0x1E0D19018], "sharedInstance");
      v30 = objc_claimAutoreleasedReturnValue();
      v31 = *v29;
      *v29 = (void *)v30;

    }
    +[CSBuiltInVoiceTriggerEnabledPolicy builtInVoiceTriggerEnabledPolicy](CSBuiltInVoiceTriggerEnabledPolicy, "builtInVoiceTriggerEnabledPolicy");
    v32 = objc_claimAutoreleasedReturnValue();
    v33 = (void *)*((_QWORD *)v11 + 5);
    *((_QWORD *)v11 + 5) = v32;

    v34 = dispatch_group_create();
    v35 = (void *)*((_QWORD *)v11 + 28);
    *((_QWORD *)v11 + 28) = v34;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v36 = objc_claimAutoreleasedReturnValue();
    v37 = (void *)*((_QWORD *)v11 + 22);
    *((_QWORD *)v11 + 22) = v36;

    v11[14] = 0;
    *((_QWORD *)v11 + 29) = 0;
    v11[16] = 0;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v38 = objc_claimAutoreleasedReturnValue();
    v39 = (void *)*((_QWORD *)v11 + 31);
    *((_QWORD *)v11 + 31) = v38;

    v11[11] = 0;
    *((_QWORD *)v11 + 39) = 0;
    objc_msgSend(MEMORY[0x1E0D19090], "inputRecordingBufferDuration");
    *((_QWORD *)v11 + 40) = (unint64_t)(2.0 / v40);
    v11[18] = 0;
    v41 = -[CSVoiceTriggerUserSelectedPhrase initWithEndpointId:]([CSVoiceTriggerUserSelectedPhrase alloc], "initWithEndpointId:", 0);
    v42 = (void *)*((_QWORD *)v11 + 43);
    *((_QWORD *)v11 + 43) = v41;

    v43 = objc_alloc_init(MEMORY[0x1E0D19218]);
    v44 = (void *)*((_QWORD *)v11 + 41);
    *((_QWORD *)v11 + 41) = v43;

  }
  return (CSBuiltInVoiceTrigger *)v11;
}

- (CSBuiltInVoiceTrigger)initWithTargetQueue:(id)a3 withSpeechManager:(id)a4
{
  return -[CSBuiltInVoiceTrigger initWithTargetQueue:withSpeechManager:withAudioRouteChangeMonitor:](self, "initWithTargetQueue:withSpeechManager:withAudioRouteChangeMonitor:", a3, a4, 0);
}

- (void)start
{
  NSObject *v3;
  CSPolicy *voiceTriggerStartPolicy;
  uint64_t v5;
  NSObject *queue;
  CSPolicy *voiceTriggerAOPModeStartPolicy;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  CSAudioRouteChangeMonitor *audioRouteChangeMonitor;
  CSAudioRouteChangeMonitor *v19;
  CSAudioRouteChangeMonitor *v20;
  CSStateCapture *stateCapture;
  _QWORD v22[4];
  id v23;
  _QWORD v24[5];
  _QWORD v25[5];
  _QWORD v26[5];
  _QWORD v27[5];
  _QWORD v28[5];
  _QWORD v29[4];
  id v30;
  _QWORD block[5];
  _QWORD v32[4];
  id v33;
  uint8_t buf[4];
  const char *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0D18F58];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v35 = "-[CSBuiltInVoiceTrigger start]";
    _os_log_impl(&dword_1C2614000, v3, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  objc_initWeak((id *)buf, self);
  -[CSVoiceTriggerSecondPass start](self->_voiceTriggerSecondPass, "start");
  voiceTriggerStartPolicy = self->_voiceTriggerStartPolicy;
  v5 = MEMORY[0x1E0C809B0];
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __30__CSBuiltInVoiceTrigger_start__block_invoke;
  v32[3] = &unk_1E7C26D40;
  objc_copyWeak(&v33, (id *)buf);
  -[CSPolicy setCallback:](voiceTriggerStartPolicy, "setCallback:", v32);
  if (-[CSPolicy isEnabled](self->_voiceTriggerStartPolicy, "isEnabled"))
  {
    -[CSBuiltInVoiceTrigger _transitVoiceTriggerStatus:force:](self, "_transitVoiceTriggerStatus:force:", 1, 0);
  }
  else
  {
    queue = self->_queue;
    block[0] = v5;
    block[1] = 3221225472;
    block[2] = __30__CSBuiltInVoiceTrigger_start__block_invoke_28;
    block[3] = &unk_1E7C292C8;
    block[4] = self;
    dispatch_async(queue, block);
  }
  if (CSHasAOP())
  {
    voiceTriggerAOPModeStartPolicy = self->_voiceTriggerAOPModeStartPolicy;
    v29[0] = v5;
    v29[1] = 3221225472;
    v29[2] = __30__CSBuiltInVoiceTrigger_start__block_invoke_2;
    v29[3] = &unk_1E7C26D40;
    objc_copyWeak(&v30, (id *)buf);
    -[CSPolicy setCallback:](voiceTriggerAOPModeStartPolicy, "setCallback:", v29);
    objc_msgSend(MEMORY[0x1E0D190A8], "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setDelegate:forType:", self, 1);
    objc_msgSend(v8, "start");

    objc_destroyWeak(&v30);
  }
  objc_msgSend(MEMORY[0x1E0D191F0], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "registerObserver:", self);

  objc_msgSend(MEMORY[0x1E0D19028], "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObserver:", self);

  +[CSAVVCRecordingClientMonitor sharedInstance](CSAVVCRecordingClientMonitor, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObserver:", self);

  objc_msgSend(MEMORY[0x1E0D191A0], "phoneCallStateMonitor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObserver:", self);

  +[CSAttSiriStateMonitor sharedInstance](CSAttSiriStateMonitor, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObserver:", self);

  v14 = self->_queue;
  v28[0] = v5;
  v28[1] = 3221225472;
  v28[2] = __30__CSBuiltInVoiceTrigger_start__block_invoke_36;
  v28[3] = &unk_1E7C292C8;
  v28[4] = self;
  dispatch_async(v14, v28);
  objc_msgSend(MEMORY[0x1E0D19280], "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addObserver:", self);

  -[CSAudioRouteChangeMonitor addObserver:](self->_audioRouteChangeMonitor, "addObserver:", self);
  +[CSBluetoothWirelessSplitterMonitor sharedInstance](CSBluetoothWirelessSplitterMonitor, "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addObserver:", self);

  +[CSBluetoothWirelessSplitterMonitor sharedInstance](CSBluetoothWirelessSplitterMonitor, "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v5;
  v27[1] = 3221225472;
  v27[2] = __30__CSBuiltInVoiceTrigger_start__block_invoke_2_39;
  v27[3] = &unk_1E7C27000;
  v27[4] = self;
  objc_msgSend(v17, "splitterState:", v27);

  if (CSIsASMacWithAOP() && objc_msgSend(MEMORY[0x1E0D19260], "supportHearstVoiceTrigger"))
  {
    -[CSAudioRouteChangeMonitor addObserver:](self->_audioRouteChangeMonitor, "addObserver:", self);
    audioRouteChangeMonitor = self->_audioRouteChangeMonitor;
    v26[0] = v5;
    v26[1] = 3221225472;
    v26[2] = __30__CSBuiltInVoiceTrigger_start__block_invoke_4;
    v26[3] = &unk_1E7C26FD8;
    v26[4] = self;
    -[CSAudioRouteChangeMonitor getHearstRouteStatus:](audioRouteChangeMonitor, "getHearstRouteStatus:", v26);
  }
  v19 = self->_audioRouteChangeMonitor;
  v25[0] = v5;
  v25[1] = 3221225472;
  v25[2] = __30__CSBuiltInVoiceTrigger_start__block_invoke_6;
  v25[3] = &unk_1E7C26FD8;
  v25[4] = self;
  -[CSAudioRouteChangeMonitor getHearstRouteStatus:](v19, "getHearstRouteStatus:", v25);
  v20 = self->_audioRouteChangeMonitor;
  v24[0] = v5;
  v24[1] = 3221225472;
  v24[2] = __30__CSBuiltInVoiceTrigger_start__block_invoke_8;
  v24[3] = &unk_1E7C284F8;
  v24[4] = self;
  -[CSAudioRouteChangeMonitor getJarvisConnected:](v20, "getJarvisConnected:", v24);
  -[CSStateCapture start](self->_stateCapture, "start");
  stateCapture = self->_stateCapture;
  v22[0] = v5;
  v22[1] = 3221225472;
  v22[2] = __30__CSBuiltInVoiceTrigger_start__block_invoke_10;
  v22[3] = &unk_1E7C26D90;
  objc_copyWeak(&v23, (id *)buf);
  -[CSStateCapture setStateCaptureBlock:](stateCapture, "setStateCaptureBlock:", v22);
  objc_destroyWeak(&v23);
  objc_destroyWeak(&v33);
  objc_destroyWeak((id *)buf);
}

- (void)reset
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __30__CSBuiltInVoiceTrigger_reset__block_invoke;
  block[3] = &unk_1E7C292C8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_reset
{
  CSKeywordAnalyzerNDAPIResult *onsetResult;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSDictionary *v9;
  NSDictionary *channelSelectionScores;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  self->_hasTriggerPending = 0;
  self->_bestScore = -INFINITY;
  onsetResult = self->_onsetResult;
  self->_bestChannel = 0;
  self->_onsetResult = 0;

  self->_onsetChannel = 0;
  self->_channelSelectionDelay = 0;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = self->_keywordAnalyzersNDAPI;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8++), "reset", (_QWORD)v11);
      }
      while (v6 != v8);
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  v9 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E0C99D80]);
  channelSelectionScores = self->_channelSelectionScores;
  self->_channelSelectionScores = v9;

}

- (void)setSecondPassProgressDelegate:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__CSBuiltInVoiceTrigger_setSecondPassProgressDelegate___block_invoke;
  block[3] = &unk_1E7C28E78;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)setAsset:(id)a3
{
  -[CSBuiltInVoiceTrigger setAsset:forceExclaveToUsePreInstalledAsset:](self, "setAsset:forceExclaveToUsePreInstalledAsset:", a3, 0);
}

- (void)setAsset:(id)a3 forceExclaveToUsePreInstalledAsset:(BOOL)a4
{
  id v6;
  NSObject *v7;
  NSObject *queue;
  id v9;
  _QWORD block[5];
  id v11;
  BOOL v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = *MEMORY[0x1E0D18F58];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v14 = "-[CSBuiltInVoiceTrigger setAsset:forceExclaveToUsePreInstalledAsset:]";
    v15 = 2114;
    v16 = v6;
    _os_log_impl(&dword_1C2614000, v7, OS_LOG_TYPE_DEFAULT, "%s %{public}@", buf, 0x16u);
  }
  objc_msgSend(v6, "logAssetVersionForInsight");
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__CSBuiltInVoiceTrigger_setAsset_forceExclaveToUsePreInstalledAsset___block_invoke;
  block[3] = &unk_1E7C28888;
  block[4] = self;
  v11 = v6;
  v12 = a4;
  v9 = v6;
  dispatch_async(queue, block);

}

- (void)_setAsset:(id)a3 forceExclaveToUsePreInstalledAsset:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  _BOOL8 v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  float v13;
  float v14;
  float v15;
  void *v16;
  float v17;
  float v18;
  float v19;
  NSMutableArray *keywordAnalyzersNDAPI;
  NSObject *v21;
  NSMutableArray *v22;
  NSMutableArray *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  id v35;
  id v36;
  _QWORD v37[4];
  id v38;
  CSBuiltInVoiceTrigger *v39;
  id v40;
  uint8_t buf[4];
  const char *v42;
  uint64_t v43;

  v4 = a4;
  v43 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (v7)
  {
    if (objc_msgSend(MEMORY[0x1E0D19260], "isExclaveHardware"))
    {
      v8 = objc_msgSend(v7, "assetVariant") == 2;
      if (v4)
      {
        v9 = *MEMORY[0x1E0D18F58];
        v8 = 0;
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          v42 = "-[CSBuiltInVoiceTrigger _setAsset:forceExclaveToUsePreInstalledAsset:]";
          _os_log_impl(&dword_1C2614000, v9, OS_LOG_TYPE_DEFAULT, "%s Falling back to preinstalled assets for EK", buf, 0xCu);
          v8 = 0;
        }
      }
      objc_msgSend(MEMORY[0x1E0D19260], "getSiriLanguageWithFallback:", CFSTR("en-US"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[CSExclaveRecordClient setAssetForLocale:isOTA:completion:](self->_exclaveClient, "setAssetForLocale:isOTA:completion:", v10, v8, &__block_literal_global_17957);

    }
    objc_storeStrong((id *)&self->_currentAsset, a3);
    objc_msgSend(MEMORY[0x1E0D19290], "decodeConfigFrom:", self->_currentAsset);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSBuiltInVoiceTrigger setFirstPassConfig:](self, "setFirstPassConfig:", v11);
    -[CSBuiltInVoiceTrigger firstPassConfig](self, "firstPassConfig");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "delaySecondsForChannelSelection");
    v14 = v13;
    objc_msgSend(MEMORY[0x1E0D19090], "inputRecordingSampleRate");
    self->_delayInSamplesRequiredForChannelSelection = (unint64_t)(float)(v14 * v15);

    -[CSBuiltInVoiceTrigger firstPassConfig](self, "firstPassConfig");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "processingChunkSeconds");
    v18 = v17;
    objc_msgSend(MEMORY[0x1E0D19090], "inputRecordingSampleRate");
    self->_processingChunkSamples = (unint64_t)(float)(v18 * v19);

    keywordAnalyzersNDAPI = self->_keywordAnalyzersNDAPI;
    if (keywordAnalyzersNDAPI)
    {
      -[NSMutableArray removeAllObjects](keywordAnalyzersNDAPI, "removeAllObjects");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v22 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
      v23 = self->_keywordAnalyzersNDAPI;
      self->_keywordAnalyzersNDAPI = v22;

    }
    objc_msgSend(MEMORY[0x1E0D191C0], "sharedPowerLogger");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D19280], "sharedInstance");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "isEnabled");
    objc_msgSend(MEMORY[0x1E0D19260], "getSiriLanguageWithFallback:", CFSTR("en-US"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSAsset configVersion](self->_currentAsset, "configVersion");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "powerLogSiriConfigWithVoiceTriggerEnabled:withLanguage:withModelVersion:", v26, v27, v28);

    -[CSBuiltInVoiceTrigger firstPassConfig](self, "firstPassConfig");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "configPathNDAPI");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    -[CSAsset resourcePath](self->_currentAsset, "resourcePath");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = (void *)MEMORY[0x1E0D19260];
    -[CSBuiltInVoiceTrigger firstPassConfig](self, "firstPassConfig");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "processingChannelsBitset");
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __70__CSBuiltInVoiceTrigger__setAsset_forceExclaveToUsePreInstalledAsset___block_invoke_61;
    v37[3] = &unk_1E7C26DF8;
    v35 = v30;
    v38 = v35;
    v39 = self;
    v36 = v31;
    v40 = v36;
    objc_msgSend(v32, "iterateBitset:block:", v34, v37);

    -[CSBuiltInVoiceTrigger _reset](self, "_reset");
    if (-[CSBuiltInVoiceTrigger _shouldEnableAOPVoiceTrigger](self, "_shouldEnableAOPVoiceTrigger"))
      -[CSBuiltInVoiceTrigger _startAOPVoiceTrigger](self, "_startAOPVoiceTrigger");
    -[CSVoiceTriggerSecondPass setAsset:](self->_voiceTriggerSecondPass, "setAsset:", v7);
    if (!self->_firstTimeAssetConfigured)
      self->_firstTimeAssetConfigured = 1;

  }
  else
  {
    v21 = *MEMORY[0x1E0D18F58];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v42 = "-[CSBuiltInVoiceTrigger _setAsset:forceExclaveToUsePreInstalledAsset:]";
      _os_log_impl(&dword_1C2614000, v21, OS_LOG_TYPE_DEFAULT, "%s asset is nil, stop initialization", buf, 0xCu);
    }
  }

}

- (void)_setIsSecondPassRunning:(BOOL)a3
{
  _BOOL4 v3;
  CSSecondPassProgressDelegate **p_secondPassProgressDelegate;
  id WeakRetained;
  void *v7;
  int v8;
  double v9;
  double v10;
  id v11;
  id v12;
  _QWORD v13[5];

  v3 = a3;
  self->_isSecondPassRunning = a3;
  p_secondPassProgressDelegate = &self->_secondPassProgressDelegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_secondPassProgressDelegate);
  if (WeakRetained)
  {
    v7 = WeakRetained;
    v8 = CSIsHorseman();

    if (v8)
    {
      if (v3)
      {
        v13[0] = MEMORY[0x1E0C809B0];
        v13[1] = 3221225472;
        v13[2] = __49__CSBuiltInVoiceTrigger__setIsSecondPassRunning___block_invoke;
        v13[3] = &unk_1E7C26E20;
        v13[4] = self;
        +[CSMyriadPHash signalEstimateWithBuilder:](CSMyriadPHash, "signalEstimateWithBuilder:", v13);
        v10 = v9;
        v11 = objc_loadWeakRetained((id *)p_secondPassProgressDelegate);
        objc_msgSend(v11, "secondPassDidStartForClient:deviceId:withFirstPassEstimate:", 1, 0, v10);

      }
      else
      {
        v12 = objc_loadWeakRetained((id *)p_secondPassProgressDelegate);
        objc_msgSend(v12, "secondPassDidStopForClient:deviceId:", 1, 0);

      }
    }
  }
}

- (void)_transitVoiceTriggerStatus:(BOOL)a3 force:(BOOL)a4
{
  NSObject *queue;
  _QWORD v5[5];
  BOOL v6;
  BOOL v7;

  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __58__CSBuiltInVoiceTrigger__transitVoiceTriggerStatus_force___block_invoke;
  v5[3] = &unk_1E7C26E48;
  v6 = a3;
  v5[4] = self;
  v7 = a4;
  dispatch_async(queue, v5);
}

- (void)_transitAOPModeIfNeededAsync:(BOOL)a3
{
  NSObject *queue;
  _QWORD v4[5];
  BOOL v5;

  queue = self->_queue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __54__CSBuiltInVoiceTrigger__transitAOPModeIfNeededAsync___block_invoke;
  v4[3] = &unk_1E7C28480;
  v4[4] = self;
  v5 = a3;
  dispatch_async(queue, v4);
}

- (void)_transitAOPModeIfNeededSync:(BOOL)a3
{
  NSObject *queue;
  _QWORD v4[5];
  BOOL v5;

  queue = self->_queue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __53__CSBuiltInVoiceTrigger__transitAOPModeIfNeededSync___block_invoke;
  v4[3] = &unk_1E7C28480;
  v4[4] = self;
  v5 = a3;
  dispatch_sync(queue, v4);
}

- (void)_transitAOPModeIfNeeded:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  NSObject *v6;
  int v7;
  const char *v8;
  __int16 v9;
  _BOOL4 v10;
  __int16 v11;
  _BOOL4 v12;
  uint64_t v13;

  v3 = a3;
  v13 = *MEMORY[0x1E0C80C00];
  v5 = (void *)*MEMORY[0x1E0D18F58];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    v7 = 136315650;
    v8 = "-[CSBuiltInVoiceTrigger _transitAOPModeIfNeeded:]";
    v9 = 1024;
    v10 = -[CSBuiltInVoiceTrigger voiceTriggerEnabled](self, "voiceTriggerEnabled");
    v11 = 1024;
    v12 = v3;
    _os_log_impl(&dword_1C2614000, v6, OS_LOG_TYPE_DEFAULT, "%s voiceTriggerEnabled : %d, enable AOP mode : %d", (uint8_t *)&v7, 0x18u);

  }
  if (-[CSBuiltInVoiceTrigger voiceTriggerEnabled](self, "voiceTriggerEnabled"))
    -[CSBuiltInVoiceTrigger _notifyEvent:](self, "_notifyEvent:", v3);
}

- (void)_startListenPollingWithInterval:(double)a3 completion:(id)a4
{
  id v6;
  os_log_t *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  _BOOL4 voiceTriggerEnabled;
  NSObject *v12;
  _QWORD v13[5];
  id v14;
  double v15;
  uint8_t buf[4];
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = (os_log_t *)MEMORY[0x1E0D18F58];
  v8 = *MEMORY[0x1E0D18F58];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v17 = "-[CSBuiltInVoiceTrigger _startListenPollingWithInterval:completion:]";
    _os_log_impl(&dword_1C2614000, v8, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  if (-[CSPolicy isEnabled](self->_voiceTriggerAOPModeStartPolicy, "isEnabled"))
  {
    v9 = *v7;
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v17 = "-[CSBuiltInVoiceTrigger _startListenPollingWithInterval:completion:]";
      _os_log_impl(&dword_1C2614000, v9, OS_LOG_TYPE_DEFAULT, "%s Skip listen polling since VoiceTrigger AP mode is disabled", buf, 0xCu);
    }
    -[CSBuiltInVoiceTrigger _notifyEvent:](self, "_notifyEvent:", 1);
  }
  else
  {
    -[CSBuiltInVoiceTrigger audioStream](self, "audioStream");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v10, "isStreaming") & 1) != 0)
    {

    }
    else
    {
      voiceTriggerEnabled = self->_voiceTriggerEnabled;

      if (voiceTriggerEnabled)
      {
        v13[0] = MEMORY[0x1E0C809B0];
        v13[1] = 3221225472;
        v13[2] = __68__CSBuiltInVoiceTrigger__startListenPollingWithInterval_completion___block_invoke;
        v13[3] = &unk_1E7C290B0;
        v13[4] = self;
        v15 = a3;
        v14 = v6;
        -[CSBuiltInVoiceTrigger _startListenWithCompletion:](self, "_startListenWithCompletion:", v13);

        goto LABEL_15;
      }
    }
    v12 = *v7;
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v17 = "-[CSBuiltInVoiceTrigger _startListenPollingWithInterval:completion:]";
      _os_log_impl(&dword_1C2614000, v12, OS_LOG_TYPE_DEFAULT, "%s Skip listen polling since audio is streaming / VoiceTrigger disabled", buf, 0xCu);
    }
  }
  if (v6)
    (*((void (**)(id, _QWORD, _QWORD))v6 + 2))(v6, 0, 0);
LABEL_15:

}

- (void)_startListenWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  unint64_t phoneCallState;
  uint64_t v11;
  void *v12;
  char v13;
  id v14;
  _QWORD v15[5];
  id v16;
  _QWORD v17[4];
  id v18;
  uint8_t buf[4];
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = *MEMORY[0x1E0D18F58];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v20 = "-[CSBuiltInVoiceTrigger _startListenWithCompletion:]";
    _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  v6 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __52__CSBuiltInVoiceTrigger__startListenWithCompletion___block_invoke;
  v17[3] = &unk_1E7C290D8;
  v7 = v4;
  v18 = v7;
  v8 = (void *)MEMORY[0x1C3BC4734](v17);
  objc_msgSend(MEMORY[0x1E0D19008], "contextForBuiltInVoiceTrigger");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  phoneCallState = self->_phoneCallState;
  v11 = 8;
  if (phoneCallState != 2 && phoneCallState != 4)
  {
    +[CSMXRingtoneMonitor sharedInstance](CSMXRingtoneMonitor, "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isAnyRingtoneCurrentlyPlaying");

    if ((v13 & 1) != 0)
    {
      v11 = 8;
    }
    else
    {
      if (self->_phoneCallState != 3)
      {
        v11 = 1;
        goto LABEL_10;
      }
      v11 = 9;
    }
  }
  objc_msgSend(v9, "setIsRequestDuringActiveCall:", 1);
LABEL_10:
  v15[0] = v6;
  v15[1] = 3221225472;
  v15[2] = __52__CSBuiltInVoiceTrigger__startListenWithCompletion___block_invoke_2;
  v15[3] = &unk_1E7C29128;
  v15[4] = self;
  v16 = v8;
  v14 = v8;
  -[CSBuiltInVoiceTrigger _requestStartAudioStreamWithSource:context:completion:](self, "_requestStartAudioStreamWithSource:context:completion:", v11, v9, v15);

}

- (void)_requestStartAudioStreamWithSource:(unint64_t)a3 context:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void (**v11)(_QWORD, _QWORD, _QWORD);
  _BOOL4 v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  CSSpeechManager *speechManager;
  void *v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  objc_class *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  id v32;
  id v33;
  _QWORD v34[4];
  id v35;
  uint8_t buf[4];
  const char *v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __79__CSBuiltInVoiceTrigger__requestStartAudioStreamWithSource_context_completion___block_invoke;
  v34[3] = &unk_1E7C290D8;
  v10 = v9;
  v35 = v10;
  v11 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1C3BC4734](v34);
  v12 = -[CSBuiltInVoiceTrigger _shouldReuseBuiltInAudioProvider](self, "_shouldReuseBuiltInAudioProvider");
  if (a3 == 1 && v12)
  {
    -[CSSpeechManager audioProviderWithStreamID:](self->_speechManager, "audioProviderWithStreamID:", 1);
    v13 = objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v14 = (void *)v13;
      -[CSBuiltInVoiceTrigger setAudioProvider:](self, "setAudioProvider:", v13);
      v15 = objc_alloc_init(MEMORY[0x1E0D19058]);
      v16 = 0;
LABEL_8:
      v18 = (void *)MEMORY[0x1E0D19058];
      objc_msgSend(MEMORY[0x1E0D19008], "contextForBuiltInVoiceTrigger");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "defaultRequestWithContext:", v19);
      v20 = objc_claimAutoreleasedReturnValue();

      v15 = (id)v20;
LABEL_9:
      objc_msgSend(v15, "setRequiresHistoricalBuffer:", 1);
      objc_msgSend(v15, "setClientIdentity:", 2);
      if (objc_msgSend(MEMORY[0x1E0D19260], "isExclaveHardware"))
      {
        if ((objc_msgSend(MEMORY[0x1E0D19260], "isHypotheticalAudioRouteBluetoothFromAudioSessinoId:", 0) & 1) == 0)
        {
          objc_msgSend(v15, "setRequestExclaveAudio:", 1);
          v21 = *MEMORY[0x1E0D18F58];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315138;
            v37 = "-[CSBuiltInVoiceTrigger _requestStartAudioStreamWithSource:context:completion:]";
            _os_log_impl(&dword_1C2614000, v21, OS_LOG_TYPE_DEFAULT, "%s Asking Exclave Audio", buf, 0xCu);
          }
        }
      }
      v22 = (objc_class *)objc_opt_class();
      NSStringFromClass(v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = 0;
      objc_msgSend(v14, "audioStreamWithRequest:streamName:error:", v15, v23, &v32);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v32;

      if (v24)
      {
        -[CSBuiltInVoiceTrigger setAudioStream:](self, "setAudioStream:", v24);
        objc_msgSend(v24, "setDelegate:", self);
      }
      else
      {
        v26 = (void *)*MEMORY[0x1E0D18F58];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_ERROR))
        {
          v28 = v26;
          objc_msgSend(v25, "localizedDescription");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315394;
          v37 = "-[CSBuiltInVoiceTrigger _requestStartAudioStreamWithSource:context:completion:]";
          v38 = 2114;
          v39 = v29;
          _os_log_error_impl(&dword_1C2614000, v28, OS_LOG_TYPE_ERROR, "%s Failed to get audio stream : %{public}@", buf, 0x16u);

        }
      }
      ((void (**)(_QWORD, BOOL, id))v11)[2](v11, v24 != 0, v25);

      goto LABEL_21;
    }
  }
  speechManager = self->_speechManager;
  v33 = 0;
  -[CSSpeechManager audioProviderWithContext:error:](speechManager, "audioProviderWithContext:error:", v8, &v33);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v33;
  if (v14)
  {
    -[CSBuiltInVoiceTrigger setAudioProvider:](self, "setAudioProvider:", v14);
    v15 = objc_alloc_init(MEMORY[0x1E0D19058]);
    if (a3 > 0xC || ((1 << a3) & 0x1306) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
  v27 = (void *)*MEMORY[0x1E0D18F58];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_ERROR))
  {
    v30 = v27;
    objc_msgSend(v16, "localizedDescription");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v37 = "-[CSBuiltInVoiceTrigger _requestStartAudioStreamWithSource:context:completion:]";
    v38 = 2114;
    v39 = v31;
    _os_log_error_impl(&dword_1C2614000, v30, OS_LOG_TYPE_ERROR, "%s Getting audio stream provider has failed : %{public}@", buf, 0x16u);

  }
  ((void (**)(_QWORD, _QWORD, id))v11)[2](v11, 0, v16);
LABEL_21:

}

- (BOOL)_shouldReuseBuiltInAudioProvider
{
  if (CSIsIOS() && (objc_msgSend(MEMORY[0x1E0D19260], "isExclaveHardware") & 1) != 0)
    return 0;
  else
    return CSIsOSX() ^ 1;
}

- (void)_stopListening
{
  void *v3;
  NSObject *v4;
  NSObject *recordingWillStartGroup;
  NSObject *queue;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  -[CSBuiltInVoiceTrigger audioStream](self, "audioStream");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = *MEMORY[0x1E0D18F58];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v9 = "-[CSBuiltInVoiceTrigger _stopListening]";
      _os_log_impl(&dword_1C2614000, v4, OS_LOG_TYPE_DEFAULT, "%s Waiting for recordingWillStartGroup before scheduling stopAudioStream", buf, 0xCu);
    }
    recordingWillStartGroup = self->_recordingWillStartGroup;
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __39__CSBuiltInVoiceTrigger__stopListening__block_invoke;
    block[3] = &unk_1E7C292C8;
    block[4] = self;
    dispatch_group_notify(recordingWillStartGroup, queue, block);
  }
}

- (void)_startVoiceTriggerWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD);
  os_log_t *v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  _QWORD v9[5];
  void (**v10)(id, _QWORD);
  uint8_t buf[4];
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD))a3;
  v5 = (os_log_t *)MEMORY[0x1E0D18F58];
  v6 = *MEMORY[0x1E0D18F58];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v12 = "-[CSBuiltInVoiceTrigger _startVoiceTriggerWithCompletion:]";
    _os_log_impl(&dword_1C2614000, v6, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  if (self->_isListenPollingStarting)
  {
    v7 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v12 = "-[CSBuiltInVoiceTrigger _startVoiceTriggerWithCompletion:]";
      _os_log_impl(&dword_1C2614000, v7, OS_LOG_TYPE_DEFAULT, "%s Already started listen polling, skip", buf, 0xCu);
    }
    if (v4)
      v4[2](v4, 0);
  }
  else
  {
    v8 = MEMORY[0x1E0C809B0];
    self->_isListenPollingStarting = 1;
    v9[0] = v8;
    v9[1] = 3221225472;
    v9[2] = __58__CSBuiltInVoiceTrigger__startVoiceTriggerWithCompletion___block_invoke;
    v9[3] = &unk_1E7C29128;
    v9[4] = self;
    v10 = v4;
    -[CSBuiltInVoiceTrigger _startListenPollingWithInterval:completion:](self, "_startListenPollingWithInterval:completion:", v9, 1.0);

  }
}

- (void)_startAPVoiceTriggerWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *validationTimer;
  OS_dispatch_source *v7;
  OS_dispatch_source *v8;
  OS_dispatch_source *v9;
  dispatch_time_t v10;
  NSObject *v11;
  _QWORD handler[4];
  id v13;
  uint8_t buf[4];
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = *MEMORY[0x1E0D18F58];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v15 = "-[CSBuiltInVoiceTrigger _startAPVoiceTriggerWithCompletion:]";
    _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  if (objc_msgSend(MEMORY[0x1E0D19260], "isExclaveHardware"))
    -[CSExclaveRecordClient startBargeInVoiceTrigger](self->_exclaveClient, "startBargeInVoiceTrigger");
  validationTimer = self->_validationTimer;
  if (validationTimer)
  {
    dispatch_source_cancel(validationTimer);
    v7 = self->_validationTimer;
    self->_validationTimer = 0;

  }
  v8 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)self->_queue);
  v9 = self->_validationTimer;
  self->_validationTimer = v8;

  v10 = dispatch_time(0, 10000000000);
  dispatch_source_set_timer((dispatch_source_t)self->_validationTimer, v10, 0x1A3185C5000uLL, 0x3B9ACA00uLL);
  objc_initWeak((id *)buf, self);
  v11 = self->_validationTimer;
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __60__CSBuiltInVoiceTrigger__startAPVoiceTriggerWithCompletion___block_invoke;
  handler[3] = &unk_1E7C27FF0;
  objc_copyWeak(&v13, (id *)buf);
  dispatch_source_set_event_handler(v11, handler);
  dispatch_resume((dispatch_object_t)self->_validationTimer);
  -[CSBuiltInVoiceTrigger _startVoiceTriggerWithCompletion:](self, "_startVoiceTriggerWithCompletion:", v4);
  objc_destroyWeak(&v13);
  objc_destroyWeak((id *)buf);

}

- (void)_APModeValidationTimerFired
{
  NSObject *queue;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  queue = self->_queue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __52__CSBuiltInVoiceTrigger__APModeValidationTimerFired__block_invoke;
  v4[3] = &unk_1E7C27FF0;
  objc_copyWeak(&v5, &location);
  dispatch_async(queue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_startAOPVoiceTrigger
{
  NSObject *v3;
  CSVoiceTriggerAlwaysOnProcessor *alwaysOnProcessorController;
  _QWORD v5[4];
  id v6;
  uint8_t buf[4];
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (self->_currentAsset && CSHasAOP())
  {
    v3 = *MEMORY[0x1E0D18F58];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v8 = "-[CSBuiltInVoiceTrigger _startAOPVoiceTrigger]";
      _os_log_impl(&dword_1C2614000, v3, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
    }
    if (objc_msgSend(MEMORY[0x1E0D19260], "isExclaveHardware"))
    {
      objc_initWeak((id *)buf, self);
      alwaysOnProcessorController = self->_alwaysOnProcessorController;
      v5[0] = MEMORY[0x1E0C809B0];
      v5[1] = 3221225472;
      v5[2] = __46__CSBuiltInVoiceTrigger__startAOPVoiceTrigger__block_invoke;
      v5[3] = &unk_1E7C26E90;
      objc_copyWeak(&v6, (id *)buf);
      -[CSVoiceTriggerAlwaysOnProcessor disableVoiceTriggerOnAlwaysOnProcessorWithCompletion:](alwaysOnProcessorController, "disableVoiceTriggerOnAlwaysOnProcessorWithCompletion:", v5);
      objc_destroyWeak(&v6);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      -[CSVoiceTriggerAlwaysOnProcessor enableVoiceTriggerOnAlwaysOnProcessorWithAsset:completion:](self->_alwaysOnProcessorController, "enableVoiceTriggerOnAlwaysOnProcessorWithAsset:completion:", self->_currentAsset, 0);
    }
  }
}

- (BOOL)_shouldEnableAOPVoiceTrigger
{
  return (CSIsHorseman() & 1) == 0 && -[CSBuiltInVoiceTrigger _currentState](self, "_currentState") != 3;
}

- (BOOL)_shouldEnableAPVoiceTrigger
{
  unint64_t v3;

  v3 = -[CSBuiltInVoiceTrigger _currentState](self, "_currentState");
  if (v3 != 1)
    LOBYTE(v3) = -[CSBuiltInVoiceTrigger _currentState](self, "_currentState") == 2;
  return v3;
}

- (BOOL)_shouldHandleAOPVoiceTrigger
{
  void *v3;
  char v4;
  NSObject *v5;
  _BOOL4 v6;
  BOOL result;
  const char *v8;
  _BOOL4 v9;
  _BOOL4 v10;
  _BOOL4 v11;
  void *v12;
  int v13;
  _BOOL4 v14;
  _BOOL4 v15;
  void *v16;
  NSObject *v17;
  void *v18;
  int v19;
  const char *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D19258], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isUserActive");

  if ((v4 & 1) == 0)
  {
    v5 = *MEMORY[0x1E0D18F58];
    v9 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT);
    result = 0;
    if (!v9)
      return result;
    v19 = 136315138;
    v20 = "-[CSBuiltInVoiceTrigger _shouldHandleAOPVoiceTrigger]";
    v8 = "%s User doesn't have ownership of AOP. ignore AOP trigger notification";
    goto LABEL_7;
  }
  if (self->_isPhraseSpotterBypassed)
  {
    v5 = *MEMORY[0x1E0D18F58];
    v6 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT);
    result = 0;
    if (!v6)
      return result;
    v19 = 136315138;
    v20 = "-[CSBuiltInVoiceTrigger _shouldHandleAOPVoiceTrigger]";
    v8 = "%s phraseSpotter bypassed, ignore AOP trigger notification";
    goto LABEL_7;
  }
  if (-[CSBuiltInVoiceTrigger _shouldCheckHearstStatus](self, "_shouldCheckHearstStatus")
    && -[CSBuiltInVoiceTrigger _hasHearstRoutedAndNotInSplitter](self, "_hasHearstRoutedAndNotInSplitter"))
  {
    v5 = *MEMORY[0x1E0D18F58];
    v10 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT);
    result = 0;
    if (v10)
    {
      v19 = 136315138;
      v20 = "-[CSBuiltInVoiceTrigger _shouldHandleAOPVoiceTrigger]";
      v8 = "%s Has hearst routed and not in splitter ignore AOP trigger notification";
LABEL_7:
      _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v19, 0xCu);
      return 0;
    }
  }
  else if (-[CSBuiltInVoiceTrigger _hasPhoneCallOnNonBargeInDevice](self, "_hasPhoneCallOnNonBargeInDevice"))
  {
    v5 = *MEMORY[0x1E0D18F58];
    v11 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT);
    result = 0;
    if (v11)
    {
      v19 = 136315138;
      v20 = "-[CSBuiltInVoiceTrigger _shouldHandleAOPVoiceTrigger]";
      v8 = "%s Is in phone call state but we are a non barge in device";
      goto LABEL_7;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D191F0], "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isStreaming");

    if (v13)
    {
      v5 = *MEMORY[0x1E0D18F58];
      v14 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT);
      result = 0;
      if (v14)
      {
        v19 = 136315138;
        v20 = "-[CSBuiltInVoiceTrigger _shouldHandleAOPVoiceTrigger]";
        v8 = "%s Siri Client is already streaming, ignore AOP trigger notification";
        goto LABEL_7;
      }
    }
    else if (-[CSBuiltInVoiceTrigger _shouldCheckHearstStatus](self, "_shouldCheckHearstStatus")
           && self->_currentSplitterState == 4)
    {
      v5 = *MEMORY[0x1E0D18F58];
      v15 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT);
      result = 0;
      if (v15)
      {
        v19 = 136315138;
        v20 = "-[CSBuiltInVoiceTrigger _shouldHandleAOPVoiceTrigger]";
        v8 = "%s Device has wireless splitter mode with two hearst, ignore AOP trigger notification";
        goto LABEL_7;
      }
    }
    else
    {
      v16 = (void *)*MEMORY[0x1E0D18F58];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT))
      {
        v17 = v16;
        -[CSBuiltInVoiceTrigger _stateName:](self, "_stateName:", -[CSBuiltInVoiceTrigger _currentState](self, "_currentState"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = 136315394;
        v20 = "-[CSBuiltInVoiceTrigger _shouldHandleAOPVoiceTrigger]";
        v21 = 2114;
        v22 = v18;
        _os_log_impl(&dword_1C2614000, v17, OS_LOG_TYPE_DEFAULT, "%s VoiceTrigger current state : %{public}@", (uint8_t *)&v19, 0x16u);

      }
      return !-[CSBuiltInVoiceTrigger _currentState](self, "_currentState")
          || -[CSBuiltInVoiceTrigger _currentState](self, "_currentState") == 2;
    }
  }
  return result;
}

- (BOOL)_hasPhoneCallOnNonBargeInDevice
{
  void *v2;
  int v3;

  if (self->_phoneCallState - 2 < 3)
    return objc_msgSend(MEMORY[0x1E0D19260], "isIOSDeviceSupportingBargeIn") ^ 1;
  +[CSMXRingtoneMonitor sharedInstance](CSMXRingtoneMonitor, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isAnyRingtoneCurrentlyPlaying");

  if (v3)
    return objc_msgSend(MEMORY[0x1E0D19260], "isIOSDeviceSupportingBargeIn") ^ 1;
  else
    return 0;
}

- (BOOL)_hasHearstRoutedAndNotInSplitter
{
  unint64_t currentSplitterState;
  int64_t hearstRouteStatus;
  BOOL isJarvisConnected;

  currentSplitterState = self->_currentSplitterState;
  hearstRouteStatus = self->_hearstRouteStatus;
  isJarvisConnected = self->_isJarvisConnected;
  if (isJarvisConnected)
    isJarvisConnected = -[CSBuiltInVoiceTrigger _currentJarvisTriggerMode](self, "_currentJarvisTriggerMode") != -1;
  return currentSplitterState - 5 < 0xFFFFFFFFFFFFFFFDLL && (unint64_t)(hearstRouteStatus - 1) < 2
      || isJarvisConnected;
}

- (BOOL)_shouldCheckHearstStatus
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0D191F8], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEnabled");

  return v3;
}

- (BOOL)_isBuiltInAOPVoiceTriggerEvent:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  BOOL v6;

  v3 = a3;
  if (objc_msgSend(v3, "type") == 1)
  {
    objc_msgSend(v3, "activationInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("VoiceTriggerEnabledKey"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5 == 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)_isVoiceTriggerStateTransitionEvent:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  BOOL v6;

  v3 = a3;
  if (objc_msgSend(v3, "type") == 1)
  {
    objc_msgSend(v3, "activationInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("VoiceTriggerEnabledKey"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5 != 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)_stopAPVoiceTrigger
{
  void *v3;
  NSObject *validationTimer;
  OS_dispatch_source *v5;
  NSObject *v6;
  NSObject *recordingWillStartGroup;
  NSObject *queue;
  NSObject *v9;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(MEMORY[0x1E0D19260], "isExclaveHardware"))
    -[CSExclaveRecordClient stopBargeInVoiceTrigger](self->_exclaveClient, "stopBargeInVoiceTrigger");
  -[CSBuiltInVoiceTrigger audioStream](self, "audioStream");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    validationTimer = self->_validationTimer;
    if (validationTimer)
    {
      dispatch_source_cancel(validationTimer);
      v5 = self->_validationTimer;
      self->_validationTimer = 0;

    }
    v6 = *MEMORY[0x1E0D18F58];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v12 = "-[CSBuiltInVoiceTrigger _stopAPVoiceTrigger]";
      _os_log_impl(&dword_1C2614000, v6, OS_LOG_TYPE_DEFAULT, "%s Waiting for recordingWillStartGroup before scheduling stopAudioStream", buf, 0xCu);
    }
    recordingWillStartGroup = self->_recordingWillStartGroup;
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __44__CSBuiltInVoiceTrigger__stopAPVoiceTrigger__block_invoke;
    block[3] = &unk_1E7C292C8;
    block[4] = self;
    dispatch_group_notify(recordingWillStartGroup, queue, block);
  }
  else
  {
    v9 = *MEMORY[0x1E0D18F58];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v12 = "-[CSBuiltInVoiceTrigger _stopAPVoiceTrigger]";
      _os_log_error_impl(&dword_1C2614000, v9, OS_LOG_TYPE_ERROR, "%s skip stopAPVoiceTrigger as audioStream not existing", buf, 0xCu);
    }
  }
}

- (void)_stopAOPVoiceTrigger
{
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (CSHasAOP())
  {
    v3 = *MEMORY[0x1E0D18F58];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT))
    {
      v4 = 136315138;
      v5 = "-[CSBuiltInVoiceTrigger _stopAOPVoiceTrigger]";
      _os_log_impl(&dword_1C2614000, v3, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v4, 0xCu);
    }
    -[CSVoiceTriggerAlwaysOnProcessor disableVoiceTriggerOnAlwaysOnProcessorWithCompletion:](self->_alwaysOnProcessorController, "disableVoiceTriggerOnAlwaysOnProcessorWithCompletion:", 0);
  }
}

- (void)audioStreamProvider:(id)a3 didStopStreamUnexpectedly:(int64_t)a4
{
  NSObject *v6;
  NSObject *queue;
  _QWORD v8[6];
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  int64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = *MEMORY[0x1E0D18F58];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v10 = "-[CSBuiltInVoiceTrigger audioStreamProvider:didStopStreamUnexpectedly:]";
    v11 = 2050;
    v12 = a4;
    _os_log_error_impl(&dword_1C2614000, v6, OS_LOG_TYPE_ERROR, "%s stream stopped unexpectedly : %{public}ld", buf, 0x16u);
  }
  queue = self->_queue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __71__CSBuiltInVoiceTrigger_audioStreamProvider_didStopStreamUnexpectedly___block_invoke;
  v8[3] = &unk_1E7C29178;
  v8[4] = self;
  v8[5] = a4;
  dispatch_async(queue, v8);
}

- (void)audioStreamProvider:(id)a3 numSamplesAvailableInExclave:(unint64_t)a4 hostTime:(unint64_t)a5 arrivalHostTimeToAudioRecorder:(unint64_t)a6 exclaveSampleCount:(unint64_t)a7
{
  NSObject *queue;
  _QWORD v8[6];

  queue = self->_queue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __133__CSBuiltInVoiceTrigger_audioStreamProvider_numSamplesAvailableInExclave_hostTime_arrivalHostTimeToAudioRecorder_exclaveSampleCount___block_invoke;
  v8[3] = &unk_1E7C29178;
  v8[4] = self;
  v8[5] = a7;
  dispatch_async(queue, v8);
}

- (void)audioStreamProvider:(id)a3 audioBufferAvailable:(id)a4
{
  id v5;
  NSObject *queue;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  queue = self->_queue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __66__CSBuiltInVoiceTrigger_audioStreamProvider_audioBufferAvailable___block_invoke;
  v8[3] = &unk_1E7C292A0;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(queue, v8);

}

- (void)_resetFirstExclaveAudioBufferMarkerIfNeeded
{
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (!self->_isFirstExclaveAudioBuffer)
  {
    v3 = *MEMORY[0x1E0D18F58];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT))
    {
      v4 = 136315138;
      v5 = "-[CSBuiltInVoiceTrigger _resetFirstExclaveAudioBufferMarkerIfNeeded]";
      _os_log_impl(&dword_1C2614000, v3, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v4, 0xCu);
    }
    -[CSBuiltInVoiceTrigger setIsFirstExclaveAudioBuffer:](self, "setIsFirstExclaveAudioBuffer:", 1);
  }
}

- (BOOL)_shouldSkipAudioChunkHandling
{
  _BOOL4 v3;
  _BOOL4 v4;
  NSObject *v5;
  void *v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  _BOOL4 voiceTriggerEnabled;
  _BOOL4 isPhraseSpotterBypassed;
  NSObject *v13;
  void *v14;
  int v15;
  const char *v16;
  __int16 v17;
  _BOOL4 v18;
  __int16 v19;
  _BOOL4 v20;
  __int16 v21;
  _BOOL4 v22;
  __int16 v23;
  _BOOL4 v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (!self->_currentAsset)
  {
    v5 = *MEMORY[0x1E0D18F58];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_ERROR))
    {
      v15 = 136315138;
      v16 = "-[CSBuiltInVoiceTrigger _shouldSkipAudioChunkHandling]";
      _os_log_error_impl(&dword_1C2614000, v5, OS_LOG_TYPE_ERROR, "%s Could not find Assets. Cannot process Audio", (uint8_t *)&v15, 0xCu);
    }
    return 1;
  }
  if (self->_isSecondPassRunning || self->_isSiriClientListening || self->_attSiriState == 2)
    return 1;
  v3 = -[CSBuiltInVoiceTrigger _hasHearstRoutedAndNotInSplitter](self, "_hasHearstRoutedAndNotInSplitter");
  v4 = (CSIsHorseman() & 1) == 0 && -[CSBuiltInVoiceTrigger _hasHFPDuringPhoneCall](self, "_hasHFPDuringPhoneCall");
  if (!self->_voiceTriggerEnabled
    || self->_isPhraseSpotterBypassed
    || -[CSBuiltInVoiceTrigger _shouldCheckHearstStatus](self, "_shouldCheckHearstStatus") && v3 && !v4
    || (+[CSAVVCRecordingClientMonitor sharedInstance](CSAVVCRecordingClientMonitor, "sharedInstance"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "numOfAVVCRecordingClients"),
        v7,
        v8 >= 2))
  {
    v9 = _shouldSkipAudioChunkHandling_enableHeartbeat;
    if (__ROR8__(0xCCCCCCCCCCCCCCCDLL * _shouldSkipAudioChunkHandling_enableHeartbeat, 1) <= 0x1999999999999999uLL)
    {
      v10 = (void *)*MEMORY[0x1E0D18F58];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT))
      {
        voiceTriggerEnabled = self->_voiceTriggerEnabled;
        isPhraseSpotterBypassed = self->_isPhraseSpotterBypassed;
        v13 = v10;
        +[CSAVVCRecordingClientMonitor sharedInstance](CSAVVCRecordingClientMonitor, "sharedInstance");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 136316674;
        v16 = "-[CSBuiltInVoiceTrigger _shouldSkipAudioChunkHandling]";
        v17 = 1026;
        v18 = voiceTriggerEnabled;
        v19 = 1026;
        v20 = isPhraseSpotterBypassed;
        v21 = 1026;
        v22 = v3;
        v23 = 1026;
        v24 = v4;
        v25 = 2050;
        v26 = objc_msgSend(v14, "numOfAVVCRecordingClients");
        v27 = 2050;
        v28 = _shouldSkipAudioChunkHandling_enableHeartbeat;
        _os_log_impl(&dword_1C2614000, v13, OS_LOG_TYPE_DEFAULT, "%s Bypass audio here because ::                   1> VoiceTrigger enabled = %{public}d;                   2> p"
          "hrase spotter bypassed = %{public}d;                   3> should ignore due to hearst routed and not in splitt"
          "er = %{public}d;                   4> has HFP during call = %{public}d;                   5> AVVC recording cl"
          "ient # = %{public}lu                   heartbeat = %{public}lld",
          (uint8_t *)&v15,
          0x38u);

        v9 = _shouldSkipAudioChunkHandling_enableHeartbeat;
      }
    }
    _shouldSkipAudioChunkHandling_enableHeartbeat = v9 + 1;
    return 1;
  }
  return 0;
}

- (void)_handleAudioChunk:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t processingChunkSamples;
  void *v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  unint64_t channelSelectionDelay;
  void *v18;
  void *context;
  id v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v20 = a3;
  v4 = _handleAudioChunk__heartbeat_CORESPEECH_VOICETRIGGER_FIRSTPASS_LPCM_RECORD_BUFFER_AVAILABLE_17895;
  if (__ROR8__(0xEEEEEEEEEEEEEEEFLL* _handleAudioChunk__heartbeat_CORESPEECH_VOICETRIGGER_FIRSTPASS_LPCM_RECORD_BUFFER_AVAILABLE_17895, 1) <= 0x888888888888888uLL)
  {
    kdebug_trace();
    v4 = _handleAudioChunk__heartbeat_CORESPEECH_VOICETRIGGER_FIRSTPASS_LPCM_RECORD_BUFFER_AVAILABLE_17895;
  }
  _handleAudioChunk__heartbeat_CORESPEECH_VOICETRIGGER_FIRSTPASS_LPCM_RECORD_BUFFER_AVAILABLE_17895 = v4 + 1;
  if (!-[CSBuiltInVoiceTrigger _shouldSkipAudioChunkHandling](self, "_shouldSkipAudioChunkHandling"))
  {
    context = (void *)MEMORY[0x1C3BC4590]();
    v5 = objc_msgSend(v20, "numSamples");
    if (v5)
    {
      v6 = v5;
      v7 = 0;
      do
      {
        if (v6 >= self->_processingChunkSamples)
          processingChunkSamples = self->_processingChunkSamples;
        else
          processingChunkSamples = v6;
        v21 = processingChunkSamples;
        objc_msgSend(v20, "subChunkFrom:numSamples:", v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v9, "numSamples");
        v22 = objc_msgSend(v9, "numSamples");
        v24 = 0u;
        v25 = 0u;
        v26 = 0u;
        v27 = 0u;
        v10 = self->_keywordAnalyzersNDAPI;
        v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v25;
          do
          {
            for (i = 0; i != v12; ++i)
            {
              if (*(_QWORD *)v25 != v13)
                objc_enumerationMutation(v10);
              v15 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
              objc_msgSend(v15, "getBestAnalyzedResultsFromAudioChunk:", v9);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              -[CSBuiltInVoiceTrigger _keywordAnalyzerNDAPI:hasResultAvailable:forChannel:](self, "_keywordAnalyzerNDAPI:hasResultAvailable:forChannel:", v15, v16, objc_msgSend(v15, "activeChannel"));

            }
            v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
          }
          while (v12);
        }

        channelSelectionDelay = self->_channelSelectionDelay;
        if (self->_hasTriggerPending && channelSelectionDelay >= self->_delayInSamplesRequiredForChannelSelection)
        {
          -[CSBuiltInVoiceTrigger _voiceTriggerFirstPassInfoFromAP](self, "_voiceTriggerFirstPassInfoFromAP");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[CSBuiltInVoiceTrigger _reportVoiceTriggerFirstPassFireFromAPWithSource:voiceTriggerFirstPassInfo:](self, "_reportVoiceTriggerFirstPassFireFromAPWithSource:voiceTriggerFirstPassInfo:", 1, v18);

          -[CSBuiltInVoiceTrigger _reset](self, "_reset");
        }
        else
        {
          self->_channelSelectionDelay = channelSelectionDelay + v21;
        }
        v6 -= v23;
        v7 += v22;

      }
      while (v6);
    }
    objc_autoreleasePoolPop(context);
  }

}

- (void)_keywordAnalyzerNDAPI:(id)a3 hasResultAvailable:(id)a4 forChannel:(unint64_t)a5
{
  id v8;
  double v9;
  float v10;
  float v11;
  void *v12;
  int v13;
  void *v14;
  NSObject *v15;
  float v16;
  void *v17;
  unint64_t v18;
  NSObject *v19;
  void *v20;
  float v21;
  float v22;
  NSObject **v23;
  NSObject *v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t delayInSamplesRequiredForChannelSelection;
  float v29;
  NSObject *v30;
  os_log_t *v31;
  void *v32;
  NSObject *v33;
  uint64_t v34;
  void *v35;
  float v36;
  os_log_t v37;
  NSObject *v38;
  void *v39;
  float v40;
  NSDictionary *v41;
  void *v42;
  double v43;
  void *v44;
  NSDictionary *channelSelectionScores;
  uint8_t buf[4];
  const char *v47;
  __int16 v48;
  double v49;
  __int16 v50;
  double v51;
  __int16 v52;
  uint64_t v53;
  __int16 v54;
  uint64_t v55;
  __int16 v56;
  unint64_t v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = COERCE_DOUBLE(a4);
  objc_msgSend(*(id *)&v9, "bestScore");
  v11 = v10;
  if (v9 != 0.0)
  {
    objc_msgSend(MEMORY[0x1E0D19110], "sharedPreferences");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "firstPassDebuggingEnabled");

    if (v13)
    {
      v14 = (void *)*MEMORY[0x1E0D18F58];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT))
      {
        v15 = v14;
        objc_msgSend(*(id *)&v9, "bestScore");
        *(_DWORD *)buf = 136316162;
        v47 = "-[CSBuiltInVoiceTrigger _keywordAnalyzerNDAPI:hasResultAvailable:forChannel:]";
        v48 = 2048;
        v49 = v16;
        v50 = 2048;
        v51 = COERCE_DOUBLE(objc_msgSend(*(id *)&v9, "bestStart"));
        v52 = 2048;
        v53 = objc_msgSend(*(id *)&v9, "bestEnd");
        v54 = 1024;
        LODWORD(v55) = a5;
        _os_log_impl(&dword_1C2614000, v15, OS_LOG_TYPE_DEFAULT, "%s First Pass Score : %lf, First Pass Best Start : %llu, First Pass Best End : %llu, CHANNEL : %d", buf, 0x30u);

      }
    }
  }
  objc_msgSend(MEMORY[0x1E0D19110], "sharedPreferences");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v17, "firstPassDebuggingEnabled") & 1) != 0)
  {

  }
  else
  {
    v18 = _keywordAnalyzerNDAPI_hasResultAvailable_forChannel__heartbeat_17887 % self->_heartbeatFactor;

    if (!v18)
    {
      v19 = *MEMORY[0x1E0D18F58];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        v47 = "-[CSBuiltInVoiceTrigger _keywordAnalyzerNDAPI:hasResultAvailable:forChannel:]";
        v48 = 2050;
        v49 = v11;
        v50 = 2050;
        v51 = *(double *)&a5;
        v52 = 2050;
        v53 = _keywordAnalyzerNDAPI_hasResultAvailable_forChannel__heartbeat_17887;
        _os_log_impl(&dword_1C2614000, v19, OS_LOG_TYPE_DEFAULT, "%s NDAPI first pass best score = %{public}.3f for channel = %{public}tu, heartbeat = %{public}lld", buf, 0x2Au);
      }
    }
  }
  if (*(double *)&a5 == 0.0)
    ++_keywordAnalyzerNDAPI_hasResultAvailable_forChannel__heartbeat_17887;
  if (!self->_hasTriggerPending)
  {
    -[CSBuiltInVoiceTrigger firstPassConfig](self, "firstPassConfig");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "threshold");
    v22 = v21;

    if (v11 >= v22)
    {
      v23 = (NSObject **)MEMORY[0x1E0D18F58];
      v24 = *MEMORY[0x1E0D18F58];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT))
      {
        v25 = v24;
        v26 = objc_msgSend(*(id *)&v9, "samplesAtFire");
        v27 = objc_msgSend(*(id *)&v9, "phId");
        delayInSamplesRequiredForChannelSelection = self->_delayInSamplesRequiredForChannelSelection;
        *(_DWORD *)buf = 136316418;
        v47 = "-[CSBuiltInVoiceTrigger _keywordAnalyzerNDAPI:hasResultAvailable:forChannel:]";
        v48 = 2050;
        v49 = *(double *)&a5;
        v50 = 2050;
        v51 = v11;
        v52 = 2050;
        v53 = v26;
        v54 = 2048;
        v55 = v27;
        v56 = 2050;
        v57 = delayInSamplesRequiredForChannelSelection;
        _os_log_impl(&dword_1C2614000, v25, OS_LOG_TYPE_DEFAULT, "%s NDAPI in channel: %{public}tu passed threshold with score %{public}.3f at sample %{public}tu, best = %tu, setting up decision delay in samples: %{public}tu", buf, 0x3Eu);

        v24 = *v23;
      }
      self->_hasTriggerPending = 1;
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v47 = "-[CSBuiltInVoiceTrigger _keywordAnalyzerNDAPI:hasResultAvailable:forChannel:]";
        v48 = 2050;
        v49 = *(double *)&a5;
        v50 = 2114;
        v51 = v9;
        _os_log_impl(&dword_1C2614000, v24, OS_LOG_TYPE_DEFAULT, "%s Set to use the alignment of channel %{public}tu that first crossed the threshold: %{public}@", buf, 0x20u);
      }
      objc_storeStrong((id *)&self->_onsetResult, a4);
      self->_bestScore = -INFINITY;
      self->_bestChannel = 0;
      self->_onsetChannel = a5;
      self->_channelSelectionDelay = 0;
      if ((unint64_t)-[NSMutableArray count](self->_keywordAnalyzersNDAPI, "count") >= 2)
        -[CSVoiceTriggerSecondPass prewarm](self->_voiceTriggerSecondPass, "prewarm");
    }
    if (!self->_hasTriggerPending)
      goto LABEL_36;
  }
  if (!self->_channelSelectionDelay)
  {
    -[CSKeywordAnalyzerNDAPIResult bestScore](self->_onsetResult, "bestScore");
    if (v11 > v29)
    {
      v30 = *MEMORY[0x1E0D18F58];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v47 = "-[CSBuiltInVoiceTrigger _keywordAnalyzerNDAPI:hasResultAvailable:forChannel:]";
        v48 = 2050;
        v49 = *(double *)&a5;
        v50 = 2114;
        v51 = v9;
        _os_log_impl(&dword_1C2614000, v30, OS_LOG_TYPE_DEFAULT, "%s Update to use the alignment of channel %{public}tu: %{public}@", buf, 0x20u);
      }
      objc_storeStrong((id *)&self->_onsetResult, a4);
      self->_onsetChannel = a5;
    }
  }
  if (self->_channelSelectionDelay >= self->_delayInSamplesRequiredForChannelSelection)
  {
    v31 = (os_log_t *)MEMORY[0x1E0D18F58];
    v32 = (void *)*MEMORY[0x1E0D18F58];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT))
    {
      v33 = v32;
      v34 = objc_msgSend(*(id *)&v9, "samplesAtFire");
      *(_DWORD *)buf = 136315906;
      v47 = "-[CSBuiltInVoiceTrigger _keywordAnalyzerNDAPI:hasResultAvailable:forChannel:]";
      v48 = 2050;
      v49 = v11;
      v50 = 2050;
      v51 = *(double *)&a5;
      v52 = 2050;
      v53 = v34;
      _os_log_impl(&dword_1C2614000, v33, OS_LOG_TYPE_DEFAULT, "%s NDAPI first pass best score for channel selection = %{public}.3f for channel = %{public}tu at sample %{public}tu", buf, 0x2Au);

    }
    if (*(double *)&a5 == 0.0)
    {
      -[CSBuiltInVoiceTrigger firstPassConfig](self, "firstPassConfig");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "masterChannelScoreBoost");
      v11 = v11 + v36;

      v37 = *v31;
      if (os_log_type_enabled(*v31, OS_LOG_TYPE_DEFAULT))
      {
        v38 = v37;
        -[CSBuiltInVoiceTrigger firstPassConfig](self, "firstPassConfig");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "masterChannelScoreBoost");
        *(_DWORD *)buf = 136315650;
        v47 = "-[CSBuiltInVoiceTrigger _keywordAnalyzerNDAPI:hasResultAvailable:forChannel:]";
        v48 = 2050;
        v49 = v11;
        v50 = 2050;
        v51 = v40;
        _os_log_impl(&dword_1C2614000, v38, OS_LOG_TYPE_DEFAULT, "%s Boosting master channel (ch0) score to %{public}.3f by %{public}.3f for stream selection", buf, 0x20u);

      }
    }
    v41 = (NSDictionary *)-[NSDictionary mutableCopy](self->_channelSelectionScores, "mutableCopy");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ch%tu"), a5);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)&v43 = v11;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary setObject:forKey:](v41, "setObject:forKey:", v44, v42);

    channelSelectionScores = self->_channelSelectionScores;
    self->_channelSelectionScores = v41;

    if (v11 > self->_bestScore)
    {
      self->_bestScore = v11;
      self->_bestChannel = a5;
    }

  }
  if (!self->_hasTriggerPending)
LABEL_36:
    objc_msgSend(v8, "resetBest");

}

- (BOOL)_hasHFPDuringPhoneCall
{
  void *v3;
  int v4;
  BOOL result;

  result = (self->_phoneCallState - 2 < 3
         || (+[CSMXRingtoneMonitor sharedInstance](CSMXRingtoneMonitor, "sharedInstance"),
             v3 = (void *)objc_claimAutoreleasedReturnValue(),
             v4 = objc_msgSend(v3, "isAnyRingtoneCurrentlyPlaying"),
             v3,
             v4))
        && self->_hearstRouteStatus == 2;
  return result;
}

- (id)_voiceTriggerFirstPassInfoFromAP
{
  double v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSDictionary *channelSelectionScores;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v21;
  void *v22;
  _QWORD v23[10];
  _QWORD v24[12];

  v24[10] = *MEMORY[0x1E0C80C00];
  v23[0] = *MEMORY[0x1E0D19618];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_bestChannel);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v22;
  v23[1] = *MEMORY[0x1E0D19650];
  *(float *)&v3 = self->_bestScore;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v3);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v21;
  v23[2] = *MEMORY[0x1E0D19658];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[CSKeywordAnalyzerNDAPIResult bestStart](self->_onsetResult, "bestStart"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v24[2] = v4;
  v23[3] = *MEMORY[0x1E0D19620];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[CSKeywordAnalyzerNDAPIResult bestEnd](self->_onsetResult, "bestEnd"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v24[3] = v5;
  v23[4] = *MEMORY[0x1E0D19628];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[CSKeywordAnalyzerNDAPIResult samplesAtFire](self->_onsetResult, "samplesAtFire"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x1E0D19610];
  channelSelectionScores = self->_channelSelectionScores;
  v24[4] = v6;
  v24[5] = channelSelectionScores;
  v9 = *MEMORY[0x1E0D19608];
  v23[5] = v7;
  v23[6] = v9;
  v10 = (void *)MEMORY[0x1E0CB37E8];
  -[CSBuiltInVoiceTrigger firstPassConfig](self, "firstPassConfig");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "delaySecondsForChannelSelection");
  objc_msgSend(v10, "numberWithFloat:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v24[6] = v12;
  v23[7] = *MEMORY[0x1E0D19630];
  v13 = (void *)MEMORY[0x1E0CB37E8];
  -[CSBuiltInVoiceTrigger firstPassConfig](self, "firstPassConfig");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "masterChannelScoreBoost");
  objc_msgSend(v13, "numberWithFloat:");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v24[7] = v15;
  v23[8] = *MEMORY[0x1E0D19638];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_onsetChannel);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v24[8] = v16;
  v23[9] = *MEMORY[0x1E0D19640];
  v17 = (void *)MEMORY[0x1E0CB37E8];
  -[CSKeywordAnalyzerNDAPIResult bestScore](self->_onsetResult, "bestScore");
  objc_msgSend(v17, "numberWithFloat:");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v24[9] = v18;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 10);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (void)_reportVoiceTriggerFirstPassFireFromAPWithSource:(unint64_t)a3 voiceTriggerFirstPassInfo:(id)a4
{
  id v6;
  void *v7;
  int v8;
  _BOOL4 v9;
  unint64_t phoneCallState;
  NSObject *v11;
  BOOL v12;
  unint64_t v13;
  unint64_t v14;
  void *v15;
  void *v16;
  int v17;
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (a3 == 1 || a3 == 11)
  {
    -[CSBuiltInVoiceTrigger _addAudioStreamHold:](self, "_addAudioStreamHold:", CFSTR("APVoiceTriggerDetected"));
    objc_storeStrong((id *)&self->_lastTriggeredOnsetResult, self->_onsetResult);
    self->_lastTriggeredBestChannel = self->_onsetChannel;
    if (self->_phoneCallState - 2 < 3
      || (+[CSMXRingtoneMonitor sharedInstance](CSMXRingtoneMonitor, "sharedInstance"),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          v8 = objc_msgSend(v7, "isAnyRingtoneCurrentlyPlaying"),
          v7,
          v8))
    {
      if (-[CSBuiltInVoiceTrigger _hasHFPDuringPhoneCall](self, "_hasHFPDuringPhoneCall"))
        +[CSMyriadNotifier notifyInEarMyriadTrigger](CSMyriadNotifier, "notifyInEarMyriadTrigger");
      v9 = -[CSBuiltInVoiceTrigger _hasHFPDuringPhoneCall](self, "_hasHFPDuringPhoneCall");
      phoneCallState = self->_phoneCallState;
      if (a3 == 11 && v9)
      {
        if (phoneCallState == 3)
          a3 = 9;
        else
          a3 = 8;
      }
      else
      {
        v12 = phoneCallState == 3;
        v13 = 8;
        if (v12)
          v13 = 9;
        v14 = 13;
        if (v12)
          v14 = 14;
        if (a3 == 11)
          a3 = v14;
        else
          a3 = v13;
      }
    }
    -[CSBuiltInVoiceTrigger audioProvider](self, "audioProvider");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "UUID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSBuiltInVoiceTrigger _handleVoiceTriggerSecondPassWithSource:deviceId:event:audioProviderUUID:firstPassInfo:](self, "_handleVoiceTriggerSecondPassWithSource:deviceId:event:audioProviderUUID:firstPassInfo:", a3, 0, 0, v16, v6);

  }
  else
  {
    v11 = *MEMORY[0x1E0D18F58];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_ERROR))
    {
      v17 = 136315138;
      v18 = "-[CSBuiltInVoiceTrigger _reportVoiceTriggerFirstPassFireFromAPWithSource:voiceTriggerFirstPassInfo:]";
      _os_log_error_impl(&dword_1C2614000, v11, OS_LOG_TYPE_ERROR, "%s The first pass source is not from AP, skip handling!", (uint8_t *)&v17, 0xCu);
    }
  }

}

- (void)_handleVoiceTriggerSecondPassWithSource:(unint64_t)a3 deviceId:(id)a4 event:(id)a5 audioProviderUUID:(id)a6 firstPassInfo:(id)a7
{
  id v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  CSVoiceTriggerSecondPassRequestOption *v20;
  void *v21;
  void *v22;
  void *v23;
  CSVoiceTriggerSecondPassRequestOption *v24;
  CSVoiceTriggerSecondPass *voiceTriggerSecondPass;
  id v26;
  id v27;
  id v28;
  void *v29;
  id v30;
  _QWORD v31[4];
  id v32;
  id v33;
  CSBuiltInVoiceTrigger *v34;
  id v35[2];
  uint8_t buf[4];
  const char *v37;
  __int16 v38;
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v12 = a4;
  v30 = a5;
  v28 = a6;
  v13 = a7;
  v14 = *MEMORY[0x1E0D18F58];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v37 = "-[CSBuiltInVoiceTrigger _handleVoiceTriggerSecondPassWithSource:deviceId:event:audioProviderUUID:firstPassInfo:]";
    v38 = 2114;
    v39 = v13;
    _os_log_impl(&dword_1C2614000, v14, OS_LOG_TYPE_DEFAULT, "%s %{public}@", buf, 0x16u);
  }
  v15 = mach_absolute_time();
  if (v30)
  {
    +[CSVoiceTriggerFirstPassMetrics CSVoiceTriggerFirstPassMetricsWithFirstPassInfoGeneratedTime:firstPassInfoProcessedTime:](CSVoiceTriggerFirstPassMetrics, "CSVoiceTriggerFirstPassMetricsWithFirstPassInfoGeneratedTime:firstPassInfoProcessedTime:", objc_msgSend(v30, "hosttime"), v15);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v29 = 0;
  }
  v16 = (void *)objc_msgSend(v13, "mutableCopy");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v17, *MEMORY[0x1E0D19420]);

  if (objc_msgSend(MEMORY[0x1E0D19260], "isDarwinOS"))
  {
    +[CSHostLauncherDarwin sharedInstance](CSHostLauncherDarwin, "sharedInstance");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "wakeHostForVoiceTrigger");

  }
  -[CSBuiltInVoiceTrigger _setIsSecondPassRunning:](self, "_setIsSecondPassRunning:", 1);
  if (CSIsHorseman())
    self->_isSecondPassCancelled = 0;
  objc_initWeak((id *)buf, self);
  -[CSBuiltInVoiceTrigger _createSecondPassIfNeededWithFirstPassSource:](self, "_createSecondPassIfNeededWithFirstPassSource:", a3);
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = [CSVoiceTriggerSecondPassRequestOption alloc];
  -[CSBuiltInVoiceTrigger audioProvider](self, "audioProvider");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "UUID");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(v16, "copy");
  v24 = -[CSVoiceTriggerSecondPassRequestOption initWithFirstPassSource:deviceId:audioProviderUUID:firstPassInfo:rejectionMHUUID:isSecondChanceRun:firstpassMetrics:rtModelRequestOptions:](v20, "initWithFirstPassSource:deviceId:audioProviderUUID:firstPassInfo:rejectionMHUUID:isSecondChanceRun:firstpassMetrics:rtModelRequestOptions:", a3, v12, v22, v23, v19, -[CSVoiceTriggerSecondChanceContext shouldRunAsSecondChance](self->_secondChanceContext, "shouldRunAsSecondChance"), v29, 0);

  -[CSVoiceTriggerSecondPass setSupportsMultiPhraseDetection:](self->_voiceTriggerSecondPass, "setSupportsMultiPhraseDetection:", -[CSVoiceTriggerUserSelectedPhrase multiPhraseSelected](self->_multiPhraseSelectedStatus, "multiPhraseSelected"));
  voiceTriggerSecondPass = self->_voiceTriggerSecondPass;
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __112__CSBuiltInVoiceTrigger__handleVoiceTriggerSecondPassWithSource_deviceId_event_audioProviderUUID_firstPassInfo___block_invoke;
  v31[3] = &unk_1E7C26EE0;
  v35[1] = (id)a3;
  v26 = v13;
  v32 = v26;
  objc_copyWeak(v35, (id *)buf);
  v27 = v12;
  v33 = v27;
  v34 = self;
  -[CSVoiceTriggerSecondPass handleVoiceTriggerSecondPassFrom:completion:](voiceTriggerSecondPass, "handleVoiceTriggerSecondPassFrom:completion:", v24, v31);
  kdebug_trace();

  objc_destroyWeak(v35);
  objc_destroyWeak((id *)buf);

}

- (void)_handleSecondPassResult:(id)a3 deviceId:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  _BOOL4 v13;
  os_log_t *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  id v21;
  id WeakRetained;
  char v23;
  id v24;
  id v25;
  id v26;
  id v27;
  char v28;
  id v29;
  id v30;
  id v31;
  char v32;
  id v33;
  os_log_t v34;
  id v35;
  char v36;
  id v37;
  id v38;
  id v39;
  char v40;
  NSObject *v41;
  char v42;
  NSObject *v43;
  CSVoiceTriggerSecondChanceContext *v44;
  CSVoiceTriggerSecondChanceContext *secondChanceContext;
  NSObject *queue;
  NSObject *v47;
  void *v48;
  void *v49;
  _QWORD block[6];
  uint8_t buf[4];
  const char *v52;
  __int16 v53;
  _BYTE v54[14];
  __int16 v55;
  void *v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "voiceTriggerEventInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v8, "result");
  v13 = -[CSBuiltInVoiceTrigger _shouldCancelSecondPassResultWithVoiceTriggerInfo:](self, "_shouldCancelSecondPassResultWithVoiceTriggerInfo:", v11);
  v14 = (os_log_t *)MEMORY[0x1E0D18F58];
  v15 = *MEMORY[0x1E0D18F58];
  if (v13)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v52 = "-[CSBuiltInVoiceTrigger _handleSecondPassResult:deviceId:error:]";
      _os_log_impl(&dword_1C2614000, v15, OS_LOG_TYPE_DEFAULT, "%s Cancel second pass since self-trigger was detected within short time window", buf, 0xCu);
      v15 = *v14;
    }
    v12 = 6;
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = v15;
    objc_msgSend(v10, "localizedDescription");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315906;
    v52 = "-[CSBuiltInVoiceTrigger _handleSecondPassResult:deviceId:error:]";
    v53 = 1024;
    *(_DWORD *)v54 = v12;
    *(_WORD *)&v54[4] = 2114;
    *(_QWORD *)&v54[6] = v11;
    v55 = 2114;
    v56 = v17;
    _os_log_impl(&dword_1C2614000, v16, OS_LOG_TYPE_DEFAULT, "%s Second Pass Result, %d, %{public}@, %{public}@", buf, 0x26u);

  }
  v18 = (void *)objc_msgSend(v11, "mutableCopy");
  if (-[CSBuiltInVoiceTrigger _hasHFPDuringPhoneCall](self, "_hasHFPDuringPhoneCall"))
  {
    v19 = *v14;
    if (os_log_type_enabled(*v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v52 = "-[CSBuiltInVoiceTrigger _handleSecondPassResult:deviceId:error:]";
      _os_log_impl(&dword_1C2614000, v19, OS_LOG_TYPE_DEFAULT, "%s HFP during phone call. We will set value to ignore pocket detection.", buf, 0xCu);
    }
    objc_msgSend(v18, "setValue:forKey:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D194A0]);
  }
  if (CSIsHorseman() && self->_isSecondPassCancelled)
  {
    v20 = *v14;
    if (os_log_type_enabled(*v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v52 = "-[CSBuiltInVoiceTrigger _handleSecondPassResult:deviceId:error:]";
      _os_log_impl(&dword_1C2614000, v20, OS_LOG_TYPE_DEFAULT, "%s Second Pass request is marked for cancellation before second pass completion", buf, 0xCu);
    }
    self->_isSecondPassCancelled = 0;
    -[CSBuiltInVoiceTrigger _setIsSecondPassRunning:](self, "_setIsSecondPassRunning:", 0);
    -[CSBuiltInVoiceTrigger _reset](self, "_reset");
    -[CSBuiltInVoiceTrigger _cancelLastAudioStreamHold](self, "_cancelLastAudioStreamHold");
  }
  else
  {
    v49 = v10;
    switch(v12)
    {
      case 1:
        v21 = v9;
        WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        v23 = objc_opt_respondsToSelector();

        v24 = objc_loadWeakRetained((id *)&self->_delegate);
        v25 = v24;
        if ((v23 & 1) != 0)
        {
          objc_msgSend(v24, "voiceTriggerDidDetectKeyword:deviceId:completion:", v18, v21, 0);
        }
        else
        {
          v42 = objc_opt_respondsToSelector();

          v9 = v21;
          if ((v42 & 1) == 0)
            goto LABEL_39;
          v25 = objc_loadWeakRetained((id *)&self->_delegate);
          objc_msgSend(v25, "voiceTriggerDidDetectKeyword:deviceId:", v18, v21);
        }

        v9 = v21;
        goto LABEL_39;
      case 2:
        v26 = v9;
        v27 = objc_loadWeakRetained((id *)&self->_delegate);
        v28 = objc_opt_respondsToSelector();

        v9 = v26;
        if ((v28 & 1) == 0)
          goto LABEL_33;
        v29 = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(v29, "voiceTriggerDidRejected:deviceId:", v18, v26);
        goto LABEL_32;
      case 3:
        v30 = v9;
        v31 = objc_loadWeakRetained((id *)&self->_delegate);
        v32 = objc_opt_respondsToSelector();

        v9 = v30;
        if ((v32 & 1) == 0)
          goto LABEL_33;
        v29 = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(v29, "voiceTriggerDidDetectNearMiss:deviceId:", v18, v30);
        goto LABEL_32;
      case 9:
        v38 = v9;
        v39 = objc_loadWeakRetained((id *)&self->_delegate);
        v40 = objc_opt_respondsToSelector();

        v9 = v38;
        if ((v40 & 1) == 0)
          goto LABEL_33;
        v29 = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(v29, "voiceTriggerDidDetectSpeakerReject:", v18);
LABEL_32:

LABEL_33:
        v41 = *v14;
        if (os_log_type_enabled(*v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v52 = "-[CSBuiltInVoiceTrigger _handleSecondPassResult:deviceId:error:]";
          v53 = 1026;
          *(_DWORD *)v54 = v12;
          _os_log_impl(&dword_1C2614000, v41, OS_LOG_TYPE_DEFAULT, "%s Notifying audioProviderInvalidation due to VoiceTrigger result(%{public}d) so Siri client needs to setContext again", buf, 0x12u);
        }
        -[CSAudioProvider notifyProviderContextChanged](self->_audioProvider, "notifyProviderContextChanged");
        v10 = v49;
        break;
      default:
        v33 = v9;
        v34 = *v14;
        if (os_log_type_enabled(*v14, OS_LOG_TYPE_ERROR))
        {
          v47 = v34;
          objc_msgSend(v49, "localizedDescription");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315394;
          v52 = "-[CSBuiltInVoiceTrigger _handleSecondPassResult:deviceId:error:]";
          v53 = 2114;
          *(_QWORD *)v54 = v48;
          _os_log_error_impl(&dword_1C2614000, v47, OS_LOG_TYPE_ERROR, "%s VoiceTrigger Second Pass has failed : %{public}@", buf, 0x16u);

        }
        v35 = objc_loadWeakRetained((id *)&self->_delegate);
        v36 = objc_opt_respondsToSelector();

        v9 = v33;
        if ((v36 & 1) != 0)
        {
          v37 = objc_loadWeakRetained((id *)&self->_delegate);
          objc_msgSend(v37, "voiceTriggerDidRejected:deviceId:", v18, v33);

        }
        if (v12 != 1 && v12 != 8)
          goto LABEL_33;
LABEL_39:
        v43 = *v14;
        v10 = v49;
        if (os_log_type_enabled(*v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v52 = "-[CSBuiltInVoiceTrigger _handleSecondPassResult:deviceId:error:]";
          v53 = 1026;
          *(_DWORD *)v54 = v12;
          _os_log_impl(&dword_1C2614000, v43, OS_LOG_TYPE_DEFAULT, "%s Not notifying audioProviderInvalidation since VoiceTrigger result is %{public}d", buf, 0x12u);
        }
        break;
    }
    if (objc_msgSend(v8, "isSecondChanceCandidate"))
    {
      v44 = -[CSVoiceTriggerSecondChanceContext initWithWindowStartTime:]([CSVoiceTriggerSecondChanceContext alloc], "initWithWindowStartTime:", mach_absolute_time());
      secondChanceContext = self->_secondChanceContext;
      self->_secondChanceContext = v44;
    }
    else
    {
      secondChanceContext = self->_secondChanceContext;
      self->_secondChanceContext = 0;
    }

    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __64__CSBuiltInVoiceTrigger__handleSecondPassResult_deviceId_error___block_invoke;
    block[3] = &unk_1E7C29178;
    block[4] = self;
    block[5] = v12;
    dispatch_async(queue, block);
  }

}

- (BOOL)_shouldCancelSecondPassResultWithVoiceTriggerInfo:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  unint64_t v9;
  NSObject *v10;
  double v11;
  unint64_t lastSelfTriggerDetectedStartMachTime;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  BOOL v16;
  int v18;
  const char *v19;
  __int16 v20;
  unint64_t v21;
  __int16 v22;
  unint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4
    && (v6 = *MEMORY[0x1E0D19780],
        objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D19780]),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v7,
        v7))
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "unsignedLongLongValue");

    v10 = *MEMORY[0x1E0D18F58];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT))
    {
      lastSelfTriggerDetectedStartMachTime = self->_lastSelfTriggerDetectedStartMachTime;
      v18 = 136315650;
      v19 = "-[CSBuiltInVoiceTrigger _shouldCancelSecondPassResultWithVoiceTriggerInfo:]";
      v20 = 2048;
      v21 = v9;
      v22 = 2048;
      v23 = lastSelfTriggerDetectedStartMachTime;
      _os_log_impl(&dword_1C2614000, v10, OS_LOG_TYPE_DEFAULT, "%s secondPassTriggerStartHostTime = %llu, _lastSelfTriggerDetectedStartMachTime = %llu", (uint8_t *)&v18, 0x20u);
    }
    v13 = self->_lastSelfTriggerDetectedStartMachTime;
    LODWORD(v11) = 0.5;
    v14 = objc_msgSend(MEMORY[0x1E0D19118], "secondsToHostTime:", v11);
    v15 = v9 - v13;
    if (v9 <= v13)
      v15 = v13 - v9;
    v16 = v15 <= v14;
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (void)siriClientBehaviorMonitor:(id)a3 didStartStreamWithContext:(id)a4 successfully:(BOOL)a5 option:(id)a6 withEventUUID:(id)a7
{
  NSObject *queue;
  _QWORD block[5];

  if (a5)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __111__CSBuiltInVoiceTrigger_siriClientBehaviorMonitor_didStartStreamWithContext_successfully_option_withEventUUID___block_invoke;
    block[3] = &unk_1E7C292C8;
    block[4] = self;
    dispatch_async(queue, block);
  }
}

- (void)siriClientBehaviorMonitor:(id)a3 didStopStream:(id)a4 withEventUUID:(id)a5
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __79__CSBuiltInVoiceTrigger_siriClientBehaviorMonitor_didStopStream_withEventUUID___block_invoke;
  block[3] = &unk_1E7C292C8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)siriClientBehaviorMonitor:(id)a3 willStopStream:(id)a4 reason:(unint64_t)a5
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__CSBuiltInVoiceTrigger_siriClientBehaviorMonitor_willStopStream_reason___block_invoke;
  block[3] = &unk_1E7C292C8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)selfTriggerDetector:(id)a3 didDetectSelfTrigger:(id)a4
{
  id v5;
  NSObject *queue;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  queue = self->_queue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __66__CSBuiltInVoiceTrigger_selfTriggerDetector_didDetectSelfTrigger___block_invoke;
  v8[3] = &unk_1E7C292A0;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(queue, v8);

}

- (void)CSAudioServerCrashMonitorDidReceiveServerCrash:(id)a3
{
  NSObject *v4;
  NSObject *queue;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = *MEMORY[0x1E0D18F58];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v8 = "-[CSBuiltInVoiceTrigger CSAudioServerCrashMonitorDidReceiveServerCrash:]";
    _os_log_impl(&dword_1C2614000, v4, OS_LOG_TYPE_DEFAULT, "%s audiomxd/bridgeaudiod crashed", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72__CSBuiltInVoiceTrigger_CSAudioServerCrashMonitorDidReceiveServerCrash___block_invoke;
  block[3] = &unk_1E7C292C8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)CSAudioServerCrashMonitorDidReceiveServerRestart:(id)a3
{
  NSObject *v4;
  NSObject *queue;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = *MEMORY[0x1E0D18F58];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v8 = "-[CSBuiltInVoiceTrigger CSAudioServerCrashMonitorDidReceiveServerRestart:]";
    _os_log_impl(&dword_1C2614000, v4, OS_LOG_TYPE_DEFAULT, "%s audiomxd/bridgeaudiod recovered from crash", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__CSBuiltInVoiceTrigger_CSAudioServerCrashMonitorDidReceiveServerRestart___block_invoke;
  block[3] = &unk_1E7C292C8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)CSVoiceTriggerXPCServiceProxy:(id)a3 bypassPhraseSpotter:(BOOL)a4
{
  NSObject *queue;
  _QWORD v5[5];
  BOOL v6;

  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __75__CSBuiltInVoiceTrigger_CSVoiceTriggerXPCServiceProxy_bypassPhraseSpotter___block_invoke;
  v5[3] = &unk_1E7C28480;
  v5[4] = self;
  v6 = a4;
  dispatch_async(queue, v5);
}

- (void)activationEventNotificationHandler:(id)a3 event:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  NSObject *queue;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;

  v7 = a4;
  v8 = a5;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77__CSBuiltInVoiceTrigger_activationEventNotificationHandler_event_completion___block_invoke;
  block[3] = &unk_1E7C28EC8;
  block[4] = self;
  v13 = v7;
  v14 = v8;
  v10 = v8;
  v11 = v7;
  dispatch_async(queue, block);

}

- (void)_addAudioStreamHold:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  id v7;

  v4 = (objc_class *)MEMORY[0x1E0D19050];
  v5 = a3;
  v7 = (id)objc_msgSend([v4 alloc], "initWithTimeout:clientIdentity:requireRecordModeLock:requireListeningMicIndicatorLock:", 2, 0, 0, 5.0);
  -[CSAudioProvider holdAudioStreamWithDescription:option:](self->_audioProvider, "holdAudioStreamWithDescription:option:", v5, v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableArray addObject:](self->_audioStreamHoldings, "addObject:", v6);
}

- (void)_cancelLastAudioStreamHold
{
  void *v3;
  id v4;

  if (-[NSMutableArray count](self->_audioStreamHoldings, "count"))
  {
    -[NSMutableArray lastObject](self->_audioStreamHoldings, "lastObject");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[CSBuiltInVoiceTrigger audioProvider](self, "audioProvider");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "cancelAudioStreamHold:", v4);

    -[NSMutableArray removeLastObject](self->_audioStreamHoldings, "removeLastObject");
  }
}

- (void)_cancelAllAudioStreamHold
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = self->_audioStreamHoldings;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v7);
        -[CSBuiltInVoiceTrigger audioProvider](self, "audioProvider", (_QWORD)v10);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "cancelAudioStreamHold:", v8);

        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

  -[NSMutableArray removeAllObjects](self->_audioStreamHoldings, "removeAllObjects");
}

- (BOOL)_shouldSecondPassKeepAlive
{
  if ((CSIsHorseman() & 1) != 0)
    return 1;
  else
    return CSIsBridgeOS();
}

- (void)_createSecondPassIfNeededWithFirstPassSource:(unint64_t)a3
{
  NSObject *v5;
  CSOSTransaction *v6;
  CSOSTransaction *secondPassTransaction;
  _BOOL8 v8;
  os_log_t *v9;
  NSObject *v10;
  void *v11;
  int v12;
  NSObject *v13;
  CSVoiceTriggerSecondPass *v14;
  CSVoiceTriggerSecondPass *voiceTriggerSecondPass;
  void *v16;
  int v17;
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (!self->_voiceTriggerSecondPass)
  {
    if (-[CSBuiltInVoiceTrigger _shouldSecondPassKeepAlive](self, "_shouldSecondPassKeepAlive"))
    {
      v5 = *MEMORY[0x1E0D18F58];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_ERROR))
      {
        v17 = 136315138;
        v18 = "-[CSBuiltInVoiceTrigger _createSecondPassIfNeededWithFirstPassSource:]";
        _os_log_error_impl(&dword_1C2614000, v5, OS_LOG_TYPE_ERROR, "%s SecondPass shouldn't be created here", (uint8_t *)&v17, 0xCu);
      }
    }
    else
    {
      v6 = (CSOSTransaction *)objc_msgSend(objc_alloc(MEMORY[0x1E0D19178]), "initWithDescription:", CFSTR("VoiceTrigger SecondPass"));
      secondPassTransaction = self->_secondPassTransaction;
      self->_secondPassTransaction = v6;

      v8 = !self->_shouldDisableOnSpeakerVerificationInSplitterMode;
      v9 = (os_log_t *)MEMORY[0x1E0D18F58];
      if (self->_shouldDisableOnSpeakerVerificationInSplitterMode)
      {
        v10 = *MEMORY[0x1E0D18F58];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT))
        {
          v17 = 136315138;
          v18 = "-[CSBuiltInVoiceTrigger _createSecondPassIfNeededWithFirstPassSource:]";
          _os_log_impl(&dword_1C2614000, v10, OS_LOG_TYPE_DEFAULT, "%s Disable PHS since wireless splitter includes non-DoAP device, and non-DoAP device is in contacts", (uint8_t *)&v17, 0xCu);
        }
      }
      objc_msgSend(MEMORY[0x1E0D19110], "sharedPreferences");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "bypassPersonalizedHeySiri");

      if (v12)
      {
        v13 = *v9;
        v8 = 0;
        if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
        {
          v17 = 136315138;
          v18 = "-[CSBuiltInVoiceTrigger _createSecondPassIfNeededWithFirstPassSource:]";
          _os_log_impl(&dword_1C2614000, v13, OS_LOG_TYPE_DEFAULT, "%s Disable PHS since bypass personalized HeySiri is enabled in internal settings", (uint8_t *)&v17, 0xCu);
          v8 = 0;
        }
      }
      v14 = -[CSVoiceTriggerSecondPass initWithPHSEnabled:]([CSVoiceTriggerSecondPass alloc], "initWithPHSEnabled:", v8);
      voiceTriggerSecondPass = self->_voiceTriggerSecondPass;
      self->_voiceTriggerSecondPass = v14;

      -[CSVoiceTriggerSecondPass setFirstPassSource:](self->_voiceTriggerSecondPass, "setFirstPassSource:", a3);
      -[CSVoiceTriggerSecondPass setSecondPassClient:](self->_voiceTriggerSecondPass, "setSecondPassClient:", 1);
      -[CSVoiceTriggerSecondPass setAsset:](self->_voiceTriggerSecondPass, "setAsset:", self->_currentAsset);
      -[CSBuiltInVoiceTrigger delegate](self, "delegate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[CSVoiceTriggerSecondPass setDelegate:](self->_voiceTriggerSecondPass, "setDelegate:", v16);

      -[CSVoiceTriggerSecondPass start](self->_voiceTriggerSecondPass, "start");
    }
  }
}

- (void)_teardownSecondPassIfNeeded
{
  void *v3;
  CSVoiceTriggerSecondPass *voiceTriggerSecondPass;
  CSOSTransaction *secondPassTransaction;

  if (!-[CSBuiltInVoiceTrigger _shouldSecondPassKeepAlive](self, "_shouldSecondPassKeepAlive"))
  {
    v3 = (void *)MEMORY[0x1C3BC4590]();
    voiceTriggerSecondPass = self->_voiceTriggerSecondPass;
    self->_voiceTriggerSecondPass = 0;

    objc_autoreleasePoolPop(v3);
    secondPassTransaction = self->_secondPassTransaction;
    self->_secondPassTransaction = 0;

  }
}

- (void)_notifyEvent:(unint64_t)a3
{
  void *v5;
  NSObject *v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = (void *)*MEMORY[0x1E0D18F58];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    -[CSBuiltInVoiceTrigger _eventName:](self, "_eventName:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 136315394;
    v9 = "-[CSBuiltInVoiceTrigger _notifyEvent:]";
    v10 = 2114;
    v11 = v7;
    _os_log_impl(&dword_1C2614000, v6, OS_LOG_TYPE_DEFAULT, "%s event : %{public}@", (uint8_t *)&v8, 0x16u);

  }
  -[CSStateMachine performTransitionForEvent:](self->_stateMachine, "performTransitionForEvent:", a3);
}

- (void)_setupStateMachine
{
  CSStateMachine *v3;
  CSStateMachine *stateMachine;

  v3 = (CSStateMachine *)objc_msgSend(objc_alloc(MEMORY[0x1E0D19228]), "initWithInitialState:", 3);
  stateMachine = self->_stateMachine;
  self->_stateMachine = v3;

  -[CSStateMachine setDelegate:](self->_stateMachine, "setDelegate:", self);
  -[CSStateMachine addTransitionFrom:to:for:](self->_stateMachine, "addTransitionFrom:to:for:", 1, 0, 1);
  -[CSStateMachine addTransitionFrom:to:for:](self->_stateMachine, "addTransitionFrom:to:for:", 1, 3, 4);
  -[CSStateMachine addTransitionFrom:to:for:](self->_stateMachine, "addTransitionFrom:to:for:", 0, 2, 0);
  -[CSStateMachine addTransitionFrom:to:for:](self->_stateMachine, "addTransitionFrom:to:for:", 0, 3, 4);
  -[CSStateMachine addTransitionFrom:to:for:](self->_stateMachine, "addTransitionFrom:to:for:", 2, 2, 2);
  -[CSStateMachine addTransitionFrom:to:for:](self->_stateMachine, "addTransitionFrom:to:for:", 2, 0, 1);
  -[CSStateMachine addTransitionFrom:to:for:](self->_stateMachine, "addTransitionFrom:to:for:", 2, 1, 3);
  -[CSStateMachine addTransitionFrom:to:for:](self->_stateMachine, "addTransitionFrom:to:for:", 2, 3, 4);
  -[CSStateMachine addTransitionFrom:to:for:](self->_stateMachine, "addTransitionFrom:to:for:", 3, 1, 0);
  -[CSStateMachine addTransitionFrom:to:for:](self->_stateMachine, "addTransitionFrom:to:for:", 3, 0, 1);
}

- (unint64_t)_currentState
{
  return -[CSStateMachine currentState](self->_stateMachine, "currentState");
}

- (void)cancelSecondPassRunning
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__CSBuiltInVoiceTrigger_cancelSecondPassRunning__block_invoke;
  block[3] = &unk_1E7C292C8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)pendingSecondPassTriggerWasClearedForClient:(unint64_t)a3 deviceId:(id)a4
{
  id v6;
  NSObject *queue;
  id v8;
  _QWORD block[4];
  id v10;
  CSBuiltInVoiceTrigger *v11;
  unint64_t v12;

  v6 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __78__CSBuiltInVoiceTrigger_pendingSecondPassTriggerWasClearedForClient_deviceId___block_invoke;
  block[3] = &unk_1E7C28B58;
  v11 = self;
  v12 = a3;
  v10 = v6;
  v8 = v6;
  dispatch_async(queue, block);

}

- (void)CSBluetoothWirelessSplitterMonitor:(id)a3 didReceiveSplitterStateChange:(unint64_t)a4 shouldDisableSpeakerVerificationInSplitterMode:(BOOL)a5
{
  NSObject *queue;
  _QWORD block[6];
  BOOL v7;

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __137__CSBuiltInVoiceTrigger_CSBluetoothWirelessSplitterMonitor_didReceiveSplitterStateChange_shouldDisableSpeakerVerificationInSplitterMode___block_invoke;
  block[3] = &unk_1E7C284A8;
  block[4] = self;
  block[5] = a4;
  v7 = a5;
  dispatch_async(queue, block);
}

- (void)_updateCurrentSplitterState:(unint64_t)a3 shouldDisableSpeakerVerificationInSplitterMode:(BOOL)a4
{
  _BOOL4 v4;
  NSObject *v7;
  unint64_t currentSplitterState;
  _BOOL4 shouldDisableOnSpeakerVerificationInSplitterMode;
  int v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  int v15;
  __int16 v16;
  _BOOL4 v17;
  __int16 v18;
  _BOOL4 v19;
  uint64_t v20;

  v4 = a4;
  v20 = *MEMORY[0x1E0C80C00];
  v7 = *MEMORY[0x1E0D18F58];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT))
  {
    currentSplitterState = self->_currentSplitterState;
    shouldDisableOnSpeakerVerificationInSplitterMode = self->_shouldDisableOnSpeakerVerificationInSplitterMode;
    v10 = 136316162;
    v11 = "-[CSBuiltInVoiceTrigger _updateCurrentSplitterState:shouldDisableSpeakerVerificationInSplitterMode:]";
    v12 = 1026;
    v13 = currentSplitterState;
    v14 = 1026;
    v15 = a3;
    v16 = 1026;
    v17 = shouldDisableOnSpeakerVerificationInSplitterMode;
    v18 = 1026;
    v19 = v4;
    _os_log_impl(&dword_1C2614000, v7, OS_LOG_TYPE_DEFAULT, "%s Received Wireless Splitter State Change : %{public}d -> %{public}d, shouldDisableSpeakerVerification : %{public}d -> %{public}d", (uint8_t *)&v10, 0x24u);
  }
  self->_currentSplitterState = a3;
  self->_shouldDisableOnSpeakerVerificationInSplitterMode = v4;
}

- (void)CSAudioRouteChangeMonitor:(id)a3 didReceiveAudioRouteChangeEvent:(int64_t)a4
{
  NSObject *queue;
  _QWORD v5[6];

  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __83__CSBuiltInVoiceTrigger_CSAudioRouteChangeMonitor_didReceiveAudioRouteChangeEvent___block_invoke;
  v5[3] = &unk_1E7C29178;
  v5[4] = self;
  v5[5] = a4;
  dispatch_async(queue, v5);
}

- (void)_receivedJarvisConnectionEvent:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  const __CFString *v6;
  int v7;
  const char *v8;
  __int16 v9;
  const __CFString *v10;
  uint64_t v11;

  v3 = a3;
  v11 = *MEMORY[0x1E0C80C00];
  v5 = *MEMORY[0x1E0D18F58];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT))
  {
    v6 = CFSTR("Diconnect");
    if (v3)
      v6 = CFSTR("Connect");
    v7 = 136315394;
    v8 = "-[CSBuiltInVoiceTrigger _receivedJarvisConnectionEvent:]";
    v9 = 2114;
    v10 = v6;
    _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_DEFAULT, "%s Received Jarvis %{public}@ event", (uint8_t *)&v7, 0x16u);
  }
  self->_isJarvisConnected = v3;
  -[CSBuiltInVoiceTrigger _forceUpdateCarPlayEndpointWithJarvisConnected:](self, "_forceUpdateCarPlayEndpointWithJarvisConnected:", v3);
}

- (void)_receivedHearstRoutedEvent:(int64_t)a3
{
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  int64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = *MEMORY[0x1E0D18F58];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315394;
    v7 = "-[CSBuiltInVoiceTrigger _receivedHearstRoutedEvent:]";
    v8 = 2050;
    v9 = a3;
    _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_DEFAULT, "%s Received Hearst event: %{public}ld", (uint8_t *)&v6, 0x16u);
  }
  self->_hearstRouteStatus = a3;
}

- (void)_forceUpdateCarPlayEndpointWithJarvisConnected:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    FigEndpointCopyActiveCarPlayEndpoint();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)*MEMORY[0x1E0D18F58];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT))
    {
      v7 = v6;
      objc_msgSend(v5, "timeIntervalSinceDate:", v4);
      *(_DWORD *)buf = 136315394;
      v10 = "-[CSBuiltInVoiceTrigger _forceUpdateCarPlayEndpointWithJarvisConnected:]";
      v11 = 2050;
      v12 = v8;
      _os_log_impl(&dword_1C2614000, v7, OS_LOG_TYPE_DEFAULT, "%s FigEndpointCopyActiveCarPlayEndpoint elapsed time = %{public}lf", buf, 0x16u);

    }
    self->_carPlayEndpoint = 0;

  }
  else
  {
    self->_carPlayEndpoint = 0;
  }
  self->_jarvisTriggerModeLogHeartbeat = 0;
}

- (int64_t)_currentJarvisTriggerMode
{
  uint64_t CMBaseObject;
  uint64_t (*v4)(uint64_t, _QWORD, _QWORD, CFTypeRef *);
  os_log_t *v5;
  int v6;
  NSObject *v7;
  NSObject *v9;
  CFTypeID v10;
  NSObject *v11;
  int v12;
  int jarvisTriggerModeLogHeartbeat;
  os_log_t v14;
  void *v15;
  NSObject *v16;
  void *v17;
  int valuePtr;
  CFTypeRef cf;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (self->_carPlayEndpoint)
  {
    cf = 0;
    CMBaseObject = FigEndpointGetCMBaseObject();
    v4 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 48);
    v5 = (os_log_t *)MEMORY[0x1E0D18F58];
    if (v4)
    {
      v6 = v4(CMBaseObject, *MEMORY[0x1E0CA4498], *MEMORY[0x1E0C9AE00], &cf);
      if (!v6)
      {
LABEL_11:
        valuePtr = -1;
        if (cf && (v10 = CFGetTypeID(cf), v10 == CFNumberGetTypeID()))
        {
          CFNumberGetValue((CFNumberRef)cf, kCFNumberIntType, &valuePtr);
        }
        else
        {
          v11 = *v5;
          if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315138;
            v21 = "-[CSBuiltInVoiceTrigger _currentJarvisTriggerMode]";
            _os_log_error_impl(&dword_1C2614000, v11, OS_LOG_TYPE_ERROR, "%s Failed to fetch trigger mode value", buf, 0xCu);
          }
        }
        if (cf)
          CFRelease(cf);
        v12 = valuePtr;
        if (!valuePtr || (valuePtr - 3) <= 0xFFFFFFFB)
        {
          v12 = -1;
          valuePtr = -1;
        }
        jarvisTriggerModeLogHeartbeat = self->_jarvisTriggerModeLogHeartbeat;
        if (!self->_jarvisTriggerModeLogHeartbeat)
        {
          v14 = *v5;
          if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
          {
            v15 = (void *)MEMORY[0x1E0D19130];
            v16 = v14;
            objc_msgSend(v15, "triggerModeStringDescription:", v12);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136315394;
            v21 = "-[CSBuiltInVoiceTrigger _currentJarvisTriggerMode]";
            v22 = 2112;
            v23 = v17;
            _os_log_impl(&dword_1C2614000, v16, OS_LOG_TYPE_DEFAULT, "%s CSJarvisTriggerMode : %@", buf, 0x16u);

            jarvisTriggerModeLogHeartbeat = self->_jarvisTriggerModeLogHeartbeat;
            v12 = valuePtr;
          }
          else
          {
            jarvisTriggerModeLogHeartbeat = 0;
          }
        }
        self->_jarvisTriggerModeLogHeartbeat = jarvisTriggerModeLogHeartbeat
                                             + 1
                                             - 20 * ((3277 * (jarvisTriggerModeLogHeartbeat + 1)) >> 16);
        return v12;
      }
    }
    else
    {
      v6 = -12782;
    }
    v9 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v21 = "-[CSBuiltInVoiceTrigger _currentJarvisTriggerMode]";
      v22 = 2050;
      v23 = (void *)v6;
      _os_log_error_impl(&dword_1C2614000, v9, OS_LOG_TYPE_ERROR, "%s failed to get endpoint value for Jarvis, error : %{public}ld", buf, 0x16u);
    }
    goto LABEL_11;
  }
  v7 = *MEMORY[0x1E0D18F58];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v21 = "-[CSBuiltInVoiceTrigger _currentJarvisTriggerMode]";
    _os_log_error_impl(&dword_1C2614000, v7, OS_LOG_TYPE_ERROR, "%s carPlayEndpoint is NULL", buf, 0xCu);
  }
  return -1;
}

- (void)CSPhoneCallStateMonitor:(id)a3 didRecievePhoneCallStateChange:(unint64_t)a4
{
  NSObject *queue;
  _QWORD v5[6];

  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __80__CSBuiltInVoiceTrigger_CSPhoneCallStateMonitor_didRecievePhoneCallStateChange___block_invoke;
  v5[3] = &unk_1E7C29178;
  v5[4] = self;
  v5[5] = a4;
  dispatch_async(queue, v5);
}

- (void)attSiriStateMonitor:(id)a3 didRecieveAttSiriStateChange:(unint64_t)a4
{
  NSObject *queue;
  _QWORD v5[6];

  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __74__CSBuiltInVoiceTrigger_attSiriStateMonitor_didRecieveAttSiriStateChange___block_invoke;
  v5[3] = &unk_1E7C29178;
  v5[4] = self;
  v5[5] = a4;
  dispatch_async(queue, v5);
}

- (void)didTransitFrom:(int64_t)a3 to:(int64_t)a4 by:(int64_t)a5
{
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *queue;
  _QWORD *v15;
  void *v16;
  _QWORD v17[5];
  _QWORD v18[5];
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v9 = (void *)*MEMORY[0x1E0D18F58];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT))
  {
    v10 = v9;
    -[CSBuiltInVoiceTrigger _stateName:](self, "_stateName:", a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSBuiltInVoiceTrigger _stateName:](self, "_stateName:", a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSBuiltInVoiceTrigger _eventName:](self, "_eventName:", a5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315906;
    v20 = "-[CSBuiltInVoiceTrigger didTransitFrom:to:by:]";
    v21 = 2114;
    v22 = v11;
    v23 = 2114;
    v24 = v12;
    v25 = 2114;
    v26 = v13;
    _os_log_impl(&dword_1C2614000, v10, OS_LOG_TYPE_DEFAULT, "%s from:%{public}@ to:%{public}@ by:%{public}@", buf, 0x2Au);

  }
  if (a3 == 3)
  {
    -[CSBuiltInVoiceTrigger _startAOPVoiceTrigger](self, "_startAOPVoiceTrigger");
    switch(a4)
    {
      case 0:
        goto LABEL_11;
      case 1:
        queue = self->_queue;
        v18[0] = MEMORY[0x1E0C809B0];
        v18[1] = 3221225472;
        v18[2] = __46__CSBuiltInVoiceTrigger_didTransitFrom_to_by___block_invoke;
        v18[3] = &unk_1E7C292C8;
        v18[4] = self;
        v15 = v18;
        goto LABEL_10;
      case 2:
        goto LABEL_9;
      case 3:
        goto LABEL_13;
      default:
        return;
    }
  }
  else if (a4)
  {
    if (a4 == 3)
    {
LABEL_13:
      -[CSBuiltInVoiceTrigger _stopAPVoiceTrigger](self, "_stopAPVoiceTrigger");
      -[CSBuiltInVoiceTrigger _stopAOPVoiceTrigger](self, "_stopAOPVoiceTrigger");
    }
    else if (a4 == 2)
    {
LABEL_9:
      queue = self->_queue;
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __46__CSBuiltInVoiceTrigger_didTransitFrom_to_by___block_invoke_2;
      v17[3] = &unk_1E7C292C8;
      v17[4] = self;
      v15 = v17;
LABEL_10:
      dispatch_async(queue, v15);
    }
  }
  else
  {
LABEL_11:
    objc_msgSend(MEMORY[0x1E0D19298], "sharedInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setFirstPassRunningMode:", 0);

    if (a3 != 3)
      -[CSBuiltInVoiceTrigger _stopAPVoiceTrigger](self, "_stopAPVoiceTrigger");
  }
}

- (void)didIgnoreEvent:(int64_t)a3 from:(int64_t)a4
{
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  const char *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v7 = (void *)*MEMORY[0x1E0D18F58];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT))
  {
    v8 = v7;
    -[CSBuiltInVoiceTrigger _eventName:](self, "_eventName:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSBuiltInVoiceTrigger _stateName:](self, "_stateName:", a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 136315650;
    v12 = "-[CSBuiltInVoiceTrigger didIgnoreEvent:from:]";
    v13 = 2114;
    v14 = v9;
    v15 = 2114;
    v16 = v10;
    _os_log_impl(&dword_1C2614000, v8, OS_LOG_TYPE_DEFAULT, "%s Ignore event(%{public}@) from(%{public}@) since we don't have transition", (uint8_t *)&v11, 0x20u);

  }
}

- (void)CSVoiceTriggerEnabledMonitor:(id)a3 didReceiveEnabled:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  id v8;

  v4 = a4;
  objc_msgSend(MEMORY[0x1E0D191C0], "sharedPowerLogger", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D19260], "getSiriLanguageWithFallback:", CFSTR("en-US"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSAsset configVersion](self->_currentAsset, "configVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "powerLogSiriConfigWithVoiceTriggerEnabled:withLanguage:withModelVersion:", v4, v6, v7);

}

- (id)_stateName:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  _QWORD v11[5];

  v11[4] = *MEMORY[0x1E0C80C00];
  v10[0] = &unk_1E7C63C08;
  v10[1] = &unk_1E7C63C20;
  v11[0] = CFSTR("FirstPassRunning");
  v11[1] = CFSTR("FirstPassRunningAOPOnly");
  v10[2] = &unk_1E7C63C38;
  v10[3] = &unk_1E7C63C50;
  v11[2] = CFSTR("FirstPassStateAOPtoAPTransition");
  v11[3] = CFSTR("FirstPassStateStop");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("unknown(%tu)"), a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (id)_eventName:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[5];
  _QWORD v11[6];

  v11[5] = *MEMORY[0x1E0C80C00];
  v10[0] = &unk_1E7C63C20;
  v10[1] = &unk_1E7C63C08;
  v11[0] = CFSTR("kCSFirstPassEventBargeInOn");
  v11[1] = CFSTR("kCSFirstPassEventBargeInOff");
  v10[2] = &unk_1E7C63C38;
  v10[3] = &unk_1E7C63C50;
  v11[2] = CFSTR("kCSFirstPassEventStartAPFailed");
  v11[3] = CFSTR("kCSFirstPassEventStartAPSucceed");
  v10[4] = &unk_1E7C63C68;
  v11[4] = CFSTR("kCSFirstPassEventStopped");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("unknown(%tu)"), a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (id)_firstPassVoiceTriggerSignalEstimate
{
  double v3;
  double v4;
  NSObject *v5;
  void *v6;
  double v7;
  NSObject *v8;
  _QWORD v10[5];
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  unint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (CSIsHorseman())
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __61__CSBuiltInVoiceTrigger__firstPassVoiceTriggerSignalEstimate__block_invoke;
    v10[3] = &unk_1E7C26E20;
    v10[4] = self;
    +[CSMyriadPHash signalEstimateWithBuilder:](CSMyriadPHash, "signalEstimateWithBuilder:", v10);
    v4 = v3;
    v5 = *MEMORY[0x1E0D18F58];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315395;
      v12 = "-[CSBuiltInVoiceTrigger _firstPassVoiceTriggerSignalEstimate]";
      v13 = 2049;
      v14 = *(_QWORD *)&v4;
      _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_INFO, "%s signal estimate: %{private}f", buf, 0x16u);
    }
    v6 = (void *)MEMORY[0x1E0CB37E8];
    v7 = v4;
  }
  else
  {
    v8 = *MEMORY[0x1E0D18F58];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315395;
      v12 = "-[CSBuiltInVoiceTrigger _firstPassVoiceTriggerSignalEstimate]";
      v13 = 2049;
      v14 = 0xBFF0000000000000;
      _os_log_impl(&dword_1C2614000, v8, OS_LOG_TYPE_INFO, "%s signal estimate: %{private}f", buf, 0x16u);
    }
    v6 = (void *)MEMORY[0x1E0CB37E8];
    v7 = -1.0;
  }
  objc_msgSend(v6, "numberWithDouble:", v7);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (CSVoiceTriggerDelegate)delegate
{
  return (CSVoiceTriggerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CSSecondPassProgressDelegate)secondPassProgressDelegate
{
  return (CSSecondPassProgressDelegate *)objc_loadWeakRetained((id *)&self->_secondPassProgressDelegate);
}

- (CSPolicy)voiceTriggerStartPolicy
{
  return self->_voiceTriggerStartPolicy;
}

- (void)setVoiceTriggerStartPolicy:(id)a3
{
  objc_storeStrong((id *)&self->_voiceTriggerStartPolicy, a3);
}

- (CSAudioStream)audioStream
{
  return self->_audioStream;
}

- (void)setAudioStream:(id)a3
{
  objc_storeStrong((id *)&self->_audioStream, a3);
}

- (BOOL)voiceTriggerEnabled
{
  return self->_voiceTriggerEnabled;
}

- (void)setVoiceTriggerEnabled:(BOOL)a3
{
  self->_voiceTriggerEnabled = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (CSAsset)currentAsset
{
  return self->_currentAsset;
}

- (void)setCurrentAsset:(id)a3
{
  objc_storeStrong((id *)&self->_currentAsset, a3);
}

- (NSMutableArray)keywordAnalyzersNDAPI
{
  return self->_keywordAnalyzersNDAPI;
}

- (void)setKeywordAnalyzersNDAPI:(id)a3
{
  objc_storeStrong((id *)&self->_keywordAnalyzersNDAPI, a3);
}

- (CSVoiceTriggerFirstPassConfig)firstPassConfig
{
  return self->_firstPassConfig;
}

- (void)setFirstPassConfig:(id)a3
{
  objc_storeStrong((id *)&self->_firstPassConfig, a3);
}

- (BOOL)hasTriggerPending
{
  return self->_hasTriggerPending;
}

- (void)setHasTriggerPending:(BOOL)a3
{
  self->_hasTriggerPending = a3;
}

- (float)bestScore
{
  return self->_bestScore;
}

- (void)setBestScore:(float)a3
{
  self->_bestScore = a3;
}

- (unint64_t)bestChannel
{
  return self->_bestChannel;
}

- (void)setBestChannel:(unint64_t)a3
{
  self->_bestChannel = a3;
}

- (CSKeywordAnalyzerNDAPIResult)onsetResult
{
  return self->_onsetResult;
}

- (void)setOnsetResult:(id)a3
{
  objc_storeStrong((id *)&self->_onsetResult, a3);
}

- (CSKeywordAnalyzerNDAPIResult)lastTriggeredOnsetResult
{
  return self->_lastTriggeredOnsetResult;
}

- (void)setLastTriggeredOnsetResult:(id)a3
{
  objc_storeStrong((id *)&self->_lastTriggeredOnsetResult, a3);
}

- (unint64_t)lastTriggeredBestChannel
{
  return self->_lastTriggeredBestChannel;
}

- (void)setLastTriggeredBestChannel:(unint64_t)a3
{
  self->_lastTriggeredBestChannel = a3;
}

- (unint64_t)onsetChannel
{
  return self->_onsetChannel;
}

- (void)setOnsetChannel:(unint64_t)a3
{
  self->_onsetChannel = a3;
}

- (unint64_t)channelSelectionDelay
{
  return self->_channelSelectionDelay;
}

- (void)setChannelSelectionDelay:(unint64_t)a3
{
  self->_channelSelectionDelay = a3;
}

- (unint64_t)delayInSamplesRequiredForChannelSelection
{
  return self->_delayInSamplesRequiredForChannelSelection;
}

- (void)setDelayInSamplesRequiredForChannelSelection:(unint64_t)a3
{
  self->_delayInSamplesRequiredForChannelSelection = a3;
}

- (NSDictionary)channelSelectionScores
{
  return self->_channelSelectionScores;
}

- (void)setChannelSelectionScores:(id)a3
{
  objc_storeStrong((id *)&self->_channelSelectionScores, a3);
}

- (unint64_t)processingChunkSamples
{
  return self->_processingChunkSamples;
}

- (void)setProcessingChunkSamples:(unint64_t)a3
{
  self->_processingChunkSamples = a3;
}

- (CSVoiceTriggerSecondPass)voiceTriggerSecondPass
{
  return self->_voiceTriggerSecondPass;
}

- (void)setVoiceTriggerSecondPass:(id)a3
{
  objc_storeStrong((id *)&self->_voiceTriggerSecondPass, a3);
}

- (BOOL)isSecondPassRunning
{
  return self->_isSecondPassRunning;
}

- (void)setIsSecondPassRunning:(BOOL)a3
{
  self->_isSecondPassRunning = a3;
}

- (BOOL)isSecondPassCancelled
{
  return self->_isSecondPassCancelled;
}

- (void)setIsSecondPassCancelled:(BOOL)a3
{
  self->_isSecondPassCancelled = a3;
}

- (BOOL)isSiriClientListening
{
  return self->_isSiriClientListening;
}

- (void)setIsSiriClientListening:(BOOL)a3
{
  self->_isSiriClientListening = a3;
}

- (BOOL)isListenPollingStarting
{
  return self->_isListenPollingStarting;
}

- (void)setIsListenPollingStarting:(BOOL)a3
{
  self->_isListenPollingStarting = a3;
}

- (CSAudioProvider)audioProvider
{
  return self->_audioProvider;
}

- (void)setAudioProvider:(id)a3
{
  objc_storeStrong((id *)&self->_audioProvider, a3);
}

- (NSMutableArray)audioStreamHoldings
{
  return self->_audioStreamHoldings;
}

- (void)setAudioStreamHoldings:(id)a3
{
  objc_storeStrong((id *)&self->_audioStreamHoldings, a3);
}

- (CSOSTransaction)secondPassTransaction
{
  return self->_secondPassTransaction;
}

- (void)setSecondPassTransaction:(id)a3
{
  objc_storeStrong((id *)&self->_secondPassTransaction, a3);
}

- (BOOL)isPhraseSpotterBypassed
{
  return self->_isPhraseSpotterBypassed;
}

- (void)setIsPhraseSpotterBypassed:(BOOL)a3
{
  self->_isPhraseSpotterBypassed = a3;
}

- (int64_t)hearstRouteStatus
{
  return self->_hearstRouteStatus;
}

- (void)setHearstRouteStatus:(int64_t)a3
{
  self->_hearstRouteStatus = a3;
}

- (CSPolicy)voiceTriggerAOPModeStartPolicy
{
  return self->_voiceTriggerAOPModeStartPolicy;
}

- (void)setVoiceTriggerAOPModeStartPolicy:(id)a3
{
  objc_storeStrong((id *)&self->_voiceTriggerAOPModeStartPolicy, a3);
}

- (CSStateMachine)stateMachine
{
  return self->_stateMachine;
}

- (void)setStateMachine:(id)a3
{
  objc_storeStrong((id *)&self->_stateMachine, a3);
}

- (CSVoiceTriggerAlwaysOnProcessor)alwaysOnProcessorController
{
  return self->_alwaysOnProcessorController;
}

- (void)setAlwaysOnProcessorController:(id)a3
{
  objc_storeStrong((id *)&self->_alwaysOnProcessorController, a3);
}

- (OS_dispatch_group)recordingWillStartGroup
{
  return self->_recordingWillStartGroup;
}

- (void)setRecordingWillStartGroup:(id)a3
{
  objc_storeStrong((id *)&self->_recordingWillStartGroup, a3);
}

- (unint64_t)currentSplitterState
{
  return self->_currentSplitterState;
}

- (void)setCurrentSplitterState:(unint64_t)a3
{
  self->_currentSplitterState = a3;
}

- (BOOL)shouldDisableOnSpeakerVerificationInSplitterMode
{
  return self->_shouldDisableOnSpeakerVerificationInSplitterMode;
}

- (void)setShouldDisableOnSpeakerVerificationInSplitterMode:(BOOL)a3
{
  self->_shouldDisableOnSpeakerVerificationInSplitterMode = a3;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (BOOL)firstTimeAssetConfigured
{
  return self->_firstTimeAssetConfigured;
}

- (void)setFirstTimeAssetConfigured:(BOOL)a3
{
  self->_firstTimeAssetConfigured = a3;
}

- (NSMutableArray)assetConfigWaitingBuffer
{
  return self->_assetConfigWaitingBuffer;
}

- (void)setAssetConfigWaitingBuffer:(id)a3
{
  objc_storeStrong((id *)&self->_assetConfigWaitingBuffer, a3);
}

- (OS_dispatch_source)validationTimer
{
  return self->_validationTimer;
}

- (void)setValidationTimer:(id)a3
{
  objc_storeStrong((id *)&self->_validationTimer, a3);
}

- (NSNumber)firstPassMyriadGoodness
{
  return self->_firstPassMyriadGoodness;
}

- (void)setFirstPassMyriadGoodness:(id)a3
{
  objc_storeStrong((id *)&self->_firstPassMyriadGoodness, a3);
}

- (unint64_t)phoneCallState
{
  return self->_phoneCallState;
}

- (void)setPhoneCallState:(unint64_t)a3
{
  self->_phoneCallState = a3;
}

- (unint64_t)attSiriState
{
  return self->_attSiriState;
}

- (void)setAttSiriState:(unint64_t)a3
{
  self->_attSiriState = a3;
}

- (BOOL)isJarvisConnected
{
  return self->_isJarvisConnected;
}

- (void)setIsJarvisConnected:(BOOL)a3
{
  self->_isJarvisConnected = a3;
}

- (CSVoiceTriggerSecondChanceContext)secondChanceContext
{
  return self->_secondChanceContext;
}

- (void)setSecondChanceContext:(id)a3
{
  objc_storeStrong((id *)&self->_secondChanceContext, a3);
}

- (CSAudioRouteChangeMonitor)audioRouteChangeMonitor
{
  return self->_audioRouteChangeMonitor;
}

- (void)setAudioRouteChangeMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_audioRouteChangeMonitor, a3);
}

- (CSSpeechManager)speechManager
{
  return self->_speechManager;
}

- (void)setSpeechManager:(id)a3
{
  objc_storeStrong((id *)&self->_speechManager, a3);
}

- (unint64_t)lastSelfTriggerDetectedStartMachTime
{
  return self->_lastSelfTriggerDetectedStartMachTime;
}

- (void)setLastSelfTriggerDetectedStartMachTime:(unint64_t)a3
{
  self->_lastSelfTriggerDetectedStartMachTime = a3;
}

- (unint64_t)heartbeatFactor
{
  return self->_heartbeatFactor;
}

- (void)setHeartbeatFactor:(unint64_t)a3
{
  self->_heartbeatFactor = a3;
}

- (CSStateCapture)stateCapture
{
  return self->_stateCapture;
}

- (void)setStateCapture:(id)a3
{
  objc_storeStrong((id *)&self->_stateCapture, a3);
}

- (unsigned)jarvisTriggerModeLogHeartbeat
{
  return self->_jarvisTriggerModeLogHeartbeat;
}

- (void)setJarvisTriggerModeLogHeartbeat:(unsigned __int8)a3
{
  self->_jarvisTriggerModeLogHeartbeat = a3;
}

- (BOOL)isFirstExclaveAudioBuffer
{
  return self->_isFirstExclaveAudioBuffer;
}

- (void)setIsFirstExclaveAudioBuffer:(BOOL)a3
{
  self->_isFirstExclaveAudioBuffer = a3;
}

- (OpaqueFigEndpoint)carPlayEndpoint
{
  return self->_carPlayEndpoint;
}

- (void)setCarPlayEndpoint:(OpaqueFigEndpoint *)a3
{
  self->_carPlayEndpoint = a3;
}

- (CSVoiceTriggerUserSelectedPhrase)multiPhraseSelectedStatus
{
  return self->_multiPhraseSelectedStatus;
}

- (void)setMultiPhraseSelectedStatus:(id)a3
{
  objc_storeStrong((id *)&self->_multiPhraseSelectedStatus, a3);
}

- (CSExclaveRecordClient)exclaveClient
{
  return self->_exclaveClient;
}

- (void)setExclaveClient:(id)a3
{
  objc_storeStrong((id *)&self->_exclaveClient, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exclaveClient, 0);
  objc_storeStrong((id *)&self->_multiPhraseSelectedStatus, 0);
  objc_storeStrong((id *)&self->_stateCapture, 0);
  objc_storeStrong((id *)&self->_speechManager, 0);
  objc_storeStrong((id *)&self->_audioRouteChangeMonitor, 0);
  objc_storeStrong((id *)&self->_secondChanceContext, 0);
  objc_storeStrong((id *)&self->_firstPassMyriadGoodness, 0);
  objc_storeStrong((id *)&self->_validationTimer, 0);
  objc_storeStrong((id *)&self->_assetConfigWaitingBuffer, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_recordingWillStartGroup, 0);
  objc_storeStrong((id *)&self->_alwaysOnProcessorController, 0);
  objc_storeStrong((id *)&self->_stateMachine, 0);
  objc_storeStrong((id *)&self->_voiceTriggerAOPModeStartPolicy, 0);
  objc_storeStrong((id *)&self->_secondPassTransaction, 0);
  objc_storeStrong((id *)&self->_audioStreamHoldings, 0);
  objc_storeStrong((id *)&self->_audioProvider, 0);
  objc_storeStrong((id *)&self->_voiceTriggerSecondPass, 0);
  objc_storeStrong((id *)&self->_channelSelectionScores, 0);
  objc_storeStrong((id *)&self->_lastTriggeredOnsetResult, 0);
  objc_storeStrong((id *)&self->_onsetResult, 0);
  objc_storeStrong((id *)&self->_firstPassConfig, 0);
  objc_storeStrong((id *)&self->_keywordAnalyzersNDAPI, 0);
  objc_storeStrong((id *)&self->_currentAsset, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_audioStream, 0);
  objc_storeStrong((id *)&self->_voiceTriggerStartPolicy, 0);
  objc_destroyWeak((id *)&self->_secondPassProgressDelegate);
  objc_destroyWeak((id *)&self->_delegate);
}

id __61__CSBuiltInVoiceTrigger__firstPassVoiceTriggerSignalEstimate__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  os_log_t *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  int v12;
  const char *v13;
  __int16 v14;
  _WORD v15[9];

  *(_QWORD *)&v15[5] = *MEMORY[0x1E0C80C00];
  v4 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "bestEnd");
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(_QWORD *)(v5 + 112);
  v7 = (os_log_t *)MEMORY[0x1E0D18F58];
  v8 = *MEMORY[0x1E0D18F58];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_INFO))
  {
    v12 = 136315651;
    v13 = "-[CSBuiltInVoiceTrigger _firstPassVoiceTriggerSignalEstimate]_block_invoke";
    v14 = 1025;
    *(_DWORD *)v15 = v4;
    v15[2] = 1025;
    *(_DWORD *)&v15[3] = v6;
    _os_log_impl(&dword_1C2614000, v8, OS_LOG_TYPE_INFO, "%s bestEnd = %{private}d, bestChannel = %{private}d", (uint8_t *)&v12, 0x18u);
    v5 = *(_QWORD *)(a1 + 32);
  }
  objc_msgSend(*(id *)(v5 + 168), "audioChunkFrom:to:channelIdx:", v4 - a2, v4, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *v7;
  if (os_log_type_enabled(*v7, OS_LOG_TYPE_INFO))
  {
    v12 = 136315395;
    v13 = "-[CSBuiltInVoiceTrigger _firstPassVoiceTriggerSignalEstimate]_block_invoke";
    v14 = 2113;
    *(_QWORD *)v15 = v9;
    _os_log_impl(&dword_1C2614000, v10, OS_LOG_TYPE_INFO, "%s audio chunk: %{private}@", (uint8_t *)&v12, 0x16u);
  }
  return v9;
}

uint64_t __46__CSBuiltInVoiceTrigger_didTransitFrom_to_by___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_startAPVoiceTriggerWithCompletion:", 0);
}

uint64_t __46__CSBuiltInVoiceTrigger_didTransitFrom_to_by___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_startAPVoiceTriggerWithCompletion:", 0);
}

void __74__CSBuiltInVoiceTrigger_attSiriStateMonitor_didRecieveAttSiriStateChange___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  const char *v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "setAttSiriState:", *(_QWORD *)(a1 + 40));
  v2 = *MEMORY[0x1E0D18F58];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 40);
    v4 = 136315394;
    v5 = "-[CSBuiltInVoiceTrigger attSiriStateMonitor:didRecieveAttSiriStateChange:]_block_invoke";
    v6 = 2048;
    v7 = v3;
    _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s Updated attSiri state to: %lu", (uint8_t *)&v4, 0x16u);
  }
}

uint64_t __80__CSBuiltInVoiceTrigger_CSPhoneCallStateMonitor_didRecievePhoneCallStateChange___block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  objc_msgSend(*(id *)(a1 + 32), "setPhoneCallState:", *(_QWORD *)(a1 + 40));
  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 200), "isEnabled");
  if ((result & 1) == 0)
  {
    v3 = *(_QWORD *)(a1 + 32);
    if (*(_BYTE *)(v3 + 8))
      return objc_msgSend(*(id *)(v3 + 168), "setAnnounceCallsEnabled:withStreamHandleID:", (unint64_t)(*(_QWORD *)(a1 + 40) - 2) < 3, 1);
  }
  return result;
}

void __83__CSBuiltInVoiceTrigger_CSAudioRouteChangeMonitor_didReceiveAudioRouteChangeEvent___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  int v8;
  const char *v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0D18F58];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 40);
    v8 = 136315394;
    v9 = "-[CSBuiltInVoiceTrigger CSAudioRouteChangeMonitor:didReceiveAudioRouteChangeEvent:]_block_invoke";
    v10 = 1026;
    v11 = v3;
    _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s Received audio route change monitor event : %{public}d", (uint8_t *)&v8, 0x12u);
  }
  switch(*(_QWORD *)(a1 + 40))
  {
    case 0:
      v4 = *(void **)(a1 + 32);
      v5 = 1;
      goto LABEL_9;
    case 1:
      v4 = *(void **)(a1 + 32);
      v5 = 0;
LABEL_9:
      objc_msgSend(v4, "_receivedJarvisConnectionEvent:", v5);
      return;
    case 2:
      v6 = *(void **)(a1 + 32);
      v7 = 1;
      goto LABEL_12;
    case 3:
      v6 = *(void **)(a1 + 32);
      v7 = 2;
      goto LABEL_12;
    case 4:
      v6 = *(void **)(a1 + 32);
      v7 = 3;
      goto LABEL_12;
    case 5:
      v6 = *(void **)(a1 + 32);
      v7 = 4;
      goto LABEL_12;
    case 6:
      v6 = *(void **)(a1 + 32);
      v7 = 5;
LABEL_12:
      objc_msgSend(v6, "_receivedHearstRoutedEvent:", v7);
      break;
    default:
      return;
  }
}

uint64_t __137__CSBuiltInVoiceTrigger_CSBluetoothWirelessSplitterMonitor_didReceiveSplitterStateChange_shouldDisableSpeakerVerificationInSplitterMode___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateCurrentSplitterState:shouldDisableSpeakerVerificationInSplitterMode:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
}

uint64_t __78__CSBuiltInVoiceTrigger_pendingSecondPassTriggerWasClearedForClient_deviceId___block_invoke(uint64_t result)
{
  if (*(_QWORD *)(result + 48) == 1 && !*(_QWORD *)(result + 32))
    return objc_msgSend(*(id *)(result + 40), "_cancelLastAudioStreamHold");
  return result;
}

void __48__CSBuiltInVoiceTrigger_cancelSecondPassRunning__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0D18F58];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[CSBuiltInVoiceTrigger cancelSecondPassRunning]_block_invoke";
    _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s Requested cancelling 2nd pass", (uint8_t *)&v4, 0xCu);
  }
  if (CSIsHorseman())
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 11) = 1;
  objc_msgSend(*(id *)(a1 + 32), "_reset");
  objc_msgSend(*(id *)(a1 + 32), "voiceTriggerSecondPass");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancelCurrentRequest");

}

void __77__CSBuiltInVoiceTrigger_activationEventNotificationHandler_event_completion___block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(void);
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD v27[5];

  v2 = objc_msgSend(*(id *)(a1 + 32), "_isBuiltInAOPVoiceTriggerEvent:", *(_QWORD *)(a1 + 40));
  v3 = *(void **)(a1 + 32);
  if (!v2)
  {
    if (!objc_msgSend(v3, "_isVoiceTriggerStateTransitionEvent:", *(_QWORD *)(a1 + 40)))
      return;
    objc_msgSend(*(id *)(a1 + 40), "activationInfo");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("VoiceTriggerEnabledKey"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "BOOLValue");

    objc_msgSend(*(id *)(a1 + 32), "_transitVoiceTriggerStatus:force:", v16, 0);
    v17 = *(_QWORD *)(a1 + 48);
    if (!v17)
      return;
    v18 = *(void (**)(void))(v17 + 16);
LABEL_13:
    v18();
    return;
  }
  if (!objc_msgSend(v3, "_shouldHandleAOPVoiceTrigger"))
  {
    v19 = *(_QWORD *)(a1 + 48);
    if (!v19)
      return;
    v18 = *(void (**)(void))(v19 + 16);
    goto LABEL_13;
  }
  if (objc_msgSend(MEMORY[0x1E0D19260], "isExclaveHardware"))
    v4 = 12;
  else
    v4 = 2;
  objc_msgSend(*(id *)(a1 + 32), "_createSecondPassIfNeededWithFirstPassSource:", v4);
  v5 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0D19008], "contextForBuiltInVoiceTrigger");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __77__CSBuiltInVoiceTrigger_activationEventNotificationHandler_event_completion___block_invoke_2;
  v27[3] = &unk_1E7C29060;
  v27[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v5, "_requestStartAudioStreamWithSource:context:completion:", v4, v6, v27);

  v8 = objc_msgSend(MEMORY[0x1E0D19260], "isExclaveHardware");
  v9 = *(void **)(a1 + 32);
  if (v8)
  {
    objc_msgSend(*(id *)(a1 + 32), "exclaveClient");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v7;
    v23[1] = 3221225472;
    v23[2] = __77__CSBuiltInVoiceTrigger_activationEventNotificationHandler_event_completion___block_invoke_124;
    v23[3] = &unk_1E7C26F08;
    v11 = *(id *)(a1 + 40);
    v12 = *(_QWORD *)(a1 + 32);
    v24 = v11;
    v25 = v12;
    v26 = v4;
    objc_msgSend(v10, "fetchAOPVoiceTriggerResult:", v23);

    v13 = v24;
  }
  else
  {
    v20 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "audioProvider");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "UUID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "activationInfo");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_handleVoiceTriggerSecondPassWithSource:deviceId:event:audioProviderUUID:firstPassInfo:", v4, 0, v20, v21, v22);

  }
}

void __77__CSBuiltInVoiceTrigger_activationEventNotificationHandler_event_completion___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a2)
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(NSObject **)(v6 + 56);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __77__CSBuiltInVoiceTrigger_activationEventNotificationHandler_event_completion___block_invoke_3;
    block[3] = &unk_1E7C292C8;
    block[4] = v6;
    dispatch_async(v7, block);
  }
  else
  {
    v8 = (void *)*MEMORY[0x1E0D18F58];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_ERROR))
    {
      v9 = v8;
      objc_msgSend(v5, "localizedDescription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v13 = "-[CSBuiltInVoiceTrigger activationEventNotificationHandler:event:completion:]_block_invoke_2";
      v14 = 2114;
      v15 = v10;
      _os_log_error_impl(&dword_1C2614000, v9, OS_LOG_TYPE_ERROR, "%s Failed to start audio stream error : %{public}@", buf, 0x16u);

    }
  }

}

void __77__CSBuiltInVoiceTrigger_activationEventNotificationHandler_event_completion___block_invoke_124(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  const char *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "activationInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  if (a2)
  {
    v6 = *MEMORY[0x1E0D18F58];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT))
    {
      v13 = 136315394;
      v14 = "-[CSBuiltInVoiceTrigger activationEventNotificationHandler:event:completion:]_block_invoke";
      v15 = 2050;
      v16 = a2;
      _os_log_impl(&dword_1C2614000, v6, OS_LOG_TYPE_DEFAULT, "%s trigger-length : %{public}llu", (uint8_t *)&v13, 0x16u);
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v7, CFSTR("trigger-length"));

  }
  v9 = *(void **)(a1 + 40);
  v8 = *(_QWORD *)(a1 + 48);
  v10 = *(_QWORD *)(a1 + 32);
  objc_msgSend(v9, "audioProvider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "UUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_handleVoiceTriggerSecondPassWithSource:deviceId:event:audioProviderUUID:firstPassInfo:", v8, 0, v10, v12, v5);

}

uint64_t __77__CSBuiltInVoiceTrigger_activationEventNotificationHandler_event_completion___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_addAudioStreamHold:", CFSTR("AOPVoiceTrigger"));
}

uint64_t __75__CSBuiltInVoiceTrigger_CSVoiceTriggerXPCServiceProxy_bypassPhraseSpotter___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 14) = *(_BYTE *)(result + 40);
  return result;
}

uint64_t __74__CSBuiltInVoiceTrigger_CSAudioServerCrashMonitorDidReceiveServerRestart___block_invoke(uint64_t a1)
{
  uint64_t result;

  if (objc_msgSend(*(id *)(a1 + 32), "_shouldEnableAOPVoiceTrigger"))
    objc_msgSend(*(id *)(a1 + 32), "_startAOPVoiceTrigger");
  result = objc_msgSend(*(id *)(a1 + 32), "_shouldEnableAPVoiceTrigger");
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 32), "_startAPVoiceTriggerWithCompletion:", 0);
  return result;
}

void __72__CSBuiltInVoiceTrigger_CSAudioServerCrashMonitorDidReceiveServerCrash___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_reset");
  if (objc_msgSend(*(id *)(a1 + 32), "isSecondPassRunning"))
  {
    objc_msgSend(*(id *)(a1 + 32), "voiceTriggerSecondPass");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "cancelCurrentRequest");

  }
}

void __66__CSBuiltInVoiceTrigger_selfTriggerDetector_didDetectSelfTrigger___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "_reset");
  if (objc_msgSend(*(id *)(a1 + 32), "isSecondPassRunning"))
  {
    objc_msgSend(*(id *)(a1 + 32), "voiceTriggerSecondPass");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "cancelCurrentRequest");

  }
  v3 = *(void **)(a1 + 40);
  if (v3)
  {
    v4 = *MEMORY[0x1E0D19780];
    objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D19780]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v6 = *(void **)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v4);
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setLastSelfTriggerDetectedStartMachTime:", objc_msgSend(v7, "unsignedLongLongValue"));

    }
  }
}

void __73__CSBuiltInVoiceTrigger_siriClientBehaviorMonitor_willStopStream_reason___block_invoke(uint64_t a1)
{
  NSObject *v2;
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0D18F58];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT))
  {
    v3 = 136315138;
    v4 = "-[CSBuiltInVoiceTrigger siriClientBehaviorMonitor:willStopStream:reason:]_block_invoke";
    _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s Siri Client will stop listening, resume VoiceTrigger listen", (uint8_t *)&v3, 0xCu);
  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 12) = 0;
}

uint64_t __79__CSBuiltInVoiceTrigger_siriClientBehaviorMonitor_didStopStream_withEventUUID___block_invoke(uint64_t a1)
{
  NSObject *v2;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0D18F58];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[CSBuiltInVoiceTrigger siriClientBehaviorMonitor:didStopStream:withEventUUID:]_block_invoke";
    _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s Siri Client stops listening now, VoiceTrigger can listen now", (uint8_t *)&v4, 0xCu);
  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 12) = 0;
  return objc_msgSend(*(id *)(a1 + 32), "_reset");
}

uint64_t __111__CSBuiltInVoiceTrigger_siriClientBehaviorMonitor_didStartStreamWithContext_successfully_option_withEventUUID___block_invoke(uint64_t a1)
{
  NSObject *v2;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0D18F58];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[CSBuiltInVoiceTrigger siriClientBehaviorMonitor:didStartStreamWithContext:successfully:option:withEventUUID:]_block_invoke";
    _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s Siri Client starts listening now, VoiceTrigger shouldn't listen now", (uint8_t *)&v4, 0xCu);
  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 12) = 1;
  return objc_msgSend(*(id *)(a1 + 32), "_cancelAllAudioStreamHold");
}

uint64_t __64__CSBuiltInVoiceTrigger__handleSecondPassResult_deviceId_error___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_setIsSecondPassRunning:", 0);
  result = objc_msgSend(*(id *)(a1 + 32), "_reset");
  if (*(_QWORD *)(a1 + 40) != 1)
    return objc_msgSend(*(id *)(a1 + 32), "_cancelLastAudioStreamHold");
  return result;
}

void __112__CSBuiltInVoiceTrigger__handleVoiceTriggerSecondPassWithSource_deviceId_event_audioProviderUUID_firstPassInfo___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  BOOL v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  __CFString *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  int v21;
  CSVoiceTriggerSecondPassResultHolder *v22;
  void *v23;
  uint64_t v24;
  id WeakRetained;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  NSObject *v30;
  void *v31;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 64);
  v8 = v7 == 12 || v7 == 2;
  if (v8 && (v9 = *(void **)(a1 + 32)) != 0)
  {
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("trigger-woke-ap"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("trigger-woke-ap"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(v11, "BOOLValue");

      if (objc_msgSend(v5, "result") != 1)
      {
        objc_msgSend(v5, "voiceTriggerEventInfo");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v12;
        if (v12
          && (v14 = *MEMORY[0x1E0D19588],
              objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0D19588]),
              v15 = (void *)objc_claimAutoreleasedReturnValue(),
              v15,
              v15))
        {
          objc_msgSend(v13, "objectForKeyedSubscript:", v14);
          v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v16 = CFSTR("unknown");
        }
        objc_msgSend(MEMORY[0x1E0D192A8], "sharedAggregator");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "logFalseWakeUp:withPhrase:", v10, v16);

      }
    }
  }
  else
  {
    v10 = 0;
  }
  v17 = (void *)*MEMORY[0x1E0D18F58];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT))
  {
    v18 = v17;
    objc_msgSend(v5, "description");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v34 = "-[CSBuiltInVoiceTrigger _handleVoiceTriggerSecondPassWithSource:deviceId:event:audioProviderUUID:firstPassInfo:]_block_invoke";
    v35 = 2112;
    v36 = v19;
    _os_log_impl(&dword_1C2614000, v18, OS_LOG_TYPE_DEFAULT, "%s %@", buf, 0x16u);

  }
  if (CSIsInternalBuild())
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("bypassVoiceTrigger"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "BOOLValue");

    if (v21)
    {
      v22 = [CSVoiceTriggerSecondPassResultHolder alloc];
      objc_msgSend(v5, "voiceTriggerEventInfo");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = -[CSVoiceTriggerSecondPassResultHolder initWithResult:voiceTriggerEventInfo:isSecondChanceCandidate:](v22, "initWithResult:voiceTriggerEventInfo:isSecondChanceCandidate:", 1, v23, 0);

      v5 = (id)v24;
    }
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "_handleSecondPassResult:deviceId:error:", v5, *(_QWORD *)(a1 + 40), v6);

  objc_msgSend(MEMORY[0x1E0D192A8], "sharedAggregator");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v5, "result");
  objc_msgSend(v5, "voiceTriggerEventInfo");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "logSecondPassResult:eventInfo:triggerAPWakeUp:", v27, v28, v10);

  v29 = *(_QWORD *)(a1 + 48);
  v30 = *(NSObject **)(v29 + 56);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __112__CSBuiltInVoiceTrigger__handleVoiceTriggerSecondPassWithSource_deviceId_event_audioProviderUUID_firstPassInfo___block_invoke_108;
  block[3] = &unk_1E7C292C8;
  block[4] = v29;
  dispatch_async(v30, block);

}

uint64_t __112__CSBuiltInVoiceTrigger__handleVoiceTriggerSecondPassWithSource_deviceId_event_audioProviderUUID_firstPassInfo___block_invoke_108(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_teardownSecondPassIfNeeded");
}

uint64_t __66__CSBuiltInVoiceTrigger_audioStreamProvider_audioBufferAvailable___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 16))
  {
    if (objc_msgSend(*(id *)(v2 + 248), "count"))
    {
      v11 = 0u;
      v12 = 0u;
      v9 = 0u;
      v10 = 0u;
      v3 = *(id *)(*(_QWORD *)(a1 + 32) + 248);
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v4)
      {
        v5 = v4;
        v6 = *(_QWORD *)v10;
        do
        {
          v7 = 0;
          do
          {
            if (*(_QWORD *)v10 != v6)
              objc_enumerationMutation(v3);
            objc_msgSend(*(id *)(a1 + 32), "_handleAudioChunk:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v7++), (_QWORD)v9);
          }
          while (v5 != v7);
          v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
        }
        while (v5);
      }

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 248), "removeAllObjects");
    }
    return objc_msgSend(*(id *)(a1 + 32), "_handleAudioChunk:", *(_QWORD *)(a1 + 40), (_QWORD)v9);
  }
  else
  {
    result = CSIsHorseman();
    if ((result & 1) == 0)
      return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 248), "addObject:", *(_QWORD *)(a1 + 40));
  }
  return result;
}

void __133__CSBuiltInVoiceTrigger_audioStreamProvider_numSamplesAvailableInExclave_hostTime_arrivalHostTimeToAudioRecorder_exclaveSampleCount___block_invoke(uint64_t a1)
{
  int v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[6];
  uint8_t buf[4];
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 32), "_shouldSkipAudioChunkHandling");
  v3 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    objc_msgSend((id)v3, "_resetFirstExclaveAudioBufferMarkerIfNeeded");
  }
  else
  {
    if (*(_BYTE *)(v3 + 19))
    {
      objc_msgSend((id)v3, "setIsFirstExclaveAudioBuffer:", 0);
      v3 = *(_QWORD *)(a1 + 32);
      v4 = *(void **)(v3 + 352);
      if (v4)
      {
        v5 = *MEMORY[0x1E0D18F58];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          v10 = "-[CSBuiltInVoiceTrigger audioStreamProvider:numSamplesAvailableInExclave:hostTime:arrivalHostTimeToAudio"
                "Recorder:exclaveSampleCount:]_block_invoke";
          _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_DEFAULT, "%s Reset first-pass VoiceTrigger in Exclave", buf, 0xCu);
          v4 = *(void **)(*(_QWORD *)(a1 + 32) + 352);
        }
        objc_msgSend(v4, "resetFirstPassVoiceTrigger");
        v3 = *(_QWORD *)(a1 + 32);
      }
    }
    objc_msgSend((id)v3, "exclaveClient");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __133__CSBuiltInVoiceTrigger_audioStreamProvider_numSamplesAvailableInExclave_hostTime_arrivalHostTimeToAudioRecorder_exclaveSampleCount___block_invoke_91;
    v8[3] = &unk_1E7C26EB8;
    v7 = *(_QWORD *)(a1 + 40);
    v8[4] = *(_QWORD *)(a1 + 32);
    v8[5] = v7;
    objc_msgSend(v6, "processBargeInVoiceTriggerWithResult:", v8);

  }
}

void __133__CSBuiltInVoiceTrigger_audioStreamProvider_numSamplesAvailableInExclave_hostTime_arrivalHostTimeToAudioRecorder_exclaveSampleCount___block_invoke_91(uint64_t a1, int a2, uint64_t a3)
{
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  _QWORD v21[10];
  _QWORD v22[10];
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    v5 = *MEMORY[0x1E0D18F58];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 136315394;
      v24 = "-[CSBuiltInVoiceTrigger audioStreamProvider:numSamplesAvailableInExclave:hostTime:arrivalHostTimeToAudioReco"
            "rder:exclaveSampleCount:]_block_invoke";
      v25 = 2048;
      v26 = v6;
      _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_DEFAULT, "%s FirstPass detected VoiceTrigger at exclaveSampleCount = %llu", buf, 0x16u);
    }
    v7 = *MEMORY[0x1E0D19650];
    v21[0] = *MEMORY[0x1E0D19618];
    v22[0] = &unk_1E7C63BF0;
    v22[1] = &unk_1E7C64410;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a3, v21[0], v7, *MEMORY[0x1E0D19658]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v22[2] = v8;
    v21[3] = *MEMORY[0x1E0D19620];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 40));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v22[3] = v9;
    v21[4] = *MEMORY[0x1E0D19628];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 40));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v22[4] = v10;
    v21[5] = *MEMORY[0x1E0D19610];
    objc_msgSend(*(id *)(a1 + 32), "channelSelectionScores");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v22[5] = v11;
    v21[6] = *MEMORY[0x1E0D19608];
    v12 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(*(id *)(a1 + 32), "firstPassConfig");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "delaySecondsForChannelSelection");
    objc_msgSend(v12, "numberWithFloat:");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v22[6] = v14;
    v21[7] = *MEMORY[0x1E0D19630];
    v15 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(*(id *)(a1 + 32), "firstPassConfig");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "masterChannelScoreBoost");
    objc_msgSend(v15, "numberWithFloat:");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = *MEMORY[0x1E0D19638];
    v22[7] = v17;
    v22[8] = &unk_1E7C63BF0;
    v19 = *MEMORY[0x1E0D19640];
    v21[8] = v18;
    v21[9] = v19;
    v22[9] = &unk_1E7C64410;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 10);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "_reportVoiceTriggerFirstPassFireFromAPWithSource:voiceTriggerFirstPassInfo:", 11, v20);
  }
}

uint64_t __71__CSBuiltInVoiceTrigger_audioStreamProvider_didStopStreamUnexpectedly___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_reset");
  if (*(_QWORD *)(a1 + 40) != -11785)
  {
    result = objc_msgSend(*(id *)(a1 + 32), "_shouldEnableAPVoiceTrigger");
    if ((_DWORD)result)
      return objc_msgSend(*(id *)(a1 + 32), "_startAPVoiceTriggerWithCompletion:", 0);
  }
  return result;
}

void __44__CSBuiltInVoiceTrigger__stopAPVoiceTrigger__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  _QWORD v4[5];
  uint8_t buf[4];
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0D18F58];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v6 = "-[CSBuiltInVoiceTrigger _stopAPVoiceTrigger]_block_invoke";
    _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s Scheduled stopAudioStream after waiting for recordingWillStartGroup", buf, 0xCu);
  }
  objc_msgSend(*(id *)(a1 + 32), "audioStream");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __44__CSBuiltInVoiceTrigger__stopAPVoiceTrigger__block_invoke_90;
  v4[3] = &unk_1E7C29060;
  v4[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v3, "stopAudioStreamWithOption:completion:", 0, v4);

}

void __44__CSBuiltInVoiceTrigger__stopAPVoiceTrigger__block_invoke_90(uint64_t a1, char a2, void *a3)
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(NSObject **)(v6 + 56);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__CSBuiltInVoiceTrigger__stopAPVoiceTrigger__block_invoke_2;
  block[3] = &unk_1E7C292C8;
  block[4] = v6;
  dispatch_async(v7, block);
  if ((a2 & 1) == 0)
  {
    v8 = (void *)*MEMORY[0x1E0D18F58];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_ERROR))
    {
      v9 = v8;
      objc_msgSend(v5, "localizedDescription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v13 = "-[CSBuiltInVoiceTrigger _stopAPVoiceTrigger]_block_invoke";
      v14 = 2114;
      v15 = v10;
      _os_log_error_impl(&dword_1C2614000, v9, OS_LOG_TYPE_ERROR, "%s Failed to stop audio stream : %{public}@", buf, 0x16u);

    }
  }

}

uint64_t __44__CSBuiltInVoiceTrigger__stopAPVoiceTrigger__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_teardownSecondPassIfNeeded");
}

void __46__CSBuiltInVoiceTrigger__startAOPVoiceTrigger__block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  id v3;
  _QWORD block[4];
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "queue");
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__CSBuiltInVoiceTrigger__startAOPVoiceTrigger__block_invoke_2;
  block[3] = &unk_1E7C292C8;
  v5 = WeakRetained;
  v3 = WeakRetained;
  dispatch_async(v2, block);

}

void __46__CSBuiltInVoiceTrigger__startAOPVoiceTrigger__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "exclaveClient");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "configAOPVoiceTrigger");

  objc_msgSend(*(id *)(a1 + 32), "alwaysOnProcessorController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "currentAsset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "enableVoiceTriggerOnAlwaysOnProcessorWithAsset:completion:", v3, 0);

}

void __52__CSBuiltInVoiceTrigger__APModeValidationTimerFired__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  int v3;
  void *v4;
  int v5;
  uint64_t v6;
  NSObject *v7;
  _QWORD *v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  int v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "voiceTriggerAOPModeStartPolicy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEnabled");

  objc_msgSend(WeakRetained, "voiceTriggerStartPolicy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEnabled");

  v6 = objc_msgSend(WeakRetained, "_currentState");
  v7 = *MEMORY[0x1E0D18F58];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT))
  {
    v10 = 136315906;
    v11 = "-[CSBuiltInVoiceTrigger _APModeValidationTimerFired]_block_invoke";
    v12 = 1024;
    v13 = v5;
    v14 = 1024;
    v15 = v3;
    v16 = 1024;
    v17 = v6;
    _os_log_impl(&dword_1C2614000, v7, OS_LOG_TYPE_DEFAULT, "%s APModeValidationTimer fired : VoiceTriggerEnabled(%d), shouldBeAOPMode(%d), currentState(%d)", (uint8_t *)&v10, 0x1Eu);
  }
  if (v5)
  {
    if (v3)
    {
      if (v6)
      {
        objc_msgSend(WeakRetained, "_notifyEvent:", 1);
        v8 = (_QWORD *)MEMORY[0x1E0D193A8];
LABEL_9:
        objc_msgSend(MEMORY[0x1E0D190B8], "sharedInstance");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "submitVoiceTriggerIssueReport:", *v8);

      }
    }
    else if (v6 == 2)
    {
      v8 = (_QWORD *)MEMORY[0x1E0D193B0];
      goto LABEL_9;
    }
  }

}

void __60__CSBuiltInVoiceTrigger__startAPVoiceTriggerWithCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_APModeValidationTimerFired");

}

void __58__CSBuiltInVoiceTrigger__startVoiceTriggerWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((a2 & 1) == 0)
  {
    v6 = (void *)*MEMORY[0x1E0D18F58];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_ERROR))
    {
      v8 = v6;
      objc_msgSend(v5, "localizedDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 136315394;
      v11 = "-[CSBuiltInVoiceTrigger _startVoiceTriggerWithCompletion:]_block_invoke";
      v12 = 2114;
      v13 = v9;
      _os_log_error_impl(&dword_1C2614000, v8, OS_LOG_TYPE_ERROR, "%s Cannot startListenPolling : %{public}@", (uint8_t *)&v10, 0x16u);

    }
  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 13) = 0;
  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
    (*(void (**)(uint64_t, uint64_t))(v7 + 16))(v7, a2);

}

void __39__CSBuiltInVoiceTrigger__stopListening__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0D18F58];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[CSBuiltInVoiceTrigger _stopListening]_block_invoke";
    _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s Scheduled stopAudioStream after waiting for recordingWillStartGroup", (uint8_t *)&v4, 0xCu);
  }
  objc_msgSend(*(id *)(a1 + 32), "audioStream");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stopAudioStreamWithOption:completion:", 0, &__block_literal_global_85);

}

void __39__CSBuiltInVoiceTrigger__stopListening__block_invoke_84(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3)
  {
    v4 = (void *)*MEMORY[0x1E0D18F58];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_ERROR))
    {
      v5 = v4;
      objc_msgSend(v3, "localizedDescription");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 136315394;
      v8 = "-[CSBuiltInVoiceTrigger _stopListening]_block_invoke";
      v9 = 2114;
      v10 = v6;
      _os_log_error_impl(&dword_1C2614000, v5, OS_LOG_TYPE_ERROR, "%s Cannot stop listening : %{public}@", (uint8_t *)&v7, 0x16u);

    }
  }

}

uint64_t __79__CSBuiltInVoiceTrigger__requestStartAudioStreamWithSource_context_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __52__CSBuiltInVoiceTrigger__startListenWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __52__CSBuiltInVoiceTrigger__startListenWithCompletion___block_invoke_2(uint64_t a1, int a2)
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[4];
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    objc_msgSend(MEMORY[0x1E0D19030], "noAlertOption");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_reset");
    objc_msgSend(*(id *)(a1 + 32), "audioStream");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      v5 = *MEMORY[0x1E0D18F58];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v13 = "-[CSBuiltInVoiceTrigger _startListenWithCompletion:]_block_invoke_2";
        _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_DEFAULT, "%s Entering recordWillStartGroup", buf, 0xCu);
      }
      dispatch_group_enter(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 224));
      objc_msgSend(*(id *)(a1 + 32), "audioStream");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __52__CSBuiltInVoiceTrigger__startListenWithCompletion___block_invoke_79;
      v10[3] = &unk_1E7C29128;
      v7 = *(void **)(a1 + 40);
      v10[4] = *(_QWORD *)(a1 + 32);
      v11 = v7;
      objc_msgSend(v6, "startAudioStreamWithOption:completion:", v3, v10);

    }
    else
    {
      v8 = *(_QWORD *)(a1 + 40);
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18E80], 960, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v8 + 16))(v8, 0, v9);

    }
  }
  else
  {
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0);
  }
}

void __52__CSBuiltInVoiceTrigger__startListenWithCompletion___block_invoke_79(uint64_t a1, char a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;
  char v13;

  v5 = a3;
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(a1 + 40);
  v8 = *(NSObject **)(v6 + 56);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __52__CSBuiltInVoiceTrigger__startListenWithCompletion___block_invoke_2_80;
  v10[3] = &unk_1E7C29100;
  v10[4] = v6;
  v13 = a2;
  v11 = v5;
  v12 = v7;
  v9 = v5;
  dispatch_async(v8, v10);

}

uint64_t __52__CSBuiltInVoiceTrigger__startListenWithCompletion___block_invoke_2_80(uint64_t a1)
{
  os_log_t *v2;
  NSObject *v3;
  _BYTE *v4;
  void *v5;
  NSObject *v6;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = (os_log_t *)MEMORY[0x1E0D18F58];
  v3 = *MEMORY[0x1E0D18F58];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315138;
    v9 = "-[CSBuiltInVoiceTrigger _startListenWithCompletion:]_block_invoke_2";
    _os_log_impl(&dword_1C2614000, v3, OS_LOG_TYPE_DEFAULT, "%s Leaving recordWillStartGroup", (uint8_t *)&v8, 0xCu);
  }
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 224));
  if (*(_BYTE *)(a1 + 56))
  {
    v4 = *(_BYTE **)(a1 + 32);
    if (v4[8])
    {
      objc_msgSend(MEMORY[0x1E0D19298], "sharedInstance");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setFirstPassRunningMode:", 1);

      objc_msgSend(*(id *)(a1 + 32), "_notifyEvent:", 3);
    }
    else
    {
      v6 = *v2;
      if (os_log_type_enabled(*v2, OS_LOG_TYPE_ERROR))
      {
        v8 = 136315138;
        v9 = "-[CSBuiltInVoiceTrigger _startListenWithCompletion:]_block_invoke";
        _os_log_error_impl(&dword_1C2614000, v6, OS_LOG_TYPE_ERROR, "%s didStartRecording received when VoiceTrigger is turned-off", (uint8_t *)&v8, 0xCu);
        v4 = *(_BYTE **)(a1 + 32);
      }
      objc_msgSend(v4, "_stopAPVoiceTrigger");
    }
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __68__CSBuiltInVoiceTrigger__startListenPollingWithInterval_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  dispatch_time_t v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  _QWORD block[4];
  id v13;
  id v14[2];
  _BYTE location[12];
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((a2 & 1) != 0)
  {
    v6 = *(_QWORD *)(a1 + 40);
    if (v6)
      (*(void (**)(uint64_t, uint64_t, _QWORD))(v6 + 16))(v6, 1, 0);
  }
  else
  {
    v7 = (void *)*MEMORY[0x1E0D18F58];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_ERROR))
    {
      v10 = v7;
      objc_msgSend(v5, "localizedDescription");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)location = 136315394;
      *(_QWORD *)&location[4] = "-[CSBuiltInVoiceTrigger _startListenPollingWithInterval:completion:]_block_invoke";
      v16 = 2114;
      v17 = v11;
      _os_log_error_impl(&dword_1C2614000, v10, OS_LOG_TYPE_ERROR, "%s listen polling has failed : %{public}@", location, 0x16u);

    }
    objc_initWeak((id *)location, *(id *)(a1 + 32));
    v8 = dispatch_time(0, (uint64_t)(*(double *)(a1 + 48) * 1000000000.0));
    v9 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 56);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __68__CSBuiltInVoiceTrigger__startListenPollingWithInterval_completion___block_invoke_74;
    block[3] = &unk_1E7C29088;
    objc_copyWeak(v14, (id *)location);
    v14[1] = *(id *)(a1 + 48);
    v13 = *(id *)(a1 + 40);
    dispatch_after(v8, v9, block);

    objc_destroyWeak(v14);
    objc_destroyWeak((id *)location);
  }

}

void __68__CSBuiltInVoiceTrigger__startListenPollingWithInterval_completion___block_invoke_74(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_startListenPollingWithInterval:completion:", *(_QWORD *)(a1 + 32), *(double *)(a1 + 48));

}

uint64_t __53__CSBuiltInVoiceTrigger__transitAOPModeIfNeededSync___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_transitAOPModeIfNeeded:", *(unsigned __int8 *)(a1 + 40));
}

uint64_t __54__CSBuiltInVoiceTrigger__transitAOPModeIfNeededAsync___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_transitAOPModeIfNeeded:", *(unsigned __int8 *)(a1 + 40));
}

void __58__CSBuiltInVoiceTrigger__transitVoiceTriggerStatus_force___block_invoke(uint64_t a1)
{
  os_log_t *v2;
  void *v3;
  const __CFString *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  int v9;
  NSObject *v10;
  const __CFString *v11;
  int v12;
  void *v13;
  void *v14;
  id *v15;
  int v16;
  uint64_t v17;
  int v18;
  const char *v19;
  __int16 v20;
  const __CFString *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v2 = (os_log_t *)MEMORY[0x1E0D18F58];
  v3 = (void *)*MEMORY[0x1E0D18F58];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT))
  {
    if (*(_BYTE *)(a1 + 40))
      v4 = CFSTR("en");
    else
      v4 = CFSTR("dis");
    v5 = *(void **)(a1 + 32);
    v6 = v3;
    objc_msgSend(v5, "_stateName:", objc_msgSend(v5, "_currentState"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 136315650;
    v19 = "-[CSBuiltInVoiceTrigger _transitVoiceTriggerStatus:force:]_block_invoke";
    v20 = 2114;
    v21 = v4;
    v22 = 2114;
    v23 = v7;
    _os_log_impl(&dword_1C2614000, v6, OS_LOG_TYPE_DEFAULT, "%s Received VoiceTrigger %{public}@abled at state %{public}@", (uint8_t *)&v18, 0x20u);

  }
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(unsigned __int8 *)(a1 + 40);
  if (*(unsigned __int8 *)(v8 + 8) != v9 || *(_BYTE *)(a1 + 41))
  {
    *(_BYTE *)(v8 + 8) = v9;
    v10 = *v2;
    if (os_log_type_enabled(*v2, OS_LOG_TYPE_DEFAULT))
    {
      if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 8))
        v11 = CFSTR("YES");
      else
        v11 = CFSTR("NO");
      v18 = 136315394;
      v19 = "-[CSBuiltInVoiceTrigger _transitVoiceTriggerStatus:force:]_block_invoke";
      v20 = 2114;
      v21 = v11;
      _os_log_impl(&dword_1C2614000, v10, OS_LOG_TYPE_DEFAULT, "%s _voiceTriggerEnabled = %{public}@", (uint8_t *)&v18, 0x16u);
    }
    v12 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 8);
    objc_msgSend(MEMORY[0x1E0D191C0], "sharedPowerLogger");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v12)
      objc_msgSend(v13, "powerLogVoiceTriggerStart");
    else
      objc_msgSend(v13, "powerLogVoiceTriggerStop");

    v15 = *(id **)(a1 + 32);
    if (*(_BYTE *)(a1 + 40))
    {
      v16 = objc_msgSend(v15[25], "isEnabled");
      v15 = *(id **)(a1 + 32);
      v17 = v16 != 0;
    }
    else
    {
      v17 = 4;
    }
    objc_msgSend(v15, "_notifyEvent:", v17);
  }
}

id __49__CSBuiltInVoiceTrigger__setIsSecondPassRunning___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  os_log_t *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  int v11;
  const char *v12;
  __int16 v13;
  _WORD v14[9];

  *(_QWORD *)&v14[5] = *MEMORY[0x1E0C80C00];
  v4 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "bestEnd");
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 112);
  v6 = (os_log_t *)MEMORY[0x1E0D18F58];
  v7 = *MEMORY[0x1E0D18F58];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_INFO))
  {
    v11 = 136315651;
    v12 = "-[CSBuiltInVoiceTrigger _setIsSecondPassRunning:]_block_invoke";
    v13 = 1025;
    *(_DWORD *)v14 = v4;
    v14[2] = 1025;
    *(_DWORD *)&v14[3] = v5;
    _os_log_impl(&dword_1C2614000, v7, OS_LOG_TYPE_INFO, "%s bestEnd = %{private}d, bestChannel = %{private}d", (uint8_t *)&v11, 0x18u);
  }
  if (v4 - a2 < 0)
  {
    v8 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 168), "audioChunkFrom:to:channelIdx:", v4 - a2, v4, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v9 = *v6;
  if (os_log_type_enabled(*v6, OS_LOG_TYPE_INFO))
  {
    v11 = 136315395;
    v12 = "-[CSBuiltInVoiceTrigger _setIsSecondPassRunning:]_block_invoke";
    v13 = 2113;
    *(_QWORD *)v14 = v8;
    _os_log_impl(&dword_1C2614000, v9, OS_LOG_TYPE_INFO, "%s audio chunk: %{private}@", (uint8_t *)&v11, 0x16u);
  }
  return v8;
}

void __70__CSBuiltInVoiceTrigger__setAsset_forceExclaveToUsePreInstalledAsset___block_invoke_61(_QWORD *a1, unint64_t a2)
{
  os_log_t *v4;
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  os_log_t v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  int v17;
  const char *v18;
  __int16 v19;
  unint64_t v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = (os_log_t *)MEMORY[0x1E0D18F58];
  v5 = *MEMORY[0x1E0D18F58];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT))
  {
    v6 = a1[4];
    v17 = 136315650;
    v18 = "-[CSBuiltInVoiceTrigger _setAsset:forceExclaveToUsePreInstalledAsset:]_block_invoke";
    v19 = 2050;
    v20 = a2;
    v21 = 2114;
    v22 = v6;
    _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_DEFAULT, "%s Initializing first pass Corealis for channel : %{public}tu, with configPath : %{public}@", (uint8_t *)&v17, 0x20u);
  }
  if (objc_msgSend(MEMORY[0x1E0D19090], "inputRecordingNumberOfChannels") <= a2)
  {
    v7 = *v4;
    if (!os_log_type_enabled(*v4, OS_LOG_TYPE_FAULT))
      return;
    v10 = a1[4];
    v17 = 136315650;
    v18 = "-[CSBuiltInVoiceTrigger _setAsset:forceExclaveToUsePreInstalledAsset:]_block_invoke";
    v19 = 2048;
    v20 = a2;
    v21 = 2114;
    v22 = v10;
    v9 = "%s Trying to access out-of-bound channel (index = %tu), asset configPath: %{public}@";
    goto LABEL_10;
  }
  if ((objc_msgSend(MEMORY[0x1E0D19260], "supportVoiceTriggerChannelSelection") & 1) == 0
    && objc_msgSend(*(id *)(a1[5] + 72), "count"))
  {
    v7 = *v4;
    if (!os_log_type_enabled(*v4, OS_LOG_TYPE_FAULT))
      return;
    v8 = a1[4];
    v17 = 136315650;
    v18 = "-[CSBuiltInVoiceTrigger _setAsset:forceExclaveToUsePreInstalledAsset:]_block_invoke";
    v19 = 2048;
    v20 = a2;
    v21 = 2114;
    v22 = v8;
    v9 = "%s Trying to have multiple NDAPIs on platform not supporting channel selection, for channel: %tu, asset configPath: %{public}@";
LABEL_10:
    _os_log_fault_impl(&dword_1C2614000, v7, OS_LOG_TYPE_FAULT, v9, (uint8_t *)&v17, 0x20u);
    return;
  }
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D19138]), "initWithConfigPath:resourcePath:", a1[4], a1[6]);
  objc_msgSend(v11, "setActiveChannel:", a2);
  if (v11)
  {
    objc_msgSend(*(id *)(a1[5] + 72), "addObject:", v11);
  }
  else
  {
    v12 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_ERROR))
    {
      v17 = 136315138;
      v18 = "-[CSBuiltInVoiceTrigger _setAsset:forceExclaveToUsePreInstalledAsset:]_block_invoke";
      _os_log_error_impl(&dword_1C2614000, v12, OS_LOG_TYPE_ERROR, "%s Failed to create keyword analyzer", (uint8_t *)&v17, 0xCu);
    }
  }
  v13 = *v4;
  if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
  {
    v14 = *(void **)(a1[5] + 72);
    v15 = v13;
    v16 = objc_msgSend(v14, "count");
    v17 = 136315394;
    v18 = "-[CSBuiltInVoiceTrigger _setAsset:forceExclaveToUsePreInstalledAsset:]_block_invoke";
    v19 = 2048;
    v20 = v16;
    _os_log_impl(&dword_1C2614000, v15, OS_LOG_TYPE_DEFAULT, "%s %tu first pass Corealis were created", (uint8_t *)&v17, 0x16u);

  }
}

void __70__CSBuiltInVoiceTrigger__setAsset_forceExclaveToUsePreInstalledAsset___block_invoke(uint64_t a1, int a2)
{
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    v3 = *MEMORY[0x1E0D18F58];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_ERROR))
    {
      v4 = 136315394;
      v5 = "-[CSBuiltInVoiceTrigger _setAsset:forceExclaveToUsePreInstalledAsset:]_block_invoke";
      v6 = 1024;
      v7 = a2;
      _os_log_error_impl(&dword_1C2614000, v3, OS_LOG_TYPE_ERROR, "%s Setting asset on exclave hardware failed with error %u", (uint8_t *)&v4, 0x12u);
    }
  }
}

uint64_t __69__CSBuiltInVoiceTrigger_setAsset_forceExclaveToUsePreInstalledAsset___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setAsset:forceExclaveToUsePreInstalledAsset:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
}

void __55__CSBuiltInVoiceTrigger_setSecondPassProgressDelegate___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_storeWeak(WeakRetained + 4, *(id *)(a1 + 32));
    WeakRetained = v3;
  }

}

uint64_t __30__CSBuiltInVoiceTrigger_reset__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reset");
}

void __30__CSBuiltInVoiceTrigger_start__block_invoke(uint64_t a1, uint64_t a2, char a3)
{
  NSObject *v6;
  const __CFString *v7;
  id WeakRetained;
  int v9;
  const char *v10;
  __int16 v11;
  const __CFString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = *MEMORY[0x1E0D18F58];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT))
  {
    v7 = CFSTR("STOPPED");
    if ((_DWORD)a2)
      v7 = CFSTR("RUNNING");
    v9 = 136315394;
    v10 = "-[CSBuiltInVoiceTrigger start]_block_invoke";
    v11 = 2114;
    v12 = v7;
    _os_log_impl(&dword_1C2614000, v6, OS_LOG_TYPE_DEFAULT, "%s VoiceTrigger start policy changed : %{public}@", (uint8_t *)&v9, 0x16u);
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_transitVoiceTriggerStatus:force:", a2, a3 & 1);

}

uint64_t __30__CSBuiltInVoiceTrigger_start__block_invoke_28(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_stopAOPVoiceTrigger");
}

void __30__CSBuiltInVoiceTrigger_start__block_invoke_2(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  const __CFString *v5;
  id WeakRetained;
  int v7;
  const char *v8;
  __int16 v9;
  const __CFString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = *MEMORY[0x1E0D18F58];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT))
  {
    v5 = CFSTR("STOPPED");
    if ((_DWORD)a2)
      v5 = CFSTR("RUNNING");
    v7 = 136315394;
    v8 = "-[CSBuiltInVoiceTrigger start]_block_invoke_2";
    v9 = 2114;
    v10 = v5;
    _os_log_impl(&dword_1C2614000, v4, OS_LOG_TYPE_DEFAULT, "%s VoiceTrigger AOP mode start policy changed : %{public}@", (uint8_t *)&v7, 0x16u);
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_transitAOPModeIfNeededAsync:", a2);

}

void __30__CSBuiltInVoiceTrigger_start__block_invoke_36(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0D191A0], "phoneCallStateMonitor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 272) = objc_msgSend(v2, "phoneCallState");

  +[CSAttSiriStateMonitor sharedInstance](CSAttSiriStateMonitor, "sharedInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 280) = objc_msgSend(v3, "getAttendingState");

}

void __30__CSBuiltInVoiceTrigger_start__block_invoke_2_39(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v3;
  NSObject *v4;
  _QWORD block[6];
  char v6;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(NSObject **)(v3 + 56);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __30__CSBuiltInVoiceTrigger_start__block_invoke_3;
  block[3] = &unk_1E7C284A8;
  block[4] = v3;
  block[5] = a2;
  v6 = a3;
  dispatch_async(v4, block);
}

void __30__CSBuiltInVoiceTrigger_start__block_invoke_4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  NSObject *v3;
  _QWORD v4[6];

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(NSObject **)(v2 + 56);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __30__CSBuiltInVoiceTrigger_start__block_invoke_5;
  v4[3] = &unk_1E7C29178;
  v4[4] = v2;
  v4[5] = a2;
  dispatch_async(v3, v4);
}

void __30__CSBuiltInVoiceTrigger_start__block_invoke_6(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  NSObject *v3;
  _QWORD v4[6];

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(NSObject **)(v2 + 56);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __30__CSBuiltInVoiceTrigger_start__block_invoke_7;
  v4[3] = &unk_1E7C29178;
  v4[4] = v2;
  v4[5] = a2;
  dispatch_async(v3, v4);
}

void __30__CSBuiltInVoiceTrigger_start__block_invoke_8(uint64_t a1, char a2)
{
  uint64_t v2;
  NSObject *v3;
  _QWORD v4[5];
  char v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(NSObject **)(v2 + 56);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __30__CSBuiltInVoiceTrigger_start__block_invoke_9;
  v4[3] = &unk_1E7C28480;
  v4[4] = v2;
  v5 = a2;
  dispatch_async(v3, v4);
}

id __30__CSBuiltInVoiceTrigger_start__block_invoke_10(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  uint64_t v3;
  id v4;
  void *v5;
  _QWORD v7[5];
  _QWORD block[4];
  id v9;
  _QWORD *v10;
  _QWORD v11[4];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x2020000000;
  v11[3] = 3;
  objc_msgSend(WeakRetained, "queue");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __30__CSBuiltInVoiceTrigger_start__block_invoke_11;
  block[3] = &unk_1E7C29228;
  v10 = v11;
  v4 = WeakRetained;
  v9 = v4;
  dispatch_sync(v2, block);

  v7[0] = v3;
  v7[1] = 3221225472;
  v7[2] = __30__CSBuiltInVoiceTrigger_start__block_invoke_12;
  v7[3] = &unk_1E7C26D68;
  v7[4] = v11;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D19220]), "initWithMutableBuilder:", v7);

  _Block_object_dispose(v11, 8);
  return v5;
}

uint64_t __30__CSBuiltInVoiceTrigger_start__block_invoke_11(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_currentState");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

void __30__CSBuiltInVoiceTrigger_start__block_invoke_12(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = (void *)MEMORY[0x1E0C99E08];
  v4 = a2;
  objc_msgSend(v3, "dictionary");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setValue:forKey:", v5, CFSTR("FirstPassState"));

  v6 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(MEMORY[0x1E0D19080], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "numberWithUnsignedInteger:", objc_msgSend(v7, "currentBuiltinSpeakerState"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setValue:forKey:", v8, CFSTR("BuiltInSpeakerState"));

  objc_msgSend(v4, "setStateData:", v9);
  objc_msgSend(v4, "setStateDataTitle:", CFSTR("CoreSpeech-FirstPassStateCapture"));

}

uint64_t __30__CSBuiltInVoiceTrigger_start__block_invoke_9(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 17) = *(_BYTE *)(a1 + 40);
  return objc_msgSend(*(id *)(a1 + 32), "_forceUpdateCarPlayEndpointWithJarvisConnected:", *(unsigned __int8 *)(a1 + 40));
}

uint64_t __30__CSBuiltInVoiceTrigger_start__block_invoke_7(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(result + 32) + 192) = *(_QWORD *)(result + 40);
  return result;
}

uint64_t __30__CSBuiltInVoiceTrigger_start__block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_receivedHearstRoutedEvent:", *(_QWORD *)(a1 + 40));
}

uint64_t __30__CSBuiltInVoiceTrigger_start__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateCurrentSplitterState:shouldDisableSpeakerVerificationInSplitterMode:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
}

@end
