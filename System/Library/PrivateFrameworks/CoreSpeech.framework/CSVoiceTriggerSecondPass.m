@implementation CSVoiceTriggerSecondPass

- (CSVoiceTriggerSecondPass)initWithPHSEnabled:(BOOL)a3 speechManager:(id)a4 supportsMphDetection:(BOOL)a5 secondPassQueue:(id)a6
{
  _BOOL4 v9;
  id v11;
  id v12;
  CSVoiceTriggerSecondPass *v13;
  CSVoiceTriggerSecondPass *v14;
  OS_dispatch_queue *v15;
  NSObject *queue;
  dispatch_queue_t v17;
  OS_dispatch_queue *v18;
  float v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSString *UUID;
  uint64_t v24;
  NSMutableArray *assetConfigWaitingBuffer;
  uint64_t v26;
  CSExclaveRecordClient *exclaveClient;
  NSObject *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  objc_super v33;
  uint8_t buf[4];
  const char *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  _BOOL4 v39;
  uint64_t v40;

  v9 = a3;
  v40 = *MEMORY[0x1E0C80C00];
  v11 = a4;
  v12 = a6;
  v33.receiver = self;
  v33.super_class = (Class)CSVoiceTriggerSecondPass;
  v13 = -[CSVoiceTriggerSecondPass init](&v33, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_speechManager, a4);
    if (v12)
    {
      v15 = (OS_dispatch_queue *)v12;
      queue = v14->_queue;
      v14->_queue = v15;
    }
    else
    {
      dispatch_get_global_queue(33, 0);
      queue = objc_claimAutoreleasedReturnValue();
      v17 = dispatch_queue_create_with_target_V2("VoiceTrigger Second Pass Queue", 0, queue);
      v18 = v14->_queue;
      v14->_queue = (OS_dispatch_queue *)v17;

    }
    v14->_firstPassSource = 0;
    v14->_shouldUsePHS = v9;
    v14->_numProcessedSamples = 0;
    v14->_numAnalyzedSamples = 0;
    objc_msgSend(MEMORY[0x1E0D19090], "inputRecordingSampleRate");
    v14->_secondPassTimeout = (unint64_t)(float)(v19 * 3.0);
    v14->_secondPassCompleteWatchDogTimeoutSec = 20.0;
    -[CSVoiceTriggerSecondPass _clearTriggerCandidate](v14, "_clearTriggerCandidate");
    *(_OWORD *)&v14->_lastAggTime = 0u;
    *(_OWORD *)&v14->_cumulativeDowntime = 0u;
    objc_msgSend(MEMORY[0x1E0D19280], "sharedInstance");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addObserver:", v14);

    -[CSVoiceTriggerSecondPass _initializeMediaPlayingState](v14, "_initializeMediaPlayingState");
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "UUIDString");
    v22 = objc_claimAutoreleasedReturnValue();
    UUID = v14->_UUID;
    v14->_UUID = (NSString *)v22;

    v14->_firstTimeAssetConfigured = 0;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v24 = objc_claimAutoreleasedReturnValue();
    assetConfigWaitingBuffer = v14->_assetConfigWaitingBuffer;
    v14->_assetConfigWaitingBuffer = (NSMutableArray *)v24;

    v14->_firstPassFireHostTime = 0;
    v14->_prewarmMmapedSize = 0;
    v14->_prewarmModelGraph = 0;
    v14->_supportsMph = a5;
    v14->_isPSRAudioFlushed = 0;
    v14->_AOPVTTriggerLength = 0;
    v14->_timeBasedEstimatedTriggerLength = 0;
    if (objc_msgSend(MEMORY[0x1E0D19260], "isExclaveHardware"))
    {
      objc_msgSend(MEMORY[0x1E0D190D8], "sharedClient");
      v26 = objc_claimAutoreleasedReturnValue();
      exclaveClient = v14->_exclaveClient;
      v14->_exclaveClient = (CSExclaveRecordClient *)v26;

      v28 = *MEMORY[0x1E0D18F60];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v35 = "-[CSVoiceTriggerSecondPass initWithPHSEnabled:speechManager:supportsMphDetection:secondPassQueue:]";
        _os_log_impl(&dword_1C2614000, v28, OS_LOG_TYPE_DEFAULT, "%s Initializing Secure VoiceTriggerSecondPass", buf, 0xCu);
      }
      -[CSExclaveRecordClient initializeSecondPass](v14->_exclaveClient, "initializeSecondPass");
    }
    v29 = (void *)*MEMORY[0x1E0D18F58];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT))
    {
      v30 = v29;
      -[CSVoiceTriggerSecondPass UUID](v14, "UUID");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v35 = "-[CSVoiceTriggerSecondPass initWithPHSEnabled:speechManager:supportsMphDetection:secondPassQueue:]";
      v36 = 2114;
      v37 = v31;
      v38 = 1024;
      v39 = v9;
      _os_log_impl(&dword_1C2614000, v30, OS_LOG_TYPE_DEFAULT, "%s CSVoiceTriggerSecondPass[%{public}@]:initialized with PHS : %d", buf, 0x1Cu);

    }
  }

  return v14;
}

- (CSVoiceTriggerSecondPass)initWithPHSEnabled:(BOOL)a3 targetQueue:(id)a4
{
  _BOOL8 v4;
  dispatch_queue_t v6;
  CSVoiceTriggerSecondPass *v7;

  v4 = a3;
  v6 = dispatch_queue_create_with_target_V2("VoiceTrigger Second Pass Queue", 0, (dispatch_queue_t)a4);
  v7 = -[CSVoiceTriggerSecondPass initWithPHSEnabled:speechManager:supportsMphDetection:secondPassQueue:](self, "initWithPHSEnabled:speechManager:supportsMphDetection:secondPassQueue:", v4, 0, 0, v6);

  return v7;
}

- (CSVoiceTriggerSecondPass)initWithPHSEnabled:(BOOL)a3
{
  return -[CSVoiceTriggerSecondPass initWithPHSEnabled:speechManager:supportsMphDetection:secondPassQueue:](self, "initWithPHSEnabled:speechManager:supportsMphDetection:secondPassQueue:", a3, 0, 0, 0);
}

- (void)dealloc
{
  void *v3;
  NSObject *v4;
  void *v5;
  objc_super v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  -[CSVoiceTriggerSecondPass _unmapForPrewarmLoadedGraph](self, "_unmapForPrewarmLoadedGraph");
  v3 = (void *)*MEMORY[0x1E0D18F58];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    -[CSVoiceTriggerSecondPass UUID](self, "UUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v8 = "-[CSVoiceTriggerSecondPass dealloc]";
    v9 = 2114;
    v10 = v5;
    _os_log_impl(&dword_1C2614000, v4, OS_LOG_TYPE_DEFAULT, "%s CSVoiceTriggerSecondPass[%{public}@]:deallocated", buf, 0x16u);

  }
  v6.receiver = self;
  v6.super_class = (Class)CSVoiceTriggerSecondPass;
  -[CSVoiceTriggerSecondPass dealloc](&v6, sel_dealloc);
}

- (void)setSpeechManager:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__CSVoiceTriggerSecondPass_setSpeechManager___block_invoke;
  block[3] = &unk_1E7C292A0;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async_and_wait(queue, block);

}

- (void)setSupportsMultiPhraseDetection:(BOOL)a3
{
  NSObject *queue;
  _QWORD v4[5];
  BOOL v5;

  queue = self->_queue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __60__CSVoiceTriggerSecondPass_setSupportsMultiPhraseDetection___block_invoke;
  v4[3] = &unk_1E7C28480;
  v4[4] = self;
  v5 = a3;
  dispatch_async_and_wait(queue, v4);
}

- (void)start
{
  id v3;

  objc_msgSend(MEMORY[0x1E0D19028], "sharedInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:", self);

}

- (void)prewarm
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__CSVoiceTriggerSecondPass_prewarm__block_invoke;
  block[3] = &unk_1E7C292C8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_mmapModelForPreWarm
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  NSObject *v9;
  unint64_t prewarmMmapedSize;
  id v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  unint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (CSIsHorseman())
  {
    v3 = (void *)MEMORY[0x1E0D19160];
    -[CSVoiceTriggerSecondPassConfig configPathRecognizer](self->_config, "configPathRecognizer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "readBnnsIrFromModelConfig:modelType:", v4, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = 0;
    v6 = (void *)objc_msgSend(MEMORY[0x1E0D19260], "mmapWithFile:mappedSizeOut:", v5, &v11);
    v7 = v11;
    v8 = v7;
    self->_prewarmModelGraph = v6;
    if (v7)
      self->_prewarmMmapedSize = objc_msgSend(v7, "unsignedLongValue");
    v9 = *MEMORY[0x1E0D18F58];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT))
    {
      prewarmMmapedSize = self->_prewarmMmapedSize;
      *(_DWORD *)buf = 136315394;
      v13 = "-[CSVoiceTriggerSecondPass _mmapModelForPreWarm]";
      v14 = 2048;
      v15 = prewarmMmapedSize;
      _os_log_impl(&dword_1C2614000, v9, OS_LOG_TYPE_DEFAULT, "%s mmap with model size: %lu", buf, 0x16u);
    }

  }
}

- (void)setFirstPassSource:(unint64_t)a3
{
  NSObject *queue;
  _QWORD v4[6];

  queue = self->_queue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __47__CSVoiceTriggerSecondPass_setFirstPassSource___block_invoke;
  v4[3] = &unk_1E7C29178;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

- (void)setFirstPassDeviceId:(id)a3
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
  v7[2] = __49__CSVoiceTriggerSecondPass_setFirstPassDeviceId___block_invoke;
  v7[3] = &unk_1E7C292A0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)setSecondPassClient:(unint64_t)a3
{
  NSObject *queue;
  _QWORD block[4];
  id v7[2];
  id location;

  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__CSVoiceTriggerSecondPass_setSecondPassClient___block_invoke;
  block[3] = &unk_1E7C25940;
  objc_copyWeak(v7, &location);
  v7[1] = (id)a3;
  dispatch_async(queue, block);
  objc_destroyWeak(v7);
  objc_destroyWeak(&location);
}

- (id)_getAudioTimeConverter
{
  CSAudioTimeConverter *audioTimeConverter;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  CSAudioTimeConverter *v8;
  CSAudioTimeConverter *v9;

  audioTimeConverter = self->_audioTimeConverter;
  if (!audioTimeConverter)
  {
    -[CSVoiceTriggerSecondPass audioStream](self, "audioStream");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "streamProvider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "audioStreamId");

    objc_msgSend(MEMORY[0x1E0D19068], "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "converterForAudioStreamId:", v6);
    v8 = (CSAudioTimeConverter *)objc_claimAutoreleasedReturnValue();
    v9 = self->_audioTimeConverter;
    self->_audioTimeConverter = v8;

    audioTimeConverter = self->_audioTimeConverter;
  }
  return audioTimeConverter;
}

- (id)_getExclaveAudioTimeConverter
{
  CSAudioTimeConverter *exclaveAudioTimeConverter;
  void *v4;
  CSAudioTimeConverter *v5;
  CSAudioTimeConverter *v6;

  exclaveAudioTimeConverter = self->_exclaveAudioTimeConverter;
  if (!exclaveAudioTimeConverter)
  {
    objc_msgSend(MEMORY[0x1E0D19068], "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "defaultExclaveConverter");
    v5 = (CSAudioTimeConverter *)objc_claimAutoreleasedReturnValue();
    v6 = self->_exclaveAudioTimeConverter;
    self->_exclaveAudioTimeConverter = v5;

    exclaveAudioTimeConverter = self->_exclaveAudioTimeConverter;
  }
  return exclaveAudioTimeConverter;
}

- (id)_fetchSiriLocale
{
  NSString *currentLocale;
  NSString *v4;
  NSString *v5;
  NSString *v6;

  if (self->_firstPassDeviceId && self->_secondPassClient == 5)
  {
    currentLocale = self->_currentLocale;
    if (!currentLocale)
    {
      objc_msgSend(MEMORY[0x1E0D19260], "getSiriLanguageWithEndpointId:fallbackLanguage:");
      v4 = (NSString *)objc_claimAutoreleasedReturnValue();
      v5 = self->_currentLocale;
      self->_currentLocale = v4;

      currentLocale = self->_currentLocale;
    }
    v6 = currentLocale;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D19260], "getSiriLanguageWithFallback:", CFSTR("en-US"));
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (void)reset
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__CSVoiceTriggerSecondPass_reset__block_invoke;
  block[3] = &unk_1E7C292C8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_reset
{
  id v3;
  NSString *currentLocale;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  self->_isPSRAudioFlushed = 0;
  self->_numProcessedSamples = 0;
  self->_numAnalyzedSamples = 0;
  -[CSPhraseDetector reset](self->_phraseDetector, "reset");
  self->_processedSampleCountsInPending = 0;
  self->_secondPassCheckerExecutionTime = 0;
  -[CSVoiceTriggerSecondPass _resetStartAnalyzeTime](self, "_resetStartAnalyzeTime");
  self->_secondPassHasMadeDecision = 0;
  v3 = (id)-[SSRSpeakerRecognitionController resetWithContext:](self->_speakerRecognitionController, "resetWithContext:", self->_ssrContext);
  currentLocale = self->_currentLocale;
  self->_currentLocale = 0;

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
  v7[2] = __37__CSVoiceTriggerSecondPass_setAsset___block_invoke;
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
  CSVoiceTriggerSecondPassConfig *v7;
  CSVoiceTriggerSecondPassConfig *config;
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
  CSPhraseDetector *v19;
  CSPhraseDetector *phraseDetector;
  void *v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  double v32;
  void *v33;
  uint64_t v34;
  NSObject *v35;
  void *v36;
  NSObject *v37;
  void *v38;
  _BOOL4 shouldUsePHS;
  void *v40;
  CSVoiceTriggerSecondPassConfig *v41;
  unint64_t firstPassSource;
  unint64_t AOPVTTriggerLength;
  float v44;
  float secondPassPrependingSec;
  float v46;
  unint64_t v47;
  NSObject *v48;
  unint64_t timeBasedEstimatedTriggerLength;
  float v50;
  float v51;
  float v52;
  unint64_t v53;
  NSObject *v54;
  void *v55;
  void *v56;
  int v57;
  NSObject *v58;
  void *v59;
  uint64_t v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  SSRSpeakerRecognitionContext *v65;
  id v66;
  SSRSpeakerRecognitionContext *ssrContext;
  id v68;
  SSRSpeakerRecognitionContext *v69;
  SSRSpeakerRecognitionController *v70;
  SSRSpeakerRecognitionController *speakerRecognitionController;
  void *v72;
  void *v73;
  float v74;
  void *v75;
  NSObject *v76;
  void *v77;
  void *v78;
  const char *v79;
  void *v80;
  void *v81;
  NSObject *v82;
  void *v83;
  NSObject *v84;
  void *v85;
  NSObject *v86;
  void *v87;
  NSObject *v88;
  void *v89;
  void *v90;
  NSObject *v91;
  NSObject *v92;
  id v93;
  id v94;
  void *v95;
  _QWORD v96[5];
  _QWORD v97[5];
  uint8_t buf[4];
  const char *v99;
  __int16 v100;
  unint64_t v101;
  __int16 v102;
  _BYTE v103[10];
  void *v104;
  uint64_t v105;

  v105 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!v5)
  {
    v40 = (void *)*MEMORY[0x1E0D18F58];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_ERROR))
      goto LABEL_23;
    v23 = v40;
    -[CSVoiceTriggerSecondPass UUID](self, "UUID");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v99 = "-[CSVoiceTriggerSecondPass _setAsset:]";
    v100 = 2114;
    v101 = (unint64_t)v59;
    _os_log_error_impl(&dword_1C2614000, v23, OS_LOG_TYPE_ERROR, "%s CSVoiceTriggerSecondPass[%{public}@]:asset is nil, stop initialization", buf, 0x16u);

    goto LABEL_42;
  }
  p_currentAsset = &self->_currentAsset;
  objc_storeStrong((id *)&self->_currentAsset, a3);
  objc_msgSend(MEMORY[0x1E0D192A0], "decodeConfigFrom:forFirstPassSource:", self->_currentAsset, self->_firstPassSource);
  v7 = (CSVoiceTriggerSecondPassConfig *)objc_claimAutoreleasedReturnValue();
  config = self->_config;
  self->_config = v7;

  -[CSVoiceTriggerSecondPassConfig preTriggerAudioTime](self->_config, "preTriggerAudioTime");
  v10 = v9;
  objc_msgSend(MEMORY[0x1E0D19090], "inputRecordingSampleRate");
  self->_extraSamplesAtStart = (unint64_t)(float)(v10 * v11);
  -[CSVoiceTriggerSecondPassConfig prependingAudioTime](self->_config, "prependingAudioTime");
  v13 = v12;
  objc_msgSend(MEMORY[0x1E0D19090], "inputRecordingSampleRate");
  self->_analyzerPrependingSamples = (unint64_t)(float)(v13 * v14);
  -[CSVoiceTriggerSecondPassConfig trailingAudioTime](self->_config, "trailingAudioTime");
  v16 = v15;
  objc_msgSend(MEMORY[0x1E0D19090], "inputRecordingSampleRate");
  self->_analyzerTrailingSamples = (unint64_t)(float)(v16 * v17);
  -[CSVoiceTriggerSecondPassConfig prependingAudioTime](self->_config, "prependingAudioTime");
  self->_secondPassPrependingSec = v18;
  if (!self->_phraseDetector)
  {
    v19 = (CSPhraseDetector *)objc_alloc_init(MEMORY[0x1E0D191A8]);
    phraseDetector = self->_phraseDetector;
    self->_phraseDetector = v19;

  }
  -[CSVoiceTriggerSecondPass _voiceTriggerSecondPassLatencyMetrics](self, "_voiceTriggerSecondPassLatencyMetrics");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setSecondPassAssetLoadStartTime:", mach_absolute_time());

  -[CSPhraseDetector setConfig:](self->_phraseDetector, "setConfig:", self->_config);
  -[CSVoiceTriggerSecondPass _voiceTriggerSecondPassLatencyMetrics](self, "_voiceTriggerSecondPassLatencyMetrics");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setSecondPassAssetLoadCompleteTime:", mach_absolute_time());

  if (!self->_firstTimeAssetConfigured)
  {
    self->_firstTimeAssetConfigured = 1;
    v41 = self->_config;
    if (v41)
    {
      firstPassSource = self->_firstPassSource;
      if (firstPassSource == 12 || firstPassSource == 2)
      {
        AOPVTTriggerLength = self->_AOPVTTriggerLength;
        if (AOPVTTriggerLength)
        {
          v44 = (float)AOPVTTriggerLength;
          secondPassPrependingSec = self->_secondPassPrependingSec;
          objc_msgSend(MEMORY[0x1E0D19090], "inputRecordingSampleRate");
          v47 = (unint64_t)(float)((float)(v44 + (float)(secondPassPrependingSec * v46))
                                        + (float)self->_analyzerTrailingSamples);
          self->_secondPassTimeout = v47;
          v48 = *MEMORY[0x1E0D18F58];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315394;
            v99 = "-[CSVoiceTriggerSecondPass _setAsset:]";
            v100 = 2048;
            v101 = v47;
            _os_log_impl(&dword_1C2614000, v48, OS_LOG_TYPE_DEFAULT, "%s AOP trigger length to override secondpass timeout: %lu", buf, 0x16u);
          }
          v41 = self->_config;
        }
        if (-[CSVoiceTriggerSecondPassConfig useTimeBasedTriggerLength](v41, "useTimeBasedTriggerLength"))
        {
          timeBasedEstimatedTriggerLength = self->_timeBasedEstimatedTriggerLength;
          if (timeBasedEstimatedTriggerLength)
          {
            v50 = (float)timeBasedEstimatedTriggerLength;
            v51 = self->_secondPassPrependingSec;
            objc_msgSend(MEMORY[0x1E0D19090], "inputRecordingSampleRate");
            v53 = (unint64_t)(float)((float)(v50 + (float)(v51 * v52)) + (float)self->_analyzerTrailingSamples);
            self->_secondPassTimeout = v53;
            v54 = *MEMORY[0x1E0D18F58];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315394;
              v99 = "-[CSVoiceTriggerSecondPass _setAsset:]";
              v100 = 2048;
              v101 = v53;
              _os_log_impl(&dword_1C2614000, v54, OS_LOG_TYPE_DEFAULT, "%s Timebased trigger length to override secondpass timeout: %lu", buf, 0x16u);
            }
          }
        }
      }
    }
  }
  if (self->_shouldUsePHS
    && objc_msgSend(MEMORY[0x1E0D19260], "supportSAT")
    && -[CSAsset containsSpeakerRecognitionCategory](*p_currentAsset, "containsSpeakerRecognitionCategory"))
  {
    v23 = self->_currentAsset;
    -[CSVoiceTriggerSecondPass _fetchSiriLocale](self, "_fetchSiriLocale");
    v24 = objc_claimAutoreleasedReturnValue();
    if (v24)
    {
      v25 = (void *)v24;
      v91 = v23;
      objc_msgSend(MEMORY[0x1E0DA8C28], "sharedInstance");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = *MEMORY[0x1E0DA8C70];
      objc_msgSend(v26, "provisionedVoiceProfilesForAppDomain:withLocale:", *MEMORY[0x1E0DA8C70], v25);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      v29 = v28;
      if (!objc_msgSend(v28, "count"))
      {
        v56 = (void *)*MEMORY[0x1E0D18F58];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_ERROR))
        {
          v86 = v56;
          -[CSVoiceTriggerSecondPass UUID](self, "UUID");
          v87 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315650;
          v99 = "-[CSVoiceTriggerSecondPass _setAsset:]";
          v100 = 2114;
          v101 = (unint64_t)v87;
          v102 = 2114;
          *(_QWORD *)v103 = v25;
          _os_log_error_impl(&dword_1C2614000, v86, OS_LOG_TYPE_ERROR, "%s CSVoiceTriggerSecondPass[%{public}@]:ERR: Failed to retrieve voice profiles for %{public}@", buf, 0x20u);

        }
        -[CSVoiceTriggerSecondPass _reset](self, "_reset");
        v57 = 1;
        v58 = v91;
LABEL_57:

        if (v57)
          goto LABEL_23;
        goto LABEL_21;
      }
      v90 = v28;
      if ((unint64_t)objc_msgSend(v28, "count") >= 2)
      {
        v30 = (void *)*MEMORY[0x1E0D18F58];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_ERROR))
        {
          v88 = v30;
          -[CSVoiceTriggerSecondPass UUID](self, "UUID");
          v89 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315906;
          v99 = "-[CSVoiceTriggerSecondPass _setAsset:]";
          v100 = 2114;
          v101 = (unint64_t)v89;
          v102 = 2114;
          *(_QWORD *)v103 = v25;
          *(_WORD *)&v103[8] = 2114;
          v104 = v90;
          _os_log_error_impl(&dword_1C2614000, v88, OS_LOG_TYPE_ERROR, "%s CSVoiceTriggerSecondPass[%{public}@]:ERR: More than one Siri voice profile present for %{public}@ - %{public}@, trigger cleanup", buf, 0x2Au);

        }
        objc_msgSend(MEMORY[0x1E0DA8C28], "sharedInstance");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "triggerInvalidSiriProfileCleanupFromPersonalDevicesForLanguage:appDomain:", v25, v27);

        v29 = v90;
      }
      if (objc_msgSend(v5, "useSpeakerRecognitionAsset"))
      {
        +[CSAssetManager sharedManager](CSAssetManager, "sharedManager");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "installedAssetOfType:language:", 3, v25);
        v34 = objc_claimAutoreleasedReturnValue();

        if (v34)
        {
          v35 = *MEMORY[0x1E0D18F58];
          v29 = v90;
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315394;
            v99 = "-[CSVoiceTriggerSecondPass _setAsset:]";
            v100 = 2112;
            v101 = v34;
            _os_log_impl(&dword_1C2614000, v35, OS_LOG_TYPE_DEFAULT, "%s Found speaker recognition asset:%@", buf, 0x16u);
          }
          v23 = v34;
        }
        else
        {
          v23 = *p_currentAsset;
          v81 = (void *)*MEMORY[0x1E0D18F58];
          v29 = v90;
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT))
          {
            v82 = v81;
            -[CSVoiceTriggerSecondPass UUID](self, "UUID");
            v83 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136315394;
            v99 = "-[CSVoiceTriggerSecondPass _setAsset:]";
            v100 = 2114;
            v101 = (unint64_t)v83;
            _os_log_impl(&dword_1C2614000, v82, OS_LOG_TYPE_DEFAULT, "%s CSVoiceTriggerSecondPass[%{public}@]:Falling back to VT-assets", buf, 0x16u);

          }
        }
      }
      v60 = *MEMORY[0x1E0DA8C40];
      v96[0] = *MEMORY[0x1E0DA8C80];
      v96[1] = v60;
      v97[0] = &unk_1E7C63488;
      v97[1] = v23;
      v92 = v23;
      v96[2] = *MEMORY[0x1E0DA8C58];
      LODWORD(v32) = 2.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v32);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v97[2] = v61;
      v96[3] = *MEMORY[0x1E0DA8C68];
      objc_msgSend(v29, "objectAtIndexedSubscript:", 0);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v95 = v62;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v95, 1);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      v96[4] = *MEMORY[0x1E0DA8C50];
      v97[3] = v63;
      v97[4] = v25;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v97, v96, 5);
      v64 = (void *)objc_claimAutoreleasedReturnValue();

      v94 = 0;
      v65 = (SSRSpeakerRecognitionContext *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA8C08]), "initWithVoiceRecognitionContext:error:", v64, &v94);
      v66 = v94;
      ssrContext = self->_ssrContext;
      self->_ssrContext = v65;

      if (!self->_ssrContext || v66)
      {
        v75 = (void *)*MEMORY[0x1E0D18F58];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT))
        {
          v76 = v75;
          -[CSVoiceTriggerSecondPass UUID](self, "UUID");
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v66, "localizedDescription");
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315650;
          v99 = "-[CSVoiceTriggerSecondPass _setAsset:]";
          v100 = 2114;
          v101 = (unint64_t)v77;
          v102 = 2112;
          *(_QWORD *)v103 = v78;
          v79 = "%s CSVoiceTriggerSecondPass[%{public}@]:Failed to create SSR context with error %@";
LABEL_54:
          _os_log_impl(&dword_1C2614000, v76, OS_LOG_TYPE_DEFAULT, v79, buf, 0x20u);

        }
      }
      else
      {
        v68 = objc_alloc(MEMORY[0x1E0DA8C10]);
        v69 = self->_ssrContext;
        v93 = 0;
        v70 = (SSRSpeakerRecognitionController *)objc_msgSend(v68, "initWithContext:withDelegate:error:", v69, self, &v93);
        v66 = v93;
        speakerRecognitionController = self->_speakerRecognitionController;
        self->_speakerRecognitionController = v70;

        if (self->_speakerRecognitionController && !v66)
        {
          -[CSVoiceTriggerSecondPassConfig phraseConfigs](self->_config, "phraseConfigs");
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v72, "firstObject");
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v73, "speakerRejectLoggingThreshold");
          self->_phsRejectLoggingThreshold = v74;

          if (objc_msgSend(MEMORY[0x1E0D19260], "isExclaveHardware"))
            -[CSVoiceTriggerSecondPass _syncVoiceProfileEmbeddingsToExclave](self, "_syncVoiceProfileEmbeddingsToExclave");
          v57 = 0;
          goto LABEL_56;
        }
        v80 = (void *)*MEMORY[0x1E0D18F58];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT))
        {
          v76 = v80;
          -[CSVoiceTriggerSecondPass UUID](self, "UUID");
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v66, "localizedDescription");
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315650;
          v99 = "-[CSVoiceTriggerSecondPass _setAsset:]";
          v100 = 2114;
          v101 = (unint64_t)v77;
          v102 = 2112;
          *(_QWORD *)v103 = v78;
          v79 = "%s CSVoiceTriggerSecondPass[%{public}@]:Failed to create SSR controller with error %@";
          goto LABEL_54;
        }
      }
      -[CSVoiceTriggerSecondPass _reset](self, "_reset");

      v57 = 1;
LABEL_56:
      v29 = v90;
      v58 = v92;

      goto LABEL_57;
    }
    v55 = (void *)*MEMORY[0x1E0D18F58];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_ERROR))
    {
      v84 = v55;
      -[CSVoiceTriggerSecondPass UUID](self, "UUID");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v99 = "-[CSVoiceTriggerSecondPass _setAsset:]";
      v100 = 2114;
      v101 = (unint64_t)v85;
      _os_log_error_impl(&dword_1C2614000, v84, OS_LOG_TYPE_ERROR, "%s CSVoiceTriggerSecondPass[%{public}@]:Failed to get language code!!!", buf, 0x16u);

    }
    -[CSVoiceTriggerSecondPass _reset](self, "_reset");
LABEL_42:

    goto LABEL_23;
  }
  v36 = (void *)*MEMORY[0x1E0D18F58];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT))
  {
    v37 = v36;
    -[CSVoiceTriggerSecondPass UUID](self, "UUID");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    shouldUsePHS = self->_shouldUsePHS;
    *(_DWORD *)buf = 136315906;
    v99 = "-[CSVoiceTriggerSecondPass _setAsset:]";
    v100 = 2114;
    v101 = (unint64_t)v38;
    v102 = 1026;
    *(_DWORD *)v103 = shouldUsePHS;
    *(_WORD *)&v103[4] = 1026;
    *(_DWORD *)&v103[6] = 0;
    _os_log_impl(&dword_1C2614000, v37, OS_LOG_TYPE_DEFAULT, "%s CSVoiceTriggerSecondPass[%{public}@]:Not creating SAT objects: usePHS %{public}d, shouldSkipRegularPHS %{public}d", buf, 0x22u);

  }
LABEL_21:
  -[CSVoiceTriggerSecondPass _reset](self, "_reset");
  -[CSVoiceTriggerSecondPass _unmapForPrewarmLoadedGraph](self, "_unmapForPrewarmLoadedGraph");
  -[CSVoiceTriggerSecondPass _mmapModelForPreWarm](self, "_mmapModelForPreWarm");
LABEL_23:

}

- (void)_initializeMediaPlayingState
{
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[5];
  _QWORD v7[5];

  +[CSMediaPlayingMonitor sharedInstance](CSMediaPlayingMonitor, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:", self);
  objc_msgSend(v3, "initializeMediaPlayingState");
  v4 = MEMORY[0x1E0C809B0];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __56__CSVoiceTriggerSecondPass__initializeMediaPlayingState__block_invoke;
  v7[3] = &unk_1E7C26FD8;
  v7[4] = self;
  objc_msgSend(v3, "mediaPlayingStateWithCompletion:", v7);
  objc_msgSend(MEMORY[0x1E0D192B0], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:", self);
  v6[0] = v4;
  v6[1] = 3221225472;
  v6[2] = __56__CSVoiceTriggerSecondPass__initializeMediaPlayingState__block_invoke_3;
  v6[3] = &unk_1E7C23988;
  v6[4] = self;
  objc_msgSend(v5, "musicVolumeWithCompletion:", v6);

}

- (void)_clearTriggerCandidate
{
  void *v3;
  NSObject *v4;
  void *v5;
  int v6;
  const char *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = (void *)*MEMORY[0x1E0D18F58];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    -[CSVoiceTriggerSecondPass UUID](self, "UUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 136315394;
    v7 = "-[CSVoiceTriggerSecondPass _clearTriggerCandidate]";
    v8 = 2114;
    v9 = v5;
    _os_log_impl(&dword_1C2614000, v4, OS_LOG_TYPE_DEFAULT, "%s CSVoiceTriggerSecondPass[%{public}@]:Clearing VoiceTrigger candidate in the second pass", (uint8_t *)&v6, 0x16u);

  }
  self->_hasTriggerCandidate = 0;
}

- (void)_requestStartAudioStreamWitContext:(id)a3 audioProviderUUID:(id)a4 startStreamOption:(id)a5 completion:(id)a6
{
  id v10;
  void (**v11)(_QWORD, _QWORD, _QWORD);
  void *v12;
  CSSpeechManager *speechManager;
  void *v14;
  CSSpeechManager *v15;
  void *v16;
  id *v17;
  NSObject *v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  id v26;
  objc_class *v27;
  void *v28;
  void *v29;
  id v30;
  NSObject *v31;
  NSObject *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  id v40;
  void *v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  _QWORD v47[5];
  void (**v48)(_QWORD, _QWORD, _QWORD);
  id v49;
  id v50;
  id v51;
  _QWORD v52[4];
  id v53;
  id v54;
  id location;
  uint8_t buf[4];
  const char *v57;
  __int16 v58;
  id v59;
  __int16 v60;
  id v61;
  __int16 v62;
  void *v63;
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v46 = a3;
  v45 = a4;
  v43 = a5;
  v10 = a6;
  objc_initWeak(&location, self);
  v52[0] = MEMORY[0x1E0C809B0];
  v52[1] = 3221225472;
  v52[2] = __110__CSVoiceTriggerSecondPass__requestStartAudioStreamWitContext_audioProviderUUID_startStreamOption_completion___block_invoke;
  v52[3] = &unk_1E7C24680;
  objc_copyWeak(&v54, &location);
  v42 = v10;
  v53 = v42;
  v11 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1C3BC4734](v52);
  -[CSVoiceTriggerSecondPass _voiceTriggerSecondPassLatencyMetrics](self, "_voiceTriggerSecondPassLatencyMetrics");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setSecondPassAudioStreamStartTime:", mach_absolute_time());

  speechManager = self->_speechManager;
  if (speechManager)
  {
    -[CSSpeechManager audioProviderWithUUID:](speechManager, "audioProviderWithUUID:", v45);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v14)
    {
      v15 = self->_speechManager;
      v51 = 0;
      -[CSSpeechManager audioProviderWithContext:error:](v15, "audioProviderWithContext:error:", v46, &v51);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = v51;
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  +[CSSpeechManager sharedManagerForCoreSpeechDaemon](CSSpeechManager, "sharedManagerForCoreSpeechDaemon");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "audioProviderWithUUID:", v45);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
LABEL_5:
    v44 = 0;
    goto LABEL_6;
  }
  +[CSSpeechManager sharedManagerForCoreSpeechDaemon](CSSpeechManager, "sharedManagerForCoreSpeechDaemon");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = 0;
  objc_msgSend(v37, "audioProviderWithContext:error:", v46, &v50);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = v50;

LABEL_6:
  v17 = (id *)MEMORY[0x1E0D18F58];
  v18 = (id)*MEMORY[0x1E0D18F58];
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    -[CSVoiceTriggerSecondPass UUID](self, "UUID");
    v19 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "deviceId");
    v20 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "UUID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315906;
    v57 = "-[CSVoiceTriggerSecondPass _requestStartAudioStreamWitContext:audioProviderUUID:startStreamOption:completion:]";
    v58 = 2114;
    v59 = v19;
    v60 = 2112;
    v61 = v20;
    v62 = 2112;
    v63 = v21;
    _os_log_impl(&dword_1C2614000, v18, OS_LOG_TYPE_DEFAULT, "%s CSVoiceTriggerSecondPass[%{public}@]:DeviceID : %@, audioProviderUUID : %@", buf, 0x2Au);

  }
  objc_msgSend(v14, "UUID");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSVoiceTriggerSecondPass setAudioProviderUUID:](self, "setAudioProviderUUID:", v22);

  v23 = *v17;
  v24 = v23;
  if (v14)
  {
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      -[CSVoiceTriggerSecondPass UUID](self, "UUID");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v57 = "-[CSVoiceTriggerSecondPass _requestStartAudioStreamWitContext:audioProviderUUID:startStreamOption:completion:]";
      v58 = 2114;
      v59 = v25;
      _os_log_impl(&dword_1C2614000, v24, OS_LOG_TYPE_DEFAULT, "%s CSVoiceTriggerSecondPass[%{public}@]:Start audio stream with request", buf, 0x16u);

    }
    if (objc_msgSend(v46, "isBuiltInVoiceTriggered"))
    {
      v26 = objc_alloc_init(MEMORY[0x1E0D19058]);
      objc_msgSend(v26, "setClientIdentity:", 2);
      if (-[CSVoiceTriggerSecondPass _isFirstPassSourceExclave:](self, "_isFirstPassSourceExclave:", self->_firstPassSource))
      {
        objc_msgSend(v26, "setRequestExclaveAudio:", 1);
      }
    }
    else
    {
      v26 = 0;
    }
    v27 = (objc_class *)objc_opt_class();
    NSStringFromClass(v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = 0;
    objc_msgSend(v14, "audioStreamWithRequest:streamName:error:", v26, v28, &v49);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v49;

    v31 = *v17;
    v32 = v31;
    if (v29)
    {
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        -[CSVoiceTriggerSecondPass UUID](self, "UUID");
        v33 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "name");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315650;
        v57 = "-[CSVoiceTriggerSecondPass _requestStartAudioStreamWitContext:audioProviderUUID:startStreamOption:completion:]";
        v58 = 2114;
        v59 = v33;
        v60 = 2114;
        v61 = v34;
        _os_log_impl(&dword_1C2614000, v32, OS_LOG_TYPE_DEFAULT, "%s CSVoiceTriggerSecondPass[%{public}@]:Has received audio stream : %{public}@", buf, 0x20u);

      }
      -[CSVoiceTriggerSecondPass setAudioStream:](self, "setAudioStream:", v29);
      -[CSVoiceTriggerSecondPass audioStream](self, "audioStream");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "setDelegate:", self);

      -[CSVoiceTriggerSecondPass _prepareStartAudioStream](self, "_prepareStartAudioStream");
      -[CSVoiceTriggerSecondPass audioStream](self, "audioStream");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v47[0] = MEMORY[0x1E0C809B0];
      v47[1] = 3221225472;
      v47[2] = __110__CSVoiceTriggerSecondPass__requestStartAudioStreamWitContext_audioProviderUUID_startStreamOption_completion___block_invoke_60;
      v47[3] = &unk_1E7C29128;
      v47[4] = self;
      v48 = v11;
      objc_msgSend(v36, "startAudioStreamWithOption:completion:", v43, v47);

    }
    else
    {
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        -[CSVoiceTriggerSecondPass UUID](self, "UUID");
        v40 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "localizedDescription");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315650;
        v57 = "-[CSVoiceTriggerSecondPass _requestStartAudioStreamWitContext:audioProviderUUID:startStreamOption:completion:]";
        v58 = 2114;
        v59 = v40;
        v60 = 2114;
        v61 = v41;
        _os_log_error_impl(&dword_1C2614000, v32, OS_LOG_TYPE_ERROR, "%s CSVoiceTriggerSecondPass[%{public}@]:Failed to get audio stream : %{public}@", buf, 0x20u);

      }
      ((void (**)(_QWORD, _QWORD, id))v11)[2](v11, 0, v30);
    }

  }
  else
  {
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      -[CSVoiceTriggerSecondPass UUID](self, "UUID");
      v38 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "localizedDescription");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v57 = "-[CSVoiceTriggerSecondPass _requestStartAudioStreamWitContext:audioProviderUUID:startStreamOption:completion:]";
      v58 = 2114;
      v59 = v38;
      v60 = 2114;
      v61 = v39;
      _os_log_error_impl(&dword_1C2614000, v24, OS_LOG_TYPE_ERROR, "%s CSVoiceTriggerSecondPass[%{public}@]:Getting audio stream provider has failed : %{public}@", buf, 0x20u);

    }
    ((void (**)(_QWORD, _QWORD, id))v11)[2](v11, 0, v44);
  }

  objc_destroyWeak(&v54);
  objc_destroyWeak(&location);

}

