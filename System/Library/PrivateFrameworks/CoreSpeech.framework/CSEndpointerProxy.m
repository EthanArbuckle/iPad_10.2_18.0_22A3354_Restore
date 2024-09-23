@implementation CSEndpointerProxy

- (CSEndpointerProxy)init
{
  CSEndpointerProxy *v2;
  int v3;
  __objc2_class **v4;
  CSEndpointAnalyzerImpl *v5;
  CSEndpointAnalyzerImpl *hybridEndpointer;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CSEndpointerProxy;
  v2 = -[CSEndpointerProxy init](&v8, sel_init);
  if (v2)
  {
    if (objc_msgSend(MEMORY[0x1E0D19260], "supportHybridEndpointer"))
    {
      v3 = objc_msgSend(MEMORY[0x1E0D19260], "isAttentiveSiriEnabled");
      v4 = off_1E7C219C0;
      if (!v3)
        v4 = off_1E7C219B8;
      v5 = (CSEndpointAnalyzerImpl *)objc_alloc_init(*v4);
      hybridEndpointer = v2->_hybridEndpointer;
      v2->_hybridEndpointer = v5;

      -[CSEndpointAnalyzerImpl setDelegate:](v2->_hybridEndpointer, "setDelegate:", v2);
      -[CSEndpointAnalyzerImpl setImplDelegate:](v2->_hybridEndpointer, "setImplDelegate:", v2);
    }
    if (!v2->_hybridEndpointer)
    {
      -[CSEndpointerProxy _setupNNVADEndpointer](v2, "_setupNNVADEndpointer");
      objc_storeWeak((id *)&v2->_activeEndpointer, v2->_nnvadEndpointer);
    }
  }
  return v2;
}

- (id)initForSidekick
{
  CSEndpointerProxy *v2;
  CSHybridEndpointAnalyzer *v3;
  CSEndpointAnalyzerImpl *hybridEndpointer;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CSEndpointerProxy;
  v2 = -[CSEndpointerProxy init](&v6, sel_init);
  if (v2)
  {
    if (objc_msgSend(MEMORY[0x1E0D19260], "supportHybridEndpointer"))
    {
      v3 = objc_alloc_init(CSHybridEndpointAnalyzer);
      hybridEndpointer = v2->_hybridEndpointer;
      v2->_hybridEndpointer = (CSEndpointAnalyzerImpl *)v3;

      -[CSEndpointAnalyzerImpl setDelegate:](v2->_hybridEndpointer, "setDelegate:", v2);
      -[CSEndpointAnalyzerImpl setImplDelegate:](v2->_hybridEndpointer, "setImplDelegate:", v2);
    }
    if (!v2->_hybridEndpointer)
    {
      -[CSEndpointerProxy _setupNNVADEndpointer](v2, "_setupNNVADEndpointer");
      objc_storeWeak((id *)&v2->_activeEndpointer, v2->_nnvadEndpointer);
    }
  }
  return v2;
}

- (void)_setupNNVADEndpointer
{
  CSNNVADEndpointAnalyzer *v3;
  CSEndpointAnalyzerImpl *nnvadEndpointer;
  void *v5;
  void *v6;
  id v7;

  v3 = objc_alloc_init(CSNNVADEndpointAnalyzer);
  nnvadEndpointer = self->_nnvadEndpointer;
  self->_nnvadEndpointer = (CSEndpointAnalyzerImpl *)v3;

  -[CSEndpointAnalyzerImpl setDelegate:](self->_nnvadEndpointer, "setDelegate:", self);
  -[CSEndpointAnalyzerImpl setImplDelegate:](self->_nnvadEndpointer, "setImplDelegate:", self);
  v5 = (void *)MEMORY[0x1E0D19260];
  objc_msgSend(MEMORY[0x1E0D19260], "getSiriLanguageWithFallback:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = objc_msgSend(v5, "isNNVADFallbackUnexpectedForLanguageCode:", v6);

  if ((_DWORD)v5)
  {
    objc_msgSend(MEMORY[0x1E0D190B8], "sharedInstance");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "submitEndpointerIssueReport:", *MEMORY[0x1E0D19338]);

  }
}

