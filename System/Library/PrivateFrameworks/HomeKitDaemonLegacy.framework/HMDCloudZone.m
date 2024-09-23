@implementation HMDCloudZone

- (NSString)zoneRootRecordName
{
  return (NSString *)objc_msgSend((id)objc_opt_class(), "zoneRootRecordName");
}

- (HMDCloudZone)init
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  v4 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ is unavailable"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (HMDCloudZone)initWithBackingStoreCacheZone:(id)a3 cloudCache:(id)a4
{
  id v7;
  id v8;
  HMDCloudZone *v9;
  HMDCloudZone *v10;
  id v11;
  void *v12;
  uint64_t v13;
  CKRecordZone *zone;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)HMDCloudZone;
  v9 = -[HMDCloudZone init](&v16, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_backingStoreZone, a3);
    objc_storeWeak((id *)&v10->_cache, v8);
    v11 = objc_alloc(MEMORY[0x1E0C95088]);
    objc_msgSend(v7, "zoneName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "initWithZoneName:", v12);
    zone = v10->_zone;
    v10->_zone = (CKRecordZone *)v13;

  }
  return v10;
}

- (id)shortDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)objc_opt_class(), "shortDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCloudZone backingStoreZone](self, "backingStoreZone");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "zoneName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ Zone = %@"), v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[HMDCloudZone shortDescription](self, "shortDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("<%@>"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)doesProcessChangeEvenIfDecryptionFails
{
  return 0;
}

- (id)cloudRecordWithName:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[HMDCloudZone rootGroup](self, "rootGroup");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cloudRecordWithName:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)cloudRecordWithNames:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  HMDCloudZone *v11;
  NSObject *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HMDCloudZone rootGroup](self, "rootGroup");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[HMDCloudZone rootGroup](self, "rootGroup");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "cloudRecordWithNames:completionHandler:", v6, v7);
LABEL_7:

    goto LABEL_8;
  }
  if (v7)
  {
    v10 = (void *)MEMORY[0x1D17BA0A0]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543362;
      v15 = v13;
      _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_ERROR, "%{public}@No root group to get cloud records.", (uint8_t *)&v14, 0xCu);

    }
    objc_autoreleasePoolPop(v10);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, void *))v7 + 2))(v7, 0, 0, v9);
    goto LABEL_7;
  }
LABEL_8:

}

- (void)cloudRecordWithName:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, void *);
  void *v8;
  void *v9;
  void *v10;
  HMDCloudZone *v11;
  NSObject *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, _QWORD, void *))a4;
  -[HMDCloudZone rootGroup](self, "rootGroup");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[HMDCloudZone rootGroup](self, "rootGroup");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "cloudRecordWithName:completionHandler:", v6, v7);
LABEL_7:

    goto LABEL_8;
  }
  if (v7)
  {
    v10 = (void *)MEMORY[0x1D17BA0A0]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543362;
      v15 = v13;
      _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_ERROR, "%{public}@No root group to get cloud record.", (uint8_t *)&v14, 0xCu);

    }
    objc_autoreleasePoolPop(v10);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, 0, v9);
    goto LABEL_7;
  }
LABEL_8:

}

- (id)createCloudRecordWithObjectID:(id)a3 recordName:(id)a4
{
  id v6;
  id v7;
  HMDCloudRecord *v8;

  v6 = a4;
  v7 = a3;
  v8 = -[HMDCloudRecord initWithObjectID:recordName:cloudZone:]([HMDCloudRecord alloc], "initWithObjectID:recordName:cloudZone:", v7, v6, self);

  return v8;
}

- (id)createCloudRecordWithFetchResult:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  HMDCloudZone *v17;
  NSObject *v18;
  void *v19;
  const char *v20;
  NSObject *v21;
  uint32_t v22;
  int v24;
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (!v4)
  {
    v16 = (void *)MEMORY[0x1D17BA0A0]();
    v17 = self;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 138543362;
      v25 = v19;
      v20 = "%{public}@Cannot create cloud record without fetch result";
      v21 = v18;
      v22 = 12;
LABEL_8:
      _os_log_impl(&dword_1CD062000, v21, OS_LOG_TYPE_ERROR, v20, (uint8_t *)&v24, v22);

    }
