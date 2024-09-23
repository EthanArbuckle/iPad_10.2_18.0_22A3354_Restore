@implementation CSHybridEndpointer

- (CSHybridEndpointer)init
{
  CSHybridEndpointer *v2;
  CSHybridEndpointer *v3;
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
  NSObject *v17;
  CSHybridEndpointer *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  OS_dispatch_queue *hybridClassifierQueue;
  float v25;
  uint64_t v26;
  CSASRFeatures *lastKnownASRFeatures;
  uint64_t v28;
  OSDFeatures *lastKnownOSDFeatures;
  NSDictionary *taskThresholdMap;
  NSDictionary *enhancedEndpointerTaskThresholdMap;
  uint64_t v32;
  CSASRFeatures *lastKnownRCFeatures;
  uint64_t block;
  uint64_t v36;
  void (*v37)(uint64_t);
  void *v38;
  CSHybridEndpointer *v39;
  objc_super v40;

  v40.receiver = self;
  v40.super_class = (Class)CSHybridEndpointer;
  v2 = -[CSHybridEndpointer init](&v40, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_didCommunicateEndpoint = 0;
    v2->_speechEndpointDetected = 0;
    v2->_recordingDidStop = 0;
    v2->_lastEndpointPosterior = 0.0;
    v2->_endpointerOperationMode = 0;
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

    -[CSHybridEndpointer _getSerialQueueWithName:targetQueue:](v3, "_getSerialQueueWithName:targetQueue:", v8, v4);
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

    -[CSHybridEndpointer _getSerialQueueWithName:targetQueue:](v3, "_getSerialQueueWithName:targetQueue:", v14, v4);
    v15 = objc_claimAutoreleasedReturnValue();
    asrFeaturesQueue = v3->_asrFeaturesQueue;
    v3->_asrFeaturesQueue = (OS_dispatch_queue *)v15;

    v17 = v3->_stateSerialQueue;
    block = MEMORY[0x1E0C809B0];
    v36 = 3221225472;
    v37 = __26__CSHybridEndpointer_init__block_invoke;
    v38 = &unk_1E7C292C8;
    v18 = v3;
    v39 = v18;
    dispatch_async(v17, &block);
    v19 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend((id)objc_opt_class(), "description");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "lowercaseString");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "stringWithFormat:", CFSTR("com.apple.cs.%@.hybridClassifierfQueue"), v21, block, v36, v37, v38);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    -[CSHybridEndpointer _getSerialQueueWithName:targetQueue:](v18, "_getSerialQueueWithName:targetQueue:", v22, v4);
    v23 = objc_claimAutoreleasedReturnValue();
    hybridClassifierQueue = v18->_hybridClassifierQueue;
    v18->_hybridClassifierQueue = (OS_dispatch_queue *)v23;

    objc_msgSend(MEMORY[0x1E0D19090], "inputRecordingSampleRate");
    v18->_currentRequestSampleRate = (unint64_t)v25;
    +[CSASRFeatures initialASRFeatures](CSASRFeatures, "initialASRFeatures");
    v26 = objc_claimAutoreleasedReturnValue();
    lastKnownASRFeatures = v18->_lastKnownASRFeatures;
    v18->_lastKnownASRFeatures = (CSASRFeatures *)v26;

    *(int64x2_t *)&v18->_lastKnownASRFeatureLatency = vdupq_n_s64(0xBF847AE147AE147BLL);
    v18->_epResult = 0;
    v28 = objc_msgSend(objc_alloc(MEMORY[0x1E0DA8D38]), "initWithSilenceFramesCountMs:silenceProbability:silenceDurationMs:processedAudioMs:", 0.0, 0.0, 0.0, 0.0);
    lastKnownOSDFeatures = v18->_lastKnownOSDFeatures;
    v18->_lastKnownOSDFeatures = (OSDFeatures *)v28;

    *(_OWORD *)&v18->_clientLagThresholdMs = xmmword_1C276CE10;
    v18->_useDefaultASRFeaturesOnClientLag = 1;
    taskThresholdMap = v18->_taskThresholdMap;
    v18->_extraDelayFrequency = 1000;
    v18->_taskThresholdMap = 0;

    enhancedEndpointerTaskThresholdMap = v18->_enhancedEndpointerTaskThresholdMap;
    v18->_enhancedEndpointerTaskThresholdMap = 0;

    +[CSASRFeatures initialResultCandidateFeatures](CSASRFeatures, "initialResultCandidateFeatures");
    v32 = objc_claimAutoreleasedReturnValue();
    lastKnownRCFeatures = v18->_lastKnownRCFeatures;
    v18->_lastKnownRCFeatures = (CSASRFeatures *)v32;

    *(_WORD *)&v18->_hasAcceptedEagerResult = 0;
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
    block[2] = __44__CSHybridEndpointer_endpointerModelVersion__block_invoke;
    block[3] = &unk_1E7C292C8;
    block[4] = self;
    dispatch_async_and_wait(stateSerialQueue, block);
    endpointerModelVersion = self->_endpointerModelVersion;
  }
  return endpointerModelVersion;
}

- (void)_updateCurrentAsset:(id)a3
{
  CSAsset *v5;
  CSAsset *currentAsset;
  NSObject *v7;
  _BOOL4 v8;
  int v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = (CSAsset *)a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateSerialQueue);
  currentAsset = self->_currentAsset;
  v7 = *MEMORY[0x1E0D18F40];
  v8 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F40], OS_LOG_TYPE_DEFAULT);
  if (currentAsset == v5)
  {
    if (v8)
    {
      v9 = 136315138;
      v10 = "-[CSHybridEndpointer _updateCurrentAsset:]";
      _os_log_impl(&dword_1C2614000, v7, OS_LOG_TYPE_DEFAULT, "%s New asset is the same as current asset - no update needed.", (uint8_t *)&v9, 0xCu);
    }
  }
  else
  {
    if (v8)
    {
      v9 = 136315138;
      v10 = "-[CSHybridEndpointer _updateCurrentAsset:]";
      _os_log_impl(&dword_1C2614000, v7, OS_LOG_TYPE_DEFAULT, "%s Updating current asset.", (uint8_t *)&v9, 0xCu);
    }
    objc_storeStrong((id *)&self->_currentAsset, a3);
    -[CSHybridEndpointer _readParametersFromHEPAsset:](self, "_readParametersFromHEPAsset:", self->_currentAsset);
  }

}

- (void)updateEndpointerThreshold:(float)a3
{
  NSObject *hybridClassifierQueue;
  _QWORD v4[5];
  float v5;

  hybridClassifierQueue = self->_hybridClassifierQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __48__CSHybridEndpointer_updateEndpointerThreshold___block_invoke;
  v4[3] = &unk_1E7C27848;
  v4[4] = self;
  v5 = a3;
  dispatch_async(hybridClassifierQueue, v4);
}

- (void)updateEnhancedEndpointerDefaultThresholdPartial:(float)a3 defaultThresholdRC:(float)a4 relaxedThresholdPartial:(float)a5 relaxedThresholdRC:(float)a6
{
  NSObject *v6;
  NSObject *hybridClassifierQueue;
  _QWORD block[5];
  float v9;
  float v10;
  float v11;
  float v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (self->_recordingDidStop)
  {
    v6 = *MEMORY[0x1E0D18F40];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F40], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v14 = "-[CSHybridEndpointer updateEnhancedEndpointerDefaultThresholdPartial:defaultThresholdRC:relaxedThresholdPart"
            "ial:relaxedThresholdRC:]";
      v15 = 2080;
      v16 = "Don't update thresholds";
      _os_log_impl(&dword_1C2614000, v6, OS_LOG_TYPE_DEFAULT, "%s Recording stopped: %s", buf, 0x16u);
    }
  }
  else
  {
    hybridClassifierQueue = self->_hybridClassifierQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __132__CSHybridEndpointer_updateEnhancedEndpointerDefaultThresholdPartial_defaultThresholdRC_relaxedThresholdPartial_relaxedThresholdRC___block_invoke;
    block[3] = &unk_1E7C28520;
    block[4] = self;
    v9 = a3;
    v10 = a4;
    v11 = a5;
    v12 = a6;
    dispatch_async(hybridClassifierQueue, block);
  }
}

- (void)_updateEndpointerDelayedTriggerByMhId:(id)a3
{
  id v4;
  NSObject *asrFeaturesQueue;
  unint64_t v6;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_hybridClassifierQueue);
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 1000;
  asrFeaturesQueue = self->_asrFeaturesQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __60__CSHybridEndpointer__updateEndpointerDelayedTriggerByMhId___block_invoke;
  v7[3] = &unk_1E7C29228;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_async_and_wait(asrFeaturesQueue, v7);
  v6 = objc_msgSend(v4, "hash");
  if (v6 % v9[3] == 1)
    -[CSHybridEndpointer updateEndpointerDelayedTrigger:](self, "updateEndpointerDelayedTrigger:", 1);
  _Block_object_dispose(&v8, 8);

}

- (void)updateEndpointerDelayedTrigger:(BOOL)a3
{
  NSObject *v3;
  NSObject *hybridClassifierQueue;
  _QWORD v5[5];
  BOOL v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (self->_recordingDidStop)
  {
    v3 = *MEMORY[0x1E0D18F40];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F40], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v8 = "-[CSHybridEndpointer updateEndpointerDelayedTrigger:]";
      v9 = 2080;
      v10 = "Don't update trigger switch";
      _os_log_impl(&dword_1C2614000, v3, OS_LOG_TYPE_DEFAULT, "%s Recording stopped: %s", buf, 0x16u);
    }
  }
  else
  {
    hybridClassifierQueue = self->_hybridClassifierQueue;
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __53__CSHybridEndpointer_updateEndpointerDelayedTrigger___block_invoke;
    v5[3] = &unk_1E7C28480;
    v5[4] = self;
    v6 = a3;
    dispatch_async(hybridClassifierQueue, v5);
  }
}

- (void)setEndpointerOperationMode:(int64_t)a3
{
  NSObject *stateSerialQueue;
  _QWORD v4[6];

  stateSerialQueue = self->_stateSerialQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __49__CSHybridEndpointer_setEndpointerOperationMode___block_invoke;
  v4[3] = &unk_1E7C29178;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(stateSerialQueue, v4);
}

- (int64_t)fetchCurrentEndpointerOperationMode
{
  NSObject *stateSerialQueue;
  int64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  stateSerialQueue = self->_stateSerialQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __57__CSHybridEndpointer_fetchCurrentEndpointerOperationMode__block_invoke;
  v5[3] = &unk_1E7C29228;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_async_and_wait(stateSerialQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)processASRFeatures:(id)a3 fromServer:(BOOL)a4
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *stateSerialQueue;
  uint64_t v10;
  uint64_t v11;
  NSObject *asrFeaturesQueue;
  _QWORD v13[5];
  id v14;
  BOOL v15;
  _QWORD block[6];
  _BYTE buf[24];
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = *MEMORY[0x1E0D18F40];
  v8 = *MEMORY[0x1E0D18F40];
  if (self->_recordingDidStop)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "-[CSHybridEndpointer processASRFeatures:fromServer:]";
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = "Don't process ASR features";
      _os_log_impl(&dword_1C2614000, v7, OS_LOG_TYPE_DEFAULT, "%s Recording stopped: %s", buf, 0x16u);
    }
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "-[CSHybridEndpointer processASRFeatures:fromServer:]";
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v6;
      _os_log_impl(&dword_1C2614000, v7, OS_LOG_TYPE_INFO, "%s EARSPG: CSASRFeatures: %{public}@", buf, 0x16u);
    }
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    v18 = 0;
    stateSerialQueue = self->_stateSerialQueue;
    v10 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __52__CSHybridEndpointer_processASRFeatures_fromServer___block_invoke;
    block[3] = &unk_1E7C29228;
    block[4] = self;
    block[5] = buf;
    dispatch_async_and_wait(stateSerialQueue, block);
    v11 = objc_msgSend(v6, "processedAudioDurationInMilliseconds");
    if (*(double *)(*(_QWORD *)&buf[8] + 24) <= (double)v11)
    {
      asrFeaturesQueue = self->_asrFeaturesQueue;
      v13[0] = v10;
      v13[1] = 3221225472;
      v13[2] = __52__CSHybridEndpointer_processASRFeatures_fromServer___block_invoke_2;
      v13[3] = &unk_1E7C28888;
      v13[4] = self;
      v15 = a4;
      v14 = v6;
      dispatch_async(asrFeaturesQueue, v13);

    }
    _Block_object_dispose(buf, 8);
  }

}

- (void)processTaskString:(id)a3
{
  id v4;
  NSObject *hybridClassifierQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  CSHybridEndpointer *v9;

  v4 = a3;
  hybridClassifierQueue = self->_hybridClassifierQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __40__CSHybridEndpointer_processTaskString___block_invoke;
  v7[3] = &unk_1E7C292A0;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(hybridClassifierQueue, v7);

}

- (void)_processEnhancedEndpointerTaskString:(id)a3
{
  id v4;
  NSObject *asrFeaturesQueue;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  NSObject *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(_QWORD *);
  void *v19;
  CSHybridEndpointer *v20;
  id v21;
  uint64_t *v22;
  uint64_t *v23;
  uint64_t *v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  int v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  int v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  int v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  int v41;
  uint8_t buf[4];
  const char *v43;
  __int16 v44;
  id v45;
  __int16 v46;
  double v47;
  __int16 v48;
  double v49;
  __int16 v50;
  double v51;
  __int16 v52;
  double v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_hybridClassifierQueue);
  v38 = 0;
  v39 = &v38;
  v40 = 0x2020000000;
  v41 = 0;
  v34 = 0;
  v35 = &v34;
  v36 = 0x2020000000;
  v37 = 0;
  v30 = 0;
  v31 = &v30;
  v32 = 0x2020000000;
  v33 = 0;
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 0;
  asrFeaturesQueue = self->_asrFeaturesQueue;
  v16 = MEMORY[0x1E0C809B0];
  v17 = 3221225472;
  v18 = __59__CSHybridEndpointer__processEnhancedEndpointerTaskString___block_invoke;
  v19 = &unk_1E7C26A90;
  v20 = self;
  v6 = v4;
  v21 = v6;
  v22 = &v38;
  v23 = &v34;
  v24 = &v30;
  v25 = &v26;
  dispatch_async_and_wait(asrFeaturesQueue, &v16);
  if (*((float *)v39 + 6) > 0.0 && *((float *)v35 + 6) > 0.0)
  {
    -[CSHybridEndpointer _swapEnhancedEndpointerModelForTaskString:](self, "_swapEnhancedEndpointerModelForTaskString:", v6, v16, v17, v18, v19, v20);
    LODWORD(v7) = *((_DWORD *)v39 + 6);
    LODWORD(v8) = *((_DWORD *)v35 + 6);
    LODWORD(v9) = *((_DWORD *)v31 + 6);
    LODWORD(v10) = *((_DWORD *)v27 + 6);
    -[CSHybridEndpointer updateEnhancedEndpointerDefaultThresholdPartial:defaultThresholdRC:relaxedThresholdPartial:relaxedThresholdRC:](self, "updateEnhancedEndpointerDefaultThresholdPartial:defaultThresholdRC:relaxedThresholdPartial:relaxedThresholdRC:", v7, v8, v9, v10);
    v11 = *MEMORY[0x1E0D18F40];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F40], OS_LOG_TYPE_DEFAULT))
    {
      v12 = *((float *)v39 + 6);
      v13 = *((float *)v35 + 6);
      v14 = *((float *)v31 + 6);
      v15 = *((float *)v27 + 6);
      *(_DWORD *)buf = 136316418;
      v43 = "-[CSHybridEndpointer _processEnhancedEndpointerTaskString:]";
      v44 = 2114;
      v45 = v6;
      v46 = 2050;
      v47 = v12;
      v48 = 2050;
      v49 = v13;
      v50 = 2050;
      v51 = v14;
      v52 = 2050;
      v53 = v15;
      _os_log_impl(&dword_1C2614000, v11, OS_LOG_TYPE_DEFAULT, "%s Updated enhanced endpointer thresholds for task %{public}@ - defaultThresholdPartial: %{public}f, defaultThresholdRC: %{public}f, relaxedThresholdPartial: %{public}f, relaxedThresholdRC: %{public}f", buf, 0x3Eu);
    }
  }

  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(&v38, 8);

}

- (void)_swapEnhancedEndpointerModelForTaskString:(id)a3
{
  char *v4;
  NSObject *v5;
  NSDictionary *taskEnhancedEndpointerMap;
  void *v7;
  os_log_t *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  os_log_t v12;
  const char *v13;
  NSObject *v14;
  uint32_t v15;
  int v16;
  const char *v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  const __CFString *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = (char *)a3;
  if (self->_recordingDidStop)
  {
    v5 = *MEMORY[0x1E0D18F40];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F40], OS_LOG_TYPE_DEFAULT))
    {
      v16 = 136315394;
      v17 = "-[CSHybridEndpointer _swapEnhancedEndpointerModelForTaskString:]";
      v18 = 2080;
      v19 = "Don't switch enhanced endpointer models";
      _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_DEFAULT, "%s Recording stopped: %s", (uint8_t *)&v16, 0x16u);
    }
    goto LABEL_13;
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_hybridClassifierQueue);
  taskEnhancedEndpointerMap = self->_taskEnhancedEndpointerMap;
  if (!taskEnhancedEndpointerMap)
  {
    v11 = *MEMORY[0x1E0D18F40];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F40], OS_LOG_TYPE_FAULT))
      goto LABEL_13;
    v16 = 136315138;
    v17 = "-[CSHybridEndpointer _swapEnhancedEndpointerModelForTaskString:]";
    v13 = "%s Expected _taskEnhancedEndpointerMap to be non-nil.";
    v14 = v11;
    v15 = 12;
LABEL_17:
    _os_log_fault_impl(&dword_1C2614000, v14, OS_LOG_TYPE_FAULT, v13, (uint8_t *)&v16, v15);
    goto LABEL_13;
  }
  -[NSDictionary objectForKey:](taskEnhancedEndpointerMap, "objectForKey:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    -[NSDictionary objectForKey:](self->_taskEnhancedEndpointerMap, "objectForKey:", CFSTR("SearchOrMessaging"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (os_log_t *)MEMORY[0x1E0D18F40];
    v9 = *MEMORY[0x1E0D18F40];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F40], OS_LOG_TYPE_DEFAULT))
    {
      v16 = 136315650;
      v17 = "-[CSHybridEndpointer _swapEnhancedEndpointerModelForTaskString:]";
      v18 = 2114;
      v19 = v4;
      v20 = 2114;
      v21 = CFSTR("SearchOrMessaging");
      _os_log_impl(&dword_1C2614000, v9, OS_LOG_TYPE_DEFAULT, "%s No enhanced endpointer model for task %{public}@, falling back to default task %{public}@", (uint8_t *)&v16, 0x20u);
    }
    if (!v7)
    {
      v12 = *v8;
      if (!os_log_type_enabled(*v8, OS_LOG_TYPE_FAULT))
        goto LABEL_13;
      v16 = 136315650;
      v17 = "-[CSHybridEndpointer _swapEnhancedEndpointerModelForTaskString:]";
      v18 = 2114;
      v19 = v4;
      v20 = 2114;
      v21 = CFSTR("SearchOrMessaging");
      v13 = "%s Unable to find enhanced endpointer model for task %{public}@ or default task %{public}@";
      v14 = v12;
      v15 = 32;
      goto LABEL_17;
    }
  }
  objc_storeStrong((id *)&self->_enhancedEndpointer, v7);
  v10 = *MEMORY[0x1E0D18F40];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F40], OS_LOG_TYPE_DEFAULT))
  {
    v16 = 136315394;
    v17 = "-[CSHybridEndpointer _swapEnhancedEndpointerModelForTaskString:]";
    v18 = 2114;
    v19 = v4;
    _os_log_impl(&dword_1C2614000, v10, OS_LOG_TYPE_DEFAULT, "%s Swapping enhanced endpointer model to model for %{public}@ (or default)", (uint8_t *)&v16, 0x16u);
  }

LABEL_13:
}

