@implementation HULanguageSetupOnboardingFlow

- (HULanguageSetupOnboardingFlow)initWithUsageOptions:(id)a3 home:(id)a4
{
  id v7;
  id v8;
  HULanguageSetupOnboardingFlow *v9;
  HULanguageSetupOnboardingFlow *v10;
  NAFuture *v11;
  NAFuture *readyFuture;
  void *v13;
  uint64_t v14;
  NAFuture *onboardingFuture;
  _QWORD v17[4];
  id v18;
  id location;
  objc_super v20;

  v7 = a3;
  v8 = a4;
  v20.receiver = self;
  v20.super_class = (Class)HULanguageSetupOnboardingFlow;
  v9 = -[HULanguageSetupOnboardingFlow init](&v20, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_home, a4);
    v10->_languageOnboardingFlowType = 0;
    objc_storeStrong((id *)&v10->_usageOptions, a3);
    v11 = (NAFuture *)objc_alloc_init(MEMORY[0x1E0D519C0]);
    readyFuture = v10->_readyFuture;
    v10->_readyFuture = v11;

    objc_initWeak(&location, v10);
    objc_msgSend((id)objc_opt_class(), "needsOnboardingForHome:options:", v8, v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __59__HULanguageSetupOnboardingFlow_initWithUsageOptions_home___block_invoke;
    v17[3] = &unk_1E6F4EA10;
    objc_copyWeak(&v18, &location);
    objc_msgSend(v13, "flatMap:", v17);
    v14 = objc_claimAutoreleasedReturnValue();
    onboardingFuture = v10->_onboardingFuture;
    v10->_onboardingFuture = (NAFuture *)v14;

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }

  return v10;
}

id __59__HULanguageSetupOnboardingFlow_initWithUsageOptions_home___block_invoke(uint64_t a1, void *a2)
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
  v8[2] = __59__HULanguageSetupOnboardingFlow_initWithUsageOptions_home___block_invoke_2;
  v8[3] = &unk_1E6F4E9E8;
  objc_copyWeak(&v10, (id *)(a1 + 32));
  v5 = v3;
  v9 = v5;
  objc_msgSend(v4, "futureWithBlock:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v10);
  return v6;
}

void __59__HULanguageSetupOnboardingFlow_initWithUsageOptions_home___block_invoke_2(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (objc_msgSend(*(id *)(a1 + 32), "BOOLValue"))
  {
    objc_msgSend(WeakRetained, "_determineNextViewControllerWithPriorResults:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "setInitialViewController:", v4);

    objc_msgSend(WeakRetained, "readyFuture");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "finishWithResult:", MEMORY[0x1E0C9AAB0]);

  }
  else
  {
    objc_msgSend(v6, "finishWithNoResult");
  }

}

