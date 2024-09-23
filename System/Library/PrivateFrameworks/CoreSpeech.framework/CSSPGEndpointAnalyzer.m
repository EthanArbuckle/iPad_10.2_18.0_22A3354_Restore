@implementation CSSPGEndpointAnalyzer

- (CSSPGEndpointAnalyzer)init
{
  CSSPGEndpointAnalyzer *v3;
  CSSPGEndpointAnalyzer *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *queue;
  objc_super v8;

  if ((objc_msgSend(MEMORY[0x1E0D19260], "isDarwinOS") & 1) != 0)
  {
    v3 = 0;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)CSSPGEndpointAnalyzer;
    v4 = -[CSSPGEndpointAnalyzer init](&v8, sel_init);
    if (v4)
    {
      v5 = dispatch_queue_create("CSSPGEndpointAnalyzer", 0);
      queue = v4->_queue;
      v4->_queue = (OS_dispatch_queue *)v5;

    }
    self = v4;
    v3 = self;
  }

  return v3;
}

- (CSSPGEndpointAnalyzer)initWithEndpointThreshold:(float)a3
{
  CSSPGEndpointAnalyzer *result;

  result = -[CSSPGEndpointAnalyzer init](self, "init");
  if (result)
  {
    result->_endpointThreshold = a3;
    result->_isAnalyzeMode = 0;
  }
  return result;
}

- (CSSPGEndpointAnalyzer)initWithAnalyzeMode
{
  CSSPGEndpointAnalyzer *result;

  result = -[CSSPGEndpointAnalyzer init](self, "init");
  if (result)
    result->_isAnalyzeMode = 1;
  return result;
}

- (void)reset
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __30__CSSPGEndpointAnalyzer_reset__block_invoke;
  block[3] = &unk_1E7C292C8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)dealloc
{
  NSObject *v3;
  EARCaesuraSilencePosteriorGenerator *caesuraSPG;
  objc_super v5;
  uint8_t buf[4];
  const char *v7;
  __int16 v8;
  EARCaesuraSilencePosteriorGenerator *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0D18F40];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F40], OS_LOG_TYPE_DEFAULT))
  {
    caesuraSPG = self->_caesuraSPG;
    *(_DWORD *)buf = 136315394;
    v7 = "-[CSSPGEndpointAnalyzer dealloc]";
    v8 = 2114;
    v9 = caesuraSPG;
    _os_log_impl(&dword_1C2614000, v3, OS_LOG_TYPE_DEFAULT, "%s deallocating EARCaesuraSilencePosteriorGenerator: %{public}@", buf, 0x16u);
  }
  v5.receiver = self;
  v5.super_class = (Class)CSSPGEndpointAnalyzer;
  -[CSSPGEndpointAnalyzer dealloc](&v5, sel_dealloc);
}

- (void)stop
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __29__CSSPGEndpointAnalyzer_stop__block_invoke;
  block[3] = &unk_1E7C292C8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (int64_t)getFrameDurationMs
{
  NSObject *queue;
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
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __43__CSSPGEndpointAnalyzer_getFrameDurationMs__block_invoke;
  v5[3] = &unk_1E7C29228;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)addAudio:(id)a3 numSamples:(unint64_t)a4
{
  id v6;
  NSObject *queue;
  id v8;
  _QWORD block[5];
  id v10;
  unint64_t v11;

  v6 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__CSSPGEndpointAnalyzer_addAudio_numSamples___block_invoke;
  block[3] = &unk_1E7C28B58;
  block[4] = self;
  v10 = v6;
  v11 = a4;
  v8 = v6;
  dispatch_async(queue, block);

}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)clientSilenceFeaturesAvailable:(id)a3
{
  id v4;
  double v5;
  double v6;
  uint64_t v7;
  NSObject *v8;
  id WeakRetained;
  void *v10;
  id v11;
  char v12;
  id v13;
  NSObject *queue;
  id v15;
  _QWORD v16[5];
  id v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  double v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "silenceDurationMs");
  v6 = v5;
  v7 = clientSilenceFeaturesAvailable__heartbeat;
  if (__ROR8__(0xEEEEEEEEEEEEEEEFLL * clientSilenceFeaturesAvailable__heartbeat, 2) <= 0x444444444444444uLL)
  {
    v8 = *MEMORY[0x1E0D18F40];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F40], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v19 = "-[CSSPGEndpointAnalyzer clientSilenceFeaturesAvailable:]";
      v20 = 2050;
      v21 = v7;
      v22 = 2050;
      v23 = v6;
      _os_log_impl(&dword_1C2614000, v8, OS_LOG_TYPE_INFO, "%s EARClientSilenceFeatures heartbeat = %{public}lld,                   silScoreEstimate = %{public}f", buf, 0x20u);
      v7 = clientSilenceFeaturesAvailable__heartbeat;
    }
  }
  clientSilenceFeaturesAvailable__heartbeat = v7 + 1;
  if (!self->_hasReported && v6 >= self->_endpointThreshold)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (WeakRetained)
    {
      v10 = WeakRetained;
      v11 = objc_loadWeakRetained((id *)&self->_delegate);
      v12 = objc_opt_respondsToSelector();

      if ((v12 & 1) != 0)
      {
        v13 = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(v13, "spgEndpointAnalyzerDidDetectEndpoint:", self);

      }
    }
    self->_hasReported = 1;
  }
  queue = self->_queue;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __56__CSSPGEndpointAnalyzer_clientSilenceFeaturesAvailable___block_invoke;
  v16[3] = &unk_1E7C292A0;
  v16[4] = self;
  v17 = v4;
  v15 = v4;
  dispatch_async(queue, v16);

}

