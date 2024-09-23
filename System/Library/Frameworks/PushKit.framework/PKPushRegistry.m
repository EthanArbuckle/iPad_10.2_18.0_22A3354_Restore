@implementation PKPushRegistry

- (void)setDelegate:(id)delegate
{
  objc_storeWeak((id *)&self->_delegate, delegate);
}

void __39__PKPushRegistry__registerForPushType___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  _QWORD v9[5];
  id v10;

  v5 = a3;
  v6 = v5;
  if ((a2 & 1) == 0)
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(NSObject **)(v7 + 40);
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __39__PKPushRegistry__registerForPushType___block_invoke_2;
    v9[3] = &unk_24C06B428;
    v9[4] = v7;
    v10 = v5;
    dispatch_async(v8, v9);

  }
}

- (void)setDesiredPushTypes:(NSSet *)desiredPushTypes
{
  NSSet *v4;
  NSObject *ivarQueue;
  NSSet *v6;
  _QWORD block[4];
  NSSet *v8;
  PKPushRegistry *v9;

  v4 = desiredPushTypes;
  ivarQueue = self->_ivarQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __38__PKPushRegistry_setDesiredPushTypes___block_invoke;
  block[3] = &unk_24C06B428;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_sync(ivarQueue, block);

}

void __77__PKPushRegistry_remoteUserNotificationRegistrationSucceededWithDeviceToken___block_invoke_2(uint64_t a1)
{
  void *v2;
  PKPushCredentials *v3;

  v3 = objc_alloc_init(PKPushCredentials);
  -[PKPushCredentials setType:](v3, "setType:", CFSTR("PKPushTypeUserNotifications"));
  -[PKPushCredentials setToken:](v3, "setToken:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pushRegistry:didUpdatePushCredentials:forType:", *(_QWORD *)(a1 + 40), v3, CFSTR("PKPushTypeUserNotifications"));

}

- (id)delegate
{
  return objc_loadWeakRetained((id *)&self->_delegate);
}

- (NSData)pushTokenForType:(PKPushType)type
{
  NSString *v4;
  NSString *v5;
  NSObject *ivarQueue;
  id v7;
  _QWORD block[5];
  NSString *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = type;
  v5 = v4;
  if (v4)
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x3032000000;
    v15 = __Block_byref_object_copy_;
    v16 = __Block_byref_object_dispose_;
    v17 = 0;
    ivarQueue = self->_ivarQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __35__PKPushRegistry_pushTokenForType___block_invoke;
    block[3] = &unk_24C06B640;
    v11 = &v12;
    block[4] = self;
    v10 = v4;
    dispatch_sync(ivarQueue, block);
    v7 = (id)v13[5];

    _Block_object_dispose(&v12, 8);
  }
  else
  {
    v7 = 0;
  }

  return (NSData *)v7;
}

- (PKPushRegistry)initWithQueue:(dispatch_queue_t)queue
{
  NSObject *v4;
  PKPushRegistry *v5;
  NSObject *v6;
  OS_dispatch_queue *delegateQueue;
  OS_dispatch_queue *v8;
  id v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *ivarQueue;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t);
  void *v21;
  id v22;
  _QWORD v23[4];
  id v24;
  _QWORD handler[4];
  id v26;
  id location;
  objc_super v28;

  v4 = queue;
  v28.receiver = self;
  v28.super_class = (Class)PKPushRegistry;
  v5 = -[PKPushRegistry init](&v28, sel_init);
  if (v5)
  {
    if (v4)
    {
      v6 = v4;
      delegateQueue = v5->_delegateQueue;
      v5->_delegateQueue = (OS_dispatch_queue *)v6;
    }
    else
    {
      v8 = (OS_dispatch_queue *)MEMORY[0x24BDAC9B8];
      v9 = MEMORY[0x24BDAC9B8];
      delegateQueue = v5->_delegateQueue;
      v5->_delegateQueue = v8;
    }

    v10 = dispatch_queue_create("com.apple.pushkit.ivarqueue", 0);
    ivarQueue = v5->_ivarQueue;
    v5->_ivarQueue = (OS_dispatch_queue *)v10;

    objc_initWeak(&location, v5);
    v12 = v5->_ivarQueue;
    v13 = MEMORY[0x24BDAC760];
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __32__PKPushRegistry_initWithQueue___block_invoke;
    handler[3] = &unk_24C06B580;
    objc_copyWeak(&v26, &location);
    notify_register_dispatch("com.apple.pushkit.launch.voip", &v5->_voipToken, v12, handler);
    v14 = v5->_ivarQueue;
    v23[0] = v13;
    v23[1] = 3221225472;
    v23[2] = __32__PKPushRegistry_initWithQueue___block_invoke_2;
    v23[3] = &unk_24C06B580;
    objc_copyWeak(&v24, &location);
    notify_register_dispatch("com.apple.pushkit.launch.complication", &v5->_complicationToken, v14, v23);
    v15 = v5->_ivarQueue;
    v18 = v13;
    v19 = 3221225472;
    v20 = __32__PKPushRegistry_initWithQueue___block_invoke_3;
    v21 = &unk_24C06B580;
    objc_copyWeak(&v22, &location);
    notify_register_dispatch("com.apple.pushkit.launch.fileprovider", &v5->_fileProviderToken, v15, &v18);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter", v18, v19, v20, v21);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObserver:selector:name:object:", v5, sel__noteIncomingCallReported, CFSTR("PKPushIncomingCallReportedNotification"), 0);

    objc_destroyWeak(&v22);
    objc_destroyWeak(&v24);
    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
  }

  return v5;
}

