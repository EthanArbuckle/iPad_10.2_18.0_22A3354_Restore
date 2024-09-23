@implementation HMDUserAccessorySettingsDataController

- (HMDUserAccessorySettingsDataController)initWithUserModelID:(id)a3 managedObjectContext:(id)a4
{
  id v7;
  id v8;
  HMDUserAccessorySettingsDataController *v9;
  HMDUserAccessorySettingsDataController *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMDUserAccessorySettingsDataController;
  v9 = -[HMDUserAccessorySettingsDataController init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_userModelID, a3);
    objc_storeStrong((id *)&v10->_context, a4);
  }

  return v10;
}

- (BOOL)assistantAccessControlActivityNotificationsEnabledForPersonalRequests
{
  HMDUserAccessorySettingsDataController *v2;
  NSUUID *v3;
  void *v4;
  HMCContext *context;
  NSUUID *v6;
  id v7;
  _QWORD v9[4];
  NSUUID *v10;
  id v11;
  HMDUserAccessorySettingsDataController *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v2 = self;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v3 = self->_userModelID;
  -[HMCContext managedObjectContext](v2->_context, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  context = v2->_context;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __111__HMDUserAccessorySettingsDataController_assistantAccessControlActivityNotificationsEnabledForPersonalRequests__block_invoke;
  v9[3] = &unk_24E79B5F8;
  v6 = v3;
  v10 = v6;
  v7 = v4;
  v11 = v7;
  v12 = v2;
  v13 = &v14;
  -[HMCContext unsafeSynchronousBlock:](context, "unsafeSynchronousBlock:", v9);
  LOBYTE(v2) = *((_BYTE *)v15 + 24);

  _Block_object_dispose(&v14, 8);
  return (char)v2;
}

- (NSArray)assistantAccessControlAccessoriesToEncode
{
  NSUUID *v3;
  void *v4;
  HMCContext *context;
  NSUUID *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  NSUUID *v16;
  id v17;
  HMDUserAccessorySettingsDataController *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__119188;
  v24 = __Block_byref_object_dispose__119189;
  v25 = 0;
  v3 = self->_userModelID;
  -[HMCContext managedObjectContext](self->_context, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  context = self->_context;
  v12 = MEMORY[0x24BDAC760];
  v13 = 3221225472;
  v14 = __83__HMDUserAccessorySettingsDataController_assistantAccessControlAccessoriesToEncode__block_invoke;
  v15 = &unk_24E79B5F8;
  v6 = v3;
  v16 = v6;
  v7 = v4;
  v17 = v7;
  v18 = self;
  v19 = &v20;
  -[HMCContext unsafeSynchronousBlock:](context, "unsafeSynchronousBlock:", &v12);
  v8 = (void *)v21[5];
  if (v8)
  {
    v9 = v8;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE30], "array", v12, v13, v14, v15, v16);
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;

  _Block_object_dispose(&v20, 8);
  return (NSArray *)v10;
}

- (NSArray)mediaContentProfileAccessControlAccessoriesToEncode
{
  NSUUID *v3;
  void *v4;
  HMCContext *context;
  NSUUID *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  NSUUID *v16;
  id v17;
  HMDUserAccessorySettingsDataController *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__119188;
  v24 = __Block_byref_object_dispose__119189;
  v25 = 0;
  v3 = self->_userModelID;
  -[HMCContext managedObjectContext](self->_context, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  context = self->_context;
  v12 = MEMORY[0x24BDAC760];
  v13 = 3221225472;
  v14 = __93__HMDUserAccessorySettingsDataController_mediaContentProfileAccessControlAccessoriesToEncode__block_invoke;
  v15 = &unk_24E79B5F8;
  v6 = v3;
  v16 = v6;
  v7 = v4;
  v17 = v7;
  v18 = self;
  v19 = &v20;
  -[HMCContext unsafeSynchronousBlock:](context, "unsafeSynchronousBlock:", &v12);
  v8 = (void *)v21[5];
  if (v8)
  {
    v9 = v8;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE30], "array", v12, v13, v14, v15, v16);
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;

  _Block_object_dispose(&v20, 8);
  return (NSArray *)v10;
}

- (NSArray)userListeningHistoryUpdateControlModelAccessoriesToEncode
{
  NSUUID *v3;
  void *v4;
  HMCContext *context;
  NSUUID *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  NSUUID *v16;
  id v17;
  HMDUserAccessorySettingsDataController *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__119188;
  v24 = __Block_byref_object_dispose__119189;
  v25 = 0;
  v3 = self->_userModelID;
  -[HMCContext managedObjectContext](self->_context, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  context = self->_context;
  v12 = MEMORY[0x24BDAC760];
  v13 = 3221225472;
  v14 = __99__HMDUserAccessorySettingsDataController_userListeningHistoryUpdateControlModelAccessoriesToEncode__block_invoke;
  v15 = &unk_24E79B5F8;
  v6 = v3;
  v16 = v6;
  v7 = v4;
  v17 = v7;
  v18 = self;
  v19 = &v20;
  -[HMCContext unsafeSynchronousBlock:](context, "unsafeSynchronousBlock:", &v12);
  v8 = (void *)v21[5];
  if (v8)
  {
    v9 = v8;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE30], "array", v12, v13, v14, v15, v16);
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;

  _Block_object_dispose(&v20, 8);
  return (NSArray *)v10;
}

- (void)handleAssistantAccessControlAccessoryUUIDsUpdated:(id)a3 activityNotificationsEnabledForPersonalRequests:(BOOL)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSUUID *v10;
  void *v11;
  HMCContext *context;
  id v13;
  id v14;
  id v15;
  NSUUID *v16;
  _QWORD v17[4];
  NSUUID *v18;
  id v19;
  HMDUserAccessorySettingsDataController *v20;
  id v21;
  id v22;
  BOOL v23;

  v8 = a3;
  v9 = a5;
  v10 = self->_userModelID;
  -[HMCContext managedObjectContext](self->_context, "managedObjectContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  context = self->_context;
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __151__HMDUserAccessorySettingsDataController_handleAssistantAccessControlAccessoryUUIDsUpdated_activityNotificationsEnabledForPersonalRequests_completion___block_invoke;
  v17[3] = &unk_24E785968;
  v18 = v10;
  v19 = v11;
  v21 = v8;
  v22 = v9;
  v23 = a4;
  v20 = self;
  v13 = v8;
  v14 = v9;
  v15 = v11;
  v16 = v10;
  -[HMCContext performBlock:](context, "performBlock:", v17);

}

- (void)handleMediaContentProfileAccessControlUpdatedAccessoryUUIDs:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSUUID *v8;
  void *v9;
  HMCContext *context;
  id v11;
  id v12;
  id v13;
  NSUUID *v14;
  _QWORD v15[4];
  NSUUID *v16;
  id v17;
  HMDUserAccessorySettingsDataController *v18;
  id v19;
  id v20;

  v6 = a3;
  v7 = a4;
  v8 = self->_userModelID;
  -[HMCContext managedObjectContext](self->_context, "managedObjectContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  context = self->_context;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __113__HMDUserAccessorySettingsDataController_handleMediaContentProfileAccessControlUpdatedAccessoryUUIDs_completion___block_invoke;
  v15[3] = &unk_24E799A68;
  v16 = v8;
  v17 = v9;
  v19 = v6;
  v20 = v7;
  v18 = self;
  v11 = v6;
  v12 = v7;
  v13 = v9;
  v14 = v8;
  -[HMCContext performBlock:](context, "performBlock:", v15);

}

- (void)handleUserListeningHistoryUpdateControlUpdatedAccessoryUUIDs:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSUUID *v8;
  void *v9;
  HMCContext *context;
  id v11;
  id v12;
  id v13;
  NSUUID *v14;
  _QWORD v15[4];
  NSUUID *v16;
  id v17;
  HMDUserAccessorySettingsDataController *v18;
  id v19;
  id v20;

  v6 = a3;
  v7 = a4;
  v8 = self->_userModelID;
  -[HMCContext managedObjectContext](self->_context, "managedObjectContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  context = self->_context;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __114__HMDUserAccessorySettingsDataController_handleUserListeningHistoryUpdateControlUpdatedAccessoryUUIDs_completion___block_invoke;
  v15[3] = &unk_24E799A68;
  v16 = v8;
  v17 = v9;
  v19 = v6;
  v20 = v7;
  v18 = self;
  v11 = v6;
  v12 = v7;
  v13 = v9;
  v14 = v8;
  -[HMCContext performBlock:](context, "performBlock:", v15);

}

- (void)enableUserListeningHistoryForAccessory:(id)a3
{
  id v4;
  NSUUID *v5;
  void *v6;
  HMCContext *context;
  id v8;
  id v9;
  NSUUID *v10;
  _QWORD v11[4];
  NSUUID *v12;
  id v13;
  HMDUserAccessorySettingsDataController *v14;
  id v15;

  v4 = a3;
  v5 = self->_userModelID;
  -[HMCContext managedObjectContext](self->_context, "managedObjectContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  context = self->_context;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __81__HMDUserAccessorySettingsDataController_enableUserListeningHistoryForAccessory___block_invoke;
  v11[3] = &unk_24E79A910;
  v12 = v5;
  v13 = v6;
  v14 = self;
  v15 = v4;
  v8 = v4;
  v9 = v6;
  v10 = v5;
  -[HMCContext performBlock:](context, "performBlock:", v11);

}

- (id)_updatedAccessorySetFromAccessoryUUIDs:(id)a3 currentAccessories:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  HMDUserAccessorySettingsDataController *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id *v35;
  id v36;
  id v37;
  id v38;
  id obj;
  void *v41;
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _QWORD v47[4];
  id v48;
  _QWORD v49[4];
  id v50;
  uint8_t buf[4];
  void *v52;
  __int16 v53;
  uint64_t v54;
  __int16 v55;
  id v56;
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  objc_msgSend(v8, "na_map:", &__block_literal_global_12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x24BDAC760];
  v49[0] = MEMORY[0x24BDAC760];
  v49[1] = 3221225472;
  v49[2] = __106__HMDUserAccessorySettingsDataController__updatedAccessorySetFromAccessoryUUIDs_currentAccessories_error___block_invoke_2;
  v49[3] = &unk_24E79BCA0;
  v37 = v9;
  v50 = v37;
  objc_msgSend(v7, "na_filter:", v49);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v47[0] = v10;
  v47[1] = 3221225472;
  v47[2] = __106__HMDUserAccessorySettingsDataController__updatedAccessorySetFromAccessoryUUIDs_currentAccessories_error___block_invoke_3;
  v47[3] = &unk_24E7859B0;
  v36 = v7;
  v48 = v36;
  v38 = v8;
  objc_msgSend(v8, "na_filter:", v47);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "mutableCopy");

  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v14 = v11;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v43, v57, 16);
  if (v15)
  {
    v16 = v15;
    v35 = a5;
    v17 = 0;
    v18 = *(_QWORD *)v44;
    obj = v14;
    while (2)
    {
      v19 = 0;
      v20 = v17;
      do
      {
        if (*(_QWORD *)v44 != v18)
          objc_enumerationMutation(obj);
        v21 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * v19);
        -[HMCContext managedObjectContext](self->_context, "managedObjectContext");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = v20;
        +[_MKFModel modelWithModelID:context:error:](_MKFAccessory, "modelWithModelID:context:error:", v21, v22, &v42);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v42;

        if (!v23)
        {
          if (!v17)
          {
            v24 = (void *)MEMORY[0x24BDD1540];
            objc_msgSend(MEMORY[0x24BDD1540], "hmPrivateErrorWithCode:", 2020);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "hmErrorWithCode:description:reason:suggestion:underlyingError:", 2, 0, 0, 0, v25);
            v17 = (id)objc_claimAutoreleasedReturnValue();

          }
          v26 = (void *)MEMORY[0x227676638]();
          v27 = self;
          HMFGetOSLogHandle();
          v28 = objc_claimAutoreleasedReturnValue();
          v30 = v37;
          v29 = v38;
          v31 = v36;
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v41 = v26;
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v52 = v32;
            v53 = 2112;
            v54 = v21;
            v55 = 2112;
            v56 = v17;
            _os_log_impl(&dword_2218F0000, v28, OS_LOG_TYPE_ERROR, "%{public}@Fetching accessory with modelID %@ failed with %@", buf, 0x20u);

            v26 = v41;
          }

          objc_autoreleasePoolPop(v26);
          if (v35)
            *v35 = objc_retainAutorelease(v17);
          v14 = obj;

          v33 = 0;
          goto LABEL_19;
        }
        objc_msgSend(v13, "addObject:", v23);

        ++v19;
        v20 = v17;
      }
      while (v16 != v19);
      v14 = obj;
      v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v57, 16);
      if (v16)
        continue;
      break;
    }
  }
  else
  {
    v17 = 0;
  }

  v33 = (void *)objc_msgSend(v13, "copy");
  v30 = v37;
  v29 = v38;
  v31 = v36;
