@implementation HRAtrialFibrillationOnboardingManager

- (HRAtrialFibrillationOnboardingManager)initWithOnboardingType:(int64_t)a3 isFirstTimeOnboarding:(BOOL)a4 healthStore:(id)a5 dateCache:(id)a6 provenance:(int64_t)a7 delegate:(id)a8
{
  _BOOL8 v11;
  id v14;
  id v15;
  id v16;
  HRAtrialFibrillationOnboardingManager *v17;
  HRAtrialFibrillationOnboardingManager *v18;
  _HRAtrialFibrillationOnboardingNavigationController *v19;
  _HRAtrialFibrillationOnboardingNavigationController *navigationController;
  uint64_t v21;
  HKOnboardingManager *onboardingManager;
  id v23;
  uint64_t v24;
  HKFeatureAvailabilityStore *featureAvailabilityStore;
  objc_super v27;

  v11 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a8;
  v27.receiver = self;
  v27.super_class = (Class)HRAtrialFibrillationOnboardingManager;
  v17 = -[HRAtrialFibrillationOnboardingManager init](&v27, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeWeak((id *)&v17->_delegate, v16);
    v18->_provenance = a7;
    v19 = objc_alloc_init(_HRAtrialFibrillationOnboardingNavigationController);
    navigationController = v18->_navigationController;
    v18->_navigationController = v19;

    v21 = objc_msgSend(objc_alloc(MEMORY[0x24BE4A758]), "initWithOnboardingType:isFirstTimeOnboarding:healthStore:dateCache:navigationController:", a3, v11, v14, v15, v18->_navigationController);
    onboardingManager = v18->_onboardingManager;
    v18->_onboardingManager = (HKOnboardingManager *)v21;

    -[HKOnboardingManager setDataSource:](v18->_onboardingManager, "setDataSource:", v18);
    -[HKOnboardingManager setDelegate:](v18->_onboardingManager, "setDelegate:", v18);
    v23 = objc_alloc(MEMORY[0x24BDD3BE0]);
    v24 = objc_msgSend(v23, "initWithFeatureIdentifier:healthStore:", *MEMORY[0x24BDD2E00], v14);
    featureAvailabilityStore = v18->_featureAvailabilityStore;
    v18->_featureAvailabilityStore = (HKFeatureAvailabilityStore *)v24;

    -[_HRAtrialFibrillationOnboardingNavigationController setOnboardingManager:](v18->_navigationController, "setOnboardingManager:", v18);
  }

  return v18;
}

- (id)onboardingNavigationController
{
  void *v2;
  void *v3;

  -[HRAtrialFibrillationOnboardingManager onboardingManager](self, "onboardingManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "onboardingNavigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)dismissOnboarding
{
  void *v3;

  -[HRAtrialFibrillationOnboardingManager onboardingManager](self, "onboardingManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dismissOnboarding");

  -[_HRAtrialFibrillationOnboardingNavigationController setOnboardingManager:](self->_navigationController, "setOnboardingManager:", 0);
}

- (id)availableOnboardingStepsForOnboardingManager:(id)a3
{
  return &unk_24D357F78;
}

- (id)onboardingManager:(id)a3 sequenceForStep:(int64_t)a4 onboardingType:(int64_t)a5
{
  void *v5;
  id v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v8 = a3;
  if (a4 != 2)
  {
    if (a4 != 1)
      goto LABEL_15;
    if (a5 != 1)
    {
      if (!a5)
      {
        objc_msgSend(MEMORY[0x24BE4A768], "firstTimeAtrialFibrillationAvailabilitySequence");
        v9 = objc_claimAutoreleasedReturnValue();
LABEL_9:
        v5 = (void *)v9;
        goto LABEL_15;
      }
      goto LABEL_15;
    }
    _HKInitializeLogging();
    v10 = *MEMORY[0x24BDD3010];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3010], OS_LOG_TYPE_ERROR))
      goto LABEL_13;
    goto LABEL_14;
  }
  if (a5 == 1)
  {
    _HKInitializeLogging();
    v10 = *MEMORY[0x24BDD3010];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3010], OS_LOG_TYPE_ERROR))
LABEL_13:
      -[HRAtrialFibrillationOnboardingManager onboardingManager:sequenceForStep:onboardingType:].cold.1(v10, v11, v12, v13, v14, v15, v16, v17);
LABEL_14:
    v5 = 0;
    goto LABEL_15;
  }
  if (!a5)
  {
    objc_msgSend(MEMORY[0x24BE4A768], "firstTimeAtrialFibrillationOnboardingSequence");
    v9 = objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
LABEL_15:

  return v5;
}

