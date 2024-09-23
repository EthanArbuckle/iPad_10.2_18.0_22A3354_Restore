@implementation UNUserNotificationCenterDelegateConnectionListener

uint64_t __99__UNUserNotificationCenterDelegateConnectionListener__queue_didChangeSettings_forBundleIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "didChangeSettings:", *(_QWORD *)(a1 + 40));
}

uint64_t __92__UNUserNotificationCenterDelegateConnectionListener_didChangeSettings_forBundleIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_didChangeSettings:forBundleIdentifier:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __86__UNUserNotificationCenterDelegateConnectionListener_setDelegate_forBundleIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_setDelegate:forBundleIdentifier:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_queue_setDelegate:(id)a3 forBundleIdentifier:(id)a4
{
  NSObject *queue;
  id v7;
  NSMutableDictionary *delegateByBundleIdentifier;
  id v9;

  v9 = a3;
  queue = self->_queue;
  v7 = a4;
  dispatch_assert_queue_V2(queue);
  delegateByBundleIdentifier = self->_delegateByBundleIdentifier;
  if (v9)
  {
    -[NSMutableDictionary setObject:forKey:](delegateByBundleIdentifier, "setObject:forKey:", v9, v7);
    -[UNUserNotificationCenterDelegateConnectionListener _queue_ensureListenerForBundleIdentifier:](self, "_queue_ensureListenerForBundleIdentifier:", v7);
  }
  else
  {
    -[NSMutableDictionary removeObjectForKey:](delegateByBundleIdentifier, "removeObjectForKey:", v7);
    -[UNUserNotificationCenterDelegateConnectionListener _queue_invalidateListenerForBundleIdentifier:](self, "_queue_invalidateListenerForBundleIdentifier:", v7);
  }

}

- (void)_queue_ensureListenerForBundleIdentifier:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[NSMutableDictionary objectForKey:](self->_listenerByBundleIdentifier, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v6 = UNLogConnections;
    if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138543362;
      v9 = v4;
      _os_log_impl(&dword_1AA8E4000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Listening for connections to delegate", (uint8_t *)&v8, 0xCu);
    }
    +[UNUserNotificationCenterDelegateService serviceNameForBundleIdentifier:](UNUserNotificationCenterDelegateService, "serviceNameForBundleIdentifier:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B58]), "initWithMachServiceName:", v7);
    objc_msgSend(v5, "setDelegate:", self);
    -[NSMutableDictionary setObject:forKey:](self->_listenerByBundleIdentifier, "setObject:forKey:", v5, v4);
    objc_msgSend(v5, "resume");

  }
}

- (void)_queue_didChangeSettings:(id)a3 forBundleIdentifier:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  NSObject *callOutQueue;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v8 = UNLogConnections;
  if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v17 = v7;
    v18 = 2114;
    v19 = v6;
    _os_log_impl(&dword_1AA8E4000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] changed settings %{public}@", buf, 0x16u);
  }
  -[NSMutableDictionary objectForKey:](self->_delegateByBundleIdentifier, "objectForKey:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  callOutQueue = self->_callOutQueue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __99__UNUserNotificationCenterDelegateConnectionListener__queue_didChangeSettings_forBundleIdentifier___block_invoke;
  v13[3] = &unk_1E57EFBA8;
  v14 = v9;
  v15 = v6;
  v11 = v6;
  v12 = v9;
  dispatch_async(callOutQueue, v13);

}

- (void)setDelegate:(id)a3 forBundleIdentifier:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __86__UNUserNotificationCenterDelegateConnectionListener_setDelegate_forBundleIdentifier___block_invoke;
  block[3] = &unk_1E57EFAC8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_0);
  return (id)sharedInstance___sharedInstance;
}

