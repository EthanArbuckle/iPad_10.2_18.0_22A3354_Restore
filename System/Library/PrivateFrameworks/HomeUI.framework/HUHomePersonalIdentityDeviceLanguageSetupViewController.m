@implementation HUHomePersonalIdentityDeviceLanguageSetupViewController

- (HUHomePersonalIdentityDeviceLanguageSetupViewController)initWithHome:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  HUHomePersonalIdentityDeviceLanguageSetupViewController *v10;
  HUHomePersonalIdentityDeviceLanguageSetupViewController *v11;
  uint64_t v12;
  OBTrayButton *continueButton;
  uint64_t v14;
  OBLinkTrayButton *customizeButton;
  objc_super v17;

  v5 = a3;
  HULocalizedModelString(CFSTR("HULanguagePersonalIdentityDevice_LanguageMismatch_Title"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  HULocalizedModelString(CFSTR("HULanguagePersonalIdentityDevice_LanguageMultipleMismatch_Detail"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  _HULocalizedStringWithDefaultValue(CFSTR("HULanguagePersonalIdentityDevice_LanguageMismatch_Title"), CFSTR("HULanguagePersonalIdentityDevice_LanguageMismatch_Title"), 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  HUSensitiveLocalizedModelString(CFSTR("HULanguagePersonalIdentityDevice_LanguageMultipleMismatch_Detail"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v17.receiver = self;
  v17.super_class = (Class)HUHomePersonalIdentityDeviceLanguageSetupViewController;
  v10 = -[HUHomePersonalIdentityDeviceLanguageSetupViewController initWithTitle:detailText:icon:contentLayout:](&v17, sel_initWithTitle_detailText_icon_contentLayout_, v8, v9, 0, 2);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_home, a3);
    objc_msgSend(MEMORY[0x1E0D65140], "boldButton");
    v12 = objc_claimAutoreleasedReturnValue();
    continueButton = v11->_continueButton;
    v11->_continueButton = (OBTrayButton *)v12;

    -[OBTrayButton setTranslatesAutoresizingMaskIntoConstraints:](v11->_continueButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x1E0D65170], "linkButton");
    v14 = objc_claimAutoreleasedReturnValue();
    customizeButton = v11->_customizeButton;
    v11->_customizeButton = (OBLinkTrayButton *)v14;

    -[OBLinkTrayButton setTranslatesAutoresizingMaskIntoConstraints:](v11->_customizeButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  }

  return v11;
}

- (void)_cancelLanguageSetup
{
  NSObject *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  uint8_t buf[4];
  HUHomePersonalIdentityDeviceLanguageSetupViewController *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v13 = self;
    v14 = 2112;
    v15 = v5;
    _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "%@:%@ User tapped button", buf, 0x16u);

  }
  HFLogForCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v13 = self;
    v14 = 2112;
    v15 = v7;
    _os_log_impl(&dword_1B8E1E000, v6, OS_LOG_TYPE_DEFAULT, "%@:%@: Cancelling Personal Identity Device Language Setup", buf, 0x16u);

  }
  -[HUHomePersonalIdentityDeviceLanguageSetupViewController delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = CFSTR("HULanguageOnboardingKey_SetupLanguage_PersonalDevice_UserInput");
  v11 = &unk_1E7041938;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "viewController:didFinishWithConfigurationResults:", self, v9);

}

- (void)_completeLanguageSetup
{
  NSObject *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  uint8_t buf[4];
  HUHomePersonalIdentityDeviceLanguageSetupViewController *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v13 = self;
    v14 = 2112;
    v15 = v5;
    _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "%@:%@ User tapped button", buf, 0x16u);

  }
  HFLogForCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v13 = self;
    v14 = 2112;
    v15 = v7;
    _os_log_impl(&dword_1B8E1E000, v6, OS_LOG_TYPE_DEFAULT, "%@:%@: Finishing Personal Identity Device Language Setup", buf, 0x16u);

  }
  -[HUHomePersonalIdentityDeviceLanguageSetupViewController delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = CFSTR("HULanguageOnboardingKey_SetupLanguage_PersonalDevice_UserInput");
  v11 = &unk_1E7041950;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "viewController:didFinishWithConfigurationResults:", self, v9);

}

