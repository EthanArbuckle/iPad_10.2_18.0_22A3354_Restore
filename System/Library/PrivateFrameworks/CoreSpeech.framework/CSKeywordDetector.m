@implementation CSKeywordDetector

- (CSKeywordDetector)initWithManager:(id)a3 asset:(id)a4
{
  id v6;
  id v7;
  CSKeywordDetector *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *queue;
  NSObject *v11;
  NSObject *v12;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CSKeywordDetector;
  v8 = -[CSKeywordDetector init](&v14, sel_init);
  if (v8)
  {
    v9 = dispatch_queue_create("CSKeywordDetector Queue", 0);
    queue = v8->_queue;
    v8->_queue = (OS_dispatch_queue *)v9;

    v11 = v8->_queue;
    dispatch_get_global_queue(33, 0);
    v12 = objc_claimAutoreleasedReturnValue();
    dispatch_set_target_queue(v11, v12);

    objc_storeWeak((id *)&v8->_speechManager, v6);
    -[CSKeywordDetector _setAsset:](v8, "_setAsset:", v7);
  }

  return v8;
}

- (void)startDetectKeyword:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *queue;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v11 = "-[CSKeywordDetector startDetectKeyword:]";
    _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  queue = self->_queue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __40__CSKeywordDetector_startDetectKeyword___block_invoke;
  v8[3] = &unk_1E7C292A0;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_sync(queue, v8);

}

- (void)reset
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __26__CSKeywordDetector_reset__block_invoke;
  block[3] = &unk_1E7C292C8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_reset
{
  self->_analyzedSampleCount = 0;
  self->_decisionWaitSampleCount = 0;
  -[CSKeywordAnalyzerQuasar reset](self->_keywordAnalyzer, "reset");
  self->_isRunningRecognizer = 0;
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
  v7[2] = __30__CSKeywordDetector_setAsset___block_invoke;
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
  CSKeywordAnalyzerQuasar *v7;
  CSKeywordAnalyzerQuasar *keywordAnalyzer;
  float v9;
  NSObject *v10;
  int v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    objc_storeStrong((id *)&self->_currentAsset, a3);
    -[CSAsset keywordDetectorConfigPathRecognizer](self->_currentAsset, "keywordDetectorConfigPathRecognizer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (CSKeywordAnalyzerQuasar *)objc_msgSend(objc_alloc(MEMORY[0x1E0D19150]), "initWithConfigPath:triggerTokens:useKeywordSpotting:", v6, 0, 1);
    keywordAnalyzer = self->_keywordAnalyzer;
    self->_keywordAnalyzer = v7;

    -[CSKeywordAnalyzerQuasar setDelegate:](self->_keywordAnalyzer, "setDelegate:", self);
    -[CSAsset keywordDetectorThreshold](self->_currentAsset, "keywordDetectorThreshold");
    self->_keywordThreshold = v9;
    -[CSKeywordDetector _reset](self, "_reset");

  }
  else
  {
    v10 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      v11 = 136315138;
      v12 = "-[CSKeywordDetector _setAsset:]";
      _os_log_impl(&dword_1C2614000, v10, OS_LOG_TYPE_DEFAULT, "%s asset is nil, stop initialization", (uint8_t *)&v11, 0xCu);
    }
  }

}

- (void)speechManagerLPCMRecordBufferAvailable:(id)a3 chunk:(id)a4
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
  v8[2] = __66__CSKeywordDetector_speechManagerLPCMRecordBufferAvailable_chunk___block_invoke;
  v8[3] = &unk_1E7C292A0;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(queue, v8);

}

