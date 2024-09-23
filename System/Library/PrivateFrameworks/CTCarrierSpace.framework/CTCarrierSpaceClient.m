@implementation CTCarrierSpaceClient

- (void)_connect_sync
{
  NSXPCListenerEndpoint *endpoint;
  id v4;
  NSXPCConnection *v5;
  NSXPCConnection *connection;
  CTCarrierSpaceClientDelegateProxy *v7;
  CTCarrierSpaceClientDelegateProxy *delegateProxy;
  void *v9;
  uint64_t v10;
  NSXPCConnection *v11;
  NSObject *v12;
  dispatch_object_s *v13;
  NSObject *fObj;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  id location;

  endpoint = self->_endpoint;
  v4 = objc_alloc(MEMORY[0x24BDD1988]);
  if (endpoint)
    v5 = (NSXPCConnection *)objc_msgSend(v4, "initWithListenerEndpoint:", self->_endpoint);
  else
    v5 = (NSXPCConnection *)objc_msgSend(v4, "initWithMachServiceName:options:", CFSTR("com.apple.commcenter.carrierspace.xpc"), 4096);
  connection = self->_connection;
  self->_connection = v5;

  v7 = objc_alloc_init(CTCarrierSpaceClientDelegateProxy);
  delegateProxy = self->_delegateProxy;
  self->_delegateProxy = v7;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2545B1240);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSXPCConnection setExportedInterface:](self->_connection, "setExportedInterface:", v9);

  -[NSXPCConnection setExportedObject:](self->_connection, "setExportedObject:", self->_delegateProxy);
  -[NSXPCConnection setRemoteObjectInterface:](self->_connection, "setRemoteObjectInterface:", objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2545B2200));
  location = 0;
  objc_initWeak(&location, self);
  v10 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __37__CTCarrierSpaceClient__connect_sync__block_invoke;
  v17[3] = &unk_24C24E5A8;
  objc_copyWeak(&v18, &location);
  -[NSXPCConnection setInvalidationHandler:](self->_connection, "setInvalidationHandler:", v17);
  v15[0] = v10;
  v15[1] = 3221225472;
  v15[2] = __37__CTCarrierSpaceClient__connect_sync__block_invoke_59;
  v15[3] = &unk_24C24E5A8;
  objc_copyWeak(&v16, &location);
  -[NSXPCConnection setInterruptionHandler:](self->_connection, "setInterruptionHandler:", v15);
  v11 = self->_connection;
  if (self->_callbackQueue.fObj.fObj)
  {
    -[NSXPCConnection _setQueue:](v11, "_setQueue:");
  }
  else
  {
    v12 = -[NSXPCConnection _queue](v11, "_queue");
    v13 = (dispatch_object_s *)v12;
    if (v12)
      dispatch_retain(v12);
    fObj = self->_callbackQueue.fObj.fObj;
    self->_callbackQueue.fObj.fObj = v13;
    if (fObj)
      dispatch_release(fObj);
  }
  -[NSXPCConnection resume](self->_connection, "resume");
  objc_destroyWeak(&v16);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

void __37__CTCarrierSpaceClient__connect_sync__block_invoke(uint64_t a1)
{
  dispatch_queue_t *WeakRetained;
  dispatch_queue_t *v2;
  _QWORD block[4];
  dispatch_queue_t *v4;

  WeakRetained = (dispatch_queue_t *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __37__CTCarrierSpaceClient__connect_sync__block_invoke_2;
    block[3] = &unk_24C24E580;
    v4 = WeakRetained;
    dispatch_async(v2[2], block);

  }
}

void __37__CTCarrierSpaceClient__connect_sync__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint8_t v5[16];

  v2 = _CTCarrierSpaceLogDomain();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_209C80000, v2, OS_LOG_TYPE_DEFAULT, "Connection has been invalidated", v5, 2u);
  }
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 8);
  *(_QWORD *)(v3 + 8) = 0;

}

void __37__CTCarrierSpaceClient__connect_sync__block_invoke_59(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  uint8_t v4[16];

  v2 = _CTCarrierSpaceLogDomain();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_209C80000, v2, OS_LOG_TYPE_DEFAULT, "Connection interrupted. Attempting to reestablish connection", v4, 2u);
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "ping:", &__block_literal_global);

}

