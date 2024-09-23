@implementation HUHomeAssistantDeviceLanguageSetupViewController

- (HUHomeAssistantDeviceLanguageSetupViewController)initWithHome:(id)a3
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  HUHomeAssistantDeviceLanguageSetupViewController *v10;
  uint64_t v11;
  NSArray *supportedVoiceRecognitionLanguages;
  NSArray *v13;
  NSObject *v14;
  NSObject *v15;
  HUHomeAssistantDeviceLanguageSetupViewController *v16;
  uint64_t v17;
  NSArray *v18;
  objc_super v20;
  uint8_t buf[4];
  HUHomeAssistantDeviceLanguageSetupViewController *v22;
  __int16 v23;
  HUHomeAssistantDeviceLanguageSetupViewController *v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  NSArray *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  _HULocalizedStringWithDefaultValue(CFSTR("HULanguageCanRecognizeMultipleVoices_Title"), CFSTR("HULanguageCanRecognizeMultipleVoices_Title"), 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  _HULocalizedStringWithDefaultValue(CFSTR("HULanguageCanRecognizeMultipleVoices_Title"), CFSTR("HULanguageCanRecognizeMultipleVoices_Title"), 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  HUImageNamed(CFSTR("Onboarding-MediaAccessoryLanguage"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v20.receiver = self;
  v20.super_class = (Class)HUHomeAssistantDeviceLanguageSetupViewController;
  v10 = -[HUImageOBWelcomeController initWithTitle:detailText:icon:contentImage:](&v20, sel_initWithTitle_detailText_icon_contentImage_, v8, &stru_1E6F60E80, 0, v9);

  if (v10)
  {
    objc_storeStrong((id *)&v10->_home, a3);
    -[HUHomeAssistantDeviceLanguageSetupViewController _setupPersonalRequestsItemInfrastructure](v10, "_setupPersonalRequestsItemInfrastructure");
    +[HUHomeFeatureOnboardingUtilities fetchSupportedVoiceRecognitionLanguages](HUHomeFeatureOnboardingUtilities, "fetchSupportedVoiceRecognitionLanguages");
    v11 = objc_claimAutoreleasedReturnValue();
    supportedVoiceRecognitionLanguages = v10->_supportedVoiceRecognitionLanguages;
    v10->_supportedVoiceRecognitionLanguages = (NSArray *)v11;

    v13 = v10->_supportedVoiceRecognitionLanguages;
    HFLogForCategory();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v13)
    {
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
LABEL_7:

        goto LABEL_8;
      }
      NSStringFromSelector(a2);
      v16 = (HUHomeAssistantDeviceLanguageSetupViewController *)objc_claimAutoreleasedReturnValue();
      v17 = -[NSArray count](v10->_supportedVoiceRecognitionLanguages, "count");
      v18 = v10->_supportedVoiceRecognitionLanguages;
      *(_DWORD *)buf = 138413058;
      v22 = v10;
      v23 = 2112;
      v24 = v16;
      v25 = 2048;
      v26 = v17;
      v27 = 2112;
      v28 = v18;
      _os_log_impl(&dword_1B8E1E000, v15, OS_LOG_TYPE_DEFAULT, "%@:%@: %lu Supported voice recognition languages are %@", buf, 0x2Au);
    }
    else
    {
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        goto LABEL_7;
      NSStringFromSelector(a2);
      v16 = (HUHomeAssistantDeviceLanguageSetupViewController *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v22 = v16;
      _os_log_error_impl(&dword_1B8E1E000, v15, OS_LOG_TYPE_ERROR, "%@ Error fetching voice recognition languages", buf, 0xCu);
    }

    goto LABEL_7;
  }
LABEL_8:

  return v10;
}

- (id)hu_preloadContent
{
  void *v4;
  char v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[6];
  char v24;
  char v25;
  uint8_t buf[4];
  HUHomeAssistantDeviceLanguageSetupViewController *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  int v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  -[HUHomeAssistantDeviceLanguageSetupViewController home](self, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hf_hasHomePods");

  -[HUHomeAssistantDeviceLanguageSetupViewController home](self, "home");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hf_hasRMVCapableAppleTV");

  if ((v5 & 1) == 0 && !v7)
  {
    v8 = (void *)MEMORY[0x1E0D519C0];
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v10 = 48;
LABEL_10:
    objc_msgSend(v9, "hf_errorWithCode:", v10);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "futureWithError:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    return v18;
  }
  HFLogForCategory();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUHomeAssistantDeviceLanguageSetupViewController home](self, "home");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v27 = self;
    v28 = 2112;
    v29 = v12;
    v30 = 2048;
    v31 = objc_msgSend(v13, "hf_numberOfHomePods");
    v32 = 1024;
    v33 = v7;
    _os_log_impl(&dword_1B8E1E000, v11, OS_LOG_TYPE_DEFAULT, "%@:%@ Determining which screen variant for %lu HomePods. hasRMVCapableAppleTV = %{BOOL}d", buf, 0x26u);

  }
  if ((v7 & 1) == 0
    && ((objc_msgSend(MEMORY[0x1E0D319D0], "isAMac") & 1) != 0
     || objc_msgSend(MEMORY[0x1E0D319D0], "isAVisionPro")))
  {
    _HULocalizedStringWithDefaultValue(CFSTR("HULanguageNeedsiOSDevice_Title"), CFSTR("HULanguageNeedsiOSDevice_Title"), 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUHomeAssistantDeviceLanguageSetupViewController setTitleString:](self, "setTitleString:", v14);

    _HULocalizedStringWithDefaultValue(CFSTR("HULanguageNeedsiOSDevice_Detail"), CFSTR("HULanguageNeedsiOSDevice_Detail"), 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUHomeAssistantDeviceLanguageSetupViewController setDetailsString:](self, "setDetailsString:", v15);

    _HULocalizedStringWithDefaultValue(CFSTR("HULanguageContinueWithoutVoiceRecognition_Button_Title"), CFSTR("HULanguageContinueWithoutVoiceRecognition_Button_Title"), 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUHomeAssistantDeviceLanguageSetupViewController setContinueButtonString:](self, "setContinueButtonString:", v16);

    -[HUHomeAssistantDeviceLanguageSetupViewController setContinueSelector:](self, "setContinueSelector:", sel__cancelLanguageSetup);
    v8 = (void *)MEMORY[0x1E0D519C0];
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v10 = 47;
    goto LABEL_10;
  }
  -[HUHomeAssistantDeviceLanguageSetupViewController home](self, "home");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[HUHomeFeatureOnboardingUtilities atLeastOneHomePodHasLanguageSettingsForHomeFuture:](HUHomeFeatureOnboardingUtilities, "atLeastOneHomePodHasLanguageSettingsForHomeFuture:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __69__HUHomeAssistantDeviceLanguageSetupViewController_hu_preloadContent__block_invoke;
  v23[3] = &unk_1E6F4E518;
  v24 = v7;
  v25 = v5;
  v23[4] = self;
  v23[5] = a2;
  objc_msgSend(v21, "flatMap:", v23);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

id __69__HUHomeAssistantDeviceLanguageSetupViewController_hu_preloadContent__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  NSObject *v30;
  NSObject *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  int v36;
  void *v37;
  char v38;
  NSObject *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  unint64_t v56;
  __CFString *v57;
  NSObject *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  id *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v70;
  int v71;
  NSObject *v72;
  uint64_t v73;
  void *v74;
  void *v75;
  id *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  NSObject *v84;
  uint64_t v85;
  void *v86;
  void *v87;
  id *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  uint64_t v95;
  void *v96;
  uint64_t (*v97)(uint64_t, uint64_t);
  id v98;
  _QWORD v99[5];
  _BYTE buf[24];
  uint64_t (*v101)(uint64_t, uint64_t);
  _BYTE v102[20];
  uint64_t v103;

  v103 = *MEMORY[0x1E0C80C00];
  v98 = a2;
  objc_msgSend(*(id *)(a1 + 32), "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hf_currentUserIsOwner");

  if (v4)
    objc_msgSend(*(id *)(a1 + 32), "setShouldSetMultiUserIsEnabled:", 1);
  if (*(_BYTE *)(a1 + 48) || v98 || !*(_BYTE *)(a1 + 49))
  {
    objc_msgSend(*(id *)(a1 + 32), "supportedVoiceRecognitionLanguages");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "home");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[HUHomeFeatureOnboardingUtilities analyzeHomeAssistantDevicesForSupportedVoiceRecognitionLanguages:home:](HUHomeFeatureOnboardingUtilities, "analyzeHomeAssistantDevicesForSupportedVoiceRecognitionLanguages:home:", v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("supportingLanguages"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("languageMismatch"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setHomeAssistantDevicesHavingLanguageMismatch:", v9);

    HFLogForCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = *(_QWORD *)(a1 + 32);
      NSStringFromSelector(*(SEL *)(a1 + 40));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "home");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "hf_numberOfHomePods");
      v15 = objc_msgSend(v8, "count");
      objc_msgSend(*(id *)(a1 + 32), "homeAssistantDevicesHavingLanguageMismatch");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413314;
      *(_QWORD *)&buf[4] = v11;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v12;
      *(_WORD *)&buf[22] = 2048;
      v101 = (uint64_t (*)(uint64_t, uint64_t))v14;
      *(_WORD *)v102 = 2048;
      *(_QWORD *)&v102[2] = v15;
      *(_WORD *)&v102[10] = 2048;
      *(_QWORD *)&v102[12] = objc_msgSend(v16, "count");
      _os_log_impl(&dword_1B8E1E000, v10, OS_LOG_TYPE_DEFAULT, "%@:%@: HomePod language analysis: %lu HomePods: %lu on supported voice recognition languages / %lu not.", buf, 0x34u);

    }
    objc_msgSend(*(id *)(a1 + 32), "setMaxNumberOfVoicesReached:", 0);
    if (objc_msgSend(*(id *)(a1 + 32), "maxNumberOfVoicesReached"))
    {
      HFLogForCategory();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v18 = *(_QWORD *)(a1 + 32);
        NSStringFromSelector(*(SEL *)(a1 + 40));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v18;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v19;
        _os_log_impl(&dword_1B8E1E000, v17, OS_LOG_TYPE_DEFAULT, "%@:%@: Maximum voice profiles reached", buf, 0x16u);

      }
      _HULocalizedStringWithDefaultValue(CFSTR("HULanguageCannotRecognizeAdditionalVoices_Title"), CFSTR("HULanguageCannotRecognizeAdditionalVoices_Title"), 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = *(void **)(a1 + 32);
      v21 = (id *)(a1 + 32);
      objc_msgSend(v22, "setTitleString:", v20);

      _HULocalizedStringWithDefaultValue(CFSTR("HULanguageCannotRecognizeAdditionalVoices_Detail"), CFSTR("HULanguageCannotRecognizeAdditionalVoices_Detail"), 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*v21, "setDetailsString:", v23);

      _HULocalizedStringWithDefaultValue(CFSTR("HULanguageContinueWithoutVoiceRecognition_Button_Title"), CFSTR("HULanguageContinueWithoutVoiceRecognition_Button_Title"), 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*v21, "setContinueButtonString:", v24);

      objc_msgSend(*v21, "setContinueSelector:", sel__cancelLanguageSetup);
      v25 = (void *)MEMORY[0x1E0D519C0];
      objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:", 44);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "futureWithError:", v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_33;
    }
    objc_msgSend(*(id *)(a1 + 32), "supportedVoiceRecognitionLanguages");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "count");

    HFLogForCategory();
    v30 = objc_claimAutoreleasedReturnValue();
    v31 = v30;
    if (!v29)
    {
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        v95 = *(_QWORD *)(a1 + 32);
        NSStringFromSelector(*(SEL *)(a1 + 40));
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:", 45);
        v97 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = v95;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v96;
        *(_WORD *)&buf[22] = 2112;
        v101 = v97;
        _os_log_error_impl(&dword_1B8E1E000, v31, OS_LOG_TYPE_ERROR, "%@:%@: NO Supporting voice recognition languages. Finishing with Error %@", buf, 0x20u);

      }
      v67 = (void *)MEMORY[0x1E0D519C0];
      objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:", 45);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "futureWithError:", v68);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_33;
    }
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      v32 = *(_QWORD *)(a1 + 32);
      NSStringFromSelector(*(SEL *)(a1 + 40));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v8, "count");
      objc_msgSend(*(id *)(a1 + 32), "home");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v35, "hf_currentUserIsAdministrator");
      *(_DWORD *)buf = 138413058;
      *(_QWORD *)&buf[4] = v32;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v33;
      *(_WORD *)&buf[22] = 2048;
      v101 = (uint64_t (*)(uint64_t, uint64_t))v34;
      *(_WORD *)v102 = 1024;
      *(_DWORD *)&v102[2] = v36;
      _os_log_impl(&dword_1B8E1E000, v31, OS_LOG_TYPE_DEFAULT, "%@:%@: %lu HomePods on supported voice recognition languages & user is admin?: %{BOOL}d", buf, 0x26u);

    }
    if (!*(_BYTE *)(a1 + 48))
    {
      if (*(_BYTE *)(a1 + 49))
      {
        if (!objc_msgSend(v8, "count"))
        {
          objc_msgSend(*(id *)(a1 + 32), "home");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = objc_msgSend(v37, "hf_currentUserIsAdministrator");

          if ((v38 & 1) == 0)
          {
            HFLogForCategory();
            v84 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
            {
              v85 = *(_QWORD *)(a1 + 32);
              NSStringFromSelector(*(SEL *)(a1 + 40));
              v86 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              *(_QWORD *)&buf[4] = v85;
              *(_WORD *)&buf[12] = 2112;
              *(_QWORD *)&buf[14] = v86;
              _os_log_impl(&dword_1B8E1E000, v84, OS_LOG_TYPE_DEFAULT, "%@:%@: NO Supporting voice recognition languages for HomePods AND Current User is NOT an Admin ", buf, 0x16u);

            }
            _HULocalizedStringWithDefaultValue(CFSTR("HULanguageCannotRecognizeMultipleVoices_Title"), CFSTR("HULanguageCannotRecognizeMultipleVoices_Title"), 1);
            v87 = (void *)objc_claimAutoreleasedReturnValue();
            v89 = *(void **)(a1 + 32);
            v88 = (id *)(a1 + 32);
            objc_msgSend(v89, "setTitleString:", v87);

            _HULocalizedStringWithDefaultValue(CFSTR("HULanguageCannotRecognizeMultipleVoices_Detail"), CFSTR("HULanguageCannotRecognizeMultipleVoices_Detail"), 1);
            v90 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*v88, "setDetailsString:", v90);

            _HULocalizedStringWithDefaultValue(CFSTR("HULanguageCannotRecognizeMultipleVoices_Title"), CFSTR("HULanguageCannotRecognizeMultipleVoices_Title"), 1);
            v91 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*v88, "setTitleString:", v91);

            _HULocalizedStringWithDefaultValue(CFSTR("HULanguageCannotRecognizeMultipleVoices_Detail"), CFSTR("HULanguageCannotRecognizeMultipleVoices_Detail"), 1);
            v92 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*v88, "setDetailsString:", v92);

            _HULocalizedStringWithDefaultValue(CFSTR("HULanguageContinueWithoutVoiceRecognition_Button_Title"), CFSTR("HULanguageContinueWithoutVoiceRecognition_Button_Title"), 1);
            v93 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*v88, "setContinueButtonString:", v93);

            objc_msgSend(*v88, "setContinueSelector:", sel__cancelLanguageSetup);
            objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:", 43);
            v94 = (void *)objc_claimAutoreleasedReturnValue();
            if (v94)
            {
              objc_msgSend(MEMORY[0x1E0D519C0], "futureWithError:", v94);
              v27 = (void *)objc_claimAutoreleasedReturnValue();

              goto LABEL_33;
            }
