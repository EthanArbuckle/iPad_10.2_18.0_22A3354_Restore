@implementation HMDPersonCoreDataManager

- (HMDPersonCoreDataManager)initWithUUID:(id)a3 workQueue:(id)a4 home:(id)a5 userUUID:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  HMDPersonResidentSyncManager *v16;
  void *v17;
  void *v18;
  HMDPersonResidentSyncManager *v19;
  void *v20;
  HMDPersonCoreDataManager *v21;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  objc_msgSend(v11, "backingStore");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "context");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = [HMDPersonResidentSyncManager alloc];
  objc_msgSend(v11, "msgDispatcher");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "residentSyncManager");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[HMDPersonResidentSyncManager initWithUUID:messageDispatcher:workQueue:residentSyncManager:](v16, "initWithUUID:messageDispatcher:workQueue:residentSyncManager:", v13, v17, v12, v18);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[HMDPersonCoreDataManager initWithUUID:workQueue:home:userUUID:context:residentSyncManager:notificationCenter:](self, "initWithUUID:workQueue:home:userUUID:context:residentSyncManager:notificationCenter:", v13, v12, v11, v10, v15, v19, v20);

  return v21;
}

- (HMDPersonCoreDataManager)initWithUUID:(id)a3 workQueue:(id)a4 home:(id)a5 userUUID:(id)a6 context:(id)a7 residentSyncManager:(id)a8 notificationCenter:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  HMDPersonCoreDataManager *v20;
  HMDPersonCoreDataManager *v21;
  uint64_t v22;
  NSUUID *UUID;
  uint64_t v24;
  NSUUID *userUUID;
  id v27;
  id v28;
  objc_super v29;

  v15 = a3;
  v28 = a4;
  v16 = a5;
  v17 = a6;
  v27 = a7;
  v18 = a8;
  v19 = a9;
  v29.receiver = self;
  v29.super_class = (Class)HMDPersonCoreDataManager;
  v20 = -[HMDPersonCoreDataManager init](&v29, sel_init);
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_workQueue, a4);
    v22 = objc_msgSend(v15, "copy", v27, v28);
    UUID = v21->_UUID;
    v21->_UUID = (NSUUID *)v22;

    objc_storeWeak((id *)&v21->_home, v16);
    v24 = objc_msgSend(v17, "copy");
    userUUID = v21->_userUUID;
    v21->_userUUID = (NSUUID *)v24;

    objc_storeStrong((id *)&v21->_context, a7);
    objc_storeStrong((id *)&v21->_residentSyncManager, a8);
    objc_storeStrong((id *)&v21->_notificationCenter, a9);
  }

  return v21;
}

- (void)configureWithDataSource:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  -[HMDPersonCoreDataManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDPersonCoreDataManager setDataSource:](self, "setDataSource:", v4);
  -[HMDPersonCoreDataManager notificationCenter](self, "notificationCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObserver:selector:name:object:", self, sel_handleManagedObjectContextWillSaveNotification_, *MEMORY[0x24BDBB470], 0);

  -[HMDPersonCoreDataManager notificationCenter](self, "notificationCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObserver:selector:name:object:", self, sel_handleManagedObjectContextDidSaveNotification_, *MEMORY[0x24BDBB458], 0);

  -[HMDPersonCoreDataManager residentSyncManager](self, "residentSyncManager");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[HMDPersonCoreDataManager home](self, "home");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "configureWithHome:delegate:", v8, self);

}

- (id)personWithUUID:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__236623;
  v16 = __Block_byref_object_dispose__236624;
  v17 = 0;
  -[HMDPersonCoreDataManager context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __43__HMDPersonCoreDataManager_personWithUUID___block_invoke;
  v9[3] = &unk_24E79C0A8;
  v11 = &v12;
  v9[4] = self;
  v6 = v4;
  v10 = v6;
  objc_msgSend(v5, "unsafeSynchronousBlock:", v9);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (void)enumeratePersonsUsingBlock:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__236623;
  v16 = __Block_byref_object_dispose__236624;
  v17 = 0;
  -[HMDPersonCoreDataManager context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x24BDAC760];
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __55__HMDPersonCoreDataManager_enumeratePersonsUsingBlock___block_invoke;
  v11[3] = &unk_24E79B698;
  v11[4] = self;
  v11[5] = &v12;
  objc_msgSend(v5, "unsafeSynchronousBlock:", v11);

  v7 = (void *)v13[5];
  v9[0] = v6;
  v9[1] = 3221225472;
  v9[2] = __55__HMDPersonCoreDataManager_enumeratePersonsUsingBlock___block_invoke_2;
  v9[3] = &unk_24E798538;
  v8 = v4;
  v10 = v8;
  objc_msgSend(v7, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v9);

  _Block_object_dispose(&v12, 8);
}

