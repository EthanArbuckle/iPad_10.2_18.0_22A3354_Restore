@implementation CSVoiceTriggerFirstPassJarvis

- (CSVoiceTriggerFirstPassJarvis)initWithSpeechManager:(id)a3 otherAppRecordingStateMonitor:(id)a4
{
  id v7;
  id v8;
  CSVoiceTriggerFirstPassJarvis *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *queue;
  NSObject *v12;
  NSObject *v13;
  float v14;
  void *v15;
  uint64_t v16;
  NSMutableArray *assetConfigWaitingBuffer;
  void **p_speechManager;
  uint64_t v19;
  void *v20;
  void **p_otherAppRecordingStateMonitor;
  uint64_t v22;
  void *v23;
  objc_super v25;

  v7 = a3;
  v8 = a4;
  v25.receiver = self;
  v25.super_class = (Class)CSVoiceTriggerFirstPassJarvis;
  v9 = -[CSVoiceTriggerFirstPassJarvis init](&v25, sel_init);
  if (v9)
  {
    v10 = dispatch_queue_create("VoiceTriggerFirstPassJarvis Queue", 0);
    queue = v9->_queue;
    v9->_queue = (OS_dispatch_queue *)v10;

    v12 = v9->_queue;
    dispatch_get_global_queue(33, 0);
    v13 = objc_claimAutoreleasedReturnValue();
    dispatch_set_target_queue(v12, v13);

    v9->_numProcessedSamples = 0;
    v9->_activeChannel = objc_msgSend(MEMORY[0x1E0D19090], "channelForProcessedInput");
    objc_msgSend(MEMORY[0x1E0D19090], "inputRecordingSampleRate");
    v9->_jarvisVoiceTriggerTimeout = (unint64_t)(float)(v14 * 3.0);
    -[CSVoiceTriggerFirstPassJarvis _clearTriggerCandidate](v9, "_clearTriggerCandidate");
    objc_msgSend(MEMORY[0x1E0D19130], "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObserver:", v9);

    v9->_firstTimeAssetConfigured = 0;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v16 = objc_claimAutoreleasedReturnValue();
    assetConfigWaitingBuffer = v9->_assetConfigWaitingBuffer;
    v9->_assetConfigWaitingBuffer = (NSMutableArray *)v16;

    v9->_latestTriggerMode = -1;
    p_speechManager = (void **)&v9->_speechManager;
    objc_storeStrong((id *)&v9->_speechManager, a3);
    if (!v9->_speechManager)
    {
      +[CSSpeechManager sharedManagerForCoreSpeechDaemon](CSSpeechManager, "sharedManagerForCoreSpeechDaemon");
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = *p_speechManager;
      *p_speechManager = (void *)v19;

    }
    p_otherAppRecordingStateMonitor = (void **)&v9->_otherAppRecordingStateMonitor;
    objc_storeStrong((id *)&v9->_otherAppRecordingStateMonitor, a4);
    if (!v9->_otherAppRecordingStateMonitor)
    {
      objc_msgSend(MEMORY[0x1E0D19198], "sharedInstance");
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = *p_otherAppRecordingStateMonitor;
      *p_otherAppRecordingStateMonitor = (void *)v22;

    }
  }

  return v9;
}

- (CSVoiceTriggerFirstPassJarvis)init
{
  return -[CSVoiceTriggerFirstPassJarvis initWithSpeechManager:otherAppRecordingStateMonitor:](self, "initWithSpeechManager:otherAppRecordingStateMonitor:", 0, 0);
}

- (void)start
{
  NSObject *v3;
  NSObject *queue;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0D18F58];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v7 = "-[CSVoiceTriggerFirstPassJarvis start]";
    _os_log_impl(&dword_1C2614000, v3, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__CSVoiceTriggerFirstPassJarvis_start__block_invoke;
  block[3] = &unk_1E7C292C8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)reset
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__CSVoiceTriggerFirstPassJarvis_reset__block_invoke;
  block[3] = &unk_1E7C292C8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_reset
{
  -[CSKeywordAnalyzerNDEAPI reset](self->_keywordAnalyzerNDEAPI, "reset");
  self->_numProcessedSamples = 0;
  -[CSVoiceTriggerFirstPassJarvis _clearTriggerCandidate](self, "_clearTriggerCandidate");
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
  v7[2] = __42__CSVoiceTriggerFirstPassJarvis_setAsset___block_invoke;
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
  CSVoiceTriggerRTModel *v7;
  CSVoiceTriggerRTModel *rtModel;
  NSObject *v9;
  int v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "logAssetVersionForInsight");
    objc_storeStrong((id *)&self->_currentAsset, a3);
    objc_msgSend(v6, "RTModelWithFallbackLanguage:", CFSTR("en-US"));
    v7 = (CSVoiceTriggerRTModel *)objc_claimAutoreleasedReturnValue();
    rtModel = self->_rtModel;
    self->_rtModel = v7;

    -[CSVoiceTriggerFirstPassJarvis _reset](self, "_reset");
    -[CSVoiceTriggerSecondPass setAsset:](self->_voiceTriggerSecondPass, "setAsset:", v6);
    if (!self->_firstTimeAssetConfigured)
      self->_firstTimeAssetConfigured = 1;
  }
  else
  {
    v9 = *MEMORY[0x1E0D18F58];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_ERROR))
    {
      v10 = 136315138;
      v11 = "-[CSVoiceTriggerFirstPassJarvis _setAsset:]";
      _os_log_error_impl(&dword_1C2614000, v9, OS_LOG_TYPE_ERROR, "%s asset is nil, stop initialization", (uint8_t *)&v10, 0xCu);
    }
  }

}

- (void)_clearTriggerCandidate
{
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0D18F58];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[CSVoiceTriggerFirstPassJarvis _clearTriggerCandidate]";
    _os_log_impl(&dword_1C2614000, v3, OS_LOG_TYPE_DEFAULT, "%s Clearing VoiceTrigger candidate in the voiceTriggerJarvis", (uint8_t *)&v4, 0xCu);
  }
  self->_hasTriggerCandidate = 0;
}

- (void)_didStartAudioStream
{
  void *v3;
  int v4;
  void *v5;
  NSObject *v6;
  id v7;
  void *v8;
  CSPlainAudioFileWriter *v9;
  CSPlainAudioFileWriter *audioFileWriter;
  CSPlainAudioFileWriter *v11;
  int v12;
  const char *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  kdebug_trace();
  -[CSSPGEndpointAnalyzer start](self->_endpointAnalyzer, "start");
  objc_msgSend(MEMORY[0x1E0D19110], "sharedPreferences");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "jarvisAudioLoggingEnabled");

  if (v4)
  {
    +[CSVoiceTriggerFirstPassJarvis jarvisAudioLoggingFilePath](CSVoiceTriggerFirstPassJarvis, "jarvisAudioLoggingFilePath");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *MEMORY[0x1E0D18F58];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT))
    {
      v12 = 136315394;
      v13 = "-[CSVoiceTriggerFirstPassJarvis _didStartAudioStream]";
      v14 = 2114;
      v15 = v5;
      _os_log_impl(&dword_1C2614000, v6, OS_LOG_TYPE_DEFAULT, "%s Jarvis firstpass writing audio file into %{public}@", (uint8_t *)&v12, 0x16u);
    }
    v7 = objc_alloc(MEMORY[0x1E0D191B0]);
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (CSPlainAudioFileWriter *)objc_msgSend(v7, "initWithURL:", v8);
    audioFileWriter = self->_audioFileWriter;
    self->_audioFileWriter = v9;

  }
  else
  {
    v11 = self->_audioFileWriter;
    self->_audioFileWriter = 0;

  }
}

