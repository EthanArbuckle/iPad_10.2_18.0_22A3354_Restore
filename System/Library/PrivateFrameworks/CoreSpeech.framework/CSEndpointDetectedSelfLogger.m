@implementation CSEndpointDetectedSelfLogger

- (CSEndpointDetectedSelfLogger)init
{
  CSEndpointDetectedSelfLogger *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *queue;
  uint64_t v5;
  CSSiriClientBehaviorMonitor *siriClientBehaviorMonitor;
  CSEndpointerMetrics *cachedRelaxedEndpointerMetrics;
  NSObject *v8;
  objc_super v10;
  uint8_t buf[4];
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v10.receiver = self;
  v10.super_class = (Class)CSEndpointDetectedSelfLogger;
  v2 = -[CSEndpointDetectedSelfLogger init](&v10, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("CSEndpointDetectedSelfLogger queue", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    *(_WORD *)&v2->_localSRDisabled = 0;
    objc_msgSend(MEMORY[0x1E0D191F0], "sharedInstance");
    v5 = objc_claimAutoreleasedReturnValue();
    siriClientBehaviorMonitor = v2->_siriClientBehaviorMonitor;
    v2->_siriClientBehaviorMonitor = (CSSiriClientBehaviorMonitor *)v5;

    cachedRelaxedEndpointerMetrics = v2->_cachedRelaxedEndpointerMetrics;
    v2->_cachedRelaxedEndpointerMetrics = 0;

  }
  v8 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v12 = "-[CSEndpointDetectedSelfLogger init]";
    _os_log_impl(&dword_1C2614000, v8, OS_LOG_TYPE_DEFAULT, "%s Created CSEndpointDetectedSelfLogger", buf, 0xCu);
  }
  return v2;
}

- (void)setup
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__CSEndpointDetectedSelfLogger_setup__block_invoke;
  block[3] = &unk_1E7C292C8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)registerEndpointerNode:(id)a3
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
  v7[2] = __55__CSEndpointDetectedSelfLogger_registerEndpointerNode___block_invoke;
  v7[3] = &unk_1E7C292A0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)reset
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__CSEndpointDetectedSelfLogger_reset__block_invoke;
  block[3] = &unk_1E7C292C8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)attSiriNode:(id)a3 didDetectHardEndpointAtTime:(double)a4 withMetrics:(id)a5 usesAutomaticEndPointing:(BOOL)a6
{
  id v7;
  NSObject *queue;
  id v9;
  _QWORD v10[5];
  id v11;

  v7 = a5;
  queue = self->_queue;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __109__CSEndpointDetectedSelfLogger_attSiriNode_didDetectHardEndpointAtTime_withMetrics_usesAutomaticEndPointing___block_invoke;
  v10[3] = &unk_1E7C292A0;
  v10[4] = self;
  v11 = v7;
  v9 = v7;
  dispatch_async(queue, v10);

}

- (void)attSiriNode:(id)a3 didDetectEndpointEventAtTime:(double)a4 eventType:(int64_t)a5 withMetrics:(id)a6 useEndpointerSignal:(BOOL)a7
{
  id v9;
  NSObject *queue;
  id v11;
  _QWORD block[5];
  id v13;
  int64_t v14;

  v9 = a6;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __115__CSEndpointDetectedSelfLogger_attSiriNode_didDetectEndpointEventAtTime_eventType_withMetrics_useEndpointerSignal___block_invoke;
  block[3] = &unk_1E7C28B58;
  v13 = v9;
  v14 = a5;
  block[4] = self;
  v11 = v9;
  dispatch_async(queue, block);

}

- (void)attSiriNode:(id)a3 selectedTRPId:(id)a4 withMetrics:(id)a5
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
  block[2] = __70__CSEndpointDetectedSelfLogger_attSiriNode_selectedTRPId_withMetrics___block_invoke;
  block[3] = &unk_1E7C291C0;
  block[4] = self;
  v13 = v8;
  v14 = v7;
  v10 = v7;
  v11 = v8;
  dispatch_async(queue, block);

}

