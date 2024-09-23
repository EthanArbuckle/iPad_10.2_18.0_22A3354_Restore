@implementation DMFPolicyMonitor

void __33__DMFPolicyMonitor_policyMonitor__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)policyMonitor_policyMonitor;
  policyMonitor_policyMonitor = v0;

}

- (DMFPolicyMonitor)init
{
  void *v3;
  DMFPolicyMonitor *v4;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.dmd.policy"), 4096);
  v4 = -[DMFPolicyMonitor initWithXPCConnection:](self, "initWithXPCConnection:", v3);

  return v4;
}

void __35__DMFPolicyMonitor_remoteInterface__block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF1DDBB0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)remoteInterface_remoteInterface_0;
  remoteInterface_remoteInterface_0 = v0;

  v2 = (void *)MEMORY[0x1E0C99E60];
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v5, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3, v5, v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)remoteInterface_remoteInterface_0, "setClasses:forSelector:argumentIndex:ofReply:", v4, sel_addRegistration_replyHandler_, 0, 1);
  objc_msgSend((id)remoteInterface_remoteInterface_0, "setClasses:forSelector:argumentIndex:ofReply:", v4, sel_requestPoliciesForTypes_replyHandler_, 0, 1);

}

- (DMFPolicyMonitor)initWithXPCConnection:(id)a3
{
  id v5;
  DMFPolicyMonitor *v6;
  uint64_t v7;
  NSMutableDictionary *notificationTokensByPolicyMonitorIdentifier;
  uint64_t v9;
  NSMutableArray *pendingRequests;
  NSObject *v11;
  NSObject *v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *firstUnlockQueue;
  NSObject *v15;
  NSObject *v16;
  dispatch_queue_t v17;
  OS_dispatch_queue *registrationCallbackQueue;
  const char *v19;
  NSObject *v20;
  DMFPolicyMonitor *v21;
  NSObject *v22;
  void *v23;
  _QWORD v25[4];
  DMFPolicyMonitor *v26;
  int out_token;
  objc_super v28;

  v5 = a3;
  v28.receiver = self;
  v28.super_class = (Class)DMFPolicyMonitor;
  v6 = -[DMFPolicyMonitor init](&v28, sel_init);
  if (v6)
  {
    v7 = objc_opt_new();
    notificationTokensByPolicyMonitorIdentifier = v6->_notificationTokensByPolicyMonitorIdentifier;
    v6->_notificationTokensByPolicyMonitorIdentifier = (NSMutableDictionary *)v7;

    v9 = objc_opt_new();
    pendingRequests = v6->_pendingRequests;
    v6->_pendingRequests = (NSMutableArray *)v9;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v11, QOS_CLASS_UTILITY, 0);
    v12 = objc_claimAutoreleasedReturnValue();

    v13 = dispatch_queue_create("com.apple.dmf.policy.first-unlock", v12);
    firstUnlockQueue = v6->_firstUnlockQueue;
    v6->_firstUnlockQueue = (OS_dispatch_queue *)v13;

    dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x1E0C80D50], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v15 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v15, QOS_CLASS_UTILITY, 0);
    v16 = objc_claimAutoreleasedReturnValue();

    v17 = dispatch_queue_create("com.apple.dmf.policy.registration-callback", v16);
    registrationCallbackQueue = v6->_registrationCallbackQueue;
    v6->_registrationCallbackQueue = (OS_dispatch_queue *)v17;

    v19 = +[DMFPolicyMonitor mobileKeyBagFirstUnlockNotificationName](DMFPolicyMonitor, "mobileKeyBagFirstUnlockNotificationName");
    if (!+[DMFPolicyMonitor hasFirstUnlocked](DMFPolicyMonitor, "hasFirstUnlocked") && v19)
    {
      out_token = 0;
      v20 = v6->_firstUnlockQueue;
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __42__DMFPolicyMonitor_initWithXPCConnection___block_invoke;
      v25[3] = &unk_1E6ED8860;
      v21 = v6;
      v26 = v21;
      if (notify_register_dispatch(v19, &out_token, v20, v25))
      {
        DMFPolicyLog();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
          -[DMFPolicyMonitor initWithXPCConnection:].cold.1(v22);

      }
      else
      {
        v21->_firstUnlockToken = out_token;
      }

    }
    objc_storeStrong((id *)&v6->_xpcConnection, a3);
    objc_msgSend((id)objc_opt_class(), "remoteInterface");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v6->_xpcConnection, "setRemoteObjectInterface:", v23);

    -[NSXPCConnection resume](v6->_xpcConnection, "resume");
  }

  return v6;
}

