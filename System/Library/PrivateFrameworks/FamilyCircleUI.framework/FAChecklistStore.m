@implementation FAChecklistStore

- (void)finishSetup
{
  void *v3;
  objc_class *v4;
  HKHealthStore *v5;
  HKHealthStore *healthStore;
  void *v7;
  objc_class *v8;
  HKMedicalIDStore *v9;
  HKMedicalIDStore *medicalIDStore;
  void *v11;
  objc_class *v12;
  _HKMedicalIDData *v13;
  _HKMedicalIDData *medicalIDData;
  FMFSession *v15;
  FMFSession *session;
  void *v17;
  AACustodianController *v18;
  AACustodianController *custodianController;
  NSSet *v20;
  NSSet *membersWithLocation;
  void *v22;
  id v23;
  STSetupClient *v24;
  STSetupClient *setupClient;
  NSMutableDictionary *v26;
  NSMutableDictionary *incompleteCounts;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;

  if (!self->_healthStore)
  {
    v33 = 0;
    v34 = &v33;
    v35 = 0x2050000000;
    v3 = (void *)getHKHealthStoreClass_softClass_1;
    v36 = getHKHealthStoreClass_softClass_1;
    if (!getHKHealthStoreClass_softClass_1)
    {
      v28 = MEMORY[0x24BDAC760];
      v29 = 3221225472;
      v30 = __getHKHealthStoreClass_block_invoke_1;
      v31 = &unk_24C88B7B0;
      v32 = &v33;
      __getHKHealthStoreClass_block_invoke_1((uint64_t)&v28);
      v3 = (void *)v34[3];
    }
    v4 = objc_retainAutorelease(v3);
    _Block_object_dispose(&v33, 8);
    v5 = (HKHealthStore *)objc_alloc_init(v4);
    healthStore = self->_healthStore;
    self->_healthStore = v5;

    v33 = 0;
    v34 = &v33;
    v35 = 0x2050000000;
    v7 = (void *)getHKMedicalIDStoreClass_softClass_1;
    v36 = getHKMedicalIDStoreClass_softClass_1;
    if (!getHKMedicalIDStoreClass_softClass_1)
    {
      v28 = MEMORY[0x24BDAC760];
      v29 = 3221225472;
      v30 = __getHKMedicalIDStoreClass_block_invoke_1;
      v31 = &unk_24C88B7B0;
      v32 = &v33;
      __getHKMedicalIDStoreClass_block_invoke_1((uint64_t)&v28);
      v7 = (void *)v34[3];
    }
    v8 = objc_retainAutorelease(v7);
    _Block_object_dispose(&v33, 8);
    v9 = (HKMedicalIDStore *)objc_msgSend([v8 alloc], "initWithHealthStore:", self->_healthStore);
    medicalIDStore = self->_medicalIDStore;
    self->_medicalIDStore = v9;

    v33 = 0;
    v34 = &v33;
    v35 = 0x2050000000;
    v11 = (void *)get_HKMedicalIDDataClass_softClass_0;
    v36 = get_HKMedicalIDDataClass_softClass_0;
    if (!get_HKMedicalIDDataClass_softClass_0)
    {
      v28 = MEMORY[0x24BDAC760];
      v29 = 3221225472;
      v30 = __get_HKMedicalIDDataClass_block_invoke_0;
      v31 = &unk_24C88B7B0;
      v32 = &v33;
      __get_HKMedicalIDDataClass_block_invoke_0((uint64_t)&v28);
      v11 = (void *)v34[3];
    }
    v12 = objc_retainAutorelease(v11);
    _Block_object_dispose(&v33, 8);
    v13 = (_HKMedicalIDData *)objc_alloc_init(v12);
    medicalIDData = self->_medicalIDData;
    self->_medicalIDData = v13;

    objc_msgSend(MEMORY[0x24BE2FED0], "sharedInstance");
    v15 = (FMFSession *)objc_claimAutoreleasedReturnValue();
    session = self->_session;
    self->_session = v15;

    objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMFSession setDelegateQueue:](self->_session, "setDelegateQueue:", v17);

    v18 = (AACustodianController *)objc_alloc_init(MEMORY[0x24BE04930]);
    custodianController = self->_custodianController;
    self->_custodianController = v18;

    v20 = (NSSet *)objc_alloc_init(MEMORY[0x24BDBCF20]);
    membersWithLocation = self->_membersWithLocation;
    self->_membersWithLocation = v20;

    v33 = 0;
    v34 = &v33;
    v35 = 0x2050000000;
    v22 = (void *)getSTSetupClientClass_softClass;
    v36 = getSTSetupClientClass_softClass;
    if (!getSTSetupClientClass_softClass)
    {
      v28 = MEMORY[0x24BDAC760];
      v29 = 3221225472;
      v30 = __getSTSetupClientClass_block_invoke;
      v31 = &unk_24C88B7B0;
      v32 = &v33;
      __getSTSetupClientClass_block_invoke((uint64_t)&v28);
      v22 = (void *)v34[3];
    }
    v23 = objc_retainAutorelease(v22);
    _Block_object_dispose(&v33, 8);
    v24 = (STSetupClient *)objc_opt_new();
    setupClient = self->_setupClient;
    self->_setupClient = v24;

    v26 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    incompleteCounts = self->_incompleteCounts;
    self->_incompleteCounts = v26;

  }
}

