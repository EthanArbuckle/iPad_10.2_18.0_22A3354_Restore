@implementation AXUIServiceManager

+ (id)sharedServiceManager
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __42__AXUIServiceManager_sharedServiceManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedServiceManager__AXUIServiceManagerSharedInstanceOnceToken != -1)
    dispatch_once(&sharedServiceManager__AXUIServiceManagerSharedInstanceOnceToken, block);
  return (id)_AXUIServiceManagerSharedInstance;
}

void __42__AXUIServiceManager_sharedServiceManager__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)_AXUIServiceManagerSharedInstance;
  _AXUIServiceManagerSharedInstance = v0;

}

+ (void)_releaseSharedServiceManager
{
  void *v2;

  v2 = (void *)_AXUIServiceManagerSharedInstance;
  _AXUIServiceManagerSharedInstance = 0;

}

- (AXUIServiceManager)init
{
  AXUIServiceManager *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  BOOL v10;
  BOOL v12;
  AXUIDisplayManager *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  dispatch_queue_t v18;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)AXUIServiceManager;
  v2 = -[AXUIServiceManager init](&v20, sel_init);
  v3 = (void *)MEMORY[0x2199F262C]();
  if (v2)
  {
    v4 = objc_opt_class();
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDFE478]), "initWithParentClass:description:appendUUIDToLabel:", v4, CFSTR("ServicesAccessQueue"), 0);
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDFE478]), "initWithParentClass:description:appendUUIDToLabel:", v4, CFSTR("EntitlementsCheckersAccessQueue"), 0);
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDFE478]), "initWithParentClass:description:appendUUIDToLabel:", v4, CFSTR("ResumingConnectionsQueue"), 0);
    v8 = objc_opt_new();
    v9 = (void *)v8;
    if (v5)
      v10 = v6 == 0;
    else
      v10 = 1;
    v12 = v10 || v7 == 0 || v8 == 0;
    if (v12
      || (v13 = -[AXUIDisplayManager initWithServiceManager:]([AXUIDisplayManager alloc], "initWithServiceManager:", v2)) == 0)
    {
      v14 = v2;
      v2 = 0;
    }
    else
    {
      v14 = v13;
      objc_msgSend(v9, "setDelegate:", v2);
      -[AXUIServiceManager setServicesAccessQueue:](v2, "setServicesAccessQueue:", v5);
      -[AXUIServiceManager setEntitlementsCheckersAccessQueue:](v2, "setEntitlementsCheckersAccessQueue:", v6);
      -[AXUIServiceManager setResumingConnectionsQueue:](v2, "setResumingConnectionsQueue:", v7);
      -[AXUIServiceManager setMessageSender:](v2, "setMessageSender:", v9);
      -[AXUIServiceManager setDisplayManager:](v2, "setDisplayManager:", v14);
      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "addObserver:selector:name:object:", v2, sel__applicationDidReceiveMemoryWarning_, *MEMORY[0x24BDF7538], 0);

      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXUIServiceManager setTransactions:](v2, "setTransactions:", v16);

      dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = dispatch_queue_create("AXUIServiceManager-transactions", v17);
      -[AXUIServiceManager setTransactionsQueue:](v2, "setTransactionsQueue:", v18);

    }
  }
  objc_autoreleasePoolPop(v3);
  return v2;
}

- (void)dealloc
{
  BSServiceConnectionListener *connectionListener;
  BSServiceConnectionListener *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  connectionListener = self->_connectionListener;
  if (connectionListener)
  {
    -[BSServiceConnectionListener invalidate](connectionListener, "invalidate");
    v4 = self->_connectionListener;
    self->_connectionListener = 0;

  }
  objc_msgSend(MEMORY[0x24BE005C8], "server");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registerAccessibilityUIServicePID:", 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObserver:name:object:", self, *MEMORY[0x24BDF7538], 0);

  -[AXUIServiceManager displayManager](self, "displayManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_resetServiceManager");

  v8.receiver = self;
  v8.super_class = (Class)AXUIServiceManager;
  -[AXUIServiceManager dealloc](&v8, sel_dealloc);
}

- (void)beginTransactionWithIdentifier:(id)a3 forService:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  NSObject *v11;
  os_log_type_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  NSObject *v17;
  id v18;
  id v19;
  _QWORD block[5];
  id v21;
  id v22;
  uint8_t buf[4];
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BDFE4D8], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "ignoreLogging");

  if ((v9 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDFE4D8], "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    AXLoggerForFacility();
    v11 = objc_claimAutoreleasedReturnValue();

    v12 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v11, v12))
    {
      AXColorizeFormatLog();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      _AXStringForArgs();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, v12))
      {
        *(_DWORD *)buf = 138543362;
        v24 = v14;
        _os_log_impl(&dword_215E2A000, v11, v12, "%{public}@", buf, 0xCu);
      }

    }
  }
  v15 = objc_retainAutorelease(v6);
  objc_msgSend(v15, "UTF8String");
  v16 = (void *)os_transaction_create();
  -[AXUIServiceManager transactionsQueue](self, "transactionsQueue");
  v17 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __64__AXUIServiceManager_beginTransactionWithIdentifier_forService___block_invoke;
  block[3] = &unk_24D49CB50;
  block[4] = self;
  v21 = v15;
  v22 = v16;
  v18 = v16;
  v19 = v15;
  dispatch_async(v17, block);

}

void __64__AXUIServiceManager_beginTransactionWithIdentifier_forService___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "transactions");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v2, *(_QWORD *)(a1 + 40));

}

- (void)endTransactionWithIdentifier:(id)a3 forService:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  NSObject *v11;
  os_log_type_t v12;
  void *v13;
  void *v14;
  NSObject *v15;
  id v16;
  id v17;
  id v18;
  _QWORD block[5];
  id v20;
  uint8_t buf[4];
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BDFE4D8], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "ignoreLogging");

  if ((v9 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDFE4D8], "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    AXLoggerForFacility();
    v11 = objc_claimAutoreleasedReturnValue();

    v12 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v11, v12))
    {
      AXColorizeFormatLog();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v6;
      v18 = v7;
      _AXStringForArgs();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, v12))
      {
        *(_DWORD *)buf = 138543362;
        v22 = v14;
        _os_log_impl(&dword_215E2A000, v11, v12, "%{public}@", buf, 0xCu);
      }

    }
  }
  -[AXUIServiceManager transactionsQueue](self, "transactionsQueue", v17, v18);
  v15 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __62__AXUIServiceManager_endTransactionWithIdentifier_forService___block_invoke;
  block[3] = &unk_24D49CA48;
  block[4] = self;
  v20 = v6;
  v16 = v6;
  dispatch_async(v15, block);

}

void __62__AXUIServiceManager_endTransactionWithIdentifier_forService___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "transactions");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", 0, *(_QWORD *)(a1 + 40));

}

- (id)clientsForService:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v12[5];
  id v13;
  id v14;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  -[AXUIServiceManager servicesAccessQueue](self, "servicesAccessQueue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __40__AXUIServiceManager_clientsForService___block_invoke;
  v12[3] = &unk_24D49CB50;
  v12[4] = self;
  v13 = v4;
  v7 = v5;
  v14 = v7;
  v8 = v4;
  objc_msgSend(v6, "performSynchronousReadingBlock:", v12);

  v9 = v14;
  v10 = v7;

  return v10;
}

void __40__AXUIServiceManager_clientsForService___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "serviceContexts");
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v13 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(v7, "service", (_QWORD)v12);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = *(void **)(a1 + 40);

        if (v8 == v9)
        {
          v10 = *(void **)(a1 + 48);
          objc_msgSend(v7, "clientMessengerList");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "axSafelyAddObjectsFromArray:", v11);

          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

}

- (id)_clientMessengerWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__0;
  v16 = __Block_byref_object_dispose__0;
  v17 = 0;
  -[AXUIServiceManager servicesAccessQueue](self, "servicesAccessQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __53__AXUIServiceManager__clientMessengerWithIdentifier___block_invoke;
  v9[3] = &unk_24D49CE30;
  v9[4] = self;
  v11 = &v12;
  v6 = v4;
  v10 = v6;
  objc_msgSend(v5, "performSynchronousReadingBlock:", v9);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __53__AXUIServiceManager__clientMessengerWithIdentifier___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "serviceContexts");
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
LABEL_3:
    v6 = 0;
    while (1)
    {
      if (*(_QWORD *)v11 != v5)
        objc_enumerationMutation(v2);
      objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v6), "clientMessengerWithIdentifier:", *(_QWORD *)(a1 + 40), (_QWORD)v10);
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v9 = *(void **)(v8 + 40);
      *(_QWORD *)(v8 + 40) = v7;

      if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
        break;
      if (v4 == ++v6)
      {
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
        if (v4)
          goto LABEL_3;
        break;
      }
    }
  }

}

