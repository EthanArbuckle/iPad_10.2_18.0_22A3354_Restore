@implementation CSVoiceTriggerFirstPassHearstAP

- (CSVoiceTriggerFirstPassHearstAP)initWithSpeechManager:(id)a3 voiceTriggerEnabledMonitor:(id)a4 siriClientBehaviorMonitor:(id)a5 opportuneSpeakEventMonitor:(id)a6 phoneCallStateMonitor:(id)a7 otherAppRecordingStateMonitor:(id)a8 voiceTriggerHearstAPEnabledPolicy:(id)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  CSVoiceTriggerFirstPassHearstAP *v18;
  CSVoiceTriggerFirstPassHearstAP *v19;
  dispatch_queue_t v20;
  OS_dispatch_queue *queue;
  dispatch_group_t v22;
  OS_dispatch_group *recordingWillStartGroup;
  uint64_t v24;
  NSMutableArray *audioStreamHoldings;
  double v26;
  id v28;
  objc_super v29;

  v28 = a3;
  v14 = a5;
  v15 = a6;
  v16 = a8;
  v17 = a9;
  v29.receiver = self;
  v29.super_class = (Class)CSVoiceTriggerFirstPassHearstAP;
  v18 = -[CSVoiceTriggerFirstPassHearstAP init](&v29, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_speechManager, a3);
    objc_storeStrong((id *)&v19->_siriClientBehaviorMonitor, a5);
    objc_storeStrong((id *)&v19->_opportuneSpeakEventMonitor, a6);
    objc_storeStrong((id *)&v19->_otherAppRecordingStateMonitor, a8);
    objc_storeStrong((id *)&v19->_voiceTriggerHearstAPEnabledPolicy, a9);
    v20 = dispatch_queue_create("CSVoiceTriggerFirstPassHearstAP", 0);
    queue = v19->_queue;
    v19->_queue = (OS_dispatch_queue *)v20;

    v22 = dispatch_group_create();
    recordingWillStartGroup = v19->_recordingWillStartGroup;
    v19->_recordingWillStartGroup = (OS_dispatch_group *)v22;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v24 = objc_claimAutoreleasedReturnValue();
    audioStreamHoldings = v19->_audioStreamHoldings;
    v19->_audioStreamHoldings = (NSMutableArray *)v24;

    objc_msgSend(MEMORY[0x1E0D19090], "inputRecordingBufferDuration");
    v19->_heartbeatFactor = (unint64_t)(2.0 / v26);
  }

  return v19;
}

- (CSVoiceTriggerFirstPassHearstAP)init
{
  return -[CSVoiceTriggerFirstPassHearstAP initWithSpeechManager:voiceTriggerEnabledMonitor:siriClientBehaviorMonitor:opportuneSpeakEventMonitor:phoneCallStateMonitor:otherAppRecordingStateMonitor:voiceTriggerHearstAPEnabledPolicy:](self, "initWithSpeechManager:voiceTriggerEnabledMonitor:siriClientBehaviorMonitor:opportuneSpeakEventMonitor:phoneCallStateMonitor:otherAppRecordingStateMonitor:voiceTriggerHearstAPEnabledPolicy:", 0, 0, 0, 0, 0, 0, 0);
}

- (void)start
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__CSVoiceTriggerFirstPassHearstAP_start__block_invoke;
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
    v6 = "-[CSVoiceTriggerFirstPassHearstAP dealloc]";
    _os_log_impl(&dword_1C2614000, v3, OS_LOG_TYPE_DEFAULT, "%s CSVoiceTriggerFirstPassHearstAP is deallocating", buf, 0xCu);
  }
  -[CSPolicy setCallback:](self->_voiceTriggerHearstAPEnabledPolicy, "setCallback:", 0);
  v4.receiver = self;
  v4.super_class = (Class)CSVoiceTriggerFirstPassHearstAP;
  -[CSVoiceTriggerFirstPassHearstAP dealloc](&v4, sel_dealloc);
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
  v7[2] = __44__CSVoiceTriggerFirstPassHearstAP_setAsset___block_invoke;
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
      v9 = "-[CSVoiceTriggerFirstPassHearstAP _setAsset:]";
      _os_log_impl(&dword_1C2614000, v7, OS_LOG_TYPE_DEFAULT, "%s asset is nil, stop initialization", (uint8_t *)&v8, 0xCu);
    }
  }

}

- (void)_reset
{
  -[CSKeywordAnalyzerNDAPI reset](self->_keywordAnalyzerNDAPI, "reset");
}