void __37__DMFPolicyMonitor__dispatchRequest___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  if (+[DMFPolicyMonitor hasFirstUnlocked](DMFPolicyMonitor, "hasFirstUnlocked"))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "pendingRequests");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    v2 = (void *)MEMORY[0x1BCCB7F34](*(_QWORD *)(a1 + 40));
    objc_msgSend(v3, "addObject:", v2);

  }
}

+ (BOOL)hasFirstUnlocked
{
  return MKBUserUnlockedSinceBoot() != 0;
}

- (void)addRegistration:(id)a3 forPolicyMonitorIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  _QWORD v28[5];
  id v29;
  id v30;
  id v31;
  id v32;
  _QWORD v33[4];
  id v34;
  id v35;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[DMFPolicyMonitor xpcConnection](self, "xpcConnection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __81__DMFPolicyMonitor_addRegistration_forPolicyMonitorIdentifier_completionHandler___block_invoke;
  v33[3] = &unk_1E6ED88A8;
  v14 = v11;
  v34 = v14;
  v15 = v10;
  v35 = v15;
  objc_msgSend(v12, "remoteObjectProxyWithErrorHandler:", v33);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v28[0] = v13;
  v28[1] = 3221225472;
  v28[2] = __81__DMFPolicyMonitor_addRegistration_forPolicyMonitorIdentifier_completionHandler___block_invoke_97;
  v28[3] = &unk_1E6ED88F8;
  v28[4] = self;
  v29 = v14;
  v32 = v15;
  v17 = v8;
  v30 = v17;
  v31 = v9;
  v18 = v9;
  v19 = v15;
  v20 = v14;
  v24[0] = v13;
  v24[1] = 3221225472;
  v24[2] = __81__DMFPolicyMonitor_addRegistration_forPolicyMonitorIdentifier_completionHandler___block_invoke_101;
  v24[3] = &unk_1E6ED8920;
  v25 = v16;
  v26 = v17;
  v27 = (id)MEMORY[0x1BCCB7F34](v28);
  v21 = v27;
  v22 = v17;
  v23 = v16;
  -[DMFPolicyMonitor _dispatchRequest:](self, "_dispatchRequest:", v24);

}

- (void)requestPoliciesForTypes:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  _QWORD v22[5];
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;

  v6 = a3;
  v7 = a4;
  -[DMFPolicyMonitor xpcConnection](self, "xpcConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __62__DMFPolicyMonitor_requestPoliciesForTypes_completionHandler___block_invoke;
  v25[3] = &unk_1E6ED88A8;
  v10 = v6;
  v26 = v10;
  v11 = v7;
  v27 = v11;
  objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", v25);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v22[0] = v9;
  v22[1] = 3221225472;
  v22[2] = __62__DMFPolicyMonitor_requestPoliciesForTypes_completionHandler___block_invoke_102;
  v22[3] = &unk_1E6ED8948;
  v22[4] = self;
  v13 = v10;
  v23 = v13;
  v24 = v11;
  v14 = v11;
  v18[0] = v9;
  v18[1] = 3221225472;
  v18[2] = __62__DMFPolicyMonitor_requestPoliciesForTypes_completionHandler___block_invoke_105;
  v18[3] = &unk_1E6ED8920;
  v19 = v12;
  v20 = v13;
  v21 = (id)MEMORY[0x1BCCB7F34](v22);
  v15 = v21;
  v16 = v13;
  v17 = v12;
  -[DMFPolicyMonitor _dispatchRequest:](self, "_dispatchRequest:", v18);

}

- (NSXPCConnection)xpcConnection
{
  return self->_xpcConnection;
}