- (id)_determineNextViewControllerWithPriorResults:(id)a3
{
  id v5;
  unint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  HUHomeAssistantDeviceLanguageConfigurationViewController *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  _BOOL4 v17;
  void *v18;
  void *v19;
  HUHomePersonalIdentityDeviceConfigurationViewController *v20;
  NSObject *v21;
  HUHomeAssistantDeviceLanguageSetupViewController *v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  void *v27;
  NSObject *v28;
  void *v29;
  uint64_t v30;
  NSObject *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  int v37;
  NSObject *v38;
  void *v39;
  HULanguageSetupOnboardingFlow *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  NSObject *v46;
  NSObject *v47;
  void *v48;
  void *v49;
  HUHomePersonalIdentityDeviceLanguageSetupViewController *v50;
  void *v51;
  NSObject *v52;
  void *v53;
  uint64_t v54;
  int v55;
  NSObject *v56;
  _BOOL4 v57;
  void *v58;
  void *v59;
  HUHomePersonalIdentityDeviceLanguageSetupViewController *v60;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  uint8_t buf[4];
  HULanguageSetupOnboardingFlow *v67;
  __int16 v68;
  void *v69;
  __int16 v70;
  uint64_t v71;
  __int16 v72;
  uint64_t v73;
  __int16 v74;
  int v75;
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = -[HULanguageSetupOnboardingFlow languageOnboardingFlowType](self, "languageOnboardingFlowType");
  if (v6 == 1)
  {
    HFLogForCategory();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v67 = self;
      v68 = 2112;
      v69 = v15;
      v70 = 2112;
      v71 = (uint64_t)v5;
      _os_log_impl(&dword_1B8E1E000, v14, OS_LOG_TYPE_DEFAULT, "%@:%@ Determining next Personal Identity Device Language onboarding view controller with results %@ ", buf, 0x20u);

    }
    HFLogForCategory();
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
    if (v5)
    {
      if (v17)
      {
        NSStringFromSelector(a2);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v67 = self;
        v68 = 2112;
        v69 = v18;
        _os_log_impl(&dword_1B8E1E000, v16, OS_LOG_TYPE_DEFAULT, "%@:%@: Now starting Personal Identity Device Language Configuration screen", buf, 0x16u);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("HULanguageOnboardingKey_MediaProfileAndLanguageInfo"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = -[HUHomePersonalIdentityDeviceConfigurationViewController initWithMediaProfileAndLanguageInfo:]([HUHomePersonalIdentityDeviceConfigurationViewController alloc], "initWithMediaProfileAndLanguageInfo:", v19);
LABEL_20:
      v13 = (HUHomeAssistantDeviceLanguageConfigurationViewController *)v20;

      goto LABEL_64;
    }
    if (v17)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B8E1E000, v16, OS_LOG_TYPE_DEFAULT, "Configuring Personal Identity Device Setup View", buf, 2u);
    }

    objc_msgSend(MEMORY[0x1E0CFE978], "sharedPreferences");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "languageCode");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      +[HUHomeFeatureOnboardingUtilities fetchSupportedVoiceRecognitionLanguages](HUHomeFeatureOnboardingUtilities, "fetchSupportedVoiceRecognitionLanguages");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        -[HULanguageSetupOnboardingFlow home](self, "home");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v25, "hf_hasHomePods");

        if ((v26 & 1) != 0)
        {
          -[HULanguageSetupOnboardingFlow home](self, "home");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          +[HUHomeFeatureOnboardingUtilities home:createMultiUserLanguageToHomePodsMapping:](HUHomeFeatureOnboardingUtilities, "home:createMultiUserLanguageToHomePodsMapping:", v27, v9);
          v10 = objc_claimAutoreleasedReturnValue();

          HFLogForCategory();
          v28 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            NSStringFromSelector(a2);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = -[NSObject count](v10, "count");
            *(_DWORD *)buf = 138413058;
            v67 = self;
            v68 = 2112;
            v69 = v29;
            v70 = 2112;
            v71 = (uint64_t)v10;
            v72 = 2048;
            v73 = v30;
            _os_log_impl(&dword_1B8E1E000, v28, OS_LOG_TYPE_DEFAULT, "%@:%@: HomePods on Supported Voice Recognition Languages %@ (%lu)", buf, 0x2Au);

          }
          if (-[NSObject count](v10, "count"))
          {
            HFLogForCategory();
            v31 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1B8E1E000, v31, OS_LOG_TYPE_DEFAULT, "Starting Personal Identity Device Setup View", buf, 2u);
            }

            +[HUHomeFeatureOnboardingUtilities createPersonalIdentityDeviceLanguageMismatchList:](HUHomeFeatureOnboardingUtilities, "createPersonalIdentityDeviceLanguageMismatchList:", v10);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CFE978], "sharedPreferences");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "languageCode");
            v34 = objc_claimAutoreleasedReturnValue();

            -[NSObject allKeys](v10, "allKeys");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v65 = (void *)v34;
            v36 = v35;
            if (objc_msgSend(v9, "containsObject:", v34))
              v37 = objc_msgSend(v35, "containsObject:", v34);
            else
              v37 = 0;
            HFLogForCategory();
            v52 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
            {
              NSStringFromSelector(a2);
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              v54 = objc_msgSend(v32, "count");
              *(_DWORD *)buf = 138413314;
              v67 = self;
              v68 = 2112;
              v69 = v53;
              v70 = 2112;
              v71 = (uint64_t)v32;
              v72 = 2048;
              v73 = v54;
              v74 = 1024;
              v75 = v37;
              _os_log_impl(&dword_1B8E1E000, v52, OS_LOG_TYPE_DEFAULT, "%@:%@: List of Personal Identity Device Mismatches %@ (%lu) - hasAtLeastOneHomePodSupportingPersonalIdentityDeviceLanguage %{BOOL}d", buf, 0x30u);

            }
            if (objc_msgSend(v32, "count"))
              v55 = v37;
            else
              v55 = 1;
            HFLogForCategory();
            v56 = objc_claimAutoreleasedReturnValue();
            v57 = os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT);
            if (v55 == 1)
            {
              if (v57)
              {
                NSStringFromSelector(a2);
                v58 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412546;
                v67 = self;
                v68 = 2112;
                v69 = v58;
                _os_log_impl(&dword_1B8E1E000, v56, OS_LOG_TYPE_DEFAULT, "%@:%@ all languages match - onboarding not required", buf, 0x16u);

              }
              v13 = 0;
            }
            else
            {
              if (v57)
              {
                NSStringFromSelector(a2);
                v59 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412546;
                v67 = self;
                v68 = 2112;
                v69 = v59;
                _os_log_impl(&dword_1B8E1E000, v56, OS_LOG_TYPE_DEFAULT, "%@:%@: Now starting Personal Identity Device Language Setup screen", buf, 0x16u);

              }
              v60 = [HUHomePersonalIdentityDeviceLanguageSetupViewController alloc];
              -[HULanguageSetupOnboardingFlow home](self, "home");
              v56 = objc_claimAutoreleasedReturnValue();
              v13 = -[HUHomePersonalIdentityDeviceLanguageSetupViewController initWithHome:](v60, "initWithHome:", v56);
            }

          }
          else
          {
            -[HULanguageSetupOnboardingFlow assistantDeviceIntendedRecognitionLanguage](self, "assistantDeviceIntendedRecognitionLanguage");
            v45 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v45)
            {
              objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
              v64 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v64, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HULanguageSetupOnboardingFlow.m"), 227, CFSTR("Attempting to run Personal Identity Device Language Setup with no HomePods in Supported Language & No Intended Language - this shouldn't happen."));

            }
            HFLogForCategory();
            v46 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
            {
              NSStringFromSelector(a2);
              v62 = (void *)objc_claimAutoreleasedReturnValue();
              -[HULanguageSetupOnboardingFlow assistantDeviceIntendedRecognitionLanguage](self, "assistantDeviceIntendedRecognitionLanguage");
              v63 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412802;
              v67 = self;
              v68 = 2112;
              v69 = v62;
              v70 = 2112;
              v71 = (uint64_t)v63;
              _os_log_error_impl(&dword_1B8E1E000, v46, OS_LOG_TYPE_ERROR, "%@:%@: No HomePods in a supported language, even after Home Assistant Device Language Setup - user intended: %@", buf, 0x20u);

            }
            HFLogForCategory();
            v47 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
            {
              NSStringFromSelector(a2);
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              -[HULanguageSetupOnboardingFlow assistantDeviceIntendedRecognitionLanguage](self, "assistantDeviceIntendedRecognitionLanguage");
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412802;
              v67 = self;
              v68 = 2112;
              v69 = v48;
              v70 = 2112;
              v71 = (uint64_t)v49;
              _os_log_impl(&dword_1B8E1E000, v47, OS_LOG_TYPE_DEFAULT, "%@:%@: Now starting Personal Identity Device Language Setup screen with override language %@", buf, 0x20u);

            }
            -[HULanguageSetupOnboardingFlow setForceOnboardingFinishedForErrorRecovery:](self, "setForceOnboardingFinishedForErrorRecovery:", 1);
            v50 = [HUHomePersonalIdentityDeviceLanguageSetupViewController alloc];
            -[HULanguageSetupOnboardingFlow home](self, "home");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = -[HUHomePersonalIdentityDeviceLanguageSetupViewController initWithHome:](v50, "initWithHome:", v51);

            -[HULanguageSetupOnboardingFlow assistantDeviceIntendedRecognitionLanguage](self, "assistantDeviceIntendedRecognitionLanguage");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            -[HUHomeAssistantDeviceLanguageConfigurationViewController setOverrideTargetLanguage:](v13, "setOverrideTargetLanguage:", v32);
          }

          goto LABEL_63;
        }
        HFLogForCategory();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          NSStringFromSelector(a2);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          -[HULanguageSetupOnboardingFlow home](self, "home");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "hf_appleTVs");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v44 = objc_msgSend(v43, "count");
          *(_DWORD *)buf = 138412802;
          v67 = self;
          v68 = 2112;
          v69 = v41;
          v70 = 2048;
          v71 = v44;
          _os_log_impl(&dword_1B8E1E000, v10, OS_LOG_TYPE_DEFAULT, "%@:%@ There are NO HomePods in this Home BUT we have (%lu) AppleTVs, skipping personal device language mismatch flows.", buf, 0x20u);

        }
      }
      else
      {
        HFLogForCategory();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(a2);
          v40 = (HULanguageSetupOnboardingFlow *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v67 = v40;
          _os_log_error_impl(&dword_1B8E1E000, v10, OS_LOG_TYPE_ERROR, "%@ Error fetching voice recognition languages", buf, 0xCu);

        }
      }
      v13 = 0;
