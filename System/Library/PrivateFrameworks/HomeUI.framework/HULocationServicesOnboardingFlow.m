@implementation HULocationServicesOnboardingFlow

- (HULocationServicesOnboardingFlow)initWithUsageOptions:(id)a3 home:(id)a4
{
  id v6;
  id v7;
  HULocationServicesOnboardingFlow *v8;
  HULocationServicesOnboardingFlow *v9;
  NAFuture *v10;
  NAFuture *readyFuture;
  void *v12;
  uint64_t v13;
  NAFuture *onboardingFuture;
  _QWORD v16[4];
  id v17;
  id location;
  objc_super v19;

  v6 = a3;
  v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)HULocationServicesOnboardingFlow;
  v8 = -[HULocationServicesOnboardingFlow init](&v19, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_home, a4);
    objc_initWeak(&location, v9);
    v10 = (NAFuture *)objc_alloc_init(MEMORY[0x1E0D519C0]);
    readyFuture = v9->_readyFuture;
    v9->_readyFuture = v10;

    objc_msgSend((id)objc_opt_class(), "needsOnboardingForHome:options:", v7, v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __62__HULocationServicesOnboardingFlow_initWithUsageOptions_home___block_invoke;
    v16[3] = &unk_1E6F4EA10;
    objc_copyWeak(&v17, &location);
    objc_msgSend(v12, "flatMap:", v16);
    v13 = objc_claimAutoreleasedReturnValue();
    onboardingFuture = v9->_onboardingFuture;
    v9->_onboardingFuture = (NAFuture *)v13;

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }

  return v9;
}

id __62__HULocationServicesOnboardingFlow_initWithUsageOptions_home___block_invoke(uint64_t a1, void *a2)
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
  v8[2] = __62__HULocationServicesOnboardingFlow_initWithUsageOptions_home___block_invoke_2;
  v8[3] = &unk_1E6F4E9E8;
  objc_copyWeak(&v10, (id *)(a1 + 32));
  v5 = v3;
  v9 = v5;
  objc_msgSend(v4, "futureWithBlock:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v10);
  return v6;
}

void __62__HULocationServicesOnboardingFlow_initWithUsageOptions_home___block_invoke_2(uint64_t a1, void *a2)
{
  id WeakRetained;
  HULocationServicesSetupViewController *v4;
  void *v5;
  HULocationServicesSetupViewController *v6;
  void *v7;
  id v8;

  v8 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (objc_msgSend(*(id *)(a1 + 32), "BOOLValue"))
  {
    v4 = [HULocationServicesSetupViewController alloc];
    objc_msgSend(WeakRetained, "home");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[HULocationServicesSetupViewController initWithHome:](v4, "initWithHome:", v5);
    objc_msgSend(WeakRetained, "setInitialViewController:", v6);

    objc_msgSend(WeakRetained, "readyFuture");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "finishWithResult:", MEMORY[0x1E0C9AAB0]);

  }
  else
  {
    objc_msgSend(v8, "finishWithNoResult");
  }

}

- (NSString)description
{
  return (NSString *)CFSTR("Location Services Setup");
}

- (id)processUserInput:(id)a3
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  _BOOL8 v9;
  void *v10;
  void *v11;
  void *v13;
  _QWORD v14[6];
  uint8_t buf[4];
  HULocationServicesOnboardingFlow *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("HULocationServicesOnboardingKey_UserInput"));
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
  if (objc_msgSend(v6, "integerValue") && objc_msgSend(v6, "integerValue") != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HULocationServicesOnboardingFlow.m"), 75, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("(userInputValue.integerValue == HULocationServicesOnboardingValue_Enable) || (userInputValue.integerValue == HULocationServicesOnboardingValue_Disable)"));

  }
  if (!objc_msgSend(v6, "integerValue") || objc_msgSend(v6, "integerValue") == 1)
  {
    v9 = objc_msgSend(v6, "integerValue") == 0;
    -[HULocationServicesOnboardingFlow home](self, "home");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __53__HULocationServicesOnboardingFlow_processUserInput___block_invoke;
    v14[3] = &unk_1E6F4E568;
    v14[4] = self;
    v14[5] = a2;
    objc_msgSend(v10, "updateLocationServicesEnabled:completion:", v9, v14);

    objc_msgSend(v5, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("HUHomeFeatureOnboardingKey_LocationServices_FinishedOnboarding"));
    -[HULocationServicesOnboardingFlow onboardingFuture](self, "onboardingFuture");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "finishWithNoResult");

  }
  return 0;
}