- (void)_sendAsynchronousMessage:(id)a3 withIdentifier:(unint64_t)a4 toClientWithMessenger:(id)a5 targetAccessQueue:(id)a6 completionRequiresWritingBlock:(BOOL)a7 completion:(id)a8
{
  _BOOL8 v9;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  NSObject *v19;
  id v20;
  void *v21;
  uint64_t v22;
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  _BYTE *v27;
  _BYTE buf[24];
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint64_t v32;

  v9 = a7;
  v32 = *MEMORY[0x24BDAC8D0];
  v24 = a3;
  v14 = a5;
  v15 = a6;
  v16 = a8;
  v17 = v15;
  v18 = v17;
  if (!v17)
  {
    if (v16)
    {
      AXLogUI();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v14;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = a4;
        _os_log_impl(&dword_215E2A000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@ sending asynchronous message with identifier %lu and a completion handler but no target access queue; defaulting to the main access queue.",
          buf,
          0x16u);
      }

    }
    objc_msgSend(MEMORY[0x24BDFE478], "mainAccessQueue");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v29 = __Block_byref_object_copy__0;
  v30 = __Block_byref_object_dispose__0;
  v20 = v14;
  v31 = v20;
  -[AXUIServiceManager messageSender](self, "messageSender");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __144__AXUIServiceManager__sendAsynchronousMessage_withIdentifier_toClientWithMessenger_targetAccessQueue_completionRequiresWritingBlock_completion___block_invoke;
  v25[3] = &unk_24D49CE58;
  v23 = v16;
  v26 = v23;
  v27 = buf;
  objc_msgSend(v21, "sendAsynchronousMessage:withIdentifier:context:targetAccessQueue:completionRequiresWritingBlock:completion:", v24, a4, v22, v18, v9, v25);

  _Block_object_dispose(buf, 8);
}

void __144__AXUIServiceManager__sendAsynchronousMessage_withIdentifier_toClientWithMessenger_targetAccessQueue_completionRequiresWritingBlock_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = 0;

}

- (id)_sendSynchronousMessage:(id)a3 withIdentifier:(unint64_t)a4 toClientWithMessenger:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;

  v10 = a5;
  v11 = a3;
  -[AXUIServiceManager messageSender](self, "messageSender");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "sendSynchronousMessage:withIdentifier:context:error:", v11, a4, v10, a6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void)messageSender:(id)a3 accessLaunchAngelConnectionForMessageWithContext:(void *)a4 usingBlock:(id)a5
{
  void (**v6)(id, id);
  void *v7;
  void *v8;
  id v9;

  v6 = (void (**)(id, id))a5;
  objc_msgSend(a4, "connection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "serviceConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "remoteTarget");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  v6[2](v6, v9);
}

- (void)messageSender:(id)a3 willSendXPCMessage:(id)a4 context:(void *)a5
{
  const char *v6;
  id v7;
  id v8;

  v6 = (const char *)*MEMORY[0x24BDFF970];
  v7 = a4;
  objc_msgSend(a5, "clientIdentifier");
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  xpc_dictionary_set_string(v7, v6, (const char *)objc_msgSend(v8, "UTF8String"));

}

- (BOOL)_start
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  NSObject *v11;
  __CFNotificationCenter *LocalCenter;
  uint8_t v13[8];
  _QWORD v14[4];
  id v15;

  v3 = (void *)MEMORY[0x2199F262C](self, a2);
  UIAccessibilityInstallSafeCategory();
  AXUISetMainBundleFakesSystemExtension(1);
  dispatch_async(MEMORY[0x24BDAC9B8], &__block_literal_global_1);
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localeIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x24BDBCA70];
  objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __28__AXUIServiceManager__start__block_invoke_2;
  v14[3] = &unk_24D49CEA0;
  v9 = v5;
  v15 = v9;
  v10 = (id)objc_msgSend(v6, "addObserverForName:object:queue:usingBlock:", v7, 0, v8, v14);

  if (AXInPreboardScenario())
  {
    AXLogUI();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_215E2A000, v11, OS_LOG_TYPE_DEFAULT, "AXUI Server started at PreBoard. This is unexpected, but we'll restart once we're done.", v13, 2u);
    }

    LocalCenter = CFNotificationCenterGetLocalCenter();
    CFNotificationCenterAddObserver(LocalCenter, self, (CFNotificationCallback)_preboardScenarioChanged, (CFStringRef)*MEMORY[0x24BE00160], 0, CFNotificationSuspensionBehaviorCoalesce);
  }

  objc_autoreleasePoolPop(v3);
  xpc_main((xpc_connection_handler_t)_AXUIServiceManagerHandleConnection);
}

uint64_t __28__AXUIServiceManager__start__block_invoke()
{
  return UIAccessibilityInstallSafeCategory();
}

void __28__AXUIServiceManager__start__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v11 = a2;
  v3 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localeIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v3, "isEqualToString:", v5);

  if ((v3 & 1) == 0)
  {
    v6 = a1;
    AXLogUI();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(v6 + 32);
      objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "localeIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v13 = v8;
      v14 = 2112;
      v15 = v10;
      _os_log_impl(&dword_215E2A000, v7, OS_LOG_TYPE_DEFAULT, "Current locale did change. Restarting AXUI Server %@ %@", buf, 0x16u);

    }
    exit(0);
  }

}

- (void)_startLaunchAngel
{
  void *v3;
  BSServiceConnectionListener *connectionListener;
  _QWORD v5[5];

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __39__AXUIServiceManager__startLaunchAngel__block_invoke;
  v5[3] = &unk_24D49CEC8;
  v5[4] = self;
  objc_msgSend(MEMORY[0x24BE0FA28], "listenerWithConfigurator:", v5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activate");
  connectionListener = self->_connectionListener;
  self->_connectionListener = (BSServiceConnectionListener *)v3;

}

void __39__AXUIServiceManager__startLaunchAngel__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "setDomain:", CFSTR("com.apple.accessibility"));
  objc_msgSend(v3, "setService:", CFSTR("com.apple.AccessibilityUIServer"));
  objc_msgSend(v3, "setDelegate:", *(_QWORD *)(a1 + 32));

}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  AXUIServiceManager *v11;

  v6 = a4;
  AXUIServiceManagerLaunchAngelInterface();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __64__AXUIServiceManager_listener_didReceiveConnection_withContext___block_invoke;
  v9[3] = &unk_24D49CF18;
  v10 = v7;
  v11 = self;
  v8 = v7;
  objc_msgSend(v6, "configureConnection:", v9);
  objc_msgSend(v6, "activate");

}

void __64__AXUIServiceManager_listener_didReceiveConnection_withContext___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _QWORD v5[5];

  v3 = a2;
  objc_msgSend(v3, "setTargetQueue:", MEMORY[0x24BDAC9B8]);
  objc_msgSend(MEMORY[0x24BE0FA38], "userInitiated");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setServiceQuality:", v4);

  objc_msgSend(v3, "setInterface:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v3, "setInterfaceTarget:", *(_QWORD *)(a1 + 40));
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __64__AXUIServiceManager_listener_didReceiveConnection_withContext___block_invoke_2;
  v5[3] = &unk_24D49CEF0;
  v5[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v3, "setInvalidationHandler:", v5);

}

void __64__AXUIServiceManager_listener_didReceiveConnection_withContext___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v3, "remoteProcess");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setProcessHandle:", v5);

  objc_msgSend(v4, "setServiceConnection:", v3);
  AXLogIPC();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v3;
    _os_log_impl(&dword_215E2A000, v6, OS_LOG_TYPE_DEFAULT, "Invalidation handler from connection: %@", (uint8_t *)&v7, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "_unregisterAllClientsWithConnection:", v4);
}

- (void)sendBoardServiceMessage:(id)a3 callback:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v6 = a4;
  v7 = a3;
  v11 = (id)objc_opt_new();
  objc_msgSend(v11, "setXpc_handler:", v6);

  objc_msgSend(MEMORY[0x24BE0FA00], "currentContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "remoteProcess");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setProcessHandle:", v9);

  objc_msgSend(MEMORY[0x24BE0FA00], "currentContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setServiceConnection:", v10);

  -[AXUIServiceManager _processXPCObject:context:](self, "_processXPCObject:context:", v7, v11);
}

- (void)_handleConnection:(id)a3
{
  _xpc_connection_s *v4;
  id v5;
  uint64_t v6;
  objc_class *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  _xpc_connection_s *v16;
  _QWORD v17[5];
  _xpc_connection_s *v18;
  _QWORD handler[4];
  id v20;
  id v21;
  id from;
  id location;

  v4 = (_xpc_connection_s *)a3;
  v5 = objc_alloc(MEMORY[0x24BDD17C8]);
  v6 = *MEMORY[0x24BDFF998];
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "UUIDString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v5, "initWithFormat:", CFSTR("%@.%@.%@-%p"), v6, v8, v10, v4);

  v12 = objc_retainAutorelease(v11);
  v13 = dispatch_queue_create((const char *)objc_msgSend(v12, "UTF8String"), 0);
  xpc_connection_set_target_queue(v4, v13);
  objc_initWeak(&location, v4);
  objc_initWeak(&from, self);
  v14 = MEMORY[0x24BDAC760];
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __40__AXUIServiceManager__handleConnection___block_invoke;
  handler[3] = &unk_24D49CF40;
  objc_copyWeak(&v20, &location);
  objc_copyWeak(&v21, &from);
  xpc_connection_set_event_handler(v4, handler);
  -[AXUIServiceManager resumingConnectionsQueue](self, "resumingConnectionsQueue");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v14;
  v17[1] = 3221225472;
  v17[2] = __40__AXUIServiceManager__handleConnection___block_invoke_2;
  v17[3] = &unk_24D49CA48;
  v17[4] = self;
  v16 = v4;
  v18 = v16;
  objc_msgSend(v15, "performAsynchronousWritingBlock:", v17);

  objc_destroyWeak(&v21);
  objc_destroyWeak(&v20);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

}