- (id)onboardingManager:(id)a3 customViewControllerForPage:(id)a4
{
  HROnboardingAtrialFibrillationGateViewController *v5;
  void *v6;
  id v7;

  if (objc_msgSend(a4, "sequencePage", a3) == 1)
  {
    v5 = [HROnboardingAtrialFibrillationGateViewController alloc];
    -[HRAtrialFibrillationOnboardingManager hasAtrialFibrillationDiagnosis](self, "hasAtrialFibrillationDiagnosis");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[HROnboardingAtrialFibrillationGateViewController initForOnboarding:hasAtrialFibrillationDiagnosis:](v5, "initForOnboarding:hasAtrialFibrillationDiagnosis:", 1, v6);

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (void)didBeginOnboardingForOnboardingManager:(id)a3
{
  id v4;

  +[HRUIAnalyticsManager sharedManager](HRUIAnalyticsManager, "sharedManager", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "trackAtrialFibrillationDetectionOnboardingStep:forOnboardingVersion:countryCode:provenance:", 0, 1, 0, -[HRAtrialFibrillationOnboardingManager provenance](self, "provenance"));

}

- (void)onboardingManager:(id)a3 willMoveToPage:(id)a4
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;

  v5 = objc_msgSend(a4, "sequencePage", a3);
  if (v5 == 4)
  {
    -[HRAtrialFibrillationOnboardingManager onboardingManager](self, "onboardingManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "userInfo");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("HROnboardingAtrialFibrillationCountryCodeKey"));
    v15 = (id)objc_claimAutoreleasedReturnValue();

    -[HRAtrialFibrillationOnboardingManager _setOnboardingCompletedForCountryCode:](self, "_setOnboardingCompletedForCountryCode:", v15);
    +[HRUIAnalyticsManager sharedManager](HRUIAnalyticsManager, "sharedManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "ISOCode");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "trackAtrialFibrillationDetectionOnboardingStep:forOnboardingVersion:countryCode:provenance:", 3, 1, v7, -[HRAtrialFibrillationOnboardingManager provenance](self, "provenance"));
  }
  else
  {
    if (v5 == 2)
    {
      +[HRUIAnalyticsManager sharedManager](HRUIAnalyticsManager, "sharedManager");
      v15 = (id)objc_claimAutoreleasedReturnValue();
      -[HRAtrialFibrillationOnboardingManager onboardingManager](self, "onboardingManager");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "userInfo");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("HROnboardingAtrialFibrillationCountryCodeKey"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "ISOCode");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[HRAtrialFibrillationOnboardingManager provenance](self, "provenance");
      v11 = v15;
      v12 = 2;
    }
    else
    {
      if (v5 != 1)
        return;
      +[HRUIAnalyticsManager sharedManager](HRUIAnalyticsManager, "sharedManager");
      v15 = (id)objc_claimAutoreleasedReturnValue();
      -[HRAtrialFibrillationOnboardingManager onboardingManager](self, "onboardingManager");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "userInfo");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("HROnboardingAtrialFibrillationCountryCodeKey"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "ISOCode");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[HRAtrialFibrillationOnboardingManager provenance](self, "provenance");
      v11 = v15;
      v12 = 1;
    }
    objc_msgSend(v11, "trackAtrialFibrillationDetectionOnboardingStep:forOnboardingVersion:countryCode:provenance:", v12, 1, v9, v10);

  }
}

- (void)_setOnboardingCompletedForCountryCode:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[5];

  v4 = a3;
  -[HRAtrialFibrillationOnboardingManager featureAvailabilityStore](self, "featureAvailabilityStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ISOCode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "provenance");

  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __79__HRAtrialFibrillationOnboardingManager__setOnboardingCompletedForCountryCode___block_invoke;
  v8[3] = &unk_24D34AB88;
  v8[4] = self;
  objc_msgSend(v5, "setCurrentOnboardingVersionCompletedForCountryCode:countryCodeProvenance:date:settings:completion:", v6, v7, 0, 0, v8);

}

void __79__HRAtrialFibrillationOnboardingManager__setOnboardingCompletedForCountryCode___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;

  v5 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    v6 = (void *)*MEMORY[0x24BDD3010];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3010], OS_LOG_TYPE_ERROR))
      __79__HRAtrialFibrillationOnboardingManager__setOnboardingCompletedForCountryCode___block_invoke_cold_1(a1, v6);
  }

}

- (void)didCancelOnboardingForOnboardingManager:(id)a3
{
  void *v4;
  char v5;
  void *v6;

  -[HRAtrialFibrillationOnboardingManager delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[HRAtrialFibrillationOnboardingManager delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "didDismissOnboarding");

  }
  -[_HRAtrialFibrillationOnboardingNavigationController setOnboardingManager:](self->_navigationController, "setOnboardingManager:", 0);
}

- (void)didCompleteOnboardingForOnboardingManager:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  -[HRAtrialFibrillationOnboardingManager onboardingManager](self, "onboardingManager", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userInfo");
  v5 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v5, "objectForKeyedSubscript:", CFSTR("HROnboardingAtrialFibrillationEnableNotificationsKey"));
  v8 = (id)objc_claimAutoreleasedReturnValue();

  -[HRAtrialFibrillationOnboardingManager _wrapUpOnboardingWithNotificationsEnabled:](self, "_wrapUpOnboardingWithNotificationsEnabled:", objc_msgSend(v8, "BOOLValue"));
  -[HRAtrialFibrillationOnboardingManager delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[HRAtrialFibrillationOnboardingManager delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "didCompleteOnboarding");

  }
}

