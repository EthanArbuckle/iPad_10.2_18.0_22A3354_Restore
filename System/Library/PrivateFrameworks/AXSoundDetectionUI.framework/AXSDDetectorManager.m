@implementation AXSDDetectorManager

- (AXSDDetectorManager)init
{
  AXSDDetectorManager *v2;
  uint64_t v3;
  NSMutableDictionary *currentAssetIdsByType;
  uint64_t v5;
  NSMutableDictionary *currentRequestsByAssetID;
  NSObject *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *analyzerQueue;
  SNDetectSoundRequest *currentGeneralApplianceRequest;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)AXSDDetectorManager;
  v2 = -[AXSDDetectorManager init](&v12, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    currentAssetIdsByType = v2->_currentAssetIdsByType;
    v2->_currentAssetIdsByType = (NSMutableDictionary *)v3;

    v5 = objc_opt_new();
    currentRequestsByAssetID = v2->_currentRequestsByAssetID;
    v2->_currentRequestsByAssetID = (NSMutableDictionary *)v5;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = dispatch_queue_create("com.apple.accessibility.axhadetector.analyzer", v7);
    analyzerQueue = v2->_analyzerQueue;
    v2->_analyzerQueue = (OS_dispatch_queue *)v8;

    +[AXSDDetectorManager initializeModelMap](AXSDDetectorManager, "initializeModelMap");
    currentGeneralApplianceRequest = v2->_currentGeneralApplianceRequest;
    v2->_currentGeneralApplianceRequest = 0;

  }
  return v2;
}

- (NSArray)currentDetectors
{
  return (NSArray *)-[NSMutableDictionary allKeys](self->_currentAssetIdsByType, "allKeys");
}

- (BOOL)streamAnalyzerIsRunning
{
  return self->_streamAnalyzer != 0;
}

- (id)_currentRequests
{
  return (id)-[NSMutableDictionary allValues](self->_currentRequestsByAssetID, "allValues");
}

- (id)_currentAssetIDForDetectionType:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->_currentAssetIdsByType, "objectForKey:", a3);
}

- (void)_addCurrentRequest:(id)a3 withDetector:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSMutableDictionary *currentAssetIdsByType;
  void *v10;
  void *v11;
  void *v12;
  NSMutableDictionary *currentRequestsByAssetID;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  id v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  AXLogUltron();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v17 = (void *)objc_opt_class();
    v18 = v17;
    objc_msgSend(v7, "model");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "assetId");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 138413058;
    v22 = v17;
    v23 = 2112;
    v24 = v7;
    v25 = 2112;
    v26 = v6;
    v27 = 2112;
    v28 = v20;
    _os_log_debug_impl(&dword_21ACD4000, v8, OS_LOG_TYPE_DEBUG, "[%@]: Adding current detector: %@, with request: %@, and assetID: %@", (uint8_t *)&v21, 0x2Au);

  }
  currentAssetIdsByType = self->_currentAssetIdsByType;
  objc_msgSend(v7, "model");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "assetId");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](currentAssetIdsByType, "setObject:forKey:", v11, v12);

  currentRequestsByAssetID = self->_currentRequestsByAssetID;
  objc_msgSend(v7, "model");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "assetId");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](currentRequestsByAssetID, "setObject:forKey:", v6, v15);

  +[AXSDDetectorStore sharedInstance](AXSDDetectorStore, "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "enableDetector:", v7);

}

- (void)_removeCurrentRequestForDetectionType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  int v12;
  id v13;
  __int16 v14;
  id v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[NSMutableDictionary objectForKey:](self->_currentAssetIdsByType, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    +[AXSDDetectorStore sharedInstance](AXSDDetectorStore, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "detectorWithAssetID:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    +[AXSDDetectorStore sharedInstance](AXSDDetectorStore, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "disableDetector:", v7);

    AXLogUltron();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      v12 = 138412802;
      v13 = (id)objc_opt_class();
      v14 = 2112;
      v15 = v4;
      v16 = 2112;
      v17 = v7;
      v11 = v13;
      _os_log_debug_impl(&dword_21ACD4000, v9, OS_LOG_TYPE_DEBUG, "[%@]: removing current detection type: %@ with asset: %@", (uint8_t *)&v12, 0x20u);

    }
    -[NSMutableDictionary removeObjectForKey:](self->_currentRequestsByAssetID, "removeObjectForKey:", v5);
    -[NSMutableDictionary removeObjectForKey:](self->_currentAssetIdsByType, "removeObjectForKey:", v4);
  }
  else
  {
    AXLogUltron();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[AXSDDetectorManager _removeCurrentRequestForDetectionType:].cold.1();

    +[AXSDDetectorStore sharedInstance](AXSDDetectorStore, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "disableDetectorWithIdentifier:", v4);
  }

}

- (id)_currentRequestForDetectionType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;

  v4 = a3;
  -[NSMutableDictionary objectForKey:](self->_currentAssetIdsByType, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[NSMutableDictionary objectForKey:](self->_currentRequestsByAssetID, "objectForKey:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    AXLogUltron();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[AXSDDetectorManager _currentRequestForDetectionType:].cold.1();

    v6 = 0;
  }

  return v6;
}

