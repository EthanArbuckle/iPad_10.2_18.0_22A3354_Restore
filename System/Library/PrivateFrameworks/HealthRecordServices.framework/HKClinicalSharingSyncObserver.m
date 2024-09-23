@implementation HKClinicalSharingSyncObserver

- (HKClinicalSharingSyncObserver)initWithDelegateQueue:(id)a3
{
  id v4;
  void *v5;
  HKClinicalSharingSyncObserver *v6;

  v4 = a3;
  +[HKHealthRecordsDaemonConnection sharedConnection](HKHealthRecordsDaemonConnection, "sharedConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HKClinicalSharingSyncObserver initWithConnection:delegateQueue:](self, "initWithConnection:delegateQueue:", v5, v4);

  return v6;
}

- (HKClinicalSharingSyncObserver)initWithConnection:(id)a3 delegateQueue:(id)a4
{
  id v6;
  id v7;
  HKClinicalSharingSyncObserver *v8;
  HKClinicalSharingSyncObserver *v9;
  HKHealthRecordsDaemonProxyProvider *v10;
  HKProxyProvider *proxyProvider;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)HKClinicalSharingSyncObserver;
  v8 = -[HKClinicalSharingSyncObserver init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_delegateQueue, a4);
    v9->_lock._os_unfair_lock_opaque = 0;
    v10 = -[HKHealthRecordsDaemonProxyProvider initWithConnection:serviceIdentifier:exportedObject:]([HKHealthRecordsDaemonProxyProvider alloc], "initWithConnection:serviceIdentifier:exportedObject:", v6, CFSTR("ClinicalSharingSyncObserver"), v9);
    proxyProvider = v9->_proxyProvider;
    v9->_proxyProvider = &v10->super;

  }
  return v9;
}

- (void)resume
{
  -[HKClinicalSharingSyncObserver resumeWithCompletion:](self, "resumeWithCompletion:", &__block_literal_global_9);
}

- (void)resumeWithCompletion:(id)a3
{
  id v5;
  id WeakRetained;
  HKProxyProvider *proxyProvider;
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *);
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;

  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (!WeakRetained)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKClinicalSharingSyncObserver.m"), 59, CFSTR("Delegate must be set before resume"));

  }
  os_unfair_lock_lock(&self->_lock);
  proxyProvider = self->_proxyProvider;
  v8 = MEMORY[0x24BDAC760];
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __54__HKClinicalSharingSyncObserver_resumeWithCompletion___block_invoke;
  v16[3] = &unk_24D54A4D0;
  v17 = v5;
  v11 = v8;
  v12 = 3221225472;
  v13 = __54__HKClinicalSharingSyncObserver_resumeWithCompletion___block_invoke_193;
  v14 = &unk_24D549308;
  v15 = v17;
  v9 = v17;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v16, &v11);
  -[HKProxyProvider setAutomaticProxyReconnectionHandler:](self->_proxyProvider, "setAutomaticProxyReconnectionHandler:", &__block_literal_global_197_1, v11, v12, v13, v14);
  os_unfair_lock_unlock(&self->_lock);

}

void __54__HKClinicalSharingSyncObserver_resumeWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  _QWORD v3[4];
  id v4;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __54__HKClinicalSharingSyncObserver_resumeWithCompletion___block_invoke_2;
  v3[3] = &unk_24D54A4A8;
  v4 = *(id *)(a1 + 32);
  objc_msgSend(a2, "remote_startObservingSyncStatusWithCompletion:", v3);

}

void __54__HKClinicalSharingSyncObserver_resumeWithCompletion___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v5 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    v6 = *MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_ERROR))
      __54__HKClinicalSharingSyncObserver_resumeWithCompletion___block_invoke_2_cold_1((uint64_t)v5, v6, v7, v8, v9, v10, v11, v12);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __54__HKClinicalSharingSyncObserver_resumeWithCompletion___block_invoke_193(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a2;
  _HKInitializeLogging();
  v4 = *MEMORY[0x24BDD2FF8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_ERROR))
    __54__HKClinicalSharingSyncObserver_resumeWithCompletion___block_invoke_2_cold_1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

uint64_t __54__HKClinicalSharingSyncObserver_resumeWithCompletion___block_invoke_195(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "remote_startObservingSyncStatusWithCompletion:", &__block_literal_global_199);
}

