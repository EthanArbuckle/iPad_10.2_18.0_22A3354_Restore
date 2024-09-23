@implementation HMDHomeOwnerCloudShareManager

- (HMDHomeOwnerCloudShareManager)initWithShareService:(id)a3 homeManager:(id)a4 cloudTransform:(id)a5 modelSelectionBlock:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  HMDHomeOwnerCloudShareManager *v15;
  HMDHomeOwnerCloudShareManager *v16;
  void *v17;
  id modelSelectionBlock;
  void *v19;
  void *v20;
  objc_super v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v22.receiver = self;
  v22.super_class = (Class)HMDHomeOwnerCloudShareManager;
  v15 = -[HMDHomeOwnerCloudShareManager init](&v22, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_shareService, a3);
    objc_storeStrong((id *)&v16->_cloudTransform, a5);
    objc_storeWeak((id *)&v16->_homeManager, v12);
    v17 = _Block_copy(v14);
    modelSelectionBlock = v16->_modelSelectionBlock;
    v16->_modelSelectionBlock = v17;

    +[MKFCKSharedUserDataRoot entity](MKFCKSharedUserDataRoot, "entity");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v19;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "registerCloudChangeListener:forEntities:", v16, v20);

  }
  return v16;
}

- (HMDHomeOwnerCloudShareManager)initWithContainer:(id)a3 sharedStore:(id)a4 privateStore:(id)a5 moc:(id)a6 cloudTransform:(id)a7 homeManager:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  HMDCoreDataCloudShareService *v20;
  HMDCoreDataCloudShareService *v21;
  void *v22;
  HMDHomeOwnerCloudShareManager *v23;
  _QWORD aBlock[4];
  HMDCoreDataCloudShareService *v26;

  v14 = a8;
  v15 = a7;
  v16 = a6;
  v17 = a5;
  v18 = a4;
  v19 = a3;
  v20 = -[HMDCoreDataCloudShareService initWithContainer:sharedStore:privateStore:moc:]([HMDCoreDataCloudShareService alloc], "initWithContainer:sharedStore:privateStore:moc:", v19, v18, v17, v16);

  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __107__HMDHomeOwnerCloudShareManager_initWithContainer_sharedStore_privateStore_moc_cloudTransform_homeManager___block_invoke;
  aBlock[3] = &unk_24E796F88;
  v26 = v20;
  v21 = v20;
  v22 = _Block_copy(aBlock);
  v23 = -[HMDHomeOwnerCloudShareManager initWithShareService:homeManager:cloudTransform:modelSelectionBlock:](self, "initWithShareService:homeManager:cloudTransform:modelSelectionBlock:", v21, v14, v15, v22);

  return v23;
}

- (id)grantAccessForUser:(id)a3 home:(id)a4
{
  id v6;
  id v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[5];
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v7, "isOwnerUser");
  v9 = (void *)MEMORY[0x24BE3F180];
  if ((v8 & 1) != 0)
  {
    -[HMDCoreDataCloudShareService managedObjectContext](self->_shareService, "managedObjectContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __57__HMDHomeOwnerCloudShareManager_grantAccessForUser_home___block_invoke;
    v14[3] = &unk_24E796FD8;
    v14[4] = self;
    v15 = v7;
    v16 = v6;
    objc_msgSend(v9, "inContext:perform:", v10, v14);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 17);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "futureWithError:", v12);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v11;
}

- (id)revokeAccessForUser:(id)a3 home:(id)a4
{
  id v6;
  id v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[5];
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v7, "isOwnerUser");
  v9 = (void *)MEMORY[0x24BE3F180];
  if ((v8 & 1) != 0)
  {
    -[HMDCoreDataCloudShareService managedObjectContext](self->_shareService, "managedObjectContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __58__HMDHomeOwnerCloudShareManager_revokeAccessForUser_home___block_invoke;
    v14[3] = &unk_24E796FD8;
    v14[4] = self;
    v15 = v7;
    v16 = v6;
    objc_msgSend(v9, "inContext:perform:", v10, v14);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 17);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "futureWithError:", v12);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v11;
}

