@implementation HMDAccessCodeDataManager

- (HMDAccessCodeDataManager)initWithContext:(id)a3 delegate:(id)a4
{
  id v7;
  id v8;
  HMDAccessCodeDataManager *v9;
  HMDAccessCodeDataManager *v10;
  id dataCleanUpTimerFactory;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)HMDAccessCodeDataManager;
  v9 = -[HMDAccessCodeDataManager init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_context, a3);
    objc_storeWeak((id *)&v10->_delegate, v8);
    dataCleanUpTimerFactory = v10->_dataCleanUpTimerFactory;
    v10->_dataCleanUpTimerFactory = &__block_literal_global_190157;

  }
  return v10;
}

- (void)configure
{
  void *v3;
  int v4;

  -[HMDAccessCodeDataManager context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isCurrentDeviceOwnerController");

  if (v4)
  {
    -[HMDAccessCodeDataManager _setUpAndStartTimer](self, "_setUpAndStartTimer");
    -[HMDAccessCodeDataManager _cleanUpOldRemovedUserData](self, "_cleanUpOldRemovedUserData");
  }
}

- (NSArray)homeAccessCodeValues
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[HMDAccessCodeDataManager homeAccessCodeValuesWithSimpleLabels](self, "homeAccessCodeValuesWithSimpleLabels");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessCodeDataManager homeAccessCodeValuesWithUserLabels](self, "homeAccessCodeValuesWithUserLabels");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessCodeDataManager homeAccessCodeValuesWithRemovedUserInfo](self, "homeAccessCodeValuesWithRemovedUserInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "arrayByAddingObjectsFromArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v7;
}

- (NSArray)homeAccessCodeValuesWithSimpleLabels
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HMDAccessCodeDataManager *v9;
  NSObject *v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  -[HMDAccessCodeDataManager context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v8 = (void *)MEMORY[0x227676638]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v16 = v11;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Cannot fetch home access code values with simple labels because home reference was nil", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v8);
    goto LABEL_7;
  }
  objc_msgSend(v4, "labelsByAccessCode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
LABEL_7:
    v7 = (void *)MEMORY[0x24BDBD1A8];
    goto LABEL_8;
  }
  objc_msgSend(v4, "labelsByAccessCode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __64__HMDAccessCodeDataManager_homeAccessCodeValuesWithSimpleLabels__block_invoke;
  v13[3] = &unk_24E78F3A0;
  v14 = v4;
  objc_msgSend(v6, "na_map:", v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_8:
  return (NSArray *)v7;
}

- (NSArray)homeAccessCodeValuesWithUserLabels
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  HMDAccessCodeDataManager *v8;
  NSObject *v9;
  void *v10;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  -[HMDAccessCodeDataManager context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v4, "users");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "na_map:", &__block_literal_global_10_190150);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
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
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_ERROR, "%{public}@Cannot fetch user access code values with simple labels because home reference was nil", (uint8_t *)&v12, 0xCu);

    }
    objc_autoreleasePoolPop(v7);
    v6 = (void *)MEMORY[0x24BDBD1A8];
  }

  return (NSArray *)v6;
}

- (NSArray)homeAccessCodeValuesWithRemovedUserInfo
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HMDAccessCodeDataManager *v9;
  NSObject *v10;
  void *v11;
  const char *v12;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  -[HMDAccessCodeDataManager context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v8 = (void *)MEMORY[0x227676638]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543362;
      v15 = v11;
      v12 = "%{public}@Cannot fetch user access code values with simple labels because home reference was nil";
LABEL_8:
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_ERROR, v12, (uint8_t *)&v14, 0xCu);

    }
LABEL_9:

    objc_autoreleasePoolPop(v8);
    v7 = (void *)MEMORY[0x24BDBD1A8];
    goto LABEL_10;
  }
  objc_msgSend(v4, "removedUserInfoByAccessCode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v8 = (void *)MEMORY[0x227676638]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543362;
      v15 = v11;
      v12 = "%{public}@Home has a nil removedUserInfoByAccessCode but should not";
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  objc_msgSend(v4, "removedUserInfoByAccessCode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "na_map:", &__block_literal_global_12_190147);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_10:
  return (NSArray *)v7;
}

- (id)homeAccessCodeWithRemovedUserInfoWithUUID:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[HMDAccessCodeDataManager homeAccessCodeValuesWithRemovedUserInfo](self, "homeAccessCodeValuesWithRemovedUserInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __70__HMDAccessCodeDataManager_homeAccessCodeWithRemovedUserInfoWithUUID___block_invoke;
  v9[3] = &unk_24E78F448;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "na_firstObjectPassingTest:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)setUserInformation:(id)a3 forHomeAccessCodeWithValue:(id)a4 changedByUserUUID:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  HMDAccessCodeDataManager *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  HMDAccessCodeDataManager *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  int v28;
  void *v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[HMDAccessCodeDataManager context](self, "context");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "workQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v12);

  v13 = (void *)MEMORY[0x227676638]();
  v14 = self;
  HMFGetOSLogHandle();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 138543618;
    v29 = v16;
    v30 = 2112;
    v31 = v8;
    _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_INFO, "%{public}@Setting user information: %@, for access code value", (uint8_t *)&v28, 0x16u);

  }
  objc_autoreleasePoolPop(v13);
  objc_msgSend(v8, "simpleLabel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    objc_msgSend(v8, "simpleLabel");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAccessCodeDataManager _setSimpleLabel:forAccessCodeValue:](v14, "_setSimpleLabel:forAccessCodeValue:", v18, v9);
    v19 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v8, "userUUID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      objc_msgSend(v8, "userUUID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAccessCodeDataManager _setUserWithUUID:forAccessCodeValue:changedByUserUUID:](v14, "_setUserWithUUID:forAccessCodeValue:changedByUserUUID:", v18, v9, v10);
      v19 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v21 = (void *)MEMORY[0x227676638]();
      v22 = v14;
      HMFGetOSLogHandle();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = 138543618;
        v29 = v24;
        v30 = 2112;
        v31 = v8;
        _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_ERROR, "%{public}@Not setting user information for access code value because empty user information was provided: %@", (uint8_t *)&v28, 0x16u);

      }
      objc_autoreleasePoolPop(v21);
      v25 = (void *)MEMORY[0x24BE6B608];
      objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 15);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "futureWithError:", v18);
      v19 = objc_claimAutoreleasedReturnValue();
    }
  }
  v26 = (void *)v19;

  return v26;
}

- (id)removeHomeAccessCodeWithValue:(id)a3 removedByUserUUID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  HMDAccessCodeDataManager *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  int v15;
  uint64_t v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  uint64_t v23;
  void *v24;
  HMDAccessCodeDataManager *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  int v30;
  void *v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[HMDAccessCodeDataManager context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "workQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v9);

  v10 = (void *)MEMORY[0x227676638]();
  v11 = self;
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 138543618;
    v31 = v13;
    v32 = 2112;
    v33 = v7;
    _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@Removing home access code, removedByUserUUID: %@", (uint8_t *)&v30, 0x16u);

  }
  objc_autoreleasePoolPop(v10);
  -[HMDAccessCodeDataManager accessCodeValuesWithSimpleLabel](v11, "accessCodeValuesWithSimpleLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "containsObject:", v6);

  if (v15)
  {
    -[HMDAccessCodeDataManager _removeSimpleLabelAccessCodeValue:](v11, "_removeSimpleLabelAccessCodeValue:", v6);
    v16 = objc_claimAutoreleasedReturnValue();
LABEL_7:
    v19 = (void *)v16;
    goto LABEL_14;
  }
  -[HMDAccessCodeDataManager accessCodeValuesWithUserLabel](v11, "accessCodeValuesWithUserLabel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "containsObject:", v6);

  if (v18)
  {
    -[HMDAccessCodeDataManager _removeUserAccessCodeValue:removedByUserUUID:](v11, "_removeUserAccessCodeValue:removedByUserUUID:", v6, v7);
    v16 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  -[HMDAccessCodeDataManager accessCodeValuesWithRemovedUserInfo](v11, "accessCodeValuesWithRemovedUserInfo");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "containsObject:", v6);

  if (v21)
  {
    objc_msgSend(v6, "stringValue");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAccessCodeDataManager _removeHMDRemovedUserAccessCodeWithAccessCode:](v11, "_removeHMDRemovedUserAccessCodeWithAccessCode:", v22);
    v23 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v24 = (void *)MEMORY[0x227676638]();
    v25 = v11;
    HMFGetOSLogHandle();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = 138543362;
      v31 = v27;
      _os_log_impl(&dword_2218F0000, v26, OS_LOG_TYPE_ERROR, "%{public}@Did not find home access code", (uint8_t *)&v30, 0xCu);

    }
    objc_autoreleasePoolPop(v24);
    v28 = (void *)MEMORY[0x24BE6B608];
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "futureWithError:", v22);
    v23 = objc_claimAutoreleasedReturnValue();
  }
  v19 = (void *)v23;

LABEL_14:
  return v19;
}

- (id)updateUserInformation:(id)a3 forHomeAccessCodeWithOldValue:(id)a4 newAccessCodeValue:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[5];
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "userUUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[HMDAccessCodeDataManager setUserInformation:forHomeAccessCodeWithValue:changedByUserUUID:](self, "setUserInformation:forHomeAccessCodeWithValue:changedByUserUUID:", v8, v10, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v8, "simpleLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      -[HMDAccessCodeDataManager removeHomeAccessCodeWithValue:removedByUserUUID:](self, "removeHomeAccessCodeWithValue:removedByUserUUID:", v9, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = MEMORY[0x24BDAC760];
      v17[1] = 3221225472;
      v17[2] = __99__HMDAccessCodeDataManager_updateUserInformation_forHomeAccessCodeWithOldValue_newAccessCodeValue___block_invoke;
      v17[3] = &unk_24E78F470;
      v17[4] = self;
      v18 = v8;
      v19 = v10;
      objc_msgSend(v14, "flatMap:", v17);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v15 = (void *)MEMORY[0x24BE6B608];
      objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 3);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "futureWithError:", v14);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  return v12;
}

