@implementation CXNetworkExtensionMessageControllerXPCClient

- (CXNetworkExtensionMessageControllerXPCClient)init
{
  CXNetworkExtensionMessageControllerXPCClient *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CXNetworkExtensionMessageControllerXPCClient;
  result = -[CXNetworkExtensionMessageControllerXPCClient init](&v3, sel_init);
  if (result)
    result->_accessorLock._os_unfair_lock_opaque = 0;
  return result;
}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCConnection invalidate](self->_connection, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)CXNetworkExtensionMessageControllerXPCClient;
  -[CXNetworkExtensionMessageControllerXPCClient dealloc](&v3, sel_dealloc);
}

- (NSXPCConnection)connection
{
  os_unfair_lock_s *p_accessorLock;
  NSXPCConnection *connection;
  NSXPCConnection *v5;
  NSXPCConnection *v6;
  void *v7;
  uint64_t v8;
  NSXPCConnection *v9;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  id location;

  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  connection = self->_connection;
  if (!connection)
  {
    v5 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.callkit.networkextension.messagecontrollerhost"), 0);
    v6 = self->_connection;
    self->_connection = v5;

    objc_msgSend(MEMORY[0x1E0CB3B50], "cx_networkExtensionMessageControllerHostInterface");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](self->_connection, "setRemoteObjectInterface:", v7);

    objc_initWeak(&location, self);
    v8 = MEMORY[0x1E0C809B0];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __58__CXNetworkExtensionMessageControllerXPCClient_connection__block_invoke;
    v13[3] = &unk_1E4B88CA8;
    objc_copyWeak(&v14, &location);
    -[NSXPCConnection setInterruptionHandler:](self->_connection, "setInterruptionHandler:", v13);
    v11[0] = v8;
    v11[1] = 3221225472;
    v11[2] = __58__CXNetworkExtensionMessageControllerXPCClient_connection__block_invoke_4;
    v11[3] = &unk_1E4B88CA8;
    objc_copyWeak(&v12, &location);
    -[NSXPCConnection setInvalidationHandler:](self->_connection, "setInvalidationHandler:", v11);
    -[NSXPCConnection resume](self->_connection, "resume");
    objc_destroyWeak(&v12);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
    connection = self->_connection;
  }
  v9 = connection;
  os_unfair_lock_unlock(p_accessorLock);
  return v9;
}

void __58__CXNetworkExtensionMessageControllerXPCClient_connection__block_invoke(uint64_t a1)
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
      _os_log_impl(&dword_1A402D000, v2, OS_LOG_TYPE_DEFAULT, "Connection interrupted for network extension message client %@", (uint8_t *)&v3, 0xCu);
    }

    objc_msgSend(WeakRetained, "invalidate");
    objc_msgSend(WeakRetained, "setConnection:", 0);
  }

}

void __58__CXNetworkExtensionMessageControllerXPCClient_connection__block_invoke_4(uint64_t a1)
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
      _os_log_impl(&dword_1A402D000, v2, OS_LOG_TYPE_DEFAULT, "Connection invalidated for network extension message client %@", (uint8_t *)&v3, 0xCu);
    }

    objc_msgSend(WeakRetained, "setConnection:", 0);
  }

}

- (void)setConnection:(id)a3
{
  os_unfair_lock_s *p_accessorLock;
  NSXPCConnection **p_connection;
  NSXPCConnection *connection;
  NSXPCConnection *v8;

  v8 = (NSXPCConnection *)a3;
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  connection = self->_connection;
  p_connection = &self->_connection;
  if (connection != v8)
    objc_storeStrong((id *)p_connection, a3);
  os_unfair_lock_unlock(p_accessorLock);

}

- (void)invalidate
{
  os_unfair_lock_s *p_accessorLock;

  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  -[NSXPCConnection invalidate](self->_connection, "invalidate");
  os_unfair_lock_unlock(p_accessorLock);
}

