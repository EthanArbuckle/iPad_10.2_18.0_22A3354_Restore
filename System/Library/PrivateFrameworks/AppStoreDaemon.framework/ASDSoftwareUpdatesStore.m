@implementation ASDSoftwareUpdatesStore

void __57__ASDSoftwareUpdatesStore_getUpdatesWithCompletionBlock___block_invoke(uint64_t a1)
{
  uint64_t v2;
  ASDDispatchQueue *v3;
  _BOOL4 v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  ASDDispatchQueue *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[5];
  _QWORD v20[5];
  uint8_t buf[16];

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
  ASDLogHandleForCategory(12);
  v3 = (ASDDispatchQueue *)objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(&v3->super, OS_LOG_TYPE_DEBUG);
  v5 = MEMORY[0x1E0C809B0];
  if (v2)
  {
    if (v4)
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_19A03B000, &v3->super, OS_LOG_TYPE_DEBUG, "(SoftwareUpdateStore) Joining request: getUpdatesWithCompletionBlock", buf, 2u);
    }
  }
  else
  {
    if (v4)
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_19A03B000, &v3->super, OS_LOG_TYPE_DEBUG, "(SoftwareUpdateStore) Starting request: getUpdatesWithCompletionBlock", buf, 2u);
    }

    +[ASDSyncTaskScheduler sharedInstance]();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v5;
    v20[1] = 3221225472;
    v20[2] = __57__ASDSoftwareUpdatesStore_getUpdatesWithCompletionBlock___block_invoke_25;
    v20[3] = &unk_1E37BF6C8;
    v20[4] = *(_QWORD *)(a1 + 32);
    +[ASDPromise onScheduler:usingBlock:](ASDPromise, "onScheduler:usingBlock:", v6, v20);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

    v3 = -[ASDDispatchQueue initWithQueue:]([ASDDispatchQueue alloc], "initWithQueue:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(void **)(v10 + 40);
    v19[0] = v5;
    v19[1] = 3221225472;
    v19[2] = __57__ASDSoftwareUpdatesStore_getUpdatesWithCompletionBlock___block_invoke_5;
    v19[3] = &unk_1E37BF6F0;
    v19[4] = v10;
    objc_msgSend(v11, "alwaysPerform:onScheduler:", v19, v3);
  }

  v12 = -[ASDDispatchQueue initWithQueue:]([ASDDispatchQueue alloc], "initWithQueue:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
  v13 = *(void **)(a1 + 40);
  v14 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  v17[0] = v5;
  v17[1] = 3221225472;
  v17[2] = __57__ASDSoftwareUpdatesStore_getUpdatesWithCompletionBlock___block_invoke_28;
  v17[3] = &unk_1E37BEF18;
  v18 = v13;
  v15[0] = v5;
  v15[1] = 3221225472;
  v15[2] = __57__ASDSoftwareUpdatesStore_getUpdatesWithCompletionBlock___block_invoke_30;
  v15[3] = &unk_1E37BDB60;
  v16 = *(id *)(a1 + 40);
  objc_msgSend(v14, "thenPerform:orCatchError:onScheduler:", v17, v15, v12);

}

void __57__ASDSoftwareUpdatesStore_getUpdatesWithCompletionBlock___block_invoke_28(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  ASDLogHandleForCategory(12);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = 134217984;
    v6 = objc_msgSend(v3, "count");
    _os_log_debug_impl(&dword_19A03B000, v4, OS_LOG_TYPE_DEBUG, "(SoftwareUpdateStore) Dispatching %lu results: getUpdatesWithCompletionBlock", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_call:(id)a3 run:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  objc_super v11;

  if (self->_hasUpdatesEntitlement)
  {
    v11.receiver = self;
    v11.super_class = (Class)ASDSoftwareUpdatesStore;
    v8 = a5;
    -[ASDBaseClient _call:run:error:](&v11, sel__call_run_error_, a3, a4, v8);

  }
  else
  {
    v9 = a5;
    ASDErrorWithUnderlyingErrorAndInfo(0, CFSTR("ASDErrorDomain"), 505, 0, 0, 0);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, id))a5 + 2))(v9, v10);

  }
}

void __57__ASDSoftwareUpdatesStore_getUpdatesWithCompletionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  _QWORD v4[4];
  id v5;
  id v6;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __57__ASDSoftwareUpdatesStore_getUpdatesWithCompletionBlock___block_invoke_3;
  v4[3] = &unk_1E37BF678;
  v5 = *(id *)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  objc_msgSend(a2, "getUpdatesWithCompletionBlock:", v4);

}

