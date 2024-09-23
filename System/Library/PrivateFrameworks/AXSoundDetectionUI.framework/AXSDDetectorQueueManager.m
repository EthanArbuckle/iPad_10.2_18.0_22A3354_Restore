@implementation AXSDDetectorQueueManager

- (AXSDDetectorQueueManager)init
{
  AXSDDetectorQueueManager *v2;
  AXSDDetectorQueueManager *v3;
  NSMutableSet *v4;
  NSMutableSet *detectorQueue;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AXSDDetectorQueueManager;
  v2 = -[AXSDDetectorQueueManager init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_ready = 0;
    v4 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    detectorQueue = v3->_detectorQueue;
    v3->_detectorQueue = v4;

    +[AXSDDetectorStore sharedInstance](AXSDDetectorStore, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:", v3);

    +[AXSDDetectorStore sharedInstance](AXSDDetectorStore, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "loadDetectors");

  }
  return v3;
}

- (id)detectorManager
{
  void *v2;
  void *v3;

  -[AXSDDetectorQueueManager delegate](self, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "detectorManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)addListenType:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  +[AXSDDetectorStore sharedInstance](AXSDDetectorStore, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  self->_ready = objc_msgSend(v5, "areDetectorsReady");

  if (self->_ready)
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __42__AXSDDetectorQueueManager_addListenType___block_invoke;
    v7[3] = &unk_24DDF6B58;
    v7[4] = self;
    v8 = v4;
    dispatch_async(MEMORY[0x24BDAC9B8], v7);

  }
  else
  {
    AXLogUltron();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[AXSDDetectorQueueManager addListenType:].cold.1();

    -[AXSDDetectorQueueManager _queueListenType:](self, "_queueListenType:", v4);
  }

}

void __42__AXSDDetectorQueueManager_addListenType___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  NSObject *v9;

  AXLogUltron();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __42__AXSDDetectorQueueManager_addListenType___block_invoke_cold_2();

  v3 = a1 + 32;
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "detectorManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1 + 40);
  v6 = a1 + 40;
  v8 = objc_msgSend(v5, "addDetectorType:", v7);

  if ((v8 & 1) == 0)
  {
    AXLogUltron();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __42__AXSDDetectorQueueManager_addListenType___block_invoke_cold_1(v3, v6, v9);

  }
}

- (void)addDetector:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __40__AXSDDetectorQueueManager_addDetector___block_invoke;
  v6[3] = &unk_24DDF6B58;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

void __40__AXSDDetectorQueueManager_addDetector___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  NSObject *v9;

  AXLogUltron();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __40__AXSDDetectorQueueManager_addDetector___block_invoke_cold_2();

  v3 = a1 + 32;
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "detectorManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1 + 40);
  v6 = a1 + 40;
  v8 = objc_msgSend(v5, "addDetector:", v7);

  if ((v8 & 1) == 0)
  {
    AXLogUltron();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __40__AXSDDetectorQueueManager_addDetector___block_invoke_cold_1(v3, v6, v9);

  }
}

- (void)removeListenType:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  +[AXSDDetectorStore sharedInstance](AXSDDetectorStore, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  self->_ready = objc_msgSend(v5, "areDetectorsReady");

  if (self->_ready)
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __45__AXSDDetectorQueueManager_removeListenType___block_invoke;
    v7[3] = &unk_24DDF6B58;
    v7[4] = self;
    v8 = v4;
    dispatch_async(MEMORY[0x24BDAC9B8], v7);

  }
  else
  {
    AXLogUltron();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[AXSDDetectorQueueManager removeListenType:].cold.1(v6);

    -[AXSDDetectorQueueManager _dequeueListenType:](self, "_dequeueListenType:", v4);
  }

}

void __45__AXSDDetectorQueueManager_removeListenType___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  NSObject *v9;

  AXLogUltron();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __45__AXSDDetectorQueueManager_removeListenType___block_invoke_cold_2();

  v3 = a1 + 32;
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "detectorManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1 + 40);
  v6 = a1 + 40;
  v8 = objc_msgSend(v5, "removeDetectorType:", v7);

  if ((v8 & 1) == 0)
  {
    AXLogUltron();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __45__AXSDDetectorQueueManager_removeListenType___block_invoke_cold_1(v3, v6, v9);

  }
}