LABEL_9:

    objc_autoreleasePoolPop(v16);
    v13 = 0;
    goto LABEL_10;
  }
  objc_msgSend(v4, "record");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "recordID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "recordName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v16 = (void *)MEMORY[0x1D17BA0A0]();
    v17 = self;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 138543618;
      v25 = v19;
      v26 = 2112;
      v27 = v5;
      v20 = "%{public}@Cannot create cloud record because fetch result record is incomplete %@";
      v21 = v18;
      v22 = 22;
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  objc_msgSend(v5, "uuid");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "record");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "recordID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "recordName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCloudZone createCloudRecordWithObjectID:recordName:](self, "createCloudRecordWithObjectID:recordName:", v9, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "record");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setRecord:", v14);

  objc_msgSend(v5, "data");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setCachedData:", v15);

LABEL_10:
  return v13;
}

- (id)__cloudRecordWithObjectID:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[HMDCloudZone rootGroup](self, "rootGroup");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "__cloudRecordWithObjectID:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)cloudRecordWithObjectID:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[HMDCloudZone rootGroup](self, "rootGroup");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cloudRecordWithObjectID:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)cloudRecordWithObjectIDs:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  HMDCloudZone *v11;
  NSObject *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HMDCloudZone rootGroup](self, "rootGroup");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[HMDCloudZone rootGroup](self, "rootGroup");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "cloudRecordWithObjectIDs:completionHandler:", v6, v7);
LABEL_7:

    goto LABEL_8;
  }
  if (v7)
  {
    v10 = (void *)MEMORY[0x1D17BA0A0]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543362;
      v15 = v13;
      _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_ERROR, "%{public}@No root group to get cloud records.", (uint8_t *)&v14, 0xCu);

    }
    objc_autoreleasePoolPop(v10);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, void *))v7 + 2))(v7, 0, 0, v9);
    goto LABEL_7;
  }
LABEL_8:

}

- (void)cloudRecordWithObjectID:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, void *);
  void *v8;
  void *v9;
  void *v10;
  HMDCloudZone *v11;
  NSObject *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, _QWORD, void *))a4;
  -[HMDCloudZone rootGroup](self, "rootGroup");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[HMDCloudZone rootGroup](self, "rootGroup");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "cloudRecordWithObjectID:completionHandler:", v6, v7);
LABEL_7:

    goto LABEL_8;
  }
  if (v7)
  {
    v10 = (void *)MEMORY[0x1D17BA0A0]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543362;
      v15 = v13;
      _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_ERROR, "%{public}@No root group to get cloud record.", (uint8_t *)&v14, 0xCu);

    }
    objc_autoreleasePoolPop(v10);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, 0, v9);
    goto LABEL_7;
  }
LABEL_8:

}

- (void)cloudRecordsForParentID:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, void *);
  void *v8;
  void *v9;
  void *v10;
  HMDCloudZone *v11;
  NSObject *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, _QWORD, void *))a4;
  -[HMDCloudZone rootGroup](self, "rootGroup");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[HMDCloudZone rootGroup](self, "rootGroup");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "cloudRecordsForParentID:completionHandler:", v6, v7);
LABEL_7:

    goto LABEL_8;
  }
  if (v7)
  {
    v10 = (void *)MEMORY[0x1D17BA0A0]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543362;
      v15 = v13;
      _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_ERROR, "%{public}@No root group to get child record.", (uint8_t *)&v14, 0xCu);

    }
    objc_autoreleasePoolPop(v10);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, 0, v9);
    goto LABEL_7;
  }
LABEL_8:

}

