@implementation AXPRemoteCacheManager

+ (AXPRemoteCacheManager)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __39__AXPRemoteCacheManager_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_once != -1)
    dispatch_once(&sharedInstance_once, block);
  return (AXPRemoteCacheManager *)(id)sharedInstance__sharedInstance;
}

void __39__AXPRemoteCacheManager_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedInstance__sharedInstance;
  sharedInstance__sharedInstance = v0;

}

- (void)start
{
  void *v3;
  void *v4;
  void *v5;
  dispatch_queue_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  _QWORD v11[5];
  _QWORD v12[5];

  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXPRemoteCacheManager set_cachedTranslationsForLayoutChange:](self, "set_cachedTranslationsForLayoutChange:", v3);

  +[AXPTranslator sharedInstance](AXPTranslator, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRuntimeDelegate:", self);

  -[AXPRemoteCacheManager _axHierarchyGenerationQueue](self, "_axHierarchyGenerationQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v6 = dispatch_queue_create("com.apple.accessibility.AXPRemoteCacheManager.axHierarchyGeneration", 0);
    -[AXPRemoteCacheManager set_axHierarchyGenerationQueue:](self, "set_axHierarchyGenerationQueue:", v6);

  }
  -[AXPRemoteCacheManager transportDelegate](self, "transportDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x24BDAC760];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __30__AXPRemoteCacheManager_start__block_invoke;
  v12[3] = &unk_24E6AC0A0;
  v12[4] = self;
  objc_msgSend(v7, "accessibilityTranslationTransportAddReceiveDataHandler:", v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXPRemoteCacheManager set_transportChannel:](self, "set_transportChannel:", v9);

  -[AXPRemoteCacheManager _axHierarchyGenerationQueue](self, "_axHierarchyGenerationQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  v11[0] = v8;
  v11[1] = 3221225472;
  v11[2] = __30__AXPRemoteCacheManager_start__block_invoke_181;
  v11[3] = &unk_24E6ABDB0;
  v11[4] = self;
  dispatch_async(v10, v11);

}

void __30__AXPRemoteCacheManager_start__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  id v9;

  v3 = (void *)MEMORY[0x24BDD1620];
  v4 = a2;
  +[AXPTranslatorRequest allowedDecodableClasses](AXPTranslatorRequest, "allowedDecodableClasses");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  objc_msgSend(v3, "unarchivedObjectOfClasses:fromData:error:", v5, v4, &v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = v9;
  if (v7)
  {
    AXPlatformTranslationLogCommon();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __30__AXPRemoteCacheManager_start__block_invoke_cold_1();

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_processPlatformTranslationRequest:", v6);
  }

}

uint64_t __30__AXPRemoteCacheManager_start__block_invoke_181(uint64_t a1)
{
  void *v2;

  +[AXPTranslator sharedInstance](AXPTranslator, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAccessibilityEnabled:", 1);

  return objc_msgSend(*(id *)(a1 + 32), "_sendAXHierachy");
}

- (void)_elementVisualsUpdatedForNotification:(unint64_t)a3 data:(id)a4
{
  void *v6;
  void *v7;
  char v8;
  void *v9;
  char v10;
  BOOL v11;
  char v12;
  double v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a4;
  -[AXPRemoteCacheManager _layoutChangeCoalesceTimer](self, "_layoutChangeCoalesceTimer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[AXPRemoteCacheManager _layoutChangeCoalesceTimer](self, "_layoutChangeCoalesceTimer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isValid");

    v9 = v17;
    if (!v17)
    {
      v13 = 0.75;
      if ((v8 & 1) != 0)
        goto LABEL_20;
      goto LABEL_19;
    }
    v10 = v8 ^ 1;
  }
  else
  {

    v9 = v17;
    if (!v17)
    {
      v13 = 0.75;
      goto LABEL_19;
    }
    v10 = 1;
  }
  if (a3 == 4)
  {
    v14 = -[AXPRemoteCacheManager _notificationData:containsToken:](self, "_notificationData:containsToken:");
    v12 = v14 | v10;
    if (v14)
      goto LABEL_9;
    goto LABEL_13;
  }
  if (a3 == 5)
  {
    v11 = -[AXPRemoteCacheManager _notificationData:containsToken:](self, "_notificationData:containsToken:");
    v12 = v11 | v10;
    if (v11)
    {
LABEL_9:
      v13 = 0.5;
      goto LABEL_14;
    }
LABEL_13:
    v13 = 0.75;
LABEL_14:
    v9 = v17;
    if ((v12 & 1) == 0)
      goto LABEL_20;
    goto LABEL_19;
  }
  v13 = 0.75;
  if ((v10 & 1) == 0)
    goto LABEL_20;
LABEL_19:
  -[AXPRemoteCacheManager _layoutChangeCoalesceTimer](self, "_layoutChangeCoalesceTimer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "invalidate");

  -[AXPRemoteCacheManager set_layoutChangeCoalesceTimer:](self, "set_layoutChangeCoalesceTimer:", 0);
  objc_msgSend(MEMORY[0x24BDBCF40], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__timerDidFire_, 0, 0, v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXPRemoteCacheManager set_layoutChangeCoalesceTimer:](self, "set_layoutChangeCoalesceTimer:", v16);

  v9 = v17;
LABEL_20:

}

- (BOOL)_notificationData:(id)a3 containsToken:(id)a4
{
  id v5;
  id v6;
  char v7;
  void *v8;
  char v9;

  v5 = a3;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = objc_msgSend(v5, "containsObject:", v6);
LABEL_6:
    v9 = v7;
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v7 = objc_msgSend(v5, "isEqual:", v6);
    goto LABEL_6;
  }
  objc_msgSend(v5, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "containsObject:", v6);

LABEL_7:
  return v9;
}

- (void)_timerDidFire:(id)a3
{
  NSObject *v4;
  void *v5;
  _QWORD block[5];

  -[AXPRemoteCacheManager _axHierarchyGenerationQueue](self, "_axHierarchyGenerationQueue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __39__AXPRemoteCacheManager__timerDidFire___block_invoke;
  block[3] = &unk_24E6ABDB0;
  block[4] = self;
  dispatch_async(v4, block);

  -[AXPRemoteCacheManager _layoutChangeCoalesceTimer](self, "_layoutChangeCoalesceTimer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "invalidate");

  -[AXPRemoteCacheManager set_layoutChangeCoalesceTimer:](self, "set_layoutChangeCoalesceTimer:", 0);
}

uint64_t __39__AXPRemoteCacheManager__timerDidFire___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sendAXHierachy");
}

- (void)_sendAXHierachy
{
  NSObject *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  int v16;
  NSObject *v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  _QWORD v24[5];
  id v25;
  _QWORD block[5];
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t v32[128];
  uint8_t buf[4];
  const char *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  -[AXPRemoteCacheManager _axHierarchyGenerationQueue](self, "_axHierarchyGenerationQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  AXPlatformTranslationLogCommon();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v34 = "-[AXPRemoteCacheManager _sendAXHierachy]";
    _os_log_impl(&dword_220DB6000, v4, OS_LOG_TYPE_INFO, "%s: starting to generate initial hierarchy", buf, 0xCu);
  }

  +[AXPTranslator sharedInstance](AXPTranslator, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "generateInitialAXTreeDump");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  AXPlatformTranslationLogCommon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v34 = "-[AXPRemoteCacheManager _sendAXHierachy]";
    _os_log_impl(&dword_220DB6000, v7, OS_LOG_TYPE_INFO, "%s: finished generating initial hierarchy", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  objc_msgSend(v6, "treeDumpResponse");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v29;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v29 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * v13), "associatedTranslationObject");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
          objc_msgSend(v8, "addObject:", v14);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v11);
  }

  -[AXPRemoteCacheManager _cachedTranslationsForLayoutChange](self, "_cachedTranslationsForLayoutChange");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v8, "isEqualToSet:", v15);

  if (v16)
  {
    AXPlatformTranslationLogCommon();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v34 = "-[AXPRemoteCacheManager _sendAXHierachy]";
      _os_log_impl(&dword_220DB6000, v17, OS_LOG_TYPE_INFO, "%s: skipping hierarchy dump because elements did not change", buf, 0xCu);
    }

  }
  else
  {
    -[AXPRemoteCacheManager set_cachedTranslationsForLayoutChange:](self, "set_cachedTranslationsForLayoutChange:", v8);
    v18 = MEMORY[0x24BDAC760];
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __40__AXPRemoteCacheManager__sendAXHierachy__block_invoke;
    block[3] = &unk_24E6AC0C8;
    block[4] = self;
    v27 = v6;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
    AXPlatformTranslationLogCommon();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v34 = "-[AXPRemoteCacheManager _sendAXHierachy]";
      _os_log_impl(&dword_220DB6000, v19, OS_LOG_TYPE_INFO, "%s: generating additional tree dump", buf, 0xCu);
    }

    +[AXPTranslator sharedInstance](AXPTranslator, "sharedInstance");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "generateAdditionalAXTreeDump");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v24[0] = v18;
    v24[1] = 3221225472;
    v24[2] = __40__AXPRemoteCacheManager__sendAXHierachy__block_invoke_185;
    v24[3] = &unk_24E6AC0C8;
    v24[4] = self;
    v25 = v21;
    v22 = v21;
    v23 = (void *)MEMORY[0x24BDAC9B8];
    dispatch_async(MEMORY[0x24BDAC9B8], v24);

  }
}

