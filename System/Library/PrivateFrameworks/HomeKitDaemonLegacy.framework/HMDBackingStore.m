@implementation HMDBackingStore

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[HMDBackingStore uuid](self, "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (id)transaction:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  HMDBackingStoreTransactionBlock *v8;

  v6 = a4;
  v7 = a3;
  v8 = -[HMDBackingStoreTransactionBlock initWithBackingStore:options:label:]([HMDBackingStoreTransactionBlock alloc], "initWithBackingStore:options:label:", self, v6, v7);

  return v8;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t36_157013 != -1)
    dispatch_once(&logCategory__hmf_once_t36_157013, &__block_literal_global_93_157014);
  return (id)logCategory__hmf_once_v37_157015;
}

- (void)commit:(id)a3 run:(BOOL)a4 save:(BOOL)a5 completionHandler:(id)a6
{
  -[HMDBackingStore commit:run:save:archiveInline:completionHandler:](self, "commit:run:save:archiveInline:completionHandler:", a3, a4, a5, 0, a6);
}

- (void)commit:(id)a3 run:(BOOL)a4 save:(BOOL)a5 archiveInline:(BOOL)a6 completionHandler:(id)a7
{
  _BOOL4 v9;
  id v12;
  void *v13;
  HMDBackingStore *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  HMDBackingStore *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void (**v25)(void *, void *);
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  HMDBackingStore *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id aBlock;
  _QWORD v39[4];
  id v40;
  id v41;
  id v42;
  id v43;
  BOOL v44;
  BOOL v45;
  BOOL v46;
  id location;
  uint8_t buf[4];
  void *v49;
  __int16 v50;
  void *v51;
  __int16 v52;
  void *v53;
  uint64_t v54;

  v9 = a5;
  v54 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  aBlock = a7;
  if (objc_msgSend(v12, "committed"))
  {
    v13 = (void *)MEMORY[0x1D17BA0A0]();
    v14 = self;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "options");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v49 = v16;
      v50 = 2112;
      v51 = v17;
      _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_ERROR, "%{public}@double-committing a transaction probably indicates a bad state (ignoring this commit) for %@.", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v13);
  }
  else
  {
    objc_msgSend(v12, "setCommitted:", 1);
    objc_msgSend(v12, "objects");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "hmf_isEmpty");

    if (v19)
    {
      v20 = (void *)MEMORY[0x1D17BA0A0]();
      v21 = self;
      HMFGetOSLogHandle();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "options");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v49 = v23;
        v50 = 2112;
        v51 = v24;
        _os_log_impl(&dword_1CD062000, v22, OS_LOG_TYPE_ERROR, "%{public}@Rejecting empty transaction: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v20);
      v25 = (void (**)(void *, void *))_Block_copy(aBlock);
      if (v25)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v25[2](v25, v26);

      }
    }
    else
    {
      -[HMDBackingStore dataSource]((id *)&self->super.super.isa);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = v27;
      if (v9)
        objc_msgSend(v27, "createBackingStoreLogAddTransactionOperationWithTransaction:", v12);
      else
        objc_msgSend(v27, "createBackingStoreOperation");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objects", v36);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      +[HMDBackingStoreTransactionBlock sort:](HMDBackingStoreTransactionBlock, "sort:", v29);

      v30 = (void *)MEMORY[0x1D17BA0A0]();
      v31 = self;
      HMFGetOSLogHandle();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "options");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v49 = v33;
        v50 = 2114;
        v51 = v28;
        v52 = 2114;
        v53 = v34;
        _os_log_impl(&dword_1CD062000, v32, OS_LOG_TYPE_INFO, "%{public}@Submitting operation: %{public}@ (%{public}@)", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v30);
      objc_initWeak((id *)buf, v31);
      objc_initWeak(&location, v28);
      v39[0] = MEMORY[0x1E0C809B0];
      v39[1] = 3221225472;
      v39[2] = __67__HMDBackingStore_commit_run_save_archiveInline_completionHandler___block_invoke;
      v39[3] = &unk_1E89BB790;
      objc_copyWeak(&v42, &location);
      objc_copyWeak(&v43, (id *)buf);
      v40 = v12;
      v44 = v9;
      v45 = a4;
      v41 = aBlock;
      v46 = a6;
      objc_msgSend(v28, "setResultBlock:", v39);
      objc_msgSend(v28, "setStore:", v31);
      objc_msgSend(v37, "backingStoreOperationQueue");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "addOperation:", v28);

      objc_destroyWeak(&v43);
      objc_destroyWeak(&v42);
      objc_destroyWeak(&location);
      objc_destroyWeak((id *)buf);

    }
  }

}

- (HMDBackingStore)initWithUUID:(id)a3 homeManager:(id)a4 home:(id)a5 dataSource:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  HMDBackingStore *v15;
  uint64_t v16;
  HMDBackingStoreLocal *local;
  id v18;
  void *v19;
  uint64_t v20;
  CKRecordID *root;
  HMDHomeManagerObjectLookup *v22;
  HMDObjectLookup *lookup;
  HMDBackingStore *v24;
  objc_super v26;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v26.receiver = self;
  v26.super_class = (Class)HMDBackingStore;
  v15 = -[HMDBackingStore init](&v26, sel_init);
  if (v15)
  {
    objc_msgSend(v14, "localBackingStore");
    v16 = objc_claimAutoreleasedReturnValue();
    local = v15->_local;
    v15->_local = (HMDBackingStoreLocal *)v16;

    objc_storeStrong((id *)&v15->_uuid, a3);
    v18 = objc_alloc(MEMORY[0x1E0C95070]);
    objc_msgSend(v11, "UUIDString");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v18, "initWithRecordName:", v19);
    root = v15->_root;
    v15->_root = (CKRecordID *)v20;

    objc_storeWeak((id *)&v15->_home, v13);
    objc_storeWeak((id *)&v15->_homeManager, v12);
    objc_storeWeak((id *)&v15->_dataSource, v14);
    if (v13)
    {
      objc_msgSend(v14, "createHomeObjectLookupWithHome:", v13);
      v22 = (HMDHomeManagerObjectLookup *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!v12)
      {
LABEL_7:
        v24 = v15;
        goto LABEL_8;
      }
      v22 = -[HMDHomeManagerObjectLookup initWithHomeManager:]([HMDHomeManagerObjectLookup alloc], "initWithHomeManager:", v12);
    }
    lookup = v15->_lookup;
    v15->_lookup = &v22->super;

    goto LABEL_7;
  }
