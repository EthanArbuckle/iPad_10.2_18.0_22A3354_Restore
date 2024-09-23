@implementation PKUserNotificationsRemoteNotificationServiceConnection

uint64_t __100__PKUserNotificationsRemoteNotificationServiceConnection_didReceiveDeviceToken_forBundleIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_remoteUserNotificationsRegistrationSucceededWithDeviceToken:", *(_QWORD *)(a1 + 40));
}

- (void)didReceiveDeviceToken:(id)a3 forBundleIdentifier:(id)a4
{
  id v5;
  NSObject *queue;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a3;
  queue = self->_queue;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __100__PKUserNotificationsRemoteNotificationServiceConnection_didReceiveDeviceToken_forBundleIdentifier___block_invoke;
  v8[3] = &unk_24C06B428;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(queue, v8);

}

void __72__PKUserNotificationsRemoteNotificationServiceConnection_sharedInstance__block_invoke()
{
  PKUserNotificationsRemoteNotificationServiceConnection *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  v0 = [PKUserNotificationsRemoteNotificationServiceConnection alloc];
  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = -[PKUserNotificationsRemoteNotificationServiceConnection initWithBundleIdentifier:](v0, "initWithBundleIdentifier:", v1);
  v3 = (void *)sharedInstance___sharedInstance;
  sharedInstance___sharedInstance = v2;

}

void __97__PKUserNotificationsRemoteNotificationServiceConnection_registerPushRegistry_completionHandler___block_invoke_4(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  char v12;

  v5 = a3;
  v6 = *(void **)(a1 + 40);
  v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __97__PKUserNotificationsRemoteNotificationServiceConnection_registerPushRegistry_completionHandler___block_invoke_5;
  block[3] = &unk_24C06B3B0;
  v12 = a2;
  v10 = v5;
  v11 = v6;
  v8 = v5;
  dispatch_async(v7, block);

}

id __83__PKUserNotificationsRemoteNotificationServiceConnection_initWithBundleIdentifier___block_invoke(uint64_t a1)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "_queue_ensureConnection");
}

void __97__PKUserNotificationsRemoteNotificationServiceConnection_registerPushRegistry_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[5];
  id v8;
  _QWORD v9[5];
  id v10;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "addObject:", *(_QWORD *)(a1 + 40));
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "count"))
  {
    objc_msgSend(*(id *)(a1 + 32), "_queue_ensureConnection");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = MEMORY[0x24BDAC760];
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __97__PKUserNotificationsRemoteNotificationServiceConnection_registerPushRegistry_completionHandler___block_invoke_2;
    v9[3] = &unk_24C06B388;
    v9[4] = *(_QWORD *)(a1 + 32);
    v10 = *(id *)(a1 + 48);
    objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", v9);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(_QWORD *)(v5 + 40);
    v7[0] = v3;
    v7[1] = 3221225472;
    v7[2] = __97__PKUserNotificationsRemoteNotificationServiceConnection_registerPushRegistry_completionHandler___block_invoke_4;
    v7[3] = &unk_24C06B3D8;
    v7[4] = v5;
    v8 = *(id *)(a1 + 48);
    objc_msgSend(v4, "requestTokenForRemoteNotificationsForBundleIdentifier:withCompletionHandler:", v6, v7);

  }
}