- (id)addOrUpdatePersons:(id)a3 andRemovePersonsWithUUIDs:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  HMDPersonCoreDataManager *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  _QWORD v26[4];
  id v27;
  HMDPersonCoreDataManager *v28;
  id v29;
  id v30;
  uint8_t buf[4];
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[HMDPersonCoreDataManager home](self, "home");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    if (!-[HMDPersonCoreDataManager shouldDispatchToPrimaryResident](self, "shouldDispatchToPrimaryResident"))
    {
      v17 = objc_alloc_init(MEMORY[0x24BE6B608]);
      v18 = (void *)MEMORY[0x24BE6B628];
      -[HMDPersonCoreDataManager workQueue](self, "workQueue");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "schedulerWithDispatchQueue:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "reschedule:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      -[HMDPersonCoreDataManager context](self, "context");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v26[0] = MEMORY[0x24BDAC760];
      v26[1] = 3221225472;
      v26[2] = __73__HMDPersonCoreDataManager_addOrUpdatePersons_andRemovePersonsWithUUIDs___block_invoke;
      v26[3] = &unk_24E79A910;
      v27 = v6;
      v28 = self;
      v29 = v7;
      v23 = v21;
      v30 = v23;
      objc_msgSend(v22, "performBlock:", v26);

      v24 = v30;
      v16 = v23;

      goto LABEL_9;
    }
    -[HMDPersonCoreDataManager residentSyncManager](self, "residentSyncManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addOrUpdatePersons:andRemovePersonsWithUUIDs:", v6, v7);
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = (void *)MEMORY[0x227676638]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v32 = v14;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Home reference was nil while adding or updating persons", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v11);
    v15 = (void *)MEMORY[0x24BE6B608];
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 48);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "futureWithError:", v9);
    v10 = objc_claimAutoreleasedReturnValue();
  }
  v16 = (id)v10;

LABEL_9:
  return v16;
}

- (id)removeAllAssociatedData
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  HMDPersonCoreDataManager *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  HMDPersonCoreDataManager *v13;
  NSObject *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  _QWORD v25[5];
  id v26;
  id v27;
  uint8_t buf[4];
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  -[HMDPersonCoreDataManager home](self, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v6 = (void *)MEMORY[0x227676638]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v29 = v9;
      _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_ERROR, "%{public}@Home reference was nil while removing all associated data", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v6);
    v10 = (void *)MEMORY[0x24BE6B608];
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 48);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "futureWithError:", v4);
    v5 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  if (-[HMDPersonCoreDataManager shouldDispatchToPrimaryResident](self, "shouldDispatchToPrimaryResident"))
  {
    -[HMDPersonCoreDataManager residentSyncManager](self, "residentSyncManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeAllAssociatedData");
    v5 = objc_claimAutoreleasedReturnValue();
LABEL_7:
    v11 = (id)v5;

    goto LABEL_11;
  }
  v12 = (void *)MEMORY[0x227676638]();
  v13 = self;
  HMFGetOSLogHandle();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v29 = v15;
    _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_INFO, "%{public}@Removing all associated data", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v12);
  v16 = objc_alloc_init(MEMORY[0x24BE6B608]);
  v17 = (void *)MEMORY[0x24BE6B628];
  -[HMDPersonCoreDataManager workQueue](v13, "workQueue");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "schedulerWithDispatchQueue:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "reschedule:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDPersonCoreDataManager context](v13, "context");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __51__HMDPersonCoreDataManager_removeAllAssociatedData__block_invoke;
  v25[3] = &unk_24E79BBD0;
  v25[4] = v13;
  v26 = v3;
  v22 = v20;
  v27 = v22;
  objc_msgSend(v21, "performBlock:", v25);

  v23 = v27;
  v11 = v22;

LABEL_11:
  return v11;
}

