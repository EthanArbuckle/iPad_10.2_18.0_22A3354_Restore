@implementation HUUtilityDiscoverySetupViewController

- (HUUtilityDiscoverySetupViewController)initWithHome:(id)a3 allUtilities:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  HUUtilityDiscoverySetupViewController *v15;
  objc_super v17;

  v7 = a3;
  v8 = a4;
  v9 = objc_msgSend(v8, "count");
  _HULocalizedStringWithDefaultValue(CFSTR("HUUtilityDiscoverySetup_Title"), CFSTR("HUUtilityDiscoverySetup_Title"), 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9 == 1)
    v11 = CFSTR("HUUtilityDiscoverySetup_Detail_SingleUtility");
  else
    v11 = CFSTR("HUUtilityDiscoverySetup_Detail_MultipleUtilities");
  _HULocalizedStringWithDefaultValue(v11, v11, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  HUImageNamed(CFSTR("Onboarding-HomeUtilityLogo"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x1E0D319D0], "isAnIPad"))
    v14 = 2;
  else
    v14 = 3;
  v17.receiver = self;
  v17.super_class = (Class)HUUtilityDiscoverySetupViewController;
  v15 = -[HUUtilityDiscoverySetupViewController initWithTitle:detailText:icon:contentLayout:](&v17, sel_initWithTitle_detailText_icon_contentLayout_, v10, v12, v13, v14);

  if (v15)
  {
    if (!v8 || !objc_msgSend(v8, "count"))
      -[HUUtilityDiscoverySetupViewController setErrorFetchingUtilities:](v15, "setErrorFetchingUtilities:", 1);
    objc_storeStrong((id *)&v15->_home, a3);
    *(_OWORD *)&v15->_contentInsets.top = 0u;
    *(_OWORD *)&v15->_contentInsets.bottom = 0u;
    objc_storeStrong((id *)&v15->_foundUtilities, a4);
  }

  return v15;
}

- (HUUtilityDiscoverySetupViewController)initWithHome:(id)a3 onboardingContext:(id)a4
{
  id v6;
  id v7;
  HUUtilityDiscoverySetupViewController *v8;
  void *v9;
  HUUtilityDiscoverySetupViewController *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  int v17;
  const char *v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  v8 = [HUUtilityDiscoverySetupViewController alloc];
  objc_msgSend(v6, "allUtilities");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[HUUtilityDiscoverySetupViewController initWithHome:allUtilities:](v8, "initWithHome:allUtilities:", v7, v9);

  objc_storeWeak((id *)&v10->_onboardingContext, v6);
  objc_msgSend(v6, "allUtilities");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  if (v12 == 1)
  {
    v10->_singleUtilityMode = 1;
    HFLogForCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 136315138;
      v18 = "-[HUUtilityDiscoverySetupViewController initWithHome:onboardingContext:]";
      _os_log_impl(&dword_1B8E1E000, v13, OS_LOG_TYPE_DEFAULT, "%s Single utility mode", (uint8_t *)&v17, 0xCu);
    }

  }
  else
  {
    HFLogForCategory();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v6, "allUtilities");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 136315394;
      v18 = "-[HUUtilityDiscoverySetupViewController initWithHome:onboardingContext:]";
      v19 = 2048;
      v20 = objc_msgSend(v15, "count");
      _os_log_impl(&dword_1B8E1E000, v14, OS_LOG_TYPE_DEFAULT, "%s NOT single utility mode. Count = %lu", (uint8_t *)&v17, 0x16u);

    }
    v10->_singleUtilityMode = 0;
  }

  return v10;
}

- (void)_continueOnboarding:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  NSObject *v16;
  _BOOL4 v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  int v22;
  HUUtilityDiscoverySetupViewController *v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUUtilityDiscoverySetupViewController config](self, "config");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    HFLogForCategory();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v22 = 138412546;
      v23 = self;
      v24 = 2080;
      v25 = "-[HUUtilityDiscoverySetupViewController _continueOnboarding:]";
      _os_log_impl(&dword_1B8E1E000, v19, OS_LOG_TYPE_DEFAULT, "%@: Configuration is nil  %s", (uint8_t *)&v22, 0x16u);
    }

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 7);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v20, CFSTR("HUUtilityDiscoveryOnboardingKey_UserInput"));

    HFLogForCategory();
    v18 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      goto LABEL_14;
LABEL_13:
    v22 = 138412802;
    v23 = self;
    v24 = 2080;
    v25 = "-[HUUtilityDiscoverySetupViewController _continueOnboarding:]";
    v26 = 2112;
    v27 = v4;
    _os_log_impl(&dword_1B8E1E000, v18, OS_LOG_TYPE_DEFAULT, "%@ Finished %s with results  %@", (uint8_t *)&v22, 0x20u);
LABEL_14:

    -[HUUtilityDiscoverySetupViewController delegate](self, "delegate");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "viewController:didFinishWithConfigurationResults:", self, v4);

    goto LABEL_18;
  }
  -[HUUtilityDiscoverySetupViewController config](self, "config");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUUtilityDiscoverySetupViewController onboardingContext](self, "onboardingContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setConfig:", v6);

  -[HUUtilityDiscoverySetupViewController selectedUtilityInfo](self, "selectedUtilityInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("utilityID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUUtilityDiscoverySetupViewController onboardingContext](self, "onboardingContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setUtilityID:", v9);

  objc_opt_class();
  -[HUUtilityDiscoverySetupViewController selectedUtilityInfo](self, "selectedUtilityInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("logo"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v13 = v12;
  else
    v13 = 0;
  v14 = v13;

  -[HUUtilityDiscoverySetupViewController onboardingContext](self, "onboardingContext");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setUtilityLogo:", v14);

  LODWORD(v15) = -[HUUtilityDiscoverySetupViewController tafEnabledForSelectedUtility](self, "tafEnabledForSelectedUtility");
  HFLogForCategory();
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
  if ((_DWORD)v15)
  {
    if (v17)
    {
      v22 = 138412546;
      v23 = self;
      v24 = 2080;
      v25 = "-[HUUtilityDiscoverySetupViewController _continueOnboarding:]";
      _os_log_impl(&dword_1B8E1E000, v16, OS_LOG_TYPE_DEFAULT, "%@: Continue onboarding with TAF  %s", (uint8_t *)&v22, 0x16u);
    }

    objc_msgSend(v4, "setObject:forKeyedSubscript:", &unk_1E7041128, CFSTR("HUUtilityDiscoveryOnboardingKey_UserInput"));
    HFLogForCategory();
    v18 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      goto LABEL_14;
    goto LABEL_13;
  }
  if (v17)
  {
    v22 = 138412546;
    v23 = self;
    v24 = 2080;
    v25 = "-[HUUtilityDiscoverySetupViewController _continueOnboarding:]";
    _os_log_impl(&dword_1B8E1E000, v16, OS_LOG_TYPE_DEFAULT, "%@: Continue onboarding with OAuth  %s", (uint8_t *)&v22, 0x16u);
  }

  -[HUUtilityDiscoverySetupViewController _startOAuthLogin:](self, "_startOAuthLogin:", v4);
LABEL_18:

}