- (id)_queue_ensureConnection
{
  NSXPCConnection *connection;
  NSXPCConnection *v4;
  NSXPCConnection *v5;
  NSXPCConnection *v6;
  void *v7;
  NSXPCConnection *v8;
  void *v9;
  NSXPCConnection *v10;
  id v11;
  NSXPCConnection *v12;
  uint64_t v13;
  NSXPCConnection *v14;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t);
  void *v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id from;
  id location;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  connection = self->_connection;
  if (!connection)
  {
    objc_initWeak(&location, self);
    v4 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", CFSTR("com.apple.usernotifications.remotenotificationservice"), 0);
    v5 = self->_connection;
    self->_connection = v4;

    v6 = self->_connection;
    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_25452DB40);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v6, "setRemoteObjectInterface:", v7);

    v8 = self->_connection;
    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_25452C6A8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setExportedInterface:](v8, "setExportedInterface:", v9);

    v10 = self->_connection;
    v11 = objc_loadWeakRetained(&location);
    -[NSXPCConnection setExportedObject:](v10, "setExportedObject:", v11);

    objc_initWeak(&from, self->_queue);
    v12 = self->_connection;
    v13 = MEMORY[0x24BDAC760];
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __81__PKUserNotificationsRemoteNotificationServiceConnection__queue_ensureConnection__block_invoke;
    v22[3] = &unk_24C06B508;
    objc_copyWeak(&v23, &from);
    objc_copyWeak(&v24, &location);
    -[NSXPCConnection setInterruptionHandler:](v12, "setInterruptionHandler:", v22);
    v14 = self->_connection;
    v16 = v13;
    v17 = 3221225472;
    v18 = __81__PKUserNotificationsRemoteNotificationServiceConnection__queue_ensureConnection__block_invoke_3;
    v19 = &unk_24C06B508;
    objc_copyWeak(&v20, &from);
    objc_copyWeak(&v21, &location);
    -[NSXPCConnection setInvalidationHandler:](v14, "setInvalidationHandler:", &v16);
    -[NSXPCConnection resume](self->_connection, "resume", v16, v17, v18, v19);
    objc_destroyWeak(&v21);
    objc_destroyWeak(&v20);
    objc_destroyWeak(&v24);
    objc_destroyWeak(&v23);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
    connection = self->_connection;
  }
  return connection;
}

- (void)registerPushRegistry:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;
  NSObject *queue;
  id v10;
  void *v11;
  id v12;
  _QWORD block[5];
  id v14;
  id v15;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PKUserNotificationsRemoteNotificationServiceConnection.m"), 58, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("registry != nil"));

  }
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __97__PKUserNotificationsRemoteNotificationServiceConnection_registerPushRegistry_completionHandler___block_invoke;
  block[3] = &unk_24C06B400;
  block[4] = self;
  v14 = v7;
  v15 = v8;
  v10 = v8;
  v12 = v7;
  dispatch_sync(queue, block);

}

- (PKUserNotificationsRemoteNotificationServiceConnection)initWithBundleIdentifier:(id)a3
{
  id v5;
  PKUserNotificationsRemoteNotificationServiceConnection *v6;
  NSMutableSet *v7;
  NSMutableSet *registries;
  NSObject *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *queue;
  NSObject *v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *callOutQueue;
  uint64_t v15;
  NSString *bundleIdentifier;
  NSObject *v17;
  void *v19;
  _QWORD block[4];
  PKUserNotificationsRemoteNotificationServiceConnection *v21;
  objc_super v22;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PKUserNotificationsRemoteNotificationServiceConnection.m"), 41, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bundleIdentifier != nil"));

  }
  v22.receiver = self;
  v22.super_class = (Class)PKUserNotificationsRemoteNotificationServiceConnection;
  v6 = -[PKUserNotificationsRemoteNotificationServiceConnection init](&v22, sel_init);
  if (v6)
  {
    v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    registries = v6->_registries;
    v6->_registries = v7;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = dispatch_queue_create("com.apple.usernotifications.PKUserNotificationsRemoteNotificationServiceConnection", v9);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v10;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = dispatch_queue_create("com.apple.usernotifications.PKUserNotificationsRemoteNotificationServiceConnection.call-out", v12);
    callOutQueue = v6->_callOutQueue;
    v6->_callOutQueue = (OS_dispatch_queue *)v13;

    v15 = objc_msgSend(v5, "copy");
    bundleIdentifier = v6->_bundleIdentifier;
    v6->_bundleIdentifier = (NSString *)v15;

    v17 = v6->_queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __83__PKUserNotificationsRemoteNotificationServiceConnection_initWithBundleIdentifier___block_invoke;
    block[3] = &unk_24C06B338;
    v21 = v6;
    dispatch_async(v17, block);

  }
  return v6;
}

