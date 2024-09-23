@implementation HMBCloudDatabase

- (id)_zonesWithScope:(int64_t)a3
{
  os_unfair_lock_s *p_propertyLock;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  p_propertyLock = &self->_propertyLock;
  os_unfair_lock_lock_with_options();
  -[HMBCloudDatabase zoneStateByZoneID](self, "zoneStateByZoneID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_propertyLock);
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v9);
        v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v13, "scope", (_QWORD)v16) == a3)
          objc_msgSend(v8, "addObject:", v13);
      }
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v10);
  }

  v14 = (void *)objc_msgSend(v8, "copy");
  return v14;
}

- (NSMutableDictionary)zoneStateByZoneID
{
  return self->_zoneStateByZoneID;
}

- (NSSet)privateZoneIDs
{
  return (NSSet *)-[HMBCloudDatabase _zonesWithScope:](self, "_zonesWithScope:", 2);
}

- (id)performCodeOperationWithServiceName:(id)a3 functionName:(id)a4 request:(id)a5 responseClass:(Class)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  Class v25;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void *)MEMORY[0x1E0D519C0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __99__HMBCloudDatabase_CKCode__performCodeOperationWithServiceName_functionName_request_responseClass___block_invoke;
  v21[3] = &unk_1E8931CE8;
  v21[4] = self;
  v22 = v10;
  v23 = v11;
  v24 = v12;
  v25 = a6;
  v14 = (void *)MEMORY[0x1E0D519E8];
  v15 = v12;
  v16 = v11;
  v17 = v10;
  objc_msgSend(v14, "globalAsyncScheduler");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "futureWithBlock:scheduler:", v21, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

void __99__HMBCloudDatabase_CKCode__performCodeOperationWithServiceName_functionName_request_responseClass___block_invoke(void **a1, void *a2)
{
  __performCodeOperation(a1[4], a1[5], a1[6], a1[7], a1[8], 0, a2);
}

- (id)acceptInvitation:(id)a3
{
  id v4;
  void *v5;
  HMBCloudDatabase *v6;
  NSObject *v7;
  void *v8;
  HMBFutureOperation *v9;
  id v10;
  HMBFutureOperation *v11;
  void *v12;
  void *v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t);
  void *v18;
  HMBCloudDatabase *v19;
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17B6230]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v22 = v8;
    v23 = 2112;
    v24 = v4;
    _os_log_impl(&dword_1CCD48000, v7, OS_LOG_TYPE_INFO, "%{public}@Queueing up accept for invitation %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  v9 = [HMBFutureOperation alloc];
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __43__HMBCloudDatabase_User__acceptInvitation___block_invoke;
  v18 = &unk_1E8933858;
  v19 = v6;
  v20 = v4;
  v10 = v4;
  v11 = -[HMBFutureOperation initWithBlock:](v9, "initWithBlock:", &v15);
  -[HMBCloudDatabase invitationOperationQueue](v6, "invitationOperationQueue", v15, v16, v17, v18, v19);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addOperation:", v11);

  -[HMBFutureOperation future](v11, "future");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)_acceptInvitation:(id)a3
{
  id v4;
  void *v5;
  HMBCloudDatabase *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17B6230]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v19 = v8;
    v20 = 2112;
    v21 = v4;
    _os_log_impl(&dword_1CCD48000, v7, OS_LOG_TYPE_INFO, "%{public}@Accepting invitation: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  objc_initWeak((id *)buf, v6);
  -[HMBCloudDatabase fetchShareMetadataForInvitation:](v6, "fetchShareMetadataForInvitation:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __44__HMBCloudDatabase_User___acceptInvitation___block_invoke;
  v16[3] = &unk_1E89320F8;
  objc_copyWeak(&v17, (id *)buf);
  objc_msgSend(v9, "flatMap:", v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v10;
  v14[1] = 3221225472;
  v14[2] = __44__HMBCloudDatabase_User___acceptInvitation___block_invoke_2;
  v14[3] = &unk_1E8932120;
  objc_copyWeak(&v15, (id *)buf);
  objc_msgSend(v11, "flatMap:", v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v15);

  objc_destroyWeak(&v17);
  objc_destroyWeak((id *)buf);

  return v12;
}

id __44__HMBCloudDatabase_User___acceptInvitation___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = (void *)MEMORY[0x1D17B6230]();
  v6 = WeakRetained;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543618;
    v12 = v8;
    v13 = 2112;
    v14 = v3;
    _os_log_impl(&dword_1CCD48000, v7, OS_LOG_TYPE_INFO, "%{public}@Fetched share metadata: %@", (uint8_t *)&v11, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  objc_msgSend(v6, "acceptInvitationWithShareMetadata:", v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id __44__HMBCloudDatabase_User___acceptInvitation___block_invoke_2(uint64_t a1, void *a2)
{
  HMBCloudZoneStateModel *v3;
  id WeakRetained;
  void *v5;
  os_unfair_lock_s *v6;
  NSObject *v7;
  void *v8;
  HMBCloudZoneID *v9;
  void *v10;
  void *v11;
  void *v12;
  HMBCloudZoneID *v13;
  void *v14;
  HMBCloudZoneStateModel *v15;
  void *v16;
  os_unfair_lock_s *v17;
  NSObject *v18;
  void *v19;
  HMBCloudZoneStateModel *v20;
  void *v21;
  void *v22;
  void *v23;
  HMBCloudZoneStateModel *v24;
  void *v25;
  os_unfair_lock_s *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  HMBCloudZoneStateModel *v32;
  os_unfair_lock_s *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  void *context;
  HMBCloudZoneID *v40;
  HMBCloudZoneStateModel *v41;
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  HMBCloudZoneStateModel *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = (void *)MEMORY[0x1D17B6230]();
  v6 = (os_unfair_lock_s *)WeakRetained;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v43 = v8;
    v44 = 2112;
    v45 = v3;
    _os_log_impl(&dword_1CCD48000, v7, OS_LOG_TYPE_INFO, "%{public}@Accepted invitation with share: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  v9 = [HMBCloudZoneID alloc];
  -[os_unfair_lock_s containerID](v6, "containerID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMBCloudZoneStateModel recordID](v3, "recordID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "zoneID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[HMBCloudZoneID initWithContainerID:scope:zoneID:](v9, "initWithContainerID:scope:zoneID:", v10, 3, v12);

  os_unfair_lock_lock_with_options();
  -[os_unfair_lock_s zoneStateByZoneID](v6, "zoneStateByZoneID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", v13);
  v15 = (HMBCloudZoneStateModel *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    v16 = (void *)MEMORY[0x1D17B6230]();
    v17 = v6;
    HMFGetOSLogHandle();
    v18 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v43 = v19;
      v44 = 2112;
      v45 = v15;
      _os_log_impl(&dword_1CCD48000, v18, OS_LOG_TYPE_INFO, "%{public}@Not adding zone state model because one already exists: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v16);
  }
  else
  {
    v20 = [HMBCloudZoneStateModel alloc];
    -[HMBCloudID modelID](v13, "modelID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[os_unfair_lock_s sharedDatabaseState](v6, "sharedDatabaseState");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "hmbModelID");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = -[HMBCloudZoneStateModel initWithModelID:parentModelID:](v20, "initWithModelID:parentModelID:", v21, v23);

    v25 = (void *)MEMORY[0x1D17B6230](-[HMBCloudZoneStateModel setZoneID:](v24, "setZoneID:", v13));
    v26 = v6;
    HMFGetOSLogHandle();
    v27 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v43 = v28;
      v44 = 2112;
      v45 = v24;
      _os_log_impl(&dword_1CCD48000, v27, OS_LOG_TYPE_INFO, "%{public}@Adding zone state model: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v25);
    -[os_unfair_lock_s zoneStateByZoneID](v26, "zoneStateByZoneID");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setObject:forKeyedSubscript:", v24, v13);

    -[os_unfair_lock_s stateZone](v26, "stateZone");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = v24;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v41, 1);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "update:", v31);
    v32 = (HMBCloudZoneStateModel *)objc_claimAutoreleasedReturnValue();

    if (v32)
    {
      context = (void *)MEMORY[0x1D17B6230]();
      v33 = v26;
      HMFGetOSLogHandle();
      v34 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v43 = v35;
        v44 = 2112;
        v45 = v32;
        _os_log_impl(&dword_1CCD48000, v34, OS_LOG_TYPE_ERROR, "%{public}@Unable to add zone state model: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(context);
    }

  }
  os_unfair_lock_unlock(v6 + 2);
  v40 = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v40, 1);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[os_unfair_lock_s handleCreatedZoneIDs:](v6, "handleCreatedZoneIDs:", v36);

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v13);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  return v37;
}

uint64_t __43__HMBCloudDatabase_User__acceptInvitation___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_acceptInvitation:", *(_QWORD *)(a1 + 40));
}

- (HMBCloudDatabase)initWithLocalDatabase:(id)a3 stateZone:(id)a4 container:(id)a5 configuration:(id)a6 databaseStateModelsByScope:(id)a7 zoneStateModels:(id)a8 credentialsAvailabilityListener:(id)a9 dataSource:(id)a10
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  HMBCloudDatabase *v22;
  HMBCloudDatabase *v23;
  id *p_container;
  uint64_t v25;
  HMBCloudDatabaseConfiguration *configuration;
  uint64_t v27;
  CKDatabase *publicDatabase;
  uint64_t v29;
  HMBCloudDatabaseStateModel *publicDatabaseState;
  uint64_t v31;
  CKDatabase *privateDatabase;
  uint64_t v33;
  HMBCloudDatabaseStateModel *privateDatabaseState;
  uint64_t v35;
  CKDatabase *sharedDatabase;
  uint64_t v37;
  HMBCloudDatabaseStateModel *sharedDatabaseState;
  uint64_t v39;
  NSMutableDictionary *zoneStateByZoneID;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t i;
  void *v46;
  void *v47;
  NSMutableDictionary *v48;
  void *v49;
  NSOperationQueue *v50;
  NSOperationQueue *invitationOperationQueue;
  NSOperationQueue *v52;
  NSOperationQueue *databaseFetchOperationQueue;
  id cloudZoneFactory;
  id obj;
  id obja;
  id v58;
  id v59;
  void *v60;
  void *v61;
  id v62;
  id v63;
  id v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  objc_super v69;
  _BYTE v70[128];
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v17 = a3;
  obj = a4;
  v18 = a4;
  v58 = a5;
  v63 = a5;
  v19 = a6;
  v64 = a7;
  v20 = a8;
  v62 = a9;
  v21 = a10;
  v61 = v17;
  if (!v17)
  {
    _HMFPreconditionFailure();
    goto LABEL_24;
  }
  if (!v18)
  {
LABEL_24:
    _HMFPreconditionFailure();
    goto LABEL_25;
  }
  if (!v63)
  {
LABEL_25:
    _HMFPreconditionFailure();
    goto LABEL_26;
  }
  if (!v64)
  {
LABEL_26:
    _HMFPreconditionFailure();
    goto LABEL_27;
  }
  if (!v20)
  {
LABEL_27:
    _HMFPreconditionFailure();
    goto LABEL_28;
  }
  if (!v62)
  {
LABEL_28:
    _HMFPreconditionFailure();
    goto LABEL_29;
  }
  if (!v21)
  {
LABEL_29:
    _HMFPreconditionFailure();
LABEL_30:
    _HMFPreconditionFailure();
    goto LABEL_31;
  }
  v60 = v21;
  v69.receiver = self;
  v69.super_class = (Class)HMBCloudDatabase;
  v22 = -[HMBCloudDatabase init](&v69, sel_init);
  v23 = v22;
  if (!v22)
    goto LABEL_22;
  objc_storeStrong((id *)&v22->_localDatabase, a3);
  objc_storeStrong((id *)&v23->_stateZone, obj);
  p_container = (id *)&v23->_container;
  objc_storeStrong((id *)&v23->_container, v58);
  v25 = objc_msgSend(v19, "copy");
  configuration = v23->_configuration;
  v23->_configuration = (HMBCloudDatabaseConfiguration *)v25;

  objc_storeStrong((id *)&v23->_credentialsAvailabilityListener, a9);
  objc_storeStrong((id *)&v23->_dataSource, a10);
  -[CKContainer publicCloudDatabase](v23->_container, "publicCloudDatabase");
  v27 = objc_claimAutoreleasedReturnValue();
  publicDatabase = v23->_publicDatabase;
  v23->_publicDatabase = (CKDatabase *)v27;

  objc_msgSend(v64, "objectForKeyedSubscript:", &unk_1E89476D0);
  v29 = objc_claimAutoreleasedReturnValue();
  publicDatabaseState = v23->_publicDatabaseState;
  v23->_publicDatabaseState = (HMBCloudDatabaseStateModel *)v29;

  -[HMBCloudDatabaseStateModel setDatabase:](v23->_publicDatabaseState, "setDatabase:", v23->_publicDatabase);
  if (!v23->_publicDatabaseState)
    goto LABEL_30;
  objc_msgSend(*p_container, "privateCloudDatabase");
  v31 = objc_claimAutoreleasedReturnValue();
  privateDatabase = v23->_privateDatabase;
  v23->_privateDatabase = (CKDatabase *)v31;

  objc_msgSend(v64, "objectForKeyedSubscript:", &unk_1E89476E8);
  v33 = objc_claimAutoreleasedReturnValue();
  privateDatabaseState = v23->_privateDatabaseState;
  v23->_privateDatabaseState = (HMBCloudDatabaseStateModel *)v33;

  -[HMBCloudDatabaseStateModel setDatabase:](v23->_privateDatabaseState, "setDatabase:", v23->_privateDatabase);
  if (!v23->_privateDatabaseState)
  {
LABEL_31:
    _HMFPreconditionFailure();
LABEL_32:
    _HMFPreconditionFailure();
  }
  objc_msgSend(*p_container, "sharedCloudDatabase");
  v35 = objc_claimAutoreleasedReturnValue();
  sharedDatabase = v23->_sharedDatabase;
  v23->_sharedDatabase = (CKDatabase *)v35;

  objc_msgSend(v64, "objectForKeyedSubscript:", &unk_1E8947700);
  v37 = objc_claimAutoreleasedReturnValue();
  sharedDatabaseState = v23->_sharedDatabaseState;
  v23->_sharedDatabaseState = (HMBCloudDatabaseStateModel *)v37;

  -[HMBCloudDatabaseStateModel setDatabase:](v23->_sharedDatabaseState, "setDatabase:", v23->_sharedDatabase);
  if (!v23->_sharedDatabaseState)
    goto LABEL_32;
  v59 = v18;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v20, "count"));
  v39 = objc_claimAutoreleasedReturnValue();
  zoneStateByZoneID = v23->_zoneStateByZoneID;
  v23->_zoneStateByZoneID = (NSMutableDictionary *)v39;

  v67 = 0u;
  v68 = 0u;
  v65 = 0u;
  v66 = 0u;
  obja = v20;
  v41 = v20;
  v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v65, v70, 16);
  if (v42)
  {
    v43 = v42;
    v44 = *(_QWORD *)v66;
    do
    {
      for (i = 0; i != v43; ++i)
      {
        if (*(_QWORD *)v66 != v44)
          objc_enumerationMutation(v41);
        v46 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * i);
        objc_msgSend(v46, "zoneID", obja);
        v47 = (void *)objc_claimAutoreleasedReturnValue();

        if (v47)
        {
          v48 = v23->_zoneStateByZoneID;
          objc_msgSend(v46, "zoneID");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKey:](v48, "setObject:forKey:", v46, v49);

        }
      }
      v43 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v65, v70, 16);
    }
    while (v43);
  }

  v50 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
  invitationOperationQueue = v23->_invitationOperationQueue;
  v23->_invitationOperationQueue = v50;

  -[NSOperationQueue setMaxConcurrentOperationCount:](v23->_invitationOperationQueue, "setMaxConcurrentOperationCount:", 1);
  -[NSOperationQueue setQualityOfService:](v23->_invitationOperationQueue, "setQualityOfService:", 17);
  v52 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
  databaseFetchOperationQueue = v23->_databaseFetchOperationQueue;
  v23->_databaseFetchOperationQueue = v52;

  -[NSOperationQueue setMaxConcurrentOperationCount:](v23->_databaseFetchOperationQueue, "setMaxConcurrentOperationCount:", 1);
  -[NSOperationQueue setQualityOfService:](v23->_databaseFetchOperationQueue, "setQualityOfService:", 25);
  cloudZoneFactory = v23->_cloudZoneFactory;
  v23->_cloudZoneFactory = &__block_literal_global_3348;

  v18 = v59;
  v20 = obja;
LABEL_22:

  return v23;
}