- (id)removeAllHomeAccessCodes
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  -[HMDAccessCodeDataManager context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[HMDAccessCodeDataManager homeAccessCodeValues](self, "homeAccessCodeValues", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v10), "accessCodeValue");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDAccessCodeDataManager removeHomeAccessCodeWithValue:removedByUserUUID:](self, "removeHomeAccessCodeWithValue:removedByUserUUID:", v11, 0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v12);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  objc_msgSend(MEMORY[0x24BE6B608], "chainFutures:", v5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void)_setUpAndStartTimer
{
  void *v3;
  NSObject *v4;
  void (**v5)(_QWORD, _QWORD);
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  -[HMDAccessCodeDataManager context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  -[HMDAccessCodeDataManager dataCleanUpTimerFactory](self, "dataCleanUpTimerFactory");
  v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  -[HMDAccessCodeDataManager context](self, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dataCleanUpCheckTimerInterval");
  v5[2](v5, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessCodeDataManager setDataCleanUpTimer:](self, "setDataCleanUpTimer:", v7);

  -[HMDAccessCodeDataManager dataCleanUpTimer](self, "dataCleanUpTimer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDelegate:", self);

  -[HMDAccessCodeDataManager context](self, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "workQueue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessCodeDataManager dataCleanUpTimer](self, "dataCleanUpTimer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setDelegateQueue:", v10);

  -[HMDAccessCodeDataManager dataCleanUpTimer](self, "dataCleanUpTimer");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "resume");

}

- (id)_setUserWithUUID:(id)a3 forAccessCodeValue:(id)a4 changedByUserUUID:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  HMDUserAccessCodeModel *v19;
  void *v20;
  void *v21;
  BOOL v22;
  void *v23;
  void *v24;
  void *v25;
  HMDAccessCodeDataManager *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  HMDAccessCodeDataManager *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  _QWORD v37[5];
  id v38;
  id v39;
  BOOL v40;
  _QWORD v41[4];
  id v42;
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  id v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[HMDAccessCodeDataManager context](self, "context");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "workQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v12);

  -[HMDAccessCodeDataManager context](self, "context");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "home");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(v14, "users");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = MEMORY[0x24BDAC760];
    v41[0] = MEMORY[0x24BDAC760];
    v41[1] = 3221225472;
    v41[2] = __82__HMDAccessCodeDataManager__setUserWithUUID_forAccessCodeValue_changedByUserUUID___block_invoke;
    v41[3] = &unk_24E799728;
    v17 = v8;
    v42 = v17;
    objc_msgSend(v15, "na_firstObjectPassingTest:", v41);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      v19 = -[HMDUserAccessCodeModel initWithUserUUID:]([HMDUserAccessCodeModel alloc], "initWithUserUUID:", v17);
      objc_msgSend(v9, "stringValue");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDUserAccessCodeModel setValue:](v19, "setValue:", v20);

      -[HMDUserAccessCodeModel setChangedByUserUUID:](v19, "setChangedByUserUUID:", v10);
      objc_msgSend(v18, "accessCode");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v21 != 0;

      -[HMDAccessCodeDataManager addOrUpdateUserAccessCodeModel:](self, "addOrUpdateUserAccessCodeModel:", v19);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v37[0] = v16;
      v37[1] = 3221225472;
      v37[2] = __82__HMDAccessCodeDataManager__setUserWithUUID_forAccessCodeValue_changedByUserUUID___block_invoke_19;
      v37[3] = &unk_24E78F498;
      v40 = v22;
      v37[4] = self;
      v38 = v18;
      v39 = v9;
      objc_msgSend(v23, "addSuccessBlock:", v37);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v31 = (void *)MEMORY[0x227676638]();
      v32 = self;
      HMFGetOSLogHandle();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v44 = v34;
        v45 = 2112;
        v46 = v17;
        _os_log_impl(&dword_2218F0000, v33, OS_LOG_TYPE_ERROR, "%{public}@Not setting user UUID: %@, for access code value because we could not find a user with that UUID.", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v31);
      v35 = (void *)MEMORY[0x24BE6B608];
      objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 15);
      v19 = (HMDUserAccessCodeModel *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "futureWithError:", v19);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
    }

    v30 = v42;
  }
  else
  {
    v25 = (void *)MEMORY[0x227676638]();
    v26 = self;
    HMFGetOSLogHandle();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v44 = v28;
      v45 = 2112;
      v46 = v8;
      _os_log_impl(&dword_2218F0000, v27, OS_LOG_TYPE_ERROR, "%{public}@Not setting user UUID: %@, for access code value because home reference was nil", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v25);
    v29 = (void *)MEMORY[0x24BE6B608];
    objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 15);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "futureWithError:", v30);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v24;
}

- (id)_removeUserAccessCodeValue:(id)a3 removedByUserUUID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  HMDUserAccessCodeModel *v14;
  void *v15;
  HMDUserAccessCodeModel *v16;
  void *v17;
  void *v18;
  void *v19;
  HMDAccessCodeDataManager *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  HMDAccessCodeDataManager *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  _QWORD v30[5];
  id v31;
  uint8_t buf[4];
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[HMDAccessCodeDataManager context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "workQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v9);

  -[HMDAccessCodeDataManager context](self, "context");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "home");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v6, "stringValue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDAccessCodeDataManager userWithAccessCode:inHome:](HMDAccessCodeDataManager, "userWithAccessCode:inHome:", v12, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      v14 = [HMDUserAccessCodeModel alloc];
      objc_msgSend(v13, "uuid");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = -[HMDUserAccessCodeModel initWithUserUUID:](v14, "initWithUserUUID:", v15);

      -[HMDAccessCodeDataManager removeUserAccessCodeModel:](self, "removeUserAccessCodeModel:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v30[0] = MEMORY[0x24BDAC760];
      v30[1] = 3221225472;
      v30[2] = __73__HMDAccessCodeDataManager__removeUserAccessCodeValue_removedByUserUUID___block_invoke;
      v30[3] = &unk_24E79BD18;
      v30[4] = self;
      v31 = v13;
      objc_msgSend(v17, "addSuccessBlock:", v30);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v24 = (void *)MEMORY[0x227676638]();
      v25 = self;
      HMFGetOSLogHandle();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v33 = v27;
        _os_log_impl(&dword_2218F0000, v26, OS_LOG_TYPE_ERROR, "%{public}@Not removing access code value because couldn't find any user with that access code.", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v24);
      v28 = (void *)MEMORY[0x24BE6B608];
      objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 15);
      v16 = (HMDUserAccessCodeModel *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "futureWithError:", v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v19 = (void *)MEMORY[0x227676638]();
    v20 = self;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v33 = v22;
      _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_ERROR, "%{public}@Not removing access code value because home reference was nil", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v19);
    v23 = (void *)MEMORY[0x24BE6B608];
    objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 15);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "futureWithError:", v13);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v18;
}

- (void)_messageUser:(id)a3 thatTheirAccessCodeWasChangedWithType:(unint64_t)a4
{
  id v6;
  void *v7;
  HMDAccessCodeDataManager *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  HMDRemoteAccountMessageDestination *v13;
  void *v14;
  void *v15;
  void *v16;
  HMDRemoteAccountMessageDestination *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  unint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void *)MEMORY[0x227676638]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "uuid");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "UUIDString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v26 = v10;
    v27 = 2112;
    v28 = v12;
    v29 = 2048;
    v30 = a4;
    _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Messaging user that their access code was changed. user: %@, changeType: %lu", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v7);
  v13 = [HMDRemoteAccountMessageDestination alloc];
  -[HMDAccessCodeDataManager delegate](v8, "delegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "messageTargetUUID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "accountHandle");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[HMDRemoteAccountMessageDestination initWithTarget:handle:multicast:](v13, "initWithTarget:handle:multicast:", v15, v16, 1);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a4, CFSTR("HMDAccessCodeManagerMessageKeyUserAccessCodeChangeType"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v18;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDRemoteMessage secureMessageWithName:qualityOfService:destination:messagePayload:](HMDRemoteMessage, "secureMessageWithName:qualityOfService:destination:messagePayload:", CFSTR("HMDAccessCodeManagerUserAccessCodeDidChangeMessage"), 33, v17, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDAccessCodeDataManager context](v8, "context");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "messageDispatcher");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "sendMessage:", v20);

}

- (id)_setSimpleLabel:(id)a3 forAccessCodeValue:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  HMDHomeAccessCodeModel *v12;
  void *v13;
  void *v14;
  HMDHomeAccessCodeModel *v15;
  void *v16;
  void *v17;
  void *v18;
  HMDAccessCodeDataManager *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  _QWORD v24[5];
  id v25;
  uint8_t buf[4];
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[HMDAccessCodeDataManager context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "workQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v9);

  -[HMDAccessCodeDataManager context](self, "context");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "home");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = [HMDHomeAccessCodeModel alloc];
    objc_msgSend(v11, "uuid");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringValue");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[HMDHomeAccessCodeModel initWithHomeUUID:value:label:](v12, "initWithHomeUUID:value:label:", v13, v14, v6);

    -[HMDAccessCodeDataManager addOrUpdateHomeAccessCodeModel:](self, "addOrUpdateHomeAccessCodeModel:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __63__HMDAccessCodeDataManager__setSimpleLabel_forAccessCodeValue___block_invoke;
    v24[3] = &unk_24E79BD18;
    v24[4] = self;
    v25 = v7;
    objc_msgSend(v16, "addSuccessBlock:", v24);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v18 = (void *)MEMORY[0x227676638]();
    v19 = self;
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v27 = v21;
      _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_ERROR, "%{public}@Not setting simple label for access code value because home reference was nil", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v18);
    v22 = (void *)MEMORY[0x24BE6B608];
    objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 15);
    v15 = (HMDHomeAccessCodeModel *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "futureWithError:", v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v17;
}

- (id)_removeSimpleLabelAccessCodeValue:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  HMDHomeAccessCodeModel *v12;
  void *v13;
  void *v14;
  HMDHomeAccessCodeModel *v15;
  void *v16;
  void *v17;
  HMDAccessCodeDataManager *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  int v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDAccessCodeDataManager context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  -[HMDAccessCodeDataManager context](self, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "home");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v8, "labelsByAccessCode");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = [HMDHomeAccessCodeModel alloc];
    objc_msgSend(v8, "uuid");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringValue");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[HMDHomeAccessCodeModel initWithHomeUUID:value:label:](v12, "initWithHomeUUID:value:label:", v13, v14, v11);

    -[HMDAccessCodeDataManager removeHomeAccessCodeModel:](self, "removeHomeAccessCodeModel:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v17 = (void *)MEMORY[0x227676638]();
    v18 = self;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138543362;
      v24 = v20;
      _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_ERROR, "%{public}@Not removing access code value because home reference was nil", (uint8_t *)&v23, 0xCu);

    }
    objc_autoreleasePoolPop(v17);
    v21 = (void *)MEMORY[0x24BE6B608];
    objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 15);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "futureWithError:", v11);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v16;
}

- (void)_cleanUpOldRemovedUserData
{
  void *v3;
  NSObject *v4;
  void *v5;
  HMDAccessCodeDataManager *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  HMDAccessCodeDataManager *v13;
  NSObject *v14;
  void *v15;
  _QWORD v16[5];
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  -[HMDAccessCodeDataManager context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v18 = v8;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Cleaning up old removedUserInfo", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDAccessCodeDataManager context](v6, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "home");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v10, "removedUserInfoByAccessCode");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __54__HMDAccessCodeDataManager__cleanUpOldRemovedUserData__block_invoke;
    v16[3] = &unk_24E78F4C0;
    v16[4] = v6;
    objc_msgSend(v11, "na_each:", v16);

  }
  else
  {
    v12 = (void *)MEMORY[0x227676638]();
    v13 = v6;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v18 = v15;
      _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_ERROR, "%{public}@Not cleaning up old removed user data because home reference was nil", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v12);
  }

}

