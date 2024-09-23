@implementation HMDSharedUserAccessorySettingsDataController

- (HMDSharedUserAccessorySettingsDataController)initWithUserModelID:(id)a3 homeModelID:(id)a4 privateStore:(id)a5 managedObjectContext:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  HMDSharedUserAccessorySettingsDataController *v15;
  HMDSharedUserAccessorySettingsDataController *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)HMDSharedUserAccessorySettingsDataController;
  v15 = -[HMDSharedUserAccessorySettingsDataController init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_userModelID, a3);
    objc_storeStrong((id *)&v16->_homeModelID, a4);
    objc_storeStrong((id *)&v16->_privateStore, a5);
    objc_storeStrong((id *)&v16->_moc, a6);
  }

  return v16;
}

- (BOOL)assistantAccessControlActivityNotificationsEnabledForPersonalRequests
{
  HMDManagedObjectContext *moc;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  moc = self->_moc;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __117__HMDSharedUserAccessorySettingsDataController_assistantAccessControlActivityNotificationsEnabledForPersonalRequests__block_invoke;
  v5[3] = &unk_24E79B698;
  v5[4] = self;
  v5[5] = &v6;
  -[HMDManagedObjectContext performBlockAndWait:](moc, "performBlockAndWait:", v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (NSArray)assistantAccessControlAccessoriesToEncode
{
  HMDManagedObjectContext *moc;
  void *v3;
  id v4;
  void *v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__119188;
  v12 = __Block_byref_object_dispose__119189;
  v13 = 0;
  moc = self->_moc;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __89__HMDSharedUserAccessorySettingsDataController_assistantAccessControlAccessoriesToEncode__block_invoke;
  v7[3] = &unk_24E79B698;
  v7[4] = self;
  v7[5] = &v8;
  -[HMDManagedObjectContext performBlockAndWait:](moc, "performBlockAndWait:", v7);
  v3 = (void *)v9[5];
  if (v3)
  {
    v4 = v3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE30], "array");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;
  _Block_object_dispose(&v8, 8);

  return (NSArray *)v5;
}

- (NSArray)mediaContentProfileAccessControlAccessoriesToEncode
{
  HMDManagedObjectContext *moc;
  void *v3;
  id v4;
  void *v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__119188;
  v12 = __Block_byref_object_dispose__119189;
  v13 = 0;
  moc = self->_moc;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __99__HMDSharedUserAccessorySettingsDataController_mediaContentProfileAccessControlAccessoriesToEncode__block_invoke;
  v7[3] = &unk_24E79B698;
  v7[4] = self;
  v7[5] = &v8;
  -[HMDManagedObjectContext performBlockAndWait:](moc, "performBlockAndWait:", v7);
  v3 = (void *)v9[5];
  if (v3)
  {
    v4 = v3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE30], "array");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;
  _Block_object_dispose(&v8, 8);

  return (NSArray *)v5;
}

- (NSArray)userListeningHistoryUpdateControlModelAccessoriesToEncode
{
  HMDManagedObjectContext *moc;
  void *v3;
  id v4;
  void *v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__119188;
  v12 = __Block_byref_object_dispose__119189;
  v13 = 0;
  moc = self->_moc;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __105__HMDSharedUserAccessorySettingsDataController_userListeningHistoryUpdateControlModelAccessoriesToEncode__block_invoke;
  v7[3] = &unk_24E79B698;
  v7[4] = self;
  v7[5] = &v8;
  -[HMDManagedObjectContext performBlockAndWait:](moc, "performBlockAndWait:", v7);
  v3 = (void *)v9[5];
  if (v3)
  {
    v4 = v3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE30], "array");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;
  _Block_object_dispose(&v8, 8);

  return (NSArray *)v5;
}