- (void)resetForNewRequestWithSampleRate:(unint64_t)a3 recordContext:(id)a4 recordOption:(id)a5 voiceTriggerInfo:(id)a6
{
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  NSObject **v16;
  int v17;
  NSObject *v18;
  _BOOL4 v19;
  CSEndpointAnalyzerImpl *hybridEndpointer;
  CSEndpointAnalyzerImpl **p_activeEndpointer;
  id WeakRetained;
  void *v23;
  id v24;
  void *v25;
  NSObject *v26;
  id v27;
  int v28;
  const char *v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (objc_msgSend(v12, "disableEndpointer"))
  {
    v14 = *MEMORY[0x1E0D18F40];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F40], OS_LOG_TYPE_DEFAULT))
    {
      v28 = 136315394;
      v29 = "-[CSEndpointerProxy resetForNewRequestWithSampleRate:recordContext:recordOption:voiceTriggerInfo:]";
      v30 = 2112;
      v31 = v12;
      _os_log_impl(&dword_1C2614000, v14, OS_LOG_TYPE_DEFAULT, "%s Endpointer is disabled in recordOption: %@", (uint8_t *)&v28, 0x16u);
    }
    objc_storeWeak((id *)&self->_activeEndpointer, 0);
    goto LABEL_21;
  }
  self->_recordingDidStop = 0;
  v15 = objc_msgSend(v12, "disableRCSelection");
  v16 = (NSObject **)MEMORY[0x1E0D18F40];
  if (self->_hybridEndpointer)
  {
    kdebug_trace();
    -[CSEndpointAnalyzerImpl resetForNewRequestWithSampleRate:recordContext:disableRCSelection:](self->_hybridEndpointer, "resetForNewRequestWithSampleRate:recordContext:disableRCSelection:", a3, v11, v15);
    kdebug_trace();
    v17 = -[CSEndpointAnalyzerImpl canProcessCurrentRequest](self->_hybridEndpointer, "canProcessCurrentRequest");
    v18 = *v16;
    v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
    if (v17)
    {
      if (v19)
      {
        v28 = 136315138;
        v29 = "-[CSEndpointerProxy resetForNewRequestWithSampleRate:recordContext:recordOption:voiceTriggerInfo:]";
        _os_log_impl(&dword_1C2614000, v18, OS_LOG_TYPE_DEFAULT, "%s CSHybridEndpointer canProcessCurrentRequest", (uint8_t *)&v28, 0xCu);
      }
      hybridEndpointer = self->_hybridEndpointer;
      goto LABEL_17;
    }
    if (v19)
    {
      v28 = 136315138;
      v29 = "-[CSEndpointerProxy resetForNewRequestWithSampleRate:recordContext:recordOption:voiceTriggerInfo:]";
      _os_log_impl(&dword_1C2614000, v18, OS_LOG_TYPE_DEFAULT, "%s CSHybridEndpointer can NOT ProcessCurrentRequest, fallback to NNVAD", (uint8_t *)&v28, 0xCu);
    }
    if (!self->_nnvadEndpointer)
      -[CSEndpointerProxy _setupNNVADEndpointer](self, "_setupNNVADEndpointer");
    kdebug_trace();
    -[CSEndpointAnalyzerImpl resetForNewRequestWithSampleRate:recordContext:disableRCSelection:](self->_nnvadEndpointer, "resetForNewRequestWithSampleRate:recordContext:disableRCSelection:", a3, v11, v15);
  }
  else
  {
    kdebug_trace();
    -[CSEndpointAnalyzerImpl resetForNewRequestWithSampleRate:recordContext:disableRCSelection:](self->_nnvadEndpointer, "resetForNewRequestWithSampleRate:recordContext:disableRCSelection:", a3, v11, v15);
  }
  kdebug_trace();
  hybridEndpointer = self->_nnvadEndpointer;
LABEL_17:
  objc_storeWeak((id *)&self->_activeEndpointer, hybridEndpointer);
  p_activeEndpointer = &self->_activeEndpointer;
  WeakRetained = objc_loadWeakRetained((id *)&self->_activeEndpointer);
  objc_msgSend(v12, "requestMHUUID");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "setMhId:", v23);

  if (objc_msgSend(v11, "isVoiceTriggered"))
  {
    v24 = objc_loadWeakRetained((id *)&self->_activeEndpointer);
    objc_msgSend(v24, "handleVoiceTriggerWithActivationInfo:", v13);

  }
  self->_accessibleEndpointerEnabled = -[CSEndpointerProxy _updateAccessibleEndpointerThresholdIfNeed](self, "_updateAccessibleEndpointerThresholdIfNeed");
  objc_storeStrong((id *)&self->_recordContext, a4);
  v25 = (void *)*MEMORY[0x1E0D18F40];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F40], OS_LOG_TYPE_DEFAULT))
  {
    v26 = v25;
    v27 = objc_loadWeakRetained((id *)p_activeEndpointer);
    v28 = 136315394;
    v29 = "-[CSEndpointerProxy resetForNewRequestWithSampleRate:recordContext:recordOption:voiceTriggerInfo:]";
    v30 = 2114;
    v31 = v27;
    _os_log_impl(&dword_1C2614000, v26, OS_LOG_TYPE_DEFAULT, "%s _activeEndpointer=%{public}@", (uint8_t *)&v28, 0x16u);

  }
