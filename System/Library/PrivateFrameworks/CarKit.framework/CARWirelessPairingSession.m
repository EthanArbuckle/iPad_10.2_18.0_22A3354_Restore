@implementation CARWirelessPairingSession

- (CARWirelessPairingSession)initWithVehicleAddress:(id)a3 supportedCapabilites:(unint64_t)a4 keyIdentifier:(id)a5
{
  id v9;
  id v10;
  CARWirelessPairingSession *v11;
  CARWirelessPairingSession *v12;
  NSObject *v13;
  NSObject *v14;
  dispatch_queue_t v15;
  OS_dispatch_queue *clientQueue;
  objc_super v18;

  v9 = a3;
  v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)CARWirelessPairingSession;
  v11 = -[CARWirelessPairingSession init](&v18, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_vehicleAddress, a3);
    v12->_supportedCapabilities = a4;
    objc_storeStrong((id *)&v12->_keyIdentifier, a5);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v13 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v13, QOS_CLASS_DEFAULT, 0);
    v14 = objc_claimAutoreleasedReturnValue();

    v15 = dispatch_queue_create("com.apple.carkit.wirelessPairingSession", v14);
    clientQueue = v12->_clientQueue;
    v12->_clientQueue = (OS_dispatch_queue *)v15;

    -[CARWirelessPairingSession _setupConnection](v12, "_setupConnection");
  }

  return v12;
}

- (void)dealloc
{
  objc_super v3;

  -[CARWirelessPairingSession invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)CARWirelessPairingSession;
  -[CARWirelessPairingSession dealloc](&v3, sel_dealloc);
}

- (void)requestPairing
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_2_0(&dword_1A83A2000, v0, v1, "vehicle does not support pairing for CarPlay, stopping pairing", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __43__CARWirelessPairingSession_requestPairing__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  _QWORD v6[4];
  id v7[2];

  v3 = a2;
  if (v3)
  {
    v4 = *(_QWORD *)(a1 + 48);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __43__CARWirelessPairingSession_requestPairing__block_invoke_16;
    v6[3] = &unk_1E54294A0;
    objc_copyWeak(v7, (id *)(a1 + 40));
    v7[1] = *(id *)(a1 + 48);
    objc_msgSend(v3, "requestPairingForIntent:completion:", v4, v6);
    objc_destroyWeak(v7);
  }
  else
  {
    CarPairingLogging();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __43__CARWirelessPairingSession_requestPairing__block_invoke_cold_1();

    objc_msgSend(*(id *)(a1 + 32), "_delegate_handleCompletedWithResult:", 5);
  }

}

void __43__CARWirelessPairingSession_requestPairing__block_invoke_16(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id WeakRetained;
  NSObject *v22;
  _BOOL4 v23;
  int v24;
  uint64_t v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  CarPairingLogging();
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
  if (a2 || !v15)
  {
    if (v23)
    {
      v24 = 134218242;
      v25 = a2;
      v26 = 2112;
      v27 = v20;
      _os_log_impl(&dword_1A83A2000, v22, OS_LOG_TYPE_DEFAULT, "cannot request pairing, result: %lu error: %@", (uint8_t *)&v24, 0x16u);
    }

    objc_msgSend(WeakRetained, "_delegate_handleCompletedWithResult:", a2);
  }
  else
  {
    if (v23)
    {
      LOWORD(v24) = 0;
      _os_log_impl(&dword_1A83A2000, v22, OS_LOG_TYPE_DEFAULT, "received pairing data", (uint8_t *)&v24, 2u);
    }

    objc_msgSend(WeakRetained, "_delegate_handleRequestedPairingWithDeviceAddress:forIntent:C192:R192:C256:R256:", v15, *(_QWORD *)(a1 + 40), v16, v17, v18, v19);
  }

}

