@implementation HUAccessoryFirmwareUpdateOnboardingFlow

- (HUAccessoryFirmwareUpdateOnboardingFlow)initWithUsageOptions:(id)a3 home:(id)a4
{
  id v6;
  id v7;
  HUAccessoryFirmwareUpdateOnboardingFlow *v8;
  HUAccessoryFirmwareUpdateOnboardingFlow *v9;
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
  v17.super_class = (Class)HUAccessoryFirmwareUpdateOnboardingFlow;
  v8 = -[HUAccessoryFirmwareUpdateOnboardingFlow init](&v17, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_home, a4);
    objc_initWeak(&location, v9);
    objc_msgSend((id)objc_opt_class(), "needsOnboardingForHome:options:", v7, v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __69__HUAccessoryFirmwareUpdateOnboardingFlow_initWithUsageOptions_home___block_invoke;
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

id __69__HUAccessoryFirmwareUpdateOnboardingFlow_initWithUsageOptions_home___block_invoke(uint64_t a1, void *a2)
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
  v8[2] = __69__HUAccessoryFirmwareUpdateOnboardingFlow_initWithUsageOptions_home___block_invoke_2;
  v8[3] = &unk_1E6F4E9E8;
  objc_copyWeak(&v10, (id *)(a1 + 32));
  v5 = v3;
  v9 = v5;
  objc_msgSend(v4, "futureWithBlock:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v10);
  return v6;
}

void __69__HUAccessoryFirmwareUpdateOnboardingFlow_initWithUsageOptions_home___block_invoke_2(uint64_t a1, void *a2)
{
  id WeakRetained;
  HUAccessoryFirmwareUpdateSetupViewController *v4;
  void *v5;
  HUAccessoryFirmwareUpdateSetupViewController *v6;
  id v7;

  v7 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (objc_msgSend(*(id *)(a1 + 32), "BOOLValue"))
  {
    v4 = [HUAccessoryFirmwareUpdateSetupViewController alloc];
    objc_msgSend(WeakRetained, "home");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[HUAccessoryFirmwareUpdateSetupViewController initWithHome:](v4, "initWithHome:", v5);
    objc_msgSend(WeakRetained, "setInitialViewController:", v6);

  }
  else
  {
    objc_msgSend(v7, "finishWithNoResult");
  }

}

- (id)processUserInput:(id)a3
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v11;
  uint8_t buf[4];
  HUAccessoryFirmwareUpdateOnboardingFlow *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("HUAccessoryFirmwareUpdateOnboardingKey_UserInput"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  HFLogForCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v13 = self;
    v14 = 2112;
    v15 = v8;
    v16 = 2112;
    v17 = v5;
    _os_log_impl(&dword_1B8E1E000, v7, OS_LOG_TYPE_DEFAULT, "%@:%@ with input results: %@", buf, 0x20u);

  }
  if (objc_msgSend(v6, "integerValue") && objc_msgSend(v6, "integerValue") != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUAccessoryFirmwareUpdateOnboardingFlow.m"), 59, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("(userInputValue.integerValue == HUAccessoryFirmwareUpdateOnboardingValue_Setup) || (userInputValue.integerValue == HUAccessoryFirmwareUpdateOnboardingValue_DontSetup)"));

  }
  objc_msgSend(v5, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("HUHomeFeatureOnboardingKey_AccessoryFirmwareUpdate_FinishedOnboarding"));
  -[HUAccessoryFirmwareUpdateOnboardingFlow onboardingFuture](self, "onboardingFuture");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "finishWithNoResult");

  return 0;
}

