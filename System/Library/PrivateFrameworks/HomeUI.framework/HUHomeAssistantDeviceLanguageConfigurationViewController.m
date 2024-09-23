@implementation HUHomeAssistantDeviceLanguageConfigurationViewController

- (HUHomeAssistantDeviceLanguageConfigurationViewController)initWithSupportedVoiceRecognitionLanguages:(id)a3 languageMismatchedHomeAssistantDevices:(id)a4
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  HUHomeAssistantDeviceLanguageConfigurationViewController *v12;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  objc_super v18;

  v8 = a3;
  v9 = a4;
  if (!objc_msgSend(v8, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUHomeAssistantDeviceLanguageConfigurationViewController.m"), 47, CFSTR("%@:%@ Should NOT be called with no supported languages"), self, v15);

  }
  if (!objc_msgSend(v9, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUHomeAssistantDeviceLanguageConfigurationViewController.m"), 48, CFSTR("%@:%@ Should NOT be called with no HomePods in a mismatched state"), self, v17);

  }
  _HULocalizedStringWithDefaultValue(CFSTR("HULanguageChooseSiriLanguage_Title"), CFSTR("HULanguageChooseSiriLanguage_Title"), 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  _HULocalizedStringWithDefaultValue(CFSTR("HULanguageChooseSiriLanguage_Detail"), CFSTR("HULanguageChooseSiriLanguage_Detail"), 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v18.receiver = self;
  v18.super_class = (Class)HUHomeAssistantDeviceLanguageConfigurationViewController;
  v12 = -[OBTableWelcomeController initWithTitle:detailText:icon:](&v18, sel_initWithTitle_detailText_icon_, v10, v11, 0);

  if (v12)
  {
    objc_storeStrong((id *)&v12->_supportedVoiceRecognitionLanguages, a3);
    objc_storeStrong((id *)&v12->_languageMismatchedHomeAssistantDevices, a4);
    v12->_selectedLanguageIndex = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v12;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[HUHomeAssistantDeviceLanguageConfigurationViewController changeLanguageTimer](self, "changeLanguageTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  v4.receiver = self;
  v4.super_class = (Class)HUHomeAssistantDeviceLanguageConfigurationViewController;
  -[HUHomeAssistantDeviceLanguageConfigurationViewController dealloc](&v4, sel_dealloc);
}

- (void)_changeLanguage
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  __int128 v10;
  uint64_t i;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  NSObject *v23;
  HUHomeAssistantDeviceLanguageConfigurationViewController *v24;
  int v25;
  void *v26;
  HUHomeAssistantDeviceLanguageConfigurationViewController *v27;
  void *v28;
  int v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  id v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  id v45;
  void *v46;
  void *v47;
  __int128 v48;
  uint64_t v49;
  void *v50;
  id obj;
  uint64_t v54;
  uint64_t v55;
  _QWORD v56[4];
  id v57;
  _QWORD v58[4];
  id v59;
  id v60[3];
  _QWORD v61[4];
  id v62;
  SEL v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  uint8_t v68[128];
  uint8_t buf[4];
  HUHomeAssistantDeviceLanguageConfigurationViewController *v70;
  __int16 v71;
  _BYTE v72[18];
  __int16 v73;
  uint64_t v74;
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v70 = self;
    v71 = 2112;
    *(_QWORD *)v72 = v3;
    _os_log_impl(&dword_1B8E1E000, v2, OS_LOG_TYPE_DEFAULT, "%@:%@ User tapped button", buf, 0x16u);

  }
  -[HUHomeAssistantDeviceLanguageConfigurationViewController languageMismatchedHomeAssistantDevices](self, "languageMismatchedHomeAssistantDevices");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUHomeAssistantDeviceLanguageConfigurationViewController supportedVoiceRecognitionLanguages](self, "supportedVoiceRecognitionLanguages");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", -[HUHomeAssistantDeviceLanguageConfigurationViewController selectedLanguageIndex](self, "selectedLanguageIndex"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUHomeAssistantDeviceLanguageConfigurationViewController _showSpinner](self, "_showSpinner");
  HFLogForCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v4, "count");
    *(_DWORD *)buf = 138413058;
    v70 = self;
    v71 = 2112;
    *(_QWORD *)v72 = v8;
    *(_WORD *)&v72[8] = 2112;
    *(_QWORD *)&v72[10] = v6;
    v73 = 2048;
    v74 = v9;
    _os_log_impl(&dword_1B8E1E000, v7, OS_LOG_TYPE_DEFAULT, "%@:%@: Must change Siri language to [%@] for %lu HomePods", buf, 0x2Au);

  }
  v66 = 0u;
  v67 = 0u;
  v64 = 0u;
  v65 = 0u;
  obj = v4;
  v55 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v68, 16);
  if (v55)
  {
    v54 = *(_QWORD *)v65;
    v49 = *MEMORY[0x1E0D30140];
    *(_QWORD *)&v10 = 138412546;
    v48 = v10;
    do
    {
      for (i = 0; i != v55; ++i)
      {
        if (*(_QWORD *)v65 != v54)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * i);
        objc_opt_class();
        v13 = v12;
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v14 = v13;
        else
          v14 = 0;
        v15 = v14;

        objc_msgSend(MEMORY[0x1E0CFEAC0], "voiceInfoForSessionLanguageCode:", v6);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        HFLogForCategory();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = v17;
        if (v16)
        {
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            NSStringFromSelector(a2);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138413058;
            v70 = self;
            v71 = 2112;
            *(_QWORD *)v72 = v19;
            *(_WORD *)&v72[8] = 2112;
            *(_QWORD *)&v72[10] = v6;
            v73 = 2112;
            v74 = (uint64_t)v15;
            _os_log_impl(&dword_1B8E1E000, v18, OS_LOG_TYPE_DEFAULT, "%@:%@: Changing Siri language to [%@] for [%@]", buf, 0x2Au);

          }
          v18 = objc_msgSend(objc_alloc(MEMORY[0x1E0D31818]), "initWithRecognitionLanguage:outputVoice:defaultVoiceForRecognitionLanguage:", v6, v16, 1);
          if (v18 && objc_msgSend(v15, "hf_isReachable"))
          {
            objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "homeManager");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = objc_msgSend(v21, "hasOptedToHH2");

            if (v22
              || (objc_msgSend(v15, "accessory"),
                  v28 = (void *)objc_claimAutoreleasedReturnValue(),
                  v29 = objc_msgSend(v28, "hf_isSiriEndpoint"),
                  v28,
                  v29))
            {
              objc_msgSend(v15, "hf_siriLanguageOptionsManager");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v30, "updateSelectedLanguageOption:", v18);
              v23 = objc_claimAutoreleasedReturnValue();
            }
            else
            {
              objc_msgSend(v15, "hf_home");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "hf_backingAccessory");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v31, "hf_mediaSystemForAccessory:", v32);
              v30 = (void *)objc_claimAutoreleasedReturnValue();

              if (v30)
                objc_msgSend(v30, "hf_settingsAdapterManager");
              else
                objc_msgSend(v15, "hf_settingsAdapterManager");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v33, "adapterForIdentifier:", v49, v48);
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              v35 = v34;
              if ((objc_opt_isKindOfClass() & 1) != 0)
                v36 = v35;
              else
                v36 = 0;
              v37 = v36;

              objc_msgSend(v37, "updateSelectedLanguageOption:", v18);
              v23 = objc_claimAutoreleasedReturnValue();

            }
            v61[0] = MEMORY[0x1E0C809B0];
            v61[1] = 3221225472;
            v61[2] = __75__HUHomeAssistantDeviceLanguageConfigurationViewController__changeLanguage__block_invoke;
            v61[3] = &unk_1E6F4E568;
            v63 = a2;
            v62 = v15;
            v38 = (id)-[NSObject addFailureBlock:](v23, "addFailureBlock:", v61);
            objc_msgSend(v50, "na_safeAddObject:", v23);

          }
          else
          {
            HFLogForCategory();
            v23 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            {
              NSStringFromSelector(a2);
              v24 = (HUHomeAssistantDeviceLanguageConfigurationViewController *)objc_claimAutoreleasedReturnValue();
              v25 = objc_msgSend(v15, "hf_isReachable");
              objc_msgSend(v15, "hf_displayName");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412802;
              v70 = v24;
              v71 = 1024;
              *(_DWORD *)v72 = v25;
              *(_WORD *)&v72[4] = 2112;
              *(_QWORD *)&v72[6] = v26;
              _os_log_error_impl(&dword_1B8E1E000, v23, OS_LOG_TYPE_ERROR, "%@ Controller is reachable? %{BOOL}d. Language change failed for [%@]", buf, 0x1Cu);

            }
          }

        }
        else if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(a2);
          v27 = (HUHomeAssistantDeviceLanguageConfigurationViewController *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = v48;
          v70 = v27;
          v71 = 2112;
          *(_QWORD *)v72 = v6;
          _os_log_error_impl(&dword_1B8E1E000, v18, OS_LOG_TYPE_ERROR, "%@ AFVoiceInfo voiceInfoForSessionLanguageCode could not find voice info for %@ - this should NOT happen.", buf, 0x16u);

        }
      }
      v55 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v68, 16);
    }
    while (v55);
  }

  objc_msgSend(MEMORY[0x1E0D519C0], "chainFutures:", v50);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D519E8], "mainThreadScheduler");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "reschedule:", v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUHomeAssistantDeviceLanguageConfigurationViewController setChangeLanguageFuture:](self, "setChangeLanguageFuture:", v41);

  v42 = (void *)objc_msgSend(v50, "count");
  objc_initWeak((id *)buf, self);
  -[HUHomeAssistantDeviceLanguageConfigurationViewController changeLanguageFuture](self, "changeLanguageFuture");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v58[0] = MEMORY[0x1E0C809B0];
  v58[1] = 3221225472;
  v58[2] = __75__HUHomeAssistantDeviceLanguageConfigurationViewController__changeLanguage__block_invoke_20;
  v58[3] = &unk_1E6F52780;
  objc_copyWeak(v60, (id *)buf);
  v60[1] = (id)a2;
  v44 = v6;
  v59 = v44;
  v60[2] = v42;
  v45 = (id)objc_msgSend(v43, "addCompletionBlock:", v58);

  v46 = (void *)MEMORY[0x1E0C99E88];
  v56[0] = MEMORY[0x1E0C809B0];
  v56[1] = 3221225472;
  v56[2] = __75__HUHomeAssistantDeviceLanguageConfigurationViewController__changeLanguage__block_invoke_25;
  v56[3] = &unk_1E6F53298;
  objc_copyWeak(&v57, (id *)buf);
  objc_msgSend(v46, "scheduledTimerWithTimeInterval:repeats:block:", 0, v56, 240.0);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUHomeAssistantDeviceLanguageConfigurationViewController setChangeLanguageTimer:](self, "setChangeLanguageTimer:", v47);

  objc_destroyWeak(&v57);
  objc_destroyWeak(v60);
  objc_destroyWeak((id *)buf);

}

