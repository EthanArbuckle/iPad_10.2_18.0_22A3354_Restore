@implementation HUHomeHubMigrationOnboardingFlow

- (HUHomeHubMigrationOnboardingFlow)initWithUsageOptions:(id)a3 home:(id)a4 devices:(id)a5
{
  id v8;
  id v9;
  id v10;
  HUHomeHubMigrationOnboardingFlow *v11;
  HUHomeHubMigrationOnboardingFlow *v12;
  void *v13;
  uint64_t v14;
  NAFuture *onboardingFuture;
  _QWORD v17[4];
  id v18;
  id v19;
  id location;
  objc_super v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v21.receiver = self;
  v21.super_class = (Class)HUHomeHubMigrationOnboardingFlow;
  v11 = -[HUHomeHubMigrationOnboardingFlow init](&v21, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_home, a4);
    v12->_shouldBlockMigrationWithAppleTVWarning = 0;
    objc_initWeak(&location, v12);
    objc_msgSend((id)objc_opt_class(), "needsOnboardingForHome:options:", v12->_home, v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __70__HUHomeHubMigrationOnboardingFlow_initWithUsageOptions_home_devices___block_invoke;
    v17[3] = &unk_1E6F4E9B8;
    objc_copyWeak(&v19, &location);
    v18 = v10;
    objc_msgSend(v13, "flatMap:", v17);
    v14 = objc_claimAutoreleasedReturnValue();
    onboardingFuture = v12->_onboardingFuture;
    v12->_onboardingFuture = (NAFuture *)v14;

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }

  return v12;
}

id __70__HUHomeHubMigrationOnboardingFlow_initWithUsageOptions_home_devices___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;

  v3 = a2;
  v4 = (void *)MEMORY[0x1E0D519C0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __70__HUHomeHubMigrationOnboardingFlow_initWithUsageOptions_home_devices___block_invoke_2;
  v8[3] = &unk_1E6F4E990;
  objc_copyWeak(&v11, (id *)(a1 + 40));
  v5 = v3;
  v9 = v5;
  v10 = *(id *)(a1 + 32);
  objc_msgSend(v4, "futureWithBlock:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v11);
  return v6;
}

void __70__HUHomeHubMigrationOnboardingFlow_initWithUsageOptions_home_devices___block_invoke_2(id *a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  NSObject *v13;
  int v14;
  void *v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  id v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  int v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (objc_msgSend(a1[4], "BOOLValue"))
  {
    v23 = v3;
    HFLogForCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = a1[5];
      *(_DWORD *)buf = 138412546;
      v32 = WeakRetained;
      v33 = 2112;
      v34 = v6;
      _os_log_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_DEFAULT, "%@:Received list of devices = [%@]", buf, 0x16u);
    }

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v7 = a1[5];
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v37, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v28 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
          HFLogForCategory();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            v14 = objc_msgSend(v12, "supportsHH2");
            *(_DWORD *)buf = 138412802;
            v32 = WeakRetained;
            v33 = 2112;
            v34 = v12;
            v35 = 1024;
            v36 = v14;
            _os_log_impl(&dword_1B8E1E000, v13, OS_LOG_TYPE_DEFAULT, "%@:device = [%@] supportsHH2 = %{BOOL}d", buf, 0x1Cu);
          }

          if ((objc_msgSend(v12, "supportsHH2") & 1) == 0)
          {
            objc_msgSend(v12, "productInfo");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend(v15, "productPlatform");

            if (v16 != 4)
            {
              objc_msgSend(v24, "addObject:", v12);
              objc_msgSend(WeakRetained, "setShouldShowDeviceWarning:", 1);
            }
          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v37, 16);
      }
      while (v9);
    }

    v17 = (void *)objc_msgSend(v24, "copy");
    objc_msgSend(WeakRetained, "setDevices:", v17);

    HFLogForCategory();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(WeakRetained, "devices");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v32 = WeakRetained;
      v33 = 2112;
      v34 = v19;
      _os_log_impl(&dword_1B8E1E000, v18, OS_LOG_TYPE_DEFAULT, "%@:unsupportedDevices = [%@]", buf, 0x16u);

    }
    objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "allHomesFuture");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __70__HUHomeHubMigrationOnboardingFlow_initWithUsageOptions_home_devices___block_invoke_5;
    v25[3] = &unk_1E6F4CD30;
    v26 = WeakRetained;
    v22 = (id)objc_msgSend(v21, "flatMap:", v25);

    v3 = v23;
  }
  else
  {
    objc_msgSend(v3, "finishWithNoResult");
  }

}