LABEL_8:

  return v15;
}

- (HMDBackingStore)initWithUUID:(id)a3 homeManager:(id)a4
{
  if (self)
    return -[HMDBackingStore initWithUUID:homeManager:home:dataSource:](self, "initWithUUID:homeManager:home:dataSource:", a3, a4, 0, self);
  return self;
}

- (HMDBackingStore)initWithUUID:(id)a3 home:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "homeManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
    self = -[HMDBackingStore initWithUUID:homeManager:home:dataSource:](self, "initWithUUID:homeManager:home:dataSource:", v6, v8, v7, self);

  return self;
}

- (HMDBackingStore)initWithUUID:(id)a3
{
  if (self)
    return -[HMDBackingStore initWithUUID:homeManager:home:dataSource:](self, "initWithUUID:homeManager:home:dataSource:", a3, 0, 0, self);
  return self;
}

- (void)updateModelObjects:(id)a3 destination:(unint64_t)a4
{
  __updateRegistration(self, (char *)1, a3, a4);
}

- (void)deleteModelObjects:(id)a3 destination:(unint64_t)a4
{
  __updateRegistration(self, (char *)3, a3, a4);
}

- (void)submit:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  objc_msgSend(v4, "setStore:", self);
  -[HMDBackingStore dataSource]((id *)&self->super.super.isa);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "backingStoreOperationQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addOperation:", v4);

}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<HMFBackingStore>"));
}

- (void)saveToPersistentStoreWithReason:(id)a3 incrementGeneration:(BOOL)a4
{
  void *v5;
  void *v6;
  HMDBackingStoreSaveToPersistentStore *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  id v12;
  void *v13;
  id v14;
  HMDBackingStoreSaveToPersistentStore *v15;
  void *v16;
  void *v17;
  void *v18;
  HMDBackingStore *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  _BOOL4 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  id v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  void *v37;
  _BYTE v38[128];
  uint64_t v39;

  v25 = a4;
  v39 = *MEMORY[0x1E0C80C00];
  v24 = a3;
  -[HMDBackingStore dataSource]((id *)&self->super.super.isa);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "backingStoreOperationQueue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  objc_msgSend(v6, "operations");
  v7 = (HMDBackingStoreSaveToPersistentStore *)objc_claimAutoreleasedReturnValue();
  v8 = -[HMDBackingStoreSaveToPersistentStore countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v26, v38, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v27;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v27 != v10)
          objc_enumerationMutation(v7);
        v12 = *(id *)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v13 = v12;
        else
          v13 = 0;
        v14 = v13;

        if (v14
          && (objc_msgSend(v14, "isExecuting") & 1) == 0
          && (objc_msgSend(v14, "isFinished") & 1) == 0
          && (objc_msgSend(v14, "incrementGeneration") | !v25) == 1)
        {
          v18 = (void *)MEMORY[0x1D17BA0A0]();
          v19 = self;
          HMFGetOSLogHandle();
          v20 = objc_claimAutoreleasedReturnValue();
          v17 = v24;
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
          {
            HMFGetLogIdentifier();
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "incrementGeneration");
            HMFBooleanToString();
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            HMFBooleanToString();
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544130;
            v31 = v21;
            v32 = 2112;
            v33 = v24;
            v34 = 2112;
            v35 = v22;
            v36 = 2112;
            v37 = v23;
            _os_log_impl(&dword_1CD062000, v20, OS_LOG_TYPE_DEBUG, "%{public}@Not adding operation for %@ - existing saveOperation increments generation %@, current saveOperation increments generation %@", buf, 0x2Au);

          }
          objc_autoreleasePoolPop(v18);

          goto LABEL_19;
        }

      }
      v9 = -[HMDBackingStoreSaveToPersistentStore countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v26, v38, 16);
      if (v9)
        continue;
      break;
    }
  }

  v15 = [HMDBackingStoreSaveToPersistentStore alloc];
  -[HMDBackingStore homeManager](self, "homeManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v24;
  v7 = -[HMDBackingStoreSaveToPersistentStore initWithHomeManager:reason:incrementGeneration:](v15, "initWithHomeManager:reason:incrementGeneration:", v16, v24, v25);

  -[HMDBackingStoreOperation setStore:](v7, "setStore:", self);
  -[HMDBackingStoreSaveToPersistentStore setQueuePriority:](v7, "setQueuePriority:", -4);
  objc_msgSend(v6, "addOperation:", v7);
LABEL_19:

}

- (void)submitBlock:(id)a3
{
  id v4;
  HMDBackingStoreOperation *v5;

  v4 = a3;
  v5 = -[HMDBackingStoreOperation initWithResultBlock:]([HMDBackingStoreOperation alloc], "initWithResultBlock:", v4);

  -[HMDBackingStore submit:](self, "submit:", v5);
}

- (id)__fetchWithGroup:(id)a3 uuids:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD aBlock[4];
  id v19;
  id v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v8 = a3;
  v9 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__156932;
  v26 = __Block_byref_object_dispose__156933;
  v27 = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __48__HMDBackingStore___fetchWithGroup_uuids_error___block_invoke;
  aBlock[3] = &unk_1E89BB7D8;
  v21 = &v22;
  v11 = v10;
  v19 = v11;
  v12 = v8;
  v20 = v12;
  v13 = _Block_copy(aBlock);
  -[HMDBackingStore local](self, "local");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "_fetchRecordsWithGroupID:uuids:callback:", objc_msgSend(v12, "groupID"), v9, v13);

  v15 = (void *)v23[5];
  if (v15)
  {
    if (a5)
      *a5 = objc_retainAutorelease(v15);

    v11 = 0;
  }
  v16 = v11;

  _Block_object_dispose(&v22, 8);
  return v16;
}

- (id)createBackingStoreLogAddTransactionOperationWithTransaction:(id)a3
{
  id v3;
  HMDBackingStoreLogAddTransactionOperation *v4;

  v3 = a3;
  v4 = -[HMDBackingStoreLogAddTransactionOperation initWithTransaction:]([HMDBackingStoreLogAddTransactionOperation alloc], "initWithTransaction:", v3);

  return v4;
}