- (BOOL)containsListenType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  -[AXSDDetectorQueueManager delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "detectorManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "currentDetectors");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "containsObject:", v4);

  return v8;
}

- (void)removeDetector:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __43__AXSDDetectorQueueManager_removeDetector___block_invoke;
  v6[3] = &unk_24DDF6B58;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

void __43__AXSDDetectorQueueManager_removeDetector___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  NSObject *v9;

  AXLogUltron();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __43__AXSDDetectorQueueManager_removeDetector___block_invoke_cold_2();

  v3 = a1 + 32;
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "detectorManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1 + 40);
  v6 = a1 + 40;
  v8 = objc_msgSend(v5, "addDetector:", v7);

  if ((v8 & 1) == 0)
  {
    AXLogUltron();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __43__AXSDDetectorQueueManager_removeDetector___block_invoke_cold_1(v3, v6, v9);

  }
}

- (void)removeAllListenTypes
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __48__AXSDDetectorQueueManager_removeAllListenTypes__block_invoke;
  block[3] = &unk_24DDF6AE0;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __48__AXSDDetectorQueueManager_removeAllListenTypes__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;

  AXLogUltron();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __48__AXSDDetectorQueueManager_removeAllListenTypes__block_invoke_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "detectorManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllDetectors");

}

- (BOOL)prepareToListen
{
  void *v3;
  void *v4;
  _BOOL4 ready;
  NSObject *v6;

  +[AXSDDetectorStore sharedInstance](AXSDDetectorStore, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:", self);

  +[AXSDDetectorStore sharedInstance](AXSDDetectorStore, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  self->_ready = objc_msgSend(v4, "areDetectorsReady");

  ready = self->_ready;
  if (!self->_ready)
  {
    AXLogUltron();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[AXSDDetectorQueueManager prepareToListen].cold.1();

  }
  return ready;
}

- (void)stopListening
{
  id v3;

  +[AXSDDetectorStore sharedInstance](AXSDDetectorStore, "sharedInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

}

- (id)currentDetectionTypes
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x24BDBCF20];
  -[AXSDDetectorQueueManager delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "detectorManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentDetectors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_queueListenType:(id)a3
{
  id v4;
  NSObject *v5;

  v4 = a3;
  AXLogUltron();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[AXSDDetectorQueueManager _queueListenType:].cold.1();

  -[NSMutableSet addObject:](self->_detectorQueue, "addObject:", v4);
}

- (void)_dequeueListenType:(id)a3
{
  id v4;
  NSObject *v5;

  v4 = a3;
  AXLogUltron();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[AXSDDetectorQueueManager _dequeueListenType:].cold.1();

  -[NSMutableSet removeObject:](self->_detectorQueue, "removeObject:", v4);
}

- (void)detectorsReadyForDetectorStore:(id)a3
{
  NSObject *v4;
  id v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  id v10;
  _QWORD block[5];
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  self->_ready = 1;
  AXLogUltron();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v13 = (id)objc_opt_class();
    v5 = v13;
    _os_log_impl(&dword_21ACD4000, v4, OS_LOG_TYPE_INFO, "[%@]: detectors ready", buf, 0xCu);

  }
  v6 = -[NSMutableSet count](self->_detectorQueue, "count");
  AXLogUltron();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[AXSDDetectorQueueManager detectorsReadyForDetectorStore:].cold.1();

    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __59__AXSDDetectorQueueManager_detectorsReadyForDetectorStore___block_invoke;
    block[3] = &unk_24DDF6AE0;
    block[4] = self;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v9 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138412290;
      v13 = v9;
      v10 = v9;
      _os_log_impl(&dword_21ACD4000, v8, OS_LOG_TYPE_INFO, "[%@]: assets ready but no detectors in queue to start", buf, 0xCu);

    }
  }
}

