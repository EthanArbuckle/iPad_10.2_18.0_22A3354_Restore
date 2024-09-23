@implementation HMDPersonResidentSyncManager

- (HMDPersonResidentSyncManager)initWithUUID:(id)a3 messageDispatcher:(id)a4 workQueue:(id)a5 residentSyncManager:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  HMDPersonResidentSyncManager *v14;
  HMDPersonResidentSyncManager *v15;
  uint64_t v16;
  NSUUID *UUID;
  objc_super v19;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)HMDPersonResidentSyncManager;
  v14 = -[HMDPersonResidentSyncManager init](&v19, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_workQueue, a5);
    v16 = objc_msgSend(v10, "copy");
    UUID = v15->_UUID;
    v15->_UUID = (NSUUID *)v16;

    objc_storeStrong((id *)&v15->_messageDispatcher, a4);
    objc_storeStrong((id *)&v15->_residentSyncManager, a6);
  }

  return v15;
}

- (void)configureWithHome:(id)a3 delegate:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[HMDPersonResidentSyncManager setDelegate:](self, "setDelegate:", a4);
  +[HMDUserMessagePolicy userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:](HMDUserMessagePolicy, "userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:", v6, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  +[HMDRemoteMessagePolicy defaultSecurePolicy](HMDMutableRemoteMessagePolicy, "defaultSecurePolicy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setRoles:", objc_msgSend(v8, "roles") | 4);
  -[HMDPersonResidentSyncManager messageDispatcher](self, "messageDispatcher");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v7;
  v14[1] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "registerForMessage:receiver:policies:selector:", CFSTR("HMDPRSM.m.modifyPersons"), self, v10, sel_handleModifyPersonsMessage_);

  -[HMDPersonResidentSyncManager messageDispatcher](self, "messageDispatcher");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v7;
  v13[1] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "registerForMessage:receiver:policies:selector:", CFSTR("HMDPRSM.m.removeAllAssociatedData"), self, v12, sel_handleRemoveAllAssociatedDataMessage_);

}

- (id)addOrUpdatePersons:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HMDPersonResidentSyncManager *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  HMDPersonResidentSyncManager *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  _QWORD v36[5];
  id v37;
  id v38;
  id v39;
  id v40;
  const __CFString *v41;
  void *v42;
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  id v48;
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE3F138]), "initWithName:", CFSTR("Add persons"));
  v6 = (void *)MEMORY[0x227676638]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "shortDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v44 = v9;
    v45 = 2114;
    v46 = v11;
    v47 = 2112;
    v48 = v4;
    _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Adding/updating persons: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v6);
  v40 = 0;
  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v4, 1, &v40);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v40;
  if (v12)
  {
    v14 = objc_alloc_init(MEMORY[0x24BE6B608]);
    v15 = (void *)MEMORY[0x24BE6B628];
    -[HMDPersonResidentSyncManager workQueue](v7, "workQueue");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "schedulerWithDispatchQueue:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "reschedule:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v41 = CFSTR("HMDPRSM.mk.persons");
    v42 = v12;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v42, &v41, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_alloc(MEMORY[0x24BE3F1B8]);
    -[HMDPersonResidentSyncManager UUID](v7, "UUID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(v20, "initWithTarget:", v21);

    objc_msgSend(MEMORY[0x24BE3F1D0], "messageWithName:destination:payload:", CFSTR("HMDPRSM.m.addOrUpdatePersons"), v22, v19);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = MEMORY[0x24BDAC760];
    v36[1] = 3221225472;
    v36[2] = __51__HMDPersonResidentSyncManager_addOrUpdatePersons___block_invoke;
    v36[3] = &unk_24E78C6D8;
    v36[4] = v7;
    v37 = v5;
    v24 = v18;
    v38 = v24;
    v39 = v4;
    objc_msgSend(v23, "setResponseHandler:", v36);
    -[HMDPersonResidentSyncManager residentSyncManager](v7, "residentSyncManager");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "performResidentRequest:options:", v23, 0);

    v26 = v39;
    v27 = v24;

  }
  else
  {
    v28 = (void *)MEMORY[0x227676638]();
    v29 = v7;
    HMFGetOSLogHandle();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "identifier");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "shortDescription");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v44 = v31;
      v45 = 2114;
      v46 = v33;
      v47 = 2112;
      v48 = v13;
      _os_log_impl(&dword_2218F0000, v30, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Failed to serialize persons: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v28);
    v34 = (void *)MEMORY[0x24BE6B608];
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", -1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "futureWithError:", v19);
    v27 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v27;
}