void __40__AXUIServiceManager__handleConnection___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  id v5;
  id v6;

  v3 = a2;
  v6 = (id)objc_opt_new();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v6, "setConnection:", WeakRetained);

  v5 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v5, "_processXPCObject:context:", v3, v6);

}

void __40__AXUIServiceManager__handleConnection___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;

  if (objc_msgSend(*(id *)(a1 + 32), "shouldAllowServicesToProcessMessages"))
  {
    xpc_connection_resume(*(xpc_connection_t *)(a1 + 40));
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "pausedConnections");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v2)
    {
      v3 = (id)objc_opt_new();
      objc_msgSend(*(id *)(a1 + 32), "setPausedConnections:", v3);
      v2 = v3;
    }
    v4 = v2;
    objc_msgSend(v2, "ax_enqueueObject:", *(_QWORD *)(a1 + 40));

  }
}

- (void)_processXPCObject:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t uint64;
  uint64_t v12;
  NSObject *v13;
  BOOL v14;
  uint64_t v15;
  id v16;
  id v17;
  void (**v18)(_QWORD, _QWORD, _QWORD, _QWORD);
  NSObject *v19;
  void *v20;
  void *v21;
  _BOOL4 v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  BOOL v44;
  uint8_t *v45;
  void *v46;
  uint8_t *v47;
  BOOL v48;
  void *v49;
  id *v50;
  id *v51;
  _QWORD *v52;
  uint64_t v53;
  void *v54;
  id *v55;
  _QWORD *v56;
  NSObject *v57;
  void *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  uint64_t v62;
  void *v63;
  id v64;
  void *v65;
  _QWORD v66[5];
  id v67;
  NSObject *v68;
  void (**v69)(_QWORD, _QWORD, _QWORD, _QWORD);
  uint8_t *v70;
  uint64_t v71;
  _QWORD v72[5];
  id v73;
  NSObject *v74;
  id v75;
  void (**v76)(_QWORD, _QWORD, _QWORD, _QWORD);
  uint8_t *v77;
  uint64_t v78;
  _QWORD v79[4];
  id v80;
  _QWORD v81[4];
  _QWORD v82[4];
  id v83;
  _QWORD v84[3];
  void (**v85)(_QWORD, _QWORD, _QWORD, _QWORD);
  uint64_t v86;
  id v87;
  id obj;
  id v89;
  _QWORD v90[4];
  id v91;
  id v92;
  BOOL v93;
  id v94;
  uint8_t v95[8];
  uint8_t *v96;
  uint64_t v97;
  uint64_t (*v98)(uint64_t, uint64_t);
  void (*v99)(uint64_t);
  id v100;
  void *v101;
  NSObject *v102;
  id v103;
  uint8_t buf[4];
  NSObject *v105;
  uint64_t v106;

  v106 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = MEMORY[0x2199F2920](v6);
  if (v8 == MEMORY[0x24BDACFA0])
  {
    v10 = v6;
    uint64 = xpc_dictionary_get_uint64(v10, (const char *)*MEMORY[0x24BDFF980]);
    if (!uint64)
    {
      AXLogUI();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[AXUIServiceManager _processXPCObject:context:].cold.1(v13, v27, v28, v29, v30, v31, v32, v33);
      goto LABEL_82;
    }
    v12 = uint64;
    -[AXUIServiceManager _extractClientIdentifier:](self, "_extractClientIdentifier:", v10);
    v13 = objc_claimAutoreleasedReturnValue();
    *(_QWORD *)v95 = 0;
    v96 = v95;
    v97 = 0x3032000000;
    v98 = __Block_byref_object_copy__0;
    v99 = __Block_byref_object_dispose__0;
    v100 = 0;
    v94 = 0;
    v14 = -[AXUIServiceManager _extractAndHandleRegistration:clientIdentifier:messageIdentifier:context:error:](self, "_extractAndHandleRegistration:clientIdentifier:messageIdentifier:context:error:", v10, v13, v12, v7, &v94);
    objc_storeStrong(&v100, v94);
    v15 = MEMORY[0x24BDAC760];
    v90[0] = MEMORY[0x24BDAC760];
    v90[1] = 3221225472;
    v90[2] = __48__AXUIServiceManager__processXPCObject_context___block_invoke;
    v90[3] = &unk_24D49CF88;
    v16 = v7;
    v91 = v16;
    v17 = v10;
    v92 = v17;
    v93 = v14;
    v18 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))MEMORY[0x2199F2788](v90);
    if (*((_QWORD *)v96 + 5))
    {
LABEL_79:
      v59 = *((_QWORD *)v96 + 5);
      if (v59)
        v18[2](v18, 0, v59, 0);

      _Block_object_dispose(v95, 8);
LABEL_82:

      goto LABEL_83;
    }
    if (!v13)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "ax_errorWithDomain:description:", *MEMORY[0x24BDFF928], CFSTR("Couldn't find client identifier associated to message."));
      v42 = objc_claimAutoreleasedReturnValue();
      v43 = (void *)*((_QWORD *)v96 + 5);
      *((_QWORD *)v96 + 5) = v42;
LABEL_78:

      goto LABEL_79;
    }
    -[AXUIServiceManager _serviceContextForClientWithIdentifier:](self, "_serviceContextForClientWithIdentifier:", v13);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12 == *MEMORY[0x24BDFF958] && v65)
    {
      AXLogAssertions();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v105 = v13;
        _os_log_impl(&dword_215E2A000, v19, OS_LOG_TYPE_DEFAULT, "AXUIServer received Clean up from client: %@", buf, 0xCu);
      }

      v102 = v13;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v102, 1);
      v64 = (id)objc_claimAutoreleasedReturnValue();
      v103 = v64;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v103, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v101 = v65;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v101, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXUIServiceManager _unregisterClientsIdentifiersLists:serviceContexts:](self, "_unregisterClientsIdentifiersLists:serviceContexts:", v20, v21);

      goto LABEL_77;
    }
    buf[0] = 0;
    objc_msgSend(v65, "service");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    if (v63)
    {
      v89 = 0;
      v44 = -[AXUIServiceManager _serviceWithClass:canProcessMessageWithIdentifier:fromClientWithConnection:possibleRequiredEntitlements:needsToRequireEntitlements:](self, "_serviceWithClass:canProcessMessageWithIdentifier:fromClientWithConnection:possibleRequiredEntitlements:needsToRequireEntitlements:", objc_opt_class(), v12, v16, &v89, buf);
      v64 = v89;
      if (v44)
      {
        xpc_dictionary_get_value(v17, (const char *)*MEMORY[0x24BDFF978]);
        v62 = objc_claimAutoreleasedReturnValue();
        if (v62 && (objc_opt_respondsToSelector() & 1) != 0)
        {
          v45 = v96;
          obj = (id)*((_QWORD *)v96 + 5);
          objc_msgSend(MEMORY[0x24BDFE500], "dictionaryFromXPCMessage:error:", v62, &obj);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_storeStrong((id *)v45 + 5, obj);
          if (objc_msgSend(v46, "count"))
            objc_msgSend(v63, "processInitializationMessage:", v46);

        }
        v47 = v96;
        if (*((_QWORD *)v96 + 5)
          || (v48 = xpc_dictionary_get_BOOL(v17, (const char *)*MEMORY[0x24BDFF988]), v47 = v96, v48))
        {
          v61 = 0;
        }
        else
        {
          v87 = (id)*((_QWORD *)v96 + 5);
          objc_msgSend(MEMORY[0x24BDFE500], "dictionaryFromXPCMessage:error:", v17, &v87);
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_storeStrong((id *)v47 + 5, v87);
          v47 = v96;
        }
        if (*((_QWORD *)v47 + 5))
          goto LABEL_75;
        v49 = v63;
        if ((objc_opt_respondsToSelector() & 1) != 0
          && ((objc_opt_respondsToSelector() & 1) != 0 || (objc_opt_respondsToSelector() & 1) != 0))
        {
          if (objc_msgSend(v63, "messageWithIdentifierShouldBeProcessedAsynchronously:", v12))
          {
            if ((objc_opt_respondsToSelector() & 1) != 0)
            {
              v82[0] = v15;
              v82[1] = 3221225472;
              v82[2] = __48__AXUIServiceManager__processXPCObject_context___block_invoke_253;
              v82[3] = &unk_24D49CFD8;
              v83 = v63;
              v84[0] = v61;
              v86 = v12;
              v84[1] = v13;
              v84[2] = v65;
              v85 = v18;
              v60 = (void *)MEMORY[0x2199F2788](v82);

              v50 = &v83;
              v51 = (id *)v84;
              v52 = v82;
            }
            else
            {
              v79[0] = v15;
              v79[1] = 3221225472;
              v79[2] = __48__AXUIServiceManager__processXPCObject_context___block_invoke_3_255;
              v79[3] = &unk_24D49D000;
              v80 = v63;
              v81[0] = v61;
              v81[3] = v12;
              v81[1] = v13;
              v81[2] = v18;
              v60 = (void *)MEMORY[0x2199F2788](v79);
              v50 = &v80;
              v51 = (id *)v81;
              v52 = v79;
            }
            v55 = (id *)(v52 + 6);

            v49 = v63;
            if (v60)
            {
LABEL_67:
              if ((objc_opt_respondsToSelector() & 1) == 0
                || (objc_msgSend(v49, "accessQueueForProcessingMessageWithIdentifier:", v12),
                    (v58 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
              {
                objc_msgSend(MEMORY[0x24BDFE478], "mainAccessQueue");
                v58 = (void *)objc_claimAutoreleasedReturnValue();
              }
              if ((objc_opt_respondsToSelector() & 1) != 0
                && !objc_msgSend(v49, "messageWithIdentifierRequiresWritingBlock:", v12))
              {
                objc_msgSend(v58, "performAsynchronousReadingBlock:", v60);
              }
              else
              {
                objc_msgSend(v58, "performAsynchronousWritingBlock:", v60);
              }

LABEL_75:
              v54 = (void *)v62;
              goto LABEL_76;
            }
          }
        }
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          v72[0] = v15;
          v72[1] = 3221225472;
          v72[2] = __48__AXUIServiceManager__processXPCObject_context___block_invoke_5;
          v72[3] = &unk_24D49D028;
          v56 = v72;
          v72[4] = v49;
          v73 = v61;
          v78 = v12;
          v74 = v13;
          v75 = v65;
          v77 = v95;
          v76 = v18;
          v60 = (void *)MEMORY[0x2199F2788](v72);

        }
        else
        {
          if ((objc_opt_respondsToSelector() & 1) == 0)
          {
            AXLogUI();
            v57 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v57, OS_LOG_TYPE_FAULT))
              -[AXUIServiceManager _processXPCObject:context:].cold.2(v57);
            v60 = 0;
            goto LABEL_66;
          }
          v66[0] = v15;
          v66[1] = 3221225472;
          v66[2] = __48__AXUIServiceManager__processXPCObject_context___block_invoke_6;
          v66[3] = &unk_24D49D050;
          v56 = v66;
          v66[4] = v49;
          v67 = v61;
          v71 = v12;
          v68 = v13;
          v70 = v95;
          v69 = v18;
          v60 = (void *)MEMORY[0x2199F2788](v66);

        }
        v57 = v56[4];
LABEL_66:

        v49 = v63;
        goto LABEL_67;
      }
      if (buf[0])
        objc_msgSend(MEMORY[0x24BDD1540], "ax_errorWithDomain:description:", *MEMORY[0x24BDFF930], CFSTR("The service must require entitlements for this operation: %d"), v12);
      else
        objc_msgSend(MEMORY[0x24BDD1540], "ax_errorWithDomain:description:", *MEMORY[0x24BDFF918], CFSTR("One of the following entitlements is required: %@ for this operation: %d. See guidance in rdar://126183364."), v64, v12);
      v53 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "ax_errorWithDomain:description:", *MEMORY[0x24BDFF928], CFSTR("Couldn't find service associated to client identifier: %@"), v13);
      v53 = objc_claimAutoreleasedReturnValue();
      v64 = 0;
    }
    v54 = (void *)*((_QWORD *)v96 + 5);
    *((_QWORD *)v96 + 5) = v53;
