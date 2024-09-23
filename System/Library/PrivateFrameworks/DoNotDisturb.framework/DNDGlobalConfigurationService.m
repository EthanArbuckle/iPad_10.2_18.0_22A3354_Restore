@implementation DNDGlobalConfigurationService

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
  if (serviceForClientIdentifier__onceToken_8 != -1)
    dispatch_once(&serviceForClientIdentifier__onceToken_8, &__block_literal_global_13);
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__8;
  v17 = __Block_byref_object_dispose__8;
  v18 = 0;
  v5 = serviceForClientIdentifier__lockQueue_7;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__DNDGlobalConfigurationService_serviceForClientIdentifier___block_invoke_2;
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

void __60__DNDGlobalConfigurationService_serviceForClientIdentifier___block_invoke()
{
  NSObject *v0;
  dispatch_queue_t v1;
  void *v2;
  uint64_t v3;
  void *v4;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = dispatch_queue_create("com.apple.donotdisturb.DNDGlobalConfigurationService.service.lock", v0);
  v2 = (void *)serviceForClientIdentifier__lockQueue_7;
  serviceForClientIdentifier__lockQueue_7 = (uint64_t)v1;

  objc_msgSend(MEMORY[0x1E0CB3748], "mapTableWithKeyOptions:valueOptions:", 0, 517);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)serviceForClientIdentifier__serviceByClientIdentifier_8;
  serviceForClientIdentifier__serviceByClientIdentifier_8 = v3;

}

void __60__DNDGlobalConfigurationService_serviceForClientIdentifier___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  objc_msgSend((id)serviceForClientIdentifier__serviceByClientIdentifier_8, "objectForKey:", *(_QWORD *)(a1 + 32));
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

    objc_msgSend((id)serviceForClientIdentifier__serviceByClientIdentifier_8, "setObject:forKey:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(_QWORD *)(a1 + 32));
  }
}

- (BOOL)isAutoReplyPrevented
{
  return -[DNDGlobalConfigurationService getPreventAutoReplyReturningError:](self, "getPreventAutoReplyReturningError:", 0);
}