id __70__HUHomeHubMigrationOnboardingFlow_initWithUsageOptions_home_devices___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  HUHomeHubIntroSetupViewController *v27;
  void *v28;
  HUHomeHubIntroSetupViewController *v29;
  uint64_t v30;
  void *v31;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  id obj;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint8_t buf[4];
  void *v49;
  __int16 v50;
  void *v51;
  _BYTE v52[128];
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = (void *)objc_opt_new();
  v35 = (void *)objc_opt_new();
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  obj = v3;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v53, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v45;
    v36 = *(_QWORD *)v45;
    do
    {
      v7 = 0;
      v37 = v5;
      do
      {
        if (*(_QWORD *)v45 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * v7);
        objc_msgSend(v8, "currentUser", v33);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v8, "hf_userIsOwner:", v9);

        if (v10)
        {
          v11 = (void *)objc_opt_new();
          v40 = 0u;
          v41 = 0u;
          v42 = 0u;
          v43 = 0u;
          objc_msgSend(v8, "users");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v40, v52, 16);
          if (v13)
          {
            v14 = v13;
            v15 = 0;
            v16 = *(_QWORD *)v41;
            do
            {
              for (i = 0; i != v14; ++i)
              {
                if (*(_QWORD *)v41 != v16)
                  objc_enumerationMutation(v12);
                v18 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
                if ((objc_msgSend(v18, "supportsSharedHomeHH2AutoMigration") & 1) == 0)
                {
                  v15 = 1;
                  objc_msgSend(*(id *)(a1 + 32), "setShouldShowUserWarning:", 1);
                  objc_msgSend(v11, "addObject:", v18);
                }
              }
              v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v40, v52, 16);
            }
            while (v14);

            v6 = v36;
            v5 = v37;
            if ((v15 & 1) != 0)
              objc_msgSend(v33, "setObject:forKey:", v11, v8);
          }
          else
          {

          }
          objc_msgSend(v38, "addObject:", v8);
          objc_msgSend(*(id *)(a1 + 32), "_checkResidentStatusInHome:", v8);
          objc_msgSend(*(id *)(a1 + 32), "_checkHomePodResidentUpgradeRequirementsInHome:", v8);
        }
        else
        {
          objc_msgSend(v8, "currentUser");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "homeAccessControlForUser:", v19);
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v11, "isAccessAllowed"))
          {
            objc_msgSend(*(id *)(a1 + 32), "setShouldShowSharedHomeWarning:", 1);
            objc_msgSend(v35, "addObject:", v8);
          }
        }

        ++v7;
      }
      while (v7 != v5);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v53, 16);
    }
    while (v5);
  }

  HFLogForCategory();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    v21 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v21, "upgradeRequirements"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v49 = v21;
    v50 = 2112;
    v51 = v22;
    _os_log_impl(&dword_1B8E1E000, v20, OS_LOG_TYPE_DEFAULT, "%@:upgradeRequirements = [%@]", buf, 0x16u);

  }
  if (objc_msgSend(v33, "count"))
  {
    HFLogForCategory();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v24 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      v49 = v24;
      v50 = 2112;
      v51 = v33;
      _os_log_impl(&dword_1B8E1E000, v23, OS_LOG_TYPE_DEFAULT, "%@:Found Users that need to upgrade to support HH2: %@", buf, 0x16u);
    }

  }
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v38, v33);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setHomes:", v25);

  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v35);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setSharedHomes:", v26);

  objc_msgSend(*(id *)(a1 + 32), "setHomesToUsersMap:", v34);
  v27 = [HUHomeHubIntroSetupViewController alloc];
  objc_msgSend(*(id *)(a1 + 32), "homes");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = -[HUHomeHubIntroSetupViewController initWithHomes:](v27, "initWithHomes:", v28);

  if (objc_msgSend(*(id *)(a1 + 32), "upgradeRequirements")
    || (objc_msgSend(*(id *)(a1 + 32), "shouldShowAppleTVWarning") & 1) != 0
    || (objc_msgSend(*(id *)(a1 + 32), "shouldShowResidentWarning") & 1) != 0
    || (objc_msgSend(*(id *)(a1 + 32), "shouldShowDeviceWarning") & 1) != 0
    || (objc_msgSend(*(id *)(a1 + 32), "shouldShowUserWarning") & 1) != 0)
  {
    v30 = 0;
  }
  else
  {
    v30 = objc_msgSend(*(id *)(a1 + 32), "shouldShowSharedHomeWarning") ^ 1;
  }
  -[HUHomeHubIntroSetupViewController setIsFinalStep:](v29, "setIsFinalStep:", v30);
  objc_msgSend(*(id *)(a1 + 32), "setInitialViewController:", v29);
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  return v31;
}

+ (id)needsOnboardingForHome:(id)a3 options:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", MEMORY[0x1E0C9AAB0], a4);
}

