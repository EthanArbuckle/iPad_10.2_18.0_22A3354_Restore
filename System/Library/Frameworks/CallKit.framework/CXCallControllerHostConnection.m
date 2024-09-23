@implementation CXCallControllerHostConnection

- (CXCallControllerHostConnection)init
{

  return 0;
}

- (CXCallControllerHostConnection)initWithConnection:(id)a3 serialQueue:(id)a4
{
  id v7;
  id v8;
  CXCallControllerHostConnection *v9;
  CXCallControllerHostConnection *v10;
  uint64_t v11;
  NSString *applicationIdentifier;
  uint64_t v13;
  NSSet *capabilities;
  void *v15;
  uint64_t v16;
  NSURL *bundleURL;
  void *v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;
  id location;
  objc_super v28;
  uint8_t buf[4];
  CXCallControllerHostConnection *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v28.receiver = self;
  v28.super_class = (Class)CXCallControllerHostConnection;
  v9 = -[CXCallControllerHostConnection init](&v28, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_serialQueue, a4);
    objc_msgSend(v7, "cx_applicationIdentifier");
    v11 = objc_claimAutoreleasedReturnValue();
    applicationIdentifier = v10->_applicationIdentifier;
    v10->_applicationIdentifier = (NSString *)v11;

    objc_msgSend(v7, "cx_capabilities");
    v13 = objc_claimAutoreleasedReturnValue();
    capabilities = v10->_capabilities;
    v10->_capabilities = (NSSet *)v13;

    objc_msgSend(MEMORY[0x1E0CA5870], "cx_applicationRecordForConnection:", v7);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "URL");
    v16 = objc_claimAutoreleasedReturnValue();
    bundleURL = v10->_bundleURL;
    v10->_bundleURL = (NSURL *)v16;

    v10->_hasVoIPBackgroundMode = objc_msgSend(v15, "containsBackgroundModeOptions:", 1);
    v10->_hasPushToTalkBackgroundMode = objc_msgSend(v15, "containsBackgroundModeOptions:", 2);
    objc_storeStrong((id *)&v10->_connection, a3);
    -[NSXPCConnection setExportedObject:](v10->_connection, "setExportedObject:", v10);
    objc_msgSend(MEMORY[0x1E0CB3B50], "cx_callControllerHostInterface");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setExportedInterface:](v10->_connection, "setExportedInterface:", v18);

    objc_msgSend(MEMORY[0x1E0CB3B50], "cx_callControllerVendorInterface");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v10->_connection, "setRemoteObjectInterface:", v19);

    objc_initWeak(&location, v10);
    v20 = MEMORY[0x1E0C809B0];
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __65__CXCallControllerHostConnection_initWithConnection_serialQueue___block_invoke;
    v25[3] = &unk_1E4B88CA8;
    objc_copyWeak(&v26, &location);
    -[NSXPCConnection setInterruptionHandler:](v10->_connection, "setInterruptionHandler:", v25);
    v23[0] = v20;
    v23[1] = 3221225472;
    v23[2] = __65__CXCallControllerHostConnection_initWithConnection_serialQueue___block_invoke_3;
    v23[3] = &unk_1E4B88CA8;
    objc_copyWeak(&v24, &location);
    -[NSXPCConnection setInvalidationHandler:](v10->_connection, "setInvalidationHandler:", v23);
    -[NSXPCConnection resume](v10->_connection, "resume");
    CXDefaultLog();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v30 = v10;
      _os_log_impl(&dword_1A402D000, v21, OS_LOG_TYPE_DEFAULT, "Created %@", buf, 0xCu);
    }

    objc_destroyWeak(&v24);
    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);

  }
  return v10;
}

void __65__CXCallControllerHostConnection_initWithConnection_serialQueue___block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  id v3;
  _QWORD block[4];
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "serialQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__CXCallControllerHostConnection_initWithConnection_serialQueue___block_invoke_2;
  block[3] = &unk_1E4B88AE8;
  v5 = WeakRetained;
  v3 = WeakRetained;
  dispatch_async(v2, block);

}

uint64_t __65__CXCallControllerHostConnection_initWithConnection_serialQueue___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  CXDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_1A402D000, v2, OS_LOG_TYPE_DEFAULT, "Connection interrupted for call controller host connection: %@", (uint8_t *)&v5, 0xCu);
  }

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "invalidate");
}

