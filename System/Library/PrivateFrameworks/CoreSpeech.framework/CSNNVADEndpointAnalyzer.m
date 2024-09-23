@implementation CSNNVADEndpointAnalyzer

- (CSNNVADEndpointAnalyzer)init
{
  CSNNVADEndpointAnalyzer *v2;
  float v3;
  uint64_t v4;
  OS_dispatch_queue *queue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CSNNVADEndpointAnalyzer;
  v2 = -[CSNNVADEndpointAnalyzer init](&v7, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0D19090], "inputRecordingSampleRate");
    v2->_currentRequestSampleRate = (unint64_t)v3;
    v2->_firstAudioSampleSensorTimestamp = 0.0;
    v2->_firstSampleId = -1;
    objc_msgSend(MEMORY[0x1E0D19260], "getSerialQueueWithQOS:name:fixedPriority:", 33, CFSTR("com.apple.corespeech.nnvad"), *MEMORY[0x1E0D192F0]);
    v4 = objc_claimAutoreleasedReturnValue();
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

  }
  return v2;
}

- (void)resetForNewRequestWithSampleRate:(unint64_t)a3 recordContext:(id)a4 disableRCSelection:(BOOL)a5
{
  id v7;
  NSObject *queue;
  id v9;
  _QWORD block[4];
  id v11;
  CSNNVADEndpointAnalyzer *v12;
  unint64_t v13;

  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __93__CSNNVADEndpointAnalyzer_resetForNewRequestWithSampleRate_recordContext_disableRCSelection___block_invoke;
  block[3] = &unk_1E7C28B58;
  v12 = self;
  v13 = a3;
  v11 = v7;
  v9 = v7;
  dispatch_async(queue, block);

}

- (void)handleVoiceTriggerWithActivationInfo:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[4];
  id v8;
  CSNNVADEndpointAnalyzer *v9;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__CSNNVADEndpointAnalyzer_handleVoiceTriggerWithActivationInfo___block_invoke;
  block[3] = &unk_1E7C292A0;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async_and_wait(queue, block);

}

- (id)_pcmBufferForAudioChunk:(id)a3
{
  unint64_t activeChannel;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  const void *v11;
  uint64_t v12;
  uint64_t v13;

  activeChannel = self->_activeChannel;
  v5 = a3;
  objc_msgSend(v5, "dataForChannel:", activeChannel);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "numSamples");
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C89AC0]), "initWithPCMFormat:frameCapacity:", self->_currentRequestAudioFormat, v7);
  objc_msgSend(v8, "setFrameLength:", v7);
  v9 = *(void **)(objc_msgSend(v8, "mutableAudioBufferList") + 16);
  v10 = objc_retainAutorelease(v6);
  v11 = (const void *)objc_msgSend(v10, "bytes");
  v12 = objc_msgSend(v5, "numSamples");
  v13 = objc_msgSend(v5, "sampleByteDepth");

  memcpy(v9, v11, v13 * v12);
  return v8;
}

- (void)processAudioSamplesAsynchronously:(id)a3
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
  v7[2] = __61__CSNNVADEndpointAnalyzer_processAudioSamplesAsynchronously___block_invoke;
  v7[3] = &unk_1E7C292A0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)stopEndpointer
{
  NSObject *v3;
  NSObject *queue;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0D18F40];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F40], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v7 = "-[CSNNVADEndpointAnalyzer stopEndpointer]";
    _os_log_impl(&dword_1C2614000, v3, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  self->_nnvadState = 2;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__CSNNVADEndpointAnalyzer_stopEndpointer__block_invoke;
  block[3] = &unk_1E7C292C8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)recordingStoppedForReason:(int64_t)a3
{
  NSObject *queue;
  _QWORD v4[6];

  queue = self->_queue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __53__CSNNVADEndpointAnalyzer_recordingStoppedForReason___block_invoke;
  v4[3] = &unk_1E7C29178;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

- (void)_reportAudioFirstBufferInfoIfNecessary
{
  void *v3;

  if (!self->_hasReportedFirstAudioSampleSensorTimestamp && self->_firstAudioSampleSensorTimestamp != 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CFE7D8], "sharedAnalytics");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "logEventWithType:machAbsoluteTime:context:", 4710, (unint64_t)self->_firstAudioSampleSensorTimestamp, 0);

    self->_hasReportedFirstAudioSampleSensorTimestamp = 1;
  }
}

