@implementation CXVoicemailControllerHostConnection

- (CXVoicemailControllerHostConnection)init
{

  return 0;
}

- (CXVoicemailControllerHostConnection)initWithConnection:(id)a3 serialQueue:(id)a4
{
  id v7;
  id v8;
  CXVoicemailControllerHostConnection *v9;
  CXVoicemailControllerHostConnection *v10;
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
  NSObject *v22;
  CXVoicemailControllerHostConnection *v24;
  NSString *v25;
  NSURL *v26;
  NSSet *v27;
  CXVoicemailControllerHostConnection *v28;
  _QWORD v29[4];
  id v30;
  _QWORD v31[4];
  id v32;
  id location;
  objc_super v34;
  uint8_t buf[4];
  CXVoicemailControllerHostConnection *v36;
  __int16 v37;
  NSString *v38;
  __int16 v39;
  NSURL *v40;
  __int16 v41;
  NSSet *v42;
  __int16 v43;
  id v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v34.receiver = self;
  v34.super_class = (Class)CXVoicemailControllerHostConnection;
  v9 = -[CXVoicemailControllerHostConnection init](&v34, sel_init);
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

    if (v10->_applicationIdentifier
      && -[CXVoicemailControllerHostConnection isPermittedToUsePrivateAPI](v10, "isPermittedToUsePrivateAPI"))
    {
      objc_storeStrong((id *)&v10->_connection, a3);
      -[NSXPCConnection setExportedObject:](v10->_connection, "setExportedObject:", v10);
      objc_msgSend(MEMORY[0x1E0CB3B50], "cx_voicemailControllerHostInterface");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSXPCConnection setExportedInterface:](v10->_connection, "setExportedInterface:", v18);

      objc_msgSend(MEMORY[0x1E0CB3B50], "cx_voicemailControllerVendorInterface");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSXPCConnection setRemoteObjectInterface:](v10->_connection, "setRemoteObjectInterface:", v19);

      objc_initWeak(&location, v10);
      v20 = MEMORY[0x1E0C809B0];
      v31[0] = MEMORY[0x1E0C809B0];
      v31[1] = 3221225472;
      v31[2] = __70__CXVoicemailControllerHostConnection_initWithConnection_serialQueue___block_invoke;
      v31[3] = &unk_1E4B88CA8;
      objc_copyWeak(&v32, &location);
      -[NSXPCConnection setInterruptionHandler:](v10->_connection, "setInterruptionHandler:", v31);
      v29[0] = v20;
      v29[1] = 3221225472;
      v29[2] = __70__CXVoicemailControllerHostConnection_initWithConnection_serialQueue___block_invoke_3;
      v29[3] = &unk_1E4B88CA8;
      objc_copyWeak(&v30, &location);
      -[NSXPCConnection setInvalidationHandler:](v10->_connection, "setInvalidationHandler:", v29);
      -[NSXPCConnection resume](v10->_connection, "resume");
      CXDefaultLog();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v36 = v10;
        _os_log_impl(&dword_1A402D000, v21, OS_LOG_TYPE_DEFAULT, "Created %@", buf, 0xCu);
      }

      objc_destroyWeak(&v30);
      objc_destroyWeak(&v32);
      objc_destroyWeak(&location);
    }
    else
    {
      CXDefaultLog();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        v24 = (CXVoicemailControllerHostConnection *)objc_opt_class();
        v25 = v10->_applicationIdentifier;
        v26 = v10->_bundleURL;
        v27 = v10->_capabilities;
        *(_DWORD *)buf = 138413314;
        v36 = v24;
        v37 = 2112;
        v38 = v25;
        v39 = 2112;
        v40 = v26;
        v41 = 2112;
        v42 = v27;
        v43 = 2112;
        v44 = v7;
        v28 = v24;
        _os_log_error_impl(&dword_1A402D000, v22, OS_LOG_TYPE_ERROR, "Denying creation of %@ with applicationIdentifier: %@ bundleURL: %@ capabilities: %@ connection: %@", buf, 0x34u);

      }
      v10 = 0;
    }

  }
  return v10;
}

