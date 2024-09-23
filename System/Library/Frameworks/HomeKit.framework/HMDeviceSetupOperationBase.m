@implementation HMDeviceSetupOperationBase

- (HMDeviceSetupOperationBase)init
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  v4 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ is unavailable"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (HMDeviceSetupOperationBase)initWithSessionTransport:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  HMDeviceSetupOperationBase *v7;

  v4 = (void *)MEMORY[0x1E0CB3A28];
  v5 = a3;
  objc_msgSend(v4, "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HMDeviceSetupOperationBase initWithSessionTransport:sessionIdentifier:](self, "initWithSessionTransport:sessionIdentifier:", v5, v6);

  return v7;
}

- (HMDeviceSetupOperationBase)initWithSessionTransport:(id)a3 sessionIdentifier:(id)a4
{
  id v6;
  id v7;
  HMDeviceSetupOperationBase *v8;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __73__HMDeviceSetupOperationBase_initWithSessionTransport_sessionIdentifier___block_invoke;
  v10[3] = &unk_1E3AB0DA8;
  v11 = v6;
  v7 = v6;
  v8 = -[HMDeviceSetupOperationBase initWithSessionTransport:setupSessionFactory:](self, "initWithSessionTransport:setupSessionFactory:", a3, v10);

  return v8;
}

