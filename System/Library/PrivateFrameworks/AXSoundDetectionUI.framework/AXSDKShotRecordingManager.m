@implementation AXSDKShotRecordingManager

- (AXSDKShotRecordingManager)initWithSampleLength:(double)a3 bufferSize:(double)a4
{
  AXSDKShotRecordingManager *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *fileProcessingQueue;
  AXHARingBuffer *v9;
  AXHARingBuffer *audioRingBuffer;
  void *v11;
  AXSDKShotRecordingManager *v13;
  _QWORD v14[4];
  id v15;
  id location;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)AXSDKShotRecordingManager;
  v6 = -[AXSDKShotRecordingManager init](&v17, sel_init);
  if (v6)
  {
    v7 = dispatch_queue_create("com.apple.ax.kshot.file_write_q", 0);
    fileProcessingQueue = v6->_fileProcessingQueue;
    v6->_fileProcessingQueue = (OS_dispatch_queue *)v7;

    v6->_sampleLength = a3;
    v9 = -[AXHARingBuffer initWithCount:]([AXHARingBuffer alloc], "initWithCount:", vcvtpd_u64_f64(60.0 / (a3 * a4)));
    audioRingBuffer = v6->_audioRingBuffer;
    v6->_audioRingBuffer = v9;

    v6->_isFile = 0;
    -[AXSDKShotRecordingManager reset](v6, "reset");
    objc_initWeak(&location, v6);
    objc_msgSend(MEMORY[0x24BDFF278], "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __61__AXSDKShotRecordingManager_initWithSampleLength_bufferSize___block_invoke;
    v14[3] = &unk_24DDF6738;
    objc_copyWeak(&v15, &location);
    objc_msgSend(v11, "registerUpdateBlock:forRetrieveSelector:withListener:", v14, sel_kShotShouldSaveCurrentSound, v6);

    if (objc_msgSend(MEMORY[0x24BE4BD98], "isInternalInstall"))
    {
      v13 = v6;
      AXPerformBlockOnMainThread();

    }
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  return v6;
}

void __61__AXSDKShotRecordingManager_initWithSampleLength_bufferSize___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_kShotShouldSaveCurrentSoundDidChange");

}

uint64_t __61__AXSDKShotRecordingManager_initWithSampleLength_bufferSize___block_invoke_2()
{
  return objc_msgSend((id)objc_opt_class(), "cleanupKShotFiles");
}

- (void)reset
{
  NSMutableDictionary *v3;
  NSMutableDictionary *currentDetections;
  NSMutableDictionary *v5;
  NSMutableDictionary *detectionResultCollection;

  -[AXHARingBuffer reset](self->_audioRingBuffer, "reset");
  v3 = (NSMutableDictionary *)objc_opt_new();
  currentDetections = self->_currentDetections;
  self->_currentDetections = v3;

  v5 = (NSMutableDictionary *)objc_opt_new();
  detectionResultCollection = self->_detectionResultCollection;
  self->_detectionResultCollection = v5;

  self->_isDetectionInProgress = 0;
  self->_numNonDetections = 0;
  self->_numObservations = 0;
}

- (void)setTargetDetector:(id)a3
{
  objc_storeStrong((id *)&self->_targetDetector, a3);
  -[AXSDKShotRecordingManager reset](self, "reset");
}

- (unint64_t)nRecordingsSoFar
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[AXSDKShotRecordingManager targetDetector](self, "targetDetector");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "recordings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

+ (void)cleanupKShotFiles
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  objc_msgSend((id)objc_opt_class(), "defaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("com.apple.accessibility.kshot.last_cleanup_key"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dateByAddingTimeInterval:", -86400.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4
    && (objc_msgSend(v4, "laterDate:", v6), v7 = (void *)objc_claimAutoreleasedReturnValue(), v7, v7 == v4))
  {
    AXLogUltronKShot();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = 138412290;
      v13 = v4;
      _os_log_impl(&dword_21ACD4000, v11, OS_LOG_TYPE_INFO, "Not cleaning up KShot Files - last cleanup was recent: %@", (uint8_t *)&v12, 0xCu);
    }

  }
  else
  {
    objc_msgSend(a1, "_retrieveFilesOlderThan:", 432000.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "count"))
      objc_msgSend(a1, "_cleanupKShotFiles:", v8);
    objc_msgSend(a1, "defaults");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE60], "now");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v10, CFSTR("com.apple.accessibility.kshot.last_cleanup_key"));

  }
}

