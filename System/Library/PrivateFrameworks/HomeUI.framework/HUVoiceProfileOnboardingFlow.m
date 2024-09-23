@implementation HUVoiceProfileOnboardingFlow

- (HUVoiceProfileOnboardingFlow)initWithUsageOptions:(id)a3 home:(id)a4
{
  id v7;
  id v8;
  HUVoiceProfileOnboardingFlow *v9;
  HUVoiceProfileOnboardingFlow *v10;
  NAFuture *v11;
  NAFuture *readyFuture;
  void *v13;
  id v14;
  _QWORD v16[4];
  HUVoiceProfileOnboardingFlow *v17;
  id v18[2];
  id location;
  objc_super v20;

  v7 = a3;
  v8 = a4;
  v20.receiver = self;
  v20.super_class = (Class)HUVoiceProfileOnboardingFlow;
  v9 = -[HUVoiceProfileOnboardingFlow init](&v20, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_home, a4);
    v11 = (NAFuture *)objc_alloc_init(MEMORY[0x1E0D519C0]);
    readyFuture = v10->_readyFuture;
    v10->_readyFuture = v11;

    objc_initWeak(&location, v10);
    objc_msgSend((id)objc_opt_class(), "needsOnboardingForHome:options:", v8, v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __58__HUVoiceProfileOnboardingFlow_initWithUsageOptions_home___block_invoke;
    v16[3] = &unk_1E6F53798;
    v17 = v10;
    v18[1] = (id)a2;
    objc_copyWeak(v18, &location);
    v14 = (id)objc_msgSend(v13, "addSuccessBlock:", v16);

    objc_destroyWeak(v18);
    objc_destroyWeak(&location);
  }

  return v10;
}

void __58__HUVoiceProfileOnboardingFlow_initWithUsageOptions_home___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  char v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11[2];
  _QWORD v12[4];
  id v13;
  uint64_t v14;

  v3 = a2;
  v4 = objc_msgSend(v3, "BOOLValue");
  v5 = (void *)MEMORY[0x1E0D519C0];
  if ((v4 & 1) != 0)
  {
    v6 = MEMORY[0x1E0C809B0];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __58__HUVoiceProfileOnboardingFlow_initWithUsageOptions_home___block_invoke_2;
    v12[3] = &unk_1E6F53720;
    v14 = *(_QWORD *)(a1 + 48);
    v13 = *(id *)(a1 + 32);
    objc_msgSend(v5, "futureWithBlock:", v12);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v6;
    v10[1] = 3221225472;
    v10[2] = __58__HUVoiceProfileOnboardingFlow_initWithUsageOptions_home___block_invoke_6;
    v10[3] = &unk_1E6F53770;
    objc_copyWeak(v11, (id *)(a1 + 40));
    v11[1] = *(id *)(a1 + 48);
    v8 = (id)objc_msgSend(v7, "addCompletionBlock:", v10);
    objc_destroyWeak(v11);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", MEMORY[0x1E0C9AA70]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setOnboardingFuture:", v9);

  }
}

void __58__HUVoiceProfileOnboardingFlow_initWithUsageOptions_home___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  _BOOL4 v6;
  void *v7;
  int v8;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  _BOOL4 v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[HUHomeFeatureOnboardingUtilities fetchSupportedVoiceRecognitionLanguages](HUHomeFeatureOnboardingUtilities, "fetchSupportedVoiceRecognitionLanguages");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    HFLogForCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(*(SEL *)(a1 + 40));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v19 = v15;
      _os_log_error_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_ERROR, "%@ Error fetching voice recognition languages", buf, 0xCu);

    }
  }
  v6 = +[HUHomeFeatureOnboardingUtilities isDeviceUsingASupportedVoiceRecognitionSiriLanguage:shouldFallbackToBestSupportedLanguage:](HUHomeFeatureOnboardingUtilities, "isDeviceUsingASupportedVoiceRecognitionSiriLanguage:shouldFallbackToBestSupportedLanguage:", v4, 0);
  objc_msgSend(MEMORY[0x1E0CFE978], "sharedPreferences");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "assistantIsEnabled");

  if (!v6 || v8 == 0)
  {
    HFLogForCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = *(void **)(a1 + 32);
      NSStringFromSelector(*(SEL *)(a1 + 40));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v19 = v11;
      v20 = 2112;
      v21 = v12;
      v22 = 1024;
      v23 = v6;
      v24 = 1024;
      v25 = v8;
      _os_log_impl(&dword_1B8E1E000, v10, OS_LOG_TYPE_DEFAULT, "%@:%@: This iOS device is on a supported voice recognition language?: %{BOOL}d, & Siri is enabled?: %{BOOL}d", buf, 0x22u);

    }
    objc_msgSend(v3, "finishWithResult:", MEMORY[0x1E0C9AAA0]);
  }
  else
  {
    +[HUHomeFeatureOnboardingUtilities checkVoiceProfileAvailabiltyForLanguage:](HUHomeFeatureOnboardingUtilities, "checkVoiceProfileAvailabiltyForLanguage:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __58__HUVoiceProfileOnboardingFlow_initWithUsageOptions_home___block_invoke_3;
    v16[3] = &unk_1E6F4E540;
    v17 = v3;
    v14 = (id)objc_msgSend(v13, "addSuccessBlock:", v16);

  }
}