uint64_t __57__ASDSoftwareUpdatesStore_getUpdatesWithCompletionBlock___block_invoke_3(uint64_t a1, uint64_t a2)
{
  if (a2)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (ASDSoftwareUpdatesStore)init
{
  ASDSoftwareUpdatesStore *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *accessQueue;
  dispatch_queue_t v5;
  OS_dispatch_queue *calloutQueue;
  BOOL v7;
  NSObject *v8;
  uint64_t v9;
  NSXPCConnection *connection;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t handler;
  uint64_t v38;
  void (*v39)(uint64_t);
  void *v40;
  id v41;
  id location;
  objc_super v43;

  v43.receiver = self;
  v43.super_class = (Class)ASDSoftwareUpdatesStore;
  v2 = -[ASDSoftwareUpdatesStore init](&v43, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.appstoredaemonframework.ASDSoftwareUpdatesStore.access", 0);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v3;

    v5 = dispatch_queue_create("com.apple.appstoredaemonframework.ASDSoftwareUpdatesStore.callout", 0);
    calloutQueue = v2->_calloutQueue;
    v2->_calloutQueue = (OS_dispatch_queue *)v5;

    if (-[ASDBaseClient _clientHasEntitlement:]((uint64_t)v2, CFSTR("com.apple.appstored.xpc.updates")))
    {
      v2->_hasUpdatesEntitlement = 1;
    }
    else
    {
      v7 = -[ASDBaseClient _clientHasEntitlement:]((uint64_t)v2, CFSTR("com.apple.appstored.update-apps"));
      v2->_hasUpdatesEntitlement = v7;
      if (!v7)
        return v2;
    }
    objc_initWeak(&location, v2);
    v2->_storeChangedNotificationToken = -1;
    dispatch_get_global_queue(21, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    handler = MEMORY[0x1E0C809B0];
    v38 = 3221225472;
    v39 = __31__ASDSoftwareUpdatesStore_init__block_invoke;
    v40 = &unk_1E37BE5E0;
    objc_copyWeak(&v41, &location);
    notify_register_dispatch("com.apple.appstored.updatesstorechanged", &v2->_storeChangedNotificationToken, v8, &handler);

    if (-[ASDBaseClient _clientHasEntitlement:]((uint64_t)v2, CFSTR("com.apple.appstored.xpc.updates"))
      || -[ASDBaseClient _clientHasEntitlement:]((uint64_t)v2, CFSTR("com.apple.appstored.update-apps")))
    {
      v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.appstored.xpc.updates"), 0);
      connection = v2->_connection;
      v2->_connection = (NSXPCConnection *)v9;

      objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE392610);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)MEMORY[0x1E0C99E60];
      v13 = objc_opt_class();
      objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0, handler, v38, v39, v40);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setClasses:forSelector:argumentIndex:ofReply:", v14, sel_getUpdatesWithCompletionBlock_, 0, 1);

      v15 = (void *)MEMORY[0x1E0C99E60];
      v16 = objc_opt_class();
      objc_msgSend(v15, "setWithObjects:", v16, objc_opt_class(), 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setClasses:forSelector:argumentIndex:ofReply:", v17, sel_getUpdatesIncludingMetricsWithCompletionBlock_, 0, 1);

      v18 = (void *)MEMORY[0x1E0C99E60];
      v19 = objc_opt_class();
      objc_msgSend(v18, "setWithObjects:", v19, objc_opt_class(), 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setClasses:forSelector:argumentIndex:ofReply:", v20, sel_getManagedUpdatesWithCompletionBlock_, 0, 1);

      v21 = (void *)MEMORY[0x1E0C99E60];
      v22 = objc_opt_class();
      objc_msgSend(v21, "setWithObjects:", v22, objc_opt_class(), 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setClasses:forSelector:argumentIndex:ofReply:", v23, sel_reloadFromServerWithCompletionBlock_, 0, 1);

      v24 = (void *)MEMORY[0x1E0C99E60];
      v25 = objc_opt_class();
      objc_msgSend(v24, "setWithObjects:", v25, objc_opt_class(), 0);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setClasses:forSelector:argumentIndex:ofReply:", v26, sel_reloadManagedUpdatesWithCompletionBlock_, 0, 1);

      v27 = (void *)MEMORY[0x1E0C99E60];
      v28 = objc_opt_class();
      objc_msgSend(v27, "setWithObjects:", v28, objc_opt_class(), 0);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setClasses:forSelector:argumentIndex:ofReply:", v29, sel_reloadFromServerInBackgroundWithCompletionBlock_, 0, 1);

      v30 = (void *)MEMORY[0x1E0C99E60];
      v31 = objc_opt_class();
      objc_msgSend(v30, "setWithObjects:", v31, objc_opt_class(), 0);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setClasses:forSelector:argumentIndex:ofReply:", v32, sel_updateAllWithJobResults_, 1, 1);

      v33 = (void *)MEMORY[0x1E0C99E60];
      v34 = objc_opt_class();
      objc_msgSend(v33, "setWithObjects:", v34, objc_opt_class(), 0);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setClasses:forSelector:argumentIndex:ofReply:", v35, sel_updateAllWithOrder_completionBlock_, 1, 1);

      -[NSXPCConnection setRemoteObjectInterface:](v2->_connection, "setRemoteObjectInterface:", v11);
      -[NSXPCConnection setInvalidationHandler:](v2->_connection, "setInvalidationHandler:", &__block_literal_global_129);
      -[NSXPCConnection setInterruptionHandler:](v2->_connection, "setInterruptionHandler:", &__block_literal_global_131);
      -[NSXPCConnection _setQueue:](v2->_connection, "_setQueue:", v2->_accessQueue);
      -[NSXPCConnection resume](v2->_connection, "resume");

    }
    objc_destroyWeak(&v41);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __57__ASDSoftwareUpdatesStore_getUpdatesWithCompletionBlock___block_invoke_5(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint8_t v5[16];

  ASDLogHandleForCategory(12);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v5 = 0;
    _os_log_debug_impl(&dword_19A03B000, v2, OS_LOG_TYPE_DEBUG, "(SoftwareUpdateStore) Completing request: getUpdatesWithCompletionBlock", v5, 2u);
  }

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = 0;

}

- (void)getUpdatesWithCompletionBlock:(id)a3
{
  id v4;
  NSObject *accessQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  if (!v4)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("nil block"));
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __57__ASDSoftwareUpdatesStore_getUpdatesWithCompletionBlock___block_invoke;
  v7[3] = &unk_1E37BE278;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(accessQueue, v7);

}

void __31__ASDSoftwareUpdatesStore_init__block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "postNotificationName:object:", CFSTR("ASDSoftwareUpdatesStoreDidChangeNotification"), WeakRetained);

}

- (void)dealloc
{
  int storeChangedNotificationToken;
  objc_super v4;

  storeChangedNotificationToken = self->_storeChangedNotificationToken;
  if (storeChangedNotificationToken != -1)
    notify_cancel(storeChangedNotificationToken);
  v4.receiver = self;
  v4.super_class = (Class)ASDSoftwareUpdatesStore;
  -[ASDSoftwareUpdatesStore dealloc](&v4, sel_dealloc);
}

+ (id)registerBadgeCountNotificationBlock:(id)a3
{
  id v3;
  ASDSoftwareUpdatesStore *v4;
  SEL v5;

  v3 = a3;
  v4 = (ASDSoftwareUpdatesStore *)NSUnimplemented_();
  return (id)-[ASDSoftwareUpdatesStore autoUpdateEnabled](v4, v5);
}

- (BOOL)autoUpdateEnabled
{
  ASDSoftwareUpdatesStore *v2;
  SEL v3;

  v2 = (ASDSoftwareUpdatesStore *)NSUnimplemented_();
  return -[ASDSoftwareUpdatesStore confirmAgentRequestedUpdateAll](v2, v3);
}

- (BOOL)confirmAgentRequestedUpdateAll
{
  ASDSoftwareUpdatesStore *v2;
  SEL v3;
  id v4;
  BOOL result;

  v2 = (ASDSoftwareUpdatesStore *)NSUnimplemented_();
  -[ASDSoftwareUpdatesStore clearExpiredUpdateHistoryWithCompletionBlock:](v2, v3, v4);
  return result;
}

- (void)clearExpiredUpdateHistoryWithCompletionBlock:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  NSObject *accessQueue;
  id v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  ASDLogHandleForCategory(12);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v12 = (id)objc_opt_class();
    v6 = v12;
    _os_log_impl(&dword_19A03B000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@]: clearExpiredUpdateHistoryWithCompletionBlock", buf, 0xCu);

  }
  accessQueue = self->_accessQueue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __72__ASDSoftwareUpdatesStore_clearExpiredUpdateHistoryWithCompletionBlock___block_invoke;
  v9[3] = &unk_1E37BE278;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  dispatch_async(accessQueue, v9);

}

void __72__ASDSoftwareUpdatesStore_clearExpiredUpdateHistoryWithCompletionBlock___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  _QWORD v11[5];
  id v12;

  v3 = *(_QWORD **)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v4 = v3[2];
  v11[2] = __72__ASDSoftwareUpdatesStore_clearExpiredUpdateHistoryWithCompletionBlock___block_invoke_2;
  v11[3] = &unk_1E37BF650;
  v5 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v6 = v2;
  v7 = *(void **)(a1 + 40);
  v11[4] = *(_QWORD *)(a1 + 32);
  v12 = v6;
  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __72__ASDSoftwareUpdatesStore_clearExpiredUpdateHistoryWithCompletionBlock___block_invoke_5;
  v9[3] = &unk_1E37BE250;
  v8 = v7;
  v9[4] = *(_QWORD *)(a1 + 32);
  v10 = v8;
  objc_msgSend(v3, "_call:run:error:", v4, v11, v9);

}

void __72__ASDSoftwareUpdatesStore_clearExpiredUpdateHistoryWithCompletionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v4;
  _QWORD v5[5];
  id v6;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __72__ASDSoftwareUpdatesStore_clearExpiredUpdateHistoryWithCompletionBlock___block_invoke_3;
  v5[3] = &unk_1E37BE200;
  v4 = *(id *)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v4;
  objc_msgSend(a2, "clearExpiredUpdateHistoryWithCompletionBlock:", v5);

}

void __72__ASDSoftwareUpdatesStore_clearExpiredUpdateHistoryWithCompletionBlock___block_invoke_3(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  _QWORD block[4];
  id v9;
  id v10;
  char v11;

  v5 = a3;
  v6 = *(void **)(a1 + 40);
  if (v6)
  {
    v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __72__ASDSoftwareUpdatesStore_clearExpiredUpdateHistoryWithCompletionBlock___block_invoke_4;
    block[3] = &unk_1E37BDF60;
    v10 = v6;
    v11 = a2;
    v9 = v5;
    dispatch_async(v7, block);

  }
}