LABEL_76:

LABEL_77:
    v43 = v65;
    goto LABEL_78;
  }
  if (v8 == MEMORY[0x24BDACFB8])
  {
    if (v6 == (id)MEMORY[0x24BDACF38])
    {
      AXLogUI();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        -[AXUIServiceManager _processXPCObject:context:].cold.3(v34, v35, v36, v37, v38, v39, v40, v41);

      -[AXUIServiceManager _unregisterAllClientsWithConnection:](self, "_unregisterAllClientsWithConnection:", v7);
    }
    else
    {
      v22 = v6 == (id)MEMORY[0x24BDACF48];
      AXLogUI();
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = v23;
      if (v22)
      {
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v95 = 0;
          _os_log_impl(&dword_215E2A000, v24, OS_LOG_TYPE_DEFAULT, "Connection with client was supposed to be terminated imminently, but we are ignoring it for now.", v95, 2u);
        }

      }
      else
      {
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          -[AXUIServiceManager _processXPCObject:context:].cold.4(v6, v24);

      }
    }
  }
  else
  {
    if (v6)
      v9 = (void *)MEMORY[0x2199F28C0](v6);
    else
      v9 = 0;
    AXLogUI();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      -[AXUIServiceManager _processXPCObject:context:].cold.5((uint64_t)v9, v25, v26);

    if (v9)
      free(v9);
  }
LABEL_83:

}

void __48__AXUIServiceManager__processXPCObject_context___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void (**v16)(_QWORD, _QWORD, _QWORD);
  void *v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  char v21;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  objc_msgSend(*(id *)(a1 + 32), "connection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v12 = *(_QWORD *)(a1 + 32);
    v11 = *(_QWORD *)(a1 + 40);
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __48__AXUIServiceManager__processXPCObject_context___block_invoke_2;
    v20[3] = &__block_descriptor_33_e33_v16__0__NSObject_OS_xpc_object__8l;
    v21 = *(_BYTE *)(a1 + 48);
    objc_msgSend(MEMORY[0x24BDFF948], "sendReply:withError:andOriginalXPCMessage:usingConnection:customDataAddingBlock:", v7, v8, v11, v12, v20);
  }
  else
  {
    if (v7)
    {
      v13 = (void *)_CFXPCCreateXPCMessageWithCFObject();
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionary");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)_CFXPCCreateXPCMessageWithCFObject();

    }
    if (*(_BYTE *)(a1 + 48))
      xpc_dictionary_set_BOOL(v13, (const char *)*MEMORY[0x24BDFF960], 1);
    objc_msgSend(*(id *)(a1 + 32), "xpc_handler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_msgSend(*(id *)(a1 + 32), "xpc_handler");
      v16 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *, id))v16)[2](v16, v13, v8);

    }
  }
  if (*(_BYTE *)(a1 + 48) && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDFE478], "backgroundAccessQueue");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __48__AXUIServiceManager__processXPCObject_context___block_invoke_3;
    v18[3] = &unk_24D49C910;
    v19 = v9;
    objc_msgSend(v17, "performAsynchronousWritingBlock:", v18);

  }
}

void __48__AXUIServiceManager__processXPCObject_context___block_invoke_2(uint64_t a1, xpc_object_t xdict)
{
  if (*(_BYTE *)(a1 + 32))
    xpc_dictionary_set_BOOL(xdict, (const char *)*MEMORY[0x24BDFF960], 1);
}

uint64_t __48__AXUIServiceManager__processXPCObject_context___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "serviceWasFullyInitialized");
}

void __48__AXUIServiceManager__processXPCObject_context___block_invoke_253(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 72);
  v5 = *(_QWORD *)(a1 + 48);
  v6 = objc_msgSend(*(id *)(a1 + 56), "pidForClientWithIdentifier:", v5);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __48__AXUIServiceManager__processXPCObject_context___block_invoke_2_254;
  v7[3] = &unk_24D49CFB0;
  v9 = *(id *)(a1 + 64);
  v8 = *(id *)(a1 + 32);
  objc_msgSend(v2, "processMessageAsynchronously:withIdentifier:fromClientWithIdentifier:pid:completion:", v3, v4, v5, v6, v7);

}

uint64_t __48__AXUIServiceManager__processXPCObject_context___block_invoke_2_254(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, uint64_t, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), a2, a3, *(_QWORD *)(a1 + 32));
}

void __48__AXUIServiceManager__processXPCObject_context___block_invoke_3_255(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __48__AXUIServiceManager__processXPCObject_context___block_invoke_4;
  v6[3] = &unk_24D49CFB0;
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 64);
  v8 = *(id *)(a1 + 56);
  v7 = *(id *)(a1 + 32);
  objc_msgSend(v2, "processMessageAsynchronously:withIdentifier:fromClientWithIdentifier:completion:", v3, v5, v4, v6);

}

uint64_t __48__AXUIServiceManager__processXPCObject_context___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, uint64_t, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), a2, a3, *(_QWORD *)(a1 + 32));
}

void __48__AXUIServiceManager__processXPCObject_context___block_invoke_5(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id obj;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 80);
  v5 = *(_QWORD *)(a1 + 48);
  v6 = objc_msgSend(*(id *)(a1 + 56), "pidForClientWithIdentifier:", v5);
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  obj = *(id *)(v7 + 40);
  objc_msgSend(v2, "processMessage:withIdentifier:fromClientWithIdentifier:pid:error:", v3, v4, v5, v6, &obj);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v7 + 40), obj);
  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = 0;

}

void __48__AXUIServiceManager__processXPCObject_context___block_invoke_6(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id obj;

  v2 = (void *)a1[4];
  v3 = a1[5];
  v4 = a1[6];
  v5 = a1[9];
  v6 = *(_QWORD *)(a1[8] + 8);
  obj = *(id *)(v6 + 40);
  objc_msgSend(v2, "processMessage:withIdentifier:fromClientWithIdentifier:error:", v3, v5, v4, &obj);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v6 + 40), obj);
  (*(void (**)(void))(a1[7] + 16))();
  v8 = *(_QWORD *)(a1[8] + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = 0;

}