uint64_t __58__HUVoiceProfileOnboardingFlow_initWithUsageOptions_home___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithResult:", a2);
}

void __58__HUVoiceProfileOnboardingFlow_initWithUsageOptions_home___block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id *v7;
  id WeakRetained;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t);
  void *v26;
  id v27;
  _QWORD v28[4];
  id v29;
  uint8_t buf[4];
  id v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  id v35;
  __int16 v36;
  int v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (v6)
  {
    HFLogForCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(*(SEL *)(a1 + 40));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v31 = WeakRetained;
      v32 = 2112;
      v33 = v10;
      v34 = 2112;
      v35 = v6;
      _os_log_impl(&dword_1B8E1E000, v9, OS_LOG_TYPE_DEFAULT, "%@:%@ Hey Siri Voice Profile Check FAILED with %@, will attempt to get Voice Profile from user", buf, 0x20u);

    }
    v11 = (void *)MEMORY[0x1E0D519C0];
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __58__HUVoiceProfileOnboardingFlow_initWithUsageOptions_home___block_invoke_7;
    v28[3] = &unk_1E6F53748;
    objc_copyWeak(&v29, v7);
    objc_msgSend(v11, "futureWithBlock:", v28);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "setOnboardingFuture:", v12);

    objc_destroyWeak(&v29);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CFE978], "sharedPreferences");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "languageCode");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "setInitialCheckedLanguage:", v14);

    objc_opt_class();
    v15 = v5;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v16 = v15;
    else
      v16 = 0;
    v17 = v16;

    objc_msgSend(WeakRetained, "setInitialCheckedResult:", objc_msgSend(v17, "BOOLValue"));
    HFLogForCategory();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(*(SEL *)(a1 + 40));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "initialCheckedLanguage");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v31 = WeakRetained;
      v32 = 2112;
      v33 = v19;
      v34 = 2112;
      v35 = v20;
      v36 = 1024;
      v37 = objc_msgSend(WeakRetained, "initialCheckedResult");
      _os_log_impl(&dword_1B8E1E000, v18, OS_LOG_TYPE_DEFAULT, "%@:%@ At init time, 'Hey Siri' Voice Profile was found for current language (%@)?: %{BOOL}d", buf, 0x26u);

    }
    v21 = (void *)MEMORY[0x1E0D519C0];
    v23 = MEMORY[0x1E0C809B0];
    v24 = 3221225472;
    v25 = __58__HUVoiceProfileOnboardingFlow_initWithUsageOptions_home___block_invoke_10;
    v26 = &unk_1E6F53748;
    objc_copyWeak(&v27, v7);
    objc_msgSend(v21, "futureWithBlock:", &v23);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "setOnboardingFuture:", v22, v23, v24, v25, v26);

    objc_destroyWeak(&v27);
  }

}

void __58__HUVoiceProfileOnboardingFlow_initWithUsageOptions_home___block_invoke_7(uint64_t a1)
{
  HUVoiceProfileSetupViewController *v1;
  void *v2;
  HUVoiceProfileSetupViewController *v3;
  void *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [HUVoiceProfileSetupViewController alloc];
  objc_msgSend(WeakRetained, "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[HUVoiceProfileSetupViewController initWithHome:](v1, "initWithHome:", v2);
  objc_msgSend(WeakRetained, "setInitialViewController:", v3);

  objc_msgSend(WeakRetained, "readyFuture");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "finishWithResult:", MEMORY[0x1E0C9AAB0]);

}