- (void)_registerForPushType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_ivarQueue);
  -[PKPushRegistry pushTypeToConnection](self, "pushTypeToConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("PKPushTypeUserNotifications")) & 1) != 0)
    {
      v6 = 0;
    }
    else
    {
      -[PKPushRegistry _createConnectionForPushType:](self, "_createConnectionForPushType:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPushRegistry pushTypeToConnection](self, "pushTypeToConnection");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, v4);

    }
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("PKPushTypeVoIP")))
  {
    +[PKPushRegistry _assertIfCallKitNotLinked](PKPushRegistry, "_assertIfCallKitNotLinked");
    objc_msgSend(v6, "remoteObjectProxy");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "voipRegister");
LABEL_11:

    goto LABEL_12;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("PKPushTypeComplication")))
  {
    objc_msgSend(v6, "remoteObjectProxy");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "complicationRegister");
    goto LABEL_11;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("PKPushTypeFileProvider")))
  {
    objc_msgSend(v6, "remoteObjectProxy");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "fileProviderRegister");
    goto LABEL_11;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("PKPushTypeUserNotifications")))
  {
    +[PKUserNotificationsRemoteNotificationServiceConnection sharedInstance](PKUserNotificationsRemoteNotificationServiceConnection, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __39__PKPushRegistry__registerForPushType___block_invoke;
    v10[3] = &unk_24C06B5F0;
    v10[4] = self;
    objc_msgSend(v9, "registerPushRegistry:completionHandler:", self, v10);

  }
LABEL_12:

}

void __77__PKPushRegistry_remoteUserNotificationRegistrationSucceededWithDeviceToken___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;

  v2 = (void *)objc_msgSend(*(id *)(a1 + 40), "copy");
  objc_msgSend(*(id *)(a1 + 32), "pushTypeToToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v2, CFSTR("PKPushTypeUserNotifications"));

  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __77__PKPushRegistry_remoteUserNotificationRegistrationSucceededWithDeviceToken___block_invoke_2;
  v8[3] = &unk_24C06B428;
  v6 = v4;
  v7 = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v10 = v7;
  dispatch_async(v5, v8);

}

void __35__PKPushRegistry_pushTokenForType___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "pushTypeToToken");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "copy");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (NSMutableDictionary)pushTypeToToken
{
  NSMutableDictionary *pushTypeToToken;
  NSMutableDictionary *v4;
  NSMutableDictionary *v5;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_ivarQueue);
  pushTypeToToken = self->_pushTypeToToken;
  if (!pushTypeToToken)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v4 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    v5 = self->_pushTypeToToken;
    self->_pushTypeToToken = v4;

    pushTypeToToken = self->_pushTypeToToken;
  }
  return pushTypeToToken;
}