- (void)_loginWithAccount:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  int v15;
  HUUtilityDiscoverySetupViewController *v16;
  __int16 v17;
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 138412546;
    v16 = self;
    v17 = 2080;
    v18 = "-[HUUtilityDiscoverySetupViewController _loginWithAccount:]";
    _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "%@:%s User tapped button", (uint8_t *)&v15, 0x16u);
  }

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUUtilityDiscoverySetupViewController config](self, "config");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUUtilityDiscoverySetupViewController onboardingContext](self, "onboardingContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setConfig:", v6);

  -[HUUtilityDiscoverySetupViewController selectedUtilityID](self, "selectedUtilityID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUUtilityDiscoverySetupViewController onboardingContext](self, "onboardingContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setUtilityID:", v8);

  objc_opt_class();
  -[HUUtilityDiscoverySetupViewController selectedUtilityInfo](self, "selectedUtilityInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("logo"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v12 = v11;
  else
    v12 = 0;
  v13 = v12;

  -[HUUtilityDiscoverySetupViewController onboardingContext](self, "onboardingContext");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setUtilityLogo:", v13);

  -[HUUtilityDiscoverySetupViewController _startOAuthLogin:](self, "_startOAuthLogin:", v5);
}

- (void)_cancelUtilityOnboarding:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  uint8_t buf[4];
  HUUtilityDiscoverySetupViewController *v11;
  __int16 v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v11 = self;
    v12 = 2080;
    v13 = "-[HUUtilityDiscoverySetupViewController _cancelUtilityOnboarding:]";
    _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "%@:%s User tapped button", buf, 0x16u);
  }

  -[HUUtilityDiscoverySetupViewController selectedUtilityID](self, "selectedUtilityID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[HUHomeEnergyAnalyticsHelper sendUtilityOnboardingCancelledEventWithUtilityID:sourceViewController:](HUHomeEnergyAnalyticsHelper, "sendUtilityOnboardingCancelledEventWithUtilityID:sourceViewController:", v5, 0);

  -[HUUtilityDiscoverySetupViewController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = CFSTR("HUUtilityDiscoveryOnboardingKey_UserInput");
  v9 = &unk_1E7041140;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v9, &v8, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "viewController:didFinishWithConfigurationResults:", self, v7);

}

- (id)_fetchUtilityConfig
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  _QWORD v13[5];
  uint8_t buf[4];
  HUUtilityDiscoverySetupViewController *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[HUUtilityDiscoverySetupViewController selectedUtilityID](self, "selectedUtilityID");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3
    && (v4 = (void *)v3,
        -[HUUtilityDiscoverySetupViewController selectedUtilityID](self, "selectedUtilityID"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "length"),
        v5,
        v4,
        v6))
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __60__HUUtilityDiscoverySetupViewController__fetchUtilityConfig__block_invoke;
    v13[3] = &unk_1E6F4C660;
    v13[4] = self;
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithBlock:", v13);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D519E8], "mainThreadScheduler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "reschedule:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    HFLogForCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v15 = self;
      _os_log_error_impl(&dword_1B8E1E000, v10, OS_LOG_TYPE_ERROR, "%@: Selected utility ID is empty", buf, 0xCu);
    }

    v11 = (void *)MEMORY[0x1E0D519C0];
    objc_msgSend(MEMORY[0x1E0CB35C8], "na_genericError");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "futureWithError:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

void __60__HUUtilityDiscoverySetupViewController__fetchUtilityConfig__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id location;
  uint8_t buf[4];
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_initWeak(&location, *(id *)(a1 + 32));
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v13 = v5;
    _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "%@: IN FUTURE", buf, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "selectedUtilityID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __60__HUUtilityDiscoverySetupViewController__fetchUtilityConfig__block_invoke_74;
  v8[3] = &unk_1E6F563D0;
  objc_copyWeak(&v10, &location);
  v7 = v3;
  v9 = v7;
  +[HUHomeEnergyManagerHelper utilityInformation:completionHandler:](HUHomeEnergyManagerHelper, "utilityInformation:completionHandler:", v6, v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

void __60__HUUtilityDiscoverySetupViewController__fetchUtilityConfig__block_invoke_74(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  NSObject *v8;
  _BOOL4 v9;
  int v10;
  id v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  HFLogForCategory();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v9)
    {
      v10 = 138412546;
      v11 = WeakRetained;
      v12 = 2112;
      v13 = v6;
      _os_log_impl(&dword_1B8E1E000, v8, OS_LOG_TYPE_DEFAULT, "%@: completion error (%@)", (uint8_t *)&v10, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v6);
  }
  else
  {
    if (v9)
    {
      v10 = 138412290;
      v11 = WeakRetained;
      _os_log_impl(&dword_1B8E1E000, v8, OS_LOG_TYPE_DEFAULT, "%@: utility configuration fetched", (uint8_t *)&v10, 0xCu);
    }

    objc_msgSend(WeakRetained, "setConfig:", v5);
    objc_msgSend(*(id *)(a1 + 32), "finishWithResult:", v5);
  }

}

- (id)_fetchUtilityConfigAndCheckTAF
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  _QWORD v14[5];
  uint8_t buf[4];
  HUUtilityDiscoverySetupViewController *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[HUUtilityDiscoverySetupViewController selectedUtilityID](self, "selectedUtilityID");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3
    && (v4 = (void *)v3,
        -[HUUtilityDiscoverySetupViewController selectedUtilityID](self, "selectedUtilityID"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "length"),
        v5,
        v4,
        v6))
  {
    -[HUUtilityDiscoverySetupViewController _fetchUtilityConfig](self, "_fetchUtilityConfig");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __71__HUUtilityDiscoverySetupViewController__fetchUtilityConfigAndCheckTAF__block_invoke;
    v14[3] = &unk_1E6F563F8;
    v14[4] = self;
    objc_msgSend(v7, "flatMap:", v14);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D519E8], "mainThreadScheduler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "reschedule:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    HFLogForCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v16 = self;
      _os_log_error_impl(&dword_1B8E1E000, v11, OS_LOG_TYPE_ERROR, "%@: Selected utility ID is empty", buf, 0xCu);
    }

    v12 = (void *)MEMORY[0x1E0D519C0];
    objc_msgSend(MEMORY[0x1E0CB35C8], "na_genericError");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "futureWithError:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