- (void)handleAssistantAccessControlAccessoryUUIDsUpdated:(id)a3 activityNotificationsEnabledForPersonalRequests:(BOOL)a4 completion:(id)a5
{
  id v8;
  id v9;
  HMDManagedObjectContext *moc;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  BOOL v16;

  v8 = a3;
  v9 = a5;
  moc = self->_moc;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __157__HMDSharedUserAccessorySettingsDataController_handleAssistantAccessControlAccessoryUUIDsUpdated_activityNotificationsEnabledForPersonalRequests_completion___block_invoke;
  v13[3] = &unk_24E7962D8;
  v14 = v8;
  v15 = v9;
  v16 = a4;
  v13[4] = self;
  v11 = v8;
  v12 = v9;
  -[HMDManagedObjectContext performBlock:](moc, "performBlock:", v13);

}

- (void)handleMediaContentProfileAccessControlUpdatedAccessoryUUIDs:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  HMDManagedObjectContext *moc;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  moc = self->_moc;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __119__HMDSharedUserAccessorySettingsDataController_handleMediaContentProfileAccessControlUpdatedAccessoryUUIDs_completion___block_invoke;
  v11[3] = &unk_24E79B440;
  v12 = v6;
  v13 = v7;
  v11[4] = self;
  v9 = v6;
  v10 = v7;
  -[HMDManagedObjectContext performBlock:](moc, "performBlock:", v11);

}

- (void)handleUserListeningHistoryUpdateControlUpdatedAccessoryUUIDs:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  HMDManagedObjectContext *moc;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  moc = self->_moc;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __120__HMDSharedUserAccessorySettingsDataController_handleUserListeningHistoryUpdateControlUpdatedAccessoryUUIDs_completion___block_invoke;
  v11[3] = &unk_24E79B440;
  v12 = v6;
  v13 = v7;
  v11[4] = self;
  v9 = v6;
  v10 = v7;
  -[HMDManagedObjectContext performBlock:](moc, "performBlock:", v11);

}

- (void)enableUserListeningHistoryForAccessory:(id)a3
{
  id v4;
  HMDManagedObjectContext *moc;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  moc = self->_moc;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __87__HMDSharedUserAccessorySettingsDataController_enableUserListeningHistoryForAccessory___block_invoke;
  v7[3] = &unk_24E79C268;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[HMDManagedObjectContext performBlock:](moc, "performBlock:", v7);

}

- (void)handleRemovedAccessoryWithModelID:(id)a3
{
  id v4;
  HMDManagedObjectContext *moc;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  moc = self->_moc;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __82__HMDSharedUserAccessorySettingsDataController_handleRemovedAccessoryWithModelID___block_invoke;
  v7[3] = &unk_24E79C268;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[HMDManagedObjectContext performBlock:](moc, "performBlock:", v7);

}

- (id)_fetchDataRootWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  HMDSharedUserAccessorySettingsDataController *v12;
  NSObject *v13;
  void *v14;
  NSUUID *homeModelID;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  NSUUID *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x24BDAC8D0];
  +[MKFCKSharedUserDataRoot fetchRequest](MKFCKSharedUserDataRoot, "fetchRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("homeModelID"), self->_homeModelID);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPredicate:", v6);

  v21[0] = self->_privateStore;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAffectedStores:", v7);

  -[HMDManagedObjectContext executeFetchRequest:error:](self->_moc, "executeFetchRequest:error:", v5, a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8)
    goto LABEL_5;
  if (objc_msgSend(v8, "hmf_isEmpty"))
  {
    if (a3)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
      v10 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    }
LABEL_5:
    v10 = 0;
    goto LABEL_11;
  }
  if ((unint64_t)objc_msgSend(v9, "count") >= 2)
  {
    v11 = (void *)MEMORY[0x227676638]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      homeModelID = self->_homeModelID;
      *(_DWORD *)buf = 138543618;
      v18 = v14;
      v19 = 2112;
      v20 = homeModelID;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_ERROR, "%{public}@More than one shared data root with home modelID %@ is found, using the first one", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
  }
  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:

  return v10;
}

