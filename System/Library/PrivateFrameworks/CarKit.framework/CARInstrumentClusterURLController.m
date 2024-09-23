@implementation CARInstrumentClusterURLController

- (CARInstrumentClusterURLController)init
{
  CARInstrumentClusterURLController *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *SerialWithQoS;
  uint64_t v8;
  BSServiceConnection *connection;
  BSServiceConnection *v10;
  id v11;
  NSObject *v12;
  BSServiceConnection *v13;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *);
  void *v18;
  CARInstrumentClusterURLController *v19;
  id v20;
  objc_super v21;
  uint8_t buf[4];
  BSServiceConnection *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v21.receiver = self;
  v21.super_class = (Class)CARInstrumentClusterURLController;
  v2 = -[CARInstrumentClusterURLController init](&v21, sel_init);
  if (v2)
  {
    v3 = (void *)MEMORY[0x1E0D03458];
    +[CARAppHistoryServiceSpecification identifier](CARAppHistoryServiceSpecification, "identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "endpointForMachName:service:instance:", CFSTR("com.apple.CarPlayApp.service"), v4, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    +[CARAppHistoryServiceSpecification serviceQuality](CARAppHistoryServiceSpecification, "serviceQuality");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "serviceClass");
    SerialWithQoS = (void *)BSDispatchQueueCreateSerialWithQoS();

    objc_storeStrong((id *)&v2->_callbackQueue, SerialWithQoS);
    objc_msgSend(MEMORY[0x1E0D03448], "connectionWithEndpoint:", v5);
    v8 = objc_claimAutoreleasedReturnValue();
    connection = v2->_connection;
    v2->_connection = (BSServiceConnection *)v8;

    v10 = v2->_connection;
    v15 = MEMORY[0x1E0C809B0];
    v16 = 3221225472;
    v17 = __41__CARInstrumentClusterURLController_init__block_invoke;
    v18 = &unk_1E5429790;
    v19 = v2;
    v11 = SerialWithQoS;
    v20 = v11;
    -[BSServiceConnection configureConnection:](v10, "configureConnection:", &v15);
    CarGeneralLogging();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = v2->_connection;
      *(_DWORD *)buf = 138412290;
      v23 = v13;
      _os_log_impl(&dword_1A83A2000, v12, OS_LOG_TYPE_DEFAULT, "Activating connection! %@", buf, 0xCu);
    }

    -[BSServiceConnection activate](v2->_connection, "activate", v15, v16, v17, v18);
  }
  return v2;
}

void __41__CARInstrumentClusterURLController_init__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  +[CARAppHistoryServiceSpecification serviceQuality](CARAppHistoryServiceSpecification, "serviceQuality");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setServiceQuality:", v3);

  +[CARAppHistoryServiceSpecification interface](CARAppHistoryServiceSpecification, "interface");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setInterface:", v4);

  objc_msgSend(v5, "setInterfaceTarget:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v5, "setActivationHandler:", &__block_literal_global_27);
  objc_msgSend(v5, "setInterruptionHandler:", &__block_literal_global_49);
  objc_msgSend(v5, "setInvalidationHandler:", &__block_literal_global_51_0);
  objc_msgSend(v5, "setTargetQueue:", *(_QWORD *)(a1 + 40));

}

void __41__CARInstrumentClusterURLController_init__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  CarGeneralLogging();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_impl(&dword_1A83A2000, v3, OS_LOG_TYPE_DEFAULT, "Connection activated! %@", (uint8_t *)&v4, 0xCu);
  }

}

void __41__CARInstrumentClusterURLController_init__block_invoke_48(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  CarGeneralLogging();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_impl(&dword_1A83A2000, v3, OS_LOG_TYPE_DEFAULT, "[CRSAppHistoryController] connection interrupted! Reactivating... %@", (uint8_t *)&v4, 0xCu);
  }

  objc_msgSend(v2, "activate");
}

void __41__CARInstrumentClusterURLController_init__block_invoke_50(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  CarGeneralLogging();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_impl(&dword_1A83A2000, v3, OS_LOG_TYPE_DEFAULT, "Connection invalidated! %@", (uint8_t *)&v4, 0xCu);
  }

}

- (void)fetchInstrumentClusterURLs:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD v25[4];
  id v26;
  uint8_t buf[16];

  v4 = a3;
  CarGeneralLogging();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A83A2000, v5, OS_LOG_TYPE_DEFAULT, "Received request for cluster urls.", buf, 2u);
  }

  if (v4)
  {
    -[CARInstrumentClusterURLController connection](self, "connection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[CARInstrumentClusterURLController connection](self, "connection");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "remoteTarget");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __64__CARInstrumentClusterURLController_fetchInstrumentClusterURLs___block_invoke;
      v25[3] = &unk_1E5428030;
      v26 = v4;
      objc_msgSend(v8, "serviceFetchInstrumentClusterURLs:", v25);

    }
    else
    {
      CarGeneralLogging();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        -[CARInstrumentClusterURLController fetchInstrumentClusterURLs:].cold.2(v17, v18, v19, v20, v21, v22, v23, v24);

      (*((void (**)(id, _QWORD, _QWORD))v4 + 2))(v4, MEMORY[0x1E0C9AA60], 0);
    }
  }
  else
  {
    CarGeneralLogging();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[CARInstrumentClusterURLController fetchInstrumentClusterURLs:].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);

  }
}

void __64__CARInstrumentClusterURLController_fetchInstrumentClusterURLs___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  id v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  CarGeneralLogging();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412546;
    v10 = v5;
    v11 = 2112;
    v12 = v6;
    _os_log_impl(&dword_1A83A2000, v7, OS_LOG_TYPE_DEFAULT, "received urls: %@ error: %@", (uint8_t *)&v9, 0x16u);
  }

  objc_msgSend(v5, "bs_compactMap:", &__block_literal_global_55);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

id __64__CARInstrumentClusterURLController_fetchInstrumentClusterURLs___block_invoke_53(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  NSObject *v4;

  v2 = a2;
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    CarGeneralLogging();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __64__CARInstrumentClusterURLController_fetchInstrumentClusterURLs___block_invoke_53_cold_1((uint64_t)v2, v4);

  }
  return v3;
}

- (void)invalidate
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  CarGeneralLogging();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1A83A2000, v3, OS_LOG_TYPE_DEFAULT, "[CARInstrumentClusterURLController] invalidating connection.", v5, 2u);
  }

  -[CARInstrumentClusterURLController connection](self, "connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidate");

}

- (BSServiceConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (OS_dispatch_queue)callbackQueue
{
  return self->_callbackQueue;
}

- (void)setCallbackQueue:(id)a3
{
  objc_storeStrong((id *)&self->_callbackQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

- (void)fetchInstrumentClusterURLs:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_0(&dword_1A83A2000, a1, a3, "No completion handler provided to return URLs.", a5, a6, a7, a8, 0);
}

- (void)fetchInstrumentClusterURLs:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_0(&dword_1A83A2000, a1, a3, "No service connection available to fetch URLs.", a5, a6, a7, a8, 0);
}

void __64__CARInstrumentClusterURLController_fetchInstrumentClusterURLs___block_invoke_53_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_1A83A2000, a2, OS_LOG_TYPE_ERROR, "Error creating URL from string: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end
