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
  void *v5;
  void *v6;
  HMDRemoteDeviceMessageDestination *v7;
  void *v8;
  void *v9;
  void *v10;
  HMDRemoteDeviceMessageDestination *v11;
  uint64_t v12;
  void *v13;
  HMDHomeAdministratorConfigurationOperation *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  HMDHomeAdministratorConfigurationOperation *v19;
  NSObject *v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;
  id location;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)&self->_home);
  objc_msgSend(WeakRetained, "primaryResident");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)-[HMFMessage copy](self->_message, "copy");
    v6 = (void *)objc_msgSend(v5, "mutableCopy");

    objc_msgSend(v6, "setRemote:", 1);
    objc_msgSend(v6, "setSecureRemote:", 1);
    v7 = [HMDRemoteDeviceMessageDestination alloc];
    -[HMFMessage destination](self->_message, "destination");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "target");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "device");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[HMDRemoteDeviceMessageDestination initWithTarget:device:](v7, "initWithTarget:device:", v9, v10);
    objc_msgSend(v6, "setDestination:", v11);

    objc_initWeak(&location, self);
    v12 = MEMORY[0x1E0C809B0];
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __50__HMDHomeAdministratorConfigurationOperation_main__block_invoke;
    v24[3] = &unk_1E89BF5C0;
    objc_copyWeak(&v25, &location);
    v13 = (void *)MEMORY[0x1D17BA0A0](objc_msgSend(v6, "setResponseHandler:", v24));
    v14 = self;
    HMFGetOSLogHandle();
    v15 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v28 = v16;
      v29 = 2112;
      v30 = v6;
      _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_INFO, "%{public}@Sending message: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v13);
    -[HMDHomeAdministratorConfigurationOperation dispatcher](v14, "dispatcher");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v12;
    v22[1] = 3221225472;
    v22[2] = __50__HMDHomeAdministratorConfigurationOperation_main__block_invoke_7;
    v22[3] = &unk_1E89C0678;
    objc_copyWeak(&v23, &location);
    objc_msgSend(v17, "sendMessage:completionHandler:", v6, v22);

    objc_destroyWeak(&v23);
    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
  }
  else
  {
    v18 = (void *)MEMORY[0x1D17BA0A0]();
    v19 = self;
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v28 = v21;
      _os_log_impl(&dword_1CD062000, v20, OS_LOG_TYPE_ERROR, "%{public}@Unable to forward message to home without a resident", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v18);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:description:reason:suggestion:", 48, 0, CFSTR("A home hub is required."), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMFOperation cancelWithError:](v19, "cancelWithError:", v6);
  }

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

void __50__HMDHomeAdministratorConfigurationOperation_main__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void (**v14)(_QWORD, _QWORD, _QWORD);
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v8 = (void *)MEMORY[0x1D17BA0A0]();
  v9 = WeakRetained;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v5)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543618;
      v20 = v12;
      v21 = 2112;
      v22 = v5;
      _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_ERROR, "%{public}@Failed to forward message with error: %@", (uint8_t *)&v19, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    objc_msgSend(v9, "cancelWithError:", v5);
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543362;
      v20 = v13;
      _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_INFO, "%{public}@Received confirmation for forwarded message", (uint8_t *)&v19, 0xCu);

    }
    objc_autoreleasePoolPop(v8);
    objc_msgSend(v9, "finish");
  }
  objc_msgSend(v9, "responseHandler");
  v14 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = (void *)MEMORY[0x1D17BA0A0]();
    v16 = v9;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543362;
      v20 = v18;
      _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_INFO, "%{public}@Notifying client of response", (uint8_t *)&v19, 0xCu);

    }
    objc_autoreleasePoolPop(v15);
    objc_msgSend(v16, "setResponseHandler:", 0);
    ((void (**)(_QWORD, id, id))v14)[2](v14, v5, v6);
  }

}

void __50__HMDHomeAdministratorConfigurationOperation_main__block_invoke_7(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void (**v5)(_QWORD, _QWORD);
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "sendCompletionBlock");
  v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)MEMORY[0x1D17BA0A0]();
    v7 = WeakRetained;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543618;
      v11 = v9;
      v12 = 2112;
      v13 = v3;
      _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@Notifying client the send completed with error: %@", (uint8_t *)&v10, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
    objc_msgSend(v7, "setSendCompletionBlock:", 0);
    ((void (**)(_QWORD, id))v5)[2](v5, v3);
  }

}

+ (double)timeout
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;

  objc_msgSend(MEMORY[0x1E0D28678], "sharedPreferences");
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
  if (logCategory__hmf_once_t6_111564 != -1)
    dispatch_once(&logCategory__hmf_once_t6_111564, &__block_literal_global_111565);
  return (id)logCategory__hmf_once_v7_111566;
}

void __57__HMDHomeAdministratorConfigurationOperation_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v7_111566;
  logCategory__hmf_once_v7_111566 = v0;

}

@end
