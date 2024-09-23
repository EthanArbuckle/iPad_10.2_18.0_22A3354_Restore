@implementation HRElectrocardiogramOnboardingManager

+ (id)electrocardiogramPossibleResultsViewControllerForSample:(id)a3 forAlgorithmVersion:(int64_t)a4
{
  id v5;
  __objc2_class **v6;
  void *v7;

  v5 = a3;
  if (a4 == 1)
  {
    v6 = off_24D34A140;
  }
  else
  {
    if (a4 != 2)
    {
      v7 = 0;
      goto LABEL_7;
    }
    v6 = off_24D34A120;
  }
  v7 = (void *)objc_msgSend(objc_alloc(*v6), "initWithSample:", v5);
LABEL_7:

  return v7;
}

+ (id)electrocardiogramPossibleResultsViewControllerForSample:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "electrocardiogramPossibleResultsViewControllerForSample:forAlgorithmVersion:", v4, +[HRElectrocardiogramOnboardingManager algorithmVersionForSample:](HRElectrocardiogramOnboardingManager, "algorithmVersionForSample:", v4));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)electrocardiogramPossibleResultsViewControllerForAlgorithmVersion:(int64_t)a3 forOnboarding:(BOOL)a4
{
  __objc2_class **v4;
  void *v5;

  if (a3 == 1)
  {
    v4 = off_24D34A140;
  }
  else
  {
    if (a3 != 2)
    {
      v5 = 0;
      return v5;
    }
    v4 = off_24D34A120;
  }
  v5 = (void *)objc_msgSend(objc_alloc(*v4), "initForOnboarding:", a4);
  return v5;
}

+ (int64_t)algorithmVersionForSample:(id)a3
{
  void *v3;
  void *v4;
  int64_t v5;

  objc_msgSend(a3, "_algorithmVersion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "integerValue");
  else
    v5 = 1;

  return v5;
}

+ (BOOL)hasOverriddenOnboardingSettings
{
  int v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = objc_msgSend(MEMORY[0x24BDD4198], "isAppleInternalInstall");
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCF50], "hk_heartRhythmDefaults");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKey:", *MEMORY[0x24BDD2BC8]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "unsignedIntegerValue");

    LOBYTE(v2) = objc_msgSend(MEMORY[0x24BDD3D70], "isOverridePresent");
    if (v5)
      LOBYTE(v2) = 1;
  }
  return v2;
}

- (HRElectrocardiogramOnboardingManager)initWithOnboardingType:(int64_t)a3 isFirstTimeOnboarding:(BOOL)a4 healthStore:(id)a5 dateCache:(id)a6 provenance:(int64_t)a7 delegate:(id)a8 isSampleInteractive:(BOOL)a9
{
  _BOOL8 v12;
  id v15;
  id v16;
  id v17;
  HRElectrocardiogramOnboardingManager *v18;
  HRElectrocardiogramOnboardingManager *v19;
  id v20;
  uint64_t v21;
  HKFeatureAvailabilityStore *availabilityStore;
  uint64_t v23;
  HKOnboardingManager *onboardingManager;
  objc_super v26;

  v12 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a8;
  v26.receiver = self;
  v26.super_class = (Class)HRElectrocardiogramOnboardingManager;
  v18 = -[HRElectrocardiogramOnboardingManager init](&v26, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeWeak((id *)&v18->_delegate, v17);
    v19->_isFirstTimeOnboarding = v12;
    v19->_isSampleInteractive = a9;
    v19->_provenance = a7;
    v20 = objc_alloc(MEMORY[0x24BDD3BE0]);
    v21 = objc_msgSend(v20, "initWithFeatureIdentifier:healthStore:", *MEMORY[0x24BDD2DE0], v15);
    availabilityStore = v19->_availabilityStore;
    v19->_availabilityStore = (HKFeatureAvailabilityStore *)v21;

    v23 = objc_msgSend(objc_alloc(MEMORY[0x24BE4A758]), "initWithOnboardingType:isFirstTimeOnboarding:healthStore:dateCache:", a3, v12, v15, v16);
    onboardingManager = v19->_onboardingManager;
    v19->_onboardingManager = (HKOnboardingManager *)v23;

    -[HKOnboardingManager setDataSource:](v19->_onboardingManager, "setDataSource:", v19);
    -[HKOnboardingManager setDelegate:](v19->_onboardingManager, "setDelegate:", v19);
  }

  return v19;
}

