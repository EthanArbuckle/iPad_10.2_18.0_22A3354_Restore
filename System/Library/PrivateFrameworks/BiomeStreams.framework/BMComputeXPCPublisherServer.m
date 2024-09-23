@implementation BMComputeXPCPublisherServer

- (void)receiveInputForSubscription:(id)a3 streamIdentifier:(id)a4 storeEvent:(id)a5
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  id v15;
  void *empty;
  NSObject *v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  id v27;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  -[BMComputeXPCPublisherServer queue](self, "queue");
  v12 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v12);

  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BMComputeXPCPublisherServer.m"), 488, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("subscription"));

  }
  __biome_log_for_category();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    -[BMComputeXPCPublisherServer receiveInputForSubscription:streamIdentifier:storeEvent:].cold.2();

  v14 = 0;
  if (v10)
  {
    if (v11)
    {
      v27 = 0;
      objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v11, 1, &v27);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v27;
      if (v15)
      {
        empty = v15;
        __biome_log_for_category();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          -[BMComputeXPCPublisherServer receiveInputForSubscription:streamIdentifier:storeEvent:].cold.1();
LABEL_14:

        goto LABEL_18;
      }
    }
  }
  if (objc_msgSend(v9, "waking"))
  {
    empty = xpc_dictionary_create_empty();
    objc_msgSend(v9, "identifier");
    v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    xpc_dictionary_set_string(empty, "identifier", (const char *)objc_msgSend(v18, "UTF8String"));

    if (v14)
    {
      v19 = objc_retainAutorelease(v14);
      xpc_dictionary_set_data(empty, "event", (const void *)objc_msgSend(v19, "bytes"), objc_msgSend(v19, "length"));
      xpc_dictionary_set_string(empty, "stream", (const char *)objc_msgSend(objc_retainAutorelease(v10), "UTF8String"));
    }
    -[BMComputeXPCPublisherServer publisher](self, "publisher");
    v17 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "token");
    xpc_event_publisher_fire();
    goto LABEL_14;
  }
  objc_msgSend(v9, "connection");
  empty = (void *)objc_claimAutoreleasedReturnValue();
  if (empty)
  {
    objc_msgSend(v9, "connection");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __87__BMComputeXPCPublisherServer_receiveInputForSubscription_streamIdentifier_storeEvent___block_invoke;
    v25[3] = &unk_1E2648718;
    v21 = v9;
    v26 = v21;
    objc_msgSend(v20, "remoteObjectProxyWithErrorHandler:", v25);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v21, "identifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "receiveInputForIdentifier:streamIdentifier:storeEvent:", v23, v10, v11);

  }
  else
  {
    objc_msgSend(v9, "setPendingDemand:", 1);
  }
LABEL_18:

}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (OS_xpc_event_publisher)publisher
{
  return self->_publisher;
}