- (HMDeviceSetupOperationBase)initWithSessionTransport:(id)a3 setupSessionFactory:(id)a4
{
  id v6;
  void (**v7)(id, HMDeviceSetupOperationBase *);
  HMDeviceSetupOperationBase *v8;
  HMDeviceSetupOperationBase *v9;
  id v10;
  const char *v11;
  NSObject *v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *clientQueue;
  uint64_t v15;
  HMDeviceSetupSession *setupSession;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  objc_super v22;

  v6 = a3;
  v7 = (void (**)(id, HMDeviceSetupOperationBase *))a4;
  v22.receiver = self;
  v22.super_class = (Class)HMDeviceSetupOperationBase;
  v8 = -[HMDeviceSetupOperationBase init](&v22, sel_init);
  v9 = v8;
  if (v8)
  {
    HMDispatchQueueNameString(v8, 0);
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v11 = (const char *)objc_msgSend(v10, "UTF8String");
    dispatch_queue_attr_make_initially_inactive(0);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = dispatch_queue_create(v11, v12);
    clientQueue = v9->_clientQueue;
    v9->_clientQueue = (OS_dispatch_queue *)v13;

    objc_storeWeak((id *)&v9->_sessionTransport, v6);
    v7[2](v7, v9);
    v15 = objc_claimAutoreleasedReturnValue();
    setupSession = v9->_setupSession;
    v9->_setupSession = (HMDeviceSetupSession *)v15;

    v17 = (void *)MEMORY[0x1E0CB3940];
    -[HMDeviceSetupSession identifier](v9->_setupSession, "identifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "UUIDString");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringWithFormat:", CFSTR("DeviceSetupOperation (%@)"), v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDeviceSetupOperationBase setName:](v9, "setName:", v20);

  }
  return v9;
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;

  -[HMDeviceSetupOperationBase clientQueue](self, "clientQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_activate(v3);

  v4.receiver = self;
  v4.super_class = (Class)HMDeviceSetupOperationBase;
  -[HMDeviceSetupOperationBase dealloc](&v4, sel_dealloc);
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (BOOL)isExecuting
{
  HMDeviceSetupOperationBase *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_executing;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setExecuting:(BOOL)a3
{
  -[HMDeviceSetupOperationBase willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isExecuting"));
  os_unfair_lock_lock_with_options();
  self->_executing = a3;
  os_unfair_lock_unlock(&self->_lock);
  -[HMDeviceSetupOperationBase didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isExecuting"));
}

- (BOOL)isFinished
{
  HMDeviceSetupOperationBase *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_finished;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setFinished:(BOOL)a3
{
  -[HMDeviceSetupOperationBase willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isFinished"));
  os_unfair_lock_lock_with_options();
  self->_finished = a3;
  os_unfair_lock_unlock(&self->_lock);
  -[HMDeviceSetupOperationBase didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isFinished"));
}

- (void)finish
{
  -[HMDeviceSetupOperationBase setExecuting:](self, "setExecuting:", 0);
  -[HMDeviceSetupOperationBase setFinished:](self, "setFinished:", 1);
}

- (NSError)error
{
  os_unfair_lock_s *p_lock;
  NSError *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_error;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setError:(id)a3
{
  NSError *v4;
  NSError *error;

  v4 = (NSError *)objc_msgSend(a3, "copy");
  os_unfair_lock_lock_with_options();
  error = self->_error;
  self->_error = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)setQualityOfService:(int64_t)a3
{
  NSObject *clientQueue;
  NSObject *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HMDeviceSetupOperationBase;
  -[HMDeviceSetupOperationBase setQualityOfService:](&v7, sel_setQualityOfService_);
  clientQueue = self->_clientQueue;
  dispatch_get_global_queue(a3, 0);
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_set_target_queue(clientQueue, v6);

}

- (HMAccessory)accessory
{
  os_unfair_lock_s *p_lock;
  HMAccessory *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_accessory;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setAccessory:(id)a3
{
  HMAccessory *v4;
  HMAccessory *accessory;

  v4 = (HMAccessory *)a3;
  os_unfair_lock_lock_with_options();
  accessory = self->_accessory;
  self->_accessory = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)start
{
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  HMDeviceSetupOperationBase *v6;
  void *v7;
  HMDeviceSetupOperationBase *v8;
  NSObject *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  HMDeviceSetupOperationBase *v13;
  _QWORD block[5];
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (-[HMDeviceSetupOperationBase isExecuting](self, "isExecuting"))
  {
    v5 = MEMORY[0x1A1AC1AAC]();
    v6 = self;
    v7 = (void *)v5;
    v8 = v6;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      goto LABEL_9;
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v16 = v10;
    v11 = "%{public}@Operation is already executing";
    goto LABEL_8;
  }
  if ((-[HMDeviceSetupOperationBase isReady](self, "isReady") & 1) == 0)
  {
    v12 = MEMORY[0x1A1AC1AAC]();
    v13 = self;
    v7 = (void *)v12;
    v8 = v13;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      goto LABEL_9;
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v16 = v10;
    v11 = "%{public}@Operation is not ready";
LABEL_8:
    _os_log_impl(&dword_19B1B0000, v9, OS_LOG_TYPE_ERROR, v11, buf, 0xCu);

LABEL_9:
    objc_autoreleasePoolPop(v7);
    objc_exception_throw(objc_retainAutorelease((id)*MEMORY[0x1E0C99778]));
  }
  -[HMDeviceSetupOperationBase clientQueue](self, "clientQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_activate(v3);

  -[HMDeviceSetupOperationBase clientQueue](self, "clientQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__HMDeviceSetupOperationBase_start__block_invoke;
  block[3] = &unk_1E3AB5E18;
  block[4] = self;
  dispatch_async(v4, block);

}

- (void)cancel
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 23);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[HMDeviceSetupOperationBase cancelWithError:](self, "cancelWithError:", v3);

}

- (void)cancelWithError:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  -[HMDeviceSetupOperationBase clientQueue](self, "clientQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_activate(v5);

  -[HMDeviceSetupOperationBase clientQueue](self, "clientQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __46__HMDeviceSetupOperationBase_cancelWithError___block_invoke;
  v8[3] = &unk_1E3AB5ED8;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(v6, v8);

}

- (void)setupSession:(id)a3 didCloseWithError:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  HMDeviceSetupOperationBase *v14;
  id v15;

  v6 = a3;
  v7 = a4;
  -[HMDeviceSetupOperationBase clientQueue](self, "clientQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_activate(v8);

  -[HMDeviceSetupOperationBase clientQueue](self, "clientQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__HMDeviceSetupOperationBase_setupSession_didCloseWithError___block_invoke;
  block[3] = &unk_1E3AB5CD0;
  v13 = v7;
  v14 = self;
  v15 = v6;
  v10 = v6;
  v11 = v7;
  dispatch_async(v9, block);

}

- (void)setupSession:(id)a3 didReceiveExchangeData:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;

  v7 = a4;
  v8 = a5;
  -[HMDeviceSetupOperationBase clientQueue](self, "clientQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __84__HMDeviceSetupOperationBase_setupSession_didReceiveExchangeData_completionHandler___block_invoke;
  block[3] = &unk_1E3AB5C58;
  v13 = v7;
  v14 = v8;
  block[4] = self;
  v10 = v7;
  v11 = v8;
  dispatch_async(v9, block);

}

- (id)logIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  -[HMDeviceSetupOperationBase setupSession](self, "setupSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (HMDeviceSetupOperationTransport)sessionTransport
{
  return (HMDeviceSetupOperationTransport *)objc_loadWeakRetained((id *)&self->_sessionTransport);
}

- (OS_dispatch_queue)clientQueue
{
  return self->_clientQueue;
}

- (HMDeviceSetupSession)setupSession
{
  return self->_setupSession;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_setupSession, 0);
  objc_storeStrong((id *)&self->_clientQueue, 0);
  objc_destroyWeak((id *)&self->_sessionTransport);
  objc_storeStrong((id *)&self->_accessory, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

void __84__HMDeviceSetupOperationBase_setupSession_didReceiveExchangeData_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "sessionTransport");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1A1AC1AAC]();
  v4 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v2)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v16 = v7;
      v17 = 2112;
      v18 = v2;
      _os_log_impl(&dword_19B1B0000, v6, OS_LOG_TYPE_INFO, "%{public}@Sending exchange data using session transport: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v3);
    v8 = *(_QWORD *)(a1 + 40);
    v9 = objc_msgSend(*(id *)(a1 + 32), "qualityOfService");
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __84__HMDeviceSetupOperationBase_setupSession_didReceiveExchangeData_completionHandler___block_invoke_27;
    v13[3] = &unk_1E3AAE068;
    v14 = *(id *)(a1 + 48);
    objc_msgSend(v2, "sendRequestData:qualityOfService:responseHandler:", v8, v9, v13);
    v10 = v14;
    goto LABEL_9;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v16 = v11;
    _os_log_impl(&dword_19B1B0000, v6, OS_LOG_TYPE_FAULT, "%{public}@Session transport is unexpectedly nil", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  v12 = *(_QWORD *)(a1 + 48);
  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmPrivateErrorWithCode:", 9000);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v12 + 16))(v12, 0, v10);
LABEL_9:

  }
}

uint64_t __84__HMDeviceSetupOperationBase_setupSession_didReceiveExchangeData_completionHandler___block_invoke_27(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(result + 16))(result, a3, a2);
  return result;
}

void __61__HMDeviceSetupOperationBase_setupSession_didCloseWithError___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  id v18;
  _BYTE buf[24];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(*(id *)(a1 + 40), "setExecuting:", 0);
    objc_msgSend(*(id *)(a1 + 40), "cancelWithError:", *(_QWORD *)(a1 + 32));
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "userInfo");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "hmf_dataForKey:", CFSTR("kAccessoryDataKey"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      v18 = 0;
      objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v3, &v18);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v18;
      if (v4)
      {
        v6 = v4;
        if (!objc_msgSend(v6, "supportedStereoPairVersions"))
        {
          *(_OWORD *)buf = *MEMORY[0x1E0D280A0];
          *(_QWORD *)&buf[16] = *(_QWORD *)(MEMORY[0x1E0D280A0] + 16);
          objc_msgSend(MEMORY[0x1E0D286A0], "versionFromOperatingSystemVersion:", buf);
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          if (+[HMMediaSystemBuilder supportsMediaSystem:](HMMediaSystemBuilder, "supportsMediaSystem:", v6))
          {
            objc_msgSend(v6, "softwareVersion");
            v8 = (void *)objc_claimAutoreleasedReturnValue();
            v9 = objc_msgSend(v8, "isAtLeastVersion:", v7);

            if ((v9 & 1) == 0)
              objc_msgSend(v6, "setSupportedStereoPairVersions:", 1);
          }

        }
        v10 = (void *)MEMORY[0x1A1AC1AAC]();
        v11 = *(id *)(a1 + 40);
        HMFGetOSLogHandle();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          *(_QWORD *)&buf[4] = v13;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v6;
          _os_log_impl(&dword_19B1B0000, v12, OS_LOG_TYPE_INFO, "%{public}@Finished setup operation with accessory: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v10);
        objc_msgSend(*(id *)(a1 + 40), "setAccessory:", v6);
      }
      else
      {
        v14 = (void *)MEMORY[0x1A1AC1AAC]();
        v15 = *(id *)(a1 + 40);
        HMFGetOSLogHandle();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          *(_QWORD *)&buf[4] = v17;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v5;
          _os_log_impl(&dword_19B1B0000, v16, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive accessory from accessory data: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v14);
      }

    }
    objc_msgSend(*(id *)(a1 + 40), "finish");

  }
}

void __46__HMDeviceSetupOperationBase_cancelWithError___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  char v7;
  void *v8;
  void *v9;
  objc_super v10;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(a1 + 32), "isFinished") & 1) == 0
    && (objc_msgSend(*(id *)(a1 + 32), "isCancelled") & 1) == 0)
  {
    v2 = (void *)MEMORY[0x1A1AC1AAC]();
    v3 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v12 = v5;
      v13 = 2112;
      v14 = v6;
      _os_log_impl(&dword_19B1B0000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@Cancelling with error: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v2);
    if (*(_QWORD *)(a1 + 40))
      objc_msgSend(*(id *)(a1 + 32), "setError:");
    v10.receiver = *(id *)(a1 + 32);
    v10.super_class = (Class)HMDeviceSetupOperationBase;
    objc_msgSendSuper2(&v10, sel_cancel);
    v7 = objc_msgSend(*(id *)(a1 + 32), "isExecuting");
    v8 = *(void **)(a1 + 32);
    if ((v7 & 1) != 0)
    {
      objc_msgSend(v8, "setupSession");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "close");

    }
    else
    {
      objc_msgSend(v8, "finish");
    }
  }
}

void __35__HMDeviceSetupOperationBase_start__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v1 = *(id *)(a1 + 32);
  v2 = v1;
  if (v1)
  {
    if ((objc_msgSend(v1, "isFinished") & 1) != 0 || objc_msgSend(v2, "isCancelled"))
    {
      v3 = (void *)MEMORY[0x1A1AC1AAC]();
      v4 = v2;
      HMFGetOSLogHandle();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = 138543362;
        v14 = v6;
        _os_log_impl(&dword_19B1B0000, v5, OS_LOG_TYPE_INFO, "%{public}@Operation is already complete, aborting.", (uint8_t *)&v13, 0xCu);

      }
      objc_autoreleasePoolPop(v3);
    }
    else
    {
      v7 = (void *)MEMORY[0x1A1AC1AAC]();
      v8 = v2;
      HMFGetOSLogHandle();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = 138543362;
        v14 = v10;
        _os_log_impl(&dword_19B1B0000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@Starting operation", (uint8_t *)&v13, 0xCu);

      }
      objc_autoreleasePoolPop(v7);
      objc_msgSend(v8, "setExecuting:", 1);
      objc_msgSend(v8, "setupSession");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "configure");

      objc_msgSend(v8, "setupSession");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "open");

    }
  }

}

HMDeviceSetupSession *__73__HMDeviceSetupOperationBase_initWithSessionTransport_sessionIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  HMDeviceSetupSession *v4;

  v3 = a2;
  v4 = -[HMDeviceSetupSession initWithRole:identifier:delegate:]([HMDeviceSetupSession alloc], "initWithRole:identifier:delegate:", 0, *(_QWORD *)(a1 + 32), v3);

  return v4;
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("executing")) & 1) != 0)
    LOBYTE(v4) = 0;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("finished")) ^ 1;

  return v4;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t17 != -1)
    dispatch_once(&logCategory__hmf_once_t17, &__block_literal_global_5977);
  return (id)logCategory__hmf_once_v18;
}

void __41__HMDeviceSetupOperationBase_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v18;
  logCategory__hmf_once_v18 = v0;

}

@end