void __70__CXVoicemailControllerHostConnection_initWithConnection_serialQueue___block_invoke(uint64_t a1)
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
  block[2] = __70__CXVoicemailControllerHostConnection_initWithConnection_serialQueue___block_invoke_2;
  block[3] = &unk_1E4B88AE8;
  v5 = WeakRetained;
  v3 = WeakRetained;
  dispatch_async(v2, block);

}

uint64_t __70__CXVoicemailControllerHostConnection_initWithConnection_serialQueue___block_invoke_2(uint64_t a1)
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
    _os_log_impl(&dword_1A402D000, v2, OS_LOG_TYPE_DEFAULT, "Connection interrupted for voicemail controller host connection: %@", (uint8_t *)&v5, 0xCu);
  }

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "invalidate");
}

void __70__CXVoicemailControllerHostConnection_initWithConnection_serialQueue___block_invoke_3(uint64_t a1)
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
  block[2] = __70__CXVoicemailControllerHostConnection_initWithConnection_serialQueue___block_invoke_2_4;
  block[3] = &unk_1E4B88AE8;
  v5 = WeakRetained;
  v3 = WeakRetained;
  dispatch_async(v2, block);

}

void __70__CXVoicemailControllerHostConnection_initWithConnection_serialQueue___block_invoke_2_4(uint64_t a1)
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
    _os_log_impl(&dword_1A402D000, v2, OS_LOG_TYPE_DEFAULT, "Connection invalidated for voicemail controller host connection: %@", (uint8_t *)&v5, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "voicemailControllerHostConnectionInvalidated:", *(_QWORD *)(a1 + 32));

}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCConnection invalidate](self->_connection, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)CXVoicemailControllerHostConnection;
  -[CXVoicemailControllerHostConnection dealloc](&v3, sel_dealloc);
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[CXVoicemailControllerHostConnection applicationIdentifier](self, "applicationIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CXVoicemailControllerHostConnection bundleURL](self, "bundleURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CXVoicemailControllerHostConnection capabilities](self, "capabilities");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p applicationIdentifier=%@ bundleURL=%@ capabilities=%@"), v4, self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (BOOL)isPermittedToUsePrivateAPI
{
  void *v2;
  char v3;

  -[CXVoicemailControllerHostConnection capabilities](self, "capabilities");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "containsObject:", CFSTR("private-voicemail-controller-api"));

  return v3;
}

- (CXVoicemailControllerVendorProtocol)remoteObjectProxy
{
  void *v2;
  void *v3;

  -[CXVoicemailControllerHostConnection connection](self, "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remoteObjectProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CXVoicemailControllerVendorProtocol *)v3;
}

- (void)addOrUpdateVoicemails:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CXVoicemailControllerHostConnection remoteObjectProxy](self, "remoteObjectProxy");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addOrUpdateVoicemails:", v4);

}

- (void)removeVoicemails:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CXVoicemailControllerHostConnection remoteObjectProxy](self, "remoteObjectProxy");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeVoicemails:", v4);

}

- (void)requestVoicemails:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[CXVoicemailControllerHostConnection serialQueue](self, "serialQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __57__CXVoicemailControllerHostConnection_requestVoicemails___block_invoke;
  v7[3] = &unk_1E4B88B30;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __57__CXVoicemailControllerHostConnection_requestVoicemails___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "voicemailControllerHostConnection:requestVoicemails:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

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
  -[CXVoicemailControllerHostConnection serialQueue](self, "serialQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__CXVoicemailControllerHostConnection_requestTransaction_reply___block_invoke;
  block[3] = &unk_1E4B88B58;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __64__CXVoicemailControllerHostConnection_requestTransaction_reply___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "voicemailControllerHostConnection:requestTransaction:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (NSString)applicationIdentifier
{
  return self->_applicationIdentifier;
}

- (void)setApplicationIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSURL)bundleURL
{
  return self->_bundleURL;
}

- (void)setBundleURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (CXVoicemailControllerHostConnectionDelegate)delegate
{
  return (CXVoicemailControllerHostConnectionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
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

- (NSSet)capabilities
{
  return self->_capabilities;
}

- (void)setCapabilities:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
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