- (BOOL)getPreventAutoReplyReturningError:(id *)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  const __CFString *v9;
  void *v10;
  BOOL v11;
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
  char v23;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  const __CFString *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = _os_activity_create(&dword_19ABEB000, "com.apple.donotdisturb.DNDGlobalConfigurationService.getPreventAutoReply", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  +[DNDRequestDetails detailsRepresentingNowWithClientIdentifier:](DNDRequestDetails, "detailsRepresentingNowWithClientIdentifier:", self->_clientIdentifier);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__8;
  v18 = __Block_byref_object_dispose__8;
  v19 = 0;
  +[DNDRemoteServiceConnection sharedInstance](DNDRemoteServiceConnection, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __67__DNDGlobalConfigurationService_getPreventAutoReplyReturningError___block_invoke;
  v13[3] = &unk_1E39B5610;
  v13[4] = &v20;
  v13[5] = &v14;
  objc_msgSend(v7, "getPreventAutoReplyWithRequestDetails:completionHandler:", v6, v13);

  v8 = DNDLogGlobalConfiguration;
  if (v15[5])
  {
    if (os_log_type_enabled((os_log_t)DNDLogGlobalConfiguration, OS_LOG_TYPE_ERROR))
      -[DNDGlobalConfigurationService getPreventAutoReplyReturningError:].cold.1();
  }
  else if (os_log_type_enabled((os_log_t)DNDLogGlobalConfiguration, OS_LOG_TYPE_DEFAULT))
  {
    if (*((_BYTE *)v21 + 24))
      v9 = CFSTR("prevented");
    else
      v9 = CFSTR("not prevented");
    *(_DWORD *)buf = 138543618;
    v26 = v6;
    v27 = 2114;
    v28 = v9;
    _os_log_impl(&dword_19ABEB000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Auto reply is %{public}@", buf, 0x16u);
  }
  if (a3)
  {
    v10 = (void *)v15[5];
    if (v10)
      *a3 = objc_retainAutorelease(v10);
  }
  v11 = *((_BYTE *)v21 + 24) != 0;
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&v20, 8);
  os_activity_scope_leave(&state);

  return v11;
}

void __67__DNDGlobalConfigurationService_getPreventAutoReplyReturningError___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (BOOL)setPreventAutoReply:(BOOL)a3 error:(id *)a4
{
  _BOOL8 v5;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  const __CFString *v12;
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
  const __CFString *v31;
  uint64_t v32;

  v5 = a3;
  v32 = *MEMORY[0x1E0C80C00];
  v7 = _os_activity_create(&dword_19ABEB000, "com.apple.donotdisturb.DNDGlobalConfigurationService.setPreventAutoReply", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
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
  v20 = __Block_byref_object_copy__8;
  v21 = __Block_byref_object_dispose__8;
  v22 = 0;
  +[DNDRemoteServiceConnection sharedInstance](DNDRemoteServiceConnection, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __59__DNDGlobalConfigurationService_setPreventAutoReply_error___block_invoke;
  v16[3] = &unk_1E39B5610;
  v16[4] = &v23;
  v16[5] = &v17;
  objc_msgSend(v9, "setPreventAutoReply:withRequestDetails:completionHandler:", v10, v8, v16);

  v11 = DNDLogGlobalConfiguration;
  if (*((_BYTE *)v24 + 24))
  {
    if (os_log_type_enabled((os_log_t)DNDLogGlobalConfiguration, OS_LOG_TYPE_DEFAULT))
    {
      v12 = CFSTR("not prevented");
      if (v5)
        v12 = CFSTR("prevented");
      *(_DWORD *)buf = 138543618;
      v29 = v8;
      v30 = 2114;
      v31 = v12;
      _os_log_impl(&dword_19ABEB000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] Set auto reply to %{public}@", buf, 0x16u);
    }
  }
  else if (os_log_type_enabled((os_log_t)DNDLogGlobalConfiguration, OS_LOG_TYPE_ERROR))
  {
    -[DNDGlobalConfigurationService setPreventAutoReply:error:].cold.1();
  }
  if (a4)
  {
    v13 = (void *)v18[5];
    if (v13)
      *a4 = objc_retainAutorelease(v13);
  }
  v14 = *((_BYTE *)v24 + 24) != 0;
  _Block_object_dispose(&v17, 8);

  _Block_object_dispose(&v23, 8);
  os_activity_scope_leave(&state);

  return v14;
}

void __59__DNDGlobalConfigurationService_setPreventAutoReply_error___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (BOOL)modesCanImpactAvailability
{
  NSObject *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  const __CFString *v7;
  BOOL v8;
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  const __CFString *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = _os_activity_create(&dword_19ABEB000, "com.apple.donotdisturb.DNDGlobalConfigurationService.modesCanImpactAvailability", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v3, &state);
  +[DNDRequestDetails detailsRepresentingNowWithClientIdentifier:](DNDRequestDetails, "detailsRepresentingNowWithClientIdentifier:", self->_clientIdentifier);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 1;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__8;
  v15 = __Block_byref_object_dispose__8;
  v16 = 0;
  +[DNDRemoteServiceConnection sharedInstance](DNDRemoteServiceConnection, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __59__DNDGlobalConfigurationService_modesCanImpactAvailability__block_invoke;
  v10[3] = &unk_1E39B5610;
  v10[4] = &v17;
  v10[5] = &v11;
  objc_msgSend(v5, "getModesCanImpactAvailabilityWithRequestDetails:completionHandler:", v4, v10);

  v6 = DNDLogGlobalConfiguration;
  if (v12[5])
  {
    if (os_log_type_enabled((os_log_t)DNDLogGlobalConfiguration, OS_LOG_TYPE_ERROR))
      -[DNDGlobalConfigurationService modesCanImpactAvailability].cold.1();
  }
  else if (os_log_type_enabled((os_log_t)DNDLogGlobalConfiguration, OS_LOG_TYPE_DEFAULT))
  {
    if (*((_BYTE *)v18 + 24))
      v7 = &stru_1E39B74A8;
    else
      v7 = CFSTR("not");
    *(_DWORD *)buf = 138543618;
    v23 = v4;
    v24 = 2114;
    v25 = v7;
    _os_log_impl(&dword_19ABEB000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Modes can%{public}@ impact availability.", buf, 0x16u);
  }
  v8 = *((_BYTE *)v18 + 24) != 0;
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
  os_activity_scope_leave(&state);

  return v8;
}

void __59__DNDGlobalConfigurationService_modesCanImpactAvailability__block_invoke(uint64_t a1, void *a2, void *a3)
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

- (BOOL)setModesCanImpactAvailability:(BOOL)a3 error:(id *)a4
{
  _BOOL8 v5;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  const __CFString *v12;
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
  const __CFString *v31;
  uint64_t v32;

  v5 = a3;
  v32 = *MEMORY[0x1E0C80C00];
  v7 = _os_activity_create(&dword_19ABEB000, "com.apple.donotdisturb.DNDGlobalConfigurationService.setModesCanImpactAvailability", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
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
  v20 = __Block_byref_object_copy__8;
  v21 = __Block_byref_object_dispose__8;
  v22 = 0;
  +[DNDRemoteServiceConnection sharedInstance](DNDRemoteServiceConnection, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __69__DNDGlobalConfigurationService_setModesCanImpactAvailability_error___block_invoke;
  v16[3] = &unk_1E39B5610;
  v16[4] = &v23;
  v16[5] = &v17;
  objc_msgSend(v9, "setModesCanImpactAvailability:withRequestDetails:completionHandler:", v10, v8, v16);

  v11 = DNDLogGlobalConfiguration;
  if (*((_BYTE *)v24 + 24))
  {
    if (os_log_type_enabled((os_log_t)DNDLogGlobalConfiguration, OS_LOG_TYPE_DEFAULT))
    {
      v12 = CFSTR("NO");
      if (v5)
        v12 = CFSTR("YES");
      *(_DWORD *)buf = 138543618;
      v29 = v8;
      v30 = 2114;
      v31 = v12;
      _os_log_impl(&dword_19ABEB000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] Set modesCanImpactAvailability to %{public}@", buf, 0x16u);
    }
  }
  else if (os_log_type_enabled((os_log_t)DNDLogGlobalConfiguration, OS_LOG_TYPE_ERROR))
  {
    -[DNDGlobalConfigurationService setModesCanImpactAvailability:error:].cold.1();
  }
  if (a4)
  {
    v13 = (void *)v18[5];
    if (v13)
      *a4 = objc_retainAutorelease(v13);
  }
  v14 = *((_BYTE *)v24 + 24) != 0;
  _Block_object_dispose(&v17, 8);

  _Block_object_dispose(&v23, 8);
  os_activity_scope_leave(&state);

  return v14;
}

void __69__DNDGlobalConfigurationService_setModesCanImpactAvailability_error___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (id)getPhoneCallBypassSettingsReturningError:(id *)a3
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v4 = DNDLogGlobalConfiguration;
  if (os_log_type_enabled((os_log_t)DNDLogGlobalConfiguration, OS_LOG_TYPE_ERROR))
  {
    -[DNDGlobalConfigurationService getPhoneCallBypassSettingsReturningError:].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);
    if (!a3)
      return 0;
    goto LABEL_3;
  }
  if (a3)
  {
LABEL_3:
    v12 = (void *)MEMORY[0x1E0CB35C8];
    v15 = *MEMORY[0x1E0CB2D50];
    v16[0] = CFSTR("Bypass settings are now per mode configuration");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "errorWithDomain:code:userInfo:", CFSTR("DNDErrorDomain"), 1004, v13);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

  }
  return 0;
}

- (BOOL)setPhoneCallBypassSettings:(id)a3 error:(id *)a4
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = DNDLogGlobalConfiguration;
  if (os_log_type_enabled((os_log_t)DNDLogGlobalConfiguration, OS_LOG_TYPE_ERROR))
  {
    -[DNDGlobalConfigurationService getPhoneCallBypassSettingsReturningError:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);
    if (!a4)
      goto LABEL_4;
    goto LABEL_3;
  }
  if (a4)
  {
LABEL_3:
    v14 = (void *)MEMORY[0x1E0CB35C8];
    v17 = *MEMORY[0x1E0CB2D50];
    v18[0] = CFSTR("Bypass settings are now per mode configuration");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "errorWithDomain:code:userInfo:", CFSTR("DNDErrorDomain"), 1004, v15);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

  }
LABEL_4:

  return 0;
}

- (BOOL)isCloudSyncActive
{
  return (~-[DNDGlobalConfigurationService getCloudSyncStateReturningError:](self, "getCloudSyncStateReturningError:", 0) & 0xF) == 0;
}

- (void)isCloudSyncActiveWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72__DNDGlobalConfigurationService_isCloudSyncActiveWithCompletionHandler___block_invoke;
  block[3] = &unk_1E39B6160;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __72__DNDGlobalConfigurationService_isCloudSyncActiveWithCompletionHandler___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  _QWORD *v3;
  char v4;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  char v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained && *(_QWORD *)(a1 + 32))
  {
    v4 = objc_msgSend(WeakRetained, "isCloudSyncActive");
    v5 = v3[2];
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __72__DNDGlobalConfigurationService_isCloudSyncActiveWithCompletionHandler___block_invoke_2;
    v6[3] = &unk_1E39B5728;
    v7 = *(id *)(a1 + 32);
    v8 = v4;
    dispatch_async(v5, v6);

  }
}

