@implementation NPKCompanionAgentConnectionDeferredActionHandler

+ (id)sharedDeferredActionHandler
{
  if (sharedDeferredActionHandler_onceToken != -1)
    dispatch_once(&sharedDeferredActionHandler_onceToken, &__block_literal_global_7);
  return (id)sharedDeferredActionHandler_sharedDeferredActionHandler;
}

void __79__NPKCompanionAgentConnectionDeferredActionHandler_sharedDeferredActionHandler__block_invoke()
{
  NPKCompanionAgentConnectionDeferredActionHandler *v0;
  void *v1;

  v0 = objc_alloc_init(NPKCompanionAgentConnectionDeferredActionHandler);
  v1 = (void *)sharedDeferredActionHandler_sharedDeferredActionHandler;
  sharedDeferredActionHandler_sharedDeferredActionHandler = (uint64_t)v0;

}

- (NPKCompanionAgentConnectionDeferredActionHandler)init
{
  NPKCompanionAgentConnectionDeferredActionHandler *v2;
  uint64_t v3;
  NSMutableDictionary *deferredActions;
  uint64_t v5;
  NSMutableDictionary *deferredSharedPaymentWebServiceContexts;
  uint64_t v7;
  NSMutableDictionary *deferredAddedPaymentPasses;
  dispatch_queue_t v9;
  OS_dispatch_queue *internalQueue;
  void *v11;
  void *v12;
  const char *v13;
  NSObject *v14;
  _QWORD handler[4];
  id v17;
  id location;
  int out_token;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)NPKCompanionAgentConnectionDeferredActionHandler;
  v2 = -[NPKCompanionAgentConnectionDeferredActionHandler init](&v20, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    deferredActions = v2->_deferredActions;
    v2->_deferredActions = (NSMutableDictionary *)v3;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v5 = objc_claimAutoreleasedReturnValue();
    deferredSharedPaymentWebServiceContexts = v2->_deferredSharedPaymentWebServiceContexts;
    v2->_deferredSharedPaymentWebServiceContexts = (NSMutableDictionary *)v5;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v7 = objc_claimAutoreleasedReturnValue();
    deferredAddedPaymentPasses = v2->_deferredAddedPaymentPasses;
    v2->_deferredAddedPaymentPasses = (NSMutableDictionary *)v7;

    v9 = dispatch_queue_create("NPKCompanionAgentDeferredActionHandler", 0);
    internalQueue = v2->_internalQueue;
    v2->_internalQueue = (OS_dispatch_queue *)v9;

    objc_msgSend(MEMORY[0x24BE6B4E0], "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObserver:selector:name:object:", v2, sel__handleDeviceUnpaired_, *MEMORY[0x24BE6B450], v11);
    objc_msgSend(v12, "addObserver:selector:name:object:", v2, sel__handleDevicePaired_, *MEMORY[0x24BE6B440], v11);
    objc_msgSend(v12, "addObserver:selector:name:object:", v2, sel__handleDeviceBecameActive_, *MEMORY[0x24BE6B420], v11);
    objc_msgSend(v12, "addObserver:selector:name:object:", v2, sel__handleDevicePairingFailure_, *MEMORY[0x24BE6B430], v11);
    out_token = 0;
    objc_initWeak(&location, v2);
    v13 = (const char *)objc_msgSend(CFSTR("com.apple.NPKCompanionAgent.started"), "UTF8String");
    v14 = v2->_internalQueue;
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __56__NPKCompanionAgentConnectionDeferredActionHandler_init__block_invoke;
    handler[3] = &unk_24CFE78F0;
    objc_copyWeak(&v17, &location);
    notify_register_dispatch(v13, &out_token, v14, handler);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);

  }
  return v2;
}

void __56__NPKCompanionAgentConnectionDeferredActionHandler_init__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleCompanionAgentStarted");

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)NPKCompanionAgentConnectionDeferredActionHandler;
  -[NPKCompanionAgentConnectionDeferredActionHandler dealloc](&v4, sel_dealloc);
}

