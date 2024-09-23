@implementation UNUserNotificationServiceConnection

- (id)badgeNumberForBundleIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *queue;
  id v7;
  id v8;
  _QWORD block[5];
  id v11;
  __int128 *p_buf;
  __int128 buf;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = UNLogConnections;
  if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v4;
    _os_log_impl(&dword_1AA8E4000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Getting badge number (sync)", (uint8_t *)&buf, 0xCu);
  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__1;
  v16 = __Block_byref_object_dispose__1;
  v17 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__UNUserNotificationServiceConnection_badgeNumberForBundleIdentifier___block_invoke;
  block[3] = &unk_1E57F0178;
  block[4] = self;
  v11 = v4;
  p_buf = &buf;
  v7 = v4;
  dispatch_sync(queue, block);
  v8 = *(id *)(*((_QWORD *)&buf + 1) + 40);

  _Block_object_dispose(&buf, 8);
  return v8;
}

void __109__UNUserNotificationServiceConnection_requestAuthorizationWithOptions_forBundleIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  id v13;
  _QWORD v14[4];
  id v15;
  uint64_t v16;
  id v17;

  objc_msgSend(*(id *)(a1 + 32), "_queue_ensureConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __109__UNUserNotificationServiceConnection_requestAuthorizationWithOptions_forBundleIdentifier_completionHandler___block_invoke_2;
  v14[3] = &unk_1E57F0088;
  v4 = *(id *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 32);
  v15 = v4;
  v16 = v5;
  v17 = *(id *)(a1 + 48);
  objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", v14);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1 + 56);
  v8 = *(void **)(a1 + 40);
  v10[0] = v3;
  v10[1] = 3221225472;
  v10[2] = __109__UNUserNotificationServiceConnection_requestAuthorizationWithOptions_forBundleIdentifier_completionHandler___block_invoke_2_6;
  v10[3] = &unk_1E57F00D8;
  v11 = v8;
  v9 = *(id *)(a1 + 48);
  v12 = *(_QWORD *)(a1 + 32);
  v13 = v9;
  objc_msgSend(v6, "requestAuthorizationWithOptions:forBundleIdentifier:completionHandler:", v7, v11, v10);

}

void __70__UNUserNotificationServiceConnection_badgeNumberForBundleIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;

  objc_msgSend(*(id *)(a1 + 32), "_queue_ensureConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __70__UNUserNotificationServiceConnection_badgeNumberForBundleIdentifier___block_invoke_2;
  v11[3] = &unk_1E57F0128;
  v12 = *(id *)(a1 + 40);
  objc_msgSend(v2, "synchronousRemoteObjectProxyWithErrorHandler:", v11);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 40);
  v8[0] = v3;
  v8[1] = 3221225472;
  v8[2] = __70__UNUserNotificationServiceConnection_badgeNumberForBundleIdentifier___block_invoke_63;
  v8[3] = &unk_1E57F0410;
  v6 = v5;
  v7 = *(_QWORD *)(a1 + 48);
  v9 = v6;
  v10 = v7;
  objc_msgSend(v4, "getBadgeNumberForBundleIdentifier:withCompletionHandler:", v6, v8);

}

void __79__UNUserNotificationServiceConnection_notificationSettingsForBundleIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;

  objc_msgSend(*(id *)(a1 + 32), "_queue_ensureConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __79__UNUserNotificationServiceConnection_notificationSettingsForBundleIdentifier___block_invoke_2;
  v11[3] = &unk_1E57F0128;
  v12 = *(id *)(a1 + 40);
  objc_msgSend(v2, "synchronousRemoteObjectProxyWithErrorHandler:", v11);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 40);
  v8[0] = v3;
  v8[1] = 3221225472;
  v8[2] = __79__UNUserNotificationServiceConnection_notificationSettingsForBundleIdentifier___block_invoke_12;
  v8[3] = &unk_1E57F0150;
  v6 = v5;
  v7 = *(_QWORD *)(a1 + 48);
  v9 = v6;
  v10 = v7;
  objc_msgSend(v4, "getNotificationSettingsForBundleIdentifier:withCompletionHandler:", v6, v8);

}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1)
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_9);
  return (id)sharedInstance___sharedInstance_0;
}

- (void)getNotificationSettingsForBundleIdentifier:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *queue;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = UNLogConnections;
  if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v16 = v6;
    _os_log_impl(&dword_1AA8E4000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Getting notification settings (async)", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __104__UNUserNotificationServiceConnection_getNotificationSettingsForBundleIdentifier_withCompletionHandler___block_invoke;
  block[3] = &unk_1E57EFB80;
  block[4] = self;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  dispatch_async(queue, block);

}

void __96__UNUserNotificationServiceConnection_setBadgeNumber_forBundleIdentifier_withCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  id v13;
  _QWORD v14[4];
  id v15;
  uint64_t v16;
  id v17;

  objc_msgSend(*(id *)(a1 + 32), "_queue_ensureConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __96__UNUserNotificationServiceConnection_setBadgeNumber_forBundleIdentifier_withCompletionHandler___block_invoke_2;
  v14[3] = &unk_1E57F0088;
  v4 = *(id *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 32);
  v15 = v4;
  v16 = v5;
  v17 = *(id *)(a1 + 56);
  objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", v14);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(void **)(a1 + 40);
  v8 = *(_QWORD *)(a1 + 48);
  v10[0] = v3;
  v10[1] = 3221225472;
  v10[2] = __96__UNUserNotificationServiceConnection_setBadgeNumber_forBundleIdentifier_withCompletionHandler___block_invoke_2_69;
  v10[3] = &unk_1E57F0218;
  v11 = v7;
  v9 = *(id *)(a1 + 56);
  v12 = *(_QWORD *)(a1 + 32);
  v13 = v9;
  objc_msgSend(v6, "setBadgeNumber:forBundleIdentifier:withCompletionHandler:", v8, v11, v10);

}

void __104__UNUserNotificationServiceConnection_getNotificationSettingsForBundleIdentifier_withCompletionHandler___block_invoke(id *a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;

  objc_msgSend(a1[4], "_queue_ensureConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __104__UNUserNotificationServiceConnection_getNotificationSettingsForBundleIdentifier_withCompletionHandler___block_invoke_2;
  v13[3] = &unk_1E57F0088;
  v4 = a1[5];
  v5 = a1[4];
  v14 = v4;
  v15 = v5;
  v16 = a1[6];
  objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", v13);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = a1[5];
  v9[0] = v3;
  v9[1] = 3221225472;
  v9[2] = __104__UNUserNotificationServiceConnection_getNotificationSettingsForBundleIdentifier_withCompletionHandler___block_invoke_2_15;
  v9[3] = &unk_1E57F01A0;
  v10 = v7;
  v8 = a1[6];
  v11 = a1[4];
  v12 = v8;
  objc_msgSend(v6, "getNotificationSettingsForBundleIdentifier:withCompletionHandler:", v10, v9);

}

- (id)_queue_ensureConnection
{
  NSXPCConnection *connection;
  __CFString *v4;
  __CFString *v5;
  NSXPCConnection *v6;
  NSXPCConnection *v7;
  NSXPCConnection *v8;
  void *v9;
  NSXPCConnection *v10;
  void *v11;
  NSXPCConnection *v12;
  id v13;
  NSXPCConnection *v14;
  uint64_t v15;
  NSXPCConnection *v16;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t);
  void *v21;
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id from;
  id location;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  connection = self->_connection;
  if (!connection)
  {
    objc_initWeak(&location, self);
    v4 = CFSTR("com.apple.usernotifications.usernotificationservice");
    if (_os_feature_enabled_impl())
    {
      v5 = CFSTR("com.apple.usernotifications.listener");

      v4 = v5;
    }
    v6 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", v4, 0);
    v7 = self->_connection;
    self->_connection = v6;

    v8 = self->_connection;
    +[UNUserNotificationService serverInterface](UNUserNotificationService, "serverInterface");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v8, "setRemoteObjectInterface:", v9);

    v10 = self->_connection;
    +[UNUserNotificationService clientInterface](UNUserNotificationService, "clientInterface");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setExportedInterface:](v10, "setExportedInterface:", v11);

    v12 = self->_connection;
    v13 = objc_loadWeakRetained(&location);
    -[NSXPCConnection setExportedObject:](v12, "setExportedObject:", v13);

    objc_initWeak(&from, self->_queue);
    v14 = self->_connection;
    v15 = MEMORY[0x1E0C809B0];
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __62__UNUserNotificationServiceConnection__queue_ensureConnection__block_invoke;
    v24[3] = &unk_1E57F0500;
    objc_copyWeak(&v25, &from);
    objc_copyWeak(&v26, &location);
    -[NSXPCConnection setInterruptionHandler:](v14, "setInterruptionHandler:", v24);
    v16 = self->_connection;
    v18 = v15;
    v19 = 3221225472;
    v20 = __62__UNUserNotificationServiceConnection__queue_ensureConnection__block_invoke_3;
    v21 = &unk_1E57F0500;
    objc_copyWeak(&v22, &from);
    objc_copyWeak(&v23, &location);
    -[NSXPCConnection setInvalidationHandler:](v16, "setInvalidationHandler:", &v18);
    -[NSXPCConnection resume](self->_connection, "resume", v18, v19, v20, v21);
    objc_destroyWeak(&v23);
    objc_destroyWeak(&v22);
    objc_destroyWeak(&v26);
    objc_destroyWeak(&v25);
    objc_destroyWeak(&from);

    objc_destroyWeak(&location);
    connection = self->_connection;
  }
  return connection;
}

- (void)setBadgeNumber:(id)a3 forBundleIdentifier:(id)a4 withCompletionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *queue;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = UNLogConnections;
  if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v21 = v9;
    v22 = 2114;
    v23 = v8;
    _os_log_impl(&dword_1AA8E4000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] Setting badge number to %{public}@", buf, 0x16u);
  }
  queue = self->_queue;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __96__UNUserNotificationServiceConnection_setBadgeNumber_forBundleIdentifier_withCompletionHandler___block_invoke;
  v16[3] = &unk_1E57F0240;
  v16[4] = self;
  v17 = v9;
  v18 = v8;
  v19 = v10;
  v13 = v8;
  v14 = v10;
  v15 = v9;
  dispatch_sync(queue, v16);

}

- (id)notificationSettingsForBundleIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *queue;
  id v7;
  id v8;
  _QWORD block[5];
  id v11;
  __int128 *p_buf;
  __int128 buf;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = UNLogConnections;
  if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v4;
    _os_log_impl(&dword_1AA8E4000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Getting notification settings (sync)", (uint8_t *)&buf, 0xCu);
  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__1;
  v16 = __Block_byref_object_dispose__1;
  v17 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __79__UNUserNotificationServiceConnection_notificationSettingsForBundleIdentifier___block_invoke;
  block[3] = &unk_1E57F0178;
  block[4] = self;
  v11 = v4;
  p_buf = &buf;
  v7 = v4;
  dispatch_sync(queue, block);
  v8 = *(id *)(*((_QWORD *)&buf + 1) + 40);

  _Block_object_dispose(&buf, 8);
  return v8;
}

- (void)requestAuthorizationWithOptions:(unint64_t)a3 forBundleIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  NSObject *queue;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  unint64_t v17;
  uint8_t buf[4];
  id v19;
  __int16 v20;
  unint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  v10 = UNLogConnections;
  if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v19 = v8;
    v20 = 2048;
    v21 = a3;
    _os_log_impl(&dword_1AA8E4000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] Requesting authorization with options %ld", buf, 0x16u);
  }
  queue = self->_queue;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __109__UNUserNotificationServiceConnection_requestAuthorizationWithOptions_forBundleIdentifier_completionHandler___block_invoke;
  v14[3] = &unk_1E57F0100;
  v14[4] = self;
  v15 = v8;
  v16 = v9;
  v17 = a3;
  v12 = v9;
  v13 = v8;
  dispatch_async(queue, v14);

}

uint64_t __104__UNUserNotificationServiceConnection_getNotificationSettingsForBundleIdentifier_withCompletionHandler___block_invoke_16(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

uint64_t __109__UNUserNotificationServiceConnection_requestAuthorizationWithOptions_forBundleIdentifier_completionHandler___block_invoke_7(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
  return result;
}

void __106__UNUserNotificationServiceConnection_getNotificationCategoriesForBundleIdentifier_withCompletionHandler___block_invoke_2_22(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  _BOOL4 v8;
  void *v9;
  NSObject *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  _BOOL4 v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)UNLogConnections;
  if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_DEFAULT))
  {
    v5 = a1[4];
    v6 = v4;
    v7 = objc_msgSend(v3, "count");
    v8 = a1[6] != 0;
    *(_DWORD *)buf = 138543874;
    v16 = v5;
    v17 = 2048;
    v18 = v7;
    v19 = 1024;
    v20 = v8;
    _os_log_impl(&dword_1AA8E4000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Got %ld notification categories [ hasCompletionHandler: %d ]", buf, 0x1Cu);

  }
  v9 = (void *)a1[6];
  v10 = *(NSObject **)(a1[5] + 32);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __106__UNUserNotificationServiceConnection_getNotificationCategoriesForBundleIdentifier_withCompletionHandler___block_invoke_23;
  v12[3] = &unk_1E57F0060;
  v13 = v3;
  v14 = v9;
  v11 = v3;
  dispatch_async(v10, v12);

}

void __81__UNUserNotificationServiceConnection_notificationCategoriesForBundleIdentifier___block_invoke_19(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)UNLogConnections;
  if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = v4;
    v9 = 138543618;
    v10 = v5;
    v11 = 2048;
    v12 = objc_msgSend(v3, "count");
    _os_log_impl(&dword_1AA8E4000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Got %ld notification categories", (uint8_t *)&v9, 0x16u);

  }
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v3;

}

- (void)removePendingNotificationRequestsWithIdentifiers:(id)a3 forBundleIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  NSObject *queue;
  id v16;
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  uint8_t buf[4];
  id v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)UNLogConnections;
  if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_DEFAULT))
  {
    v12 = v11;
    v13 = objc_msgSend(v8, "count");
    objc_msgSend(v8, "un_map:", &__block_literal_global_45);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v24 = v9;
    v25 = 2048;
    v26 = v13;
    v27 = 2114;
    v28 = v14;
    _os_log_impl(&dword_1AA8E4000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] Removing %ld pending notification requests with identifiers %{public}@", buf, 0x20u);

  }
  queue = self->_queue;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __126__UNUserNotificationServiceConnection_removePendingNotificationRequestsWithIdentifiers_forBundleIdentifier_completionHandler___block_invoke_46;
  v19[3] = &unk_1E57F0240;
  v19[4] = self;
  v20 = v9;
  v21 = v8;
  v22 = v10;
  v16 = v8;
  v17 = v10;
  v18 = v9;
  dispatch_sync(queue, v19);

}