- (id)removePersonsWithUUIDs:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HMDPersonResidentSyncManager *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  id v29;
  uint64_t v31;
  uint64_t v32;
  void (*v33)(id *, void *, void *);
  void *v34;
  HMDPersonResidentSyncManager *v35;
  id v36;
  id v37;
  id v38;
  const __CFString *v39;
  void *v40;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  id v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE3F138]), "initWithName:", CFSTR("Remove persons"));
  v6 = (void *)MEMORY[0x227676638]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "shortDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v42 = v9;
    v43 = 2114;
    v44 = v11;
    v45 = 2112;
    v46 = v4;
    _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Removing persons with UUIDs from persons data set: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v6);
  v12 = objc_alloc_init(MEMORY[0x24BE6B608]);
  v13 = (void *)MEMORY[0x24BE6B628];
  -[HMDPersonResidentSyncManager workQueue](v7, "workQueue");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "schedulerWithDispatchQueue:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "reschedule:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "allObjects");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "na_map:", &__block_literal_global_95539);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v39 = CFSTR("HMDPRSM.mk.personUUIDs");
  v40 = v18;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v40, &v39, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_alloc(MEMORY[0x24BE3F1B8]);
  -[HMDPersonResidentSyncManager UUID](v7, "UUID");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v20, "initWithTarget:", v21);

  objc_msgSend(MEMORY[0x24BE3F1D0], "messageWithName:destination:payload:", CFSTR("HMDPRSM.m.removePersons"), v22, v19);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = MEMORY[0x24BDAC760];
  v32 = 3221225472;
  v33 = __55__HMDPersonResidentSyncManager_removePersonsWithUUIDs___block_invoke_2;
  v34 = &unk_24E78C6D8;
  v35 = v7;
  v36 = v5;
  v24 = v16;
  v37 = v24;
  v38 = v4;
  v25 = v4;
  v26 = v5;
  objc_msgSend(v23, "setResponseHandler:", &v31);
  -[HMDPersonResidentSyncManager residentSyncManager](v7, "residentSyncManager", v31, v32, v33, v34, v35);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "performResidentRequest:options:", v23, 0);

  v28 = v38;
  v29 = v24;

  return v29;
}