- (id)auditAccessForUsers:(id)a3 home:(id)a4
{
  id v6;
  id v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  id v15;
  HMDHomeOwnerCloudShareManager *v16;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v7, "isOwnerUser");
  v9 = (void *)MEMORY[0x24BE3F180];
  if ((v8 & 1) != 0)
  {
    -[HMDCoreDataCloudShareService managedObjectContext](self->_shareService, "managedObjectContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __58__HMDHomeOwnerCloudShareManager_auditAccessForUsers_home___block_invoke;
    v13[3] = &unk_24E796FD8;
    v14 = v7;
    v15 = v6;
    v16 = self;
    objc_msgSend(v9, "inContext:perform:", v10, v13);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 17);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "futureWithError:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

- (id)acceptShareInvitation:(id)a3
{
  return -[HMDCoreDataCloudShareService acceptShareInvitation:](self->_shareService, "acceptShareInvitation:", a3);
}

- (id)removeSharesForHome:(id)a3
{
  id v4;
  char v5;
  void *v6;
  HMDHomeOwnerCloudShareManager *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  HMDCoreDataCloudShareService *v12;
  void *v13;
  void *v14;
  HMDCoreDataCloudShareService *v15;
  void *v16;
  void *v17;
  _QWORD v19[5];
  id v20;
  HMDCoreDataCloudShareService *v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_msgSend(v4, "isOwnerUser");
  v6 = (void *)MEMORY[0x227676638]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if ((v5 & 1) != 0)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "shortDescription");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v23 = v10;
      v24 = 2112;
      v25 = v11;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Removing shares for home: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
    v12 = v7->_shareService;
    v13 = (void *)MEMORY[0x24BE3F180];
    -[HMDCoreDataCloudShareService managedObjectContext](v12, "managedObjectContext");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __53__HMDHomeOwnerCloudShareManager_removeSharesForHome___block_invoke;
    v19[3] = &unk_24E796FD8;
    v19[4] = v7;
    v20 = v4;
    v21 = v12;
    v15 = v12;
    objc_msgSend(v13, "inContext:perform:", v14, v19);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v23 = v17;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_ERROR, "%{public}@Not removing the home as this is not owner user", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v6);
    objc_msgSend(MEMORY[0x24BE3F180], "futureWithNoValue");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v16;
}

- (id)_removeShare:(id)a3 usingShareService:(id)a4 forHomeWithUUID:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;
  id v24;

  v8 = a3;
  v9 = a5;
  v24 = 0;
  v10 = (void *)MEMORY[0x24BE3F180];
  v11 = a4;
  objc_msgSend(v10, "futureWithPromise:", &v24);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "container");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "recordID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "zoneID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "privateStore");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __80__HMDHomeOwnerCloudShareManager__removeShare_usingShareService_forHomeWithUUID___block_invoke;
  v20[3] = &unk_24E7970A0;
  v20[4] = self;
  v21 = v8;
  v22 = v9;
  v23 = v24;
  v17 = v9;
  v18 = v8;
  objc_msgSend(v13, "purgeObjectsAndRecordsInZoneWithID:inPersistentStore:completion:", v15, v16, v20);

  return v12;
}

- (id)_shareForHome:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v11;

  v4 = a3;
  objc_msgSend(v4, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  -[HMDHomeOwnerCloudShareManager _existingShareForHomeWithModelID:error:](self, "_existingShareForHomeWithModelID:error:", v5, &v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v11;

  if (v7)
  {
    objc_msgSend(MEMORY[0x24BE3F180], "futureWithError:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v6)
      objc_msgSend(MEMORY[0x24BE3F180], "futureWithValue:", v6);
    else
      -[HMDHomeOwnerCloudShareManager _createShareForHome:](self, "_createShareForHome:", v4);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)v8;

  return v9;
}

- (id)_existingShareForHomeWithModelID:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  HMDHomeOwnerCloudShareManager *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  HMDHomeOwnerCloudShareManager *v31;
  id v32;
  void *v33;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  void *v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[HMDHomeOwnerCloudShareManager _existingSharedHomesWithModelID:error:](self, "_existingSharedHomesWithModelID:error:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (*a4 || (objc_msgSend(v7, "hmf_isEmpty") & 1) != 0)
  {
    v9 = 0;
  }
  else
  {
    v30 = v6;
    v34 = (void *)objc_opt_new();
    objc_msgSend(v8, "na_map:", &__block_literal_global_20_229711);
    v11 = objc_claimAutoreleasedReturnValue();
    -[HMDCoreDataCloudShareService container](self->_shareService, "container");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (void *)v11;
    objc_msgSend(v12, "fetchSharesMatchingObjectIDs:error:", v11, a4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v29 = v8;
    v14 = v8;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v36;
      v31 = self;
      v32 = v14;
      v33 = v13;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v36 != v17)
            objc_enumerationMutation(v14);
          if (!*a4)
          {
            v19 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
            objc_msgSend(v19, "objectID");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "objectForKeyedSubscript:", v20);
            v21 = (void *)objc_claimAutoreleasedReturnValue();

            if (v21)
            {
              objc_msgSend(v34, "setObject:forKeyedSubscript:", v19, v21);
            }
            else
            {
              v22 = (void *)MEMORY[0x227676638]();
              v23 = self;
              HMFGetOSLogHandle();
              v24 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
              {
                HMFGetLogIdentifier();
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v19, "objectID");
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                v40 = v25;
                v41 = 2112;
                v42 = v26;
                _os_log_impl(&dword_2218F0000, v24, OS_LOG_TYPE_ERROR, "%{public}@No CKShare for objectID %@ in map", buf, 0x16u);

                self = v31;
              }

              objc_autoreleasePoolPop(v22);
              v14 = v32;
              v13 = v33;
            }

          }
        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
      }
      while (v16);
    }

    v27 = (void *)objc_msgSend(v34, "copy");
    -[HMDHomeOwnerCloudShareManager _canonicalShareFromSharesToSharedHomes:shareMap:](self, "_canonicalShareFromSharesToSharedHomes:shareMap:", v27, v13);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = v29;
    v6 = v30;
  }

  return v9;
}

