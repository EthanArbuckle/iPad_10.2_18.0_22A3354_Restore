@implementation HUUtilityOnboardingFlow

- (HUUtilityOnboardingFlow)initWithUsageOptions:(id)a3 home:(id)a4
{
  id v6;
  id v7;
  HUUtilityOnboardingFlow *v8;
  HUUtilityOnboardingFlow *v9;
  _TtC6HomeUI24UtilityOnboardingContext *v10;
  _TtC6HomeUI24UtilityOnboardingContext *context;
  NAFuture *v12;
  NAFuture *readyFuture;
  void *v14;
  uint64_t v15;
  NAFuture *onboardingFuture;
  _QWORD v18[4];
  id v19;
  id location;
  objc_super v21;

  v6 = a3;
  v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)HUUtilityOnboardingFlow;
  v8 = -[HUUtilityOnboardingFlow init](&v21, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_home, a4);
    v9->_currentState = 0;
    v10 = -[UtilityOnboardingContext initWithHome:]([_TtC6HomeUI24UtilityOnboardingContext alloc], "initWithHome:", v7);
    context = v9->_context;
    v9->_context = v10;

    objc_initWeak(&location, v9);
    v12 = (NAFuture *)objc_alloc_init(MEMORY[0x1E0D519C0]);
    readyFuture = v9->_readyFuture;
    v9->_readyFuture = v12;

    +[HUUtilityOnboardingFlow lookupUtilities:](HUUtilityOnboardingFlow, "lookupUtilities:", v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __53__HUUtilityOnboardingFlow_initWithUsageOptions_home___block_invoke;
    v18[3] = &unk_1E6F55128;
    objc_copyWeak(&v19, &location);
    objc_msgSend(v14, "flatMap:", v18);
    v15 = objc_claimAutoreleasedReturnValue();
    onboardingFuture = v9->_onboardingFuture;
    v9->_onboardingFuture = (NAFuture *)v15;

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }

  return v9;
}

id __53__HUUtilityOnboardingFlow_initWithUsageOptions_home___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  v3 = a2;
  v4 = (void *)MEMORY[0x1E0D519C0];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __53__HUUtilityOnboardingFlow_initWithUsageOptions_home___block_invoke_2;
  v7[3] = &unk_1E6F53748;
  objc_copyWeak(&v8, (id *)(a1 + 32));
  objc_msgSend(v4, "futureWithBlock:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v8);

  return v5;
}

void __53__HUUtilityOnboardingFlow_initWithUsageOptions_home___block_invoke_2(uint64_t a1)
{
  HUUtilityOnboardingIntroViewController *v1;
  void *v2;
  HUUtilityOnboardingIntroViewController *v3;
  void *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_setThisUserDismissedOnboarding");
  v1 = [HUUtilityOnboardingIntroViewController alloc];
  objc_msgSend(WeakRetained, "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[HUUtilityOnboardingIntroViewController initWithContext:foundUtilities:nearbyUtilities:](v1, "initWithContext:foundUtilities:nearbyUtilities:", v2, unk_1ED580B90, _MergedGlobals_630);
  objc_msgSend(WeakRetained, "setInitialViewController:", v3);

  objc_msgSend(WeakRetained, "readyFuture");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "finishWithResult:", MEMORY[0x1E0C9AAB0]);

}

- (void)_setThisUserDismissedOnboarding
{
  void *v3;
  void *v4;
  id v5;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v6 = CFSTR("HUHomeFeatureOnboardingKey_UtilityDiscovery_FinishedOnboarding");
  v7[0] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUUtilityOnboardingFlow home](self, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = +[HUHomeFeatureOnboardingUtilities home:processHomeFeatureOnboarderResults:](HUHomeFeatureOnboardingUtilities, "home:processHomeFeatureOnboarderResults:", v4, v3);

}

+ (id)needsOnboardingForHome:(id)a3 options:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  id v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  char v27;
  uint8_t buf[4];
  id v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    v11 = (void *)MEMORY[0x1E0D519C0];
    v12 = MEMORY[0x1E0C9AAA0];
LABEL_11:
    objc_msgSend(v11, "futureWithResult:", v12);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  if (HFForceUtilityOnboarding())
  {
    HFLogForCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v29 = a1;
      v30 = 2112;
      v31 = v10;
      _os_log_impl(&dword_1B8E1E000, v9, OS_LOG_TYPE_DEFAULT, "%@:%@ FORCING Utility Onboarding", buf, 0x16u);
LABEL_9:

      goto LABEL_10;
    }
    goto LABEL_10;
  }
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("OnboardingDisplayOption_OnboardingFromUserInput"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "BOOLValue");

  if (v14)
  {
    HFLogForCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "name");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v29 = a1;
      v30 = 2112;
      v31 = v10;
      v32 = 2112;
      v33 = v15;
      _os_log_impl(&dword_1B8E1E000, v9, OS_LOG_TYPE_DEFAULT, "%@:%@ true for home(%@) because: onboarding", buf, 0x20u);

      goto LABEL_9;
    }
