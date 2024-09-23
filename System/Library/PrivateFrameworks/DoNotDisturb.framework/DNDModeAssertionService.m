@implementation DNDModeAssertionService

+ (id)serviceForClientIdentifier:(id)a3
{
  id v4;
  id v5;
  void *v6;

  v4 = a3;
  if (serviceForClientIdentifier__onceToken_6 != -1)
    dispatch_once(&serviceForClientIdentifier__onceToken_6, &__block_literal_global_11);
  v5 = (id)serviceForClientIdentifier__serviceByClientIdentifier_6;
  objc_sync_enter(v5);
  objc_msgSend((id)serviceForClientIdentifier__serviceByClientIdentifier_6, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v6 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithClientIdentifier:", v4);
    objc_msgSend((id)serviceForClientIdentifier__serviceByClientIdentifier_6, "setObject:forKey:", v6, v4);
  }
  objc_sync_exit(v5);

  return v6;
}

void __54__DNDModeAssertionService_serviceForClientIdentifier___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3748], "mapTableWithKeyOptions:valueOptions:", 0, 517);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)serviceForClientIdentifier__serviceByClientIdentifier_6;
  serviceForClientIdentifier__serviceByClientIdentifier_6 = v0;

}

- (id)_initWithClientIdentifier:(id)a3
{
  id v4;
  DNDModeAssertionService *v5;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *calloutQueue;
  uint64_t v9;
  NSString *clientIdentifier;
  uint64_t v11;
  NSHashTable *assertionUpdateListeners;
  void *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)DNDModeAssertionService;
  v5 = -[DNDModeAssertionService init](&v15, sel_init);
  if (v5)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = dispatch_queue_create("com.apple.donotdisturb.ModeAssertionService.call-out", v6);
    calloutQueue = v5->_calloutQueue;
    v5->_calloutQueue = (OS_dispatch_queue *)v7;

    v9 = objc_msgSend(v4, "copy");
    clientIdentifier = v5->_clientIdentifier;
    v5->_clientIdentifier = (NSString *)v9;

    objc_msgSend(MEMORY[0x1E0CB3690], "hashTableWithOptions:", 517);
    v11 = objc_claimAutoreleasedReturnValue();
    assertionUpdateListeners = v5->_assertionUpdateListeners;
    v5->_assertionUpdateListeners = (NSHashTable *)v11;

    v5->_activeAssertionLock._os_unfair_lock_opaque = 0;
    +[DNDRemoteServiceConnection sharedInstance](DNDRemoteServiceConnection, "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addEventListener:", v5);

  }
  return v5;
}