- (BOOL)shouldAcceptEagerResultForDurationSync:(double)a3 withEndpointerMetrics:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *hybridClassifierQueue;
  id v12;
  id v13;
  _QWORD v15[5];
  id v16;
  id v17;
  uint64_t *v18;
  double v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;

  v6 = a4;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  objc_msgSend(v6, "totalAudioRecorded");
  v8 = v7;
  objc_msgSend(v6, "asrFeaturesAtEndpoint");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "osdFeaturesAtEndpoint");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  hybridClassifierQueue = self->_hybridClassifierQueue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __83__CSHybridEndpointer_shouldAcceptEagerResultForDurationSync_withEndpointerMetrics___block_invoke;
  v15[3] = &unk_1E7C26AE0;
  v15[4] = self;
  v16 = v9;
  v19 = a3;
  v20 = v8;
  v17 = v10;
  v18 = &v21;
  v12 = v10;
  v13 = v9;
  dispatch_async_and_wait(hybridClassifierQueue, v15);
  LOBYTE(hybridClassifierQueue) = *((_BYTE *)v22 + 24);

  _Block_object_dispose(&v21, 8);
  return (char)hybridClassifierQueue;
}

- (void)shouldAcceptEagerResultForDuration:(double)a3 withEndpointerMetrics:(id)a4 resultsCompletionHandler:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *hybridClassifierQueue;
  id v15;
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  double v22;
  uint64_t v23;

  v8 = a5;
  v9 = a4;
  objc_msgSend(v9, "totalAudioRecorded");
  v11 = v10;
  objc_msgSend(v9, "asrFeaturesAtEndpoint");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "osdFeaturesAtEndpoint");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  hybridClassifierQueue = self->_hybridClassifierQueue;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __104__CSHybridEndpointer_shouldAcceptEagerResultForDuration_withEndpointerMetrics_resultsCompletionHandler___block_invoke;
  v18[3] = &unk_1E7C26B08;
  v18[4] = self;
  v19 = v12;
  v22 = a3;
  v23 = v11;
  v20 = v13;
  v21 = v8;
  v15 = v8;
  v16 = v13;
  v17 = v12;
  dispatch_async(hybridClassifierQueue, v18);

}

- (void)shouldAcceptEagerResultForDuration:(double)a3 resultsCompletionHandler:(id)a4
{
  id v6;
  NSObject *asrFeaturesQueue;
  uint64_t v8;
  NSObject *hybridClassifierQueue;
  id v10;
  _QWORD v11[5];
  id v12;
  _QWORD *v13;
  double v14;
  _QWORD block[6];
  _QWORD v16[5];
  id v17;

  v6 = a4;
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x3032000000;
  v16[3] = __Block_byref_object_copy__16879;
  v16[4] = __Block_byref_object_dispose__16880;
  v17 = 0;
  asrFeaturesQueue = self->_asrFeaturesQueue;
  v8 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __82__CSHybridEndpointer_shouldAcceptEagerResultForDuration_resultsCompletionHandler___block_invoke;
  block[3] = &unk_1E7C29228;
  block[4] = self;
  block[5] = v16;
  dispatch_async_and_wait(asrFeaturesQueue, block);
  hybridClassifierQueue = self->_hybridClassifierQueue;
  v11[0] = v8;
  v11[1] = 3221225472;
  v11[2] = __82__CSHybridEndpointer_shouldAcceptEagerResultForDuration_resultsCompletionHandler___block_invoke_2;
  v11[3] = &unk_1E7C26B30;
  v14 = a3;
  v12 = v6;
  v13 = v16;
  v11[4] = self;
  v10 = v6;
  dispatch_async(hybridClassifierQueue, v11);

  _Block_object_dispose(v16, 8);
}

- (void)_shouldAcceptEagerResultForDuration:(double)a3 asrFeatures:(id)a4 lastReportedEndpointTimeMs:(double)a5 osdFeatures:(id)a6 resultsCompletionHandler:(id)a7
{
  id v12;
  id v13;
  void (**v14)(id, _QWORD, void *);
  NSObject *v15;
  double v16;
  id v17;
  void *v18;
  _QWORD *v19;
  NSObject *v20;
  void *v21;
  double v22;
  double v23;
  NSObject *v24;
  NSObject *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  _EAREndpointer *hybridClassifier;
  uint64_t v44;
  NSObject *v45;
  id v46;
  _QWORD v47[2];
  _QWORD v48[2];
  uint8_t buf[4];
  const char *v50;
  __int16 v51;
  double v52;
  __int16 v53;
  double v54;
  __int16 v55;
  double v56;
  __int16 v57;
  double v58;
  _QWORD v59[2];
  _QWORD v60[3];

  v60[2] = *MEMORY[0x1E0C80C00];
  v12 = a4;
  v13 = a6;
  v14 = (void (**)(id, _QWORD, void *))a7;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_hybridClassifierQueue);
  if (self->_hasAcceptedEagerResult)
  {
    v15 = *MEMORY[0x1E0D18F40];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F40], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v50 = "-[CSHybridEndpointer _shouldAcceptEagerResultForDuration:asrFeatures:lastReportedEndpointTimeMs:osdFeatures:"
            "resultsCompletionHandler:]";
      _os_log_impl(&dword_1C2614000, v15, OS_LOG_TYPE_DEFAULT, "%s Rejecting RC: Already accepted an earlier RC for this request", buf, 0xCu);
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
    v16 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
    *(double *)v60 = v16;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a5);
    v17 = (id)objc_claimAutoreleasedReturnValue();
    v60[1] = v17;
    v18 = (void *)MEMORY[0x1E0C99D20];
    v19 = v60;
LABEL_9:
    objc_msgSend(v18, "arrayWithObjects:count:", v19, 2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v14[2](v14, 0, v21);
LABEL_10:

    goto LABEL_11;
  }
  if (self->_disableRCSelection)
  {
    v20 = *MEMORY[0x1E0D18F40];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F40], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v50 = "-[CSHybridEndpointer _shouldAcceptEagerResultForDuration:asrFeatures:lastReportedEndpointTimeMs:osdFeatures:"
            "resultsCompletionHandler:]";
      _os_log_impl(&dword_1C2614000, v20, OS_LOG_TYPE_DEFAULT, "%s Rejecting RC: ASR is running on-device (full UoD)", buf, 0xCu);
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
    v16 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
    *(double *)v59 = v16;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a5);
    v17 = (id)objc_claimAutoreleasedReturnValue();
    v59[1] = v17;
    v18 = (void *)MEMORY[0x1E0C99D20];
    v19 = v59;
    goto LABEL_9;
  }
  v22 = a5 - (double)objc_msgSend(v12, "processedAudioDurationInMilliseconds");
  v23 = a5 - a3;
  if (a5 - a3 < 0.0)
  {
    v24 = *MEMORY[0x1E0D18F40];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F40], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      v50 = "-[CSHybridEndpointer _shouldAcceptEagerResultForDuration:asrFeatures:lastReportedEndpointTimeMs:osdFeatures:"
            "resultsCompletionHandler:]";
      v51 = 2050;
      v52 = a3;
      v53 = 2050;
      v54 = a5;
      v55 = 2050;
      v56 = v22;
      v57 = 2050;
      v58 = a5 - a3;
      _os_log_impl(&dword_1C2614000, v24, OS_LOG_TYPE_DEFAULT, "%s Accepting RC: RCTime < 0: ASR's processedAudioDuration(%{public}f) > lastReportedEndpointTimeMs(%{public}f): asrFeatureLatency: %{public}f, rcTimeMs: %{public}f", buf, 0x34u);
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
    v16 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
    *(double *)v48 = v16;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a5);
    v17 = (id)objc_claimAutoreleasedReturnValue();
    v48[1] = v17;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v48, 2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v14[2](v14, 1, v21);
    goto LABEL_10;
  }
  if (v22 < 0.0)
  {
    v25 = *MEMORY[0x1E0D18F40];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F40], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      v50 = "-[CSHybridEndpointer _shouldAcceptEagerResultForDuration:asrFeatures:lastReportedEndpointTimeMs:osdFeatures:"
            "resultsCompletionHandler:]";
      v51 = 2050;
      v52 = a3;
      v53 = 2050;
      v54 = a5;
      v55 = 2050;
      v56 = v22;
      v57 = 2050;
      v58 = a5 - a3;
      _os_log_impl(&dword_1C2614000, v25, OS_LOG_TYPE_DEFAULT, "%s Rejecting RC: SFLatency < 0: ASR's processedAudioDuration(%{public}f): lastReportedEndpointTimeMs(%{public}f): asrFeatureLatency: %{public}f, rcTimeMs: %{public}f", buf, 0x34u);
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
    v16 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
    *(double *)v47 = v16;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a5);
    v17 = (id)objc_claimAutoreleasedReturnValue();
    v47[1] = v17;
    v18 = (void *)MEMORY[0x1E0C99D20];
    v19 = v47;
    goto LABEL_9;
  }
  v26 = objc_alloc(MEMORY[0x1E0D1F128]);
  v27 = objc_msgSend(v12, "wordCount");
  v28 = objc_msgSend(v12, "trailingSilenceDuration");
  objc_msgSend(v12, "eosLikelihood");
  v30 = v29;
  objc_msgSend(v12, "acousticEndpointerScore");
  v32 = v31;
  objc_msgSend(v12, "pauseCounts");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "silencePosterior");
  v35 = v34;
  objc_msgSend(v13, "silenceFramesCountMs");
  v37 = v36;
  objc_msgSend(v13, "silenceProbability");
  v39 = v38;
  objc_msgSend(v13, "silenceDurationMs");
  *(float *)&v41 = v40;
  *(float *)&v42 = v22;
  v16 = COERCE_DOUBLE(objc_msgSend(v26, "initWithWordCount:trailingSilenceDuration:endOfSentenceLikelihood:acousticEndpointerScore:pauseCounts:silencePosterior:clientSilenceFramesCountMs:clientSilenceProbability:silencePosteriorNF:serverFeaturesLatency:eagerResultEndTime:", v27, v28, v33, (uint64_t)v23, v30, v32, v35, v37, v39, v41, v42));

  hybridClassifier = self->_hybridClassifier;
  v46 = 0;
  v44 = -[_EAREndpointer acceptEagerResultWithFeatures:featuresToLog:](hybridClassifier, "acceptEagerResultWithFeatures:featuresToLog:", *(_QWORD *)&v16, &v46);
  v17 = v46;
  v45 = *MEMORY[0x1E0D18F40];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F40], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v50 = "-[CSHybridEndpointer _shouldAcceptEagerResultForDuration:asrFeatures:lastReportedEndpointTimeMs:osdFeatures:re"
          "sultsCompletionHandler:]";
    v51 = 2114;
    v52 = v16;
    v53 = 1026;
    LODWORD(v54) = v44;
    _os_log_impl(&dword_1C2614000, v45, OS_LOG_TYPE_DEFAULT, "%s rcEpFeatures: %{public}@ shouldAccept: %{public}d", buf, 0x1Cu);
  }
  v14[2](v14, v44, v17);
  self->_hasAcceptedEagerResult = v44;
LABEL_11:

}

- (void)logAnchorMachAbsTime:(unint64_t)a3 numSamplesProcessedBeforeAnchorTime:(unint64_t)a4 isAnchorTimeBuffered:(BOOL)a5 audioDeliveryHostTimeDelta:(unint64_t)a6
{
  NSObject *hybridClassifierQueue;
  _QWORD block[8];
  BOOL v8;

  hybridClassifierQueue = self->_hybridClassifierQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __127__CSHybridEndpointer_logAnchorMachAbsTime_numSamplesProcessedBeforeAnchorTime_isAnchorTimeBuffered_audioDeliveryHostTimeDelta___block_invoke;
  block[3] = &unk_1E7C26B58;
  block[4] = self;
  block[5] = a3;
  v8 = a5;
  block[6] = a4;
  block[7] = a6;
  dispatch_async(hybridClassifierQueue, block);
}

- (void)processFirstAudioPacketTimestamp:(id)a3 firstAudioSampleSensorTimestamp:(unint64_t)a4
{
  id v6;
  NSObject *stateSerialQueue;
  id v8;
  _QWORD block[5];
  id v10;
  unint64_t v11;

  v6 = a3;
  stateSerialQueue = self->_stateSerialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __87__CSHybridEndpointer_processFirstAudioPacketTimestamp_firstAudioSampleSensorTimestamp___block_invoke;
  block[3] = &unk_1E7C28B58;
  block[4] = self;
  v10 = v6;
  v11 = a4;
  v8 = v6;
  dispatch_async_and_wait(stateSerialQueue, block);

}

- (void)processOSDFeatures:(id)a3 withFrameDurationMs:(double)a4 withMHID:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  NSObject *hybridClassifierQueue;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  uint64_t v17;
  float v18;
  float v19;
  NSObject *v20;
  NSObject *stateSerialQueue;
  NSObject *v22;
  NSObject *v23;
  _QWORD *v24;
  NSObject *v25;
  uint64_t v26;
  NSObject *v27;
  BOOL v28;
  NSObject *v29;
  _QWORD v30[5];
  id v31;
  uint64_t *v32;
  _QWORD *v33;
  _QWORD *v34;
  _BYTE *v35;
  _QWORD *v36;
  _QWORD *v37;
  _QWORD *v38;
  double v39;
  float v40;
  BOOL v41;
  _QWORD v42[5];
  float v43;
  _QWORD v44[6];
  _QWORD v45[6];
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  char v49;
  _QWORD v50[8];
  float v51;
  _QWORD v52[3];
  char v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  char v57;
  _QWORD v58[4];
  _QWORD v59[9];
  _QWORD v60[3];
  char v61;
  _QWORD v62[4];
  _QWORD v63[4];
  _QWORD block[6];
  uint8_t v65[4];
  const char *v66;
  __int16 v67;
  double v68;
  _BYTE v69[24];
  id v70;
  _BYTE buf[24];
  uint64_t (*v72)(uint64_t, uint64_t);
  void (*v73)(uint64_t);
  id v74;
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  if (self->_recordingDidStop)
  {
    v10 = *MEMORY[0x1E0D18F40];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F40], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "-[CSHybridEndpointer processOSDFeatures:withFrameDurationMs:withMHID:]";
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = "Don't process OSD features";
      _os_log_impl(&dword_1C2614000, v10, OS_LOG_TYPE_DEFAULT, "%s Recording stopped: %s", buf, 0x16u);
    }
  }
  else
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v72 = __Block_byref_object_copy__16879;
    v73 = __Block_byref_object_dispose__16880;
    v74 = 0;
    hybridClassifierQueue = self->_hybridClassifierQueue;
    v12 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __70__CSHybridEndpointer_processOSDFeatures_withFrameDurationMs_withMHID___block_invoke;
    block[3] = &unk_1E7C29228;
    block[5] = buf;
    block[4] = self;
    dispatch_async_and_wait(hybridClassifierQueue, block);
    if (objc_msgSend(v9, "length")
      && (objc_msgSend(v9, "isEqualToString:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40)) & 1) == 0)
    {
      v25 = *MEMORY[0x1E0D18F40];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F40], OS_LOG_TYPE_ERROR))
      {
        v26 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
        *(_DWORD *)v69 = 136315650;
        *(_QWORD *)&v69[4] = "-[CSHybridEndpointer processOSDFeatures:withFrameDurationMs:withMHID:]";
        *(_WORD *)&v69[12] = 2112;
        *(_QWORD *)&v69[14] = v26;
        *(_WORD *)&v69[22] = 2112;
        v70 = v9;
        _os_log_error_impl(&dword_1C2614000, v25, OS_LOG_TYPE_ERROR, "%s MHID mismatch: Endpointer = %@, OSD = %@, don't process OSD features", v69, 0x20u);
      }
    }
    else
    {
      objc_msgSend(v8, "processedAudioMs");
      v14 = v13;
      objc_msgSend(v8, "silenceDurationMs");
      v16 = v15;
      v17 = processOSDFeatures_withFrameDurationMs_withMHID__heartbeat_CORESPEECH_SIL_SCORE_ESTIMATE_AVAILABLE;
      if (__ROR8__(0xEEEEEEEEEEEEEEEFLL* processOSDFeatures_withFrameDurationMs_withMHID__heartbeat_CORESPEECH_SIL_SCORE_ESTIMATE_AVAILABLE, 1) <= 0x888888888888888uLL)
      {
        kdebug_trace();
        v17 = processOSDFeatures_withFrameDurationMs_withMHID__heartbeat_CORESPEECH_SIL_SCORE_ESTIMATE_AVAILABLE;
      }
      processOSDFeatures_withFrameDurationMs_withMHID__heartbeat_CORESPEECH_SIL_SCORE_ESTIMATE_AVAILABLE = v17 + 1;
      v18 = v14;
      v19 = v16;
      *(_QWORD *)v69 = 0;
      *(_QWORD *)&v69[8] = v69;
      *(_QWORD *)&v69[16] = 0x2020000000;
      v70 = 0;
      v63[0] = 0;
      v63[1] = v63;
      v63[2] = 0x2020000000;
      v63[3] = 0;
      v62[0] = 0;
      v62[1] = v62;
      v62[2] = 0x2020000000;
      v62[3] = 0;
      v60[0] = 0;
      v60[1] = v60;
      v60[2] = 0x2020000000;
      v61 = 0;
      v20 = self->_hybridClassifierQueue;
      v59[0] = v12;
      v59[1] = 3221225472;
      v59[2] = __70__CSHybridEndpointer_processOSDFeatures_withFrameDurationMs_withMHID___block_invoke_268;
      v59[3] = &unk_1E7C278C0;
      v59[4] = self;
      v59[5] = v69;
      v59[6] = v63;
      v59[7] = v60;
      v59[8] = v62;
      dispatch_async(v20, v59);
      v58[0] = 0;
      v58[1] = v58;
      v58[2] = 0x2020000000;
      v58[3] = 0;
      v54 = 0;
      v55 = &v54;
      v56 = 0x2020000000;
      v57 = 0;
      v52[0] = 0;
      v52[1] = v52;
      v52[2] = 0x2020000000;
      v53 = 0;
      stateSerialQueue = self->_stateSerialQueue;
      v50[0] = v12;
      v50[1] = 3221225472;
      v50[2] = __70__CSHybridEndpointer_processOSDFeatures_withFrameDurationMs_withMHID___block_invoke_2;
      v50[3] = &unk_1E7C27820;
      v50[4] = self;
      v50[5] = &v54;
      v50[6] = v52;
      v50[7] = v58;
      v51 = v18;
      dispatch_async_and_wait(stateSerialQueue, v50);
      v46 = 0;
      v47 = &v46;
      v48 = 0x2020000000;
      v49 = 0;
      v22 = self->_stateSerialQueue;
      v45[0] = v12;
      v45[1] = 3221225472;
      v45[2] = __70__CSHybridEndpointer_processOSDFeatures_withFrameDurationMs_withMHID___block_invoke_3;
      v45[3] = &unk_1E7C29228;
      v45[4] = self;
      v45[5] = &v46;
      dispatch_async_and_wait(v22, v45);
      if (*((_BYTE *)v47 + 24) && !self->_didDetectSpeech)
      {
        v23 = self->_stateSerialQueue;
        if (v18 <= 300.0 || v19 >= 0.001)
        {
          v42[0] = v12;
          v42[1] = 3221225472;
          v42[2] = __70__CSHybridEndpointer_processOSDFeatures_withFrameDurationMs_withMHID___block_invoke_269;
          v42[3] = &unk_1E7C27848;
          v42[4] = self;
          v43 = v18;
          v24 = v42;
        }
        else
        {
          v44[0] = v12;
          v44[1] = 3221225472;
          v44[2] = __70__CSHybridEndpointer_processOSDFeatures_withFrameDurationMs_withMHID___block_invoke_4;
          v44[3] = &unk_1E7C29228;
          v44[4] = self;
          v44[5] = v58;
          v24 = v44;
        }
        dispatch_async_and_wait(v23, v24);
      }
      if (*((_BYTE *)v55 + 24))
      {
        v27 = *MEMORY[0x1E0D18F40];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F40], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v65 = 136315394;
          v66 = "-[CSHybridEndpointer processOSDFeatures:withFrameDurationMs:withMHID:]";
          v67 = 2050;
          v68 = v19;
          _os_log_impl(&dword_1C2614000, v27, OS_LOG_TYPE_DEFAULT, "%s Already communicated end-pt: Not scheduling work for hybridClassifierQueue for silposnf=%{public}f", v65, 0x16u);
        }
      }
      else
      {
        v28 = -[CSHybridEndpointer _multimodalEndpointerEnabled](self, "_multimodalEndpointerEnabled");
        v29 = self->_hybridClassifierQueue;
        v30[0] = v12;
        v30[1] = 3221225472;
        v30[2] = __70__CSHybridEndpointer_processOSDFeatures_withFrameDurationMs_withMHID___block_invoke_270;
        v30[3] = &unk_1E7C26BF8;
        v30[4] = self;
        v32 = &v54;
        v40 = v16;
        v31 = v8;
        v33 = v58;
        v41 = v28;
        v34 = v52;
        v35 = v69;
        v36 = v63;
        v37 = v60;
        v39 = a4;
        v38 = v62;
        dispatch_async(v29, v30);

      }
      _Block_object_dispose(&v46, 8);
      _Block_object_dispose(v52, 8);
      _Block_object_dispose(&v54, 8);
      _Block_object_dispose(v58, 8);
      _Block_object_dispose(v60, 8);
      _Block_object_dispose(v62, 8);
      _Block_object_dispose(v63, 8);
      _Block_object_dispose(v69, 8);
    }
    _Block_object_dispose(buf, 8);

  }
}