- (void)removeDeliveredNotificationsWithIdentifiers:(id)a3 forBundleIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  NSObject *queue;
  id v16;
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  uint8_t buf[4];
  id v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)UNLogConnections;
  if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_DEFAULT))
  {
    v12 = v11;
    v13 = objc_msgSend(v8, "count");
    objc_msgSend(v8, "un_map:", &__block_literal_global_57);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v24 = v9;
    v25 = 2048;
    v26 = v13;
    v27 = 2114;
    v28 = v14;
    _os_log_impl(&dword_1AA8E4000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] Removing %ld delivered notifications with identifiers %{public}@", buf, 0x20u);

  }
  queue = self->_queue;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __121__UNUserNotificationServiceConnection_removeDeliveredNotificationsWithIdentifiers_forBundleIdentifier_completionHandler___block_invoke_58;
  v19[3] = &unk_1E57F0240;
  v19[4] = self;
  v20 = v9;
  v21 = v8;
  v22 = v10;
  v16 = v8;
  v17 = v10;
  v18 = v9;
  dispatch_sync(queue, v19);

}

void __85__UNUserNotificationServiceConnection_setNotificationCategories_forBundleIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_queue_ensureConnection");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "remoteObjectProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNotificationCategories:forBundleIdentifier:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)setNotificationCategories:(id)a3 forBundleIdentifier:(id)a4
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  void *v18;
  id v19;
  NSObject *queue;
  id v21;
  id v22;
  _QWORD block[5];
  id v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t v31[128];
  uint8_t buf[4];
  id v33;
  __int16 v34;
  uint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = (void *)UNLogConnections;
  if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_DEFAULT))
  {
    v8 = v7;
    *(_DWORD *)buf = 138543618;
    v33 = v6;
    v34 = 2048;
    v35 = objc_msgSend(v5, "count");
    _os_log_impl(&dword_1AA8E4000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Setting %ld notification categories", buf, 0x16u);

  }
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v10 = v5;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v28;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v28 != v13)
          objc_enumerationMutation(v10);
        v15 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v14);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v9, "addObject:", v15);
        }
        else
        {
          v16 = (void *)UNLogConnections;
          if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_ERROR))
          {
            v17 = v16;
            v18 = (void *)objc_opt_class();
            *(_DWORD *)buf = 138543618;
            v33 = v6;
            v34 = 2114;
            v35 = (uint64_t)v18;
            v19 = v18;
            _os_log_error_impl(&dword_1AA8E4000, v17, OS_LOG_TYPE_ERROR, "[%{public}@] Expected a UNNotificationCategory: %{public}@", buf, 0x16u);

          }
        }
        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v12);
  }

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __85__UNUserNotificationServiceConnection_setNotificationCategories_forBundleIdentifier___block_invoke;
  block[3] = &unk_1E57EFAC8;
  block[4] = self;
  v25 = v9;
  v26 = v6;
  v21 = v6;
  v22 = v9;
  dispatch_sync(queue, block);

}

uint64_t __121__UNUserNotificationServiceConnection_removeDeliveredNotificationsWithIdentifiers_forBundleIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "un_logDigest");
}

uint64_t __126__UNUserNotificationServiceConnection_removePendingNotificationRequestsWithIdentifiers_forBundleIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "un_logDigest");
}

void __104__UNUserNotificationServiceConnection_getNotificationSettingsForBundleIdentifier_withCompletionHandler___block_invoke_2_15(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  _BOOL4 v6;
  void *v7;
  NSObject *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  _BOOL4 v16;
  __int16 v17;
  _BOOL4 v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = UNLogConnections;
  if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_DEFAULT))
  {
    v5 = a1[4];
    v6 = a1[6] != 0;
    *(_DWORD *)buf = 138543874;
    v14 = v5;
    v15 = 1024;
    v16 = v3 != 0;
    v17 = 1024;
    v18 = v6;
    _os_log_impl(&dword_1AA8E4000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Got notification settings [ hasResult: %d hasCompletionHandler: %d ]", buf, 0x18u);
  }
  v7 = (void *)a1[6];
  v8 = *(NSObject **)(a1[5] + 32);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __104__UNUserNotificationServiceConnection_getNotificationSettingsForBundleIdentifier_withCompletionHandler___block_invoke_16;
  v10[3] = &unk_1E57F0060;
  v11 = v3;
  v12 = v7;
  v9 = v3;
  dispatch_async(v8, v10);

}

void __53__UNUserNotificationServiceConnection_sharedInstance__block_invoke()
{
  UNUserNotificationServiceConnection *v0;
  void *v1;

  v0 = objc_alloc_init(UNUserNotificationServiceConnection);
  v1 = (void *)sharedInstance___sharedInstance_0;
  sharedInstance___sharedInstance_0 = (uint64_t)v0;

}

- (UNUserNotificationServiceConnection)init
{
  UNUserNotificationServiceConnection *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *observersByBundleIdentifier;
  NSObject *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *queue;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *callOutQueue;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)UNUserNotificationServiceConnection;
  v2 = -[UNUserNotificationServiceConnection init](&v12, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    observersByBundleIdentifier = v2->_observersByBundleIdentifier;
    v2->_observersByBundleIdentifier = v3;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = dispatch_queue_create("com.apple.usernotifications.UNUserNotificationServiceConnection", v5);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v6;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = dispatch_queue_create("com.apple.usernotifications.UNUserNotificationServiceConnection.call-out", v8);
    callOutQueue = v2->_callOutQueue;
    v2->_callOutQueue = (OS_dispatch_queue *)v9;

  }
  return v2;
}

void __79__UNUserNotificationServiceConnection_notificationSettingsForBundleIdentifier___block_invoke_12(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  _BOOL4 v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = UNLogConnections;
  if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v8 = 138543618;
    v9 = v5;
    v10 = 1024;
    v11 = v3 != 0;
    _os_log_impl(&dword_1AA8E4000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Got notification settings [ hasResult: %d ]", (uint8_t *)&v8, 0x12u);
  }
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v3;

}

void __111__UNUserNotificationServiceConnection_getPendingNotificationRequestsForBundleIdentifier_withCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  objc_msgSend(*(id *)(a1 + 32), "_queue_ensureConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __111__UNUserNotificationServiceConnection_getPendingNotificationRequestsForBundleIdentifier_withCompletionHandler___block_invoke_2;
  v10[3] = &unk_1E57F0088;
  v4 = *(void **)(a1 + 40);
  v10[4] = *(_QWORD *)(a1 + 32);
  v11 = v4;
  v12 = *(id *)(a1 + 48);
  objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  v7[1] = 3221225472;
  v7[2] = __111__UNUserNotificationServiceConnection_getPendingNotificationRequestsForBundleIdentifier_withCompletionHandler___block_invoke_42;
  v7[3] = &unk_1E57F0338;
  v6 = *(void **)(a1 + 40);
  v7[4] = *(_QWORD *)(a1 + 32);
  v8 = v6;
  v9 = *(id *)(a1 + 48);
  objc_msgSend(v5, "getPendingNotificationRequestsForBundleIdentifier:withCompletionHandler:", v8, v7);

}

- (void)getPendingNotificationRequestsForBundleIdentifier:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *queue;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = UNLogConnections;
  if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v16 = v6;
    _os_log_impl(&dword_1AA8E4000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Getting pending notification requests (async)", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __111__UNUserNotificationServiceConnection_getPendingNotificationRequestsForBundleIdentifier_withCompletionHandler___block_invoke;
  block[3] = &unk_1E57EFB80;
  block[4] = self;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  dispatch_async(queue, block);

}

void __89__UNUserNotificationServiceConnection_notificationSettingsForTopicsWithBundleIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;

  objc_msgSend(*(id *)(a1 + 32), "_queue_ensureConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __89__UNUserNotificationServiceConnection_notificationSettingsForTopicsWithBundleIdentifier___block_invoke_2;
  v11[3] = &unk_1E57F0128;
  v12 = *(id *)(a1 + 40);
  objc_msgSend(v2, "synchronousRemoteObjectProxyWithErrorHandler:", v11);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 40);
  v8[0] = v3;
  v8[1] = 3221225472;
  v8[2] = __89__UNUserNotificationServiceConnection_notificationSettingsForTopicsWithBundleIdentifier___block_invoke_88;
  v8[3] = &unk_1E57F0488;
  v6 = v5;
  v7 = *(_QWORD *)(a1 + 48);
  v9 = v6;
  v10 = v7;
  objc_msgSend(v4, "getNotificationSettingsForTopicsWithBundleIdentifier:withCompletionHandler:", v6, v8);

}

void __114__UNUserNotificationServiceConnection_getNotificationSettingsForTopicsWithBundleIdentifier_withCompletionHandler___block_invoke(id *a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;

  objc_msgSend(a1[4], "_queue_ensureConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __114__UNUserNotificationServiceConnection_getNotificationSettingsForTopicsWithBundleIdentifier_withCompletionHandler___block_invoke_2;
  v13[3] = &unk_1E57F0088;
  v4 = a1[5];
  v5 = a1[4];
  v14 = v4;
  v15 = v5;
  v16 = a1[6];
  objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", v13);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = a1[5];
  v9[0] = v3;
  v9[1] = 3221225472;
  v9[2] = __114__UNUserNotificationServiceConnection_getNotificationSettingsForTopicsWithBundleIdentifier_withCompletionHandler___block_invoke_2_85;
  v9[3] = &unk_1E57F0460;
  v10 = v7;
  v8 = a1[6];
  v11 = a1[4];
  v12 = v8;
  objc_msgSend(v6, "getNotificationSettingsForTopicsWithBundleIdentifier:withCompletionHandler:", v10, v9);

}

- (void)getNotificationSettingsForTopicsWithBundleIdentifier:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *queue;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = UNLogConnections;
  if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v16 = v6;
    _os_log_impl(&dword_1AA8E4000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Getting topic settings", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __114__UNUserNotificationServiceConnection_getNotificationSettingsForTopicsWithBundleIdentifier_withCompletionHandler___block_invoke;
  block[3] = &unk_1E57EFB80;
  block[4] = self;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  dispatch_async(queue, block);

}

- (id)notificationCategoriesForBundleIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *queue;
  id v7;
  id v8;
  _QWORD block[5];
  id v11;
  __int128 *p_buf;
  __int128 buf;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = UNLogConnections;
  if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v4;
    _os_log_impl(&dword_1AA8E4000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Getting notification categories (sync)", (uint8_t *)&buf, 0xCu);
  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__1;
  v16 = __Block_byref_object_dispose__1;
  v17 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __81__UNUserNotificationServiceConnection_notificationCategoriesForBundleIdentifier___block_invoke;
  block[3] = &unk_1E57F0178;
  block[4] = self;
  v11 = v4;
  p_buf = &buf;
  v7 = v4;
  dispatch_sync(queue, block);
  v8 = *(id *)(*((_QWORD *)&buf + 1) + 40);

  _Block_object_dispose(&buf, 8);
  return v8;
}

void __109__UNUserNotificationServiceConnection_requestAuthorizationWithOptions_forBundleIdentifier_completionHandler___block_invoke_2_6(_QWORD *a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  _BOOL4 v8;
  void *v9;
  NSObject *v10;
  id v11;
  _QWORD block[4];
  id v13;
  id v14;
  char v15;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  int v19;
  __int16 v20;
  _BOOL4 v21;
  __int16 v22;
  _BOOL4 v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = UNLogConnections;
  if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_DEFAULT))
  {
    v7 = a1[4];
    v8 = a1[6] != 0;
    *(_DWORD *)buf = 138544130;
    v17 = v7;
    v18 = 1024;
    v19 = a2;
    v20 = 1024;
    v21 = v5 != 0;
    v22 = 1024;
    v23 = v8;
    _os_log_impl(&dword_1AA8E4000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Requested authorization [ didGrant: %d hasError: %d hasCompletionHandler: %d ]", buf, 0x1Eu);
  }
  v9 = (void *)a1[6];
  v10 = *(NSObject **)(a1[5] + 32);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __109__UNUserNotificationServiceConnection_requestAuthorizationWithOptions_forBundleIdentifier_completionHandler___block_invoke_7;
  block[3] = &unk_1E57F00B0;
  v15 = a2;
  v13 = v5;
  v14 = v9;
  v11 = v5;
  dispatch_async(v10, block);

}

void __81__UNUserNotificationServiceConnection_deliveredNotificationsForBundleIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;

  objc_msgSend(*(id *)(a1 + 32), "_queue_ensureConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __81__UNUserNotificationServiceConnection_deliveredNotificationsForBundleIdentifier___block_invoke_2;
  v11[3] = &unk_1E57F0128;
  v12 = *(id *)(a1 + 40);
  objc_msgSend(v2, "synchronousRemoteObjectProxyWithErrorHandler:", v11);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 40);
  v8[0] = v3;
  v8[1] = 3221225472;
  v8[2] = __81__UNUserNotificationServiceConnection_deliveredNotificationsForBundleIdentifier___block_invoke_53;
  v8[3] = &unk_1E57F0310;
  v6 = v5;
  v7 = *(_QWORD *)(a1 + 48);
  v9 = v6;
  v10 = v7;
  objc_msgSend(v4, "getDeliveredNotificationsForBundleIdentifier:withCompletionHandler:", v6, v8);

}