- (HMBCloudDatabase)initWithLocalDatabase:(id)a3 configuration:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  HMBCloudDatabase *v10;
  NSObject *v11;
  void *v12;
  HMBLocalZoneIDUnshared *v13;
  void *v14;
  void *v15;
  HMBLocalZoneIDUnshared *v16;
  HMBMutableLocalZoneConfiguration *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t i;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  HMBCloudID *v43;
  HMBCloudDatabaseStateModel *v44;
  void *v45;
  HMBCloudDatabaseStateModel *v46;
  void *v47;
  NSObject *v48;
  void *v49;
  void *v50;
  void *v51;
  HMBCloudID *v52;
  HMBCloudDatabaseStateModel *v53;
  void *v54;
  HMBCloudDatabaseStateModel *v55;
  void *v56;
  NSObject *v57;
  void *v58;
  void *v59;
  HMBCloudID *v60;
  HMBCloudDatabaseStateModel *v61;
  void *v62;
  HMBCloudDatabaseStateModel *v63;
  void *v64;
  NSObject *v65;
  void *v66;
  void *v67;
  HMBCloudID *v68;
  void *v69;
  NSObject *v70;
  void *v71;
  void *v72;
  id v73;
  uint64_t v74;
  void *v75;
  id v76;
  id v77;
  void *v78;
  NSObject *v79;
  void *v80;
  HMBCloudDatabase *v81;
  void *v82;
  id v83;
  NSObject *v84;
  void *v85;
  void *v86;
  HMBCloudCredentialsAvailabilityListener *v87;
  HMBCloudDatabaseDataSource *v88;
  id v90;
  void *v91;
  void *v92;
  void *v93;
  id v94;
  HMBMutableLocalZoneConfiguration *v95;
  HMBLocalZoneIDUnshared *v96;
  HMBCloudDatabase *v97;
  id v98;
  id v99;
  void *v100;
  void *v101;
  void *v102;
  id v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  id v108;
  uint8_t v109[4];
  void *v110;
  __int16 v111;
  HMBCloudID *v112;
  __int16 v113;
  HMBCloudDatabaseStateModel *v114;
  uint8_t buf[4];
  void *v116;
  __int16 v117;
  id v118;
  __int16 v119;
  void *v120;
  uint64_t v121;

  v121 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v6)
  {
    _HMFPreconditionFailure();
LABEL_46:
    _HMFPreconditionFailure();
  }
  v8 = v7;
  if (!v7)
    goto LABEL_46;
  v9 = (void *)MEMORY[0x1D17B6230]();
  v10 = self;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v116 = v12;
    v117 = 2112;
    v118 = v6;
    v119 = 2112;
    v120 = v8;
    _os_log_impl(&dword_1CCD48000, v11, OS_LOG_TYPE_INFO, "%{public}@Creating cloud database with localDatabase: %@ configuration: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v9);
  v13 = [HMBLocalZoneIDUnshared alloc];
  objc_msgSend(v8, "containerID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "containerIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[HMBLocalZoneIDUnshared initWithName:](v13, "initWithName:", v15);

  v17 = objc_alloc_init(HMBMutableLocalZoneConfiguration);
  -[HMBLocalZoneConfiguration setCreateIfNeeded:](v17, "setCreateIfNeeded:", 1);
  v103 = 0;
  objc_msgSend(v6, "openZoneWithZoneID:configuration:error:", v16, v17, &v103);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v103;
  if (v18)
  {
    v95 = v17;
    v98 = v6;
    v20 = objc_alloc_init(MEMORY[0x1E0C94C50]);
    objc_msgSend(v20, "setUseZoneWidePCS:", objc_msgSend(v8, "isManateeContainer"));
    v21 = objc_alloc(MEMORY[0x1E0C94C28]);
    objc_msgSend(v8, "containerID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v92 = v20;
    v23 = (void *)objc_msgSend(v21, "initWithContainerID:options:", v22, v20);

    objc_msgSend(v8, "sourceApplicationBundleIdentifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v91 = v23;
    objc_msgSend(v23, "setSourceApplicationBundleIdentifier:", v24);

    objc_msgSend(v8, "containerID");
    v90 = (id)objc_claimAutoreleasedReturnValue();
    v93 = v18;
    v25 = v18;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 3);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("A089A5B9-6D32-4A0E-B611-0492B7D9F3D5"));
    v28 = objc_opt_class();
    v108 = 0;
    v101 = (void *)v27;
    objc_msgSend(v25, "fetchModelsWithParentModelID:ofType:error:", v27, v28, &v108);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v99 = v108;
    if (!v29)
    {
      v30 = (void *)MEMORY[0x1D17B6230]();
      HMFGetOSLogHandle();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v116 = v32;
        v117 = 2112;
        v118 = v99;
        _os_log_impl(&dword_1CCD48000, v31, OS_LOG_TYPE_ERROR, "%{public}@Unable to load cloud database states: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v30);
    }
    v100 = v25;
    v94 = v19;
    v96 = v16;
    v97 = v10;
    v106 = 0u;
    v107 = 0u;
    v104 = 0u;
    v105 = 0u;
    v33 = v29;
    v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v104, buf, 16);
    if (v34)
    {
      v35 = v34;
      v36 = *(_QWORD *)v105;
      do
      {
        for (i = 0; i != v35; ++i)
        {
          if (*(_QWORD *)v105 != v36)
            objc_enumerationMutation(v33);
          v38 = *(void **)(*((_QWORD *)&v104 + 1) + 8 * i);
          objc_msgSend(v38, "cloudID");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = objc_msgSend(v39, "scope");

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v40);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "setObject:forKeyedSubscript:", v38, v41);

        }
        v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v104, buf, 16);
      }
      while (v35);
    }

    objc_msgSend(v26, "objectForKeyedSubscript:", &unk_1E89476D0);
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v42)
    {
      v43 = -[HMBCloudID initWithContainerID:scope:]([HMBCloudID alloc], "initWithContainerID:scope:", v90, 1);
      v44 = [HMBCloudDatabaseStateModel alloc];
      -[HMBCloudID modelID](v43, "modelID");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = -[HMBCloudDatabaseStateModel initWithModelID:parentModelID:](v44, "initWithModelID:parentModelID:", v45, v101);

      v47 = (void *)MEMORY[0x1D17B6230](-[HMBCloudDatabaseStateModel setCloudID:](v46, "setCloudID:", v43));
      HMFGetOSLogHandle();
      v48 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v109 = 138543874;
        v110 = v49;
        v111 = 2112;
        v112 = v43;
        v113 = 2112;
        v114 = v46;
        _os_log_impl(&dword_1CCD48000, v48, OS_LOG_TYPE_INFO, "%{public}@Created public database state model with cloudID %@: %@", v109, 0x20u);

      }
      objc_autoreleasePoolPop(v47);
      objc_msgSend(v26, "setObject:forKeyedSubscript:", v46, &unk_1E89476D0);
      objc_msgSend(v102, "addObject:", v46);

    }
    objc_msgSend(v26, "objectForKeyedSubscript:", &unk_1E89476E8);
    v50 = (void *)objc_claimAutoreleasedReturnValue();

    v51 = v102;
    if (!v50)
    {
      v52 = -[HMBCloudID initWithContainerID:scope:]([HMBCloudID alloc], "initWithContainerID:scope:", v90, 2);
      v53 = [HMBCloudDatabaseStateModel alloc];
      -[HMBCloudID modelID](v52, "modelID");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = -[HMBCloudDatabaseStateModel initWithModelID:parentModelID:](v53, "initWithModelID:parentModelID:", v54, v101);

      v56 = (void *)MEMORY[0x1D17B6230](-[HMBCloudDatabaseStateModel setCloudID:](v55, "setCloudID:", v52));
      HMFGetOSLogHandle();
      v57 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v109 = 138543874;
        v110 = v58;
        v111 = 2112;
        v112 = v52;
        v113 = 2112;
        v114 = v55;
        _os_log_impl(&dword_1CCD48000, v57, OS_LOG_TYPE_INFO, "%{public}@Created private database state model with cloudID %@: %@", v109, 0x20u);

      }
      objc_autoreleasePoolPop(v56);
      objc_msgSend(v26, "setObject:forKeyedSubscript:", v55, &unk_1E89476E8);
      v51 = v102;
      objc_msgSend(v102, "addObject:", v55);

    }
    objc_msgSend(v26, "objectForKeyedSubscript:", &unk_1E8947700);
    v59 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v59)
    {
      v60 = -[HMBCloudID initWithContainerID:scope:]([HMBCloudID alloc], "initWithContainerID:scope:", v90, 3);
      v61 = [HMBCloudDatabaseStateModel alloc];
      -[HMBCloudID modelID](v60, "modelID");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = -[HMBCloudDatabaseStateModel initWithModelID:parentModelID:](v61, "initWithModelID:parentModelID:", v62, v101);

      v64 = (void *)MEMORY[0x1D17B6230](-[HMBCloudDatabaseStateModel setCloudID:](v63, "setCloudID:", v60));
      HMFGetOSLogHandle();
      v65 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v109 = 138543874;
        v110 = v66;
        v111 = 2112;
        v112 = v60;
        v113 = 2112;
        v114 = v63;
        _os_log_impl(&dword_1CCD48000, v65, OS_LOG_TYPE_INFO, "%{public}@Created shared database state model with cloudID %@: %@", v109, 0x20u);

      }
      objc_autoreleasePoolPop(v64);
      objc_msgSend(v26, "setObject:forKeyedSubscript:", v63, &unk_1E8947700);
      v51 = v102;
      objc_msgSend(v102, "addObject:", v63);

    }
    v67 = v100;
    if (objc_msgSend(v51, "count"))
    {
      objc_msgSend(v100, "update:", v51);
      v68 = (HMBCloudID *)objc_claimAutoreleasedReturnValue();
      if (v68)
      {
        v69 = (void *)MEMORY[0x1D17B6230]();
        HMFGetOSLogHandle();
        v70 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v109 = 138543618;
          v110 = v71;
          v111 = 2112;
          v112 = v68;
          _os_log_impl(&dword_1CCD48000, v70, OS_LOG_TYPE_ERROR, "%{public}@Unable to update cloud database models: %@", v109, 0x16u);

          v67 = v100;
        }

        objc_autoreleasePoolPop(v69);
        v51 = v102;
      }

    }
    v72 = (void *)objc_msgSend(v26, "copy");

    v73 = v67;
    v74 = objc_opt_class();
    *(_QWORD *)&v104 = 0;
    objc_msgSend(v73, "fetchModelsOfType:error:", v74, &v104);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    v76 = (id)v104;
    if (v75)
    {
      v77 = v75;
    }
    else
    {
      v82 = (void *)MEMORY[0x1D17B6230]();
      v83 = v73;
      HMFGetOSLogHandle();
      v84 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v84, OS_LOG_TYPE_FAULT))
      {
        HMFGetLogIdentifier();
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v116 = v85;
        v117 = 2112;
        v118 = v76;
        _os_log_impl(&dword_1CCD48000, v84, OS_LOG_TYPE_FAULT, "%{public}@Unable to load zone model state: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v82);
      objc_msgSend(MEMORY[0x1E0C99E60], "set");
      v77 = (id)objc_claimAutoreleasedReturnValue();
    }
    v86 = v77;

    v87 = -[HMBCloudCredentialsAvailabilityListener initWithContainer:]([HMBCloudCredentialsAvailabilityListener alloc], "initWithContainer:", v91);
    v88 = objc_alloc_init(HMBCloudDatabaseDataSource);
    v6 = v98;
    v10 = -[HMBCloudDatabase initWithLocalDatabase:stateZone:container:configuration:databaseStateModelsByScope:zoneStateModels:credentialsAvailabilityListener:dataSource:](v97, "initWithLocalDatabase:stateZone:container:configuration:databaseStateModelsByScope:zoneStateModels:credentialsAvailabilityListener:dataSource:", v98, v73, v91, v8, v72, v86, v87, v88);

    v81 = v10;
    v17 = v95;
    v16 = v96;
    v18 = v93;
    v19 = v94;
  }
  else
  {
    v78 = (void *)MEMORY[0x1D17B6230]();
    HMFGetOSLogHandle();
    v79 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v116 = v80;
      v117 = 2112;
      v118 = v19;
      _os_log_impl(&dword_1CCD48000, v79, OS_LOG_TYPE_ERROR, "%{public}@Failed to create state zone for database: %@", buf, 0x16u);

      v18 = 0;
    }

    objc_autoreleasePoolPop(v78);
    v81 = 0;
  }

  return v81;
}

- (CKContainerID)containerID
{
  void *v2;
  void *v3;

  -[HMBCloudDatabase container](self, "container");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "containerID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CKContainerID *)v3;
}

- (NAScheduler)operationScheduler
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0D519E8];
  -[HMBCloudDatabase configuration](self, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "operationQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "schedulerWithDispatchQueue:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NAScheduler *)v5;
}

- (id)performInitialCloudSync
{
  os_unfair_lock_s *p_propertyLock;
  NAFuture *initialCloudSyncFuture;
  NAFuture *v5;
  void *v6;
  HMBCloudDatabase *v7;
  NSObject *v8;
  void *v9;
  NAFuture *v10;
  NAFuture *v11;
  int v13;
  void *v14;
  __int16 v15;
  NAFuture *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  p_propertyLock = &self->_propertyLock;
  os_unfair_lock_lock_with_options();
  initialCloudSyncFuture = self->_initialCloudSyncFuture;
  if (initialCloudSyncFuture)
  {
    v5 = initialCloudSyncFuture;
    os_unfair_lock_unlock(p_propertyLock);
    v6 = (void *)MEMORY[0x1D17B6230]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543618;
      v14 = v9;
      v15 = 2112;
      v16 = v5;
      _os_log_impl(&dword_1CCD48000, v8, OS_LOG_TYPE_INFO, "%{public}@Returning existing initial cloud sync future: %@", (uint8_t *)&v13, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
  }
  else
  {
    v10 = (NAFuture *)objc_alloc_init(MEMORY[0x1E0D519C0]);
    v11 = self->_initialCloudSyncFuture;
    self->_initialCloudSyncFuture = v10;

    v5 = self->_initialCloudSyncFuture;
    os_unfair_lock_unlock(p_propertyLock);
    -[HMBCloudDatabase _performInitialCloudSync](self, "_performInitialCloudSync");
  }
  return v5;
}

- (void)_performInitialCloudSync
{
  void *v3;
  HMBCloudDatabase *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  HMBCloudDatabase *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  HMBCloudDatabase *v18;
  void *v19;
  HMBCloudDatabase *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  _QWORD v26[5];
  _QWORD v27[5];
  __int128 buf;
  void (*v29)(uint64_t, void *);
  void *v30;
  HMBCloudDatabase *v31;
  char v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D17B6230](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v6;
    _os_log_impl(&dword_1CCD48000, v5, OS_LOG_TYPE_INFO, "%{public}@Performing initial cloud sync", (uint8_t *)&buf, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  __waitForAccountAvailability(v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v8);

  -[HMBCloudDatabase configuration](v4, "configuration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "subscriptionPushRegistrationAction");

  if (v10 == 1)
  {
    v11 = 1;
    goto LABEL_7;
  }
  if (v10 == 2)
  {
    v11 = 0;
LABEL_7:
    -[HMBCloudDatabase _updateAPSRegistration:](v4, "_updateAPSRegistration:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v12);

  }
  v13 = v4;
  v14 = (void *)MEMORY[0x1E0D519C0];
  v15 = MEMORY[0x1E0C809B0];
  *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
  *((_QWORD *)&buf + 1) = 3221225472;
  v29 = ____synchronizeAllZoneState_block_invoke;
  v30 = &unk_1E89323D8;
  v31 = v13;
  v32 = 0;
  objc_msgSend(MEMORY[0x1E0D519E8], "immediateScheduler");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "lazyFutureWithBlock:scheduler:", &buf, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "addObject:", v17);
  v18 = v13;
  v19 = (void *)MEMORY[0x1E0D519C0];
  *(_QWORD *)&buf = v15;
  *((_QWORD *)&buf + 1) = 3221225472;
  v29 = ____removeDeletedZones_block_invoke;
  v30 = &unk_1E8932450;
  v31 = v18;
  v20 = v18;
  -[HMBCloudDatabase operationScheduler](v20, "operationScheduler");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "lazyFutureWithBlock:scheduler:", &buf, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "addObject:", v22);
  objc_msgSend(MEMORY[0x1E0D519C0], "chainFutures:", v7);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v15;
  v27[1] = 3221225472;
  v27[2] = __44__HMBCloudDatabase__performInitialCloudSync__block_invoke;
  v27[3] = &unk_1E89332C0;
  v27[4] = v20;
  objc_msgSend(v23, "addSuccessBlock:", v27);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v15;
  v26[1] = 3221225472;
  v26[2] = __44__HMBCloudDatabase__performInitialCloudSync__block_invoke_39;
  v26[3] = &unk_1E89327A8;
  v26[4] = v20;
  v25 = (id)objc_msgSend(v24, "addFailureBlock:", v26);

}

- (id)_updateAPSRegistration:(BOOL)a3
{
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  BOOL v11;
  id location;

  objc_initWeak(&location, self);
  v5 = (void *)MEMORY[0x1E0D519C0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __43__HMBCloudDatabase__updateAPSRegistration___block_invoke;
  v9[3] = &unk_1E89322B0;
  objc_copyWeak(&v10, &location);
  v11 = a3;
  -[HMBCloudDatabase operationScheduler](self, "operationScheduler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lazyFutureWithBlock:scheduler:", v9, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
  return v7;
}

- (void)addContainerOperation:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HMBCloudDatabase container](self, "container");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addOperation:", v4);

}

- (void)addDatabaseOperation:(id)a3 forScope:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v6 = a3;
  switch(a4)
  {
    case 3:
      v9 = v6;
      -[HMBCloudDatabase sharedDatabase](self, "sharedDatabase");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 2:
      v9 = v6;
      -[HMBCloudDatabase privateDatabase](self, "privateDatabase");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 1:
      v9 = v6;
      -[HMBCloudDatabase publicDatabase](self, "publicDatabase");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:
      v8 = v7;
      objc_msgSend(v7, "addOperation:", v9);

      v6 = v9;
      break;
  }

}

- (id)synchronizeZoneStateForZoneIDs:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, void *, void *);
  void *v12;
  HMBCloudDatabase *v13;
  id v14;

  objc_msgSend(a3, "na_dictionaryByBucketingObjectsUsingKeyGenerator:", &__block_literal_global_48);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __51__HMBCloudDatabase_synchronizeZoneStateForZoneIDs___block_invoke_2;
  v12 = &unk_1E8932318;
  v13 = self;
  v14 = v5;
  v6 = v5;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", &v9);
  objc_msgSend(MEMORY[0x1E0D519C0], "chainFutures:", v6, v9, v10, v11, v12, v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)shutdown
{
  return (id)objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
}

- (void)handleCreatedZoneIDs:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  HMBCloudDatabase *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  HMBCloudDatabase *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  char v21;
  id obj;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  uint64_t v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMBCloudDatabase delegate](self, "delegate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_opt_respondsToSelector();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = v4;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v24 != v6)
          objc_enumerationMutation(obj);
        v8 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
        v9 = (void *)MEMORY[0x1D17B6230]();
        v10 = self;
        HMFGetOSLogHandle();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v28 = v12;
          v29 = 2112;
          v30 = v8;
          _os_log_impl(&dword_1CCD48000, v11, OS_LOG_TYPE_INFO, "%{public}@Handling created zone ID: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v9);
        os_unfair_lock_lock_with_options();
        -[HMBCloudDatabase zoneStateByZoneID](v10, "zoneStateByZoneID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectForKey:", v8);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "cloudZone");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        os_unfair_lock_unlock(&v10->_propertyLock);
        if ((objc_msgSend(v15, "isZoneRebuildInProgress") & 1) != 0)
        {
          v16 = (void *)MEMORY[0x1D17B6230]();
          v17 = v10;
          HMFGetOSLogHandle();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v28 = v19;
            v29 = 2112;
            v30 = v8;
            _os_log_impl(&dword_1CCD48000, v18, OS_LOG_TYPE_INFO, "%{public}@Due to rebuild, suppressing normal create behavior for zone with ID: %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v16);
        }
        else if ((v21 & 1) != 0)
        {
          objc_msgSend(v20, "cloudDatabase:didCreateZoneWithID:", v10, v8);
        }

      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    }
    while (v5);
  }

}