- (id)deletedPersonUUIDsUserInfoKey
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDD17C8];
  -[HMDPersonCoreDataManager UUID](self, "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("HMDPersonCoreDataManagerDeletedPersonUUIDs.%@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)persons
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  HMDPersonCoreDataManager *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  -[HMDPersonCoreDataManager home](self, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[HMDPersonCoreDataManager userUUID](self, "userUUID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      if (objc_msgSend(v3, "isOwnerUser"))
      {
        -[HMDPersonCoreDataManager userUUID](self, "userUUID");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDPersonCoreDataManager context](self, "context");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "managedObjectContext");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        +[_MKFModel modelWithModelID:context:](_MKFUser, "modelWithModelID:context:", v5, v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v8, "personsFromPhotos");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v9;
        v11 = &__block_literal_global_236604;
      }
      else
      {
        objc_msgSend(v3, "uuid");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDPersonCoreDataManager context](self, "context");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "managedObjectContext");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        +[MKFCKModel modelWithModelID:context:error:](MKFCKSharedUserDataRoot, "modelWithModelID:context:error:", v20, v22, 0);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v8, "personsFromPhotos");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v9;
        v11 = &__block_literal_global_18_236605;
      }
    }
    else
    {
      objc_msgSend(v3, "uuid");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDPersonCoreDataManager context](self, "context");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "managedObjectContext");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      +[_MKFModel modelWithModelID:context:](_MKFHome, "modelWithModelID:context:", v17, v19);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "persons");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      v11 = &__block_literal_global_21_236606;
    }
    objc_msgSend(v9, "na_map:", v11);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = (void *)MEMORY[0x227676638]();
    v13 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 138543362;
      v25 = v15;
      _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_ERROR, "%{public}@Home reference was nil while fetching all persons", (uint8_t *)&v24, 0xCu);

    }
    objc_autoreleasePoolPop(v12);
    objc_msgSend(MEMORY[0x24BDBCF20], "set");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v16;
}

- (void)insertOrUpdatePersonUsingPerson:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  MKFCKSharedUserPhotosPerson *v10;
  _MKFPhotosPerson *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  HMDPersonCoreDataManager *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _MKFHomePerson *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  MKFCKSharedUserPhotosPerson *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  int v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDPersonCoreDataManager home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[HMDPersonCoreDataManager userUUID](self, "userUUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      if (!objc_msgSend(v5, "isOwnerUser"))
      {
        objc_msgSend(v4, "UUID");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDPersonCoreDataManager context](self, "context");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "managedObjectContext");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        +[MKFCKModel modelWithModelID:context:error:](MKFCKSharedUserPhotosPerson, "modelWithModelID:context:error:", v30, v32, 0);
        v10 = (MKFCKSharedUserPhotosPerson *)objc_claimAutoreleasedReturnValue();

        if (!v10)
        {
          v33 = [MKFCKSharedUserPhotosPerson alloc];
          -[HMDPersonCoreDataManager context](self, "context");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "managedObjectContext");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = -[MKFCKSharedUserPhotosPerson initWithContext:](v33, "initWithContext:", v35);

          objc_msgSend(v4, "UUID");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          -[MKFCKSharedUserPhotosPerson setModelID:](v10, "setModelID:", v36);

          objc_msgSend(v5, "uuid");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDPersonCoreDataManager context](self, "context");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "managedObjectContext");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          +[MKFCKModel modelWithModelID:context:error:](MKFCKSharedUserDataRoot, "modelWithModelID:context:error:", v37, v39, 0);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          -[MKFCKSharedUserPhotosPerson setRoot:](v10, "setRoot:", v40);

          objc_msgSend(v5, "uuid");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          -[MKFCKSharedUserPhotosPerson setHomeModelID:](v10, "setHomeModelID:", v41);

        }
        goto LABEL_14;
      }
      objc_msgSend(v4, "UUID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDPersonCoreDataManager context](self, "context");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "managedObjectContext");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[_MKFModel modelWithModelID:context:](_MKFPhotosPerson, "modelWithModelID:context:", v7, v9);
      v10 = (MKFCKSharedUserPhotosPerson *)objc_claimAutoreleasedReturnValue();

      if (!v10)
      {
        v11 = [_MKFPhotosPerson alloc];
        -[HMDPersonCoreDataManager context](self, "context");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "managedObjectContext");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = -[_MKFPhotosPerson initWithContext:](v11, "initWithContext:", v13);

        objc_msgSend(v4, "UUID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[MKFCKSharedUserPhotosPerson setModelID:](v10, "setModelID:", v14);

        -[HMDPersonCoreDataManager userUUID](self, "userUUID");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDPersonCoreDataManager context](self, "context");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "managedObjectContext");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        +[_MKFModel modelWithModelID:context:](_MKFUser, "modelWithModelID:context:", v15, v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[MKFCKSharedUserPhotosPerson setUser:](v10, "setUser:", v18);
LABEL_11:

      }
    }
    else
    {
      objc_msgSend(v4, "UUID");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDPersonCoreDataManager context](self, "context");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "managedObjectContext");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      +[_MKFModel modelWithModelID:context:](_MKFHomePerson, "modelWithModelID:context:", v23, v25);
      v10 = (MKFCKSharedUserPhotosPerson *)objc_claimAutoreleasedReturnValue();

      if (!v10)
      {
        v26 = [_MKFHomePerson alloc];
        -[HMDPersonCoreDataManager context](self, "context");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "managedObjectContext");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = -[_MKFHomePerson initWithContext:](v26, "initWithContext:", v28);

        objc_msgSend(v4, "UUID");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[MKFCKSharedUserPhotosPerson setModelID:](v10, "setModelID:", v29);

        objc_msgSend(v5, "uuid");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDPersonCoreDataManager context](self, "context");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "managedObjectContext");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        +[_MKFModel modelWithModelID:context:](_MKFHome, "modelWithModelID:context:", v15, v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[MKFCKSharedUserPhotosPerson setHome:](v10, "setHome:", v18);
        goto LABEL_11;
      }
    }
