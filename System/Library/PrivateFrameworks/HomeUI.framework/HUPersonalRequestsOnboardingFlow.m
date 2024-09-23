@implementation HUPersonalRequestsOnboardingFlow

- (HUPersonalRequestsOnboardingFlow)initWithUsageOptions:(id)a3 home:(id)a4
{
  id v6;
  id v7;
  HUPersonalRequestsOnboardingFlow *v8;
  HUPersonalRequestsOnboardingFlow *v9;
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
  v17.super_class = (Class)HUPersonalRequestsOnboardingFlow;
  v8 = -[HUPersonalRequestsOnboardingFlow init](&v17, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_home, a4);
    objc_initWeak(&location, v9);
    objc_msgSend((id)objc_opt_class(), "needsOnboardingForHome:options:", v7, v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __62__HUPersonalRequestsOnboardingFlow_initWithUsageOptions_home___block_invoke;
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

id __62__HUPersonalRequestsOnboardingFlow_initWithUsageOptions_home___block_invoke(uint64_t a1, void *a2)
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
  v8[2] = __62__HUPersonalRequestsOnboardingFlow_initWithUsageOptions_home___block_invoke_2;
  v8[3] = &unk_1E6F4E9E8;
  objc_copyWeak(&v10, (id *)(a1 + 32));
  v5 = v3;
  v9 = v5;
  objc_msgSend(v4, "futureWithBlock:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v10);
  return v6;
}

void __62__HUPersonalRequestsOnboardingFlow_initWithUsageOptions_home___block_invoke_2(uint64_t a1, void *a2)
{
  id WeakRetained;
  HUPersonalRequestsSetupViewController *v4;
  void *v5;
  HUPersonalRequestsSetupViewController *v6;
  id v7;

  v7 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (objc_msgSend(*(id *)(a1 + 32), "BOOLValue"))
  {
    v4 = [HUPersonalRequestsSetupViewController alloc];
    objc_msgSend(WeakRetained, "home");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[HUPersonalRequestsSetupViewController initWithHome:](v4, "initWithHome:", v5);
    objc_msgSend(WeakRetained, "setInitialViewController:", v6);

  }
  else
  {
    objc_msgSend(v7, "finishWithNoResult");
  }

}

- (NSString)description
{
  return (NSString *)CFSTR("Personal Requests Setup");
}

- (id)processUserInput:(id)a3
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  HUPersonalRequestsCustomizeViewController *v9;
  void *v10;
  void *v11;
  HUPersonalRequestsCustomizeViewController *v12;
  int v14;
  HUPersonalRequestsOnboardingFlow *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("HUPersonalRequestsOnboardingKey_UserInput"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  HFLogForCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138412802;
    v15 = self;
    v16 = 2112;
    v17 = v8;
    v18 = 2112;
    v19 = v5;
    _os_log_impl(&dword_1B8E1E000, v7, OS_LOG_TYPE_DEFAULT, "%@:%@ with input results: %@", (uint8_t *)&v14, 0x20u);

  }
  if (objc_msgSend(v6, "integerValue") == 1)
  {
    v9 = [HUPersonalRequestsCustomizeViewController alloc];
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("HUPersonalRequestsOnboardingKey_FMFDevice"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUPersonalRequestsOnboardingFlow home](self, "home");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[HUPersonalRequestsCustomizeViewController initWithLocationDevice:home:](v9, "initWithLocationDevice:home:", v10, v11);

LABEL_10:
    goto LABEL_11;
  }
  if (objc_msgSend(v6, "integerValue") == 2
    || objc_msgSend(v6, "integerValue") == 3
    || !objc_msgSend(v6, "integerValue"))
  {
    -[HUPersonalRequestsOnboardingFlow onboardingFuture](self, "onboardingFuture");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "finishWithNoResult");
    v12 = 0;
    goto LABEL_10;
  }
  v12 = 0;
LABEL_11:

  return v12;
}

+ (id)needsOnboardingForHome:(id)a3 options:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15[2];
  id location;

  v7 = a3;
  v8 = a4;
  if ((objc_msgSend(MEMORY[0x1E0D319D0], "isAMac") & 1) != 0
    || objc_msgSend(MEMORY[0x1E0D319D0], "isAVisionPro"))
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", MEMORY[0x1E0C9AAA0]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_initWeak(&location, a1);
    v10 = (void *)MEMORY[0x1E0D519C0];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __67__HUPersonalRequestsOnboardingFlow_needsOnboardingForHome_options___block_invoke;
    v12[3] = &unk_1E6F53808;
    objc_copyWeak(v15, &location);
    v13 = v7;
    v14 = v8;
    v15[1] = (id)a2;
    objc_msgSend(v10, "futureWithBlock:", v12);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_destroyWeak(v15);
    objc_destroyWeak(&location);
  }

  return v9;
}

