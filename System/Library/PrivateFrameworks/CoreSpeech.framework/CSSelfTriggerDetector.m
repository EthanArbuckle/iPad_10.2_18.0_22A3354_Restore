@implementation CSSelfTriggerDetector

- (CSSelfTriggerDetector)initWithTargetQueue:(id)a3 audioTapProvider:(id)a4 audioSourceType:(unint64_t)a5
{
  NSObject *v8;
  id v9;
  id v10;
  dispatch_queue_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  objc_super v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  unint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v18.receiver = self;
  v18.super_class = (Class)CSSelfTriggerDetector;
  v10 = -[CSSelfTriggerDetector init](&v18, sel_init);
  if (v10)
  {
    v11 = dispatch_queue_create("CSSelfVoiceTriggerDetector Queue", 0);
    v12 = (void *)*((_QWORD *)v10 + 2);
    *((_QWORD *)v10 + 2) = v11;

    dispatch_set_target_queue(*((dispatch_object_t *)v10 + 2), v8);
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)*((_QWORD *)v10 + 3);
    *((_QWORD *)v10 + 3) = v13;

    objc_storeWeak((id *)v10 + 12, v9);
    *((_QWORD *)v10 + 13) = a5;
    *((_QWORD *)v10 + 15) = 0;
    v15 = (void *)*((_QWORD *)v10 + 6);
    *((_QWORD *)v10 + 6) = 0;

    *((_BYTE *)v10 + 8) = 0;
  }
  v16 = *MEMORY[0x1E0D18F58];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v20 = "-[CSSelfTriggerDetector initWithTargetQueue:audioTapProvider:audioSourceType:]";
    v21 = 2048;
    v22 = a5;
    _os_log_impl(&dword_1C2614000, v16, OS_LOG_TYPE_DEFAULT, "%s Creating SelfTriggerDetector with audioSourceType(%lu)", buf, 0x16u);
  }

  return (CSSelfTriggerDetector *)v10;
}

- (void)start
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __30__CSSelfTriggerDetector_start__block_invoke;
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
  block[2] = __30__CSSelfTriggerDetector_reset__block_invoke;
  block[3] = &unk_1E7C292C8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_reset
{
  -[CSKeywordAnalyzerNDAPI reset](self->_keywordAnalyzer, "reset");
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
  v7[2] = __34__CSSelfTriggerDetector_setAsset___block_invoke;
  v7[3] = &unk_1E7C292A0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (unint64_t)currentState
{
  NSObject *queue;
  unint64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __37__CSSelfTriggerDetector_currentState__block_invoke;
  v5[3] = &unk_1E7C29228;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
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
  v7[2] = __42__CSSelfTriggerDetector_registerObserver___block_invoke;
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
  v7[2] = __44__CSSelfTriggerDetector_unregisterObserver___block_invoke;
  v7[3] = &unk_1E7C292A0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)_setAsset:(id)a3
{
  id v5;
  CSContinuousVoiceTriggerConfig *v6;
  CSContinuousVoiceTriggerConfig *selfTriggerConfig;
  NSObject *v8;
  int v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    objc_storeStrong((id *)&self->_currentAsset, a3);
    objc_msgSend(MEMORY[0x1E0D19098], "decodeConfigFrom:", self->_currentAsset);
    v6 = (CSContinuousVoiceTriggerConfig *)objc_claimAutoreleasedReturnValue();
    selfTriggerConfig = self->_selfTriggerConfig;
    self->_selfTriggerConfig = v6;

    if (self->_keywordAnalyzer || self->_isKeywordAnalyzerCorrupted)
      -[CSSelfTriggerDetector _loadCurrentAssetToAnalyzer](self, "_loadCurrentAssetToAnalyzer");
    -[CSSelfTriggerDetector _reset](self, "_reset");
  }
  else
  {
    v8 = *MEMORY[0x1E0D18F58];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT))
    {
      v9 = 136315138;
      v10 = "-[CSSelfTriggerDetector _setAsset:]";
      _os_log_impl(&dword_1C2614000, v8, OS_LOG_TYPE_DEFAULT, "%s asset is nil, stop initialization", (uint8_t *)&v9, 0xCu);
    }
  }

}

- (void)_loadCurrentAssetToAnalyzer
{
  CSOSTransaction *v3;
  CSOSTransaction *modelLoadTransaction;
  void *v5;
  CSKeywordAnalyzerNDAPI *v6;
  CSKeywordAnalyzerNDAPI *keywordAnalyzer;
  id WeakRetained;
  unint64_t audioSourceType;
  CSKeywordAnalyzerNDAPI *v10;
  uint64_t v11;
  CSKeywordAnalyzerNDAPI *v12;
  id v13;

  if (!self->_modelLoadTransaction)
  {
    v3 = (CSOSTransaction *)objc_msgSend(objc_alloc(MEMORY[0x1E0D19178]), "initWithDescription:", CFSTR("Transaction for STS model loading"));
    modelLoadTransaction = self->_modelLoadTransaction;
    self->_modelLoadTransaction = v3;

  }
  -[CSAsset resourcePath](self->_currentAsset, "resourcePath");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  -[CSContinuousVoiceTriggerConfig configPathNDAPI](self->_selfTriggerConfig, "configPathNDAPI");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (CSKeywordAnalyzerNDAPI *)objc_msgSend(objc_alloc(MEMORY[0x1E0D19138]), "initWithConfigPath:resourcePath:", v5, v13);
  keywordAnalyzer = self->_keywordAnalyzer;
  self->_keywordAnalyzer = v6;

  self->_isKeywordAnalyzerCorrupted = self->_keywordAnalyzer == 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_audioTapProvider);
  if (WeakRetained && (audioSourceType = self->_audioSourceType, WeakRetained, audioSourceType == 1))
  {
    v10 = self->_keywordAnalyzer;
    v11 = 0;
  }
  else
  {
    v12 = self->_keywordAnalyzer;
    v11 = objc_msgSend(MEMORY[0x1E0D19090], "channelForOutputReference");
    v10 = v12;
  }
  -[CSKeywordAnalyzerNDAPI setActiveChannel:](v10, "setActiveChannel:", v11);

}