- (void)speechManagerDidStartForwarding:(id)a3 successfully:(BOOL)a4 error:(id)a5
{
  NSObject *v6;
  NSObject *queue;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v10 = "-[CSKeywordDetector speechManagerDidStartForwarding:successfully:error:]";
    _os_log_impl(&dword_1C2614000, v6, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72__CSKeywordDetector_speechManagerDidStartForwarding_successfully_error___block_invoke;
  block[3] = &unk_1E7C292C8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)speechManagerDidStopForwarding:(id)a3 forReason:(int64_t)a4
{
  NSObject *v5;
  NSObject *queue;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v9 = "-[CSKeywordDetector speechManagerDidStopForwarding:forReason:]";
    _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__CSKeywordDetector_speechManagerDidStopForwarding_forReason___block_invoke;
  block[3] = &unk_1E7C292C8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)keywordAnalyzerQuasar:(id)a3 hasResultAvailable:(id)a4 forChannel:(unint64_t)a5
{
  double v6;
  float v7;
  float keywordThreshold;
  NSObject *v9;
  _BOOL4 v10;
  unint64_t v11;
  NSObject *queue;
  unint64_t analyzedSampleCount;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  unint64_t v18;
  __int16 v19;
  double v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "triggerConfidence");
  v7 = v6;
  keywordThreshold = self->_keywordThreshold;
  v9 = *MEMORY[0x1E0D18F60];
  v10 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT);
  if (keywordThreshold >= v7)
  {
    if (v10)
    {
      analyzedSampleCount = self->_analyzedSampleCount;
      *(_DWORD *)buf = 136315650;
      v16 = "-[CSKeywordDetector keywordAnalyzerQuasar:hasResultAvailable:forChannel:]";
      v17 = 2048;
      v18 = analyzedSampleCount;
      v19 = 2050;
      v20 = v7;
      _os_log_impl(&dword_1C2614000, v9, OS_LOG_TYPE_DEFAULT, "%s Keyword NOT detected at %tu with %{public}.3f confidence", buf, 0x20u);
    }
  }
  else
  {
    if (v10)
    {
      v11 = self->_analyzedSampleCount;
      *(_DWORD *)buf = 136315650;
      v16 = "-[CSKeywordDetector keywordAnalyzerQuasar:hasResultAvailable:forChannel:]";
      v17 = 2050;
      v18 = v11;
      v19 = 2050;
      v20 = v7;
      _os_log_impl(&dword_1C2614000, v9, OS_LOG_TYPE_DEFAULT, "%s Keyword detected at %{public}tu with %{public}.3f confidence", buf, 0x20u);
    }
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __73__CSKeywordDetector_keywordAnalyzerQuasar_hasResultAvailable_forChannel___block_invoke;
    block[3] = &unk_1E7C292C8;
    block[4] = self;
    dispatch_async(queue, block);
  }
}

- (CSVoiceTriggerDelegate)delegate
{
  return (CSVoiceTriggerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CSSpeechManager)speechManager
{
  return (CSSpeechManager *)objc_loadWeakRetained((id *)&self->_speechManager);
}

- (void)setSpeechManager:(id)a3
{
  objc_storeWeak((id *)&self->_speechManager, a3);
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

- (CSKeywordAnalyzerQuasar)keywordAnalyzer
{
  return self->_keywordAnalyzer;
}

- (void)setKeywordAnalyzer:(id)a3
{
  objc_storeStrong((id *)&self->_keywordAnalyzer, a3);
}

- (float)keywordThreshold
{
  return self->_keywordThreshold;
}

- (void)setKeywordThreshold:(float)a3
{
  self->_keywordThreshold = a3;
}

- (unint64_t)analyzedSampleCount
{
  return self->_analyzedSampleCount;
}

- (void)setAnalyzedSampleCount:(unint64_t)a3
{
  self->_analyzedSampleCount = a3;
}

- (unint64_t)decisionWaitSampleCount
{
  return self->_decisionWaitSampleCount;
}

- (void)setDecisionWaitSampleCount:(unint64_t)a3
{
  self->_decisionWaitSampleCount = a3;
}

- (BOOL)isRunningRecognizer
{
  return self->_isRunningRecognizer;
}

- (void)setIsRunningRecognizer:(BOOL)a3
{
  self->_isRunningRecognizer = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keywordAnalyzer, 0);
  objc_storeStrong((id *)&self->_currentAsset, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_speechManager);
  objc_destroyWeak((id *)&self->_delegate);
}

void __73__CSKeywordDetector_keywordAnalyzerQuasar_hasResultAvailable_forChannel___block_invoke(uint64_t a1)
{
  id WeakRetained;
  char v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    v4 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
    objc_msgSend(v4, "keywordDetectorDidDetectKeyword");

  }
}

