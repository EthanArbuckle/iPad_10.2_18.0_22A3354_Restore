@implementation HMDRetailDemoModeRequestHandler

- (HMDRetailDemoModeRequestHandler)initWithHomeManager:(id)a3 messageDispatcher:(id)a4 relaunchHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  HMDRetailDemoModeRequestHandler *v11;
  HMDRetailDemoModeRequestHandler *v12;
  uint64_t v13;
  NSUUID *identifier;
  uint64_t v15;
  OS_dispatch_queue *workQueue;
  objc_super v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)HMDRetailDemoModeRequestHandler;
  v11 = -[HMDRetailDemoModeRequestHandler init](&v18, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_homeManager, v8);
    objc_msgSend(v8, "uuid");
    v13 = objc_claimAutoreleasedReturnValue();
    identifier = v12->_identifier;
    v12->_identifier = (NSUUID *)v13;

    objc_msgSend(v8, "workQueue");
    v15 = objc_claimAutoreleasedReturnValue();
    workQueue = v12->_workQueue;
    v12->_workQueue = (OS_dispatch_queue *)v15;

    objc_storeStrong((id *)&v12->_messageDispatcher, a4);
    objc_storeWeak((id *)&v12->_relaunchHandler, v10);
  }

  return v12;
}

- (void)configure
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  -[HMDRetailDemoModeRequestHandler messageDispatcher](self, "messageDispatcher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDXPCMessagePolicy policyWithEntitlements:](HMDXPCMessagePolicy, "policyWithEntitlements:", 5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerForMessage:receiver:policies:selector:", CFSTR("kConfigRetailDemoMode"), self, v5, sel__handleConfigRetailDemoModeMessage_);

}

- (void)_handleConfigRetailDemoModeMessageForPrepare:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  HMDRetailDemoModeRequestHandler *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  HMDRetailDemoModeRequestHandler *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  HMDRetailDemoModeRequestHandler *v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  const __CFString *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  const __CFString *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  const __CFString *v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDRetailDemoModeRequestHandler workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  objc_msgSend(v4, "dataForKey:", CFSTR("kControllerKeyPairKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringForKey:", CFSTR("kControllerPairingNameKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryForKey:", CFSTR("kAccessoriesDataBlobKey"));
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v6 && v7 && v8)
  {
    -[HMDRetailDemoModeRequestHandler homeManager](self, "homeManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __80__HMDRetailDemoModeRequestHandler__handleConfigRetailDemoModeMessageForPrepare___block_invoke;
      v21[3] = &unk_1E89C21C0;
      v22 = v4;
      v23 = self;
      objc_msgSend(v10, "configureRetailDemoModeWithKeyPair:controllerName:demoAccessories:completionHandler:", v6, v7, v9, v21);
      v11 = v22;
    }
    else
    {
      v16 = (void *)MEMORY[0x1D17BA0A0]();
      v17 = self;
      HMFGetOSLogHandle();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v25 = v19;
        _os_log_impl(&dword_1CD062000, v18, OS_LOG_TYPE_ERROR, "%{public}@Cannot handle message because home manager is nil", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v16);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", -1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "respondWithError:", v11);
    }

  }
  else
  {
    v12 = (void *)MEMORY[0x1D17BA0A0]();
    v13 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v20 = v12;
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544898;
      v25 = v15;
      v26 = 2112;
      v27 = CFSTR("kControllerKeyPairKey");
      v28 = 2112;
      v29 = v6;
      v30 = 2112;
      v31 = CFSTR("kControllerPairingNameKey");
      v32 = 2112;
      v33 = v7;
      v34 = 2112;
      v35 = CFSTR("kAccessoriesDataBlobKey");
      v36 = 2112;
      v37 = v9;
      _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_ERROR, "%{public}@Cannot handle message because one or more arguments are nil: %@=%@, %@=%@, %@=%@", buf, 0x48u);

      v12 = v20;
    }

    objc_autoreleasePoolPop(v12);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 20);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v10);
  }

}

- (void)_handleConfigRetailDemoModeMessageForFinalize:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  HMDRetailDemoModeRequestHandler *v10;
  NSObject *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  HMDRetailDemoModeRequestHandler *v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDRetailDemoModeRequestHandler workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = objc_msgSend(v4, "BOOLForKey:", CFSTR("kAllowRetailDemoModeEditingKey"));
  -[HMDRetailDemoModeRequestHandler homeManager](self, "homeManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __81__HMDRetailDemoModeRequestHandler__handleConfigRetailDemoModeMessageForFinalize___block_invoke;
    v13[3] = &unk_1E89BB370;
    v14 = v4;
    v15 = self;
    objc_msgSend(v7, "finalizeRetailDemoModeWithAllowEditing:completionHandler:", v6, v13);
    v8 = v14;
  }
  else
  {
    v9 = (void *)MEMORY[0x1D17BA0A0]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v17 = v12;
      _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_ERROR, "%{public}@Cannot handle message because home manager is nil", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v9);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", -1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v8);
  }

}

- (void)_handleConfigRetailDemoModeMessage:(id)a3
{
  id v4;
  int v5;
  void *v6;
  HMDRetailDemoModeRequestHandler *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "BOOLForKey:", CFSTR("kFinalizeRetailDemoSetupKey"));
  v6 = (void *)MEMORY[0x1D17BA0A0]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543618;
    v12 = v9;
    v13 = 2112;
    v14 = v10;
    _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@Handling config retail demo mode message with finalizeDemoSetup=%@", (uint8_t *)&v11, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  if (v5)
    -[HMDRetailDemoModeRequestHandler _handleConfigRetailDemoModeMessageForFinalize:](v7, "_handleConfigRetailDemoModeMessageForFinalize:", v4);
  else
    -[HMDRetailDemoModeRequestHandler _handleConfigRetailDemoModeMessageForPrepare:](v7, "_handleConfigRetailDemoModeMessageForPrepare:", v4);

}

- (HMDHomeManager)homeManager
{
  return (HMDHomeManager *)objc_loadWeakRetained((id *)&self->_homeManager);
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 24, 1);
}

- (HMFMessageDispatcher)messageDispatcher
{
  return (HMFMessageDispatcher *)objc_getProperty(self, a2, 32, 1);
}

- (HMDRelaunchHandling)relaunchHandler
{
  return (HMDRelaunchHandling *)objc_loadWeakRetained((id *)&self->_relaunchHandler);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_relaunchHandler);
  objc_storeStrong((id *)&self->_messageDispatcher, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_homeManager);
}

void __81__HMDRetailDemoModeRequestHandler__handleConfigRetailDemoModeMessageForFinalize___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v3;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v3 = *(void **)(a1 + 32);
  if (a2)
  {
    v9 = CFSTR("kEncryptedHomeDataBlobKey");
    v10[0] = a2;
    v5 = (void *)MEMORY[0x1E0C99D80];
    v6 = a2;
    objc_msgSend(v5, "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "respondWithPayload:", v7);

    objc_msgSend(*(id *)(a1 + 40), "relaunchHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "relaunchAfterDelay:", 0.5);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "respondWithError:", a3);
    v8 = 0;
  }

}

void __80__HMDRetailDemoModeRequestHandler__handleConfigRetailDemoModeMessageForPrepare___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  if (a2)
  {
    objc_msgSend(v3, "respondWithError:", a2);
  }
  else
  {
    objc_msgSend(v3, "respondWithSuccess");
    objc_msgSend(*(id *)(a1 + 40), "relaunchHandler");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "relaunchAfterDelay:", 1.0);

  }
}

@end