- (void)setupVehicleDataC192:(id)a3 r192:(id)a4 c256:(id)a5 r256:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id buf[2];

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  CarPairingLogging();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_1A83A2000, v14, OS_LOG_TYPE_DEFAULT, "setting up vehicle pairing data", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __65__CARWirelessPairingSession_setupVehicleDataC192_r192_c256_r256___block_invoke;
  v19[3] = &unk_1E5429518;
  v19[4] = self;
  v15 = v10;
  v20 = v15;
  v16 = v11;
  v21 = v16;
  v17 = v12;
  v22 = v17;
  v18 = v13;
  v23 = v18;
  objc_copyWeak(&v24, buf);
  -[CARWirelessPairingSession _servicePerform:](self, "_servicePerform:", v19);
  objc_destroyWeak(&v24);

  objc_destroyWeak(buf);
}

void __65__CARWirelessPairingSession_setupVehicleDataC192_r192_c256_r256___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  _QWORD v9[4];
  id v10;

  v3 = a2;
  if (v3)
  {
    v4 = *(_QWORD *)(a1 + 40);
    v5 = *(_QWORD *)(a1 + 48);
    v6 = *(_QWORD *)(a1 + 56);
    v7 = *(_QWORD *)(a1 + 64);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __65__CARWirelessPairingSession_setupVehicleDataC192_r192_c256_r256___block_invoke_19;
    v9[3] = &unk_1E54294F0;
    objc_copyWeak(&v10, (id *)(a1 + 72));
    objc_msgSend(v3, "setupVehicleDataC192:r192:c256:r256:completion:", v4, v5, v6, v7, v9);
    objc_destroyWeak(&v10);
  }
  else
  {
    CarPairingLogging();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __65__CARWirelessPairingSession_setupVehicleDataC192_r192_c256_r256___block_invoke_cold_1();

    objc_msgSend(*(id *)(a1 + 32), "_delegate_handleCompletedWithResult:", 5);
  }

}

void __65__CARWirelessPairingSession_setupVehicleDataC192_r192_c256_r256___block_invoke_19(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id WeakRetained;
  NSObject *v7;
  _BOOL4 v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  CarPairingLogging();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v8)
    {
      v9 = 134218242;
      v10 = a2;
      v11 = 2112;
      v12 = v5;
      _os_log_impl(&dword_1A83A2000, v7, OS_LOG_TYPE_DEFAULT, "pairing completed unsuccessfully, result: %lu error: %@", (uint8_t *)&v9, 0x16u);
    }
  }
  else
  {
    if (v8)
    {
      LOWORD(v9) = 0;
      _os_log_impl(&dword_1A83A2000, v7, OS_LOG_TYPE_DEFAULT, "pairing completed successfully", (uint8_t *)&v9, 2u);
    }
    a2 = 0;
  }

  objc_msgSend(WeakRetained, "_delegate_handleCompletedWithResult:", a2);
}

- (void)handleVehicleReportedResult:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  NSObject *v6;
  uint8_t v7[16];

  v3 = a3;
  CarPairingLogging();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1A83A2000, v6, OS_LOG_TYPE_DEFAULT, "vehicle reported pairing success", v7, 2u);
    }

  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[CARWirelessPairingSession handleVehicleReportedResult:].cold.1();

    -[CARWirelessPairingSession cancelPairing](self, "cancelPairing");
  }
}

- (void)cancelPairing
{
  NSObject *v3;
  uint8_t v4[16];

  CarPairingLogging();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1A83A2000, v3, OS_LOG_TYPE_DEFAULT, "cancelling pairing", v4, 2u);
  }

  -[CARWirelessPairingSession _servicePerform:](self, "_servicePerform:", &__block_literal_global_22);
}

uint64_t __42__CARWirelessPairingSession_cancelPairing__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "cancelPairing");
}

