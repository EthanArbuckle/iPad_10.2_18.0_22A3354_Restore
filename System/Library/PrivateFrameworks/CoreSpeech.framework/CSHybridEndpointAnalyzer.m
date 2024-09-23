@implementation CSHybridEndpointAnalyzer

- (CSHybridEndpointAnalyzer)init
{
  CSHybridEndpointAnalyzer *v2;
  CSHybridEndpointAnalyzer *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  OS_dispatch_queue *stateSerialQueue;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  OS_dispatch_queue *asrFeaturesQueue;
  void *v17;
  CSAssetDownloadingOption *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  CSHybridEndpointAnalyzer *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  OS_dispatch_queue *apQueue;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  OS_dispatch_queue *hybridClassifierQueue;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  OS_dispatch_queue *osdQueue;
  float v41;
  CSASRFeatures *v42;
  uint64_t v43;
  CSASRFeatures *lastKnownASRFeatures;
  uint64_t v45;
  OSDFeatures *lastKnownOSDFeatures;
  uint64_t block;
  uint64_t v49;
  uint64_t (*v50)(uint64_t);
  void *v51;
  CSHybridEndpointAnalyzer *v52;
  objc_super v53;

  v53.receiver = self;
  v53.super_class = (Class)CSHybridEndpointAnalyzer;
  v2 = -[CSHybridEndpointAnalyzer init](&v53, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_didCommunicateEndpoint = 0;
    v2->_speechEndpointDetected = 0;
    v2->_didAddAudio = 0;
    v2->_vtEndInSampleCount = 0;
    v2->_numSamplesProcessed = 0;
    v2->_lastEndpointPosterior = 0.0;
    v4 = 0;
    if ((objc_msgSend(MEMORY[0x1E0D19260], "supportsDispatchWorkloop") & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0D19260], "rootQueueWithFixedPriority:", *MEMORY[0x1E0D192F0]);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v5 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend((id)objc_opt_class(), "description");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "lowercaseString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("com.apple.cs.%@.stateserialqueue"), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[CSHybridEndpointAnalyzer _getSerialQueueWithName:targetQueue:](v3, "_getSerialQueueWithName:targetQueue:", v8, v4);
    v9 = objc_claimAutoreleasedReturnValue();
    stateSerialQueue = v3->_stateSerialQueue;
    v3->_stateSerialQueue = (OS_dispatch_queue *)v9;

    v11 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend((id)objc_opt_class(), "description");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "lowercaseString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR("com.apple.cs.%@.asrFeaturesQueue"), v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    -[CSHybridEndpointAnalyzer _getSerialQueueWithName:targetQueue:](v3, "_getSerialQueueWithName:targetQueue:", v14, v4);
    v15 = objc_claimAutoreleasedReturnValue();
    asrFeaturesQueue = v3->_asrFeaturesQueue;
    v3->_asrFeaturesQueue = (OS_dispatch_queue *)v15;

    objc_msgSend(MEMORY[0x1E0D19158], "sharedInstance");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObserver:", v3);

    v18 = objc_alloc_init(CSAssetDownloadingOption);
    -[CSAssetDownloadingOption setAllowEndpointAssetDownloading:](v18, "setAllowEndpointAssetDownloading:", 1);
    +[CSAssetManager sharedManager](CSAssetManager, "sharedManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setAssetDownloadingOption:", v18);

    +[CSAssetManager sharedManager](CSAssetManager, "sharedManager");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addObserver:forAssetType:", v3, 1);

    v21 = v3->_stateSerialQueue;
    block = MEMORY[0x1E0C809B0];
    v49 = 3221225472;
    v50 = __32__CSHybridEndpointAnalyzer_init__block_invoke;
    v51 = &unk_1E7C292C8;
    v22 = v3;
    v52 = v22;
    dispatch_async(v21, &block);
    v23 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend((id)objc_opt_class(), "description");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "lowercaseString");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "stringWithFormat:", CFSTR("com.apple.cs.%@.apQueue"), v25, block, v49, v50, v51);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    -[CSHybridEndpointAnalyzer _getSerialQueueWithName:targetQueue:](v22, "_getSerialQueueWithName:targetQueue:", v26, v4);
    v27 = objc_claimAutoreleasedReturnValue();
    apQueue = v22->_apQueue;
    v22->_apQueue = (OS_dispatch_queue *)v27;

    v29 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend((id)objc_opt_class(), "description");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "lowercaseString");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "stringWithFormat:", CFSTR("com.apple.cs.%@.hybridClassifierfQueue"), v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    -[CSHybridEndpointAnalyzer _getSerialQueueWithName:targetQueue:](v22, "_getSerialQueueWithName:targetQueue:", v32, v4);
    v33 = objc_claimAutoreleasedReturnValue();
    hybridClassifierQueue = v22->_hybridClassifierQueue;
    v22->_hybridClassifierQueue = (OS_dispatch_queue *)v33;

    v35 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend((id)objc_opt_class(), "description");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "lowercaseString");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "stringWithFormat:", CFSTR("com.apple.cs.%@.osdQueue"), v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    -[CSHybridEndpointAnalyzer _getSerialQueueWithName:targetQueue:](v22, "_getSerialQueueWithName:targetQueue:", v38, v4);
    v39 = objc_claimAutoreleasedReturnValue();
    osdQueue = v22->_osdQueue;
    v22->_osdQueue = (OS_dispatch_queue *)v39;

    objc_msgSend(MEMORY[0x1E0D19090], "inputRecordingSampleRate");
    v22->_currentRequestSampleRate = (unint64_t)v41;
    v42 = [CSASRFeatures alloc];
    v43 = -[CSASRFeatures initWithWordCount:trailingSilenceDuration:eosLikelihood:pauseCounts:silencePosterior:taskName:processedAudioDurationInMilliseconds:acousticEndpointerScore:](v42, "initWithWordCount:trailingSilenceDuration:eosLikelihood:pauseCounts:silencePosterior:taskName:processedAudioDurationInMilliseconds:acousticEndpointerScore:", 0, 0, MEMORY[0x1E0C9AA60], CFSTR("SearchOrMessaging"), 0, 8.98999977, 0.997685015, 0.0);
    lastKnownASRFeatures = v22->_lastKnownASRFeatures;
    v22->_lastKnownASRFeatures = (CSASRFeatures *)v43;

    v22->_lastKnownASRFeatureLatency = -0.01;
    v22->_epResult = 0;
    v45 = objc_msgSend(objc_alloc(MEMORY[0x1E0DA8D38]), "initWithSilenceFramesCountMs:silenceProbability:silenceDurationMs:processedAudioMs:", 0.0, 0.0, 0.0, 0.0);
    lastKnownOSDFeatures = v22->_lastKnownOSDFeatures;
    v22->_lastKnownOSDFeatures = (OSDFeatures *)v45;

    *(_OWORD *)&v22->_clientLagThresholdMs = xmmword_1C276CE10;
    v22->_useDefaultASRFeaturesOnClientLag = 1;

  }
  return v3;
}

- (id)_getSerialQueueWithName:(id)a3 targetQueue:(id)a4
{
  NSObject *v5;
  uint64_t v6;
  void *v7;

  v5 = a4;
  if (v5)
  {
    v6 = (uint64_t)dispatch_queue_create_with_target_V2((const char *)objc_msgSend(objc_retainAutorelease(a3), "UTF8String"), 0, v5);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D19260], "getSerialQueueWithQOS:name:fixedPriority:", 33, a3, *MEMORY[0x1E0D192F0]);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v7 = (void *)v6;

  return v7;
}

- (void)_loadAndSetupEndpointerAssetIfNecessary
{
  CSAsset *currentAsset;
  id v4;
  void *v5;
  void *v6;
  NSString *v7;
  void *v8;
  NSObject *v9;
  NSString *endpointerModelVersion;
  void *v11;
  CSAsset *v12;
  CSAsset *v13;
  NSObject *v14;
  _BOOL4 v15;
  NSObject *v16;
  void *v17;
  id v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  CSAsset *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  currentAsset = self->_currentAsset;
  if (currentAsset)
  {
LABEL_2:
    -[CSHybridEndpointAnalyzer _readParametersFromHEPAsset:](self, "_readParametersFromHEPAsset:", currentAsset);
    v4 = objc_alloc(MEMORY[0x1E0D1F130]);
    -[CSAsset path](self->_currentAsset, "path");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0;
    v6 = (void *)objc_msgSend(v4, "initWithConfiguration:modelVersion:", v5, &v18);
    v7 = (NSString *)v18;

    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0D190B8], "sharedInstance");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "submitEndpointerIssueReport:", *MEMORY[0x1E0D19330]);

      v9 = *MEMORY[0x1E0D18F60];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        v20 = "-[CSHybridEndpointAnalyzer _loadAndSetupEndpointerAssetIfNecessary]";
        _os_log_fault_impl(&dword_1C2614000, v9, OS_LOG_TYPE_FAULT, "%s endpointerModelVersion is still nil after fetching it from EAREndpointer", buf, 0xCu);
      }
    }
    endpointerModelVersion = self->_endpointerModelVersion;
    self->_endpointerModelVersion = v7;

    return;
  }
  +[CSAssetManager sharedManager](CSAssetManager, "sharedManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "assetForCurrentLanguageOfType:", 1);
  v12 = (CSAsset *)objc_claimAutoreleasedReturnValue();
  v13 = self->_currentAsset;
  self->_currentAsset = v12;

  currentAsset = self->_currentAsset;
  v14 = *MEMORY[0x1E0D18F60];
  v15 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT);
  if (currentAsset)
  {
    if (v15)
    {
      v16 = v14;
      -[CSAsset path](currentAsset, "path");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v20 = "-[CSHybridEndpointAnalyzer _loadAndSetupEndpointerAssetIfNecessary]";
      v21 = 2114;
      v22 = currentAsset;
      v23 = 2114;
      v24 = v17;
      _os_log_impl(&dword_1C2614000, v16, OS_LOG_TYPE_DEFAULT, "%s HEP Asset: %{public}@, path: %{public}@", buf, 0x20u);

      currentAsset = self->_currentAsset;
    }
    goto LABEL_2;
  }
  if (v15)
  {
    *(_DWORD *)buf = 136315138;
    v20 = "-[CSHybridEndpointAnalyzer _loadAndSetupEndpointerAssetIfNecessary]";
    _os_log_impl(&dword_1C2614000, v14, OS_LOG_TYPE_DEFAULT, "%s Failed to get HEP asset", buf, 0xCu);
  }
}

- (NSString)endpointerModelVersion
{
  NSString *endpointerModelVersion;
  NSObject *stateSerialQueue;
  _QWORD block[5];

  endpointerModelVersion = self->_endpointerModelVersion;
  if (!endpointerModelVersion)
  {
    stateSerialQueue = self->_stateSerialQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __50__CSHybridEndpointAnalyzer_endpointerModelVersion__block_invoke;
    block[3] = &unk_1E7C292C8;
    block[4] = self;
    dispatch_async_and_wait(stateSerialQueue, block);
    endpointerModelVersion = self->_endpointerModelVersion;
  }
  return endpointerModelVersion;
}

- (void)processAudioSamplesAsynchronously:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *stateSerialQueue;
  id v9;
  NSObject *v10;
  NSObject *apQueue;
  _QWORD v12[5];
  id v13;
  __int128 *p_buf;
  _QWORD v15[6];
  _QWORD block[5];
  id v17;
  __int128 buf;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (self->_recordingDidStop)
  {
    v6 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 136315138;
      *(_QWORD *)((char *)&buf + 4) = "-[CSHybridEndpointAnalyzer processAudioSamplesAsynchronously:]";
      _os_log_impl(&dword_1C2614000, v6, OS_LOG_TYPE_INFO, "%s HEP::RecordingDidStop: Ignoring processAudioSamplesAsynchronously: Not queueing", (uint8_t *)&buf, 0xCu);
    }
  }
  else
  {
    v7 = MEMORY[0x1E0C809B0];
    stateSerialQueue = self->_stateSerialQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __62__CSHybridEndpointAnalyzer_processAudioSamplesAsynchronously___block_invoke;
    block[3] = &unk_1E7C292A0;
    block[4] = self;
    v9 = v4;
    v17 = v9;
    dispatch_async_and_wait(stateSerialQueue, block);
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v19 = 0x2020000000;
    v20 = 0;
    v10 = self->_stateSerialQueue;
    v15[0] = v7;
    v15[1] = 3221225472;
    v15[2] = __62__CSHybridEndpointAnalyzer_processAudioSamplesAsynchronously___block_invoke_48;
    v15[3] = &unk_1E7C29228;
    v15[4] = self;
    v15[5] = &buf;
    dispatch_async_and_wait(v10, v15);
    apQueue = self->_apQueue;
    v12[0] = v7;
    v12[1] = 3221225472;
    v12[2] = __62__CSHybridEndpointAnalyzer_processAudioSamplesAsynchronously___block_invoke_2;
    v12[3] = &unk_1E7C277D0;
    v12[4] = self;
    v13 = v9;
    p_buf = &buf;
    dispatch_async(apQueue, v12);

    _Block_object_dispose(&buf, 8);
  }

}

- (void)updateEndpointerThreshold:(float)a3
{
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  double v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  -[_EAREndpointer updateEndpointerThresholdWithValue:](self->_hybridClassifier, "updateEndpointerThresholdWithValue:");
  v4 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315394;
    v6 = "-[CSHybridEndpointAnalyzer updateEndpointerThreshold:]";
    v7 = 2050;
    v8 = a3;
    _os_log_impl(&dword_1C2614000, v4, OS_LOG_TYPE_DEFAULT, "%s Updated endpointer threshold: %{public}f", (uint8_t *)&v5, 0x16u);
  }
}

- (void)updateEndpointerDelayedTrigger:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  _BOOL4 v8;
  uint64_t v9;

  v3 = a3;
  v9 = *MEMORY[0x1E0C80C00];
  -[_EAREndpointer updateEndpointerDelayedTriggerSwitch:](self->_hybridClassifier, "updateEndpointerDelayedTriggerSwitch:");
  v4 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315394;
    v6 = "-[CSHybridEndpointAnalyzer updateEndpointerDelayedTrigger:]";
    v7 = 1026;
    v8 = v3;
    _os_log_impl(&dword_1C2614000, v4, OS_LOG_TYPE_DEFAULT, "%s Updated endpointer delayed trigger: %{public}d", (uint8_t *)&v5, 0x12u);
  }
}

- (void)processASRFeatures:(id)a3 fromServer:(BOOL)a4
{
  id v5;
  NSObject *v6;
  NSObject *stateSerialQueue;
  uint64_t v8;
  uint64_t v9;
  NSObject *asrFeaturesQueue;
  _QWORD v11[5];
  id v12;
  _QWORD block[6];
  _BYTE buf[24];
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "-[CSHybridEndpointAnalyzer processASRFeatures:fromServer:]";
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v5;
    _os_log_impl(&dword_1C2614000, v6, OS_LOG_TYPE_INFO, "%s EARSPG: CSASRFeatures: %{public}@", buf, 0x16u);
  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v15 = 0;
  stateSerialQueue = self->_stateSerialQueue;
  v8 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__CSHybridEndpointAnalyzer_processASRFeatures_fromServer___block_invoke;
  block[3] = &unk_1E7C29228;
  block[4] = self;
  block[5] = buf;
  dispatch_async_and_wait(stateSerialQueue, block);
  v9 = objc_msgSend(v5, "processedAudioDurationInMilliseconds");
  if (*(double *)(*(_QWORD *)&buf[8] + 24) <= (double)v9)
  {
    asrFeaturesQueue = self->_asrFeaturesQueue;
    v11[0] = v8;
    v11[1] = 3221225472;
    v11[2] = __58__CSHybridEndpointAnalyzer_processASRFeatures_fromServer___block_invoke_2;
    v11[3] = &unk_1E7C292A0;
    v11[4] = self;
    v12 = v5;
    dispatch_async(asrFeaturesQueue, v11);

  }
  _Block_object_dispose(buf, 8);

}