+ (BOOL)_cleanupKShotFiles:(id)a3
{
  id v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  __int128 v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  id v25;
  __int16 v26;
  id v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  AXLogUltronKShot();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v25 = v3;
    _os_log_impl(&dword_21ACD4000, v4, OS_LOG_TYPE_INFO, "Cleaning up KShot Files - at paths %@", buf, 0xCu);
  }

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (v6)
  {
    v8 = v6;
    v9 = 0;
    v10 = *(_QWORD *)v21;
    v11 = 1;
    *(_QWORD *)&v7 = 138412546;
    v18 = v7;
    do
    {
      v12 = 0;
      v13 = v9;
      do
      {
        if (*(_QWORD *)v21 != v10)
          objc_enumerationMutation(v5);
        v14 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v12);
        objc_msgSend(MEMORY[0x24BDD1580], "defaultManager", v18);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v13;
        objc_msgSend(v15, "removeItemAtPath:error:", v14, &v19);
        v9 = v19;

        if (v9)
        {
          AXLogUltronKShot();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v18;
            v25 = v14;
            v26 = 2112;
            v27 = v9;
            _os_log_error_impl(&dword_21ACD4000, v16, OS_LOG_TYPE_ERROR, "KShot cleanup: failed to remove: %@. Error: %@", buf, 0x16u);
          }

          v11 = 0;
        }
        ++v12;
        v13 = v9;
      }
      while (v8 != v12);
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    }
    while (v8);
  }
  else
  {
    v9 = 0;
    v11 = 1;
  }

  return v11 & 1;
}

+ (id)_retrieveFilesOlderThan:(double)a3
{
  double v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  NSObject *v27;
  void *v29;
  id v30;
  void *v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t buf[4];
  uint64_t v42;
  __int16 v43;
  id v44;
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  if (a3 <= 0.0)
    v3 = a3;
  else
    v3 = -a3;
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dateByAddingTimeInterval:", v3);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(MEMORY[0x24BDFF278], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "decodedKShotDetectors");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allValues");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v38 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
        if (objc_msgSend(v14, "isModelReady"))
        {
          objc_msgSend(v14, "identifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(CFSTR("/var/mobile/Library/Accessibility/SoundDetectionKShot/TrainingFiles"), "stringByAppendingPathComponent:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v5, "addObject:", v16);
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
    }
    while (v11);
  }
  v29 = v9;

  v30 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v17 = v5;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v33, v45, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v34;
    do
    {
      for (j = 0; j != v19; ++j)
      {
        if (*(_QWORD *)v34 != v20)
          objc_enumerationMutation(v17);
        v22 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * j);
        objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = 0;
        objc_msgSend(v23, "attributesOfItemAtPath:error:", v22, &v32);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = v32;
        objc_msgSend(v24, "fileCreationDate");
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        if (v25)
        {
          AXLogUltronKShot();
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v42 = v22;
            v43 = 2112;
            v44 = v25;
            _os_log_error_impl(&dword_21ACD4000, v27, OS_LOG_TYPE_ERROR, "KShot cleanup: failed to find creation date for file %@. error: %@", buf, 0x16u);
          }

        }
        else if (objc_msgSend(v26, "compare:", v31) == -1)
        {
          objc_msgSend(v30, "addObject:", v22);
        }

      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v33, v45, 16);
    }
    while (v19);
  }

  return v30;
}

+ (id)defaults
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.Accessibility"));
}

- (void)trackBuffer:(id)a3 atTime:(id)a4
{
  AXHARingBuffer *audioRingBuffer;
  id v6;
  id v7;
  AXSDTimedAudioBuffer *v8;

  audioRingBuffer = self->_audioRingBuffer;
  v6 = a4;
  v7 = a3;
  v8 = -[AXSDTimedAudioBuffer initWithBuffer:atTime:]([AXSDTimedAudioBuffer alloc], "initWithBuffer:atTime:", v7, v6);

  -[AXHARingBuffer addObject:](audioRingBuffer, "addObject:", v8);
}

- (void)trackBuffer:(id)a3 atTime:(id)a4 isFile:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  NSObject *v10;
  _BOOL4 v11;
  NSArray *v12;
  NSArray *cachedCurrentAudioFile;
  AXHARingBuffer *audioRingBuffer;
  AXSDTimedAudioBuffer *v15;
  uint8_t v16[16];
  uint8_t buf[16];

  v5 = a5;
  v8 = a3;
  v9 = a4;
  if (self->_isFile != v5)
  {
    AXLogUltronKShot();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    if (v5)
    {
      if (v11)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21ACD4000, v10, OS_LOG_TYPE_DEFAULT, "AUTOMATION: RESETTING Audio Recording Buffer since we're recieving audio from a file.", buf, 2u);
      }
    }
    else
    {
      if (v11)
      {
        *(_WORD *)v16 = 0;
        _os_log_impl(&dword_21ACD4000, v10, OS_LOG_TYPE_DEFAULT, "AUTOMATION: Moving from recording from a file to recording from the mic. Resetting Audio Recording Buffer", v16, 2u);
      }

      -[AXHARingBuffer content](self->_audioRingBuffer, "content");
      v10 = objc_claimAutoreleasedReturnValue();
      v12 = -[NSObject copy](v10, "copy");
      cachedCurrentAudioFile = self->_cachedCurrentAudioFile;
      self->_cachedCurrentAudioFile = v12;

    }
    -[AXHARingBuffer reset](self->_audioRingBuffer, "reset");
    self->_isFile = v5;
  }
  audioRingBuffer = self->_audioRingBuffer;
  v15 = -[AXSDTimedAudioBuffer initWithBuffer:atTime:]([AXSDTimedAudioBuffer alloc], "initWithBuffer:atTime:", v8, v9);
  -[AXHARingBuffer addObject:](audioRingBuffer, "addObject:", v15);

}