uint64_t __72__DNDGlobalConfigurationService_isCloudSyncActiveWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (unint64_t)getCloudSyncStateReturningError:(id *)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  unint64_t v9;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = _os_activity_create(&dword_19ABEB000, "com.apple.donotdisturb.DNDModeConfigurationService.getCloudSyncState", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v4, &state);
  +[DNDRequestDetails detailsRepresentingNowWithClientIdentifier:](DNDRequestDetails, "detailsRepresentingNowWithClientIdentifier:", self->_clientIdentifier);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__8;
  v16 = __Block_byref_object_dispose__8;
  v17 = 0;
  +[DNDRemoteServiceConnection sharedInstance](DNDRemoteServiceConnection, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __65__DNDGlobalConfigurationService_getCloudSyncStateReturningError___block_invoke;
  v11[3] = &unk_1E39B5610;
  v11[4] = &v18;
  v11[5] = &v12;
  objc_msgSend(v6, "getCloudSyncStateWithRequestDetails:completionHandler:", v5, v11);

  if (v13[5])
  {
    if (os_log_type_enabled((os_log_t)DNDLogGlobalConfiguration, OS_LOG_TYPE_ERROR))
      -[DNDGlobalConfigurationService getCloudSyncStateReturningError:].cold.1();
  }
  else
  {
    v7 = (id)DNDLogGlobalConfiguration;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v19[3]);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v24 = v5;
      v25 = 2114;
      v26 = v8;
      _os_log_impl(&dword_19ABEB000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Got cloud sync state=%{public}@", buf, 0x16u);

    }
  }
  v9 = v19[3];
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(&v18, 8);
  os_activity_scope_leave(&state);

  return v9;
}

void __65__DNDGlobalConfigurationService_getCloudSyncStateReturningError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;

  v5 = a3;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(a2, "unsignedIntegerValue");
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

