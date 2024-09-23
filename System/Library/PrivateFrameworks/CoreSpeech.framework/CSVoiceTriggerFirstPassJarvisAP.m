@implementation CSVoiceTriggerFirstPassJarvisAP

- (CSVoiceTriggerFirstPassJarvisAP)initWithSpeechManager:(id)a3 siriClientBehaviorMonitor:(id)a4
{
  id v6;
  id v7;
  CSVoiceTriggerFirstPassJarvisAP *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *queue;
  dispatch_group_t v11;
  OS_dispatch_group *recordingWillStartGroup;
  uint64_t v13;
  NSMutableArray *audioStreamHoldings;
  double v15;
  CSSpeechManager *v16;
  CSSpeechManager *speechManager;
  CSSiriClientBehaviorMonitor *v18;
  CSSiriClientBehaviorMonitor *siriClientBehaviorMonitor;
  uint64_t v20;
  CSPolicy *voiceTriggerJarvisAPEnabledPolicy;
  objc_super v23;

  v6 = a3;
  v7 = a4;
  v23.receiver = self;
  v23.super_class = (Class)CSVoiceTriggerFirstPassJarvisAP;
  v8 = -[CSVoiceTriggerFirstPassJarvisAP init](&v23, sel_init);
  if (v8)
  {
    v9 = dispatch_queue_create("CSVoiceTriggerFirstPassJarvisAP", 0);
    queue = v8->_queue;
    v8->_queue = (OS_dispatch_queue *)v9;

    v11 = dispatch_group_create();
    recordingWillStartGroup = v8->_recordingWillStartGroup;
    v8->_recordingWillStartGroup = (OS_dispatch_group *)v11;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v13 = objc_claimAutoreleasedReturnValue();
    audioStreamHoldings = v8->_audioStreamHoldings;
    v8->_audioStreamHoldings = (NSMutableArray *)v13;

    objc_msgSend(MEMORY[0x1E0D19090], "inputRecordingBufferDuration");
    v8->_heartbeatFactor = (unint64_t)(2.0 / v15);
    if (v6)
    {
      v16 = (CSSpeechManager *)v6;
    }
    else
    {
      +[CSSpeechManager sharedManagerForCoreSpeechDaemon](CSSpeechManager, "sharedManagerForCoreSpeechDaemon");
      v16 = (CSSpeechManager *)objc_claimAutoreleasedReturnValue();
    }
    speechManager = v8->_speechManager;
    v8->_speechManager = v16;

    if (v7)
    {
      v18 = (CSSiriClientBehaviorMonitor *)v7;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D191F0], "sharedInstance");
      v18 = (CSSiriClientBehaviorMonitor *)objc_claimAutoreleasedReturnValue();
    }
    siriClientBehaviorMonitor = v8->_siriClientBehaviorMonitor;
    v8->_siriClientBehaviorMonitor = v18;

    +[CSVoiceTriggerJarvisAPEnabledPolicy sharedInstance](CSVoiceTriggerJarvisAPEnabledPolicy, "sharedInstance");
    v20 = objc_claimAutoreleasedReturnValue();
    voiceTriggerJarvisAPEnabledPolicy = v8->_voiceTriggerJarvisAPEnabledPolicy;
    v8->_voiceTriggerJarvisAPEnabledPolicy = (CSPolicy *)v20;

  }
  return v8;
}

- (CSVoiceTriggerFirstPassJarvisAP)init
{
  return -[CSVoiceTriggerFirstPassJarvisAP initWithSpeechManager:siriClientBehaviorMonitor:](self, "initWithSpeechManager:siriClientBehaviorMonitor:", 0, 0);
}

- (void)start
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__CSVoiceTriggerFirstPassJarvisAP_start__block_invoke;
  block[3] = &unk_1E7C292C8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[4];
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0D18F58];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v6 = "-[CSVoiceTriggerFirstPassJarvisAP dealloc]";
    _os_log_impl(&dword_1C2614000, v3, OS_LOG_TYPE_DEFAULT, "%s CSVoiceTriggerFirstPassJarvisAP is deallocating", buf, 0xCu);
  }
  -[CSPolicy setCallback:](self->_voiceTriggerJarvisAPEnabledPolicy, "setCallback:", 0);
  v4.receiver = self;
  v4.super_class = (Class)CSVoiceTriggerFirstPassJarvisAP;
  -[CSVoiceTriggerFirstPassJarvisAP dealloc](&v4, sel_dealloc);
}

- (void)setAsset:(id)a3
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
  v7[2] = __44__CSVoiceTriggerFirstPassJarvisAP_setAsset___block_invoke;
  v7[3] = &unk_1E7C292A0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)_setAsset:(id)a3
{
  id v5;
  void *v6;
  NSObject *v7;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "logAssetVersionForInsight");
    objc_storeStrong((id *)&self->_currentAsset, a3);
  }
  else
  {
    v7 = *MEMORY[0x1E0D18F58];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT))
    {
      v8 = 136315138;
      v9 = "-[CSVoiceTriggerFirstPassJarvisAP _setAsset:]";
      _os_log_impl(&dword_1C2614000, v7, OS_LOG_TYPE_DEFAULT, "%s asset is nil, stop initialization", (uint8_t *)&v8, 0xCu);
    }
  }

}

- (void)_reset
{
  -[CSKeywordAnalyzerNDAPI reset](self->_keywordAnalyzerNDAPI, "reset");
}