LABEL_21:
            objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_33:

            goto LABEL_34;
          }
        }
      }
      if (!*(_BYTE *)(a1 + 48))
      {
        if (*(_BYTE *)(a1 + 49))
        {
          if (!objc_msgSend(v8, "count"))
          {
            objc_msgSend(*(id *)(a1 + 32), "home");
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            v71 = objc_msgSend(v70, "hf_currentUserIsAdministrator");

            if (v71)
            {
              HFLogForCategory();
              v72 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
              {
                v73 = *(_QWORD *)(a1 + 32);
                NSStringFromSelector(*(SEL *)(a1 + 40));
                v74 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412546;
                *(_QWORD *)&buf[4] = v73;
                *(_WORD *)&buf[12] = 2112;
                *(_QWORD *)&buf[14] = v74;
                _os_log_impl(&dword_1B8E1E000, v72, OS_LOG_TYPE_DEFAULT, "%@:%@: NO RMV Capable AppleTVs, NO Supporting voice recognition languages for HomePods AND Current User is an Admin ", buf, 0x16u);

              }
              _HULocalizedStringWithDefaultValue(CFSTR("HULanguageCannotRecognizeMultipleVoices_Title"), CFSTR("HULanguageCannotRecognizeMultipleVoices_Title"), 1);
              v75 = (void *)objc_claimAutoreleasedReturnValue();
              v77 = *(void **)(a1 + 32);
              v76 = (id *)(a1 + 32);
              objc_msgSend(v77, "setTitleString:", v75);

              _HULocalizedStringWithDefaultValue(CFSTR("HULanguageCannotRecognizeMultipleVoices_Detail"), CFSTR("HULanguageCannotRecognizeMultipleVoices_Detail"), 1);
              v78 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(*v76, "setDetailsString:", v78);

              _HULocalizedStringWithDefaultValue(CFSTR("HULanguageCannotRecognizeMultipleVoices_Title"), CFSTR("HULanguageCannotRecognizeMultipleVoices_Title"), 1);
              v79 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(*v76, "setTitleString:", v79);

              _HULocalizedStringWithDefaultValue(CFSTR("HULanguageCannotRecognizeMultipleVoices_Detail"), CFSTR("HULanguageCannotRecognizeMultipleVoices_Detail"), 1);
              v80 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(*v76, "setDetailsString:", v80);

              _HULocalizedStringWithDefaultValue(CFSTR("HULanguageContinueWithoutVoiceRecognition_Button_Title"), CFSTR("HULanguageContinueWithoutVoiceRecognition_Button_Title"), 1);
              v81 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(*v76, "setContinueButtonString:", v81);

              objc_msgSend(*v76, "setContinueSelector:", sel__cancelLanguageSetup);
              _HULocalizedStringWithDefaultValue(CFSTR("HULanguageChangeLanguageButton_Title"), CFSTR("HULanguageChangeLanguageButton_Title"), 1);
              v82 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(*v76, "setCustomizeButtonString:", v82);

              _HULocalizedStringWithDefaultValue(CFSTR("HULanguageChangeLanguageButton_Title"), CFSTR("HULanguageChangeLanguageButton_Title"), 1);
              v83 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(*v76, "setCustomizeButtonString:", v83);

              objc_msgSend(*v76, "setCustomizeSelector:", sel__changeLanguage);
              goto LABEL_21;
            }
          }
        }
      }
    }
    HFLogForCategory();
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      v40 = *(_QWORD *)(a1 + 32);
      NSStringFromSelector(*(SEL *)(a1 + 40));
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v40;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v41;
      _os_log_impl(&dword_1B8E1E000, v39, OS_LOG_TYPE_DEFAULT, "%@:%@: At least ONE HomePod supports voice recognition languages OR RMV Capable AppleTV exists!", buf, 0x16u);

    }
    _HULocalizedStringWithDefaultValue(CFSTR("HULanguageCanRecognizeMultipleVoices_Title"), CFSTR("HULanguageCanRecognizeMultipleVoices_Title"), 1);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setTitleString:", v42);

    _HULocalizedStringWithDefaultValue(CFSTR("HULanguageCanRecognizeMultipleVoices_Detail"), CFSTR("HULanguageCanRecognizeMultipleVoices_Detail"), 1);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setDetailsString:", v43);

    _HULocalizedStringWithDefaultValue(CFSTR("HULanguageCanRecognizeMultipleVoices_Title"), CFSTR("HULanguageCanRecognizeMultipleVoices_Title"), 1);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setTitleString:", v44);

    _HULocalizedStringWithDefaultValue(CFSTR("HULanguageCanRecognizeMultipleVoices_Detail"), CFSTR("HULanguageCanRecognizeMultipleVoices_Detail"), 1);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setDetailsString:", v45);

    _HULocalizedStringWithDefaultValue(CFSTR("HUContinueTitle"), CFSTR("HUContinueTitle"), 1);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setContinueButtonString:", v46);

    objc_msgSend(*(id *)(a1 + 32), "setContinueSelector:", sel__checkForiCloudSiriEnabledAndCompleteSetup);
    _HULocalizedStringWithDefaultValue(CFSTR("HULanguageDontRecognizeVoiceButton_Title"), CFSTR("HULanguageDontRecognizeVoiceButton_Title"), 1);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setCustomizeButtonString:", v47);

    objc_msgSend(*(id *)(a1 + 32), "setCustomizeSelector:", sel__cancelLanguageSetup);
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v101 = __Block_byref_object_copy__2;
    *(_QWORD *)v102 = __Block_byref_object_dispose__2;
    _HULocalizedStringWithDefaultValue(CFSTR("HULanguageCanRecognizeMultipleVoicesAirplay_UnknownDevice"), CFSTR("HULanguageCanRecognizeMultipleVoicesAirplay_UnknownDevice"), 1);
    *(_QWORD *)&v102[8] = objc_claimAutoreleasedReturnValue();
    +[HULocationDeviceManager sharedInstance](HULocationDeviceManager, "sharedInstance");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "activeLocationDeviceFuture");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v99[0] = MEMORY[0x1E0C809B0];
    v99[1] = 3221225472;
    v99[2] = __69__HUHomeAssistantDeviceLanguageSetupViewController_hu_preloadContent__block_invoke_47;
    v99[3] = &unk_1E6F4E4F0;
    v99[4] = buf;
    v50 = (id)objc_msgSend(v49, "addCompletionBlock:", v99);

    HULocalizedModelString(CFSTR("HULanguageCanRecognizeMultipleVoices_FinePrint"));
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "stringByAppendingString:", CFSTR(" "));
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "stringByAppendingString:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40));
    v53 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "buttonTray");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "addCaptionText:", v53);

    _Block_object_dispose(buf, 8);
    goto LABEL_21;
  }
  objc_msgSend(*(id *)(a1 + 32), "home");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = objc_msgSend(v55, "hf_numberOfHomePods");

  if (v56 <= 1)
    v57 = CFSTR("HULanguageNeedsSettingsSync_Detail_Single");
  else
    v57 = CFSTR("HULanguageNeedsSettingsSync_Detail_Multiple");
  HFLogForCategory();
  v58 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
  {
    v59 = *(_QWORD *)(a1 + 32);
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v59;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v60;
    _os_log_impl(&dword_1B8E1E000, v58, OS_LOG_TYPE_DEFAULT, "%@:%@: No HomePods have language settings yet, skipping Voice ID onboarding...", buf, 0x16u);

  }
  _HULocalizedStringWithDefaultValue(CFSTR("HULanguageNeedsSettingsSync_Title"), CFSTR("HULanguageNeedsSettingsSync_Title"), 1);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = *(void **)(a1 + 32);
  v62 = (id *)(a1 + 32);
  objc_msgSend(v63, "setTitleString:", v61);

  _HULocalizedStringWithDefaultValue(v57, v57, 1);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*v62, "setDetailsString:", v64);

  _HULocalizedStringWithDefaultValue(CFSTR("HULanguageNeedsSettingsSync_ContinueButton"), CFSTR("HULanguageNeedsSettingsSync_ContinueButton"), 1);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*v62, "setContinueButtonString:", v65);

  objc_msgSend(*v62, "setContinueSelector:", sel__cancelLanguageSetup);
  v66 = (void *)MEMORY[0x1E0D519C0];
  objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:", 49);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "futureWithError:", v7);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_34:

  return v27;
}

