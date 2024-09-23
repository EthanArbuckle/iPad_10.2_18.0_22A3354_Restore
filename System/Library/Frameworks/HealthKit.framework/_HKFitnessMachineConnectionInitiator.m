@implementation _HKFitnessMachineConnectionInitiator

- (_HKFitnessMachineConnectionInitiator)initWithHealthStore:(id)a3
{
  id v4;
  _HKFitnessMachineConnectionInitiator *v5;
  _HKFitnessMachineConnectionInitiator *v6;
  HKTaskServerProxyProvider *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  HKTaskServerProxyProvider *proxyProvider;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  id v17;
  id location;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)_HKFitnessMachineConnectionInitiator;
  v5 = -[_HKFitnessMachineConnectionInitiator init](&v19, sel_init);
  v6 = v5;
  if (v5)
  {
    atomic_store(1u, (unsigned __int8 *)&v5->_requiresRegistration);
    v7 = [HKTaskServerProxyProvider alloc];
    objc_msgSend((id)objc_opt_class(), "taskIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[HKTaskServerProxyProvider initWithHealthStore:taskIdentifier:exportedObject:taskUUID:](v7, "initWithHealthStore:taskIdentifier:exportedObject:taskUUID:", v4, v8, v6, v9);
    proxyProvider = v6->_proxyProvider;
    v6->_proxyProvider = (HKTaskServerProxyProvider *)v10;

    objc_initWeak(&location, v6);
    v13 = MEMORY[0x1E0C809B0];
    v14 = 3221225472;
    v15 = __60___HKFitnessMachineConnectionInitiator_initWithHealthStore___block_invoke;
    v16 = &unk_1E37E95B8;
    objc_copyWeak(&v17, &location);
    -[HKProxyProvider setAutomaticProxyReconnectionHandler:](v6->_proxyProvider, "setAutomaticProxyReconnectionHandler:", &v13);
    -[_HKFitnessMachineConnectionInitiator registerClientIfNeeded](v6, "registerClientIfNeeded", v13, v14, v15, v16);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }

  return v6;
}

- (NSUUID)UUID
{
  return -[HKTaskServerProxyProvider taskUUID](self->_proxyProvider, "taskUUID");
}

+ (id)taskIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (void)connectionInterrupted
{
  void *v3;
  id v4;

  atomic_store(1u, (unsigned __int8 *)&self->_requiresRegistration);
  -[_HKFitnessMachineConnectionInitiator delegate](self, "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 100, CFSTR("connection interrupted"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "connectionInitiator:failedWithError:", self, v3);

}

- (void)connectionInvalidated
{
  NSObject *v3;
  int v4;
  _HKFitnessMachineConnectionInitiator *v5;
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
  -[_HKFitnessMachineConnectionInitiator connectionInterrupted](self, "connectionInterrupted");
}

- (void)registerClientIfNeeded
{
  NSObject *v3;
  BOOL *p_requiresRegistration;
  unsigned __int8 v5;
  NSObject *v6;
  _QWORD v7[5];
  uint8_t buf[4];
  _HKFitnessMachineConnectionInitiator *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  v3 = HKLogWorkouts;
  if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v9 = self;
    _os_log_impl(&dword_19A0E6000, v3, OS_LOG_TYPE_DEFAULT, "Register Client if needed. Fitness machine connection initiator %@", buf, 0xCu);
  }
  p_requiresRegistration = &self->_requiresRegistration;
  do
    v5 = __ldaxr((unsigned __int8 *)p_requiresRegistration);
  while (__stlxr(0, (unsigned __int8 *)p_requiresRegistration));
  if ((v5 & 1) != 0)
  {
    _HKInitializeLogging();
    v6 = HKLogWorkouts;
    if (os_log_type_enabled((os_log_t)HKLogWorkouts, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v9 = self;
      _os_log_impl(&dword_19A0E6000, v6, OS_LOG_TYPE_DEFAULT, "Registering Client. Fitness machine connection initiator %@", buf, 0xCu);
    }
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __62___HKFitnessMachineConnectionInitiator_registerClientIfNeeded__block_invoke;
    v7[3] = &unk_1E37E95E0;
    v7[4] = self;
    -[_HKFitnessMachineConnectionInitiator _fetchProxyWithHandler:](self, "_fetchProxyWithHandler:", v7);
  }
}

- (void)permitConnectionForFitnessMachineSessionUUID:(id)a3 activityType:(unint64_t)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  unint64_t v10;

  v6 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __98___HKFitnessMachineConnectionInitiator_permitConnectionForFitnessMachineSessionUUID_activityType___block_invoke;
  v8[3] = &unk_1E37E9608;
  v9 = v6;
  v10 = a4;
  v7 = v6;
  -[_HKFitnessMachineConnectionInitiator _fetchProxyWithHandler:](self, "_fetchProxyWithHandler:", v8);

}