- (id)subscriptionsForStream:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v13;
  _QWORD v14[4];
  id v15;

  v5 = a3;
  -[BMComputeXPCPublisherServer queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BMComputeXPCPublisherServer.m"), 476, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("streamIdentifier"));

  }
  -[BMComputeXPCPublisherServer subscriptions](self, "subscriptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CB3880];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __54__BMComputeXPCPublisherServer_subscriptionsForStream___block_invoke;
  v14[3] = &unk_1E26486F0;
  v15 = v5;
  v9 = v5;
  objc_msgSend(v8, "predicateWithBlock:", v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "filteredArrayUsingPredicate:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (NSMutableArray)subscriptions
{
  return self->_subscriptions;
}

- (unint64_t)domain
{
  return self->_domain;
}

uint64_t __54__BMComputeXPCPublisherServer_subscriptionsForStream___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "postMigrationStreamIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsObject:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (BMComputeXPCPublisherServer)initWithQueue:(id)a3 domain:(unint64_t)a4 delegate:(id)a5
{
  void *v5;
  void *v6;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  BMComputeXPCPublisherServer *v16;

  v10 = a3;
  v11 = a5;
  if (a4 == 2)
  {
    __biome_log_for_category();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      -[BMComputeXPCPublisherServer initWithQueue:domain:delegate:].cold.2();

    +[BMDaemon systemComputePublisherServiceName](BMDaemon, "systemComputePublisherServiceName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B58]), "initWithMachServiceName:", v5);
    __biome_log_for_category();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      -[BMComputeXPCPublisherServer initWithQueue:domain:delegate:].cold.1();

    goto LABEL_11;
  }
  if (a4 == 1)
  {
    +[BMDaemon systemComputePublisherServiceName](BMDaemon, "systemComputePublisherServiceName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B58]), "initWithMachServiceName:", v5);
LABEL_11:
    +[BMDaemon systemComputePublisherStreamName](BMDaemon, "systemComputePublisherStreamName");
    v13 = objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  if (a4)
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B58]), "initWithMachServiceName:");
    goto LABEL_14;
  }
  +[BMDaemon userComputePublisherServiceName](BMDaemon, "userComputePublisherServiceName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B58]), "initWithMachServiceName:", v5);
  +[BMDaemon userComputePublisherStreamName](BMDaemon, "userComputePublisherStreamName");
  v13 = objc_claimAutoreleasedReturnValue();
LABEL_12:
  v6 = (void *)v13;
LABEL_14:
  v16 = -[BMComputeXPCPublisherServer initWithQueue:listener:domain:delegate:computePublisherStreamName:](self, "initWithQueue:listener:domain:delegate:computePublisherStreamName:", v10, v12, a4, v11, v6);

  return v16;
}

- (BMComputeXPCPublisherServer)initWithQueue:(id)a3 listener:(id)a4 domain:(unint64_t)a5 delegate:(id)a6 computePublisherStreamName:(id)a7
{
  NSObject *v13;
  id v14;
  id v15;
  BMComputeXPCPublisherServer *v16;
  BMComputeXPCPublisherServer *v17;
  NSMutableArray *v18;
  NSMutableArray *subscriptions;
  BMComputeXPCPublisherStorage *v20;
  uint64_t v21;
  uint64_t v22;
  BMComputeXPCPublisherStorage *systemStorage;
  BMComputeXPCPublisherStorage *v24;
  BMComputeXPCPublisherStorage *userStorage;
  BMComputeSubscriptionMarkerManager *v26;
  BMComputeSubscriptionMarkerManager *subscriptionMarkerManager;
  void *v28;
  void *v29;
  id v30;
  NSObject *v31;
  id v32;
  uint64_t v33;
  OS_xpc_event_publisher *publisher;
  uint64_t v35;
  NSXPCInterface *interface;
  NSObject *v37;
  void *v38;
  id v40;
  id v41;
  id location;
  id v43;
  objc_super v44;
  _BYTE v45[24];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v40 = a4;
  v14 = a6;
  v15 = a7;
  dispatch_assert_queue_V2(v13);
  v44.receiver = self;
  v44.super_class = (Class)BMComputeXPCPublisherServer;
  v16 = -[BMComputeXPCPublisherServer init](&v44, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_queue, a3);
    v17->_domain = a5;
    v18 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    subscriptions = v17->_subscriptions;
    v17->_subscriptions = v18;

    v20 = [BMComputeXPCPublisherStorage alloc];
    v21 = *MEMORY[0x1E0D01CA0];
    v22 = -[BMComputeXPCPublisherStorage initWithUseCase:domain:isClient:](v20, "initWithUseCase:domain:isClient:", *MEMORY[0x1E0D01CA0], 1, 0);
    systemStorage = v17->_systemStorage;
    v17->_systemStorage = (BMComputeXPCPublisherStorage *)v22;

    v24 = -[BMComputeXPCPublisherStorage initWithUseCase:domain:isClient:]([BMComputeXPCPublisherStorage alloc], "initWithUseCase:domain:isClient:", v21, 0, 0);
    userStorage = v17->_userStorage;
    v17->_userStorage = v24;

    v26 = -[BMComputeSubscriptionMarkerManager initWithUserStorage:systemStorage:domain:]([BMComputeSubscriptionMarkerManager alloc], "initWithUserStorage:systemStorage:domain:", v17->_userStorage, v17->_systemStorage, v17->_domain);
    subscriptionMarkerManager = v17->_subscriptionMarkerManager;
    v17->_subscriptionMarkerManager = v26;

    -[BMComputeXPCPublisherServer storage](v17, "storage");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = 0;
    objc_msgSend(v28, "readNonWakingSubscriptions:", &v43);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v43;

    if (v29)
    {
      -[NSMutableArray addObjectsFromArray:](v17->_subscriptions, "addObjectsFromArray:", v29);
    }
    else
    {
      __biome_log_for_category();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        -[BMComputeXPCPublisherServer initWithQueue:listener:domain:delegate:computePublisherStreamName:].cold.2();

    }
    objc_storeWeak((id *)&v17->_delegate, v14);
    v32 = objc_retainAutorelease(v15);
    objc_msgSend(v32, "UTF8String");
    xpc_event_publisher_create();
    v33 = objc_claimAutoreleasedReturnValue();
    publisher = v17->_publisher;
    v17->_publisher = (OS_xpc_event_publisher *)v33;

    objc_initWeak(&location, v17);
    objc_copyWeak(&v41, &location);
    xpc_event_publisher_set_handler();
    xpc_event_publisher_set_error_handler();
    objc_storeStrong((id *)&v17->_listener, a4);
    -[NSXPCListener _setQueue:](v17->_listener, "_setQueue:", v13);
    -[NSXPCListener setDelegate:](v17->_listener, "setDelegate:", v17);
    BMComputePublisherInterface();
    v35 = objc_claimAutoreleasedReturnValue();
    interface = v17->_interface;
    v17->_interface = (NSXPCInterface *)v35;

    __biome_log_for_category();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v40, "serviceName");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[BMComputeXPCPublisherServer initWithQueue:listener:domain:delegate:computePublisherStreamName:].cold.1((uint64_t)v32, v38, (uint64_t)v45, v37);
    }

    objc_destroyWeak(&v41);
    objc_destroyWeak(&location);

  }
  return v17;
}

void __97__BMComputeXPCPublisherServer_initWithQueue_listener_domain_delegate_computePublisherStreamName___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id *v6;
  id v7;
  id WeakRetained;

  v6 = (id *)(a1 + 32);
  v7 = a4;
  WeakRetained = objc_loadWeakRetained(v6);
  objc_msgSend(WeakRetained, "_handlePublisherAction:token:descriptor:", a2, a3, v7);

}

