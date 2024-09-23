@implementation DNDSettingsService

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
  if (serviceForClientIdentifier__onceToken_10 != -1)
    dispatch_once(&serviceForClientIdentifier__onceToken_10, &__block_literal_global_16);
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__10;
  v17 = __Block_byref_object_dispose__10;
  v18 = 0;
  v5 = serviceForClientIdentifier__lockQueue_9;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__DNDSettingsService_serviceForClientIdentifier___block_invoke_2;
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

void __49__DNDSettingsService_serviceForClientIdentifier___block_invoke()
{
  NSObject *v0;
  dispatch_queue_t v1;
  void *v2;
  uint64_t v3;
  void *v4;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = dispatch_queue_create("com.apple.donotdisturb.DNDSettingsService.service.lock", v0);
  v2 = (void *)serviceForClientIdentifier__lockQueue_9;
  serviceForClientIdentifier__lockQueue_9 = (uint64_t)v1;

  objc_msgSend(MEMORY[0x1E0CB3748], "mapTableWithKeyOptions:valueOptions:", 0, 517);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)serviceForClientIdentifier__serviceByClientIdentifier_10;
  serviceForClientIdentifier__serviceByClientIdentifier_10 = v3;

}

void __49__DNDSettingsService_serviceForClientIdentifier___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  objc_msgSend((id)serviceForClientIdentifier__serviceByClientIdentifier_10, "objectForKey:", *(_QWORD *)(a1 + 32));
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

    objc_msgSend((id)serviceForClientIdentifier__serviceByClientIdentifier_10, "setObject:forKey:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(_QWORD *)(a1 + 32));
  }
}

- (id)_initWithClientIdentifier:(id)a3
{
  id v4;
  DNDSettingsService *v5;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *queue;
  NSObject *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *calloutQueue;
  uint64_t v12;
  NSString *clientIdentifier;
  uint64_t v14;
  NSHashTable *settingsUpdateListeners;
  uint64_t v16;
  DNDModeConfigurationService *modeConfigurationService;
  uint64_t v18;
  DNDGlobalConfigurationService *globalConfigurationService;
  void *v20;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)DNDSettingsService;
  v5 = -[DNDSettingsService init](&v22, sel_init);
  if (v5)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = dispatch_queue_create("com.apple.donotdisturb.SettingsService", v6);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v7;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = dispatch_queue_create("com.apple.donotdisturb.SettingsService.call-out", v9);
    calloutQueue = v5->_calloutQueue;
    v5->_calloutQueue = (OS_dispatch_queue *)v10;

    v12 = objc_msgSend(v4, "copy");
    clientIdentifier = v5->_clientIdentifier;
    v5->_clientIdentifier = (NSString *)v12;

    objc_msgSend(MEMORY[0x1E0CB3690], "hashTableWithOptions:", 517);
    v14 = objc_claimAutoreleasedReturnValue();
    settingsUpdateListeners = v5->_settingsUpdateListeners;
    v5->_settingsUpdateListeners = (NSHashTable *)v14;

    +[DNDModeConfigurationService serviceForClientIdentifier:](DNDModeConfigurationService, "serviceForClientIdentifier:", v4);
    v16 = objc_claimAutoreleasedReturnValue();
    modeConfigurationService = v5->_modeConfigurationService;
    v5->_modeConfigurationService = (DNDModeConfigurationService *)v16;

    +[DNDGlobalConfigurationService serviceForClientIdentifier:](DNDGlobalConfigurationService, "serviceForClientIdentifier:", v4);
    v18 = objc_claimAutoreleasedReturnValue();
    globalConfigurationService = v5->_globalConfigurationService;
    v5->_globalConfigurationService = (DNDGlobalConfigurationService *)v18;

    +[DNDRemoteServiceConnection sharedInstance](DNDRemoteServiceConnection, "sharedInstance");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addEventListener:", v5);

  }
  return v5;
}

