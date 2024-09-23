@implementation HMDeviceSetupOperationHandlerBase

- (HMDeviceSetupOperationHandlerBase)init
{
  return -[HMDeviceSetupOperationHandlerBase initWithSetupSessionFactory:](self, "initWithSetupSessionFactory:", &__block_literal_global_21263);
}

- (HMDeviceSetupOperationHandlerBase)initWithSetupSessionFactory:(id)a3
{
  void (**v4)(id, HMDeviceSetupOperationHandlerBase *);
  HMDeviceSetupOperationHandlerBase *v5;
  uint64_t v6;
  HMDeviceSetupSession *setupSession;
  objc_super v9;

  v4 = (void (**)(id, HMDeviceSetupOperationHandlerBase *))a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDeviceSetupOperationHandlerBase;
  v5 = -[HMDeviceSetupOperationHandlerBase init](&v9, sel_init);
  if (v5)
  {
    v4[2](v4, v5);
    v6 = objc_claimAutoreleasedReturnValue();
    setupSession = v5->_setupSession;
    v5->_setupSession = (HMDeviceSetupSession *)v6;

  }
  return v5;
}

- (void)dealloc
{
  void *v3;
  HMDeviceSetupOperationHandlerBase *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  objc_super v8;
  uint8_t buf[4];
  void *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1A1AC1AAC](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v10 = v6;
    v11 = 2112;
    v12 = objc_opt_class();
    _os_log_impl(&dword_19B1B0000, v5, OS_LOG_TYPE_INFO, "%{public}@Deallocating %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v3);
  -[HMDeviceSetupOperationHandlerBase setupSession](v4, "setupSession");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cleanUpSession");

  v8.receiver = v4;
  v8.super_class = (Class)HMDeviceSetupOperationHandlerBase;
  -[HMDeviceSetupOperationHandlerBase dealloc](&v8, sel_dealloc);
}

- (void)configureSessionForMessages
{
  void *v3;
  id v4;

  -[HMDeviceSetupOperationHandlerBase setupSession](self, "setupSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "configure");

  -[HMDeviceSetupOperationHandlerBase setupSession](self, "setupSession");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "open");

}

- (void)setupSession:(id)a3 didReceiveExchangeData:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD, void *);
  void *v11;
  HMDeviceSetupOperationHandlerBase *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD, void *))a5;
  v11 = (void *)MEMORY[0x1A1AC1AAC]();
  v12 = self;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138543362;
    v17 = v14;
    _os_log_impl(&dword_19B1B0000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@Received request to send unexpected received exchange data, dropping", (uint8_t *)&v16, 0xCu);

  }
  objc_autoreleasePoolPop(v11);
  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 48);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, 0, v15);

  }
}

- (id)logIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  -[HMDeviceSetupOperationHandlerBase setupSession](self, "setupSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (HMDeviceSetupSession)setupSession
{
  return self->_setupSession;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_setupSession, 0);
}

HMDeviceSetupSession *__41__HMDeviceSetupOperationHandlerBase_init__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  HMDeviceSetupSession *v3;
  void *v4;
  HMDeviceSetupSession *v5;

  v2 = a2;
  v3 = [HMDeviceSetupSession alloc];
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[HMDeviceSetupSession initWithRole:identifier:delegate:](v3, "initWithRole:identifier:delegate:", 1, v4, v2);

  return v5;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t2_21268 != -1)
    dispatch_once(&logCategory__hmf_once_t2_21268, &__block_literal_global_6_21269);
  return (id)logCategory__hmf_once_v3_21270;
}

void __48__HMDeviceSetupOperationHandlerBase_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v3_21270;
  logCategory__hmf_once_v3_21270 = v0;

}

@end
