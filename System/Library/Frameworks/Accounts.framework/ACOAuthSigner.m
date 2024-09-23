@implementation ACOAuthSigner

- (ACOAuthSigner)initWithAccount:(id)a3
{
  return -[ACOAuthSigner initWithAccount:remoteEndpoint:](self, "initWithAccount:remoteEndpoint:", a3, 0);
}

- (ACOAuthSigner)initWithAccount:(id)a3 remoteEndpoint:(id)a4
{
  id v7;
  id v8;
  ACOAuthSigner *v9;
  ACOAuthSigner *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ACOAuthSigner;
  v9 = -[ACOAuthSigner init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_shouldIncludeAppIdInRequest = 1;
    objc_storeStrong((id *)&v9->_account, a3);
    -[ACOAuthSigner _connectToRemoteOAuthSignerUsingEndpoint:](v10, "_connectToRemoteOAuthSignerUsingEndpoint:", v8);
    -[ACAccount accountStore](v10->_account, "accountStore");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "effectiveBundleID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
      -[ACDOAuthSignerProtocol setClientBundleID:withHandler:](v10->_proxyShim, "setClientBundleID:withHandler:", v12, &__block_literal_global_4);

  }
  return v10;
}

void __48__ACOAuthSigner_initWithAccount_remoteEndpoint___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSObject *v3;

  if (a3)
  {
    _ACLogSystem();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __48__ACOAuthSigner_initWithAccount_remoteEndpoint___block_invoke_cold_1(v3);

  }
}

- (void)dealloc
{
  objc_super v3;

  -[ACOAuthSigner disconnectFromRemoteOAuthSigner](self, "disconnectFromRemoteOAuthSigner");
  v3.receiver = self;
  v3.super_class = (Class)ACOAuthSigner;
  -[ACOAuthSigner dealloc](&v3, sel_dealloc);
}

- (id)signedURLRequestWithURLRequest:(id)a3 callingPID:(id)a4 timestamp:(id)a5
{
  id v8;
  id v9;
  id v10;
  dispatch_semaphore_t v11;
  ACDOAuthSignerProtocol *proxyShim;
  ACAccount *account;
  NSObject *v14;
  id v15;
  _QWORD v17[4];
  NSObject *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 0);
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__1;
  v24 = __Block_byref_object_dispose__1;
  v25 = 0;
  v11 = dispatch_semaphore_create(0);
  -[ACDOAuthSignerProtocol setShouldIncludeAppIdInRequest:](self->_proxyShim, "setShouldIncludeAppIdInRequest:", self->_shouldIncludeAppIdInRequest);
  account = self->_account;
  proxyShim = self->_proxyShim;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __69__ACOAuthSigner_signedURLRequestWithURLRequest_callingPID_timestamp___block_invoke;
  v17[3] = &unk_1E4893FF0;
  v19 = &v20;
  v14 = v11;
  v18 = v14;
  -[ACDOAuthSignerProtocol signURLRequest:withAccount:callingPID:timestamp:handler:](proxyShim, "signURLRequest:withAccount:callingPID:timestamp:handler:", v8, account, v9, v10, v17);
  dispatch_semaphore_wait(v14, 0xFFFFFFFFFFFFFFFFLL);
  v15 = (id)v21[5];

  _Block_object_dispose(&v20, 8);
  return v15;
}