- (BOOL)_shouldEnterTwoShotAtAudioTimeInSecs:(double)a3
{
  double vtEndInSecs;
  double v6;
  NSObject *v7;
  BOOL v8;
  double endWaitTime;
  int v11;
  const char *v12;
  __int16 v13;
  double v14;
  __int16 v15;
  double v16;
  __int16 v17;
  double v18;
  __int16 v19;
  double v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (!self->_shouldDetectTwoShot)
    return 0;
  if (self->_didEnterTwoshot)
    return 0;
  vtEndInSecs = self->_vtEndInSecs;
  v6 = a3 - vtEndInSecs;
  if (a3 - vtEndInSecs <= 0.55)
    return 0;
  v7 = *MEMORY[0x1E0D18F40];
  v8 = 1;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F40], OS_LOG_TYPE_DEBUG))
  {
    endWaitTime = self->_endWaitTime;
    v11 = 136316674;
    v12 = "-[CSNNVADEndpointAnalyzer _shouldEnterTwoShotAtAudioTimeInSecs:]";
    v13 = 2050;
    v14 = a3;
    v15 = 2050;
    v16 = vtEndInSecs;
    v17 = 2050;
    v18 = endWaitTime;
    v19 = 2050;
    v20 = v6;
    v21 = 2050;
    v22 = 0x3FE199999999999ALL;
    v23 = 1026;
    v24 = 1;
    _os_log_debug_impl(&dword_1C2614000, v7, OS_LOG_TYPE_DEBUG, "%s CSEndpointerProxy: ep-time: %{public}f, triggerEnd: %{public}f, nnvadEndWaitTime: %{public}f, delta: %{public}f, legacyTwoShotThreshold: %{public}f, enterTwoShot: %{public}d", (uint8_t *)&v11, 0x44u);
  }
  return v8;
}

- (double)_effectiveAudioTimeInSecsForSNObservation:(id)a3
{
  double v4;
  uint64_t v6;

  if (a3)
  {
    objc_msgSend(a3, "timeRange");
    v4 = (double)v6;
  }
  else
  {
    v4 = 0.0;
  }
  return self->_vtEndInSecs + v4 / (double)self->_currentRequestSampleRate;
}

- (void)_checkSNObservationForStartpoint:(id)a3
{
  id v4;
  double v5;
  double v6;
  int v7;
  double startWaitTime;
  NSObject *v9;
  int v10;
  const char *v11;
  __int16 v12;
  double v13;
  __int16 v14;
  double v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CSNNVADEndpointAnalyzer _effectiveAudioTimeInSecsForSNObservation:](self, "_effectiveAudioTimeInSecsForSNObservation:", v4);
  v6 = v5;
  v7 = objc_msgSend(v4, "detected");

  if (v7)
  {
    -[CSNNVADEndpointAnalyzer _reportStartpointAtTsInSecs:](self, "_reportStartpointAtTsInSecs:", v6);
  }
  else if (-[CSNNVADEndpointAnalyzer _shouldEnterTwoShotAtAudioTimeInSecs:](self, "_shouldEnterTwoShotAtAudioTimeInSecs:", v6))
  {
    -[CSNNVADEndpointAnalyzer _reportTwoShotAtTsInSecs:](self, "_reportTwoShotAtTsInSecs:", v6);
  }
  else
  {
    startWaitTime = self->_startWaitTime;
    if (v6 > startWaitTime)
    {
      v9 = *MEMORY[0x1E0D18F40];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F40], OS_LOG_TYPE_DEFAULT))
      {
        v10 = 136315650;
        v11 = "-[CSNNVADEndpointAnalyzer _checkSNObservationForStartpoint:]";
        v12 = 2050;
        v13 = v6;
        v14 = 2050;
        v15 = startWaitTime;
        _os_log_impl(&dword_1C2614000, v9, OS_LOG_TYPE_DEFAULT, "%s No Startpt detected even after %{public}f secs. startWaitTime=%{public}f secs", (uint8_t *)&v10, 0x20u);
      }
      self->_isRequestTimeout = 1;
      -[CSNNVADEndpointAnalyzer _reportEndpointAtTsInSecs:](self, "_reportEndpointAtTsInSecs:", v6);
    }
  }
}

- (void)_checkSNObservationForEndpoint:(id)a3
{
  id v4;
  double v5;
  double v6;
  double automaticEndpointingSuspensionEndTime;
  NSObject *v8;
  int v9;
  const char *v10;
  __int16 v11;
  double v12;
  __int16 v13;
  double v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((objc_msgSend(v4, "detected") & 1) == 0)
  {
    -[CSNNVADEndpointAnalyzer _effectiveAudioTimeInSecsForSNObservation:](self, "_effectiveAudioTimeInSecsForSNObservation:", v4);
    v6 = v5;
    automaticEndpointingSuspensionEndTime = self->_automaticEndpointingSuspensionEndTime;
    if (v5 <= automaticEndpointingSuspensionEndTime)
    {
      v8 = *MEMORY[0x1E0D18F40];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F40], OS_LOG_TYPE_DEFAULT))
      {
        v9 = 136315650;
        v10 = "-[CSNNVADEndpointAnalyzer _checkSNObservationForEndpoint:]";
        v11 = 2050;
        v12 = v6;
        v13 = 2050;
        v14 = automaticEndpointingSuspensionEndTime;
        _os_log_impl(&dword_1C2614000, v8, OS_LOG_TYPE_DEFAULT, "%s Postponing endpt as Endpoint(%{public}f) < _automaticEndpointingSuspensionEndTime(%{public}f)", (uint8_t *)&v9, 0x20u);
      }
    }
    else
    {
      -[CSNNVADEndpointAnalyzer _reportEndpointAtTsInSecs:](self, "_reportEndpointAtTsInSecs:", v5);
    }
  }

}