- (void)_handleVoiceTriggerFirstPassFromExclave:(id)a3 audioProviderUUID:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  unint64_t firstPassSource;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  unint64_t activeChannel;
  double v18;
  unint64_t analyzerPrependingSamples;
  unint64_t firstPassTriggerStartSampleCount;
  BOOL v21;
  unint64_t v22;
  unint64_t v23;
  void *v24;
  unint64_t secondPassTimeout;
  float v26;
  float v27;
  float v28;
  void *v29;
  float v30;
  float v31;
  float v32;
  void *v33;
  NSObject *v34;
  void *v35;
  unint64_t v36;
  float v37;
  CSVoiceTriggerSecondPassResultHolder *v38;
  id v39;
  void *v40;
  void *v41;
  NSObject *v42;
  void *v43;
  unint64_t v44;
  float v45;
  NSObject *v46;
  void *v47;
  unint64_t v48;
  _QWORD v49[4];
  id v50;
  _QWORD v51[6];
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t v55;
  _BYTE buf[24];
  double v57;
  __int16 v58;
  double v59;
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  self->_activeChannel = 0;
  objc_msgSend(MEMORY[0x1E0D19030], "noAlertOption");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  firstPassSource = self->_firstPassSource;
  if (firstPassSource - 13 < 2)
    goto LABEL_4;
  if (firstPassSource == 12)
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    v57 = 0.0;
    v52 = 0;
    v53 = &v52;
    v54 = 0x2020000000;
    v55 = 0;
    v51[0] = MEMORY[0x1E0C809B0];
    v51[1] = 3221225472;
    v51[2] = __97__CSVoiceTriggerSecondPass__handleVoiceTriggerFirstPassFromExclave_audioProviderUUID_completion___block_invoke;
    v51[3] = &unk_1E7C239B0;
    v51[4] = buf;
    v51[5] = &v52;
    -[CSVoiceTriggerSecondPass _calculateRecordingTimeForAOPTriggerFromFirstPassInfo:completion:](self, "_calculateRecordingTimeForAOPTriggerFromFirstPassInfo:completion:", v8, v51);
    self->_secondPassTimeout = v53[3];
    objc_msgSend(v11, "setRequestHistoricalAudioDataWithHostTime:", 1);
    objc_msgSend(v11, "setStartRecordingHostTime:", *(_QWORD *)(*(_QWORD *)&buf[8] + 24));
    _Block_object_dispose(&v52, 8);
    _Block_object_dispose(buf, 8);
LABEL_11:
    secondPassTimeout = self->_secondPassTimeout;
    objc_msgSend(MEMORY[0x1E0D19090], "inputRecordingDurationInSecs");
    v27 = v26;
    objc_msgSend(MEMORY[0x1E0D19090], "inputRecordingSampleRate");
    if ((float)(v27 * v28) < (float)secondPassTimeout)
    {
      v29 = (void *)*MEMORY[0x1E0D18F58];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_ERROR))
      {
        v42 = v29;
        -[CSVoiceTriggerSecondPass UUID](self, "UUID");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = self->_secondPassTimeout;
        objc_msgSend(MEMORY[0x1E0D19090], "inputRecordingSampleRate");
        *(_DWORD *)buf = 136315650;
        *(_QWORD *)&buf[4] = "-[CSVoiceTriggerSecondPass _handleVoiceTriggerFirstPassFromExclave:audioProviderUUID:completion:]";
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v43;
        *(_WORD *)&buf[22] = 2050;
        v57 = (float)((float)v44 / v45);
        _os_log_error_impl(&dword_1C2614000, v42, OS_LOG_TYPE_ERROR, "%s CSVoiceTriggerSecondPass[%{public}@]:Second pass timeout (%{public}.2fs) should not exceed the ring buffer size, set to ring buffer size", buf, 0x20u);

      }
      objc_msgSend(MEMORY[0x1E0D19090], "inputRecordingDurationInSecs");
      v31 = v30;
      objc_msgSend(MEMORY[0x1E0D19090], "inputRecordingSampleRate");
      self->_secondPassTimeout = (unint64_t)(float)(v31 * v32);
    }
    v33 = (void *)*MEMORY[0x1E0D18F58];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT))
    {
      v34 = v33;
      -[CSVoiceTriggerSecondPass UUID](self, "UUID");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = self->_secondPassTimeout;
      objc_msgSend(MEMORY[0x1E0D19090], "inputRecordingSampleRate");
      *(_DWORD *)buf = 136315906;
      *(_QWORD *)&buf[4] = "-[CSVoiceTriggerSecondPass _handleVoiceTriggerFirstPassFromExclave:audioProviderUUID:completion:]";
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v35;
      *(_WORD *)&buf[22] = 2050;
      v57 = *(double *)&v36;
      v58 = 2050;
      v59 = (float)((float)v36 / v37);
      _os_log_impl(&dword_1C2614000, v34, OS_LOG_TYPE_DEFAULT, "%s CSVoiceTriggerSecondPass[%{public}@]:Second pass set to analyze %{public}tu samples (%{public}.2fs)", buf, 0x2Au);

    }
    -[CSExclaveRecordClient startSecondPassVoiceTriggerWithFirstPassSource:enablePHS:supportMultiPhrase:](self->_exclaveClient, "startSecondPassVoiceTriggerWithFirstPassSource:enablePHS:supportMultiPhrase:", self->_firstPassSource, self->_shouldUsePHS, self->_supportsMph);
    objc_msgSend(MEMORY[0x1E0D19008], "contextForBuiltInVoiceTrigger");
    v38 = (CSVoiceTriggerSecondPassResultHolder *)objc_claimAutoreleasedReturnValue();
    v49[0] = MEMORY[0x1E0C809B0];
    v49[1] = 3221225472;
    v49[2] = __97__CSVoiceTriggerSecondPass__handleVoiceTriggerFirstPassFromExclave_audioProviderUUID_completion___block_invoke_66;
    v49[3] = &unk_1E7C290D8;
    v39 = v10;
    v50 = v39;
    -[CSVoiceTriggerSecondPass _requestStartAudioStreamWitContext:audioProviderUUID:startStreamOption:completion:](self, "_requestStartAudioStreamWitContext:audioProviderUUID:startStreamOption:completion:", v38, v9, v11, v49);
    -[CSVoiceTriggerSecondPass setResultCompletion:](self, "setResultCompletion:", v39);
    v40 = v50;
    goto LABEL_18;
  }
  if (firstPassSource == 11)
  {
LABEL_4:
    objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D19658]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    self->_firstPassTriggerStartSampleCount = objc_msgSend(v13, "unsignedIntegerValue");

    v14 = (void *)*MEMORY[0x1E0D18F58];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT))
    {
      v15 = v14;
      -[CSVoiceTriggerSecondPass UUID](self, "UUID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      activeChannel = self->_activeChannel;
      v18 = *(double *)&self->_firstPassTriggerStartSampleCount;
      *(_DWORD *)buf = 136315906;
      *(_QWORD *)&buf[4] = "-[CSVoiceTriggerSecondPass _handleVoiceTriggerFirstPassFromExclave:audioProviderUUID:completion:]";
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v16;
      *(_WORD *)&buf[22] = 2050;
      v57 = *(double *)&activeChannel;
      v58 = 2050;
      v59 = v18;
      _os_log_impl(&dword_1C2614000, v15, OS_LOG_TYPE_DEFAULT, "%s CSVoiceTriggerSecondPass[%{public}@]:Received first pass triggered in channel: %{public}tu with trigger start: %{public}tu", buf, 0x2Au);

    }
    analyzerPrependingSamples = self->_analyzerPrependingSamples;
    firstPassTriggerStartSampleCount = self->_firstPassTriggerStartSampleCount;
    v21 = firstPassTriggerStartSampleCount >= analyzerPrependingSamples;
    v22 = firstPassTriggerStartSampleCount - analyzerPrependingSamples;
    if (v21)
      v23 = v22;
    else
      v23 = 0;
    objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D19628]);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    self->_firstPassTriggerFireSampleCount = objc_msgSend(v24, "unsignedIntegerValue");

    self->_secondPassTimeout = self->_firstPassTriggerFireSampleCount - v23 + self->_analyzerTrailingSamples;
    objc_msgSend(v11, "setRequestHistoricalAudioDataSampleCount:", 1);
    objc_msgSend(v11, "setStartRecordingSampleCount:", v23);
    goto LABEL_11;
  }
  v41 = (void *)*MEMORY[0x1E0D18F58];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_ERROR))
  {
    v46 = v41;
    -[CSVoiceTriggerSecondPass UUID](self, "UUID");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = self->_firstPassSource;
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = "-[CSVoiceTriggerSecondPass _handleVoiceTriggerFirstPassFromExclave:audioProviderUUID:completion:]";
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v47;
    *(_WORD *)&buf[22] = 2050;
    v57 = *(double *)&v48;
    _os_log_error_impl(&dword_1C2614000, v46, OS_LOG_TYPE_ERROR, "%s CSVoiceTriggerSecondPass[%{public}@]:Not valid firstPass source for Exclave : %{public}lu", buf, 0x20u);

  }
  if (v10)
  {
    v38 = -[CSVoiceTriggerSecondPassResultHolder initWithResult:voiceTriggerEventInfo:isSecondChanceCandidate:]([CSVoiceTriggerSecondPassResultHolder alloc], "initWithResult:voiceTriggerEventInfo:isSecondChanceCandidate:", 4, 0, 0);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18E80], 114, 0);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, CSVoiceTriggerSecondPassResultHolder *, void *))v10 + 2))(v10, v38, v40);
LABEL_18:

  }
}

- (void)_handleVoiceTriggerFirstPassFromAP:(id)a3 audioProviderUUID:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  void *v12;
  unint64_t selectedChannelFromFirstPass;
  NSDictionary *v14;
  NSDictionary *firstPassChannelSelectionScores;
  void *v16;
  float v17;
  void *v18;
  float v19;
  void *v20;
  float v21;
  void *v22;
  void *v23;
  os_log_t *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  unint64_t activeChannel;
  unint64_t firstPassTriggerStartSampleCount;
  unint64_t analyzerPrependingSamples;
  unint64_t v31;
  BOOL v32;
  unint64_t v33;
  unint64_t v34;
  void *v35;
  unint64_t v36;
  float v37;
  float v38;
  float v39;
  os_log_t v40;
  float v41;
  float v42;
  float v43;
  os_log_t v44;
  NSObject *v45;
  id v46;
  id v47;
  void *v48;
  unint64_t v49;
  float v50;
  void *v51;
  void *v52;
  id v53;
  NSObject *v54;
  void *v55;
  float secondPassTimeout;
  float v57;
  unint64_t v58;
  _QWORD v59[4];
  id v60;
  uint8_t buf[4];
  const char *v62;
  __int16 v63;
  void *v64;
  __int16 v65;
  double v66;
  __int16 v67;
  double v68;
  __int16 v69;
  unint64_t v70;
  __int16 v71;
  unint64_t v72;
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = *MEMORY[0x1E0D19618];
  v11 = a4;
  objc_msgSend(v8, "objectForKeyedSubscript:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  self->_selectedChannelFromFirstPass = objc_msgSend(v12, "unsignedIntegerValue");

  if (-[CSVoiceTriggerSecondPass _shouldRequestSingleChannelFromAudioProvider](self, "_shouldRequestSingleChannelFromAudioProvider"))
  {
    selectedChannelFromFirstPass = 0;
  }
  else
  {
    selectedChannelFromFirstPass = self->_selectedChannelFromFirstPass;
  }
  self->_activeChannel = selectedChannelFromFirstPass;
  -[CSPhraseDetector setActiveChannel:](self->_phraseDetector, "setActiveChannel:");
  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D19610]);
  v14 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  firstPassChannelSelectionScores = self->_firstPassChannelSelectionScores;
  self->_firstPassChannelSelectionScores = v14;

  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D19608]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "floatValue");
  self->_firstPassChannelSelectionDelaySeconds = v17;

  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D19630]);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "floatValue");
  self->_firstPassMasterChannelScoreBoost = v19;

  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D19640]);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "floatValue");
  self->_firstPassOnsetScore = v21;

  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D19638]);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  self->_firstPassOnsetChannel = objc_msgSend(v22, "unsignedIntegerValue");

  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D19658]);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  self->_firstPassTriggerStartSampleCount = objc_msgSend(v23, "unsignedIntegerValue");

  v24 = (os_log_t *)MEMORY[0x1E0D18F58];
  v25 = (void *)*MEMORY[0x1E0D18F58];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT))
  {
    v26 = v25;
    -[CSVoiceTriggerSecondPass UUID](self, "UUID");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    activeChannel = self->_activeChannel;
    firstPassTriggerStartSampleCount = self->_firstPassTriggerStartSampleCount;
    *(_DWORD *)buf = 136315906;
    v62 = "-[CSVoiceTriggerSecondPass _handleVoiceTriggerFirstPassFromAP:audioProviderUUID:completion:]";
    v63 = 2114;
    v64 = v27;
    v65 = 2050;
    v66 = *(double *)&activeChannel;
    v67 = 2050;
    v68 = *(double *)&firstPassTriggerStartSampleCount;
    _os_log_impl(&dword_1C2614000, v26, OS_LOG_TYPE_DEFAULT, "%s CSVoiceTriggerSecondPass[%{public}@]:Received first pass triggered in channel: %{public}tu with trigger start: %{public}tu", buf, 0x2Au);

  }
  analyzerPrependingSamples = self->_analyzerPrependingSamples;
  v31 = self->_firstPassTriggerStartSampleCount;
  v32 = v31 >= analyzerPrependingSamples;
  v33 = v31 - analyzerPrependingSamples;
  if (v32)
    v34 = v33;
  else
    v34 = 0;
  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D19628]);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  self->_firstPassTriggerFireSampleCount = objc_msgSend(v35, "unsignedIntegerValue");

  v36 = self->_analyzerTrailingSamples + self->_firstPassTriggerFireSampleCount;
  v58 = v34;
  self->_secondPassTimeout = v36 - v34;
  objc_msgSend(MEMORY[0x1E0D19090], "inputRecordingDurationInSecs");
  v38 = v37;
  objc_msgSend(MEMORY[0x1E0D19090], "inputRecordingSampleRate");
  if ((float)(v38 * v39) < (float)(v36 - v34))
  {
    v40 = *v24;
    if (os_log_type_enabled(*v24, OS_LOG_TYPE_ERROR))
    {
      v54 = v40;
      -[CSVoiceTriggerSecondPass UUID](self, "UUID");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      secondPassTimeout = (float)self->_secondPassTimeout;
      objc_msgSend(MEMORY[0x1E0D19090], "inputRecordingSampleRate");
      *(_DWORD *)buf = 136315650;
      v62 = "-[CSVoiceTriggerSecondPass _handleVoiceTriggerFirstPassFromAP:audioProviderUUID:completion:]";
      v63 = 2114;
      v64 = v55;
      v65 = 2050;
      v66 = (float)(secondPassTimeout / v57);
      _os_log_error_impl(&dword_1C2614000, v54, OS_LOG_TYPE_ERROR, "%s CSVoiceTriggerSecondPass[%{public}@]:Second pass timeout (%{public}.2fs) should not exceed the ring buffer size, set to ring buffer size", buf, 0x20u);

    }
    objc_msgSend(MEMORY[0x1E0D19090], "inputRecordingDurationInSecs");
    v42 = v41;
    objc_msgSend(MEMORY[0x1E0D19090], "inputRecordingSampleRate");
    self->_secondPassTimeout = (unint64_t)(float)(v42 * v43);
  }
  v44 = *v24;
  if (os_log_type_enabled(*v24, OS_LOG_TYPE_DEFAULT))
  {
    v45 = v44;
    -[CSVoiceTriggerSecondPass UUID](self, "UUID");
    v46 = v9;
    v47 = v11;
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = self->_secondPassTimeout;
    objc_msgSend(MEMORY[0x1E0D19090], "inputRecordingSampleRate");
    *(_DWORD *)buf = 136316418;
    v62 = "-[CSVoiceTriggerSecondPass _handleVoiceTriggerFirstPassFromAP:audioProviderUUID:completion:]";
    v63 = 2114;
    v64 = v48;
    v65 = 2050;
    v66 = *(double *)&v49;
    v67 = 2050;
    v68 = (float)((float)v49 / v50);
    v69 = 2050;
    v70 = v58;
    v71 = 2050;
    v72 = v36;
    _os_log_impl(&dword_1C2614000, v45, OS_LOG_TYPE_DEFAULT, "%s CSVoiceTriggerSecondPass[%{public}@]:Second pass set to analyze %{public}tu samples (%{public}.2fs) from %{public}tu to %{public}tu", buf, 0x3Eu);

    v11 = v47;
    v9 = v46;

  }
  objc_msgSend(MEMORY[0x1E0D19008], "contextForBuiltInVoiceTrigger");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D19030], "noAlertOption");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CSVoiceTriggerSecondPass _shouldRequestSingleChannelFromAudioProvider](self, "_shouldRequestSingleChannelFromAudioProvider"))
  {
    objc_msgSend(v52, "setRequireSingleChannelLookup:", 1);
    objc_msgSend(v52, "setSelectedChannel:", LODWORD(self->_selectedChannelFromFirstPass));
  }
  objc_msgSend(v52, "setRequestHistoricalAudioDataSampleCount:", 1);
  objc_msgSend(v52, "setStartRecordingSampleCount:", v58);
  v59[0] = MEMORY[0x1E0C809B0];
  v59[1] = 3221225472;
  v59[2] = __92__CSVoiceTriggerSecondPass__handleVoiceTriggerFirstPassFromAP_audioProviderUUID_completion___block_invoke;
  v59[3] = &unk_1E7C290D8;
  v60 = v9;
  v53 = v9;
  -[CSVoiceTriggerSecondPass _requestStartAudioStreamWitContext:audioProviderUUID:startStreamOption:completion:](self, "_requestStartAudioStreamWitContext:audioProviderUUID:startStreamOption:completion:", v51, v11, v52, v59);

  -[CSVoiceTriggerSecondPass setResultCompletion:](self, "setResultCompletion:", v53);
}

- (void)_handleVoiceTriggerFirstPassFromHearst:(unint64_t)a3 deviceId:(id)a4 audioProviderUUID:(id)a5 firstPassInfo:(id)a6 rtModelRequestOptions:(id)a7 completion:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  float v19;
  void *v20;
  NSObject *v21;
  void *v22;
  unint64_t secondPassTimeout;
  CSPhraseNDEAPIScorer *v24;
  CSAsset *currentAsset;
  CSVoiceTriggerSecondPassConfig *config;
  unint64_t firstPassSource;
  unint64_t activeChannel;
  void *v29;
  CSPhraseNDEAPIScorer *v30;
  CSPhraseNDEAPIScorer *phraseNDEAPIScorer;
  CSVoiceTriggerSecondPassResultHolder *v32;
  void *v33;
  id v34;
  void *v35;
  NSObject *v36;
  void *v37;
  id v38;
  id v39;
  _QWORD v40[4];
  id v41;
  uint8_t buf[4];
  const char *v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  int v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  if (a3 == 3)
  {
    v38 = v16;
    v39 = v14;
    self->_activeChannel = 0;
    -[CSPhraseDetector setActiveChannel:](self->_phraseDetector, "setActiveChannel:", 0);
    objc_msgSend(MEMORY[0x1E0D19090], "inputRecordingSampleRate");
    self->_secondPassTimeout = (unint64_t)(float)(v19 + v19);
    v20 = (void *)*MEMORY[0x1E0D18F58];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT))
    {
      v21 = v20;
      -[CSVoiceTriggerSecondPass UUID](self, "UUID");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      secondPassTimeout = self->_secondPassTimeout;
      *(_DWORD *)buf = 136315650;
      v43 = "-[CSVoiceTriggerSecondPass _handleVoiceTriggerFirstPassFromHearst:deviceId:audioProviderUUID:firstPassInfo:r"
            "tModelRequestOptions:completion:]";
      v44 = 2114;
      v45 = v22;
      v46 = 1026;
      v47 = secondPassTimeout;
      _os_log_impl(&dword_1C2614000, v21, OS_LOG_TYPE_DEFAULT, "%s CSVoiceTriggerSecondPass[%{public}@]:Setting second pass timeout for hearst : %{public}d", buf, 0x1Cu);

    }
    v24 = [CSPhraseNDEAPIScorer alloc];
    currentAsset = self->_currentAsset;
    config = self->_config;
    firstPassSource = self->_firstPassSource;
    activeChannel = self->_activeChannel;
    -[CSVoiceTriggerSecondPass _fetchSiriLocale](self, "_fetchSiriLocale");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = -[CSPhraseNDEAPIScorer initWithAsset:assetConfig:firstPassSource:activeChannel:siriLanguage:shouldEnableShadowMicScore:rtmodelRequestOptions:](v24, "initWithAsset:assetConfig:firstPassSource:activeChannel:siriLanguage:shouldEnableShadowMicScore:rtmodelRequestOptions:", currentAsset, config, firstPassSource, activeChannel, v29, 1, v17);
    phraseNDEAPIScorer = self->_phraseNDEAPIScorer;
    self->_phraseNDEAPIScorer = v30;

    -[CSPhraseNDEAPIScorer setDelegate:](self->_phraseNDEAPIScorer, "setDelegate:", self);
    v14 = v39;
    objc_msgSend(MEMORY[0x1E0D19008], "contextForHearstVoiceTriggerWithDeviceId:", v39);
    v32 = (CSVoiceTriggerSecondPassResultHolder *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D19030], "noAlertOption");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setDisableBoostForDoAP:", 1);
    objc_msgSend(v33, "setRequestHistoricalAudioDataSampleCount:", 1);
    objc_msgSend(v33, "setStartRecordingSampleCount:", 0);
    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v40[2] = __141__CSVoiceTriggerSecondPass__handleVoiceTriggerFirstPassFromHearst_deviceId_audioProviderUUID_firstPassInfo_rtModelRequestOptions_completion___block_invoke;
    v40[3] = &unk_1E7C290D8;
    v34 = v18;
    v41 = v34;
    -[CSVoiceTriggerSecondPass _requestStartAudioStreamWitContext:audioProviderUUID:startStreamOption:completion:](self, "_requestStartAudioStreamWitContext:audioProviderUUID:startStreamOption:completion:", v32, v15, v33, v40);
    -[CSVoiceTriggerSecondPass setResultCompletion:](self, "setResultCompletion:", v34);

    v16 = v38;
    goto LABEL_8;
  }
  v35 = (void *)*MEMORY[0x1E0D18F58];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_ERROR))
  {
    v36 = v35;
    -[CSVoiceTriggerSecondPass UUID](self, "UUID");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v43 = "-[CSVoiceTriggerSecondPass _handleVoiceTriggerFirstPassFromHearst:deviceId:audioProviderUUID:firstPassInfo:rtM"
          "odelRequestOptions:completion:]";
    v44 = 2114;
    v45 = v37;
    _os_log_error_impl(&dword_1C2614000, v36, OS_LOG_TYPE_ERROR, "%s CSVoiceTriggerSecondPass[%{public}@]:Expecting first pass source as Hearst", buf, 0x16u);

    if (!v18)
      goto LABEL_9;
    goto LABEL_7;
  }
  if (v18)
  {
LABEL_7:
    v32 = -[CSVoiceTriggerSecondPassResultHolder initWithResult:voiceTriggerEventInfo:isSecondChanceCandidate:]([CSVoiceTriggerSecondPassResultHolder alloc], "initWithResult:voiceTriggerEventInfo:isSecondChanceCandidate:", 4, 0, 0);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18E80], 114, 0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, CSVoiceTriggerSecondPassResultHolder *, void *))v18 + 2))(v18, v32, v33);
LABEL_8:

  }
LABEL_9:

}

- (void)_handleVoiceTriggerFirstPassFromRemora:(unint64_t)a3 deviceId:(id)a4 audioProviderUUID:(id)a5 firstPassInfo:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  os_log_t *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  unint64_t activeChannel;
  unint64_t firstPassTriggerStartSampleCount;
  unint64_t analyzerPrependingSamples;
  unint64_t v24;
  BOOL v25;
  unint64_t v26;
  unint64_t v27;
  void *v28;
  unint64_t v29;
  float v30;
  float v31;
  float v32;
  os_log_t v33;
  float v34;
  float v35;
  float v36;
  os_log_t v37;
  NSObject *v38;
  void *v39;
  id v40;
  id v41;
  unint64_t v42;
  float v43;
  float v44;
  CSVoiceTriggerSecondPassResultHolder *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  unsigned int v50;
  float v51;
  float v52;
  uint64_t v53;
  double v54;
  uint64_t v55;
  NSObject *v56;
  id v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  void *v62;
  void *v63;
  int v64;
  void *v65;
  int v66;
  float v67;
  double v68;
  NSObject *v69;
  void *v70;
  NSObject *v71;
  void *v72;
  float secondPassTimeout;
  float v74;
  uint64_t v75;
  id v76;
  _QWORD v77[4];
  id v78;
  uint8_t buf[4];
  const char *v80;
  __int16 v81;
  uint64_t v82;
  __int16 v83;
  double v84;
  __int16 v85;
  double v86;
  __int16 v87;
  unint64_t v88;
  __int16 v89;
  unint64_t v90;
  uint64_t v91;

  v91 = *MEMORY[0x1E0C80C00];
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  if (a3 == 7)
  {
    self->_activeChannel = 0;
    -[CSPhraseDetector setActiveChannel:](self->_phraseDetector, "setActiveChannel:", 0);
    v75 = *MEMORY[0x1E0D19658];
    objc_msgSend(v14, "objectForKeyedSubscript:");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    self->_firstPassTriggerStartSampleCount = objc_msgSend(v16, "unsignedIntegerValue");

    v17 = (os_log_t *)MEMORY[0x1E0D18F58];
    v18 = (void *)*MEMORY[0x1E0D18F58];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT))
    {
      v19 = v18;
      -[CSVoiceTriggerSecondPass UUID](self, "UUID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      activeChannel = self->_activeChannel;
      firstPassTriggerStartSampleCount = self->_firstPassTriggerStartSampleCount;
      *(_DWORD *)buf = 136315906;
      v80 = "-[CSVoiceTriggerSecondPass _handleVoiceTriggerFirstPassFromRemora:deviceId:audioProviderUUID:firstPassInfo:completion:]";
      v81 = 2114;
      v82 = (uint64_t)v20;
      v83 = 2050;
      v84 = *(double *)&activeChannel;
      v85 = 2050;
      v86 = *(double *)&firstPassTriggerStartSampleCount;
      _os_log_impl(&dword_1C2614000, v19, OS_LOG_TYPE_DEFAULT, "%s CSVoiceTriggerSecondPass[%{public}@]:Received first pass triggered in channel: %{public}tu with trigger start: %{public}tu", buf, 0x2Au);

    }
    analyzerPrependingSamples = self->_analyzerPrependingSamples;
    v24 = self->_firstPassTriggerStartSampleCount;
    v25 = v24 >= analyzerPrependingSamples;
    v26 = v24 - analyzerPrependingSamples;
    if (v25)
      v27 = v26;
    else
      v27 = 0;
    objc_msgSend(v14, "objectForKeyedSubscript:", *MEMORY[0x1E0D19620]);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = self->_analyzerTrailingSamples + objc_msgSend(v28, "unsignedIntegerValue");

    self->_secondPassTimeout = v29 - v27;
    objc_msgSend(MEMORY[0x1E0D19090], "inputRecordingDurationInSecs");
    v31 = v30;
    objc_msgSend(MEMORY[0x1E0D19090], "inputRecordingSampleRate");
    if ((float)(v31 * v32) < (float)(v29 - v27))
    {
      v33 = *v17;
      if (os_log_type_enabled(*v17, OS_LOG_TYPE_ERROR))
      {
        v71 = v33;
        -[CSVoiceTriggerSecondPass UUID](self, "UUID");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        secondPassTimeout = (float)self->_secondPassTimeout;
        objc_msgSend(MEMORY[0x1E0D19090], "inputRecordingSampleRate");
        *(_DWORD *)buf = 136315650;
        v80 = "-[CSVoiceTriggerSecondPass _handleVoiceTriggerFirstPassFromRemora:deviceId:audioProviderUUID:firstPassInfo:completion:]";
        v81 = 2114;
        v82 = (uint64_t)v72;
        v83 = 2050;
        v84 = (float)(secondPassTimeout / v74);
        _os_log_error_impl(&dword_1C2614000, v71, OS_LOG_TYPE_ERROR, "%s CSVoiceTriggerSecondPass[%{public}@]:Second pass timeout (%{public}.2fs) should not exceed the ring buffer size, set to ring buffer size", buf, 0x20u);

      }
      objc_msgSend(MEMORY[0x1E0D19090], "inputRecordingDurationInSecs");
      v35 = v34;
      objc_msgSend(MEMORY[0x1E0D19090], "inputRecordingSampleRate");
      self->_secondPassTimeout = (unint64_t)(float)(v35 * v36);
    }
    v37 = *v17;
    if (os_log_type_enabled(*v17, OS_LOG_TYPE_DEFAULT))
    {
      v38 = v37;
      -[CSVoiceTriggerSecondPass UUID](self, "UUID");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = v13;
      v41 = v12;
      v42 = self->_secondPassTimeout;
      v43 = (float)v42;
      objc_msgSend(MEMORY[0x1E0D19090], "inputRecordingSampleRate");
      *(_DWORD *)buf = 136316418;
      v80 = "-[CSVoiceTriggerSecondPass _handleVoiceTriggerFirstPassFromRemora:deviceId:audioProviderUUID:firstPassInfo:completion:]";
      v81 = 2114;
      v82 = (uint64_t)v39;
      v83 = 2050;
      v84 = *(double *)&v42;
      v12 = v41;
      v13 = v40;
      v17 = (os_log_t *)MEMORY[0x1E0D18F58];
      v85 = 2050;
      v86 = (float)(v43 / v44);
      v87 = 2050;
      v88 = v27;
      v89 = 2050;
      v90 = v29;
      _os_log_impl(&dword_1C2614000, v38, OS_LOG_TYPE_DEFAULT, "%s CSVoiceTriggerSecondPass[%{public}@]:Second pass set to analyze %{public}tu samples (%{public}.2fs) from %{public}tu to %{public}tu", buf, 0x3Eu);

    }
    v76 = v12;
    objc_msgSend(MEMORY[0x1E0D19008], "contextForRemoraVoiceTriggerWithDeviceId:", v12);
    v45 = (CSVoiceTriggerSecondPassResultHolder *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D19030], "noAlertOption");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "setRequestHistoricalAudioDataSampleCount:", 1);
    objc_msgSend(v46, "setStartRecordingSampleCount:", 0);
    if (!v14)
      goto LABEL_18;
    v47 = *MEMORY[0x1E0D19648];
    objc_msgSend(v14, "objectForKeyedSubscript:", *MEMORY[0x1E0D19648]);
    v48 = (void *)objc_claimAutoreleasedReturnValue();

    if (v48)
    {
      objc_msgSend(v14, "objectForKeyedSubscript:", v47);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = objc_msgSend(v49, "unsignedIntValue");

      objc_msgSend(MEMORY[0x1E0D19090], "inputRecordingSampleRate");
      v52 = (float)v50 / v51;
      v53 = mach_absolute_time();
      *(float *)&v54 = v52;
      v55 = v53 - objc_msgSend(MEMORY[0x1E0D19118], "secondsToHostTime:", v54);
      v56 = *v17;
      if (os_log_type_enabled(*v17, OS_LOG_TYPE_DEFAULT))
      {
LABEL_16:
        *(_DWORD *)buf = 136315906;
        v80 = "-[CSVoiceTriggerSecondPass _handleVoiceTriggerFirstPassFromRemora:deviceId:audioProviderUUID:firstPassInfo:completion:]";
        v81 = 2048;
        v82 = v53;
        v83 = 2048;
        v84 = v52;
        v85 = 2048;
        v86 = *(double *)&v55;
        _os_log_impl(&dword_1C2614000, v56, OS_LOG_TYPE_DEFAULT, "%s current host:%llu delta:%f estimatedStartHostTime : %llu", buf, 0x2Au);
      }
    }
    else
    {
      v59 = *MEMORY[0x1E0D19700];
      objc_msgSend(v14, "objectForKeyedSubscript:", *MEMORY[0x1E0D19700]);
      v60 = objc_claimAutoreleasedReturnValue();
      if (!v60)
        goto LABEL_18;
      v61 = (void *)v60;
      objc_msgSend(v14, "objectForKeyedSubscript:", v75);
      v62 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v62)
        goto LABEL_18;
      objc_msgSend(v14, "objectForKeyedSubscript:", v59);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      v64 = objc_msgSend(v63, "unsignedIntValue");

      objc_msgSend(v14, "objectForKeyedSubscript:", v75);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      v66 = objc_msgSend(v65, "unsignedIntValue");

      objc_msgSend(MEMORY[0x1E0D19090], "inputRecordingSampleRate");
      v52 = (float)(v64 - v66 + 8000) / v67;
      v53 = mach_absolute_time();
      *(float *)&v68 = v52;
      v55 = v53 - objc_msgSend(MEMORY[0x1E0D19118], "secondsToHostTime:", v68);
      v56 = *v17;
      if (os_log_type_enabled(*v17, OS_LOG_TYPE_DEFAULT))
        goto LABEL_16;
    }
    objc_msgSend(v46, "setEstimatedStartHostTime:", v55);