- (id)processUserInput:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  HUHomeHubMigrationFailedViewController *v10;
  HUHomeHubMigrationSuccessViewController *v11;
  void *v13;
  HUHomeHubMigrationProgressViewController *v14;
  void *v15;
  HUHomeHubMigrationFailedViewController *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  HUHomeHubMigrationSuccessViewController *v29;
  void *v30;
  void *v31;
  uint8_t buf[4];
  HUHomeHubMigrationOnboardingFlow *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("HUHomeHub2OnboardingKey_UserInput"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("HUHomeHub2OnboardingKey_ErrorDescription"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  HFLogForCategory();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v33 = self;
    v34 = 2112;
    v35 = v9;
    v36 = 2112;
    v37 = v5;
    _os_log_impl(&dword_1B8E1E000, v8, OS_LOG_TYPE_DEFAULT, "%@:%@ with input results: %@", buf, 0x20u);

  }
  if (objc_msgSend(v6, "integerValue")
    && objc_msgSend(v6, "integerValue") != 1
    && objc_msgSend(v6, "integerValue") != 2
    && objc_msgSend(v6, "integerValue") != 3
    && objc_msgSend(v6, "integerValue") != 9
    && objc_msgSend(v6, "integerValue") != 4
    && objc_msgSend(v6, "integerValue") != 5
    && objc_msgSend(v6, "integerValue") != 6
    && objc_msgSend(v6, "integerValue") != 8
    && objc_msgSend(v6, "integerValue") != 7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUHomeHubMigrationOnboardingFlow.m"), 185, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("(userInputValue.integerValue == HUHomeHub2OnboardingValue_ContinueFromIntro) || (userInputValue.integerValue == HUHomeHub2OnboardingValue_ContinueFromDeviceWarning) || (userInputValue.integerValue == HUHomeHub2OnboardingValue_ContinueFromSharedUserWarning) || (userInputValue.integerValue == HUHomeHub2OnboardingValue_DontSetup) || (userInputValue.integerValue == HUHomeHub2OnboardingValue_Done) || (userInputValue.integerValue == HUHomeHub2OnboardingValue_ContinueFromAppleTVWarning) || (userInputValue.integerValue == HUHomeHub2OnboardingValue_ContinueFromResidentWarning) || (userInputValue.integerValue == HUHomeHub2OnboardingValue_MigrationInProgress) || (userInputValue.integerValue == HUHomeHub2OnboardingValue_MigrationSucceeded) || (userInputValue.integerValue == HUHomeHub2OnboardingValue_MigrationFailed)"));

  }
  if (objc_msgSend(v6, "integerValue")
    && objc_msgSend(v6, "integerValue") != 4
    && objc_msgSend(v6, "integerValue") != 5
    && objc_msgSend(v6, "integerValue") != 1
    && objc_msgSend(v6, "integerValue") != 2)
  {
    if (objc_msgSend(v6, "integerValue") == 3 || objc_msgSend(v6, "integerValue") == 9)
    {
      -[HUHomeHubMigrationOnboardingFlow onboardingFuture](self, "onboardingFuture");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "finishWithNoResult");

LABEL_25:
      v11 = 0;
      goto LABEL_21;
    }
    if (objc_msgSend(v6, "integerValue") == 6)
    {
      v14 = [HUHomeHubMigrationProgressViewController alloc];
      -[HUHomeHubMigrationOnboardingFlow homes](self, "homes");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = -[HUHomeHubMigrationProgressViewController initWithOwnedHomes:](v14, "initWithOwnedHomes:", v15);
    }
    else
    {
      if (objc_msgSend(v6, "integerValue") != 7)
      {
        if (objc_msgSend(v6, "integerValue") != 8)
          goto LABEL_25;
        -[HUHomeHubMigrationOnboardingFlow homes](self, "homes");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if ((unint64_t)objc_msgSend(v19, "count") > 1)
        {
          _HULocalizedStringWithDefaultValue(CFSTR("HUSoftwareUpdateMigrationSuccessDescriptionMultipleHomes"), CFSTR("HUSoftwareUpdateMigrationSuccessDescriptionMultipleHomes"), 1);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          -[HUHomeHubMigrationOnboardingFlow homes](self, "homes");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "firstObject");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "hf_displayName");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          HULocalizedStringWithFormat(CFSTR("HUSoftwareUpdateMigrationSuccessDescriptionSpecificHome"), CFSTR("%@"), v23, v24, v25, v26, v27, v28, (uint64_t)v22);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

        }
        v29 = [HUHomeHubMigrationSuccessViewController alloc];
        _HULocalizedStringWithDefaultValue(CFSTR("HUSoftwareUpdateMigrationSuccessTitle"), CFSTR("HUSoftwareUpdateMigrationSuccessTitle"), 1);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = -[HUHomeHubMigrationSuccessViewController initWithTitle:detailText:symbolName:](v29, "initWithTitle:detailText:symbolName:", v30, v15, 0);

LABEL_32:
        goto LABEL_21;
      }
      if (!v7)
      {
        v10 = objc_alloc_init(HUHomeHubMigrationFailedViewController);
        goto LABEL_20;
      }
      v17 = (void *)MEMORY[0x1E0CB3940];
      _HULocalizedStringWithDefaultValue(CFSTR("HUSoftwareUpdateMigrationFailedDescription"), CFSTR("HUSoftwareUpdateMigrationFailedDescription"), 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "stringWithFormat:", CFSTR("%@\n%@"), v18, v7);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = -[HUHomeHubMigrationFailedViewController initWithDetailText:]([HUHomeHubMigrationFailedViewController alloc], "initWithDetailText:", v15);
    }
    v11 = (HUHomeHubMigrationSuccessViewController *)v16;
    goto LABEL_32;
  }
  -[HUHomeHubMigrationOnboardingFlow _determineNextViewControllerWithPriorResults:](self, "_determineNextViewControllerWithPriorResults:", v5);
  v10 = (HUHomeHubMigrationFailedViewController *)objc_claimAutoreleasedReturnValue();