- (id)_extractClientIdentifier:(id)a3
{
  char *string;

  string = (char *)xpc_dictionary_get_string(a3, (const char *)*MEMORY[0x24BDFF970]);
  if (string)
    string = (char *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", string);
  return string;
}

- (BOOL)_extractAndHandleRegistration:(id)a3 clientIdentifier:(id)a4 messageIdentifier:(unint64_t)a5 context:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  const char *string;
  BOOL v15;
  void *v16;
  void *v17;
  NSObject *v19;
  id v20;
  int v21;
  id v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v12 = a4;
  v13 = a6;
  string = xpc_dictionary_get_string(a3, (const char *)*MEMORY[0x24BDFF990]);
  v15 = 0;
  if (v12 && string)
  {
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", string);
    -[AXUIServiceManager _serviceContextForClientWithIdentifier:](self, "_serviceContextForClientWithIdentifier:", v12);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17
      || -[AXUIServiceManager _registerClientWithIdentifier:connection:serviceBundleName:initiatingMessageIdentifier:error:](self, "_registerClientWithIdentifier:connection:serviceBundleName:initiatingMessageIdentifier:error:", v12, v13, v16, a5, a7))
    {
      v15 = 1;
    }
    else
    {
      AXLogUI();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        v20 = *a7;
        v21 = 138412802;
        v22 = v12;
        v23 = 2112;
        v24 = v16;
        v25 = 2112;
        v26 = v20;
        _os_log_error_impl(&dword_215E2A000, v19, OS_LOG_TYPE_ERROR, "Could not register client. ID=%@ serviceBundleName=%@ error=%@", (uint8_t *)&v21, 0x20u);
      }

      v15 = 0;
    }

  }
  return v15;
}

- (BOOL)_serviceWithClass:(Class)a3 canProcessMessageWithIdentifier:(unint64_t)a4 fromClientWithConnection:(id)a5 possibleRequiredEntitlements:(id *)a6 needsToRequireEntitlements:(BOOL *)a7
{
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v18[5];
  id v19;
  id v20;
  uint64_t *v21;
  Class v22;
  unint64_t v23;
  id *v24;
  BOOL *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;

  v12 = a5;
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 0;
  NSStringFromClass(a3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXUIServiceManager entitlementsCheckersAccessQueue](self, "entitlementsCheckersAccessQueue");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __153__AXUIServiceManager__serviceWithClass_canProcessMessageWithIdentifier_fromClientWithConnection_possibleRequiredEntitlements_needsToRequireEntitlements___block_invoke;
  v18[3] = &unk_24D49D078;
  v18[4] = self;
  v15 = v13;
  v19 = v15;
  v21 = &v26;
  v22 = a3;
  v23 = a4;
  v16 = v12;
  v20 = v16;
  v24 = a6;
  v25 = a7;
  objc_msgSend(v14, "performSynchronousWritingBlock:", v18);

  LOBYTE(a7) = *((_BYTE *)v27 + 24);
  _Block_object_dispose(&v26, 8);

  return (char)a7;
}

void __153__AXUIServiceManager__serviceWithClass_canProcessMessageWithIdentifier_fromClientWithConnection_possibleRequiredEntitlements_needsToRequireEntitlements___block_invoke(uint64_t a1)
{
  void *v2;
  AXUIServiceEntitlementChecker *v3;
  id v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "entitlementsCheckers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    v4 = (id)objc_opt_new();
    objc_msgSend(*(id *)(a1 + 32), "setEntitlementsCheckers:", v4);
    v2 = v4;
  }
  v5 = v2;
  objc_msgSend(v2, "objectForKey:", *(_QWORD *)(a1 + 40));
  v3 = (AXUIServiceEntitlementChecker *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v3 = -[AXUIServiceEntitlementChecker initWithServiceClass:]([AXUIServiceEntitlementChecker alloc], "initWithServiceClass:", *(_QWORD *)(a1 + 64));
    objc_msgSend(v5, "setObject:forKey:", v3, *(_QWORD *)(a1 + 40));
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = -[AXUIServiceEntitlementChecker serviceCanProcessMessageWithIdentifier:fromClientWithConnection:possibleRequiredEntitlements:needsToRequireEntitlements:](v3, "serviceCanProcessMessageWithIdentifier:fromClientWithConnection:possibleRequiredEntitlements:needsToRequireEntitlements:", *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88));

}

- (void)_registerForSystemAppDeath
{
  void *v3;
  _QWORD v4[5];

  if (!_AXSMossdeepEnabled())
  {
    objc_msgSend(MEMORY[0x24BE00728], "server");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __48__AXUIServiceManager__registerForSystemAppDeath__block_invoke;
    v4[3] = &unk_24D49D0C0;
    v4[4] = self;
    objc_msgSend(v3, "pid:", v4);

  }
}

void __48__AXUIServiceManager__registerForSystemAppDeath__block_invoke(uint64_t a1, uint64_t a2)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  dispatch_time_t v8;
  _QWORD block[5];

  if ((a2 & 0x80000000) != 0)
  {
    v8 = dispatch_time(0, 5000000000);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __48__AXUIServiceManager__registerForSystemAppDeath__block_invoke_2;
    block[3] = &unk_24D49C910;
    block[4] = *(_QWORD *)(a1 + 32);
    dispatch_after(v8, MEMORY[0x24BDAC9B8], block);
  }
  else
  {
    v4 = objc_alloc(MEMORY[0x24BE38020]);
    v5 = objc_msgSend(v4, "initWithPID:queue:deathHandler:", a2, MEMORY[0x24BDAC9B8], &__block_literal_global_270);
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(v6 + 8);
    *(_QWORD *)(v6 + 8) = v5;

  }
}

uint64_t __48__AXUIServiceManager__registerForSystemAppDeath__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_registerForSystemAppDeath");
}

void __48__AXUIServiceManager__registerForSystemAppDeath__block_invoke_3()
{
  id v0;

  objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "terminateWithSuccess");

}

- (void)_applicationDidFinishLaunching
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  -[AXUIServiceManager resumingConnectionsQueue](self, "resumingConnectionsQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __52__AXUIServiceManager__applicationDidFinishLaunching__block_invoke;
  v5[3] = &unk_24D49C910;
  v5[4] = self;
  objc_msgSend(v3, "performAsynchronousWritingBlock:", v5);

  objc_msgSend(MEMORY[0x24BE005C8], "server");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerAccessibilityUIServicePID:", getpid());

  -[AXUIServiceManager _registerForSystemAppDeath](self, "_registerForSystemAppDeath");
}

void __52__AXUIServiceManager__applicationDidFinishLaunching__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "setShouldAllowServicesToProcessMessages:", 1);
  objc_msgSend(*(id *)(a1 + 32), "pausedConnections");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        xpc_connection_resume(*(xpc_connection_t *)(*((_QWORD *)&v7 + 1) + 8 * v6++));
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }
  objc_msgSend(*(id *)(a1 + 32), "setPausedConnections:", 0);

}

- (void)_applicationDidReceiveMemoryWarning:(id)a3
{
  void *v4;
  _QWORD v5[5];

  -[AXUIServiceManager entitlementsCheckersAccessQueue](self, "entitlementsCheckersAccessQueue", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __58__AXUIServiceManager__applicationDidReceiveMemoryWarning___block_invoke;
  v5[3] = &unk_24D49C910;
  v5[4] = self;
  objc_msgSend(v4, "performAsynchronousWritingBlock:", v5);

}

uint64_t __58__AXUIServiceManager__applicationDidReceiveMemoryWarning___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setEntitlementsCheckers:", 0);
}

- (BOOL)_registerClientWithIdentifier:(id)a3 connection:(id)a4 serviceBundleName:(id)a5 initiatingMessageIdentifier:(unint64_t)a6 error:(id *)a7
{
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  BOOL v32;
  id v33;
  void *v34;
  void *v36;
  id v37;
  NSObject *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  id *v47;
  id v49;
  id v50;
  id obj;
  _QWORD v52[5];
  id v53;
  id v54;
  id v55;
  id v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  uint8_t buf[4];
  id v62;
  __int16 v63;
  id v64;
  _BYTE v65[128];
  _QWORD v66[6];

  v66[3] = *MEMORY[0x24BDAC8D0];
  v50 = a3;
  v49 = a4;
  v10 = a5;
  AXSystemRootDirectory();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringByAppendingPathComponent:", CFSTR("System/Library/AccessibilityBundles"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringByStandardizingPath");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  AXSystemRootDirectory();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringByAppendingPathComponent:", CFSTR("Developer/Library/PrivateFrameworks/AccessibilityAudit.framework"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringByStandardizingPath");
  v16 = objc_claimAutoreleasedReturnValue();

  AXSystemRootDirectory();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "stringByAppendingPathComponent:", CFSTR("AppleInternal/Library/AccessibilityUIServices"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "stringByStandardizingPath");
  v19 = objc_claimAutoreleasedReturnValue();

  v66[0] = v13;
  v66[1] = v16;
  v43 = (void *)v16;
  v44 = (void *)v19;
  v66[2] = v19;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v66, 3);
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  v20 = (id)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v57, v65, 16);
  obj = v20;
  if (!v21)
  {

    v32 = 0;
    v23 = 0;
    v33 = 0;
LABEL_19:
    v34 = v43;
    if (!a7)
      goto LABEL_21;
    goto LABEL_20;
  }
  v22 = v21;
  v42 = v13;
  v47 = a7;
  v23 = 0;
  v24 = *(_QWORD *)v58;
  v45 = *MEMORY[0x24BDFF920];
LABEL_3:
  v25 = 0;
  while (1)
  {
    if (*(_QWORD *)v58 != v24)
      objc_enumerationMutation(v20);
    v26 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * v25);
    objc_msgSend(v10, "stringByAppendingPathExtension:", CFSTR("axuiservice"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "stringByAppendingPathComponent:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "stringByStandardizingPath");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v29, "hasPrefix:", v26) & 1) == 0)
    {
      if (v47)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "ax_errorWithDomain:description:", v45, CFSTR("Invalid service bundle path: %@"), v29);
        v31 = objc_claimAutoreleasedReturnValue();

        v23 = (id)v31;
      }

      goto LABEL_13;
    }

    buf[0] = 0;
    v56 = 0;
    -[AXUIServiceManager _serviceFromBundlePath:clientIdentifier:connection:initiatingMessageIdentifier:stopSearching:error:](self, "_serviceFromBundlePath:clientIdentifier:connection:initiatingMessageIdentifier:stopSearching:error:", v29, v50, v49, a6, buf, &v56);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v56;
    if (buf[0])
      break;

    if (v30)
    {

      goto LABEL_22;
    }