- (void)listenEngineFailedToStartWithError:(id)a3
{
  NSObject *v3;

  AXLogUltronKShot();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    -[AXSDKShotRecordingManager listenEngineFailedToStartWithError:].cold.1();

}

- (id)path
{
  void *v2;
  void *v3;
  void *v4;

  -[AXSDKShotRecordingManager targetDetector](self, "targetDetector");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("/var/mobile/Library/Accessibility/SoundDetectionKShot/TrainingFiles"), "stringByAppendingFormat:", CFSTR("/%@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_directory
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  NSObject *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v13;
  char v14;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  v15 = *MEMORY[0x24BDD0C90];
  v16[0] = MEMORY[0x24BDBD1C0];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 1;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXSDKShotRecordingManager path](self, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "fileExistsAtPath:isDirectory:", v5, &v14);

  if ((v6 & 1) == 0)
  {
    AXLogUltronKShot();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[AXSDKShotRecordingManager _directory].cold.2();

    -[AXSDKShotRecordingManager path](self, "path");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0;
    objc_msgSend(v4, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v8, 1, v3, &v13);
    v9 = v13;

    if (v9)
    {
      AXLogUltronKShot();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[AXSDKShotRecordingManager _directory].cold.1();

    }
  }
  -[AXSDKShotRecordingManager path](self, "path");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)receivedObservation:(id)a3 forDetector:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  void *v12;
  NSArray *cachedCurrentAudio;
  NSDictionary *cachedCurrentResults;
  SNDetectionResult *cachedDetectionResult;
  NSObject *v16;
  void *v17;
  _QWORD v18[5];
  id v19;
  uint8_t buf[16];

  v5 = a3;
  -[AXSDKShotRecordingManager setNumObservations:](self, "setNumObservations:", -[AXSDKShotRecordingManager numObservations](self, "numObservations") + 1);
  if (-[AXSDKShotRecordingManager numObservations](self, "numObservations") >= 5)
  {
    objc_msgSend(MEMORY[0x24BDFF278], "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "soundDetectionKShotListeningState") == 1)
    {

    }
    else
    {
      objc_msgSend(MEMORY[0x24BDFF278], "sharedInstance");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "soundDetectionKShotListeningState");

      if (v8 != 2)
        goto LABEL_16;
    }
    if (objc_msgSend(v5, "detected"))
    {
      -[AXSDKShotRecordingManager saveDetectionResult:](self, "saveDetectionResult:", v5);
      goto LABEL_16;
    }
    objc_msgSend(v5, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXSDKShotRecordingManager currentDetectionType](self, "currentDetectionType");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v9, "isEqualToString:", v10))
      goto LABEL_14;
    v11 = -[AXSDKShotRecordingManager isDetectionInProgress](self, "isDetectionInProgress");

    if (v11)
    {
      -[AXSDKShotRecordingManager setNumNonDetections:](self, "setNumNonDetections:", -[AXSDKShotRecordingManager numNonDetections](self, "numNonDetections") + 1);
      if (-[AXSDKShotRecordingManager numNonDetections](self, "numNonDetections") == 6)
      {
        objc_msgSend(MEMORY[0x24BDFF278], "sharedInstance");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setSoundDetectionKShotListeningState:", 3);

        -[AXSDKShotRecordingManager setIsDetectionInProgress:](self, "setIsDetectionInProgress:", 0);
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[AXSDKShotRecordingManager nRecordingsSoFar](self, "nRecordingsSoFar"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        cachedCurrentAudio = self->_cachedCurrentAudio;
        self->_cachedCurrentAudio = 0;

        cachedCurrentResults = self->_cachedCurrentResults;
        self->_cachedCurrentResults = 0;

        cachedDetectionResult = self->_cachedDetectionResult;
        self->_cachedDetectionResult = 0;

        if (!self->_cachedCurrentAudioFile)
        {
          v18[0] = MEMORY[0x24BDAC760];
          v18[1] = 3221225472;
          v18[2] = __61__AXSDKShotRecordingManager_receivedObservation_forDetector___block_invoke;
          v18[3] = &unk_24DDF6B58;
          v18[4] = self;
          v19 = v9;
          dispatch_async(MEMORY[0x24BDAC9B8], v18);

          goto LABEL_15;
        }
        AXLogUltron();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21ACD4000, v16, OS_LOG_TYPE_DEFAULT, "AUTOMATION: Audio File Ring Buffer is not nil! Will take recording from file instead of the mic.", buf, 2u);
        }

        -[AXSDKShotRecordingManager currentDetections](self, "currentDetections");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKey:", v9);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[AXSDKShotRecordingManager _cacheResultAndWaitForSave:](self, "_cacheResultAndWaitForSave:", v17);

LABEL_14:
LABEL_15:

      }
    }
  }