- (void)_changeSiriLanguage
{
  NSObject *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[6];
  _QWORD v16[2];
  _QWORD v17[2];
  uint8_t buf[4];
  HUHomePersonalIdentityDeviceLanguageSetupViewController *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v19 = self;
    v20 = 2112;
    v21 = v5;
    _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "%@:%@ User tapped button", buf, 0x16u);

  }
  -[HUHomePersonalIdentityDeviceLanguageSetupViewController targetLanguage](self, "targetLanguage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    HFLogForCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUHomePersonalIdentityDeviceLanguageSetupViewController targetLanguage](self, "targetLanguage");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v19 = self;
      v20 = 2112;
      v21 = v8;
      v22 = 2112;
      v23 = v9;
      _os_log_impl(&dword_1B8E1E000, v7, OS_LOG_TYPE_DEFAULT, "%@:%@: Setting Siri language of Personal Identity Device to %@", buf, 0x20u);

    }
    v10 = objc_alloc_init(MEMORY[0x1E0CFE9B0]);
    -[HUHomePersonalIdentityDeviceLanguageSetupViewController targetLanguage](self, "targetLanguage");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __78__HUHomePersonalIdentityDeviceLanguageSetupViewController__changeSiriLanguage__block_invoke;
    v15[3] = &unk_1E6F4CE48;
    v15[4] = self;
    v15[5] = a2;
    objc_msgSend(v10, "setLanguage:withCompletion:", v11, v15);

  }
  else
  {
    -[HUHomePersonalIdentityDeviceLanguageSetupViewController delegate](self, "delegate");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v17[0] = &unk_1E7041968;
    v16[0] = CFSTR("HULanguageOnboardingKey_SetupLanguage_PersonalDevice_UserInput");
    v16[1] = CFSTR("HULanguageOnboardingKey_MediaProfileAndLanguageInfo");
    -[HUHomePersonalIdentityDeviceLanguageSetupViewController languageToHomePodsMapping](self, "languageToHomePodsMapping");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "copy");
    v17[1] = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "viewController:didFinishWithConfigurationResults:", self, v14);

  }
}

void __78__HUHomePersonalIdentityDeviceLanguageSetupViewController__changeSiriLanguage__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12[2];
  _QWORD v13[4];
  id v14[2];
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "targetLanguage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v16 = v3;
    v17 = 2112;
    v18 = v4;
    v19 = 2112;
    v20 = v5;
    _os_log_impl(&dword_1B8E1E000, v2, OS_LOG_TYPE_DEFAULT, "%@:%@: Personal Identity Device Siri language set to %@. Starting to check for voice profile availability...", buf, 0x20u);

  }
  objc_initWeak((id *)buf, *(id *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "targetLanguage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[HUHomeFeatureOnboardingUtilities checkVoiceProfileAvailabiltyForLanguage:](HUHomeFeatureOnboardingUtilities, "checkVoiceProfileAvailabiltyForLanguage:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __78__HUHomePersonalIdentityDeviceLanguageSetupViewController__changeSiriLanguage__block_invoke_9;
  v13[3] = &unk_1E6F533A8;
  objc_copyWeak(v14, (id *)buf);
  v14[1] = *(id *)(a1 + 40);
  v9 = (id)objc_msgSend(v7, "addFailureBlock:", v13);
  v11[0] = v8;
  v11[1] = 3221225472;
  v11[2] = __78__HUHomePersonalIdentityDeviceLanguageSetupViewController__changeSiriLanguage__block_invoke_12;
  v11[3] = &unk_1E6F5CBA8;
  objc_copyWeak(v12, (id *)buf);
  v12[1] = *(id *)(a1 + 40);
  v10 = (id)objc_msgSend(v7, "addSuccessBlock:", v11);
  objc_destroyWeak(v12);
  objc_destroyWeak(v14);

  objc_destroyWeak((id *)buf);
}

void __78__HUHomePersonalIdentityDeviceLanguageSetupViewController__changeSiriLanguage__block_invoke_9(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  id v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "targetLanguage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412802;
    v10 = WeakRetained;
    v11 = 2112;
    v12 = v5;
    v13 = 2112;
    v14 = v6;
    _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "%@:%@:\t...Personal Identity Device Siri language set to %@ (but failed to check for 'Hey Siri' Voice Profile)", (uint8_t *)&v9, 0x20u);

  }
  objc_msgSend(v3, "setObject:forKeyedSubscript:", &unk_1E7041950, CFSTR("HULanguageOnboardingKey_SetupLanguage_PersonalDevice_UserInput"));
  objc_msgSend(WeakRetained, "targetLanguage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("HULanguageOnboardingKey_PersonalDeviceSiriLanguageChanged_MissingVoiceProfile"));

  objc_msgSend(WeakRetained, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "viewController:didFinishWithConfigurationResults:", WeakRetained, v3);

}