void __69__HUHomeAssistantDeviceLanguageSetupViewController_hu_preloadContent__block_invoke_47(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;

  v5 = a2;
  if (!a3)
  {
    v17 = v5;
    objc_msgSend(v5, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = v17;
    if (v6)
    {
      objc_msgSend(v17, "name");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      HULocalizedStringWithFormat(CFSTR("HULanguageCanRecognizeMultipleVoicesAirplay"), CFSTR("%@"), v8, v9, v10, v11, v12, v13, (uint64_t)v7);
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v16 = *(void **)(v15 + 40);
      *(_QWORD *)(v15 + 40) = v14;

      v5 = v17;
    }
  }

}

- (BOOL)needsToWaitForPreload
{
  void *v2;
  char v3;

  -[HUHomeAssistantDeviceLanguageSetupViewController home](self, "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hf_hasRMVCapableAppleTV");

  return (v3 & 1) != 0
      || (objc_msgSend(MEMORY[0x1E0D319D0], "isAMac") & 1) == 0
      && (objc_msgSend(MEMORY[0x1E0D319D0], "isAVisionPro") & 1) == 0;
}

- (void)_cancelLanguageSetup
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  _BOOL4 v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  _BOOL4 v19;
  void *v20;
  char v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  _BOOL4 v28;
  void *v29;
  _BOOL4 v30;
  void *v31;
  uint8_t buf[4];
  HUHomeAssistantDeviceLanguageSetupViewController *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  _BOOL4 v37;
  __int16 v38;
  _BOOL4 v39;
  __int16 v40;
  int v41;
  __int16 v42;
  uint64_t v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v33 = self;
    v34 = 2112;
    v35 = v5;
    _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "%@:%@ User tapped button", buf, 0x16u);

  }
  if (!-[HUHomeAssistantDeviceLanguageSetupViewController maxNumberOfVoicesReached](self, "maxNumberOfVoicesReached")
    && (objc_msgSend(MEMORY[0x1E0D319D0], "isAMac") & 1) == 0
    && (objc_msgSend(MEMORY[0x1E0D319D0], "isAVisionPro") & 1) == 0)
  {
    -[HUHomeAssistantDeviceLanguageSetupViewController home](self, "home");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUHomeAssistantDeviceLanguageSetupViewController supportedVoiceRecognitionLanguages](self, "supportedVoiceRecognitionLanguages");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = +[HUHomeFeatureOnboardingUtilities home:hasSomeHomePodsOnSupportedVoiceRecognitionLanguages:](HUHomeFeatureOnboardingUtilities, "home:hasSomeHomePodsOnSupportedVoiceRecognitionLanguages:", v6, v7);

    if (v8)
    {
      -[HUHomeAssistantDeviceLanguageSetupViewController home](self, "home");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "hf_currentUserIsAdministrator"))
      {

LABEL_10:
        -[HUHomeAssistantDeviceLanguageSetupViewController prEditorItemManager](self, "prEditorItemManager");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "prDevicesModule");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "personalRequestsDevices");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "count") != 0;

        goto LABEL_12;
      }
      -[HUHomeAssistantDeviceLanguageSetupViewController home](self, "home");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "hf_currentUserIsOwner");

      if (v11)
        goto LABEL_10;
    }
  }
  v15 = 0;