- (BOOL)setCloudSyncPreferenceEnabled:(BOOL)a3 error:(id *)a4
{
  _BOOL8 v4;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  BOOL v12;
  _QWORD v14[6];
  _QWORD v15[5];
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v4 = a3;
  v26 = *MEMORY[0x1E0C80C00];
  v6 = _os_activity_create(&dword_19ABEB000, "com.apple.donotdisturb.DNDModeConfigurationService.setSyncPreferenceEnabled", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  +[DNDRequestDetails detailsRepresentingNowWithClientIdentifier:](DNDRequestDetails, "detailsRepresentingNowWithClientIdentifier:", self->_clientIdentifier);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x3032000000;
  v15[3] = __Block_byref_object_copy__8;
  v15[4] = __Block_byref_object_dispose__8;
  v16 = 0;
  +[DNDRemoteServiceConnection sharedInstance](DNDRemoteServiceConnection, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __69__DNDGlobalConfigurationService_setCloudSyncPreferenceEnabled_error___block_invoke;
  v14[3] = &unk_1E39B5610;
  v14[4] = &v17;
  v14[5] = v15;
  objc_msgSend(v8, "setCloudSyncPreferenceEnabled:withRequestDetails:completionHandler:", v9, v7, v14);

  if (*((_BYTE *)v18 + 24))
  {
    v10 = (id)DNDLogGlobalConfiguration;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v23 = v7;
      v24 = 2114;
      v25 = v11;
      _os_log_impl(&dword_19ABEB000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] Set cloud sync preference enabled=%{public}@", buf, 0x16u);

    }
    -[DNDGlobalConfigurationService _updateListenersOfCloudSyncPreferenceChange:](self, "_updateListenersOfCloudSyncPreferenceChange:", v4);
  }
  else if (os_log_type_enabled((os_log_t)DNDLogGlobalConfiguration, OS_LOG_TYPE_ERROR))
  {
    -[DNDGlobalConfigurationService setCloudSyncPreferenceEnabled:error:].cold.1();
  }
  v12 = *((_BYTE *)v18 + 24) != 0;
  _Block_object_dispose(v15, 8);

  _Block_object_dispose(&v17, 8);
  os_activity_scope_leave(&state);

  return v12;
}

void __69__DNDGlobalConfigurationService_setCloudSyncPreferenceEnabled_error___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (void)_updateListenersOfCloudSyncPreferenceChange:(BOOL)a3
{
  NSObject *queue;
  _QWORD v4[5];
  BOOL v5;

  queue = self->_queue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __77__DNDGlobalConfigurationService__updateListenersOfCloudSyncPreferenceChange___block_invoke;
  v4[3] = &unk_1E39B61B0;
  v4[4] = self;
  v5 = a3;
  dispatch_sync(queue, v4);
}

void __77__DNDGlobalConfigurationService__updateListenersOfCloudSyncPreferenceChange___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;
  char v8;
  id location;

  v2 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "copy");
  objc_initWeak(&location, *(id *)(a1 + 32));
  v3 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __77__DNDGlobalConfigurationService__updateListenersOfCloudSyncPreferenceChange___block_invoke_2;
  v5[3] = &unk_1E39B6188;
  objc_copyWeak(&v7, &location);
  v6 = v2;
  v8 = *(_BYTE *)(a1 + 40);
  v4 = v2;
  dispatch_async(v3, v5);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __77__DNDGlobalConfigurationService__updateListenersOfCloudSyncPreferenceChange___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    v3 = *(id *)(a1 + 32);
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v10;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v10 != v6)
            objc_enumerationMutation(v3);
          v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * v7);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v8, "globalConfigurationService:didEditCloudSyncPreference:", WeakRetained, *(unsigned __int8 *)(a1 + 48), (_QWORD)v9);
          ++v7;
        }
        while (v5 != v7);
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v5);
    }

  }
}

- (unint64_t)getPairSyncStateReturningError:(id *)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  unint64_t v9;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = _os_activity_create(&dword_19ABEB000, "com.apple.donotdisturb.DNDModeConfigurationService.getPairSyncState", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v4, &state);
  +[DNDRequestDetails detailsRepresentingNowWithClientIdentifier:](DNDRequestDetails, "detailsRepresentingNowWithClientIdentifier:", self->_clientIdentifier);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__8;
  v16 = __Block_byref_object_dispose__8;
  v17 = 0;
  +[DNDRemoteServiceConnection sharedInstance](DNDRemoteServiceConnection, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __64__DNDGlobalConfigurationService_getPairSyncStateReturningError___block_invoke;
  v11[3] = &unk_1E39B5610;
  v11[4] = &v18;
  v11[5] = &v12;
  objc_msgSend(v6, "getPairSyncStateWithRequestDetails:completionHandler:", v5, v11);

  if (v13[5])
  {
    if (os_log_type_enabled((os_log_t)DNDLogGlobalConfiguration, OS_LOG_TYPE_ERROR))
      -[DNDGlobalConfigurationService getPairSyncStateReturningError:].cold.1();
  }
  else
  {
    v7 = (id)DNDLogGlobalConfiguration;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v19[3]);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v24 = v5;
      v25 = 2114;
      v26 = v8;
      _os_log_impl(&dword_19ABEB000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Got pair sync state=%{public}@", buf, 0x16u);

    }
  }
  v9 = v19[3];
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(&v18, 8);
  os_activity_scope_leave(&state);

  return v9;
}

void __64__DNDGlobalConfigurationService_getPairSyncStateReturningError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;

  v5 = a3;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(a2, "unsignedIntegerValue");
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