- (id)onboardingNavigationController
{
  void *v2;
  void *v3;

  -[HRElectrocardiogramOnboardingManager onboardingManager](self, "onboardingManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "onboardingNavigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)dismissOnboarding
{
  id v2;

  -[HRElectrocardiogramOnboardingManager onboardingManager](self, "onboardingManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dismissOnboarding");

}

- (int64_t)availableAlgorithmVersion
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  int64_t v9;

  -[HRElectrocardiogramOnboardingManager onboardingManager](self, "onboardingManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("HROnboardingElectrocardiogramAlgorithmVersionKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6 || (v7 = objc_msgSend(v6, "integerValue"), v7 == *MEMORY[0x24BDD4290]))
  {
    _HKInitializeLogging();
    v8 = (void *)*MEMORY[0x24BDD3010];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3010], OS_LOG_TYPE_ERROR))
      -[HRElectrocardiogramOnboardingManager availableAlgorithmVersion].cold.1((uint64_t)self, v8, a2);
  }
  v9 = objc_msgSend(v6, "integerValue");

  return v9;
}

- (int64_t)upgradingFromAlgorithmVersion
{
  return 1;
}

- (id)availableOnboardingStepsForOnboardingManager:(id)a3
{
  return &unk_24D357F90;
}

- (id)onboardingManager:(id)a3 sequenceForStep:(int64_t)a4 onboardingType:(int64_t)a5
{
  void *v5;
  id v9;
  uint64_t v10;
  int64_t v11;
  int64_t v12;

  v9 = a3;
  if (a4 != 2)
  {
    if (a4 != 1)
      goto LABEL_12;
    if (a5 == 1)
    {
      objc_msgSend(MEMORY[0x24BE4A768], "upgradingElectrocardiogramAvailabilitySequence");
      v10 = objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    }
    if (!a5)
    {
      objc_msgSend(MEMORY[0x24BE4A768], "firstTimeElectrocardiogramAvailabilitySequence");
      v10 = objc_claimAutoreleasedReturnValue();
LABEL_11:
      v5 = (void *)v10;
      goto LABEL_12;
    }
  }
  v11 = -[HRElectrocardiogramOnboardingManager availableAlgorithmVersion](self, "availableAlgorithmVersion");
  if (a5 == 1)
  {
    v12 = -[HRElectrocardiogramOnboardingManager upgradingFromAlgorithmVersion](self, "upgradingFromAlgorithmVersion");
    objc_msgSend(MEMORY[0x24BE4A768], "upgradingElectrocardiogramSequenceFromAlgorithmVersion:toAlgorithmVersion:", v12, v11);
    v10 = objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  if (!a5)
  {
    objc_msgSend(MEMORY[0x24BE4A768], "firstTimeElectrocardiogramOnboardingSequenceWithAlgorithmVersion:", v11);
    v10 = objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
LABEL_12:

  return v5;
}

- (id)onboardingManager:(id)a3 customViewControllerForPage:(id)a4
{
  uint64_t v5;
  id v6;

  v5 = objc_msgSend(a4, "sequencePage", a3);
  if (v5 == 8)
  {
    v6 = -[HROnboardingElectrocardiogramUpdateCompleteViewController initForOnboarding:upgradingFromAlgorithmVersion:electrocardiogramDelegate:]([HROnboardingElectrocardiogramUpdateCompleteViewController alloc], "initForOnboarding:upgradingFromAlgorithmVersion:electrocardiogramDelegate:", 1, -[HRElectrocardiogramOnboardingManager upgradingFromAlgorithmVersion](self, "upgradingFromAlgorithmVersion"), self);
  }
  else if (v5 == 7)
  {
    v6 = -[HROnboardingElectrocardiogramSetupCompleteViewController initForOnboarding:isSampleInteractive:electrocardiogramDelegate:]([HROnboardingElectrocardiogramSetupCompleteViewController alloc], "initForOnboarding:isSampleInteractive:electrocardiogramDelegate:", 1, -[HRElectrocardiogramOnboardingManager isSampleInteractive](self, "isSampleInteractive"), self);
  }
  else if (v5)
  {
    v6 = 0;
  }
  else
  {
    v6 = -[HROnboardingElectrocardiogramAvailabilityViewController initForOnboarding:provenance:]([HROnboardingElectrocardiogramAvailabilityViewController alloc], "initForOnboarding:provenance:", 1, -[HRElectrocardiogramOnboardingManager provenance](self, "provenance"));
  }
  return v6;
}

- (void)didBeginOnboardingForOnboardingManager:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  if (!objc_msgSend(a3, "onboardingType"))
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[HRElectrocardiogramOnboardingManager onboardingManager](self, "onboardingManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "userInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v4, CFSTR("HROnboardingElectrocardiogramStartDateKey"));

    objc_msgSend(MEMORY[0x24BDBCF50], "hk_heartRhythmDefaults");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "hk_setElectrocardiogramFirstRecordingCompleted:", 0);

  }
}