- (FAChecklistStore)init
{
  FAChecklistStore *v2;
  void *v3;
  uint64_t v4;
  AKAccountManager *accountManager;
  uint64_t v6;
  ACAccount *authKitAccount;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)FAChecklistStore;
  v2 = -[FAChecklistStore init](&v9, sel_init);
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v2->_deviceType = objc_msgSend(v3, "userInterfaceIdiom");

  objc_msgSend(MEMORY[0x24BE0AC98], "sharedInstance");
  v4 = objc_claimAutoreleasedReturnValue();
  accountManager = v2->_accountManager;
  v2->_accountManager = (AKAccountManager *)v4;

  -[AKAccountManager primaryAuthKitAccount](v2->_accountManager, "primaryAuthKitAccount");
  v6 = objc_claimAutoreleasedReturnValue();
  authKitAccount = v2->_authKitAccount;
  v2->_authKitAccount = (ACAccount *)v6;

  return v2;
}

- (NSNumber)incompleteItems
{
  NSNumber **p_computedIncompleteCount;
  NSObject *v3;
  NSMutableDictionary *incompleteCounts;
  NSMutableDictionary *v6;
  NSObject *v7;
  NSNumber *v8;
  void *v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  void *v18;
  NSObject *v19;
  int v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  NSNumber *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  uint64_t v31;
  __int16 v32;
  int v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  p_computedIncompleteCount = &self->_computedIncompleteCount;
  if (self->_computedIncompleteCount)
  {
    _FALogSystem();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      -[FAChecklistStore incompleteItems].cold.3((id *)p_computedIncompleteCount, v3);

    return *p_computedIncompleteCount;
  }
  else
  {
    incompleteCounts = self->_incompleteCounts;
    if (incompleteCounts)
    {
      v6 = incompleteCounts;
      if ((unint64_t)-[NSMutableDictionary count](v6, "count") > 5)
      {
        v28 = 0u;
        v29 = 0u;
        v26 = 0u;
        v27 = 0u;
        -[NSMutableDictionary allKeys](v6, "allKeys");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
        if (v10)
        {
          v12 = v10;
          v13 = 0;
          v14 = *(_QWORD *)v27;
          *(_QWORD *)&v11 = 138412290;
          v25 = v11;
          do
          {
            for (i = 0; i != v12; ++i)
            {
              if (*(_QWORD *)v27 != v14)
                objc_enumerationMutation(v9);
              v16 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i);
              -[NSMutableDictionary objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", v16, v25);
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              v18 = v17;
              if (v17)
              {
                v13 = objc_msgSend(v17, "intValue") + v13;
                _FALogSystem();
                v19 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
                {
                  v20 = objc_msgSend(v18, "intValue");
                  *(_DWORD *)buf = 138412546;
                  v31 = v16;
                  v32 = 1024;
                  v33 = v20;
                  _os_log_debug_impl(&dword_20DE41000, v19, OS_LOG_TYPE_DEBUG, "FAChecklistStore value for key %@ is %d", buf, 0x12u);
                }
              }
              else
              {
                _FALogSystem();
                v19 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = v25;
                  v31 = v16;
                  _os_log_error_impl(&dword_20DE41000, v19, OS_LOG_TYPE_ERROR, "FAChecklistStore invalid value for key %@", buf, 0xCu);
                }
              }

            }
            v12 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
          }
          while (v12);
        }
        else
        {
          v13 = 0;
        }

        _FALogSystem();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
          -[FAChecklistStore incompleteItems].cold.2(v13, v21, v22);

        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v13);
        v23 = objc_claimAutoreleasedReturnValue();
        v24 = *p_computedIncompleteCount;
        *p_computedIncompleteCount = (NSNumber *)v23;

        v8 = *p_computedIncompleteCount;
      }
      else
      {
        _FALogSystem();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
          -[FAChecklistStore incompleteItems].cold.1(v7);

        v8 = 0;
      }

      return v8;
    }
    else
    {
      return (NSNumber *)0;
    }
  }
}