- (void)shouldAcceptEagerResultForDuration:(double)a3 resultsCompletionHandler:(id)a4
{
  id v6;
  NSObject *hybridClassifierQueue;
  id v8;
  _QWORD block[5];
  id v10;
  double v11;

  v6 = a4;
  hybridClassifierQueue = self->_hybridClassifierQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __88__CSHybridEndpointAnalyzer_shouldAcceptEagerResultForDuration_resultsCompletionHandler___block_invoke;
  block[3] = &unk_1E7C277F8;
  v11 = a3;
  block[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(hybridClassifierQueue, block);

}

- (void)osdAnalyzer:(id)a3 didUpdateOSDFeatures:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  double v10;
  float v11;
  double v12;
  double v13;
  uint64_t v14;
  NSObject *stateSerialQueue;
  uint64_t v16;
  float v17;
  NSObject *v18;
  NSObject *v19;
  _QWORD *v20;
  NSObject *v21;
  BOOL v22;
  NSObject *hybridClassifierQueue;
  _QWORD v24[5];
  id v25;
  uint64_t *v26;
  __int128 *p_buf;
  _QWORD *v28;
  float v29;
  BOOL v30;
  _QWORD v31[5];
  float v32;
  _QWORD v33[6];
  _QWORD v34[6];
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  char v38;
  _QWORD block[8];
  float v40;
  _QWORD v41[3];
  char v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  char v46;
  uint8_t v47[4];
  const char *v48;
  __int16 v49;
  double v50;
  __int128 buf;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (self->_recordingDidStop)
  {
    v9 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 136315138;
      *(_QWORD *)((char *)&buf + 4) = "-[CSHybridEndpointAnalyzer osdAnalyzer:didUpdateOSDFeatures:]";
      _os_log_impl(&dword_1C2614000, v9, OS_LOG_TYPE_INFO, "%s HEP::RecordingDidStop: Ignoring silenceScoreEstimateAvailable, Not queuing", (uint8_t *)&buf, 0xCu);
    }
  }
  else
  {
    objc_msgSend(v7, "processedAudioMs");
    v11 = v10;
    objc_msgSend(v8, "silenceDurationMs");
    v13 = v12;
    v14 = osdAnalyzer_didUpdateOSDFeatures__heartbeat_CORESPEECH_SIL_SCORE_ESTIMATE_AVAILABLE;
    if (__ROR8__(0xEEEEEEEEEEEEEEEFLL * osdAnalyzer_didUpdateOSDFeatures__heartbeat_CORESPEECH_SIL_SCORE_ESTIMATE_AVAILABLE, 1) <= 0x888888888888888uLL)
    {
      kdebug_trace();
      v14 = osdAnalyzer_didUpdateOSDFeatures__heartbeat_CORESPEECH_SIL_SCORE_ESTIMATE_AVAILABLE;
    }
    osdAnalyzer_didUpdateOSDFeatures__heartbeat_CORESPEECH_SIL_SCORE_ESTIMATE_AVAILABLE = v14 + 1;
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v52 = 0x2020000000;
    v53 = 0;
    v43 = 0;
    v44 = &v43;
    v45 = 0x2020000000;
    v46 = 0;
    v41[0] = 0;
    v41[1] = v41;
    v41[2] = 0x2020000000;
    v42 = 0;
    stateSerialQueue = self->_stateSerialQueue;
    v16 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __61__CSHybridEndpointAnalyzer_osdAnalyzer_didUpdateOSDFeatures___block_invoke;
    block[3] = &unk_1E7C27820;
    block[4] = self;
    block[5] = &v43;
    block[6] = v41;
    block[7] = &buf;
    v40 = v11;
    dispatch_async_and_wait(stateSerialQueue, block);
    v35 = 0;
    v36 = &v35;
    v37 = 0x2020000000;
    v38 = 0;
    if (CSIsHorseman())
      *((_BYTE *)v36 + 24) = 1;
    v17 = v13;
    v18 = self->_stateSerialQueue;
    v34[0] = v16;
    v34[1] = 3221225472;
    v34[2] = __61__CSHybridEndpointAnalyzer_osdAnalyzer_didUpdateOSDFeatures___block_invoke_2;
    v34[3] = &unk_1E7C29228;
    v34[4] = self;
    v34[5] = &v35;
    dispatch_async_and_wait(v18, v34);
    if (*((_BYTE *)v36 + 24) && !self->_didDetectSpeech)
    {
      v19 = self->_stateSerialQueue;
      if (v11 <= 300.0 || v17 >= 0.001)
      {
        v31[0] = v16;
        v31[1] = 3221225472;
        v31[2] = __61__CSHybridEndpointAnalyzer_osdAnalyzer_didUpdateOSDFeatures___block_invoke_55;
        v31[3] = &unk_1E7C27848;
        v31[4] = self;
        v32 = v11;
        v20 = v31;
      }
      else
      {
        v33[0] = v16;
        v33[1] = 3221225472;
        v33[2] = __61__CSHybridEndpointAnalyzer_osdAnalyzer_didUpdateOSDFeatures___block_invoke_3;
        v33[3] = &unk_1E7C29228;
        v33[4] = self;
        v33[5] = &buf;
        v20 = v33;
      }
      dispatch_async_and_wait(v19, v20);
    }
    if (*((_BYTE *)v44 + 24))
    {
      v21 = *MEMORY[0x1E0D18F60];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v47 = 136315394;
        v48 = "-[CSHybridEndpointAnalyzer osdAnalyzer:didUpdateOSDFeatures:]";
        v49 = 2050;
        v50 = v17;
        _os_log_impl(&dword_1C2614000, v21, OS_LOG_TYPE_DEFAULT, "%s Already communicated end-pt: Not scheduling work for hybridClassifierQueue for silposnf=%{public}f", v47, 0x16u);
      }
    }
    else
    {
      v22 = -[CSHybridEndpointAnalyzer _multimodalEndpointerEnabled](self, "_multimodalEndpointerEnabled");
      hybridClassifierQueue = self->_hybridClassifierQueue;
      v24[0] = v16;
      v24[1] = 3221225472;
      v24[2] = __61__CSHybridEndpointAnalyzer_osdAnalyzer_didUpdateOSDFeatures___block_invoke_56;
      v24[3] = &unk_1E7C278E8;
      v24[4] = self;
      v26 = &v43;
      v29 = v17;
      v25 = v8;
      p_buf = &buf;
      v28 = v41;
      v30 = v22;
      dispatch_async(hybridClassifierQueue, v24);

    }
    _Block_object_dispose(&v35, 8);
    _Block_object_dispose(v41, 8);
    _Block_object_dispose(&v43, 8);
    _Block_object_dispose(&buf, 8);
  }

}

- (void)setMhId:(id)a3
{
  id v4;
  NSObject *hybridClassifierQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  hybridClassifierQueue = self->_hybridClassifierQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __36__CSHybridEndpointAnalyzer_setMhId___block_invoke;
  v7[3] = &unk_1E7C292A0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(hybridClassifierQueue, v7);

}

- (void)_emitEndpointDetectedEventWithEndpointTimeMs:(double)a3 endpointBufferHostTime:(unint64_t)a4 endpointerFeatures:(id)a5 endpointerDecisionLagInNs:(double)a6 extraDelayMs:(unint64_t)a7 endpointScore:(double)a8 asrFeaturesLatencies:(id)a9
{
  id v16;
  id v17;
  void *v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  NSObject *stateSerialQueue;
  uint64_t v26;
  NSObject *apQueue;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  void *v41;
  void *v42;
  NSObject *v43;
  NSString *mhId;
  NSObject *v45;
  id v46;
  id v47;
  _QWORD v48[6];
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  char v52;
  _QWORD block[9];
  uint64_t v54;
  double *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  double *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t *v63;
  uint64_t v64;
  uint64_t v65;
  uint8_t buf[4];
  const char *v67;
  __int16 v68;
  NSString *v69;
  __int128 v70;
  uint64_t v71;
  uint64_t (*v72)(uint64_t, uint64_t);
  void (*v73)(uint64_t);
  id v74;
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  v16 = a5;
  v47 = a9;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_hybridClassifierQueue);
  if (self->_mhId)
  {
    v17 = objc_alloc_init(MEMORY[0x1E0D99AA0]);
    objc_msgSend(v17, "setWordCount:", objc_msgSend(v16, "wordCount"));
    v18 = (void *)MEMORY[0x1E0D19118];
    *(float *)&v19 = (float)objc_msgSend(v16, "trailingSilenceDuration");
    objc_msgSend(v17, "setTrailingSilenceDurationInNs:", objc_msgSend(v18, "millisecondsToNs:", v19));
    v20 = (void *)MEMORY[0x1E0D19118];
    objc_msgSend(v16, "clientSilenceFramesCountMs");
    *(float *)&v21 = v21;
    objc_msgSend(v17, "setClientSilenceFramesCountInNs:", objc_msgSend(v20, "millisecondsToNs:", v21));
    objc_msgSend(v16, "endOfSentenceLikelihood");
    *(float *)&v22 = v22;
    objc_msgSend(v17, "setEndOfSentenceLikelihood:", v22);
    v23 = (void *)MEMORY[0x1E0D19118];
    objc_msgSend(v16, "serverFeaturesLatency");
    objc_msgSend(v17, "setServerFeaturesLatencyInNs:", objc_msgSend(v23, "millisecondsToNs:"));
    objc_msgSend(v16, "clientSilenceProbability");
    *(float *)&v24 = v24;
    objc_msgSend(v17, "setClientSilenceProbability:", v24);
    *(_QWORD *)&v70 = 0;
    *((_QWORD *)&v70 + 1) = &v70;
    v71 = 0x3032000000;
    v72 = __Block_byref_object_copy__20940;
    v73 = __Block_byref_object_dispose__20941;
    v74 = 0;
    v62 = 0;
    v63 = &v62;
    v64 = 0x2020000000;
    v65 = 0;
    v58 = 0;
    v59 = (double *)&v58;
    v60 = 0x2020000000;
    v61 = 0;
    v54 = 0;
    v55 = (double *)&v54;
    v56 = 0x2020000000;
    v57 = 0;
    stateSerialQueue = self->_stateSerialQueue;
    v26 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __189__CSHybridEndpointAnalyzer__emitEndpointDetectedEventWithEndpointTimeMs_endpointBufferHostTime_endpointerFeatures_endpointerDecisionLagInNs_extraDelayMs_endpointScore_asrFeaturesLatencies___block_invoke;
    block[3] = &unk_1E7C278C0;
    block[4] = self;
    block[5] = &v70;
    block[6] = &v62;
    block[7] = &v58;
    block[8] = &v54;
    dispatch_async_and_wait(stateSerialQueue, block);
    v49 = 0;
    v50 = &v49;
    v51 = 0x2020000000;
    v52 = 0;
    apQueue = self->_apQueue;
    v48[0] = v26;
    v48[1] = 3221225472;
    v48[2] = __189__CSHybridEndpointAnalyzer__emitEndpointDetectedEventWithEndpointTimeMs_endpointBufferHostTime_endpointerFeatures_endpointerDecisionLagInNs_extraDelayMs_endpointScore_asrFeaturesLatencies___block_invoke_2;
    v48[3] = &unk_1E7C29228;
    v48[4] = self;
    v48[5] = &v49;
    dispatch_async_and_wait(apQueue, v48);
    v46 = objc_alloc_init(MEMORY[0x1E0D9A508]);
    objc_msgSend(*(id *)(*((_QWORD *)&v70 + 1) + 40), "configVersion");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "componentsSeparatedByString:", CFSTR("."));
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v29, "count") == 2)
    {
      objc_msgSend(v29, "objectAtIndexedSubscript:", 0);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "setMajor:", objc_msgSend(v30, "intValue"));

      objc_msgSend(v29, "objectAtIndexedSubscript:", 1);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "setMinor:", objc_msgSend(v31, "intValue"));

    }
    +[CSEndpointLoggingHelper getMHStatisticDistributionInfoFromDictionary:](CSEndpointLoggingHelper, "getMHStatisticDistributionInfoFromDictionary:", v47);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_alloc_init(MEMORY[0x1E0D99AB8]);
    objc_msgSend(v33, "setIsTimeout:", self->_isRequestTimeout);
    v34 = objc_alloc_init(MEMORY[0x1E0D99A98]);
    objc_msgSend(v34, "setEndpointerType:", 3);
    *(float *)&v35 = a3;
    objc_msgSend(v34, "setEndpointAudioDurationInNs:", objc_msgSend(MEMORY[0x1E0D19118], "millisecondsToNs:", v35));
    objc_msgSend(v34, "setFirstBufferTimeInNs:", objc_msgSend(MEMORY[0x1E0D19118], "hostTimeToNs:", v63[3]));
    objc_msgSend(v34, "setEndpointedBufferTimeInNs:", objc_msgSend(MEMORY[0x1E0D19118], "hostTimeToNs:", a4));
    objc_msgSend(v34, "setEndpointFeaturesAtEndpoint:", v17);
    *(float *)&v36 = a6;
    objc_msgSend(v34, "setEndpointerDecisionLagInNs:", objc_msgSend(MEMORY[0x1E0D19118], "millisecondsToNs:", v36));
    *(float *)&v37 = (float)a7;
    objc_msgSend(v34, "setExtraDelayInNs:", objc_msgSend(MEMORY[0x1E0D19118], "millisecondsToNs:", v37));
    objc_msgSend(v34, "setEndpointModelConfigVersion:", v46);
    objc_msgSend(v34, "setDerivedBufferTimeFromHistoricalAudio:", *((unsigned __int8 *)v50 + 24));
    v38 = v55[3];
    *(float *)&v38 = v38;
    objc_msgSend(v34, "setAudioSkippedDurationInNs:", objc_msgSend(MEMORY[0x1E0D19118], "millisecondsToNs:", v38));
    v39 = v59[3];
    *(float *)&v39 = v39;
    objc_msgSend(v34, "setEndpointResetPositionInNs:", objc_msgSend(MEMORY[0x1E0D19118], "millisecondsToNs:", v39));
    *(float *)&v40 = a8;
    objc_msgSend(v34, "setEndpointerScore:", v40);
    objc_msgSend(v34, "setAsrFeatureLatencyDistribution:", v32);
    objc_msgSend(v34, "setTimeoutMetadata:", v33);
    +[CSEndpointLoggingHelper getMHClientEventByMhUUID:](CSEndpointLoggingHelper, "getMHClientEventByMhUUID:", self->_mhId);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setEndpointDetected:", v34);
    objc_msgSend(MEMORY[0x1E0D97898], "sharedStream");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "emitMessage:", v41);

    v43 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      mhId = self->_mhId;
      *(_DWORD *)buf = 136315394;
      v67 = "-[CSHybridEndpointAnalyzer _emitEndpointDetectedEventWithEndpointTimeMs:endpointBufferHostTime:endpointerFea"
            "tures:endpointerDecisionLagInNs:extraDelayMs:endpointScore:asrFeaturesLatencies:]";
      v68 = 2112;
      v69 = mhId;
      _os_log_impl(&dword_1C2614000, v43, OS_LOG_TYPE_DEFAULT, "%s Submit MHEndpointDetectedEvent to SELF for MH ID: %@", buf, 0x16u);
    }

    _Block_object_dispose(&v49, 8);
    _Block_object_dispose(&v54, 8);
    _Block_object_dispose(&v58, 8);
    _Block_object_dispose(&v62, 8);
    _Block_object_dispose(&v70, 8);

  }
  else
  {
    v45 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
    {
      LODWORD(v70) = 136315138;
      *(_QWORD *)((char *)&v70 + 4) = "-[CSHybridEndpointAnalyzer _emitEndpointDetectedEventWithEndpointTimeMs:endpointBu"
                                      "fferHostTime:endpointerFeatures:endpointerDecisionLagInNs:extraDelayMs:endpointSco"
                                      "re:asrFeaturesLatencies:]";
      _os_log_error_impl(&dword_1C2614000, v45, OS_LOG_TYPE_ERROR, "%s MHID not set, skipping SELF Logging", (uint8_t *)&v70, 0xCu);
    }
  }

}