- (id)takeModeAssertionWithDetails:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  id v13;
  _QWORD v15[6];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  os_activity_scope_state_s state;
  uint8_t v23[4];
  void *v24;
  __int16 v25;
  uint64_t v26;
  _BYTE buf[24];
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  v7 = _os_activity_create(&dword_19ABEB000, "com.apple.donotdisturb.DNDModeAssertionService.takeModeAssertion", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v7, &state);
  +[DNDRequestDetails detailsRepresentingNowWithClientIdentifier:](DNDRequestDetails, "detailsRepresentingNowWithClientIdentifier:", self->_clientIdentifier);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = DNDLogModeAssertion;
  if (os_log_type_enabled((os_log_t)DNDLogModeAssertion, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v8;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v6;
    _os_log_impl(&dword_19ABEB000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] Taking mode assertion; details=%{public}@",
      buf,
      0x16u);
  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v28 = __Block_byref_object_copy__6;
  v29 = __Block_byref_object_dispose__6;
  v30 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__6;
  v20 = __Block_byref_object_dispose__6;
  v21 = 0;
  +[DNDRemoteServiceConnection sharedInstance](DNDRemoteServiceConnection, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __62__DNDModeAssertionService_takeModeAssertionWithDetails_error___block_invoke;
  v15[3] = &unk_1E39B5F90;
  v15[4] = buf;
  v15[5] = &v16;
  objc_msgSend(v10, "takeModeAssertionWithDetails:requestDetails:completionHandler:", v6, v8, v15);

  if (v17[5])
  {
    if (os_log_type_enabled((os_log_t)DNDLogModeAssertion, OS_LOG_TYPE_ERROR))
      -[DNDModeAssertionService takeModeAssertionWithDetails:error:].cold.1();
    if (a4)
      *a4 = objc_retainAutorelease((id)v17[5]);
  }
  v11 = DNDLogModeAssertion;
  if (os_log_type_enabled((os_log_t)DNDLogModeAssertion, OS_LOG_TYPE_DEFAULT))
  {
    v12 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
    *(_DWORD *)v23 = 138543618;
    v24 = v8;
    v25 = 2114;
    v26 = v12;
    _os_log_impl(&dword_19ABEB000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] Took mode assertion, assertion=%{public}@", v23, 0x16u);
  }
  os_activity_scope_leave(&state);
  v13 = *(id *)(*(_QWORD *)&buf[8] + 40);
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(buf, 8);
  return v13;
}

void __62__DNDModeAssertionService_takeModeAssertionWithDetails_error___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (id)invalidateActiveModeAssertionWithError:(id *)a3
{
  return -[DNDModeAssertionService invalidateActiveModeAssertionWithInvalidationDetails:reasonOverride:error:](self, "invalidateActiveModeAssertionWithInvalidationDetails:reasonOverride:error:", 0, 0, a3);
}

- (id)invalidateActiveModeAssertionWithInvalidationDetails:(id)a3 reasonOverride:(unint64_t)a4 error:(id *)a5
{
  id v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  id v16;
  _QWORD v18[6];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  os_activity_scope_state_s state;
  uint8_t v26[4];
  void *v27;
  __int16 v28;
  uint64_t v29;
  __int128 buf;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  v9 = _os_activity_create(&dword_19ABEB000, "com.apple.donotdisturb.DNDModeAssertionService.invalidateActiveModeAssertion", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v9, &state);
  +[DNDRequestDetails detailsRepresentingNowWithClientIdentifier:](DNDRequestDetails, "detailsRepresentingNowWithClientIdentifier:", self->_clientIdentifier);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = DNDLogModeAssertion;
  if (os_log_type_enabled((os_log_t)DNDLogModeAssertion, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v10;
    _os_log_impl(&dword_19ABEB000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] Invalidating active mode assertion", (uint8_t *)&buf, 0xCu);
  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__6;
  v33 = __Block_byref_object_dispose__6;
  v34 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__6;
  v23 = __Block_byref_object_dispose__6;
  v24 = 0;
  +[DNDRemoteServiceConnection sharedInstance](DNDRemoteServiceConnection, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __101__DNDModeAssertionService_invalidateActiveModeAssertionWithInvalidationDetails_reasonOverride_error___block_invoke;
  v18[3] = &unk_1E39B5FB8;
  v18[4] = &buf;
  v18[5] = &v19;
  objc_msgSend(v12, "invalidateActiveModeAssertionWithDetails:reasonOverride:requestDetails:completionHandler:", v8, v13, v10, v18);

  if (v20[5])
  {
    if (os_log_type_enabled((os_log_t)DNDLogModeAssertion, OS_LOG_TYPE_ERROR))
      -[DNDModeAssertionService invalidateActiveModeAssertionWithInvalidationDetails:reasonOverride:error:].cold.1();
    if (a5)
      *a5 = objc_retainAutorelease((id)v20[5]);
  }
  v14 = DNDLogModeAssertion;
  if (os_log_type_enabled((os_log_t)DNDLogModeAssertion, OS_LOG_TYPE_DEFAULT))
  {
    v15 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
    *(_DWORD *)v26 = 138543618;
    v27 = v10;
    v28 = 2114;
    v29 = v15;
    _os_log_impl(&dword_19ABEB000, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@] Invalidated mode assertion, invalidation=%{public}@", v26, 0x16u);
  }
  os_activity_scope_leave(&state);
  v16 = *(id *)(*((_QWORD *)&buf + 1) + 40);
  _Block_object_dispose(&v19, 8);

  _Block_object_dispose(&buf, 8);
  return v16;
}

void __101__DNDModeAssertionService_invalidateActiveModeAssertionWithInvalidationDetails_reasonOverride_error___block_invoke(uint64_t a1, void *a2, void *a3)
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
  v5 = _os_activity_create(&dword_19ABEB000, "com.apple.donotdisturb.DNDModeAssertionService.activeModeAssertion", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v5, &state);
  +[DNDRequestDetails detailsRepresentingNowWithClientIdentifier:](DNDRequestDetails, "detailsRepresentingNowWithClientIdentifier:", self->_clientIdentifier);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = DNDLogModeAssertion;
  if (os_log_type_enabled((os_log_t)DNDLogModeAssertion, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v6;
    _os_log_impl(&dword_19ABEB000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Getting active mode assertion", (uint8_t *)&buf, 0xCu);
  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__6;
  v28 = __Block_byref_object_dispose__6;
  v29 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__6;
  v18 = __Block_byref_object_dispose__6;
  v19 = 0;
  +[DNDRemoteServiceConnection sharedInstance](DNDRemoteServiceConnection, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __56__DNDModeAssertionService_activeModeAssertionWithError___block_invoke;
  v13[3] = &unk_1E39B5F90;
  v13[4] = &buf;
  v13[5] = &v14;
  objc_msgSend(v8, "getActiveModeAssertionWithRequestDetails:completionHandler:", v6, v13);

  if (v15[5])
  {
    if (os_log_type_enabled((os_log_t)DNDLogModeAssertion, OS_LOG_TYPE_ERROR))
      -[DNDModeAssertionService activeModeAssertionWithError:].cold.1();
    if (a3)
      *a3 = objc_retainAutorelease((id)v15[5]);
  }
  v9 = DNDLogModeAssertion;
  if (os_log_type_enabled((os_log_t)DNDLogModeAssertion, OS_LOG_TYPE_DEFAULT))
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

void __56__DNDModeAssertionService_activeModeAssertionWithError___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (id)latestModeAssertionInvalidationWithError:(id *)a3
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
  v5 = _os_activity_create(&dword_19ABEB000, "com.apple.donotdisturb.DNDModeAssertionService.latestModeAssertionInvalidation", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v5, &state);
  +[DNDRequestDetails detailsRepresentingNowWithClientIdentifier:](DNDRequestDetails, "detailsRepresentingNowWithClientIdentifier:", self->_clientIdentifier);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = DNDLogModeAssertion;
  if (os_log_type_enabled((os_log_t)DNDLogModeAssertion, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v6;
    _os_log_impl(&dword_19ABEB000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Getting latest mode assertion invalidation", (uint8_t *)&buf, 0xCu);
  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__6;
  v28 = __Block_byref_object_dispose__6;
  v29 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__6;
  v18 = __Block_byref_object_dispose__6;
  v19 = 0;
  +[DNDRemoteServiceConnection sharedInstance](DNDRemoteServiceConnection, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __68__DNDModeAssertionService_latestModeAssertionInvalidationWithError___block_invoke;
  v13[3] = &unk_1E39B5FB8;
  v13[4] = &buf;
  v13[5] = &v14;
  objc_msgSend(v8, "getLatestModeAssertionInvalidationWithRequestDetails:completionHandler:", v6, v13);

  if (v15[5])
  {
    if (os_log_type_enabled((os_log_t)DNDLogModeAssertion, OS_LOG_TYPE_ERROR))
      -[DNDModeAssertionService latestModeAssertionInvalidationWithError:].cold.1();
    if (a3)
      *a3 = objc_retainAutorelease((id)v15[5]);
  }
  v9 = DNDLogModeAssertion;
  if (os_log_type_enabled((os_log_t)DNDLogModeAssertion, OS_LOG_TYPE_DEFAULT))
  {
    v10 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
    *(_DWORD *)v21 = 138543618;
    v22 = v6;
    v23 = 2114;
    v24 = v10;
    _os_log_impl(&dword_19ABEB000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] Got invalidation, invalidation=%{public}@", v21, 0x16u);
  }
  os_activity_scope_leave(&state);
  v11 = *(id *)(*((_QWORD *)&buf + 1) + 40);
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&buf, 8);
  return v11;
}

void __68__DNDModeAssertionService_latestModeAssertionInvalidationWithError___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (BOOL)invalidateAllActiveModeAssertionsWithError:(id *)a3
{
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  int v10;
  BOOL v11;
  _QWORD v13[6];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;
  os_activity_scope_state_s state;
  uint8_t v19[4];
  void *v20;
  __int16 v21;
  int v22;
  __int128 buf;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  v5 = _os_activity_create(&dword_19ABEB000, "com.apple.donotdisturb.DNDModeAssertionService.invalidateAllActiveModeAssertions", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v5, &state);
  +[DNDRequestDetails detailsRepresentingNowWithClientIdentifier:](DNDRequestDetails, "detailsRepresentingNowWithClientIdentifier:", self->_clientIdentifier);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = DNDLogModeAssertion;
  if (os_log_type_enabled((os_log_t)DNDLogModeAssertion, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v6;
    _os_log_impl(&dword_19ABEB000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Invalidating all active mode assertions", (uint8_t *)&buf, 0xCu);
  }
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__6;
  v26 = __Block_byref_object_dispose__6;
  v27 = 0;
  +[DNDRemoteServiceConnection sharedInstance](DNDRemoteServiceConnection, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __70__DNDModeAssertionService_invalidateAllActiveModeAssertionsWithError___block_invoke;
  v13[3] = &unk_1E39B5610;
  v13[4] = &v14;
  v13[5] = &buf;
  objc_msgSend(v8, "invalidateAllActiveModeAssertionsWithRequestDetails:completionHandler:", v6, v13);

  if (*(_QWORD *)(*((_QWORD *)&buf + 1) + 40))
  {
    if (os_log_type_enabled((os_log_t)DNDLogModeAssertion, OS_LOG_TYPE_ERROR))
      -[DNDModeAssertionService invalidateAllActiveModeAssertionsWithError:].cold.1();
    if (a3)
      *a3 = objc_retainAutorelease(*(id *)(*((_QWORD *)&buf + 1) + 40));
  }
  v9 = DNDLogModeAssertion;
  if (os_log_type_enabled((os_log_t)DNDLogModeAssertion, OS_LOG_TYPE_DEFAULT))
  {
    v10 = *((unsigned __int8 *)v15 + 24);
    *(_DWORD *)v19 = 138543618;
    v20 = v6;
    v21 = 1024;
    v22 = v10;
    _os_log_impl(&dword_19ABEB000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] Invalidated all active mode assertions, success=%{BOOL}u", v19, 0x12u);
  }
  os_activity_scope_leave(&state);
  v11 = *((_BYTE *)v15 + 24) != 0;
  _Block_object_dispose(&buf, 8);

  _Block_object_dispose(&v14, 8);
  return v11;
}

void __70__DNDModeAssertionService_invalidateAllActiveModeAssertionsWithError___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (id)allModeAssertionsWithError:(id *)a3
{
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  _BOOL4 v10;
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
  _BOOL4 v24;
  __int128 buf;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  v5 = _os_activity_create(&dword_19ABEB000, "com.apple.donotdisturb.DNDModeAssertionService.allModeAssertionsWithError", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v5, &state);
  +[DNDRequestDetails detailsRepresentingNowWithClientIdentifier:](DNDRequestDetails, "detailsRepresentingNowWithClientIdentifier:", self->_clientIdentifier);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = DNDLogModeAssertion;
  if (os_log_type_enabled((os_log_t)DNDLogModeAssertion, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v6;
    _os_log_impl(&dword_19ABEB000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Requesting all active mode assertions", (uint8_t *)&buf, 0xCu);
  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__6;
  v28 = __Block_byref_object_dispose__6;
  v29 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__6;
  v18 = __Block_byref_object_dispose__6;
  v19 = 0;
  +[DNDRemoteServiceConnection sharedInstance](DNDRemoteServiceConnection, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __54__DNDModeAssertionService_allModeAssertionsWithError___block_invoke;
  v13[3] = &unk_1E39B5FE0;
  v13[4] = &buf;
  v13[5] = &v14;
  objc_msgSend(v8, "getAllModeAssertionsWithRequestDetails:completionHandler:", v6, v13);

  if (v15[5])
  {
    if (os_log_type_enabled((os_log_t)DNDLogModeAssertion, OS_LOG_TYPE_ERROR))
      -[DNDModeAssertionService allModeAssertionsWithError:].cold.1();
    if (a3)
      *a3 = objc_retainAutorelease((id)v15[5]);
  }
  v9 = DNDLogModeAssertion;
  if (os_log_type_enabled((os_log_t)DNDLogModeAssertion, OS_LOG_TYPE_DEFAULT))
  {
    v10 = v15[5] == 0;
    *(_DWORD *)v21 = 138543618;
    v22 = v6;
    v23 = 1024;
    v24 = v10;
    _os_log_impl(&dword_19ABEB000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] Requested all active mode assertions, success=%{BOOL}u", v21, 0x12u);
  }
  os_activity_scope_leave(&state);
  v11 = *(id *)(*((_QWORD *)&buf + 1) + 40);
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&buf, 8);
  return v11;
}

void __54__DNDModeAssertionService_allModeAssertionsWithError___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (void)addAssertionUpdateListener:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  NSString *clientIdentifier;
  NSHashTable *v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  NSString *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  v8 = _os_activity_create(&dword_19ABEB000, "com.apple.donotdisturb.DNDModeAssertionService.addAssertionUpdateListener", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v8, &state);
  v9 = DNDLogModeAssertion;
  if (os_log_type_enabled((os_log_t)DNDLogModeAssertion, OS_LOG_TYPE_DEFAULT))
  {
    clientIdentifier = self->_clientIdentifier;
    *(_DWORD *)buf = 138543618;
    v19 = clientIdentifier;
    v20 = 2114;
    v21 = v6;
    _os_log_impl(&dword_19ABEB000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] Adding assertion update listener: listener=%{public}@", buf, 0x16u);
  }
  v11 = self->_assertionUpdateListeners;
  objc_sync_enter(v11);
  -[NSHashTable addObject:](self->_assertionUpdateListeners, "addObject:", v6);
  objc_sync_exit(v11);

  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __76__DNDModeAssertionService_addAssertionUpdateListener_withCompletionHandler___block_invoke;
  v14[3] = &unk_1E39B6030;
  v14[4] = self;
  v15 = v6;
  v16 = v7;
  v12 = v7;
  v13 = v6;
  -[DNDModeAssertionService _registerForAssertionUpdatesIfRequiredWithCompletionHandler:](self, "_registerForAssertionUpdatesIfRequiredWithCompletionHandler:", v14);
  os_activity_scope_leave(&state);

}

void __76__DNDModeAssertionService_addAssertionUpdateListener_withCompletionHandler___block_invoke(_QWORD *a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  NSObject *v11;
  _QWORD block[4];
  id v13;
  id v14;
  char v15;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = DNDLogModeAssertion;
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)DNDLogModeAssertion, OS_LOG_TYPE_DEFAULT))
    {
      v7 = a1[5];
      v8 = *(_QWORD *)(a1[4] + 16);
      *(_DWORD *)buf = 138543618;
      v17 = v8;
      v18 = 2114;
      v19 = v7;
      _os_log_impl(&dword_19ABEB000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Registered for assertion updates: listener=%{public}@", buf, 0x16u);
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)DNDLogModeAssertion, OS_LOG_TYPE_ERROR))
      __76__DNDModeAssertionService_addAssertionUpdateListener_withCompletionHandler___block_invoke_cold_1((uint64_t)a1, (uint64_t)v5, v6);
    v9 = *(id *)(a1[4] + 24);
    objc_sync_enter(v9);
    objc_msgSend(*(id *)(a1[4] + 24), "removeObject:", a1[5]);
    objc_sync_exit(v9);

  }
  v10 = (void *)a1[6];
  if (v10)
  {
    v11 = *(NSObject **)(a1[4] + 8);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __76__DNDModeAssertionService_addAssertionUpdateListener_withCompletionHandler___block_invoke_10;
    block[3] = &unk_1E39B6008;
    v14 = v10;
    v15 = a2;
    v13 = v5;
    dispatch_async(v11, block);

  }
}

uint64_t __76__DNDModeAssertionService_addAssertionUpdateListener_withCompletionHandler___block_invoke_10(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

- (void)removeAssertionUpdateListener:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  NSString *clientIdentifier;
  NSHashTable *v8;
  os_activity_scope_state_s v9;
  uint8_t buf[4];
  NSString *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v9.opaque[0] = 0;
  v9.opaque[1] = 0;
  v5 = _os_activity_create(&dword_19ABEB000, "com.apple.donotdisturb.DNDModeAssertionService.removeAssertionUpdateListener", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v5, &v9);
  v6 = DNDLogModeAssertion;
  if (os_log_type_enabled((os_log_t)DNDLogModeAssertion, OS_LOG_TYPE_DEFAULT))
  {
    clientIdentifier = self->_clientIdentifier;
    *(_DWORD *)buf = 138543618;
    v11 = clientIdentifier;
    v12 = 2114;
    v13 = v4;
    _os_log_impl(&dword_19ABEB000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Removing assertion update listener: listener=%{public}@", buf, 0x16u);
  }
  v8 = self->_assertionUpdateListeners;
  objc_sync_enter(v8);
  -[NSHashTable removeObject:](self->_assertionUpdateListeners, "removeObject:", v4, v9.opaque[0], v9.opaque[1]);
  objc_sync_exit(v8);

  os_activity_scope_leave(&v9);
}

- (void)remoteService:(id)a3 didChangeActiveModeAssertion:(id)a4 invalidation:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  NSString *clientIdentifier;
  int v13;
  NSString *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = DNDLogModeAssertion;
  if (os_log_type_enabled((os_log_t)DNDLogModeAssertion, OS_LOG_TYPE_DEFAULT))
  {
    clientIdentifier = self->_clientIdentifier;
    v13 = 138544130;
    v14 = clientIdentifier;
    v15 = 2114;
    v16 = v8;
    v17 = 2114;
    v18 = v9;
    v19 = 2114;
    v20 = v10;
    _os_log_impl(&dword_19ABEB000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] Remote service got assertion change: service=%{public}@, assertion=%{public}@, invalidation=%{public}@", (uint8_t *)&v13, 0x2Au);
  }
  -[DNDModeAssertionService _handleChangeActiveModeAssertion:invalidation:](self, "_handleChangeActiveModeAssertion:invalidation:", v9, v10);

}

- (void)_handleChangeActiveModeAssertion:(id)a3 invalidation:(id)a4
{
  id v7;
  id v8;
  NSObject *calloutQueue;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;

  v7 = a3;
  v8 = a4;
  os_unfair_lock_lock(&self->_activeAssertionLock);
  objc_storeStrong((id *)&self->_activeAssertion, a3);
  os_unfair_lock_unlock(&self->_activeAssertionLock);
  calloutQueue = self->_calloutQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__DNDModeAssertionService__handleChangeActiveModeAssertion_invalidation___block_invoke;
  block[3] = &unk_1E39B5778;
  block[4] = self;
  v13 = v8;
  v14 = v7;
  v10 = v7;
  v11 = v8;
  dispatch_async(calloutQueue, block);

}

void __73__DNDModeAssertionService__handleChangeActiveModeAssertion_invalidation___block_invoke(_QWORD *a1)
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  __int128 v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t v33[128];
  uint8_t buf[4];
  uint64_t v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  void *v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v2 = *(id *)(a1[4] + 24);
  objc_sync_enter(v2);
  objc_msgSend(*(id *)(a1[4] + 24), "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v2);

  if (a1[5])
  {
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v4 = v3;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v29, v40, 16);
    if (v6)
    {
      v8 = *(_QWORD *)v30;
      *(_QWORD *)&v7 = 138543874;
      v23 = v7;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v30 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v9);
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            v11 = DNDLogModeAssertion;
            if (os_log_type_enabled((os_log_t)DNDLogModeAssertion, OS_LOG_TYPE_DEFAULT))
            {
              v12 = a1[5];
              v13 = *(_QWORD *)(a1[4] + 16);
              *(_DWORD *)buf = v23;
              v35 = v13;
              v36 = 2114;
              v37 = v12;
              v38 = 2114;
              v39 = v10;
              _os_log_impl(&dword_19ABEB000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] Will deliver assertion invalidation to listener: invalidation=%{public}@, listener=%{public}@", buf, 0x20u);
            }
            objc_msgSend(v10, "modeAssertionService:didReceiveModeAssertionInvalidation:", a1[4], a1[5], v23);
          }
          ++v9;
        }
        while (v6 != v9);
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v29, v40, 16);
      }
      while (v6);
    }

    v3 = v4;
  }
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v14 = v3;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
  if (v15)
  {
    v17 = *(_QWORD *)v26;
    *(_QWORD *)&v16 = 138543874;
    v24 = v16;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v26 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v18);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          v20 = DNDLogModeAssertion;
          if (os_log_type_enabled((os_log_t)DNDLogModeAssertion, OS_LOG_TYPE_DEFAULT))
          {
            v21 = *(_QWORD *)(a1[4] + 16);
            v22 = a1[6];
            *(_DWORD *)buf = v24;
            v35 = v21;
            v36 = 2114;
            v37 = v22;
            v38 = 2114;
            v39 = v19;
            _os_log_impl(&dword_19ABEB000, v20, OS_LOG_TYPE_DEFAULT, "[%{public}@] Will deliver assertion change to listener: assertion=%{public}@, listener=%{public}@", buf, 0x20u);
          }
          objc_msgSend(v19, "modeAssertionService:didUpdateActiveModeAssertion:", a1[4], a1[6], v24, (_QWORD)v25);
        }
        ++v18;
      }
      while (v15 != v18);
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    }
    while (v15);
  }

}

