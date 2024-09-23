@implementation HMDCloudGroup

- (HMDCloudGroup)init
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

- (HMDCloudGroup)initWithBackingStoreCacheGroup:(id)a3 cloudZone:(id)a4
{
  id v7;
  id v8;
  HMDCloudGroup *v9;
  HMDCloudGroup *v10;
  void *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)HMDCloudGroup;
  v9 = -[HMDCloudGroup init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_backingStoreGroup, a3);
    objc_storeWeak((id *)&v10->_cloudZone, v8);
    objc_msgSend(v8, "cache");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v10->_cache, v11);

  }
  return v10;
}

- (id)shortDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)objc_opt_class(), "shortDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCloudGroup rootRecordName](self, "rootRecordName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ Root Record = %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)description
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[HMDCloudGroup shortDescription](self, "shortDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("<%@>"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (id)logIdentifier
{
  __CFString *v2;
  __CFString *v3;
  __CFString *v4;

  -[HMDCloudGroup rootRecordName](self, "rootRecordName");
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = CFSTR("UnknownRoot");
  v4 = v2;

  return v4;
}

- (NSString)rootRecordName
{
  void *v2;
  void *v3;

  -[HMDCloudGroup backingStoreGroup](self, "backingStoreGroup");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rootRecordName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSUUID)parentIdentifier
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = objc_alloc(MEMORY[0x1E0CB3A28]);
  -[HMDCloudGroup cloudZone](self, "cloudZone");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "zone");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "zoneID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "zoneName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v3, "initWithUUIDString:", v7);

  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSUUID *)v8;
}

- (NSUUID)rootRecordObjectID
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  HMDCloudGroup *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0CB3A28]);
  -[HMDCloudGroup rootRecordName](self, "rootRecordName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithUUIDString:", v4);

  if (!v5)
  {
    v6 = (void *)MEMORY[0x1D17BA0A0]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v20 = v9;
      _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_ERROR, "%{public}@Root record objectID cannot be determined, generating a random", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v6);
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[HMDCloudGroup cloudZone](self, "cloudZone");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "zone");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "zoneID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "zoneName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)MEMORY[0x1E0CB3A28];
  v18 = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v18, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "hm_deriveUUIDFromBaseUUID:identifierSalt:withSalts:", v5, 0, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSUUID *)v16;
}

- (id)rootRecordModelObject
{
  HMDCloudGroupRootRecordModelObject *v3;
  void *v4;
  void *v5;
  HMDCloudGroupRootRecordModelObject *v6;

  v3 = [HMDCloudGroupRootRecordModelObject alloc];
  -[HMDCloudGroup rootRecordObjectID](self, "rootRecordObjectID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCloudGroup parentIdentifier](self, "parentIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HMDBackingStoreModelObject initWithObjectChangeType:uuid:parentUUID:](v3, "initWithObjectChangeType:uuid:parentUUID:", 1, v4, v5);

  return v6;
}

- (CKRecordID)privateZoneRootRecordID
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = objc_alloc(MEMORY[0x1E0C95070]);
  -[HMDCloudGroup rootRecordName](self, "rootRecordName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCloudGroup cloudZone](self, "cloudZone");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "zone");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "zoneID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v3, "initWithRecordName:zoneID:", v4, v7);

  return (CKRecordID *)v8;
}

- (BOOL)isRootRecordName:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[HMDCloudGroup rootRecordName](self, "rootRecordName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", v4);

  return v6;
}

- (BOOL)isRootRecord:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "recordID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "recordName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[HMDCloudGroup isRootRecordName:](self, "isRootRecordName:", v5);

  return (char)self;
}

- (void)fetchCloudRecordMap:(id)a3
{
  id v4;
  HMDBackingStoreCacheFetchRecordMappings *v5;
  void *v6;
  void *v7;
  void *v8;
  HMDBackingStoreCacheFetchRecordMappings *v9;

  v4 = a3;
  v5 = [HMDBackingStoreCacheFetchRecordMappings alloc];
  -[HMDCloudGroup backingStoreGroup](self, "backingStoreGroup");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HMDBackingStoreCacheFetchRecordMappings initWithGroup:fetchResult:](v5, "initWithGroup:fetchResult:", v6, v4);

  -[HMDCloudGroup cache](self, "cache");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "backingStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "submit:", v9);

}

- (void)cloudRecordWithNames:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  HMDBackingStoreCacheFetchRecords *v8;
  void *v9;
  HMDBackingStoreCacheFetchRecords *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  HMDCloudGroup *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, void *, void *);
  void *v24;
  id v25;
  id v26;
  id v27;
  id location;
  uint8_t buf[4];
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "count"))
  {
    objc_initWeak(&location, self);
    v8 = [HMDBackingStoreCacheFetchRecords alloc];
    -[HMDCloudGroup backingStoreGroup](self, "backingStoreGroup");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = MEMORY[0x1E0C809B0];
    v22 = 3221225472;
    v23 = __56__HMDCloudGroup_cloudRecordWithNames_completionHandler___block_invoke;
    v24 = &unk_1E89B3478;
    objc_copyWeak(&v27, &location);
    v26 = v7;
    v25 = v6;
    v10 = -[HMDBackingStoreCacheFetchRecords initWithGroup:records:fetchResult:](v8, "initWithGroup:records:fetchResult:", v9, v25, &v21);

    v15 = (void *)MEMORY[0x1D17BA0A0](v11, v12, v13, v14);
    v16 = self;
    HMFGetOSLogHandle();
    v17 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v30 = v18;
      _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_DEBUG, "%{public}@Fetching cloud records from cache", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v15);
    -[HMDCloudGroup cache](v16, "cache", v21, v22, v23, v24);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "backingStore");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "submit:", v10);

    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);
  }
  else if (v7)
  {
    (*((void (**)(id, _QWORD, _QWORD, _QWORD))v7 + 2))(v7, MEMORY[0x1E0C9AA70], MEMORY[0x1E0C9AA60], 0);
  }

}