void __37__CTCarrierSpaceClient__connect_sync__block_invoke_60(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  uint8_t v11[16];

  v2 = a2;
  if (v2)
  {
    v3 = _CTCarrierSpaceLogDomain();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __37__CTCarrierSpaceClient__connect_sync__block_invoke_60_cold_1((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);
  }
  else
  {
    v10 = _CTCarrierSpaceLogDomain();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_209C80000, v10, OS_LOG_TYPE_DEFAULT, "Successfully reestablished connection", v11, 2u);
    }
  }

}

- (void)_ensureConnected_sync
{
  if (!self->_connection)
    -[CTCarrierSpaceClient _connect_sync](self, "_connect_sync");
}

- (id)_proxyWithErrorHandler:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  NSObject *fObj;
  void *v8;
  _QWORD v10[5];
  id v11;
  id v12;
  _QWORD block[6];
  void *v14;

  v4 = a3;
  v5 = MEMORY[0x24BDAC760];
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __47__CTCarrierSpaceClient__proxyWithErrorHandler___block_invoke;
  v10[3] = &unk_24C24E618;
  v10[4] = self;
  v11 = v4;
  v6 = v4;
  v12 = (id)MEMORY[0x20BD181CC](v10);
  block[0] = v5;
  fObj = self->_queue.fObj.fObj;
  v14 = 0;
  block[1] = 3221225472;
  block[2] = ___ZN8dispatch9sync_implIU8__strongU13block_pointerFP11objc_objectvEEENSt3__15decayIDTclfp0_EEE4typeEP16dispatch_queue_sOT_NS6_17integral_constantIbLb0EEE_block_invoke;
  block[3] = &__block_descriptor_48_e5_v8__0l;
  block[4] = &v14;
  block[5] = &v12;
  dispatch_sync(fObj, block);
  v8 = v14;

  return v8;
}

id __47__CTCarrierSpaceClient__proxyWithErrorHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "_ensureConnected_sync");
  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __47__CTCarrierSpaceClient__proxyWithErrorHandler___block_invoke_2;
  v6[3] = &unk_24C24E5F0;
  v7 = v2;
  objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void __47__CTCarrierSpaceClient__proxyWithErrorHandler___block_invoke_2(uint64_t a1, void *a2)
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
  v4 = _CTCarrierSpaceLogDomain();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __47__CTCarrierSpaceClient__proxyWithErrorHandler___block_invoke_2_cold_1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);
  v11 = *(_QWORD *)(a1 + 32);
  if (v11)
    (*(void (**)(uint64_t, id))(v11 + 16))(v11, v3);

}

- (void)setDelegate:(id)a3
{
  id v4;
  NSObject *fObj;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[CTCarrierSpaceClient _ensureConnected_sync](self, "_ensureConnected_sync");
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __36__CTCarrierSpaceClient_setDelegate___block_invoke;
  v7[3] = &unk_24C24E640;
  v7[4] = self;
  v8 = v4;
  fObj = self->_callbackQueue.fObj.fObj;
  v6 = v4;
  dispatch_async(fObj, v7);

}

void __36__CTCarrierSpaceClient_setDelegate___block_invoke(uint64_t a1)
{
  id WeakRetained;

  objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 48), *(id *)(a1 + 40));
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 48));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "setDelegate:");

}

- (CTCarrierSpaceClient)initWithQueue:(dispatch_queue_s *)a3
{
  id v4;
  NSObject *v5;
  dispatch_queue_t v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *global_queue;
  NSObject *v11;
  NSObject *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)CTCarrierSpaceClient;
  v4 = -[CTCarrierSpaceClient init](&v13, sel_init);
  if (v4)
  {
    v5 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v6 = dispatch_queue_create("com.apple.CTCarrierSpaceClient", v5);
    v7 = *((_QWORD *)v4 + 2);
    *((_QWORD *)v4 + 2) = v6;
    if (v7)
      dispatch_release(v7);
    if (a3)
      dispatch_retain((dispatch_object_t)a3);
    v8 = *((_QWORD *)v4 + 3);
    *((_QWORD *)v4 + 3) = a3;
    if (v8)
    {
      dispatch_release(v8);
      a3 = (dispatch_queue_s *)*((_QWORD *)v4 + 3);
    }
    if (!a3)
    {
      global_queue = dispatch_get_global_queue(0, 0);
      v11 = global_queue;
      if (global_queue)
      {
        dispatch_retain(global_queue);
        v12 = *((_QWORD *)v4 + 3);
        *((_QWORD *)v4 + 3) = v11;
        if (v12)
          dispatch_release(v12);
      }
      else
      {
        *((_QWORD *)v4 + 3) = 0;
      }
    }
    objc_msgSend(v4, "_ensureConnected_sync");
  }
  return (CTCarrierSpaceClient *)v4;
}

