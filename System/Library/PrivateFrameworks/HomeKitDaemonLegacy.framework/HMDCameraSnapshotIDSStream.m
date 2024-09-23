@implementation HMDCameraSnapshotIDSStream

- (HMDCameraSnapshotIDSStream)initWithSessionID:(id)a3 workQueue:(id)a4 proxyService:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  HMDCameraSnapshotIDSStream *v13;
  HMDCameraSnapshotIDSStream *v14;
  uint64_t v15;
  HMFOSTransaction *snapshotStreamTransaction;
  HMDIDSService *idsProxyService;
  void *v18;
  void *v19;
  HMDCameraSnapshotIDSStream *result;
  HMDCameraSnapshotIDSStream *v21;
  SEL v22;
  objc_super v23;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v9)
  {
    _HMFPreconditionFailure();
    goto LABEL_8;
  }
  if (!v10)
  {
LABEL_8:
    _HMFPreconditionFailure();
    goto LABEL_9;
  }
  v12 = v11;
  if (!v11)
  {
LABEL_9:
    v21 = (HMDCameraSnapshotIDSStream *)_HMFPreconditionFailure();
    -[HMDCameraSnapshotIDSStream dealloc](v21, v22);
    return result;
  }
  v23.receiver = self;
  v23.super_class = (Class)HMDCameraSnapshotIDSStream;
  v13 = -[HMDCameraSnapshotIDSStream init](&v23, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_workQueue, a4);
    objc_storeStrong((id *)&v14->_sessionID, a3);
    objc_storeStrong((id *)&v14->_idsProxyService, a5);
    v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0D28628]), "initWithName:", CFSTR("com.apple.homed.snapshot-stream"));
    snapshotStreamTransaction = v14->_snapshotStreamTransaction;
    v14->_snapshotStreamTransaction = (HMFOSTransaction *)v15;

    idsProxyService = v14->_idsProxyService;
    -[HMDCameraSnapshotIDSStream workQueue](v14, "workQueue");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDIDSService addDelegate:queue:](idsProxyService, "addDelegate:queue:", v14, v18);

    +[HMDIDSServiceManager sharedManager](HMDIDSServiceManager, "sharedManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addProxyServiceLinkPreferencesAssertionHolder:", v14);

  }
  return v14;
}

- (void)dealloc
{
  void *v3;
  HMDCameraSnapshotIDSStream *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  objc_super v8;
  uint8_t buf[4];
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D17BA0A0](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v10 = v6;
    _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_INFO, "%{public}@Resetting the HMDCameraSnapshotIDSStream", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  -[HMDCameraSnapshotIDSStream idsProxyService](v4, "idsProxyService");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeDelegate:", v4);

  v8.receiver = v4;
  v8.super_class = (Class)HMDCameraSnapshotIDSStream;
  -[HMDCameraSnapshotIDSStream dealloc](&v8, sel_dealloc);
}

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[HMDCameraSnapshotIDSStream sessionID](self, "sessionID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 8, 1);
}

- (HMDCameraSnapshotSessionID)sessionID
{
  return (HMDCameraSnapshotSessionID *)objc_getProperty(self, a2, 16, 1);
}

- (HMDIDSService)idsProxyService
{
  return (HMDIDSService *)objc_getProperty(self, a2, 24, 1);
}

- (HMFOSTransaction)snapshotStreamTransaction
{
  return (HMFOSTransaction *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snapshotStreamTransaction, 0);
  objc_storeStrong((id *)&self->_idsProxyService, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t1_85769 != -1)
    dispatch_once(&logCategory__hmf_once_t1_85769, &__block_literal_global_85770);
  return (id)logCategory__hmf_once_v2_85771;
}

void __41__HMDCameraSnapshotIDSStream_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v2_85771;
  logCategory__hmf_once_v2_85771 = v0;

}

@end
