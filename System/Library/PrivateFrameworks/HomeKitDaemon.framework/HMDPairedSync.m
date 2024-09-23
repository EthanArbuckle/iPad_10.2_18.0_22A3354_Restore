@implementation HMDPairedSync

- (HMDPairedSync)initWithQueue:(id)a3
{
  id v4;
  HMDPairedSync *v5;
  uint64_t v6;
  PSYSyncCoordinator *coordinator;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDPairedSync;
  v5 = -[HMDPairedSync init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BE6E698], "syncCoordinatorWithServiceName:", CFSTR("com.apple.pairedsync.homekit"));
    v6 = objc_claimAutoreleasedReturnValue();
    coordinator = v5->_coordinator;
    v5->_coordinator = (PSYSyncCoordinator *)v6;

    -[PSYSyncCoordinator setDelegate:queue:](v5->_coordinator, "setDelegate:queue:", v5, v4);
  }

  return v5;
}

- (void)syncCoordinator:(id)a3 beginSyncSession:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDPairedSync *v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x227676638]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543362;
    v13 = v11;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Received an update to being-sync-session to watch but no companion sync is needed for HH2", (uint8_t *)&v12, 0xCu);

  }
  objc_autoreleasePoolPop(v8);
  objc_msgSend(v7, "syncDidComplete");

}

- (PSYSyncCoordinator)coordinator
{
  return self->_coordinator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coordinator, 0);
}

@end