void __58__HUVoiceProfileOnboardingFlow_initWithUsageOptions_home___block_invoke_10(uint64_t a1)
{
  HUVoiceProfileSetupViewController *v1;
  void *v2;
  HUVoiceProfileSetupViewController *v3;
  void *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [HUVoiceProfileSetupViewController alloc];
  objc_msgSend(WeakRetained, "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[HUVoiceProfileSetupViewController initWithHome:](v1, "initWithHome:", v2);
  objc_msgSend(WeakRetained, "setInitialViewController:", v3);

  objc_msgSend(WeakRetained, "readyFuture");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "finishWithResult:", MEMORY[0x1E0C9AAB0]);

}

- (void)checkIfStillRequiredFromCurrentResults:(id)a3
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  _BOOL4 v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  HUVoiceProfileOnboardingFlow *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  HUVoiceProfileOnboardingFlow *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("HULanguageOnboardingKey_PersonalDeviceSiriLanguageChanged_HasVoiceProfile"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("HULanguageOnboardingKey_PersonalDeviceSiriLanguageChanged_MissingVoiceProfile"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      HFLogForCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        NSStringFromSelector(a2);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = 138413058;
        v18 = self;
        v19 = 2112;
        v20 = v11;
        v21 = 2112;
        v22 = v9;
        v23 = 2112;
        v24 = self;
        _os_log_impl(&dword_1B8E1E000, v10, OS_LOG_TYPE_DEFAULT, "%@:%@ 'Hey Siri' Voice Profile for %@ needed, will run %@", (uint8_t *)&v17, 0x2Au);
LABEL_14:

      }
    }
    else
    {
      v12 = -[HUVoiceProfileOnboardingFlow initialCheckedResult](self, "initialCheckedResult");
      HFLogForCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      v13 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
      if (v12)
      {
        if (v13)
        {
          NSStringFromSelector(a2);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[HUVoiceProfileOnboardingFlow initialCheckedLanguage](self, "initialCheckedLanguage");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = 138413058;
          v18 = self;
          v19 = 2112;
          v20 = v14;
          v21 = 2112;
          v22 = v15;
          v23 = 2112;
          v24 = self;
          _os_log_impl(&dword_1B8E1E000, v10, OS_LOG_TYPE_DEFAULT, "%@:%@ As calculated at init time, the 'Hey Siri' Voice Profile for %@ already exists, will skip %@", (uint8_t *)&v17, 0x2Au);

        }
        -[HUVoiceProfileOnboardingFlow onboardingFuture](self, "onboardingFuture");
        v10 = objc_claimAutoreleasedReturnValue();
        -[NSObject finishWithNoResult](v10, "finishWithNoResult");
        goto LABEL_15;
      }
      if (v13)
      {
        NSStringFromSelector(a2);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[HUVoiceProfileOnboardingFlow initialCheckedLanguage](self, "initialCheckedLanguage");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = 138413058;
        v18 = self;
        v19 = 2112;
        v20 = v11;
        v21 = 2112;
        v22 = v16;
        v23 = 2112;
        v24 = self;
        _os_log_impl(&dword_1B8E1E000, v10, OS_LOG_TYPE_DEFAULT, "%@:%@ As calculated at init time, the 'Hey Siri' Voice Profile for %@ does not exist, will run %@", (uint8_t *)&v17, 0x2Au);

        goto LABEL_14;
      }
    }
LABEL_15:

    goto LABEL_16;
  }
  HFLogForCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138413058;
    v18 = self;
    v19 = 2112;
    v20 = v8;
    v21 = 2112;
    v22 = v6;
    v23 = 2112;
    v24 = self;
    _os_log_impl(&dword_1B8E1E000, v7, OS_LOG_TYPE_DEFAULT, "%@:%@ 'Hey Siri' Voice Profile for %@ already exists, will skip %@", (uint8_t *)&v17, 0x2Au);

  }
  -[HUVoiceProfileOnboardingFlow onboardingFuture](self, "onboardingFuture");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "finishWithNoResult");
