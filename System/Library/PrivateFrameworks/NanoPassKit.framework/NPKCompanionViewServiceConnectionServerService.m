@implementation NPKCompanionViewServiceConnectionServerService

- (NPKCompanionViewServiceConnectionServerService)init
{
  NPKCompanionViewServiceConnectionServerService *v2;
  NSMutableSet *v3;
  NSMutableSet *connectionServers;
  NSXPCListener *v5;
  NSXPCListener *xpcListener;
  NSXPCListener *v7;
  NSObject *v8;
  NSObject *v9;
  objc_super v11;
  uint8_t buf[4];
  NPKCompanionViewServiceConnectionServerService *v13;
  __int16 v14;
  const __CFString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v11.receiver = self;
  v11.super_class = (Class)NPKCompanionViewServiceConnectionServerService;
  v2 = -[NPKCompanionViewServiceConnectionServerService init](&v11, sel_init);
  if (v2)
  {
    v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    connectionServers = v2->_connectionServers;
    v2->_connectionServers = v3;

    v5 = (NSXPCListener *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1998]), "initWithMachServiceName:", CFSTR("com.apple.NanoPassbook.NPKCompanionViewService.connection.server"));
    -[NSXPCListener setDelegate:](v5, "setDelegate:", v2);
    xpcListener = v2->_xpcListener;
    v2->_xpcListener = v5;
    v7 = v5;

    -[NSXPCListener resume](v7, "resume");
    pk_Payment_log();
    v8 = objc_claimAutoreleasedReturnValue();
    LODWORD(xpcListener) = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

    if ((_DWORD)xpcListener)
    {
      pk_Payment_log();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v13 = v2;
        v14 = 2112;
        v15 = CFSTR("com.apple.NanoPassbook.NPKCompanionViewService.connection.server");
        _os_log_impl(&dword_213518000, v9, OS_LOG_TYPE_DEFAULT, "Notice: NPKCompanionViewService: New view service connection listener created:%@ with serviceName:%@", buf, 0x16u);
      }

    }
  }
  return v2;
}

- (void)dealloc
{
  NSMutableSet *connectionServers;
  objc_super v4;

  -[NSMutableSet enumerateObjectsUsingBlock:](self->_connectionServers, "enumerateObjectsUsingBlock:", &__block_literal_global_28);
  connectionServers = self->_connectionServers;
  self->_connectionServers = 0;

  v4.receiver = self;
  v4.super_class = (Class)NPKCompanionViewServiceConnectionServerService;
  -[NPKCompanionViewServiceConnectionServerService dealloc](&v4, sel_dealloc);
}

void __57__NPKCompanionViewServiceConnectionServerService_dealloc__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v3 = a2;
  objc_msgSend(v3, "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidate");

  objc_msgSend(v3, "clearConnectionReference");
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  NSXPCListener *v6;
  NSXPCListener *v7;
  NSXPCListener *xpcListener;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  _BOOL4 v12;
  NSObject *v13;
  NSObject *v15;
  _BOOL4 v16;
  NSObject *v17;
  int v18;
  NSXPCListener *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = (NSXPCListener *)a3;
  v7 = (NSXPCListener *)a4;
  xpcListener = self->_xpcListener;
  pk_Payment_log();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (xpcListener == v6)
  {
    v12 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

    if (v12)
    {
      pk_Payment_log();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v18 = 138412290;
        v19 = v7;
        _os_log_impl(&dword_213518000, v13, OS_LOG_TYPE_DEFAULT, "Notice: NPKCompanionViewService: Requested new connection:%@", (uint8_t *)&v18, 0xCu);
      }

    }
    -[NSXPCListener valueForEntitlement:](v7, "valueForEntitlement:", CFSTR("com.apple.NanoPassbook.NPKCompanionViewService.client"));
    v11 = objc_claimAutoreleasedReturnValue();
    if (!v11
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
      || (-[NSObject BOOLValue](v11, "BOOLValue") & 1) != 0)
    {
      -[NPKCompanionViewServiceConnectionServerService _addConnection:](self, "_addConnection:", v7);
      LOBYTE(self) = 1;
      goto LABEL_14;
    }
    pk_Payment_log();
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);

    if (v16)
    {
      pk_Payment_log();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v18) = 0;
        _os_log_impl(&dword_213518000, v17, OS_LOG_TYPE_ERROR, "Error: NPKCompanionViewService: Client doesn't have required entitlement to establish the connection", (uint8_t *)&v18, 2u);
      }

    }
LABEL_5:
    LOBYTE(self) = 0;
LABEL_14:

    goto LABEL_15;
  }
  LODWORD(self) = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);

  if ((_DWORD)self)
  {
    pk_Payment_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v18 = 138412290;
      v19 = v6;
      _os_log_impl(&dword_213518000, v11, OS_LOG_TYPE_ERROR, "Error: NPKCompanionViewService: Unknown requested connection from listener:%@", (uint8_t *)&v18, 0xCu);
    }
    goto LABEL_5;
  }