- (void)_generateEndpointerFeaturesWithEffectiveClientProcessedAudioMs:(double)a3 osdFeatures:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void (**v11)(_QWORD, _QWORD, _QWORD, _QWORD);
  double v12;
  os_log_t *v13;
  void *v14;
  CSASRFeatures *lastKnownASRFeatures;
  NSObject *v16;
  uint64_t v17;
  double v18;
  double clientLagThresholdMs;
  _BOOL4 useDefaultASRFeaturesOnClientLag;
  NSObject *v21;
  _BOOL4 v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  float v27;
  double v28;
  float v29;
  double v30;
  float v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  float v38;
  double v39;
  double v40;
  double v41;
  void *v42;
  double v43;
  double v44;
  NSObject *v45;
  id v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  double lastKnownRCFeatureLatency;
  id v53;
  int64_t v54;
  int64_t v55;
  double v56;
  double v57;
  double v58;
  double v59;
  void *v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  void *v70;
  int64_t v71;
  int64_t v72;
  double v73;
  double v74;
  void *v75;
  double v76;
  double v77;
  double v78;
  double clampedASRFeatureLatencyMsForClientLag;
  id v80;
  int64_t v81;
  int64_t v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  double v93;
  void *v94;
  id v95;
  int64_t v96;
  double v97;
  double v98;
  double v99;
  double v100;
  int64_t v101;
  double v102;
  double v103;
  int64_t v104;
  double v105;
  double v106;
  int64_t v107;
  double v108;
  double v109;
  double v110;
  double v111;
  double v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t (*v116)(uint64_t);
  void *v117;
  id v118;
  _QWORD v119[2];
  _QWORD v120[2];
  uint8_t buf[4];
  const char *v122;
  __int16 v123;
  double v124;
  __int16 v125;
  double v126;
  uint64_t v127;

  v127 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  v114 = MEMORY[0x1E0C809B0];
  v115 = 3221225472;
  v116 = __108__CSHybridEndpointer__generateEndpointerFeaturesWithEffectiveClientProcessedAudioMs_osdFeatures_completion___block_invoke;
  v117 = &unk_1E7C26C20;
  v10 = v9;
  v118 = v10;
  v11 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))MEMORY[0x1C3BC4734](&v114);
  v12 = (double)-[CSASRFeatures processedAudioDurationInMilliseconds](self->_lastKnownASRFeatures, "processedAudioDurationInMilliseconds");
  if (v12 <= a3)
  {
    objc_msgSend(v8, "processedAudioMs", v12);
    if (self->_didReceiveASRFeatures)
      v44 = a3
          - (double)-[CSASRFeatures processedAudioDurationInMilliseconds](self->_lastKnownASRFeatures, "processedAudioDurationInMilliseconds");
    else
      v44 = v43;
    if (-[CSHybridEndpointer _useEnhancedEndpointer](self, "_useEnhancedEndpointer"))
    {
      v51 = -[CSASRFeatures processedAudioDurationInMilliseconds](self->_lastKnownRCFeatures, "processedAudioDurationInMilliseconds");
      if (self->_didReceiveRCFeatures)
        lastKnownRCFeatureLatency = self->_lastKnownRCFeatureLatency;
      else
        lastKnownRCFeatureLatency = (double)v51;
      v95 = objc_alloc(MEMORY[0x1E0D190D0]);
      v96 = -[CSASRFeatures trailingSilenceDuration](self->_lastKnownASRFeatures, "trailingSilenceDuration");
      objc_msgSend(v8, "silenceFramesCountMs");
      v98 = v97;
      -[CSASRFeatures eosLikelihood](self->_lastKnownASRFeatures, "eosLikelihood");
      v100 = exp(-v99);
      v101 = -[CSASRFeatures wordCount](self->_lastKnownASRFeatures, "wordCount");
      objc_msgSend(v8, "silenceProbability");
      v103 = v102;
      v104 = -[CSASRFeatures trailingSilenceDuration](self->_lastKnownRCFeatures, "trailingSilenceDuration");
      -[CSASRFeatures eosLikelihood](self->_lastKnownRCFeatures, "eosLikelihood");
      v106 = exp(-v105);
      v107 = -[CSASRFeatures wordCount](self->_lastKnownRCFeatures, "wordCount");
      -[CSASRFeatures silencePosterior](self->_lastKnownASRFeatures, "silencePosterior");
      v109 = v108;
      -[CSASRFeatures acousticEndpointerScore](self->_lastKnownASRFeatures, "acousticEndpointerScore");
      v111 = v110;
      objc_msgSend(v8, "silenceDurationMs");
      *(float *)&v112 = v112;
      LODWORD(v113) = LODWORD(v112);
      v94 = (void *)objc_msgSend(v95, "initWithTrailingSilenceDuration:clientSilenceFramesCount:endOfSentenceLikelihood:wordCount:serverFeaturesLatency:clientSilenceProbability:rcTrailingSilenceDuration:rcEndOfSentenceLikelihood:rcWordCount:rcServerFeaturesLatency:silencePosterior:acousticEndpointerScore:silencePosteriorNF:", v96, v101, v104, v107, v98, v100, v44, v103, v106, lastKnownRCFeatureLatency, v109, v111, v113, v114, v115,
                      v116,
                      v117);
      v42 = 0;
      goto LABEL_26;
    }
    v53 = objc_alloc(MEMORY[0x1E0D1F128]);
    v54 = -[CSASRFeatures wordCount](self->_lastKnownASRFeatures, "wordCount");
    v55 = -[CSASRFeatures trailingSilenceDuration](self->_lastKnownASRFeatures, "trailingSilenceDuration");
    -[CSASRFeatures eosLikelihood](self->_lastKnownASRFeatures, "eosLikelihood");
    v57 = v56;
    -[CSASRFeatures acousticEndpointerScore](self->_lastKnownASRFeatures, "acousticEndpointerScore");
    v59 = v58;
    -[CSASRFeatures pauseCounts](self->_lastKnownASRFeatures, "pauseCounts");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSASRFeatures silencePosterior](self->_lastKnownASRFeatures, "silencePosterior");
    v62 = v61;
    objc_msgSend(v8, "silenceFramesCountMs");
    v64 = v63;
    objc_msgSend(v8, "silenceProbability");
    v66 = v65;
    objc_msgSend(v8, "silenceDurationMs");
    *(float *)&v68 = v67;
    *(float *)&v69 = v44;
    v70 = v53;
    v71 = v54;
    v72 = v55;
    v73 = v57;
    v74 = v59;
    v75 = v60;
    v76 = v62;
    v77 = v64;
    v78 = v66;
    goto LABEL_22;
  }
  v13 = (os_log_t *)MEMORY[0x1E0D18F40];
  v14 = (void *)*MEMORY[0x1E0D18F40];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F40], OS_LOG_TYPE_DEFAULT))
  {
    lastKnownASRFeatures = self->_lastKnownASRFeatures;
    v16 = v14;
    *(double *)&v17 = COERCE_DOUBLE(-[CSASRFeatures processedAudioDurationInMilliseconds](lastKnownASRFeatures, "processedAudioDurationInMilliseconds"));
    *(_DWORD *)buf = 136315650;
    v122 = "-[CSHybridEndpointer _generateEndpointerFeaturesWithEffectiveClientProcessedAudioMs:osdFeatures:completion:]";
    v123 = 2050;
    v124 = *(double *)&v17;
    v125 = 2050;
    v126 = a3;
    _os_log_impl(&dword_1C2614000, v16, OS_LOG_TYPE_DEFAULT, "%s ClientLag: asrProcessedAudioMs(%{public}ld) > effectiveClientProcessedAudioMs(%{public}f)", buf, 0x20u);

  }
  v18 = a3
      - (double)-[CSASRFeatures processedAudioDurationInMilliseconds](self->_lastKnownASRFeatures, "processedAudioDurationInMilliseconds");
  clientLagThresholdMs = self->_clientLagThresholdMs;
  if (v18 <= clientLagThresholdMs)
  {
    useDefaultASRFeaturesOnClientLag = self->_useDefaultASRFeaturesOnClientLag;
    v21 = *v13;
    v22 = os_log_type_enabled(*v13, OS_LOG_TYPE_DEFAULT);
    if (useDefaultASRFeaturesOnClientLag)
    {
      if (v22)
      {
        *(_DWORD *)buf = 136315394;
        v122 = "-[CSHybridEndpointer _generateEndpointerFeaturesWithEffectiveClientProcessedAudioMs:osdFeatures:completion:]";
        v123 = 2050;
        v124 = a3;
        _os_log_impl(&dword_1C2614000, v21, OS_LOG_TYPE_DEFAULT, "%s ClientLag: Using DefaultServerFeatures with disconnected-state sfLatency: %{public}f", buf, 0x16u);
      }
      -[_EAREndpointer defaultServerEndpointFeatures](self->_hybridClassifier, "defaultServerEndpointFeatures");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_alloc(MEMORY[0x1E0D1F128]);
      v25 = objc_msgSend(v23, "wordCount");
      v26 = objc_msgSend(v23, "trailingSilenceDuration");
      objc_msgSend(v23, "endOfSentenceLikelihood");
      v28 = v27;
      objc_msgSend(v23, "acousticEndpointerScore");
      v30 = v29;
      objc_msgSend(v23, "silencePosterior");
      v32 = v31;
      objc_msgSend(v8, "silenceFramesCountMs");
      v34 = v33;
      objc_msgSend(v8, "silenceProbability");
      v36 = v35;
      objc_msgSend(v8, "silenceDurationMs");
      v38 = v37;
      objc_msgSend(v8, "processedAudioMs");
      *(float *)&v40 = v39;
      *(float *)&v41 = v38;
      v42 = (void *)objc_msgSend(v24, "initWithWordCount:trailingSilenceDuration:endOfSentenceLikelihood:acousticEndpointerScore:pauseCounts:silencePosterior:clientSilenceFramesCountMs:clientSilenceProbability:silencePosteriorNF:serverFeaturesLatency:eagerResultEndTime:", v25, v26, MEMORY[0x1E0C9AA60], 0, v28, v30, v32, v34, v36, v41, v40);

      goto LABEL_23;
    }
    if (v22)
    {
      clampedASRFeatureLatencyMsForClientLag = self->_clampedASRFeatureLatencyMsForClientLag;
      *(_DWORD *)buf = 136315394;
      v122 = "-[CSHybridEndpointer _generateEndpointerFeaturesWithEffectiveClientProcessedAudioMs:osdFeatures:completion:]";
      v123 = 2050;
      v124 = clampedASRFeatureLatencyMsForClientLag;
      _os_log_impl(&dword_1C2614000, v21, OS_LOG_TYPE_DEFAULT, "%s ClientLag: Using ServerFeatures with ClampedSFLatency: %{public}f", buf, 0x16u);
    }
    v80 = objc_alloc(MEMORY[0x1E0D1F128]);
    v81 = -[CSASRFeatures wordCount](self->_lastKnownASRFeatures, "wordCount");
    v82 = -[CSASRFeatures trailingSilenceDuration](self->_lastKnownASRFeatures, "trailingSilenceDuration");
    -[CSASRFeatures eosLikelihood](self->_lastKnownASRFeatures, "eosLikelihood");
    v84 = v83;
    -[CSASRFeatures acousticEndpointerScore](self->_lastKnownASRFeatures, "acousticEndpointerScore");
    v86 = v85;
    -[CSASRFeatures pauseCounts](self->_lastKnownASRFeatures, "pauseCounts");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSASRFeatures silencePosterior](self->_lastKnownASRFeatures, "silencePosterior");
    v88 = v87;
    objc_msgSend(v8, "silenceFramesCountMs");
    v90 = v89;
    objc_msgSend(v8, "silenceProbability");
    v92 = v91;
    objc_msgSend(v8, "silenceDurationMs");
    *(float *)&v68 = v93;
    *(float *)&v69 = self->_clampedASRFeatureLatencyMsForClientLag;
    v70 = v80;
    v71 = v81;
    v72 = v82;
    v73 = v84;
    v74 = v86;
    v75 = v60;
    v76 = v88;
    v77 = v90;
    v78 = v92;
LABEL_22:
    v42 = (void *)objc_msgSend(v70, "initWithWordCount:trailingSilenceDuration:endOfSentenceLikelihood:acousticEndpointerScore:pauseCounts:silencePosterior:clientSilenceFramesCountMs:clientSilenceProbability:silencePosteriorNF:serverFeaturesLatency:eagerResultEndTime:", v71, v72, v75, 0, v73, v74, v76, v77, v78, v68, v69);

LABEL_23:
    v94 = 0;
LABEL_26:
    ((void (**)(_QWORD, _QWORD, void *, void *))v11)[2](v11, 0, v42, v94);

    goto LABEL_27;
  }
  v45 = *v13;
  if (os_log_type_enabled(*v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v122 = "-[CSHybridEndpointer _generateEndpointerFeaturesWithEffectiveClientProcessedAudioMs:osdFeatures:completion:]";
    v123 = 2050;
    v124 = v18;
    v125 = 2050;
    v126 = clientLagThresholdMs;
    _os_log_impl(&dword_1C2614000, v45, OS_LOG_TYPE_DEFAULT, "%s ClientLag: Not invoking HybridClassifier: sfLatency > clientLagThreshold: %{public}f > %{public}f", buf, 0x20u);
  }
  v46 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v47 = *MEMORY[0x1E0D18E80];
  v119[0] = CFSTR("sfLatency");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v18);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v119[1] = CFSTR("clientLagThreshold");
  v120[0] = v48;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_clientLagThresholdMs);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v120[1] = v49;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v120, v119, 2);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = (void *)objc_msgSend(v46, "initWithDomain:code:userInfo:", v47, 2302, v50);

  ((void (**)(_QWORD, void *, _QWORD, _QWORD))v11)[2](v11, v42, 0, 0);
LABEL_27:

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
  v7[2] = __30__CSHybridEndpointer_setMhId___block_invoke;
  v7[3] = &unk_1E7C292A0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(hybridClassifierQueue, v7);

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
  block[2] = __50__CSHybridEndpointer_logFeaturesWithEvent_locale___block_invoke;
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
  CSHybridEndpointer *v9;

  v4 = a3;
  stateSerialQueue = self->_stateSerialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__CSHybridEndpointer_handleVoiceTriggerWithActivationInfo___block_invoke;
  block[3] = &unk_1E7C292A0;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async_and_wait(stateSerialQueue, block);

}

- (void)terminateProcessing
{
  NSObject *v3;
  NSObject *hybridClassifierQueue;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0D18F40];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F40], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v7 = "-[CSHybridEndpointer terminateProcessing]";
    _os_log_impl(&dword_1C2614000, v3, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  self->_recordingDidStop = 1;
  hybridClassifierQueue = self->_hybridClassifierQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__CSHybridEndpointer_terminateProcessing__block_invoke;
  block[3] = &unk_1E7C292C8;
  block[4] = self;
  dispatch_async(hybridClassifierQueue, block);
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
  v5 = *MEMORY[0x1E0D18F40];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F40], OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315394;
    v7 = "-[CSHybridEndpointer recordingStoppedForReason:]";
    v8 = 2050;
    v9 = a3;
    _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_DEFAULT, "%s CSHybridEndpointer recordingStoppedForReason: %{public}ld", (uint8_t *)&v6, 0x16u);
  }
  -[CSHybridEndpointer terminateProcessing](self, "terminateProcessing");
}

- (void)stopEndpointer
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
    v5 = "-[CSHybridEndpointer stopEndpointer]";
    _os_log_impl(&dword_1C2614000, v3, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v4, 0xCu);
  }
  -[CSHybridEndpointer terminateProcessing](self, "terminateProcessing");
}

- (void)resetForNewRequestWithSampleRate:(unint64_t)a3 recordContext:(id)a4 disableRCSelection:(BOOL)a5
{
  _BOOL4 v5;
  uint64_t (*v8)(uint64_t, uint64_t);
  id *v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *stateSerialQueue;
  uint64_t (*v13)(uint64_t, uint64_t);
  NSObject *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  NSObject *hybridClassifierQueue;
  NSObject *asrFeaturesQueue;
  NSObject *v21;
  _QWORD v22[6];
  _QWORD v23[6];
  _QWORD v24[8];
  BOOL v25;
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

  v5 = a5;
  v37 = *MEMORY[0x1E0C80C00];
  v8 = (uint64_t (*)(uint64_t, uint64_t))a4;
  self->_recordingDidStop = 0;
  v9 = (id *)MEMORY[0x1E0D18F40];
  v10 = *MEMORY[0x1E0D18F40];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F40], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    *(_QWORD *)&buf[4] = "-[CSHybridEndpointer resetForNewRequestWithSampleRate:recordContext:disableRCSelection:]";
    *(_WORD *)&buf[12] = 2050;
    *(_QWORD *)&buf[14] = a3;
    *(_WORD *)&buf[22] = 2114;
    v34 = v8;
    LOWORD(v35) = 1024;
    *(_DWORD *)((char *)&v35 + 2) = v5;
    _os_log_impl(&dword_1C2614000, v10, OS_LOG_TYPE_DEFAULT, "%s sampleRate=%{public}lu, recordContext=%{public}@, disableRCSelection=%d", buf, 0x26u);
  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v34 = __Block_byref_object_copy__16879;
  v35 = __Block_byref_object_dispose__16880;
  v36 = 0;
  v11 = MEMORY[0x1E0C809B0];
  stateSerialQueue = self->_stateSerialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __88__CSHybridEndpointer_resetForNewRequestWithSampleRate_recordContext_disableRCSelection___block_invoke;
  block[3] = &unk_1E7C277D0;
  block[4] = self;
  v13 = v8;
  v27 = v13;
  v28 = buf;
  dispatch_async_and_wait(stateSerialQueue, block);
  v14 = *MEMORY[0x1E0D18F30];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F30], OS_LOG_TYPE_DEFAULT))
  {
    v15 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
    *(_DWORD *)v29 = 136315394;
    *(_QWORD *)&v29[4] = "-[CSHybridEndpointer resetForNewRequestWithSampleRate:recordContext:disableRCSelection:]";
    *(_WORD *)&v29[12] = 2114;
    *(_QWORD *)&v29[14] = v15;
    _os_log_impl(&dword_1C2614000, v14, OS_LOG_TYPE_DEFAULT, "KeyLog - %s CSEndpointAsset exists: %{public}@", v29, 0x16u);
  }
  if (!*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
  {
    v16 = *v9;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      +[CSAssetManager sharedManager](CSAssetManager, "sharedManager");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "currentLanguageCode");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v29 = 136315394;
      *(_QWORD *)&v29[4] = "-[CSHybridEndpointer resetForNewRequestWithSampleRate:recordContext:disableRCSelection:]";
      *(_WORD *)&v29[12] = 2114;
      *(_QWORD *)&v29[14] = v18;
      _os_log_impl(&dword_1C2614000, v16, OS_LOG_TYPE_DEFAULT, "KeyLog - %s No asset for CSHybridEndpointer for currentLanguage: %{public}@. Fallback to NNVAD", v29, 0x16u);

    }
  }
  *(_QWORD *)v29 = 0;
  *(_QWORD *)&v29[8] = v29;
  *(_QWORD *)&v29[16] = 0x3032000000;
  v30 = __Block_byref_object_copy__16879;
  v31 = __Block_byref_object_dispose__16880;
  v32 = 0;
  hybridClassifierQueue = self->_hybridClassifierQueue;
  v24[0] = v11;
  v24[1] = 3221225472;
  v24[2] = __88__CSHybridEndpointer_resetForNewRequestWithSampleRate_recordContext_disableRCSelection___block_invoke_316;
  v24[3] = &unk_1E7C26C70;
  v25 = v5;
  v24[4] = self;
  v24[5] = buf;
  v24[6] = v29;
  v24[7] = a3;
  dispatch_async_and_wait(hybridClassifierQueue, v24);
  asrFeaturesQueue = self->_asrFeaturesQueue;
  v23[0] = v11;
  v23[1] = 3221225472;
  v23[2] = __88__CSHybridEndpointer_resetForNewRequestWithSampleRate_recordContext_disableRCSelection___block_invoke_322;
  v23[3] = &unk_1E7C29228;
  v23[4] = self;
  v23[5] = v29;
  dispatch_async_and_wait(asrFeaturesQueue, v23);
  v21 = self->_stateSerialQueue;
  v22[0] = v11;
  v22[1] = 3221225472;
  v22[2] = __88__CSHybridEndpointer_resetForNewRequestWithSampleRate_recordContext_disableRCSelection___block_invoke_2;
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
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateSerialQueue);
  asrFeaturesQueue = self->_asrFeaturesQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __50__CSHybridEndpointer__readParametersFromHEPAsset___block_invoke;
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
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CSHybridEndpointer.m"), 1458, CFSTR("CSHybridEndpointer reset called"));

}