- (BOOL)setPairSyncPreferenceEnabled:(BOOL)a3 error:(id *)a4
{
  _BOOL8 v4;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  BOOL v12;
  _QWORD v14[6];
  _QWORD v15[5];
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v4 = a3;
  v26 = *MEMORY[0x1E0C80C00];
  v6 = _os_activity_create(&dword_19ABEB000, "com.apple.donotdisturb.DNDModeConfigurationService.setPairSyncPreferenceEnabled", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  +[DNDRequestDetails detailsRepresentingNowWithClientIdentifier:](DNDRequestDetails, "detailsRepresentingNowWithClientIdentifier:", self->_clientIdentifier);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x3032000000;
  v15[3] = __Block_byref_object_copy__8;
  v15[4] = __Block_byref_object_dispose__8;
  v16 = 0;
  +[DNDRemoteServiceConnection sharedInstance](DNDRemoteServiceConnection, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __68__DNDGlobalConfigurationService_setPairSyncPreferenceEnabled_error___block_invoke;
  v14[3] = &unk_1E39B5610;
  v14[4] = &v17;
  v14[5] = v15;
  objc_msgSend(v8, "setPairSyncPreferenceEnabled:withRequestDetails:completionHandler:", v9, v7, v14);

  if (*((_BYTE *)v18 + 24))
  {
    v10 = (id)DNDLogGlobalConfiguration;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v23 = v7;
      v24 = 2114;
      v25 = v11;
      _os_log_impl(&dword_19ABEB000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] Set pair sync preference enabled=%{public}@", buf, 0x16u);

    }
  }
  else if (os_log_type_enabled((os_log_t)DNDLogGlobalConfiguration, OS_LOG_TYPE_ERROR))
  {
    -[DNDGlobalConfigurationService setPairSyncPreferenceEnabled:error:].cold.1();
  }
  v12 = *((_BYTE *)v18 + 24) != 0;
  _Block_object_dispose(v15, 8);

  _Block_object_dispose(&v17, 8);
  os_activity_scope_leave(&state);

  return v12;
}

void __68__DNDGlobalConfigurationService_setPairSyncPreferenceEnabled_error___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (void)didChangeFocusStatusSharingSettingForApplicationIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  os_activity_scope_state_s state;

  v4 = a3;
  v5 = _os_activity_create(&dword_19ABEB000, "com.apple.donotdisturb.DNDModeConfigurationService.didChangeFocusStatusSharingSettingForApplicationIdentifier", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  +[DNDRequestDetails detailsRepresentingNowWithClientIdentifier:](DNDRequestDetails, "detailsRepresentingNowWithClientIdentifier:", self->_clientIdentifier);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[DNDRemoteServiceConnection sharedInstance](DNDRemoteServiceConnection, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __92__DNDGlobalConfigurationService_didChangeFocusStatusSharingSettingForApplicationIdentifier___block_invoke;
  v10[3] = &unk_1E39B5A88;
  v8 = v6;
  v11 = v8;
  v9 = v4;
  v12 = v9;
  objc_msgSend(v7, "didChangeFocusStatusSharingSettingForApplicationIdentifier:withRequestDetails:completionHandler:", v9, v8, v10);

  os_activity_scope_leave(&state);
}

void __92__DNDGlobalConfigurationService_didChangeFocusStatusSharingSettingForApplicationIdentifier___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  int v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  int v12;
  const __CFString *v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  const __CFString *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = objc_msgSend(v5, "BOOLValue");
  v8 = (void *)DNDLogGlobalConfiguration;
  if (v7)
  {
    if (os_log_type_enabled((os_log_t)DNDLogGlobalConfiguration, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(a1 + 32);
      v10 = *(_QWORD *)(a1 + 40);
      v11 = v8;
      v12 = objc_msgSend(v5, "BOOLValue");
      v13 = CFSTR("N");
      v14 = 138543874;
      v15 = v9;
      v16 = 2114;
      if (v12)
        v13 = CFSTR("Y");
      v17 = v10;
      v18 = 2114;
      v19 = v13;
      _os_log_impl(&dword_19ABEB000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] Signaled change to focus status sharing setting, applicationIdentifier=%{public}@ success=%{public}@", (uint8_t *)&v14, 0x20u);

    }
  }
  else if (os_log_type_enabled((os_log_t)DNDLogGlobalConfiguration, OS_LOG_TYPE_ERROR))
  {
    __92__DNDGlobalConfigurationService_didChangeFocusStatusSharingSettingForApplicationIdentifier___block_invoke_cold_1();
  }

}

- (id)getAccountFeatureSupportWithError:(id *)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  os_activity_scope_state_s state;

  v4 = _os_activity_create(&dword_19ABEB000, "com.apple.donotdisturb.DNDModeConfigurationService.getAccountFeatureSupport", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v4, &state);
  +[DNDRequestDetails detailsRepresentingNowWithClientIdentifier:](DNDRequestDetails, "detailsRepresentingNowWithClientIdentifier:", self->_clientIdentifier);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__8;
  v17 = __Block_byref_object_dispose__8;
  v18 = 0;
  +[DNDRemoteServiceConnection sharedInstance](DNDRemoteServiceConnection, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __67__DNDGlobalConfigurationService_getAccountFeatureSupportWithError___block_invoke;
  v10[3] = &unk_1E39B61D8;
  v12 = &v13;
  v7 = v5;
  v11 = v7;
  objc_msgSend(v6, "getAccountFeatureSupportWithRequestDetails:completionHandler:", v7, v10);

  v8 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  os_activity_scope_leave(&state);
  return v8;
}

void __67__DNDGlobalConfigurationService_getAccountFeatureSupportWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  if (v6)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    v8 = DNDLogGlobalConfiguration;
    if (os_log_type_enabled((os_log_t)DNDLogGlobalConfiguration, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(a1 + 32);
      v10 = 138543618;
      v11 = v9;
      v12 = 2114;
      v13 = v6;
      _os_log_impl(&dword_19ABEB000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Got account feature support=%{public}@", (uint8_t *)&v10, 0x16u);
    }
  }
  else if (os_log_type_enabled((os_log_t)DNDLogGlobalConfiguration, OS_LOG_TYPE_ERROR))
  {
    __67__DNDGlobalConfigurationService_getAccountFeatureSupportWithError___block_invoke_cold_1();
  }

}

- (void)addListener:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *queue;
  id v11;
  id v12;
  NSObject *v13;
  _QWORD v14[4];
  NSObject *v15;
  DNDGlobalConfigurationService *v16;
  id v17;
  id v18;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = _os_activity_create(&dword_19ABEB000, "com.apple.donotdisturb.DNDGlobalConfigurationService.addListener", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  v9 = DNDLogGlobalConfiguration;
  if (os_log_type_enabled((os_log_t)DNDLogGlobalConfiguration, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v21 = v6;
    _os_log_impl(&dword_19ABEB000, v9, OS_LOG_TYPE_DEFAULT, "Adding update listener: listener=%{public}@", buf, 0xCu);
  }
  queue = self->_queue;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __67__DNDGlobalConfigurationService_addListener_withCompletionHandler___block_invoke;
  v14[3] = &unk_1E39B5C68;
  v15 = v8;
  v16 = self;
  v17 = v6;
  v18 = v7;
  v11 = v7;
  v12 = v6;
  v13 = v8;
  dispatch_sync(queue, v14);

  os_activity_scope_leave(&state);
}

void __67__DNDGlobalConfigurationService_addListener_withCompletionHandler___block_invoke(uint64_t a1)
{
  int v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  char v9;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(*(os_activity_t *)(a1 + 32), &state);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "addObject:", *(_QWORD *)(a1 + 48));
  v2 = objc_msgSend(*(id *)(a1 + 40), "_queue_registerForUpdatesIfRequired");
  v3 = DNDLogGlobalConfiguration;
  if (v2)
  {
    if (os_log_type_enabled((os_log_t)DNDLogGlobalConfiguration, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138543362;
      v12 = v4;
      _os_log_impl(&dword_19ABEB000, v3, OS_LOG_TYPE_DEFAULT, "Registered for updates: listener=%{public}@", buf, 0xCu);
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)DNDLogGlobalConfiguration, OS_LOG_TYPE_ERROR))
      __65__DNDModeConfigurationService_addListener_withCompletionHandler___block_invoke_cold_1((uint64_t *)(a1 + 48), v3);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "removeObject:", *(_QWORD *)(a1 + 48));
  }
  v5 = *(void **)(a1 + 56);
  if (v5)
  {
    v6 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 16);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __67__DNDGlobalConfigurationService_addListener_withCompletionHandler___block_invoke_27;
    v7[3] = &unk_1E39B5728;
    v8 = v5;
    v9 = v2;
    dispatch_async(v6, v7);

  }
  os_activity_scope_leave(&state);
}

