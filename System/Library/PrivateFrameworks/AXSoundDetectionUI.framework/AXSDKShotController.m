@implementation AXSDKShotController

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1)
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_1);
  return (id)sharedInstance___SharedController;
}

void __37__AXSDKShotController_sharedInstance__block_invoke()
{
  AXSDKShotController *v0;
  void *v1;

  v0 = objc_alloc_init(AXSDKShotController);
  v1 = (void *)sharedInstance___SharedController;
  sharedInstance___SharedController = (uint64_t)v0;

}

- (AXSDKShotController)init
{
  AXSDKShotController *v2;
  AXSDKShotController *v3;
  uint64_t v4;
  AXSDListenEngine *listenEngine;
  AXSDKShotRecordingManager *v6;
  AXSDKShotRecordingManager *kShotRecordingManager;
  AXSDDetectorManager *v8;
  void *v9;
  AXSDKShotDetectorQueueManager *v10;
  AXSDKShotDetectorQueueManager *detectorQueueManager;
  NSObject *v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *listenerQueue;
  uint64_t v15;
  NSMutableDictionary *listenerHanders;
  HearingMLHelperService *v17;
  HearingMLHelperService *xpcHelperService;
  _TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation *v19;
  _TtP18AXSoundDetectionUI32AXSDKShotRecordingImplementation_ *trainingController;
  void *v21;
  _QWORD v23[4];
  id v24;
  id location;
  objc_super v26;

  v26.receiver = self;
  v26.super_class = (Class)AXSDKShotController;
  v2 = -[AXSDKShotController init](&v26, sel_init);
  v3 = v2;
  if (v2)
  {
    -[AXSDKShotController setVisualizationBucketCount:](v2, "setVisualizationBucketCount:", 0);
    +[AXSDListenEngine sharedInstance](AXSDListenEngine, "sharedInstance");
    v4 = objc_claimAutoreleasedReturnValue();
    listenEngine = v3->_listenEngine;
    v3->_listenEngine = (AXSDListenEngine *)v4;

    v6 = -[AXSDKShotRecordingManager initWithSampleLength:bufferSize:]([AXSDKShotRecordingManager alloc], "initWithSampleLength:bufferSize:", 0.000022675737, (double)-[AXSDListenEngine bufferSize](v3->_listenEngine, "bufferSize"));
    kShotRecordingManager = v3->_kShotRecordingManager;
    v3->_kShotRecordingManager = v6;

    -[AXSDKShotRecordingManager setDelegate:](v3->_kShotRecordingManager, "setDelegate:", v3);
    v8 = objc_alloc_init(AXSDDetectorManager);
    -[AXSDKShotController setDetectorManager:](v3, "setDetectorManager:", v8);

    -[AXSDKShotController detectorManager](v3, "detectorManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setDelegate:", v3);

    v10 = objc_alloc_init(AXSDKShotDetectorQueueManager);
    detectorQueueManager = v3->_detectorQueueManager;
    v3->_detectorQueueManager = v10;

    -[AXSDDetectorQueueManager setDelegate:](v3->_detectorQueueManager, "setDelegate:", v3);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = dispatch_queue_create("com.apple.accessibility.kshotcontrollere.listenerqueue", v12);
    listenerQueue = v3->_listenerQueue;
    v3->_listenerQueue = (OS_dispatch_queue *)v13;

    v15 = objc_opt_new();
    listenerHanders = v3->_listenerHanders;
    v3->_listenerHanders = (NSMutableDictionary *)v15;

    v17 = (HearingMLHelperService *)objc_alloc_init(MEMORY[0x24BE4BDB8]);
    xpcHelperService = v3->_xpcHelperService;
    v3->_xpcHelperService = v17;

    -[HearingMLHelperService setDelegate:](v3->_xpcHelperService, "setDelegate:", v3);
    v19 = objc_alloc_init(_TtC18AXSoundDetectionUI44AXSDKShotNSRecordingControllerImplementation);
    trainingController = v3->_trainingController;
    v3->_trainingController = (_TtP18AXSoundDetectionUI32AXSDKShotRecordingImplementation_ *)v19;

    if (objc_msgSend(MEMORY[0x24BE4BD98], "isInternalInstall"))
    {
      objc_initWeak(&location, v3);
      objc_msgSend(MEMORY[0x24BDFF278], "sharedInstance");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = MEMORY[0x24BDAC760];
      v23[1] = 3221225472;
      v23[2] = __27__AXSDKShotController_init__block_invoke;
      v23[3] = &unk_24DDF6738;
      objc_copyWeak(&v24, &location);
      objc_msgSend(v21, "registerUpdateBlock:forRetrieveSelector:withListener:", v23, sel_retrainModelIdentifier, v3);

      objc_destroyWeak(&v24);
      objc_destroyWeak(&location);
    }
  }
  return v3;
}