LABEL_15:

  return (char)self;
}

- (void)handleCompanionValueEntryRequestFinishedWithCurrencyAmount:(id)a3 forRequestIdentifier:(id)a4
{
  id v6;
  id v7;
  NSMutableSet *connectionServers;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  connectionServers = self->_connectionServers;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __130__NPKCompanionViewServiceConnectionServerService_handleCompanionValueEntryRequestFinishedWithCurrencyAmount_forRequestIdentifier___block_invoke;
  v11[3] = &unk_24CFECE80;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  -[NSMutableSet enumerateObjectsUsingBlock:](connectionServers, "enumerateObjectsUsingBlock:", v11);

}

void __130__NPKCompanionViewServiceConnectionServerService_handleCompanionValueEntryRequestFinishedWithCurrencyAmount_forRequestIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "remoteObjectProxy");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "handleCompanionValueEntryFinishedWithCurrencyAmount:forRequestIdentifier:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)handleCompanionValueEntryRequestDidCancelForRequestIdentifier:(id)a3
{
  id v4;
  NSMutableSet *connectionServers;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  connectionServers = self->_connectionServers;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __112__NPKCompanionViewServiceConnectionServerService_handleCompanionValueEntryRequestDidCancelForRequestIdentifier___block_invoke;
  v7[3] = &unk_24CFECEA8;
  v8 = v4;
  v6 = v4;
  -[NSMutableSet enumerateObjectsUsingBlock:](connectionServers, "enumerateObjectsUsingBlock:", v7);

}

void __112__NPKCompanionViewServiceConnectionServerService_handleCompanionValueEntryRequestDidCancelForRequestIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "remoteObjectProxy");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "handleCompanionValueEntryCancelledForRequestIdentifier:", *(_QWORD *)(a1 + 32));

}

- (void)handleCompanionItemSelectionRequestFinishedWithRenewalAmount:(id)a3 serviceProviderData:(id)a4 forRequestIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSMutableSet *connectionServers;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  connectionServers = self->_connectionServers;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __152__NPKCompanionViewServiceConnectionServerService_handleCompanionItemSelectionRequestFinishedWithRenewalAmount_serviceProviderData_forRequestIdentifier___block_invoke;
  v15[3] = &unk_24CFECED0;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  -[NSMutableSet enumerateObjectsUsingBlock:](connectionServers, "enumerateObjectsUsingBlock:", v15);

}

void __152__NPKCompanionViewServiceConnectionServerService_handleCompanionItemSelectionRequestFinishedWithRenewalAmount_serviceProviderData_forRequestIdentifier___block_invoke(_QWORD *a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "remoteObjectProxy");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "handleCompanionItemSelectionRequestFinishedWithRenewalAmount:serviceProviderData:forRequestIdentifier:", a1[4], a1[5], a1[6]);

}

- (void)handleCompanionItemSelectionRequestDidCancelForRequestIdentifier:(id)a3
{
  id v4;
  NSMutableSet *connectionServers;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  connectionServers = self->_connectionServers;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __115__NPKCompanionViewServiceConnectionServerService_handleCompanionItemSelectionRequestDidCancelForRequestIdentifier___block_invoke;
  v7[3] = &unk_24CFECEA8;
  v8 = v4;
  v6 = v4;
  -[NSMutableSet enumerateObjectsUsingBlock:](connectionServers, "enumerateObjectsUsingBlock:", v7);

}

void __115__NPKCompanionViewServiceConnectionServerService_handleCompanionItemSelectionRequestDidCancelForRequestIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "remoteObjectProxy");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "handleCompanionItemSelectionRequestCancelledForRequestIdentifier:", *(_QWORD *)(a1 + 32));

}

