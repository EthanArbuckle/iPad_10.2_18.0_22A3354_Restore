@implementation CXChannelServiceServer

- (CXChannelServiceServer)init
{
  CXChannelServiceServer *v2;
  CXChannelServiceServer *v3;
  NSMutableDictionary *v4;
  NSMutableDictionary *identifierToClient;
  id v6;
  const char *v7;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *queue;
  CXTransactionManager *v11;
  CXTransactionManager *transactionManager;
  CXTransactionGroup *v13;
  CXTransactionGroup *uncommittedTransactionGroup;
  CXChannelServiceDefinition *v15;
  void *v16;
  CXChannelServiceServer *v17;
  CXChannelServiceDefinition *v18;
  uint64_t v19;
  BSServiceConnectionListener *listener;
  _QWORD v22[4];
  CXChannelServiceDefinition *v23;
  CXChannelServiceServer *v24;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)CXChannelServiceServer;
  v2 = -[CXChannelServiceServer init](&v25, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_accessorLock._os_unfair_lock_opaque = 0;
    v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    identifierToClient = v3->_identifierToClient;
    v3->_identifierToClient = v4;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.callkit.queue.%@.%p"), objc_opt_class(), v3);
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v7 = (const char *)objc_msgSend(v6, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = dispatch_queue_create(v7, v8);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v9;

    v11 = -[CXTransactionManager initWithQueue:]([CXTransactionManager alloc], "initWithQueue:", v3->_queue);
    transactionManager = v3->_transactionManager;
    v3->_transactionManager = v11;

    v13 = objc_alloc_init(CXTransactionGroup);
    uncommittedTransactionGroup = v3->_uncommittedTransactionGroup;
    v3->_uncommittedTransactionGroup = v13;

    v15 = objc_alloc_init(CXChannelServiceDefinition);
    objc_storeStrong((id *)&v3->_definition, v15);
    v16 = (void *)MEMORY[0x1E0D03460];
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __30__CXChannelServiceServer_init__block_invoke;
    v22[3] = &unk_1E4B88A48;
    v23 = v15;
    v17 = v3;
    v24 = v17;
    v18 = v15;
    objc_msgSend(v16, "listenerWithConfigurator:", v22);
    v19 = objc_claimAutoreleasedReturnValue();
    listener = v17->_listener;
    v17->_listener = (BSServiceConnectionListener *)v19;

  }
  return v3;
}

void __30__CXChannelServiceServer_init__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = *(void **)(a1 + 32);
  v7 = a2;
  objc_msgSend(v3, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDomain:", v5);

  objc_msgSend(*(id *)(a1 + 32), "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setService:", v6);

  objc_msgSend(v7, "setDelegate:", *(_QWORD *)(a1 + 40));
}

- (void)dealloc
{
  objc_super v3;

  -[BSServiceConnectionListener invalidate](self->_listener, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)CXChannelServiceServer;
  -[CXChannelServiceServer dealloc](&v3, sel_dealloc);
}

- (void)activate
{
  void *v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  -[CXChannelServiceServer listener](self, "listener");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activate");

  CXDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    -[CXChannelServiceServer listener](self, "listener");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412290;
    v7 = v5;
    _os_log_impl(&dword_1A402D000, v4, OS_LOG_TYPE_DEFAULT, "Activated listener %@", (uint8_t *)&v6, 0xCu);

  }
}

- (void)invalidate
{
  id v2;

  -[CXChannelServiceServer listener](self, "listener");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidate");

}

- (void)addClient:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  os_unfair_lock_lock(&self->_accessorLock);
  objc_msgSend(v7, "setDelegate:", self);
  -[CXChannelServiceServer identifierToClient](self, "identifierToClient");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, v5);

  -[CXChannelServiceServer delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "serviceServer:didAddClient:", self, v7);

  os_unfair_lock_unlock(&self->_accessorLock);
}

- (id)clientForIdentifier:(id)a3
{
  id v4;
  os_unfair_lock_s *p_accessorLock;
  void *v6;
  void *v7;

  v4 = a3;
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  -[CXChannelServiceServer identifierToClient](self, "identifierToClient");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_accessorLock);
  return v7;
}

- (NSArray)clients
{
  os_unfair_lock_s *p_accessorLock;
  void *v4;
  void *v5;

  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  -[CXChannelServiceServer identifierToClient](self, "identifierToClient");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_accessorLock);
  return (NSArray *)v5;
}

