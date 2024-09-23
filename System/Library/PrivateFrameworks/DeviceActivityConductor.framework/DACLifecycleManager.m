@implementation DACLifecycleManager

- (DACLifecycleManager)initWithDelegate:(id)a3 queue:(id)a4
{
  id v6;
  NSObject *v7;
  DACLifecycleManager *v8;
  DACLifecycleManager *v9;
  NSObject *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *delegateQueue;
  NSObject *v13;
  dispatch_queue_t v14;
  OS_dispatch_queue *queue;
  uint64_t v16;
  DACDeviceRole *role;
  DACActivityList *v18;
  DACActivityList *activityList;
  uint64_t v20;
  NSMutableSet *registeredActivities;
  uint64_t v22;
  NSMutableDictionary *assertions;
  NSObject *v24;
  _QWORD block[4];
  DACLifecycleManager *v27;
  objc_super v28;

  v6 = a3;
  v7 = a4;
  v28.receiver = self;
  v28.super_class = (Class)DACLifecycleManager;
  v8 = -[DACLifecycleManager init](&v28, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v6);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = dispatch_queue_create_with_target_V2("com.apple.DeviceActivityConductor.DACLifecycleManager.delegate", v10, v7);
    delegateQueue = v9->_delegateQueue;
    v9->_delegateQueue = (OS_dispatch_queue *)v11;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = dispatch_queue_create("com.apple.DeviceActivityConductor.DACLifecycleManager", v13);
    queue = v9->_queue;
    v9->_queue = (OS_dispatch_queue *)v14;

    +[DACDeviceRole unknownRole](DACDeviceRole, "unknownRole");
    v16 = objc_claimAutoreleasedReturnValue();
    role = v9->_role;
    v9->_role = (DACDeviceRole *)v16;

    v18 = objc_alloc_init(DACActivityList);
    activityList = v9->_activityList;
    v9->_activityList = v18;

    *(_WORD *)&v9->_shouldAttemptReconnect = 0;
    v9->_resetNotifyToken = -1;
    v9->_subscriptionActive = 0;
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v20 = objc_claimAutoreleasedReturnValue();
    registeredActivities = v9->_registeredActivities;
    v9->_registeredActivities = (NSMutableSet *)v20;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v22 = objc_claimAutoreleasedReturnValue();
    assertions = v9->_assertions;
    v9->_assertions = (NSMutableDictionary *)v22;

    v24 = v9->_queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __46__DACLifecycleManager_initWithDelegate_queue___block_invoke;
    block[3] = &unk_24ED13508;
    v27 = v9;
    dispatch_async(v24, block);

  }
  return v9;
}

void __46__DACLifecycleManager_initWithDelegate_queue___block_invoke(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)

  else
}

- (void)dealloc
{
  id WeakRetained;
  objc_super v4;

  if (notify_is_valid_token(self->_resetNotifyToken))
    notify_cancel(self->_resetNotifyToken);
  WeakRetained = objc_loadWeakRetained((id *)&self->_currentConnection);
  objc_msgSend(WeakRetained, "invalidate");

  v4.receiver = self;
  v4.super_class = (Class)DACLifecycleManager;
  -[DACLifecycleManager dealloc](&v4, sel_dealloc);
}

- (void)registerActivity:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __40__DACLifecycleManager_registerActivity___block_invoke;
  v7[3] = &unk_24ED13280;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

uint64_t __40__DACLifecycleManager_registerActivity___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, void *);
  void *v10;
  id v11;
  id location;

  v2 = *(_QWORD *)(a1 + 32);
  if (!v2)
    goto LABEL_6;
  if (!*(_BYTE *)(v2 + 10))
    goto LABEL_4;
  objc_initWeak(&location, (id)v2);
  v3 = *(_QWORD *)(a1 + 32);
  v7 = MEMORY[0x24BDAC760];
  v8 = 3221225472;
  v9 = __40__DACLifecycleManager_registerActivity___block_invoke_2;
  v10 = &unk_24ED13530;
  objc_copyWeak(&v11, &location);
  -[DACLifecycleManager _remoteInterfaceWithErrorHandler:](v3, &v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerActivity:", *(_QWORD *)(a1 + 40), v7, v8, v9, v10);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
LABEL_4:
    v5 = *(void **)(v2 + 64);
  else
LABEL_6:
    v5 = 0;
  return objc_msgSend(v5, "addObject:", *(_QWORD *)(a1 + 40));
}