- (void)logFeaturesWithEvent:(id)a3 locale:(id)a4
{
  id v6;
  id v7;
  NSObject *stateSerialQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  stateSerialQueue = self->_stateSerialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__CSHybridEndpointAnalyzer_logFeaturesWithEvent_locale___block_invoke;
  block[3] = &unk_1E7C291C0;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(stateSerialQueue, block);

}

- (void)handleVoiceTriggerWithActivationInfo:(id)a3
{
  id v4;
  NSObject *stateSerialQueue;
  id v6;
  _QWORD block[4];
  id v8;
  CSHybridEndpointAnalyzer *v9;

  v4 = a3;
  stateSerialQueue = self->_stateSerialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__CSHybridEndpointAnalyzer_handleVoiceTriggerWithActivationInfo___block_invoke;
  block[3] = &unk_1E7C292A0;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async_and_wait(stateSerialQueue, block);

}

- (void)terminateProcessing
{
  NSObject *apQueue;
  _QWORD block[5];

  self->_recordingDidStop = 1;
  apQueue = self->_apQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__CSHybridEndpointAnalyzer_terminateProcessing__block_invoke;
  block[3] = &unk_1E7C292C8;
  block[4] = self;
  dispatch_async(apQueue, block);
}

- (void)recordingStoppedForReason:(int64_t)a3
{
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  int64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315394;
    v7 = "-[CSHybridEndpointAnalyzer recordingStoppedForReason:]";
    v8 = 2050;
    v9 = a3;
    _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_DEFAULT, "%s CSHybridEndpointAnalyzer recordingStoppedForReason: %{public}ld", (uint8_t *)&v6, 0x16u);
  }
  -[CSHybridEndpointAnalyzer terminateProcessing](self, "terminateProcessing");
}

- (void)stopEndpointer
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
    v5 = "-[CSHybridEndpointAnalyzer stopEndpointer]";
    _os_log_impl(&dword_1C2614000, v3, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v4, 0xCu);
  }
  -[CSHybridEndpointAnalyzer terminateProcessing](self, "terminateProcessing");
}

- (int64_t)fetchCurrentEndpointerOperationMode
{
  return 0;
}

- (void)resetForNewRequestWithSampleRate:(unint64_t)a3 recordContext:(id)a4 disableRCSelection:(BOOL)a5
{
  uint64_t (*v7)(uint64_t, uint64_t);
  os_log_t *v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *stateSerialQueue;
  uint64_t (*v12)(uint64_t, uint64_t);
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  NSObject *apQueue;
  NSObject *hybridClassifierQueue;
  NSObject *asrFeaturesQueue;
  NSObject *v21;
  _QWORD v22[6];
  _QWORD v23[6];
  _QWORD v24[8];
  _QWORD v25[6];
  _QWORD block[5];
  uint64_t (*v27)(uint64_t, uint64_t);
  _BYTE *v28;
  _BYTE v29[24];
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  _BYTE buf[24];
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v7 = (uint64_t (*)(uint64_t, uint64_t))a4;
  self->_recordingDidStop = 0;
  v8 = (os_log_t *)MEMORY[0x1E0D18F60];
  v9 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = "-[CSHybridEndpointAnalyzer resetForNewRequestWithSampleRate:recordContext:disableRCSelection:]";
    *(_WORD *)&buf[12] = 2050;
    *(_QWORD *)&buf[14] = a3;
    *(_WORD *)&buf[22] = 2114;
    v34 = v7;
    _os_log_impl(&dword_1C2614000, v9, OS_LOG_TYPE_DEFAULT, "%s sampleRate=%{public}lu, recordContext=%{public}@", buf, 0x20u);
  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v34 = __Block_byref_object_copy__20940;
  v35 = __Block_byref_object_dispose__20941;
  v36 = 0;
  v10 = MEMORY[0x1E0C809B0];
  stateSerialQueue = self->_stateSerialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __94__CSHybridEndpointAnalyzer_resetForNewRequestWithSampleRate_recordContext_disableRCSelection___block_invoke;
  block[3] = &unk_1E7C277D0;
  block[4] = self;
  v12 = v7;
  v27 = v12;
  v28 = buf;
  dispatch_async_and_wait(stateSerialQueue, block);
  v13 = *v8;
  if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
  {
    v14 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
    *(_DWORD *)v29 = 136315394;
    *(_QWORD *)&v29[4] = "-[CSHybridEndpointAnalyzer resetForNewRequestWithSampleRate:recordContext:disableRCSelection:]";
    *(_WORD *)&v29[12] = 2114;
    *(_QWORD *)&v29[14] = v14;
    _os_log_impl(&dword_1C2614000, v13, OS_LOG_TYPE_DEFAULT, "%s CSEndpointAsset exists: %{public}@", v29, 0x16u);
  }
  if (!*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
  {
    v15 = *v8;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      +[CSAssetManager sharedManager](CSAssetManager, "sharedManager");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "currentLanguageCode");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v29 = 136315394;
      *(_QWORD *)&v29[4] = "-[CSHybridEndpointAnalyzer resetForNewRequestWithSampleRate:recordContext:disableRCSelection:]";
      *(_WORD *)&v29[12] = 2114;
      *(_QWORD *)&v29[14] = v17;
      _os_log_impl(&dword_1C2614000, v15, OS_LOG_TYPE_DEFAULT, "%s No asset for CSHybridEndpointer for currentLanguage: %{public}@. Fallback to VAD2", v29, 0x16u);

    }
  }
  apQueue = self->_apQueue;
  v25[0] = v10;
  v25[1] = 3221225472;
  v25[2] = __94__CSHybridEndpointAnalyzer_resetForNewRequestWithSampleRate_recordContext_disableRCSelection___block_invoke_98;
  v25[3] = &unk_1E7C29228;
  v25[4] = self;
  v25[5] = buf;
  dispatch_async(apQueue, v25);
  *(_QWORD *)v29 = 0;
  *(_QWORD *)&v29[8] = v29;
  *(_QWORD *)&v29[16] = 0x3032000000;
  v30 = __Block_byref_object_copy__20940;
  v31 = __Block_byref_object_dispose__20941;
  v32 = 0;
  hybridClassifierQueue = self->_hybridClassifierQueue;
  v24[0] = v10;
  v24[1] = 3221225472;
  v24[2] = __94__CSHybridEndpointAnalyzer_resetForNewRequestWithSampleRate_recordContext_disableRCSelection___block_invoke_100;
  v24[3] = &unk_1E7C27F30;
  v24[4] = self;
  v24[5] = buf;
  v24[6] = v29;
  v24[7] = a3;
  dispatch_async_and_wait(hybridClassifierQueue, v24);
  asrFeaturesQueue = self->_asrFeaturesQueue;
  v23[0] = v10;
  v23[1] = 3221225472;
  v23[2] = __94__CSHybridEndpointAnalyzer_resetForNewRequestWithSampleRate_recordContext_disableRCSelection___block_invoke_101;
  v23[3] = &unk_1E7C29228;
  v23[4] = self;
  v23[5] = v29;
  dispatch_async_and_wait(asrFeaturesQueue, v23);
  v21 = self->_stateSerialQueue;
  v22[0] = v10;
  v22[1] = 3221225472;
  v22[2] = __94__CSHybridEndpointAnalyzer_resetForNewRequestWithSampleRate_recordContext_disableRCSelection___block_invoke_2;
  v22[3] = &unk_1E7C29178;
  v22[4] = self;
  v22[5] = a3;
  dispatch_async_and_wait(v21, v22);
  _Block_object_dispose(v29, 8);

  _Block_object_dispose(buf, 8);
}

- (void)_readParametersFromHEPAsset:(id)a3
{
  id v4;
  NSObject *asrFeaturesQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  asrFeaturesQueue = self->_asrFeaturesQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __56__CSHybridEndpointAnalyzer__readParametersFromHEPAsset___block_invoke;
  v7[3] = &unk_1E7C292A0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(asrFeaturesQueue, v7);

}

- (void)reset
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CSHybridEndpointAnalyzer.m"), 1116, CFSTR("CSHybridEndpointAnalyzer reset called"));

}

- (double)lastEndOfVoiceActivityTime
{
  return 0.0;
}

- (double)lastStartOfVoiceActivityTime
{
  return 0.0;
}

- (void)CSLanguageCodeUpdateMonitor:(id)a3 didReceiveLanguageCodeChanged:(id)a4
{
  id v5;
  NSObject *v6;
  int v7;
  const char *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315394;
    v8 = "-[CSHybridEndpointAnalyzer CSLanguageCodeUpdateMonitor:didReceiveLanguageCodeChanged:]";
    v9 = 2114;
    v10 = v5;
    _os_log_impl(&dword_1C2614000, v6, OS_LOG_TYPE_DEFAULT, "%s Language changed to: %{public}@", (uint8_t *)&v7, 0x16u);
  }
  -[CSHybridEndpointAnalyzer _updateAssetWithLanguage:](self, "_updateAssetWithLanguage:", v5);

}

- (void)CSAssetManagerDidDownloadNewAsset:(id)a3
{
  NSObject *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v4 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[CSHybridEndpointAnalyzer CSAssetManagerDidDownloadNewAsset:]";
    _os_log_impl(&dword_1C2614000, v4, OS_LOG_TYPE_DEFAULT, "%s New hybrid endpoint asset downloaded", (uint8_t *)&v5, 0xCu);
  }
  -[CSHybridEndpointAnalyzer _updateAssetWithCurrentLanguage](self, "_updateAssetWithCurrentLanguage");
}

- (void)_updateAssetWithLanguage:(id)a3
{
  id v4;
  NSObject *stateSerialQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  CSHybridEndpointAnalyzer *v9;

  v4 = a3;
  stateSerialQueue = self->_stateSerialQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __53__CSHybridEndpointAnalyzer__updateAssetWithLanguage___block_invoke;
  v7[3] = &unk_1E7C292A0;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(stateSerialQueue, v7);

}

- (void)_updateAssetWithCurrentLanguage
{
  void *v3;
  id v4;

  +[CSAssetManager sharedManager](CSAssetManager, "sharedManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentLanguageCode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSHybridEndpointAnalyzer _updateAssetWithLanguage:](self, "_updateAssetWithLanguage:", v3);

}

- (id)_getCSHybridEndpointerConfigForAsset:(id)a3
{
  id v3;
  const __CFString *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (CSIsHorseman())
    v4 = CFSTR("cs_hep_marsh.json");
  else
    v4 = CFSTR("cs_hep.json");
  objc_msgSend(v3, "resourcePath");
  v5 = objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)v5, "stringByAppendingPathComponent:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = objc_msgSend(v7, "fileExistsAtPath:", v6);

  if ((v5 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v16 = 0;
      objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v8, 0, &v16);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v16;
      if (v10)
      {
        v11 = *MEMORY[0x1E0D18F60];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          v18 = "-[CSHybridEndpointAnalyzer _getCSHybridEndpointerConfigForAsset:]";
          v19 = 2114;
          v20 = v6;
          v21 = 2114;
          v22 = v10;
          _os_log_impl(&dword_1C2614000, v11, OS_LOG_TYPE_DEFAULT, "%s Could not decode contents of: %{public}@: err: %{public}@", buf, 0x20u);
        }
        v12 = 0;
      }
      else
      {
        v12 = v9;
      }

    }
    else
    {
      v14 = *MEMORY[0x1E0D18F60];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v18 = "-[CSHybridEndpointAnalyzer _getCSHybridEndpointerConfigForAsset:]";
        v19 = 2114;
        v20 = v6;
        _os_log_impl(&dword_1C2614000, v14, OS_LOG_TYPE_DEFAULT, "%s Could not read: %{public}@", buf, 0x16u);
      }
      v12 = 0;
    }

  }
  else
  {
    v13 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v18 = "-[CSHybridEndpointAnalyzer _getCSHybridEndpointerConfigForAsset:]";
      v19 = 2114;
      v20 = v6;
      _os_log_impl(&dword_1C2614000, v13, OS_LOG_TYPE_DEFAULT, "%s %{public}@ doesnt exist", buf, 0x16u);
    }
    v12 = 0;
  }

  return v12;
}

- (BOOL)_shouldProvideTwoShotFeedbackWithRecordContext
{
  char v3;
  char v4;

  v3 = -[CSAudioRecordContext isRequestFromTriggerless](self->_recordContext, "isRequestFromTriggerless");
  v4 = -[CSAudioRecordContext isGibraltarVoiceTriggered](self->_recordContext, "isGibraltarVoiceTriggered");
  return -[CSAudioRecordContext isVoiceTriggered](self->_recordContext, "isVoiceTriggered") & ((v4 | v3) ^ 1);
}

- (BOOL)_multimodalEndpointerEnabled
{
  return 0;
}

- (CSEndpointAnalyzerDelegate)delegate
{
  return (CSEndpointAnalyzerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CSEndpointAnalyzerImplDelegate)implDelegate
{
  return (CSEndpointAnalyzerImplDelegate *)objc_loadWeakRetained((id *)&self->_implDelegate);
}

- (void)setImplDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_implDelegate, a3);
}

- (unint64_t)activeChannel
{
  return self->_activeChannel;
}

- (void)setActiveChannel:(unint64_t)a3
{
  self->_activeChannel = a3;
}

- (NSString)mhId
{
  return self->_mhId;
}

- (int64_t)endpointStyle
{
  return self->_endpointStyle;
}

- (void)setEndpointStyle:(int64_t)a3
{
  self->_endpointStyle = a3;
}

- (double)startWaitTime
{
  return self->_startWaitTime;
}

- (void)setStartWaitTime:(double)a3
{
  self->_startWaitTime = a3;
}

- (double)endWaitTime
{
  return self->_endWaitTime;
}

- (void)setEndWaitTime:(double)a3
{
  self->_endWaitTime = a3;
}

- (double)interspeechWaitTime
{
  return self->_interspeechWaitTime;
}

- (void)setInterspeechWaitTime:(double)a3
{
  self->_interspeechWaitTime = a3;
}

- (double)delay
{
  return self->_delay;
}

- (void)setDelay:(double)a3
{
  self->_delay = a3;
}

- (double)automaticEndpointingSuspensionEndTime
{
  return self->_automaticEndpointingSuspensionEndTime;
}

- (void)setAutomaticEndpointingSuspensionEndTime:(double)a3
{
  self->_automaticEndpointingSuspensionEndTime = a3;
}

