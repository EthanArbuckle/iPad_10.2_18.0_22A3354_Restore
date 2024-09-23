@implementation DNDMeDeviceService

+ (id)serviceForClientIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD block[4];
  id v10;
  uint64_t *v11;
  id v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  if (serviceForClientIdentifier__onceToken_0 != -1)
    dispatch_once(&serviceForClientIdentifier__onceToken_0, &__block_literal_global_0);
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__0;
  v17 = __Block_byref_object_dispose__0;
  v18 = 0;
  v5 = serviceForClientIdentifier__lockQueue_0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__DNDMeDeviceService_serviceForClientIdentifier___block_invoke_2;
  block[3] = &unk_1E39B55E8;
  v10 = v4;
  v11 = &v13;
  v12 = a1;
  v6 = v4;
  dispatch_sync(v5, block);
  v7 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v7;
}

void __49__DNDMeDeviceService_serviceForClientIdentifier___block_invoke()
{
  NSObject *v0;
  dispatch_queue_t v1;
  void *v2;
  uint64_t v3;
  void *v4;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = dispatch_queue_create("com.apple.donotdisturb.DNDMeDeviceService.service.lock", v0);
  v2 = (void *)serviceForClientIdentifier__lockQueue_0;
  serviceForClientIdentifier__lockQueue_0 = (uint64_t)v1;

  objc_msgSend(MEMORY[0x1E0CB3748], "mapTableWithKeyOptions:valueOptions:", 0, 517);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)serviceForClientIdentifier__serviceByClientIdentifier_0;
  serviceForClientIdentifier__serviceByClientIdentifier_0 = v3;

}

void __49__DNDMeDeviceService_serviceForClientIdentifier___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  objc_msgSend((id)serviceForClientIdentifier__serviceByClientIdentifier_0, "objectForKey:", *(_QWORD *)(a1 + 32));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    v5 = objc_msgSend(objc_alloc(*(Class *)(a1 + 48)), "_initWithClientIdentifier:", *(_QWORD *)(a1 + 32));
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

    objc_msgSend((id)serviceForClientIdentifier__serviceByClientIdentifier_0, "setObject:forKey:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(_QWORD *)(a1 + 32));
  }
}

- (void)queryCurrentStateWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *queue;
  id v7;
  NSObject *v8;
  _QWORD block[4];
  NSObject *v10;
  DNDMeDeviceService *v11;
  id v12;
  os_activity_scope_state_s state;

  v4 = a3;
  v5 = _os_activity_create(&dword_19ABEB000, "com.apple.donotdisturb.DNDMeDeviceService.queryCurrentState.async", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__DNDMeDeviceService_queryCurrentStateWithCompletionHandler___block_invoke;
  block[3] = &unk_1E39B5700;
  v10 = v5;
  v11 = self;
  v12 = v4;
  v7 = v4;
  v8 = v5;
  dispatch_async(queue, block);

  os_activity_scope_leave(&state);
}

void __61__DNDMeDeviceService_queryCurrentStateWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;
  id v11;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(*(os_activity_t *)(a1 + 32), &state);
  +[DNDRequestDetails detailsRepresentingNowWithClientIdentifier:](DNDRequestDetails, "detailsRepresentingNowWithClientIdentifier:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = DNDLogMeDeviceService;
  if (os_log_type_enabled((os_log_t)DNDLogMeDeviceService, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v14 = v2;
    _os_log_impl(&dword_19ABEB000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Processing async 'Me Device' state request", buf, 0xCu);
  }
  +[DNDRemoteServiceConnection sharedInstance](DNDRemoteServiceConnection, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __61__DNDMeDeviceService_queryCurrentStateWithCompletionHandler___block_invoke_5;
  v8[3] = &unk_1E39B56D8;
  v5 = v2;
  v6 = *(_QWORD *)(a1 + 40);
  v7 = *(void **)(a1 + 48);
  v9 = v5;
  v10 = v6;
  v11 = v7;
  objc_msgSend(v4, "queryMeDeviceStateWithRequestDetails:completionHandler:", v5, v8);

  os_activity_scope_leave(&state);
}

void __61__DNDMeDeviceService_queryCurrentStateWithCompletionHandler___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id v17;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = DNDLogMeDeviceService;
    if (os_log_type_enabled((os_log_t)DNDLogMeDeviceService, OS_LOG_TYPE_ERROR))
      __61__DNDMeDeviceService_queryCurrentStateWithCompletionHandler___block_invoke_5_cold_1(a1, (uint64_t)v6, v7);
  }
  v8 = *(void **)(a1 + 32);
  v9 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 16);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __61__DNDMeDeviceService_queryCurrentStateWithCompletionHandler___block_invoke_6;
  v13[3] = &unk_1E39B56B0;
  v14 = v8;
  v15 = v5;
  v10 = *(id *)(a1 + 48);
  v16 = v6;
  v17 = v10;
  v11 = v6;
  v12 = v5;
  dispatch_async(v9, v13);

}