- (void)_addMissingAccessorySettingsFromAccessoryModelIDs:(id)a3 dataRoot:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _QWORD v25[4];
  id v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "accessorySettings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = v8;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "set");
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;

  objc_msgSend(v11, "na_map:", &__block_literal_global_63_119214);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __107__HMDSharedUserAccessorySettingsDataController__addMissingAccessorySettingsFromAccessoryModelIDs_dataRoot___block_invoke_2;
  v25[3] = &unk_24E79BCA0;
  v13 = v12;
  v26 = v13;
  v20 = v6;
  objc_msgSend(v6, "na_filter:", v25);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v22 != v17)
          objc_enumerationMutation(v14);
        +[MKFCKSharedUserAccessorySettings createWithHomeModelID:accessoryModelID:persistentStore:context:](MKFCKSharedUserAccessorySettings, "createWithHomeModelID:accessoryModelID:persistentStore:context:", self->_homeModelID, *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i), self->_privateStore, self->_moc);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setRoot:", v7);
        objc_msgSend(v7, "addAccessorySettingsObject:", v19);

      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
    }
    while (v16);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_moc, 0);
  objc_storeStrong((id *)&self->_privateStore, 0);
  objc_storeStrong((id *)&self->_homeModelID, 0);
  objc_storeStrong((id *)&self->_userModelID, 0);
}

uint64_t __107__HMDSharedUserAccessorySettingsDataController__addMissingAccessorySettingsFromAccessoryModelIDs_dataRoot___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2) ^ 1;
}

uint64_t __107__HMDSharedUserAccessorySettingsDataController__addMissingAccessorySettingsFromAccessoryModelIDs_dataRoot___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "accessoryModelID");
}

void __82__HMDSharedUserAccessorySettingsDataController_handleRemovedAccessoryWithModelID___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  id v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  id v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(a1 + 32);
  v30 = 0;
  objc_msgSend(v2, "_fetchDataRootWithError:", &v30);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v30;
  if (v3)
  {
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    objc_msgSend(v3, "accessorySettings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v37, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v27 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
          objc_msgSend(v10, "accessoryModelID");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "isEqual:", *(_QWORD *)(a1 + 40));

          if (v12)
            objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "deleteObject:", v10);
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v37, 16);
      }
      while (v7);
    }

    v13 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
    v25 = v4;
    objc_msgSend(v13, "save:", &v25);
    v14 = v25;

    if (v14)
    {
      v15 = (void *)MEMORY[0x227676638]();
      v16 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138543874;
        v32 = v18;
        v33 = 2112;
        v34 = v19;
        v35 = 2112;
        v36 = v14;
        _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_ERROR, "%{public}@Deleting shared user accessory setting with modelID %@ failed with %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v15);
      HMDSanitizeCoreDataError(v14);
      v4 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v4 = 0;
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "reset");
  }
  else
  {
    v20 = (void *)MEMORY[0x227676638]();
    v21 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
      *(_DWORD *)buf = 138543618;
      v32 = v23;
      v33 = 2112;
      v34 = v24;
      _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_ERROR, "%{public}@No shared data root for home %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v20);
    if (!v4)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
      v4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

}

void __87__HMDSharedUserAccessorySettingsDataController_enableUserListeningHistoryForAccessory___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  NSObject *v27;
  void *v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  id v34;
  _BYTE v35[128];
  uint64_t v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(a1 + 32);
  v34 = 0;
  objc_msgSend(v2, "_fetchDataRootWithError:", &v34);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v34;
  v5 = v4;
  if (!v3)
  {
    v6 = (void *)MEMORY[0x227676638]();
    v10 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
      *(_DWORD *)buf = 138543618;
      v38 = v12;
      v39 = 2112;
      v40 = v13;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_ERROR, "%{public}@Enabling ULH failed with no shared data root for home %@", buf, 0x16u);

    }
    goto LABEL_9;
  }
  if (v4)
  {
    v6 = (void *)MEMORY[0x227676638]();
    v7 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v38 = v9;
      v39 = 2112;
      v40 = v5;
      _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_ERROR, "%{public}@Enabling ULH for shared user failed with %@", buf, 0x16u);

    }
