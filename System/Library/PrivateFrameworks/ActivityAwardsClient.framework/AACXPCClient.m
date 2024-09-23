@implementation AACXPCClient

- (AACXPCClient)init
{
  AACXPCClient *v2;
  AACXPCClient *v3;
  uint64_t v4;
  OS_dispatch_queue *serverQueue;
  uint64_t v6;
  OS_dispatch_queue *clientQueue;
  NSObject *v8;
  _QWORD block[4];
  AACXPCClient *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)AACXPCClient;
  v2 = -[AACXPCClient init](&v12, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    HKCreateSerialDispatchQueue();
    v4 = objc_claimAutoreleasedReturnValue();
    serverQueue = v3->_serverQueue;
    v3->_serverQueue = (OS_dispatch_queue *)v4;

    HKCreateSerialDispatchQueue();
    v6 = objc_claimAutoreleasedReturnValue();
    clientQueue = v3->_clientQueue;
    v3->_clientQueue = (OS_dispatch_queue *)v6;

    v8 = v3->_serverQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __20__AACXPCClient_init__block_invoke;
    block[3] = &unk_24D15BC28;
    v11 = v3;
    dispatch_async(v8, block);

  }
  return v3;
}

uint64_t __20__AACXPCClient_init__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_serverQueue_initializeDaemonConnection");
}

- (void)dealloc
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21412E000, v0, v1, "Dealloc called on AACXPCClient", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)invalidate
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21412E000, v0, v1, "Invalidate called on AACXPCClient", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_serverQueue_initializeDaemonConnection
{
  NSXPCConnection *v3;
  NSXPCConnection *mainDaemonConnection;
  void *v5;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_serverQueue);
  v3 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", CFSTR("com.apple.activityawardsd"), 0);
  mainDaemonConnection = self->_mainDaemonConnection;
  self->_mainDaemonConnection = v3;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254D66FB0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSXPCConnection setRemoteObjectInterface:](self->_mainDaemonConnection, "setRemoteObjectInterface:", v5);

  -[NSXPCConnection setInvalidationHandler:](self->_mainDaemonConnection, "setInvalidationHandler:", &__block_literal_global);
  -[NSXPCConnection setInterruptionHandler:](self->_mainDaemonConnection, "setInterruptionHandler:", &__block_literal_global_236);
  -[NSXPCConnection resume](self->_mainDaemonConnection, "resume");
}

void __55__AACXPCClient__serverQueue_initializeDaemonConnection__block_invoke()
{
  NSObject *v0;

  ACHLogXPC();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __55__AACXPCClient__serverQueue_initializeDaemonConnection__block_invoke_cold_1();

}

void __55__AACXPCClient__serverQueue_initializeDaemonConnection__block_invoke_235()
{
  NSObject *v0;

  ACHLogXPC();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __55__AACXPCClient__serverQueue_initializeDaemonConnection__block_invoke_235_cold_1();

}

- (void)sendRequest:(unint64_t)a3 completion:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[5];
  id v12;
  unint64_t v13;

  v6 = a4;
  v7 = MEMORY[0x24BDAC760];
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __39__AACXPCClient_sendRequest_completion___block_invoke;
  v11[3] = &unk_24D15BD00;
  v13 = a3;
  v11[4] = self;
  v12 = v6;
  v9[0] = v7;
  v9[1] = 3221225472;
  v9[2] = __39__AACXPCClient_sendRequest_completion___block_invoke_4;
  v9[3] = &unk_24D15BD28;
  v10 = v12;
  v8 = v12;
  -[AACXPCClient _remoteProxy:errorHandler:](self, "_remoteProxy:errorHandler:", v11, v9);

}

void __39__AACXPCClient_sendRequest_completion___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  uint64_t v4;
  _QWORD v5[5];
  id v6;

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __39__AACXPCClient_sendRequest_completion___block_invoke_2;
  v5[3] = &unk_24D15BCD8;
  v3 = (void *)a1[5];
  v4 = a1[6];
  v5[4] = a1[4];
  v6 = v3;
  objc_msgSend(a2, "transportRequest:data:completion:", v4, 0, v5);

}

void __39__AACXPCClient_sendRequest_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 40);
  v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __39__AACXPCClient_sendRequest_completion___block_invoke_3;
  block[3] = &unk_24D15BCB0;
  v13 = v6;
  v14 = v7;
  v12 = v5;
  v9 = v6;
  v10 = v5;
  dispatch_async(v8, block);

}