uint64_t __67__DNDGlobalConfigurationService_addListener_withCompletionHandler___block_invoke_27(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40), 0);
}

- (void)removeListener:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *queue;
  id v8;
  NSObject *v9;
  _QWORD block[4];
  NSObject *v11;
  DNDGlobalConfigurationService *v12;
  id v13;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = _os_activity_create(&dword_19ABEB000, "com.apple.donotdisturb.DNDGlobalConfigurationService.removeListener", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  v6 = DNDLogGlobalConfiguration;
  if (os_log_type_enabled((os_log_t)DNDLogGlobalConfiguration, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v16 = v4;
    _os_log_impl(&dword_19ABEB000, v6, OS_LOG_TYPE_DEFAULT, "Removing update listener: listener=%{public}@", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__DNDGlobalConfigurationService_removeListener___block_invoke;
  block[3] = &unk_1E39B5778;
  v11 = v5;
  v12 = self;
  v13 = v4;
  v8 = v4;
  v9 = v5;
  dispatch_sync(queue, block);

  os_activity_scope_leave(&state);
}

void __48__DNDGlobalConfigurationService_removeListener___block_invoke(uint64_t a1)
{
  os_activity_scope_state_s v2;

  v2.opaque[0] = 0;
  v2.opaque[1] = 0;
  os_activity_scope_enter(*(os_activity_t *)(a1 + 32), &v2);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "removeObject:", *(_QWORD *)(a1 + 48));
  os_activity_scope_leave(&v2);
}

- (void)remoteService:(id)a3 didReceiveUpdatedPairSyncState:(unint64_t)a4
{
  NSObject *queue;
  _QWORD v5[6];

  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __78__DNDGlobalConfigurationService_remoteService_didReceiveUpdatedPairSyncState___block_invoke;
  v5[3] = &unk_1E39B6228;
  v5[4] = self;
  v5[5] = a4;
  dispatch_sync(queue, v5);
}

void __78__DNDGlobalConfigurationService_remoteService_didReceiveUpdatedPairSyncState___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8[2];
  id location;

  v2 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "copy");
  objc_initWeak(&location, *(id *)(a1 + 32));
  v3 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __78__DNDGlobalConfigurationService_remoteService_didReceiveUpdatedPairSyncState___block_invoke_2;
  v6[3] = &unk_1E39B6200;
  objc_copyWeak(v8, &location);
  v4 = *(void **)(a1 + 40);
  v7 = v2;
  v8[1] = v4;
  v5 = v2;
  dispatch_async(v3, v6);

  objc_destroyWeak(v8);
  objc_destroyWeak(&location);
}

void __78__DNDGlobalConfigurationService_remoteService_didReceiveUpdatedPairSyncState___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    v3 = *(id *)(a1 + 32);
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v10;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v10 != v6)
            objc_enumerationMutation(v3);
          v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * v7);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v8, "globalConfigurationService:didReceiveUpdatedPairSyncState:", WeakRetained, *(_QWORD *)(a1 + 48), (_QWORD)v9);
          ++v7;
        }
        while (v5 != v7);
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v5);
    }

  }
}

