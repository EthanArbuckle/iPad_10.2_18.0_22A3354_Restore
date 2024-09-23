@implementation DNDAppConfigurationService

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
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
  if (serviceForClientIdentifier__onceToken_1 != -1)
    dispatch_once(&serviceForClientIdentifier__onceToken_1, &__block_literal_global_3);
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__1;
  v17 = __Block_byref_object_dispose__1;
  v18 = 0;
  v5 = serviceForClientIdentifier__lockQueue_1;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__DNDAppConfigurationService_serviceForClientIdentifier___block_invoke_2;
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

void __57__DNDAppConfigurationService_serviceForClientIdentifier___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  objc_msgSend((id)serviceForClientIdentifier__serviceByClientIdentifier_1, "objectForKey:", *(_QWORD *)(a1 + 32));
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

    objc_msgSend((id)serviceForClientIdentifier__serviceByClientIdentifier_1, "setObject:forKey:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(_QWORD *)(a1 + 32));
  }
}

- (id)_initWithClientIdentifier:(id)a3
{
  id v4;
  DNDAppConfigurationService *v5;
  uint64_t v6;
  NSString *clientIdentifier;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DNDAppConfigurationService;
  v5 = -[DNDAppConfigurationService init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    clientIdentifier = v5->_clientIdentifier;
    v5->_clientIdentifier = (NSString *)v6;

  }
  return v5;
}

void __57__DNDAppConfigurationService_serviceForClientIdentifier___block_invoke()
{
  NSObject *v0;
  dispatch_queue_t v1;
  void *v2;
  uint64_t v3;
  void *v4;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = dispatch_queue_create("com.apple.donotdisturb.DNDAppConfigurationService.service.lock", v0);
  v2 = (void *)serviceForClientIdentifier__lockQueue_1;
  serviceForClientIdentifier__lockQueue_1 = (uint64_t)v1;

  objc_msgSend(MEMORY[0x1E0CB3748], "mapTableWithKeyOptions:valueOptions:", 0, 517);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)serviceForClientIdentifier__serviceByClientIdentifier_1;
  serviceForClientIdentifier__serviceByClientIdentifier_1 = v3;

}

- (void)getCurrentAppConfigurationForActionIdentifier:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  v8 = _os_activity_create(&dword_19ABEB000, "com.apple.donotdisturb.DNDAppConfigurationService.getCurrentAppConfigurationForActionIdentifier", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v8, &state);
  +[DNDRequestDetails detailsRepresentingNowWithClientIdentifier:](DNDRequestDetails, "detailsRepresentingNowWithClientIdentifier:", self->_clientIdentifier);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = DNDLogAppConfiguration;
  if (os_log_type_enabled((os_log_t)DNDLogAppConfiguration, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v21 = v9;
    v22 = 2112;
    v23 = v6;
    _os_log_impl(&dword_19ABEB000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] Getting current app configuration for action identifier %@", buf, 0x16u);
  }
  +[DNDRemoteAppConfigurationServiceConnection sharedInstance](DNDRemoteAppConfigurationServiceConnection, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __98__DNDAppConfigurationService_getCurrentAppConfigurationForActionIdentifier_withCompletionHandler___block_invoke;
  v15[3] = &unk_1E39B5A60;
  v16 = v9;
  v17 = v6;
  v18 = v7;
  v12 = v7;
  v13 = v6;
  v14 = v9;
  objc_msgSend(v11, "getCurrentAppConfigurationForActionIdentifier:withRequestDetails:completionHandler:", v13, v14, v15);

  os_activity_scope_leave(&state);
}

void __98__DNDAppConfigurationService_getCurrentAppConfigurationForActionIdentifier_withCompletionHandler___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  __CFString *v8;
  __CFString *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  NSObject *v15;
  uint32_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v6)
  {
    v10 = DNDLogAppConfiguration;
    if (!os_log_type_enabled((os_log_t)DNDLogAppConfiguration, OS_LOG_TYPE_DEFAULT))
      goto LABEL_12;
    v12 = a1[4];
    v13 = a1[5];
    v20 = 138543618;
    v21 = v12;
    v22 = 2112;
    v23 = v13;
    v14 = "[%{public}@] Got current app configuration for action identifier %@";
    v15 = v10;
    v16 = 22;
LABEL_9:
    _os_log_impl(&dword_19ABEB000, v15, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v20, v16);
    goto LABEL_12;
  }
  objc_msgSend(v6, "domain");
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8 != CFSTR("DNDErrorDomain"))
  {

    goto LABEL_10;
  }
  v17 = objc_msgSend(v7, "code");

  if (v17 == 1007)
  {
    v18 = DNDLogAppConfiguration;
    if (!os_log_type_enabled((os_log_t)DNDLogAppConfiguration, OS_LOG_TYPE_DEFAULT))
      goto LABEL_12;
    v19 = a1[4];
    v20 = 138543362;
    v21 = v19;
    v14 = "[%{public}@] No current app configuration action.";
    v15 = v18;
    v16 = 12;
    goto LABEL_9;
  }