- (void)request:(id)a3 didProduceResult:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  NSObject *queue;
  _QWORD v11[4];
  id v12;
  CSNNVADEndpointAnalyzer *v13;
  uint8_t buf[4];
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (self->_nnvadState == 2)
  {
    v9 = *MEMORY[0x1E0D18F40];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F40], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v15 = "-[CSNNVADEndpointAnalyzer request:didProduceResult:]";
      _os_log_impl(&dword_1C2614000, v9, OS_LOG_TYPE_DEFAULT, "%s Processing finished. Not scheduling", buf, 0xCu);
    }
  }
  else
  {
    queue = self->_queue;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __52__CSNNVADEndpointAnalyzer_request_didProduceResult___block_invoke;
    v11[3] = &unk_1E7C292A0;
    v12 = v7;
    v13 = self;
    dispatch_async(queue, v11);

  }
}

- (void)request:(id)a3 didFailWithError:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  const char *v9;
  __int16 v10;
  id v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = *MEMORY[0x1E0D18F40];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F40], OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315650;
    v9 = "-[CSNNVADEndpointAnalyzer request:didFailWithError:]";
    v10 = 2114;
    v11 = v5;
    v12 = 2114;
    v13 = v6;
    _os_log_impl(&dword_1C2614000, v7, OS_LOG_TYPE_DEFAULT, "%s request: %{public}@, returnedError: %{public}@", (uint8_t *)&v8, 0x20u);
  }

}

- (void)_reportEndpointAtTsInSecs:(double)a3
{
  double v5;
  float v6;
  unint64_t v7;
  void *v8;
  unint64_t anchorMachAbsTime;
  unint64_t numSamplesProcessedBeforeAnchorTime;
  uint64_t v11;
  NSObject *v12;
  _BOOL4 isAnchorTimeBuffered;
  CSEndpointerMetrics *v14;
  double v15;
  CSEndpointerMetrics *v16;
  id WeakRetained;
  id v18;
  void *v19;
  id v20;
  char v21;
  id v22;
  int v23;
  const char *v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  _BOOL4 v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  self->_nnvadState = 2;
  v5 = self->_vtExtraAudioAtStartInMs / 1000.0 + a3;
  objc_msgSend(MEMORY[0x1E0D19090], "inputRecordingSampleRate");
  v7 = (unint64_t)(v5 * v6);
  v8 = (void *)MEMORY[0x1E0D19118];
  numSamplesProcessedBeforeAnchorTime = self->_numSamplesProcessedBeforeAnchorTime;
  anchorMachAbsTime = self->_anchorMachAbsTime;
  objc_msgSend(MEMORY[0x1E0D19090], "inputRecordingSampleRate");
  v11 = objc_msgSend(v8, "hostTimeFromSampleCount:anchorHostTime:anchorSampleCount:sampleRate:", v7, anchorMachAbsTime, numSamplesProcessedBeforeAnchorTime);
  v12 = *MEMORY[0x1E0D18F40];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F40], OS_LOG_TYPE_DEFAULT))
  {
    isAnchorTimeBuffered = self->_isAnchorTimeBuffered;
    v23 = 136315650;
    v24 = "-[CSNNVADEndpointAnalyzer _reportEndpointAtTsInSecs:]";
    v25 = 2050;
    v26 = v11;
    v27 = 1026;
    v28 = isAnchorTimeBuffered;
    _os_log_impl(&dword_1C2614000, v12, OS_LOG_TYPE_DEFAULT, "%s endpointedBuffer.hostTime=%{public}llu, isAnchorTimeBuffered=%{public}d", (uint8_t *)&v23, 0x1Cu);
  }
  v14 = [CSEndpointerMetrics alloc];
  -[CSNNVADEndpointAnalyzer _trailingSilenceDurationAtEndpoint](self, "_trailingSilenceDurationAtEndpoint");
  v16 = -[CSEndpointerMetrics initWithTotalAudioRecorded:endpointBufferHostTime:featuresAtEndpoint:endpointerType:asrFeatureLatencyDistribution:additionalMetrics:trailingSilenceDurationAtEndpoint:requestId:](v14, "initWithTotalAudioRecorded:endpointBufferHostTime:featuresAtEndpoint:endpointerType:asrFeatureLatencyDistribution:additionalMetrics:trailingSilenceDurationAtEndpoint:requestId:", v11, 0, 0, 0, 0, 0, a3 * 1000.0, v15);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "endpointer:didDetectHardEndpointAtTime:withMetrics:", self, v16, a3);

  v18 = objc_loadWeakRetained((id *)&self->_implDelegate);
  if (v18)
  {
    v19 = v18;
    v20 = objc_loadWeakRetained((id *)&self->_implDelegate);
    v21 = objc_opt_respondsToSelector();

    if ((v21 & 1) != 0)
    {
      v22 = objc_loadWeakRetained((id *)&self->_implDelegate);
      objc_msgSend(v22, "endpointer:reportEndpointBufferHostTime:firstBufferHostTime:", self, v11, (unint64_t)self->_firstAudioSampleSensorTimestamp);

      self->_hasReportedFirstAudioSampleSensorTimestamp = 1;
    }
  }
  -[CSNNVADEndpointAnalyzer _emitEndpointDetectedEventWithEndpointTime:endpointBufferHostTime:](self, "_emitEndpointDetectedEventWithEndpointTime:endpointBufferHostTime:", v11, a3);

}