- (void)clearChecklistCounts
{
  NSNumber *computedIncompleteCount;

  computedIncompleteCount = self->_computedIncompleteCount;
  self->_computedIncompleteCount = 0;

  -[NSMutableDictionary removeAllObjects](self->_incompleteCounts, "removeAllObjects");
}

- (void)setIncompleteCountFor:(unint64_t)a3 count:(int)a4
{
  __CFString *v5;
  int v6;
  NSObject *v7;
  id v8;

  if (a3 - 1 >= 6)
  {
    v6 = a3;
    _FALogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[FAChecklistStore setIncompleteCountFor:count:].cold.1(v6, v7);

  }
  else
  {
    v5 = off_24C88C490[a3 - 1];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(_QWORD *)&a4);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_incompleteCounts, "setObject:forKeyedSubscript:", v8, v5);

  }
}

- (void)refreshChecklistCount:(id)a3 account:(id)a4 iCloudService:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  int64_t v24;
  _BOOL4 v25;
  _BOOL4 v26;
  uint64_t v27;
  NSObject *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD block[5];
  id v34;
  _QWORD v35[5];
  NSObject *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _QWORD v41[5];
  NSObject *v42;
  _QWORD v43[5];
  NSObject *v44;
  _QWORD v45[5];
  NSObject *v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[FAChecklistStore clearChecklistCounts](self, "clearChecklistCounts");
  -[FAChecklistStore finishSetup](self, "finishSetup");
  v32 = v10;
  -[FAChecklistStore setFamilyCircle:](self, "setFamilyCircle:", v10);
  v30 = v12;
  -[FAChecklistStore setIcloudService:](self, "setIcloudService:", v12);
  v31 = v11;
  -[FAChecklistStore setAppleAccount:](self, "setAppleAccount:", v11);
  v14 = dispatch_group_create();
  dispatch_group_enter(v14);
  v15 = MEMORY[0x24BDAC760];
  v45[0] = MEMORY[0x24BDAC760];
  v45[1] = 3221225472;
  v45[2] = __82__FAChecklistStore_refreshChecklistCount_account_iCloudService_completionHandler___block_invoke;
  v45[3] = &unk_24C88C300;
  v45[4] = self;
  v16 = v14;
  v46 = v16;
  -[FAChecklistStore familyLocationSharingStatus:](self, "familyLocationSharingStatus:", v45);
  dispatch_group_enter(v16);
  if (self->_deviceType)
  {
    -[FAChecklistStore setIncompleteCountFor:count:](self, "setIncompleteCountFor:count:", 1, 0);
    dispatch_group_leave(v16);
  }
  else
  {
    v43[0] = v15;
    v43[1] = 3221225472;
    v43[2] = __82__FAChecklistStore_refreshChecklistCount_account_iCloudService_completionHandler___block_invoke_2;
    v43[3] = &unk_24C88C328;
    v43[4] = self;
    v44 = v16;
    -[FAChecklistStore fetchMedicalIDData:](self, "fetchMedicalIDData:", v43);

  }
  dispatch_group_enter(v16);
  if ((-[AKAccountManager canHaveCustodianForAccount:](self->_accountManager, "canHaveCustodianForAccount:", self->_authKitAccount) & 1) != 0)
  {
    v41[0] = v15;
    v41[1] = 3221225472;
    v41[2] = __82__FAChecklistStore_refreshChecklistCount_account_iCloudService_completionHandler___block_invoke_3;
    v41[3] = &unk_24C88C350;
    v41[4] = self;
    v42 = v16;
    -[FAChecklistStore fetchMyCustodians:](self, "fetchMyCustodians:", v41);

  }
  else
  {
    -[FAChecklistStore setIncompleteCountFor:count:](self, "setIncompleteCountFor:count:", 3, 0);
    dispatch_group_leave(v16);
  }
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  -[FAFamilyCircle members](self->_familyCircle, "members");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v37, v47, 16);
  if (v18)
  {
    v19 = v18;
    v20 = 0;
    v21 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v38 != v21)
          objc_enumerationMutation(v17);
        v23 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
        if (objc_msgSend(v23, "memberType") == 1 || objc_msgSend(v23, "memberType") == 2)
        {
          if ((objc_msgSend(v23, "isMe") & 1) != 0)
            goto LABEL_22;
          v24 = -[FAChecklistStore contactManagementEnabledForChild:](self, "contactManagementEnabledForChild:", v23);
          v25 = -[FAChecklistStore screenTimeEnabledForChild:](self, "screenTimeEnabledForChild:", v23);
          if (v24)
            v26 = 0;
          else
            v26 = v25;
          v20 = (v20 + v26);
        }
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v37, v47, 16);
    }
    while (v19);
  }
  else
  {
LABEL_22:
    v20 = 0;
  }

  -[FAChecklistStore setIncompleteCountFor:count:](self, "setIncompleteCountFor:count:", 5, v20);
  dispatch_group_enter(v16);
  v27 = MEMORY[0x24BDAC760];
  v35[0] = MEMORY[0x24BDAC760];
  v35[1] = 3221225472;
  v35[2] = __82__FAChecklistStore_refreshChecklistCount_account_iCloudService_completionHandler___block_invoke_4;
  v35[3] = &unk_24C88C378;
  v35[4] = self;
  v36 = v16;
  v28 = v16;
  -[FAChecklistStore fetchIcloudPlusMembership:](self, "fetchIcloudPlusMembership:", v35);
  block[0] = v27;
  block[1] = 3221225472;
  block[2] = __82__FAChecklistStore_refreshChecklistCount_account_iCloudService_completionHandler___block_invoke_6;
  block[3] = &unk_24C88C008;
  block[4] = self;
  v34 = v13;
  v29 = v13;
  dispatch_group_notify(v28, MEMORY[0x24BDAC9B8], block);

}