uint64_t __39__AACXPCClient_sendRequest_completion___block_invoke_3(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __39__AACXPCClient_sendRequest_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)sendRequest:(unint64_t)a3 payloadData:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  AACXPCClient *v17;
  id v18;
  unint64_t v19;

  v8 = a4;
  v9 = a5;
  v10 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __51__AACXPCClient_sendRequest_payloadData_completion___block_invoke;
  v15[3] = &unk_24D15BD50;
  v19 = a3;
  v16 = v8;
  v17 = self;
  v18 = v9;
  v13[0] = v10;
  v13[1] = 3221225472;
  v13[2] = __51__AACXPCClient_sendRequest_payloadData_completion___block_invoke_4;
  v13[3] = &unk_24D15BD28;
  v14 = v18;
  v11 = v18;
  v12 = v8;
  -[AACXPCClient _remoteProxy:errorHandler:](self, "_remoteProxy:errorHandler:", v15, v13);

}

void __51__AACXPCClient_sendRequest_payloadData_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[5];
  id v6;

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __51__AACXPCClient_sendRequest_payloadData_completion___block_invoke_2;
  v5[3] = &unk_24D15BCD8;
  v3 = *(_QWORD *)(a1 + 32);
  v5[4] = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 56);
  v6 = *(id *)(a1 + 48);
  objc_msgSend(a2, "transportRequest:data:completion:", v4, v3, v5);

}

void __51__AACXPCClient_sendRequest_payloadData_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 40);
  v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __51__AACXPCClient_sendRequest_payloadData_completion___block_invoke_3;
  block[3] = &unk_24D15BCB0;
  v13 = v6;
  v14 = v7;
  v12 = v5;
  v9 = v6;
  v10 = v5;
  dispatch_async(v8, block);

}

uint64_t __51__AACXPCClient_sendRequest_payloadData_completion___block_invoke_3(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __51__AACXPCClient_sendRequest_payloadData_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)sendRequest:(unint64_t)a3 payload:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  AACXPCClient *v17;
  id v18;
  unint64_t v19;

  v8 = a4;
  v9 = a5;
  v10 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __47__AACXPCClient_sendRequest_payload_completion___block_invoke;
  v15[3] = &unk_24D15BD50;
  v19 = a3;
  v16 = v8;
  v17 = self;
  v18 = v9;
  v13[0] = v10;
  v13[1] = 3221225472;
  v13[2] = __47__AACXPCClient_sendRequest_payload_completion___block_invoke_4;
  v13[3] = &unk_24D15BD28;
  v14 = v18;
  v11 = v18;
  v12 = v8;
  -[AACXPCClient _remoteProxy:errorHandler:](self, "_remoteProxy:errorHandler:", v15, v13);

}

void __47__AACXPCClient_sendRequest_payload_completion___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v3 = (void *)MEMORY[0x24BDD1608];
  v4 = a1[4];
  v12 = 0;
  v5 = a2;
  objc_msgSend(v3, "dataWithJSONObject:options:error:", v4, 4, &v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v12;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __47__AACXPCClient_sendRequest_payload_completion___block_invoke_2;
  v10[3] = &unk_24D15BCD8;
  v8 = (void *)a1[6];
  v9 = a1[7];
  v10[4] = a1[5];
  v11 = v8;
  objc_msgSend(v5, "transportRequest:data:completion:", v9, v6, v10);

}

void __47__AACXPCClient_sendRequest_payload_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 40);
  v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __47__AACXPCClient_sendRequest_payload_completion___block_invoke_3;
  block[3] = &unk_24D15BCB0;
  v13 = v6;
  v14 = v7;
  v12 = v5;
  v9 = v6;
  v10 = v5;
  dispatch_async(v8, block);

}

uint64_t __47__AACXPCClient_sendRequest_payload_completion___block_invoke_3(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __47__AACXPCClient_sendRequest_payload_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)sendSynchronousRequest:(unint64_t)a3 resultHandler:(id)a4
{
  -[AACXPCClient sendSynchronousRequest:payload:resultHandler:](self, "sendSynchronousRequest:payload:resultHandler:", a3, 0, a4);
}