void __40__DACLifecycleManager_registerActivity___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  NSObject *v6;
  int v7;
  void *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (v3 && WeakRetained)
  {
    DACLogForCategory(0);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = 134218242;
      v8 = v5;
      v9 = 2112;
      v10 = v3;
      _os_log_error_impl(&dword_224FBF000, v6, OS_LOG_TYPE_ERROR, "%p failed to get DACLifecycleManager remote proxy for activity registration - %@", (uint8_t *)&v7, 0x16u);
    }

  }
}

- (id)_remoteInterfaceWithErrorHandler:(uint64_t)a1
{
  id *v2;
  id v3;
  id WeakRetained;
  void *v5;

  if (a1)
  {
    v2 = (id *)(a1 + 56);
    v3 = a2;
    WeakRetained = objc_loadWeakRetained(v2);
    objc_msgSend(WeakRetained, "remoteObjectProxyWithErrorHandler:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (void)unregisterActivity:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __42__DACLifecycleManager_unregisterActivity___block_invoke;
  v7[3] = &unk_24ED13280;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __42__DACLifecycleManager_unregisterActivity___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, void *);
  void *v9;
  id v10;
  id location;

  objc_initWeak(&location, *(id *)(a1 + 32));
  v2 = *(_QWORD *)(a1 + 32);
  v6 = MEMORY[0x24BDAC760];
  v7 = 3221225472;
  v8 = __42__DACLifecycleManager_unregisterActivity___block_invoke_2;
  v9 = &unk_24ED13530;
  objc_copyWeak(&v10, &location);
  -[DACLifecycleManager _remoteInterfaceWithErrorHandler:](v2, &v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unregisterActivity:", *(_QWORD *)(a1 + 40), v6, v7, v8, v9);
  v4 = *(_QWORD **)(a1 + 32);
  if (v4)
    v4 = (_QWORD *)v4[8];
  v5 = v4;
  objc_msgSend(v5, "removeObject:", *(_QWORD *)(a1 + 40));

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __42__DACLifecycleManager_unregisterActivity___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  NSObject *v6;
  int v7;
  void *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (v3 && WeakRetained)
  {
    DACLogForCategory(0);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = 134218242;
      v8 = v5;
      v9 = 2112;
      v10 = v3;
      _os_log_error_impl(&dword_224FBF000, v6, OS_LOG_TYPE_ERROR, "%p failed to get DACLifecycleManager remote proxy for activity unregistration - %@", (uint8_t *)&v7, 0x16u);
    }

  }
}

- (void)lifecycleStateOfActivity:(id)a3 result:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __55__DACLifecycleManager_lifecycleStateOfActivity_result___block_invoke;
  block[3] = &unk_24ED13608;
  v12 = v6;
  v13 = v7;
  block[4] = self;
  v9 = v6;
  v10 = v7;
  dispatch_async(queue, block);

}

void __55__DACLifecycleManager_lifecycleStateOfActivity_result___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;
  NSObject *v5;
  _QWORD *v6;
  _QWORD block[4];
  id v8;
  id v9;
  id v10;

  v2 = *(_QWORD **)(a1 + 32);
  if (v2)
    v2 = (_QWORD *)v2[6];
  v3 = v2;
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    v5 = *(NSObject **)(v4 + 32);
  else
    v5 = 0;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __55__DACLifecycleManager_lifecycleStateOfActivity_result___block_invoke_2;
  block[3] = &unk_24ED13608;
  v10 = *(id *)(a1 + 48);
  v8 = v3;
  v9 = *(id *)(a1 + 40);
  v6 = v3;
  dispatch_async(v5, block);

}

uint64_t __55__DACLifecycleManager_lifecycleStateOfActivity_result___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), objc_msgSend(*(id *)(a1 + 32), "stateOfActivity:", *(_QWORD *)(a1 + 40)));
}

- (void)enumerateLifecycleInfo:(id)a3
{
  id v4;
  NSObject *queue;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD block[6];
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
  v15 = __Block_byref_object_copy__1;
  v16 = __Block_byref_object_dispose__1;
  v17 = 0;
  queue = self->_queue;
  v6 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __46__DACLifecycleManager_enumerateLifecycleInfo___block_invoke;
  block[3] = &unk_24ED13258;
  block[4] = self;
  block[5] = &v12;
  dispatch_sync(queue, block);
  v7 = (void *)v13[5];
  v9[0] = v6;
  v9[1] = 3221225472;
  v9[2] = __46__DACLifecycleManager_enumerateLifecycleInfo___block_invoke_2;
  v9[3] = &unk_24ED13630;
  v8 = v4;
  v10 = v8;
  objc_msgSend(v7, "enumerate:", v9);

  _Block_object_dispose(&v12, 8);
}

