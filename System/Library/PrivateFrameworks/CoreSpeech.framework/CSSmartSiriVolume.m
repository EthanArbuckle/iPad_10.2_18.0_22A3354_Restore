@implementation CSSmartSiriVolume

- (CSSmartSiriVolume)initWithSamplingRate:(float)a3
{
  CSSmartSiriVolume *v4;
  id v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *queue;
  float noiseMicSensitivityOffset;
  double v9;
  float v10;
  float v11;
  os_log_t *v12;
  NSObject *v13;
  uint64_t v14;
  int v15;
  double v16;
  float v17;
  float v18;
  NSObject *v19;
  uint64_t v20;
  double v21;
  objc_super v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  double v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v23.receiver = self;
  v23.super_class = (Class)CSSmartSiriVolume;
  v4 = -[CSSmartSiriVolume init](&v23, sel_init);
  if (v4)
  {
    objc_msgSend((id)objc_opt_class(), "description");
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v6 = dispatch_queue_create((const char *)objc_msgSend(v5, "UTF8String"), 0);
    queue = v4->_queue;
    v4->_queue = (OS_dispatch_queue *)v6;

    -[CSSmartSiriVolume _setDefaultParameters](v4, "_setDefaultParameters");
    noiseMicSensitivityOffset = v4->_noiseMicSensitivityOffset;
    if (objc_msgSend(MEMORY[0x1E0D18FC0], "getSSVDeviceType") == 2)
      noiseMicSensitivityOffset = v4->_noiseMicSensitivityOffsetDeviceSimple;
    *(float *)&v9 = (float)((float)(v4->_noiseTTSMappingInputRangeLow + v4->_noiseTTSMappingInputRangeHigh) * 0.5)
                  - noiseMicSensitivityOffset;
    -[CSSmartSiriVolume _convertDB2Mag:](v4, "_convertDB2Mag:", v9);
    v11 = v10;
    v12 = (os_log_t *)MEMORY[0x1E0D18F20];
    v13 = *MEMORY[0x1E0D18F20];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F20], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v25 = "-[CSSmartSiriVolume initWithSamplingRate:]";
      v26 = 2050;
      v27 = v11;
      _os_log_impl(&dword_1C2614000, v13, OS_LOG_TYPE_DEFAULT, "%s SmartSiriVolume init value for noise estimation %{public}f", buf, 0x16u);
    }
    v14 = operator new();
    *(_DWORD *)(v14 + 112) = 0;
    *(_OWORD *)v14 = 0u;
    *(_OWORD *)(v14 + 16) = 0u;
    *(_OWORD *)(v14 + 32) = 0u;
    *(_OWORD *)(v14 + 48) = 0u;
    *(_OWORD *)(v14 + 64) = 0u;
    *(_OWORD *)(v14 + 80) = 0u;
    *(_DWORD *)(v14 + 128) = 1084227584;
    *(_QWORD *)(v14 + 132) = 0x5F00000005;
    *(_DWORD *)(v14 + 140) = 1119617024;
    *(_BYTE *)(v14 + 144) = 0;
    *(_QWORD *)(v14 + 168) = 0;
    *(_QWORD *)(v14 + 176) = 0;
    *(_QWORD *)(v14 + 160) = 0;
    std::unique_ptr<SmartSiriVolume>::reset[abi:ne180100](&v4->_smartSiriVolumeNoiseLevel.__ptr_.__value_, (SmartSiriVolume *)v14);
    v15 = a3;
    SmartSiriVolume::initialize((uint64_t)v4->_smartSiriVolumeNoiseLevel.__ptr_.__value_, a3, 1024, objc_msgSend(MEMORY[0x1E0D19260], "getNumElementInBitset:", v4->_noiseLevelChannelBitset), v4->_energyBufferSize, v4->_noiseLowerPercentile, v4->_noiseUpperPercentile, v11, v4->_noiseTimeConstant, noiseMicSensitivityOffset);
    *(float *)&v16 = (float)((float)(v4->_LKFSTTSMappingInputRangeLow + v4->_LKFSTTSMappingInputRangeHigh) * 0.5)
                   - v4->_LKFSMicSensitivityOffset;
    -[CSSmartSiriVolume _convertDB2Mag:](v4, "_convertDB2Mag:", v16);
    v18 = v17;
    v19 = *v12;
    if (os_log_type_enabled(*v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v25 = "-[CSSmartSiriVolume initWithSamplingRate:]";
      v26 = 2050;
      v27 = v18;
      _os_log_impl(&dword_1C2614000, v19, OS_LOG_TYPE_DEFAULT, "%s SmartSiriVolume init value for LKFS estimation %{public}f", buf, 0x16u);
    }
    v20 = operator new();
    *(_DWORD *)(v20 + 112) = 0;
    *(_OWORD *)v20 = 0u;
    *(_OWORD *)(v20 + 16) = 0u;
    *(_OWORD *)(v20 + 32) = 0u;
    *(_OWORD *)(v20 + 48) = 0u;
    *(_OWORD *)(v20 + 64) = 0u;
    *(_OWORD *)(v20 + 80) = 0u;
    *(_DWORD *)(v20 + 128) = 1084227584;
    *(_QWORD *)(v20 + 132) = 0x5F00000005;
    *(_DWORD *)(v20 + 140) = 1119617024;
    *(_BYTE *)(v20 + 144) = 0;
    *(_QWORD *)(v20 + 168) = 0;
    *(_QWORD *)(v20 + 176) = 0;
    *(_QWORD *)(v20 + 160) = 0;
    std::unique_ptr<SmartSiriVolume>::reset[abi:ne180100](&v4->_smartSiriVolumeLKFS.__ptr_.__value_, (SmartSiriVolume *)v20);
    *(float *)&v21 = SmartSiriVolume::initialize((uint64_t)v4->_smartSiriVolumeLKFS.__ptr_.__value_, v15, 1024, objc_msgSend(MEMORY[0x1E0D19260], "getNumElementInBitset:", v4->_LKFSChannelBitset), v4->_energyBufferSize, v4->_LKFSLowerPercentile, v4->_LKFSUpperPercentile, v18, v4->_LKFSTimeConstant, v4->_LKFSMicSensitivityOffset);
    -[CSSmartSiriVolume _reset](v4, "_reset", v21);
  }
  return v4;
}

- (void)startSmartSiriVolume
{
  CSPolicy *v3;
  CSPolicy *ssvEnablePolicy;
  CSPolicy *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  NSObject *queue;
  void *v12;
  void *v13;
  _QWORD v14[5];
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  id location;

  -[CSSmartSiriVolume initializeMediaPlayingState](self, "initializeMediaPlayingState");
  -[CSSmartSiriVolume initializeAlarmState](self, "initializeAlarmState");
  -[CSSmartSiriVolume initializeTimerState](self, "initializeTimerState");
  -[CSSmartSiriVolume fetchInitSystemVolumes](self, "fetchInitSystemVolumes");
  objc_initWeak(&location, self);
  +[CSSmartSiriVolumeEnablePolicyFactory smartSiriVolumeEnablePolicy](CSSmartSiriVolumeEnablePolicyFactory, "smartSiriVolumeEnablePolicy");
  v3 = (CSPolicy *)objc_claimAutoreleasedReturnValue();
  ssvEnablePolicy = self->_ssvEnablePolicy;
  self->_ssvEnablePolicy = v3;

  v5 = self->_ssvEnablePolicy;
  v6 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __41__CSSmartSiriVolume_startSmartSiriVolume__block_invoke;
  v17[3] = &unk_1E7C26D40;
  objc_copyWeak(&v18, &location);
  -[CSPolicy setCallback:](v5, "setCallback:", v17);
  if (!-[CSPolicy isEnabled](self->_ssvEnablePolicy, "isEnabled"))
    -[CSSmartSiriVolume _pauseSSVProcessing](self, "_pauseSSVProcessing");
  +[CSSmartSiriVolumeRunPolicyFactory smartSiriVolumeRunPolicy](CSSmartSiriVolumeRunPolicyFactory, "smartSiriVolumeRunPolicy");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSSmartSiriVolume setEnablePolicy:](self, "setEnablePolicy:", v7);

  -[CSSmartSiriVolume enablePolicy](self, "enablePolicy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v6;
  v15[1] = 3221225472;
  v15[2] = __41__CSSmartSiriVolume_startSmartSiriVolume__block_invoke_37;
  v15[3] = &unk_1E7C26D40;
  objc_copyWeak(&v16, &location);
  objc_msgSend(v8, "setCallback:", v15);

  -[CSSmartSiriVolume enablePolicy](self, "enablePolicy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEnabled");

  if (v10)
  {
    queue = self->_queue;
    v14[0] = v6;
    v14[1] = 3221225472;
    v14[2] = __41__CSSmartSiriVolume_startSmartSiriVolume__block_invoke_2;
    v14[3] = &unk_1E7C292C8;
    v14[4] = self;
    dispatch_async(queue, v14);
  }
  objc_msgSend(MEMORY[0x1E0D19028], "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObserver:", self);

  objc_msgSend(MEMORY[0x1E0D191F0], "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "registerObserver:", self);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
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
    v2 = *MEMORY[0x1E0D18F20];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F20], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v6 = "-[CSSmartSiriVolume _startListenPolling]";
      _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s Already started listen polling, skip", buf, 0xCu);
    }
  }
  else
  {
    v3 = MEMORY[0x1E0C809B0];
    self->_isListenPollingStarting = 1;
    v4[0] = v3;
    v4[1] = 3221225472;
    v4[2] = __40__CSSmartSiriVolume__startListenPolling__block_invoke;
    v4[3] = &unk_1E7C29060;
    v4[4] = self;
    -[CSSmartSiriVolume _startListenPollingWithInterval:completion:](self, "_startListenPollingWithInterval:completion:", v4, 1.0);
  }
}

- (void)_startListenPollingWithInterval:(double)a3 completion:(id)a4
{
  id v6;
  os_log_t *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  NSObject *v12;
  _QWORD v13[5];
  id v14;
  double v15;
  uint8_t buf[4];
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = (os_log_t *)MEMORY[0x1E0D18F20];
  v8 = *MEMORY[0x1E0D18F20];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F20], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v17 = "-[CSSmartSiriVolume _startListenPollingWithInterval:completion:]";
    _os_log_impl(&dword_1C2614000, v8, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  -[CSSmartSiriVolume audioStream](self, "audioStream");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "isStreaming"))
  {

  }
  else
  {
    -[CSSmartSiriVolume enablePolicy](self, "enablePolicy");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEnabled");

    if (v11)
    {
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __64__CSSmartSiriVolume__startListenPollingWithInterval_completion___block_invoke;
      v13[3] = &unk_1E7C290B0;
      v13[4] = self;
      v15 = a3;
      v14 = v6;
      -[CSSmartSiriVolume _startListenWithCompletion:](self, "_startListenWithCompletion:", v13);

      goto LABEL_11;
    }
  }
  v12 = *v7;
  if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v17 = "-[CSSmartSiriVolume _startListenPollingWithInterval:completion:]";
    _os_log_impl(&dword_1C2614000, v12, OS_LOG_TYPE_DEFAULT, "%s Skip listen polling since audio is streaming / Siri disabled", buf, 0xCu);
  }
  if (v6)
    (*((void (**)(id, _QWORD, _QWORD))v6 + 2))(v6, 0, 0);