LABEL_13:
    if (v22 == ++v25)
    {
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v57, v65, 16);
      if (v22)
        goto LABEL_3;

      goto LABEL_18;
    }
  }

  if (!v30)
  {
LABEL_18:
    v32 = 0;
    v33 = 0;
    a7 = v47;
    v13 = v42;
    goto LABEL_19;
  }
LABEL_22:
  -[AXUIServiceManager servicesAccessQueue](self, "servicesAccessQueue");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v52[0] = MEMORY[0x24BDAC760];
  v52[1] = 3221225472;
  v52[2] = __115__AXUIServiceManager__registerClientWithIdentifier_connection_serviceBundleName_initiatingMessageIdentifier_error___block_invoke;
  v52[3] = &unk_24D49D0E8;
  v52[4] = self;
  v33 = v30;
  v53 = v33;
  v37 = v50;
  v54 = v37;
  v55 = v49;
  objc_msgSend(v36, "performSynchronousWritingBlock:", v52);

  AXLogAssertions();
  v38 = objc_claimAutoreleasedReturnValue();
  a7 = v47;
  v13 = v42;
  v34 = v43;
  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v62 = v33;
    v63 = 2112;
    v64 = v37;
    _os_log_impl(&dword_215E2A000, v38, OS_LOG_TYPE_DEFAULT, "Registered service/client: %@ %@", buf, 0x16u);
  }

  -[AXUIServiceManager displayManager](self, "displayManager");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "serviceDidConnect:clientWithIdentifier:", v33, v37);

  +[AXUIAssertionManager sharedInstance](AXUIAssertionManager, "sharedInstance");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "acquireAssertionIfNeeded");

  +[AXUIAssertionManager sharedInstance](AXUIAssertionManager, "sharedInstance");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "acquireAssertionUIIfNeededForService:clientIdentifier:", v33, v37);

  v32 = 1;
  if (v47)
LABEL_20:
    *a7 = objc_retainAutorelease(v23);
LABEL_21:

  return v32;
}

void __115__AXUIServiceManager__registerClientWithIdentifier_connection_serviceBundleName_initiatingMessageIdentifier_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  AXUIServiceContext *v6;

  v2 = (void *)MEMORY[0x2199F262C]();
  objc_msgSend(*(id *)(a1 + 32), "_serviceContextForService:", *(_QWORD *)(a1 + 40));
  v6 = (AXUIServiceContext *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v2);
  if (!v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "serviceContexts");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v3 = (void *)objc_opt_new();
      objc_msgSend(*(id *)(a1 + 32), "setServiceContexts:", v3);
    }
    v4 = objc_msgSend(*(id *)(a1 + 32), "lastUsedServiceIdentifier") + 1;
    objc_msgSend(*(id *)(a1 + 32), "setLastUsedServiceIdentifier:", v4);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[AXUIServiceContext initWithService:serviceIdentifier:]([AXUIServiceContext alloc], "initWithService:serviceIdentifier:", *(_QWORD *)(a1 + 40), v5);
    objc_msgSend(v3, "addObject:");

  }
  -[AXUIServiceContext addClientWithIdentifier:connection:](v6, "addClientWithIdentifier:connection:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

- (id)_serviceFromBundlePath:(id)a3 clientIdentifier:(id)a4 connection:(id)a5 initiatingMessageIdentifier:(unint64_t)a6 stopSearching:(BOOL *)a7 error:(id *)a8
{
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  BOOL v22;
  id v23;
  char v24;
  NSObject *v25;
  _BOOL4 v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  id v32;
  void *v33;
  uint64_t v34;
  const __CFString *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v41;
  void *v42;
  id v43;
  id v44;
  uint64_t v45;
  BOOL *v46;
  id v47;
  char v48;
  uint8_t buf[4];
  void *v50;
  __int16 v51;
  void *v52;
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithPath:", v14);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (!v17)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "ax_errorWithDomain:description:", *MEMORY[0x24BDFF920], CFSTR("Failed to create service bundle at path: %@"), v14);
    v28 = 0;
    *a8 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_37;
  }
  if ((objc_msgSend(v17, "isLoaded") & 1) == 0 && (objc_msgSend(v18, "loadAndReturnError:", a8) & 1) == 0 && !*a8)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "ax_errorWithDomain:description:", *MEMORY[0x24BDFF920], CFSTR("Failed to load service bundle at path: %@"), v14);
    *a8 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (!objc_msgSend(v18, "isLoaded"))
  {
    if (*a8)
    {
      v28 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "ax_errorWithDomain:description:", *MEMORY[0x24BDFF920], CFSTR("Service bundle still not loaded, weird... Service bundle path: %@"), v14);
      v32 = (id)objc_claimAutoreleasedReturnValue();
      v28 = 0;
      *a8 = v32;
      if (!v32)
        goto LABEL_37;
    }
    goto LABEL_36;
  }
  v46 = a7;
  v19 = (void *)objc_msgSend(v18, "principalClass");
  AXLogUI();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v18, "bundlePath");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v50 = v21;
    v51 = 2112;
    v52 = v19;
    _os_log_impl(&dword_215E2A000, v20, OS_LOG_TYPE_DEFAULT, "AXUIServer will attempt to load principal class from bundle: %@: '%@'", buf, 0x16u);

  }
  v48 = 0;
  if (!v19)
  {
    v29 = (void *)MEMORY[0x24BDD1540];
    v30 = *MEMORY[0x24BDFF920];
    objc_msgSend(v18, "infoDictionary");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("NSPrincipalClass"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "ax_errorWithDomain:description:", v30, CFSTR("Couldn't find principal class for service bundle at path: %@ %@"), v14, v31);
    *a8 = (id)objc_claimAutoreleasedReturnValue();

    v23 = 0;
LABEL_33:
    a7 = v46;
    goto LABEL_34;
  }
  v47 = 0;
  v22 = -[AXUIServiceManager _serviceWithClass:canProcessMessageWithIdentifier:fromClientWithConnection:possibleRequiredEntitlements:needsToRequireEntitlements:](self, "_serviceWithClass:canProcessMessageWithIdentifier:fromClientWithConnection:possibleRequiredEntitlements:needsToRequireEntitlements:", v19, a6, v16, &v47, &v48);
  v23 = v47;
  if (!v22)
  {
    v33 = (void *)MEMORY[0x24BDD1540];
    if (v48)
    {
      v34 = *MEMORY[0x24BDFF930];
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a6);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = v19;
      v42 = v28;
      v35 = CFSTR("Service: '%@' unable to process message:'%@'. The service needs to require entitlements.");
    }
    else
    {
      v34 = *MEMORY[0x24BDFF918];
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a6);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = v15;
      v45 = objc_msgSend(v16, "pid");
      v42 = v28;
      v43 = v23;
      v41 = v19;
      v35 = CFSTR("Service: '%@' unable to process message:'%@'. Entitlements may be missing. See guidance in rdar://126183364. required: %@ [client identifier: %@:%d]");
    }
    v36 = v33;
    v37 = v34;
    goto LABEL_32;
  }
  v24 = objc_opt_respondsToSelector();
  AXLogUI();
  v25 = objc_claimAutoreleasedReturnValue();
  v26 = os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT);
  if ((v24 & 1) != 0)
  {
    if (v26)
    {
      *(_DWORD *)buf = 138412290;
      v50 = v19;
      _os_log_impl(&dword_215E2A000, v25, OS_LOG_TYPE_DEFAULT, "Principal class does respond to sharedInstance. Calling sharedInstance on '%@'", buf, 0xCu);
    }

    objc_msgSend(v19, "sharedInstance");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v26)
    {
      *(_DWORD *)buf = 138412290;
      v50 = v19;
      _os_log_impl(&dword_215E2A000, v25, OS_LOG_TYPE_DEFAULT, "Principal class does not respond to sharedInstance. Calling new on '%@'", buf, 0xCu);
    }

    v27 = (void *)objc_opt_new();
  }
  v28 = v27;
  if (!v27)
  {
    v38 = (void *)MEMORY[0x24BDD1540];
    v39 = *MEMORY[0x24BDFF920];
    NSStringFromClass((Class)v19);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = v28;
    v35 = CFSTR("Failed to instantiate service of class %@");
    v36 = v38;
    v37 = v39;
LABEL_32:
    objc_msgSend(v36, "ax_errorWithDomain:description:", v37, v35, v41, v42, v43, v44, v45);
    *a8 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_33;
  }
  a7 = v46;
  if ((objc_msgSend(v27, "conformsToProtocol:", &unk_254E248F0) & 1) != 0)
    goto LABEL_35;
  objc_msgSend(MEMORY[0x24BDD1540], "ax_errorWithDomain:description:", *MEMORY[0x24BDFF920], CFSTR("Service instance does not conform to service protocol: %@."), v28);
  *a8 = (id)objc_claimAutoreleasedReturnValue();
LABEL_34:

  v28 = 0;
LABEL_35:

  if (*a8)
LABEL_36:
    *a7 = 1;
LABEL_37:

  return v28;
}