- (void)_dispatchRequest:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[DMFPolicyMonitor firstUnlockQueue](self, "firstUnlockQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __37__DMFPolicyMonitor__dispatchRequest___block_invoke;
  v7[3] = &unk_1E6ED89C0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (OS_dispatch_queue)firstUnlockQueue
{
  return self->_firstUnlockQueue;
}

+ (id)policyMonitor
{
  if (policyMonitor_onceToken != -1)
    dispatch_once(&policyMonitor_onceToken, &__block_literal_global_15);
  return (id)policyMonitor_policyMonitor;
}

- (NSMutableDictionary)notificationTokensByPolicyMonitorIdentifier
{
  return self->_notificationTokensByPolicyMonitorIdentifier;
}

- (OS_dispatch_queue)registrationCallbackQueue
{
  return self->_registrationCallbackQueue;
}

+ (id)remoteInterface
{
  if (remoteInterface_onceToken_0 != -1)
    dispatch_once(&remoteInterface_onceToken_0, &__block_literal_global_41);
  return (id)remoteInterface_remoteInterface_0;
}

+ (const)mobileKeyBagFirstUnlockNotificationName
{
  return "com.apple.mobile.keybagd.first_unlock";
}

- (id)requestPoliciesForTypes:(id)a3 withError:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  id v16;
  _QWORD v18[4];
  NSObject *v19;
  uint64_t *v20;
  uint64_t *v21;
  _QWORD v22[4];
  NSObject *v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint64_t v31;
  _QWORD v32[4];
  id v33;

  v6 = a3;
  v31 = 0;
  v32[0] = &v31;
  v32[1] = 0x3032000000;
  v32[2] = __Block_byref_object_copy__2;
  v32[3] = __Block_byref_object_dispose__2;
  v33 = 0;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__2;
  v29 = __Block_byref_object_dispose__2;
  v30 = 0;
  if (+[DMFPolicyMonitor hasFirstUnlocked](DMFPolicyMonitor, "hasFirstUnlocked"))
  {
    -[DMFPolicyMonitor xpcConnection](self, "xpcConnection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = MEMORY[0x1E0C809B0];
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __54__DMFPolicyMonitor_requestPoliciesForTypes_withError___block_invoke;
    v22[3] = &unk_1E6ED8970;
    v9 = v6;
    v23 = v9;
    v24 = &v31;
    objc_msgSend(v7, "synchronousRemoteObjectProxyWithErrorHandler:", v22);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v18[0] = v8;
    v18[1] = 3221225472;
    v18[2] = __54__DMFPolicyMonitor_requestPoliciesForTypes_withError___block_invoke_106;
    v18[3] = &unk_1E6ED8998;
    v11 = v9;
    v19 = v11;
    v20 = &v31;
    v21 = &v25;
    v12 = (void *)MEMORY[0x1BCCB7F34](v18);
    objc_msgSend(v10, "requestPoliciesForTypes:replyHandler:", v11, v12);

    v13 = v23;
  }
  else
  {
    DMFErrorWithCodeAndUserInfo();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = *(void **)(v32[0] + 40);
    *(_QWORD *)(v32[0] + 40) = v14;

    DMFPolicyLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[DMFPolicyMonitor requestPoliciesForTypes:withError:].cold.1((uint64_t)v6, (uint64_t)v32, v13);
  }

  if (a4)
    *a4 = objc_retainAutorelease(*(id *)(v32[0] + 40));
  v16 = (id)v26[5];
  _Block_object_dispose(&v25, 8);

  _Block_object_dispose(&v31, 8);
  return v16;
}

void __42__DMFPolicyMonitor_initWithXPCConnection___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  _BOOL4 v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint8_t buf[8];
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "pendingRequests");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  DMFPolicyLog();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B8C0C000, v4, OS_LOG_TYPE_DEFAULT, "Policy monitor detected first-unlock with pending requests", buf, 2u);
    }

    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    objc_msgSend(*(id *)(a1 + 32), "pendingRequests", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v12;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v12 != v9)
            objc_enumerationMutation(v6);
          (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10++) + 16))();
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
      }
      while (v8);
    }

    objc_msgSend(*(id *)(a1 + 32), "pendingRequests");
    v4 = objc_claimAutoreleasedReturnValue();
    -[NSObject removeAllObjects](v4, "removeAllObjects");
  }
  else if (v5)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B8C0C000, v4, OS_LOG_TYPE_DEFAULT, "Policy monitor dectected first-unlock without pending requests", buf, 2u);
  }

}

- (void)dealloc
{
  objc_super v3;

  if (notify_is_valid_token(self->_firstUnlockToken))
    notify_cancel(self->_firstUnlockToken);
  -[NSXPCConnection invalidate](self->_xpcConnection, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)DMFPolicyMonitor;
  -[DMFPolicyMonitor dealloc](&v3, sel_dealloc);
}