- (void)remoteService:(id)a3 didReceiveUpdatedPreventAutoReplySetting:(BOOL)a4
{
  NSObject *queue;
  _QWORD v5[5];
  BOOL v6;

  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __88__DNDGlobalConfigurationService_remoteService_didReceiveUpdatedPreventAutoReplySetting___block_invoke;
  v5[3] = &unk_1E39B61B0;
  v5[4] = self;
  v6 = a4;
  dispatch_sync(queue, v5);
}

void __88__DNDGlobalConfigurationService_remoteService_didReceiveUpdatedPreventAutoReplySetting___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;
  char v8;
  id location;

  v2 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "copy");
  objc_initWeak(&location, *(id *)(a1 + 32));
  v3 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __88__DNDGlobalConfigurationService_remoteService_didReceiveUpdatedPreventAutoReplySetting___block_invoke_2;
  v5[3] = &unk_1E39B6188;
  objc_copyWeak(&v7, &location);
  v6 = v2;
  v8 = *(_BYTE *)(a1 + 40);
  v4 = v2;
  dispatch_async(v3, v5);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __88__DNDGlobalConfigurationService_remoteService_didReceiveUpdatedPreventAutoReplySetting___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    v3 = *(id *)(a1 + 32);
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v10;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v10 != v6)
            objc_enumerationMutation(v3);
          v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * v7);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v8, "globalConfigurationService:didReceiveUpdatedPreventAutoReplySetting:", WeakRetained, *(unsigned __int8 *)(a1 + 48), (_QWORD)v9);
          ++v7;
        }
        while (v5 != v7);
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v5);
    }

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
  block[2] = __88__DNDGlobalConfigurationService_remoteService_didReceiveUpdatedPhoneCallBypassSettings___block_invoke;
  block[3] = &unk_1E39B5750;
  block[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_sync(queue, block);

}

void __88__DNDGlobalConfigurationService_remoteService_didReceiveUpdatedPhoneCallBypassSettings___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;
  id location;

  v2 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "copy");
  objc_initWeak(&location, *(id *)(a1 + 32));
  v3 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __88__DNDGlobalConfigurationService_remoteService_didReceiveUpdatedPhoneCallBypassSettings___block_invoke_2;
  v5[3] = &unk_1E39B6250;
  objc_copyWeak(&v8, &location);
  v6 = v2;
  v7 = *(id *)(a1 + 40);
  v4 = v2;
  dispatch_async(v3, v5);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __88__DNDGlobalConfigurationService_remoteService_didReceiveUpdatedPhoneCallBypassSettings___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    v3 = *(id *)(a1 + 32);
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v10;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v10 != v6)
            objc_enumerationMutation(v3);
          v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * v7);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v8, "globalConfigurationService:didReceiveUpdatedPhoneCallBypassSettings:", WeakRetained, *(_QWORD *)(a1 + 40), (_QWORD)v9);
          ++v7;
        }
        while (v5 != v7);
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v5);
    }

  }
}