void __97__BMComputeXPCPublisherServer_initWithQueue_listener_domain_delegate_computePublisherStreamName___block_invoke_2()
{
  NSObject *v0;

  xpc_strerror();
  __biome_log_for_category();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __97__BMComputeXPCPublisherServer_initWithQueue_listener_domain_delegate_computePublisherStreamName___block_invoke_2_cold_1();

}

- (BMComputeXPCPublisherStorage)storage
{
  return self->_userStorage;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  char v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t);
  void *v24;
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  id location;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  int v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[BMComputeXPCPublisherServer queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  objc_msgSend(MEMORY[0x1E0D01D18], "processWithXPCConnection:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  __biome_log_for_category();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v9, "executableName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v31 = v11;
    v32 = 1024;
    v33 = objc_msgSend(v9, "pid");
    _os_log_impl(&dword_18D810000, v10, OS_LOG_TYPE_INFO, "BMComputePublisherServiceServer received new connection request from %@(%d)", buf, 0x12u);

  }
  objc_msgSend(MEMORY[0x1E0D01CD0], "policyForProcess:connectionFlags:useCase:", v9, 0, *MEMORY[0x1E0D01CA0]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "allowsConnectionToComputePublisherService");
  __biome_log_for_category();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if ((v13 & 1) != 0)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      -[BMComputeXPCPublisherServer listener:shouldAcceptNewConnection:].cold.1(v9);

    -[BMComputeXPCPublisherServer queue](self, "queue");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_setQueue:", v16);

    objc_initWeak((id *)buf, self);
    objc_initWeak(&location, v7);
    v17 = MEMORY[0x1E0C809B0];
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __66__BMComputeXPCPublisherServer_listener_shouldAcceptNewConnection___block_invoke;
    v27[3] = &unk_1E2648630;
    objc_copyWeak(&v28, &location);
    objc_msgSend(v7, "setInterruptionHandler:", v27);
    v21 = v17;
    v22 = 3221225472;
    v23 = __66__BMComputeXPCPublisherServer_listener_shouldAcceptNewConnection___block_invoke_10;
    v24 = &unk_1E2648658;
    objc_copyWeak(&v25, (id *)buf);
    objc_copyWeak(&v26, &location);
    objc_msgSend(v7, "setInvalidationHandler:", &v21);
    -[BMComputeXPCPublisherServer interface](self, "interface", v21, v22, v23, v24);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setExportedInterface:", v18);

    objc_msgSend(v7, "setExportedObject:", self);
    BMComputePublishingInterface();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setRemoteObjectInterface:", v19);

    objc_msgSend(v7, "resume");
    objc_destroyWeak(&v26);
    objc_destroyWeak(&v25);
    objc_destroyWeak(&v28);
    objc_destroyWeak(&location);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[BMComputeXPCPublisherServer listener:shouldAcceptNewConnection:].cold.2(v9, v15);

  }
  return v13;
}

void __66__BMComputeXPCPublisherServer_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
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
    _os_log_impl(&dword_18D810000, v2, OS_LOG_TYPE_DEFAULT, "BMComputePublisherServiceServer connection %@ interrupted", (uint8_t *)&v4, 0xCu);

  }
}

void __66__BMComputeXPCPublisherServer_listener_shouldAcceptNewConnection___block_invoke_10(uint64_t a1)
{
  id WeakRetained;
  id v3;
  void *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  void *v27;
  void *v28;
  __CFString *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint8_t v39[128];
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  __CFString *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
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
    v41 = v4;
    v42 = 2114;
    v43 = v5;
    _os_log_impl(&dword_18D810000, v8, OS_LOG_TYPE_INFO, "BMComputePublisherServiceServer connection %@ invalidated because %{public}@", buf, 0x16u);
  }
  v29 = v5;

  v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  objc_msgSend(WeakRetained, "subscriptions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v35 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        objc_msgSend(v15, "connection");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16 == v4)
        {
          v17 = objc_alloc(MEMORY[0x1E0D02490]);
          objc_msgSend(v15, "identifier");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "client");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = (void *)objc_msgSend(v17, "initWithFirst:second:", v18, v19);

          objc_msgSend(v9, "addObject:", v20);
        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    }
    while (v12);
  }

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v21 = v9;
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v31;
    do
    {
      for (j = 0; j != v23; ++j)
      {
        if (*(_QWORD *)v31 != v24)
          objc_enumerationMutation(v21);
        v26 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * j);
        objc_msgSend(v26, "first");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "second");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(WeakRetained, "_removeSubscriptionWithIdentifier:client:", v27, v28);

      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
    }
    while (v23);
  }

}