- (BOOL)startDetectionWithFormat:(id)a3
{
  id v4;
  NSObject *analyzerQueue;
  id v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  _AXAssertIsMainThread();
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  analyzerQueue = self->_analyzerQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __48__AXSDDetectorManager_startDetectionWithFormat___block_invoke;
  block[3] = &unk_24DDF7020;
  v9 = v4;
  v10 = &v11;
  block[4] = self;
  v6 = v4;
  dispatch_sync(analyzerQueue, block);
  LOBYTE(v4) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)v4;
}

uint64_t __48__AXSDDetectorManager_startDetectionWithFormat___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_startDetectionWithFormat:", *(_QWORD *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (BOOL)_startDetectionWithFormat:(id)a3
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
  AXLogUltron();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[AXSDDetectorManager _startDetectionWithFormat:].cold.4();

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
      -[AXSDDetectorManager _startDetectionWithFormat:].cold.3(self);

    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    -[AXSDDetectorManager _currentRequests](self, "_currentRequests");
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

            -[AXSDDetectorManager stopDetection](self, "stopDetection");
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
      -[AXSDDetectorManager _startDetectionWithFormat:].cold.1();
LABEL_7:
    v8 = 0;
  }

  return v8;
}

- (void)stopDetection
{
  NSObject *analyzerQueue;
  _QWORD block[5];

  _AXAssertIsMainThread();
  analyzerQueue = self->_analyzerQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __36__AXSDDetectorManager_stopDetection__block_invoke;
  block[3] = &unk_24DDF6AE0;
  block[4] = self;
  dispatch_async(analyzerQueue, block);
}

uint64_t __36__AXSDDetectorManager_stopDetection__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_stopDetection");
}

- (void)_stopDetection
{
  SNAudioStreamAnalyzer *streamAnalyzer;

  -[SNAudioStreamAnalyzer removeAllRequests](self->_streamAnalyzer, "removeAllRequests");
  streamAnalyzer = self->_streamAnalyzer;
  self->_streamAnalyzer = 0;

}

- (BOOL)addGeneralApplianceDetector
{
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  SNAudioStreamAnalyzer *streamAnalyzer;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  BOOL v10;
  id v12;

  AXLogUltronKShot();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    -[AXSDDetectorManager addGeneralApplianceDetector].cold.5();

  _AXAssertIsMainThread();
  if (self->_currentGeneralApplianceRequest)
  {
    AXLogUltronKShot();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      -[AXSDDetectorManager addGeneralApplianceDetector].cold.4();
    goto LABEL_15;
  }
  +[AXSDDetectorManager detectorRequestForGeneralApplianceDetector](AXSDDetectorManager, "detectorRequestForGeneralApplianceDetector");
  v4 = objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    AXLogUltronKShot();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[AXSDDetectorManager addGeneralApplianceDetector].cold.1();
    goto LABEL_18;
  }
  if (-[AXSDDetectorManager streamAnalyzerIsRunning](self, "streamAnalyzerIsRunning"))
  {
    AXLogUltronKShot();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[AXSDDetectorManager addGeneralApplianceDetector].cold.3();

    streamAnalyzer = self->_streamAnalyzer;
    v12 = 0;
    -[SNAudioStreamAnalyzer addRequest:withObserver:error:](streamAnalyzer, "addRequest:withObserver:error:", v4, self, &v12);
    v7 = v12;
    if (v7)
    {
      v8 = v7;
      AXLogUltronKShot();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[AXSDDetectorManager addGeneralApplianceDetector].cold.2();

LABEL_18:
      v10 = 0;
      goto LABEL_19;
    }
  }
  objc_storeStrong((id *)&self->_currentGeneralApplianceRequest, v4);
LABEL_15:
  v10 = 1;
LABEL_19:

  return v10;
}

- (BOOL)removeGeneralApplianceDetector
{
  NSObject *v3;
  SNDetectSoundRequest *v4;
  NSObject *currentGeneralApplianceRequest;

  _AXAssertIsMainThread();
  AXLogUltronKShot();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    -[AXSDDetectorManager removeGeneralApplianceDetector].cold.2();

  v4 = self->_currentGeneralApplianceRequest;
  if (v4)
  {
    if (-[AXSDDetectorManager streamAnalyzerIsRunning](self, "streamAnalyzerIsRunning"))
      -[SNAudioStreamAnalyzer removeRequest:](self->_streamAnalyzer, "removeRequest:", v4);
    currentGeneralApplianceRequest = self->_currentGeneralApplianceRequest;
    self->_currentGeneralApplianceRequest = 0;
  }
  else
  {
    AXLogUltronKShot();
    currentGeneralApplianceRequest = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(currentGeneralApplianceRequest, OS_LOG_TYPE_DEBUG))
      -[AXSDDetectorManager removeGeneralApplianceDetector].cold.1();
  }

  return 1;
}