- (void)didCompleteRecognitionTaskWithStatistics:(id)a3 requestId:(id)a4 endpointMode:(int64_t)a5 error:(id)a6
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __102__CSEndpointDetectedSelfLogger_didCompleteRecognitionTaskWithStatistics_requestId_endpointMode_error___block_invoke;
  block[3] = &unk_1E7C292C8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)siriClientBehaviorMonitor:(id)a3 willStartStreamWithContext:(id)a4 option:(id)a5
{
  id v6;
  NSObject *queue;
  id v8;
  _QWORD v9[5];
  id v10;

  v6 = a5;
  queue = self->_queue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __92__CSEndpointDetectedSelfLogger_siriClientBehaviorMonitor_willStartStreamWithContext_option___block_invoke;
  v9[3] = &unk_1E7C292A0;
  v9[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(queue, v9);

}

- (void)siriClientBehaviorMonitor:(id)a3 didStartStreamWithContext:(id)a4 successfully:(BOOL)a5 option:(id)a6 withEventUUID:(id)a7
{
  id v8;
  NSObject *queue;
  id v10;
  _QWORD v11[5];
  id v12;

  v8 = a6;
  queue = self->_queue;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __118__CSEndpointDetectedSelfLogger_siriClientBehaviorMonitor_didStartStreamWithContext_successfully_option_withEventUUID___block_invoke;
  v11[3] = &unk_1E7C292A0;
  v11[4] = self;
  v12 = v8;
  v10 = v8;
  dispatch_async(queue, v11);

}

- (NSString)mhId
{
  return self->_mhId;
}

- (void)setMhId:(id)a3
{
  objc_storeStrong((id *)&self->_mhId, a3);
}

- (CSAttSiriEndpointerNode)endpointerNode
{
  return (CSAttSiriEndpointerNode *)objc_loadWeakRetained((id *)&self->_endpointerNode);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (BOOL)localSRDisabled
{
  return self->_localSRDisabled;
}

- (void)setLocalSRDisabled:(BOOL)a3
{
  self->_localSRDisabled = a3;
}

- (BOOL)trpDetectDelivered
{
  return self->_trpDetectDelivered;
}

- (void)setTrpDetectDelivered:(BOOL)a3
{
  self->_trpDetectDelivered = a3;
}

- (CSSiriClientBehaviorMonitor)siriClientBehaviorMonitor
{
  return self->_siriClientBehaviorMonitor;
}

- (void)setSiriClientBehaviorMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_siriClientBehaviorMonitor, a3);
}

- (CSEndpointerMetrics)cachedRelaxedEndpointerMetrics
{
  return self->_cachedRelaxedEndpointerMetrics;
}

- (void)setCachedRelaxedEndpointerMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_cachedRelaxedEndpointerMetrics, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedRelaxedEndpointerMetrics, 0);
  objc_storeStrong((id *)&self->_siriClientBehaviorMonitor, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_endpointerNode);
  objc_storeStrong((id *)&self->_mhId, 0);
}

uint64_t __118__CSEndpointDetectedSelfLogger_siriClientBehaviorMonitor_didStartStreamWithContext_successfully_option_withEventUUID___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t result;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[CSEndpointDetectedSelfLogger siriClientBehaviorMonitor:didStartStreamWithContext:successfully:option:withEven"
         "tUUID:]_block_invoke";
    _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v4, 0xCu);
  }
  result = objc_msgSend(*(id *)(a1 + 40), "disableLocalSpeechRecognizer");
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = result;
  return result;
}

uint64_t __92__CSEndpointDetectedSelfLogger_siriClientBehaviorMonitor_willStartStreamWithContext_option___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t result;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[CSEndpointDetectedSelfLogger siriClientBehaviorMonitor:willStartStreamWithContext:option:]_block_invoke";
    _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v4, 0xCu);
  }
  result = objc_msgSend(*(id *)(a1 + 40), "disableLocalSpeechRecognizer");
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = result;
  return result;
}