void __61__DNDMeDeviceService_queryCurrentStateWithCompletionHandler___block_invoke_6(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  void *v7;
  DNDMeDeviceState *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = (void *)DNDLogMeDeviceService;
  if (os_log_type_enabled((os_log_t)DNDLogMeDeviceService, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v3 = *(void **)(a1 + 40);
    v5 = v2;
    DNDMeDeviceStatusToString(objc_msgSend(v3, "meDeviceStatus"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "meDeviceName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543874;
    v10 = v4;
    v11 = 2114;
    v12 = v6;
    v13 = 2114;
    v14 = v7;
    _os_log_impl(&dword_19ABEB000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Got current 'Me Device' state, meDeviceStatus=%{public}@, meDeviceName=%{public}@", (uint8_t *)&v9, 0x20u);

  }
  v8 = (DNDMeDeviceState *)*(id *)(a1 + 40);
  if (!v8)
    v8 = -[DNDMeDeviceState initWithStatus:name:]([DNDMeDeviceState alloc], "initWithStatus:name:", 0, 0);
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

- (void)addListener:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *queue;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  DNDMeDeviceService *v14;
  id v15;
  os_activity_scope_state_s state;

  v6 = a3;
  v7 = a4;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  v8 = _os_activity_create(&dword_19ABEB000, "com.apple.donotdisturb.DNDMeDeviceService.addListener", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v8, &state);
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__DNDMeDeviceService_addListener_withCompletionHandler___block_invoke;
  block[3] = &unk_1E39B5700;
  v13 = v6;
  v14 = self;
  v15 = v7;
  v10 = v7;
  v11 = v6;
  dispatch_sync(queue, block);

}

void __56__DNDMeDeviceService_addListener_withCompletionHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  char v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  _QWORD v10[4];
  id v11;
  char v12;
  uint8_t buf[4];
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = DNDLogMeDeviceService;
  if (os_log_type_enabled((os_log_t)DNDLogMeDeviceService, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v14 = v3;
    _os_log_impl(&dword_19ABEB000, v2, OS_LOG_TYPE_DEFAULT, "Adding 'Me Device' state update listener: listener=%{public}@", buf, 0xCu);
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "addObject:", *(_QWORD *)(a1 + 32));
  v4 = objc_msgSend(*(id *)(a1 + 40), "_queue_registerForStateUpdatesIfRequired");
  v5 = v4;
  v6 = DNDLogMeDeviceService;
  if (v4)
  {
    if (os_log_type_enabled((os_log_t)DNDLogMeDeviceService, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      v14 = v7;
      _os_log_impl(&dword_19ABEB000, v6, OS_LOG_TYPE_DEFAULT, "Registered for 'Me Device' state updates: listener=%{public}@", buf, 0xCu);
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)DNDLogMeDeviceService, OS_LOG_TYPE_ERROR))
      __56__DNDMeDeviceService_addListener_withCompletionHandler___block_invoke_cold_1((uint64_t *)(a1 + 32), v6);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "removeObject:", *(_QWORD *)(a1 + 32));
  }
  v8 = *(void **)(a1 + 48);
  if (v8)
  {
    v9 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 16);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __56__DNDMeDeviceService_addListener_withCompletionHandler___block_invoke_9;
    v10[3] = &unk_1E39B5728;
    v11 = v8;
    v12 = v5;
    dispatch_async(v9, v10);

  }
}

uint64_t __56__DNDMeDeviceService_addListener_withCompletionHandler___block_invoke_9(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40), 0);
}

