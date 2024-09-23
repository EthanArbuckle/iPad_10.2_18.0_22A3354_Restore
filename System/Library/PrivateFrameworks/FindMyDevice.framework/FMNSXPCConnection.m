@implementation FMNSXPCConnection

- (int64_t)state
{
  void *v3;
  int64_t v4;

  -[FMNSXPCConnection connection](self, "connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = 1;
  }
  else if (-[FMNSXPCConnection _testMockConnection](self, "_testMockConnection"))
  {
    v4 = 1;
  }
  else
  {
    v4 = 2;
  }

  return v4;
}

- (void)addFailureBlock:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  -[FMNSXPCConnection future](self, "future");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __37__FMNSXPCConnection_addFailureBlock___block_invoke;
  v8[3] = &unk_1E829C330;
  v9 = v4;
  v6 = v4;
  v7 = (id)objc_msgSend(v5, "addFailureBlock:", v8);

}

- (FMFuture)future
{
  return self->_future;
}

- (id)remoteObjectProxy
{
  void *v3;
  void *v4;
  _QWORD v6[4];
  id v7;
  id location;

  objc_initWeak(&location, self);
  -[FMNSXPCConnection connection](self, "connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __38__FMNSXPCConnection_remoteObjectProxy__block_invoke;
  v6[3] = &unk_1E829D460;
  objc_copyWeak(&v7, &location);
  objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
  return v4;
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (FMNSXPCConnection)initWithConfiguration:(id)a3 exportedObject:(id)a4
{
  id v6;
  id v7;
  FMNSXPCConnection *v8;
  FMNSXPCConnection *v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  id v22;
  _QWORD v24[4];
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  _QWORD v30[4];
  id v31;
  id location;
  objc_super v33;

  v6 = a3;
  v7 = a4;
  v33.receiver = self;
  v33.super_class = (Class)FMNSXPCConnection;
  v8 = -[FMNSXPCConnection init](&v33, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->__testMockConnection = 0;
    v10 = objc_alloc_init(MEMORY[0x1E0D201F8]);
    objc_initWeak(&location, v9);
    v11 = MEMORY[0x1E0C809B0];
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __58__FMNSXPCConnection_initWithConfiguration_exportedObject___block_invoke;
    v30[3] = &unk_1E829D460;
    objc_copyWeak(&v31, &location);
    v12 = (id)objc_msgSend(v10, "addFailureBlock:", v30);
    -[FMNSXPCConnection setFuture:](v9, "setFuture:", v10);
    if (objc_msgSend(v6, "machService"))
    {
      v13 = objc_alloc(MEMORY[0x1E0CB3B38]);
      objc_msgSend(v6, "serviceName");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v13, "initWithMachServiceName:options:", v14, objc_msgSend(v6, "options"));
    }
    else
    {
      v16 = objc_alloc(MEMORY[0x1E0CB3B38]);
      objc_msgSend(v6, "serviceName");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v16, "initWithServiceName:", v14);
    }
    v17 = (void *)v15;

    objc_msgSend(v6, "remoteInterface");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setRemoteObjectInterface:", v18);

    objc_msgSend(v6, "exportedInterface");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      objc_msgSend(v6, "exportedInterface");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setExportedInterface:", v20);

      if (v7)
      {
        objc_msgSend(v17, "setExportedObject:", v7);
      }
      else
      {
        LogCategory_Unspecified();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          -[FMNSXPCConnection initWithConfiguration:exportedObject:].cold.1(v21);

      }
    }
    v27[0] = v11;
    v27[1] = 3221225472;
    v27[2] = __58__FMNSXPCConnection_initWithConfiguration_exportedObject___block_invoke_3;
    v27[3] = &unk_1E829D488;
    v22 = v6;
    v28 = v22;
    objc_copyWeak(&v29, &location);
    objc_msgSend(v17, "setInterruptionHandler:", v27);
    v24[0] = v11;
    v24[1] = 3221225472;
    v24[2] = __58__FMNSXPCConnection_initWithConfiguration_exportedObject___block_invoke_6;
    v24[3] = &unk_1E829D488;
    v25 = v22;
    objc_copyWeak(&v26, &location);
    objc_msgSend(v17, "setInvalidationHandler:", v24);
    objc_msgSend(v17, "resume");
    -[FMNSXPCConnection setConnection:](v9, "setConnection:", v17);
    objc_destroyWeak(&v26);

    objc_destroyWeak(&v29);
    objc_destroyWeak(&v31);
    objc_destroyWeak(&location);

  }
  return v9;
}

