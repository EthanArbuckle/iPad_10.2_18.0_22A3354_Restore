@implementation DNDModeSelectionService

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
  if (serviceForClientIdentifier__onceToken_7 != -1)
    dispatch_once(&serviceForClientIdentifier__onceToken_7, &__block_literal_global_12);
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__7;
  v17 = __Block_byref_object_dispose__7;
  v18 = 0;
  v5 = serviceForClientIdentifier__lockQueue_6;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__DNDModeSelectionService_serviceForClientIdentifier___block_invoke_2;
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

void __54__DNDModeSelectionService_serviceForClientIdentifier___block_invoke()
{
  NSObject *v0;
  dispatch_queue_t v1;
  void *v2;
  uint64_t v3;
  void *v4;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = dispatch_queue_create("com.apple.donotdisturb.DNDModeSelectionService.service.lock", v0);
  v2 = (void *)serviceForClientIdentifier__lockQueue_6;
  serviceForClientIdentifier__lockQueue_6 = (uint64_t)v1;

  objc_msgSend(MEMORY[0x1E0CB3748], "mapTableWithKeyOptions:valueOptions:", 0, 517);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)serviceForClientIdentifier__serviceByClientIdentifier_7;
  serviceForClientIdentifier__serviceByClientIdentifier_7 = v3;

}

void __54__DNDModeSelectionService_serviceForClientIdentifier___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  objc_msgSend((id)serviceForClientIdentifier__serviceByClientIdentifier_7, "objectForKey:", *(_QWORD *)(a1 + 32));
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

    objc_msgSend((id)serviceForClientIdentifier__serviceByClientIdentifier_7, "setObject:forKey:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(_QWORD *)(a1 + 32));
  }
}

- (id)_initWithClientIdentifier:(id)a3
{
  id v4;
  DNDModeSelectionService *v5;
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
  uint64_t v16;
  DNDModeConfigurationService *modeConfigurationService;
  void *v18;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)DNDModeSelectionService;
  v5 = -[DNDModeSelectionService init](&v20, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    clientIdentifier = v5->_clientIdentifier;
    v5->_clientIdentifier = (NSString *)v6;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = dispatch_queue_create("com.apple.donotdisturb.DNDModeSelectionService", v8);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v9;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = dispatch_queue_create("com.apple.donotdisturb.DNDModeSelectionService.call-out", v11);
    calloutQueue = v5->_calloutQueue;
    v5->_calloutQueue = (OS_dispatch_queue *)v12;

    objc_msgSend(MEMORY[0x1E0CB3690], "hashTableWithOptions:", 517);
    v14 = objc_claimAutoreleasedReturnValue();
    listeners = v5->_listeners;
    v5->_listeners = (NSHashTable *)v14;

    +[DNDModeConfigurationService serviceForClientIdentifier:](DNDModeConfigurationService, "serviceForClientIdentifier:", v4);
    v16 = objc_claimAutoreleasedReturnValue();
    modeConfigurationService = v5->_modeConfigurationService;
    v5->_modeConfigurationService = (DNDModeConfigurationService *)v16;

    +[DNDRemoteServiceConnection sharedInstance](DNDRemoteServiceConnection, "sharedInstance");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addEventListener:", v5);

  }
  return v5;
}