LABEL_14:
    -[MKFCKSharedUserPhotosPerson updateWithHMPerson:](v10, "updateWithHMPerson:", v4);

    goto LABEL_15;
  }
  v19 = (void *)MEMORY[0x227676638]();
  v20 = self;
  HMFGetOSLogHandle();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = 138543362;
    v43 = v22;
    _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_ERROR, "%{public}@Home reference was nil while inserting / updating person", (uint8_t *)&v42, 0xCu);

  }
  objc_autoreleasePoolPop(v19);
LABEL_15:

}

- (id)personWithModelID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  __objc2_class *v7;
  void *v8;
  HMDPersonCoreDataManager *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  int v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDPersonCoreDataManager home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[HMDPersonCoreDataManager userUUID](self, "userUUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      if (!objc_msgSend(v5, "isOwnerUser"))
      {
        -[HMDPersonCoreDataManager context](self, "context");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "managedObjectContext");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        +[MKFCKModel modelWithModelID:context:error:](MKFCKSharedUserPhotosPerson, "modelWithModelID:context:error:", v4, v14, 0);
        v15 = objc_claimAutoreleasedReturnValue();
        goto LABEL_11;
      }
      v7 = _MKFPhotosPerson;
    }
    else
    {
      v7 = _MKFHomePerson;
    }
    -[HMDPersonCoreDataManager context](self, "context");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "managedObjectContext");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[__objc2_class modelWithModelID:context:](v7, "modelWithModelID:context:", v4, v14);
    v15 = objc_claimAutoreleasedReturnValue();
LABEL_11:
    v16 = (void *)v15;

    objc_msgSend(v16, "createHMPerson");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_12;
  }
  v8 = (void *)MEMORY[0x227676638]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138543362;
    v19 = v11;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Home reference was nil while fetching person with model ID", (uint8_t *)&v18, 0xCu);

  }
  objc_autoreleasePoolPop(v8);
  v12 = 0;
LABEL_12:

  return v12;
}

- (id)personModelWithModelID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  __objc2_class *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v4 = a3;
  -[HMDPersonCoreDataManager home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[HMDPersonCoreDataManager userUUID](self, "userUUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      if (!objc_msgSend(v5, "isOwnerUser"))
      {
        -[HMDPersonCoreDataManager context](self, "context");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "managedObjectContext");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        +[MKFCKModel modelWithModelID:context:error:](MKFCKSharedUserPhotosPerson, "modelWithModelID:context:error:", v4, v10, 0);
        v11 = objc_claimAutoreleasedReturnValue();
        goto LABEL_9;
      }
      v7 = _MKFPhotosPerson;
    }
    else
    {
      v7 = _MKFHomePerson;
    }
    -[HMDPersonCoreDataManager context](self, "context");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "managedObjectContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[__objc2_class modelWithModelID:context:](v7, "modelWithModelID:context:", v4, v10);
    v11 = objc_claimAutoreleasedReturnValue();
LABEL_9:
    v8 = (void *)v11;

    goto LABEL_10;
  }
  v8 = 0;
LABEL_10:

  return v8;
}

- (BOOL)shouldDispatchToPrimaryResident
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  HMDPersonCoreDataManager *v8;
  NSObject *v9;
  void *v10;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  -[HMDPersonCoreDataManager home](self, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
  {
    v7 = (void *)MEMORY[0x227676638]();
    v8 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543362;
      v13 = v10;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_ERROR, "%{public}@Home reference was nil while checking we should dispatch to primary resident", (uint8_t *)&v12, 0xCu);

    }
    objc_autoreleasePoolPop(v7);
    goto LABEL_8;
  }
  if ((objc_msgSend(v3, "isCurrentDeviceConfirmedPrimaryResident") & 1) != 0)
  {
LABEL_8:
    v6 = 0;
    goto LABEL_11;
  }
  -[HMDPersonCoreDataManager userUUID](self, "userUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    v6 = objc_msgSend(v4, "isOwnerUser");
  else
    v6 = 1;

LABEL_11:
  return v6;
}

