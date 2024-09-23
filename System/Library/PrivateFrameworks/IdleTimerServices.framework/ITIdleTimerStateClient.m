@implementation ITIdleTimerStateClient

- (void)addIdleTimerConfiguration:(id)a3 forReason:(id)a4 error:(id *)a5
{
  os_unfair_lock_s *p_accessLock;
  id v9;
  id v10;
  id v11;
  id v12;

  p_accessLock = &self->_accessLock;
  v9 = a4;
  v10 = a3;
  os_unfair_lock_assert_not_owner(p_accessLock);
  os_unfair_lock_lock(p_accessLock);
  v12 = 0;
  -[ITIdleTimerStateClient _access_addIdleTimerConfiguration:forReason:error:](self, "_access_addIdleTimerConfiguration:forReason:error:", v10, v9, &v12);

  v11 = v12;
  os_unfair_lock_unlock(p_accessLock);
  if (a5 && v11)
    *a5 = objc_retainAutorelease(v11);

}

- (void)_access_addIdleTimerConfiguration:(id)a3 forReason:(id)a4 error:(id *)a5
{
  os_unfair_lock_s *p_accessLock;
  id v9;
  id v10;
  void *v11;
  id v12;
  NSObject *v13;
  id v14;

  p_accessLock = &self->_accessLock;
  v9 = a4;
  v10 = a3;
  os_unfair_lock_assert_owner(p_accessLock);
  -[BSServiceConnection remoteTarget](self->_connection, "remoteTarget");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  objc_msgSend(v11, "addIdleTimerServiceConfiguration:forReason:error:", v10, v9, &v14);

  v12 = v14;
  if (v12)
  {
    ITLogIdleTimer();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[ITIdleTimerStateClient _access_addIdleTimerConfiguration:forReason:error:].cold.1();

    if (a5)
      *a5 = objc_retainAutorelease(v12);
  }

}

- (ITIdleTimerStateClient)initWithDelegate:(id)a3
{
  id v4;
  ITIdleTimerStateClient *v5;
  id *p_isa;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  ITIdleTimerStateClient *v12;
  NSObject *v13;
  _QWORD v15[4];
  id *v16;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)ITIdleTimerStateClient;
  v5 = -[ITIdleTimerStateClient init](&v17, sel_init);
  p_isa = (id *)&v5->super.isa;
  if (!v5)
    goto LABEL_4;
  v5->_accessLock._os_unfair_lock_opaque = 0;
  v5->_access_serviceAvailability = 0;
  objc_storeWeak((id *)&v5->_delegate, v4);
  objc_msgSend(MEMORY[0x24BE0FA08], "endpointForMachName:service:instance:", CFSTR("com.apple.frontboard.systemappservices"), CFSTR("com.apple.idletimer-service"), 0);
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    objc_msgSend(MEMORY[0x24BE0FA00], "connectionWithEndpoint:", v7);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = p_isa[3];
    p_isa[3] = (id)v9;

    v11 = p_isa[3];
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __43__ITIdleTimerStateClient_initWithDelegate___block_invoke;
    v15[3] = &unk_24BF08B78;
    v16 = p_isa;
    objc_msgSend(v11, "configureConnection:", v15);
    objc_msgSend(p_isa[3], "activate");

LABEL_4:
    v12 = p_isa;
    goto LABEL_8;
  }
  ITLogIdleTimer();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    -[ITIdleTimerStateClient initWithDelegate:].cold.1();

  v12 = 0;
LABEL_8:

  return v12;
}

void __43__ITIdleTimerStateClient_initWithDelegate___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;

  v3 = (void *)MEMORY[0x24BE0BE50];
  v4 = a2;
  objc_msgSend(v3, "protocolForProtocol:", &unk_2544F6BA0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE0BE50], "protocolForProtocol:", &unk_2544F67F8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE0FA30], "interfaceWithServer:client:", v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInterface:", v7);

  objc_msgSend(v4, "setInterfaceTarget:", *(_QWORD *)(a1 + 32));
  objc_msgSend(MEMORY[0x24BE0FA38], "utility");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setServiceQuality:", v8);

  v9 = MEMORY[0x24BDAC760];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __43__ITIdleTimerStateClient_initWithDelegate___block_invoke_2;
  v12[3] = &unk_24BF08B50;
  v13 = *(id *)(a1 + 32);
  objc_msgSend(v4, "setInterruptionHandler:", v12);
  v10[0] = v9;
  v10[1] = 3221225472;
  v10[2] = __43__ITIdleTimerStateClient_initWithDelegate___block_invoke_56;
  v10[3] = &unk_24BF08B50;
  v11 = *(id *)(a1 + 32);
  objc_msgSend(v4, "setInvalidationHandler:", v10);

}

uint64_t __43__ITIdleTimerStateClient_initWithDelegate___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  ITLogIdleTimer();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __43__ITIdleTimerStateClient_initWithDelegate___block_invoke_2_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);

  return objc_msgSend(*(id *)(a1 + 32), "_connectionInterrupted");
}

