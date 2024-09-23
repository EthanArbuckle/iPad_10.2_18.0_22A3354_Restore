@implementation HMDBackgroundOperation

- (BOOL)mainWithError:(id *)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (void *)MEMORY[0x24BDBCE88];
  v4 = *MEMORY[0x24BDBCAB0];
  v5 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ is unavailable"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v7, 0);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v8);
}

- (HMDBackgroundOperation)initWithUUID:(id)a3 userData:(id)a4 backGroundOpsManager:(id)a5 scheduledDate:(id)a6 expirationDate:(id)a7 dataSource:(id)a8 dependentOperations:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  HMDBackgroundOperation *v19;
  HMDBackgroundOperation *v20;
  uint64_t v21;
  NSUUID *operationUUID;
  void *v23;
  void *v24;
  id v26;
  id v27;
  id v28;
  objc_super v29;

  v15 = a3;
  v28 = a4;
  v27 = a5;
  v26 = a6;
  v16 = a7;
  v17 = a8;
  v18 = a9;
  v29.receiver = self;
  v29.super_class = (Class)HMDBackgroundOperation;
  v19 = -[HMDBackgroundOperation init](&v29, sel_init);
  v20 = v19;
  if (v19)
  {
    v19->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v19->_bgOpsManager, a5);
    objc_msgSend(MEMORY[0x24BE3F210], "hmf_cachedInstanceForNSUUID:", v15);
    v21 = objc_claimAutoreleasedReturnValue();
    operationUUID = v20->_operationUUID;
    v20->_operationUUID = (NSUUID *)v21;

    objc_storeStrong((id *)&v20->_userData, a4);
    objc_storeStrong((id *)&v20->_scheduledDate, a6);
    objc_storeStrong((id *)&v20->_expirationDate, a7);
    objc_storeStrong((id *)&v20->_dataSource, a8);
    if (v18)
    {
      v23 = (void *)objc_msgSend(v18, "mutableCopy");
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCEF0], "set");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v24 = v23;
    objc_storeStrong((id *)&v20->_dependencies, v23);

  }
  return v20;
}

- (HMDBackgroundOperation)initWithUserData:(id)a3
{
  id v4;
  HMDBackgroundOperationDataSource *v5;
  void *v6;
  void *v7;
  void *v8;
  HMDBackgroundOperation *v9;

  v4 = a3;
  v5 = objc_alloc_init(HMDBackgroundOperationDataSource);
  +[HMDMainDriver driver](HMDMainDriver, "driver");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "homeManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bgOpsManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HMDBackgroundOperation initWithUserData:dataSource:backGroundOpsManager:](self, "initWithUserData:dataSource:backGroundOpsManager:", v4, v5, v8);

  return v9;
}

- (HMDBackgroundOperation)initWithUserData:(id)a3 dataSource:(id)a4 backGroundOpsManager:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  HMDBackgroundOperation *v14;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v9, "dateWithTimeIntervalSinceNow:", 2592000.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "currentDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[HMDBackgroundOperation initWithUUID:userData:backGroundOpsManager:scheduledDate:expirationDate:dataSource:dependentOperations:](self, "initWithUUID:userData:backGroundOpsManager:scheduledDate:expirationDate:dataSource:dependentOperations:", v12, v10, v8, v13, v11, v9, 0);

  return v14;
}

- (int64_t)qualityOfService
{
  return 9;
}

- (BOOL)runOperation:(id)a3
{
  id v4;
  void *v5;
  HMDBackgroundOperation *v6;
  NSObject *v7;
  void *v8;
  _BOOL4 v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  HMDBackgroundOperation *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  _BOOL4 v18;
  BOOL v19;
  void *v20;
  HMDBackgroundOperation *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  id v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  HMDBackgroundOperation *v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (-[HMDBackgroundOperation finished](self, "finished"))
  {
    v5 = (void *)MEMORY[0x227676638]();
    v6 = self;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v29 = v8;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@The operation is already finished running.", buf, 0xCu);

    }
    goto LABEL_13;
  }
  v9 = -[HMDBackgroundOperation isDeferred](self, "isDeferred");
  v5 = (void *)MEMORY[0x227676638]();
  if (v9)
  {
    v6 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDBackgroundOperation operationUUID](v6, "operationUUID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v29 = v11;
      v30 = 2112;
      v31 = v12;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Operation [%@] is deferred and should not run.", buf, 0x16u);

    }