void __53__HULocationServicesOnboardingFlow_processUserInput___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  const __CFString *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    v8 = CFSTR("Failed");
    v9 = 138413058;
    v10 = v5;
    v11 = 2112;
    if (!v3)
      v8 = CFSTR("Succeeded");
    v12 = v6;
    v13 = 2112;
    v14 = v8;
    v15 = 2112;
    v16 = v3;
    _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "%@:%@: Location Services Onboarding %@. Error (%@)", (uint8_t *)&v9, 0x2Au);

  }
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
  v13[2] = __67__HULocationServicesOnboardingFlow_needsOnboardingForHome_options___block_invoke;
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

void __67__HULocationServicesOnboardingFlow_needsOnboardingForHome_options___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;
  int v6;
  void *v7;
  int v8;
  void *v9;
  int v10;
  uint64_t v11;
  NSObject *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  int v32;
  __int16 v33;
  int v34;
  __int16 v35;
  int v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  v6 = objc_msgSend(*(id *)(a1 + 32), "didOnboardLocationServices");
  objc_msgSend(*(id *)(a1 + 32), "hf_allHomePodProfileContainers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "na_any:", &__block_literal_global_29);
  objc_msgSend(*(id *)(a1 + 32), "accessories");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "na_any:", &__block_literal_global_21);

  v11 = 0;
  if (objc_msgSend(*(id *)(a1 + 32), "hf_currentUserIsAdministrator")
    && (v6 & 1) == 0
    && (v8 & 1) == 0
    && v10)
  {
    v11 = objc_msgSend(*(id *)(a1 + 32), "isLocationServicesEnabled") ^ 1;
  }
  HFLogForCategory();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v18 = v4;
    v13 = WeakRetained;
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "currentUser");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = *(void **)(a1 + 32);
    *(_DWORD *)buf = 138414338;
    v20 = v13;
    v21 = 2112;
    v22 = v14;
    v23 = 1024;
    v24 = v11;
    v25 = 2112;
    v26 = v15;
    v27 = 2112;
    v28 = v16;
    v29 = 1024;
    v30 = v6;
    v31 = 1024;
    v32 = v8;
    v33 = 1024;
    v34 = v10;
    v35 = 1024;
    v36 = objc_msgSend(v16, "isLocationServicesEnabled");
    _os_log_impl(&dword_1B8E1E000, v12, OS_LOG_TYPE_DEFAULT, "%@:%@: ---> %{BOOL}d <--- because: user(%@) in home(%@):\n\t\thasPreviouslyDismissed = %{BOOL}d, hasAtleastOneHomePodWithLocationServicesEnabled = %{BOOL}d , atLeastOneDeviceSupportsHomeLevelLocationServicesSetting = %{BOOL}d, home.locationServicesEnabled = %{BOOL}d", buf, 0x48u);

    WeakRetained = v13;
    v4 = v18;
  }

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v11);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "finishWithResult:", v17);

}

uint64_t __67__HULocationServicesOnboardingFlow_needsOnboardingForHome_options___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;

  v2 = a2;
  objc_msgSend(v2, "hf_settingsValueManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "settings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "hf_accessorySettingAtKeyPath:", *MEMORY[0x1E0D30758]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  objc_msgSend(v3, "valueForSetting:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  if (v8)
    v9 = objc_msgSend(v8, "BOOLValue");
  else
    v9 = 0;

  return v9;
}

uint64_t __67__HULocationServicesOnboardingFlow_needsOnboardingForHome_options___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "supportsHomeLevelLocationServiceSetting");
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