- (void)performActionWhenCompanionAgentIsAvailable:(id)a3 forDevice:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  _BOOL4 v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  _BOOL4 v15;
  NSObject *v16;
  void *v17;
  _QWORD block[5];
  id v19;
  id v20;
  uint8_t buf[4];
  id v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "valueForProperty:", *MEMORY[0x24BE6B3A8]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  pk_Payment_log();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8)
  {
    v11 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

    if (v11)
    {
      pk_Payment_log();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = (void *)MEMORY[0x2199B6780](v6);
        *(_DWORD *)buf = 138412290;
        v22 = v13;
        _os_log_impl(&dword_213518000, v12, OS_LOG_TYPE_DEFAULT, "Notice: Perform action when companion agent is available: %@", buf, 0xCu);

      }
    }
    -[NPKCompanionAgentConnectionDeferredActionHandler internalQueue](self, "internalQueue");
    v14 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __105__NPKCompanionAgentConnectionDeferredActionHandler_performActionWhenCompanionAgentIsAvailable_forDevice___block_invoke;
    block[3] = &unk_24CFE84E8;
    block[4] = self;
    v19 = v8;
    v20 = v6;
    dispatch_async(v14, block);

  }
  else
  {
    v15 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);

    if (v15)
    {
      pk_Payment_log();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v17 = (void *)MEMORY[0x2199B6780](v6);
        *(_DWORD *)buf = 138412546;
        v22 = v7;
        v23 = 2112;
        v24 = v17;
        _os_log_impl(&dword_213518000, v16, OS_LOG_TYPE_ERROR, "Error: Not performing action when companion agent is available because pairing ID is nil! Device: %@, action: %@", buf, 0x16u);

      }
    }
  }

}

void __105__NPKCompanionAgentConnectionDeferredActionHandler_performActionWhenCompanionAgentIsAvailable_forDevice___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "deferredActions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *(_QWORD *)(a1 + 40));
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "deferredActions");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, *(_QWORD *)(a1 + 40));

  }
  v4 = (void *)MEMORY[0x2199B6780](*(_QWORD *)(a1 + 48));
  objc_msgSend(v5, "addObject:", v4);

}

- (id)deferredSharedPaymentWebServiceContextForDevice:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  id v11;
  _QWORD block[5];
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "valueForProperty:", *MEMORY[0x24BE6B3A8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__5;
  v20 = __Block_byref_object_dispose__5;
  v21 = 0;
  -[NPKCompanionAgentConnectionDeferredActionHandler internalQueue](self, "internalQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __100__NPKCompanionAgentConnectionDeferredActionHandler_deferredSharedPaymentWebServiceContextForDevice___block_invoke;
  block[3] = &unk_24CFE9510;
  v15 = &v16;
  block[4] = self;
  v7 = v5;
  v14 = v7;
  dispatch_sync(v6, block);

  pk_Payment_log();
  v8 = objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if ((_DWORD)v6)
  {
    pk_Payment_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = v17[5];
      *(_DWORD *)buf = 138412546;
      v23 = v10;
      v24 = 2112;
      v25 = v4;
      _os_log_impl(&dword_213518000, v9, OS_LOG_TYPE_DEFAULT, "Notice: Fetched deferred shared web service context %@ for device %@", buf, 0x16u);
    }

  }
  v11 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  return v11;
}