void __65__CXCallControllerHostConnection_initWithConnection_serialQueue___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  id v3;
  _QWORD block[4];
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "serialQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__CXCallControllerHostConnection_initWithConnection_serialQueue___block_invoke_2_4;
  block[3] = &unk_1E4B88AE8;
  v5 = WeakRetained;
  v3 = WeakRetained;
  dispatch_async(v2, block);

}

void __65__CXCallControllerHostConnection_initWithConnection_serialQueue___block_invoke_2_4(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  CXDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_1A402D000, v2, OS_LOG_TYPE_DEFAULT, "Connection invalidated for call controller host connection: %@", (uint8_t *)&v5, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "callControllerHostConnectionInvalidated:", *(_QWORD *)(a1 + 32));

}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCConnection invalidate](self->_connection, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)CXCallControllerHostConnection;
  -[CXCallControllerHostConnection dealloc](&v3, sel_dealloc);
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  v5 = -[CXCallControllerHostConnection hasVoIPBackgroundMode](self, "hasVoIPBackgroundMode");
  -[CXCallControllerHostConnection applicationIdentifier](self, "applicationIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CXCallControllerHostConnection bundleURL](self, "bundleURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CXCallControllerHostConnection capabilities](self, "capabilities");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p hasVoIPBackgroundMode=%d applicationIdentifier=%@ bundleURL=%@ capabilities=%@"), v4, self, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (BOOL)isPermittedToUsePublicAPI
{
  return -[CXCallControllerHostConnection isPermittedToUsePrivateAPI](self, "isPermittedToUsePrivateAPI")
      || -[CXCallControllerHostConnection hasVoIPBackgroundMode](self, "hasVoIPBackgroundMode");
}

- (BOOL)isPermittedToUsePrivateAPI
{
  void *v2;
  char v3;

  -[CXCallControllerHostConnection capabilities](self, "capabilities");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "containsObject:", CFSTR("private-controller-api"));

  return v3;
}

- (BOOL)isChannelTransactionRequestPermitted
{
  return -[CXCallControllerHostConnection isPermittedToUsePrivateAPI](self, "isPermittedToUsePrivateAPI")
      || -[CXCallControllerHostConnection hasPushToTalkBackgroundMode](self, "hasPushToTalkBackgroundMode");
}

- (CXCallControllerVendorProtocol)remoteObjectProxy
{
  void *v2;
  void *v3;

  -[CXCallControllerHostConnection connection](self, "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remoteObjectProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CXCallControllerVendorProtocol *)v3;
}

- (void)addOrUpdateCall:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CXCallControllerHostConnection remoteObjectProxy](self, "remoteObjectProxy");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addOrUpdateCall:", v4);

}

- (void)removeCall:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CXCallControllerHostConnection remoteObjectProxy](self, "remoteObjectProxy");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeCall:", v4);

}

- (void)requestCalls:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[CXCallControllerHostConnection serialQueue](self, "serialQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __47__CXCallControllerHostConnection_requestCalls___block_invoke;
  v7[3] = &unk_1E4B88B30;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __47__CXCallControllerHostConnection_requestCalls___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "callControllerHostConnection:requestCalls:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)requestTransaction:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[CXCallControllerHostConnection serialQueue](self, "serialQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__CXCallControllerHostConnection_requestTransaction_reply___block_invoke;
  block[3] = &unk_1E4B88B58;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __59__CXCallControllerHostConnection_requestTransaction_reply___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "callControllerHostConnection:requestTransaction:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (NSString)applicationIdentifier
{
  return self->_applicationIdentifier;
}

- (void)setApplicationIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSURL)bundleURL
{
  return self->_bundleURL;
}

- (void)setBundleURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (CXCallControllerHostConnectionDelegate)delegate
{
  return (CXCallControllerHostConnectionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setSerialQueue:(id)a3
{
  objc_storeStrong((id *)&self->_serialQueue, a3);
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (BOOL)hasPushToTalkBackgroundMode
{
  return self->_hasPushToTalkBackgroundMode;
}

- (void)setHasPushToTalkBackgroundMode:(BOOL)a3
{
  self->_hasPushToTalkBackgroundMode = a3;
}

- (BOOL)hasVoIPBackgroundMode
{
  return self->_hasVoIPBackgroundMode;
}

- (void)setHasVoIPBackgroundMode:(BOOL)a3
{
  self->_hasVoIPBackgroundMode = a3;
}

- (NSSet)capabilities
{
  return self->_capabilities;
}

- (void)setCapabilities:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_capabilities, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_bundleURL, 0);
  objc_storeStrong((id *)&self->_applicationIdentifier, 0);
}

@end
