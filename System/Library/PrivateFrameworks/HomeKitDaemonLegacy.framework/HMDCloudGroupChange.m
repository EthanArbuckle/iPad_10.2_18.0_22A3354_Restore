@implementation HMDCloudGroupChange

- (HMDCloudGroupChange)init
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

- (HMDCloudGroupChange)initWithGroup:(id)a3 temporaryCache:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  HMDCloudManagerMetricsDispatcher *v7;
  void *v8;
  HMDCloudManagerMetricsDispatcher *v9;
  HMDCloudGroupChange *v10;

  v4 = a4;
  v6 = a3;
  v7 = [HMDCloudManagerMetricsDispatcher alloc];
  +[HMDMetricsManager sharedLogEventSubmitter](HMDMetricsManager, "sharedLogEventSubmitter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HMDCloudManagerMetricsDispatcher initWithLogEventDispatcher:](v7, "initWithLogEventDispatcher:", v8);

  v10 = -[HMDCloudGroupChange initWithGroup:temporaryCache:metricsDispatcher:](self, "initWithGroup:temporaryCache:metricsDispatcher:", v6, v4, v9);
  return v10;
}

- (HMDCloudGroupChange)initWithGroup:(id)a3 temporaryCache:(BOOL)a4 metricsDispatcher:(id)a5
{
  id v8;
  id v9;
  void *v10;
  HMDCloudGroupChange *v11;
  HMDCloudGroupChange *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  HMDCloudChangeTree *v21;
  HMDCloudChangeTree *cloudChangeTree;
  uint64_t v23;
  NSMutableArray *cloudChanges;
  uint64_t v25;
  NSMutableArray *processingCloudChanges;
  uint64_t v27;
  NSMutableArray *processedCloudChanges;
  HMDCloudGroupChange *v30;
  SEL v31;
  objc_super v32;

  v8 = a3;
  v9 = a5;
  if (v9)
  {
    v10 = v9;
    v32.receiver = self;
    v32.super_class = (Class)HMDCloudGroupChange;
    v11 = -[HMDCloudGroupChange init](&v32, sel_init);
    v12 = v11;
    if (v11)
    {
      objc_storeWeak((id *)&v11->_cloudGroup, v8);
      v12->_temporaryCache = a4;
      objc_storeStrong((id *)&v12->_metricsDispatcher, a5);
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 2);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("1CAEDC10-E3E5-41A4-BB17-A9EEBA14A938"));
      if (v14)
        objc_msgSend(v13, "addObject:", v14);
      v15 = objc_alloc(MEMORY[0x1E0CB3A28]);
      objc_msgSend(v8, "cloudZone");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "zone");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "zoneID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "zoneName");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)objc_msgSend(v15, "initWithUUIDString:", v19);

      if (v20)
        objc_msgSend(v13, "addObject:", v20);
      v21 = -[HMDCloudChangeTree initWithRootUUIDs:]([HMDCloudChangeTree alloc], "initWithRootUUIDs:", v13);
      cloudChangeTree = v12->_cloudChangeTree;
      v12->_cloudChangeTree = v21;

      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v23 = objc_claimAutoreleasedReturnValue();
      cloudChanges = v12->_cloudChanges;
      v12->_cloudChanges = (NSMutableArray *)v23;

      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v25 = objc_claimAutoreleasedReturnValue();
      processingCloudChanges = v12->_processingCloudChanges;
      v12->_processingCloudChanges = (NSMutableArray *)v25;

      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v27 = objc_claimAutoreleasedReturnValue();
      processedCloudChanges = v12->_processedCloudChanges;
      v12->_processedCloudChanges = (NSMutableArray *)v27;

    }
    return v12;
  }
  else
  {
    v30 = (HMDCloudGroupChange *)_HMFPreconditionFailure();
    return (HMDCloudGroupChange *)-[HMDCloudGroupChange shortDescription](v30, v31);
  }
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
  -[HMDCloudGroupChange cloudGroup](self, "cloudGroup");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "shortDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ Group = <%@>"), v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[HMDCloudGroupChange shortDescription](self, "shortDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCloudGroupChange cloudChanges](self, "cloudChanges");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCloudGroupChange processingCloudChanges](self, "processingCloudChanges");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCloudGroupChange processedCloudChanges](self, "processedCloudChanges");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@, Pending = %@, Processing = %@, Processed = %@>"), v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSArray)allTransactionStoreRowIDs
{
  void *v2;
  void *v3;

  -[HMDCloudGroupChange cloudChangeTree](self, "cloudChangeTree");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allTransactionStoreRowIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSArray)processedTransactionStoreRowIDs
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[HMDCloudGroupChange processedCloudChanges](self, "processedCloudChanges", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v8), "rowIDs");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObjectsFromArray:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  objc_msgSend(v3, "allObjects");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v10;
}

- (BOOL)hasValidChanges
{
  void *v2;
  char v3;

  -[HMDCloudGroupChange cloudChangeTree](self, "cloudChangeTree");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasValidChanges");

  return v3;
}

- (HMDCloudGroupChange)changeWithObjectID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HMDCloudGroupChange *v9;
  NSObject *v10;
  void *v11;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    -[HMDCloudGroupChange cloudChangeTree](self, "cloudChangeTree");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForUUID:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "change");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = (void *)MEMORY[0x1D17BA0A0]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543362;
      v14 = v11;
      _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_ERROR, "%{public}@ObjectID not specified", (uint8_t *)&v13, 0xCu);

    }
    objc_autoreleasePoolPop(v8);
    v7 = 0;
  }

  return (HMDCloudGroupChange *)v7;
}

- (id)cloudRecordWithObjectID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  HMDCloudGroupChange *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    -[HMDCloudGroupChange changeWithObjectID:](self, "changeWithObjectID:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "cloudRecord");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v8 = v6;
    }
    else
    {
      -[HMDCloudGroupChange cachedCloudRecordWithObjectID:](self, "cachedCloudRecordWithObjectID:", v4);
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    v13 = v8;

  }
  else
  {
    v9 = (void *)MEMORY[0x1D17BA0A0]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543362;
      v16 = v12;
      _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_ERROR, "%{public}@ObjectID not specified", (uint8_t *)&v15, 0xCu);

    }
    objc_autoreleasePoolPop(v9);
    v13 = 0;
  }

  return v13;
}