LABEL_21:

}

- (id)cachedEndpointerMetrics
{
  NSObject *v2;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0D18F40];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F40], OS_LOG_TYPE_FAULT))
  {
    v4 = 136315138;
    v5 = "-[CSEndpointerProxy cachedEndpointerMetrics]";
    _os_log_fault_impl(&dword_1C2614000, v2, OS_LOG_TYPE_FAULT, "%s Not supported in this call flow", (uint8_t *)&v4, 0xCu);
  }
  return 0;
}

- (BOOL)_updateAccessibleEndpointerThresholdIfNeed
{
  void *v3;
  uint64_t v4;
  const __CFString *v5;

  objc_msgSend(MEMORY[0x1E0CFE978], "sharedPreferences");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "accessibleEndpointerThreshold");

  if (v4 == 2)
  {
    v5 = CFSTR("accessible-extended");
    goto LABEL_5;
  }
  if (v4 == 3)
  {
    v5 = CFSTR("accessible-maximum");
LABEL_5:
    -[CSEndpointAnalyzerImpl processTaskString:](self->_hybridEndpointer, "processTaskString:", v5);
    return 1;
  }
  return 0;
}

- (void)stopEndpointer
{
  self->_recordingDidStop = 1;
  -[CSEndpointAnalyzerImpl stopEndpointer](self->_hybridEndpointer, "stopEndpointer");
  -[CSEndpointAnalyzerImpl stopEndpointer](self->_nnvadEndpointer, "stopEndpointer");
  objc_storeWeak((id *)&self->_activeEndpointer, 0);
}

- (BOOL)isWatchRTSTriggered
{
  int v3;

  v3 = CSIsWatch();
  if (v3)
    LOBYTE(v3) = -[CSAudioRecordContext isRTSTriggered](self->_recordContext, "isRTSTriggered");
  return v3;
}

- (void)resetForVoiceTriggerTwoShotWithSampleRate:(unint64_t)a3
{
  int v5;
  void *v6;
  NSObject *v7;
  int v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  _BOOL4 v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend(MEMORY[0x1E0D19260], "supportCSTwoShotDecision");
  v6 = (void *)*MEMORY[0x1E0D18F40];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F40], OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    v8 = 136315650;
    v9 = "-[CSEndpointerProxy resetForVoiceTriggerTwoShotWithSampleRate:]";
    v10 = 1026;
    v11 = v5;
    v12 = 1026;
    v13 = -[CSEndpointerProxy isWatchRTSTriggered](self, "isWatchRTSTriggered");
    _os_log_impl(&dword_1C2614000, v7, OS_LOG_TYPE_DEFAULT, "%s shouldUseCVT2ShotDecision: %{public}d, isWatchRTSTriggered=%{public}d", (uint8_t *)&v8, 0x18u);

  }
  if (self->_nnvadEndpointer)
  {
    kdebug_trace();
    -[CSEndpointAnalyzerImpl resetForNewRequestWithSampleRate:recordContext:disableRCSelection:](self->_nnvadEndpointer, "resetForNewRequestWithSampleRate:recordContext:disableRCSelection:", a3, 0, 0);
    kdebug_trace();
  }
}

- (void)setActiveChannel:(unint64_t)a3
{
  -[CSEndpointAnalyzerImpl setActiveChannel:](self->_nnvadEndpointer, "setActiveChannel:");
  -[CSEndpointAnalyzerImpl setActiveChannel:](self->_hybridEndpointer, "setActiveChannel:", a3);
}

- (void)preheat
{
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0D18F40];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F40], OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[CSEndpointerProxy preheat]";
    _os_log_impl(&dword_1C2614000, v3, OS_LOG_TYPE_DEFAULT, "%s preheat", (uint8_t *)&v4, 0xCu);
  }
  -[CSEndpointAnalyzerImpl preheat](self->_nnvadEndpointer, "preheat");
  -[CSEndpointAnalyzerImpl preheat](self->_hybridEndpointer, "preheat");
}