void __78__HUHomePersonalIdentityDeviceLanguageSetupViewController__changeSiriLanguage__block_invoke_12(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  id v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v6 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  if (v8 && objc_msgSend(v8, "BOOLValue"))
  {
    HFLogForCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(*(SEL *)(a1 + 40));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "targetLanguage");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "targetLanguage");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138413058;
      v20 = WeakRetained;
      v21 = 2112;
      v22 = v10;
      v23 = 2112;
      v24 = v11;
      v25 = 2112;
      v26 = v12;
      _os_log_impl(&dword_1B8E1E000, v9, OS_LOG_TYPE_DEFAULT, "%@:%@:\t...Personal Identity Device Siri language set to %@ (& 'Hey Siri' Voice Profile for %@ WAS found in iCloud)", (uint8_t *)&v19, 0x2Au);

    }
    objc_msgSend(WeakRetained, "targetLanguage");
    v13 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v13, CFSTR("HULanguageOnboardingKey_PersonalDeviceSiriLanguageChanged_HasVoiceProfile"));
  }
  else
  {
    objc_msgSend(WeakRetained, "targetLanguage");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v14, CFSTR("HULanguageOnboardingKey_PersonalDeviceSiriLanguageChanged_MissingVoiceProfile"));

    HFLogForCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(*(SEL *)(a1 + 40));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "targetLanguage");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "targetLanguage");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138413058;
      v20 = WeakRetained;
      v21 = 2112;
      v22 = v15;
      v23 = 2112;
      v24 = v16;
      v25 = 2112;
      v26 = v17;
      _os_log_impl(&dword_1B8E1E000, v13, OS_LOG_TYPE_DEFAULT, "%@:%@:\t...Personal Identity Device Siri language set to %@ (& 'Hey Siri' Voice Profile for %@ was NOT found in iCloud)", (uint8_t *)&v19, 0x2Au);

    }
  }

  objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_1E7041950, CFSTR("HULanguageOnboardingKey_SetupLanguage_PersonalDevice_UserInput"));
  objc_msgSend(WeakRetained, "delegate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "viewController:didFinishWithConfigurationResults:", WeakRetained, v5);

}

