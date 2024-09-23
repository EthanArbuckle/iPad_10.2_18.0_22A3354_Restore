@implementation HUUpgradeMultiUserDevicesOnboardingFlow

- (HUUpgradeMultiUserDevicesOnboardingFlow)initWithUpgradeRequirements:(unint64_t)a3 home:(id)a4
{
  id v7;
  HUUpgradeMultiUserDevicesOnboardingFlow *v8;
  HUUpgradeMultiUserDevicesOnboardingFlow *v9;
  void *v10;
  uint64_t v11;
  NAFuture *onboardingFuture;
  _QWORD v14[4];
  id v15[2];
  id location;
  objc_super v17;

  v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)HUUpgradeMultiUserDevicesOnboardingFlow;
  v8 = -[HUUpgradeMultiUserDevicesOnboardingFlow init](&v17, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_home, a4);
    objc_initWeak(&location, v9);
    objc_msgSend((id)objc_opt_class(), "needsOnboardingForHome:options:", v7, MEMORY[0x1E0C9AA70]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __76__HUUpgradeMultiUserDevicesOnboardingFlow_initWithUpgradeRequirements_home___block_invoke;
    v14[3] = &unk_1E6F4C6B8;
    objc_copyWeak(v15, &location);
    v15[1] = (id)a3;
    objc_msgSend(v10, "flatMap:", v14);
    v11 = objc_claimAutoreleasedReturnValue();
    onboardingFuture = v9->_onboardingFuture;
    v9->_onboardingFuture = (NAFuture *)v11;

    objc_destroyWeak(v15);
    objc_destroyWeak(&location);
  }

  return v9;
}

id __76__HUUpgradeMultiUserDevicesOnboardingFlow_initWithUpgradeRequirements_home___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  id v11[2];

  v3 = a2;
  v4 = (void *)MEMORY[0x1E0D519C0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __76__HUUpgradeMultiUserDevicesOnboardingFlow_initWithUpgradeRequirements_home___block_invoke_2;
  v9[3] = &unk_1E6F4C690;
  objc_copyWeak(v11, (id *)(a1 + 32));
  v5 = v3;
  v6 = *(void **)(a1 + 40);
  v10 = v5;
  v11[1] = v6;
  objc_msgSend(v4, "futureWithBlock:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(v11);
  return v7;
}

void __76__HUUpgradeMultiUserDevicesOnboardingFlow_initWithUpgradeRequirements_home___block_invoke_2(uint64_t a1, void *a2)
{
  id WeakRetained;
  HUUpgradeMultiUserDevicesViewController *v4;
  uint64_t v5;
  void *v6;
  HUUpgradeMultiUserDevicesViewController *v7;
  id v8;

  v8 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (objc_msgSend(*(id *)(a1 + 32), "BOOLValue"))
  {
    v4 = [HUUpgradeMultiUserDevicesViewController alloc];
    v5 = *(_QWORD *)(a1 + 48);
    objc_msgSend(WeakRetained, "home");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[HUUpgradeMultiUserDevicesViewController initWithUpgradeRequirements:home:](v4, "initWithUpgradeRequirements:home:", v5, v6);
    objc_msgSend(WeakRetained, "setInitialViewController:", v7);

  }
  else
  {
    objc_msgSend(v8, "finishWithNoResult");
  }

}

- (NSString)description
{
  return (NSString *)CFSTR("Upgrade Multi User Devices");
}

- (id)processUserInput:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v10;
  HUUpgradeMultiUserDevicesOnboardingFlow *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  HFLogForCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412802;
    v11 = self;
    v12 = 2112;
    v13 = v7;
    v14 = 2112;
    v15 = v5;
    _os_log_impl(&dword_1B8E1E000, v6, OS_LOG_TYPE_DEFAULT, "%@:%@ with input results: %@", (uint8_t *)&v10, 0x20u);

  }
  -[HUUpgradeMultiUserDevicesOnboardingFlow onboardingFuture](self, "onboardingFuture");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "finishWithNoResult");

  return 0;
}

+ (id)needsOnboardingForHome:(id)a3 options:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", MEMORY[0x1E0C9AAB0], a4);
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

- (BOOL)shouldAbortThisOnboardingFlowGroup
{
  return self->_shouldAbortThisOnboardingFlowGroup;
}

- (void)setShouldAbortThisOnboardingFlowGroup:(BOOL)a3
{
  self->_shouldAbortThisOnboardingFlowGroup = a3;
}

- (BOOL)shouldAbortAllOnboarding
{
  return self->_shouldAbortAllOnboarding;
}

- (void)setShouldAbortAllOnboarding:(BOOL)a3
{
  self->_shouldAbortAllOnboarding = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initialViewController, 0);
  objc_storeStrong((id *)&self->_onboardingFuture, 0);
  objc_storeStrong((id *)&self->_home, 0);
}

@end