void __27__AXSDKShotController_init__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_retrainModelIdentifierUpdated");

}

- (void)setVisualizationBucketCount:(unint64_t)a3
{
  self->_visualizationBucketCount = a3 + 2;
}

- (void)registerListener:(id)a3 forRecordingUpdates:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  NSObject *listenerQueue;
  id v11;
  id v12;
  _QWORD block[5];
  id v14;
  id v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  AXLogUltronKShot();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v17 = v6;
    _os_log_impl(&dword_21ACD4000, v8, OS_LOG_TYPE_DEFAULT, "Register recording listener: %@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  listenerQueue = self->_listenerQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __60__AXSDKShotController_registerListener_forRecordingUpdates___block_invoke;
  block[3] = &unk_24DDF6C18;
  v14 = v9;
  v15 = v7;
  block[4] = self;
  v11 = v9;
  v12 = v7;
  dispatch_async(listenerQueue, block);

}

void __60__AXSDKShotController_registerListener_forRecordingUpdates___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  v4 = (id)objc_msgSend(*(id *)(a1 + 48), "copy");
  v3 = _Block_copy(v4);
  objc_msgSend(v2, "setObject:forKey:", v3, *(_QWORD *)(a1 + 40));

}

- (void)deregisterListener:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *listenerQueue;
  id v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  AXLogUltronKShot();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v12 = v4;
    _os_log_impl(&dword_21ACD4000, v5, OS_LOG_TYPE_DEFAULT, "Deregister audio listener: %@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  listenerQueue = self->_listenerQueue;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __42__AXSDKShotController_deregisterListener___block_invoke;
  v9[3] = &unk_24DDF6B58;
  v9[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(listenerQueue, v9);

}

uint64_t __42__AXSDKShotController_deregisterListener___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
}

- (void)startListening
{
  NSObject *v3;
  _QWORD block[5];
  uint8_t buf[16];

  AXLogUltronKShot();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21ACD4000, v3, OS_LOG_TYPE_DEFAULT, "KShot Controller: Start Listening", buf, 2u);
  }

  if (-[AXSDDetectorQueueManager prepareToListen](self->_detectorQueueManager, "prepareToListen"))
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __37__AXSDKShotController_startListening__block_invoke;
    block[3] = &unk_24DDF6AE0;
    block[4] = self;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }
}

uint64_t __37__AXSDKShotController_startListening__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "addListenDelegate:");
}

- (void)startListeningToTrainDetector:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  AXLogUltronKShot();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 138412290;
    v15 = v4;
    _os_log_impl(&dword_21ACD4000, v5, OS_LOG_TYPE_DEFAULT, "KShot Controller: Start listening to train detector: %@", (uint8_t *)&v14, 0xCu);
  }

  if (v4)
  {
    -[AXSDKShotController addGeneralApplianceDetector](self, "addGeneralApplianceDetector");
    -[AXSDKShotRecordingManager setTargetDetector:](self->_kShotRecordingManager, "setTargetDetector:", v4);
    -[AXSDKShotController startListening](self, "startListening");
  }
  else
  {
    AXLogUltronKShot();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[AXSDKShotController startListeningToTrainDetector:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);

  }
}

- (void)stopListening
{
  NSObject *v3;
  _QWORD block[5];
  uint8_t buf[16];

  AXLogUltron();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21ACD4000, v3, OS_LOG_TYPE_DEFAULT, "KShot Controller: Stop Listening", buf, 2u);
  }

  -[AXSDDetectorQueueManager stopListening](self->_detectorQueueManager, "stopListening");
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __36__AXSDKShotController_stopListening__block_invoke;
  block[3] = &unk_24DDF6AE0;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

uint64_t __36__AXSDKShotController_stopListening__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "removeListenDelegate:");
  objc_msgSend(*(id *)(a1 + 32), "detectorManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllDetectors");

  objc_msgSend(*(id *)(a1 + 32), "detectorManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stopDetection");

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "reset");
}

- (void)addListenType:(id)a3
{
  -[AXSDDetectorQueueManager addListenType:](self->_detectorQueueManager, "addListenType:", a3);
}

- (void)addGeneralApplianceDetector
{
  NSObject *v3;
  uint8_t v4[16];

  AXLogUltronKShot();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_21ACD4000, v3, OS_LOG_TYPE_DEFAULT, "KShot Controller: Add General Appliance Detector", v4, 2u);
  }

  -[AXSDKShotDetectorQueueManager addGeneralApplianceDetector](self->_detectorQueueManager, "addGeneralApplianceDetector");
}