- (void)removeListener:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *queue;
  id v7;
  _QWORD v8[4];
  id v9;
  DNDMeDeviceService *v10;
  os_activity_scope_state_s state;

  v4 = a3;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  v5 = _os_activity_create(&dword_19ABEB000, "com.apple.donotdisturb.DNDMeDeviceService.removeListener", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v5, &state);
  queue = self->_queue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __37__DNDMeDeviceService_removeListener___block_invoke;
  v8[3] = &unk_1E39B5750;
  v9 = v4;
  v10 = self;
  v7 = v4;
  dispatch_sync(queue, v8);

}

uint64_t __37__DNDMeDeviceService_removeListener___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = DNDLogMeDeviceService;
  if (os_log_type_enabled((os_log_t)DNDLogMeDeviceService, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 138543362;
    v6 = v3;
    _os_log_impl(&dword_19ABEB000, v2, OS_LOG_TYPE_DEFAULT, "Removing 'Me Device' state update listener: listener=%{public}@", (uint8_t *)&v5, 0xCu);
  }
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "removeObject:", *(_QWORD *)(a1 + 32));
}

- (void)remoteService:(id)a3 didReceiveUpdatedMeDeviceState:(id)a4
{
  id v5;
  NSObject *queue;
  id v7;
  _QWORD block[4];
  id v9;
  DNDMeDeviceService *v10;

  v5 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__DNDMeDeviceService_remoteService_didReceiveUpdatedMeDeviceState___block_invoke;
  block[3] = &unk_1E39B5750;
  v9 = v5;
  v10 = self;
  v7 = v5;
  dispatch_sync(queue, block);

}

void __67__DNDMeDeviceService_remoteService_didReceiveUpdatedMeDeviceState___block_invoke(uint64_t a1)
{
  DNDMeDeviceState *v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  DNDMeDeviceState *v6;
  id v7;
  _QWORD block[4];
  id v9;
  uint64_t v10;
  DNDMeDeviceState *v11;

  v2 = (DNDMeDeviceState *)*(id *)(a1 + 32);
  if (!v2)
    v2 = -[DNDMeDeviceState initWithStatus:name:]([DNDMeDeviceState alloc], "initWithStatus:name:", 0, 0);
  v3 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "copy");
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(NSObject **)(v4 + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__DNDMeDeviceService_remoteService_didReceiveUpdatedMeDeviceState___block_invoke_2;
  block[3] = &unk_1E39B5778;
  v9 = v3;
  v10 = v4;
  v11 = v2;
  v6 = v2;
  v7 = v3;
  dispatch_async(v5, block);

}

void __67__DNDMeDeviceService_remoteService_didReceiveUpdatedMeDeviceState___block_invoke_2(uint64_t a1)
{
  id v2;
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

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = *(id *)(a1 + 32);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "meDeviceService:didReceiveMeDeviceState:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (id)_initWithClientIdentifier:(id)a3
{
  id v4;
  DNDMeDeviceService *v5;
  uint64_t v6;
  NSString *clientIdentifier;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *queue;
  NSObject *v11;
  dispatch_queue_t v12;
  OS_dispatch_queue *calloutQueue;
  uint64_t v14;
  NSHashTable *listeners;
  void *v16;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)DNDMeDeviceService;
  v5 = -[DNDMeDeviceService init](&v18, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    clientIdentifier = v5->_clientIdentifier;
    v5->_clientIdentifier = (NSString *)v6;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = dispatch_queue_create("com.apple.donotdisturb.DNDMeDeviceService", v8);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v9;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = dispatch_queue_create("com.apple.donotdisturb.DNDMeDeviceService.call-out", v11);
    calloutQueue = v5->_calloutQueue;
    v5->_calloutQueue = (OS_dispatch_queue *)v12;

    objc_msgSend(MEMORY[0x1E0CB3690], "hashTableWithOptions:", 517);
    v14 = objc_claimAutoreleasedReturnValue();
    listeners = v5->_listeners;
    v5->_listeners = (NSHashTable *)v14;

    +[DNDRemoteServiceConnection sharedInstance](DNDRemoteServiceConnection, "sharedInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addEventListener:", v5);

  }
  return v5;
}

