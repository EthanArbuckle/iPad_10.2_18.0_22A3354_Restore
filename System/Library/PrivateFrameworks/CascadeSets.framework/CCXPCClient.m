@implementation CCXPCClient

- (void)serviceVersionRespondingRequest:(BOOL)a3 completion:(id)a4 usingBlock:(id)a5
{
  _BOOL8 v6;
  id v8;
  void (**v9)(id, void *, id);
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;

  v6 = a3;
  v8 = a4;
  v9 = (void (**)(id, void *, id))a5;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __69__CCXPCClient_serviceVersionRespondingRequest_completion_usingBlock___block_invoke;
  v12[3] = &unk_250990DB0;
  v10 = v8;
  v13 = v10;
  -[CCXPCClient _remoteObjectProxy:errorCompletion:](self, "_remoteObjectProxy:errorCompletion:", v6, v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    v9[2](v9, v11, v10);

}

- (void)serviceRequest:(BOOL)a3 completion:(id)a4 usingBlock:(id)a5
{
  _BOOL8 v6;
  void (**v8)(id, void *, id);
  void *v9;
  id v10;

  v6 = a3;
  v10 = a4;
  v8 = (void (**)(id, void *, id))a5;
  -[CCXPCClient _remoteObjectProxy:errorCompletion:](self, "_remoteObjectProxy:errorCompletion:", v6, v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    v8[2](v8, v9, v10);

}

- (id)_remoteObjectProxy:(BOOL)a3 errorCompletion:(id)a4
{
  _BOOL4 v4;
  void (**v6)(id, _QWORD);
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  v6 = (void (**)(id, _QWORD))a4;
  -[CCXPCClient _errorHandlerWithCompletion:](self, "_errorHandlerWithCompletion:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CCXPCClient connection](self, "connection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v4)
    objc_msgSend(v8, "synchronousRemoteObjectProxyWithErrorHandler:", v7);
  else
    objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 && !v10)
    v6[2](v6, -[CCXPCClient failureCode](self, "failureCode"));

  return v10;
}

- (NSXPCConnection)connection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 24, 1);
}

- (id)_errorHandlerWithCompletion:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  id v10;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __43__CCXPCClient__errorHandlerWithCompletion___block_invoke;
  v8[3] = &unk_250990D88;
  objc_copyWeak(&v10, &location);
  v9 = v4;
  v5 = v4;
  v6 = (void *)MEMORY[0x23B820934](v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
  return v6;
}

- (CCXPCClient)initWithRemoteObjectXPCInterface:(id)a3 exportedXPCInterface:(id)a4 connection:(id)a5 clientId:(id)a6 interruptionCode:(unsigned __int16)a7 invalidationCode:(unsigned __int16)a8 useCase:(id)a9
{
  uint64_t v9;
  id v15;
  id v16;
  id v17;
  id v18;
  CCXPCClient *v19;
  id *p_isa;
  id *v21;
  id v22;
  id v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  NSObject *v28;
  uint64_t v29;
  CCXPCClient *v30;
  id v32;
  _QWORD v33[4];
  id v34;
  id location;
  objc_super v36;

  v9 = a8;
  v15 = a3;
  v16 = a4;
  v32 = a5;
  v17 = a6;
  v18 = a9;
  v36.receiver = self;
  v36.super_class = (Class)CCXPCClient;
  v19 = -[CCXPCClient init](&v36, sel_init);
  p_isa = (id *)&v19->super.isa;
  if (v19)
  {
    v19->_failureCode = 0;
    v19->_interruptionCode = a7;
    objc_storeStrong((id *)&v19->_clientId, a6);
    objc_storeStrong(p_isa + 2, a9);
    v21 = p_isa + 3;
    objc_storeStrong(p_isa + 3, a5);
    v22 = p_isa[3];
    if (!v22)
    {
      v30 = 0;
      goto LABEL_10;
    }
    objc_msgSend(v22, "setRemoteObjectInterface:", v15);
    if (v16)
    {
      objc_msgSend(p_isa[3], "setExportedInterface:", v16);
      v23 = p_isa[3];
      objc_msgSend(MEMORY[0x24BE0C0B8], "weakProxyToObject:", p_isa);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setExportedObject:", v24);

    }
    objc_initWeak(&location, p_isa);
    v25 = p_isa[3];
    v33[0] = MEMORY[0x24BDAC760];
    v33[1] = 3221225472;
    v33[2] = __131__CCXPCClient_initWithRemoteObjectXPCInterface_exportedXPCInterface_connection_clientId_interruptionCode_invalidationCode_useCase___block_invoke;
    v33[3] = &unk_250990D38;
    objc_copyWeak(&v34, &location);
    objc_msgSend(v25, "setInterruptionHandler:", v33);
    v26 = p_isa[3];
    objc_msgSend(p_isa, "_failureHandlerWithResponse:", v9);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setInvalidationHandler:", v27);

    __biome_log_for_category();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
      -[CCXPCClient initWithRemoteObjectXPCInterface:exportedXPCInterface:connection:clientId:interruptionCode:invalidationCode:useCase:].cold.1((uint64_t)v17, v28, v29);

    objc_msgSend(*v21, "activate");
    objc_msgSend(*v21, "setBm_exportedUseCase:", v18);
    objc_destroyWeak(&v34);
    objc_destroyWeak(&location);
  }
  v30 = p_isa;
LABEL_10:

  return v30;
}