- (BOOL)isRelevantManagedObjectContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  HMDPersonCoreDataManager *v15;
  NSObject *v16;
  void *v17;
  int v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDPersonCoreDataManager home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
    v14 = (void *)MEMORY[0x227676638]();
    v15 = self;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543362;
      v20 = v17;
      _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_ERROR, "%{public}@Home reference was nil while checking if managed object context was relevant", (uint8_t *)&v19, 0xCu);

    }
    objc_autoreleasePoolPop(v14);
    goto LABEL_7;
  }
  objc_msgSend(v5, "backingStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "coreData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isRelatedContext:", v4);

  if (!v9)
  {
LABEL_7:
    v13 = 0;
    goto LABEL_8;
  }
  objc_msgSend(v4, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uuid");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  HMDWorkingContextNameForHomeUUID(v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v10, "isEqualToString:", v12);

LABEL_8:
  return v13;
}

- (BOOL)isRelevantPerson:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  HMDPersonCoreDataManager *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  HMDPersonCoreDataManager *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  const char *v28;
  int v30;
  void *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  if (v6)
  {
    -[HMDPersonCoreDataManager home](self, "home");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = (id)v7;
      objc_msgSend(v6, "hmd_lastKnownValueForKey:", CFSTR("home"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (v9)
      {
        objc_msgSend(v9, "modelID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "uuid");
        v12 = objc_claimAutoreleasedReturnValue();
LABEL_15:
        v17 = (void *)v12;
        v18 = objc_msgSend(v11, "isEqual:", v12);

LABEL_26:
        goto LABEL_27;
      }
      v23 = (void *)MEMORY[0x227676638]();
      v24 = self;
      HMFGetOSLogHandle();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "debugDescription");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = 138543618;
        v31 = v26;
        v32 = 2112;
        v33 = v27;
        v28 = "%{public}@Home relationship is nil for home person checked for relevance: %@";
LABEL_24:
        _os_log_impl(&dword_2218F0000, v25, OS_LOG_TYPE_ERROR, v28, (uint8_t *)&v30, 0x16u);

        goto LABEL_25;
      }
      goto LABEL_25;
    }
    v19 = (void *)MEMORY[0x227676638]();
    v20 = self;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = 138543362;
      v31 = v22;
      _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_ERROR, "%{public}@Home reference was nil while checking if person was relevant", (uint8_t *)&v30, 0xCu);

    }
    objc_autoreleasePoolPop(v19);
    v8 = 0;
  }
  else
  {
    v13 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v14 = v13;
    else
      v14 = 0;
    v8 = v14;

    if (v8)
    {
      -[HMDPersonCoreDataManager userUUID](self, "userUUID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        objc_msgSend(v8, "hmd_lastKnownValueForKey:", CFSTR("user"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v16;
        if (v16)
        {
          objc_msgSend(v16, "modelID");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDPersonCoreDataManager userUUID](self, "userUUID");
          v12 = objc_claimAutoreleasedReturnValue();
          goto LABEL_15;
        }
        v23 = (void *)MEMORY[0x227676638]();
        v24 = self;
        HMFGetOSLogHandle();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "debugDescription");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = 138543618;
          v31 = v26;
          v32 = 2112;
          v33 = v27;
          v28 = "%{public}@User relationship is nil for photos person checked for relevance: %@";
          goto LABEL_24;
        }
LABEL_25:

        objc_autoreleasePoolPop(v23);
        v18 = 0;
        goto LABEL_26;
      }
    }
  }
  v18 = 0;
LABEL_27:

  return v18;
}

- (void)handleManagedObjectContextWillSaveNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  HMDPersonCoreDataManager *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[5];
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  if (v7 && -[HMDPersonCoreDataManager isRelevantManagedObjectContext:](self, "isRelevantManagedObjectContext:", v7))
  {
    objc_msgSend(v7, "deletedObjects");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __75__HMDPersonCoreDataManager_handleManagedObjectContextWillSaveNotification___block_invoke;
    v18[3] = &unk_24E798620;
    v18[4] = self;
    objc_msgSend(v8, "na_map:", v18);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v9, "count"))
    {
      v10 = (void *)MEMORY[0x227676638]();
      v11 = self;
      HMFGetOSLogHandle();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v20 = v13;
        v21 = 2112;
        v22 = v9;
        _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@Received notification of impending delete for person UUIDs: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v10);
      objc_msgSend(v7, "userInfo");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDPersonCoreDataManager deletedPersonUUIDsUserInfoKey](v11, "deletedPersonUUIDsUserInfoKey");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v14;
      v17 = v9;
    }
    else
    {
      objc_msgSend(v7, "userInfo");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDPersonCoreDataManager deletedPersonUUIDsUserInfoKey](self, "deletedPersonUUIDsUserInfoKey");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v14;
      v17 = 0;
    }
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v17, v15);

  }
}

- (void)handleManagedObjectContextDidSaveNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  id v15;
  void *v16;
  id v17;
  void *v18;
  HMDPersonCoreDataManager *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  id v30;
  void *v31;
  id v32;
  void *v33;
  HMDPersonCoreDataManager *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  HMDPersonCoreDataManager *v44;
  NSObject *v45;
  void *v46;
  NSObject *v47;
  id v48;
  id v49;
  void *v50;
  id v51;
  void *v52;
  void *v53;
  _QWORD block[5];
  id v55;
  id v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  uint8_t v65[128];
  uint8_t buf[4];
  void *v67;
  __int16 v68;
  id v69;
  _BYTE v70[128];
  uint64_t v71;

  v71 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  if (v7 && -[HMDPersonCoreDataManager isRelevantManagedObjectContext:](self, "isRelevantManagedObjectContext:", v7))
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = v4;
    objc_msgSend(v4, "userInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "hmf_setForKey:", *MEMORY[0x24BDBB430]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v63 = 0u;
    v64 = 0u;
    v62 = 0u;
    v61 = 0u;
    v10 = v9;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v61, v70, 16);
    v52 = v10;
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v62;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v62 != v13)
            objc_enumerationMutation(v10);
          v15 = *(id *)(*((_QWORD *)&v61 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v16 = v15;
          else
            v16 = 0;
          v17 = v16;

          if (v17 && -[HMDPersonCoreDataManager isRelevantPerson:](self, "isRelevantPerson:", v17))
          {
            v18 = (void *)MEMORY[0x227676638]();
            v19 = self;
            HMFGetOSLogHandle();
            v20 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v67 = v21;
              v68 = 2112;
              v69 = v17;
              _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_INFO, "%{public}@Received notification about inserted person: %@", buf, 0x16u);

              v10 = v52;
            }

            objc_autoreleasePoolPop(v18);
            objc_msgSend(v17, "createHMPerson");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v53, "addObject:", v22);

          }
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v61, v70, 16);
      }
      while (v12);
    }

    objc_msgSend(v50, "userInfo");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "hmf_setForKey:", *MEMORY[0x24BDBB598]);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v59 = 0u;
    v60 = 0u;
    v57 = 0u;
    v58 = 0u;
    v25 = v24;
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v57, v65, 16);
    v51 = v25;
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v58;
      do
      {
        for (j = 0; j != v27; ++j)
        {
          if (*(_QWORD *)v58 != v28)
            objc_enumerationMutation(v25);
          v30 = *(id *)(*((_QWORD *)&v57 + 1) + 8 * j);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v31 = v30;
          else
            v31 = 0;
          v32 = v31;

          if (v32 && -[HMDPersonCoreDataManager isRelevantPerson:](self, "isRelevantPerson:", v32))
          {
            v33 = (void *)MEMORY[0x227676638]();
            v34 = self;
            HMFGetOSLogHandle();
            v35 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v67 = v36;
              v68 = 2112;
              v69 = v32;
              _os_log_impl(&dword_2218F0000, v35, OS_LOG_TYPE_INFO, "%{public}@Received notification about updated person: %@", buf, 0x16u);

              v25 = v51;
            }

            objc_autoreleasePoolPop(v33);
            objc_msgSend(v32, "createHMPerson");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v53, "addObject:", v37);

          }
        }
        v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v57, v65, 16);
      }
      while (v27);
    }

    objc_msgSend(v7, "userInfo");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDPersonCoreDataManager deletedPersonUUIDsUserInfoKey](self, "deletedPersonUUIDsUserInfoKey");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "objectForKeyedSubscript:", v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "userInfo");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDPersonCoreDataManager deletedPersonUUIDsUserInfoKey](self, "deletedPersonUUIDsUserInfoKey");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setObject:forKeyedSubscript:", 0, v42);

    if (v40)
    {
      v43 = (void *)MEMORY[0x227676638]();
      v44 = self;
      HMFGetOSLogHandle();
      v45 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v67 = v46;
        v68 = 2112;
        v69 = v40;
        _os_log_impl(&dword_2218F0000, v45, OS_LOG_TYPE_INFO, "%{public}@Received notification about deleted person UUIDs: %@", buf, 0x16u);

        v25 = v51;
      }

      objc_autoreleasePoolPop(v43);
    }
    -[HMDPersonCoreDataManager workQueue](self, "workQueue");
    v47 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __74__HMDPersonCoreDataManager_handleManagedObjectContextDidSaveNotification___block_invoke;
    block[3] = &unk_24E79BBD0;
    block[4] = self;
    v55 = v53;
    v56 = v40;
    v48 = v40;
    v49 = v53;
    dispatch_async(v47, block);

    v4 = v50;
  }

}

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[HMDPersonCoreDataManager UUID](self, "UUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (HMDPersonCoreDataManagerDelegate)delegate
{
  return (HMDPersonCoreDataManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16, 1);
}

- (NSUUID)UUID
{
  return (NSUUID *)objc_getProperty(self, a2, 24, 1);
}

- (HMDHome)home
{
  return (HMDHome *)objc_loadWeakRetained((id *)&self->_home);
}

- (void)setHome:(id)a3
{
  objc_storeWeak((id *)&self->_home, a3);
}

- (NSUUID)userUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 40, 1);
}

