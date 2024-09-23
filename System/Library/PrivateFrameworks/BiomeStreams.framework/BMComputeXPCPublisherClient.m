@implementation BMComputeXPCPublisherClient

void __70__BMComputeXPCPublisherClient_initializeSharedClientWithQueue_domain___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;

  v3 = a2;
  v4 = (void *)MEMORY[0x193FED914]();
  __biome_log_for_category();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    __70__BMComputeXPCPublisherClient_initializeSharedClientWithQueue_domain___block_invoke_cold_1(a1, (uint64_t)v4, v5);

  free(v4);
  objc_msgSend((id)_computeXPCPublisherClient, "_handleEventWithPayload:", v3);

}

- (void)_handleEventWithPayload:(id)a3
{
  id v4;
  NSObject *v5;
  os_unfair_lock_s *p_lock;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  char *string;
  void *data;
  id v13;
  void *v14;
  id v15;
  void *v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void (**v23)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v24;
  id v25;
  size_t length;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[BMComputeXPCPublisherClient queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", xpc_dictionary_get_string(v4, "identifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  __biome_log_for_category();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v28 = v7;
    _os_log_impl(&dword_18D810000, v8, OS_LOG_TYPE_INFO, "BMComputeXPCPublisherClient handle event for subscription with identifier %@", buf, 0xCu);
  }

  -[BMComputeXPCPublisherClient subscriptions](self, "subscriptions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    string = (char *)xpc_dictionary_get_string(v4, "stream");
    if (string)
      string = (char *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", string);
    length = 0;
    data = (void *)xpc_dictionary_get_data(v4, "event", &length);
    if (data)
    {
      v13 = objc_alloc(MEMORY[0x1E0C99D50]);
      v14 = (void *)objc_msgSend(v13, "initWithBytes:length:", data, length);
      v25 = 0;
      objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v14, &v25);
      data = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v25;
      if (v15)
      {
        v16 = (void *)MEMORY[0x193FED914](v4);
        __biome_log_for_category();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          -[BMComputeXPCPublisherClient _handleEventWithPayload:].cold.1();

        free(v16);
      }
      else
      {
        __biome_log_for_category();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          v20 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(data, "timestamp");
          objc_msgSend(v20, "numberWithDouble:");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(data, "eventBody");
          v21 = objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v28 = data;
          v29 = 2112;
          v30 = v24;
          v31 = 2112;
          v32 = v21;
          v22 = (void *)v21;
          _os_log_impl(&dword_18D810000, v19, OS_LOG_TYPE_INFO, "Handling store event from xpc_event publisher %@ %@ %@", buf, 0x20u);

        }
      }

    }
    os_unfair_lock_unlock(p_lock);
    objc_msgSend(v10, "block");
    v23 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, char *, void *))v23)[2](v23, v10, string, data);

  }
  else
  {
    -[BMComputeXPCPublisherClient pendingEvents](self, "pendingEvents");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v4, v7);

    os_unfair_lock_unlock(p_lock);
  }

}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSMutableDictionary)subscriptions
{
  return self->_subscriptions;
}

+ (void)_setQueue:(id)a3 domain:(unint64_t)a4
{
  id v6;

  v6 = a3;
  os_unfair_lock_assert_not_owner((const os_unfair_lock *)&_computeXPCPublisherClientLock);
  os_unfair_lock_lock((os_unfair_lock_t)&_computeXPCPublisherClientLock);
  if (!_computeXPCPublisherClient)
    objc_msgSend(a1, "initializeSharedClientWithQueue:domain:", v6, a4);
  os_unfair_lock_unlock((os_unfair_lock_t)&_computeXPCPublisherClientLock);

}