- (void)_didStopAudioStream
{
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0D18F58];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[CSVoiceTriggerFirstPassJarvis _didStopAudioStream]";
    _os_log_impl(&dword_1C2614000, v3, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v4, 0xCu);
  }
  kdebug_trace();
  -[CSVoiceTriggerFirstPassJarvis _clearTriggerCandidate](self, "_clearTriggerCandidate");
  -[CSSPGEndpointAnalyzer stop](self->_endpointAnalyzer, "stop");
  -[CSPlainAudioFileWriter endAudio](self->_audioFileWriter, "endAudio");
}

- (void)audioStreamProvider:(id)a3 didStopStreamUnexpectedly:(int64_t)a4
{
  NSObject *queue;
  _QWORD v5[6];

  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __79__CSVoiceTriggerFirstPassJarvis_audioStreamProvider_didStopStreamUnexpectedly___block_invoke;
  v5[3] = &unk_1E7C29178;
  v5[4] = self;
  v5[5] = a4;
  dispatch_async(queue, v5);
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
  v8[2] = __74__CSVoiceTriggerFirstPassJarvis_audioStreamProvider_audioBufferAvailable___block_invoke;
  v8[3] = &unk_1E7C292A0;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(queue, v8);

}

- (void)_handleAudioChunk:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  _BOOL4 isSecondPassRunning;
  _BOOL4 isSiriClientListening;
  unint64_t numProcessedSamples;
  unint64_t v11;
  CSPlainAudioFileWriter *audioFileWriter;
  id v13;
  id v14;
  CSSPGEndpointAnalyzer *endpointAnalyzer;
  void *v16;
  NSObject *v17;
  int v18;
  const char *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  _BOOL4 v23;
  __int16 v24;
  _BOOL4 v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = _handleAudioChunk__heartbeat_CORESPEECH_VOICETRIGGER_FIRSTPASS_LPCM_RECORD_BUFFER_AVAILABLE;
  if (__ROR8__(0xEEEEEEEEEEEEEEEFLL* _handleAudioChunk__heartbeat_CORESPEECH_VOICETRIGGER_FIRSTPASS_LPCM_RECORD_BUFFER_AVAILABLE, 1) <= 0x888888888888888uLL)
  {
    kdebug_trace();
    v5 = _handleAudioChunk__heartbeat_CORESPEECH_VOICETRIGGER_FIRSTPASS_LPCM_RECORD_BUFFER_AVAILABLE;
  }
  _handleAudioChunk__heartbeat_CORESPEECH_VOICETRIGGER_FIRSTPASS_LPCM_RECORD_BUFFER_AVAILABLE = v5 + 1;
  if (self->_currentAsset)
  {
    v6 = _handleAudioChunk__heartbeat;
    if (__ROR8__(0xCCCCCCCCCCCCCCCDLL * _handleAudioChunk__heartbeat, 2) <= 0xCCCCCCCCCCCCCCCuLL)
    {
      v7 = *MEMORY[0x1E0D18F58];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_INFO))
      {
        isSecondPassRunning = self->_isSecondPassRunning;
        isSiriClientListening = self->_isSiriClientListening;
        v18 = 136315906;
        v19 = "-[CSVoiceTriggerFirstPassJarvis _handleAudioChunk:]";
        v20 = 2050;
        v21 = v6;
        v22 = 1026;
        v23 = isSecondPassRunning;
        v24 = 1026;
        v25 = isSiriClientListening;
        _os_log_impl(&dword_1C2614000, v7, OS_LOG_TYPE_INFO, "%s NDEAPI Jarvis first pass heart beat %{public}llu, isSecondPassRunning? %{public}d, isSiriClientListening? %{public}d", (uint8_t *)&v18, 0x22u);
        v6 = _handleAudioChunk__heartbeat;
      }
    }
    _handleAudioChunk__heartbeat = v6 + 1;
    if (!self->_isSecondPassRunning && !self->_isSiriClientListening)
    {
      numProcessedSamples = self->_numProcessedSamples;
      v11 = objc_msgSend(v4, "numSamples") + numProcessedSamples;
      audioFileWriter = self->_audioFileWriter;
      objc_msgSend(v4, "data");
      v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      -[CSPlainAudioFileWriter addSamples:numSamples:](audioFileWriter, "addSamples:numSamples:", objc_msgSend(v13, "bytes"), objc_msgSend(v4, "numSamples"));

      if (v11 < self->_jarvisVoiceTriggerTimeout || self->_hasReceivedNDEAPIResult)
      {
        v14 = (id)-[CSKeywordAnalyzerNDEAPI processAudioChunk:](self->_keywordAnalyzerNDEAPI, "processAudioChunk:", v4);
        self->_numProcessedSamples += objc_msgSend(v4, "numSamples");
        endpointAnalyzer = self->_endpointAnalyzer;
        objc_msgSend(v4, "dataForChannel:", self->_activeChannel);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[CSSPGEndpointAnalyzer addAudio:numSamples:](endpointAnalyzer, "addAudio:numSamples:", v16, objc_msgSend(v4, "numSamples"));

      }
      else
      {
        -[CSVoiceTriggerFirstPassJarvis _notifyJarvisVoiceTriggerReject](self, "_notifyJarvisVoiceTriggerReject");
      }
    }
  }
  else
  {
    v17 = *MEMORY[0x1E0D18F58];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_ERROR))
    {
      v18 = 136315138;
      v19 = "-[CSVoiceTriggerFirstPassJarvis _handleAudioChunk:]";
      _os_log_error_impl(&dword_1C2614000, v17, OS_LOG_TYPE_ERROR, "%s Could not find Assets. Cannot process Audio", (uint8_t *)&v18, 0xCu);
    }
  }

}

- (void)keywordAnalyzerNDEAPI:(id)a3 hasResultAvailable:(id)a4 forChannel:(unint64_t)a5
{
  id v7;
  id v8;
  __CFNotificationCenter *DarwinNotifyCenter;
  NSObject *v10;
  int v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!self->_hasReceivedNDEAPIResult)
  {
    self->_hasReceivedNDEAPIResult = 1;
    objc_storeStrong((id *)&self->_jarvisTriggerResult, a4);
    -[CSVoiceTriggerFirstPassJarvis _reportJarvisVoiceTriggerFire](self, "_reportJarvisVoiceTriggerFire");
    -[CSVoiceTriggerFirstPassJarvis _reset](self, "_reset");
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.siri.myriad.jarvis"), 0, 0, 1u);
    v10 = *MEMORY[0x1E0D18F58];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT))
    {
      v11 = 136315138;
      v12 = "-[CSVoiceTriggerFirstPassJarvis keywordAnalyzerNDEAPI:hasResultAvailable:forChannel:]";
      _os_log_impl(&dword_1C2614000, v10, OS_LOG_TYPE_DEFAULT, "%s Send Jarvis Myriad notification", (uint8_t *)&v11, 0xCu);
    }
  }
  objc_msgSend(v7, "reset");

}

- (void)activationEventNotificationHandler:(id)a3 event:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD, uint64_t);
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  uint64_t v19;
  _QWORD v20[4];
  void (**v21)(id, _QWORD, uint64_t);
  id v22;
  _BYTE location[12];
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD, uint64_t))a5;
  if (objc_msgSend(v9, "type") != 6)
  {
    if (!v10)
      goto LABEL_14;
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18E80], 114, 0);
    v13 = objc_claimAutoreleasedReturnValue();