- (double)lastEndOfVoiceActivityTime
{
  return 0.0;
}

- (double)lastStartOfVoiceActivityTime
{
  return 0.0;
}

- (void)endpointerAssetManagerDidUpdateAsset:(id)a3
{
  id v4;
  NSObject *stateSerialQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  stateSerialQueue = self->_stateSerialQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __59__CSHybridEndpointer_endpointerAssetManagerDidUpdateAsset___block_invoke;
  v7[3] = &unk_1E7C292A0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(stateSerialQueue, v7);

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
        v11 = *MEMORY[0x1E0D18F40];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F40], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          v18 = "-[CSHybridEndpointer _getCSHybridEndpointerConfigForAsset:]";
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
      v14 = *MEMORY[0x1E0D18F40];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F40], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v18 = "-[CSHybridEndpointer _getCSHybridEndpointerConfigForAsset:]";
        v19 = 2114;
        v20 = v6;
        _os_log_impl(&dword_1C2614000, v14, OS_LOG_TYPE_DEFAULT, "%s Could not read: %{public}@", buf, 0x16u);
      }
      v12 = 0;
    }

  }
  else
  {
    v13 = *MEMORY[0x1E0D18F40];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F40], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v18 = "-[CSHybridEndpointer _getCSHybridEndpointerConfigForAsset:]";
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

- (BOOL)_useEnhancedEndpointer
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_hybridClassifierQueue);
  return self->_enhancedEndpointer != 0;
}

- (void)processRCFeatures:(id)a3
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
  v7[2] = __40__CSHybridEndpointer_processRCFeatures___block_invoke;
  v7[3] = &unk_1E7C292A0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(hybridClassifierQueue, v7);

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

- (CSASRFeatures)lastKnownRCFeatures
{
  return self->_lastKnownRCFeatures;
}

- (void)setLastKnownRCFeatures:(id)a3
{
  objc_storeStrong((id *)&self->_lastKnownRCFeatures, a3);
}

- (NSMutableArray)asrFeaturesLatencies
{
  return self->_asrFeaturesLatencies;
}

- (void)setAsrFeaturesLatencies:(id)a3
{
  objc_storeStrong((id *)&self->_asrFeaturesLatencies, a3);
}

- (double)lastKnownASRFeatureLatency
{
  return self->_lastKnownASRFeatureLatency;
}

- (void)setLastKnownASRFeatureLatency:(double)a3
{
  self->_lastKnownASRFeatureLatency = a3;
}

- (double)lastKnownRCFeatureLatency
{
  return self->_lastKnownRCFeatureLatency;
}

- (void)setLastKnownRCFeatureLatency:(double)a3
{
  self->_lastKnownRCFeatureLatency = a3;
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

- (unint64_t)extraDelayFrequency
{
  return self->_extraDelayFrequency;
}

- (void)setExtraDelayFrequency:(unint64_t)a3
{
  self->_extraDelayFrequency = a3;
}

- (NSDictionary)taskThresholdMap
{
  return self->_taskThresholdMap;
}

- (void)setTaskThresholdMap:(id)a3
{
  objc_storeStrong((id *)&self->_taskThresholdMap, a3);
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

- (unint64_t)audioDeliveryHostTimeDelta
{
  return self->_audioDeliveryHostTimeDelta;
}

- (void)setAudioDeliveryHostTimeDelta:(unint64_t)a3
{
  self->_audioDeliveryHostTimeDelta = a3;
}

- (BOOL)isASRFeatureFromServer
{
  return self->_isASRFeatureFromServer;
}

- (void)setIsASRFeatureFromServer:(BOOL)a3
{
  self->_isASRFeatureFromServer = a3;
}

- (BOOL)recordingDidStop
{
  return self->_recordingDidStop;
}

- (void)setRecordingDidStop:(BOOL)a3
{
  self->_recordingDidStop = a3;
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

- (int64_t)endpointerOperationMode
{
  return self->_endpointerOperationMode;
}

- (CSEnhancedEndpointer)enhancedEndpointer
{
  return self->_enhancedEndpointer;
}

- (void)setEnhancedEndpointer:(id)a3
{
  objc_storeStrong((id *)&self->_enhancedEndpointer, a3);
}

- (NSDictionary)taskEnhancedEndpointerMap
{
  return self->_taskEnhancedEndpointerMap;
}

- (void)setTaskEnhancedEndpointerMap:(id)a3
{
  objc_storeStrong((id *)&self->_taskEnhancedEndpointerMap, a3);
}

- (BOOL)enhancedEndpointerDefaultResult
{
  return self->_enhancedEndpointerDefaultResult;
}

- (void)setEnhancedEndpointerDefaultResult:(BOOL)a3
{
  self->_enhancedEndpointerDefaultResult = a3;
}

- (BOOL)didReceiveRCFeatures
{
  return self->_didReceiveRCFeatures;
}

- (void)setDidReceiveRCFeatures:(BOOL)a3
{
  self->_didReceiveRCFeatures = a3;
}

- (NSDictionary)enhancedEndpointerTaskThresholdMap
{
  return self->_enhancedEndpointerTaskThresholdMap;
}

- (void)setEnhancedEndpointerTaskThresholdMap:(id)a3
{
  objc_storeStrong((id *)&self->_enhancedEndpointerTaskThresholdMap, a3);
}

- (BOOL)hasAcceptedEagerResult
{
  return self->_hasAcceptedEagerResult;
}

- (void)setHasAcceptedEagerResult:(BOOL)a3
{
  self->_hasAcceptedEagerResult = a3;
}

- (BOOL)disableRCSelection
{
  return self->_disableRCSelection;
}

- (void)setDisableRCSelection:(BOOL)a3
{
  self->_disableRCSelection = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enhancedEndpointerTaskThresholdMap, 0);
  objc_storeStrong((id *)&self->_taskEnhancedEndpointerMap, 0);
  objc_storeStrong((id *)&self->_enhancedEndpointer, 0);
  objc_storeStrong((id *)&self->_firstAudioPacketTimestamp, 0);
  objc_storeStrong((id *)&self->_recordContext, 0);
  objc_storeStrong((id *)&self->_stateSerialQueue, 0);
  objc_storeStrong((id *)&self->_hybridClassifierQueue, 0);
  objc_storeStrong((id *)&self->_taskThresholdMap, 0);
  objc_storeStrong((id *)&self->_lastASRFeatureTimestamp, 0);
  objc_storeStrong((id *)&self->_asrFeaturesLatencies, 0);
  objc_storeStrong((id *)&self->_lastKnownRCFeatures, 0);
  objc_storeStrong((id *)&self->_lastKnownOSDFeatures, 0);
  objc_storeStrong((id *)&self->_lastKnownASRFeatures, 0);
  objc_storeStrong((id *)&self->_asrFeaturesQueue, 0);
  objc_storeStrong((id *)&self->_endpointerModelVersion, 0);
  objc_storeStrong((id *)&self->_hybridClassifier, 0);
  objc_storeStrong((id *)&self->_osdFeaturesAtEndpoint, 0);
  objc_storeStrong((id *)&self->_currentAsset, 0);
  objc_storeStrong((id *)&self->_mhId, 0);
  objc_destroyWeak((id *)&self->_implDelegate);
  objc_destroyWeak((id *)&self->_delegate);
}

uint64_t __40__CSHybridEndpointer_processRCFeatures___block_invoke(uint64_t a1)
{
  uint64_t result;
  NSObject *v3;
  uint64_t v4;
  double v5;
  int v6;
  const char *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  result = objc_msgSend(*(id *)(a1 + 32), "_useEnhancedEndpointer");
  if ((_DWORD)result)
  {
    v3 = *MEMORY[0x1E0D18F40];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F40], OS_LOG_TYPE_INFO))
    {
      v4 = *(_QWORD *)(a1 + 40);
      v6 = 136315394;
      v7 = "-[CSHybridEndpointer processRCFeatures:]_block_invoke";
      v8 = 2114;
      v9 = v4;
      _os_log_impl(&dword_1C2614000, v3, OS_LOG_TYPE_INFO, "%s EnhancedEndpointer - CSASRFeatures: %{public}@", (uint8_t *)&v6, 0x16u);
    }
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 23) = 1;
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 176), *(id *)(a1 + 40));
    v5 = *(double *)(*(_QWORD *)(a1 + 32) + 272);
    result = objc_msgSend(*(id *)(a1 + 40), "processedAudioDurationInMilliseconds");
    *(double *)(*(_QWORD *)(a1 + 32) + 200) = -((double)result - v5 * 1000.0);
  }
  return result;
}

uint64_t __59__CSHybridEndpointer_endpointerAssetManagerDidUpdateAsset___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateCurrentAsset:", *(_QWORD *)(a1 + 40));
}

void __50__CSHybridEndpointer__readParametersFromHEPAsset___block_invoke(uint64_t a1)
{
  void *v2;
  os_log_t *v3;
  NSObject *v4;
  void *v5;
  float v6;
  void *v7;
  float v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  const char *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  int v37;
  __int16 v38;
  uint64_t v39;
  __int16 v40;
  uint64_t v41;
  __int16 v42;
  uint64_t v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_getCSHybridEndpointerConfigForAsset:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (os_log_t *)MEMORY[0x1E0D18F40];
  v4 = *MEMORY[0x1E0D18F40];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F40], OS_LOG_TYPE_DEFAULT))
  {
    v30 = 136315394;
    v31 = "-[CSHybridEndpointer _readParametersFromHEPAsset:]_block_invoke";
    v32 = 2114;
    v33 = v2;
    _os_log_impl(&dword_1C2614000, v4, OS_LOG_TYPE_DEFAULT, "%s csHepConfig: %{public}@", (uint8_t *)&v30, 0x16u);
  }
  if (v2)
  {
    objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("ClientLagThresholdMsKey"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "floatValue");
    *(double *)(*(_QWORD *)(a1 + 32) + 224) = v6;

    objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("ClampedSFLatencyMsForClientLag"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "floatValue");
    *(double *)(*(_QWORD *)(a1 + 32) + 232) = v8;

    objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("UseDefaultServerFeaturesOnClientLag"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 12) = objc_msgSend(v9, "BOOLValue");

    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 240) = 1000;
    objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("extra-delay-frequency"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("extra-delay-frequency"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 240) = objc_msgSend(v11, "unsignedIntValue");

    }
    v12 = *(_QWORD *)(a1 + 32);
    v13 = *(void **)(v12 + 248);
    *(_QWORD *)(v12 + 248) = 0;

    objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("endpoint-threshold"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("endpoint-threshold"));
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = *(_QWORD *)(a1 + 32);
      v17 = *(void **)(v16 + 248);
      *(_QWORD *)(v16 + 248) = v15;

    }
    objc_msgSend(v2, "objectForKey:", CFSTR("enhanced-endpointer-thresholds"));
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = *(_QWORD *)(a1 + 32);
    v20 = *(void **)(v19 + 408);
    *(_QWORD *)(v19 + 408) = v18;
  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 224) = 0xC0F5F90000000000;
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 232) = 0;
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 12) = 1;
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 240) = 1000;
    v21 = *(_QWORD *)(a1 + 32);
    v20 = *(void **)(v21 + 248);
    *(_QWORD *)(v21 + 248) = 0;
  }

  v22 = *v3;
  if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
  {
    v23 = *(_QWORD *)(a1 + 32);
    v24 = *(void **)(v23 + 224);
    v25 = *(_QWORD *)(v23 + 232);
    v26 = *(unsigned __int8 *)(v23 + 12);
    v27 = *(_QWORD *)(v23 + 240);
    v28 = *(_QWORD *)(v23 + 248);
    v29 = *(_QWORD *)(v23 + 408);
    v30 = 136316674;
    v31 = "-[CSHybridEndpointer _readParametersFromHEPAsset:]_block_invoke";
    v32 = 2050;
    v33 = v24;
    v34 = 2050;
    v35 = v25;
    v36 = 1026;
    v37 = v26;
    v38 = 2050;
    v39 = v27;
    v40 = 2114;
    v41 = v28;
    v42 = 2114;
    v43 = v29;
    _os_log_impl(&dword_1C2614000, v22, OS_LOG_TYPE_DEFAULT, "%s _clientHepConfig: %{public}f, _clampedASRFeatureLatencyMsForClientLag: %{public}f, _useDefaultASRFeaturesOnClientLag: %{public}d, _extraDelayFrequency: %{public}lu, _taskThresholdMap: %{public}@, _enhancedEndpointerTaskThresholdMap: %{public}@", (uint8_t *)&v30, 0x44u);
  }

}

void __88__CSHybridEndpointer_resetForNewRequestWithSampleRate_recordContext_disableRCSelection___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 328);
  *(_QWORD *)(v3 + 328) = v2;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 120));
}