- (void)_startListenWithCompletion:(id)a3
{
  id v4;
  os_log_t *v5;
  NSObject *v6;
  id v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  void *v9;
  uint64_t v10;
  void *v11;
  CSKeywordAnalyzerNDAPI *v12;
  CSKeywordAnalyzerNDAPI *keywordAnalyzerNDAPI;
  float v14;
  NSString *deviceId;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSString *v20;
  NSString *v21;
  void *v22;
  CSSpeechManager *speechManager;
  void *v24;
  id v25;
  void *v26;
  objc_class *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  id v36;
  id v37;
  void *v38;
  void *v39;
  _QWORD v40[5];
  void (**v41)(_QWORD, _QWORD, _QWORD);
  id v42;
  id v43;
  _QWORD v44[4];
  id v45;
  uint8_t buf[4];
  const char *v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (os_log_t *)MEMORY[0x1E0D18F58];
  v6 = *MEMORY[0x1E0D18F58];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v47 = "-[CSVoiceTriggerFirstPassJarvisAP _startListenWithCompletion:]";
    _os_log_impl(&dword_1C2614000, v6, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  v44[0] = MEMORY[0x1E0C809B0];
  v44[1] = 3221225472;
  v44[2] = __62__CSVoiceTriggerFirstPassJarvisAP__startListenWithCompletion___block_invoke;
  v44[3] = &unk_1E7C290D8;
  v7 = v4;
  v45 = v7;
  v8 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1C3BC4734](v44);
  objc_msgSend(MEMORY[0x1E0D192A0], "decodeConfigFrom:forFirstPassSource:", self->_currentAsset, 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "configPathNDAPI");
  v10 = objc_claimAutoreleasedReturnValue();
  -[CSAsset resourcePath](self->_currentAsset, "resourcePath");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = (void *)v10;
  v12 = (CSKeywordAnalyzerNDAPI *)objc_msgSend(objc_alloc(MEMORY[0x1E0D19138]), "initWithConfigPath:resourcePath:", v10, v11);
  keywordAnalyzerNDAPI = self->_keywordAnalyzerNDAPI;
  self->_keywordAnalyzerNDAPI = v12;

  -[CSKeywordAnalyzerNDAPI getThreshold](self->_keywordAnalyzerNDAPI, "getThreshold");
  self->_keywordThreshold = v14;
  -[CSKeywordAnalyzerNDAPI setActiveChannel:](self->_keywordAnalyzerNDAPI, "setActiveChannel:", 0);
  deviceId = self->_deviceId;
  self->_deviceId = 0;

  v16 = (void *)MEMORY[0x1E0D19260];
  objc_msgSend(MEMORY[0x1E0D191F0], "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "recordRoute");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v16) = objc_msgSend(v16, "isJarvisAudioRouteWithRecordRoute:", v18);

  if ((_DWORD)v16)
  {
    objc_msgSend(MEMORY[0x1E0D191F0], "sharedInstance");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "deviceId");
    v20 = (NSString *)objc_claimAutoreleasedReturnValue();
    v21 = self->_deviceId;
    self->_deviceId = v20;

  }
  if (self->_deviceId)
  {
    v38 = v9;
    objc_msgSend(MEMORY[0x1E0D19008], "contextForJarvisWithDeviceId:");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    speechManager = self->_speechManager;
    v43 = 0;
    -[CSSpeechManager audioProviderWithContext:error:](speechManager, "audioProviderWithContext:error:", v22, &v43);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v43;
    -[CSVoiceTriggerFirstPassJarvisAP setAudioProvider:](self, "setAudioProvider:", v24);
    if (v24)
    {
      v36 = v25;
      v37 = v7;
      objc_msgSend(MEMORY[0x1E0D19058], "defaultRequestWithContext:", v22);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setClientIdentity:", 2);
      v27 = (objc_class *)objc_opt_class();
      NSStringFromClass(v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = 0;
      objc_msgSend(v24, "audioStreamWithRequest:streamName:error:", v26, v28, &v42);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = v42;

      if (v29)
      {
        -[CSVoiceTriggerFirstPassJarvisAP setAudioStream:](self, "setAudioStream:", v29);
        objc_msgSend(v29, "setDelegate:", self);
        -[CSVoiceTriggerFirstPassJarvisAP audioStream](self, "audioStream");
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        if (v31)
        {
          v32 = *v5;
          if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315138;
            v47 = "-[CSVoiceTriggerFirstPassJarvisAP _startListenWithCompletion:]";
            _os_log_impl(&dword_1C2614000, v32, OS_LOG_TYPE_DEFAULT, "%s Entering recordWillStartGroup", buf, 0xCu);
          }
          dispatch_group_enter((dispatch_group_t)self->_recordingWillStartGroup);
          objc_msgSend(MEMORY[0x1E0D19030], "noAlertOption");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          -[CSVoiceTriggerFirstPassJarvisAP audioStream](self, "audioStream");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v40[0] = MEMORY[0x1E0C809B0];
          v40[1] = 3221225472;
          v40[2] = __62__CSVoiceTriggerFirstPassJarvisAP__startListenWithCompletion___block_invoke_20;
          v40[3] = &unk_1E7C29128;
          v40[4] = self;
          v41 = v8;
          objc_msgSend(v34, "startAudioStreamWithOption:completion:", v33, v40);

        }
      }
      else
      {
        ((void (**)(_QWORD, _QWORD, id))v8)[2](v8, 0, v30);
      }

      v25 = v36;
      v7 = v37;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18E80], 1451, 0);
      v30 = (id)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, _QWORD, id))v8)[2](v8, 0, v30);
    }

    v9 = v38;
  }
  else
  {
    v35 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v47 = "-[CSVoiceTriggerFirstPassJarvisAP _startListenWithCompletion:]";
      _os_log_impl(&dword_1C2614000, v35, OS_LOG_TYPE_DEFAULT, "%s JarvisAP deviceId is nil, skip starting", buf, 0xCu);
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18E80], 509, 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, void *))v8)[2](v8, 0, v22);
  }

}