- (void)cloudRecordWithName:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6)
  {
    v13[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __55__HMDCloudGroup_cloudRecordWithName_completionHandler___block_invoke;
    v10[3] = &unk_1E89AD0B8;
    v11 = v6;
    v12 = v8;
    -[HMDCloudGroup cloudRecordWithNames:completionHandler:](self, "cloudRecordWithNames:completionHandler:", v9, v10);

  }
  else if (v7)
  {
    (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, 0, 0);
  }

}

- (void)cloudRecordWithObjectIDs:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  HMDBackingStoreCacheFetchRecords *v8;
  void *v9;
  HMDBackingStoreCacheFetchRecords *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  HMDCloudGroup *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, void *, void *);
  void *v24;
  id v25;
  id v26;
  id v27;
  id location;
  uint8_t buf[4];
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "count"))
  {
    objc_initWeak(&location, self);
    v8 = [HMDBackingStoreCacheFetchRecords alloc];
    -[HMDCloudGroup backingStoreGroup](self, "backingStoreGroup");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = MEMORY[0x1E0C809B0];
    v22 = 3221225472;
    v23 = __60__HMDCloudGroup_cloudRecordWithObjectIDs_completionHandler___block_invoke;
    v24 = &unk_1E89B3478;
    objc_copyWeak(&v27, &location);
    v26 = v7;
    v25 = v6;
    v10 = -[HMDBackingStoreCacheFetchRecords initWithGroup:uuids:fetchResult:](v8, "initWithGroup:uuids:fetchResult:", v9, v25, &v21);

    v15 = (void *)MEMORY[0x1D17BA0A0](v11, v12, v13, v14);
    v16 = self;
    HMFGetOSLogHandle();
    v17 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v30 = v18;
      _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_DEBUG, "%{public}@Fetching cloud records from cache", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v15);
    -[HMDCloudGroup cache](v16, "cache", v21, v22, v23, v24);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "backingStore");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "submit:", v10);

    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);
  }
  else if (v7)
  {
    (*((void (**)(id, _QWORD, _QWORD, _QWORD))v7 + 2))(v7, MEMORY[0x1E0C9AA70], MEMORY[0x1E0C9AA60], 0);
  }

}

- (void)cloudRecordWithObjectID:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6)
  {
    v13[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __59__HMDCloudGroup_cloudRecordWithObjectID_completionHandler___block_invoke;
    v10[3] = &unk_1E89AD0B8;
    v11 = v6;
    v12 = v8;
    -[HMDCloudGroup cloudRecordWithObjectIDs:completionHandler:](self, "cloudRecordWithObjectIDs:completionHandler:", v9, v10);

  }
  else if (v7)
  {
    (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, 0, 0);
  }

}

- (void)_cloudRecordsForParentIDs:(id)a3 recursive:(BOOL)a4 completionHandler:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  HMDBackingStoreCacheFetchRecords *v10;
  void *v11;
  id v12;
  HMDBackingStoreCacheFetchRecords *v13;
  void *v14;
  HMDCloudGroup *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  HMDCloudGroup *v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t, void *, void *);
  void *v27;
  id v28;
  id v29;
  id v30;
  id location;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v6 = a4;
  v36 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  if (v9)
  {
    if (v8 && objc_msgSend(v8, "count"))
    {
      objc_initWeak(&location, self);
      v10 = [HMDBackingStoreCacheFetchRecords alloc];
      -[HMDCloudGroup backingStoreGroup](self, "backingStoreGroup");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = MEMORY[0x1E0C809B0];
      v25 = 3221225472;
      v26 = __71__HMDCloudGroup__cloudRecordsForParentIDs_recursive_completionHandler___block_invoke;
      v27 = &unk_1E89B3478;
      objc_copyWeak(&v30, &location);
      v12 = v8;
      v28 = v12;
      v29 = v9;
      v13 = -[HMDBackingStoreCacheFetchRecords initWithGroup:parentUuids:fetchResult:](v10, "initWithGroup:parentUuids:fetchResult:", v11, v12, &v24);

      v14 = (void *)MEMORY[0x1D17BA0A0](-[HMDBackingStoreCacheFetchRecords setRecursive:](v13, "setRecursive:", v6, v24, v25, v26, v27));
      v15 = self;
      HMFGetOSLogHandle();
      v16 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v33 = v17;
        v34 = 2112;
        v35 = v12;
        _os_log_impl(&dword_1CD062000, v16, OS_LOG_TYPE_DEBUG, "%{public}@Fetching child cloud records for parents %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v14);
      -[HMDCloudGroup cache](v15, "cache");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "backingStore");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "submit:", v13);

      objc_destroyWeak(&v30);
      objc_destroyWeak(&location);
    }
    else
    {
      (*((void (**)(id, _QWORD, _QWORD))v9 + 2))(v9, MEMORY[0x1E0C9AA60], 0);
    }
  }
  else
  {
    v20 = (void *)MEMORY[0x1D17BA0A0]();
    v21 = self;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v33 = v23;
      _os_log_impl(&dword_1CD062000, v22, OS_LOG_TYPE_ERROR, "%{public}@cloudRecordsForParentID called without completionHandler", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v20);
  }

}