void __100__NPKCompanionAgentConnectionDeferredActionHandler_deferredSharedPaymentWebServiceContextForDevice___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "deferredSharedPaymentWebServiceContexts");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)setDeferredSharedPaymentWebServiceContext:(id)a3 forDevice:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  _BOOL4 v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  _BOOL4 v15;
  _QWORD block[4];
  NSObject *v17;
  NPKCompanionAgentConnectionDeferredActionHandler *v18;
  id v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "valueForProperty:", *MEMORY[0x24BE6B3A8]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  pk_Payment_log();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8)
  {
    v11 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

    if (v11)
    {
      pk_Payment_log();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v21 = v6;
        _os_log_impl(&dword_213518000, v12, OS_LOG_TYPE_DEFAULT, "Notice: Setting deferred shared web service context: %@", buf, 0xCu);
      }

    }
    -[NPKCompanionAgentConnectionDeferredActionHandler internalQueue](self, "internalQueue");
    v13 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __104__NPKCompanionAgentConnectionDeferredActionHandler_setDeferredSharedPaymentWebServiceContext_forDevice___block_invoke;
    block[3] = &unk_24CFE8288;
    v17 = v6;
    v18 = self;
    v19 = v8;
    dispatch_async(v13, block);

    v14 = v17;
  }
  else
  {
    v15 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);

    if (!v15)
      goto LABEL_8;
    pk_Payment_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v21 = v7;
      v22 = 2112;
      v23 = v6;
      _os_log_impl(&dword_213518000, v14, OS_LOG_TYPE_ERROR, "Error: Not setting deferred shared web service context because pairing ID is nil! Device: %@, context: %@", buf, 0x16u);
    }
  }

LABEL_8:
}

void __104__NPKCompanionAgentConnectionDeferredActionHandler_setDeferredSharedPaymentWebServiceContext_forDevice___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "deferredSharedPaymentWebServiceContexts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
    objc_msgSend(v3, "setObject:forKey:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
  else
    objc_msgSend(v3, "removeObjectForKey:", *(_QWORD *)(a1 + 48));

}

- (void)addDeferredPaymentPass:(id)a3 forDevice:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  _BOOL4 v10;
  NSObject *v11;
  NSObject *v12;
  id v13;
  id v14;
  _QWORD block[4];
  id v16;
  id v17;
  NPKCompanionAgentConnectionDeferredActionHandler *v18;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "valueForProperty:", *MEMORY[0x24BE6B3A8]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  pk_Payment_log();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

  if (v10)
  {
    pk_Payment_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v20 = v6;
      v21 = 2112;
      v22 = v7;
      _os_log_impl(&dword_213518000, v11, OS_LOG_TYPE_DEFAULT, "Notice: Setting deferred added payment pass: %@ for device: %@", buf, 0x16u);
    }

  }
  -[NPKCompanionAgentConnectionDeferredActionHandler internalQueue](self, "internalQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __85__NPKCompanionAgentConnectionDeferredActionHandler_addDeferredPaymentPass_forDevice___block_invoke;
  block[3] = &unk_24CFE8288;
  v16 = v6;
  v17 = v8;
  v18 = self;
  v13 = v8;
  v14 = v6;
  dispatch_async(v12, block);

}

void __85__NPKCompanionAgentConnectionDeferredActionHandler_addDeferredPaymentPass_forDevice___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, void *, _BYTE *);
  void *v8;
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  if (*(_QWORD *)(a1 + 32) && *(_QWORD *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 48), "deferredAddedPaymentPasses");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "objectForKey:", *(_QWORD *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3)
    {
      objc_msgSend(MEMORY[0x24BDBCEF0], "set");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "deferredAddedPaymentPasses");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v3, *(_QWORD *)(a1 + 40));

    }
    v11 = 0;
    v12 = &v11;
    v13 = 0x3032000000;
    v14 = __Block_byref_object_copy__5;
    v15 = __Block_byref_object_dispose__5;
    v16 = 0;
    v5 = MEMORY[0x24BDAC760];
    v6 = 3221225472;
    v7 = __85__NPKCompanionAgentConnectionDeferredActionHandler_addDeferredPaymentPass_forDevice___block_invoke_2;
    v8 = &unk_24CFE9538;
    v9 = *(id *)(a1 + 32);
    v10 = &v11;
    objc_msgSend(v3, "enumerateObjectsUsingBlock:", &v5);
    if (v12[5])
      objc_msgSend(v3, "removeObject:", v5, v6, v7, v8);
    objc_msgSend(v3, "addObject:", *(_QWORD *)(a1 + 32), v5, v6, v7, v8);

    _Block_object_dispose(&v11, 8);
  }
}