- (id)behaviorSettingsReturningError:(id *)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
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
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = _os_activity_create(&dword_19ABEB000, "com.apple.donotdisturb.DNDSettingsService.behaviorSettings", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  +[DNDRequestDetails detailsRepresentingNowWithClientIdentifier:](DNDRequestDetails, "detailsRepresentingNowWithClientIdentifier:", self->_clientIdentifier);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__10;
  v24 = __Block_byref_object_dispose__10;
  v25 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__10;
  v18 = __Block_byref_object_dispose__10;
  v19 = 0;
  +[DNDRemoteServiceConnection sharedInstance](DNDRemoteServiceConnection, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __53__DNDSettingsService_behaviorSettingsReturningError___block_invoke;
  v13[3] = &unk_1E39B68C8;
  v13[4] = &v20;
  v13[5] = &v14;
  objc_msgSend(v7, "getBehaviorSettingsWithRequestDetails:completionHandler:", v6, v13);

  if (!v21[5] && os_log_type_enabled((os_log_t)DNDLogSettings, OS_LOG_TYPE_ERROR))
    -[DNDSettingsService behaviorSettingsReturningError:].cold.1();
  if (a3)
  {
    v8 = (void *)v15[5];
    if (v8)
      *a3 = objc_retainAutorelease(v8);
  }
  v9 = DNDLogSettings;
  if (os_log_type_enabled((os_log_t)DNDLogSettings, OS_LOG_TYPE_DEFAULT))
  {
    v10 = v21[5];
    *(_DWORD *)buf = 138543618;
    v28 = v6;
    v29 = 2114;
    v30 = v10;
    _os_log_impl(&dword_19ABEB000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] Got behavior settings, settings=%{public}@", buf, 0x16u);
  }
  v11 = (id)v21[5];
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&v20, 8);
  os_activity_scope_leave(&state);

  return v11;
}