- (void)removeHMDRemovedUserAccessCodeWithAccessCode:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  -[HMDAccessCodeDataManager context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __73__HMDAccessCodeDataManager_removeHMDRemovedUserAccessCodeWithAccessCode___block_invoke;
  v8[3] = &unk_24E79C268;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(v6, v8);

}

- (id)_removeHMDRemovedUserAccessCodeWithAccessCode:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  HMDAccessCodeDataManager *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  HMDAccessCodeDataManager *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  HMDAccessCodeDataManager *v24;
  NSObject *v25;
  void *v26;
  int v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDAccessCodeDataManager context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  v7 = (void *)MEMORY[0x227676638]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 138543362;
    v29 = v10;
    _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Removing HMDRemovedUserAccessCode with specified value", (uint8_t *)&v28, 0xCu);

  }
  objc_autoreleasePoolPop(v7);
  -[HMDAccessCodeDataManager context](v8, "context");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "home");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    v18 = (void *)MEMORY[0x227676638]();
    v19 = v8;
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 138543362;
      v29 = v21;
      _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_ERROR, "%{public}@Not Removing HMDRemovedUserAccessCode because home reference was nil", (uint8_t *)&v28, 0xCu);

    }
    objc_autoreleasePoolPop(v18);
    v22 = (void *)MEMORY[0x24BE6B608];
    objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 15);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "futureWithError:", v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  objc_msgSend(v12, "removedUserInfoByAccessCode");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", v4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(v12, "removedUserInfoByAccessCode");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKeyedSubscript:", v4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAccessCodeDataManager removeHMDRemovedUserAccessCodeWithCode:removedUserInfo:](v8, "removeHMDRemovedUserAccessCodeWithCode:removedUserInfo:", v4, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_9:
    goto LABEL_13;
  }
  v23 = (void *)MEMORY[0x227676638]();
  v24 = v8;
  HMFGetOSLogHandle();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 138543362;
    v29 = v26;
    _os_log_impl(&dword_2218F0000, v25, OS_LOG_TYPE_INFO, "%{public}@Did not find HMDRemovedUserAccessCode with the specified value", (uint8_t *)&v28, 0xCu);

  }
  objc_autoreleasePoolPop(v23);
  objc_msgSend(MEMORY[0x24BE6B608], "futureWithNoResult");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_13:

  return v17;
}

- (NSSet)accessCodeValuesWithSimpleLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  HMDAccessCodeDataManager *v11;
  NSObject *v12;
  void *v13;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  -[HMDAccessCodeDataManager context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = (void *)MEMORY[0x24BDBCF20];
    objc_msgSend(v4, "labelsByAccessCode");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "allKeys");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "na_map:", &__block_literal_global_29_190119);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setWithArray:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = (void *)MEMORY[0x227676638]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543362;
      v16 = v13;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_ERROR, "%{public}@Cannot find access code values with simple label because home reference was nil", (uint8_t *)&v15, 0xCu);

    }
    objc_autoreleasePoolPop(v10);
    objc_msgSend(MEMORY[0x24BDBCF20], "set");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (NSSet *)v9;
}

- (id)simpleLabelForAccessCode:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  HMDAccessCodeDataManager *v10;
  NSObject *v11;
  void *v12;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDAccessCodeDataManager context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "home");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "labelsByAccessCode");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = (void *)MEMORY[0x227676638]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543362;
      v15 = v12;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_ERROR, "%{public}@Cannot find access code with simple label because home reference was nil", (uint8_t *)&v14, 0xCu);

    }
    objc_autoreleasePoolPop(v9);
    v8 = 0;
  }

  return v8;
}

- (id)userUUIDForAccessCode:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  HMDAccessCodeDataManager *v11;
  NSObject *v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDAccessCodeDataManager context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "home");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "users");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __50__HMDAccessCodeDataManager_userUUIDForAccessCode___block_invoke;
    v15[3] = &unk_24E799728;
    v16 = v4;
    objc_msgSend(v7, "na_firstObjectPassingTest:", v15);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "uuid");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = (void *)MEMORY[0x227676638]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v18 = v13;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_ERROR, "%{public}@Cannot find access code with simple label because home reference was nil", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v10);
    v9 = 0;
  }

  return v9;
}

- (NSSet)accessCodeValuesWithUserLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  HMDAccessCodeDataManager *v10;
  NSObject *v11;
  void *v12;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  -[HMDAccessCodeDataManager context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = (void *)MEMORY[0x24BDBCF20];
    objc_msgSend(v4, "users");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "na_map:", &__block_literal_global_31_190114);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = (void *)MEMORY[0x227676638]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543362;
      v15 = v12;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_ERROR, "%{public}@Cannot fetch user access code values with simple labels because home reference was nil", (uint8_t *)&v14, 0xCu);

    }
    objc_autoreleasePoolPop(v9);
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", MEMORY[0x24BDBD1A8]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (NSSet *)v8;
}

- (NSSet)accessCodeValuesWithRemovedUserInfo
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  HMDAccessCodeDataManager *v11;
  NSObject *v12;
  void *v13;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  -[HMDAccessCodeDataManager context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = (void *)MEMORY[0x24BDBCF20];
    objc_msgSend(v4, "removedUserInfoByAccessCode");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "allKeys");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "na_map:", &__block_literal_global_33_190110);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setWithArray:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = (void *)MEMORY[0x227676638]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543362;
      v16 = v13;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_ERROR, "%{public}@Cannot find access code values with removed user info because home reference was nil", (uint8_t *)&v15, 0xCu);

    }
    objc_autoreleasePoolPop(v10);
    objc_msgSend(MEMORY[0x24BDBCF20], "set");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (NSSet *)v9;
}

- (id)addOrUpdateUserAccessCodeModel:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  HMDAccessCodeDataManager *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  HMDAccessCodeDataManager *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(uint64_t, void *);
  void *v32;
  HMDAccessCodeDataManager *v33;
  id v34;
  uint8_t buf[4];
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDAccessCodeDataManager context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  v7 = (void *)MEMORY[0x227676638]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v36 = v10;
    _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Adding or updating HMDUserAccessCodeModel", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v7);
  -[HMDAccessCodeDataManager context](v8, "context");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "home");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "backingStore");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v14 = objc_alloc_init(MEMORY[0x24BE6B608]);
    +[HMDBackingStoreTransactionOptions defaultXPCOptions](HMDBackingStoreTransactionOptions, "defaultXPCOptions");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "transaction:options:", CFSTR("Update HMDUserAccessCodeModel"), v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "add:", v4);
    v29 = MEMORY[0x24BDAC760];
    v30 = 3221225472;
    v31 = __59__HMDAccessCodeDataManager_addOrUpdateUserAccessCodeModel___block_invoke;
    v32 = &unk_24E79BCC8;
    v33 = v8;
    v34 = v14;
    v17 = v14;
    objc_msgSend(v16, "run:", &v29);
    v18 = (void *)MEMORY[0x24BE6B628];
    -[HMDAccessCodeDataManager context](v8, "context", v29, v30, v31, v32, v33);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "workQueue");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "schedulerWithDispatchQueue:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "reschedule:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v23 = (void *)MEMORY[0x227676638]();
    v24 = v8;
    HMFGetOSLogHandle();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v36 = v26;
      _os_log_impl(&dword_2218F0000, v25, OS_LOG_TYPE_ERROR, "%{public}@Cannot add or update HMDUserAccessCodeModel because self.context.home.backingStore is nil", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v23);
    v27 = (void *)MEMORY[0x24BE6B608];
    objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "futureWithError:", v16);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v22;
}

- (id)removeUserAccessCodeModel:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  HMDAccessCodeDataManager *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  HMDAccessCodeDataManager *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  uint64_t v30;
  uint64_t v31;
  void (*v32)(uint64_t, void *);
  void *v33;
  HMDAccessCodeDataManager *v34;
  id v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDAccessCodeDataManager context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  v7 = (void *)MEMORY[0x227676638]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "changedByUserUUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v37 = v10;
    v38 = 2112;
    v39 = v11;
    _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Removing HMDUserAccessCodeModel, removedByUserUUID: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v7);
  -[HMDAccessCodeDataManager context](v8, "context");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "home");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "backingStore");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    v15 = objc_alloc_init(MEMORY[0x24BE6B608]);
    +[HMDBackingStoreTransactionOptions defaultXPCOptions](HMDBackingStoreTransactionOptions, "defaultXPCOptions");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "transaction:options:", CFSTR("Remove HMDUserAccessCodeModel"), v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setObjectChangeType:", 3);
    objc_msgSend(v17, "add:", v4);
    v30 = MEMORY[0x24BDAC760];
    v31 = 3221225472;
    v32 = __54__HMDAccessCodeDataManager_removeUserAccessCodeModel___block_invoke;
    v33 = &unk_24E79BCC8;
    v34 = v8;
    v35 = v15;
    v18 = v15;
    objc_msgSend(v17, "run:", &v30);
    v19 = (void *)MEMORY[0x24BE6B628];
    -[HMDAccessCodeDataManager context](v8, "context", v30, v31, v32, v33, v34);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "workQueue");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "schedulerWithDispatchQueue:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "reschedule:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v24 = (void *)MEMORY[0x227676638]();
    v25 = v8;
    HMFGetOSLogHandle();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v37 = v27;
      _os_log_impl(&dword_2218F0000, v26, OS_LOG_TYPE_ERROR, "%{public}@Cannot remove HMDUserAccessCodeModel because self.context.home.backingStore is nil", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v24);
    v28 = (void *)MEMORY[0x24BE6B608];
    objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "futureWithError:", v17);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v23;
}

- (id)addOrUpdateHomeAccessCodeModel:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  HMDAccessCodeDataManager *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  HMDAccessCodeDataManager *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(uint64_t, void *);
  void *v32;
  HMDAccessCodeDataManager *v33;
  id v34;
  uint8_t buf[4];
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDAccessCodeDataManager context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  v7 = (void *)MEMORY[0x227676638]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v36 = v10;
    _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Adding or updating HMDHomeAccessCodeModel", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v7);
  -[HMDAccessCodeDataManager context](v8, "context");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "home");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "backingStore");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v14 = objc_alloc_init(MEMORY[0x24BE6B608]);
    +[HMDBackingStoreTransactionOptions defaultXPCOptions](HMDBackingStoreTransactionOptions, "defaultXPCOptions");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "transaction:options:", CFSTR("Update HMDHomeAccessCodeModel"), v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "add:", v4);
    v29 = MEMORY[0x24BDAC760];
    v30 = 3221225472;
    v31 = __59__HMDAccessCodeDataManager_addOrUpdateHomeAccessCodeModel___block_invoke;
    v32 = &unk_24E79BCC8;
    v33 = v8;
    v34 = v14;
    v17 = v14;
    objc_msgSend(v16, "run:", &v29);
    v18 = (void *)MEMORY[0x24BE6B628];
    -[HMDAccessCodeDataManager context](v8, "context", v29, v30, v31, v32, v33);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "workQueue");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "schedulerWithDispatchQueue:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "reschedule:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v23 = (void *)MEMORY[0x227676638]();
    v24 = v8;
    HMFGetOSLogHandle();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v36 = v26;
      _os_log_impl(&dword_2218F0000, v25, OS_LOG_TYPE_ERROR, "%{public}@Cannot add or update HMDHomeAccessCodeModel, because self.context.home.backingStore is nil", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v23);
    v27 = (void *)MEMORY[0x24BE6B608];
    objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "futureWithError:", v16);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v22;
}

