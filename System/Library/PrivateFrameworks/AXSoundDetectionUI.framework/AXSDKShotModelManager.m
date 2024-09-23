@implementation AXSDKShotModelManager

- (AXSDKShotModelManager)init
{
  AXSDKShotModelManager *v2;
  uint64_t v3;
  NSMutableDictionary *currentRequests;
  NSObject *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *audioQueue;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AXSDKShotModelManager;
  v2 = -[AXSDKShotModelManager init](&v9, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    currentRequests = v2->_currentRequests;
    v2->_currentRequests = (NSMutableDictionary *)v3;

    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = dispatch_queue_create("kshot_ultron_audio", v5);
    audioQueue = v2->_audioQueue;
    v2->_audioQueue = (OS_dispatch_queue *)v6;

  }
  return v2;
}

- (NSArray)currentDetectors
{
  return (NSArray *)-[NSMutableDictionary allKeys](self->_currentRequests, "allKeys");
}

- (BOOL)streamAnalyzerIsRunning
{
  return self->_streamAnalyzer != 0;
}

- (BOOL)startDetectionWithFormat:(id)a3
{
  id v4;
  NSObject *v5;
  double v6;
  NSObject *v7;
  BOOL v8;
  SNAudioStreamAnalyzer *streamAnalyzer;
  SNAudioStreamAnalyzer *v11;
  SNAudioStreamAnalyzer *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  SNAudioStreamAnalyzer *v19;
  id v20;
  BOOL v21;
  void *v22;
  NSObject *v23;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _AXAssertIsMainThread();
  AXLogUltron();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[AXSDKShotModelManager startDetectionWithFormat:].cold.4();

  if (objc_msgSend(v4, "channelCount") && (objc_msgSend(v4, "sampleRate"), v6 != 0.0))
  {
    streamAnalyzer = self->_streamAnalyzer;
    if (!streamAnalyzer)
    {
      v11 = (SNAudioStreamAnalyzer *)objc_msgSend(objc_alloc(MEMORY[0x24BDE9AD8]), "initWithFormat:", v4);
      v12 = self->_streamAnalyzer;
      self->_streamAnalyzer = v11;

      streamAnalyzer = self->_streamAnalyzer;
    }
    -[SNAudioStreamAnalyzer removeAllRequests](streamAnalyzer, "removeAllRequests");
    AXLogUltron();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      -[AXSDKShotModelManager startDetectionWithFormat:].cold.3((uint64_t)self, v13);

    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    -[NSMutableDictionary allValues](self->_currentRequests, "allValues");
    v7 = objc_claimAutoreleasedReturnValue();
    v14 = -[NSObject countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v27;
      while (2)
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v27 != v16)
            objc_enumerationMutation(v7);
          v18 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i);
          v19 = self->_streamAnalyzer;
          v25 = 0;
          -[SNAudioStreamAnalyzer addRequest:withObserver:error:](v19, "addRequest:withObserver:error:", v18, self, &v25);
          v20 = v25;
          if (self->_streamAnalyzer)
            v21 = v20 == 0;
          else
            v21 = 0;
          if (!v21)
          {
            v22 = v20;
            AXLogUltron();
            v23 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
              -[AXSDDetectorManager _startDetectionWithFormat:].cold.2();

            -[AXSDKShotModelManager stopDetection](self, "stopDetection");
            goto LABEL_7;
          }
        }
        v15 = -[NSObject countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
        v8 = 1;
        if (v15)
          continue;
        break;
      }
    }
    else
    {
      v8 = 1;
    }
  }
  else
  {
    AXLogUltron();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[AXSDKShotModelManager startDetectionWithFormat:].cold.1();
LABEL_7:
    v8 = 0;
  }

  return v8;
}

- (void)stopDetection
{
  SNAudioStreamAnalyzer *streamAnalyzer;

  _AXAssertIsMainThread();
  -[SNAudioStreamAnalyzer removeAllRequests](self->_streamAnalyzer, "removeAllRequests");
  streamAnalyzer = self->_streamAnalyzer;
  self->_streamAnalyzer = 0;

}