void __46__DACLifecycleManager_enumerateLifecycleInfo___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
    v2 = *(void **)(v1 + 48);
  else
    v2 = 0;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v2);
}

uint64_t __46__DACLifecycleManager_enumerateLifecycleInfo___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)requestActivationOfActivity:(id)a3 requester:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  id v11;
  _QWORD v13[5];
  id v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v6 = a3;
  v7 = a4;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__1;
  v21 = __Block_byref_object_dispose__1;
  v22 = 0;
  queue = self->_queue;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __61__DACLifecycleManager_requestActivationOfActivity_requester___block_invoke;
  v13[3] = &unk_24ED13440;
  v13[4] = self;
  v14 = v6;
  v15 = v7;
  v16 = &v17;
  v9 = v7;
  v10 = v6;
  dispatch_sync(queue, v13);
  v11 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v11;
}

void __61__DACLifecycleManager_requestActivationOfActivity_requester___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  DACActivityAssertion *v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  _BYTE *v21;
  uint64_t v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  _QWORD v29[4];
  id v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  uint64_t v37;
  id *v38;
  uint64_t v39;
  void (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;
  id location;
  uint8_t buf[4];
  uint64_t v45;
  __int16 v46;
  uint64_t v47;
  __int16 v48;
  uint64_t v49;
  __int16 v50;
  id v51;
  __int16 v52;
  id v53;
  __int128 from;
  void (*v55)(uint64_t, void *, void *);
  void *v56;
  uint64_t *v57;
  uint64_t *v58;
  id v59[4];

  v59[1] = *(id *)MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 48);
  v4 = *(id *)(a1 + 40);
  v5 = v3;
  v6 = MEMORY[0x24BDAC760];
  if (v2)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(v2 + 24));
    objc_initWeak(&location, (id)v2);
    v37 = 0;
    v38 = (id *)&v37;
    v39 = 0x3042000000;
    v40 = __Block_byref_object_copy__16;
    v41 = __Block_byref_object_dispose__17;
    v42 = 0;
    v31 = 0;
    v32 = &v31;
    v33 = 0x3032000000;
    v34 = __Block_byref_object_copy__1;
    v35 = __Block_byref_object_dispose__1;
    v36 = 0;
    v7 = [DACActivityAssertion alloc];
    *(_QWORD *)&from = v6;
    *((_QWORD *)&from + 1) = 3221225472;
    v55 = __55__DACLifecycleManager__assertionForActivity_requester___block_invoke;
    v56 = &unk_24ED13680;
    objc_copyWeak(v59, &location);
    v57 = &v37;
    v58 = &v31;
    v8 = -[DACActivityAssertion _initWithActivity:requester:changeMarker:relinquishHandler:](v7, "_initWithActivity:requester:changeMarker:relinquishHandler:", v4, v5, 0, &from);
    objc_storeWeak(v38 + 5, v8);
    objc_msgSend(v8, "changeMarker");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v32[5];
    v32[5] = v9;

    v11 = *(id *)(v2 + 72);
    objc_msgSend(v11, "objectForKey:", v4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
      objc_msgSend(MEMORY[0x24BDD1748], "weakObjectsPointerArray");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = *(id *)(v2 + 72);
      objc_msgSend(v13, "setObject:forKey:", v12, v4);

    }
    objc_msgSend(v12, "addPointer:", v8);
    DACLogForCategory(2);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = objc_msgSend(v12, "count");
      v16 = *(id *)(v2 + 72);
      v17 = objc_msgSend(v16, "count");
      *(_DWORD *)buf = 134219010;
      v45 = v2;
      v46 = 2048;
      v47 = v15;
      v48 = 2048;
      v49 = v17;
      v50 = 2048;
      v51 = v8;
      v52 = 2114;
      v53 = v4;
      _os_log_impl(&dword_224FBF000, v14, OS_LOG_TYPE_DEFAULT, "%p now %lu (%lu unique) assertions after creating %p for %{public}@", buf, 0x34u);

      v6 = MEMORY[0x24BDAC760];
    }

    objc_destroyWeak(v59);
    _Block_object_dispose(&v31, 8);

    _Block_object_dispose(&v37, 8);
    objc_destroyWeak(&v42);
    objc_destroyWeak(&location);
  }
  else
  {
    v8 = 0;
  }

  v18 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v19 = *(void **)(v18 + 40);
  *(_QWORD *)(v18 + 40) = v8;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "changeMarker");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = *(_BYTE **)(a1 + 32);
  if (v21 && v21[10])
  {
    objc_initWeak((id *)&from, v21);
    v22 = *(_QWORD *)(a1 + 32);
    v29[0] = v6;
    v29[1] = 3221225472;
    v29[2] = __61__DACLifecycleManager_requestActivationOfActivity_requester___block_invoke_10;
    v29[3] = &unk_24ED13530;
    objc_copyWeak(&v30, (id *)&from);
    -[DACLifecycleManager _remoteInterfaceWithErrorHandler:](v22, v29);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "requestActivationOfActivity:requester:changeMarker:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v20);

    objc_destroyWeak(&v30);
    objc_destroyWeak((id *)&from);
  }
  else
  {
    DACLogForCategory(0);
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      v25 = *(_QWORD *)(a1 + 40);
      LODWORD(from) = 138543362;
      *(_QWORD *)((char *)&from + 4) = v25;
      _os_log_impl(&dword_224FBF000, v24, OS_LOG_TYPE_INFO, "offline activation of %{public}@", (uint8_t *)&from, 0xCu);
    }

    -[DACLifecycleManager _activateAssertionForActivity:withChangeMarker:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40), v20);
    v26 = *(_QWORD *)(a1 + 32);
    if (v26)
      v27 = *(void **)(v26 + 48);
    else
      v27 = 0;
    v28 = (void *)objc_msgSend(v27, "copy");
    objc_msgSend(v28, "addActivity:requester:changeMarker:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v20);
    objc_msgSend(*(id *)(a1 + 32), "activityListChanged:", v28);

  }
}