- (void)_queue_remoteUserNotificationsRegistrationSucceededWithDeviceToken:(id)a3
{
  id v4;
  NSMutableSet *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = self->_registries;
  v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "remoteUserNotificationRegistrationSucceededWithDeviceToken:", v4, (_QWORD)v10);
      }
      while (v7 != v9);
      v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global);
  return (id)sharedInstance___sharedInstance;
}

uint64_t __97__PKUserNotificationsRemoteNotificationServiceConnection_registerPushRegistry_completionHandler___block_invoke_5(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
  return result;
}

- (PKUserNotificationsRemoteNotificationServiceConnection)init
{
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PKUserNotificationsRemoteNotificationServiceConnection.m"), 36, CFSTR("use +sharedInstance"));

  return 0;
}

void __97__PKUserNotificationsRemoteNotificationServiceConnection_registerPushRegistry_completionHandler___block_invoke_2(uint64_t a1, void *a2)
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
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __97__PKUserNotificationsRemoteNotificationServiceConnection_registerPushRegistry_completionHandler___block_invoke_3;
  v7[3] = &unk_24C06B360;
  v8 = v3;
  v9 = v4;
  v6 = v3;
  dispatch_async(v5, v7);

}

uint64_t __97__PKUserNotificationsRemoteNotificationServiceConnection_registerPushRegistry_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, 0, *(_QWORD *)(a1 + 32));
  return result;
}

- (void)unregisterPushRegistry:(id)a3
{
  id v5;
  NSObject *queue;
  id v7;
  void *v8;
  _QWORD block[5];
  id v10;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PKUserNotificationsRemoteNotificationServiceConnection.m"), 81, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("registry != nil"));

  }
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __81__PKUserNotificationsRemoteNotificationServiceConnection_unregisterPushRegistry___block_invoke;
  block[3] = &unk_24C06B428;
  block[4] = self;
  v10 = v5;
  v7 = v5;
  dispatch_async(queue, block);

}

void __81__PKUserNotificationsRemoteNotificationServiceConnection_unregisterPushRegistry___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "removeObject:", *(_QWORD *)(a1 + 40));
  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "count"))
  {
    objc_msgSend(*(id *)(a1 + 32), "_queue_ensureConnection");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "remoteObjectProxy");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "invalidateTokenForRemoteNotificationsForBundleIdentifier:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40));

  }
}

- (BOOL)allowsRemoteNotifications
{
  NSObject *queue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __83__PKUserNotificationsRemoteNotificationServiceConnection_allowsRemoteNotifications__block_invoke;
  v5[3] = &unk_24C06B4B8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __83__PKUserNotificationsRemoteNotificationServiceConnection_allowsRemoteNotifications__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[5];

  objc_msgSend(*(id *)(a1 + 32), "_queue_ensureConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_17);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __83__PKUserNotificationsRemoteNotificationServiceConnection_allowsRemoteNotifications__block_invoke_3;
  v6[3] = &unk_24C06B490;
  v6[4] = v4;
  objc_msgSend(v3, "getAllowsRemoteNotificationsForBundleIdentifier:withCompletionHandler:", v5, v6);

}

uint64_t __83__PKUserNotificationsRemoteNotificationServiceConnection_allowsRemoteNotifications__block_invoke_3(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (void)remoteUserNotificationPayloadReceived:(id)a3 completionHandler:(id)a4
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
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __114__PKUserNotificationsRemoteNotificationServiceConnection_remoteUserNotificationPayloadReceived_completionHandler___block_invoke;
  block[3] = &unk_24C06B400;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

uint64_t __114__PKUserNotificationsRemoteNotificationServiceConnection_remoteUserNotificationPayloadReceived_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_remoteUserNotificationPayloadReceived:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_invalidate
{
  -[NSXPCConnection invalidate](self->_connection, "invalidate");
  -[NSXPCConnection setInterruptionHandler:](self->_connection, "setInterruptionHandler:", 0);
  -[NSXPCConnection setInvalidationHandler:](self->_connection, "setInvalidationHandler:", 0);
  -[NSXPCConnection setExportedObject:](self->_connection, "setExportedObject:", 0);
  -[PKUserNotificationsRemoteNotificationServiceConnection setConnection:](self, "setConnection:", 0);
}

void __81__PKUserNotificationsRemoteNotificationServiceConnection__queue_ensureConnection__block_invoke(uint64_t a1)
{
  NSObject *WeakRetained;
  _QWORD block[4];
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __81__PKUserNotificationsRemoteNotificationServiceConnection__queue_ensureConnection__block_invoke_2;
    block[3] = &unk_24C06B4E0;
    objc_copyWeak(&v4, (id *)(a1 + 40));
    dispatch_async(WeakRetained, block);
    objc_destroyWeak(&v4);
  }

}

void __81__PKUserNotificationsRemoteNotificationServiceConnection__queue_ensureConnection__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_queue_interruptedConnection");

}