- (id)createBackingStoreOperation
{
  return objc_alloc_init(HMDBackingStoreOperation);
}

- (id)localBackingStore
{
  void *v2;
  void *v3;

  +[HMDBackingStoreSingleton sharedInstance](HMDBackingStoreSingleton, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "local");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)backingStoreOperationQueue
{
  void *v2;
  void *v3;

  +[HMDBackingStoreSingleton sharedInstance](HMDBackingStoreSingleton, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "queue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)createHomeObjectLookupWithHome:(id)a3
{
  id v3;
  HMDHomeObjectLookup *v4;

  v3 = a3;
  v4 = -[HMDHomeObjectLookup initWithHome:]([HMDHomeObjectLookup alloc], "initWithHome:", v3);

  return v4;
}

- (id)dataForPersistentStoreIncrementingGeneration:(BOOL)a3 reason:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;

  v4 = a3;
  v6 = a4;
  -[HMDBackingStore homeManager](self, "homeManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_dataForPersistentStoreIncrementingGeneration:reason:", v4, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSString)activeControllerKeyUsername
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0D165F0], "systemStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activeControllerPairingIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  return (NSString *)v4;
}

- (BOOL)isAtomicSaveFeatureEnabled
{
  return !isWatch();
}

- (CKRecordID)root
{
  return self->_root;
}

- (HMDBackingStoreLocal)local
{
  return self->_local;
}

- (void)setLocal:(id)a3
{
  objc_storeStrong((id *)&self->_local, a3);
}

- (HMDHomeManager)homeManager
{
  return (HMDHomeManager *)objc_loadWeakRetained((id *)&self->_homeManager);
}

- (void)setHomeManager:(id)a3
{
  objc_storeWeak((id *)&self->_homeManager, a3);
}

- (HMDHome)home
{
  return (HMDHome *)objc_loadWeakRetained((id *)&self->_home);
}

- (void)setHome:(id)a3
{
  objc_storeWeak((id *)&self->_home, a3);
}

- (void)setUuid:(id)a3
{
  objc_storeStrong((id *)&self->_uuid, a3);
}

- (HMDObjectLookup)lookup
{
  return self->_lookup;
}

- (void)setLookup:(id)a3
{
  objc_storeStrong((id *)&self->_lookup, a3);
}

- (HMDBackingStoreObjectProtocol)delegate
{
  return (HMDBackingStoreObjectProtocol *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataSource);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_lookup, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_destroyWeak((id *)&self->_home);
  objc_destroyWeak((id *)&self->_homeManager);
  objc_storeStrong((id *)&self->_local, 0);
  objc_storeStrong((id *)&self->_root, 0);
}

BOOL __48__HMDBackingStore___fetchWithGroup_uuids_error___block_invoke(_QWORD *a1, void *a2, uint64_t a3, void *a4, void *a5, void *a6)
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  HMDBackingStoreCacheFetchRecordResult *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  HMDBackingStoreCacheFetchRecordResult *v23;
  void *v25;

  v11 = a2;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = v14;
  if (v14)
  {
    v16 = *(_QWORD *)(a1[6] + 8);
    v17 = v14;
    v18 = *(void **)(v16 + 40);
    *(_QWORD *)(v16 + 40) = v17;
  }
  else
  {
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v11, 0);
    v25 = (void *)a1[4];
    v19 = [HMDBackingStoreCacheFetchRecordResult alloc];
    v20 = a1[5];
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95048]), "initWithCoder:", v18);
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v13);
    v23 = -[HMDBackingStoreCacheFetchRecordResult initWithGroup:record:data:encoding:uuid:](v19, "initWithGroup:record:data:encoding:uuid:", v20, v21, v12, a3, v22);
    objc_msgSend(v25, "addObject:", v23);

  }
  return v15 == 0;
}

- (id)dataSource
{
  if (WeakRetained)
    WeakRetained = (id *)objc_loadWeakRetained(WeakRetained + 9);
  return WeakRetained;
}

void __67__HMDBackingStore_commit_run_save_archiveInline_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  HMDHomeSaveRequest *v3;
  id v4;
  void *v5;
  void *v6;
  id *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void (**v19)(_QWORD, _QWORD);
  uint64_t v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  id *v26;
  NSObject *v27;
  _BOOL4 v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  id *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  HMDBackingStoreTransactionActions *v40;
  void *v41;
  HMDBackingStoreTransactionActions *v42;
  void *v43;
  id *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  HMDHomeSaveRequest *v52;
  void *v53;
  id *v54;
  NSObject *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  char v63;
  uint64_t v64;
  uint64_t i;
  HMDHomeSaveRequest *v66;
  void *v67;
  id *v68;
  NSObject *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  id *v74;
  NSObject *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  id *v80;
  NSObject *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  uint64_t v86;
  void *v87;
  id *v88;
  NSObject *v89;
  void *v90;
  void *v91;
  _BOOL4 v92;
  HMDBackingStoreTransactionActions *v93;
  void *v94;
  void *v95;
  void *v96;
  id *v97;
  NSObject *v98;
  _BOOL4 v99;
  void *v100;
  void *v101;
  uint64_t v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  id *v107;
  NSObject *v108;
  void *v109;
  void *v110;
  void *v111;
  id *v112;
  NSObject *v113;
  void *v114;
  void *v115;
  HMDHomeSaveRequest *v116;
  void *v117;
  HMDHomeSaveRequest *v118;
  void *v119;
  id *v120;
  NSObject *v121;
  void *v122;
  void *v123;
  void *v124;
  id *v125;
  NSObject *v126;
  void *v127;
  void *v128;
  void *v129;
  id *v130;
  NSObject *v131;
  NSObject *v132;
  void *v133;
  void *v134;
  void *v135;
  uint64_t v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void (**v143)(_QWORD, _QWORD);
  void *v144;
  id *v145;
  NSObject *v146;
  void *v147;
  void *v148;
  uint64_t v149;
  void *v150;
  uint64_t v151;
  HMDHomeSaveRequest *v152;
  void *v153;
  id v154;
  void *v155;
  int v156;
  id *v157;
  HMDBackingStoreTransactionActions *v158;
  void *v159;
  uint64_t v160;
  id obj;
  uint64_t v162;
  void *context;
  uint64_t v164;
  HMDHomeSaveRequest *v165;
  id *v166;
  uint64_t v167;
  void *v168;
  id WeakRetained;
  void *v170;
  _QWORD v171[5];
  id v172;
  id v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  __int128 v177;
  id v178;
  __int128 v179;
  __int128 v180;
  __int128 v181;
  __int128 v182;
  uint8_t buf[4];
  void *v184;
  __int16 v185;
  void *v186;
  __int16 v187;
  HMDHomeSaveRequest *v188;
  __int16 v189;
  void *v190;
  __int16 v191;
  void *v192;
  _BYTE v193[128];
  _BYTE v194[128];
  uint64_t v195;

  v195 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v4 = objc_loadWeakRetained((id *)(a1 + 56));
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "homeManager");
    v159 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x1D17BA0A0]();
    v7 = v5;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "operationUUID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v184 = v9;
      v185 = 2112;
      v186 = v10;
      _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@[%@] Starting operation", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
    objc_msgSend(*(id *)(a1 + 32), "dumpWithVerbosity:prefix:logType:", objc_msgSend(v159, "isDataSyncInProgress") ^ 1, &stru_1E89C3E38, 1);
    objc_msgSend(v7, "home");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v157 = v7;
    v12 = objc_loadWeakRetained(v7 + 9);
    v156 = objc_msgSend(v12, "isAtomicSaveFeatureEnabled");
    if ((v156 & 1) != 0)
    {
      if (!*(_BYTE *)(a1 + 65))
      {
LABEL_114:
        objc_msgSend(WeakRetained, "operationFinishBlock");
        v143 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, HMDHomeSaveRequest *))v143)[2](v143, v3);