- (void)processAudioSamplesAsynchronously:(id)a3
{
  uint64_t v4;
  id WeakRetained;
  uint64_t v6;
  id v7;

  v7 = a3;
  v4 = processAudioSamplesAsynchronously__heartbeat_CORESPEECH_ENDPOINTER_PROXY_PROCESS_AUDIO_ASYNC_BEGIN;
  if (__ROR8__(0xEEEEEEEEEEEEEEEFLL* processAudioSamplesAsynchronously__heartbeat_CORESPEECH_ENDPOINTER_PROXY_PROCESS_AUDIO_ASYNC_BEGIN, 1) <= 0x888888888888888uLL)
  {
    kdebug_trace();
    v4 = processAudioSamplesAsynchronously__heartbeat_CORESPEECH_ENDPOINTER_PROXY_PROCESS_AUDIO_ASYNC_BEGIN;
  }
  processAudioSamplesAsynchronously__heartbeat_CORESPEECH_ENDPOINTER_PROXY_PROCESS_AUDIO_ASYNC_BEGIN = v4 + 1;
  WeakRetained = objc_loadWeakRetained((id *)&self->_activeEndpointer);
  objc_msgSend(WeakRetained, "processAudioSamplesAsynchronously:", v7);

  v6 = processAudioSamplesAsynchronously__heartbeat_CORESPEECH_ENDPOINTER_PROXY_PROCESS_AUDIO_ASYNC_END;
  if (__ROR8__(0xEEEEEEEEEEEEEEEFLL* processAudioSamplesAsynchronously__heartbeat_CORESPEECH_ENDPOINTER_PROXY_PROCESS_AUDIO_ASYNC_END, 1) <= 0x888888888888888uLL)
  {
    kdebug_trace();
    v6 = processAudioSamplesAsynchronously__heartbeat_CORESPEECH_ENDPOINTER_PROXY_PROCESS_AUDIO_ASYNC_END;
  }
  processAudioSamplesAsynchronously__heartbeat_CORESPEECH_ENDPOINTER_PROXY_PROCESS_AUDIO_ASYNC_END = v6 + 1;

}

- (void)recordingStoppedForReason:(int64_t)a3
{
  id WeakRetained;

  self->_recordingDidStop = 1;
  WeakRetained = objc_loadWeakRetained((id *)&self->_activeEndpointer);
  objc_msgSend(WeakRetained, "recordingStoppedForReason:", a3);

}

- (double)lastStartOfVoiceActivityTime
{
  id WeakRetained;
  double v3;
  double v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_activeEndpointer);
  objc_msgSend(WeakRetained, "lastStartOfVoiceActivityTime");
  v4 = v3;

  return v4;
}

- (void)setRequestMHUUID:(id)a3
{
  CSEndpointAnalyzerImpl **p_activeEndpointer;
  id v4;
  id WeakRetained;

  p_activeEndpointer = &self->_activeEndpointer;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_activeEndpointer);
  objc_msgSend(WeakRetained, "setMhId:", v4);

}

- (void)endpointer:(id)a3 didDetectStartpointAtTime:(double)a4
{
  id v6;
  os_log_t *v7;
  NSObject *v8;
  NSObject *v9;
  id WeakRetained;
  int v11;
  const char *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  double v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (os_log_t *)MEMORY[0x1E0D18F40];
  v8 = *MEMORY[0x1E0D18F40];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F40], OS_LOG_TYPE_DEFAULT))
  {
    v11 = 136315650;
    v12 = "-[CSEndpointerProxy endpointer:didDetectStartpointAtTime:]";
    v13 = 2114;
    v14 = v6;
    v15 = 2050;
    v16 = a4;
    _os_log_impl(&dword_1C2614000, v8, OS_LOG_TYPE_DEFAULT, "%s endpointer: %{public}@: didDetectStartpointAtTime: %{public}f", (uint8_t *)&v11, 0x20u);
  }
  if (self->_recordingDidStop)
  {
    v9 = *v7;
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 136315138;
      v12 = "-[CSEndpointerProxy endpointer:didDetectStartpointAtTime:]";
      _os_log_impl(&dword_1C2614000, v9, OS_LOG_TYPE_DEFAULT, "%s EP_PROXY::RecordingDidStop: Ignoring startPoint-reporting", (uint8_t *)&v11, 0xCu);
    }
  }
  else
  {
    kdebug_trace();
    WeakRetained = objc_loadWeakRetained((id *)&self->_endpointerDelegate);
    objc_msgSend(WeakRetained, "endpointer:didDetectStartpointAtTime:", self, a4);

  }
}