id __71__HUUtilityDiscoverySetupViewController__fetchUtilityConfigAndCheckTAF__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[5];
  id v9;

  v3 = a2;
  v4 = (void *)MEMORY[0x1E0D519C0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __71__HUUtilityDiscoverySetupViewController__fetchUtilityConfigAndCheckTAF__block_invoke_2;
  v8[3] = &unk_1E6F4D600;
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v3;
  v5 = v3;
  objc_msgSend(v4, "futureWithBlock:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __71__HUUtilityDiscoverySetupViewController__fetchUtilityConfigAndCheckTAF__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  uint64_t v11;
  __int16 v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412546;
    v11 = v5;
    v12 = 2080;
    v13 = "-[HUUtilityDiscoverySetupViewController _fetchUtilityConfigAndCheckTAF]_block_invoke_2";
    _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "%@: IN TAF FUTURE  %s", buf, 0x16u);
  }

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __71__HUUtilityDiscoverySetupViewController__fetchUtilityConfigAndCheckTAF__block_invoke_78;
  v8[3] = &unk_1E6F4E048;
  v6 = *(void **)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v3;
  v7 = v3;
  objc_msgSend(v6, "isTAFEnabledWithCompletionHandler:", v8);

}

void __71__HUUtilityDiscoverySetupViewController__fetchUtilityConfigAndCheckTAF__block_invoke_78(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v8 = 138412546;
    v9 = v5;
    v10 = 2080;
    v11 = "-[HUUtilityDiscoverySetupViewController _fetchUtilityConfigAndCheckTAF]_block_invoke";
    _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "%@: COMPLETION HANDLER  %s", (uint8_t *)&v8, 0x16u);
  }

  v6 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "finishWithResult:", v7);

}

- (id)_checkTAF:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0D519C0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __51__HUUtilityDiscoverySetupViewController__checkTAF___block_invoke;
  v9[3] = &unk_1E6F4D600;
  v9[4] = self;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "futureWithBlock:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __51__HUUtilityDiscoverySetupViewController__checkTAF___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  uint64_t v11;
  __int16 v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412546;
    v11 = v5;
    v12 = 2080;
    v13 = "-[HUUtilityDiscoverySetupViewController _checkTAF:]_block_invoke";
    _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "%@: IN TAF FUTURE  %s", buf, 0x16u);
  }

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __51__HUUtilityDiscoverySetupViewController__checkTAF___block_invoke_81;
  v8[3] = &unk_1E6F4E048;
  v6 = *(void **)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v3;
  v7 = v3;
  objc_msgSend(v6, "isTAFEnabledWithCompletionHandler:", v8);

}

void __51__HUUtilityDiscoverySetupViewController__checkTAF___block_invoke_81(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v8 = 138412546;
    v9 = v5;
    v10 = 2080;
    v11 = "-[HUUtilityDiscoverySetupViewController _checkTAF:]_block_invoke";
    _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "%@: COMPLETION HANDLER  %s", (uint8_t *)&v8, 0x16u);
  }

  v6 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "finishWithResult:", v7);

}