LABEL_115:
        v144 = (void *)MEMORY[0x1D17BA0A0]();
        v145 = v157;
        HMFGetOSLogHandle();
        v146 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v146, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v147 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(WeakRetained, "operationUUID");
          v148 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v184 = v147;
          v185 = 2112;
          v186 = v148;
          _os_log_impl(&dword_1CD062000, v146, OS_LOG_TYPE_INFO, "%{public}@[%@] Finished operation", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v144);
        v149 = *(_QWORD *)(a1 + 40);
        if (v149)
          (*(void (**)(uint64_t, HMDHomeSaveRequest *))(v149 + 16))(v149, v3);
        v18 = (uint64_t)v3;
        goto LABEL_120;
      }
      objc_msgSend(v12, "activeControllerKeyUsername");
      v155 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v155 && v11)
      {
        v13 = (void *)MEMORY[0x1D17BA0A0]();
        v14 = v7;
        HMFGetOSLogHandle();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(WeakRetained, "operationUUID");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v184 = v16;
          v185 = 2112;
          v186 = v17;
          _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_ERROR, "%{public}@[%@] No controller found, cannot run transaction again", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v13);
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
        v18 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(WeakRetained, "operationFinishBlock");
        v19 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        v19[2](v19, v18);

        v20 = *(_QWORD *)(a1 + 40);
        if (v20)
          (*(void (**)(uint64_t, uint64_t))(v20 + 16))(v20, v18);