- (void)cloudRecordsForParentID:(id)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (a3)
  {
    v10 = a3;
    v7 = (void *)MEMORY[0x1E0C99D20];
    v8 = a3;
    objc_msgSend(v7, "arrayWithObjects:count:", &v10, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = (void *)MEMORY[0x1E0C9AA60];
  }
  -[HMDCloudGroup _cloudRecordsForParentIDs:recursive:completionHandler:](self, "_cloudRecordsForParentIDs:recursive:completionHandler:", v9, 0, v6, v10, v11);

}

- (void)allDescendentsCloudRecordsForParentID:(id)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (a3)
  {
    v10 = a3;
    v7 = (void *)MEMORY[0x1E0C99D20];
    v8 = a3;
    objc_msgSend(v7, "arrayWithObjects:count:", &v10, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = (void *)MEMORY[0x1E0C9AA60];
  }
  -[HMDCloudGroup _cloudRecordsForParentIDs:recursive:completionHandler:](self, "_cloudRecordsForParentIDs:recursive:completionHandler:", v9, 1, v6, v10, v11);

}

- (void)rootRecordCompletionHandler:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HMDCloudGroup rootRecordName](self, "rootRecordName");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[HMDCloudGroup cloudRecordWithName:completionHandler:](self, "cloudRecordWithName:completionHandler:", v5, v4);

}

- (HMDCloudRecord)rootRecord
{
  void *v3;
  HMDCloudRecord *v4;
  HMDCloudRecord *v5;
  void *v6;
  void *v7;
  void *v8;

  -[HMDCloudGroup rootRecordName](self, "rootRecordName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCloudGroup cloudRecordWithName:](self, "cloudRecordWithName:", v3);
  v4 = (HMDCloudRecord *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v5 = [HMDCloudRecord alloc];
    -[HMDCloudGroup rootRecordObjectID](self, "rootRecordObjectID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCloudGroup rootRecordName](self, "rootRecordName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCloudGroup cloudZone](self, "cloudZone");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = -[HMDCloudRecord initWithObjectID:recordName:cloudZone:](v5, "initWithObjectID:recordName:cloudZone:", v6, v7, v8);

  }
  return v4;
}

- (BOOL)doRecordsExistInCache
{
  BOOL v2;
  NSObject *v4;
  HMDBackingStoreCacheFetchGroupInformation *v5;
  void *v6;
  NSObject *v7;
  HMDBackingStoreCacheFetchGroupInformation *v8;
  void *v9;
  HMDCloudGroup *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[4];
  NSObject *v17;
  HMDCloudGroup *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;
  uint8_t buf[4];
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (self->_doRecordsExistInCache)
    return 1;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  v4 = dispatch_group_create();
  dispatch_group_enter(v4);
  v5 = [HMDBackingStoreCacheFetchGroupInformation alloc];
  -[HMDCloudGroup backingStoreGroup](self, "backingStoreGroup");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __38__HMDCloudGroup_doRecordsExistInCache__block_invoke;
  v16[3] = &unk_1E89AD0E0;
  v19 = &v20;
  v7 = v4;
  v17 = v7;
  v18 = self;
  v8 = -[HMDBackingStoreCacheFetchGroupInformation initWithGroup:fetchResult:](v5, "initWithGroup:fetchResult:", v6, v16);

  v9 = (void *)MEMORY[0x1D17BA0A0]();
  v10 = self;
  HMFGetOSLogHandle();
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v25 = v12;
    _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_DEBUG, "%{public}@Fetching cloud group information", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v9);
  -[HMDCloudGroup cache](v10, "cache");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "backingStore");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "submit:", v8);

  dispatch_group_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  v2 = *((_BYTE *)v21 + 24) != 0;
  self->_doRecordsExistInCache = *((_BYTE *)v21 + 24);

  _Block_object_dispose(&v20, 8);
  return v2;
}