LABEL_10:
  if (os_log_type_enabled((os_log_t)DNDLogAppConfiguration, OS_LOG_TYPE_ERROR))
    __98__DNDAppConfigurationService_getCurrentAppConfigurationForActionIdentifier_withCompletionHandler___block_invoke_cold_1();
LABEL_12:
  (*(void (**)(_QWORD, id, void *, uint64_t))(a1[6] + 16))(a1[6], v5, v7, v11);

}

void __98__DNDAppConfigurationService_getCurrentAppConfigurationForActionIdentifier_withCompletionHandler___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_0(&dword_19ABEB000, v0, v1, "[%{public}@] Error when getting current app configuration for action identifier %@, error='%{public}@'");
}

- (void)invalidateAppContextForActionIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  v5 = _os_activity_create(&dword_19ABEB000, "com.apple.donotdisturb.DNDAppConfigurationService.invalidateAppContextForActionIdentifier", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v5, &state);
  +[DNDRequestDetails detailsRepresentingNowWithClientIdentifier:](DNDRequestDetails, "detailsRepresentingNowWithClientIdentifier:", self->_clientIdentifier);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = DNDLogAppConfiguration;
  if (os_log_type_enabled((os_log_t)DNDLogAppConfiguration, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v16 = v6;
    v17 = 2112;
    v18 = v4;
    _os_log_impl(&dword_19ABEB000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Invalidating app context for action identifier %@", buf, 0x16u);
  }
  +[DNDRemoteAppConfigurationServiceConnection sharedInstance](DNDRemoteAppConfigurationServiceConnection, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __70__DNDAppConfigurationService_invalidateAppContextForActionIdentifier___block_invoke;
  v11[3] = &unk_1E39B5A88;
  v12 = v6;
  v13 = v4;
  v9 = v4;
  v10 = v6;
  objc_msgSend(v8, "invalidateAppContextForActionIdentifier:withRequestDetails:completionHandler:", v9, v10, v11);

  os_activity_scope_leave(&state);
}

void __70__DNDAppConfigurationService_invalidateAppContextForActionIdentifier___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  char v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = objc_msgSend(a2, "BOOLValue");
  v7 = DNDLogAppConfiguration;
  if ((v6 & 1) != 0)
  {
    if (os_log_type_enabled((os_log_t)DNDLogAppConfiguration, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v9 = *(_QWORD *)(a1 + 40);
      v10 = 138543618;
      v11 = v8;
      v12 = 2112;
      v13 = v9;
      _os_log_impl(&dword_19ABEB000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Invalidated app context for actionIdentifier %@", (uint8_t *)&v10, 0x16u);
    }
  }
  else if (os_log_type_enabled((os_log_t)DNDLogAppConfiguration, OS_LOG_TYPE_ERROR))
  {
    __70__DNDAppConfigurationService_invalidateAppContextForActionIdentifier___block_invoke_cold_1();
  }

}

void __70__DNDAppConfigurationService_invalidateAppContextForActionIdentifier___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_0(&dword_19ABEB000, v0, v1, "[%{public}@] Error when getting invalidating app context for actionIdentifier %@, error='%{public}@'");
}

@end