void __106__UNUserNotificationServiceConnection_getDeliveredNotificationsForBundleIdentifier_withCompletionHandler___block_invoke(id *a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;

  objc_msgSend(a1[4], "_queue_ensureConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __106__UNUserNotificationServiceConnection_getDeliveredNotificationsForBundleIdentifier_withCompletionHandler___block_invoke_2;
  v13[3] = &unk_1E57F0088;
  v4 = a1[5];
  v5 = a1[4];
  v14 = v4;
  v15 = v5;
  v16 = a1[6];
  objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", v13);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = a1[5];
  v9[0] = v3;
  v9[1] = 3221225472;
  v9[2] = __106__UNUserNotificationServiceConnection_getDeliveredNotificationsForBundleIdentifier_withCompletionHandler___block_invoke_2_55;
  v9[3] = &unk_1E57F03C8;
  v10 = v7;
  v8 = a1[6];
  v11 = a1[4];
  v12 = v8;
  objc_msgSend(v6, "getDeliveredNotificationsForBundleIdentifier:withCompletionHandler:", v10, v9);

}

- (void)getDeliveredNotificationsForBundleIdentifier:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *queue;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = UNLogConnections;
  if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v16 = v6;
    _os_log_impl(&dword_1AA8E4000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Getting delivered notifications", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __106__UNUserNotificationServiceConnection_getDeliveredNotificationsForBundleIdentifier_withCompletionHandler___block_invoke;
  block[3] = &unk_1E57EFB80;
  block[4] = self;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  dispatch_async(queue, block);

}

void __113__UNUserNotificationServiceConnection_removeAllPendingNotificationRequestsForBundleIdentifier_completionHandler___block_invoke(id *a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;

  objc_msgSend(a1[4], "_queue_ensureConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __113__UNUserNotificationServiceConnection_removeAllPendingNotificationRequestsForBundleIdentifier_completionHandler___block_invoke_2;
  v10[3] = &unk_1E57F0218;
  v11 = a1[5];
  v4 = a1[6];
  v12 = a1[4];
  v13 = v4;
  objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v3;
  v8[1] = 3221225472;
  v8[2] = __113__UNUserNotificationServiceConnection_removeAllPendingNotificationRequestsForBundleIdentifier_completionHandler___block_invoke_2_52;
  v8[3] = &unk_1E57F03A0;
  v6 = a1[5];
  v7 = a1[6];
  v8[4] = a1[4];
  v9 = v7;
  objc_msgSend(v5, "removeAllPendingNotificationRequestsForBundleIdentifier:completionHandler:", v6, v8);

}

- (void)removeAllPendingNotificationRequestsForBundleIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *queue;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = UNLogConnections;
  if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v16 = v6;
    _os_log_impl(&dword_1AA8E4000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Removing all pending notification requests", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __113__UNUserNotificationServiceConnection_removeAllPendingNotificationRequestsForBundleIdentifier_completionHandler___block_invoke;
  block[3] = &unk_1E57EFB80;
  block[4] = self;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  dispatch_sync(queue, block);

}

void __106__UNUserNotificationServiceConnection_getNotificationCategoriesForBundleIdentifier_withCompletionHandler___block_invoke(id *a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;

  objc_msgSend(a1[4], "_queue_ensureConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __106__UNUserNotificationServiceConnection_getNotificationCategoriesForBundleIdentifier_withCompletionHandler___block_invoke_2;
  v13[3] = &unk_1E57F0088;
  v4 = a1[5];
  v5 = a1[4];
  v14 = v4;
  v15 = v5;
  v16 = a1[6];
  objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", v13);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = a1[5];
  v9[0] = v3;
  v9[1] = 3221225472;
  v9[2] = __106__UNUserNotificationServiceConnection_getNotificationCategoriesForBundleIdentifier_withCompletionHandler___block_invoke_2_22;
  v9[3] = &unk_1E57F01F0;
  v10 = v7;
  v8 = a1[6];
  v11 = a1[4];
  v12 = v8;
  objc_msgSend(v6, "getNotificationCategoriesForBundleIdentifier:withCompletionHandler:", v10, v9);

}

void __81__UNUserNotificationServiceConnection_notificationCategoriesForBundleIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;

  objc_msgSend(*(id *)(a1 + 32), "_queue_ensureConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __81__UNUserNotificationServiceConnection_notificationCategoriesForBundleIdentifier___block_invoke_2;
  v11[3] = &unk_1E57F0128;
  v12 = *(id *)(a1 + 40);
  objc_msgSend(v2, "synchronousRemoteObjectProxyWithErrorHandler:", v11);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 40);
  v8[0] = v3;
  v8[1] = 3221225472;
  v8[2] = __81__UNUserNotificationServiceConnection_notificationCategoriesForBundleIdentifier___block_invoke_19;
  v8[3] = &unk_1E57F01C8;
  v6 = v5;
  v7 = *(_QWORD *)(a1 + 48);
  v9 = v6;
  v10 = v7;
  objc_msgSend(v4, "getNotificationCategoriesForBundleIdentifier:withCompletionHandler:", v6, v8);

}

- (void)getNotificationCategoriesForBundleIdentifier:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *queue;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = UNLogConnections;
  if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v16 = v6;
    _os_log_impl(&dword_1AA8E4000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Getting notification categories (async)", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __106__UNUserNotificationServiceConnection_getNotificationCategoriesForBundleIdentifier_withCompletionHandler___block_invoke;
  block[3] = &unk_1E57EFB80;
  block[4] = self;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  dispatch_async(queue, block);

}

void __95__UNUserNotificationServiceConnection_setBadgeCount_forBundleIdentifier_withCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  id v13;
  _QWORD v14[4];
  id v15;
  uint64_t v16;
  id v17;

  objc_msgSend(*(id *)(a1 + 32), "_queue_ensureConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __95__UNUserNotificationServiceConnection_setBadgeCount_forBundleIdentifier_withCompletionHandler___block_invoke_2;
  v14[3] = &unk_1E57F0088;
  v4 = *(id *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 32);
  v15 = v4;
  v16 = v5;
  v17 = *(id *)(a1 + 56);
  objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", v14);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(void **)(a1 + 40);
  v8 = *(_QWORD *)(a1 + 48);
  v10[0] = v3;
  v10[1] = 3221225472;
  v10[2] = __95__UNUserNotificationServiceConnection_setBadgeCount_forBundleIdentifier_withCompletionHandler___block_invoke_2_72;
  v10[3] = &unk_1E57F0218;
  v11 = v7;
  v9 = *(id *)(a1 + 56);
  v12 = *(_QWORD *)(a1 + 32);
  v13 = v9;
  objc_msgSend(v6, "setBadgeCount:forBundleIdentifier:withCompletionHandler:", v8, v11, v10);

}

- (void)setBadgeCount:(id)a3 forBundleIdentifier:(id)a4 withCompletionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *queue;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = UNLogConnections;
  if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v21 = v9;
    v22 = 2114;
    v23 = v8;
    _os_log_impl(&dword_1AA8E4000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] Setting badge count to %{public}@", buf, 0x16u);
  }
  queue = self->_queue;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __95__UNUserNotificationServiceConnection_setBadgeCount_forBundleIdentifier_withCompletionHandler___block_invoke;
  v16[3] = &unk_1E57F0240;
  v16[4] = self;
  v17 = v9;
  v18 = v8;
  v19 = v10;
  v13 = v8;
  v14 = v10;
  v15 = v9;
  dispatch_sync(queue, v16);

}

uint64_t __106__UNUserNotificationServiceConnection_getNotificationCategoriesForBundleIdentifier_withCompletionHandler___block_invoke_23(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

void __103__UNUserNotificationServiceConnection_setNotificationTopics_forBundleIdentifier_withCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  id v13;
  _QWORD v14[4];
  id v15;
  uint64_t v16;
  id v17;

  objc_msgSend(*(id *)(a1 + 32), "_queue_ensureConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __103__UNUserNotificationServiceConnection_setNotificationTopics_forBundleIdentifier_withCompletionHandler___block_invoke_2;
  v14[3] = &unk_1E57F0088;
  v4 = *(id *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 32);
  v15 = v4;
  v16 = v5;
  v17 = *(id *)(a1 + 56);
  objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", v14);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(void **)(a1 + 40);
  v8 = *(_QWORD *)(a1 + 48);
  v10[0] = v3;
  v10[1] = 3221225472;
  v10[2] = __103__UNUserNotificationServiceConnection_setNotificationTopics_forBundleIdentifier_withCompletionHandler___block_invoke_2_78;
  v10[3] = &unk_1E57F0218;
  v11 = v7;
  v9 = *(id *)(a1 + 56);
  v12 = *(_QWORD *)(a1 + 32);
  v13 = v9;
  objc_msgSend(v6, "setNotificationTopics:forBundleIdentifier:withCompletionHandler:", v8, v11, v10);

}

- (void)setNotificationTopics:(id)a3 forBundleIdentifier:(id)a4 withCompletionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *queue;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = UNLogConnections;
  if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v21 = v9;
    v22 = 2114;
    v23 = v8;
    _os_log_impl(&dword_1AA8E4000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] Setting topics %{public}@", buf, 0x16u);
  }
  queue = self->_queue;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __103__UNUserNotificationServiceConnection_setNotificationTopics_forBundleIdentifier_withCompletionHandler___block_invoke;
  v16[3] = &unk_1E57F0240;
  v16[4] = self;
  v17 = v9;
  v18 = v8;
  v19 = v10;
  v13 = v8;
  v14 = v10;
  v15 = v9;
  dispatch_sync(queue, v16);

}

- (id)notificationSettingsForTopicsWithBundleIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *queue;
  id v7;
  id v8;
  _QWORD block[5];
  id v11;
  __int128 *p_buf;
  __int128 buf;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = UNLogConnections;
  if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v4;
    _os_log_impl(&dword_1AA8E4000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Getting topic settings (sync)", (uint8_t *)&buf, 0xCu);
  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__1;
  v16 = __Block_byref_object_dispose__1;
  v17 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __89__UNUserNotificationServiceConnection_notificationSettingsForTopicsWithBundleIdentifier___block_invoke;
  block[3] = &unk_1E57F0178;
  block[4] = self;
  v11 = v4;
  p_buf = &buf;
  v7 = v4;
  dispatch_sync(queue, block);
  v8 = *(id *)(*((_QWORD *)&buf + 1) + 40);

  _Block_object_dispose(&buf, 8);
  return v8;
}

- (id)deliveredNotificationsForBundleIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *queue;
  id v7;
  id v8;
  _QWORD block[5];
  id v11;
  __int128 *p_buf;
  __int128 buf;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = UNLogConnections;
  if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v4;
    _os_log_impl(&dword_1AA8E4000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Getting delivered notifications (sync)", (uint8_t *)&buf, 0xCu);
  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__1;
  v16 = __Block_byref_object_dispose__1;
  v17 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __81__UNUserNotificationServiceConnection_deliveredNotificationsForBundleIdentifier___block_invoke;
  block[3] = &unk_1E57F0178;
  block[4] = self;
  v11 = v4;
  p_buf = &buf;
  v7 = v4;
  dispatch_sync(queue, block);
  v8 = *(id *)(*((_QWORD *)&buf + 1) + 40);

  _Block_object_dispose(&buf, 8);
  return v8;
}

- (void)addObserver:(id)a3 forBundleIdentifier:(id)a4
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
  block[2] = __71__UNUserNotificationServiceConnection_addObserver_forBundleIdentifier___block_invoke;
  block[3] = &unk_1E57EFAC8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

uint64_t __71__UNUserNotificationServiceConnection_addObserver_forBundleIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_addObserver:forBundleIdentifier:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)removeObserver:(id)a3 forBundleIdentifier:(id)a4
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
  block[2] = __74__UNUserNotificationServiceConnection_removeObserver_forBundleIdentifier___block_invoke;
  block[3] = &unk_1E57EFAC8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_sync(queue, block);

}

uint64_t __74__UNUserNotificationServiceConnection_removeObserver_forBundleIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_removeObserver:forBundleIdentifier:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)setObservingUserNotifications:(BOOL)a3 forBundleIdentifier:(id)a4
{
  id v6;
  NSObject *queue;
  id v8;
  _QWORD block[5];
  id v10;
  BOOL v11;

  v6 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __89__UNUserNotificationServiceConnection_setObservingUserNotifications_forBundleIdentifier___block_invoke;
  block[3] = &unk_1E57F0038;
  v11 = a3;
  block[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(queue, block);

}

void __89__UNUserNotificationServiceConnection_setObservingUserNotifications_forBundleIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_queue_ensureConnection");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "remoteObjectProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObservingUserNotifications:forBundleIdentifier:", *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40));

}

void __109__UNUserNotificationServiceConnection_requestAuthorizationWithOptions_forBundleIdentifier_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_ERROR))
    __109__UNUserNotificationServiceConnection_requestAuthorizationWithOptions_forBundleIdentifier_completionHandler___block_invoke_2_cold_1();
  v4 = *(void **)(a1 + 48);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 32);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __109__UNUserNotificationServiceConnection_requestAuthorizationWithOptions_forBundleIdentifier_completionHandler___block_invoke_4;
  v7[3] = &unk_1E57F0060;
  v8 = v3;
  v9 = v4;
  v6 = v3;
  dispatch_async(v5, v7);

}

uint64_t __109__UNUserNotificationServiceConnection_requestAuthorizationWithOptions_forBundleIdentifier_completionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, 0, *(_QWORD *)(a1 + 32));
  return result;
}

- (void)requestRemoveAuthorizationForBundleIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *queue;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = UNLogConnections;
  if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v16 = v6;
    _os_log_impl(&dword_1AA8E4000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Requesting remove authorization", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __103__UNUserNotificationServiceConnection_requestRemoveAuthorizationForBundleIdentifier_completionHandler___block_invoke;
  block[3] = &unk_1E57EFB80;
  block[4] = self;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  dispatch_async(queue, block);

}

void __103__UNUserNotificationServiceConnection_requestRemoveAuthorizationForBundleIdentifier_completionHandler___block_invoke(id *a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;

  objc_msgSend(a1[4], "_queue_ensureConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __103__UNUserNotificationServiceConnection_requestRemoveAuthorizationForBundleIdentifier_completionHandler___block_invoke_2;
  v13[3] = &unk_1E57F0088;
  v4 = a1[5];
  v5 = a1[4];
  v14 = v4;
  v15 = v5;
  v16 = a1[6];
  objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", v13);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = a1[5];
  v9[0] = v3;
  v9[1] = 3221225472;
  v9[2] = __103__UNUserNotificationServiceConnection_requestRemoveAuthorizationForBundleIdentifier_completionHandler___block_invoke_2_10;
  v9[3] = &unk_1E57F00D8;
  v10 = v7;
  v8 = a1[6];
  v11 = a1[4];
  v12 = v8;
  objc_msgSend(v6, "requestRemoveAuthorizationForBundleIdentifier:completionHandler:", v10, v9);

}

void __103__UNUserNotificationServiceConnection_requestRemoveAuthorizationForBundleIdentifier_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_ERROR))
    __103__UNUserNotificationServiceConnection_requestRemoveAuthorizationForBundleIdentifier_completionHandler___block_invoke_2_cold_1();
  v4 = *(void **)(a1 + 48);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 32);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __103__UNUserNotificationServiceConnection_requestRemoveAuthorizationForBundleIdentifier_completionHandler___block_invoke_9;
  v7[3] = &unk_1E57F0060;
  v8 = v3;
  v9 = v4;
  v6 = v3;
  dispatch_async(v5, v7);

}

uint64_t __103__UNUserNotificationServiceConnection_requestRemoveAuthorizationForBundleIdentifier_completionHandler___block_invoke_9(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, 0, *(_QWORD *)(a1 + 32));
  return result;
}

void __103__UNUserNotificationServiceConnection_requestRemoveAuthorizationForBundleIdentifier_completionHandler___block_invoke_2_10(_QWORD *a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  _BOOL4 v8;
  void *v9;
  NSObject *v10;
  id v11;
  _QWORD block[4];
  id v13;
  id v14;
  char v15;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  int v19;
  __int16 v20;
  _BOOL4 v21;
  __int16 v22;
  _BOOL4 v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = UNLogConnections;
  if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_DEFAULT))
  {
    v7 = a1[4];
    v8 = a1[6] != 0;
    *(_DWORD *)buf = 138544130;
    v17 = v7;
    v18 = 1024;
    v19 = a2;
    v20 = 1024;
    v21 = v5 != 0;
    v22 = 1024;
    v23 = v8;
    _os_log_impl(&dword_1AA8E4000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Requested remove authorization [ didGrant: %d hasError: %d hasCompletionHandler: %d ]", buf, 0x1Eu);
  }
  v9 = (void *)a1[6];
  v10 = *(NSObject **)(a1[5] + 32);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __103__UNUserNotificationServiceConnection_requestRemoveAuthorizationForBundleIdentifier_completionHandler___block_invoke_11;
  block[3] = &unk_1E57F00B0;
  v15 = a2;
  v13 = v5;
  v14 = v9;
  v11 = v5;
  dispatch_async(v10, block);

}