- (void)allDescendentsCloudRecordsForParentID:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, void *);
  void *v8;
  void *v9;
  void *v10;
  HMDCloudZone *v11;
  NSObject *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, _QWORD, void *))a4;
  -[HMDCloudZone rootGroup](self, "rootGroup");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[HMDCloudZone rootGroup](self, "rootGroup");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "allDescendentsCloudRecordsForParentID:completionHandler:", v6, v7);
LABEL_7:

    goto LABEL_8;
  }
  if (v7)
  {
    v10 = (void *)MEMORY[0x1D17BA0A0]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543362;
      v15 = v13;
      _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_ERROR, "%{public}@No root group to get descendant records.", (uint8_t *)&v14, 0xCu);

    }
    objc_autoreleasePoolPop(v10);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, 0, v9);
    goto LABEL_7;
  }
LABEL_8:

}

- (void)fetchAllObjects:(id)a3
{
  id v4;
  HMDBackingStoreCacheFetchMigratedResult *v5;
  void *v6;
  void *v7;
  id v8;
  HMDBackingStoreCacheFetchMigratedResult *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;

  v4 = a3;
  v5 = [HMDBackingStoreCacheFetchMigratedResult alloc];
  -[HMDCloudZone rootGroup](self, "rootGroup");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "backingStoreGroup");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __32__HMDCloudZone_fetchAllObjects___block_invoke;
  v12[3] = &unk_1E89A9170;
  v13 = v4;
  v8 = v4;
  v9 = -[HMDBackingStoreCacheFetchMigratedResult initWithGroup:update:migration:fetchResult:](v5, "initWithGroup:update:migration:fetchResult:", v7, 0, 0, v12);

  -[HMDCloudZone cache](self, "cache");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "backingStore");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "submit:", v9);

}

- (void)fetchMigratedObjects:(id)a3
{
  id v4;
  HMDBackingStoreCacheFetchMigratedResult *v5;
  void *v6;
  void *v7;
  id v8;
  HMDBackingStoreCacheFetchMigratedResult *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;

  v4 = a3;
  v5 = [HMDBackingStoreCacheFetchMigratedResult alloc];
  -[HMDCloudZone rootGroup](self, "rootGroup");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "backingStoreGroup");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __37__HMDCloudZone_fetchMigratedObjects___block_invoke;
  v12[3] = &unk_1E89A9170;
  v13 = v4;
  v8 = v4;
  v9 = -[HMDBackingStoreCacheFetchMigratedResult initWithGroup:update:migration:fetchResult:](v5, "initWithGroup:update:migration:fetchResult:", v7, 0, 1, v12);

  -[HMDCloudZone cache](self, "cache");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "backingStore");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "submit:", v9);

}

- (void)markMigratedObjectsAsMigrated
{
  HMDBackingStoreCacheFetchMigratedResult *v3;
  void *v4;
  void *v5;
  HMDBackingStoreCacheFetchMigratedResult *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, void *, void *);
  void *v12;
  id v13;
  id location;

  objc_initWeak(&location, self);
  v3 = [HMDBackingStoreCacheFetchMigratedResult alloc];
  -[HMDCloudZone rootGroup](self, "rootGroup");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "backingStoreGroup");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __45__HMDCloudZone_markMigratedObjectsAsMigrated__block_invoke;
  v12 = &unk_1E89AE520;
  objc_copyWeak(&v13, &location);
  v6 = -[HMDBackingStoreCacheFetchMigratedResult initWithGroup:update:migration:fetchResult:](v3, "initWithGroup:update:migration:fetchResult:", v5, 1, 1, &v9);

  -[HMDCloudZone cache](self, "cache", v9, v10, v11, v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "backingStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "submit:", v6);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

- (void)addCloudRecord:(id)a3 ownerID:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  -[HMDCloudZone rootGroup](self, "rootGroup");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addCloudRecord:", v5);

}

- (CKRecordID)privateZoneRootRecordID
{
  void *v2;
  void *v3;

  -[HMDCloudZone rootGroup](self, "rootGroup");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "privateZoneRootRecordID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CKRecordID *)v3;
}

