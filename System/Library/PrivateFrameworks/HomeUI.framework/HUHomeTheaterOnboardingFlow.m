@implementation HUHomeTheaterOnboardingFlow

- (HUHomeTheaterOnboardingFlow)initWithUsageOptions:(id)a3 home:(id)a4
{
  id v6;
  id v7;
  HUHomeTheaterOnboardingFlow *v8;
  HUHomeTheaterOnboardingFlow *v9;
  uint64_t v10;
  NSArray *appleTVs;
  void *v12;
  HUHomeTheaterOnboardingFlow *v13;
  uint64_t v14;
  NAFuture *onboardingFuture;
  _QWORD v17[4];
  HUHomeTheaterOnboardingFlow *v18;
  objc_super v19;

  v6 = a3;
  v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)HUHomeTheaterOnboardingFlow;
  v8 = -[HUHomeTheaterOnboardingFlow init](&v19, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_home, a4);
    objc_msgSend(v7, "hf_appleTVsSupportingHomeTheater");
    v10 = objc_claimAutoreleasedReturnValue();
    appleTVs = v9->_appleTVs;
    v9->_appleTVs = (NSArray *)v10;

    objc_msgSend((id)objc_opt_class(), "needsOnboardingForHome:options:", v7, v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __57__HUHomeTheaterOnboardingFlow_initWithUsageOptions_home___block_invoke;
    v17[3] = &unk_1E6F4CD58;
    v13 = v9;
    v18 = v13;
    objc_msgSend(v12, "flatMap:", v17);
    v14 = objc_claimAutoreleasedReturnValue();
    onboardingFuture = v13->_onboardingFuture;
    v13->_onboardingFuture = (NAFuture *)v14;

  }
  return v9;
}

id __57__HUHomeTheaterOnboardingFlow_initWithUsageOptions_home___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  id v10;

  v3 = a2;
  v4 = (void *)MEMORY[0x1E0D519C0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __57__HUHomeTheaterOnboardingFlow_initWithUsageOptions_home___block_invoke_2;
  v8[3] = &unk_1E6F4D600;
  v9 = v3;
  v10 = *(id *)(a1 + 32);
  v5 = v3;
  objc_msgSend(v4, "futureWithBlock:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __57__HUHomeTheaterOnboardingFlow_initWithUsageOptions_home___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "BOOLValue"))
  {
    objc_msgSend(*(id *)(a1 + 40), "appleTVs");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "viewControllerForAccessory:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setInitialViewController:", v5);

  }
  else
  {
    objc_msgSend(v6, "finishWithNoResult");
  }

}

- (NSString)description
{
  return (NSString *)CFSTR("Home Theater Setup");
}

- (id)viewControllerForAccessory:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  HUHomeTheaterSimpleSetupViewController *v11;
  uint64_t v12;
  HUHomeTheaterSimpleSetupViewController *v13;
  HUHomeTheaterSetupViewController *v14;

  v4 = a3;
  objc_msgSend(v4, "audioDestinationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "availableDestinations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7 == 1)
  {
    objc_msgSend(v4, "audioDestinationController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "availableDestinations");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = [HUHomeTheaterSimpleSetupViewController alloc];
    -[HUHomeTheaterOnboardingFlow home](self, "home");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = -[HUHomeTheaterSimpleSetupViewController initWithAppleTVAccessory:destination:inHome:](v11, "initWithAppleTVAccessory:destination:inHome:", v4, v10, v12);

    v4 = (id)v12;
  }
  else
  {
    v14 = [HUHomeTheaterSetupViewController alloc];
    -[HUHomeTheaterOnboardingFlow home](self, "home");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[HUHomeTheaterSetupViewController initWithAppleTVAccessory:inHome:](v14, "initWithAppleTVAccessory:inHome:", v4, v10);
  }

  return v13;
}

- (id)processUserInput:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  unint64_t v12;
  void *v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  uint8_t buf[4];
  HUHomeTheaterOnboardingFlow *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("HUHomeTheaterOnboardingKey_UserInput"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("HUHomeTheaterOnboardingKey_Accessory"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUHomeTheaterOnboardingFlow appleTVs](self, "appleTVs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "indexOfObject:", v7);

  HFLogForCategory();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v21 = self;
    v22 = 2112;
    v23 = v11;
    v24 = 2112;
    v25 = v5;
    _os_log_impl(&dword_1B8E1E000, v10, OS_LOG_TYPE_DEFAULT, "%@:%@ with input results: %@", buf, 0x20u);

  }
  if (objc_msgSend(v6, "integerValue") && objc_msgSend(v6, "integerValue") != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUHomeTheaterOnboardingFlow.m"), 84, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("(userInputValue.integerValue == HUHomeTheaterOnboardingValue_Setup) || (userInputValue.integerValue == HUHomeTheaterOnboardingValue_DontSetup)"));

  }
  objc_msgSend(v6, "integerValue");
  objc_msgSend(v6, "integerValue");
  v12 = v9 + 1;
  -[HUHomeTheaterOnboardingFlow appleTVs](self, "appleTVs");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count");

  if (v12 >= v14)
  {
    objc_msgSend(v5, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("HUHomeFeatureOnboardingKey_HomeTheater_FinishedOnboarding"));
    -[HUHomeTheaterOnboardingFlow onboardingFuture](self, "onboardingFuture");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "finishWithNoResult");
    v17 = 0;
  }
  else
  {
    -[HUHomeTheaterOnboardingFlow appleTVs](self, "appleTVs");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectAtIndexedSubscript:", v12);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    -[HUHomeTheaterOnboardingFlow viewControllerForAccessory:](self, "viewControllerForAccessory:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v17;
}