- (BOOL)addCustomDetector:(id)a3
{
  id v4;
  NSMutableDictionary *currentRequests;
  uint64_t *p_currentRequests;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  SNAudioStreamAnalyzer *streamAnalyzer;
  id v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  BOOL v18;
  NSObject *v19;
  id v21;

  v4 = a3;
  _AXAssertIsMainThread();
  p_currentRequests = (uint64_t *)&self->_currentRequests;
  currentRequests = self->_currentRequests;
  objc_msgSend(v4, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](currentRequests, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    +[AXSDKShotModelManager requestForDetector:](AXSDKShotModelManager, "requestForDetector:", v4);
    v9 = objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      if (!-[AXSDKShotModelManager streamAnalyzerIsRunning](self, "streamAnalyzerIsRunning"))
        goto LABEL_12;
      AXLogUltron();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        -[AXSDKShotModelManager addCustomDetector:].cold.4(v10);

      streamAnalyzer = self->_streamAnalyzer;
      v21 = 0;
      -[SNAudioStreamAnalyzer addRequest:withObserver:error:](streamAnalyzer, "addRequest:withObserver:error:", v9, self, &v21);
      v12 = v21;
      if (!v12)
      {
LABEL_12:
        v15 = (void *)*p_currentRequests;
        objc_msgSend(v4, "identifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setObject:forKeyedSubscript:", v9, v16);

        AXLogUltron();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
          -[AXSDKShotModelManager addCustomDetector:].cold.2(v4, p_currentRequests, v17);

        goto LABEL_15;
      }
      v13 = v12;
      AXLogUltron();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        -[AXSDKShotModelManager addCustomDetector:].cold.3();

    }
    else
    {
      AXLogUltron();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        -[AXSDKShotModelManager addCustomDetector:].cold.1(v4, v19);

    }
    v18 = 0;
    goto LABEL_20;
  }
  AXLogUltron();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[AXSDKShotModelManager addCustomDetector:].cold.5(v4, v9);
LABEL_15:
  v18 = 1;
LABEL_20:

  return v18;
}

- (BOOL)removeCustomDetector:(id)a3
{
  id v4;
  NSMutableDictionary *currentRequests;
  void *v6;
  void *v7;
  NSMutableDictionary *v8;
  void *v9;
  NSObject *v10;

  v4 = a3;
  _AXAssertIsMainThread();
  currentRequests = self->_currentRequests;
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](currentRequests, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    if (-[AXSDKShotModelManager streamAnalyzerIsRunning](self, "streamAnalyzerIsRunning"))
      -[SNAudioStreamAnalyzer removeRequest:](self->_streamAnalyzer, "removeRequest:", v7);
    v8 = self->_currentRequests;
    objc_msgSend(v4, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeObjectForKey:](v8, "removeObjectForKey:", v9);

  }
  else
  {
    AXLogUltron();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[AXSDKShotModelManager removeCustomDetector:].cold.1(v4, v10);

  }
  return 1;
}

- (void)removeAllDetectors
{
  _AXAssertIsMainThread();
  -[NSMutableDictionary removeAllObjects](self->_currentRequests, "removeAllObjects");
  if (-[AXSDKShotModelManager streamAnalyzerIsRunning](self, "streamAnalyzerIsRunning"))
    -[SNAudioStreamAnalyzer removeAllRequests](self->_streamAnalyzer, "removeAllRequests");
}

+ (id)requestForDetector:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  BOOL v8;
  NSObject *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int64_t v16;
  void *v18;
  CMTime v19;
  CMTime v20;
  id v21;

  v3 = a3;
  objc_msgSend(v3, "mlModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v21 = 0;
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDE9AF8]), "initWithMLModel:error:", v4, &v21);
    v6 = v21;
    v7 = v6;
    if (v5)
      v8 = v6 == 0;
    else
      v8 = 0;
    if (v8)
    {
      objc_msgSend(v4, "modelDescription");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "inputDescriptionsByName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("td_audio"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "multiArrayConstraint");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "shape");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "lastObject");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "int64ValueSafe");

      CMTimeMake(&v20, v16, 16000);
      v19 = v20;
      objc_msgSend(v5, "setWindowDuration:", &v19);
      objc_msgSend(v5, "setOverlapFactor:", (float)((float)((float)v16 + -7800.0) / (float)v16));
      v10 = v5;
    }
    else
    {
      AXLogUltron();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        +[AXSDKShotModelManager requestForDetector:].cold.2(v3);

      v10 = 0;
    }

  }
  else
  {
    AXLogUltron();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      +[AXSDKShotModelManager requestForDetector:].cold.1(v3);
    v10 = 0;
  }

  return v10;
}

- (void)processAudioBuffer:(id)a3 atTime:(id)a4
{
  id v6;
  id v7;
  NSObject *audioQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  audioQueue = self->_audioQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __51__AXSDKShotModelManager_processAudioBuffer_atTime___block_invoke;
  block[3] = &unk_24DDF6BD0;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(audioQueue, block);

}