void __75__HUHomeAssistantDeviceLanguageConfigurationViewController__changeLanguage__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "hf_displayName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412546;
    v6 = v3;
    v7 = 2112;
    v8 = v4;
    _os_log_error_impl(&dword_1B8E1E000, v2, OS_LOG_TYPE_ERROR, "%@ Language change failed for %@", (uint8_t *)&v5, 0x16u);

  }
}

void __75__HUHomeAssistantDeviceLanguageConfigurationViewController__changeLanguage__block_invoke_20(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id WeakRetained;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[2];
  _QWORD v18[2];
  uint8_t buf[4];
  id v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_hideSpinner");
  HFLogForCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(_QWORD *)(a1 + 56);
    *(_DWORD *)buf = 138413058;
    v20 = WeakRetained;
    v21 = 2112;
    v22 = v7;
    v23 = 2112;
    v24 = v8;
    v25 = 2048;
    v26 = v9;
    _os_log_impl(&dword_1B8E1E000, v6, OS_LOG_TYPE_DEFAULT, "%@:%@: Finished changing Siri language to [%@] for %lu HomePods", buf, 0x2Au);

  }
  if (v4)
  {
    HFLogForCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(*(SEL *)(a1 + 48));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = *(_QWORD *)(a1 + 32);
      v16 = *(_QWORD *)(a1 + 56);
      *(_DWORD *)buf = 138413314;
      v20 = WeakRetained;
      v21 = 2112;
      v22 = v14;
      v23 = 2112;
      v24 = v15;
      v25 = 2048;
      v26 = v16;
      v27 = 2112;
      v28 = v4;
      _os_log_error_impl(&dword_1B8E1E000, v10, OS_LOG_TYPE_ERROR, "%@:%@: Changing Siri language to [%@] for %lu HomePods, FAILED: %@", buf, 0x34u);

    }
  }
  objc_msgSend(WeakRetained, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = CFSTR("HULanguageOnboardingKey_SetupLanguage_AssistantDevice_UserInput");
  v17[1] = CFSTR("HULanguageOnboardingKey_SetupLanguage_AssistantDevice_IntendedLanguage");
  v12 = *(_QWORD *)(a1 + 32);
  v18[0] = &unk_1E7040CD8;
  v18[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "viewController:didFinishWithConfigurationResults:", WeakRetained, v13);

}

