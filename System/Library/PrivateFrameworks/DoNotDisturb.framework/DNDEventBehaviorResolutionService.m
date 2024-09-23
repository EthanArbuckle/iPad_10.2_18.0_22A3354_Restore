@implementation DNDEventBehaviorResolutionService

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
  if (serviceForClientIdentifier__onceToken_4 != -1)
    dispatch_once(&serviceForClientIdentifier__onceToken_4, &__block_literal_global_7);
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__4;
  v17 = __Block_byref_object_dispose__4;
  v18 = 0;
  v5 = serviceForClientIdentifier__lockQueue_4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__DNDEventBehaviorResolutionService_serviceForClientIdentifier___block_invoke_2;
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

void __64__DNDEventBehaviorResolutionService_serviceForClientIdentifier___block_invoke()
{
  NSObject *v0;
  dispatch_queue_t v1;
  void *v2;
  uint64_t v3;
  void *v4;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = dispatch_queue_create("com.apple.donotdisturb.DNDEventBehaviorResolutionService.service.lock", v0);
  v2 = (void *)serviceForClientIdentifier__lockQueue_4;
  serviceForClientIdentifier__lockQueue_4 = (uint64_t)v1;

  objc_msgSend(MEMORY[0x1E0CB3748], "mapTableWithKeyOptions:valueOptions:", 0, 517);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)serviceForClientIdentifier__serviceByClientIdentifier_4;
  serviceForClientIdentifier__serviceByClientIdentifier_4 = v3;

}

void __64__DNDEventBehaviorResolutionService_serviceForClientIdentifier___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  objc_msgSend((id)serviceForClientIdentifier__serviceByClientIdentifier_4, "objectForKey:", *(_QWORD *)(a1 + 32));
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

    objc_msgSend((id)serviceForClientIdentifier__serviceByClientIdentifier_4, "setObject:forKey:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(_QWORD *)(a1 + 32));
  }
}

- (id)_initWithClientIdentifier:(id)a3
{
  id v4;
  DNDEventBehaviorResolutionService *v5;
  uint64_t v6;
  NSString *clientIdentifier;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DNDEventBehaviorResolutionService;
  v5 = -[DNDEventBehaviorResolutionService init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    clientIdentifier = v5->_clientIdentifier;
    v5->_clientIdentifier = (NSString *)v6;

  }
  return v5;
}

- (id)resolveBehaviorForEventDetails:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  id v14;
  _QWORD v16[6];
  uint64_t v17;
  _QWORD v18[4];
  id v19;
  os_activity_scope_state_s state;
  uint8_t v21[4];
  void *v22;
  __int16 v23;
  id v24;
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
  v7 = _os_activity_create(&dword_19ABEB000, "com.apple.donotdisturb.DNDEventBehaviorResolutionService.resolveEvent", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v7, &state);
  +[DNDRequestDetails detailsRepresentingNowWithClientIdentifier:](DNDRequestDetails, "detailsRepresentingNowWithClientIdentifier:", self->_clientIdentifier);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = DNDLogBehaviorResolution;
  if (os_log_type_enabled((os_log_t)DNDLogBehaviorResolution, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v8;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v6;
    _os_log_impl(&dword_19ABEB000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] Resolving behavior for event, details=%@", buf, 0x16u);
  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v28 = __Block_byref_object_copy__4;
  v29 = __Block_byref_object_dispose__4;
  v30 = 0;
  v17 = 0;
  v18[0] = &v17;
  v18[1] = 0x3032000000;
  v18[2] = __Block_byref_object_copy__4;
  v18[3] = __Block_byref_object_dispose__4;
  v19 = 0;
  +[DNDRemoteServiceConnection sharedInstance](DNDRemoteServiceConnection, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __74__DNDEventBehaviorResolutionService_resolveBehaviorForEventDetails_error___block_invoke;
  v16[3] = &unk_1E39B5D50;
  v16[4] = buf;
  v16[5] = &v17;
  objc_msgSend(v10, "resolveBehaviorForEventDetails:requestDetails:completionHandler:", v6, v8, v16);

  if (*(_QWORD *)(v18[0] + 40))
  {
    v11 = DNDLogBehaviorResolution;
    if (os_log_type_enabled((os_log_t)DNDLogBehaviorResolution, OS_LOG_TYPE_ERROR))
      -[DNDEventBehaviorResolutionService resolveBehaviorForEventDetails:error:].cold.1((uint64_t)v8, (uint64_t)v18, v11);
    if (a4)
      *a4 = objc_retainAutorelease(*(id *)(v18[0] + 40));
  }
  v12 = DNDLogBehaviorResolution;
  if (os_log_type_enabled((os_log_t)DNDLogBehaviorResolution, OS_LOG_TYPE_DEFAULT))
  {
    v13 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
    *(_DWORD *)v21 = 138543874;
    v22 = v8;
    v23 = 2112;
    v24 = v6;
    v25 = 2112;
    v26 = v13;
    _os_log_impl(&dword_19ABEB000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] Resolved event, details=%@ behavior=%@", v21, 0x20u);
  }
  os_activity_scope_leave(&state);
  v14 = *(id *)(*(_QWORD *)&buf[8] + 40);
  _Block_object_dispose(&v17, 8);

  _Block_object_dispose(buf, 8);
  return v14;
}

void __74__DNDEventBehaviorResolutionService_resolveBehaviorForEventDetails_error___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
}

- (void)resolveBehaviorForEventDetails:(os_log_t)log error:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(*(_QWORD *)a2 + 40);
  v4 = 138543618;
  v5 = a1;
  v6 = 2114;
  v7 = v3;
  _os_log_error_impl(&dword_19ABEB000, log, OS_LOG_TYPE_ERROR, "[%{public}@] Error when resolving behavior, error='%{public}@'", (uint8_t *)&v4, 0x16u);
}

@end