- (id)cloudRecordWithName:(id)a3
{
  id v4;
  NSObject *v5;
  HMDBackingStoreCacheFetchRecords *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  HMDBackingStoreCacheFetchRecords *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  HMDCloudGroup *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t, void *, void *);
  void *v29;
  HMDCloudGroup *v30;
  id v31;
  NSObject *v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  id v43;
  _QWORD v44[2];

  v44[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__57465;
  v38 = __Block_byref_object_dispose__57466;
  v39 = 0;
  if (v4)
  {
    v5 = dispatch_group_create();
    dispatch_group_enter(v5);
    v6 = [HMDBackingStoreCacheFetchRecords alloc];
    -[HMDCloudGroup backingStoreGroup](self, "backingStoreGroup");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v44[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = MEMORY[0x1E0C809B0];
    v27 = 3221225472;
    v28 = __37__HMDCloudGroup_cloudRecordWithName___block_invoke;
    v29 = &unk_1E89AD108;
    v33 = &v34;
    v30 = self;
    v9 = v4;
    v31 = v9;
    v10 = v5;
    v32 = v10;
    v11 = -[HMDBackingStoreCacheFetchRecords initWithGroup:records:fetchResult:](v6, "initWithGroup:records:fetchResult:", v7, v8, &v26);

    v17 = (void *)MEMORY[0x1D17BA0A0](v12, v13, v14, v15, v16);
    v18 = self;
    HMFGetOSLogHandle();
    v19 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v41 = v20;
      v42 = 2112;
      v43 = v9;
      _os_log_impl(&dword_1CD062000, v19, OS_LOG_TYPE_DEBUG, "%{public}@Fetching cloud record for %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v17);
    -[HMDCloudGroup cache](v18, "cache", v26, v27, v28, v29, v30);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "backingStore");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "submit:", v11);

    dispatch_group_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
    v23 = (void *)v35[5];
  }
  else
  {
    v23 = 0;
  }
  v24 = v23;
  _Block_object_dispose(&v34, 8);

  return v24;
}

- (id)cloudRecordWithObjectID:(id)a3
{
  id v4;
  NSObject *v5;
  HMDBackingStoreCacheFetchRecords *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  HMDBackingStoreCacheFetchRecords *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  HMDCloudGroup *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t, void *, void *);
  void *v29;
  HMDCloudGroup *v30;
  id v31;
  NSObject *v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  id v43;
  _QWORD v44[2];

  v44[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__57465;
  v38 = __Block_byref_object_dispose__57466;
  v39 = 0;
  if (v4)
  {
    v5 = dispatch_group_create();
    dispatch_group_enter(v5);
    v6 = [HMDBackingStoreCacheFetchRecords alloc];
    -[HMDCloudGroup backingStoreGroup](self, "backingStoreGroup");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v44[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = MEMORY[0x1E0C809B0];
    v27 = 3221225472;
    v28 = __41__HMDCloudGroup_cloudRecordWithObjectID___block_invoke;
    v29 = &unk_1E89AD108;
    v33 = &v34;
    v30 = self;
    v9 = v4;
    v31 = v9;
    v10 = v5;
    v32 = v10;
    v11 = -[HMDBackingStoreCacheFetchRecords initWithGroup:uuids:fetchResult:](v6, "initWithGroup:uuids:fetchResult:", v7, v8, &v26);

    v17 = (void *)MEMORY[0x1D17BA0A0](v12, v13, v14, v15, v16);
    v18 = self;
    HMFGetOSLogHandle();
    v19 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v41 = v20;
      v42 = 2112;
      v43 = v9;
      _os_log_impl(&dword_1CD062000, v19, OS_LOG_TYPE_DEBUG, "%{public}@Fetching cloud record for ID %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v17);
    -[HMDCloudGroup cache](v18, "cache", v26, v27, v28, v29, v30);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "backingStore");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "submit:", v11);

    dispatch_group_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
    v23 = (void *)v35[5];
  }
  else
  {
    v23 = 0;
  }
  v24 = v23;
  _Block_object_dispose(&v34, 8);

  return v24;
}

- (id)__cloudRecordWithObjectID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  HMDCloudGroup *v15;
  NSObject *v16;
  void *v17;
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    -[HMDCloudGroup cache](self, "cache");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "backingStore");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCloudGroup backingStoreGroup](self, "backingStoreGroup");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0;
    objc_msgSend(v6, "__fetchWithGroup:uuids:error:", v7, v8, &v19);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v19;

    v11 = 0;
    if (!v10)
    {
      if (objc_msgSend(v9, "count"))
      {
        objc_msgSend(v9, "firstObject");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          -[HMDCloudGroup cloudZone](self, "cloudZone");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "createCloudRecordWithFetchResult:", v12);
          v11 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v11 = 0;
        }

      }
      else
      {
        v11 = 0;
      }
    }
    v14 = (void *)MEMORY[0x1D17BA0A0]();
    v15 = self;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v21 = v17;
      v22 = 2112;
      v23 = v4;
      v24 = 2112;
      v25 = v10;
      _os_log_impl(&dword_1CD062000, v16, OS_LOG_TYPE_DEBUG, "%{public}@Completed fetch cloud record for ID %@ with error %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v14);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)updateCloudRecord:(id)a3
{
  id v4;
  NSObject *v5;
  HMDBackingStoreCacheUpdateRecordOperation *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  HMDBackingStoreCacheUpdateRecordOperation *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  HMDCloudGroup *v19;
  NSObject *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t, void *);
  void *v29;
  id v30;
  NSObject *v31;
  id v32;
  id location;
  uint8_t buf[4];
  id v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v5 = dispatch_group_create();
    dispatch_group_enter(v5);
    objc_initWeak(&location, self);
    v6 = [HMDBackingStoreCacheUpdateRecordOperation alloc];
    -[HMDCloudGroup backingStoreGroup](self, "backingStoreGroup");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "record");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cachedData");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v4, "objectEncoding");
    v26 = MEMORY[0x1E0C809B0];
    v27 = 3221225472;
    v28 = __35__HMDCloudGroup_updateCloudRecord___block_invoke;
    v29 = &unk_1E89BCB20;
    objc_copyWeak(&v32, &location);
    v11 = v4;
    v30 = v11;
    v12 = v5;
    v31 = v12;
    v13 = -[HMDBackingStoreCacheUpdateRecordOperation initWithGroup:record:data:encoding:resultBlock:](v6, "initWithGroup:record:data:encoding:resultBlock:", v7, v8, v9, v10, &v26);

    v18 = (void *)MEMORY[0x1D17BA0A0](v14, v15, v16, v17);
    v19 = self;
    HMFGetOSLogHandle();
    v20 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v21 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "recordName", v26, v27, v28, v29, v30);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDCloudGroup backingStoreGroup](v19, "backingStoreGroup");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v35 = v21;
      v36 = 2112;
      v37 = v22;
      v38 = 2112;
      v39 = v23;
      _os_log_impl(&dword_1CD062000, v20, OS_LOG_TYPE_DEBUG, "%{public}@Caching cloud record %@ in group %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v18);
    -[HMDCloudGroup cache](v19, "cache");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "backingStore");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "submit:", v13);

    dispatch_group_wait(v12, 0xFFFFFFFFFFFFFFFFLL);
    objc_destroyWeak(&v32);
    objc_destroyWeak(&location);

  }
}