uint64_t __103__UNUserNotificationServiceConnection_requestRemoveAuthorizationForBundleIdentifier_completionHandler___block_invoke_11(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
  return result;
}

void __79__UNUserNotificationServiceConnection_notificationSettingsForBundleIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_ERROR))
    __79__UNUserNotificationServiceConnection_notificationSettingsForBundleIdentifier___block_invoke_2_cold_1();

}

void __104__UNUserNotificationServiceConnection_getNotificationSettingsForBundleIdentifier_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  _QWORD block[4];
  id v7;

  v3 = a2;
  if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_ERROR))
    __79__UNUserNotificationServiceConnection_notificationSettingsForBundleIdentifier___block_invoke_2_cold_1();
  v4 = *(void **)(a1 + 48);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 32);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __104__UNUserNotificationServiceConnection_getNotificationSettingsForBundleIdentifier_withCompletionHandler___block_invoke_14;
  block[3] = &unk_1E57EFB58;
  v7 = v4;
  dispatch_async(v5, block);

}

uint64_t __104__UNUserNotificationServiceConnection_getNotificationSettingsForBundleIdentifier_withCompletionHandler___block_invoke_14(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

void __81__UNUserNotificationServiceConnection_notificationCategoriesForBundleIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_ERROR))
    __81__UNUserNotificationServiceConnection_notificationCategoriesForBundleIdentifier___block_invoke_2_cold_1();

}

void __106__UNUserNotificationServiceConnection_getNotificationCategoriesForBundleIdentifier_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  _QWORD block[4];
  id v7;

  v3 = a2;
  if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_ERROR))
    __81__UNUserNotificationServiceConnection_notificationCategoriesForBundleIdentifier___block_invoke_2_cold_1();
  v4 = *(void **)(a1 + 48);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 32);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __106__UNUserNotificationServiceConnection_getNotificationCategoriesForBundleIdentifier_withCompletionHandler___block_invoke_21;
  block[3] = &unk_1E57EFB58;
  v7 = v4;
  dispatch_async(v5, block);

}

uint64_t __106__UNUserNotificationServiceConnection_getNotificationCategoriesForBundleIdentifier_withCompletionHandler___block_invoke_21(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

- (void)addNotificationRequest:(id)a3 forBundleIdentifier:(id)a4 withCompletionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *queue;
  void *v21;
  id v22;
  __CFString *v23;
  _QWORD block[5];
  id v25;
  id v26;
  id v27;
  uint8_t buf[4];
  id v29;
  __int16 v30;
  id v31;
  __int16 v32;
  __CFString *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_opt_class();
  UNSafeCast(v11, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = objc_msgSend(v8, "destinations");
    v14 = (id)UNLogConnections;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v12, "identifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "un_logDigest");
      v15 = (id)objc_claimAutoreleasedReturnValue();
      v22 = v10;
      if (v13 == 15)
      {
        v23 = CFSTR("Default");
      }
      else
      {
        UNNotificationDestinationStrings(v13);
        v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v8, "content");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "date");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "un_logString");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v29 = v9;
      v30 = 2114;
      v31 = v15;
      v32 = 2114;
      v33 = v23;
      v34 = 2114;
      v35 = v19;
      _os_log_impl(&dword_1AA8E4000, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@] Adding notification request %{public}@ to destinations: %{public}@, contentDate: %{public}@", buf, 0x2Au);

      if (v13 != 15)
      v10 = v22;
    }

    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __104__UNUserNotificationServiceConnection_addNotificationRequest_forBundleIdentifier_withCompletionHandler___block_invoke;
    block[3] = &unk_1E57F0240;
    block[4] = self;
    v25 = v9;
    v27 = v10;
    v26 = v12;
    dispatch_sync(queue, block);

  }
  else
  {
    v16 = (void *)UNLogConnections;
    if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_ERROR))
      -[UNUserNotificationServiceConnection addNotificationRequest:forBundleIdentifier:withCompletionHandler:].cold.1((uint64_t)v9, v16);
  }

}

void __104__UNUserNotificationServiceConnection_addNotificationRequest_forBundleIdentifier_withCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  id v13;
  _QWORD v14[4];
  id v15;
  uint64_t v16;
  id v17;

  objc_msgSend(*(id *)(a1 + 32), "_queue_ensureConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __104__UNUserNotificationServiceConnection_addNotificationRequest_forBundleIdentifier_withCompletionHandler___block_invoke_2;
  v14[3] = &unk_1E57F0088;
  v4 = *(id *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 32);
  v15 = v4;
  v16 = v5;
  v17 = *(id *)(a1 + 56);
  objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", v14);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(void **)(a1 + 40);
  v8 = *(_QWORD *)(a1 + 48);
  v10[0] = v3;
  v10[1] = 3221225472;
  v10[2] = __104__UNUserNotificationServiceConnection_addNotificationRequest_forBundleIdentifier_withCompletionHandler___block_invoke_2_27;
  v10[3] = &unk_1E57F0218;
  v11 = v7;
  v9 = *(id *)(a1 + 56);
  v12 = *(_QWORD *)(a1 + 32);
  v13 = v9;
  objc_msgSend(v6, "addNotificationRequest:forBundleIdentifier:withCompletionHandler:", v8, v11, v10);

}

void __104__UNUserNotificationServiceConnection_addNotificationRequest_forBundleIdentifier_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_ERROR))
    __104__UNUserNotificationServiceConnection_addNotificationRequest_forBundleIdentifier_withCompletionHandler___block_invoke_2_cold_1();
  v4 = *(void **)(a1 + 48);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 32);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __104__UNUserNotificationServiceConnection_addNotificationRequest_forBundleIdentifier_withCompletionHandler___block_invoke_26;
  v7[3] = &unk_1E57F0060;
  v8 = v3;
  v9 = v4;
  v6 = v3;
  dispatch_async(v5, v7);

}

uint64_t __104__UNUserNotificationServiceConnection_addNotificationRequest_forBundleIdentifier_withCompletionHandler___block_invoke_26(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

void __104__UNUserNotificationServiceConnection_addNotificationRequest_forBundleIdentifier_withCompletionHandler___block_invoke_2_27(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  _BOOL4 v6;
  void *v7;
  NSObject *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  _BOOL4 v16;
  __int16 v17;
  _BOOL4 v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = UNLogConnections;
  if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_DEFAULT))
  {
    v5 = a1[4];
    v6 = a1[6] != 0;
    *(_DWORD *)buf = 138543874;
    v14 = v5;
    v15 = 1024;
    v16 = v3 != 0;
    v17 = 1024;
    v18 = v6;
    _os_log_impl(&dword_1AA8E4000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Added notification request: [ hasError: %d hasCompletionHandler: %d ]", buf, 0x18u);
  }
  v7 = (void *)a1[6];
  v8 = *(NSObject **)(a1[5] + 32);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __104__UNUserNotificationServiceConnection_addNotificationRequest_forBundleIdentifier_withCompletionHandler___block_invoke_28;
  v10[3] = &unk_1E57F0060;
  v11 = v3;
  v12 = v7;
  v9 = v3;
  dispatch_async(v8, v10);

}

uint64_t __104__UNUserNotificationServiceConnection_addNotificationRequest_forBundleIdentifier_withCompletionHandler___block_invoke_28(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

- (void)replaceContentForRequestWithIdentifier:(id)a3 bundleIdentifier:(id)a4 replacementContent:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  NSObject *queue;
  _QWORD block[5];
  id v21;
  id v22;
  id v23;
  id v24;
  uint8_t buf[4];
  id v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = objc_opt_class();
  UNSafeCast(v14, v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)UNLogConnections;
  if (v15)
  {
    if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_DEFAULT))
    {
      v17 = v16;
      objc_msgSend(v10, "un_logDigest");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v26 = v11;
      v27 = 2114;
      v28 = v18;
      _os_log_impl(&dword_1AA8E4000, v17, OS_LOG_TYPE_DEFAULT, "[%{public}@] Replacing notification content %{public}@", buf, 0x16u);

    }
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __132__UNUserNotificationServiceConnection_replaceContentForRequestWithIdentifier_bundleIdentifier_replacementContent_completionHandler___block_invoke;
    block[3] = &unk_1E57F0268;
    block[4] = self;
    v21 = v11;
    v24 = v13;
    v22 = v10;
    v23 = v15;
    dispatch_sync(queue, block);

  }
  else if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_ERROR))
  {
    -[UNUserNotificationServiceConnection replaceContentForRequestWithIdentifier:bundleIdentifier:replacementContent:completionHandler:].cold.1((uint64_t)v11, v16);
  }

}

void __132__UNUserNotificationServiceConnection_replaceContentForRequestWithIdentifier_bundleIdentifier_replacementContent_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  id v14;
  _QWORD v15[4];
  id v16;
  uint64_t v17;
  id v18;

  objc_msgSend(*(id *)(a1 + 32), "_queue_ensureConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __132__UNUserNotificationServiceConnection_replaceContentForRequestWithIdentifier_bundleIdentifier_replacementContent_completionHandler___block_invoke_2;
  v15[3] = &unk_1E57F0088;
  v4 = *(id *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 32);
  v16 = v4;
  v17 = v5;
  v18 = *(id *)(a1 + 64);
  objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", v15);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(void **)(a1 + 40);
  v8 = *(_QWORD *)(a1 + 48);
  v9 = *(_QWORD *)(a1 + 56);
  v11[0] = v3;
  v11[1] = 3221225472;
  v11[2] = __132__UNUserNotificationServiceConnection_replaceContentForRequestWithIdentifier_bundleIdentifier_replacementContent_completionHandler___block_invoke_2_31;
  v11[3] = &unk_1E57F0218;
  v12 = v7;
  v10 = *(id *)(a1 + 64);
  v13 = *(_QWORD *)(a1 + 32);
  v14 = v10;
  objc_msgSend(v6, "replaceContentForRequestWithIdentifier:bundleIdentifier:replacementContent:completionHandler:", v8, v12, v9, v11);

}

void __132__UNUserNotificationServiceConnection_replaceContentForRequestWithIdentifier_bundleIdentifier_replacementContent_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_ERROR))
    __132__UNUserNotificationServiceConnection_replaceContentForRequestWithIdentifier_bundleIdentifier_replacementContent_completionHandler___block_invoke_2_cold_1();
  v4 = *(void **)(a1 + 48);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 32);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __132__UNUserNotificationServiceConnection_replaceContentForRequestWithIdentifier_bundleIdentifier_replacementContent_completionHandler___block_invoke_30;
  v7[3] = &unk_1E57F0060;
  v8 = v3;
  v9 = v4;
  v6 = v3;
  dispatch_async(v5, v7);

}

uint64_t __132__UNUserNotificationServiceConnection_replaceContentForRequestWithIdentifier_bundleIdentifier_replacementContent_completionHandler___block_invoke_30(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

void __132__UNUserNotificationServiceConnection_replaceContentForRequestWithIdentifier_bundleIdentifier_replacementContent_completionHandler___block_invoke_2_31(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  _BOOL4 v6;
  void *v7;
  NSObject *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  _BOOL4 v16;
  __int16 v17;
  _BOOL4 v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = UNLogConnections;
  if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_DEFAULT))
  {
    v5 = a1[4];
    v6 = a1[6] != 0;
    *(_DWORD *)buf = 138543874;
    v14 = v5;
    v15 = 1024;
    v16 = v3 != 0;
    v17 = 1024;
    v18 = v6;
    _os_log_impl(&dword_1AA8E4000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Replaced notification content: [ hasError: %d hasCompletionHandler: %d ]", buf, 0x18u);
  }
  v7 = (void *)a1[6];
  v8 = *(NSObject **)(a1[5] + 32);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __132__UNUserNotificationServiceConnection_replaceContentForRequestWithIdentifier_bundleIdentifier_replacementContent_completionHandler___block_invoke_32;
  v10[3] = &unk_1E57F0060;
  v11 = v3;
  v12 = v7;
  v9 = v3;
  dispatch_async(v8, v10);

}

uint64_t __132__UNUserNotificationServiceConnection_replaceContentForRequestWithIdentifier_bundleIdentifier_replacementContent_completionHandler___block_invoke_32(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

- (void)setNotificationRequests:(id)a3 forBundleIdentifier:(id)a4
{
  -[UNUserNotificationServiceConnection setNotificationRequests:forBundleIdentifier:completionHandler:](self, "setNotificationRequests:forBundleIdentifier:completionHandler:", a3, a4, &__block_literal_global_33);
}

- (void)setNotificationRequests:(id)a3 forBundleIdentifier:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *queue;
  id v17;
  id v18;
  _QWORD block[4];
  id v20;
  id v21;
  UNUserNotificationServiceConnection *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v10 = v7;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v24;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v24 != v13)
          objc_enumerationMutation(v10);
        v15 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v14);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v9, "addObject:", v15);
        else
          NSLog((NSString *)CFSTR("Expected a UNNotificationRequest: %@"), v15);
        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v12);
  }

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __101__UNUserNotificationServiceConnection_setNotificationRequests_forBundleIdentifier_completionHandler___block_invoke;
  block[3] = &unk_1E57EFAC8;
  v20 = v8;
  v21 = v9;
  v22 = self;
  v17 = v9;
  v18 = v8;
  dispatch_sync(queue, block);

}

void __101__UNUserNotificationServiceConnection_setNotificationRequests_forBundleIdentifier_completionHandler___block_invoke(id *a1)
{
  void *v2;
  id v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  uint8_t buf[4];
  id v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = (void *)UNLogConnections;
  if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_DEFAULT))
  {
    v4 = a1[4];
    v3 = a1[5];
    v5 = v2;
    v6 = objc_msgSend(v3, "count");
    objc_msgSend(a1[5], "un_map:", &__block_literal_global_38);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v13 = v4;
    v14 = 2048;
    v15 = v6;
    v16 = 2114;
    v17 = v7;
    _os_log_impl(&dword_1AA8E4000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Setting %ld notification requests %{public}@", buf, 0x20u);

  }
  objc_msgSend(a1[6], "_queue_ensureConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __101__UNUserNotificationServiceConnection_setNotificationRequests_forBundleIdentifier_completionHandler___block_invoke_39;
  v10[3] = &unk_1E57F0128;
  v11 = a1[4];
  objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setNotificationRequests:forBundleIdentifier:", a1[5], a1[4]);

}

id __101__UNUserNotificationServiceConnection_setNotificationRequests_forBundleIdentifier_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "un_logDigest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __101__UNUserNotificationServiceConnection_setNotificationRequests_forBundleIdentifier_completionHandler___block_invoke_39(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_ERROR))
    __101__UNUserNotificationServiceConnection_setNotificationRequests_forBundleIdentifier_completionHandler___block_invoke_39_cold_1();

}

- (id)pendingNotificationRequestsForBundleIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *queue;
  id v7;
  id v8;
  _QWORD block[5];
  id v11;
  __int128 *p_buf;
  __int128 buf;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = UNLogConnections;
  if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v4;
    _os_log_impl(&dword_1AA8E4000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Getting pending notification requests (sync)", (uint8_t *)&buf, 0xCu);
  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__1;
  v16 = __Block_byref_object_dispose__1;
  v17 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __86__UNUserNotificationServiceConnection_pendingNotificationRequestsForBundleIdentifier___block_invoke;
  block[3] = &unk_1E57F0178;
  block[4] = self;
  v11 = v4;
  p_buf = &buf;
  v7 = v4;
  dispatch_sync(queue, block);
  v8 = *(id *)(*((_QWORD *)&buf + 1) + 40);

  _Block_object_dispose(&buf, 8);
  return v8;
}

void __86__UNUserNotificationServiceConnection_pendingNotificationRequestsForBundleIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;

  objc_msgSend(*(id *)(a1 + 32), "_queue_ensureConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __86__UNUserNotificationServiceConnection_pendingNotificationRequestsForBundleIdentifier___block_invoke_2;
  v11[3] = &unk_1E57F0128;
  v12 = *(id *)(a1 + 40);
  objc_msgSend(v2, "synchronousRemoteObjectProxyWithErrorHandler:", v11);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 40);
  v8[0] = v3;
  v8[1] = 3221225472;
  v8[2] = __86__UNUserNotificationServiceConnection_pendingNotificationRequestsForBundleIdentifier___block_invoke_40;
  v8[3] = &unk_1E57F0310;
  v6 = v5;
  v7 = *(_QWORD *)(a1 + 48);
  v9 = v6;
  v10 = v7;
  objc_msgSend(v4, "getPendingNotificationRequestsForBundleIdentifier:withCompletionHandler:", v6, v8);

}

void __86__UNUserNotificationServiceConnection_pendingNotificationRequestsForBundleIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_ERROR))
    __86__UNUserNotificationServiceConnection_pendingNotificationRequestsForBundleIdentifier___block_invoke_2_cold_1();

}

void __86__UNUserNotificationServiceConnection_pendingNotificationRequestsForBundleIdentifier___block_invoke_40(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)UNLogConnections;
  if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = v4;
    v9 = 138543618;
    v10 = v5;
    v11 = 2048;
    v12 = objc_msgSend(v3, "count");
    _os_log_impl(&dword_1AA8E4000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Got %ld pending notification", (uint8_t *)&v9, 0x16u);

  }
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v3;

}

void __111__UNUserNotificationServiceConnection_getPendingNotificationRequestsForBundleIdentifier_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id v10;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __111__UNUserNotificationServiceConnection_getPendingNotificationRequestsForBundleIdentifier_withCompletionHandler___block_invoke_3;
  block[3] = &unk_1E57EFB80;
  v8 = v4;
  v9 = v3;
  v10 = *(id *)(a1 + 48);
  v6 = v3;
  dispatch_async(v5, block);

}

uint64_t __111__UNUserNotificationServiceConnection_getPendingNotificationRequestsForBundleIdentifier_withCompletionHandler___block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t result;

  v2 = UNLogConnections;
  if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_ERROR))
    __111__UNUserNotificationServiceConnection_getPendingNotificationRequestsForBundleIdentifier_withCompletionHandler___block_invoke_3_cold_1(a1, v2, v3);
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

void __111__UNUserNotificationServiceConnection_getPendingNotificationRequestsForBundleIdentifier_withCompletionHandler___block_invoke_42(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id v10;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __111__UNUserNotificationServiceConnection_getPendingNotificationRequestsForBundleIdentifier_withCompletionHandler___block_invoke_2_43;
  block[3] = &unk_1E57EFB80;
  v8 = v4;
  v9 = v3;
  v10 = *(id *)(a1 + 48);
  v6 = v3;
  dispatch_async(v5, block);

}

uint64_t __111__UNUserNotificationServiceConnection_getPendingNotificationRequestsForBundleIdentifier_withCompletionHandler___block_invoke_2_43(_QWORD *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  _BOOL4 v7;
  uint64_t result;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  _BOOL4 v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = (void *)UNLogConnections;
  if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_DEFAULT))
  {
    v4 = a1[4];
    v3 = (void *)a1[5];
    v5 = v2;
    v6 = objc_msgSend(v3, "count");
    v7 = a1[6] != 0;
    v9 = 138543874;
    v10 = v4;
    v11 = 2048;
    v12 = v6;
    v13 = 1024;
    v14 = v7;
    _os_log_impl(&dword_1AA8E4000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Got %ld pending notification [ hasCompletionHandler: %d ]", (uint8_t *)&v9, 0x1Cu);

  }
  result = a1[6];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, a1[5]);
  return result;
}

void __126__UNUserNotificationServiceConnection_removePendingNotificationRequestsWithIdentifiers_forBundleIdentifier_completionHandler___block_invoke_46(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  _QWORD v9[5];
  id v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  id v14;

  objc_msgSend(*(id *)(a1 + 32), "_queue_ensureConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __126__UNUserNotificationServiceConnection_removePendingNotificationRequestsWithIdentifiers_forBundleIdentifier_completionHandler___block_invoke_2;
  v11[3] = &unk_1E57F0218;
  v12 = *(id *)(a1 + 40);
  v4 = *(id *)(a1 + 56);
  v13 = *(_QWORD *)(a1 + 32);
  v14 = v4;
  objc_msgSend(v2, "synchronousRemoteObjectProxyWithErrorHandler:", v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 48);
  v9[0] = v3;
  v9[1] = 3221225472;
  v9[2] = __126__UNUserNotificationServiceConnection_removePendingNotificationRequestsWithIdentifiers_forBundleIdentifier_completionHandler___block_invoke_2_48;
  v9[3] = &unk_1E57F03A0;
  v8 = *(id *)(a1 + 56);
  v9[4] = *(_QWORD *)(a1 + 32);
  v10 = v8;
  objc_msgSend(v5, "removePendingNotificationRequestsWithIdentifiers:forBundleIdentifier:completionHandler:", v6, v7, v9);

}

void __126__UNUserNotificationServiceConnection_removePendingNotificationRequestsWithIdentifiers_forBundleIdentifier_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_ERROR))
    __126__UNUserNotificationServiceConnection_removePendingNotificationRequestsWithIdentifiers_forBundleIdentifier_completionHandler___block_invoke_2_cold_1();
  v4 = *(void **)(a1 + 48);
  if (v4)
  {
    v5 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 32);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __126__UNUserNotificationServiceConnection_removePendingNotificationRequestsWithIdentifiers_forBundleIdentifier_completionHandler___block_invoke_47;
    v6[3] = &unk_1E57F0060;
    v8 = v4;
    v7 = v3;
    dispatch_async(v5, v6);

  }
}

uint64_t __126__UNUserNotificationServiceConnection_removePendingNotificationRequestsWithIdentifiers_forBundleIdentifier_completionHandler___block_invoke_47(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __126__UNUserNotificationServiceConnection_removePendingNotificationRequestsWithIdentifiers_forBundleIdentifier_completionHandler___block_invoke_2_48(uint64_t a1, char a2, void *a3)
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
    v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __126__UNUserNotificationServiceConnection_removePendingNotificationRequestsWithIdentifiers_forBundleIdentifier_completionHandler___block_invoke_3;
    block[3] = &unk_1E57F00B0;
    v10 = v6;
    v11 = a2;
    v9 = v5;
    dispatch_async(v7, block);

  }
}

uint64_t __126__UNUserNotificationServiceConnection_removePendingNotificationRequestsWithIdentifiers_forBundleIdentifier_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

- (void)removeSimilarNotificationRequests:(id)a3 forBundleIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  NSObject *queue;
  id v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  uint8_t buf[4];
  id v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)UNLogConnections;
  if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_DEFAULT))
  {
    v12 = v11;
    *(_DWORD *)buf = 138543618;
    v22 = v9;
    v23 = 2048;
    v24 = objc_msgSend(v8, "count");
    _os_log_impl(&dword_1AA8E4000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] Removing %ld similar pending notification requests", buf, 0x16u);

  }
  queue = self->_queue;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __111__UNUserNotificationServiceConnection_removeSimilarNotificationRequests_forBundleIdentifier_completionHandler___block_invoke;
  v17[3] = &unk_1E57F0240;
  v17[4] = self;
  v18 = v9;
  v19 = v8;
  v20 = v10;
  v14 = v8;
  v15 = v10;
  v16 = v9;
  dispatch_sync(queue, v17);

}

void __111__UNUserNotificationServiceConnection_removeSimilarNotificationRequests_forBundleIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  _QWORD v9[5];
  id v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  id v14;

  objc_msgSend(*(id *)(a1 + 32), "_queue_ensureConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __111__UNUserNotificationServiceConnection_removeSimilarNotificationRequests_forBundleIdentifier_completionHandler___block_invoke_2;
  v11[3] = &unk_1E57F0218;
  v12 = *(id *)(a1 + 40);
  v4 = *(id *)(a1 + 56);
  v13 = *(_QWORD *)(a1 + 32);
  v14 = v4;
  objc_msgSend(v2, "synchronousRemoteObjectProxyWithErrorHandler:", v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 48);
  v9[0] = v3;
  v9[1] = 3221225472;
  v9[2] = __111__UNUserNotificationServiceConnection_removeSimilarNotificationRequests_forBundleIdentifier_completionHandler___block_invoke_2_50;
  v9[3] = &unk_1E57F03A0;
  v8 = *(id *)(a1 + 56);
  v9[4] = *(_QWORD *)(a1 + 32);
  v10 = v8;
  objc_msgSend(v5, "removeSimilarNotificationRequests:forBundleIdentifier:completionHandler:", v6, v7, v9);

}

void __111__UNUserNotificationServiceConnection_removeSimilarNotificationRequests_forBundleIdentifier_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_ERROR))
    __111__UNUserNotificationServiceConnection_removeSimilarNotificationRequests_forBundleIdentifier_completionHandler___block_invoke_2_cold_1();
  v4 = *(void **)(a1 + 48);
  if (v4)
  {
    v5 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 32);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __111__UNUserNotificationServiceConnection_removeSimilarNotificationRequests_forBundleIdentifier_completionHandler___block_invoke_49;
    v6[3] = &unk_1E57F0060;
    v8 = v4;
    v7 = v3;
    dispatch_async(v5, v6);

  }
}

uint64_t __111__UNUserNotificationServiceConnection_removeSimilarNotificationRequests_forBundleIdentifier_completionHandler___block_invoke_49(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __111__UNUserNotificationServiceConnection_removeSimilarNotificationRequests_forBundleIdentifier_completionHandler___block_invoke_2_50(uint64_t a1, char a2, void *a3)
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
    v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __111__UNUserNotificationServiceConnection_removeSimilarNotificationRequests_forBundleIdentifier_completionHandler___block_invoke_3;
    block[3] = &unk_1E57F00B0;
    v10 = v6;
    v11 = a2;
    v9 = v5;
    dispatch_async(v7, block);

  }
}

uint64_t __111__UNUserNotificationServiceConnection_removeSimilarNotificationRequests_forBundleIdentifier_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

void __113__UNUserNotificationServiceConnection_removeAllPendingNotificationRequestsForBundleIdentifier_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_ERROR))
    __113__UNUserNotificationServiceConnection_removeAllPendingNotificationRequestsForBundleIdentifier_completionHandler___block_invoke_2_cold_1();
  v4 = *(void **)(a1 + 48);
  if (v4)
  {
    v5 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 32);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __113__UNUserNotificationServiceConnection_removeAllPendingNotificationRequestsForBundleIdentifier_completionHandler___block_invoke_51;
    v6[3] = &unk_1E57F0060;
    v8 = v4;
    v7 = v3;
    dispatch_async(v5, v6);

  }
}

uint64_t __113__UNUserNotificationServiceConnection_removeAllPendingNotificationRequestsForBundleIdentifier_completionHandler___block_invoke_51(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __113__UNUserNotificationServiceConnection_removeAllPendingNotificationRequestsForBundleIdentifier_completionHandler___block_invoke_2_52(uint64_t a1, char a2, void *a3)
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
    v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __113__UNUserNotificationServiceConnection_removeAllPendingNotificationRequestsForBundleIdentifier_completionHandler___block_invoke_3;
    block[3] = &unk_1E57F00B0;
    v10 = v6;
    v11 = a2;
    v9 = v5;
    dispatch_async(v7, block);

  }
}

uint64_t __113__UNUserNotificationServiceConnection_removeAllPendingNotificationRequestsForBundleIdentifier_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

void __81__UNUserNotificationServiceConnection_deliveredNotificationsForBundleIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_ERROR))
    __81__UNUserNotificationServiceConnection_deliveredNotificationsForBundleIdentifier___block_invoke_2_cold_1();

}

void __81__UNUserNotificationServiceConnection_deliveredNotificationsForBundleIdentifier___block_invoke_53(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)UNLogConnections;
  if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = v4;
    v9 = 138543618;
    v10 = v5;
    v11 = 2048;
    v12 = objc_msgSend(v3, "count");
    _os_log_impl(&dword_1AA8E4000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Got %ld delivered notifications", (uint8_t *)&v9, 0x16u);

  }
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v3;

}

void __106__UNUserNotificationServiceConnection_getDeliveredNotificationsForBundleIdentifier_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  _QWORD block[4];
  id v7;

  v3 = a2;
  if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_ERROR))
    __81__UNUserNotificationServiceConnection_deliveredNotificationsForBundleIdentifier___block_invoke_2_cold_1();
  v4 = *(void **)(a1 + 48);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 32);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __106__UNUserNotificationServiceConnection_getDeliveredNotificationsForBundleIdentifier_withCompletionHandler___block_invoke_54;
  block[3] = &unk_1E57EFB58;
  v7 = v4;
  dispatch_async(v5, block);

}

uint64_t __106__UNUserNotificationServiceConnection_getDeliveredNotificationsForBundleIdentifier_withCompletionHandler___block_invoke_54(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

void __106__UNUserNotificationServiceConnection_getDeliveredNotificationsForBundleIdentifier_withCompletionHandler___block_invoke_2_55(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  _BOOL4 v8;
  void *v9;
  NSObject *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  _BOOL4 v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)UNLogConnections;
  if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_DEFAULT))
  {
    v5 = a1[4];
    v6 = v4;
    v7 = objc_msgSend(v3, "count");
    v8 = a1[6] != 0;
    *(_DWORD *)buf = 138543874;
    v16 = v5;
    v17 = 2048;
    v18 = v7;
    v19 = 1024;
    v20 = v8;
    _os_log_impl(&dword_1AA8E4000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Got %ld delivered notifications [ hasCompletionHandler: %d ]", buf, 0x1Cu);

  }
  v9 = (void *)a1[6];
  v10 = *(NSObject **)(a1[5] + 32);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __106__UNUserNotificationServiceConnection_getDeliveredNotificationsForBundleIdentifier_withCompletionHandler___block_invoke_56;
  v12[3] = &unk_1E57F0060;
  v13 = v3;
  v14 = v9;
  v11 = v3;
  dispatch_async(v10, v12);

}