- (void)_addConnection:(id)a3
{
  id v4;
  NPKCompanionViewServiceConnectionServer *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NPKCompanionViewServiceConnectionServer *v9;
  NPKCompanionViewServiceConnectionServer *v10;
  NSObject *v11;
  _BOOL4 v12;
  NSObject *v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  NPKCompanionViewServiceConnectionServer *v19;
  id v20;
  id v21;
  _QWORD v22[4];
  NPKCompanionViewServiceConnectionServer *v23;
  id v24;
  id v25;
  id from;
  id location;
  uint8_t buf[4];
  id v29;
  __int16 v30;
  int v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = -[PDXPCService initWithConnection:]([NPKCompanionViewServiceConnectionServer alloc], "initWithConnection:", v4);
  -[NPKCompanionViewServiceConnectionServer setDelegate:](v5, "setDelegate:", self);
  NPKCompanionViewServiceConnectionServerProtocolInterface();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setExportedInterface:", v6);

  objc_msgSend(v4, "setExportedObject:", v5);
  NPKCompanionViewServiceConnectionClientProtocolInterface();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRemoteObjectInterface:", v7);

  objc_initWeak(&location, self);
  objc_initWeak(&from, v4);
  v8 = MEMORY[0x24BDAC760];
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __65__NPKCompanionViewServiceConnectionServerService__addConnection___block_invoke;
  v22[3] = &unk_24CFE8380;
  objc_copyWeak(&v24, &from);
  objc_copyWeak(&v25, &location);
  v9 = v5;
  v23 = v9;
  objc_msgSend(v4, "setInvalidationHandler:", v22);
  v15 = v8;
  v16 = 3221225472;
  v17 = __65__NPKCompanionViewServiceConnectionServerService__addConnection___block_invoke_7;
  v18 = &unk_24CFE8380;
  objc_copyWeak(&v20, &from);
  objc_copyWeak(&v21, &location);
  v10 = v9;
  v19 = v10;
  objc_msgSend(v4, "setInterruptionHandler:", &v15);
  -[NPKCompanionViewServiceConnectionServerService _addServer:](self, "_addServer:", v10, v15, v16, v17, v18);
  objc_msgSend(v4, "resume");
  pk_Payment_log();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);

  if (v12)
  {
    pk_Payment_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = objc_msgSend(v4, "processIdentifier");
      *(_DWORD *)buf = 138412546;
      v29 = v4;
      v30 = 1024;
      v31 = v14;
      _os_log_impl(&dword_213518000, v13, OS_LOG_TYPE_DEFAULT, "Notice: NPKCompanionViewService: Added new connection:{%@, PID:%d}", buf, 0x12u);
    }

  }
  objc_destroyWeak(&v21);
  objc_destroyWeak(&v20);

  objc_destroyWeak(&v25);
  objc_destroyWeak(&v24);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

}

void __65__NPKCompanionViewServiceConnectionServerService__addConnection___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  int v7;
  id v8;
  __int16 v9;
  id v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(v3, "_removeServer:", *(_QWORD *)(a1 + 32));
  pk_Payment_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    pk_Payment_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138412802;
      v8 = v3;
      v9 = 2112;
      v10 = WeakRetained;
      v11 = 1024;
      v12 = objc_msgSend(WeakRetained, "processIdentifier");
      _os_log_impl(&dword_213518000, v6, OS_LOG_TYPE_DEFAULT, "Notice: NPKCompanionViewService: %@ Connection invalidated:{%@, PID:%d}", (uint8_t *)&v7, 0x1Cu);
    }

  }
}

void __65__NPKCompanionViewServiceConnectionServerService__addConnection___block_invoke_7(uint64_t a1)
{
  id WeakRetained;
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  int v7;
  id v8;
  __int16 v9;
  id v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(v3, "_removeServer:", *(_QWORD *)(a1 + 32));
  pk_Payment_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    pk_Payment_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138412802;
      v8 = v3;
      v9 = 2112;
      v10 = WeakRetained;
      v11 = 1024;
      v12 = objc_msgSend(WeakRetained, "processIdentifier");
      _os_log_impl(&dword_213518000, v6, OS_LOG_TYPE_DEFAULT, "Notice: NPKCompanionViewService: %@ Connection interrupted:{%@, PID:%d}", (uint8_t *)&v7, 0x1Cu);
    }

  }
}

- (void)_addServer:(id)a3
{
  -[NSMutableSet addObject:](self->_connectionServers, "addObject:", a3);
}

- (void)_removeServer:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidate");

  objc_msgSend(v5, "clearConnectionReference");
  -[NSMutableSet removeObject:](self->_connectionServers, "removeObject:", v5);

}

- (void)viewServiceConnectionServer:(id)a3 didRequestPresentRemotePassValueEntryViewControllerForRequest:(id)a4 contact:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  -[NPKCompanionViewServiceConnectionServerService delegate](self, "delegate");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "viewServiceConnectionServerService:didRequestPresentRemotePassValueEntryViewControllerForRequest:contact:completion:", self, v11, v10, v9);

}

- (void)viewServiceConnectionServer:(id)a3 didRequestPresentRemotePassItemSelectionViewControllerForRequest:(id)a4 contact:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  -[NPKCompanionViewServiceConnectionServerService delegate](self, "delegate");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "viewServiceConnectionServerService:didRequestPresentRemotePassItemSelectionViewControllerForRequest:contact:completion:", self, v11, v10, v9);

}

- (NPKCompanionViewServiceConnectionServerServiceDelegate)delegate
{
  return (NPKCompanionViewServiceConnectionServerServiceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_connectionServers, 0);
  objc_storeStrong((id *)&self->_xpcListener, 0);
}

@end