- (BOOL)activateModeWithDetails:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  int v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  BOOL v16;
  void *v18;
  uint64_t v19;
  _QWORD v20[4];
  NSObject *v21;
  uint64_t *v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  char v33;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  uint64_t v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = _os_activity_create(&dword_19ABEB000, "com.apple.donotdisturb.DNDModeSelectionService.activateModeWithIdentifier", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  +[DNDRequestDetails detailsRepresentingNowWithClientIdentifier:](DNDRequestDetails, "detailsRepresentingNowWithClientIdentifier:", self->_clientIdentifier);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0;
  v31 = &v30;
  v32 = 0x2020000000;
  v33 = 0;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__7;
  v28 = __Block_byref_object_dispose__7;
  v29 = 0;
  +[DNDRemoteServiceConnection sharedInstance](DNDRemoteServiceConnection, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __57__DNDModeSelectionService_activateModeWithDetails_error___block_invoke;
  v20[3] = &unk_1E39B6080;
  v10 = v7;
  v21 = v10;
  v22 = &v30;
  v23 = &v24;
  objc_msgSend(v9, "activateModeWithDetails:withRequestDetails:completionHandler:", v6, v8, v20);

  v11 = *((unsigned __int8 *)v31 + 24);
  v12 = (id)DNDLogModeSelection;
  v13 = v12;
  if (v11)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v6, "modeIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v36 = v8;
      v37 = 2114;
      v38 = v14;
      _os_log_impl(&dword_19ABEB000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@] Activate mode with identifier, modeIdentifier=%{public}@", buf, 0x16u);

    }
  }
  else if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v6, "modeIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v25[5];
    *(_DWORD *)buf = 138543874;
    v36 = v8;
    v37 = 2114;
    v38 = v18;
    v39 = 2114;
    v40 = v19;
    _os_log_error_impl(&dword_19ABEB000, v13, OS_LOG_TYPE_ERROR, "[%{public}@] Error when setting mode with identifier, modeIdentifier=%{public}@ error='%{public}@'", buf, 0x20u);

  }
  if (a4)
  {
    v15 = (void *)v25[5];
    if (v15)
      *a4 = objc_retainAutorelease(v15);
  }
  v16 = *((_BYTE *)v31 + 24) != 0;

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v30, 8);

  os_activity_scope_leave(&state);
  return v16;
}

void __57__DNDModeSelectionService_activateModeWithDetails_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  os_activity_scope_state_s v9;

  v5 = a2;
  v6 = a3;
  v9.opaque[0] = 0;
  v9.opaque[1] = 0;
  os_activity_scope_enter(*(os_activity_t *)(a1 + 32), &v9);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v5, "BOOLValue");
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  os_activity_scope_leave(&v9);
}

- (BOOL)invalidateModeAssertionWithUUID:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  BOOL v13;
  uint64_t v15;
  _QWORD v16[4];
  NSObject *v17;
  uint64_t *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  id v34;
  __int16 v35;
  uint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = _os_activity_create(&dword_19ABEB000, "com.apple.donotdisturb.DNDModeSelectionService.invalidateModeAssertionWithUUID", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  +[DNDRequestDetails detailsRepresentingNowWithClientIdentifier:](DNDRequestDetails, "detailsRepresentingNowWithClientIdentifier:", self->_clientIdentifier);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__7;
  v24 = __Block_byref_object_dispose__7;
  v25 = 0;
  +[DNDRemoteServiceConnection sharedInstance](DNDRemoteServiceConnection, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __65__DNDModeSelectionService_invalidateModeAssertionWithUUID_error___block_invoke;
  v16[3] = &unk_1E39B6080;
  v10 = v7;
  v17 = v10;
  v18 = &v26;
  v19 = &v20;
  objc_msgSend(v9, "invalidateModeAssertionWithUUID:withRequestDetails:completionHandler:", v6, v8, v16);

  v11 = DNDLogModeSelection;
  if (*((_BYTE *)v27 + 24))
  {
    if (os_log_type_enabled((os_log_t)DNDLogModeSelection, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v32 = v8;
      v33 = 2114;
      v34 = v6;
      _os_log_impl(&dword_19ABEB000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] Invalidate mode assertion with UUID, assertionUUID=%{public}@", buf, 0x16u);
      if (!a4)
        goto LABEL_9;
      goto LABEL_7;
    }
LABEL_6:
    if (!a4)
      goto LABEL_9;
    goto LABEL_7;
  }
  if (!os_log_type_enabled((os_log_t)DNDLogModeSelection, OS_LOG_TYPE_ERROR))
    goto LABEL_6;
  v15 = v21[5];
  *(_DWORD *)buf = 138543874;
  v32 = v8;
  v33 = 2114;
  v34 = v6;
  v35 = 2114;
  v36 = v15;
  _os_log_error_impl(&dword_19ABEB000, v11, OS_LOG_TYPE_ERROR, "[%{public}@] Error when invalidating mode assertion with UUID, assertionUUID=%{public}@ error='%{public}@'", buf, 0x20u);
  if (!a4)
    goto LABEL_9;
LABEL_7:
  v12 = (void *)v21[5];
  if (v12)
    *a4 = objc_retainAutorelease(v12);
LABEL_9:
  v13 = *((_BYTE *)v27 + 24) != 0;

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

  os_activity_scope_leave(&state);
  return v13;
}

void __65__DNDModeSelectionService_invalidateModeAssertionWithUUID_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  os_activity_scope_state_s v9;

  v5 = a2;
  v6 = a3;
  v9.opaque[0] = 0;
  v9.opaque[1] = 0;
  os_activity_scope_enter(*(os_activity_t *)(a1 + 32), &v9);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v5, "BOOLValue");
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  os_activity_scope_leave(&v9);
}