- (void)updateCloudRecord:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  HMDBackingStoreCacheUpdateRecordOperation *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  HMDBackingStoreCacheUpdateRecordOperation *v14;
  void *v15;
  HMDCloudGroup *v16;
  NSObject *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  id location;
  uint8_t buf[4];
  id v30;
  __int16 v31;
  id v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v6)
  {
    objc_initWeak(&location, self);
    v8 = [HMDBackingStoreCacheUpdateRecordOperation alloc];
    -[HMDCloudGroup backingStoreGroup](self, "backingStoreGroup");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "record");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cachedData");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v6, "objectEncoding");
    v24[1] = 3221225472;
    v24[2] = __53__HMDCloudGroup_updateCloudRecord_completionHandler___block_invoke;
    v24[3] = &unk_1E89C0650;
    v24[0] = MEMORY[0x1E0C809B0];
    objc_copyWeak(&v27, &location);
    v13 = v6;
    v25 = v13;
    v26 = v7;
    v14 = -[HMDBackingStoreCacheUpdateRecordOperation initWithGroup:record:data:encoding:resultBlock:](v8, "initWithGroup:record:data:encoding:resultBlock:", v9, v10, v11, v12, v24);

    v15 = (void *)MEMORY[0x1D17BA0A0]();
    v16 = self;
    HMFGetOSLogHandle();
    v17 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v18 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "UUIDString");
      v20 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "recordName");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v30 = v18;
      v31 = 2112;
      v32 = v20;
      v33 = 2112;
      v34 = v21;
      _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_DEBUG, "%{public}@Caching cloud record %@/%@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v15);
    -[HMDCloudGroup cache](v16, "cache");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "backingStore");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "submit:", v14);

    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);
  }
  if (v7)
    (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);

}

- (void)deleteCloudRecordNames:(id)a3
{
  id v4;
  void *v5;
  HMDBackingStoreCacheDeleteRecordOperation *v6;
  void *v7;
  id v8;
  HMDBackingStoreCacheDeleteRecordOperation *v9;
  void *v10;
  HMDCloudGroup *v11;
  NSObject *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  HMDCloudGroup *v18;
  NSObject *v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id location;
  uint8_t buf[4];
  id v26;
  __int16 v27;
  id v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4 && objc_msgSend(v4, "count"))
  {
    objc_initWeak(&location, self);
    v6 = [HMDBackingStoreCacheDeleteRecordOperation alloc];
    -[HMDCloudGroup backingStoreGroup](self, "backingStoreGroup");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __40__HMDCloudGroup_deleteCloudRecordNames___block_invoke;
    v21[3] = &unk_1E89BF250;
    objc_copyWeak(&v23, &location);
    v8 = v5;
    v22 = v8;
    v9 = -[HMDBackingStoreCacheDeleteRecordOperation initWithGroup:recordNames:resultBlock:](v6, "initWithGroup:recordNames:resultBlock:", v7, v8, v21);

    v10 = (void *)MEMORY[0x1D17BA0A0]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (id)objc_claimAutoreleasedReturnValue();
      -[HMDCloudGroup backingStoreGroup](v11, "backingStoreGroup");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v26 = v13;
      v27 = 2112;
      v28 = v8;
      v29 = 2112;
      v30 = v14;
      _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_INFO, "%{public}@Deleting cloud record names %@ in group %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v10);
    -[HMDCloudGroup cache](v11, "cache");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "backingStore");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "submit:", v9);

    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
  }
  else
  {
    v17 = (void *)MEMORY[0x1D17BA0A0]();
    v18 = self;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v26 = v20;
      _os_log_impl(&dword_1CD062000, v19, OS_LOG_TYPE_ERROR, "%{public}@Record names where not specified", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v17);
  }

}

- (void)deleteCloudRecord:(id)a3
{
  void *v4;
  void *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    objc_msgSend(a3, "recordName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCloudGroup deleteCloudRecordNames:](self, "deleteCloudRecordNames:", v5);

  }
}