LABEL_17:
    v19 = 0;
    goto LABEL_18;
  }
  v13 = (void *)MEMORY[0x227676638]();
  v14 = self;
  HMFGetOSLogHandle();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDBackgroundOperation operationUUID](v14, "operationUUID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v29 = v16;
    v30 = 2112;
    v31 = v17;
    _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_INFO, "%{public}@Running Operation : %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v13);
  -[HMDBackgroundOperation setHomeManager:](v14, "setHomeManager:", v4);
  v27 = 0;
  v18 = -[HMDBackgroundOperation mainWithError:](v14, "mainWithError:", &v27);
  v6 = (HMDBackgroundOperation *)v27;
  if (!v18)
  {
    -[HMDBackgroundOperation setScheduled:](v14, "setScheduled:", 0);
    -[HMDBackgroundOperation setFailureCount:](v14, "setFailureCount:", -[HMDBackgroundOperation failureCount](v14, "failureCount") + 1);
    v20 = (void *)MEMORY[0x227676638](-[HMDBackgroundOperation deferWithFailureCount:](v14, "deferWithFailureCount:", -[HMDBackgroundOperation failureCount](v14, "failureCount")));
    v21 = v14;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDBackgroundOperation operationUUID](v21, "operationUUID");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", -[HMDBackgroundOperation failureCount](v21, "failureCount"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v29 = v23;
      v30 = 2112;
      v31 = v24;
      v32 = 2112;
      v33 = v25;
      v34 = 2112;
      v35 = v6;
      _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_ERROR, "%{public}@Operation [%@] failed [%@] with error : %@", buf, 0x2Au);

    }
    objc_autoreleasePoolPop(v20);
    goto LABEL_17;
  }
  -[HMDBackgroundOperation markOperationFinished](v14, "markOperationFinished");
LABEL_13:
  v19 = 1;
LABEL_18:

  objc_autoreleasePoolPop(v5);
  return v19;
}

- (void)markOperationFinished
{
  -[HMDBackgroundOperation setFinished:](self, "setFinished:", 1);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  char v21;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  if (!v6)
    goto LABEL_10;
  -[HMDBackgroundOperation operationUUID](self, "operationUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "operationUUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = HMFEqualObjects();

  if (!v9)
    goto LABEL_10;
  -[HMDBackgroundOperation userData](self, "userData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "userData");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = HMFEqualObjects();

  if (!v12)
    goto LABEL_10;
  -[HMDBackgroundOperation scheduledDate](self, "scheduledDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scheduledDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = HMFEqualObjects();

  if (!v15)
    goto LABEL_10;
  -[HMDBackgroundOperation expirationDate](self, "expirationDate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "expirationDate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = HMFEqualObjects();

  if (v18)
  {
    -[HMDBackgroundOperation AllDependencies](self, "AllDependencies");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "AllDependencies");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = HMFEqualObjects();

  }
  else
  {
LABEL_10:
    v21 = 0;
  }

  return v21;
}

- (BOOL)isExpired
{
  void *v3;
  void *v4;
  double v5;
  BOOL v6;

  -[HMDBackgroundOperation dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDBackgroundOperation expirationDate](self, "expirationDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceNowToDate:", v4);
  v6 = v5 < 0.0;

  return v6;
}

- (BOOL)isReadyToRun
{
  if (-[HMDBackgroundOperation isExpired](self, "isExpired")
    || -[HMDBackgroundOperation finished](self, "finished")
    || -[HMDBackgroundOperation isDeferred](self, "isDeferred"))
  {
    return 0;
  }
  else
  {
    return !-[HMDBackgroundOperation isAlreadyScheduled](self, "isAlreadyScheduled");
  }
}

- (void)deferWithFailureCount:(int64_t)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3 - 1;
  if (a3 - 1 >= (unint64_t)objc_msgSend(&unk_24E971000, "count"))
    v4 = objc_msgSend(&unk_24E971000, "count") - 1;
  objc_msgSend(&unk_24E971000, "objectAtIndexedSubscript:", v4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[HMDBackgroundOperation dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "doubleValue");
  objc_msgSend(v5, "dateWithTimeIntervalSinceNow:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDBackgroundOperation setDeferralDate:](self, "setDeferralDate:", v6);

}

- (NSDate)deferralDate
{
  os_unfair_lock_s *p_lock;
  NSDate *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_deferralDate;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setDeferralDate:(id)a3
{
  NSDate *v4;
  NSDate *deferralDate;

  v4 = (NSDate *)a3;
  os_unfair_lock_lock_with_options();
  deferralDate = self->_deferralDate;
  self->_deferralDate = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (BOOL)isDeferred
{
  os_unfair_lock_s *p_lock;
  void *v4;
  double v5;
  BOOL v6;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (self->_deferralDate)
  {
    -[HMDBackgroundOperation dataSource](self, "dataSource");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "timeIntervalSinceNowToDate:", self->_deferralDate);
    v6 = v5 > 0.0;

  }
  else
  {
    v6 = 0;
  }
  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (void)addDependency:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  void *v6;
  id v7;

  v4 = a3;
  if (v4)
  {
    v7 = v4;
    p_lock = &self->_lock;
    os_unfair_lock_lock_with_options();
    -[HMDBackgroundOperation dependencies](self, "dependencies");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v7);

    os_unfair_lock_unlock(p_lock);
    v4 = v7;
  }

}

- (void)removeDependency:(id)a3
{
  os_unfair_lock_s *p_lock;
  void *v5;
  id v6;

  v6 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[HMDBackgroundOperation dependencies](self, "dependencies");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v6);

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)hasDependency:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  void *v6;
  char v7;

  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[HMDBackgroundOperation dependencies](self, "dependencies");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsObject:", v4);

  os_unfair_lock_unlock(p_lock);
  return v7;
}

- (id)AllDependencies
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = (void *)-[NSMutableSet copy](self->_dependencies, "copy");
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[HMDBackgroundOperation operationUUID](self, "operationUUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)attributeDescriptions
{
  id v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[8];

  v26[7] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDBackgroundOperation operationUUID](self, "operationUUID");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("UUID"), v25);
  v26[0] = v24;
  v4 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDBackgroundOperation expirationDate](self, "expirationDate");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v4, "initWithName:value:", CFSTR("expirationDate"), v23);
  v26[1] = v22;
  v5 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDBackgroundOperation deferralDate](self, "deferralDate");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "initWithName:value:", CFSTR("deferralDate"), v21);
  v26[2] = v6;
  v7 = objc_alloc(MEMORY[0x24BE3F140]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", -[HMDBackgroundOperation failureCount](self, "failureCount"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithName:value:", CFSTR("failureCount"), v8);
  v26[3] = v9;
  v10 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDBackgroundOperation isExpired](self, "isExpired");
  HMFBooleanToString();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithName:value:", CFSTR("expired"), v11);
  v26[4] = v12;
  v13 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDBackgroundOperation dependencies](self, "dependencies");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v13, "initWithName:value:", CFSTR("dependencies"), v14);
  v26[5] = v15;
  v16 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDBackgroundOperation isAlreadyScheduled](self, "isAlreadyScheduled");
  HMFBooleanToString();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v16, "initWithName:value:", CFSTR("scheduled"), v17);
  v26[6] = v18;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v26, 7);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (id)dumpState
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[HMDBackgroundOperation operationUUID](self, "operationUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDBackgroundOperation scheduledDate](self, "scheduledDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDBackgroundOperation expirationDate](self, "expirationDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDBackgroundOperation deferralDate](self, "deferralDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDBackgroundOperation isExpired](self, "isExpired");
  HMFBooleanToString();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", -[HMDBackgroundOperation failureCount](self, "failureCount"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDBackgroundOperation userData](self, "userData");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDBackgroundOperation dependencies](self, "dependencies");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("name: %@, id: %@, scheduledDate: %@ expirationDate: %@, deferralDate: %@, expired: %@, failureCount:%@, userData: %@, dependencies: %@"), v4, v5, v6, v7, v8, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (NSUUID)operationUUID
{
  return self->_operationUUID;
}

