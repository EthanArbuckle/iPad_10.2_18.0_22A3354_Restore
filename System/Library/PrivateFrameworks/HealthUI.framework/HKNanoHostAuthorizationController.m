@implementation HKNanoHostAuthorizationController

- (HKNanoHostAuthorizationController)init
{
  HKNanoHostAuthorizationController *v2;
  id v3;
  NSXPCConnection *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSXPCConnection *xpcConnection;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  id location;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)HKNanoHostAuthorizationController;
  v2 = -[HKNanoHostAuthorizationController init](&v16, sel_init);
  if (v2)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5280], OS_LOG_TYPE_DEBUG))
      -[HKNanoHostAuthorizationController init].cold.1();
    v3 = objc_alloc(MEMORY[0x1E0CB3B38]);
    v4 = (NSXPCConnection *)objc_msgSend(v3, "initWithMachServiceName:options:", *MEMORY[0x1E0CB5660], 4096);
    HKHealthPrivacyHostRemoteViewControllerInterface();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setExportedInterface:](v4, "setExportedInterface:", v5);

    -[NSXPCConnection setExportedObject:](v4, "setExportedObject:", v2);
    HKHealthPrivacyServiceRemoteAuthorizationViewControllerInterface();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v4, "setRemoteObjectInterface:", v6);

    objc_initWeak(&location, v2);
    v7 = MEMORY[0x1E0C809B0];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __41__HKNanoHostAuthorizationController_init__block_invoke;
    v13[3] = &unk_1E9C40600;
    objc_copyWeak(&v14, &location);
    -[NSXPCConnection setInterruptionHandler:](v4, "setInterruptionHandler:", v13);
    v11[0] = v7;
    v11[1] = 3221225472;
    v11[2] = __41__HKNanoHostAuthorizationController_init__block_invoke_2;
    v11[3] = &unk_1E9C40600;
    objc_copyWeak(&v12, &location);
    -[NSXPCConnection setInvalidationHandler:](v4, "setInvalidationHandler:", v11);
    HKCreateSerialDispatchQueue();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection _setQueue:](v4, "_setQueue:", v8);
    -[NSXPCConnection resume](v4, "resume");
    xpcConnection = v2->_xpcConnection;
    v2->_xpcConnection = v4;

    objc_destroyWeak(&v12);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __41__HKNanoHostAuthorizationController_init__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "connectionDidInterrupt");

}

void __41__HKNanoHostAuthorizationController_init__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "connectionDidInvalidate");

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

  OUTLINED_FUNCTION_3_7();
  OUTLINED_FUNCTION_0_10(&dword_1D7813000, v0, v1, "HKNanoHostAuthorizationController: Client invalidated, invalidating XPC connection", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8_0();
}

- (void)connectionDidInvalidate
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_7();
  OUTLINED_FUNCTION_0_10(&dword_1D7813000, v0, v1, "HKNanoHostAuthorizationController: XPC Connection invalidated", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8_0();
}

- (void)connectionDidInterrupt
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_7();
  OUTLINED_FUNCTION_0_10(&dword_1D7813000, v0, v1, "HKNanoHostAuthorizationController: XPC Connection interrupted", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8_0();
}

- (void)didFinishWithError:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _HKInitializeLogging();
  v5 = *MEMORY[0x1E0CB5280];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5280], OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138543362;
    v8 = v4;
    _os_log_impl(&dword_1D7813000, v5, OS_LOG_TYPE_DEFAULT, "HKNanoHostAuthorizationController: Finished with error: %{public}@", (uint8_t *)&v7, 0xCu);
  }
  -[HKNanoHostAuthorizationController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "healthPrivacyHostAuthorizationControllerDidFinishWithError:", v4);

}

- (void)setRequestRecord:(id)a3 presentationRequests:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __75__HKNanoHostAuthorizationController_setRequestRecord_presentationRequests___block_invoke;
  v10[3] = &unk_1E9C43940;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[HKNanoHostAuthorizationController _remoteObjectProxyWithCompletion:errorHandler:](self, "_remoteObjectProxyWithCompletion:errorHandler:", v10, &__block_literal_global_57);

}

void __75__HKNanoHostAuthorizationController_setRequestRecord_presentationRequests___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _HKInitializeLogging();
  v4 = *MEMORY[0x1E0CB5280];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5280], OS_LOG_TYPE_DEBUG))
    __75__HKNanoHostAuthorizationController_setRequestRecord_presentationRequests___block_invoke_cold_1(a1, v4);
  objc_msgSend(v3, "setRequestRecord:presentationRequests:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __75__HKNanoHostAuthorizationController_setRequestRecord_presentationRequests___block_invoke_187(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = a2;
  _HKInitializeLogging();
  v3 = *MEMORY[0x1E0CB5280];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5280], OS_LOG_TYPE_ERROR))
    __75__HKNanoHostAuthorizationController_setRequestRecord_presentationRequests___block_invoke_187_cold_1((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);

}

- (void)show
{
  -[HKNanoHostAuthorizationController _remoteObjectProxyWithCompletion:errorHandler:](self, "_remoteObjectProxyWithCompletion:errorHandler:", &__block_literal_global_189_0, &__block_literal_global_190);
}

uint64_t __41__HKNanoHostAuthorizationController_show__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "show");
}

void __41__HKNanoHostAuthorizationController_show__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = a2;
  _HKInitializeLogging();
  v3 = *MEMORY[0x1E0CB5280];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5280], OS_LOG_TYPE_ERROR))
    __41__HKNanoHostAuthorizationController_show__block_invoke_2_cold_1((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);

}

- (void)_remoteObjectProxyWithCompletion:(id)a3 errorHandler:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void (**v11)(id, void *);

  v11 = (void (**)(id, void *))a3;
  v7 = a4;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKNanoHostAuthorizationController.m"), 100, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

    if (v7)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKNanoHostAuthorizationController.m"), 101, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("errorHandler"));

    goto LABEL_3;
  }
  if (!v7)
    goto LABEL_5;
LABEL_3:
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_xpcConnection, "remoteObjectProxyWithErrorHandler:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2](v11, v8);

}

- (HKHealthPrivacyHostAuthorizationControllerDelegate)delegate
{
  return (HKHealthPrivacyHostAuthorizationControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSXPCConnection)xpcConnection
{
  return self->_xpcConnection;
}

- (void)setXpcConnection:(id)a3
{
  objc_storeStrong((id *)&self->_xpcConnection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)init
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_7();
  OUTLINED_FUNCTION_0_10(&dword_1D7813000, v0, v1, "Initializing HKNanoHostAuthorizationController", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8_0();
}

void __75__HKNanoHostAuthorizationController_setRequestRecord_presentationRequests___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = 138412290;
  v4 = v2;
  _os_log_debug_impl(&dword_1D7813000, a2, OS_LOG_TYPE_DEBUG, "HKNanoHostAuthorizationController: Set record: %@", (uint8_t *)&v3, 0xCu);
  OUTLINED_FUNCTION_7_0();
}

void __75__HKNanoHostAuthorizationController_setRequestRecord_presentationRequests___block_invoke_187_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_1D7813000, a2, a3, "HKNanoHostAuthorizationController: Failed to set request record with error: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_7_0();
}

void __41__HKNanoHostAuthorizationController_show__block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_1D7813000, a2, a3, "HKNanoHostAuthorizationController: Failed to show remote authorization alert with error: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_7_0();
}

@end