void __38__PKPushRegistry_setDesiredPushTypes___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "mutableCopy");
  objc_msgSend(v2, "minusSet:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24));
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v3 = v2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v22;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v22 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(a1 + 40), "_registerForPushType:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v7++));
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v5);
  }

  v8 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "mutableCopy");
  objc_msgSend(v8, "minusSet:", *(_QWORD *)(a1 + 32));
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v18;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(a1 + 40), "_unregisterForPushType:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v13++), (_QWORD)v17);
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v11);
  }

  v14 = objc_msgSend(*(id *)(a1 + 32), "copy");
  v15 = *(_QWORD *)(a1 + 40);
  v16 = *(void **)(v15 + 24);
  *(_QWORD *)(v15 + 24) = v14;

}

- (void)remoteUserNotificationRegistrationSucceededWithDeviceToken:(id)a3
{
  id v4;
  NSObject *ivarQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  ivarQueue = self->_ivarQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __77__PKPushRegistry_remoteUserNotificationRegistrationSucceededWithDeviceToken___block_invoke;
  v7[3] = &unk_24C06B428;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(ivarQueue, v7);

}

- (NSMutableDictionary)pushTypeToConnection
{
  NSMutableDictionary *pushTypeToConnection;
  NSMutableDictionary *v4;
  NSMutableDictionary *v5;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_ivarQueue);
  pushTypeToConnection = self->_pushTypeToConnection;
  if (!pushTypeToConnection)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v4 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    v5 = self->_pushTypeToConnection;
    self->_pushTypeToConnection = v4;

    pushTypeToConnection = self->_pushTypeToConnection;
  }
  return pushTypeToConnection;
}

+ (id)_pushTypeToMachServiceName
{
  _QWORD v3[3];
  _QWORD v4[4];

  v4[3] = *MEMORY[0x24BDAC8D0];
  v3[0] = CFSTR("PKPushTypeVoIP");
  v3[1] = CFSTR("PKPushTypeComplication");
  v4[0] = CFSTR("com.apple.telephonyutilities.callservicesdaemon.voip");
  v4[1] = CFSTR("com.apple.watchconnectivity.complication");
  v3[2] = CFSTR("PKPushTypeFileProvider");
  v4[2] = CFSTR("com.apple.fileprovider.pushkit");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v4, v3, 3);
  return (id)objc_claimAutoreleasedReturnValue();
}

void __32__PKPushRegistry_initWithQueue___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_renewConnectionForPushTypeIfRegistered:", CFSTR("PKPushTypeVoIP"));

}

void __32__PKPushRegistry_initWithQueue___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_renewConnectionForPushTypeIfRegistered:", CFSTR("PKPushTypeComplication"));

}

void __32__PKPushRegistry_initWithQueue___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_renewConnectionForPushTypeIfRegistered:", CFSTR("PKPushTypeFileProvider"));

}

- (void)dealloc
{
  objc_super v3;

  notify_cancel(self->_voipToken);
  notify_cancel(self->_complicationToken);
  notify_cancel(self->_fileProviderToken);
  v3.receiver = self;
  v3.super_class = (Class)PKPushRegistry;
  -[PKPushRegistry dealloc](&v3, sel_dealloc);
}

- (void)voipRegistrationSucceededWithDeviceToken:(id)a3
{
  id v4;
  NSObject *ivarQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  ivarQueue = self->_ivarQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __59__PKPushRegistry_voipRegistrationSucceededWithDeviceToken___block_invoke;
  v7[3] = &unk_24C06B428;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(ivarQueue, v7);

}

void __59__PKPushRegistry_voipRegistrationSucceededWithDeviceToken___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;

  v2 = (void *)objc_msgSend(*(id *)(a1 + 40), "copy");
  objc_msgSend(*(id *)(a1 + 32), "pushTypeToToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v2, CFSTR("PKPushTypeVoIP"));

  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __59__PKPushRegistry_voipRegistrationSucceededWithDeviceToken___block_invoke_2;
  v8[3] = &unk_24C06B428;
  v6 = v4;
  v7 = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v10 = v7;
  dispatch_async(v5, v8);

}

void __59__PKPushRegistry_voipRegistrationSucceededWithDeviceToken___block_invoke_2(uint64_t a1)
{
  void *v2;
  PKPushCredentials *v3;

  v3 = objc_alloc_init(PKPushCredentials);
  -[PKPushCredentials setType:](v3, "setType:", CFSTR("PKPushTypeVoIP"));
  -[PKPushCredentials setToken:](v3, "setToken:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pushRegistry:didUpdatePushCredentials:forType:", *(_QWORD *)(a1 + 40), v3, CFSTR("PKPushTypeVoIP"));

}