- (id)activeModeAssertionWithError:(id *)a3
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
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  v5 = _os_activity_create(&dword_19ABEB000, "com.apple.donotdisturb.DNDModeSelectionService.activeModeAssertion", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v5, &state);
  +[DNDRequestDetails detailsRepresentingNowWithClientIdentifier:](DNDRequestDetails, "detailsRepresentingNowWithClientIdentifier:", self->_clientIdentifier);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = DNDLogModeSelection;
  if (os_log_type_enabled((os_log_t)DNDLogModeSelection, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v6;
    _os_log_impl(&dword_19ABEB000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Getting active mode assertion; not restricted by client identifier",
      (uint8_t *)&buf,
      0xCu);
  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__7;
  v28 = __Block_byref_object_dispose__7;
  v29 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__7;
  v18 = __Block_byref_object_dispose__7;
  v19 = 0;
  +[DNDRemoteServiceConnection sharedInstance](DNDRemoteServiceConnection, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __56__DNDModeSelectionService_activeModeAssertionWithError___block_invoke;
  v13[3] = &unk_1E39B5F90;
  v13[4] = &buf;
  v13[5] = &v14;
  objc_msgSend(v8, "activeModeAssertionWithRequestDetails:completionHandler:", v6, v13);

  if (v15[5])
  {
    if (os_log_type_enabled((os_log_t)DNDLogModeSelection, OS_LOG_TYPE_ERROR))
      -[DNDModeSelectionService activeModeAssertionWithError:].cold.1();
    if (a3)
      *a3 = objc_retainAutorelease((id)v15[5]);
  }
  v9 = DNDLogModeSelection;
  if (os_log_type_enabled((os_log_t)DNDLogModeSelection, OS_LOG_TYPE_DEFAULT))
  {
    v10 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
    *(_DWORD *)v21 = 138543618;
    v22 = v6;
    v23 = 2114;
    v24 = v10;
    _os_log_impl(&dword_19ABEB000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] Got mode assertion, assertion=%{public}@", v21, 0x16u);
  }
  os_activity_scope_leave(&state);
  v11 = *(id *)(*((_QWORD *)&buf + 1) + 40);
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&buf, 8);
  return v11;
}

void __56__DNDModeSelectionService_activeModeAssertionWithError___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (id)allModesWithError:(id *)a3
{
  return -[DNDModeConfigurationService allModesReturningError:](self->_modeConfigurationService, "allModesReturningError:", a3);
}

- (id)availableModesWithError:(id *)a3
{
  return -[DNDModeConfigurationService availableModesReturningError:](self->_modeConfigurationService, "availableModesReturningError:", a3);
}

- (id)modeConfigurationForModeIdentifier:(id)a3 error:(id *)a4
{
  return -[DNDModeConfigurationService modeConfigurationForModeIdentifier:error:](self->_modeConfigurationService, "modeConfigurationForModeIdentifier:error:", a3, a4);
}

- (BOOL)promotePlaceholderWithModeIdentifier:(id)a3 error:(id *)a4
{
  void *v4;
  BOOL v5;

  -[DNDModeConfigurationService createModeConfigurationUsingTemplateForModeIdentifier:error:](self->_modeConfigurationService, "createModeConfigurationUsingTemplateForModeIdentifier:error:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 != 0;

  return v5;
}

- (id)promotedPlaceholderWithModeIdentifier:(id)a3 error:(id *)a4
{
  return -[DNDModeConfigurationService createModeConfigurationUsingTemplateForModeIdentifier:error:](self->_modeConfigurationService, "createModeConfigurationUsingTemplateForModeIdentifier:error:", a3, a4);
}

- (void)addListener:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *queue;
  NSObject *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  NSObject *v15;
  id v16;
  id v17;
  id v18;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = _os_activity_create(&dword_19ABEB000, "com.apple.donotdisturb.DNDModeSelectionService.addListener", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  v9 = DNDLogModeSelection;
  if (os_log_type_enabled((os_log_t)DNDLogModeSelection, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v21 = v6;
    _os_log_impl(&dword_19ABEB000, v9, OS_LOG_TYPE_DEFAULT, "Adding update listener: listener=%{public}@", buf, 0xCu);
  }
  objc_initWeak((id *)buf, self);
  queue = self->_queue;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __61__DNDModeSelectionService_addListener_withCompletionHandler___block_invoke;
  v14[3] = &unk_1E39B60D0;
  v15 = v8;
  v11 = v8;
  objc_copyWeak(&v18, (id *)buf);
  v16 = v6;
  v17 = v7;
  v12 = v7;
  v13 = v6;
  dispatch_async(queue, v14);

  objc_destroyWeak(&v18);
  objc_destroyWeak((id *)buf);
  os_activity_scope_leave(&state);
}

void __61__DNDModeSelectionService_addListener_withCompletionHandler___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  _QWORD *v4;
  int v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  _QWORD block[4];
  id v10;
  id v11;
  char v12;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(*(os_activity_t *)(a1 + 32), &state);
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = (_QWORD *)(a1 + 40);
    objc_msgSend(WeakRetained[4], "addObject:", *(_QWORD *)(a1 + 40));
    v5 = objc_msgSend(v3, "_queue_registerForUpdatesIfRequired");
    v6 = DNDLogModeSelection;
    if (v5)
    {
      if (os_log_type_enabled((os_log_t)DNDLogModeSelection, OS_LOG_TYPE_DEFAULT))
      {
        v7 = *v4;
        *(_DWORD *)buf = 138543362;
        v15 = v7;
        _os_log_impl(&dword_19ABEB000, v6, OS_LOG_TYPE_DEFAULT, "Registered for updates: listener=%{public}@", buf, 0xCu);
      }
    }
    else
    {
      if (os_log_type_enabled((os_log_t)DNDLogModeSelection, OS_LOG_TYPE_ERROR))
        __65__DNDModeConfigurationService_addListener_withCompletionHandler___block_invoke_cold_1((uint64_t *)(a1 + 40), v6);
      objc_msgSend(v3[4], "removeObject:", *v4);
    }
    if (*(_QWORD *)(a1 + 48))
    {
      v8 = v3[3];
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __61__DNDModeSelectionService_addListener_withCompletionHandler___block_invoke_11;
      block[3] = &unk_1E39B60A8;
      v10 = *(id *)(a1 + 32);
      v11 = *(id *)(a1 + 48);
      v12 = v5;
      dispatch_async(v8, block);

    }
  }

  os_activity_scope_leave(&state);
}

void __61__DNDModeSelectionService_addListener_withCompletionHandler___block_invoke_11(uint64_t a1)
{
  os_activity_scope_state_s v2;

  v2.opaque[0] = 0;
  v2.opaque[1] = 0;
  os_activity_scope_enter(*(os_activity_t *)(a1 + 32), &v2);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  os_activity_scope_leave(&v2);
}

- (void)removeListener:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *queue;
  NSObject *v8;
  id v9;
  _QWORD block[4];
  NSObject *v11;
  id v12;
  id v13;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = _os_activity_create(&dword_19ABEB000, "com.apple.donotdisturb.DNDModeSelectionService.removeListener", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  v6 = DNDLogModeSelection;
  if (os_log_type_enabled((os_log_t)DNDLogModeSelection, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v16 = v4;
    _os_log_impl(&dword_19ABEB000, v6, OS_LOG_TYPE_DEFAULT, "Removing update listener: listener=%{public}@", buf, 0xCu);
  }
  objc_initWeak((id *)buf, self);
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__DNDModeSelectionService_removeListener___block_invoke;
  block[3] = &unk_1E39B60F8;
  v11 = v5;
  v8 = v5;
  objc_copyWeak(&v13, (id *)buf);
  v12 = v4;
  v9 = v4;
  dispatch_async(queue, block);

  objc_destroyWeak(&v13);
  objc_destroyWeak((id *)buf);
  os_activity_scope_leave(&state);
}

void __42__DNDModeSelectionService_removeListener___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  os_activity_scope_state_s v4;

  v4.opaque[0] = 0;
  v4.opaque[1] = 0;
  os_activity_scope_enter(*(os_activity_t *)(a1 + 32), &v4);
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained[4], "removeObject:", *(_QWORD *)(a1 + 40));

  os_activity_scope_leave(&v4);
}