LABEL_20:
  v11 = (HUHomeHubMigrationSuccessViewController *)v10;
LABEL_21:

  return v11;
}

- (id)_determineNextViewControllerWithPriorResults:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  NSObject *v13;
  void *v14;
  _BOOL4 v15;
  _BOOL4 v16;
  void *v17;
  void *v18;
  void *v19;
  HUHomeHubUpdateHomePodsViewController *v20;
  void *v21;
  void *v22;
  HUHomeHubResidentWarningViewController *v23;
  HUHomeHubAppleTVUpdateWarningViewController *v24;
  void *v25;
  HUHomeHubPersonalDeviceWarningViewController *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  HUHomeHubSharedUserWarningViewController *v30;
  void *v31;
  HUHomeHubResidentWarningViewController *v32;
  HUHomeHubSharedHomeWarningViewController *v33;
  void *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  _BOOL4 v38;
  void *v39;
  int v41;
  HUHomeHubMigrationOnboardingFlow *v42;
  __int16 v43;
  _BYTE v44[14];
  __int16 v45;
  _BOOL4 v46;
  __int16 v47;
  _BOOL4 v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("HUHomeHub2OnboardingKey_UserInput"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("HUUpgradeMultiUserDevicesOnboardingKey_UserInput"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  HFLogForCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v41 = 138412546;
    v42 = self;
    v43 = 2112;
    *(_QWORD *)v44 = v4;
    _os_log_impl(&dword_1B8E1E000, v7, OS_LOG_TYPE_DEFAULT, "%@:results = [%@]", (uint8_t *)&v41, 0x16u);
  }

  if (v6 && !objc_msgSend(v6, "integerValue"))
  {
    objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("HUHomeFeatureOnboardingKey_HomeHub2Migration_FinishedOnboarding"));
LABEL_40:
    -[HUHomeHubMigrationOnboardingFlow onboardingFuture](self, "onboardingFuture");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "finishWithNoResult");

    v23 = 0;
    goto LABEL_41;
  }
  if (!objc_msgSend(v5, "integerValue"))
  {
    -[HUHomeHubMigrationOnboardingFlow homes](self, "homes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "na_flatMap:", &__block_literal_global_115);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "na_filter:", &__block_literal_global_39);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUHomeHubMigrationOnboardingFlow setHomePodsToUpdate:](self, "setHomePodsToUpdate:", v10);

    if (-[HUHomeHubMigrationOnboardingFlow upgradeRequirements](self, "upgradeRequirements"))
    {
      -[HUHomeHubMigrationOnboardingFlow homePodsToUpdate](self, "homePodsToUpdate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "hmf_isEmpty") ^ 1;

    }
    else
    {
      v12 = 0;
    }
    HFLogForCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      -[HUHomeHubMigrationOnboardingFlow homePodsToUpdate](self, "homePodsToUpdate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = -[HUHomeHubMigrationOnboardingFlow shouldShowResidentWarning](self, "shouldShowResidentWarning");
      v16 = -[HUHomeHubMigrationOnboardingFlow shouldShowAppleTVWarning](self, "shouldShowAppleTVWarning");
      v41 = 138413314;
      v42 = self;
      v43 = 1024;
      *(_DWORD *)v44 = v12;
      *(_WORD *)&v44[4] = 2112;
      *(_QWORD *)&v44[6] = v14;
      v45 = 1024;
      v46 = v15;
      v47 = 1024;
      v48 = v16;
      _os_log_impl(&dword_1B8E1E000, v13, OS_LOG_TYPE_DEFAULT, "%@: shouldShowUpdateHomePodsView = [%d], homePods = [%@], shouldShowResidentWarning = %{BOOL}d, shouldShowAppleTVWarning = %{BOOL}d", (uint8_t *)&v41, 0x28u);

    }
    -[HUHomeHubMigrationOnboardingFlow homes](self, "homes");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "na_flatMap:", &__block_literal_global_41);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "na_filter:", &__block_literal_global_43);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUHomeHubMigrationOnboardingFlow setAppleTVsToUpdate:](self, "setAppleTVsToUpdate:", v19);

    if (v12)
    {
      v20 = [HUHomeHubUpdateHomePodsViewController alloc];
      -[HUHomeHubMigrationOnboardingFlow homes](self, "homes");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUHomeHubMigrationOnboardingFlow homePodsToUpdate](self, "homePodsToUpdate");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = -[HUHomeHubUpdateHomePodsViewController initWithOwnedHomes:homePodsToUpdate:](v20, "initWithOwnedHomes:homePodsToUpdate:", v21, v22);

      if (!v23)
        goto LABEL_37;
      goto LABEL_41;
    }
    if (-[HUHomeHubMigrationOnboardingFlow shouldShowAppleTVWarning](self, "shouldShowAppleTVWarning"))
    {
      v24 = [HUHomeHubAppleTVUpdateWarningViewController alloc];
      -[HUHomeHubMigrationOnboardingFlow appleTVsToUpdate](self, "appleTVsToUpdate");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = -[HUHomeHubAppleTVUpdateWarningViewController initWithAppleTVsToUpdate:shouldBlockMigration:](v24, "initWithAppleTVsToUpdate:shouldBlockMigration:", v25, -[HUHomeHubMigrationOnboardingFlow shouldBlockMigrationWithAppleTVWarning](self, "shouldBlockMigrationWithAppleTVWarning"));

      if (-[HUHomeHubMigrationOnboardingFlow shouldShowResidentWarning](self, "shouldShowResidentWarning"))
        goto LABEL_30;
      goto LABEL_25;
    }