- (BOOL)startGeneralApplianceDetectionWithFormat:(id)a3
{
  id v4;
  NSObject *v5;
  SNAudioStreamAnalyzer *streamAnalyzer;
  SNAudioStreamAnalyzer **p_streamAnalyzer;
  uint64_t v8;
  SNAudioStreamAnalyzer *v9;
  NSObject *v10;
  SNAudioStreamAnalyzer *v11;
  SNDetectSoundRequest *currentGeneralApplianceRequest;
  NSObject *v13;
  NSObject *v14;
  BOOL v15;
  BOOL v16;
  NSObject *v17;
  id v19;

  v4 = a3;
  _AXAssertIsMainThread();
  AXLogUltronKShot();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[AXSDDetectorManager startGeneralApplianceDetectionWithFormat:].cold.4();

  p_streamAnalyzer = &self->_streamAnalyzer;
  streamAnalyzer = self->_streamAnalyzer;
  if (!streamAnalyzer)
  {
    v8 = objc_msgSend(objc_alloc(MEMORY[0x24BDE9AD8]), "initWithFormat:", v4);
    v9 = *p_streamAnalyzer;
    *p_streamAnalyzer = (SNAudioStreamAnalyzer *)v8;

    streamAnalyzer = *p_streamAnalyzer;
  }
  -[SNAudioStreamAnalyzer removeAllRequests](streamAnalyzer, "removeAllRequests");
  if (!self->_currentGeneralApplianceRequest
    && !-[AXSDDetectorManager addGeneralApplianceDetector](self, "addGeneralApplianceDetector"))
  {
    AXLogUltronKShot();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[AXSDDetectorManager startGeneralApplianceDetectionWithFormat:].cold.3();
    goto LABEL_21;
  }
  AXLogUltronKShot();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[AXSDDetectorManager startGeneralApplianceDetectionWithFormat:].cold.2((uint64_t *)&self->_currentGeneralApplianceRequest, (uint64_t *)&self->_streamAnalyzer, v10);

  v11 = self->_streamAnalyzer;
  currentGeneralApplianceRequest = self->_currentGeneralApplianceRequest;
  v19 = 0;
  -[SNAudioStreamAnalyzer addRequest:withObserver:error:](v11, "addRequest:withObserver:error:", currentGeneralApplianceRequest, self, &v19);
  v13 = v19;
  v14 = v13;
  if (self->_streamAnalyzer)
    v15 = v13 == 0;
  else
    v15 = 0;
  v16 = v15;
  if (!v15)
  {
    AXLogUltronKShot();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[AXSDDetectorManager addGeneralApplianceDetector].cold.2();

    -[AXSDDetectorManager stopDetection](self, "stopDetection");
LABEL_21:
    v16 = 0;
  }

  return v16;
}

- (BOOL)addDetector:(id)a3
{
  void *v4;

  objc_msgSend(a3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[AXSDDetectorManager addDetectorType:](self, "addDetectorType:", v4);

  return (char)self;
}

- (BOOL)addDetectorType:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  BOOL v8;
  NSObject *v9;
  BOOL v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *analyzerQueue;
  NSObject *v16;
  _QWORD block[5];
  NSObject *v19;
  _BYTE *v20;
  _BYTE buf[24];
  char v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _AXAssertIsMainThread();
  AXLogUltron();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = objc_opt_class();
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v4;
    v6 = *(id *)&buf[4];
    _os_log_impl(&dword_21ACD4000, v5, OS_LOG_TYPE_INFO, "[%@]: Add Detection Type: %@", buf, 0x16u);

  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->_currentAssetIdsByType, "objectForKeyedSubscript:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7 == 0;

  if (v8)
  {
    +[AXSDDetectorStore sharedInstance](AXSDDetectorStore, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "detectorWithIdentifier:", v4);
    v9 = objc_claimAutoreleasedReturnValue();

    AXLogUltron();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      -[AXSDDetectorManager addDetectorType:].cold.3();

    if (v9)
    {
      +[AXSDDetectorManager detectorRequestForDetector:](AXSDDetectorManager, "detectorRequestForDetector:", v9);
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if (v13)
      {
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = buf;
        *(_QWORD *)&buf[16] = 0x2020000000;
        v22 = 0;
        analyzerQueue = self->_analyzerQueue;
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __39__AXSDDetectorManager_addDetectorType___block_invoke;
        block[3] = &unk_24DDF7020;
        v20 = buf;
        block[4] = self;
        v14 = v13;
        v19 = v14;
        dispatch_sync(analyzerQueue, block);
        -[AXSDDetectorManager _addCurrentRequest:withDetector:](self, "_addCurrentRequest:withDetector:", v14, v9);

        _Block_object_dispose(buf, 8);
        v10 = 1;
LABEL_18:

        goto LABEL_19;
      }
      AXLogUltron();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        -[AXSDDetectorManager addDetectorType:].cold.2();

    }
    else
    {
      AXLogUltron();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        -[AXSDDetectorManager addDetectorType:].cold.1();
    }
    v10 = 0;
    goto LABEL_18;
  }
  AXLogUltron();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[AXSDDetectorManager addDetectorType:].cold.4();
  v10 = 1;
LABEL_19:

  return v10;
}