- (double)minimumDurationForEndpointer
{
  return self->_minimumDurationForEndpointer;
}

- (void)setMinimumDurationForEndpointer:(double)a3
{
  self->_minimumDurationForEndpointer = a3;
}

- (BOOL)saveSamplesSeenInReset
{
  return self->_saveSamplesSeenInReset;
}

- (void)setSaveSamplesSeenInReset:(BOOL)a3
{
  self->_saveSamplesSeenInReset = a3;
}

- (BOOL)canProcessCurrentRequest
{
  return self->_canProcessCurrentRequest;
}

- (void)setCanProcessCurrentRequest:(BOOL)a3
{
  self->_canProcessCurrentRequest = a3;
}

- (CSAsset)currentAsset
{
  return self->_currentAsset;
}

- (void)setCurrentAsset:(id)a3
{
  objc_storeStrong((id *)&self->_currentAsset, a3);
}

- (OS_dispatch_queue)apQueue
{
  return self->_apQueue;
}

- (void)setApQueue:(id)a3
{
  objc_storeStrong((id *)&self->_apQueue, a3);
}

- (unint64_t)numSamplesProcessed
{
  return self->_numSamplesProcessed;
}

- (void)setNumSamplesProcessed:(unint64_t)a3
{
  self->_numSamplesProcessed = a3;
}

- (unint64_t)numSamplesProcessedBeforeAnchorTime
{
  return self->_numSamplesProcessedBeforeAnchorTime;
}

- (void)setNumSamplesProcessedBeforeAnchorTime:(unint64_t)a3
{
  self->_numSamplesProcessedBeforeAnchorTime = a3;
}

- (unint64_t)anchorMachAbsTime
{
  return self->_anchorMachAbsTime;
}

- (void)setAnchorMachAbsTime:(unint64_t)a3
{
  self->_anchorMachAbsTime = a3;
}

- (BOOL)isAnchorTimeBuffered
{
  return self->_isAnchorTimeBuffered;
}

- (void)setIsAnchorTimeBuffered:(BOOL)a3
{
  self->_isAnchorTimeBuffered = a3;
}

- (BOOL)isRequestTimeout
{
  return self->_isRequestTimeout;
}

- (void)setIsRequestTimeout:(BOOL)a3
{
  self->_isRequestTimeout = a3;
}

- (BOOL)didAddAudio
{
  return self->_didAddAudio;
}

- (void)setDidAddAudio:(BOOL)a3
{
  self->_didAddAudio = a3;
}

- (OSDAnalyzer)osdAnalyzer
{
  return self->_osdAnalyzer;
}

- (void)setOsdAnalyzer:(id)a3
{
  objc_storeStrong((id *)&self->_osdAnalyzer, a3);
}

- (OSDFeatures)osdFeaturesAtEndpoint
{
  return self->_osdFeaturesAtEndpoint;
}

- (void)setOsdFeaturesAtEndpoint:(id)a3
{
  objc_storeStrong((id *)&self->_osdFeaturesAtEndpoint, a3);
}

- (_EAREndpointer)hybridClassifier
{
  return self->_hybridClassifier;
}

- (void)setHybridClassifier:(id)a3
{
  objc_storeStrong((id *)&self->_hybridClassifier, a3);
}

- (void)setEndpointerModelVersion:(id)a3
{
  objc_storeStrong((id *)&self->_endpointerModelVersion, a3);
}

- (OS_dispatch_queue)asrFeaturesQueue
{
  return self->_asrFeaturesQueue;
}

- (void)setAsrFeaturesQueue:(id)a3
{
  objc_storeStrong((id *)&self->_asrFeaturesQueue, a3);
}

- (CSASRFeatures)lastKnownASRFeatures
{
  return self->_lastKnownASRFeatures;
}

- (void)setLastKnownASRFeatures:(id)a3
{
  objc_storeStrong((id *)&self->_lastKnownASRFeatures, a3);
}

- (OSDFeatures)lastKnownOSDFeatures
{
  return self->_lastKnownOSDFeatures;
}

- (void)setLastKnownOSDFeatures:(id)a3
{
  objc_storeStrong((id *)&self->_lastKnownOSDFeatures, a3);
}

- (NSMutableArray)asrFeatureLatencies
{
  return self->_asrFeatureLatencies;
}

- (void)setAsrFeatureLatencies:(id)a3
{
  objc_storeStrong((id *)&self->_asrFeatureLatencies, a3);
}

- (double)lastKnownASRFeatureLatency
{
  return self->_lastKnownASRFeatureLatency;
}

- (void)setLastKnownASRFeatureLatency:(double)a3
{
  self->_lastKnownASRFeatureLatency = a3;
}

- (BOOL)epResult
{
  return self->_epResult;
}

- (void)setEpResult:(BOOL)a3
{
  self->_epResult = a3;
}

- (double)asrFeaturesWarmupLatency
{
  return self->_asrFeaturesWarmupLatency;
}

- (void)setAsrFeaturesWarmupLatency:(double)a3
{
  self->_asrFeaturesWarmupLatency = a3;
}

- (NSDate)lastASRFeatureTimestamp
{
  return self->_lastASRFeatureTimestamp;
}

- (void)setLastASRFeatureTimestamp:(id)a3
{
  objc_storeStrong((id *)&self->_lastASRFeatureTimestamp, a3);
}

- (BOOL)didReceiveASRFeatures
{
  return self->_didReceiveASRFeatures;
}

- (void)setDidReceiveASRFeatures:(BOOL)a3
{
  self->_didReceiveASRFeatures = a3;
}

- (double)clientLagThresholdMs
{
  return self->_clientLagThresholdMs;
}

- (void)setClientLagThresholdMs:(double)a3
{
  self->_clientLagThresholdMs = a3;
}

- (double)clampedASRFeatureLatencyMsForClientLag
{
  return self->_clampedASRFeatureLatencyMsForClientLag;
}

- (void)setClampedASRFeatureLatencyMsForClientLag:(double)a3
{
  self->_clampedASRFeatureLatencyMsForClientLag = a3;
}

- (BOOL)useDefaultASRFeaturesOnClientLag
{
  return self->_useDefaultASRFeaturesOnClientLag;
}

- (void)setUseDefaultASRFeaturesOnClientLag:(BOOL)a3
{
  self->_useDefaultASRFeaturesOnClientLag = a3;
}

- (OS_dispatch_queue)hybridClassifierQueue
{
  return self->_hybridClassifierQueue;
}

- (void)setHybridClassifierQueue:(id)a3
{
  objc_storeStrong((id *)&self->_hybridClassifierQueue, a3);
}

- (double)lastReportedEndpointTimeMs
{
  return self->_lastReportedEndpointTimeMs;
}

- (void)setLastReportedEndpointTimeMs:(double)a3
{
  self->_lastReportedEndpointTimeMs = a3;
}

- (double)processedAudioInSeconds
{
  return self->_processedAudioInSeconds;
}

- (void)setProcessedAudioInSeconds:(double)a3
{
  self->_processedAudioInSeconds = a3;
}

- (float)lastEndpointPosterior
{
  return self->_lastEndpointPosterior;
}

- (void)setLastEndpointPosterior:(float)a3
{
  self->_lastEndpointPosterior = a3;
}

- (OS_dispatch_queue)stateSerialQueue
{
  return self->_stateSerialQueue;
}

- (void)setStateSerialQueue:(id)a3
{
  objc_storeStrong((id *)&self->_stateSerialQueue, a3);
}

- (BOOL)didCommunicateEndpoint
{
  return self->_didCommunicateEndpoint;
}

- (void)setDidCommunicateEndpoint:(BOOL)a3
{
  self->_didCommunicateEndpoint = a3;
}

- (unint64_t)currentRequestSampleRate
{
  return self->_currentRequestSampleRate;
}

- (void)setCurrentRequestSampleRate:(unint64_t)a3
{
  self->_currentRequestSampleRate = a3;
}

- (double)vtExtraAudioAtStartInMs
{
  return self->_vtExtraAudioAtStartInMs;
}

- (void)setVtExtraAudioAtStartInMs:(double)a3
{
  self->_vtExtraAudioAtStartInMs = a3;
}

- (unint64_t)vtEndInSampleCount
{
  return self->_vtEndInSampleCount;
}

- (void)setVtEndInSampleCount:(unint64_t)a3
{
  self->_vtEndInSampleCount = a3;
}

- (double)hepAudioOriginInMs
{
  return self->_hepAudioOriginInMs;
}

- (void)setHepAudioOriginInMs:(double)a3
{
  self->_hepAudioOriginInMs = a3;
}

- (double)twoShotSilenceThresholdInMs
{
  return self->_twoShotSilenceThresholdInMs;
}

- (void)setTwoShotSilenceThresholdInMs:(double)a3
{
  self->_twoShotSilenceThresholdInMs = a3;
}

- (BOOL)didNotifyTwoShot
{
  return self->_didNotifyTwoShot;
}

- (void)setDidNotifyTwoShot:(BOOL)a3
{
  self->_didNotifyTwoShot = a3;
}

- (CSAudioRecordContext)recordContext
{
  return self->_recordContext;
}

- (void)setRecordContext:(id)a3
{
  objc_storeStrong((id *)&self->_recordContext, a3);
}

- (BOOL)speechEndpointDetected
{
  return self->_speechEndpointDetected;
}

- (void)setSpeechEndpointDetected:(BOOL)a3
{
  self->_speechEndpointDetected = a3;
}

- (NSDate)firstAudioPacketTimestamp
{
  return self->_firstAudioPacketTimestamp;
}

- (void)setFirstAudioPacketTimestamp:(id)a3
{
  objc_storeStrong((id *)&self->_firstAudioPacketTimestamp, a3);
}

- (double)firstAudioSampleSensorTimestamp
{
  return self->_firstAudioSampleSensorTimestamp;
}

- (void)setFirstAudioSampleSensorTimestamp:(double)a3
{
  self->_firstAudioSampleSensorTimestamp = a3;
}

- (BOOL)didTimestampFirstAudioPacket
{
  return self->_didTimestampFirstAudioPacket;
}

- (void)setDidTimestampFirstAudioPacket:(BOOL)a3
{
  self->_didTimestampFirstAudioPacket = a3;
}

- (BOOL)recordingDidStop
{
  return self->_recordingDidStop;
}

- (void)setRecordingDidStop:(BOOL)a3
{
  self->_recordingDidStop = a3;
}

- (OS_dispatch_queue)osdQueue
{
  return self->_osdQueue;
}

- (void)setOsdQueue:(id)a3
{
  objc_storeStrong((id *)&self->_osdQueue, a3);
}

- (BOOL)didDetectSpeech
{
  return self->_didDetectSpeech;
}

- (void)setDidDetectSpeech:(BOOL)a3
{
  self->_didDetectSpeech = a3;
}

- (double)postVoiceTriggerSilence
{
  return self->_postVoiceTriggerSilence;
}

- (void)setPostVoiceTriggerSilence:(double)a3
{
  self->_postVoiceTriggerSilence = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_osdQueue, 0);
  objc_storeStrong((id *)&self->_firstAudioPacketTimestamp, 0);
  objc_storeStrong((id *)&self->_recordContext, 0);
  objc_storeStrong((id *)&self->_stateSerialQueue, 0);
  objc_storeStrong((id *)&self->_hybridClassifierQueue, 0);
  objc_storeStrong((id *)&self->_lastASRFeatureTimestamp, 0);
  objc_storeStrong((id *)&self->_asrFeatureLatencies, 0);
  objc_storeStrong((id *)&self->_lastKnownOSDFeatures, 0);
  objc_storeStrong((id *)&self->_lastKnownASRFeatures, 0);
  objc_storeStrong((id *)&self->_asrFeaturesQueue, 0);
  objc_storeStrong((id *)&self->_endpointerModelVersion, 0);
  objc_storeStrong((id *)&self->_hybridClassifier, 0);
  objc_storeStrong((id *)&self->_osdFeaturesAtEndpoint, 0);
  objc_storeStrong((id *)&self->_osdAnalyzer, 0);
  objc_storeStrong((id *)&self->_apQueue, 0);
  objc_storeStrong((id *)&self->_currentAsset, 0);
  objc_storeStrong((id *)&self->_mhId, 0);
  objc_destroyWeak((id *)&self->_implDelegate);
  objc_destroyWeak((id *)&self->_delegate);
}

void __53__CSHybridEndpointAnalyzer__updateAssetWithLanguage___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  +[CSAssetManager sharedManager](CSAssetManager, "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "assetOfType:language:", 1, *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(void **)(v4 + 120);
  *(_QWORD *)(v4 + 120) = 0;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 120), v3);
  v6 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 120);
    v8 = 136315394;
    v9 = "-[CSHybridEndpointAnalyzer _updateAssetWithLanguage:]_block_invoke";
    v10 = 2114;
    v11 = v7;
    _os_log_impl(&dword_1C2614000, v6, OS_LOG_TYPE_DEFAULT, "%s _currentAsset changed to : %{public}@", (uint8_t *)&v8, 0x16u);
  }
  objc_msgSend(*(id *)(a1 + 40), "_readParametersFromHEPAsset:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 120));

}

void __56__CSHybridEndpointAnalyzer__readParametersFromHEPAsset___block_invoke(uint64_t a1)
{
  void *v2;
  os_log_t *v3;
  NSObject *v4;
  void *v5;
  float v6;
  void *v7;
  float v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  int v14;
  const char *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_getCSHybridEndpointerConfigForAsset:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (os_log_t *)MEMORY[0x1E0D18F60];
  v4 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v14 = 136315394;
    v15 = "-[CSHybridEndpointAnalyzer _readParametersFromHEPAsset:]_block_invoke";
    v16 = 2114;
    v17 = v2;
    _os_log_impl(&dword_1C2614000, v4, OS_LOG_TYPE_DEFAULT, "%s csHepConfig: %{public}@", (uint8_t *)&v14, 0x16u);
  }
  if (v2)
  {
    objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("ClientLagThresholdMsKey"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "floatValue");
    *(double *)(*(_QWORD *)(a1 + 32) + 248) = v6;

    objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("ClampedSFLatencyMsForClientLag"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "floatValue");
    *(double *)(*(_QWORD *)(a1 + 32) + 256) = v8;

    objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("UseDefaultServerFeaturesOnClientLag"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 15) = objc_msgSend(v9, "BOOLValue");

  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 248) = 0xC0F5F90000000000;
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 256) = 0;
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 15) = 1;
  }
  v10 = *v3;
  if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
  {
    v11 = *(_QWORD *)(a1 + 32);
    v12 = *(void **)(v11 + 248);
    v13 = *(_QWORD *)(v11 + 256);
    LODWORD(v11) = *(unsigned __int8 *)(v11 + 15);
    v14 = 136315906;
    v15 = "-[CSHybridEndpointAnalyzer _readParametersFromHEPAsset:]_block_invoke";
    v16 = 2050;
    v17 = v12;
    v18 = 2050;
    v19 = v13;
    v20 = 1026;
    v21 = v11;
    _os_log_impl(&dword_1C2614000, v10, OS_LOG_TYPE_DEFAULT, "%s _clientHepConfig: %{public}f, _clampedASRFeatureLatencyMsForClientLag: %{public}f, _useDefaultASRFeaturesOnClientLag: %{public}d", (uint8_t *)&v14, 0x26u);
  }

}

void __94__CSHybridEndpointAnalyzer_resetForNewRequestWithSampleRate_recordContext_disableRCSelection___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 336);
  *(_QWORD *)(v3 + 336) = v2;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 120));
}