- (id)removeHomeAccessCodeModel:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  HMDAccessCodeDataManager *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  HMDAccessCodeDataManager *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(uint64_t, void *);
  void *v32;
  HMDAccessCodeDataManager *v33;
  id v34;
  uint8_t buf[4];
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDAccessCodeDataManager context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  v7 = (void *)MEMORY[0x227676638]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v36 = v10;
    _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Removing HMDHomeAccessCodeModel", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v7);
  -[HMDAccessCodeDataManager context](v8, "context");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "home");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "backingStore");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v14 = objc_alloc_init(MEMORY[0x24BE6B608]);
    +[HMDBackingStoreTransactionOptions defaultXPCOptions](HMDBackingStoreTransactionOptions, "defaultXPCOptions");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "transaction:options:", CFSTR("Remove HMDHomeAccessCodeModel"), v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setObjectChangeType:", 3);
    objc_msgSend(v16, "add:", v4);
    v29 = MEMORY[0x24BDAC760];
    v30 = 3221225472;
    v31 = __54__HMDAccessCodeDataManager_removeHomeAccessCodeModel___block_invoke;
    v32 = &unk_24E79BCC8;
    v33 = v8;
    v34 = v14;
    v17 = v14;
    objc_msgSend(v16, "run:", &v29);
    v18 = (void *)MEMORY[0x24BE6B628];
    -[HMDAccessCodeDataManager context](v8, "context", v29, v30, v31, v32, v33);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "workQueue");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "schedulerWithDispatchQueue:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "reschedule:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v23 = (void *)MEMORY[0x227676638]();
    v24 = v8;
    HMFGetOSLogHandle();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v36 = v26;
      _os_log_impl(&dword_2218F0000, v25, OS_LOG_TYPE_ERROR, "%{public}@Cannot remove HMDHomeAccessCodeModel because self.context.home.backingStore is nil", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v23);
    v27 = (void *)MEMORY[0x24BE6B608];
    objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "futureWithError:", v16);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v22;
}

- (id)saveRemovedUserAccessCode:(id)a3 withRemovedUserInfo:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  HMDAccessCodeDataManager *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  HMDRemovedUserAccessCodeModel *v16;
  void *v17;
  HMDRemovedUserAccessCodeModel *v18;
  uint64_t v19;
  void *v20;
  HMDAccessCodeDataManager *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  int v27;
  void *v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[HMDAccessCodeDataManager context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "workQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v9);

  v10 = (void *)MEMORY[0x227676638]();
  v11 = self;
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 138543618;
    v28 = v13;
    v29 = 2112;
    v30 = v7;
    _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@Saving removed user access code with removed user info: %@", (uint8_t *)&v27, 0x16u);

  }
  objc_autoreleasePoolPop(v10);
  -[HMDAccessCodeDataManager context](v11, "context");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "home");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    v16 = [HMDRemovedUserAccessCodeModel alloc];
    objc_msgSend(v15, "uuid");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[HMDRemovedUserAccessCodeModel initWithRemovedUserInfo:accessCode:homeUUID:](v16, "initWithRemovedUserInfo:accessCode:homeUUID:", v7, v6, v17);

    -[HMDAccessCodeDataManager addOrUpdateHMDRemovedUserAccessCodeModel:](v11, "addOrUpdateHMDRemovedUserAccessCodeModel:", v18);
    v19 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20 = (void *)MEMORY[0x227676638]();
    v21 = v11;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 138543362;
      v28 = v23;
      _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_ERROR, "%{public}@Not saving removed user access code because home reference was nil", (uint8_t *)&v27, 0xCu);

    }
    objc_autoreleasePoolPop(v20);
    v24 = (void *)MEMORY[0x24BE6B608];
    objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 15);
    v18 = (HMDRemovedUserAccessCodeModel *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "futureWithError:", v18);
    v19 = objc_claimAutoreleasedReturnValue();
  }
  v25 = (void *)v19;

  return v25;
}

- (id)removeHMDRemovedUserAccessCodeWithCode:(id)a3 removedUserInfo:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  HMDAccessCodeDataManager *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  HMDRemovedUserAccessCodeModel *v16;
  void *v17;
  HMDRemovedUserAccessCodeModel *v18;
  uint64_t v19;
  void *v20;
  HMDAccessCodeDataManager *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  int v27;
  void *v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[HMDAccessCodeDataManager context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "workQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v9);

  v10 = (void *)MEMORY[0x227676638]();
  v11 = self;
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 138543618;
    v28 = v13;
    v29 = 2112;
    v30 = v7;
    _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@Removing HMDRemovedUserAccessCode with HMRemovedUserInfo: %@", (uint8_t *)&v27, 0x16u);

  }
  objc_autoreleasePoolPop(v10);
  -[HMDAccessCodeDataManager context](v11, "context");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "home");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    v16 = [HMDRemovedUserAccessCodeModel alloc];
    objc_msgSend(v15, "uuid");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[HMDRemovedUserAccessCodeModel initWithRemovedUserInfo:accessCode:homeUUID:](v16, "initWithRemovedUserInfo:accessCode:homeUUID:", v7, v6, v17);

    -[HMDAccessCodeDataManager removeHMDRemovedUserAccessCodeModel:](v11, "removeHMDRemovedUserAccessCodeModel:", v18);
    v19 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20 = (void *)MEMORY[0x227676638]();
    v21 = v11;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 138543362;
      v28 = v23;
      _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_ERROR, "%{public}@Not removing HMDRemovedUserAccessCode because home reference was nil", (uint8_t *)&v27, 0xCu);

    }
    objc_autoreleasePoolPop(v20);
    v24 = (void *)MEMORY[0x24BE6B608];
    objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 15);
    v18 = (HMDRemovedUserAccessCodeModel *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "futureWithError:", v18);
    v19 = objc_claimAutoreleasedReturnValue();
  }
  v25 = (void *)v19;

  return v25;
}

- (id)addOrUpdateHMDRemovedUserAccessCodeModel:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  HMDAccessCodeDataManager *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  HMDAccessCodeDataManager *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(uint64_t, void *);
  void *v32;
  HMDAccessCodeDataManager *v33;
  id v34;
  uint8_t buf[4];
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDAccessCodeDataManager context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  v7 = (void *)MEMORY[0x227676638]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v36 = v10;
    _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Adding or updating HMDRemovedUserAccessCodeModel", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v7);
  -[HMDAccessCodeDataManager context](v8, "context");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "home");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "backingStore");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v14 = objc_alloc_init(MEMORY[0x24BE6B608]);
    +[HMDBackingStoreTransactionOptions defaultXPCOptions](HMDBackingStoreTransactionOptions, "defaultXPCOptions");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "transaction:options:", CFSTR("Update HMDRemovedUserAccessCodeModel"), v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "add:", v4);
    v29 = MEMORY[0x24BDAC760];
    v30 = 3221225472;
    v31 = __69__HMDAccessCodeDataManager_addOrUpdateHMDRemovedUserAccessCodeModel___block_invoke;
    v32 = &unk_24E79BCC8;
    v33 = v8;
    v34 = v14;
    v17 = v14;
    objc_msgSend(v16, "run:", &v29);
    v18 = (void *)MEMORY[0x24BE6B628];
    -[HMDAccessCodeDataManager context](v8, "context", v29, v30, v31, v32, v33);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "workQueue");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "schedulerWithDispatchQueue:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "reschedule:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v23 = (void *)MEMORY[0x227676638]();
    v24 = v8;
    HMFGetOSLogHandle();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v36 = v26;
      _os_log_impl(&dword_2218F0000, v25, OS_LOG_TYPE_ERROR, "%{public}@Cannot add or update HMDRemovedUserAccessCodeModel, because self.context.home.backingStore is nil", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v23);
    v27 = (void *)MEMORY[0x24BE6B608];
    objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "futureWithError:", v16);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v22;
}

- (id)removeHMDRemovedUserAccessCodeModel:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  HMDAccessCodeDataManager *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  HMDAccessCodeDataManager *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(uint64_t, void *);
  void *v32;
  HMDAccessCodeDataManager *v33;
  id v34;
  uint8_t buf[4];
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDAccessCodeDataManager context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  v7 = (void *)MEMORY[0x227676638]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v36 = v10;
    _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Removing HMDRemovedUserAccessCodeModel", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v7);
  -[HMDAccessCodeDataManager context](v8, "context");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "home");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "backingStore");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v14 = objc_alloc_init(MEMORY[0x24BE6B608]);
    +[HMDBackingStoreTransactionOptions defaultXPCOptions](HMDBackingStoreTransactionOptions, "defaultXPCOptions");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "transaction:options:", CFSTR("Remove HMDRemovedUserAccessCodeModel"), v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setObjectChangeType:", 3);
    objc_msgSend(v16, "add:", v4);
    v29 = MEMORY[0x24BDAC760];
    v30 = 3221225472;
    v31 = __64__HMDAccessCodeDataManager_removeHMDRemovedUserAccessCodeModel___block_invoke;
    v32 = &unk_24E79BCC8;
    v33 = v8;
    v34 = v14;
    v17 = v14;
    objc_msgSend(v16, "run:", &v29);
    v18 = (void *)MEMORY[0x24BE6B628];
    -[HMDAccessCodeDataManager context](v8, "context", v29, v30, v31, v32, v33);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "workQueue");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "schedulerWithDispatchQueue:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "reschedule:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v23 = (void *)MEMORY[0x227676638]();
    v24 = v8;
    HMFGetOSLogHandle();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v36 = v26;
      _os_log_impl(&dword_2218F0000, v25, OS_LOG_TYPE_ERROR, "%{public}@Cannot remove HMDRemovedUserAccessCodeModel because self.context.home.backingStore is nil", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v23);
    v27 = (void *)MEMORY[0x24BE6B608];
    objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "futureWithError:", v16);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v22;
}