void __88__CSHybridEndpointer_resetForNewRequestWithSampleRate_recordContext_disableRCSelection___block_invoke_316(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  os_log_t *v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  int v16;
  NSObject *v17;
  void *v18;
  void *v19;
  int v20;
  int v21;
  void *v22;
  int v23;
  int v24;
  void *v25;
  double v26;
  void *v27;
  void *v28;
  int v29;
  int v30;
  void *v31;
  double v32;
  void *v33;
  void *v34;
  int v35;
  int v36;
  void *v37;
  void *v38;
  void *v39;
  int v40;
  int v41;
  void *v42;
  id v43;
  uint64_t v44;
  NSObject *v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  int v58;
  os_log_t v59;
  uint64_t v60;
  const __CFString *v61;
  int v62;
  uint64_t v63;
  NSObject *v64;
  void *v65;
  void *v66;
  uint64_t v67;
  NSObject *v68;
  _BOOL4 v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  void (*v73)(uint64_t, void *, void *);
  void *v74;
  id v75;
  uint64_t v76;
  uint64_t v77;
  int v78;
  int v79;
  int v80;
  int v81;
  int v82;
  int v83;
  int v84;
  id v85;
  uint8_t buf[4];
  const char *v87;
  __int16 v88;
  const __CFString *v89;
  __int16 v90;
  int v91;
  __int16 v92;
  uint64_t v93;
  __int16 v94;
  void *v95;
  __int16 v96;
  uint64_t v97;
  uint64_t v98;

  v98 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 272) = 0;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 264) = 0;
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 28) = 0;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 352) = 0;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 360) = 0;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 17) = 0;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 368) = 0;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 18) = 0;
  v2 = objc_msgSend(objc_alloc(MEMORY[0x1E0DA8D38]), "initWithSilenceFramesCountMs:silenceProbability:silenceDurationMs:processedAudioMs:", 0.0, 0.0, 0.0, 0.0);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 128);
  *(_QWORD *)(v3 + 128) = v2;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 168), *(id *)(*(_QWORD *)(a1 + 32) + 128));
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 14) = 0;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 24) = 0;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 25) = *(_BYTE *)(a1 + 64);
  v5 = (os_log_t *)MEMORY[0x1E0D18F40];
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    kdebug_trace();
    v6 = objc_alloc(MEMORY[0x1E0D1F130]);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "path");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v85 = 0;
    v8 = objc_msgSend(v6, "initWithConfiguration:modelVersion:", v7, &v85);
    v9 = v85;
    v10 = v85;
    v11 = *(_QWORD *)(a1 + 32);
    v12 = *(void **)(v11 + 136);
    *(_QWORD *)(v11 + 136) = v8;

    kdebug_trace();
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 144), v9);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "defaultServerEndpointFeatures");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v15 = *(void **)(v14 + 40);
    *(_QWORD *)(v14 + 40) = v13;

    v16 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "getBoolForKey:category:default:", CFSTR("is-enhanced-endpointer-enabled"), CFSTR("enhanced-endpointer"), 0);
    if (v16)
    {
      v17 = *v5;
      if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v87 = "-[CSHybridEndpointer resetForNewRequestWithSampleRate:recordContext:disableRCSelection:]_block_invoke";
        _os_log_impl(&dword_1C2614000, v17, OS_LOG_TYPE_DEFAULT, "%s Using enhanced endpointer", buf, 0xCu);
      }
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "getNumberForKey:category:default:", CFSTR("default-threshold-partial"), CFSTR("enhanced-endpointer"), &unk_1E7C63F30);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "floatValue");
      v21 = v20;

      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "getNumberForKey:category:default:", CFSTR("default-threshold-rc"), CFSTR("enhanced-endpointer"), &unk_1E7C63F30);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "floatValue");
      v24 = v23;

      v25 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
      LODWORD(v26) = v21;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "getNumberForKey:category:default:", CFSTR("relaxed-threshold-partial"), CFSTR("enhanced-endpointer"), v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "floatValue");
      v30 = v29;

      v31 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
      LODWORD(v32) = v24;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "getNumberForKey:category:default:", CFSTR("relaxed-threshold-rc"), CFSTR("enhanced-endpointer"), v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "floatValue");
      v36 = v35;

      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "getNumberForKey:category:default:", CFSTR("extra-delay-ms"), CFSTR("enhanced-endpointer"), &unk_1E7C63BC0);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v34) = objc_msgSend(v37, "intValue");

      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "getNumberForKey:category:default:", CFSTR("continuity-window-duration"), CFSTR("enhanced-endpointer"), &unk_1E7C63BC0);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v37) = objc_msgSend(v38, "intValue");

      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "getNumberForKey:category:default:", CFSTR("speech-detected-threshold"), CFSTR("enhanced-endpointer"), &unk_1E7C63F30);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "floatValue");
      v41 = v40;

      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "getValueForKey:category:", CFSTR("model-files"), CFSTR("enhanced-endpointer"));
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v71 = MEMORY[0x1E0C809B0];
      v72 = 3221225472;
      v73 = __88__CSHybridEndpointer_resetForNewRequestWithSampleRate_recordContext_disableRCSelection___block_invoke_319;
      v74 = &unk_1E7C26C48;
      v77 = *(_QWORD *)(a1 + 40);
      v78 = v21;
      v79 = v24;
      v80 = v30;
      v81 = v36;
      v82 = (int)v34;
      v83 = (int)v37;
      v84 = v41;
      v43 = v18;
      v44 = *(_QWORD *)(a1 + 32);
      v75 = v43;
      v76 = v44;
      objc_msgSend(v42, "enumerateKeysAndObjectsUsingBlock:", &v71);
      if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 392))
      {
        v45 = *v5;
        if (os_log_type_enabled(*v5, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 136315394;
          v87 = "-[CSHybridEndpointer resetForNewRequestWithSampleRate:recordContext:disableRCSelection:]_block_invoke";
          v88 = 2114;
          v89 = CFSTR("SearchOrMessaging");
          _os_log_fault_impl(&dword_1C2614000, v45, OS_LOG_TYPE_FAULT, "%s Unable to find endpointer model for default task type %{public}@", buf, 0x16u);
        }
      }
      v46 = objc_msgSend(v43, "copy", v71, v72, v73, v74);
      v47 = *(_QWORD *)(a1 + 32);
      v48 = *(void **)(v47 + 400);
      *(_QWORD *)(v47 + 400) = v46;

    }
  }
  else
  {
    v49 = *(_QWORD *)(a1 + 32);
    v50 = *(void **)(v49 + 136);
    *(_QWORD *)(v49 + 136) = 0;

    v51 = *(_QWORD *)(a1 + 32);
    v52 = *(void **)(v51 + 144);
    *(_QWORD *)(v51 + 144) = 0;

    v53 = *(_QWORD *)(a1 + 32);
    v54 = *(void **)(v53 + 392);
    *(_QWORD *)(v53 + 392) = 0;

    v55 = *(_QWORD *)(a1 + 32);
    v56 = *(void **)(v55 + 400);
    *(_QWORD *)(v55 + 400) = 0;

    v16 = 0;
  }
  if ((objc_msgSend(MEMORY[0x1E0D19260], "supportHybridEndpointer") & 1) != 0)
  {
    v57 = *(_QWORD *)(a1 + 32);
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
    {
      v58 = objc_msgSend(*(id *)(v57 + 136), "requestSupportedWithSamplingRate:", *(_QWORD *)(a1 + 56));
      v57 = *(_QWORD *)(a1 + 32);
      if ((v16 & v58) == 1)
        LOBYTE(v58) = *(_QWORD *)(v57 + 392) != 0;
    }
    else
    {
      LOBYTE(v58) = 0;
    }
  }
  else
  {
    LOBYTE(v58) = 0;
    v57 = *(_QWORD *)(a1 + 32);
  }
  *(_BYTE *)(v57 + 9) = v58;
  v59 = *v5;
  if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
  {
    v60 = *(_QWORD *)(a1 + 32);
    v61 = *(const __CFString **)(v60 + 136);
    v62 = *(unsigned __int8 *)(v60 + 9);
    v63 = *(_QWORD *)(a1 + 56);
    v64 = v59;
    +[CSAssetManager sharedManager](CSAssetManager, "sharedManager");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "currentLanguageCode");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 144);
    *(_DWORD *)buf = 136316418;
    v87 = "-[CSHybridEndpointer resetForNewRequestWithSampleRate:recordContext:disableRCSelection:]_block_invoke";
    v88 = 2114;
    v89 = v61;
    v90 = 1026;
    v91 = v62;
    v92 = 2050;
    v93 = v63;
    v94 = 2114;
    v95 = v66;
    v96 = 2114;
    v97 = v67;
    _os_log_impl(&dword_1C2614000, v64, OS_LOG_TYPE_DEFAULT, "KeyLog - %s Created HybridClassifier(%{public}@); canProcessCurrentRequest after reset: %{public}d,for sampleRate:"
      " %{public}lu, lang=%{public}@, version=%{public}@",
      buf,
      0x3Au);

  }
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 9))
  {
    v68 = *v5;
    v69 = os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT);
    if (v16)
    {
      if (!v69)
        return;
      *(_DWORD *)buf = 136315138;
      v87 = "-[CSHybridEndpointer resetForNewRequestWithSampleRate:recordContext:disableRCSelection:]_block_invoke";
      v70 = "%s Legend - EEP Features: [trailingSilenceDuration (ASR), clientSilenceFramesCount (SPG), endOfSentenceLikel"
            "ihood (ASR), wordCount (ASR), serverFeaturesLatency, clientSilenceProbability (SPG), rcTrailingSilenceDurati"
            "on (ASR), rcEndOfSentenceLikelihood (ASR), rcWordCount (ASR), rcServerFeaturesLatency (ASR), silencePosterio"
            "r (ASR), acousticEndpointerScore (ASR), silencePosteriorNF (ASR)] @ effectiveClientProcessedAudioMs, Scores:"
            " [Partial, RC], Results: [Overall Decision, Default Decision, Relaxed Decision, Endpoint Posterior]";
    }
    else
    {
      if (!v69)
        return;
      *(_DWORD *)buf = 136315138;
      v87 = "-[CSHybridEndpointer resetForNewRequestWithSampleRate:recordContext:disableRCSelection:]_block_invoke";
      v70 = "%s HEP.logs.hdr: [ServerASR_trailingSilenceDuration,ClientSPG_SilenceFramesCountMs,ServerASR_endOfSentenceLi"
            "kelihood,ServerASR_wordCount,ServerFeaturesLatency,ClientSPG_SilenceProbabilityHMMFiltered] & [ServerASR_pau"
            "seCounts,ServerASR_silencePosterior,ClientSPG_silenceProbailitySPGRaw] @ effectiveClientProcessedAudioMs : ["
            "HEPPosteriorOut,HEPDecision]";
    }
    _os_log_impl(&dword_1C2614000, v68, OS_LOG_TYPE_DEFAULT, v70, buf, 0xCu);
  }
}

void __88__CSHybridEndpointer_resetForNewRequestWithSampleRate_recordContext_disableRCSelection___block_invoke_322(uint64_t a1)
{
  CSASRFeatures *v2;
  uint64_t v3;
  uint64_t v4;
  float v5;
  double v6;
  float v7;
  double v8;
  float v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    v2 = [CSASRFeatures alloc];
    v3 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "wordCount");
    v4 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "trailingSilenceDuration");
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "endOfSentenceLikelihood");
    v6 = v5;
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "silencePosterior");
    v8 = v7;
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "acousticEndpointerScore");
    v10 = -[CSASRFeatures initWithWordCount:trailingSilenceDuration:eosLikelihood:pauseCounts:silencePosterior:taskName:processedAudioDurationInMilliseconds:acousticEndpointerScore:](v2, "initWithWordCount:trailingSilenceDuration:eosLikelihood:pauseCounts:silencePosterior:taskName:processedAudioDurationInMilliseconds:acousticEndpointerScore:", v3, v4, MEMORY[0x1E0C9AA60], CFSTR("SearchOrMessaging"), 0, v6, v8, v9);
  }
  else
  {
    +[CSASRFeatures initialASRFeatures](CSASRFeatures, "initialASRFeatures");
    v10 = objc_claimAutoreleasedReturnValue();
  }
  v11 = *(_QWORD *)(a1 + 32);
  v12 = *(void **)(v11 + 160);
  *(_QWORD *)(v11 + 160) = v10;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = *(_QWORD *)(a1 + 32);
  v15 = *(void **)(v14 + 216);
  *(_QWORD *)(v14 + 216) = v13;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = *(_QWORD *)(a1 + 32);
  v18 = *(void **)(v17 + 184);
  *(_QWORD *)(v17 + 184) = v16;

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 208) = 0xFFF0000000000000;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 192) = 0xBF847AE147AE147BLL;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 200) = 0xBF847AE147AE147BLL;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 10) = 0;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 11) = 0;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 23) = 0;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 19) = 1;
  +[CSASRFeatures initialResultCandidateFeatures](CSASRFeatures, "initialResultCandidateFeatures");
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = *(_QWORD *)(a1 + 32);
  v21 = *(void **)(v20 + 176);
  *(_QWORD *)(v20 + 176) = v19;

}

void __88__CSHybridEndpointer_resetForNewRequestWithSampleRate_recordContext_disableRCSelection___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = *(_QWORD *)(a1 + 40);
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 13) = 0;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 15) = 0;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 288) = v2;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 304) = 0;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 296) = 0;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 312) = 0;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 320) = 0;
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 336);
  *(_QWORD *)(v3 + 336) = 0;

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 344) = 0;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 16) = 0;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 21) = 0;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 376) = 0;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 22) = 0;
}

void __88__CSHybridEndpointer_resetForNewRequestWithSampleRate_recordContext_disableRCSelection___block_invoke_319(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  os_log_t *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  int v26;
  int v27;
  double v28;
  NSObject *v29;
  int v30;
  const char *v31;
  __int16 v32;
  id v33;
  __int16 v34;
  id v35;
  __int16 v36;
  double v37;
  __int16 v38;
  double v39;
  __int16 v40;
  double v41;
  __int16 v42;
  double v43;
  __int16 v44;
  int v45;
  __int16 v46;
  int v47;
  __int16 v48;
  double v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByDeletingLastPathComponent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByAppendingPathComponent:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_alloc(MEMORY[0x1E0D190C8]);
  LODWORD(v11) = *(_DWORD *)(a1 + 56);
  LODWORD(v12) = *(_DWORD *)(a1 + 60);
  LODWORD(v13) = *(_DWORD *)(a1 + 64);
  LODWORD(v14) = *(_DWORD *)(a1 + 68);
  LODWORD(v15) = *(_DWORD *)(a1 + 80);
  v16 = (void *)objc_msgSend(v10, "initWithModelFile:defaultThresholdPartial:defaultThresholdRC:relaxedThresholdPartial:relaxedThresholdRC:extraDelayMs:continuityWindowDuration:speechDetectedThreshold:", v9, *(unsigned int *)(a1 + 72), *(unsigned int *)(a1 + 76), v11, v12, v13, v14, v15);
  if (v16)
  {
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v16, v5);
    v17 = (os_log_t *)MEMORY[0x1E0D18F40];
    v18 = (void *)*MEMORY[0x1E0D18F40];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F40], OS_LOG_TYPE_DEFAULT))
    {
      v19 = v18;
      objc_msgSend(v16, "modelType");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = 136315906;
      v31 = "-[CSHybridEndpointer resetForNewRequestWithSampleRate:recordContext:disableRCSelection:]_block_invoke";
      v32 = 2114;
      v33 = v5;
      v34 = 2114;
      v35 = v20;
      v36 = 2114;
      v37 = *(double *)&v6;
      _os_log_impl(&dword_1C2614000, v19, OS_LOG_TYPE_DEFAULT, "%s Loaded enhanced endpointer model for task %{public}@ with model type %{public}@. Model file name: %{public}@", (uint8_t *)&v30, 0x2Au);

    }
    if (objc_msgSend(v5, "isEqualToString:", CFSTR("SearchOrMessaging")))
    {
      objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 392), v16);
      v21 = *v17;
      if (os_log_type_enabled(*v17, OS_LOG_TYPE_DEFAULT))
      {
        v22 = *(float *)(a1 + 56);
        v23 = *(float *)(a1 + 60);
        v24 = *(float *)(a1 + 64);
        v25 = *(float *)(a1 + 68);
        v26 = *(_DWORD *)(a1 + 72);
        v27 = *(_DWORD *)(a1 + 76);
        v28 = *(float *)(a1 + 80);
        v30 = 136317442;
        v31 = "-[CSHybridEndpointer resetForNewRequestWithSampleRate:recordContext:disableRCSelection:]_block_invoke";
        v32 = 2114;
        v33 = v6;
        v34 = 2114;
        v35 = v5;
        v36 = 2050;
        v37 = v22;
        v38 = 2050;
        v39 = v23;
        v40 = 2050;
        v41 = v24;
        v42 = 2050;
        v43 = v25;
        v44 = 1026;
        v45 = v26;
        v46 = 1026;
        v47 = v27;
        v48 = 2050;
        v49 = v28;
        _os_log_impl(&dword_1C2614000, v21, OS_LOG_TYPE_DEFAULT, "%s Setting default enhanced endpointer model to %{public}@ for task %{public}@, with defaultThresholdPartial: %{public}f, defaultThresholdRC: %{public}f, relaxedThresholdPartial: %{public}f, relaxedThresholdRC: %{public}f, extraDelayMs: %{public}d, continuityWindowDuration: %{public}d, speechDetectedThreshold: %{public}f", (uint8_t *)&v30, 0x5Eu);
      }
    }
  }
  else
  {
    v29 = *MEMORY[0x1E0D18F40];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F40], OS_LOG_TYPE_ERROR))
    {
      v30 = 136315650;
      v31 = "-[CSHybridEndpointer resetForNewRequestWithSampleRate:recordContext:disableRCSelection:]_block_invoke";
      v32 = 2114;
      v33 = v6;
      v34 = 2114;
      v35 = v5;
      _os_log_error_impl(&dword_1C2614000, v29, OS_LOG_TYPE_ERROR, "%s Enhanced endpointer for model %{public}@ and task %{public}@ was nil after initialization", (uint8_t *)&v30, 0x20u);
    }
  }

}

void __41__CSHybridEndpointer_terminateProcessing__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 392);
  *(_QWORD *)(v2 + 392) = 0;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 400);
  *(_QWORD *)(v4 + 400) = 0;

}

void __59__CSHybridEndpointer_handleVoiceTriggerWithActivationInfo___block_invoke(uint64_t a1)
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

  *(_QWORD *)(*(_QWORD *)(a1 + 40) + 304) = (unint64_t)(v7
                                                               * (double)*(unint64_t *)(*(_QWORD *)(a1 + 40)
                                                                                             + 288));
  *(double *)(*(_QWORD *)(a1 + 40) + 296) = (float)((float)((float)v9
                                                            / (float)*(unint64_t *)(*(_QWORD *)(a1 + 40) + 288))
                                                    * 1000.0);
  *(double *)(*(_QWORD *)(a1 + 40) + 312) = -(*(double *)(*(_QWORD *)(a1 + 40) + 296) - v7 * 1000.0);
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *MEMORY[0x1E0D197A0]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "doubleValue");
  *(double *)(*(_QWORD *)(a1 + 40) + 320) = v11 * 1000.0;

  v12 = *MEMORY[0x1E0D18F40];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F40], OS_LOG_TYPE_DEFAULT))
  {
    v14 = *(_QWORD *)(a1 + 32);
    v13 = *(_QWORD *)(a1 + 40);
    v15 = (unint64_t)*(double *)(v13 + 296);
    v16 = *(_QWORD *)(v13 + 304);
    v17 = *(_QWORD *)(v13 + 312);
    v18 = *(_QWORD *)(v13 + 320);
    v19 = 136316674;
    v20 = "-[CSHybridEndpointer handleVoiceTriggerWithActivationInfo:]_block_invoke";
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
    _os_log_impl(&dword_1C2614000, v12, OS_LOG_TYPE_DEFAULT, "%s triggerEndSeconds: %{public}f, _vtEndInSampleCount: %{public}lu, _vtExtraAudioAtStartInMs: %{public}lu,  _hepAudioOriginInMs: %{public}f, _twoShotSilenceThresholdInMs: %{public}f, voiceTriggerInfo: %{public}@,", (uint8_t *)&v19, 0x48u);
  }
}

void __50__CSHybridEndpointer_logFeaturesWithEvent_locale___block_invoke(uint64_t a1)
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
  v18[3] = __Block_byref_object_copy__16879;
  v18[4] = __Block_byref_object_dispose__16880;
  v19 = 0;
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x2020000000;
  v17 = 0;
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(NSObject **)(v2 + 256);
  v4 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__CSHybridEndpointer_logFeaturesWithEvent_locale___block_invoke_2;
  block[3] = &unk_1E7C27C98;
  block[4] = v2;
  block[5] = v18;
  block[6] = v16;
  dispatch_sync(v3, block);
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x3032000000;
  v13[3] = __Block_byref_object_copy__16879;
  v13[4] = __Block_byref_object_dispose__16880;
  v14 = 0;
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x2020000000;
  v12[3] = 0xBF847AE147AE147BLL;
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(NSObject **)(v5 + 152);
  v11[0] = v4;
  v11[1] = 3221225472;
  v11[2] = __50__CSHybridEndpointer_logFeaturesWithEvent_locale___block_invoke_3;
  v11[3] = &unk_1E7C27C98;
  v11[4] = v5;
  v11[5] = v13;
  v11[6] = v12;
  dispatch_async_and_wait(v6, v11);
  v10 = *(id *)(a1 + 48);
  AnalyticsSendEventLazy();
  v7 = *MEMORY[0x1E0D18F40];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F40], OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(_QWORD *)(a1 + 40);
    v9 = *(_QWORD *)(a1 + 48);
    *(_DWORD *)buf = 136315650;
    v21 = "-[CSHybridEndpointer logFeaturesWithEvent:locale:]_block_invoke";
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

void __50__CSHybridEndpointer_logFeaturesWithEvent_locale___block_invoke_2(_QWORD *a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), *(id *)(a1[4] + 168));
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = *(_BYTE *)(a1[4] + 10);
}

double __50__CSHybridEndpointer_logFeaturesWithEvent_locale___block_invoke_3(_QWORD *a1)
{
  double result;

  objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), *(id *)(a1[4] + 160));
  result = *(double *)(a1[4] + 192) * 1000.0;
  *(double *)(*(_QWORD *)(a1[6] + 8) + 24) = result;
  return result;
}

id __50__CSHybridEndpointer_logFeaturesWithEvent_locale___block_invoke_4(_QWORD *a1)
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
  if (*(_QWORD *)(a1[5] + 144))
    v2 = *(const __CFString **)(a1[5] + 144);
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
  v16[5] = CFSTR("serverFeaturesLatency");
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

uint64_t __30__CSHybridEndpointer_setMhId___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 56), *(id *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_updateEndpointerDelayedTriggerByMhId:", *(_QWORD *)(a1 + 40));
}

uint64_t __108__CSHybridEndpointer__generateEndpointerFeaturesWithEffectiveClientProcessedAudioMs_osdFeatures_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __70__CSHybridEndpointer_processOSDFeatures_withFrameDurationMs_withMHID___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 56));
}

_QWORD *__70__CSHybridEndpointer_processOSDFeatures_withFrameDurationMs_withMHID___block_invoke_268(_QWORD *result)
{
  *(_QWORD *)(*(_QWORD *)(result[5] + 8) + 24) = *(_QWORD *)(result[4] + 360);
  *(_QWORD *)(*(_QWORD *)(result[6] + 8) + 24) = *(_QWORD *)(result[4] + 352);
  *(_BYTE *)(*(_QWORD *)(result[7] + 8) + 24) = *(_BYTE *)(result[4] + 17);
  *(_QWORD *)(*(_QWORD *)(result[8] + 8) + 24) = *(_QWORD *)(result[4] + 368);
  return result;
}

double __70__CSHybridEndpointer_processOSDFeatures_withFrameDurationMs_withMHID___block_invoke_2(uint64_t a1)
{
  double result;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(a1 + 32) + 13);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(a1 + 32) + 15);
  result = *(double *)(*(_QWORD *)(a1 + 32) + 312) + *(float *)(a1 + 64);
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = result;
  return result;
}

uint64_t __70__CSHybridEndpointer_processOSDFeatures_withFrameDurationMs_withMHID___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_shouldProvideTwoShotFeedbackWithRecordContext");
  if ((_DWORD)result)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  return result;
}

void __70__CSHybridEndpointer_processOSDFeatures_withFrameDurationMs_withMHID___block_invoke_4(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  const char *v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0D18F40];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F40], OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    v4 = 136315394;
    v5 = "-[CSHybridEndpointer processOSDFeatures:withFrameDurationMs:withMHID:]_block_invoke_4";
    v6 = 2050;
    v7 = v3;
    _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s Detected speech start at %{public}f of effectiveClientProcessedAudioMs", (uint8_t *)&v4, 0x16u);
  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 21) = 1;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 376) = 0;
}

