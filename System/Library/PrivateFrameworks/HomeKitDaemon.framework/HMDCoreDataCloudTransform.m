@implementation HMDCoreDataCloudTransform

- (void)countResidentsInHomeWithUUID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  HMDCoreDataCloudTransform *v15;
  id v16;

  v6 = a3;
  v7 = a4;
  -[HMDCoreDataCloudTransform managedObjectContext](self, "managedObjectContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __75__HMDCoreDataCloudTransform_Home__countResidentsInHomeWithUUID_completion___block_invoke;
  v12[3] = &unk_24E79B3F0;
  v13 = v6;
  v14 = v8;
  v15 = self;
  v16 = v7;
  v9 = v7;
  v10 = v8;
  v11 = v6;
  objc_msgSend(v10, "performBlock:", v12);

}

void __75__HMDCoreDataCloudTransform_Home__countResidentsInHomeWithUUID_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  id v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v13 = 0;
  +[MKFCKModel modelWithModelID:context:error:](MKFCKHome, "modelWithModelID:context:error:", v2, v3, &v13);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v13;
  if (v4)
  {
    v6 = *(_QWORD *)(a1 + 56);
    objc_msgSend(v4, "residents");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, uint64_t, _QWORD))(v6 + 16))(v6, objc_msgSend(v7, "count"), 0);

  }
  else
  {
    v8 = (void *)MEMORY[0x227676638]();
    v9 = *(id *)(a1 + 48);
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138544130;
      v15 = v11;
      v16 = 2160;
      v17 = 1752392040;
      v18 = 2112;
      v19 = v12;
      v20 = 2114;
      v21 = v5;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Could not find the home for UUID: %{mask.hash}@. Error: %{public}@", buf, 0x2Au);

    }
    objc_autoreleasePoolPop(v8);
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

- (HMDCoreDataCloudTransform)init
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

- (HMDCoreDataCloudTransform)initWithCoreData:(id)a3 logEventSubmitter:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  HMDCoreDataCloudTransform *v10;

  v6 = (void *)MEMORY[0x24BDBCF50];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "standardUserDefaults");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[HMDCoreDataCloudTransform initWithCoreData:fakeRecordsEnabled:logEventSubmitter:userDefaults:](self, "initWithCoreData:fakeRecordsEnabled:logEventSubmitter:userDefaults:", v8, 1, v7, v9);

  return v10;
}

- (HMDCoreDataCloudTransform)initWithCoreData:(id)a3 fakeRecordsEnabled:(BOOL)a4 logEventSubmitter:(id)a5 userDefaults:(id)a6
{
  id v11;
  id v12;
  id v13;
  HMDCoreDataCloudTransform *v14;
  uint64_t v15;
  OS_os_log *logger;
  uint64_t v17;
  NSMutableSet *pendingChangedStoreIdentifiers;
  uint64_t v19;
  NSMutableSet *cloudImportInProgressStoreIdentifiers;
  uint64_t v21;
  NSMapTable *cloudChangeListeners;
  HMDCoreDataCloudTransformMergePolicy *v23;
  HMDCoreDataCloudTransformMergePolicy *mergePolicy;
  objc_super v26;

  v11 = a3;
  v12 = a5;
  v13 = a6;
  v26.receiver = self;
  v26.super_class = (Class)HMDCoreDataCloudTransform;
  v14 = -[HMDCoreDataCloudTransform init](&v26, sel_init);
  if (v14)
  {
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    logger = v14->_logger;
    v14->_logger = (OS_os_log *)v15;

    v14->_lock.lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v14->_coreData, a3);
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v17 = objc_claimAutoreleasedReturnValue();
    pendingChangedStoreIdentifiers = v14->_pendingChangedStoreIdentifiers;
    v14->_pendingChangedStoreIdentifiers = (NSMutableSet *)v17;

    v19 = objc_opt_new();
    cloudImportInProgressStoreIdentifiers = v14->_cloudImportInProgressStoreIdentifiers;
    v14->_cloudImportInProgressStoreIdentifiers = (NSMutableSet *)v19;

    objc_msgSend(MEMORY[0x24BDD1650], "strongToStrongObjectsMapTable");
    v21 = objc_claimAutoreleasedReturnValue();
    cloudChangeListeners = v14->_cloudChangeListeners;
    v14->_cloudChangeListeners = (NSMapTable *)v21;

    v14->_fakeRecordsEnabled = a4;
    objc_storeStrong((id *)&v14->_logEventSubmitter, a5);
    v23 = objc_alloc_init(HMDCoreDataCloudTransformMergePolicy);
    mergePolicy = v14->_mergePolicy;
    v14->_mergePolicy = v23;

    objc_storeStrong((id *)&v14->_userDefaults, a6);
    objc_msgSend(v11, "addNotificationListener:", v14);
  }

  return v14;
}

- (id)managedObjectContext
{
  hmf_unfair_data_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[HMDCoreDataCloudTransform _managedObjectContext]((id *)&self->super.super.isa);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(&p_lock->lock);
  return v4;
}

- (BOOL)runTransformWithError:(id *)a3
{
  void *v4;
  HMDCoreDataCloudTransform *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  _QWORD v10[5];
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = (void *)MEMORY[0x227676638](self, a2, a3);
  v5 = self;
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v12 = v7;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Synchronous manual run requested", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v4);
  -[HMDCoreDataCloudTransform managedObjectContext](v5, "managedObjectContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __51__HMDCoreDataCloudTransform_runTransformWithError___block_invoke;
  v10[3] = &unk_24E79C240;
  v10[4] = v5;
  objc_msgSend(v8, "performBlockAndWait:", v10);

  return 1;
}

- (void)runTransformWithCompletion:(id)a3
{
  id v4;
  void *v5;
  HMDCoreDataCloudTransform *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543362;
    v11 = v8;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Manual run requested", (uint8_t *)&v10, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDCoreDataCloudTransform managedObjectContext](v6, "managedObjectContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCoreDataCloudTransform _runTransformOnContext:storeIdentifiers:completeMergeHomeModelID:completion:](v6, v9, 0, 0, v4);

}

- (void)runCompleteMergeTransformForHomeWithModelID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDCoreDataCloudTransform *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x227676638]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543362;
    v14 = v11;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Complete merge requested", (uint8_t *)&v13, 0xCu);

  }
  objc_autoreleasePoolPop(v8);
  -[HMDCoreDataCloudTransform managedObjectContext](v9, "managedObjectContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCoreDataCloudTransform _runTransformOnContext:storeIdentifiers:completeMergeHomeModelID:completion:](v9, v12, 0, v6, v7);

}

- (void)registerCloudChangeListener:(id)a3 forEntities:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v9 = MEMORY[0x24BDAC760];
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __69__HMDCoreDataCloudTransform_registerCloudChangeListener_forEntities___block_invoke;
  v20[3] = &unk_24E7841E8;
  v10 = v8;
  v21 = v10;
  objc_msgSend(v7, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v20);
  -[HMDCoreDataCloudTransform managedObjectContext](self, "managedObjectContext");
  v15[0] = v9;
  v15[1] = 3221225472;
  v15[2] = __69__HMDCoreDataCloudTransform_registerCloudChangeListener_forEntities___block_invoke_3;
  v15[3] = &unk_24E79AD20;
  v15[4] = self;
  v16 = v6;
  v17 = v7;
  v18 = v10;
  v19 = (id)objc_claimAutoreleasedReturnValue();
  v11 = v19;
  v12 = v10;
  v13 = v7;
  v14 = v6;
  objc_msgSend(v11, "performBlock:", v15);

}

- (id)newCloudMirrorExportStatusMonitor
{
  HMDCoreDataCloudMirroringExportStatusMonitor *v3;
  void *v4;
  void *v5;
  HMDCoreDataCloudMirroringExportStatusMonitor *v6;

  v3 = [HMDCoreDataCloudMirroringExportStatusMonitor alloc];
  -[HMDCoreDataCloudTransform coreData](self, "coreData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCoreDataCloudTransform managedObjectContext](self, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HMDCoreDataCloudMirroringExportStatusMonitor initWithCoreData:managedObjectContext:](v3, "initWithCoreData:managedObjectContext:", v4, v5);

  return v6;
}

- (BOOL)badCDPState
{
  void *v2;
  char v3;

  -[HMDCoreDataCloudTransform userDefaults](self, "userDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("badCDPState"));

  return v3;
}

- (void)coreData:(id)a3 persistentStoreWithIdentifierDidChange:(id)a4
{
  id v6;
  id v7;
  hmf_unfair_data_lock_s *p_lock;
  void *v9;
  HMDCoreDataCloudTransform *v10;
  NSObject *v11;
  void *v12;
  NSMutableSet *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (self && -[NSMutableSet count](self->_cloudImportInProgressStoreIdentifiers, "count"))
  {
    v9 = (void *)MEMORY[0x227676638]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543618;
      v19 = v12;
      v20 = 2114;
      v21 = v7;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_DEBUG, "%{public}@Waiting for cloud import to finish before running transform on store %{public}@", (uint8_t *)&v18, 0x16u);

    }
    objc_autoreleasePoolPop(v9);
    v13 = v10->_pendingChangedStoreIdentifiers;
    -[NSMutableSet addObject:](v13, "addObject:", v7);

    os_unfair_lock_unlock(&p_lock->lock);
  }
  else
  {
    -[HMDCoreDataCloudTransform _managedObjectContext]((id *)&self->super.super.isa);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCoreDataCloudTransform pendingChangedStoreIdentifiers]((id *)&self->super.super.isa);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setByAddingObject:", v7);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    -[HMDCoreDataCloudTransform pendingChangedStoreIdentifiers]((id *)&self->super.super.isa);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "removeAllObjects");

    os_unfair_lock_unlock(&self->_lock.lock);
    -[HMDCoreDataCloudTransform _runTransformOnContext:storeIdentifiers:completeMergeHomeModelID:completion:](self, v14, v16, 0, 0);

  }
}

- (void)coreData:(id)a3 cloudKitImportStartedForStoreWithIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDCoreDataCloudTransform *v9;
  NSObject *v10;
  void *v11;
  NSObject *logger;
  os_unfair_lock_s *p_lock;
  NSMutableSet *v14;
  int v15;
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x227676638]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138543618;
    v16 = v11;
    v17 = 2114;
    v18 = v7;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@CloudKit import started for store %{public}@", (uint8_t *)&v15, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  logger = v9->_logger;
  if (os_signpost_enabled(logger))
  {
    v15 = 138412290;
    v16 = v7;
    _os_signpost_emit_with_name_impl(&dword_2218F0000, logger, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "CoreDataCloudTransformImport", "storeIdentifier=%{signpost.description:attribute}@ ", (uint8_t *)&v15, 0xCu);
  }
  v9->_importSignpostID = 0xEEEEB0B5B2B2EEEELL;
  p_lock = &v9->_lock.lock;
  os_unfair_lock_lock_with_options();
  v14 = v9->_cloudImportInProgressStoreIdentifiers;
  -[NSMutableSet addObject:](v14, "addObject:", v7);

  os_unfair_lock_unlock(p_lock);
}

- (void)coreData:(id)a3 cloudKitImportFinishedForStoreWithIdentifier:(id)a4 duration:(double)a5 error:(id)a6
{
  id v10;
  id v11;
  id v12;
  OS_os_log *v13;
  NSObject *v14;
  os_signpost_id_t importSignpostID;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  HMDCoreDataCloudTransform *v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  HMMLogEventSubmitting *v25;
  HMDCoreDataCloudKitOperationLogEvent *v26;
  NSMutableSet *v27;
  NSMutableSet *v28;
  BOOL v29;
  void *v30;
  NSMutableSet *v31;
  void *v32;
  NSMutableSet *v33;
  int v34;
  id v35;
  __int16 v36;
  id v37;
  __int16 v38;
  double v39;
  __int16 v40;
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = self->_logger;
  v14 = v13;
  importSignpostID = self->_importSignpostID;
  if (importSignpostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v13))
  {
    HMFBooleanToString();
    v16 = (id)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v12, "code"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "domain");
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    }
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = 138413058;
    v35 = v11;
    v36 = 2112;
    v37 = v16;
    v38 = 2112;
    v39 = *(double *)&v17;
    v40 = 2112;
    v41 = v18;
    _os_signpost_emit_with_name_impl(&dword_2218F0000, v14, OS_SIGNPOST_INTERVAL_END, importSignpostID, "CoreDataCloudTransformImport", "storeIdentifier=%{signpost.description:attribute}@ succeeded=%{signpost.description:attribute}@ errorCode=%{signpost.description:attribute}@ errorDomain=%{signpost.description:attribute}@ ", (uint8_t *)&v34, 0x2Au);

  }
  self->_importSignpostID = 0;
  v19 = (void *)MEMORY[0x227676638]();
  v20 = self;
  HMFGetOSLogHandle();
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (v12)
  {
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = 138544130;
      v35 = v23;
      v36 = 2114;
      v37 = v11;
      v38 = 2048;
      v39 = a5;
      v40 = 2114;
      v41 = v12;
      _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_ERROR, "%{public}@CloudKit import for store %{public}@ failed after %f seconds: %{public}@", (uint8_t *)&v34, 0x2Au);

    }
  }
  else if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = 138543874;
    v35 = v24;
    v36 = 2114;
    v37 = v11;
    v38 = 2048;
    v39 = a5;
    _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_INFO, "%{public}@CloudKit import for store %{public}@ finished after %f seconds", (uint8_t *)&v34, 0x20u);

  }
  objc_autoreleasePoolPop(v19);
  v25 = v20->_logEventSubmitter;
  v26 = -[HMDCoreDataCloudKitOperationLogEvent initWithOperationType:]([HMDCoreDataCloudKitOperationLogEvent alloc], "initWithOperationType:", 1);
  -[HMMLogEventSubmitting submitLogEvent:error:](v25, "submitLogEvent:error:", v26, v12);

  os_unfair_lock_lock_with_options();
  v27 = v20->_cloudImportInProgressStoreIdentifiers;
  -[NSMutableSet removeObject:](v27, "removeObject:", v11);

  if (-[NSMutableSet count](v20->_cloudImportInProgressStoreIdentifiers, "count")
    || (v28 = v20->_pendingChangedStoreIdentifiers,
        v29 = -[NSMutableSet count](v28, "count") == 0,
        v28,
        v29))
  {
    os_unfair_lock_unlock(&v20->_lock.lock);
  }
  else
  {
    -[HMDCoreDataCloudTransform _managedObjectContext]((id *)&v20->super.super.isa);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v20->_pendingChangedStoreIdentifiers;
    v32 = (void *)-[NSMutableSet copy](v31, "copy");

    v33 = v20->_pendingChangedStoreIdentifiers;
    -[NSMutableSet removeAllObjects](v33, "removeAllObjects");

    os_unfair_lock_unlock(&v20->_lock.lock);
    -[HMDCoreDataCloudTransform _runTransformOnContext:storeIdentifiers:completeMergeHomeModelID:completion:](v20, v30, v32, 0, 0);

  }
}

- (void)coreData:(id)a3 cloudKitExportStartedForStoreWithIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDCoreDataCloudTransform *v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x227676638]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543618;
    v13 = v11;
    v14 = 2114;
    v15 = v7;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@CloudKit export started for store %{public}@", (uint8_t *)&v12, 0x16u);

  }
  objc_autoreleasePoolPop(v8);

}

- (void)coreData:(id)a3 cloudKitExportFinishedForStoreWithIdentifier:(id)a4 duration:(double)a5 error:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  HMDCoreDataCloudTransform *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  const char *v18;
  NSObject *v19;
  os_log_type_t v20;
  uint32_t v21;
  HMMLogEventSubmitting *logEventSubmitter;
  HMMLogEventSubmitting *v23;
  HMDCoreDataCloudKitOperationLogEvent *v24;
  int v25;
  void *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  double v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = (void *)MEMORY[0x227676638]();
  v14 = self;
  HMFGetOSLogHandle();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v12)
  {
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      goto LABEL_7;
    HMFGetLogIdentifier();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 138544130;
    v26 = v17;
    v27 = 2114;
    v28 = v11;
    v29 = 2048;
    v30 = a5;
    v31 = 2114;
    v32 = v12;
    v18 = "%{public}@CloudKit export for store %{public}@ failed after %f seconds: %{public}@";
    v19 = v16;
    v20 = OS_LOG_TYPE_ERROR;
    v21 = 42;
  }
  else
  {
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      goto LABEL_7;
    HMFGetLogIdentifier();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 138543874;
    v26 = v17;
    v27 = 2114;
    v28 = v11;
    v29 = 2048;
    v30 = a5;
    v18 = "%{public}@CloudKit export for store %{public}@ finished after %f seconds";
    v19 = v16;
    v20 = OS_LOG_TYPE_INFO;
    v21 = 32;
  }
  _os_log_impl(&dword_2218F0000, v19, v20, v18, (uint8_t *)&v25, v21);

LABEL_7:
  objc_autoreleasePoolPop(v13);
  if (v14)
    logEventSubmitter = v14->_logEventSubmitter;
  else
    logEventSubmitter = 0;
  v23 = logEventSubmitter;
  v24 = -[HMDCoreDataCloudKitOperationLogEvent initWithOperationType:]([HMDCoreDataCloudKitOperationLogEvent alloc], "initWithOperationType:", 2);
  -[HMMLogEventSubmitting submitLogEvent:error:](v23, "submitLogEvent:error:", v24, v12);

}

- (BOOL)cloudTransform:(id)a3 isPermittedForHomeWithModelID:(id)a4 isImport:(BOOL)a5
{
  id v7;
  id v8;
  void *v9;
  HMDCoreDataCloudTransform *v10;
  NSObject *v11;
  void *v12;
  int v14;
  void *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = (void *)MEMORY[0x227676638]();
  v10 = self;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543874;
    v15 = v12;
    v16 = 2160;
    v17 = 1752392040;
    v18 = 2112;
    v19 = v8;
    _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_DEBUG, "%{public}@No delegate assigned, presuming that transform is allowed for home %{mask.hash}@", (uint8_t *)&v14, 0x20u);

  }
  objc_autoreleasePoolPop(v9);

  return 1;
}

- (HMDCoreDataCloudTransformDelegate)delegate
{
  return (HMDCoreDataCloudTransformDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (HMDCoreData)coreData
{
  return self->_coreData;
}

- (NSUserDefaults)userDefaults
{
  return self->_userDefaults;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_storeStrong((id *)&self->_coreData, 0);
  objc_storeStrong((id *)&self->_cloudChangeListeners, 0);
  objc_storeStrong((id *)&self->_historyTokensByStoreIdentifier, 0);
  objc_storeStrong((id *)&self->_logEventSubmitter, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_cloudImportInProgressStoreIdentifiers, 0);
  objc_storeStrong((id *)&self->_pendingChangedStoreIdentifiers, 0);
  objc_destroyWeak((id *)&self->_lazyManagedObjectContext);
  objc_storeStrong((id *)&self->_mergePolicy, 0);
  objc_storeStrong((id *)&self->_logger, 0);
}

- (id)pendingChangedStoreIdentifiers
{
  if (a1)
    a1 = (id *)a1[7];
  return a1;
}

- (id)_managedObjectContext
{
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;
  _QWORD v7[4];
  id v8;
  id *v9;
  id v10;

  if (!a1)
    return 0;
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (!WeakRetained)
  {
    objc_msgSend(a1, "coreData");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(v3, "newManagedObjectContext");
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __50__HMDCoreDataCloudTransform__managedObjectContext__block_invoke;
    v7[3] = &unk_24E79BBD0;
    WeakRetained = v4;
    v8 = WeakRetained;
    v9 = a1;
    v10 = v3;
    v5 = v3;
    objc_msgSend(WeakRetained, "performBlockAndWait:", v7);
    objc_storeWeak(a1 + 6, WeakRetained);

  }
  return WeakRetained;
}

- (void)_runTransformOnContext:(void *)a3 storeIdentifiers:(void *)a4 completeMergeHomeModelID:(void *)a5 completion:
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  dispatch_block_t v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id v21;
  _QWORD *v22;
  id v23;
  id location;
  _QWORD block[4];
  id v26;
  _QWORD *v27;
  _QWORD v28[5];
  id v29;

  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = v12;
  if (a1)
  {
    v28[0] = 0;
    v28[1] = v28;
    v28[2] = 0x3032000000;
    v28[3] = __Block_byref_object_copy__109940;
    v28[4] = __Block_byref_object_dispose__109941;
    v29 = 0;
    v14 = MEMORY[0x24BDAC760];
    if (v12)
    {
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __105__HMDCoreDataCloudTransform__runTransformOnContext_storeIdentifiers_completeMergeHomeModelID_completion___block_invoke;
      block[3] = &unk_24E784278;
      v26 = v12;
      v27 = v28;
      v15 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);

    }
    else
    {
      v15 = 0;
    }
    objc_initWeak(&location, a1);
    v17[0] = v14;
    v17[1] = 3221225472;
    v17[2] = __105__HMDCoreDataCloudTransform__runTransformOnContext_storeIdentifiers_completeMergeHomeModelID_completion___block_invoke_111;
    v17[3] = &unk_24E7842A0;
    objc_copyWeak(&v23, &location);
    v16 = v15;
    v21 = v16;
    v22 = v28;
    v18 = v9;
    v19 = v10;
    v20 = v11;
    objc_msgSend(v18, "performBlock:", v17);

    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);

    _Block_object_dispose(v28, 8);
  }

}

void __105__HMDCoreDataCloudTransform__runTransformOnContext_storeIdentifiers_completeMergeHomeModelID_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
  v3 = (void *)MEMORY[0x227676638]();
  objc_opt_class();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v6;
    _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_DEBUG, "%{public}@Running completion handler", (uint8_t *)&v7, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  objc_autoreleasePoolPop(v2);
}