LABEL_8:
    v14 = (void *)v13;
    v10[2](v10, 0, v13);

    goto LABEL_14;
  }
  if (!-[CSOtherAppRecordingStateMonitor isOtherNonEligibleAppRecording](self->_otherAppRecordingStateMonitor, "isOtherNonEligibleAppRecording"))
  {
    objc_msgSend(MEMORY[0x1E0D19110], "sharedPreferences");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "voiceTriggerEnabled");

    if (v16)
    {
      objc_initWeak((id *)location, self);
      objc_msgSend(v9, "deviceId");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "activationInfo");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v9, "hosttime");
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __85__CSVoiceTriggerFirstPassJarvis_activationEventNotificationHandler_event_completion___block_invoke;
      v20[3] = &unk_1E7C24680;
      objc_copyWeak(&v22, (id *)location);
      v21 = v10;
      -[CSVoiceTriggerFirstPassJarvis _didDetectKeywordFromDeviceId:activationInfo:triggerHostTime:completion:](self, "_didDetectKeywordFromDeviceId:activationInfo:triggerHostTime:completion:", v17, v18, v19, v20);

      objc_destroyWeak(&v22);
      objc_destroyWeak((id *)location);
      goto LABEL_14;
    }
    if (!v10)
      goto LABEL_14;
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18E80], 604, 0);
    v13 = objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  v11 = *MEMORY[0x1E0D18F58];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)location = 136315394;
    *(_QWORD *)&location[4] = "-[CSVoiceTriggerFirstPassJarvis activationEventNotificationHandler:event:completion:]";
    v24 = 2114;
    v25 = v9;
    _os_log_error_impl(&dword_1C2614000, v11, OS_LOG_TYPE_ERROR, "%s Ignore %{public}@ since there is an other non eligible app recording", location, 0x16u);
    if (!v10)
      goto LABEL_14;
    goto LABEL_5;
  }
  if (v10)
  {
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18E80], 610, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, 0, (uint64_t)v12);

  }
LABEL_14:

}

- (void)spgEndpointAnalyzerDidDetectEndpoint:(id)a3
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__CSVoiceTriggerFirstPassJarvis_spgEndpointAnalyzerDidDetectEndpoint___block_invoke;
  block[3] = &unk_1E7C292C8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_handleJarvisVoiceTriggerFromDeviceId:(id)a3 activationInfo:(id)a4 triggerHostTime:(unint64_t)a5 completion:(id)a6
{
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  void (**v13)(_QWORD, _QWORD, _QWORD);
  id v14;
  void *v15;
  CSKeywordAnalyzerNDEAPI *v16;
  CSKeywordAnalyzerNDEAPI *keywordAnalyzerNDEAPI;
  float v18;
  void *v19;
  CSSPGEndpointAnalyzer *v20;
  double v21;
  CSSPGEndpointAnalyzer *v22;
  CSSPGEndpointAnalyzer *endpointAnalyzer;
  float v24;
  float v25;
  NSObject *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  unint64_t v35;
  _QWORD v36[5];
  void (**v37)(_QWORD, _QWORD, _QWORD);
  _QWORD v38[4];
  id v39;
  uint8_t buf[4];
  const char *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a6;
  v11 = MEMORY[0x1E0C809B0];
  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = __113__CSVoiceTriggerFirstPassJarvis__handleJarvisVoiceTriggerFromDeviceId_activationInfo_triggerHostTime_completion___block_invoke;
  v38[3] = &unk_1E7C290D8;
  v12 = v10;
  v39 = v12;
  v13 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1C3BC4734](v38);
  if (!self->_rtModel)
  {
    v26 = *MEMORY[0x1E0D18F58];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v41 = "-[CSVoiceTriggerFirstPassJarvis _handleJarvisVoiceTriggerFromDeviceId:activationInfo:triggerHostTime:completion:]";
      _os_log_error_impl(&dword_1C2614000, v26, OS_LOG_TYPE_ERROR, "%s rtModel is nil!", buf, 0xCu);
    }
    v27 = (void *)MEMORY[0x1E0CB35C8];
    v28 = *MEMORY[0x1E0D18E80];
    v29 = 114;
    goto LABEL_11;
  }
  v14 = objc_alloc(MEMORY[0x1E0D19140]);
  -[CSVoiceTriggerRTModel modelData](self->_rtModel, "modelData");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (CSKeywordAnalyzerNDEAPI *)objc_msgSend(v14, "initWithBlob:", v15);
  keywordAnalyzerNDEAPI = self->_keywordAnalyzerNDEAPI;
  self->_keywordAnalyzerNDEAPI = v16;

  -[CSKeywordAnalyzerNDEAPI setActiveChannel:](self->_keywordAnalyzerNDEAPI, "setActiveChannel:", self->_activeChannel);
  -[CSKeywordAnalyzerNDEAPI setDelegate:](self->_keywordAnalyzerNDEAPI, "setDelegate:", self);
  if (!self->_keywordAnalyzerNDEAPI)
  {
    v30 = *MEMORY[0x1E0D18F58];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v41 = "-[CSVoiceTriggerFirstPassJarvis _handleJarvisVoiceTriggerFromDeviceId:activationInfo:triggerHostTime:completion:]";
      _os_log_error_impl(&dword_1C2614000, v30, OS_LOG_TYPE_ERROR, "%s keywordAnalyzerNDEAPI is nil!", buf, 0xCu);
    }
    v27 = (void *)MEMORY[0x1E0CB35C8];
    v28 = *MEMORY[0x1E0D18E80];
    v29 = 506;
LABEL_11:
    objc_msgSend(v27, "errorWithDomain:code:userInfo:", v28, v29, 0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, void *))v13)[2](v13, 0, v31);
    goto LABEL_17;
  }
  self->_hasReceivedNDEAPIResult = 0;
  objc_msgSend(MEMORY[0x1E0D19090], "inputRecordingSampleRate");
  self->_jarvisVoiceTriggerTimeout = (unint64_t)(float)(v18 * 3.0);
  objc_msgSend(MEMORY[0x1E0D19130], "sharedInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  self->_latestTriggerMode = objc_msgSend(v19, "getTriggerMode");

  if (self->_latestTriggerMode == 2)
  {
    v20 = [CSSPGEndpointAnalyzer alloc];
    LODWORD(v21) = 1161527296;
    v22 = -[CSSPGEndpointAnalyzer initWithEndpointThreshold:](v20, "initWithEndpointThreshold:", v21);
    endpointAnalyzer = self->_endpointAnalyzer;
    self->_endpointAnalyzer = v22;

    -[CSSPGEndpointAnalyzer setDelegate:](self->_endpointAnalyzer, "setDelegate:", self);
    objc_msgSend(MEMORY[0x1E0D19090], "inputRecordingSampleRate");
    self->_jarvisVoiceTriggerTimeout = (unint64_t)(float)(v24 * 60.0);
    v25 = 0.5;
  }
  else
  {
    v25 = 1.1;
  }
  objc_msgSend(MEMORY[0x1E0D19008], "contextForJarvisWithDeviceId:", v9);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D19030], "noAlertOption");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setRequestHistoricalAudioDataWithHostTime:", 1);
  *(float *)&v33 = v25;
  if (objc_msgSend(MEMORY[0x1E0D19118], "secondsToHostTime:", v33) >= a5)
  {
    v35 = 0;
  }
  else
  {
    *(float *)&v34 = v25;
    v35 = a5 - objc_msgSend(MEMORY[0x1E0D19118], "secondsToHostTime:", v34);
  }
  objc_msgSend(v32, "setStartRecordingHostTime:", v35);
  v36[0] = v11;
  v36[1] = 3221225472;
  v36[2] = __113__CSVoiceTriggerFirstPassJarvis__handleJarvisVoiceTriggerFromDeviceId_activationInfo_triggerHostTime_completion___block_invoke_26;
  v36[3] = &unk_1E7C29128;
  v36[4] = self;
  v37 = v13;
  -[CSVoiceTriggerFirstPassJarvis _requestStartAudioStreamWitContext:startStreamOption:completion:](self, "_requestStartAudioStreamWitContext:startStreamOption:completion:", v31, v32, v36);