- (BOOL)needsToWaitForPreload
{
  return 1;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  UITableView *v35;
  UITableView *providerSelectionTableView;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  NSLayoutConstraint *v44;
  NSLayoutConstraint *providerTableViewHeightConstraint;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  NSObject *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  objc_super v76;
  _QWORD v77[6];
  uint8_t buf[4];
  HUUtilityDiscoverySetupViewController *v79;
  __int16 v80;
  const char *v81;
  __int16 v82;
  void *v83;
  __int16 v84;
  void *v85;
  __int16 v86;
  void *v87;
  uint64_t v88;

  v88 = *MEMORY[0x1E0C80C00];
  v76.receiver = self;
  v76.super_class = (Class)HUUtilityDiscoverySetupViewController;
  -[OBBaseWelcomeController viewDidLoad](&v76, sel_viewDidLoad);
  -[HUUtilityDiscoverySetupViewController headerView](self, "headerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "subviews");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[HUAccessibilityIdentifierUtilities setAccessibilityIDForViews:withIDDictionary:](HUAccessibilityIdentifierUtilities, "setAccessibilityIDForViews:withIDDictionary:", v4, &unk_1E7043040);

  if (-[HUUtilityDiscoverySetupViewController errorFetchingUtilities](self, "errorFetchingUtilities"))
  {
    -[HUUtilityDiscoverySetupViewController headerView](self, "headerView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    _HULocalizedStringWithDefaultValue(CFSTR("HUUtilityOnboarding_CannotOnboard_Title"), CFSTR("HUUtilityOnboarding_CannotOnboard_Title"), 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTitle:", v6);

    -[HUUtilityDiscoverySetupViewController headerView](self, "headerView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    _HULocalizedStringWithDefaultValue(CFSTR("HUUtilityOnboarding_CannotOnboard_Detail"), CFSTR("HUUtilityOnboarding_CannotOnboard_Detail"), 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDetailText:", v8);

    objc_msgSend(MEMORY[0x1E0D65140], "boldButton");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    _HULocalizedStringWithDefaultValue(CFSTR("HUDoneTitle"), CFSTR("HUDoneTitle"), 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTitle:forState:", v10, 0);

    objc_msgSend(v9, "setAccessibilityIdentifier:", CFSTR("Home.OnboardingView.Utility.SetUp.DoneButton"));
    objc_msgSend(v9, "addTarget:action:forControlEvents:", self, sel__cancelUtilityOnboarding_, 64);
    -[HUUtilityDiscoverySetupViewController buttonTray](self, "buttonTray");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addButton:", v9);

    HFLogForCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v79 = self;
      v80 = 2080;
      v81 = "-[HUUtilityDiscoverySetupViewController viewDidLoad]";
      _os_log_impl(&dword_1B8E1E000, v12, OS_LOG_TYPE_DEFAULT, "%@:%s: ERROR fetching utilities HUUtilityDiscoverySetupViewController. Presenting error view.", buf, 0x16u);
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D65140], "boldButton");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUUtilityDiscoverySetupViewController setContinueOnboardingButton:](self, "setContinueOnboardingButton:", v13);

    -[HUUtilityDiscoverySetupViewController continueOnboardingButton](self, "continueOnboardingButton");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[HUUtilityDiscoverySetupViewController continueOnboardingButton](self, "continueOnboardingButton");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    _HULocalizedStringWithDefaultValue(CFSTR("HUContinueTitle"), CFSTR("HUContinueTitle"), 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setTitle:forState:", v16, 0);

    -[HUUtilityDiscoverySetupViewController continueOnboardingButton](self, "continueOnboardingButton");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setAccessibilityIdentifier:", CFSTR("Home.OnboardingView.Utility.SetUp.ContinueButton"));

    objc_msgSend(MEMORY[0x1E0D65170], "linkButton");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUUtilityDiscoverySetupViewController setAccountLoginButton:](self, "setAccountLoginButton:", v18);

    -[HUUtilityDiscoverySetupViewController accountLoginButton](self, "accountLoginButton");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[HUUtilityDiscoverySetupViewController accountLoginButton](self, "accountLoginButton");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    _HULocalizedStringWithDefaultValue(CFSTR("HUUtilityOnboarding_AccountLogin_Button"), CFSTR("HUUtilityOnboarding_AccountLogin_Button"), 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setTitle:forState:", v21, 0);

    -[HUUtilityDiscoverySetupViewController accountLoginButton](self, "accountLoginButton");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setAccessibilityIdentifier:", CFSTR("Home.OnboardingView.Utility.SetUp.UseUtilityAccountButton"));

    -[HUUtilityDiscoverySetupViewController continueOnboardingButton](self, "continueOnboardingButton");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addTarget:action:forControlEvents:", self, sel__continueOnboarding_, 64);

    -[HUUtilityDiscoverySetupViewController accountLoginButton](self, "accountLoginButton");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addTarget:action:forControlEvents:", self, sel__loginWithAccount_, 64);

    -[HUUtilityDiscoverySetupViewController buttonTray](self, "buttonTray");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUUtilityDiscoverySetupViewController continueOnboardingButton](self, "continueOnboardingButton");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addButton:", v26);

    -[HUUtilityDiscoverySetupViewController onboardingContext](self, "onboardingContext");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "allUtilities");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "objectAtIndexedSubscript:", 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("utilityID"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUUtilityDiscoverySetupViewController setSelectedUtilityID:](self, "setSelectedUtilityID:", v30);

    -[HUUtilityDiscoverySetupViewController onboardingContext](self, "onboardingContext");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "allUtilities");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "objectAtIndexedSubscript:", 0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUUtilityDiscoverySetupViewController setSelectedUtilityInfo:](self, "setSelectedUtilityInfo:", v33);

    -[HUUtilityDiscoverySetupViewController _buttonAction](self, "_buttonAction");
    v34 = objc_alloc(MEMORY[0x1E0CEAA58]);
    v35 = (UITableView *)objc_msgSend(v34, "initWithFrame:style:", 2, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    providerSelectionTableView = self->_providerSelectionTableView;
    self->_providerSelectionTableView = v35;

    HFLogForCategory();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      -[HUUtilityDiscoverySetupViewController view](self, "view");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUUtilityDiscoverySetupViewController contentView](self, "contentView");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUUtilityDiscoverySetupViewController providerSelectionTableView](self, "providerSelectionTableView");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413314;
      v79 = self;
      v80 = 2080;
      v81 = "-[HUUtilityDiscoverySetupViewController viewDidLoad]";
      v82 = 2112;
      v83 = v38;
      v84 = 2112;
      v85 = v39;
      v86 = 2112;
      v87 = v40;
      _os_log_impl(&dword_1B8E1E000, v37, OS_LOG_TYPE_DEFAULT, "%@:%s: HUUtilityDiscoverySetupViewController\n self.view: %@\n self.contentView: %@\n self.tableView: %@", buf, 0x34u);

    }
    -[UITableView setTranslatesAutoresizingMaskIntoConstraints:](self->_providerSelectionTableView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UITableView setAllowsSelection:](self->_providerSelectionTableView, "setAllowsSelection:", -[HUUtilityDiscoverySetupViewController singleUtilityMode](self, "singleUtilityMode") ^ 1);
    -[UITableView setScrollEnabled:](self->_providerSelectionTableView, "setScrollEnabled:", 0);
    -[UITableView setDelegate:](self->_providerSelectionTableView, "setDelegate:", self);
    -[UITableView setDataSource:](self->_providerSelectionTableView, "setDataSource:", self);
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITableView setBackgroundColor:](self->_providerSelectionTableView, "setBackgroundColor:", v41);

    -[UITableView registerClass:forCellReuseIdentifier:](self->_providerSelectionTableView, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("Cell"));
    -[HUUtilityDiscoverySetupViewController contentView](self, "contentView");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "addSubview:", self->_providerSelectionTableView);

    -[UITableView heightAnchor](self->_providerSelectionTableView, "heightAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "constraintEqualToConstant:", 1.0);
    v44 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    providerTableViewHeightConstraint = self->_providerTableViewHeightConstraint;
    self->_providerTableViewHeightConstraint = v44;

    v64 = (void *)MEMORY[0x1E0CB3718];
    -[HUUtilityDiscoverySetupViewController providerSelectionTableView](self, "providerSelectionTableView");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "leadingAnchor");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUUtilityDiscoverySetupViewController contentView](self, "contentView");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "leadingAnchor");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "constraintEqualToAnchor:", v72);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v77[0] = v71;
    -[HUUtilityDiscoverySetupViewController providerSelectionTableView](self, "providerSelectionTableView");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "trailingAnchor");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUUtilityDiscoverySetupViewController contentView](self, "contentView");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "trailingAnchor");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "constraintEqualToAnchor:", v67);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v77[1] = v66;
    -[HUUtilityDiscoverySetupViewController providerSelectionTableView](self, "providerSelectionTableView");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "topAnchor");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUUtilityDiscoverySetupViewController contentView](self, "contentView");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "topAnchor");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "constraintEqualToAnchor:", v61);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v77[2] = v60;
    -[HUUtilityDiscoverySetupViewController providerSelectionTableView](self, "providerSelectionTableView");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "bottomAnchor");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUUtilityDiscoverySetupViewController contentView](self, "contentView");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "bottomAnchor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "constraintEqualToAnchor:", v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v77[3] = v47;
    -[HUUtilityDiscoverySetupViewController providerSelectionTableView](self, "providerSelectionTableView");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "centerXAnchor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUUtilityDiscoverySetupViewController contentView](self, "contentView");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "centerXAnchor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "constraintEqualToAnchor:", v51);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v77[4] = v52;
    -[HUUtilityDiscoverySetupViewController providerTableViewHeightConstraint](self, "providerTableViewHeightConstraint");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v77[5] = v53;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v77, 6);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "activateConstraints:", v54);

    -[HUUtilityDiscoverySetupViewController contentView](self, "contentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setClipsToBounds:", 1);
  }

  HFLogForCategory();
  v55 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v79 = self;
    v80 = 2080;
    v81 = "-[HUUtilityDiscoverySetupViewController viewDidLoad]";
    _os_log_impl(&dword_1B8E1E000, v55, OS_LOG_TYPE_DEFAULT, "%@:%s: presented: HUUtilityDiscoverySetupViewController", buf, 0x16u);
  }

  -[HUUtilityDiscoverySetupViewController foundUtilities](self, "foundUtilities");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  +[HUHomeEnergyAnalyticsHelper sendUtilityIntroAndSelectionSheetViewEventWithNumOfUtilities:](HUHomeEnergyAnalyticsHelper, "sendUtilityIntroAndSelectionSheetViewEventWithNumOfUtilities:", objc_msgSend(v56, "count"));

}