- (void)_registerForAssertionUpdatesIfRequiredWithCompletionHandler:(id)a3
{
  void (**v4)(id, uint64_t, _QWORD);
  NSHashTable *v5;
  NSUInteger v6;
  atomic_flag *p_registeredForUpdates;
  unsigned __int8 v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  _QWORD v13[5];
  void (**v14)(id, uint64_t, _QWORD);
  os_activity_scope_state_s state;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, uint64_t, _QWORD))a3;
  v5 = self->_assertionUpdateListeners;
  objc_sync_enter(v5);
  v6 = -[NSHashTable count](self->_assertionUpdateListeners, "count");
  objc_sync_exit(v5);

  if (!v6)
    goto LABEL_8;
  p_registeredForUpdates = &self->_registeredForUpdates;
  do
    v8 = __ldaxr((unsigned __int8 *)p_registeredForUpdates);
  while (__stlxr(1u, (unsigned __int8 *)p_registeredForUpdates));
  if ((v8 & 1) != 0)
  {
LABEL_8:
    v4[2](v4, 1, 0);
  }
  else
  {
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    v9 = _os_activity_create(&dword_19ABEB000, "com.apple.donotdisturb.DNDModeAssertionService.registerForAssertionUpdates", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v9, &state);
    +[DNDRequestDetails detailsRepresentingNowWithClientIdentifier:](DNDRequestDetails, "detailsRepresentingNowWithClientIdentifier:", self->_clientIdentifier);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = DNDLogModeAssertion;
    if (os_log_type_enabled((os_log_t)DNDLogModeAssertion, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v17 = v10;
      _os_log_impl(&dword_19ABEB000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] Registering assertion update listener", buf, 0xCu);
    }
    +[DNDRemoteServiceConnection sharedInstance](DNDRemoteServiceConnection, "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __87__DNDModeAssertionService__registerForAssertionUpdatesIfRequiredWithCompletionHandler___block_invoke;
    v13[3] = &unk_1E39B6058;
    v13[4] = self;
    v14 = v4;
    objc_msgSend(v12, "registerForAssertionUpdatesWithRequestDetails:completionHandler:", v10, v13);

    os_activity_scope_leave(&state);
  }

}

void __87__DNDModeAssertionService__registerForAssertionUpdatesIfRequiredWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;

  v12 = a2;
  v5 = a3;
  v6 = objc_msgSend(v12, "BOOLValue");
  v7 = *(_QWORD *)(a1 + 32);
  if (v6)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(v7 + 48));
    v8 = *(_QWORD *)(a1 + 32);
    if (!*(_QWORD *)(v8 + 40) && !*(_BYTE *)(v8 + 52))
    {
      objc_msgSend((id)v8, "activeModeAssertionWithError:", 0);
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = *(_QWORD *)(a1 + 32);
      v11 = *(void **)(v10 + 40);
      *(_QWORD *)(v10 + 40) = v9;

      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 52) = 1;
      v8 = *(_QWORD *)(a1 + 32);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(v8 + 48));
  }
  else
  {
    atomic_store(0, (unsigned __int8 *)(v7 + 32));
  }
  (*(void (**)(_QWORD, uint64_t, id))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), objc_msgSend(v12, "BOOLValue"), v5);

}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeAssertion, 0);
  objc_storeStrong((id *)&self->_assertionUpdateListeners, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_calloutQueue, 0);
}