- (void)sendSynchronousRequest:(unint64_t)a3 payload:(id)a4 resultHandler:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  unint64_t v18;

  v8 = a4;
  v9 = a5;
  v10 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __61__AACXPCClient_sendSynchronousRequest_payload_resultHandler___block_invoke;
  v15[3] = &unk_24D15BD00;
  v16 = v8;
  v18 = a3;
  v17 = v9;
  v13[0] = v10;
  v13[1] = 3221225472;
  v13[2] = __61__AACXPCClient_sendSynchronousRequest_payload_resultHandler___block_invoke_2;
  v13[3] = &unk_24D15BD28;
  v14 = v17;
  v11 = v17;
  v12 = v8;
  -[AACXPCClient _remoteSynchronousProxy:errorHandler:](self, "_remoteSynchronousProxy:errorHandler:", v15, v13);

}

void __61__AACXPCClient_sendSynchronousRequest_payload_resultHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
  {
    v11 = 0;
    objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v4, 4, &v11);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v11;
    if (!v5)
    {
      ACHLogXPC();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        __61__AACXPCClient_sendSynchronousRequest_payload_resultHandler___block_invoke_cold_1();

    }
  }
  else
  {
    v5 = 0;
  }
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __61__AACXPCClient_sendSynchronousRequest_payload_resultHandler___block_invoke_241;
  v9[3] = &unk_24D15BBD8;
  v8 = *(_QWORD *)(a1 + 48);
  v10 = *(id *)(a1 + 40);
  objc_msgSend(v3, "transportRequest:data:completion:", v8, v5, v9);

}

uint64_t __61__AACXPCClient_sendSynchronousRequest_payload_resultHandler___block_invoke_241(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __61__AACXPCClient_sendSynchronousRequest_payload_resultHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_discardEndpointConnection:(id)a3
{
  NSXPCConnection *endpointConnection;
  NSXPCConnection *v5;

  v5 = (NSXPCConnection *)a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_endpointConnection == v5)
  {
    -[NSXPCConnection invalidate](v5, "invalidate");
    endpointConnection = self->_endpointConnection;
    self->_endpointConnection = 0;

  }
  os_unfair_lock_unlock(&self->_lock);

}

- (void)_resetEndpointConnection
{
  os_unfair_lock_s *p_lock;
  NSXPCConnection *endpointConnection;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[NSXPCConnection invalidate](self->_endpointConnection, "invalidate");
  endpointConnection = self->_endpointConnection;
  self->_endpointConnection = 0;

  os_unfair_lock_unlock(p_lock);
}

- (void)_handleError:(id)a3
{
  if (objc_msgSend(a3, "hk_isXPCConnectionError"))
    -[AACXPCClient _resetEndpointConnection](self, "_resetEndpointConnection");
}

- (void)_remoteProxy:(id)a3 errorHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *serverQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  serverQueue = self->_serverQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __42__AACXPCClient__remoteProxy_errorHandler___block_invoke;
  block[3] = &unk_24D15BE40;
  block[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(serverQueue, block);

}

void __42__AACXPCClient__remoteProxy_errorHandler___block_invoke(id *a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  id v9;
  id v10;
  uint64_t *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  uint64_t *v17;
  id v18;
  id location;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  os_unfair_lock_lock((os_unfair_lock_t)a1[4] + 2);
  v2 = *((id *)a1[4] + 4);
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__0;
  v24 = __Block_byref_object_dispose__0;
  v25 = *((id *)a1[4] + 5);
  objc_initWeak(&location, a1[4]);
  v3 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __42__AACXPCClient__remoteProxy_errorHandler___block_invoke_242;
  v15[3] = &unk_24D15BDA0;
  objc_copyWeak(&v18, &location);
  v17 = &v20;
  v16 = a1[5];
  v4 = (void *)MEMORY[0x2199C9558](v15);
  os_unfair_lock_unlock((os_unfair_lock_t)a1[4] + 2);
  v5 = (void *)v21[5];
  if (v5)
  {
    v13[0] = v3;
    v13[1] = 3221225472;
    v13[2] = __42__AACXPCClient__remoteProxy_errorHandler___block_invoke_3;
    v13[3] = &unk_24D15BD28;
    v14 = v4;
    objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v13);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(void))a1[6] + 2))();

    v7 = v14;
  }
  else
  {
    objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = v3;
    v8[1] = 3221225472;
    v8[2] = __42__AACXPCClient__remoteProxy_errorHandler___block_invoke_243;
    v8[3] = &unk_24D15BE18;
    v8[4] = a1[4];
    v11 = &v20;
    objc_copyWeak(&v12, &location);
    v9 = v4;
    v10 = a1[6];
    objc_msgSend(v7, "createEndpointNamed:completion:", CFSTR("AAC_XPC_Endpoint_Awards_Client"), v8);

    objc_destroyWeak(&v12);
  }

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v20, 8);

}

