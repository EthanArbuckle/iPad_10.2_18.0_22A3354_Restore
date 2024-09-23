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
  v5 = (void *)MEMORY[0x24BDBCE88];
  v6 = *MEMORY[0x24BDBCAB0];
  v7 = (void *)MEMORY[0x24BDD17C8];
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
      v12 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x24BDD1710]);
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
      v17 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1650]), "initWithKeyOptions:valueOptions:capacity:", 517, 0, 0);
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

- (BOOL)allowLocalFallbackForMessage:(id)a3
{
  id v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a3;
  objc_msgSend(v3, "clientName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqual:", *MEMORY[0x24BDD5C08]) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    objc_msgSend(v3, "clientName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "isEqual:", *MEMORY[0x24BDD69E8]) & 1) != 0)
    {
      v5 = 1;
    }
    else
    {
      objc_msgSend(v3, "clientName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v7, "isEqual:", *MEMORY[0x24BDD6F78]) & 1) != 0)
      {
        v5 = 1;
      }
      else if (isInternalBuild())
      {
        objc_msgSend(v3, "clientName");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v8, "isEqual:", *MEMORY[0x24BDD5C00]) & 1) != 0)
        {
          v5 = 1;
        }
        else
        {
          objc_msgSend(v3, "clientName");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v5 = objc_msgSend(v9, "isEqual:", *MEMORY[0x24BDD6F80]);

        }
      }
      else
      {
        v5 = 0;
      }

    }
  }

  return v5;
}

- (BOOL)shouldRelayMessage:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  _BOOL4 v7;
  BOOL v8;
  BOOL v9;
  BOOL v10;
  void *v11;
  HMDHomeAdministratorHandler *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (-[HMDHomeAdministratorHandler shouldRelayMessages](self, "shouldRelayMessages"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_home);
    objc_msgSend(WeakRetained, "deviceHomeKitSetupSession");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[HMDHomeAdministratorHandler allowLocalFallbackForMessage:](self, "allowLocalFallbackForMessage:", v4);
    if (WeakRetained)
      v8 = !v7;
    else
      v8 = 1;
    v9 = v8 || v6 == 0;
    if (v9 || (objc_msgSend(v6, "shouldRelayRequest") & 1) != 0)
    {
      v10 = 1;
    }
    else
    {
      v11 = (void *)MEMORY[0x227676638]();
      v12 = self;
      HMFGetOSLogHandle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "shortDescription");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "clientName");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "isFirstResidentForHome");
        HMFBooleanToString();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "hasFailedRelayAttempt");
        HMFBooleanToString();
        v20 = v11;
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544386;
        v22 = v14;
        v23 = 2112;
        v24 = v15;
        v25 = 2112;
        v26 = v16;
        v27 = 2112;
        v28 = v17;
        v29 = 2112;
        v30 = v18;
        _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Skip attempt to relay message %@ from client %@, firstResidentForHome=%@, hasFailedRelayAttempt=%@", buf, 0x34u);

        v11 = v20;
      }

      objc_autoreleasePoolPop(v11);
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)shouldRelayMessages
{
  id WeakRetained;
  void *v3;
  int v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_home);
  v3 = WeakRetained;
  if (WeakRetained && (objc_msgSend(WeakRetained, "isSharedAdmin") & 1) == 0)
  {
    if (objc_msgSend(v3, "hasAnyResident"))
      v4 = objc_msgSend(v3, "isCurrentDeviceConfirmedPrimaryResident") ^ 1;
    else
      LOBYTE(v4) = 0;
  }
  else
  {
    LOBYTE(v4) = 1;
  }

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
        v12 = (void *)MEMORY[0x24BDD1540];
        v13 = CFSTR("Dispatcher is nil.");
        v14 = -1;
        goto LABEL_11;
      }
    }
    else if (a4)
    {
      v12 = (void *)MEMORY[0x24BDD1540];
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
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 20);
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
  int v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    v5 = (void *)MEMORY[0x227676638]();
    v6 = self;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543618;
      v10 = v8;
      v11 = 2112;
      v12 = v4;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Adding operation: %@", (uint8_t *)&v9, 0x16u);

    }
    objc_autoreleasePoolPop(v5);
    -[NSOperationQueue addOperation:](v6->_queue, "addOperation:", v4);
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
  if (logCategory__hmf_once_t4_225339 != -1)
    dispatch_once(&logCategory__hmf_once_t4_225339, &__block_literal_global_225340);
  return (id)logCategory__hmf_once_v5_225341;
}

void __42__HMDHomeAdministratorHandler_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v5_225341;
  logCategory__hmf_once_v5_225341 = v0;

}

@end