LABEL_12:
  HFLogForCategory();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v30 = v15;
    NSStringFromSelector(a2);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = -[HUHomeAssistantDeviceLanguageSetupViewController maxNumberOfVoicesReached](self, "maxNumberOfVoicesReached");
    -[HUHomeAssistantDeviceLanguageSetupViewController home](self, "home");
    v17 = objc_claimAutoreleasedReturnValue();
    -[HUHomeAssistantDeviceLanguageSetupViewController supportedVoiceRecognitionLanguages](self, "supportedVoiceRecognitionLanguages");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (void *)v17;
    v19 = +[HUHomeFeatureOnboardingUtilities home:hasSomeHomePodsOnSupportedVoiceRecognitionLanguages:](HUHomeFeatureOnboardingUtilities, "home:hasSomeHomePodsOnSupportedVoiceRecognitionLanguages:", v17, v18);
    -[HUHomeAssistantDeviceLanguageSetupViewController home](self, "home");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "hf_currentUserIsAdministrator");
    if ((v21 & 1) != 0)
    {
      v22 = 1;
    }
    else
    {
      -[HUHomeAssistantDeviceLanguageSetupViewController home](self, "home");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v27, "hf_currentUserIsOwner");
    }
    -[HUHomeAssistantDeviceLanguageSetupViewController prEditorItemManager](self, "prEditorItemManager");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "prDevicesModule");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "personalRequestsDevices");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "count");
    *(_DWORD *)buf = 138413570;
    v33 = self;
    v34 = 2112;
    v35 = v31;
    v36 = 1024;
    v37 = v28;
    v38 = 1024;
    v39 = v19;
    v40 = 1024;
    v41 = v22;
    v42 = 2048;
    v43 = v26;
    _os_log_impl(&dword_1B8E1E000, v16, OS_LOG_TYPE_DEFAULT, "%@:%@: maxNumberOfVoicesReached = %{BOOL}d home:hasSomeHomePodsOnSupportedVoiceRecognitionLanguages = %{BOOL}d currentUserIsAdministrator/Owner = %{BOOL}d personalRequestsDevices = %lu", buf, 0x32u);

    if ((v21 & 1) == 0)
    v15 = v30;
  }

  if (v15)
    +[HUHomeFeatureOnboardingUtilities presentAlertConfirmingTurningOffPersonalRequestsFrom:](HUHomeFeatureOnboardingUtilities, "presentAlertConfirmingTurningOffPersonalRequestsFrom:", self);
  else
    -[HUHomeAssistantDeviceLanguageSetupViewController _cancelLanguageSetupWithoutWarningUser](self, "_cancelLanguageSetupWithoutWarningUser");
}