- (void)_unloadCurrentAssetToAnalyzer
{
  void *v3;
  CSKeywordAnalyzerNDAPI *keywordAnalyzer;
  CSOSTransaction *modelLoadTransaction;

  v3 = (void *)MEMORY[0x1C3BC4590](self, a2);
  keywordAnalyzer = self->_keywordAnalyzer;
  self->_keywordAnalyzer = 0;

  modelLoadTransaction = self->_modelLoadTransaction;
  self->_modelLoadTransaction = 0;

  objc_autoreleasePoolPop(v3);
}

- (void)startAnalyze
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__CSSelfTriggerDetector_startAnalyze__block_invoke;
  block[3] = &unk_1E7C292C8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_startListenPolling
{
  NSObject *v2;
  uint64_t v3;
  _QWORD v4[5];
  uint8_t buf[4];
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (self->_isListenPollingStarting)
  {
    v2 = *MEMORY[0x1E0D18F58];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v6 = "-[CSSelfTriggerDetector _startListenPolling]";
      _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s Already started listen polling, skip", buf, 0xCu);
    }
  }
  else
  {
    v3 = MEMORY[0x1E0C809B0];
    self->_isListenPollingStarting = 1;
    v4[0] = v3;
    v4[1] = 3221225472;
    v4[2] = __44__CSSelfTriggerDetector__startListenPolling__block_invoke;
    v4[3] = &unk_1E7C29060;
    v4[4] = self;
    -[CSSelfTriggerDetector _startListenPollingWithInterval:completion:](self, "_startListenPollingWithInterval:completion:", v4, 1.0);
  }
}

- (void)_startListenPollingWithInterval:(double)a3 completion:(id)a4
{
  id v6;
  os_log_t *v7;
  NSObject *v8;
  void *v9;
  _BOOL4 selfTriggerEnabled;
  NSObject *v11;
  _QWORD v12[5];
  id v13;
  double v14;
  uint8_t buf[4];
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = (os_log_t *)MEMORY[0x1E0D18F58];
  v8 = *MEMORY[0x1E0D18F58];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v16 = "-[CSSelfTriggerDetector _startListenPollingWithInterval:completion:]";
    _os_log_impl(&dword_1C2614000, v8, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  -[CSSelfTriggerDetector audioStream](self, "audioStream");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "isStreaming") & 1) != 0)
  {

  }
  else
  {
    selfTriggerEnabled = self->_selfTriggerEnabled;

    if (selfTriggerEnabled)
    {
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __68__CSSelfTriggerDetector__startListenPollingWithInterval_completion___block_invoke;
      v12[3] = &unk_1E7C290B0;
      v12[4] = self;
      v14 = a3;
      v13 = v6;
      -[CSSelfTriggerDetector _startListenWithCompletion:](self, "_startListenWithCompletion:", v12);

      goto LABEL_11;
    }
  }
  v11 = *v7;
  if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v16 = "-[CSSelfTriggerDetector _startListenPollingWithInterval:completion:]";
    _os_log_impl(&dword_1C2614000, v11, OS_LOG_TYPE_DEFAULT, "%s Skip listen polling since audio is streaming / selfTrigger disabled", buf, 0xCu);
  }
  if (v6)
    (*((void (**)(id, _QWORD, _QWORD))v6 + 2))(v6, 0, 0);
LABEL_11:

}

- (void)_startListenWithCompletion:(id)a3
{
  id v4;
  id v5;
  void (**v6)(_QWORD, _QWORD, _QWORD);
  void *v7;
  id WeakRetained;
  void *v9;
  NSObject *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  CSAudioTimeConverter *v15;
  CSAudioTimeConverter *audioTimeConverter;
  id v17;
  void *v18;
  int v19;
  objc_class *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  double v25;
  uint64_t v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  _QWORD v31[5];
  void (**v32)(_QWORD, _QWORD, _QWORD);
  id v33;
  id v34;
  _QWORD v35[4];
  id v36;
  uint8_t buf[4];
  const char *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __52__CSSelfTriggerDetector__startListenWithCompletion___block_invoke;
  v35[3] = &unk_1E7C290D8;
  v5 = v4;
  v36 = v5;
  v6 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1C3BC4734](v35);
  objc_msgSend(MEMORY[0x1E0D19008], "contextForBuiltInVoiceTrigger");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_audioTapProvider);
  v29 = v7;
  if (WeakRetained)
  {
    v9 = WeakRetained;
    v10 = *MEMORY[0x1E0D18F58];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v38 = "-[CSSelfTriggerDetector _startListenWithCompletion:]";
      _os_log_impl(&dword_1C2614000, v10, OS_LOG_TYPE_DEFAULT, "%s Using audio tapping provider for self-trigger", buf, 0xCu);
    }
    goto LABEL_6;
  }
  if (-[CSSelfTriggerDetector _shouldReuseBuiltInAudioProvider](self, "_shouldReuseBuiltInAudioProvider"))
  {
    +[CSSpeechManager sharedManagerForCoreSpeechDaemon](CSSpeechManager, "sharedManagerForCoreSpeechDaemon");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "audioProviderWithStreamID:", 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
LABEL_6:
      v12 = 0;
      goto LABEL_7;
    }
  }
  +[CSSpeechManager sharedManagerForCoreSpeechDaemon](CSSpeechManager, "sharedManagerForCoreSpeechDaemon", v7);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0;
  objc_msgSend(v28, "audioProviderWithContext:error:", v7, &v34);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v34;

  if (!v9)
  {
    ((void (**)(_QWORD, _QWORD, id))v6)[2](v6, 0, v12);
    goto LABEL_15;
  }