void __85__NPKCompanionAgentConnectionDeferredActionHandler_addDeferredPaymentPass_forDevice___block_invoke_2(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v6;
  void *v7;
  int v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "uniqueID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "uniqueID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqualToString:", v7);

  if (v8)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a3 = 1;
  }

}

- (id)deferredPaymentPassesForDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "valueForProperty:", *MEMORY[0x24BE6B3A8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[NPKCompanionAgentConnectionDeferredActionHandler deferredAddedPaymentPasses](self, "deferredAddedPaymentPasses");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  pk_Payment_log();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    pk_Payment_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138412546;
      v13 = v7;
      v14 = 2112;
      v15 = v4;
      _os_log_impl(&dword_213518000, v10, OS_LOG_TYPE_DEFAULT, "Notice: Returning deferred added payment passes: %@ for device: %@", (uint8_t *)&v12, 0x16u);
    }

  }
  return v7;
}

- (id)deferredPaymentPassUniqueIDsForDevice:(id)a3 excludingDeactivated:(BOOL)a4
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *);
  void *v13;
  id v14;
  BOOL v15;

  -[NPKCompanionAgentConnectionDeferredActionHandler deferredPaymentPassesForDevice:](self, "deferredPaymentPassesForDevice:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x24BDAC760];
  v11 = 3221225472;
  v12 = __111__NPKCompanionAgentConnectionDeferredActionHandler_deferredPaymentPassUniqueIDsForDevice_excludingDeactivated___block_invoke;
  v13 = &unk_24CFE9560;
  v15 = a4;
  v14 = v6;
  v7 = v6;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", &v10);
  v8 = (void *)objc_msgSend(v7, "copy", v10, v11, v12, v13);

  return v8;
}

void __111__NPKCompanionAgentConnectionDeferredActionHandler_deferredPaymentPassUniqueIDsForDevice_excludingDeactivated___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  BOOL v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a2;
  v8 = v3;
  if (!*(_BYTE *)(a1 + 40) || (v4 = objc_msgSend(v3, "activationState") == 4, v5 = v8, !v4))
  {
    v6 = *(void **)(a1 + 32);
    objc_msgSend(v8, "uniqueID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v7);

    v5 = v8;
  }

}

- (id)deferredPaymentPassWithUniqueID:(id)a3 forDevice:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v12[4];
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v6 = a3;
  v7 = a4;
  -[NPKCompanionAgentConnectionDeferredActionHandler deferredPaymentPassesForDevice:](self, "deferredPaymentPassesForDevice:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__5;
  v19 = __Block_byref_object_dispose__5;
  v20 = 0;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __94__NPKCompanionAgentConnectionDeferredActionHandler_deferredPaymentPassWithUniqueID_forDevice___block_invoke;
  v12[3] = &unk_24CFE9538;
  v9 = v6;
  v13 = v9;
  v14 = &v15;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v12);
  v10 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v10;
}

void __94__NPKCompanionAgentConnectionDeferredActionHandler_deferredPaymentPassWithUniqueID_forDevice___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v6;
  int v7;
  id v8;

  v8 = a2;
  objc_msgSend(v8, "uniqueID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v7)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a3 = 1;
  }

}