- (void)_cancelLanguageSetupWithoutWarningUser
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  NSObject *v12;
  void *v13;
  const char *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  uint8_t buf[4];
  HUHomeAssistantDeviceLanguageSetupViewController *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
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
    _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "%@:%@ Cancelling (really)", buf, 0x16u);

  }
  v6 = (void *)MEMORY[0x1E0C99E08];
  v16 = CFSTR("HULanguageOnboardingKey_SetupLanguage_AssistantDevice_UserInput");
  v17 = &unk_1E70405D0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dictionaryWithDictionary:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUHomeAssistantDeviceLanguageSetupViewController home](self, "home");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "hf_currentUserIsOwner");

  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HUHomeAssistantDeviceLanguageSetupViewController shouldSetMultiUserIsEnabled](self, "shouldSetMultiUserIsEnabled"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v11, CFSTR("HUMultiUserKey_SetIsEnabled"));

    HFLogForCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v19 = self;
      v20 = 2112;
      v21 = v13;
      v14 = "%@:%@: Turning ON MU Setting since the current user is the Home owner";
LABEL_8:
      _os_log_impl(&dword_1B8E1E000, v12, OS_LOG_TYPE_DEFAULT, v14, buf, 0x16u);

    }
  }
  else
  {
    HFLogForCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v19 = self;
      v20 = 2112;
      v21 = v13;
      v14 = "%@:%@: NOT Turning ON MU Setting since the current user is NOT the Home owner";
      goto LABEL_8;
    }
  }

  -[HUHomeAssistantDeviceLanguageSetupViewController delegate](self, "delegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "viewController:didFinishWithConfigurationResults:", self, v8);

}