- (void)handleUpdatedZonesIDs:(id)a3
{
  id v4;
  uint64_t i;
  uint64_t v6;
  void *v7;
  HMBCloudDatabase *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  HMBCloudDatabase *v13;
  NSObject *v14;
  HMBCloudDatabase *v15;
  id v16;
  void *v17;
  int v18;
  void *v19;
  HMBCloudDatabase *v20;
  NSObject *v21;
  _BOOL4 v22;
  void *v23;
  void *v24;
  HMBCloudDatabase *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  void *v32;
  id obj;
  void *context;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t buf[4];
  id v43;
  __int16 v44;
  uint64_t v45;
  __int16 v46;
  void *v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  obj = v4;
  v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v48, 16);
  if (v36)
  {
    v35 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v36; ++i)
      {
        if (*(_QWORD *)v39 != v35)
          objc_enumerationMutation(obj);
        v6 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * i);
        v7 = (void *)MEMORY[0x1D17B6230]();
        v8 = self;
        HMFGetOSLogHandle();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v43 = v10;
          v44 = 2112;
          v45 = v6;
          _os_log_impl(&dword_1CCD48000, v9, OS_LOG_TYPE_INFO, "%{public}@Handling updated zone ID: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v7);
        os_unfair_lock_lock_with_options();
        -[HMBCloudDatabase zoneStateByZoneID](v8, "zoneStateByZoneID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKey:", v6);
        v37 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v37, "cloudZone");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v37)
        {
          context = (void *)MEMORY[0x1D17B6230]();
          v13 = v8;
          HMFGetOSLogHandle();
          v14 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            v15 = self;
            HMFGetLogIdentifier();
            v16 = (id)objc_claimAutoreleasedReturnValue();
            -[HMBCloudDatabase zoneStateByZoneID](v13, "zoneStateByZoneID");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v43 = v16;
            v44 = 2112;
            v45 = v6;
            v46 = 2112;
            v47 = v17;
            _os_log_impl(&dword_1CCD48000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@Got update for a zone ID %@ we don't have state for. All zone states: %@", buf, 0x20u);

            self = v15;
          }

          objc_autoreleasePoolPop(context);
          objc_msgSend(v32, "addObject:", v6);
        }
        os_unfair_lock_unlock(&v8->_propertyLock);
        if (v12)
        {
          v18 = objc_msgSend(v12, "isZoneRebuildInProgress");
          v19 = (void *)MEMORY[0x1D17B6230]();
          v20 = v8;
          HMFGetOSLogHandle();
          v21 = objc_claimAutoreleasedReturnValue();
          v22 = os_log_type_enabled(v21, OS_LOG_TYPE_INFO);
          if (v18)
          {
            if (v22)
            {
              HMFGetLogIdentifier();
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v43 = v23;
              v44 = 2112;
              v45 = v6;
              _os_log_impl(&dword_1CCD48000, v21, OS_LOG_TYPE_INFO, "%{public}@Normal update behavior for suppressed due to rebuild for zoneID: %@", buf, 0x16u);

            }
            objc_autoreleasePoolPop(v19);
            objc_msgSend(v12, "handleZoneChangedNotification");
          }
          else
          {
            if (v22)
            {
              HMFGetLogIdentifier();
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v43 = v28;
              v44 = 2112;
              v45 = v6;
              _os_log_impl(&dword_1CCD48000, v21, OS_LOG_TYPE_INFO, "%{public}@Performing cloud pull for open cloud zone with updated zoneID: %@", buf, 0x16u);

            }
            objc_autoreleasePoolPop(v19);
            +[HMBProcessingOptions optionsWithLabel:](HMBProcessingOptions, "optionsWithLabel:", CFSTR("Fetch due to Subscription Push"));
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = (id)objc_msgSend(v12, "performCloudPullWithOptions:", v29);

          }
        }
        else
        {
          v24 = (void *)MEMORY[0x1D17B6230]();
          v25 = v8;
          HMFGetOSLogHandle();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v43 = v27;
            v44 = 2112;
            v45 = v6;
            _os_log_impl(&dword_1CCD48000, v26, OS_LOG_TYPE_INFO, "%{public}@No open HMBCloudZone exists for zoneID %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v24);
        }

      }
      v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v48, 16);
    }
    while (v36);
  }

  if (objc_msgSend(v32, "count"))
    v31 = -[HMBCloudDatabase synchronizeZoneStateForZoneIDs:](self, "synchronizeZoneStateForZoneIDs:", v32);

}

- (void)handleRemovedZoneIDs:(id)a3 userInitiated:(BOOL)a4
{
  uint64_t i;
  void *v5;
  void *v6;
  HMBCloudDatabase *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  HMBCloudDatabase *v14;
  NSObject *v15;
  void *v16;
  HMBCloudDatabase *v17;
  id v18;
  void *v19;
  HMBLocalZoneConfiguration *v20;
  void *v21;
  id v22;
  void *v23;
  char v24;
  id v25;
  void *v26;
  HMBCloudDatabase *v27;
  NSObject *v28;
  void *v29;
  HMBCloudDatabase *v30;
  void *v31;
  void *v32;
  id obj;
  uint64_t v35;
  uint64_t v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  id v42;
  id v43;
  uint8_t v44[128];
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  id v48;
  __int16 v49;
  id v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  obj = a3;
  v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
  if (v37)
  {
    v35 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v37; ++i)
      {
        if (*(_QWORD *)v39 != v35)
          objc_enumerationMutation(obj);
        v5 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
        v6 = (void *)MEMORY[0x1D17B6230]();
        v7 = self;
        HMFGetOSLogHandle();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v46 = v9;
          v47 = 2112;
          v48 = v5;
          _os_log_impl(&dword_1CCD48000, v8, OS_LOG_TYPE_INFO, "%{public}@Handling removed zone ID: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v6);
        os_unfair_lock_lock_with_options();
        -[HMBCloudDatabase zoneStateByZoneID](v7, "zoneStateByZoneID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKey:", v5);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "cloudZone");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        os_unfair_lock_unlock(&v7->_propertyLock);
        if (objc_msgSend(v12, "isZoneRebuildInProgress") && !a4)
        {
          v13 = (void *)MEMORY[0x1D17B6230]();
          v14 = v7;
          HMFGetOSLogHandle();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v46 = v16;
            v47 = 2112;
            v48 = v5;
            _os_log_impl(&dword_1CCD48000, v15, OS_LOG_TYPE_INFO, "%{public}@Normal remove behavior for zone %@ suppressed due to rebuild.", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v13);
          goto LABEL_25;
        }
        v17 = v7;
        v18 = v5;
        -[HMBCloudDatabase localDatabase](v17, "localDatabase");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_alloc_init(HMBLocalZoneConfiguration);
        v43 = 0;
        objc_msgSend(v19, "openZoneWithZoneID:configuration:error:", v18, v20, &v43);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = v43;

        if (!v21)
        {
          v26 = (void *)MEMORY[0x1D17B6230]();
          v27 = v17;
          HMFGetOSLogHandle();
          v28 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v46 = v29;
            v47 = 2112;
            v48 = v18;
            v49 = 2112;
            v50 = v22;
            _os_log_impl(&dword_1CCD48000, v28, OS_LOG_TYPE_ERROR, "%{public}@Failed to open local zone with ID %@ for removal: %@", buf, 0x20u);

          }
          goto LABEL_21;
        }
        -[HMBCloudDatabase localDatabase](v17, "localDatabase");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = v22;
        v24 = objc_msgSend(v23, "removeLocalDataForZone:error:", v21, &v42);
        v25 = v42;

        if ((v24 & 1) == 0)
        {
          v26 = (void *)MEMORY[0x1D17B6230]();
          v30 = v17;
          HMFGetOSLogHandle();
          v28 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v46 = v31;
            v47 = 2112;
            v48 = v21;
            v49 = 2112;
            v50 = v25;
            _os_log_impl(&dword_1CCD48000, v28, OS_LOG_TYPE_ERROR, "%{public}@Failed to remove local data for zone %@: %@", buf, 0x20u);

          }
          v22 = v25;
LABEL_21:

          objc_autoreleasePoolPop(v26);
          goto LABEL_22;
        }
        v22 = v25;
LABEL_22:

        -[HMBCloudDatabase removeStateForZoneID:](v17, "removeStateForZoneID:", v18);
        -[HMBCloudDatabase delegate](v17, "delegate");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v32, "cloudDatabase:didRemoveZoneWithID:", v17, v18);

LABEL_25:
      }
      v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
    }
    while (v37);
  }

}

- (id)openOrCreatePrivateZoneWithID:(id)a3 configuration:(id)a4 delegate:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  HMBCloudDatabase *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void *)MEMORY[0x1D17B6230]();
  v14 = self;
  HMFGetOSLogHandle();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v20 = v16;
    v21 = 2112;
    v22 = v10;
    _os_log_impl(&dword_1CCD48000, v15, OS_LOG_TYPE_INFO, "%{public}@Asked to open or create private zone with ID: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v13);
  -[HMBCloudDatabase _openOrCreateZoneWithScope:recordZoneID:delegate:shouldCreate:configuration:existingCloudZone:error:](v14, "_openOrCreateZoneWithScope:recordZoneID:delegate:shouldCreate:configuration:existingCloudZone:error:", 2, v10, v12, 1, v11, 0, a6);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)openExistingPrivateZoneWithID:(id)a3 configuration:(id)a4 delegate:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  HMBCloudDatabase *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void *)MEMORY[0x1D17B6230]();
  v14 = self;
  HMFGetOSLogHandle();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v20 = v16;
    v21 = 2112;
    v22 = v10;
    _os_log_impl(&dword_1CCD48000, v15, OS_LOG_TYPE_INFO, "%{public}@Asked to open existing private zone with ID: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v13);
  -[HMBCloudDatabase _openOrCreateZoneWithScope:recordZoneID:delegate:shouldCreate:configuration:existingCloudZone:error:](v14, "_openOrCreateZoneWithScope:recordZoneID:delegate:shouldCreate:configuration:existingCloudZone:error:", 2, v10, v12, 0, v11, 0, a6);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)openExistingSharedZoneWithID:(id)a3 configuration:(id)a4 delegate:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  HMBCloudDatabase *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void *)MEMORY[0x1D17B6230]();
  v14 = self;
  HMFGetOSLogHandle();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v20 = v16;
    v21 = 2112;
    v22 = v10;
    _os_log_impl(&dword_1CCD48000, v15, OS_LOG_TYPE_INFO, "%{public}@Asked to open existing shared zone with ID: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v13);
  -[HMBCloudDatabase _openOrCreateZoneWithScope:recordZoneID:delegate:shouldCreate:configuration:existingCloudZone:error:](v14, "_openOrCreateZoneWithScope:recordZoneID:delegate:shouldCreate:configuration:existingCloudZone:error:", 3, v10, v12, 0, v11, 0, a6);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (BOOL)reopenOrRecreatePrivateZone:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  BOOL v16;
  HMBCloudDatabase *v18;
  SEL v19;
  int64_t v20;
  id v21;
  id v22;
  BOOL v23;
  id v24;
  id v25;
  id *v26;

  v6 = a3;
  objc_msgSend(v6, "cloudZoneID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "scope");

  if (v8 == 2)
  {
    objc_msgSend(v6, "cloudZoneID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "scope");
    objc_msgSend(v6, "cloudZoneID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "zoneID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "configuration");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMBCloudDatabase _openOrCreateZoneWithScope:recordZoneID:delegate:shouldCreate:configuration:existingCloudZone:error:](self, "_openOrCreateZoneWithScope:recordZoneID:delegate:shouldCreate:configuration:existingCloudZone:error:", v10, v12, v13, 1, v14, v6, a4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15 != 0;

    return v16;
  }
  else
  {
    v18 = (HMBCloudDatabase *)_HMFPreconditionFailure();
    return -[HMBCloudDatabase _openOrCreateZoneWithScope:recordZoneID:delegate:shouldCreate:configuration:existingCloudZone:error:](v18, v19, v20, v21, v22, v23, v24, v25, v26);
  }
}

- (id)_openOrCreateZoneWithScope:(int64_t)a3 recordZoneID:(id)a4 delegate:(id)a5 shouldCreate:(BOOL)a6 configuration:(id)a7 existingCloudZone:(id)a8 error:(id *)a9
{
  id v15;
  id v16;
  HMBCloudZoneID *v17;
  void *v18;
  HMBCloudZoneID *v19;
  void *v20;
  HMBCloudZoneStateModel *v21;
  HMBCloudZoneID *v22;
  HMBCloudZoneID *v23;
  uint64_t v24;
  void *v25;
  BOOL v26;
  char v28;
  void *v29;
  HMBCloudDatabase *v30;
  NSObject *v31;
  void *v32;
  HMBCloudZoneID *v33;
  void *v34;
  HMBCloudDatabase *v35;
  NSObject *v36;
  void *v37;
  HMBCloudZoneStateModel *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  HMBCloudZoneID *v44;
  void *v45;
  HMBCloudDatabase *v46;
  NSObject *v47;
  void *v48;
  void *v49;
  HMBCloudDatabase *v50;
  NSObject *v51;
  void *v52;
  HMBCloudZoneID *v53;
  NSObject *v54;
  void *v55;
  void *v56;
  HMBCloudDatabase *v57;
  NSObject *v58;
  void *v59;
  NSObject *v60;
  void *v61;
  void (**v62)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v64;
  os_unfair_lock_t lock;
  id v66;
  HMBCloudZoneID *v67;
  HMBCloudZoneStateModel *v68;
  uint8_t buf[4];
  void *v70;
  __int16 v71;
  HMBCloudZoneID *v72;
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v15 = a4;
  v16 = a5;
  v66 = a7;
  v67 = (HMBCloudZoneID *)a8;
  v17 = [HMBCloudZoneID alloc];
  -[HMBCloudDatabase containerID](self, "containerID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[HMBCloudZoneID initWithContainerID:scope:zoneID:](v17, "initWithContainerID:scope:zoneID:", v18, a3, v15);

  lock = &self->_propertyLock;
  os_unfair_lock_lock_with_options();
  -[HMBCloudDatabase zoneStateByZoneID](self, "zoneStateByZoneID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "objectForKey:", v19);
  v21 = (HMBCloudZoneStateModel *)objc_claimAutoreleasedReturnValue();

  if (v21)
    goto LABEL_2;
  if (!a6)
  {
    v56 = (void *)MEMORY[0x1D17B6230]();
    v57 = self;
    HMFGetOSLogHandle();
    v58 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v70 = v59;
      v71 = 2112;
      v72 = v19;
      _os_log_impl(&dword_1CCD48000, v58, OS_LOG_TYPE_INFO, "%{public}@No cloud zone state found with ID: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v56);
    if (a9)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 2);
      v33 = 0;
      *a9 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_46;
    }
LABEL_38:
    v33 = 0;
    goto LABEL_46;
  }
  if (a3 != 2)
  {
    _HMFPreconditionFailure();
    __break(1u);
  }
  v34 = (void *)MEMORY[0x1D17B6230]();
  v35 = self;
  HMFGetOSLogHandle();
  v36 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v70 = v37;
    v71 = 2112;
    v72 = v19;
    _os_log_impl(&dword_1CCD48000, v36, OS_LOG_TYPE_INFO, "%{public}@Creating state for cloud zone with ID %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v34);
  v38 = [HMBCloudZoneStateModel alloc];
  -[HMBCloudID modelID](v19, "modelID");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMBCloudDatabase privateDatabaseState](v35, "privateDatabaseState");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "hmbModelID");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[HMBCloudZoneStateModel initWithModelID:parentModelID:](v38, "initWithModelID:parentModelID:", v39, v41);

  -[HMBCloudZoneStateModel setZoneID:](v21, "setZoneID:", v19);
  -[HMBCloudZoneStateModel setNeedsZoneCreation:](v21, "setNeedsZoneCreation:", MEMORY[0x1E0C9AAB0]);
  -[HMBCloudDatabase stateZone](v35, "stateZone");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = v21;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v68, 1);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "update:", v43);
  v44 = (HMBCloudZoneID *)objc_claimAutoreleasedReturnValue();

  if (v44)
  {
    v45 = (void *)MEMORY[0x1D17B6230]();
    v46 = v35;
    HMFGetOSLogHandle();
    v47 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v70 = v48;
      v71 = 2112;
      v72 = v44;
      _os_log_impl(&dword_1CCD48000, v47, OS_LOG_TYPE_ERROR, "%{public}@Unable to save new zone to database: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v45);
    if (a9)
      *a9 = objc_retainAutorelease(v44);

    goto LABEL_38;
  }
  -[HMBCloudDatabase zoneStateByZoneID](v35, "zoneStateByZoneID");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "setObject:forKey:", v21, v19);

LABEL_2:
  -[HMBCloudZoneStateModel cloudZone](v21, "cloudZone");
  v22 = (HMBCloudZoneID *)objc_claimAutoreleasedReturnValue();
  v23 = v22;
  if (v22)
  {
    -[HMBCloudZoneID delegate](v22, "delegate");
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = (void *)v24;
    if (v16)
      v26 = v24 == 0;
    else
      v26 = 1;
    v28 = v26 || v24 == (_QWORD)v16;
    v29 = (void *)MEMORY[0x1D17B6230]();
    v30 = self;
    if ((v28 & 1) != 0)
    {
      HMFGetOSLogHandle();
      v31 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v70 = v32;
        v71 = 2112;
        v72 = v23;
        _os_log_impl(&dword_1CCD48000, v31, OS_LOG_TYPE_INFO, "%{public}@Using existing HMBCloudZone instance: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v29);
      v33 = v23;
    }
    else
    {
      HMFGetOSLogHandle();
      v54 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v70 = v55;
        v71 = 2112;
        v72 = v19;
        _os_log_impl(&dword_1CCD48000, v54, OS_LOG_TYPE_ERROR, "%{public}@Cannot set a delegate on cloud zone with identifier %@ because that cloud zone has already been opened with a different delegate", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v29);
      if (a9)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 1);
        v33 = 0;
        *a9 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v33 = 0;
      }
    }

  }
  else
  {
    v49 = (void *)MEMORY[0x1D17B6230]();
    v50 = self;
    if (v67)
    {
      HMFGetOSLogHandle();
      v51 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v70 = v52;
        v71 = 2112;
        v72 = v67;
        _os_log_impl(&dword_1CCD48000, v51, OS_LOG_TYPE_INFO, "%{public}@Using re-opened HMBCloudZone instance: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v49);
      v53 = v67;
    }
    else
    {
      HMFGetOSLogHandle();
      v60 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v70 = v61;
        v71 = 2112;
        v72 = v19;
        _os_log_impl(&dword_1CCD48000, v60, OS_LOG_TYPE_INFO, "%{public}@Creating new HMBCloudZone instance with ID: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v49);
      -[HMBCloudDatabase cloudZoneFactory](v50, "cloudZoneFactory");
      v62 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, HMBCloudDatabase *, id, HMBCloudZoneStateModel *))v62)[2](v62, v50, v66, v21);
      v53 = (HMBCloudZoneID *)objc_claimAutoreleasedReturnValue();

      -[HMBCloudZoneID setDelegate:](v53, "setDelegate:", v16);
    }
    -[HMBCloudZoneStateModel setCloudZone:](v21, "setCloudZone:", v53);
    v23 = v53;
    v33 = v23;
  }