void __94__CSHybridEndpointAnalyzer_resetForNewRequestWithSampleRate_recordContext_disableRCSelection___block_invoke_98(uint64_t a1)
{
  id v2;
  void *v3;
  float v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  int v12;
  const char *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 136) = 0;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 144) = 0;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 152) = 0;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 10) = 0;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 12) = 0;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 17) = 0;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    kdebug_trace();
    v2 = objc_alloc(MEMORY[0x1E0DA8D30]);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "path");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D19090], "inputRecordingSampleRate");
    v5 = objc_msgSend(v2, "initWithConfigFile:sampleRate:context:queue:delegate:", v3, (unint64_t)v4, 0, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 360));
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(v6 + 160);
    *(_QWORD *)(v6 + 160) = v5;

    kdebug_trace();
    v8 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 160);
      v12 = 136315394;
      v13 = "-[CSHybridEndpointAnalyzer resetForNewRequestWithSampleRate:recordContext:disableRCSelection:]_block_invoke";
      v14 = 2114;
      v15 = v9;
      _os_log_impl(&dword_1C2614000, v8, OS_LOG_TYPE_DEFAULT, "%s Created OSDAnalyzer: %{public}@", (uint8_t *)&v12, 0x16u);
    }
  }
  else
  {
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(void **)(v10 + 160);
    *(_QWORD *)(v10 + 160) = 0;

  }
}

void __94__CSHybridEndpointAnalyzer_resetForNewRequestWithSampleRate_recordContext_disableRCSelection___block_invoke_100(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  int v21;
  os_log_t *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  NSObject *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  NSObject *v32;
  id v33;
  uint8_t buf[4];
  const char *v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  int v39;
  __int16 v40;
  uint64_t v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  uint64_t v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)(a1[4] + 280) = 0;
  *(_QWORD *)(a1[4] + 272) = 0;
  *(_DWORD *)(a1[4] + 24) = 0;
  *(_BYTE *)(a1[4] + 11) = 0;
  v2 = objc_msgSend(objc_alloc(MEMORY[0x1E0DA8D38]), "initWithSilenceFramesCountMs:silenceProbability:silenceDurationMs:processedAudioMs:", 0.0, 0.0, 0.0, 0.0);
  v3 = a1[4];
  v4 = *(void **)(v3 + 168);
  *(_QWORD *)(v3 + 168) = v2;

  objc_storeStrong((id *)(a1[4] + 208), *(id *)(a1[4] + 168));
  if (*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40))
  {
    kdebug_trace();
    v5 = objc_alloc(MEMORY[0x1E0D1F130]);
    objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "path");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = 0;
    v7 = objc_msgSend(v5, "initWithConfiguration:modelVersion:", v6, &v33);
    v8 = v33;
    v9 = a1[4];
    v10 = *(void **)(v9 + 176);
    *(_QWORD *)(v9 + 176) = v7;

    kdebug_trace();
    v11 = a1[4];
    v12 = *(void **)(v11 + 184);
    *(_QWORD *)(v11 + 184) = v8;
    v13 = v8;

    objc_msgSend(*(id *)(a1[4] + 176), "defaultServerEndpointFeatures");
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = *(_QWORD *)(a1[6] + 8);
    v16 = *(void **)(v15 + 40);
    *(_QWORD *)(v15 + 40) = v14;

  }
  else
  {
    v17 = a1[4];
    v18 = *(void **)(v17 + 176);
    *(_QWORD *)(v17 + 176) = 0;

    v19 = a1[4];
    v20 = *(void **)(v19 + 184);
    *(_QWORD *)(v19 + 184) = 0;

  }
  v21 = objc_msgSend(MEMORY[0x1E0D19260], "supportHybridEndpointer");
  if (v21)
  {
    if (*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40))
      LOBYTE(v21) = objc_msgSend(*(id *)(a1[4] + 176), "requestSupportedWithSamplingRate:", a1[7]);
    else
      LOBYTE(v21) = 0;
  }
  *(_BYTE *)(a1[4] + 9) = v21;
  v22 = (os_log_t *)MEMORY[0x1E0D18F60];
  v23 = (void *)*MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v24 = a1[4];
    v25 = *(_QWORD *)(v24 + 176);
    v26 = *(unsigned __int8 *)(v24 + 9);
    v27 = a1[7];
    v28 = v23;
    +[CSAssetManager sharedManager](CSAssetManager, "sharedManager");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "currentLanguageCode");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = *(_QWORD *)(a1[4] + 184);
    *(_DWORD *)buf = 136316418;
    v35 = "-[CSHybridEndpointAnalyzer resetForNewRequestWithSampleRate:recordContext:disableRCSelection:]_block_invoke";
    v36 = 2114;
    v37 = v25;
    v38 = 1026;
    v39 = v26;
    v40 = 2050;
    v41 = v27;
    v42 = 2114;
    v43 = v30;
    v44 = 2114;
    v45 = v31;
    _os_log_impl(&dword_1C2614000, v28, OS_LOG_TYPE_DEFAULT, "%s Created HybridClassifier(%{public}@); canProcessCurrentRequest after reset: %{public}d,for sampleRate: %{public"
      "}lu, lang=%{public}@, version=%{public}@",
      buf,
      0x3Au);

  }
  if (*(_BYTE *)(a1[4] + 9))
  {
    v32 = *v22;
    if (os_log_type_enabled(*v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v35 = "-[CSHybridEndpointAnalyzer resetForNewRequestWithSampleRate:recordContext:disableRCSelection:]_block_invoke";
      _os_log_impl(&dword_1C2614000, v32, OS_LOG_TYPE_DEFAULT, "%s HEP.logs.hdr: [ServerASR_trailingSilenceDuration,ClientSPG_SilenceFramesCountMs,ServerASR_endOfSentenceLikelihood,ServerASR_wordCount,ServerFeaturesLatency,ClientSPG_SilenceProbabilityHMMFiltered] & [ServerASR_pauseCounts,ServerASR_silencePosterior,ClientSPG_silenceProbailitySPGRaw] @ effectiveClientProcessedAudioMs : [HEPPosteriorOut,HEPDecision]", buf, 0xCu);
    }
  }
}

void __94__CSHybridEndpointAnalyzer_resetForNewRequestWithSampleRate_recordContext_disableRCSelection___block_invoke_101(uint64_t a1)
{
  uint64_t v2;
  CSASRFeatures *v3;
  CSASRFeatures *v4;
  uint64_t v5;
  uint64_t v6;
  float v7;
  double v8;
  float v9;
  double v10;
  float v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;

  v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  v3 = [CSASRFeatures alloc];
  v4 = v3;
  if (v2)
  {
    v5 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "wordCount");
    v6 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "trailingSilenceDuration");
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "endOfSentenceLikelihood");
    v8 = v7;
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "silencePosterior");
    v10 = v9;
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "acousticEndpointerScore");
    v12 = v11;
    v13 = MEMORY[0x1E0C9AA60];
    v3 = v4;
    v14 = v5;
    v15 = v6;
    v16 = v8;
    v17 = v10;
  }
  else
  {
    v13 = MEMORY[0x1E0C9AA60];
    v16 = 8.98999977;
    v17 = 0.997685015;
    v12 = 0.0;
    v14 = 0;
    v15 = 0;
  }
  v18 = -[CSASRFeatures initWithWordCount:trailingSilenceDuration:eosLikelihood:pauseCounts:silencePosterior:taskName:processedAudioDurationInMilliseconds:acousticEndpointerScore:](v3, "initWithWordCount:trailingSilenceDuration:eosLikelihood:pauseCounts:silencePosterior:taskName:processedAudioDurationInMilliseconds:acousticEndpointerScore:", v14, v15, v13, CFSTR("SearchOrMessaging"), 0, v16, v17, v12);
  v19 = *(_QWORD *)(a1 + 32);
  v20 = *(void **)(v19 + 200);
  *(_QWORD *)(v19 + 200) = v18;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = *(_QWORD *)(a1 + 32);
  v23 = *(void **)(v22 + 240);
  *(_QWORD *)(v22 + 240) = v21;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v24 = objc_claimAutoreleasedReturnValue();
  v25 = *(_QWORD *)(a1 + 32);
  v26 = *(void **)(v25 + 216);
  *(_QWORD *)(v25 + 216) = v24;

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 232) = 0xFFF0000000000000;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 224) = 0xBF847AE147AE147BLL;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 13) = 0;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 14) = 0;
}

void __94__CSHybridEndpointAnalyzer_resetForNewRequestWithSampleRate_recordContext_disableRCSelection___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = *(_QWORD *)(a1 + 40);
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 16) = 0;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 18) = 0;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 296) = v2;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 312) = 0;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 304) = 0;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 320) = 0;
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 344);
  *(_QWORD *)(v3 + 344) = 0;

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 352) = 0;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 19) = 0;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 21) = 0;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 368) = 0;
}

void __47__CSHybridEndpointAnalyzer_terminateProcessing__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 160);
  *(_QWORD *)(v1 + 160) = 0;

}

void __65__CSHybridEndpointAnalyzer_handleVoiceTriggerWithActivationInfo___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  unint64_t v5;
  float v6;
  double v7;
  void *v8;
  unint64_t v9;
  void *v10;
  double v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  const char *v20;
  __int16 v21;
  double v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  unint64_t v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *MEMORY[0x1E0D19730]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedIntegerValue");
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *MEMORY[0x1E0D195C8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3 - objc_msgSend(v4, "unsignedIntegerValue");

  objc_msgSend(MEMORY[0x1E0D19090], "inputRecordingSampleRate");
  v7 = (double)v5 / v6;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *MEMORY[0x1E0D19600]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "unsignedIntegerValue");

  *(_QWORD *)(*(_QWORD *)(a1 + 40) + 312) = (unint64_t)(v7
                                                               * (double)*(unint64_t *)(*(_QWORD *)(a1 + 40)
                                                                                             + 296));
  *(double *)(*(_QWORD *)(a1 + 40) + 304) = (float)((float)((float)v9
                                                            / (float)*(unint64_t *)(*(_QWORD *)(a1 + 40) + 296))
                                                    * 1000.0);
  *(double *)(*(_QWORD *)(a1 + 40) + 320) = -(*(double *)(*(_QWORD *)(a1 + 40) + 304) - v7 * 1000.0);
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *MEMORY[0x1E0D197A0]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "doubleValue");
  *(double *)(*(_QWORD *)(a1 + 40) + 328) = v11 * 1000.0;

  v12 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v14 = *(_QWORD *)(a1 + 32);
    v13 = *(_QWORD *)(a1 + 40);
    v15 = (unint64_t)*(double *)(v13 + 304);
    v16 = *(_QWORD *)(v13 + 312);
    v17 = *(_QWORD *)(v13 + 320);
    v18 = *(_QWORD *)(v13 + 328);
    v19 = 136316674;
    v20 = "-[CSHybridEndpointAnalyzer handleVoiceTriggerWithActivationInfo:]_block_invoke";
    v21 = 2050;
    v22 = v7;
    v23 = 2050;
    v24 = v16;
    v25 = 2050;
    v26 = v15;
    v27 = 2050;
    v28 = v17;
    v29 = 2050;
    v30 = v18;
    v31 = 2114;
    v32 = v14;
    _os_log_impl(&dword_1C2614000, v12, OS_LOG_TYPE_DEFAULT, "%s triggerEndSeconds: %{public}f, _vtEndInSampleCount: %{public}lu, _vtExtraAudioAtStartInMs: %{public}lu,  _hepAudioOriginInMs: %{public}f, twoShotSilenceThresholdInMs: %{public}f, voiceTriggerInfo: %{public}@,", (uint8_t *)&v19, 0x48u);
  }
}

void __56__CSHybridEndpointAnalyzer_logFeaturesWithEvent_locale___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  _QWORD v11[7];
  _QWORD v12[4];
  _QWORD v13[5];
  id v14;
  _QWORD block[7];
  _QWORD v16[3];
  char v17;
  _QWORD v18[5];
  id v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x3032000000;
  v18[3] = __Block_byref_object_copy__20940;
  v18[4] = __Block_byref_object_dispose__20941;
  v19 = 0;
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x2020000000;
  v17 = 0;
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(NSObject **)(v2 + 264);
  v4 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__CSHybridEndpointAnalyzer_logFeaturesWithEvent_locale___block_invoke_2;
  block[3] = &unk_1E7C27C98;
  block[4] = v2;
  block[5] = v18;
  block[6] = v16;
  dispatch_async_and_wait(v3, block);
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x3032000000;
  v13[3] = __Block_byref_object_copy__20940;
  v13[4] = __Block_byref_object_dispose__20941;
  v14 = 0;
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x2020000000;
  v12[3] = 0xBF847AE147AE147BLL;
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(NSObject **)(v5 + 192);
  v11[0] = v4;
  v11[1] = 3221225472;
  v11[2] = __56__CSHybridEndpointAnalyzer_logFeaturesWithEvent_locale___block_invoke_3;
  v11[3] = &unk_1E7C27C98;
  v11[4] = v5;
  v11[5] = v13;
  v11[6] = v12;
  dispatch_async_and_wait(v6, v11);
  v10 = *(id *)(a1 + 48);
  AnalyticsSendEventLazy();
  v7 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(_QWORD *)(a1 + 40);
    v9 = *(_QWORD *)(a1 + 48);
    *(_DWORD *)buf = 136315650;
    v21 = "-[CSHybridEndpointAnalyzer logFeaturesWithEvent:locale:]_block_invoke";
    v22 = 2114;
    v23 = v8;
    v24 = 2114;
    v25 = v9;
    _os_log_impl(&dword_1C2614000, v7, OS_LOG_TYPE_DEFAULT, "%s Log hybrid endpointer features for event: %{public}@, and locale: %{public}@", buf, 0x20u);
  }

  _Block_object_dispose(v12, 8);
  _Block_object_dispose(v13, 8);

  _Block_object_dispose(v16, 8);
  _Block_object_dispose(v18, 8);

}

void __56__CSHybridEndpointAnalyzer_logFeaturesWithEvent_locale___block_invoke_2(_QWORD *a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), *(id *)(a1[4] + 208));
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = *(_BYTE *)(a1[4] + 13);
}

double __56__CSHybridEndpointAnalyzer_logFeaturesWithEvent_locale___block_invoke_3(_QWORD *a1)
{
  double result;

  objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), *(id *)(a1[4] + 200));
  result = *(double *)(a1[4] + 224) * 1000.0;
  *(double *)(*(_QWORD *)(a1[6] + 8) + 24) = result;
  return result;
}

id __56__CSHybridEndpointAnalyzer_logFeaturesWithEvent_locale___block_invoke_4(_QWORD *a1)
{
  const __CFString *v2;
  const __CFString *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[9];
  _QWORD v17[10];

  v17[9] = *MEMORY[0x1E0C80C00];
  v2 = CFSTR("nil");
  v16[0] = CFSTR("locale");
  v16[1] = CFSTR("endpointerModelVersion");
  v3 = (const __CFString *)a1[4];
  if (!v3)
    v3 = CFSTR("nil");
  if (*(_QWORD *)(a1[5] + 184))
    v2 = *(const __CFString **)(a1[5] + 184);
  v17[0] = v3;
  v17[1] = v2;
  v16[2] = CFSTR("wordCount");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "wordCount"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v17[2] = v4;
  v16[3] = CFSTR("eosLikelihood");
  v5 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "eosLikelihood");
  objc_msgSend(v5, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17[3] = v6;
  v16[4] = CFSTR("trailingSilenceDuration");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "trailingSilenceDuration"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17[4] = v7;
  v16[5] = CFSTR("asrFeatureLatency");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(*(_QWORD *)(a1[7] + 8) + 24));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17[5] = v8;
  v16[6] = CFSTR("clientSilenceProbability");
  v9 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(*(_QWORD *)(a1[8] + 8) + 40), "silenceProbability");
  objc_msgSend(v9, "numberWithDouble:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17[6] = v10;
  v16[7] = CFSTR("clientSilenceFramesCountMs");
  v11 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(*(_QWORD *)(a1[8] + 8) + 40), "silenceFramesCountMs");
  objc_msgSend(v11, "numberWithDouble:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[7] = v12;
  v16[8] = CFSTR("endpointResult");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(*(_QWORD *)(a1[9] + 8) + 24));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[8] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