- (BOOL)isRootRecord:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[HMDCloudZone rootGroup](self, "rootGroup");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isRootRecord:", v4);

  return v6;
}

- (BOOL)isRootCloudRecord:(id)a3
{
  void *v4;

  objc_msgSend(a3, "record");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[HMDCloudZone isRootRecord:](self, "isRootRecord:", v4);

  return (char)self;
}

- (void)updateCloudRecord:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HMDCloudZone rootGroup](self, "rootGroup");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateCloudRecord:", v4);

}

- (void)updateCloudRecord:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[HMDCloudZone rootGroup](self, "rootGroup");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "updateCloudRecord:completionHandler:", v7, v6);

}

- (void)deleteCloudRecordNames:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HMDCloudZone rootGroup](self, "rootGroup");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deleteCloudRecordNames:", v4);

}

- (void)deleteCloudRecord:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HMDCloudZone rootGroup](self, "rootGroup");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deleteCloudRecord:", v4);

}

- (id)createCloudZoneChangeTemporaryCache:(BOOL)a3
{
  return 0;
}

- (NSString)owner
{
  void *v2;
  void *v3;
  void *v4;

  -[HMDCloudZone rootGroup](self, "rootGroup");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "backingStoreGroup");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "owner");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (NSString)subscriptionName
{
  void *v2;
  void *v3;
  void *v4;

  -[HMDCloudZone rootGroup](self, "rootGroup");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "backingStoreGroup");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "subscriptionName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (void)setSubscription:(id)a3
{
  id v5;
  HMDBackingStoreCacheUpdateGroupSubscriptionOperation *v6;
  void *v7;
  void *v8;
  HMDBackingStoreCacheUpdateGroupSubscriptionOperation *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];

  objc_storeStrong((id *)&self->_subscription, a3);
  v5 = a3;
  v6 = [HMDBackingStoreCacheUpdateGroupSubscriptionOperation alloc];
  -[HMDCloudZone rootGroup](self, "rootGroup");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "backingStoreGroup");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __32__HMDCloudZone_setSubscription___block_invoke;
  v12[3] = &unk_1E89C2350;
  v12[4] = self;
  v9 = -[HMDBackingStoreCacheUpdateGroupSubscriptionOperation initWithGroup:subscription:resultBlock:](v6, "initWithGroup:subscription:resultBlock:", v8, v5, v12);

  -[HMDCloudZone cache](self, "cache");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "backingStore");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "submit:", v9);

}

- (BOOL)hasServerTokenAvailable
{
  void *v2;

  -[HMDCloudZone serverChangeToken](self, "serverChangeToken");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2 != 0;
}

- (void)_initializeSubscription:(id)a3
{
  objc_storeStrong((id *)&self->_subscription, a3);
}

- (void)_initializeServerChangeToken:(id)a3
{
  objc_storeStrong((id *)&self->_serverChangeToken, a3);
}

- (void)deleteZone
{
  void *v3;
  void *v4;
  HMDBackingStoreCacheDeleteZoneOperation *v5;
  void *v6;
  id v7;
  HMDBackingStoreCacheDeleteZoneOperation *v8;
  void *v9;
  HMDCloudZone *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id location;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  -[HMDCloudZone backingStoreZone](self, "backingStoreZone");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "zoneName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  v5 = [HMDBackingStoreCacheDeleteZoneOperation alloc];
  -[HMDCloudZone backingStoreZone](self, "backingStoreZone");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __26__HMDCloudZone_deleteZone__block_invoke;
  v15[3] = &unk_1E89BF250;
  objc_copyWeak(&v17, &location);
  v7 = v4;
  v16 = v7;
  v8 = -[HMDBackingStoreCacheDeleteZoneOperation initWithZone:resultBlock:](v5, "initWithZone:resultBlock:", v6, v15);

  v9 = (void *)MEMORY[0x1D17BA0A0]();
  v10 = self;
  HMFGetOSLogHandle();
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v20 = v12;
    v21 = 2112;
    v22 = v7;
    _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_DEBUG, "%{public}@Deleting zone %@ from cached", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v9);
  -[HMDCloudZone cache](v10, "cache");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "backingStore");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "submit:", v8);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

}