- (id)getStateDumpReturningError:(id *)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = _os_activity_create(&dword_19ABEB000, "com.apple.donotdisturb.DNDModeConfigurationService.getStateDump", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v4, &state);
  +[DNDRequestDetails detailsRepresentingNowWithClientIdentifier:](DNDRequestDetails, "detailsRepresentingNowWithClientIdentifier:", self->_clientIdentifier);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__8;
  v21 = __Block_byref_object_dispose__8;
  v22 = 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__8;
  v15 = __Block_byref_object_dispose__8;
  v16 = 0;
  +[DNDRemoteServiceConnection sharedInstance](DNDRemoteServiceConnection, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __60__DNDGlobalConfigurationService_getStateDumpReturningError___block_invoke;
  v10[3] = &unk_1E39B6278;
  v10[4] = &v17;
  v10[5] = &v11;
  objc_msgSend(v6, "getStateDumpWithRequestDetails:completionHandler:", v5, v10);

  v7 = DNDLogGlobalConfiguration;
  if (v12[5])
  {
    if (os_log_type_enabled((os_log_t)DNDLogGlobalConfiguration, OS_LOG_TYPE_ERROR))
      -[DNDGlobalConfigurationService getStateDumpReturningError:].cold.1();
  }
  else if (os_log_type_enabled((os_log_t)DNDLogGlobalConfiguration, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v25 = v5;
    _os_log_impl(&dword_19ABEB000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Got state dump", buf, 0xCu);
  }
  v8 = (id)v18[5];
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
  os_activity_scope_leave(&state);

  return v8;
}

void __60__DNDGlobalConfigurationService_getStateDumpReturningError___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (id)_initWithClientIdentifier:(id)a3
{
  id v4;
  DNDGlobalConfigurationService *v5;
  uint64_t v6;
  NSString *clientIdentifier;
  uint64_t v8;
  NSHashTable *listeners;
  NSObject *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *queue;
  NSObject *v13;
  dispatch_queue_t v14;
  OS_dispatch_queue *calloutQueue;
  void *v16;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)DNDGlobalConfigurationService;
  v5 = -[DNDGlobalConfigurationService init](&v18, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    clientIdentifier = v5->_clientIdentifier;
    v5->_clientIdentifier = (NSString *)v6;

    objc_msgSend(MEMORY[0x1E0CB3690], "hashTableWithOptions:", 517);
    v8 = objc_claimAutoreleasedReturnValue();
    listeners = v5->_listeners;
    v5->_listeners = (NSHashTable *)v8;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = dispatch_queue_create("com.apple.donotdisturb.DNDGlobalConfigurationService", v10);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v11;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = dispatch_queue_create("com.apple.donotdisturb.DNDGlobalConfigurationService.callout", v13);
    calloutQueue = v5->_calloutQueue;
    v5->_calloutQueue = (OS_dispatch_queue *)v14;

    +[DNDRemoteServiceConnection sharedInstance](DNDRemoteServiceConnection, "sharedInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addEventListener:", v5);

  }
  return v5;
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
    v3 = _os_activity_create(&dword_19ABEB000, "com.apple.donotdisturb.DNDGlobalConfigurationService.registerForUpdates", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v3, &state);
    +[DNDRequestDetails detailsRepresentingNowWithClientIdentifier:](DNDRequestDetails, "detailsRepresentingNowWithClientIdentifier:", self->_clientIdentifier);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = DNDLogGlobalConfiguration;
    if (os_log_type_enabled((os_log_t)DNDLogGlobalConfiguration, OS_LOG_TYPE_DEFAULT))
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
    v16 = __Block_byref_object_copy__8;
    v17 = __Block_byref_object_dispose__8;
    v18 = 0;
    +[DNDRemoteServiceConnection sharedInstance](DNDRemoteServiceConnection, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __68__DNDGlobalConfigurationService__queue_registerForUpdatesIfRequired__block_invoke;
    v8[3] = &unk_1E39B5610;
    v8[4] = &v9;
    v8[5] = &buf;
    objc_msgSend(v6, "registerForGlobalConfigurationUpdatesWithRequestDetails:completionHandler:", v4, v8);

    if (*(_QWORD *)(*((_QWORD *)&buf + 1) + 40)
      && os_log_type_enabled((os_log_t)DNDLogGlobalConfiguration, OS_LOG_TYPE_ERROR))
    {
      -[DNDGlobalConfigurationService _queue_registerForUpdatesIfRequired].cold.1();
    }
    self->_registeredForUpdates = *((_BYTE *)v10 + 24);
    _Block_object_dispose(&buf, 8);

    _Block_object_dispose(&v9, 8);
    os_activity_scope_leave(&state);

  }
  return !-[NSHashTable count](self->_listeners, "count") || self->_registeredForUpdates;
}

void __68__DNDGlobalConfigurationService__queue_registerForUpdatesIfRequired__block_invoke(uint64_t a1, void *a2, void *a3)
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
  objc_storeStrong((id *)&self->_listeners, 0);
  objc_storeStrong((id *)&self->_calloutQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)getPreventAutoReplyReturningError:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0(&dword_19ABEB000, v0, v1, "[%{public}@] Error when getting prevent-auto-reply state, error='%{public}@'");
  OUTLINED_FUNCTION_1();
}

- (void)setPreventAutoReply:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0(&dword_19ABEB000, v0, v1, "[%{public}@] Error when setting prevent-auto-reply state, error='%{public}@'");
  OUTLINED_FUNCTION_1();
}

- (void)modesCanImpactAvailability
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0(&dword_19ABEB000, v0, v1, "[%{public}@] Error when getting overall availability state, error='%{public}@'");
  OUTLINED_FUNCTION_1();
}

- (void)setModesCanImpactAvailability:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0(&dword_19ABEB000, v0, v1, "[%{public}@] Error when setting modesCanImpactAvailability state, error='%{public}@'");
  OUTLINED_FUNCTION_1();
}

- (void)getPhoneCallBypassSettingsReturningError:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_19ABEB000, a1, a3, "Bypass settings are now per mode configuration", a5, a6, a7, a8, 0);
}

- (void)getCloudSyncStateReturningError:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0(&dword_19ABEB000, v0, v1, "[%{public}@] Error when getting cloud sync state, error='%{public}@'");
  OUTLINED_FUNCTION_1();
}

- (void)setCloudSyncPreferenceEnabled:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0(&dword_19ABEB000, v0, v1, "[%{public}@] Error when setting cloud sync enabled, error='%{public}@'");
  OUTLINED_FUNCTION_1();
}

- (void)getPairSyncStateReturningError:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0(&dword_19ABEB000, v0, v1, "[%{public}@] Error when getting pair sync state, error='%{public}@'");
  OUTLINED_FUNCTION_1();
}

- (void)setPairSyncPreferenceEnabled:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0(&dword_19ABEB000, v0, v1, "[%{public}@] Error when setting pair sync enabled, error='%{public}@'");
  OUTLINED_FUNCTION_1();
}

void __92__DNDGlobalConfigurationService_didChangeFocusStatusSharingSettingForApplicationIdentifier___block_invoke_cold_1()
{
  uint64_t v0;
  __int16 v1;
  uint64_t v2;
  os_log_t v3;
  uint8_t v4[14];
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  v5 = v0;
  v6 = v1;
  v7 = v2;
  _os_log_error_impl(&dword_19ABEB000, v3, OS_LOG_TYPE_ERROR, "[%{public}@] Error when signaling change to focus status sharing setting, applicationIdentifier=%{public}@ error='%{public}@'", v4, 0x20u);
}

void __67__DNDGlobalConfigurationService_getAccountFeatureSupportWithError___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_19ABEB000, v0, v1, "[%{public}@] Error when getting account feature support; error='%{public}@'");
  OUTLINED_FUNCTION_1();
}

- (void)getStateDumpReturningError:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0(&dword_19ABEB000, v0, v1, "[%{public}@] Error when getting state dump, error='%{public}@'");
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