- (id)_canonicalShareFromSharesToSharedHomes:(id)a3 shareMap:(id)a4
{
  id v6;
  id v7;
  id modelSelectionBlock;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "count"))
  {
    if (self)
      modelSelectionBlock = self->_modelSelectionBlock;
    else
      modelSelectionBlock = 0;
    v9 = modelSelectionBlock;
    objc_msgSend(v6, "allValues");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))modelSelectionBlock + 2))(v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "objectID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)_canonicalModelFromSharedHomes:(id)a3
{
  if (self)
    self = (HMDHomeOwnerCloudShareManager *)self->_modelSelectionBlock;
  return (id)((uint64_t (*)(HMDHomeOwnerCloudShareManager *, id))self->_cloudTransform)(self, a3);
}

- (id)_allExistingSharesForHomeWithModelID:(id)a3 error:(id *)a4
{
  void *v6;
  void *v7;
  BOOL v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  -[HMDHomeOwnerCloudShareManager _existingSharedHomesWithModelID:error:](self, "_existingSharedHomesWithModelID:error:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (*a4)
    v8 = 1;
  else
    v8 = v6 == 0;
  if (v8)
  {
    v9 = 0;
  }
  else if (objc_msgSend(v6, "hmf_isEmpty"))
  {
    objc_msgSend(MEMORY[0x24BDBCE30], "array");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v7, "na_map:", &__block_literal_global_21_229709);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCoreDataCloudShareService container](self->_shareService, "container");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "fetchSharesMatchingObjectIDs:error:", v10, a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "allValues");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

- (id)_existingSharedHomesWithModelID:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  HMDHomeOwnerCloudShareManager *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  id v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  +[MKFCKSharedHome fetchRequest](MKFCKSharedHome, "fetchRequest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("modelID"), v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPredicate:", v8);

  -[HMDCoreDataCloudShareService privateStore](self->_shareService, "privateStore");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v27, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAffectedStores:", v10);

  -[HMDCoreDataCloudShareService managedObjectContext](self->_shareService, "managedObjectContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "executeFetchRequest:error:", v7, a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (*a4)
  {
    v13 = 0;
  }
  else
  {
    if (objc_msgSend(v12, "hmf_isEmpty"))
    {
      objc_msgSend(MEMORY[0x24BDBCE30], "array");
      v14 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if ((unint64_t)objc_msgSend(v12, "count") >= 2)
      {
        v15 = (void *)MEMORY[0x227676638]();
        v16 = self;
        HMFGetOSLogHandle();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v12, "count"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v22 = v18;
          v23 = 2112;
          v24 = v19;
          v25 = 2112;
          v26 = v6;
          _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_ERROR, "%{public}@Found multiple (%@) shared homes with modelID %@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v15);
      }
      v14 = v12;
    }
    v13 = v14;
  }

  return v13;
}

- (id)_createShareForHome:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  HMDHomeOwnerCloudShareManager *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  HMDHomeOwnerCloudShareManager *v17;
  NSObject *v18;
  _BOOL4 v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
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
  id *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  _QWORD v44[5];
  id v45;
  id v46;
  id v47;
  void *v48;
  _BYTE buf[12];
  __int16 v50;
  id v51;
  __int16 v52;
  uint64_t v53;
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = 0;
  -[HMDHomeOwnerCloudShareManager _existingSharedHomeWithoutShareWithHomeModelID:error:](self, "_existingSharedHomeWithoutShareWithHomeModelID:error:", v5, &v47);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v47;

  if (v7)
  {
    v8 = (void *)MEMORY[0x227676638]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v11;
      v50 = 2114;
      v51 = v7;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Checking for existing shared home model failed with error: %{public}@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    v12 = (void *)MEMORY[0x24BE3F180];
    HMDSanitizeCoreDataError(v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "futureWithError:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = objc_msgSend(v6, "count");
    v16 = (void *)MEMORY[0x227676638]();
    v17 = self;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = os_log_type_enabled(v18, OS_LOG_TYPE_INFO);
    if (v15)
    {
      if (v19)
      {
        HMFGetLogIdentifier();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "uuid");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v6, "count");
        *(_DWORD *)buf = 138543874;
        *(_QWORD *)&buf[4] = v20;
        v50 = 2112;
        v51 = v21;
        v52 = 2048;
        v53 = v22;
        _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_INFO, "%{public}@Will attempt to re-share first MKFCKSharedHome for home %@ that doesn't have an associated share out of %lu found", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v16);
      -[HMDHomeOwnerCloudShareManager _canonicalModelFromSharedHomes:](v17, "_canonicalModelFromSharedHomes:", v6);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v19)
      {
        HMFGetLogIdentifier();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "uuid");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v23;
        v50 = 2112;
        v51 = v24;
        _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_INFO, "%{public}@Creating MKFCKSharedHome for home %@ since none was found", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v16);
      objc_msgSend(v4, "uuid");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDCoreDataCloudShareService privateStore](v17->_shareService, "privateStore");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDCoreDataCloudShareService managedObjectContext](v17->_shareService, "managedObjectContext");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      +[MKFCKSharedHome createWithModelID:persistentStore:context:](MKFCKSharedHome, "createWithModelID:persistentStore:context:", v25, v26, v27);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "name");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setName:", v28);

      objc_msgSend(v4, "owner");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "uuid");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setOwnerModelID:", v30);

      objc_msgSend(v4, "owner");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "accountHandle");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "value");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setOwnerAccountHandle:", v33);

      objc_msgSend(v4, "roomForEntireHome");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "uuid");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setDefaultRoomModelID:", v35);

    }
    v36 = (void *)MEMORY[0x227676638]();
    v37 = v17;
    HMFGetOSLogHandle();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "shortDescription");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v39;
      v50 = 2112;
      v51 = v40;
      _os_log_impl(&dword_2218F0000, v38, OS_LOG_TYPE_INFO, "%{public}@Creating share for home %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v36);
    *(_QWORD *)buf = 0;
    objc_msgSend(MEMORY[0x24BE3F180], "futureWithPromise:", buf);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37[1], "container");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = v13;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v48, 1);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v44[0] = MEMORY[0x24BDAC760];
    v44[1] = 3221225472;
    v44[2] = __53__HMDHomeOwnerCloudShareManager__createShareForHome___block_invoke;
    v44[3] = &unk_24E797128;
    v44[4] = v37;
    v45 = v4;
    v46 = *(id *)buf;
    objc_msgSend(v41, "shareManagedObjects:toShare:completion:", v42, 0, v44);

  }
  return v14;
}