- (void)remoteService:(id)a3 didReceiveUpdatedActiveModeAssertion:(id)a4 stateUpdate:(id)a5
{
  id v7;
  id v8;
  NSObject *queue;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;

  v7 = a4;
  v8 = a5;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __90__DNDModeSelectionService_remoteService_didReceiveUpdatedActiveModeAssertion_stateUpdate___block_invoke;
  block[3] = &unk_1E39B5778;
  block[4] = self;
  v13 = v7;
  v14 = v8;
  v10 = v8;
  v11 = v7;
  dispatch_async(queue, block);

}

void __90__DNDModeSelectionService_remoteService_didReceiveUpdatedActiveModeAssertion_stateUpdate___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  _QWORD v12[6];
  id v13;
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v16;
    v6 = MEMORY[0x1E0C809B0];
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v16 != v5)
          objc_enumerationMutation(v2);
        v8 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v7);
        v9 = *(_QWORD *)(a1 + 32);
        v10 = *(void **)(a1 + 40);
        v11 = *(NSObject **)(v9 + 24);
        v12[0] = v6;
        v12[1] = 3221225472;
        v12[2] = __90__DNDModeSelectionService_remoteService_didReceiveUpdatedActiveModeAssertion_stateUpdate___block_invoke_2;
        v12[3] = &unk_1E39B6120;
        v12[4] = v8;
        v12[5] = v9;
        v13 = v10;
        v14 = *(id *)(a1 + 48);
        dispatch_async(v11, v12);

        ++v7;
      }
      while (v4 != v7);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v4);
  }

}