void __53__DNDSettingsService_behaviorSettingsReturningError___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (BOOL)setBehaviorSettings:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  BOOL v12;
  uint64_t v14;
  _QWORD v15[6];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  id v30;
  __int16 v31;
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = _os_activity_create(&dword_19ABEB000, "com.apple.donotdisturb.DNDSettingsService.setBehaviorSettings", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  +[DNDRequestDetails detailsRepresentingNowWithClientIdentifier:](DNDRequestDetails, "detailsRepresentingNowWithClientIdentifier:", self->_clientIdentifier);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__10;
  v20 = __Block_byref_object_dispose__10;
  v21 = 0;
  +[DNDRemoteServiceConnection sharedInstance](DNDRemoteServiceConnection, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __48__DNDSettingsService_setBehaviorSettings_error___block_invoke;
  v15[3] = &unk_1E39B5610;
  v15[4] = &v22;
  v15[5] = &v16;
  objc_msgSend(v9, "setBehaviorSettings:withRequestDetails:completionHandler:", v6, v8, v15);

  v10 = DNDLogSettings;
  if (*((_BYTE *)v23 + 24))
  {
    if (os_log_type_enabled((os_log_t)DNDLogSettings, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v28 = v8;
      v29 = 2114;
      v30 = v6;
      _os_log_impl(&dword_19ABEB000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] Set behavior settings, settings=%{public}@", buf, 0x16u);
      if (!a4)
        goto LABEL_9;
      goto LABEL_7;
    }
LABEL_6:
    if (!a4)
      goto LABEL_9;
    goto LABEL_7;
  }
  if (!os_log_type_enabled((os_log_t)DNDLogSettings, OS_LOG_TYPE_ERROR))
    goto LABEL_6;
  v14 = v17[5];
  *(_DWORD *)buf = 138543874;
  v28 = v8;
  v29 = 2114;
  v30 = v6;
  v31 = 2114;
  v32 = v14;
  _os_log_error_impl(&dword_19ABEB000, v10, OS_LOG_TYPE_ERROR, "[%{public}@] Error setting behavior settings, settings=%{public}@, error='%{public}@'", buf, 0x20u);
  if (!a4)
    goto LABEL_9;
LABEL_7:
  v11 = (void *)v17[5];
  if (v11)
    *a4 = objc_retainAutorelease(v11);
LABEL_9:
  v12 = *((_BYTE *)v23 + 24) != 0;
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);
  os_activity_scope_leave(&state);

  return v12;
}

void __48__DNDSettingsService_setBehaviorSettings_error___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (id)phoneCallBypassSettingsReturningError:(id *)a3
{
  return -[DNDGlobalConfigurationService getPhoneCallBypassSettingsReturningError:](self->_globalConfigurationService, "getPhoneCallBypassSettingsReturningError:", a3);
}

- (BOOL)setPhoneCallBypassSettings:(id)a3 error:(id *)a4
{
  return -[DNDGlobalConfigurationService setPhoneCallBypassSettings:error:](self->_globalConfigurationService, "setPhoneCallBypassSettings:error:", a3, a4);
}

- (id)scheduleSettingsReturningError:(id *)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
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
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = _os_activity_create(&dword_19ABEB000, "com.apple.donotdisturb.DNDSettingsService.scheduleSettings", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  +[DNDRequestDetails detailsRepresentingNowWithClientIdentifier:](DNDRequestDetails, "detailsRepresentingNowWithClientIdentifier:", self->_clientIdentifier);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__10;
  v24 = __Block_byref_object_dispose__10;
  v25 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__10;
  v18 = __Block_byref_object_dispose__10;
  v19 = 0;
  +[DNDRemoteServiceConnection sharedInstance](DNDRemoteServiceConnection, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __53__DNDSettingsService_scheduleSettingsReturningError___block_invoke;
  v13[3] = &unk_1E39B68F0;
  v13[4] = &v20;
  v13[5] = &v14;
  objc_msgSend(v7, "getScheduleSettingsWithRequestDetails:completionHandler:", v6, v13);

  if (!v21[5] && os_log_type_enabled((os_log_t)DNDLogSettings, OS_LOG_TYPE_ERROR))
    -[DNDSettingsService scheduleSettingsReturningError:].cold.1();
  if (a3)
  {
    v8 = (void *)v15[5];
    if (v8)
      *a3 = objc_retainAutorelease(v8);
  }
  v9 = DNDLogSettings;
  if (os_log_type_enabled((os_log_t)DNDLogSettings, OS_LOG_TYPE_DEFAULT))
  {
    v10 = v21[5];
    *(_DWORD *)buf = 138543618;
    v28 = v6;
    v29 = 2114;
    v30 = v10;
    _os_log_impl(&dword_19ABEB000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] Got schedule settings, settings=%{public}@", buf, 0x16u);
  }
  v11 = (id)v21[5];
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&v20, 8);
  os_activity_scope_leave(&state);

  return v11;
}

void __53__DNDSettingsService_scheduleSettingsReturningError___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (BOOL)setScheduleSettings:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  BOOL v12;
  uint64_t v14;
  _QWORD v15[6];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  id v30;
  __int16 v31;
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = _os_activity_create(&dword_19ABEB000, "com.apple.donotdisturb.DNDSettingsService.setScheduleSettings", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  +[DNDRequestDetails detailsRepresentingNowWithClientIdentifier:](DNDRequestDetails, "detailsRepresentingNowWithClientIdentifier:", self->_clientIdentifier);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__10;
  v20 = __Block_byref_object_dispose__10;
  v21 = 0;
  +[DNDRemoteServiceConnection sharedInstance](DNDRemoteServiceConnection, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __48__DNDSettingsService_setScheduleSettings_error___block_invoke;
  v15[3] = &unk_1E39B5610;
  v15[4] = &v22;
  v15[5] = &v16;
  objc_msgSend(v9, "setScheduleSettings:withRequestDetails:completionHandler:", v6, v8, v15);

  v10 = DNDLogSettings;
  if (*((_BYTE *)v23 + 24))
  {
    if (os_log_type_enabled((os_log_t)DNDLogSettings, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v28 = v8;
      v29 = 2114;
      v30 = v6;
      _os_log_impl(&dword_19ABEB000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] Set schedule settings, settings=%{public}@", buf, 0x16u);
      if (!a4)
        goto LABEL_9;
      goto LABEL_7;
    }
LABEL_6:
    if (!a4)
      goto LABEL_9;
    goto LABEL_7;
  }
  if (!os_log_type_enabled((os_log_t)DNDLogSettings, OS_LOG_TYPE_ERROR))
    goto LABEL_6;
  v14 = v17[5];
  *(_DWORD *)buf = 138543874;
  v28 = v8;
  v29 = 2114;
  v30 = v6;
  v31 = 2114;
  v32 = v14;
  _os_log_error_impl(&dword_19ABEB000, v10, OS_LOG_TYPE_ERROR, "[%{public}@] Error setting schedule settings, settings=%{public}@, error='%{public}@'", buf, 0x20u);
  if (!a4)
    goto LABEL_9;
LABEL_7:
  v11 = (void *)v17[5];
  if (v11)
    *a4 = objc_retainAutorelease(v11);
LABEL_9:
  v12 = *((_BYTE *)v23 + 24) != 0;
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);
  os_activity_scope_leave(&state);

  return v12;
}

void __48__DNDSettingsService_setScheduleSettings_error___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (id)configurationForModeIdentifier:(id)a3 error:(id *)a4
{
  void *v4;
  void *v5;

  -[DNDModeConfigurationService modeConfigurationForModeIdentifier:error:](self->_modeConfigurationService, "modeConfigurationForModeIdentifier:error:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)setConfiguration:(id)a3 forModeIdentifier:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  BOOL v11;
  void *v12;

  v8 = a3;
  -[DNDModeConfigurationService modeConfigurationForModeIdentifier:error:](self->_modeConfigurationService, "modeConfigurationForModeIdentifier:error:", a4, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  v11 = 0;
  if (!a5 && v9)
  {
    v12 = (void *)objc_msgSend(v9, "mutableCopy");
    objc_msgSend(v12, "setConfiguration:", v8);
    v11 = -[DNDModeConfigurationService setModeConfiguration:error:](self->_modeConfigurationService, "setModeConfiguration:error:", v12, 0);

  }
  return v11;
}

- (void)addSettingsUpdateListener:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *queue;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  DNDSettingsService *v14;
  id v15;
  os_activity_scope_state_s state;

  v6 = a3;
  v7 = a4;
  v8 = _os_activity_create(&dword_19ABEB000, "com.apple.donotdisturb.DNDSettingsService.addSettingsUpdateListener", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__DNDSettingsService_addSettingsUpdateListener_withCompletionHandler___block_invoke;
  block[3] = &unk_1E39B5700;
  v13 = v6;
  v14 = self;
  v15 = v7;
  v10 = v7;
  v11 = v6;
  dispatch_sync(queue, block);

  os_activity_scope_leave(&state);
}

void __70__DNDSettingsService_addSettingsUpdateListener_withCompletionHandler___block_invoke(uint64_t a1)
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
  v2 = DNDLogSettings;
  if (os_log_type_enabled((os_log_t)DNDLogSettings, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v14 = v3;
    _os_log_impl(&dword_19ABEB000, v2, OS_LOG_TYPE_DEFAULT, "Adding settings update listener: listener=%{public}@", buf, 0xCu);
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "addObject:", *(_QWORD *)(a1 + 32));
  v4 = objc_msgSend(*(id *)(a1 + 40), "_queue_registerForSettingsUpdatesIfRequired");
  v5 = v4;
  v6 = DNDLogSettings;
  if (v4)
  {
    if (os_log_type_enabled((os_log_t)DNDLogSettings, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      v14 = v7;
      _os_log_impl(&dword_19ABEB000, v6, OS_LOG_TYPE_DEFAULT, "Registered for settings updates: listener=%{public}@", buf, 0xCu);
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)DNDLogSettings, OS_LOG_TYPE_ERROR))
      __70__DNDSettingsService_addSettingsUpdateListener_withCompletionHandler___block_invoke_cold_1((uint64_t *)(a1 + 32), v6);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "removeObject:", *(_QWORD *)(a1 + 32));
  }
  v8 = *(void **)(a1 + 48);
  if (v8)
  {
    v9 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 16);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __70__DNDSettingsService_addSettingsUpdateListener_withCompletionHandler___block_invoke_13;
    v10[3] = &unk_1E39B5728;
    v11 = v8;
    v12 = v5;
    dispatch_async(v9, v10);

  }
}

uint64_t __70__DNDSettingsService_addSettingsUpdateListener_withCompletionHandler___block_invoke_13(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40), 0);
}