void __67__HUPersonalRequestsOnboardingFlow_needsOnboardingForHome_options___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  int v5;
  unint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  NSObject *v21;
  int v22;
  _BOOL4 v23;
  uint64_t v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  int v28;
  unint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  int v34;
  id WeakRetained;
  _QWORD v36[5];
  uint8_t buf[4];
  id v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  _BYTE v42[24];
  __int16 v43;
  int v44;
  __int16 v45;
  _BOOL4 v46;
  __int16 v47;
  int v48;
  __int16 v49;
  int v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v3 = (id *)(a1 + 48);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  v5 = objc_msgSend(*(id *)(a1 + 32), "hf_hasHomePods");
  v6 = 0x1E0CB3000uLL;
  objc_opt_class();
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("OnboardingDisplayOption_OnboardingFromUserInput"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  v34 = objc_msgSend(v9, "BOOLValue");
  if (objc_msgSend(MEMORY[0x1E0D319D0], "isInternalInstall"))
  {
    objc_msgSend(*(id *)(a1 + 32), "accessories");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __67__HUPersonalRequestsOnboardingFlow_needsOnboardingForHome_options___block_invoke_2;
    v36[3] = &__block_descriptor_40_e21_B16__0__HMAccessory_8l;
    v36[4] = *(_QWORD *)(a1 + 56);
    v11 = objc_msgSend(v10, "na_any:", v36);

    if (v11)
    {
      objc_msgSend(MEMORY[0x1E0D313A0], "sharedHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:", 50);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleError:operationType:options:retryBlock:cancelBlock:", v13, *MEMORY[0x1E0D309F0], 0, 0, 0);

    }
  }
  if (v5)
  {
    +[HUHomeFeatureOnboardingUtilities fetchSupportedVoiceRecognitionLanguages](HUHomeFeatureOnboardingUtilities, "fetchSupportedVoiceRecognitionLanguages");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    HFLogForCategory();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(*(SEL *)(a1 + 56));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v14, "count");
      *(_DWORD *)buf = 138413058;
      v38 = WeakRetained;
      v39 = 2112;
      v40 = v16;
      v41 = 2048;
      *(_QWORD *)v42 = v17;
      *(_WORD *)&v42[8] = 2112;
      *(_QWORD *)&v42[10] = v14;
      _os_log_impl(&dword_1B8E1E000, v15, OS_LOG_TYPE_DEFAULT, "%@:%@ (%lu) supported voice recognition languages %@", buf, 0x2Au);

    }
    if (v14)
    {
      v18 = objc_alloc(MEMORY[0x1E0D31988]);
      v19 = *(void **)(a1 + 32);
      objc_msgSend(v19, "currentUser");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v18, "initWithHome:user:nameStyle:", v19, v20, 0);

      v22 = -[NSObject hasDismissedVoiceProfileOnboarding](v21, "hasDismissedVoiceProfileOnboarding");
      v23 = (v22 & 1) == 0
         && +[HUHomeFeatureOnboardingUtilities home:hasSomeHomePodsOnSupportedVoiceRecognitionLanguages:](HUHomeFeatureOnboardingUtilities, "home:hasSomeHomePodsOnSupportedVoiceRecognitionLanguages:", *(_QWORD *)(a1 + 32), v14);
      v6 = 0x1E0CB3000uLL;
      v24 = v34 | v23;
    }
    else
    {
      HFLogForCategory();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(*(SEL *)(a1 + 56));
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v38 = v33;
        _os_log_error_impl(&dword_1B8E1E000, v21, OS_LOG_TYPE_ERROR, "%@ Error fetching voice recognition languages", buf, 0xCu);

      }
      v23 = 0;
      v22 = 0;
      v24 = 0;
      v6 = 0x1E0CB3000;
    }

  }
  else
  {
    v23 = 0;
    v22 = 0;
    v24 = 0;
  }
  HFLogForCategory();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 56));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "currentUser");
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = v5;
    v29 = v6;
    v30 = (void *)v27;
    v31 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138414338;
    v38 = WeakRetained;
    v39 = 2112;
    v40 = v26;
    v41 = 1024;
    *(_DWORD *)v42 = v24;
    *(_WORD *)&v42[4] = 2112;
    *(_QWORD *)&v42[6] = v27;
    *(_WORD *)&v42[14] = 2112;
    *(_QWORD *)&v42[16] = v31;
    v43 = 1024;
    v44 = v28;
    v45 = 1024;
    v46 = v23;
    v47 = 1024;
    v48 = v22;
    v49 = 1024;
    v50 = v34;
    _os_log_impl(&dword_1B8E1E000, v25, OS_LOG_TYPE_DEFAULT, "%@:%@: ---> Can show?: %{BOOL}d <--- because: user(%@) in home(%@):\n\t\thasHomePods = %{BOOL}d\n\t\thasHomePodOnSupportedLanguage = %{BOOL}d\n\t\thasPreviouslyDismissed = %{BOOL}d\n\t\tonboardingFromUserInput = %{BOOL}d", buf, 0x48u);

    v6 = v29;
  }

  objc_msgSend(*(id *)(v6 + 2024), "numberWithBool:", v24);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "finishWithResult:", v32);

}

uint64_t __67__HUPersonalRequestsOnboardingFlow_needsOnboardingForHome_options___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "category");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    objc_msgSend(v3, "category");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "categoryType");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = (void *)v7;
      objc_msgSend(v3, "category");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "categoryType");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "length");

      if (v11)
      {
        v12 = 0;
        goto LABEL_9;
      }
    }
    else
    {

    }
  }
  HFLogForCategory();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(*(SEL *)(a1 + 32));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138412546;
    v17 = v15;
    v18 = 2112;
    v19 = v3;
    _os_log_error_impl(&dword_1B8E1E000, v13, OS_LOG_TYPE_ERROR, "%@ FOUND ACCESSORY WITH MISSING CATEGORY: %@ will fail hasHomePod checks if this is really a HomePod & it is the only one in the house.", (uint8_t *)&v16, 0x16u);

  }
  v12 = 1;
LABEL_9:

  return v12;
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