- (HMDCloudCache)cache
{
  return (HMDCloudCache *)objc_loadWeakRetained((id *)&self->_cache);
}

- (void)setCache:(id)a3
{
  objc_storeWeak((id *)&self->_cache, a3);
}

- (HMDCloudZone)cloudZone
{
  return (HMDCloudZone *)objc_loadWeakRetained((id *)&self->_cloudZone);
}

- (void)setCloudZone:(id)a3
{
  objc_storeWeak((id *)&self->_cloudZone, a3);
}

- (NSUUID)ownerID
{
  return self->_ownerID;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (HMDBackingStoreCacheGroup)backingStoreGroup
{
  return self->_backingStoreGroup;
}

- (void)setBackingStoreGroup:(id)a3
{
  objc_storeStrong((id *)&self->_backingStoreGroup, a3);
}

- (NSMutableDictionary)objectIDToRecordNameMap
{
  return self->_objectIDToRecordNameMap;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objectIDToRecordNameMap, 0);
  objc_storeStrong((id *)&self->_backingStoreGroup, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_ownerID, 0);
  objc_destroyWeak((id *)&self->_cloudZone);
  objc_destroyWeak((id *)&self->_cache);
}

void __40__HMDCloudGroup_deleteCloudRecordNames___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  uint64_t v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (!v3 && WeakRetained)
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v6 = *(id *)(a1 + 32);
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v30, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v19;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v19 != v9)
            objc_enumerationMutation(v6);
          if (objc_msgSend(v5, "isRootRecordName:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v10), (_QWORD)v18))
          {
            objc_msgSend(v5, "cloudZone");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "setRecordsAvailable:", 0);

          }
          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v30, 16);
      }
      while (v8);
    }

    v12 = (void *)MEMORY[0x1D17BA0A0]();
    v13 = v5;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = *(_QWORD *)(a1 + 32);
      objc_msgSend(v13, "backingStoreGroup");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v23 = v15;
      v24 = 2112;
      v25 = v16;
      v26 = 2112;
      v27 = v17;
      v28 = 2112;
      v29 = 0;
      _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_INFO, "%{public}@Completed deleting cloud record names %@ in group %@ with error %@", buf, 0x2Au);

    }
    objc_autoreleasePoolPop(v12);
  }

}

void __53__HMDCloudGroup_updateCloudRecord_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (v3)
    {
      v5 = (void *)MEMORY[0x1D17BA0A0]();
      v6 = WeakRetained;
      HMFGetOSLogHandle();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "backingStoreGroup");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = 138543874;
        v20 = v8;
        v21 = 2112;
        v22 = v9;
        v23 = 2112;
        v24 = v3;
        _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_ERROR, "%{public}@Failed to cache cloud record in group %@ with error %@", (uint8_t *)&v19, 0x20u);

      }
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "recordName");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(WeakRetained, "isRootRecordName:", v10);

      if (v11)
      {
        objc_msgSend(WeakRetained, "cloudZone");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setRecordsAvailable:", 1);

      }
      v5 = (void *)MEMORY[0x1D17BA0A0]();
      v13 = WeakRetained;
      HMFGetOSLogHandle();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "objectID");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "UUIDString");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "recordName");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = 138544130;
        v20 = v14;
        v21 = 2112;
        v22 = v16;
        v23 = 2112;
        v24 = v17;
        v25 = 2112;
        v26 = 0;
        _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Completed caching cloud record %@/%@ with error %@", (uint8_t *)&v19, 0x2Au);

      }
    }

    objc_autoreleasePoolPop(v5);
  }
  v18 = *(_QWORD *)(a1 + 40);
  if (v18)
    (*(void (**)(uint64_t, id))(v18 + 16))(v18, v3);

}

void __35__HMDCloudGroup_updateCloudRecord___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  const char *v10;
  NSObject *v11;
  os_log_type_t v12;
  void *v13;
  int v14;
  void *v15;
  id v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (v3)
    {
      v5 = (void *)MEMORY[0x1D17BA0A0]();
      v6 = WeakRetained;
      HMFGetOSLogHandle();
      v7 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
LABEL_10:

        objc_autoreleasePoolPop(v5);
        goto LABEL_11;
      }
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "backingStoreGroup");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543874;
      v18 = v8;
      v19 = 2112;
      v20 = v9;
      v21 = 2112;
      v22 = v3;
      v10 = "%{public}@Failed to cache cloud record in group %@ with error %@";
      v11 = v7;
      v12 = OS_LOG_TYPE_ERROR;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "recordName");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(WeakRetained, "isRootRecordName:", v13);

      if (v14)
      {
        objc_msgSend(WeakRetained, "cloudZone");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setRecordsAvailable:", 1);

      }
      v5 = (void *)MEMORY[0x1D17BA0A0]();
      v16 = WeakRetained;
      HMFGetOSLogHandle();
      v7 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        goto LABEL_10;
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "backingStoreGroup");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543874;
      v18 = v8;
      v19 = 2112;
      v20 = v9;
      v21 = 2112;
      v22 = 0;
      v10 = "%{public}@Completed caching cloud record in group %@ with error %@";
      v11 = v7;
      v12 = OS_LOG_TYPE_DEBUG;
    }
    _os_log_impl(&dword_1CD062000, v11, v12, v10, (uint8_t *)&v17, 0x20u);

    goto LABEL_10;
  }