- (id)_existingSharedHomeWithoutShareWithHomeModelID:(id)a3 error:(id *)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  id v14;

  -[HMDHomeOwnerCloudShareManager _existingSharedHomesWithModelID:error:](self, "_existingSharedHomesWithModelID:error:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (*a4 || !objc_msgSend(v6, "count"))
  {
    v8 = 0;
  }
  else
  {
    objc_msgSend(v7, "na_map:", &__block_literal_global_30_229691);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCoreDataCloudShareService container](self->_shareService, "container");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "fetchSharesMatchingObjectIDs:error:", v9, a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (*a4)
    {
      v8 = 0;
    }
    else
    {
      v13[0] = MEMORY[0x24BDAC760];
      v13[1] = 3221225472;
      v13[2] = __86__HMDHomeOwnerCloudShareManager__existingSharedHomeWithoutShareWithHomeModelID_error___block_invoke_2;
      v13[3] = &unk_24E797170;
      v14 = v11;
      objc_msgSend(v7, "na_filter:", v13);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }

  return v8;
}

- (void)updateSharedOwnerAccountHandleForHome:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  if (objc_msgSend(v4, "isOwnerUser"))
  {
    -[HMDCoreDataCloudShareService managedObjectContext](self->_shareService, "managedObjectContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __71__HMDHomeOwnerCloudShareManager_updateSharedOwnerAccountHandleForHome___block_invoke;
    v6[3] = &unk_24E79C268;
    v6[4] = self;
    v7 = v4;
    objc_msgSend(v5, "performBlock:", v6);

  }
}