uint64_t __90__DNDModeSelectionService_remoteService_didReceiveUpdatedActiveModeAssertion_stateUpdate___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(*(id *)(a1 + 32), "modeSelectionService:didReceiveUpdatedActiveModeAssertion:stateUpdate:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  return result;
}

- (void)remoteService:(id)a3 didReceiveUpdatedModes:(id)a4
{
  id v5;
  NSObject *queue;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  queue = self->_queue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __64__DNDModeSelectionService_remoteService_didReceiveUpdatedModes___block_invoke;
  v8[3] = &unk_1E39B5750;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(queue, v8);

}

void __64__DNDModeSelectionService_remoteService_didReceiveUpdatedModes___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  _QWORD block[6];
  id v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v15;
    v6 = MEMORY[0x1E0C809B0];
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v15 != v5)
          objc_enumerationMutation(v2);
        v8 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v7);
        v9 = *(_QWORD *)(a1 + 32);
        v10 = *(void **)(a1 + 40);
        v11 = *(NSObject **)(v9 + 24);
        block[0] = v6;
        block[1] = 3221225472;
        block[2] = __64__DNDModeSelectionService_remoteService_didReceiveUpdatedModes___block_invoke_2;
        block[3] = &unk_1E39B5778;
        block[4] = v8;
        block[5] = v9;
        v13 = v10;
        dispatch_async(v11, block);

        ++v7;
      }
      while (v4 != v7);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v4);
  }

}

uint64_t __64__DNDModeSelectionService_remoteService_didReceiveUpdatedModes___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(*(id *)(a1 + 32), "modeSelectionService:didReceiveModesUpdate:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  return result;
}