- (void)removeSettingsUpdateListener:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *queue;
  id v7;
  _QWORD v8[4];
  id v9;
  DNDSettingsService *v10;
  os_activity_scope_state_s state;

  v4 = a3;
  v5 = _os_activity_create(&dword_19ABEB000, "com.apple.donotdisturb.DNDSettingsService.removeSettingsUpdateListener", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  queue = self->_queue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __51__DNDSettingsService_removeSettingsUpdateListener___block_invoke;
  v8[3] = &unk_1E39B5750;
  v9 = v4;
  v10 = self;
  v7 = v4;
  dispatch_sync(queue, v8);

  os_activity_scope_leave(&state);
}

uint64_t __51__DNDSettingsService_removeSettingsUpdateListener___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = DNDLogSettings;
  if (os_log_type_enabled((os_log_t)DNDLogSettings, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 138543362;
    v6 = v3;
    _os_log_impl(&dword_19ABEB000, v2, OS_LOG_TYPE_DEFAULT, "Removing settings update listener: listener=%{public}@", (uint8_t *)&v5, 0xCu);
  }
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "removeObject:", *(_QWORD *)(a1 + 32));
}

- (void)remoteService:(id)a3 didReceiveUpdatedBehaviorSettings:(id)a4
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
  block[2] = __70__DNDSettingsService_remoteService_didReceiveUpdatedBehaviorSettings___block_invoke;
  block[3] = &unk_1E39B5750;
  block[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_sync(queue, block);

}