void __82__FAChecklistStore_refreshChecklistCount_account_iCloudService_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 64), a3);
  objc_msgSend(*(id *)(a1 + 32), "setIncompleteCountFor:count:", 2, 0);
  if (!a2)
    objc_msgSend(*(id *)(a1 + 32), "setIncompleteCountFor:count:", 2, 1);
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "members", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v13, "memberType") == 1 || objc_msgSend(v13, "memberType") == 2)
        {
          if ((objc_msgSend(v13, "isMe") & 1) != 0)
            goto LABEL_19;
          if ((objc_msgSend(*(id *)(a1 + 32), "screenTimeEnabledForChild:", v13) & 1) == 0
            && (objc_msgSend(v13, "hasAskToBuyEnabled") & 1) == 0)
          {
            if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "count")
              || (v14 = *(void **)(*(_QWORD *)(a1 + 32) + 64),
                  objc_msgSend(v13, "appleID"),
                  v15 = (void *)objc_claimAutoreleasedReturnValue(),
                  LOBYTE(v14) = objc_msgSend(v14, "containsObject:", v15),
                  v15,
                  (v14 & 1) == 0))
            {
              v10 = (v10 + 1);
            }
          }
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }
  else
  {
LABEL_19:
    v10 = 0;
  }

  objc_msgSend(*(id *)(a1 + 32), "setIncompleteCountFor:count:", 4, v10);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