- (void)updateCurrentServerChangeToken
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  HMDBackingStoreCacheUpdateGroupTokenOperation *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  HMDBackingStoreCacheUpdateGroupTokenOperation *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *);
  void *v18;
  id v19;
  id v20;
  id v21;
  id location;

  -[HMDCloudZone zone](self, "zone");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "zoneID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "zoneName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDCloudZone serverChangeToken](self, "serverChangeToken");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v7 = [HMDBackingStoreCacheUpdateGroupTokenOperation alloc];
  -[HMDCloudZone rootGroup](self, "rootGroup");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "backingStoreGroup");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __46__HMDCloudZone_updateCurrentServerChangeToken__block_invoke;
  v18 = &unk_1E89BCB20;
  objc_copyWeak(&v21, &location);
  v10 = v5;
  v19 = v10;
  v11 = v6;
  v20 = v11;
  v12 = -[HMDBackingStoreCacheUpdateGroupTokenOperation initWithGroup:serverChangeToken:resultBlock:](v7, "initWithGroup:serverChangeToken:resultBlock:", v9, v11, &v15);

  -[HMDCloudZone cache](self, "cache", v15, v16, v17, v18);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "backingStore");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "submit:", v12);

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);

}

- (void)updateServerChangeToken:(id)a3
{
  -[HMDCloudZone setServerChangeToken:](self, "setServerChangeToken:", a3);
  -[HMDCloudZone updateCurrentServerChangeToken](self, "updateCurrentServerChangeToken");
}

- (HMDCloudCache)cache
{
  return (HMDCloudCache *)objc_loadWeakRetained((id *)&self->_cache);
}

- (void)setCache:(id)a3
{
  objc_storeWeak((id *)&self->_cache, a3);
}

- (CKRecordZone)zone
{
  return self->_zone;
}

- (void)setZone:(id)a3
{
  objc_storeStrong((id *)&self->_zone, a3);
}

- (HMDCloudGroup)rootGroup
{
  return self->_rootGroup;
}

- (void)setRootGroup:(id)a3
{
  objc_storeStrong((id *)&self->_rootGroup, a3);
}

- (BOOL)hasRecordsAvailable
{
  return self->_recordsAvailable;
}

- (void)setRecordsAvailable:(BOOL)a3
{
  self->_recordsAvailable = a3;
}

- (BOOL)hasDecrypted
{
  return self->_decrypted;
}

- (void)setDecrypted:(BOOL)a3
{
  self->_decrypted = a3;
}

- (void)setSubscriptionName:(id)a3
{
  objc_storeStrong((id *)&self->_subscriptionName, a3);
}

- (CKRecordZoneSubscription)subscription
{
  return self->_subscription;
}

- (CKServerChangeToken)serverChangeToken
{
  return self->_serverChangeToken;
}

- (void)setServerChangeToken:(id)a3
{
  objc_storeStrong((id *)&self->_serverChangeToken, a3);
}

- (HMDBackingStoreCacheZone)backingStoreZone
{
  return self->_backingStoreZone;
}

- (void)setBackingStoreZone:(id)a3
{
  objc_storeStrong((id *)&self->_backingStoreZone, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backingStoreZone, 0);
  objc_storeStrong((id *)&self->_serverChangeToken, 0);
  objc_storeStrong((id *)&self->_subscription, 0);
  objc_storeStrong((id *)&self->_subscriptionName, 0);
  objc_storeStrong((id *)&self->_rootGroup, 0);
  objc_storeStrong((id *)&self->_zone, 0);
  objc_destroyWeak((id *)&self->_cache);
}