LABEL_18:
    v77[0] = MEMORY[0x1E0C809B0];
    v77[1] = 3221225472;
    v77[2] = __119__CSVoiceTriggerSecondPass__handleVoiceTriggerFirstPassFromRemora_deviceId_audioProviderUUID_firstPassInfo_completion___block_invoke;
    v77[3] = &unk_1E7C290D8;
    v57 = v15;
    v78 = v57;
    -[CSVoiceTriggerSecondPass _requestStartAudioStreamWitContext:audioProviderUUID:startStreamOption:completion:](self, "_requestStartAudioStreamWitContext:audioProviderUUID:startStreamOption:completion:", v45, v13, v46, v77);
    -[CSVoiceTriggerSecondPass setResultCompletion:](self, "setResultCompletion:", v57);

    v12 = v76;
LABEL_22:

    goto LABEL_23;
  }
  v58 = (void *)*MEMORY[0x1E0D18F58];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_ERROR))
  {
    v69 = v58;
    -[CSVoiceTriggerSecondPass UUID](self, "UUID");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v80 = "-[CSVoiceTriggerSecondPass _handleVoiceTriggerFirstPassFromRemora:deviceId:audioProviderUUID:firstPassInfo:completion:]";
    v81 = 2114;
    v82 = (uint64_t)v70;
    _os_log_error_impl(&dword_1C2614000, v69, OS_LOG_TYPE_ERROR, "%s CSVoiceTriggerSecondPass[%{public}@]:Expecting first pass source as Remora", buf, 0x16u);

    if (!v15)
      goto LABEL_23;
    goto LABEL_21;
  }
  if (v15)
  {
LABEL_21:
    v45 = -[CSVoiceTriggerSecondPassResultHolder initWithResult:voiceTriggerEventInfo:isSecondChanceCandidate:]([CSVoiceTriggerSecondPassResultHolder alloc], "initWithResult:voiceTriggerEventInfo:isSecondChanceCandidate:", 4, 0, 0);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18E80], 114, 0);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, CSVoiceTriggerSecondPassResultHolder *, void *))v15 + 2))(v15, v45, v46);
    goto LABEL_22;
  }
LABEL_23:

}

- (void)_handleVoiceTriggerFirstPassFromHearstAP:(unint64_t)a3 deviceId:(id)a4 audioProviderUUID:(id)a5 firstPassInfo:(id)a6 rtModelRequestOptions:(id)a7 completion:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  float v19;
  void *v20;
  NSObject *v21;
  void *v22;
  unint64_t secondPassTimeout;
  CSPhraseNDEAPIScorer *v24;
  CSAsset *currentAsset;
  CSVoiceTriggerSecondPassConfig *config;
  unint64_t firstPassSource;
  unint64_t activeChannel;
  void *v29;
  CSPhraseNDEAPIScorer *v30;
  CSPhraseNDEAPIScorer *phraseNDEAPIScorer;
  void *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  unint64_t v36;
  unint64_t firstPassTriggerStartSampleCount;
  unint64_t analyzerPrependingSamples;
  unint64_t v39;
  BOOL v40;
  unint64_t v41;
  unint64_t v42;
  CSVoiceTriggerSecondPassResultHolder *v43;
  void *v44;
  void *v45;
  NSObject *v46;
  void *v47;
  id v48;
  id v49;
  _QWORD v50[5];
  id v51;
  uint8_t buf[4];
  const char *v53;
  __int16 v54;
  void *v55;
  __int16 v56;
  unint64_t v57;
  __int16 v58;
  unint64_t v59;
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  if (a3 == 6)
  {
    v48 = v15;
    v49 = v14;
    self->_activeChannel = 0;
    -[CSPhraseDetector setActiveChannel:](self->_phraseDetector, "setActiveChannel:", 0);
    objc_msgSend(MEMORY[0x1E0D19090], "inputRecordingSampleRate");
    self->_secondPassTimeout = (unint64_t)(float)(v19 + v19);
    v20 = (void *)*MEMORY[0x1E0D18F58];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT))
    {
      v21 = v20;
      -[CSVoiceTriggerSecondPass UUID](self, "UUID");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      secondPassTimeout = self->_secondPassTimeout;
      *(_DWORD *)buf = 136315650;
      v53 = "-[CSVoiceTriggerSecondPass _handleVoiceTriggerFirstPassFromHearstAP:deviceId:audioProviderUUID:firstPassInfo"
            ":rtModelRequestOptions:completion:]";
      v54 = 2114;
      v55 = v22;
      v56 = 1026;
      LODWORD(v57) = secondPassTimeout;
      _os_log_impl(&dword_1C2614000, v21, OS_LOG_TYPE_DEFAULT, "%s CSVoiceTriggerSecondPass[%{public}@]:Setting second pass timeout for hearst : %{public}d", buf, 0x1Cu);

    }
    v24 = [CSPhraseNDEAPIScorer alloc];
    currentAsset = self->_currentAsset;
    config = self->_config;
    firstPassSource = self->_firstPassSource;
    activeChannel = self->_activeChannel;
    -[CSVoiceTriggerSecondPass _fetchSiriLocale](self, "_fetchSiriLocale");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = -[CSPhraseNDEAPIScorer initWithAsset:assetConfig:firstPassSource:activeChannel:siriLanguage:shouldEnableShadowMicScore:rtmodelRequestOptions:](v24, "initWithAsset:assetConfig:firstPassSource:activeChannel:siriLanguage:shouldEnableShadowMicScore:rtmodelRequestOptions:", currentAsset, config, firstPassSource, activeChannel, v29, 0, v17);
    phraseNDEAPIScorer = self->_phraseNDEAPIScorer;
    self->_phraseNDEAPIScorer = v30;

    objc_msgSend(v16, "objectForKeyedSubscript:", *MEMORY[0x1E0D19658]);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    self->_firstPassTriggerStartSampleCount = objc_msgSend(v32, "unsignedIntegerValue");

    v33 = (void *)*MEMORY[0x1E0D18F58];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT))
    {
      v34 = v33;
      -[CSVoiceTriggerSecondPass UUID](self, "UUID");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = self->_activeChannel;
      firstPassTriggerStartSampleCount = self->_firstPassTriggerStartSampleCount;
      *(_DWORD *)buf = 136315906;
      v53 = "-[CSVoiceTriggerSecondPass _handleVoiceTriggerFirstPassFromHearstAP:deviceId:audioProviderUUID:firstPassInfo"
            ":rtModelRequestOptions:completion:]";
      v54 = 2114;
      v55 = v35;
      v56 = 2050;
      v57 = v36;
      v58 = 2050;
      v59 = firstPassTriggerStartSampleCount;
      _os_log_impl(&dword_1C2614000, v34, OS_LOG_TYPE_DEFAULT, "%s CSVoiceTriggerSecondPass[%{public}@]:Received first pass triggered in channel: %{public}tu with trigger start: %{public}tu", buf, 0x2Au);

    }
    analyzerPrependingSamples = self->_analyzerPrependingSamples;
    v39 = self->_firstPassTriggerStartSampleCount;
    v40 = v39 >= analyzerPrependingSamples;
    v41 = v39 - analyzerPrependingSamples;
    if (v40)
      v42 = v41;
    else
      v42 = 0;
    v14 = v49;
    objc_msgSend(MEMORY[0x1E0D19008], "contextForHearstVoiceTriggerWithDeviceId:", v49);
    v43 = (CSVoiceTriggerSecondPassResultHolder *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D19030], "noAlertOption");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "setDisableBoostForDoAP:", 1);
    objc_msgSend(v44, "setRequestHistoricalAudioDataSampleCount:", 1);
    objc_msgSend(v44, "setStartRecordingSampleCount:", v42);
    v50[0] = MEMORY[0x1E0C809B0];
    v50[1] = 3221225472;
    v50[2] = __143__CSVoiceTriggerSecondPass__handleVoiceTriggerFirstPassFromHearstAP_deviceId_audioProviderUUID_firstPassInfo_rtModelRequestOptions_completion___block_invoke;
    v50[3] = &unk_1E7C29128;
    v50[4] = self;
    v51 = v18;
    v15 = v48;
    -[CSVoiceTriggerSecondPass _requestStartAudioStreamWitContext:audioProviderUUID:startStreamOption:completion:](self, "_requestStartAudioStreamWitContext:audioProviderUUID:startStreamOption:completion:", v43, v48, v44, v50);

    goto LABEL_13;
  }
  v45 = (void *)*MEMORY[0x1E0D18F58];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_ERROR))
  {
    v46 = v45;
    -[CSVoiceTriggerSecondPass UUID](self, "UUID");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v53 = "-[CSVoiceTriggerSecondPass _handleVoiceTriggerFirstPassFromHearstAP:deviceId:audioProviderUUID:firstPassInfo:r"
          "tModelRequestOptions:completion:]";
    v54 = 2114;
    v55 = v47;
    _os_log_error_impl(&dword_1C2614000, v46, OS_LOG_TYPE_ERROR, "%s CSVoiceTriggerSecondPass[%{public}@]:Expecting first pass source as Hearst", buf, 0x16u);

    if (!v18)
      goto LABEL_14;
    goto LABEL_12;
  }
  if (v18)
  {
LABEL_12:
    v43 = -[CSVoiceTriggerSecondPassResultHolder initWithResult:voiceTriggerEventInfo:isSecondChanceCandidate:]([CSVoiceTriggerSecondPassResultHolder alloc], "initWithResult:voiceTriggerEventInfo:isSecondChanceCandidate:", 4, 0, 0);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18E80], 114, 0);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, CSVoiceTriggerSecondPassResultHolder *, void *))v18 + 2))(v18, v43, v44);
LABEL_13:

  }
LABEL_14:

}

- (void)_handleVoiceTriggerFirstPassFromJarvis:(unint64_t)a3 deviceId:(id)a4 audioProviderUUID:(id)a5 firstPassInfo:(id)a6 completion:(id)a7
{
  id v12;
  void (**v13)(id, CSVoiceTriggerSecondPassResultHolder *, void *);
  os_log_t *v14;
  void *v15;
  CSVoiceTriggerSecondPassResultHolder *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  os_log_t v21;
  NSObject *v22;
  void *v23;
  unint64_t activeChannel;
  unint64_t firstPassTriggerStartSampleCount;
  unint64_t v26;
  unint64_t analyzerPrependingSamples;
  unint64_t v28;
  float v29;
  unint64_t v30;
  void *v31;
  unint64_t v32;
  float v33;
  float v34;
  float v35;
  os_log_t v36;
  float v37;
  float v38;
  float v39;
  os_log_t v40;
  NSObject *v41;
  void *v42;
  unint64_t v43;
  unint64_t v44;
  id v45;
  void (**v46)(id, CSVoiceTriggerSecondPassResultHolder *, void *);
  unint64_t v47;
  float v48;
  float v49;
  void *v50;
  void *v51;
  void (**v52)(id, CSVoiceTriggerSecondPassResultHolder *, void *);
  NSObject *v53;
  void *v54;
  float secondPassTimeout;
  float v56;
  void *v57;
  NSObject *log;
  id v59;
  id v60;
  _QWORD v61[4];
  void (**v62)(id, CSVoiceTriggerSecondPassResultHolder *, void *);
  uint8_t buf[4];
  const char *v64;
  __int16 v65;
  void *v66;
  __int16 v67;
  double v68;
  __int16 v69;
  double v70;
  __int16 v71;
  unint64_t v72;
  __int16 v73;
  unint64_t v74;
  __int16 v75;
  unint64_t v76;
  __int16 v77;
  unint64_t v78;
  uint64_t v79;

  v79 = *MEMORY[0x1E0C80C00];
  v60 = a4;
  v59 = a5;
  v12 = a6;
  v13 = (void (**)(id, CSVoiceTriggerSecondPassResultHolder *, void *))a7;
  v14 = (os_log_t *)MEMORY[0x1E0D18F58];
  if (a3 != 4)
  {
    v15 = (void *)*MEMORY[0x1E0D18F58];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_ERROR))
    {
      if (!v13)
        goto LABEL_5;
      goto LABEL_4;
    }
    v53 = v15;
    -[CSVoiceTriggerSecondPass UUID](self, "UUID");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v64 = "-[CSVoiceTriggerSecondPass _handleVoiceTriggerFirstPassFromJarvis:deviceId:audioProviderUUID:firstPassInfo:completion:]";
    v65 = 2114;
    v66 = v54;
    _os_log_error_impl(&dword_1C2614000, v53, OS_LOG_TYPE_ERROR, "%s CSVoiceTriggerSecondPass[%{public}@]:Expecting first pass source as Jarvis", buf, 0x16u);

    if (v13)
    {
LABEL_4:
      v16 = -[CSVoiceTriggerSecondPassResultHolder initWithResult:voiceTriggerEventInfo:isSecondChanceCandidate:]([CSVoiceTriggerSecondPassResultHolder alloc], "initWithResult:voiceTriggerEventInfo:isSecondChanceCandidate:", 4, 0, 0);
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18E80], 114, 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v13[2](v13, v16, v17);

    }
  }
LABEL_5:
  objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0D19618]);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  self->_activeChannel = objc_msgSend(v18, "unsignedIntegerValue");

  -[CSPhraseDetector setActiveChannel:](self->_phraseDetector, "setActiveChannel:", self->_activeChannel);
  objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0D195E8]);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  self->_earlyDetectFiredMachTime = objc_msgSend(v19, "unsignedLongLongValue");

  objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0D19658]);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  self->_firstPassTriggerStartSampleCount = objc_msgSend(v20, "unsignedIntegerValue");

  v21 = *v14;
  if (os_log_type_enabled(*v14, OS_LOG_TYPE_DEFAULT))
  {
    v22 = v21;
    -[CSVoiceTriggerSecondPass UUID](self, "UUID");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    activeChannel = self->_activeChannel;
    firstPassTriggerStartSampleCount = self->_firstPassTriggerStartSampleCount;
    *(_DWORD *)buf = 136315906;
    v64 = "-[CSVoiceTriggerSecondPass _handleVoiceTriggerFirstPassFromJarvis:deviceId:audioProviderUUID:firstPassInfo:completion:]";
    v65 = 2114;
    v66 = v23;
    v67 = 2050;
    v68 = *(double *)&activeChannel;
    v69 = 2050;
    v70 = *(double *)&firstPassTriggerStartSampleCount;
    _os_log_impl(&dword_1C2614000, v22, OS_LOG_TYPE_DEFAULT, "%s CSVoiceTriggerSecondPass[%{public}@]:Received first pass Jarvis triggered in channel: %{public}tu with trigger start: %{public}tu", buf, 0x2Au);

  }
  v26 = self->_firstPassTriggerStartSampleCount;
  if (self->_analyzerPrependingSamples >= v26)
    analyzerPrependingSamples = self->_firstPassTriggerStartSampleCount;
  else
    analyzerPrependingSamples = self->_analyzerPrependingSamples;
  v28 = v26 - analyzerPrependingSamples;
  objc_msgSend(MEMORY[0x1E0D19090], "inputRecordingSampleRate");
  v30 = (unint64_t)(float)(v29 * 0.5);
  objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0D19620]);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "unsignedIntegerValue") + v30;

  self->_secondPassTimeout = v32 - v28;
  objc_msgSend(MEMORY[0x1E0D19090], "inputRecordingDurationInSecs");
  v34 = v33;
  objc_msgSend(MEMORY[0x1E0D19090], "inputRecordingSampleRate");
  if ((float)(v34 * v35) < (float)(v32 - v28))
  {
    v36 = *v14;
    if (os_log_type_enabled(*v14, OS_LOG_TYPE_ERROR))
    {
      log = v36;
      -[CSVoiceTriggerSecondPass UUID](self, "UUID");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      secondPassTimeout = (float)self->_secondPassTimeout;
      objc_msgSend(MEMORY[0x1E0D19090], "inputRecordingSampleRate");
      *(_DWORD *)buf = 136315650;
      v64 = "-[CSVoiceTriggerSecondPass _handleVoiceTriggerFirstPassFromJarvis:deviceId:audioProviderUUID:firstPassInfo:completion:]";
      v65 = 2114;
      v66 = v57;
      v67 = 2050;
      v68 = (float)(secondPassTimeout / v56);
      _os_log_error_impl(&dword_1C2614000, log, OS_LOG_TYPE_ERROR, "%s CSVoiceTriggerSecondPass[%{public}@]:Second pass timeout (%{public}.2fs) should not exceed the ring buffer size, set to ring buffer size", buf, 0x20u);

    }
    objc_msgSend(MEMORY[0x1E0D19090], "inputRecordingDurationInSecs");
    v38 = v37;
    objc_msgSend(MEMORY[0x1E0D19090], "inputRecordingSampleRate");
    self->_secondPassTimeout = (unint64_t)(float)(v38 * v39);
  }
  v40 = *v14;
  if (os_log_type_enabled(*v14, OS_LOG_TYPE_DEFAULT))
  {
    v41 = v40;
    -[CSVoiceTriggerSecondPass UUID](self, "UUID");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = v30;
    v44 = analyzerPrependingSamples;
    v45 = v12;
    v46 = v13;
    v47 = self->_secondPassTimeout;
    v48 = (float)v47;
    objc_msgSend(MEMORY[0x1E0D19090], "inputRecordingSampleRate");
    *(_DWORD *)buf = 136316930;
    v64 = "-[CSVoiceTriggerSecondPass _handleVoiceTriggerFirstPassFromJarvis:deviceId:audioProviderUUID:firstPassInfo:completion:]";
    v65 = 2114;
    v66 = v42;
    v67 = 2050;
    v68 = *(double *)&v47;
    v13 = v46;
    v12 = v45;
    v69 = 2050;
    v70 = (float)(v48 / v49);
    v71 = 2050;
    v72 = v28;
    v73 = 2050;
    v74 = v32;
    v75 = 2050;
    v76 = v44;
    v77 = 2050;
    v78 = v43;
    _os_log_impl(&dword_1C2614000, v41, OS_LOG_TYPE_DEFAULT, "%s CSVoiceTriggerSecondPass[%{public}@]:Second pass set to analyze %{public}tu samples (%{public}.2fs) from %{public}tu to %{public}tu, with prepending samples %{public}tu, trailing samples %{public}tu", buf, 0x52u);

  }
  objc_msgSend(MEMORY[0x1E0D19008], "contextForJarvisWithDeviceId:", v60);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D19030], "noAlertOption");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "setRequestHistoricalAudioDataSampleCount:", 1);
  objc_msgSend(v51, "setStartRecordingSampleCount:", v28);
  v61[0] = MEMORY[0x1E0C809B0];
  v61[1] = 3221225472;
  v61[2] = __119__CSVoiceTriggerSecondPass__handleVoiceTriggerFirstPassFromJarvis_deviceId_audioProviderUUID_firstPassInfo_completion___block_invoke;
  v61[3] = &unk_1E7C290D8;
  v62 = v13;
  v52 = v13;
  -[CSVoiceTriggerSecondPass _requestStartAudioStreamWitContext:audioProviderUUID:startStreamOption:completion:](self, "_requestStartAudioStreamWitContext:audioProviderUUID:startStreamOption:completion:", v50, v59, v51, v61);
  -[CSVoiceTriggerSecondPass setResultCompletion:](self, "setResultCompletion:", v52);

}

- (void)cancelCurrentRequest
{
  void *v3;
  NSObject *v4;
  void *v5;
  NSObject *queue;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = (void *)*MEMORY[0x1E0D18F58];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    -[CSVoiceTriggerSecondPass UUID](self, "UUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v9 = "-[CSVoiceTriggerSecondPass cancelCurrentRequest]";
    v10 = 2114;
    v11 = v5;
    _os_log_impl(&dword_1C2614000, v4, OS_LOG_TYPE_DEFAULT, "%s CSVoiceTriggerSecondPass[%{public}@]:Cancel VoiceTrigger second pass request has received", buf, 0x16u);

  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__CSVoiceTriggerSecondPass_cancelCurrentRequest__block_invoke;
  block[3] = &unk_1E7C292C8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (BOOL)_isBuiltInFirstPassSource:(unint64_t)a3
{
  return a3 == 5 || a3 - 1 < 2 || (a3 & 0xFFFFFFFFFFFFFFFELL) == 8 || a3 - 11 < 2;
}

- (void)_voiceTriggerFirstPassDidDetectKeywordFrom:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  void *v9;
  void *v10;
  NSUUID *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  NSUUID *secondPassRejectionMHUUID;
  void *v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  char v24;
  NSObject *queue;
  id v26;
  id v27;
  id v28;
  id v29;
  NSUUID *v30;
  void *v31;
  void *v32;
  void *v33;
  char v34;
  _QWORD block[5];
  NSUUID *v36;
  id v37;
  id v38;
  id v39;
  id v40;
  unint64_t v41;
  char v42;
  _QWORD v43[5];
  _QWORD v44[5];
  _QWORD v45[5];
  uint8_t buf[4];
  const char *v47;
  __int16 v48;
  unint64_t v49;
  __int16 v50;
  NSUUID *v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "firstPassSource");
  objc_msgSend(v6, "deviceId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "audioProviderUUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstPassTriggerInfo");
  v11 = (NSUUID *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v6, "isSecondChanceRun");
  self->_firstPassFireHostTime = 0;
  v12 = *MEMORY[0x1E0D19420];
  -[NSUUID objectForKeyedSubscript:](v11, "objectForKeyedSubscript:", *MEMORY[0x1E0D19420]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[NSUUID objectForKeyedSubscript:](v11, "objectForKeyedSubscript:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    self->_firstPassFireHostTime = objc_msgSend(v14, "unsignedLongValue");

  }
  v15 = *MEMORY[0x1E0D18F58];
  if ((!v11 || !v8) && os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315650;
    v47 = "-[CSVoiceTriggerSecondPass _voiceTriggerFirstPassDidDetectKeywordFrom:completion:]";
    v48 = 2050;
    v49 = v8;
    v50 = 2114;
    v51 = v11;
    _os_log_error_impl(&dword_1C2614000, v15, OS_LOG_TYPE_ERROR, "%s There are nils in starting second pass with firstPassSource: %{public}lu firstPassInfo: %{public}@", buf, 0x20u);
    v15 = *MEMORY[0x1E0D18F58];
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = v15;
    -[CSVoiceTriggerSecondPass UUID](self, "UUID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    secondPassRejectionMHUUID = self->_secondPassRejectionMHUUID;
    *(_DWORD *)buf = 136315650;
    v47 = "-[CSVoiceTriggerSecondPass _voiceTriggerFirstPassDidDetectKeywordFrom:completion:]";
    v48 = 2114;
    v49 = (unint64_t)v17;
    v50 = 2112;
    v51 = secondPassRejectionMHUUID;
    _os_log_impl(&dword_1C2614000, v16, OS_LOG_TYPE_DEFAULT, "%s CSVoiceTriggerSecondPass[%{public}@]:Second pass generated mhUUID for rejections: %@", buf, 0x20u);

  }
  if (v8 != 4)
  {
    v19 = (void *)*MEMORY[0x1E0D18F58];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT))
    {
      v20 = v19;
      -[CSVoiceTriggerSecondPass UUID](self, "UUID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v47 = "-[CSVoiceTriggerSecondPass _voiceTriggerFirstPassDidDetectKeywordFrom:completion:]";
      v48 = 2114;
      v49 = (unint64_t)v21;
      _os_log_impl(&dword_1C2614000, v20, OS_LOG_TYPE_DEFAULT, "%s CSVoiceTriggerSecondPass[%{public}@]:Sending early detect notification upon first pass trigger", buf, 0x16u);

    }
    self->_earlyDetectFiredMachTime = mach_absolute_time();
  }
  if (-[CSVoiceTriggerSecondPass _isBuiltInFirstPassSource:](self, "_isBuiltInFirstPassSource:", v8))
    notify_post("com.apple.voicetrigger.builtin.EarlyDetect");
  if (v8 != 4)
  {
    kdebug_trace();
    if (v8 <= 0xC)
    {
      if (((1 << v8) & 0x1B06) != 0)
        goto LABEL_23;
      if (v8 == 5)
        goto LABEL_28;
    }
  }
  if (-[CSVoiceTriggerSecondPass _isFirstPassSourceExclave:](self, "_isFirstPassSourceExclave:", v8))
  {
LABEL_23:
    objc_msgSend(MEMORY[0x1E0D19110], "sharedPreferences");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v23, "useSiriActivationSPIForHomePod") & 1) != 0)
    {

    }
    else
    {
      v24 = objc_msgSend(MEMORY[0x1E0D19260], "isLocalVoiceTriggerAvailable");

      if ((v24 & 1) == 0)
      {
        notify_post("com.apple.voicetrigger.EarlyDetect");
        v32 = (void *)*MEMORY[0x1E0D18F58];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT))
          goto LABEL_28;
        v22 = v32;
        -[CSVoiceTriggerSecondPass UUID](self, "UUID");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315394;
        v47 = "-[CSVoiceTriggerSecondPass _voiceTriggerFirstPassDidDetectKeywordFrom:completion:]";
        v48 = 2114;
        v49 = (unint64_t)v33;
        _os_log_impl(&dword_1C2614000, v22, OS_LOG_TYPE_DEFAULT, "%s CSVoiceTriggerSecondPass[%{public}@]:Use legacy early detection notification", buf, 0x16u);

        goto LABEL_27;
      }
    }
    +[CSSiriLauncher sharedLauncher](CSSiriLauncher, "sharedLauncher");
    v22 = objc_claimAutoreleasedReturnValue();
    v45[0] = MEMORY[0x1E0C809B0];
    v45[1] = 3221225472;
    v45[2] = __82__CSVoiceTriggerSecondPass__voiceTriggerFirstPassDidDetectKeywordFrom_completion___block_invoke;
    v45[3] = &unk_1E7C29060;
    v45[4] = self;
    -[NSObject notifyBuiltInVoiceTriggerPrewarm:completion:](v22, "notifyBuiltInVoiceTriggerPrewarm:completion:", v11, v45);
LABEL_27:

    goto LABEL_28;
  }
  switch(v8)
  {
    case 3uLL:
      goto LABEL_20;
    case 7uLL:
      +[CSSiriLauncher sharedLauncher](CSSiriLauncher, "sharedLauncher");
      v22 = objc_claimAutoreleasedReturnValue();
      v43[0] = MEMORY[0x1E0C809B0];
      v43[1] = 3221225472;
      v43[2] = __82__CSVoiceTriggerSecondPass__voiceTriggerFirstPassDidDetectKeywordFrom_completion___block_invoke_76;
      v43[3] = &unk_1E7C29060;
      v43[4] = self;
      -[NSObject notifyRemoraVoiceTriggerPrewarm:deviceId:completion:](v22, "notifyRemoraVoiceTriggerPrewarm:deviceId:completion:", v11, v9, v43);
      goto LABEL_27;
    case 6uLL:
LABEL_20:
      +[CSSiriLauncher sharedLauncher](CSSiriLauncher, "sharedLauncher");
      v22 = objc_claimAutoreleasedReturnValue();
      v44[0] = MEMORY[0x1E0C809B0];
      v44[1] = 3221225472;
      v44[2] = __82__CSVoiceTriggerSecondPass__voiceTriggerFirstPassDidDetectKeywordFrom_completion___block_invoke_75;
      v44[3] = &unk_1E7C29060;
      v44[4] = self;
      -[NSObject notifyBluetoothDeviceVoiceTriggerPrewarm:deviceId:completion:](v22, "notifyBluetoothDeviceVoiceTriggerPrewarm:deviceId:completion:", v11, v9, v44);
      goto LABEL_27;
  }
LABEL_28:
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __82__CSVoiceTriggerSecondPass__voiceTriggerFirstPassDidDetectKeywordFrom_completion___block_invoke_81;
  block[3] = &unk_1E7C23A00;
  block[4] = self;
  v36 = v11;
  v40 = v7;
  v41 = v8;
  v37 = v6;
  v38 = v9;
  v42 = v34;
  v39 = v10;
  v26 = v10;
  v27 = v9;
  v28 = v7;
  v29 = v6;
  v30 = v11;
  dispatch_async(queue, block);
  +[CSVoiceTriggerStatistics sharedInstance](CSVoiceTriggerStatistics, "sharedInstance");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "incrementFirstPassTriggerCount");

}

- (void)_logRejectionEventToSELF:(id)a3 result:(unint64_t)a4
{
  id v6;
  void *v7;
  int v8;
  NSMutableDictionary *storedFirstPassInfo;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v6 = a3;
  v7 = v6;
  if (!self->_hasLoggedSecondPass)
  {
    v13 = v6;
    v8 = CSIsInternalBuild();
    v7 = v13;
    if (v8)
    {
      storedFirstPassInfo = self->_storedFirstPassInfo;
      -[CSVoiceTriggerSecondPass _getFirstPassTriggerSourceAsString:](self, "_getFirstPassTriggerSourceAsString:", self->_firstPassSource);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](storedFirstPassInfo, "setObject:forKey:", v10, *MEMORY[0x1E0D19660]);

      objc_msgSend(MEMORY[0x1E0D19120], "sharedLogger");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "logStartEventWithFirstPassStartedInfo:withMHUUID:", self->_storedFirstPassInfo, self->_secondPassRejectionMHUUID);

      objc_msgSend(MEMORY[0x1E0D19120], "sharedLogger");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "logRejectEventWithVTEI:withMHUUID:withSecondPassResult:", v13, self->_secondPassRejectionMHUUID, a4);

      v7 = v13;
      self->_hasLoggedSecondPass = 1;
    }
  }

}

- (void)_notifySecondPassReject:(id)a3 result:(unint64_t)a4 isSecondChanceCandidate:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  os_log_t *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t);
  void *v24;
  CSVoiceTriggerSecondPass *v25;
  id v26;
  unint64_t v27;
  BOOL v28;
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v5 = a5;
  v33 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (os_log_t *)MEMORY[0x1E0D18F58];
  v10 = (void *)*MEMORY[0x1E0D18F58];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT))
  {
    v11 = v10;
    -[CSVoiceTriggerSecondPass UUID](self, "UUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v30 = "-[CSVoiceTriggerSecondPass _notifySecondPassReject:result:isSecondChanceCandidate:]";
    v31 = 2114;
    v32 = v12;
    _os_log_impl(&dword_1C2614000, v11, OS_LOG_TYPE_DEFAULT, "%s CSVoiceTriggerSecondPass[%{public}@]:", buf, 0x16u);

  }
  v13 = (void *)objc_msgSend(v8, "mutableCopy");
  -[CSVoiceTriggerSecondPass _addDeviceStatusInfoToDict:](self, "_addDeviceStatusInfoToDict:", v13);
  -[NSUUID UUIDString](self->_secondPassRejectionMHUUID, "UUIDString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKey:", v14, *MEMORY[0x1E0D19558]);

  v15 = v13;
  -[CSVoiceTriggerSecondPass _reportModelProcessingLatency](self, "_reportModelProcessingLatency");
  self->_secondPassHasMadeDecision = 1;
  -[CSVoiceTriggerSecondPass audioStream](self, "audioStream");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[CSVoiceTriggerSecondPass audioStream](self, "audioStream");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = MEMORY[0x1E0C809B0];
    v22 = 3221225472;
    v23 = __83__CSVoiceTriggerSecondPass__notifySecondPassReject_result_isSecondChanceCandidate___block_invoke;
    v24 = &unk_1E7C23A28;
    v25 = self;
    v27 = a4;
    v26 = v15;
    v28 = v5;
    objc_msgSend(v17, "stopAudioStreamWithOption:completion:", 0, &v21);

  }
  else
  {
    v18 = *v9;
    if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v30 = "-[CSVoiceTriggerSecondPass _notifySecondPassReject:result:isSecondChanceCandidate:]";
      _os_log_impl(&dword_1C2614000, v18, OS_LOG_TYPE_DEFAULT, "%s audioStream not existing", buf, 0xCu);
    }
    -[CSVoiceTriggerSecondPass _handleResultCompletion:voiceTriggerInfo:isSecondChanceCandidate:error:](self, "_handleResultCompletion:voiceTriggerInfo:isSecondChanceCandidate:error:", a4, v15, v5, 0);
  }
  if (CSIsInternalBuild())
  {
    if (a4 == 9)
      v19 = 4705;
    else
      v19 = 4704;
    -[CSVoiceTriggerSecondPass _logRejectionEventToSELF:result:](self, "_logRejectionEventToSELF:result:", v15, a4, v21, v22, v23, v24, v25);
    objc_msgSend(MEMORY[0x1E0CFE7D8], "sharedAnalytics");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "logEventWithType:context:", v19, v15);

  }
}

- (void)_prepareStartAudioStream
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  NSString *firstPassDeviceId;
  void *v9;
  id v10;
  void *v11;
  CSPlainAudioFileWriter *v12;
  CSPlainAudioFileWriter *audioFileWriter;
  int v14;
  const char *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = (void *)*MEMORY[0x1E0D18F58];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    -[CSVoiceTriggerSecondPass UUID](self, "UUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 136315394;
    v15 = "-[CSVoiceTriggerSecondPass _prepareStartAudioStream]";
    v16 = 2114;
    v17 = v5;
    _os_log_impl(&dword_1C2614000, v4, OS_LOG_TYPE_DEFAULT, "%s CSVoiceTriggerSecondPass[%{public}@]:", (uint8_t *)&v14, 0x16u);

  }
  objc_msgSend(MEMORY[0x1E0D19110], "sharedPreferences");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "secondPassAudioLoggingEnabled");

  if (v7)
  {
    if (self->_firstPassSource == 7)
      firstPassDeviceId = self->_firstPassDeviceId;
    else
      firstPassDeviceId = 0;
    +[CSVoiceTriggerSecondPass secondPassAudioLoggingFilePathWithDeviceId:](CSVoiceTriggerSecondPass, "secondPassAudioLoggingFilePathWithDeviceId:", firstPassDeviceId);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_alloc(MEMORY[0x1E0D191B0]);
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (CSPlainAudioFileWriter *)objc_msgSend(v10, "initWithURL:", v11);
    audioFileWriter = self->_audioFileWriter;
    self->_audioFileWriter = v12;

  }
  else
  {
    v9 = self->_audioFileWriter;
    self->_audioFileWriter = 0;
  }

}

- (void)_didStartAudioStream:(BOOL)a3
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
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v5 = (void *)*MEMORY[0x1E0D18F58];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    -[CSVoiceTriggerSecondPass UUID](self, "UUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 136315394;
    v9 = "-[CSVoiceTriggerSecondPass _didStartAudioStream:]";
    v10 = 2114;
    v11 = v7;
    _os_log_impl(&dword_1C2614000, v6, OS_LOG_TYPE_DEFAULT, "%s CSVoiceTriggerSecondPass[%{public}@]:", (uint8_t *)&v8, 0x16u);

  }
  kdebug_trace();
  if (!a3)
  {
    -[CSPhraseDetector reset](self->_phraseDetector, "reset");
    -[CSVoiceTriggerSecondPass _clearTriggerCandidate](self, "_clearTriggerCandidate");
    -[CSPlainAudioFileWriter endAudio](self->_audioFileWriter, "endAudio");
    -[SSRSpeakerRecognitionController endAudio](self->_speakerRecognitionController, "endAudio");
  }
}

- (void)_didStopAudioStream
{
  void *v3;
  NSObject *v4;
  void *v5;
  int v6;
  const char *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v3 = (void *)*MEMORY[0x1E0D18F58];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    -[CSVoiceTriggerSecondPass UUID](self, "UUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 136315394;
    v7 = "-[CSVoiceTriggerSecondPass _didStopAudioStream]";
    v8 = 2114;
    v9 = v5;
    _os_log_impl(&dword_1C2614000, v4, OS_LOG_TYPE_DEFAULT, "%s CSVoiceTriggerSecondPass[%{public}@]:", (uint8_t *)&v6, 0x16u);

  }
  kdebug_trace();
  -[CSPhraseDetector reset](self->_phraseDetector, "reset");
  -[CSVoiceTriggerSecondPass _clearTriggerCandidate](self, "_clearTriggerCandidate");
  -[SSRSpeakerRecognitionController endAudio](self->_speakerRecognitionController, "endAudio");
  -[CSPlainAudioFileWriter endAudio](self->_audioFileWriter, "endAudio");
}