- (void)didDeleteModelWithID:(id)a3 tombstone:(id)a4 context:(id)a5
{
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  int v12;
  id WeakRetained;
  id v14;

  v14 = a3;
  objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("modelID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  if (v9)
  {
    objc_msgSend(v14, "entity");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[MKFCKSharedUserDataRoot entity](MKFCKSharedUserDataRoot, "entity");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isKindOfEntity:", v11);

    if (v12)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_homeManager);
      objc_msgSend(WeakRetained, "auditAccessForUsersForHome:", v9);

    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_modelSelectionBlock, 0);
  objc_destroyWeak((id *)&self->_homeManager);
  objc_storeStrong((id *)&self->_cloudTransform, 0);
  objc_storeStrong((id *)&self->_shareService, 0);
}

void __71__HMDHomeOwnerCloudShareManager_updateSharedOwnerAccountHandleForHome___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  id v18;
  NSObject *v19;
  uint64_t v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  id v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  id v42;
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  uint64_t v46;
  __int16 v47;
  id v48;
  __int16 v49;
  uint64_t v50;
  __int16 v51;
  void *v52;
  _BYTE v53[128];
  uint64_t v54;

  v1 = a1;
  v54 = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = 0;
  objc_msgSend(v2, "_existingSharedHomesWithModelID:error:", v3, &v42);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v42;

  if (v4 && (objc_msgSend(v4, "hmf_isEmpty") & 1) == 0)
  {
    v33 = v5;
    objc_msgSend(*(id *)(v1 + 40), "owner");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "accountHandle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "value");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    v34 = v4;
    v9 = v4;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v38, v53, 16);
    v35 = v1;
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v39;
      do
      {
        v13 = 0;
        v36 = v11;
        do
        {
          if (*(_QWORD *)v39 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * v13);
          objc_msgSend(v14, "ownerAccountHandle");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "isEqualToString:", v8);

          if ((v16 & 1) == 0)
          {
            v17 = (void *)MEMORY[0x227676638]();
            v18 = *(id *)(v1 + 32);
            HMFGetOSLogHandle();
            v19 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v20 = v12;
              v21 = v9;
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "homeModelID");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138544386;
              v44 = v22;
              v45 = 2160;
              v46 = 1752392040;
              v47 = 2112;
              v48 = v23;
              v49 = 2160;
              v50 = 1752392040;
              v51 = 2112;
              v52 = v8;
              _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_INFO, "%{public}@Updating account handle on shared home model %{mask.hash}@ to %{mask.hash}@", buf, 0x34u);

              v1 = v35;
              v9 = v21;
              v12 = v20;
              v11 = v36;
            }

            objc_autoreleasePoolPop(v17);
            objc_msgSend(v14, "setOwnerAccountHandle:", v8);
          }
          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v38, v53, 16);
      }
      while (v11);
    }

    objc_msgSend(*(id *)(*(_QWORD *)(v1 + 32) + 8), "managedObjectContext");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "hasChanges");

    if (v25)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(v1 + 32) + 8), "managedObjectContext");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = v33;
      objc_msgSend(v26, "hmd_saveWithTransactionAuthor:error:", 9, &v37);
      v5 = v37;

      if (v5)
      {
        v27 = (void *)MEMORY[0x227676638]();
        v28 = *(id *)(v1 + 32);
        HMFGetOSLogHandle();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(v1 + 40), "shortDescription");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v44 = v30;
          v45 = 2112;
          v46 = (uint64_t)v31;
          v47 = 2114;
          v48 = v5;
          _os_log_impl(&dword_2218F0000, v29, OS_LOG_TYPE_ERROR, "%{public}@Failed to update owner account handle on shared home model for home %@ due to %{public}@", buf, 0x20u);

          v1 = v35;
        }

        objc_autoreleasePoolPop(v27);
      }
    }
    else
    {
      v5 = v33;
    }
    v4 = v34;
    objc_msgSend(*(id *)(*(_QWORD *)(v1 + 32) + 8), "managedObjectContext");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "reset");

  }
}

BOOL __86__HMDHomeOwnerCloudShareManager__existingSharedHomeWithoutShareWithHomeModelID_error___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  _BOOL8 v5;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "objectID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 == 0;

  return v5;
}