LABEL_10:

    v11 = (void *)MEMORY[0x1E0D519C0];
    v12 = MEMORY[0x1E0C9AAB0];
    goto LABEL_11;
  }
  v18 = objc_alloc(MEMORY[0x1E0D31988]);
  objc_msgSend(v7, "currentUser");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v18, "initWithHome:user:nameStyle:", v7, v19, 0);

  if (objc_msgSend(v20, "hasDismissedUtilityOnboarding"))
  {
    HFLogForCategory();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "name");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v29 = a1;
      v30 = 2112;
      v31 = v22;
      v32 = 2112;
      v33 = v23;
      _os_log_impl(&dword_1B8E1E000, v21, OS_LOG_TYPE_DEFAULT, "%@:%@ false for home(%@) because: previously dismissed", buf, 0x20u);

    }
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", MEMORY[0x1E0C9AAA0]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v24 = (void *)MEMORY[0x1E0D519C0];
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __58__HUUtilityOnboardingFlow_needsOnboardingForHome_options___block_invoke;
    v25[3] = &unk_1E6F51990;
    v26 = v7;
    v27 = 0;
    objc_msgSend(v24, "futureWithBlock:", v25);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
LABEL_12:

  return v16;
}

void __58__HUUtilityOnboardingFlow_needsOnboardingForHome_options___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  _BOOL8 v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_BYTE *)(a1 + 40) == 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __58__HUUtilityOnboardingFlow_needsOnboardingForHome_options___block_invoke_2;
  v7[3] = &unk_1E6F4E300;
  v8 = v3;
  v6 = v3;
  +[HUHomeEnergyManagerHelper couldOnboardUtilityWithHome:checkLocation:completionHandler:](HUHomeEnergyManagerHelper, "couldOnboardUtilityWithHome:checkLocation:completionHandler:", v4, v5, v7);

}

void __58__HUUtilityOnboardingFlow_needsOnboardingForHome_options___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "finishWithResult:", v3);

}

+ (id)_allUtilitiesFuture:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  id v11;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0D519C0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __47__HUUtilityOnboardingFlow__allUtilitiesFuture___block_invoke;
  v9[3] = &unk_1E6F53720;
  v10 = v4;
  v11 = a1;
  v6 = v4;
  objc_msgSend(v5, "futureWithBlock:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __47__HUUtilityOnboardingFlow__allUtilitiesFuture___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 136315394;
    v13 = "+[HUUtilityOnboardingFlow _allUtilitiesFuture:]_block_invoke";
    v14 = 2112;
    v15 = v5;
    _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "%s About to find all utilities in %@", buf, 0x16u);
  }

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __47__HUUtilityOnboardingFlow__allUtilitiesFuture___block_invoke_66;
  v9[3] = &unk_1E6F58EB0;
  v7 = *(_QWORD *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v10 = v3;
  v11 = v6;
  v8 = v3;
  +[HUHomeEnergyManagerHelper allUtilitiesInRegion:completionHandler:](HUHomeEnergyManagerHelper, "allUtilitiesInRegion:completionHandler:", v7, v9);

}

void __47__HUUtilityOnboardingFlow__allUtilitiesFuture___block_invoke_66(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  HFLogForCategory();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v11 = *(_QWORD *)(a1 + 40);
      v12 = 138412802;
      v13 = v11;
      v14 = 2080;
      v15 = "+[HUUtilityOnboardingFlow _allUtilitiesFuture:]_block_invoke";
      v16 = 2112;
      v17 = v7;
      _os_log_error_impl(&dword_1B8E1E000, v9, OS_LOG_TYPE_ERROR, "%@:%s UTILITIES IN REGION completion error (%@)", (uint8_t *)&v12, 0x20u);
    }

    objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v7);
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *(_QWORD *)(a1 + 40);
      v12 = 138412802;
      v13 = v10;
      v14 = 2080;
      v15 = "+[HUUtilityOnboardingFlow _allUtilitiesFuture:]_block_invoke";
      v16 = 2112;
      v17 = v6;
      _os_log_impl(&dword_1B8E1E000, v9, OS_LOG_TYPE_DEFAULT, "%@:%s All utilities in region %@", (uint8_t *)&v12, 0x20u);
    }

    objc_storeStrong(&qword_1ED580B90, a2);
    objc_msgSend(*(id *)(a1 + 32), "finishWithNoResult");
  }

}

+ (id)_utilityLookupFuture:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  id v11;

  v4 = a3;
  v5 = v4;
  v6 = (void *)MEMORY[0x1E0D519C0];
  if (v4)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __48__HUUtilityOnboardingFlow__utilityLookupFuture___block_invoke;
    v9[3] = &unk_1E6F53720;
    v10 = v4;
    v11 = a1;
    objc_msgSend(v6, "futureWithBlock:", v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

void __48__HUUtilityOnboardingFlow__utilityLookupFuture___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;
  uint8_t buf[4];
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v12 = "+[HUUtilityOnboardingFlow _utilityLookupFuture:]_block_invoke";
    _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "%s About to find utilities near home", buf, 0xCu);
  }

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __48__HUUtilityOnboardingFlow__utilityLookupFuture___block_invoke_68;
  v8[3] = &unk_1E6F58ED8;
  v6 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v9 = v3;
  v10 = v5;
  v7 = v3;
  +[HUHomeEnergyManagerHelper utilityLookupWithHome:completionHandler:](HUHomeEnergyManagerHelper, "utilityLookupWithHome:completionHandler:", v6, v8);

}

