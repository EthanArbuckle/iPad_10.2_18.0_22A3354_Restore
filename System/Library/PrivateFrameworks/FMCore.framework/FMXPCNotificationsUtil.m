@implementation FMXPCNotificationsUtil

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1)
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_3);
  return (id)sharedInstance__instance;
}

void __40__FMXPCNotificationsUtil_sharedInstance__block_invoke()
{
  FMXPCNotificationsUtil *v0;
  void *v1;

  v0 = objc_alloc_init(FMXPCNotificationsUtil);
  v1 = (void *)sharedInstance__instance;
  sharedInstance__instance = (uint64_t)v0;

}

+ (void)handleDarwinNotificationsWithHandlers:(id)a3
{
  objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_2);
  xpc_set_event_stream_handler("com.apple.notifyd.matching", MEMORY[0x1E0C80D38], &__block_literal_global_7);
}

void __64__FMXPCNotificationsUtil_handleDarwinNotificationsWithHandlers___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
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
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v19[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v4;
    else
      v6 = 0;
  }
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v11);
        +[FMXPCNotificationsUtil sharedInstance](FMXPCNotificationsUtil, "sharedInstance", (_QWORD)v14);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "registerHandler:forDarwinNotification:", v5, v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

}

void __64__FMXPCNotificationsUtil_handleDarwinNotificationsWithHandlers___block_invoke_2(int a1, xpc_object_t xdict)
{
  const char *string;
  void *v3;
  id v4;

  string = xpc_dictionary_get_string(xdict, (const char *)*MEMORY[0x1E0C81298]);
  +[FMXPCNotificationsUtil sharedInstance](FMXPCNotificationsUtil, "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", string);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_didReceiveDarwinNotification:", v3);

}

+ (void)handleDistributedNotificationsWithHandlers:(id)a3
{
  objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_9);
  xpc_set_event_stream_handler("com.apple.distnoted.matching", MEMORY[0x1E0C80D38], &__block_literal_global_11);
}

void __69__FMXPCNotificationsUtil_handleDistributedNotificationsWithHandlers___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
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
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v19[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v4;
    else
      v6 = 0;
  }
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v11);
        +[FMXPCNotificationsUtil sharedInstance](FMXPCNotificationsUtil, "sharedInstance", (_QWORD)v14);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "registerHandler:forDistributedNotification:", v5, v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

}

void __69__FMXPCNotificationsUtil_handleDistributedNotificationsWithHandlers___block_invoke_2(uint64_t a1, void *a2)
{
  const char *v2;
  id v3;
  const char *string;
  void *v5;
  id v6;

  v2 = (const char *)*MEMORY[0x1E0C81298];
  v3 = a2;
  string = xpc_dictionary_get_string(v3, v2);
  +[FMXPCNotificationsUtil sharedInstance](FMXPCNotificationsUtil, "sharedInstance");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", string);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_didReceiveDistributedNotification:withContext:", v5, v3);

}

- (FMXPCNotificationsUtil)init
{
  FMXPCNotificationsUtil *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *darwinNotificationHandlers;
  NSMutableDictionary *v5;
  NSMutableDictionary *distributedNotificationHandlers;
  dispatch_queue_t v7;
  OS_dispatch_queue *modificationQueue;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)FMXPCNotificationsUtil;
  v2 = -[FMXPCNotificationsUtil init](&v10, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    darwinNotificationHandlers = v2->_darwinNotificationHandlers;
    v2->_darwinNotificationHandlers = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    distributedNotificationHandlers = v2->_distributedNotificationHandlers;
    v2->_distributedNotificationHandlers = v5;

    v7 = dispatch_queue_create("com.apple.icloud.FindMyDevice.xpcNotificationsModQueue", 0);
    modificationQueue = v2->_modificationQueue;
    v2->_modificationQueue = (OS_dispatch_queue *)v7;

  }
  return v2;
}