- (void)setMhId:(id)a3
{
  objc_storeStrong((id *)&self->_mhId, a3);
}

- (void)_emitEndpointDetectedEventWithEndpointTime:(double)a3 endpointBufferHostTime:(unint64_t)a4
{
  id v7;
  double v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSString *mhId;
  NSObject *v14;
  int v15;
  const char *v16;
  __int16 v17;
  NSString *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (self->_mhId)
  {
    v7 = objc_alloc_init(MEMORY[0x1E0D99A98]);
    objc_msgSend(v7, "setEndpointerType:", 2);
    *(float *)&v8 = a3;
    objc_msgSend(v7, "setEndpointAudioDurationInNs:", objc_msgSend(MEMORY[0x1E0D19118], "secondsToNs:", v8));
    objc_msgSend(v7, "setFirstBufferTimeInNs:", objc_msgSend(MEMORY[0x1E0D19118], "hostTimeToNs:", (unint64_t)self->_firstAudioSampleSensorTimestamp));
    objc_msgSend(v7, "setEndpointedBufferTimeInNs:", objc_msgSend(MEMORY[0x1E0D19118], "hostTimeToNs:", a4));
    objc_msgSend(v7, "setDerivedBufferTimeFromHistoricalAudio:", self->_isAnchorTimeBuffered);
    v9 = objc_alloc_init(MEMORY[0x1E0D99AB8]);
    objc_msgSend(v9, "setIsTimeout:", self->_isRequestTimeout);
    objc_msgSend(v7, "setTimeoutMetadata:", v9);
    +[CSEndpointLoggingHelper getMHClientEventByMhUUID:](CSEndpointLoggingHelper, "getMHClientEventByMhUUID:", self->_mhId);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setEndpointDetected:", v7);
    objc_msgSend(MEMORY[0x1E0D97898], "sharedStream");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "emitMessage:", v10);

    v12 = *MEMORY[0x1E0D18F40];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F40], OS_LOG_TYPE_DEFAULT))
    {
      mhId = self->_mhId;
      v15 = 136315394;
      v16 = "-[CSNNVADEndpointAnalyzer _emitEndpointDetectedEventWithEndpointTime:endpointBufferHostTime:]";
      v17 = 2112;
      v18 = mhId;
      _os_log_impl(&dword_1C2614000, v12, OS_LOG_TYPE_DEFAULT, "%s Submit MHEndpointDetectedEvent to SELF for MH ID: %@", (uint8_t *)&v15, 0x16u);
    }

  }
  else
  {
    v14 = *MEMORY[0x1E0D18F40];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F40], OS_LOG_TYPE_ERROR))
    {
      v15 = 136315138;
      v16 = "-[CSNNVADEndpointAnalyzer _emitEndpointDetectedEventWithEndpointTime:endpointBufferHostTime:]";
      _os_log_error_impl(&dword_1C2614000, v14, OS_LOG_TYPE_ERROR, "%s MHID not set, skipping SELF Logging", (uint8_t *)&v15, 0xCu);
    }
  }
}

- (void)_reportStartpointAtTsInSecs:(double)a3
{
  id WeakRetained;

  self->_nnvadState = 1;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "endpointer:didDetectStartpointAtTime:", self, a3);

}

- (void)_reportTwoShotAtTsInSecs:(double)a3
{
  id WeakRetained;

  self->_didEnterTwoshot = 1;
  WeakRetained = objc_loadWeakRetained((id *)&self->_implDelegate);
  objc_msgSend(WeakRetained, "endpointer:detectedTwoShotAtTime:", self, a3);

}

- (BOOL)canProcessCurrentRequest
{
  return 1;
}

- (double)_trailingSilenceDurationAtEndpoint
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD7560]), "initWithRequestType:", 0);
  objc_msgSend(v2, "decisionDelay");
  v4 = v3;

  return v4;
}

- (void)setAutomaticEndpointingSuspensionEndTime:(double)a3
{
  NSObject *queue;
  _QWORD v4[6];

  queue = self->_queue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __68__CSNNVADEndpointAnalyzer_setAutomaticEndpointingSuspensionEndTime___block_invoke;
  v4[3] = &unk_1E7C29178;
  v4[4] = self;
  *(double *)&v4[5] = a3;
  dispatch_async(queue, v4);
}

- (void)setStartWaitTime:(double)a3
{
  NSObject *queue;
  _QWORD v4[6];

  queue = self->_queue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __44__CSNNVADEndpointAnalyzer_setStartWaitTime___block_invoke;
  v4[3] = &unk_1E7C29178;
  v4[4] = self;
  *(double *)&v4[5] = a3;
  dispatch_async(queue, v4);
}

- (void)setEndWaitTime:(double)a3
{
  NSObject *queue;
  _QWORD v4[6];

  queue = self->_queue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __42__CSNNVADEndpointAnalyzer_setEndWaitTime___block_invoke;
  v4[3] = &unk_1E7C29178;
  v4[4] = self;
  *(double *)&v4[5] = a3;
  dispatch_async(queue, v4);
}