+ (id)shared
{
  void *v3;
  uint64_t v4;
  NSObject *v5;
  dispatch_queue_t v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0D01D18], "current");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isRunningInUserContext") ^ 1;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = dispatch_queue_create("com.apple.BMComputeXPCPublisherClient.queue", v5);

  objc_msgSend(a1, "sharedWithQueue:domain:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)sharedWithQueue:(id)a3 domain:(unint64_t)a4
{
  id v6;
  id v7;

  v6 = a3;
  os_unfair_lock_assert_not_owner((const os_unfair_lock *)&_computeXPCPublisherClientLock);
  os_unfair_lock_lock((os_unfair_lock_t)&_computeXPCPublisherClientLock);
  if (!_computeXPCPublisherClient)
    objc_msgSend(a1, "initializeSharedClientWithQueue:domain:", v6, a4);
  os_unfair_lock_unlock((os_unfair_lock_t)&_computeXPCPublisherClientLock);
  v7 = (id)_computeXPCPublisherClient;

  return v7;
}

+ (void)initializeSharedClientWithQueue:(id)a3 domain:(unint64_t)a4
{
  NSObject *v5;
  BMComputeXPCPublisherClientDomainConfiguration *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;
  id v11;
  const char *v12;
  id v13;
  _QWORD handler[4];
  id v15;

  v5 = a3;
  os_unfair_lock_assert_owner((const os_unfair_lock *)&_computeXPCPublisherClientLock);
  v6 = -[BMComputeXPCPublisherClientDomainConfiguration initWithDomain:]([BMComputeXPCPublisherClientDomainConfiguration alloc], "initWithDomain:", a4);
  v7 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithQueue:configuration:listenerEndpoint:localComputePublisher:", v5, v6, 0, 0);
  v8 = (void *)_computeXPCPublisherClient;
  _computeXPCPublisherClient = v7;

  objc_msgSend(MEMORY[0x1E0D01D18], "current");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isManagedByLaunchd");

  if (v10)
  {
    -[BMComputeXPCPublisherClientDomainConfiguration XPCPublisherStreamName](v6, "XPCPublisherStreamName");
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v12 = (const char *)objc_msgSend(v11, "UTF8String");
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __70__BMComputeXPCPublisherClient_initializeSharedClientWithQueue_domain___block_invoke;
    handler[3] = &unk_1E2649948;
    v15 = v11;
    v13 = v11;
    xpc_set_event_stream_handler(v12, v5, handler);

  }
}

- (BMComputeXPCPublisherClient)initWithQueue:(id)a3 domain:(unint64_t)a4 listenerEndpoint:(id)a5 localComputePublisher:(id)a6
{
  id v10;
  id v11;
  id v12;
  BMComputeXPCPublisherClientDomainConfiguration *v13;
  BMComputeXPCPublisherClient *v14;

  v10 = a6;
  v11 = a5;
  v12 = a3;
  v13 = -[BMComputeXPCPublisherClientDomainConfiguration initWithDomain:]([BMComputeXPCPublisherClientDomainConfiguration alloc], "initWithDomain:", a4);
  v14 = -[BMComputeXPCPublisherClient initWithQueue:configuration:listenerEndpoint:localComputePublisher:](self, "initWithQueue:configuration:listenerEndpoint:localComputePublisher:", v12, v13, v11, v10);

  return v14;
}

- (BMComputeXPCPublisherClient)initWithQueue:(id)a3 configuration:(id)a4 listenerEndpoint:(id)a5 localComputePublisher:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  BMComputeXPCPublisherClient *v15;
  BMComputeXPCPublisherClient *v16;
  NSMutableDictionary *v17;
  NSMutableDictionary *subscriptions;
  NSMutableDictionary *v19;
  NSMutableDictionary *pendingEvents;
  objc_super v22;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v22.receiver = self;
  v22.super_class = (Class)BMComputeXPCPublisherClient;
  v15 = -[BMComputeXPCPublisherClient init](&v22, sel_init);
  v16 = v15;
  if (v15)
  {
    v15->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v15->_queue, a3);
    objc_storeStrong((id *)&v16->_listenerEndpoint, a5);
    v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    subscriptions = v16->_subscriptions;
    v16->_subscriptions = v17;

    v19 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    pendingEvents = v16->_pendingEvents;
    v16->_pendingEvents = v19;

    objc_storeStrong((id *)&v16->_configuration, a4);
    objc_storeStrong((id *)&v16->_localComputePublisher, a6);
    v16->_token = -1;
  }

  return v16;
}