- (void)_startListenWithAudioProviderUUID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  os_log_t *v8;
  NSObject *v9;
  id v10;
  void (**v11)(_QWORD, _QWORD, _QWORD);
  void *v12;
  void *v13;
  CSKeywordAnalyzerNDAPI *v14;
  CSKeywordAnalyzerNDAPI *keywordAnalyzerNDAPI;
  float v16;
  void *v17;
  float v18;
  float v19;
  CSRemoteVADSignalExtractor *v20;
  CSRemoteVADSignalExtractor *remoteVADSignalExtractor;
  CSSpeechManager *speechManager;
  CSSpeechManager *v23;
  CSSpeechManager *v24;
  NSString *v25;
  NSString *deviceId;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  objc_class *v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  NSObject *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  _QWORD v48[5];
  void (**v49)(_QWORD, _QWORD, _QWORD);
  id v50;
  uint64_t v51;
  _QWORD v52[5];
  id v53;
  uint8_t buf[4];
  const char *v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (os_log_t *)MEMORY[0x1E0D18F58];
  v9 = *MEMORY[0x1E0D18F58];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v55 = "-[CSVoiceTriggerFirstPassHearstAP _startListenWithAudioProviderUUID:completion:]";
    _os_log_impl(&dword_1C2614000, v9, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  v52[0] = MEMORY[0x1E0C809B0];
  v52[1] = 3221225472;
  v52[2] = __80__CSVoiceTriggerFirstPassHearstAP__startListenWithAudioProviderUUID_completion___block_invoke;
  v52[3] = &unk_1E7C29128;
  v52[4] = self;
  v10 = v7;
  v53 = v10;
  v11 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1C3BC4734](v52);
  objc_msgSend(MEMORY[0x1E0D192A0], "decodeConfigFrom:forFirstPassSource:", self->_currentAsset, 6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "configPathNDAPI");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSAsset resourcePath](self->_currentAsset, "resourcePath");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (CSKeywordAnalyzerNDAPI *)objc_msgSend(objc_alloc(MEMORY[0x1E0D19138]), "initWithConfigPath:resourcePath:", v13, v47);
  keywordAnalyzerNDAPI = self->_keywordAnalyzerNDAPI;
  self->_keywordAnalyzerNDAPI = v14;

  -[CSKeywordAnalyzerNDAPI getThreshold](self->_keywordAnalyzerNDAPI, "getThreshold");
  self->_keywordThreshold = v16;
  -[CSKeywordAnalyzerNDAPI setActiveChannel:](self->_keywordAnalyzerNDAPI, "setActiveChannel:", 0);
  objc_msgSend(v12, "wearerDetectionConfig");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "threshold");
  v19 = v18;

  if (v19 <= 0.0)
  {
    remoteVADSignalExtractor = self->_remoteVADSignalExtractor;
    self->_remoteVADSignalExtractor = 0;
  }
  else
  {
    v20 = (CSRemoteVADSignalExtractor *)objc_msgSend(objc_alloc(MEMORY[0x1E0D191D8]), "initWithToken:", CFSTR("CSVoiceTriggerFirstPassHearstAP"));
    remoteVADSignalExtractor = self->_remoteVADSignalExtractor;
    self->_remoteVADSignalExtractor = v20;
  }

  speechManager = self->_speechManager;
  if (speechManager)
  {
    v23 = speechManager;
  }
  else
  {
    +[CSSpeechManager sharedManagerForCoreSpeechDaemon](CSSpeechManager, "sharedManagerForCoreSpeechDaemon");
    v23 = (CSSpeechManager *)objc_claimAutoreleasedReturnValue();
  }
  v24 = v23;
  -[CSVoiceTriggerFirstPassHearstAP _fetchDeviceId](self, "_fetchDeviceId");
  v25 = (NSString *)objc_claimAutoreleasedReturnValue();
  deviceId = self->_deviceId;
  self->_deviceId = v25;

  if (!self->_deviceId)
  {
    v29 = (void *)MEMORY[0x1E0CB35C8];
    v30 = *MEMORY[0x1E0D18E80];
    v31 = 1452;
    goto LABEL_13;
  }
  -[CSSpeechManager audioProviderWithUUID:](v24, "audioProviderWithUUID:", v6);
  v27 = objc_claimAutoreleasedReturnValue();
  if (!v27)
  {
    objc_msgSend(MEMORY[0x1E0D19008], "contextForHearstVoiceTriggerWithDeviceId:", self->_deviceId);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = 0;
    -[CSSpeechManager audioProviderWithContext:error:](v24, "audioProviderWithContext:error:", v32, &v51);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    -[CSVoiceTriggerFirstPassHearstAP setAudioProvider:](self, "setAudioProvider:", v28);
    if (v28)
      goto LABEL_15;
    v29 = (void *)MEMORY[0x1E0CB35C8];
    v30 = *MEMORY[0x1E0D18E80];
    v31 = 1451;
LABEL_13:
    objc_msgSend(v29, "errorWithDomain:code:userInfo:", v30, v31, 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, void *))v11)[2](v11, 0, v28);
    goto LABEL_22;
  }
  v28 = (void *)v27;
  -[CSVoiceTriggerFirstPassHearstAP setAudioProvider:](self, "setAudioProvider:", v27);
LABEL_15:
  v33 = (void *)MEMORY[0x1E0D19058];
  -[CSOpportuneSpeakEventMonitor audioRecordContext](self->_opportuneSpeakEventMonitor, "audioRecordContext", v13, v10, v6);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "defaultRequestWithContext:", v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v35, "setClientIdentity:", 2);
  v36 = (objc_class *)objc_opt_class();
  NSStringFromClass(v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = 0;
  objc_msgSend(v28, "audioStreamWithRequest:streamName:error:", v35, v37, &v50);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = v50;

  if (v38)
  {
    objc_msgSend(v38, "setIsWeakStream:", 1);
    -[CSVoiceTriggerFirstPassHearstAP setAudioStream:](self, "setAudioStream:", v38);
    objc_msgSend(v38, "setDelegate:", self);
    -[CSVoiceTriggerFirstPassHearstAP audioStream](self, "audioStream");
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    if (v40)
    {
      v41 = *v8;
      if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v55 = "-[CSVoiceTriggerFirstPassHearstAP _startListenWithAudioProviderUUID:completion:]";
        _os_log_impl(&dword_1C2614000, v41, OS_LOG_TYPE_DEFAULT, "%s Entering recordWillStartGroup", buf, 0xCu);
      }
      dispatch_group_enter((dispatch_group_t)self->_recordingWillStartGroup);
      objc_msgSend(MEMORY[0x1E0D19030], "noAlertOption");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "setDisableBoostForDoAP:", 1);
      objc_msgSend(v42, "setStartRecordingHostTime:", mach_absolute_time());
      -[CSVoiceTriggerFirstPassHearstAP audioStream](self, "audioStream");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v48[0] = MEMORY[0x1E0C809B0];
      v48[1] = 3221225472;
      v48[2] = __80__CSVoiceTriggerFirstPassHearstAP__startListenWithAudioProviderUUID_completion___block_invoke_24;
      v48[3] = &unk_1E7C29128;
      v48[4] = self;
      v49 = v11;
      objc_msgSend(v43, "startAudioStreamWithOption:completion:", v42, v48);

    }
  }
  else
  {
    ((void (**)(_QWORD, _QWORD, id))v11)[2](v11, 0, v39);
  }

  v10 = v45;
  v6 = v46;
  v13 = v44;