LABEL_16:

}

void __61__AXSDKShotRecordingManager_receivedObservation_forDetector___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_saveCachedAudioFileTimer:", *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setTimer:", v2);

}

- (id)_saveCachedAudioFileTimer:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  id v11;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = (void *)MEMORY[0x24BDBCF40];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __55__AXSDKShotRecordingManager__saveCachedAudioFileTimer___block_invoke;
  v9[3] = &unk_24DDF6C88;
  objc_copyWeak(&v11, &location);
  v6 = v4;
  v10 = v6;
  objc_msgSend(v5, "scheduledTimerWithTimeInterval:repeats:block:", 0, v9, 5.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

  return v7;
}

void __55__AXSDKShotRecordingManager__saveCachedAudioFileTimer___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id WeakRetained;
  uint8_t v12[16];
  uint8_t buf[16];

  v3 = a2;
  AXLogUltron();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21ACD4000, v4, OS_LOG_TYPE_DEFAULT, "KSHOT: Scheduled timer for adding padding to audio recording has fired!", buf, 2u);
  }

  v5 = (id *)(a1 + 40);
  v6 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v6, "currentDetections");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", *(_QWORD *)(a1 + 32));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_cacheResultAndWaitForSave:", v8);

  objc_msgSend(MEMORY[0x24BDFF278], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = objc_msgSend(v9, "kShotShouldSaveCurrentSound");

  if ((_DWORD)v6)
  {
    AXLogUltronKShot();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_21ACD4000, v10, OS_LOG_TYPE_DEFAULT, "KSHOT: Saving cached audio file from timer being fired.", v12, 2u);
    }

    WeakRetained = objc_loadWeakRetained(v5);
    objc_msgSend(WeakRetained, "_recordCachedResultToFile");

  }
  objc_msgSend(v3, "invalidate");

}

- (void)saveDetectionResult:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  NSMutableDictionary *detectionResultCollection;
  AXHARingBuffer *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  int v16;
  id v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[AXSDKShotRecordingManager nRecordingsSoFar](self, "nRecordingsSoFar"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  AXLogUltronKShot();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 138412290;
    v17 = v4;
    _os_log_impl(&dword_21ACD4000, v7, OS_LOG_TYPE_DEFAULT, "KSHOT: Detected an electronic sound, adding audio from detection result: %@", (uint8_t *)&v16, 0xCu);
  }

  -[AXSDKShotRecordingManager setCurrentDetectionType:](self, "setCurrentDetectionType:", v5);
  -[AXSDKShotRecordingManager setIsDetectionInProgress:](self, "setIsDetectionInProgress:", 1);
  -[AXSDKShotRecordingManager setNumNonDetections:](self, "setNumNonDetections:", 0);
  -[NSMutableDictionary objectForKey:](self->_detectionResultCollection, "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    detectionResultCollection = self->_detectionResultCollection;
    v10 = -[AXHARingBuffer initWithCount:]([AXHARingBuffer alloc], "initWithCount:", -[AXHARingBuffer count](self->_audioRingBuffer, "count"));
    -[NSMutableDictionary setObject:forKey:](detectionResultCollection, "setObject:forKey:", v10, v6);

  }
  -[NSMutableDictionary objectForKey:](self->_detectionResultCollection, "objectForKey:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObject:", v4);

  -[NSMutableDictionary objectForKey:](self->_currentDetections, "objectForKey:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    objc_msgSend(MEMORY[0x24BDFF278], "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setSoundDetectionKShotListeningState:", 2);

    -[NSMutableDictionary setObject:forKey:](self->_currentDetections, "setObject:forKey:", v4, v6);
    AXLogUltronKShot();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "confidence");
      v16 = 138412546;
      v17 = v6;
      v18 = 2048;
      v19 = v15;
      _os_log_impl(&dword_21ACD4000, v14, OS_LOG_TYPE_DEFAULT, "KSHOT: Beginning audio save for sound number %@ with confidence %f", (uint8_t *)&v16, 0x16u);
    }

  }
}