- (void)dealloc
{
  os_unfair_lock_s *p_lock;
  NSXPCConnection *connection;
  objc_super v5;

  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  -[BMComputeXPCPublisherClient unregisterBiomeLaunchNotification](self, "unregisterBiomeLaunchNotification");
  -[NSXPCConnection invalidate](self->_connection, "invalidate");
  connection = self->_connection;
  self->_connection = 0;

  os_unfair_lock_unlock(p_lock);
  v5.receiver = self;
  v5.super_class = (Class)BMComputeXPCPublisherClient;
  -[BMComputeXPCPublisherClient dealloc](&v5, sel_dealloc);
}

- (NSXPCConnection)connection
{
  NSXPCConnection *connection;
  NSXPCConnection *v4;
  void *v5;
  id v6;
  NSXPCConnection *v7;
  NSXPCConnection *v8;
  NSXPCConnection *v9;
  void *v10;
  void *v11;
  void *v12;
  NSXPCConnection *v13;
  uint64_t v14;
  NSXPCConnection *v15;
  _QWORD v17[4];
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id from;
  id location;

  os_unfair_lock_assert_owner(&self->_lock);
  connection = self->_connection;
  if (!connection)
  {
    if (self->_listenerEndpoint)
    {
      v4 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithListenerEndpoint:", self->_listenerEndpoint);
      v5 = self->_connection;
      self->_connection = v4;
    }
    else
    {
      -[BMComputeXPCPublisherClientDomainConfiguration domain](self->_configuration, "domain");
      v6 = objc_alloc(MEMORY[0x1E0CB3B38]);
      -[BMComputeXPCPublisherClientDomainConfiguration machServiceName](self->_configuration, "machServiceName");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (NSXPCConnection *)objc_msgSend(v6, "initWithMachServiceName:options:", v5, 0);
      v8 = self->_connection;
      self->_connection = v7;

    }
    v9 = self->_connection;
    -[BMComputeXPCPublisherClient queue](self, "queue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection _setQueue:](v9, "_setQueue:", v10);

    BMComputePublisherInterface();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](self->_connection, "setRemoteObjectInterface:", v11);

    BMComputePublishingInterface();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setExportedInterface:](self->_connection, "setExportedInterface:", v12);

    -[NSXPCConnection setExportedObject:](self->_connection, "setExportedObject:", self);
    objc_initWeak(&location, self);
    objc_initWeak(&from, self->_connection);
    v13 = self->_connection;
    v14 = MEMORY[0x1E0C809B0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __41__BMComputeXPCPublisherClient_connection__block_invoke;
    v20[3] = &unk_1E2648630;
    objc_copyWeak(&v21, &from);
    -[NSXPCConnection setInterruptionHandler:](v13, "setInterruptionHandler:", v20);
    v15 = self->_connection;
    v17[0] = v14;
    v17[1] = 3221225472;
    v17[2] = __41__BMComputeXPCPublisherClient_connection__block_invoke_33;
    v17[3] = &unk_1E2648658;
    objc_copyWeak(&v18, &location);
    objc_copyWeak(&v19, &from);
    -[NSXPCConnection setInvalidationHandler:](v15, "setInvalidationHandler:", v17);
    -[NSXPCConnection resume](self->_connection, "resume");
    objc_destroyWeak(&v19);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&v21);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
    connection = self->_connection;
  }
  return connection;
}

void __41__BMComputeXPCPublisherClient_connection__block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  __biome_log_for_category();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v4 = 138412290;
    v5 = WeakRetained;
    _os_log_impl(&dword_18D810000, v2, OS_LOG_TYPE_DEFAULT, "BMComputePublisherServiceClient connection %@ interrupted", (uint8_t *)&v4, 0xCu);

  }
}