- (void)preheat
{
  NSObject *v2;
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0D18F40];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F40], OS_LOG_TYPE_DEFAULT))
  {
    v3 = 136315138;
    v4 = "-[CSNNVADEndpointAnalyzer preheat]";
    _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s No Preheat required", (uint8_t *)&v3, 0xCu);
  }
}

- (void)reset
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CSNNVADEndpointAnalyzer.m"), 523, CFSTR("Reset called?"));

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

- (double)startWaitTime
{
  return self->_startWaitTime;
}

- (double)endWaitTime
{
  return self->_endWaitTime;
}

- (double)automaticEndpointingSuspensionEndTime
{
  return self->_automaticEndpointingSuspensionEndTime;
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

- (double)lastEndOfVoiceActivityTime
{
  return self->_lastEndOfVoiceActivityTime;
}

- (double)lastStartOfVoiceActivityTime
{
  return self->_lastStartOfVoiceActivityTime;
}

- (SNAudioStreamAnalyzer)snAudioStreamAnalyzer
{
  return self->_snAudioStreamAnalyzer;
}

- (void)setSnAudioStreamAnalyzer:(id)a3
{
  objc_storeStrong((id *)&self->_snAudioStreamAnalyzer, a3);
}

- (unint64_t)framePosition
{
  return self->_framePosition;
}

- (void)setFramePosition:(unint64_t)a3
{
  self->_framePosition = a3;
}

- (unint64_t)nnvadState
{
  return self->_nnvadState;
}

- (void)setNnvadState:(unint64_t)a3
{
  self->_nnvadState = a3;
}

- (unint64_t)numSamplesReceived
{
  return self->_numSamplesReceived;
}

- (void)setNumSamplesReceived:(unint64_t)a3
{
  self->_numSamplesReceived = a3;
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

- (unint64_t)currentRequestSampleRate
{
  return self->_currentRequestSampleRate;
}

- (void)setCurrentRequestSampleRate:(unint64_t)a3
{
  self->_currentRequestSampleRate = a3;
}

- (AVAudioFormat)currentRequestAudioFormat
{
  return self->_currentRequestAudioFormat;
}

- (void)setCurrentRequestAudioFormat:(id)a3
{
  objc_storeStrong((id *)&self->_currentRequestAudioFormat, a3);
}

- (double)vtEndInSecs
{
  return self->_vtEndInSecs;
}

- (void)setVtEndInSecs:(double)a3
{
  self->_vtEndInSecs = a3;
}

- (unint64_t)vtEndInSampleCount
{
  return self->_vtEndInSampleCount;
}

- (void)setVtEndInSampleCount:(unint64_t)a3
{
  self->_vtEndInSampleCount = a3;
}

- (double)vtExtraAudioAtStartInMs
{
  return self->_vtExtraAudioAtStartInMs;
}

- (void)setVtExtraAudioAtStartInMs:(double)a3
{
  self->_vtExtraAudioAtStartInMs = a3;
}

- (double)nnvadAudioOriginInMs
{
  return self->_nnvadAudioOriginInMs;
}

- (void)setNnvadAudioOriginInMs:(double)a3
{
  self->_nnvadAudioOriginInMs = a3;
}

- (BOOL)shouldDetectTwoShot
{
  return self->_shouldDetectTwoShot;
}

- (void)setShouldDetectTwoShot:(BOOL)a3
{
  self->_shouldDetectTwoShot = a3;
}

- (BOOL)didEnterTwoshot
{
  return self->_didEnterTwoshot;
}

- (void)setDidEnterTwoshot:(BOOL)a3
{
  self->_didEnterTwoshot = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (CSAudioFileWriter)audioFileWriter
{
  return self->_audioFileWriter;
}

- (void)setAudioFileWriter:(id)a3
{
  objc_storeStrong((id *)&self->_audioFileWriter, a3);
}

- (double)firstAudioSampleSensorTimestamp
{
  return self->_firstAudioSampleSensorTimestamp;
}

- (void)setFirstAudioSampleSensorTimestamp:(double)a3
{
  self->_firstAudioSampleSensorTimestamp = a3;
}

- (BOOL)hasReportedFirstAudioSampleSensorTimestamp
{
  return self->_hasReportedFirstAudioSampleSensorTimestamp;
}

- (void)setHasReportedFirstAudioSampleSensorTimestamp:(BOOL)a3
{
  self->_hasReportedFirstAudioSampleSensorTimestamp = a3;
}

- (int64_t)firstSampleId
{
  return self->_firstSampleId;
}

- (void)setFirstSampleId:(int64_t)a3
{
  self->_firstSampleId = a3;
}

- (unint64_t)numSamplesSkippedForVT
{
  return self->_numSamplesSkippedForVT;
}

- (void)setNumSamplesSkippedForVT:(unint64_t)a3
{
  self->_numSamplesSkippedForVT = a3;
}

- (BOOL)finishedSkippingSamplesForVT
{
  return self->_finishedSkippingSamplesForVT;
}

- (void)setFinishedSkippingSamplesForVT:(BOOL)a3
{
  self->_finishedSkippingSamplesForVT = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioFileWriter, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_currentRequestAudioFormat, 0);
  objc_storeStrong((id *)&self->_snAudioStreamAnalyzer, 0);
  objc_storeStrong((id *)&self->_mhId, 0);
  objc_destroyWeak((id *)&self->_implDelegate);
  objc_destroyWeak((id *)&self->_delegate);
}

double __42__CSNNVADEndpointAnalyzer_setEndWaitTime___block_invoke(uint64_t a1)
{
  double result;

  result = *(double *)(a1 + 40);
  *(double *)(*(_QWORD *)(a1 + 32) + 48) = result;
  return result;
}

double __44__CSNNVADEndpointAnalyzer_setStartWaitTime___block_invoke(uint64_t a1)
{
  double result;

  result = *(double *)(a1 + 40);
  *(double *)(*(_QWORD *)(a1 + 32) + 40) = result;
  return result;
}

double __68__CSNNVADEndpointAnalyzer_setAutomaticEndpointingSuspensionEndTime___block_invoke(uint64_t a1)
{
  double result;

  result = *(double *)(a1 + 40);
  *(double *)(*(_QWORD *)(a1 + 32) + 56) = result;
  return result;
}

void __52__CSNNVADEndpointAnalyzer_request_didProduceResult___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD *v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  uint8_t buf[4];
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(v2, "timeRange");
    if (v6 >= 1)
    {
      v3 = *(_QWORD **)(a1 + 40);
      v4 = v3[17];
      switch(v4)
      {
        case 2:
          v5 = *MEMORY[0x1E0D18F40];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F40], OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315138;
            v8 = "-[CSNNVADEndpointAnalyzer request:didProduceResult:]_block_invoke";
            _os_log_debug_impl(&dword_1C2614000, v5, OS_LOG_TYPE_DEBUG, "%s Processing finished. Ignoring", buf, 0xCu);
          }
          break;
        case 1:
          objc_msgSend(v3, "_checkSNObservationForEndpoint:", *(_QWORD *)(a1 + 32));
          break;
        case 0:
          objc_msgSend(v3, "_checkSNObservationForStartpoint:", *(_QWORD *)(a1 + 32));
          break;
      }
    }
  }
}