void __70__CSHybridEndpointer_processOSDFeatures_withFrameDurationMs_withMHID___block_invoke_269(uint64_t a1)
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
  *(double *)(*(_QWORD *)(a1 + 32) + 376) = *(float *)(a1 + 40);
  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v1 + 14))
  {
    v2 = *(double *)(v1 + 376);
    v3 = *(double *)(v1 + 320);
    if (v2 > v3)
    {
      v5 = *MEMORY[0x1E0D18F40];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F40], OS_LOG_TYPE_DEFAULT))
      {
        v7 = 136315650;
        v8 = "-[CSHybridEndpointer processOSDFeatures:withFrameDurationMs:withMHID:]_block_invoke";
        v9 = 2050;
        v10 = v2;
        v11 = 2048;
        v12 = v3;
        _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_DEFAULT, "%s Detected sufficient silence to fire two shot with %{public}fms silence, %f threshold", (uint8_t *)&v7, 0x20u);
        v1 = *(_QWORD *)(a1 + 32);
      }
      *(_BYTE *)(v1 + 14) = 1;
      WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 40));
      objc_msgSend(WeakRetained, "endpointer:detectedTwoShotAtTime:", *(double *)(*(_QWORD *)(a1 + 32) + 376) / 1000.0);

    }
  }
}

void __70__CSHybridEndpointer_processOSDFeatures_withFrameDurationMs_withMHID___block_invoke_270(uint64_t a1)
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
  uint64_t v12;
  void *v13;
  double v14;
  uint64_t *v15;
  _BYTE *v16;
  _BOOL4 v17;
  NSObject *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  uint64_t v22;
  uint64_t v23;
  double v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  double v31;
  double v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  double v38;
  double v39;
  int v40;
  int v41;
  double v42;
  float v43;
  NSObject *v44;
  os_log_type_t v45;
  uint64_t v46;
  void *v47;
  double v48;
  int v49;
  NSObject *v50;
  NSObject *v51;
  uint64_t v52;
  uint64_t (*v53)(uint64_t, uint64_t);
  uint64_t (*v54)(uint64_t, uint64_t);
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  float v58;
  float v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  id v63;
  unint64_t v64;
  double v65;
  uint64_t v66;
  NSObject *v67;
  uint64_t v68;
  uint64_t (*v69)(uint64_t, uint64_t);
  uint64_t (*v70)(uint64_t, uint64_t);
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  float v74;
  float v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  id v79;
  unint64_t v80;
  double v81;
  uint64_t v82;
  NSObject *v83;
  uint64_t v84;
  uint64_t (*v85)(uint64_t, uint64_t);
  uint64_t v86;
  uint64_t v87;
  double v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  double v95;
  double v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  double v102;
  double v103;
  int v104;
  int v105;
  double v106;
  float v107;
  uint64_t v108;
  NSObject *v109;
  double v110;
  double v111;
  float v112;
  float v113;
  void *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  NSObject *v118;
  double v119;
  uint64_t v120;
  double v121;
  int v122;
  id WeakRetained;
  id v124;
  char v125;
  id v126;
  NSObject *v127;
  double v128;
  double v129;
  double v130;
  double v131;
  uint64_t v132;
  NSObject *v133;
  void *v134;
  void *v135;
  NSObject *v136;
  double v137;
  double v138;
  double v139;
  double v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  int v145;
  void *v146;
  CSEndpointerMetrics *v147;
  NSObject *v148;
  double v149;
  uint64_t v150;
  double v151;
  id v152;
  id v153;
  int v154;
  id v155;
  void *v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  void *v162;
  double v163;
  double v164;
  CSEndpointerMetrics *v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t (*v169)(uint64_t, uint64_t);
  uint64_t (*v170)(uint64_t, uint64_t);
  void *v171;
  id v172;
  _QWORD v173[7];
  uint64_t v174;
  uint64_t *v175;
  uint64_t v176;
  uint64_t (*v177)(uint64_t, uint64_t);
  void (*v178)(uint64_t);
  id v179;
  _QWORD v180[11];
  char v181;
  uint64_t v182;
  double *v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  double *v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  float *v191;
  uint64_t v192;
  uint64_t (*v193)(uint64_t, uint64_t);
  void (*v194)(uint64_t);
  id v195;
  uint64_t v196;
  uint64_t *v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  float *v201;
  uint64_t v202;
  uint64_t (*v203)(uint64_t, uint64_t);
  void (*v204)(uint64_t);
  id v205;
  id v206;
  _QWORD v207[13];
  uint64_t v208;
  uint64_t *v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t v212;
  uint64_t *v213;
  uint64_t v214;
  char v215;
  uint64_t v216;
  uint64_t *v217;
  uint64_t v218;
  char v219;
  uint64_t v220;
  uint64_t *v221;
  uint64_t v222;
  char v223;
  uint64_t v224;
  uint64_t *v225;
  uint64_t v226;
  char v227;
  uint64_t v228;
  uint64_t *v229;
  uint64_t v230;
  int v231;
  uint64_t v232;
  float *v233;
  uint64_t v234;
  int v235;
  _QWORD v236[5];
  id v237;
  uint64_t v238;
  uint64_t *v239;
  uint64_t *v240;
  uint64_t v241;
  uint64_t *v242;
  uint64_t v243;
  uint64_t (*v244)(uint64_t, uint64_t);
  void (*v245)(uint64_t);
  id v246;
  uint64_t v247;
  uint64_t *v248;
  uint64_t v249;
  uint64_t (*v250)(uint64_t, uint64_t);
  void (*v251)(uint64_t);
  id v252;
  _QWORD block[6];
  uint8_t v254[4];
  const char *v255;
  __int16 v256;
  double v257;
  __int16 v258;
  void *v259;
  _QWORD v260[2];
  _QWORD v261[2];
  _BYTE buf[24];
  uint64_t (*v263)(uint64_t, uint64_t);
  _BYTE v264[20];
  __int16 v265;
  double v266;
  __int16 v267;
  uint64_t v268;
  __int16 v269;
  uint64_t v270;
  __int16 v271;
  uint64_t v272;
  __int16 v273;
  unint64_t v274;
  __int16 v275;
  double v276;
  __int16 v277;
  uint64_t v278;
  __int16 v279;
  uint64_t v280;
  __int16 v281;
  double v282;
  __int16 v283;
  uint64_t v284;
  __int16 v285;
  double v286;
  __int16 v287;
  double v288;
  __int16 v289;
  int v290;
  __int16 v291;
  int v292;
  __int16 v293;
  int v294;
  __int16 v295;
  double v296;
  uint64_t v297;

  v297 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v1 + 20))
  {
    v2 = *MEMORY[0x1E0D18F40];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F40], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "-[CSHybridEndpointer processOSDFeatures:withFrameDurationMs:withMHID:]_block_invoke";
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = "Second check, don't process OSD features";
      _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s Recording stopped: %s", buf, 0x16u);
    }
    return;
  }
  v4 = kEnhancedEndpointerTaskTypeDefault_block_invoke_heartbeat_CORESPEECH_PROCESS_SIL_SCORE_ESTIMATE_BEGIN;
  if (__ROR8__(0xEEEEEEEEEEEEEEEFLL* kEnhancedEndpointerTaskTypeDefault_block_invoke_heartbeat_CORESPEECH_PROCESS_SIL_SCORE_ESTIMATE_BEGIN, 1) <= 0x888888888888888uLL)
  {
    kdebug_trace();
    v4 = kEnhancedEndpointerTaskTypeDefault_block_invoke_heartbeat_CORESPEECH_PROCESS_SIL_SCORE_ESTIMATE_BEGIN;
    v1 = *(_QWORD *)(a1 + 32);
  }
  kEnhancedEndpointerTaskTypeDefault_block_invoke_heartbeat_CORESPEECH_PROCESS_SIL_SCORE_ESTIMATE_BEGIN = v4 + 1;
  v5 = *(NSObject **)(v1 + 280);
  v6 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__CSHybridEndpointer_processOSDFeatures_withFrameDurationMs_withMHID___block_invoke_272;
  block[3] = &unk_1E7C29228;
  block[5] = *(_QWORD *)(a1 + 48);
  block[4] = v1;
  dispatch_async_and_wait(v5, block);
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 168), *(id *)(a1 + 40));
    v247 = 0;
    v248 = &v247;
    v249 = 0x3032000000;
    v250 = __Block_byref_object_copy__16879;
    v251 = __Block_byref_object_dispose__16880;
    v252 = 0;
    v241 = 0;
    v242 = &v241;
    v243 = 0x3032000000;
    v244 = __Block_byref_object_copy__16879;
    v245 = __Block_byref_object_dispose__16880;
    v246 = 0;
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(NSObject **)(v9 + 152);
    v236[0] = v6;
    v236[1] = 3221225472;
    v236[2] = __70__CSHybridEndpointer_processOSDFeatures_withFrameDurationMs_withMHID___block_invoke_273;
    v236[3] = &unk_1E7C27870;
    v11 = *(_QWORD *)(a1 + 56);
    v236[4] = v9;
    v238 = v11;
    v237 = *(id *)(a1 + 40);
    v239 = &v247;
    v240 = &v241;
    dispatch_async_and_wait(v10, v236);
    if (!v248[5] && !v242[5])
    {
      v83 = *MEMORY[0x1E0D18F40];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F40], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        *(_QWORD *)&buf[4] = "-[CSHybridEndpointer processOSDFeatures:withFrameDurationMs:withMHID:]_block_invoke";
        _os_log_impl(&dword_1C2614000, v83, OS_LOG_TYPE_DEFAULT, "%s ClientLag: Not Invoking HybridClassifier as ASR's ProcessedAudioMs > effectiveClientProcessedAudioMs", buf, 0xCu);
      }
      kdebug_trace();
      goto LABEL_79;
    }
    v232 = 0;
    v233 = (float *)&v232;
    v234 = 0x2020000000;
    v235 = 0;
    v228 = 0;
    v229 = &v228;
    v230 = 0x2020000000;
    v231 = 0;
    v224 = 0;
    v225 = &v224;
    v226 = 0x2020000000;
    v227 = 0;
    v220 = 0;
    v221 = &v220;
    v222 = 0x2020000000;
    v223 = 0;
    v216 = 0;
    v217 = &v216;
    v218 = 0x2020000000;
    v219 = 0;
    v212 = 0;
    v213 = &v212;
    v214 = 0x2020000000;
    v215 = 0;
    v208 = 0;
    v209 = &v208;
    v210 = 0x2020000000;
    v211 = 1;
    if (!objc_msgSend(*(id *)(a1 + 32), "_useEnhancedEndpointer") || (v12 = v242[5]) == 0)
    {
      v46 = v248[5];
      if (!v46)
      {
        v67 = *MEMORY[0x1E0D18F40];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F40], OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 136315138;
          *(_QWORD *)&buf[4] = "-[CSHybridEndpointer processOSDFeatures:withFrameDurationMs:withMHID:]_block_invoke";
          _os_log_fault_impl(&dword_1C2614000, v67, OS_LOG_TYPE_FAULT, "%s hybridEPFeatures and enhancedEPFeatures should not both be nil", buf, 0xCu);
        }
        v172 = 0;
        goto LABEL_76;
      }
      v47 = *(void **)(*(_QWORD *)(a1 + 32) + 136);
      v48 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
      v206 = 0;
      v49 = objc_msgSend(v47, "didEndpointWithFeatures:audioTimestamp:featuresToLog:endpointPosterior:extraDelayMs:", v46, &v206, v233 + 6, v229 + 3, v48);
      v172 = v206;
      v50 = (id)*MEMORY[0x1E0D18F40];
      v51 = v50;
      if (!v49)
      {
        if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
        {
          v68 = objc_msgSend((id)v248[5], "trailingSilenceDuration");
          objc_msgSend((id)v248[5], "clientSilenceFramesCountMs");
          v70 = v69;
          objc_msgSend((id)v248[5], "endOfSentenceLikelihood");
          v72 = v71;
          v73 = objc_msgSend((id)v248[5], "wordCount");
          objc_msgSend((id)v248[5], "serverFeaturesLatency");
          v75 = v74;
          objc_msgSend((id)v248[5], "clientSilenceProbability");
          v77 = v76;
          objc_msgSend((id)v248[5], "pauseCounts");
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v78, "componentsJoinedByString:", CFSTR(","));
          v79 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)v248[5], "silencePosterior");
          v80 = (unint64_t)*(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
          v81 = v233[6];
          *(_DWORD *)buf = 136317954;
          *(_QWORD *)&buf[4] = "-[CSHybridEndpointer processOSDFeatures:withFrameDurationMs:withMHID:]_block_invoke";
          *(_WORD *)&buf[12] = 2050;
          *(_QWORD *)&buf[14] = v68;
          *(_WORD *)&buf[22] = 2050;
          v263 = v70;
          *(_WORD *)v264 = 2050;
          *(_QWORD *)&v264[2] = v72;
          *(_WORD *)&v264[10] = 2050;
          *(_QWORD *)&v264[12] = v73;
          v265 = 2050;
          v266 = v75;
          v267 = 2050;
          v268 = v77;
          v269 = 2114;
          v270 = (uint64_t)v79;
          v271 = 2050;
          v272 = v82;
          v273 = 2050;
          v274 = v80;
          v275 = 2050;
          v276 = v81;
          v277 = 1026;
          LODWORD(v278) = 0;
          _os_log_impl(&dword_1C2614000, v51, OS_LOG_TYPE_INFO, "%s HEP.feats: [%{public}ld,%{public}f,%{public}f,%{public}ld,%{public}f,%{public}f] & [(%{public}@),%{public}f] @ %{public}lu [%{public}f, %{public}d]", buf, 0x76u);

        }
        goto LABEL_76;
      }
      if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
      {
        v52 = objc_msgSend((id)v248[5], "trailingSilenceDuration");
        objc_msgSend((id)v248[5], "clientSilenceFramesCountMs");
        v54 = v53;
        objc_msgSend((id)v248[5], "endOfSentenceLikelihood");
        v56 = v55;
        v57 = objc_msgSend((id)v248[5], "wordCount");
        objc_msgSend((id)v248[5], "serverFeaturesLatency");
        v59 = v58;
        objc_msgSend((id)v248[5], "clientSilenceProbability");
        v61 = v60;
        objc_msgSend((id)v248[5], "pauseCounts");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "componentsJoinedByString:", CFSTR(","));
        v63 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v248[5], "silencePosterior");
        v64 = (unint64_t)*(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
        v65 = v233[6];
        *(_DWORD *)buf = 136317954;
        *(_QWORD *)&buf[4] = "-[CSHybridEndpointer processOSDFeatures:withFrameDurationMs:withMHID:]_block_invoke";
        *(_WORD *)&buf[12] = 2050;
        *(_QWORD *)&buf[14] = v52;
        *(_WORD *)&buf[22] = 2050;
        v263 = v54;
        *(_WORD *)v264 = 2050;
        *(_QWORD *)&v264[2] = v56;
        *(_WORD *)&v264[10] = 2050;
        *(_QWORD *)&v264[12] = v57;
        v265 = 2050;
        v266 = v59;
        v267 = 2050;
        v268 = v61;
        v269 = 2114;
        v270 = (uint64_t)v63;
        v271 = 2050;
        v272 = v66;
        v273 = 2050;
        v274 = v64;
        v275 = 2050;
        v276 = v65;
        v277 = 1026;
        LODWORD(v278) = 1;
        _os_log_impl(&dword_1C2614000, v51, OS_LOG_TYPE_DEFAULT, "%s HEP.feats: [%{public}ld,%{public}f,%{public}f,%{public}ld,%{public}f,%{public}f] & [(%{public}@),%{public}f] @ %{public}lu [%{public}f, %{public}d]", buf, 0x76u);

      }
      goto LABEL_39;
    }
    v200 = 0;
    v201 = (float *)&v200;
    v202 = 0x2020000000;
    LODWORD(v203) = 0;
    v190 = 0;
    v191 = (float *)&v190;
    v192 = 0x2020000000;
    LODWORD(v193) = 0;
    v13 = *(void **)(*(_QWORD *)(a1 + 32) + 392);
    v14 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
    v207[0] = v6;
    v207[1] = 3221225472;
    v207[2] = __70__CSHybridEndpointer_processOSDFeatures_withFrameDurationMs_withMHID___block_invoke_276;
    v207[3] = &unk_1E7C26BA8;
    v207[4] = &v224;
    v207[5] = &v220;
    v207[6] = &v228;
    v207[7] = &v232;
    v207[8] = &v216;
    v207[9] = &v212;
    v207[10] = &v200;
    v207[11] = &v190;
    v207[12] = &v208;
    objc_msgSend(v13, "didEndpointWithFeatures:audioTimestampMs:completion:", v12, v207, v14);
    v15 = v221;
    if (*((_BYTE *)v217 + 24) || (v16 = v221 + 3, !*((_BYTE *)v221 + 24)))
    {
      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 22) = 0;
      v16 = v15 + 3;
    }
    else
    {
      v150 = *(_QWORD *)(a1 + 32);
      if (!*(_BYTE *)(v150 + 22))
      {
        v17 = 1;
        *(_BYTE *)(v150 + 22) = 1;
        if (*v16)
        {
LABEL_18:
          objc_msgSend((id)v242[5], "toFeatureArray");
          v172 = (id)objc_claimAutoreleasedReturnValue();
          v18 = (id)*MEMORY[0x1E0D18F40];
          v19 = v18;
          if (v17)
          {
            if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
              goto LABEL_38;
            v20 = objc_msgSend((id)v242[5], "trailingSilenceDuration");
            objc_msgSend((id)v242[5], "clientSilenceFramesCount");
            v169 = v21;
            objc_msgSend((id)v242[5], "endOfSentenceLikelihood");
            v166 = v22;
            v23 = objc_msgSend((id)v242[5], "wordCount");
            objc_msgSend((id)v242[5], "serverFeaturesLatency");
            v163 = v24;
            objc_msgSend((id)v242[5], "clientSilenceProbability");
            v26 = v25;
            v27 = objc_msgSend((id)v242[5], "rcTrailingSilenceDuration");
            objc_msgSend((id)v242[5], "rcEndOfSentenceLikelihood");
            v29 = v28;
            v30 = objc_msgSend((id)v242[5], "rcWordCount");
            objc_msgSend((id)v242[5], "rcServerFeaturesLatency");
            v32 = v31;
            objc_msgSend((id)v242[5], "silencePosterior");
            v34 = v33;
            objc_msgSend((id)v242[5], "acousticEndpointerScore");
            v36 = v35;
            objc_msgSend((id)v242[5], "silencePosteriorNF");
            v37 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
            v38 = v201[6];
            v39 = v191[6];
            v40 = *((unsigned __int8 *)v221 + 24);
            v41 = *((unsigned __int8 *)v225 + 24);
            v42 = v233[6];
            *(_DWORD *)buf = 136320258;
            *(_QWORD *)&buf[4] = "-[CSHybridEndpointer processOSDFeatures:withFrameDurationMs:withMHID:]_block_invoke_2";
            *(_WORD *)&buf[12] = 2050;
            *(_QWORD *)&buf[14] = v20;
            *(_WORD *)&buf[22] = 2050;
            v263 = v169;
            *(_WORD *)v264 = 2050;
            *(_QWORD *)&v264[2] = v166;
            *(_WORD *)&v264[10] = 2050;
            *(_QWORD *)&v264[12] = v23;
            v265 = 2050;
            v266 = v163;
            v267 = 2050;
            v268 = v26;
            v269 = 2050;
            v270 = v27;
            v271 = 2050;
            v272 = v29;
            v273 = 2050;
            v274 = v30;
            v275 = 2050;
            v276 = v32;
            v277 = 2050;
            v278 = v34;
            v279 = 2050;
            v280 = v36;
            v281 = 2050;
            v282 = v43;
            v283 = 2050;
            v284 = v37;
            v285 = 2050;
            v286 = v38;
            v287 = 2050;
            v288 = v39;
            v289 = 1026;
            v290 = 1;
            v291 = 1026;
            v292 = v40;
            v293 = 1026;
            v294 = v41;
            v295 = 2050;
            v296 = v42;
            v44 = v19;
            v45 = OS_LOG_TYPE_DEFAULT;
          }
          else
          {
            if (!os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
              goto LABEL_38;
            v84 = objc_msgSend((id)v242[5], "trailingSilenceDuration");
            objc_msgSend((id)v242[5], "clientSilenceFramesCount");
            v170 = v85;
            objc_msgSend((id)v242[5], "endOfSentenceLikelihood");
            v167 = v86;
            v87 = objc_msgSend((id)v242[5], "wordCount");
            objc_msgSend((id)v242[5], "serverFeaturesLatency");
            v164 = v88;
            objc_msgSend((id)v242[5], "clientSilenceProbability");
            v90 = v89;
            v91 = objc_msgSend((id)v242[5], "rcTrailingSilenceDuration");
            objc_msgSend((id)v242[5], "rcEndOfSentenceLikelihood");
            v93 = v92;
            v94 = objc_msgSend((id)v242[5], "rcWordCount");
            objc_msgSend((id)v242[5], "rcServerFeaturesLatency");
            v96 = v95;
            objc_msgSend((id)v242[5], "silencePosterior");
            v98 = v97;
            objc_msgSend((id)v242[5], "acousticEndpointerScore");
            v100 = v99;
            objc_msgSend((id)v242[5], "silencePosteriorNF");
            v101 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
            v102 = v201[6];
            v103 = v191[6];
            v104 = *((unsigned __int8 *)v221 + 24);
            v105 = *((unsigned __int8 *)v225 + 24);
            v106 = v233[6];
            *(_DWORD *)buf = 136320258;
            *(_QWORD *)&buf[4] = "-[CSHybridEndpointer processOSDFeatures:withFrameDurationMs:withMHID:]_block_invoke";
            *(_WORD *)&buf[12] = 2050;
            *(_QWORD *)&buf[14] = v84;
            *(_WORD *)&buf[22] = 2050;
            v263 = v170;
            *(_WORD *)v264 = 2050;
            *(_QWORD *)&v264[2] = v167;
            *(_WORD *)&v264[10] = 2050;
            *(_QWORD *)&v264[12] = v87;
            v265 = 2050;
            v266 = v164;
            v267 = 2050;
            v268 = v90;
            v269 = 2050;
            v270 = v91;
            v271 = 2050;
            v272 = v93;
            v273 = 2050;
            v274 = v94;
            v275 = 2050;
            v276 = v96;
            v277 = 2050;
            v278 = v98;
            v279 = 2050;
            v280 = v100;
            v281 = 2050;
            v282 = v107;
            v283 = 2050;
            v284 = v101;
            v285 = 2050;
            v286 = v102;
            v287 = 2050;
            v288 = v103;
            v289 = 1026;
            v290 = 0;
            v291 = 1026;
            v292 = v104;
            v293 = 1026;
            v294 = v105;
            v295 = 2050;
            v296 = v106;
            v44 = v19;
            v45 = OS_LOG_TYPE_INFO;
          }
          _os_log_impl(&dword_1C2614000, v44, v45, "%s EEP Features: [%{public}ld, %{public}.2f, %{public}f, %{public}ld, %{public}.2f, %{public}f, %{public}ld, %{public}f, %{public}ld, %{public}.2f, %{public}f, %{public}f, %{public}f] @ %{public}.0f, Scores: [%{public}f, %{public}f], Results: [%{public}d, %{public}d, %{public}d, %{public}f]", buf, 0xC8u);
LABEL_38:

          _Block_object_dispose(&v190, 8);
          _Block_object_dispose(&v200, 8);
          if (!v17)
          {
LABEL_76:
            *(float *)(*(_QWORD *)(a1 + 32) + 28) = v233[6];
            *(double *)(*(_QWORD *)(a1 + 32) + 272) = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24)
                                                      / 1000.0;
            v159 = kEnhancedEndpointerTaskTypeDefault_block_invoke_heartbeat_CORESPEECH_HYBRID_CLASSIFIER_PROCESS_END;
            if (__ROR8__(0xEEEEEEEEEEEEEEEFLL* kEnhancedEndpointerTaskTypeDefault_block_invoke_heartbeat_CORESPEECH_HYBRID_CLASSIFIER_PROCESS_END, 1) <= 0x888888888888888uLL)
            {
              kdebug_trace();
              v159 = kEnhancedEndpointerTaskTypeDefault_block_invoke_heartbeat_CORESPEECH_HYBRID_CLASSIFIER_PROCESS_END;
            }
            kEnhancedEndpointerTaskTypeDefault_block_invoke_heartbeat_CORESPEECH_HYBRID_CLASSIFIER_PROCESS_END = v159 + 1;
            _Block_object_dispose(&v208, 8);
            _Block_object_dispose(&v212, 8);
            _Block_object_dispose(&v216, 8);
            _Block_object_dispose(&v220, 8);
            _Block_object_dispose(&v224, 8);
            _Block_object_dispose(&v228, 8);
            _Block_object_dispose(&v232, 8);

LABEL_79:
            _Block_object_dispose(&v241, 8);

            _Block_object_dispose(&v247, 8);
            return;
          }
LABEL_39:
          if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
          {
            *(_BYTE *)(*(_QWORD *)(a1 + 32) + 10) = 1;
            v200 = 0;
            v201 = (float *)&v200;
            v202 = 0x3032000000;
            v203 = __Block_byref_object_copy__16879;
            v204 = __Block_byref_object_dispose__16880;
            v205 = 0;
            v196 = 0;
            v197 = &v196;
            v198 = 0x2020000000;
            v199 = 0;
            v190 = 0;
            v191 = (float *)&v190;
            v192 = 0x3032000000;
            v193 = __Block_byref_object_copy__16879;
            v194 = __Block_byref_object_dispose__16880;
            v195 = 0;
            v186 = 0;
            v187 = (double *)&v186;
            v188 = 0x2020000000;
            v189 = 0;
            v182 = 0;
            v183 = (double *)&v182;
            v184 = 0x2020000000;
            v185 = 0;
            v108 = *(_QWORD *)(a1 + 32);
            v109 = *(NSObject **)(v108 + 280);
            v180[0] = v6;
            v180[1] = 3221225472;
            v180[2] = __70__CSHybridEndpointer_processOSDFeatures_withFrameDurationMs_withMHID___block_invoke_280;
            v180[3] = &unk_1E7C26BD0;
            v180[4] = v108;
            v180[5] = &v224;
            v181 = *(_BYTE *)(a1 + 116);
            v180[6] = &v200;
            v180[7] = &v196;
            v180[8] = &v190;
            v180[9] = &v186;
            v180[10] = &v182;
            dispatch_async_and_wait(v109, v180);
            v110 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
            v111 = v183[3];
            objc_msgSend(MEMORY[0x1E0D19090], "inputRecordingSampleRate");
            v113 = v112;
            v114 = (void *)MEMORY[0x1E0D19118];
            v115 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
            v116 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24);
            objc_msgSend(MEMORY[0x1E0D19090], "inputRecordingSampleRate");
            v117 = objc_msgSend(v114, "hostTimeFromSampleCount:anchorHostTime:anchorSampleCount:sampleRate:", (unint64_t)((v110 + v111) / 1000.0 * v113), v115, v116);
            v118 = *MEMORY[0x1E0D18F40];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F40], OS_LOG_TYPE_DEFAULT))
            {
              v119 = v233[6];
              v120 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
              v121 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24);
              v122 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24);
              *(_DWORD *)buf = 136316674;
              *(_QWORD *)&buf[4] = "-[CSHybridEndpointer processOSDFeatures:withFrameDurationMs:withMHID:]_block_invoke_2";
              *(_WORD *)&buf[12] = 2050;
              *(double *)&buf[14] = v119;
              *(_WORD *)&buf[22] = 2050;
              v263 = (uint64_t (*)(uint64_t, uint64_t))v117;
              *(_WORD *)v264 = 2050;
              *(_QWORD *)&v264[2] = v120;
              *(_WORD *)&v264[10] = 2050;
              *(_QWORD *)&v264[12] = (unint64_t)((v110 + v111) / 1000.0 * v113);
              v265 = 2050;
              v266 = v121;
              v267 = 1026;
              LODWORD(v268) = v122;
              _os_log_impl(&dword_1C2614000, v118, OS_LOG_TYPE_DEFAULT, "%s HEP.posterior=%{public}f, result=1, endpointedBuffer.hostTime=%{public}llu, anchorhostTime=%{public}llu, endpointSampleCount=%{public}llu, numSamplesProcessedBeforeAnchorTime=%{public}lu, isAnchorTimeBuffered=%{public}d", buf, 0x44u);
            }
            WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 40));
            if (WeakRetained)
            {
              v124 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 40));
              v125 = objc_opt_respondsToSelector();

              if ((v125 & 1) != 0)
              {
                v126 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 40));
                objc_msgSend(v126, "endpointer:reportEndpointBufferHostTime:firstBufferHostTime:", *(_QWORD *)(a1 + 32), v117, v197[3]);

              }
            }
            if (v233[6] == 0.0 && objc_msgSend(v172, "count") == 2 || *((_BYTE *)v213 + 24))
            {
              v127 = *MEMORY[0x1E0D18F40];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F40], OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315394;
                *(_QWORD *)&buf[4] = "-[CSHybridEndpointer processOSDFeatures:withFrameDurationMs:withMHID:]_block_invoke";
                *(_WORD *)&buf[12] = 2114;
                *(_QWORD *)&buf[14] = v172;
                _os_log_impl(&dword_1C2614000, v127, OS_LOG_TYPE_DEFAULT, "%s Request timeout with features %{public}@", buf, 0x16u);
              }
              *(_BYTE *)(*(_QWORD *)(a1 + 32) + 18) = 1;
            }
            *(_QWORD *)(*(_QWORD *)(a1 + 32) + 264) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
            objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 128), *(id *)(a1 + 40));
            objc_msgSend(MEMORY[0x1E0C99D68], "date");
            v162 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v162, "timeIntervalSinceDate:", *((_QWORD *)v201 + 5));
            v129 = v128;
            v130 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
            v131 = *(double *)(a1 + 104);
            *(_QWORD *)buf = 0;
            *(_QWORD *)&buf[8] = buf;
            *(_QWORD *)&buf[16] = 0x3032000000;
            v263 = __Block_byref_object_copy__16879;
            *(_QWORD *)v264 = __Block_byref_object_dispose__16880;
            *(_QWORD *)&v264[8] = 0;
            v174 = 0;
            v175 = &v174;
            v176 = 0x3032000000;
            v177 = __Block_byref_object_copy__16879;
            v178 = __Block_byref_object_dispose__16880;
            v179 = 0;
            v132 = *(_QWORD *)(a1 + 32);
            v133 = *(NSObject **)(v132 + 152);
            v173[0] = v6;
            v173[1] = 3221225472;
            v173[2] = __70__CSHybridEndpointer_processOSDFeatures_withFrameDurationMs_withMHID___block_invoke_284;
            v173[3] = &unk_1E7C27C98;
            v173[4] = v132;
            v173[5] = buf;
            v173[6] = &v174;
            dispatch_async_and_wait(v133, v173);
            v260[0] = CFSTR("ExtraDelayMs");
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *((unsigned int *)v229 + 6));
            v134 = (void *)objc_claimAutoreleasedReturnValue();
            v261[0] = v134;
            v260[1] = CFSTR("EndpointerDecisionLagMs");
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v129 / (v130 / 1000.0) * (v131 / 1000.0) * 1000.0);
            v135 = (void *)objc_claimAutoreleasedReturnValue();
            v261[1] = v135;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v261, v260, 2);
            v171 = (void *)objc_claimAutoreleasedReturnValue();

            v136 = *MEMORY[0x1E0D18F40];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F40], OS_LOG_TYPE_DEFAULT))
            {
              v137 = *(double *)(*(_QWORD *)&buf[8] + 40);
              *(_DWORD *)v254 = 136315650;
              v255 = "-[CSHybridEndpointer processOSDFeatures:withFrameDurationMs:withMHID:]_block_invoke_2";
              v256 = 2114;
              v257 = v137;
              v258 = 2114;
              v259 = v171;
              _os_log_impl(&dword_1C2614000, v136, OS_LOG_TYPE_DEFAULT, "%s ASRFeaturesLatencyDistribution: %{public}@ additionalMetrics: %{public}@", v254, 0x20u);
            }
            objc_msgSend(*(id *)(a1 + 40), "silenceFramesCountMs");
            v139 = v138;
            if (v209[3] == 1 && objc_msgSend(*((id *)v191 + 5), "assetProvider") == 1)
              v209[3] = 2;
            v168 = v117;
            v165 = [CSEndpointerMetrics alloc];
            v140 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
            v141 = v209[3];
            v142 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
            v143 = v175[5];
            v144 = *(_QWORD *)(a1 + 40);
            v145 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 18);
            objc_msgSend(*((id *)v191 + 5), "configVersion");
            v146 = (void *)objc_claimAutoreleasedReturnValue();
            LOBYTE(v161) = *(_BYTE *)(*(_QWORD *)(a1 + 32) + 17) != 0;
            LOBYTE(v160) = v145 != 0;
            v147 = -[CSEndpointerMetrics initWithTotalAudioRecorded:endpointBufferHostTime:featuresAtEndpoint:endpointerType:asrFeatureLatencyDistribution:additionalMetrics:trailingSilenceDurationAtEndpoint:requestId:osdFeatures:asrFeatures:isRequestTimeOut:assetConfigVersion:blkHepAudioOrigin:vtExtraAudioAtStartInMs:firstAudioSampleSensorTimestamp:isAnchorTimeBuffered:endpointHostTime:audioDeliveryHostTimeDelta:](v165, "initWithTotalAudioRecorded:endpointBufferHostTime:featuresAtEndpoint:endpointerType:asrFeatureLatencyDistribution:additionalMetrics:trailingSilenceDurationAtEndpoint:requestId:osdFeatures:asrFeatures:isRequestTimeOut:assetConfigVersion:blkHepAudioOrigin:vtExtraAudioAtStartInMs:firstAudioSampleSensorTimestamp:isAnchorTimeBuffered:endpointHostTime:audioDeliveryHostTimeDelta:", v168, v172, v141, v142, v171, 0, v140, v139 / 1000.0, v187[3], v183[3], v144, v143, v160, v146,
                     v197[3],
                     v161,
                     mach_absolute_time(),
                     *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24));

            if (*(_BYTE *)(a1 + 116))
            {
              v148 = *MEMORY[0x1E0D18F40];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F40], OS_LOG_TYPE_DEBUG))
              {
                v149 = *(double *)(*(_QWORD *)(a1 + 32) + 264) / 1000.0;
                *(_DWORD *)v254 = 136315394;
                v255 = "-[CSHybridEndpointer processOSDFeatures:withFrameDurationMs:withMHID:]_block_invoke";
                v256 = 2050;
                v257 = v149;
                _os_log_debug_impl(&dword_1C2614000, v148, OS_LOG_TYPE_DEBUG, "%s MMEP:: HEP detected at %{public}f but will continue running for MMEP.", v254, 0x16u);
              }
            }
            else
            {
              v151 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) / 1000.0;
              if (objc_msgSend(MEMORY[0x1E0D19260], "isMedocFeatureEnabled"))
              {
                if (*((_BYTE *)v221 + 24) || (objc_msgSend(*(id *)(a1 + 32), "_useEnhancedEndpointer") & 1) == 0)
                {
                  v152 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 32));
                  objc_msgSend(v152, "endpointer:didDetectHardEndpointAtTime:withMetrics:endpointerModelType:", *(_QWORD *)(a1 + 32), v147, 1, v151);

                }
                if (*((_BYTE *)v225 + 24)
                  || !objc_msgSend(*(id *)(a1 + 32), "_useEnhancedEndpointer")
                  || (objc_msgSend(MEMORY[0x1E0D19260], "isFlexibleEndpointingEnabled") & 1) == 0)
                {
                  v153 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 32));
                  objc_msgSend(v153, "endpointer:didDetectHardEndpointAtTime:withMetrics:endpointerModelType:", *(_QWORD *)(a1 + 32), v147, 2, v151);

                }
              }
              else
              {
                v154 = objc_msgSend(*(id *)(a1 + 32), "_useEnhancedEndpointer");
                v155 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 32));
                v156 = v155;
                v157 = *(_QWORD *)(a1 + 32);
                if (v154)
                {
                  v158 = 2;
                  objc_msgSend(v155, "endpointer:didDetectHardEndpointAtTime:withMetrics:endpointerModelType:", v157, v147, 2, v151);
                }
                else
                {
                  objc_msgSend(v155, "endpointer:didDetectHardEndpointAtTime:withMetrics:endpointerModelType:", v157, v147, 0, v151);
                  v158 = 0;
                }

                +[CSEndpointDetectedSelfLogger emitEndpointDetectedEventWithEndpointerMetrics:withEndpointerModelType:withTrpId:withMhID:](CSEndpointDetectedSelfLogger, "emitEndpointDetectedEventWithEndpointerMetrics:withEndpointerModelType:withTrpId:withMhID:", v147, v158, 0, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56));
              }
            }

            _Block_object_dispose(&v174, 8);
            _Block_object_dispose(buf, 8);

            _Block_object_dispose(&v182, 8);
            _Block_object_dispose(&v186, 8);
            _Block_object_dispose(&v190, 8);

            _Block_object_dispose(&v196, 8);
            _Block_object_dispose(&v200, 8);

          }
          goto LABEL_76;
        }