uint64_t __40__AXPRemoteCacheManager__sendAXHierachy__block_invoke(uint64_t a1)
{
  NSObject *v2;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  AXPlatformTranslationLogCommon();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v4 = 136315138;
    v5 = "-[AXPRemoteCacheManager _sendAXHierachy]_block_invoke";
    _os_log_impl(&dword_220DB6000, v2, OS_LOG_TYPE_INFO, "%s: sending initial tree dump", (uint8_t *)&v4, 0xCu);
  }

  return objc_msgSend(*(id *)(a1 + 32), "handleUpdatedAXTree:", *(_QWORD *)(a1 + 40));
}

uint64_t __40__AXPRemoteCacheManager__sendAXHierachy__block_invoke_185(uint64_t a1)
{
  NSObject *v2;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  AXPlatformTranslationLogCommon();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v4 = 136315138;
    v5 = "-[AXPRemoteCacheManager _sendAXHierachy]_block_invoke";
    _os_log_impl(&dword_220DB6000, v2, OS_LOG_TYPE_INFO, "%s: sending additional tree dump", (uint8_t *)&v4, 0xCu);
  }

  return objc_msgSend(*(id *)(a1 + 32), "handleUpdatedAXTree:", *(_QWORD *)(a1 + 40));
}

- (void)_processPlatformTranslationRequest:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  +[AXPTranslator sharedInstance](AXPTranslator, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "processTranslatorRequest:", v4);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[AXPRemoteCacheManager _attemptToSendResponse:](self, "_attemptToSendResponse:", v6);
}

