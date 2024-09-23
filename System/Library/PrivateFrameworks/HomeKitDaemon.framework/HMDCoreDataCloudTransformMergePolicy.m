@implementation HMDCoreDataCloudTransformMergePolicy

- (HMDCoreDataCloudTransformMergePolicy)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HMDCoreDataCloudTransformMergePolicy;
  return -[NSMergePolicy initWithMergeType:](&v3, sel_initWithMergeType_, 1);
}

- (BOOL)resolveOptimisticLockingVersionConflicts:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  HMDCoreDataCloudTransformMergePolicy *v16;
  unsigned int v17;
  BOOL v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  void *v24;
  void *v25;
  HMDCoreDataCloudTransformMergePolicy *v26;
  NSObject *v27;
  void *v28;
  char v30;
  void *v31;
  id obj;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  objc_super v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  void *v46;
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v40;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v40 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
        objc_msgSend(v12, "sourceObject");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "isDeleted");

        if (v14)
        {
          objc_msgSend(v12, "sourceObject");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v15);

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
    }
    while (v9);
  }

  v16 = self;
  v38.receiver = self;
  v38.super_class = (Class)HMDCoreDataCloudTransformMergePolicy;
  v17 = -[NSMergePolicy resolveOptimisticLockingVersionConflicts:error:](&v38, sel_resolveOptimisticLockingVersionConflicts_error_, v7, a4);
  v18 = v17;
  if (v17)
  {
    v30 = v17;
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v31 = v6;
    obj = v6;
    v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v47, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v35;
      do
      {
        for (j = 0; j != v20; ++j)
        {
          if (*(_QWORD *)v35 != v21)
            objc_enumerationMutation(obj);
          v23 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * j);
          objc_msgSend(v23, "managedObjectContext");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "refreshObject:mergeChanges:", v23, 0);
          v25 = (void *)MEMORY[0x227676638](objc_msgSend(v24, "deleteObject:", v23));
          v26 = v16;
          HMFGetOSLogHandle();
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v44 = v28;
            v45 = 2112;
            v46 = v23;
            _os_log_impl(&dword_2218F0000, v27, OS_LOG_TYPE_INFO, "%{public}@Delete trumps other changes for %@", buf, 0x16u);

            v16 = self;
          }

          objc_autoreleasePoolPop(v25);
        }
        v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v47, 16);
      }
      while (v20);
    }

    v6 = v31;
    v18 = v30;
  }

  return v18;
}

+ (id)logCategory
{
  return +[HMDCoreDataCloudTransform logCategory](HMDCoreDataCloudTransform, "logCategory");
}

@end