LABEL_63:

      goto LABEL_64;
    }
    HFLogForCategory();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v67 = self;
      v68 = 2112;
      v69 = v39;
      _os_log_impl(&dword_1B8E1E000, v38, OS_LOG_TYPE_DEFAULT, "%@:%@ There is NO Siri language on this device, skipping personal device onboarding, will train & set up Siri voice during voice profile onboarding instead...", buf, 0x16u);

    }
  }
  else
  {
    if (!v6)
    {
      HFLogForCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        NSStringFromSelector(a2);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v67 = self;
        v68 = 2112;
        v69 = v8;
        v70 = 2112;
        v71 = (uint64_t)v5;
        _os_log_impl(&dword_1B8E1E000, v7, OS_LOG_TYPE_DEFAULT, "%@:%@ Determining next Assistant Device Language onboarding view controller with results %@ ", buf, 0x20u);

      }
      if (v5)
      {
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("HULanguageOnboardingKey_SupportedLanguageInfo"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("HULanguageOnboardingKey_LanguageMismatchedHomeAssistantDevices"));
        v10 = objc_claimAutoreleasedReturnValue();
        HFLogForCategory();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          NSStringFromSelector(a2);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v67 = self;
          v68 = 2112;
          v69 = v12;
          _os_log_impl(&dword_1B8E1E000, v11, OS_LOG_TYPE_DEFAULT, "%@:%@: Starting Home Assistant Device Language Configuration view", buf, 0x16u);

        }
        v13 = -[HUHomeAssistantDeviceLanguageConfigurationViewController initWithSupportedVoiceRecognitionLanguages:languageMismatchedHomeAssistantDevices:]([HUHomeAssistantDeviceLanguageConfigurationViewController alloc], "initWithSupportedVoiceRecognitionLanguages:languageMismatchedHomeAssistantDevices:", v9, v10);
        goto LABEL_63;
      }
      HFLogForCategory();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B8E1E000, v21, OS_LOG_TYPE_DEFAULT, "Configuring Assistant Device Setup View", buf, 2u);
      }

      v22 = [HUHomeAssistantDeviceLanguageSetupViewController alloc];
      -[HULanguageSetupOnboardingFlow home](self, "home");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = -[HUHomeAssistantDeviceLanguageSetupViewController initWithHome:](v22, "initWithHome:", v19);
      goto LABEL_20;
    }
    NSLog(CFSTR("Unexpected languageOnboardingFlowType %lu"), -[HULanguageSetupOnboardingFlow languageOnboardingFlowType](self, "languageOnboardingFlowType"));
  }
  v13 = 0;