- (id)addOrUpdatePersons:(id)a3 andRemovePersonsWithUUIDs:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  HMDPersonResidentSyncManager *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  void *v33;
  id v34;
  void *v35;
  HMDPersonResidentSyncManager *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  id v43;
  void *v44;
  void *v46;
  void *v47;
  id v48;
  _QWORD v49[5];
  id v50;
  id v51;
  id v52;
  _QWORD v53[2];
  _QWORD v54[2];
  uint8_t buf[4];
  void *v56;
  __int16 v57;
  void *v58;
  __int16 v59;
  id v60;
  __int16 v61;
  id v62;
  uint64_t v63;

  v63 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = v6;
  v9 = v7;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE3F138]), "initWithName:", CFSTR("Modifying persons"));
  v11 = (void *)MEMORY[0x227676638]();
  v12 = self;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "shortDescription");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v56 = v14;
    v57 = 2114;
    v58 = v16;
    v59 = 2112;
    v60 = v8;
    v61 = 2112;
    v62 = v9;
    _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Adding/updating persons: %@, removing persons with UUIDs: %@", buf, 0x2Au);

  }
  objc_autoreleasePoolPop(v11);
  v52 = 0;
  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v8, 1, &v52);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = v52;
  if (v17)
  {
    v18 = objc_alloc_init(MEMORY[0x24BE6B608]);
    v19 = (void *)MEMORY[0x24BE6B628];
    -[HMDPersonResidentSyncManager workQueue](v12, "workQueue");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "schedulerWithDispatchQueue:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "reschedule:", v21);
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "allObjects");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "na_map:", &__block_literal_global_37);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v53[0] = CFSTR("HMDPRSM.mk.personsToAddOrUpdate");
    v53[1] = CFSTR("HMDPRSM.mk.personUUIDsToRemove");
    v54[0] = v17;
    v54[1] = v23;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v54, v53, 2);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_alloc(MEMORY[0x24BE3F1B8]);
    -[HMDPersonResidentSyncManager UUID](v12, "UUID");
    v26 = v8;
    v27 = v10;
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (void *)objc_msgSend(v25, "initWithTarget:", v28);

    objc_msgSend(MEMORY[0x24BE3F1D0], "messageWithName:destination:payload:", CFSTR("HMDPRSM.m.modifyPersons"), v29, v24);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v49[0] = MEMORY[0x24BDAC760];
    v49[1] = 3221225472;
    v49[2] = __77__HMDPersonResidentSyncManager_addOrUpdatePersons_andRemovePersonsWithUUIDs___block_invoke_2;
    v49[3] = &unk_24E795C28;
    v49[4] = v12;
    v47 = v27;
    v31 = v27;
    v8 = v26;
    v50 = v31;
    v32 = v46;
    v51 = v32;
    objc_msgSend(v30, "setResponseHandler:", v49);
    -[HMDPersonResidentSyncManager residentSyncManager](v12, "residentSyncManager");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "performResidentRequest:options:", v30, 0);

    if (objc_msgSend(v8, "count"))
    {
      v34 = -[HMDPersonResidentSyncManager addOrUpdatePersons:](v12, "addOrUpdatePersons:", v8);
    }
    else if (objc_msgSend(v9, "count"))
    {
      v43 = -[HMDPersonResidentSyncManager removePersonsWithUUIDs:](v12, "removePersonsWithUUIDs:", v9);
    }
    v44 = v51;
    v42 = v32;

    v10 = v47;
  }
  else
  {
    v35 = (void *)MEMORY[0x227676638]();
    v36 = v12;
    HMFGetOSLogHandle();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "identifier");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "shortDescription");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v56 = v38;
      v57 = 2114;
      v58 = v40;
      v59 = 2112;
      v60 = v48;
      _os_log_impl(&dword_2218F0000, v37, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Failed to serialize persons: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v35);
    v41 = (void *)MEMORY[0x24BE6B608];
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", -1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "futureWithError:", v23);
    v42 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v42;
}

- (id)removeAllAssociatedData
{
  void *v3;
  void *v4;
  HMDPersonResidentSyncManager *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  _QWORD v25[5];
  id v26;
  id v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE3F138]), "initWithName:", CFSTR("Remove all associated data"));
  v4 = (void *)MEMORY[0x227676638]();
  v5 = self;
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "shortDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v29 = v7;
    v30 = 2114;
    v31 = v9;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Removing all associated data", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
  v10 = objc_alloc_init(MEMORY[0x24BE6B608]);
  v11 = (void *)MEMORY[0x24BE6B628];
  -[HMDPersonResidentSyncManager workQueue](v5, "workQueue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "schedulerWithDispatchQueue:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "reschedule:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_alloc(MEMORY[0x24BE3F1B8]);
  -[HMDPersonResidentSyncManager UUID](v5, "UUID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v15, "initWithTarget:", v16);

  objc_msgSend(MEMORY[0x24BE3F1D0], "messageWithName:destination:payload:", CFSTR("HMDPRSM.m.removeAllAssociatedData"), v17, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __55__HMDPersonResidentSyncManager_removeAllAssociatedData__block_invoke;
  v25[3] = &unk_24E795C28;
  v25[4] = v5;
  v26 = v3;
  v19 = v14;
  v27 = v19;
  v20 = v3;
  objc_msgSend(v18, "setResponseHandler:", v25);
  -[HMDPersonResidentSyncManager residentSyncManager](v5, "residentSyncManager");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "performResidentRequest:options:", v18, 0);

  v22 = v27;
  v23 = v19;

  return v23;
}

- (void)handleModifyPersonsMessage:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  HMDPersonResidentSyncManager *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  HMDPersonResidentSyncManager *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  HMDPersonResidentSyncManager *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  _QWORD v30[5];
  id v31;
  id v32;
  _QWORD v33[2];
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDPersonResidentSyncManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = (void *)MEMORY[0x227676638]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "shortDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v35 = v9;
    v36 = 2112;
    v37 = v10;
    _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Handling modify persons message: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  v33[0] = objc_opt_class();
  v33[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v33, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unarchivedObjectForKey:ofClasses:", CFSTR("HMDPRSM.mk.personsToAddOrUpdate"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v4, "arrayForKey:", CFSTR("HMDPRSM.mk.personUUIDsToRemove"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      v15 = (void *)MEMORY[0x24BDBCF20];
      objc_msgSend(v13, "na_map:", &__block_literal_global_43_95510);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setWithArray:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      -[HMDPersonResidentSyncManager residentSyncManager](v7, "residentSyncManager");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v30[0] = MEMORY[0x24BDAC760];
      v30[1] = 3221225472;
      v30[2] = __59__HMDPersonResidentSyncManager_handleModifyPersonsMessage___block_invoke_2;
      v30[3] = &unk_24E782898;
      v30[4] = v7;
      v31 = v12;
      v32 = v17;
      v19 = v17;
      objc_msgSend(v18, "interceptRemoteResidentRequest:proceed:", v4, v30);

    }
    else
    {
      v25 = (void *)MEMORY[0x227676638]();
      v26 = v7;
      HMFGetOSLogHandle();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "messagePayload");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v35 = v28;
        v36 = 2112;
        v37 = v29;
        _os_log_impl(&dword_2218F0000, v27, OS_LOG_TYPE_ERROR, "%{public}@Could not find person UUID strings in message payload: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v25);
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 20);
      v19 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "respondWithError:", v19);
    }

  }
  else
  {
    v20 = (void *)MEMORY[0x227676638]();
    v21 = v7;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "messagePayload");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v35 = v23;
      v36 = 2112;
      v37 = v24;
      _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_ERROR, "%{public}@Could not find persons in message payload: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v20);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", -1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v14);
  }

}