uint64_t __39__AXSDDetectorManager_addDetectorType___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_addRequestToAnalyzer:", *(_QWORD *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (BOOL)removeDetector:(id)a3
{
  void *v4;

  objc_msgSend(a3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[AXSDDetectorManager removeDetectorType:](self, "removeDetectorType:", v4);

  return (char)self;
}

- (BOOL)removeDetectorType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *analyzerQueue;
  NSObject *v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t);
  void *v13;
  AXSDDetectorManager *v14;
  id v15;

  v4 = a3;
  _AXAssertIsMainThread();
  -[AXSDDetectorManager _currentRequestForDetectionType:](self, "_currentRequestForDetectionType:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    analyzerQueue = self->_analyzerQueue;
    v10 = MEMORY[0x24BDAC760];
    v11 = 3221225472;
    v12 = __42__AXSDDetectorManager_removeDetectorType___block_invoke;
    v13 = &unk_24DDF6B58;
    v14 = self;
    v15 = v5;
    dispatch_async(analyzerQueue, &v10);
    -[AXSDDetectorManager _removeCurrentRequestForDetectionType:](self, "_removeCurrentRequestForDetectionType:", v4, v10, v11, v12, v13, v14);

  }
  else
  {
    AXLogUltron();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[AXSDDetectorManager removeDetectorType:].cold.1();

  }
  return 1;
}

uint64_t __42__AXSDDetectorManager_removeDetectorType___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_removeRequestFromAnalyzer:", *(_QWORD *)(a1 + 40));
}

- (BOOL)_addRequestToAnalyzer:(id)a3
{
  id v4;
  NSObject *v5;
  SNAudioStreamAnalyzer *streamAnalyzer;
  id v7;
  void *v8;
  NSObject *v9;
  BOOL v10;
  id v12;

  v4 = a3;
  if (!-[AXSDDetectorManager streamAnalyzerIsRunning](self, "streamAnalyzerIsRunning"))
    goto LABEL_8;
  AXLogUltron();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[AXSDDetectorManager _addRequestToAnalyzer:].cold.2((uint64_t)self, v5);

  streamAnalyzer = self->_streamAnalyzer;
  v12 = 0;
  -[SNAudioStreamAnalyzer addRequest:withObserver:error:](streamAnalyzer, "addRequest:withObserver:error:", v4, self, &v12);
  v7 = v12;
  if (v7)
  {
    v8 = v7;
    AXLogUltron();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[AXSDDetectorManager _addRequestToAnalyzer:].cold.1();

    v10 = 0;
  }
  else
  {
LABEL_8:
    v10 = 1;
  }

  return v10;
}

- (void)_removeRequestFromAnalyzer:(id)a3
{
  id v4;

  v4 = a3;
  if (-[AXSDDetectorManager streamAnalyzerIsRunning](self, "streamAnalyzerIsRunning"))
    -[SNAudioStreamAnalyzer removeRequest:](self->_streamAnalyzer, "removeRequest:", v4);

}

- (void)_removeAllRequestsFromAnalyzer
{
  if (-[AXSDDetectorManager streamAnalyzerIsRunning](self, "streamAnalyzerIsRunning"))
    -[SNAudioStreamAnalyzer removeAllRequests](self->_streamAnalyzer, "removeAllRequests");
}

- (BOOL)addAllDetectors
{
  void *v3;
  uint64_t v4;
  __int128 v5;
  void *v6;
  char v7;
  NSObject *v8;
  uint64_t v9;
  __int128 v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  _AXAssertIsMainThread();
  objc_msgSend((id)modelMap, "keyEnumerator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "nextObject");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v6 = (void *)v4;
    v7 = 1;
    *(_QWORD *)&v5 = 138412290;
    v11 = v5;
    do
    {
      if (!-[AXSDDetectorManager addDetectorType:](self, "addDetectorType:", v6, v11))
      {
        AXLogUltron();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v11;
          v13 = v6;
          _os_log_error_impl(&dword_21ACD4000, v8, OS_LOG_TYPE_ERROR, "Add All Detectors: failed to add %@", buf, 0xCu);
        }

        v7 = 0;
      }
      objc_msgSend(v3, "nextObject");
      v9 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v9;
    }
    while (v9);
  }
  else
  {
    v7 = 1;
  }

  return v7 & 1;
}

- (void)removeAllDetectors
{
  NSObject *analyzerQueue;
  _QWORD block[5];

  _AXAssertIsMainThread();
  -[NSMutableDictionary removeAllObjects](self->_currentAssetIdsByType, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_currentRequestsByAssetID, "removeAllObjects");
  analyzerQueue = self->_analyzerQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __41__AXSDDetectorManager_removeAllDetectors__block_invoke;
  block[3] = &unk_24DDF6AE0;
  block[4] = self;
  dispatch_async(analyzerQueue, block);
}

