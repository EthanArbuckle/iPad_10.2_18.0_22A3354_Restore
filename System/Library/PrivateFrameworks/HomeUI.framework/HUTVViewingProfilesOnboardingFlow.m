@implementation HUTVViewingProfilesOnboardingFlow

- (HUTVViewingProfilesOnboardingFlow)initWithUsageOptions:(id)a3 home:(id)a4
{
  id v6;
  id v7;
  HUTVViewingProfilesOnboardingFlow *v8;
  HUTVViewingProfilesOnboardingFlow *v9;
  void *v10;
  uint64_t v11;
  NAFuture *onboardingFuture;
  _QWORD v14[4];
  id v15;
  id location;
  objc_super v17;

  v6 = a3;
  v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)HUTVViewingProfilesOnboardingFlow;
  v8 = -[HUTVViewingProfilesOnboardingFlow init](&v17, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_home, a4);
    objc_initWeak(&location, v9);
    objc_msgSend((id)objc_opt_class(), "needsOnboardingForHome:options:", v7, v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __63__HUTVViewingProfilesOnboardingFlow_initWithUsageOptions_home___block_invoke;
    v14[3] = &unk_1E6F4EA10;
    objc_copyWeak(&v15, &location);
    objc_msgSend(v10, "flatMap:", v14);
    v11 = objc_claimAutoreleasedReturnValue();
    onboardingFuture = v9->_onboardingFuture;
    v9->_onboardingFuture = (NAFuture *)v11;

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }

  return v9;
}

id __63__HUTVViewingProfilesOnboardingFlow_initWithUsageOptions_home___block_invoke(uint64_t a1, void *a2)
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
  v8[2] = __63__HUTVViewingProfilesOnboardingFlow_initWithUsageOptions_home___block_invoke_2;
  v8[3] = &unk_1E6F4E9E8;
  objc_copyWeak(&v10, (id *)(a1 + 32));
  v5 = v3;
  v9 = v5;
  objc_msgSend(v4, "futureWithBlock:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v10);
  return v6;
}

void __63__HUTVViewingProfilesOnboardingFlow_initWithUsageOptions_home___block_invoke_2(uint64_t a1, void *a2)
{
  id WeakRetained;
  HUTVViewingProfilesSetupViewController *v4;
  void *v5;
  HUTVViewingProfilesSetupViewController *v6;
  id v7;

  v7 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (objc_msgSend(*(id *)(a1 + 32), "BOOLValue"))
  {
    v4 = [HUTVViewingProfilesSetupViewController alloc];
    objc_msgSend(WeakRetained, "home");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[HUTVViewingProfilesSetupViewController initWithHome:](v4, "initWithHome:", v5);
    objc_msgSend(WeakRetained, "setInitialViewController:", v6);

  }
  else
  {
    objc_msgSend(v7, "finishWithNoResult");
  }

}

- (NSString)description
{
  return (NSString *)CFSTR("TV Viewing Profiles Setup");
}

- (id)processUserInput:(id)a3
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  HUTVViewingProfilesCustomizeViewController *v11;
  void *v12;
  HUTVViewingProfilesCustomizeViewController *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v21;
  _QWORD v22[6];
  uint8_t buf[4];
  HUTVViewingProfilesOnboardingFlow *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("HUTVViewingProfilesOnboardingKey_UserInput"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  HFLogForCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v24 = self;
    v25 = 2112;
    v26 = v8;
    v27 = 2112;
    v28 = v5;
    _os_log_impl(&dword_1B8E1E000, v7, OS_LOG_TYPE_DEFAULT, "%@:%@ with input results: %@", buf, 0x20u);

  }
  if (objc_msgSend(v6, "integerValue") != 1
    && objc_msgSend(v6, "integerValue") != 2
    && objc_msgSend(v6, "integerValue") != 3
    && objc_msgSend(v6, "integerValue"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUTVViewingProfilesOnboardingFlow.m"), 68, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("(userInputValue.integerValue == HUTVViewingProfilesOnboardingValue_Customize) || (userInputValue.integerValue == HUTVViewingProfilesOnboardingValue_Continue) || (userInputValue.integerValue == HUTVViewingProfilesOnboardingValue_DontSetup) || (userInputValue.integerValue == HUTVViewingProfilesOnboardingValue_SetupAll)"));

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("HUMultiUserKey_SetIsEnabled"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "BOOLValue"))
  {
    -[HUTVViewingProfilesOnboardingFlow home](self, "home");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __54__HUTVViewingProfilesOnboardingFlow_processUserInput___block_invoke;
    v22[3] = &unk_1E6F4E568;
    v22[4] = self;
    v22[5] = a2;
    objc_msgSend(v10, "enableMultiUserWithCompletionHandler:", v22);

  }
  if (objc_msgSend(v6, "integerValue") == 1)
  {
    v11 = [HUTVViewingProfilesCustomizeViewController alloc];
    -[HUTVViewingProfilesOnboardingFlow home](self, "home");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[HUTVViewingProfilesCustomizeViewController initWithHome:](v11, "initWithHome:", v12);
LABEL_20:

    goto LABEL_21;
  }
  if (objc_msgSend(v6, "integerValue") == 2
    || objc_msgSend(v6, "integerValue") == 3
    || !objc_msgSend(v6, "integerValue"))
  {
    v14 = objc_alloc(MEMORY[0x1E0D31988]);
    -[HUTVViewingProfilesOnboardingFlow home](self, "home");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUTVViewingProfilesOnboardingFlow home](self, "home");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "currentUser");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v14, "initWithHome:user:nameStyle:", v15, v17, 0);

    if ((objc_msgSend(v12, "hasDismissedTVViewingProfilesOnboarding") & 1) != 0)
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    else
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v6, "integerValue") != 3);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v18, CFSTR("HUHomeFeatureOnboardingKey_TVViewingProfiles_DismissReminderBanner"));

    objc_msgSend(v5, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("HUHomeFeatureOnboardingKey_TVViewingProfiles_FinishedOnboarding"));
    -[HUTVViewingProfilesOnboardingFlow onboardingFuture](self, "onboardingFuture");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "finishWithNoResult");

    v13 = 0;
    goto LABEL_20;
  }
  v13 = 0;