void __41__BMComputeXPCPublisherClient_connection__block_invoke_33(uint64_t a1)
{
  id WeakRetained;
  id v3;
  void *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t v21[128];
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  __CFString *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "_xpcConnection");
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(v4, "_xpcConnection");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)xpc_connection_copy_invalidation_reason();

      if (v7)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v7);
        v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v5 = CFSTR("<unknown>");
      }
      free(v7);
    }
  }
  else
  {
    v5 = 0;
  }
  __biome_log_for_category();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v23 = v4;
    v24 = 2114;
    v25 = v5;
    _os_log_impl(&dword_18D810000, v8, OS_LOG_TYPE_INFO, "BMComputePublisherServiceClient connection %@ invalidated because %{public}@", buf, 0x16u);
  }

  if (WeakRetained)
  {
    os_unfair_lock_lock((os_unfair_lock_t)WeakRetained + 2);
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v9 = (void *)objc_msgSend(*((id *)WeakRetained + 8), "copy", 0);
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v18 != v12)
            objc_enumerationMutation(v9);
          v14 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
          objc_msgSend(*((id *)WeakRetained + 8), "objectForKeyedSubscript:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v15, "waking") & 1) == 0)
            objc_msgSend(*((id *)WeakRetained + 8), "removeObjectForKey:", v14);

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v11);
    }

    v16 = (void *)*((_QWORD *)WeakRetained + 2);
    *((_QWORD *)WeakRetained + 2) = 0;

    os_unfair_lock_unlock((os_unfair_lock_t)WeakRetained + 2);
  }

}

- (id)computePublisherObjectWithErrorHandler:(id)a3
{
  id v4;
  BMComputePublisher *localComputePublisher;
  BMComputePublisher *v6;
  void *v7;

  v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  localComputePublisher = self->_localComputePublisher;
  if (localComputePublisher)
  {
    v6 = localComputePublisher;
  }
  else
  {
    -[BMComputeXPCPublisherClient connection](self, "connection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "synchronousRemoteObjectProxyWithErrorHandler:", v4);
    v6 = (BMComputePublisher *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (BOOL)isRegisteredForRelaunchNotification
{
  os_unfair_lock_assert_owner(&self->_lock);
  return self->_token != -1;
}

- (void)registerBiomeLaunchNotification
{
  *(_DWORD *)a2 = 138412290;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_2_5(&dword_18D810000, a3, (uint64_t)a3, "Failed to register for biomed re-launch notification, status: %@", (uint8_t *)a2);

}

void __62__BMComputeXPCPublisherClient_registerBiomeLaunchNotification__block_invoke(uint64_t a1, int a2)
{
  _DWORD *WeakRetained;
  NSObject *v4;
  _DWORD *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    objc_msgSend(WeakRetained, "queue");
    v4 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v4);

    WeakRetained = v5;
    if (v5[6] == a2)
    {
      objc_msgSend(v5, "handleBiomeRelaunch");
      WeakRetained = v5;
    }
  }

}

- (void)unregisterBiomeLaunchNotification
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_18D810000, log, OS_LOG_TYPE_DEBUG, "Unregistering for biomed re-launch notification", v1, 2u);
}

- (void)handleBiomeRelaunch
{
  NSObject *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  NSObject *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  uint64_t v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  -[BMComputeXPCPublisherClient queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  __biome_log_for_category();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18D810000, v4, OS_LOG_TYPE_INFO, "Handling biomed re-launch notification", buf, 2u);
  }

  -[BMComputeXPCPublisherClient subscriptions](self, "subscriptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_19);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "filteredArrayUsingPredicate:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        __biome_log_for_category();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v21 = v14;
          _os_log_impl(&dword_18D810000, v15, OS_LOG_TYPE_DEFAULT, "re-subscribing subscription after biomed re-launch %@", buf, 0xCu);
        }

        -[BMComputeXPCPublisherClient subscribeViaNSXPC:](self, "subscribeViaNSXPC:", v14);
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
    }
    while (v11);
  }

  os_unfair_lock_unlock(&self->_lock);
}