LABEL_22:

}

- (id)_fetchDeviceId
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  int v13;
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D19048], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasNonVoiceTriggerStreamsOrStreamHoldersActive");

  if (!v4)
  {
    if (-[CSOpportuneSpeakEventMonitor isStreaming](self->_opportuneSpeakEventMonitor, "isStreaming"))
    {
      -[CSOpportuneSpeakEventMonitor audioRecordContext](self->_opportuneSpeakEventMonitor, "audioRecordContext");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "deviceId");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)objc_msgSend(v10, "copy");

      goto LABEL_6;
    }
    v11 = *MEMORY[0x1E0D18F58];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_FAULT))
    {
      v13 = 136315138;
      v14 = "-[CSVoiceTriggerFirstPassHearstAP _fetchDeviceId]";
      _os_log_fault_impl(&dword_1C2614000, v11, OS_LOG_TYPE_FAULT, "%s FirstPassHearstAP doesn't meet listening condition, set deviceId to nil", (uint8_t *)&v13, 0xCu);
    }
LABEL_9:
    v9 = 0;
    return v9;
  }
  v5 = (void *)MEMORY[0x1E0D19260];
  objc_msgSend(MEMORY[0x1E0D191F0], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "recordRoute");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = objc_msgSend(v5, "isDoAPAudioRouteWithRecordRoute:", v7);

  if (!(_DWORD)v5)
    goto LABEL_9;
  objc_msgSend(MEMORY[0x1E0D191F0], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "deviceId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:

  return v9;
}

- (void)_stopListening
{
  void *v3;
  CSKeywordAnalyzerNDAPI *keywordAnalyzerNDAPI;
  CSRemoteVADSignalExtractor *remoteVADSignalExtractor;
  void *v6;
  NSObject *v7;
  NSObject *recordingWillStartGroup;
  NSObject *queue;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1C3BC4590](self, a2);
  keywordAnalyzerNDAPI = self->_keywordAnalyzerNDAPI;
  self->_keywordAnalyzerNDAPI = 0;

  remoteVADSignalExtractor = self->_remoteVADSignalExtractor;
  self->_remoteVADSignalExtractor = 0;

  objc_autoreleasePoolPop(v3);
  -[CSVoiceTriggerFirstPassHearstAP audioStream](self, "audioStream");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = *MEMORY[0x1E0D18F58];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v12 = "-[CSVoiceTriggerFirstPassHearstAP _stopListening]";
      _os_log_impl(&dword_1C2614000, v7, OS_LOG_TYPE_DEFAULT, "%s Waiting for recordWillStartGroup before scheduling stopAudioStream", buf, 0xCu);
    }
    recordingWillStartGroup = self->_recordingWillStartGroup;
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __49__CSVoiceTriggerFirstPassHearstAP__stopListening__block_invoke;
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
  block[2] = __81__CSVoiceTriggerFirstPassHearstAP_audioStreamProvider_didStopStreamUnexpectedly___block_invoke;
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
  v8[2] = __76__CSVoiceTriggerFirstPassHearstAP_audioStreamProvider_audioBufferAvailable___block_invoke;
  v8[3] = &unk_1E7C292A0;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(queue, v8);

}