uint64_t __86__HMDHomeOwnerCloudShareManager__existingSharedHomeWithoutShareWithHomeModelID_error___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "objectID");
}

void __53__HMDHomeOwnerCloudShareManager__createShareForHome___block_invoke(id *a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void *)MEMORY[0x227676638]();
  v14 = a1[4];
  HMFGetOSLogHandle();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v12)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[5], "shortDescription");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138543874;
      v22 = v17;
      v23 = 2112;
      v24 = v18;
      v25 = 2112;
      v26 = v12;
      _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_ERROR, "%{public}@Failed to create share for home %@ due to %@. Leaving model alone to reuse next time we share it.", (uint8_t *)&v21, 0x20u);

    }
    objc_autoreleasePoolPop(v13);
    objc_msgSend(a1[6], "rejectWithError:", v12);
  }
  else
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[5], "shortDescription");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138543618;
      v22 = v19;
      v23 = 2112;
      v24 = v20;
      _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_INFO, "%{public}@Successfully created share for home %@", (uint8_t *)&v21, 0x16u);

    }
    objc_autoreleasePoolPop(v13);
    objc_msgSend(a1[6], "fulfillWithValue:", v10);
  }

}

uint64_t __76__HMDHomeOwnerCloudShareManager__allExistingSharesForHomeWithModelID_error___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "objectID");
}

uint64_t __72__HMDHomeOwnerCloudShareManager__existingShareForHomeWithModelID_error___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "objectID");
}

void __80__HMDHomeOwnerCloudShareManager__removeShare_usingShareService_forHomeWithUUID___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  void *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x227676638]();
  v8 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = *(_QWORD *)(a1 + 40);
      v13 = *(_QWORD *)(a1 + 48);
      v17 = 138544130;
      v18 = v11;
      v19 = 2112;
      v20 = v12;
      v21 = 2112;
      v22 = v13;
      v23 = 2112;
      v24 = v6;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Removing share %@ for home %@ failed with %@", (uint8_t *)&v17, 0x2Au);

    }
    objc_autoreleasePoolPop(v7);
    objc_msgSend(*(id *)(a1 + 56), "rejectWithError:", v6);
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = *(_QWORD *)(a1 + 40);
      v16 = *(_QWORD *)(a1 + 48);
      v17 = 138543874;
      v18 = v14;
      v19 = 2112;
      v20 = v15;
      v21 = 2112;
      v22 = v16;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Removed share %@ for home %@", (uint8_t *)&v17, 0x20u);

    }
    objc_autoreleasePoolPop(v7);
    objc_msgSend(*(id *)(a1 + 56), "fulfillWithNoValue");
  }

}

uint64_t __53__HMDHomeOwnerCloudShareManager_removeSharesForHome___block_invoke(id *a1)
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  uint64_t v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t i;
  uint64_t v22;
  uint64_t v23;
  id v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  void *v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  _QWORD v32[5];
  _QWORD v33[6];
  id v34;
  id v35;
  _BYTE *v36;
  _QWORD v37[6];
  id v38;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  id v44;
  uint8_t v45[128];
  _BYTE buf[24];
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v2 = a1[4];
  objc_msgSend(a1[5], "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = 0;
  objc_msgSend(v2, "_allExistingSharesForHomeWithModelID:error:", v3, &v44);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (uint64_t (*)(uint64_t, uint64_t))v44;

  if (v31)
  {
    v4 = (void *)MEMORY[0x227676638]();
    v5 = a1[4];
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[5], "shortDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)&buf[4] = v7;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v8;
      *(_WORD *)&buf[22] = 2112;
      v47 = v31;
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_ERROR, "%{public}@Fetching existing shares for home %@ failed with %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v4);
    v9 = v31;
    v10 = 2;
  }
  else if (v30 && (objc_msgSend(v30, "hmf_isEmpty") & 1) == 0)
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v47 = __Block_byref_object_copy__229719;
    v48 = __Block_byref_object_dispose__229720;
    v49 = 0;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v16 = v30;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
    v18 = MEMORY[0x24BDAC760];
    v19 = 0;
    if (v17)
    {
      v20 = *(_QWORD *)v41;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v41 != v20)
            objc_enumerationMutation(v16);
          v22 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * i);
          if (v19)
          {
            v37[0] = v18;
            v37[1] = 3221225472;
            v37[2] = __53__HMDHomeOwnerCloudShareManager_removeSharesForHome___block_invoke_14;
            v37[3] = &unk_24E797028;
            v37[4] = a1[4];
            v37[5] = v22;
            v38 = a1[6];
            v39 = a1[5];
            v33[0] = v18;
            v33[1] = 3221225472;
            v33[2] = __53__HMDHomeOwnerCloudShareManager_removeSharesForHome___block_invoke_2;
            v33[3] = &unk_24E797050;
            v36 = buf;
            v33[4] = a1[4];
            v33[5] = v22;
            v34 = a1[6];
            v35 = a1[5];
            objc_msgSend(v19, "then:orRecover:", v37, v33);
            v23 = objc_claimAutoreleasedReturnValue();

            v19 = (void *)v23;
          }
          else
          {
            v24 = a1[6];
            v25 = a1[4];
            objc_msgSend(a1[5], "uuid");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "_removeShare:usingShareService:forHomeWithUUID:", v22, v24, v26);
            v19 = (void *)objc_claimAutoreleasedReturnValue();

          }
        }
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
      }
      while (v17);
    }

    v32[0] = v18;
    v32[1] = 3221225472;
    v32[2] = __53__HMDHomeOwnerCloudShareManager_removeSharesForHome___block_invoke_3;
    v32[3] = &unk_24E797078;
    v32[4] = buf;
    objc_msgSend(v19, "then:", v32);
    v27 = (id)objc_claimAutoreleasedReturnValue();
    if (!v27)
    {
      _HMFPreconditionFailure();
      __break(1u);
    }
    v28 = v27;

    _Block_object_dispose(buf, 8);
    v10 = 3;
  }
  else
  {
    v11 = (void *)MEMORY[0x227676638]();
    v12 = a1[4];
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[5], "shortDescription");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v14;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v15;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@No share for home %@ to remove", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
    v10 = 1;
  }

  return v10;
}