- (void)audioStreamProvider:(id)a3 didStopStreamUnexpectedly:(int64_t)a4
{
  void *v5;
  NSObject *v6;
  void *v7;
  NSObject *queue;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = (void *)*MEMORY[0x1E0D18F58];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    -[CSVoiceTriggerSecondPass UUID](self, "UUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v11 = "-[CSVoiceTriggerSecondPass audioStreamProvider:didStopStreamUnexpectedly:]";
    v12 = 2114;
    v13 = v7;
    _os_log_impl(&dword_1C2614000, v6, OS_LOG_TYPE_DEFAULT, "%s CSVoiceTriggerSecondPass[%{public}@]:", buf, 0x16u);

  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__CSVoiceTriggerSecondPass_audioStreamProvider_didStopStreamUnexpectedly___block_invoke;
  block[3] = &unk_1E7C292C8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)audioStreamProvider:(id)a3 numSamplesAvailableInExclave:(unint64_t)a4 hostTime:(unint64_t)a5 arrivalHostTimeToAudioRecorder:(unint64_t)a6 exclaveSampleCount:(unint64_t)a7
{
  uint64_t v9;
  void *v10;
  NSObject *queue;
  id v12;
  _QWORD block[5];
  id v14;
  unint64_t v15;
  _QWORD v16[6];

  v9 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __136__CSVoiceTriggerSecondPass_audioStreamProvider_numSamplesAvailableInExclave_hostTime_arrivalHostTimeToAudioRecorder_exclaveSampleCount___block_invoke;
  v16[3] = &unk_1E7C23A50;
  v16[4] = self;
  v16[5] = a7;
  v10 = (void *)MEMORY[0x1C3BC4734](v16, a2, a3, a4, a5, a6);
  queue = self->_queue;
  block[0] = v9;
  block[1] = 3221225472;
  block[2] = __136__CSVoiceTriggerSecondPass_audioStreamProvider_numSamplesAvailableInExclave_hostTime_arrivalHostTimeToAudioRecorder_exclaveSampleCount___block_invoke_94;
  block[3] = &unk_1E7C277F8;
  v14 = v10;
  v15 = a7;
  block[4] = self;
  v12 = v10;
  dispatch_async(queue, block);

}

- (void)_processSecondPassInExclave:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  _BOOL8 v9;
  CSExclaveRecordClient *exclaveClient;
  _QWORD v11[5];
  id v12;
  BOOL v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (self->_secondPassHasMadeDecision)
  {
    v6 = (void *)*MEMORY[0x1E0D18F58];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT))
    {
      v7 = v6;
      -[CSVoiceTriggerSecondPass UUID](self, "UUID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v15 = "-[CSVoiceTriggerSecondPass _processSecondPassInExclave:]";
      v16 = 2114;
      v17 = v8;
      _os_log_impl(&dword_1C2614000, v7, OS_LOG_TYPE_DEFAULT, "%s CSVoiceTriggerSecondPass[%{public}@]:second pass has made decision, skip processing", buf, 0x16u);

    }
  }
  else
  {
    v9 = self->_numAnalyzedSamples >= self->_secondPassTimeout;
    exclaveClient = self->_exclaveClient;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __56__CSVoiceTriggerSecondPass__processSecondPassInExclave___block_invoke;
    v11[3] = &unk_1E7C23A78;
    v11[4] = self;
    v12 = v4;
    v13 = v9;
    -[CSExclaveRecordClient processSecondPassVoiceTriggerWithShouldFlushAudio:result:](exclaveClient, "processSecondPassVoiceTriggerWithShouldFlushAudio:result:", v9, v11);

  }
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
  v8[2] = __69__CSVoiceTriggerSecondPass_audioStreamProvider_audioBufferAvailable___block_invoke;
  v8[3] = &unk_1E7C292A0;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(queue, v8);

}

- (void)_handleAudioChunk:(id)a3 shouldPreprocessedByZeroFilter:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  void *v14;
  CSVoiceTriggerAwareZeroFilter *zeroFilter;
  void *v16;
  unint64_t numProcessedSamples;
  unint64_t v18;
  uint64_t v19;
  unint64_t secondPassTimeout;
  void *v21;
  void *v22;
  CSPlainAudioFileWriter *v23;
  id v24;
  unint64_t v25;
  unint64_t v26;
  void *v27;
  id v28;
  CSPlainAudioFileWriter *audioFileWriter;
  id v30;
  void *v31;
  NSObject *v32;
  void *v33;
  unint64_t v34;
  SSRSpeakerRecognitionController *speakerRecognitionController;
  uint64_t v36;
  void *v37;
  int v38;
  const char *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  unint64_t v43;
  uint64_t v44;

  v4 = a4;
  v44 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_currentAsset)
  {
    if (self->_secondPassHasMadeDecision)
    {
      v7 = (void *)*MEMORY[0x1E0D18F58];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT))
      {
        v8 = v7;
        -[CSVoiceTriggerSecondPass UUID](self, "UUID");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = 136315394;
        v39 = "-[CSVoiceTriggerSecondPass _handleAudioChunk:shouldPreprocessedByZeroFilter:]";
        v40 = 2114;
        v41 = v9;
        _os_log_impl(&dword_1C2614000, v8, OS_LOG_TYPE_DEFAULT, "%s CSVoiceTriggerSecondPass[%{public}@]:second pass has made decision, skip processing", (uint8_t *)&v38, 0x16u);
LABEL_5:

LABEL_13:
      }
    }
    else
    {
      if (v4)
      {
        v11 = _handleAudioChunk_shouldPreprocessedByZeroFilter__heartbeat;
        if (__ROR8__(0xEEEEEEEEEEEEEEEFLL * _handleAudioChunk_shouldPreprocessedByZeroFilter__heartbeat, 1) <= 0x888888888888888uLL)
        {
          v12 = (void *)*MEMORY[0x1E0D18F58];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT))
          {
            v13 = v12;
            -[CSVoiceTriggerSecondPass UUID](self, "UUID");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v38 = 136315394;
            v39 = "-[CSVoiceTriggerSecondPass _handleAudioChunk:shouldPreprocessedByZeroFilter:]";
            v40 = 2114;
            v41 = v14;
            _os_log_impl(&dword_1C2614000, v13, OS_LOG_TYPE_DEFAULT, "%s CSVoiceTriggerSecondPass[%{public}@]:Preprocessing through zero-filter for this trigger event", (uint8_t *)&v38, 0x16u);

            v11 = _handleAudioChunk_shouldPreprocessedByZeroFilter__heartbeat;
          }
        }
        _handleAudioChunk_shouldPreprocessedByZeroFilter__heartbeat = v11 + 1;
        zeroFilter = self->_zeroFilter;
        objc_msgSend(v6, "dataForChannel:", 0);
        v8 = objc_claimAutoreleasedReturnValue();
        -[CSVoiceTriggerAwareZeroFilter processBuffer:atTime:](zeroFilter, "processBuffer:atTime:", v8, objc_msgSend(v6, "hostTime"));
        goto LABEL_13;
      }
      if (!self->_numProcessedSamples)
      {
        -[CSVoiceTriggerSecondPass _voiceTriggerSecondPassLatencyMetrics](self, "_voiceTriggerSecondPassLatencyMetrics");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setSecondPassFirstAudioPacketReceptionTime:", mach_absolute_time());

      }
      -[CSVoiceTriggerSecondPass _setStartAnalyzeTime:](self, "_setStartAnalyzeTime:", objc_msgSend(v6, "startSampleCount"));
      numProcessedSamples = self->_numProcessedSamples;
      v18 = objc_msgSend(v6, "numSamples") + numProcessedSamples;
      v19 = mach_absolute_time();
      secondPassTimeout = self->_secondPassTimeout;
      if (v18 >= secondPassTimeout)
      {
        v25 = self->_numProcessedSamples;
        v26 = secondPassTimeout - v25;
        if ((uint64_t)(secondPassTimeout - v25) >= 1)
        {
          objc_msgSend(v6, "subChunkFrom:numSamples:", 0, secondPassTimeout - v25);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = -[CSVoiceTriggerSecondPass _runRecognizersWithChunk:](self, "_runRecognizersWithChunk:", v27);
          self->_numAnalyzedSamples += v26;
          audioFileWriter = self->_audioFileWriter;
          objc_msgSend(v27, "data");
          v30 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          -[CSPlainAudioFileWriter addSamples:numSamples:](audioFileWriter, "addSamples:numSamples:", objc_msgSend(v30, "bytes"), objc_msgSend(v27, "numSamples"));

        }
        self->_processedSampleCountsInPending += objc_msgSend(v6, "numSamples") - v26;
        v31 = (void *)*MEMORY[0x1E0D18F58];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT))
        {
          v32 = v31;
          -[CSVoiceTriggerSecondPass UUID](self, "UUID");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = self->_secondPassTimeout;
          v38 = 136315650;
          v39 = "-[CSVoiceTriggerSecondPass _handleAudioChunk:shouldPreprocessedByZeroFilter:]";
          v40 = 2114;
          v41 = v33;
          v42 = 2050;
          v43 = v34;
          _os_log_impl(&dword_1C2614000, v32, OS_LOG_TYPE_DEFAULT, "%s CSVoiceTriggerSecondPass[%{public}@]:Stop feeding audio at sampleCount: %{public}tu", (uint8_t *)&v38, 0x20u);

        }
        speakerRecognitionController = self->_speakerRecognitionController;
        if (speakerRecognitionController)
        {
          -[SSRSpeakerRecognitionController endAudio](speakerRecognitionController, "endAudio");
          self->_isPSRAudioFlushed = 1;
        }
        v36 = mach_absolute_time();
        -[CSPhraseDetector getAnalyzedResultFromFlushedAudio](self->_phraseDetector, "getAnalyzedResultFromFlushedAudio");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        self->_secondPassCheckerExecutionTime += mach_absolute_time() - v36;
        -[CSPhraseDetector getLosingPhraseResultsWithDetectedPhId:](self->_phraseDetector, "getLosingPhraseResultsWithDetectedPhId:", objc_msgSend(v21, "phId"));
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        -[CSVoiceTriggerSecondPass _setKeywordDetectorStartMachTime:detectorEndMachTime:lastAudioPacketAnalyzedMachTime:](self, "_setKeywordDetectorStartMachTime:detectorEndMachTime:lastAudioPacketAnalyzedMachTime:", v19, mach_absolute_time(), v19);
        -[CSVoiceTriggerSecondPass _analyzeForChannel:keywordDetectorResult:losingPhraseResults:](self, "_analyzeForChannel:keywordDetectorResult:losingPhraseResults:", self->_activeChannel, v21, v37);

      }
      else
      {
        -[CSVoiceTriggerSecondPass _runRecognizersWithChunk:](self, "_runRecognizersWithChunk:", v6);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[CSPhraseDetector getLosingPhraseResultsWithDetectedPhId:](self->_phraseDetector, "getLosingPhraseResultsWithDetectedPhId:", objc_msgSend(v21, "phId"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[CSVoiceTriggerSecondPass _setKeywordDetectorStartMachTime:detectorEndMachTime:lastAudioPacketAnalyzedMachTime:](self, "_setKeywordDetectorStartMachTime:detectorEndMachTime:lastAudioPacketAnalyzedMachTime:", v19, mach_absolute_time(), v19);
        -[CSVoiceTriggerSecondPass _analyzeForChannel:keywordDetectorResult:losingPhraseResults:](self, "_analyzeForChannel:keywordDetectorResult:losingPhraseResults:", self->_activeChannel, v21, v22);
        self->_numAnalyzedSamples += objc_msgSend(v6, "numSamples");
        v23 = self->_audioFileWriter;
        objc_msgSend(v6, "data");
        v24 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        -[CSPlainAudioFileWriter addSamples:numSamples:](v23, "addSamples:numSamples:", objc_msgSend(v24, "bytes"), objc_msgSend(v6, "numSamples"));

        self->_numProcessedSamples += objc_msgSend(v6, "numSamples");
      }

    }
  }
  else
  {
    v10 = (void *)*MEMORY[0x1E0D18F58];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_ERROR))
    {
      v8 = v10;
      -[CSVoiceTriggerSecondPass UUID](self, "UUID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = 136315394;
      v39 = "-[CSVoiceTriggerSecondPass _handleAudioChunk:shouldPreprocessedByZeroFilter:]";
      v40 = 2114;
      v41 = v9;
      _os_log_error_impl(&dword_1C2614000, v8, OS_LOG_TYPE_ERROR, "%s CSVoiceTriggerSecondPass[%{public}@]:Could not find Assets. Cannot process Audio", (uint8_t *)&v38, 0x16u);
      goto LABEL_5;
    }
  }

}

- (id)_runRecognizersWithChunk:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v5 = mach_absolute_time();
  -[CSPhraseDetector getAnalyzedResultFromAudioChunk:](self->_phraseDetector, "getAnalyzedResultFromAudioChunk:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  self->_secondPassCheckerExecutionTime += mach_absolute_time() - v5;
  -[CSPhraseNDEAPIScorer processAudioChunk:activeChannel:](self->_phraseNDEAPIScorer, "processAudioChunk:activeChannel:", v4, self->_activeChannel);
  if (self->_speakerRecognitionController)
  {
    objc_msgSend(v4, "dataForChannel:", self->_activeChannel);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(MEMORY[0x1E0D19090], "inputRecordingIsFloat"))
    {
      v8 = (void *)MEMORY[0x1E0D19100];
      objc_msgSend(v4, "dataForChannel:", self->_activeChannel);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "convertToShortLPCMBufFromFloatLPCMBuf:", v9);
      v10 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v10;
    }
    -[SSRSpeakerRecognitionController processAudio:withNumberOfSamples:](self->_speakerRecognitionController, "processAudio:withNumberOfSamples:", v7, objc_msgSend(v4, "numSamples"));

  }
  return v6;
}

- (id)_getVoiceTriggerInfoWithKeywordDetectorResult:(id)a3
{
  id v4;
  void *v5;
  int v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t extraSamplesAtStart;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  float v16;
  float v17;
  double v18;
  float v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  uint64_t v26;
  float v27;
  double v28;
  float v29;
  double v30;
  double v31;
  uint64_t v32;
  void *v33;
  __CFString *v34;
  __CFString *v35;
  uint64_t v36;
  void *v37;
  __CFString *v38;
  __CFString *v39;
  uint64_t v40;
  double v41;
  double v42;
  float secondPassAnalyzerStartSampleCount;
  float v44;
  float v45;
  float v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  double v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  uint64_t v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  _BOOL4 v92;
  uint64_t v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  double v107;
  void *v108;
  double v109;
  void *v110;
  void *v111;
  double v112;
  void *v113;
  void *v114;
  CSVoiceTriggerFirstPassMetrics *firstpassMetrics;
  void *v116;
  void *v117;
  int v118;
  unint64_t firstPassSource;
  float v120;
  void *v121;
  int64_t mediaPlayingState;
  void *v123;
  double v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  CSVTSecondPassLatencyMetrics *secondPassLatencyMetrics;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  unint64_t v142;
  void *v143;
  void *v144;
  void *v146;
  unint64_t v147;
  void *v148;
  void *v149;
  unint64_t v150;
  uint64_t v151;
  unint64_t v152;
  unint64_t v153;
  uint64_t v154;
  unint64_t v155;
  int v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  void *v160;
  __CFString *v161;
  void *v162;
  void *v163;
  _BOOL4 v164;

  v4 = a3;
  v159 = objc_msgSend(v4, "phId");
  -[CSPhraseDetector phraseDetectorInfoFromPhId:](self->_phraseDetector, "phraseDetectorInfoFromPhId:", v159);
  v163 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v163, "phraseConfig");
  v148 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ndapiResult");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "combinedScore");
  v156 = v6;
  v7 = objc_msgSend(v5, "samplesFed");
  v154 = v7;
  v8 = objc_msgSend(v5, "bestStart");
  v9 = objc_msgSend(v5, "bestEnd");
  v10 = self->_processedSampleCountsInPending + objc_msgSend(v5, "samplesAtFire");
  v152 = v10;
  v162 = v5;
  v11 = objc_msgSend(v5, "startSampleCount");
  v153 = self->_numAnalyzedSamples + self->_secondPassAnalyzerStartSampleCount;
  if (self->_extraSamplesAtStart >= v8)
    extraSamplesAtStart = v8;
  else
    extraSamplesAtStart = self->_extraSamplesAtStart;
  v155 = extraSamplesAtStart;
  v13 = v8 - extraSamplesAtStart;
  v14 = v9 - (v8 - extraSamplesAtStart);
  v15 = v13;
  v16 = (float)v14;
  objc_msgSend(MEMORY[0x1E0D19090], "inputRecordingSampleRate");
  v18 = (float)(v16 / v17);
  objc_msgSend(MEMORY[0x1E0D19090], "inputRecordingSampleRate");
  v20 = (float)((float)(v10 - v15) / v19);
  -[CSVoiceTriggerSecondPass _getAudioTimeConverter](self, "_getAudioTimeConverter");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v150 = v15;
  v157 = objc_msgSend(v21, "hostTimeFromSampleCount:", v15);

  -[CSVoiceTriggerSecondPass _getAudioTimeConverter](self, "_getAudioTimeConverter");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v151 = v9;
  v158 = objc_msgSend(v22, "hostTimeFromSampleCount:", v9);

  +[CSBatteryMonitor sharedInstance](CSBatteryMonitor, "sharedInstance");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v164 = objc_msgSend(v23, "batteryState") == 2;

  -[CSVoiceTriggerSecondPass _logUptimeWithVTSwitchChanged:VTEnabled:](self, "_logUptimeWithVTSwitchChanged:VTEnabled:", 0, 1);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_cumulativeUptime);
  v149 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_cumulativeDowntime);
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D19260], "systemUpTime");
  v25 = v24;
  v26 = v11 + v7;
  objc_msgSend(MEMORY[0x1E0D19090], "inputRecordingSampleRate");
  v28 = (float)((float)(v26 - v15) / v27);
  objc_msgSend(MEMORY[0x1E0D19090], "inputRecordingSampleRate");
  v30 = v25 - v28;
  v31 = v25 - (float)((float)(unint64_t)(v26 - v9) / v29);
  -[CSVoiceTriggerSecondPassConfig configPathNDAPI](self->_config, "configPathNDAPI");
  v32 = objc_claimAutoreleasedReturnValue();
  v33 = (void *)v32;
  if (v32)
    v34 = (__CFString *)v32;
  else
    v34 = CFSTR("n/a");
  v35 = v34;

  -[CSAsset hashFromResourcePath](self->_currentAsset, "hashFromResourcePath");
  v36 = objc_claimAutoreleasedReturnValue();
  v37 = (void *)v36;
  if (v36)
    v38 = (__CFString *)v36;
  else
    v38 = CFSTR("n/a");
  v39 = v38;

  -[CSVoiceTriggerSecondPass _fetchSiriLocale](self, "_fetchSiriLocale");
  v40 = objc_claimAutoreleasedReturnValue();
  CSMachAbsoluteTimeGetTimeInterval();
  v42 = v41;
  secondPassAnalyzerStartSampleCount = (float)self->_secondPassAnalyzerStartSampleCount;
  objc_msgSend(v148, "preTriggerSilenceOffset");
  v45 = v44;
  objc_msgSend(MEMORY[0x1E0D19090], "inputRecordingSampleRate");
  v147 = (unint64_t)(float)(secondPassAnalyzerStartSampleCount + (float)(v45 * v46));
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSAsset configVersion](self->_currentAsset, "configVersion");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setObject:forKey:", v48, *MEMORY[0x1E0D195D8]);

  objc_msgSend(MEMORY[0x1E0D19260], "deviceBuildVersion");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setObject:forKey:", v49, *MEMORY[0x1E0D195C0]);

  v161 = v35;
  objc_msgSend(v47, "setObject:forKey:", v35, *MEMORY[0x1E0D195D0]);
  objc_msgSend(v47, "setObject:forKey:", v39, *MEMORY[0x1E0D193F8]);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v164);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setObject:forKey:", v50, *MEMORY[0x1E0D194D0]);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_didWakeAP);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setObject:forKey:", v51, *MEMORY[0x1E0D19410]);

  objc_msgSend(v47, "setObject:forKey:", MEMORY[0x1E0C9AAA0], *MEMORY[0x1E0D19500]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v4, "isSecondChance"));
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setObject:forKey:", v52, *MEMORY[0x1E0D19680]);

  v160 = (void *)v40;
  objc_msgSend(v47, "setObject:forKey:", v40, *MEMORY[0x1E0D194A8]);
  v53 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(MEMORY[0x1E0D19090], "inputRecordingSampleRate");
  objc_msgSend(v53, "numberWithFloat:");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setObject:forKey:", v54, *MEMORY[0x1E0D19668]);

  v55 = v149;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v147);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setObject:forKey:", v56, *MEMORY[0x1E0D195C8]);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v150);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setObject:forKey:", v57, *MEMORY[0x1E0D19788]);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v151);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setObject:forKey:", v58, *MEMORY[0x1E0D19730]);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v152);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setObject:forKey:", v59, *MEMORY[0x1E0D19760]);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_secondPassAnalyzerStartSampleCount);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setObject:forKey:", v60, *MEMORY[0x1E0D196D0]);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v153);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setObject:forKey:", v61, *MEMORY[0x1E0D196C8]);

  objc_msgSend(v47, "setObject:forKey:", &unk_1E7C63EC0, *MEMORY[0x1E0D19790]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v18);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setObject:forKey:", v62, *MEMORY[0x1E0D19738]);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v20);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setObject:forKey:", v63, *MEMORY[0x1E0D19768]);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v30);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setObject:forKey:", v64, *MEMORY[0x1E0D19798]);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v31);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setObject:forKey:", v65, *MEMORY[0x1E0D19740]);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v31 - v30);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setObject:forKey:", v66, *MEMORY[0x1E0D19720]);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v25);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setObject:forKey:", v67, *MEMORY[0x1E0D19770]);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v154);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setObject:forKey:", v68, *MEMORY[0x1E0D19708]);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v150);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setObject:forKey:", v69, *MEMORY[0x1E0D19718]);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v151);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setObject:forKey:", v70, *MEMORY[0x1E0D19710]);

  v71 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v149, "doubleValue");
  objc_msgSend(v71, "numberWithDouble:");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setObject:forKey:", v72, *MEMORY[0x1E0D195A0]);

  v73 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v146, "doubleValue");
  objc_msgSend(v73, "numberWithDouble:");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setObject:forKey:", v74, *MEMORY[0x1E0D19598]);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v42);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setObject:forKey:", v75, *MEMORY[0x1E0D195F0]);

  LODWORD(v76) = v156;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v76);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setObject:forKey:", v77, *MEMORY[0x1E0D19778]);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v155);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setObject:forKey:", v78, *MEMORY[0x1E0D19600]);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_analyzerPrependingSamples);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setObject:forKey:", v79, *MEMORY[0x1E0D195B0]);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_analyzerTrailingSamples);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v81 = *MEMORY[0x1E0D195B8];
  objc_msgSend(v47, "setObject:forKey:", v80, *MEMORY[0x1E0D195B8]);

  v82 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v163, "effectiveKeywordThreshold");
  objc_msgSend(v82, "numberWithFloat:");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setObject:forKey:", v83, *MEMORY[0x1E0D195F8]);

  v84 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v163, "effectiveKeywordThreshold");
  objc_msgSend(v84, "numberWithFloat:");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setObject:forKey:", v85, *MEMORY[0x1E0D196F8]);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_earlyDetectFiredMachTime);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setObject:forKey:", v86, *MEMORY[0x1E0D195E8]);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v157);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setObject:forKey:", v87, *MEMORY[0x1E0D19780]);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v158);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setObject:forKey:", v88, *MEMORY[0x1E0D19728]);

  objc_msgSend(v47, "setObject:forKey:", MEMORY[0x1E0C9AAA0], *MEMORY[0x1E0D19670]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v159);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setObject:forKey:", v89, *MEMORY[0x1E0D19590]);

  objc_msgSend(v148, "name");
  v90 = (void *)objc_claimAutoreleasedReturnValue();

  if (v90)
  {
    objc_msgSend(v148, "name");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "setObject:forKey:", v91, *MEMORY[0x1E0D19588]);

  }
  v92 = -[CSVoiceTriggerSecondPass _shouldRequestSingleChannelFromAudioProvider](self, "_shouldRequestSingleChannelFromAudioProvider");
  v93 = 216;
  if (v92)
    v93 = 224;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(Class *)((char *)&self->super.isa + v93));
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setObject:forKey:", v94, *MEMORY[0x1E0D195A8]);

  v95 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v149, "doubleValue");
  objc_msgSend(v95, "numberWithDouble:");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setObject:forKey:", v96, *MEMORY[0x1E0D197A8]);

  v97 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v146, "doubleValue");
  objc_msgSend(v97, "numberWithDouble:");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setObject:forKey:", v98, *MEMORY[0x1E0D195E0]);

  if (objc_msgSend(v4, "isRunningQuasar"))
  {
    v99 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v4, "recognizerScore");
    objc_msgSend(v99, "numberWithFloat:");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "setObject:forKey:", v100, *MEMORY[0x1E0D19698]);

    v101 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v148, "recognizerScoreOffset");
    objc_msgSend(v101, "numberWithFloat:");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "setObject:forKey:", v102, *MEMORY[0x1E0D196A0]);

    v103 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v148, "recognizerScoreScaleFactor");
    objc_msgSend(v103, "numberWithFloat:");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "setObject:forKey:", v104, *MEMORY[0x1E0D19690]);

  }
  if (CSIsHorseman())
  {
    if (self->_firstPassChannelSelectionScores)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(v47, "setObject:forKey:", self->_firstPassChannelSelectionScores, *MEMORY[0x1E0D19610]);
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_firstPassTriggerStartSampleCount);
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "setObject:forKey:", v105, *MEMORY[0x1E0D19658]);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_firstPassTriggerFireSampleCount);
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "setObject:forKey:", v106, *MEMORY[0x1E0D19628]);

    *(float *)&v107 = self->_firstPassChannelSelectionDelaySeconds;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v107);
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "setObject:forKey:", v108, *MEMORY[0x1E0D19608]);

    *(float *)&v109 = self->_firstPassMasterChannelScoreBoost;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v109);
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "setObject:forKey:", v110, *MEMORY[0x1E0D19630]);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_firstPassOnsetChannel);
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "setObject:forKey:", v111, *MEMORY[0x1E0D19638]);

    *(float *)&v112 = self->_firstPassOnsetScore;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v112);
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "setObject:forKey:", v113, *MEMORY[0x1E0D19640]);

  }
  -[CSVoiceTriggerSecondPass _getFirstPassTriggerSourceAsString:](self, "_getFirstPassTriggerSourceAsString:", self->_firstPassSource);
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setObject:forKey:", v114, *MEMORY[0x1E0D19660]);

  firstpassMetrics = self->_firstpassMetrics;
  if (firstpassMetrics)
  {
    -[CSVoiceTriggerFirstPassMetrics firstPassInfoGeneratedTime](firstpassMetrics, "firstPassInfoGeneratedTime");
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "setObject:forKey:", v116, *MEMORY[0x1E0D19428]);

    -[CSVoiceTriggerFirstPassMetrics firstPassInfoProcessedTime](self->_firstpassMetrics, "firstPassInfoProcessedTime");
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "setObject:forKey:", v117, *MEMORY[0x1E0D19430]);

  }
  v118 = objc_msgSend(MEMORY[0x1E0D19260], "supportJarvisVoiceTrigger");
  firstPassSource = self->_firstPassSource;
  if (v118 && firstPassSource == 4)
  {
    objc_msgSend(MEMORY[0x1E0D19090], "inputRecordingSampleRate");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", (unint64_t)(float)(v120 * 0.5));
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "setObject:forKey:", v121, v81);

    firstPassSource = self->_firstPassSource;
  }
  if (-[CSVoiceTriggerSecondPass _shouldLogMediaplayState:](self, "_shouldLogMediaplayState:", firstPassSource))
  {
    mediaPlayingState = self->_mediaPlayingState;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", mediaPlayingState == 1);
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "setObject:forKey:", v123, *MEMORY[0x1E0D19678]);

    if (mediaPlayingState == 1)
    {
      *(float *)&v124 = self->_mediaVolume;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v124);
      v125 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "setObject:forKey:", v125, *MEMORY[0x1E0D19688]);

    }
  }
  -[CSVoiceTriggerSecondPass audioProviderUUID](self, "audioProviderUUID");
  v126 = (void *)objc_claimAutoreleasedReturnValue();

  if (v126)
  {
    -[CSVoiceTriggerSecondPass audioProviderUUID](self, "audioProviderUUID");
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "setObject:forKey:", v127, *MEMORY[0x1E0D193E8]);

  }
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v128, "UUIDString");
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setObject:forKey:", v129, *MEMORY[0x1E0D19560]);

  secondPassLatencyMetrics = self->_secondPassLatencyMetrics;
  if (secondPassLatencyMetrics)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(MEMORY[0x1E0D19118], "hostTimeToNs:", -[CSVTSecondPassLatencyMetrics secondPassAssetQueryStartTime](secondPassLatencyMetrics, "secondPassAssetQueryStartTime")));
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "setObject:forKey:", v131, *MEMORY[0x1E0D19520]);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(MEMORY[0x1E0D19118], "hostTimeToNs:", -[CSVTSecondPassLatencyMetrics secondPassAssetQueryCompleteTime](self->_secondPassLatencyMetrics, "secondPassAssetQueryCompleteTime")));
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "setObject:forKey:", v132, *MEMORY[0x1E0D19518]);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(MEMORY[0x1E0D19118], "hostTimeToNs:", -[CSVTSecondPassLatencyMetrics secondPassAssetLoadStartTime](self->_secondPassLatencyMetrics, "secondPassAssetLoadStartTime")));
    v133 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "setObject:forKey:", v133, *MEMORY[0x1E0D19510]);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(MEMORY[0x1E0D19118], "hostTimeToNs:", -[CSVTSecondPassLatencyMetrics secondPassAssetLoadCompleteTime](self->_secondPassLatencyMetrics, "secondPassAssetLoadCompleteTime")));
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "setObject:forKey:", v134, *MEMORY[0x1E0D19508]);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(MEMORY[0x1E0D19118], "hostTimeToNs:", -[CSVTSecondPassLatencyMetrics secondPassAudioStreamStartTime](self->_secondPassLatencyMetrics, "secondPassAudioStreamStartTime")));
    v135 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "setObject:forKey:", v135, *MEMORY[0x1E0D19530]);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(MEMORY[0x1E0D19118], "hostTimeToNs:", -[CSVTSecondPassLatencyMetrics secondPassAudioStreamReadyTime](self->_secondPassLatencyMetrics, "secondPassAudioStreamReadyTime")));
    v136 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "setObject:forKey:", v136, *MEMORY[0x1E0D19528]);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(MEMORY[0x1E0D19118], "hostTimeToNs:", -[CSVTSecondPassLatencyMetrics secondPassFirstAudioPacketReceptionTime](self->_secondPassLatencyMetrics, "secondPassFirstAudioPacketReceptionTime")));
    v137 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "setObject:forKey:", v137, *MEMORY[0x1E0D19548]);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(MEMORY[0x1E0D19118], "hostTimeToNs:", -[CSVTSecondPassLatencyMetrics secondPassLastAudioPacketReceptionTime](self->_secondPassLatencyMetrics, "secondPassLastAudioPacketReceptionTime")));
    v138 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "setObject:forKey:", v138, *MEMORY[0x1E0D19550]);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(MEMORY[0x1E0D19118], "hostTimeToNs:", -[CSVTSecondPassLatencyMetrics secondPassCheckerModelKeywordDetectionStartTime](self->_secondPassLatencyMetrics, "secondPassCheckerModelKeywordDetectionStartTime")));
    v139 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "setObject:forKey:", v139, *MEMORY[0x1E0D19540]);

    v140 = (void *)MEMORY[0x1E0CB37E8];
    v141 = (void *)MEMORY[0x1E0D19118];
    v142 = -[CSVTSecondPassLatencyMetrics secondPassCheckerModelKeywordDetectionEndTime](self->_secondPassLatencyMetrics, "secondPassCheckerModelKeywordDetectionEndTime");
    v143 = v141;
    v55 = v149;
    objc_msgSend(v140, "numberWithUnsignedLongLong:", objc_msgSend(v143, "hostTimeToNs:", v142));
    v144 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "setObject:forKey:", v144, *MEMORY[0x1E0D19538]);

  }
  return v47;
}

- (void)_addLosingPhraseResultstoVTEI:(id)a3 withLosingPhraseResults:(id)a4
{
  id v5;
  void *v6;
  unint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id obj;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v23 = a3;
  v5 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count") != -1)
  {
    v7 = 0;
    do
    {
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionary", v23);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObject:", v8);

      ++v7;
    }
    while (v7 < objc_msgSend(v5, "count") + 1);
  }
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = v5;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v26;
    v12 = *MEMORY[0x1E0D19698];
    v13 = *MEMORY[0x1E0D19778];
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v26 != v11)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        if (v15)
        {
          objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v15, "recognizerScore");
          objc_msgSend(v17, "numberWithFloat:");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setObject:forKey:", v18, v12);

          v19 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v15, "combinedScore");
          objc_msgSend(v19, "numberWithFloat:");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setObject:forKey:", v20, v13);

          v21 = (void *)objc_msgSend(v16, "copy");
          objc_msgSend(v6, "setObject:atIndexedSubscript:", v21, objc_msgSend(v15, "phId"));

        }
      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v10);
  }

  if (objc_msgSend(v6, "count"))
  {
    v22 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v23, "setObject:forKey:", v22, *MEMORY[0x1E0D194C0]);

  }
}

- (void)_setKeywordDetectorStartMachTime:(unint64_t)a3 detectorEndMachTime:(unint64_t)a4 lastAudioPacketAnalyzedMachTime:(unint64_t)a5
{
  CSVTSecondPassLatencyMetrics *secondPassLatencyMetrics;
  NSObject *v9;
  int v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  secondPassLatencyMetrics = self->_secondPassLatencyMetrics;
  if (secondPassLatencyMetrics)
  {
    -[CSVTSecondPassLatencyMetrics setSecondPassCheckerModelKeywordDetectionStartTime:](secondPassLatencyMetrics, "setSecondPassCheckerModelKeywordDetectionStartTime:", a3);
    -[CSVTSecondPassLatencyMetrics setSecondPassCheckerModelKeywordDetectionEndTime:](self->_secondPassLatencyMetrics, "setSecondPassCheckerModelKeywordDetectionEndTime:", a4);
    -[CSVTSecondPassLatencyMetrics setSecondPassLastAudioPacketReceptionTime:](self->_secondPassLatencyMetrics, "setSecondPassLastAudioPacketReceptionTime:", a5);
  }
  else
  {
    v9 = *MEMORY[0x1E0D18F58];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_ERROR))
    {
      v10 = 136315138;
      v11 = "-[CSVoiceTriggerSecondPass _setKeywordDetectorStartMachTime:detectorEndMachTime:lastAudioPacketAnalyzedMachTime:]";
      _os_log_error_impl(&dword_1C2614000, v9, OS_LOG_TYPE_ERROR, "%s nil second pass metrics instance", (uint8_t *)&v10, 0xCu);
    }
  }
}