void __68__UNUserNotificationCenterDelegateConnectionListener_sharedInstance__block_invoke()
{
  UNUserNotificationCenterDelegateConnectionListener *v0;
  void *v1;

  v0 = objc_alloc_init(UNUserNotificationCenterDelegateConnectionListener);
  v1 = (void *)sharedInstance___sharedInstance;
  sharedInstance___sharedInstance = (uint64_t)v0;

}

- (UNUserNotificationCenterDelegateConnectionListener)init
{
  UNUserNotificationCenterDelegateConnectionListener *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *listenerByBundleIdentifier;
  NSMutableDictionary *v5;
  NSMutableDictionary *delegateByBundleIdentifier;
  NSObject *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *queue;
  NSObject *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *callOutQueue;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)UNUserNotificationCenterDelegateConnectionListener;
  v2 = -[UNUserNotificationCenterDelegateConnectionListener init](&v14, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    listenerByBundleIdentifier = v2->_listenerByBundleIdentifier;
    v2->_listenerByBundleIdentifier = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    delegateByBundleIdentifier = v2->_delegateByBundleIdentifier;
    v2->_delegateByBundleIdentifier = v5;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = dispatch_queue_create("com.apple.usernotifications.DelegateConnectionListener", v7);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v8;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = dispatch_queue_create("com.apple.usernotifications.DelegateConnectionListener.call-out", v10);
    callOutQueue = v2->_callOutQueue;
    v2->_callOutQueue = (OS_dispatch_queue *)v11;

  }
  return v2;
}

- (void)didChangeSettings:(id)a3 forBundleIdentifier:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __92__UNUserNotificationCenterDelegateConnectionListener_didChangeSettings_forBundleIdentifier___block_invoke;
  block[3] = &unk_1E57EFAC8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  void *v6;

  v5 = a4;
  +[UNUserNotificationCenterDelegateService serverInterface](UNUserNotificationCenterDelegateService, "serverInterface");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setExportedInterface:", v6);

  objc_msgSend(v5, "setExportedObject:", self);
  objc_msgSend(v5, "setInterruptionHandler:", &__block_literal_global_5);
  objc_msgSend(v5, "setInvalidationHandler:", &__block_literal_global_7);
  objc_msgSend(v5, "resume");

  return 1;
}

- (void)didReceiveNotificationResponse:(id)a3 forBundleIdentifier:(id)a4 withCompletionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *queue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  queue = self->_queue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __127__UNUserNotificationCenterDelegateConnectionListener_didReceiveNotificationResponse_forBundleIdentifier_withCompletionHandler___block_invoke;
  v15[3] = &unk_1E57EFAF0;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(queue, v15);

}

uint64_t __127__UNUserNotificationCenterDelegateConnectionListener_didReceiveNotificationResponse_forBundleIdentifier_withCompletionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_didReceiveNotificationResponse:forBundleIdentifier:withCompletionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)didOpenApplicationForResponse:(id)a3 forBundleIdentifier:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __104__UNUserNotificationCenterDelegateConnectionListener_didOpenApplicationForResponse_forBundleIdentifier___block_invoke;
  block[3] = &unk_1E57EFAC8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

uint64_t __104__UNUserNotificationCenterDelegateConnectionListener_didOpenApplicationForResponse_forBundleIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_didOpenApplicationForResponse:forBundleIdentifier:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __89__UNUserNotificationCenterDelegateConnectionListener_listener_shouldAcceptNewConnection___block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  v0 = UNLogConnections;
  if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1AA8E4000, v0, OS_LOG_TYPE_DEFAULT, "delegate connection interrupted", v1, 2u);
  }
}

void __89__UNUserNotificationCenterDelegateConnectionListener_listener_shouldAcceptNewConnection___block_invoke_6()
{
  NSObject *v0;
  uint8_t v1[16];

  v0 = UNLogConnections;
  if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1AA8E4000, v0, OS_LOG_TYPE_DEFAULT, "delegate connection invalidated", v1, 2u);
  }
}

