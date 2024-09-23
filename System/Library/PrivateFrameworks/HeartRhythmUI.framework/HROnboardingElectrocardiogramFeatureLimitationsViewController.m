@implementation HROnboardingElectrocardiogramFeatureLimitationsViewController

- (id)initForOnboarding:(BOOL)a3 upgradingFromAlgorithmVersion:(int64_t)a4
{
  _BOOL4 v4;
  HROnboardingElectrocardiogramFeatureLimitationsViewController *v5;
  HROnboardingElectrocardiogramFeatureLimitationsViewController *v6;
  BOOL v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HROnboardingElectrocardiogramFeatureLimitationsViewController;
  v5 = -[HRSpeedBumpViewController initWithSpeedBumpItem:onboarding:upgradingFromAlgorithmVersion:](&v9, sel_initWithSpeedBumpItem_onboarding_upgradingFromAlgorithmVersion_, 0, a3, a4);
  v6 = v5;
  if (v5)
    v7 = !v4;
  else
    v7 = 1;
  if (!v7)
    -[HKOnboardingBaseViewController configureNavigationButtonWithTypeCancelWithConfirmForElectrocardiogram](v5, "configureNavigationButtonWithTypeCancelWithConfirmForElectrocardiogram");
  return v6;
}

- (void)setDelegate:(id)a3
{
  id v4;
  void *v5;
  _BOOL8 v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HROnboardingElectrocardiogramFeatureLimitationsViewController;
  v4 = a3;
  -[HROnboardingElectrocardiogramFeatureLimitationsViewController setDelegate:](&v8, sel_setDelegate_, v4);
  objc_msgSend(v4, "healthStore", v8.receiver, v8.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[HROnboardingElectrocardiogramFeatureLimitationsViewController _hasOnboardedBeforeWithStore:](self, "_hasOnboardedBeforeWithStore:", v5);
  -[HROnboardingElectrocardiogramFeatureLimitationsViewController _makeSpeedBumpItemForUpdateOnboarding:](self, "_makeSpeedBumpItemForUpdateOnboarding:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRSpeedBumpViewController setItem:](self, "setItem:", v7);

}

- (BOOL)_hasOnboardedBeforeWithStore:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  id v12;

  v4 = a3;
  if (-[HROnboardingElectrocardiogramFeatureLimitationsViewController isOnboarding](self, "isOnboarding"))
  {
    objc_msgSend(MEMORY[0x24BDD3B70], "versionWithHealthStore:error:", v4, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = objc_alloc(MEMORY[0x24BDD3BE0]);
    v7 = (void *)objc_msgSend(v6, "initWithFeatureIdentifier:healthStore:", *MEMORY[0x24BDD2DE0], v4);
    v12 = 0;
    objc_msgSend(v7, "featureOnboardingRecordWithError:", &v12);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v12;
    if (!v8)
    {
      _HKInitializeLogging();
      v10 = *MEMORY[0x24BDD3010];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3010], OS_LOG_TYPE_ERROR))
        -[HROnboardingElectrocardiogramFeatureLimitationsViewController _hasOnboardedBeforeWithStore:].cold.1((uint64_t)self, (uint64_t)v9, v10);
    }
    objc_msgSend(v8, "onboardingCompletion");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5 != 0;
}

- (id)_makeSpeedBumpItemForUpdateOnboarding:(BOOL)a3
{
  __CFString *v3;
  void *v4;
  HRSpeedBumpBubble *v5;
  HRSpeedBumpBubble *v6;
  void *v7;
  HRSpeedBumpBubble *v8;
  void *v9;
  HRSpeedBumpBubble *v10;
  void *v11;
  HRSpeedBumpItem *v12;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[5];

  v19[4] = *MEMORY[0x24BDAC8D0];
  if (a3)
    v3 = CFSTR("ECG_V2_ONBOARDING_4_TITLE");
  else
    v3 = CFSTR("ECG_ONBOARDING_4_TITLE");
  HRUIECGLocalizedString(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  HRUIECGLocalizedString(CFSTR("ECG_ONBOARDING_4_BODY"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  HRUIECGLocalizedString(CFSTR("ECG_ONBOARDING_4_LIST_CANNOT_DO_HEADING-1"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  HRUIECGLocalizedString(CFSTR("ECG_ONBOARDING_4_LIST_CANNOT_DO_HEADING-2"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  HRUIECGLocalizedString(CFSTR("ECG_ONBOARDING_4_LIST_CANNOT_DO_HEADING-3"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  HRUIECGLocalizedString(CFSTR("ECG_ONBOARDING_4_LIST_CANNOT_DO_BODY-1"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[HRSpeedBumpBubble initWithTitle:description:]([HRSpeedBumpBubble alloc], "initWithTitle:description:", v18, v17);
  v6 = -[HRSpeedBumpBubble initWithTitle:description:]([HRSpeedBumpBubble alloc], "initWithTitle:description:", v15, 0);
  HRUIECGLocalizedString(CFSTR("ECG_ONBOARDING_4_LIST_CANNOT_DO_BODY-3"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HRSpeedBumpBubble initWithTitle:description:]([HRSpeedBumpBubble alloc], "initWithTitle:description:", v14, v7);
  HRUIECGLocalizedString(CFSTR("ECG_ONBOARDING_4_LIST_WARNING"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[HRSpeedBumpBubble initWithTitle:description:]([HRSpeedBumpBubble alloc], "initWithTitle:description:", v9, 0);
  v19[0] = v5;
  v19[1] = v6;
  v19[2] = v8;
  v19[3] = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[HRSpeedBumpItem initWithTitle:body:bubbles:category:]([HRSpeedBumpItem alloc], "initWithTitle:body:bubbles:category:", v4, v16, v11, 1);

  return v12;
}

- (void)viewControllerWillEnterAdaptiveModal
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  id v12;
  id location;

  objc_initWeak(&location, self);
  v3 = objc_alloc(MEMORY[0x24BDF6860]);
  v4 = (void *)MEMORY[0x24BDF67B8];
  v8 = MEMORY[0x24BDAC760];
  v9 = 3221225472;
  v10 = __101__HROnboardingElectrocardiogramFeatureLimitationsViewController_viewControllerWillEnterAdaptiveModal__block_invoke;
  v11 = &unk_24D34A7B8;
  objc_copyWeak(&v12, &location);
  objc_msgSend(v4, "actionWithHandler:", &v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithBarButtonSystemItem:primaryAction:", 0, v5, v8, v9, v10, v11);

  -[HROnboardingElectrocardiogramFeatureLimitationsViewController navigationItem](self, "navigationItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLeftBarButtonItem:", v6);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __101__HROnboardingElectrocardiogramFeatureLimitationsViewController_viewControllerWillEnterAdaptiveModal__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)viewControllerDidLeaveAdaptiveModal
{
  id v2;

  -[HROnboardingElectrocardiogramFeatureLimitationsViewController navigationItem](self, "navigationItem");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setLeftBarButtonItem:", 0);

}

- (void)_hasOnboardedBeforeWithStore:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138543618;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl(&dword_215454000, log, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to get onboarding version completed with error: %@", (uint8_t *)&v3, 0x16u);
}

@end