void __105__HMDCoreDataCloudTransform__runTransformOnContext_storeIdentifiers_completeMergeHomeModelID_completion___block_invoke_111(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  int v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    -[HMDCoreDataCloudTransform _runTransformWhilePerformingBlockOnContext:storeIdentifiers:completeMergeHomeModelID:](WeakRetained, *(void **)(a1 + 32), *(void **)(a1 + 40), *(void **)(a1 + 48));
    if (*(_QWORD *)(a1 + 56))
    {
      v4 = (void *)MEMORY[0x227676638]();
      v5 = v3;
      HMFGetOSLogHandle();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = 138543362;
        v23 = v7;
        _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_DEBUG, "%{public}@Dispatching completion handler", (uint8_t *)&v22, 0xCu);

      }
      objc_autoreleasePoolPop(v4);
      v8 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      v9 = *(void **)(v8 + 40);
      *(_QWORD *)(v8 + 40) = 0;

      dispatch_get_global_queue(21, 0);
      v10 = objc_claimAutoreleasedReturnValue();
      dispatch_async(v10, *(dispatch_block_t *)(a1 + 56));

    }
    -[HMDCoreDataCloudTransform _delayContextDestruction:]((uint64_t)v3, *(void **)(a1 + 32));
  }
  else
  {
    v11 = (void *)MEMORY[0x227676638]();
    objc_opt_class();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138543362;
      v23 = v14;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@HMDCoreDataCloudTransform deallocated before running transform", (uint8_t *)&v22, 0xCu);

    }
    objc_autoreleasePoolPop(v11);
    if (*(_QWORD *)(a1 + 56))
    {
      v15 = (void *)MEMORY[0x227676638]();
      HMFGetOSLogHandle();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = 138543362;
        v23 = v17;
        _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_DEBUG, "%{public}@Dispatching completion handler", (uint8_t *)&v22, 0xCu);

      }
      objc_autoreleasePoolPop(v15);
      objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 12);
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      v20 = *(void **)(v19 + 40);
      *(_QWORD *)(v19 + 40) = v18;

      dispatch_get_global_queue(21, 0);
      v21 = objc_claimAutoreleasedReturnValue();
      dispatch_async(v21, *(dispatch_block_t *)(a1 + 56));

    }
  }

}

- (void)_runTransformWhilePerformingBlockOnContext:(void *)a3 storeIdentifiers:(void *)a4 completeMergeHomeModelID:
{
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  char v22;
  id v23;
  void *v24;
  _QWORD *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  _QWORD *v40;
  NSObject *v41;
  void *v42;
  void *v43;
  void *v44;
  _QWORD *v45;
  NSObject *v46;
  void *v47;
  id v48;
  id v49;
  id v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  void *v56;
  id v57;
  void *v58;
  _QWORD *v59;
  NSObject *v60;
  void *v61;
  void *v62;
  _QWORD *v63;
  NSObject *v64;
  void *v65;
  void *v66;
  _QWORD *v67;
  NSObject *v68;
  void *v69;
  void *v70;
  uint64_t v71;
  id v72;
  uint64_t v73;
  _QWORD *v74;
  NSObject *v75;
  void *v76;
  id v77;
  HMDCoreDataCloudTransformChangeSet *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  _QWORD *v83;
  void *v84;
  void *v85;
  _QWORD *v86;
  NSObject *v87;
  void *v88;
  void *v89;
  _QWORD *v90;
  NSObject *v91;
  void *v92;
  void *v93;
  _QWORD *v94;
  NSObject *v95;
  void *v96;
  id v97;
  uint64_t v98;
  void *context;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  id v105;
  id v106;
  id v107;
  id v108;
  id v109;
  _QWORD v110[5];
  id v111;
  id v112;
  _QWORD v113[4];
  id v114;
  id v115;
  id v116;
  uint64_t v117;
  uint64_t *v118;
  uint64_t v119;
  char v120;
  id v121;
  uint64_t v122;
  uint64_t *v123;
  uint64_t v124;
  uint64_t (*v125)(uint64_t, uint64_t);
  void (*v126)(uint64_t);
  id v127;
  id v128;
  id *v129;
  uint64_t v130;
  uint64_t (*v131)(uint64_t, uint64_t);
  void (*v132)(uint64_t);
  id v133;
  id v134;
  uint8_t v135[4];
  void *v136;
  __int16 v137;
  uint64_t v138;
  __int16 v139;
  uint64_t v140;
  __int16 v141;
  id v142;
  _BYTE buf[24];
  void *v144;
  __int128 v145;
  uint64_t *v146;
  uint64_t *v147;
  _QWORD v148[4];

  v148[1] = *MEMORY[0x24BDAC8D0];
  v109 = a2;
  v107 = a3;
  v7 = a4;
  if (!a1)
    goto LABEL_82;
  if (!objc_msgSend(a1, "badCDPState"))
  {
    v103 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE3F200]), "initWithName:", CFSTR("com.apple.homed.cloud-transform"));
    if (v7)
    {
      v106 = 0;
    }
    else
    {
      v12 = (void *)MEMORY[0x24BDBCEB8];
      if (v107)
        v13 = objc_msgSend(v107, "count");
      else
        v13 = 3;
      objc_msgSend(v12, "arrayWithCapacity:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v109, "persistentStoreCoordinator");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "persistentStores");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v113[0] = MEMORY[0x24BDAC760];
      v113[1] = 3221225472;
      v113[2] = __114__HMDCoreDataCloudTransform__runTransformWhilePerformingBlockOnContext_storeIdentifiers_completeMergeHomeModelID___block_invoke;
      v113[3] = &unk_24E7842C8;
      v114 = v107;
      v115 = v109;
      v106 = v14;
      v116 = v106;
      objc_msgSend(v16, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v113);

      if (!objc_msgSend(v106, "count"))
      {
LABEL_81:

        goto LABEL_82;
      }
    }
    v17 = (void *)MEMORY[0x227676638]();
    v18 = a1;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      *(_QWORD *)&buf[4] = v20;
      *(_WORD *)&buf[12] = 2160;
      *(_QWORD *)&buf[14] = 1752392040;
      *(_WORD *)&buf[22] = 2112;
      v144 = v7;
      LOWORD(v145) = 2114;
      *(_QWORD *)((char *)&v145 + 2) = v107;
      _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_DEBUG, "%{public}@Starting transform: completeMergeHomeModelID = %{mask.hash}@, storeIdentifiers = %{public}@", buf, 0x2Au);

    }
    objc_autoreleasePoolPop(v17);
    v108 = v109;
    objc_msgSend(MEMORY[0x24BDBB758], "currentQueryGenerationToken");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v128 = 0;
    v22 = objc_msgSend(v108, "setQueryGenerationFromToken:error:", v21, &v128);
    v23 = v128;

    if ((v22 & 1) == 0)
    {
      v24 = (void *)MEMORY[0x227676638]();
      v25 = v18;
      HMFGetOSLogHandle();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v27;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v23;
        _os_log_impl(&dword_2218F0000, v26, OS_LOG_TYPE_ERROR, "%{public}@Failed to pin context to current query generation: %{public}@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v24);
    }
    if (!v18[11])
    {
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 3);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDCoreDataCloudTransform _fetchOrCreateMetadataForManagedObjectContext:](v18, v108);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "historyTokenForCloudStore");
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      if (v30)
      {
        objc_msgSend(v29, "historyTokenForCloudStore");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v108, "hmd_cloudPrivateStoreIdentifier");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "setObject:forKeyedSubscript:", v31, v32);

      }
      objc_msgSend(v29, "historyTokenForCloudSharedStore");
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      if (v33)
      {
        objc_msgSend(v29, "historyTokenForCloudSharedStore");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v108, "hmd_cloudSharedStoreIdentifier");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "setObject:forKeyedSubscript:", v34, v35);

      }
      objc_msgSend(v29, "historyTokenForWorkingStore");
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      if (v36)
      {
        objc_msgSend(v29, "historyTokenForWorkingStore");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v108, "hmd_workingStoreIdentifier");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "setObject:forKeyedSubscript:", v37, v38);

      }
      v39 = (void *)MEMORY[0x227676638]();
      v40 = v18;
      HMFGetOSLogHandle();
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v42;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v29;
        _os_log_impl(&dword_2218F0000, v41, OS_LOG_TYPE_INFO, "%{public}@Fetched metadata for the first time: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v39);
      v43 = (void *)v40[11];
      v40[11] = v28;

    }
    if (!v7)
    {
      v110[0] = MEMORY[0x24BDAC760];
      v110[1] = 3221225472;
      v110[2] = __114__HMDCoreDataCloudTransform__runTransformWhilePerformingBlockOnContext_storeIdentifiers_completeMergeHomeModelID___block_invoke_118;
      v110[3] = &unk_24E7842C8;
      v110[4] = v18;
      v111 = v108;
      v112 = v106;
      objc_msgSend(v112, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v110);

LABEL_76:
      v89 = (void *)MEMORY[0x227676638]();
      v90 = v18;
      HMFGetOSLogHandle();
      v91 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v91, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v92;
        _os_log_impl(&dword_2218F0000, v91, OS_LOG_TYPE_DEBUG, "%{public}@Resetting after transform", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v89);
      v93 = (void *)MEMORY[0x227676638](objc_msgSend(v108, "reset"));
      v94 = v90;
      HMFGetOSLogHandle();
      v95 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v95, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v96;
        _os_log_impl(&dword_2218F0000, v95, OS_LOG_TYPE_DEBUG, "%{public}@Finished transform", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v93);
      goto LABEL_81;
    }
    v44 = (void *)MEMORY[0x227676638]();
    v45 = v18;
    HMFGetOSLogHandle();
    v46 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)&buf[4] = v47;
      *(_WORD *)&buf[12] = 2160;
      *(_QWORD *)&buf[14] = 1752392040;
      *(_WORD *)&buf[22] = 2112;
      v144 = v7;
      _os_log_impl(&dword_2218F0000, v46, OS_LOG_TYPE_INFO, "%{public}@Starting complete merge transform for home with modelID %{mask.hash}@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v44);
    v48 = v108;
    v49 = v7;
    objc_msgSend(v48, "hmd_assertIsExecuting");
    v105 = v49;
    v50 = v48;
    objc_msgSend(v50, "hmd_assertIsExecuting");
    objc_msgSend(v50, "hmd_coreData");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v102 = v51;
    if (!v51)
    {
      v62 = (void *)MEMORY[0x227676638]();
      v63 = v45;
      HMFGetOSLogHandle();
      v64 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v65;
        _os_log_impl(&dword_2218F0000, v64, OS_LOG_TYPE_ERROR, "%{public}@HMDCoreData deallocated before running complete merge import", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v62);
      goto LABEL_73;
    }
    objc_msgSend(v51, "cloudPrivateStore");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    +[MKFCKHome fetchRequest](MKFCKHome, "fetchRequest");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    +[MKFCKModel predicateWithModelID:](MKFCKHome, "predicateWithModelID:", v105);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v104, "setPredicate:", v52);

    +[MKFCKModel defaultPreloadedProperties](MKFCKHome, "defaultPreloadedProperties");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v104, "setPropertiesToFetch:", v53);

    v148[0] = v101;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v148, 1);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v104, "setAffectedStores:", v54);

    v134 = 0;
    objc_msgSend(v50, "executeFetchRequest:error:", v104, &v134);
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = v134;
    if (!v100)
    {
      v66 = (void *)MEMORY[0x227676638]();
      v67 = v45;
      HMFGetOSLogHandle();
      v68 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        *(_QWORD *)&buf[4] = v69;
        *(_WORD *)&buf[12] = 2160;
        *(_QWORD *)&buf[14] = 1752392040;
        *(_WORD *)&buf[22] = 2112;
        v144 = v105;
        LOWORD(v145) = 2114;
        *(_QWORD *)((char *)&v145 + 2) = v55;
        _os_log_impl(&dword_2218F0000, v68, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch cloud home with modelID %{mask.hash}@: %{public}@", buf, 0x2Au);

      }
      objc_autoreleasePoolPop(v66);
      goto LABEL_72;
    }
    objc_msgSend(v100, "firstObject");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v128 = 0;
    v129 = &v128;
    v130 = 0x3032000000;
    v131 = __Block_byref_object_copy__109940;
    v132 = __Block_byref_object_dispose__109941;
    v133 = 0;
    v122 = 0;
    v123 = &v122;
    v124 = 0x3032000000;
    v125 = __Block_byref_object_copy__109940;
    v126 = __Block_byref_object_dispose__109941;
    v127 = 0;
    if (v56)
    {
      v57 = v55;
      goto LABEL_35;
    }
    +[MKFCKHome entity](MKFCKHome, "entity");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v121 = v55;
    objc_msgSend(v101, "hmd_tombstonesForEntity:duration:context:error:", v70, v50, &v121, 0.0);
    v71 = objc_claimAutoreleasedReturnValue();
    v57 = v121;

    if (!v71)
    {
      v58 = (void *)MEMORY[0x227676638]();
      v59 = v45;
      HMFGetOSLogHandle();
      v60 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v82;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v57;
        _os_log_impl(&dword_2218F0000, v60, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch tombstones for cloud homes: %{public}@", buf, 0x16u);

      }
      goto LABEL_38;
    }
    v117 = 0;
    v118 = &v117;
    v119 = 0x2020000000;
    v120 = 0;
    *(_QWORD *)buf = MEMORY[0x24BDAC760];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __83__HMDCoreDataCloudTransform__performCompleteMergeImportForHomeWithModelID_context___block_invoke;
    v144 = &unk_24E7842F0;
    v72 = v105;
    *(_QWORD *)&v145 = v72;
    *((_QWORD *)&v145 + 1) = &v128;
    v146 = &v122;
    v147 = &v117;
    v73 = objc_msgSend((id)v71, "enumerateKeysAndObjectsUsingBlock:", buf);
    if (v129[5])
    {
      if (!*((_BYTE *)v118 + 24))
      {

        _Block_object_dispose(&v117, 8);
LABEL_35:
        if (objc_msgSend(v56, "isFake"))
        {
          v58 = (void *)MEMORY[0x227676638]();
          v59 = v45;
          HMFGetOSLogHandle();
          v60 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)v135 = 138543618;
            v136 = v61;
            v137 = 2112;
            v138 = (uint64_t)v56;
            _os_log_impl(&dword_2218F0000, v60, OS_LOG_TYPE_ERROR, "%{public}@Refusing to merge fake home: %@", v135, 0x16u);

          }
LABEL_38:

          objc_autoreleasePoolPop(v58);
LABEL_71:
          _Block_object_dispose(&v122, 8);

          _Block_object_dispose(&v128, 8);
          v55 = v57;
LABEL_72:

LABEL_73:
          v85 = (void *)MEMORY[0x227676638]();
          v86 = v45;
          HMFGetOSLogHandle();
          v87 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v87, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v88 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            *(_QWORD *)&buf[4] = v88;
            *(_WORD *)&buf[12] = 2160;
            *(_QWORD *)&buf[14] = 1752392040;
            *(_WORD *)&buf[22] = 2112;
            v144 = v105;
            _os_log_impl(&dword_2218F0000, v87, OS_LOG_TYPE_INFO, "%{public}@Finished complete merge transform for home with modelID %{mask.hash}@", buf, 0x20u);

          }
          objc_autoreleasePoolPop(v85);
          goto LABEL_76;
        }
        v78 = [HMDCoreDataCloudTransformChangeSet alloc];
        if (v78)
        {
          v71 = (uint64_t)-[HMDCoreDataCloudTransformChangeSet initWithHomeModelID:clientIdentifier:qualityOfService:]((id *)&v78->super.isa, v105, 0, (void *)0xFFFFFFFFFFFFFFFFLL);
          if (v56)
          {
LABEL_53:
            objc_msgSend(v56, "fetchLocalModelWithContext:", v50);
            v79 = (void *)objc_claimAutoreleasedReturnValue();
            if (v79)
            {
              objc_msgSend(v56, "objectID");
              v80 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x24BDBCF20], "set");
              v81 = (void *)objc_claimAutoreleasedReturnValue();
              -[HMDCoreDataCloudTransformChangeSet processUpdate:updatedProperties:](v71, v80, v81);

            }
            else
            {
              objc_msgSend(v56, "objectID");
              v80 = (void *)objc_claimAutoreleasedReturnValue();
              if (v71)
                objc_msgSend(*(id *)(v71 + 8), "addObject:", v80);
            }

            goto LABEL_67;
          }
        }
        else
        {
          v71 = 0;
          if (v56)
            goto LABEL_53;
        }
        -[HMDCoreDataCloudTransformChangeSet processDelete:tombstone:]((id *)v71, v129[5], (void *)v123[5]);
LABEL_67:
        if (v71)
          *(_BYTE *)(v71 + 32) = 1;
        -[HMDCoreDataCloudTransform _processChangeSet:isImport:context:](v45, (void *)v71, 1, v50);
        objc_msgSend(v50, "rollback");
        objc_msgSend(v50, "refreshAllObjects");
        goto LABEL_70;
      }
      v97 = v72;
      context = (void *)MEMORY[0x227676638](v73);
      v74 = v45;
      HMFGetOSLogHandle();
      v75 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        v77 = v129[5];
        *(_DWORD *)v135 = 138544130;
        v136 = v76;
        v137 = 2112;
        v138 = (uint64_t)v77;
        v139 = 2160;
        v140 = 1752392040;
        v141 = 2112;
        v142 = v97;
        _os_log_impl(&dword_2218F0000, v75, OS_LOG_TYPE_ERROR, "%{public}@Refusing to merge deleted fake home: <%@: %{mask.hash}@>", v135, 0x2Au);

      }
    }
    else
    {
      v98 = (uint64_t)v72;
      context = (void *)MEMORY[0x227676638](v73);
      v83 = v45;
      HMFGetOSLogHandle();
      v75 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v75, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v135 = 138543874;
        v136 = v84;
        v137 = 2160;
        v138 = 1752392040;
        v139 = 2112;
        v140 = v98;
        _os_log_impl(&dword_2218F0000, v75, OS_LOG_TYPE_INFO, "%{public}@Didn't find home with modelID %{mask.hash}@", v135, 0x20u);

      }
    }

    objc_autoreleasePoolPop(context);
    _Block_object_dispose(&v117, 8);
LABEL_70:

    goto LABEL_71;
  }
  v8 = (void *)MEMORY[0x227676638]();
  v9 = a1;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)&buf[4] = v11;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Not running transform due operating in bad CDP state", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v8);
LABEL_82:

}

- (void)_delayContextDestruction:(uint64_t)a1
{
  id v3;
  NSObject *v4;
  dispatch_time_t v5;
  _QWORD block[4];
  id v7;

  v3 = a2;
  if (a1)
  {
    dispatch_get_global_queue(9, 0);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = dispatch_time(0, 2000000000);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __54__HMDCoreDataCloudTransform__delayContextDestruction___block_invoke;
    block[3] = &unk_24E79C240;
    v7 = v3;
    dispatch_after(v5, v4, block);

  }
}

void __114__HMDCoreDataCloudTransform__runTransformWhilePerformingBlockOnContext_storeIdentifiers_completeMergeHomeModelID___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 32);
  if (!v4 || objc_msgSend(v4, "containsObject:", v3))
  {
    objc_msgSend(*(id *)(a1 + 40), "hmd_cloudPrivateStoreIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v3, "isEqualToString:", v5) & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 40), "hmd_cloudSharedStoreIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v3, "isEqualToString:", v6))
      {
        objc_msgSend(*(id *)(a1 + 40), "hmd_workingStoreIdentifier");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v3, "isEqualToString:", v7);

        if ((v8 & 1) == 0)
          goto LABEL_8;
        goto LABEL_7;
      }

    }
LABEL_7:
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v9);
  }
LABEL_8:

}