void __102__CSEndpointDetectedSelfLogger_didCompleteRecognitionTaskWithStatistics_requestId_endpointMode_error___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[CSEndpointDetectedSelfLogger didCompleteRecognitionTaskWithStatistics:requestId:endpointMode:error:]_block_invoke";
    _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v4, 0xCu);
  }
  v3 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v3 + 48))
  {
    if (!*(_BYTE *)(v3 + 9))
      +[CSEndpointDetectedSelfLogger emitEndpointDetectedEventWithEndpointerMetrics:withEndpointerModelType:withTrpId:withMhID:](CSEndpointDetectedSelfLogger, "emitEndpointDetectedEventWithEndpointerMetrics:withEndpointerModelType:withTrpId:withMhID:");
  }
}

void __70__CSEndpointDetectedSelfLogger_attSiriNode_selectedTRPId_withMetrics___block_invoke(_QWORD *a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[CSEndpointDetectedSelfLogger attSiriNode:selectedTRPId:withMetrics:]_block_invoke";
    _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v4, 0xCu);
  }
  v3 = a1[4];
  if (!*(_BYTE *)(v3 + 9))
  {
    *(_BYTE *)(v3 + 9) = 1;
    +[CSEndpointDetectedSelfLogger emitEndpointDetectedEventWithEndpointerMetrics:withEndpointerModelType:withTrpId:withMhID:](CSEndpointDetectedSelfLogger, "emitEndpointDetectedEventWithEndpointerMetrics:withEndpointerModelType:withTrpId:withMhID:", a1[5], 1, a1[6], *(_QWORD *)(a1[4] + 16));
  }
}

void __115__CSEndpointDetectedSelfLogger_attSiriNode_didDetectEndpointEventAtTime_eventType_withMetrics_useEndpointerSignal___block_invoke(uint64_t a1)
{
  NSObject *v2;
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v3 = 136315138;
    v4 = "-[CSEndpointDetectedSelfLogger attSiriNode:didDetectEndpointEventAtTime:eventType:withMetrics:useEndpointerSign"
         "al:]_block_invoke";
    _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v3, 0xCu);
  }
  if (*(_QWORD *)(a1 + 48) == 2)
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 48), *(id *)(a1 + 40));
}

void __109__CSEndpointDetectedSelfLogger_attSiriNode_didDetectHardEndpointAtTime_withMetrics_usesAutomaticEndPointing___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[CSEndpointDetectedSelfLogger attSiriNode:didDetectHardEndpointAtTime:withMetrics:usesAutomaticEndPointing:]_block_invoke";
    _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v4, 0xCu);
  }
  v3 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v3 + 8))
    +[CSEndpointDetectedSelfLogger emitEndpointDetectedEventWithEndpointerMetrics:withEndpointerModelType:withTrpId:withMhID:](CSEndpointDetectedSelfLogger, "emitEndpointDetectedEventWithEndpointerMetrics:withEndpointerModelType:withTrpId:withMhID:", *(_QWORD *)(a1 + 40), 1, 0, *(_QWORD *)(v3 + 16));
}

void __37__CSEndpointDetectedSelfLogger_reset__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[CSEndpointDetectedSelfLogger reset]_block_invoke";
    _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v5, 0xCu);
  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 9) = 0;
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 48);
  *(_QWORD *)(v3 + 48) = 0;

}

id __55__CSEndpointDetectedSelfLogger_registerEndpointerNode___block_invoke(uint64_t a1)
{
  NSObject *v2;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[CSEndpointDetectedSelfLogger registerEndpointerNode:]_block_invoke";
    _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v4, 0xCu);
  }
  return objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 24), *(id *)(a1 + 40));
}

uint64_t __37__CSEndpointDetectedSelfLogger_setup__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "registerObserver:");
}