LABEL_19:

  return v33;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_userModelID, 0);
}

uint64_t __106__HMDUserAccessorySettingsDataController__updatedAccessorySetFromAccessoryUUIDs_currentAccessories_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2) ^ 1;
}

uint64_t __106__HMDUserAccessorySettingsDataController__updatedAccessorySetFromAccessoryUUIDs_currentAccessories_error___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "modelID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3);

  return v4;
}

uint64_t __106__HMDUserAccessorySettingsDataController__updatedAccessorySetFromAccessoryUUIDs_currentAccessories_error___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "modelID");
}

void __81__HMDUserAccessorySettingsDataController_enableUserListeningHistoryForAccessory___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  id v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v30 = 0;
  +[_MKFModel modelWithModelID:context:error:](_MKFUser, "modelWithModelID:context:error:", v2, v3, &v30);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v30;
  if (v4)
  {
    v6 = (void *)MEMORY[0x24BDBCEF0];
    objc_msgSend(v4, "accessoriesWithListeningHistoryEnabled");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(v6, "setWithSet:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCF20], "set");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setWithSet:", v14);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v15 = *(_QWORD *)(a1 + 56);
    v16 = *(_QWORD *)(a1 + 40);
    v29 = v5;
    +[_MKFModel modelWithModelID:context:error:](_MKFAccessory, "modelWithModelID:context:error:", v15, v16, &v29);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v29;

    if (objc_msgSend(v8, "containsObject:", v17))
    {
      v19 = (void *)MEMORY[0x227676638]();
      v20 = *(id *)(a1 + 48);
      HMFGetOSLogHandle();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = *(void **)(a1 + 56);
        *(_DWORD *)buf = 138543618;
        v32 = v22;
        v33 = 2112;
        v34 = v23;
        _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_INFO, "%{public}@Accessory %@ ULH is already enabled", buf, 0x16u);

      }
    }
    else
    {
      objc_msgSend(v8, "addObject:", v17);
      v24 = (void *)objc_msgSend(v8, "copy");
      objc_msgSend(v4, "setAccessoriesWithListeningHistoryEnabled_:", v24);

      v25 = *(void **)(*(_QWORD *)(a1 + 48) + 16);
      v28 = v18;
      objc_msgSend(v25, "save:", &v28);
      v26 = v28;

      if (!v26)
      {
        v18 = 0;
        goto LABEL_16;
      }
      v19 = (void *)MEMORY[0x227676638]();
      v20 = *(id *)(a1 + 48);
      HMFGetOSLogHandle();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v32 = v27;
        v33 = 2112;
        v34 = v26;
        _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_ERROR, "%{public}@Saving user listening history access control failed with %@", buf, 0x16u);

      }
      v18 = v26;
    }

    objc_autoreleasePoolPop(v19);