LABEL_11:

}

- (void)_startListenWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  void (**v6)(_QWORD, _QWORD, _QWORD);
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  objc_class *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  NSObject *v17;
  void *v18;
  id v19;
  id v20;
  _QWORD v21[5];
  void (**v22)(_QWORD, _QWORD, _QWORD);
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __48__CSSmartSiriVolume__startListenWithCompletion___block_invoke;
  v25[3] = &unk_1E7C290D8;
  v20 = v4;
  v26 = v20;
  v6 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1C3BC4734](v25);
  objc_msgSend(MEMORY[0x1E0D19008], "contextForBuiltInVoiceTrigger");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[CSSpeechManager sharedManagerForCoreSpeechDaemon](CSSpeechManager, "sharedManagerForCoreSpeechDaemon");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  objc_msgSend(v8, "audioProviderWithContext:error:", v7, &v24);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v24;

  if (v9)
  {
    v19 = v9;
    objc_msgSend(MEMORY[0x1E0D19058], "defaultRequestWithContext:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setRequiresHistoricalBuffer:", 1);
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0;
    objc_msgSend(v19, "audioStreamWithRequest:streamName:error:", v11, v13, &v23);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v23;

    if (v14)
    {
      -[CSSmartSiriVolume setAudioStream:](self, "setAudioStream:", v14);
      objc_msgSend(v14, "setDelegate:", self);
      objc_msgSend(MEMORY[0x1E0D19030], "noAlertOption");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = v5;
      v21[1] = 3221225472;
      v21[2] = __48__CSSmartSiriVolume__startListenWithCompletion___block_invoke_2;
      v21[3] = &unk_1E7C29128;
      v21[4] = self;
      v22 = v6;
      objc_msgSend(v14, "startAudioStreamWithOption:completion:", v16, v21);

    }
    else
    {
      v17 = (id)*MEMORY[0x1E0D18F20];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v15, "description");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315394;
        v28 = "-[CSSmartSiriVolume _startListenWithCompletion:]";
        v29 = 2114;
        v30 = v18;
        _os_log_error_impl(&dword_1C2614000, v17, OS_LOG_TYPE_ERROR, "%s Failed in requesting audio stream : %{public}@", buf, 0x16u);

      }
      ((void (**)(_QWORD, _QWORD, id))v6)[2](v6, 0, v15);
    }

  }
  else
  {
    ((void (**)(_QWORD, _QWORD, id))v6)[2](v6, 0, v10);
  }

}

- (void)_stopListening
{
  os_log_t *v3;
  NSObject *v4;
  void *v5;
  BOOL v6;
  void *v7;
  NSObject *v8;
  int v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = (os_log_t *)MEMORY[0x1E0D18F20];
  v4 = *MEMORY[0x1E0D18F20];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F20], OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136315138;
    v10 = "-[CSSmartSiriVolume _stopListening]";
    _os_log_impl(&dword_1C2614000, v4, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v9, 0xCu);
  }
  -[CSSmartSiriVolume audioStream](self, "audioStream");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5 == 0;

  if (v6)
  {
    v8 = *v3;
    if (os_log_type_enabled(*v3, OS_LOG_TYPE_ERROR))
    {
      v9 = 136315138;
      v10 = "-[CSSmartSiriVolume _stopListening]";
      _os_log_error_impl(&dword_1C2614000, v8, OS_LOG_TYPE_ERROR, "%s No audio stream to stop, we shouldn't hit this", (uint8_t *)&v9, 0xCu);
    }
  }
  else
  {
    -[CSSmartSiriVolume audioStream](self, "audioStream");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stopAudioStreamWithOption:completion:", 0, &__block_literal_global_15526);

  }
}

- (void)initializeMediaPlayingState
{
  void *v3;
  uint64_t v4;
  NSObject *queue;
  NSObject *v6;
  _QWORD v7[6];
  uint8_t buf[4];
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  +[CSMediaPlayingMonitor sharedInstance](CSMediaPlayingMonitor, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:", self);
  objc_msgSend(v3, "initializeMediaPlayingState");
  v4 = objc_msgSend(v3, "mediaPlayingState");
  if ((unint64_t)(v4 - 1) > 1)
  {
    v6 = *MEMORY[0x1E0D18F20];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F20], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v9 = "-[CSSmartSiriVolume initializeMediaPlayingState]";
      _os_log_impl(&dword_1C2614000, v6, OS_LOG_TYPE_DEFAULT, "%s SmartSiriVolume haven't got MediaRemote callback yet, let's assume media is playing.", buf, 0xCu);
    }
  }
  else
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __48__CSSmartSiriVolume_initializeMediaPlayingState__block_invoke;
    v7[3] = &unk_1E7C29178;
    v7[4] = self;
    v7[5] = v4;
    dispatch_async(queue, v7);
  }

}

- (void)initializeAlarmState
{
  void *v3;
  uint64_t v4;
  NSObject *queue;
  _QWORD v6[6];

  +[CSAlarmMonitor sharedInstance](CSAlarmMonitor, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "initializeAlarmState");
  v4 = objc_msgSend(v3, "alarmState");
  if ((unint64_t)(v4 - 1) <= 1)
  {
    queue = self->_queue;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __41__CSSmartSiriVolume_initializeAlarmState__block_invoke;
    v6[3] = &unk_1E7C29178;
    v6[4] = self;
    v6[5] = v4;
    dispatch_async(queue, v6);
  }

}

- (void)initializeTimerState
{
  void *v3;
  uint64_t v4;
  NSObject *queue;
  _QWORD v6[6];

  +[CSTimerMonitor sharedInstance](CSTimerMonitor, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "initializeTimerState");
  v4 = objc_msgSend(v3, "timerState");
  if ((unint64_t)(v4 - 1) <= 1)
  {
    queue = self->_queue;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __41__CSSmartSiriVolume_initializeTimerState__block_invoke;
    v6[3] = &unk_1E7C29178;
    v6[4] = self;
    v6[5] = v4;
    dispatch_async(queue, v6);
  }

}

- (void)fetchInitSystemVolumes
{
  void *v3;
  NSObject *queue;
  id v5;
  _QWORD v6[5];
  id v7;

  objc_msgSend(MEMORY[0x1E0D192B0], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  queue = self->_queue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __43__CSSmartSiriVolume_fetchInitSystemVolumes__block_invoke;
  v6[3] = &unk_1E7C292A0;
  v6[4] = self;
  v7 = v3;
  v5 = v3;
  dispatch_async(queue, v6);

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
  v7[2] = __30__CSSmartSiriVolume_setAsset___block_invoke;
  v7[3] = &unk_1E7C292A0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)_setAsset:(id)a3
{
  id v5;
  CSAsset **p_currentAsset;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;
  float v14;
  float v15;
  float v16;
  float v17;
  float v18;
  float v19;
  float v20;
  float v21;
  float v22;
  float v23;
  float v24;
  float v25;
  float v26;
  NSObject *v27;
  void *v28;
  NSObject *v29;
  int v30;
  const char *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    p_currentAsset = &self->_currentAsset;
    objc_storeStrong((id *)&self->_currentAsset, a3);
    self->_noiseLevelChannelBitset = -[CSAsset SSVNoiseLevelChannelBitset](self->_currentAsset, "SSVNoiseLevelChannelBitset");
    self->_LKFSChannelBitset = -[CSAsset SSVLKFSChannelBitset](self->_currentAsset, "SSVLKFSChannelBitset");
    self->_energyBufferSize = -[CSAsset SSVEnergyBufferSize](self->_currentAsset, "SSVEnergyBufferSize");
    self->_noiseLowerPercentile = -[CSAsset SSVNoiseLowerPercentile](self->_currentAsset, "SSVNoiseLowerPercentile");
    self->_noiseUpperPercentile = -[CSAsset SSVNoiseUpperPercentile](self->_currentAsset, "SSVNoiseUpperPercentile");
    self->_LKFSLowerPercentile = -[CSAsset SSVLKFSLowerPercentile](self->_currentAsset, "SSVLKFSLowerPercentile");
    self->_LKFSUpperPercentile = -[CSAsset SSVLKFSUpperPercentile](self->_currentAsset, "SSVLKFSUpperPercentile");
    -[CSAsset SSVNoiseTimeConstant](self->_currentAsset, "SSVNoiseTimeConstant");
    self->_noiseTimeConstant = v7;
    -[CSAsset SSVNoiseMicSensitivityOffset](self->_currentAsset, "SSVNoiseMicSensitivityOffset");
    self->_noiseMicSensitivityOffset = v8;
    -[CSAsset SSVNoiseMicSensitivityOffsetDeviceSimple](self->_currentAsset, "SSVNoiseMicSensitivityOffsetDeviceSimple");
    self->_noiseMicSensitivityOffsetDeviceSimple = v9;
    -[CSAsset SSVLKFSTimeConstant](self->_currentAsset, "SSVLKFSTimeConstant");
    self->_LKFSTimeConstant = v10;
    -[CSAsset SSVLKFSMicSensitivityOffset](self->_currentAsset, "SSVLKFSMicSensitivityOffset");
    self->_LKFSMicSensitivityOffset = v11;
    -[CSAsset SSVNoiseTTSMappingInputRangeLow](self->_currentAsset, "SSVNoiseTTSMappingInputRangeLow");
    self->_noiseTTSMappingInputRangeLow = v12;
    -[CSAsset SSVNoiseTTSMappingInputRangeHigh](self->_currentAsset, "SSVNoiseTTSMappingInputRangeHigh");
    self->_noiseTTSMappingInputRangeHigh = v13;
    -[CSAsset SSVNoiseTTSMappingOutputRangeLow](self->_currentAsset, "SSVNoiseTTSMappingOutputRangeLow");
    self->_noiseTTSMappingOutputRangeLow = v14;
    -[CSAsset SSVNoiseTTSMappingOutputRangeHigh](self->_currentAsset, "SSVNoiseTTSMappingOutputRangeHigh");
    self->_noiseTTSMappingOutputRangeHigh = v15;
    -[CSAsset SSVLKFSTTSMappingInputRangeLow](self->_currentAsset, "SSVLKFSTTSMappingInputRangeLow");
    self->_LKFSTTSMappingInputRangeLow = v16;
    -[CSAsset SSVLKFSTTSMappingInputRangeHigh](self->_currentAsset, "SSVLKFSTTSMappingInputRangeHigh");
    self->_LKFSTTSMappingInputRangeHigh = v17;
    -[CSAsset SSVLKFSTTSMappingOutputRangeLow](self->_currentAsset, "SSVLKFSTTSMappingOutputRangeLow");
    self->_LKFSTTSMappingOutputRangeLow = v18;
    -[CSAsset SSVLKFSTTSMappingOutputRangeHigh](self->_currentAsset, "SSVLKFSTTSMappingOutputRangeHigh");
    self->_LKFSTTSMappingOutputRangeHigh = v19;
    -[CSAsset SSVUserOffsetInputRangeLow](self->_currentAsset, "SSVUserOffsetInputRangeLow");
    self->_userOffsetInputRangeLow = v20;
    -[CSAsset SSVUserOffsetInputRangeHigh](self->_currentAsset, "SSVUserOffsetInputRangeHigh");
    self->_userOffsetInputRangeHigh = v21;
    -[CSAsset SSVUserOffsetOutputRangeLow](self->_currentAsset, "SSVUserOffsetOutputRangeLow");
    self->_userOffsetOutputRangeLow = v22;
    -[CSAsset SSVUserOffsetOutputRangeHigh](self->_currentAsset, "SSVUserOffsetOutputRangeHigh");
    self->_userOffsetOutputRangeHigh = v23;
    -[CSAsset SSVTTSVolumeLowerLimitDB](self->_currentAsset, "SSVTTSVolumeLowerLimitDB");
    self->_TTSVolumeLowerLimitDB = v24;
    -[CSAsset SSVTTSVolumeUpperLimitDB](self->_currentAsset, "SSVTTSVolumeUpperLimitDB");
    self->_TTSVolumeUpperLimitDB = v25;
    -[CSAsset SSVNoiseWeight](self->_currentAsset, "SSVNoiseWeight");
    self->_noiseWeight = v26;
    v27 = (id)*MEMORY[0x1E0D18F20];
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      -[CSAsset SSVParameterDirectionary](*p_currentAsset, "SSVParameterDirectionary");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = 136315394;
      v31 = "-[CSSmartSiriVolume _setAsset:]";
      v32 = 2114;
      v33 = v28;
      _os_log_impl(&dword_1C2614000, v27, OS_LOG_TYPE_DEFAULT, "%s SmartSiriVolume configure: %{public}@", (uint8_t *)&v30, 0x16u);

    }
  }
  else
  {
    v29 = *MEMORY[0x1E0D18F20];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F20], OS_LOG_TYPE_ERROR))
    {
      v30 = 136315138;
      v31 = "-[CSSmartSiriVolume _setAsset:]";
      _os_log_error_impl(&dword_1C2614000, v29, OS_LOG_TYPE_ERROR, "%s asset is nil, use default parameters(this should not happen).", (uint8_t *)&v30, 0xCu);
    }
  }

}