uint64_t __53__CSNNVADEndpointAnalyzer_recordingStoppedForReason___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  int v7;
  const char *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0D18F40];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F40], OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 40);
    v7 = 136315394;
    v8 = "-[CSNNVADEndpointAnalyzer recordingStoppedForReason:]_block_invoke";
    v9 = 2050;
    v10 = v3;
    _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s Recording Stopped For Reason: %{public}ld", (uint8_t *)&v7, 0x16u);
  }
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 136) = 2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 224), "endAudio");
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 224);
  *(_QWORD *)(v4 + 224) = 0;

  return objc_msgSend(*(id *)(a1 + 32), "_reportAudioFirstBufferInfoIfNecessary");
}

uint64_t __41__CSNNVADEndpointAnalyzer_stopEndpointer__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 224), "endAudio");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 224);
  *(_QWORD *)(v2 + 224) = 0;

  return objc_msgSend(*(id *)(a1 + 32), "_reportAudioFirstBufferInfoIfNecessary");
}

void __61__CSNNVADEndpointAnalyzer_processAudioSamplesAsynchronously___block_invoke(uint64_t a1)
{
  _QWORD *v1;
  NSObject *v2;
  NSObject *v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[5];
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD **)(a1 + 32);
  if (v1[17] == 2)
  {
    v2 = *MEMORY[0x1E0D18F40];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F40], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v18 = "-[CSNNVADEndpointAnalyzer processAudioSamplesAsynchronously:]_block_invoke";
      _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s Processing Done. Returning", buf, 0xCu);
    }
  }
  else
  {
    if ((v1[30] & 0x8000000000000000) != 0)
    {
      *(double *)(*(_QWORD *)(a1 + 32) + 232) = (double)(unint64_t)objc_msgSend(*(id *)(a1 + 40), "hostTime");
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 240) = objc_msgSend(*(id *)(a1 + 40), "startSampleCount");
      v4 = *MEMORY[0x1E0D18F40];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F40], OS_LOG_TYPE_DEFAULT))
      {
        v5 = *(_QWORD **)(a1 + 32);
        v6 = v5[30];
        v7 = v5[18];
        v8 = v5[24];
        *(_DWORD *)buf = 136315906;
        v18 = "-[CSNNVADEndpointAnalyzer processAudioSamplesAsynchronously:]_block_invoke";
        v19 = 2050;
        v20 = v6;
        v21 = 2050;
        v22 = v7;
        v23 = 2050;
        v24 = v8;
        _os_log_impl(&dword_1C2614000, v4, OS_LOG_TYPE_DEFAULT, "%s Rx first sample: %{public}ld, _numSamplesReceived=%{public}lu, _vtEndInSampleCount=%{public}lu", buf, 0x2Au);
      }
      v1 = *(_QWORD **)(a1 + 32);
    }
    v1[19] = v1[18];
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 160) = objc_msgSend(*(id *)(a1 + 40), "hostTime");
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 9) = objc_msgSend(*(id *)(a1 + 40), "wasBuffered");
    v10 = *(_QWORD *)(a1 + 32);
    v9 = *(void **)(a1 + 40);
    v11 = *(_QWORD *)(v10 + 144);
    v12 = *(_QWORD *)(v10 + 192);
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __61__CSNNVADEndpointAnalyzer_processAudioSamplesAsynchronously___block_invoke_7;
    v16[3] = &unk_1E7C24748;
    v16[4] = v10;
    objc_msgSend(v9, "skipSamplesAtStartSuchThatNumSamplesReceivedSoFar:reachesACountOf:completionHandler:", v11, v12, v16);
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 144) += objc_msgSend(*(id *)(a1 + 40), "numSamples");
    objc_msgSend(*(id *)(a1 + 40), "dataForChannel:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *(void **)(*(_QWORD *)(a1 + 32) + 224);
    v15 = objc_retainAutorelease(v13);
    objc_msgSend(v14, "addSamples:numSamples:", objc_msgSend(v15, "bytes"), objc_msgSend(*(id *)(a1 + 40), "numSamples"));

  }
}