LABEL_9:
    objc_autoreleasePoolPop(v6);
    goto LABEL_24;
  }
  v14 = *(void **)(a1 + 32);
  v36 = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v36, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "_addMissingAccessorySettingsFromAccessoryModelIDs:dataRoot:", v15, v3);

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  objc_msgSend(v3, "accessorySettings");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v31 != v19)
          objc_enumerationMutation(v16);
        v21 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        v22 = *(void **)(a1 + 40);
        objc_msgSend(v21, "accessoryModelID");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v22) = objc_msgSend(v22, "hmf_isEqualToUUID:", v23);

        if ((_DWORD)v22)
          objc_msgSend(v21, "setListeningHistoryEnabled:", 1);
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    }
    while (v18);
  }

  v24 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  v29 = 0;
  objc_msgSend(v24, "save:", &v29);
  v5 = v29;
  if (v5)
  {
    v25 = (void *)MEMORY[0x227676638]();
    v26 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v38 = v28;
      v39 = 2112;
      v40 = v5;
      _os_log_impl(&dword_2218F0000, v27, OS_LOG_TYPE_ERROR, "%{public}@Enabling ULH for shared user failed with %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v25);
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "reset");
LABEL_24:

}

void __120__HMDSharedUserAccessorySettingsDataController_handleUserListeningHistoryUpdateControlUpdatedAccessoryUUIDs_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
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
  void *v24;
  void (**v25)(void *, id);
  void *v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  id v32;
  uint8_t v33[128];
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(a1 + 32);
  v32 = 0;
  objc_msgSend(v2, "_fetchDataRootWithError:", &v32);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v32;
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "_addMissingAccessorySettingsFromAccessoryModelIDs:dataRoot:", *(_QWORD *)(a1 + 40), v3);
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    objc_msgSend(v3, "accessorySettings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v29 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          v11 = *(void **)(a1 + 40);
          objc_msgSend(v10, "accessoryModelID");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v11, "containsObject:", v12);

          objc_msgSend(v10, "setListeningHistoryEnabled:", v13);
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      }
      while (v7);
    }

    v14 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
    v27 = v4;
    objc_msgSend(v14, "save:", &v27);
    v15 = v27;

    if (v15)
    {
      v16 = (void *)MEMORY[0x227676638]();
      v17 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v35 = v19;
        v36 = 2112;
        v37 = v15;
        _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_ERROR, "%{public}@Saving updated user listening history access control failed with %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v16);
      HMDSanitizeCoreDataError(v15);
      v4 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v4 = 0;
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "reset");
    v25 = (void (**)(void *, id))_Block_copy(*(const void **)(a1 + 48));
    if (v25)
      goto LABEL_20;
  }
  else
  {
    v20 = (void *)MEMORY[0x227676638]();
    v21 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
      *(_DWORD *)buf = 138543618;
      v35 = v23;
      v36 = 2112;
      v37 = v24;
      _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_ERROR, "%{public}@No shared data root for home %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v20);
    v25 = (void (**)(void *, id))_Block_copy(*(const void **)(a1 + 48));
    if (v25)
    {
      if (v4)
      {
LABEL_20:
        v25[2](v25, v4);
        goto LABEL_21;
      }
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v25[2](v25, v26);

      v4 = 0;
    }
  }
LABEL_21:

}