uint64_t __72__ASDSoftwareUpdatesStore_clearExpiredUpdateHistoryWithCompletionBlock___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

void __72__ASDSoftwareUpdatesStore_clearExpiredUpdateHistoryWithCompletionBlock___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  if (v4)
  {
    v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __72__ASDSoftwareUpdatesStore_clearExpiredUpdateHistoryWithCompletionBlock___block_invoke_6;
    v6[3] = &unk_1E37BDCC0;
    v8 = v4;
    v7 = v3;
    dispatch_async(v5, v6);

  }
}

uint64_t __72__ASDSoftwareUpdatesStore_clearExpiredUpdateHistoryWithCompletionBlock___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

- (void)getManagedUpdatesWithCompletionBlock:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  NSObject *accessQueue;
  id v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("nil block"));
  ASDLogHandleForCategory(12);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v12 = (id)objc_opt_class();
    v6 = v12;
    _os_log_impl(&dword_19A03B000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@]: getManagedUpdatesWithCompletionBlock", buf, 0xCu);

  }
  accessQueue = self->_accessQueue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __64__ASDSoftwareUpdatesStore_getManagedUpdatesWithCompletionBlock___block_invoke;
  v9[3] = &unk_1E37BE278;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  dispatch_async(accessQueue, v9);

}

void __64__ASDSoftwareUpdatesStore_getManagedUpdatesWithCompletionBlock___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[5];
  id v8;
  _QWORD v9[5];
  id v10;

  v3 = *(_QWORD **)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v4 = v3[2];
  v9[2] = __64__ASDSoftwareUpdatesStore_getManagedUpdatesWithCompletionBlock___block_invoke_2;
  v9[3] = &unk_1E37BF650;
  v5 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[4] = v3;
  v10 = v2;
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = __64__ASDSoftwareUpdatesStore_getManagedUpdatesWithCompletionBlock___block_invoke_5;
  v7[3] = &unk_1E37BDEE8;
  v6 = *(void **)(a1 + 40);
  v7[4] = *(_QWORD *)(a1 + 32);
  v8 = v6;
  objc_msgSend(v3, "_call:run:error:", v4, v9, v7);

}

void __64__ASDSoftwareUpdatesStore_getManagedUpdatesWithCompletionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  _QWORD v4[5];
  id v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __64__ASDSoftwareUpdatesStore_getManagedUpdatesWithCompletionBlock___block_invoke_3;
  v4[3] = &unk_1E37BDD10;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  objc_msgSend(a2, "getManagedUpdatesWithCompletionBlock:", v4);

}

void __64__ASDSoftwareUpdatesStore_getManagedUpdatesWithCompletionBlock___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __64__ASDSoftwareUpdatesStore_getManagedUpdatesWithCompletionBlock___block_invoke_4;
  v7[3] = &unk_1E37BDCC0;
  v8 = v3;
  v9 = v4;
  v6 = v3;
  dispatch_async(v5, v7);

}

uint64_t __64__ASDSoftwareUpdatesStore_getManagedUpdatesWithCompletionBlock___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __64__ASDSoftwareUpdatesStore_getManagedUpdatesWithCompletionBlock___block_invoke_5(uint64_t a1)
{
  void *v1;
  NSObject *v2;
  _QWORD block[4];
  id v4;

  v1 = *(void **)(a1 + 40);
  v2 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__ASDSoftwareUpdatesStore_getManagedUpdatesWithCompletionBlock___block_invoke_6;
  block[3] = &unk_1E37BF108;
  v4 = v1;
  dispatch_async(v2, block);

}

uint64_t __64__ASDSoftwareUpdatesStore_getManagedUpdatesWithCompletionBlock___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)getMetricsWithCompletionBlock:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  NSObject *accessQueue;
  id v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  ASDLogHandleForCategory(12);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v12 = (id)objc_opt_class();
    v6 = v12;
    _os_log_impl(&dword_19A03B000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@]: getMetricsWithCompletionBlock", buf, 0xCu);

  }
  accessQueue = self->_accessQueue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __57__ASDSoftwareUpdatesStore_getMetricsWithCompletionBlock___block_invoke;
  v9[3] = &unk_1E37BE278;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  dispatch_async(accessQueue, v9);

}

void __57__ASDSoftwareUpdatesStore_getMetricsWithCompletionBlock___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[5];
  id v8;
  _QWORD v9[5];
  id v10;

  v3 = *(_QWORD **)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v4 = v3[2];
  v9[2] = __57__ASDSoftwareUpdatesStore_getMetricsWithCompletionBlock___block_invoke_2;
  v9[3] = &unk_1E37BF650;
  v5 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[4] = v3;
  v10 = v2;
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = __57__ASDSoftwareUpdatesStore_getMetricsWithCompletionBlock___block_invoke_5;
  v7[3] = &unk_1E37BDEE8;
  v6 = *(void **)(a1 + 40);
  v7[4] = *(_QWORD *)(a1 + 32);
  v8 = v6;
  objc_msgSend(v3, "_call:run:error:", v4, v9, v7);

}

void __57__ASDSoftwareUpdatesStore_getMetricsWithCompletionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  _QWORD v4[5];
  id v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __57__ASDSoftwareUpdatesStore_getMetricsWithCompletionBlock___block_invoke_3;
  v4[3] = &unk_1E37BF2B0;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  objc_msgSend(a2, "getUpdatesMetricsWithCompletionBlock:", v4);

}

void __57__ASDSoftwareUpdatesStore_getMetricsWithCompletionBlock___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __57__ASDSoftwareUpdatesStore_getMetricsWithCompletionBlock___block_invoke_4;
  v7[3] = &unk_1E37BDCC0;
  v8 = v3;
  v9 = v4;
  v6 = v3;
  dispatch_async(v5, v7);

}

uint64_t __57__ASDSoftwareUpdatesStore_getMetricsWithCompletionBlock___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __57__ASDSoftwareUpdatesStore_getMetricsWithCompletionBlock___block_invoke_5(uint64_t a1)
{
  void *v1;
  NSObject *v2;
  _QWORD block[4];
  id v4;

  v1 = *(void **)(a1 + 40);
  v2 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__ASDSoftwareUpdatesStore_getMetricsWithCompletionBlock___block_invoke_6;
  block[3] = &unk_1E37BF108;
  v4 = v1;
  dispatch_async(v2, block);

}

uint64_t __57__ASDSoftwareUpdatesStore_getMetricsWithCompletionBlock___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __57__ASDSoftwareUpdatesStore_getUpdatesWithCompletionBlock___block_invoke_25(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD **)(a1 + 32);
  v8 = v7[2];
  v9 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __57__ASDSoftwareUpdatesStore_getUpdatesWithCompletionBlock___block_invoke_2;
  v14[3] = &unk_1E37BF6A0;
  v15 = v5;
  v16 = v6;
  v12[0] = v9;
  v12[1] = 3221225472;
  v12[2] = __57__ASDSoftwareUpdatesStore_getUpdatesWithCompletionBlock___block_invoke_4;
  v12[3] = &unk_1E37BDB60;
  v13 = v16;
  v10 = v16;
  v11 = v5;
  objc_msgSend(v7, "_call:run:error:", v8, v14, v12);

}