LABEL_21:

  return v13;
}

void __54__HUTVViewingProfilesOnboardingFlow_processUserInput___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412802;
    v8 = v5;
    v9 = 2112;
    v10 = v6;
    v11 = 2112;
    v12 = v3;
    _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "%@:%@: enabled Multi User in HomeKit (Error:%@)", (uint8_t *)&v7, 0x20u);

  }
}

+ (id)needsOnboardingForHome:(id)a3 options:(id)a4
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17[2];
  id location;

  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "hf_tvViewingProfilesAccessories");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (v10)
  {
    objc_initWeak(&location, a1);
    v11 = (void *)MEMORY[0x1E0D519C0];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __68__HUTVViewingProfilesOnboardingFlow_needsOnboardingForHome_options___block_invoke;
    v14[3] = &unk_1E6F53808;
    objc_copyWeak(v17, &location);
    v15 = v7;
    v16 = v8;
    v17[1] = (id)a2;
    objc_msgSend(v11, "futureWithBlock:", v14);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_destroyWeak(v17);
    objc_destroyWeak(&location);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", MEMORY[0x1E0C9AAA0]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

void __68__HUTVViewingProfilesOnboardingFlow_needsOnboardingForHome_options___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id WeakRetained;
  int v5;
  void *v6;
  void *v7;
  id v8;
  int v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  int v21;
  id v22;
  uint8_t buf[4];
  id v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  int v34;
  __int16 v35;
  int v36;
  __int16 v37;
  int v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v3 = (id *)(a1 + 48);
  v22 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  v5 = objc_msgSend(*(id *)(a1 + 32), "hf_hasAppleTVs");
  objc_opt_class();
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("OnboardingDisplayOption_OnboardingFromUserInput"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  v9 = objc_msgSend(v8, "BOOLValue");
  v10 = objc_alloc(MEMORY[0x1E0D31988]);
  v11 = *(void **)(a1 + 32);
  objc_msgSend(v11, "currentUser");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v10, "initWithHome:user:nameStyle:", v11, v12, 0);

  v14 = objc_msgSend(v13, "hasDismissedTVViewingProfilesOnboarding");
  v15 = v5 & (v9 | v14 ^ 1u);
  HFLogForCategory();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v21 = v9 ^ 1;
    NSStringFromSelector(*(SEL *)(a1 + 56));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "currentUser");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138414082;
    v24 = WeakRetained;
    v25 = 2112;
    v26 = v17;
    v27 = 1024;
    v28 = v15;
    v29 = 2112;
    v30 = v18;
    v31 = 2112;
    v32 = v19;
    v33 = 1024;
    v34 = v5;
    v35 = 1024;
    v36 = v14;
    v37 = 1024;
    v38 = v21;
    _os_log_impl(&dword_1B8E1E000, v16, OS_LOG_TYPE_DEFAULT, "%@:%@: ---> %{BOOL}d <--- because: user(%@) in home(%@):\n\t\thasAppleTVs = %{BOOL}d\n\t\thasPreviouslyDismissed = %{BOOL}d\n\t\trespectPriorDismissal = %{BOOL}d", buf, 0x42u);

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v15);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "finishWithResult:", v20);

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