LABEL_16:

    v5 = v18;
    goto LABEL_17;
  }
  v9 = (void *)MEMORY[0x227676638]();
  v10 = *(id *)(a1 + 48);
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *(void **)(a1 + 32);
    *(_DWORD *)buf = 138543874;
    v32 = v12;
    v33 = 2112;
    v34 = v13;
    v35 = 2112;
    v36 = v5;
    _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_ERROR, "%{public}@Fetching userModelID %@ failed with %@ when enabling ULH", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v9);
LABEL_17:

}

void __114__HMDUserAccessorySettingsDataController_handleUserListeningHistoryUpdateControlUpdatedAccessoryUUIDs_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  id v35;
  __int16 v36;
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v31 = 0;
  +[_MKFModel modelWithModelID:context:error:](_MKFUser, "modelWithModelID:context:error:", v2, v3, &v31);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v31;
  if (v4)
  {
    objc_msgSend(v4, "accessoriesWithListeningHistoryEnabled");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v8 = v6;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCF20], "set");
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    v15 = v8;

    v16 = *(void **)(a1 + 48);
    v17 = *(_QWORD *)(a1 + 56);
    v30 = v5;
    objc_msgSend(v16, "_updatedAccessorySetFromAccessoryUUIDs:currentAccessories:error:", v17, v15, &v30);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v30;

    if (v18)
    {
      v20 = (void *)objc_msgSend(v18, "copy");
      objc_msgSend(v4, "setAccessoriesWithListeningHistoryEnabled_:", v20);

      v21 = *(void **)(*(_QWORD *)(a1 + 48) + 16);
      v29 = v19;
      objc_msgSend(v21, "save:", &v29);
      v22 = v29;

      if (v22)
      {
        v23 = (void *)MEMORY[0x227676638]();
        v24 = *(id *)(a1 + 48);
        HMFGetOSLogHandle();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v33 = v26;
          v34 = 2112;
          v35 = v22;
          _os_log_impl(&dword_2218F0000, v25, OS_LOG_TYPE_ERROR, "%{public}@Saving user listening history access control failed with %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v23);
        HMDSanitizeCoreDataError(v22);
        v19 = (id)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v19 = 0;
      }
    }
    v27 = _Block_copy(*(const void **)(a1 + 64));
    v28 = v27;
    if (v27)
      (*((void (**)(void *, id))v27 + 2))(v27, v19);

    v5 = v19;
  }
  else
  {
    v9 = (void *)MEMORY[0x227676638]();
    v10 = *(id *)(a1 + 48);
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138543874;
      v33 = v12;
      v34 = 2112;
      v35 = v13;
      v36 = 2112;
      v37 = v5;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_ERROR, "%{public}@Fetching userModelID %@ failed with %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v9);
    v14 = _Block_copy(*(const void **)(a1 + 64));
    v15 = v14;
    if (v14)
      (*((void (**)(void *, id))v14 + 2))(v14, v5);
  }

}