- (void)removeClient:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  os_unfair_lock_lock(&self->_accessorLock);
  objc_msgSend(v10, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CXChannelServiceServer identifierToClient](self, "identifierToClient");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqual:", v10);

  if (v7)
  {
    -[CXChannelServiceServer identifierToClient](self, "identifierToClient");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", 0, v4);

    -[CXChannelServiceServer delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "serviceServer:didRemoveClient:", self, v10);

  }
  os_unfair_lock_unlock(&self->_accessorLock);

}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v6;
  CXChannelServiceClient *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  CXChannelServiceClient *v18;
  id v19;
  NSObject *v20;
  _QWORD v21[4];
  id v22;
  CXChannelServiceClient *v23;
  CXChannelServiceServer *v24;
  uint8_t buf[4];
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = -[CXChannelServiceClient initWithConnection:]([CXChannelServiceClient alloc], "initWithConnection:", v6);
  -[CXChannelServiceServer definition](self, "definition");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0D03430];
  objc_msgSend(v8, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "interfaceWithIdentifier:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x1E0D017E0];
  objc_msgSend(v8, "clientXPCInterface");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "protocolForProtocol:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setClient:", v14);

  v15 = (void *)MEMORY[0x1E0D017E0];
  objc_msgSend(v8, "serverXPCInterface");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "protocolForProtocol:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setServer:", v17);

  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __68__CXChannelServiceServer_listener_didReceiveConnection_withContext___block_invoke;
  v21[3] = &unk_1E4B88A98;
  v22 = v11;
  v18 = v7;
  v23 = v18;
  v24 = self;
  v19 = v11;
  objc_msgSend(v6, "configureConnection:", v21);
  CXDefaultLog();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v26 = v6;
    _os_log_impl(&dword_1A402D000, v20, OS_LOG_TYPE_DEFAULT, "Activating connection %@", buf, 0xCu);
  }

  objc_msgSend(v6, "activate");
  if (v18)
    -[CXChannelServiceServer addClient:](self, "addClient:", v18);

}

void __68__CXChannelServiceServer_listener_didReceiveConnection_withContext___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  int8x16_t v10;
  int8x16_t v11;
  _QWORD v12[4];
  int8x16_t v13;
  _QWORD v14[4];
  int8x16_t v15;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setInterface:", v3);
  objc_msgSend(v4, "setInterfaceTarget:", *(_QWORD *)(a1 + 40));
  objc_msgSend(MEMORY[0x1E0D03478], "utility");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setServiceQuality:", v5);

  objc_msgSend(*(id *)(a1 + 48), "queue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTargetQueue:", v6);

  v7 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __68__CXChannelServiceServer_listener_didReceiveConnection_withContext___block_invoke_2;
  v14[3] = &unk_1E4B88A70;
  v10 = *(int8x16_t *)(a1 + 40);
  v8 = (id)v10.i64[0];
  v15 = vextq_s8(v10, v10, 8uLL);
  objc_msgSend(v4, "setInterruptionHandler:", v14);
  v12[0] = v7;
  v12[1] = 3221225472;
  v12[2] = __68__CXChannelServiceServer_listener_didReceiveConnection_withContext___block_invoke_14;
  v12[3] = &unk_1E4B88A70;
  v11 = *(int8x16_t *)(a1 + 40);
  v9 = (id)v11.i64[0];
  v13 = vextq_s8(v11, v11, 8uLL);
  objc_msgSend(v4, "setInvalidationHandler:", v12);

}

void __68__CXChannelServiceServer_listener_didReceiveConnection_withContext___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  CXDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_1A402D000, v4, OS_LOG_TYPE_DEFAULT, "Interrupted connection %@", (uint8_t *)&v5, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "removeClient:", *(_QWORD *)(a1 + 40));
}

void __68__CXChannelServiceServer_listener_didReceiveConnection_withContext___block_invoke_14(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  CXDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_1A402D000, v4, OS_LOG_TYPE_DEFAULT, "Invalidated connection %@", (uint8_t *)&v5, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "removeClient:", *(_QWORD *)(a1 + 40));
}

- (void)serviceClient:(id)a3 actionCompleted:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[CXChannelServiceServer delegate](self, "delegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "serviceServer:client:actionCompleted:", self, v7, v6);

}

- (void)serviceClient:(id)a3 registeredWithConfiguration:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[CXChannelServiceServer delegate](self, "delegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "serviceServer:client:registeredWithConfiguration:", self, v7, v6);

}

- (void)serviceClient:(id)a3 reportedAudioFinishedForChannelWithUUID:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[CXChannelServiceServer delegate](self, "delegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "serviceServer:client:reportedAudioFinishedForChannelWithUUID:", self, v7, v6);

}

- (void)serviceClient:(id)a3 reportedChannelWithUUID:(id)a4 connectedAtDate:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[CXChannelServiceServer delegate](self, "delegate");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "serviceServer:client:reportedChannelWithUUID:connectedAtDate:", self, v10, v9, v8);

}

- (void)serviceClient:(id)a3 reportedChannelWithUUID:(id)a4 disconnectedAtDate:(id)a5 disconnectedReason:(int64_t)a6
{
  id v10;
  id v11;
  id v12;
  id v13;

  v10 = a5;
  v11 = a4;
  v12 = a3;
  -[CXChannelServiceServer delegate](self, "delegate");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "serviceServer:client:reportedChannelWithUUID:disconnectedAtDate:disconnectedReason:", self, v12, v11, v10, a6);

}

- (void)serviceClient:(id)a3 reportedChannelWithUUID:(id)a4 startedConnectingAtDate:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[CXChannelServiceServer delegate](self, "delegate");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "serviceServer:client:reportedChannelWithUUID:startedConnectingAtDate:", self, v10, v9, v8);

}