LABEL_23:
    if (!-[HUHomeHubMigrationOnboardingFlow shouldShowResidentWarning](self, "shouldShowResidentWarning"))
      goto LABEL_27;
    v23 = -[HUHomeHubResidentWarningViewController initWithiPadOnlyHub:]([HUHomeHubResidentWarningViewController alloc], "initWithiPadOnlyHub:", -[HUHomeHubMigrationOnboardingFlow hasiPadOnlyHub](self, "hasiPadOnlyHub"));
LABEL_25:
    if (-[HUHomeHubMigrationOnboardingFlow shouldShowDeviceWarning](self, "shouldShowDeviceWarning"))
      goto LABEL_30;
    goto LABEL_29;
  }
  if (objc_msgSend(v5, "integerValue") == 4)
    goto LABEL_23;
  if (objc_msgSend(v5, "integerValue") == 5)
  {
LABEL_27:
    if (!-[HUHomeHubMigrationOnboardingFlow shouldShowDeviceWarning](self, "shouldShowDeviceWarning"))
      goto LABEL_31;
    v26 = [HUHomeHubPersonalDeviceWarningViewController alloc];
    -[HUHomeHubMigrationOnboardingFlow devices](self, "devices");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUHomeHubMigrationOnboardingFlow homes](self, "homes");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = -[HUHomeHubPersonalDeviceWarningViewController initWithDevices:homes:](v26, "initWithDevices:homes:", v27, v28);

LABEL_29:
    if (!-[HUHomeHubMigrationOnboardingFlow shouldShowUserWarning](self, "shouldShowUserWarning"))
    {
LABEL_33:
      v29 = -[HUHomeHubMigrationOnboardingFlow shouldShowSharedHomeWarning](self, "shouldShowSharedHomeWarning") ^ 1;
      goto LABEL_34;
    }
LABEL_30:
    v29 = 0;
LABEL_34:
    v32 = v23;
    goto LABEL_36;
  }
  if (objc_msgSend(v5, "integerValue") != 1)
  {
    if (objc_msgSend(v5, "integerValue") != 2)
      goto LABEL_37;
    goto LABEL_35;
  }
LABEL_31:
  if (-[HUHomeHubMigrationOnboardingFlow shouldShowUserWarning](self, "shouldShowUserWarning"))
  {
    v30 = [HUHomeHubSharedUserWarningViewController alloc];
    -[HUHomeHubMigrationOnboardingFlow homesToUsersMap](self, "homesToUsersMap");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = -[HUHomeHubSharedUserWarningViewController initWithHomesToUsersMap:](v30, "initWithHomesToUsersMap:", v31);

    goto LABEL_33;
  }
LABEL_35:
  v33 = [HUHomeHubSharedHomeWarningViewController alloc];
  v34 = (void *)MEMORY[0x1E0C99E60];
  -[HUHomeHubMigrationOnboardingFlow sharedHomes](self, "sharedHomes");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setWithArray:", v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = -[HUHomeHubSharedHomeWarningViewController initWithSharedHomes:](v33, "initWithSharedHomes:", v36);

  v32 = v23;
  v29 = 1;
LABEL_36:
  -[HUHomeHubResidentWarningViewController setIsFinalStep:](v32, "setIsFinalStep:", v29);
  if (!v23)
  {
LABEL_37:
    HFLogForCategory();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      v38 = -[HUHomeHubMigrationOnboardingFlow shouldShowUserWarning](self, "shouldShowUserWarning");
      v41 = 138412546;
      v42 = self;
      v43 = 1024;
      *(_DWORD *)v44 = v38;
      _os_log_impl(&dword_1B8E1E000, v37, OS_LOG_TYPE_DEFAULT, "%@: _determineNextViewControllerWithPriorResults result is nil. Marking onboarding future as finished. shouldShowUserWarning: %{BOOL}d", (uint8_t *)&v41, 0x12u);
    }

    goto LABEL_40;
  }
LABEL_41:

  return v23;
}

uint64_t __81__HUHomeHubMigrationOnboardingFlow__determineNextViewControllerWithPriorResults___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_homePods");
}

uint64_t __81__HUHomeHubMigrationOnboardingFlow__determineNextViewControllerWithPriorResults___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "device");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "supportsHH2") ^ 1;

  return v3;
}

uint64_t __81__HUHomeHubMigrationOnboardingFlow__determineNextViewControllerWithPriorResults___block_invoke_40(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_appleTVs");
}

uint64_t __81__HUHomeHubMigrationOnboardingFlow__determineNextViewControllerWithPriorResults___block_invoke_2_42(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "device");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "supportsHH2") ^ 1;

  return v3;
}