void __42__AACXPCClient__remoteProxy_errorHandler___block_invoke_242(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *WeakRetained;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (objc_msgSend(v3, "hk_isXPCConnectionError"))
      objc_msgSend(WeakRetained, "_discardEndpointConnection:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
    v5 = WeakRetained[3];
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __42__AACXPCClient__remoteProxy_errorHandler___block_invoke_2;
    v6[3] = &unk_24D15BD78;
    v8 = *(id *)(a1 + 32);
    v7 = v3;
    dispatch_async(v5, v6);

  }
}

uint64_t __42__AACXPCClient__remoteProxy_errorHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __42__AACXPCClient__remoteProxy_errorHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  ACHLogXPC();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __42__AACXPCClient__remoteProxy_errorHandler___block_invoke_3_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __42__AACXPCClient__remoteProxy_errorHandler___block_invoke_243(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  id v18;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(NSObject **)(v7 + 16);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __42__AACXPCClient__remoteProxy_errorHandler___block_invoke_2_244;
  block[3] = &unk_24D15BDF0;
  v17 = *(_QWORD *)(a1 + 56);
  v12 = v5;
  v13 = v7;
  v9 = v5;
  objc_copyWeak(&v18, (id *)(a1 + 64));
  v15 = *(id *)(a1 + 40);
  v16 = *(id *)(a1 + 48);
  v14 = v6;
  v10 = v6;
  dispatch_async(v8, block);

  objc_destroyWeak(&v18);
}

void __42__AACXPCClient__remoteProxy_errorHandler___block_invoke_2_244(uint64_t a1)
{
  BOOL v2;
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  uint8_t buf[4];
  const __CFString *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32) == 0;
  ACHLogXPC();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __42__AACXPCClient__remoteProxy_errorHandler___block_invoke_2_244_cold_1();

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21412E000, v4, OS_LOG_TYPE_DEFAULT, "Creating endpoint connection", buf, 2u);
    }

    v5 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithListenerEndpoint:", *(_QWORD *)(a1 + 32));
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254D66EF0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "setRemoteObjectInterface:", v8);

    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254D66EF0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "setExportedInterface:", v9);

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "setExportedObject:", *(_QWORD *)(a1 + 40));
    v10 = MEMORY[0x24BDAC760];
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __42__AACXPCClient__remoteProxy_errorHandler___block_invoke_252;
    v18[3] = &unk_24D15BDC8;
    objc_copyWeak(&v19, (id *)(a1 + 80));
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "setInvalidationHandler:", v18);
    v16[0] = v10;
    v16[1] = 3221225472;
    v16[2] = __42__AACXPCClient__remoteProxy_errorHandler___block_invoke_253;
    v16[3] = &unk_24D15BDC8;
    objc_copyWeak(&v17, (id *)(a1 + 80));
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "setInterruptionHandler:", v16);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "resume");
    os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 40) + 8));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 40), "invalidate");
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 40), *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40));
    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 40) + 8));
    v11 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
    v14[0] = v10;
    v14[1] = 3221225472;
    v14[2] = __42__AACXPCClient__remoteProxy_errorHandler___block_invoke_254;
    v14[3] = &unk_24D15BD28;
    v15 = *(id *)(a1 + 56);
    objc_msgSend(v11, "remoteObjectProxyWithErrorHandler:", v14);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    ACHLogXPC();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v21 = CFSTR("AAC_XPC_Endpoint_Awards_Client");
      _os_log_impl(&dword_21412E000, v13, OS_LOG_TYPE_DEFAULT, "XPC endpoint setup complete for %{public}@.", buf, 0xCu);
    }

    objc_destroyWeak(&v17);
    objc_destroyWeak(&v19);
  }
}

void __42__AACXPCClient__remoteProxy_errorHandler___block_invoke_252(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;

  ACHLogXPC();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __42__AACXPCClient__remoteProxy_errorHandler___block_invoke_252_cold_1();

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_resetEndpointConnection");

}