LABEL_17:
        v17 = *((_BYTE *)v225 + 24) != 0;
        goto LABEL_18;
      }
    }
    *v16 = 0;
    goto LABEL_17;
  }
  v7 = *MEMORY[0x1E0D18F40];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F40], OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(float *)(a1 + 112);
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "-[CSHybridEndpointer processOSDFeatures:withFrameDurationMs:withMHID:]_block_invoke_2";
    *(_WORD *)&buf[12] = 2050;
    *(double *)&buf[14] = v8;
    _os_log_impl(&dword_1C2614000, v7, OS_LOG_TYPE_DEFAULT, "%s Already communicated end-pt: Not Invoking hybridClassifier for silposnf=%{public}f", buf, 0x16u);
  }
  kdebug_trace();
}

uint64_t __70__CSHybridEndpointer_processOSDFeatures_withFrameDurationMs_withMHID___block_invoke_272(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 13);
  return result;
}

uint64_t __70__CSHybridEndpointer_processOSDFeatures_withFrameDurationMs_withMHID___block_invoke_273(uint64_t a1)
{
  uint64_t v1;
  double v2;
  void *v3;
  _QWORD v5[4];
  __int128 v6;

  v1 = *(_QWORD *)(a1 + 40);
  v2 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  v3 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __70__CSHybridEndpointer_processOSDFeatures_withFrameDurationMs_withMHID___block_invoke_2_274;
  v5[3] = &unk_1E7C26B80;
  v6 = *(_OWORD *)(a1 + 56);
  return objc_msgSend(v3, "_generateEndpointerFeaturesWithEffectiveClientProcessedAudioMs:osdFeatures:completion:", v1, v5, v2);
}

void __70__CSHybridEndpointer_processOSDFeatures_withFrameDurationMs_withMHID___block_invoke_276(_QWORD *a1, void *a2)
{
  id v3;
  int v4;
  int v5;
  int v6;
  uint64_t v7;

  v3 = a2;
  *(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24) = objc_msgSend(v3, "didRelaxedEndpointerFire");
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = objc_msgSend(v3, "didDefaultEndpointerFire");
  *(_DWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = objc_msgSend(v3, "extraDelayMs");
  objc_msgSend(v3, "endpointPosterior");
  *(_DWORD *)(*(_QWORD *)(a1[7] + 8) + 24) = v4;
  *(_BYTE *)(*(_QWORD *)(a1[8] + 8) + 24) = objc_msgSend(v3, "speechArrivalDetected");
  *(_BYTE *)(*(_QWORD *)(a1[9] + 8) + 24) = objc_msgSend(v3, "didForceEndpoint");
  objc_msgSend(v3, "partialScore");
  *(_DWORD *)(*(_QWORD *)(a1[10] + 8) + 24) = v5;
  objc_msgSend(v3, "rcScore");
  *(_DWORD *)(*(_QWORD *)(a1[11] + 8) + 24) = v6;
  v7 = objc_msgSend(v3, "endpointerType");

  *(_QWORD *)(*(_QWORD *)(a1[12] + 8) + 24) = v7;
}

double __70__CSHybridEndpointer_processOSDFeatures_withFrameDurationMs_withMHID___block_invoke_280(uint64_t a1)
{
  BOOL v2;
  double result;

  if (objc_msgSend(*(id *)(a1 + 32), "_useEnhancedEndpointer"))
    v2 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) != 0;
  else
    v2 = 1;
  if (!*(_BYTE *)(a1 + 88))
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 13) = v2;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 15) = v2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 336));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = (unint64_t)*(double *)(*(_QWORD *)(a1 + 32)
                                                                                            + 344);
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 120));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 312);
  result = *(double *)(*(_QWORD *)(a1 + 32) + 296);
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = result;
  return result;
}