uint64_t __106__UNUserNotificationServiceConnection_getDeliveredNotificationsForBundleIdentifier_withCompletionHandler___block_invoke_56(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

void __121__UNUserNotificationServiceConnection_removeDeliveredNotificationsWithIdentifiers_forBundleIdentifier_completionHandler___block_invoke_58(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  _QWORD v9[5];
  id v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  id v14;

  objc_msgSend(*(id *)(a1 + 32), "_queue_ensureConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __121__UNUserNotificationServiceConnection_removeDeliveredNotificationsWithIdentifiers_forBundleIdentifier_completionHandler___block_invoke_2;
  v11[3] = &unk_1E57F0218;
  v12 = *(id *)(a1 + 40);
  v4 = *(id *)(a1 + 56);
  v13 = *(_QWORD *)(a1 + 32);
  v14 = v4;
  objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 48);
  v9[0] = v3;
  v9[1] = 3221225472;
  v9[2] = __121__UNUserNotificationServiceConnection_removeDeliveredNotificationsWithIdentifiers_forBundleIdentifier_completionHandler___block_invoke_2_60;
  v9[3] = &unk_1E57F03A0;
  v8 = *(id *)(a1 + 56);
  v9[4] = *(_QWORD *)(a1 + 32);
  v10 = v8;
  objc_msgSend(v5, "removeDeliveredNotificationsWithIdentifiers:forBundleIdentifier:completionHandler:", v6, v7, v9);

}

void __121__UNUserNotificationServiceConnection_removeDeliveredNotificationsWithIdentifiers_forBundleIdentifier_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_ERROR))
    __121__UNUserNotificationServiceConnection_removeDeliveredNotificationsWithIdentifiers_forBundleIdentifier_completionHandler___block_invoke_2_cold_1();
  v4 = *(void **)(a1 + 48);
  if (v4)
  {
    v5 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 32);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __121__UNUserNotificationServiceConnection_removeDeliveredNotificationsWithIdentifiers_forBundleIdentifier_completionHandler___block_invoke_59;
    v6[3] = &unk_1E57F0060;
    v8 = v4;
    v7 = v3;
    dispatch_async(v5, v6);

  }
}

uint64_t __121__UNUserNotificationServiceConnection_removeDeliveredNotificationsWithIdentifiers_forBundleIdentifier_completionHandler___block_invoke_59(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __121__UNUserNotificationServiceConnection_removeDeliveredNotificationsWithIdentifiers_forBundleIdentifier_completionHandler___block_invoke_2_60(uint64_t a1, char a2, void *a3)
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
    v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __121__UNUserNotificationServiceConnection_removeDeliveredNotificationsWithIdentifiers_forBundleIdentifier_completionHandler___block_invoke_3;
    block[3] = &unk_1E57F00B0;
    v10 = v6;
    v11 = a2;
    v9 = v5;
    dispatch_async(v7, block);

  }
}

uint64_t __121__UNUserNotificationServiceConnection_removeDeliveredNotificationsWithIdentifiers_forBundleIdentifier_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

- (void)removeAllDeliveredNotificationsForBundleIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *queue;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = UNLogConnections;
  if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v16 = v6;
    _os_log_impl(&dword_1AA8E4000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Removing all delivered notifications", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __108__UNUserNotificationServiceConnection_removeAllDeliveredNotificationsForBundleIdentifier_completionHandler___block_invoke;
  block[3] = &unk_1E57EFB80;
  block[4] = self;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  dispatch_sync(queue, block);

}

void __108__UNUserNotificationServiceConnection_removeAllDeliveredNotificationsForBundleIdentifier_completionHandler___block_invoke(id *a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;

  objc_msgSend(a1[4], "_queue_ensureConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __108__UNUserNotificationServiceConnection_removeAllDeliveredNotificationsForBundleIdentifier_completionHandler___block_invoke_2;
  v10[3] = &unk_1E57F0218;
  v11 = a1[5];
  v4 = a1[6];
  v12 = a1[4];
  v13 = v4;
  objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v3;
  v8[1] = 3221225472;
  v8[2] = __108__UNUserNotificationServiceConnection_removeAllDeliveredNotificationsForBundleIdentifier_completionHandler___block_invoke_2_62;
  v8[3] = &unk_1E57F03A0;
  v6 = a1[5];
  v7 = a1[6];
  v8[4] = a1[4];
  v9 = v7;
  objc_msgSend(v5, "removeAllDeliveredNotificationsForBundleIdentifier:completionHandler:", v6, v8);

}

void __108__UNUserNotificationServiceConnection_removeAllDeliveredNotificationsForBundleIdentifier_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_ERROR))
    __108__UNUserNotificationServiceConnection_removeAllDeliveredNotificationsForBundleIdentifier_completionHandler___block_invoke_2_cold_1();
  v4 = *(void **)(a1 + 48);
  if (v4)
  {
    v5 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 32);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __108__UNUserNotificationServiceConnection_removeAllDeliveredNotificationsForBundleIdentifier_completionHandler___block_invoke_61;
    v6[3] = &unk_1E57F0060;
    v8 = v4;
    v7 = v3;
    dispatch_async(v5, v6);

  }
}

uint64_t __108__UNUserNotificationServiceConnection_removeAllDeliveredNotificationsForBundleIdentifier_completionHandler___block_invoke_61(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __108__UNUserNotificationServiceConnection_removeAllDeliveredNotificationsForBundleIdentifier_completionHandler___block_invoke_2_62(uint64_t a1, char a2, void *a3)
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
    v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __108__UNUserNotificationServiceConnection_removeAllDeliveredNotificationsForBundleIdentifier_completionHandler___block_invoke_3;
    block[3] = &unk_1E57F00B0;
    v10 = v6;
    v11 = a2;
    v9 = v5;
    dispatch_async(v7, block);

  }
}

uint64_t __108__UNUserNotificationServiceConnection_removeAllDeliveredNotificationsForBundleIdentifier_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

void __70__UNUserNotificationServiceConnection_badgeNumberForBundleIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_ERROR))
    __70__UNUserNotificationServiceConnection_badgeNumberForBundleIdentifier___block_invoke_2_cold_1();

}

void __70__UNUserNotificationServiceConnection_badgeNumberForBundleIdentifier___block_invoke_63(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = UNLogConnections;
  if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v9 = 138543618;
    v10 = v5;
    v11 = 2112;
    v12 = v6;
    _os_log_impl(&dword_1AA8E4000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Got badge number [ badge: %@ ]", (uint8_t *)&v9, 0x16u);
  }
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v3;

}

- (void)getBadgeNumberForBundleIdentifier:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *queue;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = UNLogConnections;
  if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v16 = v6;
    _os_log_impl(&dword_1AA8E4000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Getting badge number (async)", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __95__UNUserNotificationServiceConnection_getBadgeNumberForBundleIdentifier_withCompletionHandler___block_invoke;
  block[3] = &unk_1E57EFB80;
  block[4] = self;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  dispatch_async(queue, block);

}

void __95__UNUserNotificationServiceConnection_getBadgeNumberForBundleIdentifier_withCompletionHandler___block_invoke(id *a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;

  objc_msgSend(a1[4], "_queue_ensureConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __95__UNUserNotificationServiceConnection_getBadgeNumberForBundleIdentifier_withCompletionHandler___block_invoke_2;
  v13[3] = &unk_1E57F0088;
  v4 = a1[5];
  v5 = a1[4];
  v14 = v4;
  v15 = v5;
  v16 = a1[6];
  objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", v13);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = a1[5];
  v9[0] = v3;
  v9[1] = 3221225472;
  v9[2] = __95__UNUserNotificationServiceConnection_getBadgeNumberForBundleIdentifier_withCompletionHandler___block_invoke_2_66;
  v9[3] = &unk_1E57F0438;
  v10 = v7;
  v8 = a1[6];
  v11 = a1[4];
  v12 = v8;
  objc_msgSend(v6, "getBadgeNumberForBundleIdentifier:withCompletionHandler:", v10, v9);

}

void __95__UNUserNotificationServiceConnection_getBadgeNumberForBundleIdentifier_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  _QWORD block[4];
  id v7;

  v3 = a2;
  if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_ERROR))
    __70__UNUserNotificationServiceConnection_badgeNumberForBundleIdentifier___block_invoke_2_cold_1();
  v4 = *(void **)(a1 + 48);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 32);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __95__UNUserNotificationServiceConnection_getBadgeNumberForBundleIdentifier_withCompletionHandler___block_invoke_65;
  block[3] = &unk_1E57EFB58;
  v7 = v4;
  dispatch_async(v5, block);

}

uint64_t __95__UNUserNotificationServiceConnection_getBadgeNumberForBundleIdentifier_withCompletionHandler___block_invoke_65(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

void __95__UNUserNotificationServiceConnection_getBadgeNumberForBundleIdentifier_withCompletionHandler___block_invoke_2_66(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  _BOOL4 v6;
  void *v7;
  NSObject *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  id v16;
  __int16 v17;
  _BOOL4 v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = UNLogConnections;
  if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_DEFAULT))
  {
    v5 = a1[4];
    v6 = a1[6] != 0;
    *(_DWORD *)buf = 138543874;
    v14 = v5;
    v15 = 2112;
    v16 = v3;
    v17 = 1024;
    v18 = v6;
    _os_log_impl(&dword_1AA8E4000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Got badge number [ badge: %@ hasCompletionHandler: %d ]", buf, 0x1Cu);
  }
  v7 = (void *)a1[6];
  v8 = *(NSObject **)(a1[5] + 32);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __95__UNUserNotificationServiceConnection_getBadgeNumberForBundleIdentifier_withCompletionHandler___block_invoke_67;
  v10[3] = &unk_1E57F0060;
  v11 = v3;
  v12 = v7;
  v9 = v3;
  dispatch_async(v8, v10);

}

uint64_t __95__UNUserNotificationServiceConnection_getBadgeNumberForBundleIdentifier_withCompletionHandler___block_invoke_67(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

void __96__UNUserNotificationServiceConnection_setBadgeNumber_forBundleIdentifier_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_ERROR))
    __96__UNUserNotificationServiceConnection_setBadgeNumber_forBundleIdentifier_withCompletionHandler___block_invoke_2_cold_1();
  v4 = *(void **)(a1 + 48);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 32);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __96__UNUserNotificationServiceConnection_setBadgeNumber_forBundleIdentifier_withCompletionHandler___block_invoke_68;
  v7[3] = &unk_1E57F0060;
  v8 = v3;
  v9 = v4;
  v6 = v3;
  dispatch_async(v5, v7);

}

uint64_t __96__UNUserNotificationServiceConnection_setBadgeNumber_forBundleIdentifier_withCompletionHandler___block_invoke_68(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

void __96__UNUserNotificationServiceConnection_setBadgeNumber_forBundleIdentifier_withCompletionHandler___block_invoke_2_69(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  _BOOL4 v6;
  void *v7;
  NSObject *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  _BOOL4 v16;
  __int16 v17;
  _BOOL4 v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = UNLogConnections;
  if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_DEFAULT))
  {
    v5 = a1[4];
    v6 = a1[6] != 0;
    *(_DWORD *)buf = 138543874;
    v14 = v5;
    v15 = 1024;
    v16 = v6;
    v17 = 1024;
    v18 = v3 != 0;
    _os_log_impl(&dword_1AA8E4000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Set badge number [ hasCompletionHandler: %d hasError: %d ]", buf, 0x18u);
  }
  v7 = (void *)a1[6];
  v8 = *(NSObject **)(a1[5] + 32);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __96__UNUserNotificationServiceConnection_setBadgeNumber_forBundleIdentifier_withCompletionHandler___block_invoke_70;
  v10[3] = &unk_1E57F0060;
  v11 = v3;
  v12 = v7;
  v9 = v3;
  dispatch_async(v8, v10);

}

uint64_t __96__UNUserNotificationServiceConnection_setBadgeNumber_forBundleIdentifier_withCompletionHandler___block_invoke_70(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

void __95__UNUserNotificationServiceConnection_setBadgeCount_forBundleIdentifier_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_ERROR))
    __95__UNUserNotificationServiceConnection_setBadgeCount_forBundleIdentifier_withCompletionHandler___block_invoke_2_cold_1();
  v4 = *(void **)(a1 + 48);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 32);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __95__UNUserNotificationServiceConnection_setBadgeCount_forBundleIdentifier_withCompletionHandler___block_invoke_71;
  v7[3] = &unk_1E57F0060;
  v8 = v3;
  v9 = v4;
  v6 = v3;
  dispatch_async(v5, v7);

}

uint64_t __95__UNUserNotificationServiceConnection_setBadgeCount_forBundleIdentifier_withCompletionHandler___block_invoke_71(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

void __95__UNUserNotificationServiceConnection_setBadgeCount_forBundleIdentifier_withCompletionHandler___block_invoke_2_72(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  _BOOL4 v6;
  void *v7;
  NSObject *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  _BOOL4 v16;
  __int16 v17;
  _BOOL4 v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = UNLogConnections;
  if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_DEFAULT))
  {
    v5 = a1[4];
    v6 = a1[6] != 0;
    *(_DWORD *)buf = 138543874;
    v14 = v5;
    v15 = 1024;
    v16 = v6;
    v17 = 1024;
    v18 = v3 != 0;
    _os_log_impl(&dword_1AA8E4000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Set badge count [ hasCompletionHandler: %d hasError: %d ]", buf, 0x18u);
  }
  v7 = (void *)a1[6];
  v8 = *(NSObject **)(a1[5] + 32);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __95__UNUserNotificationServiceConnection_setBadgeCount_forBundleIdentifier_withCompletionHandler___block_invoke_73;
  v10[3] = &unk_1E57F0060;
  v11 = v3;
  v12 = v7;
  v9 = v3;
  dispatch_async(v8, v10);

}

uint64_t __95__UNUserNotificationServiceConnection_setBadgeCount_forBundleIdentifier_withCompletionHandler___block_invoke_73(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

- (void)setBadgeString:(id)a3 forBundleIdentifier:(id)a4 withCompletionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *queue;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = UNLogConnections;
  if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v21 = v9;
    v22 = 2114;
    v23 = v8;
    _os_log_impl(&dword_1AA8E4000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] Setting badge string to %{public}@", buf, 0x16u);
  }
  queue = self->_queue;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __96__UNUserNotificationServiceConnection_setBadgeString_forBundleIdentifier_withCompletionHandler___block_invoke;
  v16[3] = &unk_1E57F0240;
  v16[4] = self;
  v17 = v9;
  v18 = v8;
  v19 = v10;
  v13 = v8;
  v14 = v10;
  v15 = v9;
  dispatch_sync(queue, v16);

}