- (void)_cacheResultAndWaitForSave:(id)a3
{
  NSArray *cachedCurrentAudioFile;
  id v6;
  NSArray *v7;
  NSArray *cachedCurrentAudio;
  void *v9;
  AXHARingBuffer *audioRingBuffer;
  id v11;
  NSArray *v12;
  NSArray *v13;
  NSDictionary *v14;
  NSDictionary *cachedCurrentResults;
  SNDetectionResult *v16;
  SNDetectionResult *cachedDetectionResult;

  cachedCurrentAudioFile = self->_cachedCurrentAudioFile;
  if (cachedCurrentAudioFile)
  {
    v6 = a3;
    v7 = (NSArray *)-[NSArray mutableCopy](cachedCurrentAudioFile, "mutableCopy");
    cachedCurrentAudio = self->_cachedCurrentAudio;
    self->_cachedCurrentAudio = v7;

    v9 = self->_cachedCurrentAudioFile;
    self->_cachedCurrentAudioFile = 0;
  }
  else
  {
    audioRingBuffer = self->_audioRingBuffer;
    v11 = a3;
    -[AXHARingBuffer content](audioRingBuffer, "content");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (NSArray *)objc_msgSend(v9, "mutableCopy");
    v13 = self->_cachedCurrentAudio;
    self->_cachedCurrentAudio = v12;

  }
  -[NSMutableDictionary ax_deepMutableCopy](self->_detectionResultCollection, "ax_deepMutableCopy");
  v14 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  cachedCurrentResults = self->_cachedCurrentResults;
  self->_cachedCurrentResults = v14;

  v16 = (SNDetectionResult *)objc_msgSend(a3, "copy");
  cachedDetectionResult = self->_cachedDetectionResult;
  self->_cachedDetectionResult = v16;

}

- (void)_kShotShouldSaveCurrentSoundDidChange
{
  void *v3;
  int v4;
  void *v5;
  char v6;
  NSObject *v7;
  NSArray *cachedCurrentAudio;
  NSDictionary *cachedCurrentResults;
  SNDetectionResult *cachedDetectionResult;
  id v11;
  uint8_t buf[16];

  objc_msgSend(MEMORY[0x24BDFF278], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "kShotShouldSaveCurrentSound");

  if (v4)
  {
    -[AXSDKShotRecordingManager timer](self, "timer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isValid");

    if ((v6 & 1) == 0)
    {
      AXLogUltronKShot();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21ACD4000, v7, OS_LOG_TYPE_DEFAULT, "KSHOT: Saving cached audio file from _kShotShouldSaveCurrentSoundDidChange.", buf, 2u);
      }

      -[AXSDKShotRecordingManager _recordCachedResultToFile](self, "_recordCachedResultToFile");
    }
  }
  else
  {
    cachedCurrentAudio = self->_cachedCurrentAudio;
    self->_cachedCurrentAudio = 0;

    cachedCurrentResults = self->_cachedCurrentResults;
    self->_cachedCurrentResults = 0;

    cachedDetectionResult = self->_cachedDetectionResult;
    self->_cachedDetectionResult = 0;

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[AXSDKShotRecordingManager nRecordingsSoFar](self, "nRecordingsSoFar"));
    v11 = (id)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeObjectForKey:](self->_currentDetections, "removeObjectForKey:", v11);

  }
}

- (void)_recordCachedResultToFile
{
  NSObject *fileProcessingQueue;
  _QWORD block[5];

  fileProcessingQueue = self->_fileProcessingQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __54__AXSDKShotRecordingManager__recordCachedResultToFile__block_invoke;
  block[3] = &unk_24DDF6AE0;
  block[4] = self;
  dispatch_async(fileProcessingQueue, block);
}

