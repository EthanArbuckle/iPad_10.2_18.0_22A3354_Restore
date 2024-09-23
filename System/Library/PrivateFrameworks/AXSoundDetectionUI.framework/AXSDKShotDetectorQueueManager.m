@implementation AXSDKShotDetectorQueueManager

- (AXSDKShotDetectorQueueManager)init
{
  AXSDKShotDetectorQueueManager *v2;
  AXSDKShotDetectorQueueManager *v3;
  NSMutableSet *v4;
  NSMutableSet *detectorQueue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AXSDKShotDetectorQueueManager;
  v2 = -[AXSDDetectorQueueManager init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_ready = 0;
    v4 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    detectorQueue = v3->_detectorQueue;
    v3->_detectorQueue = v4;

    v3->_queueGeneralDetector = 0;
  }
  return v3;
}

- (void)addGeneralApplianceDetector
{
  NSObject *v3;
  NSObject *v4;
  _QWORD block[5];
  uint8_t buf[16];

  AXLogUltronKShot();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21ACD4000, v3, OS_LOG_TYPE_DEFAULT, "Detector Queue manager: Add General Appliance Detector", buf, 2u);
  }

  if (self->_ready)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __60__AXSDKShotDetectorQueueManager_addGeneralApplianceDetector__block_invoke;
    block[3] = &unk_24DDF6AE0;
    block[4] = self;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }
  else
  {
    AXLogUltronKShot();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21ACD4000, v4, OS_LOG_TYPE_DEFAULT, "Controller: Queue general detector", buf, 2u);
    }

    self->_queueGeneralDetector = 1;
  }
}

void __60__AXSDKShotDetectorQueueManager_addGeneralApplianceDetector__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  char v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint8_t v14[16];

  AXLogUltronKShot();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v14 = 0;
    _os_log_impl(&dword_21ACD4000, v2, OS_LOG_TYPE_DEFAULT, "Controller: add general detector", v14, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "detectorManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "addGeneralApplianceDetector");

  if ((v5 & 1) == 0)
  {
    AXLogUltronKShot();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __60__AXSDKShotDetectorQueueManager_addGeneralApplianceDetector__block_invoke_cold_1(v6, v7, v8, v9, v10, v11, v12, v13);

  }
}

- (void)removeGeneralApplianceDetector
{
  NSObject *v3;
  NSObject *v4;
  _QWORD block[5];
  uint8_t buf[16];

  AXLogUltronKShot();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21ACD4000, v3, OS_LOG_TYPE_DEFAULT, "Detector Queue manager: Remove General Appliance Detector", buf, 2u);
  }

  if (self->_ready)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __63__AXSDKShotDetectorQueueManager_removeGeneralApplianceDetector__block_invoke;
    block[3] = &unk_24DDF6AE0;
    block[4] = self;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }
  else
  {
    AXLogUltronKShot();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21ACD4000, v4, OS_LOG_TYPE_DEFAULT, "Controller: Dequeue general detector", buf, 2u);
    }

    self->_queueGeneralDetector = 0;
  }
}

void __63__AXSDKShotDetectorQueueManager_removeGeneralApplianceDetector__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  char v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint8_t v14[16];

  AXLogUltronKShot();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v14 = 0;
    _os_log_impl(&dword_21ACD4000, v2, OS_LOG_TYPE_DEFAULT, "Controller: remove general detector", v14, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "detectorManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "removeGeneralApplianceDetector");

  if ((v5 & 1) == 0)
  {
    AXLogUltronKShot();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __63__AXSDKShotDetectorQueueManager_removeGeneralApplianceDetector__block_invoke_cold_1(v6, v7, v8, v9, v10, v11, v12, v13);

  }
}

- (BOOL)currentGeneralDetectorIsValid
{
  void *v2;
  void *v3;
  void *v4;
  BOOL v5;

  -[AXSDDetectorQueueManager delegate](self, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "detectorManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentGeneralApplianceRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 != 0;

  return v5;
}

- (void)assetsReadyForUltronManager:(id)a3
{
  NSObject *v4;
  _QWORD block[5];
  uint8_t buf[16];

  self->_ready = 1;
  AXLogUltron();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21ACD4000, v4, OS_LOG_TYPE_DEFAULT, "KShot Controller Received: assetsReadyForUltronManager", buf, 2u);
  }

  if (self->_queueGeneralDetector)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __61__AXSDKShotDetectorQueueManager_assetsReadyForUltronManager___block_invoke;
    block[3] = &unk_24DDF6AE0;
    block[4] = self;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }
}

void __61__AXSDKShotDetectorQueueManager_assetsReadyForUltronManager___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  char v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "detectorManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "addGeneralApplianceDetector");

  if ((v4 & 1) == 0)
  {
    AXLogUltron();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __61__AXSDKShotDetectorQueueManager_assetsReadyForUltronManager___block_invoke_cold_1(v5, v6, v7, v8, v9, v10, v11, v12);

  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 41) = 0;
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "assetsReadyAndDetectorsAdded");

}

- (void)assetsNotReadyForUltronManager:(id)a3
{
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  NSObject *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t buf[4];
  uint64_t v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  self->_ready = 0;
  AXLogUltron();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21ACD4000, v4, OS_LOG_TYPE_DEFAULT, "Controller: Assets are not ready will add current detectors to queue.", buf, 2u);
  }

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[AXSDDetectorQueueManager currentDetectionTypes](self, "currentDetectionTypes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
        AXLogUltron();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v17 = v10;
          _os_log_impl(&dword_21ACD4000, v11, OS_LOG_TYPE_DEFAULT, "Controller: Adding %@ to queue.", buf, 0xCu);
        }

        -[AXSDDetectorQueueManager addListenType:](self, "addListenType:", v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v18, 16);
    }
    while (v7);
  }

  -[AXSDDetectorQueueManager removeAllListenTypes](self, "removeAllListenTypes");
  if (-[AXSDKShotDetectorQueueManager currentGeneralDetectorIsValid](self, "currentGeneralDetectorIsValid"))
    self->_queueGeneralDetector = 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detectorQueue, 0);
}

void __60__AXSDKShotDetectorQueueManager_addGeneralApplianceDetector__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_1(&dword_21ACD4000, a1, a3, "Unable to add General Appliance Detector to the Controller", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

void __63__AXSDKShotDetectorQueueManager_removeGeneralApplianceDetector__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_1(&dword_21ACD4000, a1, a3, "Unable to remove General Appliance Detector from the Controller", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

void __61__AXSDKShotDetectorQueueManager_assetsReadyForUltronManager___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_1(&dword_21ACD4000, a1, a3, "Unable to add General appliance detector to the Controller", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

@end