LABEL_7:
  objc_msgSend(v9, "UUID", v29);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "copy");
  -[CSSelfTriggerDetector setAudioProviderUUID:](self, "setAudioProviderUUID:", v14);

  v15 = (CSAudioTimeConverter *)objc_alloc_init(MEMORY[0x1E0D19060]);
  audioTimeConverter = self->_audioTimeConverter;
  self->_audioTimeConverter = v15;

  v17 = objc_alloc_init(MEMORY[0x1E0D19058]);
  objc_msgSend(MEMORY[0x1E0D19110], "sharedPreferences");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "fileLoggingIsEnabled");

  if (v19)
    objc_msgSend(v17, "setRequiresHistoricalBuffer:", 1);
  v20 = (objc_class *)objc_opt_class();
  NSStringFromClass(v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0;
  objc_msgSend(v9, "audioStreamWithRequest:streamName:error:", v17, v21, &v33);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v33;

  if (v22)
  {
    -[CSSelfTriggerDetector setAudioStream:](self, "setAudioStream:", v22);
    objc_msgSend(v22, "setDelegate:", self);
    v24 = mach_absolute_time();
    LODWORD(v25) = 2.0;
    v26 = v24 - objc_msgSend(MEMORY[0x1E0D19118], "secondsToHostTime:", v25);
    v27 = objc_alloc_init(MEMORY[0x1E0D19030]);
    objc_msgSend(v27, "setRequestHistoricalAudioDataWithHostTime:", 1);
    objc_msgSend(v27, "setStartRecordingHostTime:", v26);
    objc_msgSend(v27, "setSkipAlertBehavior:", 1);
    if (self->_mode == 1)
      objc_msgSend(v27, "setRequestTelephonyDownlinkAudioTap:", 1);
    -[CSSelfTriggerDetector _loadCurrentAssetToAnalyzer](self, "_loadCurrentAssetToAnalyzer");
    -[CSSelfTriggerDetector _reset](self, "_reset");
    -[CSSelfTriggerDetector _transitCurrentStateTo:](self, "_transitCurrentStateTo:", 1);
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __52__CSSelfTriggerDetector__startListenWithCompletion___block_invoke_19;
    v31[3] = &unk_1E7C29128;
    v31[4] = self;
    v32 = v6;
    objc_msgSend(v22, "startAudioStreamWithOption:completion:", v27, v31);

  }
  else
  {
    ((void (**)(_QWORD, _QWORD, id))v6)[2](v6, 0, v23);
  }

  v7 = v30;
LABEL_15:

}

- (void)stopAnalyzeWithCompletion:(id)a3
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
  v7[2] = __51__CSSelfTriggerDetector_stopAnalyzeWithCompletion___block_invoke;
  v7[3] = &unk_1E7C29150;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)_stopListeningWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  -[CSSelfTriggerDetector audioStream](self, "audioStream");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5
    && (v6 = (void *)v5,
        -[CSSelfTriggerDetector audioStream](self, "audioStream"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "isStreaming"),
        v7,
        v6,
        v8))
  {
    -[CSSelfTriggerDetector _transitCurrentStateTo:](self, "_transitCurrentStateTo:", 3);
    -[CSSelfTriggerDetector audioStream](self, "audioStream");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __54__CSSelfTriggerDetector__stopListeningWithCompletion___block_invoke;
    v10[3] = &unk_1E7C29128;
    v10[4] = self;
    v11 = v4;
    objc_msgSend(v9, "stopAudioStreamWithOption:completion:", 0, v10);

  }
  else
  {
    -[CSSelfTriggerDetector _unloadCurrentAssetToAnalyzer](self, "_unloadCurrentAssetToAnalyzer");
    -[CSSelfTriggerDetector _transitCurrentStateTo:](self, "_transitCurrentStateTo:", 0);
    if (v4)
      (*((void (**)(id, uint64_t, _QWORD))v4 + 2))(v4, 1, 0);
  }

}

- (BOOL)_shouldReuseBuiltInAudioProvider
{
  return CSIsOSX() ^ 1;
}

- (BOOL)_isTelephonyTapAvailable
{
  id WeakRetained;
  BOOL v4;

  if (!objc_msgSend(MEMORY[0x1E0D19260], "supportTelephonyAudioTap"))
    return 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_audioTapProvider);
  v4 = WeakRetained != 0;

  return v4;
}

- (unint64_t)_getPlaybackRouteType
{
  void *v2;
  uint64_t v3;
  void *v5;
  int v6;

  objc_msgSend(MEMORY[0x1E0D19080], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "currentBuiltinSpeakerState");

  if (v3 == 1)
    return 1;
  +[CSBluetoothSpeakerStateMonitor sharedInstance](CSBluetoothSpeakerStateMonitor, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isActive");

  if (v6)
    return 2;
  else
    return 0;
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
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v10 = "-[CSSelfTriggerDetector audioStreamProvider:didStopStreamUnexpectedly:]";
    v11 = 2050;
    v12 = a4;
    _os_log_impl(&dword_1C2614000, v6, OS_LOG_TYPE_DEFAULT, "%s stream stopped unexpectedly : %{public}ld", buf, 0x16u);
  }
  queue = self->_queue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __71__CSSelfTriggerDetector_audioStreamProvider_didStopStreamUnexpectedly___block_invoke;
  v8[3] = &unk_1E7C29178;
  v8[4] = self;
  v8[5] = a4;
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
  v8[2] = __66__CSSelfTriggerDetector_audioStreamProvider_audioBufferAvailable___block_invoke;
  v8[3] = &unk_1E7C292A0;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(queue, v8);

}