uint64_t __41__AXSDDetectorManager_removeAllDetectors__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_removeAllRequestsFromAnalyzer");
}

- (void)processAudioBuffer:(id)a3 atTime:(id)a4
{
  id v6;
  id v7;
  NSObject *analyzerQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  analyzerQueue = self->_analyzerQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49__AXSDDetectorManager_processAudioBuffer_atTime___block_invoke;
  block[3] = &unk_24DDF6BD0;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(analyzerQueue, block);

}

uint64_t __49__AXSDDetectorManager_processAudioBuffer_atTime___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "analyzeAudioBuffer:atAudioFramePosition:", *(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 48), "sampleTime"));
}

+ (id)modelPathForURL:(id)a3 detectionType:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a3;
  objc_msgSend((id)modelMap, "objectForKeyedSubscript:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v5, "URLByAppendingPathComponent:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "URLByAppendingPathExtension:", CFSTR("mlmodelc"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)detectorRequestForDetectionType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;

  v4 = a3;
  +[AXSDDetectorStore sharedInstance](AXSDDetectorStore, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "detectorWithIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    +[AXSDDetectorManager detectorRequestForDetector:](AXSDDetectorManager, "detectorRequestForDetector:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXSDDetectorManager _addCurrentRequest:withDetector:](self, "_addCurrentRequest:withDetector:", v7, v6);
  }
  else
  {
    AXLogUltron();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[AXSDDetectorManager detectorRequestForDetectionType:].cold.1();

    v7 = 0;
  }

  return v7;
}

+ (id)detectorRequestForDetector:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  int v12;
  id v13;
  void *v14;
  NSObject *v15;
  id v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  void *v23;
  id v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  uint8_t buf[4];
  uint64_t v30;
  __int16 v31;
  id v32;
  __int16 v33;
  NSObject *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (testBundle)
  {
    v5 = (id)testBundle;
  }
  else
  {
    objc_msgSend(v3, "modelURL");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;
  AXLogUltron();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v30 = testBundle;
    _os_log_impl(&dword_21ACD4000, v7, OS_LOG_TYPE_INFO, "Test bundle - should be null on prod: %@", buf, 0xCu);
  }

  if (v6)
  {
    +[AXSDDetectorManager modelPathForURL:detectionType:](AXSDDetectorManager, "modelPathForURL:detectionType:", v6, v4);
    v8 = objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      AXLogUltron();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        +[AXSDDetectorManager detectorRequestForDetector:].cold.2();
      v19 = 0;
      goto LABEL_30;
    }
    v28 = 0;
    objc_msgSend(MEMORY[0x24BDBFFC8], "modelWithContentsOfURL:error:", v8, &v28);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v28;
    v11 = v10;
    if (v9 && !v10)
    {
      v12 = objc_msgSend(v3, "isUsingSoundPrint");
      v13 = objc_alloc(MEMORY[0x24BDE9B18]);
      v14 = v13;
      if (v12)
      {
        v27 = 0;
        v15 = objc_msgSend(v13, "initWithMLModel:error:", v9, &v27);
        v16 = v27;
        if (v16)
        {
          v17 = v16;
          AXLogUltron();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            v23 = (void *)objc_opt_class();
            *(_DWORD *)buf = 138413314;
            v30 = (uint64_t)v23;
            v31 = 2112;
            v32 = v3;
            v33 = 2112;
            v34 = v8;
            v35 = 2112;
            v36 = v9;
            v37 = 2112;
            v38 = v17;
            v24 = v23;
            _os_log_error_impl(&dword_21ACD4000, v18, OS_LOG_TYPE_ERROR, "[%@]: unable to create SNDetectSoundRequest from mlmodel init. \n\tdetector: %@, path: %@, model: %@, error: %@", buf, 0x34u);

          }
LABEL_23:
          v19 = 0;
LABEL_29:

LABEL_30:
          goto LABEL_31;
        }
      }
      else
      {
        objc_msgSend(v3, "identifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "initWithVGGishBasedMLModel:soundIdentifier:", v9, v20);

        if (!v15)
        {
          AXLogUltron();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            v25 = (void *)objc_opt_class();
            *(_DWORD *)buf = 138413058;
            v30 = (uint64_t)v25;
            v31 = 2112;
            v32 = v3;
            v33 = 2112;
            v34 = v8;
            v35 = 2112;
            v36 = v9;
            v26 = v25;
            _os_log_error_impl(&dword_21ACD4000, v21, OS_LOG_TYPE_ERROR, "[%@]: unable to create SNDetectSoundRequest from vggish model. \n\tdetector: %@, path: %@, model: %@", buf, 0x2Au);

          }
          v15 = 0;
        }
      }
      v15 = v15;
      v19 = v15;
      goto LABEL_29;
    }
    AXLogUltron();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v30 = (uint64_t)v8;
      v31 = 2112;
      v32 = v4;
      v33 = 2112;
      v34 = v11;
      _os_log_error_impl(&dword_21ACD4000, v15, OS_LOG_TYPE_ERROR, "Unable to create MLModel from path %@ for detectionType %@. error: %@", buf, 0x20u);
    }
    goto LABEL_23;
  }
  AXLogUltron();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    +[AXSDDetectorManager detectorRequestForDetector:].cold.1();
  v19 = 0;