void __75__HUHomeAssistantDeviceLanguageConfigurationViewController__changeLanguage__block_invoke_25(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  char v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint8_t v7[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "changeLanguageFuture");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isFinished");

  if ((v3 & 1) == 0)
  {
    HFLogForCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v7 = 0;
      _os_log_error_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_ERROR, "FAILED to change some HomePod languages due to timeout", v7, 2u);
    }

    objc_msgSend(WeakRetained, "changeLanguageFuture");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "na_timeoutError");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "finishWithError:", v6);

  }
}

- (void)_cancelLanguageChange
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  uint8_t buf[4];
  HUHomeAssistantDeviceLanguageConfigurationViewController *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v11 = self;
    v12 = 2112;
    v13 = v5;
    _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "%@:%@ User tapped button", buf, 0x16u);

  }
  -[HUHomeAssistantDeviceLanguageConfigurationViewController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = CFSTR("HULanguageOnboardingKey_SetupLanguage_AssistantDevice_UserInput");
  v9 = &unk_1E7040CF0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v9, &v8, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "viewController:didFinishWithConfigurationResults:", self, v7);

}

- (void)_hideSpinner
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[HUHomeAssistantDeviceLanguageConfigurationViewController spinner](self, "spinner");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[HUHomeAssistantDeviceLanguageConfigurationViewController spinner](self, "spinner");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeFromSuperview");

    -[HUHomeAssistantDeviceLanguageConfigurationViewController setSpinner:](self, "setSpinner:", 0);
    -[HUHomeAssistantDeviceLanguageConfigurationViewController view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setNeedsLayout");

  }
  -[HUHomeAssistantDeviceLanguageConfigurationViewController changeLanguageButton](self, "changeLanguageButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHidden:", 0);

  -[HUHomeAssistantDeviceLanguageConfigurationViewController cancelButton](self, "cancelButton");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setHidden:", 0);

}