- (void)cachedCloudRecordWithObjectID:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[HMDCloudGroupChange cloudGroup](self, "cloudGroup");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "cloudRecordWithObjectID:completionHandler:", v7, v6);

}

- (id)cachedCloudRecordWithObjectID:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[HMDCloudGroupChange cloudGroup](self, "cloudGroup");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cloudRecordWithObjectID:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)doRecordsExistInCache
{
  void *v2;
  char v3;

  -[HMDCloudGroupChange cloudGroup](self, "cloudGroup");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "doRecordsExistInCache");

  return v3;
}

- (HMDCloudGroupChange)changeWithRecordName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HMDCloudGroupChange *v9;
  NSObject *v10;
  void *v11;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    -[HMDCloudGroupChange cloudChangeTree](self, "cloudChangeTree");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForRecordName:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "change");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = (void *)MEMORY[0x1D17BA0A0]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543362;
      v14 = v11;
      _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_ERROR, "%{public}@RecordName not specified", (uint8_t *)&v13, 0xCu);

    }
    objc_autoreleasePoolPop(v8);
    v7 = 0;
  }

  return (HMDCloudGroupChange *)v7;
}

- (id)cloudRecordWithName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  HMDCloudGroupChange *v10;
  NSObject *v11;
  void *v12;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    -[HMDCloudGroupChange changeWithRecordName:](self, "changeWithRecordName:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "cloudRecord");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      -[HMDCloudGroupChange cloudGroup](self, "cloudGroup");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "cloudRecordWithName:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v8 = v6;

  }
  else
  {
    v9 = (void *)MEMORY[0x1D17BA0A0]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543362;
      v15 = v12;
      _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_ERROR, "%{public}@RecordName not specified", (uint8_t *)&v14, 0xCu);

    }
    objc_autoreleasePoolPop(v9);
    v8 = 0;
  }

  return v8;
}

- (void)addChangeWithObjectChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  HMDCloudGroupChange *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  HMDCloudGroupChange *v13;
  NSObject *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4 && (objc_msgSend(v4, "uuid"), v6 = (void *)objc_claimAutoreleasedReturnValue(), v6, v6))
  {
    v7 = (void *)MEMORY[0x1D17BA0A0]();
    v8 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543618;
      v17 = v10;
      v18 = 2112;
      v19 = v5;
      _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_DEBUG, "%{public}@Processing object change %@ for group change", (uint8_t *)&v16, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    -[HMDCloudGroupChange cloudChangeTree](v8, "cloudChangeTree");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "updateModel:", v5);

  }
  else
  {
    v12 = (void *)MEMORY[0x1D17BA0A0]();
    v13 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543362;
      v17 = v15;
      _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_ERROR, "%{public}@Object change not specified", (uint8_t *)&v16, 0xCu);

    }
    objc_autoreleasePoolPop(v12);
  }

}

- (void)addChangeWithRecord:(id)a3
{
  id v4;
  void *v5;
  HMDCloudGroupChange *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  HMDCloudGroupChange *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  HMDCloudGroupChange *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  HMDCloudChange *v31;
  _BOOL4 v32;
  void *v33;
  HMDCloudGroupChange *v34;
  NSObject *v35;
  _BOOL4 v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  HMDCloudGroupChange *v44;
  NSObject *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  uint8_t buf[4];
  void *v60;
  __int16 v61;
  id v62;
  __int16 v63;
  void *v64;
  __int16 v65;
  void *v66;
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v4)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v60 = v14;
      _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_ERROR, "%{public}@Record not specified", buf, 0xCu);

    }
    goto LABEL_11;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "recordID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v60 = v9;
    v61 = 2112;
    v62 = v10;
    _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_DEBUG, "%{public}@Processing CKRecord %@ for group change", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  if (!-[HMDCloudGroupChange decryptionFailed](v6, "decryptionFailed"))
  {
    -[HMDCloudGroupChange cloudGroup](v6, "cloudGroup");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "cloudZone");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (!-[HMDCloudGroupChange isTemporaryCache](v6, "isTemporaryCache"))
    {
      objc_msgSend(v4, "recordID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "recordName");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDCloudGroupChange cloudRecordWithName:](v6, "cloudRecordWithName:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v19)
      {
        objc_msgSend(v4, "recordChangeTag");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "record");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "recordChangeTag");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v20, "isEqualToString:", v22);

        if (v23)
        {
          v24 = (void *)MEMORY[0x1D17BA0A0]();
          v25 = v6;
          HMFGetOSLogHandle();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "recordID");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v60 = v27;
            v61 = 2112;
            v62 = v28;
            _os_log_impl(&dword_1CD062000, v26, OS_LOG_TYPE_INFO, "%{public}@Already have current record in cache, dropping %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v24);
          goto LABEL_38;
        }
      }

    }
    objc_msgSend(v4, "recordID");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "recordName");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "createCloudRecordWithObjectID:recordName:", 0, v30);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v19, "setRecord:", v4);
    v31 = -[HMDCloudChange initWithCloudObjectRecord:]([HMDCloudChange alloc], "initWithCloudObjectRecord:", v19);
    if ((objc_msgSend(v16, "doesProcessChangeEvenIfDecryptionFails") & 1) != 0
      || !objc_msgSend(v19, "decryptionFailed"))
    {
      if (v31)
      {
        -[HMDCloudGroupChange cloudChangeTree](v6, "cloudChangeTree");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDCloudChange objectID](v31, "objectID");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "objectForUUID:", v41);
        v42 = (void *)objc_claimAutoreleasedReturnValue();

        if (v42)
        {
          v43 = (void *)MEMORY[0x1D17BA0A0]();
          v44 = v6;
          HMFGetOSLogHandle();
          v45 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            -[HMDCloudChange objectID](v31, "objectID");
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "change");
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v57, "cloudRecord");
            v58 = v43;
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            -[HMDCloudChange cloudRecord](v31, "cloudRecord");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544130;
            v60 = v56;
            v61 = 2112;
            v62 = v55;
            v63 = 2112;
            v64 = v46;
            v65 = 2112;
            v66 = v47;
            _os_log_impl(&dword_1CD062000, v45, OS_LOG_TYPE_INFO, "%{public}@Duplicate records for the object ID %@, deleting record %@ replacing with %@", buf, 0x2Au);

            v43 = v58;
          }

          objc_autoreleasePoolPop(v43);
          objc_msgSend(v42, "change");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "cloudRecord");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDCloudChange updateDeletedCloudRecord:](v31, "updateDeletedCloudRecord:", v49);

          -[HMDCloudGroupChange cloudChangeTree](v44, "cloudChangeTree");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "removeNode:", v42);

        }
        -[HMDCloudGroupChange cloudChangeTree](v6, "cloudChangeTree");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "updateChange:", v31);

        goto LABEL_37;
      }
      v33 = (void *)MEMORY[0x1D17BA0A0]();
      v34 = v6;
      HMFGetOSLogHandle();
      v35 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        goto LABEL_36;
      HMFGetLogIdentifier();
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v60 = v52;
      v61 = 2112;
      v62 = v4;
      _os_log_impl(&dword_1CD062000, v35, OS_LOG_TYPE_ERROR, "%{public}@Could not create object change object for record %@", buf, 0x16u);
    }
    else
    {
      v32 = -[HMDCloudGroupChange isRootRecord:](v6, "isRootRecord:", v19);
      v33 = (void *)MEMORY[0x1D17BA0A0]();
      v34 = v6;
      HMFGetOSLogHandle();
      v35 = objc_claimAutoreleasedReturnValue();
      v36 = os_log_type_enabled(v35, OS_LOG_TYPE_ERROR);
      if (v32)
      {
        if (v36)
        {
          HMFGetLogIdentifier();
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "recordID");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "recordName");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v60 = v37;
          v61 = 2112;
          v62 = v39;
          _os_log_impl(&dword_1CD062000, v35, OS_LOG_TYPE_ERROR, "%{public}@Decryption has failed for root record %@, cannot process zone further", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v33);
        -[HMDCloudGroupChange setDecryptionFailed:](v34, "setDecryptionFailed:", 1);
        goto LABEL_37;
      }
      if (!v36)
      {
LABEL_36:

        objc_autoreleasePoolPop(v33);
LABEL_37:

LABEL_38:
        goto LABEL_39;
      }
      HMFGetLogIdentifier();
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "recordID");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "recordName");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v60 = v52;
      v61 = 2112;
      v62 = v54;
      _os_log_impl(&dword_1CD062000, v35, OS_LOG_TYPE_ERROR, "%{public}@Decryption has failed for record %@, dropping record but continuing to process zone", buf, 0x16u);

    }
    goto LABEL_36;
  }
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v11 = v6;
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v60 = v13;
    _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_ERROR, "%{public}@Decryption has already failed, do not process further", buf, 0xCu);

  }
