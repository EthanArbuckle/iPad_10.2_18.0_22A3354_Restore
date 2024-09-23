@implementation CXNetworkExtensionMessageControllerHostConnection

- (CXNetworkExtensionMessageControllerHostConnection)initWithConnection:(id)a3
{
  id v5;
  CXNetworkExtensionMessageControllerHostConnection *v6;
  CXNetworkExtensionMessageControllerHostConnection *v7;
  uint64_t v8;
  NSString *applicationIdentifier;
  uint64_t v10;
  NSSet *capabilities;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  id location;
  objc_super v21;
  uint8_t buf[4];
  CXNetworkExtensionMessageControllerHostConnection *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v21.receiver = self;
  v21.super_class = (Class)CXNetworkExtensionMessageControllerHostConnection;
  v6 = -[CXNetworkExtensionMessageControllerHostConnection init](&v21, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_accessorLock._os_unfair_lock_opaque = 0;
    objc_msgSend(v5, "cx_applicationIdentifier");
    v8 = objc_claimAutoreleasedReturnValue();
    applicationIdentifier = v7->_applicationIdentifier;
    v7->_applicationIdentifier = (NSString *)v8;

    objc_msgSend(v5, "cx_capabilities");
    v10 = objc_claimAutoreleasedReturnValue();
    capabilities = v7->_capabilities;
    v7->_capabilities = (NSSet *)v10;

    objc_storeStrong((id *)&v7->_connection, a3);
    -[NSXPCConnection setExportedObject:](v7->_connection, "setExportedObject:", v7);
    objc_msgSend(MEMORY[0x1E0CB3B50], "cx_networkExtensionMessageControllerHostInterface");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setExportedInterface:](v7->_connection, "setExportedInterface:", v12);

    objc_initWeak(&location, v7);
    v13 = MEMORY[0x1E0C809B0];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __72__CXNetworkExtensionMessageControllerHostConnection_initWithConnection___block_invoke;
    v18[3] = &unk_1E4B88CA8;
    objc_copyWeak(&v19, &location);
    -[NSXPCConnection setInterruptionHandler:](v7->_connection, "setInterruptionHandler:", v18);
    v16[0] = v13;
    v16[1] = 3221225472;
    v16[2] = __72__CXNetworkExtensionMessageControllerHostConnection_initWithConnection___block_invoke_2;
    v16[3] = &unk_1E4B88CA8;
    objc_copyWeak(&v17, &location);
    -[NSXPCConnection setInvalidationHandler:](v7->_connection, "setInvalidationHandler:", v16);
    -[NSXPCConnection resume](v7->_connection, "resume");
    CXDefaultLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v23 = v7;
      _os_log_impl(&dword_1A402D000, v14, OS_LOG_TYPE_DEFAULT, "Created %@", buf, 0xCu);
    }

    objc_destroyWeak(&v17);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }

  return v7;
}

void __72__CXNetworkExtensionMessageControllerHostConnection_initWithConnection___block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  int v3;
  id v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    CXDefaultLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = 138412290;
      v4 = WeakRetained;
      _os_log_impl(&dword_1A402D000, v2, OS_LOG_TYPE_DEFAULT, "Connection interrupted for network extension message controller host %@", (uint8_t *)&v3, 0xCu);
    }

    objc_msgSend(WeakRetained, "invalidate");
  }

}

void __72__CXNetworkExtensionMessageControllerHostConnection_initWithConnection___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  void *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    CXDefaultLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v4 = 138412290;
      v5 = WeakRetained;
      _os_log_impl(&dword_1A402D000, v2, OS_LOG_TYPE_DEFAULT, "Connection invalidated for network extension message controller host %@", (uint8_t *)&v4, 0xCu);
    }

    objc_msgSend(WeakRetained, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "networkExtensionMessageControllerHostConnectionInvalidated:", WeakRetained);

  }
}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCConnection invalidate](self->_connection, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)CXNetworkExtensionMessageControllerHostConnection;
  -[CXNetworkExtensionMessageControllerHostConnection dealloc](&v3, sel_dealloc);
}

