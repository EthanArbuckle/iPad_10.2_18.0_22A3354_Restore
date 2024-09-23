@implementation HDHealthAppEmergencySOSManager

- (HDHealthAppEmergencySOSManager)initWithProfile:(id)a3
{
  id v4;
  HDHealthAppEmergencySOSManager *v5;
  HDHealthAppEmergencySOSManager *v6;
  uint64_t v7;
  OS_dispatch_queue *queue;
  id v9;
  uint64_t v10;
  FLFollowUpController *followUpController;
  id WeakRetained;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HDHealthAppEmergencySOSManager;
  v5 = -[HDHealthAppEmergencySOSManager init](&v14, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_profile, v4);
    HKCreateSerialDispatchQueue();
    v7 = objc_claimAutoreleasedReturnValue();
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v7;

    v9 = objc_alloc(MEMORY[0x24BE1B3A8]);
    v10 = objc_msgSend(v9, "initWithClientIdentifier:", *MEMORY[0x24BDD45B0]);
    followUpController = v6->_followUpController;
    v6->_followUpController = (FLFollowUpController *)v10;

    WeakRetained = objc_loadWeakRetained((id *)&v6->_profile);
    objc_msgSend(WeakRetained, "registerProfileReadyObserver:queue:", v6, v6->_queue);

  }
  return v6;
}

- (void)profileDidBecomeReady:(id)a3
{
  HKCoreTelephonyClient *v4;
  HKCoreTelephonyClient *coreTelephonyClient;

  v4 = (HKCoreTelephonyClient *)objc_msgSend(objc_alloc(MEMORY[0x24BDD3A90]), "initWithQueue:", self->_queue);
  coreTelephonyClient = self->_coreTelephonyClient;
  self->_coreTelephonyClient = v4;

  -[HKCoreTelephonyClient setDelegate:](self->_coreTelephonyClient, "setDelegate:", self);
  -[HDHealthAppEmergencySOSManager submitStewieFollowUpItemIfNeeded](self, "submitStewieFollowUpItemIfNeeded");
}

- (void)submitStewieFollowUpItemIfNeeded
{
  HKCoreTelephonyClient *coreTelephonyClient;
  _QWORD v4[5];

  if ((_os_feature_enabled_impl() & 1) != 0)
  {
    coreTelephonyClient = self->_coreTelephonyClient;
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __66__HDHealthAppEmergencySOSManager_submitStewieFollowUpItemIfNeeded__block_invoke;
    v4[3] = &unk_250E7E6B8;
    v4[4] = self;
    -[HKCoreTelephonyClient fetchStewieSupportedWithCompletion:](coreTelephonyClient, "fetchStewieSupportedWithCompletion:", v4);
  }
  else
  {
    -[HDHealthAppEmergencySOSManager clearPendingFollowUpItems](self, "clearPendingFollowUpItems");
  }
}