LABEL_11:
  objc_autoreleasePoolPop(v5);
LABEL_39:

}

- (void)_addChangeWithDeletedCloudRecord:(id)a3
{
  id v4;
  HMDCloudChange *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  HMDCloudGroupChange *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  HMDCloudGroupChange *v18;
  NSObject *v19;
  void *v20;
  int v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  id v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v5 = -[HMDCloudChange initWithCloudObjectRecord:]([HMDCloudChange alloc], "initWithCloudObjectRecord:", v4);
    if (v5)
    {
      -[HMDCloudGroupChange cloudChangeTree](self, "cloudChangeTree");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDCloudChange objectID](v5, "objectID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectForUUID:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        v9 = (void *)MEMORY[0x1D17BA0A0]();
        v10 = self;
        HMFGetOSLogHandle();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDCloudChange objectID](v5, "objectID");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "change");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "cloudRecord");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = 138544130;
          v22 = v12;
          v23 = 2112;
          v24 = v13;
          v25 = 2112;
          v26 = v4;
          v27 = 2112;
          v28 = v15;
          _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_INFO, "%{public}@Duplicate records for the object ID %@, deleting record %@ but keeping %@", (uint8_t *)&v21, 0x2Au);

        }
        objc_autoreleasePoolPop(v9);
        objc_msgSend(v8, "change");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "updateDeletedCloudRecord:", v4);
      }
      else
      {
        -[HMDCloudChange forceChangeToDelete](v5, "forceChangeToDelete");
        -[HMDCloudGroupChange cloudChangeTree](self, "cloudChangeTree");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "updateChange:", v5);
      }

    }
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
      v21 = 138543362;
      v22 = v20;
      _os_log_impl(&dword_1CD062000, v19, OS_LOG_TYPE_ERROR, "%{public}@cloudRecord not specified, cannot create delete change", (uint8_t *)&v21, 0xCu);

    }
    objc_autoreleasePoolPop(v17);
  }

}

- (void)addChangeWithDeletedRecordID:(id)a3
{
  id v4;
  void *v5;
  HMDCloudGroupChange *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  HMDCloudGroupChange *v15;
  NSObject *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v4)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "recordName");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543618;
      v19 = v9;
      v20 = 2112;
      v21 = v10;
      _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_DEBUG, "%{public}@Processing deleted CKRecordID %@ for group change", (uint8_t *)&v18, 0x16u);

    }
    objc_autoreleasePoolPop(v5);
    objc_msgSend(v4, "recordName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCloudGroupChange cloudRecordWithName:](v6, "cloudRecordWithName:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      -[HMDCloudGroupChange _addChangeWithDeletedCloudRecord:](v6, "_addChangeWithDeletedCloudRecord:", v12);
    }
    else
    {
      v14 = (void *)MEMORY[0x1D17BA0A0]();
      v15 = v6;
      HMFGetOSLogHandle();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 138543618;
        v19 = v17;
        v20 = 2112;
        v21 = v4;
        _os_log_impl(&dword_1CD062000, v16, OS_LOG_TYPE_INFO, "%{public}@Object does not exist in cache, dropping delete %@", (uint8_t *)&v18, 0x16u);

      }
      objc_autoreleasePoolPop(v14);
    }

  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543362;
      v19 = v13;
      _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_ERROR, "%{public}@RecordID not specified", (uint8_t *)&v18, 0xCu);

    }
    objc_autoreleasePoolPop(v5);
  }

}

- (void)_loadTreeWithRecordMapping:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HMDCloudGroupChange cloudChangeTree](self, "cloudChangeTree");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateRecordMapping:", v4);

}