- (void)_activateAssertionForActivity:(void *)a3 withChangeMarker:
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  int v12;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  _BOOL4 v16;
  uint64_t v17;
  id location;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  id v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  id v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 24));
    objc_msgSend(*(id *)(a1 + 72), "objectForKey:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "count"))
    {
      v8 = 0;
      while (1)
      {
        v9 = (void *)objc_msgSend(v7, "pointerAtIndex:", v8);
        v10 = objc_initWeak(&location, v9);
        if (v9)
        {
          objc_msgSend(v9, "changeMarker");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v6, "isEqual:", v11);

          if (v12)
            break;
        }

        objc_destroyWeak(&location);
        if (++v8 >= (unint64_t)objc_msgSend(v7, "count"))
          goto LABEL_7;
      }
      v14 = objc_msgSend(v9, "state");
      DACLogForCategory(2);
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
      if (v14)
      {
        if (v16)
        {
          v17 = objc_msgSend(v9, "state");
          *(_DWORD *)buf = 134219010;
          v20 = a1;
          v21 = 2048;
          v22 = v9;
          v23 = 2048;
          v24 = v17;
          v25 = 2114;
          v26 = v5;
          v27 = 2114;
          v28 = v6;
          _os_log_impl(&dword_224FBF000, v15, OS_LOG_TYPE_DEFAULT, "%p not activating assertion %p in invalid state %lu for %{public}@ with %{public}@", buf, 0x34u);
        }

      }
      else
      {
        if (v16)
        {
          *(_DWORD *)buf = 134218754;
          v20 = a1;
          v21 = 2048;
          v22 = v9;
          v23 = 2114;
          v24 = (uint64_t)v5;
          v25 = 2114;
          v26 = v6;
          _os_log_impl(&dword_224FBF000, v15, OS_LOG_TYPE_DEFAULT, "%p activating assertion %p for %{public}@ with %{public}@", buf, 0x2Au);
        }

        objc_msgSend(v9, "setState:", 1);
      }

      objc_destroyWeak(&location);
    }
    else
    {
LABEL_7:
      DACLogForCategory(2);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218498;
        v20 = a1;
        v21 = 2114;
        v22 = v5;
        v23 = 2114;
        v24 = (uint64_t)v6;
        _os_log_error_impl(&dword_224FBF000, v13, OS_LOG_TYPE_ERROR, "%p no assertion for %{public}@ with %{public}@ to activate", buf, 0x20u);
      }

    }
  }

}

void __61__DACLifecycleManager_requestActivationOfActivity_requester___block_invoke_10(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  NSObject *v6;
  int v7;
  void *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (v3 && WeakRetained)
  {
    DACLogForCategory(0);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = 134218242;
      v8 = v5;
      v9 = 2112;
      v10 = v3;
      _os_log_error_impl(&dword_224FBF000, v6, OS_LOG_TYPE_ERROR, "%p failed to get DACLifecycleManager remote proxy for activity activation request - %@", (uint8_t *)&v7, 0x16u);
    }

  }
}