void __66__HDHealthAppEmergencySOSManager_submitStewieFollowUpItemIfNeeded__block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  os_log_t *v6;
  void *v7;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  os_log_t v12;
  NSObject *v13;
  void *v14;
  id v15;
  os_log_t v16;
  NSObject *v17;
  void *v18;
  id v19;
  os_log_t v20;
  NSObject *v21;
  void *v22;
  id v23;
  void *v24;
  _QWORD v25[5];
  id v26;
  uint8_t buf[4];
  id v28;
  __int16 v29;
  _WORD v30[17];

  *(_QWORD *)&v30[13] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  _HKInitializeLogging();
  v6 = (os_log_t *)MEMORY[0x24BDD3070];
  v7 = (void *)*MEMORY[0x24BDD3070];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3070], OS_LOG_TYPE_DEFAULT))
  {
    v8 = v7;
    *(_DWORD *)buf = 138412802;
    v28 = (id)objc_opt_class();
    v29 = 1024;
    *(_DWORD *)v30 = a2;
    v30[2] = 2112;
    *(_QWORD *)&v30[3] = v5;
    v9 = v28;
    _os_log_impl(&dword_23DB70000, v8, OS_LOG_TYPE_DEFAULT, "[%@][FollowUp] Fetched Stewie support: %d; error: %@",
      buf,
      0x1Cu);

  }
  v10 = *(void **)(a1 + 32);
  if (v5 || (a2 & 1) == 0)
  {
    objc_msgSend(v10, "clearPendingFollowUpItems");
  }
  else
  {
    objc_msgSend(v10, "getEmergencyOnboardingStatus");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    _HKInitializeLogging();
    v12 = *v6;
    if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
    {
      v13 = v12;
      v14 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138412546;
      v28 = v14;
      v29 = 2112;
      *(_QWORD *)v30 = v11;
      v15 = v14;
      _os_log_impl(&dword_23DB70000, v13, OS_LOG_TYPE_DEFAULT, "[%@][FollowUp] Fetched emergency onboarding status: %@", buf, 0x16u);

    }
    if (v11)
    {
      if (objc_msgSend(v11, "intValue") == 3)
      {
        _HKInitializeLogging();
        v16 = *v6;
        if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
        {
          v17 = v16;
          v18 = (void *)objc_opt_class();
          *(_DWORD *)buf = 138412290;
          v28 = v18;
          v19 = v18;
          _os_log_impl(&dword_23DB70000, v17, OS_LOG_TYPE_DEFAULT, "[%@][FollowUp] We received a status that onboarding was completed with Stewie, so we want to clear the follow up item.", buf, 0xCu);

        }
        objc_msgSend(*(id *)(a1 + 32), "clearPendingFollowUpItems");
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 32), "followUpController");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25[0] = MEMORY[0x24BDAC760];
        v25[1] = 3221225472;
        v25[2] = __66__HDHealthAppEmergencySOSManager_submitStewieFollowUpItemIfNeeded__block_invoke_190;
        v25[3] = &unk_250E7E690;
        v25[4] = *(_QWORD *)(a1 + 32);
        v26 = v11;
        objc_msgSend(v24, "pendingFollowUpItemsWithCompletion:", v25);

      }
    }
    else
    {
      _HKInitializeLogging();
      v20 = *v6;
      if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
      {
        v21 = v20;
        v22 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138412290;
        v28 = v22;
        v23 = v22;
        _os_log_impl(&dword_23DB70000, v21, OS_LOG_TYPE_DEFAULT, "[%@][FollowUp] We have a nil emergency onboaridng status, so we do nothing here.", buf, 0xCu);

      }
    }

  }
}

void __66__HDHealthAppEmergencySOSManager_submitStewieFollowUpItemIfNeeded__block_invoke_190(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  NSObject *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t v33[128];
  uint8_t buf[4];
  id v35;
  __int16 v36;
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (!v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "actionIdentifierForOnboardingStatus:", *(_QWORD *)(a1 + 40));
    v26 = a1;
    v27 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "makeFollowUpItemWithActionIdentifier:");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v28 = v5;
    v10 = v5;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v30;
      v14 = *MEMORY[0x24BDD45C8];
      while (2)
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v30 != v13)
            objc_enumerationMutation(v10);
          v16 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
          objc_msgSend(v16, "uniqueIdentifier");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v17, "isEqualToString:", v14) & 1) != 0)
          {
            objc_msgSend(v16, "informativeText");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "informativeText");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = objc_msgSend(v18, "isEqualToString:", v19);

            if (v20)
            {
              _HKInitializeLogging();
              v21 = (void *)*MEMORY[0x24BDD3070];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3070], OS_LOG_TYPE_DEFAULT))
              {
                v23 = v21;
                v24 = (void *)objc_opt_class();
                *(_DWORD *)buf = 138412290;
                v35 = v24;
                v25 = v24;
                _os_log_impl(&dword_23DB70000, v23, OS_LOG_TYPE_DEFAULT, "[%@][FollowUp] Found a pending Stewie item that was previously submitted. We do not need to submit the item.", buf, 0xCu);

              }
              goto LABEL_19;
            }
          }
          else
          {

          }
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
        if (v12)
          continue;
        break;
      }
    }

    objc_msgSend(*(id *)(v26 + 32), "submitFollowUpItem:", v9);
LABEL_19:
    v6 = 0;
    v5 = v28;
    v8 = v27;
    goto LABEL_20;
  }
  _HKInitializeLogging();
  v7 = (void *)*MEMORY[0x24BDD3070];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3070], OS_LOG_TYPE_DEFAULT))
  {
    v8 = v7;
    *(_DWORD *)buf = 138412546;
    v35 = (id)objc_opt_class();
    v36 = 2112;
    v37 = v6;
    v9 = v35;
    _os_log_impl(&dword_23DB70000, v8, OS_LOG_TYPE_DEFAULT, "[%@][FollowUp] Error when fetching pending items: %@", buf, 0x16u);
LABEL_20:

  }
}