- (CTCarrierSpaceClient)init
{
  return -[CTCarrierSpaceClient initWithQueue:](self, "initWithQueue:", 0);
}

- (void)dealloc
{
  NSXPCConnection *connection;
  objc_super v4;

  connection = self->_connection;
  if (connection)
    -[NSXPCConnection invalidate](connection, "invalidate");
  v4.receiver = self;
  v4.super_class = (Class)CTCarrierSpaceClient;
  -[CTCarrierSpaceClient dealloc](&v4, sel_dealloc);
}

- (CTCarrierSpaceClient)initWithQueue:(dispatch_queue_s *)a3 andListenerEndpoint:(id)a4
{
  objc_storeStrong((id *)&self->_endpoint, a4);
  return -[CTCarrierSpaceClient initWithQueue:](self, "initWithQueue:", a3);
}

- (void)ping:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[CTCarrierSpaceClient _proxyWithErrorHandler:](self, "_proxyWithErrorHandler:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ping:", v5);

}

- (void)invalidate
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __34__CTCarrierSpaceClient_invalidate__block_invoke;
  block[3] = &unk_24C24E580;
  block[4] = self;
  dispatch_async((dispatch_queue_t)self->_queue.fObj.fObj, block);
}

uint64_t __34__CTCarrierSpaceClient_invalidate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "invalidate");
}

- (void)refreshUsageInfo:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[CTCarrierSpaceClient _proxyWithErrorHandler:](self, "_proxyWithErrorHandler:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "refreshUsageInfo:", v5);

}

- (void)refreshPlansInfo:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[CTCarrierSpaceClient _proxyWithErrorHandler:](self, "_proxyWithErrorHandler:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "refreshPlansInfo:", v5);

}

- (void)refreshAppsInfo:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[CTCarrierSpaceClient _proxyWithErrorHandler:](self, "_proxyWithErrorHandler:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "refreshAppsInfo:", v5);

}

- (void)setUserInAuthFlow:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;

  v4 = a3;
  v7 = a4;
  -[CTCarrierSpaceClient _proxyWithErrorHandler:](self, "_proxyWithErrorHandler:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setUserInAuthFlow:completion:", v4, v7);

}

- (void)authenticationDidComplete:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  -[CTCarrierSpaceClient _proxyWithErrorHandler:](self, "_proxyWithErrorHandler:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "authenticationDidComplete:completion:", v8, v6);

}

- (void)authenticationDidFail:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  -[CTCarrierSpaceClient _proxyWithErrorHandler:](self, "_proxyWithErrorHandler:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "authenticationDidFail:completion:", v8, v6);

}

- (void)userDidAcceptPlanTerms:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;

  v4 = a3;
  v7 = a4;
  -[CTCarrierSpaceClient _proxyWithErrorHandler:](self, "_proxyWithErrorHandler:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "userDidAcceptPlanTerms:completion:", v4, v7);

}

- (void)getAuthenticationContext:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __49__CTCarrierSpaceClient_getAuthenticationContext___block_invoke;
  v7[3] = &unk_24C24E5F0;
  v5 = v4;
  v8 = v5;
  -[CTCarrierSpaceClient _proxyWithErrorHandler:](self, "_proxyWithErrorHandler:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "getAuthenticationContext:", v5);

}