uint64_t __57__ASDSoftwareUpdatesStore_getUpdatesWithCompletionBlock___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __57__ASDSoftwareUpdatesStore_getUpdatesWithCompletionBlock___block_invoke_30(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  ASDLogHandleForCategory(12);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v4 = 0;
    _os_log_debug_impl(&dword_19A03B000, v2, OS_LOG_TYPE_DEBUG, "(SoftwareUpdateStore) Dispatching error: getUpdatesWithCompletionBlock", v4, 2u);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)getUpdatesIncludingMetricsWithCompletionBlock:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  NSObject *accessQueue;
  id v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("nil block"));
  ASDLogHandleForCategory(12);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v12 = (id)objc_opt_class();
    v6 = v12;
    _os_log_impl(&dword_19A03B000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@]: getUpdatesIncludingMetricsWithCompletionBlock", buf, 0xCu);

  }
  accessQueue = self->_accessQueue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __73__ASDSoftwareUpdatesStore_getUpdatesIncludingMetricsWithCompletionBlock___block_invoke;
  v9[3] = &unk_1E37BE278;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  dispatch_async(accessQueue, v9);

}

void __73__ASDSoftwareUpdatesStore_getUpdatesIncludingMetricsWithCompletionBlock___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[5];
  id v8;
  _QWORD v9[5];
  id v10;

  v3 = *(_QWORD **)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v4 = v3[2];
  v9[2] = __73__ASDSoftwareUpdatesStore_getUpdatesIncludingMetricsWithCompletionBlock___block_invoke_2;
  v9[3] = &unk_1E37BF650;
  v5 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[4] = v3;
  v10 = v2;
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = __73__ASDSoftwareUpdatesStore_getUpdatesIncludingMetricsWithCompletionBlock___block_invoke_5;
  v7[3] = &unk_1E37BDEE8;
  v6 = *(void **)(a1 + 40);
  v7[4] = *(_QWORD *)(a1 + 32);
  v8 = v6;
  objc_msgSend(v3, "_call:run:error:", v4, v9, v7);

}

void __73__ASDSoftwareUpdatesStore_getUpdatesIncludingMetricsWithCompletionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  _QWORD v4[5];
  id v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __73__ASDSoftwareUpdatesStore_getUpdatesIncludingMetricsWithCompletionBlock___block_invoke_3;
  v4[3] = &unk_1E37BDD10;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  objc_msgSend(a2, "getUpdatesIncludingMetricsWithCompletionBlock:", v4);

}

void __73__ASDSoftwareUpdatesStore_getUpdatesIncludingMetricsWithCompletionBlock___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __73__ASDSoftwareUpdatesStore_getUpdatesIncludingMetricsWithCompletionBlock___block_invoke_4;
  v7[3] = &unk_1E37BDCC0;
  v8 = v3;
  v9 = v4;
  v6 = v3;
  dispatch_async(v5, v7);

}

uint64_t __73__ASDSoftwareUpdatesStore_getUpdatesIncludingMetricsWithCompletionBlock___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __73__ASDSoftwareUpdatesStore_getUpdatesIncludingMetricsWithCompletionBlock___block_invoke_5(uint64_t a1)
{
  void *v1;
  NSObject *v2;
  _QWORD block[4];
  id v4;

  v1 = *(void **)(a1 + 40);
  v2 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__ASDSoftwareUpdatesStore_getUpdatesIncludingMetricsWithCompletionBlock___block_invoke_6;
  block[3] = &unk_1E37BF108;
  v4 = v1;
  dispatch_async(v2, block);

}

uint64_t __73__ASDSoftwareUpdatesStore_getUpdatesIncludingMetricsWithCompletionBlock___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)hasEntitlement
{
  return self->_hasUpdatesEntitlement;
}

- (void)hideApplicationBadgeForPendingUpdates
{
  NSObject *v3;
  id v4;
  NSObject *accessQueue;
  _QWORD block[5];
  uint8_t buf[4];
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  ASDLogHandleForCategory(12);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v8 = (id)objc_opt_class();
    v4 = v8;
    _os_log_impl(&dword_19A03B000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@]: hideApplicationBadgeForPendingUpdates", buf, 0xCu);

  }
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__ASDSoftwareUpdatesStore_hideApplicationBadgeForPendingUpdates__block_invoke;
  block[3] = &unk_1E37BDD60;
  block[4] = self;
  dispatch_async(accessQueue, block);
}

uint64_t __64__ASDSoftwareUpdatesStore_hideApplicationBadgeForPendingUpdates__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_call:run:error:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16), &__block_literal_global_21, &__block_literal_global_31);
}

uint64_t __64__ASDSoftwareUpdatesStore_hideApplicationBadgeForPendingUpdates__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hideApplicationBadgeForPendingUpdates");
}

- (void)refreshUpdateCountWithCompletionBlock:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  NSObject *accessQueue;
  id v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("nil block"));
  ASDLogHandleForCategory(12);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v12 = (id)objc_opt_class();
    v6 = v12;
    _os_log_impl(&dword_19A03B000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@]: refreshUpdateCountWithCompletionBlock", buf, 0xCu);

  }
  accessQueue = self->_accessQueue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __65__ASDSoftwareUpdatesStore_refreshUpdateCountWithCompletionBlock___block_invoke;
  v9[3] = &unk_1E37BE278;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  dispatch_async(accessQueue, v9);

}

void __65__ASDSoftwareUpdatesStore_refreshUpdateCountWithCompletionBlock___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[5];
  id v8;
  _QWORD v9[5];
  id v10;

  v3 = *(_QWORD **)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v4 = v3[2];
  v9[2] = __65__ASDSoftwareUpdatesStore_refreshUpdateCountWithCompletionBlock___block_invoke_2;
  v9[3] = &unk_1E37BF650;
  v5 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[4] = v3;
  v10 = v2;
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = __65__ASDSoftwareUpdatesStore_refreshUpdateCountWithCompletionBlock___block_invoke_5;
  v7[3] = &unk_1E37BDEE8;
  v6 = *(void **)(a1 + 40);
  v7[4] = *(_QWORD *)(a1 + 32);
  v8 = v6;
  objc_msgSend(v3, "_call:run:error:", v4, v9, v7);

}

void __65__ASDSoftwareUpdatesStore_refreshUpdateCountWithCompletionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  _QWORD v4[5];
  id v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __65__ASDSoftwareUpdatesStore_refreshUpdateCountWithCompletionBlock___block_invoke_3;
  v4[3] = &unk_1E37BF1A8;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  objc_msgSend(a2, "refreshUpdateCountWithCompletionBlock:", v4);

}

void __65__ASDSoftwareUpdatesStore_refreshUpdateCountWithCompletionBlock___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  uint64_t v12;

  v5 = a3;
  v6 = *(void **)(a1 + 40);
  v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__ASDSoftwareUpdatesStore_refreshUpdateCountWithCompletionBlock___block_invoke_4;
  block[3] = &unk_1E37BE9A8;
  v11 = v6;
  v12 = a2;
  v10 = v5;
  v8 = v5;
  dispatch_async(v7, block);

}

uint64_t __65__ASDSoftwareUpdatesStore_refreshUpdateCountWithCompletionBlock___block_invoke_4(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[5] + 16))(a1[5], a1[6], a1[4]);
}

void __65__ASDSoftwareUpdatesStore_refreshUpdateCountWithCompletionBlock___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __65__ASDSoftwareUpdatesStore_refreshUpdateCountWithCompletionBlock___block_invoke_6;
  v7[3] = &unk_1E37BDCC0;
  v8 = v3;
  v9 = v4;
  v6 = v3;
  dispatch_async(v5, v7);

}

uint64_t __65__ASDSoftwareUpdatesStore_refreshUpdateCountWithCompletionBlock___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

- (void)refreshUpdatesWithCompletionBlock:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  NSObject *accessQueue;
  id v11;
  id v12;
  _QWORD block[5];
  id v14;
  id v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  ASDLogHandleForCategory(12);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v17 = (id)objc_opt_class();
    v9 = v17;
    _os_log_impl(&dword_19A03B000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@]: refreshUpdatesWithCompletionBlock", buf, 0xCu);

  }
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77__ASDSoftwareUpdatesStore_refreshUpdatesWithCompletionBlock_completionBlock___block_invoke;
  block[3] = &unk_1E37BE3D8;
  block[4] = self;
  v14 = v6;
  v15 = v7;
  v11 = v7;
  v12 = v6;
  dispatch_async(accessQueue, block);

}