- (void)invalidate
{
  void *v3;

  -[CARWirelessPairingSession cancelPairing](self, "cancelPairing");
  -[CARWirelessPairingSession connection](self, "connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  -[CARWirelessPairingSession setConnection:](self, "setConnection:", 0);
}

- (void)_setupConnection
{
  void *v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[5];
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;
  id location;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.carkit.pairing.service"), 4096);
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE9AC5B8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setRemoteObjectInterface:", v4);
  objc_initWeak(&location, self);
  v5 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __45__CARWirelessPairingSession__setupConnection__block_invoke;
  v9[3] = &unk_1E5428130;
  objc_copyWeak(&v10, &location);
  objc_msgSend(v3, "setInterruptionHandler:", v9);
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = __45__CARWirelessPairingSession__setupConnection__block_invoke_77;
  v7[3] = &unk_1E5428130;
  objc_copyWeak(&v8, &location);
  objc_msgSend(v3, "setInvalidationHandler:", v7);
  objc_msgSend(v3, "resume");
  -[CARWirelessPairingSession setConnection:](self, "setConnection:", v3);
  v6[0] = v5;
  v6[1] = 3221225472;
  v6[2] = __45__CARWirelessPairingSession__setupConnection__block_invoke_78;
  v6[3] = &unk_1E5429560;
  v6[4] = self;
  -[CARWirelessPairingSession _synchronous_servicePerform:](self, "_synchronous_servicePerform:", v6);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

void __45__CARWirelessPairingSession__setupConnection__block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;

  CarPairingLogging();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __45__CARWirelessPairingSession__setupConnection__block_invoke_cold_1();

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleConnectionReset");

}

void __45__CARWirelessPairingSession__setupConnection__block_invoke_77(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;

  CarPairingLogging();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __45__CARWirelessPairingSession__setupConnection__block_invoke_77_cold_1();

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "invalidate");

}

void __45__CARWirelessPairingSession__setupConnection__block_invoke_78(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "vehicleAddress");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "keyIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "initializeForVehicleAddress:keyIdentifier:completion:", v6, v5, &__block_literal_global_80_0);

}

void __45__CARWirelessPairingSession__setupConnection__block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v4 = a3;
  CarPairingLogging();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (a2)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      __45__CARWirelessPairingSession__setupConnection__block_invoke_2_cold_1();
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    __45__CARWirelessPairingSession__setupConnection__block_invoke_2_cold_2((uint64_t)v4, v6, v7, v8, v9, v10, v11, v12);
  }

}

- (void)_servicePerform:(id)a3
{
  void (**v4)(id, id);
  void *v5;
  id v6;

  v4 = (void (**)(id, id))a3;
  -[CARWirelessPairingSession connection](self, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_82);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v4[2](v4, v6);
}

void __45__CARWirelessPairingSession__servicePerform___block_invoke(uint64_t a1, void *a2)
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
  CarPairingLogging();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __45__CARWirelessPairingSession__servicePerform___block_invoke_cold_1((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);

}

- (void)_synchronous_servicePerform:(id)a3
{
  void (**v4)(id, id);
  void *v5;
  id v6;

  v4 = (void (**)(id, id))a3;
  -[CARWirelessPairingSession connection](self, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_83_0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v4[2](v4, v6);
}

void __57__CARWirelessPairingSession__synchronous_servicePerform___block_invoke(uint64_t a1, void *a2)
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
  CarPairingLogging();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __57__CARWirelessPairingSession__synchronous_servicePerform___block_invoke_cold_1((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);

}

- (void)_handleConnectionReset
{
  -[CARWirelessPairingSession setConnection:](self, "setConnection:", 0);
}

- (void)_delegate_handleRequestedPairingWithDeviceAddress:(id)a3 forIntent:(unint64_t)a4 C192:(id)a5 R192:(id)a6 C256:(id)a7 R256:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  NSObject *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  _QWORD block[5];
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  unint64_t v31;

  v14 = a3;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  -[CARWirelessPairingSession clientQueue](self, "clientQueue");
  v19 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __109__CARWirelessPairingSession__delegate_handleRequestedPairingWithDeviceAddress_forIntent_C192_R192_C256_R256___block_invoke;
  block[3] = &unk_1E54295A8;
  block[4] = self;
  v26 = v14;
  v30 = v18;
  v31 = a4;
  v27 = v15;
  v28 = v16;
  v29 = v17;
  v20 = v18;
  v21 = v17;
  v22 = v16;
  v23 = v15;
  v24 = v14;
  dispatch_async(v19, block);

}