- (void)handleUpdatedUserAccessCodeModel:(id)a3 forUser:(id)a4 message:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  HMDAccessCodeDataManager *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  HMDAccessCodeDataManager *v23;
  NSObject *v24;
  _BOOL4 v25;
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
  void *v37;
  HMDAccessCodeDataManager *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  uint8_t buf[4];
  void *v56;
  __int16 v57;
  id v58;
  __int16 v59;
  void *v60;
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x227676638]();
  v12 = self;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "changedByUserUUID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v56 = v14;
    v57 = 2112;
    v58 = v9;
    v59 = 2112;
    v60 = v15;
    _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@HMDUserAccessCodeModel was updated. Updating value on HMDUser: %@ changedByUserUUID: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v11);
  -[HMDAccessCodeDataManager delegate](v12, "delegate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "accessCode");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "value");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v17, "isEqualToString:", v18);

  if (v19)
  {
    objc_msgSend(v10, "respondWithSuccess");
  }
  else
  {
    objc_msgSend(v9, "accessCode");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      objc_msgSend(v8, "value");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      v22 = (void *)MEMORY[0x227676638]();
      v23 = v12;
      HMFGetOSLogHandle();
      v24 = objc_claimAutoreleasedReturnValue();
      v25 = os_log_type_enabled(v24, OS_LOG_TYPE_INFO);
      if (v21)
      {
        if (v25)
        {
          HMFGetLogIdentifier();
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "changedByUserUUID");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v56 = v26;
          v57 = 2112;
          v58 = v9;
          v59 = 2112;
          v60 = v27;
          _os_log_impl(&dword_2218F0000, v24, OS_LOG_TYPE_INFO, "%{public}@HMDUserAccessCodeModel value was updated on HMDUser: %@ changedByUserUUID: %@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v22);
        objc_msgSend(v8, "value");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setAccessCode:", v28);

        objc_msgSend(v8, "changedByUserUUID");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setAccessCodeChangedByUserUUID:", v29);

        objc_msgSend(v10, "transactionResult");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "markChanged");

        objc_msgSend(v10, "respondWithSuccess");
        v31 = (void *)MEMORY[0x24BDD76B8];
        objc_msgSend(v8, "value");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "uuid");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "homeAccessCodeValueWithStringValue:userUUID:", v32, v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v53 = v34;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v53, 1);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "changedByUserUUID");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "accessCodeDataManager:didUpdateHomeAccessCodes:changedByUserUUID:", v23, v35, v36);
      }
      else
      {
        if (v25)
        {
          HMFGetLogIdentifier();
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "changedByUserUUID");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v56 = v46;
          v57 = 2112;
          v58 = v9;
          v59 = 2112;
          v60 = v47;
          _os_log_impl(&dword_2218F0000, v24, OS_LOG_TYPE_INFO, "%{public}@HMDUserAccessCodeModel value was removed on HMDUser: %@ removedByUserUUID: %@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v22);
        objc_msgSend(v8, "value");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setAccessCode:", v48);

        objc_msgSend(v8, "changedByUserUUID");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setAccessCodeChangedByUserUUID:", v49);

        objc_msgSend(v10, "transactionResult");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "markChanged");

        objc_msgSend(v10, "respondWithSuccess");
        v51 = (void *)MEMORY[0x24BDD76B8];
        objc_msgSend(v8, "value");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "uuid");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "homeAccessCodeValueWithStringValue:userUUID:", v32, v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = v34;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v52, 1);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "changedByUserUUID");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "accessCodeDataManager:didRemoveHomeAccessCodes:removedByUserUUID:", v23, v35, v36);
      }
    }
    else
    {
      v37 = (void *)MEMORY[0x227676638]();
      v38 = v12;
      HMFGetOSLogHandle();
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "changedByUserUUID");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v56 = v40;
        v57 = 2112;
        v58 = v9;
        v59 = 2112;
        v60 = v41;
        _os_log_impl(&dword_2218F0000, v39, OS_LOG_TYPE_INFO, "%{public}@New HMDUserAccessCodeModel was added. Setting value on HMDUser: %@ changedByUserUUID: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v37);
      objc_msgSend(v8, "value");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setAccessCode:", v42);

      objc_msgSend(v8, "changedByUserUUID");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setAccessCodeChangedByUserUUID:", v43);

      objc_msgSend(v10, "transactionResult");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "markChanged");

      objc_msgSend(v10, "respondWithSuccess");
      v45 = (void *)MEMORY[0x24BDD76B8];
      objc_msgSend(v8, "value");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "uuid");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "homeAccessCodeValueWithStringValue:userUUID:", v32, v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = v34;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v54, 1);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "changedByUserUUID");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "accessCodeDataManager:didAddHomeAccessCodes:addedByUserUUID:", v38, v35, v36);
    }

  }
}

- (void)handleUpdatedHomeAccessCodeModel:(id)a3 message:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDAccessCodeDataManager *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  char v25;
  void *v26;
  HMDAccessCodeDataManager *v27;
  NSObject *v28;
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
  void *v40;
  void *v41;
  void *v42;
  HMDAccessCodeDataManager *v43;
  NSObject *v44;
  void *v45;
  const char *v46;
  void *v47;
  HMDAccessCodeDataManager *v48;
  NSObject *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  uint8_t buf[4];
  void *v66;
  __int16 v67;
  void *v68;
  uint64_t v69;

  v69 = *MEMORY[0x24BDAC8D0];
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
    *(_DWORD *)buf = 138543362;
    v66 = v11;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Handling updated HMDHomeAccessCodeModel", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v8);
  -[HMDAccessCodeDataManager context](v9, "context");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "home");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    v42 = (void *)MEMORY[0x227676638]();
    v43 = v9;
    HMFGetOSLogHandle();
    v44 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v66 = v45;
      v46 = "%{public}@Not handling updated HomeAccessCodeModel because home reference was nil";
      goto LABEL_16;
    }
LABEL_17:

    objc_autoreleasePoolPop(v42);
    objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 11);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "respondWithError:", v17);
    goto LABEL_18;
  }
  objc_msgSend(v6, "value");
  v14 = objc_claimAutoreleasedReturnValue();
  if (!v14
    || (v15 = (void *)v14,
        objc_msgSend(v6, "label"),
        v16 = (void *)objc_claimAutoreleasedReturnValue(),
        v16,
        v15,
        !v16))
  {
    v42 = (void *)MEMORY[0x227676638]();
    v43 = v9;
    HMFGetOSLogHandle();
    v44 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v66 = v45;
      v46 = "%{public}@Home access code model has a nil property but should not";
LABEL_16:
      _os_log_impl(&dword_2218F0000, v44, OS_LOG_TYPE_ERROR, v46, buf, 0xCu);

      goto LABEL_17;
    }
    goto LABEL_17;
  }
  -[HMDAccessCodeDataManager delegate](v9, "delegate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "labelsByAccessCode");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "value");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "objectForKeyedSubscript:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    objc_msgSend(v13, "labelsByAccessCode");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "value");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "objectForKeyedSubscript:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "label");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v23, "isEqualToString:", v24);

    if ((v25 & 1) == 0)
    {
      v26 = (void *)MEMORY[0x227676638]();
      v27 = v9;
      HMFGetOSLogHandle();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v66 = v29;
        v67 = 2112;
        v68 = v13;
        _os_log_impl(&dword_2218F0000, v28, OS_LOG_TYPE_INFO, "%{public}@HMDHomeAccessCodeModel label was updated on HMDHome: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v26);
      objc_msgSend(v6, "label");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "labelsByAccessCode");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "value");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setObject:forKeyedSubscript:", v30, v32);

      objc_msgSend(v6, "hh2ModelID");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "labelIdentifiersByAccessCode");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "value");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setObject:forKeyedSubscript:", v33, v35);

      objc_msgSend(v7, "transactionResult");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "markChanged");

      v37 = (void *)MEMORY[0x24BDD76B8];
      objc_msgSend(v6, "value");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "label");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "homeAccessCodeValueWithStringValue:label:", v38, v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = v40;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v63, 1);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "accessCodeDataManager:didUpdateHomeAccessCodes:changedByUserUUID:", v27, v41, 0);

    }
    objc_msgSend(v7, "respondWithSuccess");
  }
  else
  {
    v47 = (void *)MEMORY[0x227676638]();
    v48 = v9;
    HMFGetOSLogHandle();
    v49 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v66 = v50;
      v67 = 2112;
      v68 = v13;
      _os_log_impl(&dword_2218F0000, v49, OS_LOG_TYPE_INFO, "%{public}@New HMDHomeAccessCodeModel was added. Setting label for value on HMDHome: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v47);
    objc_msgSend(v6, "label");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "labelsByAccessCode");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "value");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "setObject:forKeyedSubscript:", v51, v53);

    objc_msgSend(v6, "hh2ModelID");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "labelIdentifiersByAccessCode");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "value");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "setObject:forKeyedSubscript:", v54, v56);

    objc_msgSend(v7, "transactionResult");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "markChanged");

    objc_msgSend(v7, "respondWithSuccess");
    v58 = (void *)MEMORY[0x24BDD76B8];
    objc_msgSend(v6, "value");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "label");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "homeAccessCodeValueWithStringValue:label:", v59, v60);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = v61;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v64, 1);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "accessCodeDataManager:didAddHomeAccessCodes:addedByUserUUID:", v48, v62, 0);

  }
LABEL_18:

}

- (void)handleRemovedUserAccessCodeModel:(id)a3 forUser:(id)a4 message:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  HMDAccessCodeDataManager *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x227676638]();
  v12 = self;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v26 = v14;
    v27 = 2112;
    v28 = v9;
    _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@HMDUserAccessCodeModel was removed. Removing value on HMDUser: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v11);
  objc_msgSend(v9, "accessCode");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAccessCode:", 0);
  objc_msgSend(v8, "changedByUserUUID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAccessCodeChangedByUserUUID:", v16);

  objc_msgSend(v10, "transactionResult");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "markChanged");

  objc_msgSend(v10, "respondWithSuccess");
  -[HMDAccessCodeDataManager delegate](v12, "delegate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)MEMORY[0x24BDD76B8];
  objc_msgSend(v9, "uuid");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "homeAccessCodeValueWithStringValue:userUUID:", v15, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v21;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v24, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "changedByUserUUID");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "accessCodeDataManager:didRemoveHomeAccessCodes:removedByUserUUID:", v12, v22, v23);

}

- (void)handleRemovedHomeAccessCodeModel:(id)a3 message:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDAccessCodeDataManager *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  HMDAccessCodeDataManager *v16;
  NSObject *v17;
  _BOOL4 v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  HMDAccessCodeDataManager *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
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
    *(_DWORD *)buf = 138543362;
    v35 = v11;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Handling removed HMDHomeAccessCodeModel", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v8);
  -[HMDAccessCodeDataManager context](v9, "context");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "home");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    +[HMDAccessCodeDataManager _accessCodeInHome:forHomeAccessCodeModel:](HMDAccessCodeDataManager, "_accessCodeInHome:forHomeAccessCodeModel:", v13, v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)MEMORY[0x227676638]();
    v16 = v9;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = os_log_type_enabled(v17, OS_LOG_TYPE_INFO);
    if (v14)
    {
      if (v18)
      {
        HMFGetLogIdentifier();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v35 = v19;
        v36 = 2112;
        v37 = v13;
        _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_INFO, "%{public}@HMDHomeAccessCodeModel was removed. Removing value with label on HMDHome: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v15);
      objc_msgSend(v13, "labelsByAccessCode");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "removeObjectForKey:", v14);

      objc_msgSend(v13, "labelIdentifiersByAccessCode");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "removeObjectForKey:", v14);

      objc_msgSend(v7, "transactionResult");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "markChanged");

      objc_msgSend(v7, "respondWithSuccess");
      -[HMDAccessCodeDataManager delegate](v16, "delegate");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (void *)MEMORY[0x24BDD76B8];
      objc_msgSend(v6, "label");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "homeAccessCodeValueWithStringValue:label:", v14, v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = v26;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v33, 1);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "accessCodeDataManager:didRemoveHomeAccessCodes:removedByUserUUID:", v16, v27, 0);

    }
    else
    {
      if (v18)
      {
        HMFGetLogIdentifier();
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v35 = v32;
        _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_INFO, "%{public}@Did not find an access code for this model on the home, so we have nothing to remove.", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v15);
      objc_msgSend(v7, "respondWithSuccess");
      v14 = 0;
    }
  }
  else
  {
    v28 = (void *)MEMORY[0x227676638]();
    v29 = v9;
    HMFGetOSLogHandle();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v35 = v31;
      _os_log_impl(&dword_2218F0000, v30, OS_LOG_TYPE_ERROR, "%{public}@Not handling updated HomeAccessCodeModel because home reference was nil", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v28);
    objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "respondWithError:", v14);
  }

}