- (void)_queue_invalidateListenerForBundleIdentifier:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[NSMutableDictionary objectForKey:](self->_listenerByBundleIdentifier, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = UNLogConnections;
    if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138543362;
      v8 = v4;
      _os_log_impl(&dword_1AA8E4000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Invalidating listener for delegate", (uint8_t *)&v7, 0xCu);
    }
    objc_msgSend(v5, "invalidate");
    -[NSMutableDictionary removeObjectForKey:](self->_listenerByBundleIdentifier, "removeObjectForKey:", v4);
  }

}

- (void)_queue_didReceiveNotificationResponse:(id)a3 forBundleIdentifier:(id)a4 withCompletionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *callOutQueue;
  id v20;
  id v21;
  id v22;
  _QWORD block[4];
  id v24;
  id v25;
  id v26;
  uint8_t buf[4];
  id v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v11 = (void *)UNLogConnections;
  if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_DEFAULT))
  {
    v12 = v11;
    objc_msgSend(v8, "actionIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "notification");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "request");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "identifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "un_logDigest");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v28 = v9;
    v29 = 2114;
    v30 = v13;
    v31 = 2114;
    v32 = v17;
    _os_log_impl(&dword_1AA8E4000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] Received action %{public}@ response for notification %{public}@", buf, 0x20u);

  }
  -[NSMutableDictionary objectForKey:](self->_delegateByBundleIdentifier, "objectForKey:", v9);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  callOutQueue = self->_callOutQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __134__UNUserNotificationCenterDelegateConnectionListener__queue_didReceiveNotificationResponse_forBundleIdentifier_withCompletionHandler___block_invoke;
  block[3] = &unk_1E57EFB80;
  v24 = v18;
  v25 = v8;
  v26 = v10;
  v20 = v10;
  v21 = v8;
  v22 = v18;
  dispatch_async(callOutQueue, block);

}

void __134__UNUserNotificationCenterDelegateConnectionListener__queue_didReceiveNotificationResponse_forBundleIdentifier_withCompletionHandler___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  _QWORD v3[4];
  id v4;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __134__UNUserNotificationCenterDelegateConnectionListener__queue_didReceiveNotificationResponse_forBundleIdentifier_withCompletionHandler___block_invoke_2;
  v3[3] = &unk_1E57EFB58;
  v4 = *(id *)(a1 + 48);
  objc_msgSend(v1, "didReceiveNotificationResponse:withCompletionHandler:", v2, v3);

}

uint64_t __134__UNUserNotificationCenterDelegateConnectionListener__queue_didReceiveNotificationResponse_forBundleIdentifier_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  return result;
}

- (void)_queue_didOpenApplicationForResponse:(id)a3 forBundleIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *callOutQueue;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v8 = (void *)UNLogConnections;
  if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_DEFAULT))
  {
    v9 = v8;
    objc_msgSend(v6, "actionIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "notification");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "request");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "un_logDigest");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v23 = v7;
    v24 = 2114;
    v25 = v10;
    v26 = 2114;
    v27 = v14;
    _os_log_impl(&dword_1AA8E4000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] Did open application for action %{public}@ response for notification %{public}@", buf, 0x20u);

  }
  -[NSMutableDictionary objectForKey:](self->_delegateByBundleIdentifier, "objectForKey:", v7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  callOutQueue = self->_callOutQueue;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __111__UNUserNotificationCenterDelegateConnectionListener__queue_didOpenApplicationForResponse_forBundleIdentifier___block_invoke;
  v19[3] = &unk_1E57EFBA8;
  v20 = v15;
  v21 = v6;
  v17 = v6;
  v18 = v15;
  dispatch_async(callOutQueue, v19);

}

uint64_t __111__UNUserNotificationCenterDelegateConnectionListener__queue_didOpenApplicationForResponse_forBundleIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "didOpenApplicationForResponse:", *(_QWORD *)(a1 + 40));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callOutQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_delegateByBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_listenerByBundleIdentifier, 0);
}

@end