- (void)_keywordAnalyzerNDAPI:(id)a3 hasResultAvailable:(id)a4 forChannel:(unint64_t)a5
{
  id v8;
  id v9;
  float v10;
  float v11;
  uint64_t v12;
  NSObject *v13;
  unint64_t audioSourceType;
  BOOL v15;
  const __CFString *v16;
  float v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  float v21;
  double v22;
  float v23;
  double v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  double v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  NSObject *v44;
  double v45;
  NSHashTable *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t i;
  void *v51;
  unint64_t v52;
  void *v53;
  _BOOL8 v54;
  void *v55;
  void *v56;
  unint64_t v57;
  void *v58;
  uint64_t v59;
  id v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  uint8_t v65[128];
  uint8_t buf[4];
  const char *v67;
  __int16 v68;
  double v69;
  __int16 v70;
  unint64_t v71;
  __int16 v72;
  const __CFString *v73;
  __int16 v74;
  unint64_t v75;
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  objc_msgSend(v9, "bestScore");
  v11 = v10;
  v12 = _keywordAnalyzerNDAPI_hasResultAvailable_forChannel__heartbeat_26399;
  if (__ROR8__(0xEEEEEEEEEEEEEEEFLL * _keywordAnalyzerNDAPI_hasResultAvailable_forChannel__heartbeat_26399, 1) <= 0x888888888888888uLL)
  {
    v13 = *MEMORY[0x1E0D18F58];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT))
    {
      audioSourceType = self->_audioSourceType;
      v15 = !self->_isSiriClientListening;
      *(_DWORD *)buf = 136316162;
      v67 = "-[CSSelfTriggerDetector _keywordAnalyzerNDAPI:hasResultAvailable:forChannel:]";
      if (v15)
        v16 = CFSTR("NO");
      else
        v16 = CFSTR("YES");
      v68 = 2050;
      v69 = v11;
      v70 = 2050;
      v71 = a5;
      v72 = 2114;
      v73 = v16;
      v74 = 2050;
      v75 = audioSourceType;
      _os_log_impl(&dword_1C2614000, v13, OS_LOG_TYPE_DEFAULT, "%s Output NDAPI self trigger best score = %{public}f for channel = %{public}tu, client listening ? %{public}@, audioSourceType %{public}lu", buf, 0x34u);
      v12 = _keywordAnalyzerNDAPI_hasResultAvailable_forChannel__heartbeat_26399;
    }
  }
  _keywordAnalyzerNDAPI_hasResultAvailable_forChannel__heartbeat_26399 = v12 + 1;
  if (!self->_isSiriClientListening)
  {
    -[CSContinuousVoiceTriggerConfig threshold](self->_selfTriggerConfig, "threshold");
    if (v11 >= v17)
    {
      v60 = v8;
      v18 = objc_msgSend(v9, "bestStart");
      v19 = objc_msgSend(v9, "bestEnd");
      v20 = objc_msgSend(v9, "samplesAtFire");
      objc_msgSend(MEMORY[0x1E0D19090], "inputRecordingSampleRate");
      v22 = (float)((float)(unint64_t)(v19 - v18) / v21);
      objc_msgSend(MEMORY[0x1E0D19090], "inputRecordingSampleRate");
      v24 = (float)((float)(unint64_t)(v20 - v18) / v23);
      v59 = -[CSAudioTimeConverter hostTimeFromSampleCount:](self->_audioTimeConverter, "hostTimeFromSampleCount:", v18);
      v25 = -[CSAudioTimeConverter hostTimeFromSampleCount:](self->_audioTimeConverter, "hostTimeFromSampleCount:", v19);
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[CSAsset configVersion](self->_currentAsset, "configVersion");
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      if (v27)
      {
        -[CSAsset configVersion](self->_currentAsset, "configVersion");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "setObject:forKey:", v28, *MEMORY[0x1E0D195D8]);

      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v18);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setObject:forKey:", v29, *MEMORY[0x1E0D19788]);

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v19);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setObject:forKey:", v30, *MEMORY[0x1E0D19730]);

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v20);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setObject:forKey:", v31, *MEMORY[0x1E0D19760]);

      objc_msgSend(v26, "setObject:forKey:", &unk_1E7C63F60, *MEMORY[0x1E0D19790]);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v22);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setObject:forKey:", v32, *MEMORY[0x1E0D19738]);

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v24);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setObject:forKey:", v33, *MEMORY[0x1E0D19768]);

      *(float *)&v34 = v11;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setObject:forKey:", v35, *MEMORY[0x1E0D19778]);

      v36 = (void *)MEMORY[0x1E0CB37E8];
      -[CSContinuousVoiceTriggerConfig threshold](self->_selfTriggerConfig, "threshold");
      objc_msgSend(v36, "numberWithFloat:");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setObject:forKey:", v37, *MEMORY[0x1E0D196F8]);

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v59);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setObject:forKey:", v38, *MEMORY[0x1E0D19780]);

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v25);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setObject:forKey:", v39, *MEMORY[0x1E0D19728]);

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a5);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setObject:forKey:", v40, *MEMORY[0x1E0D195A8]);

      -[CSSelfTriggerDetector audioProviderUUID](self, "audioProviderUUID");
      v41 = (void *)objc_claimAutoreleasedReturnValue();

      if (v41)
      {
        -[CSSelfTriggerDetector audioProviderUUID](self, "audioProviderUUID");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "setObject:forKey:", v42, *MEMORY[0x1E0D193E8]);

      }
      -[CSSelfTriggerDetector audioTapProvider](self, "audioTapProvider");
      v43 = (void *)objc_claimAutoreleasedReturnValue();

      if (v43)
        objc_msgSend(v26, "setObject:forKey:", &unk_1E7C63EA8, *MEMORY[0x1E0D193E0]);
      v44 = *MEMORY[0x1E0D18F58];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT))
      {
        v45 = *(double *)&self->_audioSourceType;
        *(_DWORD *)buf = 136315650;
        v67 = "-[CSSelfTriggerDetector _keywordAnalyzerNDAPI:hasResultAvailable:forChannel:]";
        v68 = 2050;
        v69 = v45;
        v70 = 2114;
        v71 = (unint64_t)v26;
        _os_log_impl(&dword_1C2614000, v44, OS_LOG_TYPE_DEFAULT, "%s Notifying self trigger detected with audioSourceType %{public}lu : %{public}@", buf, 0x20u);
      }
      objc_msgSend(v8, "reset");
      v63 = 0u;
      v64 = 0u;
      v61 = 0u;
      v62 = 0u;
      v46 = self->_observers;
      v47 = -[NSHashTable countByEnumeratingWithState:objects:count:](v46, "countByEnumeratingWithState:objects:count:", &v61, v65, 16);
      if (v47)
      {
        v48 = v47;
        v49 = *(_QWORD *)v62;
        do
        {
          for (i = 0; i != v48; ++i)
          {
            if (*(_QWORD *)v62 != v49)
              objc_enumerationMutation(v46);
            v51 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * i);
            if ((objc_opt_respondsToSelector() & 1) != 0)
              objc_msgSend(v51, "selfTriggerDetector:didDetectSelfTrigger:", self, v26);
          }
          v48 = -[NSHashTable countByEnumeratingWithState:objects:count:](v46, "countByEnumeratingWithState:objects:count:", &v61, v65, 16);
        }
        while (v48);
      }

      if (-[CSSelfTriggerDetector _shouldAddPowerLogs](self, "_shouldAddPowerLogs"))
      {
        v52 = -[CSSelfTriggerDetector _getPlaybackRouteType](self, "_getPlaybackRouteType");
        objc_msgSend(MEMORY[0x1E0D191A0], "phoneCallStateMonitor");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v53, "phoneCallState") == 3)
        {
          v54 = 1;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0D191A0], "phoneCallStateMonitor");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          v54 = objc_msgSend(v55, "phoneCallState") == 4;

        }
        objc_msgSend(MEMORY[0x1E0D191C0], "sharedPowerLogger");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = self->_audioSourceType;
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "timeIntervalSince1970");
        objc_msgSend(v56, "powerLogSelfTriggerSuppressionDetectedWithSpeakerType:withAudioSource:atTime:isPhoneCall:", v52, v57, v54);

      }
      v8 = v60;
    }
  }

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
    block[2] = __111__CSSelfTriggerDetector_siriClientBehaviorMonitor_didStartStreamWithContext_successfully_option_withEventUUID___block_invoke;
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
  block[2] = __79__CSSelfTriggerDetector_siriClientBehaviorMonitor_didStopStream_withEventUUID___block_invoke;
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
  block[2] = __73__CSSelfTriggerDetector_siriClientBehaviorMonitor_willStopStream_reason___block_invoke;
  block[3] = &unk_1E7C292C8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)CSAudioServerCrashMonitorDidReceiveServerRestart:(id)a3
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__CSSelfTriggerDetector_CSAudioServerCrashMonitorDidReceiveServerRestart___block_invoke;
  block[3] = &unk_1E7C292C8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)CSPhoneCallStateMonitor:(id)a3 didRecievePhoneCallStateChange:(unint64_t)a4
{
  NSObject *queue;
  _QWORD v5[6];

  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __80__CSSelfTriggerDetector_CSPhoneCallStateMonitor_didRecievePhoneCallStateChange___block_invoke;
  v5[3] = &unk_1E7C29178;
  v5[4] = self;
  v5[5] = a4;
  dispatch_async(queue, v5);
}