LABEL_46:
  os_unfair_lock_unlock(lock);

  return v33;
}

- (id)removeZoneWithID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD *v15;
  HMBCloudDatabase *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  _QWORD v32[4];
  HMBCloudDatabase *v33;
  id v34;
  _QWORD v35[5];
  id v36;
  _QWORD v37[5];
  id v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  id v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMBCloudDatabase updateNeedsZoneDeletion:forZoneWithID:](self, "updateNeedsZoneDeletion:forZoneWithID:", 1, v4);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMBCloudDatabase delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v6, "cloudDatabase:willRemoveZoneWithID:", self, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v7);

  }
  v8 = objc_msgSend(v4, "scope");
  v9 = MEMORY[0x1E0C809B0];
  v10 = 0x1E0D51000uLL;
  switch(v8)
  {
    case 1:
      v15 = MEMORY[0x1D17B6230](&off_1CCDCD000);
      v16 = self;
      HMFGetOSLogHandle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v40 = v18;
        v41 = 2112;
        v42 = v4;
        _os_log_impl(&dword_1CCD48000, v17, OS_LOG_TYPE_ERROR, "%{public}@Unable to remove zone with public zoneID: %@", buf, 0x16u);

        v10 = 0x1E0D51000;
      }

      objc_autoreleasePoolPop(v15);
      -[HMBCloudDatabase updateNeedsZoneDeletion:forZoneWithID:](v16, "updateNeedsZoneDeletion:forZoneWithID:", 0, v4);
      v19 = (void *)MEMORY[0x1E0D519C0];
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 5);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "futureWithError:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v21);

      break;
    case 3:
      v22 = (void *)MEMORY[0x1E0D519C0];
      v35[0] = MEMORY[0x1E0C809B0];
      v35[1] = 3221225472;
      v35[2] = __37__HMBCloudDatabase_removeZoneWithID___block_invoke_2;
      v35[3] = &unk_1E8933550;
      v35[4] = self;
      v36 = v4;
      objc_msgSend(MEMORY[0x1E0D519E8], "immediateScheduler");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "lazyFutureWithBlock:scheduler:", v35, v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "addObject:", v24);
      v14 = v36;
      goto LABEL_11;
    case 2:
      v11 = (void *)MEMORY[0x1E0D519C0];
      v37[0] = MEMORY[0x1E0C809B0];
      v37[1] = 3221225472;
      v37[2] = __37__HMBCloudDatabase_removeZoneWithID___block_invoke;
      v37[3] = &unk_1E8933550;
      v37[4] = self;
      v38 = v4;
      objc_msgSend(MEMORY[0x1E0D519E8], "immediateScheduler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "lazyFutureWithBlock:scheduler:", v37, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "addObject:", v13);
      v14 = v38;
LABEL_11:

      break;
  }
  v25 = (void *)MEMORY[0x1E0D519C0];
  v32[0] = v9;
  v32[1] = 3221225472;
  v32[2] = __37__HMBCloudDatabase_removeZoneWithID___block_invoke_71;
  v32[3] = &unk_1E8933550;
  v33 = self;
  v34 = v4;
  v26 = *(void **)(v10 + 2536);
  v27 = v4;
  objc_msgSend(v26, "immediateScheduler", v9, 3221225472, __37__HMBCloudDatabase_removeZoneWithID___block_invoke_71, &unk_1E8933550, v33);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "lazyFutureWithBlock:scheduler:", v32, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "addObject:", v29);
  objc_msgSend(MEMORY[0x1E0D519C0], "chainFutures:", v5);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  return v30;
}

- (BOOL)retryCloudKitOperation:(id)a3 afterError:(id)a4 retryBlock:(id)a5
{
  id v8;
  id v9;

  v8 = a5;
  v9 = a4;
  -[HMBCloudDatabase notifyDelegateOfError:forOperation:](self, "notifyDelegateOfError:forOperation:", v9, a3);
  LOBYTE(a3) = -[HMBCloudDatabase _retryCloudKitOperationAfterError:retryBlock:](self, "_retryCloudKitOperationAfterError:retryBlock:", v9, v8);

  return (char)a3;
}

- (BOOL)_retryCloudKitOperationAfterError:(id)a3 retryBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMBCloudDatabase *v9;
  NSObject *v10;
  void *v11;
  const char *v12;
  NSObject *v13;
  os_log_type_t v14;
  uint32_t v15;
  BOOL v16;
  double v17;
  double v18;
  void *v19;
  HMBCloudDatabase *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  dispatch_time_t v27;
  NSObject *v28;
  void *v29;
  HMBCloudDatabase *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  HMBCloudDatabase *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  int v40;
  NSObject *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  _QWORD v47[5];
  id v48;
  _QWORD v49[5];
  id v50;
  _QWORD v51[5];
  id v52;
  uint8_t buf[4];
  void *v54;
  __int16 v55;
  double v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!objc_msgSend(v6, "hmbIsCKMissingManateeIdentityError"))
  {
    objc_msgSend(v6, "hmbCloudKitRetryDelay");
    v18 = v17;
    if (v17 == -1.0)
    {
      if (objc_msgSend(v6, "hmbIsCKManateeUnavailableError"))
      {
        v19 = (void *)MEMORY[0x1D17B6230]();
        v20 = self;
        HMFGetOSLogHandle();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v54 = v22;
          _os_log_impl(&dword_1CCD48000, v21, OS_LOG_TYPE_INFO, "%{public}@Manatee is unavailable. Waiting for Manatee to become available before retrying", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v19);
        -[HMBCloudDatabase credentialsAvailabilityListener](v20, "credentialsAvailabilityListener");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "waitForAccountAvailabilityAndRecheckIfAlreadyAvailable");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v51[0] = MEMORY[0x1E0C809B0];
        v51[1] = 3221225472;
        v51[2] = __65__HMBCloudDatabase__retryCloudKitOperationAfterError_retryBlock___block_invoke;
        v51[3] = &unk_1E8932340;
        v51[4] = v20;
        v52 = v7;
        v25 = (id)objc_msgSend(v24, "addSuccessBlock:", v51);

        v26 = v52;
      }
      else if (objc_msgSend(v6, "hmbIsCKNotAuthenticatedError"))
      {
        v33 = (void *)MEMORY[0x1D17B6230]();
        v34 = self;
        HMFGetOSLogHandle();
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v54 = v36;
          _os_log_impl(&dword_1CCD48000, v35, OS_LOG_TYPE_INFO, "%{public}@CloudKit account status is no longer authenticated. Waiting for Manatee to become available before retrying", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v33);
        -[HMBCloudDatabase credentialsAvailabilityListener](v34, "credentialsAvailabilityListener");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "waitForAccountAvailabilityAndRecheckIfAlreadyAvailable");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v49[0] = MEMORY[0x1E0C809B0];
        v49[1] = 3221225472;
        v49[2] = __65__HMBCloudDatabase__retryCloudKitOperationAfterError_retryBlock___block_invoke_72;
        v49[3] = &unk_1E8932340;
        v49[4] = v34;
        v50 = v7;
        v39 = (id)objc_msgSend(v38, "addSuccessBlock:", v49);

        v26 = v50;
      }
      else
      {
        v40 = objc_msgSend(v6, "hmbIsCKUnsyncedKeychainError");
        v8 = (void *)MEMORY[0x1D17B6230]();
        v9 = self;
        HMFGetOSLogHandle();
        v41 = objc_claimAutoreleasedReturnValue();
        v10 = v41;
        if (!v40)
        {
          if (!os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
            goto LABEL_5;
          HMFGetLogIdentifier();
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v54 = v11;
          v12 = "%{public}@Not retrying failed CloudKit operation";
          v13 = v10;
          v14 = OS_LOG_TYPE_DEBUG;
          v15 = 12;
          goto LABEL_4;
        }
        if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v54 = v42;
          _os_log_impl(&dword_1CCD48000, v10, OS_LOG_TYPE_INFO, "%{public}@Keychain is unsynced. Waiting for keychain to become available before retrying", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v8);
        -[HMBCloudDatabase credentialsAvailabilityListener](v9, "credentialsAvailabilityListener");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "waitForKeychainAvailability");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v47[0] = MEMORY[0x1E0C809B0];
        v47[1] = 3221225472;
        v47[2] = __65__HMBCloudDatabase__retryCloudKitOperationAfterError_retryBlock___block_invoke_73;
        v47[3] = &unk_1E8932340;
        v47[4] = v9;
        v48 = v7;
        v45 = (id)objc_msgSend(v44, "addSuccessBlock:", v47);

        v26 = v48;
      }

    }
    else
    {
      v27 = dispatch_time(0, (unint64_t)(v17 * 1000000000.0));
      dispatch_get_global_queue(0, 0);
      v28 = objc_claimAutoreleasedReturnValue();
      dispatch_after(v27, v28, v7);

      v29 = (void *)MEMORY[0x1D17B6230]();
      v30 = self;
      HMFGetOSLogHandle();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v54 = v32;
        v55 = 2048;
        v56 = v18;
        _os_log_impl(&dword_1CCD48000, v31, OS_LOG_TYPE_INFO, "%{public}@Will retry cloud operation after %.2f seconds", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v29);
    }
    v16 = 1;
    goto LABEL_24;
  }
  v8 = (void *)MEMORY[0x1D17B6230]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v54 = v11;
    v55 = 2112;
    v56 = *(double *)&v6;
    v12 = "%{public}@Received missing Manatee identity error on database specific query (this is not expected): %@";
    v13 = v10;
    v14 = OS_LOG_TYPE_ERROR;
    v15 = 22;
LABEL_4:
    _os_log_impl(&dword_1CCD48000, v13, v14, v12, buf, v15);

  }
LABEL_5:

  objc_autoreleasePoolPop(v8);
  v16 = 0;
LABEL_24:

  return v16;
}

- (void)notifyDelegateOfError:(id)a3 forOperation:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  HMBCloudDatabase *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HMBCloudDatabase delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v9 = (void *)MEMORY[0x1D17B6230]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138544130;
      v15 = v12;
      v16 = 2112;
      v17 = v8;
      v18 = 2112;
      v19 = v7;
      v20 = 2112;
      v21 = v6;
      _os_log_impl(&dword_1CCD48000, v11, OS_LOG_TYPE_DEBUG, "%{public}@Notifying delegate %@ for error on operation %@: %@", (uint8_t *)&v14, 0x2Au);

    }
    objc_autoreleasePoolPop(v9);
    -[HMBCloudDatabase containerID](v10, "containerID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "cloudDatabase:encounteredError:withOperation:onContainer:", v10, v6, v7, v13);

  }
}

- (void)removeStateForZoneID:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  HMBCloudDatabase *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  HMBCloudDatabase *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  HMBCloudDatabase *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  HMBCloudDatabase *v35;
  NSObject *v36;
  void *v37;
  os_unfair_lock_t lock;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  id v43;
  uint8_t v44[128];
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  id v48;
  __int16 v49;
  id v50;
  __int16 v51;
  id v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  lock = &self->_propertyLock;
  v5 = os_unfair_lock_lock_with_options();
  v6 = (void *)MEMORY[0x1D17B6230](v5);
  v7 = self;
  HMFGetOSLogHandle();
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v46 = v9;
    v47 = 2112;
    v48 = v4;
    _os_log_impl(&dword_1CCD48000, v8, OS_LOG_TYPE_INFO, "%{public}@Removing state for zone ID %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  -[HMBCloudDatabase zoneStateByZoneID](v7, "zoneStateByZoneID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[HMBCloudDatabase stateZone](v7, "stateZone");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "hmbModelID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = 0;
    objc_msgSend(v12, "fetchModelsWithParentModelID:error:", v13, &v43);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v43;

    if (!v14)
    {
      v16 = (void *)MEMORY[0x1D17B6230]();
      v17 = v7;
      HMFGetOSLogHandle();
      v18 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v46 = v19;
        v47 = 2112;
        v48 = v11;
        v49 = 2112;
        v50 = v4;
        v51 = 2112;
        v52 = v15;
        _os_log_impl(&dword_1CCD48000, v18, OS_LOG_TYPE_ERROR, "%{public}@Unable to determine children of zone state model %@ with ID %@: %@", buf, 0x2Au);

      }
      objc_autoreleasePoolPop(v16);
      objc_msgSend(MEMORY[0x1E0C99E60], "set");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v14, "count") + 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "hmbModelID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addObject:", v21);

    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v22 = v14;
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
    if (v23)
    {
      v24 = *(_QWORD *)v40;
      do
      {
        v25 = 0;
        do
        {
          if (*(_QWORD *)v40 != v24)
            objc_enumerationMutation(v22);
          objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * v25), "hmbModelID");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "addObject:", v26);

          ++v25;
        }
        while (v23 != v25);
        v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
      }
      while (v23);
    }

    -[HMBCloudDatabase stateZone](v7, "stateZone");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "remove:", v20);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28)
    {
      v29 = (void *)MEMORY[0x1D17B6230]();
      v30 = v7;
      HMFGetOSLogHandle();
      v31 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v46 = v32;
        v47 = 2112;
        v48 = v4;
        v49 = 2112;
        v50 = v28;
        _os_log_impl(&dword_1CCD48000, v31, OS_LOG_TYPE_ERROR, "%{public}@Unable to remove cloud zone state models for zone ID %@: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v29);
    }
    -[HMBCloudDatabase zoneStateByZoneID](v7, "zoneStateByZoneID");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setObject:forKeyedSubscript:", 0, v4);

  }
  else
  {
    v34 = (void *)MEMORY[0x1D17B6230]();
    v35 = v7;
    HMFGetOSLogHandle();
    v36 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v46 = v37;
      v47 = 2112;
      v48 = v4;
      _os_log_impl(&dword_1CCD48000, v36, OS_LOG_TYPE_INFO, "%{public}@Asked to remove state for zoneID %@ that has already been removed", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v34);
  }

  os_unfair_lock_unlock(lock);
}

- (void)retryStartupBlock:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HMBCloudDatabase dataSource](self, "dataSource");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "performAfterDelay:block:", v4, 300.0);

}

- (id)operationConfigurationWithProcessingOptions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[HMBCloudDatabase configuration](self, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "defaultOperationConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v4)
  {
    v8 = (void *)objc_msgSend(v6, "copy");

    objc_msgSend(v8, "setQualityOfService:", objc_msgSend(v4, "qualityOfService"));
    objc_msgSend(v8, "setAllowsCellularAccess:", objc_msgSend(v4, "disallowsCellularAccessForMirrorOutput") ^ 1);
    v7 = v8;
  }
  else
  {

  }
  return v7;
}