- (void)loadCloudChangeTreeFromCache:(id)a3
{
  id v4;
  void *v5;
  HMDCloudGroupChange *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCloudGroupChange cloudGroup](v6, "cloudGroup");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v17 = v8;
    v18 = 2112;
    v19 = v10;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Fetching cloud change tree info for group %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  objc_initWeak((id *)buf, v6);
  -[HMDCloudGroupChange cloudGroup](v6, "cloudGroup");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __52__HMDCloudGroupChange_loadCloudChangeTreeFromCache___block_invoke;
  v13[3] = &unk_1E89BC028;
  objc_copyWeak(&v15, (id *)buf);
  v12 = v4;
  v14 = v12;
  objc_msgSend(v11, "fetchCloudRecordMap:", v13);

  objc_destroyWeak(&v15);
  objc_destroyWeak((id *)buf);

}

- (void)_initializeCloudChanges
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[HMDCloudGroupChange cloudChangeTree](self, "cloudChangeTree");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cloudChanges");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCloudGroupChange setCloudChanges:](self, "setCloudChanges:", v4);

  -[HMDCloudGroupChange cloudChangeTree](self, "cloudChangeTree");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "invalidCloudChanges");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCloudGroupChange setProcessedCloudChanges:](self, "setProcessedCloudChanges:", v5);

}

- (void)loadCloudRecordsFromCache:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id location;

  v4 = a3;
  -[HMDCloudGroupChange cloudChangeTree](self, "cloudChangeTree");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "findAndDeletedChildren");

  -[HMDCloudGroupChange cloudChangeTree](self, "cloudChangeTree");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "findAndMarkOrphanedBranches");

  objc_initWeak(&location, self);
  -[HMDCloudGroupChange cloudGroup](self, "cloudGroup");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCloudGroupChange cloudChangeTree](self, "cloudChangeTree");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectsWithPotentialChanges");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __49__HMDCloudGroupChange_loadCloudRecordsFromCache___block_invoke;
  v11[3] = &unk_1E89BD528;
  v10 = v4;
  v12 = v10;
  objc_copyWeak(&v13, &location);
  objc_msgSend(v7, "cloudRecordWithObjectIDs:completionHandler:", v9, v11);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

- (void)loadCloudRecordsAndDetermineDeletesFromCache:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __68__HMDCloudGroupChange_loadCloudRecordsAndDetermineDeletesFromCache___block_invoke;
  v6[3] = &unk_1E89BE698;
  objc_copyWeak(&v8, &location);
  v5 = v4;
  v7 = v5;
  -[HMDCloudGroupChange loadCloudChangeTreeFromCache:](self, "loadCloudChangeTreeFromCache:", v6);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

- (BOOL)moreChangesToProcess
{
  void *v2;
  uint64_t v3;

  -[HMDCloudGroupChange cloudChanges](self, "cloudChanges");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3 != 0;
}

- (void)setAsProcessedChange:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  id v13;

  v13 = a3;
  -[HMDCloudGroupChange processingCloudChanges](self, "processingCloudChanges");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", v13);

  if (v5)
  {
    -[HMDCloudGroupChange processingCloudChanges](self, "processingCloudChanges");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[HMDCloudGroupChange cloudChanges](self, "cloudChanges");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "containsObject:", v13);

    if (!v8)
      goto LABEL_6;
    -[HMDCloudGroupChange cloudChanges](self, "cloudChanges");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v9 = v6;
  objc_msgSend(v6, "removeObject:", v13);

LABEL_6:
  -[HMDCloudGroupChange processedCloudChanges](self, "processedCloudChanges");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "containsObject:", v13);

  if ((v11 & 1) == 0)
  {
    -[HMDCloudGroupChange processedCloudChanges](self, "processedCloudChanges");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObject:", v13);

  }
}

- (void)setAllChangedAsProcessed
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[HMDCloudGroupChange _initializeCloudChanges](self, "_initializeCloudChanges");
  -[HMDCloudGroupChange processedCloudChanges](self, "processedCloudChanges");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCloudGroupChange processingCloudChanges](self, "processingCloudChanges");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v4);

  -[HMDCloudGroupChange processingCloudChanges](self, "processingCloudChanges");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeAllObjects");

  -[HMDCloudGroupChange processedCloudChanges](self, "processedCloudChanges");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCloudGroupChange cloudChanges](self, "cloudChanges");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObjectsFromArray:", v7);

  -[HMDCloudGroupChange cloudChanges](self, "cloudChanges");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeAllObjects");

}

- (BOOL)isRootRecordRequired
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  BOOL v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[HMDCloudGroupChange cloudGroup](self, "cloudGroup");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cloudZone");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "zoneRootRecordName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("DONOTUPLOAD"));

  if ((v6 & 1) != 0)
    return 0;
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[HMDCloudGroupChange processingCloudChanges](self, "processingCloudChanges", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if ((objc_msgSend(v13, "isAdded") & 1) != 0 || (objc_msgSend(v13, "isDeleted") & 1) != 0)
        {
          v7 = 1;
          goto LABEL_15;
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      v7 = 0;
      if (v10)
        continue;
      break;
    }
  }
  else
  {
    v7 = 0;
  }
LABEL_15:

  return v7;
}

- (id)rootRecordModelObject
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[HMDCloudGroupChange cloudGroup](self, "cloudGroup");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rootRecordModelObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDCloudGroupChange cloudChangeTree](self, "cloudChangeTree");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "recordMapWithFilter:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObjectIDToRecordNameMap:", v6);

  return v4;
}

- (void)addRootRecordChange
{
  void *v3;
  HMDCloudChange *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HMDCloudGroupChange *v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[HMDCloudGroupChange rootRecordModelObject](self, "rootRecordModelObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = -[HMDCloudChange initWithObjectChange:]([HMDCloudChange alloc], "initWithObjectChange:", v3);
    objc_msgSend(v3, "uuid");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCloudGroupChange cloudRecordWithObjectID:](self, "cloudRecordWithObjectID:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6
      || (-[HMDCloudGroupChange cloudGroup](self, "cloudGroup"),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v7, "rootRecord"),
          v6 = (void *)objc_claimAutoreleasedReturnValue(),
          v7,
          v6))
    {
      -[HMDCloudChange updateCloudRecord:](v4, "updateCloudRecord:", v6);

    }
    -[HMDCloudGroupChange addChange:setAsProcessing:](self, "addChange:setAsProcessing:", v4, 1);

  }
  else
  {
    v8 = (void *)MEMORY[0x1D17BA0A0]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543362;
      v13 = v11;
      _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_ERROR, "%{public}@Cannot determine root record object change model", (uint8_t *)&v12, 0xCu);

    }
    objc_autoreleasePoolPop(v8);
  }

}