- (void)setUserUUID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

- (HMCContext)context
{
  return (HMCContext *)objc_getProperty(self, a2, 48, 1);
}

- (HMDPersonResidentSyncManager)residentSyncManager
{
  return (HMDPersonResidentSyncManager *)objc_getProperty(self, a2, 56, 1);
}

- (NSNotificationCenter)notificationCenter
{
  return (NSNotificationCenter *)objc_getProperty(self, a2, 64, 1);
}

- (HMDPersonDataSource)dataSource
{
  return (HMDPersonDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_residentSyncManager, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_userUUID, 0);
  objc_destroyWeak((id *)&self->_home);
  objc_storeStrong((id *)&self->_UUID, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __74__HMDPersonCoreDataManager_handleManagedObjectContextDidSaveNotification___block_invoke(id *a1)
{
  id v2;

  objc_msgSend(a1[4], "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(a1[5], "count"))
    objc_msgSend(v2, "coreDataManager:didUpdatePersons:", a1[4], a1[5]);
  if (objc_msgSend(a1[6], "count"))
    objc_msgSend(v2, "coreDataManager:didRemovePersonsWithUUIDs:", a1[4], a1[6]);

}

id __75__HMDPersonCoreDataManager_handleManagedObjectContextWillSaveNotification___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;
  if (v5 && objc_msgSend(*(id *)(a1 + 32), "isRelevantPerson:", v5))
  {
    objc_msgSend(v5, "modelID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

uint64_t __35__HMDPersonCoreDataManager_persons__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "createHMPerson");
}

uint64_t __35__HMDPersonCoreDataManager_persons__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "createHMPerson");
}

uint64_t __35__HMDPersonCoreDataManager_persons__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "createHMPerson");
}