uint64_t __50__BMComputeXPCPublisherClient_handleBiomeRelaunch__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "waking") ^ 1;
}

- (void)subscribe:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  BMComputePublisher *localComputePublisher;
  void *v9;
  BOOL v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  BMComputePublisher *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  os_unfair_lock_assert_not_owner(&self->_lock);
  __biome_log_for_category();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    -[BMComputeXPCPublisherClientDomainConfiguration machServiceName](self->_configuration, "machServiceName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[BMComputeXPCPublisherClientDomainConfiguration XPCPublisherStreamName](self->_configuration, "XPCPublisherStreamName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    localComputePublisher = self->_localComputePublisher;
    v13 = 138413058;
    v14 = v6;
    v15 = 2112;
    v16 = v7;
    v17 = 2112;
    v18 = localComputePublisher;
    v19 = 2112;
    v20 = v4;
    _os_log_impl(&dword_18D810000, v5, OS_LOG_TYPE_INFO, "BMComputeXPCPublisherClient subscribe with connection name: %@, publisher stream name: %@, localPublisher: %@, subscription: %@", (uint8_t *)&v13, 0x2Au);

  }
  if (v4)
  {
    objc_msgSend(v4, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9 == 0;

    if (!v10)
    {
      os_unfair_lock_lock(&self->_lock);
      if (!-[BMComputeXPCPublisherClient numberOfExistingNonWakingSubscriptions](self, "numberOfExistingNonWakingSubscriptions")&& (objc_msgSend(v4, "waking") & 1) == 0)
      {
        -[BMComputeXPCPublisherClient registerBiomeLaunchNotification](self, "registerBiomeLaunchNotification");
      }
      -[BMComputeXPCPublisherClient subscriptions](self, "subscriptions");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v4, v12);

      if (objc_msgSend(v4, "waking"))
        -[BMComputeXPCPublisherClient subscribeViaXPCEvent:](self, "subscribeViaXPCEvent:", v4);
      else
        -[BMComputeXPCPublisherClient subscribeViaNSXPC:](self, "subscribeViaNSXPC:", v4);
      os_unfair_lock_unlock(&self->_lock);
    }
  }

}

- (void)subscribeViaXPCEvent:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD block[5];
  id v16;

  v5 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  if ((objc_msgSend(v5, "waking") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BMComputeXPCPublisherClient.m"), 371, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("subscription.waking"));

  }
  -[BMComputeXPCPublisherClient pendingEvents](self, "pendingEvents");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[BMComputeXPCPublisherClient pendingEvents](self, "pendingEvents");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeObjectForKey:", v10);

  if (v8)
  {
    -[BMComputeXPCPublisherClient queue](self, "queue");
    v11 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __52__BMComputeXPCPublisherClient_subscribeViaXPCEvent___block_invoke;
    block[3] = &unk_1E2647868;
    block[4] = self;
    v16 = v8;
    dispatch_async(v11, block);

  }
  objc_msgSend(v5, "XPCEvent");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMComputeXPCPublisherClient _setXPCEvent:identifier:](self, "_setXPCEvent:identifier:", v12, v13);

}

uint64_t __52__BMComputeXPCPublisherClient_subscribeViaXPCEvent___block_invoke(uint64_t a1)
{
  NSObject *v2;

  __biome_log_for_category();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __52__BMComputeXPCPublisherClient_subscribeViaXPCEvent___block_invoke_cold_1(a1, v2);

  return objc_msgSend(*(id *)(a1 + 32), "_handleEventWithPayload:", *(_QWORD *)(a1 + 40));
}