- (void)endpointer:(id)a3 didDetectHardEndpointAtTime:(double)a4 withMetrics:(id)a5 endpointerModelType:(int64_t)a6
{
  id v10;
  id v11;
  os_log_t *v12;
  NSObject *v13;
  NSObject *v14;
  id WeakRetained;
  char v16;
  os_log_t v17;
  NSObject *v18;
  id v19;
  id v20;
  int v21;
  const char *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  double v26;
  __int16 v27;
  id v28;
  __int16 v29;
  int64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v12 = (os_log_t *)MEMORY[0x1E0D18F40];
  v13 = *MEMORY[0x1E0D18F40];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F40], OS_LOG_TYPE_DEFAULT))
  {
    v21 = 136315138;
    v22 = "-[CSEndpointerProxy endpointer:didDetectHardEndpointAtTime:withMetrics:endpointerModelType:]";
    _os_log_impl(&dword_1C2614000, v13, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v21, 0xCu);
  }
  if (self->_recordingDidStop)
  {
    v14 = *v12;
    if (os_log_type_enabled(*v12, OS_LOG_TYPE_DEFAULT))
    {
      v21 = 136315138;
      v22 = "-[CSEndpointerProxy endpointer:didDetectHardEndpointAtTime:withMetrics:endpointerModelType:]";
      _os_log_impl(&dword_1C2614000, v14, OS_LOG_TYPE_DEFAULT, "%s EP_PROXY::RecordingDidStop: Ignoring didDetectHardpoint-reporting", (uint8_t *)&v21, 0xCu);
    }
  }
  else
  {
    kdebug_trace();
    WeakRetained = objc_loadWeakRetained((id *)&self->_endpointerDelegate);
    v16 = objc_opt_respondsToSelector();

    if ((v16 & 1) != 0)
    {
      v17 = *v12;
      if (os_log_type_enabled(*v12, OS_LOG_TYPE_DEFAULT))
      {
        v18 = v17;
        v19 = objc_loadWeakRetained((id *)&self->_endpointerDelegate);
        v21 = 136316162;
        v22 = "-[CSEndpointerProxy endpointer:didDetectHardEndpointAtTime:withMetrics:endpointerModelType:]";
        v23 = 2114;
        v24 = v10;
        v25 = 2050;
        v26 = a4;
        v27 = 2114;
        v28 = v19;
        v29 = 2048;
        v30 = a6;
        _os_log_impl(&dword_1C2614000, v18, OS_LOG_TYPE_DEFAULT, "KeyLog - %s %{public}@: Endpointer didDetectHardEndpointAtTime:withMetrics:endpointerType: %{public}f, CallingDelegate: %{public}@, type %ld", (uint8_t *)&v21, 0x34u);

      }
      v20 = objc_loadWeakRetained((id *)&self->_endpointerDelegate);
      objc_msgSend(v20, "endpointer:didDetectHardEndpointAtTime:withMetrics:endpointerModelType:", self, v11, a6, a4);

    }
  }

}

- (void)endpointer:(id)a3 didDetectHardEndpointAtTime:(double)a4 withMetrics:(id)a5
{
  id v8;
  id v9;
  os_log_t *v10;
  NSObject *v11;
  NSObject *v12;
  id WeakRetained;
  char v14;
  os_log_t v15;
  NSObject *v16;
  id v17;
  id v18;
  int v19;
  const char *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  double v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = (os_log_t *)MEMORY[0x1E0D18F40];
  v11 = *MEMORY[0x1E0D18F40];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F40], OS_LOG_TYPE_DEFAULT))
  {
    v19 = 136315138;
    v20 = "-[CSEndpointerProxy endpointer:didDetectHardEndpointAtTime:withMetrics:]";
    _os_log_impl(&dword_1C2614000, v11, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v19, 0xCu);
  }
  if (self->_recordingDidStop)
  {
    v12 = *v10;
    if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEFAULT))
    {
      v19 = 136315138;
      v20 = "-[CSEndpointerProxy endpointer:didDetectHardEndpointAtTime:withMetrics:]";
      _os_log_impl(&dword_1C2614000, v12, OS_LOG_TYPE_DEFAULT, "%s EP_PROXY::RecordingDidStop: Ignoring didDetectHardEndpointAtTime-reporting", (uint8_t *)&v19, 0xCu);
    }
  }
  else
  {
    kdebug_trace();
    WeakRetained = objc_loadWeakRetained((id *)&self->_endpointerDelegate);
    v14 = objc_opt_respondsToSelector();

    if ((v14 & 1) != 0)
    {
      v15 = *v10;
      if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEFAULT))
      {
        v16 = v15;
        v17 = objc_loadWeakRetained((id *)&self->_endpointerDelegate);
        v19 = 136315906;
        v20 = "-[CSEndpointerProxy endpointer:didDetectHardEndpointAtTime:withMetrics:]";
        v21 = 2114;
        v22 = v8;
        v23 = 2050;
        v24 = a4;
        v25 = 2114;
        v26 = v17;
        _os_log_impl(&dword_1C2614000, v16, OS_LOG_TYPE_DEFAULT, "%s %{public}@: Endpointer didDetectDefaultEndpointAtTime:withMetrics: %{public}f, CallingDelegate: %{public}@", (uint8_t *)&v19, 0x2Au);

      }
      v18 = objc_loadWeakRetained((id *)&self->_endpointerDelegate);
      objc_msgSend(v18, "endpointer:didDetectHardEndpointAtTime:withMetrics:", self, v9, a4);

    }
  }

}