void __109__CARWirelessPairingSession__delegate_handleRequestedPairingWithDeviceAddress_forIntent_C192_R192_C256_R256___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  char v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  if (v2)
  {
    v5 = (void *)v2;
    v4 = objc_opt_respondsToSelector();
    v3 = v5;
    if ((v4 & 1) != 0)
    {
      objc_msgSend(v5, "pairingSession:requestedPairingWithDeviceAddress:forIntent:c192:r192:c256:r256:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
      v3 = v5;
    }
  }

}

- (void)_delegate_handleCompletedWithResult:(unint64_t)a3
{
  NSObject *v5;
  _QWORD v6[6];

  -[CARWirelessPairingSession clientQueue](self, "clientQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __65__CARWirelessPairingSession__delegate_handleCompletedWithResult___block_invoke;
  v6[3] = &unk_1E54293C8;
  v6[4] = self;
  v6[5] = a3;
  dispatch_async(v5, v6);

}

void __65__CARWirelessPairingSession__delegate_handleCompletedWithResult___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  char v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  if (v2)
  {
    v5 = (void *)v2;
    v4 = objc_opt_respondsToSelector();
    v3 = v5;
    if ((v4 & 1) != 0)
    {
      objc_msgSend(v5, "pairingSession:completedWithResult:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
      v3 = v5;
    }
  }

}

- (NSData)vehicleAddress
{
  return self->_vehicleAddress;
}

- (unint64_t)supportedCapabilities
{
  return self->_supportedCapabilities;
}

- (NSString)keyIdentifier
{
  return self->_keyIdentifier;
}

- (CARWirelessPairingDelegate)delegate
{
  return (CARWirelessPairingDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (OS_dispatch_queue)clientQueue
{
  return self->_clientQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientQueue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_keyIdentifier, 0);
  objc_storeStrong((id *)&self->_vehicleAddress, 0);
}

void __43__CARWirelessPairingSession_requestPairing__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_2_0(&dword_1A83A2000, v0, v1, "cannot request pairing, no connection", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __65__CARWirelessPairingSession_setupVehicleDataC192_r192_c256_r256___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_2_0(&dword_1A83A2000, v0, v1, "cannot setup pairing data, no connection", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)handleVehicleReportedResult:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_2_0(&dword_1A83A2000, v0, v1, "vehicle reported pairing failure, cancelling", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __45__CARWirelessPairingSession__setupConnection__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_2_0(&dword_1A83A2000, v0, v1, "CarKit wireless pairing service was interrupted", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __45__CARWirelessPairingSession__setupConnection__block_invoke_77_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_2_0(&dword_1A83A2000, v0, v1, "CarKit wireless pairing service was invalidated", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __45__CARWirelessPairingSession__setupConnection__block_invoke_2_cold_1()
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_3_2();
  _os_log_debug_impl(&dword_1A83A2000, v0, OS_LOG_TYPE_DEBUG, "initialized wireless pairing session", v1, 2u);
  OUTLINED_FUNCTION_5();
}

void __45__CARWirelessPairingSession__setupConnection__block_invoke_2_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A83A2000, a2, a3, "failed to initialize wireless pairing session, error: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __45__CARWirelessPairingSession__servicePerform___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A83A2000, a2, a3, "error calling CarKit wireless pairing service: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __57__CARWirelessPairingSession__synchronous_servicePerform___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A83A2000, a2, a3, "error calling CarKit head unit pairing prompt service: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