- (void)subscribe:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  char IsPathSafe;
  void *v9;
  void *v10;
  char v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  void *v32;
  NSObject *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  NSObject *v37;
  void *v38;
  NSObject *v39;
  id v40;
  _QWORD block[4];
  id v42;
  BMComputeXPCPublisherServer *v43;
  void *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _QWORD v49[4];
  id v50;
  uint8_t v51[128];
  uint8_t buf[4];
  void *v53;
  __int16 v54;
  void *v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[BMComputeXPCPublisherServer queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  __biome_log_for_category();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[BMComputeXPCPublisherServer subscribe:].cold.6();

  if (v4)
  {
    objc_msgSend(v4, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    IsPathSafe = BMIdentifierIsPathSafe();

    if ((IsPathSafe & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0D01BA0], "currentProcessValidator");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "graph");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isExecutionAllowedForGraph:", v10);

      if ((v11 & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
        v12 = objc_claimAutoreleasedReturnValue();
        if (!v12)
        {
          __biome_log_for_category();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
            -[BMComputeXPCPublisherServer subscribe:].cold.2(v13, v35, v36);
          goto LABEL_36;
        }
        objc_msgSend(MEMORY[0x1E0D01D18], "processWithXPCConnection:", v12);
        v13 = objc_claimAutoreleasedReturnValue();
        v14 = (void *)MEMORY[0x1E0D01CD0];
        objc_msgSend(v4, "useCase");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "policyForProcess:connectionFlags:useCase:", v13, 0, v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v4, "postMigrationStreamIdentifiers");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v16, "allowsComputePublisherAccessToStreams:", v17);

        if ((v18 & 1) == 0)
        {
          __biome_log_for_category();
          v37 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
            -[BMComputeXPCPublisherServer subscribe:].cold.3(v4);

          goto LABEL_35;
        }
        -[NSObject identifier](v13, "identifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setClient:", v19);

        objc_msgSend(v4, "setConnection:", v12);
        if ((objc_msgSend(v4, "waking") & 1) == 0)
        {
          -[BMComputeXPCPublisherServer subscriptions](self, "subscriptions");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v49[0] = MEMORY[0x1E0C809B0];
          v49[1] = 3221225472;
          v49[2] = __41__BMComputeXPCPublisherServer_subscribe___block_invoke;
          v49[3] = &unk_1E2648680;
          v21 = v4;
          v50 = v21;
          objc_msgSend(v20, "indexesOfObjectsPassingTest:", v49);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v22, "count"))
          {
            v39 = v13;
            v40 = v4;
            __biome_log_for_category();
            v23 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v21, "client");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "identifier");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v53 = v24;
              v54 = 2112;
              v55 = v25;
              _os_log_impl(&dword_18D810000, v23, OS_LOG_TYPE_DEFAULT, "Found matching unclaimed subscription for %@:%@", buf, 0x16u);

            }
            v47 = 0u;
            v48 = 0u;
            v45 = 0u;
            v46 = 0u;
            -[BMComputeXPCPublisherServer subscriptions](self, "subscriptions");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v38 = v22;
            objc_msgSend(v26, "objectsAtIndexes:", v22);
            v27 = (void *)objc_claimAutoreleasedReturnValue();

            v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
            if (v28)
            {
              v29 = v28;
              v30 = *(_QWORD *)v46;
              do
              {
                for (i = 0; i != v29; ++i)
                {
                  if (*(_QWORD *)v46 != v30)
                    objc_enumerationMutation(v27);
                  v32 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
                  objc_msgSend(v32, "setConnection:", v12);
                  if (objc_msgSend(v32, "pendingDemand"))
                  {
                    -[BMComputeXPCPublisherServer queue](self, "queue");
                    v33 = objc_claimAutoreleasedReturnValue();
                    block[0] = MEMORY[0x1E0C809B0];
                    block[1] = 3221225472;
                    block[2] = __41__BMComputeXPCPublisherServer_subscribe___block_invoke_16;
                    block[3] = &unk_1E2647818;
                    v42 = v21;
                    v43 = self;
                    v44 = v32;
                    dispatch_async(v33, block);

                  }
                  -[BMComputeXPCPublisherServer delegate](self, "delegate");
                  v34 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v34, "publisherServer:didClaimSubscription:", self, v32);

                }
                v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
              }
              while (v29);
            }

            v13 = v39;
            v4 = v40;
            goto LABEL_35;
          }

        }
        -[BMComputeXPCPublisherServer _addSubscription:](self, "_addSubscription:", v4);
LABEL_35:

LABEL_36:
        goto LABEL_37;
      }
      __biome_log_for_category();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[BMComputeXPCPublisherServer subscribe:].cold.4(v4);
    }
    else
    {
      __biome_log_for_category();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[BMComputeXPCPublisherServer subscribe:].cold.5(v4);
    }
  }
  else
  {
    __biome_log_for_category();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[BMComputeXPCPublisherServer subscribe:].cold.1();
  }
LABEL_37:

}

uint64_t __41__BMComputeXPCPublisherServer_subscribe___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v3 = a2;
  if (objc_msgSend(v3, "isUnclaimed"))
  {
    objc_msgSend(v3, "identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "isEqualToString:", v5))
    {
      objc_msgSend(v3, "client");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "client");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v6, "isEqualToString:", v7);

    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

uint64_t __41__BMComputeXPCPublisherServer_subscribe___block_invoke_16(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  __biome_log_for_category();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_18D810000, v2, OS_LOG_TYPE_DEFAULT, "Notify subscriber that there was pending demand from new events while subscription was unclaimed: %@", (uint8_t *)&v5, 0xCu);
  }

  return objc_msgSend(*(id *)(a1 + 40), "receiveInputForSubscription:streamIdentifier:storeEvent:", *(_QWORD *)(a1 + 48), 0, 0);
}