void __119__HMDSharedUserAccessorySettingsDataController_handleMediaContentProfileAccessControlUpdatedAccessoryUUIDs_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
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
  void *v24;
  void (**v25)(void *, id);
  void *v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  id v32;
  uint8_t v33[128];
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(a1 + 32);
  v32 = 0;
  objc_msgSend(v2, "_fetchDataRootWithError:", &v32);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v32;
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "_addMissingAccessorySettingsFromAccessoryModelIDs:dataRoot:", *(_QWORD *)(a1 + 40), v3);
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    objc_msgSend(v3, "accessorySettings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v29 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          v11 = *(void **)(a1 + 40);
          objc_msgSend(v10, "accessoryModelID");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v11, "containsObject:", v12);

          objc_msgSend(v10, "setMediaContentProfileEnabled:", v13);
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      }
      while (v7);
    }

    v14 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
    v27 = v4;
    objc_msgSend(v14, "save:", &v27);
    v15 = v27;

    if (v15)
    {
      v16 = (void *)MEMORY[0x227676638]();
      v17 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v35 = v19;
        v36 = 2112;
        v37 = v15;
        _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_ERROR, "%{public}@Saving updated media content profile access control failed with %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v16);
      HMDSanitizeCoreDataError(v15);
      v4 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v4 = 0;
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "reset");
    v25 = (void (**)(void *, id))_Block_copy(*(const void **)(a1 + 48));
    if (v25)
      goto LABEL_20;
  }
  else
  {
    v20 = (void *)MEMORY[0x227676638]();
    v21 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
      *(_DWORD *)buf = 138543618;
      v35 = v23;
      v36 = 2112;
      v37 = v24;
      _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_ERROR, "%{public}@No shared data root for home %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v20);
    v25 = (void (**)(void *, id))_Block_copy(*(const void **)(a1 + 48));
    if (v25)
    {
      if (v4)
      {
LABEL_20:
        v25[2](v25, v4);
        goto LABEL_21;
      }
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v25[2](v25, v26);

      v4 = 0;
    }
  }
LABEL_21:

}

void __157__HMDSharedUserAccessorySettingsDataController_handleAssistantAccessControlAccessoryUUIDsUpdated_activityNotificationsEnabledForPersonalRequests_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
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
  void *v24;
  void (**v25)(void *, id);
  void *v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  id v32;
  uint8_t v33[128];
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(a1 + 32);
  v32 = 0;
  objc_msgSend(v2, "_fetchDataRootWithError:", &v32);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v32;
  if (v3)
  {
    objc_msgSend(v3, "setActivityNotificationsEnabledForPersonalRequests:", *(unsigned __int8 *)(a1 + 56));
    objc_msgSend(*(id *)(a1 + 32), "_addMissingAccessorySettingsFromAccessoryModelIDs:dataRoot:", *(_QWORD *)(a1 + 40), v3);
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    objc_msgSend(v3, "accessorySettings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v29 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          v11 = *(void **)(a1 + 40);
          objc_msgSend(v10, "accessoryModelID");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v11, "containsObject:", v12);

          objc_msgSend(v10, "setPersonalRequestsEnabled:", v13);
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      }
      while (v7);
    }

    v14 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
    v27 = v4;
    objc_msgSend(v14, "save:", &v27);
    v15 = v27;

    if (v15)
    {
      v16 = (void *)MEMORY[0x227676638]();
      v17 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v35 = v19;
        v36 = 2112;
        v37 = v15;
        _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_ERROR, "%{public}@Saving personal requests access control failed with %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v16);
      HMDSanitizeCoreDataError(v15);
      v4 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v4 = 0;
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "reset");
    v25 = (void (**)(void *, id))_Block_copy(*(const void **)(a1 + 48));
    if (v25)
      goto LABEL_20;
  }
  else
  {
    v20 = (void *)MEMORY[0x227676638]();
    v21 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
      *(_DWORD *)buf = 138543618;
      v35 = v23;
      v36 = 2112;
      v37 = v24;
      _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_ERROR, "%{public}@No shared data root for home %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v20);
    v25 = (void (**)(void *, id))_Block_copy(*(const void **)(a1 + 48));
    if (v25)
    {
      if (v4)
      {
LABEL_20:
        v25[2](v25, v4);
        goto LABEL_21;
      }
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v25[2](v25, v26);

      v4 = 0;
    }
  }
