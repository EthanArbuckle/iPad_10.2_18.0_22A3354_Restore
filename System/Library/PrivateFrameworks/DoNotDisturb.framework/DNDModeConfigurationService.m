@implementation DNDModeConfigurationService

void __66__DNDModeConfigurationService__queue_registerForUpdatesIfRequired__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
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

void __65__DNDModeConfigurationService_addListener_withCompletionHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  char v11;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(*(os_activity_t *)(a1 + 32), &state);
  v2 = DNDLogModeConfiguration;
  if (os_log_type_enabled((os_log_t)DNDLogModeConfiguration, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138543362;
    v14 = v3;
    _os_log_impl(&dword_19ABEB000, v2, OS_LOG_TYPE_DEFAULT, "Adding update listener: listener=%{public}@", buf, 0xCu);
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 24), "addObject:", *(_QWORD *)(a1 + 40));
  v4 = objc_msgSend(*(id *)(a1 + 48), "_queue_registerForUpdatesIfRequired");
  v5 = DNDLogModeConfiguration;
  if (v4)
  {
    if (os_log_type_enabled((os_log_t)DNDLogModeConfiguration, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543362;
      v14 = v6;
      _os_log_impl(&dword_19ABEB000, v5, OS_LOG_TYPE_DEFAULT, "Registered for updates: listener=%{public}@", buf, 0xCu);
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)DNDLogModeConfiguration, OS_LOG_TYPE_ERROR))
      __65__DNDModeConfigurationService_addListener_withCompletionHandler___block_invoke_cold_1((uint64_t *)(a1 + 40), v5);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 24), "removeObject:", *(_QWORD *)(a1 + 40));
  }
  v7 = *(void **)(a1 + 56);
  if (v7)
  {
    v8 = *(NSObject **)(*(_QWORD *)(a1 + 48) + 16);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __65__DNDModeConfigurationService_addListener_withCompletionHandler___block_invoke_45;
    v9[3] = &unk_1E39B5728;
    v10 = v7;
    v11 = v4;
    dispatch_async(v8, v9);

  }
  os_activity_scope_leave(&state);
}

- (void)addListener:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *queue;
  id v10;
  id v11;
  NSObject *v12;
  _QWORD v13[4];
  NSObject *v14;
  id v15;
  DNDModeConfigurationService *v16;
  id v17;
  os_activity_scope_state_s state;

  v6 = a3;
  v7 = a4;
  v8 = _os_activity_create(&dword_19ABEB000, "com.apple.donotdisturb.DNDModeConfigurationService.addListener", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  queue = self->_queue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __65__DNDModeConfigurationService_addListener_withCompletionHandler___block_invoke;
  v13[3] = &unk_1E39B5C68;
  v14 = v8;
  v15 = v6;
  v16 = self;
  v17 = v7;
  v10 = v7;
  v11 = v6;
  v12 = v8;
  dispatch_sync(queue, v13);

  os_activity_scope_leave(&state);
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
    v3 = _os_activity_create(&dword_19ABEB000, "com.apple.donotdisturb.DNDModeConfigurationService.registerForUpdates", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
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
      _os_log_impl(&dword_19ABEB000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Registering update listener", (uint8_t *)&buf, 0xCu);
    }
    v9 = 0;
    v10 = &v9;
    v11 = 0x2020000000;
    v12 = 0;
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v15 = 0x3032000000;
    v16 = __Block_byref_object_copy__3;
    v17 = __Block_byref_object_dispose__3;
    v18 = 0;
    +[DNDRemoteServiceConnection sharedInstance](DNDRemoteServiceConnection, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __66__DNDModeConfigurationService__queue_registerForUpdatesIfRequired__block_invoke;
    v8[3] = &unk_1E39B5C90;
    v8[4] = &v9;
    v8[5] = &buf;
    objc_msgSend(v6, "registerForModeSelectionUpdatesWithRequestDetails:completionHandler:", v4, v8);

    if (*(_QWORD *)(*((_QWORD *)&buf + 1) + 40) && os_log_type_enabled((os_log_t)DNDLogSettings, OS_LOG_TYPE_ERROR))
      -[DNDModeConfigurationService _queue_registerForUpdatesIfRequired].cold.1();
    self->_registeredForUpdates = *((_BYTE *)v10 + 24);
    _Block_object_dispose(&buf, 8);

    _Block_object_dispose(&v9, 8);
    os_activity_scope_leave(&state);

  }
  return !-[NSHashTable count](self->_listeners, "count") || self->_registeredForUpdates;
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
  if (serviceForClientIdentifier__onceToken_3 != -1)
    dispatch_once(&serviceForClientIdentifier__onceToken_3, &__block_literal_global_6);
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__3;
  v17 = __Block_byref_object_dispose__3;
  v18 = 0;
  v5 = serviceForClientIdentifier__lockQueue_3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__DNDModeConfigurationService_serviceForClientIdentifier___block_invoke_2;
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

void __58__DNDModeConfigurationService_serviceForClientIdentifier___block_invoke()
{
  NSObject *v0;
  dispatch_queue_t v1;
  void *v2;
  uint64_t v3;
  void *v4;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = dispatch_queue_create("com.apple.donotdisturb.DNDModeConfigurationService.service.lock", v0);
  v2 = (void *)serviceForClientIdentifier__lockQueue_3;
  serviceForClientIdentifier__lockQueue_3 = (uint64_t)v1;

  objc_msgSend(MEMORY[0x1E0CB3748], "mapTableWithKeyOptions:valueOptions:", 0, 517);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)serviceForClientIdentifier__serviceByClientIdentifier_3;
  serviceForClientIdentifier__serviceByClientIdentifier_3 = v3;

}

void __58__DNDModeConfigurationService_serviceForClientIdentifier___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  objc_msgSend((id)serviceForClientIdentifier__serviceByClientIdentifier_3, "objectForKey:", *(_QWORD *)(a1 + 32));
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

    objc_msgSend((id)serviceForClientIdentifier__serviceByClientIdentifier_3, "setObject:forKey:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(_QWORD *)(a1 + 32));
  }
}

- (BOOL)hasActivelyConfiguredModesReturningError:(id *)a3
{
  id v4;
  void *v5;
  BOOL v6;
  id v8;
  BOOL v9;

  v9 = 0;
  v8 = 0;
  -[DNDModeConfigurationService hasActivelyConfiguredModes:error:](self, "hasActivelyConfiguredModes:error:", &v9, &v8);
  v4 = v8;
  v5 = v4;
  if (a3)
    *a3 = objc_retainAutorelease(v4);
  v6 = v9;

  return v6;
}

- (BOOL)hasActivelyConfiguredModes:(BOOL *)a3 error:(id *)a4
{
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t i;
  NSObject *v14;
  const __CFString *v15;
  uint64_t *v16;
  void *v17;
  BOOL v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _QWORD v24[6];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  const __CFString *v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v7 = _os_activity_create(&dword_19ABEB000, "com.apple.donotdisturb.DNDModeConfigurationService.hasActivelyConfiguredModes", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  +[DNDRequestDetails detailsRepresentingNowWithClientIdentifier:](DNDRequestDetails, "detailsRepresentingNowWithClientIdentifier:", self->_clientIdentifier);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__3;
  v35 = __Block_byref_object_dispose__3;
  v36 = 0;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__3;
  v29 = __Block_byref_object_dispose__3;
  v30 = 0;
  +[DNDRemoteServiceConnection sharedInstance](DNDRemoteServiceConnection, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __64__DNDModeConfigurationService_hasActivelyConfiguredModes_error___block_invoke;
  v24[3] = &unk_1E39B5B28;
  v24[4] = &v31;
  v24[5] = &v25;
  objc_msgSend(v9, "getModeConfigurationsWithRequestDetails:completionHandler:", v8, v24);

  if (v26[5])
  {
    if (os_log_type_enabled((os_log_t)DNDLogModeConfiguration, OS_LOG_TYPE_ERROR))
      -[DNDModeConfigurationService hasActivelyConfiguredModes:error:].cold.1();
    LOBYTE(v10) = 0;
  }
  else
  {
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v11 = (id)v32[5];
    v10 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v42, 16);
    if (v10)
    {
      v12 = *(_QWORD *)v21;
      while (2)
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v21 != v12)
            objc_enumerationMutation(v11);
          if ((objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "isAutomaticallyGenerated", (_QWORD)v20) & 1) == 0)
          {
            LODWORD(v10) = 1;
            goto LABEL_15;
          }
        }
        v10 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v42, 16);
        if (v10)
          continue;
        break;
      }
    }
LABEL_15:

    v14 = DNDLogModeConfiguration;
    if (os_log_type_enabled((os_log_t)DNDLogModeConfiguration, OS_LOG_TYPE_DEFAULT))
    {
      v15 = CFSTR("NO");
      if ((_DWORD)v10)
        v15 = CFSTR("YES");
      *(_DWORD *)buf = 138543618;
      v39 = v8;
      v40 = 2114;
      v41 = v15;
      _os_log_impl(&dword_19ABEB000, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@] Determined if modes have been actively configured, hasActivelyConfiguredModes=%{public}@", buf, 0x16u);
    }
  }
  v16 = v26;
  if (a4)
  {
    v17 = (void *)v26[5];
    if (v17)
    {
      *a4 = objc_retainAutorelease(v17);
      v16 = v26;
    }
  }
  *a3 = v10;
  v18 = v16[5] == 0;
  _Block_object_dispose(&v25, 8);

  _Block_object_dispose(&v31, 8);
  os_activity_scope_leave(&state);

  return v18;
}