void __54__HKClinicalSharingSyncObserver_resumeWithCompletion___block_invoke_2_198(uint64_t a1, char a2, void *a3)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v4 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    v5 = *MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_ERROR))
      __54__HKClinicalSharingSyncObserver_resumeWithCompletion___block_invoke_2_198_cold_1((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);
  }

}

- (void)invalidate
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_didSyncStart = 0;
  -[HKProxyProvider setAutomaticProxyReconnectionHandler:](self->_proxyProvider, "setAutomaticProxyReconnectionHandler:", 0);
  -[HKProxyProvider invalidate](self->_proxyProvider, "invalidate");
  os_unfair_lock_unlock(p_lock);
}

- (void)client_syncDidFinishWithError:(id)a3
{
  id v4;
  void *v5;
  _BOOL4 v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  os_unfair_lock_s *p_lock;
  NSObject *delegateQueue;
  id v13;
  _QWORD v14[5];
  id v15;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _HKInitializeLogging();
  v5 = (void *)*MEMORY[0x24BDD2FF8];
  v6 = os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      v7 = v5;
      *(_DWORD *)buf = 138412546;
      v17 = objc_opt_class();
      v18 = 2114;
      v19 = v4;
      v8 = "%@: sync failed: %{public}@";
      v9 = v7;
      v10 = 22;
LABEL_6:
      _os_log_impl(&dword_2163C4000, v9, OS_LOG_TYPE_DEFAULT, v8, buf, v10);

    }
  }
  else if (v6)
  {
    v7 = v5;
    *(_DWORD *)buf = 138412290;
    v17 = objc_opt_class();
    v8 = "%@: sync finished";
    v9 = v7;
    v10 = 12;
    goto LABEL_6;
  }
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_didSyncStart = 0;
  delegateQueue = self->_delegateQueue;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __63__HKClinicalSharingSyncObserver_client_syncDidFinishWithError___block_invoke;
  v14[3] = &unk_24D54A558;
  v14[4] = self;
  v15 = v4;
  v13 = v4;
  dispatch_async(delegateQueue, v14);
  os_unfair_lock_unlock(p_lock);

}

void __63__HKClinicalSharingSyncObserver_client_syncDidFinishWithError___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clinicalSharingSyncObserver:syncDidFinishWithError:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)client_syncDidStartWithInfo:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  os_unfair_lock_s *p_lock;
  NSObject *delegateQueue;
  id v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _HKInitializeLogging();
  v5 = (void *)*MEMORY[0x24BDD2FF8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    *(_DWORD *)buf = 138412546;
    v13 = objc_opt_class();
    v14 = 2114;
    v15 = v4;
    _os_log_impl(&dword_2163C4000, v6, OS_LOG_TYPE_DEFAULT, "%@: sync did start: %{public}@", buf, 0x16u);

  }
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_didSyncStart = 1;
  delegateQueue = self->_delegateQueue;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __61__HKClinicalSharingSyncObserver_client_syncDidStartWithInfo___block_invoke;
  v10[3] = &unk_24D54A558;
  v10[4] = self;
  v11 = v4;
  v9 = v4;
  dispatch_async(delegateQueue, v10);
  os_unfair_lock_unlock(p_lock);

}

void __61__HKClinicalSharingSyncObserver_client_syncDidStartWithInfo___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clinicalSharingSyncObserver:syncDidStartWithInfo:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)connectionInterrupted
{
  os_unfair_lock_s *p_lock;
  NSObject *delegateQueue;
  _QWORD block[5];

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_didSyncStart)
  {
    delegateQueue = self->_delegateQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __54__HKClinicalSharingSyncObserver_connectionInterrupted__block_invoke;
    block[3] = &unk_24D54A580;
    block[4] = self;
    dispatch_async(delegateQueue, block);
    self->_didSyncStart = 0;
  }
  os_unfair_lock_unlock(p_lock);
}

void __54__HKClinicalSharingSyncObserver_connectionInterrupted__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD0B88], 4097, 0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clinicalSharingSyncObserver:syncDidFinishWithError:", *(_QWORD *)(a1 + 32), v3);

}

- (HKClinicalSharingSyncObserverDelegate)delegate
{
  return (HKClinicalSharingSyncObserverDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_proxyProvider, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
}

void __54__HKClinicalSharingSyncObserver_resumeWithCompletion___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_2163C4000, a2, a3, "Failed to begin observing clinical sharing sync status: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __54__HKClinicalSharingSyncObserver_resumeWithCompletion___block_invoke_2_198_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_2163C4000, a2, a3, "Failed to begin observing clinical sharing sync status after reconnection: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

@end