- (id)actionIdentifierForOnboardingStatus:(id)a3
{
  int v3;
  id *v4;

  v3 = objc_msgSend(a3, "intValue");
  v4 = (id *)MEMORY[0x24BDD45B8];
  if (v3 == 1)
    v4 = (id *)MEMORY[0x24BDD45C0];
  return *v4;
}

- (id)makeFollowUpItemWithActionIdentifier:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  id v22;
  int v24;
  id v25;
  __int16 v26;
  void *v27;
  void *v28;
  uint64_t v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BE1B3B0]);
  v6 = v5;
  if (v5)
  {
    v7 = *MEMORY[0x24BDD45C8];
    objc_msgSend(v5, "setUniqueIdentifier:", *MEMORY[0x24BDD45C8]);
    objc_msgSend(v6, "setActions:", 0);
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("STEWIE_FOLLOW_UP_ITEM_TITLE"), &stru_250E7ED78, CFSTR("Localizable"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTitle:", v9);

    -[HDHealthAppEmergencySOSManager followUpItemDescription](self, "followUpItemDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setInformativeText:", v10);

    objc_msgSend(v6, "setExtensionIdentifier:", *MEMORY[0x24BDD45B0]);
    objc_msgSend(v6, "setGroupIdentifier:", *MEMORY[0x24BE1B2E8]);
    objc_msgSend(v6, "setCategoryIdentifier:", v7);
    objc_msgSend(v6, "setDisplayStyle:", 0);
    v29 = *MEMORY[0x24BE1B370];
    v30[0] = MEMORY[0x24BDBD1C8];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v30, &v29, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setUserInfo:", v11);

    v12 = objc_alloc_init(MEMORY[0x24BDBCE60]);
    objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "hk_dateByAddingDays:toDate:", 30, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setExpirationDate:", v14);

    v15 = objc_alloc_init(MEMORY[0x24BE1B3A0]);
    v16 = v15;
    if (v15)
    {
      objc_msgSend(v15, "setIdentifier:", v4);
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("STEWIE_FOLLOW_UP_ITEM_BUTTON"), &stru_250E7ED78, CFSTR("Localizable"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setLabel:", v18);

      v28 = v16;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v28, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setActions:", v19);

    }
  }
  _HKInitializeLogging();
  v20 = (void *)*MEMORY[0x24BDD3070];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3070], OS_LOG_TYPE_DEFAULT))
  {
    v21 = v20;
    v24 = 138412546;
    v25 = (id)objc_opt_class();
    v26 = 2112;
    v27 = v6;
    v22 = v25;
    _os_log_impl(&dword_23DB70000, v21, OS_LOG_TYPE_DEFAULT, "[%@][FollowUp] Created follow-up item: %@", (uint8_t *)&v24, 0x16u);

  }
  return v6;
}

- (id)followUpItemDescription
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "medicalIDDataManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = 0;
  v4 = objc_msgSend(v3, "medicalIDSetupStatusWithError:", &v15);
  v5 = v15;
  if (v5)
  {
    _HKInitializeLogging();
    v6 = (void *)*MEMORY[0x24BDD3070];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3070], OS_LOG_TYPE_DEFAULT))
    {
      v7 = v6;
      v8 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138412546;
      v17 = v8;
      v18 = 2112;
      v19 = v5;
      v9 = v8;
      _os_log_impl(&dword_23DB70000, v7, OS_LOG_TYPE_DEFAULT, "[%@][FollowUp] Could not fetch user's Medical ID status: %@", buf, 0x16u);

    }
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    v12 = CFSTR("STEWIE_FOLLOW_UP_ITEM_REVIEW_DESCRIPTION");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v4 == 2)
      v12 = CFSTR("STEWIE_FOLLOW_UP_ITEM_REVIEW_DESCRIPTION");
    else
      v12 = CFSTR("STEWIE_FOLLOW_UP_ITEM_SET_UP_DESCRIPTION");
  }
  objc_msgSend(v10, "localizedStringForKey:value:table:", v12, &stru_250E7ED78, CFSTR("Localizable"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void)submitFollowUpItem:(id)a3
{
  FLFollowUpController *followUpController;
  _QWORD v4[5];

  followUpController = self->_followUpController;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __53__HDHealthAppEmergencySOSManager_submitFollowUpItem___block_invoke;
  v4[3] = &unk_250E7E6B8;
  v4[4] = self;
  -[FLFollowUpController postFollowUpItem:completion:](followUpController, "postFollowUpItem:completion:", a3, v4);
}

void __53__HDHealthAppEmergencySOSManager_submitFollowUpItem___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  int v8;
  id v9;
  __int16 v10;
  int v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _HKInitializeLogging();
  v5 = (void *)*MEMORY[0x24BDD3020];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3020], OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    v8 = 138412802;
    v9 = (id)objc_opt_class();
    v10 = 1024;
    v11 = a2;
    v12 = 2112;
    v13 = v4;
    v7 = v9;
    _os_log_impl(&dword_23DB70000, v6, OS_LOG_TYPE_DEFAULT, "[%@][FollowUp] Posted follow-up item with success %d and error %@", (uint8_t *)&v8, 0x1Cu);

  }
}