- (void)onboardingManager:(id)a3 willMoveToPage:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;

  v20 = a3;
  v6 = objc_msgSend(a4, "sequencePage");
  v7 = 1;
  switch(v6)
  {
    case 0:
      goto LABEL_10;
    case 1:
      v7 = 2;
      goto LABEL_10;
    case 4:
      v7 = 5;
      goto LABEL_10;
    case 5:
      v7 = 6;
      goto LABEL_10;
    case 6:
      -[HRElectrocardiogramOnboardingManager recordOnboardingAsCompleted](self, "recordOnboardingAsCompleted");
      v7 = 7;
      goto LABEL_10;
    case 7:
      -[HRElectrocardiogramOnboardingManager onboardingManager](self, "onboardingManager");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "userInfo");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("HROnboardingElectrocardiogramDidCompleteRecordingKey"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "BOOLValue");

      if (v11)
        v7 = 9;
      else
        v7 = 10;
      goto LABEL_10;
    case 8:
      -[HRElectrocardiogramOnboardingManager recordOnboardingAsCompleted](self, "recordOnboardingAsCompleted");
      v7 = 8;
LABEL_10:
      if ((objc_msgSend((id)objc_opt_class(), "hasOverriddenOnboardingSettings") & 1) == 0)
      {
        -[HRElectrocardiogramOnboardingManager onboardingManager](self, "onboardingManager");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "userInfo");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("HROnboardingElectrocardiogramAlgorithmVersionKey"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
        {
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(MEMORY[0x24BDD3B70], "onboardingVersionForKnownAlgorithmVersion:", objc_msgSend(v14, "integerValue")));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v15 = 0;
        }
        +[HRUIAnalyticsManager sharedManager](HRUIAnalyticsManager, "sharedManager");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v20, "onboardingType");
        objc_msgSend(v20, "userInfo");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("HROnboardingElectrocardiogramCountryCodeKey"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "trackElectrocardiogramOnboardingStep:forOnboardingType:onboardingVersion:countryCode:provenance:", v7, v17, v15, v19, -[HRElectrocardiogramOnboardingManager provenance](self, "provenance"));

      }
      break;
    default:
      break;
  }

}

- (void)recordOnboardingAsCompleted
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[HRElectrocardiogramOnboardingManager onboardingManager](self, "onboardingManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("HROnboardingElectrocardiogramCountryCodeKey"));
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[HRElectrocardiogramOnboardingManager availabilityStore](self, "availabilityStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCurrentOnboardingVersionCompletedForCountryCode:countryCodeProvenance:date:settings:completion:", v7, 0, v6, 0, &__block_literal_global_2);

}

void __67__HRElectrocardiogramOnboardingManager_recordOnboardingAsCompleted__block_invoke()
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x24BDBCF50], "hk_heartRhythmDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "removeObjectForKey:", *MEMORY[0x24BDD2BC8]);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "postNotificationName:object:", CFSTR("HRElectrocardiogramOnboardingCompletedNotificationName"), 0);

}

- (void)didCancelOnboardingForOnboardingManager:(id)a3
{
  void *v4;
  char v5;
  id v6;

  -[HRElectrocardiogramOnboardingManager delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[HRElectrocardiogramOnboardingManager delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "didDismissOnboarding");

  }
}

- (void)didCompleteOnboardingForOnboardingManager:(id)a3
{
  void *v4;
  char v5;
  id v6;

  -[HRElectrocardiogramOnboardingManager delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[HRElectrocardiogramOnboardingManager delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "didCompleteOnboarding");

  }
}

- (void)didTapOnElectrocardiogram:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[HRElectrocardiogramOnboardingManager delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[HRElectrocardiogramOnboardingManager delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "didTapOnElectrocardiogram:", v7);

  }
}

- (void)didTapOnShowDevicesInWatchApp
{
  void *v2;
  id v3;

  v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initWithString:", CFSTR("bridge:root=ActiveWatch"));
  objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "openSensitiveURL:withOptions:", v3, 0);

}

- (int64_t)provenance
{
  return self->_provenance;
}

- (HKOnboardingManager)onboardingManager
{
  return self->_onboardingManager;
}

- (BOOL)isFirstTimeOnboarding
{
  return self->_isFirstTimeOnboarding;
}

- (BOOL)isSampleInteractive
{
  return self->_isSampleInteractive;
}

- (HRElectrocardiogramOnboardingManagerDelegate)delegate
{
  return (HRElectrocardiogramOnboardingManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (HKFeatureAvailabilityStore)availabilityStore
{
  return self->_availabilityStore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_availabilityStore, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_onboardingManager, 0);
}

- (void)availableAlgorithmVersion
{
  NSObject *v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  NSStringFromSelector(a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138543618;
  v8 = a1;
  v9 = 2114;
  v10 = v6;
  _os_log_error_impl(&dword_215454000, v5, OS_LOG_TYPE_ERROR, "[%{public}@ %{public}@] Available algorithm version accessed without being set first.", (uint8_t *)&v7, 0x16u);

}

@end