void __54__AXSDKShotRecordingManager__recordCachedResultToFile__block_invoke(uint64_t a1)
{
  id *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  int64_t v23;
  void *v24;
  void *v25;
  int64_t v26;
  NSObject *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  double v35;
  void *v36;
  void *v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  NSObject *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t i;
  void *v51;
  id v52;
  void *v53;
  uint64_t v54;
  void *v55;
  NSObject *v56;
  NSObject *v57;
  dispatch_time_t v58;
  id v59;
  NSObject *v60;
  id v61;
  id v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  id *v71;
  NSObject *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  _QWORD block[5];
  id v78;
  id v79;
  id v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  uint64_t v85;
  uint64_t v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  uint8_t buf[4];
  id v100;
  _BYTE v101[128];
  uint64_t v102;

  v102 = *MEMORY[0x24BDAC8D0];
  v1 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "cachedDetectionResult");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDFF278], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "kShotCategoryForDetectionType:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(*v1, "targetDetector");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(*v1, "targetDetector");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "identifier");
      v9 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(*v1, "_directory");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "timeIntervalSince1970");
      objc_msgSend(v11, "stringWithFormat:", CFSTR("%ld"), (uint64_t)v13);
      v14 = objc_claimAutoreleasedReturnValue();

      v69 = (void *)v14;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@_%@_%@"), v9, v3, v14);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "stringByAppendingPathExtension:", CFSTR("wav"));
      v70 = v10;
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringByAppendingPathComponent:");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:");
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = objc_alloc(MEMORY[0x24BDB1810]);
      objc_msgSend(*v1, "audioFileSettings");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v65 = (void *)v15;
      v76 = (void *)objc_msgSend(v16, "initForWriting:settings:commonFormat:interleaved:error:", v15, v17, 1, 1, 0);

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(*v1, "nRecordingsSoFar"));
      v18 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(*v1, "cachedCurrentResults");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v64 = (void *)v18;
      objc_msgSend(v19, "objectForKey:", v18);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "content");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "reverseObjectEnumerator");
      v75 = (void *)objc_claimAutoreleasedReturnValue();

      v22 = *((double *)*v1 + 1);
      v23 = vcvtpd_s64_f64(2.0 / v22);
      objc_msgSend(*v1, "cachedDetectionResult");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v24;
      if (v24)
      {
        objc_msgSend(v24, "timeRange");
        v26 = v96;
      }
      else
      {
        v26 = 0;
        v97 = 0u;
        v98 = 0u;
        v96 = 0u;
      }
      if (v26 >= v23)
      {
        objc_msgSend(*v1, "cachedDetectionResult");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = v29;
        if (v29)
        {
          objc_msgSend(v29, "timeRange");
          v31 = v93;
        }
        else
        {
          v31 = 0;
          v94 = 0u;
          v95 = 0u;
          v93 = 0u;
        }
        v28 = v31 - v23;

      }
      else
      {
        v28 = 0;
      }

      objc_msgSend(*v1, "cachedDetectionResult");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = v32;
      if (v32)
      {
        objc_msgSend(v32, "timeRange");
        v34 = v90;
      }
      else
      {
        v34 = 0;
        v91 = 0u;
        v92 = 0u;
        v90 = 0u;
      }
      v35 = 5.0 / v22;
      objc_msgSend(*v1, "cachedDetectionResult");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = v36;
      if (v36)
      {
        objc_msgSend(v36, "timeRange");
        v38 = *((_QWORD *)&v88 + 1);
      }
      else
      {
        v38 = 0;
        v88 = 0u;
        v89 = 0u;
        v87 = 0u;
      }
      v39 = vcvtpd_s64_f64(v35);
      v40 = v38 + v34;

      v41 = 0;
      v73 = v5;
      v74 = v3;
      v72 = v9;
      while (1)
      {
        v42 = v41;
        objc_msgSend(v75, "nextObject");
        v41 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v41)
          break;
        if ((objc_msgSend(v41, "detected") & 1) == 0)
        {
          objc_msgSend(*v1, "cachedDetectionResult");
          v43 = (void *)objc_claimAutoreleasedReturnValue();

          if (v41 != v43)
            continue;
        }
        objc_msgSend(v41, "timeRange");
        objc_msgSend(v41, "timeRange");
        v40 = v85 + v86;
        break;
      }
      v63 = v41;
      AXLogUltronKShot();
      v44 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
        __54__AXSDKShotRecordingManager__recordCachedResultToFile__block_invoke_cold_4(v1, v44);

      v83 = 0u;
      v84 = 0u;
      v81 = 0u;
      v82 = 0u;
      v71 = v1;
      objc_msgSend(*v1, "cachedCurrentAudio");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v81, v101, 16);
      if (v46)
      {
        v47 = v46;
        v48 = v40 + v39;
        v49 = *(_QWORD *)v82;
        do
        {
          for (i = 0; i != v47; ++i)
          {
            if (*(_QWORD *)v82 != v49)
              objc_enumerationMutation(v45);
            v51 = *(void **)(*((_QWORD *)&v81 + 1) + 8 * i);
            objc_msgSend(v51, "time");
            v52 = (id)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v52, "sampleTime") >= v28)
            {
              objc_msgSend(v51, "time");
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              v54 = objc_msgSend(v53, "sampleTime");

              if (v54 > v48)
                continue;
              objc_msgSend(v51, "buffer");
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              v80 = 0;
              objc_msgSend(v76, "writeFromBuffer:error:", v55, &v80);
              v52 = v80;

              if (v52)
              {
                AXLogUltronKShot();
                v56 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  v100 = v52;
                  _os_log_error_impl(&dword_21ACD4000, v56, OS_LOG_TYPE_ERROR, "Error writing KShot audio to file: %@", buf, 0xCu);
                }

              }
            }

          }
          v47 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v81, v101, 16);
        }
        while (v47);
      }

      AXLogUltronKShot();
      v57 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG))
        __54__AXSDKShotRecordingManager__recordCachedResultToFile__block_invoke_cold_3();

      v58 = dispatch_time(0, 1000000000);
      v59 = *v71;
      v60 = *((_QWORD *)*v71 + 2);
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __54__AXSDKShotRecordingManager__recordCachedResultToFile__block_invoke_34;
      block[3] = &unk_24DDF6BD0;
      block[4] = v59;
      v78 = v66;
      v79 = v65;
      v61 = v65;
      v62 = v66;
      dispatch_after(v58, v60, block);

      v5 = v73;
      v3 = v74;
      v27 = v72;
    }
    else
    {
      AXLogUltronKShot();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        __54__AXSDKShotRecordingManager__recordCachedResultToFile__block_invoke_cold_2();
    }
  }
  else
  {
    AXLogUltronKShot();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      __54__AXSDKShotRecordingManager__recordCachedResultToFile__block_invoke_cold_1();
  }

}