- (void)_performDeferredActions
{
  NSObject *v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  NPKCompanionAgentConnection *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NPKCompanionAgentConnection *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  NPKCompanionAgentConnection *v19;
  uint8_t buf[16];

  -[NPKCompanionAgentConnectionDeferredActionHandler internalQueue](self, "internalQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  pk_Payment_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    pk_Payment_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_213518000, v6, OS_LOG_TYPE_DEFAULT, "Notice: Performing deferred actions…", buf, 2u);
    }

  }
  v7 = objc_alloc_init(NPKCompanionAgentConnection);
  -[NPKCompanionAgentConnection setQueueAppropriateFailedActions:](v7, "setQueueAppropriateFailedActions:", 1);
  -[NPKCompanionAgentConnectionDeferredActionHandler deferredActions](self, "deferredActions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copy");

  -[NPKCompanionAgentConnectionDeferredActionHandler deferredSharedPaymentWebServiceContexts](self, "deferredSharedPaymentWebServiceContexts");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "copy");

  -[NPKCompanionAgentConnectionDeferredActionHandler deferredActions](self, "deferredActions");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "removeAllObjects");

  -[NPKCompanionAgentConnectionDeferredActionHandler deferredSharedPaymentWebServiceContexts](self, "deferredSharedPaymentWebServiceContexts");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "removeAllObjects");

  objc_msgSend(v11, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_52);
  objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_55);
  dispatch_get_global_queue(0, 0);
  v14 = objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __75__NPKCompanionAgentConnectionDeferredActionHandler__performDeferredActions__block_invoke_56;
  v17[3] = &unk_24CFE7E40;
  v18 = v9;
  v19 = v7;
  v15 = v7;
  v16 = v9;
  dispatch_async(v14, v17);

}

void __75__NPKCompanionAgentConnectionDeferredActionHandler__performDeferredActions__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  NSObject *v8;
  int v9;
  id v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  v5 = a3;
  pk_Payment_log();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

  if (v7)
  {
    pk_Payment_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138412546;
      v10 = v4;
      v11 = 2112;
      v12 = v5;
      _os_log_impl(&dword_213518000, v8, OS_LOG_TYPE_DEFAULT, "Notice: Pairing ID %@: shared web service context %@", (uint8_t *)&v9, 0x16u);
    }

  }
}

void __75__NPKCompanionAgentConnectionDeferredActionHandler__performDeferredActions__block_invoke_53(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  NSObject *v8;
  int v9;
  id v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  v5 = a3;
  pk_Payment_log();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

  if (v7)
  {
    pk_Payment_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138412546;
      v10 = v4;
      v11 = 1024;
      v12 = objc_msgSend(v5, "count");
      _os_log_impl(&dword_213518000, v8, OS_LOG_TYPE_DEFAULT, "Notice: Pairing ID %@: %u actions", (uint8_t *)&v9, 0x12u);
    }

  }
}

void __75__NPKCompanionAgentConnectionDeferredActionHandler__performDeferredActions__block_invoke_56(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __75__NPKCompanionAgentConnectionDeferredActionHandler__performDeferredActions__block_invoke_2;
  v2[3] = &unk_24CFE9630;
  v1 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  objc_msgSend(v1, "enumerateKeysAndObjectsUsingBlock:", v2);

}

void __75__NPKCompanionAgentConnectionDeferredActionHandler__performDeferredActions__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  _QWORD v4[4];
  id v5;

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __75__NPKCompanionAgentConnectionDeferredActionHandler__performDeferredActions__block_invoke_3;
  v4[3] = &unk_24CFE9608;
  v5 = *(id *)(a1 + 32);
  objc_msgSend(a3, "enumerateObjectsUsingBlock:", v4);

}

uint64_t __75__NPKCompanionAgentConnectionDeferredActionHandler__performDeferredActions__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, _QWORD))(a2 + 16))(a2, *(_QWORD *)(a1 + 32));
}