- (void)_checkHomePodResidentUpgradeRequirementsInHome:(id)a3
{
  id v4;
  int v5;
  NSObject *v6;
  NSObject *v7;
  HUHomeHubMigrationOnboardingFlow *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  int v15;
  _QWORD v16[5];
  uint8_t buf[4];
  HUHomeHubMigrationOnboardingFlow *v18;
  __int16 v19;
  unint64_t v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = HFPreferencesBoolForKey();
  HFLogForCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v18 = self;
    v19 = 2048;
    v20 = -[HUHomeHubMigrationOnboardingFlow upgradeRequirements](self, "upgradeRequirements");
    _os_log_impl(&dword_1B8E1E000, v6, OS_LOG_TYPE_DEFAULT, "%@: upgradeRequirements = [%lu]", buf, 0x16u);
  }

  if (v5)
  {
    HFLogForCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B8E1E000, v7, OS_LOG_TYPE_DEFAULT, "Bypassing HomePod software version check for HH2 because the override is enabled", buf, 2u);
    }

    v8 = self;
    v9 = 0;
LABEL_7:
    -[HUHomeHubMigrationOnboardingFlow setUpgradeRequirements:](v8, "setUpgradeRequirements:", v9);
    goto LABEL_9;
  }
  if (!-[HUHomeHubMigrationOnboardingFlow upgradeRequirements](self, "upgradeRequirements"))
  {
    objc_msgSend(v4, "residentDevices");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");

    if (v11)
    {
      HFLogForCategory();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v4, "residentDevices");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v18 = self;
        v19 = 2112;
        v20 = (unint64_t)v13;
        v21 = 2112;
        v22 = v4;
        _os_log_impl(&dword_1B8E1E000, v12, OS_LOG_TYPE_DEFAULT, "%@: residentDevices = [%@] in home: [%@]", buf, 0x20u);

      }
      objc_msgSend(v4, "residentDevices");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __83__HUHomeHubMigrationOnboardingFlow__checkHomePodResidentUpgradeRequirementsInHome___block_invoke;
      v16[3] = &unk_1E6F54958;
      v16[4] = self;
      v15 = objc_msgSend(v14, "na_allObjectsPassTest:", v16);

      v9 = v15 ^ 1u;
      v8 = self;
      goto LABEL_7;
    }
  }
LABEL_9:

}

uint64_t __83__HUHomeHubMigrationOnboardingFlow__checkHomePodResidentUpgradeRequirementsInHome___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  int v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v3, "device");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "device");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412802;
    v12 = v5;
    v13 = 2112;
    v14 = v6;
    v15 = 1024;
    v16 = objc_msgSend(v7, "supportsHH2");
    _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "%@: residentDevice = [%@] supportsHH2 = [%d]", (uint8_t *)&v11, 0x1Cu);

  }
  objc_msgSend(v3, "device");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "supportsHH2") & 1) != 0 || (objc_msgSend(v3, "hf_isResidentAppleTV") & 1) != 0)
    v9 = 1;
  else
    v9 = objc_msgSend(v3, "hf_isResidentiPad");

  return v9;
}