void __82__FAChecklistStore_refreshChecklistCount_account_iCloudService_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  objc_msgSend(*(id *)(a1 + 32), "setIncompleteCountFor:count:", 1, a3 == 0);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __82__FAChecklistStore_refreshChecklistCount_account_iCloudService_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "setIncompleteCountFor:count:", 3, 0);
  v5 = objc_msgSend(v4, "count");

  if (!v5)
    objc_msgSend(*(id *)(a1 + 32), "setIncompleteCountFor:count:", 3, 1);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __82__FAChecklistStore_refreshChecklistCount_account_iCloudService_completionHandler___block_invoke_4(uint64_t a1, uint64_t a2)
{
  void *v2;
  _QWORD block[5];
  id v4;
  uint64_t v5;

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __82__FAChecklistStore_refreshChecklistCount_account_iCloudService_completionHandler___block_invoke_5;
  block[3] = &unk_24C88BDE0;
  v2 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v5 = a2;
  v4 = v2;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __82__FAChecklistStore_refreshChecklistCount_account_iCloudService_completionHandler___block_invoke_5(uint64_t a1)
{
  _BOOL8 v2;

  objc_msgSend(*(id *)(a1 + 32), "setCountMembersIcloudPlus:", *(_QWORD *)(a1 + 48));
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "aa_isCloudSubscriber"))
    v2 = *(_QWORD *)(a1 + 48) == 0;
  else
    v2 = 0;
  objc_msgSend(*(id *)(a1 + 32), "setIncompleteCountFor:count:", 6, v2);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

uint64_t __82__FAChecklistStore_refreshChecklistCount_account_iCloudService_completionHandler___block_invoke_6(uint64_t a1)
{
  id *v2;
  NSObject *v3;

  v2 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "notifyObservable");
  _FALogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __82__FAChecklistStore_refreshChecklistCount_account_iCloudService_completionHandler___block_invoke_6_cold_1(v2);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)familyLocationSharingStatus:(id)a3
{
  id v4;
  FMFSession *session;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  session = self->_session;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __48__FAChecklistStore_familyLocationSharingStatus___block_invoke;
  v7[3] = &unk_24C88C3A0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[FMFSession getHandlesFollowingMyLocation:](session, "getHandlesFollowingMyLocation:", v7);

}

void __48__FAChecklistStore_familyLocationSharingStatus___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  void *v18;
  unsigned int v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v25 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * i), "identifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v10);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v7);
  }

  if (objc_msgSend(v5, "count"))
  {
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "members", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    if (v12)
    {
      v13 = v12;
      v14 = 0;
      v15 = *(_QWORD *)v21;
      do
      {
        for (j = 0; j != v13; ++j)
        {
          if (*(_QWORD *)v21 != v15)
            objc_enumerationMutation(v11);
          v17 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * j);
          if ((objc_msgSend(v17, "isMe") & 1) == 0)
          {
            objc_msgSend(v17, "appleID");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = objc_msgSend(v4, "containsObject:", v18);

            v14 += v19;
          }
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
      }
      while (v13);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)fetchMedicalIDData:(id)a3
{
  id v4;
  HKMedicalIDStore *medicalIDStore;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  medicalIDStore = self->_medicalIDStore;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __39__FAChecklistStore_fetchMedicalIDData___block_invoke;
  v7[3] = &unk_24C88C3F0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[HKMedicalIDStore fetchMedicalIDDataWithCompletion:](medicalIDStore, "fetchMedicalIDDataWithCompletion:", v7);

}

void __39__FAChecklistStore_fetchMedicalIDData___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint64_t v13;
  id v14;

  v5 = a2;
  v6 = a3;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __39__FAChecklistStore_fetchMedicalIDData___block_invoke_2;
  v10[3] = &unk_24C88C3C8;
  v11 = v5;
  v12 = v6;
  v7 = *(void **)(a1 + 40);
  v13 = *(_QWORD *)(a1 + 32);
  v14 = v7;
  v8 = v6;
  v9 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], v10);

}