- (void)serviceClient:(id)a3 reportedChannelWithUUID:(id)a4 updated:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[CXChannelServiceServer delegate](self, "delegate");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "serviceServer:client:reportedChannelWithUUID:updated:", self, v10, v9, v8);

}

- (void)serviceClient:(id)a3 reportedIncomingTransmissionEndedForChannelWithUUID:(id)a4 reason:(int64_t)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;

  v10 = a6;
  v11 = a4;
  v12 = a3;
  -[CXChannelServiceServer delegate](self, "delegate");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "serviceServer:client:reportedIncomingTransmissionEndedForChannelWithUUID:reason:completionHandler:", self, v12, v11, a5, v10);

}

- (void)serviceClient:(id)a3 reportedIncomingTransmissionStartedForChannelWithUUID:(id)a4 update:(id)a5 shouldReplaceOutgoingTransmission:(BOOL)a6 completionHandler:(id)a7
{
  _BOOL8 v7;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;

  v7 = a6;
  v12 = a7;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  -[CXChannelServiceServer delegate](self, "delegate");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "serviceServer:client:reportedIncomingTransmissionStartedForChannelWithUUID:update:shouldReplaceOutgoingTransmission:completionHandler:", self, v15, v14, v13, v7, v12);

}

- (void)serviceClient:(id)a3 requestedTransaction:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[CXChannelServiceServer delegate](self, "delegate");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "serviceServer:client:requestedTransaction:completionHandler:", self, v10, v9, v8);

}

- (void)addAction:(id)a3 toUncommittedTransactionForServiceClient:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  CXChannelServiceServer *v14;

  v6 = a3;
  v7 = a4;
  -[CXChannelServiceServer queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77__CXChannelServiceServer_addAction_toUncommittedTransactionForServiceClient___block_invoke;
  block[3] = &unk_1E4B88AC0;
  v12 = v6;
  v13 = v7;
  v14 = self;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __77__CXChannelServiceServer_addAction_toUncommittedTransactionForServiceClient___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  CXDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v6 = 138412546;
    v7 = v3;
    v8 = 2112;
    v9 = v4;
    _os_log_impl(&dword_1A402D000, v2, OS_LOG_TYPE_DEFAULT, "Asked to add action %@ to uncommitted transaction for service client %@", (uint8_t *)&v6, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 48), "uncommittedTransactionGroup");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addAction:forServiceClient:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)failOutstandingActionsForChannelWithUUID:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[CXChannelServiceServer queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __67__CXChannelServiceServer_failOutstandingActionsForChannelWithUUID___block_invoke;
  v7[3] = &unk_1E4B88A20;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __67__CXChannelServiceServer_failOutstandingActionsForChannelWithUUID___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "transactionManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "failOutstandingActionsForChannelWithUUID:", *(_QWORD *)(a1 + 40));

}

- (void)commitUncommittedTransactions
{
  NSObject *v3;
  _QWORD block[5];

  -[CXChannelServiceServer queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__CXChannelServiceServer_commitUncommittedTransactions__block_invoke;
  block[3] = &unk_1E4B88AE8;
  block[4] = self;
  dispatch_async(v3, block);

}

void __55__CXChannelServiceServer_commitUncommittedTransactions__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  CXTransactionGroup *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t v20[128];
  uint8_t buf[4];
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  CXDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "uncommittedTransactionGroup");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v22 = v3;
    _os_log_impl(&dword_1A402D000, v2, OS_LOG_TYPE_DEFAULT, "Asked to commit uncommitted transactions: %@", buf, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 32), "transactionManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "uncommittedTransactionGroup");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addOutstandingTransactionGroup:", v5);

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "uncommittedTransactionGroup", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "serviceClients");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v11);
        objc_msgSend(*(id *)(a1 + 32), "uncommittedTransactionGroup");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "transactionForServiceClient:", v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v12, "commitTransaction:", v14);
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }

  v15 = objc_alloc_init(CXTransactionGroup);
  objc_msgSend(*(id *)(a1 + 32), "setUncommittedTransactionGroup:", v15);

}

- (CXChannelServiceServerDelegate)delegate
{
  return (CXChannelServiceServerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (os_unfair_lock_s)accessorLock
{
  return self->_accessorLock;
}

- (BSServiceConnection)connection
{
  return self->_connection;
}

- (CXChannelServiceDefinition)definition
{
  return self->_definition;
}

- (NSMutableDictionary)identifierToClient
{
  return self->_identifierToClient;
}

- (BSServiceConnectionListener)listener
{
  return self->_listener;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (CXTransactionManager)transactionManager
{
  return self->_transactionManager;
}

- (CXTransactionGroup)uncommittedTransactionGroup
{
  return self->_uncommittedTransactionGroup;
}

- (void)setUncommittedTransactionGroup:(id)a3
{
  objc_storeStrong((id *)&self->_uncommittedTransactionGroup, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uncommittedTransactionGroup, 0);
  objc_storeStrong((id *)&self->_transactionManager, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_identifierToClient, 0);
  objc_storeStrong((id *)&self->_definition, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