uint64_t __62__CSKeywordDetector_speechManagerDidStopForwarding_forReason___block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(result + 32);
  if (*(_BYTE *)(v1 + 8))
  {
    v2 = result;
    result = objc_msgSend(*(id *)(v1 + 48), "endAudio");
    *(_BYTE *)(*(_QWORD *)(v2 + 32) + 8) = 0;
  }
  return result;
}

uint64_t __72__CSKeywordDetector_speechManagerDidStartForwarding_successfully_error___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "runRecognition");
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = 1;
  return result;
}

void __66__CSKeywordDetector_speechManagerLPCMRecordBufferAvailable_chunk___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  NSObject *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v1 + 40))
  {
    if (*(_BYTE *)(v1 + 8))
    {
      v3 = *(void **)(v1 + 48);
      if (*(_QWORD *)(v1 + 56) >= *(_QWORD *)(v1 + 64))
      {
        objc_msgSend(v3, "endAudio");
        *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = 0;
      }
      else
      {
        objc_msgSend(v3, "processAudioChunk:", *(_QWORD *)(a1 + 40));
        *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56) += objc_msgSend(*(id *)(a1 + 40), "numSamples");
      }
    }
  }
  else
  {
    v4 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
    {
      v5 = 136315138;
      v6 = "-[CSKeywordDetector speechManagerLPCMRecordBufferAvailable:chunk:]_block_invoke";
      _os_log_error_impl(&dword_1C2614000, v4, OS_LOG_TYPE_ERROR, "%s Could not find Assets. Cannot process Audio", (uint8_t *)&v5, 0xCu);
    }
  }
}

uint64_t __30__CSKeywordDetector_setAsset___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setAsset:", *(_QWORD *)(a1 + 40));
}

uint64_t __26__CSKeywordDetector_reset__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reset");
}

void __40__CSKeywordDetector_startDetectKeyword___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;
  float v7;
  unint64_t v8;
  float v9;
  float v10;
  float v11;
  void *v12;
  unint64_t v13;
  void *v14;
  NSObject *v15;
  float v16;
  int v17;
  const char *v18;
  __int16 v19;
  unint64_t v20;
  __int16 v21;
  double v22;
  __int16 v23;
  unint64_t v24;
  __int16 v25;
  double v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", *MEMORY[0x1E0D195A8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setActiveChannel:", objc_msgSend(v3, "unsignedIntegerValue"));

  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", *MEMORY[0x1E0D19738]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  v6 = v5;

  objc_msgSend(MEMORY[0x1E0D19090], "inputRecordingSampleRate");
  v8 = (unint64_t)(v6 * v7);
  objc_msgSend(MEMORY[0x1E0D19090], "inputRecordingSampleRate");
  v10 = v9;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "keywordDetectorWaitTimeSinceVT");
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64) = (unint64_t)(float)((float)v8 + (float)(v10 * v11));
  v12 = (void *)*MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64);
    v14 = (void *)MEMORY[0x1E0D19090];
    v15 = v12;
    objc_msgSend(v14, "inputRecordingSampleRate");
    v17 = 136316162;
    v18 = "-[CSKeywordDetector startDetectKeyword:]_block_invoke";
    v19 = 2050;
    v20 = v13;
    v21 = 2050;
    v22 = (float)((float)v13 / v16);
    v23 = 2050;
    v24 = v8;
    v25 = 2050;
    v26 = v6;
    _os_log_impl(&dword_1C2614000, v15, OS_LOG_TYPE_DEFAULT, "%s Setting decisionWaitSampleCount at %{public}tu (%{public}.3f) given vtEndSampleCount at %{public}tu (%{public}.3f)", (uint8_t *)&v17, 0x34u);

  }
}

@end