- (void)_reset
{
  unsigned int v3;
  unsigned int v4;
  uint64_t v5;

  v3 = objc_msgSend(MEMORY[0x1E0D19260], "getNumElementInBitset:", self->_noiseLevelChannelBitset);
  v4 = objc_msgSend(MEMORY[0x1E0D19260], "getNumElementInBitset:", self->_LKFSChannelBitset);
  v5 = 128;
  if (v3 > v4)
    v5 = 120;
  std::vector<float>::resize((char **)&self->_floatBuffer, objc_msgSend(MEMORY[0x1E0D19260], "getNumElementInBitset:", *(Class *)((char *)&self->super.isa + v5)) << 10);
  *(_DWORD *)&self->_shouldPauseSSVProcess = 0;
  self->_mediaIsPlaying = 1;
  self->_processedSampleCount = 0;
  -[CSSmartSiriVolume _resetStartAnalyzeTime](self, "_resetStartAnalyzeTime");
}

- (void)_prepareSoundLevelBufferFromSamples:(unsigned int)a3 soundType:(int64_t)a4
{
  double v4;
  float v7;
  float v8;
  SmartSiriVolume *value;
  SmartSiriVolume *v10;
  float v11;
  float v12;

  if (a4)
  {
    *(float *)&v4 = self->_musicVolumeDB;
    -[CSSmartSiriVolume _convertDB2Mag:](self, "_convertDB2Mag:", v4);
    v8 = 1.0 / v7;
    SmartSiriVolume::feedFloatAudio(self->_smartSiriVolumeLKFS.__ptr_.__value_, self->_floatBuffer.__begin_, a3);
    value = self->_smartSiriVolumeLKFS.__ptr_.__value_;
    v10 = value;
    v11 = v8;
  }
  else
  {
    SmartSiriVolume::feedFloatAudio(self->_smartSiriVolumeNoiseLevel.__ptr_.__value_, self->_floatBuffer.__begin_, a3);
    value = self->_smartSiriVolumeNoiseLevel.__ptr_.__value_;
    v11 = 1.0;
    v10 = value;
  }
  SmartSiriVolume::computeTimeDomainEnergy(v10, v11);
  SmartSiriVolume::prepareEnergyBuffer(value, v12);
}

- (void)prepareSoundLevelBufferFromSamples:(id)a3 soundType:(int64_t)a4 firedVoiceTriggerEvent:(BOOL)a5 triggerStartTimeSampleOffset:(unint64_t)a6 triggerEndTimeSampleOffset:(unint64_t)a7
{
  id v12;
  NSObject *queue;
  id v14;
  _QWORD v15[4];
  id v16;
  CSSmartSiriVolume *v17;
  int64_t v18;
  unint64_t v19;
  unint64_t v20;
  BOOL v21;

  v12 = a3;
  queue = self->_queue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __145__CSSmartSiriVolume_prepareSoundLevelBufferFromSamples_soundType_firedVoiceTriggerEvent_triggerStartTimeSampleOffset_triggerEndTimeSampleOffset___block_invoke;
  v15[3] = &unk_1E7C267C0;
  v16 = v12;
  v17 = self;
  v21 = a5;
  v18 = a4;
  v19 = a6;
  v20 = a7;
  v14 = v12;
  dispatch_async(queue, v15);

}

- (void)_processAudioChunk:(id)a3 soundType:(int64_t)a4
{
  id v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  CSSmartSiriVolume *v15;
  _BYTE *v16;
  _BYTE buf[24];
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = -[CSSmartSiriVolume _processAudioChunk:soundType:]::heartbeat;
  if (__ROR8__(0xEEEEEEEEEEEEEEEFLL * -[CSSmartSiriVolume _processAudioChunk:soundType:]::heartbeat, 2) <= 0x444444444444444uLL)
  {
    v8 = *MEMORY[0x1E0D18F20];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F20], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "-[CSSmartSiriVolume _processAudioChunk:soundType:]";
      *(_WORD *)&buf[12] = 2050;
      *(_QWORD *)&buf[14] = v7;
      _os_log_impl(&dword_1C2614000, v8, OS_LOG_TYPE_INFO, "%s SmartSiriVolume heartbeat = %{public}lld", buf, 0x16u);
      v7 = -[CSSmartSiriVolume _processAudioChunk:soundType:]::heartbeat;
    }
  }
  -[CSSmartSiriVolume _processAudioChunk:soundType:]::heartbeat = v7 + 1;
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v18 = 0;
  v9 = 128;
  if (!a4)
    v9 = 120;
  v10 = *(uint64_t *)((char *)&self->super.isa + v9);
  v11 = (void *)MEMORY[0x1E0D19260];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __50__CSSmartSiriVolume__processAudioChunk_soundType___block_invoke;
  v13[3] = &unk_1E7C267E8;
  v12 = v6;
  v14 = v12;
  v15 = self;
  v16 = buf;
  objc_msgSend(v11, "iterateBitset:block:", v10, v13);
  -[CSSmartSiriVolume _prepareSoundLevelBufferFromSamples:soundType:](self, "_prepareSoundLevelBufferFromSamples:soundType:", *(unsigned int *)(*(_QWORD *)&buf[8] + 24), a4);

  _Block_object_dispose(buf, 8);
}

- (float)estimateSoundLevelbySoundType:(int64_t)a3
{
  NSObject *queue;
  float v4;
  _QWORD block[7];
  uint64_t v7;
  float *v8;
  uint64_t v9;
  int v10;

  v7 = 0;
  v8 = (float *)&v7;
  v9 = 0x2020000000;
  v10 = -998637568;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__CSSmartSiriVolume_estimateSoundLevelbySoundType___block_invoke;
  block[3] = &unk_1E7C26810;
  block[5] = &v7;
  block[6] = a3;
  block[4] = self;
  dispatch_sync(queue, block);
  v4 = v8[6];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (void)_pauseSSVProcessing
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__CSSmartSiriVolume__pauseSSVProcessing__block_invoke;
  block[3] = &unk_1E7C292C8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_resumeSSVProcessing
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__CSSmartSiriVolume__resumeSSVProcessing__block_invoke;
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
  block[2] = __26__CSSmartSiriVolume_reset__block_invoke;
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
  v8[2] = __62__CSSmartSiriVolume_audioStreamProvider_audioBufferAvailable___block_invoke;
  v8[3] = &unk_1E7C292A0;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(queue, v8);

}

- (void)audioStreamProvider:(id)a3 didStopStreamUnexpectedly:(int64_t)a4
{
  id v6;
  NSObject *v7;
  NSObject *queue;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  int64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = *MEMORY[0x1E0D18F20];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F20], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v11 = "-[CSSmartSiriVolume audioStreamProvider:didStopStreamUnexpectedly:]";
    v12 = 2050;
    v13 = a4;
    _os_log_impl(&dword_1C2614000, v7, OS_LOG_TYPE_DEFAULT, "%s stream stopped unexpectedly : %{public}ld", buf, 0x16u);
  }
  if (a4 != -11785)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __67__CSSmartSiriVolume_audioStreamProvider_didStopStreamUnexpectedly___block_invoke;
    block[3] = &unk_1E7C292C8;
    block[4] = self;
    dispatch_async(queue, block);
  }

}

- (void)didDetectKeywordWithResult:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *queue;
  id v7;
  _QWORD v8[4];
  id v9;
  CSSmartSiriVolume *v10;
  uint8_t buf[4];
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = *MEMORY[0x1E0D18F20];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F20], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v12 = "-[CSSmartSiriVolume didDetectKeywordWithResult:]";
    _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_DEFAULT, "%s SmartSiriVolume received VT event!", buf, 0xCu);
  }
  queue = self->_queue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __48__CSSmartSiriVolume_didDetectKeywordWithResult___block_invoke;
  v8[3] = &unk_1E7C292A0;
  v9 = v4;
  v10 = self;
  v7 = v4;
  dispatch_async(queue, v8);

}

- (float)estimatedTTSVolumeForNoiseLevelAndLKFS:(float)a3 LKFS:(float)a4
{
  NSObject *queue;
  float v5;
  _QWORD block[8];
  float v8;
  float v9;
  _QWORD v10[3];
  int v11;
  _QWORD v12[3];
  int v13;
  uint64_t v14;
  float *v15;
  uint64_t v16;
  int v17;

  v14 = 0;
  v15 = (float *)&v14;
  v16 = 0x2020000000;
  v17 = -998637568;
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x2020000000;
  v13 = -1041235968;
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2020000000;
  v11 = -1041235968;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__CSSmartSiriVolume_estimatedTTSVolumeForNoiseLevelAndLKFS_LKFS___block_invoke;
  block[3] = &unk_1E7C26838;
  v8 = a3;
  v9 = a4;
  block[4] = self;
  block[5] = v10;
  block[6] = v12;
  block[7] = &v14;
  dispatch_sync(queue, block);
  v5 = v15[6];
  _Block_object_dispose(v10, 8);
  _Block_object_dispose(v12, 8);
  _Block_object_dispose(&v14, 8);
  return v5;
}