void __42__AACXPCClient__remoteProxy_errorHandler___block_invoke_253(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;

  ACHLogXPC();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __42__AACXPCClient__remoteProxy_errorHandler___block_invoke_253_cold_1();

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_resetEndpointConnection");

}

void __42__AACXPCClient__remoteProxy_errorHandler___block_invoke_254(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  ACHLogXPC();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __42__AACXPCClient__remoteProxy_errorHandler___block_invoke_3_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_remoteSynchronousProxy:(id)a3 errorHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *serverQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  serverQueue = self->_serverQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __53__AACXPCClient__remoteSynchronousProxy_errorHandler___block_invoke;
  block[3] = &unk_24D15BF10;
  block[4] = self;
  objc_copyWeak(&v14, &location);
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_sync(serverQueue, block);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __53__AACXPCClient__remoteSynchronousProxy_errorHandler___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;
  _QWORD *v11;
  _QWORD v12[4];
  id v13;
  _QWORD *v14;
  id v15;
  _QWORD v16[5];
  id v17;

  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 32);
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x3032000000;
  v16[3] = __Block_byref_object_copy__0;
  v16[4] = __Block_byref_object_dispose__0;
  v17 = 0;
  v3 = MEMORY[0x24BDAC760];
  v12[0] = MEMORY[0x24BDAC760];
  v12[2] = __53__AACXPCClient__remoteSynchronousProxy_errorHandler___block_invoke_2;
  v12[3] = &unk_24D15BDA0;
  v12[1] = 3221225472;
  objc_copyWeak(&v15, (id *)(a1 + 56));
  v14 = v16;
  v13 = *(id *)(a1 + 40);
  v4 = (void *)MEMORY[0x2199C9558](v12);
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(v2, "synchronousRemoteObjectProxyWithErrorHandler:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v3;
  v8[1] = 3221225472;
  v8[2] = __53__AACXPCClient__remoteSynchronousProxy_errorHandler___block_invoke_4;
  v8[3] = &unk_24D15BEE8;
  v6 = *(_QWORD *)(a1 + 32);
  v11 = v16;
  v8[4] = v6;
  v9 = *(id *)(a1 + 48);
  v7 = v4;
  v10 = v7;
  objc_msgSend(v5, "createEndpointNamed:completion:", CFSTR("AAC_XPC_Endpoint_Awards_Client"), v8);

  objc_destroyWeak(&v15);
  _Block_object_dispose(v16, 8);

}

void __53__AACXPCClient__remoteSynchronousProxy_errorHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *WeakRetained;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (objc_msgSend(v3, "hk_isXPCConnectionError"))
      objc_msgSend(WeakRetained, "_discardEndpointConnection:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
    v5 = WeakRetained[3];
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __53__AACXPCClient__remoteSynchronousProxy_errorHandler___block_invoke_3;
    v6[3] = &unk_24D15BD78;
    v8 = *(id *)(a1 + 32);
    v7 = v3;
    dispatch_async(v5, v6);

  }
}

uint64_t __53__AACXPCClient__remoteSynchronousProxy_errorHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __53__AACXPCClient__remoteSynchronousProxy_errorHandler___block_invoke_4(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  uint8_t v19[16];

  v5 = a2;
  v6 = a3;
  ACHLogXPC();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v19 = 0;
      _os_log_impl(&dword_21412E000, v8, OS_LOG_TYPE_DEFAULT, "Creating endpoint connection", v19, 2u);
    }

    v9 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithListenerEndpoint:", v5);
    v10 = *(_QWORD *)(a1[7] + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254D66EF0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1[7] + 8) + 40), "setRemoteObjectInterface:", v12);

    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254D66EF0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1[7] + 8) + 40), "setExportedInterface:", v13);

    objc_msgSend(*(id *)(*(_QWORD *)(a1[7] + 8) + 40), "setExportedObject:", a1[4]);
    objc_msgSend(*(id *)(*(_QWORD *)(a1[7] + 8) + 40), "setInvalidationHandler:", &__block_literal_global_257);
    objc_msgSend(*(id *)(*(_QWORD *)(a1[7] + 8) + 40), "setInterruptionHandler:", &__block_literal_global_259);
    objc_msgSend(*(id *)(*(_QWORD *)(a1[7] + 8) + 40), "resume");
    objc_msgSend(*(id *)(*(_QWORD *)(a1[7] + 8) + 40), "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_261);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    ACHLogXPC();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      __53__AACXPCClient__remoteSynchronousProxy_errorHandler___block_invoke_4_cold_3();

    (*(void (**)(void))(a1[5] + 16))();
    ACHLogXPC();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      __53__AACXPCClient__remoteSynchronousProxy_errorHandler___block_invoke_4_cold_2();

    objc_msgSend(*(id *)(*(_QWORD *)(a1[7] + 8) + 40), "invalidate");
    v17 = *(_QWORD *)(a1[7] + 8);
    v18 = *(void **)(v17 + 40);
    *(_QWORD *)(v17 + 40) = 0;

  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __53__AACXPCClient__remoteSynchronousProxy_errorHandler___block_invoke_4_cold_1();

    (*(void (**)(void))(a1[6] + 16))();
  }

}