LABEL_31:

  return v19;
}

+ (id)detectorRequestForGeneralApplianceDetector
{
  id v2;
  void *v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  char v9;
  void *v10;
  id v11;
  NSObject *v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  id v17;
  id v18;
  uint8_t buf[4];
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  if (testBundle)
  {
    v2 = (id)testBundle;
  }
  else
  {
    +[AXUltronModelAssetManager sharedInstance](AXUltronModelAssetManager, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "localPathForKShotGeneralApplianceDetector");
    v2 = (id)objc_claimAutoreleasedReturnValue();

  }
  AXLogUltron();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v20 = testBundle;
    _os_log_impl(&dword_21ACD4000, v4, OS_LOG_TYPE_INFO, "Test bundle - should be null on prod: %@", buf, 0xCu);
  }

  if (v2)
  {
    v18 = 0;
    objc_msgSend(MEMORY[0x24BDBFFC8], "modelWithContentsOfURL:error:", v2, &v18);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v18;
    v7 = v6;
    if (!v5 || v6)
    {
      AXLogUltron();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        +[AXSDDetectorManager detectorRequestForGeneralApplianceDetector].cold.2();

      v13 = 0;
    }
    else
    {
      +[AXUltronModelAssetManager sharedInstance](AXUltronModelAssetManager, "sharedInstance");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "isKShotUsingSoundPrint");

      if ((v9 & 1) != 0)
      {
        v17 = 0;
        v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDE9B18]), "initWithMLModel:error:", v5, &v17);
        v11 = v17;
        if (v11)
        {
          AXLogUltron();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
            +[AXSDDetectorManager detectorRequestForGeneralApplianceDetector].cold.3();

          v13 = 0;
        }
        else
        {
          v13 = v10;
        }

      }
      else
      {
        AXLogUltron();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21ACD4000, v15, OS_LOG_TYPE_INFO, "KShot General Appliance is not using Sound Print", buf, 2u);
        }

        v13 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDE9B18]), "initWithVGGishBasedMLModel:soundIdentifier:", v5, CFSTR("general_appliance"));
      }
    }

  }
  else
  {
    AXLogUltron();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      +[AXSDDetectorManager detectorRequestForGeneralApplianceDetector].cold.1();
    v13 = 0;
  }

  return v13;
}

+ (void)initializeModelMap
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[17];
  _QWORD v13[18];

  v13[17] = *MEMORY[0x24BDAC8D0];
  if (!modelMap)
  {
    v2 = *MEMORY[0x24BDFF1E8];
    v12[0] = *MEMORY[0x24BDFF200];
    v12[1] = v2;
    v13[0] = CFSTR("baby_distressed");
    v13[1] = CFSTR("car_horn");
    v3 = *MEMORY[0x24BDFF208];
    v12[2] = *MEMORY[0x24BDFF1F0];
    v12[3] = v3;
    v13[2] = CFSTR("cat_meow");
    v13[3] = CFSTR("dog_bark");
    v4 = *MEMORY[0x24BDFF210];
    v12[4] = *MEMORY[0x24BDFF218];
    v12[5] = v4;
    v13[4] = CFSTR("door_bell");
    v13[5] = CFSTR("door_knock");
    v5 = *MEMORY[0x24BDFF250];
    v12[6] = *MEMORY[0x24BDFF220];
    v12[7] = v5;
    v13[6] = CFSTR("fire_alarm");
    v13[7] = CFSTR("shout");
    v6 = *MEMORY[0x24BDFF260];
    v12[8] = *MEMORY[0x24BDFF258];
    v12[9] = v6;
    v13[8] = CFSTR("siren_alarm");
    v13[9] = CFSTR("smoke_alarm");
    v7 = *MEMORY[0x24BDFF1D0];
    v12[10] = *MEMORY[0x24BDFF268];
    v12[11] = v7;
    v13[10] = CFSTR("water_running");
    v13[11] = CFSTR("beep");
    v8 = *MEMORY[0x24BDFF1D8];
    v12[12] = *MEMORY[0x24BDFF1E0];
    v12[13] = v8;
    v13[12] = CFSTR("buzzer");
    v13[13] = CFSTR("ding_bell");
    v9 = *MEMORY[0x24BDFF230];
    v12[14] = *MEMORY[0x24BDFF1F8];
    v12[15] = v9;
    v13[14] = CFSTR("cough");
    v13[15] = CFSTR("glass_breaking");
    v12[16] = *MEMORY[0x24BDFF240];
    v13[16] = CFSTR("kettle");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, v12, 17);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)modelMap;
    modelMap = v10;

  }
}

+ (void)setTestBundle:(id)a3
{
  objc_storeStrong((id *)&testBundle, a3);
}

