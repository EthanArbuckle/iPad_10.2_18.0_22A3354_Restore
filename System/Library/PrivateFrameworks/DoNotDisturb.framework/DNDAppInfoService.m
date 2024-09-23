@implementation DNDAppInfoService

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
  if (serviceForClientIdentifier__onceToken_9 != -1)
    dispatch_once(&serviceForClientIdentifier__onceToken_9, &__block_literal_global_14);
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__9;
  v17 = __Block_byref_object_dispose__9;
  v18 = 0;
  v5 = serviceForClientIdentifier__lockQueue_8;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__DNDAppInfoService_serviceForClientIdentifier___block_invoke_2;
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

void __48__DNDAppInfoService_serviceForClientIdentifier___block_invoke()
{
  NSObject *v0;
  dispatch_queue_t v1;
  void *v2;
  uint64_t v3;
  void *v4;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = dispatch_queue_create("com.apple.donotdisturb.DNDAppInfoService.service.lock", v0);
  v2 = (void *)serviceForClientIdentifier__lockQueue_8;
  serviceForClientIdentifier__lockQueue_8 = (uint64_t)v1;

  objc_msgSend(MEMORY[0x1E0CB3748], "mapTableWithKeyOptions:valueOptions:", 0, 517);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)serviceForClientIdentifier__serviceByClientIdentifier_9;
  serviceForClientIdentifier__serviceByClientIdentifier_9 = v3;

}

void __48__DNDAppInfoService_serviceForClientIdentifier___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  objc_msgSend((id)serviceForClientIdentifier__serviceByClientIdentifier_9, "objectForKey:", *(_QWORD *)(a1 + 32));
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

    objc_msgSend((id)serviceForClientIdentifier__serviceByClientIdentifier_9, "setObject:forKey:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(_QWORD *)(a1 + 32));
  }
}