- (void)handler:(id)a3 didReceiveCKNotification:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  HMBCloudDatabase *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  HMBCloudDatabase *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  HMBCloudDatabase *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  HMBCloudDatabase *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  void *v45;
  HMBCloudZoneID *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  HMBCloudZoneID *v50;
  void *v51;
  void *v52;
  HMBCloudDatabase *v53;
  NSObject *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  id v60;
  id v61;
  void *v62;
  id v63;
  void *v64;
  HMBCloudDatabase *v65;
  NSObject *v66;
  _BOOL4 v67;
  id v68;
  void *v69;
  const char *v70;
  void *v71;
  id v72;
  void *v73;
  HMBCloudZoneID *v74;
  uint8_t buf[4];
  void *v76;
  __int16 v77;
  id v78;
  __int16 v79;
  id v80;
  uint64_t v81;

  v81 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "containerIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMBCloudDatabase container](self, "container");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "containerIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v8, "isEqualToString:", v10);

  if ((v11 & 1) != 0)
    goto LABEL_7;
  -[HMBCloudDatabase container](self, "container");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "containerIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v13, "isEqualToString:", CFSTR("com.apple.willow.config")) & 1) != 0)
  {
    objc_msgSend(v7, "containerIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("com.apple.homekit.config"));

    if (v15)
    {
      v16 = (void *)MEMORY[0x1D17B6230]();
      v17 = self;
      HMFGetOSLogHandle();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "containerIdentifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v76 = v19;
        v77 = 2112;
        v78 = v20;
        _os_log_impl(&dword_1CCD48000, v18, OS_LOG_TYPE_DEBUG, "%{public}@Allowing CKNotification for %@ container to trigger operations", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v16);
LABEL_7:
      v21 = v7;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v22 = v21;
      else
        v22 = 0;
      v23 = v22;

      if (v23)
      {
        v24 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D28540]), "initWithName:", CFSTR("Database APS Notification"));
        v25 = (void *)MEMORY[0x1D17B6230]();
        v26 = self;
        HMFGetOSLogHandle();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          HMFGetLogIdentifier();
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "identifier");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "shortDescription");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v76 = v28;
          v77 = 2114;
          v78 = v30;
          v79 = 2112;
          v80 = v23;
          _os_log_impl(&dword_1CCD48000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@[%{public}@] Handling CKDatabaseNotification: %@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v25);
        v31 = -[HMBCloudDatabase performCloudPullForScope:](v26, "performCloudPullForScope:", objc_msgSend(v23, "databaseScope"));
        goto LABEL_38;
      }
      v37 = v21;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v38 = v37;
      else
        v38 = 0;
      v24 = v38;

      if (v24)
      {
        v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D28540]), "initWithName:", CFSTR("Record Zone APS Notification"));
        v40 = (void *)MEMORY[0x1D17B6230]();
        v41 = self;
        HMFGetOSLogHandle();
        v42 = objc_claimAutoreleasedReturnValue();
        v73 = v39;
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
        {
          HMFGetLogIdentifier();
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "identifier");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "shortDescription");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v76 = v43;
          v77 = 2114;
          v78 = v45;
          v79 = 2112;
          v80 = v24;
          _os_log_impl(&dword_1CCD48000, v42, OS_LOG_TYPE_DEFAULT, "%{public}@[%{public}@] Handling CKRecordZoneNotification: %@", buf, 0x20u);

          v39 = v73;
        }
        v72 = v6;

        objc_autoreleasePoolPop(v40);
        v46 = [HMBCloudZoneID alloc];
        -[HMBCloudDatabase containerID](v41, "containerID");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = objc_msgSend(v24, "databaseScope");
        objc_msgSend(v24, "recordZoneID");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = -[HMBCloudZoneID initWithContainerID:scope:zoneID:](v46, "initWithContainerID:scope:zoneID:", v47, v48, v49);

        -[HMBCloudID name](v50, "name");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "markWithFormat:", CFSTR("updating zone: %@"), v51);

        v52 = (void *)MEMORY[0x1D17B6230]();
        v53 = v41;
        HMFGetOSLogHandle();
        v54 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
        {
          HMFGetLogIdentifier();
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v73, "identifier");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "shortDescription");
          v71 = v52;
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMBCloudID name](v50, "name");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v76 = v55;
          v77 = 2114;
          v78 = v57;
          v79 = 2112;
          v80 = v58;
          _os_log_impl(&dword_1CCD48000, v54, OS_LOG_TYPE_DEFAULT, "%{public}@[%{public}@] Starting update for zone: %@", buf, 0x20u);

          v52 = v71;
          v39 = v73;
        }

        objc_autoreleasePoolPop(v52);
        v74 = v50;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v74, 1);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMBCloudDatabase handleUpdatedZonesIDs:](v53, "handleUpdatedZonesIDs:", v59);

        v6 = v72;
        goto LABEL_37;
      }
      v60 = v6;
      v61 = v37;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v62 = v61;
      else
        v62 = 0;
      v63 = v62;

      v64 = (void *)MEMORY[0x1D17B6230]();
      v65 = self;
      HMFGetOSLogHandle();
      v66 = objc_claimAutoreleasedReturnValue();
      v67 = os_log_type_enabled(v66, OS_LOG_TYPE_ERROR);
      v68 = v63;
      if (v63)
      {
        if (v67)
        {
          HMFGetLogIdentifier();
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v76 = v69;
          v77 = 2112;
          v78 = v68;
          v70 = "%{public}@Received unexpected query notification: %@";
LABEL_35:
          _os_log_impl(&dword_1CCD48000, v66, OS_LOG_TYPE_ERROR, v70, buf, 0x16u);

        }
      }
      else if (v67)
      {
        HMFGetLogIdentifier();
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v76 = v69;
        v77 = 2112;
        v78 = v61;
        v70 = "%{public}@Received unknown CKNotification: %@";
        goto LABEL_35;
      }

      objc_autoreleasePoolPop(v64);
      v6 = v60;
      v39 = v68;
LABEL_37:

LABEL_38:
      goto LABEL_39;
    }
  }
  else
  {

  }
  v32 = (void *)MEMORY[0x1D17B6230]();
  v33 = self;
  HMFGetOSLogHandle();
  v34 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "containerIdentifier");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v76 = v35;
    v77 = 2112;
    v78 = v36;
    _os_log_impl(&dword_1CCD48000, v34, OS_LOG_TYPE_DEBUG, "%{public}@Ignoring CKNotification for irrelevant container identifier: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v32);
LABEL_39:

}

- (void)handler:(id)a3 didReceiveMessageWithUserInfo:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  HMBCloudDatabase *v10;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HMBCloudDatabase delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v9 = (void *)MEMORY[0x1D17B6230]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543618;
      v14 = v12;
      v15 = 2112;
      v16 = v7;
      _os_log_impl(&dword_1CCD48000, v11, OS_LOG_TYPE_DEBUG, "%{public}@Received message that did not translate to a CKNotification; deferring to delegate: %@",
        (uint8_t *)&v13,
        0x16u);

    }
    objc_autoreleasePoolPop(v9);
    objc_msgSend(v8, "cloudDatabase:didReceiveMessageWithUserInfo:", v10, v7);
  }

}

- (id)logIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  -[HMBCloudDatabase container](self, "container");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "containerID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "containerIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)attributeDescriptions
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMBCloudDatabase container](self, "container");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("Container"), v4);
  v8[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (HMBCloudDatabaseDelegate)delegate
{
  return (HMBCloudDatabaseDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (HMBLocalDatabase)localDatabase
{
  return self->_localDatabase;
}

- (HMBCloudDatabaseConfiguration)configuration
{
  return self->_configuration;
}

- (HMBCloudDatabaseDataSource)dataSource
{
  return self->_dataSource;
}

- (HMBLocalZone)stateZone
{
  return self->_stateZone;
}

- (HMBCloudDatabaseStateModel)privateDatabaseState
{
  return self->_privateDatabaseState;
}

- (void)setPrivateDatabaseState:(id)a3
{
  objc_storeStrong((id *)&self->_privateDatabaseState, a3);
}

- (HMBCloudDatabaseStateModel)sharedDatabaseState
{
  return self->_sharedDatabaseState;
}

- (void)setSharedDatabaseState:(id)a3
{
  objc_storeStrong((id *)&self->_sharedDatabaseState, a3);
}

- (HMBCloudDatabaseStateModel)publicDatabaseState
{
  return self->_publicDatabaseState;
}

- (void)setPublicDatabaseState:(id)a3
{
  objc_storeStrong((id *)&self->_publicDatabaseState, a3);
}

- (CKContainer)container
{
  return self->_container;
}

- (HMBCloudCredentialsAvailabilityListener)credentialsAvailabilityListener
{
  return self->_credentialsAvailabilityListener;
}

- (CKDatabase)sharedDatabase
{
  return self->_sharedDatabase;
}

- (CKDatabase)privateDatabase
{
  return self->_privateDatabase;
}

- (CKDatabase)publicDatabase
{
  return self->_publicDatabase;
}

- (id)cloudZoneFactory
{
  return self->_cloudZoneFactory;
}

- (void)setCloudZoneFactory:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSOperationQueue)invitationOperationQueue
{
  return self->_invitationOperationQueue;
}

- (NSOperationQueue)databaseFetchOperationQueue
{
  return self->_databaseFetchOperationQueue;
}

- (NAFuture)initialCloudSyncFuture
{
  return self->_initialCloudSyncFuture;
}

- (void)setInitialCloudSyncFuture:(id)a3
{
  objc_storeStrong((id *)&self->_initialCloudSyncFuture, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initialCloudSyncFuture, 0);
  objc_storeStrong((id *)&self->_databaseFetchOperationQueue, 0);
  objc_storeStrong((id *)&self->_invitationOperationQueue, 0);
  objc_storeStrong(&self->_cloudZoneFactory, 0);
  objc_storeStrong((id *)&self->_publicDatabase, 0);
  objc_storeStrong((id *)&self->_privateDatabase, 0);
  objc_storeStrong((id *)&self->_sharedDatabase, 0);
  objc_storeStrong((id *)&self->_credentialsAvailabilityListener, 0);
  objc_storeStrong((id *)&self->_container, 0);
  objc_storeStrong((id *)&self->_zoneStateByZoneID, 0);
  objc_storeStrong((id *)&self->_publicDatabaseState, 0);
  objc_storeStrong((id *)&self->_sharedDatabaseState, 0);
  objc_storeStrong((id *)&self->_privateDatabaseState, 0);
  objc_storeStrong((id *)&self->_stateZone, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_localDatabase, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __65__HMBCloudDatabase__retryCloudKitOperationAfterError_retryBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1D17B6230]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543362;
    v9 = v7;
    _os_log_impl(&dword_1CCD48000, v6, OS_LOG_TYPE_INFO, "%{public}@Retrying operation that received Manatee unavailable error", (uint8_t *)&v8, 0xCu);

  }
  objc_autoreleasePoolPop(v4);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __65__HMBCloudDatabase__retryCloudKitOperationAfterError_retryBlock___block_invoke_72(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1D17B6230]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543362;
    v9 = v7;
    _os_log_impl(&dword_1CCD48000, v6, OS_LOG_TYPE_INFO, "%{public}@Retrying operation that received account not authenticated error", (uint8_t *)&v8, 0xCu);

  }
  objc_autoreleasePoolPop(v4);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __65__HMBCloudDatabase__retryCloudKitOperationAfterError_retryBlock___block_invoke_73(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1D17B6230]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543362;
    v9 = v7;
    _os_log_impl(&dword_1CCD48000, v6, OS_LOG_TYPE_INFO, "%{public}@Retrying operation that received keychain unsynced error", (uint8_t *)&v8, 0xCu);

  }
  objc_autoreleasePoolPop(v4);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __37__HMBCloudDatabase_removeZoneWithID___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  HMBCloudZoneConfiguration *v6;
  void *v7;
  id v8;
  HMBMutableLocalZoneConfiguration *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  void *v22;
  id v23;
  NSObject *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t);
  void *v29;
  uint64_t v30;
  id v31;
  id v32;
  id v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "zoneID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(HMBCloudZoneConfiguration);
  v33 = 0;
  objc_msgSend(v4, "openExistingPrivateZoneWithID:configuration:delegate:error:", v5, v6, 0, &v33);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v33;

  if (v7)
  {
    v9 = objc_alloc_init(HMBMutableLocalZoneConfiguration);
    -[HMBLocalZoneConfiguration setCreateIfNeeded:](v9, "setCreateIfNeeded:", 1);
    objc_msgSend(*(id *)(a1 + 32), "localDatabase");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v8;
    objc_msgSend(v10, "openZoneWithMirror:configuration:error:", v7, v9, &v32);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v32;

    if (v11)
    {
      objc_msgSend(v11, "startUp");
      objc_msgSend(v7, "startUp");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = MEMORY[0x1E0C809B0];
      v27 = 3221225472;
      v28 = __37__HMBCloudDatabase_removeZoneWithID___block_invoke_69;
      v29 = &unk_1E8933F18;
      v14 = *(void **)(a1 + 40);
      v30 = *(_QWORD *)(a1 + 32);
      v31 = v14;
      objc_msgSend(v13, "flatMap:", &v26);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "completionHandlerAdapter", v26, v27, v28, v29, v30);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (id)objc_msgSend(v15, "addCompletionBlock:", v16);

    }
    else
    {
      v22 = (void *)MEMORY[0x1D17B6230]();
      v23 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v35 = v25;
        v36 = 2112;
        v37 = v12;
        _os_log_impl(&dword_1CCD48000, v24, OS_LOG_TYPE_ERROR, "%{public}@Failed to open private local zone for removal: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v22);
      objc_msgSend(v3, "finishWithError:", v12);
    }

    v8 = v12;
  }
  else
  {
    v18 = (void *)MEMORY[0x1D17B6230]();
    v19 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v35 = v21;
      v36 = 2112;
      v37 = v8;
      _os_log_impl(&dword_1CCD48000, v20, OS_LOG_TYPE_ERROR, "%{public}@Failed to open existing private cloud zone for removal: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v18);
    objc_msgSend(v3, "finishWithError:", v8);
  }

}

void __37__HMBCloudDatabase_removeZoneWithID___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  HMBCloudZoneConfiguration *v6;
  void *v7;
  id v8;
  HMBMutableLocalZoneConfiguration *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  void *v23;
  id v24;
  id v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "zoneID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(HMBCloudZoneConfiguration);
  v25 = 0;
  objc_msgSend(v4, "openExistingSharedZoneWithID:configuration:delegate:error:", v5, v6, 0, &v25);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v25;

  if (v7)
  {
    v9 = objc_alloc_init(HMBMutableLocalZoneConfiguration);
    -[HMBLocalZoneConfiguration setCreateIfNeeded:](v9, "setCreateIfNeeded:", 1);
    objc_msgSend(*(id *)(a1 + 32), "localDatabase");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v8;
    objc_msgSend(v10, "openZoneWithMirror:configuration:error:", v7, v9, &v24);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v24;

    if (v11)
    {
      objc_msgSend(v11, "startUp");
      objc_msgSend(v7, "leaveCloudShareRequestingNewInvitationToken:", 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "completionHandlerAdapter");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (id)objc_msgSend(v13, "addCompletionBlock:", v14);

    }
    else
    {
      v20 = (void *)MEMORY[0x1D17B6230]();
      v21 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v27 = v23;
        v28 = 2112;
        v29 = v12;
        _os_log_impl(&dword_1CCD48000, v22, OS_LOG_TYPE_ERROR, "%{public}@Failed to open shared local zone for removal: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v20);
      objc_msgSend(v3, "finishWithError:", v12);
    }

    v8 = v12;
  }
  else
  {
    v16 = (void *)MEMORY[0x1D17B6230]();
    v17 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v27 = v19;
      v28 = 2112;
      v29 = v8;
      _os_log_impl(&dword_1CCD48000, v18, OS_LOG_TYPE_ERROR, "%{public}@Failed to open existing shared cloud zone for removal: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v16);
    objc_msgSend(v3, "finishWithError:", v8);
  }

}

void __37__HMBCloudDatabase_removeZoneWithID___block_invoke_71(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v3 = (void *)MEMORY[0x1E0C99D20];
  v4 = a2;
  objc_msgSend(v3, "arrayWithObjects:count:", &v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleRemovedZoneIDs:userInitiated:", v5, 1, v6, v7);

  objc_msgSend(v4, "finishWithNoResult");
}

uint64_t __37__HMBCloudDatabase_removeZoneWithID___block_invoke_69(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removePrivateZoneWithID:", *(_QWORD *)(a1 + 40));
}

void __51__HMBCloudDatabase_synchronizeZoneStateForZoneIDs___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
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
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = objc_msgSend(v5, "integerValue");
  switch(v7)
  {
    case 1:
      v10 = (void *)MEMORY[0x1D17B6230]();
      v11 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        CKDatabaseScopeString();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = 138543618;
        v20 = v13;
        v21 = 2112;
        v22 = v14;
        _os_log_impl(&dword_1CCD48000, v12, OS_LOG_TYPE_ERROR, "%{public}@Asked to perform zone state synchronization for unsupported database scope: %@", (uint8_t *)&v19, 0x16u);

      }
      objc_autoreleasePoolPop(v10);
      v15 = (void *)MEMORY[0x1E0D519C0];
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 3);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "futureWithError:", v16);
      v17 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    case 3:
      v8 = *(void **)(a1 + 32);
      objc_msgSend(v8, "sharedDatabaseState");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 2:
      v8 = *(void **)(a1 + 32);
      objc_msgSend(v8, "privateDatabaseState");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:
      v16 = v9;
      __synchronizeZoneStateForZoneIDs(v8, v6, v9, 1);
      v17 = objc_claimAutoreleasedReturnValue();
LABEL_10:
      v18 = (void *)v17;

      objc_msgSend(*(id *)(a1 + 40), "addObject:", v18);
      break;
  }

}

uint64_t __51__HMBCloudDatabase_synchronizeZoneStateForZoneIDs___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(a2, "scope"));
}

void __43__HMBCloudDatabase__updateAPSRegistration___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  char v10;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "container");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __43__HMBCloudDatabase__updateAPSRegistration___block_invoke_2;
  v7[3] = &unk_1E8932288;
  objc_copyWeak(&v9, (id *)(a1 + 32));
  v6 = v3;
  v8 = v6;
  v10 = *(_BYTE *)(a1 + 40);
  objc_msgSend(v5, "serverPreferredPushEnvironmentWithCompletionHandler:", v7);

  objc_destroyWeak(&v9);
}

void __43__HMBCloudDatabase__updateAPSRegistration___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = WeakRetained;
  if (v6)
  {
    v9 = (void *)MEMORY[0x1D17B6230]();
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = 138543618;
      v30 = v11;
      v31 = 2112;
      v32 = v6;
      _os_log_impl(&dword_1CCD48000, v10, OS_LOG_TYPE_ERROR, "%{public}@[HMBCloudDatabase] Failed to resolve preferred CloudKit environment with error: %@", (uint8_t *)&v29, 0x16u);

    }
    objc_autoreleasePoolPop(v9);
    objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v6);
  }
  else
  {
    if (WeakRetained)
    {
      v12 = v5;
      if (!v12)
      {
        v12 = (id)*MEMORY[0x1E0CFE130];
        v13 = (void *)MEMORY[0x1D17B6230]();
        v14 = v8;
        HMFGetOSLogHandle();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          HMFGetLogIdentifier();
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = 138543618;
          v30 = v16;
          v31 = 2112;
          v32 = v12;
          _os_log_impl(&dword_1CCD48000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@Did not receive a preferred push environment, defaulting to %@", (uint8_t *)&v29, 0x16u);

        }
        objc_autoreleasePoolPop(v13);
      }
      v17 = (void *)MEMORY[0x1D17B6230]();
      v18 = v8;
      HMFGetOSLogHandle();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = 138543618;
        v30 = v20;
        v31 = 2112;
        v32 = v12;
        _os_log_impl(&dword_1CCD48000, v19, OS_LOG_TYPE_INFO, "%{public}@Registering APS Connection for environment: %@", (uint8_t *)&v29, 0x16u);

      }
      objc_autoreleasePoolPop(v17);
      +[HMBCloudPushHandler sharedHandlerForEnvironment:](HMBCloudPushHandler, "sharedHandlerForEnvironment:", v12);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = *(unsigned __int8 *)(a1 + 48);
      objc_msgSend(v18, "configuration");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "sourceApplicationBundleIdentifier");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (v22)
        objc_msgSend(v21, "addObserver:forBundleIdentifier:", v18, v24);
      else
        objc_msgSend(v21, "removeAllObserversForBundleIdentifier:", v24);

      objc_msgSend(*(id *)(a1 + 32), "finishWithNoResult");
    }
    else
    {
      v25 = (void *)MEMORY[0x1D17B6230]();
      HMFGetOSLogHandle();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = 138543362;
        v30 = v27;
        _os_log_impl(&dword_1CCD48000, v26, OS_LOG_TYPE_ERROR, "%{public}@[HMBCloudDatabase] Lost self.", (uint8_t *)&v29, 0xCu);

      }
      objc_autoreleasePoolPop(v25);
      v28 = *(void **)(a1 + 32);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 8);
      v12 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "finishWithError:", v12);
    }

  }
}