- (BOOL)_shouldProcessAudio
{
  return !self->_isSiriClientListening && !self->_isSecondPassRunning && self->_isAPHearstFirstPassEnabled;
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
  v7[2] = __54__CSVoiceTriggerFirstPassHearstAP_shouldProcessAudio___block_invoke;
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
  double v10;
  float v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  os_log_t *v19;
  NSObject *v20;
  CSRemoteVADSignalExtractor *remoteVADSignalExtractor;
  NSObject *v22;
  CSVoiceTriggerRTModelRequestOptions *v23;
  uint64_t v24;
  CSVoiceTriggerRTModelRequestOptions *v25;
  CSVoiceTriggerSecondPassRequestOption *v26;
  NSString *deviceId;
  void *v28;
  void *v29;
  CSVoiceTriggerSecondPassRequestOption *v30;
  void *v31;
  uint64_t v32;
  CSVoiceTriggerSecondPass *voiceTriggerSecondPass;
  _QWORD v34[4];
  id v35;
  _QWORD v36[5];
  _QWORD v37[4];
  _QWORD v38[4];
  uint8_t buf[4];
  const char *v40;
  __int16 v41;
  double v42;
  __int16 v43;
  uint64_t v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (*(double *)&v8 != 0.0)
  {
    objc_msgSend(v8, "bestScore");
    v11 = *(float *)&v10;
    v12 = _keywordAnalyzerNDAPI_hasResultAvailable_forChannel__heartbeat;
    if (!(_keywordAnalyzerNDAPI_hasResultAvailable_forChannel__heartbeat % self->_heartbeatFactor))
    {
      v13 = *MEMORY[0x1E0D18F58];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v40 = "-[CSVoiceTriggerFirstPassHearstAP _keywordAnalyzerNDAPI:hasResultAvailable:forChannel:]";
        v41 = 2050;
        v42 = v11;
        v43 = 2050;
        v44 = v12;
        _os_log_impl(&dword_1C2614000, v13, OS_LOG_TYPE_DEFAULT, "%s Hearst AP first pass best score = %{public}.3f for heartbeat = %{public}lld", buf, 0x20u);
        v12 = _keywordAnalyzerNDAPI_hasResultAvailable_forChannel__heartbeat;
      }
    }
    _keywordAnalyzerNDAPI_hasResultAvailable_forChannel__heartbeat = v12 + 1;
    if (v11 >= self->_keywordThreshold)
    {
      v37[0] = *MEMORY[0x1E0D19650];
      *(float *)&v10 = v11;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v10);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v38[0] = v14;
      v37[1] = *MEMORY[0x1E0D19658];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v9, "bestStart"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v38[1] = v15;
      v37[2] = *MEMORY[0x1E0D19620];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v9, "bestEnd"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v38[2] = v16;
      v37[3] = *MEMORY[0x1E0D19628];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v9, "samplesAtFire"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v38[3] = v17;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, v37, 4);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      v19 = (os_log_t *)MEMORY[0x1E0D18F58];
      v20 = *MEMORY[0x1E0D18F58];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v40 = "-[CSVoiceTriggerFirstPassHearstAP _keywordAnalyzerNDAPI:hasResultAvailable:forChannel:]";
        v41 = 2112;
        v42 = *(double *)&v9;
        v43 = 2112;
        v44 = (uint64_t)v18;
        _os_log_impl(&dword_1C2614000, v20, OS_LOG_TYPE_DEFAULT, "%s Detected : %@, %@", buf, 0x20u);
      }
      remoteVADSignalExtractor = self->_remoteVADSignalExtractor;
      if (remoteVADSignalExtractor
        && !-[CSRemoteVADSignalExtractor hasSpeechDetectedFromStartSampleCount:toEndSampleCount:](remoteVADSignalExtractor, "hasSpeechDetectedFromStartSampleCount:toEndSampleCount:", objc_msgSend(v9, "bestStart"), objc_msgSend(v9, "bestEnd")))
      {
        v22 = *v19;
        if (os_log_type_enabled(*v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          v40 = "-[CSVoiceTriggerFirstPassHearstAP _keywordAnalyzerNDAPI:hasResultAvailable:forChannel:]";
          _os_log_impl(&dword_1C2614000, v22, OS_LOG_TYPE_DEFAULT, "%s Do not send in-ear myriad trigger since remoteVAD didn't detect speech", buf, 0xCu);
        }
      }
      else
      {
        +[CSMyriadNotifier notifyInEarMyriadTrigger](CSMyriadNotifier, "notifyInEarMyriadTrigger");
      }
      objc_msgSend(v7, "reset");
      -[CSVoiceTriggerFirstPassHearstAP _createSecondPass](self, "_createSecondPass");
      self->_isSecondPassRunning = 1;
      -[CSVoiceTriggerFirstPassHearstAP _addAudioStreamHold:](self, "_addAudioStreamHold:", CFSTR("Hearst AP first pass triggered"));
      objc_initWeak((id *)buf, self);
      v23 = [CSVoiceTriggerRTModelRequestOptions alloc];
      v24 = MEMORY[0x1E0C809B0];
      v36[0] = MEMORY[0x1E0C809B0];
      v36[1] = 3221225472;
      v36[2] = __87__CSVoiceTriggerFirstPassHearstAP__keywordAnalyzerNDAPI_hasResultAvailable_forChannel___block_invoke;
      v36[3] = &unk_1E7C25288;
      v36[4] = self;
      v25 = -[CSVoiceTriggerRTModelRequestOptions initWithMutableBuilder:](v23, "initWithMutableBuilder:", v36);
      v26 = [CSVoiceTriggerSecondPassRequestOption alloc];
      deviceId = self->_deviceId;
      -[CSAudioProvider UUID](self->_audioProvider, "UUID");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = -[CSVoiceTriggerSecondPassRequestOption initWithFirstPassSource:deviceId:audioProviderUUID:firstPassInfo:rejectionMHUUID:isSecondChanceRun:firstpassMetrics:rtModelRequestOptions:](v26, "initWithFirstPassSource:deviceId:audioProviderUUID:firstPassInfo:rejectionMHUUID:isSecondChanceRun:firstpassMetrics:rtModelRequestOptions:", 6, deviceId, v28, v18, v29, -[CSVoiceTriggerSecondChanceContext shouldRunAsSecondChance](self->_secondChanceContext, "shouldRunAsSecondChance"), 0, v25);

      if (-[CSVoiceTriggerRTModelRequestOptions allowMph](v25, "allowMph"))
      {
        -[CSVoiceTriggerRTModelRequestOptions accessoryInfo](v25, "accessoryInfo");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(v31, "supportsJustSiri");

      }
      else
      {
        v32 = 0;
      }
      -[CSVoiceTriggerSecondPass setSupportsMultiPhraseDetection:](self->_voiceTriggerSecondPass, "setSupportsMultiPhraseDetection:", v32);
      voiceTriggerSecondPass = self->_voiceTriggerSecondPass;
      v34[0] = v24;
      v34[1] = 3221225472;
      v34[2] = __87__CSVoiceTriggerFirstPassHearstAP__keywordAnalyzerNDAPI_hasResultAvailable_forChannel___block_invoke_41;
      v34[3] = &unk_1E7C256E0;
      objc_copyWeak(&v35, (id *)buf);
      -[CSVoiceTriggerSecondPass handleVoiceTriggerSecondPassFrom:completion:](voiceTriggerSecondPass, "handleVoiceTriggerSecondPassFrom:completion:", v30, v34);
      objc_destroyWeak(&v35);

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
  id WeakRetained;
  char v18;
  NSObject *v19;
  id v20;
  char v21;
  id v22;
  char v23;
  os_log_t v24;
  void *v25;
  id v26;
  char v27;
  CSVoiceTriggerSecondChanceContext *v28;
  CSVoiceTriggerSecondChanceContext *secondChanceContext;
  int v30;
  const char *v31;
  __int16 v32;
  _BYTE v33[14];
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
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
    v30 = 136315906;
    v31 = "-[CSVoiceTriggerFirstPassHearstAP _handleSecondPassResult:deviceId:error:]";
    v32 = 1024;
    *(_DWORD *)v33 = v11;
    *(_WORD *)&v33[4] = 2114;
    *(_QWORD *)&v33[6] = v12;
    v34 = 2114;
    v35 = v16;
    _os_log_impl(&dword_1C2614000, v15, OS_LOG_TYPE_DEFAULT, "%s Second Pass Result, %d, %{public}@, %{public}@", (uint8_t *)&v30, 0x26u);

  }
  self->_isSecondPassRunning = 0;
  switch(v11)
  {
    case 1:
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      v18 = objc_opt_respondsToSelector();

      if ((v18 & 1) != 0)
      {
        v19 = objc_loadWeakRetained((id *)&self->_delegate);
        -[NSObject voiceTriggerDidDetectKeyword:deviceId:](v19, "voiceTriggerDidDetectKeyword:deviceId:", v12, v9);
        goto LABEL_14;
      }
      break;
    case 2:
      v20 = objc_loadWeakRetained((id *)&self->_delegate);
      v21 = objc_opt_respondsToSelector();

      if ((v21 & 1) != 0)
      {
        v19 = objc_loadWeakRetained((id *)&self->_delegate);
        -[NSObject voiceTriggerDidRejected:deviceId:](v19, "voiceTriggerDidRejected:deviceId:", v12, v9);
        goto LABEL_14;
      }
      break;
    case 3:
      v22 = objc_loadWeakRetained((id *)&self->_delegate);
      v23 = objc_opt_respondsToSelector();

      if ((v23 & 1) != 0)
      {
        v19 = objc_loadWeakRetained((id *)&self->_delegate);
        -[NSObject voiceTriggerDidDetectNearMiss:deviceId:](v19, "voiceTriggerDidDetectNearMiss:deviceId:", v12, v9);
        goto LABEL_14;
      }
      break;
    case 9:
      v26 = objc_loadWeakRetained((id *)&self->_delegate);
      v27 = objc_opt_respondsToSelector();

      if ((v27 & 1) != 0)
      {
        v19 = objc_loadWeakRetained((id *)&self->_delegate);
        -[NSObject voiceTriggerDidDetectSpeakerReject:](v19, "voiceTriggerDidDetectSpeakerReject:", v12);
        goto LABEL_14;
      }
      break;
    default:
      v24 = *v13;
      if (os_log_type_enabled(*v13, OS_LOG_TYPE_ERROR))
      {
        v19 = v24;
        objc_msgSend(v10, "localizedDescription");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = 136315394;
        v31 = "-[CSVoiceTriggerFirstPassHearstAP _handleSecondPassResult:deviceId:error:]";
        v32 = 2114;
        *(_QWORD *)v33 = v25;
        _os_log_error_impl(&dword_1C2614000, v19, OS_LOG_TYPE_ERROR, "%s VoiceTrigger Second Pass has failed : %{public}@", (uint8_t *)&v30, 0x16u);

LABEL_14:
      }
      break;
  }
  if (objc_msgSend(v8, "isSecondChanceCandidate"))
  {
    v28 = -[CSVoiceTriggerSecondChanceContext initWithWindowStartTime:]([CSVoiceTriggerSecondChanceContext alloc], "initWithWindowStartTime:", mach_absolute_time());
    secondChanceContext = self->_secondChanceContext;
    self->_secondChanceContext = v28;
  }
  else
  {
    secondChanceContext = self->_secondChanceContext;
    self->_secondChanceContext = 0;
  }

  if (v11 != 1)
    -[CSVoiceTriggerFirstPassHearstAP _cancelLastAudioStreamHold](self, "_cancelLastAudioStreamHold");
  -[CSVoiceTriggerFirstPassHearstAP _reset](self, "_reset");

}