- (void)requestDeactivationOfActivity:(id)a3 requester:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __63__DACLifecycleManager_requestDeactivationOfActivity_requester___block_invoke;
  block[3] = &unk_24ED13468;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

void __63__DACLifecycleManager_requestDeactivationOfActivity_requester___block_invoke(uint64_t *a1)
{
  _BYTE *v2;
  uint64_t v3;
  void *v4;
  _QWORD *v5;
  _QWORD *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *);
  void *v19;
  id v20;
  id location;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v2 = (_BYTE *)a1[4];
  if (v2 && v2[10])
  {
    objc_initWeak(&location, v2);
    v3 = a1[4];
    v16 = MEMORY[0x24BDAC760];
    v17 = 3221225472;
    v18 = __63__DACLifecycleManager_requestDeactivationOfActivity_requester___block_invoke_11;
    v19 = &unk_24ED13530;
    objc_copyWeak(&v20, &location);
    -[DACLifecycleManager _remoteInterfaceWithErrorHandler:](v3, &v16);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (_QWORD *)a1[4];
    if (v5)
      v5 = (_QWORD *)v5[6];
    v6 = v5;
    objc_msgSend(v6, "changeMarkerForActivity:", a1[5], v16, v17, v18, v19);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      DACLogForCategory(0);
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v14 = a1[4];
        v15 = a1[5];
        *(_DWORD *)buf = 134218242;
        v23 = v14;
        v24 = 2114;
        v25 = v15;
        _os_log_error_impl(&dword_224FBF000, v8, OS_LOG_TYPE_ERROR, "%p requesting deactivation of non-active activity %{public}@", buf, 0x16u);
      }

      +[DACChangeMarker missingMarker](DACChangeMarker, "missingMarker");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v4, "requestDeactivationOfActivity:requester:changeMarker:", a1[5], a1[6], v7);

    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }
  else
  {
    DACLogForCategory(0);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = a1[5];
      *(_DWORD *)buf = 138543362;
      v23 = v10;
      _os_log_impl(&dword_224FBF000, v9, OS_LOG_TYPE_INFO, "offline deactivation of %{public}@", buf, 0xCu);
    }

    v11 = a1[4];
    if (v11)
      v12 = *(void **)(v11 + 48);
    else
      v12 = 0;
    v13 = (void *)objc_msgSend(v12, "copy");
    objc_msgSend(v13, "removeActivity:requester:", a1[5], a1[6]);
    objc_msgSend((id)a1[4], "activityListChanged:", v13);

  }
}

void __63__DACLifecycleManager_requestDeactivationOfActivity_requester___block_invoke_11(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  NSObject *v6;
  int v7;
  void *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (v3 && WeakRetained)
  {
    DACLogForCategory(0);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = 134218242;
      v8 = v5;
      v9 = 2112;
      v10 = v3;
      _os_log_error_impl(&dword_224FBF000, v6, OS_LOG_TYPE_ERROR, "%p failed to get DACLifecycleManager remote proxy for activity deactivation request - %@", (uint8_t *)&v7, 0x16u);
    }

  }
}