- (void)voipPayloadReceived:(id)a3 mustPostCall:(BOOL)a4 withCompletionHandler:(id)a5
{
  id v8;
  id v9;
  NSObject *delegateQueue;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  BOOL v16;

  v8 = a3;
  v9 = a5;
  delegateQueue = self->_delegateQueue;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __73__PKPushRegistry_voipPayloadReceived_mustPostCall_withCompletionHandler___block_invoke;
  v13[3] = &unk_24C06B5A8;
  v16 = a4;
  v13[4] = self;
  v14 = v8;
  v15 = v9;
  v11 = v9;
  v12 = v8;
  dispatch_async(delegateQueue, v13);

}

void __73__PKPushRegistry_voipPayloadReceived_mustPostCall_withCompletionHandler___block_invoke(uint64_t a1)
{
  int v2;
  double v3;
  double v4;
  double v5;
  double v6;
  BOOL v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  char v15;
  uint64_t v16;
  NSObject *v17;
  PKPushPayload *v18;
  _QWORD v19[5];
  _QWORD block[5];

  v2 = *(unsigned __int8 *)(a1 + 56);
  objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
  v4 = v3;
  objc_msgSend(*(id *)(a1 + 32), "lastReportedCallTime");
  v6 = v4 - v5;
  if (v2)
    v7 = v6 < 7.0;
  else
    v7 = 1;
  v8 = MEMORY[0x24BDAC760];
  if (!v7)
  {
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(NSObject **)(v9 + 48);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __73__PKPushRegistry_voipPayloadReceived_mustPostCall_withCompletionHandler___block_invoke_2;
    block[3] = &unk_24C06B338;
    block[4] = v9;
    dispatch_sync(v10, block);
  }
  v18 = objc_alloc_init(PKPushPayload);
  -[PKPushPayload setType:](v18, "setType:", CFSTR("PKPushTypeVoIP"));
  -[PKPushPayload setDictionaryPayload:](v18, "setDictionaryPayload:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_opt_respondsToSelector();

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if ((v12 & 1) != 0)
  {
    objc_msgSend(v13, "pushRegistry:didReceiveIncomingPushWithPayload:forType:withCompletionHandler:", *(_QWORD *)(a1 + 32), v18, CFSTR("PKPushTypeVoIP"), *(_QWORD *)(a1 + 48));
LABEL_10:

    goto LABEL_11;
  }
  v15 = objc_opt_respondsToSelector();

  if ((v15 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "pushRegistry:didReceiveIncomingPushWithPayload:forType:", *(_QWORD *)(a1 + 32), v18, CFSTR("PKPushTypeVoIP"));
    goto LABEL_10;
  }
LABEL_11:
  v16 = *(_QWORD *)(a1 + 32);
  v17 = *(NSObject **)(v16 + 48);
  v19[0] = v8;
  v19[1] = 3221225472;
  v19[2] = __73__PKPushRegistry_voipPayloadReceived_mustPostCall_withCompletionHandler___block_invoke_3;
  v19[3] = &unk_24C06B338;
  v19[4] = v16;
  dispatch_sync(v17, v19);

}

uint64_t __73__PKPushRegistry_voipPayloadReceived_mustPostCall_withCompletionHandler___block_invoke_2(uint64_t result)
{
  ++*(_DWORD *)(*(_QWORD *)(result + 32) + 20);
  return result;
}

uint64_t __73__PKPushRegistry_voipPayloadReceived_mustPostCall_withCompletionHandler___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_terminateAppIfThereAreUnhandledVoIPPushes");
}

- (void)voipRegistrationFailed
{
  NSObject *delegateQueue;
  _QWORD block[5];

  delegateQueue = self->_delegateQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __40__PKPushRegistry_voipRegistrationFailed__block_invoke;
  block[3] = &unk_24C06B338;
  block[4] = self;
  dispatch_async(delegateQueue, block);
}

void __40__PKPushRegistry_voipRegistrationFailed__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "pushRegistry:didInvalidatePushTokenForType:", *(_QWORD *)(a1 + 32), CFSTR("PKPushTypeVoIP"));

}

