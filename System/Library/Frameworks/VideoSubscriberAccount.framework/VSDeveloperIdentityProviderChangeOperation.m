@implementation VSDeveloperIdentityProviderChangeOperation

- (VSDeveloperIdentityProviderChangeOperation)init
{
  VSDeveloperIdentityProviderChangeOperation *v2;
  uint64_t v3;
  NSXPCConnection *connection;
  NSXPCConnection *v5;
  void *v6;
  VSOptional *v7;
  VSOptional *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)VSDeveloperIdentityProviderChangeOperation;
  v2 = -[VSDeveloperIdentityProviderChangeOperation init](&v10, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithServiceName:", CFSTR("com.apple.VideoSubscriberAccount.DeveloperService"));
    connection = v2->_connection;
    v2->_connection = (NSXPCConnection *)v3;

    v5 = v2->_connection;
    VSDeveloperServiceInterface();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v5, "setRemoteObjectInterface:", v6);

    -[NSXPCConnection resume](v2->_connection, "resume");
    v7 = objc_alloc_init(VSOptional);
    v8 = v2->_result;
    v2->_result = v7;

  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCConnection invalidate](self->_connection, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)VSDeveloperIdentityProviderChangeOperation;
  -[VSDeveloperIdentityProviderChangeOperation dealloc](&v3, sel_dealloc);
}

- (id)_serviceWithErrorHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[VSDeveloperIdentityProviderChangeOperation connection](self, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)executionDidBegin
{
  uint64_t v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int64_t v8;
  void *v9;
  void *v10;
  _QWORD aBlock[5];
  uint8_t buf[8];
  _QWORD v13[5];

  v3 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __63__VSDeveloperIdentityProviderChangeOperation_executionDidBegin__block_invoke;
  v13[3] = &unk_1E939ED90;
  v13[4] = self;
  -[VSDeveloperIdentityProviderChangeOperation _serviceWithErrorHandler:](self, "_serviceWithErrorHandler:", v13);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  VSDefaultLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D2419000, v5, OS_LOG_TYPE_DEFAULT, "Will change developer identity.", buf, 2u);
  }

  aBlock[0] = v3;
  aBlock[1] = 3221225472;
  aBlock[2] = __63__VSDeveloperIdentityProviderChangeOperation_executionDidBegin__block_invoke_6;
  aBlock[3] = &unk_1E939EDB8;
  aBlock[4] = self;
  v6 = _Block_copy(aBlock);
  -[VSDeveloperIdentityProviderChangeOperation identityProvider](self, "identityProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[VSDeveloperIdentityProviderChangeOperation changeKind](self, "changeKind");
  switch(v8)
  {
    case 2:
      objc_msgSend(v7, "uniqueID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "forceUnwrapObject");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "removeDeveloperIdentityProviderWithUniqueID:completionHandler:", v10, v6);

      break;
    case 1:
      objc_msgSend(v4, "updateExistingDeveloperIdentityProvider:completionHandler:", v7, v6);
      break;
    case 0:
      objc_msgSend(v4, "addDeveloperIdentityProvider:completionHandler:", v7, v6);
      break;
  }

}

void __63__VSDeveloperIdentityProviderChangeOperation_executionDidBegin__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a2;
  VSErrorLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __63__VSDeveloperIdentityProviderChangeOperation_executionDidBegin__block_invoke_cold_1((uint64_t)v3, v4);

  v5 = *(void **)(a1 + 32);
  +[VSFailable failableWithError:](VSFailable, "failableWithError:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[VSOptional optionalWithObject:](VSOptional, "optionalWithObject:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setResult:", v7);

  objc_msgSend(*(id *)(a1 + 32), "finishExecutionIfPossible");
}

uint64_t __63__VSDeveloperIdentityProviderChangeOperation_executionDidBegin__block_invoke_6(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;

  v3 = *(void **)(a1 + 32);
  +[VSOptional optionalWithObject:](VSOptional, "optionalWithObject:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setResult:", v4);

  return objc_msgSend(*(id *)(a1 + 32), "finishExecutionIfPossible");
}

- (VSIdentityProvider)identityProvider
{
  return self->_identityProvider;
}

- (void)setIdentityProvider:(id)a3
{
  objc_storeStrong((id *)&self->_identityProvider, a3);
}

- (int64_t)changeKind
{
  return self->_changeKind;
}

- (void)setChangeKind:(int64_t)a3
{
  self->_changeKind = a3;
}

- (VSOptional)result
{
  return self->_result;
}

- (void)setResult:(id)a3
{
  objc_storeStrong((id *)&self->_result, a3);
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong((id *)&self->_identityProvider, 0);
}

void __63__VSDeveloperIdentityProviderChangeOperation_executionDidBegin__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1D2419000, a2, OS_LOG_TYPE_ERROR, "Error with developer service: %@", (uint8_t *)&v2, 0xCu);
}

@end