- (void)_addAudioStreamHold:(id)a3
{
  void *v4;
  id v5;

  v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D19050]), "initWithTimeout:clientIdentity:requireRecordModeLock:requireListeningMicIndicatorLock:", 2, 0, 0, 5.0);
  -[CSAudioProvider holdAudioStreamWithDescription:option:](self->_audioProvider, "holdAudioStreamWithDescription:option:", CFSTR("CSHearstSecondPassRequest"), v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](self->_audioStreamHoldings, "addObject:", v4);

}

- (void)_cancelLastAudioStreamHold
{
  void *v3;
  id v4;

  if (-[NSMutableArray count](self->_audioStreamHoldings, "count"))
  {
    -[NSMutableArray lastObject](self->_audioStreamHoldings, "lastObject");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[CSVoiceTriggerFirstPassHearstAP audioProvider](self, "audioProvider");
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

    -[CSVoiceTriggerSecondPass setFirstPassSource:](self->_voiceTriggerSecondPass, "setFirstPassSource:", 6);
    -[CSVoiceTriggerSecondPass setSecondPassClient:](self->_voiceTriggerSecondPass, "setSecondPassClient:", 2);
    -[CSVoiceTriggerSecondPass setAsset:](self->_voiceTriggerSecondPass, "setAsset:", self->_currentAsset);
    -[CSVoiceTriggerFirstPassHearstAP delegate](self, "delegate");
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

- (void)_transitHearstAPEnable:(BOOL)a3
{
  NSObject *queue;
  _QWORD v4[5];
  BOOL v5;

  queue = self->_queue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __58__CSVoiceTriggerFirstPassHearstAP__transitHearstAPEnable___block_invoke;
  v4[3] = &unk_1E7C28480;
  v4[4] = self;
  v5 = a3;
  dispatch_async(queue, v4);
}

- (void)opportuneSpeakEventMonitor:(id)a3 didStreamStateChanged:(BOOL)a4
{
  void *v5;
  NSObject *queue;
  id v7;
  _QWORD v8[5];
  id v9;

  -[CSOpportuneSpeakEventMonitor audioProviderUUID](self->_opportuneSpeakEventMonitor, "audioProviderUUID", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  queue = self->_queue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __84__CSVoiceTriggerFirstPassHearstAP_opportuneSpeakEventMonitor_didStreamStateChanged___block_invoke;
  v8[3] = &unk_1E7C292A0;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(queue, v8);

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
    v20 = "-[CSVoiceTriggerFirstPassHearstAP siriClientBehaviorMonitor:didStartStreamWithContext:successfully:option:withEventUUID:]";
    _os_log_impl(&dword_1C2614000, v16, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  if (v9)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __121__CSVoiceTriggerFirstPassHearstAP_siriClientBehaviorMonitor_didStartStreamWithContext_successfully_option_withEventUUID___block_invoke;
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
  block[2] = __89__CSVoiceTriggerFirstPassHearstAP_siriClientBehaviorMonitor_didStopStream_withEventUUID___block_invoke;
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
  block[2] = __83__CSVoiceTriggerFirstPassHearstAP_siriClientBehaviorMonitor_willStopStream_reason___block_invoke;
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

- (BOOL)isAPHearstFirstPassEnabled
{
  return self->_isAPHearstFirstPassEnabled;
}

- (void)setIsAPHearstFirstPassEnabled:(BOOL)a3
{
  self->_isAPHearstFirstPassEnabled = a3;
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

- (NSString)opportuneSpeakAudioProviderUUID
{
  return self->_opportuneSpeakAudioProviderUUID;
}

- (void)setOpportuneSpeakAudioProviderUUID:(id)a3
{
  objc_storeStrong((id *)&self->_opportuneSpeakAudioProviderUUID, a3);
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

- (CSOpportuneSpeakEventMonitor)opportuneSpeakEventMonitor
{
  return self->_opportuneSpeakEventMonitor;
}

- (void)setOpportuneSpeakEventMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_opportuneSpeakEventMonitor, a3);
}

- (CSOtherAppRecordingStateMonitor)otherAppRecordingStateMonitor
{
  return self->_otherAppRecordingStateMonitor;
}

- (void)setOtherAppRecordingStateMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_otherAppRecordingStateMonitor, a3);
}

- (CSPolicy)voiceTriggerHearstAPEnabledPolicy
{
  return self->_voiceTriggerHearstAPEnabledPolicy;
}

- (void)setVoiceTriggerHearstAPEnabledPolicy:(id)a3
{
  objc_storeStrong((id *)&self->_voiceTriggerHearstAPEnabledPolicy, a3);
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

- (CSRemoteVADSignalExtractor)remoteVADSignalExtractor
{
  return self->_remoteVADSignalExtractor;
}

- (void)setRemoteVADSignalExtractor:(id)a3
{
  objc_storeStrong((id *)&self->_remoteVADSignalExtractor, a3);
}

- (CSVoiceTriggerUserSelectedPhrase)multiPhraseSelectedStatus
{
  return self->_multiPhraseSelectedStatus;
}

- (void)setMultiPhraseSelectedStatus:(id)a3
{
  objc_storeStrong((id *)&self->_multiPhraseSelectedStatus, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_multiPhraseSelectedStatus, 0);
  objc_storeStrong((id *)&self->_remoteVADSignalExtractor, 0);
  objc_storeStrong((id *)&self->_secondChanceContext, 0);
  objc_storeStrong((id *)&self->_voiceTriggerHearstAPEnabledPolicy, 0);
  objc_storeStrong((id *)&self->_otherAppRecordingStateMonitor, 0);
  objc_storeStrong((id *)&self->_opportuneSpeakEventMonitor, 0);
  objc_storeStrong((id *)&self->_speechManager, 0);
  objc_storeStrong((id *)&self->_siriClientBehaviorMonitor, 0);
  objc_storeStrong((id *)&self->_audioStreamHoldings, 0);
  objc_storeStrong((id *)&self->_opportuneSpeakAudioProviderUUID, 0);
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

void __83__CSVoiceTriggerFirstPassHearstAP_siriClientBehaviorMonitor_willStopStream_reason___block_invoke(uint64_t a1)
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
    v4 = "-[CSVoiceTriggerFirstPassHearstAP siriClientBehaviorMonitor:willStopStream:reason:]_block_invoke";
    _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s Siri Client will stop listening, resume FirstPassHearstAP listen", (uint8_t *)&v3, 0xCu);
  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 9) = 0;
}

uint64_t __89__CSVoiceTriggerFirstPassHearstAP_siriClientBehaviorMonitor_didStopStream_withEventUUID___block_invoke(uint64_t a1)
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
    v5 = "-[CSVoiceTriggerFirstPassHearstAP siriClientBehaviorMonitor:didStopStream:withEventUUID:]_block_invoke";
    _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s Siri Client stops listening now, FirstPassHearstAP can listen now", (uint8_t *)&v4, 0xCu);
  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 9) = 0;
  return objc_msgSend(*(id *)(a1 + 32), "_reset");
}

void __121__CSVoiceTriggerFirstPassHearstAP_siriClientBehaviorMonitor_didStartStreamWithContext_successfully_option_withEventUUID___block_invoke(uint64_t a1)
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
    v4 = "-[CSVoiceTriggerFirstPassHearstAP siriClientBehaviorMonitor:didStartStreamWithContext:successfully:option:withE"
         "ventUUID:]_block_invoke";
    _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s Siri Client starts listening now, FirstPassHearstAP shouldn't listen now", (uint8_t *)&v3, 0xCu);
  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 9) = 1;
}

