@implementation HUAnnounceOnboardingFlow

- (HUAnnounceOnboardingFlow)initWithUsageOptions:(id)a3 home:(id)a4
{
  id v6;
  id v7;
  HUAnnounceOnboardingFlow *v8;
  HUAnnounceOnboardingFlow *v9;
  void *v10;
  HUAnnounceOnboardingFlow *v11;
  uint64_t v12;
  NAFuture *onboardingFuture;
  _QWORD v15[4];
  HUAnnounceOnboardingFlow *v16;
  id v17;
  objc_super v18;

  v6 = a3;
  v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)HUAnnounceOnboardingFlow;
  v8 = -[HUAnnounceOnboardingFlow init](&v18, sel_init);
  v9 = v8;
  if (v8)
  {
    -[HUAnnounceOnboardingFlow setHome:](v8, "setHome:", v7);
    objc_msgSend((id)objc_opt_class(), "needsOnboardingForHome:options:", v7, v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __54__HUAnnounceOnboardingFlow_initWithUsageOptions_home___block_invoke;
    v15[3] = &unk_1E6F54A58;
    v11 = v9;
    v16 = v11;
    v17 = v6;
    objc_msgSend(v10, "flatMap:", v15);
    v12 = objc_claimAutoreleasedReturnValue();
    onboardingFuture = v11->_onboardingFuture;
    v11->_onboardingFuture = (NAFuture *)v12;

  }
  return v9;
}

id __54__HUAnnounceOnboardingFlow_initWithUsageOptions_home___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  id location;

  v3 = a2;
  objc_initWeak(&location, *(id *)(a1 + 32));
  v4 = (void *)MEMORY[0x1E0D519C0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __54__HUAnnounceOnboardingFlow_initWithUsageOptions_home___block_invoke_2;
  v8[3] = &unk_1E6F4E990;
  objc_copyWeak(&v11, &location);
  v5 = v3;
  v9 = v5;
  v10 = *(id *)(a1 + 40);
  objc_msgSend(v4, "futureWithBlock:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

  return v6;
}

void __54__HUAnnounceOnboardingFlow_initWithUsageOptions_home___block_invoke_2(id *a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v13 = a2;
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (objc_msgSend(a1[4], "BOOLValue"))
  {
    objc_msgSend((id)objc_opt_class(), "allSteps");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __54__HUAnnounceOnboardingFlow_initWithUsageOptions_home___block_invoke_3;
    v14[3] = &unk_1E6F54A30;
    v5 = WeakRetained;
    v15 = v5;
    v16 = a1[5];
    objc_msgSend(v4, "na_filter:", v14);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setRequiredSteps:", v6);

    objc_msgSend(v5, "requiredSteps");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    if (v8)
    {
      objc_msgSend(v5, "requiredSteps");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "firstObject");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "unsignedIntegerValue");

      objc_msgSend(v5, "viewControllerForStep:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setInitialViewController:", v12);

    }
    else
    {
      objc_msgSend(v13, "finishWithNoResult");
    }

  }
  else
  {
    objc_msgSend(v13, "finishWithNoResult");
  }

}

uint64_t __54__HUAnnounceOnboardingFlow_initWithUsageOptions_home___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "shouldShowStep:withOptions:", objc_msgSend(a2, "integerValue"), *(_QWORD *)(a1 + 40));
}

- (BOOL)shouldShowStep:(unint64_t)a3 withOptions:(id)a4
{
  void *v6;
  void *v7;
  unint64_t v8;
  void *v10;
  char v11;

  -[HUAnnounceOnboardingFlow home](self, "home", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hf_allUsersIncludingCurrentUser");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (a3 == 2 && v8 < 2)
    return 0;
  -[HUAnnounceOnboardingFlow home](self, "home");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "hf_currentUserIsAdministrator");

  if (a3 == 2)
    return v11;
  else
    return 1;
}

- (id)viewControllerForStep:(unint64_t)a3
{
  HUAnnounceSetupViewController *v5;
  void *v6;
  uint64_t v7;
  HUAnnounceTitleViewController *v8;
  void *v9;

  if (a3)
  {
    v5 = [HUAnnounceSetupViewController alloc];
    -[HUAnnounceOnboardingFlow home](self, "home");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[HUAnnounceSetupViewController initWithHome:step:](v5, "initWithHome:step:", v6, a3);
  }
  else
  {
    v8 = [HUAnnounceTitleViewController alloc];
    -[HUAnnounceOnboardingFlow home](self, "home");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[HUAnnounceTitleViewController initWithHome:](v8, "initWithHome:", v6);
  }
  v9 = (void *)v7;

  return v9;
}