- (void)unsubscribeWithIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;

  v4 = a3;
  -[BMComputeXPCPublisherServer queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  __biome_log_for_category();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[BMComputeXPCPublisherServer unsubscribeWithIdentifier:].cold.2();

  if (v4)
  {
    v7 = (void *)MEMORY[0x1E0D01D18];
    objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "processWithXPCConnection:", v8);
    v9 = objc_claimAutoreleasedReturnValue();

    -[NSObject identifier](v9, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[BMComputeXPCPublisherServer storage](self, "storage");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeNonWakingSubscriptionWithIdentifier:client:", v4, v10);

    -[BMComputeXPCPublisherServer _removeSubscriptionWithIdentifier:client:](self, "_removeSubscriptionWithIdentifier:client:", v4, v10);
  }
  else
  {
    __biome_log_for_category();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[BMComputeXPCPublisherServer unsubscribeWithIdentifier:].cold.1();
  }

}

- (void)activateWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[BMComputeXPCPublisherServer queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  __biome_log_for_category();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[BMComputeXPCPublisherServer activateWithCompletion:].cold.1(self);

  -[BMComputeXPCPublisherServer setActivationCompletion:](self, "setActivationCompletion:", v4);
  -[BMComputeXPCPublisherServer listener](self, "listener");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "activate");

  -[BMComputeXPCPublisherServer publisher](self, "publisher");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  xpc_event_publisher_activate();

}

- (void)_handlePublisherAction:(unsigned int)a3 token:(unint64_t)a4 descriptor:(id)a5
{
  id v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  BMComputeXPCSubscription *v13;
  void *v14;
  void *v15;
  int v16;
  NSObject *v17;
  void *v18;
  void (**v19)(void);
  NSObject *v20;
  void *v21;
  NSObject *v22;
  int v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  -[BMComputeXPCPublisherServer queue](self, "queue");
  v9 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v9);

  switch(a3)
  {
    case 2u:
      __biome_log_for_category();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        LOWORD(v23) = 0;
        _os_log_impl(&dword_18D810000, v17, OS_LOG_TYPE_INFO, "BMComputeXPCPublisher initial barrier", (uint8_t *)&v23, 2u);
      }

      -[BMComputeXPCPublisherServer activationCompletion](self, "activationCompletion");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18)
      {
        -[BMComputeXPCPublisherServer activationCompletion](self, "activationCompletion");
        v19 = (void (**)(void))objc_claimAutoreleasedReturnValue();
        v19[2]();

        -[BMComputeXPCPublisherServer setActivationCompletion:](self, "setActivationCompletion:", 0);
      }
      break;
    case 1u:
      __biome_log_for_category();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a4);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = 138412290;
        v24 = v21;
        _os_log_impl(&dword_18D810000, v20, OS_LOG_TYPE_INFO, "BMComputeXPCPublisher remove publisher for token %@", (uint8_t *)&v23, 0xCu);

      }
      -[BMComputeXPCPublisherServer _removeSubscriptionWithToken:](self, "_removeSubscriptionWithToken:", a4);
      break;
    case 0u:
      v10 = (void *)MEMORY[0x193FED914](v8);
      __biome_log_for_category();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a4);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = 138412546;
        v24 = v12;
        v25 = 2080;
        v26 = v10;
        _os_log_impl(&dword_18D810000, v11, OS_LOG_TYPE_INFO, "BMComputeXPCPublisher add publisher for token %@ descriptor: %s", (uint8_t *)&v23, 0x16u);

      }
      v13 = -[BMComputeXPCSubscription initWithToken:descriptor:]([BMComputeXPCSubscription alloc], "initWithToken:descriptor:", a4, v8);
      if (v13)
      {
        objc_msgSend(MEMORY[0x1E0D01BA0], "currentProcessValidator");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[BMComputeXPCSubscription graph](v13, "graph");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v14, "isExecutionAllowedForGraph:", v15);

        if (v16)
        {
          -[BMComputeXPCPublisherServer _addSubscription:](self, "_addSubscription:", v13);
LABEL_21:
          free(v10);

          break;
        }
        __biome_log_for_category();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          -[BMComputeXPCPublisherServer subscribe:].cold.4(v13);
      }
      else
      {
        __biome_log_for_category();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          -[BMComputeXPCPublisherServer _handlePublisherAction:token:descriptor:].cold.1();
      }

      goto LABEL_21;
  }

}