- (void)_hardStopAndRestartAudioQueueIfNeeded
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __62__CSSelfTriggerDetector__hardStopAndRestartAudioQueueIfNeeded__block_invoke;
  v2[3] = &unk_1E7C29060;
  v2[4] = self;
  -[CSSelfTriggerDetector _stopListeningWithCompletion:](self, "_stopListeningWithCompletion:", v2);
}

- (void)_transitCurrentStateTo:(unint64_t)a3
{
  NSObject *v5;
  unint64_t state;
  unint64_t audioSourceType;
  int v8;
  const char *v9;
  __int16 v10;
  unint64_t v11;
  __int16 v12;
  unint64_t v13;
  __int16 v14;
  unint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = *MEMORY[0x1E0D18F58];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT))
  {
    state = self->_state;
    audioSourceType = self->_audioSourceType;
    v8 = 136315906;
    v9 = "-[CSSelfTriggerDetector _transitCurrentStateTo:]";
    v10 = 2048;
    v11 = state;
    v12 = 2048;
    v13 = a3;
    v14 = 2048;
    v15 = audioSourceType;
    _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_DEFAULT, "%s From state : %lu to state : %lu , audioSourceType : %lu", (uint8_t *)&v8, 0x2Au);
  }
  -[CSSelfTriggerDetector _addPowerLogsIfSupported:](self, "_addPowerLogsIfSupported:", a3);
  self->_state = a3;
}

- (BOOL)_shouldAddPowerLogs
{
  return CSIsIOS() && !objc_msgSend(MEMORY[0x1E0D19260], "isDarwinOS");
}

- (void)_addPowerLogsIfSupported:(unint64_t)a3
{
  unint64_t v5;
  void *v6;
  _BOOL8 v7;
  void *v8;
  void *v9;
  unint64_t audioSourceType;
  id v11;

  if (-[CSSelfTriggerDetector _shouldAddPowerLogs](self, "_shouldAddPowerLogs") && self->_state != a3)
  {
    if (!a3)
    {
      objc_msgSend(MEMORY[0x1E0D191C0], "sharedPowerLogger");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "timeIntervalSince1970");
      objc_msgSend(v11, "powerLogSelfTriggerSuppressionStopAtTime:");
LABEL_11:

      return;
    }
    if (a3 == 1)
    {
      v5 = -[CSSelfTriggerDetector _getPlaybackRouteType](self, "_getPlaybackRouteType");
      objc_msgSend(MEMORY[0x1E0D191A0], "phoneCallStateMonitor");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "phoneCallState") == 3)
      {
        v7 = 1;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0D191A0], "phoneCallStateMonitor");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v9, "phoneCallState") == 4;

      }
      objc_msgSend(MEMORY[0x1E0D191C0], "sharedPowerLogger");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      audioSourceType = self->_audioSourceType;
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "timeIntervalSince1970");
      objc_msgSend(v11, "powerLogSelfTriggerSuppressionStartWithSpeakerType:withAudioSource:atTime:isPhoneCall:", v5, audioSourceType, v7);
      goto LABEL_11;
    }
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

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (CSSpeechManager)speechManager
{
  return (CSSpeechManager *)objc_loadWeakRetained((id *)&self->_speechManager);
}

- (void)setSpeechManager:(id)a3
{
  objc_storeWeak((id *)&self->_speechManager, a3);
}

- (CSAsset)currentAsset
{
  return self->_currentAsset;
}

- (void)setCurrentAsset:(id)a3
{
  objc_storeStrong((id *)&self->_currentAsset, a3);
}