- (id)_failureHandlerWithResponse:(unsigned __int16)a3
{
  void *v4;
  _QWORD v6[4];
  id v7;
  unsigned __int16 v8;
  id location;

  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __43__CCXPCClient__failureHandlerWithResponse___block_invoke;
  v6[3] = &unk_250990D60;
  objc_copyWeak(&v7, &location);
  v8 = a3;
  v4 = (void *)MEMORY[0x23B820934](v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
  return v4;
}

- (CCXPCClient)initWithRemoteObjectInterface:(id)a3 exportedInterface:(id)a4 serviceName:(id)a5 clientId:(id)a6 interruptionCode:(unsigned __int16)a7 invalidationCode:(unsigned __int16)a8 useCase:(id)a9
{
  uint64_t v9;
  uint64_t v10;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  CCXPCClient *v22;

  v9 = a8;
  v10 = a7;
  v16 = (void *)MEMORY[0x24BDD1988];
  v17 = a9;
  v18 = a6;
  v19 = a4;
  v20 = a3;
  objc_msgSend(v16, "bm_connectionWithServiceName:queue:", a5, 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = -[CCXPCClient initWithRemoteObjectInterface:exportedInterface:connection:clientId:interruptionCode:invalidationCode:useCase:](self, "initWithRemoteObjectInterface:exportedInterface:connection:clientId:interruptionCode:invalidationCode:useCase:", v20, v19, v21, v18, v10, v9, v17);

  return v22;
}

- (CCXPCClient)initWithRemoteObjectInterface:(id)a3 exportedInterface:(id)a4 connection:(id)a5 clientId:(id)a6 interruptionCode:(unsigned __int16)a7 invalidationCode:(unsigned __int16)a8 useCase:(id)a9
{
  uint64_t v9;
  uint64_t v10;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  CCXPCClient *v21;

  v9 = a8;
  v10 = a7;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a9;
  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", a3);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", v15);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[CCXPCClient initWithRemoteObjectXPCInterface:exportedXPCInterface:connection:clientId:interruptionCode:invalidationCode:useCase:](self, "initWithRemoteObjectXPCInterface:exportedXPCInterface:connection:clientId:interruptionCode:invalidationCode:useCase:", v19, v20, v16, v17, v10, v9, v18);

  }
  else
  {
    v21 = -[CCXPCClient initWithRemoteObjectXPCInterface:exportedXPCInterface:connection:clientId:interruptionCode:invalidationCode:useCase:](self, "initWithRemoteObjectXPCInterface:exportedXPCInterface:connection:clientId:interruptionCode:invalidationCode:useCase:", v19, 0, v16, v17, v10, v9, v18);
  }

  return v21;
}

- (void)dealloc
{
  objc_super v3;

  -[CCXPCClient invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)CCXPCClient;
  -[CCXPCClient dealloc](&v3, sel_dealloc);
}

- (void)invalidate
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "clientId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v3;
  OUTLINED_FUNCTION_1_1(&dword_237B25000, a2, v4, "Invalidating XPC connection for client %@", (uint8_t *)&v5);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientId, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_useCase, 0);
}

void __43__CCXPCClient__failureHandlerWithResponse___block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    __biome_log_for_category();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      __43__CCXPCClient__failureHandlerWithResponse___block_invoke_cold_1(a1, WeakRetained, v3);

    objc_msgSend(WeakRetained, "setFailureCode:", *(unsigned __int16 *)(a1 + 40));
    objc_msgSend(WeakRetained, "setConnection:", 0);
  }

}