- (void)_showSpinner
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  CGRect v33;

  -[HUHomeAssistantDeviceLanguageConfigurationViewController spinner](self, "spinner");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[HUHomeAssistantDeviceLanguageConfigurationViewController spinner](self, "spinner");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeFromSuperview");

    -[HUHomeAssistantDeviceLanguageConfigurationViewController setSpinner:](self, "setSpinner:", 0);
  }
  -[HUHomeAssistantDeviceLanguageConfigurationViewController changeLanguageButton](self, "changeLanguageButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHidden:", 1);

  -[HUHomeAssistantDeviceLanguageConfigurationViewController cancelButton](self, "cancelButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHidden:", 1);

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA2C8]), "initWithActivityIndicatorStyle:", 100);
  -[HUHomeAssistantDeviceLanguageConfigurationViewController setSpinner:](self, "setSpinner:", v7);

  -[HUHomeAssistantDeviceLanguageConfigurationViewController spinner](self, "spinner");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sizeToFit");

  -[HUHomeAssistantDeviceLanguageConfigurationViewController spinner](self, "spinner");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "startAnimating");

  -[HUHomeAssistantDeviceLanguageConfigurationViewController spinner](self, "spinner");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "frame");
  v12 = v11;
  v14 = v13;

  -[HUHomeAssistantDeviceLanguageConfigurationViewController view](self, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "bounds");
  v17 = v16 * 0.5;
  -[HUHomeAssistantDeviceLanguageConfigurationViewController spinner](self, "spinner");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "bounds");
  v20 = v17 - v19 * 0.5;

  -[HUHomeAssistantDeviceLanguageConfigurationViewController buttonTray](self, "buttonTray");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "frame");
  v23 = v22;
  -[HUHomeAssistantDeviceLanguageConfigurationViewController changeLanguageButton](self, "changeLanguageButton");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "frame");
  v26 = v23 + v25;
  -[HUHomeAssistantDeviceLanguageConfigurationViewController changeLanguageButton](self, "changeLanguageButton");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "frame");
  v28 = v26 + CGRectGetHeight(v33) * 0.5;

  -[HUHomeAssistantDeviceLanguageConfigurationViewController spinner](self, "spinner");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setFrame:", v20, v28, v12, v14);

  -[HUHomeAssistantDeviceLanguageConfigurationViewController view](self, "view");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUHomeAssistantDeviceLanguageConfigurationViewController spinner](self, "spinner");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "addSubview:", v31);

  -[HUHomeAssistantDeviceLanguageConfigurationViewController view](self, "view");
  v32 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setNeedsLayout");

}