- (CXNetworkExtensionMessageControllerHostConnectionDelegate)delegate
{
  os_unfair_lock_s *p_accessorLock;
  id WeakRetained;

  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  os_unfair_lock_unlock(p_accessorLock);
  return (CXNetworkExtensionMessageControllerHostConnectionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
  os_unfair_lock_s *p_accessorLock;
  CXNetworkExtensionMessageControllerHostConnectionDelegate **p_delegate;
  id WeakRetained;
  id obj;

  obj = a3;
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);

  if (WeakRetained != obj)
    objc_storeWeak((id *)p_delegate, obj);
  os_unfair_lock_unlock(p_accessorLock);

}

- (void)invalidate
{
  os_unfair_lock_s *p_accessorLock;
  void *v4;

  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  -[CXNetworkExtensionMessageControllerHostConnection connection](self, "connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidate");

  os_unfair_lock_unlock(p_accessorLock);
}

- (void)sendNetworkExtensionMessage:(id)a3 forBundleIdentifier:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, uint64_t, void *);
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, uint64_t, void *))a5;
  -[CXNetworkExtensionMessageControllerHostConnection capabilities](self, "capabilities");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "containsObject:", CFSTR("private-network-extension-message-api"));

  if ((_DWORD)v12)
  {
    -[CXNetworkExtensionMessageControllerHostConnection delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "networkExtensionMessageControllerHostConnection:didReceiveIncomingMessage:forBundleIdentifier:", self, v8, v9);

    v14 = 0;
  }
  else
  {
    CXDefaultLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[CXNetworkExtensionMessageControllerHostConnection sendNetworkExtensionMessage:forBundleIdentifier:reply:].cold.1((uint64_t)self, v15, v16, v17, v18, v19, v20, v21);

    objc_msgSend(MEMORY[0x1E0CB35C8], "cx_requestTransactionErrorWithCode:", 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v10[2](v10, v12, v14);

}

- (void)sendNetworkExtensionPushToTalkMessage:(id)a3 forBundleIdentifier:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, uint64_t, void *);
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, uint64_t, void *))a5;
  -[CXNetworkExtensionMessageControllerHostConnection capabilities](self, "capabilities");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "containsObject:", CFSTR("private-network-extension-message-api"));

  if ((_DWORD)v12)
  {
    -[CXNetworkExtensionMessageControllerHostConnection delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "networkExtensionMessageControllerHostConnection:didReceiveIncomingPushToTalkMessage:forBundleIdentifier:", self, v8, v9);

    v14 = 0;
  }
  else
  {
    CXDefaultLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[CXNetworkExtensionMessageControllerHostConnection sendNetworkExtensionMessage:forBundleIdentifier:reply:].cold.1((uint64_t)self, v15, v16, v17, v18, v19, v20, v21);

    objc_msgSend(MEMORY[0x1E0CB35C8], "cx_requestTransactionErrorWithCode:", 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v10[2](v10, v12, v14);

}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[CXNetworkExtensionMessageControllerHostConnection applicationIdentifier](self, "applicationIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CXNetworkExtensionMessageControllerHostConnection capabilities](self, "capabilities");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p applicationIdentifier=%@ capabilities=%@"), v4, self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (NSString)applicationIdentifier
{
  return self->_applicationIdentifier;
}

- (os_unfair_lock_s)accessorLock
{
  return self->_accessorLock;
}

- (NSSet)capabilities
{
  return self->_capabilities;
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_capabilities, 0);
  objc_storeStrong((id *)&self->_applicationIdentifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)sendNetworkExtensionMessage:(uint64_t)a3 forBundleIdentifier:(uint64_t)a4 reply:(uint64_t)a5 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A402D000, a2, a3, "Connection is not entitled to use private API: %@", a5, a6, a7, a8, 2u);
}

@end