- (float)_getDeviceSimpleOutputLinearVolumeFordBFSValue:(float)a3
{
  return fminf(fmaxf((float)(fminf(fmaxf(a3, -58.0), 0.0) + 58.0) * 0.017241, 0.0), 1.0);
}

- (float)_getDeviceSimpledBFSForOutputLinearVolume:(float)a3
{
  return fminf(fmaxf((float)(fminf(fmaxf(a3, 0.0), 1.0) / 0.017241) + -58.0, -58.0), 0.0);
}

- (float)_deviceSpecificDBToLinearVolumeMappingCSSSVDeviceSimple:(float)a3
{
  return fminf(fmaxf((float)(fminf(fmaxf(a3, -55.0), 0.0) + 55.0) * 0.018182, 0.0), 1.0);
}

- (float)_deviceSpecificLinearVolumeToDBMappingCSSSVDeviceSimple:(float)a3
{
  return fminf(fmaxf((float)(fminf(fmaxf(a3, 0.0), 1.0) / 0.018182) + -55.0, -55.0), 0.0);
}

- (float)_scaleInputWithInRangeOutRange:(float)a3 minIn:(float)a4 maxIn:(float)a5 minOut:(float)a6 maxOut:(float)a7
{
  return (float)(a6 - (float)((float)((float)(a6 - a7) / (float)(a4 - a5)) * a4))
       + (float)((float)((float)(a6 - a7) / (float)(a4 - a5)) * a3);
}

- (float)_estimatedTTSVolume:(float)a3 lowerLimit:(float)a4 upperLimit:(float)a5 TTSmappingInputRangeLow:(float)a6 TTSmappingInputRangeHigh:(float)a7 TTSmappingOutputRangeLow:(float)a8 TTSmappingOutputRangeHigh:(float)a9
{
  float result;
  float v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;

  if (a3 < a4)
    return a8;
  if (a3 > a5)
    return a9;
  -[CSSmartSiriVolume _scaleInputWithInRangeOutRange:minIn:maxIn:minOut:maxOut:](self, "_scaleInputWithInRangeOutRange:minIn:maxIn:minOut:maxOut:");
  *(float *)&v14 = 1.0 / (float)(expf(-v13) + 1.0);
  LODWORD(v15) = 0;
  LODWORD(v16) = 1.0;
  *(float *)&v17 = a8;
  *(float *)&v18 = a9;
  -[CSSmartSiriVolume _scaleInputWithInRangeOutRange:minIn:maxIn:minOut:maxOut:](self, "_scaleInputWithInRangeOutRange:minIn:maxIn:minOut:maxOut:", v14, v15, v16, v17, v18);
  return result;
}

- (float)_combineResultsWithOptimalFromNoise:(float)a3 andOptimalFromLkfs:(float)a4 withUserOffset:(float)a5
{
  os_log_t *v9;
  NSObject *v10;
  void *v11;
  BOOL v12;
  NSObject *v13;
  int v15;
  const char *v16;
  __int16 v17;
  double v18;
  __int16 v19;
  double v20;
  __int16 v21;
  double v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v9 = (os_log_t *)MEMORY[0x1E0D18F20];
  v10 = *MEMORY[0x1E0D18F20];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F20], OS_LOG_TYPE_DEFAULT))
  {
    v15 = 136315906;
    v16 = "-[CSSmartSiriVolume _combineResultsWithOptimalFromNoise:andOptimalFromLkfs:withUserOffset:]";
    v17 = 2050;
    v18 = a3;
    v19 = 2050;
    v20 = a4;
    v21 = 2050;
    v22 = a5;
    _os_log_impl(&dword_1C2614000, v10, OS_LOG_TYPE_DEFAULT, "%s SmartSiriVolume: TTS volume in dB from noise %{public}f, from LKFS %{public}f, with user offset %{public}f", (uint8_t *)&v15, 0x2Au);
  }
  objc_msgSend(MEMORY[0x1E0D19110], "sharedPreferences");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "smartSiriVolumeSoftVolumeEnabled"))
  {
    v12 = !self->_shouldPauseLKFSProcess;

    if (!v12)
    {
      v13 = *v9;
      if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
      {
        v15 = 136315138;
        v16 = "-[CSSmartSiriVolume _combineResultsWithOptimalFromNoise:andOptimalFromLkfs:withUserOffset:]";
        _os_log_impl(&dword_1C2614000, v13, OS_LOG_TYPE_DEFAULT, "%s SmartSiriVolume: soft volume algorithm in use", (uint8_t *)&v15, 0xCu);
      }
      if ((float)(a4 + a5) >= a3)
        return (float)((float)(a4 + a5) * (float)(1.0 - self->_noiseWeight)) + (float)(self->_noiseWeight * a3);
      return a3;
    }
  }
  else
  {

  }
  if ((float)(a4 + a5) >= a3)
    return a4 + a5;
  return a3;
}

- (void)CSMediaPlayingMonitor:(id)a3 didReceiveMediaPlayingChanged:(int64_t)a4
{
  NSObject *queue;
  _QWORD v5[6];

  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __73__CSSmartSiriVolume_CSMediaPlayingMonitor_didReceiveMediaPlayingChanged___block_invoke;
  v5[3] = &unk_1E7C29178;
  v5[4] = self;
  v5[5] = a4;
  dispatch_async(queue, v5);
}

- (void)didReceiveAlarmChanged:(int64_t)a3
{
  NSObject *queue;
  _QWORD v4[6];

  queue = self->_queue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __44__CSSmartSiriVolume_didReceiveAlarmChanged___block_invoke;
  v4[3] = &unk_1E7C29178;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

- (void)didReceiveTimerChanged:(int64_t)a3
{
  NSObject *queue;
  _QWORD v4[6];

  queue = self->_queue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __44__CSSmartSiriVolume_didReceiveTimerChanged___block_invoke;
  v4[3] = &unk_1E7C29178;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

- (void)didReceiveMusicVolumeChanged:(float)a3
{
  NSObject *queue;
  _QWORD v4[5];
  float v5;

  queue = self->_queue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __50__CSSmartSiriVolume_didReceiveMusicVolumeChanged___block_invoke;
  v4[3] = &unk_1E7C27848;
  v4[4] = self;
  v5 = a3;
  dispatch_async(queue, v4);
}

- (void)didReceiveAlarmVolumeChanged:(float)a3
{
  NSObject *queue;
  _QWORD v4[5];
  float v5;

  queue = self->_queue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __50__CSSmartSiriVolume_didReceiveAlarmVolumeChanged___block_invoke;
  v4[3] = &unk_1E7C27848;
  v4[4] = self;
  v5 = a3;
  dispatch_async(queue, v4);
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
  v4 = *MEMORY[0x1E0D18F20];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F20], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v8 = "-[CSSmartSiriVolume CSAudioServerCrashMonitorDidReceiveServerRestart:]";
    _os_log_impl(&dword_1C2614000, v4, OS_LOG_TYPE_DEFAULT, "%s audiomxd/bridgeaudiod recovered from crash", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__CSSmartSiriVolume_CSAudioServerCrashMonitorDidReceiveServerRestart___block_invoke;
  block[3] = &unk_1E7C292C8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)siriClientBehaviorMonitor:(id)a3 didStartStreamWithContext:(id)a4 successfully:(BOOL)a5 option:(id)a6 withEventUUID:(id)a7
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __107__CSSmartSiriVolume_siriClientBehaviorMonitor_didStartStreamWithContext_successfully_option_withEventUUID___block_invoke;
  block[3] = &unk_1E7C292C8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (float)_getFloatBufferData:(id)a3
{
  id v3;
  float *v4;
  id v5;

  v3 = a3;
  if (objc_msgSend(MEMORY[0x1E0D19090], "inputRecordingIsFloat"))
  {
    v4 = (float *)objc_msgSend(objc_retainAutorelease(v3), "bytes");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D19100], "convertToFloatLPCMBufFromShortLPCMBuf:", v3);
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v4 = (float *)objc_msgSend(v5, "bytes");

  }
  return v4;
}

- (void)_resetStartAnalyzeTime
{
  self->_isStartSampleCountMarked = 0;
  self->_startAnalyzeSampleCount = 0;
  self->_samplesFed = 0;
}

- (void)_setStartAnalyzeTime:(unint64_t)a3
{
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  unint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (!self->_isStartSampleCountMarked)
  {
    self->_isStartSampleCountMarked = 1;
    self->_startAnalyzeSampleCount = a3;
    self->_samplesFed = 0;
    v4 = *MEMORY[0x1E0D18F20];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F20], OS_LOG_TYPE_DEFAULT))
    {
      v5 = 136315394;
      v6 = "-[CSSmartSiriVolume _setStartAnalyzeTime:]";
      v7 = 2050;
      v8 = a3;
      _os_log_impl(&dword_1C2614000, v4, OS_LOG_TYPE_DEFAULT, "%s SmartSiriVolume: set StartAnalyzeSampleCount = %{public}lld", (uint8_t *)&v5, 0x16u);
    }
  }
}

- (void)_setDefaultParameters
{
  *(_OWORD *)&self->_noiseLevelChannelBitset = xmmword_1C276CDA0;
  *(_OWORD *)&self->_energyBufferSize = xmmword_1C276CDB0;
  self->_LKFSUpperPercentile = 95;
  *(_OWORD *)&self->_noiseTimeConstant = xmmword_1C276CDC0;
  *(_OWORD *)&self->_LKFSMicSensitivityOffset = xmmword_1C276CDD0;
  *(_OWORD *)&self->_noiseTTSMappingOutputRangeHigh = xmmword_1C276CDE0;
  *(_OWORD *)&self->_LKFSTTSMappingOutputRangeHigh = xmmword_1C276CDF0;
  *(_OWORD *)&self->_userOffsetOutputRangeHigh = xmmword_1C276CE00;
}

- (float)_convertDB2Mag:(float)a3
{
  return __exp10f(a3 / 20.0);
}

- (float)_getDevicedBFSForInputLinearVolume:(float)a3
{
  double v5;
  float result;

  if (objc_msgSend(MEMORY[0x1E0D18FC0], "getSSVDeviceType") == 2)
  {
    *(float *)&v5 = a3;
    -[CSSmartSiriVolume _getMusicVolumeDBCSSSVDeviceSimple:](self, "_getMusicVolumeDBCSSSVDeviceSimple:", v5);
  }
  else
  {
    *(float *)&v5 = a3;
    -[CSSmartSiriVolume _getMusicVolumeDBCSSSVDeviceDefault:](self, "_getMusicVolumeDBCSSSVDeviceDefault:", v5);
  }
  return result;
}