- (void)endpointer:(id)a3 detectedTwoShotAtTime:(double)a4
{
  id v6;
  CSEndpointAnalyzerImplDelegate **p_endpointerImplDelegate;
  id WeakRetained;
  char v9;
  NSObject *v10;
  id v11;
  int v12;
  const char *v13;
  __int16 v14;
  double v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  p_endpointerImplDelegate = &self->_endpointerImplDelegate;
  WeakRetained = objc_loadWeakRetained((id *)p_endpointerImplDelegate);
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    v10 = *MEMORY[0x1E0D18F40];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F40], OS_LOG_TYPE_DEFAULT))
    {
      v12 = 136315394;
      v13 = "-[CSEndpointerProxy endpointer:detectedTwoShotAtTime:]";
      v14 = 2050;
      v15 = a4;
      _os_log_impl(&dword_1C2614000, v10, OS_LOG_TYPE_DEFAULT, "%s Reported 2-shot at: %{public}f secs", (uint8_t *)&v12, 0x16u);
    }
    v11 = objc_loadWeakRetained((id *)p_endpointerImplDelegate);
    objc_msgSend(v11, "endpointer:detectedTwoShotAtTime:", v6, a4);

  }
}

- (void)endpointer:(id)a3 reportEndpointBufferHostTime:(unint64_t)a4 firstBufferHostTime:(unint64_t)a5
{
  void *v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0CFE7D8], "sharedAnalytics", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "logEventWithType:machAbsoluteTime:context:", 4710, a5, 0);

  objc_msgSend(MEMORY[0x1E0CFE7D8], "sharedAnalytics");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "logEventWithType:machAbsoluteTime:context:", 4711, a4, 0);

}

- (double)postVoiceTriggerSilence
{
  CSEndpointAnalyzerImpl *hybridEndpointer;
  double result;

  hybridEndpointer = self->_hybridEndpointer;
  if (!hybridEndpointer)
    return 0.0;
  -[CSEndpointAnalyzerImpl postVoiceTriggerSilence](hybridEndpointer, "postVoiceTriggerSilence");
  return result;
}

- (unint64_t)endPointAnalyzerType
{
  CSEndpointAnalyzerImpl *WeakRetained;
  unint64_t v4;

  WeakRetained = (CSEndpointAnalyzerImpl *)objc_loadWeakRetained((id *)&self->_activeEndpointer);
  v4 = WeakRetained != self->_nnvadEndpointer;

  return v4;
}

- (void)processASRFeatures:(id)a3 fromServer:(BOOL)a4
{
  -[CSEndpointAnalyzerImpl processASRFeatures:fromServer:](self->_hybridEndpointer, "processASRFeatures:fromServer:", a3, a4);
}

- (void)processRCFeatures:(id)a3
{
  -[CSEndpointAnalyzerImpl processRCFeatures:](self->_hybridEndpointer, "processRCFeatures:", a3);
}

- (void)processTaskString:(id)a3
{
  -[CSEndpointAnalyzerImpl processTaskString:](self->_hybridEndpointer, "processTaskString:", a3);
}

- (id)endpointerModelVersion
{
  CSEndpointAnalyzerImpl *hybridEndpointer;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  void *v7;
  __CFString *v8;
  int v10;
  const char *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  hybridEndpointer = self->_hybridEndpointer;
  v4 = *MEMORY[0x1E0D18F40];
  v5 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F40], OS_LOG_TYPE_DEFAULT);
  if (hybridEndpointer)
  {
    if (v5)
    {
      v6 = v4;
      -[CSEndpointAnalyzerImpl endpointerModelVersion](hybridEndpointer, "endpointerModelVersion");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 136315394;
      v11 = "-[CSEndpointerProxy endpointerModelVersion]";
      v12 = 2114;
      v13 = v7;
      _os_log_impl(&dword_1C2614000, v6, OS_LOG_TYPE_DEFAULT, "%s Queried endpointerModelVersion: %{public}@", (uint8_t *)&v10, 0x16u);

      hybridEndpointer = self->_hybridEndpointer;
    }
    -[CSEndpointAnalyzerImpl endpointerModelVersion](hybridEndpointer, "endpointerModelVersion");
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v5)
    {
      v10 = 136315138;
      v11 = "-[CSEndpointerProxy endpointerModelVersion]";
      _os_log_impl(&dword_1C2614000, v4, OS_LOG_TYPE_DEFAULT, "%s WARN: endpointerModelVersion called when CSHybridEndpointer is not available", (uint8_t *)&v10, 0xCu);
    }
    v8 = CFSTR("NA");
  }
  return v8;
}