void __48__HUUtilityOnboardingFlow__utilityLookupFuture___block_invoke_68(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  id v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 40);
    v8 = 138412802;
    v9 = v5;
    v10 = 2080;
    v11 = "+[HUUtilityOnboardingFlow _utilityLookupFuture:]_block_invoke";
    v12 = 2112;
    v13 = v3;
    _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "%@:%s Found utilities in location %@", (uint8_t *)&v8, 0x20u);
  }

  v6 = (void *)_MergedGlobals_630;
  _MergedGlobals_630 = (uint64_t)v3;
  v7 = v3;

  objc_msgSend(*(id *)(a1 + 32), "finishWithNoResult");
}

+ (id)lookupUtilities:(id)a3
{
  id v4;
  NSObject *v5;
  HUHomeEnergyManagerHelper *v6;
  void *v7;
  uint64_t v8;
  HUHomeEnergyManagerHelper *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[5];
  _QWORD v15[4];
  id v16;
  id v17;
  _QWORD v18[4];
  HUHomeEnergyManagerHelper *v19;
  id v20;
  uint8_t buf[4];
  id v22;
  __int16 v23;
  const char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  HFLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v22 = a1;
    v23 = 2080;
    v24 = "+[HUUtilityOnboardingFlow lookupUtilities:]";
    _os_log_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_DEFAULT, "%@:%s Starting Utility Lookup", buf, 0x16u);
  }

  if (v4)
  {
    v6 = -[HUHomeEnergyManagerHelper initWithHome:]([HUHomeEnergyManagerHelper alloc], "initWithHome:", v4);
    v7 = (void *)MEMORY[0x1E0D519C0];
    v8 = MEMORY[0x1E0C809B0];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __43__HUUtilityOnboardingFlow_lookupUtilities___block_invoke;
    v18[3] = &unk_1E6F53720;
    v19 = v6;
    v20 = a1;
    v9 = v6;
    objc_msgSend(v7, "futureWithBlock:", v18);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v8;
    v15[1] = 3221225472;
    v15[2] = __43__HUUtilityOnboardingFlow_lookupUtilities___block_invoke_71;
    v15[3] = &unk_1E6F58F28;
    v17 = a1;
    v16 = v4;
    objc_msgSend(v10, "flatMap:", v15);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v8;
    v14[1] = 3221225472;
    v14[2] = __43__HUUtilityOnboardingFlow_lookupUtilities___block_invoke_75;
    v14[3] = &__block_descriptor_40_e27___NAFuture_16__0__NSError_8l;
    v14[4] = a1;
    objc_msgSend(v11, "recover:", v14);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

void __43__HUUtilityOnboardingFlow_lookupUtilities___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;

  v3 = a2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __43__HUUtilityOnboardingFlow_lookupUtilities___block_invoke_2;
  v7[3] = &unk_1E6F58F00;
  v5 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v8 = v3;
  v9 = v4;
  v6 = v3;
  objc_msgSend(v5, "homeLocationRegionWithCompletionHandler:", v7);

}

void __43__HUUtilityOnboardingFlow_lookupUtilities___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 40);
    v6 = 138412546;
    v7 = v5;
    v8 = 2112;
    v9 = v3;
    _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "%@: HOME LOCATION REGION COMPLETION HANDLER: %@", (uint8_t *)&v6, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 32), "finishWithResult:", v3);
}

