@implementation HROnboardingAtrialFibrillationLimitationViewController

- (id)initForOnboarding:(BOOL)a3 upgradingFromAlgorithmVersion:(int64_t)a4
{
  _BOOL8 v5;
  void *v7;
  HROnboardingAtrialFibrillationLimitationViewController *v8;
  BOOL v9;
  objc_super v11;

  v5 = a3;
  +[HROnboardingAtrialFibrillationLimitationViewController makeSpeedBumpItem](HROnboardingAtrialFibrillationLimitationViewController, "makeSpeedBumpItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11.receiver = self;
  v11.super_class = (Class)HROnboardingAtrialFibrillationLimitationViewController;
  v8 = -[HRSpeedBumpViewController initWithSpeedBumpItem:onboarding:upgradingFromAlgorithmVersion:](&v11, sel_initWithSpeedBumpItem_onboarding_upgradingFromAlgorithmVersion_, v7, v5, a4);

  if (v8)
    v9 = !v5;
  else
    v9 = 1;
  if (!v9)
    -[HKOnboardingBaseViewController configureNavigationButtonWithTypeCancelWithConfirmForAtrialFibrillation](v8, "configureNavigationButtonWithTypeCancelWithConfirmForAtrialFibrillation");
  return v8;
}

+ (id)makeSpeedBumpItem
{
  void *v2;
  void *v3;
  void *v4;
  HRSpeedBumpBubble *v5;
  void *v6;
  void *v7;
  HRSpeedBumpBubble *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  HRSpeedBumpBubble *v13;
  void *v14;
  void *v15;
  HRSpeedBumpBubble *v16;
  void *v17;
  HRSpeedBumpItem *v18;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[5];

  v25[4] = *MEMORY[0x24BDAC8D0];
  HRHeartRhythmUIFrameworkBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("ATRIAL_FIBRILLATION_DETECTION_ONBOARDING_SHOULD_KNOW_TITLE"), &stru_24D34B1B8, CFSTR("HeartRhythmUI-Localizable-Antimony"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  HRHeartRhythmUIFrameworkBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("ATRIAL_FIBRILLATION_DETECTION_ONBOARDING_SHOULD_KNOW_BULLET_1_TITLE"), &stru_24D34B1B8, CFSTR("HeartRhythmUI-Localizable-Antimony"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  HRHeartRhythmUIFrameworkBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("ATRIAL_FIBRILLATION_DETECTION_ONBOARDING_SHOULD_KNOW_BULLET_1_BODY"), &stru_24D34B1B8, CFSTR("HeartRhythmUI-Localizable-Antimony"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = -[HRSpeedBumpBubble initWithTitle:description:]([HRSpeedBumpBubble alloc], "initWithTitle:description:", v24, v23);
  HRHeartRhythmUIFrameworkBundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("ATRIAL_FIBRILLATION_DETECTION_ONBOARDING_SHOULD_KNOW_BULLET_2_TITLE"), &stru_24D34B1B8, CFSTR("HeartRhythmUI-Localizable-Antimony"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  HRHeartRhythmUIFrameworkBundle();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("ATRIAL_FIBRILLATION_DETECTION_ONBOARDING_SHOULD_KNOW_BULLET_2_BODY"), &stru_24D34B1B8, CFSTR("HeartRhythmUI-Localizable-Antimony"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[HRSpeedBumpBubble initWithTitle:description:]([HRSpeedBumpBubble alloc], "initWithTitle:description:", v21, v20);
  HRHeartRhythmUIFrameworkBundle();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("ATRIAL_FIBRILLATION_DETECTION_ONBOARDING_SHOULD_KNOW_BULLET_3_TITLE"), &stru_24D34B1B8, CFSTR("HeartRhythmUI-Localizable-Antimony"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  HRHeartRhythmUIFrameworkBundle();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("ATRIAL_FIBRILLATION_DETECTION_ONBOARDING_SHOULD_KNOW_BULLET_3_BODY"), &stru_24D34B1B8, CFSTR("HeartRhythmUI-Localizable-Antimony"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = -[HRSpeedBumpBubble initWithTitle:description:]([HRSpeedBumpBubble alloc], "initWithTitle:description:", v10, v12);
  HRHeartRhythmUIFrameworkBundle();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("ATRIAL_FIBRILLATION_DETECTION_ONBOARDING_SHOULD_KNOW_BULLET_4_TITLE"), &stru_24D34B1B8, CFSTR("HeartRhythmUI-Localizable-Antimony"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = -[HRSpeedBumpBubble initWithTitle:description:]([HRSpeedBumpBubble alloc], "initWithTitle:description:", v15, 0);
  v25[0] = v5;
  v25[1] = v8;
  v25[2] = v13;
  v25[3] = v16;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v25, 4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[HRSpeedBumpItem initWithTitle:body:bubbles:category:]([HRSpeedBumpItem alloc], "initWithTitle:body:bubbles:category:", v22, 0, v17, 2);

  return v18;
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
  v10 = __94__HROnboardingAtrialFibrillationLimitationViewController_viewControllerWillEnterAdaptiveModal__block_invoke;
  v11 = &unk_24D34A7B8;
  objc_copyWeak(&v12, &location);
  objc_msgSend(v4, "actionWithHandler:", &v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithBarButtonSystemItem:primaryAction:", 0, v5, v8, v9, v10, v11);

  -[HROnboardingAtrialFibrillationLimitationViewController navigationItem](self, "navigationItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLeftBarButtonItem:", v6);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __94__HROnboardingAtrialFibrillationLimitationViewController_viewControllerWillEnterAdaptiveModal__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)viewControllerDidLeaveAdaptiveModal
{
  id v2;

  -[HROnboardingAtrialFibrillationLimitationViewController navigationItem](self, "navigationItem");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setLeftBarButtonItem:", 0);

}

@end