void __44__HMBCloudDatabase__performInitialCloudSync__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1D17B6230]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543362;
    v10 = v7;
    _os_log_impl(&dword_1CCD48000, v6, OS_LOG_TYPE_INFO, "%{public}@Successfully performed initial cloud sync", (uint8_t *)&v9, 0xCu);

  }
  objc_autoreleasePoolPop(v4);
  objc_msgSend(*(id *)(a1 + 32), "initialCloudSyncFuture");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "finishWithNoResult");

}

void __44__HMBCloudDatabase__performInitialCloudSync__block_invoke_39(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  uint8_t buf[4];
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1D17B6230]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v11 = v7;
    v12 = 2112;
    v13 = v3;
    _os_log_impl(&dword_1CCD48000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to perform initial cloud sync (will retry after delay): %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
  v8 = *(void **)(a1 + 32);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __44__HMBCloudDatabase__performInitialCloudSync__block_invoke_40;
  v9[3] = &unk_1E8932260;
  v9[4] = v8;
  objc_msgSend(v8, "retryStartupBlock:", v9);

}

uint64_t __44__HMBCloudDatabase__performInitialCloudSync__block_invoke_40(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1D17B6230]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v5;
    _os_log_impl(&dword_1CCD48000, v4, OS_LOG_TYPE_INFO, "%{public}@Retrying initial cloud sync", (uint8_t *)&v7, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  return objc_msgSend(*(id *)(a1 + 32), "_performInitialCloudSync");
}

HMBCloudZone *__162__HMBCloudDatabase_initWithLocalDatabase_stateZone_container_configuration_databaseStateModelsByScope_zoneStateModels_credentialsAvailabilityListener_dataSource___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v6;
  id v7;
  id v8;
  HMBCloudZone *v9;

  v6 = a4;
  v7 = a3;
  v8 = a2;
  v9 = -[HMBCloudZone initWithCloudDatabase:configuration:state:]([HMBCloudZone alloc], "initWithCloudDatabase:configuration:state:", v8, v7, v6);

  return v9;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t100 != -1)
    dispatch_once(&logCategory__hmf_once_t100, &__block_literal_global_93);
  return (id)logCategory__hmf_once_v101;
}

void __31__HMBCloudDatabase_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v101;
  logCategory__hmf_once_v101 = v0;

}

- (id)fetchZonesWithIDs:(id)a3 inDatabase:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  HMBCloudDatabase *v16;
  id v17;

  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1E0D519C0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __60__HMBCloudDatabase_CloudZone__fetchZonesWithIDs_inDatabase___block_invoke;
  v14[3] = &unk_1E89325D0;
  v15 = v6;
  v16 = self;
  v17 = v7;
  v9 = v7;
  v10 = v6;
  -[HMBCloudDatabase operationScheduler](self, "operationScheduler");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "lazyFutureWithBlock:scheduler:", v14, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)createPrivateZoneWithID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HMBCloudDatabase *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "scope") == 2)
  {
    v5 = (void *)MEMORY[0x1E0D519C0];
    v15 = MEMORY[0x1E0C809B0];
    v16 = v4;
    -[HMBCloudDatabase operationScheduler](self, "operationScheduler", v15, 3221225472, __55__HMBCloudDatabase_CloudZone__createPrivateZoneWithID___block_invoke, &unk_1E8933550, self);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "lazyFutureWithBlock:scheduler:", &v15, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = (void *)MEMORY[0x1D17B6230]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v18 = v11;
      v19 = 2112;
      v20 = v4;
      _os_log_impl(&dword_1CCD48000, v10, OS_LOG_TYPE_ERROR, "%{public}@Unable to create zone with ID %@ on a non-private database.", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    v12 = (void *)MEMORY[0x1E0D519C0];
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "futureWithError:", v13);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (id)removePrivateZoneWithID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HMBCloudDatabase *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "scope") == 2)
  {
    v5 = (void *)MEMORY[0x1E0D519C0];
    v15 = MEMORY[0x1E0C809B0];
    v16 = v4;
    -[HMBCloudDatabase operationScheduler](self, "operationScheduler", v15, 3221225472, __55__HMBCloudDatabase_CloudZone__removePrivateZoneWithID___block_invoke, &unk_1E8933550, self);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "lazyFutureWithBlock:scheduler:", &v15, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = (void *)MEMORY[0x1D17B6230]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v18 = v11;
      v19 = 2112;
      v20 = v4;
      _os_log_impl(&dword_1CCD48000, v10, OS_LOG_TYPE_ERROR, "%{public}@Unable to remove zone with ID %@ on a non-private database", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    v12 = (void *)MEMORY[0x1E0D519C0];
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "futureWithError:", v13);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

void __55__HMBCloudDatabase_CloudZone__removePrivateZoneWithID___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1D17B6230]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 40);
    v12 = 138543618;
    v13 = v7;
    v14 = 2112;
    v15 = v8;
    _os_log_impl(&dword_1CCD48000, v6, OS_LOG_TYPE_INFO, "%{public}@Removing private cloud zone with ID %@", (uint8_t *)&v12, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
  v9 = *(void **)(a1 + 32);
  objc_msgSend(v9, "privateDatabase");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "zoneID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  __modifyRecordZoneOperation(v9, v10, 0, v11, 0, v3);

}

void __55__HMBCloudDatabase_CloudZone__createPrivateZoneWithID___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
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
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1D17B6230]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    v27 = v7;
    v28 = 2112;
    v29 = v8;
    _os_log_impl(&dword_1CCD48000, v6, OS_LOG_TYPE_INFO, "%{public}@Creating private cloud zone with ID: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
  v9 = objc_alloc_init(MEMORY[0x1E0D519D8]);
  v10 = objc_alloc(MEMORY[0x1E0C95088]);
  objc_msgSend(*(id *)(a1 + 40), "zoneID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithZoneID:", v11);

  v13 = *(void **)(a1 + 32);
  objc_msgSend(v13, "privateDatabase");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  __modifyRecordZoneOperation(v13, v14, v12, 0, 0, v9);

  objc_msgSend(v9, "future");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = MEMORY[0x1E0C809B0];
  v21 = 3221225472;
  v22 = __55__HMBCloudDatabase_CloudZone__createPrivateZoneWithID___block_invoke_5;
  v23 = &unk_1E8932780;
  v16 = *(void **)(a1 + 40);
  v24 = *(_QWORD *)(a1 + 32);
  v25 = v16;
  objc_msgSend(v15, "addSuccessBlock:", &v20);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "completionHandlerAdapter", v20, v21, v22, v23, v24);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (id)objc_msgSend(v17, "addCompletionBlock:", v18);

}

void __55__HMBCloudDatabase_CloudZone__createPrivateZoneWithID___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  os_unfair_lock_s *v4;
  void *v5;
  HMBCloudZoneStateModel *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  HMBCloudZoneStateModel *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  HMBCloudZoneStateModel *v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (os_unfair_lock_s *)(*(_QWORD *)(a1 + 32) + 8);
  os_unfair_lock_lock_with_options();
  objc_msgSend(*(id *)(a1 + 32), "zoneStateByZoneID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", *(_QWORD *)(a1 + 40));
  v6 = (HMBCloudZoneStateModel *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v7 = (void *)MEMORY[0x1D17B6230]();
    v8 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v22 = v10;
      v23 = 2112;
      v24 = v11;
      _os_log_impl(&dword_1CCD48000, v9, OS_LOG_TYPE_FAULT, "%{public}@Local zone model state was removed while creating CKRecordZone with ID: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    v12 = [HMBCloudZoneStateModel alloc];
    objc_msgSend(*(id *)(a1 + 40), "modelID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "privateDatabaseState");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "hmbModelID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[HMBCloudZoneStateModel initWithModelID:parentModelID:](v12, "initWithModelID:parentModelID:", v13, v15);

    -[HMBCloudZoneStateModel setZoneID:](v6, "setZoneID:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "zoneStateByZoneID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v6, *(_QWORD *)(a1 + 40));

  }
  -[HMBCloudZoneStateModel setNeedsZoneCreation:](v6, "setNeedsZoneCreation:", MEMORY[0x1E0C9AAA0]);
  objc_msgSend(*(id *)(a1 + 32), "stateZone");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v20, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (id)objc_msgSend(v17, "update:", v18);

  os_unfair_lock_unlock(v4);
}

void __60__HMBCloudDatabase_CloudZone__fetchZonesWithIDs_inDatabase___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "na_map:", &__block_literal_global_3442);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  __fetchCloudZones(*(void **)(a1 + 40), v5, *(void **)(a1 + 48), 0, v4);

}

uint64_t __60__HMBCloudDatabase_CloudZone__fetchZonesWithIDs_inDatabase___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "zoneID");
}

- (id)serverChangeTokenForZoneWithID:(id)a3
{
  id v4;
  os_unfair_lock_s *p_propertyLock;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  HMBCloudDatabase *v10;
  NSObject *v11;
  void *v12;
  int v14;
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_propertyLock = &self->_propertyLock;
  os_unfair_lock_lock_with_options();
  -[HMBCloudDatabase zoneStateByZoneID](self, "zoneStateByZoneID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v7, "serverChangeToken");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = (void *)MEMORY[0x1D17B6230]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543618;
      v15 = v12;
      v16 = 2112;
      v17 = v4;
      _os_log_impl(&dword_1CCD48000, v11, OS_LOG_TYPE_ERROR, "%{public}@Cannot find zone model to fetch server change token for with zone ID %@", (uint8_t *)&v14, 0x16u);

    }
    objc_autoreleasePoolPop(v9);
    v8 = 0;
  }

  os_unfair_lock_unlock(p_propertyLock);
  return v8;
}

- (BOOL)needsZoneCreationForZoneWithID:(id)a3
{
  id v4;
  os_unfair_lock_s *p_propertyLock;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  HMBCloudDatabase *v11;
  NSObject *v12;
  void *v13;
  int v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_propertyLock = &self->_propertyLock;
  os_unfair_lock_lock_with_options();
  -[HMBCloudDatabase zoneStateByZoneID](self, "zoneStateByZoneID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v7, "needsZoneCreation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "BOOLValue");

  }
  else
  {
    v10 = (void *)MEMORY[0x1D17B6230]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543618;
      v16 = v13;
      v17 = 2112;
      v18 = v4;
      _os_log_impl(&dword_1CCD48000, v12, OS_LOG_TYPE_ERROR, "%{public}@Cannot find zone model to fetch needs zone creation for with zone ID %@", (uint8_t *)&v15, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
    v9 = 0;
  }

  os_unfair_lock_unlock(p_propertyLock);
  return v9;
}

- (void)updateServerChangeToken:(id)a3 forDatabaseWithScope:(int64_t)a4
{
  id v6;
  os_unfair_lock_s *p_propertyLock;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  HMBCloudDatabase *v14;
  NSObject *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  int64_t v20;
  __int16 v21;
  void *v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  p_propertyLock = &self->_propertyLock;
  os_unfair_lock_lock_with_options();
  -[HMBCloudDatabase databaseStateForDatabaseScope:](self, "databaseStateForDatabaseScope:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "serverChangeToken");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setServerChangeToken:", v6);
  -[HMBCloudDatabase stateZone](self, "stateZone");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "update:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v13 = (void *)MEMORY[0x1D17B6230]();
    v14 = self;
    HMFGetOSLogHandle();
    v15 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543874;
      v18 = v16;
      v19 = 2048;
      v20 = a4;
      v21 = 2112;
      v22 = v12;
      _os_log_impl(&dword_1CCD48000, v15, OS_LOG_TYPE_ERROR, "%{public}@Unable to update server change token for scope %ld: %@", (uint8_t *)&v17, 0x20u);

    }
    objc_autoreleasePoolPop(v13);
    objc_msgSend(v8, "setServerChangeToken:", v9);
  }

  os_unfair_lock_unlock(p_propertyLock);
}

- (void)updateServerChangeToken:(id)a3 forZoneWithID:(id)a4
{
  id v6;
  id v7;
  os_unfair_lock_s *p_propertyLock;
  void *v9;
  void *v10;
  void *v11;
  HMBCloudDatabase *v12;
  NSObject *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  HMBCloudDatabase *v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  uint8_t buf[4];
  id v28;
  __int16 v29;
  id v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  p_propertyLock = &self->_propertyLock;
  os_unfair_lock_lock_with_options();
  -[HMBCloudDatabase zoneStateByZoneID](self, "zoneStateByZoneID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x1D17B6230]();
  v12 = self;
  if (v10)
  {
    HMFGetOSLogHandle();
    v13 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v14 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "hmbDescription");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v28 = v14;
      v29 = 2112;
      v30 = v7;
      v31 = 2112;
      v32 = v15;
      _os_log_impl(&dword_1CCD48000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@Updating server change token of %@ to %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v11);
    objc_msgSend(v10, "serverChangeToken");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setServerChangeToken:", v6);
    -[HMBCloudDatabase stateZone](v12, "stateZone");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v26, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "update:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      v20 = (void *)MEMORY[0x1D17B6230]();
      v21 = v12;
      HMFGetOSLogHandle();
      v22 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v28 = v23;
        v29 = 2112;
        v30 = v10;
        v31 = 2112;
        v32 = v19;
        _os_log_impl(&dword_1CCD48000, v22, OS_LOG_TYPE_ERROR, "%{public}@Unable to update server change token for zone %@: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v20);
      objc_msgSend(v10, "setServerChangeToken:", v16);
    }

  }
  else
  {
    HMFGetOSLogHandle();
    v24 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v28 = v25;
      v29 = 2112;
      v30 = v7;
      _os_log_impl(&dword_1CCD48000, v24, OS_LOG_TYPE_ERROR, "%{public}@Cannot find zone model to update server change for with zone ID %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
  }

  os_unfair_lock_unlock(p_propertyLock);
}

- (void)updateRebuildStatus:(id)a3 forZoneWithID:(id)a4
{
  id v6;
  id v7;
  os_unfair_lock_s *p_propertyLock;
  uint64_t v9;
  void *v10;
  HMBCloudDatabase *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  HMBCloudDatabase *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  HMBCloudDatabase *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  id v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  p_propertyLock = &self->_propertyLock;
  v9 = os_unfair_lock_lock_with_options();
  v10 = (void *)MEMORY[0x1D17B6230](v9);
  v11 = self;
  HMFGetOSLogHandle();
  v12 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v29 = v13;
    v30 = 2112;
    v31 = v7;
    v32 = 2112;
    v33 = v6;
    _os_log_impl(&dword_1CCD48000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@Updating rebuild state for zone %@: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v10);
  -[HMBCloudDatabase zoneStateByZoneID](v11, "zoneStateByZoneID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKey:", v7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(v15, "setRebuilderStatus:", v6);
    -[HMBCloudDatabase stateZone](v11, "stateZone");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v27, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "update:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      v19 = (void *)MEMORY[0x1D17B6230]();
      v20 = v11;
      HMFGetOSLogHandle();
      v21 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v29 = v22;
        v30 = 2112;
        v31 = v18;
        _os_log_impl(&dword_1CCD48000, v21, OS_LOG_TYPE_ERROR, "%{public}@Unable to update state model for zone: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v19);
    }

  }
  else
  {
    v23 = (void *)MEMORY[0x1D17B6230]();
    v24 = v11;
    HMFGetOSLogHandle();
    v25 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v29 = v26;
      _os_log_impl(&dword_1CCD48000, v25, OS_LOG_TYPE_ERROR, "%{public}@Unable to find state model for zone.", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v23);
  }

  os_unfair_lock_unlock(p_propertyLock);
}

- (void)updateNeedsZoneDeletion:(BOOL)a3 forZoneWithID:(id)a4
{
  _BOOL8 v4;
  id v6;
  os_unfair_lock_s *p_propertyLock;
  uint64_t v8;
  void *v9;
  HMBCloudDatabase *v10;
  NSObject *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  HMBCloudDatabase *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  HMBCloudDatabase *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  uint8_t buf[4];
  id v30;
  __int16 v31;
  id v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v4 = a3;
  v35 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  p_propertyLock = &self->_propertyLock;
  v8 = os_unfair_lock_lock_with_options();
  v9 = (void *)MEMORY[0x1D17B6230](v8);
  v10 = self;
  HMFGetOSLogHandle();
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v12 = (id)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v30 = v12;
    v31 = 2112;
    v32 = v13;
    v33 = 2112;
    v34 = v6;
    _os_log_impl(&dword_1CCD48000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@Updating needs deletion to %@ for zone with ID: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v9);
  -[HMBCloudDatabase zoneStateByZoneID](v10, "zoneStateByZoneID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", v6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setNeedsZoneDeletion:", v16);

    -[HMBCloudDatabase stateZone](v10, "stateZone");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v28, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "update:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      v20 = (void *)MEMORY[0x1D17B6230]();
      v21 = v10;
      HMFGetOSLogHandle();
      v22 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v30 = v23;
        v31 = 2112;
        v32 = v19;
        _os_log_impl(&dword_1CCD48000, v22, OS_LOG_TYPE_ERROR, "%{public}@Unable to update needs zone deletion on state model for zone: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v20);
    }

  }
  else
  {
    v24 = (void *)MEMORY[0x1D17B6230]();
    v25 = v10;
    HMFGetOSLogHandle();
    v26 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v30 = v27;
      v31 = 2112;
      v32 = v6;
      _os_log_impl(&dword_1CCD48000, v26, OS_LOG_TYPE_ERROR, "%{public}@Unable to find state model to update needs zone deletion for with zone ID %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v24);
  }

  os_unfair_lock_unlock(p_propertyLock);
}

- (id)fetchSubscriptionsInDatabase:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  id v12;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = (void *)MEMORY[0x1E0D519C0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __68__HMBCloudDatabase_CloudSubscription__fetchSubscriptionsInDatabase___block_invoke;
  v10[3] = &unk_1E8932C48;
  objc_copyWeak(&v12, &location);
  v6 = v4;
  v11 = v6;
  -[HMBCloudDatabase operationScheduler](self, "operationScheduler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lazyFutureWithBlock:scheduler:", v10, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

  return v8;
}

- (id)subscriptionIDForCloudID:(id)a3 recordType:(id)a4
{
  id v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = a3;
  if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(".%@"), a4);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = &stru_1E8935680;
  }
  v7 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v5, "scope");
  CKDatabaseScopeString();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "containerID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "containerIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("DBSubscription_%@.%@%@"), v8, v10, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)subscriptionIDForZoneID:(id)a3 recordType:(id)a4
{
  id v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v5 = a3;
  if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(".%@"), a4);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = &stru_1E8935680;
  }
  v7 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v5, "scope");
  CKDatabaseScopeString();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "containerID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "containerIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "zoneID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "hmbDescription");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("ZoneSubscription_%@.%@.%@%@"), v8, v10, v12, v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