- (BOOL)isHandlerRegisteredForDarwinNotification:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  -[FMXPCNotificationsUtil modificationQueue](self, "modificationQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__FMXPCNotificationsUtil_isHandlerRegisteredForDarwinNotification___block_invoke;
  block[3] = &unk_1E82AA9D0;
  v9 = v4;
  v10 = &v11;
  block[4] = self;
  v6 = v4;
  dispatch_sync(v5, block);

  LOBYTE(v4) = *((_BYTE *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return (char)v4;
}

void __67__FMXPCNotificationsUtil_isHandlerRegisteredForDarwinNotification___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "darwinNotificationHandlers");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v2 != 0;

}

- (void)registerHandler:(id)a3 forDarwinNotification:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  -[FMXPCNotificationsUtil modificationQueue](self, "modificationQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __64__FMXPCNotificationsUtil_registerHandler_forDarwinNotification___block_invoke;
  v11[3] = &unk_1E82AA6E8;
  objc_copyWeak(&v14, &location);
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(v8, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __64__FMXPCNotificationsUtil_registerHandler_forDarwinNotification___block_invoke(id *a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  objc_msgSend(WeakRetained, "darwinNotificationHandlers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", a1[4]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    LogCategory_Unspecified();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = a1[4];
      v9 = 138412290;
      v10 = v6;
      _os_log_impl(&dword_1C9967000, v5, OS_LOG_TYPE_INFO, "Trying to register a duplicate handler for notification %@", (uint8_t *)&v9, 0xCu);
    }
  }
  else
  {
    v7 = (void *)objc_msgSend(a1[5], "copy");
    objc_msgSend(WeakRetained, "darwinNotificationHandlers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, a1[4]);

    v5 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v5, "Notification", (const char *)objc_msgSend(objc_retainAutorelease(a1[4]), "cStringUsingEncoding:", 4));
    objc_msgSend(objc_retainAutorelease(a1[4]), "cStringUsingEncoding:", 4);
    xpc_set_event();
  }

}

- (void)deregisterHandlerForDarwinNotification:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[FMXPCNotificationsUtil modificationQueue](self, "modificationQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__FMXPCNotificationsUtil_deregisterHandlerForDarwinNotification___block_invoke;
  block[3] = &unk_1E82AA9F8;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __65__FMXPCNotificationsUtil_deregisterHandlerForDarwinNotification___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "darwinNotificationHandlers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(WeakRetained, "darwinNotificationHandlers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObjectForKey:", *(_QWORD *)(a1 + 32));

  }
  objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "cStringUsingEncoding:", 4);
  xpc_set_event();

}

- (BOOL)isHandlerRegisteredForDistributedNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[FMXPCNotificationsUtil distributedNotificationHandlers](self, "distributedNotificationHandlers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6 != 0;
}

- (void)registerHandler:(id)a3 forDistributedNotification:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  -[FMXPCNotificationsUtil modificationQueue](self, "modificationQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __69__FMXPCNotificationsUtil_registerHandler_forDistributedNotification___block_invoke;
  v11[3] = &unk_1E82AA6E8;
  objc_copyWeak(&v14, &location);
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(v8, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __69__FMXPCNotificationsUtil_registerHandler_forDistributedNotification___block_invoke(id *a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  objc_msgSend(WeakRetained, "distributedNotificationHandlers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", a1[4]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    LogCategory_Unspecified();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = a1[4];
      v9 = 138412290;
      v10 = v6;
      _os_log_impl(&dword_1C9967000, v5, OS_LOG_TYPE_INFO, "Trying to register a duplicate handler for notification %@", (uint8_t *)&v9, 0xCu);
    }
  }
  else
  {
    v7 = (void *)objc_msgSend(a1[5], "copy");
    objc_msgSend(WeakRetained, "distributedNotificationHandlers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, a1[4]);

    v5 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v5, "Name", (const char *)objc_msgSend(objc_retainAutorelease(a1[4]), "cStringUsingEncoding:", 4));
    objc_msgSend(objc_retainAutorelease(a1[4]), "cStringUsingEncoding:", 4);
    xpc_set_event();
  }

}

- (void)deregisterHandlerForDistributedNotification:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[FMXPCNotificationsUtil modificationQueue](self, "modificationQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__FMXPCNotificationsUtil_deregisterHandlerForDistributedNotification___block_invoke;
  block[3] = &unk_1E82AA9F8;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __70__FMXPCNotificationsUtil_deregisterHandlerForDistributedNotification___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "distributedNotificationHandlers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(WeakRetained, "distributedNotificationHandlers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObjectForKey:", *(_QWORD *)(a1 + 32));

  }
  objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "cStringUsingEncoding:", 4);
  xpc_set_event();

}