- (void)_checkForiCloudSiriEnabledAndCompleteSetup
{
  void *v4;
  uint64_t v5;
  id v6;
  id v7;
  _QWORD v8[6];
  _QWORD v9[5];

  +[HUHomeFeatureOnboardingUtilities checkSiriForiCloudEnabledPromptingUser:](HUHomeFeatureOnboardingUtilities, "checkSiriForiCloudEnabledPromptingUser:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __94__HUHomeAssistantDeviceLanguageSetupViewController__checkForiCloudSiriEnabledAndCompleteSetup__block_invoke;
  v9[3] = &unk_1E6F4E540;
  v9[4] = self;
  v6 = (id)objc_msgSend(v4, "addSuccessBlock:", v9);
  v8[0] = v5;
  v8[1] = 3221225472;
  v8[2] = __94__HUHomeAssistantDeviceLanguageSetupViewController__checkForiCloudSiriEnabledAndCompleteSetup__block_invoke_2;
  v8[3] = &unk_1E6F4E568;
  v8[4] = self;
  v8[5] = a2;
  v7 = (id)objc_msgSend(v4, "addFailureBlock:", v8);

}

uint64_t __94__HUHomeAssistantDeviceLanguageSetupViewController__checkForiCloudSiriEnabledAndCompleteSetup__block_invoke(uint64_t a1, void *a2)
{
  int v3;
  void *v4;

  v3 = objc_msgSend(a2, "BOOLValue");
  v4 = *(void **)(a1 + 32);
  if (v3)
    return objc_msgSend(v4, "_completeLanguageSetup");
  else
    return objc_msgSend(v4, "_cancelLanguageSetupWithoutWarningUser");
}

void __94__HUHomeAssistantDeviceLanguageSetupViewController__checkForiCloudSiriEnabledAndCompleteSetup__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    HFLogForCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 32);
      NSStringFromSelector(*(SEL *)(a1 + 40));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138412802;
      v9 = v5;
      v10 = 2112;
      v11 = v6;
      v12 = 2112;
      v13 = v3;
      _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "%@:%@: There was an error enabling iCloud for Siri: %@", (uint8_t *)&v8, 0x20u);

    }
    objc_msgSend(MEMORY[0x1E0D313A0], "sharedHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleError:", v3);

  }
}

- (void)_completeLanguageSetup
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  NSObject *v12;
  void *v13;
  const char *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  uint8_t buf[4];
  HUHomeAssistantDeviceLanguageSetupViewController *v21;
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
    v21 = self;
    v22 = 2112;
    v23 = v5;
    _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "%@:%@ User tapped button", buf, 0x16u);

  }
  v6 = (void *)MEMORY[0x1E0C99E08];
  v18 = CFSTR("HULanguageOnboardingKey_SetupLanguage_AssistantDevice_UserInput");
  v19 = &unk_1E70405E8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dictionaryWithDictionary:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUHomeAssistantDeviceLanguageSetupViewController home](self, "home");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "hf_currentUserIsOwner");

  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HUHomeAssistantDeviceLanguageSetupViewController shouldSetMultiUserIsEnabled](self, "shouldSetMultiUserIsEnabled"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v11, CFSTR("HUMultiUserKey_SetIsEnabled"));

    HFLogForCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      goto LABEL_9;
    NSStringFromSelector(a2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v21 = self;
    v22 = 2112;
    v23 = v13;
    v14 = "%@:%@: Turning ON MU Setting since the current user is the Home owner";
  }
  else
  {
    HFLogForCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      goto LABEL_9;
    NSStringFromSelector(a2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v21 = self;
    v22 = 2112;
    v23 = v13;
    v14 = "%@:%@: NOT Turning ON MU Setting since the current user is NOT the Home owner";
  }
  _os_log_impl(&dword_1B8E1E000, v12, OS_LOG_TYPE_DEFAULT, v14, buf, 0x16u);

LABEL_9:
  HFLogForCategory();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v21 = self;
    v22 = 2112;
    v23 = v16;
    _os_log_impl(&dword_1B8E1E000, v15, OS_LOG_TYPE_DEFAULT, "%@:%@: Now finishing HomePod language mismatch onboarding flow", buf, 0x16u);

  }
  -[HUHomeAssistantDeviceLanguageSetupViewController delegate](self, "delegate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "viewController:didFinishWithConfigurationResults:", self, v8);

}