+ (id)needsOnboardingForHome:(id)a3 options:(id)a4
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  id v15[2];
  id location;

  v7 = a3;
  v8 = a4;
  objc_initWeak(&location, a1);
  v9 = (void *)MEMORY[0x1E0D519C0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __62__HUHomeTheaterOnboardingFlow_needsOnboardingForHome_options___block_invoke;
  v13[3] = &unk_1E6F4C690;
  objc_copyWeak(v15, &location);
  v10 = v7;
  v14 = v10;
  v15[1] = (id)a2;
  objc_msgSend(v9, "futureWithBlock:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);

  return v11;
}

void __62__HUHomeTheaterOnboardingFlow_needsOnboardingForHome_options___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  int v9;
  int v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  const __CFString *v21;
  void *v22;
  _BOOL4 v23;
  id v24;
  uint8_t buf[4];
  id v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  const __CFString *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  _BOOL4 v36;
  __int16 v37;
  int v38;
  __int16 v39;
  int v40;
  __int16 v41;
  int v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "hf_appleTVsSupportingHomeTheater");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    v24 = WeakRetained;
    objc_msgSend(*(id *)(a1 + 32), "hf_appleTVsSupportingHomeTheater");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");
    v9 = objc_msgSend(v7, "na_any:", &__block_literal_global_19);
    v10 = objc_msgSend(*(id *)(a1 + 32), "hf_currentUserIsAdministrator");
    v11 = objc_alloc(MEMORY[0x1E0D31988]);
    v12 = *(void **)(a1 + 32);
    objc_msgSend(v12, "currentUser");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v11, "initWithHome:user:nameStyle:", v12, v13, 0);

    v15 = objc_msgSend(v14, "hasDismissedHomeTheaterOnboarding");
    v16 = ((v8 != 0) & ~(_BYTE)v15 & ~(_BYTE)v9) & v10;
    HFLogForCategory();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v23 = v8 != 0;
      NSStringFromSelector(*(SEL *)(a1 + 48));
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = (void *)v18;
      v20 = *(_QWORD *)(a1 + 32);
      v21 = CFSTR("Cannot");
      *(_DWORD *)buf = 138414338;
      v26 = v24;
      if ((_DWORD)v16)
        v21 = CFSTR("Can");
      v27 = 2112;
      v28 = v18;
      v29 = 2112;
      v30 = v21;
      v31 = 2112;
      v32 = v14;
      v33 = 2112;
      v34 = v20;
      v35 = 1024;
      v36 = v23;
      v37 = 1024;
      v38 = v9;
      v39 = 1024;
      v40 = v10;
      v41 = 1024;
      v42 = v15;
      _os_log_impl(&dword_1B8E1E000, v17, OS_LOG_TYPE_DEFAULT, "%@:%@: %@ show because: user(%@) in home(%@):\n\t\thasCompatibleAppleTVs = %{BOOL}d\n\t\talreadyOneSetup = %{BOOL}d\n\t\tuserAllowedToEdit = %{BOOL}d\n\t\thasPreviouslyDismissed = %{BOOL}d", buf, 0x4Cu);

    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v16);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "finishWithResult:", v22);

    WeakRetained = v24;
  }
  else
  {
    objc_msgSend(v3, "finishWithResult:", MEMORY[0x1E0C9AAA0]);
  }

}

BOOL __62__HUHomeTheaterOnboardingFlow_needsOnboardingForHome_options___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "audioDestinationController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "destination");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
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

- (NSArray)appleTVs
{
  return self->_appleTVs;
}

- (void)setAppleTVs:(id)a3
{
  objc_storeStrong((id *)&self->_appleTVs, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appleTVs, 0);
  objc_storeStrong((id *)&self->_initialViewController, 0);
  objc_storeStrong((id *)&self->_onboardingFuture, 0);
  objc_storeStrong((id *)&self->_home, 0);
}

@end
