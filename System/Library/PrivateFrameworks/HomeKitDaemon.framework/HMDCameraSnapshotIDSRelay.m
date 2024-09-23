@implementation HMDCameraSnapshotIDSRelay

- (HMDCameraSnapshotIDSRelay)initWithSessionID:(id)a3 logIdentifier:(id)a4 workQueue:(id)a5
{
  id v9;
  id v10;
  id v11;
  HMDCameraSnapshotIDSRelay *v12;
  HMDCameraSnapshotIDSRelay *v13;
  void *v14;
  uint64_t v15;
  HMDIDSService *idsStreamService;
  uint64_t v17;
  HMFOSTransaction *snapshotRelayTransaction;
  HMDIDSService *v19;
  void *v20;
  objc_super v22;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v22.receiver = self;
  v22.super_class = (Class)HMDCameraSnapshotIDSRelay;
  v12 = -[HMDCameraSnapshotIDSRelay init](&v22, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_workQueue, a5);
    objc_storeStrong((id *)&v13->_sessionID, a3);
    objc_storeStrong((id *)&v13->_logIdentifier, a4);
    +[HMDIDSServiceManager sharedManager](HMDIDSServiceManager, "sharedManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "streamService");
    v15 = objc_claimAutoreleasedReturnValue();
    idsStreamService = v13->_idsStreamService;
    v13->_idsStreamService = (HMDIDSService *)v15;

    v17 = objc_msgSend(objc_alloc(MEMORY[0x24BE3F200]), "initWithName:", CFSTR("com.apple.homed.snapshot-relay"));
    snapshotRelayTransaction = v13->_snapshotRelayTransaction;
    v13->_snapshotRelayTransaction = (HMFOSTransaction *)v17;

    v19 = v13->_idsStreamService;
    -[HMDCameraSnapshotIDSRelay workQueue](v13, "workQueue");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDIDSService addDelegate:queue:](v19, "addDelegate:queue:", v13, v20);

  }
  return v13;
}

- (void)dealloc
{
  void *v3;
  HMDCameraSnapshotIDSRelay *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  objc_super v8;
  uint8_t buf[4];
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x227676638](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v10 = v6;
    _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@Resetting the SnapshotIDSRelay", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  -[HMDCameraSnapshotIDSRelay idsStreamService](v4, "idsStreamService");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeDelegate:", v4);

  v8.receiver = v4;
  v8.super_class = (Class)HMDCameraSnapshotIDSRelay;
  -[HMDCameraSnapshotIDSRelay dealloc](&v8, sel_dealloc);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 8, 1);
}

- (NSUUID)sessionID
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (HMDIDSService)idsStreamService
{
  return (HMDIDSService *)objc_getProperty(self, a2, 24, 1);
}

- (HMFOSTransaction)snapshotRelayTransaction
{
  return (HMFOSTransaction *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)logIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logIdentifier, 0);
  objc_storeStrong((id *)&self->_snapshotRelayTransaction, 0);
  objc_storeStrong((id *)&self->_idsStreamService, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_153291 != -1)
    dispatch_once(&logCategory__hmf_once_t0_153291, &__block_literal_global_153292);
  return (id)logCategory__hmf_once_v1_153293;
}

void __40__HMDCameraSnapshotIDSRelay_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v1_153293;
  logCategory__hmf_once_v1_153293 = v0;

}

@end
