@implementation HMDKeyTransferAgent

- (HMDKeyTransferAgent)initWithHomeManager:(id)a3
{
  id v4;
  HMDKeyTransferAgent *v5;
  HMDKeyTransferAgent *v6;
  uint64_t v7;
  NSUUID *uuid;
  void *v9;
  void *v10;
  id v11;
  const char *v12;
  NSObject *v13;
  dispatch_queue_t v14;
  OS_dispatch_queue *workQueue;
  NSString *progressState;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)HMDKeyTransferAgent;
  v5 = -[HMDKeyTransferAgent init](&v18, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_homeManager, v4);
    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("234BC343-7465-4AEE-AE7B-F2DC3F80C9FF"));
    uuid = v6->_uuid;
    v6->_uuid = (NSUUID *)v7;

    -[NSUUID UUIDString](v6->_uuid, "UUIDString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("com.apple.hmd.kta."), "stringByAppendingString:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_retainAutorelease(v10);
    v12 = (const char *)objc_msgSend(v11, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = dispatch_queue_create(v12, v13);
    workQueue = v6->_workQueue;
    v6->_workQueue = (OS_dispatch_queue *)v14;

    v6->_residentProvisioningStatus = 0;
    progressState = v6->_progressState;
    v6->_progressState = 0;

  }
  return v6;
}

- (void)beginPairingWithCompletionHandler:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  HMDKeyTransferAgent *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *))a3;
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543362;
    v11 = v8;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_ERROR, "%{public}@- (void)beginPairingWithCompletionHandler: may only be called on an Server.", (uint8_t *)&v10, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB8C70], 10, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v4[2](v4, v9);

}

- (void)resetConfig
{
  void *v3;
  HMDKeyTransferAgent *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D17BA0A0](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v6;
    _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_ERROR, "%{public}@- (void)resetConfig is only useful on a Client", (uint8_t *)&v7, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
}

- (HMFMessageDestination)messageDestination
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0D285D8]);
  -[HMDKeyTransferAgent messageTargetUUID](self, "messageTargetUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithTarget:", v4);

  return (HMFMessageDestination *)v5;
}

- (NSString)progressState
{
  return self->_progressState;
}

- (void)setProgressState:(id)a3
{
  objc_storeStrong((id *)&self->_progressState, a3);
}

- (unint64_t)residentProvisioningStatus
{
  return self->_residentProvisioningStatus;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
  objc_storeStrong((id *)&self->_workQueue, a3);
}

- (HMDHomeManager)homeManager
{
  return (HMDHomeManager *)objc_loadWeakRetained((id *)&self->_homeManager);
}

- (void)setHomeManager:(id)a3
{
  objc_storeWeak((id *)&self->_homeManager, a3);
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
  objc_storeStrong((id *)&self->_uuid, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_destroyWeak((id *)&self->_homeManager);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_progressState, 0);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t2_94761 != -1)
    dispatch_once(&logCategory__hmf_once_t2_94761, &__block_literal_global_94762);
  return (id)logCategory__hmf_once_v3_94763;
}

void __34__HMDKeyTransferAgent_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v3_94763;
  logCategory__hmf_once_v3_94763 = v0;

}

@end