uint64_t __53__HMDHomeOwnerCloudShareManager_removeSharesForHome___block_invoke_14(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v11;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 56), "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_removeShare:usingShareService:forHomeWithUUID:", v5, v6, v7);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = v8;

    return 3;
  }
  else
  {
    v11 = _HMFPreconditionFailure();
    return __53__HMDHomeOwnerCloudShareManager_removeSharesForHome___block_invoke_2(v11);
  }
}

uint64_t __53__HMDHomeOwnerCloudShareManager_removeSharesForHome___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v14;

  v3 = a2;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", -1);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

  }
  v7 = *(void **)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  v9 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 56), "uuid");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_removeShare:usingShareService:forHomeWithUUID:", v8, v9, v10);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = v11;

    return 3;
  }
  else
  {
    v14 = _HMFPreconditionFailure();
    return __53__HMDHomeOwnerCloudShareManager_removeSharesForHome___block_invoke_3(v14);
  }
}

uint64_t __53__HMDHomeOwnerCloudShareManager_removeSharesForHome___block_invoke_3(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  if (!v1)
    return 1;
  v2 = v1;
  return 2;
}

uint64_t __58__HMDHomeOwnerCloudShareManager_auditAccessForUsers_home___block_invoke(id *a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id v23;
  NSObject *v24;
  void *v25;
  void *v26;
  _QWORD v28[4];
  id v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  void *v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCEF0];
  objc_msgSend(a1[4], "users");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v5 = a1[5];
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v32 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        if ((objc_msgSend(v10, "isOwner") & 1) == 0)
        {
          objc_msgSend(v10, "accountHandle");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (v11)
            objc_msgSend(v4, "addObject:", v11);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
    }
    while (v7);
  }

  v12 = a1[6];
  objc_msgSend(a1[4], "uuid");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0;
  objc_msgSend(v12, "_existingShareForHomeWithModelID:error:", v13, &v30);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v30;

  if (v15 || !v14)
  {
    v22 = (void *)MEMORY[0x227676638]();
    v23 = a1[6];
    HMFGetOSLogHandle();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[4], "shortDescription");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v36 = v25;
      v37 = 2112;
      v38 = v26;
      _os_log_impl(&dword_2218F0000, v24, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch share, cannot audit shared users for home %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v22);
    v21 = 1;
  }
  else
  {
    v16 = (void *)*((_QWORD *)a1[6] + 1);
    objc_msgSend(v4, "allObjects");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "auditUsersForRevokedAccessWithAccountHandles:share:", v17, v14);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = MEMORY[0x24BDAC760];
    v28[1] = 3221225472;
    v28[2] = __58__HMDHomeOwnerCloudShareManager_auditAccessForUsers_home___block_invoke_12;
    v28[3] = &unk_24E797000;
    v29 = a1[5];
    objc_msgSend(v18, "then:", v28);
    v19 = (id)objc_claimAutoreleasedReturnValue();
    if (!v19)
      _HMFPreconditionFailure();
    v20 = v19;
    v21 = 3;

  }
  return v21;
}