- (void)setFuture:(id)a3
{
  objc_storeStrong((id *)&self->_future, a3);
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (FMNSXPCConnection)initWithConfiguration:(id)a3
{
  return -[FMNSXPCConnection initWithConfiguration:exportedObject:](self, "initWithConfiguration:exportedObject:", a3, 0);
}

void __58__FMNSXPCConnection_initWithConfiguration_exportedObject___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "destroyXPCConnection");

}

void __58__FMNSXPCConnection_initWithConfiguration_exportedObject___block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  id WeakRetained;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  LogCategory_Unspecified();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "serviceName");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v3;
    _os_log_impl(&dword_1C9939000, v2, OS_LOG_TYPE_DEFAULT, "FMNSXPCConnection Connection interrupted %@", (uint8_t *)&v7, 0xCu);

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("FMNSXPCConnectionErrorDomain"), 1, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "future");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "finishWithError:", v5);

}

void __58__FMNSXPCConnection_initWithConfiguration_exportedObject___block_invoke_6(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  id WeakRetained;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  LogCategory_Unspecified();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "serviceName");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v3;
    _os_log_impl(&dword_1C9939000, v2, OS_LOG_TYPE_DEFAULT, "FMNSXPCConnection Connection invalidated %@", (uint8_t *)&v7, 0xCu);

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("FMNSXPCConnectionErrorDomain"), 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "future");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "finishWithError:", v5);

}

- (void)dealloc
{
  objc_super v3;

  -[FMNSXPCConnection destroyXPCConnection](self, "destroyXPCConnection");
  v3.receiver = self;
  v3.super_class = (Class)FMNSXPCConnection;
  -[FMNSXPCConnection dealloc](&v3, sel_dealloc);
}

void __38__FMNSXPCConnection_remoteObjectProxy__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  LogCategory_Unspecified();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    __38__FMNSXPCConnection_remoteObjectProxy__block_invoke_cold_1((uint64_t)v3, v5);

  if (objc_msgSend(v3, "code") == 4099)
    v6 = 3;
  else
    v6 = 2;
  v7 = (void *)MEMORY[0x1E0CB35C8];
  v11 = *MEMORY[0x1E0CB3388];
  v12[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "errorWithDomain:code:userInfo:", CFSTR("FMNSXPCConnectionErrorDomain"), v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "future");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "finishWithError:", v9);

}

uint64_t __37__FMNSXPCConnection_addFailureBlock___block_invoke(uint64_t result, void *a2)
{
  uint64_t v2;
  id v3;
  void *v4;

  if (*(_QWORD *)(result + 32))
  {
    v2 = result;
    v3 = a2;
    objc_msgSend(v3, "code");
    objc_msgSend(v3, "domain");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "isEqualToString:", CFSTR("FMNSXPCConnectionErrorDomain"));
    return (*(uint64_t (**)(void))(*(_QWORD *)(v2 + 32) + 16))();
  }
  return result;
}

- (void)destroyXPCConnection
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_1C9939000, a2, OS_LOG_TYPE_DEBUG, "Invalidating the xpc connection %@", (uint8_t *)&v2, 0xCu);
}

- (BOOL)_testMockConnection
{
  return self->__testMockConnection;
}

- (void)set_testMockConnection:(BOOL)a3
{
  self->__testMockConnection = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_future, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

- (void)initWithConfiguration:(os_log_t)log exportedObject:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1C9939000, log, OS_LOG_TYPE_ERROR, "Creating xpc connection with exportedInterface but no exportedObject", v1, 2u);
}

void __38__FMNSXPCConnection_remoteObjectProxy__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1C9939000, a2, OS_LOG_TYPE_ERROR, "FMNSXPCConnection could not create remote object proxy %@", (uint8_t *)&v2, 0xCu);
}

@end