LABEL_11:
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

void __41__HMDCloudGroup_cloudRecordWithObjectID___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  int v17;
  void *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (!v6)
  {
    if (objc_msgSend(v5, "count"))
    {
      objc_msgSend(v5, "firstObject");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        objc_msgSend(*(id *)(a1 + 32), "cloudZone");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "createCloudRecordWithFetchResult:", v7);
        v9 = objc_claimAutoreleasedReturnValue();
        v10 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
        v11 = *(void **)(v10 + 40);
        *(_QWORD *)(v10 + 40) = v9;

      }
    }
    v12 = (void *)MEMORY[0x1D17BA0A0]();
    v13 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = *(_QWORD *)(a1 + 40);
      v17 = 138543874;
      v18 = v15;
      v19 = 2112;
      v20 = v16;
      v21 = 2112;
      v22 = 0;
      _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_DEBUG, "%{public}@Completed fetch cloud record for ID %@ with error %@", (uint8_t *)&v17, 0x20u);

    }
    objc_autoreleasePoolPop(v12);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));

}

void __37__HMDCloudGroup_cloudRecordWithName___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  int v17;
  void *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (!v6)
  {
    if (objc_msgSend(v5, "count"))
    {
      objc_msgSend(v5, "firstObject");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        objc_msgSend(*(id *)(a1 + 32), "cloudZone");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "createCloudRecordWithFetchResult:", v7);
        v9 = objc_claimAutoreleasedReturnValue();
        v10 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
        v11 = *(void **)(v10 + 40);
        *(_QWORD *)(v10 + 40) = v9;

      }
    }
    v12 = (void *)MEMORY[0x1D17BA0A0]();
    v13 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = *(_QWORD *)(a1 + 40);
      v17 = 138543874;
      v18 = v15;
      v19 = 2112;
      v20 = v16;
      v21 = 2112;
      v22 = 0;
      _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_DEBUG, "%{public}@Completed fetch cloud record for %@ with error %@", (uint8_t *)&v17, 0x20u);

    }
    objc_autoreleasePoolPop(v12);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));

}

void __38__HMDCloudGroup_doRecordsExistInCache__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (a2 >= 1 && !v5)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  v7 = (void *)MEMORY[0x1D17BA0A0]();
  v8 = *(id *)(a1 + 40);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543618;
    v12 = v10;
    v13 = 2112;
    v14 = v6;
    _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_DEBUG, "%{public}@Completed fetch cloud group information with error %@", (uint8_t *)&v11, 0x16u);

  }
  objc_autoreleasePoolPop(v7);

}

void __71__HMDCloudGroup__cloudRecordsForParentIDs_recursive_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  uint64_t v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v8 = WeakRetained;
  v9 = 0;
  if (!v6 && WeakRetained)
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v5, "count"));
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v23 = v5;
    v10 = v5;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v25;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v25 != v13)
            objc_enumerationMutation(v10);
          v15 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v14);
          objc_msgSend(v8, "cloudZone");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "createCloudRecordWithFetchResult:", v15);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          if (v17)
            objc_msgSend(v9, "addObject:", v17);

          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
      }
      while (v12);
    }

    v5 = v23;
  }
  v18 = (void *)MEMORY[0x1D17BA0A0]();
  v19 = v8;
  HMFGetOSLogHandle();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    v29 = v21;
    v30 = 2112;
    v31 = v22;
    _os_log_impl(&dword_1CD062000, v20, OS_LOG_TYPE_DEBUG, "%{public}@Completed fetching child cloud records for parents %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v18);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __59__HMDCloudGroup_cloudRecordWithObjectID_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;

  v9 = a2;
  v6 = a4;
  if (objc_msgSend(v9, "count"))
  {
    objc_msgSend(v9, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  v8 = *(_QWORD *)(a1 + 40);
  if (v8)
    (*(void (**)(uint64_t, void *, id))(v8 + 16))(v8, v7, v6);

}

void __60__HMDCloudGroup_cloudRecordWithObjectIDs_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  NSObject *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  id v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v5, "count"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", *(_QWORD *)(a1 + 32));
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (!v6)
    {
      v28 = (void *)v9;
      v32 = 0u;
      v33 = 0u;
      v30 = 0u;
      v31 = 0u;
      v29 = v5;
      v11 = v5;
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v31;
        do
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v31 != v14)
              objc_enumerationMutation(v11);
            v16 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i);
            v17 = (void *)MEMORY[0x1D17BA0A0]();
            objc_msgSend(WeakRetained, "cloudZone");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "createCloudRecordWithFetchResult:", v16);
            v19 = (void *)objc_claimAutoreleasedReturnValue();

            if (v19)
            {
              objc_msgSend(v19, "objectID");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "setObject:forKeyedSubscript:", v19, v20);

            }
            objc_autoreleasePoolPop(v17);
          }
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
        }
        while (v13);
      }

      objc_msgSend(v8, "allKeys");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v28;
      objc_msgSend(v28, "removeObjectsInArray:", v21);

      v6 = 0;
      v5 = v29;
    }
    v22 = (void *)MEMORY[0x1D17BA0A0]();
    v23 = WeakRetained;
    HMFGetOSLogHandle();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v35 = v25;
      v36 = 2112;
      v37 = v6;
      _os_log_impl(&dword_1CD062000, v24, OS_LOG_TYPE_DEBUG, "%{public}@Completed fetching cloud records from cache with error %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v22);
    v26 = *(_QWORD *)(a1 + 40);
    if (v26)
      (*(void (**)(uint64_t, void *, void *, id))(v26 + 16))(v26, v8, v10, v6);

  }
  else
  {
    v27 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, _QWORD, void *))(v27 + 16))(v27, 0, 0, v8);
  }

}

