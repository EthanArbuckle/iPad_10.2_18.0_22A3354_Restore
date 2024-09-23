@implementation _HKFitnessMachineConnection

- (_HKFitnessMachineConnection)initWithHealthStore:(id)a3
{
  id v4;
  _HKFitnessMachineConnection *v5;
  HKTaskServerProxyProvider *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  HKTaskServerProxyProvider *proxyProvider;
  NSLock *v11;
  NSLock *lock;
  _QWORD v14[4];
  id v15;
  id location;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)_HKFitnessMachineConnection;
  v5 = -[_HKFitnessMachineConnection init](&v17, sel_init);
  if (v5)
  {
    v6 = [HKTaskServerProxyProvider alloc];
    objc_msgSend((id)objc_opt_class(), "taskIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[HKTaskServerProxyProvider initWithHealthStore:taskIdentifier:exportedObject:taskUUID:](v6, "initWithHealthStore:taskIdentifier:exportedObject:taskUUID:", v4, v7, v5, v8);
    proxyProvider = v5->_proxyProvider;
    v5->_proxyProvider = (HKTaskServerProxyProvider *)v9;

    objc_initWeak(&location, v5);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __51___HKFitnessMachineConnection_initWithHealthStore___block_invoke;
    v14[3] = &unk_1E37E95B8;
    objc_copyWeak(&v15, &location);
    -[HKProxyProvider setAutomaticProxyReconnectionHandler:](v5->_proxyProvider, "setAutomaticProxyReconnectionHandler:", v14);
    v5->_machineState = 0;
    v5->_connectionState = 0;
    v11 = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
    lock = v5->_lock;
    v5->_lock = v11;

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }

  return v5;
}

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_HKFitnessMachineConnection;
  return -[_HKFitnessMachineConnection init](&v3, sel_init);
}

- (NSUUID)uuid
{
  return -[HKTaskServerProxyProvider taskUUID](self->_proxyProvider, "taskUUID");
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
  -[_HKFitnessMachineConnection _registerClient](self, "_registerClient");
}

+ (id)taskIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (void)connectionInterrupted
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 100, CFSTR("connection interrupted"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[_HKFitnessMachineConnection _connectionInterruptedWithError:](self, "_connectionInterruptedWithError:", v3);

}

- (void)connectionInvalidated
{
  NSObject *v3;
  int v4;
  _HKFitnessMachineConnection *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  v3 = HKLogWorkouts;
  if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138543362;
    v5 = self;
    _os_log_impl(&dword_19A0E6000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: Connection invalidated", (uint8_t *)&v4, 0xCu);
  }
  -[_HKFitnessMachineConnection connectionInterrupted](self, "connectionInterrupted");
}

- (void)_fetchProxyWithHandler:(id)a3 errorHandler:(id)a4
{
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](self->_proxyProvider, "fetchProxyWithHandler:errorHandler:", a3, a4);
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[_HKFitnessMachineConnection uuid](self, "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[_HKFitnessMachineConnection uuid](self, "uuid");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "uuid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqual:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSString)description
{
  NSLock *lock;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__28;
  v10 = __Block_byref_object_dispose__28;
  v11 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __42___HKFitnessMachineConnection_description__block_invoke;
  v5[3] = &unk_1E37E6810;
  v5[4] = self;
  v5[5] = &v6;
  -[NSLock hk_withLock:](lock, "hk_withLock:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

- (void)markClientReady
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __46___HKFitnessMachineConnection_markClientReady__block_invoke_2;
  v2[3] = &unk_1E37E6A70;
  v2[4] = self;
  -[_HKFitnessMachineConnection _fetchProxyWithHandler:errorHandler:](self, "_fetchProxyWithHandler:errorHandler:", &__block_literal_global_65, v2);
}

- (void)_registerClient
{
  NSObject *v3;
  _QWORD v4[5];
  _QWORD v5[5];
  uint8_t buf[4];
  _HKFitnessMachineConnection *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  v3 = HKLogWorkouts;
  if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v7 = self;
    _os_log_impl(&dword_19A0E6000, v3, OS_LOG_TYPE_DEFAULT, "Registering Client. Fitness machine connection %@", buf, 0xCu);
  }
  v4[4] = self;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __46___HKFitnessMachineConnection__registerClient__block_invoke;
  v5[3] = &unk_1E37F03E8;
  v5[4] = self;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __46___HKFitnessMachineConnection__registerClient__block_invoke_2;
  v4[3] = &unk_1E37E6A70;
  -[_HKFitnessMachineConnection _fetchProxyWithHandler:errorHandler:](self, "_fetchProxyWithHandler:errorHandler:", v5, v4);
}