void __70__DNDSettingsService_remoteService_didReceiveUpdatedBehaviorSettings___block_invoke(uint64_t a1)
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

  v2 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(v3 + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__DNDSettingsService_remoteService_didReceiveUpdatedBehaviorSettings___block_invoke_2;
  block[3] = &unk_1E39B5778;
  v8 = v2;
  v9 = v3;
  v10 = v4;
  v6 = v2;
  dispatch_async(v5, block);

}

void __70__DNDSettingsService_remoteService_didReceiveUpdatedBehaviorSettings___block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v6);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v7, "settingsService:didReceiveUpdatedBehaviorSettings:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), (_QWORD)v8);
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

- (void)remoteService:(id)a3 didReceiveUpdatedPhoneCallBypassSettings:(id)a4
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
  block[2] = __77__DNDSettingsService_remoteService_didReceiveUpdatedPhoneCallBypassSettings___block_invoke;
  block[3] = &unk_1E39B5750;
  block[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_sync(queue, block);

}

void __77__DNDSettingsService_remoteService_didReceiveUpdatedPhoneCallBypassSettings___block_invoke(uint64_t a1)
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

  v2 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(v3 + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77__DNDSettingsService_remoteService_didReceiveUpdatedPhoneCallBypassSettings___block_invoke_2;
  block[3] = &unk_1E39B5778;
  v8 = v2;
  v9 = v3;
  v10 = v4;
  v6 = v2;
  dispatch_async(v5, block);

}

void __77__DNDSettingsService_remoteService_didReceiveUpdatedPhoneCallBypassSettings___block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v6);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v7, "settingsService:didReceiveUpdatedPhoneCallBypassSettings:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), (_QWORD)v8);
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

- (void)remoteService:(id)a3 didReceiveUpdatedScheduleSettings:(id)a4
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
  block[2] = __70__DNDSettingsService_remoteService_didReceiveUpdatedScheduleSettings___block_invoke;
  block[3] = &unk_1E39B5750;
  block[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_sync(queue, block);

}

void __70__DNDSettingsService_remoteService_didReceiveUpdatedScheduleSettings___block_invoke(uint64_t a1)
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

  v2 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(v3 + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__DNDSettingsService_remoteService_didReceiveUpdatedScheduleSettings___block_invoke_2;
  block[3] = &unk_1E39B5778;
  v8 = v2;
  v9 = v3;
  v10 = v4;
  v6 = v2;
  dispatch_async(v5, block);

}

void __70__DNDSettingsService_remoteService_didReceiveUpdatedScheduleSettings___block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v6);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v7, "settingsService:didReceiveUpdatedScheduleSettings:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), (_QWORD)v8);
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