double __189__CSHybridEndpointAnalyzer__emitEndpointDetectedEventWithEndpointTimeMs_endpointBufferHostTime_endpointerFeatures_endpointerDecisionLagInNs_extraDelayMs_endpointScore_asrFeaturesLatencies___block_invoke(_QWORD *a1)
{
  double result;

  objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), *(id *)(a1[4] + 120));
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = (unint64_t)*(double *)(a1[4] + 352);
  *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24) = *(_QWORD *)(a1[4] + 320);
  result = *(double *)(a1[4] + 304);
  *(double *)(*(_QWORD *)(a1[8] + 8) + 24) = result;
  return result;
}

uint64_t __189__CSHybridEndpointAnalyzer__emitEndpointDetectedEventWithEndpointTimeMs_endpointBufferHostTime_endpointerFeatures_endpointerDecisionLagInNs_extraDelayMs_endpointScore_asrFeaturesLatencies___block_invoke_2(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 10);
  return result;
}

void __36__CSHybridEndpointAnalyzer_setMhId___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 56), *(id *)(a1 + 40));
}

double __61__CSHybridEndpointAnalyzer_osdAnalyzer_didUpdateOSDFeatures___block_invoke(uint64_t a1)
{
  double result;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(a1 + 32) + 16);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(a1 + 32) + 18);
  result = *(double *)(*(_QWORD *)(a1 + 32) + 320) + *(float *)(a1 + 64);
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = result;
  return result;
}

uint64_t __61__CSHybridEndpointAnalyzer_osdAnalyzer_didUpdateOSDFeatures___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_shouldProvideTwoShotFeedbackWithRecordContext");
  if ((_DWORD)result)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  return result;
}

void __61__CSHybridEndpointAnalyzer_osdAnalyzer_didUpdateOSDFeatures___block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  const char *v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    v4 = 136315394;
    v5 = "-[CSHybridEndpointAnalyzer osdAnalyzer:didUpdateOSDFeatures:]_block_invoke_3";
    v6 = 2050;
    v7 = v3;
    _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s Detected speech start at %{public}f of effectiveClientProcessedAudioMs", (uint8_t *)&v4, 0x16u);
  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 21) = 1;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 368) = 0;
}

void __61__CSHybridEndpointAnalyzer_osdAnalyzer_didUpdateOSDFeatures___block_invoke_55(uint64_t a1)
{
  uint64_t v1;
  double v2;
  double v3;
  NSObject *v5;
  id WeakRetained;
  int v7;
  const char *v8;
  __int16 v9;
  double v10;
  __int16 v11;
  double v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  *(double *)(*(_QWORD *)(a1 + 32) + 368) = *(float *)(a1 + 40);
  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v1 + 17))
  {
    v2 = *(double *)(v1 + 368);
    v3 = *(double *)(v1 + 328);
    if (v2 > v3)
    {
      v5 = *MEMORY[0x1E0D18F60];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
      {
        v7 = 136315650;
        v8 = "-[CSHybridEndpointAnalyzer osdAnalyzer:didUpdateOSDFeatures:]_block_invoke";
        v9 = 2050;
        v10 = v2;
        v11 = 2048;
        v12 = v3;
        _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_DEFAULT, "%s Detected sufficient silence to fire two shot with %{public}fms silence, %f threshold", (uint8_t *)&v7, 0x20u);
        v1 = *(_QWORD *)(a1 + 32);
      }
      *(_BYTE *)(v1 + 17) = 1;
      WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 40));
      objc_msgSend(WeakRetained, "endpointer:detectedTwoShotAtTime:", *(double *)(*(_QWORD *)(a1 + 32) + 368) / 1000.0);

    }
  }
}

void __61__CSHybridEndpointAnalyzer_osdAnalyzer_didUpdateOSDFeatures___block_invoke_56(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  double v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  int v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  uint64_t (*v17)(uint64_t, uint64_t);
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  float v21;
  float v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  id v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  uint64_t v31;
  NSObject *v32;
  double v33;
  double v34;
  float v35;
  float v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  NSObject *v41;
  int v42;
  id WeakRetained;
  double v44;
  id v45;
  char v46;
  id v47;
  NSObject *v48;
  void *v49;
  double v50;
  double v51;
  double v52;
  uint64_t v53;
  uint64_t v54;
  NSObject *v55;
  void *v56;
  double v57;
  void *v58;
  void *v59;
  NSObject *v60;
  double v61;
  double v62;
  double v63;
  CSEndpointerMetrics *v64;
  CSEndpointerMetrics *v65;
  NSObject *v66;
  double v67;
  NSObject *v68;
  id v69;
  uint64_t v70;
  _QWORD v71[6];
  _QWORD v72[9];
  uint64_t v73;
  uint64_t *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t *v86;
  uint64_t v87;
  char v88;
  _QWORD v89[7];
  char v90;
  uint64_t v91;
  uint64_t *v92;
  uint64_t v93;
  uint64_t v94;
  id v95;
  uint64_t v96;
  _QWORD v97[5];
  id v98;
  uint64_t v99;
  uint64_t *v100;
  _QWORD *v101;
  _QWORD v102[5];
  __CFString *v103;
  uint64_t v104;
  uint64_t *v105;
  uint64_t v106;
  uint64_t (*v107)(uint64_t, uint64_t);
  void (*v108)(uint64_t);
  id v109;
  _QWORD block[6];
  uint8_t v111[4];
  const char *v112;
  __int16 v113;
  double v114;
  __int16 v115;
  void *v116;
  _QWORD v117[2];
  _QWORD v118[2];
  _BYTE v119[24];
  uint64_t (*v120)(uint64_t, uint64_t);
  void (*v121)(uint64_t);
  id v122;
  _BYTE buf[24];
  uint64_t (*v124)(uint64_t, uint64_t);
  _BYTE v125[20];
  __int16 v126;
  double v127;
  __int16 v128;
  uint64_t v129;
  __int16 v130;
  id v131;
  __int16 v132;
  uint64_t v133;
  __int16 v134;
  unint64_t v135;
  __int16 v136;
  double v137;
  __int16 v138;
  int v139;
  uint64_t v140;

  v140 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v1 + 20))
  {
    v2 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = "-[CSHybridEndpointAnalyzer osdAnalyzer:didUpdateOSDFeatures:]_block_invoke";
      _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_INFO, "%s HEP::RecordingDidStop: Ignoring silenceScoreEstimateAvailable", buf, 0xCu);
    }
  }
  else
  {
    v4 = kUseDefaultServerFeaturesOnClientLag_block_invoke_2_heartbeat_CORESPEECH_PROCESS_SIL_SCORE_ESTIMATE_BEGIN;
    if (__ROR8__(0xEEEEEEEEEEEEEEEFLL* kUseDefaultServerFeaturesOnClientLag_block_invoke_2_heartbeat_CORESPEECH_PROCESS_SIL_SCORE_ESTIMATE_BEGIN, 1) <= 0x888888888888888uLL)
    {
      kdebug_trace();
      v4 = kUseDefaultServerFeaturesOnClientLag_block_invoke_2_heartbeat_CORESPEECH_PROCESS_SIL_SCORE_ESTIMATE_BEGIN;
      v1 = *(_QWORD *)(a1 + 32);
    }
    kUseDefaultServerFeaturesOnClientLag_block_invoke_2_heartbeat_CORESPEECH_PROCESS_SIL_SCORE_ESTIMATE_BEGIN = v4 + 1;
    v5 = *(NSObject **)(v1 + 288);
    v6 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __61__CSHybridEndpointAnalyzer_osdAnalyzer_didUpdateOSDFeatures___block_invoke_57;
    block[3] = &unk_1E7C29228;
    block[5] = *(_QWORD *)(a1 + 48);
    block[4] = v1;
    dispatch_async_and_wait(v5, block);
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    {
      v7 = *MEMORY[0x1E0D18F60];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
      {
        v8 = *(float *)(a1 + 72);
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)&buf[4] = "-[CSHybridEndpointAnalyzer osdAnalyzer:didUpdateOSDFeatures:]_block_invoke_2";
        *(_WORD *)&buf[12] = 2050;
        *(double *)&buf[14] = v8;
        _os_log_impl(&dword_1C2614000, v7, OS_LOG_TYPE_DEFAULT, "%s Already communicated end-pt: Not Invoking hybridClassifier for silposnf=%{public}f", buf, 0x16u);
      }
      kdebug_trace();
    }
    else
    {
      objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 208), *(id *)(a1 + 40));
      v104 = 0;
      v105 = &v104;
      v106 = 0x3032000000;
      v107 = __Block_byref_object_copy__20940;
      v108 = __Block_byref_object_dispose__20941;
      v109 = 0;
      v102[0] = 0;
      v102[1] = v102;
      v102[2] = 0x3032000000;
      v102[3] = __Block_byref_object_copy__20940;
      v102[4] = __Block_byref_object_dispose__20941;
      v103 = CFSTR("SearchOrMessaging");
      v9 = *(_QWORD *)(a1 + 32);
      v10 = *(NSObject **)(v9 + 192);
      v97[0] = v6;
      v97[1] = 3221225472;
      v97[2] = __61__CSHybridEndpointAnalyzer_osdAnalyzer_didUpdateOSDFeatures___block_invoke_58;
      v97[3] = &unk_1E7C27870;
      v99 = *(_QWORD *)(a1 + 56);
      v100 = &v104;
      v97[4] = v9;
      v98 = *(id *)(a1 + 40);
      v101 = v102;
      dispatch_async_and_wait(v10, v97);
      v11 = v105[5];
      if (v11)
      {
        v95 = 0;
        v96 = 0;
        v12 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "didEndpointWithFeatures:audioTimestamp:featuresToLog:endpointPosterior:extraDelayMs:", v11, &v95, (char *)&v96 + 4, &v96, *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24));
        v13 = v95;
        v14 = (id)*MEMORY[0x1E0D18F60];
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          v15 = objc_msgSend((id)v105[5], "trailingSilenceDuration");
          objc_msgSend((id)v105[5], "clientSilenceFramesCountMs");
          v17 = v16;
          objc_msgSend((id)v105[5], "endOfSentenceLikelihood");
          v19 = v18;
          v20 = objc_msgSend((id)v105[5], "wordCount");
          objc_msgSend((id)v105[5], "serverFeaturesLatency");
          v22 = v21;
          objc_msgSend((id)v105[5], "clientSilenceProbability");
          v24 = v23;
          objc_msgSend((id)v105[5], "pauseCounts");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "componentsJoinedByString:", CFSTR(","));
          v26 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)v105[5], "silencePosterior");
          v27 = (unint64_t)*(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
          *(_DWORD *)buf = 136317954;
          *(_QWORD *)&buf[4] = "-[CSHybridEndpointAnalyzer osdAnalyzer:didUpdateOSDFeatures:]_block_invoke";
          *(_WORD *)&buf[12] = 2050;
          *(_QWORD *)&buf[14] = v15;
          *(_WORD *)&buf[22] = 2050;
          v124 = v17;
          *(_WORD *)v125 = 2050;
          *(_QWORD *)&v125[2] = v19;
          *(_WORD *)&v125[10] = 2050;
          *(_QWORD *)&v125[12] = v20;
          v126 = 2050;
          v127 = v22;
          v128 = 2050;
          v129 = v24;
          v130 = 2114;
          v131 = v26;
          v132 = 2050;
          v133 = v28;
          v134 = 2050;
          v135 = v27;
          v136 = 2050;
          v137 = *((float *)&v96 + 1);
          v138 = 1026;
          v139 = v12;
          _os_log_impl(&dword_1C2614000, v14, OS_LOG_TYPE_DEFAULT, "%s HEP.feats: [%{public}ld,%{public}f,%{public}f,%{public}ld,%{public}f,%{public}f] & [(%{public}@),%{public}f] @ %{public}lu [%{public}f, %{public}d]", buf, 0x76u);

        }
        if (v12 && !*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
        {
          *(_BYTE *)(*(_QWORD *)(a1 + 32) + 13) = 1;
          *(_QWORD *)buf = 0;
          *(_QWORD *)&buf[8] = buf;
          *(_QWORD *)&buf[16] = 0x3032000000;
          v124 = __Block_byref_object_copy__20940;
          *(_QWORD *)v125 = __Block_byref_object_dispose__20941;
          *(_QWORD *)&v125[8] = 0;
          v91 = 0;
          v92 = &v91;
          v93 = 0x2020000000;
          v94 = 0;
          v29 = *(_QWORD *)(a1 + 32);
          v30 = *(NSObject **)(v29 + 288);
          v89[0] = v6;
          v89[1] = 3221225472;
          v89[2] = __61__CSHybridEndpointAnalyzer_osdAnalyzer_didUpdateOSDFeatures___block_invoke_61;
          v89[3] = &unk_1E7C27898;
          v90 = *(_BYTE *)(a1 + 76);
          v89[4] = v29;
          v89[5] = buf;
          v89[6] = &v91;
          dispatch_async_and_wait(v30, v89);
          v85 = 0;
          v86 = &v85;
          v87 = 0x2020000000;
          v88 = 0;
          v81 = 0;
          v82 = &v81;
          v83 = 0x2020000000;
          v84 = 0;
          v77 = 0;
          v78 = &v77;
          v79 = 0x2020000000;
          v80 = 0;
          v73 = 0;
          v74 = &v73;
          v75 = 0x2020000000;
          v76 = 0;
          v31 = *(_QWORD *)(a1 + 32);
          v32 = *(NSObject **)(v31 + 128);
          v72[0] = v6;
          v72[1] = 3221225472;
          v72[2] = __61__CSHybridEndpointAnalyzer_osdAnalyzer_didUpdateOSDFeatures___block_invoke_2_62;
          v72[3] = &unk_1E7C278C0;
          v72[4] = v31;
          v72[5] = &v85;
          v72[6] = &v81;
          v72[7] = &v77;
          v72[8] = &v73;
          dispatch_async_and_wait(v32, v72);
          v33 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
          v34 = *(double *)(*(_QWORD *)(a1 + 32) + 304);
          objc_msgSend(MEMORY[0x1E0D19090], "inputRecordingSampleRate");
          v36 = v35;
          v37 = (void *)MEMORY[0x1E0D19118];
          v38 = v78[3];
          v39 = v82[3];
          objc_msgSend(MEMORY[0x1E0D19090], "inputRecordingSampleRate");
          v40 = objc_msgSend(v37, "hostTimeFromSampleCount:anchorHostTime:anchorSampleCount:sampleRate:", (unint64_t)((v33 + v34) / 1000.0 * v36), v38, v39);
          v41 = *MEMORY[0x1E0D18F60];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
          {
            v42 = *((unsigned __int8 *)v86 + 24);
            *(_DWORD *)v119 = 136315906;
            *(_QWORD *)&v119[4] = "-[CSHybridEndpointAnalyzer osdAnalyzer:didUpdateOSDFeatures:]_block_invoke_3";
            *(_WORD *)&v119[12] = 2050;
            *(double *)&v119[14] = *((float *)&v96 + 1);
            *(_WORD *)&v119[22] = 2050;
            v120 = (uint64_t (*)(uint64_t, uint64_t))v40;
            LOWORD(v121) = 1026;
            *(_DWORD *)((char *)&v121 + 2) = v42;
            _os_log_impl(&dword_1C2614000, v41, OS_LOG_TYPE_DEFAULT, "%s HEP.posterior=%{public}f, result=1, endpointedBuffer.hostTime=%{public}llu, isAnchorTimeBuffered=%{public}d", v119, 0x26u);
          }
          WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 40));
          if (WeakRetained)
          {
            v45 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 40));
            v46 = objc_opt_respondsToSelector();

            if ((v46 & 1) != 0)
            {
              v47 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 40));
              objc_msgSend(v47, "endpointer:reportEndpointBufferHostTime:firstBufferHostTime:", *(_QWORD *)(a1 + 32), v40, v92[3]);

            }
          }
          LODWORD(v44) = HIDWORD(v96);
          if (*((float *)&v96 + 1) == 0.0 && objc_msgSend(v13, "count", v44) == 2)
          {
            v48 = *MEMORY[0x1E0D18F60];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)v119 = 136315394;
              *(_QWORD *)&v119[4] = "-[CSHybridEndpointAnalyzer osdAnalyzer:didUpdateOSDFeatures:]_block_invoke";
              *(_WORD *)&v119[12] = 2114;
              *(_QWORD *)&v119[14] = v13;
              _os_log_impl(&dword_1C2614000, v48, OS_LOG_TYPE_DEFAULT, "%s request timeout with features %{public}@", v119, 0x16u);
            }
            *(_BYTE *)(*(_QWORD *)(a1 + 32) + 11) = 1;
          }
          *(_QWORD *)(*(_QWORD *)(a1 + 32) + 272) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
          objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 168), *(id *)(a1 + 40));
          objc_msgSend(MEMORY[0x1E0C99D68], "date");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "timeIntervalSinceDate:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40));
          v51 = v50;
          v52 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
          v53 = v74[3];
          *(_QWORD *)v119 = 0;
          *(_QWORD *)&v119[8] = v119;
          *(_QWORD *)&v119[16] = 0x3032000000;
          v120 = __Block_byref_object_copy__20940;
          v121 = __Block_byref_object_dispose__20941;
          v122 = 0;
          v54 = *(_QWORD *)(a1 + 32);
          v55 = *(NSObject **)(v54 + 192);
          v71[0] = v6;
          v71[1] = 3221225472;
          v71[2] = __61__CSHybridEndpointAnalyzer_osdAnalyzer_didUpdateOSDFeatures___block_invoke_66;
          v71[3] = &unk_1E7C29228;
          v71[4] = v54;
          v71[5] = v119;
          dispatch_async_and_wait(v55, v71);
          v117[0] = CFSTR("ExtraDelayMs");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v96);
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          v57 = v51 / (v52 / 1000.0) * (float)((float)v53 / 1000.0) * 1000.0;
          v118[0] = v56;
          v117[1] = CFSTR("EndpointerDecisionLagMs");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v57);
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          v118[1] = v58;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v118, v117, 2);
          v59 = (void *)objc_claimAutoreleasedReturnValue();

          v60 = *MEMORY[0x1E0D18F60];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
          {
            v61 = *(double *)(*(_QWORD *)&v119[8] + 40);
            *(_DWORD *)v111 = 136315650;
            v112 = "-[CSHybridEndpointAnalyzer osdAnalyzer:didUpdateOSDFeatures:]_block_invoke_2";
            v113 = 2114;
            v114 = v61;
            v115 = 2114;
            v116 = v59;
            _os_log_impl(&dword_1C2614000, v60, OS_LOG_TYPE_DEFAULT, "%s ASRFeaturesLatencyDistribution: %{public}@ additionalMetrics: %{public}@", v111, 0x20u);
          }
          objc_msgSend(*(id *)(a1 + 40), "silenceFramesCountMs");
          v63 = v62;
          v64 = [CSEndpointerMetrics alloc];
          v65 = -[CSEndpointerMetrics initWithTotalAudioRecorded:endpointBufferHostTime:featuresAtEndpoint:endpointerType:asrFeatureLatencyDistribution:additionalMetrics:trailingSilenceDurationAtEndpoint:requestId:](v64, "initWithTotalAudioRecorded:endpointBufferHostTime:featuresAtEndpoint:endpointerType:asrFeatureLatencyDistribution:additionalMetrics:trailingSilenceDurationAtEndpoint:requestId:", v40, v13, 1, *(_QWORD *)(*(_QWORD *)&v119[8] + 40), v59, 0, *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24), v63 / 1000.0);
          if (*(_BYTE *)(a1 + 76))
          {
            v66 = *MEMORY[0x1E0D18F60];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEBUG))
            {
              v67 = *(double *)(*(_QWORD *)(a1 + 32) + 272) / 1000.0;
              *(_DWORD *)v111 = 136315394;
              v112 = "-[CSHybridEndpointAnalyzer osdAnalyzer:didUpdateOSDFeatures:]_block_invoke";
              v113 = 2050;
              v114 = v67;
              _os_log_debug_impl(&dword_1C2614000, v66, OS_LOG_TYPE_DEBUG, "%s MMEP:: HEP detected at %{public}f but will continue running for MMEP.", v111, 0x16u);
            }
          }
          else
          {
            v69 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 32));
            objc_msgSend(v69, "endpointer:didDetectHardEndpointAtTime:withMetrics:", *(_QWORD *)(a1 + 32), v65, *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) / 1000.0);

            objc_msgSend(*(id *)(a1 + 32), "_emitEndpointDetectedEventWithEndpointTimeMs:endpointBufferHostTime:endpointerFeatures:endpointerDecisionLagInNs:extraDelayMs:endpointScore:asrFeaturesLatencies:", v40, v105[5], (int)v96, *(_QWORD *)(*(_QWORD *)&v119[8] + 40), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24), v57, *((float *)&v96 + 1));
          }

          _Block_object_dispose(v119, 8);
          _Block_object_dispose(&v73, 8);
          _Block_object_dispose(&v77, 8);
          _Block_object_dispose(&v81, 8);
          _Block_object_dispose(&v85, 8);
          _Block_object_dispose(&v91, 8);
          _Block_object_dispose(buf, 8);

        }
        *(_DWORD *)(*(_QWORD *)(a1 + 32) + 24) = HIDWORD(v96);
        *(double *)(*(_QWORD *)(a1 + 32) + 280) = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) / 1000.0;
        v70 = kUseDefaultServerFeaturesOnClientLag_block_invoke_2_heartbeat_CORESPEECH_HYBRID_CLASSIFIER_PROCESS_END;
        if (__ROR8__(0xEEEEEEEEEEEEEEEFLL* kUseDefaultServerFeaturesOnClientLag_block_invoke_2_heartbeat_CORESPEECH_HYBRID_CLASSIFIER_PROCESS_END, 1) <= 0x888888888888888uLL)
        {
          kdebug_trace();
          v70 = kUseDefaultServerFeaturesOnClientLag_block_invoke_2_heartbeat_CORESPEECH_HYBRID_CLASSIFIER_PROCESS_END;
        }
        kUseDefaultServerFeaturesOnClientLag_block_invoke_2_heartbeat_CORESPEECH_HYBRID_CLASSIFIER_PROCESS_END = v70 + 1;

      }
      else
      {
        v68 = *MEMORY[0x1E0D18F60];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          *(_QWORD *)&buf[4] = "-[CSHybridEndpointAnalyzer osdAnalyzer:didUpdateOSDFeatures:]_block_invoke";
          _os_log_impl(&dword_1C2614000, v68, OS_LOG_TYPE_DEFAULT, "%s ClientLag: Not Invoking HybridClassifier as serverProcessedAudioMs > effectiveClientProcessedAudioMs", buf, 0xCu);
        }
        kdebug_trace();
      }

      _Block_object_dispose(v102, 8);
      _Block_object_dispose(&v104, 8);

    }
  }
}