- (void)_unregisterAllClientsWithConnection:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  _QWORD v12[5];
  id v13;
  uint64_t *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v4 = a3;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__0;
  v26 = __Block_byref_object_dispose__0;
  v27 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__0;
  v20 = __Block_byref_object_dispose__0;
  v21 = 0;
  -[AXUIServiceManager servicesAccessQueue](self, "servicesAccessQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x24BDAC760];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __58__AXUIServiceManager__unregisterAllClientsWithConnection___block_invoke;
  v12[3] = &unk_24D49D110;
  v12[4] = self;
  v7 = v4;
  v13 = v7;
  v14 = &v22;
  v15 = &v16;
  objc_msgSend(v5, "performSynchronousReadingBlock:", v12);
  -[AXUIServiceManager _unregisterClientsIdentifiersLists:serviceContexts:](self, "_unregisterClientsIdentifiersLists:serviceContexts:", v17[5], v23[5]);
  -[AXUIServiceManager entitlementsCheckersAccessQueue](self, "entitlementsCheckersAccessQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __58__AXUIServiceManager__unregisterAllClientsWithConnection___block_invoke_3;
  v10[3] = &unk_24D49CA48;
  v10[4] = self;
  v9 = v7;
  v11 = v9;
  objc_msgSend(v8, "performSynchronousWritingBlock:", v10);

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);

}

void __58__AXUIServiceManager__unregisterAllClientsWithConnection___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id obj;
  _QWORD v16[4];
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "serviceContexts");
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v2)
  {
    v3 = *(_QWORD *)v26;
    v4 = MEMORY[0x24BDAC760];
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v26 != v3)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v5);
        v19 = 0;
        v20 = &v19;
        v21 = 0x3032000000;
        v22 = __Block_byref_object_copy__0;
        v23 = __Block_byref_object_dispose__0;
        v24 = 0;
        v16[0] = v4;
        v16[1] = 3221225472;
        v16[2] = __58__AXUIServiceManager__unregisterAllClientsWithConnection___block_invoke_2;
        v16[3] = &unk_24D49CDE8;
        v17 = *(id *)(a1 + 40);
        v18 = &v19;
        objc_msgSend(v6, "enumerateClientsUsingBlock:", v16);
        if (v20[5])
        {
          v7 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
          if (!v7)
          {
            v8 = objc_opt_new();
            v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
            v10 = *(void **)(v9 + 40);
            *(_QWORD *)(v9 + 40) = v8;

            v7 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
          }
          objc_msgSend(v7, "addObject:", v6);
          v11 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
          if (!v11)
          {
            v12 = objc_opt_new();
            v13 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
            v14 = *(void **)(v13 + 40);
            *(_QWORD *)(v13 + 40) = v12;

            v11 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
          }
          objc_msgSend(v11, "addObject:", v20[5]);
        }

        _Block_object_dispose(&v19, 8);
        ++v5;
      }
      while (v2 != v5);
      v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v2);
  }

}

void __58__AXUIServiceManager__unregisterAllClientsWithConnection___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  if (objc_msgSend(*(id *)(a1 + 32), "isEqual:", v5))
  {
    objc_msgSend(v5, "setXpc_handler:", 0);
    v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    if (!v6)
    {
      v7 = objc_opt_new();
      v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v9 = *(void **)(v8 + 40);
      *(_QWORD *)(v8 + 40) = v7;

      v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    }
    objc_msgSend(v6, "addObject:", v10);
  }

}

void __58__AXUIServiceManager__unregisterAllClientsWithConnection___block_invoke_3(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "entitlementsCheckers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __58__AXUIServiceManager__unregisterAllClientsWithConnection___block_invoke_4;
  v3[3] = &unk_24D49CDC0;
  v4 = *(id *)(a1 + 40);
  objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", v3);

}

uint64_t __58__AXUIServiceManager__unregisterAllClientsWithConnection___block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "clientConnectionWillBeTerminated:", *(_QWORD *)(a1 + 32));
}

- (void)_unregisterClientsIdentifiersLists:(id)a3 serviceContexts:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v35;
  id v36;
  id v37;
  void *v38;
  uint64_t v39;
  void *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _QWORD v45[5];
  id v46;
  id v47;
  id v48;
  uint64_t v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  uint8_t v55[128];
  uint8_t buf[4];
  id v57;
  __int16 v58;
  id v59;
  uint64_t v60;

  v60 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  AXLogAssertions();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v57 = v5;
    v58 = 2112;
    v59 = v6;
    _os_log_impl(&dword_215E2A000, v7, OS_LOG_TYPE_DEFAULT, "Unregister: %@ %@", buf, 0x16u);
  }

  v8 = objc_msgSend(v6, "count");
  if (v8 != objc_msgSend(v5, "count"))
    _AXAssert();
  if (v8)
  {
    v9 = 0;
    v36 = v6;
    v37 = v5;
    v35 = v8;
    do
    {
      objc_msgSend(v6, "objectAtIndex:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "service");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v38 = v10;
        v39 = v9;
        objc_msgSend(v5, "objectAtIndex:", v9);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = 0u;
        v51 = 0u;
        v52 = 0u;
        v53 = 0u;
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v51;
          do
          {
            for (i = 0; i != v14; ++i)
            {
              if (*(_QWORD *)v51 != v15)
                objc_enumerationMutation(v12);
              v17 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * i);
              objc_msgSend(v11, "connectionWillBeInterruptedForClientWithIdentifier:", v17);
              AXLogAssertions();
              v18 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                v57 = v11;
                v58 = 2112;
                v59 = v17;
                _os_log_impl(&dword_215E2A000, v18, OS_LOG_TYPE_DEFAULT, "Service disconnected client: %@ %@", buf, 0x16u);
              }

            }
            v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
          }
          while (v14);
        }

        v6 = v36;
        v5 = v37;
        v8 = v35;
        v10 = v38;
        v9 = v39;
      }

      ++v9;
    }
    while (v9 != v8);
  }
  v19 = (void *)objc_opt_new();
  -[AXUIServiceManager servicesAccessQueue](self, "servicesAccessQueue");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v45[0] = MEMORY[0x24BDAC760];
  v45[1] = 3221225472;
  v45[2] = __73__AXUIServiceManager__unregisterClientsIdentifiersLists_serviceContexts___block_invoke;
  v45[3] = &unk_24D49D138;
  v45[4] = self;
  v49 = v8;
  v21 = v6;
  v46 = v21;
  v22 = v5;
  v47 = v22;
  v23 = v19;
  v48 = v23;
  v40 = v20;
  objc_msgSend(v20, "performSynchronousWritingBlock:", v45);
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v24 = v23;
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v41, v54, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v42;
    do
    {
      for (j = 0; j != v26; ++j)
      {
        if (*(_QWORD *)v42 != v27)
          objc_enumerationMutation(v24);
        v29 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * j);
        +[AXUIAssertionManager sharedInstance](AXUIAssertionManager, "sharedInstance");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "firstObject");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "lastObject");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "invalidateAssertionUIIfNeededForService:clientIdentifier:", v31, v32);

      }
      v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v41, v54, 16);
    }
    while (v26);
  }

  +[AXUIAssertionManager sharedInstance](AXUIAssertionManager, "sharedInstance");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "invalidateAssertionIfNeeded");

}

void __73__AXUIServiceManager__unregisterClientsIdentifiersLists_serviceContexts___block_invoke(uint64_t a1)
{
  __int128 v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  BOOL v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  __int128 v21;
  void *v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _QWORD v28[2];
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  uint64_t v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "serviceContexts");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_QWORD *)(a1 + 64))
  {
    v3 = 0;
    *(_QWORD *)&v2 = 138412290;
    v21 = v2;
    do
    {
      objc_msgSend(*(id *)(a1 + 40), "objectAtIndex:", v3, v21);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v3;
      objc_msgSend(*(id *)(a1 + 48), "objectAtIndex:", v3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 0u;
      v25 = 0u;
      v26 = 0u;
      v27 = 0u;
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
      if (v6)
      {
        v7 = v6;
        v8 = *(_QWORD *)v25;
        do
        {
          for (i = 0; i != v7; ++i)
          {
            if (*(_QWORD *)v25 != v8)
              objc_enumerationMutation(v5);
            v10 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
            objc_msgSend(v4, "removeClientWithIdentifier:", v10);
            AXLogAssertions();
            v11 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v4, "service");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v30 = v12;
              v31 = 2112;
              v32 = v10;
              _os_log_impl(&dword_215E2A000, v11, OS_LOG_TYPE_DEFAULT, "ServiceContext removed client: %@ %@", buf, 0x16u);

            }
            objc_msgSend(v4, "service");
            v13 = (void *)objc_claimAutoreleasedReturnValue();

            if (v10)
              v14 = v13 == 0;
            else
              v14 = 1;
            if (!v14)
            {
              v15 = *(void **)(a1 + 56);
              objc_msgSend(v4, "service");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v28[0] = v16;
              v28[1] = v10;
              objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v28, 2);
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "addObject:", v17);

            }
          }
          v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
        }
        while (v7);
      }
      if (!objc_msgSend(v4, "clientsCount"))
      {
        objc_msgSend(v22, "removeObjectIdenticalTo:", v4);
        AXLogAssertions();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v4, "service");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = v21;
          v30 = v19;
          _os_log_impl(&dword_215E2A000, v18, OS_LOG_TYPE_DEFAULT, "Service has no clients, removed: %@", buf, 0xCu);

        }
        if (!objc_msgSend(v22, "count"))
        {
          objc_msgSend(*(id *)(a1 + 32), "setServiceContexts:", 0);
          AXLogAssertions();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_215E2A000, v20, OS_LOG_TYPE_DEFAULT, "AXUIServer has no active services, idle", buf, 2u);
          }

        }
      }

      v3 = v23 + 1;
    }
    while ((unint64_t)(v23 + 1) < *(_QWORD *)(a1 + 64));
  }

}