- (BOOL)_testAudioFile:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  BOOL v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  NSObject *v15;
  id v17;
  id v18;

  v4 = a3;
  v18 = 0;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDE9AC8]), "initWithURL:error:", v4, &v18);
  v6 = v18;
  if (v6)
  {
    v7 = v6;
    NSLog(CFSTR("ERROR: %@"), v6);
    v8 = 0;
  }
  else
  {
    objc_msgSend((id)modelMap, "keyEnumerator");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "nextObject");
    v10 = objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = (void *)v10;
      while (1)
      {
        -[AXSDDetectorManager detectorRequestForDetectionType:](self, "detectorRequestForDetectionType:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = 0;
        objc_msgSend(v5, "addRequest:withObserver:error:", v12, self, &v17);
        v13 = v17;
        if (v13)
          break;

        objc_msgSend(v9, "nextObject");
        v14 = objc_claimAutoreleasedReturnValue();

        v11 = (void *)v14;
        if (!v14)
          goto LABEL_7;
      }
      v7 = v13;
      AXLogUltron();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        -[AXSDDetectorManager _testAudioFile:].cold.1();

      v8 = 0;
    }
    else
    {
LABEL_7:
      objc_msgSend(v5, "analyze");
      v7 = 0;
      v8 = 1;
    }

  }
  return v8;
}

- (void)request:(id)a3 didProduceResult:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  float v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[24];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "detected"))
  {
    AXLogUltron();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v7;
LABEL_10:
      _os_log_impl(&dword_21ACD4000, v8, OS_LOG_TYPE_DEFAULT, "Results: %@", buf, 0xCu);
      goto LABEL_11;
    }
    goto LABEL_11;
  }
  if (v7)
  {
    objc_msgSend(v7, "timeRange");
    objc_msgSend(v7, "timeRange");
    v9 = (float)((uint64_t)v17 / SDWORD2(v14));
  }
  else
  {
    v9 = 0.0;
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
  }
  if (fmodf(v9, 30.0) == 0.0)
  {
    AXLogUltron();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v7;
      goto LABEL_10;
    }
LABEL_11:

  }
  if (v7)
  {
    objc_msgSend(v7, "timeRange");
    if ((v11 & 0x8000000000000000) != 0)
      goto LABEL_17;
  }
  else
  {
    v12 = 0u;
    v13 = 0u;
    v11 = 0u;
  }
  -[AXSDDetectorManager delegate](self, "delegate", v11, v12, v13, v14, v15, v16, v17, v18, v19, *(_QWORD *)buf, *(_QWORD *)&buf[8]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "receivedObservation:forDetector:", v7, v6);

LABEL_17:
}

- (void)request:(id)a3 didFailWithError:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  AXLogUltron();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    -[AXSDDetectorManager request:didFailWithError:].cold.1();

  -[AXSDDetectorManager delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "receivedError:fromDetector:", v7, v6);

}

- (void)requestDidComplete:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AXSDDetectorManager delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "receivedCompletion:", v4);

}

- (AXSDDetectorManagerDelegate)delegate
{
  return (AXSDDetectorManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SNDetectSoundRequest)currentGeneralApplianceRequest
{
  return self->_currentGeneralApplianceRequest;
}

- (void)setCurrentGeneralApplianceRequest:(id)a3
{
  objc_storeStrong((id *)&self->_currentGeneralApplianceRequest, a3);
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
  objc_storeStrong((id *)&self->_currentGeneralApplianceRequest, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_currentRequestsByAssetID, 0);
  objc_storeStrong((id *)&self->_currentAssetIdsByType, 0);
  objc_storeStrong((id *)&self->_streamAnalyzer, 0);
}

- (void)_removeCurrentRequestForDetectionType:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_3_1(&dword_21ACD4000, v0, v1, "No asset ID found when trying to remove", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_currentRequestForDetectionType:.cold.1()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_11();
  v0 = (void *)OUTLINED_FUNCTION_12();
  v1 = OUTLINED_FUNCTION_0_5(v0);
  OUTLINED_FUNCTION_1_1(&dword_21ACD4000, v2, v3, "[%@]: unable to find SNDetectSoundRequest for Detection Type: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_1();
}

- (void)_startDetectionWithFormat:.cold.1()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_11();
  v0 = (void *)OUTLINED_FUNCTION_12();
  v1 = OUTLINED_FUNCTION_0_5(v0);
  OUTLINED_FUNCTION_1_1(&dword_21ACD4000, v2, v3, "[%@]: Received an invalid input format. %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_1();
}

- (void)_startDetectionWithFormat:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_21ACD4000, v0, v1, "Unable to add request to stream analyzer: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_startDetectionWithFormat:(void *)a1 .cold.3(void *a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = (id)OUTLINED_FUNCTION_12();
  objc_msgSend(a1, "_currentRequests");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "count");
  OUTLINED_FUNCTION_5_3(&dword_21ACD4000, v4, v5, "[%@]: adding %lu request to stream analyzer", v6, v7, v8, v9, 2u);

  OUTLINED_FUNCTION_5();
}

