@implementation DNDAuxiliaryStateService

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
  if (serviceForClientIdentifier__onceToken != -1)
    dispatch_once(&serviceForClientIdentifier__onceToken, &__block_literal_global);
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy_;
  v17 = __Block_byref_object_dispose_;
  v18 = 0;
  v5 = serviceForClientIdentifier__lockQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__DNDAuxiliaryStateService_serviceForClientIdentifier___block_invoke_2;
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

void __55__DNDAuxiliaryStateService_serviceForClientIdentifier___block_invoke()
{
  NSObject *v0;
  dispatch_queue_t v1;
  void *v2;
  uint64_t v3;
  void *v4;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = dispatch_queue_create("com.apple.donotdisturb.DNDAppInfoService.service.lock", v0);
  v2 = (void *)serviceForClientIdentifier__lockQueue;
  serviceForClientIdentifier__lockQueue = (uint64_t)v1;

  objc_msgSend(MEMORY[0x1E0CB3748], "mapTableWithKeyOptions:valueOptions:", 0, 517);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)serviceForClientIdentifier__serviceByClientIdentifier;
  serviceForClientIdentifier__serviceByClientIdentifier = v3;

}

void __55__DNDAuxiliaryStateService_serviceForClientIdentifier___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  objc_msgSend((id)serviceForClientIdentifier__serviceByClientIdentifier, "objectForKey:", *(_QWORD *)(a1 + 32));
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

    objc_msgSend((id)serviceForClientIdentifier__serviceByClientIdentifier, "setObject:forKey:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(_QWORD *)(a1 + 32));
  }
}

- (BOOL)setScreenIsShared:(BOOL)a3 screenIsMirrored:(BOOL)a4 error:(id *)a5
{
  _BOOL8 v6;
  _BOOL8 v7;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  BOOL v16;
  uint64_t v18;
  _QWORD v19[6];
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
  _BYTE v34[10];
  _BOOL4 v35;
  __int16 v36;
  _BOOL4 v37;
  uint64_t v38;

  v6 = a4;
  v7 = a3;
  v38 = *MEMORY[0x1E0C80C00];
  v9 = _os_activity_create(&dword_19ABEB000, "com.apple.donotdisturb.DNDAuxiliaryStateService.setScreenIsShared:screenIsMirrored:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v9, &state);
  +[DNDRequestDetails detailsRepresentingNowWithClientIdentifier:](DNDRequestDetails, "detailsRepresentingNowWithClientIdentifier:", self->_clientIdentifier);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy_;
  v24 = __Block_byref_object_dispose_;
  v25 = 0;
  +[DNDRemoteServiceConnection sharedInstance](DNDRemoteServiceConnection, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __69__DNDAuxiliaryStateService_setScreenIsShared_screenIsMirrored_error___block_invoke;
  v19[3] = &unk_1E39B5610;
  v19[4] = &v26;
  v19[5] = &v20;
  objc_msgSend(v11, "setScreenIsShared:screenIsMirrored:withRequestDetails:completionHandler:", v12, v13, v10, v19);

  v14 = DNDLogAuxiliaryState;
  if (*((_BYTE *)v27 + 24))
  {
    if (os_log_type_enabled((os_log_t)DNDLogAuxiliaryState, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      v32 = v10;
      v33 = 1024;
      *(_DWORD *)v34 = v7;
      *(_WORD *)&v34[4] = 1024;
      *(_DWORD *)&v34[6] = v6;
      _os_log_impl(&dword_19ABEB000, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@] Set auxiliary state; isScreenShared=%d isScreenMirrored=%d",
        buf,
        0x18u);
      if (!a5)
        goto LABEL_9;
      goto LABEL_7;
    }
LABEL_6:
    if (!a5)
      goto LABEL_9;
    goto LABEL_7;
  }
  if (!os_log_type_enabled((os_log_t)DNDLogAuxiliaryState, OS_LOG_TYPE_ERROR))
    goto LABEL_6;
  v18 = v21[5];
  *(_DWORD *)buf = 138544130;
  v32 = v10;
  v33 = 2114;
  *(_QWORD *)v34 = v18;
  *(_WORD *)&v34[8] = 1024;
  v35 = v7;
  v36 = 1024;
  v37 = v6;
  _os_log_error_impl(&dword_19ABEB000, v14, OS_LOG_TYPE_ERROR, "[%{public}@] Error when setting auxiliary state; error='%{public}@' isScreenShared=%d isScreenMirrored=%d",
    buf,
    0x22u);
  if (!a5)
    goto LABEL_9;
LABEL_7:
  v15 = (void *)v21[5];
  if (v15)
    *a5 = objc_retainAutorelease(v15);
LABEL_9:
  v16 = *((_BYTE *)v27 + 24) != 0;
  _Block_object_dispose(&v20, 8);

  _Block_object_dispose(&v26, 8);
  os_activity_scope_leave(&state);

  return v16;
}

void __69__DNDAuxiliaryStateService_setScreenIsShared_screenIsMirrored_error___block_invoke(uint64_t a1, void *a2, void *a3)
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
  DNDAuxiliaryStateService *v5;
  uint64_t v6;
  NSString *clientIdentifier;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *queue;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)DNDAuxiliaryStateService;
  v5 = -[DNDAuxiliaryStateService init](&v12, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    clientIdentifier = v5->_clientIdentifier;
    v5->_clientIdentifier = (NSString *)v6;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = dispatch_queue_create("com.apple.donotdisturb.DNDAuxiliaryStateService", v8);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v9;

  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