- (void)handleUpdatedHMDRemovedUserAccessCodeModel:(id)a3 message:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDAccessCodeDataManager *v9;
  NSObject *v10;
  void *v11;
  void *v12;
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
  char v23;
  void *v24;
  HMDAccessCodeDataManager *v25;
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
  HMDAccessCodeDataManager *v38;
  NSObject *v39;
  void *v40;
  const char *v41;
  void *v42;
  HMDAccessCodeDataManager *v43;
  NSObject *v44;
  void *v45;
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
  uint8_t buf[4];
  void *v58;
  __int16 v59;
  void *v60;
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
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
    *(_DWORD *)buf = 138543362;
    v58 = v11;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Handling updated HMDHomeAccessCodeModel", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v8);
  -[HMDAccessCodeDataManager context](v9, "context");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "home");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    v37 = (void *)MEMORY[0x227676638]();
    v38 = v9;
    HMFGetOSLogHandle();
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v58 = v40;
      v41 = "%{public}@Not handling updated HomeAccessCodeModel because home reference was nil";
LABEL_15:
      _os_log_impl(&dword_2218F0000, v39, OS_LOG_TYPE_ERROR, v41, buf, 0xCu);

    }
LABEL_16:

    objc_autoreleasePoolPop(v37);
    objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 11);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "respondWithError:", v15);
    goto LABEL_17;
  }
  objc_msgSend(v6, "removedUserInfo");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    v37 = (void *)MEMORY[0x227676638]();
    v38 = v9;
    HMFGetOSLogHandle();
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v58 = v40;
      v41 = "%{public}@HMDRemovedUserAccessCodeModel has a nil property but should not";
      goto LABEL_15;
    }
    goto LABEL_16;
  }
  -[HMDAccessCodeDataManager delegate](v9, "delegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "removedUserInfoByAccessCode");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "accessCode");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKeyedSubscript:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    objc_msgSend(v13, "removedUserInfoByAccessCode");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "accessCode");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectForKeyedSubscript:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removedUserInfo");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v21, "isEqual:", v22);

    if ((v23 & 1) == 0)
    {
      v24 = (void *)MEMORY[0x227676638]();
      v25 = v9;
      HMFGetOSLogHandle();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v58 = v27;
        v59 = 2112;
        v60 = v13;
        _os_log_impl(&dword_2218F0000, v26, OS_LOG_TYPE_INFO, "%{public}@HMDRemovedUserAccessCodeModel was updated on HMDHome: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v24);
      objc_msgSend(v6, "removedUserInfo");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "removedUserInfoByAccessCode");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "accessCode");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setObject:forKeyedSubscript:", v28, v30);

      objc_msgSend(v7, "transactionResult");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "markChanged");

      v32 = (void *)MEMORY[0x24BDD76B8];
      objc_msgSend(v6, "accessCode");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "removedUserInfo");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "homeAccessCodeValueWithStringValue:removedUserInfo:", v33, v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = v35;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v55, 1);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "accessCodeDataManager:didUpdateHomeAccessCodes:changedByUserUUID:", v25, v36, 0);

    }
    objc_msgSend(v7, "respondWithSuccess");
  }
  else
  {
    v42 = (void *)MEMORY[0x227676638]();
    v43 = v9;
    HMFGetOSLogHandle();
    v44 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v58 = v45;
      v59 = 2112;
      v60 = v13;
      _os_log_impl(&dword_2218F0000, v44, OS_LOG_TYPE_INFO, "%{public}@New HMDRemovedUserAccessCodeModel was added. Updating values on HMDHome: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v42);
    objc_msgSend(v6, "removedUserInfo");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "removedUserInfoByAccessCode");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "accessCode");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "setObject:forKeyedSubscript:", v46, v48);

    objc_msgSend(v7, "transactionResult");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "markChanged");

    objc_msgSend(v7, "respondWithSuccess");
    v50 = (void *)MEMORY[0x24BDD76B8];
    objc_msgSend(v6, "accessCode");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removedUserInfo");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "homeAccessCodeValueWithStringValue:removedUserInfo:", v51, v52);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = v53;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v56, 1);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "accessCodeDataManager:didAddHomeAccessCodes:addedByUserUUID:", v43, v54, 0);

  }
LABEL_17:

}

- (void)handleRemovedHMDRemovedUserAccessCodeModel:(id)a3 message:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDAccessCodeDataManager *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  HMDAccessCodeDataManager *v16;
  NSObject *v17;
  _BOOL4 v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  HMDAccessCodeDataManager *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
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
    *(_DWORD *)buf = 138543362;
    v35 = v11;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Handling removed HMDHomeAccessCodeModel", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v8);
  -[HMDAccessCodeDataManager context](v9, "context");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "home");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    +[HMDAccessCodeDataManager _accessCodeInHome:forRemovedUserAccessCodeModel:](HMDAccessCodeDataManager, "_accessCodeInHome:forRemovedUserAccessCodeModel:", v13, v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)MEMORY[0x227676638]();
    v16 = v9;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = os_log_type_enabled(v17, OS_LOG_TYPE_INFO);
    if (v14)
    {
      if (v18)
      {
        HMFGetLogIdentifier();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v35 = v19;
        v36 = 2112;
        v37 = v13;
        _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_INFO, "%{public}@HMDRemovedUserAccessCodeModel was removed. Removing from HMDHome: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v15);
      objc_msgSend(v13, "removedUserInfoByAccessCode");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "removeObjectForKey:", v14);

      objc_msgSend(v7, "transactionResult");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "markChanged");

      objc_msgSend(v7, "respondWithSuccess");
      -[HMDAccessCodeDataManager delegate](v16, "delegate");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = (void *)MEMORY[0x24BDD76B8];
      objc_msgSend(v6, "accessCode");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "removedUserInfo");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "homeAccessCodeValueWithStringValue:removedUserInfo:", v24, v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = v26;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v33, 1);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "accessCodeDataManager:didRemoveHomeAccessCodes:removedByUserUUID:", v16, v27, 0);

    }
    else
    {
      if (v18)
      {
        HMFGetLogIdentifier();
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v35 = v32;
        _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_INFO, "%{public}@Did not find an access code for this model on the home, so we have nothing to remove.", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v15);
      objc_msgSend(v7, "respondWithSuccess");
      v14 = 0;
    }
  }
  else
  {
    v28 = (void *)MEMORY[0x227676638]();
    v29 = v9;
    HMFGetOSLogHandle();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v35 = v31;
      _os_log_impl(&dword_2218F0000, v30, OS_LOG_TYPE_ERROR, "%{public}@Not handling updated HomeAccessCodeModel because home reference was nil", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v28);
    objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "respondWithError:", v14);
  }

}

- (NSArray)cachedAccessCodes
{
  void *v2;
  void *v3;
  void *v4;

  -[HMDAccessCodeDataManager context](self, "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessoriesSupportingAccessCodes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "na_map:", &__block_literal_global_51_190035);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (id)cachedAccessCodeForIdentifier:(id)a3 accessoryUUID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  HMDAccessCodeDataManager *v14;
  NSObject *v15;
  void *v16;
  int v18;
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[HMDAccessCodeDataManager context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "hapAccessoryWithUUID:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v9, "accessCodeCache");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "accessCodeValue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = (void *)MEMORY[0x227676638]();
    v14 = self;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543618;
      v19 = v16;
      v20 = 2112;
      v21 = v7;
      _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_ERROR, "%{public}@Failed to find hap accessory for cached access code with accessory UUID: %@", (uint8_t *)&v18, 0x16u);

    }
    objc_autoreleasePoolPop(v13);
    v12 = 0;
  }

  return v12;
}

- (void)updateCacheWithFetchResponses:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  _QWORD v10[5];
  _QWORD v11[5];

  v4 = MEMORY[0x24BDAC760];
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __58__HMDAccessCodeDataManager_updateCacheWithFetchResponses___block_invoke;
  v11[3] = &unk_24E78F638;
  v11[4] = self;
  v5 = a3;
  objc_msgSend(v5, "na_flatMap:", v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v4;
  v10[1] = 3221225472;
  v10[2] = __58__HMDAccessCodeDataManager_updateCacheWithFetchResponses___block_invoke_2;
  v10[3] = &unk_24E78F638;
  v10[4] = self;
  objc_msgSend(v5, "na_flatMap:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v4;
  v9[1] = 3221225472;
  v9[2] = __58__HMDAccessCodeDataManager_updateCacheWithFetchResponses___block_invoke_2_57;
  v9[3] = &unk_24E78F638;
  v9[4] = self;
  objc_msgSend(v5, "na_flatMap:", v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDAccessCodeDataManager updateCacheWithAddedAccessCodes:](self, "updateCacheWithAddedAccessCodes:", v6);
  -[HMDAccessCodeDataManager updateCacheWithUpdatedAccessCodes:](self, "updateCacheWithUpdatedAccessCodes:", v7);
  -[HMDAccessCodeDataManager updateCacheWithRemovedAccessCodes:](self, "updateCacheWithRemovedAccessCodes:", v8);

}

- (void)updateCacheWithAddedAccessCodes:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  HMDAccessCodeDataManager *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  id obj;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if ((objc_msgSend(v4, "hmf_isEmpty") & 1) == 0)
  {
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v24 = v4;
    obj = v4;
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v37, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v28;
      v25 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v28 != v7)
            objc_enumerationMutation(obj);
          v9 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
          -[HMDAccessCodeDataManager context](self, "context");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "accessoryUUID");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "hapAccessoryWithUUID:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          v13 = (void *)MEMORY[0x227676638]();
          v14 = self;
          HMFGetOSLogHandle();
          v15 = objc_claimAutoreleasedReturnValue();
          v16 = v15;
          if (v12)
          {
            if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "name");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v32 = v17;
              v33 = 2112;
              v34 = v18;
              v35 = 2112;
              v36 = v9;
              _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_INFO, "%{public}@Updating accessory: %@, with new access code: %@", buf, 0x20u);

              v7 = v25;
            }

            objc_autoreleasePoolPop(v13);
            objc_msgSend(v12, "accessCodeCache");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "uniqueIdentifier");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "setObject:forKeyedSubscript:", v9, v20);

          }
          else
          {
            if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v9, "accessoryUUID");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v32 = v21;
              v33 = 2112;
              v34 = v22;
              _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_ERROR, "%{public}@Failed to find hap accessory for accessory access code with accessory UUID: %@", buf, 0x16u);

              v7 = v25;
            }

            objc_autoreleasePoolPop(v13);
          }

        }
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v37, 16);
      }
      while (v6);
    }

    -[HMDAccessCodeDataManager delegate](self, "delegate");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "accessCodeDataManager:didAddAccessoryAccessCodes:", self, obj);

    v4 = v24;
  }

}

