@implementation HUNaturalLightingOnboardingFlow

void __66__HUNaturalLightingOnboardingFlow_needsOnboardingForHome_options___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  id v4;
  _BOOL8 v5;
  id v6;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = a2;
  v5 = +[HUNaturalLightingOnboardingFlow home:canShowNaturalLightingOnboardingWithUsageOptions:](HUNaturalLightingOnboardingFlow, "home:canShowNaturalLightingOnboardingWithUsageOptions:", v2, v3);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "finishWithResult:", v6);

}

+ (BOOL)home:(id)a3 canShowNaturalLightingOnboardingWithUsageOptions:(id)a4
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  int v12;
  int v13;
  id v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  int v19;
  int v20;
  NSObject *v21;
  int v22;
  _BOOL4 v23;
  void *v24;
  const __CFString *v25;
  void *v27;
  int v28;
  int v29;
  uint8_t buf[4];
  id v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  const __CFString *v35;
  __int16 v36;
  id v37;
  __int16 v38;
  _BOOL4 v39;
  __int16 v40;
  int v41;
  __int16 v42;
  int v43;
  __int16 v44;
  int v45;
  __int16 v46;
  int v47;
  __int16 v48;
  int v49;
  __int16 v50;
  int v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "hf_allLightProfilesSupportingNaturalLighting");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  objc_msgSend(v7, "hf_accessoriesSupportingNaturalLighting");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "na_any:", &__block_literal_global_19_1);

  v13 = objc_msgSend(v7, "hf_enabledResidentsSupportsNaturalLight");
  v14 = objc_alloc(MEMORY[0x1E0D31988]);
  objc_msgSend(v7, "currentUser");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v14, "initWithHome:user:nameStyle:", v7, v15, 0);

  v17 = objc_msgSend(v7, "hf_currentUserIsAdministrator");
  v29 = objc_msgSend(v16, "hasDismissedNaturalLightingOnboarding");
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("OnboardingDisplayOption_OnboardingFromUserInput"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = objc_msgSend(v18, "BOOLValue");
  v28 = v13;
  if (v10 && v13 && v12 && v17 && ((v29 ^ 1 | v19) & 1) != 0)
    v20 = 1;
  else
    v20 = HFForceNaturalLightingOnboarding();
  HFLogForCategory();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    v27 = v16;
    v22 = v12;
    v23 = v10 != 0;
    NSStringFromSelector(a2);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
      v25 = CFSTR("Can");
    else
      v25 = CFSTR("Cannot");
    *(_DWORD *)buf = 138414850;
    v31 = a1;
    v32 = 2112;
    v33 = v24;
    v34 = 2112;
    v35 = v25;
    v36 = 2112;
    v37 = v7;
    v38 = 1024;
    v39 = v23;
    v40 = 1024;
    v41 = v28;
    v42 = 1024;
    v43 = v17;
    v44 = 1024;
    v45 = v22;
    v16 = v27;
    v46 = 1024;
    v47 = v19;
    v48 = 1024;
    v49 = v29;
    v50 = 1024;
    v51 = HFForceNaturalLightingOnboarding();
    _os_log_impl(&dword_1B8E1E000, v21, OS_LOG_TYPE_DEFAULT, "%@:%@: %@ show because: home(%@):\n\t\thasCompatibleLights = %{BOOL}d\n\t\thasCapableResident = %{BOOL}d\n\t\tuserAllowedToEdit = %{BOOL}d\n\t\tsomeAccessoriesNotOnboarded = %{BOOL}d\n\t\tonboardingFromUserInput = %{BOOL}d\n\t\thasPreviouslyDismissed = %{BOOL}d\n\t\tHFForceNaturalLighting = %{BOOL}d", buf, 0x54u);

  }
  return v20;
}