void __64__DNDModeConfigurationService_hasActivelyConfiguredModes_error___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (id)createModeConfigurationUsingTemplateForModeSemanticType:(int64_t)a3 error:(id *)a4
{
  int64_t v5;
  void *v6;
  void *v7;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v5 = a3 - 1;
  if ((unint64_t)(a3 - 1) < 9 && ((0x1FDu >> v5) & 1) != 0)
  {
    -[DNDModeConfigurationService createModeConfigurationUsingTemplateForModeIdentifier:error:](self, "createModeConfigurationUsingTemplateForModeIdentifier:error:", off_1E39B5D00[v5], a4);
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a4)
    {
      v6 = (void *)MEMORY[0x1E0CB35C8];
      v9 = *MEMORY[0x1E0CB2D50];
      v10[0] = CFSTR("Mode not supported.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "errorWithDomain:code:userInfo:", CFSTR("DNDErrorDomain"), 1006, v7);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    return 0;
  }
}

- (BOOL)setModeConfiguration:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  BOOL v13;
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
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = _os_activity_create(&dword_19ABEB000, "com.apple.donotdisturb.DNDModeConfigurationService.setModeConfiguration", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
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
  v19 = __Block_byref_object_copy__3;
  v20 = __Block_byref_object_dispose__3;
  v21 = 0;
  v9 = (void *)objc_msgSend(v6, "copy");
  +[DNDRemoteServiceConnection sharedInstance](DNDRemoteServiceConnection, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __58__DNDModeConfigurationService_setModeConfiguration_error___block_invoke;
  v15[3] = &unk_1E39B5610;
  v15[4] = &v22;
  v15[5] = &v16;
  objc_msgSend(v10, "setModeConfiguration:withRequestDetails:completionHandler:", v9, v8, v15);

  v11 = DNDLogModeConfiguration;
  if (*((_BYTE *)v23 + 24))
  {
    if (os_log_type_enabled((os_log_t)DNDLogModeConfiguration, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v28 = v8;
      v29 = 2114;
      v30 = v9;
      _os_log_impl(&dword_19ABEB000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] Set mode configuration, configuration=%{public}@", buf, 0x16u);
    }
  }
  else if (os_log_type_enabled((os_log_t)DNDLogModeConfiguration, OS_LOG_TYPE_ERROR))
  {
    -[DNDModeConfigurationService setModeConfiguration:error:].cold.1();
  }
  if (a4)
  {
    v12 = (void *)v17[5];
    if (v12)
      *a4 = objc_retainAutorelease(v12);
  }
  v13 = *((_BYTE *)v23 + 24) != 0;

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);

  os_activity_scope_leave(&state);
  return v13;
}

void __58__DNDModeConfigurationService_setModeConfiguration_error___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (BOOL)removeModeConfigurationForModeIdentifier:(id)a3 error:(id *)a4
{
  return -[DNDModeConfigurationService removeModeConfigurationForModeIdentifier:deletePlaceholder:error:](self, "removeModeConfigurationForModeIdentifier:deletePlaceholder:error:", a3, 0, a4);
}

- (BOOL)canRemoveModeConfigurationForModeIdentifier:(id)a3
{
  id v3;
  NSObject *v4;
  int v5;
  os_activity_scope_state_s v7;

  v3 = a3;
  v4 = _os_activity_create(&dword_19ABEB000, "com.apple.donotdisturb.DNDModeConfigurationService.removeModeConfiguration", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v7.opaque[0] = 0;
  v7.opaque[1] = 0;
  os_activity_scope_enter(v4, &v7);
  v5 = objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.donotdisturb.mode.default")) ^ 1;
  os_activity_scope_leave(&v7);

  return v5;
}

- (id)modeConfigurationsReturningError:(id *)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  id v10;
  _QWORD v12[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = _os_activity_create(&dword_19ABEB000, "com.apple.donotdisturb.DNDModeConfigurationService.getModeConfigurations", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  +[DNDRequestDetails detailsRepresentingNowWithClientIdentifier:](DNDRequestDetails, "detailsRepresentingNowWithClientIdentifier:", self->_clientIdentifier);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__3;
  v23 = __Block_byref_object_dispose__3;
  v24 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__3;
  v17 = __Block_byref_object_dispose__3;
  v18 = 0;
  +[DNDRemoteServiceConnection sharedInstance](DNDRemoteServiceConnection, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __64__DNDModeConfigurationService_modeConfigurationsReturningError___block_invoke;
  v12[3] = &unk_1E39B5B28;
  v12[4] = &v19;
  v12[5] = &v13;
  objc_msgSend(v7, "getModeConfigurationsWithRequestDetails:completionHandler:", v6, v12);

  v8 = DNDLogModeConfiguration;
  if (v14[5])
  {
    if (os_log_type_enabled((os_log_t)DNDLogModeConfiguration, OS_LOG_TYPE_ERROR))
      -[DNDModeConfigurationService modeConfigurationsReturningError:].cold.1();
  }
  else if (os_log_type_enabled((os_log_t)DNDLogModeConfiguration, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v27 = v6;
    _os_log_impl(&dword_19ABEB000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Get mode configurations", buf, 0xCu);
  }
  if (a3)
  {
    v9 = (void *)v14[5];
    if (v9)
      *a3 = objc_retainAutorelease(v9);
  }
  v10 = (id)v20[5];
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v19, 8);
  os_activity_scope_leave(&state);

  return v10;
}

void __64__DNDModeConfigurationService_modeConfigurationsReturningError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v22 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v13, "mode", (_QWORD)v21);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "modeIdentifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v13, v15);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v10);
  }

  v16 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v17 = *(void **)(v16 + 40);
  *(_QWORD *)(v16 + 40) = v7;
  v18 = v7;

  v19 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v20 = *(void **)(v19 + 40);
  *(_QWORD *)(v19 + 40) = v6;

}

- (id)modeConfigurationForModeIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  id v12;
  _QWORD v14[6];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = _os_activity_create(&dword_19ABEB000, "com.apple.donotdisturb.DNDModeConfigurationService.getModeConfiguration", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  +[DNDRequestDetails detailsRepresentingNowWithClientIdentifier:](DNDRequestDetails, "detailsRepresentingNowWithClientIdentifier:", self->_clientIdentifier);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__3;
  v25 = __Block_byref_object_dispose__3;
  v26 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__3;
  v19 = __Block_byref_object_dispose__3;
  v20 = 0;
  +[DNDRemoteServiceConnection sharedInstance](DNDRemoteServiceConnection, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __72__DNDModeConfigurationService_modeConfigurationForModeIdentifier_error___block_invoke;
  v14[3] = &unk_1E39B5B50;
  v14[4] = &v21;
  v14[5] = &v15;
  objc_msgSend(v9, "getModeConfigurationForModeIdentifier:withRequestDetails:completionHandler:", v6, v8, v14);

  v10 = DNDLogModeConfiguration;
  if (v16[5])
  {
    if (os_log_type_enabled((os_log_t)DNDLogModeConfiguration, OS_LOG_TYPE_ERROR))
      -[DNDModeConfigurationService modeConfigurationsReturningError:].cold.1();
  }
  else if (os_log_type_enabled((os_log_t)DNDLogModeConfiguration, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v29 = v8;
    v30 = 2114;
    v31 = v6;
    _os_log_impl(&dword_19ABEB000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] Get mode configuration, identifier=%{public}@", buf, 0x16u);
  }
  if (a4)
  {
    v11 = (void *)v16[5];
    if (v11)
      *a4 = objc_retainAutorelease(v11);
  }
  v12 = (id)v22[5];
  _Block_object_dispose(&v15, 8);

  _Block_object_dispose(&v21, 8);
  os_activity_scope_leave(&state);

  return v12;
}

void __72__DNDModeConfigurationService_modeConfigurationForModeIdentifier_error___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (BOOL)isLocalUserAvailableForContactInActiveMode:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  BOOL v13;
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
  void *v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = _os_activity_create(&dword_19ABEB000, "com.apple.donotdisturb.DNDModeConfigurationService.getIsLocalUserAvailable", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
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
  v19 = __Block_byref_object_copy__3;
  v20 = __Block_byref_object_dispose__3;
  v21 = 0;
  +[DNDRemoteServiceConnection sharedInstance](DNDRemoteServiceConnection, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __80__DNDModeConfigurationService_isLocalUserAvailableForContactInActiveMode_error___block_invoke;
  v15[3] = &unk_1E39B5610;
  v15[4] = &v22;
  v15[5] = &v16;
  objc_msgSend(v9, "getUserAvailabilityInActiveModeForContactHandle:withRequestDetails:completionHandler:", v6, v8, v15);

  if (v17[5])
  {
    if (os_log_type_enabled((os_log_t)DNDLogModeConfiguration, OS_LOG_TYPE_ERROR))
      -[DNDModeConfigurationService isLocalUserAvailableForContactInActiveMode:error:].cold.1();
  }
  else
  {
    v10 = (id)DNDLogModeConfiguration;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *((unsigned __int8 *)v23 + 24));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543875;
      v28 = v8;
      v29 = 2114;
      v30 = v11;
      v31 = 2113;
      v32 = v6;
      _os_log_impl(&dword_19ABEB000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] Get user availability in current mode for contact, availability=%{public}@, handle=%{private}@", buf, 0x20u);

    }
  }
  if (a4)
  {
    v12 = (void *)v17[5];
    if (v12)
      *a4 = objc_retainAutorelease(v12);
  }
  v13 = *((_BYTE *)v23 + 24) != 0;
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);
  os_activity_scope_leave(&state);

  return v13;
}

void __80__DNDModeConfigurationService_isLocalUserAvailableForContactInActiveMode_error___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (id)allowedModesForContactHandle:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  id v12;
  _QWORD v14[6];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = _os_activity_create(&dword_19ABEB000, "com.apple.donotdisturb.DNDModeConfigurationService.getAllowedModesForContact", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  +[DNDRequestDetails detailsRepresentingNowWithClientIdentifier:](DNDRequestDetails, "detailsRepresentingNowWithClientIdentifier:", self->_clientIdentifier);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__3;
  v25 = __Block_byref_object_dispose__3;
  v26 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__3;
  v19 = __Block_byref_object_dispose__3;
  v20 = 0;
  +[DNDRemoteServiceConnection sharedInstance](DNDRemoteServiceConnection, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __66__DNDModeConfigurationService_allowedModesForContactHandle_error___block_invoke;
  v14[3] = &unk_1E39B5B28;
  v14[4] = &v21;
  v14[5] = &v15;
  objc_msgSend(v9, "getAllowedModesForContactHandle:withRequestDetails:completionHandler:", v6, v8, v14);

  v10 = DNDLogModeConfiguration;
  if (v16[5])
  {
    if (os_log_type_enabled((os_log_t)DNDLogModeConfiguration, OS_LOG_TYPE_ERROR))
      -[DNDModeConfigurationService allowedModesForContactHandle:error:].cold.1();
  }
  else if (os_log_type_enabled((os_log_t)DNDLogModeConfiguration, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543619;
    v29 = v8;
    v30 = 2113;
    v31 = v6;
    _os_log_impl(&dword_19ABEB000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] Get allowed modes for contact, handle=%{private}@", buf, 0x16u);
  }
  if (a4)
  {
    v11 = (void *)v16[5];
    if (v11)
      *a4 = objc_retainAutorelease(v11);
  }
  v12 = (id)v22[5];
  _Block_object_dispose(&v15, 8);

  _Block_object_dispose(&v21, 8);
  os_activity_scope_leave(&state);

  return v12;
}

void __66__DNDModeConfigurationService_allowedModesForContactHandle_error___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (id)silencedModesForContactHandle:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  id v12;
  _QWORD v14[6];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = _os_activity_create(&dword_19ABEB000, "com.apple.donotdisturb.DNDModeConfigurationService.getSilencedModesForContact", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  +[DNDRequestDetails detailsRepresentingNowWithClientIdentifier:](DNDRequestDetails, "detailsRepresentingNowWithClientIdentifier:", self->_clientIdentifier);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__3;
  v25 = __Block_byref_object_dispose__3;
  v26 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__3;
  v19 = __Block_byref_object_dispose__3;
  v20 = 0;
  +[DNDRemoteServiceConnection sharedInstance](DNDRemoteServiceConnection, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __67__DNDModeConfigurationService_silencedModesForContactHandle_error___block_invoke;
  v14[3] = &unk_1E39B5B28;
  v14[4] = &v21;
  v14[5] = &v15;
  objc_msgSend(v9, "getSilencedModesForContactHandle:withRequestDetails:completionHandler:", v6, v8, v14);

  v10 = DNDLogModeConfiguration;
  if (v16[5])
  {
    if (os_log_type_enabled((os_log_t)DNDLogModeConfiguration, OS_LOG_TYPE_ERROR))
      -[DNDModeConfigurationService silencedModesForContactHandle:error:].cold.1();
  }
  else if (os_log_type_enabled((os_log_t)DNDLogModeConfiguration, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543619;
    v29 = v8;
    v30 = 2113;
    v31 = v6;
    _os_log_impl(&dword_19ABEB000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] Get silenced modes for contact, handle=%{private}@", buf, 0x16u);
  }
  if (a4)
  {
    v11 = (void *)v16[5];
    if (v11)
      *a4 = objc_retainAutorelease(v11);
  }
  v12 = (id)v22[5];
  _Block_object_dispose(&v15, 8);

  _Block_object_dispose(&v21, 8);
  os_activity_scope_leave(&state);

  return v12;
}

void __67__DNDModeConfigurationService_silencedModesForContactHandle_error___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (id)publishCurrentStatusKitAvailabilityReturningError:(id *)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
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
  v5 = _os_activity_create(&dword_19ABEB000, "com.apple.donotdisturb.DNDModeConfigurationService.publishCurrentStatusKitAvailability", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  +[DNDRequestDetails detailsRepresentingNowWithClientIdentifier:](DNDRequestDetails, "detailsRepresentingNowWithClientIdentifier:", self->_clientIdentifier);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__3;
  v24 = __Block_byref_object_dispose__3;
  v25 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__3;
  v18 = __Block_byref_object_dispose__3;
  v19 = 0;
  +[DNDRemoteServiceConnection sharedInstance](DNDRemoteServiceConnection, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __81__DNDModeConfigurationService_publishCurrentStatusKitAvailabilityReturningError___block_invoke;
  v13[3] = &unk_1E39B5B78;
  v13[4] = &v20;
  v13[5] = &v14;
  objc_msgSend(v7, "publishStatusKitAvailabilityWithRequestDetails:completionHandler:", v6, v13);

  v8 = DNDLogModeConfiguration;
  if (v15[5])
  {
    if (os_log_type_enabled((os_log_t)DNDLogModeConfiguration, OS_LOG_TYPE_ERROR))
      -[DNDModeConfigurationService publishCurrentStatusKitAvailabilityReturningError:].cold.1();
  }
  else if (os_log_type_enabled((os_log_t)DNDLogModeConfiguration, OS_LOG_TYPE_DEFAULT))
  {
    v9 = v21[5];
    *(_DWORD *)buf = 138543618;
    v28 = v6;
    v29 = 2114;
    v30 = v9;
    _os_log_impl(&dword_19ABEB000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Request to publish statuskit availability succeeded: %{public}@", buf, 0x16u);
  }
  if (a3)
  {
    v10 = (void *)v15[5];
    if (v10)
      *a3 = objc_retainAutorelease(v10);
  }
  v11 = (id)v21[5];
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&v20, 8);
  os_activity_scope_leave(&state);

  return v11;
}

void __81__DNDModeConfigurationService_publishCurrentStatusKitAvailabilityReturningError___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (id)allModesReturningError:(id *)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
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
  v5 = _os_activity_create(&dword_19ABEB000, "com.apple.donotdisturb.DNDModeConfigurationService.allModes", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  +[DNDRequestDetails detailsRepresentingNowWithClientIdentifier:](DNDRequestDetails, "detailsRepresentingNowWithClientIdentifier:", self->_clientIdentifier);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__3;
  v24 = __Block_byref_object_dispose__3;
  v25 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__3;
  v18 = __Block_byref_object_dispose__3;
  v19 = 0;
  +[DNDRemoteServiceConnection sharedInstance](DNDRemoteServiceConnection, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __54__DNDModeConfigurationService_allModesReturningError___block_invoke;
  v13[3] = &unk_1E39B5BA0;
  v13[4] = &v20;
  v13[5] = &v14;
  objc_msgSend(v7, "getAllModesWithRequestDetails:completionHandler:", v6, v13);

  if (a3)
  {
    v8 = (void *)v15[5];
    if (v8)
      *a3 = objc_retainAutorelease(v8);
  }
  v9 = DNDLogModeConfiguration;
  if (os_log_type_enabled((os_log_t)DNDLogModeConfiguration, OS_LOG_TYPE_DEFAULT))
  {
    v10 = v21[5];
    *(_DWORD *)buf = 138543618;
    v28 = v6;
    v29 = 2114;
    v30 = v10;
    _os_log_impl(&dword_19ABEB000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] Got all modes, modes=%{public}@", buf, 0x16u);
  }
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v21[5]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&v20, 8);
  os_activity_scope_leave(&state);

  return v11;
}

void __54__DNDModeConfigurationService_allModesReturningError___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (id)availableModesReturningError:(id *)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
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
  v5 = _os_activity_create(&dword_19ABEB000, "com.apple.donotdisturb.DNDModeConfigurationService.availableModes", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  +[DNDRequestDetails detailsRepresentingNowWithClientIdentifier:](DNDRequestDetails, "detailsRepresentingNowWithClientIdentifier:", self->_clientIdentifier);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__3;
  v24 = __Block_byref_object_dispose__3;
  v25 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__3;
  v18 = __Block_byref_object_dispose__3;
  v19 = 0;
  +[DNDRemoteServiceConnection sharedInstance](DNDRemoteServiceConnection, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __60__DNDModeConfigurationService_availableModesReturningError___block_invoke;
  v13[3] = &unk_1E39B5BA0;
  v13[4] = &v20;
  v13[5] = &v14;
  objc_msgSend(v7, "getAvailableModesWithRequestDetails:completionHandler:", v6, v13);

  if (a3)
  {
    v8 = (void *)v15[5];
    if (v8)
      *a3 = objc_retainAutorelease(v8);
  }
  v9 = DNDLogModeConfiguration;
  if (os_log_type_enabled((os_log_t)DNDLogModeConfiguration, OS_LOG_TYPE_DEFAULT))
  {
    v10 = v21[5];
    *(_DWORD *)buf = 138543618;
    v28 = v6;
    v29 = 2114;
    v30 = v10;
    _os_log_impl(&dword_19ABEB000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] Got available modes, modes=%{public}@", buf, 0x16u);
  }
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v21[5]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&v20, 8);
  os_activity_scope_leave(&state);

  return v11;
}

void __60__DNDModeConfigurationService_availableModesReturningError___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (BOOL)setAppConfigurationPredicate:(id)a3 forActionIdentifier:(id)a4 forApplicationIdentifier:(id)a5 modeIdentifier:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  BOOL v21;
  _QWORD v23[6];
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
  id v38;
  __int16 v39;
  id v40;
  __int16 v41;
  id v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = _os_activity_create(&dword_19ABEB000, "com.apple.donotdisturb.DNDModeConfigurationService.setAppConfigurationPredicate", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v16, &state);
  +[DNDRequestDetails detailsRepresentingNowWithClientIdentifier:](DNDRequestDetails, "detailsRepresentingNowWithClientIdentifier:", self->_clientIdentifier);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0;
  v31 = &v30;
  v32 = 0x2020000000;
  v33 = 0;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__3;
  v28 = __Block_byref_object_dispose__3;
  v29 = 0;
  +[DNDRemoteServiceConnection sharedInstance](DNDRemoteServiceConnection, "sharedInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __126__DNDModeConfigurationService_setAppConfigurationPredicate_forActionIdentifier_forApplicationIdentifier_modeIdentifier_error___block_invoke;
  v23[3] = &unk_1E39B5610;
  v23[4] = &v30;
  v23[5] = &v24;
  objc_msgSend(v18, "setAppConfigurationPredicate:forActionIdentifier:forApplicationIdentifier:modeIdentifier:withRequestDetails:completionHandler:", v12, v13, v14, v15, v17, v23);

  v19 = DNDLogModeConfiguration;
  if (*((_BYTE *)v31 + 24))
  {
    if (os_log_type_enabled((os_log_t)DNDLogModeConfiguration, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138544130;
      v36 = v17;
      v37 = 2114;
      v38 = v12;
      v39 = 2114;
      v40 = v14;
      v41 = 2114;
      v42 = v15;
      _os_log_impl(&dword_19ABEB000, v19, OS_LOG_TYPE_DEFAULT, "[%{public}@] Set app configuration predicate, predicate=%{public}@ applicationIdentifier=%{public}@ modeIdentifier=%{public}@", buf, 0x2Au);
    }
  }
  else if (os_log_type_enabled((os_log_t)DNDLogModeConfiguration, OS_LOG_TYPE_ERROR))
  {
    -[DNDModeConfigurationService setAppConfigurationPredicate:forActionIdentifier:forApplicationIdentifier:modeIdentifier:error:].cold.1();
  }
  if (a7)
  {
    v20 = (void *)v25[5];
    if (v20)
      *a7 = objc_retainAutorelease(v20);
  }
  v21 = *((_BYTE *)v31 + 24) != 0;
  _Block_object_dispose(&v24, 8);

  _Block_object_dispose(&v30, 8);
  os_activity_scope_leave(&state);

  return v21;
}

void __126__DNDModeConfigurationService_setAppConfigurationPredicate_forActionIdentifier_forApplicationIdentifier_modeIdentifier_error___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (id)getAppConfigurationPredicateForActionIdentifier:(id)a3 forApplicationIdentifier:(id)a4 modeIdentifier:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  id v19;
  _QWORD v21[6];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  id v40;
  __int16 v41;
  id v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = _os_activity_create(&dword_19ABEB000, "com.apple.donotdisturb.DNDModeConfigurationService.getAppConfigurationPredicate", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v13, &state);
  +[DNDRequestDetails detailsRepresentingNowWithClientIdentifier:](DNDRequestDetails, "detailsRepresentingNowWithClientIdentifier:", self->_clientIdentifier);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__3;
  v32 = __Block_byref_object_dispose__3;
  v33 = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__3;
  v26 = __Block_byref_object_dispose__3;
  v27 = 0;
  +[DNDRemoteServiceConnection sharedInstance](DNDRemoteServiceConnection, "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __125__DNDModeConfigurationService_getAppConfigurationPredicateForActionIdentifier_forApplicationIdentifier_modeIdentifier_error___block_invoke;
  v21[3] = &unk_1E39B5BC8;
  v21[4] = &v28;
  v21[5] = &v22;
  objc_msgSend(v15, "getAppConfigurationPredicateForActionIdentifier:forApplicationIdentifier:modeIdentifier:withRequestDetails:completionHandler:", v10, v11, v12, v14, v21);

  v16 = DNDLogModeConfiguration;
  if (v23[5])
  {
    if (os_log_type_enabled((os_log_t)DNDLogModeConfiguration, OS_LOG_TYPE_ERROR))
      -[DNDModeConfigurationService getAppConfigurationPredicateForActionIdentifier:forApplicationIdentifier:modeIdentifier:error:].cold.1();
  }
  else if (os_log_type_enabled((os_log_t)DNDLogModeConfiguration, OS_LOG_TYPE_DEFAULT))
  {
    v17 = v29[5];
    *(_DWORD *)buf = 138544130;
    v36 = v14;
    v37 = 2114;
    v38 = v17;
    v39 = 2114;
    v40 = v11;
    v41 = 2114;
    v42 = v12;
    _os_log_impl(&dword_19ABEB000, v16, OS_LOG_TYPE_DEFAULT, "[%{public}@] Got app configuration predicate, predicate=%{public}@ applicationIdentifier=%{public}@ modeIdentifier=%{public}@", buf, 0x2Au);
  }
  if (a6)
  {
    v18 = (void *)v23[5];
    if (v18)
      *a6 = objc_retainAutorelease(v18);
  }
  v19 = (id)v29[5];
  _Block_object_dispose(&v22, 8);

  _Block_object_dispose(&v28, 8);
  os_activity_scope_leave(&state);

  return v19;
}

void __125__DNDModeConfigurationService_getAppConfigurationPredicateForActionIdentifier_forApplicationIdentifier_modeIdentifier_error___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (BOOL)setAppConfigurationTargetContentIdentifierPrefix:(id)a3 forActionIdentifier:(id)a4 forApplicationIdentifier:(id)a5 modeIdentifier:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  BOOL v21;
  _QWORD v23[6];
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
  id v38;
  __int16 v39;
  id v40;
  __int16 v41;
  id v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = _os_activity_create(&dword_19ABEB000, "com.apple.donotdisturb.DNDModeConfigurationService.setAppConfigurationTargetContentIdentifierPrefix", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v16, &state);
  +[DNDRequestDetails detailsRepresentingNowWithClientIdentifier:](DNDRequestDetails, "detailsRepresentingNowWithClientIdentifier:", self->_clientIdentifier);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0;
  v31 = &v30;
  v32 = 0x2020000000;
  v33 = 0;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__3;
  v28 = __Block_byref_object_dispose__3;
  v29 = 0;
  +[DNDRemoteServiceConnection sharedInstance](DNDRemoteServiceConnection, "sharedInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __146__DNDModeConfigurationService_setAppConfigurationTargetContentIdentifierPrefix_forActionIdentifier_forApplicationIdentifier_modeIdentifier_error___block_invoke;
  v23[3] = &unk_1E39B5610;
  v23[4] = &v30;
  v23[5] = &v24;
  objc_msgSend(v18, "setAppConfigurationTargetContentIdentifierPrefix:forActionIdentifier:forApplicationIdentifier:modeIdentifier:withRequestDetails:completionHandler:", v12, v13, v14, v15, v17, v23);

  v19 = DNDLogModeConfiguration;
  if (*((_BYTE *)v31 + 24))
  {
    if (os_log_type_enabled((os_log_t)DNDLogModeConfiguration, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138544130;
      v36 = v17;
      v37 = 2114;
      v38 = v12;
      v39 = 2114;
      v40 = v14;
      v41 = 2114;
      v42 = v15;
      _os_log_impl(&dword_19ABEB000, v19, OS_LOG_TYPE_DEFAULT, "[%{public}@] Set target content identifier prefix, prefix=%{public}@ applicationIdentifier=%{public}@ modeIdentifier=%{public}@", buf, 0x2Au);
    }
  }
  else if (os_log_type_enabled((os_log_t)DNDLogModeConfiguration, OS_LOG_TYPE_ERROR))
  {
    -[DNDModeConfigurationService setAppConfigurationTargetContentIdentifierPrefix:forActionIdentifier:forApplicationIdentifier:modeIdentifier:error:].cold.1();
  }
  if (a7)
  {
    v20 = (void *)v25[5];
    if (v20)
      *a7 = objc_retainAutorelease(v20);
  }
  v21 = *((_BYTE *)v31 + 24) != 0;
  _Block_object_dispose(&v24, 8);

  _Block_object_dispose(&v30, 8);
  os_activity_scope_leave(&state);

  return v21;
}

void __146__DNDModeConfigurationService_setAppConfigurationTargetContentIdentifierPrefix_forActionIdentifier_forApplicationIdentifier_modeIdentifier_error___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (id)getAppConfigurationTargetContentIdentifierPrefixesForModeIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
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
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = _os_activity_create(&dword_19ABEB000, "com.apple.donotdisturb.DNDModeConfigurationService.getAppConfigurationTargetContentIdentifierPrefixes", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  +[DNDRequestDetails detailsRepresentingNowWithClientIdentifier:](DNDRequestDetails, "detailsRepresentingNowWithClientIdentifier:", self->_clientIdentifier);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__3;
  v26 = __Block_byref_object_dispose__3;
  v27 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__3;
  v20 = __Block_byref_object_dispose__3;
  v21 = 0;
  +[DNDRemoteServiceConnection sharedInstance](DNDRemoteServiceConnection, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __105__DNDModeConfigurationService_getAppConfigurationTargetContentIdentifierPrefixesForModeIdentifier_error___block_invoke;
  v15[3] = &unk_1E39B5BF0;
  v15[4] = &v22;
  v15[5] = &v16;
  objc_msgSend(v9, "getAppConfigurationTargetContentIdentifierPrefixesForModeIdentifier:withRequestDetails:completionHandler:", v6, v8, v15);

  if (v23[5])
  {
    v10 = (id)DNDLogModeConfiguration;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend((id)v23[5], "count"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v30 = v8;
      v31 = 2112;
      v32 = v11;
      v33 = 2114;
      v34 = v6;
      _os_log_impl(&dword_19ABEB000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] Got %@ target content identifier prefixes for modeIdentifier %{public}@", buf, 0x20u);

    }
  }
  else if (os_log_type_enabled((os_log_t)DNDLogModeConfiguration, OS_LOG_TYPE_ERROR))
  {
    -[DNDModeConfigurationService getAppConfigurationTargetContentIdentifierPrefixesForModeIdentifier:error:].cold.1();
  }
  if (a4)
  {
    v12 = (void *)v17[5];
    if (v12)
      *a4 = objc_retainAutorelease(v12);
  }
  v13 = (id)v23[5];
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);
  os_activity_scope_leave(&state);

  return v13;
}

void __105__DNDModeConfigurationService_getAppConfigurationTargetContentIdentifierPrefixesForModeIdentifier_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v5 = a3;
  objc_msgSend(a2, "appConfigurationTargetContentIdentifierPrefixesForModeIdentifier");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v5;

}

- (id)getAppConfigurationTargetContentIdentifierPrefixesForCurrentModeReturningError:(id *)a3
{
  return -[DNDModeConfigurationService getAppConfigurationTargetContentIdentifierPrefixesForModeIdentifier:error:](self, "getAppConfigurationTargetContentIdentifierPrefixesForModeIdentifier:error:", CFSTR("com.apple.focus.current-sentinel"), a3);
}

- (BOOL)setAppConfigurationAction:(id)a3 forApplicationIdentifier:(id)a4 modeIdentifier:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  DNDAppAction *v14;
  os_activity_scope_state_s v16;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = _os_activity_create(&dword_19ABEB000, "com.apple.donotdisturb.DNDModeConfigurationService.setAppConfigurationAction", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v16.opaque[0] = 0;
  v16.opaque[1] = 0;
  os_activity_scope_enter(v13, &v16);
  v14 = -[DNDAppAction initWithAction:enabled:]([DNDAppAction alloc], "initWithAction:enabled:", v10, 1);
  LOBYTE(a6) = -[DNDModeConfigurationService setAppAction:forApplicationIdentifier:modeIdentifier:error:](self, "setAppAction:forApplicationIdentifier:modeIdentifier:error:", v14, v11, v12, a6);

  os_activity_scope_leave(&v16);
  return (char)a6;
}

- (BOOL)clearAppConfigurationActionWithIdentifier:(id)a3 forApplicationIdentifier:(id)a4 modeIdentifier:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  os_activity_scope_state_s v15;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = _os_activity_create(&dword_19ABEB000, "com.apple.donotdisturb.DNDModeConfigurationService.clearAppConfigurationAction", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v15.opaque[0] = 0;
  v15.opaque[1] = 0;
  os_activity_scope_enter(v13, &v15);
  LOBYTE(a6) = -[DNDModeConfigurationService clearAppActionWithIdentifier:forApplicationIdentifier:modeIdentifier:error:](self, "clearAppActionWithIdentifier:forApplicationIdentifier:modeIdentifier:error:", v10, v11, v12, a6);
  os_activity_scope_leave(&v15);

  return (char)a6;
}

- (id)getAppConfigurationActionsForModeIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  os_activity_scope_state_s state;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  v25 = _os_activity_create(&dword_19ABEB000, "com.apple.donotdisturb.DNDModeConfigurationService.getAppConfigurationActions", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v25, &state);
  v24 = v6;
  -[DNDModeConfigurationService getAppActionsForModeIdentifier:error:](self, "getAppActionsForModeIdentifier:error:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v7, "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
  if (v10)
  {
    v26 = *(_QWORD *)v33;
    do
    {
      v27 = v10;
      for (i = 0; i != v27; ++i)
      {
        if (*(_QWORD *)v33 != v26)
          objc_enumerationMutation(v9);
        v12 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i);
        objc_msgSend(v9, "objectForKeyedSubscript:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v13, "count"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v14, v12);

        v30 = 0u;
        v31 = 0u;
        v28 = 0u;
        v29 = 0u;
        v15 = v13;
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
        if (v16)
        {
          v17 = *(_QWORD *)v29;
          do
          {
            for (j = 0; j != v16; ++j)
            {
              if (*(_QWORD *)v29 != v17)
                objc_enumerationMutation(v15);
              v19 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * j);
              objc_msgSend(v19, "action");
              v20 = (void *)objc_claimAutoreleasedReturnValue();

              if (v20)
              {
                objc_msgSend(v8, "objectForKeyedSubscript:", v12);
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v19, "action");
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v21, "addObject:", v22);

              }
            }
            v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
          }
          while (v16);
        }

      }
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
    }
    while (v10);
  }

  os_activity_scope_leave(&state);
  return v8;
}

- (BOOL)setAppAction:(id)a3 forApplicationIdentifier:(id)a4 modeIdentifier:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  BOOL v18;
  _QWORD v20[6];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  id v35;
  __int16 v36;
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = _os_activity_create(&dword_19ABEB000, "com.apple.donotdisturb.DNDModeConfigurationService.setAppAction", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v13, &state);
  +[DNDRequestDetails detailsRepresentingNowWithClientIdentifier:](DNDRequestDetails, "detailsRepresentingNowWithClientIdentifier:", self->_clientIdentifier);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__3;
  v25 = __Block_byref_object_dispose__3;
  v26 = 0;
  +[DNDRemoteServiceConnection sharedInstance](DNDRemoteServiceConnection, "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __90__DNDModeConfigurationService_setAppAction_forApplicationIdentifier_modeIdentifier_error___block_invoke;
  v20[3] = &unk_1E39B5610;
  v20[4] = &v27;
  v20[5] = &v21;
  objc_msgSend(v15, "setAppAction:forApplicationIdentifier:modeIdentifier:withRequestDetails:completionHandler:", v10, v11, v12, v14, v20);

  v16 = DNDLogModeConfiguration;
  if (*((_BYTE *)v28 + 24))
  {
    if (os_log_type_enabled((os_log_t)DNDLogModeConfiguration, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      v33 = v14;
      v34 = 2114;
      v35 = v10;
      v36 = 2114;
      v37 = v12;
      _os_log_impl(&dword_19ABEB000, v16, OS_LOG_TYPE_DEFAULT, "[%{public}@] Set app action, action=%{public}@; modeIdentifier=%{public}@",
        buf,
        0x20u);
    }
  }
  else if (os_log_type_enabled((os_log_t)DNDLogModeConfiguration, OS_LOG_TYPE_ERROR))
  {
    -[DNDModeConfigurationService setAppAction:forApplicationIdentifier:modeIdentifier:error:].cold.1();
  }
  if (a6)
  {
    v17 = (void *)v22[5];
    if (v17)
      *a6 = objc_retainAutorelease(v17);
  }
  v18 = *((_BYTE *)v28 + 24) != 0;
  _Block_object_dispose(&v21, 8);

  _Block_object_dispose(&v27, 8);
  os_activity_scope_leave(&state);

  return v18;
}

void __90__DNDModeConfigurationService_setAppAction_forApplicationIdentifier_modeIdentifier_error___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (BOOL)clearAppActionWithIdentifier:(id)a3 forApplicationIdentifier:(id)a4 modeIdentifier:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  BOOL v18;
  _QWORD v20[6];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  id v35;
  __int16 v36;
  id v37;
  __int16 v38;
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = _os_activity_create(&dword_19ABEB000, "com.apple.donotdisturb.DNDModeConfigurationService.clearAppAction", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v13, &state);
  +[DNDRequestDetails detailsRepresentingNowWithClientIdentifier:](DNDRequestDetails, "detailsRepresentingNowWithClientIdentifier:", self->_clientIdentifier);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__3;
  v25 = __Block_byref_object_dispose__3;
  v26 = 0;
  +[DNDRemoteServiceConnection sharedInstance](DNDRemoteServiceConnection, "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __106__DNDModeConfigurationService_clearAppActionWithIdentifier_forApplicationIdentifier_modeIdentifier_error___block_invoke;
  v20[3] = &unk_1E39B5610;
  v20[4] = &v27;
  v20[5] = &v21;
  objc_msgSend(v15, "clearAppActionWithIdentifier:forApplicationIdentifier:modeIdentifier:withRequestDetails:completionHandler:", v10, v11, v12, v14, v20);

  v16 = DNDLogModeConfiguration;
  if (*((_BYTE *)v28 + 24))
  {
    if (os_log_type_enabled((os_log_t)DNDLogModeConfiguration, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138544130;
      v33 = v14;
      v34 = 2114;
      v35 = v10;
      v36 = 2114;
      v37 = v11;
      v38 = 2114;
      v39 = v12;
      _os_log_impl(&dword_19ABEB000, v16, OS_LOG_TYPE_DEFAULT, "[%{public}@] Clear app action, identifier=%{public}@ applicationIdentifier=%{public}@ modeIdentifier=%{public}@", buf, 0x2Au);
    }
  }
  else if (os_log_type_enabled((os_log_t)DNDLogModeConfiguration, OS_LOG_TYPE_ERROR))
  {
    -[DNDModeConfigurationService clearAppActionWithIdentifier:forApplicationIdentifier:modeIdentifier:error:].cold.1();
  }
  if (a6)
  {
    v17 = (void *)v22[5];
    if (v17)
      *a6 = objc_retainAutorelease(v17);
  }
  v18 = *((_BYTE *)v28 + 24) != 0;
  _Block_object_dispose(&v21, 8);

  _Block_object_dispose(&v27, 8);
  os_activity_scope_leave(&state);

  return v18;
}

void __106__DNDModeConfigurationService_clearAppActionWithIdentifier_forApplicationIdentifier_modeIdentifier_error___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (id)getAppActionsForModeIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  _QWORD v16[6];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  id v35;
  __int16 v36;
  uint64_t v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = _os_activity_create(&dword_19ABEB000, "com.apple.donotdisturb.DNDModeConfigurationService.getAppActionsForModeIdentifier", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  +[DNDRequestDetails detailsRepresentingNowWithClientIdentifier:](DNDRequestDetails, "detailsRepresentingNowWithClientIdentifier:", self->_clientIdentifier);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__3;
  v27 = __Block_byref_object_dispose__3;
  v28 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__3;
  v21 = __Block_byref_object_dispose__3;
  v22 = 0;
  +[DNDRemoteServiceConnection sharedInstance](DNDRemoteServiceConnection, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __68__DNDModeConfigurationService_getAppActionsForModeIdentifier_error___block_invoke;
  v16[3] = &unk_1E39B5C18;
  v16[4] = &v23;
  v16[5] = &v17;
  objc_msgSend(v9, "getAppActionsForModeIdentifier:withRequestDetails:completionHandler:", v6, v8, v16);

  if (v24[5])
  {
    v10 = (id)DNDLogModeConfiguration;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend((id)v24[5], "count"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v24[5];
      *(_DWORD *)buf = 138544130;
      v31 = v8;
      v32 = 2112;
      v33 = v11;
      v34 = 2114;
      v35 = v6;
      v36 = 2112;
      v37 = v12;
      _os_log_impl(&dword_19ABEB000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] Got %@ app actions for modeIdentifier %{public}@. actions = %@", buf, 0x2Au);

    }
  }
  else if (os_log_type_enabled((os_log_t)DNDLogModeConfiguration, OS_LOG_TYPE_ERROR))
  {
    -[DNDModeConfigurationService getAppActionsForModeIdentifier:error:].cold.1();
  }
  if (a4)
  {
    v13 = (void *)v18[5];
    if (v13)
      *a4 = objc_retainAutorelease(v13);
  }
  v14 = (id)v24[5];
  _Block_object_dispose(&v17, 8);

  _Block_object_dispose(&v23, 8);
  os_activity_scope_leave(&state);

  return v14;
}

void __68__DNDModeConfigurationService_getAppActionsForModeIdentifier_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v5 = a3;
  objc_msgSend(a2, "appActionsForModeIdentifier");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v5;

}

- (BOOL)setSystemAction:(id)a3 forModeIdentifier:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  BOOL v15;
  _QWORD v17[6];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  id v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = _os_activity_create(&dword_19ABEB000, "com.apple.donotdisturb.DNDModeConfigurationService.setSystemAction", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v10, &state);
  +[DNDRequestDetails detailsRepresentingNowWithClientIdentifier:](DNDRequestDetails, "detailsRepresentingNowWithClientIdentifier:", self->_clientIdentifier);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__3;
  v22 = __Block_byref_object_dispose__3;
  v23 = 0;
  +[DNDRemoteServiceConnection sharedInstance](DNDRemoteServiceConnection, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __71__DNDModeConfigurationService_setSystemAction_forModeIdentifier_error___block_invoke;
  v17[3] = &unk_1E39B5610;
  v17[4] = &v24;
  v17[5] = &v18;
  objc_msgSend(v12, "setSystemAction:forModeIdentifier:withRequestDetails:completionHandler:", v8, v9, v11, v17);

  v13 = DNDLogModeConfiguration;
  if (*((_BYTE *)v25 + 24))
  {
    if (os_log_type_enabled((os_log_t)DNDLogModeConfiguration, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      v30 = v11;
      v31 = 2114;
      v32 = v8;
      v33 = 2114;
      v34 = v9;
      _os_log_impl(&dword_19ABEB000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@] Set system action, action=%{public}@; modeIdentifier=%{public}@",
        buf,
        0x20u);
    }
  }
  else if (os_log_type_enabled((os_log_t)DNDLogModeConfiguration, OS_LOG_TYPE_ERROR))
  {
    -[DNDModeConfigurationService setSystemAction:forModeIdentifier:error:].cold.1();
  }
  if (a5)
  {
    v14 = (void *)v19[5];
    if (v14)
      *a5 = objc_retainAutorelease(v14);
  }
  v15 = *((_BYTE *)v25 + 24) != 0;
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(&v24, 8);
  os_activity_scope_leave(&state);

  return v15;
}

void __71__DNDModeConfigurationService_setSystemAction_forModeIdentifier_error___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (BOOL)clearSystemActionWithIdentifier:(id)a3 forModeIdentifier:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  BOOL v15;
  _QWORD v17[6];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  id v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = _os_activity_create(&dword_19ABEB000, "com.apple.donotdisturb.DNDModeConfigurationService.clearSystemAction", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v10, &state);
  +[DNDRequestDetails detailsRepresentingNowWithClientIdentifier:](DNDRequestDetails, "detailsRepresentingNowWithClientIdentifier:", self->_clientIdentifier);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__3;
  v22 = __Block_byref_object_dispose__3;
  v23 = 0;
  +[DNDRemoteServiceConnection sharedInstance](DNDRemoteServiceConnection, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __87__DNDModeConfigurationService_clearSystemActionWithIdentifier_forModeIdentifier_error___block_invoke;
  v17[3] = &unk_1E39B5610;
  v17[4] = &v24;
  v17[5] = &v18;
  objc_msgSend(v12, "clearSystemActionWithIdentifier:forModeIdentifier:withRequestDetails:completionHandler:", v8, v9, v11, v17);

  v13 = DNDLogModeConfiguration;
  if (*((_BYTE *)v25 + 24))
  {
    if (os_log_type_enabled((os_log_t)DNDLogModeConfiguration, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      v30 = v11;
      v31 = 2114;
      v32 = v8;
      v33 = 2114;
      v34 = v9;
      _os_log_impl(&dword_19ABEB000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@] Clear system action, identifier=%{public}@ modeIdentifier=%{public}@", buf, 0x20u);
    }
  }
  else if (os_log_type_enabled((os_log_t)DNDLogModeConfiguration, OS_LOG_TYPE_ERROR))
  {
    -[DNDModeConfigurationService clearSystemActionWithIdentifier:forModeIdentifier:error:].cold.1();
  }
  if (a5)
  {
    v14 = (void *)v19[5];
    if (v14)
      *a5 = objc_retainAutorelease(v14);
  }
  v15 = *((_BYTE *)v25 + 24) != 0;
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(&v24, 8);
  os_activity_scope_leave(&state);

  return v15;
}

void __87__DNDModeConfigurationService_clearSystemActionWithIdentifier_forModeIdentifier_error___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (id)getSystemActionsForModeIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
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
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = _os_activity_create(&dword_19ABEB000, "com.apple.donotdisturb.DNDModeConfigurationService.getSystemActionsForModeIdentifier", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  +[DNDRequestDetails detailsRepresentingNowWithClientIdentifier:](DNDRequestDetails, "detailsRepresentingNowWithClientIdentifier:", self->_clientIdentifier);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__3;
  v26 = __Block_byref_object_dispose__3;
  v27 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__3;
  v20 = __Block_byref_object_dispose__3;
  v21 = 0;
  +[DNDRemoteServiceConnection sharedInstance](DNDRemoteServiceConnection, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __71__DNDModeConfigurationService_getSystemActionsForModeIdentifier_error___block_invoke;
  v15[3] = &unk_1E39B5C40;
  v15[4] = &v22;
  v15[5] = &v16;
  objc_msgSend(v9, "getSystemActionsForModeIdentifier:withRequestDetails:completionHandler:", v6, v8, v15);

  if (v23[5])
  {
    v10 = (id)DNDLogModeConfiguration;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend((id)v23[5], "count"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v30 = v8;
      v31 = 2112;
      v32 = v11;
      v33 = 2114;
      v34 = v6;
      _os_log_impl(&dword_19ABEB000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] Got %@ system actions for modeIdentifier %{public}@", buf, 0x20u);

    }
  }
  else if (os_log_type_enabled((os_log_t)DNDLogModeConfiguration, OS_LOG_TYPE_ERROR))
  {
    -[DNDModeConfigurationService getSystemActionsForModeIdentifier:error:].cold.1();
  }
  if (a4)
  {
    v12 = (void *)v17[5];
    if (v12)
      *a4 = objc_retainAutorelease(v12);
  }
  v13 = (id)v23[5];
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);
  os_activity_scope_leave(&state);

  return v13;
}

void __71__DNDModeConfigurationService_getSystemActionsForModeIdentifier_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", a2);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v5;

}

- (BOOL)setSystemConfigurationAction:(id)a3 modeIdentifier:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  NSObject *v10;
  DNDSystemAction *v11;
  os_activity_scope_state_s v13;

  v8 = a3;
  v9 = a4;
  v10 = _os_activity_create(&dword_19ABEB000, "com.apple.donotdisturb.DNDModeConfigurationService.setSystemConfigurationAction", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v13.opaque[0] = 0;
  v13.opaque[1] = 0;
  os_activity_scope_enter(v10, &v13);
  v11 = -[DNDSystemAction initWithAction:enabled:]([DNDSystemAction alloc], "initWithAction:enabled:", v8, 1);
  LOBYTE(a5) = -[DNDModeConfigurationService setSystemAction:forModeIdentifier:error:](self, "setSystemAction:forModeIdentifier:error:", v11, v9, a5);

  os_activity_scope_leave(&v13);
  return (char)a5;
}

- (BOOL)clearSystemConfigurationActionWithIdentifier:(id)a3 modeIdentifier:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  NSObject *v10;
  os_activity_scope_state_s v12;

  v8 = a3;
  v9 = a4;
  v10 = _os_activity_create(&dword_19ABEB000, "com.apple.donotdisturb.DNDModeConfigurationService.clearSystemConfigurationAction", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v12.opaque[0] = 0;
  v12.opaque[1] = 0;
  os_activity_scope_enter(v10, &v12);
  LOBYTE(a5) = -[DNDModeConfigurationService clearSystemActionWithIdentifier:forModeIdentifier:error:](self, "clearSystemActionWithIdentifier:forModeIdentifier:error:", v8, v9, a5);
  os_activity_scope_leave(&v12);

  return (char)a5;
}

- (id)getSystemConfigurationActionsForModeIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  os_activity_scope_state_s state;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = _os_activity_create(&dword_19ABEB000, "com.apple.donotdisturb.DNDModeConfigurationService.getSystemConfigurationActions", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  -[DNDModeConfigurationService getSystemActionsForModeIdentifier:error:](self, "getSystemActionsForModeIdentifier:error:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v8, "count"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v10);
        v14 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v14, "action", (_QWORD)v18);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          objc_msgSend(v14, "action");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObject:", v16);

        }
      }
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    }
    while (v11);
  }

  os_activity_scope_leave(&state);
  return v9;
}

- (BOOL)getSyncPreferenceEnabledReturningError:(id *)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  BOOL v12;
  _QWORD v14[6];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = _os_activity_create(&dword_19ABEB000, "com.apple.donotdisturb.DNDModeConfigurationService.getSyncPreferenceEnabled", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  +[DNDRequestDetails detailsRepresentingNowWithClientIdentifier:](DNDRequestDetails, "detailsRepresentingNowWithClientIdentifier:", self->_clientIdentifier);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__3;
  v19 = __Block_byref_object_dispose__3;
  v20 = 0;
  +[DNDRemoteServiceConnection sharedInstance](DNDRemoteServiceConnection, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __70__DNDModeConfigurationService_getSyncPreferenceEnabledReturningError___block_invoke;
  v14[3] = &unk_1E39B5610;
  v14[4] = &v21;
  v14[5] = &v15;
  objc_msgSend(v7, "getCloudSyncStateWithRequestDetails:completionHandler:", v6, v14);

  v8 = v16;
  if (a3)
  {
    v9 = (void *)v16[5];
    if (v9)
    {
      *a3 = objc_retainAutorelease(v9);
      v8 = v16;
    }
  }
  if (v8[5])
  {
    if (os_log_type_enabled((os_log_t)DNDLogModeConfiguration, OS_LOG_TYPE_ERROR))
      -[DNDModeConfigurationService getSyncPreferenceEnabledReturningError:].cold.1();
  }
  else
  {
    v10 = (id)DNDLogModeConfiguration;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *((unsigned __int8 *)v22 + 24));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v27 = v6;
      v28 = 2114;
      v29 = v11;
      _os_log_impl(&dword_19ABEB000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] Got sync preference enabled=%{public}@", buf, 0x16u);

    }
  }
  v12 = *((_BYTE *)v22 + 24) != 0;
  _Block_object_dispose(&v15, 8);

  _Block_object_dispose(&v21, 8);
  os_activity_scope_leave(&state);

  return v12;
}

void __70__DNDModeConfigurationService_getSyncPreferenceEnabledReturningError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;

  v5 = a3;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(a2, "unsignedIntegerValue") & 1;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

- (BOOL)getSyncAvailableReturningError:(id *)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  BOOL v12;
  _QWORD v14[6];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = _os_activity_create(&dword_19ABEB000, "com.apple.donotdisturb.DNDModeConfigurationService.getSyncAvailable", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  +[DNDRequestDetails detailsRepresentingNowWithClientIdentifier:](DNDRequestDetails, "detailsRepresentingNowWithClientIdentifier:", self->_clientIdentifier);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__3;
  v19 = __Block_byref_object_dispose__3;
  v20 = 0;
  +[DNDRemoteServiceConnection sharedInstance](DNDRemoteServiceConnection, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __62__DNDModeConfigurationService_getSyncAvailableReturningError___block_invoke;
  v14[3] = &unk_1E39B5610;
  v14[4] = &v21;
  v14[5] = &v15;
  objc_msgSend(v7, "getCloudSyncStateWithRequestDetails:completionHandler:", v6, v14);

  v8 = v16;
  if (a3)
  {
    v9 = (void *)v16[5];
    if (v9)
    {
      *a3 = objc_retainAutorelease(v9);
      v8 = v16;
    }
  }
  if (v8[5])
  {
    if (os_log_type_enabled((os_log_t)DNDLogModeConfiguration, OS_LOG_TYPE_ERROR))
      -[DNDModeConfigurationService getSyncAvailableReturningError:].cold.1();
  }
  else
  {
    v10 = (id)DNDLogModeConfiguration;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *((unsigned __int8 *)v22 + 24));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v27 = v6;
      v28 = 2114;
      v29 = v11;
      _os_log_impl(&dword_19ABEB000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] Got sync available=%{public}@", buf, 0x16u);

    }
  }
  v12 = *((_BYTE *)v22 + 24) != 0;
  _Block_object_dispose(&v15, 8);

  _Block_object_dispose(&v21, 8);
  os_activity_scope_leave(&state);

  return v12;
}

void __62__DNDModeConfigurationService_getSyncAvailableReturningError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;

  v5 = a3;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = (~objc_msgSend(a2, "unsignedIntegerValue") & 0xE) == 0;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

- (BOOL)getSyncEnabledReturningError:(id *)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  BOOL v12;
  _QWORD v14[6];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = _os_activity_create(&dword_19ABEB000, "com.apple.donotdisturb.DNDModeConfigurationService.getSyncEnabled", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  +[DNDRequestDetails detailsRepresentingNowWithClientIdentifier:](DNDRequestDetails, "detailsRepresentingNowWithClientIdentifier:", self->_clientIdentifier);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__3;
  v19 = __Block_byref_object_dispose__3;
  v20 = 0;
  +[DNDRemoteServiceConnection sharedInstance](DNDRemoteServiceConnection, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __60__DNDModeConfigurationService_getSyncEnabledReturningError___block_invoke;
  v14[3] = &unk_1E39B5610;
  v14[4] = &v21;
  v14[5] = &v15;
  objc_msgSend(v7, "getCloudSyncStateWithRequestDetails:completionHandler:", v6, v14);

  v8 = v16;
  if (a3)
  {
    v9 = (void *)v16[5];
    if (v9)
    {
      *a3 = objc_retainAutorelease(v9);
      v8 = v16;
    }
  }
  if (v8[5])
  {
    if (os_log_type_enabled((os_log_t)DNDLogModeConfiguration, OS_LOG_TYPE_ERROR))
      -[DNDModeConfigurationService getSyncEnabledReturningError:].cold.1();
  }
  else
  {
    v10 = (id)DNDLogModeConfiguration;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *((unsigned __int8 *)v22 + 24));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v27 = v6;
      v28 = 2114;
      v29 = v11;
      _os_log_impl(&dword_19ABEB000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] Got sync enabled=%{public}@", buf, 0x16u);

    }
  }
  v12 = *((_BYTE *)v22 + 24) != 0;
  _Block_object_dispose(&v15, 8);

  _Block_object_dispose(&v21, 8);
  os_activity_scope_leave(&state);

  return v12;
}

void __60__DNDModeConfigurationService_getSyncEnabledReturningError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;

  v5 = a3;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(a2, "unsignedIntegerValue") & 1;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

- (BOOL)setSyncPreferenceEnabled:(BOOL)a3 error:(id *)a4
{
  _BOOL8 v5;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  BOOL v14;
  _QWORD v16[6];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v5 = a3;
  v32 = *MEMORY[0x1E0C80C00];
  v7 = _os_activity_create(&dword_19ABEB000, "com.apple.donotdisturb.DNDModeConfigurationService.setSyncPreferenceEnabled", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  +[DNDRequestDetails detailsRepresentingNowWithClientIdentifier:](DNDRequestDetails, "detailsRepresentingNowWithClientIdentifier:", self->_clientIdentifier);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__3;
  v21 = __Block_byref_object_dispose__3;
  v22 = 0;
  +[DNDRemoteServiceConnection sharedInstance](DNDRemoteServiceConnection, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __62__DNDModeConfigurationService_setSyncPreferenceEnabled_error___block_invoke;
  v16[3] = &unk_1E39B5610;
  v16[4] = &v23;
  v16[5] = &v17;
  objc_msgSend(v9, "setCloudSyncPreferenceEnabled:withRequestDetails:completionHandler:", v10, v8, v16);

  if (a4)
  {
    v11 = (void *)v18[5];
    if (v11)
      *a4 = objc_retainAutorelease(v11);
  }
  if (*((_BYTE *)v24 + 24))
  {
    v12 = (id)DNDLogModeConfiguration;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v29 = v8;
      v30 = 2114;
      v31 = v13;
      _os_log_impl(&dword_19ABEB000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] Set sync preference enabled=%{public}@", buf, 0x16u);

    }
  }
  else if (os_log_type_enabled((os_log_t)DNDLogModeConfiguration, OS_LOG_TYPE_ERROR))
  {
    -[DNDModeConfigurationService setSyncPreferenceEnabled:error:].cold.1();
  }
  v14 = *((_BYTE *)v24 + 24) != 0;
  _Block_object_dispose(&v17, 8);

  _Block_object_dispose(&v23, 8);
  os_activity_scope_leave(&state);

  return v14;
}

void __62__DNDModeConfigurationService_setSyncPreferenceEnabled_error___block_invoke(uint64_t a1, void *a2, void *a3)
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

uint64_t __65__DNDModeConfigurationService_addListener_withCompletionHandler___block_invoke_45(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40), 0);
}