- (void)collectRecordsForBatch
{
  void *v3;
  uint64_t v4;
  void *v5;
  HMDCloudGroupChange *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  unint64_t v18;
  unint64_t v19;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t v26[128];
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  -[HMDCloudGroupChange processingCloudChanges](self, "processingCloudChanges");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    v5 = (void *)MEMORY[0x1D17BA0A0]();
    v6 = self;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDCloudGroupChange processingCloudChanges](v6, "processingCloudChanges");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v28 = v8;
      v29 = 2112;
      v30 = v9;
      _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Changes already marked as processing when determining batch, added to next batch, %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v5);
  }
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[HMDCloudGroupChange cloudChanges](self, "cloudChanges", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "copy");

  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v23;
LABEL_7:
    v15 = 0;
    while (1)
    {
      if (*(_QWORD *)v23 != v14)
        objc_enumerationMutation(v11);
      v16 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v15);
      -[HMDCloudGroupChange processingCloudChanges](self, "processingCloudChanges");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "count");
      v19 = cloudPushBatchLimit;

      if (v18 >= v19)
        break;
      -[HMDCloudGroupChange cloudChanges](self, "cloudChanges");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "removeObject:", v16);

      if (objc_msgSend(v16, "isInvalid"))
        -[HMDCloudGroupChange processedCloudChanges](self, "processedCloudChanges");
      else
        -[HMDCloudGroupChange processingCloudChanges](self, "processingCloudChanges");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "addObject:", v16);

      if (v13 == ++v15)
      {
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
        if (v13)
          goto LABEL_7;
        break;
      }
    }
  }

  if (-[HMDCloudGroupChange isRootRecordRequired](self, "isRootRecordRequired"))
    -[HMDCloudGroupChange addRootRecordChange](self, "addRootRecordChange");
}

- (void)addChange:(id)a3 setAsProcessing:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  HMDCloudGroupChange *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v4 = a4;
  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (v6)
  {
    -[HMDCloudGroupChange _removeChange:](self, "_removeChange:", v6);
    if (objc_msgSend(v6, "isInvalid"))
    {
      -[HMDCloudGroupChange processedCloudChanges](self, "processedCloudChanges");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v4)
        -[HMDCloudGroupChange processingCloudChanges](self, "processingCloudChanges");
      else
        -[HMDCloudGroupChange cloudChanges](self, "cloudChanges");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v12 = v7;
    objc_msgSend(v7, "addObject:", v6);

    -[HMDCloudGroupChange cloudChangeTree](self, "cloudChangeTree");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "updateChange:", v6);

  }
  else
  {
    v8 = (void *)MEMORY[0x1D17BA0A0]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543362;
      v15 = v11;
      _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_ERROR, "%{public}@Change not specified", (uint8_t *)&v14, 0xCu);

    }
    objc_autoreleasePoolPop(v8);
  }

}

- (void)_removeChange:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t k;
  void *v31;
  void *v32;
  int v33;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "objectID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    -[HMDCloudGroupChange cloudChanges](self, "cloudChanges");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "copy");

    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v44;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v44 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
          objc_msgSend(v11, "objectID");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v4, "isEqual:", v12);

          if (v13)
          {
            -[HMDCloudGroupChange cloudChanges](self, "cloudChanges");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "removeObject:", v11);

          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
      }
      while (v8);
    }

    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    -[HMDCloudGroupChange processingCloudChanges](self, "processingCloudChanges");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v15, "copy");

    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v40;
      do
      {
        for (j = 0; j != v18; ++j)
        {
          if (*(_QWORD *)v40 != v19)
            objc_enumerationMutation(v16);
          v21 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * j);
          objc_msgSend(v21, "objectID");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v4, "isEqual:", v22);

          if (v23)
          {
            -[HMDCloudGroupChange processingCloudChanges](self, "processingCloudChanges");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "removeObject:", v21);

          }
        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
      }
      while (v18);
    }

    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    -[HMDCloudGroupChange processedCloudChanges](self, "processedCloudChanges", 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)objc_msgSend(v25, "copy");

    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v35, v47, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v36;
      do
      {
        for (k = 0; k != v28; ++k)
        {
          if (*(_QWORD *)v36 != v29)
            objc_enumerationMutation(v26);
          v31 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * k);
          objc_msgSend(v31, "objectID");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = objc_msgSend(v4, "isEqual:", v32);

          if (v33)
          {
            -[HMDCloudGroupChange processedCloudChanges](self, "processedCloudChanges");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "removeObject:", v31);

          }
        }
        v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v35, v47, 16);
      }
      while (v28);
    }

  }
}

- (void)removeChangeWithObjectID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HMDCloudGroupChange *v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    -[HMDCloudGroupChange changeWithObjectID:](self, "changeWithObjectID:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      -[HMDCloudGroupChange _removeChange:](self, "_removeChange:", v5);

  }
  else
  {
    v6 = (void *)MEMORY[0x1D17BA0A0]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543362;
      v11 = v9;
      _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_ERROR, "%{public}@ObjectID not specified", (uint8_t *)&v10, 0xCu);

    }
    objc_autoreleasePoolPop(v6);
  }

}