id __43__HUUtilityOnboardingFlow_lookupUtilities___block_invoke_71(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;
  void *v5;
  __int128 v7;
  _QWORD v8[4];
  __int128 v9;

  objc_msgSend(*(id *)(a1 + 40), "_allUtilitiesFuture:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __43__HUUtilityOnboardingFlow_lookupUtilities___block_invoke_2_72;
  v8[3] = &unk_1E6F4DE08;
  v7 = *(_OWORD *)(a1 + 32);
  v4 = (id)v7;
  v9 = v7;
  objc_msgSend(v3, "flatMap:", v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __43__HUUtilityOnboardingFlow_lookupUtilities___block_invoke_2_72(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  uint64_t v6;
  __int16 v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 40);
    v5 = 138412546;
    v6 = v3;
    v7 = 2080;
    v8 = "+[HUUtilityOnboardingFlow lookupUtilities:]_block_invoke_2";
    _os_log_impl(&dword_1B8E1E000, v2, OS_LOG_TYPE_DEFAULT, "%@:%s Finding nearby utilities", (uint8_t *)&v5, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 40), "_utilityLookupFuture:", *(_QWORD *)(a1 + 32));
  return (id)objc_claimAutoreleasedReturnValue();
}

id __43__HUUtilityOnboardingFlow_lookupUtilities___block_invoke_75(uint64_t a1)
{
  NSObject *v2;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = 138412290;
    v6 = v4;
    _os_log_error_impl(&dword_1B8E1E000, v2, OS_LOG_TYPE_ERROR, "%@: Future failed!", (uint8_t *)&v5, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)processUserInput:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  NSObject *v10;
  void *v11;
  unint64_t currentState;
  unint64_t v13;
  NSObject *v14;
  void *v15;
  BOOL v16;
  uint64_t v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  const char *v22;
  NSObject *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  BOOL v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  void *v33;
  uint64_t v34;
  NSObject *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  void *v39;
  NSObject *v40;
  void *v41;
  NSObject *v42;
  void *v43;
  NSObject *v44;
  void *v45;
  NSObject *v46;
  void *v47;
  NSObject *v48;
  void *v49;
  NSObject *v50;
  void *v51;
  NSObject *v52;
  void *v53;
  void *v54;
  void *v55;
  _BOOL4 v56;
  BOOL v57;
  uint64_t v58;
  uint64_t v59;
  _BOOL4 v60;
  NSObject *v61;
  void *v62;
  _BYTE v64[24];
  unint64_t v65;
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  HFLogForCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v64 = 138412802;
    *(_QWORD *)&v64[4] = self;
    *(_WORD *)&v64[12] = 2112;
    *(_QWORD *)&v64[14] = v7;
    *(_WORD *)&v64[22] = 2112;
    v65 = (unint64_t)v5;
    _os_log_impl(&dword_1B8E1E000, v6, OS_LOG_TYPE_DEFAULT, "%@:%@ with input results: %@", v64, 0x20u);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("HUUtilityDiscoveryOnboardingKey_UserInput"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "integerValue");
  HFLogForCategory();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    currentState = self->_currentState;
    *(_DWORD *)v64 = 138412802;
    *(_QWORD *)&v64[4] = self;
    *(_WORD *)&v64[12] = 2112;
    *(_QWORD *)&v64[14] = v11;
    *(_WORD *)&v64[22] = 2048;
    v65 = currentState;
    _os_log_impl(&dword_1B8E1E000, v10, OS_LOG_TYPE_DEFAULT, "%@: Starting %@ with current state -> %lu", v64, 0x20u);

  }
  v13 = self->_currentState;
  switch(v13)
  {
    case 0uLL:
    case 2uLL:
      HFLogForCategory();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        NSStringFromSelector(a2);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v64 = 138412546;
        *(_QWORD *)&v64[4] = v15;
        *(_WORD *)&v64[12] = 2112;
        *(_QWORD *)&v64[14] = v8;
        _os_log_impl(&dword_1B8E1E000, v14, OS_LOG_TYPE_DEFAULT, "%@ -> Start & user input=%@", v64, 0x16u);

      }
      v16 = v9 == 0;
      v17 = 3;
      goto LABEL_20;
    case 1uLL:
      -[HUUtilityOnboardingFlow onboardingFuture](self, "onboardingFuture");
      v18 = objc_claimAutoreleasedReturnValue();
      -[NSObject finishWithNoResult](v18, "finishWithNoResult");
      goto LABEL_10;
    case 3uLL:
      HFLogForCategory();
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        NSStringFromSelector(a2);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v64 = 138412546;
        *(_QWORD *)&v64[4] = v41;
        *(_WORD *)&v64[12] = 2112;
        *(_QWORD *)&v64[14] = v8;
        _os_log_impl(&dword_1B8E1E000, v40, OS_LOG_TYPE_DEFAULT, "%@ -> DoUtilityLookup & user input=%@", v64, 0x16u);

      }
      v13 = 5;
      switch(v9)
      {
        case 0uLL:
          goto LABEL_43;
        case 3uLL:
          goto LABEL_59;
        case 7uLL:
          goto LABEL_77;
        case 8uLL:
          -[UtilityOnboardingContext populateFieldsFromMeContact](self->_context, "populateFieldsFromMeContact");
          if (-[UtilityOnboardingContext quickLookupHasAllFields](self->_context, "quickLookupHasAllFields"))
            v60 = -[UtilityOnboardingContext allRequiredFieldsComplete](self->_context, "allRequiredFieldsComplete");
          else
            v60 = 0;
          HFLogForCategory();
          v61 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v64 = 67109120;
            *(_DWORD *)&v64[4] = v60;
            _os_log_impl(&dword_1B8E1E000, v61, OS_LOG_TYPE_DEFAULT, "MeCard contains all the keys? --> %{BOOL}d", v64, 8u);
          }

          v57 = !v60;
          v58 = 6;
          v59 = 4;
          goto LABEL_91;
        case 9uLL:
          goto LABEL_94;
        default:
          HFLogForCategory();
          v18 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            goto LABEL_10;
          NSStringFromSelector(a2);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v64 = 138412546;
          *(_QWORD *)&v64[4] = self;
          *(_WORD *)&v64[12] = 2112;
          *(_QWORD *)&v64[14] = v21;
          v22 = "%@:%@ Invalid User Input in DoUtilityLookup";
          goto LABEL_84;
      }
    case 4uLL:
      HFLogForCategory();
      v42 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        NSStringFromSelector(a2);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v64 = 138412546;
        *(_QWORD *)&v64[4] = v43;
        *(_WORD *)&v64[12] = 2112;
        *(_QWORD *)&v64[14] = v8;
        _os_log_impl(&dword_1B8E1E000, v42, OS_LOG_TYPE_DEFAULT, "%@ -> Quick Lookup & user input=%@", v64, 0x16u);

      }
      if (v9)
      {
        if (v9 == 7)
        {
LABEL_78:
          objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("HUUtilityDiscoveryOnboardingKey_Error"));
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          v56 = +[HUHomeEnergyManagerHelper accountNotFound:](HUHomeEnergyManagerHelper, "accountNotFound:", v55);

          v57 = !v56;
          v58 = 15;
          v59 = 7;
LABEL_91:
          if (v57)
            v13 = v58;
          else
            v13 = v59;
        }
        else if (v9 == 10)
        {
          v13 = 6;
        }
        else
        {
          v13 = 1;
        }
      }
      else
      {
        v13 = 8;
      }
      goto LABEL_94;
    case 5uLL:
      HFLogForCategory();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        NSStringFromSelector(a2);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v64 = 138412546;
        *(_QWORD *)&v64[4] = v20;
        *(_WORD *)&v64[12] = 2112;
        *(_QWORD *)&v64[14] = v8;
        _os_log_impl(&dword_1B8E1E000, v19, OS_LOG_TYPE_DEFAULT, "%@ -> OAuth Login & user input=%@", v64, 0x16u);

      }
      if (v9)
      {
        if (v9 == 7)
        {
LABEL_77:
          v13 = 15;
        }
        else
        {
          HFLogForCategory();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            NSStringFromSelector(a2);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)v64 = 138412546;
            *(_QWORD *)&v64[4] = self;
            *(_WORD *)&v64[12] = 2112;
            *(_QWORD *)&v64[14] = v21;
            v22 = "%@:%@ Invalid User Input in OAuth Login";
LABEL_84:
            _os_log_impl(&dword_1B8E1E000, v18, OS_LOG_TYPE_DEFAULT, v22, v64, 0x16u);

          }