- (void)removeListener:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *queue;
  id v7;
  NSObject *v8;
  _QWORD block[4];
  NSObject *v10;
  id v11;
  DNDModeConfigurationService *v12;
  os_activity_scope_state_s state;

  v4 = a3;
  v5 = _os_activity_create(&dword_19ABEB000, "com.apple.donotdisturb.DNDModeConfigurationService.removeListener", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__DNDModeConfigurationService_removeListener___block_invoke;
  block[3] = &unk_1E39B5778;
  v10 = v5;
  v11 = v4;
  v12 = self;
  v7 = v4;
  v8 = v5;
  dispatch_sync(queue, block);

  os_activity_scope_leave(&state);
}

void __46__DNDModeConfigurationService_removeListener___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  os_activity_scope_state_s v4;
  uint8_t buf[4];
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v4.opaque[0] = 0;
  v4.opaque[1] = 0;
  os_activity_scope_enter(*(os_activity_t *)(a1 + 32), &v4);
  v2 = DNDLogModeConfiguration;
  if (os_log_type_enabled((os_log_t)DNDLogModeConfiguration, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138543362;
    v6 = v3;
    _os_log_impl(&dword_19ABEB000, v2, OS_LOG_TYPE_DEFAULT, "Removing update listener: listener=%{public}@", buf, 0xCu);
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 24), "removeObject:", *(_QWORD *)(a1 + 40));
  os_activity_scope_leave(&v4);
}