- (id)hu_preloadContent
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  id v11[2];
  id location;

  objc_initWeak(&location, self);
  -[HUHomePersonalIdentityDeviceLanguageSetupViewController home](self, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hf_hasHomePods");

  v6 = (void *)MEMORY[0x1E0D519C0];
  if (v5)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __76__HUHomePersonalIdentityDeviceLanguageSetupViewController_hu_preloadContent__block_invoke;
    v10[3] = &unk_1E6F572A0;
    objc_copyWeak(v11, &location);
    v11[1] = (id)a2;
    objc_msgSend(v6, "futureWithBlock:", v10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_destroyWeak(v11);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:", 48);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "futureWithError:", v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_destroyWeak(&location);
  return v7;
}

void __76__HUHomePersonalIdentityDeviceLanguageSetupViewController_hu_preloadContent__block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  uint8_t buf[4];
  id v50;
  __int16 v51;
  void *v52;
  __int16 v53;
  void *v54;
  __int16 v55;
  uint64_t v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v3 = (id *)(a1 + 32);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "overrideTargetLanguage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(WeakRetained, "overrideTargetLanguage");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "setTargetLanguage:", v7);
  }
  else
  {
    +[HUHomeFeatureOnboardingUtilities fetchSupportedVoiceRecognitionLanguages](HUHomeFeatureOnboardingUtilities, "fetchSupportedVoiceRecognitionLanguages");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "setSupportedVoiceRecognitionLanguages:", v8);

    objc_msgSend(WeakRetained, "supportedVoiceRecognitionLanguages");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      HFLogForCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(*(SEL *)(a1 + 40));
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v50 = v47;
        _os_log_error_impl(&dword_1B8E1E000, v10, OS_LOG_TYPE_ERROR, "%@ Error fetching voice recognition languages", buf, 0xCu);

      }
    }
    objc_msgSend(WeakRetained, "home");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "supportedVoiceRecognitionLanguages");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[HUHomeFeatureOnboardingUtilities home:createMultiUserLanguageToHomePodsMapping:](HUHomeFeatureOnboardingUtilities, "home:createMultiUserLanguageToHomePodsMapping:", v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "setLanguageToHomePodsMapping:", v13);

    HFLogForCategory();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(*(SEL *)(a1 + 40));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "languageToHomePodsMapping");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "languageToHomePodsMapping");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "count");
      *(_DWORD *)buf = 138413058;
      v50 = WeakRetained;
      v51 = 2112;
      v52 = v15;
      v53 = 2112;
      v54 = v16;
      v55 = 2048;
      v56 = v18;
      _os_log_impl(&dword_1B8E1E000, v14, OS_LOG_TYPE_DEFAULT, "%@:%@: VoiceRecognitionLanguageLanguageToHomePods mapping = %@ (%lu)", buf, 0x2Au);

    }
    objc_msgSend(WeakRetained, "languageToHomePodsMapping");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[HUHomeFeatureOnboardingUtilities createPersonalIdentityDeviceLanguageMismatchList:](HUHomeFeatureOnboardingUtilities, "createPersonalIdentityDeviceLanguageMismatchList:", v19);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    HFLogForCategory();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(*(SEL *)(a1 + 40));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v7, "count");
      *(_DWORD *)buf = 138413058;
      v50 = WeakRetained;
      v51 = 2112;
      v52 = v21;
      v53 = 2112;
      v54 = v7;
      v55 = 2048;
      v56 = v22;
      _os_log_impl(&dword_1B8E1E000, v20, OS_LOG_TYPE_DEFAULT, "%@:%@: List of Language mismatches for Personal Identity Device = %@ (%lu)", buf, 0x2Au);

    }
    if (objc_msgSend(v7, "count") == 1)
    {
      objc_msgSend(v7, "lastObject");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "setTargetLanguage:", v23);

    }
  }

  HFLogForCategory();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "targetLanguage");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "targetLanguage");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v50 = WeakRetained;
    v51 = 2112;
    v52 = v25;
    v53 = 2112;
    v54 = v26;
    v55 = 1024;
    LODWORD(v56) = v27 == 0;
    _os_log_impl(&dword_1B8E1E000, v24, OS_LOG_TYPE_DEFAULT, "%@:%@: Target Language %@, user needs to choose on next screen?: %{BOOL}d", buf, 0x26u);

  }
  objc_msgSend(WeakRetained, "targetLanguage");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    objc_msgSend(MEMORY[0x1E0CFE900], "sharedInstance");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "targetLanguage");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "localizedNameForSiriLanguage:inDisplayLanguage:", v30, 0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    HULocalizedModelString(CFSTR("HULanguagePersonalIdentityDevice_LanguageSingleMismatch_Detail"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    HUSensitiveLocalizedModelString(CFSTR("HULanguagePersonalIdentityDevice_LanguageSingleMismatch_Detail"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    v48 = 0;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithValidatedFormat:validFormatSpecifiers:error:", v33, CFSTR("%@"), &v48, v31);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v48;
    v36 = v35;
    if (!v34)
      NSLog(CFSTR("Couldn't localize format string \"%@\". Most likely, the format specifiers don't match. %@"), v33, v35);
    objc_msgSend(WeakRetained, "headerView");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setDetailText:", v34);

  }
  objc_msgSend(WeakRetained, "continueButton");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  _HULocalizedStringWithDefaultValue(CFSTR("HULanguageDontRecognizeVoiceButton_Title"), CFSTR("HULanguageDontRecognizeVoiceButton_Title"), 1);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setTitle:forState:", v39, 0);

  objc_msgSend(WeakRetained, "continueButton");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "addTarget:action:forControlEvents:", WeakRetained, sel__cancelLanguageSetup, 64);

  objc_msgSend(WeakRetained, "customizeButton");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  _HULocalizedStringWithDefaultValue(CFSTR("HULanguageChangeSiriLanguage_Button_Title"), CFSTR("HULanguageChangeSiriLanguage_Button_Title"), 1);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setTitle:forState:", v42, 0);

  objc_msgSend(WeakRetained, "customizeButton");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "addTarget:action:forControlEvents:", WeakRetained, sel__changeSiriLanguage, 64);

  _HULocalizedStringWithDefaultValue(CFSTR("HULanguagePersonalIdentityDevice_LanguageMismatch_FinePrint"), CFSTR("HULanguagePersonalIdentityDevice_LanguageMismatch_FinePrint"), 1);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  _HULocalizedStringWithDefaultValue(CFSTR("HULanguagePersonalIdentityDevice_SiriEnabledAccessories_LanguageMismatch_FinePrint"), CFSTR("HULanguagePersonalIdentityDevice_SiriEnabledAccessories_LanguageMismatch_FinePrint"), 1);
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "buttonTray");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "setCaptionText:", v45);

  objc_msgSend(v4, "finishWithNoResult");
}

