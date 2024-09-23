@implementation HMDHomeAdministratorHandler

- (HMDHomeAdministratorHandler)initWithTransport:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C99DA0];
  v6 = *MEMORY[0x1E0C99768];
  v7 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@ is unavailable"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, v9, 0);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v10);
}

- (HMDHomeAdministratorHandler)initWithHome:(id)a3
{
  id v4;
  void *v5;
  HMDHomeAdministratorHandler *v6;

  v4 = a3;
  +[HMDMessageDispatcher defaultDispatcher](HMDMessageDispatcher, "defaultDispatcher");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HMDHomeAdministratorHandler initWithHome:dispatcher:](self, "initWithHome:dispatcher:", v4, v5);

  return v6;
}

- (HMDHomeAdministratorHandler)initWithHome:(id)a3 dispatcher:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDHomeAdministratorHandler *v9;
  HMDHomeAdministratorHandler *v10;
  HMDHomeAdministratorHandler *v11;
  NSOperationQueue *v12;
  NSOperationQueue *queue;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSMapTable *receivers;
  objc_super v20;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  v9 = 0;
  if (v6 && v7)
  {
    v20.receiver = self;
    v20.super_class = (Class)HMDHomeAdministratorHandler;
    v10 = -[HMFMessageDispatcher initWithTransport:](&v20, sel_initWithTransport_, 0);
    v11 = v10;
    if (v10)
    {
      objc_storeWeak((id *)&v10->_home, v6);
      objc_storeStrong((id *)&v11->_dispatcher, a4);
      v12 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
      queue = v11->_queue;
      v11->_queue = v12;

      objc_msgSend(v6, "uuid");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "UUIDString");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      HMDispatchQueueNameString();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSOperationQueue setName:](v11->_queue, "setName:", v16);

      -[NSOperationQueue setQualityOfService:](v11->_queue, "setQualityOfService:", 9);
      -[NSOperationQueue setMaxConcurrentOperationCount:](v11->_queue, "setMaxConcurrentOperationCount:", 1);
      v17 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 517, 0, 0);
      receivers = v11->_receivers;
      v11->_receivers = (NSMapTable *)v17;

    }
    self = v11;
    v9 = self;
  }

  return v9;
}

- (id)syncOperationManager
{
  void *v2;
  void *v3;
  void *v4;

  -[HMDHomeAdministratorHandler home](self, "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "homeManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "syncManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)registerForMessage:(id)a3 receiver:(id)a4 policies:(id)a5 messageHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  objc_super v14;

  v10 = a6;
  v11 = a4;
  v12 = a3;
  __HMDHomeAdministratorHandlerRegister(self, v12, v11, a5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14.receiver = self;
  v14.super_class = (Class)HMDHomeAdministratorHandler;
  -[HMFMessageDispatcher registerForMessage:receiver:policies:messageHandler:](&v14, sel_registerForMessage_receiver_policies_messageHandler_, v12, v11, v13, v10);

}

- (void)registerForMessage:(id)a3 receiver:(id)a4 policies:(id)a5 selector:(SEL)a6
{
  id v10;
  id v11;
  void *v12;
  objc_super v13;

  v10 = a4;
  v11 = a3;
  __HMDHomeAdministratorHandlerRegister(self, v11, v10, a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13.receiver = self;
  v13.super_class = (Class)HMDHomeAdministratorHandler;
  -[HMFMessageDispatcher registerForMessage:receiver:policies:selector:](&v13, sel_registerForMessage_receiver_policies_selector_, v11, v10, v12, a6);

}

- (void)deregisterReceiver:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  if (v4)
  {
    v6.receiver = self;
    v6.super_class = (Class)HMDHomeAdministratorHandler;
    -[HMFMessageDispatcher deregisterReceiver:](&v6, sel_deregisterReceiver_, v4);
    os_unfair_lock_lock_with_options();
    -[NSMapTable objectForKey:](self->_receivers, "objectForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMapTable removeObjectForKey:](self->_receivers, "removeObjectForKey:", v4);
    os_unfair_lock_unlock(&self->_lock);

  }
}

- (BOOL)shouldRelayMessages
{
  id WeakRetained;
  void *v3;
  char v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_home);
  v3 = WeakRetained;
  if (WeakRetained)
    v4 = objc_msgSend(WeakRetained, "isSharedAdmin");
  else
    v4 = 1;

  return v4;
}

- (id)operationForMessage:(id)a3 error:(id *)a4
{
  id v6;
  id WeakRetained;
  void *v8;
  HMDHomeAdministratorConfigurationOperation *v9;
  void *v10;
  HMDHomeAdministratorConfigurationOperation *v11;
  void *v12;
  const __CFString *v13;
  uint64_t v14;

  v6 = a3;
  if (v6)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_home);
    if (WeakRetained)
    {
      -[HMDHomeAdministratorHandler dispatcher](self, "dispatcher");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        v9 = [HMDHomeAdministratorConfigurationOperation alloc];
        -[HMDHomeAdministratorHandler dispatcher](self, "dispatcher");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = -[HMDHomeAdministratorConfigurationOperation initWithMessage:home:dispatcher:](v9, "initWithMessage:home:dispatcher:", v6, WeakRetained, v10);

LABEL_14:
        goto LABEL_15;
      }
      if (a4)
      {
        v12 = (void *)MEMORY[0x1E0CB35C8];
        v13 = CFSTR("Dispatcher is nil.");
        v14 = -1;
        goto LABEL_11;
      }
    }
    else if (a4)
    {
      v12 = (void *)MEMORY[0x1E0CB35C8];
      v13 = CFSTR("The home is no longer valid.");
      v14 = 2;
LABEL_11:
      objc_msgSend(v12, "hmErrorWithCode:description:reason:suggestion:", v14, 0, v13, 0);
      v11 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    }
    v11 = 0;
    goto LABEL_14;
  }
  if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 20);
    v11 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }
LABEL_15:

  return v11;
}

- (void)addOperation:(id)a3
{
  id v4;
  void *v5;
  HMDHomeAdministratorHandler *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  HMDHomeAdministratorHandler *v10;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v5 = (void *)MEMORY[0x1D17BA0A0]();
    v6 = self;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543618;
      v14 = v8;
      v15 = 2112;
      v16 = v4;
      _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Adding operation: %@", (uint8_t *)&v13, 0x16u);

    }
    objc_autoreleasePoolPop(v5);
    if (objc_msgSend(v4, "shouldSuspendSyncing"))
    {
      v9 = (void *)MEMORY[0x1D17BA0A0]();
      v10 = v6;
      HMFGetOSLogHandle();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = 138543362;
        v14 = v12;
        _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_INFO, "%{public}@Registering for state change notifications", (uint8_t *)&v13, 0xCu);

      }
      objc_autoreleasePoolPop(v9);
      objc_msgSend(v4, "addObserver:forKeyPath:options:context:", v10, CFSTR("isExecuting"), 0, 0);
      objc_msgSend(v4, "addObserver:forKeyPath:options:context:", v10, CFSTR("isFinished"), 0, 0);
    }
    -[NSOperationQueue addOperation:](v6->_queue, "addOperation:", v4);
  }

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  HMDHomeAdministratorHandler *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  HMDHomeAdministratorHandler *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  BOOL v25;
  void *v26;
  HMDHomeAdministratorHandler *v27;
  NSObject *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  void *v34;
  __int16 v35;
  id v36;
  __int16 v37;
  id v38;
  __int16 v39;
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  -[HMDHomeAdministratorHandler syncOperationManager](self, "syncOperationManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v10;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v14 = v13;
  else
    v14 = 0;
  v15 = v14;

  if (v15)
  {
    v16 = (void *)MEMORY[0x1D17BA0A0]();
    v17 = self;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = 138544130;
      v34 = v19;
      v35 = 2112;
      v36 = v15;
      v37 = 2112;
      v38 = v9;
      v39 = 2112;
      v40 = v11;
      _os_log_impl(&dword_1CD062000, v18, OS_LOG_TYPE_DEBUG, "%{public}@Received notification operation '%@' property '%@' updated to: %@", (uint8_t *)&v33, 0x2Au);

    }
    objc_autoreleasePoolPop(v16);
    if (objc_msgSend(v9, "isEqualToString:", CFSTR("isExecuting")))
    {
      v20 = (void *)MEMORY[0x1D17BA0A0]();
      v21 = v17;
      HMFGetOSLogHandle();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = 138543362;
        v34 = v23;
        _os_log_impl(&dword_1CD062000, v22, OS_LOG_TYPE_INFO, "%{public}@Disabling syncing", (uint8_t *)&v33, 0xCu);

      }
      objc_autoreleasePoolPop(v20);
      objc_msgSend(v12, "pauseCloudPush");
      objc_msgSend(v15, "removeObserver:forKeyPath:", v21, v9);
    }
    else if (objc_msgSend(v9, "isEqualToString:", CFSTR("isFinished"))
           && objc_msgSend(v15, "isFinished"))
    {
      objc_msgSend(v15, "error");
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      v25 = v24 == 0;
      v26 = (void *)MEMORY[0x1D17BA0A0]();
      v27 = v17;
      HMFGetOSLogHandle();
      v28 = objc_claimAutoreleasedReturnValue();
      v29 = v28;
      if (v25)
      {
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = 138543362;
          v34 = v32;
          _os_log_impl(&dword_1CD062000, v29, OS_LOG_TYPE_INFO, "%{public}@Enabling syncing", (uint8_t *)&v33, 0xCu);

        }
        objc_autoreleasePoolPop(v26);
        objc_msgSend(v12, "resumeCloudPush");
      }
      else
      {
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          HMFGetLogIdentifier();
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "error");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = 138543874;
          v34 = v30;
          v35 = 2112;
          v36 = v15;
          v37 = 2112;
          v38 = v31;
          _os_log_impl(&dword_1CD062000, v29, OS_LOG_TYPE_DEFAULT, "%{public}@Operation '%@' failed, resetting syncing: %@", (uint8_t *)&v33, 0x20u);

        }
        objc_autoreleasePoolPop(v26);
        objc_msgSend(v12, "killCloudPushAndResume");
      }
      objc_msgSend(v15, "removeObserver:forKeyPath:", v27, v9);
    }
  }

}

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[HMDHomeAdministratorHandler home](self, "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (HMDHome)home
{
  return (HMDHome *)objc_loadWeakRetained((id *)&self->_home);
}

- (HMFMessageDispatcher)dispatcher
{
  return (HMFMessageDispatcher *)objc_getProperty(self, a2, 80, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatcher, 0);
  objc_destroyWeak((id *)&self->_home);
  objc_storeStrong((id *)&self->_receivers, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t10_162054 != -1)
    dispatch_once(&logCategory__hmf_once_t10_162054, &__block_literal_global_162055);
  return (id)logCategory__hmf_once_v11_162056;
}

void __42__HMDHomeAdministratorHandler_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v11_162056;
  logCategory__hmf_once_v11_162056 = v0;

}

@end