- (void)fetchBatchToUpload:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  int v16;
  void *v17;
  HMDCloudGroupChange *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v22 = a3;
  -[HMDCloudGroupChange collectRecordsForBatch](self, "collectRecordsForBatch");
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  -[HMDCloudGroupChange processingCloudChanges](self, "processingCloudChanges");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
  if (!v7)
    goto LABEL_20;
  v8 = v7;
  v9 = *(_QWORD *)v24;
  while (2)
  {
    for (i = 0; i != v8; ++i)
    {
      if (*(_QWORD *)v24 != v9)
        objc_enumerationMutation(v6);
      v11 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
      if (objc_msgSend(v11, "isDeleted"))
      {
        objc_msgSend(v11, "recordID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v12)
          goto LABEL_14;
        v13 = v5;
        goto LABEL_11;
      }
      objc_msgSend(v11, "record");
      v14 = objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        v12 = (void *)v14;
        v13 = v4;
LABEL_11:
        objc_msgSend(v13, "addObject:", v12);
        goto LABEL_14;
      }
      objc_msgSend(v11, "cloudRecord");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "encryptionFailed");

      if (v16)
      {
        v17 = (void *)MEMORY[0x1D17BA0A0]();
        v18 = self;
        HMFGetOSLogHandle();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v28 = v20;
          v29 = 2112;
          v30 = v11;
          _os_log_impl(&dword_1CD062000, v19, OS_LOG_TYPE_ERROR, "%{public}@Failed to encrypt %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v17);
        -[HMDCloudGroupChange setEncryptionFailed:](v18, "setEncryptionFailed:", 1);
        goto LABEL_20;
      }
      v12 = 0;
LABEL_14:

    }
    v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    if (v8)
      continue;
    break;
  }
LABEL_20:

  if (v22)
  {
    if (-[HMDCloudGroupChange encryptionFailed](self, "encryptionFailed"))
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 52);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, _QWORD, void *))v22 + 2))(v22, MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60], v21);

    }
    else
    {
      (*((void (**)(id, void *, void *, _QWORD))v22 + 2))(v22, v4, v5, 0);
    }
  }

}

- (void)setSaveAsProcessedWithRecord:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  HMDCloudGroupChange *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "recordID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "recordName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCloudGroupChange changeWithRecordName:](self, "changeWithRecordName:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v7, "updateChangeWithRecord:", v4);
    -[HMDCloudGroupChange cloudGroup](self, "cloudGroup");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "cloudRecord");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "updateCloudRecord:", v9);

    -[HMDCloudGroupChange setAsProcessedChange:](self, "setAsProcessedChange:", v7);
  }
  else
  {
    v10 = (void *)MEMORY[0x1D17BA0A0]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "recordID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "recordName");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543618;
      v17 = v13;
      v18 = 2112;
      v19 = v15;
      _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to find change for record %@, cannot update cloud cache", (uint8_t *)&v16, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
  }

}

- (void)resetRecordWithRecordID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  HMDCloudGroupChange *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "recordName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCloudGroupChange changeWithRecordName:](self, "changeWithRecordName:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "resetRecord");
    -[HMDCloudGroupChange cloudGroup](self, "cloudGroup");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cloudRecord");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "updateCloudRecord:", v8);

    -[HMDCloudGroupChange setAsProcessedChange:](self, "setAsProcessedChange:", v6);
  }
  else
  {
    v9 = (void *)MEMORY[0x1D17BA0A0]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "recordName");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543618;
      v15 = v12;
      v16 = 2112;
      v17 = v13;
      _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_ERROR, "%{public}@Failed to find change for record %@, cannot reset cloud cache", (uint8_t *)&v14, 0x16u);

    }
    objc_autoreleasePoolPop(v9);
  }

}

- (void)setDeleteAsProcessedWithRecordID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  HMDCloudGroupChange *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "recordName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCloudGroupChange changeWithRecordName:](self, "changeWithRecordName:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[HMDCloudGroupChange cloudGroup](self, "cloudGroup");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cloudRecord");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "deleteCloudRecord:", v8);

    -[HMDCloudGroupChange setAsProcessedChange:](self, "setAsProcessedChange:", v6);
  }
  else
  {
    v9 = (void *)MEMORY[0x1D17BA0A0]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "recordName");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543618;
      v15 = v12;
      v16 = 2112;
      v17 = v13;
      _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_ERROR, "%{public}@Failed to find deleted change for recordID %@, cannot update cloud cache", (uint8_t *)&v14, 0x16u);

    }
    objc_autoreleasePoolPop(v9);
  }

}

- (void)flushAllChangesToCache
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[HMDCloudGroupChange cloudGroup](self, "cloudGroup");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[HMDCloudGroupChange cloudChanges](self, "cloudChanges", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v10, "isDeleted"))
        {
          objc_msgSend(v10, "cloudRecord");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "deleteCloudRecord:", v11);
        }
        else
        {
          if ((objc_msgSend(v10, "isInvalid") & 1) != 0)
            goto LABEL_13;
          objc_msgSend(v10, "deletedCloudRecord");
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (v12)
          {
            objc_msgSend(v10, "deletedCloudRecord");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "deleteCloudRecord:", v13);

          }
          objc_msgSend(v10, "cloudRecord");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "updateCloudRecord:", v11);
        }

LABEL_13:
        -[HMDCloudGroupChange setAsProcessedChange:](self, "setAsProcessedChange:", v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

}

- (BOOL)isRootRecordName:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[HMDCloudGroupChange cloudGroup](self, "cloudGroup");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isRootRecordName:", v4);

  return v6;
}

- (BOOL)isRootRecord:(id)a3
{
  void *v4;

  if (!a3)
    return 0;
  objc_msgSend(a3, "recordName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[HMDCloudGroupChange isRootRecordName:](self, "isRootRecordName:", v4);

  return (char)self;
}

- (NSArray)objectChanges
{
  void *v3;
  void *v4;
  void *v5;

  -[HMDCloudGroupChange _initializeCloudChanges](self, "_initializeCloudChanges");
  -[HMDCloudGroupChange cloudChanges](self, "cloudChanges");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDBackingStoreTransactionBlock sort:](HMDBackingStoreTransactionBlock, "sort:", v3);

  -[HMDCloudGroupChange cloudChanges](self, "cloudChanges");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  return (NSArray *)v5;
}

- (BOOL)isTemporaryCache
{
  return self->_temporaryCache;
}

- (BOOL)decryptionFailed
{
  return self->_decryptionFailed;
}

- (void)setDecryptionFailed:(BOOL)a3
{
  self->_decryptionFailed = a3;
}

- (BOOL)encryptionFailed
{
  return self->_encryptionFailed;
}

- (void)setEncryptionFailed:(BOOL)a3
{
  self->_encryptionFailed = a3;
}