LABEL_64:

  return v13;
}

- (NSString)description
{
  unint64_t v2;
  const __CFString *v3;

  v2 = -[HULanguageSetupOnboardingFlow languageOnboardingFlowType](self, "languageOnboardingFlowType");
  v3 = CFSTR("Personal Identity Device");
  if (v2 != 1)
    v3 = 0;
  if (!v2)
    v3 = CFSTR("Home Assistant Device");
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Voice Recognition LANGUAGE Setup (%@)"), v3);
}

- (id)processUserInput:(id)a3
{
  id v5;
  unint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  HULanguageSetupOnboardingFlow *v20;
  id v21;
  void *v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  _QWORD v36[6];
  uint8_t buf[4];
  HULanguageSetupOnboardingFlow *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  id v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = -[HULanguageSetupOnboardingFlow languageOnboardingFlowType](self, "languageOnboardingFlowType");
  if (v6 == 1)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("HULanguageOnboardingKey_SetupLanguage_PersonalDevice_UserInput"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "integerValue") == 3
      || objc_msgSend(v7, "integerValue") == 5
      || objc_msgSend(v7, "integerValue") == 4)
    {
      goto LABEL_10;
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HULanguageSetupOnboardingFlow.m"), 312, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("(userInputValue.integerValue == HULanguageOnboardingValue_SetupLanguage_PersonalDevice_Completed) || (userInputValue.integerValue == HULanguageOnboardingValue_SetupLanguage_PersonalDevice_Cancelled) || (userInputValue.integerValue == HULanguageOnboardingValue_SetupLanguage_PersonalDevice_Customize)"));
    goto LABEL_36;
  }
  if (v6)
  {
    NSLog(CFSTR("Unexpected languageOnboardingFlowType %lu"), -[HULanguageSetupOnboardingFlow languageOnboardingFlowType](self, "languageOnboardingFlowType"));
    v19 = 0;
    goto LABEL_34;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("HULanguageOnboardingKey_SetupLanguage_AssistantDevice_UserInput"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "integerValue")
    && objc_msgSend(v7, "integerValue") != 2
    && objc_msgSend(v7, "integerValue") != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HULanguageSetupOnboardingFlow.m"), 302, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("(userInputValue.integerValue == HULanguageOnboardingValue_SetupLanguage_AssistantDevice_Completed) || (userInputValue.integerValue == HULanguageOnboardingValue_SetupLanguage_AssistantDevice_Cancelled) || (userInputValue.integerValue == HULanguageOnboardingValue_SetupLanguage_AssistantDevice_Customize)"));
LABEL_36:

  }