void __77__ASDSoftwareUpdatesStore_refreshUpdatesWithCompletionBlock_completionBlock___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  id v13;

  v3 = *(_QWORD **)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v4 = v3[2];
  v10[2] = __77__ASDSoftwareUpdatesStore_refreshUpdatesWithCompletionBlock_completionBlock___block_invoke_2;
  v10[3] = &unk_1E37BF758;
  v5 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v11 = v2;
  v6 = *(id *)(a1 + 48);
  v12 = *(_QWORD *)(a1 + 32);
  v13 = v6;
  v8[0] = v5;
  v8[1] = 3221225472;
  v8[2] = __77__ASDSoftwareUpdatesStore_refreshUpdatesWithCompletionBlock_completionBlock___block_invoke_5;
  v8[3] = &unk_1E37BE250;
  v7 = *(id *)(a1 + 48);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v7;
  objc_msgSend(v3, "_call:run:error:", v4, v10, v8);

}

void __77__ASDSoftwareUpdatesStore_refreshUpdatesWithCompletionBlock_completionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = *(_QWORD *)(a1 + 32);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __77__ASDSoftwareUpdatesStore_refreshUpdatesWithCompletionBlock_completionBlock___block_invoke_3;
  v6[3] = &unk_1E37BE200;
  v5 = *(id *)(a1 + 48);
  v6[4] = *(_QWORD *)(a1 + 40);
  v7 = v5;
  objc_msgSend(a2, "refreshUpdatesWithCompletionBlock:completionBlock:", v4, v6);

}

void __77__ASDSoftwareUpdatesStore_refreshUpdatesWithCompletionBlock_completionBlock___block_invoke_3(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  _QWORD block[4];
  id v9;
  id v10;
  char v11;

  v5 = a3;
  v6 = *(void **)(a1 + 40);
  if (v6)
  {
    v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __77__ASDSoftwareUpdatesStore_refreshUpdatesWithCompletionBlock_completionBlock___block_invoke_4;
    block[3] = &unk_1E37BDF60;
    v10 = v6;
    v11 = a2;
    v9 = v5;
    dispatch_async(v7, block);

  }
}

uint64_t __77__ASDSoftwareUpdatesStore_refreshUpdatesWithCompletionBlock_completionBlock___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

void __77__ASDSoftwareUpdatesStore_refreshUpdatesWithCompletionBlock_completionBlock___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  if (v4)
  {
    v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __77__ASDSoftwareUpdatesStore_refreshUpdatesWithCompletionBlock_completionBlock___block_invoke_6;
    v6[3] = &unk_1E37BDCC0;
    v8 = v4;
    v7 = v3;
    dispatch_async(v5, v6);

  }
}

uint64_t __77__ASDSoftwareUpdatesStore_refreshUpdatesWithCompletionBlock_completionBlock___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

- (void)reloadFromServerInBackgroundWithCompletionBlock:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  NSObject *accessQueue;
  id v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("nil block"));
  ASDLogHandleForCategory(12);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v12 = (id)objc_opt_class();
    v6 = v12;
    _os_log_impl(&dword_19A03B000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@]: reloadFromServerInBackgroundWithCompletionBlock", buf, 0xCu);

  }
  accessQueue = self->_accessQueue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __75__ASDSoftwareUpdatesStore_reloadFromServerInBackgroundWithCompletionBlock___block_invoke;
  v9[3] = &unk_1E37BE278;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  dispatch_async(accessQueue, v9);

}

void __75__ASDSoftwareUpdatesStore_reloadFromServerInBackgroundWithCompletionBlock___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[5];
  id v9;

  v3 = *(_QWORD **)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v4 = v3[2];
  v8[2] = __75__ASDSoftwareUpdatesStore_reloadFromServerInBackgroundWithCompletionBlock___block_invoke_2;
  v8[3] = &unk_1E37BF650;
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[4] = v3;
  v9 = v2;
  v6[0] = v5;
  v6[1] = 3221225472;
  v6[2] = __75__ASDSoftwareUpdatesStore_reloadFromServerInBackgroundWithCompletionBlock___block_invoke_5;
  v6[3] = &unk_1E37BDB60;
  v7 = *(id *)(a1 + 40);
  objc_msgSend(v3, "_call:run:error:", v4, v8, v6);

}

void __75__ASDSoftwareUpdatesStore_reloadFromServerInBackgroundWithCompletionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  _QWORD v4[5];
  id v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __75__ASDSoftwareUpdatesStore_reloadFromServerInBackgroundWithCompletionBlock___block_invoke_3;
  v4[3] = &unk_1E37BDD10;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  objc_msgSend(a2, "reloadFromServerInBackgroundWithCompletionBlock:", v4);

}

void __75__ASDSoftwareUpdatesStore_reloadFromServerInBackgroundWithCompletionBlock___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 40);
  v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __75__ASDSoftwareUpdatesStore_reloadFromServerInBackgroundWithCompletionBlock___block_invoke_4;
  block[3] = &unk_1E37BDF10;
  v13 = v5;
  v14 = v7;
  v12 = v6;
  v9 = v5;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __75__ASDSoftwareUpdatesStore_reloadFromServerInBackgroundWithCompletionBlock___block_invoke_4(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = a1[6];
  if (a1[4])
    v3 = 0;
  else
    v3 = a1[5];
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 16))(v2, v3);
}

uint64_t __75__ASDSoftwareUpdatesStore_reloadFromServerInBackgroundWithCompletionBlock___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)reloadFromServerWithCompletionBlock:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  NSObject *accessQueue;
  id v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("nil block"));
  ASDLogHandleForCategory(12);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v12 = (id)objc_opt_class();
    v6 = v12;
    _os_log_impl(&dword_19A03B000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@]: reloadFromServerWithCompletionBlock", buf, 0xCu);

  }
  accessQueue = self->_accessQueue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __63__ASDSoftwareUpdatesStore_reloadFromServerWithCompletionBlock___block_invoke;
  v9[3] = &unk_1E37BE278;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  dispatch_async(accessQueue, v9);

}

void __63__ASDSoftwareUpdatesStore_reloadFromServerWithCompletionBlock___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[5];
  id v8;
  _QWORD v9[5];
  id v10;

  v3 = *(_QWORD **)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v4 = v3[2];
  v9[2] = __63__ASDSoftwareUpdatesStore_reloadFromServerWithCompletionBlock___block_invoke_2;
  v9[3] = &unk_1E37BF650;
  v5 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[4] = v3;
  v10 = v2;
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = __63__ASDSoftwareUpdatesStore_reloadFromServerWithCompletionBlock___block_invoke_5;
  v7[3] = &unk_1E37BDEE8;
  v6 = *(void **)(a1 + 40);
  v7[4] = *(_QWORD *)(a1 + 32);
  v8 = v6;
  objc_msgSend(v3, "_call:run:error:", v4, v9, v7);

}

void __63__ASDSoftwareUpdatesStore_reloadFromServerWithCompletionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  _QWORD v4[5];
  id v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __63__ASDSoftwareUpdatesStore_reloadFromServerWithCompletionBlock___block_invoke_3;
  v4[3] = &unk_1E37BDD10;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  objc_msgSend(a2, "reloadFromServerWithCompletionBlock:", v4);

}