void __114__HMDCoreDataCloudTransform__runTransformWhilePerformingBlockOnContext_storeIdentifiers_completeMergeHomeModelID___block_invoke_118(id *a1, void *a2, uint64_t a3)
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  char *v10;
  id v11;
  id *v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  int v18;
  id v19;
  void *v20;
  char *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  objc_class *v30;
  id v31;
  id *v32;
  id *v33;
  id *v34;
  void *v35;
  id *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  id *v42;
  NSObject *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  void *v52;
  int v53;
  void *v54;
  id *v55;
  NSObject *v56;
  void *v57;
  uint64_t *v58;
  void *v59;
  id *v60;
  NSObject *v61;
  void *v62;
  int v63;
  id *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  id v70;
  id v71;
  BOOL v72;
  int v73;
  void *v74;
  void *v75;
  void *v76;
  _BOOL4 v77;
  void *v78;
  id *v79;
  NSObject *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  uint64_t v87;
  void *v88;
  id *v89;
  NSObject *v90;
  void *v91;
  const char *v92;
  void *v93;
  void *v94;
  void *v95;
  char v96;
  void *v97;
  char v98;
  void *v99;
  char v100;
  id v101;
  __CFString *v102;
  __CFString *v103;
  void *v104;
  id *v105;
  NSObject *v106;
  void *v107;
  char v108;
  char *v109;
  void *v110;
  id *v111;
  NSObject *v112;
  NSObject *v113;
  void *v114;
  void *v115;
  void *v116;
  id *v117;
  NSObject *v118;
  void *v119;
  id v120;
  void *v121;
  void *v122;
  id v123;
  NSObject *v124;
  void *v125;
  void *v126;
  char *v127;
  void *v128;
  id v129;
  NSObject *v130;
  void *v131;
  void *v132;
  char *v133;
  void *v134;
  id *v135;
  NSObject *v136;
  void *v137;
  void *v138;
  id *v139;
  NSObject *v140;
  void *v141;
  id v142;
  id v143;
  void *v144;
  id v145;
  int v146;
  const __CFString *v147;
  void *context;
  id contexta;
  id contextb;
  id v152;
  id v153;
  void *v154;
  int v155;
  void *v156;
  int v157;
  char *v158;
  id *v159;
  id v160;
  id *v161;
  id v162;
  _QWORD v163[5];
  id v164;
  uint64_t *v165;
  char v166;
  uint64_t v167;
  uint64_t *v168;
  uint64_t v169;
  char v170;
  id v171;
  id v172;
  id v173[5];
  id v174;
  id v175;
  _BYTE buf[24];
  const char *v177;
  __int128 v178;
  id *v179;
  id *v180;
  id v181;
  id *v182;
  uint64_t v183;
  uint64_t (*v184)(uint64_t, uint64_t);
  void (*v185)(uint64_t);
  id v186;
  _QWORD v187[5];

  v187[2] = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  v5 = (void *)MEMORY[0x227676638]();
  v161 = a1;
  v6 = a1[4];
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "configurationName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v10 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    *(_QWORD *)&buf[4] = v8;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v9;
    *(_WORD *)&buf[22] = 2114;
    v177 = v10;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Starting transform for store [%{public}@] with identifier: %{public}@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v5);
  v12 = (id *)v161[4];
  v11 = v161[5];
  v162 = v4;
  v159 = v12;
  v160 = v11;
  if (v12)
  {
    objc_msgSend(v162, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v160, "hmd_cloudPrivateStoreIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v157 = objc_msgSend(v13, "isEqualToString:", v14);

    if ((v157 & 1) != 0)
    {
      v146 = 0;
      v155 = 1;
      v15 = CFSTR("cloud private");
    }
    else
    {
      objc_msgSend(v162, "identifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v160, "hmd_cloudSharedStoreIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqualToString:", v17);

      if (v18)
      {
        v146 = 1;
        v147 = CFSTR("cloud shared");
        v155 = 1;
        goto LABEL_10;
      }
      v146 = 0;
      v155 = 0;
      v15 = CFSTR("working");
    }
    v147 = v15;
LABEL_10:
    context = (void *)MEMORY[0x227676638]();
    v19 = v159[11];
    objc_msgSend(v162, "identifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectForKeyedSubscript:", v20);
    v21 = (char *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBB710], "fetchHistoryAfterToken:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setFetchBatchSize:", 10);
    v175 = v162;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v175, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setAffectedStores:", v23);

    v171 = 0;
    objc_msgSend(v160, "executeRequest:error:", v22, &v171);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v152 = v171;
    if (v24)
    {
      objc_msgSend(v24, "result");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "lastObject");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "token");
      v158 = (char *)objc_claimAutoreleasedReturnValue();

      v27 = v25;
      v28 = v160;
      v29 = v28;
      v30 = (objc_class *)MEMORY[0x24BE3F1D8];
      v31 = v27;
      v32 = (id *)objc_alloc_init(v30);
      *(_QWORD *)buf = MEMORY[0x24BDAC760];
      *(_QWORD *)&buf[8] = 3221225472;
      if ((v155 & 1) != 0)
      {
        *(_QWORD *)&buf[16] = __71__HMDCoreDataCloudTransform__changeSetsFromImportTransactions_context___block_invoke;
        v177 = (const char *)&unk_24E792010;
        *(_QWORD *)&v178 = v159;
        v33 = (id *)v29;
        *((_QWORD *)&v178 + 1) = v33;
        v179 = v32;
      }
      else
      {
        *(_QWORD *)&buf[16] = __71__HMDCoreDataCloudTransform__changeSetsFromExportTransactions_context___block_invoke;
        v177 = (const char *)&unk_24E792010;
        *(_QWORD *)&v178 = v159;
        *((_QWORD *)&v178 + 1) = v32;
        v33 = (id *)v29;
        v179 = v33;
      }
      v34 = v32;
      objc_msgSend(v31, "hmf_enumerateWithAutoreleasePoolUsingBlock:", buf);

      objc_msgSend(v34, "allValues");
      v156 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v35 = (void *)MEMORY[0x227676638]();
      v36 = v159;
      HMFGetOSLogHandle();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        *(_QWORD *)&buf[4] = v38;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v147;
        *(_WORD *)&buf[22] = 2114;
        v177 = v21;
        LOWORD(v178) = 2114;
        *(_QWORD *)((char *)&v178 + 2) = v152;
        _os_log_impl(&dword_2218F0000, v37, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch history for %{public}@ store with token %{public}@: %{public}@", buf, 0x2Au);

      }
      objc_autoreleasePoolPop(v35);
      v156 = 0;
      v158 = 0;
    }

    objc_autoreleasePoolPop(context);
    if (!v24)
      goto LABEL_82;
    v167 = 0;
    v168 = &v167;
    v169 = 0x2020000000;
    v170 = 0;
    v39 = (void *)MEMORY[0x24BDAC760];
    v163[0] = MEMORY[0x24BDAC760];
    v163[1] = 3221225472;
    v163[2] = __61__HMDCoreDataCloudTransform__processHistoryForStore_context___block_invoke;
    v163[3] = &unk_24E784318;
    v163[4] = v159;
    v166 = v155;
    v40 = v160;
    v164 = v40;
    v165 = &v167;
    objc_msgSend(v156, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v163);
    if ((objc_msgSend(v40, "hmd_homeManagerApplicationDataChanged") & 1) == 0)
    {
      v58 = v168;
      goto LABEL_40;
    }
    objc_msgSend(v40, "setHmd_homeManagerApplicationDataChanged:", 0);
    v153 = v40;
    v41 = (void *)MEMORY[0x227676638]();
    v42 = v159;
    HMFGetOSLogHandle();
    v43 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v44;
      _os_log_impl(&dword_2218F0000, v43, OS_LOG_TYPE_INFO, "%{public}@Running check to see if home manager application data has changed", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v41);
    +[MKFCKHome fetchRequest](MKFCKHome, "fetchRequest");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "setFetchBatchSize:", 10);
    v187[0] = CFSTR("primaryHomeCounter");
    v187[1] = CFSTR("homeManagerApplicationData");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v187, 2);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    +[MKFCKModel appendDefaultPreloadedPropertiesTo:](MKFCKHome, "appendDefaultPreloadedPropertiesTo:", v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "setPropertiesToFetch:", v47);

    v174 = 0;
    objc_msgSend(v153, "executeFetchRequest:error:", v45, &v174);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = v174;
    if (!v48)
    {
      v59 = (void *)MEMORY[0x227676638]();
      v60 = v42;
      HMFGetOSLogHandle();
      v61 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v62;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v49;
        _os_log_impl(&dword_2218F0000, v61, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch homes: %{public}@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v59);
      v63 = 0;
      goto LABEL_38;
    }
    v181 = 0;
    v182 = &v181;
    v183 = 0x3032000000;
    v184 = __Block_byref_object_copy__109940;
    v185 = __Block_byref_object_dispose__109941;
    v186 = 0;
    v173[0] = v39;
    v173[1] = (id)3221225472;
    v173[2] = __74__HMDCoreDataCloudTransform__updateHomeManagerApplicationDataWithContext___block_invoke;
    v173[3] = &unk_24E784628;
    v173[4] = &v181;
    objc_msgSend(v48, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v173);
    v172 = v49;
    +[_MKFHomeManager fetchWithContext:error:](_MKFHomeManager, "fetchWithContext:error:", v153, &v172);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    contexta = v172;

    if (v50)
    {
      objc_msgSend(v50, "appDataDictionary");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v182[5], "homeManagerApplicationData");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = isEqualDeepCompare(v51, v52);

      if (!v53)
      {
        objc_msgSend(v182[5], "homeManagerApplicationData");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        v67 = (void *)objc_msgSend(v66, "copy");

        objc_msgSend(v153, "hmd_homeManagerContext");
        v68 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend((id)objc_opt_class(), "_homeManagerContextFromContext:", v153);
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        *(_QWORD *)buf = v39;
        *(_QWORD *)&buf[8] = 3221225472;
        *(_QWORD *)&buf[16] = __74__HMDCoreDataCloudTransform__updateHomeManagerApplicationDataWithContext___block_invoke_207;
        v177 = (const char *)&unk_24E79B5F8;
        v180 = &v181;
        v70 = v67;
        *(_QWORD *)&v178 = v70;
        v71 = v69;
        *((_QWORD *)&v178 + 1) = v71;
        v179 = v42;
        objc_msgSend(v71, "performBlockAndWait:", buf);
        if (!v68)
          objc_msgSend(v153, "setHmd_homeManagerContext:", 0);

        v63 = 1;
        goto LABEL_37;
      }
      v54 = (void *)MEMORY[0x227676638]();
      v55 = v42;
      HMFGetOSLogHandle();
      v56 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v57;
        _os_log_impl(&dword_2218F0000, v56, OS_LOG_TYPE_DEBUG, "%{public}@Home manager application data is unchanged", buf, 0xCu);

      }
    }
    else
    {
      v54 = (void *)MEMORY[0x227676638]();
      v64 = v42;
      HMFGetOSLogHandle();
      v56 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v65;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = contexta;
        _os_log_impl(&dword_2218F0000, v56, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch home manager: %{public}@", buf, 0x16u);

      }
    }

    objc_autoreleasePoolPop(v54);
    v63 = 0;
LABEL_37:

    _Block_object_dispose(&v181, 8);
    v49 = contexta;
LABEL_38:

    v58 = v168;
    if (v63)
      *((_BYTE *)v168 + 24) = 1;
LABEL_40:
    v72 = *((_BYTE *)v58 + 24) == 0;
    v73 = v157;
    if (!v72)
      v73 = 1;
    if (v73 == 1)
    {
      -[HMDCoreDataCloudTransform _fetchOrCreateMetadataForManagedObjectContext:](v159, v40);
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      v75 = v74;
      if (!v157)
      {
        if (!*((_BYTE *)v168 + 24))
          goto LABEL_77;
        goto LABEL_62;
      }
      objc_msgSend(v74, "historyTokenForCloudStore");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      v77 = v76 == 0;

      if (v77)
      {
        if (v158)
          goto LABEL_98;
        contextb = v162;
        v145 = v40;
        v78 = (void *)MEMORY[0x227676638]();
        v79 = v159;
        HMFGetOSLogHandle();
        v80 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v80, OS_LOG_TYPE_DEBUG))
        {
          HMFGetLogIdentifier();
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          *(_QWORD *)&buf[4] = v81;
          _os_log_impl(&dword_2218F0000, v80, OS_LOG_TYPE_DEBUG, "%{public}@Fetching NSPersistentCloudKitContainerEvents for first import check", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v78);
        objc_msgSend(MEMORY[0x24BDBB6F0], "fetchRequestForEvents");
        v154 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("(succeeded == YES) AND (type == %ld) AND (endDate != nil)"), 1);
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v154, "setPredicate:", v82);

        objc_msgSend(MEMORY[0x24BDBB6F0], "fetchEventsMatchingFetchRequest:", v154);
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v83, "setResultType:", 1);
        v181 = contextb;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v181, 1);
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v83, "setAffectedStores:", v84);

        v173[0] = 0;
        objc_msgSend(v145, "executeRequest:error:", v83, v173);
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        v143 = v173[0];
        if (v85)
        {
          v142 = v85;
          objc_msgSend(v142, "result");
          v144 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v144, "count")
            && (objc_msgSend(v144, "firstObject"),
                v86 = (void *)objc_claimAutoreleasedReturnValue(),
                v87 = objc_msgSend(v86, "unsignedIntegerValue"),
                v86,
                v87))
          {
            v88 = (void *)MEMORY[0x227676638]();
            v89 = v79;
            HMFGetOSLogHandle();
            v90 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v90, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v91 = (void *)objc_claimAutoreleasedReturnValue();
              v92 = "s";
              *(_DWORD *)buf = 138543874;
              *(_QWORD *)&buf[4] = v91;
              if (v87 == 1)
                v92 = "";
              *(_WORD *)&buf[12] = 2048;
              *(_QWORD *)&buf[14] = v87;
              *(_WORD *)&buf[22] = 2080;
              v177 = v92;
              _os_log_impl(&dword_2218F0000, v90, OS_LOG_TYPE_INFO, "%{public}@Found %ld import NSPersistentCloudKitContainerEvent%s, using current history token for store", buf, 0x20u);

            }
            objc_autoreleasePoolPop(v88);
            objc_msgSend(v145, "persistentStoreCoordinator");
            v93 = (void *)objc_claimAutoreleasedReturnValue();
            *(_QWORD *)buf = contextb;
            objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", buf, 1);
            v94 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v93, "currentPersistentHistoryTokenFromStores:", v94);
            v158 = (char *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            v134 = (void *)MEMORY[0x227676638]();
            v135 = v79;
            HMFGetOSLogHandle();
            v136 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v136, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v137 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              *(_QWORD *)&buf[4] = v137;
              _os_log_impl(&dword_2218F0000, v136, OS_LOG_TYPE_INFO, "%{public}@Found no import NSPersistentCloudKitContainerEvents", buf, 0xCu);

            }
            objc_autoreleasePoolPop(v134);
            v158 = 0;
          }

        }
        else
        {
          v138 = (void *)MEMORY[0x227676638]();
          v139 = v79;
          HMFGetOSLogHandle();
          v140 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v140, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v141 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            *(_QWORD *)&buf[4] = v141;
            *(_WORD *)&buf[12] = 2114;
            *(_QWORD *)&buf[14] = v143;
            _os_log_impl(&dword_2218F0000, v140, OS_LOG_TYPE_ERROR, "%{public}@NSPersistentCloudKitContainerEventRequest failed: %{public}@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v138);
          v158 = 0;
        }

        if (v158)
LABEL_98:
          *((_BYTE *)v168 + 24) = 1;
        else
          v158 = 0;
      }
    }
    else
    {
      v75 = 0;
    }
    if (!*((_BYTE *)v168 + 24))
      goto LABEL_77;
    if (v157)
    {
      objc_msgSend(v75, "historyTokenForCloudStore");
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      v96 = HMFEqualObjects();

      if ((v96 & 1) == 0)
      {
        objc_msgSend(v75, "setHistoryTokenForCloudStore:", v158);
LABEL_67:
        v101 = v40;
        v102 = CFSTR("export");
        if (v155)
          v102 = CFSTR("import");
        v103 = v102;
        v104 = (void *)MEMORY[0x227676638](objc_msgSend(v101, "setMergePolicy:", *MEMORY[0x24BDBB410]));
        v105 = v159;
        HMFGetOSLogHandle();
        v106 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v106, OS_LOG_TYPE_DEBUG))
        {
          HMFGetLogIdentifier();
          v107 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          *(_QWORD *)&buf[4] = v107;
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v103;
          _os_log_impl(&dword_2218F0000, v106, OS_LOG_TYPE_DEBUG, "%{public}@Saving history tokens after processing %{public}@ changes", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v104);
        v181 = 0;
        v108 = objc_msgSend(v101, "hmd_saveWithTransactionAuthor:error:", 4, &v181);
        v109 = (char *)v181;
        v110 = (void *)MEMORY[0x227676638]();
        v111 = v105;
        HMFGetOSLogHandle();
        v112 = objc_claimAutoreleasedReturnValue();
        v113 = v112;
        if ((v108 & 1) != 0)
        {
          if (os_log_type_enabled(v112, OS_LOG_TYPE_DEBUG))
          {
            HMFGetLogIdentifier();
            v114 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            *(_QWORD *)&buf[4] = v114;
            *(_WORD *)&buf[12] = 2114;
            *(_QWORD *)&buf[14] = v103;
            _os_log_impl(&dword_2218F0000, v113, OS_LOG_TYPE_DEBUG, "%{public}@Finished saving history tokens after processing %{public}@ changes", buf, 0x16u);

          }
        }
        else if (os_log_type_enabled(v112, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v115 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          *(_QWORD *)&buf[4] = v115;
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v103;
          *(_WORD *)&buf[22] = 2114;
          v177 = v109;
          _os_log_impl(&dword_2218F0000, v113, OS_LOG_TYPE_ERROR, "%{public}@Failed to save change tokens after processing %{public}@ changes: %{public}@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v110);

        goto LABEL_77;
      }
    }
LABEL_62:
    if (v146)
    {
      objc_msgSend(v75, "historyTokenForCloudSharedStore");
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      v98 = HMFEqualObjects();

      if ((v98 & 1) == 0)
      {
        objc_msgSend(v75, "setHistoryTokenForCloudSharedStore:", v158);
        goto LABEL_67;
      }
    }
    objc_msgSend(v75, "historyTokenForWorkingStore");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    v100 = HMFEqualObjects();

    if ((v100 & 1) == 0)
    {
      objc_msgSend(v75, "setHistoryTokenForWorkingStore:", v158);
      goto LABEL_67;
    }
LABEL_77:
    if (v158)
    {
      v116 = (void *)MEMORY[0x227676638]();
      v117 = v159;
      HMFGetOSLogHandle();
      v118 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v118, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v119 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        *(_QWORD *)&buf[4] = v119;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v147;
        *(_WORD *)&buf[22] = 2114;
        v177 = v158;
        _os_log_impl(&dword_2218F0000, v118, OS_LOG_TYPE_DEBUG, "%{public}@Advancing in-memory history token for %{public}@ store: %{public}@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v116);
      v120 = v117[11];
      objc_msgSend(v162, "identifier");
      v121 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v120, "setObject:forKeyedSubscript:", v158, v121);

    }
    _Block_object_dispose(&v167, 8);
LABEL_82:

  }
  v122 = (void *)MEMORY[0x227676638]();
  v123 = v161[4];
  HMFGetOSLogHandle();
  v124 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v124, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v162, "configurationName");
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v162, "identifier");
    v127 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    *(_QWORD *)&buf[4] = v125;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v126;
    *(_WORD *)&buf[22] = 2114;
    v177 = v127;
    _os_log_impl(&dword_2218F0000, v124, OS_LOG_TYPE_INFO, "%{public}@Finished transform for store [%{public}@] with identifier: %{public}@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v122);
  if (objc_msgSend(v161[6], "count") - 1 != a3)
  {
    v128 = (void *)MEMORY[0x227676638]();
    v129 = v161[4];
    HMFGetOSLogHandle();
    v130 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v130, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v131 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v162, "configurationName");
      v132 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v162, "identifier");
      v133 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)&buf[4] = v131;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v132;
      *(_WORD *)&buf[22] = 2114;
      v177 = v133;
      _os_log_impl(&dword_2218F0000, v130, OS_LOG_TYPE_DEBUG, "%{public}@Cleaning up after transform for store [%{public}@] with identifier: %{public}@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v128);
    objc_msgSend(v161[5], "rollback");
    objc_msgSend(v161[5], "refreshAllObjects");
  }

}

uint64_t __61__HMDCoreDataCloudTransform__processHistoryForStore_context___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = -[HMDCoreDataCloudTransform _processChangeSet:isImport:context:](*(void **)(a1 + 32), a2, *(unsigned __int8 *)(a1 + 56), *(void **)(a1 + 40));
  if ((_DWORD)result)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  return result;
}

- (MKFCloudSyncMetadata)_fetchOrCreateMetadataForManagedObjectContext:(void *)a1
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  const char *v11;
  id v12;
  MKFCloudSyncMetadata *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  +[MKFCloudSyncMetadata fetchRequest](MKFCloudSyncMetadata, "fetchRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setReturnsObjectsAsFaults:", 0);
  v19 = 0;
  objc_msgSend(v3, "executeFetchRequest:error:", v4, &v19);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v19;
  if (v5)
  {
    if ((unint64_t)objc_msgSend(v5, "count") < 2)
      goto LABEL_9;
    v7 = (void *)MEMORY[0x227676638]();
    v8 = a1;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v21 = v10;
      v22 = 2114;
      v23 = v5;
      v11 = "%{public}@More than one metadata object (using first): %{public}@";
LABEL_7:
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_ERROR, v11, buf, 0x16u);

    }
  }
  else
  {
    v7 = (void *)MEMORY[0x227676638]();
    v12 = a1;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v21 = v10;
      v22 = 2114;
      v23 = v6;
      v11 = "%{public}@Failed to fetch metadata objects: %{public}@";
      goto LABEL_7;
    }
  }

  objc_autoreleasePoolPop(v7);
LABEL_9:
  objc_msgSend(v5, "firstObject");
  v13 = (MKFCloudSyncMetadata *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    v13 = -[MKFCloudSyncMetadata initWithContext:]([MKFCloudSyncMetadata alloc], "initWithContext:", v3);
    v14 = (void *)MEMORY[0x227676638]();
    v15 = a1;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v21 = v17;
      _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_INFO, "%{public}@Created new metadata object", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v14);
  }

  return v13;
}

void __74__HMDCoreDataCloudTransform__updateHomeManagerApplicationDataWithContext___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  v4 = a2;
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v7 = v4;
  if (!*(_QWORD *)(v5 + 40))
    goto LABEL_4;
  v6 = objc_msgSend(v4, "primaryHomeCounter");
  if (v6 > objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "primaryHomeCounter"))
  {
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
LABEL_4:
    objc_storeStrong((id *)(v5 + 40), a2);
  }

}

void __74__HMDCoreDataCloudTransform__updateHomeManagerApplicationDataWithContext___block_invoke_207(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x227676638]();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "_importHomeManagerNewHome:newPrimaryHome:newApplicationData:context:", 0, 0, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  -[HMDCoreDataCloudTransform _saveHomeManagerChangesToWorkingStoreWithContext:](*(void **)(a1 + 48), *(void **)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 40), "reset");
  objc_autoreleasePoolPop(v2);
}

- (void)_saveHomeManagerChangesToWorkingStoreWithContext:(void *)a1
{
  id v3;
  char v4;
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  const char *v11;
  NSObject *v12;
  os_log_type_t v13;
  uint32_t v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (a1)
  {
    v15 = 0;
    v4 = -[HMDCoreDataCloudTransform _saveContextToWorkingStore:error:]((uint64_t)a1, v3, (uint64_t)&v15);
    v5 = v15;
    v6 = (void *)MEMORY[0x227676638]();
    v7 = a1;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if ((v4 & 1) != 0)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v17 = v10;
        v11 = "%{public}@Saved home manager changes";
        v12 = v9;
        v13 = OS_LOG_TYPE_INFO;
        v14 = 12;
LABEL_7:
        _os_log_impl(&dword_2218F0000, v12, v13, v11, buf, v14);

      }
    }
    else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v17 = v10;
      v18 = 2114;
      v19 = v5;
      v11 = "%{public}@Failed to save home manager changes: %{public}@";
      v12 = v9;
      v13 = OS_LOG_TYPE_ERROR;
      v14 = 22;
      goto LABEL_7;
    }

    objc_autoreleasePoolPop(v6);
  }

}

- (uint64_t)_saveContextToWorkingStore:(uint64_t)a3 error:
{
  uint64_t v4;
  id v5;
  uint64_t v6;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = a2;
  objc_msgSend(v5, "setMergePolicy:", v4);
  v6 = objc_msgSend(v5, "hmd_saveWithTransactionAuthor:error:", 4, a3);

  return v6;
}

