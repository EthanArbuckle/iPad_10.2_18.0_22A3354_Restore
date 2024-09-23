@implementation DNDStateService

void __58__DNDStateService_queryCurrentStateWithCompletionHandler___block_invoke_8(uint64_t a1, void *a2, void *a3)
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
    v7 = DNDLogState;
    if (os_log_type_enabled((os_log_t)DNDLogState, OS_LOG_TYPE_ERROR))
      __58__DNDStateService_queryCurrentStateWithCompletionHandler___block_invoke_8_cold_1(a1, (uint64_t)v6, v7);
  }
  v8 = *(void **)(a1 + 32);
  v9 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 16);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __58__DNDStateService_queryCurrentStateWithCompletionHandler___block_invoke_9;
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

- (void)addStateUpdateListener:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *queue;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  DNDStateService *v14;
  id v15;
  os_activity_scope_state_s state;

  v6 = a3;
  v7 = a4;
  v8 = _os_activity_create(&dword_19ABEB000, "com.apple.donotdisturb.DNDStateService.addStateUpdateListener", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__DNDStateService_addStateUpdateListener_withCompletionHandler___block_invoke;
  block[3] = &unk_1E39B5700;
  v13 = v6;
  v14 = self;
  v15 = v7;
  v10 = v7;
  v11 = v6;
  dispatch_sync(queue, block);

  os_activity_scope_leave(&state);
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
  DNDStateService *v11;
  id v12;
  os_activity_scope_state_s state;

  v4 = a3;
  v5 = _os_activity_create(&dword_19ABEB000, "com.apple.donotdisturb.DNDStateService.queryCurrentState.async", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__DNDStateService_queryCurrentStateWithCompletionHandler___block_invoke;
  block[3] = &unk_1E39B5700;
  v10 = v5;
  v11 = self;
  v12 = v4;
  v7 = v4;
  v8 = v5;
  dispatch_async(queue, block);

  os_activity_scope_leave(&state);
}

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
  if (serviceForClientIdentifier__onceToken_5 != -1)
    dispatch_once(&serviceForClientIdentifier__onceToken_5, &__block_literal_global_8);
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__5;
  v17 = __Block_byref_object_dispose__5;
  v18 = 0;
  v5 = serviceForClientIdentifier__lockQueue_5;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__DNDStateService_serviceForClientIdentifier___block_invoke_2;
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

void __46__DNDStateService_serviceForClientIdentifier___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  objc_msgSend((id)serviceForClientIdentifier__serviceByClientIdentifier_5, "objectForKey:", *(_QWORD *)(a1 + 32));
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

    objc_msgSend((id)serviceForClientIdentifier__serviceByClientIdentifier_5, "setObject:forKey:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(_QWORD *)(a1 + 32));
  }
}

void __64__DNDStateService_addStateUpdateListener_withCompletionHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  void *v8;
  NSObject *v9;
  _QWORD v10[4];
  id v11;
  char v12;
  uint8_t buf[4];
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = DNDLogState;
  if (os_log_type_enabled((os_log_t)DNDLogState, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v14 = v3;
    _os_log_impl(&dword_19ABEB000, v2, OS_LOG_TYPE_DEFAULT, "Adding state update listener: listener=%{public}@", buf, 0xCu);
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "addObject:", *(_QWORD *)(a1 + 32));
  v4 = objc_msgSend(*(id *)(a1 + 40), "_queue_registerForStateUpdatesIfRequired");
  v5 = DNDLogState;
  if (v4)
  {
    if (os_log_type_enabled((os_log_t)DNDLogState, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      v14 = v6;
      _os_log_impl(&dword_19ABEB000, v5, OS_LOG_TYPE_DEFAULT, "Registered for state updates: listener=%{public}@", buf, 0xCu);
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)DNDLogState, OS_LOG_TYPE_ERROR))
      __64__DNDStateService_addStateUpdateListener_withCompletionHandler___block_invoke_cold_1((uint64_t *)(a1 + 32), v5);
    v7 = *(id *)(*(_QWORD *)(a1 + 40) + 32);
    objc_sync_enter(v7);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "removeObject:", *(_QWORD *)(a1 + 32));
    objc_sync_exit(v7);

  }
  v8 = *(void **)(a1 + 48);
  if (v8)
  {
    v9 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 16);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __64__DNDStateService_addStateUpdateListener_withCompletionHandler___block_invoke_11;
    v10[3] = &unk_1E39B5728;
    v11 = v8;
    v12 = v4;
    dispatch_async(v9, v10);

  }
}