- (void)viewWillLayoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HUUtilityDiscoverySetupViewController;
  -[HUUtilityDiscoverySetupViewController viewWillLayoutSubviews](&v4, sel_viewWillLayoutSubviews);
  -[HUUtilityDiscoverySetupViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNeedsUpdateConstraints");

}

- (void)updateViewConstraints
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  objc_super v7;

  -[HUUtilityDiscoverySetupViewController providerSelectionTableView](self, "providerSelectionTableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentSize");
  v5 = v4;
  -[HUUtilityDiscoverySetupViewController providerTableViewHeightConstraint](self, "providerTableViewHeightConstraint");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setConstant:", v5);

  v7.receiver = self;
  v7.super_class = (Class)HUUtilityDiscoverySetupViewController;
  -[HUUtilityDiscoverySetupViewController updateViewConstraints](&v7, sel_updateViewConstraints);
}

- (void)viewDidAppear:(BOOL)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  HUUtilityDiscoverySetupViewController *v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    -[HUUtilityDiscoverySetupViewController view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUUtilityDiscoverySetupViewController contentView](self, "contentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUUtilityDiscoverySetupViewController providerSelectionTableView](self, "providerSelectionTableView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138413314;
    v9 = self;
    v10 = 2080;
    v11 = "-[HUUtilityDiscoverySetupViewController viewDidAppear:]";
    v12 = 2112;
    v13 = v5;
    v14 = 2112;
    v15 = v6;
    v16 = 2112;
    v17 = v7;
    _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "%@:%s: HUUtilityDiscoverySetupViewController\nself.view:%@\nself.contentView: %@\nself.tableView: %@", (uint8_t *)&v8, 0x34u);

  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  NSObject *v4;
  void *v5;
  objc_super v6;
  uint8_t buf[4];
  HUUtilityDiscoverySetupViewController *v8;
  __int16 v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)HUUtilityDiscoverySetupViewController;
  -[HUUtilityDiscoverySetupViewController viewWillDisappear:](&v6, sel_viewWillDisappear_, a3);
  if (-[HUUtilityDiscoverySetupViewController isMovingFromParentViewController](self, "isMovingFromParentViewController"))
  {
    HFLogForCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v8 = self;
      v9 = 2080;
      v10 = "-[HUUtilityDiscoverySetupViewController viewWillDisappear:]";
      _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "%@:%s User tapped BACK button", buf, 0x16u);
    }

    -[HUUtilityDiscoverySetupViewController delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "viewControllerDidGoBack:", self);

  }
}

- (void)_buttonAction
{
  NSObject *v3;
  void *v4;
  id v5;
  _QWORD v6[5];
  uint8_t buf[4];
  HUUtilityDiscoverySetupViewController *v8;
  __int16 v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v8 = self;
    v9 = 2080;
    v10 = "-[HUUtilityDiscoverySetupViewController _buttonAction]";
    _os_log_impl(&dword_1B8E1E000, v3, OS_LOG_TYPE_DEFAULT, "%@:%s IN Menu action", buf, 0x16u);
  }

  -[HUUtilityDiscoverySetupViewController _fetchUtilityConfigAndCheckTAF](self, "_fetchUtilityConfigAndCheckTAF");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __54__HUUtilityDiscoverySetupViewController__buttonAction__block_invoke;
  v6[3] = &unk_1E6F56420;
  v6[4] = self;
  v5 = (id)objc_msgSend(v4, "addCompletionBlock:", v6);

}

void __54__HUUtilityDiscoverySetupViewController__buttonAction__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  int v13;
  _BOOL4 v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  const __CFString *v19;
  void *v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  HFLogForCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v18 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      v22 = v18;
      v23 = 2112;
      v24 = v6;
      _os_log_error_impl(&dword_1B8E1E000, v8, OS_LOG_TYPE_ERROR, "%@: completion error (%@)", buf, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(a1 + 32);
    v19 = CFSTR("HUUtilityDiscoveryOnboardingKey_UserInput");
    v20 = &unk_1E7041158;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject viewController:didFinishWithConfigurationResults:](v9, "viewController:didFinishWithConfigurationResults:", v10, v11);

  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v12 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      v22 = v12;
      v23 = 1024;
      LODWORD(v24) = objc_msgSend(v5, "BOOLValue");
      _os_log_impl(&dword_1B8E1E000, v8, OS_LOG_TYPE_DEFAULT, "%@: utility configuration fetched. TAF result %{BOOL}d", buf, 0x12u);
    }

    objc_msgSend(*(id *)(a1 + 32), "setTafEnabledForSelectedUtility:", objc_msgSend(v5, "BOOLValue"));
    v13 = objc_msgSend(v5, "BOOLValue");
    HFLogForCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    v14 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    if (v13)
    {
      if (v14)
      {
        v15 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138412290;
        v22 = v15;
        _os_log_impl(&dword_1B8E1E000, v9, OS_LOG_TYPE_DEFAULT, "%@: Showing Login with Password button.", buf, 0xCu);
      }

      objc_msgSend(*(id *)(a1 + 32), "buttonTray");
      v9 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "accountLoginButton");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject addButton:](v9, "addButton:", v16);

    }
    else if (v14)
    {
      v17 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v22 = v17;
      _os_log_impl(&dword_1B8E1E000, v9, OS_LOG_TYPE_DEFAULT, "%@: Login with Password button NOT shown. Continue button will be used for OAuth.", buf, 0xCu);
    }
  }

}