- (CCXPCClient)init
{
  id v2;

  objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], CFSTR("init unsupported"), MEMORY[0x24BDBD1B8]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

void __131__CCXPCClient_initWithRemoteObjectXPCInterface_exportedXPCInterface_connection_clientId_interruptionCode_invalidationCode_useCase___block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  __biome_log_for_category();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(WeakRetained, "connection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "clientId");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412546;
    v6 = v3;
    v7 = 2112;
    v8 = v4;
    _os_log_impl(&dword_237B25000, v2, OS_LOG_TYPE_DEFAULT, "XPC connection %@ for client %@ interrupted", (uint8_t *)&v5, 0x16u);

  }
}

void __43__CCXPCClient__errorHandlerWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    __biome_log_for_category();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __43__CCXPCClient__errorHandlerWithCompletion___block_invoke_cold_1((uint64_t)v3, WeakRetained, v5);

    v6 = objc_msgSend(WeakRetained, "interruptionCode");
    objc_msgSend(WeakRetained, "setFailureCode:", v6);
    objc_msgSend(WeakRetained, "setConnection:", 0);
  }
  else
  {
    v6 = 0;
  }
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, uint64_t))(v7 + 16))(v7, v6);

}

- (void)serviceOptionsRespondingRequest:(BOOL)a3 completion:(id)a4 usingBlock:(id)a5
{
  _BOOL8 v6;
  id v8;
  void (**v9)(id, void *, id);
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;

  v6 = a3;
  v8 = a4;
  v9 = (void (**)(id, void *, id))a5;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __69__CCXPCClient_serviceOptionsRespondingRequest_completion_usingBlock___block_invoke;
  v12[3] = &unk_250990DB0;
  v10 = v8;
  v13 = v10;
  -[CCXPCClient _remoteObjectProxy:errorCompletion:](self, "_remoteObjectProxy:errorCompletion:", v6, v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    v9[2](v9, v11, v10);

}

uint64_t __69__CCXPCClient_serviceOptionsRespondingRequest_completion_usingBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 16))(result, a2, 0);
  return result;
}

uint64_t __69__CCXPCClient_serviceVersionRespondingRequest_completion_usingBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 16))(result, a2, 0);
  return result;
}