LABEL_120:

        v3 = (HMDHomeSaveRequest *)v18;
        goto LABEL_121;
      }
    }
    else
    {
      if (*(_BYTE *)(a1 + 64))
      {
        v25 = (void *)MEMORY[0x1D17BA0A0]();
        v26 = v7;
        HMFGetOSLogHandle();
        v27 = objc_claimAutoreleasedReturnValue();
        v28 = os_log_type_enabled(v27, OS_LOG_TYPE_INFO);
        if (v3)
        {
          if (v28)
          {
            HMFGetLogIdentifier();
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(WeakRetained, "operationUUID");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v184 = v29;
            v185 = 2112;
            v186 = v30;
            v187 = 2112;
            v188 = v3;
            _os_log_impl(&dword_1CD062000, v27, OS_LOG_TYPE_INFO, "%{public}@[%@] Error occurred during save: %@", buf, 0x20u);

          }
          objc_autoreleasePoolPop(v25);
          objc_msgSend(v26, "local");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "_rollback");
        }
        else
        {
          if (v28)
          {
            HMFGetLogIdentifier();
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(WeakRetained, "operationUUID");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v184 = v32;
            v185 = 2112;
            v186 = v33;
            _os_log_impl(&dword_1CD062000, v27, OS_LOG_TYPE_INFO, "%{public}@[%@] Save complete", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v25);
          objc_msgSend(v26, "local");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = (id)objc_msgSend(v31, "_commit");
        }

      }
      if (!*(_BYTE *)(a1 + 65))
        goto LABEL_115;
      v155 = 0;
    }
    v153 = v5;
    v154 = v12;
    v150 = v11;
    v152 = v3;
    v35 = (void *)MEMORY[0x1D17BA0A0]();
    v36 = v157;
    HMFGetOSLogHandle();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "operationUUID");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v184 = v38;
      v185 = 2112;
      v186 = v39;
      _os_log_impl(&dword_1CD062000, v37, OS_LOG_TYPE_INFO, "%{public}@[%@] Running operation", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v35);
    v40 = [HMDBackingStoreTransactionActions alloc];
    objc_msgSend(*(id *)(a1 + 32), "options");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = -[HMDBackingStoreTransactionActions initWithBackingStore:options:](v40, "initWithBackingStore:options:", v36, v41);

    v181 = 0u;
    v182 = 0u;
    v179 = 0u;
    v180 = 0u;
    v151 = a1;
    objc_msgSend(*(id *)(a1 + 32), "objects");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v43 = v159;
    v158 = v42;
    v44 = v36;
    v162 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v179, v194, 16);
    if (v162)
    {
      v45 = *(_QWORD *)v180;
      v166 = v36;
      v160 = *(_QWORD *)v180;
      do
      {
        v46 = 0;
        do
        {
          if (*(_QWORD *)v180 != v45)
            objc_enumerationMutation(obj);
          v164 = v46;
          v47 = *(void **)(*((_QWORD *)&v179 + 1) + 8 * v46);
          context = (void *)MEMORY[0x1D17BA0A0]();
          objc_msgSend(v44, "local");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          v170 = v47;
          objc_msgSend(v47, "change");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "uuid");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          v178 = 0;
          objc_msgSend(v48, "_fetchRecordWithUUID:root:error:", v50, 0, &v178);
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          v52 = (HMDHomeSaveRequest *)v178;

          v165 = v52;
          if (v52)
          {
            v53 = (void *)MEMORY[0x1D17BA0A0]();
            v54 = v44;
            HMFGetOSLogHandle();
            v55 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v56 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(WeakRetained, "operationUUID");
              v57 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v184 = v56;
              v185 = 2112;
              v186 = v57;
              v187 = 2112;
              v188 = v52;
              _os_log_impl(&dword_1CD062000, v55, OS_LOG_TYPE_ERROR, "%{public}@[%@] Unexpected issue when fetching row from cache: %@", buf, 0x20u);

              v45 = v160;
            }

            objc_autoreleasePoolPop(v53);
            v58 = v51;
            v51 = 0;
LABEL_37:

LABEL_38:
            objc_msgSend(v44, "lookup");
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            v171[0] = MEMORY[0x1E0C809B0];
            v171[1] = 3221225472;
            v171[2] = __67__HMDBackingStore_commit_run_save_archiveInline_completionHandler___block_invoke_84;
            v171[3] = &unk_1E89C0DA8;
            v171[4] = v44;
            v172 = WeakRetained;
            v173 = v43;
            objc_msgSend(v59, "lookUpAndApplyObjectChange:previous:result:completionHandler:", v170, v51, v42, v171);

            goto LABEL_39;
          }
          if (!v51)
            goto LABEL_38;
          v176 = 0u;
          v177 = 0u;
          v174 = 0u;
          v175 = 0u;
          objc_msgSend(v170, "change");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v60, "setProperties");
          v58 = (void *)objc_claimAutoreleasedReturnValue();

          v61 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v174, v193, 16);
          if (!v61)
          {
            v42 = v158;
            v43 = v159;
            goto LABEL_37;
          }
          v62 = v61;
          v63 = 0;
          v64 = *(_QWORD *)v175;
          v167 = *(_QWORD *)v175;
          v168 = v58;
          do
          {
            for (i = 0; i != v62; ++i)
            {
              if (*(_QWORD *)v175 != v64)
                objc_enumerationMutation(v58);
              v66 = *(HMDHomeSaveRequest **)(*((_QWORD *)&v174 + 1) + 8 * i);
              if (objc_msgSend(v51, "propertyIsReadOnly:", v66))
              {
                v67 = (void *)MEMORY[0x1D17BA0A0]();
                v68 = v44;
                HMFGetOSLogHandle();
                v69 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
                {
                  HMFGetLogIdentifier();
                  v70 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(WeakRetained, "operationUUID");
                  v71 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v170, "change");
                  v72 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138544386;
                  v184 = v70;
                  v185 = 2112;
                  v186 = v71;
                  v187 = 2112;
                  v188 = v66;
                  v189 = 2112;
                  v190 = v72;
                  v191 = 2112;
                  v192 = v51;
                  _os_log_impl(&dword_1CD062000, v69, OS_LOG_TYPE_ERROR, "%{public}@[%@] Attempting to set field %@ on %@ (now read-only in %@)", buf, 0x34u);

                  v64 = v167;
                  v44 = v166;

                  v58 = v168;
                }

                objc_autoreleasePoolPop(v67);
                v63 = 1;
              }
              if ((objc_msgSend(v51, "propertyIsAvailable:", v66) & 1) == 0)
              {
                v73 = (void *)MEMORY[0x1D17BA0A0]();
                v74 = v44;
                HMFGetOSLogHandle();
                v75 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR))
                {
                  HMFGetLogIdentifier();
                  v76 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(WeakRetained, "operationUUID");
                  v77 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v170, "change");
                  v78 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138544386;
                  v184 = v76;
                  v185 = 2112;
                  v186 = v77;
                  v187 = 2112;
                  v188 = v66;
                  v189 = 2112;
                  v190 = v78;
                  v191 = 2112;
                  v192 = v51;
                  _os_log_impl(&dword_1CD062000, v75, OS_LOG_TYPE_ERROR, "%{public}@[%@] Attempting to set field %@ on %@ (no longer available in %@)", buf, 0x34u);

                  v44 = v166;
                  v64 = v167;

                  v58 = v168;
                }

                objc_autoreleasePoolPop(v73);
                v63 = 1;
              }
            }
            v62 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v174, v193, 16);
          }
          while (v62);

          if ((v63 & 1) == 0)
          {
            v42 = v158;
            v43 = v159;
            v45 = v160;
            goto LABEL_38;
          }
          v79 = (void *)MEMORY[0x1D17BA0A0]();
          v80 = v44;
          HMFGetOSLogHandle();
          v81 = objc_claimAutoreleasedReturnValue();
          v42 = v158;
          v43 = v159;
          v45 = v160;
          if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v82 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(WeakRetained, "operationUUID");
            v83 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v184 = v82;
            v185 = 2112;
            v186 = v83;
            _os_log_impl(&dword_1CD062000, v81, OS_LOG_TYPE_ERROR, "%{public}@[%@] Calling response handler with invalid parameter", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v79);
          objc_msgSend(v170, "message");
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 3);
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v84, "respondWithError:", v85);