- (void)_checkResidentStatusInHome:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  _BOOL4 v16;
  void *v17;
  uint64_t v18;
  _BOOL4 v19;
  int v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  unsigned int v43;
  NSObject *v44;
  uint64_t v45;
  NSObject *v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  _BOOL4 v50;
  const char *aSelector;
  id v52;
  _QWORD v53[4];
  id v54;
  _QWORD v55[4];
  id v56;
  uint8_t buf[4];
  _BYTE v58[10];
  id v59;
  __int16 v60;
  uint64_t v61;
  __int16 v62;
  void *v63;
  __int16 v64;
  uint64_t v65;
  __int16 v66;
  _BOOL4 v67;
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!-[HUHomeHubMigrationOnboardingFlow shouldShowResidentWarning](self, "shouldShowResidentWarning"))
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v5, "residentDevices");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "na_filter:", &__block_literal_global_52_0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v5, "residentDevices");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setWithArray:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "na_filter:", &__block_literal_global_53_1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v9, "count"))
    {
      v14 = objc_msgSend(v9, "count");
      objc_msgSend(v5, "residentDevices");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v14 == objc_msgSend(v15, "count");

    }
    else
    {
      v16 = 0;
    }
    objc_msgSend(v5, "residentDevices");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "count");

    v19 = (objc_msgSend(v5, "hf_hasAppleTVs") & 1) == 0 && objc_msgSend(v13, "count") != 0;
    if (v18)
      v20 = v16;
    else
      v20 = 1;
    v21 = v20 | v19;
    if ((_DWORD)v21 == 1)
      -[HUHomeHubMigrationOnboardingFlow setHasiPadOnlyHub:](self, "setHasiPadOnlyHub:", objc_msgSend(v9, "count") != 0);
    -[HUHomeHubMigrationOnboardingFlow setShouldShowResidentWarning:](self, "setShouldShowResidentWarning:", v21);
    HFLogForCategory();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v9, "count");
      objc_msgSend(v5, "residentDevices");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413314;
      *(_QWORD *)v58 = v23;
      *(_WORD *)&v58[8] = 2112;
      v59 = v5;
      v60 = 2048;
      v61 = v24;
      v62 = 2112;
      v63 = v9;
      v64 = 2048;
      v65 = objc_msgSend(v25, "count");
      _os_log_impl(&dword_1B8E1E000, v22, OS_LOG_TYPE_DEFAULT, "%@ - home = %@, number of ipad resident devices = %lu, iPadResidentDevices = %@, number of total residents = %lu.", buf, 0x34u);

    }
  }
  if (!-[HUHomeHubMigrationOnboardingFlow shouldBlockMigrationWithAppleTVWarning](self, "shouldBlockMigrationWithAppleTVWarning"))
  {
    aSelector = a2;
    objc_msgSend(v5, "hf_appleTVs");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "na_map:", &__block_literal_global_56_0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    v28 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v5, "residentDevices");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setWithArray:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = MEMORY[0x1E0C809B0];
    v55[0] = MEMORY[0x1E0C809B0];
    v55[1] = 3221225472;
    v55[2] = __63__HUHomeHubMigrationOnboardingFlow__checkResidentStatusInHome___block_invoke_2_57;
    v55[3] = &unk_1E6F54958;
    v32 = v27;
    v56 = v32;
    objc_msgSend(v30, "na_filter:", v55);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v33, "na_filter:", &__block_literal_global_58_2);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "hf_homePods");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "na_map:", &__block_literal_global_59_1);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    v37 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v5, "residentDevices");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setWithArray:", v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v53[0] = v31;
    v53[1] = 3221225472;
    v53[2] = __63__HUHomeHubMigrationOnboardingFlow__checkResidentStatusInHome___block_invoke_5;
    v53[3] = &unk_1E6F54958;
    v54 = v36;
    v52 = v36;
    objc_msgSend(v39, "na_filter:", v53);
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v34, "count"))
    {
      -[HUHomeHubMigrationOnboardingFlow setShouldShowAppleTVWarning:](self, "setShouldShowAppleTVWarning:", 1);
      v41 = objc_msgSend(v34, "count");
      v42 = objc_msgSend(v33, "count");
      v43 = objc_msgSend(v40, "hmf_isEmpty");
      HFLogForCategory();
      v44 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)v58 = v41 != v42;
        *(_WORD *)&v58[4] = 1024;
        *(_DWORD *)&v58[6] = v43 ^ 1;
        _os_log_impl(&dword_1B8E1E000, v44, OS_LOG_TYPE_DEFAULT, "hasHH2SupportedAppleTV = %d, hasHH2SupportedHomePod = %d", buf, 0xEu);
      }

      if (v41 == v42)
        v45 = v43;
      else
        v45 = 0;
      -[HUHomeHubMigrationOnboardingFlow setShouldBlockMigrationWithAppleTVWarning:](self, "setShouldBlockMigrationWithAppleTVWarning:", v45);
    }
    HFLogForCategory();
    v46 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(aSelector);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = objc_msgSend(v34, "count");
      v49 = objc_msgSend(v33, "count");
      v50 = -[HUHomeHubMigrationOnboardingFlow shouldBlockMigrationWithAppleTVWarning](self, "shouldBlockMigrationWithAppleTVWarning");
      *(_DWORD *)buf = 138413570;
      *(_QWORD *)v58 = v47;
      *(_WORD *)&v58[8] = 2112;
      v59 = v5;
      v60 = 2048;
      v61 = v48;
      v62 = 2112;
      v63 = v34;
      v64 = 2048;
      v65 = v49;
      v66 = 1024;
      v67 = v50;
      _os_log_impl(&dword_1B8E1E000, v46, OS_LOG_TYPE_DEFAULT, "%@ - home = %@, number of Apple TV resident devices that need a software update = %lu, appleTVResidentDevicesToUpdate = %@, number of total Apple TV residents = %lu, blocking migration = %d", buf, 0x3Au);

    }
  }

}

uint64_t __63__HUHomeHubMigrationOnboardingFlow__checkResidentStatusInHome___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_isResidentiPad");
}

uint64_t __63__HUHomeHubMigrationOnboardingFlow__checkResidentStatusInHome___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;

  v2 = a2;
  if (objc_msgSend(v2, "hf_isResidentAppleTV"))
  {
    objc_msgSend(v2, "device");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "supportsHH2") ^ 1;

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

id __63__HUHomeHubMigrationOnboardingFlow__checkResidentStatusInHome___block_invoke_54(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "device");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __63__HUHomeHubMigrationOnboardingFlow__checkResidentStatusInHome___block_invoke_2_57(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "device");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v2) = objc_msgSend(v2, "containsObject:", v5);

  LODWORD(v4) = objc_msgSend(v3, "hf_isResidentAppleTV");
  return v4 & v2;
}

uint64_t __63__HUHomeHubMigrationOnboardingFlow__checkResidentStatusInHome___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "device");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "supportsHH2") ^ 1;

  return v3;
}