void __59__AXSDDetectorQueueManager_detectorsReadyForDetectorStore___block_invoke(uint64_t a1)
{
  id *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  char v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  __int128 v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t v37[128];
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  uint64_t v41;
  __int16 v42;
  void *v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v28 = (void *)objc_opt_new();
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v3 = *(void **)(a1 + 32);
  v2 = (id *)(a1 + 32);
  objc_msgSend(v3, "detectorQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v33, v44, 16);
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v34;
    *(_QWORD *)&v6 = 138412802;
    v27 = v6;
    while (2)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v34 != v8)
          objc_enumerationMutation(v4);
        v10 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * v9);
        +[AXSDDetectorStore sharedInstance](AXSDDetectorStore, "sharedInstance", v27);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "detectorWithIdentifier:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        AXLogUltron();
        v13 = objc_claimAutoreleasedReturnValue();
        v14 = v13;
        if (!v12)
        {
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
            __59__AXSDDetectorQueueManager_detectorsReadyForDetectorStore___block_invoke_cold_1(v2, v10, v14);
          goto LABEL_24;
        }
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          v15 = (void *)objc_opt_class();
          *(_DWORD *)buf = v27;
          v39 = v15;
          v40 = 2112;
          v41 = v10;
          v42 = 2112;
          v43 = v12;
          v16 = v15;
          _os_log_impl(&dword_21ACD4000, v14, OS_LOG_TYPE_INFO, "[%@]: adding listen type: %@. with asset: %@", buf, 0x20u);

        }
        objc_msgSend(*v2, "delegate");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "detectorManager");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "addDetector:", v12);

        if ((v19 & 1) == 0)
        {
          AXLogUltron();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
            __59__AXSDDetectorQueueManager_detectorsReadyForDetectorStore___block_invoke_cold_2(v2, v10, v14);
LABEL_24:

          goto LABEL_25;
        }
        objc_msgSend(v28, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v33, v44, 16);
      if (v7)
        continue;
      break;
    }
  }

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v20 = v28;
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v30;
    do
    {
      v24 = 0;
      do
      {
        if (*(_QWORD *)v30 != v23)
          objc_enumerationMutation(v20);
        v25 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * v24);
        objc_msgSend(*v2, "detectorQueue");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "removeObject:", v25);

        ++v24;
      }
      while (v22 != v24);
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
    }
    while (v22);
  }

  objc_msgSend(*v2, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assetsReadyAndDetectorsAdded");
LABEL_25:

}

- (void)detectorStore:(id)a3 detectorsNeedUpdate:(id)a4 toDetectors:(id)a5
{
  id v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  char v13;
  NSObject *v14;
  _BOOL4 v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t v35[128];
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  void *v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v6 = a5;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
  if (v7)
  {
    v9 = v7;
    v10 = *(_QWORD *)v32;
    *(_QWORD *)&v8 = 138412546;
    v26 = v8;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v32 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        v13 = objc_msgSend(v12, "isInstalled", v26);
        AXLogUltron();
        v14 = objc_claimAutoreleasedReturnValue();
        v15 = os_log_type_enabled(v14, OS_LOG_TYPE_INFO);
        if ((v13 & 1) != 0)
        {
          if (v15)
          {
            v16 = (void *)objc_opt_class();
            *(_DWORD *)buf = v26;
            v37 = v16;
            v38 = 2112;
            v39 = v12;
            v17 = v16;
            _os_log_impl(&dword_21ACD4000, v14, OS_LOG_TYPE_INFO, "[%@]: Swapping updated dtector: %@", buf, 0x16u);

          }
          objc_msgSend(v12, "identifier");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[AXSDDetectorQueueManager removeListenType:](self, "removeListenType:", v18);

          -[AXSDDetectorQueueManager addDetector:](self, "addDetector:", v12);
        }
        else
        {
          if (v15)
          {
            v19 = (void *)objc_opt_class();
            *(_DWORD *)buf = v26;
            v37 = v19;
            v38 = 2112;
            v39 = v12;
            v20 = v19;
            _os_log_impl(&dword_21ACD4000, v14, OS_LOG_TYPE_INFO, "[%@]: Detector is new but not installed: %@", buf, 0x16u);

          }
        }
      }
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
    }
    while (v9);
  }
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v21 = v6;
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v28;
    do
    {
      for (j = 0; j != v23; ++j)
      {
        if (*(_QWORD *)v28 != v24)
          objc_enumerationMutation(v21);
        -[AXSDDetectorQueueManager removeDetector:](self, "removeDetector:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * j));
      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    }
    while (v23);
  }

}