void __55__HMDCloudGroup_cloudRecordWithName_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;

  v9 = a2;
  v6 = a4;
  if (objc_msgSend(v9, "count"))
  {
    objc_msgSend(v9, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  v8 = *(_QWORD *)(a1 + 40);
  if (v8)
    (*(void (**)(uint64_t, void *, id))(v8 + 16))(v8, v7, v6);

}

void __56__HMDCloudGroup_cloudRecordWithNames_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  id v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v5, "count"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      v29 = 0u;
      v30 = 0u;
      v27 = 0u;
      v28 = 0u;
      v26 = v5;
      v9 = v5;
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v28;
        do
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v28 != v12)
              objc_enumerationMutation(v9);
            v14 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
            objc_msgSend(WeakRetained, "cloudZone");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "createCloudRecordWithFetchResult:", v14);
            v16 = (void *)objc_claimAutoreleasedReturnValue();

            if (v16)
            {
              objc_msgSend(v16, "recordName");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "setObject:forKeyedSubscript:", v16, v17);

            }
          }
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
        }
        while (v11);
      }

      v5 = v26;
    }
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", *(_QWORD *)(a1 + 32));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "allKeys");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "removeObjectsInArray:", v19);

    v20 = (void *)MEMORY[0x1D17BA0A0]();
    v21 = WeakRetained;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v32 = v23;
      v33 = 2112;
      v34 = v6;
      _os_log_impl(&dword_1CD062000, v22, OS_LOG_TYPE_DEBUG, "%{public}@Completed fetching cloud records from cache with error %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v20);
    v24 = *(_QWORD *)(a1 + 40);
    if (v24)
      (*(void (**)(uint64_t, void *, void *, id))(v24 + 16))(v24, v8, v18, v6);

  }
  else
  {
    v25 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, _QWORD, void *))(v25 + 16))(v25, 0, 0, v8);
  }

}

+ (void)createGroupWithRootRecordName:(id)a3 owner:(id)a4 subscriptionName:(id)a5 cloudZone:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  HMDBackingStoreCacheCreateGroupOperation *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  HMDBackingStoreCacheCreateGroupOperation *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(uint64_t, void *, void *);
  void *v28;
  id v29;
  id v30;
  id v31;
  id v32;

  v12 = a3;
  v13 = a6;
  v14 = a7;
  v15 = a5;
  v16 = a4;
  v17 = [HMDBackingStoreCacheCreateGroupOperation alloc];
  objc_msgSend(v13, "backingStoreZone");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = MEMORY[0x1E0C809B0];
  v26 = 3221225472;
  v27 = __91__HMDCloudGroup_createGroupWithRootRecordName_owner_subscriptionName_cloudZone_completion___block_invoke;
  v28 = &unk_1E89AD070;
  v29 = v12;
  v30 = v13;
  v31 = v14;
  v32 = a1;
  v19 = v14;
  v20 = v13;
  v21 = v12;
  v22 = -[HMDBackingStoreCacheCreateGroupOperation initWithZone:owner:rootRecord:subscriptionName:subscription:creationBlock:](v17, "initWithZone:owner:rootRecord:subscriptionName:subscription:creationBlock:", v18, v16, v21, v15, 0, &v25);

  objc_msgSend(v20, "cache", v25, v26, v27, v28);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "backingStore");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "submit:", v22);

}

+ (id)shortDescription
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t1_57509 != -1)
    dispatch_once(&logCategory__hmf_once_t1_57509, &__block_literal_global_24_57510);
  return (id)logCategory__hmf_once_v2_57511;
}

void __28__HMDCloudGroup_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v2_57511;
  logCategory__hmf_once_v2_57511 = v0;

}

void __91__HMDCloudGroup_createGroupWithRootRecordName_owner_subscriptionName_cloudZone_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  int v14;
  void *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = (void *)MEMORY[0x1D17BA0A0]();
    v8 = *(id *)(a1 + 56);
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(a1 + 32);
      v14 = 138543874;
      v15 = v10;
      v16 = 2112;
      v17 = v11;
      v18 = 2112;
      v19 = v6;
      _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_ERROR, "%{public}@Failed to create group %@ with error %@", (uint8_t *)&v14, 0x20u);

    }
    objc_autoreleasePoolPop(v7);
    v12 = 0;
  }
  else
  {
    v12 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithBackingStoreCacheGroup:cloudZone:", v5, *(_QWORD *)(a1 + 40));
  }
  v13 = *(_QWORD *)(a1 + 48);
  if (v13)
    (*(void (**)(uint64_t, void *, id))(v13 + 16))(v13, v12, v6);

}

@end
