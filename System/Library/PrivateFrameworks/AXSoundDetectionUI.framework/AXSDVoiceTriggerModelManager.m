@implementation AXSDVoiceTriggerModelManager

- (AXSDVoiceTriggerModelManager)initWithError:(id *)a3
{
  AXSDVoiceTriggerModelManager *v3;
  AXSDVoiceTriggerModelManager *v4;
  AVAudioFormat *format;
  NSURL *assetPath;
  AXSDVoiceTriggerAssetManager *v7;
  AXSDVoiceTriggerAssetManager *assetManager;
  NSObject *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *analyzerQueue;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)AXSDVoiceTriggerModelManager;
  v3 = -[AXSDVoiceTriggerModelManager init](&v13, sel_init, a3);
  v4 = v3;
  if (v3)
  {
    v3->_startRequested = 0;
    format = v3->_format;
    v3->_format = 0;

    assetPath = v4->_assetPath;
    v4->_assetPath = 0;

    v7 = -[AXSDVoiceTriggerAssetManager initWithDelegate:]([AXSDVoiceTriggerAssetManager alloc], "initWithDelegate:", v4);
    assetManager = v4->_assetManager;
    v4->_assetManager = v7;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = dispatch_queue_create("com.apple.accessibility.axsoundactions.analyzer", v9);
    analyzerQueue = v4->_analyzerQueue;
    v4->_analyzerQueue = (OS_dispatch_queue *)v10;

  }
  return v4;
}

- (OS_dispatch_queue)processingQueue
{
  return self->_analyzerQueue;
}

- (void)startListeningWithFormat:(id)a3
{
  id v4;
  NSObject *analyzerQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  analyzerQueue = self->_analyzerQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __57__AXSDVoiceTriggerModelManager_startListeningWithFormat___block_invoke;
  v7[3] = &unk_24DDF6B58;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(analyzerQueue, v7);

}

uint64_t __57__AXSDVoiceTriggerModelManager_startListeningWithFormat___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_startListeningWithFormat:", *(_QWORD *)(a1 + 40));
}

- (void)_startListeningWithFormat:(id)a3
{
  objc_storeStrong((id *)&self->_format, a3);
  self->_startRequested = 1;
  if (self->_assetPath)
    -[AXSDVoiceTriggerModelManager _startListening](self, "_startListening");
}

- (void)startListening
{
  NSObject *analyzerQueue;
  _QWORD block[5];

  analyzerQueue = self->_analyzerQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __46__AXSDVoiceTriggerModelManager_startListening__block_invoke;
  block[3] = &unk_24DDF6AE0;
  block[4] = self;
  dispatch_async(analyzerQueue, block);
}

uint64_t __46__AXSDVoiceTriggerModelManager_startListening__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_startListening");
}

- (void)_startListening
{
  OUTLINED_FUNCTION_0_0(&dword_21ACD4000, a2, a3, "AXSDVoiceTriggerModelManager: startListeningWithFormat: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)processAudioBuffer:(id)a3 atTime:(id)a4
{
  id v6;
  id v7;
  NSObject *analyzerQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  AXSDVoiceTriggerModelManager *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  analyzerQueue = self->_analyzerQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __58__AXSDVoiceTriggerModelManager_processAudioBuffer_atTime___block_invoke;
  block[3] = &unk_24DDF6BD0;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(analyzerQueue, block);

}

uint64_t __58__AXSDVoiceTriggerModelManager_processAudioBuffer_atTime___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  AXLogTemp();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_21ACD4000, v2, OS_LOG_TYPE_INFO, "async process audio buffer: %@", (uint8_t *)&v5, 0xCu);
  }

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "analyzeAudioBuffer:atAudioFramePosition:", *(_QWORD *)(a1 + 32), objc_msgSend(*(id *)(a1 + 48), "sampleTime"));
}

- (void)stopListening
{
  NSObject *analyzerQueue;
  _QWORD block[5];

  analyzerQueue = self->_analyzerQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __45__AXSDVoiceTriggerModelManager_stopListening__block_invoke;
  block[3] = &unk_24DDF6AE0;
  block[4] = self;
  dispatch_async(analyzerQueue, block);
}

uint64_t __45__AXSDVoiceTriggerModelManager_stopListening__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_stopListeningWithError:", 0);
}

- (void)_stopListening
{
  -[AXSDVoiceTriggerModelManager _stopListeningWithError:](self, "_stopListeningWithError:", 0);
}

- (void)stopListeningWithError:(id)a3
{
  NSObject *analyzerQueue;
  _QWORD block[5];

  analyzerQueue = self->_analyzerQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __55__AXSDVoiceTriggerModelManager_stopListeningWithError___block_invoke;
  block[3] = &unk_24DDF6AE0;
  block[4] = self;
  dispatch_async(analyzerQueue, block);
}

uint64_t __55__AXSDVoiceTriggerModelManager_stopListeningWithError___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "stopListeningWithError:", 0);
}