- (void)_stopListening
{
  void *v3;
  CSKeywordAnalyzerNDAPI *keywordAnalyzerNDAPI;
  void *v5;
  NSObject *v6;
  NSObject *recordingWillStartGroup;
  NSObject *queue;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1C3BC4590](self, a2);
  keywordAnalyzerNDAPI = self->_keywordAnalyzerNDAPI;
  self->_keywordAnalyzerNDAPI = 0;

  objc_autoreleasePoolPop(v3);
  -[CSVoiceTriggerFirstPassJarvisAP audioStream](self, "audioStream");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = *MEMORY[0x1E0D18F58];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v11 = "-[CSVoiceTriggerFirstPassJarvisAP _stopListening]";
      _os_log_impl(&dword_1C2614000, v6, OS_LOG_TYPE_DEFAULT, "%s Waiting for recordWillStartGroup before scheduling stpoAudioStream", buf, 0xCu);
    }
    recordingWillStartGroup = self->_recordingWillStartGroup;
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __49__CSVoiceTriggerFirstPassJarvisAP__stopListening__block_invoke;
    block[3] = &unk_1E7C292C8;
    block[4] = self;
    dispatch_group_notify(recordingWillStartGroup, queue, block);
  }
}

- (void)audioStreamProvider:(id)a3 didStopStreamUnexpectedly:(int64_t)a4
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __81__CSVoiceTriggerFirstPassJarvisAP_audioStreamProvider_didStopStreamUnexpectedly___block_invoke;
  block[3] = &unk_1E7C292C8;
  block[4] = self;
  dispatch_async(queue, block);
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
  v8[2] = __76__CSVoiceTriggerFirstPassJarvisAP_audioStreamProvider_audioBufferAvailable___block_invoke;
  v8[3] = &unk_1E7C292A0;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(queue, v8);

}

- (BOOL)_shouldProcessAudio
{
  return !self->_isSiriClientListening && !self->_isSecondPassRunning && self->_isAPJarvisFirstPassEnabled;
}

