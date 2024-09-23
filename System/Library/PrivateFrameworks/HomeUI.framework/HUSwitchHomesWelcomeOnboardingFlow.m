@implementation HUSwitchHomesWelcomeOnboardingFlow

- (HUSwitchHomesWelcomeOnboardingFlow)initWithHome:(id)a3
{
  id v6;
  HUSwitchHomesWelcomeOnboardingFlow *v7;
  HUSwitchHomesWelcomeOnboardingFlow *v8;
  NAFuture *v9;
  NAFuture *readyFuture;
  void *v11;
  uint64_t v12;
  NAFuture *onboardingFuture;
  _QWORD v15[4];
  id v16[2];
  id location;
  objc_super v18;

  v6 = a3;
  v18.receiver = self;
  v18.super_class = (Class)HUSwitchHomesWelcomeOnboardingFlow;
  v7 = -[HUSwitchHomesWelcomeOnboardingFlow init](&v18, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_home, a3);
    v9 = (NAFuture *)objc_alloc_init(MEMORY[0x1E0D519C0]);
    readyFuture = v8->_readyFuture;
    v8->_readyFuture = v9;

    objc_initWeak(&location, v8);
    +[HUSwitchHomesWelcomeOnboardingFlowUtilities currentUserHasUnfinishedFeatureOnboardingForHome:](HUSwitchHomesWelcomeOnboardingFlowUtilities, "currentUserHasUnfinishedFeatureOnboardingForHome:", v8->_home);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __51__HUSwitchHomesWelcomeOnboardingFlow_initWithHome___block_invoke;
    v15[3] = &unk_1E6F4C6B8;
    objc_copyWeak(v16, &location);
    v16[1] = (id)a2;
    objc_msgSend(v11, "flatMap:", v15);
    v12 = objc_claimAutoreleasedReturnValue();
    onboardingFuture = v8->_onboardingFuture;
    v8->_onboardingFuture = (NAFuture *)v12;

    objc_destroyWeak(v16);
    objc_destroyWeak(&location);
  }

  return v8;
}

id __51__HUSwitchHomesWelcomeOnboardingFlow_initWithHome___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  HUSwitchHomesWelcomeViewController *v5;
  void *v6;
  HUSwitchHomesWelcomeViewController *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v14;
  id v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ((HFForceSwitchHomeWelcomeOnboarding() & 1) != 0 || objc_msgSend(v3, "BOOLValue"))
  {
    v5 = [HUSwitchHomesWelcomeViewController alloc];
    objc_msgSend(WeakRetained, "home");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[HUSwitchHomesWelcomeViewController initWithHome:](v5, "initWithHome:", v6);
    objc_msgSend(WeakRetained, "setInitialViewController:", v7);

    objc_msgSend(WeakRetained, "readyFuture");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "finishWithResult:", MEMORY[0x1E0C9AAB0]);

    v9 = objc_alloc_init(MEMORY[0x1E0D519C0]);
  }
  else
  {
    HFLogForCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(*(SEL *)(a1 + 40));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138412546;
      v15 = WeakRetained;
      v16 = 2112;
      v17 = v11;
      _os_log_impl(&dword_1B8E1E000, v10, OS_LOG_TYPE_DEFAULT, "%@:%@ Onboarding not required", (uint8_t *)&v14, 0x16u);

    }
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v12 = v9;

  return v12;
}

- (NSString)description
{
  return (NSString *)CFSTR("Switch Homes Welcome");
}

- (id)processUserInput:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  id v11;
  HMHome *home;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  int v18;
  HUSwitchHomesWelcomeOnboardingFlow *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  HFLogForCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138412802;
    v19 = self;
    v20 = 2112;
    v21 = v7;
    v22 = 2112;
    v23 = v5;
    _os_log_impl(&dword_1B8E1E000, v6, OS_LOG_TYPE_DEFAULT, "%@:%@ with input results: %@", (uint8_t *)&v18, 0x20u);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("HUSwitchHomesWelcomeOnboardingKey_UserInput"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "integerValue"))
  {
    if (objc_msgSend(v8, "integerValue") == 1)
    {
      HFLogForCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        NSStringFromSelector(a2);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 138412546;
        v19 = self;
        v20 = 2112;
        v21 = v10;
        _os_log_impl(&dword_1B8E1E000, v9, OS_LOG_TYPE_DEFAULT, "%@:%@ User Switched Homes - Aborting Current Onboarding", (uint8_t *)&v18, 0x16u);

      }
      -[HUSwitchHomesWelcomeOnboardingFlow setShouldAbortAllOnboarding:](self, "setShouldAbortAllOnboarding:", 1);
    }
  }
  else
  {
    v11 = objc_alloc(MEMORY[0x1E0D31988]);
    home = self->_home;
    -[HMHome currentUser](home, "currentUser");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v11, "initWithHome:user:nameStyle:", home, v13, 0);

    v15 = (id)objc_msgSend(v14, "setCompletedNonOwnerUserHomeSwitchingUI:", 1);
  }
  -[HUSwitchHomesWelcomeOnboardingFlow onboardingFuture](self, "onboardingFuture");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "finishWithNoResult");

  return 0;
}

+ (id)needsOnboardingForHome:(id)a3 options:(id)a4
{
  return +[HUSwitchHomesWelcomeOnboardingFlowUtilities currentUserHasUnfinishedFeatureOnboardingForHome:](HUSwitchHomesWelcomeOnboardingFlowUtilities, "currentUserHasUnfinishedFeatureOnboardingForHome:", a3, a4);
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

- (NAFuture)readyFuture
{
  return self->_readyFuture;
}

- (void)setReadyFuture:(id)a3
{
  objc_storeStrong((id *)&self->_readyFuture, a3);
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
  objc_storeStrong((id *)&self->_readyFuture, 0);
  objc_storeStrong((id *)&self->_initialViewController, 0);
  objc_storeStrong((id *)&self->_onboardingFuture, 0);
  objc_storeStrong((id *)&self->_home, 0);
}

@end