uint64_t __61__CSHybridEndpointAnalyzer_osdAnalyzer_didUpdateOSDFeatures___block_invoke_57(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 16);
  return result;
}

void __61__CSHybridEndpointAnalyzer_osdAnalyzer_didUpdateOSDFeatures___block_invoke_58(uint64_t a1)
{
  double v2;
  os_log_t *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  double v12;
  NSObject *v13;
  double v14;
  uint64_t v15;
  double v16;
  double v17;
  int v18;
  NSObject *v19;
  _BOOL4 v20;
  double v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  float v26;
  double v27;
  float v28;
  double v29;
  float v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  float v37;
  double v38;
  double v39;
  double v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  double v47;
  double v48;
  double v49;
  double v50;
  void *v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  double v67;
  id v68;
  uint64_t v69;
  uint64_t v70;
  double v71;
  double v72;
  double v73;
  double v74;
  void *v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  uint64_t v85;
  uint64_t v86;
  void *v87;
  int v88;
  const char *v89;
  __int16 v90;
  double v91;
  __int16 v92;
  double v93;
  uint64_t v94;

  v94 = *MEMORY[0x1E0C80C00];
  v2 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  if (v2 >= (double)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 200), "processedAudioDurationInMilliseconds"))
  {
    objc_msgSend(*(id *)(a1 + 40), "processedAudioMs");
    v15 = *(_QWORD *)(a1 + 32);
    if (*(_BYTE *)(v15 + 14))
    {
      v16 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
      v17 = v16 - (double)objc_msgSend(*(id *)(v15 + 200), "processedAudioDurationInMilliseconds");
    }
    else
    {
      v17 = v14;
    }
    v44 = objc_alloc(MEMORY[0x1E0D1F128]);
    v45 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 200), "wordCount");
    v46 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 200), "trailingSilenceDuration");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 200), "eosLikelihood");
    v48 = v47;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 200), "acousticEndpointerScore");
    v50 = v49;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 200), "pauseCounts");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 200), "silencePosterior");
    v53 = v52;
    objc_msgSend(*(id *)(a1 + 40), "silenceFramesCountMs");
    v55 = v54;
    objc_msgSend(*(id *)(a1 + 40), "silenceProbability");
    v57 = v56;
    objc_msgSend(*(id *)(a1 + 40), "silenceDurationMs");
    *(float *)&v59 = v58;
    *(float *)&v60 = v17;
    v61 = objc_msgSend(v44, "initWithWordCount:trailingSilenceDuration:endOfSentenceLikelihood:acousticEndpointerScore:pauseCounts:silencePosterior:clientSilenceFramesCountMs:clientSilenceProbability:silencePosteriorNF:serverFeaturesLatency:eagerResultEndTime:", v45, v46, v51, 0, v48, v50, v53, v55, v57, v59, v60);
    v62 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v63 = *(void **)(v62 + 40);
    *(_QWORD *)(v62 + 40) = v61;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 200), "taskName");
    v64 = objc_claimAutoreleasedReturnValue();
    v65 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v66 = *(void **)(v65 + 40);
    *(_QWORD *)(v65 + 40) = v64;

  }
  else
  {
    v3 = (os_log_t *)MEMORY[0x1E0D18F60];
    v4 = (void *)*MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(void **)(*(_QWORD *)(a1 + 32) + 200);
      v6 = v4;
      *(double *)&v7 = COERCE_DOUBLE(objc_msgSend(v5, "processedAudioDurationInMilliseconds"));
      v8 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
      v88 = 136315650;
      v89 = "-[CSHybridEndpointAnalyzer osdAnalyzer:didUpdateOSDFeatures:]_block_invoke";
      v90 = 2050;
      v91 = *(double *)&v7;
      v92 = 2050;
      v93 = v8;
      _os_log_impl(&dword_1C2614000, v6, OS_LOG_TYPE_DEFAULT, "%s ClientLag: asrProcessedAudioMs(%{public}ld) > effectiveClientProcessedAudioMs(%{public}f)", (uint8_t *)&v88, 0x20u);

    }
    v9 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    v10 = v9 - (double)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 200), "processedAudioDurationInMilliseconds");
    v11 = *(_QWORD *)(a1 + 32);
    v12 = *(double *)(v11 + 248);
    if (v10 <= v12)
    {
      v18 = *(unsigned __int8 *)(v11 + 15);
      v19 = *v3;
      v20 = os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT);
      if (v18)
      {
        if (v20)
        {
          v21 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
          v88 = 136315394;
          v89 = "-[CSHybridEndpointAnalyzer osdAnalyzer:didUpdateOSDFeatures:]_block_invoke";
          v90 = 2050;
          v91 = v21;
          _os_log_impl(&dword_1C2614000, v19, OS_LOG_TYPE_DEFAULT, "%s ClientLag: Using DefaultASRFeatures with disconnected-state asrFeatureLatency: %{public}f", (uint8_t *)&v88, 0x16u);
          v11 = *(_QWORD *)(a1 + 32);
        }
        objc_msgSend(*(id *)(v11 + 176), "defaultServerEndpointFeatures");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_alloc(MEMORY[0x1E0D1F128]);
        v24 = objc_msgSend(v22, "wordCount");
        v25 = objc_msgSend(v22, "trailingSilenceDuration");
        objc_msgSend(v22, "endOfSentenceLikelihood");
        v27 = v26;
        objc_msgSend(v22, "acousticEndpointerScore");
        v29 = v28;
        objc_msgSend(v22, "silencePosterior");
        v31 = v30;
        objc_msgSend(*(id *)(a1 + 40), "silenceFramesCountMs");
        v33 = v32;
        objc_msgSend(*(id *)(a1 + 40), "silenceProbability");
        v35 = v34;
        objc_msgSend(*(id *)(a1 + 40), "silenceDurationMs");
        v37 = v36;
        objc_msgSend(*(id *)(a1 + 40), "processedAudioMs");
        *(float *)&v39 = v38;
        *(float *)&v40 = v37;
        v41 = objc_msgSend(v23, "initWithWordCount:trailingSilenceDuration:endOfSentenceLikelihood:acousticEndpointerScore:pauseCounts:silencePosterior:clientSilenceFramesCountMs:clientSilenceProbability:silencePosteriorNF:serverFeaturesLatency:eagerResultEndTime:", v24, v25, MEMORY[0x1E0C9AA60], 0, v27, v29, v31, v33, v35, v40, v39);
        v42 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
        v43 = *(void **)(v42 + 40);
        *(_QWORD *)(v42 + 40) = v41;

      }
      else
      {
        if (v20)
        {
          v67 = *(double *)(v11 + 256);
          v88 = 136315394;
          v89 = "-[CSHybridEndpointAnalyzer osdAnalyzer:didUpdateOSDFeatures:]_block_invoke";
          v90 = 2050;
          v91 = v67;
          _os_log_impl(&dword_1C2614000, v19, OS_LOG_TYPE_DEFAULT, "%s ClientLag: Using ASRFeatures with ClampedASRFeatureLatency: %{public}f", (uint8_t *)&v88, 0x16u);
        }
        v68 = objc_alloc(MEMORY[0x1E0D1F128]);
        v69 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 200), "wordCount");
        v70 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 200), "trailingSilenceDuration");
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 200), "eosLikelihood");
        v72 = v71;
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 200), "acousticEndpointerScore");
        v74 = v73;
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 200), "pauseCounts");
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 200), "silencePosterior");
        v77 = v76;
        objc_msgSend(*(id *)(a1 + 40), "silenceFramesCountMs");
        v79 = v78;
        objc_msgSend(*(id *)(a1 + 40), "silenceProbability");
        v81 = v80;
        objc_msgSend(*(id *)(a1 + 40), "silenceDurationMs");
        *(float *)&v83 = v82;
        *(float *)&v84 = *(double *)(*(_QWORD *)(a1 + 32) + 256);
        v85 = objc_msgSend(v68, "initWithWordCount:trailingSilenceDuration:endOfSentenceLikelihood:acousticEndpointerScore:pauseCounts:silencePosterior:clientSilenceFramesCountMs:clientSilenceProbability:silencePosteriorNF:serverFeaturesLatency:eagerResultEndTime:", v69, v70, v75, 0, v72, v74, v77, v79, v81, v83, v84);
        v86 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
        v87 = *(void **)(v86 + 40);
        *(_QWORD *)(v86 + 40) = v85;

      }
    }
    else
    {
      v13 = *v3;
      if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
      {
        v88 = 136315650;
        v89 = "-[CSHybridEndpointAnalyzer osdAnalyzer:didUpdateOSDFeatures:]_block_invoke";
        v90 = 2050;
        v91 = v10;
        v92 = 2050;
        v93 = v12;
        _os_log_impl(&dword_1C2614000, v13, OS_LOG_TYPE_DEFAULT, "%s ClientLag: Not invoking HybridClassifier: asrFeatureLatency > clientLagThreshold: %{public}f > %{public}f", (uint8_t *)&v88, 0x20u);
      }
    }
  }
}