void __51__HMDPersonCoreDataManager_removeAllAssociatedData__block_invoke(id *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t k;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  id v31;
  void *v32;
  id v33;
  NSObject *v34;
  void *v35;
  id v36;
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
  __int128 v47;
  __int128 v48;
  uint8_t buf[4];
  void *v50;
  __int16 v51;
  id v52;
  _BYTE v53[128];
  _BYTE v54[128];
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1[4], "userUUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    if (objc_msgSend(a1[5], "isOwnerUser"))
    {
      objc_msgSend(a1[4], "userUUID");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      +[HMCContext findUserWithModelID:](HMCContext, "findUserWithModelID:", v3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      v47 = 0u;
      v48 = 0u;
      v45 = 0u;
      v46 = 0u;
      objc_msgSend(v4, "personsFromPhotos");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v45, v55, 16);
      if (v6)
      {
        v7 = v6;
        v8 = *(_QWORD *)v46;
        do
        {
          for (i = 0; i != v7; ++i)
          {
            if (*(_QWORD *)v46 != v8)
              objc_enumerationMutation(v5);
            v10 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * i);
            objc_msgSend(a1[4], "context");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "deleteObject:", v10);

          }
          v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v45, v55, 16);
        }
        while (v7);
      }
    }
    else
    {
      objc_msgSend(a1[5], "uuid");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[4], "context");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "managedObjectContext");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      +[MKFCKModel modelWithModelID:context:error:](MKFCKSharedUserDataRoot, "modelWithModelID:context:error:", v19, v21, 0);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      v43 = 0u;
      v44 = 0u;
      v41 = 0u;
      v42 = 0u;
      objc_msgSend(v4, "personsFromPhotos");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v41, v54, 16);
      if (v22)
      {
        v23 = v22;
        v24 = *(_QWORD *)v42;
        do
        {
          for (j = 0; j != v23; ++j)
          {
            if (*(_QWORD *)v42 != v24)
              objc_enumerationMutation(v5);
            v26 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * j);
            objc_msgSend(a1[4], "context");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "managedObjectContext");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "deleteObject:", v26);

          }
          v23 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v41, v54, 16);
        }
        while (v23);
      }
    }
  }
  else
  {
    objc_msgSend(a1[5], "uuid");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMCContext findHomeWithModelID:](HMCContext, "findHomeWithModelID:", v12);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    objc_msgSend(v4, "persons");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v37, v53, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v38;
      do
      {
        for (k = 0; k != v14; ++k)
        {
          if (*(_QWORD *)v38 != v15)
            objc_enumerationMutation(v5);
          v17 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * k);
          objc_msgSend(a1[4], "context");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "deleteObject:", v17);

        }
        v14 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v37, v53, 16);
      }
      while (v14);
    }
  }

  objc_msgSend(a1[4], "context");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = 0;
  v30 = objc_msgSend(v29, "save:", &v36);
  v31 = v36;

  if (v30)
  {
    objc_msgSend(a1[6], "finishWithNoResult");
  }
  else
  {
    v32 = (void *)MEMORY[0x227676638]();
    v33 = a1[4];
    HMFGetOSLogHandle();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v50 = v35;
      v51 = 2112;
      v52 = v31;
      _os_log_impl(&dword_2218F0000, v34, OS_LOG_TYPE_ERROR, "%{public}@Failed to remove all associated data: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v32);
    objc_msgSend(a1[6], "finishWithError:", v31);
  }

}

void __73__HMDPersonCoreDataManager_addOrUpdatePersons_andRemovePersonsWithUUIDs___block_invoke(id *a1)
{
  id *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t j;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  void *v22;
  void *v23;
  int v24;
  id v25;
  void *v26;
  id v27;
  NSObject *v28;
  void *v29;
  id *v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  id v43;
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v1 = a1;
  v46 = *MEMORY[0x24BDAC8D0];
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v2 = a1[4];
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v37 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(v1[5], "insertOrUpdatePersonUsingPerson:", *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * i));
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
    }
    while (v4);
  }

  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v7 = v1[6];
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v32, v44, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v33;
    v30 = v1;
    do
    {
      for (j = 0; j != v9; ++j)
      {
        if (*(_QWORD *)v33 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * j);
        objc_msgSend(v1[5], "personModelWithModelID:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          objc_msgSend(v1[5], "context");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "managedObjectContext");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "deleteObject:", v13);

        }
        else
        {
          v16 = (void *)MEMORY[0x227676638]();
          v17 = v1[5];
          HMFGetOSLogHandle();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            HMFGetLogIdentifier();
            v19 = v9;
            v20 = v10;
            v21 = v7;
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v41 = v22;
            v42 = 2112;
            v43 = v12;
            _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@No person found with UUID %@, ignoring request to delete it.", buf, 0x16u);

            v7 = v21;
            v10 = v20;
            v9 = v19;
            v1 = v30;
          }

          objc_autoreleasePoolPop(v16);
        }

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v32, v44, 16);
    }
    while (v9);
  }

  objc_msgSend(v1[5], "context");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0;
  v24 = objc_msgSend(v23, "save:", &v31);
  v25 = v31;

  if (v24)
  {
    objc_msgSend(v1[7], "finishWithNoResult");
  }
  else
  {
    v26 = (void *)MEMORY[0x227676638]();
    v27 = v1[5];
    HMFGetOSLogHandle();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v41 = v29;
      v42 = 2112;
      v43 = v25;
      _os_log_impl(&dword_2218F0000, v28, OS_LOG_TYPE_ERROR, "%{public}@Failed to add or update persons: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v26);
    objc_msgSend(v1[7], "finishWithError:", v25);
  }

}

void __55__HMDPersonCoreDataManager_enumeratePersonsUsingBlock___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "persons");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __55__HMDPersonCoreDataManager_enumeratePersonsUsingBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __43__HMDPersonCoreDataManager_personWithUUID___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "personWithModelID:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

+ (id)logCategory
{
  if (logCategory__hmf_once_t25_236634 != -1)
    dispatch_once(&logCategory__hmf_once_t25_236634, &__block_literal_global_33_236635);
  return (id)logCategory__hmf_once_v26_236636;
}

void __39__HMDPersonCoreDataManager_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v26_236636;
  logCategory__hmf_once_v26_236636 = v0;

}

@end