- (uint64_t)_processChangeSet:(int)a3 isImport:(void *)a4 context:
{
  id *v7;
  id v8;
  __CFString *v9;
  id *v10;
  id v11;
  void *v12;
  id *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  HMDLogEventCoreDataSignificantEvent *v20;
  id v21;
  char v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  id *v31;
  NSObject *v32;
  void *v33;
  id v34;
  void *v35;
  BOOL v36;
  uint64_t v37;
  id *v38;
  id v39;
  void *v40;
  id v41;
  NSObject *v42;
  void *v43;
  void *v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  void *v52;
  id v53;
  NSObject *v54;
  id v55;
  void *v56;
  id v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  id v62;
  NSObject *v63;
  void *v64;
  void *v65;
  id v66;
  NSObject *v67;
  void *v68;
  id v69;
  id *v70;
  void *v71;
  id *v72;
  id v73;
  char v74;
  id v75;
  void *v76;
  id v77;
  NSObject *v78;
  NSObject *v79;
  void *v80;
  id v81;
  void *v82;
  id v83;
  NSObject *v84;
  void *v85;
  id v86;
  id *v87;
  id v88;
  void *v89;
  id *v90;
  NSObject *v91;
  void *v92;
  id v93;
  id v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  id v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  uint64_t *v104;
  id v105;
  void *v106;
  void *v107;
  id *v108;
  NSObject *v109;
  void *v110;
  void *v111;
  uint64_t v112;
  void *v113;
  id v114;
  void *v115;
  id v116;
  void *v117;
  void *v118;
  uint64_t (*v119)(uint64_t, void *, void *, _BYTE *);
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  id v126;
  id v127;
  void *v128;
  id v129;
  void *v130;
  id *v131;
  NSObject *v132;
  void *v133;
  void *v134;
  id *v135;
  NSObject *v136;
  void *v137;
  uint64_t v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  id v145;
  char v146;
  id v147;
  void *v148;
  id *v149;
  NSObject *v150;
  NSObject *v151;
  void *v152;
  id v153;
  uint64_t v154;
  void *v155;
  id v156;
  uint64_t v157;
  objc_class *v158;
  void *v159;
  int v160;
  void *v162;
  __CFString *v163;
  id v164;
  id v165;
  _BOOL4 v166;
  int v167;
  void *v168;
  void *v169;
  id v170;
  __CFString *v171;
  id *v172;
  void *v173;
  _QWORD v174[5];
  id v175;
  char v176;
  uint64_t v177;
  uint64_t v178;
  void (*v179)(uint64_t, void *, void *, _BYTE *);
  void *v180;
  id *v181;
  id v182;
  id v183;
  uint64_t *v184;
  char v185;
  id v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t (*v189)(uint64_t, uint64_t);
  void (*v190)(uint64_t);
  id v191;
  id v192;
  uint64_t *v193;
  char v194;
  uint64_t v195;
  uint64_t *v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t v202;
  id v203;
  uint64_t *v204;
  uint64_t v205;
  uint64_t *v206;
  uint64_t v207;
  char v208;
  uint8_t v209[4];
  void *v210;
  __int16 v211;
  id *v212;
  void *v213;
  uint64_t v214;
  uint64_t (*v215)(uint64_t, void *, void *, _BYTE *);
  void *v216;
  id *v217;
  id v218;
  id v219;
  uint64_t *v220;
  char v221;
  _BYTE buf[24];
  uint64_t v223;
  _BYTE v224[24];
  uint64_t *v225;
  char v226;
  _BYTE v227[24];
  void *v228;
  id v229;
  uint64_t *v230;
  uint64_t v231;

  v231 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a4;
  v172 = v7;
  if (a1)
  {
    if (v7 && (objc_msgSend(v7[3], "count") || objc_msgSend(v7[2], "count") || objc_msgSend(v7[1], "count")))
    {
      v9 = CFSTR("export");
      if (a3)
        v9 = CFSTR("import");
      v171 = v9;
      objc_msgSend(v8, "setHmd_currentChangeSet:", v7);
      v173 = v8;
      v167 = a3;
      v169 = a1;
      if (a3)
      {
        v10 = v7;
        v11 = v8;
        v12 = (void *)MEMORY[0x227676638]();
        v13 = a1;
        HMFGetOSLogHandle();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          *(_QWORD *)&buf[4] = v15;
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v10;
          _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_INFO, "%{public}@Processing import changes: %{public}@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v12);
        v205 = 0;
        v206 = &v205;
        v207 = 0x2020000000;
        v208 = 0;
        -[HMDCoreDataCloudTransformChangeSet inserts](v10);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v199 = MEMORY[0x24BDAC760];
        v200 = 3221225472;
        v201 = (uint64_t)__61__HMDCoreDataCloudTransform__processImportChangeSet_context___block_invoke;
        v202 = (uint64_t)&unk_24E7843D0;
        v17 = v11;
        v203 = v17;
        v204 = &v205;
        objc_msgSend(v16, "hmf_enumerateWithAutoreleasePoolUsingBlock:", &v199);

        -[HMDCoreDataCloudTransformChangeSet updates](v10);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_QWORD *)v227 = MEMORY[0x24BDAC760];
        *(_QWORD *)&v227[8] = 3221225472;
        *(_QWORD *)&v227[16] = __61__HMDCoreDataCloudTransform__processImportChangeSet_context___block_invoke_2;
        v228 = &unk_24E7843F8;
        v19 = v17;
        v229 = v19;
        v230 = &v205;
        objc_msgSend(v18, "enumerateKeysAndObjectsUsingBlock:", v227);

        objc_msgSend(v19, "processPendingChanges");
        if (*((_BYTE *)v206 + 24))
        {
          v20 = -[HMDLogEventCoreDataSignificantEvent initWithReason:]([HMDLogEventCoreDataSignificantEvent alloc], "initWithReason:", 4);
          -[HMDLogEventCoreDataSignificantEvent setContext:](v20, "setContext:", CFSTR("DuplicateModelID"));
          v21 = v13[10];
          objc_msgSend(v21, "submitLogEvent:", v20);

        }
        v22 = *((_BYTE *)v10 + 32);
        objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v195 = 0;
        v196 = &v195;
        v197 = 0x2020000000;
        v198 = 1;
        v24 = v7[3];
        *(_QWORD *)buf = MEMORY[0x24BDAC760];
        *(_QWORD *)&buf[8] = 3221225472;
        *(_QWORD *)&buf[16] = __61__HMDCoreDataCloudTransform__processImportChangeSet_context___block_invoke_3;
        v223 = (uint64_t)&unk_24E784420;
        v225 = &v195;
        *(_QWORD *)v224 = v13;
        v226 = v22;
        v25 = v23;
        *(_QWORD *)&v224[8] = v25;
        v164 = v19;
        *(_QWORD *)&v224[16] = v164;
        objc_msgSend(v24, "enumerateKeysAndObjectsUsingBlock:", buf);

        if (v196[3])
        {
          -[HMDCoreDataCloudTransformChangeSet inserts](v10);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v186 = (id)MEMORY[0x24BDAC760];
          v187 = 3221225472;
          v188 = (uint64_t)__61__HMDCoreDataCloudTransform__processImportChangeSet_context___block_invoke_4;
          v189 = (uint64_t (*)(uint64_t, uint64_t))&unk_24E784448;
          v193 = &v195;
          v190 = (void (*)(uint64_t))v13;
          v194 = v22;
          v25 = v25;
          v191 = v25;
          v27 = v164;
          v192 = v27;
          objc_msgSend(v26, "hmf_enumerateWithAutoreleasePoolUsingBlock:", &v186);

          if (v196[3])
          {
            -[HMDCoreDataCloudTransformChangeSet updates](v10);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v213 = (void *)MEMORY[0x24BDAC760];
            v214 = 3221225472;
            v215 = __61__HMDCoreDataCloudTransform__processImportChangeSet_context___block_invoke_5;
            v216 = &unk_24E784470;
            v220 = &v195;
            v217 = v13;
            v221 = v22;
            v25 = v25;
            v218 = v25;
            v29 = v27;
            v219 = v29;
            objc_msgSend(v28, "enumerateKeysAndObjectsUsingBlock:", &v213);

            if (v196[3])
            {
              while (objc_msgSend(v25, "count"))
              {
                v30 = (void *)MEMORY[0x227676638]();
                v31 = v13;
                HMFGetOSLogHandle();
                v32 = (id)objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
                {
                  HMFGetLogIdentifier();
                  v33 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)v209 = 138543618;
                  v210 = v33;
                  v211 = 2114;
                  v212 = v10;
                  _os_log_impl(&dword_2218F0000, v32, OS_LOG_TYPE_INFO, "%{public}@Processing import additional updates: %{public}@", v209, 0x16u);

                }
                objc_autoreleasePoolPop(v30);
                v34 = v25;
                objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
                v35 = (void *)objc_claimAutoreleasedReturnValue();

                v177 = MEMORY[0x24BDAC760];
                v178 = 3221225472;
                v179 = __61__HMDCoreDataCloudTransform__processImportChangeSet_context___block_invoke_183;
                v180 = &unk_24E784498;
                v184 = &v195;
                v181 = v31;
                v185 = v22;
                v25 = v35;
                v182 = v25;
                v183 = v29;
                objc_msgSend(v34, "enumerateKeysAndObjectsUsingBlock:", &v177);
                v36 = v196[3] == 0;

                if (v36)
                  goto LABEL_20;
              }
              v37 = v196[3];
            }
            else
            {
LABEL_20:
              v37 = 0;
            }

          }
          else
          {
            v37 = 0;
          }

        }
        else
        {
          v37 = 0;
        }

        _Block_object_dispose(&v195, 8);
        _Block_object_dispose(&v205, 8);

      }
      else
      {
        v38 = v7;
        v39 = v8;
        if (*((_BYTE *)v38 + 32))
        {
          v165 = v39;
          v40 = (void *)MEMORY[0x227676638]();
          v41 = a1;
          HMFGetOSLogHandle();
          v42 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            *(_QWORD *)&buf[4] = v43;
            *(_WORD *)&buf[12] = 2114;
            *(_QWORD *)&buf[14] = v38;
            _os_log_impl(&dword_2218F0000, v42, OS_LOG_TYPE_INFO, "%{public}@Processing export changes: %{public}@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v40);
          objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v199 = 0;
          v200 = (uint64_t)&v199;
          v201 = 0x2020000000;
          v202 = 1;
          v45 = v7[3];
          *(_QWORD *)buf = MEMORY[0x24BDAC760];
          *(_QWORD *)&buf[8] = 3221225472;
          *(_QWORD *)&buf[16] = __61__HMDCoreDataCloudTransform__processExportChangeSet_context___block_invoke;
          v223 = (uint64_t)&unk_24E784510;
          v225 = &v199;
          *(_QWORD *)v224 = v41;
          v46 = v44;
          *(_QWORD *)&v224[8] = v46;
          v47 = v165;
          *(_QWORD *)&v224[16] = v47;
          objc_msgSend(v45, "enumerateKeysAndObjectsUsingBlock:", buf);

          if (*(_QWORD *)(v200 + 24))
          {
            v48 = v38[1];
            v186 = (id)MEMORY[0x24BDAC760];
            v187 = 3221225472;
            v188 = (uint64_t)__61__HMDCoreDataCloudTransform__processExportChangeSet_context___block_invoke_2;
            v189 = (uint64_t (*)(uint64_t, uint64_t))&unk_24E784538;
            v193 = &v199;
            v190 = (void (*)(uint64_t))v41;
            v46 = v46;
            v191 = v46;
            v49 = v47;
            v192 = v49;
            objc_msgSend(v48, "hmf_enumerateWithAutoreleasePoolUsingBlock:", &v186);

            if (*(_QWORD *)(v200 + 24))
            {
              v50 = v38[2];
              v213 = (void *)MEMORY[0x24BDAC760];
              v214 = 3221225472;
              v215 = __61__HMDCoreDataCloudTransform__processExportChangeSet_context___block_invoke_3;
              v216 = &unk_24E784560;
              v220 = &v199;
              v217 = (id *)v41;
              v46 = v46;
              v218 = v46;
              v51 = v49;
              v219 = v51;
              objc_msgSend(v50, "enumerateKeysAndObjectsUsingBlock:", &v213);

              if (*(_QWORD *)(v200 + 24))
              {
                while (objc_msgSend(v46, "count"))
                {
                  v52 = (void *)MEMORY[0x227676638]();
                  v53 = v41;
                  HMFGetOSLogHandle();
                  v54 = (id)objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
                  {
                    HMFGetLogIdentifier();
                    v55 = (id)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v46, "allKeys");
                    v56 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)v227 = 138543618;
                    *(_QWORD *)&v227[4] = v55;
                    *(_WORD *)&v227[12] = 2114;
                    *(_QWORD *)&v227[14] = v56;
                    _os_log_impl(&dword_2218F0000, v54, OS_LOG_TYPE_INFO, "%{public}@Processing export additional updates: %{public}@", v227, 0x16u);

                  }
                  objc_autoreleasePoolPop(v52);
                  v57 = v46;
                  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
                  v58 = objc_claimAutoreleasedReturnValue();

                  v177 = MEMORY[0x24BDAC760];
                  v178 = 3221225472;
                  v179 = __61__HMDCoreDataCloudTransform__processExportChangeSet_context___block_invoke_190;
                  v180 = &unk_24E784588;
                  v184 = &v199;
                  v181 = (id *)v53;
                  v46 = (id)v58;
                  v182 = v46;
                  v183 = v51;
                  objc_msgSend(v57, "enumerateKeysAndObjectsUsingBlock:", &v177);
                  LOBYTE(v58) = *(_QWORD *)(v200 + 24) == 0;

                  if ((v58 & 1) != 0)
                    goto LABEL_31;
                }
                v37 = *(_QWORD *)(v200 + 24);
              }
              else
              {
LABEL_31:
                v37 = 0;
              }

            }
            else
            {
              v37 = 0;
            }

          }
          else
          {
            v37 = 0;
          }

          _Block_object_dispose(&v199, 8);
          v39 = v165;
        }
        else
        {
          v37 = 1;
        }

      }
      v60 = objc_msgSend(v173, "setHmd_currentChangeSet:", 0);
      if (!v37)
      {
        v61 = (void *)MEMORY[0x227676638](v60);
        v62 = v169;
        HMFGetOSLogHandle();
        v63 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
        {
          HMFGetLogIdentifier();
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          *(_QWORD *)&buf[4] = v64;
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v171;
          *(_WORD *)&buf[22] = 2114;
          v223 = (uint64_t)v172;
          _os_log_impl(&dword_2218F0000, v63, OS_LOG_TYPE_DEFAULT, "%{public}@Rolling back managed objects after processing %{public}@ changes: %{public}@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v61);
        v60 = objc_msgSend(v173, "rollback");
      }
      v65 = (void *)MEMORY[0x227676638](v60);
      v66 = v169;
      HMFGetOSLogHandle();
      v67 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v67, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        v69 = v172[6];
        *(_DWORD *)buf = 138544130;
        *(_QWORD *)&buf[4] = v68;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v171;
        *(_WORD *)&buf[22] = 2160;
        v223 = 1752392040;
        *(_WORD *)v224 = 2112;
        *(_QWORD *)&v224[2] = v69;
        _os_log_impl(&dword_2218F0000, v67, OS_LOG_TYPE_INFO, "%{public}@Finished processing %{public}@ changes for home %{mask.hash}@", buf, 0x2Au);

      }
      objc_autoreleasePoolPop(v65);
      if ((objc_msgSend(v173, "hasChanges") & 1) != 0)
      {
        v70 = v172;
        v170 = v172[6];
        if (v170)
        {
          HMDWorkingContextNameForHomeUUID(v170);
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v173, "setName:", v71);

          v70 = v172;
        }
        if (v167)
        {
          v72 = v70;
          v73 = v173;
          v186 = 0;
          v74 = -[HMDCoreDataCloudTransform _saveContextToWorkingStore:error:]((uint64_t)v66, v73, (uint64_t)&v186);
          v75 = v186;
          v76 = (void *)MEMORY[0x227676638]();
          v77 = v66;
          HMFGetOSLogHandle();
          v78 = objc_claimAutoreleasedReturnValue();
          v79 = v78;
          if ((v74 & 1) != 0)
          {
            if (os_log_type_enabled(v78, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v80 = (void *)objc_claimAutoreleasedReturnValue();
              v81 = v172[6];
              *(_DWORD *)buf = 138543874;
              *(_QWORD *)&buf[4] = v80;
              *(_WORD *)&buf[12] = 2160;
              *(_QWORD *)&buf[14] = 1752392040;
              *(_WORD *)&buf[22] = 2112;
              v223 = (uint64_t)v81;
              _os_log_impl(&dword_2218F0000, v79, OS_LOG_TYPE_INFO, "%{public}@Saved after processing import changes for home %{mask.hash}@", buf, 0x20u);

            }
          }
          else if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v113 = (void *)objc_claimAutoreleasedReturnValue();
            v114 = v172[6];
            *(_DWORD *)buf = 138544130;
            *(_QWORD *)&buf[4] = v113;
            *(_WORD *)&buf[12] = 2160;
            *(_QWORD *)&buf[14] = 1752392040;
            *(_WORD *)&buf[22] = 2112;
            v223 = (uint64_t)v114;
            *(_WORD *)v224 = 2114;
            *(_QWORD *)&v224[2] = v75;
            _os_log_impl(&dword_2218F0000, v79, OS_LOG_TYPE_ERROR, "%{public}@Failed to save after processing import changes for home %{mask.hash}@: %{public}@", buf, 0x2Au);

          }
          objc_autoreleasePoolPop(v76);

          objc_msgSend(v73, "hmd_homeManagerContext");
          v115 = (void *)objc_claimAutoreleasedReturnValue();
          if (v115)
          {
            objc_msgSend(v73, "setHmd_homeManagerContext:", 0);
            v174[0] = MEMORY[0x24BDAC760];
            v174[1] = 3221225472;
            v174[2] = __64__HMDCoreDataCloudTransform__processChangeSet_isImport_context___block_invoke;
            v174[3] = &unk_24E799CF0;
            v176 = v74;
            v174[4] = v77;
            v175 = v115;
            objc_msgSend(v175, "performBlockAndWait:", v174);

          }
        }
        else
        {
          v87 = v70;
          v88 = v173;
          v89 = (void *)MEMORY[0x227676638]();
          v90 = (id *)v66;
          HMFGetOSLogHandle();
          v91 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v91, OS_LOG_TYPE_DEBUG))
          {
            HMFGetLogIdentifier();
            v92 = (void *)objc_claimAutoreleasedReturnValue();
            v93 = v172[6];
            v94 = v87[8];
            *(_DWORD *)buf = 138544130;
            *(_QWORD *)&buf[4] = v92;
            *(_WORD *)&buf[12] = 2160;
            *(_QWORD *)&buf[14] = 1752392040;
            *(_WORD *)&buf[22] = 2112;
            v223 = (uint64_t)v93;
            *(_WORD *)v224 = 2114;
            *(_QWORD *)&v224[2] = v94;
            _os_log_impl(&dword_2218F0000, v91, OS_LOG_TYPE_DEBUG, "%{public}@Saving to cloud store after processing export changes for home %{mask.hash}@ on behalf of client identifier: %{public}@", buf, 0x2Au);

          }
          objc_autoreleasePoolPop(v89);
          objc_msgSend(v88, "updatedObjects");
          v95 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v88, "insertedObjects");
          v96 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v88, "deletedObjects");
          v97 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v88, "transactionAuthor");
          v98 = (void *)objc_claimAutoreleasedReturnValue();
          +[HMDCoreDataCloudStoreTransactionLogEvent eventForUpdates:inserts:deletes:transactionAuthor:](HMDCoreDataCloudStoreTransactionLogEvent, "eventForUpdates:inserts:deletes:transactionAuthor:", v95, v96, v97, v98);
          v168 = (void *)objc_claimAutoreleasedReturnValue();

          if (v168)
            objc_msgSend(v90[10], "submitLogEvent:", v168);
          v99 = v88;
          objc_msgSend(v99, "insertedObjects");
          v100 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v99, "updatedObjects");
          v101 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v100, "count") || objc_msgSend(v101, "count"))
          {
            objc_msgSend(MEMORY[0x24BDBCE60], "now");
            v102 = (void *)objc_claimAutoreleasedReturnValue();
            MKFCKModelCurrentWriterVersionString();
            v103 = (void *)objc_claimAutoreleasedReturnValue();
            -[HMDCoreDataCloudTransform _updateWriterPropertiesForCloudObjects:timestamp:version:](v100, v102, v103);
            -[HMDCoreDataCloudTransform _updateWriterPropertiesForCloudObjects:timestamp:version:](v101, v102, v103);

          }
          v104 = v87;
          v105 = v99;
          v106 = v105;
          if (v104[7] > 24)
          {
            v116 = v105;
            +[MKFCKAppleMediaAccessory entity](MKFCKAppleMediaAccessory, "entity");
            v117 = (void *)objc_claimAutoreleasedReturnValue();
            v213 = v117;
            +[MKFCKHome entity](MKFCKHome, "entity");
            v118 = (void *)objc_claimAutoreleasedReturnValue();
            v214 = (uint64_t)v118;
            +[MKFCKUser entity](MKFCKUser, "entity");
            v119 = (uint64_t (*)(uint64_t, void *, void *, _BYTE *))objc_claimAutoreleasedReturnValue();
            v215 = v119;
            objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v213, 3);
            v120 = (void *)objc_claimAutoreleasedReturnValue();

            v121 = (void *)MEMORY[0x24BDBCEF0];
            objc_msgSend(v116, "insertedObjects");
            v122 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v121, "setWithSet:", v122);
            v123 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v116, "updatedObjects");
            v124 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v123, "unionSet:", v124);

            objc_msgSend(v116, "deletedObjects");
            v125 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v123, "unionSet:", v125);

            v186 = 0;
            v187 = (uint64_t)&v186;
            v188 = 0x3032000000;
            v189 = __Block_byref_object_copy__109940;
            v190 = __Block_byref_object_dispose__109941;
            v191 = 0;
            *(_QWORD *)buf = MEMORY[0x24BDAC760];
            *(_QWORD *)&buf[8] = 3221225472;
            *(_QWORD *)&buf[16] = __75__HMDCoreDataCloudTransform__fetchRequestForCriticalObjectExportInContext___block_invoke;
            v223 = (uint64_t)&unk_24E790B60;
            v126 = v120;
            *(_QWORD *)v224 = v126;
            *(_QWORD *)&v224[8] = v90;
            *(_QWORD *)&v224[16] = &v186;
            objc_msgSend(v123, "hmf_enumerateWithAutoreleasePoolUsingBlock:", buf);
            v127 = *(id *)(v187 + 40);

            _Block_object_dispose(&v186, 8);
            v166 = v127 != 0;
            if (v127)
            {
              v128 = (void *)v104[8];
              if (v128)
              {
                v129 = v128;
                objc_msgSend(CFSTR("HomeKitCloudExportVoucher/"), "stringByAppendingString:", v129);
                v163 = (__CFString *)objc_claimAutoreleasedReturnValue();

              }
              else
              {
                v163 = CFSTR("HomeKitCloudExportVoucher/");
              }
              objc_msgSend((id)objc_opt_class(), "userInitiatedVoucherWithLabel:forEventsOfType:affectingObjectsMatching:", v163, 2, v127);
              v162 = (void *)objc_claimAutoreleasedReturnValue();
              v134 = (void *)MEMORY[0x227676638]();
              v135 = v90;
              HMFGetOSLogHandle();
              v136 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v136, OS_LOG_TYPE_INFO))
              {
                HMFGetLogIdentifier();
                v137 = (void *)objc_claimAutoreleasedReturnValue();
                v138 = v104[8];
                *(_DWORD *)buf = 138543618;
                *(_QWORD *)&buf[4] = v137;
                *(_WORD *)&buf[12] = 2114;
                *(_QWORD *)&buf[14] = v138;
                _os_log_impl(&dword_2218F0000, v136, OS_LOG_TYPE_INFO, "%{public}@Applying export voucher on behalf of client identifier: %{public}@", buf, 0x16u);

              }
              objc_autoreleasePoolPop(v134);
              objc_msgSend(v135, "coreData");
              v139 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v139, "container");
              v140 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v135, "coreData");
              v141 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v141, "cloudPrivateStore");
              v142 = (void *)objc_claimAutoreleasedReturnValue();
              *(_QWORD *)buf = v142;
              objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", buf, 1);
              v143 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v140, "applyActivityVoucher:toStores:", v162, v143);

            }
            else
            {
              v130 = (void *)MEMORY[0x227676638]();
              v131 = v90;
              HMFGetOSLogHandle();
              v132 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v132, OS_LOG_TYPE_INFO))
              {
                HMFGetLogIdentifier();
                v133 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543362;
                *(_QWORD *)&buf[4] = v133;
                _os_log_impl(&dword_2218F0000, v132, OS_LOG_TYPE_INFO, "%{public}@No export voucher necessary since no critical object was detected", buf, 0xCu);

              }
              objc_autoreleasePoolPop(v130);
            }

          }
          else
          {
            v107 = (void *)MEMORY[0x227676638]();
            v108 = v90;
            HMFGetOSLogHandle();
            v109 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v109, OS_LOG_TYPE_DEBUG))
            {
              HMFGetLogIdentifier();
              v110 = (void *)objc_claimAutoreleasedReturnValue();
              HMFQualityOfServiceToString();
              v111 = (void *)objc_claimAutoreleasedReturnValue();
              v112 = v104[8];
              *(_DWORD *)buf = 138543874;
              *(_QWORD *)&buf[4] = v110;
              *(_WORD *)&buf[12] = 2112;
              *(_QWORD *)&buf[14] = v111;
              *(_WORD *)&buf[22] = 2112;
              v223 = v112;
              _os_log_impl(&dword_2218F0000, v109, OS_LOG_TYPE_DEBUG, "%{public}@No export voucher necessary for change set with QoS %@ for clientIdentifier: %@", buf, 0x20u);

            }
            objc_autoreleasePoolPop(v107);
            v166 = 0;
          }

          objc_msgSend(v106, "setMergePolicy:", v90[4]);
          v144 = (void *)v104[8];
          v186 = 0;
          v145 = v144;
          v146 = objc_msgSend(v106, "hmd_saveWithTransactionAuthor:clientIdentifier:allowQoSEscalation:error:", 4, v145, v166, &v186);
          v147 = v186;

          v148 = (void *)MEMORY[0x227676638]();
          v149 = v90;
          HMFGetOSLogHandle();
          v150 = objc_claimAutoreleasedReturnValue();
          v151 = v150;
          if ((v146 & 1) != 0)
          {
            if (os_log_type_enabled(v150, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v152 = (void *)objc_claimAutoreleasedReturnValue();
              v153 = v172[6];
              v154 = v104[8];
              *(_DWORD *)buf = 138544130;
              *(_QWORD *)&buf[4] = v152;
              *(_WORD *)&buf[12] = 2160;
              *(_QWORD *)&buf[14] = 1752392040;
              *(_WORD *)&buf[22] = 2112;
              v223 = (uint64_t)v153;
              *(_WORD *)v224 = 2114;
              *(_QWORD *)&v224[2] = v154;
              _os_log_impl(&dword_2218F0000, v151, OS_LOG_TYPE_INFO, "%{public}@Saved after processing export changes for home %{mask.hash}@ on behalf of client identifier %{public}@", buf, 0x2Au);

            }
          }
          else if (os_log_type_enabled(v150, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v155 = (void *)objc_claimAutoreleasedReturnValue();
            v156 = v172[6];
            v157 = v104[8];
            *(_DWORD *)buf = 138544386;
            *(_QWORD *)&buf[4] = v155;
            *(_WORD *)&buf[12] = 2160;
            *(_QWORD *)&buf[14] = 1752392040;
            *(_WORD *)&buf[22] = 2112;
            v223 = (uint64_t)v156;
            *(_WORD *)v224 = 2114;
            *(_QWORD *)&v224[2] = v157;
            *(_WORD *)&v224[10] = 2114;
            *(_QWORD *)&v224[12] = v147;
            _os_log_impl(&dword_2218F0000, v151, OS_LOG_TYPE_ERROR, "%{public}@Failed to save after processing export changes for home %{mask.hash}@ on behalf of client identifier %{public}@: %{public}@", buf, 0x34u);

          }
          objc_autoreleasePoolPop(v148);

        }
        if (v170)
        {
          objc_opt_class();
          v158 = (objc_class *)objc_opt_self();
          NSStringFromClass(v158);
          v159 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v173, "setName:", v159);

        }
        v160 = objc_msgSend(v173, "hasChanges");
        if (v160)
          objc_msgSend(v173, "rollback");
        v59 = v160 ^ 1u;
      }
      else
      {
        v82 = (void *)MEMORY[0x227676638]();
        v83 = v66;
        HMFGetOSLogHandle();
        v84 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v84, OS_LOG_TYPE_DEBUG))
        {
          HMFGetLogIdentifier();
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          v86 = v172[6];
          *(_DWORD *)buf = 138544130;
          *(_QWORD *)&buf[4] = v85;
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v171;
          *(_WORD *)&buf[22] = 2160;
          v223 = 1752392040;
          *(_WORD *)v224 = 2112;
          *(_QWORD *)&v224[2] = v86;
          _os_log_impl(&dword_2218F0000, v84, OS_LOG_TYPE_DEBUG, "%{public}@No changes to managed objects after processing %{public}@ changes for home %{mask.hash}@", buf, 0x2Au);

        }
        objc_autoreleasePoolPop(v82);
        v59 = 0;
      }

      v8 = v173;
    }
    else
    {
      v59 = 1;
    }
  }
  else
  {
    v59 = 0;
  }

  return v59;
}