LABEL_17:
}

- (void)_requestStartAudioStreamWitContext:(id)a3 startStreamOption:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void (**v12)(_QWORD, _QWORD, _QWORD);
  CSSpeechManager *speechManager;
  void *v14;
  id v15;
  id v16;
  objc_class *v17;
  void *v18;
  void *v19;
  id v20;
  _QWORD v21[5];
  void (**v22)(_QWORD, _QWORD, _QWORD);
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;

  v8 = a4;
  v9 = a5;
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __97__CSVoiceTriggerFirstPassJarvis__requestStartAudioStreamWitContext_startStreamOption_completion___block_invoke;
  v25[3] = &unk_1E7C290D8;
  v10 = v9;
  v26 = v10;
  v11 = a3;
  v12 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1C3BC4734](v25);
  speechManager = self->_speechManager;
  v24 = 0;
  -[CSSpeechManager audioProviderWithContext:error:](speechManager, "audioProviderWithContext:error:", v11, &v24);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = v24;
  if (v14)
  {
    -[CSVoiceTriggerFirstPassJarvis setAudioProvider:](self, "setAudioProvider:", v14);
    v16 = objc_alloc_init(MEMORY[0x1E0D19058]);
    objc_msgSend(v16, "setRequiresHistoricalBuffer:", 1);
    v17 = (objc_class *)objc_opt_class();
    NSStringFromClass(v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0;
    objc_msgSend(v14, "audioStreamWithRequest:streamName:error:", v16, v18, &v23);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v23;

    if (v19)
    {
      -[CSVoiceTriggerFirstPassJarvis setAudioStream:](self, "setAudioStream:", v19);
      objc_msgSend(v19, "setDelegate:", self);
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __97__CSVoiceTriggerFirstPassJarvis__requestStartAudioStreamWitContext_startStreamOption_completion___block_invoke_2;
      v21[3] = &unk_1E7C29128;
      v21[4] = self;
      v22 = v12;
      objc_msgSend(v19, "startAudioStreamWithOption:completion:", v8, v21);

    }
    else
    {
      ((void (**)(_QWORD, _QWORD, id))v12)[2](v12, 0, v20);
    }

  }
  else
  {
    ((void (**)(_QWORD, _QWORD, id))v12)[2](v12, 0, v15);
  }

}

- (void)_didDetectKeywordFromDeviceId:(id)a3 activationInfo:(id)a4 triggerHostTime:(unint64_t)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *queue;
  id v14;
  id v15;
  id v16;
  _QWORD block[5];
  id v18;
  id v19;
  id v20;
  unint64_t v21;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __105__CSVoiceTriggerFirstPassJarvis__didDetectKeywordFromDeviceId_activationInfo_triggerHostTime_completion___block_invoke;
  block[3] = &unk_1E7C246A8;
  v20 = v12;
  v21 = a5;
  block[4] = self;
  v18 = v11;
  v19 = v10;
  v14 = v12;
  v15 = v10;
  v16 = v11;
  dispatch_async(queue, block);

}

- (void)_notifyJarvisVoiceTriggerReject
{
  NSObject *v3;
  unint64_t numProcessedSamples;
  void *v5;
  _QWORD v6[5];
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  unint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0D18F58];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT))
  {
    numProcessedSamples = self->_numProcessedSamples;
    *(_DWORD *)buf = 136315394;
    v8 = "-[CSVoiceTriggerFirstPassJarvis _notifyJarvisVoiceTriggerReject]";
    v9 = 2050;
    v10 = numProcessedSamples;
    _os_log_impl(&dword_1C2614000, v3, OS_LOG_TYPE_DEFAULT, "%s Notify jarvis handler reject at: %{public}tu", buf, 0x16u);
  }
  self->_hasReceivedNDEAPIResult = 1;
  -[CSVoiceTriggerFirstPassJarvis _reset](self, "_reset");
  -[CSVoiceTriggerFirstPassJarvis audioStream](self, "audioStream");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __64__CSVoiceTriggerFirstPassJarvis__notifyJarvisVoiceTriggerReject__block_invoke;
  v6[3] = &unk_1E7C29060;
  v6[4] = self;
  objc_msgSend(v5, "stopAudioStreamWithOption:completion:", 0, v6);

  -[CSVoiceTriggerFirstPassJarvis _cancelAudioStreamHold](self, "_cancelAudioStreamHold");
}