- (void)handleRemoveAllAssociatedDataMessage:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  HMDPersonResidentSyncManager *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDPersonResidentSyncManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = (void *)MEMORY[0x227676638]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "shortDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v14 = v9;
    v15 = 2112;
    v16 = v10;
    _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Handling remove all associated data message: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  -[HMDPersonResidentSyncManager residentSyncManager](v7, "residentSyncManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __69__HMDPersonResidentSyncManager_handleRemoveAllAssociatedDataMessage___block_invoke;
  v12[3] = &unk_24E79BF48;
  v12[4] = v7;
  objc_msgSend(v11, "interceptRemoteResidentRequest:proceed:", v4, v12);

}

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[HMDPersonResidentSyncManager UUID](self, "UUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (HMDPersonResidentSyncManagerDelegate)delegate
{
  return (HMDPersonResidentSyncManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSUUID)UUID
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (HMFMessageDispatcher)messageDispatcher
{
  return (HMFMessageDispatcher *)objc_getProperty(self, a2, 24, 1);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 32, 1);
}

- (HMDResidentSyncManager)residentSyncManager
{
  return (HMDResidentSyncManager *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_residentSyncManager, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_messageDispatcher, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __69__HMDPersonResidentSyncManager_handleRemoveAllAssociatedDataMessage___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllAssociatedData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __69__HMDPersonResidentSyncManager_handleRemoveAllAssociatedDataMessage___block_invoke_2;
  v8[3] = &unk_24E798920;
  v9 = v3;
  v6 = v3;
  v7 = (id)objc_msgSend(v5, "addCompletionBlock:", v8);

}

uint64_t __69__HMDPersonResidentSyncManager_handleRemoveAllAssociatedDataMessage___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "respondWithPayload:error:", 0, a3);
}

void __59__HMDPersonResidentSyncManager_handleModifyPersonsMessage___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addOrUpdatePersons:andRemovePersonsWithUUIDs:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __59__HMDPersonResidentSyncManager_handleModifyPersonsMessage___block_invoke_3;
  v8[3] = &unk_24E798920;
  v9 = v3;
  v6 = v3;
  v7 = (id)objc_msgSend(v5, "addCompletionBlock:", v8);

}

uint64_t __59__HMDPersonResidentSyncManager_handleModifyPersonsMessage___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "respondWithPayload:error:", 0, a3);
}