- (id)hu_preloadContent
{
  return (id)objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
}

- (void)loadView
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  objc_super v27;

  v27.receiver = self;
  v27.super_class = (Class)HUHomeAssistantDeviceLanguageConfigurationViewController;
  -[OBTableWelcomeController loadView](&v27, sel_loadView);
  v3 = objc_alloc(MEMORY[0x1E0CEAA58]);
  v4 = (void *)objc_msgSend(v3, "initWithFrame:style:", 0, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[OBTableWelcomeController setTableView:](self, "setTableView:", v4);

  -[OBTableWelcomeController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[OBTableWelcomeController tableView](self, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDelegate:", self);

  -[OBTableWelcomeController tableView](self, "tableView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDataSource:", self);

  -[OBTableWelcomeController tableView](self, "tableView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAllowsSelectionDuringEditing:", 1);

  -[OBTableWelcomeController tableView](self, "tableView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAllowsMultipleSelection:", 0);

  v10 = *MEMORY[0x1E0CEBC10];
  -[OBTableWelcomeController tableView](self, "tableView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setRowHeight:", v10);

  -[OBTableWelcomeController tableView](self, "tableView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setAlwaysBounceVertical:", 0);

  -[OBTableWelcomeController tableView](self, "tableView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "heightAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBTableWelcomeController tableView](self, "tableView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "contentSize");
  objc_msgSend(v14, "constraintEqualToConstant:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUHomeAssistantDeviceLanguageConfigurationViewController setHeightAnchor:](self, "setHeightAnchor:", v17);

  -[HUHomeAssistantDeviceLanguageConfigurationViewController heightAnchor](self, "heightAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setActive:", 1);

  -[OBTableWelcomeController tableView](self, "tableView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "separatorInset");
  v21 = v20;
  v23 = v22;
  v25 = v24;

  -[OBTableWelcomeController tableView](self, "tableView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setSeparatorInset:", v21, v23, v25, 28.0);

}

- (void)viewDidLayoutSubviews
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  -[HUHomeAssistantDeviceLanguageConfigurationViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layoutIfNeeded");

  -[OBTableWelcomeController tableView](self, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentSize");
  v6 = v5;
  -[HUHomeAssistantDeviceLanguageConfigurationViewController heightAnchor](self, "heightAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setConstant:", v6);

  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBTableWelcomeController tableView](self, "tableView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setBackgroundColor:", v8);

  v10.receiver = self;
  v10.super_class = (Class)HUHomeAssistantDeviceLanguageConfigurationViewController;
  -[OBTableWelcomeController viewDidLayoutSubviews](&v10, sel_viewDidLayoutSubviews);
}

- (id)_configureTitleDescriptionContentViewForCell:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  HUTitleDescriptionContentView *v10;
  HUTitleDescriptionContentView *v11;
  HUTitleDescriptionContentView *v12;
  HUTitleDescriptionContentView *v13;
  HUTitleDescriptionContentView *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
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

  v4 = a3;
  objc_msgSend(v4, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "subviews");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(v4, "contentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "subviews");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  objc_opt_class();
  v10 = v9;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;
  v12 = v11;

  v13 = v10;
  if (!v12)
  {
    v14 = [HUTitleDescriptionContentView alloc];
    v13 = -[HUTitleDescriptionContentView initWithFrame:](v14, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    -[HUTitleDescriptionContentView setTranslatesAutoresizingMaskIntoConstraints:](v13, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v4, "contentView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addSubview:", v13);

    -[HUTitleDescriptionContentView leadingAnchor](v13, "leadingAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "contentView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "leadingAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBTableWelcomeController tableView](self, "tableView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "separatorInset");
    objc_msgSend(v16, "constraintEqualToAnchor:constant:", v18, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setActive:", 1);

    -[HUTitleDescriptionContentView topAnchor](v13, "topAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "contentView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "topAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintEqualToAnchor:constant:", v24, 5.0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setActive:", 1);

    -[HUTitleDescriptionContentView bottomAnchor](v13, "bottomAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "contentView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "bottomAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "constraintEqualToAnchor:constant:", v28, -5.0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setActive:", 1);

    -[HUTitleDescriptionContentView trailingAnchor](v13, "trailingAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "contentView");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "trailingAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "constraintEqualToAnchor:", v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setActive:", 1);

  }
  return v13;
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  return *MEMORY[0x1E0CEBC10];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v4;
  int64_t v5;

  -[HUHomeAssistantDeviceLanguageConfigurationViewController supportedVoiceRecognitionLanguages](self, "supportedVoiceRecognitionLanguages", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count") + 1;

  return v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = (void *)MEMORY[0x1E0CB3940];
  v8 = (void *)MEMORY[0x1E0C99DC8];
  v9 = a3;
  objc_msgSend(v8, "currentLocale");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "languageCode");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "countryCode");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@-%@"), v11, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "dequeueReusableCellWithIdentifier:", CFSTR("language_code_cell_identifier"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA60]), "initWithStyle:reuseIdentifier:", 0, CFSTR("language_code_cell_identifier"));
  objc_msgSend(v15, "setSelectionStyle:", 0);
  if (objc_msgSend(v6, "row"))
  {
    -[HUHomeAssistantDeviceLanguageConfigurationViewController supportedVoiceRecognitionLanguages](self, "supportedVoiceRecognitionLanguages");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectAtIndex:", objc_msgSend(v6, "row") - 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CFE900], "sharedInstance");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "localizedNameForSiriLanguage:inDisplayLanguage:", v17, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    HFLogForCategory();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      v29 = v17;
      v30 = 2112;
      v31 = v19;
      v32 = 2112;
      v33 = v14;
      _os_log_impl(&dword_1B8E1E000, v20, OS_LOG_TYPE_DEFAULT, "languageCode = %@ localizedLanguageName = %@ localeString = %@", buf, 0x20u);
    }

    if (objc_msgSend(v17, "isEqualToString:", v14))
    {
      -[HUHomeAssistantDeviceLanguageConfigurationViewController setSelectedLanguageIndex:](self, "setSelectedLanguageIndex:", objc_msgSend(v6, "row") - 1);
      objc_msgSend(v15, "setAccessoryType:", 3);
      -[HUHomeAssistantDeviceLanguageConfigurationViewController changeLanguageButton](self, "changeLanguageButton");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setEnabled:", 1);

    }
    else
    {
      objc_msgSend(v15, "setAccessoryType:", 0);
    }
    objc_msgSend(v15, "textLabel");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setText:", v19);

  }
  else
  {
    -[HUHomeAssistantDeviceLanguageConfigurationViewController _configureTitleDescriptionContentViewForCell:](self, "_configureTitleDescriptionContentViewForCell:", v15);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    _HULocalizedStringWithDefaultValue(CFSTR("HULanguageSupportedLangugages_TableHeader_Title"), CFSTR("HULanguageSupportedLangugages_TableHeader_Title"), 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setTitleText:", v23);

    objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB590]);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setTitleFont:", v24);

    objc_msgSend(MEMORY[0x1E0CEA478], "systemGrayColor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setTitleTextColor:", v25);

  }
  return v15;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  int64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "row") >= 1)
  {
    v7 = -[HUHomeAssistantDeviceLanguageConfigurationViewController selectedLanguageIndex](self, "selectedLanguageIndex")+ 1;
    objc_msgSend(v12, "cellForRowAtIndexPath:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAccessoryType:", 3);
    -[HUHomeAssistantDeviceLanguageConfigurationViewController setSelectedLanguageIndex:](self, "setSelectedLanguageIndex:", objc_msgSend(v6, "row") - 1);
    -[HUHomeAssistantDeviceLanguageConfigurationViewController changeLanguageButton](self, "changeLanguageButton");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setEnabled:", 1);

    if (v7 != 0x7FFFFFFFFFFFFFFFLL && v7 != objc_msgSend(v6, "row"))
    {
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v7, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "cellForRowAtIndexPath:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "setAccessoryType:", 0);
    }

  }
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
  void *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
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
  NSObject *v48;
  void *v49;
  objc_super v50;
  uint8_t buf[4];
  HUHomeAssistantDeviceLanguageConfigurationViewController *v52;
  __int16 v53;
  void *v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v50.receiver = self;
  v50.super_class = (Class)HUHomeAssistantDeviceLanguageConfigurationViewController;
  -[OBTableWelcomeController viewDidLoad](&v50, sel_viewDidLoad);
  -[HUHomeAssistantDeviceLanguageConfigurationViewController setModalInPresentation:](self, "setModalInPresentation:", 1);
  -[HUHomeAssistantDeviceLanguageConfigurationViewController headerView](self, "headerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subviews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[HUAccessibilityIdentifierUtilities setAccessibilityIDForViews:withIDDictionary:](HUAccessibilityIdentifierUtilities, "setAccessibilityIDForViews:withIDDictionary:", v5, &unk_1E7042FF0);

  objc_msgSend(MEMORY[0x1E0D65140], "boldButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUHomeAssistantDeviceLanguageConfigurationViewController setChangeLanguageButton:](self, "setChangeLanguageButton:", v6);

  -[HUHomeAssistantDeviceLanguageConfigurationViewController changeLanguageButton](self, "changeLanguageButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HUHomeAssistantDeviceLanguageConfigurationViewController changeLanguageButton](self, "changeLanguageButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setEnabled:", 0);

  _HULocalizedStringWithDefaultValue(CFSTR("HULanguageChangeLanguage_Button_Title"), CFSTR("HULanguageChangeLanguage_Button_Title"), 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  _HULocalizedStringWithDefaultValue(CFSTR("HULanguageKeepUsingCurrentHomePodLanguages_Button_Title"), CFSTR("HULanguageKeepUsingCurrentHomePodLanguages_Button_Title"), 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUHomeAssistantDeviceLanguageConfigurationViewController languageMismatchedHomeAssistantDevices](self, "languageMismatchedHomeAssistantDevices");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  if (v12 < 2)
  {
    -[HUHomeAssistantDeviceLanguageConfigurationViewController languageMismatchedHomeAssistantDevices](self, "languageMismatchedHomeAssistantDevices");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "count");

    if (v15 != 1)
      goto LABEL_16;
    objc_opt_class();
    -[HUHomeAssistantDeviceLanguageConfigurationViewController languageMismatchedHomeAssistantDevices](self, "languageMismatchedHomeAssistantDevices");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "firstObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v17 = v13;
    else
      v17 = 0;
    v18 = v17;

    if (v18)
    {
      objc_msgSend(v18, "hf_siriLanguageOptionsManager");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "selectedLanguageOption");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v20)
      {
        objc_msgSend(v18, "hf_settingsAdapterManager");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "adapterForIdentifier:", *MEMORY[0x1E0D30140]);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v23 = v22;
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v24 = v23;
        else
          v24 = 0;
        v25 = v24;

        objc_msgSend(v25, "selectedLanguageOption");
        v20 = (void *)objc_claimAutoreleasedReturnValue();

      }
      objc_msgSend(v20, "localizedRecognitionLanguage");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      HULocalizedStringWithFormat(CFSTR("HULanguageKeepUsingHomePodLanguage_Button_Title"), CFSTR("%@"), v27, v28, v29, v30, v31, v32, (uint64_t)v26);
      v33 = objc_claimAutoreleasedReturnValue();

      v10 = (void *)v33;
    }
    else
    {
      v13 = 0;
    }
  }
  else
  {
    _HULocalizedStringWithDefaultValue(CFSTR("HULanguageChangeAllSiriLanguages_Button_Title"), CFSTR("HULanguageChangeAllSiriLanguages_Button_Title"), 1);
    v13 = v9;
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

LABEL_16:
  -[HUHomeAssistantDeviceLanguageConfigurationViewController changeLanguageButton](self, "changeLanguageButton");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setTitle:forState:", v9, 0);

  -[HUHomeAssistantDeviceLanguageConfigurationViewController changeLanguageButton](self, "changeLanguageButton");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setAccessibilityIdentifier:", CFSTR("Home.Onboarding.LanguageSetUp.Configuration.ChangeLanguageButton"));

  -[HUHomeAssistantDeviceLanguageConfigurationViewController changeLanguageButton](self, "changeLanguageButton");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "addTarget:action:forControlEvents:", self, sel__changeLanguage, 64);

  -[HUHomeAssistantDeviceLanguageConfigurationViewController buttonTray](self, "buttonTray");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUHomeAssistantDeviceLanguageConfigurationViewController changeLanguageButton](self, "changeLanguageButton");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "addButton:", v38);

  objc_msgSend(MEMORY[0x1E0D65170], "linkButton");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUHomeAssistantDeviceLanguageConfigurationViewController setCancelButton:](self, "setCancelButton:", v39);

  -[HUHomeAssistantDeviceLanguageConfigurationViewController cancelButton](self, "cancelButton");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HUHomeAssistantDeviceLanguageConfigurationViewController cancelButton](self, "cancelButton");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setTitle:forState:", v10, 0);

  -[HUHomeAssistantDeviceLanguageConfigurationViewController cancelButton](self, "cancelButton");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setAccessibilityIdentifier:", CFSTR("Home.Onboarding.Configuration.LanguageSetUp.CancelButton"));

  -[HUHomeAssistantDeviceLanguageConfigurationViewController cancelButton](self, "cancelButton");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "addTarget:action:forControlEvents:", self, sel__cancelLanguageChange, 64);

  -[HUHomeAssistantDeviceLanguageConfigurationViewController buttonTray](self, "buttonTray");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUHomeAssistantDeviceLanguageConfigurationViewController cancelButton](self, "cancelButton");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "addButton:", v45);

  -[HUHomeAssistantDeviceLanguageConfigurationViewController buttonTray](self, "buttonTray");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  HULocalizedModelString(CFSTR("HULanguageCanRecognizeMultipleVoices_FinePrint"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "setCaptionText:", v47);

  HFLogForCategory();
  v48 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v52 = self;
    v53 = 2112;
    v54 = v49;
    _os_log_impl(&dword_1B8E1E000, v48, OS_LOG_TYPE_DEFAULT, "%@:%@: presented: HADLCVC", buf, 0x16u);

  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  objc_super v8;
  uint8_t buf[4];
  HUHomeAssistantDeviceLanguageConfigurationViewController *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)HUHomeAssistantDeviceLanguageConfigurationViewController;
  -[HUHomeAssistantDeviceLanguageConfigurationViewController viewWillDisappear:](&v8, sel_viewWillDisappear_, a3);
  if (-[HUHomeAssistantDeviceLanguageConfigurationViewController isMovingFromParentViewController](self, "isMovingFromParentViewController"))
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
    -[HUHomeAssistantDeviceLanguageConfigurationViewController delegate](self, "delegate");
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