void __53__AACXPCClient__remoteSynchronousProxy_errorHandler___block_invoke_256()
{
  NSObject *v0;

  ACHLogXPC();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __53__AACXPCClient__remoteSynchronousProxy_errorHandler___block_invoke_256_cold_1();

}

void __53__AACXPCClient__remoteSynchronousProxy_errorHandler___block_invoke_258()
{
  NSObject *v0;

  ACHLogXPC();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __53__AACXPCClient__remoteSynchronousProxy_errorHandler___block_invoke_258_cold_1();

}

void __53__AACXPCClient__remoteSynchronousProxy_errorHandler___block_invoke_260(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  ACHLogXPC();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __53__AACXPCClient__remoteSynchronousProxy_errorHandler___block_invoke_260_cold_1();

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endpointConnection, 0);
  objc_storeStrong((id *)&self->_mainDaemonConnection, 0);
  objc_storeStrong((id *)&self->_clientQueue, 0);
  objc_storeStrong((id *)&self->_serverQueue, 0);
}

void __55__AACXPCClient__serverQueue_initializeDaemonConnection__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_6(&dword_21412E000, v0, v1, "Mach XPC service connection invalidated", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __55__AACXPCClient__serverQueue_initializeDaemonConnection__block_invoke_235_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_6(&dword_21412E000, v0, v1, "Mach XPC service connection interrupted", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __61__AACXPCClient_sendSynchronousRequest_payload_resultHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_0(&dword_21412E000, v0, v1, "Error serializing paylod: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __42__AACXPCClient__remoteProxy_errorHandler___block_invoke_3_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_0(&dword_21412E000, v0, v1, "Failed to fetch endpoint proxy with error %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __42__AACXPCClient__remoteProxy_errorHandler___block_invoke_2_244_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_21412E000, v0, v1, "Unable to establish XPC endpoint connection for %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __42__AACXPCClient__remoteProxy_errorHandler___block_invoke_252_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_21412E000, v0, v1, "XPC client-side connection invalidated for %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __42__AACXPCClient__remoteProxy_errorHandler___block_invoke_253_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_21412E000, v0, v1, "XPC client-side connection interrupted for %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __53__AACXPCClient__remoteSynchronousProxy_errorHandler___block_invoke_4_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_21412E000, v0, v1, "Unable to establish Sync XPC endpoint connection for %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __53__AACXPCClient__remoteSynchronousProxy_errorHandler___block_invoke_4_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21412E000, v0, v1, "Invaliding sync XPC endpoint connection after handler returned", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __53__AACXPCClient__remoteSynchronousProxy_errorHandler___block_invoke_4_cold_3()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_3();
  _os_log_debug_impl(&dword_21412E000, v0, OS_LOG_TYPE_DEBUG, "Sync XPC endpoint setup complete for %{public}@, passing proxy to handler.", v1, 0xCu);
  OUTLINED_FUNCTION_1_0();
}

void __53__AACXPCClient__remoteSynchronousProxy_errorHandler___block_invoke_256_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_21412E000, v0, v1, "Sync XPC client-side connection invalidated for %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __53__AACXPCClient__remoteSynchronousProxy_errorHandler___block_invoke_258_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_21412E000, v0, v1, "Sync XPC client-side connection interrupted for %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __53__AACXPCClient__remoteSynchronousProxy_errorHandler___block_invoke_260_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_0(&dword_21412E000, v0, v1, "Sync XPC failed to fetch endpoint proxy with error %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

@end