- (void)_attemptToSendResponse:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v4 = a3;
  v13 = 0;
  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v4, 1, &v13);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v13;
  if (v6)
  {
    AXPlatformTranslationLogCommon();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[AXPRemoteCacheManager _attemptToSendResponse:].cold.2();

  }
  else
  {
    v8 = objc_msgSend(v5, "length");
    AXPlatformTranslationLogCommon();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[AXPRemoteCacheManager _attemptToSendResponse:].cold.1(v8, v9);

    -[AXPRemoteCacheManager transportDelegate](self, "transportDelegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __48__AXPRemoteCacheManager__attemptToSendResponse___block_invoke;
    v11[3] = &unk_24E6AC0F0;
    v11[4] = self;
    v12 = v4;
    objc_msgSend(v10, "accessibilityTranslationTransportSendData:completionHandler:", v5, v11);

  }
}

uint64_t __48__AXPRemoteCacheManager__attemptToSendResponse___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_responseSent:withError:", *(_QWORD *)(a1 + 40), a2);
}

- (void)_responseSent:(id)a3 withError:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  NSObject *v9;
  _BOOL4 v10;

  v6 = a3;
  v7 = a4;
  if (!v7)
  {
LABEL_9:
    -[AXPRemoteCacheManager setFailedSendAttempts:](self, "setFailedSendAttempts:", 0);
    goto LABEL_10;
  }
  v8 = -[AXPRemoteCacheManager failedSendAttempts](self, "failedSendAttempts");
  AXPlatformTranslationLogCommon();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
  if (v8 > 4)
  {
    if (v10)
      -[AXPRemoteCacheManager _responseSent:withError:].cold.2(self, (uint64_t)v7, v9);

    goto LABEL_9;
  }
  if (v10)
    -[AXPRemoteCacheManager _responseSent:withError:].cold.1();

  -[AXPRemoteCacheManager setFailedSendAttempts:](self, "setFailedSendAttempts:", -[AXPRemoteCacheManager failedSendAttempts](self, "failedSendAttempts") + 1);
  -[AXPRemoteCacheManager _attemptToSendResponse:](self, "_attemptToSendResponse:", v6);
LABEL_10:

}