id __59__HMDPersonResidentSyncManager_handleModifyPersonsMessage___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  void *v4;

  v2 = (objc_class *)MEMORY[0x24BDD1880];
  v3 = a2;
  v4 = (void *)objc_msgSend([v2 alloc], "initWithUUIDString:", v3);

  return v4;
}

void __55__HMDPersonResidentSyncManager_removeAllAssociatedData__block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x227676638]();
  v8 = a1[4];
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v5)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[5], "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "shortDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543874;
      v18 = v11;
      v19 = 2114;
      v20 = v13;
      v21 = 2112;
      v22 = v5;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Failed to remove all associated data: %@", (uint8_t *)&v17, 0x20u);

    }
    objc_autoreleasePoolPop(v7);
    objc_msgSend(a1[6], "finishWithError:", v5);
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[5], "identifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "shortDescription");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543618;
      v18 = v14;
      v19 = 2114;
      v20 = v16;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Successfully removed all associated data", (uint8_t *)&v17, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    objc_msgSend(a1[6], "finishWithNoResult");
  }

}

void __77__HMDPersonResidentSyncManager_addOrUpdatePersons_andRemovePersonsWithUUIDs___block_invoke_2(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x227676638]();
  v8 = a1[4];
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v5)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[5], "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "shortDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543874;
      v18 = v11;
      v19 = 2114;
      v20 = v13;
      v21 = 2112;
      v22 = v5;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Failed to modify persons: %@", (uint8_t *)&v17, 0x20u);

    }
    objc_autoreleasePoolPop(v7);
    objc_msgSend(a1[6], "finishWithError:", v5);
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[5], "identifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "shortDescription");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543618;
      v18 = v14;
      v19 = 2114;
      v20 = v16;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Successfully modified persons", (uint8_t *)&v17, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    objc_msgSend(a1[6], "finishWithNoResult");
  }

}

uint64_t __77__HMDPersonResidentSyncManager_addOrUpdatePersons_andRemovePersonsWithUUIDs___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "UUIDString");
}

void __55__HMDPersonResidentSyncManager_removePersonsWithUUIDs___block_invoke_2(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x227676638]();
  v8 = a1[4];
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v5)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[5], "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "shortDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543874;
      v19 = v11;
      v20 = 2114;
      v21 = v13;
      v22 = 2112;
      v23 = (uint64_t)v5;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Failed to remove persons: %@", (uint8_t *)&v18, 0x20u);

    }
    objc_autoreleasePoolPop(v7);
    objc_msgSend(a1[6], "finishWithError:", v5);
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[5], "identifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "shortDescription");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(a1[7], "count");
      v18 = 138543874;
      v19 = v14;
      v20 = 2114;
      v21 = v16;
      v22 = 2048;
      v23 = v17;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Successfully removed %lu persons", (uint8_t *)&v18, 0x20u);

    }
    objc_autoreleasePoolPop(v7);
    objc_msgSend(a1[6], "finishWithNoResult");
  }

}

uint64_t __55__HMDPersonResidentSyncManager_removePersonsWithUUIDs___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "UUIDString");
}

void __51__HMDPersonResidentSyncManager_addOrUpdatePersons___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x227676638]();
  v8 = a1[4];
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v5)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[5], "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "shortDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543874;
      v19 = v11;
      v20 = 2114;
      v21 = v13;
      v22 = 2112;
      v23 = (uint64_t)v5;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Failed to add/update persons: %@", (uint8_t *)&v18, 0x20u);

    }
    objc_autoreleasePoolPop(v7);
    objc_msgSend(a1[6], "finishWithError:", v5);
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[5], "identifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "shortDescription");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(a1[7], "count");
      v18 = 138543874;
      v19 = v14;
      v20 = 2114;
      v21 = v16;
      v22 = 2048;
      v23 = v17;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Successfully added/updated %lu persons", (uint8_t *)&v18, 0x20u);

    }
    objc_autoreleasePoolPop(v7);
    objc_msgSend(a1[6], "finishWithNoResult");
  }

}

+ (id)logCategory
{
  if (logCategory__hmf_once_t18_95557 != -1)
    dispatch_once(&logCategory__hmf_once_t18_95557, &__block_literal_global_48);
  return (id)logCategory__hmf_once_v19_95558;
}

void __43__HMDPersonResidentSyncManager_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v19_95558;
  logCategory__hmf_once_v19_95558 = v0;

}

@end