- (void)_stopListeningWithError:(id)a3
{
  SNAudioStreamAnalyzer *streamAnalyzer;
  id v5;
  SNAudioStreamAnalyzer *v6;
  id WeakRetained;

  self->_startRequested = 0;
  streamAnalyzer = self->_streamAnalyzer;
  v5 = a3;
  -[SNAudioStreamAnalyzer removeAllRequests](streamAnalyzer, "removeAllRequests");
  v6 = self->_streamAnalyzer;
  self->_streamAnalyzer = 0;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "listeningStoppedWithError:", v5);

}

- (void)request:(id)a3 didProduceResult:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;

  v6 = a3;
  v7 = a4;
  AXLogSoundActions();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[AXSDVoiceTriggerModelManager request:didProduceResult:].cold.1((uint64_t)v7, v8, v9, v10, v11, v12, v13, v14);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[AXSDVoiceTriggerModelManager delegate](self, "delegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "receivedObservation:forDetector:", v7, v6);

  }
}

- (void)request:(id)a3 didFailWithError:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  AXLogSoundActions();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    -[AXSDVoiceTriggerModelManager request:didFailWithError:].cold.1((uint64_t)v6, (uint64_t)v7, v8);

  -[AXSDVoiceTriggerModelManager delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "receivedError:fromDetector:", v7, v6);

}

- (id)_readConfigFileWithError:(id *)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  void *v14;
  id v15;

  -[NSURL URLByAppendingPathComponent:](self->_assetPath, "URLByAppendingPathComponent:", CFSTR("VoiceTriggerConfig"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLByAppendingPathExtension:", CFSTR("json"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfURL:", v5);
    v6 = objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = (void *)v6;
      v15 = 0;
      objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v6, 0, &v15);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v15;
      if (!v9)
      {

        goto LABEL_14;
      }
      v10 = v9;
      if (a3)
        *a3 = objc_retainAutorelease(v9);

      goto LABEL_12;
    }
    if (a3)
    {
      v11 = (void *)MEMORY[0x24BDD1540];
      v14 = v5;
      v12 = CFSTR("Cannot read config file: %@");
      goto LABEL_11;
    }
LABEL_12:
    v8 = 0;
    goto LABEL_14;
  }
  if (!a3)
    goto LABEL_12;
  v11 = (void *)MEMORY[0x24BDD1540];
  v12 = CFSTR("Cannot locate config file");
LABEL_11:
  objc_msgSend(v11, "ax_errorWithDomain:description:", CFSTR("VoiceTrigger"), v12, v14);
  v8 = 0;
  *a3 = (id)objc_claimAutoreleasedReturnValue();
LABEL_14:

  return v8;
}

- (void)modelDidUpdate:(id)a3 assetVersion:(unint64_t)a4 withError:(id)a5
{
  id v6;
  id v7;
  id v8;
  id v9;

  v6 = a3;
  v9 = a5;
  v7 = v9;
  v8 = v6;
  AXPerformBlockOnMainThread();

}

void __70__AXSDVoiceTriggerModelManager_modelDidUpdate_assetVersion_withError___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  NSObject *v4;
  _QWORD v5[5];
  id v6;
  _QWORD block[5];

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 40), *(id *)(a1 + 40));
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v2 + 40))
  {
    if (*(_BYTE *)(v2 + 32))
    {
      v3 = *(NSObject **)(v2 + 64);
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __70__AXSDVoiceTriggerModelManager_modelDidUpdate_assetVersion_withError___block_invoke_2;
      block[3] = &unk_24DDF6AE0;
      block[4] = v2;
      dispatch_async(v3, block);
    }
  }
  else
  {
    v4 = *(NSObject **)(v2 + 64);
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __70__AXSDVoiceTriggerModelManager_modelDidUpdate_assetVersion_withError___block_invoke_3;
    v5[3] = &unk_24DDF6B58;
    v5[4] = v2;
    v6 = *(id *)(a1 + 48);
    dispatch_async(v4, v5);

  }
}

uint64_t __70__AXSDVoiceTriggerModelManager_modelDidUpdate_assetVersion_withError___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_startListening");
}

uint64_t __70__AXSDVoiceTriggerModelManager_modelDidUpdate_assetVersion_withError___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_stopListeningWithError:", *(_QWORD *)(a1 + 40));
}

- (AXSDVoiceTriggerModelManagerDelegate)delegate
{
  return (AXSDVoiceTriggerModelManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setProcessingQueue:(id)a3
{
  objc_storeStrong((id *)&self->_processingQueue, a3);
}

- (OS_dispatch_queue)analyzerQueue
{
  return self->_analyzerQueue;
}

- (void)setAnalyzerQueue:(id)a3
{
  objc_storeStrong((id *)&self->_analyzerQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyzerQueue, 0);
  objc_storeStrong((id *)&self->_processingQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_assetPath, 0);
  objc_storeStrong((id *)&self->_assetManager, 0);
  objc_storeStrong((id *)&self->_format, 0);
  objc_storeStrong((id *)&self->_streamAnalyzer, 0);
}

- (void)request:(uint64_t)a3 didProduceResult:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21ACD4000, a2, a3, "AXSDVoiceTriggerModelManager: didProduceResult: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)request:(os_log_t)log didFailWithError:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl(&dword_21ACD4000, log, OS_LOG_TYPE_ERROR, "Voice Trigger Request failed: %@, %@", (uint8_t *)&v3, 0x16u);
  OUTLINED_FUNCTION_2();
}

@end