- (void)complicationRegistrationSucceededWithDeviceToken:(id)a3
{
  id v4;
  NSObject *ivarQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  ivarQueue = self->_ivarQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __67__PKPushRegistry_complicationRegistrationSucceededWithDeviceToken___block_invoke;
  v7[3] = &unk_24C06B428;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(ivarQueue, v7);

}

void __67__PKPushRegistry_complicationRegistrationSucceededWithDeviceToken___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;

  v2 = (void *)objc_msgSend(*(id *)(a1 + 40), "copy");
  objc_msgSend(*(id *)(a1 + 32), "pushTypeToToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v2, CFSTR("PKPushTypeComplication"));

  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __67__PKPushRegistry_complicationRegistrationSucceededWithDeviceToken___block_invoke_2;
  v8[3] = &unk_24C06B428;
  v6 = v4;
  v7 = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v10 = v7;
  dispatch_async(v5, v8);

}

void __67__PKPushRegistry_complicationRegistrationSucceededWithDeviceToken___block_invoke_2(uint64_t a1)
{
  void *v2;
  PKPushCredentials *v3;

  v3 = objc_alloc_init(PKPushCredentials);
  -[PKPushCredentials setType:](v3, "setType:", CFSTR("PKPushTypeComplication"));
  -[PKPushCredentials setToken:](v3, "setToken:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pushRegistry:didUpdatePushCredentials:forType:", *(_QWORD *)(a1 + 40), v3, CFSTR("PKPushTypeComplication"));

}

- (void)complicationPayloadReceived:(id)a3
{
  id v4;
  NSObject *delegateQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  PKPushRegistry *v9;

  v4 = a3;
  delegateQueue = self->_delegateQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __46__PKPushRegistry_complicationPayloadReceived___block_invoke;
  v7[3] = &unk_24C06B428;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(delegateQueue, v7);

}

void __46__PKPushRegistry_complicationPayloadReceived___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  void *v5;
  char v6;
  PKPushPayload *v7;

  v7 = objc_alloc_init(PKPushPayload);
  -[PKPushPayload setType:](v7, "setType:", CFSTR("PKPushTypeComplication"));
  -[PKPushPayload setDictionaryPayload:](v7, "setDictionaryPayload:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  objc_msgSend(*(id *)(a1 + 40), "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if ((v3 & 1) != 0)
  {
    objc_msgSend(v4, "pushRegistry:didReceiveIncomingPushWithPayload:forType:withCompletionHandler:", *(_QWORD *)(a1 + 40), v7, CFSTR("PKPushTypeComplication"), &__block_literal_global_0);
LABEL_5:

    goto LABEL_6;
  }
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "pushRegistry:didReceiveIncomingPushWithPayload:forType:", *(_QWORD *)(a1 + 40), v7, CFSTR("PKPushTypeComplication"));
    goto LABEL_5;
  }
LABEL_6:

}

- (void)complicationRegistrationFailed
{
  NSObject *delegateQueue;
  _QWORD block[5];

  delegateQueue = self->_delegateQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __48__PKPushRegistry_complicationRegistrationFailed__block_invoke;
  block[3] = &unk_24C06B338;
  block[4] = self;
  dispatch_async(delegateQueue, block);
}

void __48__PKPushRegistry_complicationRegistrationFailed__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "pushRegistry:didInvalidatePushTokenForType:", *(_QWORD *)(a1 + 32), CFSTR("PKPushTypeComplication"));

}

- (void)fileProviderRegistrationSucceededWithDeviceToken:(id)a3
{
  id v4;
  NSObject *ivarQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  ivarQueue = self->_ivarQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __67__PKPushRegistry_fileProviderRegistrationSucceededWithDeviceToken___block_invoke;
  v7[3] = &unk_24C06B428;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(ivarQueue, v7);

}

void __67__PKPushRegistry_fileProviderRegistrationSucceededWithDeviceToken___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;

  v2 = (void *)objc_msgSend(*(id *)(a1 + 40), "copy");
  objc_msgSend(*(id *)(a1 + 32), "pushTypeToToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v2, CFSTR("PKPushTypeFileProvider"));

  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __67__PKPushRegistry_fileProviderRegistrationSucceededWithDeviceToken___block_invoke_2;
  v8[3] = &unk_24C06B428;
  v6 = v4;
  v7 = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v10 = v7;
  dispatch_async(v5, v8);

}