- (void)_addSubscription:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _QWORD v44[4];
  id v45;
  uint8_t buf[4];
  id v47;
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[BMComputeXPCPublisherServer queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BMComputeXPCPublisherServer.m"), 383, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("subscription"));

  }
  -[BMComputeXPCPublisherServer subscriptions](self, "subscriptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v44[0] = MEMORY[0x1E0C809B0];
  v44[1] = 3221225472;
  v44[2] = __48__BMComputeXPCPublisherServer__addSubscription___block_invoke;
  v44[3] = &unk_1E2648680;
  v8 = v5;
  v45 = v8;
  objc_msgSend(v7, "indexesOfObjectsPassingTest:", v44);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "count"))
  {
    -[BMComputeXPCPublisherServer subscriptions](self, "subscriptions");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectsAtIndexes:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    __biome_log_for_category();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[BMComputeXPCPublisherServer _addSubscription:].cold.1();

    -[BMComputeXPCPublisherServer storage](self, "storage");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "client");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "removeBookmarkFileForSubscriptionWithIdentifier:client:", v14, v15);

    -[BMComputeXPCPublisherServer subscriptions](self, "subscriptions");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "removeObjectsAtIndexes:", v9);

    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    objc_msgSend(v8, "postMigrationStreamIdentifiers");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v41;
      do
      {
        v21 = 0;
        do
        {
          if (*(_QWORD *)v41 != v20)
            objc_enumerationMutation(v17);
          v22 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * v21);
          -[BMComputeXPCPublisherServer subscriptionMarkerManager](self, "subscriptionMarkerManager");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "removeSubscriptionWithStreamIdentifier:", v22);

          ++v21;
        }
        while (v19 != v21);
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
      }
      while (v19);
    }

  }
  -[BMComputeXPCPublisherServer subscriptions](self, "subscriptions");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "addObject:", v8);

  if ((objc_msgSend(v8, "waking") & 1) == 0)
  {
    -[BMComputeXPCPublisherServer storage](self, "storage");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "writeNonWakingSubscription:", v8);

  }
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  objc_msgSend(v8, "postMigrationStreamIdentifiers");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v36, v48, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v37;
    do
    {
      v30 = 0;
      do
      {
        if (*(_QWORD *)v37 != v29)
          objc_enumerationMutation(v26);
        v31 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * v30);
        -[BMComputeXPCPublisherServer subscriptionMarkerManager](self, "subscriptionMarkerManager");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "addSubscriptionWithStreamIdentifier:", v31);

        ++v30;
      }
      while (v28 != v30);
      v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v36, v48, 16);
    }
    while (v28);
  }

  -[BMComputeXPCPublisherServer delegate](self, "delegate");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "publisherServer:didAddSubscription:", self, v8);

  __biome_log_for_category();
  v34 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v47 = v8;
    _os_log_impl(&dword_18D810000, v34, OS_LOG_TYPE_DEFAULT, "_addSubscription added subscription: %@", buf, 0xCu);
  }

}

uint64_t __48__BMComputeXPCPublisherServer__addSubscription___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v3 = a2;
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", v5))
  {
    objc_msgSend(v3, "client");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "client");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqualToString:", v7);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)_removeSubscriptionWithToken:(unint64_t)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  NSObject *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _QWORD v37[5];
  uint8_t buf[4];
  id v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  -[BMComputeXPCPublisherServer queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[BMComputeXPCPublisherServer subscriptions](self, "subscriptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __60__BMComputeXPCPublisherServer__removeSubscriptionWithToken___block_invoke;
  v37[3] = &__block_descriptor_40_e41_B32__0__BMComputeXPCSubscription_8Q16_B24l;
  v37[4] = a3;
  objc_msgSend(v6, "indexesOfObjectsPassingTest:", v37);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  -[BMComputeXPCPublisherServer subscriptions](self, "subscriptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectsAtIndexes:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v34;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v34 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v13);
        -[BMComputeXPCPublisherServer storage](self, "storage");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "identifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "client");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "removeBookmarkFileForSubscriptionWithIdentifier:client:", v16, v17);

        -[BMComputeXPCPublisherServer _removeActiveSubscriptionMarkersForSubscription:](self, "_removeActiveSubscriptionMarkersForSubscription:", v14);
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
    }
    while (v11);
  }

  -[BMComputeXPCPublisherServer subscriptions](self, "subscriptions");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "objectsAtIndexes:", v7);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  -[BMComputeXPCPublisherServer subscriptions](self, "subscriptions");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "removeObjectsAtIndexes:", v7);

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v21 = v19;
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v29, v40, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v30;
    do
    {
      v25 = 0;
      do
      {
        if (*(_QWORD *)v30 != v24)
          objc_enumerationMutation(v21);
        v26 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * v25);
        -[BMComputeXPCPublisherServer delegate](self, "delegate", (_QWORD)v29);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "publisherServer:didRemoveSubscription:", self, v26);

        ++v25;
      }
      while (v23 != v25);
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v29, v40, 16);
    }
    while (v23);
  }

  __biome_log_for_category();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v39 = v21;
    _os_log_impl(&dword_18D810000, v28, OS_LOG_TYPE_DEFAULT, "_removeSubscriptionWithToken removed subscriptions: %@", buf, 0xCu);
  }

}

BOOL __60__BMComputeXPCPublisherServer__removeSubscriptionWithToken___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "token") == *(_QWORD *)(a1 + 32);
}