- (float)_getMusicVolumeDBCSSSVDeviceDefault:(float)a3
{
  float result;

  -[CSSmartSiriVolume _scaleInputWithInRangeOutRange:minIn:maxIn:minOut:maxOut:](self, "_scaleInputWithInRangeOutRange:minIn:maxIn:minOut:maxOut:");
  return result;
}

- (float)_getUserOffsetFromMusicVolumeDB:(float)a3
{
  double v5;
  float result;

  if (objc_msgSend(MEMORY[0x1E0D18FC0], "getSSVDeviceType") != 2)
    return a3;
  *(float *)&v5 = a3;
  -[CSSmartSiriVolume _deviceSpecificDBToLinearVolumeMappingCSSSVDeviceSimple:](self, "_deviceSpecificDBToLinearVolumeMappingCSSSVDeviceSimple:", v5);
  -[CSSmartSiriVolume _getDeviceSimpledBFSForOutputLinearVolume:](self, "_getDeviceSimpledBFSForOutputLinearVolume:");
  return result;
}

- (id)getVolumeForTTSType:(unint64_t)a3 withOverrideMediaVolume:(id)a4 WithRequestTime:(unint64_t)a5
{
  int v6;
  int v7;
  int v8;
  double v9;
  double v10;
  float v11;
  float v12;
  NSObject *v13;
  void *v14;
  float v15;
  CSSmartSiriVolumeEstimate *v16;
  double v17;
  int v19;
  const char *v20;
  __int16 v21;
  double v22;
  __int16 v23;
  double v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  -[CSSmartSiriVolume estimateSoundLevelbySoundType:](self, "estimateSoundLevelbySoundType:", 0, a4, a5);
  v7 = v6;
  -[CSSmartSiriVolume estimateSoundLevelbySoundType:](self, "estimateSoundLevelbySoundType:", 1);
  LODWORD(v9) = v8;
  LODWORD(v10) = v7;
  -[CSSmartSiriVolume estimatedTTSVolumeForNoiseLevelAndLKFS:LKFS:](self, "estimatedTTSVolumeForNoiseLevelAndLKFS:LKFS:", v10, v9);
  v12 = v11;
  v13 = (id)*MEMORY[0x1E0D18F20];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0D192B0], "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "musicVolume");
    v19 = 136315650;
    v20 = "-[CSSmartSiriVolume getVolumeForTTSType:withOverrideMediaVolume:WithRequestTime:]";
    v21 = 2050;
    v22 = v12;
    v23 = 2050;
    v24 = v15;
    _os_log_impl(&dword_1C2614000, v13, OS_LOG_TYPE_DEFAULT, "%s SmartSiriVolume: final estimated TTS volume %{public}f with music volume %{public}f", (uint8_t *)&v19, 0x20u);

  }
  v16 = [CSSmartSiriVolumeEstimate alloc];
  *(float *)&v17 = v12;
  return -[CSSmartSiriVolumeEstimate initWithVolumeEstimate:debugLogFile:](v16, "initWithVolumeEstimate:debugLogFile:", 0, v17);
}

- (CSAudioStream)audioStream
{
  return self->_audioStream;
}

- (void)setAudioStream:(id)a3
{
  objc_storeStrong((id *)&self->_audioStream, a3);
}

- (OS_dispatch_source)listenPollingTimer
{
  return self->_listenPollingTimer;
}

- (void)setListenPollingTimer:(id)a3
{
  objc_storeStrong((id *)&self->_listenPollingTimer, a3);
}

- (int64_t)listenPollingTimerCount
{
  return self->_listenPollingTimerCount;
}

- (void)setListenPollingTimerCount:(int64_t)a3
{
  self->_listenPollingTimerCount = a3;
}

- (CSPolicy)enablePolicy
{
  return self->_enablePolicy;
}

- (void)setEnablePolicy:(id)a3
{
  objc_storeStrong((id *)&self->_enablePolicy, a3);
}

- (void).cxx_destruct
{
  float *begin;

  objc_storeStrong((id *)&self->_enablePolicy, 0);
  objc_storeStrong((id *)&self->_listenPollingTimer, 0);
  objc_storeStrong((id *)&self->_audioStream, 0);
  objc_storeStrong((id *)&self->_currentAsset, 0);
  objc_storeStrong((id *)&self->_ssvEnablePolicy, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
  begin = self->_floatBuffer.__begin_;
  if (begin)
  {
    self->_floatBuffer.__end_ = begin;
    operator delete(begin);
  }
  std::unique_ptr<SmartSiriVolume>::reset[abi:ne180100](&self->_smartSiriVolumeLKFS.__ptr_.__value_, 0);
  std::unique_ptr<SmartSiriVolume>::reset[abi:ne180100](&self->_smartSiriVolumeNoiseLevel.__ptr_.__value_, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 6) = 0;
  *((_OWORD *)self + 1) = 0u;
  *((_OWORD *)self + 2) = 0u;
  return self;
}

void __107__CSSmartSiriVolume_siriClientBehaviorMonitor_didStartStreamWithContext_successfully_option_withEventUUID___block_invoke(uint64_t a1)
{
  uint64_t v1;
  os_log_t *v2;
  NSObject *v4;
  NSObject *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  v2 = (os_log_t *)MEMORY[0x1E0D18F20];
  if (*(_BYTE *)(v1 + 100))
  {
    *(_BYTE *)(v1 + 100) = 0;
    v4 = *v2;
    if (os_log_type_enabled(*v2, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 136315138;
      v7 = "-[CSSmartSiriVolume siriClientBehaviorMonitor:didStartStreamWithContext:successfully:option:withEventUUID:]_block_invoke";
      _os_log_impl(&dword_1C2614000, v4, OS_LOG_TYPE_DEFAULT, "%s SmartSiriVolume dismiss alarm firing as Siri client is recording.", (uint8_t *)&v6, 0xCu);
    }
    v1 = *(_QWORD *)(a1 + 32);
  }
  if (*(_BYTE *)(v1 + 101))
  {
    *(_BYTE *)(v1 + 101) = 0;
    v5 = *v2;
    if (os_log_type_enabled(*v2, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 136315138;
      v7 = "-[CSSmartSiriVolume siriClientBehaviorMonitor:didStartStreamWithContext:successfully:option:withEventUUID:]_block_invoke";
      _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_DEFAULT, "%s SmartSiriVolume dismiss timer firing as Siri client is recording.", (uint8_t *)&v6, 0xCu);
    }
  }
}

void __70__CSSmartSiriVolume_CSAudioServerCrashMonitorDidReceiveServerRestart___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;

  objc_msgSend(*(id *)(a1 + 32), "enablePolicy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEnabled");

  if (v3)
    objc_msgSend(*(id *)(a1 + 32), "_startListenPolling");
}

float __50__CSSmartSiriVolume_didReceiveAlarmVolumeChanged___block_invoke(uint64_t a1)
{
  float result;

  result = *(float *)(a1 + 40);
  *(float *)(*(_QWORD *)(a1 + 32) + 116) = result;
  return result;
}

uint64_t __50__CSSmartSiriVolume_didReceiveMusicVolumeChanged___block_invoke(uint64_t a1, double a2)
{
  uint64_t result;
  int v4;

  LODWORD(a2) = *(_DWORD *)(a1 + 40);
  result = objc_msgSend(*(id *)(a1 + 32), "_getDevicedBFSForInputLinearVolume:", a2);
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 112) = v4;
  return result;
}

void __44__CSSmartSiriVolume_didReceiveTimerChanged___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  int v4;
  NSObject *v5;
  const __CFString *v6;
  NSObject *v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  const __CFString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 40);
  if (v1)
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = v1 == 1;
    if (*(unsigned __int8 *)(v3 + 101) != v4)
    {
      *(_BYTE *)(v3 + 101) = v4;
      v5 = *MEMORY[0x1E0D18F20];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F20], OS_LOG_TYPE_DEFAULT))
      {
        if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 101))
          v6 = CFSTR("YES");
        else
          v6 = CFSTR("NO");
        v9 = 136315394;
        v10 = "-[CSSmartSiriVolume didReceiveTimerChanged:]_block_invoke";
        v11 = 2112;
        v12 = v6;
        _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_DEFAULT, "%s SmartSiriVolume: timer firing status = %@ according to MobileTimer notification.", (uint8_t *)&v9, 0x16u);
      }
    }
  }
  else
  {
    v7 = *MEMORY[0x1E0D18F20];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F20], OS_LOG_TYPE_ERROR))
    {
      v9 = 136315138;
      v10 = "-[CSSmartSiriVolume didReceiveTimerChanged:]_block_invoke";
      _os_log_error_impl(&dword_1C2614000, v7, OS_LOG_TYPE_ERROR, "%s SmartSiriVolume received unknown timer state, let's reset timer state.", (uint8_t *)&v9, 0xCu);
    }
    +[CSTimerMonitor sharedInstance](CSTimerMonitor, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "initializeTimerState");

  }
}

void __44__CSSmartSiriVolume_didReceiveAlarmChanged___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  int v4;
  NSObject *v5;
  const __CFString *v6;
  NSObject *v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  const __CFString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 40);
  if (v1)
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = v1 == 1;
    if (*(unsigned __int8 *)(v3 + 100) != v4)
    {
      *(_BYTE *)(v3 + 100) = v4;
      v5 = *MEMORY[0x1E0D18F20];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F20], OS_LOG_TYPE_DEFAULT))
      {
        if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 100))
          v6 = CFSTR("YES");
        else
          v6 = CFSTR("NO");
        v9 = 136315394;
        v10 = "-[CSSmartSiriVolume didReceiveAlarmChanged:]_block_invoke";
        v11 = 2112;
        v12 = v6;
        _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_DEFAULT, "%s SmartSiriVolume: alarm firing status = %@ according to MobileTimer notification.", (uint8_t *)&v9, 0x16u);
      }
    }
  }
  else
  {
    v7 = *MEMORY[0x1E0D18F20];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F20], OS_LOG_TYPE_ERROR))
    {
      v9 = 136315138;
      v10 = "-[CSSmartSiriVolume didReceiveAlarmChanged:]_block_invoke";
      _os_log_error_impl(&dword_1C2614000, v7, OS_LOG_TYPE_ERROR, "%s SmartSiriVolume received unknown alarm state, let's reset alarm state.", (uint8_t *)&v9, 0xCu);
    }
    +[CSAlarmMonitor sharedInstance](CSAlarmMonitor, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "initializeAlarmState");

  }
}