- (void)_analyzeForChannel:(unint64_t)a3 keywordDetectorResult:(id)a4 losingPhraseResults:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  unint64_t v13;
  os_log_t *v14;
  NSObject *v15;
  BOOL v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  CSVoiceTriggerSecondPass *v20;
  void *v21;
  uint64_t v22;
  SSRSpeakerRecognitionController *speakerRecognitionController;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  os_log_t v28;
  NSObject *v29;
  void *v30;
  int v31;
  const char *v32;
  __int16 v33;
  unint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v9 = objc_msgSend(v7, "decision");
  if (v9)
  {
    v10 = v9;
    if (v9 == 1)
    {
      v11 = objc_msgSend(v7, "phId");
      -[CSVoiceTriggerSecondPassConfig phraseConfigs](self->_config, "phraseConfigs");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "count");

      v14 = (os_log_t *)MEMORY[0x1E0D18F58];
      v15 = *MEMORY[0x1E0D18F58];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT))
      {
        v31 = 136315394;
        v32 = "-[CSVoiceTriggerSecondPass _analyzeForChannel:keywordDetectorResult:losingPhraseResults:]";
        v33 = 2048;
        v34 = v13;
        _os_log_impl(&dword_1C2614000, v15, OS_LOG_TYPE_DEFAULT, "%s Asset config supports %lu phrase(s)", (uint8_t *)&v31, 0x16u);
      }
      v16 = v13 <= 1 || !self->_supportsMph;
      if (!v16 || !v11)
      {
        -[CSVoiceTriggerSecondPass _getVoiceTriggerInfoWithKeywordDetectorResult:](self, "_getVoiceTriggerInfoWithKeywordDetectorResult:", v7);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[CSVoiceTriggerSecondPass _addLosingPhraseResultstoVTEI:withLosingPhraseResults:](self, "_addLosingPhraseResultstoVTEI:withLosingPhraseResults:", v18, v8);
        -[CSPhraseDetector reset](self->_phraseDetector, "reset");
        speakerRecognitionController = self->_speakerRecognitionController;
        if (speakerRecognitionController)
        {
          if (!self->_isPSRAudioFlushed)
          {
            -[SSRSpeakerRecognitionController endAudio](speakerRecognitionController, "endAudio");
            self->_isPSRAudioFlushed = 1;
            speakerRecognitionController = self->_speakerRecognitionController;
          }
          -[SSRSpeakerRecognitionController getLatestSpeakerInfo](speakerRecognitionController, "getLatestSpeakerInfo");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "objectForKeyedSubscript:", *MEMORY[0x1E0DA8CE0]);
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          if (v25)
          {
            -[CSVoiceTriggerSecondPass _handlePHSResults:voiceTriggerEventInfo:forPhId:](self, "_handlePHSResults:voiceTriggerEventInfo:forPhId:", v24, v18, objc_msgSend(v7, "phId"));
          }
          else
          {
            v28 = *v14;
            if (os_log_type_enabled(*v14, OS_LOG_TYPE_DEFAULT))
            {
              v29 = v28;
              -[CSVoiceTriggerSecondPass UUID](self, "UUID");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              v31 = 136315394;
              v32 = "-[CSVoiceTriggerSecondPass _analyzeForChannel:keywordDetectorResult:losingPhraseResults:]";
              v33 = 2114;
              v34 = (unint64_t)v30;
              _os_log_impl(&dword_1C2614000, v29, OS_LOG_TYPE_DEFAULT, "%s CSVoiceTriggerSecondPass[%{public}@]:PHS Scores not available, ignoring for now !", (uint8_t *)&v31, 0x16u);

            }
            -[CSVoiceTriggerSecondPass _handleSecondPassSuccess:](self, "_handleSecondPassSuccess:", v18);
          }

        }
        else
        {
          +[CSVoiceTriggerStatistics sharedInstance](CSVoiceTriggerStatistics, "sharedInstance");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "resetPHSRejectCount");

          -[CSVoiceTriggerSecondPass _handleSecondPassSuccess:](self, "_handleSecondPassSuccess:", v18);
        }
        goto LABEL_29;
      }
      v17 = *v14;
      if (os_log_type_enabled(*v14, OS_LOG_TYPE_DEFAULT))
      {
        v31 = 136315138;
        v32 = "-[CSVoiceTriggerSecondPass _analyzeForChannel:keywordDetectorResult:losingPhraseResults:]";
        _os_log_impl(&dword_1C2614000, v17, OS_LOG_TYPE_DEFAULT, "%s Report as rejection since the detected phId is not the default", (uint8_t *)&v31, 0xCu);
      }
      -[CSVoiceTriggerSecondPass _getVoiceTriggerInfoWithKeywordDetectorResult:](self, "_getVoiceTriggerInfoWithKeywordDetectorResult:", v7);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[CSVoiceTriggerSecondPass _addLosingPhraseResultstoVTEI:withLosingPhraseResults:](self, "_addLosingPhraseResultstoVTEI:withLosingPhraseResults:", v18, v8);
    }
    else
    {
      -[CSVoiceTriggerSecondPass _getVoiceTriggerInfoWithKeywordDetectorResult:](self, "_getVoiceTriggerInfoWithKeywordDetectorResult:", v7);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[CSVoiceTriggerSecondPass _addLosingPhraseResultstoVTEI:withLosingPhraseResults:](self, "_addLosingPhraseResultstoVTEI:withLosingPhraseResults:", v18, v8);
      if (v10 == 2)
      {
        -[CSPhraseDetector reset](self->_phraseDetector, "reset");
        +[CSVoiceTriggerDataCollector sharedInstance](CSVoiceTriggerDataCollector, "sharedInstance");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "addVTRejectEntry:truncateData:", v18, 1);

        v19 = objc_msgSend(v7, "isSecondChanceCandidate");
        v20 = self;
        v21 = v18;
        v22 = 3;
        goto LABEL_23;
      }
      if (v10 != 3)
      {
LABEL_29:
        -[CSVoiceTriggerSecondPass _resetVoiceTriggerLatencyMetrics](self, "_resetVoiceTriggerLatencyMetrics");

        goto LABEL_30;
      }
    }
    -[CSPhraseDetector reset](self->_phraseDetector, "reset");
    self->_secondPassTimeout = 0;
    v19 = objc_msgSend(v7, "isSecondChanceCandidate");
    v20 = self;
    v21 = v18;
    v22 = 2;
LABEL_23:
    -[CSVoiceTriggerSecondPass _notifySecondPassReject:result:isSecondChanceCandidate:](v20, "_notifySecondPassReject:result:isSecondChanceCandidate:", v21, v22, v19);
    goto LABEL_29;
  }
LABEL_30:

}

- (void)voiceTriggerPhraseNDEAPIScorerDidDetectedKeyword:(id)a3 bestStartSampleCount:(unint64_t)a4 bestEndSampleCount:(unint64_t)a5
{
  float v6;
  float secondPassPrependingSec;
  float v8;
  void *v9;
  NSObject *v10;
  void *v11;
  unint64_t secondPassTimeout;
  float v13;
  float v14;
  unint64_t analyzerTrailingSamples;
  int v16;
  const char *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  int v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = (float)(a5 - a4);
  secondPassPrependingSec = self->_secondPassPrependingSec;
  objc_msgSend(MEMORY[0x1E0D19090], "inputRecordingSampleRate", a3);
  self->_secondPassTimeout = (unint64_t)(float)((float)(v6 + (float)(secondPassPrependingSec * v8))
                                                     + (float)self->_analyzerTrailingSamples);
  v9 = (void *)*MEMORY[0x1E0D18F58];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT))
  {
    v10 = v9;
    -[CSVoiceTriggerSecondPass UUID](self, "UUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    secondPassTimeout = self->_secondPassTimeout;
    v13 = self->_secondPassPrependingSec;
    objc_msgSend(MEMORY[0x1E0D19090], "inputRecordingSampleRate");
    analyzerTrailingSamples = self->_analyzerTrailingSamples;
    v16 = 136316162;
    v17 = "-[CSVoiceTriggerSecondPass voiceTriggerPhraseNDEAPIScorerDidDetectedKeyword:bestStartSampleCount:bestEndSampleCount:]";
    v18 = 2114;
    v19 = v11;
    v20 = 1026;
    v21 = secondPassTimeout;
    v22 = 1026;
    v23 = (int)(float)(v13 * v14);
    v24 = 1026;
    v25 = analyzerTrailingSamples;
    _os_log_impl(&dword_1C2614000, v10, OS_LOG_TYPE_DEFAULT, "%s CSVoiceTriggerSecondPass[%{public}@]:Setting secondPassTimeout = %{public}d, PrependingSamples = %{public}d, analyzerTrailingSamples = %{public}d", (uint8_t *)&v16, 0x28u);

  }
}

- (void)_reportModelProcessingLatency
{
  void *v3;
  NSObject *v4;
  void *v5;
  unint64_t secondPassCheckerExecutionTime;
  float v7;
  double v8;
  uint64_t v9;
  float v10;
  int v11;
  const char *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  unint64_t v16;
  __int16 v17;
  double v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  double v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = (void *)*MEMORY[0x1E0D18F58];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    -[CSVoiceTriggerSecondPass UUID](self, "UUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    secondPassCheckerExecutionTime = self->_secondPassCheckerExecutionTime;
    objc_msgSend(MEMORY[0x1E0D19118], "hostTimeToSeconds:", secondPassCheckerExecutionTime);
    v8 = v7;
    v9 = -[SSRSpeakerRecognitionController getPSRProcessingTime](self->_speakerRecognitionController, "getPSRProcessingTime");
    objc_msgSend(MEMORY[0x1E0D19118], "hostTimeToSeconds:", -[SSRSpeakerRecognitionController getPSRProcessingTime](self->_speakerRecognitionController, "getPSRProcessingTime"));
    v11 = 136316418;
    v12 = "-[CSVoiceTriggerSecondPass _reportModelProcessingLatency]";
    v13 = 2114;
    v14 = v5;
    v15 = 2048;
    v16 = secondPassCheckerExecutionTime;
    v17 = 2048;
    v18 = v8;
    v19 = 2048;
    v20 = v9;
    v21 = 2048;
    v22 = v10;
    _os_log_impl(&dword_1C2614000, v4, OS_LOG_TYPE_DEFAULT, "%s CSVoiceTriggerSecondPass[%{public}@]:secondPassChecker processing time: %lu, %.3f seconds\n speakerRecognition processing time: %lu, %.3f seconds", (uint8_t *)&v11, 0x3Eu);

  }
}

- (void)_handleSecondPassSuccess:(id)a3
{
  id v4;
  os_log_t *v5;
  void *v6;
  NSObject *v7;
  char *v8;
  uint64_t v9;
  os_log_t v10;
  NSObject *v11;
  char *v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  void *v17;
  void *v18;
  unint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  id *v39;
  os_signpost_id_t v40;
  NSObject *v41;
  NSObject *v42;
  void *v43;
  uint64_t v44;
  NSObject *v45;
  void *v46;
  const char *v47;
  os_log_t v48;
  void *v49;
  NSObject *v50;
  float v51;
  void *v52;
  unint64_t v53;
  unint64_t firstPassFireHostTime;
  const char *v55;
  os_signpost_id_t v56;
  NSObject *v57;
  NSObject *v58;
  NSObject *v59;
  unint64_t v60;
  os_log_t v61;
  void *v62;
  NSObject *v63;
  float v64;
  os_log_t v65;
  const char *v66;
  void *v67;
  NSObject *v68;
  float v69;
  int v70;
  const char *v71;
  __int16 v72;
  const char *v73;
  __int16 v74;
  double v75;
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (os_log_t *)MEMORY[0x1E0D18F58];
  v6 = (void *)*MEMORY[0x1E0D18F58];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    -[CSVoiceTriggerSecondPass UUID](self, "UUID");
    v8 = (char *)objc_claimAutoreleasedReturnValue();
    v70 = 136315394;
    v71 = "-[CSVoiceTriggerSecondPass _handleSecondPassSuccess:]";
    v72 = 2114;
    v73 = v8;
    _os_log_impl(&dword_1C2614000, v7, OS_LOG_TYPE_DEFAULT, "%s CSVoiceTriggerSecondPass[%{public}@]:", (uint8_t *)&v70, 0x16u);

  }
  -[CSVoiceTriggerSecondPass _reportModelProcessingLatency](self, "_reportModelProcessingLatency");
  v9 = mach_absolute_time();
  v10 = *v5;
  if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
  {
    v11 = v10;
    -[CSVoiceTriggerSecondPass UUID](self, "UUID");
    v12 = (char *)objc_claimAutoreleasedReturnValue();
    v70 = 136315650;
    v71 = "-[CSVoiceTriggerSecondPass _handleSecondPassSuccess:]";
    v72 = 2114;
    v73 = v12;
    v74 = 2048;
    v75 = *(double *)&v9;
    _os_log_impl(&dword_1C2614000, v11, OS_LOG_TYPE_DEFAULT, "%s CSVoiceTriggerSecondPass[%{public}@]:Marking SecondPassTriggerMachAbsoluteTime: %llu", (uint8_t *)&v70, 0x20u);

  }
  self->_secondPassHasMadeDecision = 1;
  kdebug_trace();
  v13 = (void *)objc_msgSend(v4, "mutableCopy");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKey:", v14, *MEMORY[0x1E0D19758]);

  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D19590]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "unsignedIntegerValue");

  -[CSVoiceTriggerSecondPass config](self, "config");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "phraseConfigs");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "count");

  v20 = 0;
  if (v19 > v16)
  {
    -[CSVoiceTriggerSecondPass config](self, "config");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "phraseConfigs");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "objectAtIndex:", v16);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      v23 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v20, "twoShotFeedbackDelay");
      objc_msgSend(v23, "numberWithFloat:");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = *MEMORY[0x1E0D197A0];
      objc_msgSend(v13, "setObject:forKey:", v24, *MEMORY[0x1E0D197A0]);

      if (self->_firstPassSource == 7)
      {
        v26 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v20, "remoraTwoShotFeedbackDelay");
        objc_msgSend(v26, "numberWithFloat:");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setObject:forKey:", v27, v25);

      }
    }
  }
  v28 = (void *)MEMORY[0x1E0CB37E8];
  -[CSPhraseNDEAPIScorer currentShadowMicScore](self->_phraseNDEAPIScorer, "currentShadowMicScore");
  objc_msgSend(v28, "numberWithDouble:");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKey:", v29, *MEMORY[0x1E0D19568]);

  v30 = (void *)MEMORY[0x1E0CB37E8];
  -[CSPhraseNDEAPIScorer shadowMicScoreThresholdForVAD](self->_phraseNDEAPIScorer, "shadowMicScoreThresholdForVAD");
  objc_msgSend(v30, "numberWithFloat:");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKey:", v31, *MEMORY[0x1E0D19570]);

  -[CSVoiceTriggerSecondPass _addDeviceStatusInfoToDict:](self, "_addDeviceStatusInfoToDict:", v13);
  v32 = v13;

  -[CSVoiceTriggerSecondPass _resetUpTime](self, "_resetUpTime");
  -[CSVoiceTriggerAwareZeroFilter flush](self->_zeroFilter, "flush");
  -[CSVoiceTriggerSecondPass _didStopAudioStream](self, "_didStopAudioStream");
  -[CSVoiceTriggerSecondPass _handleResultCompletion:voiceTriggerInfo:isSecondChanceCandidate:error:](self, "_handleResultCompletion:voiceTriggerInfo:isSecondChanceCandidate:error:", 1, v32, 0, 0);
  -[CSVoiceTriggerSecondPass audioStream](self, "audioStream");
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (v33)
  {
    -[CSVoiceTriggerSecondPass audioStream](self, "audioStream");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "stopAudioStreamWithOption:completion:", 0, 0);

  }
  else
  {
    v35 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
    {
      v70 = 136315138;
      v71 = "-[CSVoiceTriggerSecondPass _handleSecondPassSuccess:]";
      _os_log_impl(&dword_1C2614000, v35, OS_LOG_TYPE_DEFAULT, "%s audioStream not existing", (uint8_t *)&v70, 0xCu);
    }
  }
  +[CSVoiceTriggerDataCollector sharedInstance](CSVoiceTriggerDataCollector, "sharedInstance");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "addVTAcceptEntryAndSubmit:", v32);

  v37 = *MEMORY[0x1E0D19728];
  objc_msgSend(v32, "objectForKeyedSubscript:", *MEMORY[0x1E0D19728]);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  if (v38)
  {
    v39 = (id *)MEMORY[0x1E0D18F60];
    v40 = os_signpost_id_generate((os_log_t)*MEMORY[0x1E0D18F60]);
    v41 = *v39;
    v42 = v41;
    if (v40 - 1 > 0xFFFFFFFFFFFFFFFDLL)
    {

      v45 = *v39;
    }
    else
    {
      if (os_signpost_enabled(v41))
      {
        objc_msgSend(v32, "objectForKeyedSubscript:", v37);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = objc_msgSend(v43, "unsignedLongLongValue");
        v70 = 134349570;
        v71 = (const char *)v44;
        v72 = 2080;
        v73 = "SiriX";
        v74 = 2080;
        v75 = COERCE_DOUBLE("enableTelemetry=YES");
        _os_signpost_emit_with_name_impl(&dword_1C2614000, v42, OS_SIGNPOST_INTERVAL_BEGIN, v40, "VoiceTriggerLatency", "%{public, signpost.description:begin_time}llu, %s %s", (uint8_t *)&v70, 0x20u);

      }
      v45 = *v39;
      if (os_signpost_enabled(v45))
      {
        v70 = 134349570;
        v71 = (const char *)v9;
        v72 = 2080;
        v73 = "SiriX";
        v74 = 2080;
        v75 = COERCE_DOUBLE("enableTelemetry=YES");
        _os_signpost_emit_with_name_impl(&dword_1C2614000, v45, OS_SIGNPOST_INTERVAL_END, v40, "VoiceTriggerLatency", "%{public, signpost.description:end_time}llu, %s %s", (uint8_t *)&v70, 0x20u);
      }
    }

    objc_msgSend(v32, "objectForKeyedSubscript:", v37);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = (const char *)(v9 - objc_msgSend(v46, "unsignedLongValue"));

    v48 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
    {
      v49 = (void *)MEMORY[0x1E0D19118];
      v50 = v48;
      objc_msgSend(v49, "hostTimeToSeconds:", v47);
      v70 = 136315650;
      v71 = "-[CSVoiceTriggerSecondPass _handleSecondPassSuccess:]";
      v72 = 2048;
      v73 = v47;
      v74 = 2048;
      v75 = v51;
      _os_log_impl(&dword_1C2614000, v50, OS_LOG_TYPE_DEFAULT, "%s Reporting VT Latency: %lu, %.3f seconds", (uint8_t *)&v70, 0x20u);

    }
    objc_msgSend(v32, "objectForKeyedSubscript:", v37);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = objc_msgSend(v52, "unsignedLongValue");

    objc_msgSend(MEMORY[0x1E0D19118], "hostTimeToSeconds:", v47);
    -[CSVoiceTriggerSecondPass _reportDiagnosticsForDelayedVTLaunchIfNeeded:](self, "_reportDiagnosticsForDelayedVTLaunchIfNeeded:");
    firstPassFireHostTime = self->_firstPassFireHostTime;
    if (firstPassFireHostTime)
    {
      v55 = (const char *)(v53 - firstPassFireHostTime);
      if (v53 >= firstPassFireHostTime)
      {
        v61 = *v5;
        if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
        {
          v62 = (void *)MEMORY[0x1E0D19118];
          v63 = v61;
          objc_msgSend(v62, "hostTimeToSeconds:", v55);
          v70 = 136315650;
          v71 = "-[CSVoiceTriggerSecondPass _handleSecondPassSuccess:]";
          v72 = 2048;
          v73 = v55;
          v74 = 2048;
          v75 = v64;
          _os_log_impl(&dword_1C2614000, v63, OS_LOG_TYPE_DEFAULT, "%s Reporting First Pass fire ahead: %lu, %.3f seconds", (uint8_t *)&v70, 0x20u);

        }
      }
      else
      {
        v56 = os_signpost_id_generate((os_log_t)*v39);
        v57 = *v39;
        v58 = v57;
        if (v56 - 1 > 0xFFFFFFFFFFFFFFFDLL)
        {

          v59 = *v39;
        }
        else
        {
          if (os_signpost_enabled(v57))
          {
            v70 = 134349570;
            v71 = (const char *)v53;
            v72 = 2080;
            v73 = "SiriX";
            v74 = 2080;
            v75 = COERCE_DOUBLE("enableTelemetry=YES");
            _os_signpost_emit_with_name_impl(&dword_1C2614000, v58, OS_SIGNPOST_INTERVAL_BEGIN, v56, "firstPassReportFireLatency", "%{public, signpost.description:begin_time}llu, %s %s", (uint8_t *)&v70, 0x20u);
          }

          v59 = *v39;
          if (os_signpost_enabled(v59))
          {
            v60 = self->_firstPassFireHostTime;
            v70 = 134349570;
            v71 = (const char *)v60;
            v72 = 2080;
            v73 = "SiriX";
            v74 = 2080;
            v75 = COERCE_DOUBLE("enableTelemetry=YES");
            _os_signpost_emit_with_name_impl(&dword_1C2614000, v59, OS_SIGNPOST_INTERVAL_END, v56, "firstPassReportFireLatency", "%{public, signpost.description:end_time}llu, %s %s", (uint8_t *)&v70, 0x20u);
          }
        }

        v65 = *v5;
        if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
        {
          v66 = (const char *)(self->_firstPassFireHostTime - v53);
          v67 = (void *)MEMORY[0x1E0D19118];
          v68 = v65;
          objc_msgSend(v67, "hostTimeToSeconds:", v66);
          v70 = 136315650;
          v71 = "-[CSVoiceTriggerSecondPass _handleSecondPassSuccess:]";
          v72 = 2048;
          v73 = v66;
          v74 = 2048;
          v75 = v69;
          _os_log_impl(&dword_1C2614000, v68, OS_LOG_TYPE_DEFAULT, "%s Reporting First Pass fire delay: %lu, %.3f seconds", (uint8_t *)&v70, 0x20u);

        }
      }
    }
  }

}

- (void)_reportDiagnosticsForDelayedVTLaunchIfNeeded:(float)a3
{
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  double v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (a3 > 20.0)
  {
    v5 = (void *)*MEMORY[0x1E0D18F58];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_ERROR))
    {
      v7 = v5;
      -[CSVoiceTriggerSecondPass _getAudioTimeConverter](self, "_getAudioTimeConverter");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "description");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 136315650;
      v11 = "-[CSVoiceTriggerSecondPass _reportDiagnosticsForDelayedVTLaunchIfNeeded:]";
      v12 = 2048;
      v13 = a3;
      v14 = 2112;
      v15 = v9;
      _os_log_error_impl(&dword_1C2614000, v7, OS_LOG_TYPE_ERROR, "%s Report unexpectedly long launch latency %{publlic}.3f AudioTimeConverter: %@", (uint8_t *)&v10, 0x20u);

    }
    objc_msgSend(MEMORY[0x1E0D190B8], "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "submitVoiceTriggerIssueReport:", *MEMORY[0x1E0D193B8]);

  }
}

- (void)_logUptimeWithVTSwitchChanged:(BOOL)a3 VTEnabled:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  double v7;
  double v8;
  double lastAggTime;
  double v10;
  void *v11;
  NSObject *v12;
  void *v13;
  const char *v14;
  void *v15;
  int v16;
  const char *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  double v21;
  uint64_t v22;

  v4 = a4;
  v5 = a3;
  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D19260], "systemUpTime");
  v8 = v7;
  lastAggTime = self->_lastAggTime;
  if (lastAggTime > 0.0)
  {
    v10 = v8 - lastAggTime;
    if (v5)
    {
      if (v4)
      {
        self->_cumulativeDowntime = v10 + self->_cumulativeDowntime;
        v11 = (void *)*MEMORY[0x1E0D18F58];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT))
        {
          v12 = v11;
          -[CSVoiceTriggerSecondPass UUID](self, "UUID");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = 136315650;
          v17 = "-[CSVoiceTriggerSecondPass _logUptimeWithVTSwitchChanged:VTEnabled:]";
          v18 = 2114;
          v19 = v13;
          v20 = 2050;
          v21 = v10;
          v14 = "%s CSVoiceTriggerSecondPass[%{public}@]:VT switch toggled: VoiceTrigger has been INACTIVE for an interva"
                "l of %{public}5.3f seconds.";
LABEL_10:
          _os_log_impl(&dword_1C2614000, v12, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v16, 0x20u);

        }
      }
      else
      {
        self->_cumulativeUptime = v10 + self->_cumulativeUptime;
        v15 = (void *)*MEMORY[0x1E0D18F58];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT))
        {
          v12 = v15;
          -[CSVoiceTriggerSecondPass UUID](self, "UUID");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = 136315650;
          v17 = "-[CSVoiceTriggerSecondPass _logUptimeWithVTSwitchChanged:VTEnabled:]";
          v18 = 2114;
          v19 = v13;
          v20 = 2050;
          v21 = v10;
          v14 = "%s CSVoiceTriggerSecondPass[%{public}@]:VT switch toggled: VoiceTrigger has been ACTIVE for an interval "
                "of %{public}5.3f seconds.";
          goto LABEL_10;
        }
      }
    }
    else if (v4)
    {
      self->_cumulativeUptime = v10 + self->_cumulativeUptime;
    }
    else
    {
      self->_cumulativeDowntime = v10 + self->_cumulativeDowntime;
    }
  }
  self->_lastAggTime = v8;
}

- (void)_resetUpTime
{
  void *v3;
  NSObject *v4;
  void *v5;
  int v6;
  const char *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  self->_cumulativeUptime = 0.0;
  self->_cumulativeDowntime = 0.0;
  v3 = (void *)*MEMORY[0x1E0D18F58];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    -[CSVoiceTriggerSecondPass UUID](self, "UUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 136315394;
    v7 = "-[CSVoiceTriggerSecondPass _resetUpTime]";
    v8 = 2114;
    v9 = v5;
    _os_log_impl(&dword_1C2614000, v4, OS_LOG_TYPE_DEFAULT, "%s CSVoiceTriggerSecondPass[%{public}@]:VoiceTrigger uptime/downtime reset", (uint8_t *)&v6, 0x16u);

  }
}

- (void)CSVoiceTriggerEnabledMonitor:(id)a3 didReceiveEnabled:(BOOL)a4
{
  NSObject *queue;
  _QWORD v5[5];
  BOOL v6;

  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __75__CSVoiceTriggerSecondPass_CSVoiceTriggerEnabledMonitor_didReceiveEnabled___block_invoke;
  v5[3] = &unk_1E7C28480;
  v5[4] = self;
  v6 = a4;
  dispatch_async(queue, v5);
}

- (void)_handleVoiceTriggerFirstPassFromAOP:(id)a3 audioProviderUUID:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  unint64_t v11;
  unint64_t v12;
  float v13;
  float v14;
  float v15;
  id *v16;
  NSObject *v17;
  float v18;
  float v19;
  float v20;
  NSObject *v21;
  id v22;
  unint64_t v23;
  float v24;
  int v25;
  void *v26;
  int v27;
  NSObject *v28;
  void *v29;
  CSVoiceTriggerAwareZeroFilter *v30;
  CSVoiceTriggerAwareZeroFilter *zeroFilter;
  CSVoiceTriggerAwareZeroFilter *v32;
  id v33;
  void *v34;
  id v35;
  id v36;
  unint64_t secondPassTimeout;
  float v38;
  float v39;
  float v40;
  _QWORD v41[4];
  id v42;
  _QWORD v43[6];
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t v51;
  uint8_t buf[4];
  const char *v53;
  __int16 v54;
  id v55;
  __int16 v56;
  double v57;
  __int16 v58;
  double v59;
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_msgSend(MEMORY[0x1E0D19090], "channelForProcessedInput");
  self->_activeChannel = v11;
  -[CSPhraseDetector setActiveChannel:](self->_phraseDetector, "setActiveChannel:", v11);
  v48 = 0;
  v49 = &v48;
  v50 = 0x2020000000;
  v51 = 0;
  v44 = 0;
  v45 = &v44;
  v46 = 0x2020000000;
  v47 = 0;
  v43[0] = MEMORY[0x1E0C809B0];
  v43[1] = 3221225472;
  v43[2] = __93__CSVoiceTriggerSecondPass__handleVoiceTriggerFirstPassFromAOP_audioProviderUUID_completion___block_invoke;
  v43[3] = &unk_1E7C239B0;
  v43[4] = &v48;
  v43[5] = &v44;
  -[CSVoiceTriggerSecondPass _calculateRecordingTimeForAOPTriggerFromFirstPassInfo:completion:](self, "_calculateRecordingTimeForAOPTriggerFromFirstPassInfo:completion:", v8, v43);
  v12 = v45[3];
  self->_secondPassTimeout = v12;
  objc_msgSend(MEMORY[0x1E0D19090], "inputRecordingDurationInSecs");
  v14 = v13;
  objc_msgSend(MEMORY[0x1E0D19090], "inputRecordingSampleRate");
  v16 = (id *)MEMORY[0x1E0D18F58];
  if ((float)(v14 * v15) < (float)v12)
  {
    v17 = (id)*MEMORY[0x1E0D18F58];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      -[CSVoiceTriggerSecondPass UUID](self, "UUID");
      v36 = (id)objc_claimAutoreleasedReturnValue();
      secondPassTimeout = self->_secondPassTimeout;
      objc_msgSend(MEMORY[0x1E0D19090], "inputRecordingSampleRate");
      v39 = v38;
      objc_msgSend(MEMORY[0x1E0D19090], "inputRecordingDurationInSecs");
      *(_DWORD *)buf = 136315906;
      v53 = "-[CSVoiceTriggerSecondPass _handleVoiceTriggerFirstPassFromAOP:audioProviderUUID:completion:]";
      v54 = 2114;
      v55 = v36;
      v56 = 2050;
      v57 = (float)((float)secondPassTimeout / v39);
      v58 = 2050;
      v59 = v40;
      _os_log_error_impl(&dword_1C2614000, v17, OS_LOG_TYPE_ERROR, "%s CSVoiceTriggerSecondPass[%{public}@]:Second pass timeout (%{public}.2fs) should not exceed the max size of %{public}.2fs, set to max size", buf, 0x2Au);

    }
    objc_msgSend(MEMORY[0x1E0D19090], "inputRecordingDurationInSecs");
    v19 = v18;
    objc_msgSend(MEMORY[0x1E0D19090], "inputRecordingSampleRate");
    self->_secondPassTimeout = (unint64_t)(float)(v19 * v20);
  }
  v21 = *v16;
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    -[CSVoiceTriggerSecondPass UUID](self, "UUID");
    v22 = (id)objc_claimAutoreleasedReturnValue();
    v23 = self->_secondPassTimeout;
    objc_msgSend(MEMORY[0x1E0D19090], "inputRecordingSampleRate");
    *(_DWORD *)buf = 136315906;
    v53 = "-[CSVoiceTriggerSecondPass _handleVoiceTriggerFirstPassFromAOP:audioProviderUUID:completion:]";
    v54 = 2114;
    v55 = v22;
    v56 = 2050;
    v57 = *(double *)&v23;
    v58 = 2050;
    v59 = (float)((float)v23 / v24);
    _os_log_impl(&dword_1C2614000, v21, OS_LOG_TYPE_DEFAULT, "%s CSVoiceTriggerSecondPass[%{public}@]:Second pass set to analyze %{public}tu samples (%{public}.2fs)", buf, 0x2Au);

  }
  if (CSIsIOS() && (objc_msgSend(MEMORY[0x1E0D19260], "isDarwinOS") & 1) == 0)
    v25 = objc_msgSend(MEMORY[0x1E0D19260], "supportZeroFilter:", objc_msgSend(MEMORY[0x1E0D19090], "inputRecordingNumberOfChannels")) ^ 1;
  else
    v25 = 0;
  objc_msgSend(MEMORY[0x1E0D19110], "sharedPreferences");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "programmableAudioInjectionEnabled");

  if ((v25 & ~v27 & 1) != 0)
  {
    v28 = *v16;
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      -[CSVoiceTriggerSecondPass UUID](self, "UUID");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v53 = "-[CSVoiceTriggerSecondPass _handleVoiceTriggerFirstPassFromAOP:audioProviderUUID:completion:]";
      v54 = 2114;
      v55 = v29;
      _os_log_impl(&dword_1C2614000, v28, OS_LOG_TYPE_DEFAULT, "%s CSVoiceTriggerSecondPass[%{public}@]:Using zero filter for AOP trigger", buf, 0x16u);

    }
    v30 = (CSVoiceTriggerAwareZeroFilter *)objc_alloc_init(MEMORY[0x1E0D19278]);
    zeroFilter = self->_zeroFilter;
    self->_zeroFilter = v30;

    -[CSVoiceTriggerAwareZeroFilter setDelegate:](self->_zeroFilter, "setDelegate:", self);
    v32 = self->_zeroFilter;
    objc_msgSend(MEMORY[0x1E0D19090], "inputRecordingSampleRate");
    -[CSVoiceTriggerAwareZeroFilter resetWithSampleRate:containsVoiceTrigger:voiceTriggerInfo:](v32, "resetWithSampleRate:containsVoiceTrigger:voiceTriggerInfo:", 1, 0);
  }
  v33 = objc_alloc_init(MEMORY[0x1E0D19030]);
  objc_msgSend(v33, "setRequestHistoricalAudioDataWithHostTime:", 1);
  objc_msgSend(v33, "setStartRecordingHostTime:", v49[3]);
  objc_msgSend(v33, "setStartAlertBehavior:", 0);
  objc_msgSend(v33, "setStopAlertBehavior:", 0);
  objc_msgSend(v33, "setErrorAlertBehavior:", 0);
  objc_msgSend(MEMORY[0x1E0D19008], "contextForBuiltInVoiceTrigger");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v41[0] = MEMORY[0x1E0C809B0];
  v41[1] = 3221225472;
  v41[2] = __93__CSVoiceTriggerSecondPass__handleVoiceTriggerFirstPassFromAOP_audioProviderUUID_completion___block_invoke_105;
  v41[3] = &unk_1E7C290D8;
  v35 = v10;
  v42 = v35;
  -[CSVoiceTriggerSecondPass _requestStartAudioStreamWitContext:audioProviderUUID:startStreamOption:completion:](self, "_requestStartAudioStreamWitContext:audioProviderUUID:startStreamOption:completion:", v34, v9, v33, v41);
  -[CSVoiceTriggerSecondPass setResultCompletion:](self, "setResultCompletion:", v35);

  _Block_object_dispose(&v44, 8);
  _Block_object_dispose(&v48, 8);

}