void __63__ASDSoftwareUpdatesStore_reloadFromServerWithCompletionBlock___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 40);
  v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__ASDSoftwareUpdatesStore_reloadFromServerWithCompletionBlock___block_invoke_4;
  block[3] = &unk_1E37BDF10;
  v13 = v5;
  v14 = v7;
  v12 = v6;
  v9 = v5;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __63__ASDSoftwareUpdatesStore_reloadFromServerWithCompletionBlock___block_invoke_4(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = a1[6];
  if (a1[4])
    v3 = 0;
  else
    v3 = a1[5];
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 16))(v2, v3);
}

void __63__ASDSoftwareUpdatesStore_reloadFromServerWithCompletionBlock___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __63__ASDSoftwareUpdatesStore_reloadFromServerWithCompletionBlock___block_invoke_6;
  v7[3] = &unk_1E37BDCC0;
  v8 = v3;
  v9 = v4;
  v6 = v3;
  dispatch_async(v5, v7);

}

uint64_t __63__ASDSoftwareUpdatesStore_reloadFromServerWithCompletionBlock___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

- (void)reloadManagedUpdatesWithCompletionBlock:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  NSObject *accessQueue;
  id v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("nil block"));
  ASDLogHandleForCategory(12);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v12 = (id)objc_opt_class();
    v6 = v12;
    _os_log_impl(&dword_19A03B000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@]: reloadManagedUpdatesWithCompletionBlock", buf, 0xCu);

  }
  accessQueue = self->_accessQueue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __67__ASDSoftwareUpdatesStore_reloadManagedUpdatesWithCompletionBlock___block_invoke;
  v9[3] = &unk_1E37BE278;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  dispatch_async(accessQueue, v9);

}

void __67__ASDSoftwareUpdatesStore_reloadManagedUpdatesWithCompletionBlock___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[5];
  id v8;
  _QWORD v9[5];
  id v10;

  v3 = *(_QWORD **)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v4 = v3[2];
  v9[2] = __67__ASDSoftwareUpdatesStore_reloadManagedUpdatesWithCompletionBlock___block_invoke_2;
  v9[3] = &unk_1E37BF650;
  v5 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[4] = v3;
  v10 = v2;
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = __67__ASDSoftwareUpdatesStore_reloadManagedUpdatesWithCompletionBlock___block_invoke_5;
  v7[3] = &unk_1E37BDEE8;
  v6 = *(void **)(a1 + 40);
  v7[4] = *(_QWORD *)(a1 + 32);
  v8 = v6;
  objc_msgSend(v3, "_call:run:error:", v4, v9, v7);

}

void __67__ASDSoftwareUpdatesStore_reloadManagedUpdatesWithCompletionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  _QWORD v4[5];
  id v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __67__ASDSoftwareUpdatesStore_reloadManagedUpdatesWithCompletionBlock___block_invoke_3;
  v4[3] = &unk_1E37BDD10;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  objc_msgSend(a2, "reloadManagedUpdatesWithCompletionBlock:", v4);

}

void __67__ASDSoftwareUpdatesStore_reloadManagedUpdatesWithCompletionBlock___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 40);
  v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__ASDSoftwareUpdatesStore_reloadManagedUpdatesWithCompletionBlock___block_invoke_4;
  block[3] = &unk_1E37BDF10;
  v13 = v5;
  v14 = v7;
  v12 = v6;
  v9 = v5;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __67__ASDSoftwareUpdatesStore_reloadManagedUpdatesWithCompletionBlock___block_invoke_4(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = a1[6];
  if (a1[4])
    v3 = 0;
  else
    v3 = a1[5];
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 16))(v2, v3);
}

void __67__ASDSoftwareUpdatesStore_reloadManagedUpdatesWithCompletionBlock___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __67__ASDSoftwareUpdatesStore_reloadManagedUpdatesWithCompletionBlock___block_invoke_6;
  v7[3] = &unk_1E37BDCC0;
  v8 = v3;
  v9 = v4;
  v6 = v3;
  dispatch_async(v5, v7);

}

uint64_t __67__ASDSoftwareUpdatesStore_reloadManagedUpdatesWithCompletionBlock___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

- (void)reloadForSettingsFromServerWithCompletionBlock:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  NSObject *accessQueue;
  id v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("nil block"));
  ASDLogHandleForCategory(12);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v12 = (id)objc_opt_class();
    v6 = v12;
    _os_log_impl(&dword_19A03B000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@]: reloadForSettingsFromServerWithCompletionBlock", buf, 0xCu);

  }
  accessQueue = self->_accessQueue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __74__ASDSoftwareUpdatesStore_reloadForSettingsFromServerWithCompletionBlock___block_invoke;
  v9[3] = &unk_1E37BE278;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  dispatch_async(accessQueue, v9);

}

void __74__ASDSoftwareUpdatesStore_reloadForSettingsFromServerWithCompletionBlock___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[5];
  id v9;

  v3 = *(_QWORD **)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v4 = v3[2];
  v8[2] = __74__ASDSoftwareUpdatesStore_reloadForSettingsFromServerWithCompletionBlock___block_invoke_2;
  v8[3] = &unk_1E37BF650;
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[4] = v3;
  v9 = v2;
  v6[0] = v5;
  v6[1] = 3221225472;
  v6[2] = __74__ASDSoftwareUpdatesStore_reloadForSettingsFromServerWithCompletionBlock___block_invoke_5;
  v6[3] = &unk_1E37BDB60;
  v7 = *(id *)(a1 + 40);
  objc_msgSend(v3, "_call:run:error:", v4, v8, v6);

}

void __74__ASDSoftwareUpdatesStore_reloadForSettingsFromServerWithCompletionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  _QWORD v4[5];
  id v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __74__ASDSoftwareUpdatesStore_reloadForSettingsFromServerWithCompletionBlock___block_invoke_3;
  v4[3] = &unk_1E37BDD10;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  objc_msgSend(a2, "reloadFromServerInBackgroundWithCompletionBlock:", v4);

}

void __74__ASDSoftwareUpdatesStore_reloadForSettingsFromServerWithCompletionBlock___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 40);
  v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__ASDSoftwareUpdatesStore_reloadForSettingsFromServerWithCompletionBlock___block_invoke_4;
  block[3] = &unk_1E37BDF10;
  v13 = v5;
  v14 = v7;
  v12 = v6;
  v9 = v5;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __74__ASDSoftwareUpdatesStore_reloadForSettingsFromServerWithCompletionBlock___block_invoke_4(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = a1[6];
  if (a1[4])
    v3 = 0;
  else
    v3 = a1[5];
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 16))(v2, v3);
}

uint64_t __74__ASDSoftwareUpdatesStore_reloadForSettingsFromServerWithCompletionBlock___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)removeUpdateBulletins
{
  NSObject *v3;
  id v4;
  NSObject *accessQueue;
  _QWORD block[5];
  uint8_t buf[4];
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  ASDLogHandleForCategory(12);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v8 = (id)objc_opt_class();
    v4 = v8;
    _os_log_impl(&dword_19A03B000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@]: removeUpdateBulletins", buf, 0xCu);

  }
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__ASDSoftwareUpdatesStore_removeUpdateBulletins__block_invoke;
  block[3] = &unk_1E37BDD60;
  block[4] = self;
  dispatch_async(accessQueue, block);
}

uint64_t __48__ASDSoftwareUpdatesStore_removeUpdateBulletins__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_call:run:error:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16), &__block_literal_global_34, &__block_literal_global_35);
}

uint64_t __48__ASDSoftwareUpdatesStore_removeUpdateBulletins__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "removeUpdateBulletins");
}

- (void)setAutoUpdateEnabled:(BOOL)a3
{
  ASDSoftwareUpdatesStore *v3;
  SEL v4;

  v3 = (ASDSoftwareUpdatesStore *)NSUnimplemented_();
  -[ASDSoftwareUpdatesStore showApplicationBadgeForPendingUpdates](v3, v4);
}

