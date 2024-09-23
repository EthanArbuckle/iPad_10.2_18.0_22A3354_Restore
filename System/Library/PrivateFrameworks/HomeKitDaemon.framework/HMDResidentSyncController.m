@implementation HMDResidentSyncController

- (HMDResidentSyncController)initWithHome:(id)a3 codingModel:(id)a4 notificationCenter:(id)a5 persistence:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  HMDResidentSyncController *v14;
  HMDResidentSyncController *v15;
  uint64_t v16;
  NSUUID *homeUUID;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  HMFVersion *v24;
  HMFVersion *schemaVersion;
  uint64_t v26;
  HMDManagedObjectContext *context;
  void *v28;
  __CFString *v29;
  HMDResidentSyncController *v31;
  SEL v32;
  id v33;
  id *v34;
  objc_super v35;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v35.receiver = self;
  v35.super_class = (Class)HMDResidentSyncController;
  v14 = -[HMDResidentSyncController init](&v35, sel_init);
  v15 = v14;
  if (!v14)
    goto LABEL_9;
  objc_storeWeak((id *)&v14->_home, v10);
  objc_msgSend(v10, "uuid");
  v16 = objc_claimAutoreleasedReturnValue();
  homeUUID = v15->_homeUUID;
  v15->_homeUUID = (NSUUID *)v16;

  objc_storeStrong((id *)&v15->_notificationCenter, a5);
  objc_storeStrong((id *)&v15->_codingModel, a4);
  objc_msgSend(v11, "objectModel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "versionIdentifiers");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  if (objc_msgSend(v19, "count") == 1)
  {
    objc_msgSend(v19, "anyObject");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v21 = v20;
    else
      v21 = 0;
    v22 = v21;

    if (v22)
    {
      v23 = objc_msgSend(objc_alloc(MEMORY[0x24BE3F2A8]), "initWithVersionString:", v22);
      if (v23)
      {
        v24 = (HMFVersion *)v23;

        schemaVersion = v15->_schemaVersion;
        v15->_schemaVersion = v24;

        v26 = objc_msgSend(v13, "newManagedObjectContext");
        context = v15->_context;
        v15->_context = (HMDManagedObjectContext *)v26;

        HMDWorkingContextNameForHomeUUID(v15->_homeUUID);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDManagedObjectContext setName:](v15->_context, "setName:", v28);

        v29 = CFSTR("HMD.RS");
        -[HMDManagedObjectContext setTransactionAuthor:](v15->_context, "setTransactionAuthor:", CFSTR("HMD.RS"));

LABEL_9:
        return v15;
      }
    }
  }
  else
  {
    _HMFPreconditionFailureWithFormat();
  }
  v31 = (HMDResidentSyncController *)_HMFPreconditionFailureWithFormat();
  return (HMDResidentSyncController *)-[HMDResidentSyncController encodeToken:error:](v31, v32, v33, v34);
}

- (id)encodeToken:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  HMDResidentSyncController *v11;
  NSObject *v12;
  void *v13;
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v15 = 0;
  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v6, 1, &v15);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v15;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    v10 = (void *)MEMORY[0x227676638]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v17 = v13;
      v18 = 2114;
      v19 = v8;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to encode change token: %{public}@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
    if (a4)
      *a4 = objc_retainAutorelease(v8);
  }

  return v7;
}

- (id)decodeToken:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  HMDResidentSyncController *v11;
  NSObject *v12;
  void *v13;
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v15 = 0;
  objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v6, &v15);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v15;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    v10 = (void *)MEMORY[0x227676638]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v17 = v13;
      v18 = 2114;
      v19 = v8;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode change token: %{public}@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
    if (a4)
      *a4 = objc_retainAutorelease(v8);
  }

  return v7;
}

- (BOOL)changeToken:(id)a3 isAheadOf:(id)a4
{
  id v5;
  id v6;
  void *v7;
  unint64_t v8;
  BOOL v9;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v6)
  {
    if (v5 == v6)
    {
      v9 = 0;
    }
    else
    {
      v8 = objc_msgSend(v5, "compareToken:error:", v6, 0);
      if (v8 <= 4)
        v9 = (0x13u >> v8) & 1;
      else
        v9 = 1;
    }
  }
  else
  {
    v9 = 1;
  }

  return v9;
}

- (id)context
{
  return self->_context;
}

- (NSUUID)messageTargetUUID
{
  return self->_homeUUID;
}

- (id)dispatchContextForMessage:(id)a3
{
  return self->_context;
}

- (id)logIdentifier
{
  return -[NSUUID UUIDString](self->_homeUUID, "UUIDString");
}

- (HMFVersion)schemaVersion
{
  return (HMFVersion *)objc_getProperty(self, a2, 48, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_schemaVersion, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_codingModel, 0);
  objc_storeStrong((id *)&self->_homeUUID, 0);
  objc_destroyWeak((id *)&self->_home);
}

+ (id)logCategory
{
  return +[HMDResidentSyncManager logCategory](HMDResidentSyncManager, "logCategory");
}

@end