- (void)_calculateRecordingTimeForAOPTriggerFromFirstPassInfo:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, unint64_t);
  uint64_t v8;
  double v9;
  uint64_t v10;
  float v11;
  float v12;
  void *v13;
  unint64_t v14;
  void *v15;
  uint64_t v16;
  float v17;
  float v18;
  float v19;
  void *v20;
  void *v21;
  unint64_t *p_AOPVTTriggerLength;
  unint64_t AOPVTTriggerLength;
  void *v24;
  NSObject *v25;
  void *v26;
  CSVoiceTriggerSecondPassConfig *config;
  unint64_t v28;
  void *v29;
  id v30;
  void *v31;
  float v32;
  float v33;
  uint64_t v34;
  float v35;
  float v36;
  float v37;
  double v38;
  void *v39;
  NSObject *v40;
  double v41;
  void *v42;
  uint64_t v43;
  float secondPassPrependingSec;
  float v45;
  void *v46;
  int v47;
  const char *v48;
  __int16 v49;
  void *v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, _QWORD, unint64_t))a4;
  v8 = mach_absolute_time();
  LODWORD(v9) = 1.5;
  v10 = objc_msgSend(MEMORY[0x1E0D19118], "secondsToHostTime:", v9);
  objc_msgSend(MEMORY[0x1E0D19090], "inputRecordingSampleRate");
  v12 = v11;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("trigger-time"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = 0x1E0D19000;
  if (!v13)
  {
    v16 = v8 - v10;
    AOPVTTriggerLength = (unint64_t)(float)(v12 * 1.5);
    v24 = (void *)*MEMORY[0x1E0D18F58];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_ERROR))
      goto LABEL_16;
    v25 = v24;
    -[CSVoiceTriggerSecondPass UUID](self, "UUID");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = 136315394;
    v48 = "-[CSVoiceTriggerSecondPass _calculateRecordingTimeForAOPTriggerFromFirstPassInfo:completion:]";
    v49 = 2114;
    v50 = v26;
    _os_log_error_impl(&dword_1C2614000, v25, OS_LOG_TYPE_ERROR, "%s CSVoiceTriggerSecondPass[%{public}@]:Failed to get AOP trigger-time", (uint8_t *)&v47, 0x16u);
    goto LABEL_14;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("trigger-time"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "unsignedLongLongValue");

  objc_msgSend(MEMORY[0x1E0D19118], "hostTimeToSeconds:", mach_absolute_time() - v16);
  v18 = v17;
  objc_msgSend(MEMORY[0x1E0D19090], "inputRecordingSampleRate");
  self->_timeBasedEstimatedTriggerLength = (unint64_t)(float)(v18 * v19);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("trigger-length"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("trigger-length"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    p_AOPVTTriggerLength = &self->_AOPVTTriggerLength;
    self->_AOPVTTriggerLength = objc_msgSend(v21, "unsignedLongValue");

  }
  else
  {
    p_AOPVTTriggerLength = &self->_AOPVTTriggerLength;
    self->_AOPVTTriggerLength = self->_timeBasedEstimatedTriggerLength;
  }

  AOPVTTriggerLength = self->_AOPVTTriggerLength;
  config = self->_config;
  v28 = AOPVTTriggerLength;
  if (!config)
  {
LABEL_10:
    if (v28 < 0x13881)
      goto LABEL_12;
    goto LABEL_11;
  }
  if ((-[CSVoiceTriggerSecondPassConfig useTimeBasedTriggerLength](config, "useTimeBasedTriggerLength") & 1) == 0)
  {
    v28 = *p_AOPVTTriggerLength;
    goto LABEL_10;
  }
LABEL_11:
  AOPVTTriggerLength = self->_timeBasedEstimatedTriggerLength;
LABEL_12:
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("trigger-config-blob"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
  {
    v30 = objc_alloc(MEMORY[0x1E0D19148]);
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("trigger-config-blob"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v30, "initWithBlob:isEarlyDetected:", v31, 0);

    objc_msgSend(MEMORY[0x1E0D19118], "hostTimeToSeconds:", mach_absolute_time() - v16);
    v33 = v32;
    v34 = -[NSObject samplesFed](v25, "samplesFed");
    v35 = (float)(unint64_t)(v34 - -[NSObject bestStart](v25, "bestStart"));
    objc_msgSend(MEMORY[0x1E0D19090], "inputRecordingSampleRate");
    v37 = v33 - (float)(v35 / v36);
    v14 = 0x1E0D19000uLL;
    objc_msgSend(MEMORY[0x1E0D192A8], "sharedAggregator");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)&v38 = v37;
    objc_msgSend(v26, "logAOPFirstPassTriggerWakeupLatency:", v38);
LABEL_14:

    goto LABEL_16;
  }
  v14 = 0x1E0D19000uLL;
LABEL_16:
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("trigger-length"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  if (v39)
  {
    objc_msgSend(*(id *)(v14 + 680), "sharedAggregator");
    v40 = objc_claimAutoreleasedReturnValue();
    -[NSObject logTimeBasedTriggerLengthSampleCountStatistics:withAOPVTTriggerLengthSampleCount:](v40, "logTimeBasedTriggerLengthSampleCountStatistics:withAOPVTTriggerLengthSampleCount:", self->_timeBasedEstimatedTriggerLength, self->_AOPVTTriggerLength);
LABEL_18:

    goto LABEL_20;
  }
  v42 = (void *)*MEMORY[0x1E0D18F58];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_ERROR))
  {
    v40 = v42;
    -[CSVoiceTriggerSecondPass UUID](self, "UUID");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = 136315394;
    v48 = "-[CSVoiceTriggerSecondPass _calculateRecordingTimeForAOPTriggerFromFirstPassInfo:completion:]";
    v49 = 2114;
    v50 = v46;
    _os_log_error_impl(&dword_1C2614000, v40, OS_LOG_TYPE_ERROR, "%s CSVoiceTriggerSecondPass[%{public}@]:Failed to get AOP trigger-length", (uint8_t *)&v47, 0x16u);

    goto LABEL_18;
  }
LABEL_20:
  *(float *)&v41 = self->_secondPassPrependingSec;
  v43 = objc_msgSend(MEMORY[0x1E0D19118], "secondsToHostTime:", v41);
  secondPassPrependingSec = self->_secondPassPrependingSec;
  objc_msgSend(MEMORY[0x1E0D19090], "inputRecordingSampleRate");
  if (v7)
    v7[2](v7, v16 - v43, (unint64_t)(float)((float)((float)AOPVTTriggerLength + (float)(secondPassPrependingSec * v45))+ (float)self->_analyzerTrailingSamples));

}

- (void)_addRejectStatsToDict:(id)a3
{
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  objc_msgSend(MEMORY[0x1E0D19260], "systemUpTime");
  v4 = v3;
  +[CSVoiceTriggerStatistics sharedInstance](CSVoiceTriggerStatistics, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "getLastPHSRejectTime");
  v7 = v6;

  +[CSVoiceTriggerStatistics sharedInstance](CSVoiceTriggerStatistics, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "getPHSRejectCount");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKey:", v10, *MEMORY[0x1E0D194B0]);

  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v4 - v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKey:", v11, *MEMORY[0x1E0D19400]);

  }
  else
  {
    objc_msgSend(v12, "setObject:forKey:", &unk_1E7C634A0, *MEMORY[0x1E0D19400]);
  }

}

- (void)_addDeviceStatusInfoToDict:(id)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0D19780]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "longLongValue");

  if (v4)
  {
    +[CSGestureMonitor sharedInstance](CSGestureMonitor, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isTriggerHandheld");

    +[CSSiriAssertionMonitor sharedInstance](CSSiriAssertionMonitor, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEnabled");

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", v9, *MEMORY[0x1E0D19408]);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", v10, *MEMORY[0x1E0D19580]);

  }
}

- (void)_getDidWakeAP:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  void *v7;

  self->_didWakeAP = 0;
  if (a3)
  {
    objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("trigger-woke-ap"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      v7 = v4;
      v6 = objc_msgSend(v4, "BOOLValue");
      v5 = v7;
      if (v6)
        self->_didWakeAP = 1;
    }

  }
}

- (void)_addPHSInfoToVTEI:(id)a3 fromSpeakerInfo:(id)a4 withThreshold:(float)a5
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  int v22;
  void *v23;
  int v24;
  int v25;
  void *v26;
  int v27;
  int v28;
  double v29;
  void *v30;
  double v31;
  void *v32;
  double v33;
  void *v34;
  double v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  int v43;
  int v44;
  double v45;
  void *v46;
  double v47;
  void *v48;
  uint64_t v49;
  void *v50;
  _QWORD *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  uint64_t v66;
  void *v67;
  uint64_t v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  uint64_t v74;
  void *v75;
  uint64_t v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  int v82;
  int v83;
  double v84;
  void *v85;
  uint64_t v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  int v92;
  int v93;
  double v94;
  void *v95;
  NSObject *v96;
  int v97;
  const char *v98;
  __int16 v99;
  id v100;
  uint64_t v101;

  v101 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = *MEMORY[0x1E0DA8CE0];
  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0DA8CE0]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
    goto LABEL_38;
  objc_msgSend(v8, "objectForKeyedSubscript:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "allKeys");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "firstObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v14 = *MEMORY[0x1E0DA8CC8];
    objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0DA8CC8]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_msgSend(v8, "objectForKeyedSubscript:", v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v16;
      if (v16)
      {
        objc_msgSend(v16, "objectForKeyedSubscript:", v13);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (v18)
        {
          objc_msgSend(v8, "objectForKeyedSubscript:", v9);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "objectForKeyedSubscript:", v13);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "floatValue");
          v22 = v21;

          objc_msgSend(v17, "objectForKeyedSubscript:", v13);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "floatValue");
          v25 = v24;

          objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0DA8CB8]);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "floatValue");
          v28 = v27;

          LODWORD(v29) = v22;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v29);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "setObject:forKey:", v30, *MEMORY[0x1E0D196E0]);

          LODWORD(v31) = v25;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v31);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "setObject:forKey:", v32, *MEMORY[0x1E0D196F0]);

          *(float *)&v33 = a5;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v33);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "setObject:forKey:", v34, *MEMORY[0x1E0D196E8]);

          LODWORD(v35) = v28;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v35);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "setObject:forKey:", v36, *MEMORY[0x1E0D196D8]);

        }
      }

    }
    v37 = *MEMORY[0x1E0DA8CD8];
    objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0DA8CD8]);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    if (v38)
    {
      objc_msgSend(v8, "objectForKeyedSubscript:", v37);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = v39;
      if (v39)
      {
        objc_msgSend(v39, "objectForKeyedSubscript:", v13);
        v41 = (void *)objc_claimAutoreleasedReturnValue();

        if (v41)
        {
          objc_msgSend(v40, "objectForKeyedSubscript:", v13);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "floatValue");
          v44 = v43;

          LODWORD(v45) = v44;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v45);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "setObject:forKey:", v46, *MEMORY[0x1E0D196B0]);

          *(float *)&v47 = a5;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v47);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "setObject:forKey:", v48, *MEMORY[0x1E0D196B8]);

        }
      }

    }
    v49 = *MEMORY[0x1E0DA8D18];
    objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0DA8D18]);
    v50 = (void *)objc_claimAutoreleasedReturnValue();

    v51 = (_QWORD *)MEMORY[0x1E0DA8D08];
    if (v50)
    {
      objc_msgSend(v8, "objectForKeyedSubscript:", v49);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "objectForKeyedSubscript:", *v51);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = v53;
      if (v53)
      {
        objc_msgSend(v53, "objectForKeyedSubscript:", v13);
        v55 = (void *)objc_claimAutoreleasedReturnValue();

        if (v55)
        {
          objc_msgSend(v54, "objectForKeyedSubscript:", v13);
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          v57 = objc_msgSend(v56, "unsignedIntegerValue");

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v57);
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "setObject:forKey:", v58, *MEMORY[0x1E0D196A8]);

        }
      }

    }
    v59 = *MEMORY[0x1E0DA8D10];
    objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0DA8D10]);
    v60 = (void *)objc_claimAutoreleasedReturnValue();

    if (v60)
    {
      objc_msgSend(v8, "objectForKeyedSubscript:", v59);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "objectForKeyedSubscript:", *v51);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = v62;
      if (v62)
      {
        objc_msgSend(v62, "objectForKeyedSubscript:", v13);
        v64 = (void *)objc_claimAutoreleasedReturnValue();

        if (v64)
        {
          objc_msgSend(v63, "objectForKeyedSubscript:", v13);
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          v66 = objc_msgSend(v65, "unsignedIntegerValue");

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v66);
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "setObject:forKey:", v67, *MEMORY[0x1E0D196A8]);

        }
      }

    }
    v68 = *MEMORY[0x1E0DA8CF0];
    objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0DA8CF0]);
    v69 = (void *)objc_claimAutoreleasedReturnValue();

    if (v69)
    {
      objc_msgSend(v8, "objectForKeyedSubscript:", v68);
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      v71 = v70;
      if (v70)
      {
        objc_msgSend(v70, "objectForKeyedSubscript:", v13);
        v72 = (void *)objc_claimAutoreleasedReturnValue();

        if (v72)
        {
          objc_msgSend(v71, "objectForKeyedSubscript:", v13);
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          v74 = objc_msgSend(v73, "unsignedIntegerValue");

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v74);
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "setObject:forKey:", v75, *MEMORY[0x1E0D194C8]);

        }
      }

    }
    v76 = *MEMORY[0x1E0DA8CC0];
    objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0DA8CC0]);
    v77 = (void *)objc_claimAutoreleasedReturnValue();

    if (v77)
    {
      objc_msgSend(v8, "objectForKeyedSubscript:", v76);
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      v79 = v78;
      if (v78)
      {
        objc_msgSend(v78, "objectForKeyedSubscript:", v13);
        v80 = (void *)objc_claimAutoreleasedReturnValue();

        if (v80)
        {
          objc_msgSend(v79, "objectForKeyedSubscript:", v13);
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v81, "floatValue");
          v83 = v82;

          LODWORD(v84) = v83;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v84);
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "setObject:forKey:", v85, *MEMORY[0x1E0D19750]);

        }
      }

    }
    v86 = *MEMORY[0x1E0DA8CD0];
    objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0DA8CD0]);
    v87 = (void *)objc_claimAutoreleasedReturnValue();

    if (v87)
    {
      objc_msgSend(v8, "objectForKeyedSubscript:", v86);
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      v89 = v88;
      if (v88)
      {
        objc_msgSend(v88, "objectForKeyedSubscript:", v13);
        v90 = (void *)objc_claimAutoreleasedReturnValue();

        if (v90)
        {
          objc_msgSend(v89, "objectForKeyedSubscript:", v13);
          v91 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v91, "floatValue");
          v93 = v92;

          LODWORD(v94) = v93;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v94);
          v95 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "setObject:forKey:", v95, *MEMORY[0x1E0D19748]);

        }
      }

    }
  }
  else
  {
LABEL_38:
    v96 = *MEMORY[0x1E0D18F58];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_ERROR))
    {
      v97 = 136315394;
      v98 = "-[CSVoiceTriggerSecondPass _addPHSInfoToVTEI:fromSpeakerInfo:withThreshold:]";
      v99 = 2112;
      v100 = v8;
      _os_log_error_impl(&dword_1C2614000, v96, OS_LOG_TYPE_ERROR, "%s ERR: No known voice profile reported in %@", (uint8_t *)&v97, 0x16u);
    }
    v13 = 0;
  }

}

- (void)_handlePHSResults:(id)a3 voiceTriggerEventInfo:(id)a4 forPhId:(unint64_t)a5
{
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  float v28;
  float v29;
  void *v30;
  void *v31;
  double v32;
  void *v33;
  void *v34;
  void *v35;
  float v36;
  float v37;
  void *v38;
  void *v39;
  void *v40;
  double v41;
  void *v42;
  void *v43;
  float v44;
  float v45;
  void *v46;
  void *v47;
  double v48;
  void *v49;
  void *v50;
  float v51;
  float v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  float v57;
  float v58;
  float v59;
  int v60;
  os_log_t *v61;
  void *v62;
  int v63;
  NSObject *v64;
  os_log_t v65;
  _BOOL4 v66;
  NSObject *v67;
  void *v68;
  void *v69;
  float v70;
  float v71;
  void *v72;
  unint64_t v73;
  void *v74;
  void *v75;
  void *v76;
  float v77;
  float v78;
  NSObject *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  NSObject *v85;
  void *v86;
  double v87;
  double v88;
  int v89;
  int v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  double v95;
  void *v96;
  void *v98;
  uint8_t buf[4];
  const char *v100;
  __int16 v101;
  void *v102;
  __int16 v103;
  double v104;
  __int16 v105;
  int v106;
  __int16 v107;
  int v108;
  __int16 v109;
  double v110;
  __int16 v111;
  double v112;
  __int16 v113;
  double v114;
  __int16 v115;
  double v116;
  __int16 v117;
  double v118;
  uint64_t v119;

  v119 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (void *)objc_msgSend(a4, "mutableCopy");
  v9 = *MEMORY[0x1E0DA8CE0];
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0DA8CE0]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0DA8CC8]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0DA8CD8]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0DA8CC0]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0DA8CD0]);
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "allValues");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "count");

  if (v15)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0DA8D10]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = *MEMORY[0x1E0DA8D08];
    objc_msgSend(v16, "objectForKeyedSubscript:", *MEMORY[0x1E0DA8D08]);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0DA8D18]);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectForKeyedSubscript:", v17);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v96 = v20;
    if (v18)
    {
      objc_msgSend(v18, "allValues");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "firstObject");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v90 = objc_msgSend(v22, "unsignedIntValue");

      v20 = v96;
    }
    else
    {
      v90 = -1;
    }
    v91 = v18;
    if (v20)
    {
      objc_msgSend(v20, "allValues");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "firstObject");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v89 = objc_msgSend(v25, "unsignedIntValue");

    }
    else
    {
      v89 = -1;
    }
    v95 = -1000.0;
    v92 = v10;
    objc_msgSend(v10, "allValues");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "firstObject");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "floatValue");
    v29 = v28;

    objc_msgSend(v11, "allValues");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "firstObject");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = -1000.0;
    v33 = v13;
    if (v31)
    {
      objc_msgSend(v11, "allValues");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "firstObject");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "floatValue");
      v37 = v36;

      v13 = v33;
      v32 = v37;
    }
    v88 = v32;
    v94 = v11;

    objc_msgSend(v12, "allValues");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "firstObject");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = v12;
    v41 = -1000.0;
    if (v39)
    {
      objc_msgSend(v40, "allValues");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "firstObject");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "floatValue");
      v45 = v44;

      v13 = v33;
      v41 = v45;
    }
    v93 = v40;

    objc_msgSend(v13, "allValues");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "firstObject");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = -1000.0;
    if (v47)
    {
      objc_msgSend(v13, "allValues");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "firstObject");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "floatValue");
      v52 = v51;

      v48 = v52;
    }

    objc_msgSend(v98, "allValues");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "firstObject");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    if (v54)
    {
      objc_msgSend(v98, "allValues");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "firstObject");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "floatValue");
      v95 = v57;

    }
    -[CSAsset satScoreThresholdForPhId:](self->_currentAsset, "satScoreThresholdForPhId:", a5);
    v59 = v58;
    -[CSVoiceTriggerSecondPass _addPHSInfoToVTEI:fromSpeakerInfo:withThreshold:](self, "_addPHSInfoToVTEI:fromSpeakerInfo:withThreshold:", v8, v7);
    -[CSVoiceTriggerSecondPass _addRejectStatsToDict:](self, "_addRejectStatsToDict:", v8);
    v60 = CSIsInternalBuild();
    v61 = (os_log_t *)MEMORY[0x1E0D18F58];
    if (v60)
    {
      objc_msgSend(MEMORY[0x1E0D19110], "sharedPreferences");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = objc_msgSend(v62, "isReducedPHSThresholdEnabled");

      if (v63)
      {
        v64 = *v61;
        v59 = 0.0;
        if (os_log_type_enabled(*v61, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315138;
          v100 = "-[CSVoiceTriggerSecondPass _handlePHSResults:voiceTriggerEventInfo:forPhId:]";
          _os_log_impl(&dword_1C2614000, v64, OS_LOG_TYPE_INFO, "%s Override PHS threshold to 0", buf, 0xCu);
        }
      }
    }
    v65 = *v61;
    v66 = os_log_type_enabled(*v61, OS_LOG_TYPE_DEFAULT);
    if (v29 >= v59)
    {
      v13 = v33;
      v74 = v91;
      if (v66)
      {
        v79 = v65;
        -[CSVoiceTriggerSecondPass UUID](self, "UUID");
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136317442;
        v100 = "-[CSVoiceTriggerSecondPass _handlePHSResults:voiceTriggerEventInfo:forPhId:]";
        v101 = 2114;
        v102 = v80;
        v103 = 2050;
        v104 = v29;
        v105 = 1026;
        v106 = v89;
        v107 = 1026;
        v108 = v90;
        v109 = 2050;
        v110 = v88;
        v111 = 2050;
        v112 = v48;
        v113 = 2050;
        v114 = v41;
        v115 = 2050;
        v116 = v95;
        v117 = 2050;
        v118 = v59;
        _os_log_impl(&dword_1C2614000, v79, OS_LOG_TYPE_DEFAULT, "%s CSVoiceTriggerSecondPass[%{public}@]:PHS Accept: Score %{public}.3f(%{public}d, %{public}d), PSR = [%{public}.3f, %{public}.3f], SAT = [%{public}.3f, %{public}.3f] Threshold %{public}f \n", buf, 0x5Eu);

      }
      objc_msgSend(v8, "setObject:forKey:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D196C0], *(_QWORD *)&v88);
      +[CSVoiceTriggerStatistics sharedInstance](CSVoiceTriggerStatistics, "sharedInstance");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v81, "resetPHSRejectCount");

      -[CSVoiceTriggerSecondPass _handleSecondPassSuccess:](self, "_handleSecondPassSuccess:", v8);
      v12 = v93;
      v11 = v94;
      v10 = v92;
      v82 = v96;
    }
    else
    {
      if (v66)
      {
        v67 = v65;
        -[CSVoiceTriggerSecondPass UUID](self, "UUID");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136317442;
        v100 = "-[CSVoiceTriggerSecondPass _handlePHSResults:voiceTriggerEventInfo:forPhId:]";
        v101 = 2114;
        v102 = v68;
        v103 = 2050;
        v104 = v29;
        v105 = 1026;
        v106 = v89;
        v107 = 1026;
        v108 = v90;
        v109 = 2050;
        v110 = v88;
        v111 = 2050;
        v112 = v48;
        v113 = 2050;
        v114 = v41;
        v115 = 2050;
        v116 = v95;
        v117 = 2050;
        v118 = v59;
        _os_log_impl(&dword_1C2614000, v67, OS_LOG_TYPE_DEFAULT, "%s CSVoiceTriggerSecondPass[%{public}@]:PHS Reject: Score %{public}f(%{public}d, %{public}d) PSR = [%{public}.3f, %{public}.3f], SAT = [%{public}.3f, %{public}.3f] Threshold %{public}f \n", buf, 0x5Eu);

      }
      objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D19778], *(_QWORD *)&v88);
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "floatValue");
      v71 = v70;

      objc_msgSend(v8, "setObject:forKey:", MEMORY[0x1E0C9AAA0], *MEMORY[0x1E0D196C0]);
      -[CSVoiceTriggerSecondPassConfig phraseConfigs](self->_config, "phraseConfigs");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      v73 = objc_msgSend(v72, "count");

      v74 = v91;
      if (v73 <= a5)
      {
        v78 = INFINITY;
      }
      else
      {
        -[CSVoiceTriggerSecondPassConfig phraseConfigs](self->_config, "phraseConfigs");
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v75, "objectAtIndex:", a5);
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v76, "keywordRejectLoggingThreshold");
        v78 = v77;

      }
      v12 = v93;
      v11 = v94;
      v13 = v33;
      v82 = v96;
      v10 = v92;
      if (v29 >= self->_phsRejectLoggingThreshold && v71 >= v78)
      {
        +[CSVoiceTriggerDataCollector sharedInstance](CSVoiceTriggerDataCollector, "sharedInstance");
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v83, "addVTRejectEntry:truncateData:", v8, 0);

      }
      +[CSVoiceTriggerStatistics sharedInstance](CSVoiceTriggerStatistics, "sharedInstance");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v84, "incrementPHSRejectCount");

      -[CSVoiceTriggerSecondPass _notifySecondPassReject:result:isSecondChanceCandidate:](self, "_notifySecondPassReject:result:isSecondChanceCandidate:", v8, 9, 0);
    }

  }
  else
  {
    v23 = (void *)*MEMORY[0x1E0D18F58];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_ERROR))
    {
      v85 = v23;
      -[CSVoiceTriggerSecondPass UUID](self, "UUID");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", v9);
      v87 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
      *(_DWORD *)buf = 136315650;
      v100 = "-[CSVoiceTriggerSecondPass _handlePHSResults:voiceTriggerEventInfo:forPhId:]";
      v101 = 2114;
      v102 = v86;
      v103 = 2114;
      v104 = v87;
      _os_log_error_impl(&dword_1C2614000, v85, OS_LOG_TYPE_ERROR, "%s CSVoiceTriggerSecondPass[%{public}@]:ERR: Failed to retrieve PHS score, letting trigger through - %{public}@", buf, 0x20u);

    }
    -[CSVoiceTriggerSecondPass _handleSecondPassSuccess:](self, "_handleSecondPassSuccess:", v8);
  }

}

- (void)CSAudioServerCrashMonitorDidReceiveServerRestart:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  NSObject *queue;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)*MEMORY[0x1E0D18F58];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    -[CSVoiceTriggerSecondPass UUID](self, "UUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v11 = "-[CSVoiceTriggerSecondPass CSAudioServerCrashMonitorDidReceiveServerRestart:]";
    v12 = 2114;
    v13 = v7;
    _os_log_impl(&dword_1C2614000, v6, OS_LOG_TYPE_DEFAULT, "%s CSVoiceTriggerSecondPass[%{public}@]:audiomxd/bridgeaudiod recovered from crash", buf, 0x16u);

  }
  if ((CSIsHorseman() & 1) != 0 || CSHasAOP())
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __77__CSVoiceTriggerSecondPass_CSAudioServerCrashMonitorDidReceiveServerRestart___block_invoke;
    block[3] = &unk_1E7C292C8;
    block[4] = self;
    dispatch_async(queue, block);
  }

}

- (void)selfTriggerDetector:(id)a3 didDetectSelfTrigger:(id)a4
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__CSVoiceTriggerSecondPass_selfTriggerDetector_didDetectSelfTrigger___block_invoke;
  block[3] = &unk_1E7C292C8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)CSMediaPlayingMonitor:(id)a3 didReceiveMediaPlayingChanged:(int64_t)a4
{
  NSObject *queue;
  _QWORD v5[6];

  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __80__CSVoiceTriggerSecondPass_CSMediaPlayingMonitor_didReceiveMediaPlayingChanged___block_invoke;
  v5[3] = &unk_1E7C29178;
  v5[4] = self;
  v5[5] = a4;
  dispatch_async(queue, v5);
}

- (void)CSVolumeMonitor:(id)a3 didReceiveMusicVolumeChanged:(float)a4
{
  NSObject *queue;
  _QWORD v5[5];
  float v6;

  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __73__CSVoiceTriggerSecondPass_CSVolumeMonitor_didReceiveMusicVolumeChanged___block_invoke;
  v5[3] = &unk_1E7C27848;
  v5[4] = self;
  v6 = a4;
  dispatch_async(queue, v5);
}

- (void)zeroFilter:(id)a3 zeroFilteredBufferAvailable:(id)a4 atHostTime:(unint64_t)a5
{
  NSObject *queue;
  id v8;
  unint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;

  queue = self->_queue;
  v8 = a4;
  dispatch_assert_queue_V2(queue);
  v9 = (unint64_t)objc_msgSend(v8, "length") >> 1;
  -[CSVoiceTriggerSecondPass _getAudioTimeConverter](self, "_getAudioTimeConverter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "sampleCountFromHostTime:", a5);

  v12 = objc_alloc(MEMORY[0x1E0D18FC8]);
  v13 = (id)objc_msgSend(v12, "initWithData:numChannels:numSamples:sampleByteDepth:startSampleCount:hostTime:remoteVAD:", v8, 1, v9, objc_msgSend(MEMORY[0x1E0D19090], "inputRecordingSampleByteDepth"), v11, a5, 0);

  -[CSVoiceTriggerSecondPass _handleAudioChunk:shouldPreprocessedByZeroFilter:](self, "_handleAudioChunk:shouldPreprocessedByZeroFilter:", v13, 0);
}

- (id)_getFirstPassTriggerSourceAsString:(unint64_t)a3
{
  __CFString *v3;

  if (a3 <= 0xE && ((0x7BFFu >> a3) & 1) != 0)
    v3 = (__CFString *)**((id **)&unk_1E7C23B18 + a3);
  else
    v3 = &stru_1E7C296E8;

  return v3;
}

- (void)_logSecondPassResult:(unint64_t)a3 withVTEI:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  float v9;
  float v10;
  void *v11;
  float v12;
  uint64_t v13;
  void *v14;
  void *v15;
  float v16;
  uint64_t v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  float v22;
  float v23;
  uint64_t v24;
  void *v25;
  void *v26;
  float v27;
  uint64_t v28;
  void *v29;
  double v30;
  double v31;
  void *v32;
  float v33;
  uint64_t v34;
  void *v35;
  void *v36;
  float v37;
  float v38;
  uint64_t v39;
  void *v40;
  double v41;
  double v42;
  void *v43;
  float v44;
  uint64_t v45;
  void *v46;
  void *v47;
  float v48;
  uint64_t v49;
  void *v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  __CFString *v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  uint64_t v62;
  void *v63;
  double v64;
  void *v65;
  NSObject *v66;
  double v67;
  uint8_t buf[4];
  const char *v69;
  __int16 v70;
  void *v71;
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = *MEMORY[0x1E0D19698];
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D19698]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0.0;
  v10 = 0.0;
  if (v8)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "floatValue");
    v10 = v12;

  }
  v13 = *MEMORY[0x1E0D19778];
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D19778]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "floatValue");
    v9 = v16;

  }
  v17 = *MEMORY[0x1E0D196B0];
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D196B0]);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0.0;
  v20 = 0.0;
  if (v18)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", v17);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "floatValue");
    v23 = v22;

    v20 = v23;
  }

  v24 = *MEMORY[0x1E0D196F0];
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D196F0]);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (v25)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", v24);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "floatValue");
    v19 = v27;

  }
  v67 = v19;

  v28 = *MEMORY[0x1E0D196E0];
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D196E0]);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0.0;
  v31 = 0.0;
  if (v29)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", v28);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "floatValue");
    v31 = v33;

  }
  v34 = *MEMORY[0x1E0D19708];
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D19708]);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  if (v35)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", v34);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = (float)(unint64_t)objc_msgSend(v36, "unsignedIntegerValue");
    objc_msgSend(MEMORY[0x1E0D19090], "inputRecordingSampleRate");
    v30 = (float)(v37 / v38);

  }
  v39 = *MEMORY[0x1E0D195F8];
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D195F8]);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = 0.0;
  v42 = 0.0;
  if (v40)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", v39);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "floatValue");
    v42 = v44;

  }
  v45 = *MEMORY[0x1E0D196E8];
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D196E8]);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  if (v46)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", v45);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "floatValue");
    v41 = v48;

  }
  v49 = *MEMORY[0x1E0D196A8];
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D196A8]);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  if (v50)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", v49);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = objc_msgSend(v51, "unsignedIntegerValue");

  }
  else
  {
    v52 = 0;
  }

  v53 = *MEMORY[0x1E0D19660];
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D19660]);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  if (v54)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", v53);
    v55 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v55 = CFSTR("n/a");
  }

  +[CSVoiceTriggerSecondPass stringForSecondPassResult:](CSVoiceTriggerSecondPass, "stringForSecondPassResult:", a3);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSVoiceTriggerSecondPass _fetchSiriLocale](self, "_fetchSiriLocale");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D19590]);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = objc_msgSend(v58, "unsignedIntegerValue");

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SecondPass Result Summary: \nLocale: %@\nAllowMultiPhrase: %d\nFirstPassSource: %@\nAnalyzedSecs: %.3f\nNdapiScore: %.3f\nCheckerScore: %.3f\nCombinedVTScore: %.3f\nEffectiveThreshold: %.3f\n"), v57, self->_supportsMph, v55, *(_QWORD *)&v30, (float)(v9 - v10), v10, v9, *(_QWORD *)&v42);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = v60;
  if (self->_speakerRecognitionController)
  {
    objc_msgSend(v60, "stringByAppendingFormat:", CFSTR("\nPHS Summary: \nDNNScore: %.3f\nLSTMScore: %.3f\nCombinedPHSScore: %.3f\nNumSATVectors: %lu\ntdsrCombinedThreshold: %.3f\n"), *(_QWORD *)&v20, *(_QWORD *)&v67, *(_QWORD *)&v31, v52, *(_QWORD *)&v41);
    v62 = objc_claimAutoreleasedReturnValue();

    v61 = (void *)v62;
  }
  objc_msgSend(MEMORY[0x1E0D191C0], "sharedPowerLogger");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v64 = v9;
  objc_msgSend(v63, "powerLogSecondPassWithResult:withSecondPassScore:withPhId:", a3, v59, v64);

  objc_msgSend(v61, "stringByAppendingFormat:", CFSTR("\nDecision: %@"), v56);
  v65 = (void *)objc_claimAutoreleasedReturnValue();

  v66 = *MEMORY[0x1E0D18F58];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v69 = "-[CSVoiceTriggerSecondPass _logSecondPassResult:withVTEI:]";
    v70 = 2114;
    v71 = v65;
    _os_log_impl(&dword_1C2614000, v66, OS_LOG_TYPE_DEFAULT, "KeyLog - %s %{public}@", buf, 0x16u);
  }

}

- (BOOL)_shouldLogMediaplayState:(unint64_t)a3
{
  BOOL result;

  if (!objc_msgSend(MEMORY[0x1E0D19260], "supportHearstVoiceTrigger") || (result = 1, a3 != 3) && a3 != 6)
  {
    if (CSIsIOS() && a3 - 1 < 0xB && ((0x581u >> (a3 - 1)) & 1) != 0)
    {
      return 1;
    }
    else
    {
      result = CSIsHorseman();
      if (a3 != 1)
        return 0;
    }
  }
  return result;
}

- (void)_resetStartAnalyzeTime
{
  self->_isStartSampleCountMarked = 0;
  self->_secondPassAnalyzerStartSampleCount = 0;
}

- (void)_setStartAnalyzeTime:(unint64_t)a3
{
  void *v4;
  NSObject *v5;
  void *v6;
  unint64_t secondPassAnalyzerStartSampleCount;
  int v8;
  const char *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  unint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (!self->_isStartSampleCountMarked)
  {
    self->_isStartSampleCountMarked = 1;
    self->_secondPassAnalyzerStartSampleCount = a3;
    v4 = (void *)*MEMORY[0x1E0D18F58];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT))
    {
      v5 = v4;
      -[CSVoiceTriggerSecondPass UUID](self, "UUID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      secondPassAnalyzerStartSampleCount = self->_secondPassAnalyzerStartSampleCount;
      v8 = 136315650;
      v9 = "-[CSVoiceTriggerSecondPass _setStartAnalyzeTime:]";
      v10 = 2114;
      v11 = v6;
      v12 = 2050;
      v13 = secondPassAnalyzerStartSampleCount;
      _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_DEFAULT, "%s CSVoiceTriggerSecondPass[%{public}@]:set StartAnalyzeSampleCount = %{public}llu", (uint8_t *)&v8, 0x20u);

    }
  }
}

- (void)_handleResultCompletion:(unint64_t)a3 voiceTriggerInfo:(id)a4 isSecondChanceCandidate:(BOOL)a5 error:(id)a6
{
  _BOOL8 v7;
  id v10;
  void (**resultCompletion)(id, CSVoiceTriggerSecondPassResultHolder *, id);
  CSVoiceTriggerSecondPassResultHolder *v12;
  id v13;
  id v14;

  v7 = a5;
  v14 = a4;
  v10 = a6;
  -[CSVoiceTriggerSecondPass _logSecondPassResult:withVTEI:](self, "_logSecondPassResult:withVTEI:", a3, v14);
  resultCompletion = (void (**)(id, CSVoiceTriggerSecondPassResultHolder *, id))self->_resultCompletion;
  if (resultCompletion)
  {
    v12 = -[CSVoiceTriggerSecondPassResultHolder initWithResult:voiceTriggerEventInfo:isSecondChanceCandidate:]([CSVoiceTriggerSecondPassResultHolder alloc], "initWithResult:voiceTriggerEventInfo:isSecondChanceCandidate:", a3, v14, v7);
    resultCompletion[2](resultCompletion, v12, v10);

    v13 = self->_resultCompletion;
    self->_resultCompletion = 0;

  }
}