id __63__HUHomeHubMigrationOnboardingFlow__checkResidentStatusInHome___block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "device");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __63__HUHomeHubMigrationOnboardingFlow__checkResidentStatusInHome___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  void *v9;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "device");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "containsObject:", v6);

  if ((objc_msgSend(v3, "hf_isResidentiPad") & 1) != 0 || (objc_msgSend(v3, "hf_isResidentAppleTV") & 1) != 0)
  {
    v8 = 0;
  }
  else
  {
    objc_msgSend(v3, "device");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v9, "supportsHH2") & v7;

  }
  return v8;
}

- (HMHome)home
{
  return self->_home;
}

- (void)setHome:(id)a3
{
  objc_storeStrong((id *)&self->_home, a3);
}

- (NAFuture)onboardingFuture
{
  return self->_onboardingFuture;
}

- (void)setOnboardingFuture:(id)a3
{
  objc_storeStrong((id *)&self->_onboardingFuture, a3);
}

- (HUConfigurationViewController)initialViewController
{
  return self->_initialViewController;
}

- (void)setInitialViewController:(id)a3
{
  objc_storeStrong((id *)&self->_initialViewController, a3);
}

- (BOOL)shouldAbortAllOnboarding
{
  return self->_shouldAbortAllOnboarding;
}

- (BOOL)shouldAbortThisOnboardingFlowGroup
{
  return self->_shouldAbortThisOnboardingFlowGroup;
}

- (NSArray)homes
{
  return self->_homes;
}

- (void)setHomes:(id)a3
{
  objc_storeStrong((id *)&self->_homes, a3);
}

- (NSArray)sharedHomes
{
  return self->_sharedHomes;
}

- (void)setSharedHomes:(id)a3
{
  objc_storeStrong((id *)&self->_sharedHomes, a3);
}

- (NSSet)devices
{
  return self->_devices;
}

- (void)setDevices:(id)a3
{
  objc_storeStrong((id *)&self->_devices, a3);
}

- (NSArray)homePodsToUpdate
{
  return self->_homePodsToUpdate;
}

- (void)setHomePodsToUpdate:(id)a3
{
  objc_storeStrong((id *)&self->_homePodsToUpdate, a3);
}

- (NSArray)appleTVsToUpdate
{
  return self->_appleTVsToUpdate;
}

- (void)setAppleTVsToUpdate:(id)a3
{
  objc_storeStrong((id *)&self->_appleTVsToUpdate, a3);
}

- (BOOL)hasiPadOnlyHub
{
  return self->_hasiPadOnlyHub;
}

- (void)setHasiPadOnlyHub:(BOOL)a3
{
  self->_hasiPadOnlyHub = a3;
}

- (BOOL)shouldShowResidentWarning
{
  return self->_shouldShowResidentWarning;
}

- (void)setShouldShowResidentWarning:(BOOL)a3
{
  self->_shouldShowResidentWarning = a3;
}

- (BOOL)shouldShowAppleTVWarning
{
  return self->_shouldShowAppleTVWarning;
}

- (void)setShouldShowAppleTVWarning:(BOOL)a3
{
  self->_shouldShowAppleTVWarning = a3;
}

- (BOOL)shouldBlockMigrationWithAppleTVWarning
{
  return self->_shouldBlockMigrationWithAppleTVWarning;
}

- (void)setShouldBlockMigrationWithAppleTVWarning:(BOOL)a3
{
  self->_shouldBlockMigrationWithAppleTVWarning = a3;
}

- (BOOL)shouldShowUserWarning
{
  return self->_shouldShowUserWarning;
}

- (void)setShouldShowUserWarning:(BOOL)a3
{
  self->_shouldShowUserWarning = a3;
}

- (BOOL)shouldShowDeviceWarning
{
  return self->_shouldShowDeviceWarning;
}

- (void)setShouldShowDeviceWarning:(BOOL)a3
{
  self->_shouldShowDeviceWarning = a3;
}

- (BOOL)shouldShowSharedHomeWarning
{
  return self->_shouldShowSharedHomeWarning;
}

- (void)setShouldShowSharedHomeWarning:(BOOL)a3
{
  self->_shouldShowSharedHomeWarning = a3;
}

- (unint64_t)upgradeRequirements
{
  return self->_upgradeRequirements;
}

- (void)setUpgradeRequirements:(unint64_t)a3
{
  self->_upgradeRequirements = a3;
}

- (NSMapTable)homesToUsersMap
{
  return self->_homesToUsersMap;
}

- (void)setHomesToUsersMap:(id)a3
{
  objc_storeStrong((id *)&self->_homesToUsersMap, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homesToUsersMap, 0);
  objc_storeStrong((id *)&self->_appleTVsToUpdate, 0);
  objc_storeStrong((id *)&self->_homePodsToUpdate, 0);
  objc_storeStrong((id *)&self->_devices, 0);
  objc_storeStrong((id *)&self->_sharedHomes, 0);
  objc_storeStrong((id *)&self->_homes, 0);
  objc_storeStrong((id *)&self->_initialViewController, 0);
  objc_storeStrong((id *)&self->_onboardingFuture, 0);
  objc_storeStrong((id *)&self->_home, 0);
}

@end