- (void)_startOAuthLogin:(id)a3
{
  id v4;
  _TtC6HomeUI17OAuthLoginManager *v5;
  void *v6;
  void *v7;
  _TtC6HomeUI17OAuthLoginManager *v8;
  void *v9;
  uint64_t v10;
  _TtC6HomeUI17OAuthLoginManager *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  _QWORD *v21;
  _QWORD v22[5];
  id v23;
  _QWORD *v24;
  _QWORD v25[4];
  _TtC6HomeUI17OAuthLoginManager *v26;
  HUUtilityDiscoverySetupViewController *v27;
  _QWORD v28[4];

  v4 = a3;
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x2020000000;
  v28[3] = 7;
  -[HUUtilityDiscoverySetupViewController _showSpinner](self, "_showSpinner");
  v5 = [_TtC6HomeUI17OAuthLoginManager alloc];
  -[HUUtilityDiscoverySetupViewController config](self, "config");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "OAuthURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[OAuthLoginManager initWithAuthURL:presentingContext:](v5, "initWithAuthURL:presentingContext:", v7, self);

  v9 = (void *)MEMORY[0x1E0D519C0];
  v10 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __58__HUUtilityDiscoverySetupViewController__startOAuthLogin___block_invoke;
  v25[3] = &unk_1E6F4D600;
  v11 = v8;
  v26 = v11;
  v27 = self;
  objc_msgSend(v9, "futureWithBlock:", v25);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D519E8], "mainThreadScheduler");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "reschedule:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v22[0] = v10;
  v22[1] = 3221225472;
  v22[2] = __58__HUUtilityDiscoverySetupViewController__startOAuthLogin___block_invoke_134;
  v22[3] = &unk_1E6F56498;
  v22[4] = self;
  v24 = v28;
  v15 = v4;
  v23 = v15;
  objc_msgSend(v14, "flatMap:", v22);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v10;
  v19[1] = 3221225472;
  v19[2] = __58__HUUtilityDiscoverySetupViewController__startOAuthLogin___block_invoke_140;
  v19[3] = &unk_1E6F564C0;
  v19[4] = self;
  v17 = v15;
  v20 = v17;
  v21 = v28;
  v18 = (id)objc_msgSend(v16, "recover:", v19);

  _Block_object_dispose(v28, 8);
}

void __58__HUUtilityDiscoverySetupViewController__startOAuthLogin___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v3 = a2;
  v5 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __58__HUUtilityDiscoverySetupViewController__startOAuthLogin___block_invoke_2;
  v7[3] = &unk_1E6F56448;
  v7[4] = v4;
  v8 = v3;
  v6 = v3;
  objc_msgSend(v5, "startAuthenticationWithPresentationContext:completion:", v4, v7);

}

void __58__HUUtilityDiscoverySetupViewController__startOAuthLogin___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  HFLogForCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      v9 = *(_QWORD *)(a1 + 32);
      v11 = 138412546;
      v12 = v9;
      v13 = 2080;
      v14 = "-[HUUtilityDiscoverySetupViewController _startOAuthLogin:]_block_invoke_2";
      _os_log_impl(&dword_1B8E1E000, v7, OS_LOG_TYPE_DEFAULT, "%@:%s Found OAuth error", (uint8_t *)&v11, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 40), "finishWithError:", v6);
  }
  else
  {
    if (v8)
    {
      v10 = *(_QWORD *)(a1 + 32);
      v11 = 138412802;
      v12 = v10;
      v13 = 2080;
      v14 = "-[HUUtilityDiscoverySetupViewController _startOAuthLogin:]_block_invoke";
      v15 = 2112;
      v16 = v5;
      _os_log_impl(&dword_1B8E1E000, v7, OS_LOG_TYPE_DEFAULT, "%@:%s Found authCode: %@", (uint8_t *)&v11, 0x20u);
    }

    objc_msgSend(*(id *)(a1 + 40), "finishWithResult:", v5);
  }

}

id __58__HUUtilityDiscoverySetupViewController__startOAuthLogin___block_invoke_134(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  __int128 v13;
  _QWORD v14[5];
  __int128 v15;
  _QWORD v16[5];
  id v17;

  v3 = a2;
  v4 = (void *)MEMORY[0x1E0D519C0];
  v5 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __58__HUUtilityDiscoverySetupViewController__startOAuthLogin___block_invoke_2_135;
  v16[3] = &unk_1E6F4D600;
  v16[4] = *(_QWORD *)(a1 + 32);
  v17 = v3;
  v6 = v3;
  objc_msgSend(v4, "futureWithBlock:", v16);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D519E8], "mainThreadScheduler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "reschedule:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v5;
  v14[1] = 3221225472;
  v14[2] = __58__HUUtilityDiscoverySetupViewController__startOAuthLogin___block_invoke_137;
  v14[3] = &unk_1E6F56470;
  v14[4] = *(_QWORD *)(a1 + 32);
  v13 = *(_OWORD *)(a1 + 40);
  v10 = (id)v13;
  v15 = v13;
  objc_msgSend(v9, "addSuccessBlock:", v14);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

void __58__HUUtilityDiscoverySetupViewController__startOAuthLogin___block_invoke_2_135(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "continueOnboardingButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEnabled:", 0);

  objc_msgSend(*(id *)(a1 + 32), "accountLoginButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEnabled:", 0);

  objc_msgSend(*(id *)(a1 + 32), "onboardingContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __58__HUUtilityDiscoverySetupViewController__startOAuthLogin___block_invoke_3;
  v9[3] = &unk_1E6F4D1B0;
  v7 = *(_QWORD *)(a1 + 40);
  v9[4] = *(_QWORD *)(a1 + 32);
  v10 = v3;
  v8 = v3;
  objc_msgSend(v6, "createAccessTokenWithAuthCode:completionHandler:", v7, v9);

}

void __58__HUUtilityDiscoverySetupViewController__startOAuthLogin___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  const char *v7;
  int v8;
  const char *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v7 = *(const char **)(a1 + 32);
      v8 = 138412546;
      v9 = v7;
      v10 = 2112;
      v11 = v3;
      _os_log_error_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_ERROR, "%@: Error generating tokens %@", (uint8_t *)&v8, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 40), "finishWithError:", v3);
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(void **)(a1 + 32);
      v8 = 136315394;
      v9 = "-[HUUtilityDiscoverySetupViewController _startOAuthLogin:]_block_invoke";
      v10 = 2112;
      v11 = v6;
      _os_log_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_DEFAULT, "%s(%@) ---: Generated tokens", (uint8_t *)&v8, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 40), "finishWithNoResult");
  }

}