void __73__CSSmartSiriVolume_CSMediaPlayingMonitor_didReceiveMediaPlayingChanged___block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  NSObject *v4;
  _BOOL4 v5;
  const char *v6;
  NSObject *v7;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 40);
  if ((unint64_t)(v2 - 1) > 1)
  {
    v7 = *MEMORY[0x1E0D18F20];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F20], OS_LOG_TYPE_ERROR))
    {
      v8 = 136315138;
      v9 = "-[CSSmartSiriVolume CSMediaPlayingMonitor:didReceiveMediaPlayingChanged:]_block_invoke";
      _os_log_error_impl(&dword_1C2614000, v7, OS_LOG_TYPE_ERROR, "%s SmartSiriVolume received unknown media playing state, let's assume media is playing.", (uint8_t *)&v8, 0xCu);
    }
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 99) = 0;
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 102) = 1;
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 99) = v2 == 2;
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 102) = v2 == 1;
    v3 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 99);
    v4 = *MEMORY[0x1E0D18F20];
    v5 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F20], OS_LOG_TYPE_DEFAULT);
    if (v3)
    {
      if (!v5)
        return;
      v8 = 136315138;
      v9 = "-[CSSmartSiriVolume CSMediaPlayingMonitor:didReceiveMediaPlayingChanged:]_block_invoke";
      v6 = "%s SmartSiriVolume: pause LKFS calculation according to MediaRemote notification.";
    }
    else
    {
      if (!v5)
        return;
      v8 = 136315138;
      v9 = "-[CSSmartSiriVolume CSMediaPlayingMonitor:didReceiveMediaPlayingChanged:]_block_invoke";
      v6 = "%s SmartSiriVolume: resume LKFS calculation according to MediaRemote notification.";
    }
    _os_log_impl(&dword_1C2614000, v4, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v8, 0xCu);
  }
}

void __65__CSSmartSiriVolume_estimatedTTSVolumeForNoiseLevelAndLKFS_LKFS___block_invoke(uint64_t a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8)
{
  _DWORD *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  int v17;
  uint64_t v18;
  int v19;
  int v20;
  uint64_t v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  _DWORD *v28;
  double v29;
  _DWORD *v30;
  int v31;
  double v32;
  double v33;
  double v34;
  float v35;
  uint64_t v36;
  float v37;
  os_log_t *v38;
  NSObject *v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  uint64_t v46;
  NSObject *v47;
  float v48;
  uint64_t v49;
  void *v50;
  double v51;
  void *v52;
  double v53;
  void *v54;
  double v55;
  void *v56;
  double v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  _QWORD v65[9];
  _QWORD v66[9];
  uint8_t buf[4];
  const char *v68;
  __int16 v69;
  double v70;
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v9 = *(_DWORD **)(a1 + 32);
  LODWORD(a2) = *(_DWORD *)(a1 + 64);
  LODWORD(a5) = v9[44];
  LODWORD(a6) = v9[45];
  LODWORD(a7) = v9[46];
  LODWORD(a8) = v9[47];
  LODWORD(a4) = 1119092736;
  LODWORD(a3) = 20.0;
  objc_msgSend(v9, "_estimatedTTSVolume:lowerLimit:upperLimit:TTSmappingInputRangeLow:TTSmappingInputRangeHigh:TTSmappingOutputRangeLow:TTSmappingOutputRangeHigh:", a2, a3, a4, a5, a6, a7, a8);
  v17 = LODWORD(v10);
  v18 = *(_QWORD *)(a1 + 32);
  v19 = *(_DWORD *)(v18 + 200);
  if (!*(_BYTE *)(v18 + 99))
  {
    LODWORD(v10) = *(_DWORD *)(a1 + 68);
    LODWORD(v13) = *(_DWORD *)(v18 + 192);
    LODWORD(v14) = *(_DWORD *)(v18 + 196);
    LODWORD(v16) = *(_DWORD *)(v18 + 204);
    LODWORD(v11) = -1037434880;
    LODWORD(v12) = 1104936960;
    LODWORD(v15) = *(_DWORD *)(v18 + 200);
    objc_msgSend((id)v18, "_estimatedTTSVolume:lowerLimit:upperLimit:TTSmappingInputRangeLow:TTSmappingInputRangeHigh:TTSmappingOutputRangeLow:TTSmappingOutputRangeHigh:", v10, v11, v12, v13, v14, v15, v16);
    v19 = v20;
  }
  v21 = objc_msgSend(MEMORY[0x1E0D18FC0], "getSSVDeviceType");
  v28 = *(_DWORD **)(a1 + 32);
  LODWORD(v29) = v28[28];
  if (v21 == 2)
    objc_msgSend(v28, "_getUserOffsetFromMusicVolumeDB:", v29);
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = LODWORD(v29);
  v30 = *(_DWORD **)(a1 + 32);
  LODWORD(v29) = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  LODWORD(v24) = v30[52];
  LODWORD(v25) = v30[53];
  LODWORD(v26) = v30[54];
  LODWORD(v27) = v30[55];
  LODWORD(v22) = -1032847360;
  LODWORD(v23) = 0;
  objc_msgSend(v30, "_estimatedTTSVolume:lowerLimit:upperLimit:TTSmappingInputRangeLow:TTSmappingInputRangeHigh:TTSmappingOutputRangeLow:TTSmappingOutputRangeHigh:", v29, v22, v23, v24, v25, v26, v27);
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v31;
  LODWORD(v32) = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  LODWORD(v33) = v17;
  LODWORD(v34) = v19;
  objc_msgSend(*(id *)(a1 + 32), "_combineResultsWithOptimalFromNoise:andOptimalFromLkfs:withUserOffset:", v33, v34, v32);
  v36 = *(_QWORD *)(a1 + 32);
  if (v35 <= *(float *)(v36 + 224))
    v35 = *(float *)(v36 + 224);
  if (v35 >= *(float *)(v36 + 228))
    v37 = *(float *)(v36 + 228);
  else
    v37 = v35;
  v38 = (os_log_t *)MEMORY[0x1E0D18F20];
  v39 = *MEMORY[0x1E0D18F20];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F20], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v68 = "-[CSSmartSiriVolume estimatedTTSVolumeForNoiseLevelAndLKFS:LKFS:]_block_invoke";
    v69 = 2050;
    v70 = v37;
    _os_log_impl(&dword_1C2614000, v39, OS_LOG_TYPE_DEFAULT, "%s SmartSiriVolume: final estimated TTS volume in dB %{public}f", buf, 0x16u);
  }
  if (objc_msgSend(MEMORY[0x1E0D18FC0], "getSSVDeviceType") == 2)
  {
    *(float *)&v40 = v37;
    objc_msgSend(*(id *)(a1 + 32), "_getDeviceSimpleOutputLinearVolumeFordBFSValue:", v40);
  }
  else
  {
    if (v37 <= -30.0)
    {
      LODWORD(v41) = -1032847360;
      LODWORD(v44) = 1045220557;
      LODWORD(v42) = -30.0;
      LODWORD(v43) = 0;
    }
    else
    {
      LODWORD(v43) = 1045220557;
      LODWORD(v41) = -30.0;
      LODWORD(v42) = 0;
      LODWORD(v44) = 1.0;
    }
    *(float *)&v40 = v37;
    objc_msgSend(*(id *)(a1 + 32), "_scaleInputWithInRangeOutRange:minIn:maxIn:minOut:maxOut:", v40, v41, v42, v43, v44);
  }
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = LODWORD(v45);
  v46 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v46 + 100) || *(_BYTE *)(v46 + 101))
  {
    v47 = *v38;
    if (os_log_type_enabled(*v38, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v68 = "-[CSSmartSiriVolume estimatedTTSVolumeForNoiseLevelAndLKFS:LKFS:]_block_invoke";
      _os_log_impl(&dword_1C2614000, v47, OS_LOG_TYPE_DEFAULT, "%s SmartSiriVolume: adjust TTS volume since alarm/timer is firing.", buf, 0xCu);
      v46 = *(_QWORD *)(a1 + 32);
    }
    v48 = *(float *)(v46 + 116);
    v49 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    if (v48 <= *(float *)(v49 + 24))
      v48 = *(float *)(v49 + 24);
    *(float *)(v49 + 24) = v48;
  }
  v65[0] = CFSTR("noiseLevelDB");
  LODWORD(v45) = *(_DWORD *)(a1 + 64);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v45);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v66[0] = v50;
  v65[1] = CFSTR("musicLevelDB");
  LODWORD(v51) = *(_DWORD *)(a1 + 68);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v51);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v66[1] = v52;
  v65[2] = CFSTR("musicPlaybackVolumeDB");
  LODWORD(v53) = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 112);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v53);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v66[2] = v54;
  v65[3] = CFSTR("alarmVolume");
  LODWORD(v55) = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 116);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v55);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v66[3] = v56;
  v65[4] = CFSTR("finalTTSVolume");
  LODWORD(v57) = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v57);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v66[4] = v58;
  v65[5] = CFSTR("isMediaPlaying");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 102));
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v66[5] = v59;
  v65[6] = CFSTR("isAlarmPlaying");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 100));
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v66[6] = v60;
  v65[7] = CFSTR("isTimerPlaying");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 101));
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v66[7] = v61;
  v65[8] = CFSTR("isLKFSProcessPaused");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 99));
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v66[8] = v62;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v66, v65, 9);
  v63 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CFE7D8], "sharedAnalytics");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "logEventWithType:context:", 4702, v63);

}