void __46__DNDStateService_serviceForClientIdentifier___block_invoke()
{
  NSObject *v0;
  dispatch_queue_t v1;
  void *v2;
  uint64_t v3;
  void *v4;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = dispatch_queue_create("com.apple.donotdisturb.DNDStateService.service.lock", v0);
  v2 = (void *)serviceForClientIdentifier__lockQueue_5;
  serviceForClientIdentifier__lockQueue_5 = (uint64_t)v1;

  objc_msgSend(MEMORY[0x1E0CB3748], "mapTableWithKeyOptions:valueOptions:", 0, 517);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)serviceForClientIdentifier__serviceByClientIdentifier_5;
  serviceForClientIdentifier__serviceByClientIdentifier_5 = v3;

}

void __59__DNDStateService__queue_registerForStateUpdatesIfRequired__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;

  v5 = a3;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(a2, "BOOLValue");
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

- (id)_initWithClientIdentifier:(id)a3
{
  id v4;
  DNDStateService *v5;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *queue;
  NSObject *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *calloutQueue;
  uint64_t v12;
  NSString *clientIdentifier;
  uint64_t v14;
  NSHashTable *stateUpdateListeners;
  void *v16;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)DNDStateService;
  v5 = -[DNDStateService init](&v18, sel_init);
  if (v5)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = dispatch_queue_create("com.apple.donotdisturb.StateService", v6);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v7;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = dispatch_queue_create("com.apple.donotdisturb.StateService.call-out", v9);
    calloutQueue = v5->_calloutQueue;
    v5->_calloutQueue = (OS_dispatch_queue *)v10;

    v12 = objc_msgSend(v4, "copy");
    clientIdentifier = v5->_clientIdentifier;
    v5->_clientIdentifier = (NSString *)v12;

    objc_msgSend(MEMORY[0x1E0CB3690], "hashTableWithOptions:", 517);
    v14 = objc_claimAutoreleasedReturnValue();
    stateUpdateListeners = v5->_stateUpdateListeners;
    v5->_stateUpdateListeners = (NSHashTable *)v14;

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
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;
  os_activity_scope_state_s state;
  __int128 buf;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (-[NSHashTable count](self->_stateUpdateListeners, "count") && !self->_registeredForUpdates)
  {
    v3 = _os_activity_create(&dword_19ABEB000, "com.apple.donotdisturb.DNDStateService.registerForStateUpdates", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v3, &state);
    +[DNDRequestDetails detailsRepresentingNowWithClientIdentifier:](DNDRequestDetails, "detailsRepresentingNowWithClientIdentifier:", self->_clientIdentifier);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = DNDLogState;
    if (os_log_type_enabled((os_log_t)DNDLogState, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = v4;
      _os_log_impl(&dword_19ABEB000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Registering state update listener", (uint8_t *)&buf, 0xCu);
    }
    v9 = 0;
    v10 = &v9;
    v11 = 0x2020000000;
    v12 = 0;
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v15 = 0x3032000000;
    v16 = __Block_byref_object_copy__5;
    v17 = __Block_byref_object_dispose__5;
    v18 = 0;
    +[DNDRemoteServiceConnection sharedInstance](DNDRemoteServiceConnection, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __59__DNDStateService__queue_registerForStateUpdatesIfRequired__block_invoke;
    v8[3] = &unk_1E39B5610;
    v8[4] = &v9;
    v8[5] = &buf;
    objc_msgSend(v6, "registerForStateUpdatesWithRequestDetails:completionHandler:", v4, v8);

    if (*(_QWORD *)(*((_QWORD *)&buf + 1) + 40) && os_log_type_enabled((os_log_t)DNDLogState, OS_LOG_TYPE_ERROR))
      -[DNDStateService _queue_registerForStateUpdatesIfRequired].cold.1();
    self->_registeredForUpdates = *((_BYTE *)v10 + 24);
    _Block_object_dispose(&buf, 8);

    _Block_object_dispose(&v9, 8);
    os_activity_scope_leave(&state);

  }
  return !-[NSHashTable count](self->_stateUpdateListeners, "count") || self->_registeredForUpdates;
}

void __58__DNDStateService_queryCurrentStateWithCompletionHandler___block_invoke(uint64_t a1)
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
  +[DNDRequestDetails detailsRepresentingNowWithClientIdentifier:](DNDRequestDetails, "detailsRepresentingNowWithClientIdentifier:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = DNDLogState;
  if (os_log_type_enabled((os_log_t)DNDLogState, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v14 = v2;
    _os_log_impl(&dword_19ABEB000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Processing async state request", buf, 0xCu);
  }
  +[DNDRemoteServiceConnection sharedInstance](DNDRemoteServiceConnection, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __58__DNDStateService_queryCurrentStateWithCompletionHandler___block_invoke_8;
  v8[3] = &unk_1E39B5E20;
  v5 = v2;
  v6 = *(_QWORD *)(a1 + 40);
  v7 = *(void **)(a1 + 48);
  v9 = v5;
  v10 = v6;
  v11 = v7;
  objc_msgSend(v4, "queryStateWithRequestDetails:completionHandler:", v5, v8);

  os_activity_scope_leave(&state);
}

uint64_t __64__DNDStateService_addStateUpdateListener_withCompletionHandler___block_invoke_11(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40), 0);
}

uint64_t __58__DNDStateService_queryCurrentStateWithCompletionHandler___block_invoke_9(_QWORD *a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = DNDLogState;
  if (os_log_type_enabled((os_log_t)DNDLogState, OS_LOG_TYPE_DEFAULT))
  {
    v3 = a1[4];
    v4 = a1[5];
    v6 = 138543618;
    v7 = v3;
    v8 = 2114;
    v9 = v4;
    _os_log_impl(&dword_19ABEB000, v2, OS_LOG_TYPE_DEFAULT, "[%{public}@] Got current state, state=%{public}@", (uint8_t *)&v6, 0x16u);
  }
  return (*(uint64_t (**)(void))(a1[7] + 16))();
}

- (id)queryCurrentStateWithError:(id *)a3
{
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  id v11;
  _QWORD v13[6];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  os_activity_scope_state_s state;
  uint8_t v21[4];
  void *v22;
  __int16 v23;
  uint64_t v24;
  __int128 buf;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = _os_activity_create(&dword_19ABEB000, "com.apple.donotdisturb.DNDStateService.queryCurrentState", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  +[DNDRequestDetails detailsRepresentingNowWithClientIdentifier:](DNDRequestDetails, "detailsRepresentingNowWithClientIdentifier:", self->_clientIdentifier);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = DNDLogState;
  if (os_log_type_enabled((os_log_t)DNDLogState, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v6;
    _os_log_impl(&dword_19ABEB000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Processing state request", (uint8_t *)&buf, 0xCu);
  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__5;
  v28 = __Block_byref_object_dispose__5;
  v29 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__5;
  v18 = __Block_byref_object_dispose__5;
  v19 = 0;
  +[DNDRemoteServiceConnection sharedInstance](DNDRemoteServiceConnection, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __46__DNDStateService_queryCurrentStateWithError___block_invoke;
  v13[3] = &unk_1E39B5E48;
  v13[4] = &buf;
  v13[5] = &v14;
  objc_msgSend(v8, "queryStateWithRequestDetails:completionHandler:", v6, v13);

  if (v15[5])
  {
    if (os_log_type_enabled((os_log_t)DNDLogState, OS_LOG_TYPE_ERROR))
      -[DNDStateService queryCurrentStateWithError:].cold.1();
    if (a3)
      *a3 = objc_retainAutorelease((id)v15[5]);
  }
  v9 = DNDLogState;
  if (os_log_type_enabled((os_log_t)DNDLogState, OS_LOG_TYPE_DEFAULT))
  {
    v10 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
    *(_DWORD *)v21 = 138543618;
    v22 = v6;
    v23 = 2114;
    v24 = v10;
    _os_log_impl(&dword_19ABEB000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] Got current state, state=%{public}@", v21, 0x16u);
  }
  v11 = *(id *)(*((_QWORD *)&buf + 1) + 40);
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&buf, 8);
  os_activity_scope_leave(&state);

  return v11;
}

void __46__DNDStateService_queryCurrentStateWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

- (void)removeStateUpdateListener:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *queue;
  id v7;
  _QWORD v8[4];
  id v9;
  DNDStateService *v10;
  os_activity_scope_state_s state;

  v4 = a3;
  v5 = _os_activity_create(&dword_19ABEB000, "com.apple.donotdisturb.DNDStateService.removeStateUpdateListener", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  queue = self->_queue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __45__DNDStateService_removeStateUpdateListener___block_invoke;
  v8[3] = &unk_1E39B5750;
  v9 = v4;
  v10 = self;
  v7 = v4;
  dispatch_sync(queue, v8);

  os_activity_scope_leave(&state);
}

uint64_t __45__DNDStateService_removeStateUpdateListener___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = DNDLogState;
  if (os_log_type_enabled((os_log_t)DNDLogState, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 138543362;
    v6 = v3;
    _os_log_impl(&dword_19ABEB000, v2, OS_LOG_TYPE_DEFAULT, "Removing state update listener: listener=%{public}@", (uint8_t *)&v5, 0xCu);
  }
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "removeObject:", *(_QWORD *)(a1 + 32));
}

- (void)remoteService:(id)a3 didReceiveDoNotDisturbStateUpdate:(id)a4
{
  id v5;
  NSObject *queue;
  id v7;
  _QWORD block[5];
  id v9;

  v5 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__DNDStateService_remoteService_didReceiveDoNotDisturbStateUpdate___block_invoke;
  block[3] = &unk_1E39B5750;
  block[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_sync(queue, block);

}

void __67__DNDStateService_remoteService_didReceiveDoNotDisturbStateUpdate___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  uint64_t v9;
  id v10;

  v2 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(v3 + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__DNDStateService_remoteService_didReceiveDoNotDisturbStateUpdate___block_invoke_2;
  block[3] = &unk_1E39B5778;
  v8 = v2;
  v9 = v3;
  v10 = v4;
  v6 = v2;
  dispatch_async(v5, block);

}

void __67__DNDStateService_remoteService_didReceiveDoNotDisturbStateUpdate___block_invoke_2(uint64_t a1)
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
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "stateService:didReceiveDoNotDisturbStateUpdate:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateUpdateListeners, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_calloutQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (BOOL)addStateUpdateListener:(id)a3 error:(id *)a4
{
  -[DNDStateService addStateUpdateListener:withCompletionHandler:](self, "addStateUpdateListener:withCompletionHandler:", a3, 0);
  return 1;
}

- (BOOL)removeStateUpdateListener:(id)a3 error:(id *)a4
{
  -[DNDStateService removeStateUpdateListener:](self, "removeStateUpdateListener:", a3, a4);
  return 1;
}

void __58__DNDStateService_queryCurrentStateWithCompletionHandler___block_invoke_8_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138543618;
  *(_QWORD *)&v3[4] = *(_QWORD *)(a1 + 32);
  *(_WORD *)&v3[12] = 2114;
  *(_QWORD *)&v3[14] = a2;
  OUTLINED_FUNCTION_0(&dword_19ABEB000, a2, a3, "[%{public}@] Error when getting state, error='%{public}@'", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  OUTLINED_FUNCTION_1();
}

- (void)queryCurrentStateWithError:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0(&dword_19ABEB000, v0, v1, "[%{public}@] Error when getting state, error='%{public}@'");
  OUTLINED_FUNCTION_1();
}

void __64__DNDStateService_addStateUpdateListener_withCompletionHandler___block_invoke_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *a1;
  v3 = 138543362;
  v4 = v2;
  _os_log_error_impl(&dword_19ABEB000, a2, OS_LOG_TYPE_ERROR, "Did not register for state updates, will remove listener: listener=%{public}@", (uint8_t *)&v3, 0xCu);
  OUTLINED_FUNCTION_1();
}

- (void)_queue_registerForStateUpdatesIfRequired
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0(&dword_19ABEB000, v0, v1, "[%{public}@] Error when registering state update listener, error='%{public}@'");
  OUTLINED_FUNCTION_1();
}

@end