- (void)serviceArrayRespondingRequestWithCompletion:(id)a3 usingBlock:(id)a4
{
  id v6;
  void (**v7)(id, void *, id);
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v6 = a3;
  v7 = (void (**)(id, void *, id))a4;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __70__CCXPCClient_serviceArrayRespondingRequestWithCompletion_usingBlock___block_invoke;
  v10[3] = &unk_250990DB0;
  v8 = v6;
  v11 = v8;
  -[CCXPCClient _remoteObjectProxy:errorCompletion:](self, "_remoteObjectProxy:errorCompletion:", 1, v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    v7[2](v7, v9, v8);

}

uint64_t __70__CCXPCClient_serviceArrayRespondingRequestWithCompletion_usingBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

- (void)requestBiomeEndpointForAppScopedService:(unint64_t)a3 user:(unsigned int)a4 reply:(id)a5
{
  uint64_t v5;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void (**v28)(id, _QWORD, void *);
  void *v29;
  _QWORD v30[6];
  _QWORD v31[5];
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  uint64_t v44;
  uint64_t v45;
  const __CFString *v46;
  uint64_t v47;
  const __CFString *v48;
  uint64_t v49;
  _QWORD v50[3];

  v5 = *(_QWORD *)&a4;
  v50[1] = *MEMORY[0x24BDAC8D0];
  v28 = (void (**)(id, _QWORD, void *))a5;
  v8 = (void *)MEMORY[0x24BE0C0A0];
  objc_msgSend(MEMORY[0x24BDD1988], "currentConnection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "processWithXPCConnection:", v9);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v29, "processType");
  v11 = (uint64_t *)MEMORY[0x24BDD0FC8];
  if (v10 != 5)
  {
    v25 = (void *)MEMORY[0x24BDD1540];
    v49 = *MEMORY[0x24BDD0FC8];
    v50[0] = CFSTR("Not authorized");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v50, &v49, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CascadeSets.Donate"), 3, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28[2](v28, 0, v27);

    goto LABEL_15;
  }
  if (!a3 && objc_msgSend(v29, "uid") == (_DWORD)v5)
    v5 = getuid();
  v44 = 0;
  v38 = 0;
  v39 = &v38;
  v40 = 0x3032000000;
  v41 = __Block_byref_object_copy__4;
  v42 = __Block_byref_object_dispose__4;
  v43 = 0;
  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__4;
  v36 = __Block_byref_object_dispose__4;
  v37 = 0;
  v12 = *MEMORY[0x24BE0C040];
  v13 = *v11;
  do
  {
    objc_msgSend(MEMORY[0x24BE0C078], "connectionToAccessServerInDomain:user:useCase:", a3, v5, self->_useCase);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "connection");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15)
    {
      v31[0] = MEMORY[0x24BDAC760];
      v31[1] = 3221225472;
      v31[2] = __66__CCXPCClient_requestBiomeEndpointForAppScopedService_user_reply___block_invoke;
      v31[3] = &unk_250990DD8;
      v31[4] = &v32;
      objc_msgSend(v15, "synchronousRemoteObjectProxyWithErrorHandler:", v31);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v17;
      if (v17)
      {
        v30[0] = MEMORY[0x24BDAC760];
        v30[1] = 3221225472;
        v30[2] = __66__CCXPCClient_requestBiomeEndpointForAppScopedService_user_reply___block_invoke_2;
        v30[3] = &unk_250990E00;
        v30[4] = &v38;
        v30[5] = &v32;
        objc_msgSend(v17, "requestBiomeEndpointForAppScopedService:user:reply:", a3, v5, v30);
        goto LABEL_12;
      }
      v22 = (void *)MEMORY[0x24BDD1540];
      v45 = v13;
      v46 = CFSTR("Failed to create remote object proxy");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v46, &v45, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "errorWithDomain:code:userInfo:", v12, 7, v21);
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = (void *)v33[5];
      v33[5] = v23;

    }
    else
    {
      v19 = (void *)MEMORY[0x24BDD1540];
      v47 = v13;
      v48 = CFSTR("Failed to create connection");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v48, &v47, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "errorWithDomain:code:userInfo:", v12, 7, v18);
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = (void *)v33[5];
      v33[5] = v20;
    }

LABEL_12:
  }
  while ((BMShouldRetry() & 1) != 0);
  v28[2](v28, v39[5], (void *)v33[5]);
  _Block_object_dispose(&v32, 8);

  _Block_object_dispose(&v38, 8);
LABEL_15:

}

void __66__CCXPCClient_requestBiomeEndpointForAppScopedService_user_reply___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __66__CCXPCClient_requestBiomeEndpointForAppScopedService_user_reply___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

- (NSString)useCase
{
  return self->_useCase;
}

- (void)setConnection:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (unsigned)failureCode
{
  return self->_failureCode;
}

- (void)setFailureCode:(unsigned __int16)a3
{
  self->_failureCode = a3;
}

- (NSString)clientId
{
  return self->_clientId;
}

- (unsigned)interruptionCode
{
  return self->_interruptionCode;
}

- (void)initWithRemoteObjectXPCInterface:(uint64_t)a3 exportedXPCInterface:connection:clientId:interruptionCode:invalidationCode:useCase:.cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_1_1(&dword_237B25000, a2, a3, "Client %@ connecting to XPC service", (uint8_t *)&v3);
}

void __43__CCXPCClient__failureHandlerWithResponse___block_invoke_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  int v4;
  void *v5;
  _DWORD v6[2];
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = *(unsigned __int16 *)(a1 + 40);
  objc_msgSend(a2, "clientId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = 67109378;
  v6[1] = v4;
  v7 = 2112;
  v8 = v5;
  _os_log_debug_impl(&dword_237B25000, a3, OS_LOG_TYPE_DEBUG, "XPC connection terminated (%u) for client %@", (uint8_t *)v6, 0x12u);

  OUTLINED_FUNCTION_0_4();
}

void __43__CCXPCClient__errorHandlerWithCompletion___block_invoke_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a2, "clientId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = a1;
  v8 = 2112;
  v9 = v5;
  _os_log_error_impl(&dword_237B25000, a3, OS_LOG_TYPE_ERROR, "XPC request hit error (%@) for client %@", (uint8_t *)&v6, 0x16u);

  OUTLINED_FUNCTION_0_4();
}

@end
