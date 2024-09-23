@implementation CXXPCChannelProvider

- (CXXPCChannelProvider)initWithConfiguration:(id)a3
{
  id v4;
  CXXPCChannelProvider *v5;
  const char *v6;
  NSObject *v7;
  dispatch_queue_t v8;
  CXChannelServiceDefinition *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  BSServiceConnection *connection;
  BSServiceConnection *v26;
  id v27;
  CXXPCChannelProvider *v28;
  NSObject *v29;
  id v31;
  _QWORD v32[4];
  id v33;
  CXXPCChannelProvider *v34;
  NSObject *v35;
  id v36;
  id location;
  objc_super v38;

  v4 = a3;
  v38.receiver = self;
  v38.super_class = (Class)CXXPCChannelProvider;
  v5 = -[CXChannelProvider initWithConfiguration:](&v38, sel_initWithConfiguration_, v4);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.callkit.queue.%@.%p"), objc_opt_class(), v5);
    v31 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v6 = (const char *)objc_msgSend(v31, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = dispatch_queue_create(v6, v7);

    objc_storeStrong((id *)&v5->_queue, v8);
    v9 = objc_alloc_init(CXChannelServiceDefinition);
    objc_storeStrong((id *)&v5->_definition, v9);
    v10 = (void *)MEMORY[0x1E0D03458];
    -[CXChannelServiceDefinition domain](v5->_definition, "domain");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "machName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CXChannelServiceDefinition name](v9, "name");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "endpointForMachName:service:instance:", v12, v13, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = (void *)MEMORY[0x1E0D03430];
    -[CXChannelServiceDefinition name](v9, "name");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "interfaceWithIdentifier:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = (void *)MEMORY[0x1E0D017E0];
    -[CXChannelServiceDefinition clientXPCInterface](v9, "clientXPCInterface");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "protocolForProtocol:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setClient:", v20);

    v21 = (void *)MEMORY[0x1E0D017E0];
    -[CXChannelServiceDefinition serverXPCInterface](v9, "serverXPCInterface");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "protocolForProtocol:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setServer:", v23);

    objc_initWeak(&location, v5);
    objc_msgSend(MEMORY[0x1E0D03448], "connectionWithEndpoint:", v14);
    v24 = objc_claimAutoreleasedReturnValue();
    connection = v5->_connection;
    v5->_connection = (BSServiceConnection *)v24;

    v26 = v5->_connection;
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __46__CXXPCChannelProvider_initWithConfiguration___block_invoke;
    v32[3] = &unk_1E4B894D8;
    v27 = v17;
    v33 = v27;
    v28 = v5;
    v34 = v28;
    v29 = v8;
    v35 = v29;
    objc_copyWeak(&v36, &location);
    -[BSServiceConnection configureConnection:](v26, "configureConnection:", v32);
    -[BSServiceConnection activate](v5->_connection, "activate");
    -[CXChannelProvider registerCurrentConfiguration](v28, "registerCurrentConfiguration");
    objc_destroyWeak(&v36);

    objc_destroyWeak(&location);
  }

  return v5;
}

void __46__CXXPCChannelProvider_initWithConfiguration___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v3 = a2;
  objc_msgSend(v3, "setInterface:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v3, "setInterfaceTarget:", *(_QWORD *)(a1 + 40));
  objc_msgSend(MEMORY[0x1E0D03478], "utility");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setServiceQuality:", v4);

  objc_msgSend(v3, "setTargetQueue:", *(_QWORD *)(a1 + 48));
  v5 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __46__CXXPCChannelProvider_initWithConfiguration___block_invoke_2;
  v10[3] = &unk_1E4B89488;
  objc_copyWeak(&v12, (id *)(a1 + 56));
  v11 = *(id *)(a1 + 40);
  objc_msgSend(v3, "setActivationHandler:", v10);
  v8[0] = v5;
  v8[1] = 3221225472;
  v8[2] = __46__CXXPCChannelProvider_initWithConfiguration___block_invoke_8;
  v8[3] = &unk_1E4B894B0;
  objc_copyWeak(&v9, (id *)(a1 + 56));
  objc_msgSend(v3, "setInterruptionHandler:", v8);
  v6[0] = v5;
  v6[1] = 3221225472;
  v6[2] = __46__CXXPCChannelProvider_initWithConfiguration___block_invoke_9;
  v6[3] = &unk_1E4B894B0;
  objc_copyWeak(&v7, (id *)(a1 + 56));
  objc_msgSend(v3, "setInvalidationHandler:", v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&v9);

  objc_destroyWeak(&v12);
}

void __46__CXXPCChannelProvider_initWithConfiguration___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    CXDefaultLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138412290;
      v8 = v3;
      _os_log_impl(&dword_1A402D000, v5, OS_LOG_TYPE_DEFAULT, "Activated connection %@", (uint8_t *)&v7, 0xCu);
    }

    objc_msgSend(WeakRetained, "abstractProvider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sendDidBeginForProvider:", *(_QWORD *)(a1 + 32));

  }
}

void __46__CXXPCChannelProvider_initWithConfiguration___block_invoke_8(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  void *v6;
  int v7;
  id v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    CXDefaultLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138412546;
      v8 = v3;
      v9 = 2112;
      v10 = WeakRetained;
      _os_log_impl(&dword_1A402D000, v5, OS_LOG_TYPE_DEFAULT, "Interrupted connection %@ for XPC provider %@", (uint8_t *)&v7, 0x16u);
    }

    objc_msgSend(WeakRetained, "abstractProvider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleConnectionInterruptionForProvider:", WeakRetained);

  }
}

void __46__CXXPCChannelProvider_initWithConfiguration___block_invoke_9(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  void *v6;
  int v7;
  id v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    CXDefaultLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138412546;
      v8 = v3;
      v9 = 2112;
      v10 = WeakRetained;
      _os_log_impl(&dword_1A402D000, v5, OS_LOG_TYPE_DEFAULT, "Invalidated connection %@ for XPC provider %@", (uint8_t *)&v7, 0x16u);
    }

    objc_msgSend(WeakRetained, "setConnection:", 0);
    objc_msgSend(WeakRetained, "abstractProvider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleConnectionInterruptionForProvider:", WeakRetained);

  }
}

- (void)dealloc
{
  objc_super v3;

  -[BSServiceConnection invalidate](self->_connection, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)CXXPCChannelProvider;
  -[CXXPCChannelProvider dealloc](&v3, sel_dealloc);
}

- (void)invalidate
{
  id v2;

  -[CXXPCChannelProvider connection](self, "connection");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidate");

}

- (id)hostProtocolDelegate
{
  void *v2;
  void *v3;

  -[CXXPCChannelProvider connection](self, "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remoteTarget");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)requiresProxyingAVAudioSessionState
{
  return 1;
}

- (BSServiceConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (CXChannelServiceDefinition)definition
{
  return self->_definition;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_definition, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