- (CSKeywordAnalyzerNDAPI)keywordAnalyzer
{
  return self->_keywordAnalyzer;
}

- (void)setKeywordAnalyzer:(id)a3
{
  objc_storeStrong((id *)&self->_keywordAnalyzer, a3);
}

- (BOOL)isKeywordAnalyzerCorrupted
{
  return self->_isKeywordAnalyzerCorrupted;
}

- (void)setIsKeywordAnalyzerCorrupted:(BOOL)a3
{
  self->_isKeywordAnalyzerCorrupted = a3;
}

- (unint64_t)outputAudioChannel
{
  return self->_outputAudioChannel;
}

- (void)setOutputAudioChannel:(unint64_t)a3
{
  self->_outputAudioChannel = a3;
}

- (CSAudioStream)audioStream
{
  return self->_audioStream;
}

- (void)setAudioStream:(id)a3
{
  objc_storeStrong((id *)&self->_audioStream, a3);
}

- (BOOL)isSiriClientListening
{
  return self->_isSiriClientListening;
}

- (void)setIsSiriClientListening:(BOOL)a3
{
  self->_isSiriClientListening = a3;
}

- (BOOL)selfTriggerEnabled
{
  return self->_selfTriggerEnabled;
}

- (void)setSelfTriggerEnabled:(BOOL)a3
{
  self->_selfTriggerEnabled = a3;
}

- (BOOL)isListenPollingStarting
{
  return self->_isListenPollingStarting;
}

- (void)setIsListenPollingStarting:(BOOL)a3
{
  self->_isListenPollingStarting = a3;
}

- (NSString)audioProviderUUID
{
  return self->_audioProviderUUID;
}

- (void)setAudioProviderUUID:(id)a3
{
  objc_storeStrong((id *)&self->_audioProviderUUID, a3);
}

- (CSAudioTimeConverter)audioTimeConverter
{
  return self->_audioTimeConverter;
}

- (void)setAudioTimeConverter:(id)a3
{
  objc_storeStrong((id *)&self->_audioTimeConverter, a3);
}

- (CSContinuousVoiceTriggerConfig)selfTriggerConfig
{
  return self->_selfTriggerConfig;
}

- (void)setSelfTriggerConfig:(id)a3
{
  objc_storeStrong((id *)&self->_selfTriggerConfig, a3);
}

- (CSAudioStreamProviding)audioTapProvider
{
  return (CSAudioStreamProviding *)objc_loadWeakRetained((id *)&self->_audioTapProvider);
}

- (void)setAudioTapProvider:(id)a3
{
  objc_storeWeak((id *)&self->_audioTapProvider, a3);
}

- (unint64_t)audioSourceType
{
  return self->_audioSourceType;
}

- (void)setAudioSourceType:(unint64_t)a3
{
  self->_audioSourceType = a3;
}

- (unint64_t)mode
{
  return self->_mode;
}

- (void)setMode:(unint64_t)a3
{
  self->_mode = a3;
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (CSOSTransaction)modelLoadTransaction
{
  return self->_modelLoadTransaction;
}

- (void)setModelLoadTransaction:(id)a3
{
  objc_storeStrong((id *)&self->_modelLoadTransaction, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelLoadTransaction, 0);
  objc_destroyWeak((id *)&self->_audioTapProvider);
  objc_storeStrong((id *)&self->_selfTriggerConfig, 0);
  objc_storeStrong((id *)&self->_audioTimeConverter, 0);
  objc_storeStrong((id *)&self->_audioProviderUUID, 0);
  objc_storeStrong((id *)&self->_audioStream, 0);
  objc_storeStrong((id *)&self->_keywordAnalyzer, 0);
  objc_storeStrong((id *)&self->_currentAsset, 0);
  objc_destroyWeak((id *)&self->_speechManager);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

_BYTE *__62__CSSelfTriggerDetector__hardStopAndRestartAudioQueueIfNeeded__block_invoke(uint64_t a1)
{
  id WeakRetained;
  _BYTE *result;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 96));
  objc_msgSend(WeakRetained, "destroyRecordingAudioQueue");

  result = *(_BYTE **)(a1 + 32);
  if (result[10])
    return (_BYTE *)objc_msgSend(result, "_startListenPolling");
  return result;
}

void __80__CSSelfTriggerDetector_CSPhoneCallStateMonitor_didRecievePhoneCallStateChange___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  os_log_t *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  int v10;
  const char *v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD **)(a1 + 32);
  if (v2[13] == 1 && objc_msgSend(v2, "_isTelephonyTapAvailable"))
  {
    v3 = (os_log_t *)MEMORY[0x1E0D18F58];
    v4 = *MEMORY[0x1E0D18F58];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 40);
      v10 = 136315394;
      v11 = "-[CSSelfTriggerDetector CSPhoneCallStateMonitor:didRecievePhoneCallStateChange:]_block_invoke";
      v12 = 2050;
      v13 = v5;
      _os_log_impl(&dword_1C2614000, v4, OS_LOG_TYPE_DEFAULT, "%s phoneCall state : %{public}lu", (uint8_t *)&v10, 0x16u);
    }
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 112);
    if (*(_QWORD *)(a1 + 40) == 3)
    {
      if (v6 == 1)
        return;
      v7 = *v3;
      if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
      {
        v10 = 136315138;
        v11 = "-[CSSelfTriggerDetector CSPhoneCallStateMonitor:didRecievePhoneCallStateChange:]_block_invoke";
        _os_log_impl(&dword_1C2614000, v7, OS_LOG_TYPE_DEFAULT, "%s Transit to telephony audio tap mode", (uint8_t *)&v10, 0xCu);
      }
      v8 = 1;
    }
    else
    {
      if (!v6)
        return;
      v9 = *v3;
      if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
      {
        v10 = 136315138;
        v11 = "-[CSSelfTriggerDetector CSPhoneCallStateMonitor:didRecievePhoneCallStateChange:]_block_invoke";
        _os_log_impl(&dword_1C2614000, v9, OS_LOG_TYPE_DEFAULT, "%s Transit to default mode", (uint8_t *)&v10, 0xCu);
      }
      v8 = 0;
    }
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 112) = v8;
    objc_msgSend(*(id *)(a1 + 32), "_hardStopAndRestartAudioQueueIfNeeded");
  }
}