LABEL_10:

LABEL_59:
          v13 = 1;
        }
      }
      else
      {
LABEL_43:
        v13 = 10;
      }
LABEL_94:
      -[HUUtilityOnboardingFlow updateState:](self, "updateState:", v13, *(_OWORD *)v64, *(_QWORD *)&v64[16]);
      -[HUUtilityOnboardingFlow determineNextViewControllerFromResults:](self, "determineNextViewControllerFromResults:", v5);
      v62 = (void *)objc_claimAutoreleasedReturnValue();

      return v62;
    case 6uLL:
      HFLogForCategory();
      v44 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
      {
        NSStringFromSelector(a2);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v64 = 138412546;
        *(_QWORD *)&v64[4] = v45;
        *(_WORD *)&v64[12] = 2112;
        *(_QWORD *)&v64[14] = v8;
        _os_log_impl(&dword_1B8E1E000, v44, OS_LOG_TYPE_DEFAULT, "%@ -> TAF & user input=%@", v64, 0x16u);

      }
      v13 = 8;
      switch(v9)
      {
        case 0uLL:
          goto LABEL_94;
        case 2uLL:
          v13 = 4;
          break;
        case 6uLL:
          v13 = 3;
          break;
        case 7uLL:
          goto LABEL_78;
        default:
          goto LABEL_59;
      }
      goto LABEL_94;
    case 7uLL:
      HFLogForCategory();
      v46 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
      {
        NSStringFromSelector(a2);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v64 = 138412546;
        *(_QWORD *)&v64[4] = v47;
        *(_WORD *)&v64[12] = 2112;
        *(_QWORD *)&v64[14] = v8;
        _os_log_impl(&dword_1B8E1E000, v46, OS_LOG_TYPE_DEFAULT, "%@ -> Account Not Found & user input=%@", v64, 0x16u);

      }
      if (v9 >= 0xB)
        goto LABEL_59;
      v13 = qword_1B94429F8[v9];
      goto LABEL_94;
    case 8uLL:
      HFLogForCategory();
      v48 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
      {
        NSStringFromSelector(a2);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v64 = 138412546;
        *(_QWORD *)&v64[4] = v49;
        *(_WORD *)&v64[12] = 2112;
        *(_QWORD *)&v64[14] = v8;
        _os_log_impl(&dword_1B8E1E000, v48, OS_LOG_TYPE_DEFAULT, "%@ -> OTPSelection & user input=%@", v64, 0x16u);

      }
      v27 = 9;
      v28 = 15;
      v29 = v9 == 6;
      v30 = 1;
      v31 = 6;
      goto LABEL_66;
    case 9uLL:
      HFLogForCategory();
      v50 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
      {
        NSStringFromSelector(a2);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v64 = 138412546;
        *(_QWORD *)&v64[4] = v51;
        *(_WORD *)&v64[12] = 2112;
        *(_QWORD *)&v64[14] = v8;
        _os_log_impl(&dword_1B8E1E000, v50, OS_LOG_TYPE_DEFAULT, "%@ -> EnterOTP & user input=%@", v64, 0x16u);

      }
      v27 = 10;
      v28 = 15;
      v29 = v9 == 6;
      v30 = 1;
      v31 = 8;
      goto LABEL_66;
    case 0xAuLL:
      HFLogForCategory();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        NSStringFromSelector(a2);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v64 = 138412546;
        *(_QWORD *)&v64[4] = v24;
        *(_WORD *)&v64[12] = 2112;
        *(_QWORD *)&v64[14] = v8;
        _os_log_impl(&dword_1B8E1E000, v23, OS_LOG_TYPE_DEFAULT, "%@ -> GetTermsConsent & user input=%@", v64, 0x16u);

      }
      v16 = v9 == 0;
      v17 = 11;
LABEL_20:
      if (v16)
        v13 = v17;
      else
        v13 = 1;
      goto LABEL_94;
    case 0xBuLL:
      HFLogForCategory();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        NSStringFromSelector(a2);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v64 = 138412546;
        *(_QWORD *)&v64[4] = v26;
        *(_WORD *)&v64[12] = 2112;
        *(_QWORD *)&v64[14] = v8;
        _os_log_impl(&dword_1B8E1E000, v25, OS_LOG_TYPE_DEFAULT, "%@ -> Loading screen & user input=%@", v64, 0x16u);

      }
      v27 = 13;
      v28 = 15;
      v29 = v9 == 1;
      v30 = 1;
      v31 = 12;