void __54__AXSDKShotRecordingManager__recordCachedResultToFile__block_invoke_34(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "targetDetector");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addRecording:", *(_QWORD *)(a1 + 40));

  v3 = *(id *)(a1 + 48);
  AXPerformBlockOnMainThread();

}

void __54__AXSDKShotRecordingManager__recordCachedResultToFile__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "targetDetector");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "recordings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4 == 1
    && (objc_msgSend(*(id *)(a1 + 32), "updateShouldSendSimilarityWarning:", *(_QWORD *)(a1 + 40)),
        objc_msgSend(*(id *)(a1 + 32), "shouldSendSimilarityWarning")))
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.accessibility.kshot.model.similarity.warning"), 0, 0, 1u);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "targetDetector");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "savedTrainingRecordingForDetector:", v7);

    objc_msgSend(MEMORY[0x24BDFF278], "sharedInstance");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setKShotShouldSaveCurrentSound:", 0);

  }
}

- (void)updateShouldSendSimilarityWarning:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  NSObject *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  __int128 v26;
  id v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[4];
  id v34;
  __int16 v35;
  void *v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[AXSDKShotRecordingManager setShouldSendSimilarityWarning:](self, "setShouldSendSimilarityWarning:", 0);
  objc_msgSend(MEMORY[0x24BDFF278], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodedKShotDetectors");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allValues");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
  if (v9)
  {
    v11 = v9;
    v12 = *(_QWORD *)v30;
    *(_QWORD *)&v10 = 138412290;
    v26 = v10;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v30 != v12)
          objc_enumerationMutation(v8);
        v14 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        if (objc_msgSend(v14, "isModelReady", v26))
        {
          AXLogUltronKShot();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v14, "name");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "identifier");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v34 = v22;
            v35 = 2112;
            v36 = v23;
            _os_log_debug_impl(&dword_21ACD4000, v15, OS_LOG_TYPE_DEBUG, "CONFIDENCE FOR DETECTOR %@ %@", buf, 0x16u);

          }
          v16 = objc_alloc(MEMORY[0x24BDE9AC8]);
          v28 = 0;
          v17 = (void *)objc_msgSend(v16, "initWithURL:error:", v4, &v28);
          v18 = v28;
          if (v18)
          {
            v24 = v18;
            AXLogUltronKShot();
            v25 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
              -[AXSDKShotRecordingManager updateShouldSendSimilarityWarning:].cold.1();

            goto LABEL_22;
          }
          +[AXSDKShotRecordingManager requestForDetector:](AXSDKShotRecordingManager, "requestForDetector:", v14);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = 0;
          objc_msgSend(v17, "addRequest:withObserver:error:", v19, self, &v27);
          v20 = v27;
          if (v20)
          {
            AXLogUltronKShot();
            v21 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = v26;
              v34 = v20;
              _os_log_debug_impl(&dword_21ACD4000, v21, OS_LOG_TYPE_DEBUG, "KSHOT MODEL CHECK ERROR adding request %@", buf, 0xCu);
            }

          }
          else
          {
            objc_msgSend(v17, "analyze");
          }

          if (v20)
            goto LABEL_22;
        }
      }
      v11 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
      if (v11)
        continue;
      break;
    }
  }
LABEL_22:

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
      AXLogUltronKShot();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        +[AXSDKShotRecordingManager requestForDetector:].cold.2(v3);

      v10 = 0;
    }

  }
  else
  {
    AXLogUltronKShot();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      +[AXSDKShotRecordingManager requestForDetector:].cold.1(v3);
    v10 = 0;
  }

  return v10;
}

- (void)request:(id)a3 didProduceResult:(id)a4
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  double v12;
  double v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a4, "classifications", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v10, "identifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "isEqualToString:", CFSTR("1")))
        {
          objc_msgSend(v10, "confidence");
          v13 = v12;

          if (v13 > 0.85)
            -[AXSDKShotRecordingManager setShouldSendSimilarityWarning:](self, "setShouldSendSimilarityWarning:", 1);
        }
        else
        {

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

}