void __96__UNUserNotificationServiceConnection_setBadgeString_forBundleIdentifier_withCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  id v13;
  _QWORD v14[4];
  id v15;
  uint64_t v16;
  id v17;

  objc_msgSend(*(id *)(a1 + 32), "_queue_ensureConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __96__UNUserNotificationServiceConnection_setBadgeString_forBundleIdentifier_withCompletionHandler___block_invoke_2;
  v14[3] = &unk_1E57F0088;
  v4 = *(id *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 32);
  v15 = v4;
  v16 = v5;
  v17 = *(id *)(a1 + 56);
  objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", v14);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(void **)(a1 + 40);
  v8 = *(_QWORD *)(a1 + 48);
  v10[0] = v3;
  v10[1] = 3221225472;
  v10[2] = __96__UNUserNotificationServiceConnection_setBadgeString_forBundleIdentifier_withCompletionHandler___block_invoke_2_75;
  v10[3] = &unk_1E57F0218;
  v11 = v7;
  v9 = *(id *)(a1 + 56);
  v12 = *(_QWORD *)(a1 + 32);
  v13 = v9;
  objc_msgSend(v6, "setBadgeString:forBundleIdentifier:withCompletionHandler:", v8, v11, v10);

}

void __96__UNUserNotificationServiceConnection_setBadgeString_forBundleIdentifier_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_ERROR))
    __96__UNUserNotificationServiceConnection_setBadgeString_forBundleIdentifier_withCompletionHandler___block_invoke_2_cold_1();
  v4 = *(void **)(a1 + 48);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 32);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __96__UNUserNotificationServiceConnection_setBadgeString_forBundleIdentifier_withCompletionHandler___block_invoke_74;
  v7[3] = &unk_1E57F0060;
  v8 = v3;
  v9 = v4;
  v6 = v3;
  dispatch_async(v5, v7);

}

uint64_t __96__UNUserNotificationServiceConnection_setBadgeString_forBundleIdentifier_withCompletionHandler___block_invoke_74(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

void __96__UNUserNotificationServiceConnection_setBadgeString_forBundleIdentifier_withCompletionHandler___block_invoke_2_75(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  _BOOL4 v6;
  void *v7;
  NSObject *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  _BOOL4 v16;
  __int16 v17;
  _BOOL4 v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = UNLogConnections;
  if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_DEFAULT))
  {
    v5 = a1[4];
    v6 = a1[6] != 0;
    *(_DWORD *)buf = 138543874;
    v14 = v5;
    v15 = 1024;
    v16 = v6;
    v17 = 1024;
    v18 = v3 != 0;
    _os_log_impl(&dword_1AA8E4000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Set badge string [ hasCompletionHandler: %d hasError: %d ]", buf, 0x18u);
  }
  v7 = (void *)a1[6];
  v8 = *(NSObject **)(a1[5] + 32);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __96__UNUserNotificationServiceConnection_setBadgeString_forBundleIdentifier_withCompletionHandler___block_invoke_76;
  v10[3] = &unk_1E57F0060;
  v11 = v3;
  v12 = v7;
  v9 = v3;
  dispatch_async(v8, v10);

}

uint64_t __96__UNUserNotificationServiceConnection_setBadgeString_forBundleIdentifier_withCompletionHandler___block_invoke_76(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

void __103__UNUserNotificationServiceConnection_setNotificationTopics_forBundleIdentifier_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_ERROR))
    __103__UNUserNotificationServiceConnection_setNotificationTopics_forBundleIdentifier_withCompletionHandler___block_invoke_2_cold_1();
  v4 = *(void **)(a1 + 48);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 32);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __103__UNUserNotificationServiceConnection_setNotificationTopics_forBundleIdentifier_withCompletionHandler___block_invoke_77;
  v7[3] = &unk_1E57F0060;
  v8 = v3;
  v9 = v4;
  v6 = v3;
  dispatch_async(v5, v7);

}

uint64_t __103__UNUserNotificationServiceConnection_setNotificationTopics_forBundleIdentifier_withCompletionHandler___block_invoke_77(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

void __103__UNUserNotificationServiceConnection_setNotificationTopics_forBundleIdentifier_withCompletionHandler___block_invoke_2_78(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  _BOOL4 v6;
  void *v7;
  NSObject *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  _BOOL4 v16;
  __int16 v17;
  _BOOL4 v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = UNLogConnections;
  if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_DEFAULT))
  {
    v5 = a1[4];
    v6 = a1[6] != 0;
    *(_DWORD *)buf = 138543874;
    v14 = v5;
    v15 = 1024;
    v16 = v6;
    v17 = 1024;
    v18 = v3 != 0;
    _os_log_impl(&dword_1AA8E4000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Set topics [ hasCompletionHandler: %d hasError: %d ]", buf, 0x18u);
  }
  v7 = (void *)a1[6];
  v8 = *(NSObject **)(a1[5] + 32);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __103__UNUserNotificationServiceConnection_setNotificationTopics_forBundleIdentifier_withCompletionHandler___block_invoke_79;
  v10[3] = &unk_1E57F0060;
  v11 = v3;
  v12 = v7;
  v9 = v3;
  dispatch_async(v8, v10);

}

uint64_t __103__UNUserNotificationServiceConnection_setNotificationTopics_forBundleIdentifier_withCompletionHandler___block_invoke_79(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

- (void)getNotificationTopicsForBundleIdentifier:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *queue;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = UNLogConnections;
  if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v16 = v6;
    _os_log_impl(&dword_1AA8E4000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Getting topics", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __102__UNUserNotificationServiceConnection_getNotificationTopicsForBundleIdentifier_withCompletionHandler___block_invoke;
  block[3] = &unk_1E57EFB80;
  block[4] = self;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  dispatch_async(queue, block);

}

void __102__UNUserNotificationServiceConnection_getNotificationTopicsForBundleIdentifier_withCompletionHandler___block_invoke(id *a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;

  objc_msgSend(a1[4], "_queue_ensureConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __102__UNUserNotificationServiceConnection_getNotificationTopicsForBundleIdentifier_withCompletionHandler___block_invoke_2;
  v13[3] = &unk_1E57F0088;
  v4 = a1[5];
  v5 = a1[4];
  v14 = v4;
  v15 = v5;
  v16 = a1[6];
  objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", v13);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = a1[5];
  v9[0] = v3;
  v9[1] = 3221225472;
  v9[2] = __102__UNUserNotificationServiceConnection_getNotificationTopicsForBundleIdentifier_withCompletionHandler___block_invoke_2_81;
  v9[3] = &unk_1E57F01F0;
  v10 = v7;
  v8 = a1[6];
  v11 = a1[4];
  v12 = v8;
  objc_msgSend(v6, "getNotificationTopicsForBundleIdentifier:withCompletionHandler:", v10, v9);

}

void __102__UNUserNotificationServiceConnection_getNotificationTopicsForBundleIdentifier_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  _QWORD block[4];
  id v7;

  v3 = a2;
  if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_ERROR))
    __102__UNUserNotificationServiceConnection_getNotificationTopicsForBundleIdentifier_withCompletionHandler___block_invoke_2_cold_1();
  v4 = *(void **)(a1 + 48);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 32);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __102__UNUserNotificationServiceConnection_getNotificationTopicsForBundleIdentifier_withCompletionHandler___block_invoke_80;
  block[3] = &unk_1E57EFB58;
  v7 = v4;
  dispatch_async(v5, block);

}

uint64_t __102__UNUserNotificationServiceConnection_getNotificationTopicsForBundleIdentifier_withCompletionHandler___block_invoke_80(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

void __102__UNUserNotificationServiceConnection_getNotificationTopicsForBundleIdentifier_withCompletionHandler___block_invoke_2_81(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  _BOOL4 v6;
  void *v7;
  NSObject *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  _BOOL4 v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = UNLogConnections;
  if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_DEFAULT))
  {
    v5 = a1[4];
    v6 = a1[6] != 0;
    *(_DWORD *)buf = 138543618;
    v14 = v5;
    v15 = 1024;
    v16 = v6;
    _os_log_impl(&dword_1AA8E4000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Get topics [ hasCompletionHandler: %d ]", buf, 0x12u);
  }
  v7 = (void *)a1[6];
  v8 = *(NSObject **)(a1[5] + 32);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __102__UNUserNotificationServiceConnection_getNotificationTopicsForBundleIdentifier_withCompletionHandler___block_invoke_82;
  v10[3] = &unk_1E57F0060;
  v11 = v3;
  v12 = v7;
  v9 = v3;
  dispatch_async(v8, v10);

}

uint64_t __102__UNUserNotificationServiceConnection_getNotificationTopicsForBundleIdentifier_withCompletionHandler___block_invoke_82(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

- (id)notificationTopicsForBundleIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *queue;
  id v7;
  id v8;
  _QWORD block[5];
  id v11;
  __int128 *p_buf;
  __int128 buf;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = UNLogConnections;
  if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v4;
    _os_log_impl(&dword_1AA8E4000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Getting topics (sync)", (uint8_t *)&buf, 0xCu);
  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__1;
  v16 = __Block_byref_object_dispose__1;
  v17 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77__UNUserNotificationServiceConnection_notificationTopicsForBundleIdentifier___block_invoke;
  block[3] = &unk_1E57F0178;
  block[4] = self;
  v11 = v4;
  p_buf = &buf;
  v7 = v4;
  dispatch_sync(queue, block);
  v8 = *(id *)(*((_QWORD *)&buf + 1) + 40);

  _Block_object_dispose(&buf, 8);
  return v8;
}

void __77__UNUserNotificationServiceConnection_notificationTopicsForBundleIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;

  objc_msgSend(*(id *)(a1 + 32), "_queue_ensureConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __77__UNUserNotificationServiceConnection_notificationTopicsForBundleIdentifier___block_invoke_2;
  v11[3] = &unk_1E57F0128;
  v12 = *(id *)(a1 + 40);
  objc_msgSend(v2, "synchronousRemoteObjectProxyWithErrorHandler:", v11);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 40);
  v8[0] = v3;
  v8[1] = 3221225472;
  v8[2] = __77__UNUserNotificationServiceConnection_notificationTopicsForBundleIdentifier___block_invoke_83;
  v8[3] = &unk_1E57F01C8;
  v6 = v5;
  v7 = *(_QWORD *)(a1 + 48);
  v9 = v6;
  v10 = v7;
  objc_msgSend(v4, "getNotificationTopicsForBundleIdentifier:withCompletionHandler:", v6, v8);

}

void __77__UNUserNotificationServiceConnection_notificationTopicsForBundleIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_ERROR))
    __102__UNUserNotificationServiceConnection_getNotificationTopicsForBundleIdentifier_withCompletionHandler___block_invoke_2_cold_1();

}

void __77__UNUserNotificationServiceConnection_notificationTopicsForBundleIdentifier___block_invoke_83(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)UNLogConnections;
  if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = v4;
    v9 = 138543618;
    v10 = v5;
    v11 = 2048;
    v12 = objc_msgSend(v3, "count");
    _os_log_impl(&dword_1AA8E4000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Got %ld topics", (uint8_t *)&v9, 0x16u);

  }
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v3;

}

void __114__UNUserNotificationServiceConnection_getNotificationSettingsForTopicsWithBundleIdentifier_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  _QWORD block[4];
  id v7;

  v3 = a2;
  if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_ERROR))
    __114__UNUserNotificationServiceConnection_getNotificationSettingsForTopicsWithBundleIdentifier_withCompletionHandler___block_invoke_2_cold_1();
  v4 = *(void **)(a1 + 48);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 32);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __114__UNUserNotificationServiceConnection_getNotificationSettingsForTopicsWithBundleIdentifier_withCompletionHandler___block_invoke_84;
  block[3] = &unk_1E57EFB58;
  v7 = v4;
  dispatch_async(v5, block);

}

uint64_t __114__UNUserNotificationServiceConnection_getNotificationSettingsForTopicsWithBundleIdentifier_withCompletionHandler___block_invoke_84(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

void __114__UNUserNotificationServiceConnection_getNotificationSettingsForTopicsWithBundleIdentifier_withCompletionHandler___block_invoke_2_85(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  _BOOL4 v6;
  void *v7;
  NSObject *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  _BOOL4 v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = UNLogConnections;
  if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_DEFAULT))
  {
    v5 = a1[4];
    v6 = a1[6] != 0;
    *(_DWORD *)buf = 138543618;
    v14 = v5;
    v15 = 1024;
    v16 = v6;
    _os_log_impl(&dword_1AA8E4000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Get topic settings [ hasCompletionHandler: %d ]", buf, 0x12u);
  }
  v7 = (void *)a1[6];
  v8 = *(NSObject **)(a1[5] + 32);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __114__UNUserNotificationServiceConnection_getNotificationSettingsForTopicsWithBundleIdentifier_withCompletionHandler___block_invoke_86;
  v10[3] = &unk_1E57F0060;
  v11 = v3;
  v12 = v7;
  v9 = v3;
  dispatch_async(v8, v10);

}

uint64_t __114__UNUserNotificationServiceConnection_getNotificationSettingsForTopicsWithBundleIdentifier_withCompletionHandler___block_invoke_86(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

void __89__UNUserNotificationServiceConnection_notificationSettingsForTopicsWithBundleIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_ERROR))
    __114__UNUserNotificationServiceConnection_getNotificationSettingsForTopicsWithBundleIdentifier_withCompletionHandler___block_invoke_2_cold_1();

}

void __89__UNUserNotificationServiceConnection_notificationSettingsForTopicsWithBundleIdentifier___block_invoke_88(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)UNLogConnections;
  if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = v4;
    v9 = 138543618;
    v10 = v5;
    v11 = 2048;
    v12 = objc_msgSend(v3, "count");
    _os_log_impl(&dword_1AA8E4000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Got %ld topic settings", (uint8_t *)&v9, 0x16u);

  }
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v3;

}

- (id)clearedInfoForBundleIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *queue;
  id v7;
  id v8;
  _QWORD block[5];
  id v11;
  __int128 *p_buf;
  __int128 buf;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = UNLogConnections;
  if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v4;
    _os_log_impl(&dword_1AA8E4000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Getting cleared info (sync)", (uint8_t *)&buf, 0xCu);
  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__1;
  v16 = __Block_byref_object_dispose__1;
  v17 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__UNUserNotificationServiceConnection_clearedInfoForBundleIdentifier___block_invoke;
  block[3] = &unk_1E57F0178;
  block[4] = self;
  v11 = v4;
  p_buf = &buf;
  v7 = v4;
  dispatch_sync(queue, block);
  v8 = *(id *)(*((_QWORD *)&buf + 1) + 40);

  _Block_object_dispose(&buf, 8);
  return v8;
}