LABEL_66:
      if (v29)
        v30 = v31;
      if (v9 != 7)
        v28 = v30;
      if (v9)
        v13 = v28;
      else
        v13 = v27;
      goto LABEL_94;
    case 0xCuLL:
      HFLogForCategory();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        NSStringFromSelector(a2);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v64 = 138412546;
        *(_QWORD *)&v64[4] = v33;
        *(_WORD *)&v64[12] = 2112;
        *(_QWORD *)&v64[14] = v8;
        _os_log_impl(&dword_1B8E1E000, v32, OS_LOG_TYPE_DEFAULT, "%@ -> GetServiceLocations & user input=%@", v64, 0x16u);

      }
      v34 = 12;
      if (v9 == 7)
        v34 = 15;
      if (v9)
        v13 = v34;
      else
        v13 = 13;
      goto LABEL_94;
    case 0xDuLL:
      HFLogForCategory();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        NSStringFromSelector(a2);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v64 = 138412546;
        *(_QWORD *)&v64[4] = v36;
        *(_WORD *)&v64[12] = 2112;
        *(_QWORD *)&v64[14] = v8;
        _os_log_impl(&dword_1B8E1E000, v35, OS_LOG_TYPE_DEFAULT, "%@ -> GetHomeSubscription & user input=%@", v64, 0x16u);

      }
      if (v9)
      {
        -[HUUtilityOnboardingFlow onboardingFuture](self, "onboardingFuture");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "finishWithNoResult");

        v13 = 0;
      }
      else
      {
        v13 = 14;
      }
      goto LABEL_94;
    case 0xFuLL:
      HFLogForCategory();
      v52 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
      {
        NSStringFromSelector(a2);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v64 = 138412546;
        *(_QWORD *)&v64[4] = self;
        *(_WORD *)&v64[12] = 2112;
        *(_QWORD *)&v64[14] = v53;
        _os_log_impl(&dword_1B8E1E000, v52, OS_LOG_TYPE_DEFAULT, "%@:%@ Finishing the onboarding flow due to error", v64, 0x16u);

      }
      -[HUUtilityOnboardingFlow onboardingFuture](self, "onboardingFuture");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "finishWithNoResult");

      objc_msgSend(v5, "setObject:forKeyedSubscript:", 0, CFSTR("HUUtilityDiscoveryOnboardingKey_Error"));
      goto LABEL_77;
    default:
      HFLogForCategory();
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        NSStringFromSelector(a2);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v64 = 138412802;
        *(_QWORD *)&v64[4] = self;
        *(_WORD *)&v64[12] = 2112;
        *(_QWORD *)&v64[14] = v39;
        *(_WORD *)&v64[22] = 2112;
        v65 = (unint64_t)v8;
        _os_log_impl(&dword_1B8E1E000, v38, OS_LOG_TYPE_DEFAULT, "%@:%@ Unsupported state! %@", v64, 0x20u);

      }
      goto LABEL_94;
  }
}