- (void)showApplicationBadgeForPendingUpdates
{
  NSObject *v3;
  id v4;
  NSObject *accessQueue;
  _QWORD block[5];
  uint8_t buf[4];
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  ASDLogHandleForCategory(12);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v8 = (id)objc_opt_class();
    v4 = v8;
    _os_log_impl(&dword_19A03B000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@]: showApplicationBadgeForPendingUpdates", buf, 0xCu);

  }
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__ASDSoftwareUpdatesStore_showApplicationBadgeForPendingUpdates__block_invoke;
  block[3] = &unk_1E37BDD60;
  block[4] = self;
  dispatch_async(accessQueue, block);
}

uint64_t __64__ASDSoftwareUpdatesStore_showApplicationBadgeForPendingUpdates__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_call:run:error:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16), &__block_literal_global_37, &__block_literal_global_38);
}

uint64_t __64__ASDSoftwareUpdatesStore_showApplicationBadgeForPendingUpdates__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "showApplicationBadgeForPendingUpdates");
}

- (void)showApplicationUpdateBulletin
{
  NSObject *v3;
  id v4;
  NSObject *accessQueue;
  _QWORD block[5];
  uint8_t buf[4];
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  ASDLogHandleForCategory(12);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v8 = (id)objc_opt_class();
    v4 = v8;
    _os_log_impl(&dword_19A03B000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@]: showApplicationUpdateBulletin", buf, 0xCu);

  }
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__ASDSoftwareUpdatesStore_showApplicationUpdateBulletin__block_invoke;
  block[3] = &unk_1E37BDD60;
  block[4] = self;
  dispatch_async(accessQueue, block);
}

uint64_t __56__ASDSoftwareUpdatesStore_showApplicationUpdateBulletin__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_call:run:error:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16), &__block_literal_global_39_0, &__block_literal_global_40);
}

uint64_t __56__ASDSoftwareUpdatesStore_showApplicationUpdateBulletin__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "showApplicationUpdatesBulletin");
}

- (void)updateAllWithCompletionBlock:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  NSObject *accessQueue;
  id v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  ASDLogHandleForCategory(12);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v12 = (id)objc_opt_class();
    v6 = v12;
    _os_log_impl(&dword_19A03B000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@]: updateAllWithCompletionBlock", buf, 0xCu);

  }
  accessQueue = self->_accessQueue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __56__ASDSoftwareUpdatesStore_updateAllWithCompletionBlock___block_invoke;
  v9[3] = &unk_1E37BE278;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  dispatch_async(accessQueue, v9);

}

void __56__ASDSoftwareUpdatesStore_updateAllWithCompletionBlock___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  _QWORD v11[5];
  id v12;

  v3 = *(_QWORD **)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v4 = v3[2];
  v11[2] = __56__ASDSoftwareUpdatesStore_updateAllWithCompletionBlock___block_invoke_2;
  v11[3] = &unk_1E37BF7E0;
  v5 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v6 = v2;
  v7 = *(void **)(a1 + 40);
  v11[4] = *(_QWORD *)(a1 + 32);
  v12 = v6;
  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __56__ASDSoftwareUpdatesStore_updateAllWithCompletionBlock___block_invoke_5;
  v9[3] = &unk_1E37BE250;
  v8 = v7;
  v9[4] = *(_QWORD *)(a1 + 32);
  v10 = v8;
  objc_msgSend(v3, "_call:run:error:", v4, v11, v9);

}

void __56__ASDSoftwareUpdatesStore_updateAllWithCompletionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v4;
  _QWORD v5[5];
  id v6;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __56__ASDSoftwareUpdatesStore_updateAllWithCompletionBlock___block_invoke_3;
  v5[3] = &unk_1E37BF288;
  v4 = *(id *)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v4;
  objc_msgSend(a2, "updateAllWithJobResults:", v5);

}

void __56__ASDSoftwareUpdatesStore_updateAllWithCompletionBlock___block_invoke_3(uint64_t a1, char a2, uint64_t a3, void *a4)
{
  id v6;
  void *v7;
  NSObject *v8;
  _QWORD block[4];
  id v10;
  id v11;
  char v12;

  v6 = a4;
  v7 = *(void **)(a1 + 40);
  if (v7)
  {
    v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __56__ASDSoftwareUpdatesStore_updateAllWithCompletionBlock___block_invoke_4;
    block[3] = &unk_1E37BDF60;
    v11 = v7;
    v12 = a2;
    v10 = v6;
    dispatch_async(v8, block);

  }
}

uint64_t __56__ASDSoftwareUpdatesStore_updateAllWithCompletionBlock___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

void __56__ASDSoftwareUpdatesStore_updateAllWithCompletionBlock___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  if (v4)
  {
    v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __56__ASDSoftwareUpdatesStore_updateAllWithCompletionBlock___block_invoke_6;
    v6[3] = &unk_1E37BDCC0;
    v8 = v4;
    v7 = v3;
    dispatch_async(v5, v6);

  }
}

uint64_t __56__ASDSoftwareUpdatesStore_updateAllWithCompletionBlock___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

- (void)updateAllWithJobResultsCompletionBlock:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  NSObject *accessQueue;
  id v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  ASDLogHandleForCategory(12);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v12 = (id)objc_opt_class();
    v6 = v12;
    _os_log_impl(&dword_19A03B000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@]: updateAllWithJobResultsCompletionBlock", buf, 0xCu);

  }
  accessQueue = self->_accessQueue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __66__ASDSoftwareUpdatesStore_updateAllWithJobResultsCompletionBlock___block_invoke;
  v9[3] = &unk_1E37BE278;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  dispatch_async(accessQueue, v9);

}

void __66__ASDSoftwareUpdatesStore_updateAllWithJobResultsCompletionBlock___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  _QWORD v11[5];
  id v12;

  v3 = *(_QWORD **)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v4 = v3[2];
  v11[2] = __66__ASDSoftwareUpdatesStore_updateAllWithJobResultsCompletionBlock___block_invoke_2;
  v11[3] = &unk_1E37BF7E0;
  v5 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v6 = v2;
  v7 = *(void **)(a1 + 40);
  v11[4] = *(_QWORD *)(a1 + 32);
  v12 = v6;
  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __66__ASDSoftwareUpdatesStore_updateAllWithJobResultsCompletionBlock___block_invoke_5;
  v9[3] = &unk_1E37BE250;
  v8 = v7;
  v9[4] = *(_QWORD *)(a1 + 32);
  v10 = v8;
  objc_msgSend(v3, "_call:run:error:", v4, v11, v9);

}

void __66__ASDSoftwareUpdatesStore_updateAllWithJobResultsCompletionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v4;
  _QWORD v5[5];
  id v6;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __66__ASDSoftwareUpdatesStore_updateAllWithJobResultsCompletionBlock___block_invoke_3;
  v5[3] = &unk_1E37BF288;
  v4 = *(id *)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v4;
  objc_msgSend(a2, "updateAllWithJobResults:", v5);

}

void __66__ASDSoftwareUpdatesStore_updateAllWithJobResultsCompletionBlock___block_invoke_3(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  char v15;

  v7 = a3;
  v8 = a4;
  v9 = *(void **)(a1 + 40);
  if (v9)
  {
    v10 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __66__ASDSoftwareUpdatesStore_updateAllWithJobResultsCompletionBlock___block_invoke_4;
    v11[3] = &unk_1E37BE360;
    v14 = v9;
    v15 = a2;
    v12 = v7;
    v13 = v8;
    dispatch_async(v10, v11);

  }
}

uint64_t __66__ASDSoftwareUpdatesStore_updateAllWithJobResultsCompletionBlock___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