void __58__HUUtilityDiscoverySetupViewController__startOAuthLogin___block_invoke_137(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_hideSpinner");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v2, CFSTR("HUUtilityDiscoveryOnboardingKey_UserInput"));

  HFLogForCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v7 = 138412802;
    v8 = v4;
    v9 = 2080;
    v10 = "-[HUUtilityDiscoverySetupViewController _startOAuthLogin:]_block_invoke";
    v11 = 2112;
    v12 = v5;
    _os_log_impl(&dword_1B8E1E000, v3, OS_LOG_TYPE_DEFAULT, "%@ Finished %s with results  %@", (uint8_t *)&v7, 0x20u);
  }

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "viewController:didFinishWithConfigurationResults:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

id __58__HUUtilityDiscoverySetupViewController__startOAuthLogin___block_invoke_140(uint64_t a1, void *a2)
{
  char *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v18 = *(_QWORD *)(a1 + 32);
    v20 = 138412546;
    v21 = v18;
    v22 = 2112;
    v23 = v3;
    _os_log_error_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_ERROR, "%@: Future failed (%@)", (uint8_t *)&v20, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 32), "_hideSpinner");
  objc_msgSend(v3, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqual:", *MEMORY[0x1E0C92598]))
  {
    v6 = objc_msgSend(v3, "code");

    if (v6 == 1)
    {
      HFLogForCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v8 = *(_QWORD *)(a1 + 32);
        v20 = 138412546;
        v21 = v8;
        v22 = 2080;
        v23 = "-[HUUtilityDiscoverySetupViewController _startOAuthLogin:]_block_invoke";
        _os_log_impl(&dword_1B8E1E000, v7, OS_LOG_TYPE_DEFAULT, "%@:%s User canceled OAuth session", (uint8_t *)&v20, 0x16u);
      }

      objc_msgSend(*(id *)(a1 + 32), "continueOnboardingButton");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setEnabled:", 1);

      objc_msgSend(*(id *)(a1 + 32), "accountLoginButton");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setEnabled:", 1);
      goto LABEL_14;
    }
  }
  else
  {

  }
  HFLogForCategory();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    v19 = *(_QWORD *)(a1 + 32);
    v20 = 138412546;
    v21 = v19;
    v22 = 2080;
    v23 = "-[HUUtilityDiscoverySetupViewController _startOAuthLogin:]_block_invoke";
    _os_log_error_impl(&dword_1B8E1E000, v11, OS_LOG_TYPE_ERROR, "%@:%s In failure block. Found error during OAuth session", (uint8_t *)&v20, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v3, CFSTR("HUUtilityDiscoveryOnboardingKey_Error"));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 7;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v12, CFSTR("HUUtilityDiscoveryOnboardingKey_UserInput"));

  HFLogForCategory();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = *(_QWORD *)(a1 + 32);
    v15 = *(_QWORD *)(a1 + 40);
    v20 = 138412802;
    v21 = v14;
    v22 = 2080;
    v23 = "-[HUUtilityDiscoverySetupViewController _startOAuthLogin:]_block_invoke";
    v24 = 2112;
    v25 = v15;
    _os_log_impl(&dword_1B8E1E000, v13, OS_LOG_TYPE_DEFAULT, "%@ Finished %s with results  %@", (uint8_t *)&v20, 0x20u);
  }

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "viewController:didFinishWithConfigurationResults:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
LABEL_14:

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (void)_showSpinner
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA2C8]), "initWithActivityIndicatorStyle:", 100);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA380]), "initWithCustomView:", v8);
  -[OBBaseWelcomeController navigationItem](self, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRightBarButtonItem:", v3);

  -[HUUtilityDiscoverySetupViewController continueOnboardingButton](self, "continueOnboardingButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEnabled:", 0);

  -[HUUtilityDiscoverySetupViewController accountLoginButton](self, "accountLoginButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setEnabled:", 0);

  -[OBBaseWelcomeController navigationItem](self, "navigationItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setHidesBackButton:", 1);

  objc_msgSend(v8, "startAnimating");
}

- (void)_hideSpinner
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  objc_opt_class();
  -[OBBaseWelcomeController navigationItem](self, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rightBarButtonItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "customView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v11 = v6;

  -[OBBaseWelcomeController navigationItem](self, "navigationItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setRightBarButtonItem:", 0);

  -[HUUtilityDiscoverySetupViewController continueOnboardingButton](self, "continueOnboardingButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setEnabled:", 1);

  -[HUUtilityDiscoverySetupViewController accountLoginButton](self, "accountLoginButton");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setEnabled:", 1);

  -[OBBaseWelcomeController navigationItem](self, "navigationItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setHidesBackButton:", 0);

  objc_msgSend(v11, "stopAnimating");
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  void *v23;
  NSObject *v24;
  void *v25;
  int v27;
  HUUtilityDiscoverySetupViewController *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("Cell"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUUtilityDiscoverySetupViewController onboardingContext](self, "onboardingContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allUtilities");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v6, "row"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("longName"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("name"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "defaultContentConfiguration");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setText:", v12);
  if ((objc_msgSend(v12, "isEqualToString:", v11) & 1) == 0)
  {
    objc_msgSend(v13, "setSecondaryText:", v11);
    objc_msgSend(MEMORY[0x1E0CEA478], "secondaryLabelColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "secondaryTextProperties");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setColor:", v14);

  }
  objc_opt_class();
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("logo"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v17 = v16;
  else
    v17 = 0;
  v18 = v17;

  if (v18)
  {
    objc_msgSend(v13, "setImage:", v18);
    objc_msgSend(v13, "image");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setAccessibilityIdentifier:", CFSTR("Home.OnboardingView.Utility.Logo"));

    objc_msgSend(v13, "imageProperties");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setMaximumSize:", 37.0, 37.0);

    objc_msgSend(v13, "imageProperties");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setCornerRadius:", 8.325);

    v22 = *MEMORY[0x1E0CEB990];
    objc_msgSend(v13, "imageProperties");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setReservedLayoutSize:", 37.0, v22);

  }
  objc_msgSend(v7, "setContentConfiguration:", v13);
  HFLogForCategory();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    v27 = 138412290;
    v28 = self;
    _os_log_impl(&dword_1B8E1E000, v24, OS_LOG_TYPE_DEFAULT, "%@ Finished set up of cell", (uint8_t *)&v27, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CEA478], "tertiarySystemFillColor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBackgroundColor:", v25);

  if (!self->_singleUtilityMode && !objc_msgSend(v6, "row"))
    objc_msgSend(v7, "setAccessoryType:", 3);
  objc_msgSend(v7, "setAccessibilityIdentifier:", CFSTR("Home.OnboardingView.Utility.Setup.Cell"));

  return v7;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v4;
  void *v5;
  int64_t v6;

  -[HUUtilityDiscoverySetupViewController onboardingContext](self, "onboardingContext", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allUtilities");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  return v6;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t v30[128];
  uint8_t buf[4];
  HUUtilityDiscoverySetupViewController *v32;
  __int16 v33;
  const char *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  HFLogForCategory();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v32 = self;
    v33 = 2080;
    v34 = "-[HUUtilityDiscoverySetupViewController tableView:didSelectRowAtIndexPath:]";
    _os_log_impl(&dword_1B8E1E000, v8, OS_LOG_TYPE_DEFAULT, "%@:%s SELECTED ROW", buf, 0x16u);
  }

  objc_msgSend(v6, "cellForRowAtIndexPath:", v7);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  objc_msgSend(v6, "indexPathsForVisibleRows");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v27;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v27 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v13);
        objc_opt_class();
        objc_msgSend(v6, "cellForRowAtIndexPath:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v16 = v15;
        else
          v16 = 0;
        v17 = v16;

        objc_msgSend(v17, "setAccessoryType:", 0);
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v11);
  }

  objc_msgSend(v25, "setAccessoryType:", 3);
  -[HUUtilityDiscoverySetupViewController onboardingContext](self, "onboardingContext");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "allUtilities");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectAtIndexedSubscript:", objc_msgSend(v7, "row"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("utilityID"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUUtilityDiscoverySetupViewController setSelectedUtilityID:](self, "setSelectedUtilityID:", v21);

  -[HUUtilityDiscoverySetupViewController onboardingContext](self, "onboardingContext");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "allUtilities");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "objectAtIndexedSubscript:", objc_msgSend(v7, "row"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUUtilityDiscoverySetupViewController setSelectedUtilityInfo:](self, "setSelectedUtilityInfo:", v24);

  -[HUUtilityDiscoverySetupViewController _buttonAction](self, "_buttonAction");
}