- (void)activityListChanged:(id)a3
{
  DACActivityList *v5;
  DACDeviceRole *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *delegateQueue;
  DACDeviceRole *v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  DACLifecycleManager *v17;
  DACDeviceRole *v18;
  _QWORD v19[5];

  if (self)
  {
    v5 = self->_activityList;
    v6 = self->_role;
    v7 = a3;
    objc_storeStrong((id *)&self->_activityList, a3);
  }
  else
  {
    v14 = a3;
    v6 = 0;
    v5 = 0;
  }
  objc_msgSend(a3, "changesFromList:includingMetadata:", v5, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __43__DACLifecycleManager_activityListChanged___block_invoke;
  v19[3] = &unk_24ED13558;
  v19[4] = self;
  objc_msgSend(v8, "enumerate:", v19);
  objc_msgSend(a3, "changesFromList:includingMetadata:", v5, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  delegateQueue = self->_delegateQueue;
  v15[0] = v9;
  v15[1] = 3221225472;
  v15[2] = __43__DACLifecycleManager_activityListChanged___block_invoke_14;
  v15[3] = &unk_24ED13468;
  v16 = v10;
  v17 = self;
  v18 = v6;
  v12 = v6;
  v13 = v10;
  dispatch_async(delegateQueue, v15);

}

uint64_t __43__DACLifecycleManager_activityListChanged___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  uint64_t v21;
  void *v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  _QWORD *v28;
  uint64_t v29;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _QWORD block[4];
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE location[12];
  __int16 v43;
  uint64_t v44;
  __int16 v45;
  uint64_t v46;
  __int16 v47;
  void *v48;
  _BYTE v49[128];
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v31 = a2;
  objc_msgSend(v31, "activity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v31, "state"))
  {
    v4 = *(_QWORD *)(a1 + 32);
    if (v4)
      v5 = *(void **)(v4 + 72);
    else
      v5 = 0;
    objc_msgSend(v5, "objectForKey:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v38, v50, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v39;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v39 != v10)
            objc_enumerationMutation(v8);
          v12 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * v11);
          v13 = objc_initWeak((id *)location, v12);
          if (v12 && objc_msgSend(v12, "state") == 1)
          {
            objc_msgSend(v7, "addObject:", v12);
            v14 = *(_QWORD *)(a1 + 32);
            if (v14)
              v15 = *(NSObject **)(v14 + 32);
            else
              v15 = 0;
            block[0] = MEMORY[0x24BDAC760];
            block[1] = 3221225472;
            block[2] = __43__DACLifecycleManager_activityListChanged___block_invoke_2;
            block[3] = &unk_24ED13508;
            v37 = v12;
            dispatch_async(v15, block);

          }
          objc_destroyWeak((id *)location);
          ++v11;
        }
        while (v9 != v11);
        v16 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v38, v50, 16);
        v9 = v16;
      }
      while (v16);
    }

    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v17 = v7;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v32, v49, 16);
    if (v18)
    {
      v19 = *(_QWORD *)v33;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v33 != v19)
            objc_enumerationMutation(v17);
          -[DACLifecycleManager _removeAssertion:forActivity:](*(_QWORD *)(a1 + 32), *(void **)(*((_QWORD *)&v32 + 1) + 8 * i), v3);
        }
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v32, v49, 16);
      }
      while (v18);
    }

    v21 = *(_QWORD *)(a1 + 32);
    if (v21)
      v22 = *(void **)(v21 + 72);
    else
      v22 = 0;
    objc_msgSend(v22, "objectForKey:", v3);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    DACLogForCategory(2);
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      v25 = *(_QWORD *)(a1 + 32);
      v26 = objc_msgSend(v23, "count");
      v27 = *(_QWORD **)(a1 + 32);
      if (v27)
        v27 = (_QWORD *)v27[9];
      v28 = v27;
      v29 = objc_msgSend(v28, "count");

      *(_DWORD *)location = 134218754;
      *(_QWORD *)&location[4] = v25;
      v43 = 2048;
      v44 = v26;
      v45 = 2048;
      v46 = v29;
      v47 = 2114;
      v48 = v3;
      _os_log_impl(&dword_224FBF000, v24, OS_LOG_TYPE_DEFAULT, "%p now %lu (%lu unique) assertions after deactivation of %{public}@", location, 0x2Au);
    }

  }
  return 1;
}

uint64_t __43__DACLifecycleManager_activityListChanged___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setState:", 2);
}