- (void)_changeLanguage
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  const char *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  HUHomeAssistantDeviceLanguageSetupViewController *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 138412546;
    v21 = self;
    v22 = 2112;
    v23 = v5;
    _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "%@:%@ User tapped button", (uint8_t *)&v20, 0x16u);

  }
  v6 = (void *)objc_opt_new();
  objc_msgSend(v6, "setObject:forKey:", &unk_1E7040600, CFSTR("HULanguageOnboardingKey_SetupLanguage_AssistantDevice_UserInput"));
  -[HUHomeAssistantDeviceLanguageSetupViewController supportedVoiceRecognitionLanguages](self, "supportedVoiceRecognitionLanguages");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v6, "setObject:forKey:", v8, CFSTR("HULanguageOnboardingKey_SupportedLanguageInfo"));

  -[HUHomeAssistantDeviceLanguageSetupViewController home](self, "home");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v8) = objc_msgSend(v9, "hf_currentUserIsOwner");

  if ((_DWORD)v8)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HUHomeAssistantDeviceLanguageSetupViewController shouldSetMultiUserIsEnabled](self, "shouldSetMultiUserIsEnabled"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, CFSTR("HUMultiUserKey_SetIsEnabled"));

    HFLogForCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      goto LABEL_9;
    NSStringFromSelector(a2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 138412546;
    v21 = self;
    v22 = 2112;
    v23 = v12;
    v13 = "%@:%@: Turning ON MU Setting since the current user is the Home owner";
  }
  else
  {
    HFLogForCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      goto LABEL_9;
    NSStringFromSelector(a2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 138412546;
    v21 = self;
    v22 = 2112;
    v23 = v12;
    v13 = "%@:%@: NOT Turning ON MU Setting since the current user is NOT the Home owner";
  }
  _os_log_impl(&dword_1B8E1E000, v11, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v20, 0x16u);

LABEL_9:
  -[HUHomeAssistantDeviceLanguageSetupViewController homeAssistantDevicesHavingLanguageMismatch](self, "homeAssistantDevicesHavingLanguageMismatch");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[HUHomeAssistantDeviceLanguageSetupViewController homeAssistantDevicesHavingLanguageMismatch](self, "homeAssistantDevicesHavingLanguageMismatch");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", v15, CFSTR("HULanguageOnboardingKey_LanguageMismatchedHomeAssistantDevices"));

  }
  HFLogForCategory();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 138412802;
    v21 = self;
    v22 = 2112;
    v23 = v17;
    v24 = 2112;
    v25 = v6;
    _os_log_impl(&dword_1B8E1E000, v16, OS_LOG_TYPE_DEFAULT, "%@:%@: Now transitioning to Language configuration for HomePod with results [%@]", (uint8_t *)&v20, 0x20u);

  }
  -[HUHomeAssistantDeviceLanguageSetupViewController delegate](self, "delegate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v6, "copy");
  objc_msgSend(v18, "viewController:didFinishWithConfigurationResults:", self, v19);

}

- (void)_setupPersonalRequestsItemInfrastructure
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  HUPersonalRequestsEditorItemManager *v8;
  void *v9;
  id v10;
  id v11;

  v4 = objc_alloc(MEMORY[0x1E0D31988]);
  -[HUHomeAssistantDeviceLanguageSetupViewController home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUHomeAssistantDeviceLanguageSetupViewController home](self, "home");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "currentUser");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v4, "initWithHome:user:nameStyle:", v5, v7, 0);

  v8 = -[HUPersonalRequestsEditorItemManager initWithDelegate:userItem:onlyShowDeviceSwitches:]([HUPersonalRequestsEditorItemManager alloc], "initWithDelegate:userItem:onlyShowDeviceSwitches:", 0, v11, 1);
  -[HUHomeAssistantDeviceLanguageSetupViewController setPrEditorItemManager:](self, "setPrEditorItemManager:", v8);

  -[HUHomeAssistantDeviceLanguageSetupViewController prEditorItemManager](self, "prEditorItemManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v9, "reloadAndUpdateAllItemsFromSenderSelector:", a2);

}

- (void)userTappedContinueFromWarning
{
  NSObject *v4;
  void *v5;
  int v6;
  HUHomeAssistantDeviceLanguageSetupViewController *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412546;
    v7 = self;
    v8 = 2112;
    v9 = v5;
    _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "%@:%@ User tapped button", (uint8_t *)&v6, 0x16u);

  }
  -[HUHomeAssistantDeviceLanguageSetupViewController _turnOffPersonalRequests](self, "_turnOffPersonalRequests");
  -[HUHomeAssistantDeviceLanguageSetupViewController _cancelLanguageSetupWithoutWarningUser](self, "_cancelLanguageSetupWithoutWarningUser");
}

- (void)userTappedCancelFromWarning
{
  NSObject *v4;
  void *v5;
  int v6;
  HUHomeAssistantDeviceLanguageSetupViewController *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412546;
    v7 = self;
    v8 = 2112;
    v9 = v5;
    _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "%@:%@ User tapped button", (uint8_t *)&v6, 0x16u);

  }
}

- (void)_turnOffPersonalRequests
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412290;
    v9 = v5;
    _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "%@: Turning off all Personal Requests devices", (uint8_t *)&v8, 0xCu);

  }
  -[HUHomeAssistantDeviceLanguageSetupViewController prEditorItemManager](self, "prEditorItemManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "prDevicesModule");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPersonalRequestsDevices:", MEMORY[0x1E0C9AA60]);

}