+ (id)needsOnboardingForHome:(id)a3 options:(id)a4
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
  v7 = (void *)MEMORY[0x1E0D519C0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __66__HUNaturalLightingOnboardingFlow_needsOnboardingForHome_options___block_invoke;
  v12[3] = &unk_1E6F4D600;
  v13 = v5;
  v14 = v6;
  v8 = v6;
  v9 = v5;
  objc_msgSend(v7, "futureWithBlock:", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (HUNaturalLightingOnboardingFlow)initWithUsageOptions:(id)a3 home:(id)a4
{
  id v6;
  id v7;
  HUNaturalLightingOnboardingFlow *v8;
  HUNaturalLightingOnboardingFlow *v9;
  void *v10;
  uint64_t v11;
  NAFuture *onboardingFuture;
  _QWORD v14[4];
  id v15;
  id v16;
  id location;
  objc_super v18;

  v6 = a3;
  v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)HUNaturalLightingOnboardingFlow;
  v8 = -[HUNaturalLightingOnboardingFlow init](&v18, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_home, a4);
    objc_initWeak(&location, v9);
    objc_msgSend((id)objc_opt_class(), "needsOnboardingForHome:options:", v7, v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __61__HUNaturalLightingOnboardingFlow_initWithUsageOptions_home___block_invoke;
    v14[3] = &unk_1E6F4E9B8;
    objc_copyWeak(&v16, &location);
    v15 = v6;
    objc_msgSend(v10, "flatMap:", v14);
    v11 = objc_claimAutoreleasedReturnValue();
    onboardingFuture = v9->_onboardingFuture;
    v9->_onboardingFuture = (NAFuture *)v11;

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }

  return v9;
}

id __61__HUNaturalLightingOnboardingFlow_initWithUsageOptions_home___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  id v17;
  char v18;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  v6 = objc_msgSend(v4, "BOOLValue");

  objc_msgSend(WeakRetained, "home");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hf_homeKitObjectsSupportingNaturalLighting");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "na_filter:", &__block_literal_global_193);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "count"))
    v10 = v6;
  else
    v10 = 0;
  v11 = (void *)MEMORY[0x1E0D519C0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __61__HUNaturalLightingOnboardingFlow_initWithUsageOptions_home___block_invoke_3;
  v15[3] = &unk_1E6F4DF30;
  v18 = v10;
  v16 = *(id *)(a1 + 32);
  v17 = WeakRetained;
  v12 = WeakRetained;
  objc_msgSend(v11, "futureWithBlock:", v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

BOOL __61__HUNaturalLightingOnboardingFlow_initWithUsageOptions_home___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return +[HUNaturalLightingSetupModule showNaturalLightingContainingHomeKitObject:](HUNaturalLightingSetupModule, "showNaturalLightingContainingHomeKitObject:", a2);
}

void __61__HUNaturalLightingOnboardingFlow_initWithUsageOptions_home___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  HUNaturalLightingTitleViewController *v7;
  void *v8;
  HUNaturalLightingTitleViewController *v9;
  id v10;

  v3 = a2;
  v10 = v3;
  if (*(_BYTE *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("OnboardingDisplayOption_OnboardingFromNaturalLightingReminder"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "BOOLValue");

    if (v5)
    {
      objc_msgSend(*(id *)(a1 + 40), "setupViewController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "setInitialViewController:", v6);

    }
    else
    {
      v7 = [HUNaturalLightingTitleViewController alloc];
      objc_msgSend(*(id *)(a1 + 40), "home");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[HUNaturalLightingTitleViewController initWithHome:](v7, "initWithHome:", v8);
      objc_msgSend(*(id *)(a1 + 40), "setInitialViewController:", v9);

    }
  }
  else
  {
    objc_msgSend(v3, "finishWithNoResult");
  }

}

- (NSString)description
{
  return (NSString *)CFSTR("Natural Lighting Setup");
}

- (HUConfigurationViewController)setupViewController
{
  HUConfigurationViewController *setupViewController;
  HUNaturalLightingSetupViewController *v4;
  void *v5;
  HUConfigurationViewController *v6;
  HUConfigurationViewController *v7;

  setupViewController = self->_setupViewController;
  if (!setupViewController)
  {
    v4 = [HUNaturalLightingSetupViewController alloc];
    -[HUNaturalLightingOnboardingFlow home](self, "home");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[HUNaturalLightingSetupViewController initWithHome:](v4, "initWithHome:", v5);
    v7 = self->_setupViewController;
    self->_setupViewController = v6;

    setupViewController = self->_setupViewController;
  }
  return setupViewController;
}

- (id)processUserInput:(id)a3
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v14;
  uint8_t buf[4];
  HUNaturalLightingOnboardingFlow *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("HUNaturalLightingOnboardingKey_UserInput"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  HFLogForCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v16 = self;
    v17 = 2112;
    v18 = v8;
    v19 = 2112;
    v20 = v5;
    _os_log_impl(&dword_1B8E1E000, v7, OS_LOG_TYPE_DEFAULT, "%@:%@ with input results: %@", buf, 0x20u);

  }
  if (objc_msgSend(v6, "integerValue")
    && objc_msgSend(v6, "integerValue") != 1
    && objc_msgSend(v6, "integerValue") != 2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUNaturalLightingOnboardingFlow.m"), 87, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("(userInputValue.integerValue == HUNaturalLightingOnboardingValue_ShowSetupNext) || (userInputValue.integerValue == HUNaturalLightingOnboardingValue_SetupComplete) || (userInputValue.integerValue == HUNaturalLightingOnboardingValue_DontSetup)"));

  }
  if (objc_msgSend(v6, "integerValue")
    || (-[HUNaturalLightingOnboardingFlow home](self, "home"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v9, "hf_currentUserIsAdministrator"),
        v9,
        !v10))
  {
    objc_msgSend(v5, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("HUHomeFeatureOnboardingKey_NaturalLighting_FinishedOnboarding"));
    -[HUNaturalLightingOnboardingFlow onboardingFuture](self, "onboardingFuture");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "finishWithNoResult");

    v11 = 0;
  }
  else
  {
    -[HUNaturalLightingOnboardingFlow setupViewController](self, "setupViewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

uint64_t __89__HUNaturalLightingOnboardingFlow_home_canShowNaturalLightingOnboardingWithUsageOptions___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hasOnboardedForNaturalLighting") ^ 1;
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

- (void)setSetupViewController:(id)a3
{
  objc_storeStrong((id *)&self->_setupViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_setupViewController, 0);
  objc_storeStrong((id *)&self->_initialViewController, 0);
  objc_storeStrong((id *)&self->_onboardingFuture, 0);
  objc_storeStrong((id *)&self->_home, 0);
}

@end