- (id)audioFileSettings
{
  uint64_t v2;
  uint64_t v3;
  _QWORD v5[5];
  _QWORD v6[6];

  v6[5] = *MEMORY[0x24BDAC8D0];
  v2 = *MEMORY[0x24BDB1788];
  v5[0] = *MEMORY[0x24BDB1780];
  v5[1] = v2;
  v6[0] = &unk_24DDFED10;
  v6[1] = &unk_24DDFED28;
  v3 = *MEMORY[0x24BDB17A0];
  v5[2] = *MEMORY[0x24BDB1790];
  v5[3] = v3;
  v6[2] = MEMORY[0x24BDBD1C8];
  v6[3] = &unk_24DDFED40;
  v5[4] = *MEMORY[0x24BDB17B8];
  v6[4] = &unk_24DDFED58;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v6, v5, 5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (AXSDKShotRecordingManagerDelegate)delegate
{
  return (AXSDKShotRecordingManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (AXSDKShotDetector)targetDetector
{
  return self->_targetDetector;
}

- (BOOL)isDetectionInProgress
{
  return self->_isDetectionInProgress;
}

- (void)setIsDetectionInProgress:(BOOL)a3
{
  self->_isDetectionInProgress = a3;
}

- (NSString)currentDetectionType
{
  return self->_currentDetectionType;
}

- (void)setCurrentDetectionType:(id)a3
{
  objc_storeStrong((id *)&self->_currentDetectionType, a3);
}

- (int)numNonDetections
{
  return self->_numNonDetections;
}

- (void)setNumNonDetections:(int)a3
{
  self->_numNonDetections = a3;
}

- (int)numObservations
{
  return self->_numObservations;
}

- (void)setNumObservations:(int)a3
{
  self->_numObservations = a3;
}

- (NSMutableDictionary)currentDetections
{
  return self->_currentDetections;
}

- (void)setCurrentDetections:(id)a3
{
  objc_storeStrong((id *)&self->_currentDetections, a3);
}

- (NSArray)cachedCurrentAudio
{
  return self->_cachedCurrentAudio;
}

- (void)setCachedCurrentAudio:(id)a3
{
  objc_storeStrong((id *)&self->_cachedCurrentAudio, a3);
}

- (NSDictionary)cachedCurrentResults
{
  return self->_cachedCurrentResults;
}

- (void)setCachedCurrentResults:(id)a3
{
  objc_storeStrong((id *)&self->_cachedCurrentResults, a3);
}

- (SNDetectionResult)cachedDetectionResult
{
  return self->_cachedDetectionResult;
}

- (void)setCachedDetectionResult:(id)a3
{
  objc_storeStrong((id *)&self->_cachedDetectionResult, a3);
}

- (NSTimer)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
  objc_storeStrong((id *)&self->_timer, a3);
}

- (BOOL)shouldSendSimilarityWarning
{
  return self->_shouldSendSimilarityWarning;
}

- (void)setShouldSendSimilarityWarning:(BOOL)a3
{
  self->_shouldSendSimilarityWarning = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_cachedDetectionResult, 0);
  objc_storeStrong((id *)&self->_cachedCurrentResults, 0);
  objc_storeStrong((id *)&self->_cachedCurrentAudio, 0);
  objc_storeStrong((id *)&self->_currentDetections, 0);
  objc_storeStrong((id *)&self->_currentDetectionType, 0);
  objc_storeStrong((id *)&self->_targetDetector, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_cachedCurrentAudioFile, 0);
  objc_storeStrong((id *)&self->_detectionResultCollection, 0);
  objc_storeStrong((id *)&self->_audioRingBuffer, 0);
  objc_storeStrong((id *)&self->_fileProcessingQueue, 0);
}

- (void)listenEngineFailedToStartWithError:.cold.1()
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_5_0();
  _os_log_fault_impl(&dword_21ACD4000, v0, OS_LOG_TYPE_FAULT, "KShot recording manager: Listen Engine failed to start.", v1, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)_directory
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_2(&dword_21ACD4000, v0, v1, "Creating KShot Directory", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __54__AXSDKShotRecordingManager__recordCachedResultToFile__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_21ACD4000, v0, v1, "We shouldn't get here unless listening type category wasn't found %@.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __54__AXSDKShotRecordingManager__recordCachedResultToFile__block_invoke_cold_2()
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_5_0();
  _os_log_error_impl(&dword_21ACD4000, v0, OS_LOG_TYPE_ERROR, "We shouldn't get here unless we have a target detector to train. Not saving recording.", v1, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __54__AXSDKShotRecordingManager__recordCachedResultToFile__block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_2(&dword_21ACD4000, v0, v1, "KSHOT done recording result to file", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __54__AXSDKShotRecordingManager__recordCachedResultToFile__block_invoke_cold_4(id *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*a1, "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_4_0(&dword_21ACD4000, a2, v4, "KSHOT Recording result to file at path %@.", v5);

}

- (void)updateShouldSendSimilarityWarning:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_4_0(&dword_21ACD4000, v0, v1, "KSHOT MODEL CHECK ERROR audioAnalyzer init %@", v2);
  OUTLINED_FUNCTION_2();
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

  objc_msgSend(a1, "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0_3(&dword_21ACD4000, v4, v5, "Unable to create model from compiled model for detector %@ %@. error: %@", v6, v7, v8, v9, 2u);

  OUTLINED_FUNCTION_2_2();
}

+ (void)requestForDetector:(void *)a1 .cold.2(void *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  objc_msgSend(a1, "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0_3(&dword_21ACD4000, v4, v5, "Unable to create request from detector %@ %@. error: %@", v6, v7, v8, v9, 2u);

  OUTLINED_FUNCTION_2_2();
}

@end