- (void)shouldProcessAudio:(id)a3
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
  v7[2] = __54__CSVoiceTriggerFirstPassJarvisAP_shouldProcessAudio___block_invoke;
  v7[3] = &unk_1E7C29150;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)_keywordAnalyzerNDAPI:(id)a3 hasResultAvailable:(id)a4 forChannel:(unint64_t)a5
{
  id v7;
  id v8;
  void *v9;
  float v10;
  float v11;
  uint64_t v12;
  NSObject *v13;
  __CFNotificationCenter *DarwinNotifyCenter;
  os_log_t *v15;
  NSObject *v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  CSVoiceTriggerSecondPassRequestOption *v24;
  NSString *deviceId;
  void *v26;
  void *v27;
  CSVoiceTriggerSecondPassRequestOption *v28;
  CSVoiceTriggerSecondPass *voiceTriggerSecondPass;
  _QWORD v30[4];
  id v31;
  _QWORD v32[4];
  _QWORD v33[4];
  uint8_t buf[4];
  const char *v35;
  __int16 v36;
  double v37;
  __int16 v38;
  uint64_t v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "bestScore");
    v11 = v10;
    v12 = _keywordAnalyzerNDAPI_hasResultAvailable_forChannel__heartbeat_10443;
    if (!(_keywordAnalyzerNDAPI_hasResultAvailable_forChannel__heartbeat_10443 % self->_heartbeatFactor))
    {
      v13 = *MEMORY[0x1E0D18F58];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v35 = "-[CSVoiceTriggerFirstPassJarvisAP _keywordAnalyzerNDAPI:hasResultAvailable:forChannel:]";
        v36 = 2050;
        v37 = v11;
        v38 = 2050;
        v39 = v12;
        _os_log_impl(&dword_1C2614000, v13, OS_LOG_TYPE_DEFAULT, "%s Jarvis AP first pass best score = %{public}.3f for heartbeat = %{public}lld", buf, 0x20u);
        v12 = _keywordAnalyzerNDAPI_hasResultAvailable_forChannel__heartbeat_10443;
      }
    }
    _keywordAnalyzerNDAPI_hasResultAvailable_forChannel__heartbeat_10443 = v12 + 1;
    if (v11 >= self->_keywordThreshold)
    {
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.siri.myriad.jarvis"), 0, 0, 1u);
      v15 = (os_log_t *)MEMORY[0x1E0D18F58];
      v16 = *MEMORY[0x1E0D18F58];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v35 = "-[CSVoiceTriggerFirstPassJarvisAP _keywordAnalyzerNDAPI:hasResultAvailable:forChannel:]";
        _os_log_impl(&dword_1C2614000, v16, OS_LOG_TYPE_DEFAULT, "%s Send Jarvis Myriad notification", buf, 0xCu);
      }
      v32[0] = *MEMORY[0x1E0D19650];
      *(float *)&v17 = v11;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v33[0] = v18;
      v32[1] = *MEMORY[0x1E0D19658];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v9, "bestStart"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v33[1] = v19;
      v32[2] = *MEMORY[0x1E0D19620];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v9, "bestEnd"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v33[2] = v20;
      v32[3] = *MEMORY[0x1E0D19628];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v9, "samplesAtFire"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v33[3] = v21;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, v32, 4);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      v23 = *v15;
      if (os_log_type_enabled(*v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v35 = "-[CSVoiceTriggerFirstPassJarvisAP _keywordAnalyzerNDAPI:hasResultAvailable:forChannel:]";
        v36 = 2112;
        v37 = *(double *)&v9;
        v38 = 2112;
        v39 = (uint64_t)v22;
        _os_log_impl(&dword_1C2614000, v23, OS_LOG_TYPE_DEFAULT, "%s Detected : %@, %@", buf, 0x20u);
      }
      objc_msgSend(v7, "reset");
      -[CSVoiceTriggerFirstPassJarvisAP _createSecondPass](self, "_createSecondPass");
      self->_isSecondPassRunning = 1;
      -[CSVoiceTriggerFirstPassJarvisAP _addAudioStreamHold:](self, "_addAudioStreamHold:", CFSTR("Jarvis AP first pass triggered"));
      objc_initWeak((id *)buf, self);
      v24 = [CSVoiceTriggerSecondPassRequestOption alloc];
      deviceId = self->_deviceId;
      -[CSAudioProvider UUID](self->_audioProvider, "UUID");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = -[CSVoiceTriggerSecondPassRequestOption initWithFirstPassSource:deviceId:audioProviderUUID:firstPassInfo:rejectionMHUUID:isSecondChanceRun:firstpassMetrics:rtModelRequestOptions:](v24, "initWithFirstPassSource:deviceId:audioProviderUUID:firstPassInfo:rejectionMHUUID:isSecondChanceRun:firstpassMetrics:rtModelRequestOptions:", 4, deviceId, v26, v22, v27, -[CSVoiceTriggerSecondChanceContext shouldRunAsSecondChance](self->_secondChanceContext, "shouldRunAsSecondChance"), 0, 0);

      voiceTriggerSecondPass = self->_voiceTriggerSecondPass;
      v30[0] = MEMORY[0x1E0C809B0];
      v30[1] = 3221225472;
      v30[2] = __87__CSVoiceTriggerFirstPassJarvisAP__keywordAnalyzerNDAPI_hasResultAvailable_forChannel___block_invoke;
      v30[3] = &unk_1E7C256E0;
      objc_copyWeak(&v31, (id *)buf);
      -[CSVoiceTriggerSecondPass handleVoiceTriggerSecondPassFrom:completion:](voiceTriggerSecondPass, "handleVoiceTriggerSecondPassFrom:completion:", v28, v30);
      objc_destroyWeak(&v31);

      objc_destroyWeak((id *)buf);
    }
  }

}

- (void)_handleSecondPassResult:(id)a3 deviceId:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  os_log_t *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  id v17;
  char v18;
  NSObject *v19;
  id WeakRetained;
  char v21;
  id v22;
  char v23;
  os_log_t v24;
  CSVoiceTriggerSecondChanceContext *v25;
  CSVoiceTriggerSecondChanceContext *secondChanceContext;
  void *v27;
  int v28;
  const char *v29;
  __int16 v30;
  _BYTE v31[14];
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_msgSend(v8, "result");
  objc_msgSend(v8, "voiceTriggerEventInfo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (os_log_t *)MEMORY[0x1E0D18F58];
  v14 = (void *)*MEMORY[0x1E0D18F58];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT))
  {
    v15 = v14;
    objc_msgSend(v10, "localizedDescription");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 136315906;
    v29 = "-[CSVoiceTriggerFirstPassJarvisAP _handleSecondPassResult:deviceId:error:]";
    v30 = 1024;
    *(_DWORD *)v31 = v11;
    *(_WORD *)&v31[4] = 2114;
    *(_QWORD *)&v31[6] = v12;
    v32 = 2114;
    v33 = v16;
    _os_log_impl(&dword_1C2614000, v15, OS_LOG_TYPE_DEFAULT, "%s Second Pass Result, %d, %{public}@, %{public}@", (uint8_t *)&v28, 0x26u);

  }
  self->_isSecondPassRunning = 0;
  switch(v11)
  {
    case 3:
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      v21 = objc_opt_respondsToSelector();

      if ((v21 & 1) == 0)
        goto LABEL_14;
      v19 = objc_loadWeakRetained((id *)&self->_delegate);
      -[NSObject voiceTriggerDidDetectNearMiss:deviceId:](v19, "voiceTriggerDidDetectNearMiss:deviceId:", v12, v9);
      goto LABEL_12;
    case 2:
      v22 = objc_loadWeakRetained((id *)&self->_delegate);
      v23 = objc_opt_respondsToSelector();

      if ((v23 & 1) == 0)
        goto LABEL_14;
      v19 = objc_loadWeakRetained((id *)&self->_delegate);
      -[NSObject voiceTriggerDidRejected:deviceId:](v19, "voiceTriggerDidRejected:deviceId:", v12, v9);
      goto LABEL_12;
    case 1:
      v17 = objc_loadWeakRetained((id *)&self->_delegate);
      v18 = objc_opt_respondsToSelector();

      if ((v18 & 1) == 0)
        goto LABEL_14;
      v19 = objc_loadWeakRetained((id *)&self->_delegate);
      -[NSObject voiceTriggerDidDetectKeyword:deviceId:](v19, "voiceTriggerDidDetectKeyword:deviceId:", v12, v9);
      goto LABEL_12;
  }
  v24 = *v13;
  if (os_log_type_enabled(*v13, OS_LOG_TYPE_ERROR))
  {
    v19 = v24;
    objc_msgSend(v10, "localizedDescription");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 136315394;
    v29 = "-[CSVoiceTriggerFirstPassJarvisAP _handleSecondPassResult:deviceId:error:]";
    v30 = 2114;
    *(_QWORD *)v31 = v27;
    _os_log_error_impl(&dword_1C2614000, v19, OS_LOG_TYPE_ERROR, "%s VoiceTrigger Second Pass has failed : %{public}@", (uint8_t *)&v28, 0x16u);

LABEL_12:
  }