void __81__PKUserNotificationsRemoteNotificationServiceConnection__queue_ensureConnection__block_invoke_3(uint64_t a1)
{
  NSObject *WeakRetained;
  _QWORD block[4];
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __81__PKUserNotificationsRemoteNotificationServiceConnection__queue_ensureConnection__block_invoke_4;
    block[3] = &unk_24C06B4E0;
    objc_copyWeak(&v4, (id *)(a1 + 40));
    dispatch_async(WeakRetained, block);
    objc_destroyWeak(&v4);
  }

}

void __81__PKUserNotificationsRemoteNotificationServiceConnection__queue_ensureConnection__block_invoke_4(uint64_t a1)
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
  -[PKUserNotificationsRemoteNotificationServiceConnection _invalidate](self, "_invalidate");
}

- (void)_queue_remoteUserNotificationPayloadReceived:(id)a3 completionHandler:(id)a4
{
  id v6;
  NSObject *v7;
  NSMutableSet *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  id v16;
  id v17;
  _QWORD block[4];
  id v19;
  _QWORD v20[4];
  NSObject *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v17 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v7 = dispatch_group_create();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v8 = self->_registries;
  v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  v10 = MEMORY[0x24BDAC760];
  if (v9)
  {
    v11 = v9;
    v12 = *(_QWORD *)v23;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v23 != v12)
          objc_enumerationMutation(v8);
        v14 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v13);
        dispatch_group_enter(v7);
        v20[0] = v10;
        v20[1] = 3221225472;
        v20[2] = __121__PKUserNotificationsRemoteNotificationServiceConnection__queue_remoteUserNotificationPayloadReceived_completionHandler___block_invoke;
        v20[3] = &unk_24C06B338;
        v21 = v7;
        objc_msgSend(v14, "remoteUserNotificationPayloadReceived:completionHandler:", v6, v20);

        ++v13;
      }
      while (v11 != v13);
      v11 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v11);
  }

  dispatch_get_global_queue(0, 0);
  v15 = objc_claimAutoreleasedReturnValue();
  block[0] = v10;
  block[1] = 3221225472;
  block[2] = __121__PKUserNotificationsRemoteNotificationServiceConnection__queue_remoteUserNotificationPayloadReceived_completionHandler___block_invoke_2;
  block[3] = &unk_24C06B530;
  v19 = v17;
  v16 = v17;
  dispatch_group_notify(v7, v15, block);

}

void __121__PKUserNotificationsRemoteNotificationServiceConnection__queue_remoteUserNotificationPayloadReceived_completionHandler___block_invoke(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __121__PKUserNotificationsRemoteNotificationServiceConnection__queue_remoteUserNotificationPayloadReceived_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (NSMutableSet)registries
{
  return self->_registries;
}

- (void)setRegistries:(id)a3
{
  objc_storeStrong((id *)&self->_registries, a3);
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

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_callOutQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_registries, 0);
}

@end