+ (void)emitEndpointDetectedEventWithEndpointerMetrics:(id)a3 withEndpointerModelType:(int64_t)a4 withTrpId:(id)a5 withMhID:(id)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  uint64_t v16;
  double v17;
  double v18;
  double v19;
  double v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  unint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  double v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  double v39;
  double v40;
  void *v41;
  double v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  NSObject *v48;
  unsigned int v49;
  unint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  uint8_t buf[4];
  const char *v56;
  __int16 v57;
  void *v58;
  __int16 v59;
  void *v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v12 = a6;
  objc_msgSend(v10, "featuresAtEndpoint");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = objc_alloc_init(MEMORY[0x1E0D99A98]);
  v53 = (void *)v13;
  v50 = a4;
  objc_msgSend(a1, "_decodeFeaturesAtEndpoint:endpointerModelType:", v13, a4);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setEndpointFeaturesAtEndpoint:");
  v15 = objc_alloc_init(MEMORY[0x1E0D99AB8]);
  objc_msgSend(v15, "setIsTimeout:", objc_msgSend(v10, "isRequestTimeOut"));
  v51 = v15;
  objc_msgSend(v14, "setTimeoutMetadata:", v15);
  v16 = objc_msgSend(v10, "firstAudioSampleSensorTimestamp");
  objc_msgSend(v10, "blkHepAudioOrigin");
  v18 = v17;
  objc_msgSend(v10, "vtExtraAudioAtStartInMs");
  v20 = v19;
  v49 = objc_msgSend(v10, "isAnchorTimeBuffered");
  v21 = objc_alloc_init(MEMORY[0x1E0D9A508]);
  objc_msgSend(v10, "assetConfigVersion");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "componentsSeparatedByString:", CFSTR("."));
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v23, "count") == 2)
  {
    objc_msgSend(v23, "objectAtIndexedSubscript:", 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setMajor:", objc_msgSend(v24, "intValue"));

    objc_msgSend(v23, "objectAtIndexedSubscript:", 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setMinor:", objc_msgSend(v25, "intValue"));

  }
  v54 = v12;
  objc_msgSend(v14, "setEndpointModelConfigVersion:", v21);
  v26 = objc_msgSend(v10, "endpointerType");
  v27 = v11;
  if (v26 > 4)
    v28 = 0;
  else
    v28 = dword_1C276CC80[v26];
  objc_msgSend(v14, "setEndpointerType:", v28);
  objc_msgSend(v10, "asrFeatureLatencyDistribution");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  +[CSEndpointLoggingHelper getMHStatisticDistributionInfoFromDictionary:withScaleFactor:](CSEndpointLoggingHelper, "getMHStatisticDistributionInfoFromDictionary:withScaleFactor:", v29, 1000.0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  v31 = (void *)MEMORY[0x1E0D19118];
  objc_msgSend(v10, "totalAudioRecorded");
  *(float *)&v32 = v32;
  objc_msgSend(v14, "setEndpointAudioDurationInNs:", objc_msgSend(v31, "millisecondsToNs:", v32));
  objc_msgSend(v14, "setFirstBufferTimeInNs:", objc_msgSend(MEMORY[0x1E0D19118], "hostTimeToNs:", v16));
  objc_msgSend(v14, "setEndpointedBufferTimeInNs:", objc_msgSend(MEMORY[0x1E0D19118], "hostTimeToNs:", objc_msgSend(v10, "endpointBufferHostTime")));
  v33 = (void *)MEMORY[0x1E0D19118];
  objc_msgSend(v10, "additionalMetrics");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "objectForKey:", CFSTR("EndpointerDecisionLagMs"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "floatValue");
  objc_msgSend(v14, "setEndpointerDecisionLagInNs:", objc_msgSend(v33, "millisecondsToNs:"));

  v36 = (void *)MEMORY[0x1E0D19118];
  objc_msgSend(v10, "additionalMetrics");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "objectForKey:", CFSTR("ExtraDelayMs"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "floatValue");
  objc_msgSend(v14, "setExtraDelayInNs:", objc_msgSend(v36, "millisecondsToNs:"));

  objc_msgSend(v14, "setDerivedBufferTimeFromHistoricalAudio:", v49);
  *(float *)&v39 = v20;
  objc_msgSend(v14, "setAudioSkippedDurationInNs:", objc_msgSend(MEMORY[0x1E0D19118], "millisecondsToNs:", v39));
  *(float *)&v40 = v18;
  objc_msgSend(v14, "setEndpointResetPositionInNs:", objc_msgSend(MEMORY[0x1E0D19118], "millisecondsToNs:", v40));
  objc_msgSend(v10, "osdFeaturesAtEndpoint");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "silenceProbability");
  *(float *)&v42 = v42;
  objc_msgSend(v14, "setEndpointerScore:", v42);

  objc_msgSend(v14, "setAsrFeatureLatencyDistribution:", v30);
  if (v27)
  {
    v43 = objc_alloc(MEMORY[0x1E0D9A500]);
    v44 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v27);
    v45 = (void *)objc_msgSend(v43, "initWithNSUUID:", v44);
    objc_msgSend(v14, "setTrpId:", v45);

  }
  if (v50 <= 2)
    objc_msgSend(v14, "setTrpDetectionType:");
  +[CSEndpointLoggingHelper getMHClientEventByMhUUID:](CSEndpointLoggingHelper, "getMHClientEventByMhUUID:", v54);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "setEndpointDetected:", v14);
  objc_msgSend(MEMORY[0x1E0D97898], "sharedStream");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "emitMessage:", v46);

  v48 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v56 = "+[CSEndpointDetectedSelfLogger emitEndpointDetectedEventWithEndpointerMetrics:withEndpointerModelType:withTrpId:withMhID:]";
    v57 = 2112;
    v58 = v54;
    v59 = 2112;
    v60 = v27;
    _os_log_impl(&dword_1C2614000, v48, OS_LOG_TYPE_DEFAULT, "%s Submit MHEndpointDetectedEvent to SELF for MH ID: %@, TRP ID: %@", buf, 0x20u);
  }

}