- (void)updateEndpointerThreshold:(float)a3
{
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (self->_accessibleEndpointerEnabled)
  {
    v3 = *MEMORY[0x1E0D18F40];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F40], OS_LOG_TYPE_DEFAULT))
    {
      v4 = 136315138;
      v5 = "-[CSEndpointerProxy updateEndpointerThreshold:]";
      _os_log_impl(&dword_1C2614000, v3, OS_LOG_TYPE_DEFAULT, "%s Skip update endpointer threshold from server for accessible endpointer request", (uint8_t *)&v4, 0xCu);
    }
  }
  else
  {
    -[CSEndpointAnalyzerImpl updateEndpointerThreshold:](self->_hybridEndpointer, "updateEndpointerThreshold:");
  }
}

- (void)updateEndpointerDelayedTrigger:(BOOL)a3
{
  -[CSEndpointAnalyzerImpl updateEndpointerDelayedTrigger:](self->_hybridEndpointer, "updateEndpointerDelayedTrigger:", a3);
}

- (void)shouldAcceptEagerResultForDuration:(double)a3 resultsCompletionHandler:(id)a4
{
  -[CSEndpointAnalyzerImpl shouldAcceptEagerResultForDuration:resultsCompletionHandler:](self->_hybridEndpointer, "shouldAcceptEagerResultForDuration:resultsCompletionHandler:", a4, a3);
}

- (void)shouldAcceptEagerResultForDuration:(double)a3 withEndpointerMetrics:(id)a4 resultsCompletionHandler:(id)a5
{
  -[CSEndpointAnalyzerImpl shouldAcceptEagerResultForDuration:withEndpointerMetrics:resultsCompletionHandler:](self->_hybridEndpointer, "shouldAcceptEagerResultForDuration:withEndpointerMetrics:resultsCompletionHandler:", a4, a5, a3);
}

- (BOOL)shouldAcceptEagerResultForDurationSync:(double)a3 withEndpointerMetrics:(id)a4
{
  return -[CSEndpointAnalyzerImpl shouldAcceptEagerResultForDurationSync:withEndpointerMetrics:](self->_hybridEndpointer, "shouldAcceptEagerResultForDurationSync:withEndpointerMetrics:", a4, a3);
}

- (void)logAnchorMachAbsTime:(unint64_t)a3 numSamplesProcessedBeforeAnchorTime:(unint64_t)a4 isAnchorTimeBuffered:(BOOL)a5 audioDeliveryHostTimeDelta:(unint64_t)a6
{
  -[CSEndpointAnalyzerImpl logAnchorMachAbsTime:numSamplesProcessedBeforeAnchorTime:isAnchorTimeBuffered:audioDeliveryHostTimeDelta:](self->_hybridEndpointer, "logAnchorMachAbsTime:numSamplesProcessedBeforeAnchorTime:isAnchorTimeBuffered:audioDeliveryHostTimeDelta:", a3, a4, a5, a6);
}

- (void)logHybridEndpointFeaturesWithEvent:(id)a3 locale:(id)a4
{
  id v6;
  id v7;
  CSEndpointAnalyzerImpl *hybridEndpointer;
  NSObject *v9;
  int v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  hybridEndpointer = self->_hybridEndpointer;
  if (hybridEndpointer)
  {
    -[CSEndpointAnalyzerImpl logFeaturesWithEvent:locale:](hybridEndpointer, "logFeaturesWithEvent:locale:", v6, v7);
  }
  else
  {
    v9 = *MEMORY[0x1E0D18F40];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F40], OS_LOG_TYPE_DEFAULT))
    {
      v10 = 136315138;
      v11 = "-[CSEndpointerProxy logHybridEndpointFeaturesWithEvent:locale:]";
      _os_log_impl(&dword_1C2614000, v9, OS_LOG_TYPE_DEFAULT, "%s WARN: logEndpointFeatures called when CSHybridEndpointer is not available", (uint8_t *)&v10, 0xCu);
    }
  }

}

- (void)setStartWaitTime:(double)a3
{
  -[CSEndpointAnalyzerImpl setStartWaitTime:](self->_nnvadEndpointer, "setStartWaitTime:", a3);
}

- (void)setEndWaitTime:(double)a3
{
  -[CSEndpointAnalyzerImpl setEndWaitTime:](self->_nnvadEndpointer, "setEndWaitTime:", a3);
}