- (id)_serviceContextForClientWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__0;
  v16 = __Block_byref_object_dispose__0;
  v17 = 0;
  -[AXUIServiceManager servicesAccessQueue](self, "servicesAccessQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __61__AXUIServiceManager__serviceContextForClientWithIdentifier___block_invoke;
  v9[3] = &unk_24D49D160;
  v9[4] = self;
  v6 = v4;
  v10 = v6;
  v11 = &v12;
  objc_msgSend(v5, "performSynchronousReadingBlock:", v9);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __61__AXUIServiceManager__serviceContextForClientWithIdentifier___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "serviceContexts");
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * i);
        if (objc_msgSend(v7, "hasClientWithIdentifier:", *(_QWORD *)(a1 + 40), (_QWORD)v8))
        {
          objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v7);
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

}

- (id)_services
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  _QWORD v9[5];
  id v10;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXUIServiceManager servicesAccessQueue](self, "servicesAccessQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __31__AXUIServiceManager__services__block_invoke;
  v9[3] = &unk_24D49CA48;
  v9[4] = self;
  v5 = v3;
  v10 = v5;
  objc_msgSend(v4, "performSynchronousReadingBlock:", v9);

  v6 = v10;
  v7 = v5;

  return v7;
}

void __31__AXUIServiceManager__services__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "serviceContexts");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(a1 + 40);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v6), "service");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v8);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }

}

- (unint64_t)_servicesCount
{
  void *v3;
  unint64_t v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  -[AXUIServiceManager servicesAccessQueue](self, "servicesAccessQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __36__AXUIServiceManager__servicesCount__block_invoke;
  v6[3] = &unk_24D49D188;
  v6[4] = self;
  v6[5] = &v7;
  objc_msgSend(v3, "performSynchronousReadingBlock:", v6);

  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __36__AXUIServiceManager__servicesCount__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "serviceContexts");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "count");

}

- (id)_serviceContextForService:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__0;
  v16 = __Block_byref_object_dispose__0;
  v17 = 0;
  -[AXUIServiceManager servicesAccessQueue](self, "servicesAccessQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __48__AXUIServiceManager__serviceContextForService___block_invoke;
  v9[3] = &unk_24D49D160;
  v9[4] = self;
  v6 = v4;
  v10 = v6;
  v11 = &v12;
  objc_msgSend(v5, "performSynchronousReadingBlock:", v9);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __48__AXUIServiceManager__serviceContextForService___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "serviceContexts");
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        objc_msgSend(v7, "service", (_QWORD)v10);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = *(void **)(a1 + 40);

        if (v8 == v9)
        {
          objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v7);
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

}

- (id)_uniqueIdentifierForService:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDD1968], "valueWithNonretainedObject:", a3);
}

- (id)_servicesForUniqueIdentifiers:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__0;
  v16 = __Block_byref_object_dispose__0;
  v17 = 0;
  -[AXUIServiceManager servicesAccessQueue](self, "servicesAccessQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __52__AXUIServiceManager__servicesForUniqueIdentifiers___block_invoke;
  v9[3] = &unk_24D49D160;
  v9[4] = self;
  v6 = v4;
  v10 = v6;
  v11 = &v12;
  objc_msgSend(v5, "performSynchronousWritingBlock:", v9);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __52__AXUIServiceManager__servicesForUniqueIdentifiers___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "serviceContexts");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v17 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        v8 = *(void **)(a1 + 32);
        objc_msgSend(v7, "service");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "_uniqueIdentifierForService:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(*(id *)(a1 + 40), "containsObject:", v10))
        {
          v11 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
          if (!v11)
          {
            v12 = objc_opt_new();
            v13 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
            v14 = *(void **)(v13 + 40);
            *(_QWORD *)(v13 + 40) = v12;

            v11 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
          }
          objc_msgSend(v7, "service");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "addObject:", v15);

        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v4);
  }

}

- (AXUIDisplayManager)displayManager
{
  return self->_displayManager;
}

- (void)setDisplayManager:(id)a3
{
  objc_storeStrong((id *)&self->_displayManager, a3);
}

- (AXAccessQueue)resumingConnectionsQueue
{
  return self->_resumingConnectionsQueue;
}

- (void)setResumingConnectionsQueue:(id)a3
{
  objc_storeStrong((id *)&self->_resumingConnectionsQueue, a3);
}

- (NSMutableArray)pausedConnections
{
  return self->_pausedConnections;
}

- (void)setPausedConnections:(id)a3
{
  objc_storeStrong((id *)&self->_pausedConnections, a3);
}

- (AXAccessQueue)entitlementsCheckersAccessQueue
{
  return self->_entitlementsCheckersAccessQueue;
}

- (void)setEntitlementsCheckersAccessQueue:(id)a3
{
  objc_storeStrong((id *)&self->_entitlementsCheckersAccessQueue, a3);
}

- (NSMutableDictionary)entitlementsCheckers
{
  return self->_entitlementsCheckers;
}

- (void)setEntitlementsCheckers:(id)a3
{
  objc_storeStrong((id *)&self->_entitlementsCheckers, a3);
}

- (AXUIMessageSender)messageSender
{
  return self->_messageSender;
}

- (void)setMessageSender:(id)a3
{
  objc_storeStrong((id *)&self->_messageSender, a3);
}

- (NSMutableArray)serviceContexts
{
  return self->_serviceContexts;
}

- (void)setServiceContexts:(id)a3
{
  objc_storeStrong((id *)&self->_serviceContexts, a3);
}

- (AXAccessQueue)servicesAccessQueue
{
  return self->_servicesAccessQueue;
}

- (void)setServicesAccessQueue:(id)a3
{
  objc_storeStrong((id *)&self->_servicesAccessQueue, a3);
}

- (unint64_t)lastUsedServiceIdentifier
{
  return self->_lastUsedServiceIdentifier;
}

- (void)setLastUsedServiceIdentifier:(unint64_t)a3
{
  self->_lastUsedServiceIdentifier = a3;
}

- (BOOL)shouldAllowServicesToProcessMessages
{
  return self->_shouldAllowServicesToProcessMessages;
}

- (void)setShouldAllowServicesToProcessMessages:(BOOL)a3
{
  self->_shouldAllowServicesToProcessMessages = a3;
}

- (AXUIServiceManagerDelegate)delegate
{
  return (AXUIServiceManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSMutableDictionary)transactions
{
  return self->_transactions;
}

- (void)setTransactions:(id)a3
{
  objc_storeStrong((id *)&self->_transactions, a3);
}

- (OS_dispatch_queue)transactionsQueue
{
  return self->_transactionsQueue;
}

- (void)setTransactionsQueue:(id)a3
{
  objc_storeStrong((id *)&self->_transactionsQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transactionsQueue, 0);
  objc_storeStrong((id *)&self->_transactions, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_servicesAccessQueue, 0);
  objc_storeStrong((id *)&self->_serviceContexts, 0);
  objc_storeStrong((id *)&self->_messageSender, 0);
  objc_storeStrong((id *)&self->_entitlementsCheckers, 0);
  objc_storeStrong((id *)&self->_entitlementsCheckersAccessQueue, 0);
  objc_storeStrong((id *)&self->_pausedConnections, 0);
  objc_storeStrong((id *)&self->_resumingConnectionsQueue, 0);
  objc_storeStrong((id *)&self->_displayManager, 0);
  objc_storeStrong((id *)&self->_connectionListener, 0);
  objc_storeStrong((id *)&self->_springBoardReaper, 0);
}

- (void)_processXPCObject:(uint64_t)a3 context:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_215E2A000, a1, a3, "AXUIServiceManager: Got invalid value for message identifier in client connection event handler: 0.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_0();
}

- (void)_processXPCObject:(os_log_t)log context:.cold.2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_215E2A000, log, OS_LOG_TYPE_FAULT, "Implementors of AXUIService must implement either processMessage:withIdentifier:fromClientWithIdentifier:error: or processMessage:withIdentifier:fromClientWithIdentifier:pid:error:.", v1, 2u);
  OUTLINED_FUNCTION_2_0();
}

- (void)_processXPCObject:(uint64_t)a3 context:(uint64_t)a4 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_215E2A000, a1, a3, "Lost connection with client.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_0();
}

- (void)_processXPCObject:(void *)a1 context:(NSObject *)a2 .cold.4(void *a1, NSObject *a2)
{
  const char *string;
  uint64_t v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  string = xpc_dictionary_get_string(a1, (const char *)*MEMORY[0x24BDACF40]);
  v5 = 136446210;
  v6 = string;
  OUTLINED_FUNCTION_1_0(&dword_215E2A000, a2, v4, "Got unexpected error in client connection event handler: %{public}s.", (uint8_t *)&v5);
}

- (void)_processXPCObject:(uint64_t)a3 context:.cold.5(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 136446210;
  v4 = a1;
  OUTLINED_FUNCTION_1_0(&dword_215E2A000, a2, a3, "Got object of unexpected type in client connection event handler: %{public}s.", (uint8_t *)&v3);
}

@end