- (HMDHomeManager)homeManager
{
  return (HMDHomeManager *)objc_loadWeakRetained((id *)&self->_homeManager);
}

- (void)setHomeManager:(id)a3
{
  objc_storeWeak((id *)&self->_homeManager, a3);
}

- (HMDBackgroundOperationManager)bgOpsManager
{
  return self->_bgOpsManager;
}

- (void)setBgOpsManager:(id)a3
{
  objc_storeStrong((id *)&self->_bgOpsManager, a3);
}

- (NSMutableSet)dependencies
{
  return (NSMutableSet *)objc_getProperty(self, a2, 48, 1);
}

- (BOOL)finished
{
  return self->_finished;
}

- (void)setFinished:(BOOL)a3
{
  self->_finished = a3;
}

- (NSDictionary)userData
{
  return (NSDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (NSDate)scheduledDate
{
  return (NSDate *)objc_getProperty(self, a2, 64, 1);
}

- (NSDate)expirationDate
{
  return (NSDate *)objc_getProperty(self, a2, 72, 1);
}

- (NSOperationQueue)queue
{
  return self->_queue;
}

- (void)setIsReadyToRun:(BOOL)a3
{
  self->_isReadyToRun = a3;
}

- (void)setIsExpired:(BOOL)a3
{
  self->_isExpired = a3;
}

- (BOOL)isAlreadyScheduled
{
  return self->_scheduled;
}

- (void)setScheduled:(BOOL)a3
{
  self->_scheduled = a3;
}

- (HMDBackgroundOperationDataSource)dataSource
{
  return self->_dataSource;
}

- (int64_t)failureCount
{
  return self->_failureCount;
}

- (void)setFailureCount:(int64_t)a3
{
  self->_failureCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_scheduledDate, 0);
  objc_storeStrong((id *)&self->_userData, 0);
  objc_storeStrong((id *)&self->_dependencies, 0);
  objc_storeStrong((id *)&self->_bgOpsManager, 0);
  objc_destroyWeak((id *)&self->_homeManager);
  objc_storeStrong((id *)&self->_operationUUID, 0);
  objc_storeStrong((id *)&self->_deferralDate, 0);
}

+ (NSPredicate)predicate
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x24BDBCE88];
  v3 = *MEMORY[0x24BDBCAB0];
  v4 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ is unavailable"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t12_131180 != -1)
    dispatch_once(&logCategory__hmf_once_t12_131180, &__block_literal_global_131181);
  return (id)logCategory__hmf_once_v13_131182;
}

void __37__HMDBackgroundOperation_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v13_131182;
  logCategory__hmf_once_v13_131182 = v0;

}

@end