- (void)end
{
  NSObject *v3;
  _QWORD v4[5];
  uint8_t buf[4];
  _HKFitnessMachineConnection *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  v3 = HKLogWorkouts;
  if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v6 = self;
    _os_log_impl(&dword_19A0E6000, v3, OS_LOG_TYPE_DEFAULT, "End fitness machine connection %@", buf, 0xCu);
  }
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __34___HKFitnessMachineConnection_end__block_invoke_2;
  v4[3] = &unk_1E37E6A70;
  v4[4] = self;
  -[_HKFitnessMachineConnection _fetchProxyWithHandler:errorHandler:](self, "_fetchProxyWithHandler:errorHandler:", &__block_literal_global_15_0, v4);
}

- (void)endWithFitnessMachineSessionUUID:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v6[4] = self;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __64___HKFitnessMachineConnection_endWithFitnessMachineSessionUUID___block_invoke;
  v7[3] = &unk_1E37F03E8;
  v8 = v4;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __64___HKFitnessMachineConnection_endWithFitnessMachineSessionUUID___block_invoke_2;
  v6[3] = &unk_1E37E6A70;
  v5 = v4;
  -[_HKFitnessMachineConnection _fetchProxyWithHandler:errorHandler:](self, "_fetchProxyWithHandler:errorHandler:", v7, v6);

}

- (id)currentSessionConfiguration
{
  _HKFitnessMachineSessionConfiguration *v3;
  NSLock *lock;
  _HKFitnessMachineSessionConfiguration *v5;
  _HKFitnessMachineSessionConfiguration *v6;
  _QWORD v8[4];
  _HKFitnessMachineSessionConfiguration *v9;
  _HKFitnessMachineConnection *v10;

  v3 = objc_alloc_init(_HKFitnessMachineSessionConfiguration);
  lock = self->_lock;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __58___HKFitnessMachineConnection_currentSessionConfiguration__block_invoke;
  v8[3] = &unk_1E37E6980;
  v5 = v3;
  v9 = v5;
  v10 = self;
  -[NSLock hk_withLock:](lock, "hk_withLock:", v8);
  v6 = v5;

  return v6;
}