- (id)determineNextViewControllerFromResults:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  unint64_t currentState;
  NSObject *v9;
  HUUtilityOnboardingFlow *v10;
  const char *v11;
  NSObject *v12;
  HUUtilityOnboardingFlow *v13;
  unint64_t v14;
  NSObject *v15;
  HUUtilityOnboardingFlow *v16;
  HUUtilityDiscoverySetupViewController *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  HUUtilityOnboardingFlow *v21;
  __objc2_class *v22;
  NSObject *v23;
  HUUtilityOnboardingFlow *v24;
  NSObject *v25;
  HUUtilityOnboardingFlow *v26;
  NSObject *v27;
  HUUtilityOnboardingFlow *v28;
  NSObject *v29;
  HUUtilityOnboardingFlow *v30;
  NSObject *v31;
  HUUtilityOnboardingFlow *v32;
  NSObject *v33;
  HUUtilityOnboardingFlow *v34;
  NSObject *v35;
  HUUtilityOnboardingFlow *v36;
  NSObject *v37;
  HUUtilityOnboardingFlow *v38;
  HUUtilityOnboardingSelectLocationViewController *v39;
  HMHome *home;
  uint64_t v41;
  NSObject *v42;
  HUUtilityOnboardingFlow *v43;
  id v44;
  void *v45;
  NSObject *v46;
  HUUtilityOnboardingFlow *v47;
  HUUtilityOnboardingErrorViewController *v48;
  int v50;
  HUUtilityOnboardingFlow *v51;
  __int16 v52;
  unint64_t v53;
  __int16 v54;
  unint64_t v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  HFLogForCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    currentState = self->_currentState;
    v50 = 138412802;
    v51 = self;
    v52 = 2112;
    v53 = (unint64_t)v7;
    v54 = 2048;
    v55 = currentState;
    _os_log_impl(&dword_1B8E1E000, v6, OS_LOG_TYPE_DEFAULT, "%@:%@ Determine next view controller for current state -> %lu", (uint8_t *)&v50, 0x20u);

  }
  switch(self->_currentState)
  {
    case 1uLL:
      HFLogForCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        goto LABEL_46;
      NSStringFromSelector(a2);
      v10 = (HUUtilityOnboardingFlow *)objc_claimAutoreleasedReturnValue();
      v50 = 138412290;
      v51 = v10;
      v11 = "%@ -> CASE: Declined";
      goto LABEL_45;
    case 3uLL:
      HFLogForCategory();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        NSStringFromSelector(a2);
        v16 = (HUUtilityOnboardingFlow *)objc_claimAutoreleasedReturnValue();
        v50 = 138412290;
        v51 = v16;
        _os_log_impl(&dword_1B8E1E000, v15, OS_LOG_TYPE_DEFAULT, "%@ -> CASE: UtilityLookup ", (uint8_t *)&v50, 0xCu);

      }
      v17 = [HUUtilityDiscoverySetupViewController alloc];
      -[HUUtilityOnboardingFlow home](self, "home");
      v12 = objc_claimAutoreleasedReturnValue();
      -[HUUtilityOnboardingFlow context](self, "context");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = -[HUUtilityDiscoverySetupViewController initWithHome:onboardingContext:](v17, "initWithHome:onboardingContext:", v12, v18);
      goto LABEL_53;
    case 4uLL:
      HFLogForCategory();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        NSStringFromSelector(a2);
        v21 = (HUUtilityOnboardingFlow *)objc_claimAutoreleasedReturnValue();
        v50 = 138412290;
        v51 = v21;
        _os_log_impl(&dword_1B8E1E000, v20, OS_LOG_TYPE_DEFAULT, "%@ -> CASE: Quick Lookup", (uint8_t *)&v50, 0xCu);

      }
      v22 = HUUtilityOnboardingQuickLookupViewController;
      goto LABEL_41;
    case 5uLL:
      HFLogForCategory();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        NSStringFromSelector(a2);
        v24 = (HUUtilityOnboardingFlow *)objc_claimAutoreleasedReturnValue();
        v50 = 138412290;
        v51 = v24;
        _os_log_impl(&dword_1B8E1E000, v23, OS_LOG_TYPE_DEFAULT, "%@ -> CASE: OAuth Login ", (uint8_t *)&v50, 0xCu);

      }
      v22 = HUUtilityOnboardingOAuthLoginViewController;
      goto LABEL_41;
    case 6uLL:
      HFLogForCategory();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        NSStringFromSelector(a2);
        v26 = (HUUtilityOnboardingFlow *)objc_claimAutoreleasedReturnValue();
        v50 = 138412290;
        v51 = v26;
        _os_log_impl(&dword_1B8E1E000, v25, OS_LOG_TYPE_DEFAULT, "%@ -> CASE: TAF", (uint8_t *)&v50, 0xCu);

      }
      v22 = HUUtilityOnboardingTAFViewController;
      goto LABEL_41;
    case 7uLL:
      HFLogForCategory();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        NSStringFromSelector(a2);
        v28 = (HUUtilityOnboardingFlow *)objc_claimAutoreleasedReturnValue();
        v50 = 138412290;
        v51 = v28;
        _os_log_impl(&dword_1B8E1E000, v27, OS_LOG_TYPE_DEFAULT, "%@ -> CASE: Account Not Found", (uint8_t *)&v50, 0xCu);

      }
      v22 = HUUtilityOnboardingNoAccountViewController;
      goto LABEL_41;
    case 8uLL:
      HFLogForCategory();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        NSStringFromSelector(a2);
        v30 = (HUUtilityOnboardingFlow *)objc_claimAutoreleasedReturnValue();
        v50 = 138412290;
        v51 = v30;
        _os_log_impl(&dword_1B8E1E000, v29, OS_LOG_TYPE_DEFAULT, "%@ -> CASE: OTP Selection ", (uint8_t *)&v50, 0xCu);

      }
      v22 = HUUtilityOnboardingOTPSelectionViewController;
      goto LABEL_41;
    case 9uLL:
      HFLogForCategory();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        NSStringFromSelector(a2);
        v32 = (HUUtilityOnboardingFlow *)objc_claimAutoreleasedReturnValue();
        v50 = 138412290;
        v51 = v32;
        _os_log_impl(&dword_1B8E1E000, v31, OS_LOG_TYPE_DEFAULT, "%@ -> CASE: Enter OTP", (uint8_t *)&v50, 0xCu);

      }
      v22 = HUUtilityOnboardingEnterOTPViewController;
      goto LABEL_41;
    case 0xAuLL:
      HFLogForCategory();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        NSStringFromSelector(a2);
        v34 = (HUUtilityOnboardingFlow *)objc_claimAutoreleasedReturnValue();
        v50 = 138412290;
        v51 = v34;
        _os_log_impl(&dword_1B8E1E000, v33, OS_LOG_TYPE_DEFAULT, "%@ -> CASE: T&Cs", (uint8_t *)&v50, 0xCu);

      }
      v22 = HUUtilityOnboardingTermsViewController;
      goto LABEL_41;
    case 0xBuLL:
      HFLogForCategory();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        NSStringFromSelector(a2);
        v36 = (HUUtilityOnboardingFlow *)objc_claimAutoreleasedReturnValue();
        v50 = 138412290;
        v51 = v36;
        _os_log_impl(&dword_1B8E1E000, v35, OS_LOG_TYPE_DEFAULT, "%@ -> CASE: Loading", (uint8_t *)&v50, 0xCu);

      }
      v22 = HUUtilityOnboardingLoadingViewController;
      goto LABEL_41;
    case 0xCuLL:
      HFLogForCategory();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        NSStringFromSelector(a2);
        v38 = (HUUtilityOnboardingFlow *)objc_claimAutoreleasedReturnValue();
        v50 = 138412290;
        v51 = v38;
        _os_log_impl(&dword_1B8E1E000, v37, OS_LOG_TYPE_DEFAULT, "%@ -> CASE: Service Locations", (uint8_t *)&v50, 0xCu);

      }
      v39 = [HUUtilityOnboardingSelectLocationViewController alloc];
      home = self->_home;
      -[HUUtilityOnboardingFlow context](self, "context");
      v12 = objc_claimAutoreleasedReturnValue();
      v41 = -[HUUtilityOnboardingSelectLocationViewController initWithHome:context:](v39, "initWithHome:context:", home, v12);
      goto LABEL_42;
    case 0xDuLL:
      HFLogForCategory();
      v42 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        NSStringFromSelector(a2);
        v43 = (HUUtilityOnboardingFlow *)objc_claimAutoreleasedReturnValue();
        v50 = 138412290;
        v51 = v43;
        _os_log_impl(&dword_1B8E1E000, v42, OS_LOG_TYPE_DEFAULT, "%@ -> CASE: GetHomeSubscription ", (uint8_t *)&v50, 0xCu);

      }
      v22 = HUUtilityOnboardingConnectionViewController;