- (void)_removeAssertion:(void *)a3 forActivity:
{
  id v5;
  NSObject *v6;
  id v7;
  void *v8;
  unint64_t i;
  id v10;
  id v11;
  id v12;
  BOOL v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  id v20;
  id v21;
  uint64_t v22;
  id v23;
  id v24;
  id location;
  _BYTE v26[12];
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  unint64_t v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  objc_initWeak(&location, a2);
  v5 = a3;
  if (a1)
  {
    v6 = *(id *)(a1 + 24);
    dispatch_assert_queue_V2(v6);

    v7 = *(id *)(a1 + 72);
    objc_msgSend(v7, "objectForKey:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    for (i = 0; ; ++i)
    {
      if (i >= objc_msgSend(v8, "count"))
        goto LABEL_7;
      v10 = (id)objc_msgSend(v8, "pointerAtIndex:", i);
      v11 = objc_initWeak((id *)v26, v10);
      v12 = objc_loadWeakRetained(&location);
      v13 = v10 == v12;

      objc_destroyWeak((id *)v26);
      if (v13)
        break;
    }
    if (i == 0x7FFFFFFFFFFFFFFFLL)
    {
LABEL_7:
      DACLogForCategory(2);
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v23 = objc_loadWeakRetained(&location);
        *(_DWORD *)v26 = 134218498;
        *(_QWORD *)&v26[4] = a1;
        v27 = 2048;
        v28 = (uint64_t)v23;
        v29 = 2114;
        v30 = (unint64_t)v5;
        _os_log_error_impl(&dword_224FBF000, v14, OS_LOG_TYPE_ERROR, "%p unable to locate assertion %p for %{public}@", v26, 0x20u);

      }
      goto LABEL_13;
    }
    DACLogForCategory(2);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      v24 = objc_loadWeakRetained(&location);
      *(_DWORD *)v26 = 134218754;
      *(_QWORD *)&v26[4] = a1;
      v27 = 2048;
      v28 = (uint64_t)v24;
      v29 = 2048;
      v30 = i;
      v31 = 2114;
      v32 = v5;
      _os_log_debug_impl(&dword_224FBF000, v15, OS_LOG_TYPE_DEBUG, "%p removing assertion %p at %lu for %{public}@", v26, 0x2Au);

    }
    objc_msgSend(v8, "removePointerAtIndex:", i);
LABEL_13:
    if (objc_msgSend(v8, "count"))
    {
      DACLogForCategory(2);
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v17 = objc_msgSend(v8, "count");
        v18 = *(id *)(a1 + 72);
        v19 = objc_msgSend(v18, "count");
        *(_DWORD *)v26 = 134218754;
        *(_QWORD *)&v26[4] = a1;
        v27 = 2048;
        v28 = v17;
        v29 = 2048;
        v30 = v19;
        v31 = 2114;
        v32 = v5;
        _os_log_impl(&dword_224FBF000, v16, OS_LOG_TYPE_DEFAULT, "%p now %lu (%lu unique) assertions remain for %{public}@", v26, 0x2Au);

      }
    }
    else
    {
      v20 = *(id *)(a1 + 72);
      objc_msgSend(v20, "removeObjectForKey:", v5);

      DACLogForCategory(2);
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v21 = *(id *)(a1 + 72);
        v22 = objc_msgSend(v21, "count");
        *(_DWORD *)v26 = 134218498;
        *(_QWORD *)&v26[4] = a1;
        v27 = 2048;
        v28 = v22;
        v29 = 2114;
        v30 = (unint64_t)v5;
        _os_log_impl(&dword_224FBF000, v16, OS_LOG_TYPE_DEFAULT, "%p now %lu unique assertions after last assertion removal for %{public}@", v26, 0x20u);

      }
    }

  }
  objc_destroyWeak(&location);
}

void __43__DACLifecycleManager_activityListChanged___block_invoke_14(uint64_t a1)
{
  uint64_t v2;
  id WeakRetained;
  id v4;

  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v2 = *(_QWORD *)(a1 + 40);
    if (v2)
      WeakRetained = objc_loadWeakRetained((id *)(v2 + 16));
    else
      WeakRetained = 0;
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "lifecycleChanged:deviceRole:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));

  }
}

- (void)activatedAssertionForActivity:(id)a3 withChangeMarker:(id)a4
{
  -[DACLifecycleManager _activateAssertionForActivity:withChangeMarker:]((uint64_t)self, a3, a4);
}

- (void)roleChanged:(id)a3
{
  id v5;
  DACActivityList *activityList;
  DACActivityList *v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  NSObject *delegateQueue;
  _QWORD v13[5];
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;

  v5 = a3;
  if (self)
  {
    objc_storeStrong((id *)&self->_role, a3);
    activityList = self->_activityList;
  }
  else
  {
    activityList = 0;
  }
  v7 = activityList;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x24BDAC760];
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __35__DACLifecycleManager_roleChanged___block_invoke;
  v16[3] = &unk_24ED13558;
  v10 = v8;
  v17 = v10;
  -[DACActivityList enumerate:](v7, "enumerate:", v16);
  v11 = -[DACLifecycleChangelist _initWithLifecycleInfoArray:]([DACLifecycleChangelist alloc], "_initWithLifecycleInfoArray:", v10);
  if (objc_msgSend(v11, "count"))
  {
    delegateQueue = self->_delegateQueue;
    v13[0] = v9;
    v13[1] = 3221225472;
    v13[2] = __35__DACLifecycleManager_roleChanged___block_invoke_2;
    v13[3] = &unk_24ED13468;
    v13[4] = self;
    v14 = v11;
    v15 = v5;
    dispatch_async(delegateQueue, v13);

  }
}

uint64_t __35__DACLifecycleManager_roleChanged___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
  return 1;
}

void __35__DACLifecycleManager_roleChanged___block_invoke_2(_QWORD *a1)
{
  uint64_t v2;
  id WeakRetained;
  id v4;

  v2 = a1[4];
  if (v2)
    WeakRetained = objc_loadWeakRetained((id *)(v2 + 16));
  else
    WeakRetained = 0;
  v4 = WeakRetained;
  objc_msgSend(WeakRetained, "lifecycleChanged:deviceRole:", a1[5], a1[6]);

}