void __81__DMFPolicyMonitor_addRegistration_forPolicyMonitorIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  DMFPolicyLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __81__DMFPolicyMonitor_addRegistration_forPolicyMonitorIdentifier_completionHandler___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

void __81__DMFPolicyMonitor_addRegistration_forPolicyMonitorIdentifier_completionHandler___block_invoke_97(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  const char *v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD handler[4];
  id v21;
  id v22;
  int out_token;
  uint8_t buf[4];
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    out_token = 0;
    v7 = (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "UTF8String");
    objc_msgSend(*(id *)(a1 + 32), "registrationCallbackQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __81__DMFPolicyMonitor_addRegistration_forPolicyMonitorIdentifier_completionHandler___block_invoke_98;
    handler[3] = &unk_1E6ED88D0;
    v21 = *(id *)(a1 + 40);
    v22 = *(id *)(a1 + 48);
    LODWORD(v7) = notify_register_dispatch(v7, &out_token, v8, handler);

    if ((_DWORD)v7)
    {
      DMFPolicyLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        __81__DMFPolicyMonitor_addRegistration_forPolicyMonitorIdentifier_completionHandler___block_invoke_97_cold_2();

      v10 = *(_QWORD *)(a1 + 64);
      if (v10)
      {
        DMFErrorWithCodeAndUserInfo();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, _QWORD, void *))(v10 + 16))(v10, 0, v11);

      }
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "notificationTokensByPolicyMonitorIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_sync_enter(v14);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", out_token);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "notificationTokensByPolicyMonitorIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setObject:forKeyedSubscript:", v15, *(_QWORD *)(a1 + 56));

      objc_sync_exit(v14);
      DMFPolicyLog();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v18 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138543362;
        v25 = v18;
        _os_log_impl(&dword_1B8C0C000, v17, OS_LOG_TYPE_DEFAULT, "Successfully added registration with identifier %{public}@", buf, 0xCu);
      }

      v19 = *(_QWORD *)(a1 + 64);
      if (v19)
        (*(void (**)(uint64_t, id, _QWORD))(v19 + 16))(v19, v5, 0);
    }

  }
  else
  {
    DMFPolicyLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      __81__DMFPolicyMonitor_addRegistration_forPolicyMonitorIdentifier_completionHandler___block_invoke_97_cold_1();

    v13 = *(_QWORD *)(a1 + 64);
    if (v13)
      (*(void (**)(uint64_t, _QWORD, id))(v13 + 16))(v13, 0, v6);
  }

}

void __81__DMFPolicyMonitor_addRegistration_forPolicyMonitorIdentifier_completionHandler___block_invoke_98(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void (**v5)(void);
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  DMFPolicyLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v6 = 138543362;
    v7 = v3;
    _os_log_impl(&dword_1B8C0C000, v2, OS_LOG_TYPE_DEFAULT, "Received policy changed notification for registration %{public}@", (uint8_t *)&v6, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 40), "callback");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 40), "callback");
    v5 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v5[2]();

  }
}

uint64_t __81__DMFPolicyMonitor_addRegistration_forPolicyMonitorIdentifier_completionHandler___block_invoke_101(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addRegistration:replyHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)invalidatePolicyMonitor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[DMFPolicyMonitor notificationTokensByPolicyMonitorIdentifier](self, "notificationTokensByPolicyMonitorIdentifier");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v4);
  objc_msgSend(v4, "objectForKeyedSubscript:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    notify_cancel(objc_msgSend(v5, "intValue"));
    objc_msgSend(v4, "removeObjectForKey:", v7);
  }

  objc_sync_exit(v4);
}

void __62__DMFPolicyMonitor_requestPoliciesForTypes_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  DMFPolicyLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __62__DMFPolicyMonitor_requestPoliciesForTypes_completionHandler___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);

}