LABEL_39:
          objc_autoreleasePoolPop(context);
          v46 = v164 + 1;
        }
        while (v164 + 1 != v162);
        v86 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v179, v194, 16);
        v162 = v86;
      }
      while (v86);
    }

    v87 = (void *)MEMORY[0x1D17BA0A0](-[HMDBackingStoreTransactionActions invokePostApplyActions](v42, "invokePostApplyActions"));
    v88 = v44;
    HMFGetOSLogHandle();
    v89 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v89, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "operationUUID");
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v184 = v90;
      v185 = 2112;
      v186 = v91;
      v187 = 2112;
      v188 = (HMDHomeSaveRequest *)v42;
      _os_log_impl(&dword_1CD062000, v89, OS_LOG_TYPE_INFO, "%{public}@[%@] Saving transaction with actions: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v87);
    v92 = -[HMDBackingStoreTransactionActions local](v42, "local");
    v93 = v42;
    v3 = v152;
    v5 = v153;
    v11 = v150;
    a1 = v151;
    v12 = v154;
    if (v92 && !-[HMDBackingStoreTransactionActions changed](v93, "changed"))
    {
      if (v156)
      {
        v96 = (void *)MEMORY[0x1D17BA0A0]();
        v97 = v88;
        HMFGetOSLogHandle();
        v98 = objc_claimAutoreleasedReturnValue();
        v99 = os_log_type_enabled(v98, OS_LOG_TYPE_INFO);
        if (v155)
        {
          if (v99)
          {
            HMFGetLogIdentifier();
            v100 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(WeakRetained, "operationUUID");
            v101 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v184 = v100;
            v185 = 2112;
            v186 = v101;
            _os_log_impl(&dword_1CD062000, v98, OS_LOG_TYPE_INFO, "%{public}@[%@] Saving home data archive for local actions", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v96);
          -[HMDBackingStore _saveHomeDataInOperationWithControllerUserName:incrementGeneration:reason:](v97, v155, 0, CFSTR("LocalActions"));
          v102 = objc_claimAutoreleasedReturnValue();

          v3 = (HMDHomeSaveRequest *)v102;
        }
        else
        {
          if (v99)
          {
            HMFGetLogIdentifier();
            v137 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(WeakRetained, "operationUUID");
            v138 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v184 = v137;
            v185 = 2112;
            v186 = v138;
            _os_log_impl(&dword_1CD062000, v98, OS_LOG_TYPE_INFO, "%{public}@[%@] No controller key, cannot save home data archive for local actions", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v96);
        }
      }
      else
      {
        objc_msgSend(v159, "_saveToPersistentStore:reason:", 0, CFSTR("LocalActions"));
      }
    }
    else
    {
      if (!-[HMDBackingStoreTransactionActions changed](v93, "changed")
        && !-[HMDBackingStoreTransactionOptions mustPush](v93, "mustPush"))
      {
        goto LABEL_111;
      }
      if (-[HMDBackingStoreTransactionOptions source](v93, "source") == 1)
      {
        if (v150)
        {
          objc_msgSend(v150, "zoneID");
          v94 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v94, "UUIDString");
          v95 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v95 = 0;
        }
        objc_msgSend(v159, "syncManager");
        v103 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v103, "resetCloudPushTimer:", v95);

      }
      if (v150)
      {
        v93 = v158;
        if (-[HMDBackingStoreTransactionActions saveToSharedUserAccount](v158, "saveToSharedUserAccount"))
        {
          -[HMDBackingStoreTransactionOptions label](v158, "label");
          v104 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(v151 + 32), "options");
          v105 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v150, "saveSharedHomeToAccountWithReason:postSyncNotification:options:", v104, 0, v105);

        }
        else
        {
          v124 = (void *)MEMORY[0x1D17BA0A0]();
          v125 = v88;
          HMFGetOSLogHandle();
          v126 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v126, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v127 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(WeakRetained, "operationUUID");
            v128 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v184 = v127;
            v185 = 2112;
            v186 = v128;
            _os_log_impl(&dword_1CD062000, v126, OS_LOG_TYPE_INFO, "%{public}@[%@] Saving home data in transaction", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v124);
          if (v156 && *(_BYTE *)(v151 + 66))
          {
            v129 = (void *)MEMORY[0x1D17BA0A0]();
            v130 = v125;
            HMFGetOSLogHandle();
            v131 = objc_claimAutoreleasedReturnValue();
            v132 = v131;
            if (v155)
            {
              if (os_log_type_enabled(v131, OS_LOG_TYPE_INFO))
              {
                HMFGetLogIdentifier();
                v133 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(WeakRetained, "operationUUID");
                v134 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                v184 = v133;
                v185 = 2112;
                v186 = v134;
                _os_log_impl(&dword_1CD062000, v132, OS_LOG_TYPE_INFO, "%{public}@[%@] Saving home data archive for with home actions", buf, 0x16u);

              }
              objc_autoreleasePoolPop(v129);
              v93 = v158;
              -[HMDBackingStoreTransactionOptions label](v158, "label");
              v135 = (void *)objc_claimAutoreleasedReturnValue();
              -[HMDBackingStore _saveHomeDataInOperationWithControllerUserName:incrementGeneration:reason:](v130, v155, 1, v135);
              v136 = objc_claimAutoreleasedReturnValue();

              v3 = (HMDHomeSaveRequest *)v136;
            }
            else
            {
              if (os_log_type_enabled(v131, OS_LOG_TYPE_ERROR))
              {
                HMFGetLogIdentifier();
                v139 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(WeakRetained, "operationUUID");
                v140 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                v184 = v139;
                v185 = 2112;
                v186 = v140;
                _os_log_impl(&dword_1CD062000, v132, OS_LOG_TYPE_ERROR, "%{public}@[%@] No controller key, cannot save home data archive for with home actions, home data will need to be reset", buf, 0x16u);

              }
              objc_autoreleasePoolPop(v129);
              v93 = v158;
            }
            -[HMDBackingStoreTransactionOptions label](v93, "label");
            v104 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v150, "performPostSaveActionsWithReason:", v104);
          }
          else
          {
            v93 = v158;
            -[HMDBackingStoreTransactionOptions label](v158, "label");
            v104 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v150, "saveWithReason:postSyncNotification:objectChange:", v104, 0, 1);
          }
        }