void __61__CSNNVADEndpointAnalyzer_processAudioSamplesAsynchronously___block_invoke_7(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  int v11;
  const char *v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 248) += a3;
  v6 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v6 + 14) && *(_QWORD *)(v6 + 248) >= *(_QWORD *)(v6 + 192))
  {
    *(_BYTE *)(v6 + 14) = 1;
    v7 = *MEMORY[0x1E0D18F40];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F40], OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v9 = *(_QWORD *)(v8 + 248);
      LODWORD(v8) = *(unsigned __int8 *)(v8 + 14);
      v11 = 136315650;
      v12 = "-[CSNNVADEndpointAnalyzer processAudioSamplesAsynchronously:]_block_invoke";
      v13 = 2050;
      v14 = v9;
      v15 = 1026;
      v16 = v8;
      _os_log_impl(&dword_1C2614000, v7, OS_LOG_TYPE_DEFAULT, "%s _numSamplesSkippedForVT=%{public}lu, _finishedSkippingSamplesForVT=%{public}d", (uint8_t *)&v11, 0x1Cu);
    }
  }
  if (objc_msgSend(v5, "numSamples"))
  {
    objc_msgSend(*(id *)(a1 + 32), "_pcmBufferForAudioChunk:", v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "analyzeAudioBuffer:atAudioFramePosition:", v10, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 128));
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 128) += objc_msgSend(v10, "frameLength");

  }
}

void __64__CSNNVADEndpointAnalyzer_handleVoiceTriggerWithActivationInfo___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  unint64_t v5;
  float v6;
  void *v7;
  unint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  const char *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  unint64_t v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  int v30;
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
  *(double *)(*(_QWORD *)(a1 + 40) + 184) = (double)v5 / v6;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *MEMORY[0x1E0D19600]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "unsignedIntegerValue");

  *(_QWORD *)(*(_QWORD *)(a1 + 40) + 192) = (unint64_t)(*(double *)(*(_QWORD *)(a1 + 40) + 184)
                                                               * (double)*(unint64_t *)(*(_QWORD *)(a1 + 40)
                                                                                             + 168));
  *(double *)(*(_QWORD *)(a1 + 40) + 200) = (float)((float)((float)v8
                                                            / (float)*(unint64_t *)(*(_QWORD *)(a1 + 40) + 168))
                                                    * 1000.0);
  *(double *)(*(_QWORD *)(a1 + 40) + 208) = -(*(double *)(*(_QWORD *)(a1 + 40) + 200)
                                              - *(double *)(*(_QWORD *)(a1 + 40) + 184) * 1000.0);
  v9 = *MEMORY[0x1E0D18F40];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F40], OS_LOG_TYPE_DEFAULT))
  {
    v11 = *(_QWORD *)(a1 + 32);
    v10 = *(_QWORD *)(a1 + 40);
    v12 = *(_QWORD *)(v10 + 184);
    v13 = *(_QWORD *)(v10 + 192);
    v14 = (unint64_t)*(double *)(v10 + 200);
    v15 = *(_QWORD *)(v10 + 208);
    v16 = *(_QWORD *)(v10 + 248);
    LODWORD(v10) = *(unsigned __int8 *)(v10 + 14);
    v17 = 136316930;
    v18 = "-[CSNNVADEndpointAnalyzer handleVoiceTriggerWithActivationInfo:]_block_invoke";
    v19 = 2050;
    v20 = v12;
    v21 = 2050;
    v22 = v13;
    v23 = 2050;
    v24 = v14;
    v25 = 2050;
    v26 = v15;
    v27 = 2050;
    v28 = v16;
    v29 = 1026;
    v30 = v10;
    v31 = 2114;
    v32 = v11;
    _os_log_impl(&dword_1C2614000, v9, OS_LOG_TYPE_DEFAULT, "%s triggerEndSeconds: %{public}f, _vtEndInSampleCount: %{public}lu, _vtExtraAudioAtStartInMs: %{public}lu,  _nnvadAudioOriginInMs: %{public}f, _numSamplesSkippedForVT: %{public}lu, _finishedSkippingSamplesForVT: %{public}d, voiceTriggerInfo: %{public}@,", (uint8_t *)&v17, 0x4Eu);
  }
}