- (void)_removeSubscriptionWithIdentifier:(id)a3 client:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  NSObject *v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _QWORD v41[4];
  id v42;
  id v43;
  uint8_t buf[4];
  id v45;
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  -[BMComputeXPCPublisherServer queue](self, "queue");
  v9 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v9);

  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BMComputeXPCPublisherServer.m"), 442, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier"));

  }
  -[BMComputeXPCPublisherServer subscriptions](self, "subscriptions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v41[0] = MEMORY[0x1E0C809B0];
  v41[1] = 3221225472;
  v41[2] = __72__BMComputeXPCPublisherServer__removeSubscriptionWithIdentifier_client___block_invoke;
  v41[3] = &unk_1E26486C8;
  v11 = v7;
  v42 = v11;
  v12 = v8;
  v43 = v12;
  objc_msgSend(v10, "indexesOfObjectsPassingTest:", v41);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  -[BMComputeXPCPublisherServer subscriptions](self, "subscriptions");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectsAtIndexes:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v37, v47, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v38;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v38 != v18)
          objc_enumerationMutation(v15);
        -[BMComputeXPCPublisherServer _removeActiveSubscriptionMarkersForSubscription:](self, "_removeActiveSubscriptionMarkersForSubscription:", *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * v19++));
      }
      while (v17 != v19);
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v37, v47, 16);
    }
    while (v17);
  }

  -[BMComputeXPCPublisherServer storage](self, "storage");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "removeBookmarkFileForSubscriptionWithIdentifier:client:", v11, v12);

  -[BMComputeXPCPublisherServer subscriptions](self, "subscriptions");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "objectsAtIndexes:", v13);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  -[BMComputeXPCPublisherServer subscriptions](self, "subscriptions");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "removeObjectsAtIndexes:", v13);

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v24 = v22;
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v33, v46, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v34;
    do
    {
      v28 = 0;
      do
      {
        if (*(_QWORD *)v34 != v27)
          objc_enumerationMutation(v24);
        v29 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * v28);
        -[BMComputeXPCPublisherServer delegate](self, "delegate");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "publisherServer:didRemoveSubscription:", self, v29);

        ++v28;
      }
      while (v26 != v28);
      v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v33, v46, 16);
    }
    while (v26);
  }

  __biome_log_for_category();
  v31 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v45 = v24;
    _os_log_impl(&dword_18D810000, v31, OS_LOG_TYPE_DEFAULT, "_removeSubscriptionWithIdentifier removed subscriptions: %@", buf, 0xCu);
  }

}

uint64_t __72__BMComputeXPCPublisherServer__removeSubscriptionWithIdentifier_client___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v3 = a2;
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(a1 + 32)))
  {
    objc_msgSend(v3, "client");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToString:", *(_QWORD *)(a1 + 40));

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)_removeActiveSubscriptionMarkersForSubscription:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[BMComputeXPCPublisherServer queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BMComputeXPCPublisherServer.m"), 465, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("subscription"));

  }
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(v5, "postMigrationStreamIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v11);
        -[BMComputeXPCPublisherServer subscriptionMarkerManager](self, "subscriptionMarkerManager");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "removeSubscriptionWithStreamIdentifier:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

}

void __87__BMComputeXPCPublisherServer_receiveInputForSubscription_streamIdentifier_storeEvent___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  __biome_log_for_category();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __87__BMComputeXPCPublisherServer_receiveInputForSubscription_streamIdentifier_storeEvent___block_invoke_cold_1();

}

- (NSString)description
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  BMStringForServiceDomain();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMComputeXPCPublisherServer listener](self, "listener");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "serviceName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@ for domain: %@, listener: %@"), v5, v6, v8);

  return (NSString *)v9;
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (BMComputeSubscriptionMarkerManager)subscriptionMarkerManager
{
  return self->_subscriptionMarkerManager;
}

- (id)activationCompletion
{
  return self->_activationCompletion;
}

- (void)setActivationCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSXPCInterface)interface
{
  return self->_interface;
}