- (void)subscribeViaNSXPC:(id)a3
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id location;

  v5 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  if (objc_msgSend(v5, "waking"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BMComputeXPCPublisherClient.m"), 391, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!subscription.waking"));

  }
  objc_initWeak(&location, self);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __49__BMComputeXPCPublisherClient_subscribeViaNSXPC___block_invoke;
  v9[3] = &unk_1E26499B8;
  objc_copyWeak(&v11, &location);
  v6 = v5;
  v10 = v6;
  -[BMComputeXPCPublisherClient computePublisherObjectWithErrorHandler:](self, "computePublisherObjectWithErrorHandler:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "subscribe:", v6);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

void __49__BMComputeXPCPublisherClient_subscribeViaNSXPC___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  os_unfair_lock_s *WeakRetained;
  NSObject *v5;
  void *v6;
  void *v7;

  v3 = a2;
  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 40));
  __biome_log_for_category();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    __49__BMComputeXPCPublisherClient_subscribeViaNSXPC___block_invoke_cold_1(a1);

  if (WeakRetained)
  {
    os_unfair_lock_lock(WeakRetained + 2);
    v6 = *(void **)&WeakRetained[16]._os_unfair_lock_opaque;
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", 0, v7);

    os_unfair_lock_unlock(WeakRetained + 2);
  }

}

- (void)unsubscribeWithIdentifier:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  NSObject *v6;
  void *v7;
  void *v8;
  BMComputePublisher *localComputePublisher;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  _QWORD v17[4];
  NSObject *v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  BMComputePublisher *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  __biome_log_for_category();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    -[BMComputeXPCPublisherClientDomainConfiguration machServiceName](self->_configuration, "machServiceName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[BMComputeXPCPublisherClientDomainConfiguration XPCPublisherStreamName](self->_configuration, "XPCPublisherStreamName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    localComputePublisher = self->_localComputePublisher;
    *(_DWORD *)buf = 138413058;
    v20 = v7;
    v21 = 2112;
    v22 = v8;
    v23 = 2112;
    v24 = localComputePublisher;
    v25 = 2112;
    v26 = v4;
    _os_log_impl(&dword_18D810000, v6, OS_LOG_TYPE_INFO, "BMComputeXPCPublisherClient unsubscribe with connection name: %@, publisher stream name: %@, localPublisher: %@, identifier: %@", buf, 0x2Au);

  }
  -[BMComputeXPCPublisherClient subscriptions](self, "subscriptions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    __biome_log_for_category();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      -[BMComputeXPCPublisherClient unsubscribeWithIdentifier:].cold.1();
    goto LABEL_11;
  }
  -[BMComputeXPCPublisherClient subscriptions](self, "subscriptions");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "removeObjectForKey:", v4);

  if (!objc_msgSend(v11, "waking"))
  {
    if (!-[BMComputeXPCPublisherClient numberOfExistingNonWakingSubscriptions](self, "numberOfExistingNonWakingSubscriptions"))-[BMComputeXPCPublisherClient unregisterBiomeLaunchNotification](self, "unregisterBiomeLaunchNotification");
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __57__BMComputeXPCPublisherClient_unsubscribeWithIdentifier___block_invoke;
    v17[3] = &unk_1E2648718;
    v15 = v4;
    v18 = v15;
    -[BMComputeXPCPublisherClient computePublisherObjectWithErrorHandler:](self, "computePublisherObjectWithErrorHandler:", v17);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "unsubscribeWithIdentifier:", v15);

    v14 = v18;
LABEL_11:

    goto LABEL_12;
  }
  -[BMComputeXPCPublisherClient pendingEvents](self, "pendingEvents");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "removeObjectForKey:", v4);

  -[BMComputeXPCPublisherClient _setXPCEvent:identifier:](self, "_setXPCEvent:identifier:", 0, v4);
LABEL_12:

  os_unfair_lock_unlock(p_lock);
}