void __48__CSSmartSiriVolume_didDetectKeywordWithResult___block_invoke(uint64_t a1)
{
  void *v2;
  id *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;
  unint64_t v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  uint64_t v19;
  NSObject *v20;
  NSObject *v21;
  int v22;
  const char *v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v3 = (id *)MEMORY[0x1E0D18F20];
  if (v2)
  {
    v4 = *MEMORY[0x1E0D19788];
    objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0D19788]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "unsignedIntegerValue");
    v6 = *(_QWORD *)(a1 + 40);
    v7 = *(_QWORD *)(v6 + 72);
    v8 = *(_QWORD *)(v6 + 80);
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v8 + v7 - objc_msgSend(v9, "unsignedIntegerValue");

    if (v10 >= *(_QWORD *)(*(_QWORD *)(a1 + 40) + 88))
      v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 88);
    else
      v11 = v10;
    v12 = *v3;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = *(_QWORD *)(a1 + 40);
      v15 = *(_QWORD *)(v13 + 72);
      v14 = *(_QWORD *)(v13 + 80);
      objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v4);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 136316162;
      v23 = "-[CSSmartSiriVolume didDetectKeywordWithResult:]_block_invoke";
      v24 = 2050;
      v25 = v11;
      v26 = 2050;
      v27 = v15;
      v28 = 2050;
      v29 = v14;
      v30 = 2050;
      v31 = objc_msgSend(v16, "unsignedIntegerValue");
      _os_log_impl(&dword_1C2614000, v12, OS_LOG_TYPE_DEFAULT, "%s SmartSiriVolume remove samples from VT utterances by %{public}llu, with startAnalyzeSampleCount = %{public}llu, samplesFed = %{public}llu, triggerStartSampleCount = %{public}llu", (uint8_t *)&v22, 0x34u);

    }
    if (v11 > 0x17700)
    {
      v17 = *v3;
      if (os_log_type_enabled((os_log_t)*v3, OS_LOG_TYPE_ERROR))
      {
        v22 = 136315394;
        v23 = "-[CSSmartSiriVolume didDetectKeywordWithResult:]_block_invoke";
        v24 = 2050;
        v25 = 96000;
        _os_log_error_impl(&dword_1C2614000, v17, OS_LOG_TYPE_ERROR, "%s SmartSiriVolume trying to delete too many VT samples, set triggerDurationToDelete to be limited max: %{public}llu", (uint8_t *)&v22, 0x16u);
      }
      v11 = 96000;
    }
    SmartSiriVolume::removeVoiceTriggerSamples(*(SmartSiriVolume **)(*(_QWORD *)(a1 + 40) + 16), 0, v11);
  }
  else
  {
    v18 = *MEMORY[0x1E0D18F20];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F20], OS_LOG_TYPE_ERROR))
    {
      v22 = 136315138;
      v23 = "-[CSSmartSiriVolume didDetectKeywordWithResult:]_block_invoke";
      _os_log_error_impl(&dword_1C2614000, v18, OS_LOG_TYPE_ERROR, "%s SmartSiriVolume got empty VT event!", (uint8_t *)&v22, 0xCu);
    }
  }
  v19 = *(_QWORD *)(a1 + 40);
  if (*(_BYTE *)(v19 + 100))
  {
    *(_BYTE *)(v19 + 100) = 0;
    v20 = *v3;
    if (os_log_type_enabled((os_log_t)*v3, OS_LOG_TYPE_DEFAULT))
    {
      v22 = 136315138;
      v23 = "-[CSSmartSiriVolume didDetectKeywordWithResult:]_block_invoke";
      _os_log_impl(&dword_1C2614000, v20, OS_LOG_TYPE_DEFAULT, "%s SmartSiriVolume dismiss alarm firing as VoiceTrigger detected.", (uint8_t *)&v22, 0xCu);
    }
    v19 = *(_QWORD *)(a1 + 40);
  }
  if (*(_BYTE *)(v19 + 101))
  {
    *(_BYTE *)(v19 + 101) = 0;
    v21 = *v3;
    if (os_log_type_enabled((os_log_t)*v3, OS_LOG_TYPE_DEFAULT))
    {
      v22 = 136315138;
      v23 = "-[CSSmartSiriVolume didDetectKeywordWithResult:]_block_invoke";
      _os_log_impl(&dword_1C2614000, v21, OS_LOG_TYPE_DEFAULT, "%s SmartSiriVolume dismiss timer firing as VoiceTrigger detected.", (uint8_t *)&v22, 0xCu);
    }
  }
}

void __67__CSSmartSiriVolume_audioStreamProvider_didStopStreamUnexpectedly___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;

  objc_msgSend(*(id *)(a1 + 32), "enablePolicy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEnabled");

  if (v3)
    objc_msgSend(*(id *)(a1 + 32), "_startListenPolling");
}

void __62__CSSmartSiriVolume_audioStreamProvider_audioBufferAvailable___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  unint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE *v11;
  uint64_t v12;
  NSObject *v13;
  int v14;
  const char *v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "enablePolicy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEnabled");

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "_setStartAnalyzeTime:", objc_msgSend(*(id *)(a1 + 40), "startSampleCount"));
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80) += objc_msgSend(*(id *)(a1 + 40), "numSamples");
    if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 98))
    {
      v4 = objc_msgSend(*(id *)(a1 + 40), "numSamples");
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88) += objc_msgSend(*(id *)(a1 + 40), "numSamples");
      if (v4)
      {
        v5 = 0;
        do
        {
          v6 = (void *)MEMORY[0x1C3BC4590]();
          if (v4 >= 0x400)
            v7 = 1024;
          else
            v7 = v4;
          objc_msgSend(*(id *)(a1 + 40), "subChunkFrom:numSamples:", v5, v7);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = objc_msgSend(v8, "numSamples");
          v10 = objc_msgSend(v8, "numSamples");
          objc_msgSend(*(id *)(a1 + 32), "_processAudioChunk:soundType:", v8, 0);
          v11 = *(_BYTE **)(a1 + 32);
          if (!v11[99])
            objc_msgSend(v11, "_processAudioChunk:soundType:", v8, 1);
          v4 -= v9;
          v5 += v10;

          objc_autoreleasePoolPop(v6);
        }
        while (v4);
      }
    }
  }
  else
  {
    v12 = _ZZZ62__CSSmartSiriVolume_audioStreamProvider_audioBufferAvailable__EUb_E15enableHeartbeat;
    if (__ROR8__(0xCCCCCCCCCCCCCCCDLL* _ZZZ62__CSSmartSiriVolume_audioStreamProvider_audioBufferAvailable__EUb_E15enableHeartbeat, 1) <= 0x1999999999999999uLL)
    {
      v13 = *MEMORY[0x1E0D18F20];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F20], OS_LOG_TYPE_ERROR))
      {
        v14 = 136315394;
        v15 = "-[CSSmartSiriVolume audioStreamProvider:audioBufferAvailable:]_block_invoke";
        v16 = 2050;
        v17 = v12;
        _os_log_error_impl(&dword_1C2614000, v13, OS_LOG_TYPE_ERROR, "%s Siri is disabled, we shouldn't receive audio here, heartbeat = %{public}lld", (uint8_t *)&v14, 0x16u);
        v12 = _ZZZ62__CSSmartSiriVolume_audioStreamProvider_audioBufferAvailable__EUb_E15enableHeartbeat;
      }
    }
    _ZZZ62__CSSmartSiriVolume_audioStreamProvider_audioBufferAvailable__EUb_E15enableHeartbeat = v12 + 1;
  }
}

uint64_t __26__CSSmartSiriVolume_reset__block_invoke(uint64_t a1)
{
  double v2;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 98) = 0;
  SmartSiriVolume::reset(*(SmartSiriVolume **)(*(_QWORD *)(a1 + 32) + 16));
  *(float *)&v2 = SmartSiriVolume::reset(*(SmartSiriVolume **)(*(_QWORD *)(a1 + 32) + 24));
  return objc_msgSend(*(id *)(a1 + 32), "_resetStartAnalyzeTime", v2);
}

uint64_t __41__CSSmartSiriVolume__resumeSSVProcessing__block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(result + 32);
  if (*(_BYTE *)(v1 + 98))
  {
    v2 = result;
    v3 = *MEMORY[0x1E0D18F20];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F20], OS_LOG_TYPE_DEFAULT))
    {
      v4 = 136315138;
      v5 = "-[CSSmartSiriVolume _resumeSSVProcessing]_block_invoke";
      _os_log_impl(&dword_1C2614000, v3, OS_LOG_TYPE_DEFAULT, "%s SmartSiriVolume: resume SSV calculation.", (uint8_t *)&v4, 0xCu);
      v1 = *(_QWORD *)(v2 + 32);
    }
    *(_BYTE *)(v1 + 98) = 0;
    return objc_msgSend(*(id *)(v2 + 32), "_resetStartAnalyzeTime");
  }
  return result;
}

void __40__CSSmartSiriVolume__pauseSSVProcessing__block_invoke(uint64_t a1)
{
  uint64_t v1;
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v1 + 98))
  {
    v3 = *MEMORY[0x1E0D18F20];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F20], OS_LOG_TYPE_DEFAULT))
    {
      v4 = 136315138;
      v5 = "-[CSSmartSiriVolume _pauseSSVProcessing]_block_invoke";
      _os_log_impl(&dword_1C2614000, v3, OS_LOG_TYPE_DEFAULT, "%s SmartSiriVolume: pause SSV calculation.", (uint8_t *)&v4, 0xCu);
      v1 = *(_QWORD *)(a1 + 32);
    }
    *(_BYTE *)(v1 + 98) = 1;
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88) = 0;
  }
}

void __51__CSSmartSiriVolume_estimateSoundLevelbySoundType___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  SmartSiriVolume *v3;
  NSObject *v4;
  double v5;
  SmartSiriVolume *v6;
  NSObject *v7;
  double v8;
  int v9;
  const char *v10;
  __int16 v11;
  double v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = a1[6];
  if (!v2)
  {
    v6 = *(SmartSiriVolume **)(a1[4] + 16);
    if (!v6)
      return;
    *(float *)(*(_QWORD *)(a1[5] + 8) + 24) = SmartSiriVolume::estimateSoundLevel(v6);
    v7 = *MEMORY[0x1E0D18F20];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F20], OS_LOG_TYPE_DEFAULT))
      return;
    v8 = *(float *)(*(_QWORD *)(a1[5] + 8) + 24);
    v9 = 136315394;
    v10 = "-[CSSmartSiriVolume estimateSoundLevelbySoundType:]_block_invoke";
    v11 = 2050;
    v12 = v8;
    _os_log_impl(&dword_1C2614000, v7, OS_LOG_TYPE_DEFAULT, "%s SmartSiriVolume: estimated noise level %{public}f", (uint8_t *)&v9, 0x16u);
    v2 = a1[6];
  }
  if (v2 == 1)
  {
    v3 = *(SmartSiriVolume **)(a1[4] + 24);
    if (v3)
    {
      *(float *)(*(_QWORD *)(a1[5] + 8) + 24) = SmartSiriVolume::estimateSoundLevel(v3);
      v4 = *MEMORY[0x1E0D18F20];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F20], OS_LOG_TYPE_DEFAULT))
      {
        v5 = *(float *)(*(_QWORD *)(a1[5] + 8) + 24);
        v9 = 136315394;
        v10 = "-[CSSmartSiriVolume estimateSoundLevelbySoundType:]_block_invoke";
        v11 = 2050;
        v12 = v5;
        _os_log_impl(&dword_1C2614000, v4, OS_LOG_TYPE_DEFAULT, "%s SmartSiriVolume: estimated LKFS %{public}f", (uint8_t *)&v9, 0x16u);
      }
    }
  }
}

void __50__CSSmartSiriVolume__processAudioChunk_soundType___block_invoke(uint64_t a1, uint64_t a2)
{
  unint64_t v3;
  unsigned int v4;
  const void *v5;
  unint64_t v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "dataForChannel:", a2);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v7, "length");
  v4 = objc_msgSend(MEMORY[0x1E0D19090], "inputRecordingSampleByteDepth");
  v5 = (const void *)objc_msgSend(*(id *)(a1 + 40), "_getFloatBufferData:", v7);
  v6 = v3 / v4;
  if ((_DWORD)v6)
    memmove((void *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 32)+ 4 * *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24)), v5, 4 * v6);
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) += v6;

}