- (BMComputeXPCPublisherServerDelegate)delegate
{
  return (BMComputeXPCPublisherServerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (BMComputeXPCPublisherStorage)systemStorage
{
  return self->_systemStorage;
}

- (BMComputeXPCPublisherStorage)userStorage
{
  return self->_userStorage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userStorage, 0);
  objc_storeStrong((id *)&self->_systemStorage, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_interface, 0);
  objc_storeStrong((id *)&self->_subscriptions, 0);
  objc_storeStrong(&self->_activationCompletion, 0);
  objc_storeStrong((id *)&self->_subscriptionMarkerManager, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_publisher, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)initWithQueue:domain:delegate:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_2(&dword_18D810000, v0, v1, "BMComputePublisherStreamNameForDomain could not determine publisher stream name for BMServiceDomainCount", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)initWithQueue:domain:delegate:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_2(&dword_18D810000, v0, v1, "BMComputePublisherStreamNameForDomain could not determine publisher server mach service name for BMServiceDomainCount", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)initWithQueue:(uint64_t)a3 listener:(NSObject *)a4 domain:delegate:computePublisherStreamName:.cold.1(uint64_t a1, void *a2, uint64_t a3, NSObject *a4)
{
  *(_DWORD *)a3 = 138412546;
  *(_QWORD *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2112;
  *(_QWORD *)(a3 + 14) = a2;
  OUTLINED_FUNCTION_0_4(&dword_18D810000, a4, a3, "BMComputePublisherServiceServer publisherName: %@, listenerName: %@", (uint8_t *)a3);

}

- (void)initWithQueue:listener:domain:delegate:computePublisherStreamName:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_2_5(&dword_18D810000, v0, v1, "BMComputeXPCPublisherServer failed to read non-waking subscriptions on init, %@", v2);
  OUTLINED_FUNCTION_5();
}

void __97__BMComputeXPCPublisherServer_initWithQueue_listener_domain_delegate_computePublisherStreamName___block_invoke_2_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_9_0();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_3();
  OUTLINED_FUNCTION_0_7(&dword_18D810000, v4, v5, "BMComputeXPCPublisher xpc publisher error: %@ %@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1_0();
}

- (void)listener:(void *)a1 shouldAcceptNewConnection:.cold.1(void *a1)
{
  void *v1;
  void *v2;
  os_log_t v3;
  os_log_type_t v4;
  const char *v5;
  uint8_t *v6;

  objc_msgSend(a1, "executableName");
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_12_0();
  _os_log_debug_impl(v2, v3, v4, v5, v6, 0x12u);

  OUTLINED_FUNCTION_1_0();
}

- (void)listener:(void *)a1 shouldAcceptNewConnection:(NSObject *)a2 .cold.2(void *a1, NSObject *a2)
{
  void *v2;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "executableName");
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_16();
  _os_log_error_impl(&dword_18D810000, a2, OS_LOG_TYPE_ERROR, "BMComputePublisherServiceServer refusing connection from %{public}@(%d), process lacks entitlements", v4, 0x12u);

  OUTLINED_FUNCTION_1_0();
}

- (void)subscribe:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_6_0(&dword_18D810000, v0, v1, "BMComputeXPCPublisherServer dropping subscribe: due to nil subscription", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)subscribe:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = 0;
  OUTLINED_FUNCTION_2_5(&dword_18D810000, a1, a3, "BMComputeXPCPublisherServer dropping subscribe: due to dead connection %@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_5();
}

- (void)subscribe:(void *)a1 .cold.3(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "streamIdentifiers");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_1_5(&dword_18D810000, v2, v3, "Rejecting subscribe: due to lacking read entitlements for streams %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_0_0();
}

- (void)subscribe:(void *)a1 .cold.4(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "graph");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_1_5(&dword_18D810000, v2, v3, "BMComputeXPCSubscription cannot execute graph: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_0_0();
}

- (void)subscribe:(void *)a1 .cold.5(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "identifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_1_5(&dword_18D810000, v2, v3, "BMComputeXPCPublisherServer dropping subscribe: invalid identifier %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_0_0();
}

- (void)subscribe:.cold.6()
{
  uint64_t v0;
  void *v1;
  void *v2;
  os_log_t v3;
  os_log_type_t v4;
  const char *v5;
  uint8_t *v6;

  OUTLINED_FUNCTION_9_0();
  objc_msgSend(*(id *)(v0 + 24), "serviceName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_12_0();
  _os_log_debug_impl(v2, v3, v4, v5, v6, 0x20u);

  OUTLINED_FUNCTION_13();
}

- (void)unsubscribeWithIdentifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_6_0(&dword_18D810000, v0, v1, "BMComputePublisherServiceServerConnection dropping unsubscribeWithIdentifier: due to nil identifier", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)unsubscribeWithIdentifier:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_0_4(&dword_18D810000, v0, v1, "%s %@", (uint8_t *)v2);
  OUTLINED_FUNCTION_5();
}

- (void)activateWithCompletion:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  void *v2;
  void *v3;
  os_log_t v4;
  os_log_type_t v5;
  const char *v6;
  uint8_t *v7;

  objc_msgSend(a1, "listener");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "serviceName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_12_0();
  _os_log_debug_impl(v3, v4, v5, v6, v7, 0xCu);

  OUTLINED_FUNCTION_1_0();
}

- (void)_handlePublisherAction:token:descriptor:.cold.1()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_9_0();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_7(&dword_18D810000, v2, v3, "BMComputeXPCSubscription cannot be initialized with provided token %@ and descriptor: %s", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)_addSubscription:.cold.1()
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_9_0();
  objc_msgSend(v0, "identifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_0_7(&dword_18D810000, v2, v3, "Clearing unexpected subscriptions for identifier %@ while adding new subscription. %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)receiveInputForSubscription:streamIdentifier:storeEvent:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[14];
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_18();
  v3 = v0;
  _os_log_error_impl(&dword_18D810000, v1, OS_LOG_TYPE_ERROR, "Failed to archive store event for stream %@ %@", v2, 0x16u);
  OUTLINED_FUNCTION_5();
}

- (void)receiveInputForSubscription:streamIdentifier:storeEvent:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_0_4(&dword_18D810000, v0, v1, "%s %@", (uint8_t *)v2);
  OUTLINED_FUNCTION_5();
}

void __87__BMComputeXPCPublisherServer_receiveInputForSubscription_streamIdentifier_storeEvent___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  __int16 v4;
  uint8_t v5[22];
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  OUTLINED_FUNCTION_9_0();
  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(v2 + 32), "connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_3();
  v6 = v4;
  v7 = v1;
  _os_log_error_impl(&dword_18D810000, v0, OS_LOG_TYPE_ERROR, "Error notifying client for subscription %@ with connection %@ error: %@", v5, 0x20u);

  OUTLINED_FUNCTION_13();
}

@end