LABEL_14:
  if (objc_msgSend(v8, "isSecondChanceCandidate"))
  {
    v25 = -[CSVoiceTriggerSecondChanceContext initWithWindowStartTime:]([CSVoiceTriggerSecondChanceContext alloc], "initWithWindowStartTime:", mach_absolute_time());
    secondChanceContext = self->_secondChanceContext;
    self->_secondChanceContext = v25;
  }
  else
  {
    secondChanceContext = self->_secondChanceContext;
    self->_secondChanceContext = 0;
  }

  if (v11 != 1)
    -[CSVoiceTriggerFirstPassJarvisAP _cancelLastAudioStreamHold](self, "_cancelLastAudioStreamHold");
  -[CSVoiceTriggerFirstPassJarvisAP _reset](self, "_reset");

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
    -[CSVoiceTriggerFirstPassJarvisAP audioProvider](self, "audioProvider");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "cancelAudioStreamHold:", v4);

    -[NSMutableArray removeLastObject](self->_audioStreamHoldings, "removeLastObject");
  }
}

- (void)_createSecondPass
{
  CSOSTransaction *v3;
  CSOSTransaction *secondPassTransaction;
  CSVoiceTriggerSecondPass *v5;
  CSVoiceTriggerSecondPass *voiceTriggerSecondPass;
  void *v7;

  if (!self->_voiceTriggerSecondPass)
  {
    v3 = (CSOSTransaction *)objc_msgSend(objc_alloc(MEMORY[0x1E0D19178]), "initWithDescription:", CFSTR("VoiceTrigger SecondPass"));
    secondPassTransaction = self->_secondPassTransaction;
    self->_secondPassTransaction = v3;

    v5 = -[CSVoiceTriggerSecondPass initWithPHSEnabled:]([CSVoiceTriggerSecondPass alloc], "initWithPHSEnabled:", 0);
    voiceTriggerSecondPass = self->_voiceTriggerSecondPass;
    self->_voiceTriggerSecondPass = v5;

    -[CSVoiceTriggerSecondPass setFirstPassSource:](self->_voiceTriggerSecondPass, "setFirstPassSource:", 4);
    -[CSVoiceTriggerSecondPass setSecondPassClient:](self->_voiceTriggerSecondPass, "setSecondPassClient:", 3);
    -[CSVoiceTriggerSecondPass setAsset:](self->_voiceTriggerSecondPass, "setAsset:", self->_currentAsset);
    -[CSVoiceTriggerFirstPassJarvisAP delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSVoiceTriggerSecondPass setDelegate:](self->_voiceTriggerSecondPass, "setDelegate:", v7);

    -[CSVoiceTriggerSecondPass start](self->_voiceTriggerSecondPass, "start");
  }
}

- (void)_teardownSecondPass
{
  void *v3;
  CSVoiceTriggerSecondPass *voiceTriggerSecondPass;
  CSOSTransaction *secondPassTransaction;

  v3 = (void *)MEMORY[0x1C3BC4590](self, a2);
  voiceTriggerSecondPass = self->_voiceTriggerSecondPass;
  self->_voiceTriggerSecondPass = 0;

  objc_autoreleasePoolPop(v3);
  secondPassTransaction = self->_secondPassTransaction;
  self->_secondPassTransaction = 0;

}

- (void)_transitJarvisAPEnable:(BOOL)a3
{
  NSObject *queue;
  _QWORD v4[5];
  BOOL v5;

  queue = self->_queue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __58__CSVoiceTriggerFirstPassJarvisAP__transitJarvisAPEnable___block_invoke;
  v4[3] = &unk_1E7C28480;
  v4[4] = self;
  v5 = a3;
  dispatch_async(queue, v4);
}