void __46__HMDCloudZone_updateCurrentServerChangeToken__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = WeakRetained;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v3)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543618;
      v14 = v9;
      v15 = 2112;
      v16 = v3;
      _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_ERROR, "%{public}@Failed to save server token with error %@", (uint8_t *)&v13, 0x16u);

    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(void **)(a1 + 32);
    v12 = *(_QWORD *)(a1 + 40);
    v13 = 138543874;
    v14 = v10;
    v15 = 2112;
    v16 = v11;
    v17 = 2112;
    v18 = v12;
    _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@[%@] Saved server change token %@", (uint8_t *)&v13, 0x20u);

  }
  objc_autoreleasePoolPop(v5);

}

void __26__HMDCloudZone_deleteZone__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  int v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = WeakRetained;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 32);
    v10 = 138543618;
    v11 = v8;
    v12 = 2112;
    v13 = v9;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Finished deleting zone %@ in cache", (uint8_t *)&v10, 0x16u);

  }
  objc_autoreleasePoolPop(v5);

}

void __32__HMDCloudZone_setSubscription___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = (void *)MEMORY[0x1D17BA0A0]();
    v5 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543618;
      v9 = v7;
      v10 = 2112;
      v11 = v3;
      _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to save subscription with error %@", (uint8_t *)&v8, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
  }

}

void __45__HMDCloudZone_markMigratedObjectsAsMigrated__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v8 = (void *)MEMORY[0x1D17BA0A0]();
  v9 = WeakRetained;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543618;
    v13 = v11;
    v14 = 2112;
    v15 = v6;
    _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_DEBUG, "%{public}@Completed marking migrated objects as migrated with error %@", (uint8_t *)&v12, 0x16u);

  }
  objc_autoreleasePoolPop(v8);

}

uint64_t __37__HMDCloudZone_fetchMigratedObjects___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __32__HMDCloudZone_fetchAllObjects___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  v6 = _Block_copy(*(const void **)(a1 + 32));
  v7 = v6;
  if (v6)
    (*((void (**)(void *, id, id))v6 + 2))(v6, v8, v5);

}

+ (id)zoneRootRecordName
{
  __CFString *v2;

  v2 = CFSTR("DONOTUPLOAD");
  return CFSTR("DONOTUPLOAD");
}

+ (id)zoneSubscriptionName:(id)a3
{
  return CFSTR("HomeDataBlobSubscription");
}