_BYTE *__74__CSSelfTriggerDetector_CSAudioServerCrashMonitorDidReceiveServerRestart___block_invoke(uint64_t a1)
{
  NSObject *v2;
  _BYTE *result;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0D18F58];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[CSSelfTriggerDetector CSAudioServerCrashMonitorDidReceiveServerRestart:]_block_invoke";
    _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v4, 0xCu);
  }
  result = *(_BYTE **)(a1 + 32);
  if (result[10])
    return (_BYTE *)objc_msgSend(result, "_startListenPolling");
  return result;
}

void __73__CSSelfTriggerDetector_siriClientBehaviorMonitor_willStopStream_reason___block_invoke(uint64_t a1)
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
    v4 = "-[CSSelfTriggerDetector siriClientBehaviorMonitor:willStopStream:reason:]_block_invoke";
    _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s Siri Client will stop listening, resume selfTrigger listen", (uint8_t *)&v3, 0xCu);
  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 9) = 0;
}

void __79__CSSelfTriggerDetector_siriClientBehaviorMonitor_didStopStream_withEventUUID___block_invoke(uint64_t a1)
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
    v4 = "-[CSSelfTriggerDetector siriClientBehaviorMonitor:didStopStream:withEventUUID:]_block_invoke";
    _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s Siri Client stops listening now, selfTrigger can listen now", (uint8_t *)&v3, 0xCu);
  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 9) = 0;
}

void __111__CSSelfTriggerDetector_siriClientBehaviorMonitor_didStartStreamWithContext_successfully_option_withEventUUID___block_invoke(uint64_t a1)
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
    v4 = "-[CSSelfTriggerDetector siriClientBehaviorMonitor:didStartStreamWithContext:successfully:option:withEventUUID:]_block_invoke";
    _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s Siri Client starts listening now, selfTrigger shouldn't listen now", (uint8_t *)&v3, 0xCu);
  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 9) = 1;
}

void __66__CSSelfTriggerDetector_audioStreamProvider_audioBufferAvailable___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t v19[128];
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "processSampleCount:hostTime:", objc_msgSend(*(id *)(a1 + 40), "startSampleCount"), objc_msgSend(*(id *)(a1 + 40), "hostTime"));
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v2 + 40))
  {
    if (*(_BYTE *)(v2 + 10))
    {
      objc_msgSend(*(id *)(v2 + 48), "getAnalyzedResultsFromAudioChunk:", *(_QWORD *)(a1 + 40));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 0u;
      v16 = 0u;
      v17 = 0u;
      v18 = 0u;
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v4)
      {
        v5 = v4;
        v6 = *(_QWORD *)v16;
        do
        {
          v7 = 0;
          do
          {
            if (*(_QWORD *)v16 != v6)
              objc_enumerationMutation(v3);
            v8 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v7);
            objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "voiceTriggerPhIds");
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v8, "phId"));
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            v11 = objc_msgSend(v9, "containsObject:", v10);

            if (v11)
              objc_msgSend(*(id *)(a1 + 32), "_keywordAnalyzerNDAPI:hasResultAvailable:forChannel:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48), v8, objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "activeChannel"));
            ++v7;
          }
          while (v5 != v7);
          v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        }
        while (v5);
      }

    }
    else
    {
      v13 = _block_invoke_enableHeartbeat_26415;
      if (__ROR8__(0xCCCCCCCCCCCCCCCDLL * _block_invoke_enableHeartbeat_26415, 1) <= 0x1999999999999999uLL)
      {
        v14 = *MEMORY[0x1E0D18F58];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v21 = "-[CSSelfTriggerDetector audioStreamProvider:audioBufferAvailable:]_block_invoke";
          v22 = 2050;
          v23 = v13;
          _os_log_error_impl(&dword_1C2614000, v14, OS_LOG_TYPE_ERROR, "%s enablePolicy is NO, we shouldn't receive audio here, heartbeat = %{public}lld", buf, 0x16u);
          v13 = _block_invoke_enableHeartbeat_26415;
        }
      }
      _block_invoke_enableHeartbeat_26415 = v13 + 1;
    }
  }
  else
  {
    v12 = *MEMORY[0x1E0D18F58];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v21 = "-[CSSelfTriggerDetector audioStreamProvider:audioBufferAvailable:]_block_invoke";
      _os_log_error_impl(&dword_1C2614000, v12, OS_LOG_TYPE_ERROR, "%s Could not find Assets. Cannot process Audio", buf, 0xCu);
    }
  }
}

uint64_t __71__CSSelfTriggerDetector_audioStreamProvider_didStopStreamUnexpectedly___block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  objc_msgSend(*(id *)(a1 + 32), "_unloadCurrentAssetToAnalyzer");
  objc_msgSend(*(id *)(a1 + 32), "_transitCurrentStateTo:", 0);
  result = objc_msgSend(*(id *)(a1 + 32), "_reset");
  v3 = *(_QWORD *)(a1 + 40);
  if (v3 != -11785 && v3 != 8)
    return objc_msgSend(*(id *)(a1 + 32), "_startListenPolling");
  return result;
}

void __54__CSSelfTriggerDetector__stopListeningWithCompletion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  id v15;
  char v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    v6 = (void *)*MEMORY[0x1E0D18F58];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_ERROR))
    {
      v11 = v6;
      objc_msgSend(v5, "localizedDescription");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v18 = "-[CSSelfTriggerDetector _stopListeningWithCompletion:]_block_invoke";
      v19 = 2114;
      v20 = v12;
      _os_log_error_impl(&dword_1C2614000, v11, OS_LOG_TYPE_ERROR, "%s Cannot stop listening : %{public}@", buf, 0x16u);

    }
  }
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(a1 + 40);
  v9 = *(NSObject **)(v7 + 16);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __54__CSSelfTriggerDetector__stopListeningWithCompletion___block_invoke_20;
  v13[3] = &unk_1E7C29100;
  v13[4] = v7;
  v16 = a2;
  v14 = v5;
  v15 = v8;
  v10 = v5;
  dispatch_async(v9, v13);

}