- (BOOL)addAssertionUpdateListener:(id)a3 error:(id *)a4
{
  -[DNDModeAssertionService addAssertionUpdateListener:withCompletionHandler:](self, "addAssertionUpdateListener:withCompletionHandler:", a3, 0);
  return 1;
}

- (BOOL)removeAssertionUpdateListener:(id)a3 error:(id *)a4
{
  -[DNDModeAssertionService removeAssertionUpdateListener:](self, "removeAssertionUpdateListener:", a3, a4);
  return 1;
}

- (void)takeModeAssertionWithDetails:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0(&dword_19ABEB000, v0, v1, "[%{public}@] Error when taking mode assertion, error='%{public}@'");
  OUTLINED_FUNCTION_1();
}

- (void)invalidateActiveModeAssertionWithInvalidationDetails:reasonOverride:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0(&dword_19ABEB000, v0, v1, "[%{public}@] Error when invalidating mode assertion, error='%{public}@'");
  OUTLINED_FUNCTION_1();
}

- (void)activeModeAssertionWithError:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0(&dword_19ABEB000, v0, v1, "[%{public}@] Error when requesting active mode assertion, error='%{public}@'");
  OUTLINED_FUNCTION_1();
}

- (void)latestModeAssertionInvalidationWithError:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0(&dword_19ABEB000, v0, v1, "[%{public}@] Error when requesting latest mode assertion invalidation, error='%{public}@'");
  OUTLINED_FUNCTION_1();
}

- (void)invalidateAllActiveModeAssertionsWithError:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0(&dword_19ABEB000, v0, v1, "[%{public}@] Error when invalidating all active mode assertions, error='%{public}@'");
  OUTLINED_FUNCTION_1();
}

- (void)allModeAssertionsWithError:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0(&dword_19ABEB000, v0, v1, "[%{public}@] Error when requesting all active mode assertions, error='%{public}@'");
  OUTLINED_FUNCTION_1();
}

void __76__DNDModeAssertionService_addAssertionUpdateListener_withCompletionHandler___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
  v5 = 138543874;
  v6 = v4;
  v7 = 2114;
  v8 = v3;
  v9 = 2114;
  v10 = a2;
  _os_log_error_impl(&dword_19ABEB000, log, OS_LOG_TYPE_ERROR, "[%{public}@] Did not register for assertion updates, will remove listener: listener=%{public}@, error=%{public}@", (uint8_t *)&v5, 0x20u);
}

@end