void __64__HMDCoreDataCloudTransform__processChangeSet_isImport_context___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
  if (*(_BYTE *)(a1 + 48))
  {
    -[HMDCoreDataCloudTransform _saveHomeManagerChangesToWorkingStoreWithContext:](*(void **)(a1 + 32), *(void **)(a1 + 40));
  }
  else
  {
    v3 = (void *)MEMORY[0x227676638]();
    v4 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138543362;
      v8 = v6;
      _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_ERROR, "%{public}@Discarding home manager changes after previous working store save failure", (uint8_t *)&v7, 0xCu);

    }
    objc_autoreleasePoolPop(v3);
  }
  objc_msgSend(*(id *)(a1 + 40), "reset");
  objc_autoreleasePoolPop(v2);
}

void __75__HMDCoreDataCloudTransform__fetchRequestForCriticalObjectExportInContext___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  if (v7)
  {
    v8 = *(void **)(a1 + 32);
    objc_msgSend(v7, "entity");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v8) = objc_msgSend(v8, "containsObject:", v9);

    if ((_DWORD)v8)
    {
      v10 = (void *)MEMORY[0x227676638]();
      v11 = *(id *)(a1 + 40);
      HMFGetOSLogHandle();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v24 = v13;
        v25 = 2112;
        v26 = v7;
        _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@Detected dirty critical object for export: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v10);
      v14 = (void *)MEMORY[0x24BDBB678];
      objc_msgSend(v7, "entity");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "name");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "fetchRequestWithEntityName:", v16);
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v19 = *(void **)(v18 + 40);
      *(_QWORD *)(v18 + 40) = v17;

      v20 = (void *)MEMORY[0x24BDD1758];
      objc_msgSend(v7, "modelID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "predicateWithFormat:", CFSTR("(%K == %@)"), CFSTR("modelID"), v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setPredicate:", v22);

      *a3 = 1;
    }
  }

}

- (void)_updateWriterPropertiesForCloudObjects:(void *)a1 timestamp:(void *)a2 version:(void *)a3
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __86__HMDCoreDataCloudTransform__updateWriterPropertiesForCloudObjects_timestamp_version___block_invoke;
  v9[3] = &unk_24E784340;
  v8 = v5;
  v10 = v8;
  v7 = v6;
  v11 = v7;
  objc_msgSend(a1, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v9);

}

void __86__HMDCoreDataCloudTransform__updateWriterPropertiesForCloudObjects_timestamp_version___block_invoke(uint64_t a1, void *a2)
{
  int v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  char v11;
  id v12;

  v12 = a2;
  v3 = objc_msgSend(v12, "hasPersistentChangedValues");
  v4 = v12;
  if (v3)
  {
    v5 = v12;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
    v7 = v6;

    if (v7)
    {
      objc_msgSend(v7, "writerTimestamp");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "isEqualToDate:", *(_QWORD *)(a1 + 32));

      if ((v9 & 1) == 0)
        objc_msgSend(v7, "setWriterTimestamp:", *(_QWORD *)(a1 + 32));
      objc_msgSend(v7, "writerVersion");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "isEqualToString:", *(_QWORD *)(a1 + 40));

      if ((v11 & 1) == 0)
        objc_msgSend(v7, "setWriterVersion:", *(_QWORD *)(a1 + 40));
    }

    v4 = v12;
  }

}

void __61__HMDCoreDataCloudTransform__processExportChangeSet_context___block_invoke(_QWORD *a1, void *a2, void *a3, _BYTE *a4)
{
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  __CFString *v16;
  void *v17;
  int v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  id v24;
  void *v25;
  const char *v26;
  const __CFString *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  NSObject *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  NSObject *v40;
  void *v41;
  _BYTE *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  id v48;
  _BYTE *v49;
  _BYTE *v50;
  id v51;
  uint8_t buf[4];
  void *v53;
  __int16 v54;
  uint64_t v55;
  __int16 v56;
  uint64_t v57;
  __int16 v58;
  uint64_t v59;
  __int16 v60;
  const __CFString *v61;
  uint64_t v62;

  v62 = *MEMORY[0x24BDAC8D0];
  v8 = (void *)a1[4];
  v7 = (void *)a1[5];
  v9 = (void *)a1[6];
  v10 = a2;
  v11 = a3;
  v12 = v7;
  v13 = v9;
  if (v8)
  {
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("modelID"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v15 = v14;
    else
      v15 = 0;
    v16 = v15;

    objc_msgSend(v13, "objectWithID:", v10);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "isDeleted");

    if (v18)
    {
      v19 = (void *)MEMORY[0x227676638]();
      v20 = v8;
      HMFGetOSLogHandle();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v46 = v11;
        v49 = a4;
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "hmd_debugIdentifier");
        v23 = objc_claimAutoreleasedReturnValue();
        v24 = v12;
        v25 = (void *)v23;
        *(_DWORD *)buf = 138544386;
        v26 = ": ";
        v53 = v22;
        if (!v16)
          v26 = "";
        v54 = 2112;
        v55 = v23;
        v56 = 2080;
        v27 = &stru_24E79DB48;
        if (v16)
          v27 = v16;
        v57 = (uint64_t)v26;
        v58 = 2160;
        v59 = 1752392040;
        v60 = 2112;
        v61 = v27;
        _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_INFO, "%{public}@Skipping processing export delete for already-deleted object: <%@%s%{mask.hash}@>", buf, 0x34u);

        v12 = v24;
        v11 = v46;
        a4 = v49;
      }

      objc_autoreleasePoolPop(v19);
      v28 = 1;
    }
    else
    {
      v51 = v12;
      v29 = (void *)objc_opt_class();
      objc_msgSend(v10, "entity");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = (void *)objc_msgSend(v29, "exportTransformableClassFromEntity:", v30);

      if (v31)
      {
        v50 = a4;
        v32 = (void *)MEMORY[0x227676638]();
        v33 = v8;
        HMFGetOSLogHandle();
        v34 = objc_claimAutoreleasedReturnValue();
        v35 = v34;
        v12 = v51;
        if (v16)
        {
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
          {
            HMFGetLogIdentifier();
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "hmd_debugIdentifier");
            v47 = v32;
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544130;
            v53 = v36;
            v54 = 2112;
            v55 = (uint64_t)v37;
            v56 = 2160;
            v57 = 1752392040;
            v58 = 2112;
            v59 = (uint64_t)v16;
            _os_log_impl(&dword_2218F0000, v35, OS_LOG_TYPE_DEBUG, "%{public}@Processing export delete: <%@: %{mask.hash}@>", buf, 0x2Au);

            v32 = v47;
            v12 = v51;
          }

          objc_autoreleasePoolPop(v32);
          v28 = objc_msgSend(v31, "exportDeleteWithObjectID:modelID:additionalUpdates:context:", v10, v16, v12, v13);
        }
        else
        {
          if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "hmd_debugIdentifier");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v53 = v44;
            v54 = 2112;
            v55 = (uint64_t)v45;
            v56 = 2112;
            v57 = (uint64_t)v11;
            _os_log_impl(&dword_2218F0000, v35, OS_LOG_TYPE_ERROR, "%{public}@Not processing export delete for transformable %@ due to missing modelID in tombstone: %@", buf, 0x20u);

            v12 = v51;
          }

          objc_autoreleasePoolPop(v32);
          v28 = 1;
        }
        a4 = v50;
      }
      else
      {
        v38 = (void *)MEMORY[0x227676638]();
        v39 = v8;
        HMFGetOSLogHandle();
        v40 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
        {
          HMFGetLogIdentifier();
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "hmd_debugIdentifier");
          v48 = v11;
          v42 = a4;
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v53 = v41;
          v54 = 2112;
          v55 = (uint64_t)v43;
          _os_log_impl(&dword_2218F0000, v40, OS_LOG_TYPE_DEBUG, "%{public}@Ignoring export delete: <%@>", buf, 0x16u);

          a4 = v42;
          v11 = v48;

        }
        objc_autoreleasePoolPop(v38);
        v28 = 1;
        v12 = v51;
      }
    }

  }
  else
  {
    v28 = 0;
  }

  *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24) = v28;
  if (!*(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24))
    *a4 = 1;
}

void __61__HMDCoreDataCloudTransform__processExportChangeSet_context___block_invoke_2(_QWORD *a1, void *a2, _BYTE *a3)
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  _BYTE *v18;
  void *v19;
  const char *v20;
  NSObject *v21;
  os_log_type_t v22;
  void *v23;
  void *v24;
  void *v25;
  _BOOL4 v26;
  void *v27;
  void *v28;
  uint64_t v29;
  _BYTE *v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v6 = (void *)a1[4];
  v5 = (void *)a1[5];
  v7 = (void *)a1[6];
  v8 = a2;
  v9 = v5;
  v10 = v7;
  v11 = v10;
  if (v6)
  {
    objc_msgSend(v10, "objectWithID:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isDeleted");

    if (v13)
    {
      v14 = (void *)MEMORY[0x227676638]();
      v15 = v6;
      HMFGetOSLogHandle();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "hmd_debugIdentifier");
        v18 = a3;
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v32 = v17;
        v33 = 2112;
        v34 = v19;
        v20 = "%{public}@Skipping processing export insert for already-deleted object: <%@>";
        v21 = v16;
        v22 = OS_LOG_TYPE_INFO;
LABEL_11:
        _os_log_impl(&dword_2218F0000, v21, v22, v20, buf, 0x16u);

        a3 = v18;
        goto LABEL_12;
      }
      goto LABEL_12;
    }
    v23 = (void *)objc_opt_class();
    objc_msgSend(v8, "entity");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)objc_msgSend(v23, "exportTransformableClassFromEntity:", v24);

    v14 = (void *)MEMORY[0x227676638]();
    v15 = v6;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    v26 = os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG);
    if (!v25)
    {
      if (v26)
      {
        HMFGetLogIdentifier();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "hmd_debugIdentifier");
        v18 = a3;
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v32 = v17;
        v33 = 2112;
        v34 = v19;
        v20 = "%{public}@Ignoring export insert: <%@>";
        v21 = v16;
        v22 = OS_LOG_TYPE_DEBUG;
        goto LABEL_11;
      }
LABEL_12:

      objc_autoreleasePoolPop(v14);
      v29 = 1;
      goto LABEL_13;
    }
    if (v26)
    {
      HMFGetLogIdentifier();
      v30 = a3;
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "hmd_debugIdentifier");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v32 = v27;
      v33 = 2112;
      v34 = v28;
      _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_DEBUG, "%{public}@Processing export insert: <%@>", buf, 0x16u);

      a3 = v30;
    }

    objc_autoreleasePoolPop(v14);
    v29 = objc_msgSend(v25, "exportInsertWithObjectID:additionalUpdates:context:", v8, v9, v11);
  }
  else
  {
    v29 = 0;
  }
LABEL_13:

  *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24) = v29;
  if (!*(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24))
    *a3 = 1;
}

uint64_t __61__HMDCoreDataCloudTransform__processExportChangeSet_context___block_invoke_3(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  uint64_t result;

  result = -[HMDCoreDataCloudTransform _processExportUpdateForObjectID:updatedProperties:additionalUpdates:context:](*(void **)(a1 + 32), a2, a3, *(void **)(a1 + 40), *(void **)(a1 + 48));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
    *a4 = 1;
  return result;
}

void __61__HMDCoreDataCloudTransform__processExportChangeSet_context___block_invoke_190(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;

  v7 = *(void **)(a1 + 32);
  v8 = a2;
  v9 = (void *)objc_msgSend(a3, "copy");
  v10 = -[HMDCoreDataCloudTransform _processExportUpdateForObjectID:updatedProperties:additionalUpdates:context:](v7, v8, v9, *(void **)(a1 + 40), *(void **)(a1 + 48));

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v10;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
    *a4 = 1;
}

- (uint64_t)_processExportUpdateForObjectID:(void *)a3 updatedProperties:(void *)a4 additionalUpdates:(void *)a5 context:
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  const char *v21;
  NSObject *v22;
  os_log_type_t v23;
  void *v24;
  void *v25;
  void *v26;
  _BOOL4 v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = v12;
  if (!a1)
  {
    v31 = 0;
    goto LABEL_13;
  }
  objc_msgSend(v12, "objectWithID:", v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isDeleted");

  if (v15)
  {
    v16 = (void *)MEMORY[0x227676638]();
    v17 = a1;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "hmd_debugIdentifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v35 = v19;
      v36 = 2112;
      v37 = v20;
      v21 = "%{public}@Skipping processing export update for already-deleted object: <%@>";
      v22 = v18;
      v23 = OS_LOG_TYPE_INFO;
LABEL_11:
      _os_log_impl(&dword_2218F0000, v22, v23, v21, buf, 0x16u);

      goto LABEL_12;
    }
    goto LABEL_12;
  }
  v24 = (void *)objc_opt_class();
  objc_msgSend(v9, "entity");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend(v24, "exportTransformableClassFromEntity:", v25);

  v16 = (void *)MEMORY[0x227676638]();
  v17 = a1;
  HMFGetOSLogHandle();
  v18 = objc_claimAutoreleasedReturnValue();
  v27 = os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG);
  if (!v26)
  {
    if (v27)
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "hmd_debugIdentifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v35 = v19;
      v36 = 2112;
      v37 = v20;
      v21 = "%{public}@Ignoring export update: <%@>";
      v22 = v18;
      v23 = OS_LOG_TYPE_DEBUG;
      goto LABEL_11;
    }
LABEL_12:

    objc_autoreleasePoolPop(v16);
    v31 = 1;
    goto LABEL_13;
  }
  if (v27)
  {
    HMFGetLogIdentifier();
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    MKFPropertyNamesFromDescriptions(v10);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "hmd_debugIdentifier");
    v33 = v16;
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v35 = v28;
    v36 = 2114;
    v37 = v29;
    v38 = 2112;
    v39 = v30;
    _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_DEBUG, "%{public}@Processing export update [%{public}@]: <%@>", buf, 0x20u);

    v16 = v33;
  }

  objc_autoreleasePoolPop(v16);
  v31 = objc_msgSend(v26, "exportUpdateWithObjectID:updatedProperties:additionalUpdates:context:", v9, v10, v11, v13);
LABEL_13:

  return v31;
}

void __61__HMDCoreDataCloudTransform__processImportChangeSet_context___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;

  objc_msgSend(*(id *)(a1 + 32), "objectWithID:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  v6 = objc_msgSend(v5, "ensureCanonicalModel");
  if (v6 == -1)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
}