- (void)siriClientBehaviorMonitor:(id)a3 didStartStreamWithContext:(id)a4 successfully:(BOOL)a5 option:(id)a6 withEventUUID:(id)a7
{
  _BOOL4 v9;
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  NSObject *queue;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v20;
  uint64_t v21;

  v9 = a5;
  v21 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  v16 = *MEMORY[0x1E0D18F58];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v20 = "-[CSVoiceTriggerFirstPassJarvisAP siriClientBehaviorMonitor:didStartStreamWithContext:successfully:option:withEventUUID:]";
    _os_log_impl(&dword_1C2614000, v16, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  if (v9)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __121__CSVoiceTriggerFirstPassJarvisAP_siriClientBehaviorMonitor_didStartStreamWithContext_successfully_option_withEventUUID___block_invoke;
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
  block[2] = __89__CSVoiceTriggerFirstPassJarvisAP_siriClientBehaviorMonitor_didStopStream_withEventUUID___block_invoke;
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
  block[2] = __83__CSVoiceTriggerFirstPassJarvisAP_siriClientBehaviorMonitor_willStopStream_reason___block_invoke;
  block[3] = &unk_1E7C292C8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (CSVoiceTriggerDelegate)delegate
{
  return (CSVoiceTriggerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
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

- (CSKeywordAnalyzerNDAPI)keywordAnalyzerNDAPI
{
  return self->_keywordAnalyzerNDAPI;
}

- (void)setKeywordAnalyzerNDAPI:(id)a3
{
  objc_storeStrong((id *)&self->_keywordAnalyzerNDAPI, a3);
}

- (CSAudioStream)audioStream
{
  return self->_audioStream;
}

- (void)setAudioStream:(id)a3
{
  objc_storeStrong((id *)&self->_audioStream, a3);
}

- (OS_dispatch_group)recordingWillStartGroup
{
  return self->_recordingWillStartGroup;
}

- (void)setRecordingWillStartGroup:(id)a3
{
  objc_storeStrong((id *)&self->_recordingWillStartGroup, a3);
}

- (BOOL)isAPJarvisFirstPassEnabled
{
  return self->_isAPJarvisFirstPassEnabled;
}

- (void)setIsAPJarvisFirstPassEnabled:(BOOL)a3
{
  self->_isAPJarvisFirstPassEnabled = a3;
}

- (float)keywordThreshold
{
  return self->_keywordThreshold;
}

- (void)setKeywordThreshold:(float)a3
{
  self->_keywordThreshold = a3;
}

- (CSVoiceTriggerSecondPass)voiceTriggerSecondPass
{
  return self->_voiceTriggerSecondPass;
}

- (void)setVoiceTriggerSecondPass:(id)a3
{
  objc_storeStrong((id *)&self->_voiceTriggerSecondPass, a3);
}

- (CSOSTransaction)secondPassTransaction
{
  return self->_secondPassTransaction;
}

- (void)setSecondPassTransaction:(id)a3
{
  objc_storeStrong((id *)&self->_secondPassTransaction, a3);
}

- (BOOL)isSiriClientListening
{
  return self->_isSiriClientListening;
}

- (void)setIsSiriClientListening:(BOOL)a3
{
  self->_isSiriClientListening = a3;
}

- (BOOL)isSecondPassRunning
{
  return self->_isSecondPassRunning;
}

- (void)setIsSecondPassRunning:(BOOL)a3
{
  self->_isSecondPassRunning = a3;
}

- (NSString)deviceId
{
  return self->_deviceId;
}

- (void)setDeviceId:(id)a3
{
  objc_storeStrong((id *)&self->_deviceId, a3);
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

- (CSSiriClientBehaviorMonitor)siriClientBehaviorMonitor
{
  return self->_siriClientBehaviorMonitor;
}

- (void)setSiriClientBehaviorMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_siriClientBehaviorMonitor, a3);
}

- (CSSpeechManager)speechManager
{
  return self->_speechManager;
}

- (void)setSpeechManager:(id)a3
{
  objc_storeStrong((id *)&self->_speechManager, a3);
}

- (CSPolicy)voiceTriggerJarvisAPEnabledPolicy
{
  return self->_voiceTriggerJarvisAPEnabledPolicy;
}

- (void)setVoiceTriggerJarvisAPEnabledPolicy:(id)a3
{
  objc_storeStrong((id *)&self->_voiceTriggerJarvisAPEnabledPolicy, a3);
}

- (CSVoiceTriggerSecondChanceContext)secondChanceContext
{
  return self->_secondChanceContext;
}

- (void)setSecondChanceContext:(id)a3
{
  objc_storeStrong((id *)&self->_secondChanceContext, a3);
}

- (unint64_t)heartbeatFactor
{
  return self->_heartbeatFactor;
}

- (void)setHeartbeatFactor:(unint64_t)a3
{
  self->_heartbeatFactor = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondChanceContext, 0);
  objc_storeStrong((id *)&self->_voiceTriggerJarvisAPEnabledPolicy, 0);
  objc_storeStrong((id *)&self->_speechManager, 0);
  objc_storeStrong((id *)&self->_siriClientBehaviorMonitor, 0);
  objc_storeStrong((id *)&self->_audioStreamHoldings, 0);
  objc_storeStrong((id *)&self->_audioProvider, 0);
  objc_storeStrong((id *)&self->_deviceId, 0);
  objc_storeStrong((id *)&self->_secondPassTransaction, 0);
  objc_storeStrong((id *)&self->_voiceTriggerSecondPass, 0);
  objc_storeStrong((id *)&self->_recordingWillStartGroup, 0);
  objc_storeStrong((id *)&self->_audioStream, 0);
  objc_storeStrong((id *)&self->_keywordAnalyzerNDAPI, 0);
  objc_storeStrong((id *)&self->_currentAsset, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __83__CSVoiceTriggerFirstPassJarvisAP_siriClientBehaviorMonitor_willStopStream_reason___block_invoke(uint64_t a1)
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
    v4 = "-[CSVoiceTriggerFirstPassJarvisAP siriClientBehaviorMonitor:willStopStream:reason:]_block_invoke";
    _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s Siri Client will stop listening, resume FirstPassJarvisAP listen", (uint8_t *)&v3, 0xCu);
  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 9) = 0;
}

uint64_t __89__CSVoiceTriggerFirstPassJarvisAP_siriClientBehaviorMonitor_didStopStream_withEventUUID___block_invoke(uint64_t a1)
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
    v5 = "-[CSVoiceTriggerFirstPassJarvisAP siriClientBehaviorMonitor:didStopStream:withEventUUID:]_block_invoke";
    _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s Siri Client stops listening now, FirstPassJarvisAP can listen now", (uint8_t *)&v4, 0xCu);
  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 9) = 0;
  return objc_msgSend(*(id *)(a1 + 32), "_reset");
}