- (void)updateCacheWithUpdatedAccessCodes:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  HMDAccessCodeDataManager *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  id obj;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if ((objc_msgSend(v4, "hmf_isEmpty") & 1) == 0)
  {
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v24 = v4;
    obj = v4;
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v37, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v28;
      v25 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v28 != v7)
            objc_enumerationMutation(obj);
          v9 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
          -[HMDAccessCodeDataManager context](self, "context");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "accessoryUUID");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "hapAccessoryWithUUID:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          v13 = (void *)MEMORY[0x227676638]();
          v14 = self;
          HMFGetOSLogHandle();
          v15 = objc_claimAutoreleasedReturnValue();
          v16 = v15;
          if (v12)
          {
            if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "name");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v32 = v17;
              v33 = 2112;
              v34 = v18;
              v35 = 2112;
              v36 = v9;
              _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_INFO, "%{public}@Updating accessory: %@, with updated access code: %@", buf, 0x20u);

              v7 = v25;
            }

            objc_autoreleasePoolPop(v13);
            objc_msgSend(v12, "accessCodeCache");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "uniqueIdentifier");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "setObject:forKeyedSubscript:", v9, v20);

          }
          else
          {
            if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v9, "accessoryUUID");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v32 = v21;
              v33 = 2112;
              v34 = v22;
              _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_ERROR, "%{public}@Failed to find hap accessory for accessory access code with accessory UUID: %@", buf, 0x16u);

              v7 = v25;
            }

            objc_autoreleasePoolPop(v13);
          }

        }
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v37, 16);
      }
      while (v6);
    }

    -[HMDAccessCodeDataManager delegate](self, "delegate");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "accessCodeDataManager:didUpdateAccessoryAccessCodes:", self, obj);

    v4 = v24;
  }

}

- (void)updateCacheWithRemovedAccessCodes:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  HMDAccessCodeDataManager *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  id obj;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if ((objc_msgSend(v4, "hmf_isEmpty") & 1) == 0)
  {
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v24 = v4;
    obj = v4;
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v37, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v28;
      v25 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v28 != v7)
            objc_enumerationMutation(obj);
          v9 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
          -[HMDAccessCodeDataManager context](self, "context");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "accessoryUUID");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "hapAccessoryWithUUID:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          v13 = (void *)MEMORY[0x227676638]();
          v14 = self;
          HMFGetOSLogHandle();
          v15 = objc_claimAutoreleasedReturnValue();
          v16 = v15;
          if (v12)
          {
            if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "name");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v32 = v17;
              v33 = 2112;
              v34 = v18;
              v35 = 2112;
              v36 = v9;
              _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_INFO, "%{public}@Updating accessory: %@, with removed access code: %@", buf, 0x20u);

              v7 = v25;
            }

            objc_autoreleasePoolPop(v13);
            objc_msgSend(v12, "accessCodeCache");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "uniqueIdentifier");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "removeObjectForKey:", v20);

          }
          else
          {
            if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v9, "accessoryUUID");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v32 = v21;
              v33 = 2112;
              v34 = v22;
              _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_ERROR, "%{public}@Failed to find hap accessory for fetch response with accessory UUID: %@", buf, 0x16u);

              v7 = v25;
            }

            objc_autoreleasePoolPop(v13);
          }

        }
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v37, 16);
      }
      while (v6);
    }

    -[HMDAccessCodeDataManager delegate](self, "delegate");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "accessCodeDataManager:didRemoveAccessoryAccessCodes:", self, obj);

    v4 = v24;
  }

}

- (void)timerDidFire:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  void *v8;
  HMDAccessCodeDataManager *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDAccessCodeDataManager context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  -[HMDAccessCodeDataManager dataCleanUpTimer](self, "dataCleanUpTimer");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 == v4)
  {
    v8 = (void *)MEMORY[0x227676638]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543362;
      v15 = v11;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@dataCleanUpTimer fired", (uint8_t *)&v14, 0xCu);

    }
    objc_autoreleasePoolPop(v8);
    -[HMDAccessCodeDataManager context](v9, "context");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isCurrentDeviceOwnerController");

    if (v13)
      -[HMDAccessCodeDataManager _cleanUpOldRemovedUserData](v9, "_cleanUpOldRemovedUserData");
  }

}

- (id)logIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  -[HMDAccessCodeDataManager context](self, "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)dataCleanUpTimerFactory
{
  return objc_getProperty(self, a2, 8, 1);
}

- (void)setDataCleanUpTimerFactory:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (HMDAccessCodeDataManagerDelegate)delegate
{
  return (HMDAccessCodeDataManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (HMDAccessCodeManagerContext)context
{
  return (HMDAccessCodeManagerContext *)objc_getProperty(self, a2, 24, 1);
}

- (HMFTimer)dataCleanUpTimer
{
  return (HMFTimer *)objc_getProperty(self, a2, 32, 1);
}

- (void)setDataCleanUpTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataCleanUpTimer, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_dataCleanUpTimerFactory, 0);
}

id __58__HMDAccessCodeDataManager_updateCacheWithFetchResponses___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessoryUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hapAccessoryWithUUID:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v3, "accessoryAccessCodeValues");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __58__HMDAccessCodeDataManager_updateCacheWithFetchResponses___block_invoke_53;
    v15[3] = &unk_24E78F610;
    v16 = v6;
    objc_msgSend(v7, "na_filter:", v15);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = (void *)MEMORY[0x227676638]();
    v10 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "accessoryUUID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v18 = v12;
      v19 = 2112;
      v20 = v13;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_ERROR, "%{public}@Failed to find hap accessory for fetch response with accessory UUID: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v9);
    v8 = 0;
  }

  return v8;
}

id __58__HMDAccessCodeDataManager_updateCacheWithFetchResponses___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessoryUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hapAccessoryWithUUID:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v3, "accessoryAccessCodeValues");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __58__HMDAccessCodeDataManager_updateCacheWithFetchResponses___block_invoke_56;
    v15[3] = &unk_24E78F610;
    v16 = v6;
    objc_msgSend(v7, "na_filter:", v15);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = (void *)MEMORY[0x227676638]();
    v10 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "accessoryUUID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v18 = v12;
      v19 = 2112;
      v20 = v13;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_ERROR, "%{public}@Failed to find hap accessory for fetch response with accessory UUID: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v9);
    v8 = 0;
  }

  return v8;
}

id __58__HMDAccessCodeDataManager_updateCacheWithFetchResponses___block_invoke_2_57(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  _QWORD v16[4];
  id v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessoryUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hapAccessoryWithUUID:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "accessCodeCache");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "allKeys");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __58__HMDAccessCodeDataManager_updateCacheWithFetchResponses___block_invoke_58;
    v16[3] = &unk_24E78F6A0;
    v17 = v3;
    v18 = v6;
    objc_msgSend(v8, "na_map:", v16);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

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
      objc_msgSend(v3, "accessoryUUID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v20 = v13;
      v21 = 2112;
      v22 = v14;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to find hap accessory for fetch response with accessory UUID: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
    v9 = 0;
  }

  return v9;
}

id __58__HMDAccessCodeDataManager_updateCacheWithFetchResponses___block_invoke_58(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "accessoryAccessCodeValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_map:", &__block_literal_global_61_190030);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v5, "containsObject:", v3) & 1) != 0)
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "accessCodeCache");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

uint64_t __58__HMDAccessCodeDataManager_updateCacheWithFetchResponses___block_invoke_2_59(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "uniqueIdentifier");
}

uint64_t __58__HMDAccessCodeDataManager_updateCacheWithFetchResponses___block_invoke_56(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "accessCodeCache");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = HMFEqualObjects();

  return v7 ^ 1u;
}

uint64_t __58__HMDAccessCodeDataManager_updateCacheWithFetchResponses___block_invoke_53(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "accessCodeCache");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "containsObject:", v6) ^ 1;
  return v7;
}

id __45__HMDAccessCodeDataManager_cachedAccessCodes__block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v2 = (objc_class *)MEMORY[0x24BDD7320];
  v3 = a2;
  v4 = [v2 alloc];
  objc_msgSend(v3, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessCodeCache");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "allValues");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v4, "initWithAccessoryUUID:accessoryAccessCodeValues:error:", v5, v7, 0);

  return v8;
}

void __64__HMDAccessCodeDataManager_removeHMDRemovedUserAccessCodeModel___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x227676638]();
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
      v12 = 138543618;
      v13 = v8;
      v14 = 2112;
      v15 = v3;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_ERROR, "%{public}@Failed to run transaction to update model with error: %@", (uint8_t *)&v12, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
    v9 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 15);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "finishWithError:", v10);

  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543362;
      v13 = v11;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Successfully updated model", (uint8_t *)&v12, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
    objc_msgSend(*(id *)(a1 + 40), "finishWithNoResult");
  }

}

void __69__HMDAccessCodeDataManager_addOrUpdateHMDRemovedUserAccessCodeModel___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x227676638]();
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
      v12 = 138543618;
      v13 = v8;
      v14 = 2112;
      v15 = v3;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_ERROR, "%{public}@Failed to run transaction to update model, with error: %@", (uint8_t *)&v12, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
    v9 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 15);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "finishWithError:", v10);

  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543362;
      v13 = v11;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Successfully updated model", (uint8_t *)&v12, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
    objc_msgSend(*(id *)(a1 + 40), "finishWithNoResult");
  }

}

void __54__HMDAccessCodeDataManager_removeHomeAccessCodeModel___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x227676638]();
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
      v12 = 138543618;
      v13 = v8;
      v14 = 2112;
      v15 = v3;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_ERROR, "%{public}@Failed to run transaction to update model with error: %@", (uint8_t *)&v12, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
    v9 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 15);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "finishWithError:", v10);

  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543362;
      v13 = v11;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Successfully updated model", (uint8_t *)&v12, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
    objc_msgSend(*(id *)(a1 + 40), "finishWithNoResult");
  }

}

void __59__HMDAccessCodeDataManager_addOrUpdateHomeAccessCodeModel___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x227676638]();
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
      v12 = 138543618;
      v13 = v8;
      v14 = 2112;
      v15 = v3;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_ERROR, "%{public}@Failed to run transaction to update model, with error: %@", (uint8_t *)&v12, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
    v9 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 15);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "finishWithError:", v10);

  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543362;
      v13 = v11;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Successfully updated model", (uint8_t *)&v12, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
    objc_msgSend(*(id *)(a1 + 40), "finishWithNoResult");
  }

}