void __61__HMDCoreDataCloudTransform__processImportChangeSet_context___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;

  objc_msgSend(*(id *)(a1 + 32), "objectWithID:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  v6 = objc_msgSend(v5, "ensureCanonicalModel");
  if (v6 == -1)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
}

void __61__HMDCoreDataCloudTransform__processImportChangeSet_context___block_invoke_3(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  int v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  id v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  id v37;
  id v38;
  _BYTE buf[24];
  uint64_t v40;
  __int128 v41;
  id v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v6 = *(unsigned __int8 *)(a1 + 64);
  v8 = *(void **)(a1 + 32);
  v7 = *(void **)(a1 + 40);
  v9 = *(void **)(a1 + 48);
  v10 = a2;
  v11 = a3;
  v37 = v7;
  v12 = v9;
  if (v8)
  {
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("modelID"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v14 = v13;
    else
      v14 = 0;
    v38 = v14;

    objc_msgSend(v12, "objectWithID:", v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "isDeleted");

    v17 = (void *)MEMORY[0x227676638]();
    v18 = v8;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (v16)
    {
      v21 = v38;
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "hmd_debugIdentifier");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        *(_QWORD *)&buf[4] = v22;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v23;
        *(_WORD *)&buf[22] = 2160;
        v40 = 1752392040;
        LOWORD(v41) = 2112;
        *(_QWORD *)((char *)&v41 + 2) = v38;
        _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_INFO, "%{public}@Skipping processing import delete for already-deleted object: <%@: %{mask.hash}@>", buf, 0x2Au);

      }
      objc_autoreleasePoolPop(v17);
      v24 = 1;
      v25 = v37;
      goto LABEL_21;
    }
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "hmd_debugIdentifier");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)&buf[4] = v26;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v27;
      *(_WORD *)&buf[22] = 2114;
      v40 = (uint64_t)v38;
      _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_DEBUG, "%{public}@Processing import delete: <%@: %{public}@>", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v17);
    objc_msgSend(v10, "entity");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v37;
    if (v6)
    {
      v29 = (void *)objc_msgSend((id)objc_opt_class(), "importTransformableClassFromEntity:", v28);
      if (v29)
      {
        if (v38)
        {
          if (!objc_msgSend(v29, "importDeleteWithObjectID:modelID:additionalUpdates:context:", v10, v38, v37, v12))
          {
            v24 = 0;
LABEL_20:

            v21 = v38;
LABEL_21:

            goto LABEL_22;
          }
        }
        else
        {
          v30 = (void *)MEMORY[0x227676638]();
          v31 = v18;
          HMFGetOSLogHandle();
          v32 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v35 = v30;
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "hmd_debugIdentifier");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            *(_QWORD *)&buf[4] = v33;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v34;
            *(_WORD *)&buf[22] = 2112;
            v40 = (uint64_t)v11;
            _os_log_impl(&dword_2218F0000, v32, OS_LOG_TYPE_ERROR, "%{public}@Not processing import delete for object <%@> due to missing modelID in tombstone: %@", buf, 0x20u);

            v25 = v37;
            v30 = v35;
          }

          objc_autoreleasePoolPop(v30);
        }
      }
    }
    *(_QWORD *)buf = MEMORY[0x24BDAC760];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __107__HMDCoreDataCloudTransform__processImportDeleteForObjectID_tombstone_transform_additionalUpdates_context___block_invoke;
    v40 = (uint64_t)&unk_24E7844E8;
    *(_QWORD *)&v41 = v10;
    *((_QWORD *)&v41 + 1) = v11;
    v42 = v12;
    -[HMDCoreDataCloudTransform _enumerateCloudChangeListenersForEntity:usingBlock:]((uint64_t)v18, v28, buf);

    v24 = 1;
    goto LABEL_20;
  }
  v24 = 0;
  v25 = v37;
LABEL_22:

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v24;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
    *a4 = 1;
}

void __61__HMDCoreDataCloudTransform__processImportChangeSet_context___block_invoke_4(uint64_t a1, void *a2, _BYTE *a3)
{
  int v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t isKindOfClass;
  uint64_t v23;
  void *v24;
  id v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  id v32;
  void *v33;
  id v34;
  NSObject *v35;
  void *v36;
  __CFString *v37;
  __CFString *v38;
  void *v39;
  id v40;
  void *v41;
  _BYTE *v42;
  _BYTE *v43;
  _BYTE *v44;
  _BYTE buf[24];
  void *v46;
  id v47;
  id v48;
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v5 = *(unsigned __int8 *)(a1 + 64);
  v7 = *(void **)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  v8 = *(void **)(a1 + 48);
  v9 = a2;
  v10 = v6;
  v11 = v8;
  v12 = v11;
  if (v7)
  {
    objc_msgSend(v11, "objectWithID:", v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "isDeleted"))
    {
      v14 = v12;
      v15 = v10;
      v16 = (void *)MEMORY[0x227676638]();
      v17 = v7;
      HMFGetOSLogHandle();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v42 = a3;
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "hmd_debugIdentifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v19;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v20;
        _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_INFO, "%{public}@Skipping processing import insert for already-deleted object: <%@>", buf, 0x16u);

        a3 = v42;
      }

      objc_autoreleasePoolPop(v16);
      v21 = 1;
      v10 = v15;
      v12 = v14;
    }
    else
    {
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      if ((isKindOfClass & 1) != 0)
      {
        v23 = objc_msgSend(v13, "ensureCanonicalModel");
        if (v23 != 1)
        {
          v31 = v23;
          v32 = v10;
          v33 = (void *)MEMORY[0x227676638]();
          v34 = v7;
          HMFGetOSLogHandle();
          v35 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
          {
            v44 = a3;
            HMFGetLogIdentifier();
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            v41 = v33;
            if ((unint64_t)(v31 + 2) > 3)
              v37 = CFSTR("unknown");
            else
              v37 = off_24E78A978[v31 + 2];
            v38 = v37;
            objc_msgSend(v9, "hmd_debugIdentifier");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            *(_QWORD *)&buf[4] = v36;
            *(_WORD *)&buf[12] = 2114;
            *(_QWORD *)&buf[14] = v38;
            *(_WORD *)&buf[22] = 2112;
            v46 = v39;
            _os_log_impl(&dword_2218F0000, v35, OS_LOG_TYPE_INFO, "%{public}@Skipping processing import insert for non-canonical (%{public}@) model: <%@>", buf, 0x20u);

            v33 = v41;
            a3 = v44;
          }

          objc_autoreleasePoolPop(v33);
          v21 = 1;
          v10 = v32;
          goto LABEL_23;
        }
        isKindOfClass = objc_msgSend(v7, "checkForCurrentAccessoryModel:", v13);
      }
      v40 = v10;
      v24 = (void *)MEMORY[0x227676638](isKindOfClass);
      v25 = v7;
      HMFGetOSLogHandle();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "hmd_debugIdentifier");
        v43 = a3;
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v27;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v28;
        _os_log_impl(&dword_2218F0000, v26, OS_LOG_TYPE_DEBUG, "%{public}@Processing import insert: <%@>", buf, 0x16u);

        a3 = v43;
      }

      objc_autoreleasePoolPop(v24);
      objc_msgSend(v9, "entity");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v40;
      if (v5
        && (v30 = (void *)objc_msgSend((id)objc_opt_class(), "importTransformableClassFromEntity:", v29)) != 0
        && !objc_msgSend(v30, "importInsertWithObjectID:additionalUpdates:context:", v9, v40, v12))
      {
        v21 = 0;
      }
      else
      {
        *(_QWORD *)buf = MEMORY[0x24BDAC760];
        *(_QWORD *)&buf[8] = 3221225472;
        *(_QWORD *)&buf[16] = __97__HMDCoreDataCloudTransform__processImportInsertForObjectID_transform_additionalUpdates_context___block_invoke;
        v46 = &unk_24E7844C0;
        v47 = v12;
        v48 = v9;
        -[HMDCoreDataCloudTransform _enumerateCloudChangeListenersForEntity:usingBlock:]((uint64_t)v25, v29, buf);

        v21 = 1;
      }

    }
LABEL_23:

    goto LABEL_24;
  }
  v21 = 0;
LABEL_24:

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v21;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
    *a3 = 1;
}

uint64_t __61__HMDCoreDataCloudTransform__processImportChangeSet_context___block_invoke_5(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  uint64_t result;

  result = -[HMDCoreDataCloudTransform _processImportUpdateForObjectID:updatedProperties:transform:additionalUpdates:context:](*(void **)(a1 + 32), a2, a3, *(unsigned __int8 *)(a1 + 64), *(void **)(a1 + 40), *(void **)(a1 + 48));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
    *a4 = 1;
  return result;
}

void __61__HMDCoreDataCloudTransform__processImportChangeSet_context___block_invoke_183(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;

  v7 = *(void **)(a1 + 32);
  v8 = a2;
  v9 = (void *)objc_msgSend(a3, "copy");
  v10 = -[HMDCoreDataCloudTransform _processImportUpdateForObjectID:updatedProperties:transform:additionalUpdates:context:](v7, v8, v9, *(unsigned __int8 *)(a1 + 64), *(void **)(a1 + 40), *(void **)(a1 + 48));

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v10;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
    *a4 = 1;
}

- (uint64_t)_processImportUpdateForObjectID:(void *)a3 updatedProperties:(int)a4 transform:(void *)a5 additionalUpdates:(void *)a6 context:
{
  id v11;
  id v12;
  id v13;
  __CFString *v14;
  void *v15;
  uint64_t v16;
  id v17;
  NSObject *v18;
  void *v19;
  id v20;
  __CFString *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  id v27;
  NSObject *v28;
  __CFString *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v35;
  uint64_t v36;
  id v37;
  NSObject *v38;
  void *v39;
  __CFString *v40;
  __CFString *v41;
  void *v42;
  __CFString *v43;
  id v44;
  id v45;
  _QWORD v46[4];
  id v47;
  id v48;
  id v49;
  uint8_t buf[4];
  void *v51;
  __int16 v52;
  __CFString *v53;
  __int16 v54;
  void *v55;
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  v11 = a2;
  v12 = a3;
  v45 = a5;
  v13 = a6;
  if (!a1)
  {
    v24 = 0;
    goto LABEL_17;
  }
  MKFPropertyNamesFromDescriptions(v12);
  v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectWithID:", v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "isDeleted"))
  {
    v16 = MEMORY[0x227676638]();
    v17 = a1;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "hmd_debugIdentifier");
      v20 = v12;
      v21 = v14;
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v51 = v19;
      v52 = 2048;
      v53 = v21;
      v54 = 2112;
      v55 = v22;
      _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_INFO, "%{public}@Skipping processing import update [%public@] for already-deleted object: <%@>", buf, 0x20u);

      v14 = v21;
      v12 = v20;

    }
    v23 = (void *)v16;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || (v25 = objc_msgSend(v15, "ensureCanonicalModel"), v25 == 1))
    {
      v26 = (void *)MEMORY[0x227676638]();
      v27 = a1;
      HMFGetOSLogHandle();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v44 = v12;
        v29 = v14;
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "hmd_debugIdentifier");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v51 = v30;
        v52 = 2048;
        v53 = v29;
        v54 = 2112;
        v55 = v31;
        _os_log_impl(&dword_2218F0000, v28, OS_LOG_TYPE_DEBUG, "%{public}@Processing import update [%public@]: <%@>", buf, 0x20u);

        v14 = v29;
        v12 = v44;
      }

      objc_autoreleasePoolPop(v26);
      objc_msgSend(v11, "entity");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      if (a4
        && (v33 = (void *)objc_msgSend((id)objc_opt_class(), "importTransformableClassFromEntity:", v32)) != 0
        && !objc_msgSend(v33, "importUpdateWithObjectID:updatedProperties:additionalUpdates:context:", v11, v12, v45, v13))
      {
        v24 = 0;
      }
      else
      {
        v46[0] = MEMORY[0x24BDAC760];
        v46[1] = 3221225472;
        v46[2] = __115__HMDCoreDataCloudTransform__processImportUpdateForObjectID_updatedProperties_transform_additionalUpdates_context___block_invoke;
        v46[3] = &unk_24E7844E8;
        v47 = v13;
        v48 = v11;
        v49 = v12;
        -[HMDCoreDataCloudTransform _enumerateCloudChangeListenersForEntity:usingBlock:]((uint64_t)v27, v32, v46);

        v24 = 1;
      }

      goto LABEL_16;
    }
    v35 = v25;
    v36 = MEMORY[0x227676638]();
    v37 = a1;
    HMFGetOSLogHandle();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = v14;
      if ((unint64_t)(v35 + 2) > 3)
        v40 = CFSTR("unknown");
      else
        v40 = off_24E78A978[v35 + 2];
      v41 = v40;
      objc_msgSend(v11, "hmd_debugIdentifier");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v51 = v39;
      v52 = 2048;
      v53 = v41;
      v54 = 2112;
      v55 = v42;
      _os_log_impl(&dword_2218F0000, v38, OS_LOG_TYPE_INFO, "%{public}@Skipping processing import update for non-canonical (%public@) model: <%@>", buf, 0x20u);

      v14 = v43;
    }

    v23 = (void *)v36;
  }
  objc_autoreleasePoolPop(v23);
  v24 = 1;
LABEL_16:

LABEL_17:
  return v24;
}

void __115__HMDCoreDataCloudTransform__processImportUpdateForObjectID_updatedProperties_transform_additionalUpdates_context___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectWithID:", *(_QWORD *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "didInsertOrUpdateModel:changedProperties:", v3, *(_QWORD *)(a1 + 48));

  }
}

- (void)_enumerateCloudChangeListenersForEntity:(void *)a3 usingBlock:
{
  id v5;
  void (**v6)(id, void *, _BYTE *);
  void *v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  char v11;
  unint64_t v12;
  void *v13;
  char v14;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 96), "objectForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v14 = 0;
    v9 = objc_msgSend(v7, "count");
    if (v9)
    {
      v10 = v9;
      v11 = 0;
      v12 = 1;
      do
      {
        objc_msgSend(v8, "pointerAtIndex:", v12 - 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
          v6[2](v6, v13, &v14);
        else
          v11 = 1;

        if (v12 >= v10)
          break;
        ++v12;
      }
      while (!v14);
      if ((v11 & 1) != 0)
      {
        objc_msgSend(v8, "compact");
        if (!objc_msgSend(v8, "count"))
          objc_msgSend(*(id *)(a1 + 96), "removeObjectForKey:", v5);
      }
    }
  }

}

void __97__HMDCoreDataCloudTransform__processImportInsertForObjectID_transform_additionalUpdates_context___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectWithID:", *(_QWORD *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "didInsertOrUpdateModel:changedProperties:", v3, 0);

  }
}

void __107__HMDCoreDataCloudTransform__processImportDeleteForObjectID_tombstone_transform_additionalUpdates_context___block_invoke(_QWORD *a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "didDeleteModelWithID:tombstone:context:", a1[4], a1[5], a1[6]);

}

void __71__HMDCoreDataCloudTransform__changeSetsFromImportTransactions_context___block_invoke(uint64_t a1, void *a2)
{
  int v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v15 = a2;
  v3 = objc_msgSend((id)objc_opt_class(), "transactionIsCloudStoreReset:context:", v15, *(_QWORD *)(a1 + 40));
  v4 = *(void **)(a1 + 32);
  if (v3)
  {
    objc_msgSend((id)objc_opt_class(), "wipeCoreDataStorageDueToPCSIdentityLossAndRelaunchHomeKitDaemon");
  }
  else
  {
    v5 = v15;
    v6 = v5;
    if (v4)
    {
      if (!objc_msgSend(v5, "hmd_transactionAuthor"))
      {

        objc_msgSend(v6, "changes");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v16[0] = MEMORY[0x24BDAC760];
        v16[1] = 3221225472;
        v16[2] = __71__HMDCoreDataCloudTransform__changeSetsFromImportTransactions_context___block_invoke_2;
        v16[3] = &unk_24E784600;
        v14 = *(void **)(a1 + 40);
        v16[4] = *(_QWORD *)(a1 + 32);
        v17 = v14;
        v18 = *(id *)(a1 + 48);
        objc_msgSend(v13, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v16);

        goto LABEL_10;
      }
      v7 = (void *)MEMORY[0x227676638]();
      v8 = v4;
      HMFGetOSLogHandle();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v6, "transactionNumber");
        objc_msgSend(v6, "author");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v20 = v10;
        v21 = 2048;
        v22 = v11;
        v23 = 2160;
        v24 = 1752392040;
        v25 = 2112;
        v26 = v12;
        _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_DEBUG, "%{public}@Not importing transaction %lld with author %{mask.hash}@", buf, 0x2Au);

      }
      objc_autoreleasePoolPop(v7);
    }

  }
LABEL_10:

}

void __71__HMDCoreDataCloudTransform__changeSetsFromImportTransactions_context___block_invoke_2(void **a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  unint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  NSString *v13;
  Class v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  NSString *v29;
  Class v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  char isKindOfClass;
  void *v36;
  id v37;
  uint64_t v38;
  id v39;
  void *v40;
  id v41;
  NSObject *v42;
  void *v43;
  id v44;
  id v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  id v50;
  NSObject *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  int v57;
  void *v58;
  id v59;
  void *v60;
  id v61;
  NSObject *v62;
  void *v63;
  void *v64;
  id v65;
  NSObject *v66;
  void *v67;
  id v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  id v73;
  int v74;
  void *v75;
  id v76;
  void *v77;
  id v78;
  NSObject *v79;
  void *v80;
  void *v81;
  void *v82;
  id v83;
  NSObject *v84;
  void *v85;
  void *v86;
  void *v87;
  id v88;
  NSObject *v89;
  void *v90;
  void *v91;
  id v92;
  NSObject *v93;
  void *v94;
  void **v95;
  void *v96;
  void *v97;
  id v98;
  void *v99;
  void *v100;
  id v101;
  NSObject *v102;
  void *v103;
  void *v104;
  id v105;
  NSObject *v106;
  void *v107;
  uint64_t v108;
  void *v109;
  void *v110;
  void *v111;
  int v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  uint64_t v119;
  id v120;
  id v121;
  void **v122;
  void *v123;
  void *v124;
  id v125;
  NSObject *v126;
  void *v127;
  id v128;
  id v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  id v138;
  id v139;
  void *v140;
  id v141;
  void *v142;
  id v143;
  void *v144;
  id v145;
  id v146;
  void *v147;
  void **v148;
  void **v149;
  void **v150;
  int v151;
  _QWORD v152[5];
  id v153;
  id v154;
  id v155;
  _BYTE buf[22];
  __int16 v157;
  id v158;
  __int16 v159;
  id v160;
  __int16 v161;
  id v162;
  _QWORD v163[3];

  v163[1] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = a1[4];
  v5 = a1[5];
  v6 = v3;
  v7 = v5;
  if (!v4)
    goto LABEL_17;
  v8 = objc_msgSend(v6, "changeType");
  if (v8 >= 2)
  {
    if (v8 == 2)
    {
      v26 = v6;
      objc_msgSend(v26, "changedObjectID");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "entity");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "managedObjectClassName");
      v29 = (NSString *)objc_claimAutoreleasedReturnValue();
      v30 = NSClassFromString(v29);
      LOBYTE(v30) = -[objc_class isSubclassOfClass:](v30, "isSubclassOfClass:", objc_opt_class());

      if ((v30 & 1) == 0)
      {
        v49 = (void *)MEMORY[0x227676638]();
        v50 = v4;
        HMFGetOSLogHandle();
        v51 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "entity");
          v150 = a1;
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "name");
          v54 = v27;
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          *(_QWORD *)&buf[4] = v52;
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v55;
          v157 = 2114;
          v158 = v26;
          _os_log_impl(&dword_2218F0000, v51, OS_LOG_TYPE_ERROR, "%{public}@Unexpected entity type in change: %{public}@, %{public}@", buf, 0x20u);

          v27 = v54;
          a1 = v150;

        }
        objc_autoreleasePoolPop(v49);
        v39 = 0;
        goto LABEL_52;
      }
      v146 = v7;
      objc_msgSend(v26, "tombstone");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("flags"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v142 = v32;
      v144 = v31;
      if (v32)
      {
        v33 = v27;
        v34 = v32;
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();
        if ((isKindOfClass & 1) != 0)
          v36 = v34;
        else
          v36 = 0;
        v37 = v36;

        if ((isKindOfClass & 1) != 0)
        {
          *(_QWORD *)buf = 0;
          *(_QWORD *)&buf[8] = 0;
          v38 = objc_msgSend(v34, "getUUIDBytes:", buf);
          if ((buf[13] & 8) != 0)
          {
            v91 = (void *)MEMORY[0x227676638](v38);
            v92 = v4;
            HMFGetOSLogHandle();
            v93 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v93, OS_LOG_TYPE_DEBUG))
            {
              HMFGetLogIdentifier();
              v94 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v33, "hmd_debugIdentifier");
              v95 = a1;
              v96 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              *(_QWORD *)&buf[4] = v94;
              *(_WORD *)&buf[12] = 2112;
              *(_QWORD *)&buf[14] = v96;
              v157 = 2112;
              v158 = v144;
              _os_log_impl(&dword_2218F0000, v93, OS_LOG_TYPE_DEBUG, "%{public}@Ignoring import delete of fake model: %@, %@", buf, 0x20u);

              a1 = v95;
            }

            objc_autoreleasePoolPop(v91);
            -[HMDCoreDataCloudTransform fakeHomeChangeSetModelID]();
            v39 = (id)objc_claimAutoreleasedReturnValue();
            v86 = v144;
            v7 = v146;
            v27 = v33;
            goto LABEL_51;
          }
        }
        v149 = a1;

        v27 = v33;
      }
      else
      {
        v64 = (void *)MEMORY[0x227676638]();
        v65 = v4;
        HMFGetOSLogHandle();
        v66 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v67 = v31;
          v68 = v26;
          v69 = v27;
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          *(_QWORD *)&buf[4] = v70;
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v68;
          _os_log_impl(&dword_2218F0000, v66, OS_LOG_TYPE_ERROR, "%{public}@Flags missing from tombstone: %{public}@", buf, 0x16u);

          v27 = v69;
          v26 = v68;
          v31 = v67;
        }
        v149 = a1;

        objc_autoreleasePoolPop(v64);
      }
      -[HMDCoreDataCloudTransform _homeModelIDPropertyNameForObjectID:](v27);
      v34 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "objectForKeyedSubscript:", v34);
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      v72 = v71;
      if (v71)
      {
        v140 = v27;
        v73 = v71;
        objc_opt_class();
        v74 = objc_opt_isKindOfClass() & 1;
        if (v74)
          v75 = v73;
        else
          v75 = 0;
        v76 = v75;

        if (v74)
        {
          v39 = v73;
          v7 = v146;
        }
        else
        {
          v138 = v76;
          v82 = (void *)MEMORY[0x227676638]();
          v83 = v4;
          HMFGetOSLogHandle();
          v84 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v85 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544130;
            *(_QWORD *)&buf[4] = v85;
            *(_WORD *)&buf[12] = 2160;
            *(_QWORD *)&buf[14] = 1752392040;
            v157 = 2112;
            v158 = v73;
            v159 = 2114;
            v160 = v26;
            _os_log_impl(&dword_2218F0000, v84, OS_LOG_TYPE_ERROR, "%{public}@Home model ID is unexpected type in tombstone: %{mask.hash}@, %{public}@", buf, 0x2Au);

          }
          objc_autoreleasePoolPop(v82);
          v39 = 0;
          v7 = v146;
          v76 = v138;
          v27 = v140;
        }

      }
      else
      {
        v77 = (void *)MEMORY[0x227676638]();
        v78 = v4;
        HMFGetOSLogHandle();
        v79 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v80 = v27;
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          *(_QWORD *)&buf[4] = v81;
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v26;
          _os_log_impl(&dword_2218F0000, v79, OS_LOG_TYPE_ERROR, "%{public}@Home model ID missing from tombstone: %{public}@", buf, 0x16u);

          v27 = v80;
        }

        objc_autoreleasePoolPop(v77);
        v39 = 0;
        v7 = v146;
      }
      v86 = v144;

      a1 = v149;