void __113__HMDUserAccessorySettingsDataController_handleMediaContentProfileAccessControlUpdatedAccessoryUUIDs_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  id v35;
  __int16 v36;
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v31 = 0;
  +[_MKFModel modelWithModelID:context:error:](_MKFUser, "modelWithModelID:context:error:", v2, v3, &v31);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v31;
  if (v4)
  {
    objc_msgSend(v4, "accessoriesWithMediaContentProfileEnabled");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v8 = v6;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCF20], "set");
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    v15 = v8;

    v16 = *(void **)(a1 + 48);
    v17 = *(_QWORD *)(a1 + 56);
    v30 = v5;
    objc_msgSend(v16, "_updatedAccessorySetFromAccessoryUUIDs:currentAccessories:error:", v17, v15, &v30);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v30;

    if (v18)
    {
      v20 = (void *)objc_msgSend(v18, "copy");
      objc_msgSend(v4, "setAccessoriesWithMediaContentProfileEnabled_:", v20);

      v21 = *(void **)(*(_QWORD *)(a1 + 48) + 16);
      v29 = v19;
      objc_msgSend(v21, "save:", &v29);
      v22 = v29;

      if (v22)
      {
        v23 = (void *)MEMORY[0x227676638]();
        v24 = *(id *)(a1 + 48);
        HMFGetOSLogHandle();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v33 = v26;
          v34 = 2112;
          v35 = v22;
          _os_log_impl(&dword_2218F0000, v25, OS_LOG_TYPE_ERROR, "%{public}@Saving updated media content profile access control failed with %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v23);
        HMDSanitizeCoreDataError(v22);
        v19 = (id)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v19 = 0;
      }
    }
    v27 = _Block_copy(*(const void **)(a1 + 64));
    v28 = v27;
    if (v27)
      (*((void (**)(void *, id))v27 + 2))(v27, v19);

    v5 = v19;
  }
  else
  {
    v9 = (void *)MEMORY[0x227676638]();
    v10 = *(id *)(a1 + 48);
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138543874;
      v33 = v12;
      v34 = 2112;
      v35 = v13;
      v36 = 2112;
      v37 = v5;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_ERROR, "%{public}@Fetching userModelID %@ failed with %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v9);
    v14 = _Block_copy(*(const void **)(a1 + 64));
    v15 = v14;
    if (v14)
      (*((void (**)(void *, id))v14 + 2))(v14, v5);
  }

}