- (void)_reportJarvisVoiceTriggerFire
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  CSVoiceTriggerSecondPassRequestOption *v11;
  NSString *deviceId;
  void *v13;
  void *v14;
  void *v15;
  CSVoiceTriggerSecondPassRequestOption *v16;
  CSVoiceTriggerSecondPass *voiceTriggerSecondPass;
  CSVoiceTriggerFirstPassMetrics *firstpassMetrics;
  _QWORD v19[6];
  id v20;
  id location;
  _BYTE buf[24];
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  _QWORD v26[5];
  _QWORD v27[6];

  v27[5] = *MEMORY[0x1E0C80C00];
  v26[0] = *MEMORY[0x1E0D19618];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_activeChannel);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v3;
  v26[1] = *MEMORY[0x1E0D19650];
  v4 = (void *)MEMORY[0x1E0CB37E8];
  -[CSKeywordAnalyzerNDEAPIResult bestScore](self->_jarvisTriggerResult, "bestScore");
  objc_msgSend(v4, "numberWithFloat:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v5;
  v26[2] = *MEMORY[0x1E0D19658];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[CSKeywordAnalyzerNDEAPIResult bestStart](self->_jarvisTriggerResult, "bestStart"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v27[2] = v6;
  v26[3] = *MEMORY[0x1E0D19620];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[CSKeywordAnalyzerNDEAPIResult bestEnd](self->_jarvisTriggerResult, "bestEnd"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v27[3] = v7;
  v26[4] = *MEMORY[0x1E0D195E8];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_earlyDetectFiredMachTime);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v27[4] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = *MEMORY[0x1E0D18F58];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "-[CSVoiceTriggerFirstPassJarvis _reportJarvisVoiceTriggerFire]";
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v9;
    _os_log_impl(&dword_1C2614000, v10, OS_LOG_TYPE_DEFAULT, "%s %{public}@", buf, 0x16u);
  }
  kdebug_trace();
  self->_isSecondPassRunning = 1;
  -[CSVoiceTriggerFirstPassJarvis _clearTriggerCandidate](self, "_clearTriggerCandidate");
  -[CSSPGEndpointAnalyzer stop](self->_endpointAnalyzer, "stop");
  -[CSPlainAudioFileWriter endAudio](self->_audioFileWriter, "endAudio");
  objc_initWeak(&location, self);
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v23 = __Block_byref_object_copy__4378;
  v24 = __Block_byref_object_dispose__4379;
  objc_msgSend(MEMORY[0x1E0D19130], "triggerModeStringDescription:", self->_latestTriggerMode);
  v25 = (id)objc_claimAutoreleasedReturnValue();
  -[CSVoiceTriggerFirstPassJarvis _createSecondPassIfNeeded](self, "_createSecondPassIfNeeded");
  v11 = [CSVoiceTriggerSecondPassRequestOption alloc];
  deviceId = self->_deviceId;
  -[CSVoiceTriggerFirstPassJarvis audioProvider](self, "audioProvider");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "UUID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[CSVoiceTriggerSecondPassRequestOption initWithFirstPassSource:deviceId:audioProviderUUID:firstPassInfo:rejectionMHUUID:isSecondChanceRun:firstpassMetrics:rtModelRequestOptions:](v11, "initWithFirstPassSource:deviceId:audioProviderUUID:firstPassInfo:rejectionMHUUID:isSecondChanceRun:firstpassMetrics:rtModelRequestOptions:", 4, deviceId, v14, v9, v15, -[CSVoiceTriggerSecondChanceContext shouldRunAsSecondChance](self->_secondChanceContext, "shouldRunAsSecondChance"), self->_firstpassMetrics, 0);

  -[CSVoiceTriggerSecondPass setSupportsMultiPhraseDetection:](self->_voiceTriggerSecondPass, "setSupportsMultiPhraseDetection:", -[CSVoiceTriggerUserSelectedPhrase multiPhraseSelected](self->_multiPhraseSelectedStatus, "multiPhraseSelected"));
  voiceTriggerSecondPass = self->_voiceTriggerSecondPass;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __62__CSVoiceTriggerFirstPassJarvis__reportJarvisVoiceTriggerFire__block_invoke;
  v19[3] = &unk_1E7C246D0;
  v19[5] = buf;
  objc_copyWeak(&v20, &location);
  v19[4] = self;
  -[CSVoiceTriggerSecondPass handleVoiceTriggerSecondPassFrom:completion:](voiceTriggerSecondPass, "handleVoiceTriggerSecondPassFrom:completion:", v16, v19);
  firstpassMetrics = self->_firstpassMetrics;
  self->_firstpassMetrics = 0;

  objc_destroyWeak(&v20);
  _Block_object_dispose(buf, 8);

  objc_destroyWeak(&location);
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
  NSObject *queue;
  _QWORD v31[6];
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  _BYTE v35[14];
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
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
    *(_DWORD *)buf = 136315906;
    v33 = "-[CSVoiceTriggerFirstPassJarvis _handleSecondPassResult:deviceId:error:]";
    v34 = 1026;
    *(_DWORD *)v35 = v11;
    *(_WORD *)&v35[4] = 2114;
    *(_QWORD *)&v35[6] = v12;
    v36 = 2114;
    v37 = v16;
    _os_log_impl(&dword_1C2614000, v15, OS_LOG_TYPE_DEFAULT, "%s Second Pass Result, %{public}d, %{public}@, %{public}@", buf, 0x26u);

  }
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
        *(_DWORD *)buf = 136315394;
        v33 = "-[CSVoiceTriggerFirstPassJarvis _handleSecondPassResult:deviceId:error:]";
        v34 = 2114;
        *(_QWORD *)v35 = v25;
        _os_log_error_impl(&dword_1C2614000, v19, OS_LOG_TYPE_ERROR, "%s VoiceTrigger Second Pass has failed : %{public}@", buf, 0x16u);

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

  queue = self->_queue;
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __72__CSVoiceTriggerFirstPassJarvis__handleSecondPassResult_deviceId_error___block_invoke;
  v31[3] = &unk_1E7C29178;
  v31[4] = self;
  v31[5] = v11;
  dispatch_async(queue, v31);

}

- (void)_createSecondPassIfNeeded
{
  CSVoiceTriggerSecondPass *v3;
  CSVoiceTriggerSecondPass *voiceTriggerSecondPass;

  if (!self->_voiceTriggerSecondPass)
  {
    v3 = -[CSVoiceTriggerSecondPass initWithPHSEnabled:]([CSVoiceTriggerSecondPass alloc], "initWithPHSEnabled:", 0);
    voiceTriggerSecondPass = self->_voiceTriggerSecondPass;
    self->_voiceTriggerSecondPass = v3;

    -[CSVoiceTriggerSecondPass setFirstPassSource:](self->_voiceTriggerSecondPass, "setFirstPassSource:", 4);
    -[CSVoiceTriggerSecondPass setSecondPassClient:](self->_voiceTriggerSecondPass, "setSecondPassClient:", 3);
    -[CSVoiceTriggerSecondPass setAsset:](self->_voiceTriggerSecondPass, "setAsset:", self->_currentAsset);
    -[CSVoiceTriggerSecondPass start](self->_voiceTriggerSecondPass, "start");
  }
}

- (void)_teardownSecondPass
{
  void *v3;
  CSVoiceTriggerSecondPass *voiceTriggerSecondPass;

  v3 = (void *)MEMORY[0x1C3BC4590](self, a2);
  voiceTriggerSecondPass = self->_voiceTriggerSecondPass;
  self->_voiceTriggerSecondPass = 0;

  objc_autoreleasePoolPop(v3);
}

- (void)_holdAudioStreamWithTimeout:(double)a3
{
  void *v4;
  CSAudioStreamHolding *v5;
  CSAudioStreamHolding *audioStreamHolding;
  id v7;

  objc_msgSend(MEMORY[0x1E0D19050], "defaultOptionWithTimeout:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[CSVoiceTriggerFirstPassJarvis audioProvider](self, "audioProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "holdAudioStreamWithDescription:option:", CFSTR("CSVoiceTriggerFirstPassJarvis"), v7);
  v5 = (CSAudioStreamHolding *)objc_claimAutoreleasedReturnValue();
  audioStreamHolding = self->_audioStreamHolding;
  self->_audioStreamHolding = v5;

}

- (void)_cancelAudioStreamHold
{
  void *v3;
  CSAudioStreamHolding *audioStreamHolding;

  -[CSVoiceTriggerFirstPassJarvis audioProvider](self, "audioProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancelAudioStreamHold:", self->_audioStreamHolding);

  audioStreamHolding = self->_audioStreamHolding;
  self->_audioStreamHolding = 0;

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
    v20 = "-[CSVoiceTriggerFirstPassJarvis siriClientBehaviorMonitor:didStartStreamWithContext:successfully:option:withEventUUID:]";
    _os_log_impl(&dword_1C2614000, v16, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  if (v9)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __119__CSVoiceTriggerFirstPassJarvis_siriClientBehaviorMonitor_didStartStreamWithContext_successfully_option_withEventUUID___block_invoke;
    block[3] = &unk_1E7C292C8;
    block[4] = self;
    dispatch_async(queue, block);
  }
  -[CSVoiceTriggerFirstPassJarvis _cancelAudioStreamHold](self, "_cancelAudioStreamHold");

}

- (void)siriClientBehaviorMonitor:(id)a3 didStopStream:(id)a4 withEventUUID:(id)a5
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __87__CSVoiceTriggerFirstPassJarvis_siriClientBehaviorMonitor_didStopStream_withEventUUID___block_invoke;
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
  block[2] = __81__CSVoiceTriggerFirstPassJarvis_siriClientBehaviorMonitor_willStopStream_reason___block_invoke;
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

- (CSAudioStream)audioStream
{
  return self->_audioStream;
}