uint64_t __54__CSSelfTriggerDetector__stopListeningWithCompletion___block_invoke_20(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_unloadCurrentAssetToAnalyzer");
  objc_msgSend(*(id *)(a1 + 32), "_transitCurrentStateTo:", 0);
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 40));
  return result;
}

uint64_t __51__CSSelfTriggerDetector_stopAnalyzeWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  int v6;
  const char *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = (void *)*MEMORY[0x1E0D18F58];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(a1 + 32);
    v4 = v2;
    v6 = 136315394;
    v7 = "-[CSSelfTriggerDetector stopAnalyzeWithCompletion:]_block_invoke";
    v8 = 2048;
    v9 = objc_msgSend(v3, "audioSourceType");
    _os_log_impl(&dword_1C2614000, v4, OS_LOG_TYPE_DEFAULT, "%s audioSourceType : %lu", (uint8_t *)&v6, 0x16u);

  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 10) = 0;
  return objc_msgSend(*(id *)(a1 + 32), "_stopListeningWithCompletion:", *(_QWORD *)(a1 + 40));
}

uint64_t __52__CSSelfTriggerDetector__startListenWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __52__CSSelfTriggerDetector__startListenWithCompletion___block_invoke_19(uint64_t a1, char a2, void *a3)
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
  v8 = *(NSObject **)(v6 + 16);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __52__CSSelfTriggerDetector__startListenWithCompletion___block_invoke_2;
  v10[3] = &unk_1E7C29100;
  v13 = a2;
  v10[4] = v6;
  v11 = v5;
  v12 = v7;
  v9 = v5;
  dispatch_async(v8, v10);

}

uint64_t __52__CSSelfTriggerDetector__startListenWithCompletion___block_invoke_2(uint64_t a1)
{
  _BYTE *v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = *(_BYTE **)(a1 + 32);
  if (!*(_BYTE *)(a1 + 56))
  {
    objc_msgSend(*(id *)(a1 + 32), "_unloadCurrentAssetToAnalyzer");
    v3 = *(void **)(a1 + 32);
    v4 = 0;
    goto LABEL_5;
  }
  if (v2[10])
  {
    v3 = *(void **)(a1 + 32);
    v4 = 2;
LABEL_5:
    objc_msgSend(v3, "_transitCurrentStateTo:", v4);
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  v5 = *MEMORY[0x1E0D18F58];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_ERROR))
  {
    v7 = 136315138;
    v8 = "-[CSSelfTriggerDetector _startListenWithCompletion:]_block_invoke_2";
    _os_log_error_impl(&dword_1C2614000, v5, OS_LOG_TYPE_ERROR, "%s Received didStartRecording when enablePolicy is off", (uint8_t *)&v7, 0xCu);
    v2 = *(_BYTE **)(a1 + 32);
  }
  objc_msgSend(v2, "_stopListeningWithCompletion:", 0);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __68__CSSelfTriggerDetector__startListenPollingWithInterval_completion___block_invoke(uint64_t a1, char a2, void *a3)
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
      *(_QWORD *)&location[4] = "-[CSSelfTriggerDetector _startListenPollingWithInterval:completion:]_block_invoke";
      v16 = 2114;
      v17 = v11;
      _os_log_error_impl(&dword_1C2614000, v10, OS_LOG_TYPE_ERROR, "%s listen polling has failed : %{public}@", location, 0x16u);

    }
    objc_initWeak((id *)location, *(id *)(a1 + 32));
    v8 = dispatch_time(0, (uint64_t)(*(double *)(a1 + 48) * 1000000000.0));
    v9 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __68__CSSelfTriggerDetector__startListenPollingWithInterval_completion___block_invoke_11;
    block[3] = &unk_1E7C29088;
    objc_copyWeak(v14, (id *)location);
    v14[1] = *(id *)(a1 + 48);
    v13 = *(id *)(a1 + 40);
    dispatch_after(v8, v9, block);

    objc_destroyWeak(v14);
    objc_destroyWeak((id *)location);
  }

}

void __68__CSSelfTriggerDetector__startListenPollingWithInterval_completion___block_invoke_11(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_startListenPollingWithInterval:completion:", *(_QWORD *)(a1 + 32), *(double *)(a1 + 48));

}

uint64_t __44__CSSelfTriggerDetector__startListenPolling__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 11) = 0;
  return result;
}

uint64_t __37__CSSelfTriggerDetector_startAnalyze__block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 10) = 1;
  return objc_msgSend(*(id *)(a1 + 32), "_startListenPolling");
}

uint64_t __44__CSSelfTriggerDetector_unregisterObserver___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeObject:", *(_QWORD *)(a1 + 40));
}

uint64_t __42__CSSelfTriggerDetector_registerObserver___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "addObject:", *(_QWORD *)(a1 + 40));
}

uint64_t __37__CSSelfTriggerDetector_currentState__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 120);
  return result;
}

uint64_t __34__CSSelfTriggerDetector_setAsset___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setAsset:", *(_QWORD *)(a1 + 40));
}

uint64_t __30__CSSelfTriggerDetector_reset__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reset");
}

void __30__CSSelfTriggerDetector_start__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _BOOL8 v6;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 10) = 0;
  objc_msgSend(MEMORY[0x1E0D191F0], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "registerObserver:", *(_QWORD *)(a1 + 32));

  objc_msgSend(MEMORY[0x1E0D19028], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:", *(_QWORD *)(a1 + 32));

  objc_msgSend(MEMORY[0x1E0D191A0], "phoneCallStateMonitor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:", *(_QWORD *)(a1 + 32));

  if (objc_msgSend(*(id *)(a1 + 32), "_isTelephonyTapAvailable"))
  {
    objc_msgSend(MEMORY[0x1E0D191A0], "phoneCallStateMonitor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "phoneCallState") == 3;

    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 112) = v6;
  }
}

@end