void __54__HMDAccessCodeDataManager_removeUserAccessCodeModel___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x227676638]();
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
      v12 = 138543618;
      v13 = v8;
      v14 = 2112;
      v15 = v3;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_ERROR, "%{public}@Failed to run transaction to update model, error: %@", (uint8_t *)&v12, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
    v9 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 15);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "finishWithError:", v10);

  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543362;
      v13 = v11;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Successfully updated model", (uint8_t *)&v12, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
    objc_msgSend(*(id *)(a1 + 40), "finishWithNoResult");
  }

}

void __59__HMDAccessCodeDataManager_addOrUpdateUserAccessCodeModel___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x227676638]();
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
      v12 = 138543618;
      v13 = v8;
      v14 = 2112;
      v15 = v3;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_ERROR, "%{public}@Failed to run transaction to update model with error: %@", (uint8_t *)&v12, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
    v9 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 15);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "finishWithError:", v10);

  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543362;
      v13 = v11;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Successfully updated model", (uint8_t *)&v12, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
    objc_msgSend(*(id *)(a1 + 40), "finishWithNoResult");
  }

}

id __63__HMDAccessCodeDataManager_accessCodeValuesWithRemovedUserInfo__block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  void *v4;

  v2 = (objc_class *)MEMORY[0x24BDD7300];
  v3 = a2;
  v4 = (void *)objc_msgSend([v2 alloc], "initWithStringValue:", v3);

  return v4;
}

id __57__HMDAccessCodeDataManager_accessCodeValuesWithUserLabel__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;
  void *v5;

  v2 = a2;
  objc_msgSend(v2, "accessCode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x24BDD7300]);
    objc_msgSend(v2, "accessCode");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = (void *)objc_msgSend(v4, "initWithStringValue:", v5);

  }
  return v3;
}

uint64_t __50__HMDAccessCodeDataManager_userUUIDForAccessCode___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "accessCode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

id __59__HMDAccessCodeDataManager_accessCodeValuesWithSimpleLabel__block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  void *v4;

  v2 = (objc_class *)MEMORY[0x24BDD7300];
  v3 = a2;
  v4 = (void *)objc_msgSend([v2 alloc], "initWithStringValue:", v3);

  return v4;
}

id __73__HMDAccessCodeDataManager_removeHMDRemovedUserAccessCodeWithAccessCode___block_invoke(uint64_t a1)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "_removeHMDRemovedUserAccessCodeWithAccessCode:", *(_QWORD *)(a1 + 40));
}

void __54__HMDAccessCodeDataManager__cleanUpOldRemovedUserData__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  id v12;
  id v13;

  v13 = a2;
  v5 = a3;
  objc_msgSend(v5, "dateRemoved");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeIntervalSinceNow");
  v8 = -v7;

  objc_msgSend(*(id *)(a1 + 32), "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removedUserAccessCodeTimeToLive");
  v11 = v10;

  if (v11 < v8)
    v12 = (id)objc_msgSend(*(id *)(a1 + 32), "removeHMDRemovedUserAccessCodeWithCode:removedUserInfo:", v13, v5);

}

void __63__HMDAccessCodeDataManager__setSimpleLabel_forAccessCodeValue___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "stringValue");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "removeHMDRemovedUserAccessCodeWithAccessCode:", v2);

}

uint64_t __73__HMDAccessCodeDataManager__removeUserAccessCodeValue_removedByUserUUID___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_messageUser:thatTheirAccessCodeWasChangedWithType:", *(_QWORD *)(a1 + 40), 2);
}

uint64_t __82__HMDAccessCodeDataManager__setUserWithUUID_forAccessCodeValue_changedByUserUUID___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hmf_isEqualToUUID:", *(_QWORD *)(a1 + 32));

  return v4;
}

void __82__HMDAccessCodeDataManager__setUserWithUUID_forAccessCodeValue_changedByUserUUID___block_invoke_19(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_messageUser:thatTheirAccessCodeWasChangedWithType:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56));
  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 48), "stringValue");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeHMDRemovedUserAccessCodeWithAccessCode:", v3);

}

uint64_t __99__HMDAccessCodeDataManager_updateUserInformation_forHomeAccessCodeWithOldValue_newAccessCodeValue___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setUserInformation:forHomeAccessCodeWithValue:changedByUserUUID:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 0);
}

uint64_t __70__HMDAccessCodeDataManager_homeAccessCodeWithRemovedUserInfoWithUUID___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "userInformationValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removedUserInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "userUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = HMFEqualObjects();

  return v5;
}

uint64_t __67__HMDAccessCodeDataManager_homeAccessCodeValuesWithRemovedUserInfo__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(MEMORY[0x24BDD76B8], "homeAccessCodeValueWithStringValue:removedUserInfo:", a2, a3);
}

id __62__HMDAccessCodeDataManager_homeAccessCodeValuesWithUserLabels__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v2 = a2;
  objc_msgSend(v2, "accessCode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x24BDD72F8]);
    objc_msgSend(v2, "uuid");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v4, "initWithSimpleLabel:labelIdentifier:userUUID:removedUserInfo:", 0, 0, v5, 0);

    v7 = objc_alloc(MEMORY[0x24BDD7300]);
    objc_msgSend(v2, "accessCode");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initWithStringValue:", v8);

    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD76B8]), "initWithAccessCodeValue:userInformationValue:", v9, v6);
  }

  return v3;
}

id __64__HMDAccessCodeDataManager_homeAccessCodeValuesWithSimpleLabels__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = *(void **)(a1 + 32);
  v5 = a3;
  v6 = a2;
  objc_msgSend(v4, "labelIdentifiersByAccessCode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  spiClientIdentifierForUUID(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD72F8]), "initWithSimpleLabel:labelIdentifier:userUUID:removedUserInfo:", v5, v9, 0, 0);
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD7300]), "initWithStringValue:", v6);

  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD76B8]), "initWithAccessCodeValue:userInformationValue:", v11, v10);
  return v12;
}

id __53__HMDAccessCodeDataManager_initWithContext_delegate___block_invoke(double a1, uint64_t a2, uint64_t a3)
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BE3F298]), "initWithTimeInterval:options:", a3, a1);
}

+ (id)createHomeAccessCodeModelsFromLabelsByAccessCode:(id)a3 forHome:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  id v14;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "allKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __85__HMDAccessCodeDataManager_createHomeAccessCodeModelsFromLabelsByAccessCode_forHome___block_invoke;
  v12[3] = &unk_24E78F378;
  v13 = v6;
  v14 = v5;
  v8 = v5;
  v9 = v6;
  objc_msgSend(v7, "na_map:", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)createRemovedUserInfoModelsFromRemovedUserInfoByAccessCode:(id)a3 forHome:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  id v14;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "allKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __95__HMDAccessCodeDataManager_createRemovedUserInfoModelsFromRemovedUserInfoByAccessCode_forHome___block_invoke;
  v12[3] = &unk_24E78F378;
  v13 = v5;
  v14 = v6;
  v8 = v6;
  v9 = v5;
  objc_msgSend(v7, "na_map:", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)createUserAccessCodeModelFromAccessCode:(id)a3 forUserUUID:(id)a4 changedByUserUUID:(id)a5
{
  id v7;
  id v8;
  id v9;
  HMDUserAccessCodeModel *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[HMDUserAccessCodeModel initWithUserUUID:]([HMDUserAccessCodeModel alloc], "initWithUserUUID:", v8);

  -[HMDUserAccessCodeModel setValue:](v10, "setValue:", v9);
  -[HMDUserAccessCodeModel setChangedByUserUUID:](v10, "setChangedByUserUUID:", v7);

  return v10;
}

+ (id)userWithAccessCode:(id)a3 inHome:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v5 = a3;
  objc_msgSend(a4, "users");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __54__HMDAccessCodeDataManager_userWithAccessCode_inHome___block_invoke;
  v10[3] = &unk_24E799728;
  v11 = v5;
  v7 = v5;
  objc_msgSend(v6, "na_firstObjectPassingTest:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)_accessCodeInHome:(id)a3 forHomeAccessCodeModel:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  id v15;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "labelsByAccessCode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __69__HMDAccessCodeDataManager__accessCodeInHome_forHomeAccessCodeModel___block_invoke;
  v13[3] = &unk_24E78F5A8;
  v14 = v6;
  v15 = v5;
  v9 = v5;
  v10 = v6;
  objc_msgSend(v8, "na_firstObjectPassingTest:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)_accessCodeInHome:(id)a3 forRemovedUserAccessCodeModel:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  id v15;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "removedUserInfoByAccessCode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __76__HMDAccessCodeDataManager__accessCodeInHome_forRemovedUserAccessCodeModel___block_invoke;
  v13[3] = &unk_24E78F5A8;
  v14 = v6;
  v15 = v5;
  v9 = v5;
  v10 = v6;
  objc_msgSend(v8, "na_firstObjectPassingTest:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t87 != -1)
    dispatch_once(&logCategory__hmf_once_t87, &__block_literal_global_63_190167);
  return (id)logCategory__hmf_once_v88;
}

void __39__HMDAccessCodeDataManager_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v88;
  logCategory__hmf_once_v88 = v0;

}

uint64_t __76__HMDAccessCodeDataManager__accessCodeInHome_forRemovedUserAccessCodeModel___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "removedUserInfoByAccessCode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDRemovedUserAccessCodeModel modelUUIDForHomeUUID:removedUserInfo:accessCode:](HMDRemovedUserAccessCodeModel, "modelUUIDForHomeUUID:removedUserInfo:accessCode:", v6, v8, v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = HMFEqualObjects();
  return v10;
}

uint64_t __69__HMDAccessCodeDataManager__accessCodeInHome_forHomeAccessCodeModel___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDHomeAccessCodeModel modelUUIDForHomeUUID:accessCodeValue:](HMDHomeAccessCodeModel, "modelUUIDForHomeUUID:accessCodeValue:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = HMFEqualObjects();
  return v8;
}

uint64_t __54__HMDAccessCodeDataManager_userWithAccessCode_inHome___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "accessCode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

HMDRemovedUserAccessCodeModel *__95__HMDAccessCodeDataManager_createRemovedUserInfoModelsFromRemovedUserInfoByAccessCode_forHome___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  HMDRemovedUserAccessCodeModel *v4;
  void *v5;
  void *v6;
  HMDRemovedUserAccessCodeModel *v7;

  v3 = a2;
  v4 = [HMDRemovedUserAccessCodeModel alloc];
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HMDRemovedUserAccessCodeModel initWithRemovedUserInfo:accessCode:homeUUID:](v4, "initWithRemovedUserInfo:accessCode:homeUUID:", v5, v3, v6);

  return v7;
}

HMDHomeAccessCodeModel *__85__HMDAccessCodeDataManager_createHomeAccessCodeModelsFromLabelsByAccessCode_forHome___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  HMDHomeAccessCodeModel *v4;
  void *v5;
  void *v6;
  HMDHomeAccessCodeModel *v7;

  v3 = a2;
  v4 = [HMDHomeAccessCodeModel alloc];
  objc_msgSend(*(id *)(a1 + 32), "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HMDHomeAccessCodeModel initWithHomeUUID:value:label:](v4, "initWithHomeUUID:value:label:", v5, v3, v6);

  return v7;
}

@end