void __67__PKPushRegistry_fileProviderRegistrationSucceededWithDeviceToken___block_invoke_2(uint64_t a1)
{
  void *v2;
  PKPushCredentials *v3;

  v3 = objc_alloc_init(PKPushCredentials);
  -[PKPushCredentials setType:](v3, "setType:", CFSTR("PKPushTypeFileProvider"));
  -[PKPushCredentials setToken:](v3, "setToken:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pushRegistry:didUpdatePushCredentials:forType:", *(_QWORD *)(a1 + 40), v3, CFSTR("PKPushTypeFileProvider"));

}

- (void)fileProviderPayloadReceived:(id)a3
{
  id v4;
  NSObject *delegateQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  PKPushRegistry *v9;

  v4 = a3;
  delegateQueue = self->_delegateQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __46__PKPushRegistry_fileProviderPayloadReceived___block_invoke;
  v7[3] = &unk_24C06B428;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(delegateQueue, v7);

}

void __46__PKPushRegistry_fileProviderPayloadReceived___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  void *v5;
  char v6;
  PKPushPayload *v7;

  v7 = objc_alloc_init(PKPushPayload);
  -[PKPushPayload setType:](v7, "setType:", CFSTR("PKPushTypeFileProvider"));
  -[PKPushPayload setDictionaryPayload:](v7, "setDictionaryPayload:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  objc_msgSend(*(id *)(a1 + 40), "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if ((v3 & 1) != 0)
  {
    objc_msgSend(v4, "pushRegistry:didReceiveIncomingPushWithPayload:forType:withCompletionHandler:", *(_QWORD *)(a1 + 40), v7, CFSTR("PKPushTypeFileProvider"), &__block_literal_global_36);
LABEL_5:

    goto LABEL_6;
  }
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "pushRegistry:didReceiveIncomingPushWithPayload:forType:", *(_QWORD *)(a1 + 40), v7, CFSTR("PKPushTypeFileProvider"));
    goto LABEL_5;
  }
LABEL_6:

}

- (void)fileProviderRegistrationFailed
{
  NSObject *delegateQueue;
  _QWORD block[5];

  delegateQueue = self->_delegateQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __48__PKPushRegistry_fileProviderRegistrationFailed__block_invoke;
  block[3] = &unk_24C06B338;
  block[4] = self;
  dispatch_async(delegateQueue, block);
}

void __48__PKPushRegistry_fileProviderRegistrationFailed__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "pushRegistry:didInvalidatePushTokenForType:", *(_QWORD *)(a1 + 32), CFSTR("PKPushTypeFileProvider"));

}

- (void)remoteUserNotificationPayloadReceived:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *delegateQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  delegateQueue = self->_delegateQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __74__PKPushRegistry_remoteUserNotificationPayloadReceived_completionHandler___block_invoke;
  block[3] = &unk_24C06B400;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(delegateQueue, block);

}

void __74__PKPushRegistry_remoteUserNotificationPayloadReceived_completionHandler___block_invoke(uint64_t a1)
{
  PKPushPayload *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_alloc_init(PKPushPayload);
  -[PKPushPayload setType:](v2, "setType:", CFSTR("PKPushTypeUserNotifications"));
  -[PKPushPayload setDictionaryPayload:](v2, "setDictionaryPayload:", *(_QWORD *)(a1 + 40));
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "pushRegistry:didReceiveIncomingPushWithPayload:forType:withCompletionHandler:", *(_QWORD *)(a1 + 32), v2, CFSTR("PKPushTypeUserNotifications"), *(_QWORD *)(a1 + 48));

}

+ (void)_assertIfCallKitNotLinked
{
  void *v4;
  id v5;

  v4 = dlopen("/System/Library/Frameworks/CallKit.framework/CallKit", 16);
  if (dyld_program_sdk_at_least())
  {
    if (!v4)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PKPushRegistry.m"), 304, CFSTR("PushKit apps that use VoIP push must link the CallKit framework."));

    }
  }
}