- (void)remoteService:(id)a3 didReceiveUpdatedAvailableModeIdentifiers:(id)a4
{
  id v5;
  NSObject *queue;
  id v7;
  _QWORD block[4];
  id v9;
  DNDModeConfigurationService *v10;

  v5 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __87__DNDModeConfigurationService_remoteService_didReceiveUpdatedAvailableModeIdentifiers___block_invoke;
  block[3] = &unk_1E39B5750;
  v9 = v5;
  v10 = self;
  v7 = v5;
  dispatch_sync(queue, block);

}

void __87__DNDModeConfigurationService_remoteService_didReceiveUpdatedAvailableModeIdentifiers___block_invoke(int8x16_t *a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  id v6;
  id v7;
  int8x16_t v8;
  _QWORD block[4];
  id v10;
  int8x16_t v11;
  uint8_t buf[4];
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = DNDLogModeConfiguration;
  if (os_log_type_enabled((os_log_t)DNDLogModeConfiguration, OS_LOG_TYPE_DEFAULT))
  {
    v3 = a1[2].i64[0];
    *(_DWORD *)buf = 138543362;
    v13 = v3;
    _os_log_impl(&dword_19ABEB000, v2, OS_LOG_TYPE_DEFAULT, "received updated available mode identifiers: identifiers=%{public}@", buf, 0xCu);
  }
  v4 = (void *)objc_msgSend(*(id *)(a1[2].i64[1] + 24), "copy");
  v5 = *(NSObject **)(a1[2].i64[1] + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __87__DNDModeConfigurationService_remoteService_didReceiveUpdatedAvailableModeIdentifiers___block_invoke_46;
  block[3] = &unk_1E39B5778;
  v10 = v4;
  v8 = a1[2];
  v6 = (id)v8.i64[0];
  v11 = vextq_s8(v8, v8, 8uLL);
  v7 = v4;
  dispatch_async(v5, block);

}

void __87__DNDModeConfigurationService_remoteService_didReceiveUpdatedAvailableModeIdentifiers___block_invoke_46(uint64_t a1)
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
          objc_msgSend(v7, "modeConfigurationService:didReceiveAvailableModesUpdate:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), (_QWORD)v8);
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

- (void)remoteService:(id)a3 didReceiveAppConfigurationContextUpdateForModeIdentifier:(id)a4
{
  id v5;
  NSObject *queue;
  id v7;
  _QWORD block[4];
  id v9;
  DNDModeConfigurationService *v10;

  v5 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __102__DNDModeConfigurationService_remoteService_didReceiveAppConfigurationContextUpdateForModeIdentifier___block_invoke;
  block[3] = &unk_1E39B5750;
  v9 = v5;
  v10 = self;
  v7 = v5;
  dispatch_sync(queue, block);

}

void __102__DNDModeConfigurationService_remoteService_didReceiveAppConfigurationContextUpdateForModeIdentifier___block_invoke(int8x16_t *a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  id v6;
  id v7;
  int8x16_t v8;
  _QWORD block[4];
  id v10;
  int8x16_t v11;
  uint8_t buf[4];
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = DNDLogModeConfiguration;
  if (os_log_type_enabled((os_log_t)DNDLogModeConfiguration, OS_LOG_TYPE_DEFAULT))
  {
    v3 = a1[2].i64[0];
    *(_DWORD *)buf = 138543362;
    v13 = v3;
    _os_log_impl(&dword_19ABEB000, v2, OS_LOG_TYPE_DEFAULT, "received updated app configuration context for mode identifier: identifier=%{public}@", buf, 0xCu);
  }
  v4 = (void *)objc_msgSend(*(id *)(a1[2].i64[1] + 24), "copy");
  v5 = *(NSObject **)(a1[2].i64[1] + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __102__DNDModeConfigurationService_remoteService_didReceiveAppConfigurationContextUpdateForModeIdentifier___block_invoke_47;
  block[3] = &unk_1E39B5778;
  v10 = v4;
  v8 = a1[2];
  v6 = (id)v8.i64[0];
  v11 = vextq_s8(v8, v8, 8uLL);
  v7 = v4;
  dispatch_async(v5, block);

}

void __102__DNDModeConfigurationService_remoteService_didReceiveAppConfigurationContextUpdateForModeIdentifier___block_invoke_47(uint64_t a1)
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
          objc_msgSend(v7, "modeConfigurationService:didReceiveAppConfigurationContextUpdateForModeIdentifier:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), (_QWORD)v8);
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

- (BOOL)syncModeConfigurationsReturningError:(id *)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  BOOL v10;
  _QWORD v12[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = _os_activity_create(&dword_19ABEB000, "com.apple.donotdisturb.DNDModeConfigurationService.syncModeConfigurations", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  +[DNDRequestDetails detailsRepresentingNowWithClientIdentifier:](DNDRequestDetails, "detailsRepresentingNowWithClientIdentifier:", self->_clientIdentifier);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__3;
  v17 = __Block_byref_object_dispose__3;
  v18 = 0;
  +[DNDRemoteServiceConnection sharedInstance](DNDRemoteServiceConnection, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __68__DNDModeConfigurationService_syncModeConfigurationsReturningError___block_invoke;
  v12[3] = &unk_1E39B5610;
  v12[4] = &v19;
  v12[5] = &v13;
  objc_msgSend(v7, "syncModeConfigurationsWithRequestDetails:completionHandler:", v6, v12);

  if (a3)
  {
    v8 = (void *)v14[5];
    if (v8)
      *a3 = objc_retainAutorelease(v8);
  }
  v9 = DNDLogModeConfiguration;
  if (os_log_type_enabled((os_log_t)DNDLogModeConfiguration, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v25 = v6;
    _os_log_impl(&dword_19ABEB000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] Synced mode configurations", buf, 0xCu);
  }
  v10 = *((_BYTE *)v20 + 24) != 0;
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v19, 8);
  os_activity_scope_leave(&state);

  return v10;
}

void __68__DNDModeConfigurationService_syncModeConfigurationsReturningError___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (id)createDefaultDrivingModeConfigurationWithError:(id *)a3
{
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  os_activity_scope_state_s v10;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = _os_activity_create(&dword_19ABEB000, "com.apple.donotdisturb.DNDModeConfigurationService.createDefaultDrivingModeConfiguration", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v10.opaque[0] = 0;
  v10.opaque[1] = 0;
  os_activity_scope_enter(v5, &v10);
  +[DNDRequestDetails detailsRepresentingNowWithClientIdentifier:](DNDRequestDetails, "detailsRepresentingNowWithClientIdentifier:", self->_clientIdentifier);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = DNDLogSettings;
  if (os_log_type_enabled((os_log_t)DNDLogSettings, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v12 = v6;
    _os_log_impl(&dword_19ABEB000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Creating Driving mode configuration from template", buf, 0xCu);
  }
  -[DNDModeConfigurationService _createDefaultModeConfigurationForIdentifier:withRequestDetails:error:](self, "_createDefaultModeConfigurationForIdentifier:withRequestDetails:error:", CFSTR("com.apple.donotdisturb.mode.driving"), v6, a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  os_activity_scope_leave(&v10);
  return v8;
}

- (id)createDefaultSleepingModeConfigurationWithError:(id *)a3
{
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  os_activity_scope_state_s v10;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = _os_activity_create(&dword_19ABEB000, "com.apple.donotdisturb.DNDModeConfigurationService.createDefaultSleepingModeConfiguration", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v10.opaque[0] = 0;
  v10.opaque[1] = 0;
  os_activity_scope_enter(v5, &v10);
  +[DNDRequestDetails detailsRepresentingNowWithClientIdentifier:](DNDRequestDetails, "detailsRepresentingNowWithClientIdentifier:", self->_clientIdentifier);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = DNDLogSettings;
  if (os_log_type_enabled((os_log_t)DNDLogSettings, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v12 = v6;
    _os_log_impl(&dword_19ABEB000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Creating Sleeping mode configuration from template", buf, 0xCu);
  }
  -[DNDModeConfigurationService _createDefaultModeConfigurationForIdentifier:withRequestDetails:error:](self, "_createDefaultModeConfigurationForIdentifier:withRequestDetails:error:", CFSTR("com.apple.sleep.sleep-mode"), v6, a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  os_activity_scope_leave(&v10);
  return v8;
}

- (id)createDefaultWorkoutModeConfigurationWithError:(id *)a3
{
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  os_activity_scope_state_s v10;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = _os_activity_create(&dword_19ABEB000, "com.apple.donotdisturb.DNDModeConfigurationService.createDefaultWorkoutModeConfiguration", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v10.opaque[0] = 0;
  v10.opaque[1] = 0;
  os_activity_scope_enter(v5, &v10);
  +[DNDRequestDetails detailsRepresentingNowWithClientIdentifier:](DNDRequestDetails, "detailsRepresentingNowWithClientIdentifier:", self->_clientIdentifier);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = DNDLogSettings;
  if (os_log_type_enabled((os_log_t)DNDLogSettings, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v12 = v6;
    _os_log_impl(&dword_19ABEB000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Creating Workout mode configuration from template", buf, 0xCu);
  }
  -[DNDModeConfigurationService _createDefaultModeConfigurationForIdentifier:withRequestDetails:error:](self, "_createDefaultModeConfigurationForIdentifier:withRequestDetails:error:", CFSTR("com.apple.donotdisturb.mode.workout"), v6, a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  os_activity_scope_leave(&v10);
  return v8;
}

- (id)createModeConfigurationUsingTemplateForModeIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  os_activity_scope_state_s v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = _os_activity_create(&dword_19ABEB000, "com.apple.donotdisturb.DNDModeConfigurationService.createModeConfigurationUsingTemplateForModeIdentifier", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v12.opaque[0] = 0;
  v12.opaque[1] = 0;
  os_activity_scope_enter(v7, &v12);
  +[DNDRequestDetails detailsRepresentingNowWithClientIdentifier:](DNDRequestDetails, "detailsRepresentingNowWithClientIdentifier:", self->_clientIdentifier);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = DNDLogSettings;
  if (os_log_type_enabled((os_log_t)DNDLogSettings, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v14 = v8;
    v15 = 2112;
    v16 = v6;
    _os_log_impl(&dword_19ABEB000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] Creating mode configuration from template for identifier: identifier=%{pubic}@", buf, 0x16u);
  }
  -[DNDModeConfigurationService _createDefaultModeConfigurationForIdentifier:withRequestDetails:error:](self, "_createDefaultModeConfigurationForIdentifier:withRequestDetails:error:", v6, v8, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  os_activity_scope_leave(&v12);
  return v10;
}

- (id)createEmptyModeConfigurationForMode:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  os_activity_scope_state_s v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = _os_activity_create(&dword_19ABEB000, "com.apple.donotdisturb.DNDModeConfigurationService.createEmptyModeConfigurationForMode", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v13.opaque[0] = 0;
  v13.opaque[1] = 0;
  os_activity_scope_enter(v7, &v13);
  +[DNDRequestDetails detailsRepresentingNowWithClientIdentifier:](DNDRequestDetails, "detailsRepresentingNowWithClientIdentifier:", self->_clientIdentifier);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)DNDLogSettings;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "modeIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v15 = v8;
    v16 = 2112;
    v17 = v10;
    _os_log_impl(&dword_19ABEB000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] Creating mode configuration from template for identifier: identifier=%{pubic}@", buf, 0x16u);

  }
  -[DNDModeConfigurationService _createEmptyModeConfigurationForMode:withRequestDetails:error:](self, "_createEmptyModeConfigurationForMode:withRequestDetails:error:", v6, v8, a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  os_activity_scope_leave(&v13);
  return v11;
}

- (id)_initWithClientIdentifier:(id)a3
{
  id v4;
  DNDModeConfigurationService *v5;
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
  v18.super_class = (Class)DNDModeConfigurationService;
  v5 = -[DNDModeConfigurationService init](&v18, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    clientIdentifier = v5->_clientIdentifier;
    v5->_clientIdentifier = (NSString *)v6;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = dispatch_queue_create("com.apple.donotdisturb.DNDModeConfigurationService", v8);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v9;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = dispatch_queue_create("com.apple.donotdisturb.DNDModeConfigurationService.call-out", v11);
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

- (BOOL)removeModeConfigurationForModeIdentifier:(id)a3 deletePlaceholder:(BOOL)a4 error:(id *)a5
{
  _BOOL8 v6;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  BOOL v16;
  _QWORD v18[6];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  char v28;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v6 = a4;
  v34 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = _os_activity_create(&dword_19ABEB000, "com.apple.donotdisturb.DNDModeConfigurationService.removeModeConfiguration", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v9, &state);
  +[DNDRequestDetails detailsRepresentingNowWithClientIdentifier:](DNDRequestDetails, "detailsRepresentingNowWithClientIdentifier:", self->_clientIdentifier);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__3;
  v23 = __Block_byref_object_dispose__3;
  v24 = 0;
  if (-[DNDModeConfigurationService canRemoveModeConfigurationForModeIdentifier:](self, "canRemoveModeConfigurationForModeIdentifier:", v8))
  {
    +[DNDRemoteServiceConnection sharedInstance](DNDRemoteServiceConnection, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __96__DNDModeConfigurationService_removeModeConfigurationForModeIdentifier_deletePlaceholder_error___block_invoke;
    v18[3] = &unk_1E39B5610;
    v18[4] = &v25;
    v18[5] = &v19;
    objc_msgSend(v11, "removeModeConfigurationForModeIdentifier:deletePlaceholder:withRequestDetails:completionHandler:", v8, v12, v10, v18);

    v13 = DNDLogModeConfiguration;
    if (*((_BYTE *)v26 + 24))
    {
      if (os_log_type_enabled((os_log_t)DNDLogModeConfiguration, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v31 = v10;
        v32 = 2114;
        v33 = v8;
        _os_log_impl(&dword_19ABEB000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@] Remove mode configuration, identifier=%{public}@", buf, 0x16u);
      }
    }
    else if (os_log_type_enabled((os_log_t)DNDLogModeConfiguration, OS_LOG_TYPE_ERROR))
    {
      -[DNDModeConfigurationService removeModeConfigurationForModeIdentifier:deletePlaceholder:error:].cold.1();
    }
    if (a5)
    {
      v15 = (void *)v20[5];
      if (v15)
        *a5 = objc_retainAutorelease(v15);
    }
  }
  else
  {
    *((_BYTE *)v26 + 24) = 0;
    v14 = DNDLogModeConfiguration;
    if (os_log_type_enabled((os_log_t)DNDLogModeConfiguration, OS_LOG_TYPE_ERROR))
      -[DNDModeConfigurationService removeModeConfigurationForModeIdentifier:deletePlaceholder:error:].cold.2((uint64_t)v10, (uint64_t)v8, v14);
  }
  v16 = *((_BYTE *)v26 + 24) != 0;
  _Block_object_dispose(&v19, 8);

  _Block_object_dispose(&v25, 8);
  os_activity_scope_leave(&state);

  return v16;
}

void __96__DNDModeConfigurationService_removeModeConfigurationForModeIdentifier_deletePlaceholder_error___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (unint64_t)_defaultConfigurationTypeForModeSemanticType:(int64_t)a3
{
  if ((unint64_t)a3 > 9)
    return 2;
  else
    return qword_19AC32A40[a3];
}

- (id)_createDefaultModeConfigurationForIdentifier:(id)a3 withRequestDetails:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  DNDMode *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  DNDMode *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  DNDMutableModeConfiguration *v25;
  _QWORD v27[4];
  id v28;
  uint64_t *v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  char v40;
  uint64_t v41;
  const __CFString *v42;
  uint64_t v43;
  _QWORD v44[3];

  v44[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  -[DNDModeConfigurationService allModesReturningError:](self, "allModesReturningError:", a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = 0;
  v38 = &v37;
  v39 = 0x2020000000;
  v40 = 0;
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__3;
  v35 = __Block_byref_object_dispose__3;
  v36 = 0;
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __101__DNDModeConfigurationService__createDefaultModeConfigurationForIdentifier_withRequestDetails_error___block_invoke;
  v27[3] = &unk_1E39B5CB8;
  v11 = v8;
  v28 = v11;
  v29 = &v37;
  v30 = &v31;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", v27);
  if (*((_BYTE *)v38 + 24))
  {
    if (a5)
    {
      v12 = (void *)MEMORY[0x1E0CB35C8];
      v41 = *MEMORY[0x1E0CB2D50];
      v42 = CFSTR("Mode configuration already exists for mode identifier.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v42, &v41, 1);
      v13 = (DNDMode *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "errorWithDomain:code:userInfo:", CFSTR("DNDErrorDomain"), 1001, v13);
      v14 = (id)objc_claimAutoreleasedReturnValue();
LABEL_4:
      v15 = 0;
      *a5 = v14;
LABEL_16:

      goto LABEL_17;
    }
  }
  else
  {
    if (v32[5])
    {
      if (objc_msgSend(v11, "isEqualToString:", CFSTR("com.apple.focus.reduce-interruptions")))
      {
        +[DNDModeConfiguration defaultReduceInterruptionsMode](DNDMutableModeConfiguration, "defaultReduceInterruptionsMode");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = (void *)objc_msgSend(v16, "mutableCopy");
        v13 = 0;
      }
      else
      {
        v19 = [DNDMode alloc];
        objc_msgSend((id)v32[5], "name");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v32[5], "modeIdentifier");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v32[5], "symbolImageName");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v32[5], "tintColorName");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = -[DNDMode initWithName:modeIdentifier:symbolImageName:tintColorName:semanticType:](v19, "initWithName:modeIdentifier:symbolImageName:tintColorName:semanticType:", v20, v21, v22, v23, objc_msgSend((id)v32[5], "semanticType"));

        -[DNDModeConfigurationService _createModeSpecificConfigurationForModeSemanticType:withIdentifier:](self, "_createModeSpecificConfigurationForModeSemanticType:withIdentifier:", -[DNDMode semanticType](v13, "semanticType"), v11);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[DNDModeConfigurationService _createTriggersForFocusWithIdentifier:](self, "_createTriggersForFocusWithIdentifier:", v11);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = -[DNDModeConfiguration initWithMode:configuration:triggers:]([DNDMutableModeConfiguration alloc], "initWithMode:configuration:triggers:", v13, v16, v24);
        -[DNDModeConfigurationService _setModeConfigurationDefaultsForModeConfiguration:withIdentifier:](self, "_setModeConfigurationDefaultsForModeConfiguration:withIdentifier:", v25, v11);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

      }
      if (-[DNDModeConfigurationService setModeConfiguration:error:](self, "setModeConfiguration:error:", v17, a5))
        v15 = (void *)objc_msgSend(v17, "copy");
      else
        v15 = 0;

      goto LABEL_16;
    }
    if (a5)
    {
      v18 = (void *)MEMORY[0x1E0CB35C8];
      v43 = *MEMORY[0x1E0CB2D50];
      v44[0] = CFSTR("No template found for mode identifier.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v44, &v43, 1);
      v13 = (DNDMode *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "errorWithDomain:code:userInfo:", CFSTR("DNDErrorDomain"), 1002, v13);
      v14 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_4;
    }
  }
  v15 = 0;
LABEL_17:

  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v37, 8);

  return v15;
}

void __101__DNDModeConfigurationService__createDefaultModeConfigurationForIdentifier_withRequestDetails_error___block_invoke(_QWORD *a1, void *a2, _BYTE *a3)
{
  void *v6;
  int v7;
  id v8;

  v8 = a2;
  objc_msgSend(v8, "modeIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", a1[4]);

  if (v7)
  {
    *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = objc_msgSend(v8, "isPlaceholder") ^ 1;
    objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), a2);
    *a3 = 1;
  }

}

- (id)_createModeSpecificConfigurationForModeSemanticType:(int64_t)a3 withIdentifier:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v6 = a4;
  +[DNDMutableConfiguration configurationOfType:](DNDMutableConfiguration, "configurationOfType:", -[DNDModeConfigurationService _defaultConfigurationTypeForModeSemanticType:](self, "_defaultConfigurationTypeForModeSemanticType:", a3));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.sleep.sleep-mode")))
  {
    objc_msgSend(v7, "setHideApplicationBadges:", 2);
  }
  else if (objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.focus.reduce-interruptions")))
  {
    +[DNDModeConfiguration defaultReduceInterruptionsMode](DNDModeConfiguration, "defaultReduceInterruptionsMode");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "mutableCopy");

    v7 = (void *)v9;
  }

  return v7;
}

- (id)_createTriggersForFocusWithIdentifier:(id)a3
{
  id v3;
  void *v4;
  __objc2_class *v5;
  DNDModeConfigurationSmartTrigger *v6;
  DNDModeConfigurationSmartTrigger *v7;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.sleep.sleep-mode")))
  {
    v5 = DNDModeConfigurationSleepingTrigger;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.donotdisturb.mode.driving")))
  {
    v5 = DNDModeConfigurationDrivingTrigger;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.donotdisturb.mode.workout")))
  {
    v5 = DNDModeConfigurationWorkoutTrigger;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.focus.gaming")))
  {
    v5 = DNDModeConfigurationGameControllerTrigger;
  }
  else
  {
    if (!objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.focus.mindfulness")))
    {
      v6 = -[DNDModeConfigurationTrigger initWithEnabledSetting:]([DNDModeConfigurationSmartTrigger alloc], "initWithEnabledSetting:", 1);
      goto LABEL_12;
    }
    v5 = DNDModeConfigurationMindfulnessTrigger;
  }
  v6 = (DNDModeConfigurationSmartTrigger *)objc_alloc_init(v5);
LABEL_12:
  v7 = v6;
  objc_msgSend(v4, "addObject:", v6);

  return v4;
}

- (id)_setModeConfigurationDefaultsForModeConfiguration:(id)a3 withIdentifier:(id)a4
{
  id v5;

  v5 = a3;
  if (objc_msgSend(a4, "isEqualToString:", CFSTR("com.apple.sleep.sleep-mode")))
    objc_msgSend(v5, "setDimsLockScreen:", 2);
  objc_msgSend(v5, "setAutomaticallyGenerated:", 1);
  return v5;
}

- (id)_createEmptyModeConfigurationForMode:(id)a3 withRequestDetails:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  DNDModeConfigurationSmartTrigger *v16;
  DNDMutableModeConfiguration *v17;
  _QWORD v19[4];
  id v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  -[DNDModeConfigurationService allModesReturningError:](self, "allModesReturningError:", a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __93__DNDModeConfigurationService__createEmptyModeConfigurationForMode_withRequestDetails_error___block_invoke;
  v19[3] = &unk_1E39B5CE0;
  v11 = v8;
  v20 = v11;
  v21 = &v22;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", v19);
  if (!*((_BYTE *)v23 + 24))
  {
    +[DNDMutableConfiguration configurationOfType:](DNDMutableConfiguration, "configurationOfType:", 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[DNDModeConfigurationTrigger initWithEnabledSetting:]([DNDModeConfigurationSmartTrigger alloc], "initWithEnabledSetting:", 1);
    objc_msgSend(v15, "addObject:", v16);

    v17 = -[DNDModeConfiguration initWithMode:configuration:triggers:]([DNDMutableModeConfiguration alloc], "initWithMode:configuration:triggers:", v11, v13, v15);
    -[DNDMutableModeConfiguration setAutomaticallyGenerated:](v17, "setAutomaticallyGenerated:", 1);
    if (-[DNDModeConfigurationService setModeConfiguration:error:](self, "setModeConfiguration:error:", v17, a5))
      v14 = (void *)-[DNDMutableModeConfiguration copy](v17, "copy");
    else
      v14 = 0;

    goto LABEL_9;
  }
  if (a5)
  {
    v12 = (void *)MEMORY[0x1E0CB35C8];
    v26 = *MEMORY[0x1E0CB2D50];
    v27[0] = CFSTR("Mode configuration already exists for mode identifier.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "errorWithDomain:code:userInfo:", CFSTR("DNDErrorDomain"), 1001, v13);
    v14 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_9:

    goto LABEL_10;
  }
  v14 = 0;
LABEL_10:

  _Block_object_dispose(&v22, 8);
  return v14;
}

void __93__DNDModeConfigurationService__createEmptyModeConfigurationForMode_withRequestDetails_error___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v5;
  void *v6;
  int v7;
  id v8;

  v8 = a2;
  objc_msgSend(v8, "modeIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "modeIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  if (v7)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v8, "isPlaceholder") ^ 1;
    *a3 = 1;
  }

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

- (void)hasActivelyConfiguredModes:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0(&dword_19ABEB000, v0, v1, "[%{public}@] Error determining if modes have been actively configured, error='%{public}@'");
  OUTLINED_FUNCTION_1();
}

- (void)setModeConfiguration:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0(&dword_19ABEB000, v0, v1, "[%{public}@] Error when setting mode configuration, error='%{public}@'");
  OUTLINED_FUNCTION_1();
}

- (void)modeConfigurationsReturningError:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0(&dword_19ABEB000, v0, v1, "[%{public}@] Error when getting mode configurations, error='%{public}@'");
  OUTLINED_FUNCTION_1();
}

- (void)isLocalUserAvailableForContactInActiveMode:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0(&dword_19ABEB000, v0, v1, "[%{public}@] Error when getting user availability in current mode for contact, error='%{public}@'");
  OUTLINED_FUNCTION_1();
}

- (void)allowedModesForContactHandle:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0(&dword_19ABEB000, v0, v1, "[%{public}@] Error when getting allowed modes for contact, error='%{public}@'");
  OUTLINED_FUNCTION_1();
}

- (void)silencedModesForContactHandle:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0(&dword_19ABEB000, v0, v1, "[%{public}@] Error when getting silenced modes for contact, error='%{public}@'");
  OUTLINED_FUNCTION_1();
}

- (void)publishCurrentStatusKitAvailabilityReturningError:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0(&dword_19ABEB000, v0, v1, "[%{public}@] Error when publishing statuskit availability, error='%{public}@'");
  OUTLINED_FUNCTION_1();
}

- (void)setAppConfigurationPredicate:forActionIdentifier:forApplicationIdentifier:modeIdentifier:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0(&dword_19ABEB000, v0, v1, "[%{public}@] Error when setting app configuration predicate, error='%{public}@'");
  OUTLINED_FUNCTION_1();
}

- (void)getAppConfigurationPredicateForActionIdentifier:forApplicationIdentifier:modeIdentifier:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0(&dword_19ABEB000, v0, v1, "[%{public}@] Error when getting app configuration predicate, error='%{public}@'");
  OUTLINED_FUNCTION_1();
}

- (void)setAppConfigurationTargetContentIdentifierPrefix:forActionIdentifier:forApplicationIdentifier:modeIdentifier:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0(&dword_19ABEB000, v0, v1, "[%{public}@] Error when setting target content identifier prefix, error='%{public}@'");
  OUTLINED_FUNCTION_1();
}

- (void)getAppConfigurationTargetContentIdentifierPrefixesForModeIdentifier:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0(&dword_19ABEB000, v0, v1, "[%{public}@] Error when getting target content identifier prefixes, error='%{public}@'");
  OUTLINED_FUNCTION_1();
}

- (void)setAppAction:forApplicationIdentifier:modeIdentifier:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0(&dword_19ABEB000, v0, v1, "[%{public}@] Error when setting app configuration action, error='%{public}@'");
  OUTLINED_FUNCTION_1();
}

- (void)clearAppActionWithIdentifier:forApplicationIdentifier:modeIdentifier:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0(&dword_19ABEB000, v0, v1, "[%{public}@] Error when clearing app action, error='%{public}@'");
  OUTLINED_FUNCTION_1();
}

- (void)getAppActionsForModeIdentifier:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0(&dword_19ABEB000, v0, v1, "[%{public}@] Error when getting app actions, error='%{public}@'");
  OUTLINED_FUNCTION_1();
}

- (void)setSystemAction:forModeIdentifier:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0(&dword_19ABEB000, v0, v1, "[%{public}@] Error when setting system configuration action, error='%{public}@'");
  OUTLINED_FUNCTION_1();
}

- (void)clearSystemActionWithIdentifier:forModeIdentifier:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0(&dword_19ABEB000, v0, v1, "[%{public}@] Error when clearing system action, error='%{public}@'");
  OUTLINED_FUNCTION_1();
}

- (void)getSystemActionsForModeIdentifier:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0(&dword_19ABEB000, v0, v1, "[%{public}@] Error when getting system actions, error='%{public}@'");
  OUTLINED_FUNCTION_1();
}

- (void)getSyncPreferenceEnabledReturningError:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0(&dword_19ABEB000, v0, v1, "[%{public}@] Error when getting sync preference enabled, error='%{public}@'");
  OUTLINED_FUNCTION_1();
}

- (void)getSyncAvailableReturningError:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0(&dword_19ABEB000, v0, v1, "[%{public}@] Error when getting sync available, error='%{public}@'");
  OUTLINED_FUNCTION_1();
}

- (void)getSyncEnabledReturningError:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0(&dword_19ABEB000, v0, v1, "[%{public}@] Error when getting sync enabled, error='%{public}@'");
  OUTLINED_FUNCTION_1();
}

- (void)setSyncPreferenceEnabled:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0(&dword_19ABEB000, v0, v1, "[%{public}@] Error when setting sync enabled, error='%{public}@'");
  OUTLINED_FUNCTION_1();
}

void __65__DNDModeConfigurationService_addListener_withCompletionHandler___block_invoke_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *a1;
  v3 = 138543362;
  v4 = v2;
  _os_log_error_impl(&dword_19ABEB000, a2, OS_LOG_TYPE_ERROR, "Did not register for updates, will remove listener: listener=%{public}@", (uint8_t *)&v3, 0xCu);
  OUTLINED_FUNCTION_1();
}

- (void)removeModeConfigurationForModeIdentifier:deletePlaceholder:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0(&dword_19ABEB000, v0, v1, "[%{public}@] Error when removing mode configuration, error='%{public}@'");
  OUTLINED_FUNCTION_1();
}

- (void)removeModeConfigurationForModeIdentifier:(uint64_t)a1 deletePlaceholder:(uint64_t)a2 error:(NSObject *)a3 .cold.2(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138543618;
  *(_QWORD *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2114;
  *(_QWORD *)&v3[14] = a2;
  OUTLINED_FUNCTION_0(&dword_19ABEB000, a2, a3, "[%{public}@] Error mode configuration for identifier cannot be removed, identifier=%{public}@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  OUTLINED_FUNCTION_1();
}

- (void)_queue_registerForUpdatesIfRequired
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0(&dword_19ABEB000, v0, v1, "[%{public}@] Error when registering update listener, error='%{public}@'");
  OUTLINED_FUNCTION_1();
}

@end