void __151__HMDUserAccessorySettingsDataController_handleAssistantAccessControlAccessoryUUIDsUpdated_activityNotificationsEnabledForPersonalRequests_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  id v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  id v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v32 = 0;
  +[_MKFModel modelWithModelID:context:error:](_MKFUser, "modelWithModelID:context:error:", v2, v3, &v32);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v32;
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *(unsigned __int8 *)(a1 + 72));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setActivityNotificationsEnabledForPersonalRequests:", v6);

    objc_msgSend(v4, "accessoriesWithPersonalRequestsEnabled");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      v9 = v7;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCF20], "set");
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    v16 = v9;

    v17 = *(void **)(a1 + 48);
    v18 = *(_QWORD *)(a1 + 56);
    v31 = v5;
    objc_msgSend(v17, "_updatedAccessorySetFromAccessoryUUIDs:currentAccessories:error:", v18, v16, &v31);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v31;

    if (v19)
    {
      v21 = (void *)objc_msgSend(v19, "copy");
      objc_msgSend(v4, "setAccessoriesWithPersonalRequestsEnabled_:", v21);

      v22 = *(void **)(*(_QWORD *)(a1 + 48) + 16);
      v30 = v20;
      objc_msgSend(v22, "save:", &v30);
      v23 = v30;

      if (v23)
      {
        v24 = (void *)MEMORY[0x227676638]();
        v25 = *(id *)(a1 + 48);
        HMFGetOSLogHandle();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v34 = v27;
          v35 = 2112;
          v36 = v23;
          _os_log_impl(&dword_2218F0000, v26, OS_LOG_TYPE_ERROR, "%{public}@Saving personal requests access control failed with %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v24);
        HMDSanitizeCoreDataError(v23);
        v20 = (id)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v20 = 0;
      }
    }
    v28 = _Block_copy(*(const void **)(a1 + 64));
    v29 = v28;
    if (v28)
      (*((void (**)(void *, id))v28 + 2))(v28, v20);

    v5 = v20;
  }
  else
  {
    v10 = (void *)MEMORY[0x227676638]();
    v11 = *(id *)(a1 + 48);
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138543874;
      v34 = v13;
      v35 = 2112;
      v36 = v14;
      v37 = 2112;
      v38 = v5;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_ERROR, "%{public}@Fetching userModelID %@ failed with %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v10);
    v15 = _Block_copy(*(const void **)(a1 + 64));
    v16 = v15;
    if (v15)
      (*((void (**)(void *, id))v15 + 2))(v15, v5);
  }

}