- (BOOL)_selfTaskHasEntitlement:(__CFString *)a3
{
  __SecTask *v4;
  __SecTask *v5;
  CFTypeRef v6;
  CFTypeID v7;

  v4 = SecTaskCreateFromSelf(0);
  v5 = v4;
  if (v4)
  {
    v6 = SecTaskCopyValueForEntitlement(v4, a3, 0);
    CFRelease(v5);
    if (v6)
    {
      v7 = CFGetTypeID(v6);
      LOBYTE(v5) = v7 == CFBooleanGetTypeID() && CFBooleanGetValue((CFBooleanRef)v6) != 0;
      CFRelease(v6);
    }
    else
    {
      LOBYTE(v5) = 0;
    }
  }
  return (char)v5;
}

- (void)_terminateAppIfThereAreUnhandledVoIPPushes
{
  int v4;
  _BOOL4 v5;
  id v6;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_ivarQueue);
  if (self->_outstandingVoIPPushes >= 1)
  {
    v4 = dyld_program_sdk_at_least();
    v5 = -[PKPushRegistry _selfTaskHasEntitlement:](self, "_selfTaskHasEntitlement:", CFSTR("com.apple.developer.pushkit.unrestricted-voip"));
    if (v4)
    {
      if (v5)
        NSLog(CFSTR("The com.apple.developer.pushkit.unrestricted-voip entitlement is no longer supported."));
    }
    NSLog(&CFSTR("Apps receving VoIP pushes must post an incoming call via CallKit in the same run loop as pushRegistry:didRece"
                 "iveIncomingPushWithPayload:forType:[withCompletionHandler:] without delay.").isa);
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PKPushRegistry.m"), 349, CFSTR("Killing app because it never posted an incoming call to the system after receiving a PushKit VoIP push."));

  }
}

- (void)_noteIncomingCallReported
{
  NSObject *ivarQueue;
  _QWORD block[5];

  ivarQueue = self->_ivarQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __43__PKPushRegistry__noteIncomingCallReported__block_invoke;
  block[3] = &unk_24C06B338;
  block[4] = self;
  dispatch_sync(ivarQueue, block);
}

uint64_t __43__PKPushRegistry__noteIncomingCallReported__block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 20) = 0;
  result = objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72) = v3;
  return result;
}

void __39__PKPushRegistry__registerForPushType___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v2, "pushRegistry:didInvalidatePushTokenForType:error:", *(_QWORD *)(a1 + 32), CFSTR("PKPushTypeUserNotifications"), *(_QWORD *)(a1 + 40));
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v2, "pushRegistry:didInvalidatePushTokenForType:", *(_QWORD *)(a1 + 32), CFSTR("PKPushTypeUserNotifications"));
  }

}

- (void)_unregisterForPushType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v4 = a3;
  if (v4)
  {
    v13 = v4;
    dispatch_assert_queue_V2((dispatch_queue_t)self->_ivarQueue);
    -[PKPushRegistry pushTypeToConnection](self, "pushTypeToConnection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v13);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = v13;
    if (!v6)
    {
      if ((objc_msgSend(v13, "isEqualToString:", CFSTR("PKPushTypeUserNotifications")) & 1) != 0)
      {
        v6 = 0;
      }
      else
      {
        -[PKPushRegistry _createConnectionForPushType:](self, "_createConnectionForPushType:", v13);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKPushRegistry pushTypeToConnection](self, "pushTypeToConnection");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v6, v13);

      }
      v7 = v13;
    }
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("PKPushTypeVoIP")))
    {
      objc_msgSend(v6, "remoteObjectProxy");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "voipUnregister");
    }
    else if (objc_msgSend(v13, "isEqualToString:", CFSTR("PKPushTypeComplication")))
    {
      objc_msgSend(v6, "remoteObjectProxy");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "complicationUnregister");
    }
    else if (objc_msgSend(v13, "isEqualToString:", CFSTR("PKPushTypeFileProvider")))
    {
      objc_msgSend(v6, "remoteObjectProxy");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "fileProviderUnregister");
    }
    else
    {
      if (!objc_msgSend(v13, "isEqualToString:", CFSTR("PKPushTypeUserNotifications")))
      {
LABEL_16:
        -[PKPushRegistry pushTypeToConnection](self, "pushTypeToConnection");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKeyedSubscript:", v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "invalidate");

        -[PKPushRegistry pushTypeToConnection](self, "pushTypeToConnection");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "removeObjectForKey:", v13);

        v4 = v13;
        goto LABEL_17;
      }
      +[PKUserNotificationsRemoteNotificationServiceConnection sharedInstance](PKUserNotificationsRemoteNotificationServiceConnection, "sharedInstance");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "unregisterPushRegistry:", self);
    }

    goto LABEL_16;
  }