void __69__ACOAuthSigner_signedURLRequestWithURLRequest_callingPID_timestamp___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v6 = a2;
  v7 = a3;
  if (v7)
  {
    _ACLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __69__ACOAuthSigner_signedURLRequestWithURLRequest_callingPID_timestamp___block_invoke_cold_1((uint64_t)v7, v8, v9, v10, v11, v12, v13, v14);

  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (id)signedURLRequestWithURLRequest:(id)a3 applicationID:(id)a4 timestamp:(id)a5
{
  id v8;
  id v9;
  id v10;
  dispatch_semaphore_t v11;
  ACDOAuthSignerProtocol *proxyShim;
  ACAccount *account;
  NSObject *v14;
  id v15;
  _QWORD v17[4];
  NSObject *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__1;
  v24 = __Block_byref_object_dispose__1;
  v25 = 0;
  v11 = dispatch_semaphore_create(0);
  account = self->_account;
  proxyShim = self->_proxyShim;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __72__ACOAuthSigner_signedURLRequestWithURLRequest_applicationID_timestamp___block_invoke;
  v17[3] = &unk_1E4893FF0;
  v19 = &v20;
  v14 = v11;
  v18 = v14;
  -[ACDOAuthSignerProtocol signURLRequest:withAccount:applicationID:timestamp:handler:](proxyShim, "signURLRequest:withAccount:applicationID:timestamp:handler:", v8, account, v9, v10, v17);
  dispatch_semaphore_wait(v14, 0xFFFFFFFFFFFFFFFFLL);
  v15 = (id)v21[5];

  _Block_object_dispose(&v20, 8);
  return v15;
}

void __72__ACOAuthSigner_signedURLRequestWithURLRequest_applicationID_timestamp___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v6 = a2;
  v7 = a3;
  if (v7)
  {
    _ACLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __69__ACOAuthSigner_signedURLRequestWithURLRequest_callingPID_timestamp___block_invoke_cold_1((uint64_t)v7, v8, v9, v10, v11, v12, v13, v14);

  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (id)signedURLRequestWithURLRequest:(id)a3
{
  return -[ACOAuthSigner signedURLRequestWithURLRequest:callingPID:timestamp:](self, "signedURLRequestWithURLRequest:callingPID:timestamp:", a3, 0, 0);
}

- (void)_connectToRemoteOAuthSignerUsingEndpoint:(id)a3
{
  id v4;
  NSXPCConnection *v5;
  NSXPCConnection *connection;
  void *v7;
  ACDOAuthSignerProtocol *v8;
  ACDOAuthSignerProtocol *proxyShim;
  id v10;

  v10 = a3;
  v4 = objc_alloc(MEMORY[0x1E0CB3B38]);
  if (v10)
    v5 = (NSXPCConnection *)objc_msgSend(v4, "initWithListenerEndpoint:", v10);
  else
    v5 = (NSXPCConnection *)objc_msgSend(v4, "initWithMachServiceName:options:", CFSTR("com.apple.accountsd.oauthsigner"), 0);
  connection = self->_connection;
  self->_connection = v5;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE6B9BF0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSXPCConnection setRemoteObjectInterface:](self->_connection, "setRemoteObjectInterface:", v7);

  -[NSXPCConnection setInterruptionHandler:](self->_connection, "setInterruptionHandler:", &__block_literal_global_59);
  -[NSXPCConnection remoteObjectProxy](self->_connection, "remoteObjectProxy");
  v8 = (ACDOAuthSignerProtocol *)objc_claimAutoreleasedReturnValue();
  proxyShim = self->_proxyShim;
  self->_proxyShim = v8;

  -[NSXPCConnection resume](self->_connection, "resume");
}

void __58__ACOAuthSigner__connectToRemoteOAuthSignerUsingEndpoint___block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  _ACLogSystem();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1A2BCD000, v0, OS_LOG_TYPE_DEFAULT, "\"The connection to ACDOAuthSigner was interrupted.\", v1, 2u);
  }

}

- (void)disconnectFromRemoteOAuthSigner
{
  -[NSXPCConnection invalidate](self->_connection, "invalidate");
}

- (BOOL)shouldIncludeAppIdInRequest
{
  return self->_shouldIncludeAppIdInRequest;
}

- (void)setShouldIncludeAppIdInRequest:(BOOL)a3
{
  self->_shouldIncludeAppIdInRequest = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proxyShim, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

void __48__ACOAuthSigner_initWithAccount_remoteEndpoint___block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A2BCD000, log, OS_LOG_TYPE_ERROR, "\"Bundle ID spoofing failed.\", v1, 2u);
}

void __69__ACOAuthSigner_signedURLRequestWithURLRequest_callingPID_timestamp___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1A2BCD000, a2, a3, "\"Error signing request: %@\", a5, a6, a7, a8, 2u);
}

@end