void __68__HMBCloudDatabase_CloudSubscription__fetchSubscriptionsInDatabase___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  __fetchSubscriptions(WeakRetained, *(void **)(a1 + 32), 0, v4);

}

- (id)fetchParticipantWithLookupInfo:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v10;
  id v11;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0D519C0];
  v10 = MEMORY[0x1E0C809B0];
  v11 = v4;
  v6 = v4;
  -[HMBCloudDatabase operationScheduler](self, "operationScheduler", v10, 3221225472, __62__HMBCloudDatabase_CloudUser__fetchParticipantWithLookupInfo___block_invoke, &unk_1E8933550, self);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lazyFutureWithBlock:scheduler:", &v10, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)fetchShareMetadataForInvitation:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v10;
  id v11;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0D519C0];
  v10 = MEMORY[0x1E0C809B0];
  v11 = v4;
  v6 = v4;
  -[HMBCloudDatabase operationScheduler](self, "operationScheduler", v10, 3221225472, __63__HMBCloudDatabase_CloudUser__fetchShareMetadataForInvitation___block_invoke, &unk_1E8933550, self);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lazyFutureWithBlock:scheduler:", &v10, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)acceptInvitationWithShareMetadata:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v10;
  id v11;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0D519C0];
  v10 = MEMORY[0x1E0C809B0];
  v11 = v4;
  v6 = v4;
  -[HMBCloudDatabase operationScheduler](self, "operationScheduler", v10, 3221225472, __65__HMBCloudDatabase_CloudUser__acceptInvitationWithShareMetadata___block_invoke, &unk_1E8933550, self);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lazyFutureWithBlock:scheduler:", &v10, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)fetchCurrentUserRecordForDatabase:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v10;
  id v11;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0D519C0];
  v10 = MEMORY[0x1E0C809B0];
  v11 = v4;
  v6 = v4;
  -[HMBCloudDatabase operationScheduler](self, "operationScheduler", v10, 3221225472, __65__HMBCloudDatabase_CloudUser__fetchCurrentUserRecordForDatabase___block_invoke, &unk_1E8933550, self);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lazyFutureWithBlock:scheduler:", &v10, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void __65__HMBCloudDatabase_CloudUser__fetchCurrentUserRecordForDatabase___block_invoke(uint64_t a1, void *a2)
{
  __fetchUserRecord(*(void **)(a1 + 32), *(void **)(a1 + 40), 0, a2);
}

void __65__HMBCloudDatabase_CloudUser__acceptInvitationWithShareMetadata___block_invoke(uint64_t a1, void *a2)
{
  __acceptInvitation(*(void **)(a1 + 32), *(void **)(a1 + 40), 0, a2);
}

void __63__HMBCloudDatabase_CloudUser__fetchShareMetadataForInvitation___block_invoke(uint64_t a1, void *a2)
{
  __fetchShareMetadata(*(void **)(a1 + 32), *(void **)(a1 + 40), 0, a2);
}

void __62__HMBCloudDatabase_CloudUser__fetchParticipantWithLookupInfo___block_invoke(uint64_t a1, void *a2)
{
  __fetchParticipant(*(void **)(a1 + 32), *(void **)(a1 + 40), 0, a2);
}

- (id)databaseStateForDatabaseScope:(int64_t)a3
{
  void *v3;

  switch(a3)
  {
    case 1:
      -[HMBCloudDatabase publicDatabaseState](self, "publicDatabaseState");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 3:
      -[HMBCloudDatabase sharedDatabaseState](self, "sharedDatabaseState");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 2:
      -[HMBCloudDatabase privateDatabaseState](self, "privateDatabaseState");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v3 = 0;
      break;
  }
  return v3;
}

- (id)performCloudPullForScope:(int64_t)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  HMBCloudDatabase *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  HMBCloudDatabase *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  HMBCloudDatabase *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  HMBFutureOperation *v26;
  HMBFutureOperation *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  uint64_t v33;
  uint64_t v34;
  id (*v35)(uint64_t);
  void *v36;
  HMBCloudDatabase *v37;
  id v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  -[HMBCloudDatabase databaseStateForDatabaseScope:](self, "databaseStateForDatabaseScope:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0D519C0]);
    os_unfair_lock_lock_with_options();
    objc_msgSend(v4, "queuedCloudPullFuture");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(v5, "completionHandlerAdapter");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (id)objc_msgSend(v6, "addCompletionBlock:", v7);

      os_unfair_lock_unlock(&self->_propertyLock);
      v9 = (void *)MEMORY[0x1D17B6230]();
      v10 = self;
      HMFGetOSLogHandle();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        CKDatabaseScopeString();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v40 = v12;
        v41 = 2112;
        v42 = v13;
        _os_log_impl(&dword_1CCD48000, v11, OS_LOG_TYPE_INFO, "%{public}@Coalescing cloud pull for scope: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v9);
    }
    else
    {
      objc_msgSend(v4, "setQueuedCloudPullFuture:", v5);
      os_unfair_lock_unlock(&self->_propertyLock);
      v21 = (void *)MEMORY[0x1D17B6230]();
      v22 = self;
      HMFGetOSLogHandle();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        CKDatabaseScopeString();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v40 = v24;
        v41 = 2112;
        v42 = v25;
        _os_log_impl(&dword_1CCD48000, v23, OS_LOG_TYPE_INFO, "%{public}@Queueing up cloud pull for scope: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v21);
      v26 = [HMBFutureOperation alloc];
      v33 = MEMORY[0x1E0C809B0];
      v34 = 3221225472;
      v35 = __56__HMBCloudDatabase_ZoneFetch__performCloudPullForScope___block_invoke;
      v36 = &unk_1E8933858;
      v37 = v22;
      v38 = v4;
      v27 = -[HMBFutureOperation initWithBlock:](v26, "initWithBlock:", &v33);
      -[HMBCloudDatabase databaseFetchOperationQueue](v22, "databaseFetchOperationQueue", v33, v34, v35, v36, v37);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "addOperation:", v27);

      -[HMBFutureOperation future](v27, "future");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "completionHandlerAdapter");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = (id)objc_msgSend(v29, "addCompletionBlock:", v30);

    }
  }
  else
  {
    v14 = (void *)MEMORY[0x1D17B6230]();
    v15 = self;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      CKDatabaseScopeString();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v40 = v17;
      v41 = 2112;
      v42 = v18;
      _os_log_impl(&dword_1CCD48000, v16, OS_LOG_TYPE_ERROR, "%{public}@Cannot fetch updated zones for unsupported database scope: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v14);
    v19 = (void *)MEMORY[0x1E0D519C0];
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 3);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "futureWithError:", v20);
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

id __56__HMBCloudDatabase_ZoneFetch__performCloudPullForScope___block_invoke(uint64_t a1)
{
  os_unfair_lock_s *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = (os_unfair_lock_s *)(*(_QWORD *)(a1 + 32) + 8);
  os_unfair_lock_lock_with_options();
  objc_msgSend(*(id *)(a1 + 40), "setQueuedCloudPullFuture:", 0);
  os_unfair_lock_unlock(v2);
  v3 = objc_alloc_init(MEMORY[0x1E0D519D8]);
  v5 = *(void **)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  objc_msgSend(v4, "serverChangeToken");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  __performCloudPull(v5, v4, v6, 0, v3);

  objc_msgSend(v3, "future");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSSet)sharedZoneIDs
{
  return (NSSet *)-[HMBCloudDatabase _zonesWithScope:](self, "_zonesWithScope:", 3);
}

- (NSSet)publicZoneIDs
{
  return (NSSet *)-[HMBCloudDatabase _zonesWithScope:](self, "_zonesWithScope:", 1);
}

- (id)synchronizeSharedZones
{
  void *v3;
  HMBCloudDatabase *v4;
  NSObject *v5;
  void *v6;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D17B6230](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543362;
    v9 = v6;
    _os_log_impl(&dword_1CCD48000, v5, OS_LOG_TYPE_INFO, "%{public}@Asked to synchronize shared zones", (uint8_t *)&v8, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  -[HMBCloudDatabase performCloudPullForScope:](v4, "performCloudPullForScope:", 3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)pushSubscriptionsForDatabase:(id)a3 subscriptionsToSave:(id)a4 subscriptionIDsToRemove:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v18;
  id v19;
  id v20;
  id v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x1E0D519C0];
  v18 = MEMORY[0x1E0C809B0];
  v19 = v8;
  v20 = v9;
  v21 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  -[HMBCloudDatabase operationScheduler](self, "operationScheduler", v18, 3221225472, __116__HMBCloudDatabase_Subscription_Internal__pushSubscriptionsForDatabase_subscriptionsToSave_subscriptionIDsToRemove___block_invoke, &unk_1E8933E38, self);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "lazyFutureWithBlock:scheduler:", &v18, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)registerSubscription:(id)a3 forZoneWithID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMBCloudDatabase *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  HMBCloudDatabase *v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  HMBCloudDatabase *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  _QWORD v35[4];
  id v36;
  id v37;
  HMBCloudDatabase *v38;
  id v39;
  id v40;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  id v44;
  __int16 v45;
  id v46;
  __int16 v47;
  void *v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1D17B6230]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v42 = v11;
    v43 = 2112;
    v44 = v6;
    v45 = 2112;
    v46 = v7;
    _os_log_impl(&dword_1CCD48000, v10, OS_LOG_TYPE_INFO, "%{public}@Asked to register subscription for zone ID %@: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v8);
  os_unfair_lock_lock_with_options();
  -[HMBCloudDatabase zoneStateByZoneID](v9, "zoneStateByZoneID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "subscriptions");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(&v9->_propertyLock);
  if (v14)
  {
    objc_msgSend(v14, "na_map:", &__block_literal_global_7658);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "subscriptionID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "containsObject:", v16);

    if (!v17)
    {
      -[HMBCloudDatabase databaseStateForDatabaseScope:](v9, "databaseStateForDatabaseScope:", objc_msgSend(v7, "scope"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "database");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = v6;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v40, 1);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMBCloudDatabase pushSubscriptionsForDatabase:subscriptionsToSave:subscriptionIDsToRemove:](v9, "pushSubscriptionsForDatabase:subscriptionsToSave:subscriptionIDsToRemove:", v31, v32, MEMORY[0x1E0C9AA60]);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v35[0] = MEMORY[0x1E0C809B0];
      v35[1] = 3221225472;
      v35[2] = __78__HMBCloudDatabase_Subscription_Internal__registerSubscription_forZoneWithID___block_invoke_4;
      v35[3] = &unk_1E8933EA0;
      v36 = v14;
      v37 = v6;
      v38 = v9;
      v39 = v7;
      objc_msgSend(v33, "addSuccessBlock:", v35);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_13;
    }
    v18 = (void *)MEMORY[0x1D17B6230]();
    v19 = v9;
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v42 = v21;
      v43 = 2112;
      v44 = v6;
      v45 = 2112;
      v46 = v14;
      _os_log_impl(&dword_1CCD48000, v20, OS_LOG_TYPE_DEBUG, "%{public}@Not registering zone subscription %@ because it is already in our list of subscriptions: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v18);
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    v22 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v23 = (void *)MEMORY[0x1D17B6230]();
    v24 = v9;
    HMFGetOSLogHandle();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMBCloudDatabase zoneStateByZoneID](v24, "zoneStateByZoneID");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v42 = v26;
      v43 = 2112;
      v44 = v6;
      v45 = 2112;
      v46 = v7;
      v47 = 2112;
      v48 = v27;
      _os_log_impl(&dword_1CCD48000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@Asked to register subscription %@ on unknown zoneID %@. All zone ID state: %@", buf, 0x2Au);

    }
    objc_autoreleasePoolPop(v23);
    v28 = (void *)MEMORY[0x1E0D519C0];
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "futureWithError:", v15);
    v22 = objc_claimAutoreleasedReturnValue();
  }
  v29 = (void *)v22;
LABEL_13:

  return v29;
}

- (id)unregisterSubscription:(id)a3 forZoneWithID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMBCloudDatabase *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  HMBCloudDatabase *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  HMBCloudDatabase *v31;
  NSObject *v32;
  void *v33;
  _QWORD v35[4];
  id v36;
  id v37;
  HMBCloudDatabase *v38;
  id v39;
  _QWORD v40[4];
  id v41;
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  id v45;
  __int16 v46;
  id v47;
  __int16 v48;
  void *v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1D17B6230]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v43 = v11;
    v44 = 2112;
    v45 = v6;
    v46 = 2112;
    v47 = v7;
    _os_log_impl(&dword_1CCD48000, v10, OS_LOG_TYPE_INFO, "%{public}@Asked to unregister subscription for zone ID %@: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v8);
  os_unfair_lock_lock_with_options();
  -[HMBCloudDatabase zoneStateByZoneID](v9, "zoneStateByZoneID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "subscriptions");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(&v9->_propertyLock);
  if (v14)
  {
    v15 = MEMORY[0x1E0C809B0];
    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v40[2] = __80__HMBCloudDatabase_Subscription_Internal__unregisterSubscription_forZoneWithID___block_invoke;
    v40[3] = &unk_1E8933EC8;
    v16 = v6;
    v41 = v16;
    objc_msgSend(v14, "na_map:", v40);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v17, "count"))
    {
      -[HMBCloudDatabase databaseStateForDatabaseScope:](v9, "databaseStateForDatabaseScope:", objc_msgSend(v7, "scope"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "database");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "allObjects");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMBCloudDatabase pushSubscriptionsForDatabase:subscriptionsToSave:subscriptionIDsToRemove:](v9, "pushSubscriptionsForDatabase:subscriptionsToSave:subscriptionIDsToRemove:", v19, MEMORY[0x1E0C9AA60], v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v35[0] = v15;
      v35[1] = 3221225472;
      v35[2] = __80__HMBCloudDatabase_Subscription_Internal__unregisterSubscription_forZoneWithID___block_invoke_7;
      v35[3] = &unk_1E8933EA0;
      v36 = v14;
      v37 = v17;
      v38 = v9;
      v39 = v7;
      objc_msgSend(v21, "addSuccessBlock:", v35);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v30 = (void *)MEMORY[0x1D17B6230]();
      v31 = v9;
      HMFGetOSLogHandle();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v43 = v33;
        v44 = 2112;
        v45 = v16;
        v46 = 2112;
        v47 = v14;
        _os_log_impl(&dword_1CCD48000, v32, OS_LOG_TYPE_DEBUG, "%{public}@Not unregistering zone subscription %@ because it is not in our list of existing subscriptions: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v30);
      objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
    }

    v29 = v41;
  }
  else
  {
    v23 = (void *)MEMORY[0x1D17B6230]();
    v24 = v9;
    HMFGetOSLogHandle();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMBCloudDatabase zoneStateByZoneID](v24, "zoneStateByZoneID");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v43 = v26;
      v44 = 2112;
      v45 = v6;
      v46 = 2112;
      v47 = v7;
      v48 = 2112;
      v49 = v27;
      _os_log_impl(&dword_1CCD48000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@Asked to unregister subscription %@ on unknown zoneID %@. All zone ID state: %@", buf, 0x2Au);

    }
    objc_autoreleasePoolPop(v23);
    v28 = (void *)MEMORY[0x1E0D519C0];
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 2);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "futureWithError:", v29);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v22;
}