void __57__BMComputeXPCPublisherClient_unsubscribeWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  __biome_log_for_category();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __57__BMComputeXPCPublisherClient_unsubscribeWithIdentifier___block_invoke_cold_1(a1);

}

- (void)receiveInputForIdentifier:(id)a3 streamIdentifier:(id)a4 storeEvent:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  os_unfair_lock_s *p_lock;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  void (**v17)(_QWORD, _QWORD, _QWORD, _QWORD);

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[BMComputeXPCPublisherClient queue](self, "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v11);

  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  __biome_log_for_category();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    -[BMComputeXPCPublisherClient receiveInputForIdentifier:streamIdentifier:storeEvent:].cold.2((uint64_t)v8, v13, v14);

  if (v8)
  {
    os_unfair_lock_lock(&self->_lock);
    -[BMComputeXPCPublisherClient subscriptions](self, "subscriptions");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKeyedSubscript:", v8);
    v16 = objc_claimAutoreleasedReturnValue();

    os_unfair_lock_unlock(p_lock);
    if (v16)
    {
      -[NSObject block](v16, "block");
      v17 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, NSObject *, id, id))v17)[2](v17, v16, v9, v10);

    }
  }
  else
  {
    __biome_log_for_category();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[BMComputeXPCPublisherClient receiveInputForIdentifier:streamIdentifier:storeEvent:].cold.1(v16);
  }

}

- (unint64_t)numberOfExistingNonWakingSubscriptions
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;

  -[BMComputeXPCPublisherClient subscriptions](self, "subscriptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_50);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "filteredArrayUsingPredicate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  return v6;
}

uint64_t __69__BMComputeXPCPublisherClient_numberOfExistingNonWakingSubscriptions__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "waking") ^ 1;
}

- (void)_setXPCEvent:(id)a3 identifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  BOOL v19;
  int v20;
  NSObject *v21;
  id v22;
  int v23;
  id v24;
  __int16 v25;
  id v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  os_unfair_lock_assert_owner(&self->_lock);
  if (!v6)
    goto LABEL_12;
  if (-[BMComputeXPCPublisherClientDomainConfiguration domain](self->_configuration, "domain") == 1)
  {
    +[BMDaemon userComputePublisherStreamName](BMDaemon, "userComputePublisherStreamName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
      goto LABEL_12;
  }
  else
  {
    if (-[BMComputeXPCPublisherClientDomainConfiguration domain](self->_configuration, "domain"))
      goto LABEL_12;
    +[BMDaemon systemComputePublisherStreamName](BMDaemon, "systemComputePublisherStreamName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
      goto LABEL_12;
  }
  v9 = objc_retainAutorelease(v8);
  objc_msgSend(v9, "UTF8String");
  v10 = objc_retainAutorelease(v7);
  objc_msgSend(v10, "UTF8String");
  v11 = (void *)xpc_copy_event();
  if (v11)
  {
    v12 = objc_retainAutorelease(v9);
    objc_msgSend(v12, "UTF8String");
    v13 = objc_retainAutorelease(v10);
    objc_msgSend(v13, "UTF8String");
    xpc_set_event();
    __biome_log_for_category();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      -[BMComputeXPCPublisherClientDomainConfiguration XPCPublisherStreamName](self->_configuration, "XPCPublisherStreamName");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138412802;
      v24 = v13;
      v25 = 2112;
      v26 = v12;
      v27 = 2112;
      v28 = v15;
      _os_log_impl(&dword_18D810000, v14, OS_LOG_TYPE_DEFAULT, "Cancelled existing xpc event subscription: %@ to stream: %@ because of new subscription to stream: %@", (uint8_t *)&v23, 0x20u);

    }
  }

LABEL_12:
  -[BMComputeXPCPublisherClientDomainConfiguration XPCPublisherStreamName](self->_configuration, "XPCPublisherStreamName");
  v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v16, "UTF8String");
  v17 = objc_retainAutorelease(v7);
  objc_msgSend(v17, "UTF8String");
  v18 = (void *)xpc_copy_event();

  if (v6)
    v19 = v18 == 0;
  else
    v19 = 1;
  v20 = v19;
  if (v6 && v18 && !xpc_equal(v6, v18))
  {
    __biome_log_for_category();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      -[BMComputeXPCPublisherClient _setXPCEvent:identifier:].cold.1();

  }
  if (v20)
  {
    -[BMComputeXPCPublisherClientDomainConfiguration XPCPublisherStreamName](self->_configuration, "XPCPublisherStreamName");
    v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v22, "UTF8String");
    objc_msgSend(objc_retainAutorelease(v17), "UTF8String");
    xpc_set_event();

  }
}