LABEL_51:

LABEL_52:
      goto LABEL_77;
    }
LABEL_17:
    v39 = 0;
    goto LABEL_77;
  }
  v148 = a1;
  v9 = v6;
  v10 = v7;
  objc_msgSend(v9, "changedObjectID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "entity");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "managedObjectClassName");
  v13 = (NSString *)objc_claimAutoreleasedReturnValue();
  v14 = NSClassFromString(v13);
  LOBYTE(v14) = -[objc_class isSubclassOfClass:](v14, "isSubclassOfClass:", objc_opt_class());

  if ((v14 & 1) == 0)
  {
    v40 = (void *)MEMORY[0x227676638]();
    v41 = v4;
    HMFGetOSLogHandle();
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "entity");
      v147 = v11;
      v44 = v10;
      v45 = v9;
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "name");
      v47 = v7;
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)&buf[4] = v43;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v48;
      v157 = 2114;
      v158 = v45;
      _os_log_impl(&dword_2218F0000, v42, OS_LOG_TYPE_ERROR, "%{public}@Unexpected entity type in change: %{public}@, %{public}@", buf, 0x20u);

      v7 = v47;
      v9 = v45;
      v10 = v44;
      v11 = v147;

    }
    objc_autoreleasePoolPop(v40);
    v39 = 0;
    a1 = v148;
    goto LABEL_76;
  }
  v141 = v9;
  v145 = v7;
  -[HMDCoreDataCloudTransform _homeModelIDPropertyNameForObjectID:](v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v163[0] = v15;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v163, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[MKFCKModel appendDefaultPreloadedPropertiesTo:](MKFCKModel, "appendDefaultPreloadedPropertiesTo:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v155 = 0;
  v143 = v10;
  objc_msgSend(v10, "hmd_fetchExistingObjectWithID:propertiesToFetch:error:", v11, v17, &v155);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v139 = v155;
  if (v139)
  {
    v132 = v18;
    v134 = v15;
    v136 = v17;
    v19 = (void *)MEMORY[0x227676638]();
    v20 = v4;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = v139;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "hmd_debugIdentifier");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)&buf[4] = v23;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v24;
      v157 = 2114;
      v158 = v139;
      _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch object %@: %{public}@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v19);
    v25 = 0;
    v7 = v145;
    v9 = v141;
    v15 = v134;
    v17 = v136;
    v18 = v132;
    goto LABEL_75;
  }
  if (v18)
  {
    v137 = v17;
    v56 = v18;
    objc_opt_class();
    v57 = objc_opt_isKindOfClass() & 1;
    if (v57)
      v58 = v56;
    else
      v58 = 0;
    v59 = v58;

    v9 = v141;
    v133 = v18;
    v135 = v15;
    v131 = v59;
    if (v57)
    {
      if (!objc_msgSend(v56, "isFake"))
      {
        objc_msgSend(v56, "valueForKey:", v15);
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        v130 = v97;
        if (v97)
        {
          v98 = v97;
          objc_opt_class();
          LODWORD(v128) = objc_opt_isKindOfClass() & 1;
          if ((_DWORD)v128)
            v99 = v98;
          else
            v99 = 0;
          v129 = v99;

          if ((_DWORD)v128)
          {
            v25 = v98;
          }
          else
          {
            v128 = v98;
            v104 = (void *)MEMORY[0x227676638]();
            v105 = v4;
            HMFGetOSLogHandle();
            v106 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v106, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v107 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138544386;
              *(_QWORD *)&buf[4] = v107;
              *(_WORD *)&buf[12] = 2160;
              *(_QWORD *)&buf[14] = 1752392040;
              v157 = 2112;
              v158 = v128;
              v159 = 2112;
              v160 = v56;
              v161 = 2114;
              v162 = v141;
              _os_log_impl(&dword_2218F0000, v106, OS_LOG_TYPE_ERROR, "%{public}@Home model ID is unexpected type (%{mask.hash}@) in object: %@, %{public}@", buf, 0x34u);

            }
            objc_autoreleasePoolPop(v104);
            v25 = 0;
            v18 = v133;
            v15 = v135;
          }
          v22 = 0;

          v7 = v145;
          v17 = v137;
        }
        else
        {
          v100 = (void *)MEMORY[0x227676638]();
          v101 = v4;
          HMFGetOSLogHandle();
          v102 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v102, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v103 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            *(_QWORD *)&buf[4] = v103;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v56;
            v157 = 2114;
            v158 = v141;
            _os_log_impl(&dword_2218F0000, v102, OS_LOG_TYPE_ERROR, "%{public}@Home model ID is missing in object: %@, %{public}@", buf, 0x20u);

          }
          objc_autoreleasePoolPop(v100);
          v25 = 0;
          v7 = v145;
          v15 = v135;
          v17 = v137;
          v18 = v133;
          v22 = 0;
        }

        goto LABEL_74;
      }
      v60 = (void *)MEMORY[0x227676638]();
      v61 = v4;
      HMFGetOSLogHandle();
      v62 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v62, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v63;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v56;
        _os_log_impl(&dword_2218F0000, v62, OS_LOG_TYPE_DEBUG, "%{public}@Ignoring import of fake model: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v60);
      -[HMDCoreDataCloudTransform fakeHomeChangeSetModelID]();
      v25 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v87 = (void *)MEMORY[0x227676638]();
      v88 = v4;
      HMFGetOSLogHandle();
      v89 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v89, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        *(_QWORD *)&buf[4] = v90;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v56;
        v157 = 2114;
        v158 = v141;
        _os_log_impl(&dword_2218F0000, v89, OS_LOG_TYPE_ERROR, "%{public}@Unexpected type of object in change: %@, %{public}@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v87);
      v25 = 0;
    }
    v7 = v145;
    v15 = v135;
    v17 = v137;
    v18 = v133;
    v22 = 0;
LABEL_74:

    goto LABEL_75;
  }
  v25 = 0;
  v22 = 0;
  v9 = v141;
LABEL_75:

  v39 = v25;
  v10 = v143;
LABEL_76:

LABEL_77:
  -[HMDCoreDataCloudTransform _changeSetForHome:isImport:clientIdentifier:qualityOfService:cache:](a1[4], v39, 1, 0, (void *)0xFFFFFFFFFFFFFFFFLL, a1[6]);
  v108 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "changedObjectID");
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v109, "entity");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  +[MKFCKHome entity](MKFCKHome, "entity");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  v112 = objc_msgSend(v110, "isKindOfEntity:", v111);

  if (v112)
  {
    if (objc_msgSend(v6, "changeType") == 2)
    {
      if (v108)
        *(_BYTE *)(v108 + 32) = 1;
    }
    else
    {
      objc_msgSend(v6, "updatedProperties");
      v113 = (void *)objc_claimAutoreleasedReturnValue();
      v152[0] = MEMORY[0x24BDAC760];
      v152[1] = 3221225472;
      v152[2] = __71__HMDCoreDataCloudTransform__changeSetsFromImportTransactions_context___block_invoke_3;
      v152[3] = &unk_24E7845D8;
      v152[4] = a1[4];
      v153 = v39;
      v154 = a1[5];
      objc_msgSend(v113, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v152);

    }
  }
  objc_msgSend(v6, "changedObjectID", v128);
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v114, "entity");
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  +[MKFCKSharedHome entity](MKFCKSharedHome, "entity");
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v115, "isKindOfEntity:", v116) & 1) == 0)
  {

LABEL_89:
    if (!v108)
      goto LABEL_92;
    goto LABEL_90;
  }
  objc_msgSend(v6, "transaction");
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v117, "storeID");
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[5], "hmd_cloudSharedStoreIdentifier");
  v119 = v108;
  v120 = v39;
  v121 = v6;
  v122 = a1;
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  v151 = objc_msgSend(v118, "isEqualToString:", v123);

  a1 = v122;
  v6 = v121;
  v39 = v120;
  v108 = v119;

  if (!v151)
    goto LABEL_89;
  v124 = (void *)MEMORY[0x227676638]();
  v125 = a1[4];
  HMFGetOSLogHandle();
  v126 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v126, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)&buf[4] = v127;
    _os_log_impl(&dword_2218F0000, v126, OS_LOG_TYPE_INFO, "%{public}@Allowing import processing of MKFCKSharedHome that have been shared with this account", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v124);
  if (v108)
  {
    *(_BYTE *)(v108 + 32) = 1;
LABEL_90:
    if (-[HMDCoreDataCloudTransform _shouldProcessChange:homeModelID:isImport:context:]((id *)a1[4], v6, v39, 1, a1[5]))-[HMDCoreDataCloudTransformChangeSet processChange:]((id *)v108, v6);
  }
LABEL_92:

}

- (_BYTE)_changeSetForHome:(uint64_t)a3 isImport:(void *)a4 clientIdentifier:(void *)a5 qualityOfService:(void *)a6 cache:
{
  id v11;
  id v12;
  id v13;
  _BYTE *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  id v21;
  NSObject *v22;
  void *v23;
  const __CFString *v24;
  const __CFString *v25;
  void *v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  const __CFString *v31;
  __int16 v32;
  const __CFString *v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v11 = a2;
  v12 = a4;
  v13 = a6;
  if (a1 && (v11 || (a3 & 1) == 0))
  {
    v15 = (void *)*MEMORY[0x24BDBD430];
    if (v11)
      v15 = v11;
    v16 = v15;
    objc_msgSend(v13, "objectForKeyedSubscript:", v16);
    v14 = (_BYTE *)objc_claimAutoreleasedReturnValue();
    if (v14)
      goto LABEL_22;
    v14 = -[HMDCoreDataCloudTransformChangeSet initWithHomeModelID:clientIdentifier:qualityOfService:]((id *)[HMDCoreDataCloudTransformChangeSet alloc], v11, v12, a5);
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v14, v16);
    if (v11)
    {
      objc_msgSend(a1, "delegate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v17;
      if (!v17)
        v17 = a1;
      v19 = objc_msgSend(v17, "cloudTransform:isPermittedForHomeWithModelID:isImport:", a1, v11, a3);

      v20 = (void *)MEMORY[0x227676638]();
      v21 = a1;
      HMFGetOSLogHandle();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v27 = v20;
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = CFSTR("denied");
        *(_DWORD *)buf = 138544386;
        v29 = v23;
        if (v19)
          v24 = CFSTR("allowed");
        v31 = v24;
        v25 = CFSTR("import");
        v30 = 2114;
        v32 = 2114;
        if (!(_DWORD)a3)
          v25 = CFSTR("export");
        v33 = v25;
        v34 = 2160;
        v35 = 1752392040;
        v36 = 2112;
        v37 = v11;
        _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_DEBUG, "%{public}@Delegate has %{public}@ %{public}@ transform for home %{mask.hash}@", buf, 0x34u);

        v20 = v27;
      }

      objc_autoreleasePoolPop(v20);
      if (!v14)
        goto LABEL_22;
    }
    else
    {
      if (!v14)
      {
LABEL_22:

        goto LABEL_23;
      }
      LOBYTE(v19) = 1;
    }
    v14[32] = v19;
    goto LABEL_22;
  }
  v14 = 0;
LABEL_23:

  return v14;
}

void __71__HMDCoreDataCloudTransform__changeSetsFromImportTransactions_context___block_invoke_3(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  void *v6;
  int v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  int v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  objc_msgSend(v5, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("homeManagerApplicationData"));

  if (v7)
  {
    v8 = (void *)MEMORY[0x227676638]();
    v9 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = *(_QWORD *)(a1 + 40);
      v13 = 138543874;
      v14 = v11;
      v15 = 2160;
      v16 = 1752392040;
      v17 = 2112;
      v18 = v12;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Detected home manager application data change on home %{mask.hash}@", (uint8_t *)&v13, 0x20u);

    }
    objc_autoreleasePoolPop(v8);
    objc_msgSend(*(id *)(a1 + 48), "setHmd_homeManagerApplicationDataChanged:", 1);
    *a3 = 1;
  }

}

- (uint64_t)_shouldProcessChange:(void *)a3 homeModelID:(int)a4 isImport:(void *)a5 context:
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  id v26;
  int v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id *v35;
  NSObject *v36;
  id *v37;
  id v38;
  void *v39;
  id *v40;
  NSObject *v41;
  void *v42;
  void *context;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  id v50;
  void *v51;
  id *v52;
  void *v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  char v57;
  uint8_t buf[4];
  id v59;
  __int16 v60;
  void *v61;
  __int16 v62;
  void *v63;
  _BYTE v64[24];
  const __CFString *v65;
  __int128 v66;
  uint64_t *v67;
  uint64_t v68;

  v68 = *MEMORY[0x24BDAC8D0];
  v9 = a2;
  v10 = a3;
  v11 = a5;
  if (!a1)
  {
    v16 = 0;
    goto LABEL_28;
  }
  objc_msgSend(v9, "changedObjectID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "entity");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!a4)
  {
LABEL_6:
    +[MKFCKSharedHome entity](MKFCKSharedHome, "entity");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v13, "isKindOfEntity:", v19) & 1) != 0)
    {
      objc_msgSend(v9, "transaction");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "storeID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "hmd_cloudPrivateStoreIdentifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = a1;
      v23 = v9;
      v24 = v13;
      v25 = v10;
      v26 = v11;
      v27 = objc_msgSend(v21, "isEqualToString:", v22);

      v16 = v27 ^ 1u;
      if ((v27 & 1) != 0)
      {
        v11 = v26;
        v10 = v25;
        v13 = v24;
        v9 = v23;
        goto LABEL_27;
      }
      v11 = v26;
      v10 = v25;
      v13 = v24;
      v9 = v23;
      a1 = v52;
      if ((a4 & 1) != 0)
        goto LABEL_27;
LABEL_12:
      v28 = v9;
      v49 = v10;
      v50 = v11;
      v51 = v28;
      objc_msgSend(v28, "changedObjectID");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "entity");
      v53 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v53, "userInfo");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("cloudSyncInclude"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v31;
      if (v31 && (objc_msgSend(v31, "BOOLValue") & 1) == 0)
      {
        v48 = (void *)MEMORY[0x227676638]();
        v40 = a1;
        HMFGetOSLogHandle();
        v41 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
        {
          HMFGetLogIdentifier();
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "name");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v64 = 138544130;
          *(_QWORD *)&v64[4] = v46;
          *(_WORD *)&v64[12] = 2112;
          *(_QWORD *)&v64[14] = v42;
          *(_WORD *)&v64[22] = 2112;
          v65 = CFSTR("cloudSyncInclude");
          LOWORD(v66) = 2112;
          *(_QWORD *)((char *)&v66 + 2) = v32;
          _os_log_impl(&dword_2218F0000, v41, OS_LOG_TYPE_DEBUG, "%{public}@Ignoring update to %@ as it is marked with '%@' = '%@'", v64, 0x2Au);

        }
        objc_autoreleasePoolPop(v48);
        v16 = 0;
      }
      else
      {
        objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("cloudSyncEntity"));
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        if (v33 && objc_msgSend(v51, "changeType") == 1)
        {
          v47 = v11;
          v54 = 0;
          v55 = &v54;
          v56 = 0x2020000000;
          v57 = 0;
          objc_msgSend(v51, "updatedProperties");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          *(_QWORD *)v64 = MEMORY[0x24BDAC760];
          *(_QWORD *)&v64[8] = 3221225472;
          *(_QWORD *)&v64[16] = __76__HMDCoreDataCloudTransform__shouldProcessExportChange_homeModelID_context___block_invoke;
          v65 = (const __CFString *)&unk_24E7843A8;
          *(_QWORD *)&v66 = a1;
          v45 = v53;
          *((_QWORD *)&v66 + 1) = v45;
          v67 = &v54;
          objc_msgSend(v34, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v64);

          v16 = *((_BYTE *)v55 + 24) != 0;
          if (!*((_BYTE *)v55 + 24))
          {
            context = (void *)MEMORY[0x227676638]();
            v35 = a1;
            HMFGetOSLogHandle();
            v36 = (id)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
            {
              v37 = v35;
              HMFGetLogIdentifier();
              v38 = (id)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v45, "name");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v59 = v38;
              v60 = 2112;
              v61 = v39;
              v62 = 2112;
              v63 = v51;
              _os_log_impl(&dword_2218F0000, v36, OS_LOG_TYPE_DEBUG, "%{public}@No relevant updates to %@, skipping change: %@", buf, 0x20u);

              v35 = v37;
            }

            objc_autoreleasePoolPop(context);
          }

          v11 = v47;
          _Block_object_dispose(&v54, 8);
        }
        else
        {
          v16 = 1;
        }
      }

      goto LABEL_27;
    }

    if ((a4 & 1) == 0)
      goto LABEL_12;
LABEL_11:
    v16 = 1;
    goto LABEL_27;
  }
  -[HMDCoreDataCloudTransform fakeHomeChangeSetModelID]();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v10, "isEqual:", v14);

  if ((v15 & 1) == 0)
  {
    objc_msgSend(a1[12], "objectForKey:", v13);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "count");

    if (v18)
      goto LABEL_11;
    goto LABEL_6;
  }
  v16 = 0;
LABEL_27:

LABEL_28:
  return v16;
}

- (id)fakeHomeChangeSetModelID
{
  if (fakeHomeChangeSetModelID__hmf_once_t13 != -1)
    dispatch_once(&fakeHomeChangeSetModelID__hmf_once_t13, &__block_literal_global_100_110083);
  return (id)fakeHomeChangeSetModelID__hmf_once_v14;
}

void __76__HMDCoreDataCloudTransform__shouldProcessExportChange_homeModelID_context___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  int v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  char isKindOfClass;
  int v28;
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  const __CFString *v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cloudSyncInclude"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5 || (objc_msgSend(v5, "BOOLValue") & 1) != 0)
  {
    v7 = v3;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v7;
    else
      v8 = 0;
    v9 = v8;

    if (v9)
    {
      if ((objc_msgSend(v6, "BOOLValue") & 1) == 0)
      {
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cloudSyncCustomCopy"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "BOOLValue");

        if (!v11)
        {
          objc_msgSend(v9, "name");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("writerTimestamp"));

          if ((v13 & 1) == 0)
          {
            v14 = (void *)MEMORY[0x227676638]();
            v15 = *(id *)(a1 + 32);
            HMFGetOSLogHandle();
            v16 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
            {
              HMFGetLogIdentifier();
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(*(id *)(a1 + 40), "name");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v7, "name");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              v28 = 138543874;
              v29 = v17;
              v30 = 2112;
              v31 = v18;
              v32 = 2112;
              v33 = v19;
              _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_DEBUG, "%{public}@Ignoring update to %@.%@ as it is not included in cloud sync", (uint8_t *)&v28, 0x20u);

            }
            objc_autoreleasePoolPop(v14);
          }
          goto LABEL_19;
        }
      }
    }
    else
    {
      v26 = v7;
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if (!v26 || (isKindOfClass & 1) == 0)
        goto LABEL_19;
    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
LABEL_19:

    goto LABEL_20;
  }
  v20 = (void *)MEMORY[0x227676638]();
  v21 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "name");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "name");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 138544386;
    v29 = v23;
    v30 = 2112;
    v31 = v24;
    v32 = 2112;
    v33 = v25;
    v34 = 2112;
    v35 = CFSTR("cloudSyncInclude");
    v36 = 2112;
    v37 = v6;
    _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_DEBUG, "%{public}@Ignoring update to %@.%@ as it is marked with '%@' = '%@'", (uint8_t *)&v28, 0x34u);

  }
  objc_autoreleasePoolPop(v20);
LABEL_20:

}

void __53__HMDCoreDataCloudTransform_fakeHomeChangeSetModelID__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", CFSTR("FA40BC4C-1D19-499A-BE28-6CE8F1A9EF66"));
  v1 = (void *)fakeHomeChangeSetModelID__hmf_once_v14;
  fakeHomeChangeSetModelID__hmf_once_v14 = v0;

}

- (const)_homeModelIDPropertyNameForObjectID:(void *)a1
{
  void *v1;
  void *v2;
  char v3;
  const __CFString *v4;
  void *v5;
  int v6;

  objc_msgSend(a1, "entity");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  +[MKFCKHome entity](MKFCKHome, "entity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v1, "isKindOfEntity:", v2);

  v4 = CFSTR("modelID");
  if ((v3 & 1) == 0)
  {
    +[MKFCKSharedHome entity](MKFCKSharedHome, "entity");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v1, "isKindOfEntity:", v5);

    if (!v6)
      v4 = CFSTR("homeModelID");
  }

  return v4;
}