+ (void)createZoneWithName:(id)a3 rootRecordName:(id)a4 subscriptionName:(id)a5 owner:(id)a6 cacheZone:(id)a7 cloudCache:(id)a8 completion:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void (**v21)(id, _QWORD, void *);
  void *v22;
  NSObject *v23;
  id v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  unint64_t v34;
  id v35;
  id v36;
  void *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  HMDCloudGroup *v44;
  void *v45;
  void *v46;
  void *v47;
  HMDBackingStoreCacheCreateZoneOperation *v48;
  id v49;
  HMDBackingStoreCacheCreateZoneOperation *v50;
  void *v51;
  void *v52;
  void *v53;
  NSObject *v54;
  id v55;
  void *v56;
  void *v57;
  id v58;
  id v59;
  id v60;
  _QWORD v61[4];
  id v62;
  void (**v63)(id, _QWORD, void *);
  _QWORD v64[4];
  id v65;
  void (**v66)(id, _QWORD, void *);
  _QWORD v67[4];
  id v68;
  id v69;
  id v70;
  id v71;
  id v72;
  void (**v73)(id, _QWORD, void *);
  id v74;
  uint8_t buf[4];
  void *v76;
  __int16 v77;
  uint64_t v78;
  __int16 v79;
  void *v80;
  uint64_t v81;

  v81 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = (void (**)(id, _QWORD, void *))a9;
  if (!v20)
  {
    v22 = (void *)MEMORY[0x1D17BA0A0]();
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v24 = v18;
      v25 = v15;
      v26 = v17;
      v27 = v16;
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v76 = v28;
      v77 = 2112;
      v78 = (uint64_t)v25;
      _os_log_impl(&dword_1CD062000, v23, OS_LOG_TYPE_ERROR, "%{public}@Cannot create cloud zone without a cache %@", buf, 0x16u);

      v16 = v27;
      v17 = v26;
      v15 = v25;
      v18 = v24;
      v20 = 0;
    }

    objc_autoreleasePoolPop(v22);
    if (v21)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 3);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v21[2](v21, 0, v29);

    }
  }
  if (v19)
  {
    v30 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithBackingStoreCacheZone:cloudCache:", v19, v20);
    if (v30)
    {
      objc_msgSend(v19, "groups");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v31, "count");

      if (v32)
      {
        objc_msgSend(v19, "groups");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = objc_msgSend(v33, "count");

        if (v34 >= 2)
        {
          v59 = v18;
          v35 = v17;
          v36 = v16;
          v37 = (void *)MEMORY[0x1D17BA0A0]();
          HMFGetOSLogHandle();
          v38 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v57 = v37;
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "groups");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            v41 = objc_msgSend(v40, "count");
            *(_DWORD *)buf = 138543618;
            v76 = v39;
            v77 = 2048;
            v78 = v41;
            _os_log_impl(&dword_1CD062000, v38, OS_LOG_TYPE_ERROR, "%{public}@Cloud zone has more that one group, %tu, using first group", buf, 0x16u);

            v37 = v57;
          }

          objc_autoreleasePoolPop(v37);
          v16 = v36;
          v17 = v35;
          v18 = v59;
        }
        objc_msgSend(v19, "groups");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "firstObject");
        v43 = (void *)objc_claimAutoreleasedReturnValue();

        v44 = -[HMDCloudGroup initWithBackingStoreCacheGroup:cloudZone:]([HMDCloudGroup alloc], "initWithBackingStoreCacheGroup:cloudZone:", v43, v30);
        objc_msgSend(v30, "setRootGroup:", v44);

        objc_msgSend(v43, "subscription");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "_initializeSubscription:", v45);

        objc_msgSend(v43, "serverChangeToken");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "_initializeServerChangeToken:", v46);

        objc_msgSend(v30, "rootGroup");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v64[0] = MEMORY[0x1E0C809B0];
        v64[1] = 3221225472;
        v64[2] = __105__HMDCloudZone_createZoneWithName_rootRecordName_subscriptionName_owner_cacheZone_cloudCache_completion___block_invoke_49;
        v64[3] = &unk_1E89A9148;
        v65 = v30;
        v66 = v21;
        objc_msgSend(v47, "rootRecordCompletionHandler:", v64);

      }
      else
      {
        v61[0] = MEMORY[0x1E0C809B0];
        v61[1] = 3221225472;
        v61[2] = __105__HMDCloudZone_createZoneWithName_rootRecordName_subscriptionName_owner_cacheZone_cloudCache_completion___block_invoke_2_51;
        v61[3] = &unk_1E89A90F8;
        v62 = v30;
        v63 = v21;
        +[HMDCloudGroup createGroupWithRootRecordName:owner:subscriptionName:cloudZone:completion:](HMDCloudGroup, "createGroupWithRootRecordName:owner:subscriptionName:cloudZone:completion:", v16, v18, v17, v62, v61);

      }
      v52 = 0;
    }
    else
    {
      v58 = v16;
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 11);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = (void *)MEMORY[0x1D17BA0A0]();
      HMFGetOSLogHandle();
      v54 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v60 = v18;
        v55 = v17;
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v76 = v56;
        v77 = 2112;
        v78 = (uint64_t)v15;
        v79 = 2112;
        v80 = v52;
        _os_log_impl(&dword_1CD062000, v54, OS_LOG_TYPE_ERROR, "%{public}@Failed to create zone %@ with error %@", buf, 0x20u);

        v17 = v55;
        v18 = v60;
      }

      objc_autoreleasePoolPop(v53);
      if (v21)
        v21[2](v21, 0, v52);
      v16 = v58;
    }

  }
  else
  {
    v48 = [HMDBackingStoreCacheCreateZoneOperation alloc];
    v67[0] = MEMORY[0x1E0C809B0];
    v67[1] = 3221225472;
    v67[2] = __105__HMDCloudZone_createZoneWithName_rootRecordName_subscriptionName_owner_cacheZone_cloudCache_completion___block_invoke;
    v67[3] = &unk_1E89A9120;
    v74 = a1;
    v49 = v20;
    v68 = v49;
    v69 = v16;
    v70 = v18;
    v71 = v17;
    v73 = v21;
    v72 = v15;
    v50 = -[HMDBackingStoreCacheCreateZoneOperation initWithZoneName:creationBlock:](v48, "initWithZoneName:creationBlock:", v72, v67);
    objc_msgSend(v49, "backingStore");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "submit:", v50);

    v30 = v68;
  }

}