LABEL_10:
  HFLogForCategory();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v38 = self;
    v39 = 2112;
    v40 = v10;
    v41 = 2112;
    v42 = v5;
    _os_log_impl(&dword_1B8E1E000, v9, OS_LOG_TYPE_DEFAULT, "%@:%@ with input results: %@", buf, 0x20u);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("HUMultiUserKey_SetIsEnabled"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "BOOLValue"))
  {
    -[HULanguageSetupOnboardingFlow home](self, "home");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __50__HULanguageSetupOnboardingFlow_processUserInput___block_invoke;
    v36[3] = &unk_1E6F4E568;
    v36[4] = self;
    v36[5] = a2;
    objc_msgSend(v12, "enableMultiUserWithCompletionHandler:", v36);

  }
  switch(objc_msgSend(v7, "integerValue"))
  {
    case 0:
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("HULanguageOnboardingKey_SetupLanguage_AssistantDevice_IntendedLanguage"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[HULanguageSetupOnboardingFlow setAssistantDeviceIntendedRecognitionLanguage:](self, "setAssistantDeviceIntendedRecognitionLanguage:", v22);

      -[HULanguageSetupOnboardingFlow setLanguageOnboardingFlowType:](self, "setLanguageOnboardingFlowType:", 1);
      v20 = self;
      v21 = 0;
      goto LABEL_20;
    case 1:
    case 4:
      v20 = self;
      v21 = v5;
LABEL_20:
      -[HULanguageSetupOnboardingFlow _determineNextViewControllerWithPriorResults:](v20, "_determineNextViewControllerWithPriorResults:", v21);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_24;
    case 2:
    case 5:
      objc_msgSend(v5, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("HUHomeFeatureOnboardingKey_IdentifyVoice_FinishedOnboarding"));
      -[HULanguageSetupOnboardingFlow setShouldAbortThisOnboardingFlowGroup:](self, "setShouldAbortThisOnboardingFlowGroup:", 1);
      v13 = objc_alloc(MEMORY[0x1E0D31988]);
      -[HULanguageSetupOnboardingFlow home](self, "home");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[HULanguageSetupOnboardingFlow home](self, "home");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "currentUser");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)objc_msgSend(v13, "initWithHome:user:nameStyle:", v14, v16, 0);

      v18 = (id)objc_msgSend(v17, "setEnableIdentifyVoice:", 0);
      goto LABEL_23;
    case 3:
      if (-[HULanguageSetupOnboardingFlow forceOnboardingFinishedForErrorRecovery](self, "forceOnboardingFinishedForErrorRecovery"))
      {
        v24 = MEMORY[0x1E0C9AAB0];
        objc_msgSend(v5, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("HUHomeFeatureOnboardingKey_IdentifyVoice_FinishedOnboarding"));
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v24, CFSTR("HUHomeFeatureOnboardingKey_IdentifyVoice_DismissReminderBanner"));
      }
      goto LABEL_23;
    default:
      NSLog(CFSTR("Unexpected userInputValue %lu"), objc_msgSend(v7, "integerValue"));