- (void)setAudioStream:(id)a3
{
  objc_storeStrong((id *)&self->_audioStream, a3);
}

- (CSAudioProvider)audioProvider
{
  return self->_audioProvider;
}

- (void)setAudioProvider:(id)a3
{
  objc_storeStrong((id *)&self->_audioProvider, a3);
}

- (CSAudioStreamHolding)audioStreamHolding
{
  return self->_audioStreamHolding;
}

- (void)setAudioStreamHolding:(id)a3
{
  objc_storeStrong((id *)&self->_audioStreamHolding, a3);
}

- (CSAsset)currentAsset
{
  return self->_currentAsset;
}

- (void)setCurrentAsset:(id)a3
{
  objc_storeStrong((id *)&self->_currentAsset, a3);
}

- (CSKeywordAnalyzerNDEAPI)keywordAnalyzerNDEAPI
{
  return self->_keywordAnalyzerNDEAPI;
}

- (void)setKeywordAnalyzerNDEAPI:(id)a3
{
  objc_storeStrong((id *)&self->_keywordAnalyzerNDEAPI, a3);
}

- (BOOL)hasReceivedNDEAPIResult
{
  return self->_hasReceivedNDEAPIResult;
}

- (void)setHasReceivedNDEAPIResult:(BOOL)a3
{
  self->_hasReceivedNDEAPIResult = a3;
}

- (BOOL)hasTriggerCandidate
{
  return self->_hasTriggerCandidate;
}

- (void)setHasTriggerCandidate:(BOOL)a3
{
  self->_hasTriggerCandidate = a3;
}

- (unint64_t)numProcessedSamples
{
  return self->_numProcessedSamples;
}

- (void)setNumProcessedSamples:(unint64_t)a3
{
  self->_numProcessedSamples = a3;
}

- (unint64_t)jarvisVoiceTriggerTimeout
{
  return self->_jarvisVoiceTriggerTimeout;
}

- (void)setJarvisVoiceTriggerTimeout:(unint64_t)a3
{
  self->_jarvisVoiceTriggerTimeout = a3;
}

- (unint64_t)activeChannel
{
  return self->_activeChannel;
}

- (void)setActiveChannel:(unint64_t)a3
{
  self->_activeChannel = a3;
}

- (CSKeywordAnalyzerNDEAPIResult)jarvisTriggerResult
{
  return self->_jarvisTriggerResult;
}

- (void)setJarvisTriggerResult:(id)a3
{
  objc_storeStrong((id *)&self->_jarvisTriggerResult, a3);
}

- (unint64_t)earlyDetectFiredMachTime
{
  return self->_earlyDetectFiredMachTime;
}

- (void)setEarlyDetectFiredMachTime:(unint64_t)a3
{
  self->_earlyDetectFiredMachTime = a3;
}

- (int64_t)latestTriggerMode
{
  return self->_latestTriggerMode;
}

- (void)setLatestTriggerMode:(int64_t)a3
{
  self->_latestTriggerMode = a3;
}

- (CSSPGEndpointAnalyzer)endpointAnalyzer
{
  return self->_endpointAnalyzer;
}

- (void)setEndpointAnalyzer:(id)a3
{
  objc_storeStrong((id *)&self->_endpointAnalyzer, a3);
}

- (NSString)deviceId
{
  return self->_deviceId;
}

- (void)setDeviceId:(id)a3
{
  objc_storeStrong((id *)&self->_deviceId, a3);
}

- (CSVoiceTriggerRTModel)rtModel
{
  return self->_rtModel;
}

- (void)setRtModel:(id)a3
{
  objc_storeStrong((id *)&self->_rtModel, a3);
}

- (CSPlainAudioFileWriter)audioFileWriter
{
  return self->_audioFileWriter;
}

- (void)setAudioFileWriter:(id)a3
{
  objc_storeStrong((id *)&self->_audioFileWriter, a3);
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

- (BOOL)isSiriClientListening
{
  return self->_isSiriClientListening;
}

- (void)setIsSiriClientListening:(BOOL)a3
{
  self->_isSiriClientListening = a3;
}

- (CSVoiceTriggerSecondChanceContext)secondChanceContext
{
  return self->_secondChanceContext;
}

- (void)setSecondChanceContext:(id)a3
{
  objc_storeStrong((id *)&self->_secondChanceContext, a3);
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

- (CSVoiceTriggerFirstPassMetrics)firstpassMetrics
{
  return self->_firstpassMetrics;
}

- (void)setFirstpassMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_firstpassMetrics, a3);
}

- (CSSpeechManager)speechManager
{
  return self->_speechManager;
}

- (void)setSpeechManager:(id)a3
{
  objc_storeStrong((id *)&self->_speechManager, a3);
}

- (CSOtherAppRecordingStateMonitor)otherAppRecordingStateMonitor
{
  return self->_otherAppRecordingStateMonitor;
}

- (void)setOtherAppRecordingStateMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_otherAppRecordingStateMonitor, a3);
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
  objc_storeStrong((id *)&self->_otherAppRecordingStateMonitor, 0);
  objc_storeStrong((id *)&self->_speechManager, 0);
  objc_storeStrong((id *)&self->_firstpassMetrics, 0);
  objc_storeStrong((id *)&self->_assetConfigWaitingBuffer, 0);
  objc_storeStrong((id *)&self->_secondChanceContext, 0);
  objc_storeStrong((id *)&self->_voiceTriggerSecondPass, 0);
  objc_storeStrong((id *)&self->_audioFileWriter, 0);
  objc_storeStrong((id *)&self->_rtModel, 0);
  objc_storeStrong((id *)&self->_deviceId, 0);
  objc_storeStrong((id *)&self->_endpointAnalyzer, 0);
  objc_storeStrong((id *)&self->_jarvisTriggerResult, 0);
  objc_storeStrong((id *)&self->_keywordAnalyzerNDEAPI, 0);
  objc_storeStrong((id *)&self->_currentAsset, 0);
  objc_storeStrong((id *)&self->_audioStreamHolding, 0);
  objc_storeStrong((id *)&self->_audioProvider, 0);
  objc_storeStrong((id *)&self->_audioStream, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __81__CSVoiceTriggerFirstPassJarvis_siriClientBehaviorMonitor_willStopStream_reason___block_invoke(uint64_t a1)
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
    v4 = "-[CSVoiceTriggerFirstPassJarvis siriClientBehaviorMonitor:willStopStream:reason:]_block_invoke";
    _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s Siri Client will stop listening, resume FirstPassJarvis listen", (uint8_t *)&v3, 0xCu);
  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 11) = 0;
}

uint64_t __87__CSVoiceTriggerFirstPassJarvis_siriClientBehaviorMonitor_didStopStream_withEventUUID___block_invoke(uint64_t a1)
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
    v5 = "-[CSVoiceTriggerFirstPassJarvis siriClientBehaviorMonitor:didStopStream:withEventUUID:]_block_invoke";
    _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s Siri Client stops listening now, FirstPassJarvis can listen now", (uint8_t *)&v4, 0xCu);
  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 11) = 0;
  return objc_msgSend(*(id *)(a1 + 32), "_reset");
}

void __119__CSVoiceTriggerFirstPassJarvis_siriClientBehaviorMonitor_didStartStreamWithContext_successfully_option_withEventUUID___block_invoke(uint64_t a1)
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
    v4 = "-[CSVoiceTriggerFirstPassJarvis siriClientBehaviorMonitor:didStartStreamWithContext:successfully:option:withEve"
         "ntUUID:]_block_invoke";
    _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s Siri Client starts listening now, FirstPassJarvis shouldn't listen now", (uint8_t *)&v3, 0xCu);
  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 11) = 1;
}

