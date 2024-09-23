@implementation HMDResidentSelectionManagerDefaultDataSource

- (HMDResidentSelectionManagerDefaultDataSource)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HMDResidentSelectionManagerDefaultDataSource;
  return -[HMDResidentSelectionManagerDefaultDataSource init](&v3, sel_init);
}

- (id)createResidentSelectionModeWithType:(unint64_t)a3 context:(id)a4
{
  id v6;
  void *v7;
  HMDResidentSelectionManagerDefaultDataSource *v8;
  NSObject *v9;
  void *v10;
  __CFString *v11;
  void *v12;
  uint64_t v13;
  __objc2_class *v14;
  int v16;
  void *v17;
  __int16 v18;
  const __CFString *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  switch(a3)
  {
    case 0uLL:
      v7 = (void *)MEMORY[0x227676638]();
      v8 = self;
      HMFGetOSLogHandle();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = CFSTR("unknown");
        v16 = 138543618;
        v17 = v10;
        v18 = 2112;
        v19 = CFSTR("unknown");
        _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_ERROR, "%{public}@%@ is not supported.", (uint8_t *)&v16, 0x16u);

      }
      objc_autoreleasePoolPop(v7);
      goto LABEL_5;
    case 1uLL:
      -[HMDResidentSelectionManagerDefaultDataSource createCoordinationElectionModeWithContext:](self, "createCoordinationElectionModeWithContext:", v6);
      v13 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    case 2uLL:
      v14 = HMDResidentSelectionManualMode;
      goto LABEL_9;
    case 3uLL:
      v14 = HMDResidentSelectionAutoMode;
LABEL_9:
      v13 = objc_msgSend([v14 alloc], "initWithContext:", v6);
LABEL_10:
      v12 = (void *)v13;
      break;
    default:
LABEL_5:
      v12 = 0;
      break;
  }

  return v12;
}

- (id)createCoordinationElectionModeWithContext:(id)a3
{
  id v4;
  void *v5;
  HMDResidentSelectionManagerDefaultDataSource *v6;
  NSObject *v7;
  void *v8;
  HMDResidentSelectionCoordinationElection *v9;
  int v11;
  void *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543874;
    v12 = v8;
    v13 = 1024;
    v14 = objc_msgSend(v4, "residentCapable");
    v15 = 1024;
    v16 = objc_msgSend(v4, "isActingAsResident");
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Current Device resident capable: %d, acting as a resident: %d", (uint8_t *)&v11, 0x18u);

  }
  objc_autoreleasePoolPop(v5);
  if (objc_msgSend(v4, "residentCapable") && objc_msgSend(v4, "isActingAsResident"))
    v9 = -[HMDResidentSelectionCoordinationElection initWithContext:]([HMDResidentSelectionCoordinationElection alloc], "initWithContext:", v4);
  else
    v9 = 0;

  return v9;
}

- (NSNotificationCenter)notificationCenter
{
  return (NSNotificationCenter *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
}

- (NSBackgroundActivityScheduler)autoModeEvaluationScheduler
{
  return (NSBackgroundActivityScheduler *)(id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1470]), "initWithIdentifier:", CFSTR("com.apple.homed.HMDResidentSelectionManager"));
}

- (HMDHomeKitVersion)minimumHomeKitVersionForResidentSelection
{
  return -[HMDHomeKitVersion initWithVersionString:]([HMDHomeKitVersion alloc], "initWithVersionString:", CFSTR("12.0"));
}

- (id)idsServerBagForHome:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "homeManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "idsServerBag");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