LABEL_21:

}

void __105__HMDSharedUserAccessorySettingsDataController_userListeningHistoryUpdateControlModelAccessoriesToEncode__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(a1 + 32);
  v15 = 0;
  objc_msgSend(v2, "_fetchDataRootWithError:", &v15);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v15;
  if (v3)
  {
    objc_msgSend(v3, "accessorySettings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "na_map:", &__block_literal_global_57_119237);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "allObjects");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

  }
  else
  {
    v10 = (void *)MEMORY[0x227676638]();
    v11 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
      *(_DWORD *)buf = 138543618;
      v17 = v13;
      v18 = 2112;
      v19 = v14;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_ERROR, "%{public}@No shared data root for home %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
    if (!v4)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
      v4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

}

id __105__HMDSharedUserAccessorySettingsDataController_userListeningHistoryUpdateControlModelAccessoriesToEncode__block_invoke_56(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  if (objc_msgSend(v2, "listeningHistoryEnabled"))
  {
    objc_msgSend(v2, "accessoryModelID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

void __99__HMDSharedUserAccessorySettingsDataController_mediaContentProfileAccessControlAccessoriesToEncode__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(a1 + 32);
  v15 = 0;
  objc_msgSend(v2, "_fetchDataRootWithError:", &v15);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v15;
  if (v3)
  {
    objc_msgSend(v3, "accessorySettings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "na_map:", &__block_literal_global_55_119239);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "allObjects");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

  }
  else
  {
    v10 = (void *)MEMORY[0x227676638]();
    v11 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
      *(_DWORD *)buf = 138543618;
      v17 = v13;
      v18 = 2112;
      v19 = v14;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_ERROR, "%{public}@No shared data root for home %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
    if (!v4)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
      v4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

}

id __99__HMDSharedUserAccessorySettingsDataController_mediaContentProfileAccessControlAccessoriesToEncode__block_invoke_54(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  if (objc_msgSend(v2, "mediaContentProfileEnabled"))
  {
    objc_msgSend(v2, "accessoryModelID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

void __89__HMDSharedUserAccessorySettingsDataController_assistantAccessControlAccessoriesToEncode__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(a1 + 32);
  v15 = 0;
  objc_msgSend(v2, "_fetchDataRootWithError:", &v15);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v15;
  if (v3)
  {
    objc_msgSend(v3, "accessorySettings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "na_map:", &__block_literal_global_53);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "allObjects");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

  }
  else
  {
    v10 = (void *)MEMORY[0x227676638]();
    v11 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
      *(_DWORD *)buf = 138543618;
      v17 = v13;
      v18 = 2112;
      v19 = v14;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_ERROR, "%{public}@No shared data root for home %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
    if (!v4)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
      v4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

}

id __89__HMDSharedUserAccessorySettingsDataController_assistantAccessControlAccessoriesToEncode__block_invoke_51(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  if (objc_msgSend(v2, "personalRequestsEnabled"))
  {
    objc_msgSend(v2, "accessoryModelID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

void __117__HMDSharedUserAccessorySettingsDataController_assistantAccessControlActivityNotificationsEnabledForPersonalRequests__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  id v10;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(a1 + 32);
  v10 = 0;
  objc_msgSend(v2, "_fetchDataRootWithError:", &v10);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v10;
  if (v3)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v3, "activityNotificationsEnabledForPersonalRequests");
  }
  else
  {
    v5 = (void *)MEMORY[0x227676638]();
    v6 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
      *(_DWORD *)buf = 138543618;
      v12 = v8;
      v13 = 2112;
      v14 = v9;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_ERROR, "%{public}@No shared data root for home %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v5);
  }

}

@end