- (id)getAppInfoForBundleIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
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
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = _os_activity_create(&dword_19ABEB000, "com.apple.donotdisturb.DNDAppInfoService.getAppInfoForBundleIdentifier", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  +[DNDRequestDetails detailsRepresentingNowWithClientIdentifier:](DNDRequestDetails, "detailsRepresentingNowWithClientIdentifier:", self->_clientIdentifier);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__9;
  v26 = __Block_byref_object_dispose__9;
  v27 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__9;
  v20 = __Block_byref_object_dispose__9;
  v21 = 0;
  +[DNDRemoteServiceConnection sharedInstance](DNDRemoteServiceConnection, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __57__DNDAppInfoService_getAppInfoForBundleIdentifier_error___block_invoke;
  v15[3] = &unk_1E39B62A0;
  v15[4] = &v22;
  v15[5] = &v16;
  objc_msgSend(v9, "getAppInfoForBundleIdentifier:withRequestDetails:completionHandler:", v6, v8, v15);

  v10 = DNDLogGlobalConfiguration;
  if (v17[5])
  {
    if (os_log_type_enabled((os_log_t)DNDLogGlobalConfiguration, OS_LOG_TYPE_ERROR))
      -[DNDAppInfoService getAppInfoForBundleIdentifier:error:].cold.1();
  }
  else if (os_log_type_enabled((os_log_t)DNDLogGlobalConfiguration, OS_LOG_TYPE_DEFAULT))
  {
    v11 = v23[5];
    *(_DWORD *)buf = 138543619;
    v30 = v8;
    v31 = 2113;
    v32 = v11;
    _os_log_impl(&dword_19ABEB000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] App info is %{private}@", buf, 0x16u);
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

void __57__DNDAppInfoService_getAppInfoForBundleIdentifier_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;

  v16 = a2;
  v6 = a3;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "dnd_doNotDisturbLocalizationBundle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "displayName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", v8, &stru_1E39B74A8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v9, "length"))
    {
      v10 = (void *)objc_msgSend(v16, "mutableCopy");
      objc_msgSend(v10, "setDisplayName:", v9);
      v11 = objc_msgSend(v10, "copy");
      v12 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v13 = *(void **)(v12 + 40);
      *(_QWORD *)(v12 + 40) = v11;

    }
  }
  v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v15 = *(void **)(v14 + 40);
  *(_QWORD *)(v14 + 40) = v6;

}

- (id)getAppInfoForBundleIdentifiers:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
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
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = _os_activity_create(&dword_19ABEB000, "com.apple.donotdisturb.DNDAppInfoService.getAppInfoForBundleIdentifiers", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  +[DNDRequestDetails detailsRepresentingNowWithClientIdentifier:](DNDRequestDetails, "detailsRepresentingNowWithClientIdentifier:", self->_clientIdentifier);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__9;
  v27 = __Block_byref_object_dispose__9;
  v28 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__9;
  v21 = __Block_byref_object_dispose__9;
  v22 = 0;
  +[DNDRemoteServiceConnection sharedInstance](DNDRemoteServiceConnection, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allObjects");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __58__DNDAppInfoService_getAppInfoForBundleIdentifiers_error___block_invoke;
  v16[3] = &unk_1E39B5B28;
  v16[4] = &v23;
  v16[5] = &v17;
  objc_msgSend(v9, "getAppInfoForBundleIdentifiers:withRequestDetails:completionHandler:", v10, v8, v16);

  v11 = DNDLogGlobalConfiguration;
  if (v18[5])
  {
    if (os_log_type_enabled((os_log_t)DNDLogGlobalConfiguration, OS_LOG_TYPE_ERROR))
      -[DNDAppInfoService getAppInfoForBundleIdentifier:error:].cold.1();
  }
  else if (os_log_type_enabled((os_log_t)DNDLogGlobalConfiguration, OS_LOG_TYPE_DEFAULT))
  {
    v12 = v24[5];
    *(_DWORD *)buf = 138543619;
    v31 = v8;
    v32 = 2113;
    v33 = v12;
    _os_log_impl(&dword_19ABEB000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] App info is %{private}@", buf, 0x16u);
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

void __58__DNDAppInfoService_getAppInfoForBundleIdentifiers_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  uint64_t v23;
  void *v24;
  id v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v25 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v28;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v28 != v9)
          objc_enumerationMutation(v6);
        v11 = *(id *)(*((_QWORD *)&v27 + 1) + 8 * v10);
        objc_msgSend(MEMORY[0x1E0CB34D0], "dnd_doNotDisturbLocalizationBundle");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "displayName");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "localizedStringForKey:value:table:", v13, &stru_1E39B74A8, 0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        v15 = v11;
        if (objc_msgSend(v14, "length"))
        {
          v16 = (void *)objc_msgSend(v11, "mutableCopy");
          objc_msgSend(v16, "setDisplayName:", v14);
          v15 = (void *)objc_msgSend(v16, "copy");

        }
        objc_msgSend(v11, "applicationIdentifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "bundleID");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v15, v18);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v8);
  }
  v19 = v6;

  v20 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v21 = *(void **)(v20 + 40);
  *(_QWORD *)(v20 + 40) = v5;
  v22 = v5;

  v23 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v24 = *(void **)(v23 + 40);
  *(_QWORD *)(v23 + 40) = v25;

}

- (id)_initWithClientIdentifier:(id)a3
{
  id v4;
  DNDAppInfoService *v5;
  uint64_t v6;
  NSString *clientIdentifier;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *queue;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)DNDAppInfoService;
  v5 = -[DNDAppInfoService init](&v12, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    clientIdentifier = v5->_clientIdentifier;
    v5->_clientIdentifier = (NSString *)v6;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = dispatch_queue_create("com.apple.donotdisturb.DNDAppInfoService", v8);
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

- (void)getAppInfoForBundleIdentifier:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0(&dword_19ABEB000, v0, v1, "[%{public}@] Error when getting app info, error='%{public}@'");
}

@end