void __39__FAChecklistStore_fetchMedicalIDData___block_invoke_2(uint64_t a1)
{
  id v2;
  void *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  uint64_t v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v29 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v3 = *(void **)(a1 + 32);
  if (v3 && !objc_msgSend(v3, "isEmpty"))
  {
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v28 = a1;
    objc_msgSend(*(id *)(a1 + 32), "emergencyContacts");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v35 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
          objc_msgSend(v10, "nameContactIdentifier");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "length");

          if (v12)
          {
            objc_msgSend(v10, "nameContactIdentifier");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v2, "addObject:", v13);

          }
          objc_msgSend(v10, "name");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "length");

          if (v15)
          {
            objc_msgSend(v10, "name");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "addObject:", v16);

          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
      }
      while (v7);
    }

    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    a1 = v28;
    objc_msgSend(*(id *)(v28 + 48), "familyCircle");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "members");
    v4 = objc_claimAutoreleasedReturnValue();

    v18 = -[NSObject countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
    if (!v18)
      goto LABEL_30;
    v19 = v18;
    v20 = 0;
    v21 = *(_QWORD *)v31;
LABEL_19:
    v22 = 0;
    while (1)
    {
      if (*(_QWORD *)v31 != v21)
        objc_enumerationMutation(v4);
      v23 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v22);
      if ((objc_msgSend(v23, "isMe") & 1) != 0)
        goto LABEL_27;
      objc_msgSend(v23, "contact");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "identifier");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v2, "containsObject:", v25))
        break;
      objc_msgSend(v23, "fullName");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v29, "containsObject:", v26);

      if (v27)
        goto LABEL_26;
LABEL_27:
      if (v19 == ++v22)
      {
        v19 = -[NSObject countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
        if (!v19)
        {
          a1 = v28;
          goto LABEL_30;
        }
        goto LABEL_19;
      }
    }

LABEL_26:
    ++v20;
    goto LABEL_27;
  }
  if (*(_QWORD *)(a1 + 40))
  {
    _FALogSystem();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      __39__FAChecklistStore_fetchMedicalIDData___block_invoke_2_cold_1((id *)(a1 + 40));
LABEL_30:

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

- (void)fetchMyCustodians:(id)a3
{
  id v4;
  AACustodianController *custodianController;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  custodianController = self->_custodianController;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __38__FAChecklistStore_fetchMyCustodians___block_invoke;
  v7[3] = &unk_24C88BB88;
  v8 = v4;
  v6 = v4;
  -[AACustodianController fetchTrustedContactsWithCompletion:](custodianController, "fetchTrustedContactsWithCompletion:", v7);

}

void __38__FAChecklistStore_fetchMyCustodians___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __38__FAChecklistStore_fetchMyCustodians___block_invoke_2;
  v5[3] = &unk_24C88C008;
  v6 = v3;
  v7 = *(id *)(a1 + 32);
  v4 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], v5);

}