double __61__CSHybridEndpointAnalyzer_osdAnalyzer_didUpdateOSDFeatures___block_invoke_61(uint64_t a1)
{
  double result;

  if (!*(_BYTE *)(a1 + 56))
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 16) = 1;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 18) = 1;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 344));
  result = *(double *)(*(_QWORD *)(a1 + 32) + 352);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = (unint64_t)result;
  return result;
}

uint64_t __61__CSHybridEndpointAnalyzer_osdAnalyzer_didUpdateOSDFeatures___block_invoke_2_62(_QWORD *a1)
{
  uint64_t result;

  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = *(_BYTE *)(a1[4] + 10);
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = *(_QWORD *)(a1[4] + 144);
  *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24) = *(_QWORD *)(a1[4] + 152);
  result = objc_msgSend(*(id *)(a1[4] + 160), "getFrameDurationMs");
  *(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 24) = result;
  return result;
}

void __61__CSHybridEndpointAnalyzer_osdAnalyzer_didUpdateOSDFeatures___block_invoke_66(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0D19260], "distributionDictionary:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 216));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "mutableCopy");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(*(_QWORD *)(a1 + 32) + 232));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setObject:forKeyedSubscript:", v6, CFSTR("Warmup"));

}

void __88__CSHybridEndpointAnalyzer_shouldAcceptEagerResultForDuration_resultsCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  int v34;
  NSObject *v35;
  id v36;
  _QWORD block[6];
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  _QWORD v44[2];
  _QWORD v45[2];
  uint8_t buf[4];
  const char *v47;
  __int16 v48;
  double v49;
  __int16 v50;
  double v51;
  __int16 v52;
  double v53;
  __int16 v54;
  double v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v38 = 0;
  v39 = &v38;
  v40 = 0x3032000000;
  v41 = __Block_byref_object_copy__20940;
  v42 = __Block_byref_object_dispose__20941;
  v43 = 0;
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(NSObject **)(v2 + 192);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __88__CSHybridEndpointAnalyzer_shouldAcceptEagerResultForDuration_resultsCompletionHandler___block_invoke_51;
  block[3] = &unk_1E7C29228;
  block[4] = v2;
  block[5] = &v38;
  dispatch_async_and_wait(v3, block);
  v4 = *(double *)(*(_QWORD *)(a1 + 32) + 272);
  v5 = v4 - (double)objc_msgSend((id)v39[5], "processedAudioDurationInMilliseconds");
  v6 = *(double *)(*(_QWORD *)(a1 + 32) + 272);
  v7 = *(double *)(a1 + 48);
  v8 = v6 - v7;
  if (v6 - v7 < 0.0)
  {
    v9 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      v47 = "-[CSHybridEndpointAnalyzer shouldAcceptEagerResultForDuration:resultsCompletionHandler:]_block_invoke_2";
      v48 = 2050;
      v49 = v7;
      v50 = 2050;
      v51 = v6;
      v52 = 2050;
      v53 = v5;
      v54 = 2050;
      v55 = v6 - v7;
      _os_log_impl(&dword_1C2614000, v9, OS_LOG_TYPE_DEFAULT, "%s Accepting RC: RCTime < 0: ASR's processedAudioDuration(%{public}f) > _lastReportedEndpointTimeMs(%{public}f): asrFeatureLatency: %{public}f, rcTimeMs: %{public}f", buf, 0x34u);
      v7 = *(double *)(a1 + 48);
    }
    v10 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v45[0] = v11;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(*(_QWORD *)(a1 + 32) + 272));
    v12 = (id)objc_claimAutoreleasedReturnValue();
    v45[1] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, uint64_t, void *))(v10 + 16))(v10, 1, v13);
LABEL_9:

    goto LABEL_13;
  }
  if (v5 < 0.0)
  {
    v14 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      v47 = "-[CSHybridEndpointAnalyzer shouldAcceptEagerResultForDuration:resultsCompletionHandler:]_block_invoke";
      v48 = 2050;
      v49 = v7;
      v50 = 2050;
      v51 = v6;
      v52 = 2050;
      v53 = v5;
      v54 = 2050;
      v55 = v6 - v7;
      _os_log_impl(&dword_1C2614000, v14, OS_LOG_TYPE_DEFAULT, "%s Rejecting RC: ASRFeatureLatency < 0: ASR's processedAudioDuration(%{public}f): _lastReportedEndpointTimeMs(%{public}f): asrFeatureLatency: %{public}f, rcTimeMs: %{public}f", buf, 0x34u);
      v7 = *(double *)(a1 + 48);
    }
    v15 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v44[0] = v11;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(*(_QWORD *)(a1 + 32) + 272));
    v12 = (id)objc_claimAutoreleasedReturnValue();
    v44[1] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v15 + 16))(v15, 0, v13);
    goto LABEL_9;
  }
  v16 = objc_alloc(MEMORY[0x1E0D1F128]);
  v17 = objc_msgSend((id)v39[5], "wordCount");
  v18 = objc_msgSend((id)v39[5], "trailingSilenceDuration");
  objc_msgSend((id)v39[5], "eosLikelihood");
  v20 = v19;
  objc_msgSend((id)v39[5], "acousticEndpointerScore");
  v22 = v21;
  objc_msgSend((id)v39[5], "pauseCounts");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v39[5], "silencePosterior");
  v25 = v24;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 168), "silenceFramesCountMs");
  v27 = v26;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 168), "silenceProbability");
  v29 = v28;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 168), "silenceDurationMs");
  *(float *)&v31 = v30;
  *(float *)&v32 = v5;
  v11 = (void *)objc_msgSend(v16, "initWithWordCount:trailingSilenceDuration:endOfSentenceLikelihood:acousticEndpointerScore:pauseCounts:silencePosterior:clientSilenceFramesCountMs:clientSilenceProbability:silencePosteriorNF:serverFeaturesLatency:eagerResultEndTime:", v17, v18, v23, (uint64_t)v8, v20, v22, v25, v27, v29, v31, v32);

  v33 = *(void **)(*(_QWORD *)(a1 + 32) + 176);
  v36 = 0;
  v34 = objc_msgSend(v33, "acceptEagerResultWithFeatures:featuresToLog:", v11, &v36);
  v12 = v36;
  v35 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v47 = "-[CSHybridEndpointAnalyzer shouldAcceptEagerResultForDuration:resultsCompletionHandler:]_block_invoke";
    v48 = 2114;
    v49 = *(double *)&v11;
    v50 = 1026;
    LODWORD(v51) = v34;
    _os_log_impl(&dword_1C2614000, v35, OS_LOG_TYPE_DEFAULT, "%s rcEpFeatures: %{public}@ shouldAccept: %{public}d", buf, 0x1Cu);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
LABEL_13:

  _Block_object_dispose(&v38, 8);
}

void __88__CSHybridEndpointAnalyzer_shouldAcceptEagerResultForDuration_resultsCompletionHandler___block_invoke_51(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 200));
}

double __58__CSHybridEndpointAnalyzer_processASRFeatures_fromServer___block_invoke(uint64_t a1)
{
  double result;

  result = *(double *)(*(_QWORD *)(a1 + 32) + 320);
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

void __58__CSHybridEndpointAnalyzer_processASRFeatures_fromServer___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 14) = 1;
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 200), *(id *)(a1 + 40));
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timeIntervalSinceDate:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 240));
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 224) = v3;
  v4 = *(_QWORD *)(a1 + 32);
  if (*(double *)(v4 + 232) >= 0.0)
  {
    v5 = *(void **)(v4 + 216);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v6);

  }
  else
  {
    *(_QWORD *)(v4 + 232) = v3;
  }
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(v7 + 240);
  *(_QWORD *)(v7 + 240) = v2;

}

void __62__CSHybridEndpointAnalyzer_processAudioSamplesAsynchronously___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  int v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v1 + 19))
  {
    *(_BYTE *)(v1 + 19) = 1;
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 344);
    *(_QWORD *)(v4 + 344) = v3;

    *(double *)(*(_QWORD *)(a1 + 32) + 352) = (double)(unint64_t)objc_msgSend(*(id *)(a1 + 40), "hostTime");
    v6 = (void *)*MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(void **)(a1 + 40);
      v8 = v6;
      v9 = 136315394;
      v10 = "-[CSHybridEndpointAnalyzer processAudioSamplesAsynchronously:]_block_invoke";
      v11 = 2050;
      v12 = objc_msgSend(v7, "hostTime");
      _os_log_impl(&dword_1C2614000, v8, OS_LOG_TYPE_DEFAULT, "%s first audio buffer host time: %{public}llu", (uint8_t *)&v9, 0x16u);

    }
  }
}

uint64_t __62__CSHybridEndpointAnalyzer_processAudioSamplesAsynchronously___block_invoke_48(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 312);
  return result;
}

void __62__CSHybridEndpointAnalyzer_processAudioSamplesAsynchronously___block_invoke_2(uint64_t a1)
{
  NSObject *v1;
  uint64_t v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  BOOL v17;
  uint64_t v18;
  __int128 v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 20))
  {
    v1 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v21 = "-[CSHybridEndpointAnalyzer processAudioSamplesAsynchronously:]_block_invoke_2";
      _os_log_impl(&dword_1C2614000, v1, OS_LOG_TYPE_INFO, "%s HEP::RecordingDidStop: Ignoring processAudioSamplesAsynchronously", buf, 0xCu);
    }
  }
  else
  {
    v3 = kUseDefaultServerFeaturesOnClientLag_block_invoke_heartbeat_CORESPEECH_HYBRID_ENDPOINTER_PROCESS_AUDIO_ASYNC_BEGIN;
    if (__ROR8__(0xEEEEEEEEEEEEEEEFLL* kUseDefaultServerFeaturesOnClientLag_block_invoke_heartbeat_CORESPEECH_HYBRID_ENDPOINTER_PROCESS_AUDIO_ASYNC_BEGIN, 1) <= 0x888888888888888uLL)
    {
      kdebug_trace();
      v3 = kUseDefaultServerFeaturesOnClientLag_block_invoke_heartbeat_CORESPEECH_HYBRID_ENDPOINTER_PROCESS_AUDIO_ASYNC_BEGIN;
    }
    kUseDefaultServerFeaturesOnClientLag_block_invoke_heartbeat_CORESPEECH_HYBRID_ENDPOINTER_PROCESS_AUDIO_ASYNC_BEGIN = v3 + 1;
    v4 = objc_msgSend(*(id *)(a1 + 40), "numSamples");
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 144) = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 136);
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 152) = objc_msgSend(*(id *)(a1 + 40), "hostTime");
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 10) = objc_msgSend(*(id *)(a1 + 40), "wasBuffered");
    if (v4 >= 1)
    {
      v6 = 0;
      *(_QWORD *)&v5 = 136315394;
      v19 = v5;
      do
      {
        if (v4 >= 640)
          v7 = 640;
        else
          v7 = v4;
        v8 = *(_QWORD *)(a1 + 32);
        v9 = *(_QWORD *)(v8 + 136);
        if (v9 >= *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
        {
          if (!*(_BYTE *)(v8 + 12))
          {
            *(_BYTE *)(v8 + 12) = 1;
            v10 = *MEMORY[0x1E0D18F60];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
            {
              v11 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 136);
              *(_DWORD *)buf = v19;
              v21 = "-[CSHybridEndpointAnalyzer processAudioSamplesAsynchronously:]_block_invoke";
              v22 = 2050;
              v23 = v11;
              _os_log_impl(&dword_1C2614000, v10, OS_LOG_TYPE_DEFAULT, "%s addAudio first sample offset: %{public}lu", buf, 0x16u);
            }
            v8 = *(_QWORD *)(a1 + 32);
          }
          objc_msgSend(*(id *)(a1 + 40), "subChunkFrom:numSamples:forChannel:", v6, v7, *(_QWORD *)(v8 + 48), v19);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "data");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(MEMORY[0x1E0D19090], "inputRecordingIsFloat"))
          {
            v14 = (void *)MEMORY[0x1E0D19100];
            objc_msgSend(v12, "data");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "convertToShortLPCMBufFromFloatLPCMBuf:", v15);
            v16 = objc_claimAutoreleasedReturnValue();

            v13 = (void *)v16;
          }
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "addAudio:numSamples:", v13, objc_msgSend(v12, "numSamples"));

          v8 = *(_QWORD *)(a1 + 32);
          v9 = *(_QWORD *)(v8 + 136);
        }
        v6 += v7;
        *(_QWORD *)(v8 + 136) = v9 + v7;
        v17 = v4 <= v7;
        v4 -= v7;
      }
      while (!v17);
    }
    v18 = kUseDefaultServerFeaturesOnClientLag_block_invoke_heartbeat_CORESPEECH_HYBRID_ENDPOINTER_PROCESS_AUDIO_ASYNC_END;
    if (__ROR8__(0xEEEEEEEEEEEEEEEFLL* kUseDefaultServerFeaturesOnClientLag_block_invoke_heartbeat_CORESPEECH_HYBRID_ENDPOINTER_PROCESS_AUDIO_ASYNC_END, 1) <= 0x888888888888888uLL)
    {
      kdebug_trace();
      v18 = kUseDefaultServerFeaturesOnClientLag_block_invoke_heartbeat_CORESPEECH_HYBRID_ENDPOINTER_PROCESS_AUDIO_ASYNC_END;
    }
    kUseDefaultServerFeaturesOnClientLag_block_invoke_heartbeat_CORESPEECH_HYBRID_ENDPOINTER_PROCESS_AUDIO_ASYNC_END = v18 + 1;
  }
}

uint64_t __50__CSHybridEndpointAnalyzer_endpointerModelVersion__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_loadAndSetupEndpointerAssetIfNecessary");
}

uint64_t __32__CSHybridEndpointAnalyzer_init__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_loadAndSetupEndpointerAssetIfNecessary");
}

@end