- (void)silenceDurationEstimateAvailable:(float *)a3 numEstimates:(unint64_t)a4 clientProcessedAudioMs:(float)a5
{
  NSObject *queue;
  _QWORD block[6];
  float v7;

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __94__CSSPGEndpointAnalyzer_silenceDurationEstimateAvailable_numEstimates_clientProcessedAudioMs___block_invoke;
  block[3] = &unk_1E7C27F58;
  block[4] = self;
  block[5] = a4;
  v7 = a5;
  dispatch_async(queue, block);
}

- (CSSPGEndpointAnalyzerDelegate)delegate
{
  return (CSSPGEndpointAnalyzerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (EARCaesuraSilencePosteriorGenerator)caesuraSPG
{
  return self->_caesuraSPG;
}

- (void)setCaesuraSPG:(id)a3
{
  objc_storeStrong((id *)&self->_caesuraSPG, a3);
}

- (float)endpointThreshold
{
  return self->_endpointThreshold;
}

- (void)setEndpointThreshold:(float)a3
{
  self->_endpointThreshold = a3;
}

- (BOOL)hasReported
{
  return self->_hasReported;
}

- (void)setHasReported:(BOOL)a3
{
  self->_hasReported = a3;
}

- (BOOL)isAnalyzeMode
{
  return self->_isAnalyzeMode;
}

- (void)setIsAnalyzeMode:(BOOL)a3
{
  self->_isAnalyzeMode = a3;
}

- (double)lastSilencePosterior
{
  return self->_lastSilencePosterior;
}

- (void)setLastSilencePosterior:(double)a3
{
  self->_lastSilencePosterior = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_caesuraSPG, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __94__CSSPGEndpointAnalyzer_silenceDurationEstimateAvailable_numEstimates_clientProcessedAudioMs___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id WeakRetained;
  char v4;
  int v5;
  id v6;
  double v7;

  v1 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v1 + 9))
  {
    WeakRetained = objc_loadWeakRetained((id *)(v1 + 16));
    v4 = objc_opt_respondsToSelector();

    if ((v4 & 1) != 0 && *(int *)(a1 + 40) >= 1)
    {
      v5 = 0;
      do
      {
        v6 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
        LODWORD(v7) = *(_DWORD *)(a1 + 48);
        objc_msgSend(v6, "spgEndpointAnalyzer:hasSilenceScoreEstimate:clientProcessedAudioTimeMS:", *(double *)(*(_QWORD *)(a1 + 32) + 40), v7);

        ++v5;
      }
      while (v5 < *(_DWORD *)(a1 + 40));
    }
  }
}

uint64_t __56__CSSPGEndpointAnalyzer_clientSilenceFeaturesAvailable___block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = objc_msgSend(*(id *)(a1 + 40), "silencePosterior");
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) = v3;
  return result;
}

uint64_t __45__CSSPGEndpointAnalyzer_addAudio_numSamples___block_invoke(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 32), "addAudio:numSamples:", a1[5], a1[6]);
}

uint64_t __43__CSSPGEndpointAnalyzer_getFrameDurationMs__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "getFrameDurationMs");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

void __29__CSSPGEndpointAnalyzer_stop__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "endAudio");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 32);
  *(_QWORD *)(v2 + 32) = 0;

  v4 = *MEMORY[0x1E0D18F40];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F40], OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[CSSPGEndpointAnalyzer stop]_block_invoke";
    _os_log_impl(&dword_1C2614000, v4, OS_LOG_TYPE_DEFAULT, "%s Stopped monitoring : EARCaesuraSilencePosteriorGenerator", (uint8_t *)&v5, 0xCu);
  }
}

void __30__CSSPGEndpointAnalyzer_reset__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  int v14;
  const char *v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = 0;
  objc_msgSend(MEMORY[0x1E0D18FC0], "fallBackAssetResourcePath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("hybridendpointer.json"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "fileExistsAtPath:", v3);

  if (v5)
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0D1F0D8]), "initWithConfigFile:", v3);
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(v7 + 32);
    *(_QWORD *)(v7 + 32) = v6;

    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(void **)(v9 + 32);
    if (v10)
    {
      objc_msgSend(v10, "setDelegate:");
      v11 = *MEMORY[0x1E0D18F40];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F40], OS_LOG_TYPE_DEFAULT))
      {
        v12 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32);
        v14 = 136315394;
        v15 = "-[CSSPGEndpointAnalyzer reset]_block_invoke";
        v16 = 2114;
        v17 = v12;
        _os_log_impl(&dword_1C2614000, v11, OS_LOG_TYPE_DEFAULT, "%s Start monitoring : EARCaesuraSilencePosteriorGenerator: %{public}@", (uint8_t *)&v14, 0x16u);
      }
      v9 = *(_QWORD *)(a1 + 32);
    }
    *(_QWORD *)(v9 + 40) = 0x3FF0000000000000;
  }
  else
  {
    v13 = *MEMORY[0x1E0D18F40];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F40], OS_LOG_TYPE_ERROR))
    {
      v14 = 136315138;
      v15 = "-[CSSPGEndpointAnalyzer reset]_block_invoke";
      _os_log_error_impl(&dword_1C2614000, v13, OS_LOG_TYPE_ERROR, "%s Failed to initialize caesuraSPG, stopping monitoring", (uint8_t *)&v14, 0xCu);
    }
  }

}

@end