void __93__CSNNVADEndpointAnalyzer_resetForNewRequestWithSampleRate_recordContext_disableRCSelection___block_invoke(uint64_t a1)
{
  os_log_t *v2;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  char v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  int v18;
  id v19;
  void *v20;
  NSObject *v21;
  id v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v2 = (os_log_t *)MEMORY[0x1E0D18F40];
  v3 = *MEMORY[0x1E0D18F40];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F40], OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(void **)(a1 + 48);
    v5 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 136315650;
    v24 = "-[CSNNVADEndpointAnalyzer resetForNewRequestWithSampleRate:recordContext:disableRCSelection:]_block_invoke";
    v25 = 2048;
    v26 = v4;
    v27 = 2112;
    v28 = v5;
    _os_log_impl(&dword_1C2614000, v3, OS_LOG_TYPE_DEFAULT, "%s NewReq: sampleRate: %lu, recordContext: %@", buf, 0x20u);
  }
  *(_BYTE *)(*(_QWORD *)(a1 + 40) + 12) = 0;
  v6 = objc_msgSend(MEMORY[0x1E0D19260], "supportCSTwoShotDecision");
  *(_BYTE *)(*(_QWORD *)(a1 + 40) + 11) = objc_msgSend(*(id *)(a1 + 32), "isVoiceTriggered") & (v6 ^ 1);
  *(_QWORD *)(*(_QWORD *)(a1 + 40) + 232) = 0;
  *(_BYTE *)(*(_QWORD *)(a1 + 40) + 13) = 0;
  *(_QWORD *)(*(_QWORD *)(a1 + 40) + 240) = -1;
  *(_QWORD *)(*(_QWORD *)(a1 + 40) + 152) = 0;
  *(_QWORD *)(*(_QWORD *)(a1 + 40) + 160) = 0;
  *(_BYTE *)(*(_QWORD *)(a1 + 40) + 9) = 0;
  *(_BYTE *)(*(_QWORD *)(a1 + 40) + 10) = 0;
  *(_QWORD *)(*(_QWORD *)(a1 + 40) + 168) = *(_QWORD *)(a1 + 48);
  *(_QWORD *)(*(_QWORD *)(a1 + 40) + 40) = 0x4014000000000000;
  *(_QWORD *)(*(_QWORD *)(a1 + 40) + 48) = 0x3FE8A3D70A3D70A4;
  *(_QWORD *)(*(_QWORD *)(a1 + 40) + 128) = 0;
  *(_QWORD *)(*(_QWORD *)(a1 + 40) + 136) = 0;
  *(_QWORD *)(*(_QWORD *)(a1 + 40) + 144) = 0;
  *(_QWORD *)(*(_QWORD *)(a1 + 40) + 184) = 0;
  *(_QWORD *)(*(_QWORD *)(a1 + 40) + 192) = 0;
  *(_QWORD *)(*(_QWORD *)(a1 + 40) + 208) = 0;
  *(_QWORD *)(*(_QWORD *)(a1 + 40) + 200) = 0;
  *(_QWORD *)(*(_QWORD *)(a1 + 40) + 248) = 0;
  *(_QWORD *)(*(_QWORD *)(a1 + 40) + 56) = 0;
  *(_BYTE *)(*(_QWORD *)(a1 + 40) + 14) = 0;
  v7 = objc_alloc(MEMORY[0x1E0C89AA8]);
  if (objc_msgSend(MEMORY[0x1E0D19090], "inputRecordingIsFloat"))
    v8 = 1;
  else
    v8 = 3;
  v9 = objc_msgSend(v7, "initWithCommonFormat:sampleRate:channels:interleaved:", v8, 1, 0, (double)*(unint64_t *)(*(_QWORD *)(a1 + 40) + 168));
  v10 = *(_QWORD *)(a1 + 40);
  v11 = *(void **)(v10 + 176);
  *(_QWORD *)(v10 + 176) = v9;

  v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0CD7538]), "initWithFormat:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 176));
  v13 = *(_QWORD *)(a1 + 40);
  v14 = *(void **)(v13 + 120);
  *(_QWORD *)(v13 + 120) = v12;

  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD7560]), "initWithRequestType:", 0);
  v16 = *(_QWORD *)(a1 + 40);
  v17 = *(void **)(v16 + 120);
  v22 = 0;
  v18 = objc_msgSend(v17, "addRequest:withObserver:error:", v15, v16, &v22);
  v19 = v22;
  v20 = v19;
  if (!v18 || v19)
  {
    v21 = *v2;
    if (os_log_type_enabled(*v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v24 = "-[CSNNVADEndpointAnalyzer resetForNewRequestWithSampleRate:recordContext:disableRCSelection:]_block_invoke";
      v25 = 2112;
      v26 = v20;
      _os_log_impl(&dword_1C2614000, v21, OS_LOG_TYPE_DEFAULT, "%s Err: %@", buf, 0x16u);
    }
  }

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