LABEL_16:

}

- (NSString)description
{
  return (NSString *)CFSTR("Voice Recognition VOICE PROFILE Setup");
}

- (id)processUserInput:(id)a3
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;
  uint8_t buf[4];
  HUVoiceProfileOnboardingFlow *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("HUVoiceProfileOnboardingKey_UserInput"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  HFLogForCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v19 = self;
    v20 = 2112;
    v21 = v8;
    v22 = 2112;
    v23 = v5;
    _os_log_impl(&dword_1B8E1E000, v7, OS_LOG_TYPE_DEFAULT, "%@:%@ with input results: %@", buf, 0x20u);

  }
  if (objc_msgSend(v6, "integerValue") && objc_msgSend(v6, "integerValue") != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUVoiceProfileOnboardingFlow.m"), 198, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("(userInputValue.integerValue == HUVoiceProfileOnboardingValue_SetupHeySiri_Completed) || (userInputValue.integerValue == HUVoiceProfileOnboardingValue_SetupHeySiri_Cancelled)"));

  }
  v9 = objc_alloc(MEMORY[0x1E0D31988]);
  -[HUVoiceProfileOnboardingFlow home](self, "home");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUVoiceProfileOnboardingFlow home](self, "home");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "currentUser");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v9, "initWithHome:user:nameStyle:", v10, v12, 0);

  if ((objc_msgSend(v13, "hasDismissedVoiceProfileOnboarding") & 1) != 0)
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  else
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v6, "integerValue") == 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v14, CFSTR("HUHomeFeatureOnboardingKey_IdentifyVoice_DismissReminderBanner"));

  objc_msgSend(v5, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("HUHomeFeatureOnboardingKey_IdentifyVoice_FinishedOnboarding"));
  -[HUVoiceProfileOnboardingFlow setShouldAbortThisOnboardingFlowGroup:](self, "setShouldAbortThisOnboardingFlowGroup:", objc_msgSend(v6, "integerValue") == 1);
  -[HUVoiceProfileOnboardingFlow onboardingFuture](self, "onboardingFuture");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "finishWithNoResult");

  return 0;
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
    v12[2] = __63__HUVoiceProfileOnboardingFlow_needsOnboardingForHome_options___block_invoke;
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