- (BOOL)controllerIdentifierChanged
{
  return self->_controllerIdentifierChanged;
}

- (void)setControllerIdentifierChanged:(BOOL)a3
{
  self->_controllerIdentifierChanged = a3;
}

- (HMDCloudGroup)cloudGroup
{
  return (HMDCloudGroup *)objc_loadWeakRetained((id *)&self->_cloudGroup);
}

- (HMDCloudChangeTree)cloudChangeTree
{
  return self->_cloudChangeTree;
}

- (void)setCloudChangeTree:(id)a3
{
  objc_storeStrong((id *)&self->_cloudChangeTree, a3);
}

- (NSMutableArray)cloudChanges
{
  return self->_cloudChanges;
}

- (void)setCloudChanges:(id)a3
{
  objc_storeStrong((id *)&self->_cloudChanges, a3);
}

- (NSMutableArray)processingCloudChanges
{
  return self->_processingCloudChanges;
}

- (void)setProcessingCloudChanges:(id)a3
{
  objc_storeStrong((id *)&self->_processingCloudChanges, a3);
}

- (NSMutableArray)processedCloudChanges
{
  return self->_processedCloudChanges;
}

- (void)setProcessedCloudChanges:(id)a3
{
  objc_storeStrong((id *)&self->_processedCloudChanges, a3);
}

- (HMDCloudManagerMetricsDispatcher)metricsDispatcher
{
  return (HMDCloudManagerMetricsDispatcher *)objc_getProperty(self, a2, 56, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metricsDispatcher, 0);
  objc_storeStrong((id *)&self->_processedCloudChanges, 0);
  objc_storeStrong((id *)&self->_processingCloudChanges, 0);
  objc_storeStrong((id *)&self->_cloudChanges, 0);
  objc_storeStrong((id *)&self->_cloudChangeTree, 0);
  objc_destroyWeak((id *)&self->_cloudGroup);
}

void __68__HMDCloudGroupChange_loadCloudRecordsAndDetermineDeletesFromCache___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  uint64_t v5;
  _QWORD v6[4];
  id v7;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __68__HMDCloudGroupChange_loadCloudRecordsAndDetermineDeletesFromCache___block_invoke_2;
    v6[3] = &unk_1E89C1A48;
    v7 = *(id *)(a1 + 32);
    objc_msgSend(WeakRetained, "loadCloudRecordsFromCache:", v6);

  }
  else
  {
    v5 = *(_QWORD *)(a1 + 32);
    if (v5)
      (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }

}

uint64_t __68__HMDCloudGroupChange_loadCloudRecordsAndDetermineDeletesFromCache___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __49__HMDCloudGroupChange_loadCloudRecordsFromCache___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  id WeakRetained;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _BOOL4 v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  NSObject *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  id v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  char v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  NSObject *v48;
  void *v49;
  int v50;
  void *v51;
  id v52;
  NSObject *v53;
  NSObject *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  void *v62;
  const __CFString *v63;
  void *v64;
  void *v65;
  id v66;
  NSObject *v67;
  void *v68;
  uint64_t v69;
  void *v70;
  void *v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  id v75;
  void *v76;
  id v77;
  uint64_t v78;
  uint64_t v79;
  id obj;
  id obja;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  uint8_t v90[128];
  uint8_t buf[4];
  void *v92;
  __int16 v93;
  void *v94;
  _BYTE v95[128];
  uint64_t v96;

  v96 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v9)
  {
    v10 = *(_QWORD *)(a1 + 32);
    if (v10)
      (*(void (**)(uint64_t, id))(v10 + 16))(v10, v9);
    goto LABEL_60;
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (!WeakRetained)
    goto LABEL_57;
  v73 = a1;
  v74 = 0;
  v75 = v7;
  v76 = v8;
  v88 = 0u;
  v89 = 0u;
  v86 = 0u;
  v87 = 0u;
  obj = v7;
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v86, v95, 16);
  if (v12)
  {
    v13 = v12;
    v78 = *(_QWORD *)v87;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v87 != v78)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v86 + 1) + 8 * i);
        v16 = (void *)MEMORY[0x1D17BA0A0]();
        objc_msgSend(WeakRetained, "cloudChangeTree");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "objectForUUID:", v15);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (v18)
        {
          if (!objc_msgSend(v18, "orphaned"))
            goto LABEL_14;
          objc_msgSend(v18, "type");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = +[HMDCloudChangeTree modelTypeCanBeOrphaned:](HMDCloudChangeTree, "modelTypeCanBeOrphaned:", v19);

          if (v20)
          {
            objc_msgSend(v18, "deleteChildren");
LABEL_14:
            objc_msgSend(WeakRetained, "cloudChangeTree", v73, v74, v75);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(obj, "objectForKeyedSubscript:", v15);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "updateNode:withCloudRecord:", v18, v22);

            goto LABEL_22;
          }
          v28 = MEMORY[0x1D17BA0A0]();
          v29 = WeakRetained;
          HMFGetOSLogHandle();
          v30 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "shortDescription");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v92 = v31;
            v93 = 2112;
            v94 = v32;
            _os_log_impl(&dword_1CD062000, v30, OS_LOG_TYPE_ERROR, "%{public}@Record appears to be orphaned ignoring %@", buf, 0x16u);

          }
          v27 = (void *)v28;
        }
        else
        {
          v23 = MEMORY[0x1D17BA0A0]();
          v24 = WeakRetained;
          HMFGetOSLogHandle();
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v92 = v26;
            v93 = 2112;
            v94 = v15;
            _os_log_impl(&dword_1CD062000, v25, OS_LOG_TYPE_ERROR, "%{public}@loadCloudRecordsFromCache skipping node of founded records no longer in tree %@", buf, 0x16u);

          }
          v27 = (void *)v23;
        }
        objc_autoreleasePoolPop(v27);