uint64_t __58__HMDHomeOwnerCloudShareManager_auditAccessForUsers_home___block_invoke_12(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  int v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(MEMORY[0x24BDBCEF0], "setWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = *(id *)(a1 + 32);
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
        objc_msgSend(v10, "accountHandle", (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v3, "containsObject:", v11);

        if (v12)
          objc_msgSend(v4, "addObject:", v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  objc_msgSend(v4, "allObjects");
  objc_claimAutoreleasedReturnValue();

  return 1;
}

uint64_t __58__HMDHomeOwnerCloudShareManager_revokeAccessForUser_home___block_invoke(id *a1)
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  id v37;
  uint8_t v38[128];
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  id v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v2 = a1[4];
  objc_msgSend(a1[5], "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = 0;
  objc_msgSend(v2, "_allExistingSharesForHomeWithModelID:error:", v3, &v37);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v37;

  if (v5)
  {
    v6 = (void *)MEMORY[0x227676638]();
    v7 = a1[4];
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[5], "shortDescription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v40 = v9;
      v41 = 2112;
      v42 = v10;
      v43 = 2112;
      v44 = v5;
      _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_ERROR, "%{public}@Fetching existing share for home %@ failed with %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v6);
    v11 = v5;
    v12 = 2;
  }
  else if (v4 && (objc_msgSend(v4, "hmf_isEmpty") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v32 = v4;
    v19 = v4;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v34 != v22)
            objc_enumerationMutation(v19);
          v24 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i);
          v25 = (void *)*((_QWORD *)a1[4] + 1);
          objc_msgSend(a1[6], "accountHandle");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "revokeAccessForUserWithAccountHandle:share:", v26, v24);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "addObject:", v27);

        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
      }
      while (v21);
    }

    objc_msgSend(MEMORY[0x24BE3F180], "all:", v18);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "ignoreResult");
    v29 = (id)objc_claimAutoreleasedReturnValue();
    if (!v29)
      _HMFPreconditionFailure();
    v30 = v29;
    v12 = 3;

    v4 = v32;
  }
  else
  {
    v13 = (void *)MEMORY[0x227676638]();
    v14 = a1[4];
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[5], "shortDescription");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v40 = v16;
      v41 = 2112;
      v42 = v17;
      _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_INFO, "%{public}@Nothing to do, no existing share for home %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v13);
    v12 = 1;
  }

  return v12;
}

uint64_t __57__HMDHomeOwnerCloudShareManager_grantAccessForUser_home___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v6;
  void *v7;
  _QWORD v8[5];
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "_shareForHome:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __57__HMDHomeOwnerCloudShareManager_grantAccessForUser_home___block_invoke_2;
  v8[3] = &unk_24E796FB0;
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = *(id *)(a1 + 48);
  objc_msgSend(v2, "then:", v8);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;

    return 3;
  }
  else
  {
    v6 = _HMFPreconditionFailure();
    return __57__HMDHomeOwnerCloudShareManager_grantAccessForUser_home___block_invoke_2(v6, v7);
  }
}

uint64_t __57__HMDHomeOwnerCloudShareManager_grantAccessForUser_home___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v9;
  void *v10;

  v3 = a2;
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  objc_msgSend(*(id *)(a1 + 40), "accountHandle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "grantAccessForUserWithAccountHandle:share:", v5, v3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = v6;

    return 3;
  }
  else
  {
    v9 = _HMFPreconditionFailure();
    return (uint64_t)__107__HMDHomeOwnerCloudShareManager_initWithContainer_sharedStore_privateStore_moc_cloudTransform_homeManager___block_invoke(v9, v10);
  }
}

id __107__HMDHomeOwnerCloudShareManager_initWithContainer_sharedStore_privateStore_moc_cloudTransform_homeManager___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[MKFCKModel canonicalModelForModels:context:](MKFCKModel, "canonicalModelForModels:context:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_229741 != -1)
    dispatch_once(&logCategory__hmf_once_t0_229741, &__block_literal_global_229742);
  return (id)logCategory__hmf_once_v1_229743;
}

void __44__HMDHomeOwnerCloudShareManager_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v1_229743;
  logCategory__hmf_once_v1_229743 = v0;

}

@end