void __71__HMDCoreDataCloudTransform__changeSetsFromExportTransactions_context___block_invoke(id *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  _BYTE *v22;
  void *v23;
  id v24;
  NSObject *v25;
  void *v26;
  void *v27;
  _BYTE *v28;
  id v29;
  void *v30;
  id v31;
  NSObject *v32;
  void *v33;
  _QWORD v34[5];
  id v35;
  id v36;
  id v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  uint64_t v41;
  __int16 v42;
  uint64_t v43;
  __int16 v44;
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = a1[4];
  v5 = v3;
  v6 = v5;
  v7 = v5;
  if (!v4)
    goto LABEL_11;
  objc_msgSend(v5, "contextName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v10 = (void *)MEMORY[0x227676638]();
    v16 = v4;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v39 = v13;
      v40 = 2112;
      v41 = (uint64_t)v6;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_ERROR, "%{public}@Can't process transaction with no context name: %@", buf, 0x16u);
      goto LABEL_9;
    }
LABEL_10:

    objc_autoreleasePoolPop(v10);
    v7 = v6;
    goto LABEL_11;
  }
  v9 = objc_msgSend(v6, "hmd_transactionAuthor");
  if (v9 <= 0xB && ((1 << v9) & 0xB30) != 0)
  {
    v10 = (void *)MEMORY[0x227676638]();
    v11 = v4;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v6, "transactionNumber");
      objc_msgSend(v6, "author");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v39 = v13;
      v40 = 2048;
      v41 = v14;
      v42 = 2114;
      v43 = (uint64_t)v15;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@Not exporting transaction %lld with author %{public}@", buf, 0x20u);

LABEL_9:
      goto LABEL_10;
    }
    goto LABEL_10;
  }

  objc_msgSend(v6, "contextName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "isEqualToString:", CFSTR("HomeManager")) & 1) != 0)
  {
    v17 = 0;
    goto LABEL_15;
  }
  HMDHomeUUIDFromWorkingContextName(v7);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
LABEL_15:
    objc_msgSend(v6, "author");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDCoreDataContextTransactionAuthor contextAuthorWithString:](HMDCoreDataContextTransactionAuthor, "contextAuthorWithString:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = a1[4];
    objc_msgSend(v19, "clientIdentifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCoreDataCloudTransform _changeSetForHome:isImport:clientIdentifier:qualityOfService:cache:](v20, v17, 0, v21, (void *)objc_msgSend(v19, "qualityOfService"), a1[5]);
    v22 = (_BYTE *)objc_claimAutoreleasedReturnValue();

    if (!v22 || !v22[32])
    {
      v23 = (void *)MEMORY[0x227676638]();
      v24 = a1[4];
      HMFGetOSLogHandle();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v39 = v26;
        v40 = 2160;
        v41 = 1752392040;
        v42 = 2112;
        v43 = (uint64_t)v17;
        _os_log_impl(&dword_2218F0000, v25, OS_LOG_TYPE_INFO, "%{public}@Delegate has denied transform for home %{mask.hash}@ but allowing transform because the transaction is a force update", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v23);
      if (v22)
        v22[32] = 1;
    }
    objc_msgSend(v6, "changes");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = MEMORY[0x24BDAC760];
    v34[1] = 3221225472;
    v34[2] = __71__HMDCoreDataCloudTransform__changeSetsFromExportTransactions_context___block_invoke_196;
    v34[3] = &unk_24E7845B0;
    v34[4] = a1[4];
    v35 = v17;
    v36 = a1[6];
    v37 = v22;
    v28 = v22;
    v29 = v17;
    objc_msgSend(v27, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v34);

    goto LABEL_11;
  }
  v30 = (void *)MEMORY[0x227676638]();
  v31 = a1[4];
  HMFGetOSLogHandle();
  v32 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v39 = v33;
    v40 = 2048;
    v41 = objc_msgSend(v6, "transactionNumber");
    v42 = 2160;
    v43 = 1752392040;
    v44 = 2112;
    v45 = v7;
    _os_log_impl(&dword_2218F0000, v32, OS_LOG_TYPE_ERROR, "%{public}@Refusing to process export transaction %lld with context name %{mask.hash}@", buf, 0x2Au);

  }
  objc_autoreleasePoolPop(v30);
LABEL_11:

}

void __71__HMDCoreDataCloudTransform__changeSetsFromExportTransactions_context___block_invoke_196(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (-[HMDCoreDataCloudTransform _shouldProcessChange:homeModelID:isImport:context:](*(id **)(a1 + 32), v3, *(void **)(a1 + 40), 0, *(void **)(a1 + 48)))-[HMDCoreDataCloudTransformChangeSet processChange:](*(id **)(a1 + 56), v3);

}

void __83__HMDCoreDataCloudTransform__performCompleteMergeImportForHomeWithModelID_context___block_invoke(_QWORD *a1, void *a2, void *a3, _BYTE *a4)
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v12 = a2;
  v8 = a3;
  objc_msgSend(v8, "hmf_UUIDForKey:", CFSTR("modelID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "isEqual:", a1[4]))
  {
    *a4 = 1;
    objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), a2);
    objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), a3);
    objc_msgSend(v8, "hmf_UUIDForKey:", CFSTR("flags"), v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      v13 = 0;
      v14 = 0;
      objc_msgSend(v10, "getUUIDBytes:", &v13);
      if ((v14 & 0x80000000000) != 0)
        *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = 1;
    }

  }
}

void __50__HMDCoreDataCloudTransform__managedObjectContext__block_invoke(uint64_t a1)
{
  void *v2;
  objc_class *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _BOOL8 v12;

  v2 = (void *)MEMORY[0x227676638]();
  objc_opt_class();
  v3 = (objc_class *)objc_opt_self();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setName:", v4);

  objc_msgSend(*(id *)(a1 + 48), "cloudPrivateStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setHmd_cloudPrivateStoreIdentifier:", v6);

  objc_msgSend(*(id *)(a1 + 48), "cloudSharedStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setHmd_cloudSharedStoreIdentifier:", v8);

  objc_msgSend(*(id *)(a1 + 48), "workingStore");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setHmd_workingStoreIdentifier:", v10);

  v11 = *(_QWORD *)(a1 + 40);
  if (v11)
    v12 = *(unsigned __int8 *)(v11 + 40) != 0;
  else
    v12 = 0;
  objc_msgSend(*(id *)(a1 + 32), "setHmd_fakeRecordsEnabled:", v12);
  objc_autoreleasePoolPop(v2);
}

void __69__HMDCoreDataCloudTransform_registerCloudChangeListener_forEntities___block_invoke(uint64_t a1, void *a2)
{
  _QWORD v3[4];
  id v4;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __69__HMDCoreDataCloudTransform_registerCloudChangeListener_forEntities___block_invoke_2;
  v3[3] = &unk_24E7841C0;
  v4 = *(id *)(a1 + 32);
  objc_msgSend(a2, "hmd_recursivelyEnumerateSubentitiesUsingBlock:", v3);

}

void __69__HMDCoreDataCloudTransform_registerCloudChangeListener_forEntities___block_invoke_3(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, void *);
  void *v23;
  uint64_t v24;
  id v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "valueForKeyPath:", CFSTR("name"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v27 = v5;
    v28 = 2112;
    v29 = v6;
    v30 = 2114;
    v31 = v7;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_DEBUG, "%{public}@Adding listener %@ for entity types %{public}@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v2);
  v8 = *(void **)(a1 + 56);
  v20 = MEMORY[0x24BDAC760];
  v21 = 3221225472;
  v22 = __69__HMDCoreDataCloudTransform_registerCloudChangeListener_forEntities___block_invoke_95;
  v23 = &unk_24E784210;
  v9 = *(void **)(a1 + 40);
  v24 = *(_QWORD *)(a1 + 32);
  v25 = v9;
  objc_msgSend(v8, "hmf_enumerateWithAutoreleasePoolUsingBlock:", &v20);
  v10 = objc_opt_respondsToSelector();
  if ((v10 & 1) != 0)
  {
    v15 = (void *)MEMORY[0x227676638](v10, v11, v12, v13, v14);
    v16 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v27 = v18;
      v28 = 2112;
      v29 = v19;
      _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_DEBUG, "%{public}@Starting listener %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v15);
    objc_msgSend(*(id *)(a1 + 40), "willStartListeningWithContext:", *(_QWORD *)(a1 + 64), v20, v21, v22, v23, v24);
  }

}

void __69__HMDCoreDataCloudTransform_registerCloudChangeListener_forEntities___block_invoke_95(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    v5 = *(void **)(v4 + 96);
  else
    v5 = 0;
  v9 = v3;
  objc_msgSend(v5, "objectForKey:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDD1748], "weakObjectsPointerArray");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 32);
    if (v7)
      v8 = *(void **)(v7 + 96);
    else
      v8 = 0;
    objc_msgSend(v8, "setObject:forKey:", v6, v9);
  }
  objc_msgSend(v6, "hmf_addObject:", *(_QWORD *)(a1 + 40));

}

void __69__HMDCoreDataCloudTransform_registerCloudChangeListener_forEntities___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_msgSend(v3, "isAbstract") & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

void __51__HMDCoreDataCloudTransform_runTransformWithError___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCoreDataCloudTransform _runTransformWhilePerformingBlockOnContext:storeIdentifiers:completeMergeHomeModelID:](v2, v3, 0, 0);

  v4 = *(void **)(a1 + 32);
  objc_msgSend(v4, "managedObjectContext");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[HMDCoreDataCloudTransform _delayContextDestruction:]((uint64_t)v4, v5);

}

+ (HMDCoreDataCloudTransform)new
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

+ (HMDCoreDataCloudTransform)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __43__HMDCoreDataCloudTransform_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance__hmf_once_t0_110208 != -1)
    dispatch_once(&sharedInstance__hmf_once_t0_110208, block);
  return (HMDCoreDataCloudTransform *)(id)sharedInstance__hmf_once_v1_110209;
}

+ (Class)importTransformableClassFromEntity:(id)a3
{
  NSString *v3;
  Class v4;
  Class v5;
  objc_class *v6;

  objc_msgSend(a3, "managedObjectClassName");
  v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  v4 = NSClassFromString(v3);
  if (importTransformableClassFromEntity___hmf_once_t2 != -1)
    dispatch_once(&importTransformableClassFromEntity___hmf_once_t2, &__block_literal_global_110206);
  if (objc_msgSend((id)importTransformableClassFromEntity___hmf_once_v3, "classConforms:", v4))
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  return v6;
}

+ (id)exportTransformableEntityFromEntity:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  objc_msgSend(v3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cloudSyncEntity"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v3, "managedObjectModel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "entitiesByName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (Class)exportTransformableClassFromEntity:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSString *v7;
  void *v8;
  void *v9;

  v4 = a3;
  objc_msgSend(a1, "exportTransformableEntityFromEntity:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "managedObjectClassName");
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v4, "userInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("cloudSyncClass"));
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      v9 = 0;
      goto LABEL_5;
    }
  }
  NSClassFromString(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_5:
  return (Class)v9;
}

+ (id)localTransformableEntityFromEntity:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  _QWORD v20[4];
  id v21;
  uint64_t *v22;
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v4 = a3;
  objc_msgSend(v4, "managedObjectModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (localTransformableEntityFromEntity___hmf_once_t4 != -1)
    dispatch_once(&localTransformableEntityFromEntity___hmf_once_t4, &__block_literal_global_82_110203);
  v6 = (id)localTransformableEntityFromEntity___hmf_once_v5;
  objc_msgSend(v4, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v7);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = (id)*MEMORY[0x24BDBD430];
  }
  else
  {
    v24 = 0;
    v25 = &v24;
    v26 = 0x3032000000;
    v27 = __Block_byref_object_copy__109940;
    v28 = __Block_byref_object_dispose__109941;
    v29 = 0;
    objc_msgSend(v5, "entities");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __64__HMDCoreDataCloudTransform_localTransformableEntityFromEntity___block_invoke_84;
    v20[3] = &unk_24E784198;
    v23 = a1;
    v11 = v4;
    v21 = v11;
    v22 = &v24;
    objc_msgSend(v10, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v20);

    v12 = (void *)v25[5];
    v9 = (id)*MEMORY[0x24BDBD430];
    if (!v12)
      v12 = (void *)*MEMORY[0x24BDBD430];
    v8 = v12;
    objc_msgSend(v11, "name");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", v8, v13);

    _Block_object_dispose(&v24, 8);
  }
  if (v9 == v8)
  {
    v18 = 0;
  }
  else
  {
    v14 = v8;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v15 = v14;
    else
      v15 = 0;
    v16 = v15;

    objc_msgSend(v5, "entitiesByName");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKeyedSubscript:", v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v18;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t15_110199 != -1)
    dispatch_once(&logCategory__hmf_once_t15_110199, &__block_literal_global_104);
  return (id)logCategory__hmf_once_v16_110200;
}

+ (void)wipeCoreDataStorageDueToPCSIdentityLossAndRelaunchHomeKitDaemon
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDB4398], "defaultStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "aa_primaryAppleAccount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x227676638]();
  v6 = a1;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v8)
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543362;
      v13 = v9;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@PCS identities lost: Will be removing working, cloud, shared cloud, and client stores", (uint8_t *)&v12, 0xCu);

    }
    objc_autoreleasePoolPop(v5);
    +[HMDResetConfigPostCleanup writePostCleanupRecordWithReason:steps:](HMDResetConfigPostCleanup, "writePostCleanupRecordWithReason:steps:", 6, 278);
    +[HMDMainDriver driver](HMDMainDriver, "driver");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "relaunch");

  }
  else
  {
    if (v8)
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543362;
      v13 = v11;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@PCS identities lost: Not going to remove the CD stores as user is in the process of signing out.", (uint8_t *)&v12, 0xCu);

    }
    objc_autoreleasePoolPop(v5);
    +[HMDResetConfigPostCleanup writePostCleanupRecordWithReason:steps:](HMDResetConfigPostCleanup, "writePostCleanupRecordWithReason:steps:", 2, -1);
  }
}

+ (BOOL)transactionIsCloudStoreReset:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  int v26;
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "author");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("NSCloudKitMirroringDelegate.reset"));

  if (v9)
  {
    objc_msgSend(v6, "storeID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "hmd_coreData");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "cloudSharedStore");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v10, "isEqualToString:", v13);

    if (v14)
    {
      v15 = (void *)MEMORY[0x227676638]();
      v16 = a1;
      HMFGetOSLogHandle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", objc_msgSend(v6, "transactionNumber"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = 138543618;
        v27 = v18;
        v28 = 2112;
        v29 = v19;
        _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_INFO, "%{public}@Not processing reset on shared store : %@", (uint8_t *)&v26, 0x16u);

      }
      v20 = 0;
    }
    else
    {
      objc_msgSend(v6, "changes");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v21, "na_any:", &__block_literal_global_165);

      v15 = (void *)MEMORY[0x227676638]();
      v22 = a1;
      HMFGetOSLogHandle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        HMFBooleanToString();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = 138543874;
        v27 = v23;
        v28 = 2112;
        v29 = v24;
        v30 = 2114;
        v31 = v6;
        _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@Reset detected : %@, Transaction: %{public}@", (uint8_t *)&v26, 0x20u);

      }
    }

    objc_autoreleasePoolPop(v15);
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

BOOL __66__HMDCoreDataCloudTransform_transactionIsCloudStoreReset_context___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  _BOOL8 v6;

  v2 = a2;
  objc_msgSend(v2, "changedObjectID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "entity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[MKFCKHome entity](MKFCKHome, "entity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isKindOfEntity:", v5))
    v6 = objc_msgSend(v2, "changeType") == 2;
  else
    v6 = 0;

  return v6;
}

void __40__HMDCoreDataCloudTransform_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v16_110200;
  logCategory__hmf_once_v16_110200 = v0;

}

void __64__HMDCoreDataCloudTransform_localTransformableEntityFromEntity___block_invoke_84(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  NSString *v6;
  Class v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;

  v16 = a2;
  objc_msgSend(v16, "managedObjectClassName");
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  v7 = NSClassFromString(v6);
  LODWORD(v7) = -[objc_class isSubclassOfClass:](v7, "isSubclassOfClass:", objc_opt_class());

  v8 = v16;
  if ((_DWORD)v7)
  {
    objc_msgSend(*(id *)(a1 + 48), "exportTransformableEntityFromEntity:", v16);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "name");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (v12)
    {
      objc_msgSend(v16, "name");
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v15 = *(void **)(v14 + 40);
      *(_QWORD *)(v14 + 40) = v13;

      *a4 = 1;
    }

    v8 = v16;
  }

}

void __64__HMDCoreDataCloudTransform_localTransformableEntityFromEntity___block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)localTransformableEntityFromEntity___hmf_once_v5;
  localTransformableEntityFromEntity___hmf_once_v5 = v0;

}

void __64__HMDCoreDataCloudTransform_importTransformableClassFromEntity___block_invoke()
{
  HMCConformanceCache *v0;
  void *v1;

  v0 = -[HMCConformanceCache initWithProtocol:]([HMCConformanceCache alloc], "initWithProtocol:", &unk_2557A6FE8);
  v1 = (void *)importTransformableClassFromEntity___hmf_once_v3;
  importTransformableClassFromEntity___hmf_once_v3 = (uint64_t)v0;

}

void __43__HMDCoreDataCloudTransform_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v1 = objc_alloc(*(Class *)(a1 + 32));
  +[HMDCoreData sharedInstance](HMDCoreData, "sharedInstance");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  +[HMDMetricsManager sharedLogEventSubmitter](HMDMetricsManager, "sharedLogEventSubmitter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v1, "initWithCoreData:logEventSubmitter:", v5, v2);
  v4 = (void *)sharedInstance__hmf_once_v1_110209;
  sharedInstance__hmf_once_v1_110209 = v3;

}

- (BOOL)firstCloudKitImportComplete
{
  void *v3;
  id v4;
  char v5;
  _QWORD v7[5];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  -[HMDCoreDataCloudTransform managedObjectContext](self, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __65__HMDCoreDataCloudTransform_Voucher__firstCloudKitImportComplete__block_invoke;
  v7[3] = &unk_24E79C0A8;
  v7[4] = self;
  v4 = v3;
  v8 = v4;
  v9 = &v10;
  objc_msgSend(v4, "performBlockAndWait:", v7);
  v5 = *((_BYTE *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return v5;
}

void __65__HMDCoreDataCloudTransform_Voucher__firstCloudKitImportComplete__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  const char *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  NSObject *v23;
  _BOOL4 v24;
  void *v25;
  void *v26;
  id v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  id v31;
  void *v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v29 = v5;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_DEBUG, "%{public}@Fetching cloud sync metadata", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  +[MKFCloudSyncMetadata fetchRequest](MKFCloudSyncMetadata, "fetchRequest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = CFSTR("historyTokenForCloudStore");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v33, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPropertiesToFetch:", v7);

  objc_msgSend(*(id *)(a1 + 32), "coreData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "workingStore");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v32, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAffectedStores:", v10);

  v11 = *(void **)(a1 + 40);
  v27 = 0;
  objc_msgSend(v11, "executeFetchRequest:error:", v6, &v27);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v27;
  if (v12)
  {
    if ((unint64_t)objc_msgSend(v12, "count") < 2)
      goto LABEL_11;
    v14 = (void *)MEMORY[0x227676638]();
    v15 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v29 = v17;
      v30 = 2114;
      v31 = v12;
      v18 = "%{public}@Fetched too many cloud sync metadata objects: %{public}@";
LABEL_9:
      _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_ERROR, v18, buf, 0x16u);

    }
  }
  else
  {
    v14 = (void *)MEMORY[0x227676638]();
    v15 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v29 = v17;
      v30 = 2114;
      v31 = v13;
      v18 = "%{public}@Failed to fetch cloud sync metadata: %{public}@";
      goto LABEL_9;
    }
  }

  objc_autoreleasePoolPop(v14);
LABEL_11:
  objc_msgSend(v12, "firstObject");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "historyTokenForCloudStore");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = (void *)MEMORY[0x227676638]();
  v22 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v23 = objc_claimAutoreleasedReturnValue();
  v24 = os_log_type_enabled(v23, OS_LOG_TYPE_INFO);
  if (v20)
  {
    if (v24)
    {
      HMFGetLogIdentifier();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v29 = v25;
      _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_INFO, "%{public}@Cloud sync has previous history token", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v21);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }
  else
  {
    if (v24)
    {
      HMFGetLogIdentifier();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v29 = v26;
      _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_INFO, "%{public}@No previous cloud sync token. First CloudKit import not complete.", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v21);
  }

}

+ (id)userInitiatedCKOperationConfiguration
{
  dispatch_block_t v2;
  id v3;

  v2 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INITIATED, 0, &__block_literal_global_170212);
  if (userInitiatedCKOperationConfiguration_onceToken != -1)
    dispatch_once(&userInitiatedCKOperationConfiguration_onceToken, v2);
  v3 = (id)userInitiatedCKOperationConfiguration_configuration;

  return v3;
}

+ (id)userInitiatedVoucherWithLabel:(id)a3 forEventsOfType:(int64_t)a4 affectingObjectsMatching:(id)a5
{
  objc_class *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;

  v8 = (objc_class *)MEMORY[0x24BDBB6E0];
  v9 = a5;
  v10 = a3;
  v11 = [v8 alloc];
  objc_msgSend(a1, "userInitiatedCKOperationConfiguration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v11, "initWithLabel:forEventsOfType:withConfiguration:affectingObjectsMatching:", v10, a4, v12, v9);

  return v13;
}

uint64_t __75__HMDCoreDataCloudTransform_Voucher__userInitiatedCKOperationConfiguration__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDB9188]);
  v1 = (void *)userInitiatedCKOperationConfiguration_configuration;
  userInitiatedCKOperationConfiguration_configuration = (uint64_t)v0;

  return objc_msgSend((id)userInitiatedCKOperationConfiguration_configuration, "setQualityOfService:", 25);
}

@end