LABEL_23:
      v23 = 0;
LABEL_24:
      HFLogForCategory();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        NSStringFromSelector(a2);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v38 = self;
        v39 = 2112;
        v40 = v26;
        v41 = 2112;
        v42 = v23;
        _os_log_impl(&dword_1B8E1E000, v25, OS_LOG_TYPE_DEFAULT, "%@:%@: Next ViewController: %@", buf, 0x20u);

      }
      if (!v23)
      {
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("HUHomeFeatureOnboardingKey_IdentifyVoice_DismissReminderBanner"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v27)
        {
          v28 = objc_alloc(MEMORY[0x1E0D31988]);
          -[HULanguageSetupOnboardingFlow home](self, "home");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          -[HULanguageSetupOnboardingFlow home](self, "home");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "currentUser");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = (void *)objc_msgSend(v28, "initWithHome:user:nameStyle:", v29, v31, 0);

          if ((objc_msgSend(v32, "hasDismissedVoiceProfileOnboarding") & 1) != 0)
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "setObject:forKeyedSubscript:", v33, CFSTR("HUHomeFeatureOnboardingKey_IdentifyVoice_DismissReminderBanner"));

          }
          else
          {
            objc_msgSend(v5, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], CFSTR("HUHomeFeatureOnboardingKey_IdentifyVoice_DismissReminderBanner"));
          }

        }
        -[HULanguageSetupOnboardingFlow onboardingFuture](self, "onboardingFuture");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "finishWithNoResult");

      }
      v19 = v23;

      break;
  }
LABEL_34:

  return v19;
}

void __50__HULanguageSetupOnboardingFlow_processUserInput___block_invoke(uint64_t a1, void *a2)
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
  void *v10;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15[2];
  id location;

  v7 = a3;
  v8 = a4;
  if (objc_msgSend(MEMORY[0x1E0D319D0], "isAVisionPro"))
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
    v12[2] = __64__HULanguageSetupOnboardingFlow_needsOnboardingForHome_options___block_invoke;
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

void __64__HULanguageSetupOnboardingFlow_needsOnboardingForHome_options___block_invoke(uint64_t a1, void *a2)
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
    v51[2] = __64__HULanguageSetupOnboardingFlow_needsOnboardingForHome_options___block_invoke_2;
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
    v42[2] = __64__HULanguageSetupOnboardingFlow_needsOnboardingForHome_options___block_invoke_55;
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

uint64_t __64__HULanguageSetupOnboardingFlow_needsOnboardingForHome_options___block_invoke_2(uint64_t a1, void *a2)
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

void __64__HULanguageSetupOnboardingFlow_needsOnboardingForHome_options___block_invoke_55(uint64_t a1, void *a2, void *a3)
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

- (BOOL)forceOnboardingFinishedForErrorRecovery
{
  return self->_forceOnboardingFinishedForErrorRecovery;
}

- (void)setForceOnboardingFinishedForErrorRecovery:(BOOL)a3
{
  self->_forceOnboardingFinishedForErrorRecovery = a3;
}

- (unint64_t)languageOnboardingFlowType
{
  return self->_languageOnboardingFlowType;
}

- (void)setLanguageOnboardingFlowType:(unint64_t)a3
{
  self->_languageOnboardingFlowType = a3;
}

- (NSDictionary)usageOptions
{
  return self->_usageOptions;
}

- (void)setUsageOptions:(id)a3
{
  objc_storeStrong((id *)&self->_usageOptions, a3);
}

- (NSString)assistantDeviceIntendedRecognitionLanguage
{
  return self->_assistantDeviceIntendedRecognitionLanguage;
}

- (void)setAssistantDeviceIntendedRecognitionLanguage:(id)a3
{
  objc_storeStrong((id *)&self->_assistantDeviceIntendedRecognitionLanguage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assistantDeviceIntendedRecognitionLanguage, 0);
  objc_storeStrong((id *)&self->_usageOptions, 0);
  objc_storeStrong((id *)&self->_readyFuture, 0);
  objc_storeStrong((id *)&self->_initialViewController, 0);
  objc_storeStrong((id *)&self->_onboardingFuture, 0);
  objc_storeStrong((id *)&self->_home, 0);
}

@end