- (AXSDDetectorQueueManagerDelegate)delegate
{
  return (AXSDDetectorQueueManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)ready
{
  return self->_ready;
}

- (void)setReady:(BOOL)a3
{
  self->_ready = a3;
}

- (NSMutableSet)detectorQueue
{
  return self->_detectorQueue;
}

- (void)setDetectorQueue:(id)a3
{
  objc_storeStrong((id *)&self->_detectorQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detectorQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)addListenType:.cold.1()
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
  OUTLINED_FUNCTION_5_3(&dword_21ACD4000, v2, v3, "[%@]: queue listen type: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_1();
}

void __42__AXSDDetectorQueueManager_addListenType___block_invoke_cold_2()
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

  OUTLINED_FUNCTION_17();
  v0 = (void *)OUTLINED_FUNCTION_10();
  v1 = OUTLINED_FUNCTION_5_4(v0);
  OUTLINED_FUNCTION_5_3(&dword_21ACD4000, v2, v3, "[%@]: add listen type: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_1();
}

void __40__AXSDDetectorQueueManager_addDetector___block_invoke_cold_2()
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

  OUTLINED_FUNCTION_17();
  v0 = (void *)OUTLINED_FUNCTION_10();
  v1 = OUTLINED_FUNCTION_5_4(v0);
  OUTLINED_FUNCTION_5_3(&dword_21ACD4000, v2, v3, "[%@]: add detector: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_1();
}

- (void)removeListenType:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_21ACD4000, log, OS_LOG_TYPE_DEBUG, "Controller: Dequeue listen type", v1, 2u);
}

void __45__AXSDDetectorQueueManager_removeListenType___block_invoke_cold_2()
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

  OUTLINED_FUNCTION_17();
  v0 = (void *)OUTLINED_FUNCTION_10();
  v1 = OUTLINED_FUNCTION_5_4(v0);
  OUTLINED_FUNCTION_5_3(&dword_21ACD4000, v2, v3, "[%@]: remove listen type: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_1();
}

void __43__AXSDDetectorQueueManager_removeDetector___block_invoke_cold_2()
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

  OUTLINED_FUNCTION_17();
  v0 = (void *)OUTLINED_FUNCTION_10();
  v1 = OUTLINED_FUNCTION_5_4(v0);
  OUTLINED_FUNCTION_5_3(&dword_21ACD4000, v2, v3, "[%@]: remove detector: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_1();
}

void __48__AXSDDetectorQueueManager_removeAllListenTypes__block_invoke_cold_1()
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

  v0 = (void *)OUTLINED_FUNCTION_10();
  v1 = OUTLINED_FUNCTION_14(v0);
  OUTLINED_FUNCTION_0_4(&dword_21ACD4000, v2, v3, "[%@]: removing all listen types", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_1();
}

- (void)prepareToListen
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

  v0 = (void *)OUTLINED_FUNCTION_12();
  v1 = OUTLINED_FUNCTION_14(v0);
  OUTLINED_FUNCTION_0_4(&dword_21ACD4000, v2, v3, "[%@]: assets and detectors not ready, returning", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_1();
}

- (void)_queueListenType:.cold.1()
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
  OUTLINED_FUNCTION_5_3(&dword_21ACD4000, v2, v3, "[%@]: assets not ready! will queue request: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_1();
}

- (void)_dequeueListenType:.cold.1()
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
  OUTLINED_FUNCTION_5_3(&dword_21ACD4000, v2, v3, "[%@]: assets not ready! remove request: %@ from queue.", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_1();
}

- (void)detectorsReadyForDetectorStore:.cold.1()
{
  void **v0;
  void *v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  OUTLINED_FUNCTION_11();
  v1 = (void *)OUTLINED_FUNCTION_12();
  v2 = *v0;
  v3 = v1;
  objc_msgSend(v2, "count");
  OUTLINED_FUNCTION_5_3(&dword_21ACD4000, v4, v5, "[%@]: assets ready, adding %lu detectors that are queued.", v6, v7, v8, v9, 2u);

}

@end