void __84__CSVoiceTriggerFirstPassHearstAP_opportuneSpeakEventMonitor_didStreamStateChanged___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 96), *(id *)(a1 + 40));
}

uint64_t __58__CSVoiceTriggerFirstPassHearstAP__transitHearstAPEnable___block_invoke(uint64_t result)
{
  uint64_t v1;
  int v2;
  uint64_t v3;

  v1 = *(_QWORD *)(result + 32);
  v2 = *(unsigned __int8 *)(result + 40);
  if (*(unsigned __int8 *)(v1 + 8) != v2)
  {
    *(_BYTE *)(v1 + 8) = v2;
    v3 = *(_QWORD *)(result + 32);
    if (*(_BYTE *)(v3 + 8))
      return objc_msgSend((id)v3, "_startListenWithAudioProviderUUID:completion:", *(_QWORD *)(v3 + 96), 0);
    else
      return objc_msgSend((id)v3, "_stopListening");
  }
  return result;
}

void __87__CSVoiceTriggerFirstPassHearstAP__keywordAnalyzerNDAPI_hasResultAvailable_forChannel___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  CSCoreSpeechServicesAccessoryInfo *v16;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "multiPhraseSelectedStatus");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAllowMph:", objc_msgSend(v5, "multiPhraseSelected"));

  v6 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 32), "multiPhraseSelectedStatus");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "numberWithUnsignedInteger:", objc_msgSend(v7, "userSelectedPhraseType"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUserSelectedPhraseType:", v8);

  v9 = objc_alloc(MEMORY[0x1E0CB3A28]);
  objc_msgSend(*(id *)(a1 + 32), "deviceId");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithUUIDString:", v10);
  objc_msgSend(v4, "setEndpointId:", v11);

  objc_msgSend(v4, "setAccessoryModelType:", &unk_1E7C63920);
  objc_msgSend(MEMORY[0x1E0D19078], "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "deviceId");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "getBluetoothDeviceInfoForDeviceWithId:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "supportMph");

  v16 = objc_alloc_init(CSCoreSpeechServicesAccessoryInfo);
  -[CSCoreSpeechServicesAccessoryInfo setSupportsJustSiri:](v16, "setSupportsJustSiri:", v15);
  objc_msgSend(v4, "setCSCoreSpeechServicesAccessoryInfo:", v16);

}