void __121__CSVoiceTriggerFirstPassJarvisAP_siriClientBehaviorMonitor_didStartStreamWithContext_successfully_option_withEventUUID___block_invoke(uint64_t a1)
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
    v4 = "-[CSVoiceTriggerFirstPassJarvisAP siriClientBehaviorMonitor:didStartStreamWithContext:successfully:option:withE"
         "ventUUID:]_block_invoke";
    _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s Siri Client starts listening now, FirstPassJarvisAP shouldn't listen now", (uint8_t *)&v3, 0xCu);
  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 9) = 1;
}

uint64_t __58__CSVoiceTriggerFirstPassJarvisAP__transitJarvisAPEnable___block_invoke(uint64_t result)
{
  uint64_t v1;
  int v2;
  _BYTE *v3;

  v1 = *(_QWORD *)(result + 32);
  v2 = *(unsigned __int8 *)(result + 40);
  if (*(unsigned __int8 *)(v1 + 8) != v2)
  {
    *(_BYTE *)(v1 + 8) = v2;
    v3 = *(_BYTE **)(result + 32);
    if (v3[8])
      return objc_msgSend(v3, "_startListenWithCompletion:", 0);
    else
      return objc_msgSend(v3, "_stopListening");
  }
  return result;
}

void __87__CSVoiceTriggerFirstPassJarvisAP__keywordAnalyzerNDAPI_hasResultAvailable_forChannel___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id *v7;
  NSObject **WeakRetained;
  NSObject **v9;
  NSObject *v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  v7 = (id *)(a1 + 32);
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  v9 = WeakRetained;
  if (WeakRetained)
  {
    v10 = WeakRetained[3];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __87__CSVoiceTriggerFirstPassJarvisAP__keywordAnalyzerNDAPI_hasResultAvailable_forChannel___block_invoke_2;
    block[3] = &unk_1E7C28610;
    objc_copyWeak(&v14, v7);
    v12 = v5;
    v13 = v6;
    dispatch_async(v10, block);

    objc_destroyWeak(&v14);
  }

}

void __87__CSVoiceTriggerFirstPassJarvisAP__keywordAnalyzerNDAPI_hasResultAvailable_forChannel___block_invoke_2(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;

  v2 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v4 = *(_QWORD *)(a1 + 32);
  v5 = WeakRetained;
  objc_msgSend(v5, "deviceId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_handleSecondPassResult:deviceId:error:", v4, v6, *(_QWORD *)(a1 + 40));

  v7 = objc_loadWeakRetained(v2);
  objc_msgSend(v7, "_teardownSecondPass");

}

uint64_t __54__CSVoiceTriggerFirstPassJarvisAP_shouldProcessAudio___block_invoke(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(result + 40);
  if (v1)
    return (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 16))(v1, objc_msgSend(*(id *)(result + 32), "_shouldProcessAudio"));
  return result;
}

void __76__CSVoiceTriggerFirstPassJarvisAP_audioStreamProvider_audioBufferAvailable___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  NSObject *v3;
  uint64_t v4;
  NSObject *v5;
  unsigned __int8 *v6;
  int v7;
  int v8;
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  int v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD **)(a1 + 32);
  if (v2[4])
  {
    if (objc_msgSend(v2, "_shouldProcessAudio"))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "getBestAnalyzedResultsFromAudioChunk:", *(_QWORD *)(a1 + 40));
      v9 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "_keywordAnalyzerNDAPI:hasResultAvailable:forChannel:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40), v9, objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "activeChannel"));

    }
    else
    {
      v4 = _block_invoke_enableHeartbeat_10456;
      if (__ROR8__(0xCCCCCCCCCCCCCCCDLL * _block_invoke_enableHeartbeat_10456, 1) <= 0x1999999999999999uLL)
      {
        v5 = *MEMORY[0x1E0D18F58];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT))
        {
          v6 = *(unsigned __int8 **)(a1 + 32);
          v7 = v6[9];
          v8 = v6[10];
          LODWORD(v6) = v6[8];
          *(_DWORD *)buf = 136315906;
          v11 = "-[CSVoiceTriggerFirstPassJarvisAP audioStreamProvider:audioBufferAvailable:]_block_invoke";
          v12 = 1024;
          v13 = v7;
          v14 = 1024;
          v15 = v8;
          v16 = 1024;
          v17 = (int)v6;
          _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_DEFAULT, "%s Bypass audio here because isSecondPassRunning = %d, isSiriClientListening = %d, _isAPJarvisFirstPassEnabled = %d", buf, 0x1Eu);
          v4 = _block_invoke_enableHeartbeat_10456;
        }
      }
      _block_invoke_enableHeartbeat_10456 = v4 + 1;
    }
  }
  else
  {
    v3 = *MEMORY[0x1E0D18F58];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v11 = "-[CSVoiceTriggerFirstPassJarvisAP audioStreamProvider:audioBufferAvailable:]_block_invoke";
      _os_log_impl(&dword_1C2614000, v3, OS_LOG_TYPE_DEFAULT, "%s Could not find Assets. Cannot process Audio", buf, 0xCu);
    }
  }
}