- (id)processUserInput:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  unint64_t v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;

  v4 = a3;
  objc_opt_class();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("announceSetupStep"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  if (v7)
  {
    -[HUAnnounceOnboardingFlow requiredSteps](self, "requiredSteps");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "indexOfObject:", v7) + 1;

  }
  else
  {
    v9 = 0;
  }
  -[HUAnnounceOnboardingFlow requiredSteps](self, "requiredSteps");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v9 >= v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, CFSTR("HUHomeFeatureOnboardingKey_Announce_FinishedOnboarding"));

  if (v9 < v11)
  {
    -[HUAnnounceOnboardingFlow requiredSteps](self, "requiredSteps");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectAtIndexedSubscript:", v9);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "unsignedIntegerValue");

    -[HUAnnounceOnboardingFlow viewControllerForStep:](self, "viewControllerForStep:", v17);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[HUAnnounceOnboardingFlow onboardingFuture](self, "onboardingFuture");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "finishWithNoResult");

    v14 = 0;
  }

  return v14;
}

+ (id)allSteps
{
  if (_MergedGlobals_624 != -1)
    dispatch_once(&_MergedGlobals_624, &__block_literal_global_11_2);
  return (id)qword_1ED580B20;
}

void __36__HUAnnounceOnboardingFlow_allSteps__block_invoke_2()
{
  void *v0;

  v0 = (void *)qword_1ED580B20;
  qword_1ED580B20 = (uint64_t)&unk_1E7042CD8;

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
  v14[2] = __59__HUAnnounceOnboardingFlow_needsOnboardingForHome_options___block_invoke;
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

void __59__HUAnnounceOnboardingFlow_needsOnboardingForHome_options___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;
  unsigned int v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  const __CFString *v20;
  void *v21;
  int v22;
  id v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  const __CFString *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  unsigned int v33;
  __int16 v34;
  int v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v3 = (id *)(a1 + 48);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  v6 = objc_msgSend(*(id *)(a1 + 32), "hf_shouldShowAnnounceFeatureForThisHome");
  v7 = objc_alloc(MEMORY[0x1E0D31988]);
  v8 = *(void **)(a1 + 32);
  objc_msgSend(v8, "currentUser");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v7, "initWithHome:user:nameStyle:", v8, v9, 0);

  v11 = objc_msgSend(v10, "hasDismissedAnnounceOnboarding");
  objc_opt_class();
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("announceForceOnboarding"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v13 = v12;
  else
    v13 = 0;
  v14 = v13;

  if ((objc_msgSend(v14, "BOOLValue") & 1) != 0)
    v15 = v6;
  else
    v15 = v6 & (v11 ^ 1);
  HFLogForCategory();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 56));
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)v17;
    v19 = *(_QWORD *)(a1 + 32);
    v20 = CFSTR("Cannot");
    v22 = 138413826;
    v23 = WeakRetained;
    if ((_DWORD)v15)
      v20 = CFSTR("Can");
    v24 = 2112;
    v25 = v17;
    v26 = 2112;
    v27 = v20;
    v28 = 2112;
    v29 = v10;
    v30 = 2112;
    v31 = v19;
    v32 = 1024;
    v33 = v6;
    v34 = 1024;
    v35 = v11;
    _os_log_impl(&dword_1B8E1E000, v16, OS_LOG_TYPE_DEFAULT, "%@:%@: %@ show because: user(%@) in home(%@):\n\t\tshowsAnnounceButton = %{BOOL}d\n\t\thasPreviouslyDismissed = %{BOOL}d", (uint8_t *)&v22, 0x40u);

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v15);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "finishWithResult:", v21);

}

- (HMHome)home
{
  return self->home;
}

- (void)setHome:(id)a3
{
  objc_storeStrong((id *)&self->home, a3);
}

- (HUConfigurationViewController)initialViewController
{
  return self->initialViewController;
}

- (void)setInitialViewController:(id)a3
{
  objc_storeStrong((id *)&self->initialViewController, a3);
}

- (NAFuture)onboardingFuture
{
  return self->_onboardingFuture;
}

- (void)setOnboardingFuture:(id)a3
{
  objc_storeStrong((id *)&self->_onboardingFuture, a3);
}

- (BOOL)shouldAbortAllOnboarding
{
  return self->shouldAbortAllOnboarding;
}

- (BOOL)shouldAbortThisOnboardingFlowGroup
{
  return self->shouldAbortThisOnboardingFlowGroup;
}

- (NSArray)requiredSteps
{
  return self->_requiredSteps;
}

- (void)setRequiredSteps:(id)a3
{
  objc_storeStrong((id *)&self->_requiredSteps, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requiredSteps, 0);
  objc_storeStrong((id *)&self->_onboardingFuture, 0);
  objc_storeStrong((id *)&self->initialViewController, 0);
  objc_storeStrong((id *)&self->home, 0);
}

@end