- (void)_didReceiveDarwinNotification:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[FMXPCNotificationsUtil modificationQueue](self, "modificationQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__FMXPCNotificationsUtil__didReceiveDarwinNotification___block_invoke;
  block[3] = &unk_1E82AA9F8;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __56__FMXPCNotificationsUtil__didReceiveDarwinNotification___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  _QWORD block[4];
  NSObject *v9;
  uint8_t buf[4];
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "darwinNotificationHandlers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    dispatch_get_global_queue(0, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __56__FMXPCNotificationsUtil__didReceiveDarwinNotification___block_invoke_2;
    block[3] = &unk_1E82AAA20;
    v9 = v4;
    dispatch_async(v5, block);

    v6 = v9;
  }
  else
  {
    LogCategory_Unspecified();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v11 = v7;
      _os_log_impl(&dword_1C9967000, v6, OS_LOG_TYPE_INFO, "Received darwin notification %@ but no handler found", buf, 0xCu);
    }
  }

}

uint64_t __56__FMXPCNotificationsUtil__didReceiveDarwinNotification___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_didReceiveDistributedNotification:(id)a3 withContext:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  -[FMXPCNotificationsUtil modificationQueue](self, "modificationQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __73__FMXPCNotificationsUtil__didReceiveDistributedNotification_withContext___block_invoke;
  v11[3] = &unk_1E82AAA48;
  objc_copyWeak(&v14, &location);
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __73__FMXPCNotificationsUtil__didReceiveDistributedNotification_withContext___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  NSObject *v10;
  uint8_t buf[4];
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "distributedNotificationHandlers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    dispatch_get_global_queue(0, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __73__FMXPCNotificationsUtil__didReceiveDistributedNotification_withContext___block_invoke_2;
    v8[3] = &unk_1E82AA5F8;
    v10 = v4;
    v9 = *(id *)(a1 + 40);
    dispatch_async(v5, v8);

    v6 = v10;
  }
  else
  {
    LogCategory_Unspecified();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v12 = v7;
      _os_log_impl(&dword_1C9967000, v6, OS_LOG_TYPE_INFO, "Received distributed notification %@ but no handler found", buf, 0xCu);
    }
  }

}

uint64_t __73__FMXPCNotificationsUtil__didReceiveDistributedNotification_withContext___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (NSMutableDictionary)darwinNotificationHandlers
{
  return self->_darwinNotificationHandlers;
}

- (void)setDarwinNotificationHandlers:(id)a3
{
  objc_storeStrong((id *)&self->_darwinNotificationHandlers, a3);
}

- (NSMutableDictionary)distributedNotificationHandlers
{
  return self->_distributedNotificationHandlers;
}

- (void)setDistributedNotificationHandlers:(id)a3
{
  objc_storeStrong((id *)&self->_distributedNotificationHandlers, a3);
}

- (OS_dispatch_queue)modificationQueue
{
  return self->_modificationQueue;
}

- (void)setModificationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_modificationQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modificationQueue, 0);
  objc_storeStrong((id *)&self->_distributedNotificationHandlers, 0);
  objc_storeStrong((id *)&self->_darwinNotificationHandlers, 0);
}

@end