- (HKDevice)deviceForFinalWorkout
{
  NSLock *lock;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__28;
  v10 = __Block_byref_object_dispose__28;
  v11 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __52___HKFitnessMachineConnection_deviceForFinalWorkout__block_invoke;
  v5[3] = &unk_1E37E6958;
  v5[4] = self;
  v5[5] = &v6;
  -[NSLock hk_withLock:](lock, "hk_withLock:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (HKDevice *)v3;
}

- (_HKFitnessMachine)fitnessMachine
{
  _HKFitnessMachine *v3;

  -[NSLock lock](self->_lock, "lock");
  v3 = self->_fitnessMachine;
  -[NSLock unlock](self->_lock, "unlock");
  return v3;
}

- (void)clientRemote_deliverDetectedNFC:(id)a3
{
  id v4;
  uint64_t v5;
  NSLock *lock;
  id v7;
  NSObject *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  _QWORD v12[5];
  id v13;

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  lock = self->_lock;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __63___HKFitnessMachineConnection_clientRemote_deliverDetectedNFC___block_invoke;
  v12[3] = &unk_1E37E6980;
  v12[4] = self;
  v7 = v4;
  v13 = v7;
  -[NSLock hk_withLock:](lock, "hk_withLock:", v12);
  -[HKProxyProvider clientQueue](self->_proxyProvider, "clientQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v10[0] = v5;
  v10[1] = 3221225472;
  v10[2] = __63___HKFitnessMachineConnection_clientRemote_deliverDetectedNFC___block_invoke_2;
  v10[3] = &unk_1E37E6980;
  v10[4] = self;
  v11 = v7;
  v9 = v7;
  dispatch_async(v8, v10);

}

- (void)clientRemote_deliverMachineInformationUpdated:(id)a3
{
  id v4;
  uint64_t v5;
  NSLock *lock;
  id v7;
  NSObject *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  _QWORD v12[5];
  id v13;

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  lock = self->_lock;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __77___HKFitnessMachineConnection_clientRemote_deliverMachineInformationUpdated___block_invoke;
  v12[3] = &unk_1E37E6980;
  v12[4] = self;
  v7 = v4;
  v13 = v7;
  -[NSLock hk_withLock:](lock, "hk_withLock:", v12);
  -[HKProxyProvider clientQueue](self->_proxyProvider, "clientQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v10[0] = v5;
  v10[1] = 3221225472;
  v10[2] = __77___HKFitnessMachineConnection_clientRemote_deliverMachineInformationUpdated___block_invoke_2;
  v10[3] = &unk_1E37E6980;
  v10[4] = self;
  v11 = v7;
  v9 = v7;
  dispatch_async(v8, v10);

}

- (void)clientRemote_deliverMachineChangedToState:(unint64_t)a3 fromState:(unint64_t)a4 fitnessMachineSessionUUID:(id)a5 date:(id)a6
{
  id v10;
  id v11;
  NSLock *lock;
  uint64_t v13;
  NSObject *v14;
  id v15;
  id v16;
  _QWORD block[5];
  id v18;
  id v19;
  unint64_t v20;
  unint64_t v21;
  _QWORD v22[6];

  v10 = a5;
  v11 = a6;
  lock = self->_lock;
  v13 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __114___HKFitnessMachineConnection_clientRemote_deliverMachineChangedToState_fromState_fitnessMachineSessionUUID_date___block_invoke;
  v22[3] = &unk_1E37E8940;
  v22[4] = self;
  v22[5] = a3;
  -[NSLock hk_withLock:](lock, "hk_withLock:", v22);
  -[HKProxyProvider clientQueue](self->_proxyProvider, "clientQueue");
  v14 = objc_claimAutoreleasedReturnValue();
  block[0] = v13;
  block[1] = 3221225472;
  block[2] = __114___HKFitnessMachineConnection_clientRemote_deliverMachineChangedToState_fromState_fitnessMachineSessionUUID_date___block_invoke_2;
  block[3] = &unk_1E37F0430;
  v20 = a3;
  v21 = a4;
  block[4] = self;
  v18 = v10;
  v19 = v11;
  v15 = v11;
  v16 = v10;
  dispatch_async(v14, block);

}

- (void)clientRemote_deliverConnectionChangedToState:(unint64_t)a3 fromState:(unint64_t)a4 fitnessMachineSessionUUID:(id)a5 error:(id)a6
{
  id v10;
  id v11;
  NSLock *lock;
  uint64_t v13;
  id v14;
  NSObject *v15;
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  _QWORD *v21;
  unint64_t v22;
  unint64_t v23;
  _QWORD v24[5];
  id v25;
  _QWORD *v26;
  unint64_t v27;
  _QWORD v28[5];
  id v29;

  v10 = a5;
  v11 = a6;
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x3032000000;
  v28[3] = __Block_byref_object_copy__28;
  v28[4] = __Block_byref_object_dispose__28;
  v29 = 0;
  lock = self->_lock;
  v13 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __118___HKFitnessMachineConnection_clientRemote_deliverConnectionChangedToState_fromState_fitnessMachineSessionUUID_error___block_invoke;
  v24[3] = &unk_1E37F0458;
  v24[4] = self;
  v27 = a3;
  v14 = v10;
  v25 = v14;
  v26 = v28;
  -[NSLock hk_withLock:](lock, "hk_withLock:", v24);
  -[HKProxyProvider clientQueue](self->_proxyProvider, "clientQueue");
  v15 = objc_claimAutoreleasedReturnValue();
  v18[0] = v13;
  v18[1] = 3221225472;
  v18[2] = __118___HKFitnessMachineConnection_clientRemote_deliverConnectionChangedToState_fromState_fitnessMachineSessionUUID_error___block_invoke_26;
  v18[3] = &unk_1E37F0480;
  v22 = a3;
  v23 = a4;
  v18[4] = self;
  v19 = v14;
  v20 = v11;
  v21 = v28;
  v16 = v11;
  v17 = v14;
  dispatch_async(v15, v18);

  _Block_object_dispose(v28, 8);
}

- (void)clientRemote_deliverFailedWithError:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HKProxyProvider clientQueue](self->_proxyProvider, "clientQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __67___HKFitnessMachineConnection_clientRemote_deliverFailedWithError___block_invoke;
  v7[3] = &unk_1E37E6980;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)_simulateDisconnect
{
  -[_HKFitnessMachineConnection _fetchProxyWithHandler:errorHandler:](self, "_fetchProxyWithHandler:errorHandler:", &__block_literal_global_29_0, &__block_literal_global_30_0);
}

- (void)_clientQueue_deliverFailedWithError:(id)a3
{
  id WeakRetained;
  void *v5;
  id v6;
  char v7;
  id v8;
  id v9;

  v9 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    v5 = WeakRetained;
    v6 = objc_loadWeakRetained((id *)&self->_delegate);
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      v8 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v8, "fitnessMachineConnection:failedWithError:", self, v9);

    }
  }

}

- (void)_connectionInterruptedWithError:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HKProxyProvider clientQueue](self->_proxyProvider, "clientQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __63___HKFitnessMachineConnection__connectionInterruptedWithError___block_invoke;
  v7[3] = &unk_1E37E6980;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (unint64_t)machineState
{
  return self->_machineState;
}

- (unint64_t)connectionState
{
  return self->_connectionState;
}

- (_HKFitnessMachineConnectionDelegate)delegate
{
  return (_HKFitnessMachineConnectionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_deviceForFinalWorkout, 0);
  objc_storeStrong((id *)&self->_fitnessMachine, 0);
  objc_storeStrong((id *)&self->_currentSessionUUID, 0);
  objc_storeStrong((id *)&self->_proxyProvider, 0);
}

@end