uint64_t __49__CTCarrierSpaceClient_getAuthenticationContext___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)getCapabilities:(id)a3
{
  id v4;
  id v5;
  void *v6;
  NSObject *v7;
  uint8_t v8[8];
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __40__CTCarrierSpaceClient_getCapabilities___block_invoke;
  v9[3] = &unk_24C24E5F0;
  v5 = v4;
  v10 = v5;
  -[CTCarrierSpaceClient _proxyWithErrorHandler:](self, "_proxyWithErrorHandler:", v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = _CTCarrierSpaceLogDomain();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_209C80000, v7, OS_LOG_TYPE_INFO, "Client requesting to get capabiities", v8, 2u);
  }
  objc_msgSend(v6, "getCapabilities:", v5);

}

uint64_t __40__CTCarrierSpaceClient_getCapabilities___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)getUserConsentFlowInfo:(id)a3
{
  id v4;
  id v5;
  void *v6;
  NSObject *v7;
  uint8_t v8[8];
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __47__CTCarrierSpaceClient_getUserConsentFlowInfo___block_invoke;
  v9[3] = &unk_24C24E5F0;
  v5 = v4;
  v10 = v5;
  -[CTCarrierSpaceClient _proxyWithErrorHandler:](self, "_proxyWithErrorHandler:", v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = _CTCarrierSpaceLogDomain();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_209C80000, v7, OS_LOG_TYPE_INFO, "Client requesting to get user consent flow information", v8, 2u);
    }
    objc_msgSend(v6, "getUserConsentFlowInfo:", v5);
  }

}

uint64_t __47__CTCarrierSpaceClient_getUserConsentFlowInfo___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)setUserConsent:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  NSObject *v8;
  uint8_t v9[16];

  v4 = a3;
  v6 = a4;
  -[CTCarrierSpaceClient _proxyWithErrorHandler:](self, "_proxyWithErrorHandler:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = _CTCarrierSpaceLogDomain();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_209C80000, v8, OS_LOG_TYPE_INFO, "Client setting user consent", v9, 2u);
  }
  objc_msgSend(v7, "setUserConsent:completion:", v4, v6);

}

- (void)fetchUsageInfo:(id)a3
{
  -[CTCarrierSpaceClient fetchUsageInfo:completion:](self, "fetchUsageInfo:completion:", 0, a3);
}

- (void)fetchUsageInfo:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  uint8_t v10[8];
  _QWORD v11[4];
  id v12;

  v4 = a3;
  v6 = a4;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __50__CTCarrierSpaceClient_fetchUsageInfo_completion___block_invoke;
  v11[3] = &unk_24C24E5F0;
  v7 = v6;
  v12 = v7;
  -[CTCarrierSpaceClient _proxyWithErrorHandler:](self, "_proxyWithErrorHandler:", v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = _CTCarrierSpaceLogDomain();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_209C80000, v9, OS_LOG_TYPE_INFO, "Client requesting to fetch usage", v10, 2u);
  }
  objc_msgSend(v8, "fetchUsageInfo:completion:", v4, v7);

}

uint64_t __50__CTCarrierSpaceClient_fetchUsageInfo_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchPlansInfo:(id)a3
{
  -[CTCarrierSpaceClient fetchPlansInfo:completion:](self, "fetchPlansInfo:completion:", 0, a3);
}

- (void)fetchPlansInfo:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  uint8_t v10[8];
  _QWORD v11[4];
  id v12;

  v4 = a3;
  v6 = a4;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __50__CTCarrierSpaceClient_fetchPlansInfo_completion___block_invoke;
  v11[3] = &unk_24C24E5F0;
  v7 = v6;
  v12 = v7;
  -[CTCarrierSpaceClient _proxyWithErrorHandler:](self, "_proxyWithErrorHandler:", v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = _CTCarrierSpaceLogDomain();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_209C80000, v9, OS_LOG_TYPE_INFO, "Client requesting to fetch plans", v10, 2u);
  }
  objc_msgSend(v8, "fetchPlansInfo:completion:", v4, v7);

}

uint64_t __50__CTCarrierSpaceClient_fetchPlansInfo_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchAppsInfo:(id)a3
{
  -[CTCarrierSpaceClient fetchAppsInfo:completion:](self, "fetchAppsInfo:completion:", 0, a3);
}