uint64_t __38__FAChecklistStore_fetchMyCustodians___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "count");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (BOOL)screenTimeEnabledForChild:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  BOOL v11;
  NSObject *v12;
  id v14;

  v3 = a3;
  objc_msgSend(v3, "dsid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = objc_alloc(MEMORY[0x24BE84680]);
    objc_msgSend(v3, "dsid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v5, "initWithDSID:", v6);

    v8 = (void *)objc_opt_new();
    v14 = 0;
    objc_msgSend(v8, "currentConfigurationForUser:error:", v7, &v14);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v14;
    v11 = objc_msgSend(v9, "screenTimeState") == 1;
    if (v10)
    {
      _FALogSystem();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[FAChecklistStore screenTimeEnabledForChild:].cold.1(v10, v12);

    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (int64_t)contactManagementEnabledForChild:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  STSetupClient *setupClient;
  void *v10;
  id v11;
  NSObject *v12;
  int64_t v13;
  id v15;

  v4 = a3;
  objc_msgSend(v4, "dsid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x24BE84680]);
    objc_msgSend(v4, "dsid");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v6, "initWithDSID:", v7);

    setupClient = self->_setupClient;
    v15 = 0;
    -[STSetupClient currentConfigurationForUser:error:](setupClient, "currentConfigurationForUser:error:", v8, &v15);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v15;
    if (v11)
    {
      _FALogSystem();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[FAChecklistStore contactManagementEnabledForChild:].cold.1();

      v13 = 0;
    }
    else
    {
      v13 = objc_msgSend(v10, "contactManagementState");
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)fetchIcloudPlusMembership:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __46__FAChecklistStore_fetchIcloudPlusMembership___block_invoke;
  v7[3] = &unk_24C88C440;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "fetchAAURLConfigurationWithCompletion:", v7);

}

void __46__FAChecklistStore_fetchIcloudPlusMembership___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  FASharedServicesRequest *v4;
  uint64_t v5;
  void *v6;
  FASharedServicesRequest *v7;
  void *v8;
  _QWORD v9[5];
  id v10;

  objc_msgSend(a2, "urlForEndpoint:", CFSTR("getFamilySubscriptions"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = [FASharedServicesRequest alloc];
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80);
  objc_msgSend(v3, "absoluteString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[FASharedServicesRequest initWithAppleAccount:urlString:](v4, "initWithAppleAccount:urlString:", v5, v6);

  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __46__FAChecklistStore_fetchIcloudPlusMembership___block_invoke_2;
  v9[3] = &unk_24C88C418;
  v8 = *(void **)(a1 + 40);
  v9[4] = *(_QWORD *)(a1 + 32);
  v10 = v8;
  -[AARequest performRequestWithHandler:](v7, "performRequestWithHandler:", v9);

}

void __46__FAChecklistStore_fetchIcloudPlusMembership___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __46__FAChecklistStore_fetchIcloudPlusMembership___block_invoke_3;
  v12[3] = &unk_24C88C3C8;
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(a1 + 40);
  v13 = v7;
  v14 = v8;
  v15 = v6;
  v16 = v9;
  v10 = v6;
  v11 = v7;
  dispatch_async(MEMORY[0x24BDAC9B8], v12);

}

uint64_t __46__FAChecklistStore_fetchIcloudPlusMembership___block_invoke_3(uint64_t a1)
{
  id *v2;
  NSObject *v3;
  void *v4;

  v2 = (id *)(a1 + 32);
  if (*(_QWORD *)(a1 + 32))
  {
    _FALogSystem();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __46__FAChecklistStore_fetchIcloudPlusMembership___block_invoke_3_cold_1(v2, v3);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "_handleSubscriptionListResponse:", *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 40), "_getLocationSharedService:", *(_QWORD *)(a1 + 48));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setLocationSharedService:", v4);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

- (unint64_t)_handleSubscriptionListResponse:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v21;
  unint64_t v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (objc_msgSend(v3, "statusCode") != 200)
  {
    _FALogSystem();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      -[FAChecklistStore _handleSubscriptionListResponse:].cold.1(v3);

  }
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v21 = v3;
  objc_msgSend(v3, "responseDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("familySharedServices"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v7)
  {
    v8 = v7;
    v22 = 0;
    v9 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v25 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("name"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqual:", CFSTR("ICLOUD_STORAGE"));

        if (v13)
        {
          v14 = (void *)MEMORY[0x24BDBCF48];
          objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("url"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "URLWithString:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[FAChecklistStore setIcloudPlusUrl:](self, "setIcloudPlusUrl:", v16);

          objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("subscriberDSIDs"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "count");

          if (v18)
          {
            objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("subscriberDSIDs"));
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = objc_msgSend(v19, "count");

          }
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v8);
  }
  else
  {
    v22 = 0;
  }

  return v22;
}

- (id)_getLocationSharedService:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  char v12;
  id v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (objc_msgSend(v3, "statusCode") != 200)
  {
    _FALogSystem();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      -[FAChecklistStore _handleSubscriptionListResponse:].cold.1(v3);

  }
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(v3, "services", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v10, "name");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqual:", CFSTR("SHARE_MY_LOCATION"));

        if ((v12 & 1) != 0)
        {
          v13 = v10;
          goto LABEL_15;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v7)
        continue;
      break;
    }
  }
  v13 = 0;
LABEL_15:

  return v13;
}

- (int64_t)deviceType
{
  return self->_deviceType;
}

- (void)setDeviceType:(int64_t)a3
{
  self->_deviceType = a3;
}

- (void)setIncompleteItems:(id)a3
{
  objc_storeStrong((id *)&self->_incompleteItems, a3);
}

- (FAFamilyCircle)familyCircle
{
  return self->_familyCircle;
}

- (void)setFamilyCircle:(id)a3
{
  objc_storeStrong((id *)&self->_familyCircle, a3);
}

- (FASharedService)iCloudService
{
  return self->_iCloudService;
}

- (unint64_t)countMembersIcloudPlus
{
  return self->_countMembersIcloudPlus;
}