- (OBTrayButton)changeLanguageButton
{
  return self->_changeLanguageButton;
}

- (void)setChangeLanguageButton:(id)a3
{
  objc_storeStrong((id *)&self->_changeLanguageButton, a3);
}

- (OBLinkTrayButton)cancelButton
{
  return self->_cancelButton;
}

- (void)setCancelButton:(id)a3
{
  objc_storeStrong((id *)&self->_cancelButton, a3);
}

- (NSArray)supportedVoiceRecognitionLanguages
{
  return self->_supportedVoiceRecognitionLanguages;
}

- (void)setSupportedVoiceRecognitionLanguages:(id)a3
{
  objc_storeStrong((id *)&self->_supportedVoiceRecognitionLanguages, a3);
}

- (NSArray)languageMismatchedHomeAssistantDevices
{
  return self->_languageMismatchedHomeAssistantDevices;
}

- (void)setLanguageMismatchedHomeAssistantDevices:(id)a3
{
  objc_storeStrong((id *)&self->_languageMismatchedHomeAssistantDevices, a3);
}

- (int64_t)selectedLanguageIndex
{
  return self->_selectedLanguageIndex;
}

- (void)setSelectedLanguageIndex:(int64_t)a3
{
  self->_selectedLanguageIndex = a3;
}

- (NSLayoutConstraint)heightAnchor
{
  return self->_heightAnchor;
}

- (void)setHeightAnchor:(id)a3
{
  objc_storeStrong((id *)&self->_heightAnchor, a3);
}

- (UIActivityIndicatorView)spinner
{
  return self->_spinner;
}

- (void)setSpinner:(id)a3
{
  objc_storeStrong((id *)&self->_spinner, a3);
}

- (NAFuture)changeLanguageFuture
{
  return self->_changeLanguageFuture;
}

- (void)setChangeLanguageFuture:(id)a3
{
  objc_storeStrong((id *)&self->_changeLanguageFuture, a3);
}

- (NSTimer)changeLanguageTimer
{
  return self->_changeLanguageTimer;
}

- (void)setChangeLanguageTimer:(id)a3
{
  objc_storeStrong((id *)&self->_changeLanguageTimer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changeLanguageTimer, 0);
  objc_storeStrong((id *)&self->_changeLanguageFuture, 0);
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_heightAnchor, 0);
  objc_storeStrong((id *)&self->_languageMismatchedHomeAssistantDevices, 0);
  objc_storeStrong((id *)&self->_supportedVoiceRecognitionLanguages, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_changeLanguageButton, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