- (void)_scheduleSecondPassCompletionWatchDog
{
  id v3;
  NSObject *v4;
  NSUUID *secondPassCompleteWatchDogToken;
  double secondPassCompleteWatchDogTimeoutSec;
  dispatch_time_t v7;
  NSObject *queue;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  id location;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  NSUUID *v17;
  __int16 v18;
  double v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_initWeak(&location, self);
  v3 = objc_alloc_init(MEMORY[0x1E0CB3A28]);
  objc_storeStrong((id *)&self->_secondPassCompleteWatchDogToken, v3);
  v4 = *MEMORY[0x1E0D18F58];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT))
  {
    secondPassCompleteWatchDogToken = self->_secondPassCompleteWatchDogToken;
    secondPassCompleteWatchDogTimeoutSec = self->_secondPassCompleteWatchDogTimeoutSec;
    *(_DWORD *)buf = 136315650;
    v15 = "-[CSVoiceTriggerSecondPass _scheduleSecondPassCompletionWatchDog]";
    v16 = 2114;
    v17 = secondPassCompleteWatchDogToken;
    v18 = 2050;
    v19 = secondPassCompleteWatchDogTimeoutSec;
    _os_log_impl(&dword_1C2614000, v4, OS_LOG_TYPE_DEFAULT, "%s Schedule secondPassComplete WDT %{public}@ for %{public}lf seconds", buf, 0x20u);
  }
  v7 = dispatch_time(0, (uint64_t)(float)(self->_secondPassCompleteWatchDogTimeoutSec * 1000000000.0));
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__CSVoiceTriggerSecondPass__scheduleSecondPassCompletionWatchDog__block_invoke;
  block[3] = &unk_1E7C28E78;
  objc_copyWeak(&v12, &location);
  v11 = v3;
  v9 = v3;
  dispatch_after(v7, queue, block);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (void)_scheduleDidStartSecondPassCompletionWatchDogWithToken:(id)a3
{
  NSUUID *v4;
  os_log_t *v5;
  NSObject *v6;
  NSUUID *secondPassCompleteWatchDogToken;
  void *v8;
  NSObject *v9;
  double secondPassCompleteWatchDogTimeoutSec;
  NSObject *v11;
  int v12;
  const char *v13;
  __int16 v14;
  double v15;
  __int16 v16;
  NSUUID *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = (NSUUID *)a3;
  v5 = (os_log_t *)MEMORY[0x1E0D18F58];
  v6 = *MEMORY[0x1E0D18F58];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT))
  {
    secondPassCompleteWatchDogToken = self->_secondPassCompleteWatchDogToken;
    v12 = 136315650;
    v13 = "-[CSVoiceTriggerSecondPass _scheduleDidStartSecondPassCompletionWatchDogWithToken:]";
    v14 = 2114;
    v15 = *(double *)&v4;
    v16 = 2114;
    v17 = secondPassCompleteWatchDogToken;
    _os_log_impl(&dword_1C2614000, v6, OS_LOG_TYPE_DEFAULT, "%s secondPassComplete WDT did fire : %{public}@, currentToken : %{public}@", (uint8_t *)&v12, 0x20u);
  }
  if (-[NSUUID isEqual:](v4, "isEqual:", self->_secondPassCompleteWatchDogToken))
  {
    -[CSVoiceTriggerSecondPass _notifySecondPassReject:result:isSecondChanceCandidate:](self, "_notifySecondPassReject:result:isSecondChanceCandidate:", 0, 10, 0);
    objc_msgSend(MEMORY[0x1E0D190B8], "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "submitVoiceTriggerIssueReport:", *MEMORY[0x1E0D193C8]);

    v9 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
    {
      secondPassCompleteWatchDogTimeoutSec = self->_secondPassCompleteWatchDogTimeoutSec;
      v12 = 136315650;
      v13 = "-[CSVoiceTriggerSecondPass _scheduleDidStartSecondPassCompletionWatchDogWithToken:]";
      v14 = 2050;
      v15 = secondPassCompleteWatchDogTimeoutSec;
      v16 = 2114;
      v17 = v4;
      _os_log_error_impl(&dword_1C2614000, v9, OS_LOG_TYPE_ERROR, "%s Secondpass didn't complete within %{public}lf seconds with token: %{public}@", (uint8_t *)&v12, 0x20u);
    }
  }
  else
  {
    v11 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 136315138;
      v13 = "-[CSVoiceTriggerSecondPass _scheduleDidStartSecondPassCompletionWatchDogWithToken:]";
      _os_log_impl(&dword_1C2614000, v11, OS_LOG_TYPE_DEFAULT, "%s secondPassComplete WDT token doesn't match. Ignore this fire", (uint8_t *)&v12, 0xCu);
    }
  }

}

- (void)_clearSecondPassCompletionWatchDog
{
  NSObject *v3;
  NSUUID *secondPassCompleteWatchDogToken;
  NSUUID *v5;
  int v6;
  const char *v7;
  __int16 v8;
  NSUUID *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0D18F58];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT))
  {
    secondPassCompleteWatchDogToken = self->_secondPassCompleteWatchDogToken;
    v6 = 136315394;
    v7 = "-[CSVoiceTriggerSecondPass _clearSecondPassCompletionWatchDog]";
    v8 = 2114;
    v9 = secondPassCompleteWatchDogToken;
    _os_log_impl(&dword_1C2614000, v3, OS_LOG_TYPE_DEFAULT, "%s Clearing secondPassCompletion WatchDogTimer : %{public}@", (uint8_t *)&v6, 0x16u);
  }
  v5 = self->_secondPassCompleteWatchDogToken;
  self->_secondPassCompleteWatchDogToken = 0;

}

- (id)_voiceTriggerSecondPassLatencyMetrics
{
  CSVTSecondPassLatencyMetrics *secondPassLatencyMetrics;
  CSVTSecondPassLatencyMetrics *v4;
  CSVTSecondPassLatencyMetrics *v5;

  secondPassLatencyMetrics = self->_secondPassLatencyMetrics;
  if (!secondPassLatencyMetrics)
  {
    v4 = objc_alloc_init(CSVTSecondPassLatencyMetrics);
    v5 = self->_secondPassLatencyMetrics;
    self->_secondPassLatencyMetrics = v4;

    secondPassLatencyMetrics = self->_secondPassLatencyMetrics;
  }
  return secondPassLatencyMetrics;
}

- (void)_resetVoiceTriggerLatencyMetrics
{
  CSVoiceTriggerFirstPassMetrics *firstpassMetrics;
  CSVTSecondPassLatencyMetrics *secondPassLatencyMetrics;

  firstpassMetrics = self->_firstpassMetrics;
  self->_firstpassMetrics = 0;

  secondPassLatencyMetrics = self->_secondPassLatencyMetrics;
  self->_secondPassLatencyMetrics = 0;

}

- (void)_unmapForPrewarmLoadedGraph
{
  NSObject *v3;
  unint64_t prewarmMmapedSize;
  size_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  unint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0D18F58];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT))
  {
    prewarmMmapedSize = self->_prewarmMmapedSize;
    v6 = 136315394;
    v7 = "-[CSVoiceTriggerSecondPass _unmapForPrewarmLoadedGraph]";
    v8 = 2048;
    v9 = prewarmMmapedSize;
    _os_log_impl(&dword_1C2614000, v3, OS_LOG_TYPE_DEFAULT, "%s unmapping for graph with size: %lu", (uint8_t *)&v6, 0x16u);
  }
  v5 = self->_prewarmMmapedSize;
  if (v5)
  {
    munmap(self->_prewarmModelGraph, v5);
    self->_prewarmMmapedSize = 0;
    self->_prewarmModelGraph = 0;
  }
}

- (BOOL)_isFirstPassSourceExclave:(unint64_t)a3
{
  return a3 - 11 < 4;
}

- (void)_syncVoiceProfileEmbeddingsToExclave
{
  uint64_t v3;
  SSRSpeakerRecognitionContext *ssrContext;
  SSRSpeakerRecognitionContext *v5;
  _QWORD v6[5];
  _QWORD v7[5];

  v3 = MEMORY[0x1E0C809B0];
  ssrContext = self->_ssrContext;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __64__CSVoiceTriggerSecondPass__syncVoiceProfileEmbeddingsToExclave__block_invoke;
  v7[3] = &unk_1E7C23AA0;
  v7[4] = self;
  objc_msgSend(MEMORY[0x1E0DA8C00], "extractPSRVoiceProfileWithContext:completion:", ssrContext, v7);
  v5 = self->_ssrContext;
  v6[0] = v3;
  v6[1] = 3221225472;
  v6[2] = __64__CSVoiceTriggerSecondPass__syncVoiceProfileEmbeddingsToExclave__block_invoke_171;
  v6[3] = &unk_1E7C23AA0;
  v6[4] = self;
  objc_msgSend(MEMORY[0x1E0DA8C00], "extractSATVoiceProfileWithContext:completion:", v5, v6);
}

- (NSString)UUID
{
  return self->_UUID;
}

- (CSVoiceTriggerDelegate)delegate
{
  return (CSVoiceTriggerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (float)secondPassCompleteWatchDogTimeoutSec
{
  return self->_secondPassCompleteWatchDogTimeoutSec;
}

- (void)setSecondPassCompleteWatchDogTimeoutSec:(float)a3
{
  self->_secondPassCompleteWatchDogTimeoutSec = a3;
}

- (CSSpeechManager)speechManager
{
  return self->_speechManager;
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

- (CSVoiceTriggerSecondPassConfig)config
{
  return self->_config;
}

- (void)setConfig:(id)a3
{
  objc_storeStrong((id *)&self->_config, a3);
}

- (CSAudioStream)audioStream
{
  return self->_audioStream;
}

- (void)setAudioStream:(id)a3
{
  objc_storeStrong((id *)&self->_audioStream, a3);
}

- (NSString)audioProviderUUID
{
  return self->_audioProviderUUID;
}

- (void)setAudioProviderUUID:(id)a3
{
  objc_storeStrong((id *)&self->_audioProviderUUID, a3);
}

- (CSPhraseDetector)phraseDetector
{
  return self->_phraseDetector;
}

- (void)setPhraseDetector:(id)a3
{
  objc_storeStrong((id *)&self->_phraseDetector, a3);
}

- (CSPhraseNDEAPIScorer)phraseNDEAPIScorer
{
  return self->_phraseNDEAPIScorer;
}

- (void)setPhraseNDEAPIScorer:(id)a3
{
  objc_storeStrong((id *)&self->_phraseNDEAPIScorer, a3);
}

- (SSRSpeakerRecognitionController)speakerRecognitionController
{
  return self->_speakerRecognitionController;
}

- (void)setSpeakerRecognitionController:(id)a3
{
  objc_storeStrong((id *)&self->_speakerRecognitionController, a3);
}

- (SSRSpeakerRecognitionContext)ssrContext
{
  return self->_ssrContext;
}

- (void)setSsrContext:(id)a3
{
  objc_storeStrong((id *)&self->_ssrContext, a3);
}

- (id)resultCompletion
{
  return self->_resultCompletion;
}

- (void)setResultCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (unint64_t)secondPassTimeout
{
  return self->_secondPassTimeout;
}

- (void)setSecondPassTimeout:(unint64_t)a3
{
  self->_secondPassTimeout = a3;
}

- (unint64_t)numProcessedSamples
{
  return self->_numProcessedSamples;
}

- (void)setNumProcessedSamples:(unint64_t)a3
{
  self->_numProcessedSamples = a3;
}

- (unint64_t)numAnalyzedSamples
{
  return self->_numAnalyzedSamples;
}

- (void)setNumAnalyzedSamples:(unint64_t)a3
{
  self->_numAnalyzedSamples = a3;
}

- (float)secondPassPrependingSec
{
  return self->_secondPassPrependingSec;
}

- (void)setSecondPassPrependingSec:(float)a3
{
  self->_secondPassPrependingSec = a3;
}

- (float)phsRejectLoggingThreshold
{
  return self->_phsRejectLoggingThreshold;
}

- (void)setPhsRejectLoggingThreshold:(float)a3
{
  self->_phsRejectLoggingThreshold = a3;
}

- (unint64_t)extraSamplesAtStart
{
  return self->_extraSamplesAtStart;
}

- (void)setExtraSamplesAtStart:(unint64_t)a3
{
  self->_extraSamplesAtStart = a3;
}

- (unint64_t)analyzerPrependingSamples
{
  return self->_analyzerPrependingSamples;
}

- (void)setAnalyzerPrependingSamples:(unint64_t)a3
{
  self->_analyzerPrependingSamples = a3;
}

- (unint64_t)analyzerTrailingSamples
{
  return self->_analyzerTrailingSamples;
}

- (void)setAnalyzerTrailingSamples:(unint64_t)a3
{
  self->_analyzerTrailingSamples = a3;
}

- (BOOL)shouldUsePHS
{
  return self->_shouldUsePHS;
}

- (void)setShouldUsePHS:(BOOL)a3
{
  self->_shouldUsePHS = a3;
}

- (unint64_t)earlyDetectFiredMachTime
{
  return self->_earlyDetectFiredMachTime;
}

- (void)setEarlyDetectFiredMachTime:(unint64_t)a3
{
  self->_earlyDetectFiredMachTime = a3;
}

- (unint64_t)activeChannel
{
  return self->_activeChannel;
}

- (void)setActiveChannel:(unint64_t)a3
{
  self->_activeChannel = a3;
}

- (unint64_t)selectedChannelFromFirstPass
{
  return self->_selectedChannelFromFirstPass;
}

- (void)setSelectedChannelFromFirstPass:(unint64_t)a3
{
  self->_selectedChannelFromFirstPass = a3;
}

- (unint64_t)processedSampleCountsInPending
{
  return self->_processedSampleCountsInPending;
}

- (void)setProcessedSampleCountsInPending:(unint64_t)a3
{
  self->_processedSampleCountsInPending = a3;
}

- (unint64_t)firstPassTriggerStartSampleCount
{
  return self->_firstPassTriggerStartSampleCount;
}

- (void)setFirstPassTriggerStartSampleCount:(unint64_t)a3
{
  self->_firstPassTriggerStartSampleCount = a3;
}

- (unint64_t)firstPassTriggerFireSampleCount
{
  return self->_firstPassTriggerFireSampleCount;
}

- (void)setFirstPassTriggerFireSampleCount:(unint64_t)a3
{
  self->_firstPassTriggerFireSampleCount = a3;
}

- (NSDictionary)firstPassChannelSelectionScores
{
  return self->_firstPassChannelSelectionScores;
}

- (void)setFirstPassChannelSelectionScores:(id)a3
{
  objc_storeStrong((id *)&self->_firstPassChannelSelectionScores, a3);
}

- (float)firstPassChannelSelectionDelaySeconds
{
  return self->_firstPassChannelSelectionDelaySeconds;
}

- (void)setFirstPassChannelSelectionDelaySeconds:(float)a3
{
  self->_firstPassChannelSelectionDelaySeconds = a3;
}

- (float)firstPassMasterChannelScoreBoost
{
  return self->_firstPassMasterChannelScoreBoost;
}

- (void)setFirstPassMasterChannelScoreBoost:(float)a3
{
  self->_firstPassMasterChannelScoreBoost = a3;
}

- (float)firstPassOnsetScore
{
  return self->_firstPassOnsetScore;
}

- (void)setFirstPassOnsetScore:(float)a3
{
  self->_firstPassOnsetScore = a3;
}

- (unint64_t)firstPassOnsetChannel
{
  return self->_firstPassOnsetChannel;
}

- (void)setFirstPassOnsetChannel:(unint64_t)a3
{
  self->_firstPassOnsetChannel = a3;
}

- (unint64_t)firstPassFireHostTime
{
  return self->_firstPassFireHostTime;
}

- (void)setFirstPassFireHostTime:(unint64_t)a3
{
  self->_firstPassFireHostTime = a3;
}

- (BOOL)didWakeAP
{
  return self->_didWakeAP;
}

- (void)setDidWakeAP:(BOOL)a3
{
  self->_didWakeAP = a3;
}

- (BOOL)hasTriggerCandidate
{
  return self->_hasTriggerCandidate;
}

- (void)setHasTriggerCandidate:(BOOL)a3
{
  self->_hasTriggerCandidate = a3;
}

- (BOOL)isStartSampleCountMarked
{
  return self->_isStartSampleCountMarked;
}

- (void)setIsStartSampleCountMarked:(BOOL)a3
{
  self->_isStartSampleCountMarked = a3;
}

- (unint64_t)secondPassAnalyzerStartSampleCount
{
  return self->_secondPassAnalyzerStartSampleCount;
}

- (void)setSecondPassAnalyzerStartSampleCount:(unint64_t)a3
{
  self->_secondPassAnalyzerStartSampleCount = a3;
}

- (double)lastAggTime
{
  return self->_lastAggTime;
}

- (void)setLastAggTime:(double)a3
{
  self->_lastAggTime = a3;
}

- (double)cumulativeUptime
{
  return self->_cumulativeUptime;
}

- (void)setCumulativeUptime:(double)a3
{
  self->_cumulativeUptime = a3;
}

- (double)cumulativeDowntime
{
  return self->_cumulativeDowntime;
}

- (void)setCumulativeDowntime:(double)a3
{
  self->_cumulativeDowntime = a3;
}

- (unint64_t)secondPassCheckerExecutionTime
{
  return self->_secondPassCheckerExecutionTime;
}

- (void)setSecondPassCheckerExecutionTime:(unint64_t)a3
{
  self->_secondPassCheckerExecutionTime = a3;
}

- (CSAudioCircularBuffer)audioBuffer
{
  return (CSAudioCircularBuffer *)objc_loadWeakRetained((id *)&self->_audioBuffer);
}

- (void)setAudioBuffer:(id)a3
{
  objc_storeWeak((id *)&self->_audioBuffer, a3);
}

- (unint64_t)firstPassSource
{
  return self->_firstPassSource;
}

- (NSString)firstPassDeviceId
{
  return self->_firstPassDeviceId;
}

- (unint64_t)secondPassClient
{
  return self->_secondPassClient;
}

- (NSString)currentLocale
{
  return self->_currentLocale;
}

- (void)setCurrentLocale:(id)a3
{
  objc_storeStrong((id *)&self->_currentLocale, a3);
}

- (CSPlainAudioFileWriter)audioFileWriter
{
  return self->_audioFileWriter;
}

- (void)setAudioFileWriter:(id)a3
{
  objc_storeStrong((id *)&self->_audioFileWriter, a3);
}

- (BOOL)secondPassHasMadeDecision
{
  return self->_secondPassHasMadeDecision;
}

- (void)setSecondPassHasMadeDecision:(BOOL)a3
{
  self->_secondPassHasMadeDecision = a3;
}

- (int64_t)mediaPlayingState
{
  return self->_mediaPlayingState;
}

- (void)setMediaPlayingState:(int64_t)a3
{
  self->_mediaPlayingState = a3;
}

- (float)mediaVolume
{
  return self->_mediaVolume;
}

- (void)setMediaVolume:(float)a3
{
  self->_mediaVolume = a3;
}

- (NSUUID)secondPassCompleteWatchDogToken
{
  return self->_secondPassCompleteWatchDogToken;
}

- (void)setSecondPassCompleteWatchDogToken:(id)a3
{
  objc_storeStrong((id *)&self->_secondPassCompleteWatchDogToken, a3);
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

- (CSAudioTimeConverter)audioTimeConverter
{
  return self->_audioTimeConverter;
}

- (void)setAudioTimeConverter:(id)a3
{
  objc_storeStrong((id *)&self->_audioTimeConverter, a3);
}

- (CSAudioTimeConverter)exclaveAudioTimeConverter
{
  return self->_exclaveAudioTimeConverter;
}

- (void)setExclaveAudioTimeConverter:(id)a3
{
  objc_storeStrong((id *)&self->_exclaveAudioTimeConverter, a3);
}

- (NSMutableDictionary)storedFirstPassInfo
{
  return self->_storedFirstPassInfo;
}

- (void)setStoredFirstPassInfo:(id)a3
{
  objc_storeStrong((id *)&self->_storedFirstPassInfo, a3);
}

- (NSUUID)secondPassRejectionMHUUID
{
  return self->_secondPassRejectionMHUUID;
}

- (void)setSecondPassRejectionMHUUID:(id)a3
{
  objc_storeStrong((id *)&self->_secondPassRejectionMHUUID, a3);
}

- (BOOL)hasLoggedSecondPass
{
  return self->_hasLoggedSecondPass;
}

- (void)setHasLoggedSecondPass:(BOOL)a3
{
  self->_hasLoggedSecondPass = a3;
}

- (CSVoiceTriggerFirstPassMetrics)firstpassMetrics
{
  return self->_firstpassMetrics;
}

- (void)setFirstpassMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_firstpassMetrics, a3);
}

- (CSVTSecondPassLatencyMetrics)secondPassLatencyMetrics
{
  return self->_secondPassLatencyMetrics;
}

- (void)setSecondPassLatencyMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_secondPassLatencyMetrics, a3);
}

- (BOOL)supportsMph
{
  return self->_supportsMph;
}

- (void)setSupportsMph:(BOOL)a3
{
  self->_supportsMph = a3;
}

- (CSVoiceTriggerAwareZeroFilter)zeroFilter
{
  return self->_zeroFilter;
}

- (void)setZeroFilter:(id)a3
{
  objc_storeStrong((id *)&self->_zeroFilter, a3);
}

- (unint64_t)prewarmMmapedSize
{
  return self->_prewarmMmapedSize;
}

- (void)setPrewarmMmapedSize:(unint64_t)a3
{
  self->_prewarmMmapedSize = a3;
}

- (void)prewarmModelGraph
{
  return self->_prewarmModelGraph;
}

- (void)setPrewarmModelGraph:(void *)a3
{
  self->_prewarmModelGraph = a3;
}

- (int)modelFileDescriptor
{
  return self->_modelFileDescriptor;
}

- (void)setModelFileDescriptor:(int)a3
{
  self->_modelFileDescriptor = a3;
}

- (BOOL)isPSRAudioFlushed
{
  return self->_isPSRAudioFlushed;
}

- (void)setIsPSRAudioFlushed:(BOOL)a3
{
  self->_isPSRAudioFlushed = a3;
}

- (unint64_t)AOPVTTriggerLength
{
  return self->_AOPVTTriggerLength;
}

- (void)setAOPVTTriggerLength:(unint64_t)a3
{
  self->_AOPVTTriggerLength = a3;
}

- (unint64_t)timeBasedEstimatedTriggerLength
{
  return self->_timeBasedEstimatedTriggerLength;
}

- (void)setTimeBasedEstimatedTriggerLength:(unint64_t)a3
{
  self->_timeBasedEstimatedTriggerLength = a3;
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
  objc_storeStrong((id *)&self->_zeroFilter, 0);
  objc_storeStrong((id *)&self->_secondPassLatencyMetrics, 0);
  objc_storeStrong((id *)&self->_firstpassMetrics, 0);
  objc_storeStrong((id *)&self->_secondPassRejectionMHUUID, 0);
  objc_storeStrong((id *)&self->_storedFirstPassInfo, 0);
  objc_storeStrong((id *)&self->_exclaveAudioTimeConverter, 0);
  objc_storeStrong((id *)&self->_audioTimeConverter, 0);
  objc_storeStrong((id *)&self->_assetConfigWaitingBuffer, 0);
  objc_storeStrong((id *)&self->_secondPassCompleteWatchDogToken, 0);
  objc_storeStrong((id *)&self->_audioFileWriter, 0);
  objc_storeStrong((id *)&self->_currentLocale, 0);
  objc_storeStrong((id *)&self->_firstPassDeviceId, 0);
  objc_destroyWeak((id *)&self->_audioBuffer);
  objc_storeStrong((id *)&self->_firstPassChannelSelectionScores, 0);
  objc_storeStrong(&self->_resultCompletion, 0);
  objc_storeStrong((id *)&self->_ssrContext, 0);
  objc_storeStrong((id *)&self->_speakerRecognitionController, 0);
  objc_storeStrong((id *)&self->_phraseNDEAPIScorer, 0);
  objc_storeStrong((id *)&self->_phraseDetector, 0);
  objc_storeStrong((id *)&self->_audioProviderUUID, 0);
  objc_storeStrong((id *)&self->_audioStream, 0);
  objc_storeStrong((id *)&self->_config, 0);
  objc_storeStrong((id *)&self->_currentAsset, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_speechManager, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_UUID, 0);
}

void __64__CSVoiceTriggerSecondPass__syncVoiceProfileEmbeddingsToExclave__block_invoke(uint64_t a1, void *a2, unsigned int a3, unsigned int a4, unsigned int a5, void *a6)
{
  id v11;
  id v12;
  os_log_t *v13;
  NSObject *v14;
  NSObject *v15;
  int v16;
  const char *v17;
  __int16 v18;
  unsigned int v19;
  __int16 v20;
  unsigned int v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v11 = a2;
  v12 = a6;
  v13 = (os_log_t *)MEMORY[0x1E0D18F58];
  v14 = *MEMORY[0x1E0D18F58];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT))
  {
    v16 = 136315906;
    v17 = "-[CSVoiceTriggerSecondPass _syncVoiceProfileEmbeddingsToExclave]_block_invoke";
    v18 = 1024;
    v19 = a3;
    v20 = 1024;
    v21 = a4;
    v22 = 2112;
    v23 = v12;
    _os_log_impl(&dword_1C2614000, v14, OS_LOG_TYPE_DEFAULT, "%s PSR Profile Embedding extract : %d * %d with error %@", (uint8_t *)&v16, 0x22u);
  }
  if (v11)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 480), "setSpeakerProfile:numEmbeddings:dimension:speakerRecognizerType:", v11, a3, a4, a5);
  }
  else
  {
    v15 = *v13;
    if (os_log_type_enabled(*v13, OS_LOG_TYPE_ERROR))
    {
      v16 = 136315138;
      v17 = "-[CSVoiceTriggerSecondPass _syncVoiceProfileEmbeddingsToExclave]_block_invoke";
      _os_log_error_impl(&dword_1C2614000, v15, OS_LOG_TYPE_ERROR, "%s PSR Profile embedding is nil, not sending embedding to Exclave", (uint8_t *)&v16, 0xCu);
    }
  }

}

void __64__CSVoiceTriggerSecondPass__syncVoiceProfileEmbeddingsToExclave__block_invoke_171(uint64_t a1, void *a2, unsigned int a3, unsigned int a4, unsigned int a5, void *a6)
{
  id v11;
  id v12;
  os_log_t *v13;
  NSObject *v14;
  NSObject *v15;
  int v16;
  const char *v17;
  __int16 v18;
  unsigned int v19;
  __int16 v20;
  unsigned int v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v11 = a2;
  v12 = a6;
  v13 = (os_log_t *)MEMORY[0x1E0D18F58];
  v14 = *MEMORY[0x1E0D18F58];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT))
  {
    v16 = 136315906;
    v17 = "-[CSVoiceTriggerSecondPass _syncVoiceProfileEmbeddingsToExclave]_block_invoke";
    v18 = 1024;
    v19 = a3;
    v20 = 1024;
    v21 = a4;
    v22 = 2112;
    v23 = v12;
    _os_log_impl(&dword_1C2614000, v14, OS_LOG_TYPE_DEFAULT, "%s SAT Profile Embedding extract : %d * %d  with error %@", (uint8_t *)&v16, 0x22u);
  }
  if (v11)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 480), "setSpeakerProfile:numEmbeddings:dimension:speakerRecognizerType:", v11, a3, a4, a5);
  }
  else
  {
    v15 = *v13;
    if (os_log_type_enabled(*v13, OS_LOG_TYPE_ERROR))
    {
      v16 = 136315138;
      v17 = "-[CSVoiceTriggerSecondPass _syncVoiceProfileEmbeddingsToExclave]_block_invoke";
      _os_log_error_impl(&dword_1C2614000, v15, OS_LOG_TYPE_ERROR, "%s SAT Profile embedding is nil, not sending embedding to Exclave", (uint8_t *)&v16, 0xCu);
    }
  }

}

void __65__CSVoiceTriggerSecondPass__scheduleSecondPassCompletionWatchDog__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_scheduleDidStartSecondPassCompletionWatchDogWithToken:", *(_QWORD *)(a1 + 32));

}

float __73__CSVoiceTriggerSecondPass_CSVolumeMonitor_didReceiveMusicVolumeChanged___block_invoke(uint64_t a1)
{
  float result;

  result = *(float *)(a1 + 40);
  *(float *)(*(_QWORD *)(a1 + 32) + 44) = result;
  return result;
}

uint64_t __80__CSVoiceTriggerSecondPass_CSMediaPlayingMonitor_didReceiveMediaPlayingChanged___block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(result + 32) + 368) = *(_QWORD *)(result + 40);
  return result;
}

uint64_t __69__CSVoiceTriggerSecondPass_selfTriggerDetector_didDetectSelfTrigger___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reset");
}

uint64_t __77__CSVoiceTriggerSecondPass_CSAudioServerCrashMonitorDidReceiveServerRestart___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_clearTriggerCandidate");
}

uint64_t __93__CSVoiceTriggerSecondPass__handleVoiceTriggerFirstPassFromAOP_audioProviderUUID_completion___block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = a3;
  return result;
}

void __93__CSVoiceTriggerSecondPass__handleVoiceTriggerFirstPassFromAOP_audioProviderUUID_completion___block_invoke_105(uint64_t a1, char a2, void *a3)
{
  id v5;
  uint64_t v6;
  CSVoiceTriggerSecondPassResultHolder *v7;
  id v8;

  v5 = a3;
  if ((a2 & 1) == 0)
  {
    v6 = *(_QWORD *)(a1 + 32);
    if (v6)
    {
      v8 = v5;
      v7 = -[CSVoiceTriggerSecondPassResultHolder initWithResult:voiceTriggerEventInfo:isSecondChanceCandidate:]([CSVoiceTriggerSecondPassResultHolder alloc], "initWithResult:voiceTriggerEventInfo:isSecondChanceCandidate:", 4, 0, 0);
      (*(void (**)(uint64_t, CSVoiceTriggerSecondPassResultHolder *, id))(v6 + 16))(v6, v7, v8);

      v5 = v8;
    }
  }

}

uint64_t __75__CSVoiceTriggerSecondPass_CSVoiceTriggerEnabledMonitor_didReceiveEnabled___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_logUptimeWithVTSwitchChanged:VTEnabled:", 1, *(unsigned __int8 *)(a1 + 40));
  if (!*(_BYTE *)(a1 + 40))
    return objc_msgSend(MEMORY[0x1E0D18FE8], "pruneNumberOfLogFilesTo:", 0);
  return result;
}

uint64_t __69__CSVoiceTriggerSecondPass_audioStreamProvider_audioBufferAvailable___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = kVoiceTriggerLaunchDelayThresholdForDiagnosticsInSecs_block_invoke_heartbeat_CORESPEECH_VOICETRIGGER_SECONDPASS_LPCM_RECORD_BUFFER_AVAILABLE;
  if (__ROR8__(0xEEEEEEEEEEEEEEEFLL* kVoiceTriggerLaunchDelayThresholdForDiagnosticsInSecs_block_invoke_heartbeat_CORESPEECH_VOICETRIGGER_SECONDPASS_LPCM_RECORD_BUFFER_AVAILABLE, 1) <= 0x888888888888888uLL)
  {
    kdebug_trace();
    v2 = kVoiceTriggerLaunchDelayThresholdForDiagnosticsInSecs_block_invoke_heartbeat_CORESPEECH_VOICETRIGGER_SECONDPASS_LPCM_RECORD_BUFFER_AVAILABLE;
  }
  kVoiceTriggerLaunchDelayThresholdForDiagnosticsInSecs_block_invoke_heartbeat_CORESPEECH_VOICETRIGGER_SECONDPASS_LPCM_RECORD_BUFFER_AVAILABLE = v2 + 1;
  v3 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v3 + 13))
    return objc_msgSend(*(id *)(v3 + 384), "addObject:", *(_QWORD *)(a1 + 40));
  v4 = *(_QWORD *)(v3 + 440);
  if (objc_msgSend(*(id *)(v3 + 384), "count"))
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v5 = *(id *)(*(_QWORD *)(a1 + 32) + 384);
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v12;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v12 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(a1 + 32), "_handleAudioChunk:shouldPreprocessedByZeroFilter:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v9++), v4 != 0, (_QWORD)v11);
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v7);
    }

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 384), "removeAllObjects");
  }
  return objc_msgSend(*(id *)(a1 + 32), "_handleAudioChunk:shouldPreprocessedByZeroFilter:", *(_QWORD *)(a1 + 40), v4 != 0);
}

void __56__CSVoiceTriggerSecondPass__processSecondPassInExclave___block_invoke(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, double a7, float a8, float a9, float a10)
{
  uint64_t v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  NSObject *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  _QWORD v30[5];
  _QWORD block[5];
  id v32;
  uint8_t buf[4];
  const char *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    if (*(_BYTE *)(a1 + 48))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 480), "stopSecondPassVoiceTrigger");
      objc_msgSend(*(id *)(a1 + 32), "_notifySecondPassReject:result:isSecondChanceCandidate:", 0, 2, 0);
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 160) = 0;
      if (a2 == 3)
      {
LABEL_11:
        v26 = (void *)*MEMORY[0x1E0D18F58];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT))
        {
          v27 = *(void **)(a1 + 32);
          v28 = v26;
          objc_msgSend(v27, "UUID");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315394;
          v34 = "-[CSVoiceTriggerSecondPass _processSecondPassInExclave:]_block_invoke";
          v35 = 2114;
          v36 = v29;
          _os_log_impl(&dword_1C2614000, v28, OS_LOG_TYPE_DEFAULT, "%s CSVoiceTriggerSecondPass[%{public}@]:Skip increasing _numAnalyzedSamples since Exclave didn't process audio chunk", buf, 0x16u);

        }
        return;
      }
    }
    else
    {
      if (a2 == 3)
        goto LABEL_11;
      if (a2 == 1)
      {
        v21 = *(_QWORD *)(a1 + 32);
        v22 = *(void **)(a1 + 40);
        v23 = *(NSObject **)(v21 + 80);
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __56__CSVoiceTriggerSecondPass__processSecondPassInExclave___block_invoke_2;
        block[3] = &unk_1E7C29150;
        block[4] = v21;
        v32 = v22;
        dispatch_async(v23, block);

      }
    }
    v24 = *(_QWORD *)(a1 + 32);
    v25 = *(NSObject **)(v24 + 80);
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __56__CSVoiceTriggerSecondPass__processSecondPassInExclave___block_invoke_3;
    v30[3] = &unk_1E7C292C8;
    v30[4] = v24;
    dispatch_async(v25, v30);
    return;
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 480), "stopSecondPassVoiceTrigger");
  v20 = *(_QWORD *)(a1 + 40);
  if (v20)
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, double, float, float, float))(v20 + 16))(v20, a3, a4, a5, a6, a7, a8, a9, a10);
}

uint64_t __56__CSVoiceTriggerSecondPass__processSecondPassInExclave___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_processSecondPassInExclave:", *(_QWORD *)(a1 + 40));
}

uint64_t __56__CSVoiceTriggerSecondPass__processSecondPassInExclave___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D19090], "exclaveRecordingNumSamples");
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 176) += result;
  return result;
}