- (void)handleNotification:(unint64_t)a3 data:(id)a4 associatedObject:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  int v13;
  unint64_t v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = a5;
  if (a3 <= 0xF && ((1 << a3) & 0x9530) != 0)
  {
    -[AXPRemoteCacheManager _elementVisualsUpdatedForNotification:data:](self, "_elementVisualsUpdatedForNotification:data:", a3, v8);
  }
  else
  {
    AXPlatformTranslationLogCommon();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[AXPRemoteCacheManager handleNotification:data:associatedObject:].cold.1((uint64_t)v8, a3, v10);

    AXPlatformTranslationLogCommon();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v13 = 134218242;
      v14 = a3;
      v15 = 2112;
      v16 = v8;
      _os_log_impl(&dword_220DB6000, v11, OS_LOG_TYPE_INFO, "handleNotification: sending notification: %lu, Data: %@", (uint8_t *)&v13, 0x16u);
    }

    v12 = (void *)objc_opt_new();
    objc_msgSend(v12, "setNotification:", a3);
    objc_msgSend(v12, "setAssociatedNotificationObject:", v9);
    objc_msgSend(v12, "setResultData:", v8);
    -[AXPRemoteCacheManager _attemptToSendResponse:](self, "_attemptToSendResponse:", v12);

  }
}

- (AXPTranslationTransportDelegate)transportDelegate
{
  return (AXPTranslationTransportDelegate *)objc_loadWeakRetained((id *)&self->_transportDelegate);
}

- (void)setTransportDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_transportDelegate, a3);
}

- (AXPTranslationTransportCancellable)_transportChannel
{
  return self->__transportChannel;
}

- (void)set_transportChannel:(id)a3
{
  objc_storeStrong((id *)&self->__transportChannel, a3);
}

- (NSMutableSet)_cachedTranslationsForLayoutChange
{
  return self->__cachedTranslationsForLayoutChange;
}

- (void)set_cachedTranslationsForLayoutChange:(id)a3
{
  objc_storeStrong((id *)&self->__cachedTranslationsForLayoutChange, a3);
}

- (NSTimer)_layoutChangeCoalesceTimer
{
  return self->__layoutChangeCoalesceTimer;
}

- (void)set_layoutChangeCoalesceTimer:(id)a3
{
  objc_storeStrong((id *)&self->__layoutChangeCoalesceTimer, a3);
}

- (unint64_t)failedSendAttempts
{
  return self->_failedSendAttempts;
}

- (void)setFailedSendAttempts:(unint64_t)a3
{
  self->_failedSendAttempts = a3;
}

- (OS_dispatch_queue)_axHierarchyGenerationQueue
{
  return self->__axHierarchyGenerationQueue;
}

- (void)set_axHierarchyGenerationQueue:(id)a3
{
  objc_storeStrong((id *)&self->__axHierarchyGenerationQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__axHierarchyGenerationQueue, 0);
  objc_storeStrong((id *)&self->__layoutChangeCoalesceTimer, 0);
  objc_storeStrong((id *)&self->__cachedTranslationsForLayoutChange, 0);
  objc_storeStrong((id *)&self->__transportChannel, 0);
  objc_destroyWeak((id *)&self->_transportDelegate);
}

void __30__AXPRemoteCacheManager_start__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_220DB6000, v0, v1, "Error decoding data as AXPTranslatorRequest! %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_attemptToSendResponse:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  float v2;
  int v3;
  double v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2 = (double)a1 * 0.0009765625;
  v3 = 134217984;
  v4 = v2;
  _os_log_debug_impl(&dword_220DB6000, a2, OS_LOG_TYPE_DEBUG, "Response: %f Kbytes", (uint8_t *)&v3, 0xCu);
  OUTLINED_FUNCTION_1();
}

- (void)_attemptToSendResponse:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_220DB6000, v0, v1, "Failed to archive response error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_responseSent:withError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_220DB6000, v0, v1, "Failed to send message, retrying. Error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_responseSent:(NSObject *)a3 withError:.cold.2(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v5;
  uint8_t v6[12];
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "failedSendAttempts");
  OUTLINED_FUNCTION_2();
  v7 = 2112;
  v8 = a2;
  OUTLINED_FUNCTION_3(&dword_220DB6000, a3, v5, "Failed to send data after %lu attemps, error: %@", v6);
}

- (void)handleNotification:(uint64_t)a1 data:(uint64_t)a2 associatedObject:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 134218242;
  v4 = a2;
  v5 = 2112;
  v6 = a1;
  OUTLINED_FUNCTION_3(&dword_220DB6000, a3, (uint64_t)a3, "Unhandled notification received: %lu. Data: %@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

@end