- (void)_startDetectionWithFormat:.cold.4()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_11();
  v0 = (void *)OUTLINED_FUNCTION_12();
  v1 = OUTLINED_FUNCTION_0_5(v0);
  OUTLINED_FUNCTION_5_3(&dword_21ACD4000, v2, v3, "[%@]: startDetectionWithFormat: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_1();
}

- (void)addGeneralApplianceDetector
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_2(&dword_21ACD4000, v0, v1, "KShot Detector Manager: Add General Appliance Detector", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)removeGeneralApplianceDetector
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_2(&dword_21ACD4000, v0, v1, "Remove General Appliance Detector.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)startGeneralApplianceDetectionWithFormat:(os_log_t)log .cold.2(uint64_t *a1, uint64_t *a2, os_log_t log)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = *a1;
  v4 = *a2;
  v5 = 138412546;
  v6 = v3;
  v7 = 2112;
  v8 = v4;
  _os_log_debug_impl(&dword_21ACD4000, log, OS_LOG_TYPE_DEBUG, "KShot Detector Manager: adding request %@ to stream analyzer: %@", (uint8_t *)&v5, 0x16u);
  OUTLINED_FUNCTION_2();
}

- (void)startGeneralApplianceDetectionWithFormat:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_3_1(&dword_21ACD4000, v0, v1, "KShot Detector Manager: unable to add general appliance request", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)startGeneralApplianceDetectionWithFormat:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_4_0(&dword_21ACD4000, v0, v1, "KShot Detector Manager: start general appliance detection with format: %@", v2);
  OUTLINED_FUNCTION_2();
}

- (void)addDetectorType:.cold.1()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_11();
  v0 = (void *)objc_opt_class();
  v1 = OUTLINED_FUNCTION_0_5(v0);
  OUTLINED_FUNCTION_1_1(&dword_21ACD4000, v2, v3, "[%@]: no useable detector found for listen type: %@ even though assets are ready", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_1();
}

- (void)addDetectorType:.cold.2()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_11();
  v0 = (void *)objc_opt_class();
  v1 = OUTLINED_FUNCTION_0_5(v0);
  OUTLINED_FUNCTION_1_1(&dword_21ACD4000, v2, v3, "[%@]: unable to create request for detection type: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_1();
}

- (void)addDetectorType:.cold.3()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_11();
  v0 = (void *)objc_opt_class();
  v1 = OUTLINED_FUNCTION_0_5(v0);
  OUTLINED_FUNCTION_5_3(&dword_21ACD4000, v2, v3, "[%@]: Add Detector: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_1();
}

- (void)addDetectorType:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_4_0(&dword_21ACD4000, v0, v1, "Add Detector: Detection type %@ has already been added to the request.", v2);
  OUTLINED_FUNCTION_2();
}

- (void)removeDetectorType:.cold.1()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_11();
  v0 = (void *)OUTLINED_FUNCTION_12();
  v1 = OUTLINED_FUNCTION_0_5(v0);
  OUTLINED_FUNCTION_5_3(&dword_21ACD4000, v2, v3, "[%@]: unable to remove detector. %@ is not currently present.", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_1();
}

- (void)_addRequestToAnalyzer:.cold.1()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_11();
  v0 = (void *)OUTLINED_FUNCTION_12();
  v1 = OUTLINED_FUNCTION_0_5(v0);
  OUTLINED_FUNCTION_1_1(&dword_21ACD4000, v2, v3, "[%@]: unable to add request to stream analyzer: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_1();
}

- (void)_addRequestToAnalyzer:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint8_t v6[24];

  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_2_0();
  v4 = v3;
  OUTLINED_FUNCTION_4_0(&dword_21ACD4000, a2, v5, "[%@]: stream analyizer already running - adding request directly", v6);

  OUTLINED_FUNCTION_2_1();
}

- (void)detectorRequestForDetectionType:.cold.1()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_11();
  v0 = (void *)OUTLINED_FUNCTION_12();
  v1 = OUTLINED_FUNCTION_0_5(v0);
  OUTLINED_FUNCTION_1_1(&dword_21ACD4000, v2, v3, "[%@]: no useable detector found for listen type: %@ even though assets are ready", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_1();
}

+ (void)detectorRequestForDetector:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_21ACD4000, v0, v1, "No asset path found for detection type: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

+ (void)detectorRequestForDetector:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_21ACD4000, v0, v1, "No detector known model for detection type %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

+ (void)detectorRequestForGeneralApplianceDetector
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21ACD4000, v0, (uint64_t)v0, "Unable to create SNDetectSoundRequest from KShot General Appliance, model: %@, error: %@", v1);
  OUTLINED_FUNCTION_2();
}

- (void)_testAudioFile:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_3_1(&dword_21ACD4000, v0, v1, "Ultron Detector Manager - Error adding detector", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)request:didFailWithError:.cold.1()
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_11();
  objc_msgSend(v0, "soundIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_1(&dword_21ACD4000, v2, v3, "Request failed: %@, %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_5();
}

@end