void __136__CSVoiceTriggerSecondPass_audioStreamProvider_numSamplesAvailableInExclave_hostTime_arrivalHostTimeToAudioRecorder_exclaveSampleCount___block_invoke(uint64_t a1, uint64_t a2, unsigned int a3, unint64_t a4, unint64_t a5, double a6, float a7, float a8, float a9)
{
  NSObject *v18;
  void *v19;
  _BOOL8 v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  float v29;
  float v30;
  double v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  double v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  void *v52;
  double v53;
  void *v54;
  double v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  uint64_t v68;
  void *v69;
  double v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  id *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  uint64_t v97;
  uint64_t v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  _QWORD v108[34];
  _QWORD v109[34];
  uint8_t buf[4];
  const char *v111;
  __int16 v112;
  uint64_t v113;
  uint64_t v114;

  v114 = *MEMORY[0x1E0C80C00];
  v18 = *MEMORY[0x1E0D18F58];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v111 = "-[CSVoiceTriggerSecondPass audioStreamProvider:numSamplesAvailableInExclave:hostTime:arrivalHostTimeToAudioRe"
           "corder:exclaveSampleCount:]_block_invoke";
    v112 = 2050;
    v113 = a2;
    _os_log_impl(&dword_1C2614000, v18, OS_LOG_TYPE_DEFAULT, "%s Detected 2nd-pass trigger at %{public}llu", buf, 0x16u);
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "phraseDetectorInfoFromPhId:", a3);
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v106, "phraseConfig");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_getFirstPassTriggerSourceAsString:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 328));
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  +[CSBatteryMonitor sharedInstance](CSBatteryMonitor, "sharedInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "batteryState") == 2;

  objc_msgSend(*(id *)(a1 + 32), "_fetchSiriLocale");
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 176) + *(_QWORD *)(*(_QWORD *)(a1 + 32) + 280);
  v23 = (double)a4;
  v24 = (double)a5;
  objc_msgSend(MEMORY[0x1E0D19260], "systemUpTime");
  v26 = v25;
  objc_msgSend(*(id *)(a1 + 32), "_getExclaveAudioTimeConverter");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v98 = objc_msgSend(v27, "hostTimeFromSampleCount:", a4);

  objc_msgSend(*(id *)(a1 + 32), "_getExclaveAudioTimeConverter");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v97 = objc_msgSend(v28, "hostTimeFromSampleCount:", a5);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(*(_QWORD *)(a1 + 32) + 296));
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(*(_QWORD *)(a1 + 32) + 304));
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (float)(unint64_t)(*(_QWORD *)(a1 + 40) - a2);
  objc_msgSend(MEMORY[0x1E0D19090], "inputRecordingSampleRate");
  v31 = (float)(v29 / v30);
  v32 = *MEMORY[0x1E0D195D8];
  v109[0] = CFSTR("exclave-built-in");
  v33 = *MEMORY[0x1E0D195C0];
  v108[0] = v32;
  v108[1] = v33;
  objc_msgSend(MEMORY[0x1E0D19260], "deviceBuildVersion");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = *MEMORY[0x1E0D195D0];
  v109[1] = v102;
  v109[2] = CFSTR("N/A");
  v35 = *MEMORY[0x1E0D193F8];
  v108[2] = v34;
  v108[3] = v35;
  v109[3] = CFSTR("N/A");
  v108[4] = *MEMORY[0x1E0D194D0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v20);
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = *MEMORY[0x1E0D19500];
  v37 = MEMORY[0x1E0C9AAA0];
  v109[4] = v100;
  v109[5] = MEMORY[0x1E0C9AAA0];
  v38 = *MEMORY[0x1E0D19680];
  v108[5] = v36;
  v108[6] = v38;
  v109[6] = MEMORY[0x1E0C9AAA0];
  v108[7] = *MEMORY[0x1E0D19668];
  v39 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(MEMORY[0x1E0D19090], "inputRecordingSampleRate");
  objc_msgSend(v39, "numberWithFloat:");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  v109[7] = v99;
  v108[8] = *MEMORY[0x1E0D19788];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a2);
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  v109[8] = v96;
  v108[9] = *MEMORY[0x1E0D195C8];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a2);
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  v109[9] = v95;
  v108[10] = *MEMORY[0x1E0D196C8];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v22);
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  v109[10] = v94;
  v108[11] = *MEMORY[0x1E0D196D0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 280));
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = *MEMORY[0x1E0D19790];
  v109[11] = v93;
  v109[12] = &unk_1E7C63EC0;
  v41 = *MEMORY[0x1E0D19738];
  v108[12] = v40;
  v108[13] = v41;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v31);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  v109[13] = v92;
  v108[14] = *MEMORY[0x1E0D19798];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v23);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  v109[14] = v91;
  v108[15] = *MEMORY[0x1E0D19740];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v24);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  v109[15] = v90;
  v108[16] = *MEMORY[0x1E0D19720];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v24 - v23);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  v109[16] = v89;
  v108[17] = *MEMORY[0x1E0D19770];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v26);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = *MEMORY[0x1E0D19670];
  v109[17] = v88;
  v109[18] = v37;
  v43 = *MEMORY[0x1E0D19730];
  v108[18] = v42;
  v108[19] = v43;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 40));
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  v109[19] = v87;
  v108[20] = *MEMORY[0x1E0D19760];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 40));
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  v109[20] = v86;
  v108[21] = *MEMORY[0x1E0D195A8];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 216));
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v109[21] = v85;
  v108[22] = *MEMORY[0x1E0D19778];
  *(float *)&v44 = a7;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v44);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v109[22] = v84;
  v108[23] = *MEMORY[0x1E0D19590];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a3);
  v45 = objc_claimAutoreleasedReturnValue();
  v83 = (void *)v45;
  v46 = MEMORY[0x1E0C9AAB0];
  if (a8 <= 0.0)
    v46 = v37;
  v47 = *MEMORY[0x1E0D196C0];
  v109[23] = v45;
  v109[24] = v46;
  v48 = *MEMORY[0x1E0D194A8];
  v108[24] = v47;
  v108[25] = v48;
  v49 = *MEMORY[0x1E0D19660];
  v105 = (void *)v21;
  v109[25] = v21;
  v109[26] = v107;
  v50 = *MEMORY[0x1E0D19418];
  v108[26] = v49;
  v108[27] = v50;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a6);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v109[27] = v51;
  v108[28] = *MEMORY[0x1E0D19708];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 176));
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v109[28] = v52;
  v108[29] = *MEMORY[0x1E0D196E0];
  *(float *)&v53 = a8;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v53);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v109[29] = v54;
  v108[30] = *MEMORY[0x1E0D19698];
  *(float *)&v55 = a9;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v55);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v109[30] = v56;
  v108[31] = *MEMORY[0x1E0D195E8];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 208));
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v109[31] = v57;
  v108[32] = *MEMORY[0x1E0D19780];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v98);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v109[32] = v58;
  v108[33] = *MEMORY[0x1E0D19728];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v97);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v109[33] = v59;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v109, v108, 34);
  v60 = (void *)objc_claimAutoreleasedReturnValue();

  v61 = (void *)objc_msgSend(v60, "mutableCopy");
  objc_msgSend(v101, "name");
  v62 = (void *)objc_claimAutoreleasedReturnValue();

  if (v62)
  {
    objc_msgSend(v101, "name");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "setObject:forKey:", v63, *MEMORY[0x1E0D19588]);

  }
  v64 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v104, "doubleValue");
  objc_msgSend(v64, "numberWithDouble:");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "setObject:forKey:", v65, *MEMORY[0x1E0D197A8]);

  v66 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v103, "doubleValue");
  objc_msgSend(v66, "numberWithDouble:");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "setObject:forKey:", v67, *MEMORY[0x1E0D195E0]);

  if (objc_msgSend(*(id *)(a1 + 32), "_shouldLogMediaplayState:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 328)))
  {
    v68 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 368);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v68 == 1);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "setObject:forKey:", v69, *MEMORY[0x1E0D19678]);

    if (v68 == 1)
    {
      LODWORD(v70) = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 44);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v70);
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "setObject:forKey:", v71, *MEMORY[0x1E0D19688]);

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "audioProviderUUID");
  v72 = (void *)objc_claimAutoreleasedReturnValue();

  if (v72)
  {
    objc_msgSend(*(id *)(a1 + 32), "audioProviderUUID");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "setObject:forKey:", v73, *MEMORY[0x1E0D193E8]);

  }
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "UUIDString");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "setObject:forKey:", v75, *MEMORY[0x1E0D19560]);

  v76 = *(id **)(a1 + 32);
  if (v76[54])
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(MEMORY[0x1E0D19118], "hostTimeToNs:", objc_msgSend(v76[54], "secondPassAudioStreamStartTime")));
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "setObject:forKey:", v77, *MEMORY[0x1E0D19530]);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(MEMORY[0x1E0D19118], "hostTimeToNs:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "secondPassAudioStreamReadyTime")));
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "setObject:forKey:", v78, *MEMORY[0x1E0D19528]);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(MEMORY[0x1E0D19118], "hostTimeToNs:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "secondPassFirstAudioPacketReceptionTime")));
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "setObject:forKey:", v79, *MEMORY[0x1E0D19548]);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(MEMORY[0x1E0D19118], "hostTimeToNs:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "secondPassLastAudioPacketReceptionTime")));
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "setObject:forKey:", v80, *MEMORY[0x1E0D19550]);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(MEMORY[0x1E0D19118], "hostTimeToNs:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "secondPassCheckerModelKeywordDetectionStartTime")));
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "setObject:forKey:", v81, *MEMORY[0x1E0D19540]);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(MEMORY[0x1E0D19118], "hostTimeToNs:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "secondPassCheckerModelKeywordDetectionEndTime")));
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "setObject:forKey:", v82, *MEMORY[0x1E0D19538]);

    v76 = *(id **)(a1 + 32);
  }
  objc_msgSend(v76, "_handleSecondPassSuccess:", v61);

}

uint64_t __136__CSVoiceTriggerSecondPass_audioStreamProvider_numSamplesAvailableInExclave_hostTime_arrivalHostTimeToAudioRecorder_exclaveSampleCount___block_invoke_94(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_setStartAnalyzeTime:", *(_QWORD *)(a1 + 48));
  return objc_msgSend(*(id *)(a1 + 32), "_processSecondPassInExclave:", *(_QWORD *)(a1 + 40));
}

uint64_t __74__CSVoiceTriggerSecondPass_audioStreamProvider_didStopStreamUnexpectedly___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_didStopAudioStream");
}

void __83__CSVoiceTriggerSecondPass__notifySecondPassReject_result_isSecondChanceCandidate___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  _QWORD v6[5];
  id v7;
  uint64_t v8;
  char v9;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v4 = *(NSObject **)(v2 + 80);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __83__CSVoiceTriggerSecondPass__notifySecondPassReject_result_isSecondChanceCandidate___block_invoke_2;
  v6[3] = &unk_1E7C261F8;
  v5 = *(_QWORD *)(a1 + 48);
  v6[4] = v2;
  v8 = v5;
  v7 = v3;
  v9 = *(_BYTE *)(a1 + 56);
  dispatch_async(v4, v6);

}

uint64_t __83__CSVoiceTriggerSecondPass__notifySecondPassReject_result_isSecondChanceCandidate___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_didStopAudioStream");
  return objc_msgSend(*(id *)(a1 + 32), "_handleResultCompletion:voiceTriggerInfo:isSecondChanceCandidate:error:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56), 0);
}

void __82__CSVoiceTriggerSecondPass__voiceTriggerFirstPassDidDetectKeywordFrom_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  const char *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)*MEMORY[0x1E0D18F58];
  v7 = *MEMORY[0x1E0D18F58];
  if ((a2 & 1) == 0)
  {
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      goto LABEL_6;
    v11 = *(void **)(a1 + 32);
    v9 = v6;
    objc_msgSend(v11, "UUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedDescription");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 136315650;
    v14 = "-[CSVoiceTriggerSecondPass _voiceTriggerFirstPassDidDetectKeywordFrom:completion:]_block_invoke";
    v15 = 2114;
    v16 = v10;
    v17 = 2114;
    v18 = v12;
    _os_log_error_impl(&dword_1C2614000, v9, OS_LOG_TYPE_ERROR, "%s CSVoiceTriggerSecondPass[%{public}@]:AFSiriActivationBuiltInMicVoiceTriggerPrewarm failed : %{public}@", (uint8_t *)&v13, 0x20u);

    goto LABEL_4;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(void **)(a1 + 32);
    v9 = v6;
    objc_msgSend(v8, "UUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 136315394;
    v14 = "-[CSVoiceTriggerSecondPass _voiceTriggerFirstPassDidDetectKeywordFrom:completion:]_block_invoke";
    v15 = 2114;
    v16 = v10;
    _os_log_impl(&dword_1C2614000, v9, OS_LOG_TYPE_DEFAULT, "%s CSVoiceTriggerSecondPass[%{public}@]:AFSiriActivationBuiltInMicVoiceTriggerPrewarm success", (uint8_t *)&v13, 0x16u);
LABEL_4:

  }
LABEL_6:

}

void __82__CSVoiceTriggerSecondPass__voiceTriggerFirstPassDidDetectKeywordFrom_completion___block_invoke_75(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  const char *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)*MEMORY[0x1E0D18F58];
  v7 = *MEMORY[0x1E0D18F58];
  if ((a2 & 1) == 0)
  {
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      goto LABEL_6;
    v11 = *(void **)(a1 + 32);
    v9 = v6;
    objc_msgSend(v11, "UUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedDescription");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 136315650;
    v14 = "-[CSVoiceTriggerSecondPass _voiceTriggerFirstPassDidDetectKeywordFrom:completion:]_block_invoke";
    v15 = 2114;
    v16 = v10;
    v17 = 2114;
    v18 = v12;
    _os_log_error_impl(&dword_1C2614000, v9, OS_LOG_TYPE_ERROR, "%s CSVoiceTriggerSecondPass[%{public}@]:AFSiriActivationBluetoothDeviceVoiceTriggerPrewarm failed : %{public}@", (uint8_t *)&v13, 0x20u);

    goto LABEL_4;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(void **)(a1 + 32);
    v9 = v6;
    objc_msgSend(v8, "UUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 136315394;
    v14 = "-[CSVoiceTriggerSecondPass _voiceTriggerFirstPassDidDetectKeywordFrom:completion:]_block_invoke";
    v15 = 2114;
    v16 = v10;
    _os_log_impl(&dword_1C2614000, v9, OS_LOG_TYPE_DEFAULT, "%s CSVoiceTriggerSecondPass[%{public}@]:AFSiriActivationBluetoothDeviceVoiceTriggerPrewarm success", (uint8_t *)&v13, 0x16u);
LABEL_4:

  }
LABEL_6:

}

void __82__CSVoiceTriggerSecondPass__voiceTriggerFirstPassDidDetectKeywordFrom_completion___block_invoke_76(uint64_t a1, int a2, void *a3)
{
  void *v6;
  void *v7;
  NSObject *v8;
  id v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  int v13;
  const char *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  const __CFString *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = (void *)*MEMORY[0x1E0D18F58];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(void **)(a1 + 32);
    v8 = v6;
    v9 = a3;
    objc_msgSend(v7, "UUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v11 = CFSTR("YES");
    else
      v11 = CFSTR("NO");
    objc_msgSend(v9, "localizedDescription");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = 136315906;
    v14 = "-[CSVoiceTriggerSecondPass _voiceTriggerFirstPassDidDetectKeywordFrom:completion:]_block_invoke";
    v15 = 2114;
    v16 = v10;
    v17 = 2114;
    v18 = v11;
    v19 = 2114;
    v20 = v12;
    _os_log_impl(&dword_1C2614000, v8, OS_LOG_TYPE_DEFAULT, "%s CSVoiceTriggerSecondPass[%{public}@]:Finished prewarming Remora : %{public}@, error : %{public}@", (uint8_t *)&v13, 0x2Au);

  }
}

void __82__CSVoiceTriggerSecondPass__voiceTriggerFirstPassDidDetectKeywordFrom_completion___block_invoke_81(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void (**v11)(_QWORD, _QWORD, _QWORD);
  _BYTE *v12;
  void *v13;
  void *v14;
  CSVoiceTriggerSecondPassResultHolder *v15;
  uint64_t v16;
  CSVoiceTriggerSecondPassResultHolder *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  CSVoiceTriggerSecondPassResultHolder *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  void (*v42)(uint64_t, void *, void *);
  void *v43;
  uint64_t v44;
  id v45;
  uint8_t buf[4];
  const char *v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  void *v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 40), "mutableCopy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 408);
  *(_QWORD *)(v3 + 408) = v2;

  objc_msgSend(*(id *)(a1 + 48), "rejectionMHUUID");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 416);
  *(_QWORD *)(v6 + 416) = v5;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 14) = 0;
  objc_msgSend(*(id *)(a1 + 48), "firstpassMetrics");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(void **)(v9 + 424);
  *(_QWORD *)(v9 + 424) = v8;

  v40 = MEMORY[0x1E0C809B0];
  v41 = 3221225472;
  v42 = __82__CSVoiceTriggerSecondPass__voiceTriggerFirstPassDidDetectKeywordFrom_completion___block_invoke_2;
  v43 = &unk_1E7C239D8;
  v44 = *(_QWORD *)(a1 + 32);
  v45 = *(id *)(a1 + 72);
  v11 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1C3BC4734](&v40);
  v12 = *(_BYTE **)(a1 + 32);
  if (v12[10])
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18E80], 502, 0, v40, v41, v42, v43, v44);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)*MEMORY[0x1E0D18F58];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_ERROR))
    {
      v27 = *(void **)(a1 + 32);
      v28 = v14;
      objc_msgSend(v27, "UUID");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v47 = "-[CSVoiceTriggerSecondPass _voiceTriggerFirstPassDidDetectKeywordFrom:completion:]_block_invoke";
      v48 = 2114;
      v49 = v29;
      _os_log_error_impl(&dword_1C2614000, v28, OS_LOG_TYPE_ERROR, "%s CSVoiceTriggerSecondPass[%{public}@]:Ignoring first pass trigger since we are already performing second pass on a trigger candidate", buf, 0x16u);

    }
    v15 = [CSVoiceTriggerSecondPassResultHolder alloc];
    v16 = 8;
  }
  else
  {
    objc_msgSend(v12, "_scheduleSecondPassCompletionWatchDog", v40, v41, v42, v43, v44);
    objc_msgSend(*(id *)(a1 + 32), "_reset");
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 10) = 1;
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 12) = 0;
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 472) = 0;
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 464) = 0;
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 168) = 0;
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 176) = 0;
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 328) = *(_QWORD *)(a1 + 80);
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 336), *(id *)(a1 + 56));
    objc_msgSend(*(id *)(a1 + 32), "_getDidWakeAP:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "_resetStartAnalyzeTime");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "setRunAsSecondChance:", *(unsigned __int8 *)(a1 + 88));
    objc_msgSend(*(id *)(a1 + 32), "setZeroFilter:", 0);
    switch(*(_QWORD *)(a1 + 80))
    {
      case 1:
      case 5:
      case 8:
      case 9:
        objc_msgSend(*(id *)(a1 + 32), "_handleVoiceTriggerFirstPassFromAP:audioProviderUUID:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64), v11);
        goto LABEL_6;
      case 2:
        if (!CSHasAOP())
        {
          v31 = (void *)*MEMORY[0x1E0D18F58];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_ERROR))
          {
            v37 = *(void **)(a1 + 32);
            v38 = v31;
            objc_msgSend(v37, "UUID");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136315394;
            v47 = "-[CSVoiceTriggerSecondPass _voiceTriggerFirstPassDidDetectKeywordFrom:completion:]_block_invoke";
            v48 = 2114;
            v49 = v39;
            _os_log_error_impl(&dword_1C2614000, v38, OS_LOG_TYPE_ERROR, "%s CSVoiceTriggerSecondPass[%{public}@]:Unable to handle VoiceTrigger AOP first pass on this platform", buf, 0x16u);

          }
          v22 = -[CSVoiceTriggerSecondPassResultHolder initWithResult:voiceTriggerEventInfo:isSecondChanceCandidate:]([CSVoiceTriggerSecondPassResultHolder alloc], "initWithResult:voiceTriggerEventInfo:isSecondChanceCandidate:", 4, 0, 0);
          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18E80], 114, 0);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, CSVoiceTriggerSecondPassResultHolder *, void *))v11)[2](v11, v22, v32);

          goto LABEL_23;
        }
        objc_msgSend(*(id *)(a1 + 32), "_handleVoiceTriggerFirstPassFromAOP:audioProviderUUID:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64), v11);
        goto LABEL_6;
      case 3:
        v19 = *(_QWORD *)(a1 + 56);
        v18 = *(_QWORD *)(a1 + 64);
        v20 = *(void **)(a1 + 32);
        v21 = *(_QWORD *)(a1 + 40);
        objc_msgSend(*(id *)(a1 + 48), "rtModelRequestOptions");
        v22 = (CSVoiceTriggerSecondPassResultHolder *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "_handleVoiceTriggerFirstPassFromHearst:deviceId:audioProviderUUID:firstPassInfo:rtModelRequestOptions:completion:", 3, v19, v18, v21, v22, v11);
        goto LABEL_23;
      case 4:
        objc_msgSend(*(id *)(a1 + 32), "_handleVoiceTriggerFirstPassFromJarvis:deviceId:audioProviderUUID:firstPassInfo:completion:", 4, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 40), v11);
        goto LABEL_6;
      case 6:
        v24 = *(_QWORD *)(a1 + 56);
        v23 = *(_QWORD *)(a1 + 64);
        v25 = *(void **)(a1 + 32);
        v26 = *(_QWORD *)(a1 + 40);
        objc_msgSend(*(id *)(a1 + 48), "rtModelRequestOptions");
        v22 = (CSVoiceTriggerSecondPassResultHolder *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "_handleVoiceTriggerFirstPassFromHearstAP:deviceId:audioProviderUUID:firstPassInfo:rtModelRequestOptions:completion:", 6, v24, v23, v26, v22, v11);
LABEL_23:

        goto LABEL_6;
      case 7:
        objc_msgSend(*(id *)(a1 + 32), "_handleVoiceTriggerFirstPassFromRemora:deviceId:audioProviderUUID:firstPassInfo:completion:", 7, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 40), v11);
        goto LABEL_6;
      default:
        if (objc_msgSend(*(id *)(a1 + 32), "_isFirstPassSourceExclave:"))
        {
          objc_msgSend(*(id *)(a1 + 32), "_handleVoiceTriggerFirstPassFromExclave:audioProviderUUID:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64), v11);
          goto LABEL_6;
        }
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18E80], 501, 0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = (void *)*MEMORY[0x1E0D18F58];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_ERROR))
        {
          v33 = *(void **)(a1 + 32);
          v34 = v30;
          objc_msgSend(v33, "UUID");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "localizedDescription");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315650;
          v47 = "-[CSVoiceTriggerSecondPass _voiceTriggerFirstPassDidDetectKeywordFrom:completion:]_block_invoke";
          v48 = 2114;
          v49 = v35;
          v50 = 2114;
          v51 = v36;
          _os_log_error_impl(&dword_1C2614000, v34, OS_LOG_TYPE_ERROR, "%s CSVoiceTriggerSecondPass[%{public}@]:Unable to handle VoiceTrigger first pass : %{public}@", buf, 0x20u);

        }
        v15 = [CSVoiceTriggerSecondPassResultHolder alloc];
        v16 = 4;
        break;
    }
  }
  v17 = -[CSVoiceTriggerSecondPassResultHolder initWithResult:voiceTriggerEventInfo:isSecondChanceCandidate:](v15, "initWithResult:voiceTriggerEventInfo:isSecondChanceCandidate:", v16, 0, 0);
  ((void (**)(_QWORD, CSVoiceTriggerSecondPassResultHolder *, void *))v11)[2](v11, v17, v13);

LABEL_6:
}

void __82__CSVoiceTriggerSecondPass__voiceTriggerFirstPassDidDetectKeywordFrom_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;

  v13 = a2;
  v5 = a3;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 328) = 0;
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 336);
  *(_QWORD *)(v6 + 336) = 0;

  if (objc_msgSend(v13, "result") != 8)
  {
    objc_msgSend(*(id *)(a1 + 32), "_clearTriggerCandidate");
    objc_msgSend(*(id *)(a1 + 32), "_clearSecondPassCompletionWatchDog");
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(void **)(v8 + 128);
    *(_QWORD *)(v8 + 128) = 0;

  }
  if ((CSIsHorseman() & 1) != 0 || CSIsIOS())
  {
    +[CSVoiceTriggerStatistics sharedInstance](CSVoiceTriggerStatistics, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "voiceTriggerEventInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "updateVTEstimationStatistics:", v11);

  }
  v12 = *(_QWORD *)(a1 + 40);
  if (v12)
    (*(void (**)(uint64_t, id, id))(v12 + 16))(v12, v13, v5);

}

uint64_t __48__CSVoiceTriggerSecondPass_cancelCurrentRequest__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[5];

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 440), "flush");
  objc_msgSend(*(id *)(a1 + 32), "audioStream");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "audioStream");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __48__CSVoiceTriggerSecondPass_cancelCurrentRequest__block_invoke_2;
    v14[3] = &unk_1E7C29060;
    v14[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v3, "stopAudioStreamWithOption:completion:", 0, v14);

  }
  v4 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v4 + 14))
  {
    v5 = CSIsInternalBuild();
    v4 = *(_QWORD *)(a1 + 32);
    if (v5)
    {
      v6 = *(void **)(v4 + 408);
      if (!v6)
      {
        v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        v8 = *(_QWORD *)(a1 + 32);
        v9 = *(void **)(v8 + 408);
        *(_QWORD *)(v8 + 408) = v7;

        v4 = *(_QWORD *)(a1 + 32);
        v6 = *(void **)(v4 + 408);
      }
      objc_msgSend((id)v4, "_getFirstPassTriggerSourceAsString:", *(_QWORD *)(v4 + 328));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKey:", v10, *MEMORY[0x1E0D19660]);

      objc_msgSend(MEMORY[0x1E0D19120], "sharedLogger");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "logStartEventWithFirstPassStartedInfo:withMHUUID:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 408), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 416));

      objc_msgSend(MEMORY[0x1E0D19120], "sharedLogger");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "logCancelledEventWithMHUUID:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 416));

      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 14) = 1;
      v4 = *(_QWORD *)(a1 + 32);
    }
  }
  return objc_msgSend((id)v4, "_resetVoiceTriggerLatencyMetrics");
}

void __48__CSVoiceTriggerSecondPass_cancelCurrentRequest__block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  _QWORD block[5];

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(NSObject **)(v1 + 80);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__CSVoiceTriggerSecondPass_cancelCurrentRequest__block_invoke_3;
  block[3] = &unk_1E7C292C8;
  block[4] = v1;
  dispatch_async(v2, block);
}

uint64_t __48__CSVoiceTriggerSecondPass_cancelCurrentRequest__block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_didStopAudioStream");
  return objc_msgSend(*(id *)(a1 + 32), "_handleResultCompletion:voiceTriggerInfo:isSecondChanceCandidate:error:", 6, 0, 0, 0);
}

void __119__CSVoiceTriggerSecondPass__handleVoiceTriggerFirstPassFromJarvis_deviceId_audioProviderUUID_firstPassInfo_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  uint64_t v6;
  CSVoiceTriggerSecondPassResultHolder *v7;
  id v8;

  v5 = a3;
  if ((a2 & 1) == 0)
  {
    v6 = *(_QWORD *)(a1 + 32);
    if (v6)
    {
      v8 = v5;
      v7 = -[CSVoiceTriggerSecondPassResultHolder initWithResult:voiceTriggerEventInfo:isSecondChanceCandidate:]([CSVoiceTriggerSecondPassResultHolder alloc], "initWithResult:voiceTriggerEventInfo:isSecondChanceCandidate:", 4, 0, 0);
      (*(void (**)(uint64_t, CSVoiceTriggerSecondPassResultHolder *, id))(v6 + 16))(v6, v7, v8);

      v5 = v8;
    }
  }

}

void __143__CSVoiceTriggerSecondPass__handleVoiceTriggerFirstPassFromHearstAP_deviceId_audioProviderUUID_firstPassInfo_rtModelRequestOptions_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  uint64_t v6;
  CSVoiceTriggerSecondPassResultHolder *v7;
  id v8;

  v5 = a3;
  if (a2)
  {
    v8 = v5;
    objc_msgSend(*(id *)(a1 + 32), "setResultCompletion:", *(_QWORD *)(a1 + 40));
LABEL_5:
    v5 = v8;
    goto LABEL_6;
  }
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
  {
    v8 = v5;
    v7 = -[CSVoiceTriggerSecondPassResultHolder initWithResult:voiceTriggerEventInfo:isSecondChanceCandidate:]([CSVoiceTriggerSecondPassResultHolder alloc], "initWithResult:voiceTriggerEventInfo:isSecondChanceCandidate:", 4, 0, 0);
    (*(void (**)(uint64_t, CSVoiceTriggerSecondPassResultHolder *, id))(v6 + 16))(v6, v7, v8);

    goto LABEL_5;
  }
LABEL_6:

}

void __119__CSVoiceTriggerSecondPass__handleVoiceTriggerFirstPassFromRemora_deviceId_audioProviderUUID_firstPassInfo_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  uint64_t v6;
  CSVoiceTriggerSecondPassResultHolder *v7;
  id v8;

  v5 = a3;
  if ((a2 & 1) == 0)
  {
    v6 = *(_QWORD *)(a1 + 32);
    if (v6)
    {
      v8 = v5;
      v7 = -[CSVoiceTriggerSecondPassResultHolder initWithResult:voiceTriggerEventInfo:isSecondChanceCandidate:]([CSVoiceTriggerSecondPassResultHolder alloc], "initWithResult:voiceTriggerEventInfo:isSecondChanceCandidate:", 4, 0, 0);
      (*(void (**)(uint64_t, CSVoiceTriggerSecondPassResultHolder *, id))(v6 + 16))(v6, v7, v8);

      v5 = v8;
    }
  }

}

void __141__CSVoiceTriggerSecondPass__handleVoiceTriggerFirstPassFromHearst_deviceId_audioProviderUUID_firstPassInfo_rtModelRequestOptions_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  uint64_t v6;
  CSVoiceTriggerSecondPassResultHolder *v7;
  id v8;

  v5 = a3;
  if ((a2 & 1) == 0)
  {
    v6 = *(_QWORD *)(a1 + 32);
    if (v6)
    {
      v8 = v5;
      v7 = -[CSVoiceTriggerSecondPassResultHolder initWithResult:voiceTriggerEventInfo:isSecondChanceCandidate:]([CSVoiceTriggerSecondPassResultHolder alloc], "initWithResult:voiceTriggerEventInfo:isSecondChanceCandidate:", 4, 0, 0);
      (*(void (**)(uint64_t, CSVoiceTriggerSecondPassResultHolder *, id))(v6 + 16))(v6, v7, v8);

      v5 = v8;
    }
  }

}

void __92__CSVoiceTriggerSecondPass__handleVoiceTriggerFirstPassFromAP_audioProviderUUID_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  uint64_t v6;
  CSVoiceTriggerSecondPassResultHolder *v7;
  id v8;

  v5 = a3;
  if ((a2 & 1) == 0)
  {
    v6 = *(_QWORD *)(a1 + 32);
    if (v6)
    {
      v8 = v5;
      v7 = -[CSVoiceTriggerSecondPassResultHolder initWithResult:voiceTriggerEventInfo:isSecondChanceCandidate:]([CSVoiceTriggerSecondPassResultHolder alloc], "initWithResult:voiceTriggerEventInfo:isSecondChanceCandidate:", 4, 0, 0);
      (*(void (**)(uint64_t, CSVoiceTriggerSecondPassResultHolder *, id))(v6 + 16))(v6, v7, v8);

      v5 = v8;
    }
  }

}

uint64_t __97__CSVoiceTriggerSecondPass__handleVoiceTriggerFirstPassFromExclave_audioProviderUUID_completion___block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = a3;
  return result;
}

void __97__CSVoiceTriggerSecondPass__handleVoiceTriggerFirstPassFromExclave_audioProviderUUID_completion___block_invoke_66(uint64_t a1, char a2, void *a3)
{
  id v5;
  uint64_t v6;
  CSVoiceTriggerSecondPassResultHolder *v7;
  id v8;

  v5 = a3;
  if ((a2 & 1) == 0)
  {
    v6 = *(_QWORD *)(a1 + 32);
    if (v6)
    {
      v8 = v5;
      v7 = -[CSVoiceTriggerSecondPassResultHolder initWithResult:voiceTriggerEventInfo:isSecondChanceCandidate:]([CSVoiceTriggerSecondPassResultHolder alloc], "initWithResult:voiceTriggerEventInfo:isSecondChanceCandidate:", 4, 0, 0);
      (*(void (**)(uint64_t, CSVoiceTriggerSecondPassResultHolder *, id))(v6 + 16))(v6, v7, v8);

      v5 = v8;
    }
  }

}

void __110__CSVoiceTriggerSecondPass__requestStartAudioStreamWitContext_audioProviderUUID_startStreamOption_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id WeakRetained;
  void *v6;
  uint64_t v7;
  id v8;

  v8 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_voiceTriggerSecondPassLatencyMetrics");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSecondPassAudioStreamReadyTime:", mach_absolute_time());

  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v8);

}

void __110__CSVoiceTriggerSecondPass__requestStartAudioStreamWitContext_audioProviderUUID_startStreamOption_completion___block_invoke_60(uint64_t a1, char a2, void *a3)
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
  v8 = *(NSObject **)(v6 + 80);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __110__CSVoiceTriggerSecondPass__requestStartAudioStreamWitContext_audioProviderUUID_startStreamOption_completion___block_invoke_2;
  v10[3] = &unk_1E7C29100;
  v10[4] = v6;
  v13 = a2;
  v11 = v5;
  v12 = v7;
  v9 = v5;
  dispatch_async(v8, v10);

}

uint64_t __110__CSVoiceTriggerSecondPass__requestStartAudioStreamWitContext_audioProviderUUID_startStreamOption_completion___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_didStartAudioStream:", *(unsigned __int8 *)(a1 + 56));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __56__CSVoiceTriggerSecondPass__initializeMediaPlayingState__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  NSObject *v3;
  _QWORD v4[6];

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(NSObject **)(v2 + 80);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __56__CSVoiceTriggerSecondPass__initializeMediaPlayingState__block_invoke_2;
  v4[3] = &unk_1E7C29178;
  v4[4] = v2;
  v4[5] = a2;
  dispatch_async(v3, v4);
}

void __56__CSVoiceTriggerSecondPass__initializeMediaPlayingState__block_invoke_3(uint64_t a1, float a2)
{
  uint64_t v2;
  NSObject *v3;
  _QWORD v4[5];
  float v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(NSObject **)(v2 + 80);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __56__CSVoiceTriggerSecondPass__initializeMediaPlayingState__block_invoke_4;
  v4[3] = &unk_1E7C27848;
  v4[4] = v2;
  v5 = a2;
  dispatch_async(v3, v4);
}

float __56__CSVoiceTriggerSecondPass__initializeMediaPlayingState__block_invoke_4(uint64_t a1)
{
  float result;

  result = *(float *)(a1 + 40);
  *(float *)(*(_QWORD *)(a1 + 32) + 44) = result;
  return result;
}

uint64_t __56__CSVoiceTriggerSecondPass__initializeMediaPlayingState__block_invoke_2(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(result + 32) + 368) = *(_QWORD *)(result + 40);
  return result;
}

uint64_t __37__CSVoiceTriggerSecondPass_setAsset___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setAsset:", *(_QWORD *)(a1 + 40));
}

uint64_t __33__CSVoiceTriggerSecondPass_reset__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reset");
}

void __48__CSVoiceTriggerSecondPass_setSecondPassClient___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
    WeakRetained[43] = *(_QWORD *)(a1 + 40);

}

void __49__CSVoiceTriggerSecondPass_setFirstPassDeviceId___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 336), *(id *)(a1 + 40));
}

uint64_t __47__CSVoiceTriggerSecondPass_setFirstPassSource___block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(result + 32) + 328) = *(_QWORD *)(result + 40);
  return result;
}

void __35__CSVoiceTriggerSecondPass_prewarm__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;

  if (CSIsHorseman())
  {
    v2 = *(_QWORD *)(a1 + 32);
    if (*(_QWORD *)(v2 + 456))
    {
      if (*(_QWORD *)(v2 + 448))
      {
        v3 = (void *)MEMORY[0x1E0D19160];
        objc_msgSend(*(id *)(v2 + 96), "configPathRecognizer");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "readBnnsIrFromModelConfig:modelType:", v4, 1);
        v5 = (id)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0D19260], "faultPagesWithVaddr:mmapedSize:filePath:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 456), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 448), v5);
      }
    }
  }
}

void __60__CSVoiceTriggerSecondPass_setSupportsMultiPhraseDetection___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  NSObject *v4;
  _BOOL4 v5;
  int v6;
  char v7;
  int v8;
  const char *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_fetchSiriLocale");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(MEMORY[0x1E0D19260], "supportsMphForLanguageCode:", v2);
  v4 = *MEMORY[0x1E0D18F58];
  v5 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      v6 = *(unsigned __int8 *)(a1 + 40);
      v8 = 136315650;
      v9 = "-[CSVoiceTriggerSecondPass setSupportsMultiPhraseDetection:]_block_invoke";
      v10 = 2112;
      v11 = v2;
      v12 = 1024;
      v13 = v6;
      _os_log_impl(&dword_1C2614000, v4, OS_LOG_TYPE_DEFAULT, "%s User choose multiphrase detection for locale %@? : %d", (uint8_t *)&v8, 0x1Cu);
    }
    v7 = *(_BYTE *)(a1 + 40);
  }
  else
  {
    if (v5)
    {
      v8 = 136315395;
      v9 = "-[CSVoiceTriggerSecondPass setSupportsMultiPhraseDetection:]_block_invoke";
      v10 = 2113;
      v11 = v2;
      _os_log_impl(&dword_1C2614000, v4, OS_LOG_TYPE_DEFAULT, "%s Device or locale(%{private}@) is not capable of supporting multiphrase", (uint8_t *)&v8, 0x16u);
    }
    v7 = 0;
  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 15) = v7;

}

void __45__CSVoiceTriggerSecondPass_setSpeechManager___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 72), *(id *)(a1 + 40));
}

+ (id)secondPassAudioLoggingFilePathWithDeviceId:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v11;

  v3 = a3;
  +[CSVoiceTriggerSecondPass secondPassAudioLogDirectory](CSVoiceTriggerSecondPass, "secondPassAudioLogDirectory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CB3940];
  +[CSVoiceTriggerSecondPass timeStampString](CSVoiceTriggerSecondPass, "timeStampString");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v3)
    objc_msgSend(v5, "stringWithFormat:", CFSTR("%@%@%@.wav"), v6, v3, CFSTR("-activation"));
  else
    objc_msgSend(v5, "stringWithFormat:", CFSTR("%@%@.wav"), v6, CFSTR("-activation"), v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "stringByAppendingPathComponent:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)secondPassAudioLogDirectory
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
        v13 = "+[CSVoiceTriggerSecondPass secondPassAudioLogDirectory]";
        v14 = 2114;
        v15 = v4;
        v16 = 2114;
        v17 = v10;
        _os_log_error_impl(&dword_1C2614000, v9, OS_LOG_TYPE_ERROR, "%s Couldn't create voice trigger audio logging directory at path %{public}@ %{public}@", buf, 0x20u);

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

+ (id)stringForSecondPassResult:(unint64_t)a3
{
  if (a3 > 0xA)
    return CFSTR("n/a");
  else
    return off_1E7C23AC0[a3];
}

@end
