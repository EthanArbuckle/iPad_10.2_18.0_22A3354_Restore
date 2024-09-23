@implementation HMIPersonsModelsSummaryTask

- (HMIPersonsModelsSummaryTask)initWithTaskID:(int)a3 homeUUID:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HMIPersonsModelsSummaryTask;
  return -[HMIHomeTask initWithTaskID:homeUUID:timeout:](&v5, sel_initWithTaskID_homeUUID_timeout_, *(_QWORD *)&a3, a4, 30.0);
}

- (void)mainInsideAutoreleasePool
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  HMIPersonsModelsSummaryTask *v8;
  NSObject *v9;
  void *v10;
  id v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  +[HMIPersonsModelManager sharedInstance](HMIPersonsModelManager, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMIHomeTask homeUUID](self, "homeUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  objc_msgSend(v3, "summaryForHomeUUID:error:", v4, &v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v11;

  if (v5)
  {
    +[HMIAnalytics sendEventForPersonsModels:](HMIAnalytics, "sendEventForPersonsModels:", v5);
    -[HMFOperation finish](self, "finish");
  }
  else
  {
    v7 = (void *)MEMORY[0x220735570]();
    v8 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v13 = v10;
      v14 = 2112;
      v15 = v6;
      _os_log_impl(&dword_219D45000, v9, OS_LOG_TYPE_ERROR, "%{public}@Failed to generate persons model summary, error:%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    -[HMFOperation cancelWithError:](v8, "cancelWithError:", v6);
  }

}

@end