void __70__CSHybridEndpointer_processOSDFeatures_withFrameDurationMs_withMHID___block_invoke_284(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0D19260], "distributionDictionary:", *(_QWORD *)(a1[4] + 184));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "mutableCopy");
  v4 = *(_QWORD *)(a1[5] + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1[4] + 208));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "setObject:forKeyedSubscript:", v6, CFSTR("Warmup"));

  objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), *(id *)(a1[4] + 160));
}

void __70__CSHybridEndpointer_processOSDFeatures_withFrameDurationMs_withMHID___block_invoke_2_274(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  int v13;
  const char *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v7)
  {
    v10 = (void *)*MEMORY[0x1E0D18F40];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F40], OS_LOG_TYPE_DEFAULT))
    {
      v11 = v10;
      objc_msgSend(v7, "localizedDescription");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 136315394;
      v14 = "-[CSHybridEndpointer processOSDFeatures:withFrameDurationMs:withMHID:]_block_invoke_2";
      v15 = 2112;
      v16 = v12;
      _os_log_impl(&dword_1C2614000, v11, OS_LOG_TYPE_DEFAULT, "%s Endpoint feature generation error: %@", (uint8_t *)&v13, 0x16u);

    }
  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a4);
  }

}

void __87__CSHybridEndpointer_processFirstAudioPacketTimestamp_firstAudioSampleSensorTimestamp___block_invoke(uint64_t a1)
{
  uint64_t v1;
  unint64_t v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  unint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v1 + 16))
  {
    *(_BYTE *)(v1 + 16) = 1;
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 336), *(id *)(a1 + 40));
    v3 = *(_QWORD *)(a1 + 48);
    *(double *)(*(_QWORD *)(a1 + 32) + 344) = (double)v3;
    v4 = *MEMORY[0x1E0D18F40];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F40], OS_LOG_TYPE_DEFAULT))
    {
      v5 = 136315394;
      v6 = "-[CSHybridEndpointer processFirstAudioPacketTimestamp:firstAudioSampleSensorTimestamp:]_block_invoke";
      v7 = 2050;
      v8 = v3;
      _os_log_impl(&dword_1C2614000, v4, OS_LOG_TYPE_DEFAULT, "%s first audio buffer host time: %{public}llu", (uint8_t *)&v5, 0x16u);
    }
  }
}

uint64_t __127__CSHybridEndpointer_logAnchorMachAbsTime_numSamplesProcessedBeforeAnchorTime_isAnchorTimeBuffered_audioDeliveryHostTimeDelta___block_invoke(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)(result + 32) + 360) = *(_QWORD *)(result + 40);
  v1 = *(_QWORD *)(result + 56);
  *(_QWORD *)(*(_QWORD *)(result + 32) + 352) = *(_QWORD *)(result + 48);
  *(_BYTE *)(*(_QWORD *)(result + 32) + 17) = *(_BYTE *)(result + 64);
  *(_QWORD *)(*(_QWORD *)(result + 32) + 368) = v1;
  return result;
}

void __82__CSHybridEndpointer_shouldAcceptEagerResultForDuration_resultsCompletionHandler___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 160));
}

uint64_t __82__CSHybridEndpointer_shouldAcceptEagerResultForDuration_resultsCompletionHandler___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_shouldAcceptEagerResultForDuration:asrFeatures:lastReportedEndpointTimeMs:osdFeatures:resultsCompletionHandler:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 128), *(_QWORD *)(a1 + 40), *(double *)(a1 + 56), *(double *)(*(_QWORD *)(a1 + 32) + 264));
}

uint64_t __104__CSHybridEndpointer_shouldAcceptEagerResultForDuration_withEndpointerMetrics_resultsCompletionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_shouldAcceptEagerResultForDuration:asrFeatures:lastReportedEndpointTimeMs:osdFeatures:resultsCompletionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
}

uint64_t __83__CSHybridEndpointer_shouldAcceptEagerResultForDurationSync_withEndpointerMetrics___block_invoke(double *a1)
{
  uint64_t v1;
  void *v2;
  double v3;
  double v4;
  uint64_t v5;
  _QWORD v7[5];

  v2 = (void *)*((_QWORD *)a1 + 4);
  v1 = *((_QWORD *)a1 + 5);
  v3 = a1[8];
  v4 = a1[9];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __83__CSHybridEndpointer_shouldAcceptEagerResultForDurationSync_withEndpointerMetrics___block_invoke_2;
  v7[3] = &unk_1E7C26AB8;
  v5 = *((_QWORD *)a1 + 6);
  *(double *)&v7[4] = a1[7];
  return objc_msgSend(v2, "_shouldAcceptEagerResultForDuration:asrFeatures:lastReportedEndpointTimeMs:osdFeatures:resultsCompletionHandler:", v1, v5, v7, v3, v4);
}

uint64_t __83__CSHybridEndpointer_shouldAcceptEagerResultForDurationSync_withEndpointerMetrics___block_invoke_2(uint64_t result, int a2)
{
  if (a2)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 1;
  return result;
}

void __59__CSHybridEndpointer__processEnhancedEndpointerTaskString___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  int v7;
  void *v8;
  int v9;
  void *v10;
  int v11;
  float v12;
  uint64_t v13;
  float v14;
  uint64_t v15;
  NSObject *v16;
  id v17;
  uint8_t buf[4];
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1[4] + 408);
  if (v2)
  {
    objc_msgSend(v2, "objectForKey:", a1[5]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v17 = v3;
      objc_msgSend(v3, "objectForKey:", CFSTR("default-threshold-partial"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "floatValue");
      *(_DWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = v5;

      objc_msgSend(v17, "objectForKey:", CFSTR("default-threshold-rc"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "floatValue");
      *(_DWORD *)(*(_QWORD *)(a1[7] + 8) + 24) = v7;

      objc_msgSend(v17, "objectForKey:", CFSTR("relaxed-threshold-partial"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "floatValue");
      *(_DWORD *)(*(_QWORD *)(a1[8] + 8) + 24) = v9;

      objc_msgSend(v17, "objectForKey:", CFSTR("relaxed-threshold-rc"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "floatValue");
      *(_DWORD *)(*(_QWORD *)(a1[9] + 8) + 24) = v11;

      v12 = *(float *)(*(_QWORD *)(a1[6] + 8) + 24);
      if (v12 > 0.0)
      {
        v13 = *(_QWORD *)(a1[8] + 8);
        if (*(float *)(v13 + 24) == 0.0)
          *(float *)(v13 + 24) = v12;
      }
      v14 = *(float *)(*(_QWORD *)(a1[7] + 8) + 24);
      v3 = v17;
      if (v14 > 0.0)
      {
        v15 = *(_QWORD *)(a1[9] + 8);
        if (*(float *)(v15 + 24) == 0.0)
          *(float *)(v15 + 24) = v14;
      }
    }

  }
  else
  {
    v16 = *MEMORY[0x1E0D18F40];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F40], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v19 = "-[CSHybridEndpointer _processEnhancedEndpointerTaskString:]_block_invoke";
      _os_log_error_impl(&dword_1C2614000, v16, OS_LOG_TYPE_ERROR, "%s No enhancedEndpointerTaskThresholdMap was found in csHepConfig", buf, 0xCu);
    }
  }
}

void __40__CSHybridEndpointer_processTaskString___block_invoke(uint64_t a1)
{
  os_log_t *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  _QWORD block[5];
  id v14;
  _BYTE *v15;
  uint8_t v16[4];
  const char *v17;
  __int16 v18;
  double v19;
  __int16 v20;
  uint64_t v21;
  _BYTE buf[24];
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v2 = (os_log_t *)MEMORY[0x1E0D18F40];
  v3 = *MEMORY[0x1E0D18F40];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F40], OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "-[CSHybridEndpointer processTaskString:]_block_invoke";
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v4;
    _os_log_impl(&dword_1C2614000, v3, OS_LOG_TYPE_DEFAULT, "%s %{public}@", buf, 0x16u);
  }
  if (*(_QWORD *)(a1 + 32))
  {
    if (objc_msgSend(*(id *)(a1 + 40), "_useEnhancedEndpointer"))
    {
      objc_msgSend(*(id *)(a1 + 40), "_processEnhancedEndpointerTaskString:", *(_QWORD *)(a1 + 32));
    }
    else
    {
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x2020000000;
      v23 = 0;
      block[0] = MEMORY[0x1E0C809B0];
      block[2] = __40__CSHybridEndpointer_processTaskString___block_invoke_260;
      block[3] = &unk_1E7C277D0;
      v6 = *(void **)(a1 + 32);
      v5 = *(_QWORD *)(a1 + 40);
      v7 = *(NSObject **)(v5 + 152);
      block[1] = 3221225472;
      block[4] = v5;
      v14 = v6;
      v15 = buf;
      dispatch_async_and_wait(v7, block);
      if (*(float *)(*(_QWORD *)&buf[8] + 24) > 0.0)
      {
        objc_msgSend(*(id *)(a1 + 40), "updateEndpointerThreshold:");
        v8 = *v2;
        if (os_log_type_enabled(*v2, OS_LOG_TYPE_DEFAULT))
        {
          v9 = *(float *)(*(_QWORD *)&buf[8] + 24);
          v10 = *(_QWORD *)(a1 + 32);
          *(_DWORD *)v16 = 136315650;
          v17 = "-[CSHybridEndpointer processTaskString:]_block_invoke_2";
          v18 = 2050;
          v19 = v9;
          v20 = 2114;
          v21 = v10;
          _os_log_impl(&dword_1C2614000, v8, OS_LOG_TYPE_DEFAULT, "%s update endpointer threshold to %{public}f for task %{public}@", v16, 0x20u);
        }
      }

      _Block_object_dispose(buf, 8);
    }
    if ((objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("accessible-maximum")) & 1) != 0
      || objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("accessible-extended")))
    {
      v11 = *(_QWORD *)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "mhId");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[CSEndpointLoggingHelper reportMHEndpointerAccessibleContextEventWithThresholdType:MhId:](CSEndpointLoggingHelper, "reportMHEndpointerAccessibleContextEventWithThresholdType:MhId:", v11, v12);

    }
  }
}

void __40__CSHybridEndpointer_processTaskString___block_invoke_260(_QWORD *a1)
{
  void *v2;
  void *v3;
  int v4;
  id v5;

  v2 = *(void **)(a1[4] + 248);
  if (v2)
  {
    objc_msgSend(v2, "objectForKeyedSubscript:", a1[5]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      objc_msgSend(*(id *)(a1[4] + 248), "objectForKeyedSubscript:", a1[5]);
      v5 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "floatValue");
      *(_DWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = v4;

    }
  }
}

double __52__CSHybridEndpointer_processASRFeatures_fromServer___block_invoke(uint64_t a1)
{
  double result;

  result = *(double *)(*(_QWORD *)(a1 + 32) + 312);
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

void __52__CSHybridEndpointer_processASRFeatures_fromServer___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  int v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  int v11;
  const char *v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 19) = *(_BYTE *)(a1 + 48);
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 11) = 1;
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 160), *(id *)(a1 + 40));
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timeIntervalSinceDate:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 216));
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 192) = v3;
  v4 = *(_QWORD *)(a1 + 32);
  if (*(double *)(v4 + 208) >= 0.0)
  {
    v7 = *(void **)(v4 + 184);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v8);

  }
  else
  {
    *(_QWORD *)(v4 + 208) = v3;
    v5 = *MEMORY[0x1E0D18F40];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F40], OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 19);
      v11 = 136315394;
      v12 = "-[CSHybridEndpointer processASRFeatures:fromServer:]_block_invoke_2";
      v13 = 1026;
      v14 = v6;
      _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_DEFAULT, "%s isASRFeatureFromServer = %{public}d", (uint8_t *)&v11, 0x12u);
    }
  }
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(void **)(v9 + 216);
  *(_QWORD *)(v9 + 216) = v2;

}

void __57__CSHybridEndpointer_fetchCurrentEndpointerOperationMode__block_invoke(uint64_t a1)
{
  void *v1;
  NSObject *v2;
  void *v3;
  int v4;
  const char *v5;
  __int16 v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 384);
  v1 = (void *)*MEMORY[0x1E0D18F40];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F40], OS_LOG_TYPE_DEFAULT))
  {
    v2 = v1;
    AFSpeechEndpointerOperationModeGetName();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = 136315394;
    v5 = "-[CSHybridEndpointer fetchCurrentEndpointerOperationMode]_block_invoke";
    v6 = 2114;
    v7 = v3;
    _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s current EndpointerOperationMode : %{public}@", (uint8_t *)&v4, 0x16u);

  }
}

void __49__CSHybridEndpointer_setEndpointerOperationMode___block_invoke(uint64_t a1)
{
  void *v2;
  os_log_t *v3;
  NSObject *v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  AFSpeechEndpointerOperationModeGetName();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (os_log_t *)MEMORY[0x1E0D18F40];
  v4 = *MEMORY[0x1E0D18F40];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F40], OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315394;
    v7 = "-[CSHybridEndpointer setEndpointerOperationMode:]_block_invoke";
    v8 = 2114;
    v9 = v2;
    _os_log_impl(&dword_1C2614000, v4, OS_LOG_TYPE_DEFAULT, "%s setEndpointerOperationMode : %{public}@", (uint8_t *)&v6, 0x16u);
  }
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 384) = *(_QWORD *)(a1 + 40);
  if (*(_QWORD *)(a1 + 40) == 1)
  {
    v5 = *v3;
    if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 136315394;
      v7 = "-[CSHybridEndpointer setEndpointerOperationMode:]_block_invoke";
      v8 = 2112;
      v9 = v2;
      _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_DEFAULT, "%s endpointerOperationMode has been set to %@, stopping endpointer", (uint8_t *)&v6, 0x16u);
    }
    objc_msgSend(*(id *)(a1 + 32), "stopEndpointer");
  }

}

void __53__CSHybridEndpointer_updateEndpointerDelayedTrigger___block_invoke(uint64_t a1)
{
  NSObject *v2;
  int v3;
  int v4;
  const char *v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "updateEndpointerDelayedTriggerSwitch:", *(unsigned __int8 *)(a1 + 40));
  if (objc_msgSend(*(id *)(a1 + 32), "_useEnhancedEndpointer"))
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 392), "updateDelayedTriggerSwitch:", *(unsigned __int8 *)(a1 + 40));
  v2 = *MEMORY[0x1E0D18F40];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F40], OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(unsigned __int8 *)(a1 + 40);
    v4 = 136315394;
    v5 = "-[CSHybridEndpointer updateEndpointerDelayedTrigger:]_block_invoke";
    v6 = 1026;
    v7 = v3;
    _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s Updated endpointer delayed trigger: %{public}d", (uint8_t *)&v4, 0x12u);
  }
}

uint64_t __60__CSHybridEndpointer__updateEndpointerDelayedTriggerByMhId___block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 240);
  return result;
}

double __132__CSHybridEndpointer_updateEnhancedEndpointerDefaultThresholdPartial_defaultThresholdRC_relaxedThresholdPartial_relaxedThresholdRC___block_invoke(uint64_t a1, double a2, double a3, double a4, double a5)
{
  NSObject *v6;
  double result;
  double v8;
  double v9;
  double v10;
  double v11;
  int v12;
  const char *v13;
  __int16 v14;
  double v15;
  __int16 v16;
  double v17;
  __int16 v18;
  double v19;
  __int16 v20;
  double v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  LODWORD(a2) = *(_DWORD *)(a1 + 40);
  LODWORD(a3) = *(_DWORD *)(a1 + 44);
  LODWORD(a4) = *(_DWORD *)(a1 + 48);
  LODWORD(a5) = *(_DWORD *)(a1 + 52);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 392), "updateDefaultThresholdPartial:defaultThresholdRC:relaxedThresholdPartial:relaxedThresholdRC:", a2, a3, a4, a5);
  v6 = *MEMORY[0x1E0D18F40];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F40], OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(float *)(a1 + 40);
    v9 = *(float *)(a1 + 44);
    v10 = *(float *)(a1 + 48);
    v11 = *(float *)(a1 + 52);
    v12 = 136316162;
    v13 = "-[CSHybridEndpointer updateEnhancedEndpointerDefaultThresholdPartial:defaultThresholdRC:relaxedThresholdPartia"
          "l:relaxedThresholdRC:]_block_invoke";
    v14 = 2050;
    v15 = v8;
    v16 = 2050;
    v17 = v9;
    v18 = 2050;
    v19 = v10;
    v20 = 2050;
    v21 = v11;
    _os_log_impl(&dword_1C2614000, v6, OS_LOG_TYPE_DEFAULT, "%s Updated enhanced endpointer defaultThresholdPartial: %{public}f, defaultThresholdRC: %{public}f, relaxedThresholdPartial: %{public}f, relaxedThresholdRC: %{public}f", (uint8_t *)&v12, 0x34u);
  }
  return result;
}

double __48__CSHybridEndpointer_updateEndpointerThreshold___block_invoke(uint64_t a1, double a2)
{
  NSObject *v3;
  double result;
  double v5;
  int v6;
  const char *v7;
  __int16 v8;
  double v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  LODWORD(a2) = *(_DWORD *)(a1 + 40);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "updateEndpointerThresholdWithValue:", a2);
  v3 = *MEMORY[0x1E0D18F40];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F40], OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(float *)(a1 + 40);
    v6 = 136315394;
    v7 = "-[CSHybridEndpointer updateEndpointerThreshold:]_block_invoke";
    v8 = 2050;
    v9 = v5;
    _os_log_impl(&dword_1C2614000, v3, OS_LOG_TYPE_DEFAULT, "%s Updated endpointer threshold: %{public}f", (uint8_t *)&v6, 0x16u);
  }
  return result;
}

void __44__CSHybridEndpointer_endpointerModelVersion__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint8_t buf[4];
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD **)(a1 + 32);
  if (v2[15]
    || (+[CSEndpointerAssetManager sharedManager](CSEndpointerAssetManager, "sharedManager"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v3, "getCurrentEndpointerAsset"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v2, "_updateCurrentAsset:", v4),
        v4,
        v3,
        *(_QWORD *)(*(_QWORD *)(a1 + 32) + 120)))
  {
    v5 = objc_alloc(MEMORY[0x1E0D1F130]);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "path");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0;
    v7 = (void *)objc_msgSend(v5, "initWithConfiguration:modelVersion:", v6, &v13);
    v8 = v13;

    if (!v8)
    {
      objc_msgSend(MEMORY[0x1E0D190B8], "sharedInstance");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "submitEndpointerIssueReport:", *MEMORY[0x1E0D19330]);

      v10 = *MEMORY[0x1E0D18F40];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F40], OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        v15 = "-[CSHybridEndpointer endpointerModelVersion]_block_invoke";
        _os_log_fault_impl(&dword_1C2614000, v10, OS_LOG_TYPE_FAULT, "%s endpointerModelVersion is still nil after fetching it from EAREndpointer", buf, 0xCu);
      }
    }
    v11 = *(_QWORD *)(a1 + 32);
    v12 = *(void **)(v11 + 144);
    *(_QWORD *)(v11 + 144) = v8;

  }
}

void __26__CSHybridEndpointer_init__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  +[CSEndpointerAssetManager sharedManager](CSEndpointerAssetManager, "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObserver:", *(_QWORD *)(a1 + 32));

  if (objc_msgSend(MEMORY[0x1E0D19260], "isMedocFeatureEnabled"))
  {
    v3 = *(void **)(a1 + 32);
    +[CSEndpointerAssetManager sharedManager](CSEndpointerAssetManager, "sharedManager");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "getCurrentEndpointerAsset");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_updateCurrentAsset:", v4);

  }
}

@end