- (id)subscriptionsForZoneWithID:(id)a3
{
  id v4;
  os_unfair_lock_s *p_propertyLock;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  HMBCloudDatabase *v10;
  NSObject *v11;
  id v12;
  void *v13;
  void *v14;
  int v16;
  id v17;
  __int16 v18;
  id v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_propertyLock = &self->_propertyLock;
  os_unfair_lock_lock_with_options();
  -[HMBCloudDatabase zoneStateByZoneID](self, "zoneStateByZoneID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v7, "subscriptions");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = (void *)MEMORY[0x1D17B6230]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (id)objc_claimAutoreleasedReturnValue();
      -[HMBCloudDatabase zoneStateByZoneID](v10, "zoneStateByZoneID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543874;
      v17 = v12;
      v18 = 2112;
      v19 = v4;
      v20 = 2112;
      v21 = v13;
      _os_log_impl(&dword_1CCD48000, v11, OS_LOG_TYPE_ERROR, "%{public}@Could not find zone state for zone ID %@ when fetching subscriptions. All zone ID state: %@", (uint8_t *)&v16, 0x20u);

    }
    objc_autoreleasePoolPop(v9);
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v14 = (void *)v8;

  os_unfair_lock_unlock(p_propertyLock);
  return v14;
}

- (id)unregisterPrivateSubscriptionForSubscriptionID:(id)a3
{
  id v4;
  void *v5;
  HMBCloudDatabase *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v13[5];
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17B6230]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v16 = v8;
    v17 = 2112;
    v18 = v4;
    _os_log_impl(&dword_1CCD48000, v7, OS_LOG_TYPE_INFO, "%{public}@Asked to unregister private subscription for subscription ID %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMBCloudDatabase performInitialCloudSync](v6, "performInitialCloudSync");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __90__HMBCloudDatabase_Subscription_Internal__unregisterPrivateSubscriptionForSubscriptionID___block_invoke;
  v13[3] = &unk_1E8933F18;
  v13[4] = v6;
  v14 = v4;
  v10 = v4;
  objc_msgSend(v9, "flatMap:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)unregisterSharedSubscriptionForSubscriptionID:(id)a3
{
  id v4;
  void *v5;
  HMBCloudDatabase *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v13[5];
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17B6230]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v16 = v8;
    v17 = 2112;
    v18 = v4;
    _os_log_impl(&dword_1CCD48000, v7, OS_LOG_TYPE_INFO, "%{public}@Asked to unregister shared subscription for subscription ID %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMBCloudDatabase performInitialCloudSync](v6, "performInitialCloudSync");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __89__HMBCloudDatabase_Subscription_Internal__unregisterSharedSubscriptionForSubscriptionID___block_invoke;
  v13[3] = &unk_1E8933F18;
  v13[4] = v6;
  v14 = v4;
  v10 = v4;
  objc_msgSend(v9, "flatMap:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)registerPrivateSubscription:(id)a3
{
  id v4;
  void *v5;
  HMBCloudDatabase *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  HMBCloudDatabase *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  HMBCloudDatabase *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v26[4];
  id v27;
  id v28;
  HMBCloudDatabase *v29;
  id v30;
  id v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  id v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17B6230]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v33 = v8;
    v34 = 2112;
    v35 = v4;
    _os_log_impl(&dword_1CCD48000, v7, OS_LOG_TYPE_INFO, "%{public}@Asked to register subscription for Private DB: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  os_unfair_lock_lock_with_options();
  -[HMBCloudDatabase privateDatabaseState](v6, "privateDatabaseState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "subscriptions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(&v6->_propertyLock);
  if (v10)
  {
    if (objc_msgSend(v10, "count"))
    {
      v11 = (void *)MEMORY[0x1D17B6230]();
      v12 = v6;
      HMFGetOSLogHandle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v33 = v14;
        v34 = 2112;
        v35 = v4;
        v36 = 2112;
        v37 = v10;
        _os_log_impl(&dword_1CCD48000, v13, OS_LOG_TYPE_DEBUG, "%{public}@Not registering DB subscription %@ because it appears to already exist in our list of subscriptions: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v11);
      objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v9, "database");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = v4;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v31, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMBCloudDatabase pushSubscriptionsForDatabase:subscriptionsToSave:subscriptionIDsToRemove:](v6, "pushSubscriptionsForDatabase:subscriptionsToSave:subscriptionIDsToRemove:", v22, v23, MEMORY[0x1E0C9AA60]);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __71__HMBCloudDatabase_Subscription_Internal__registerPrivateSubscription___block_invoke;
      v26[3] = &unk_1E8933EA0;
      v27 = v10;
      v28 = v4;
      v29 = v6;
      v30 = v9;
      objc_msgSend(v24, "addSuccessBlock:", v26);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v16 = (void *)MEMORY[0x1D17B6230]();
    v17 = v6;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v33 = v19;
      _os_log_impl(&dword_1CCD48000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@Asked to register subscription on PrivateDB, but no subscriptions!.", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v16);
    v20 = (void *)MEMORY[0x1E0D519C0];
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "futureWithError:", v21);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v15;
}

void __71__HMBCloudDatabase_Subscription_Internal__registerPrivateSubscription___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  os_unfair_lock_s *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "setByAddingObject:", *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (os_unfair_lock_s *)(*(_QWORD *)(a1 + 48) + 8);
  os_unfair_lock_lock_with_options();
  objc_msgSend(*(id *)(a1 + 56), "setSubscriptions:", v4);
  objc_msgSend(*(id *)(a1 + 48), "stateZone");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = *(_QWORD *)(a1 + 56);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "update:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = (void *)MEMORY[0x1D17B6230]();
    v10 = *(id *)(a1 + 48);
    HMFGetOSLogHandle();
    v11 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543618;
      v14 = v12;
      v15 = 2112;
      v16 = v8;
      _os_log_impl(&dword_1CCD48000, v11, OS_LOG_TYPE_ERROR, "%{public}@Failed to update zone state: %@", (uint8_t *)&v13, 0x16u);

    }
    objc_autoreleasePoolPop(v9);
  }

  os_unfair_lock_unlock(v5);
}

id __89__HMBCloudDatabase_Subscription_Internal__unregisterSharedSubscriptionForSubscriptionID___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v1 = *(void **)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  objc_msgSend(v1, "sharedDatabaseState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __unregisterSubscriptionForSubscriptionID(v1, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __90__HMBCloudDatabase_Subscription_Internal__unregisterPrivateSubscriptionForSubscriptionID___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v1 = *(void **)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  objc_msgSend(v1, "privateDatabaseState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __unregisterSubscriptionForSubscriptionID(v1, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __80__HMBCloudDatabase_Subscription_Internal__unregisterSubscription_forZoneWithID___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  int v19;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "subscriptionID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "subscriptionID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  if (v6)
  {
    objc_msgSend(v3, "subscriptionID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = v3;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;
    v10 = v9;

    v11 = *(id *)(a1 + 32);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v12 = v11;
    else
      v12 = 0;
    v13 = v12;

    v7 = 0;
    if (v10 && v13)
    {
      objc_msgSend(v10, "zoneID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "zoneID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v14, "isEqual:", v15);

      if (v16
        && (objc_msgSend(v10, "recordType"),
            v17 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v13, "recordType"),
            v18 = (void *)objc_claimAutoreleasedReturnValue(),
            v19 = HMFEqualObjects(),
            v18,
            v17,
            v19))
      {
        objc_msgSend(v10, "subscriptionID");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v7 = 0;
      }
    }

  }
  return v7;
}

void __80__HMBCloudDatabase_Subscription_Internal__unregisterSubscription_forZoneWithID___block_invoke_7(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  os_unfair_lock_s *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, void *);
  void *v25;
  id v26;
  void *v27;
  uint8_t buf[4];
  id v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v22 = MEMORY[0x1E0C809B0];
  v23 = 3221225472;
  v24 = __80__HMBCloudDatabase_Subscription_Internal__unregisterSubscription_forZoneWithID___block_invoke_2;
  v25 = &unk_1E8933EF0;
  v4 = *(void **)(a1 + 32);
  v26 = *(id *)(a1 + 40);
  objc_msgSend(v4, "na_filter:", &v22);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (os_unfair_lock_s *)(*(_QWORD *)(a1 + 48) + 8);
  os_unfair_lock_lock_with_options();
  objc_msgSend(*(id *)(a1 + 48), "zoneStateByZoneID", v22, v23, v24, v25);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 56));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v8, "setSubscriptions:", v5);
    objc_msgSend(*(id *)(a1 + 48), "stateZone");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v27, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "update:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v12 = (void *)MEMORY[0x1D17B6230]();
      v13 = *(id *)(a1 + 48);
      HMFGetOSLogHandle();
      v14 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v29 = v15;
        v30 = 2112;
        v31 = v11;
        _os_log_impl(&dword_1CCD48000, v14, OS_LOG_TYPE_ERROR, "%{public}@Failed to update zone state: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v12);
    }

  }
  else
  {
    v16 = (void *)MEMORY[0x1D17B6230]();
    v17 = *(id *)(a1 + 48);
    HMFGetOSLogHandle();
    v18 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v19 = (id)objc_claimAutoreleasedReturnValue();
      v20 = *(void **)(a1 + 56);
      objc_msgSend(*(id *)(a1 + 48), "zoneStateByZoneID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v29 = v19;
      v30 = 2112;
      v31 = v20;
      v32 = 2112;
      v33 = v21;
      _os_log_impl(&dword_1CCD48000, v18, OS_LOG_TYPE_ERROR, "%{public}@Could not find zone state for zone ID %@ after updating subscriptions. All zone ID state: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v16);
  }

  os_unfair_lock_unlock(v6);
}

uint64_t __80__HMBCloudDatabase_Subscription_Internal__unregisterSubscription_forZoneWithID___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "subscriptionID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3) ^ 1;

  return v4;
}

void __78__HMBCloudDatabase_Subscription_Internal__registerSubscription_forZoneWithID___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  os_unfair_lock_s *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "setByAddingObject:", *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (os_unfair_lock_s *)(*(_QWORD *)(a1 + 48) + 8);
  os_unfair_lock_lock_with_options();
  objc_msgSend(*(id *)(a1 + 48), "zoneStateByZoneID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 56));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v7, "setSubscriptions:", v4);
    objc_msgSend(*(id *)(a1 + 48), "stateZone");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v21, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "update:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = (void *)MEMORY[0x1D17B6230]();
      v12 = *(id *)(a1 + 48);
      HMFGetOSLogHandle();
      v13 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v23 = v14;
        v24 = 2112;
        v25 = v10;
        _os_log_impl(&dword_1CCD48000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to update zone state: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v11);
    }

  }
  else
  {
    v15 = (void *)MEMORY[0x1D17B6230]();
    v16 = *(id *)(a1 + 48);
    HMFGetOSLogHandle();
    v17 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v18 = (id)objc_claimAutoreleasedReturnValue();
      v19 = *(void **)(a1 + 56);
      objc_msgSend(*(id *)(a1 + 48), "zoneStateByZoneID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v23 = v18;
      v24 = 2112;
      v25 = v19;
      v26 = 2112;
      v27 = v20;
      _os_log_impl(&dword_1CCD48000, v17, OS_LOG_TYPE_ERROR, "%{public}@Could not find zone state for zone ID %@ after updating subscriptions. All zone ID state: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v15);
  }

  os_unfair_lock_unlock(v5);
}

uint64_t __78__HMBCloudDatabase_Subscription_Internal__registerSubscription_forZoneWithID___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "subscriptionID");
}

void __116__HMBCloudDatabase_Subscription_Internal__pushSubscriptionsForDatabase_subscriptionsToSave_subscriptionIDsToRemove___block_invoke(void **a1, void *a2)
{
  __modifySubscriptions(a1[4], a1[5], a1[6], a1[7], 0, a2);
}

- (id)registerSubscriptionForExternalRecordType:(id)a3 databaseState:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  HMBCloudDatabase *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  _QWORD v26[5];
  id v27;
  id v28;
  id v29;
  _QWORD v30[4];
  id v31;
  void *v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  id v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HMBCloudDatabase initialCloudSyncFuture](self, "initialCloudSyncFuture");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isFinished");

  if ((v9 & 1) == 0)
    _HMFPreconditionFailure();
  objc_msgSend(v7, "cloudID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMBCloudDatabase subscriptionIDForCloudID:recordType:](self, "subscriptionIDForCloudID:recordType:", v10, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_lock_with_options();
  objc_msgSend(v7, "subscriptions");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(&self->_propertyLock);
  v13 = MEMORY[0x1E0C809B0];
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __90__HMBCloudDatabase_Subscription__registerSubscriptionForExternalRecordType_databaseState___block_invoke;
  v30[3] = &unk_1E8933F40;
  v14 = v11;
  v31 = v14;
  if ((objc_msgSend(v12, "na_any:", v30) & 1) != 0)
  {
    v15 = (void *)MEMORY[0x1D17B6230]();
    v16 = self;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v34 = v18;
      v35 = 2112;
      v36 = v14;
      v37 = 2112;
      v38 = v12;
      _os_log_impl(&dword_1CCD48000, v17, OS_LOG_TYPE_INFO, "%{public}@Not pushing database subscription ID %@ because it is already in our list of registered database subscriptions: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v15);
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C94CB8]), "initWithSubscriptionID:", v14);
    objc_msgSend(v20, "setRecordType:", v6);
    objc_msgSend(v7, "database");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v20;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v32, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMBCloudDatabase pushSubscriptionsForDatabase:subscriptionsToSave:subscriptionIDsToRemove:](self, "pushSubscriptionsForDatabase:subscriptionsToSave:subscriptionIDsToRemove:", v21, v22, MEMORY[0x1E0C9AA60]);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v13;
    v26[1] = 3221225472;
    v26[2] = __90__HMBCloudDatabase_Subscription__registerSubscriptionForExternalRecordType_databaseState___block_invoke_22;
    v26[3] = &unk_1E8933EA0;
    v26[4] = self;
    v27 = v7;
    v28 = v12;
    v29 = v20;
    v24 = v20;
    objc_msgSend(v23, "addSuccessBlock:", v26);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v19;
}

- (id)registerPrivateSubscriptionForExternalRecordType:(id)a3
{
  id v4;
  void *v5;
  HMBCloudDatabase *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v13[5];
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17B6230]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v16 = v8;
    v17 = 2112;
    v18 = v4;
    _os_log_impl(&dword_1CCD48000, v7, OS_LOG_TYPE_INFO, "%{public}@Asked to register private subscription for external record type %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMBCloudDatabase performInitialCloudSync](v6, "performInitialCloudSync");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __83__HMBCloudDatabase_Subscription__registerPrivateSubscriptionForExternalRecordType___block_invoke;
  v13[3] = &unk_1E8933F18;
  v13[4] = v6;
  v14 = v4;
  v10 = v4;
  objc_msgSend(v9, "flatMap:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)registerSharedSubscriptionForExternalRecordType:(id)a3
{
  id v4;
  void *v5;
  HMBCloudDatabase *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v13[5];
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17B6230]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v16 = v8;
    v17 = 2112;
    v18 = v4;
    _os_log_impl(&dword_1CCD48000, v7, OS_LOG_TYPE_INFO, "%{public}@Asked to register shared subscription for external record type %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMBCloudDatabase performInitialCloudSync](v6, "performInitialCloudSync");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __82__HMBCloudDatabase_Subscription__registerSharedSubscriptionForExternalRecordType___block_invoke;
  v13[3] = &unk_1E8933F18;
  v13[4] = v6;
  v14 = v4;
  v10 = v4;
  objc_msgSend(v9, "flatMap:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)unregisterPrivateSubscriptionForExternalRecordType:(id)a3
{
  id v4;
  void *v5;
  HMBCloudDatabase *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v13[5];
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17B6230]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v16 = v8;
    v17 = 2112;
    v18 = v4;
    _os_log_impl(&dword_1CCD48000, v7, OS_LOG_TYPE_INFO, "%{public}@Asked to unregister private subscription for external record type %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMBCloudDatabase performInitialCloudSync](v6, "performInitialCloudSync");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __85__HMBCloudDatabase_Subscription__unregisterPrivateSubscriptionForExternalRecordType___block_invoke;
  v13[3] = &unk_1E8933F18;
  v13[4] = v6;
  v14 = v4;
  v10 = v4;
  objc_msgSend(v9, "flatMap:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)unregisterSharedSubscriptionForExternalRecordType:(id)a3
{
  id v4;
  void *v5;
  HMBCloudDatabase *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v13[5];
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17B6230]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v16 = v8;
    v17 = 2112;
    v18 = v4;
    _os_log_impl(&dword_1CCD48000, v7, OS_LOG_TYPE_INFO, "%{public}@Asked to unregister shared subscription for external record type %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMBCloudDatabase performInitialCloudSync](v6, "performInitialCloudSync");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __84__HMBCloudDatabase_Subscription__unregisterSharedSubscriptionForExternalRecordType___block_invoke;
  v13[3] = &unk_1E8933F18;
  v13[4] = v6;
  v14 = v4;
  v10 = v4;
  objc_msgSend(v9, "flatMap:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id __84__HMBCloudDatabase_Subscription__unregisterSharedSubscriptionForExternalRecordType___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "sharedDatabaseState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cloudID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "subscriptionIDForCloudID:recordType:", v4, *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "sharedDatabaseState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  __unregisterSubscriptionForSubscriptionID(v2, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __85__HMBCloudDatabase_Subscription__unregisterPrivateSubscriptionForExternalRecordType___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "privateDatabaseState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cloudID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "subscriptionIDForCloudID:recordType:", v4, *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "privateDatabaseState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  __unregisterSubscriptionForSubscriptionID(v2, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __82__HMBCloudDatabase_Subscription__registerSharedSubscriptionForExternalRecordType___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v1, "sharedDatabaseState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "registerSubscriptionForExternalRecordType:databaseState:", v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __83__HMBCloudDatabase_Subscription__registerPrivateSubscriptionForExternalRecordType___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v1, "privateDatabaseState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "registerSubscriptionForExternalRecordType:databaseState:", v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __90__HMBCloudDatabase_Subscription__registerSubscriptionForExternalRecordType_databaseState___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "subscriptionID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

void __90__HMBCloudDatabase_Subscription__registerSubscriptionForExternalRecordType_databaseState___block_invoke_22(uint64_t a1, void *a2)
{
  id v3;
  os_unfair_lock_s *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (os_unfair_lock_s *)(*(_QWORD *)(a1 + 32) + 8);
  os_unfair_lock_lock_with_options();
  objc_msgSend(*(id *)(a1 + 48), "setByAddingObject:", *(_QWORD *)(a1 + 56));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setSubscriptions:", v5);

  objc_msgSend(*(id *)(a1 + 32), "stateZone");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "update:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = (void *)MEMORY[0x1D17B6230]();
    v10 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v11 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543618;
      v14 = v12;
      v15 = 2112;
      v16 = v8;
      _os_log_impl(&dword_1CCD48000, v11, OS_LOG_TYPE_ERROR, "%{public}@Failed to update database state: %@", (uint8_t *)&v13, 0x16u);

    }
    objc_autoreleasePoolPop(v9);
  }

  os_unfair_lock_unlock(v4);
}

@end