void __55__DACLifecycleManager__assertionForActivity_requester___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject **WeakRetained;
  NSObject **v8;
  NSObject *v9;
  _QWORD block[5];
  id v11;
  id v12;
  __int128 v13;

  v5 = a2;
  v6 = a3;
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 48));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    v9 = WeakRetained[3];
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __55__DACLifecycleManager__assertionForActivity_requester___block_invoke_2;
    block[3] = &unk_24ED13658;
    block[4] = WeakRetained;
    v13 = *(_OWORD *)(a1 + 32);
    v11 = v5;
    v12 = v6;
    dispatch_async(v9, block);

  }
}

void __55__DACLifecycleManager__assertionForActivity_requester___block_invoke_2(_QWORD *a1)
{
  uint64_t v2;
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  id v18;
  void *v19;
  NSObject *v20;
  id v21;
  void *v22;
  id v23;
  id from;
  id location;
  _BYTE buf[24];
  void *v27;
  __int16 v28;
  id v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v2 = a1[4];
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1[7] + 8) + 40));
  v4 = *(void **)(*(_QWORD *)(a1[8] + 8) + 40);
  v5 = (void *)a1[5];
  v6 = (void *)a1[6];
  v23 = WeakRetained;
  objc_initWeak(&location, WeakRetained);
  v7 = v4;
  v8 = v5;
  v9 = v6;
  if (v2)
  {
    v10 = *(id *)(v2 + 24);
    dispatch_assert_queue_V2(v10);

    v11 = objc_loadWeakRetained(&location);
    -[DACLifecycleManager _removeAssertion:forActivity:](v2, v11, v8);

    v12 = *(id *)(v2 + 72);
    objc_msgSend(v12, "objectForKey:", v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    DACLogForCategory(2);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = objc_msgSend(v13, "count");
      v16 = *(id *)(v2 + 72);
      v17 = objc_msgSend(v16, "count");
      v18 = objc_loadWeakRetained(&location);
      *(_DWORD *)buf = 134219010;
      *(_QWORD *)&buf[4] = v2;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = v15;
      *(_WORD *)&buf[22] = 2048;
      v27 = (void *)v17;
      v28 = 2048;
      v29 = v18;
      v30 = 2114;
      v31 = v8;
      _os_log_impl(&dword_224FBF000, v14, OS_LOG_TYPE_DEFAULT, "%p now %lu (%lu unique) assertions after relinquish of %p for %{public}@", buf, 0x34u);

    }
    if (objc_msgSend(v13, "count") || *(_BYTE *)(v2 + 10))
    {
      objc_initWeak(&from, (id)v2);
      *(_QWORD *)buf = MEMORY[0x24BDAC760];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __85__DACLifecycleManager__assertionRelinquished_withChangeMarker_forActivity_requester___block_invoke;
      v27 = &unk_24ED13530;
      objc_copyWeak((id *)&v28, &from);
      -[DACLifecycleManager _remoteInterfaceWithErrorHandler:](v2, buf);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "relinquishAssertionOfActivity:requester:changeMarker:", v8, v9, v7);

      objc_destroyWeak((id *)&v28);
      objc_destroyWeak(&from);
    }
    else
    {
      DACLogForCategory(0);
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134218242;
        *(_QWORD *)&buf[4] = v2;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v8;
        _os_log_impl(&dword_224FBF000, v20, OS_LOG_TYPE_INFO, "%p offline relinquish of %{public}@", buf, 0x16u);
      }

      v21 = *(id *)(v2 + 48);
      v22 = (void *)objc_msgSend(v21, "copy");

      objc_msgSend(v22, "removeActivity:requester:", v8, v9);
      objc_msgSend((id)v2, "activityListChanged:", v22);

    }
  }

  objc_destroyWeak(&location);
}

void __85__DACLifecycleManager__assertionRelinquished_withChangeMarker_forActivity_requester___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  NSObject *v6;
  int v7;
  void *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (v3 && WeakRetained)
  {
    DACLogForCategory(0);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = 134218242;
      v8 = v5;
      v9 = 2112;
      v10 = v3;
      _os_log_error_impl(&dword_224FBF000, v6, OS_LOG_TYPE_ERROR, "%p failed to get DACLifecycleManager remote proxy for activity relinquish request - %@", (uint8_t *)&v7, 0x16u);
    }

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assertions, 0);
  objc_storeStrong((id *)&self->_registeredActivities, 0);
  objc_destroyWeak((id *)&self->_currentConnection);
  objc_storeStrong((id *)&self->_activityList, 0);
  objc_storeStrong((id *)&self->_role, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