+ (id)needsOnboardingForHome:(id)a3 options:(id)a4
{
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17[2];
  id location;

  v7 = a3;
  v8 = a4;
  objc_initWeak(&location, a1);
  v9 = (void *)MEMORY[0x1E0D519C0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __74__HUAccessoryFirmwareUpdateOnboardingFlow_needsOnboardingForHome_options___block_invoke;
  v14[3] = &unk_1E6F53808;
  objc_copyWeak(v17, &location);
  v10 = v7;
  v15 = v10;
  v11 = v8;
  v16 = v11;
  v17[1] = (id)a2;
  objc_msgSend(v9, "futureWithBlock:", v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);

  return v12;
}

void __74__HUAccessoryFirmwareUpdateOnboardingFlow_needsOnboardingForHome_options___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;
  int v6;
  int v7;
  int v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  int v15;
  uint64_t updated;
  NSObject *v17;
  id v18;
  void *v19;
  void *v20;
  int v21;
  int v22;
  const __CFString *v23;
  uint64_t v24;
  void *v25;
  int v26;
  id v27;
  int v28;
  uint8_t buf[4];
  id v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  const __CFString *v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  int v38;
  __int16 v39;
  int v40;
  __int16 v41;
  int v42;
  __int16 v43;
  int v44;
  __int16 v45;
  int v46;
  __int16 v47;
  int v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v3 = (id *)(a1 + 48);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  v6 = objc_msgSend(*(id *)(a1 + 32), "hf_hasThirdPartyAccessoriesSupportingSoftwareUpdate");
  v7 = objc_msgSend(*(id *)(a1 + 32), "hf_hasEnabledResidentSupportingThirdPartySoftwareUpdate");
  v8 = objc_msgSend(*(id *)(a1 + 32), "hf_currentUserIsOwner");
  v9 = objc_alloc(MEMORY[0x1E0D31988]);
  v10 = *(void **)(a1 + 32);
  objc_msgSend(v10, "currentUser");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v9, "initWithHome:user:nameStyle:", v10, v11, 0);

  v13 = objc_msgSend(v12, "hasDismissedAccessoryFirmwareUpdateOnboarding");
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("OnboardingDisplayOption_OnboardingFromUserInput"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "BOOLValue");

  v28 = v8;
  if (v6 && v7 && v8 && ((v13 ^ 1 | v15) & 1) != 0)
    updated = 1;
  else
    updated = HFForceAccessoryFirmwareUpdateOnboarding();
  HFLogForCategory();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 56));
    v27 = v4;
    v18 = WeakRetained;
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v13;
    v20 = v12;
    v21 = v7;
    v22 = v6;
    if ((_DWORD)updated)
      v23 = CFSTR("Can");
    else
      v23 = CFSTR("Cannot");
    v24 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138414594;
    v30 = v18;
    v31 = 2112;
    v32 = v19;
    v33 = 2112;
    v34 = v23;
    v35 = 2112;
    v36 = v24;
    v37 = 1024;
    v38 = v22;
    v39 = 1024;
    v40 = v21;
    v12 = v20;
    v41 = 1024;
    v42 = v28;
    v43 = 1024;
    v44 = v15;
    v45 = 1024;
    v46 = v26;
    v47 = 1024;
    v48 = HFForceAccessoryFirmwareUpdateOnboarding();
    _os_log_impl(&dword_1B8E1E000, v17, OS_LOG_TYPE_DEFAULT, "%@:%@: %@ show because: home(%@):\n\t\thasCompatibleAccessories = %{BOOL}d\n\t\thasCapableResident = %{BOOL}d\n\t\tuserIsOwner = %{BOOL}d\n\t\tonboardingFromUserInput = %{BOOL}d\n\t\thasPreviouslyDismissed = %{BOOL}d\n\t\tHFForceAccessoryFirmwareUpdate = %{BOOL}d", buf, 0x4Eu);

    WeakRetained = v18;
    v4 = v27;
  }

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", updated);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "finishWithResult:", v25);

}

- (NAFuture)onboardingFuture
{
  return self->_onboardingFuture;
}

- (void)setOnboardingFuture:(id)a3
{
  objc_storeStrong((id *)&self->_onboardingFuture, a3);
}

- (BOOL)shouldAbortThisOnboardingFlowGroup
{
  return self->_shouldAbortThisOnboardingFlowGroup;
}

- (BOOL)shouldAbortAllOnboarding
{
  return self->_shouldAbortAllOnboarding;
}

- (HUConfigurationViewController)initialViewController
{
  return self->_initialViewController;
}

- (void)setInitialViewController:(id)a3
{
  objc_storeStrong((id *)&self->_initialViewController, a3);
}

- (HMHome)home
{
  return self->_home;
}

- (void)setHome:(id)a3
{
  objc_storeStrong((id *)&self->_home, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_initialViewController, 0);
  objc_storeStrong((id *)&self->_onboardingFuture, 0);
}

@end