- (void)sendNetworkExtensionMessage:(id)a3 forBundleIdentifier:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[CXNetworkExtensionMessageControllerXPCClient connection](self, "connection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __107__CXNetworkExtensionMessageControllerXPCClient_sendNetworkExtensionMessage_forBundleIdentifier_completion___block_invoke;
  v18[3] = &unk_1E4B89080;
  v13 = v8;
  v19 = v13;
  objc_msgSend(v11, "remoteObjectProxyWithErrorHandler:", v18);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v12;
  v16[1] = 3221225472;
  v16[2] = __107__CXNetworkExtensionMessageControllerXPCClient_sendNetworkExtensionMessage_forBundleIdentifier_completion___block_invoke_6;
  v16[3] = &unk_1E4B896D8;
  v17 = v13;
  v15 = v13;
  objc_msgSend(v14, "sendNetworkExtensionMessage:forBundleIdentifier:reply:", v10, v9, v16);

}

void __107__CXNetworkExtensionMessageControllerXPCClient_sendNetworkExtensionMessage_forBundleIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v3 = a2;
  CXDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __107__CXNetworkExtensionMessageControllerXPCClient_sendNetworkExtensionMessage_forBundleIdentifier_completion___block_invoke_cold_1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);

  v11 = *(_QWORD *)(a1 + 32);
  if (v11)
    (*(void (**)(uint64_t, _QWORD, id))(v11 + 16))(v11, 0, v3);

}

uint64_t __107__CXNetworkExtensionMessageControllerXPCClient_sendNetworkExtensionMessage_forBundleIdentifier_completion___block_invoke_6(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  return result;
}

- (void)sendNetworkExtensionPushToTalkMessage:(id)a3 forBundleIdentifier:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[CXNetworkExtensionMessageControllerXPCClient connection](self, "connection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __117__CXNetworkExtensionMessageControllerXPCClient_sendNetworkExtensionPushToTalkMessage_forBundleIdentifier_completion___block_invoke;
  v18[3] = &unk_1E4B89080;
  v13 = v8;
  v19 = v13;
  objc_msgSend(v11, "remoteObjectProxyWithErrorHandler:", v18);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v12;
  v16[1] = 3221225472;
  v16[2] = __117__CXNetworkExtensionMessageControllerXPCClient_sendNetworkExtensionPushToTalkMessage_forBundleIdentifier_completion___block_invoke_8;
  v16[3] = &unk_1E4B896D8;
  v17 = v13;
  v15 = v13;
  objc_msgSend(v14, "sendNetworkExtensionPushToTalkMessage:forBundleIdentifier:reply:", v10, v9, v16);

}

void __117__CXNetworkExtensionMessageControllerXPCClient_sendNetworkExtensionPushToTalkMessage_forBundleIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v3 = a2;
  CXDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __117__CXNetworkExtensionMessageControllerXPCClient_sendNetworkExtensionPushToTalkMessage_forBundleIdentifier_completion___block_invoke_cold_1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);

  v11 = *(_QWORD *)(a1 + 32);
  if (v11)
    (*(void (**)(uint64_t, _QWORD, id))(v11 + 16))(v11, 0, v3);

}

uint64_t __117__CXNetworkExtensionMessageControllerXPCClient_sendNetworkExtensionPushToTalkMessage_forBundleIdentifier_completion___block_invoke_8(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  return result;
}

- (os_unfair_lock_s)accessorLock
{
  return self->_accessorLock;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
}

void __107__CXNetworkExtensionMessageControllerXPCClient_sendNetworkExtensionMessage_forBundleIdentifier_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A402D000, a2, a3, "Could not send VoIP network extension message due to connection error %@", a5, a6, a7, a8, 2u);
}

void __117__CXNetworkExtensionMessageControllerXPCClient_sendNetworkExtensionPushToTalkMessage_forBundleIdentifier_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A402D000, a2, a3, "Could not send PushToTalk network extension message due to connection error %@", a5, a6, a7, a8, 2u);
}

@end