void __72__CSVoiceTriggerFirstPassJarvis__handleSecondPassResult_deviceId_error___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  _QWORD v4[5];
  uint8_t buf[4];
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 10) = 0;
  objc_msgSend(*(id *)(a1 + 32), "_reset");
  v2 = *MEMORY[0x1E0D18F58];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v6 = "-[CSVoiceTriggerFirstPassJarvis _handleSecondPassResult:deviceId:error:]_block_invoke";
    _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s Stopping firstpass Jarvis audio as second-pass made decision", buf, 0xCu);
  }
  objc_msgSend(*(id *)(a1 + 32), "audioStream");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __72__CSVoiceTriggerFirstPassJarvis__handleSecondPassResult_deviceId_error___block_invoke_45;
  v4[3] = &unk_1E7C29060;
  v4[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v3, "stopAudioStreamWithOption:completion:", 0, v4);

  if (*(_QWORD *)(a1 + 40) != 1)
    objc_msgSend(*(id *)(a1 + 32), "_cancelAudioStreamHold");
}

void __72__CSVoiceTriggerFirstPassJarvis__handleSecondPassResult_deviceId_error___block_invoke_45(uint64_t a1, int a2, void *a3)
{
  void *v6;
  const __CFString *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = (void *)*MEMORY[0x1E0D18F58];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT))
  {
    if (a2)
      v7 = CFSTR("YES");
    else
      v7 = CFSTR("NO");
    v8 = v6;
    objc_msgSend(a3, "localizedDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v14 = "-[CSVoiceTriggerFirstPassJarvis _handleSecondPassResult:deviceId:error:]_block_invoke";
    v15 = 2114;
    v16 = v7;
    v17 = 2114;
    v18 = v9;
    _os_log_impl(&dword_1C2614000, v8, OS_LOG_TYPE_DEFAULT, "%s FirstPassJarvis stopped audio stream successfully? %{public}@, error : %{public}@", buf, 0x20u);

  }
  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(NSObject **)(v10 + 24);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72__CSVoiceTriggerFirstPassJarvis__handleSecondPassResult_deviceId_error___block_invoke_46;
  block[3] = &unk_1E7C292C8;
  block[4] = v10;
  dispatch_async(v11, block);
}

uint64_t __72__CSVoiceTriggerFirstPassJarvis__handleSecondPassResult_deviceId_error___block_invoke_46(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_didStopAudioStream");
}

void __62__CSVoiceTriggerFirstPassJarvis__reportJarvisVoiceTriggerFire__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id WeakRetained;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  _QWORD block[5];

  v5 = a3;
  v6 = a2;
  objc_msgSend(v6, "voiceTriggerEventInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  objc_msgSend(v8, "setValue:forKey:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *MEMORY[0x1E0D19438]);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_handleSecondPassResult:deviceId:error:", v6, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 128), v5);

  objc_msgSend(MEMORY[0x1E0D192A8], "sharedAggregator");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v6, "result");

  objc_msgSend(v10, "logSecondPassResult:eventInfo:triggerAPWakeUp:", v11, v8, 0);
  v12 = *(_QWORD *)(a1 + 32);
  v13 = *(NSObject **)(v12 + 24);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__CSVoiceTriggerFirstPassJarvis__reportJarvisVoiceTriggerFire__block_invoke_2;
  block[3] = &unk_1E7C292C8;
  block[4] = v12;
  dispatch_async(v13, block);

}

uint64_t __62__CSVoiceTriggerFirstPassJarvis__reportJarvisVoiceTriggerFire__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_teardownSecondPass");
}

void __64__CSVoiceTriggerFirstPassJarvis__notifyJarvisVoiceTriggerReject__block_invoke(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  _QWORD block[5];

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(NSObject **)(v1 + 24);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__CSVoiceTriggerFirstPassJarvis__notifyJarvisVoiceTriggerReject__block_invoke_2;
  block[3] = &unk_1E7C292C8;
  block[4] = v1;
  dispatch_async(v2, block);
}

uint64_t __64__CSVoiceTriggerFirstPassJarvis__notifyJarvisVoiceTriggerReject__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_didStopAudioStream");
}

void __105__CSVoiceTriggerFirstPassJarvis__didDetectKeywordFromDeviceId_activationInfo_triggerHostTime_completion___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  int v13;
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 9))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18E80], 505, 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = *MEMORY[0x1E0D18F58];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_ERROR))
    {
      v13 = 136315138;
      v14 = "-[CSVoiceTriggerFirstPassJarvis _didDetectKeywordFromDeviceId:activationInfo:triggerHostTime:completion:]_block_invoke";
      _os_log_error_impl(&dword_1C2614000, v3, OS_LOG_TYPE_ERROR, "%s Ignoring external Jarvis trigger since we are already handling a trigger candidate", (uint8_t *)&v13, 0xCu);
    }
    v4 = *(_QWORD *)(a1 + 56);
    if (v4)
      (*(void (**)(uint64_t, _QWORD, void *))(v4 + 16))(v4, 0, v2);

  }
  else
  {
    v5 = *MEMORY[0x1E0D18F58];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT))
    {
      v13 = 136315138;
      v14 = "-[CSVoiceTriggerFirstPassJarvis _didDetectKeywordFromDeviceId:activationInfo:triggerHostTime:completion:]_block_invoke";
      _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_DEFAULT, "%s Sending early detect notification upon first pass trigger", (uint8_t *)&v13, 0xCu);
    }
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 104) = mach_absolute_time();
    kdebug_trace();
    +[CSVoiceTriggerFirstPassMetrics CSVoiceTriggerFirstPassMetricsWithFirstPassInfoGeneratedTime:firstPassInfoProcessedTime:](CSVoiceTriggerFirstPassMetrics, "CSVoiceTriggerFirstPassMetricsWithFirstPassInfoGeneratedTime:firstPassInfoProcessedTime:", *(_QWORD *)(a1 + 64), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 104));
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(v7 + 176);
    *(_QWORD *)(v7 + 176) = v6;

    +[CSSiriLauncher sharedLauncher](CSSiriLauncher, "sharedLauncher");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "notifyCarPlayVoiceTriggerPrewarm:deviceId:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 0);

    v10 = (void *)MEMORY[0x1C3BC4590]();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "setDelegate:", 0);
    v11 = *(_QWORD *)(a1 + 32);
    v12 = *(void **)(v11 + 120);
    *(_QWORD *)(v11 + 120) = 0;

    objc_autoreleasePoolPop(v10);
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 9) = 1;
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72) = 0;
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 128), *(id *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 32), "_handleJarvisVoiceTriggerFromDeviceId:activationInfo:triggerHostTime:completion:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 56));
  }
}

uint64_t __97__CSVoiceTriggerFirstPassJarvis__requestStartAudioStreamWitContext_startStreamOption_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __97__CSVoiceTriggerFirstPassJarvis__requestStartAudioStreamWitContext_startStreamOption_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 24);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __97__CSVoiceTriggerFirstPassJarvis__requestStartAudioStreamWitContext_startStreamOption_completion___block_invoke_3;
  block[3] = &unk_1E7C292C8;
  block[4] = v4;
  v6 = a3;
  dispatch_async(v5, block);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __97__CSVoiceTriggerFirstPassJarvis__requestStartAudioStreamWitContext_startStreamOption_completion___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_didStartAudioStream");
}