- (BOOL)_queue_registerForStateUpdatesIfRequired
{
  NSObject *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;
  os_activity_scope_state_s state;
  __int128 buf;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (-[NSHashTable count](self->_listeners, "count") && !self->_registeredForUpdates)
  {
    v3 = _os_activity_create(&dword_19ABEB000, "com.apple.donotdisturb.DNDMeDeviceService.registerForUpdates", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v3, &state);
    +[DNDRequestDetails detailsRepresentingNowWithClientIdentifier:](DNDRequestDetails, "detailsRepresentingNowWithClientIdentifier:", self->_clientIdentifier);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = DNDLogMeDeviceService;
    if (os_log_type_enabled((os_log_t)DNDLogMeDeviceService, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = v4;
      _os_log_impl(&dword_19ABEB000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Registering 'Me Device' state update listener", (uint8_t *)&buf, 0xCu);
    }
    v10 = 0;
    v11 = &v10;
    v12 = 0x2020000000;
    v13 = 0;
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v16 = 0x3032000000;
    v17 = __Block_byref_object_copy__0;
    v18 = __Block_byref_object_dispose__0;
    v19 = 0;
    +[DNDRemoteServiceConnection sharedInstance](DNDRemoteServiceConnection, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __62__DNDMeDeviceService__queue_registerForStateUpdatesIfRequired__block_invoke;
    v9[3] = &unk_1E39B57A0;
    v9[4] = &v10;
    v9[5] = &buf;
    objc_msgSend(v6, "registerForMeDeviceStateUpdatesWithRequestDetails:completionHandler:", v4, v9);

    if (*(_QWORD *)(*((_QWORD *)&buf + 1) + 40))
    {
      v7 = DNDLogMeDeviceService;
      if (os_log_type_enabled((os_log_t)DNDLogMeDeviceService, OS_LOG_TYPE_ERROR))
        -[DNDMeDeviceService _queue_registerForStateUpdatesIfRequired].cold.1((uint64_t)v4, (uint64_t)&buf + 8, v7);
    }
    self->_registeredForUpdates = *((_BYTE *)v11 + 24);
    _Block_object_dispose(&buf, 8);

    _Block_object_dispose(&v10, 8);
    os_activity_scope_leave(&state);

  }
  return !-[NSHashTable count](self->_listeners, "count") || self->_registeredForUpdates;
}

void __62__DNDMeDeviceService__queue_registerForStateUpdatesIfRequired__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  uint64_t v7;
  void *v8;

  v6 = a4;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(a2, "BOOLValue");
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_listeners, 0);
  objc_storeStrong((id *)&self->_calloutQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __61__DNDMeDeviceService_queryCurrentStateWithCompletionHandler___block_invoke_5_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138543618;
  *(_QWORD *)&v3[4] = *(_QWORD *)(a1 + 32);
  *(_WORD *)&v3[12] = 2114;
  *(_QWORD *)&v3[14] = a2;
  OUTLINED_FUNCTION_0(&dword_19ABEB000, a2, a3, "[%{public}@] Error when getting 'Me Device' state, error='%{public}@'", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  OUTLINED_FUNCTION_1();
}

void __56__DNDMeDeviceService_addListener_withCompletionHandler___block_invoke_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *a1;
  v3 = 138543362;
  v4 = v2;
  _os_log_error_impl(&dword_19ABEB000, a2, OS_LOG_TYPE_ERROR, "Did not register for 'Me Device' state updates, will remove listener: listener=%{public}@", (uint8_t *)&v3, 0xCu);
  OUTLINED_FUNCTION_1();
}

- (void)_queue_registerForStateUpdatesIfRequired
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138543618;
  *(_QWORD *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2114;
  *(_QWORD *)&v3[14] = *(_QWORD *)(*(_QWORD *)a2 + 40);
  OUTLINED_FUNCTION_0(&dword_19ABEB000, a2, a3, "[%{public}@] Error when registering 'Me Device' state update listener, error='%{public}@'", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  OUTLINED_FUNCTION_1();
}

@end