- (Class)onboardingFlowClass
{
  return (Class)objc_opt_class();
}

- (id)presentationAnchorForWebAuthenticationSession:(id)a3
{
  void *v3;
  void *v4;

  -[HUUtilityDiscoverySetupViewController view](self, "view", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (HUConfigurationViewControllerDelegate)delegate
{
  return (HUConfigurationViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (HMHome)home
{
  return self->_home;
}

- (void)setHome:(id)a3
{
  objc_storeStrong((id *)&self->_home, a3);
}

- (_TtC6HomeUI24UtilityOnboardingContext)onboardingContext
{
  return (_TtC6HomeUI24UtilityOnboardingContext *)objc_loadWeakRetained((id *)&self->_onboardingContext);
}

- (void)setOnboardingContext:(id)a3
{
  objc_storeWeak((id *)&self->_onboardingContext, a3);
}

- (OBBoldTrayButton)continueOnboardingButton
{
  return self->_continueOnboardingButton;
}

- (void)setContinueOnboardingButton:(id)a3
{
  objc_storeStrong((id *)&self->_continueOnboardingButton, a3);
}

- (OBLinkTrayButton)accountLoginButton
{
  return self->_accountLoginButton;
}

- (void)setAccountLoginButton:(id)a3
{
  objc_storeStrong((id *)&self->_accountLoginButton, a3);
}

- (UIEdgeInsets)contentInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_contentInsets.top;
  left = self->_contentInsets.left;
  bottom = self->_contentInsets.bottom;
  right = self->_contentInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setContentInsets:(UIEdgeInsets)a3
{
  self->_contentInsets = a3;
}

- (UITableView)providerSelectionTableView
{
  return self->_providerSelectionTableView;
}

- (void)setProviderSelectionTableView:(id)a3
{
  objc_storeStrong((id *)&self->_providerSelectionTableView, a3);
}

- (NSLayoutConstraint)providerTableViewHeightConstraint
{
  return self->_providerTableViewHeightConstraint;
}

- (void)setProviderTableViewHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_providerTableViewHeightConstraint, a3);
}

- (HUUtilityConfigurationHelper)config
{
  return self->_config;
}

- (void)setConfig:(id)a3
{
  objc_storeStrong((id *)&self->_config, a3);
}

- (NSArray)foundUtilities
{
  return self->_foundUtilities;
}

- (void)setFoundUtilities:(id)a3
{
  objc_storeStrong((id *)&self->_foundUtilities, a3);
}

- (NSString)selectedUtilityID
{
  return self->_selectedUtilityID;
}

- (void)setSelectedUtilityID:(id)a3
{
  objc_storeStrong((id *)&self->_selectedUtilityID, a3);
}

- (NSDictionary)selectedUtilityInfo
{
  return self->_selectedUtilityInfo;
}

- (void)setSelectedUtilityInfo:(id)a3
{
  objc_storeStrong((id *)&self->_selectedUtilityInfo, a3);
}

- (NSArray)fields
{
  return self->_fields;
}

- (void)setFields:(id)a3
{
  objc_storeStrong((id *)&self->_fields, a3);
}

- (BOOL)tafEnabledForSelectedUtility
{
  return self->_tafEnabledForSelectedUtility;
}

- (void)setTafEnabledForSelectedUtility:(BOOL)a3
{
  self->_tafEnabledForSelectedUtility = a3;
}

- (BOOL)errorFetchingUtilities
{
  return self->_errorFetchingUtilities;
}

- (void)setErrorFetchingUtilities:(BOOL)a3
{
  self->_errorFetchingUtilities = a3;
}

- (BOOL)singleUtilityMode
{
  return self->_singleUtilityMode;
}

- (void)setSingleUtilityMode:(BOOL)a3
{
  self->_singleUtilityMode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fields, 0);
  objc_storeStrong((id *)&self->_selectedUtilityInfo, 0);
  objc_storeStrong((id *)&self->_selectedUtilityID, 0);
  objc_storeStrong((id *)&self->_foundUtilities, 0);
  objc_storeStrong((id *)&self->_config, 0);
  objc_storeStrong((id *)&self->_providerTableViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_providerSelectionTableView, 0);
  objc_storeStrong((id *)&self->_accountLoginButton, 0);
  objc_storeStrong((id *)&self->_continueOnboardingButton, 0);
  objc_destroyWeak((id *)&self->_onboardingContext);
  objc_storeStrong((id *)&self->_home, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