void __145__CSSmartSiriVolume_prepareSoundLevelBufferFromSamples_soundType_firedVoiceTriggerEvent_triggerStartTimeSampleOffset_triggerEndTimeSampleOffset___block_invoke(uint64_t a1)
{
  unint64_t v2;
  unint64_t v3;
  const void *v4;
  double v5;
  uint64_t v6;
  float v7;
  float v8;
  SmartSiriVolume *v9;
  float v10;
  SmartSiriVolume *v11;
  float v12;

  v2 = objc_msgSend(*(id *)(a1 + 32), "length");
  v3 = v2 / objc_msgSend(MEMORY[0x1E0D19090], "inputRecordingSampleByteDepth");
  v4 = (const void *)objc_msgSend(*(id *)(a1 + 40), "_getFloatBufferData:", *(_QWORD *)(a1 + 32));
  if ((_DWORD)v3)
    memmove(*(void **)(*(_QWORD *)(a1 + 40) + 32), v4, 4 * v3);
  v6 = *(_QWORD *)(a1 + 40);
  if (*(_QWORD *)(a1 + 48))
  {
    LODWORD(v5) = *(_DWORD *)(v6 + 112);
    objc_msgSend((id)v6, "_convertDB2Mag:", v5);
    v8 = 1.0 / v7;
    SmartSiriVolume::feedFloatAudio(*(SmartSiriVolume **)(*(_QWORD *)(a1 + 40) + 24), *(const float **)(*(_QWORD *)(a1 + 40) + 32), v3);
    v9 = *(SmartSiriVolume **)(*(_QWORD *)(a1 + 40) + 24);
    SmartSiriVolume::computeTimeDomainEnergy(v9, v8);
    SmartSiriVolume::prepareEnergyBuffer(v9, v10);
  }
  else
  {
    SmartSiriVolume::feedFloatAudio(*(SmartSiriVolume **)(v6 + 16), *(const float **)(v6 + 32), v3);
    v11 = *(SmartSiriVolume **)(*(_QWORD *)(a1 + 40) + 16);
    SmartSiriVolume::computeTimeDomainEnergy(v11, 1.0);
    SmartSiriVolume::prepareEnergyBuffer(v11, v12);
    if (*(_BYTE *)(a1 + 72))
      SmartSiriVolume::removeVoiceTriggerSamples(*(SmartSiriVolume **)(*(_QWORD *)(a1 + 40) + 16), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 56) - *(_QWORD *)(a1 + 64));
  }
}

uint64_t __30__CSSmartSiriVolume_setAsset___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setAsset:", *(_QWORD *)(a1 + 40));
}

uint64_t __43__CSSmartSiriVolume_fetchInitSystemVolumes__block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  uint64_t result;
  int v5;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "musicVolume");
  objc_msgSend(v2, "_getDevicedBFSForInputLinearVolume:");
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 112) = v3;
  result = objc_msgSend(*(id *)(a1 + 40), "alarmVolume");
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 116) = v5;
  return result;
}

void __41__CSSmartSiriVolume_initializeTimerState__block_invoke(uint64_t a1)
{
  NSObject *v2;
  const __CFString *v3;
  int v4;
  const char *v5;
  __int16 v6;
  const __CFString *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 101) = *(_QWORD *)(a1 + 40) == 1;
  v2 = *MEMORY[0x1E0D18F20];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F20], OS_LOG_TYPE_DEFAULT))
  {
    if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 101))
      v3 = CFSTR("firing");
    else
      v3 = CFSTR("NOT firing");
    v4 = 136315394;
    v5 = "-[CSSmartSiriVolume initializeTimerState]_block_invoke";
    v6 = 2114;
    v7 = v3;
    _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s SmartSiriVolume received timer initial state as %{public}@", (uint8_t *)&v4, 0x16u);
  }
}

void __41__CSSmartSiriVolume_initializeAlarmState__block_invoke(uint64_t a1)
{
  NSObject *v2;
  const __CFString *v3;
  int v4;
  const char *v5;
  __int16 v6;
  const __CFString *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 100) = *(_QWORD *)(a1 + 40) == 1;
  v2 = *MEMORY[0x1E0D18F20];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F20], OS_LOG_TYPE_DEFAULT))
  {
    if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 100))
      v3 = CFSTR("firing");
    else
      v3 = CFSTR("NOT firing");
    v4 = 136315394;
    v5 = "-[CSSmartSiriVolume initializeAlarmState]_block_invoke";
    v6 = 2114;
    v7 = v3;
    _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s SmartSiriVolume received alarm initial state as %{public}@", (uint8_t *)&v4, 0x16u);
  }
}

void __48__CSSmartSiriVolume_initializeMediaPlayingState__block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  const __CFString *v4;
  int v5;
  const char *v6;
  __int16 v7;
  const __CFString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 40);
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 99) = v2 == 2;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 102) = v2 == 1;
  v3 = *MEMORY[0x1E0D18F20];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F20], OS_LOG_TYPE_DEFAULT))
  {
    if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 102))
      v4 = CFSTR("playing");
    else
      v4 = CFSTR("NOT playing");
    v5 = 136315394;
    v6 = "-[CSSmartSiriVolume initializeMediaPlayingState]_block_invoke";
    v7 = 2114;
    v8 = v4;
    _os_log_impl(&dword_1C2614000, v3, OS_LOG_TYPE_DEFAULT, "%s SmartSiriVolume received MediaRemote initial state as %{public}@", (uint8_t *)&v5, 0x16u);
  }
}

void __35__CSSmartSiriVolume__stopListening__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((a2 & 1) == 0)
  {
    v5 = (id)*MEMORY[0x1E0D18F20];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v4, "description");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 136315394;
      v8 = "-[CSSmartSiriVolume _stopListening]_block_invoke";
      v9 = 2114;
      v10 = v6;
      _os_log_error_impl(&dword_1C2614000, v5, OS_LOG_TYPE_ERROR, "%s Failed to stop audio stream : %{public}@", (uint8_t *)&v7, 0x16u);

    }
  }

}

void __48__CSSmartSiriVolume__startListenWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  id v6;

  v6 = a3;
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, uint64_t, id))(v5 + 16))(v5, a2, v6);

}

void __48__CSSmartSiriVolume__startListenWithCompletion___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  id v13;
  char v14;

  v5 = a3;
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(a1 + 40);
  v8 = *(NSObject **)(v6 + 8);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __48__CSSmartSiriVolume__startListenWithCompletion___block_invoke_3;
  v10[3] = &unk_1E7C29100;
  v14 = a2;
  v11 = v5;
  v12 = v6;
  v13 = v7;
  v9 = v5;
  dispatch_async(v8, v10);

}

uint64_t __48__CSSmartSiriVolume__startListenWithCompletion___block_invoke_3(uint64_t a1)
{
  os_log_t *v2;
  NSObject *v3;
  int v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  char v9;
  NSObject *v10;
  _BYTE v12[22];
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = (os_log_t *)MEMORY[0x1E0D18F20];
  v3 = (id)*MEMORY[0x1E0D18F20];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(unsigned __int8 *)(a1 + 56);
    objc_msgSend(*(id *)(a1 + 32), "description");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v5;
    v7 = CFSTR("YES");
    *(_DWORD *)v12 = 136315650;
    *(_QWORD *)&v12[4] = "-[CSSmartSiriVolume _startListenWithCompletion:]_block_invoke_3";
    *(_WORD *)&v12[12] = 2114;
    if (!v4)
      v7 = CFSTR("NO");
    *(_QWORD *)&v12[14] = v7;
    v13 = 2114;
    v14 = v5;
    _os_log_impl(&dword_1C2614000, v3, OS_LOG_TYPE_DEFAULT, "%s Start audio stream successfully ? %{public}@, error : %{public}@", v12, 0x20u);

  }
  objc_msgSend(*(id *)(a1 + 40), "enablePolicy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEnabled");

  if ((v9 & 1) == 0)
  {
    v10 = *v2;
    if (os_log_type_enabled(*v2, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v12 = 136315138;
      *(_QWORD *)&v12[4] = "-[CSSmartSiriVolume _startListenWithCompletion:]_block_invoke";
      _os_log_error_impl(&dword_1C2614000, v10, OS_LOG_TYPE_ERROR, "%s Received didStartRecording when Siri is off", v12, 0xCu);
    }
    objc_msgSend(*(id *)(a1 + 40), "_stopListening", *(_OWORD *)v12);
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __64__CSSmartSiriVolume__startListenPollingWithInterval_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  dispatch_time_t v8;
  NSObject *v9;
  void *v10;
  _QWORD block[4];
  id v12;
  id v13[2];
  _BYTE location[12];
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((a2 & 1) != 0)
  {
    v6 = *(_QWORD *)(a1 + 40);
    if (v6)
      (*(void (**)(uint64_t, uint64_t, _QWORD))(v6 + 16))(v6, 1, 0);
  }
  else
  {
    v7 = (id)*MEMORY[0x1E0D18F20];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v5, "localizedDescription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)location = 136315394;
      *(_QWORD *)&location[4] = "-[CSSmartSiriVolume _startListenPollingWithInterval:completion:]_block_invoke";
      v15 = 2114;
      v16 = v10;
      _os_log_error_impl(&dword_1C2614000, v7, OS_LOG_TYPE_ERROR, "%s listen polling has failed : %{public}@", location, 0x16u);

    }
    objc_initWeak((id *)location, *(id *)(a1 + 32));
    v8 = dispatch_time(0, (uint64_t)(*(double *)(a1 + 48) * 1000000000.0));
    v9 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __64__CSSmartSiriVolume__startListenPollingWithInterval_completion___block_invoke_42;
    block[3] = &unk_1E7C29088;
    objc_copyWeak(v13, (id *)location);
    v13[1] = *(id *)(a1 + 48);
    v12 = *(id *)(a1 + 40);
    dispatch_after(v8, v9, block);

    objc_destroyWeak(v13);
    objc_destroyWeak((id *)location);
  }

}

void __64__CSSmartSiriVolume__startListenPollingWithInterval_completion___block_invoke_42(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_startListenPollingWithInterval:completion:", *(_QWORD *)(a1 + 32), *(double *)(a1 + 48));

}

uint64_t __40__CSSmartSiriVolume__startListenPolling__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 97) = 0;
  return result;
}

void __41__CSSmartSiriVolume_startSmartSiriVolume__block_invoke(uint64_t a1, int a2)
{
  NSObject *v4;
  const __CFString *v5;
  id WeakRetained;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  const __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = *MEMORY[0x1E0D18F20];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F20], OS_LOG_TYPE_DEFAULT))
  {
    v5 = CFSTR("PAUSED");
    if (a2)
      v5 = CFSTR("RUNNING");
    v8 = 136315394;
    v9 = "-[CSSmartSiriVolume startSmartSiriVolume]_block_invoke";
    v10 = 2114;
    v11 = v5;
    _os_log_impl(&dword_1C2614000, v4, OS_LOG_TYPE_DEFAULT, "%s SmartSiriVolume enable policy changed : %{public}@", (uint8_t *)&v8, 0x16u);
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v7 = WeakRetained;
  if (a2)
    objc_msgSend(WeakRetained, "_resumeSSVProcessing");
  else
    objc_msgSend(WeakRetained, "_pauseSSVProcessing");

}

void __41__CSSmartSiriVolume_startSmartSiriVolume__block_invoke_37(uint64_t a1, int a2)
{
  id WeakRetained;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (a2)
    objc_msgSend(WeakRetained, "_startListenPolling");
  else
    objc_msgSend(WeakRetained, "_stopListening");

}

uint64_t __41__CSSmartSiriVolume_startSmartSiriVolume__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_startListenPolling");
}

@end