- (void)_cleanUpDeferredDataForPairingID:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  _BOOL4 v11;
  NSObject *v12;
  void *v13;
  void *v14;
  int v15;
  id v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[NPKCompanionAgentConnectionDeferredActionHandler internalQueue](self, "internalQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[NPKCompanionAgentConnectionDeferredActionHandler deferredActions](self, "deferredActions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[NPKCompanionAgentConnectionDeferredActionHandler deferredSharedPaymentWebServiceContexts](self, "deferredSharedPaymentWebServiceContexts");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  pk_Payment_log();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

  if (v11)
  {
    pk_Payment_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 138412802;
      v16 = v4;
      v17 = 1024;
      v18 = objc_msgSend(v7, "count");
      v19 = 2112;
      v20 = v9;
      _os_log_impl(&dword_213518000, v12, OS_LOG_TYPE_DEFAULT, "Notice: Removing deferred data for pairing ID %@ (deferred action count %u deferred shared context %@)", (uint8_t *)&v15, 0x1Cu);
    }

  }
  -[NPKCompanionAgentConnectionDeferredActionHandler deferredActions](self, "deferredActions");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "removeObjectForKey:", v4);

  -[NPKCompanionAgentConnectionDeferredActionHandler deferredSharedPaymentWebServiceContexts](self, "deferredSharedPaymentWebServiceContexts");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "removeObjectForKey:", v4);

}

- (void)_handleCompanionAgentStarted
{
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  uint8_t v6[16];

  pk_Payment_log();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    pk_Payment_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_213518000, v5, OS_LOG_TYPE_DEFAULT, "Notice: Deferred action handler: companion agent started", v6, 2u);
    }

  }
  -[NPKCompanionAgentConnectionDeferredActionHandler _performDeferredActions](self, "_performDeferredActions");
}

- (void)_handleDeviceBecameActive:(id)a3
{
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  NSObject *v7;
  _QWORD block[5];
  uint8_t buf[16];

  pk_Payment_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    pk_Payment_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_213518000, v6, OS_LOG_TYPE_DEFAULT, "Notice: Deferred action handler: device became active", buf, 2u);
    }

  }
  -[NPKCompanionAgentConnectionDeferredActionHandler internalQueue](self, "internalQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __78__NPKCompanionAgentConnectionDeferredActionHandler__handleDeviceBecameActive___block_invoke;
  block[3] = &unk_24CFE7998;
  block[4] = self;
  dispatch_async(v7, block);

}

uint64_t __78__NPKCompanionAgentConnectionDeferredActionHandler__handleDeviceBecameActive___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_performDeferredActions");
}

- (void)_handleDevicePaired:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  -[NPKCompanionAgentConnectionDeferredActionHandler internalQueue](self, "internalQueue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __72__NPKCompanionAgentConnectionDeferredActionHandler__handleDevicePaired___block_invoke;
  block[3] = &unk_24CFE7998;
  block[4] = self;
  dispatch_async(v4, block);

}

uint64_t __72__NPKCompanionAgentConnectionDeferredActionHandler__handleDevicePaired___block_invoke(uint64_t a1)
{
  NSObject *v2;
  _BOOL4 v3;
  NSObject *v4;
  uint8_t v6[16];

  pk_Payment_log();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    pk_Payment_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_213518000, v4, OS_LOG_TYPE_DEFAULT, "Notice: Deferred action handler: device paired", v6, 2u);
    }

  }
  return objc_msgSend(*(id *)(a1 + 32), "_performDeferredActions");
}

- (void)_handleDeviceUnpaired:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  NPKCompanionAgentConnectionDeferredActionHandler *v9;

  v4 = a3;
  -[NPKCompanionAgentConnectionDeferredActionHandler internalQueue](self, "internalQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __74__NPKCompanionAgentConnectionDeferredActionHandler__handleDeviceUnpaired___block_invoke;
  v7[3] = &unk_24CFE7E40;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __74__NPKCompanionAgentConnectionDeferredActionHandler__handleDeviceUnpaired___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *MEMORY[0x24BE6B418]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "valueForProperty:", *MEMORY[0x24BE6B3A8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  pk_Payment_log();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    pk_Payment_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138412290;
      v9 = v4;
      _os_log_impl(&dword_213518000, v7, OS_LOG_TYPE_DEFAULT, "Notice: Deferred action handler: device unpaired (pairing ID %@)", (uint8_t *)&v8, 0xCu);
    }

  }
  if (v4)
    objc_msgSend(*(id *)(a1 + 40), "_cleanUpDeferredDataForPairingID:", v4);

}