void __66__ASDSoftwareUpdatesStore_updateAllWithJobResultsCompletionBlock___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  if (v4)
  {
    v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __66__ASDSoftwareUpdatesStore_updateAllWithJobResultsCompletionBlock___block_invoke_6;
    v6[3] = &unk_1E37BDCC0;
    v8 = v4;
    v7 = v3;
    dispatch_async(v5, v6);

  }
}

uint64_t __66__ASDSoftwareUpdatesStore_updateAllWithJobResultsCompletionBlock___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, 0, *(_QWORD *)(a1 + 32));
}

- (void)updateAllWithOrder:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  NSObject *accessQueue;
  id v11;
  id v12;
  _QWORD block[5];
  id v14;
  id v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  ASDLogHandleForCategory(12);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v17 = (id)objc_opt_class();
    v9 = v17;
    _os_log_impl(&dword_19A03B000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@]: updateAllWithOrder", buf, 0xCu);

  }
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__ASDSoftwareUpdatesStore_updateAllWithOrder_completionBlock___block_invoke;
  block[3] = &unk_1E37BE3D8;
  block[4] = self;
  v14 = v6;
  v15 = v7;
  v11 = v7;
  v12 = v6;
  dispatch_async(accessQueue, block);

}

void __62__ASDSoftwareUpdatesStore_updateAllWithOrder_completionBlock___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  id v13;

  v3 = *(_QWORD **)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v4 = v3[2];
  v10[2] = __62__ASDSoftwareUpdatesStore_updateAllWithOrder_completionBlock___block_invoke_2;
  v10[3] = &unk_1E37BF758;
  v5 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v11 = v2;
  v6 = *(id *)(a1 + 48);
  v12 = *(_QWORD *)(a1 + 32);
  v13 = v6;
  v8[0] = v5;
  v8[1] = 3221225472;
  v8[2] = __62__ASDSoftwareUpdatesStore_updateAllWithOrder_completionBlock___block_invoke_5;
  v8[3] = &unk_1E37BE250;
  v7 = *(id *)(a1 + 48);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v7;
  objc_msgSend(v3, "_call:run:error:", v4, v10, v8);

}

void __62__ASDSoftwareUpdatesStore_updateAllWithOrder_completionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = *(_QWORD *)(a1 + 32);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __62__ASDSoftwareUpdatesStore_updateAllWithOrder_completionBlock___block_invoke_3;
  v6[3] = &unk_1E37BF288;
  v5 = *(id *)(a1 + 48);
  v6[4] = *(_QWORD *)(a1 + 40);
  v7 = v5;
  objc_msgSend(a2, "updateAllWithOrder:completionBlock:", v4, v6);

}

void __62__ASDSoftwareUpdatesStore_updateAllWithOrder_completionBlock___block_invoke_3(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  char v15;

  v7 = a3;
  v8 = a4;
  v9 = *(void **)(a1 + 40);
  if (v9)
  {
    v10 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __62__ASDSoftwareUpdatesStore_updateAllWithOrder_completionBlock___block_invoke_4;
    v11[3] = &unk_1E37BE360;
    v14 = v9;
    v15 = a2;
    v12 = v7;
    v13 = v8;
    dispatch_async(v10, v11);

  }
}

uint64_t __62__ASDSoftwareUpdatesStore_updateAllWithOrder_completionBlock___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

void __62__ASDSoftwareUpdatesStore_updateAllWithOrder_completionBlock___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  if (v4)
  {
    v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __62__ASDSoftwareUpdatesStore_updateAllWithOrder_completionBlock___block_invoke_6;
    v6[3] = &unk_1E37BDCC0;
    v8 = v4;
    v7 = v3;
    dispatch_async(v5, v6);

  }
}

uint64_t __62__ASDSoftwareUpdatesStore_updateAllWithOrder_completionBlock___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, 0, *(_QWORD *)(a1 + 32));
}

- (void)shouldUseModernUpdatesWithCompletionBlock:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  NSObject *accessQueue;
  id v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  ASDLogHandleForCategory(12);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v12 = (id)objc_opt_class();
    v6 = v12;
    _os_log_impl(&dword_19A03B000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@]: shouldUseModernUpdatesWithCompletionBlock", buf, 0xCu);

  }
  accessQueue = self->_accessQueue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __69__ASDSoftwareUpdatesStore_shouldUseModernUpdatesWithCompletionBlock___block_invoke;
  v9[3] = &unk_1E37BE278;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  dispatch_async(accessQueue, v9);

}

void __69__ASDSoftwareUpdatesStore_shouldUseModernUpdatesWithCompletionBlock___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  _QWORD v11[5];
  id v12;

  v3 = *(_QWORD **)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v4 = v3[2];
  v11[2] = __69__ASDSoftwareUpdatesStore_shouldUseModernUpdatesWithCompletionBlock___block_invoke_2;
  v11[3] = &unk_1E37BF7E0;
  v5 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v6 = v2;
  v7 = *(void **)(a1 + 40);
  v11[4] = *(_QWORD *)(a1 + 32);
  v12 = v6;
  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __69__ASDSoftwareUpdatesStore_shouldUseModernUpdatesWithCompletionBlock___block_invoke_5;
  v9[3] = &unk_1E37BE250;
  v8 = v7;
  v9[4] = *(_QWORD *)(a1 + 32);
  v10 = v8;
  objc_msgSend(v3, "_call:run:error:", v4, v11, v9);

}

void __69__ASDSoftwareUpdatesStore_shouldUseModernUpdatesWithCompletionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v4;
  _QWORD v5[5];
  id v6;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __69__ASDSoftwareUpdatesStore_shouldUseModernUpdatesWithCompletionBlock___block_invoke_3;
  v5[3] = &unk_1E37BF830;
  v4 = *(id *)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v4;
  objc_msgSend(a2, "shouldUseModernUpdatesWithCompletionBlock:", v5);

}

void __69__ASDSoftwareUpdatesStore_shouldUseModernUpdatesWithCompletionBlock___block_invoke_3(uint64_t a1, char a2)
{
  void *v2;
  NSObject *v4;
  _QWORD v5[4];
  id v6;
  char v7;

  v2 = *(void **)(a1 + 40);
  if (v2)
  {
    v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __69__ASDSoftwareUpdatesStore_shouldUseModernUpdatesWithCompletionBlock___block_invoke_4;
    v5[3] = &unk_1E37BF808;
    v6 = v2;
    v7 = a2;
    dispatch_async(v4, v5);

  }
}

uint64_t __69__ASDSoftwareUpdatesStore_shouldUseModernUpdatesWithCompletionBlock___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

void __69__ASDSoftwareUpdatesStore_shouldUseModernUpdatesWithCompletionBlock___block_invoke_5(uint64_t a1)
{
  void *v1;
  NSObject *v2;
  _QWORD block[4];
  id v4;

  v1 = *(void **)(a1 + 40);
  if (v1)
  {
    v2 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __69__ASDSoftwareUpdatesStore_shouldUseModernUpdatesWithCompletionBlock___block_invoke_6;
    block[3] = &unk_1E37BF108;
    v4 = v1;
    dispatch_async(v2, block);

  }
}

uint64_t __69__ASDSoftwareUpdatesStore_shouldUseModernUpdatesWithCompletionBlock___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __43__ASDSoftwareUpdatesStore__setupConnection__block_invoke()
{
  uint8_t v0[16];

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v0 = 0;
    _os_log_impl(&dword_19A03B000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Invalidate", v0, 2u);
  }
}

void __43__ASDSoftwareUpdatesStore__setupConnection__block_invoke_130()
{
  uint8_t v0[16];

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v0 = 0;
    _os_log_impl(&dword_19A03B000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Interrupt", v0, 2u);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_getUpdatesPromise, 0);
  objc_storeStrong((id *)&self->_calloutQueue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
}

@end