LABEL_111:
        if (-[HMDBackingStoreTransactionActions saveToAssistant](v93, "saveToAssistant"))
        {
          objc_msgSend(*(id *)(v151 + 32), "options");
          v141 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v141, "label");
          v142 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v159, "assistantSyncDataChanged:", v142);

        }
        if (!v156)
          goto LABEL_115;
        goto LABEL_114;
      }
      v106 = (void *)MEMORY[0x1D17BA0A0]();
      v107 = v88;
      HMFGetOSLogHandle();
      v108 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v108, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v109 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(WeakRetained, "operationUUID");
        v110 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v184 = v109;
        v185 = 2112;
        v186 = v110;
        _os_log_impl(&dword_1CD062000, v108, OS_LOG_TYPE_INFO, "%{public}@[%@] Saving home manager data in transaction", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v106);
      if (!v155)
      {
        v111 = (void *)MEMORY[0x1D17BA0A0]();
        v112 = v107;
        HMFGetOSLogHandle();
        v113 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v113, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v114 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(WeakRetained, "operationUUID");
          v115 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v184 = v114;
          v185 = 2112;
          v186 = v115;
          _os_log_impl(&dword_1CD062000, v113, OS_LOG_TYPE_ERROR, "%{public}@[%@] No controller key while processing home manager actions", buf, 0x16u);

          v12 = v154;
        }

        objc_autoreleasePoolPop(v111);
      }
      v116 = [HMDHomeSaveRequest alloc];
      -[HMDBackingStoreTransactionOptions label](v158, "label");
      v117 = (void *)objc_claimAutoreleasedReturnValue();
      v118 = -[HMDHomeSaveRequest initWithReason:information:postSyncNotification:](v116, "initWithReason:information:postSyncNotification:", v117, 0, 0);

      v119 = (void *)MEMORY[0x1D17BA0A0]();
      v120 = v107;
      HMFGetOSLogHandle();
      v121 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v121, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v122 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(WeakRetained, "operationUUID");
        v123 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v184 = v122;
        v185 = 2112;
        v186 = v123;
        v187 = 2112;
        v188 = v118;
        _os_log_impl(&dword_1CD062000, v121, OS_LOG_TYPE_INFO, "%{public}@[%@] Submitting save request: %@", buf, 0x20u);

        v12 = v154;
      }

      objc_autoreleasePoolPop(v119);
      objc_msgSend(v159, "saveWithRequest:", v118);

    }
    v93 = v158;
    goto LABEL_111;
  }
  v21 = (void *)MEMORY[0x1D17BA0A0]();
  HMFGetOSLogHandle();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "operationUUID");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v184 = v23;
    v185 = 2112;
    v186 = v24;
    _os_log_impl(&dword_1CD062000, v22, OS_LOG_TYPE_ERROR, "%{public}@[%@] lost self when running transaction", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v21);
LABEL_121:

}

void __67__HMDBackingStore_commit_run_save_archiveInline_completionHandler___block_invoke_84(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  const char *v10;
  NSObject *v11;
  os_log_type_t v12;
  uint32_t v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1D17BA0A0]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "operationUUID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543874;
      v17 = v8;
      v18 = 2112;
      v19 = v9;
      v20 = 2112;
      v21 = v3;
      v10 = "%{public}@[%@] Apply Change resulted with error: %@";
      v11 = v7;
      v12 = OS_LOG_TYPE_ERROR;
      v13 = 32;
LABEL_6:
      _os_log_impl(&dword_1CD062000, v11, v12, v10, (uint8_t *)&v16, v13);

    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "operationUUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138543618;
    v17 = v8;
    v18 = 2112;
    v19 = v9;
    v10 = "%{public}@[%@] Apply Change completed";
    v11 = v7;
    v12 = OS_LOG_TYPE_INFO;
    v13 = 22;
    goto LABEL_6;
  }

  objc_autoreleasePoolPop(v4);
  v14 = *(void **)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "uuid");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "updateGenerationCounterWithReason:sourceUUID:shouldNotifyClients:", CFSTR("Backing store transaction applied"), v15, 1);

}