LABEL_22:

        objc_autoreleasePoolPop(v16);
      }
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v86, v95, 16);
    }
    while (v13);
  }

  v84 = 0u;
  v85 = 0u;
  v82 = 0u;
  v83 = 0u;
  v77 = v76;
  obja = (id)objc_msgSend(v77, "countByEnumeratingWithState:objects:count:", &v82, v90, 16);
  if (!obja)
    goto LABEL_56;
  v79 = *(_QWORD *)v83;
  do
  {
    v33 = 0;
    do
    {
      if (*(_QWORD *)v83 != v79)
        objc_enumerationMutation(v77);
      v34 = *(void **)(*((_QWORD *)&v82 + 1) + 8 * (_QWORD)v33);
      v35 = (void *)MEMORY[0x1D17BA0A0]();
      objc_msgSend(WeakRetained, "cloudChangeTree");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "objectForUUID:", v34);
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      if (v37)
      {
        objc_msgSend(v37, "change");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v38, "isAdded"))
        {
          v39 = objc_msgSend(v37, "orphaned");

          if ((v39 & 1) == 0)
          {
            objc_msgSend(WeakRetained, "cloudGroup");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "cloudZone");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "uuid");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "recordName");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "createCloudRecordWithObjectID:recordName:", v42, v43);
            v44 = (void *)objc_claimAutoreleasedReturnValue();

            if (v44)
            {
              objc_msgSend(WeakRetained, "cloudChangeTree");
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v45, "updateNode:withCloudRecord:", v37, v44);

            }
            else
            {
              v65 = (void *)MEMORY[0x1D17BA0A0]();
              v66 = WeakRetained;
              HMFGetOSLogHandle();
              v67 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
              {
                HMFGetLogIdentifier();
                v68 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                v92 = v68;
                v93 = 2112;
                v94 = v34;
                _os_log_impl(&dword_1CD062000, v67, OS_LOG_TYPE_ERROR, "%{public}@loadCloudRecordsFromCache failed to create record for %@", buf, 0x16u);

              }
              objc_autoreleasePoolPop(v65);
            }
LABEL_49:

            goto LABEL_50;
          }
        }
        else
        {

        }
        v50 = objc_msgSend(v37, "orphaned", v73, v74, v75);
        v51 = (void *)MEMORY[0x1D17BA0A0]();
        v52 = WeakRetained;
        HMFGetOSLogHandle();
        v53 = objc_claimAutoreleasedReturnValue();
        v54 = v53;
        if (v50)
        {
          if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "uuid");
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v92 = v55;
            v93 = 2112;
            v94 = v56;
            _os_log_impl(&dword_1CD062000, v54, OS_LOG_TYPE_INFO, "%{public}@Changes has been orphaned before it can be pushed to the cloud %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v51);
        }
        else
        {
          if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "change");
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v92 = v57;
            v93 = 2112;
            v94 = v58;
            _os_log_impl(&dword_1CD062000, v54, OS_LOG_TYPE_ERROR, "%{public}@Cannot create a new record for non-added change, %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v51);
          objc_msgSend(v52, "metricsDispatcher");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "change");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v60, "type");
          v61 = objc_claimAutoreleasedReturnValue();
          v62 = (void *)v61;
          if (v61)
            v63 = (const __CFString *)v61;
          else
            v63 = CFSTR("unknown");
          objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 11);
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v59, "submitFailureEventWithModelType:failureCode:error:", v63, 1, v64);

        }
        objc_msgSend(v37, "change");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "forceChangeToInvalid");
        goto LABEL_49;
      }
      v46 = (void *)MEMORY[0x1D17BA0A0]();
      v47 = WeakRetained;
      HMFGetOSLogHandle();
      v48 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v92 = v49;
        v93 = 2112;
        v94 = v34;
        _os_log_impl(&dword_1CD062000, v48, OS_LOG_TYPE_ERROR, "%{public}@loadCloudRecordsFromCache skipping node no longer in tree %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v46);
LABEL_50:

      objc_autoreleasePoolPop(v35);
      v33 = (char *)v33 + 1;
    }
    while (obja != v33);
    v69 = objc_msgSend(v77, "countByEnumeratingWithState:objects:count:", &v82, v90, 16);
    obja = (id)v69;
  }
  while (v69);
LABEL_56:

  objc_msgSend(WeakRetained, "cloudChangeTree");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "logChangeTreeWithIndent:", &stru_1E89C3E38);

  objc_msgSend(WeakRetained, "_initializeCloudChanges");
  objc_msgSend(WeakRetained, "cloudChanges");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDBackingStoreTransactionBlock sort:](HMDBackingStoreTransactionBlock, "sort:", v71);

  v7 = v75;
  v8 = v76;
  a1 = v73;
  v9 = v74;
LABEL_57:
  v72 = *(_QWORD *)(a1 + 32);
  if (v72)
    (*(void (**)(uint64_t, _QWORD))(v72 + 16))(v72, 0);

LABEL_60:
}

void __52__HMDCloudGroupChange_loadCloudChangeTreeFromCache___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  uint64_t v9;
  void (*v10)(void);
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = WeakRetained;
  if (v6)
  {
    v9 = *(_QWORD *)(a1 + 32);
    if (v9)
    {
      v10 = *(void (**)(void))(v9 + 16);
LABEL_17:
      v10();
    }
  }
  else
  {
    if (WeakRetained)
    {
      v27 = 0u;
      v28 = 0u;
      v25 = 0u;
      v26 = 0u;
      v11 = v5;
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v26;
        do
        {
          v15 = 0;
          do
          {
            if (*(_QWORD *)v26 != v14)
              objc_enumerationMutation(v11);
            v16 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v15);
            v17 = (void *)MEMORY[0x1D17BA0A0](v12);
            objc_msgSend(v8, "_loadTreeWithRecordMapping:", v16, (_QWORD)v25);
            objc_autoreleasePoolPop(v17);
            ++v15;
          }
          while (v13 != v15);
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
          v13 = v12;
        }
        while (v12);
      }

      v18 = (void *)MEMORY[0x1D17BA0A0]();
      v19 = v8;
      HMFGetOSLogHandle();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "cloudGroup");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "identifier");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v30 = v21;
        v31 = 2112;
        v32 = v23;
        _os_log_impl(&dword_1CD062000, v20, OS_LOG_TYPE_INFO, "%{public}@Fetching cloud change tree info completed for group %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v18);
    }
    v24 = *(_QWORD *)(a1 + 32);
    if (v24)
    {
      v10 = *(void (**)(void))(v24 + 16);
      goto LABEL_17;
    }
  }

}

+ (id)shortDescription
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

@end