- (void)_handleDevicePairingFailure:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  -[NPKCompanionAgentConnectionDeferredActionHandler internalQueue](self, "internalQueue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __80__NPKCompanionAgentConnectionDeferredActionHandler__handleDevicePairingFailure___block_invoke;
  block[3] = &unk_24CFE7998;
  block[4] = self;
  dispatch_async(v4, block);

}

void __80__NPKCompanionAgentConnectionDeferredActionHandler__handleDevicePairingFailure___block_invoke(uint64_t a1)
{
  NSObject *v2;
  _BOOL4 v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[5];
  _QWORD v19[4];
  id v20;
  uint8_t buf[16];

  pk_Payment_log();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    pk_Payment_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_213518000, v4, OS_LOG_TYPE_DEFAULT, "Notice: Deferred action handler: device pairing failure", buf, 2u);
    }

  }
  objc_msgSend(MEMORY[0x24BE6B4E0], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "getPairedDevices");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __80__NPKCompanionAgentConnectionDeferredActionHandler__handleDevicePairingFailure___block_invoke_58;
  v19[3] = &unk_24CFE9658;
  v20 = v6;
  v9 = v6;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v19);
  v10 = (void *)MEMORY[0x24BDBCEF0];
  objc_msgSend(*(id *)(a1 + 32), "deferredActions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "allKeys");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setWithArray:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend(*(id *)(a1 + 32), "deferredActions");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "allKeys");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setWithArray:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "unionSet:", v17);

  objc_msgSend(v13, "minusSet:", v9);
  v18[0] = v8;
  v18[1] = 3221225472;
  v18[2] = __80__NPKCompanionAgentConnectionDeferredActionHandler__handleDevicePairingFailure___block_invoke_2;
  v18[3] = &unk_24CFE9680;
  v18[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v13, "enumerateObjectsUsingBlock:", v18);

}

void __80__NPKCompanionAgentConnectionDeferredActionHandler__handleDevicePairingFailure___block_invoke_58(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;

  objc_msgSend(a2, "valueForProperty:", *MEMORY[0x24BE6B3A8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);
    v3 = v4;
  }

}

uint64_t __80__NPKCompanionAgentConnectionDeferredActionHandler__handleDevicePairingFailure___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_cleanUpDeferredDataForPairingID:", a2);
}

- (NSMutableDictionary)deferredActions
{
  return self->_deferredActions;
}

- (void)setDeferredActions:(id)a3
{
  objc_storeStrong((id *)&self->_deferredActions, a3);
}

- (OS_dispatch_queue)internalQueue
{
  return self->_internalQueue;
}

- (void)setInternalQueue:(id)a3
{
  objc_storeStrong((id *)&self->_internalQueue, a3);
}

- (NSMutableDictionary)deferredSharedPaymentWebServiceContexts
{
  return self->_deferredSharedPaymentWebServiceContexts;
}

- (void)setDeferredSharedPaymentWebServiceContexts:(id)a3
{
  objc_storeStrong((id *)&self->_deferredSharedPaymentWebServiceContexts, a3);
}

- (NSMutableDictionary)deferredAddedPaymentPasses
{
  return self->_deferredAddedPaymentPasses;
}

- (void)setDeferredAddedPaymentPasses:(id)a3
{
  objc_storeStrong((id *)&self->_deferredAddedPaymentPasses, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deferredAddedPaymentPasses, 0);
  objc_storeStrong((id *)&self->_deferredSharedPaymentWebServiceContexts, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_deferredActions, 0);
}

@end