- (void)remoteService:(id)a3 didReceiveUpdatedAvailableModes:(id)a4
{
  id v5;
  NSObject *queue;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  queue = self->_queue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __73__DNDModeSelectionService_remoteService_didReceiveUpdatedAvailableModes___block_invoke;
  v8[3] = &unk_1E39B5750;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(queue, v8);

}

void __73__DNDModeSelectionService_remoteService_didReceiveUpdatedAvailableModes___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  _QWORD block[6];
  id v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v15;
    v6 = MEMORY[0x1E0C809B0];
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v15 != v5)
          objc_enumerationMutation(v2);
        v8 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v7);
        v9 = *(_QWORD *)(a1 + 32);
        v10 = *(void **)(a1 + 40);
        v11 = *(NSObject **)(v9 + 24);
        block[0] = v6;
        block[1] = 3221225472;
        block[2] = __73__DNDModeSelectionService_remoteService_didReceiveUpdatedAvailableModes___block_invoke_2;
        block[3] = &unk_1E39B5778;
        block[4] = v8;
        block[5] = v9;
        v13 = v10;
        dispatch_async(v11, block);

        ++v7;
      }
      while (v4 != v7);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v4);
  }

}

uint64_t __73__DNDModeSelectionService_remoteService_didReceiveUpdatedAvailableModes___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(*(id *)(a1 + 32), "modeSelectionService:didReceiveAvailableModesUpdate:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  return result;
}

- (BOOL)_queue_registerForUpdatesIfRequired
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
  if (-[NSHashTable count](self->_listeners, "count") && !self->_registeredForUpdates)
  {
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    v3 = _os_activity_create(&dword_19ABEB000, "com.apple.donotdisturb.DNDModeSelectionService.registerForUpdates", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v3, &state);
    +[DNDRequestDetails detailsRepresentingNowWithClientIdentifier:](DNDRequestDetails, "detailsRepresentingNowWithClientIdentifier:", self->_clientIdentifier);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = DNDLogModeSelection;
    if (os_log_type_enabled((os_log_t)DNDLogModeSelection, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = v4;
      _os_log_impl(&dword_19ABEB000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Registering update listener", (uint8_t *)&buf, 0xCu);
    }
    v9 = 0;
    v10 = &v9;
    v11 = 0x2020000000;
    v12 = 0;
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v15 = 0x3032000000;
    v16 = __Block_byref_object_copy__7;
    v17 = __Block_byref_object_dispose__7;
    v18 = 0;
    +[DNDRemoteServiceConnection sharedInstance](DNDRemoteServiceConnection, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __62__DNDModeSelectionService__queue_registerForUpdatesIfRequired__block_invoke;
    v8[3] = &unk_1E39B5C90;
    v8[4] = &v9;
    v8[5] = &buf;
    objc_msgSend(v6, "registerForModeSelectionUpdatesWithRequestDetails:completionHandler:", v4, v8);

    if (*(_QWORD *)(*((_QWORD *)&buf + 1) + 40)
      && os_log_type_enabled((os_log_t)DNDLogModeSelection, OS_LOG_TYPE_ERROR))
    {
      -[DNDModeSelectionService _queue_registerForUpdatesIfRequired].cold.1();
    }
    os_activity_scope_leave(&state);
    self->_registeredForUpdates = *((_BYTE *)v10 + 24);
    _Block_object_dispose(&buf, 8);

    _Block_object_dispose(&v9, 8);
  }
  return !-[NSHashTable count](self->_listeners, "count") || self->_registeredForUpdates;
}

void __62__DNDModeSelectionService__queue_registerForUpdatesIfRequired__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
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
  objc_storeStrong((id *)&self->_modeConfigurationService, 0);
  objc_storeStrong((id *)&self->_listeners, 0);
  objc_storeStrong((id *)&self->_calloutQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
}

- (void)activeModeAssertionWithError:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0(&dword_19ABEB000, v0, v1, "[%{public}@] Error when requesting active mode assertion, error='%{public}@'");
  OUTLINED_FUNCTION_1();
}

- (void)_queue_registerForUpdatesIfRequired
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0(&dword_19ABEB000, v0, v1, "[%{public}@] Error when registering mode selection update listener, error='%{public}@'");
  OUTLINED_FUNCTION_1();
}

@end