void __43__ITIdleTimerStateClient_initWithDelegate___block_invoke_56(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  ITLogIdleTimer();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __43__ITIdleTimerStateClient_initWithDelegate___block_invoke_56_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);

  os_unfair_lock_assert_not_owner((const os_unfair_lock *)(*(_QWORD *)(a1 + 32) + 8));
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) = 1;
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
}

- (BOOL)isIdleTimerServiceAvailable
{
  os_unfair_lock_s *p_accessLock;
  unint64_t access_serviceAvailability;
  int v5;
  void *v6;
  id v7;
  NSObject *v8;
  id v10;

  p_accessLock = &self->_accessLock;
  os_unfair_lock_assert_not_owner(&self->_accessLock);
  os_unfair_lock_lock(p_accessLock);
  access_serviceAvailability = self->_access_serviceAvailability;
  if (access_serviceAvailability == 2)
  {
    LOBYTE(v5) = 1;
  }
  else if (access_serviceAvailability == 1)
  {
    LOBYTE(v5) = 0;
  }
  else
  {
    -[BSServiceConnection remoteTarget](self->_connection, "remoteTarget");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 0;
    v5 = objc_msgSend(v6, "isIdleTimerServiceAvailableWithError:", &v10);
    v7 = v10;

    if (v7)
    {
      ITLogIdleTimer();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[ITIdleTimerStateClient isIdleTimerServiceAvailable].cold.1();

      LOBYTE(v5) = 0;
    }
    else if (v5)
    {
      self->_access_serviceAvailability = 2;
      LOBYTE(v5) = 1;
    }
    else
    {
      self->_access_serviceAvailability = 1;
    }

  }
  os_unfair_lock_unlock(p_accessLock);
  return v5;
}

- (void)removeIdleTimerConfiguration:(id)a3 forReason:(id)a4
{
  os_unfair_lock_s *p_accessLock;
  id v7;
  id v8;

  p_accessLock = &self->_accessLock;
  v7 = a4;
  v8 = a3;
  os_unfair_lock_assert_not_owner(p_accessLock);
  os_unfair_lock_lock(p_accessLock);
  -[ITIdleTimerStateClient _access_removeIdleTimerConfiguration:forReason:](self, "_access_removeIdleTimerConfiguration:forReason:", v8, v7);

  os_unfair_lock_unlock(p_accessLock);
}

- (BOOL)handleIdleEvent:(id)a3 usingConfigurationWithIdentifier:(id)a4
{
  id v6;
  uint64_t v7;
  id WeakRetained;

  v6 = a4;
  v7 = objc_msgSend(a3, "unsignedIntegerValue");
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  LOBYTE(v7) = objc_msgSend(WeakRetained, "handleIdleEvent:usingConfigurationWithIdentifier:", v7, v6);

  return v7;
}

- (void)_connectionInterrupted
{
  id WeakRetained;

  -[BSServiceConnection activate](self->_connection, "activate");
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "resendIdleTimerAssertions");

}

- (void)_access_removeIdleTimerConfiguration:(id)a3 forReason:(id)a4
{
  os_unfair_lock_s *p_accessLock;
  id v7;
  id v8;
  void *v9;
  id v10;
  NSObject *v11;
  id v12;

  p_accessLock = &self->_accessLock;
  v7 = a4;
  v8 = a3;
  os_unfair_lock_assert_owner(p_accessLock);
  -[BSServiceConnection remoteTarget](self->_connection, "remoteTarget");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  objc_msgSend(v9, "removeIdleTimerServiceConfiguration:forReason:error:", v8, v7, &v12);

  v10 = v12;
  if (v10)
  {
    ITLogIdleTimer();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[ITIdleTimerStateClient _access_removeIdleTimerConfiguration:forReason:].cold.1();

  }
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_connection, 0);
}

- (void)initWithDelegate:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_3();
  v3 = 2114;
  v4 = v0;
  _os_log_error_impl(&dword_2063D2000, v1, OS_LOG_TYPE_ERROR, "cannot get endpoint for mach service: %{public}@ (on behalf of BSService name: %{public}@)", v2, 0x16u);
  OUTLINED_FUNCTION_1_0();
}

void __43__ITIdleTimerStateClient_initWithDelegate___block_invoke_2_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_0(&dword_2063D2000, a1, a3, "ITIdleTimerStateClient connection interrupted.", a5, a6, a7, a8, 0);
}

void __43__ITIdleTimerStateClient_initWithDelegate___block_invoke_56_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_0(&dword_2063D2000, a1, a3, "ITIdleTimerStateClient connection invalidated.", a5, a6, a7, a8, 0);
}

- (void)isIdleTimerServiceAvailable
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_2063D2000, v0, v1, "Error requesting idle timer services availability: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_access_removeIdleTimerConfiguration:forReason:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_2063D2000, v0, v1, "Error removing idle timer configuration: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_access_addIdleTimerConfiguration:forReason:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_2063D2000, v0, v1, "Error adding idle timer configuration: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

@end