- (void)viewDidLoad
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  objc_super v12;
  uint8_t buf[4];
  HUHomePersonalIdentityDeviceLanguageSetupViewController *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12.receiver = self;
  v12.super_class = (Class)HUHomePersonalIdentityDeviceLanguageSetupViewController;
  -[OBBaseWelcomeController viewDidLoad](&v12, sel_viewDidLoad);
  -[HUHomePersonalIdentityDeviceLanguageSetupViewController headerView](self, "headerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subviews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[HUAccessibilityIdentifierUtilities setAccessibilityIDForViews:withIDDictionary:](HUAccessibilityIdentifierUtilities, "setAccessibilityIDForViews:withIDDictionary:", v5, &unk_1E70432C0);

  -[HUHomePersonalIdentityDeviceLanguageSetupViewController setModalInPresentation:](self, "setModalInPresentation:", 1);
  -[HUHomePersonalIdentityDeviceLanguageSetupViewController buttonTray](self, "buttonTray");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUHomePersonalIdentityDeviceLanguageSetupViewController continueButton](self, "continueButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addButton:", v7);

  -[HUHomePersonalIdentityDeviceLanguageSetupViewController buttonTray](self, "buttonTray");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUHomePersonalIdentityDeviceLanguageSetupViewController customizeButton](self, "customizeButton");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addButton:", v9);

  HFLogForCategory();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v14 = self;
    v15 = 2112;
    v16 = v11;
    _os_log_impl(&dword_1B8E1E000, v10, OS_LOG_TYPE_DEFAULT, "%@:%@: presented: HPIDLSVC", buf, 0x16u);

  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  objc_super v8;
  uint8_t buf[4];
  HUHomePersonalIdentityDeviceLanguageSetupViewController *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)HUHomePersonalIdentityDeviceLanguageSetupViewController;
  -[HUHomePersonalIdentityDeviceLanguageSetupViewController viewWillDisappear:](&v8, sel_viewWillDisappear_, a3);
  if (-[HUHomePersonalIdentityDeviceLanguageSetupViewController isMovingFromParentViewController](self, "isMovingFromParentViewController"))
  {
    HFLogForCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v10 = self;
      v11 = 2112;
      v12 = v6;
      _os_log_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_DEFAULT, "%@:%@ User tapped BACK button", buf, 0x16u);

    }
    -[HUHomePersonalIdentityDeviceLanguageSetupViewController delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "viewControllerDidGoBack:", self);

  }
}

- (Class)onboardingFlowClass
{
  return (Class)objc_opt_class();
}

- (HUConfigurationViewControllerDelegate)delegate
{
  return (HUConfigurationViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)overrideTargetLanguage
{
  return self->_overrideTargetLanguage;
}

- (void)setOverrideTargetLanguage:(id)a3
{
  objc_storeStrong((id *)&self->_overrideTargetLanguage, a3);
}

- (HMHome)home
{
  return self->_home;
}

- (void)setHome:(id)a3
{
  objc_storeStrong((id *)&self->_home, a3);
}

- (NSString)targetLanguage
{
  return self->_targetLanguage;
}

- (void)setTargetLanguage:(id)a3
{
  objc_storeStrong((id *)&self->_targetLanguage, a3);
}

- (OBTrayButton)continueButton
{
  return self->_continueButton;
}

- (void)setContinueButton:(id)a3
{
  objc_storeStrong((id *)&self->_continueButton, a3);
}

- (OBLinkTrayButton)customizeButton
{
  return self->_customizeButton;
}

- (void)setCustomizeButton:(id)a3
{
  objc_storeStrong((id *)&self->_customizeButton, a3);
}

- (NSArray)supportedVoiceRecognitionLanguages
{
  return self->_supportedVoiceRecognitionLanguages;
}

- (void)setSupportedVoiceRecognitionLanguages:(id)a3
{
  objc_storeStrong((id *)&self->_supportedVoiceRecognitionLanguages, a3);
}

- (NSDictionary)languageToHomePodsMapping
{
  return self->_languageToHomePodsMapping;
}

- (void)setLanguageToHomePodsMapping:(id)a3
{
  objc_storeStrong((id *)&self->_languageToHomePodsMapping, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_languageToHomePodsMapping, 0);
  objc_storeStrong((id *)&self->_supportedVoiceRecognitionLanguages, 0);
  objc_storeStrong((id *)&self->_customizeButton, 0);
  objc_storeStrong((id *)&self->_continueButton, 0);
  objc_storeStrong((id *)&self->_targetLanguage, 0);
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_overrideTargetLanguage, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
