@implementation HMDUserActivityStateDetectorManager

- (HMDUserActivityStateDetectorManager)initWithHome:(id)a3
{
  id v4;
  HMDHomeActivityStateManagerDataSource *v5;
  void *v6;
  HMDHomeAwayStateDetector *v7;
  HMDUserActivityType3Detector *v8;
  HMDUserActivityType6Detector *v9;
  HMDUserActivityStateType4Detector *v10;
  void *v11;
  HMDUserActivityStateDetectorManager *v12;
  _QWORD v14[5];

  v14[4] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = -[HMDHomeActivityStateManagerDataSource initWithHome:]([HMDHomeActivityStateManagerDataSource alloc], "initWithHome:", v4);
  +[HMDUserActivityReportCoordinatorFactory coordinatorWithHome:](HMDUserActivityReportCoordinatorFactory, "coordinatorWithHome:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[HMDUserActivityStateDetector initWithDataSource:]([HMDHomeAwayStateDetector alloc], "initWithDataSource:", v5);
  v14[0] = v7;
  v8 = -[HMDUserActivityType3Detector initWithDataSource:]([HMDUserActivityType3Detector alloc], "initWithDataSource:", v5);
  v14[1] = v8;
  v9 = -[HMDUserActivityType6Detector initWithDataSource:]([HMDUserActivityType6Detector alloc], "initWithDataSource:", v5);
  v14[2] = v9;
  v10 = -[HMDUserActivityStateType4Detector initWithDataSource:]([HMDUserActivityStateType4Detector alloc], "initWithDataSource:", v5);
  v14[3] = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[HMDUserActivityStateDetectorManager initWithDataSource:userActivityReportCoordinator:detectors:](self, "initWithDataSource:userActivityReportCoordinator:detectors:", v5, v6, v11);
  return v12;
}

- (HMDUserActivityStateDetectorManager)initWithDataSource:(id)a3 userActivityReportCoordinator:(id)a4 detectors:(id)a5
{
  id v9;
  id v10;
  id v11;
  HMDUserActivityStateDetectorManager *v12;
  HMDUserActivityStateDetectorManager *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HMDUserActivityStateDetectorManager;
  v12 = -[HMDUserActivityStateDetectorManager init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_dataSource, a3);
    objc_storeStrong((id *)&v13->_userActivityReportCoordinator, a4);
    objc_storeStrong((id *)&v13->_detectors, a5);
  }

  return v13;
}

- (void)configure
{
  void *v3;
  NSObject *v4;
  _QWORD block[5];

  -[HMDUserActivityStateDetectorManager dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __48__HMDUserActivityStateDetectorManager_configure__block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(v4, block);

}

- (void)registerForNotifications
{
  void *v3;
  id v4;

  -[HMDUserActivityStateDetectorManager dataSource](self, "dataSource");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "notificationCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_handlePrimaryResidentDidChangeNotification_, CFSTR("HMDResidentDeviceManagerUpdatePrimaryResidentGenerationIDNotification"), 0);

}

- (void)handlePrimaryResidentDidChangeNotification:(id)a3
{
  id v3;

  -[HMDUserActivityStateDetectorManager userActivityReportCoordinator](self, "userActivityReportCoordinator", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sendCoordinatedReportsForReason:", 7);

}

- (HMDHomeActivityStateManagerDataSource)dataSource
{
  return self->_dataSource;
}

- (HMDUserActivityReportCoordinator)userActivityReportCoordinator
{
  return self->_userActivityReportCoordinator;
}

- (NSArray)detectors
{
  return self->_detectors;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detectors, 0);
  objc_storeStrong((id *)&self->_userActivityReportCoordinator, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
}

void __48__HMDUserActivityStateDetectorManager_configure__block_invoke(uint64_t a1)
{
  dispatch_group_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  _QWORD block[5];
  _QWORD v10[4];
  dispatch_group_t v11;
  uint64_t v12;

  v2 = dispatch_group_create();
  objc_msgSend(*(id *)(a1 + 32), "detectors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x24BDAC760];
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __48__HMDUserActivityStateDetectorManager_configure__block_invoke_2;
  v10[3] = &unk_24E79BB50;
  v5 = *(_QWORD *)(a1 + 32);
  v11 = v2;
  v12 = v5;
  v6 = v2;
  objc_msgSend(v3, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v10);

  objc_msgSend(*(id *)(a1 + 32), "dataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = v4;
  block[1] = 3221225472;
  block[2] = __48__HMDUserActivityStateDetectorManager_configure__block_invoke_4;
  block[3] = &unk_24E79C240;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_group_notify(v6, v8, block);

}

void __48__HMDUserActivityStateDetectorManager_configure__block_invoke_2(uint64_t a1, void *a2)
{
  NSObject *v3;
  id v4;
  id v5;
  int8x16_t v6;
  _QWORD v7[4];
  int8x16_t v8;

  v3 = *(NSObject **)(a1 + 32);
  v4 = a2;
  dispatch_group_enter(v3);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __48__HMDUserActivityStateDetectorManager_configure__block_invoke_3;
  v7[3] = &unk_24E79C268;
  v6 = *(int8x16_t *)(a1 + 32);
  v5 = (id)v6.i64[0];
  v8 = vextq_s8(v6, v6, 8uLL);
  objc_msgSend(v4, "configureWithCompletion:", v7);

}

uint64_t __48__HMDUserActivityStateDetectorManager_configure__block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "userActivityReportCoordinator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "detectors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "configureWithDetectors:", v3);

  return objc_msgSend(*(id *)(a1 + 32), "registerForNotifications");
}

void __48__HMDUserActivityStateDetectorManager_configure__block_invoke_3(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

+ (BOOL)shouldRunManagerForHome:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "currentUser");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 && (objc_msgSend(v5, "isAllowedToContributeActivityStates") & 1) != 0)
  {
    v7 = isThisDeviceDesignatedFMFDevice();
  }
  else
  {
    v8 = (void *)MEMORY[0x227676638]();
    v9 = a1;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543362;
      v14 = v11;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@HMDUserActivityStateDetectorManager is not allowed due to user policy", (uint8_t *)&v13, 0xCu);

    }
    objc_autoreleasePoolPop(v8);
    v7 = 0;
  }

  return v7;
}

@end
