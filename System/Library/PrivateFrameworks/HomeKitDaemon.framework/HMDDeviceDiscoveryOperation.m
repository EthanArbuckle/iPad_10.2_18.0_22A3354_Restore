@implementation HMDDeviceDiscoveryOperation

- (HMDDeviceDiscoveryOperation)initWithAccount:(id)a3
{
  return -[HMDDeviceDiscoveryOperation initWithAccount:timeout:](self, "initWithAccount:timeout:", a3, 0.0);
}

- (HMDDeviceDiscoveryOperation)initWithAccount:(id)a3 timeout:(double)a4
{
  id v6;
  void *v7;
  void *v8;
  HMDDeviceDiscoveryOperation *v9;

  v6 = a3;
  +[HMDIDSServiceManager sharedManager](HMDIDSServiceManager, "sharedManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "service");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[HMDDeviceDiscoveryOperation initWithAccount:service:timeout:](self, "initWithAccount:service:timeout:", v6, v8, a4);
  return v9;
}

- (HMDDeviceDiscoveryOperation)initWithAccount:(id)a3 service:(id)a4 timeout:(double)a5
{
  id v9;
  id v10;
  double v11;
  HMDDeviceDiscoveryOperation *v12;
  id v13;
  dispatch_queue_t v14;
  OS_dispatch_queue *queue;
  uint64_t v16;
  NSMutableSet *devices;
  objc_super v19;

  v9 = a3;
  v10 = a4;
  if (a5 <= 0.0)
  {
    objc_msgSend((id)objc_opt_class(), "timeout");
    a5 = v11;
  }
  v19.receiver = self;
  v19.super_class = (Class)HMDDeviceDiscoveryOperation;
  v12 = -[HMFOperation initWithTimeout:](&v19, sel_initWithTimeout_, a5);
  if (v12)
  {
    HMDispatchQueueNameString();
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v14 = dispatch_queue_create((const char *)objc_msgSend(v13, "UTF8String"), 0);
    queue = v12->_queue;
    v12->_queue = (OS_dispatch_queue *)v14;

    objc_storeStrong((id *)&v12->_account, a3);
    objc_storeStrong((id *)&v12->_service, a4);
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v16 = objc_claimAutoreleasedReturnValue();
    devices = v12->_devices;
    v12->_devices = (NSMutableSet *)v16;

  }
  return v12;
}

- (NSSet)devices
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = (void *)-[NSMutableSet copy](self->_devices, "copy");
  os_unfair_lock_unlock(p_lock);
  return (NSSet *)v4;
}

- (void)setQualityOfService:(int64_t)a3
{
  NSObject *queue;
  NSObject *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HMDDeviceDiscoveryOperation;
  -[HMFOperation setQualityOfService:](&v7, sel_setQualityOfService_);
  queue = self->_queue;
  dispatch_get_global_queue(a3, 0);
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_set_target_queue(queue, v6);

}

- (void)cancelWithError:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  objc_super v7;

  v4 = a3;
  objc_msgSend(v4, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x24BE3EBB0]))
  {
    v6 = objc_msgSend(v4, "code");

    if (v6 == 13)
    {
      -[HMFOperation finish](self, "finish");
      goto LABEL_6;
    }
  }
  else
  {

  }
  v7.receiver = self;
  v7.super_class = (Class)HMDDeviceDiscoveryOperation;
  -[HMFOperation cancel](&v7, sel_cancel);
LABEL_6:
  if (-[HMFOperation isExecuting](self->_operation, "isExecuting"))
    -[HMFOperation cancel](self->_operation, "cancel");

}

- (void)main
{
  void *v3;
  void *v4;
  HMDRemoteAccountMessageDestination *v5;
  void *v6;
  uint64_t v7;
  HMDRemoteMessage *v8;
  HMDIDSSendMessageOperation *v9;
  HMDIDSSendMessageOperation *operation;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  HMDDeviceDiscoveryOperation *v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  HMDDeviceDiscoveryOperation *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  HMDRemoteMessage *v26;
  void *v27;
  void *v28;
  id obj;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t v34[128];
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  -[HMDDeviceDiscoveryOperation account](self, "account");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "handles");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    v5 = [HMDRemoteAccountMessageDestination alloc];
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[HMDRemoteAccountMessageDestination initWithTarget:handle:multicast:](v5, "initWithTarget:handle:multicast:", v6, v28, 1);

    v27 = (void *)v7;
    v8 = -[HMDRemoteMessage initWithName:qualityOfService:destination:payload:]([HMDRemoteMessage alloc], "initWithName:qualityOfService:destination:payload:", CFSTR("kElectDeviceForIDSSessionKey"), -[HMDDeviceDiscoveryOperation qualityOfService](self, "qualityOfService"), v7, 0);
    -[HMDRemoteMessage setType:](v8, "setType:", 0);
    v26 = v8;
    v9 = -[HMDIDSSendMessageOperation initWithMessage:service:]([HMDIDSSendMessageOperation alloc], "initWithMessage:service:", v8, self->_service);
    operation = self->_operation;
    self->_operation = v9;

    -[HMFOperation setQualityOfService:](self->_operation, "setQualityOfService:", -[HMDDeviceDiscoveryOperation qualityOfService](self, "qualityOfService"));
    -[HMDIDSService addDelegate:queue:](self->_service, "addDelegate:queue:", self, self->_queue);
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    -[HMDAccount devices](self->_account, "devices");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v31 != v12)
            objc_enumerationMutation(obj);
          v14 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
          v15 = (void *)MEMORY[0x227676638]();
          v16 = self;
          HMFGetOSLogHandle();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v36 = v18;
            v37 = 2112;
            v38 = v14;
            _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_INFO, "%{public}@Adding known device: %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v15);
          os_unfair_lock_lock_with_options();
          -[NSMutableSet addObject:](v16->_devices, "addObject:", v14);
          os_unfair_lock_unlock(&v16->_lock);
          -[HMDDeviceDiscoveryOperation discoveryBlock](v16, "discoveryBlock");
          v19 = objc_claimAutoreleasedReturnValue();
          v20 = (void *)v19;
          if (v19)
            (*(void (**)(uint64_t, void *))(v19 + 16))(v19, v14);

        }
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      }
      while (v11);
    }

    -[HMFOperation start](self->_operation, "start");
  }
  else
  {
    v21 = (void *)MEMORY[0x227676638]();
    v22 = self;
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDDeviceDiscoveryOperation account](v22, "account");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v36 = v24;
      v37 = 2112;
      v38 = v25;
      _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_ERROR, "%{public}@Cannot discover devices for account without any handles: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v21);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDDeviceDiscoveryOperation cancelWithError:](v22, "cancelWithError:", v27);
  }

}

- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  void *v28;
  HMDDeviceDiscoveryOperation *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  HMDDeviceDiscoveryOperation *v33;
  NSObject *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  HMDDeviceDiscoveryOperation *v38;
  id v39;
  void *context;
  os_unfair_lock_t lock;
  id v42;
  id v43;
  void *v44;
  id v45;
  void *v46;
  uint8_t buf[4];
  id v48;
  __int16 v49;
  void *v50;
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v42 = a3;
  v43 = a4;
  v45 = a5;
  v12 = a6;
  v13 = a7;
  v44 = v12;
  +[HMDDeviceHandle deviceHandleForDestination:](HMDDeviceHandle, "deviceHandleForDestination:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "accountHandle");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDAccountIdentifier accountIdentifierForMessageContext:](HMDAccountIdentifier, "accountIdentifierForMessageContext:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    -[HMDDeviceDiscoveryOperation account](self, "account");
    a7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a7, "identifier");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v15, "isEqual:", v12) & 1) == 0)
    {

LABEL_14:
      v28 = (void *)MEMORY[0x227676638]();
      v29 = self;
      HMFGetOSLogHandle();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "shortDescription");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v48 = v31;
        v49 = 2112;
        v50 = v32;
        _os_log_impl(&dword_2218F0000, v30, OS_LOG_TYPE_DEBUG, "%{public}@Ignoring message from: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v28);
      goto LABEL_24;
    }
  }
  -[HMDDeviceDiscoveryOperation account](self, "account");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "handles");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "containsObject:", v46);

  if (v15)
  {

  }
  if ((v18 & 1) == 0)
    goto LABEL_14;
  -[HMDIDSSendMessageOperation message](self->_operation, "message");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v20 = v19;
  else
    v20 = 0;
  v21 = v20;

  +[HMDRemoteMessageSerialization remoteMessageWithDictionary:isHH2Payload:error:](HMDRemoteMessageSerialization, "remoteMessageWithDictionary:isHH2Payload:error:", v45, 1, 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "transactionIdentifier");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "transactionIdentifier");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = HMFEqualObjects();

  if (v25)
  {
    +[HMDAccountRegistry sharedRegistry](HMDAccountRegistry, "sharedRegistry");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "deviceForHandle:", v14);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (v27)
    {
      lock = &self->_lock;
      os_unfair_lock_lock_with_options();
      if ((-[NSMutableSet containsObject:](self->_devices, "containsObject:", v27) & 1) != 0)
      {
        os_unfair_lock_unlock(lock);
      }
      else
      {
        context = (void *)MEMORY[0x227676638]();
        v33 = self;
        HMFGetOSLogHandle();
        v34 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
        {
          v38 = v33;
          HMFGetLogIdentifier();
          v39 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "shortDescription");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v48 = v39;
          v49 = 2112;
          v50 = v35;
          _os_log_impl(&dword_2218F0000, v34, OS_LOG_TYPE_INFO, "%{public}@Discovered device: %@", buf, 0x16u);

          v33 = v38;
        }

        objc_autoreleasePoolPop(context);
        -[NSMutableSet addObject:](self->_devices, "addObject:", v27);
        os_unfair_lock_unlock(lock);
        -[HMDDeviceDiscoveryOperation discoveryBlock](v33, "discoveryBlock");
        v36 = objc_claimAutoreleasedReturnValue();
        v37 = (void *)v36;
        if (v36)
          (*(void (**)(uint64_t, void *))(v36 + 16))(v36, v27);

      }
    }

  }
LABEL_24:

}

- (HMDIDSService)service
{
  return (HMDIDSService *)objc_getProperty(self, a2, 344, 1);
}

- (HMDAccount)account
{
  return (HMDAccount *)objc_getProperty(self, a2, 352, 1);
}

- (id)discoveryBlock
{
  return objc_getProperty(self, a2, 360, 1);
}

- (void)setDiscoveryBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 360);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_discoveryBlock, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_devices, 0);
  objc_storeStrong((id *)&self->_operation, 0);
  objc_storeStrong((id *)&self->_queue, 0);
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
  objc_msgSend(v2, "preferenceForKey:", CFSTR("deviceDiscoveryTimeout"));
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
  if (logCategory__hmf_once_t4_42118 != -1)
    dispatch_once(&logCategory__hmf_once_t4_42118, &__block_literal_global_42119);
  return (id)logCategory__hmf_once_v5_42120;
}

void __42__HMDDeviceDiscoveryOperation_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v5_42120;
  logCategory__hmf_once_v5_42120 = v0;

}

@end