- (void)setAutomaticEndpointingSuspensionEndTime:(double)a3
{
  -[CSEndpointAnalyzerImpl setAutomaticEndpointingSuspensionEndTime:](self->_nnvadEndpointer, "setAutomaticEndpointingSuspensionEndTime:", a3);
}

- (void)processOSDFeatures:(id)a3 withFrameDurationMs:(double)a4 withMHID:(id)a5
{
  -[CSEndpointAnalyzerImpl processOSDFeatures:withFrameDurationMs:withMHID:](self->_hybridEndpointer, "processOSDFeatures:withFrameDurationMs:withMHID:", a3, a5, a4);
}

- (void)processFirstAudioPacketTimestamp:(id)a3 firstAudioSampleSensorTimestamp:(unint64_t)a4
{
  -[CSEndpointAnalyzerImpl processFirstAudioPacketTimestamp:firstAudioSampleSensorTimestamp:](self->_hybridEndpointer, "processFirstAudioPacketTimestamp:firstAudioSampleSensorTimestamp:", a3, a4);
}

- (void)setEndpointerOperationMode:(int64_t)a3
{
  -[CSEndpointAnalyzerImpl setEndpointerOperationMode:](self->_hybridEndpointer, "setEndpointerOperationMode:", a3);
}

- (int64_t)fetchCurrentEndpointerOperationMode
{
  return -[CSEndpointAnalyzerImpl fetchCurrentEndpointerOperationMode](self->_hybridEndpointer, "fetchCurrentEndpointerOperationMode");
}

- (int64_t)endpointStyle
{
  return 0;
}

- (double)interspeechWaitTime
{
  return 0.0;
}

- (double)delay
{
  return 0.0;
}

- (double)minimumDurationForEndpointer
{
  return 0.0;
}

- (BOOL)saveSamplesSeenInReset
{
  return 0;
}

- (double)lastEndOfVoiceActivityTime
{
  return 0.0;
}

- (double)startWaitTime
{
  return 0.0;
}

- (double)endWaitTime
{
  return 0.0;
}

- (double)automaticEndpointingSuspensionEndTime
{
  return 0.0;
}

- (CSEndpointAnalyzerDelegate)endpointerDelegate
{
  return (CSEndpointAnalyzerDelegate *)objc_loadWeakRetained((id *)&self->_endpointerDelegate);
}

- (void)setEndpointerDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_endpointerDelegate, a3);
}

- (CSEndpointAnalyzerImplDelegate)endpointerImplDelegate
{
  return (CSEndpointAnalyzerImplDelegate *)objc_loadWeakRetained((id *)&self->_endpointerImplDelegate);
}

- (void)setEndpointerImplDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_endpointerImplDelegate, a3);
}

- (CSEndpointAnalyzerImpl)activeEndpointer
{
  return (CSEndpointAnalyzerImpl *)objc_loadWeakRetained((id *)&self->_activeEndpointer);
}

- (void)setActiveEndpointer:(id)a3
{
  objc_storeWeak((id *)&self->_activeEndpointer, a3);
}

- (CSEndpointAnalyzerImpl)hybridEndpointer
{
  return self->_hybridEndpointer;
}

- (void)setHybridEndpointer:(id)a3
{
  objc_storeStrong((id *)&self->_hybridEndpointer, a3);
}

- (CSEndpointAnalyzerImpl)nnvadEndpointer
{
  return self->_nnvadEndpointer;
}

- (void)setNnvadEndpointer:(id)a3
{
  objc_storeStrong((id *)&self->_nnvadEndpointer, a3);
}

- (CSAudioRecordContext)recordContext
{
  return self->_recordContext;
}

- (void)setRecordContext:(id)a3
{
  objc_storeStrong((id *)&self->_recordContext, a3);
}

- (BOOL)accessibleEndpointerEnabled
{
  return self->_accessibleEndpointerEnabled;
}

- (void)setAccessibleEndpointerEnabled:(BOOL)a3
{
  self->_accessibleEndpointerEnabled = a3;
}

- (BOOL)recordingDidStop
{
  return self->_recordingDidStop;
}

- (void)setRecordingDidStop:(BOOL)a3
{
  self->_recordingDidStop = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordContext, 0);
  objc_storeStrong((id *)&self->_nnvadEndpointer, 0);
  objc_storeStrong((id *)&self->_hybridEndpointer, 0);
  objc_destroyWeak((id *)&self->_activeEndpointer);
  objc_destroyWeak((id *)&self->_endpointerImplDelegate);
  objc_destroyWeak((id *)&self->_endpointerDelegate);
}

@end
