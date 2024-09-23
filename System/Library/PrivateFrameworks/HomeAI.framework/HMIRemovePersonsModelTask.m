@implementation HMIRemovePersonsModelTask

- (HMIRemovePersonsModelTask)initWithTaskID:(int)a3 homeUUID:(id)a4 sourceUUID:(id)a5
{
  uint64_t v7;
  id v9;
  HMIRemovePersonsModelTask *v10;
  HMIRemovePersonsModelTask *v11;
  objc_super v13;

  v7 = *(_QWORD *)&a3;
  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)HMIRemovePersonsModelTask;
  v10 = -[HMIHomeTask initWithTaskID:homeUUID:timeout:](&v13, sel_initWithTaskID_homeUUID_timeout_, v7, a4, 5.0);
  v11 = v10;
  if (v10)
    objc_storeStrong((id *)&v10->_sourceUUID, a5);

  return v11;
}

- (void)mainInsideAutoreleasePool
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  id v7;
  void *v8;
  HMIRemovePersonsModelTask *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  +[HMIPersonsModelManager sharedInstance](HMIPersonsModelManager, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMIHomeTask homeUUID](self, "homeUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMIRemovePersonsModelTask sourceUUID](self, "sourceUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  v6 = objc_msgSend(v3, "removePersonsModelForHomeUUID:sourceUUID:error:", v4, v5, &v16);
  v7 = v16;

  v8 = (void *)MEMORY[0x220735570]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if ((v6 & 1) != 0)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v18 = v12;
      _os_log_impl(&dword_219D45000, v11, OS_LOG_TYPE_INFO, "%{public}@Successfully removed persons model", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v8);
    v15.receiver = v9;
    v15.super_class = (Class)HMIRemovePersonsModelTask;
    -[HMFOperation finish](&v15, sel_finish);
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v18 = v13;
      v19 = 2112;
      v20 = v7;
      _os_log_impl(&dword_219D45000, v11, OS_LOG_TYPE_ERROR, "%{public}@Failed to remove persons model, error:%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    objc_msgSend(MEMORY[0x24BDD1540], "hmiPrivateErrorWithCode:underlyingError:", 1027, v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMFOperation cancelWithError:](v9, "cancelWithError:", v14);

  }
}

- (id)logIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[HMIRemovePersonsModelTask sourceUUID](self, "sourceUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMIHomeTask homeUUID](self, "homeUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("SourceUUID:%@ HomeUUID:%@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSUUID)sourceUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 336, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceUUID, 0);
}

@end