void __99__HMDUserAccessorySettingsDataController_userListeningHistoryUpdateControlModelAccessoriesToEncode__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v16 = 0;
  +[_MKFModel modelWithModelID:context:error:](_MKFUser, "modelWithModelID:context:error:", v2, v3, &v16);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v16;
  if (v4)
  {
    objc_msgSend(v4, "accessoriesWithListeningHistoryEnabled");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "na_map:", &__block_literal_global_7_119192);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "allObjects");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

  }
  else
  {
    v11 = (void *)MEMORY[0x227676638]();
    v12 = *(id *)(a1 + 48);
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543874;
      v18 = v14;
      v19 = 2112;
      v20 = v15;
      v21 = 2112;
      v22 = v5;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Fetching userModelID %@ failed with %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v11);
  }

}

uint64_t __99__HMDUserAccessorySettingsDataController_userListeningHistoryUpdateControlModelAccessoriesToEncode__block_invoke_6(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "modelID");
}

void __93__HMDUserAccessorySettingsDataController_mediaContentProfileAccessControlAccessoriesToEncode__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v16 = 0;
  +[_MKFModel modelWithModelID:context:error:](_MKFUser, "modelWithModelID:context:error:", v2, v3, &v16);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v16;
  if (v4)
  {
    objc_msgSend(v4, "accessoriesWithMediaContentProfileEnabled");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "na_map:", &__block_literal_global_5_119194);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "allObjects");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

  }
  else
  {
    v11 = (void *)MEMORY[0x227676638]();
    v12 = *(id *)(a1 + 48);
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543874;
      v18 = v14;
      v19 = 2112;
      v20 = v15;
      v21 = 2112;
      v22 = v5;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Fetching userModelID %@ failed with %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v11);
  }

}