void __87__CSVoiceTriggerFirstPassHearstAP__keywordAnalyzerNDAPI_hasResultAvailable_forChannel___block_invoke_41(uint64_t a1, void *a2, void *a3)
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
    block[2] = __87__CSVoiceTriggerFirstPassHearstAP__keywordAnalyzerNDAPI_hasResultAvailable_forChannel___block_invoke_2;
    block[3] = &unk_1E7C28610;
    objc_copyWeak(&v14, v7);
    v12 = v5;
    v13 = v6;
    dispatch_async(v10, block);

    objc_destroyWeak(&v14);
  }

}

void __87__CSVoiceTriggerFirstPassHearstAP__keywordAnalyzerNDAPI_hasResultAvailable_forChannel___block_invoke_2(uint64_t a1)
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

uint64_t __54__CSVoiceTriggerFirstPassHearstAP_shouldProcessAudio___block_invoke(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(result + 40);
  if (v1)
    return (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 16))(v1, objc_msgSend(*(id *)(result + 32), "_shouldProcessAudio"));
  return result;
}

void __76__CSVoiceTriggerFirstPassHearstAP_audioStreamProvider_audioBufferAvailable___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  unsigned __int8 *v8;
  int v9;
  int v10;
  id v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  int v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD **)(a1 + 32);
  if (v2[4])
  {
    if (objc_msgSend(v2, "_shouldProcessAudio"))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "getBestAnalyzedResultsFromAudioChunk:", *(_QWORD *)(a1 + 40));
      v11 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "_keywordAnalyzerNDAPI:hasResultAvailable:forChannel:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40), v11, objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "activeChannel"));
      v3 = *(void **)(*(_QWORD *)(a1 + 32) + 168);
      if (v3)
      {
        objc_msgSend(*(id *)(a1 + 40), "remoteVAD");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "feedRemoteVAD:startSampleCount:", v4, objc_msgSend(*(id *)(a1 + 40), "startSampleCount"));

      }
    }
    else
    {
      v6 = _block_invoke_enableHeartbeat;
      if (__ROR8__(0xCCCCCCCCCCCCCCCDLL * _block_invoke_enableHeartbeat, 1) <= 0x1999999999999999uLL)
      {
        v7 = *MEMORY[0x1E0D18F58];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT))
        {
          v8 = *(unsigned __int8 **)(a1 + 32);
          v9 = v8[9];
          v10 = v8[10];
          LODWORD(v8) = v8[8];
          *(_DWORD *)buf = 136315906;
          v13 = "-[CSVoiceTriggerFirstPassHearstAP audioStreamProvider:audioBufferAvailable:]_block_invoke";
          v14 = 1024;
          v15 = v9;
          v16 = 1024;
          v17 = v10;
          v18 = 1024;
          v19 = (int)v8;
          _os_log_impl(&dword_1C2614000, v7, OS_LOG_TYPE_DEFAULT, "%s Bypass audio here because isSecondPassRunning = %d, isSiriClientListening = %d, _isAPHearstFirstPassEnabled = %d", buf, 0x1Eu);
          v6 = _block_invoke_enableHeartbeat;
        }
      }
      _block_invoke_enableHeartbeat = v6 + 1;
    }
  }
  else
  {
    v5 = *MEMORY[0x1E0D18F58];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v13 = "-[CSVoiceTriggerFirstPassHearstAP audioStreamProvider:audioBufferAvailable:]_block_invoke";
      _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_DEFAULT, "%s Could not find Assets. Cannot process Audio", buf, 0xCu);
    }
  }
}

uint64_t __81__CSVoiceTriggerFirstPassHearstAP_audioStreamProvider_didStopStreamUnexpectedly___block_invoke(uint64_t a1)
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