- (void)fetchAppsInfo:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  uint8_t v10[8];
  _QWORD v11[4];
  id v12;

  v4 = a3;
  v6 = a4;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __49__CTCarrierSpaceClient_fetchAppsInfo_completion___block_invoke;
  v11[3] = &unk_24C24E5F0;
  v7 = v6;
  v12 = v7;
  -[CTCarrierSpaceClient _proxyWithErrorHandler:](self, "_proxyWithErrorHandler:", v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = _CTCarrierSpaceLogDomain();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_209C80000, v9, OS_LOG_TYPE_INFO, "Client requesting to fetch apps", v10, 2u);
  }
  objc_msgSend(v8, "fetchAppsInfo:completion:", v4, v7);

}

uint64_t __49__CTCarrierSpaceClient_fetchAppsInfo_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)refreshAllInfo:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  uint8_t v7[16];

  v4 = a3;
  -[CTCarrierSpaceClient _proxyWithErrorHandler:](self, "_proxyWithErrorHandler:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = _CTCarrierSpaceLogDomain();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_209C80000, v6, OS_LOG_TYPE_INFO, "Client requesting to refresh all info", v7, 2u);
  }
  objc_msgSend(v5, "refreshAllInfo:", v4);

}

- (void)purchasePlan:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[CTCarrierSpaceClient _proxyWithErrorHandler:](self, "_proxyWithErrorHandler:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = _CTCarrierSpaceLogDomain();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = 138412290;
    v11 = v6;
    _os_log_impl(&dword_209C80000, v9, OS_LOG_TYPE_INFO, "Client requesting to purchase plan: %@", (uint8_t *)&v10, 0xCu);
  }
  objc_msgSend(v8, "purchasePlan:authInfo:completion:", v6, 0, v7);

}

- (void)purchasePlan:(id)a3 authInfo:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  int v13;
  id v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[CTCarrierSpaceClient _proxyWithErrorHandler:](self, "_proxyWithErrorHandler:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = _CTCarrierSpaceLogDomain();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v13 = 138412546;
    v14 = v8;
    v15 = 2112;
    v16 = v9;
    _os_log_impl(&dword_209C80000, v12, OS_LOG_TYPE_INFO, "Client requesting to purchase plan: %@, auth info: %@", (uint8_t *)&v13, 0x16u);
  }
  objc_msgSend(v11, "purchasePlan:authInfo:completion:", v8, v9, v10);

}

- (void)fetchDataPlanMetrics:(id)a3
{
  id v4;
  id v5;
  void *v6;
  NSObject *v7;
  uint8_t v8[8];
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __45__CTCarrierSpaceClient_fetchDataPlanMetrics___block_invoke;
  v9[3] = &unk_24C24E5F0;
  v5 = v4;
  v10 = v5;
  -[CTCarrierSpaceClient _proxyWithErrorHandler:](self, "_proxyWithErrorHandler:", v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = _CTCarrierSpaceLogDomain();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_209C80000, v7, OS_LOG_TYPE_INFO, "Client is fetching data plan metrics", v8, 2u);
  }
  objc_msgSend(v6, "fetchDataPlanMetrics:", v5);

}

uint64_t __45__CTCarrierSpaceClient_fetchDataPlanMetrics___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (CTCarrierSpaceClientDelegate)delegate
{
  return (CTCarrierSpaceClientDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  NSObject *fObj;
  NSObject *v4;

  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_delegateProxy, 0);
  objc_storeStrong((id *)&self->_endpoint, 0);
  fObj = self->_callbackQueue.fObj.fObj;
  if (fObj)
    dispatch_release(fObj);
  v4 = self->_queue.fObj.fObj;
  if (v4)
    dispatch_release(v4);
  objc_storeStrong((id *)&self->_connection, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 3) = 0;
  return self;
}

void __37__CTCarrierSpaceClient__connect_sync__block_invoke_60_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_209C80000, a2, a3, "Failed to ping connection after interruption: %@", a5, a6, a7, a8, 2u);
}

void __47__CTCarrierSpaceClient__proxyWithErrorHandler___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_209C80000, a2, a3, "Failed to create remote object proxy: %@", a5, a6, a7, a8, 2u);
}

@end