uint64_t __51__AXSDKShotModelManager_processAudioBuffer_atTime___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "analyzeAudioBuffer:atAudioFramePosition:", *(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 48), "sampleTime"));
}

- (void)request:(id)a3 didProduceResult:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "timeRange");
    if ((v10 & 0x8000000000000000) != 0)
      goto LABEL_6;
  }
  else
  {
    v11 = 0u;
    v12 = 0u;
    v10 = 0u;
  }
  -[AXSDKShotModelManager delegate](self, "delegate", v10, v11, v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "receivedObservation:forDetector:", v8, v6);

LABEL_6:
}

- (void)request:(id)a3 didFailWithError:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  AXLogUltron();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    -[AXSDKShotModelManager request:didFailWithError:].cold.1();

  -[AXSDKShotModelManager delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "receivedError:fromDetector:", v6, v7);

}

- (void)requestDidComplete:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AXSDKShotModelManager delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "receivedCompletion:", v4);

}

- (AXSDKShotModelManagerDelegate)delegate
{
  return (AXSDKShotModelManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSMutableDictionary)currentRequests
{
  return self->_currentRequests;
}

- (void)setCurrentRequests:(id)a3
{
  objc_storeStrong((id *)&self->_currentRequests, a3);
}

- (OS_dispatch_queue)audioQueue
{
  return self->_audioQueue;
}

- (void)setAudioQueue:(id)a3
{
  objc_storeStrong((id *)&self->_audioQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioQueue, 0);
  objc_storeStrong((id *)&self->_currentRequests, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_streamAnalyzer, 0);
}

- (void)startDetectionWithFormat:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_21ACD4000, v0, v1, "Custom Detection Controller: Received an invalid input format. %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)startDetectionWithFormat:(uint64_t)a1 .cold.3(uint64_t a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 24), "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "count");
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_4_0(&dword_21ACD4000, a2, v4, "Custom Detection Controller: adding %lu request to stream analyzer", v5);

  OUTLINED_FUNCTION_2_1();
}

- (void)startDetectionWithFormat:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_4_0(&dword_21ACD4000, v0, v1, "Custom Detection Controller: startDetectionWithFormat: %@", v2);
  OUTLINED_FUNCTION_2();
}

- (void)addCustomDetector:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v4;
  void *v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  _os_log_error_impl(&dword_21ACD4000, a2, OS_LOG_TYPE_ERROR, "Unable to create request for custom detector: %@ %@", v6, 0x16u);

  OUTLINED_FUNCTION_5();
}

- (void)addCustomDetector:(NSObject *)a3 .cold.2(void *a1, uint64_t *a2, NSObject *a3)
{
  void *v6;
  void *v7;
  uint64_t v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *a2;
  v9 = 138412802;
  v10 = v6;
  v11 = 2112;
  v12 = v7;
  v13 = 2112;
  v14 = v8;
  _os_log_debug_impl(&dword_21ACD4000, a3, OS_LOG_TYPE_DEBUG, "Custom Detector Model manager: added detector %@ %@ currentRequests: %@", (uint8_t *)&v9, 0x20u);

  OUTLINED_FUNCTION_2_2();
}

- (void)addCustomDetector:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_21ACD4000, v0, v1, "Custom Detector: Unable to add request to stream analyzer: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)addCustomDetector:(os_log_t)log .cold.4(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_21ACD4000, log, OS_LOG_TYPE_DEBUG, "Custom Detector: Stream analyzer already running - adding request directly", v1, 2u);
}

- (void)addCustomDetector:(void *)a1 .cold.5(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_4_0(&dword_21ACD4000, a2, v4, "Add Custom Detector: Detector %@ has already been added to the request.", v5);

  OUTLINED_FUNCTION_2_1();
}

- (void)removeCustomDetector:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v4;
  void *v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  _os_log_debug_impl(&dword_21ACD4000, a2, OS_LOG_TYPE_DEBUG, "Remove Custom Detector: unable to remove. %@ %@ is not currently present.", v6, 0x16u);

  OUTLINED_FUNCTION_5();
}

+ (void)requestForDetector:(void *)a1 .cold.1(void *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  objc_msgSend(a1, "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_3(&dword_21ACD4000, v4, v5, "Unable to create model from compiled model for detector %@ %@. error: %@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2_2();
}

+ (void)requestForDetector:(void *)a1 .cold.2(void *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  objc_msgSend(a1, "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_3(&dword_21ACD4000, v3, v4, "Unable to create request from detector %@ %@. error: %@", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_2_2();
}

- (void)request:didFailWithError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_21ACD4000, v0, v1, "Request failed: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