- (BOOL)_queue_registerForSettingsUpdatesIfRequired
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
  if (-[NSHashTable count](self->_settingsUpdateListeners, "count") && !self->_registeredForUpdates)
  {
    v3 = _os_activity_create(&dword_19ABEB000, "com.apple.donotdisturb.DNDSettingsService.registerForSettingsUpdates", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v3, &state);
    +[DNDRequestDetails detailsRepresentingNowWithClientIdentifier:](DNDRequestDetails, "detailsRepresentingNowWithClientIdentifier:", self->_clientIdentifier);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = DNDLogSettings;
    if (os_log_type_enabled((os_log_t)DNDLogSettings, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = v4;
      _os_log_impl(&dword_19ABEB000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Registering settings update listener", (uint8_t *)&buf, 0xCu);
    }
    v9 = 0;
    v10 = &v9;
    v11 = 0x2020000000;
    v12 = 0;
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v15 = 0x3032000000;
    v16 = __Block_byref_object_copy__10;
    v17 = __Block_byref_object_dispose__10;
    v18 = 0;
    +[DNDRemoteServiceConnection sharedInstance](DNDRemoteServiceConnection, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __65__DNDSettingsService__queue_registerForSettingsUpdatesIfRequired__block_invoke;
    v8[3] = &unk_1E39B5610;
    v8[4] = &v9;
    v8[5] = &buf;
    objc_msgSend(v6, "registerForSettingsUpdatesWithRequestDetails:completionHandler:", v4, v8);

    if (*(_QWORD *)(*((_QWORD *)&buf + 1) + 40) && os_log_type_enabled((os_log_t)DNDLogSettings, OS_LOG_TYPE_ERROR))
      -[DNDSettingsService _queue_registerForSettingsUpdatesIfRequired].cold.1();
    self->_registeredForUpdates = *((_BYTE *)v10 + 24);
    _Block_object_dispose(&buf, 8);

    _Block_object_dispose(&v9, 8);
    os_activity_scope_leave(&state);

  }
  return !-[NSHashTable count](self->_settingsUpdateListeners, "count") || self->_registeredForUpdates;
}

void __65__DNDSettingsService__queue_registerForSettingsUpdatesIfRequired__block_invoke(uint64_t a1, void *a2, void *a3)
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

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_globalConfigurationService, 0);
  objc_storeStrong((id *)&self->_modeConfigurationService, 0);
  objc_storeStrong((id *)&self->_settingsUpdateListeners, 0);
  objc_storeStrong((id *)&self->_calloutQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (BOOL)addSettingsUpdateListener:(id)a3 error:(id *)a4
{
  -[DNDSettingsService addSettingsUpdateListener:withCompletionHandler:](self, "addSettingsUpdateListener:withCompletionHandler:", a3, 0);
  return 1;
}

- (BOOL)removeSettingsUpdateListener:(id)a3 error:(id *)a4
{
  -[DNDSettingsService removeSettingsUpdateListener:](self, "removeSettingsUpdateListener:", a3, a4);
  return 1;
}

- (void)behaviorSettingsReturningError:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0(&dword_19ABEB000, v0, v1, "[%{public}@] Error when getting behavior settings, error='%{public}@'");
  OUTLINED_FUNCTION_1();
}

- (void)scheduleSettingsReturningError:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0(&dword_19ABEB000, v0, v1, "[%{public}@] Error when getting schedule settings, error='%{public}@'");
  OUTLINED_FUNCTION_1();
}

void __70__DNDSettingsService_addSettingsUpdateListener_withCompletionHandler___block_invoke_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *a1;
  v3 = 138543362;
  v4 = v2;
  _os_log_error_impl(&dword_19ABEB000, a2, OS_LOG_TYPE_ERROR, "Did not register for settings updates, will remove listener: listener=%{public}@", (uint8_t *)&v3, 0xCu);
  OUTLINED_FUNCTION_1();
}

- (void)_queue_registerForSettingsUpdatesIfRequired
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0(&dword_19ABEB000, v0, v1, "[%{public}@] Error when registering settings update listener, error='%{public}@'");
  OUTLINED_FUNCTION_1();
}

@end