void __113__CSVoiceTriggerFirstPassJarvis__handleJarvisVoiceTriggerFromDeviceId_activationInfo_triggerHostTime_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  const __CFString *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  int v11;
  const char *v12;
  __int16 v13;
  const __CFString *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)*MEMORY[0x1E0D18F58];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT))
  {
    if ((_DWORD)a2)
      v7 = CFSTR("YES");
    else
      v7 = CFSTR("NO");
    v8 = v6;
    objc_msgSend(v5, "localizedDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 136315650;
    v12 = "-[CSVoiceTriggerFirstPassJarvis _handleJarvisVoiceTriggerFromDeviceId:activationInfo:triggerHostTime:completio"
          "n:]_block_invoke";
    v13 = 2112;
    v14 = v7;
    v15 = 2114;
    v16 = v9;
    _os_log_impl(&dword_1C2614000, v8, OS_LOG_TYPE_DEFAULT, "%s result = %@, error = %{public}@", (uint8_t *)&v11, 0x20u);

  }
  v10 = *(_QWORD *)(a1 + 32);
  if (v10)
    (*(void (**)(uint64_t, uint64_t, id))(v10 + 16))(v10, a2, v5);

}

void __113__CSVoiceTriggerFirstPassJarvis__handleJarvisVoiceTriggerFromDeviceId_activationInfo_triggerHostTime_completion___block_invoke_26(uint64_t a1, char a2, void *a3)
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
  v10[2] = __113__CSVoiceTriggerFirstPassJarvis__handleJarvisVoiceTriggerFromDeviceId_activationInfo_triggerHostTime_completion___block_invoke_2;
  v10[3] = &unk_1E7C29100;
  v13 = a2;
  v10[4] = v6;
  v11 = v5;
  v12 = v7;
  v9 = v5;
  dispatch_async(v8, v10);

}

uint64_t __113__CSVoiceTriggerFirstPassJarvis__handleJarvisVoiceTriggerFromDeviceId_activationInfo_triggerHostTime_completion___block_invoke_2(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 56))
    objc_msgSend(*(id *)(a1 + 32), "_holdAudioStreamWithTimeout:", 5.0);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __70__CSVoiceTriggerFirstPassJarvis_spgEndpointAnalyzerDidDetectEndpoint___block_invoke(uint64_t a1)
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
    v4 = "-[CSVoiceTriggerFirstPassJarvis spgEndpointAnalyzerDidDetectEndpoint:]_block_invoke";
    _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s FirstPass Jarvis received endpoint detected notification.", (uint8_t *)&v3, 0xCu);
  }
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80) = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72);
}

void __85__CSVoiceTriggerFirstPassJarvis_activationEventNotificationHandler_event_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  id WeakRetained;
  uint64_t v9;
  id v10;

  v5 = a3;
  v6 = v5;
  v10 = v5;
  if ((a2 & 1) == 0)
  {
    v7 = objc_msgSend(v5, "code");
    v6 = v10;
    if (v7 != 505)
    {
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
      objc_msgSend(WeakRetained, "_clearTriggerCandidate");

      v6 = v10;
    }
  }
  v9 = *(_QWORD *)(a1 + 32);
  if (v9)
  {
    (*(void (**)(uint64_t, uint64_t, id))(v9 + 16))(v9, a2, v10);
    v6 = v10;
  }

}

uint64_t __74__CSVoiceTriggerFirstPassJarvis_audioStreamProvider_audioBufferAvailable___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 168);
  if (!*(_BYTE *)(v2 + 12))
    return objc_msgSend(v3, "addObject:", *(_QWORD *)(a1 + 40));
  if (objc_msgSend(v3, "count"))
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v4 = *(id *)(*(_QWORD *)(a1 + 32) + 168);
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v11;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v11 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(a1 + 32), "_handleAudioChunk:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8++), (_QWORD)v10);
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v6);
    }

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 168), "removeAllObjects");
  }
  return objc_msgSend(*(id *)(a1 + 32), "_handleAudioChunk:", *(_QWORD *)(a1 + 40), (_QWORD)v10);
}

uint64_t __79__CSVoiceTriggerFirstPassJarvis_audioStreamProvider_didStopStreamUnexpectedly___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  const char *v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0D18F58];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 40);
    v5 = 136315394;
    v6 = "-[CSVoiceTriggerFirstPassJarvis audioStreamProvider:didStopStreamUnexpectedly:]_block_invoke";
    v7 = 2048;
    v8 = v3;
    _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s record stop unexpectedly with reason : %ld", (uint8_t *)&v5, 0x16u);
  }
  return objc_msgSend(*(id *)(a1 + 32), "_didStopAudioStream");
}

uint64_t __42__CSVoiceTriggerFirstPassJarvis_setAsset___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setAsset:", *(_QWORD *)(a1 + 40));
}

uint64_t __38__CSVoiceTriggerFirstPassJarvis_reset__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reset");
}

void __38__CSVoiceTriggerFirstPassJarvis_start__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  CSVoiceTriggerUserSelectedPhrase *v5;

  objc_msgSend(*(id *)(a1 + 32), "voiceTriggerSecondPass");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "start");

  objc_msgSend(MEMORY[0x1E0D191F0], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerObserver:", *(_QWORD *)(a1 + 32));

  v4 = *(void **)(a1 + 32);
  v5 = -[CSVoiceTriggerUserSelectedPhrase initWithEndpointId:]([CSVoiceTriggerUserSelectedPhrase alloc], "initWithEndpointId:", 0);
  objc_msgSend(v4, "setMultiPhraseSelectedStatus:", v5);

}

+ (id)jarvisAudioLoggingFilePath
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  +[CSVoiceTriggerFirstPassJarvis jarvisAudioLogDirectory](CSVoiceTriggerFirstPassJarvis, "jarvisAudioLogDirectory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0CB3940];
  +[CSVoiceTriggerFirstPassJarvis timeStampString](CSVoiceTriggerFirstPassJarvis, "timeStampString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@%@.wav"), v4, CFSTR("-jarvis"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "stringByAppendingPathComponent:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)jarvisAudioLogDirectory
{
  void *v2;
  void *v3;
  __CFString *v4;
  id v5;
  char v6;
  void *v7;
  NSObject *v9;
  void *v10;
  id v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  __CFString *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D19110], "sharedPreferences");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "voiceTriggerAudioLogDirectory");
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v2, "fileExistsAtPath:", v4) & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    v11 = 0;
    v6 = objc_msgSend(v2, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v4, 1, 0, &v11);
    v5 = v11;
    if ((v6 & 1) == 0)
    {
      v7 = (void *)*MEMORY[0x1E0D18F58];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_ERROR))
      {
        v9 = v7;
        objc_msgSend(v5, "localizedDescription");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315650;
        v13 = "+[CSVoiceTriggerFirstPassJarvis jarvisAudioLogDirectory]";
        v14 = 2114;
        v15 = v4;
        v16 = 2114;
        v17 = v10;
        _os_log_error_impl(&dword_1C2614000, v9, OS_LOG_TYPE_ERROR, "%s Couldn't create jarvis audio logging directory at path %{public}@ %{public}@", buf, 0x20u);

      }
      v4 = CFSTR("/tmp");
    }
  }

  return v4;
}

+ (id)timeStampString
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setLocale:", v3);

  objc_msgSend(v2, "setDateFormat:", CFSTR("yyyyMMdd-HHmmss"));
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringFromDate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