- (id)_saveHomeDataInOperationWithControllerUserName:(uint64_t)a3 incrementGeneration:(void *)a4 reason:
{
  id v7;
  id v8;
  id WeakRetained;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  id *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  char v27;
  id v28;
  id *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  id *v33;
  NSObject *v34;
  void *v35;
  void *v37;
  NSObject *v38;
  void *v39;
  id v40;
  id v41;
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  id v45;
  __int16 v46;
  void *v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a4;
  WeakRetained = objc_loadWeakRetained(a1 + 9);
  objc_msgSend(a1, "homeManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "hasValidControllerKeyToSave");

  v12 = (void *)MEMORY[0x1D17BA0A0]();
  if ((v11 & 1) != 0)
  {
    objc_msgSend(WeakRetained, "dataForPersistentStoreIncrementingGeneration:reason:", a3, v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (!v13 || !objc_msgSend(v13, "length"))
    {
      v32 = (void *)MEMORY[0x1D17BA0A0]();
      v33 = a1;
      HMFGetOSLogHandle();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v43 = v35;
        _os_log_impl(&dword_1CD062000, v34, OS_LOG_TYPE_INFO, "%{public}@No home data to save.", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v32);

      objc_autoreleasePoolPop(v12);
      goto LABEL_18;
    }
    v15 = (void *)MEMORY[0x1D17BA0A0]();
    v16 = a1;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v14, "length"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v43 = v18;
      v44 = 2112;
      v45 = v7;
      v46 = 2112;
      v47 = v19;
      _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@Controller User Name : [%@], Saving home data size: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v15);
    objc_msgSend(v16, "local");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = 0;
    objc_msgSend(v20, "_insertArchive:identifier:controllerUserName:error:", v14, CFSTR("homedata"), v7, &v40);
    v21 = v40;

    objc_autoreleasePoolPop(v12);
    if (!v21)
    {
      if (((_BYTE)v16[1] & 1) == 0)
      {
        v22 = (void *)MEMORY[0x1D17BA0A0]();
        v23 = v16;
        HMFGetOSLogHandle();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          HMFGetLogIdentifier();
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v43 = v25;
          _os_log_impl(&dword_1CD062000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@Will attempt to remove legacy archive", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v22);
        objc_msgSend(v23, "homeManager");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = 0;
        v27 = objc_msgSend(v26, "_removeLegacyHomeArchive:", &v41);
        v28 = v41;

        if ((v27 & 1) != 0)
        {
          *((_BYTE *)v23 + 8) = 1;
        }
        else
        {
          v37 = (void *)MEMORY[0x1D17BA0A0]();
          HMFGetOSLogHandle();
          v38 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v43 = v39;
            v44 = 2112;
            v45 = v28;
            _os_log_impl(&dword_1CD062000, v38, OS_LOG_TYPE_ERROR, "%{public}@Unable to remove home data error:%@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v37);
        }

      }
LABEL_18:
      v21 = 0;
    }
  }
  else
  {
    v29 = a1;
    HMFGetOSLogHandle();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v43 = v31;
      _os_log_impl(&dword_1CD062000, v30, OS_LOG_TYPE_DEFAULT, "%{public}@In decryption fail state cannot save.", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v12);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
    v21 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v21;
}

+ (void)start
{
  +[HMDBackingStoreSingleton start](HMDBackingStoreSingleton, "start");
}

+ (NSSet)allowedTypes
{
  if (allowedTypes_onceToken_157027 != -1)
    dispatch_once(&allowedTypes_onceToken_157027, &__block_literal_global_157028);
  return (NSSet *)(id)allowedTypes__allowedTypes_157029;
}

+ (NSSet)deeplyProblematicObjectTypes
{
  if (deeplyProblematicObjectTypes_onceToken != -1)
    dispatch_once(&deeplyProblematicObjectTypes_onceToken, &__block_literal_global_66);
  return (NSSet *)(id)deeplyProblematicObjectTypes__neverAllowedTypes;
}

+ (NSSet)internalAllowedTypes
{
  if (internalAllowedTypes_onceToken != -1)
    dispatch_once(&internalAllowedTypes_onceToken, &__block_literal_global_73);
  return (NSSet *)(id)internalAllowedTypes__internalAllowedTypes;
}

+ (id)flushBackingStore
{
  void *v2;
  void *v3;

  +[HMDBackingStoreSingleton sharedInstance](HMDBackingStoreSingleton, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "flushBackingStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)resetBackingStore
{
  void *v2;
  void *v3;

  +[HMDBackingStoreSingleton sharedInstance](HMDBackingStoreSingleton, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resetBackingStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)currentDevice
{
  void *v2;
  void *v3;

  +[HMDAppleAccountManager sharedManager](HMDAppleAccountManager, "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (void)saveToPersistentStoreWithReason:(id)a3 homeManager:(id)a4 shouldIncrementGenerationCounter:(BOOL)a5 backingStore:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  BOOL v26;

  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __127__HMDBackingStore_saveToPersistentStoreWithReason_homeManager_shouldIncrementGenerationCounter_backingStore_completionHandler___block_invoke;
  v20[3] = &unk_1E89BB800;
  v24 = v15;
  v25 = a1;
  v21 = v12;
  v22 = v13;
  v26 = a5;
  v23 = v14;
  v16 = v15;
  v17 = v14;
  v18 = v13;
  v19 = v12;
  objc_msgSend(v17, "submitBlock:", v20);

}

+ (id)_saveToLocalStoreWithReason:(id)a3 homeManager:(id)a4 shouldIncrementGenerationCounter:(BOOL)a5 backingStore:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  id *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id WeakRetained;
  void *v23;
  uint64_t v24;
  void *v25;
  id v26;
  NSObject *v27;
  void *v28;
  void *v29;
  id *v30;
  NSObject *v31;
  void *v32;
  int v34;
  void *v35;
  uint64_t v36;

  v7 = a5;
  v36 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = (id *)a6;
  if (isWatch())
  {
    objc_msgSend(v11, "_saveToPersistentStore:reason:", v7, v10);
    v13 = 0;
  }
  else
  {
    v14 = (void *)MEMORY[0x1D17BA0A0]();
    v15 = a1;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = 138543362;
      v35 = v17;
      _os_log_impl(&dword_1CD062000, v16, OS_LOG_TYPE_INFO, "%{public}@Running HMDBackingStoreSaveToPersistentStore operation to save.", (uint8_t *)&v34, 0xCu);

    }
    objc_autoreleasePoolPop(v14);
    objc_msgSend(MEMORY[0x1E0D165F0], "systemStore");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "activeControllerPairingIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v19, "copy");

    if (v20)
    {
      v21 = v10;
      if (v12)
      {
        WeakRetained = objc_loadWeakRetained(v12 + 9);
        objc_msgSend(WeakRetained, "activeControllerKeyUsername");
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        if (v23)
        {
          -[HMDBackingStore _saveHomeDataInOperationWithControllerUserName:incrementGeneration:reason:](v12, v23, v7, v21);
          v24 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v29 = (void *)MEMORY[0x1D17BA0A0]();
          v30 = v12;
          HMFGetOSLogHandle();
          v31 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = 138543362;
            v35 = v32;
            _os_log_impl(&dword_1CD062000, v31, OS_LOG_TYPE_ERROR, "%{public}@Could not find controller key when trying to save home archive", (uint8_t *)&v34, 0xCu);

          }
          objc_autoreleasePoolPop(v29);
          objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
          v24 = objc_claimAutoreleasedReturnValue();
        }
        v13 = (void *)v24;

      }
      else
      {
        v13 = 0;
      }

    }
    else
    {
      v25 = (void *)MEMORY[0x1D17BA0A0]();
      v26 = v15;
      HMFGetOSLogHandle();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = 138543362;
        v35 = v28;
        _os_log_impl(&dword_1CD062000, v27, OS_LOG_TYPE_ERROR, "%{public}@Could not find controller key when trying to run transaction", (uint8_t *)&v34, 0xCu);

      }
      objc_autoreleasePoolPop(v25);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  return v13;
}

void __127__HMDBackingStore_saveToPersistentStoreWithReason_homeManager_shouldIncrementGenerationCounter_backingStore_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  objc_msgSend((id)objc_opt_class(), "_saveToLocalStoreWithReason:homeManager:shouldIncrementGenerationCounter:backingStore:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 72), *(_QWORD *)(a1 + 48));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 56);
  if (v3)
  {
    v4 = v2;
    (*(void (**)(void))(v3 + 16))();
    v2 = v4;
  }

}

void __30__HMDBackingStore_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v37_157015;
  logCategory__hmf_once_v37_157015 = v0;

}

void __39__HMDBackingStore_internalAllowedTypes__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  v0 = (void *)MEMORY[0x1E0C99E60];
  +[HMDBackingStore allowedTypes](HMDBackingStore, "allowedTypes");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithSet:", v4);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setByAddingObject:", objc_opt_class());
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)internalAllowedTypes__internalAllowedTypes;
  internalAllowedTypes__internalAllowedTypes = v2;

}

void __47__HMDBackingStore_deeplyProblematicObjectTypes__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v4, 7);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1, v4, v5, v6, v7, v8, v9);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)deeplyProblematicObjectTypes__neverAllowedTypes;
  deeplyProblematicObjectTypes__neverAllowedTypes = v2;

}

void __31__HMDBackingStore_allowedTypes__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v4, 7);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1, v4, v5, v6, v7, v8, v9);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)allowedTypes__allowedTypes_157029;
  allowedTypes__allowedTypes_157029 = v2;

}

@end