- (void)forbidConnectionForFitnessMachineSessionUUID:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __85___HKFitnessMachineConnectionInitiator_forbidConnectionForFitnessMachineSessionUUID___block_invoke;
  v6[3] = &unk_1E37E95E0;
  v7 = v4;
  v5 = v4;
  -[_HKFitnessMachineConnectionInitiator _fetchProxyWithHandler:](self, "_fetchProxyWithHandler:", v6);

}

- (void)_fetchProxyWithHandler:(id)a3
{
  HKTaskServerProxyProvider *proxyProvider;
  _QWORD v4[5];

  proxyProvider = self->_proxyProvider;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __63___HKFitnessMachineConnectionInitiator__fetchProxyWithHandler___block_invoke;
  v4[3] = &unk_1E37E6A70;
  v4[4] = self;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", a3, v4);
}

- (void)clientRemote_updatedConnectionState:(unint64_t)a3 fitnessMachineSessionUUID:(id)a4
{
  void *v6;
  char v7;
  void *v8;
  void *v9;
  char v10;
  id v11;

  v11 = a4;
  -[_HKFitnessMachineConnectionInitiator delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  -[_HKFitnessMachineConnectionInitiator delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if ((v7 & 1) != 0)
  {
    objc_msgSend(v8, "connectionInitiator:updatedConnectionState:fitnessMachineSessionUUID:", self, a3, v11);
LABEL_5:

    goto LABEL_6;
  }
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    -[_HKFitnessMachineConnectionInitiator delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "connectionInitiator:updatedConnectionState:error:fitnessMachineSessionUUID:", self, a3, 0, v11);
    goto LABEL_5;
  }
LABEL_6:

}

- (void)clientRemote_updatedFitnessMachine:(id)a3 fitnessMachineSessionUUID:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[_HKFitnessMachineConnectionInitiator delegate](self, "delegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "connectionInitiator:updatedFitnessMachine:fitnessMachineSessionUUID:", self, v7, v6);

}

- (void)clientRemote_updatedFitnessMachineState:(unint64_t)a3 fitnessMachineSessionUUID:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  -[_HKFitnessMachineConnectionInitiator delegate](self, "delegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "connectionInitiator:updatedFitnessMachineState:fitnessMachineSessionUUID:", self, a3, v6);

}

- (void)clientRemote_workoutAppReady
{
  id v3;

  -[_HKFitnessMachineConnectionInitiator delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "connectionInitiatorWorkoutAppReady:", self);

}

- (void)clientRemote_encounteredError:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_HKFitnessMachineConnectionInitiator delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "connectionInitiator:failedWithError:", self, v4);

}

- (void)_simulateTapWithFitnessMachineType:(unint64_t)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __75___HKFitnessMachineConnectionInitiator__simulateTapWithFitnessMachineType___block_invoke;
  v3[3] = &__block_descriptor_40_e62_v16__0___HKFitnessMachineConnectionInitiatorServerInterface__8l;
  v3[4] = a3;
  -[_HKFitnessMachineConnectionInitiator _fetchProxyWithHandler:](self, "_fetchProxyWithHandler:", v3);
}

- (void)_simulateAccept
{
  -[_HKFitnessMachineConnectionInitiator _fetchProxyWithHandler:](self, "_fetchProxyWithHandler:", &__block_literal_global_7);
}

- (_HKFitnessMachineConnectionInitiatorDelegate)delegate
{
  return (_HKFitnessMachineConnectionInitiatorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_proxyProvider, 0);
}

@end