+ (id)shortDescription
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

void __105__HMDCloudZone_createZoneWithName_rootRecordName_subscriptionName_owner_cacheZone_cloudCache_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v6)
  {
    v13 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithBackingStoreCacheZone:cloudCache:", v5, *(_QWORD *)(a1 + 32));
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)(a1 + 40);
      v16 = *(_QWORD *)(a1 + 48);
      v17 = *(_QWORD *)(a1 + 56);
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __105__HMDCloudZone_createZoneWithName_rootRecordName_subscriptionName_owner_cacheZone_cloudCache_completion___block_invoke_2;
      v19[3] = &unk_1E89A90F8;
      v20 = v13;
      v21 = *(id *)(a1 + 72);
      v18 = v14;
      +[HMDCloudGroup createGroupWithRootRecordName:owner:subscriptionName:cloudZone:completion:](HMDCloudGroup, "createGroupWithRootRecordName:owner:subscriptionName:cloudZone:completion:", v15, v16, v17, v18, v19);

      v7 = 0;
      goto LABEL_8;
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 11);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v8 = (void *)MEMORY[0x1D17BA0A0]();
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1 + 64);
    *(_DWORD *)buf = 138543874;
    v23 = v10;
    v24 = 2112;
    v25 = v11;
    v26 = 2112;
    v27 = v7;
    _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_ERROR, "%{public}@Failed to create zone %@ with error %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v8);
  v12 = *(_QWORD *)(a1 + 72);
  if (v12)
    (*(void (**)(uint64_t, _QWORD, void *))(v12 + 16))(v12, 0, v7);
LABEL_8:

}

void __105__HMDCloudZone_createZoneWithName_rootRecordName_subscriptionName_owner_cacheZone_cloudCache_completion___block_invoke_49(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  v5 = a3;
  if (v7)
    objc_msgSend(*(id *)(a1 + 32), "setRecordsAvailable:", 1);
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v6 + 16))(v6, *(_QWORD *)(a1 + 32), 0);

}

void __105__HMDCloudZone_createZoneWithName_rootRecordName_subscriptionName_owner_cacheZone_cloudCache_completion___block_invoke_2_51(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  v5 = a3;
  if (!v5)
    objc_msgSend(*(id *)(a1 + 32), "setRootGroup:", v7);
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    (*(void (**)(uint64_t, _QWORD, id))(v6 + 16))(v6, *(_QWORD *)(a1 + 32), v5);

}

void __105__HMDCloudZone_createZoneWithName_rootRecordName_subscriptionName_owner_cacheZone_cloudCache_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  v5 = a3;
  if (!v5)
    objc_msgSend(*(id *)(a1 + 32), "setRootGroup:", v7);
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    (*(void (**)(uint64_t, _QWORD, id))(v6 + 16))(v6, *(_QWORD *)(a1 + 32), v5);

}

@end