void __63__HUVoiceProfileOnboardingFlow_needsOnboardingForHome_options___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  int v5;
  int v6;
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
  _BOOL4 v24;
  uint64_t v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  NSObject *v31;
  NSObject *v32;
  void *v33;
  uint64_t v34;
  id v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  int v41;
  _QWORD v42[5];
  id v43;
  id v44;
  uint64_t v45;
  char v46;
  char v47;
  BOOL v48;
  char v49;
  char v50;
  _QWORD v51[5];
  uint8_t buf[4];
  id v53;
  __int16 v54;
  void *v55;
  __int16 v56;
  _BYTE v57[24];
  __int16 v58;
  int v59;
  __int16 v60;
  _BOOL4 v61;
  __int16 v62;
  int v63;
  __int16 v64;
  int v65;
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v5 = objc_msgSend(*(id *)(a1 + 32), "hf_hasHomePods");
  v6 = objc_msgSend(*(id *)(a1 + 32), "hf_hasRMVCapableAppleTV");
  objc_opt_class();
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("OnboardingDisplayOption_OnboardingFromUserInput"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  v41 = objc_msgSend(v9, "BOOLValue");
  if (objc_msgSend(MEMORY[0x1E0D319D0], "isInternalInstall"))
  {
    objc_msgSend(*(id *)(a1 + 32), "accessories");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v51[0] = MEMORY[0x1E0C809B0];
    v51[1] = 3221225472;
    v51[2] = __63__HUVoiceProfileOnboardingFlow_needsOnboardingForHome_options___block_invoke_2;
    v51[3] = &__block_descriptor_40_e21_B16__0__HMAccessory_8l;
    v51[4] = *(_QWORD *)(a1 + 56);
    v11 = objc_msgSend(v10, "na_any:", v51);

    if (v11)
    {
      objc_msgSend(MEMORY[0x1E0D313A0], "sharedHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:", 50);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleError:operationType:options:retryBlock:cancelBlock:", v13, *MEMORY[0x1E0D309F0], 0, 0, 0);

    }
  }
  if ((v5 | v6) == 1)
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
      v53 = WeakRetained;
      v54 = 2112;
      v55 = v16;
      v56 = 2048;
      *(_QWORD *)v57 = v17;
      *(_WORD *)&v57[8] = 2112;
      *(_QWORD *)&v57[10] = v14;
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
      if ((v22 & 1) != 0)
      {
        v23 = 0;
        v24 = 0;
      }
      else if (((v6 | v5 ^ 1) & 1) != 0)
      {
        v23 = 0;
        v24 = v6;
      }
      else
      {
        v23 = +[HUHomeFeatureOnboardingUtilities home:hasSomeHomePodsOnSupportedVoiceRecognitionLanguages:](HUHomeFeatureOnboardingUtilities, "home:hasSomeHomePodsOnSupportedVoiceRecognitionLanguages:", *(_QWORD *)(a1 + 32), v14);
        v24 = v23;
      }
      v25 = v41 | v24;
    }
    else
    {
      HFLogForCategory();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(*(SEL *)(a1 + 56));
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v53 = v40;
        _os_log_error_impl(&dword_1B8E1E000, v21, OS_LOG_TYPE_ERROR, "%@ Error fetching voice recognition languages", buf, 0xCu);

      }
      v23 = 0;
      v22 = 0;
      v25 = 0;
    }

  }
  else
  {
    v23 = 0;
    v22 = 0;
    v25 = 0;
  }
  HFLogForCategory();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 56));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v53 = WeakRetained;
    v54 = 2112;
    v55 = v27;
    v56 = 1024;
    *(_DWORD *)v57 = v6;
    _os_log_impl(&dword_1B8E1E000, v26, OS_LOG_TYPE_DEFAULT, "%@:%@: hasRMVCapableAppleTV = %{BOOL}d", buf, 0x1Cu);

  }
  objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "homeManager");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "hasOptedToHH2");

  HFLogForCategory();
  v31 = objc_claimAutoreleasedReturnValue();
  v32 = v31;
  if ((v25 & v30) == 1 && v5)
  {
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(*(SEL *)(a1 + 56));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v53 = WeakRetained;
      v54 = 2112;
      v55 = v39;
      _os_log_debug_impl(&dword_1B8E1E000, v32, OS_LOG_TYPE_DEBUG, "%@:%@: [HH2] Will check for atLeastOneHomePodHasLanguageSettingsForHomeFuture", buf, 0x16u);

    }
    +[HUHomeFeatureOnboardingUtilities atLeastOneHomePodHasLanguageSettingsForHomeFuture:](HUHomeFeatureOnboardingUtilities, "atLeastOneHomePodHasLanguageSettingsForHomeFuture:", *(_QWORD *)(a1 + 32));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v42[0] = MEMORY[0x1E0C809B0];
    v42[1] = 3221225472;
    v42[2] = __63__HUVoiceProfileOnboardingFlow_needsOnboardingForHome_options___block_invoke_27;
    v42[3] = &unk_1E6F537E0;
    v34 = *(_QWORD *)(a1 + 56);
    v42[4] = WeakRetained;
    v45 = v34;
    v46 = 1;
    v43 = *(id *)(a1 + 32);
    v47 = v5;
    v48 = v23;
    v49 = v22;
    v50 = v41;
    v44 = v3;
    v35 = (id)objc_msgSend(v33, "addCompletionBlock:", v42);

  }
  else
  {
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(*(SEL *)(a1 + 56));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "currentUser");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138414338;
      v53 = WeakRetained;
      v54 = 2112;
      v55 = v36;
      v56 = 1024;
      *(_DWORD *)v57 = v25;
      *(_WORD *)&v57[4] = 2112;
      *(_QWORD *)&v57[6] = v37;
      *(_WORD *)&v57[14] = 2112;
      *(_QWORD *)&v57[16] = v38;
      v58 = 1024;
      v59 = v5;
      v60 = 1024;
      v61 = v23;
      v62 = 1024;
      v63 = v22;
      v64 = 1024;
      v65 = v41;
      _os_log_impl(&dword_1B8E1E000, v32, OS_LOG_TYPE_DEFAULT, "%@:%@: ---> Can show?: %{BOOL}d <--- because: user(%@) in home(%@):\n\t\thasHomePods = %{BOOL}d\n\t\thasHomePodOnSupportedLanguage = %{BOOL}d\n\t\thasPreviouslyDismissed = %{BOOL}d\n\t\tonboardingFromUserInput = %{BOOL}d", buf, 0x48u);

    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v25);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "finishWithResult:", v33);
  }

}