+ (id)_decodeFeaturesAtEndpoint:(id)a3 endpointerModelType:(int64_t)a4
{
  id v5;
  unint64_t v6;
  unint64_t v7;
  NSObject **v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  int v16;
  void *v17;
  int v18;
  int v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  int v26;
  int v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  int v32;
  int v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  int v40;
  int v41;
  void *v42;
  int v43;
  void *v44;
  int v45;
  int v46;
  id v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  NSObject *v54;
  int v56;
  const char *v57;
  __int16 v58;
  uint64_t v59;
  __int16 v60;
  uint64_t v61;
  __int16 v62;
  uint64_t v63;
  __int16 v64;
  uint64_t v65;
  __int16 v66;
  unint64_t v67;
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = objc_msgSend(v5, "count");
  v7 = v6;
  if ((unint64_t)(a4 - 1) >= 2)
  {
    if (!a4 && (v6 & 0xFFFFFFFFFFFFFFFBLL) != 2)
    {
      v54 = *MEMORY[0x1E0D18F60];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
      {
        v56 = 136315906;
        v57 = "+[CSEndpointDetectedSelfLogger _decodeFeaturesAtEndpoint:endpointerModelType:]";
        v58 = 2048;
        v59 = 6;
        v60 = 2048;
        v61 = 2;
        v62 = 2048;
        v63 = v7;
        _os_log_error_impl(&dword_1C2614000, v54, OS_LOG_TYPE_ERROR, "%s Legacy endpointer feature count should always be %lu or %lu (timeout case), instead got %lu", (uint8_t *)&v56, 0x2Au);
      }
      goto LABEL_20;
    }
  }
  else if (v6 > 0xD || ((1 << v6) & 0x2844) == 0)
  {
    v8 = (NSObject **)MEMORY[0x1E0D18F60];
    v9 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
    {
      v56 = 136316418;
      v57 = "+[CSEndpointDetectedSelfLogger _decodeFeaturesAtEndpoint:endpointerModelType:]";
      v58 = 2048;
      v59 = 6;
      v60 = 2048;
      v61 = 2;
      v62 = 2048;
      v63 = 11;
      v64 = 2048;
      v65 = 13;
      v66 = 2048;
      v67 = v7;
      _os_log_error_impl(&dword_1C2614000, v9, OS_LOG_TYPE_ERROR, "%s Endpointer feature count should always be %lu, %lu (timeout case), %lu (EEP), or %lu (AEP), instead got %lu", (uint8_t *)&v56, 0x3Eu);
      v9 = *v8;
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v56 = 136315394;
      v57 = "+[CSEndpointDetectedSelfLogger _decodeFeaturesAtEndpoint:endpointerModelType:]";
      v58 = 2112;
      v59 = (uint64_t)v5;
      _os_log_impl(&dword_1C2614000, v9, OS_LOG_TYPE_DEFAULT, "%s %@", (uint8_t *)&v56, 0x16u);
    }
LABEL_20:
    v47 = 0;
    goto LABEL_21;
  }
  v10 = (void *)MEMORY[0x1E0D19118];
  objc_msgSend(v5, "objectAtIndex:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "floatValue");
  v12 = objc_msgSend(v10, "millisecondsToNs:");

  v13 = (void *)MEMORY[0x1E0D19118];
  objc_msgSend(v5, "objectAtIndex:", 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "floatValue");
  v15 = objc_msgSend(v13, "millisecondsToNs:");

  v16 = 0;
  if (v7 < 6)
  {
    v38 = 0;
    v30 = 0;
    v35 = 0;
    v21 = 0;
    v24 = 0;
    v41 = 0;
    v33 = 0;
    v19 = 0;
    v27 = 0;
    goto LABEL_16;
  }
  objc_msgSend(v5, "objectAtIndex:", 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "floatValue");
  v19 = v18;

  objc_msgSend(v5, "objectAtIndex:", 3);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "intValue");

  v22 = (void *)MEMORY[0x1E0D19118];
  objc_msgSend(v5, "objectAtIndex:", 4);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "floatValue");
  v24 = objc_msgSend(v22, "millisecondsToNs:");

  objc_msgSend(v5, "objectAtIndex:", 5);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "floatValue");
  v27 = v26;

  if (v7 < 0xB)
  {
    v38 = 0;
    v30 = 0;
    v35 = 0;
    v41 = 0;
    v33 = 0;
    goto LABEL_16;
  }
  v28 = (void *)MEMORY[0x1E0D19118];
  objc_msgSend(v5, "objectAtIndex:", 6);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "floatValue");
  v30 = objc_msgSend(v28, "millisecondsToNs:");

  objc_msgSend(v5, "objectAtIndex:", 7);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "floatValue");
  v33 = v32;

  objc_msgSend(v5, "objectAtIndex:", 8);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v34, "intValue");

  v36 = (void *)MEMORY[0x1E0D19118];
  objc_msgSend(v5, "objectAtIndex:", 9);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "floatValue");
  v38 = objc_msgSend(v36, "millisecondsToNs:");

  objc_msgSend(v5, "objectAtIndex:", 10);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "floatValue");
  v41 = v40;

  if (v7 != 13)
  {
LABEL_16:
    v46 = 0;
    goto LABEL_17;
  }
  objc_msgSend(v5, "objectAtIndex:", 11);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "floatValue");
  v16 = v43;

  objc_msgSend(v5, "objectAtIndex:", 12);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "floatValue");
  v46 = v45;