- (void)setCountMembersIcloudPlus:(unint64_t)a3
{
  self->_countMembersIcloudPlus = a3;
}

- (NSURL)icloudPlusUrl
{
  return self->_icloudPlusUrl;
}

- (void)setIcloudPlusUrl:(id)a3
{
  objc_storeStrong((id *)&self->_icloudPlusUrl, a3);
}

- (FASharedService)locationSharedService
{
  return self->_locationSharedService;
}

- (void)setLocationSharedService:(id)a3
{
  objc_storeStrong((id *)&self->_locationSharedService, a3);
}

- (FASharedService)icloudService
{
  return self->_icloudService;
}

- (void)setIcloudService:(id)a3
{
  objc_storeStrong((id *)&self->_icloudService, a3);
}

- (ACAccount)appleAccount
{
  return self->_appleAccount;
}

- (void)setAppleAccount:(id)a3
{
  objc_storeStrong((id *)&self->_appleAccount, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationSharedService, 0);
  objc_storeStrong((id *)&self->_icloudPlusUrl, 0);
  objc_storeStrong((id *)&self->_iCloudService, 0);
  objc_storeStrong((id *)&self->_familyCircle, 0);
  objc_storeStrong((id *)&self->_incompleteItems, 0);
  objc_storeStrong((id *)&self->_computedIncompleteCount, 0);
  objc_storeStrong((id *)&self->_authKitAccount, 0);
  objc_storeStrong((id *)&self->_accountManager, 0);
  objc_storeStrong((id *)&self->_incompleteCounts, 0);
  objc_storeStrong((id *)&self->_icloudService, 0);
  objc_storeStrong((id *)&self->_appleAccount, 0);
  objc_storeStrong((id *)&self->_setupClient, 0);
  objc_storeStrong((id *)&self->_membersWithLocation, 0);
  objc_storeStrong((id *)&self->_custodianController, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_currEmergencyContacts, 0);
  objc_storeStrong((id *)&self->_medicalIDData, 0);
  objc_storeStrong((id *)&self->_medicalIDStore, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
}

- (void)notifyObservable
{
  FAChecklistStore *v2;

  v2 = self;
  FAChecklistStore.notifyObservable()();

}

- (void)incompleteItems
{
  int v3;
  uint64_t v4;
  _DWORD v5[2];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = objc_msgSend(*a1, "intValue");
  v5[0] = 67109120;
  v5[1] = v3;
  OUTLINED_FUNCTION_5(&dword_20DE41000, a2, v4, "FAChecklistStore precomputed count %d", (uint8_t *)v5);
}

- (void)setIncompleteCountFor:(int)a1 count:(NSObject *)a2 .cold.1(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_20DE41000, a2, OS_LOG_TYPE_ERROR, "FAChecklistStore invalid key %d", (uint8_t *)v2, 8u);
  OUTLINED_FUNCTION_3();
}

void __82__FAChecklistStore_refreshChecklistCount_account_iCloudService_completionHandler___block_invoke_6_cold_1(id *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(*a1, "incompleteItems");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_2(&dword_20DE41000, v2, v3, "FAChecklistStore refreshChecklistCount done, count: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

void __39__FAChecklistStore_fetchMedicalIDData___block_invoke_2_cold_1(id *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(*a1, "localizedDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_2(&dword_20DE41000, v2, v3, "Failed to fetch Medical ID Data with error: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

- (void)screenTimeEnabledForChild:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_1(&dword_20DE41000, a2, v4, "Checklist:CurrentConfigurationForUser error: %@", v5);

  OUTLINED_FUNCTION_1();
}

- (void)contactManagementEnabledForChild:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_1(&dword_20DE41000, v0, v1, "Checking contact management for child, CurrentConfigurationForUser error:%@", v2);
}

void __46__FAChecklistStore_fetchIcloudPlusMembership___block_invoke_3_cold_1(id *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*a1, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_1(&dword_20DE41000, a2, v4, "Failed to fetch family subscription details with error: %@", v5);

  OUTLINED_FUNCTION_1();
}

- (void)_handleSubscriptionListResponse:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "error");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_2(&dword_20DE41000, v2, v3, "Failed to get subscription services %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

@end