uint64_t __63__HUVoiceProfileOnboardingFlow_needsOnboardingForHome_options___block_invoke_2(uint64_t a1, void *a2)
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

void __63__HUVoiceProfileOnboardingFlow_needsOnboardingForHome_options___block_invoke_27(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;
  int v13;
  int v14;
  int v15;
  uint64_t v16;
  void *v17;
  int v18;
  int v19;
  uint64_t v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  _BYTE v26[14];
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  int v30;
  __int16 v31;
  int v32;
  __int16 v33;
  int v34;
  __int16 v35;
  int v36;
  __int16 v37;
  int v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    HFLogForCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v16 = *(_QWORD *)(a1 + 32);
      NSStringFromSelector(*(SEL *)(a1 + 56));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v22 = v16;
      v23 = 2112;
      v24 = v17;
      v25 = 2112;
      *(_QWORD *)v26 = v6;
      _os_log_error_impl(&dword_1B8E1E000, v7, OS_LOG_TYPE_ERROR, "%@:%@: atLeastOneHomePodHasLanguageSettingsForHomeFuture completed with error: %@", buf, 0x20u);

    }
  }
  HFLogForCategory();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v20 = *(_QWORD *)(a1 + 32);
    NSStringFromSelector(*(SEL *)(a1 + 56));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(unsigned __int8 *)(a1 + 64);
    objc_msgSend(*(id *)(a1 + 40), "currentUser");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(a1 + 40);
    v13 = *(unsigned __int8 *)(a1 + 65);
    v14 = *(unsigned __int8 *)(a1 + 66);
    v18 = *(unsigned __int8 *)(a1 + 67);
    v19 = *(unsigned __int8 *)(a1 + 68);
    v15 = objc_msgSend(v5, "BOOLValue");
    *(_DWORD *)buf = 138414594;
    v22 = v20;
    v23 = 2112;
    v24 = v9;
    v25 = 1024;
    *(_DWORD *)v26 = v10;
    *(_WORD *)&v26[4] = 2112;
    *(_QWORD *)&v26[6] = v11;
    v27 = 2112;
    v28 = v12;
    v29 = 1024;
    v30 = v13;
    v31 = 1024;
    v32 = v14;
    v33 = 1024;
    v34 = v18;
    v35 = 1024;
    v36 = v19;
    v37 = 1024;
    v38 = v15;
    _os_log_impl(&dword_1B8E1E000, v8, OS_LOG_TYPE_DEFAULT, "%@:%@: ---> Can show?: %{BOOL}d <--- because: user(%@) in home(%@):\n\t\thasHomePods = %{BOOL}d\n\t\thasHomePodOnSupportedLanguage = %{BOOL}d\n\t\thasPreviouslyDismissed = %{BOOL}d\n\t\tonboardingFromUserInput = %{BOOL}d\n\t\tatLeastOneHomePodHasLanguageSettings = %{BOOL}d", buf, 0x4Eu);

  }
  objc_msgSend(*(id *)(a1 + 48), "finishWithResult:", v5);

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

- (NSString)initialCheckedLanguage
{
  return self->_initialCheckedLanguage;
}

- (void)setInitialCheckedLanguage:(id)a3
{
  objc_storeStrong((id *)&self->_initialCheckedLanguage, a3);
}

- (BOOL)initialCheckedResult
{
  return self->_initialCheckedResult;
}

- (void)setInitialCheckedResult:(BOOL)a3
{
  self->_initialCheckedResult = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initialCheckedLanguage, 0);
  objc_storeStrong((id *)&self->_readyFuture, 0);
  objc_storeStrong((id *)&self->_initialViewController, 0);
  objc_storeStrong((id *)&self->_onboardingFuture, 0);
  objc_storeStrong((id *)&self->_home, 0);
}

@end