- (void)viewDidLoad
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  objc_super v32;
  uint8_t buf[4];
  HUHomeAssistantDeviceLanguageSetupViewController *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v32.receiver = self;
  v32.super_class = (Class)HUHomeAssistantDeviceLanguageSetupViewController;
  -[HUImageOBWelcomeController viewDidLoad](&v32, sel_viewDidLoad);
  -[HUHomeAssistantDeviceLanguageSetupViewController setModalInPresentation:](self, "setModalInPresentation:", 1);
  -[HUHomeAssistantDeviceLanguageSetupViewController headerView](self, "headerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUHomeAssistantDeviceLanguageSetupViewController titleString](self, "titleString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTitle:", v5);

  -[HUHomeAssistantDeviceLanguageSetupViewController headerView](self, "headerView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUHomeAssistantDeviceLanguageSetupViewController detailsString](self, "detailsString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDetailText:", v7);

  -[HUHomeAssistantDeviceLanguageSetupViewController headerView](self, "headerView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "subviews");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[HUAccessibilityIdentifierUtilities setAccessibilityIDForViews:withIDDictionary:](HUAccessibilityIdentifierUtilities, "setAccessibilityIDForViews:withIDDictionary:", v9, &unk_1E7042E38);

  -[HUHomeAssistantDeviceLanguageSetupViewController continueButtonString](self, "continueButtonString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "length");

  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0D65140], "boldButton");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUHomeAssistantDeviceLanguageSetupViewController setContinueButton:](self, "setContinueButton:", v12);

    -[HUHomeAssistantDeviceLanguageSetupViewController continueButton](self, "continueButton");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUHomeAssistantDeviceLanguageSetupViewController continueButtonString](self, "continueButtonString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setTitle:forState:", v14, 0);

    -[HUHomeAssistantDeviceLanguageSetupViewController continueButton](self, "continueButton");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setAccessibilityIdentifier:", CFSTR("Home.OnboardingView.LanguageSetUp.ContinueButton"));

    -[HUHomeAssistantDeviceLanguageSetupViewController continueButton](self, "continueButton");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[HUHomeAssistantDeviceLanguageSetupViewController continueButton](self, "continueButton");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addTarget:action:forControlEvents:", self, -[HUHomeAssistantDeviceLanguageSetupViewController continueSelector](self, "continueSelector"), 64);

    -[HUHomeAssistantDeviceLanguageSetupViewController buttonTray](self, "buttonTray");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUHomeAssistantDeviceLanguageSetupViewController continueButton](self, "continueButton");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addButton:", v19);

  }
  -[HUHomeAssistantDeviceLanguageSetupViewController customizeButtonString](self, "customizeButtonString");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "length");

  if (v21)
  {
    objc_msgSend(MEMORY[0x1E0D65170], "linkButton");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUHomeAssistantDeviceLanguageSetupViewController setCustomizeButton:](self, "setCustomizeButton:", v22);

    -[HUHomeAssistantDeviceLanguageSetupViewController customizeButton](self, "customizeButton");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUHomeAssistantDeviceLanguageSetupViewController customizeButtonString](self, "customizeButtonString");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setTitle:forState:", v24, 0);

    -[HUHomeAssistantDeviceLanguageSetupViewController customizeButton](self, "customizeButton");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setAccessibilityIdentifier:", CFSTR("Home.OnboardingView.LanguageSetUp.CustomizeButton"));

    -[HUHomeAssistantDeviceLanguageSetupViewController customizeButton](self, "customizeButton");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[HUHomeAssistantDeviceLanguageSetupViewController customizeButton](self, "customizeButton");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addTarget:action:forControlEvents:", self, -[HUHomeAssistantDeviceLanguageSetupViewController customizeSelector](self, "customizeSelector"), 64);

    -[HUHomeAssistantDeviceLanguageSetupViewController buttonTray](self, "buttonTray");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUHomeAssistantDeviceLanguageSetupViewController customizeButton](self, "customizeButton");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "addButton:", v29);

  }
  HFLogForCategory();
  v30 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v34 = self;
    v35 = 2112;
    v36 = v31;
    _os_log_impl(&dword_1B8E1E000, v30, OS_LOG_TYPE_DEFAULT, "%@:%@: presented: HADLSVC", buf, 0x16u);

  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  objc_super v8;
  uint8_t buf[4];
  HUHomeAssistantDeviceLanguageSetupViewController *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)HUHomeAssistantDeviceLanguageSetupViewController;
  -[HUHomeAssistantDeviceLanguageSetupViewController viewWillDisappear:](&v8, sel_viewWillDisappear_, a3);
  if (-[HUHomeAssistantDeviceLanguageSetupViewController isMovingFromParentViewController](self, "isMovingFromParentViewController"))
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
    -[HUHomeAssistantDeviceLanguageSetupViewController delegate](self, "delegate");
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

- (HUPersonalRequestsEditorItemManager)prEditorItemManager
{
  return self->_prEditorItemManager;
}

- (void)setPrEditorItemManager:(id)a3
{
  objc_storeStrong((id *)&self->_prEditorItemManager, a3);
}

- (NSArray)supportedVoiceRecognitionLanguages
{
  return self->_supportedVoiceRecognitionLanguages;
}

- (void)setSupportedVoiceRecognitionLanguages:(id)a3
{
  objc_storeStrong((id *)&self->_supportedVoiceRecognitionLanguages, a3);
}

- (NSArray)homeAssistantDevicesHavingLanguageMismatch
{
  return self->_homeAssistantDevicesHavingLanguageMismatch;
}

- (void)setHomeAssistantDevicesHavingLanguageMismatch:(id)a3
{
  objc_storeStrong((id *)&self->_homeAssistantDevicesHavingLanguageMismatch, a3);
}

- (HMHome)home
{
  return self->_home;
}

- (void)setHome:(id)a3
{
  objc_storeStrong((id *)&self->_home, a3);
}

- (BOOL)maxNumberOfVoicesReached
{
  return self->_maxNumberOfVoicesReached;
}

- (void)setMaxNumberOfVoicesReached:(BOOL)a3
{
  self->_maxNumberOfVoicesReached = a3;
}

- (BOOL)shouldSetMultiUserIsEnabled
{
  return self->_shouldSetMultiUserIsEnabled;
}

- (void)setShouldSetMultiUserIsEnabled:(BOOL)a3
{
  self->_shouldSetMultiUserIsEnabled = a3;
}

- (NSString)titleString
{
  return self->_titleString;
}

- (void)setTitleString:(id)a3
{
  self->_titleString = (NSString *)a3;
}

- (NSString)detailsString
{
  return self->_detailsString;
}

- (void)setDetailsString:(id)a3
{
  self->_detailsString = (NSString *)a3;
}

- (NSString)continueButtonString
{
  return self->_continueButtonString;
}

- (void)setContinueButtonString:(id)a3
{
  self->_continueButtonString = (NSString *)a3;
}

- (SEL)continueSelector
{
  return self->_continueSelector;
}

- (void)setContinueSelector:(SEL)a3
{
  self->_continueSelector = a3;
}

- (NSString)customizeButtonString
{
  return self->_customizeButtonString;
}

- (void)setCustomizeButtonString:(id)a3
{
  self->_customizeButtonString = (NSString *)a3;
}

- (SEL)customizeSelector
{
  return self->_customizeSelector;
}

- (void)setCustomizeSelector:(SEL)a3
{
  self->_customizeSelector = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_homeAssistantDevicesHavingLanguageMismatch, 0);
  objc_storeStrong((id *)&self->_supportedVoiceRecognitionLanguages, 0);
  objc_storeStrong((id *)&self->_prEditorItemManager, 0);
  objc_storeStrong((id *)&self->_customizeButton, 0);
  objc_storeStrong((id *)&self->_continueButton, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