- (void)removeAllListenTypes
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __43__AXSDKShotController_removeAllListenTypes__block_invoke;
  block[3] = &unk_24DDF6AE0;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __43__AXSDKShotController_removeAllListenTypes__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "detectorManager");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "removeAllDetectors");

}

- (void)kickoffTrainingForDetector:(id)a3
{
  id v4;
  NSObject *v5;
  _TtP18AXSoundDetectionUI32AXSDKShotRecordingImplementation_ *trainingController;
  id v7;
  NSObject *v8;
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  AXLogUltron();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v11 = v4;
    _os_log_impl(&dword_21ACD4000, v5, OS_LOG_TYPE_DEFAULT, "KShot Controller: Kicking off training of detector: %@", buf, 0xCu);
  }

  trainingController = self->_trainingController;
  v9 = 0;
  -[AXSDKShotRecordingImplementation kickoffMLTrainingOfDetector:error:](trainingController, "kickoffMLTrainingOfDetector:error:", v4, &v9);
  v7 = v9;
  if (v7)
  {
    AXLogUltronKShot();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[AXSDKShotController kickoffTrainingForDetector:].cold.1();

  }
}

- (BOOL)retrainModelWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  NSObject *v8;

  v4 = a3;
  +[AXSDDetectorStore sharedInstance](AXSDDetectorStore, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "detectorWithIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    AXLogUltronKShot();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[AXSDKShotController retrainModelWithIdentifier:].cold.1();
    goto LABEL_8;
  }
  if ((objc_msgSend(v6, "isCustom") & 1) == 0)
  {
    AXLogUltronKShot();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[AXSDKShotController retrainModelWithIdentifier:].cold.2();
LABEL_8:

    v7 = 0;
    goto LABEL_9;
  }
  v7 = -[AXSDKShotController retrainDetector:](self, "retrainDetector:", v6);
LABEL_9:

  return v7;
}

- (BOOL)retrainDetector:(id)a3
{
  -[AXSDKShotController kickoffTrainingForDetector:](self, "kickoffTrainingForDetector:", a3);
  return 1;
}

- (void)_retrainModelIdentifierUpdated
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_21ACD4000, v0, v1, "Not retraining model with identifier: (%@)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)listenEngineDidStartWithInputFormat:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[5];
  id v15;
  uint8_t buf[16];

  v4 = a3;
  AXLogUltronKShot();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21ACD4000, v5, OS_LOG_TYPE_DEFAULT, "Starting listen engine", buf, 2u);
  }

  if (v4)
  {
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __59__AXSDKShotController_listenEngineDidStartWithInputFormat___block_invoke;
    v14[3] = &unk_24DDF6B58;
    v14[4] = self;
    v15 = v4;
    dispatch_async(MEMORY[0x24BDAC9B8], v14);

  }
  else
  {
    AXLogUltronKShot();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[AXSDKShotController listenEngineDidStartWithInputFormat:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);

    -[AXSDKShotController stopListening](self, "stopListening");
  }

}

void __59__AXSDKShotController_listenEngineDidStartWithInputFormat___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "detectorManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "startGeneralApplianceDetectionWithFormat:", *(_QWORD *)(a1 + 40));

}

- (void)listenEngineFailedToStartWithError:(id)a3
{
  id v3;
  NSObject *v4;

  v3 = a3;
  AXLogUltronKShot();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    -[AXSDKShotController listenEngineFailedToStartWithError:].cold.1();

}

- (void)receivedBuffer:(id)a3 atTime:(id)a4
{
  -[AXSDKShotController receivedBuffer:atTime:isFile:](self, "receivedBuffer:atTime:isFile:", a3, a4, 0);
}

- (void)receivedBuffer:(id)a3 atTime:(id)a4 isFile:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  id v10;

  v5 = a5;
  v8 = a4;
  v10 = a3;
  -[AXSDKShotController detectorManager](self, "detectorManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "processAudioBuffer:atTime:", v10, v8);

  -[AXSDKShotRecordingManager trackBuffer:atTime:isFile:](self->_kShotRecordingManager, "trackBuffer:atTime:isFile:", v10, v8, v5);
}

- (void)receivedObservation:(id)a3 forDetector:(id)a4
{
  -[AXSDKShotRecordingManager receivedObservation:forDetector:](self->_kShotRecordingManager, "receivedObservation:forDetector:", a3, a4);
}

- (void)receivedCompletion:(id)a3
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  AXLogUltronKShot();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_21ACD4000, v4, OS_LOG_TYPE_DEFAULT, "Received Completion for: %@", (uint8_t *)&v5, 0xCu);
  }

}

- (void)receivedError:(id)a3 fromDetector:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;

  v5 = a3;
  v6 = a4;
  AXLogUltronKShot();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    -[AXSDKShotController receivedError:fromDetector:].cold.1(v6, (uint64_t)v5, v7);

}