LABEL_17:

}

- (id)_createConnectionForPushType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD *v9;
  _QWORD *v10;
  void *v11;
  void *v12;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "_pushTypeToMachServiceName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      v8 = 0;
LABEL_13:

      goto LABEL_14;
    }
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", v7, 4096);
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("PKPushTypeVoIP")) & 1) != 0)
    {
      v9 = &protocolRef_PKVoIPXPCClient;
      v10 = &protocolRef_PKVoIPXPCServer;
    }
    else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("PKPushTypeComplication")) & 1) != 0)
    {
      v9 = &protocolRef_PKComplicationXPCClient;
      v10 = &protocolRef_PKComplicationXPCServer;
    }
    else
    {
      if (!objc_msgSend(v4, "isEqualToString:", CFSTR("PKPushTypeFileProvider")))
      {
LABEL_12:
        objc_msgSend(v8, "setExportedObject:", self);
        objc_msgSend(v8, "resume");
        goto LABEL_13;
      }
      v9 = &protocolRef_PKFileProviderXPCClient;
      v10 = &protocolRef_PKFileProviderXPCServer;
    }
    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", *v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setRemoteObjectInterface:", v11);

    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", *v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setExportedInterface:", v12);

    goto LABEL_12;
  }
  v8 = 0;
LABEL_14:

  return v8;
}

- (void)_renewConnectionForPushTypeIfRegistered:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_ivarQueue);
  -[PKPushRegistry pushTypeToConnection](self, "pushTypeToConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[PKPushRegistry pushTypeToConnection](self, "pushTypeToConnection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "invalidate");

    -[PKPushRegistry pushTypeToConnection](self, "pushTypeToConnection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeObjectForKey:", v9);

    -[PKPushRegistry _registerForPushType:](self, "_registerForPushType:", v9);
  }

}

- (NSSet)desiredPushTypes
{
  NSObject *ivarQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy_;
  v10 = __Block_byref_object_dispose_;
  v11 = 0;
  ivarQueue = self->_ivarQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __34__PKPushRegistry_desiredPushTypes__block_invoke;
  v5[3] = &unk_24C06B618;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(ivarQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSSet *)v3;
}

void __34__PKPushRegistry_desiredPushTypes__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (void)setDelegateQueue:(id)a3
{
  objc_storeStrong((id *)&self->_delegateQueue, a3);
}

- (OS_dispatch_queue)ivarQueue
{
  return self->_ivarQueue;
}

- (void)setIvarQueue:(id)a3
{
  objc_storeStrong((id *)&self->_ivarQueue, a3);
}

- (void)setPushTypeToToken:(id)a3
{
  objc_storeStrong((id *)&self->_pushTypeToToken, a3);
}

- (void)setPushTypeToConnection:(id)a3
{
  objc_storeStrong((id *)&self->_pushTypeToConnection, a3);
}

- (int)voipToken
{
  return self->_voipToken;
}

- (void)setVoipToken:(int)a3
{
  self->_voipToken = a3;
}

- (int)complicationToken
{
  return self->_complicationToken;
}

- (void)setComplicationToken:(int)a3
{
  self->_complicationToken = a3;
}

- (int)fileProviderToken
{
  return self->_fileProviderToken;
}

- (void)setFileProviderToken:(int)a3
{
  self->_fileProviderToken = a3;
}

- (int)outstandingVoIPPushes
{
  return self->_outstandingVoIPPushes;
}

- (void)setOutstandingVoIPPushes:(int)a3
{
  self->_outstandingVoIPPushes = a3;
}

- (double)lastReportedCallTime
{
  return self->_lastReportedCallTime;
}

- (void)setLastReportedCallTime:(double)a3
{
  self->_lastReportedCallTime = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pushTypeToConnection, 0);
  objc_storeStrong((id *)&self->_pushTypeToToken, 0);
  objc_storeStrong((id *)&self->_ivarQueue, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_desiredPushTypes, 0);
}

@end