- (void)_wrapUpOnboardingWithNotificationsEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];

  v3 = a3;
  -[HRAtrialFibrillationOnboardingManager featureAvailabilityStore](self, "featureAvailabilityStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x24BDD2EB0];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __83__HRAtrialFibrillationOnboardingManager__wrapUpOnboardingWithNotificationsEnabled___block_invoke;
  v13[3] = &unk_24D34AB88;
  v13[4] = self;
  objc_msgSend(v5, "setFeatureSettingNumber:forKey:completion:", v6, v7, v13);

  +[HRUIAnalyticsManager sharedManager](HRUIAnalyticsManager, "sharedManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRAtrialFibrillationOnboardingManager onboardingManager](self, "onboardingManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "userInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("HROnboardingAtrialFibrillationCountryCodeKey"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "ISOCode");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "trackAtrialFibrillationDetectionOnboardingStep:forOnboardingVersion:countryCode:provenance:", 4, 1, v12, -[HRAtrialFibrillationOnboardingManager provenance](self, "provenance"));

  -[HRAtrialFibrillationOnboardingManager _submitTipsDiscoverabilitySignal](self, "_submitTipsDiscoverabilitySignal");
}

void __83__HRAtrialFibrillationOnboardingManager__wrapUpOnboardingWithNotificationsEnabled___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  void *v10;
  char v11;
  _QWORD block[5];
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  _HKInitializeLogging();
  v6 = (void *)*MEMORY[0x24BDD3010];
  v7 = *MEMORY[0x24BDD3010];
  if (a2)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = v6;
      *(_DWORD *)buf = 138543362;
      v14 = (id)objc_opt_class();
      v9 = v14;
      _os_log_impl(&dword_215454000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@]: Successfully set IRN setting", buf, 0xCu);

    }
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_opt_respondsToSelector();

    if ((v11 & 1) != 0)
    {
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __83__HRAtrialFibrillationOnboardingManager__wrapUpOnboardingWithNotificationsEnabled___block_invoke_202;
      block[3] = &unk_24D34AAB0;
      block[4] = *(_QWORD *)(a1 + 32);
      dispatch_async(MEMORY[0x24BDAC9B8], block);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    __83__HRAtrialFibrillationOnboardingManager__wrapUpOnboardingWithNotificationsEnabled___block_invoke_cold_1(a1, v6);
  }

}

void __83__HRAtrialFibrillationOnboardingManager__wrapUpOnboardingWithNotificationsEnabled___block_invoke_202(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "didEnableAtrialFibrillationNotifications");

}

- (void)_submitTipsDiscoverabilitySignal
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  BiomeLibrary();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "Discoverability");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "Signals");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "source");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE0C3A0]), "initWithContentIdentifier:context:osBuild:userInfo:", CFSTR("com.apple.health.heart.irregular-rhythm-notifications-onboarding-completed"), 0, 0, 0);
  objc_msgSend(v4, "sendEvent:", v5);

}

- (int64_t)provenance
{
  return self->_provenance;
}

- (NSNumber)hasAtrialFibrillationDiagnosis
{
  return self->_hasAtrialFibrillationDiagnosis;
}

- (void)setHasAtrialFibrillationDiagnosis:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (HKOnboardingManager)onboardingManager
{
  return self->_onboardingManager;
}

- (_HRAtrialFibrillationOnboardingNavigationController)navigationController
{
  return self->_navigationController;
}

- (HRAtrialFibrillationOnboardingManagerDelegate)delegate
{
  return (HRAtrialFibrillationOnboardingManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (HKFeatureAvailabilityStore)featureAvailabilityStore
{
  return self->_featureAvailabilityStore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureAvailabilityStore, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_navigationController, 0);
  objc_storeStrong((id *)&self->_onboardingManager, 0);
  objc_storeStrong((id *)&self->_hasAtrialFibrillationDiagnosis, 0);
}

- (void)onboardingManager:(uint64_t)a3 sequenceForStep:(uint64_t)a4 onboardingType:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_215454000, a1, a3, "Error, there is no upgrade sequence for atrial fibrillation.", a5, a6, a7, a8, 0);
}

void __79__HRAtrialFibrillationOnboardingManager__setOnboardingCompletedForCountryCode___block_invoke_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  OUTLINED_FUNCTION_4(a1, a2);
  v3 = (void *)OUTLINED_FUNCTION_5();
  v4 = OUTLINED_FUNCTION_0_4(v3);
  OUTLINED_FUNCTION_1_2(&dword_215454000, v5, v6, "%{public}@: Failed to complete IRN onboarding with error: %{public}@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_2_0();
}

void __83__HRAtrialFibrillationOnboardingManager__wrapUpOnboardingWithNotificationsEnabled___block_invoke_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  OUTLINED_FUNCTION_4(a1, a2);
  v3 = (void *)OUTLINED_FUNCTION_5();
  v4 = OUTLINED_FUNCTION_0_4(v3);
  OUTLINED_FUNCTION_1_2(&dword_215454000, v5, v6, "[%{public}@]: Failed to set IRN setting: %{public}@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_2_0();
}

@end