- (void)savedTrainingRecordingForDetector:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t);
  void *v16;
  id v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    -[NSMutableDictionary allKeys](self->_listenerHanders, "allKeys");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v20;
      v9 = MEMORY[0x24BDAC760];
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v20 != v8)
            objc_enumerationMutation(v5);
          -[NSMutableDictionary objectForKey:](self->_listenerHanders, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v10), v13, v14, v15, v16);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = v11;
          if (v11)
          {
            v13 = v9;
            v14 = 3221225472;
            v15 = __57__AXSDKShotController_savedTrainingRecordingForDetector___block_invoke;
            v16 = &unk_24DDF6C40;
            v18 = v11;
            v17 = v4;
            AXPerformBlockOnMainThread();

          }
          ++v10;
        }
        while (v7 != v10);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v7);
    }

  }
}

uint64_t __57__AXSDKShotController_savedTrainingRecordingForDetector___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)hearingMLHelperService:(id)a3 eventOccurred:(int64_t)a4
{
  NSObject *v6;
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v8;
  void *v9;
  AXSDKShotDetector *trainingDetector;

  AXLogUltronKShot();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    -[AXSDKShotController hearingMLHelperService:eventOccurred:].cold.1((uint64_t)self, a4, v6);

  if (self->_trainingDetector)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.accessibility.kshot.model.error"), 0, 0, 1u);
    AXSDSoundDetectionSendKShotModelFailedNotification(self->_trainingDetector);
    objc_msgSend(MEMORY[0x24BDFF278], "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setKShotDetectorModelFailed:modelFailed:", self->_trainingDetector, 1);

    objc_msgSend(MEMORY[0x24BDFF278], "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setIsActivelyTrainingAKShotModel:", 0);

    trainingDetector = self->_trainingDetector;
    self->_trainingDetector = 0;

  }
}

- (AXSDDetectorManager)detectorManager
{
  return self->detectorManager;
}

- (void)setDetectorManager:(id)a3
{
  objc_storeStrong((id *)&self->detectorManager, a3);
}

- (unint64_t)visualizationBucketCount
{
  return self->_visualizationBucketCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->detectorManager, 0);
  objc_storeStrong((id *)&self->_trainingController, 0);
  objc_storeStrong((id *)&self->_trainingDetector, 0);
  objc_storeStrong((id *)&self->_xpcHelperService, 0);
  objc_storeStrong((id *)&self->_listenerHanders, 0);
  objc_storeStrong((id *)&self->_listenerQueue, 0);
  objc_storeStrong((id *)&self->_detectorQueueManager, 0);
  objc_storeStrong((id *)&self->_kShotRecordingManager, 0);
  objc_storeStrong((id *)&self->_listenEngine, 0);
}

- (void)startListeningToTrainDetector:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_1(&dword_21ACD4000, a1, a3, "Tried to start training a null detector! This should NOT happen. Please file a radar.", a5, a6, a7, a8, 0);
}

- (void)kickoffTrainingForDetector:.cold.1()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[14];
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_5_1();
  v3 = v0;
  OUTLINED_FUNCTION_0(&dword_21ACD4000, v1, (uint64_t)v1, "KShot Controller: Error kicking off training for detector: %@. Error: %@", v2);
  OUTLINED_FUNCTION_2();
}

- (void)retrainModelWithIdentifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_21ACD4000, v0, v1, "No Detector found with identifier: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)retrainModelWithIdentifier:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_21ACD4000, v0, v1, "Specified detector is not custom! Detector: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)listenEngineDidStartWithInputFormat:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_1(&dword_21ACD4000, a1, a3, "Listen engine did not return an audio format - this should NOT happen; bailing. File a radar!",
    a5,
    a6,
    a7,
    a8,
    0);
}

- (void)listenEngineFailedToStartWithError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_21ACD4000, v0, v1, "KShot Controller: Listen Engine failed to start: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)receivedError:(NSObject *)a3 fromDetector:.cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  uint64_t v6;
  uint8_t v7[14];
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "soundIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_1();
  v8 = a2;
  OUTLINED_FUNCTION_0(&dword_21ACD4000, a3, v6, "Received Error for %@: %@", v7);

}

- (void)hearingMLHelperService:(NSObject *)a3 eventOccurred:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 56);
  v4 = 134218242;
  v5 = a2;
  v6 = 2112;
  v7 = v3;
  OUTLINED_FUNCTION_0(&dword_21ACD4000, a3, (uint64_t)a3, "HearingMLHelperService: Invaidation event occured - code: %ld - detector: %@", (uint8_t *)&v4);
  OUTLINED_FUNCTION_2();
}

@end