- (void)clearPendingFollowUpItems
{
  FLFollowUpController *followUpController;
  _QWORD v3[5];

  followUpController = self->_followUpController;
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __59__HDHealthAppEmergencySOSManager_clearPendingFollowUpItems__block_invoke;
  v3[3] = &unk_250E7E6B8;
  v3[4] = self;
  -[FLFollowUpController clearPendingFollowUpItemsWithCompletion:](followUpController, "clearPendingFollowUpItemsWithCompletion:", v3);
}

void __59__HDHealthAppEmergencySOSManager_clearPendingFollowUpItems__block_invoke(uint64_t a1, int a2, void *a3)
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  int v8;
  id v9;
  __int16 v10;
  int v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _HKInitializeLogging();
  v5 = (void *)*MEMORY[0x24BDD3020];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3020], OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    v8 = 138412802;
    v9 = (id)objc_opt_class();
    v10 = 1024;
    v11 = a2;
    v12 = 2112;
    v13 = v4;
    v7 = v9;
    _os_log_impl(&dword_23DB70000, v6, OS_LOG_TYPE_DEFAULT, "[%@][FollowUp] Cleared follow-up items with success %d and error %@", (uint8_t *)&v8, 0x1Cu);

  }
}

- (id)getEmergencyOnboardingStatus
{
  id v3;
  uint64_t v4;
  id WeakRetained;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v14;

  v3 = objc_alloc(MEMORY[0x24BE40AD0]);
  v4 = *MEMORY[0x24BDD45A8];
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  v6 = (void *)objc_msgSend(v3, "initWithCategory:domainName:profile:", 102, v4, WeakRetained);

  v7 = *MEMORY[0x24BDD45D0];
  v14 = 0;
  objc_msgSend(v6, "numberForKey:error:", v7, &v14);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v14;
  if (v9)
  {
    _HKInitializeLogging();
    v10 = (void *)*MEMORY[0x24BDD3020];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3020], OS_LOG_TYPE_ERROR))
      -[HDHealthAppEmergencySOSManager getEmergencyOnboardingStatus].cold.1(v10, (uint64_t)self, (uint64_t)v9);
    v11 = 0;
  }
  else
  {
    if (v8)
    {
      v12 = v8;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 0);
      v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    v11 = v12;
  }

  return v11;
}

- (HKCoreTelephonyClient)coreTelephonyClient
{
  return self->_coreTelephonyClient;
}

- (void)setCoreTelephonyClient:(id)a3
{
  objc_storeStrong((id *)&self->_coreTelephonyClient, a3);
}

- (FLFollowUpController)followUpController
{
  return self->_followUpController;
}

- (void)setFollowUpController:(id)a3
{
  objc_storeStrong((id *)&self->_followUpController, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (HDProfile)profile
{
  return (HDProfile *)objc_loadWeakRetained((id *)&self->_profile);
}

- (void)setProfile:(id)a3
{
  objc_storeWeak((id *)&self->_profile, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_profile);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_followUpController, 0);
  objc_storeStrong((id *)&self->_coreTelephonyClient, 0);
}

- (void)getEmergencyOnboardingStatus
{
  NSObject *v4;
  id v5;
  int v6;
  id v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = a1;
  v6 = 138412546;
  v7 = (id)objc_opt_class();
  v8 = 2112;
  v9 = a3;
  v5 = v7;
  _os_log_error_impl(&dword_23DB70000, v4, OS_LOG_TYPE_ERROR, "[%@][FollowUp] Failed to get emergency onboarding status: %@", (uint8_t *)&v6, 0x16u);

}

@end