void __62__DMFPolicyMonitor_requestPoliciesForTypes_completionHandler___block_invoke_102(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void (*v12)(void);
  uint64_t v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  DMFPolicyLog();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v5, "allKeys");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "componentsJoinedByString:", CFSTR(","));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543362;
      v15 = v10;
      _os_log_impl(&dword_1B8C0C000, v8, OS_LOG_TYPE_DEFAULT, "Successfully requested policy for types %{public}@", (uint8_t *)&v14, 0xCu);

    }
    v11 = *(_QWORD *)(a1 + 48);
    if (v11)
    {
      v12 = *(void (**)(void))(v11 + 16);
LABEL_10:
      v12();
    }
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __62__DMFPolicyMonitor_requestPoliciesForTypes_completionHandler___block_invoke_102_cold_1();

    v13 = *(_QWORD *)(a1 + 48);
    if (v13)
    {
      v12 = *(void (**)(void))(v13 + 16);
      goto LABEL_10;
    }
  }

}

uint64_t __62__DMFPolicyMonitor_requestPoliciesForTypes_completionHandler___block_invoke_105(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "requestPoliciesForTypes:replyHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __54__DMFPolicyMonitor_requestPoliciesForTypes_withError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  DMFPolicyLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __62__DMFPolicyMonitor_requestPoliciesForTypes_completionHandler___block_invoke_cold_1();

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __54__DMFPolicyMonitor_requestPoliciesForTypes_withError___block_invoke_106(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void **v11;
  void *v12;
  id v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  DMFPolicyLog();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v5, "allKeys");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "componentsJoinedByString:", CFSTR(","));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543362;
      v16 = v10;
      _os_log_impl(&dword_1B8C0C000, v8, OS_LOG_TYPE_DEFAULT, "Successfully requested policy for types %{public}@", (uint8_t *)&v15, 0xCu);

    }
    v11 = (void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    v12 = v5;
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __62__DMFPolicyMonitor_requestPoliciesForTypes_completionHandler___block_invoke_cold_1();

    v11 = (void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v12 = v6;
  }
  v13 = v12;
  v14 = *v11;
  *v11 = v13;

}

- (int)firstUnlockToken
{
  return self->_firstUnlockToken;
}

- (NSMutableArray)pendingRequests
{
  return self->_pendingRequests;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingRequests, 0);
  objc_storeStrong((id *)&self->_notificationTokensByPolicyMonitorIdentifier, 0);
  objc_storeStrong((id *)&self->_registrationCallbackQueue, 0);
  objc_storeStrong((id *)&self->_firstUnlockQueue, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
}

- (void)initWithXPCConnection:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1B8C0C000, log, OS_LOG_TYPE_FAULT, "Policy monitor failed to register for first-unlock notifications", v1, 2u);
}

void __81__DMFPolicyMonitor_addRegistration_forPolicyMonitorIdentifier_completionHandler___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_1(&dword_1B8C0C000, v0, v1, "Failed to add registration %{public}@ with error: %{public}@");
  OUTLINED_FUNCTION_1_2();
}

void __81__DMFPolicyMonitor_addRegistration_forPolicyMonitorIdentifier_completionHandler___block_invoke_97_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_1(&dword_1B8C0C000, v0, v1, "Failed to add registration %{public}@ with error: %{public}@");
  OUTLINED_FUNCTION_1_2();
}

void __81__DMFPolicyMonitor_addRegistration_forPolicyMonitorIdentifier_completionHandler___block_invoke_97_cold_2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_1(&dword_1B8C0C000, v0, v1, "Failed to add registration %{public}@ with error: %{public}@");
  OUTLINED_FUNCTION_1_2();
}

void __62__DMFPolicyMonitor_requestPoliciesForTypes_completionHandler___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_1(&dword_1B8C0C000, v0, v1, "Failed to request policy for types %{public}@ with error: %{public}@");
  OUTLINED_FUNCTION_1_2();
}

void __62__DMFPolicyMonitor_requestPoliciesForTypes_completionHandler___block_invoke_102_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_1(&dword_1B8C0C000, v0, v1, "Failed to request policy for types %{public}@ with error: %{public}@");
  OUTLINED_FUNCTION_1_2();
}

- (void)requestPoliciesForTypes:(NSObject *)a3 withError:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138543618;
  *(_QWORD *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2114;
  *(_QWORD *)&v3[14] = *(_QWORD *)(*(_QWORD *)a2 + 40);
  OUTLINED_FUNCTION_0_1(&dword_1B8C0C000, a2, a3, "Failed to request policy for types %{public}@ with error: %{public}@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  OUTLINED_FUNCTION_1_2();
}

@end