- (NSMutableDictionary)pendingEvents
{
  return self->_pendingEvents;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingEvents, 0);
  objc_storeStrong((id *)&self->_subscriptions, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_localComputePublisher, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_listenerEndpoint, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

void __70__BMComputeXPCPublisherClient_initializeSharedClientWithQueue_domain___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138412546;
  v5 = v3;
  v6 = 2080;
  v7 = a2;
  OUTLINED_FUNCTION_0_4(&dword_18D810000, a3, (uint64_t)a3, "Received new event on '%@' %s", (uint8_t *)&v4);
  OUTLINED_FUNCTION_5();
}

void __52__BMComputeXPCPublisherClient_subscribeViaXPCEvent___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6[12];
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "XPCPublisherStreamName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_10();
  v7 = 2112;
  v8 = v4;
  OUTLINED_FUNCTION_0_4(&dword_18D810000, a2, v5, "Forwarding pending event on '%@' %@", v6);

}

void __49__BMComputeXPCPublisherClient_subscribeViaNSXPC___block_invoke_cold_1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = *(_QWORD *)(a1 + 32);
  OUTLINED_FUNCTION_4_5();
  OUTLINED_FUNCTION_0_1(&dword_18D810000, v1, v2, "BMComputePublisherServiceClient XPC error in subscribe:%@, %@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_5();
}

- (void)unsubscribeWithIdentifier:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_10();
  _os_log_debug_impl(&dword_18D810000, v0, OS_LOG_TYPE_DEBUG, "Unable to unsubscribe, missing subscription for identifier %@", v1, 0xCu);
  OUTLINED_FUNCTION_5();
}

void __57__BMComputeXPCPublisherClient_unsubscribeWithIdentifier___block_invoke_cold_1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = *(_QWORD *)(a1 + 32);
  OUTLINED_FUNCTION_4_5();
  OUTLINED_FUNCTION_0_1(&dword_18D810000, v1, v2, "BMComputePublisherServiceClient XPC error in unsubscribeWithIdentifier:%@, %@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_5();
}

- (void)receiveInputForIdentifier:(os_log_t)log streamIdentifier:storeEvent:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18D810000, log, OS_LOG_TYPE_ERROR, "BMComputeXPCPublisherServer dropping receiveInputForIdentifier: due to nil identifier", v1, 2u);
}

- (void)receiveInputForIdentifier:(uint64_t)a1 streamIdentifier:(NSObject *)a2 storeEvent:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  const char *v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 136315394;
  v4 = "-[BMComputeXPCPublisherClient receiveInputForIdentifier:streamIdentifier:storeEvent:]";
  v5 = 2112;
  v6 = a1;
  OUTLINED_FUNCTION_0_4(&dword_18D810000, a2, a3, "%s %@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_5();
}

- (void)_handleEventWithPayload:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_4_5();
  OUTLINED_FUNCTION_0_1(&dword_18D810000, v0, v1, "Failed to unarchive store event from payload %s %@");
  OUTLINED_FUNCTION_5();
}

- (void)_setXPCEvent:identifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_2_5(&dword_18D810000, v0, v1, "Error attempting to modify subscription with identifier %@ without first unsubscribing", v2);
  OUTLINED_FUNCTION_5();
}

@end