uint64_t __93__HMDUserAccessorySettingsDataController_mediaContentProfileAccessControlAccessoriesToEncode__block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "modelID");
}

void __83__HMDUserAccessorySettingsDataController_assistantAccessControlAccessoriesToEncode__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v16 = 0;
  +[_MKFModel modelWithModelID:context:error:](_MKFUser, "modelWithModelID:context:error:", v2, v3, &v16);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v16;
  if (v4)
  {
    objc_msgSend(v4, "accessoriesWithPersonalRequestsEnabled");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "na_map:", &__block_literal_global_119196);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "allObjects");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

  }
  else
  {
    v11 = (void *)MEMORY[0x227676638]();
    v12 = *(id *)(a1 + 48);
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543874;
      v18 = v14;
      v19 = 2112;
      v20 = v15;
      v21 = 2112;
      v22 = v5;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Fetching userModelID %@ failed with %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v11);
  }

}

uint64_t __83__HMDUserAccessorySettingsDataController_assistantAccessControlAccessoriesToEncode__block_invoke_1(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "modelID");
}

void __111__HMDUserAccessorySettingsDataController_assistantAccessControlActivityNotificationsEnabledForPersonalRequests__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  id v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v12 = 0;
  +[_MKFModel modelWithModelID:context:error:](_MKFUser, "modelWithModelID:context:error:", v2, v3, &v12);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v12;
  if (v4)
  {
    objc_msgSend(v4, "activityNotificationsEnabledForPersonalRequests");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(v6, "BOOLValue");

  }
  else
  {
    v7 = (void *)MEMORY[0x227676638]();
    v8 = *(id *)(a1 + 48);
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543874;
      v14 = v10;
      v15 = 2112;
      v16 = v11;
      v17 = 2112;
      v18 = v5;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_ERROR, "%{public}@Fetching userModelID %@ failed with %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v7);
  }

}

@end