LABEL_41:
      v44 = [v22 alloc];
      -[HUUtilityOnboardingFlow context](self, "context");
      v12 = objc_claimAutoreleasedReturnValue();
      v41 = objc_msgSend(v44, "initWithContext:", v12);
LABEL_42:
      v45 = (void *)v41;
      goto LABEL_54;
    case 0xEuLL:
      HFLogForCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        NSStringFromSelector(a2);
        v10 = (HUUtilityOnboardingFlow *)objc_claimAutoreleasedReturnValue();
        v50 = 138412290;
        v51 = v10;
        v11 = "%@ -> CASE: Onboarding completed successfully. ";
LABEL_45:
        _os_log_impl(&dword_1B8E1E000, v9, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v50, 0xCu);

      }
LABEL_46:

      -[HUUtilityOnboardingFlow onboardingFuture](self, "onboardingFuture");
      v12 = objc_claimAutoreleasedReturnValue();
      -[NSObject finishWithNoResult](v12, "finishWithNoResult");
      goto LABEL_47;
    case 0xFuLL:
      HFLogForCategory();
      v46 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
      {
        NSStringFromSelector(a2);
        v47 = (HUUtilityOnboardingFlow *)objc_claimAutoreleasedReturnValue();
        v50 = 138412290;
        v51 = v47;
        _os_log_impl(&dword_1B8E1E000, v46, OS_LOG_TYPE_DEFAULT, "%@ -> CASE: Error", (uint8_t *)&v50, 0xCu);

      }
      if (self->_previousState == self->_currentState)
      {
        v45 = 0;
      }
      else
      {
        v48 = [HUUtilityOnboardingErrorViewController alloc];
        -[HUUtilityOnboardingFlow context](self, "context");
        v12 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("HUUtilityDiscoveryOnboardingKey_Error"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = -[HUUtilityOnboardingErrorViewController initWithContext:error:](v48, "initWithContext:error:", v12, v18);
LABEL_53:
        v45 = (void *)v19;

LABEL_54:
      }

      return v45;
    default:
      HFLogForCategory();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        NSStringFromSelector(a2);
        v13 = (HUUtilityOnboardingFlow *)objc_claimAutoreleasedReturnValue();
        v14 = self->_currentState;
        v50 = 138412546;
        v51 = v13;
        v52 = 2048;
        v53 = v14;
        _os_log_impl(&dword_1B8E1E000, v12, OS_LOG_TYPE_DEFAULT, "%@ -> CASE: %lu does not present a view controller ", (uint8_t *)&v50, 0x16u);

      }
LABEL_47:
      v45 = 0;
      goto LABEL_54;
  }
}

- (void)updateState:(unint64_t)a3
{
  NSObject *v6;
  void *v7;
  unint64_t currentState;
  unint64_t previousState;
  int v10;
  HUUtilityOnboardingFlow *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  unint64_t v15;
  __int16 v16;
  unint64_t v17;
  __int16 v18;
  unint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    previousState = self->_previousState;
    currentState = self->_currentState;
    v10 = 138413314;
    v11 = self;
    v12 = 2112;
    v13 = v7;
    v14 = 2048;
    v15 = currentState;
    v16 = 2048;
    v17 = a3;
    v18 = 2048;
    v19 = previousState;
    _os_log_impl(&dword_1B8E1E000, v6, OS_LOG_TYPE_DEFAULT, "%@:%@ updating homeEnergyOnboardingState=%lu with state=%lu\t previous state=%lu", (uint8_t *)&v10, 0x34u);

  }
  self->_previousState = self->_currentState;
  self->_currentState = a3;
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

- (unint64_t)previousState
{
  return self->_previousState;
}

- (void)setPreviousState:(unint64_t)a3
{
  self->_previousState = a3;
}

- (unint64_t)currentState
{
  return self->_currentState;
}

- (void)setCurrentState:(unint64_t)a3
{
  self->_currentState = a3;
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

- (_TtC6HomeUI24UtilityOnboardingContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_readyFuture, 0);
  objc_storeStrong((id *)&self->_initialViewController, 0);
  objc_storeStrong((id *)&self->_onboardingFuture, 0);
  objc_storeStrong((id *)&self->_home, 0);
}

@end