void __49__CSVoiceTriggerFirstPassHearstAP__stopListening__block_invoke(uint64_t a1)
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
    v5 = "-[CSVoiceTriggerFirstPassHearstAP _stopListening]_block_invoke";
    _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s Scheduled stopAudioStream after waiting for recordingWillStartGroup", (uint8_t *)&v4, 0xCu);
  }
  objc_msgSend(*(id *)(a1 + 32), "audioStream");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stopAudioStreamWithOption:completion:", 0, &__block_literal_global_9270);

}

void __49__CSVoiceTriggerFirstPassHearstAP__stopListening__block_invoke_28(uint64_t a1, uint64_t a2, void *a3)
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
      v8 = "-[CSVoiceTriggerFirstPassHearstAP _stopListening]_block_invoke";
      v9 = 2114;
      v10 = v6;
      _os_log_error_impl(&dword_1C2614000, v5, OS_LOG_TYPE_ERROR, "%s Cannot stop listening : %{public}@", (uint8_t *)&v7, 0x16u);

    }
  }

}

void __80__CSVoiceTriggerFirstPassHearstAP__startListenWithAudioProviderUUID_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;

  v5 = a3;
  v10 = v5;
  if ((a2 & 1) == 0)
  {
    v6 = (void *)MEMORY[0x1C3BC4590]();
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(v7 + 168);
    *(_QWORD *)(v7 + 168) = 0;

    objc_autoreleasePoolPop(v6);
    v5 = v10;
  }
  v9 = *(_QWORD *)(a1 + 40);
  if (v9)
  {
    (*(void (**)(uint64_t, uint64_t, id))(v9 + 16))(v9, a2, v10);
    v5 = v10;
  }

}

void __80__CSVoiceTriggerFirstPassHearstAP__startListenWithAudioProviderUUID_completion___block_invoke_24(uint64_t a1, char a2, void *a3)
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
  v10[2] = __80__CSVoiceTriggerFirstPassHearstAP__startListenWithAudioProviderUUID_completion___block_invoke_2;
  v10[3] = &unk_1E7C29100;
  v10[4] = v6;
  v13 = a2;
  v11 = v5;
  v12 = v7;
  v9 = v5;
  dispatch_async(v8, v10);

}

uint64_t __80__CSVoiceTriggerFirstPassHearstAP__startListenWithAudioProviderUUID_completion___block_invoke_2(uint64_t a1)
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
    v8 = "-[CSVoiceTriggerFirstPassHearstAP _startListenWithAudioProviderUUID:completion:]_block_invoke_2";
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
        v8 = "-[CSVoiceTriggerFirstPassHearstAP _startListenWithAudioProviderUUID:completion:]_block_invoke";
        _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_DEFAULT, "%s didStartRecording received when CSVoiceTriggerFirstPassHearstAP is turned off", (uint8_t *)&v7, 0xCu);
        v4 = *(_BYTE **)(a1 + 32);
      }
      objc_msgSend(v4, "_stopListening");
    }
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

uint64_t __44__CSVoiceTriggerFirstPassHearstAP_setAsset___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setAsset:", *(_QWORD *)(a1 + 40));
}

void __40__CSVoiceTriggerFirstPassHearstAP_start__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  CSVoiceTriggerUserSelectedPhrase *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  id location;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = 0;
  v2 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v2 + 144))
  {
    +[CSVoiceTriggerHearstAPEnabledPolicy sharedInstance](CSVoiceTriggerHearstAPEnabledPolicy, "sharedInstance");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 144);
    *(_QWORD *)(v4 + 144) = v3;

    v2 = *(_QWORD *)(a1 + 32);
  }
  v6 = *(void **)(v2 + 112);
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0D191F0], "sharedInstance");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(void **)(v8 + 112);
    *(_QWORD *)(v8 + 112) = v7;

    v6 = *(void **)(*(_QWORD *)(a1 + 32) + 112);
  }
  objc_msgSend(v6, "registerObserver:");
  v10 = *(_QWORD **)(a1 + 32);
  if (!v10[16])
  {
    +[CSOpportuneSpeakEventMonitor sharedInstance](CSOpportuneSpeakEventMonitor, "sharedInstance");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(a1 + 32);
    v13 = *(void **)(v12 + 128);
    *(_QWORD *)(v12 + 128) = v11;

    v10 = *(_QWORD **)(a1 + 32);
  }
  objc_msgSend(v10, "multiPhraseSelectedStatus");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    v15 = *(void **)(a1 + 32);
    v16 = -[CSVoiceTriggerUserSelectedPhrase initWithEndpointId:]([CSVoiceTriggerUserSelectedPhrase alloc], "initWithEndpointId:", 0);
    objc_msgSend(v15, "setMultiPhraseSelectedStatus:", v16);

  }
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "isEnabled"))
    objc_msgSend(*(id *)(a1 + 32), "_transitHearstAPEnable:", 1);
  objc_initWeak(&location, *(id *)(a1 + 32));
  v17 = *(void **)(*(_QWORD *)(a1 + 32) + 144);
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __40__CSVoiceTriggerFirstPassHearstAP_start__block_invoke_2;
  v18[3] = &unk_1E7C26D40;
  objc_copyWeak(&v19, &location);
  objc_msgSend(v17, "setCallback:", v18);
  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

void __40__CSVoiceTriggerFirstPassHearstAP_start__block_invoke_2(uint64_t a1, uint64_t a2)
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
    v8 = "-[CSVoiceTriggerFirstPassHearstAP start]_block_invoke_2";
    v9 = 2114;
    v10 = v5;
    _os_log_impl(&dword_1C2614000, v4, OS_LOG_TYPE_DEFAULT, "%s VoiceTrigger HearstAP start policy changed : %{public}@", (uint8_t *)&v7, 0x16u);
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_transitHearstAPEnable:", a2);

}

@end