uint64_t __81__CSVoiceTriggerFirstPassJarvisAP_audioStreamProvider_didStopStreamUnexpectedly___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)MEMORY[0x1C3BC4590]();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = 0;

  objc_autoreleasePoolPop(v2);
  return objc_msgSend(*(id *)(a1 + 32), "_cancelLastAudioStreamHold");
}

void __49__CSVoiceTriggerFirstPassJarvisAP__stopListening__block_invoke(uint64_t a1)
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
    v5 = "-[CSVoiceTriggerFirstPassJarvisAP _stopListening]_block_invoke";
    _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s Scheduled stopAudioStream after waiting for recordingWillStartGroup", (uint8_t *)&v4, 0xCu);
  }
  objc_msgSend(*(id *)(a1 + 32), "audioStream");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stopAudioStreamWithOption:completion:", 0, &__block_literal_global_10460);

}

void __49__CSVoiceTriggerFirstPassJarvisAP__stopListening__block_invoke_22(uint64_t a1, uint64_t a2, void *a3)
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
      v8 = "-[CSVoiceTriggerFirstPassJarvisAP _stopListening]_block_invoke";
      v9 = 2114;
      v10 = v6;
      _os_log_error_impl(&dword_1C2614000, v5, OS_LOG_TYPE_ERROR, "%s Cannot stop listening : %{public}@", (uint8_t *)&v7, 0x16u);

    }
  }

}

uint64_t __62__CSVoiceTriggerFirstPassJarvisAP__startListenWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __62__CSVoiceTriggerFirstPassJarvisAP__startListenWithCompletion___block_invoke_20(uint64_t a1, char a2, void *a3)
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
  v8 = *(NSObject **)(v6 + 24);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __62__CSVoiceTriggerFirstPassJarvisAP__startListenWithCompletion___block_invoke_2;
  v10[3] = &unk_1E7C29100;
  v10[4] = v6;
  v13 = a2;
  v11 = v5;
  v12 = v7;
  v9 = v5;
  dispatch_async(v8, v10);

}

uint64_t __62__CSVoiceTriggerFirstPassJarvisAP__startListenWithCompletion___block_invoke_2(uint64_t a1)
{
  os_log_t *v2;
  NSObject *v3;
  _BYTE *v4;
  NSObject *v5;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = (os_log_t *)MEMORY[0x1E0D18F58];
  v3 = *MEMORY[0x1E0D18F58];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315138;
    v8 = "-[CSVoiceTriggerFirstPassJarvisAP _startListenWithCompletion:]_block_invoke_2";
    _os_log_impl(&dword_1C2614000, v3, OS_LOG_TYPE_DEFAULT, "%s Leaving recordWillStartGroup", (uint8_t *)&v7, 0xCu);
  }
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 56));
  if (*(_BYTE *)(a1 + 56))
  {
    v4 = *(_BYTE **)(a1 + 32);
    if (!v4[8])
    {
      v5 = *v2;
      if (os_log_type_enabled(*v2, OS_LOG_TYPE_DEFAULT))
      {
        v7 = 136315138;
        v8 = "-[CSVoiceTriggerFirstPassJarvisAP _startListenWithCompletion:]_block_invoke";
        _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_DEFAULT, "%s didStartRecording received when CSVoiceTriggerFirstPassJarvisAP is turned off", (uint8_t *)&v7, 0xCu);
        v4 = *(_BYTE **)(a1 + 32);
      }
      objc_msgSend(v4, "_stopListening");
    }
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

uint64_t __44__CSVoiceTriggerFirstPassJarvisAP_setAsset___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setAsset:", *(_QWORD *)(a1 + 40));
}

void __40__CSVoiceTriggerFirstPassJarvisAP_start__block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id location;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = 0;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "registerObserver:");
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "isEnabled"))
    objc_msgSend(*(id *)(a1 + 32), "_transitJarvisAPEnable:", 1);
  objc_initWeak(&location, *(id *)(a1 + 32));
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 120);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __40__CSVoiceTriggerFirstPassJarvisAP_start__block_invoke_2;
  v3[3] = &unk_1E7C26D40;
  objc_copyWeak(&v4, &location);
  objc_msgSend(v2, "setCallback:", v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __40__CSVoiceTriggerFirstPassJarvisAP_start__block_invoke_2(uint64_t a1, uint64_t a2)
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
    v8 = "-[CSVoiceTriggerFirstPassJarvisAP start]_block_invoke_2";
    v9 = 2114;
    v10 = v5;
    _os_log_impl(&dword_1C2614000, v4, OS_LOG_TYPE_DEFAULT, "%s VoiceTrigger JarvisAP start policy changed : %{public}@", (uint8_t *)&v7, 0x16u);
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_transitJarvisAPEnable:", a2);

}

@end