void __70__UNUserNotificationServiceConnection_clearedInfoForBundleIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;

  objc_msgSend(*(id *)(a1 + 32), "_queue_ensureConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __70__UNUserNotificationServiceConnection_clearedInfoForBundleIdentifier___block_invoke_2;
  v11[3] = &unk_1E57F0128;
  v12 = *(id *)(a1 + 40);
  objc_msgSend(v2, "synchronousRemoteObjectProxyWithErrorHandler:", v11);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 40);
  v8[0] = v3;
  v8[1] = 3221225472;
  v8[2] = __70__UNUserNotificationServiceConnection_clearedInfoForBundleIdentifier___block_invoke_89;
  v8[3] = &unk_1E57F04B0;
  v6 = v5;
  v7 = *(_QWORD *)(a1 + 48);
  v9 = v6;
  v10 = v7;
  objc_msgSend(v4, "getClearedInfoForDataProviderMigrationWithBundleIdentifier:withCompletionHandler:", v6, v8);

}

void __70__UNUserNotificationServiceConnection_clearedInfoForBundleIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_ERROR))
    __70__UNUserNotificationServiceConnection_clearedInfoForBundleIdentifier___block_invoke_2_cold_1();

}

void __70__UNUserNotificationServiceConnection_clearedInfoForBundleIdentifier___block_invoke_89(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = UNLogConnections;
  if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v8 = 138543362;
    v9 = v5;
    _os_log_impl(&dword_1AA8E4000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Got cleared info", (uint8_t *)&v8, 0xCu);
  }
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v3;

}

- (void)performBlockOnConnectionQueue:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[4];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__UNUserNotificationServiceConnection_performBlockOnConnectionQueue___block_invoke;
  block[3] = &unk_1E57EFB58;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

uint64_t __69__UNUserNotificationServiceConnection_performBlockOnConnectionQueue___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)didReceiveDeviceToken:(id)a3 forBundleIdentifier:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *queue;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = UNLogConnections;
  if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v16 = v7;
    _os_log_impl(&dword_1AA8E4000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Did receive remote notification token", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __81__UNUserNotificationServiceConnection_didReceiveDeviceToken_forBundleIdentifier___block_invoke;
  block[3] = &unk_1E57EFAC8;
  block[4] = self;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  dispatch_async(queue, block);

}

uint64_t __81__UNUserNotificationServiceConnection_didReceiveDeviceToken_forBundleIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_didReceiveDeviceToken:forBundleIdentifier:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_invalidate
{
  -[NSXPCConnection invalidate](self->_connection, "invalidate");
  -[NSXPCConnection setInterruptionHandler:](self->_connection, "setInterruptionHandler:", 0);
  -[NSXPCConnection setInvalidationHandler:](self->_connection, "setInvalidationHandler:", 0);
  -[NSXPCConnection setExportedObject:](self->_connection, "setExportedObject:", 0);
  -[UNUserNotificationServiceConnection setConnection:](self, "setConnection:", 0);
}

void __62__UNUserNotificationServiceConnection__queue_ensureConnection__block_invoke(uint64_t a1)
{
  NSObject *WeakRetained;
  _QWORD block[4];
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __62__UNUserNotificationServiceConnection__queue_ensureConnection__block_invoke_2;
    block[3] = &unk_1E57F04D8;
    objc_copyWeak(&v4, (id *)(a1 + 40));
    dispatch_async(WeakRetained, block);
    objc_destroyWeak(&v4);
  }

}

void __62__UNUserNotificationServiceConnection__queue_ensureConnection__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_queue_interruptedConnection");

}

void __62__UNUserNotificationServiceConnection__queue_ensureConnection__block_invoke_3(uint64_t a1)
{
  NSObject *WeakRetained;
  _QWORD block[4];
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __62__UNUserNotificationServiceConnection__queue_ensureConnection__block_invoke_4;
    block[3] = &unk_1E57F04D8;
    objc_copyWeak(&v4, (id *)(a1 + 40));
    dispatch_async(WeakRetained, block);
    objc_destroyWeak(&v4);
  }

}

void __62__UNUserNotificationServiceConnection__queue_ensureConnection__block_invoke_4(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_queue_invalidatedConnection");

}

- (void)_queue_interruptedConnection
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
}

- (void)_queue_invalidatedConnection
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[UNUserNotificationServiceConnection _invalidate](self, "_invalidate");
}

- (void)_queue_didReceiveDeviceToken:(id)a3 forBundleIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[NSMutableDictionary objectForKey:](self->_observersByBundleIdentifier, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v12);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v13, "didReceiveDeviceToken:forBundleIdentifier:", v6, v7);
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v10);
  }

}

- (void)_queue_addObserver:(id)a3 forBundleIdentifier:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  if (v10)
  {
    -[NSMutableDictionary objectForKey:](self->_observersByBundleIdentifier, "objectForKey:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3690]), "initWithOptions:capacity:", 517, 4);
      -[NSMutableDictionary setObject:forKey:](self->_observersByBundleIdentifier, "setObject:forKey:", v7, v6);
    }
    objc_msgSend(v7, "addObject:", v10);
    if (objc_msgSend(v7, "count"))
    {
      -[UNUserNotificationServiceConnection _queue_ensureConnection](self, "_queue_ensureConnection");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "remoteObjectProxy");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObservingUserNotifications:forBundleIdentifier:", 1, v6);

    }
  }

}

- (void)_queue_removeObserver:(id)a3 forBundleIdentifier:(id)a4
{
  NSMutableDictionary *observersByBundleIdentifier;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a4;
  observersByBundleIdentifier = self->_observersByBundleIdentifier;
  v7 = a3;
  -[NSMutableDictionary objectForKey:](observersByBundleIdentifier, "objectForKey:", v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObject:", v7);

  if (!objc_msgSend(v8, "count"))
  {
    -[NSMutableDictionary removeObjectForKey:](self->_observersByBundleIdentifier, "removeObjectForKey:", v11);
    -[UNUserNotificationServiceConnection _queue_ensureConnection](self, "_queue_ensureConnection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "remoteObjectProxy");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObservingUserNotifications:forBundleIdentifier:", 0, v11);

  }
}

- (NSMutableDictionary)observersByBundleIdentifier
{
  return self->_observersByBundleIdentifier;
}

- (void)setObserversByBundleIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_observersByBundleIdentifier, a3);
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (OS_dispatch_queue)callOutQueue
{
  return self->_callOutQueue;
}

- (void)setCallOutQueue:(id)a3
{
  objc_storeStrong((id *)&self->_callOutQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callOutQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_observersByBundleIdentifier, 0);
}

void __109__UNUserNotificationServiceConnection_requestAuthorizationWithOptions_forBundleIdentifier_completionHandler___block_invoke_2_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_1(&dword_1AA8E4000, v0, v1, "[%{public}@] Requesting authorization failed with error: %{public}@");
  OUTLINED_FUNCTION_3_0();
}

void __103__UNUserNotificationServiceConnection_requestRemoveAuthorizationForBundleIdentifier_completionHandler___block_invoke_2_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_1(&dword_1AA8E4000, v0, v1, "[%{public}@] Requesting remove authorization failed with error: %{public}@");
  OUTLINED_FUNCTION_3_0();
}

void __79__UNUserNotificationServiceConnection_notificationSettingsForBundleIdentifier___block_invoke_2_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_1(&dword_1AA8E4000, v0, v1, "[%{public}@] Getting notification settings failed with error: %{public}@");
  OUTLINED_FUNCTION_3_0();
}

void __81__UNUserNotificationServiceConnection_notificationCategoriesForBundleIdentifier___block_invoke_2_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_1(&dword_1AA8E4000, v0, v1, "[%{public}@] Getting notification categories failed with error: %{public}@");
  OUTLINED_FUNCTION_3_0();
}

- (void)addNotificationRequest:(uint64_t)a1 forBundleIdentifier:(void *)a2 withCompletionHandler:.cold.1(uint64_t a1, void *a2)
{
  NSObject *v2;
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint8_t v7[24];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)OUTLINED_FUNCTION_7();
  v5 = OUTLINED_FUNCTION_5(v4);
  OUTLINED_FUNCTION_2_1(&dword_1AA8E4000, v2, v6, "[%{public}@] Expected a UNNotificationRequest: %{public}@", v7);

  OUTLINED_FUNCTION_1();
}

void __104__UNUserNotificationServiceConnection_addNotificationRequest_forBundleIdentifier_withCompletionHandler___block_invoke_2_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_1(&dword_1AA8E4000, v0, v1, "[%{public}@] Adding notification request failed with error: %{public}@");
  OUTLINED_FUNCTION_3_0();
}

- (void)replaceContentForRequestWithIdentifier:(uint64_t)a1 bundleIdentifier:(void *)a2 replacementContent:completionHandler:.cold.1(uint64_t a1, void *a2)
{
  NSObject *v2;
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint8_t v7[24];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)OUTLINED_FUNCTION_7();
  v5 = OUTLINED_FUNCTION_5(v4);
  OUTLINED_FUNCTION_2_1(&dword_1AA8E4000, v2, v6, "[%{public}@] Expected a UNNotificationContent: %{public}@", v7);

  OUTLINED_FUNCTION_1();
}

void __132__UNUserNotificationServiceConnection_replaceContentForRequestWithIdentifier_bundleIdentifier_replacementContent_completionHandler___block_invoke_2_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_1(&dword_1AA8E4000, v0, v1, "[%{public}@] Replacing notification content failed with error: %{public}@");
  OUTLINED_FUNCTION_3_0();
}

void __101__UNUserNotificationServiceConnection_setNotificationRequests_forBundleIdentifier_completionHandler___block_invoke_39_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_1(&dword_1AA8E4000, v0, v1, "[%{public}@] Setting notification requests failed with error: %{public}@");
  OUTLINED_FUNCTION_3_0();
}

void __86__UNUserNotificationServiceConnection_pendingNotificationRequestsForBundleIdentifier___block_invoke_2_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_1(&dword_1AA8E4000, v0, v1, "[%{public}@] Getting pending notification requests failed with error: %{public}@");
  OUTLINED_FUNCTION_3_0();
}

void __111__UNUserNotificationServiceConnection_getPendingNotificationRequestsForBundleIdentifier_withCompletionHandler___block_invoke_3_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = 138543618;
  v6 = v3;
  v7 = 2114;
  v8 = v4;
  OUTLINED_FUNCTION_2_1(&dword_1AA8E4000, a2, a3, "[%{public}@] Getting pending notification requests failed with error: %{public}@", (uint8_t *)&v5);
  OUTLINED_FUNCTION_3_0();
}

void __126__UNUserNotificationServiceConnection_removePendingNotificationRequestsWithIdentifiers_forBundleIdentifier_completionHandler___block_invoke_2_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_1(&dword_1AA8E4000, v0, v1, "[%{public}@] Removing pending notification with error: %{public}@");
  OUTLINED_FUNCTION_3_0();
}

void __111__UNUserNotificationServiceConnection_removeSimilarNotificationRequests_forBundleIdentifier_completionHandler___block_invoke_2_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_1(&dword_1AA8E4000, v0, v1, "[%{public}@] Getting similar pending notification requests failed with error: %{public}@");
  OUTLINED_FUNCTION_3_0();
}

void __113__UNUserNotificationServiceConnection_removeAllPendingNotificationRequestsForBundleIdentifier_completionHandler___block_invoke_2_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_1(&dword_1AA8E4000, v0, v1, "[%{public}@] Removing all pending notification requests with error: %{public}@");
  OUTLINED_FUNCTION_3_0();
}

void __81__UNUserNotificationServiceConnection_deliveredNotificationsForBundleIdentifier___block_invoke_2_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_1(&dword_1AA8E4000, v0, v1, "[%{public}@] Getting delivered notifications failed with error: %{public}@");
  OUTLINED_FUNCTION_3_0();
}

void __121__UNUserNotificationServiceConnection_removeDeliveredNotificationsWithIdentifiers_forBundleIdentifier_completionHandler___block_invoke_2_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_1(&dword_1AA8E4000, v0, v1, "[%{public}@] Removing delivered notifications with error: %{public}@");
  OUTLINED_FUNCTION_3_0();
}

void __108__UNUserNotificationServiceConnection_removeAllDeliveredNotificationsForBundleIdentifier_completionHandler___block_invoke_2_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_1(&dword_1AA8E4000, v0, v1, "[%{public}@] Removing all delivered notifications with error: %{public}@");
  OUTLINED_FUNCTION_3_0();
}

void __70__UNUserNotificationServiceConnection_badgeNumberForBundleIdentifier___block_invoke_2_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_1(&dword_1AA8E4000, v0, v1, "[%{public}@] Getting badge number failed with error: %{public}@");
  OUTLINED_FUNCTION_3_0();
}

void __96__UNUserNotificationServiceConnection_setBadgeNumber_forBundleIdentifier_withCompletionHandler___block_invoke_2_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_1(&dword_1AA8E4000, v0, v1, "[%{public}@] Setting badge number failed with error: %{public}@");
  OUTLINED_FUNCTION_3_0();
}

void __95__UNUserNotificationServiceConnection_setBadgeCount_forBundleIdentifier_withCompletionHandler___block_invoke_2_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_1(&dword_1AA8E4000, v0, v1, "[%{public}@] Setting badge count failed with error: %{public}@");
  OUTLINED_FUNCTION_3_0();
}

void __96__UNUserNotificationServiceConnection_setBadgeString_forBundleIdentifier_withCompletionHandler___block_invoke_2_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_1(&dword_1AA8E4000, v0, v1, "[%{public}@] Setting badge string failed with error: %{public}@");
  OUTLINED_FUNCTION_3_0();
}

void __103__UNUserNotificationServiceConnection_setNotificationTopics_forBundleIdentifier_withCompletionHandler___block_invoke_2_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_1(&dword_1AA8E4000, v0, v1, "[%{public}@] Setting topics failed with error: %{public}@");
  OUTLINED_FUNCTION_3_0();
}

void __102__UNUserNotificationServiceConnection_getNotificationTopicsForBundleIdentifier_withCompletionHandler___block_invoke_2_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_1(&dword_1AA8E4000, v0, v1, "[%{public}@] Getting topics failed with error: %{public}@");
  OUTLINED_FUNCTION_3_0();
}

void __114__UNUserNotificationServiceConnection_getNotificationSettingsForTopicsWithBundleIdentifier_withCompletionHandler___block_invoke_2_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_1(&dword_1AA8E4000, v0, v1, "[%{public}@] Getting topic settings failed with error: %{public}@");
  OUTLINED_FUNCTION_3_0();
}

void __70__UNUserNotificationServiceConnection_clearedInfoForBundleIdentifier___block_invoke_2_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_1(&dword_1AA8E4000, v0, v1, "[%{public}@] Getting cleared info failed with error: %{public}@");
  OUTLINED_FUNCTION_3_0();
}

@end