LABEL_17:
  v47 = objc_alloc_init(MEMORY[0x1E0D99AA0]);
  objc_msgSend(v47, "setWordCount:", v21);
  objc_msgSend(v47, "setTrailingSilenceDurationInNs:", v12);
  LODWORD(v48) = v19;
  objc_msgSend(v47, "setEndOfSentenceLikelihood:", v48);
  objc_msgSend(v47, "setClientSilenceFramesCountInNs:", v15);
  objc_msgSend(v47, "setServerFeaturesLatencyInNs:", v24);
  LODWORD(v49) = v27;
  objc_msgSend(v47, "setClientSilenceProbability:", v49);
  objc_msgSend(v47, "setRcTrailingSilenceDuration:", v30);
  LODWORD(v50) = v33;
  objc_msgSend(v47, "setRcEndOfSentenceLikelihood:", v50);
  objc_msgSend(v47, "setRcWordCount:", v35);
  objc_msgSend(v47, "setRcServerFeaturesLatency:", v38);
  LODWORD(v51) = v41;
  objc_msgSend(v47, "setSilencePosterior:", v51);
  LODWORD(v52) = v16;
  objc_msgSend(v47, "setAcousticEndpointerScore:", v52);
  LODWORD(v53) = v46;
  objc_msgSend(v47, "setSilencePosteriorFrameCountInNs:", v53);
LABEL_21:

  return v47;
}

@end
