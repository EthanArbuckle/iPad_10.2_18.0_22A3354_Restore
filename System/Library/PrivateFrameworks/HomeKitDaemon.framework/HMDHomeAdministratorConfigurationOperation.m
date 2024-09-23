@implementation HMDHomeAdministratorConfigurationOperation

- (HMDHomeAdministratorConfigurationOperation)initWithMessage:(id)a3 home:(id)a4 dispatcher:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  HMDHomeAdministratorConfigurationOperation *v13;
  HMDHomeAdministratorConfigurationOperation *v14;
  HMDHomeAdministratorConfigurationOperation *v15;
  uint64_t v16;
  id responseHandler;
  objc_super v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = v11;
  v13 = 0;
  if (v9 && v10 && v11)
  {
    objc_msgSend((id)objc_opt_class(), "timeout");
    v19.receiver = self;
    v19.super_class = (Class)HMDHomeAdministratorConfigurationOperation;
    v14 = -[HMFOperation initWithTimeout:](&v19, sel_initWithTimeout_);
    v15 = v14;
    if (v14)
    {
      objc_storeStrong((id *)&v14->_message, a3);
      objc_storeWeak((id *)&v15->_home, v10);
      objc_storeStrong((id *)&v15->_dispatcher, a5);
      objc_msgSend(v9, "responseHandler");
      v16 = objc_claimAutoreleasedReturnValue();
      responseHandler = v15->_responseHandler;
      v15->_responseHandler = (id)v16;

      -[HMFOperation setQualityOfService:](v15, "setQualityOfService:", objc_msgSend(v9, "qualityOfService"));
    }
    self = v15;
    v13 = self;
  }

  return v13;
}

- (void)main
{
  id WeakRetained;
  void *v4;
  HMDRemoteHomeMessageDestination *v5;
  void *v6;
  void *v7;
  void *v8;
  HMDRemoteHomeMessageDestination *v9;
  void *v10;
  _QWORD v11[5];

  WeakRetained = objc_loadWeakRetained((id *)&self->_home);
  v4 = (void *)-[HMFMessage mutableCopy](self->_message, "mutableCopy");
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __50__HMDHomeAdministratorConfigurationOperation_main__block_invoke;
  v11[3] = &unk_24E79B7E0;
  v11[4] = self;
  objc_msgSend(v4, "setResponseHandler:", v11);
  if (-[HMFMessage isAuthorizedForLocationAccess](self->_message, "isAuthorizedForLocationAccess"))
    objc_msgSend(v4, "setHeaderValue:forKey:", MEMORY[0x24BDBD1C8], CFSTR("cl.locauthz"));
  if (-[HMFMessage isEntitledForShortcutsAutomationAccess](self->_message, "isEntitledForShortcutsAutomationAccess"))
    objc_msgSend(v4, "setHeaderValue:forKey:", MEMORY[0x24BDBD1C8], CFSTR("cl.shortcutent"));
  v5 = [HMDRemoteHomeMessageDestination alloc];
  -[HMFMessage destination](self->_message, "destination");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "target");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HMDRemoteHomeMessageDestination initWithTarget:homeUUID:queueTimeout:](v5, "initWithTarget:homeUUID:queueTimeout:", v7, v8, &unk_24E96BE70);

  objc_msgSend(v4, "setDestination:", v9);
  objc_msgSend(WeakRetained, "residentSyncManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "performResidentRequest:options:", v4, 0);

}

- (id)logIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  -[HMDHomeAdministratorConfigurationOperation message](self, "message");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)shouldSuspendSyncing
{
  return self->_shouldSuspendSyncing;
}

- (void)setShouldSuspendSyncing:(BOOL)a3
{
  self->_shouldSuspendSyncing = a3;
}

- (id)sendCompletionBlock
{
  return objc_getProperty(self, a2, 320, 1);
}

- (void)setSendCompletionBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 320);
}

- (id)responseHandler
{
  return objc_getProperty(self, a2, 328, 1);
}

- (void)setResponseHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 328);
}

- (HMFMessage)message
{
  return (HMFMessage *)objc_getProperty(self, a2, 336, 1);
}

- (HMDHome)home
{
  return (HMDHome *)objc_loadWeakRetained((id *)&self->_home);
}

- (HMFMessageDispatcher)dispatcher
{
  return (HMFMessageDispatcher *)objc_getProperty(self, a2, 352, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatcher, 0);
  objc_destroyWeak((id *)&self->_home);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong(&self->_responseHandler, 0);
  objc_storeStrong(&self->_sendCompletionBlock, 0);
}

void __50__HMDHomeAdministratorConfigurationOperation_main__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  id WeakRetained;
  void *v8;
  void *v9;
  _QWORD v10[5];
  id v11;

  v5 = a3;
  v6 = *(_QWORD *)(a1 + 32);
  if (a2)
  {
    objc_msgSend(*(id *)(v6 + 336), "respondWithError:", a2);
    objc_msgSend(*(id *)(a1 + 32), "finish");
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(v6 + 344));
    objc_msgSend(WeakRetained, "backingStore");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "context");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __50__HMDHomeAdministratorConfigurationOperation_main__block_invoke_2;
    v10[3] = &unk_24E79C268;
    v10[4] = *(_QWORD *)(a1 + 32);
    v11 = v5;
    objc_msgSend(v9, "performBlock:", v10);

  }
}

uint64_t __50__HMDHomeAdministratorConfigurationOperation_main__block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 336), "respondWithPayload:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "finish");
}

+ (double)timeout
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;

  objc_msgSend(MEMORY[0x24BE3F248], "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferenceForKey:", CFSTR("adminConfigurationOperationTimeout"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "numberValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v3, "numberValue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "doubleValue");
    v7 = v6;

  }
  else
  {
    v7 = 65.0;
  }

  return v7;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_154671 != -1)
    dispatch_once(&logCategory__hmf_once_t0_154671, &__block_literal_global_154672);
  return (id)logCategory__hmf_once_v1_154673;
}

void __57__HMDHomeAdministratorConfigurationOperation_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v1_154673;
  logCategory__hmf_once_v1_154673 = v0;

}

@end
