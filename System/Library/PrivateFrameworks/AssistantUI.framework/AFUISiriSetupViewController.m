@implementation AFUISiriSetupViewController

- (AFUISiriSetupViewController)init
{
  AFUISiriSetupViewController *v2;
  AFUISiriSetupViewController *v3;
  id v4;
  uint64_t v5;
  UIView *contentView;
  void *v7;
  objc_class *v8;
  id v9;
  uint64_t v10;
  VTUITurnOnSiriView *setupView;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  UIView *v18;
  void *v19;
  void *v20;
  objc_class *v21;
  VTUISiriDataSharingOptInPresenter *v22;
  VTUISiriDataSharingOptInPresenter *dataSharingOptInPresenter;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  objc_super v29;
  uint64_t v30;
  uint64_t v31;
  Class (*v32)(uint64_t);
  void *v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v29.receiver = self;
  v29.super_class = (Class)AFUISiriSetupViewController;
  v2 = -[AFUISiriSetupViewController init](&v29, sel_init);
  v3 = v2;
  if (v2)
  {
    if (!v2->_contentView)
    {
      v4 = objc_alloc(MEMORY[0x24BEBDB00]);
      v5 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
      contentView = v3->_contentView;
      v3->_contentView = (UIView *)v5;

      -[UIView setAutoresizingMask:](v3->_contentView, "setAutoresizingMask:", 18);
    }
    if (!v3->_setupView)
    {
      v35 = 0;
      v36 = &v35;
      v37 = 0x2050000000;
      v7 = (void *)getVTUITurnOnSiriViewClass_softClass;
      v38 = getVTUITurnOnSiriViewClass_softClass;
      if (!getVTUITurnOnSiriViewClass_softClass)
      {
        v30 = MEMORY[0x24BDAC760];
        v31 = 3221225472;
        v32 = __getVTUITurnOnSiriViewClass_block_invoke;
        v33 = &unk_24D7A1A28;
        v34 = &v35;
        __getVTUITurnOnSiriViewClass_block_invoke((uint64_t)&v30);
        v7 = (void *)v36[3];
      }
      v8 = objc_retainAutorelease(v7);
      _Block_object_dispose(&v35, 8);
      v9 = [v8 alloc];
      v10 = objc_msgSend(v9, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
      setupView = v3->_setupView;
      v3->_setupView = (VTUITurnOnSiriView *)v10;

      -[VTUITurnOnSiriView setStateViewDelegate:](v3->_setupView, "setStateViewDelegate:", v3);
      -[VTUITurnOnSiriView setAutoresizingMask:](v3->_setupView, "setAutoresizingMask:", 18);
      -[VTUITurnOnSiriView continueButton](v3->_setupView, "continueButton");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        -[VTUITurnOnSiriView continueButton](v3->_setupView, "continueButton");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addTarget:action:forControlEvents:", v3, sel__continueTapped_, 64);
      }
      else
      {
        v27 = 0u;
        v28 = 0u;
        v25 = 0u;
        v26 = 0u;
        -[VTUITurnOnSiriView continueButtons](v3->_setupView, "continueButtons", 0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v39, 16);
        if (v14)
        {
          v15 = *(_QWORD *)v26;
          do
          {
            v16 = 0;
            do
            {
              if (*(_QWORD *)v26 != v15)
                objc_enumerationMutation(v13);
              objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v16++), "addTarget:action:forControlEvents:", v3, sel__continueTapped_, 64);
            }
            while (v14 != v16);
            v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v39, 16);
          }
          while (v14);
        }
      }

      -[VTUITurnOnSiriView laterButton](v3->_setupView, "laterButton");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "addTarget:action:forControlEvents:", v3, sel__laterTapped_, 64);

      -[UIView addSubview:](v3->_contentView, "addSubview:", v3->_setupView);
      v18 = v3->_contentView;
      objc_msgSend(MEMORY[0x24BEBD4B8], "systemBackgroundColor");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView setBackgroundColor:](v18, "setBackgroundColor:", v19);

      -[AFUISiriSetupViewController setSiriSetupView:](v3, "setSiriSetupView:", v3->_setupView);
    }
    if (!v3->_dataSharingOptInPresenter)
    {
      v35 = 0;
      v36 = &v35;
      v37 = 0x2050000000;
      v20 = (void *)getVTUISiriDataSharingOptInPresenterClass_softClass;
      v38 = getVTUISiriDataSharingOptInPresenterClass_softClass;
      if (!getVTUISiriDataSharingOptInPresenterClass_softClass)
      {
        v30 = MEMORY[0x24BDAC760];
        v31 = 3221225472;
        v32 = __getVTUISiriDataSharingOptInPresenterClass_block_invoke;
        v33 = &unk_24D7A1A28;
        v34 = &v35;
        __getVTUISiriDataSharingOptInPresenterClass_block_invoke((uint64_t)&v30);
        v20 = (void *)v36[3];
      }
      v21 = objc_retainAutorelease(v20);
      _Block_object_dispose(&v35, 8);
      v22 = (VTUISiriDataSharingOptInPresenter *)objc_alloc_init(v21);
      dataSharingOptInPresenter = v3->_dataSharingOptInPresenter;
      v3->_dataSharingOptInPresenter = v22;

      -[VTUISiriDataSharingOptInPresenter setPresentationDelegate:](v3->_dataSharingOptInPresenter, "setPresentationDelegate:", v3);
      -[VTUISiriDataSharingOptInPresenter setSourceOfChange:](v3->_dataSharingOptInPresenter, "setSourceOfChange:", 7);
    }
    -[AFUISiriSetupViewController _fetchEnablementConfiguration](v3, "_fetchEnablementConfiguration");
  }
  return v3;
}

- (void)_fetchEnablementConfiguration
{
  AFEnablementFlowConfigurationProvider *v3;
  AFEnablementFlowConfigurationProvider *enablementConfigurationProvider;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  AFEnablementFlowConfigurationProvider *v9;
  _QWORD v10[4];
  id v11;
  id location;

  v3 = (AFEnablementFlowConfigurationProvider *)objc_alloc_init(MEMORY[0x24BE091D0]);
  enablementConfigurationProvider = self->_enablementConfigurationProvider;
  self->_enablementConfigurationProvider = v3;

  objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localeIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allSiriLanguageCodesForSystemLanguageCode:isGoodFit:", v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[AFUISiriSetupViewController _setLoadingEnablementConfiguration:](self, "_setLoadingEnablementConfiguration:", 1);
  objc_initWeak(&location, self);
  v9 = self->_enablementConfigurationProvider;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __60__AFUISiriSetupViewController__fetchEnablementConfiguration__block_invoke;
  v10[3] = &unk_24D7A36A0;
  objc_copyWeak(&v11, &location);
  -[AFEnablementFlowConfigurationProvider configurationForEnablementFlow:recognitionLanguageCodes:completion:](v9, "configurationForEnablementFlow:recognitionLanguageCodes:completion:", 5, v8, v10);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

void __60__AFUISiriSetupViewController__fetchEnablementConfiguration__block_invoke(uint64_t a1, void *a2)
{
  id v4;
  id *v5;
  id *WeakRetained;
  NSObject *v7;
  _QWORD block[4];
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  v5 = (id *)(a1 + 32);
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v7 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v11 = "-[AFUISiriSetupViewController _fetchEnablementConfiguration]_block_invoke";
    v12 = 2112;
    v13 = v4;
    _os_log_impl(&dword_217514000, v7, OS_LOG_TYPE_DEFAULT, "%s %@", buf, 0x16u);
  }
  if (WeakRetained)
  {
    objc_storeStrong(WeakRetained + 126, a2);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __60__AFUISiriSetupViewController__fetchEnablementConfiguration__block_invoke_9;
    block[3] = &unk_24D7A1AB8;
    objc_copyWeak(&v9, v5);
    dispatch_async(MEMORY[0x24BDAC9B8], block);
    objc_destroyWeak(&v9);
  }

}

void __60__AFUISiriSetupViewController__fetchEnablementConfiguration__block_invoke_9(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_setLoadingEnablementConfiguration:", 0);

}

- (void)_setLoadingEnablementConfiguration:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v3 = a3;
  v16 = *MEMORY[0x24BDAC8D0];
  -[VTUITurnOnSiriView continueButton](self->_setupView, "continueButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEnabled:", !v3);

  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[VTUITurnOnSiriView continueButtons](self->_setupView, "continueButtons", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "setEnabled:", !v3);
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

  self->_isLoadingEnablementConfiguration = v3;
}

- (void)loadView
{
  -[AFUISiriSetupViewController setView:](self, "setView:", self->_contentView);
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AFUISiriSetupViewController;
  -[AFUISiriSetupViewController viewWillAppear:](&v7, sel_viewWillAppear_, a3);
  -[AFUISiriSetupViewController navigationController](self, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "navigationBar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "_setHidesShadow:", 1);
  v6 = (void *)objc_opt_new();
  objc_msgSend(v5, "setBackgroundImage:forBarMetrics:", v6, 0);

}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AFUISiriSetupViewController;
  -[AFUISiriSetupViewController viewWillDisappear:](&v3, sel_viewWillDisappear_, a3);
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AFUISiriSetupViewController;
  -[AFUISiriSetupViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[AFUISiriSetupViewController setVisible:](self, "setVisible:", 1);
}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  __int128 v5;
  _OWORD v6[3];
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AFUISiriSetupViewController;
  -[AFUISiriSetupViewController viewDidDisappear:](&v7, sel_viewDidDisappear_, a3);
  -[AFUISiriSetupViewController setVisible:](self, "setVisible:", 0);
  -[AFUISiriSetupViewController siriSetupView](self, "siriSetupView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  v6[0] = *MEMORY[0x24BDBD8B8];
  v6[1] = v5;
  v6[2] = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  objc_msgSend(v4, "setTransform:", v6);

}

- (void)animatedAppearanceWithFactory:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[5];

  v6 = a4;
  v7 = (void *)MEMORY[0x24BE0BF08];
  v10 = v6;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __72__AFUISiriSetupViewController_animatedAppearanceWithFactory_completion___block_invoke;
  v11[3] = &unk_24D7A1B30;
  v11[4] = self;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __72__AFUISiriSetupViewController_animatedAppearanceWithFactory_completion___block_invoke_2;
  v9[3] = &unk_24D7A2188;
  v8 = v6;
  objc_msgSend(v7, "animateWithFactory:actions:completion:", a3, v11, v9);

}

void __72__AFUISiriSetupViewController_animatedAppearanceWithFactory_completion___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "updateHomeGestureSharingForSiriSetup:", 0);

  }
}

uint64_t __72__AFUISiriSetupViewController_animatedAppearanceWithFactory_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)animatedDisappearanceWithFactory:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[5];

  v6 = a4;
  v7 = (void *)MEMORY[0x24BE0BF08];
  v10 = v6;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __75__AFUISiriSetupViewController_animatedDisappearanceWithFactory_completion___block_invoke;
  v11[3] = &unk_24D7A1B30;
  v11[4] = self;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __75__AFUISiriSetupViewController_animatedDisappearanceWithFactory_completion___block_invoke_3;
  v9[3] = &unk_24D7A2188;
  v8 = v6;
  objc_msgSend(v7, "animateWithFactory:actions:completion:", a3, v11, v9);

}

void __75__AFUISiriSetupViewController_animatedDisappearanceWithFactory_completion___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  id v3;
  _QWORD v4[4];
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "siriSetupView");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)MEMORY[0x24BEBDB00];
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __75__AFUISiriSetupViewController_animatedDisappearanceWithFactory_completion___block_invoke_2;
  v4[3] = &unk_24D7A1B30;
  v5 = v1;
  v3 = v1;
  objc_msgSend(v2, "animateWithDuration:animations:", v4, 0.5);

}

uint64_t __75__AFUISiriSetupViewController_animatedDisappearanceWithFactory_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  __int128 v3;
  _OWORD v5[3];

  v2 = *(void **)(a1 + 32);
  v3 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  v5[0] = *MEMORY[0x24BDBD8B8];
  v5[1] = v3;
  v5[2] = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  objc_msgSend(v2, "setTransform:", v5);
  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
  objc_msgSend(*(id *)(a1 + 32), "frame");
  return objc_msgSend(*(id *)(a1 + 32), "setFrame:", 0.0, 0.0);
}

uint64_t __75__AFUISiriSetupViewController_animatedDisappearanceWithFactory_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)setLastTimeShown:(BOOL)a3
{
  self->_lastTimeShown = a3;
  if (a3)
    -[VTUITurnOnSiriView prepareForLastTimeShown](self->_setupView, "prepareForLastTimeShown");
}

- (void)_continueTapped:(id)a3
{
  id v4;
  void *v5;
  char v6;
  NSString *v7;
  NSString *selectedRecognitionLanguageCode;
  NSString *v9;
  void *v10;
  NSString *v11;
  NSString *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  objc_class *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[5];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;

  v4 = a3;
  ADClientAddValueForScalarKey();
  -[VTUITurnOnSiriView continueButtons](self->_setupView, "continueButtons");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  if ((v6 & 1) != 0)
  {
    -[VTUITurnOnSiriView languageSelectionOfContinueButton:](self->_setupView, "languageSelectionOfContinueButton:", v4);
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    selectedRecognitionLanguageCode = self->_selectedRecognitionLanguageCode;
    self->_selectedRecognitionLanguageCode = v7;

  }
  v9 = self->_selectedRecognitionLanguageCode;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bestSupportedLanguageCodeForLanguageCode:", 0);
    v11 = (NSString *)objc_claimAutoreleasedReturnValue();
    v12 = self->_selectedRecognitionLanguageCode;
    self->_selectedRecognitionLanguageCode = v11;

    v9 = self->_selectedRecognitionLanguageCode;
  }
  if (-[AFEnablementConfiguration requiresVoiceSelectionForRecognitionLanguage:](self->_enablementConfiguration, "requiresVoiceSelectionForRecognitionLanguage:", v9))
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "assistantUILocalizedStringFromSystemLanguageForKey:table:", CFSTR("ASSISTANT_ENABLE_DONE"), CFSTR("Localizable"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[VTUISiriDataSharingOptInPresenter shouldShowSiriDataSharingOptInView](self->_dataSharingOptInPresenter, "shouldShowSiriDataSharingOptInView"))
    {
      objc_msgSend(v13, "assistantUILocalizedStringFromSystemLanguageForKey:table:", CFSTR("ASSISTANT_ENABLE_NEXT"), CFSTR("Localizable"));
      v15 = objc_claimAutoreleasedReturnValue();

      v14 = (void *)v15;
    }
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithTitle:style:target:action:", v14, 0, 0, 0);
    v24 = 0;
    v25 = &v24;
    v26 = 0x2050000000;
    v17 = (void *)getVTUIVoiceSelectionViewControllerClass_softClass;
    v27 = getVTUIVoiceSelectionViewControllerClass_softClass;
    if (!getVTUIVoiceSelectionViewControllerClass_softClass)
    {
      v23[0] = MEMORY[0x24BDAC760];
      v23[1] = 3221225472;
      v23[2] = __getVTUIVoiceSelectionViewControllerClass_block_invoke;
      v23[3] = &unk_24D7A1A28;
      v23[4] = &v24;
      __getVTUIVoiceSelectionViewControllerClass_block_invoke((uint64_t)v23);
      v17 = (void *)v25[3];
    }
    v18 = objc_retainAutorelease(v17);
    _Block_object_dispose(&v24, 8);
    v19 = (void *)objc_msgSend([v18 alloc], "initWithRecognitionLanguage:allowsRandomSelection:barButtonItemForContinue:customVoicePreviewer:delegate:", self->_selectedRecognitionLanguageCode, -[AFEnablementConfiguration voiceSelectionAllowsRandomSelection](self->_enablementConfiguration, "voiceSelectionAllowsRandomSelection"), v16, 0, self);
    objc_msgSend(v19, "navigationItem");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setRightBarButtonItem:", v16);

    objc_msgSend(v19, "navigationItem");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setHidesBackButton:", 1);

    -[AFUISiriSetupViewController navigationController](self, "navigationController");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "pushViewController:animated:", v19, 1);

  }
  else
  {
    -[AFUISiriSetupViewController _continueWithLanguageCode:commitLanguageCodeToPreferences:](self, "_continueWithLanguageCode:commitLanguageCodeToPreferences:", self->_selectedRecognitionLanguageCode, 1);
  }

}

- (void)_continueWithLanguageCode:(id)a3 commitLanguageCodeToPreferences:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  __int128 buf;
  uint64_t v24;
  void *v25;
  uint64_t *v26;
  uint64_t v27;

  v4 = a4;
  v27 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setLanguageCode:", v6);

  }
  v8 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(_QWORD *)((char *)&buf + 4) = "-[AFUISiriSetupViewController _continueWithLanguageCode:commitLanguageCodeToPreferences:]";
    _os_log_impl(&dword_217514000, v8, OS_LOG_TYPE_DEFAULT, "%s Enabling assistant and starting Siri", (uint8_t *)&buf, 0xCu);
  }
  objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAssistantIsEnabled:", 1);

  v19 = 0;
  v20 = &v19;
  v21 = 0x2050000000;
  v10 = (void *)getBYFlowSkipControllerClass_softClass;
  v22 = getBYFlowSkipControllerClass_softClass;
  if (!getBYFlowSkipControllerClass_softClass)
  {
    *(_QWORD *)&buf = MEMORY[0x24BDAC760];
    *((_QWORD *)&buf + 1) = 3221225472;
    v24 = (uint64_t)__getBYFlowSkipControllerClass_block_invoke;
    v25 = &unk_24D7A1A28;
    v26 = &v19;
    __getBYFlowSkipControllerClass_block_invoke((uint64_t)&buf);
    v10 = (void *)v20[3];
  }
  v11 = objc_retainAutorelease(v10);
  _Block_object_dispose(&v19, 8);
  objc_msgSend(v11, "sharedInstance", v19);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v24 = 0x2020000000;
  v13 = (_QWORD *)getBYFlowSkipIdentifierSiriSymbolLoc_ptr;
  v25 = (void *)getBYFlowSkipIdentifierSiriSymbolLoc_ptr;
  if (!getBYFlowSkipIdentifierSiriSymbolLoc_ptr)
  {
    v14 = (void *)SetupAssistantLibrary();
    v13 = dlsym(v14, "BYFlowSkipIdentifierSiri");
    *(_QWORD *)(*((_QWORD *)&buf + 1) + 24) = v13;
    getBYFlowSkipIdentifierSiriSymbolLoc_ptr = (uint64_t)v13;
  }
  _Block_object_dispose(&buf, 8);
  if (!v13)
    -[AFUISiriSetupViewController _continueWithLanguageCode:commitLanguageCodeToPreferences:].cold.1();
  objc_msgSend(v12, "didCompleteFlow:", *v13);

  if (-[VTUISiriDataSharingOptInPresenter shouldShowSiriDataSharingOptInView](self->_dataSharingOptInPresenter, "shouldShowSiriDataSharingOptInView"))
  {
    -[AFUISiriSetupViewController _presentDataSharingOptInViewController](self, "_presentDataSharingOptInViewController");
  }
  else
  {
    -[AFUISiriSetupViewController delegate](self, "delegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "openSiriRequestedBySiriSetupViewController:", self);

  }
  -[AFUISiriSetupViewController delegate](self, "delegate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_opt_respondsToSelector();

  if ((v17 & 1) != 0)
  {
    -[AFUISiriSetupViewController delegate](self, "delegate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "updateHomeGestureSharingForSiriSetup:", 1);

  }
}

- (void)_laterTapped:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315138;
    v9 = "-[AFUISiriSetupViewController _laterTapped:]";
    _os_log_impl(&dword_217514000, v5, OS_LOG_TYPE_DEFAULT, "%s Later Tapped, dismissing", (uint8_t *)&v8, 0xCu);
  }
  -[AFUISiriSetupViewController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dismissSiriSetupViewController:", self);

  if (self->_lastTimeShown)
  {
    -[AFUISiriSetupViewController delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "disableSiriActivationRequestedBySiriSetupViewController:", self);

  }
}

- (void)aboutSelectedInTurnOnSiriView:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  __int128 buf;
  Class (*v17)(uint64_t);
  void *v18;
  uint64_t *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(_QWORD *)((char *)&buf + 4) = "-[AFUISiriSetupViewController aboutSelectedInTurnOnSiriView:]";
    _os_log_impl(&dword_217514000, v5, OS_LOG_TYPE_DEFAULT, "%s About Selected, showing siri privacy splash page", (uint8_t *)&buf, 0xCu);
  }
  v12 = 0;
  v13 = &v12;
  v14 = 0x2050000000;
  v6 = (void *)getOBPrivacyPresenterClass_softClass;
  v15 = getOBPrivacyPresenterClass_softClass;
  if (!getOBPrivacyPresenterClass_softClass)
  {
    *(_QWORD *)&buf = MEMORY[0x24BDAC760];
    *((_QWORD *)&buf + 1) = 3221225472;
    v17 = __getOBPrivacyPresenterClass_block_invoke;
    v18 = &unk_24D7A1A28;
    v19 = &v12;
    __getOBPrivacyPresenterClass_block_invoke((uint64_t)&buf);
    v6 = (void *)v13[3];
  }
  v7 = objc_retainAutorelease(v6);
  _Block_object_dispose(&v12, 8);
  objc_msgSend(v7, "presenterForPrivacySplashWithIdentifer:", CFSTR("com.apple.onboarding.siri"), v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPresentingViewController:", self);
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "userInterfaceIdiom") == 1;

  if (v10)
    v11 = 2;
  else
    v11 = 7;
  objc_msgSend(v8, "setModalPresentationStyle:", v11);
  objc_msgSend(v8, "present");

}

- (void)_presentDataSharingOptInViewController
{
  NSObject *v3;
  OBWelcomeController *v4;
  OBWelcomeController *dataSharingOptInViewController;
  void *v6;
  void *v7;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315138;
    v9 = "-[AFUISiriSetupViewController _presentDataSharingOptInViewController]";
    _os_log_impl(&dword_217514000, v3, OS_LOG_TYPE_DEFAULT, "%s #siriDataSharingOptIn: Displaying DataSharingOptIn", (uint8_t *)&v8, 0xCu);
  }
  -[VTUISiriDataSharingOptInPresenter dataSharingOptInTextWelcomeControllerForViewStyle:](self->_dataSharingOptInPresenter, "dataSharingOptInTextWelcomeControllerForViewStyle:", 0);
  v4 = (OBWelcomeController *)objc_claimAutoreleasedReturnValue();
  dataSharingOptInViewController = self->_dataSharingOptInViewController;
  self->_dataSharingOptInViewController = v4;

  -[OBWelcomeController navigationItem](self->_dataSharingOptInViewController, "navigationItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHidesBackButton:", 1);

  -[AFUISiriSetupViewController navigationController](self, "navigationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pushViewController:animated:", self->_dataSharingOptInViewController, 1);

}

- (void)siriDataSharingOptInRequestsDismissalFromPresenter:(id)a3
{
  -[OBWelcomeController dismissViewControllerAnimated:completion:](self->_dataSharingOptInViewController, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)siriDataSharingOptInViewControllerDidDismissFromPresenter:(id)a3
{
  void *v4;
  OBWelcomeController *dataSharingOptInViewController;
  VTUISiriDataSharingOptInPresenter *dataSharingOptInPresenter;

  -[AFUISiriSetupViewController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "openSiriRequestedBySiriSetupViewController:", self);

  dataSharingOptInViewController = self->_dataSharingOptInViewController;
  self->_dataSharingOptInViewController = 0;

  dataSharingOptInPresenter = self->_dataSharingOptInPresenter;
  self->_dataSharingOptInPresenter = 0;

}

- (unint64_t)supportedInterfaceOrientations
{
  if (SiriUIIsAllOrientationsSupported())
    return 30;
  else
    return 2;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  id v4;

  -[AFUISiriSetupViewController view](self, "view", a4, a3.width, a3.height);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layoutSubviews");

}

- (void)presentationControllerDidDismiss:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void (**v8)(id, uint64_t);

  objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "assistantIsEnabled");

  if ((v5 & 1) == 0)
  {
    -[AFUISiriSetupViewController delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dismissSiriSetupViewController:", self);

  }
  -[AFEnablementConfiguration completionLoggingBlock](self->_enablementConfiguration, "completionLoggingBlock");
  v8 = (void (**)(id, uint64_t))objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2](v8, objc_msgSend(v7, "assistantIsEnabled"));

}

- (BOOL)presentationControllerShouldDismiss:(id)a3
{
  return !self->_isLoadingEnablementConfiguration;
}

- (void)voiceSelectionController:(id)a3 didSelectVoice:(id)a4
{
  void *v5;
  id v6;
  void *v7;

  v5 = (void *)MEMORY[0x24BE09270];
  v6 = a4;
  objc_msgSend(v5, "sharedPreferences");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLanguageCode:outputVoice:", self->_selectedRecognitionLanguageCode, v6);

  -[AFUISiriSetupViewController _continueWithLanguageCode:commitLanguageCodeToPreferences:](self, "_continueWithLanguageCode:commitLanguageCodeToPreferences:", self->_selectedRecognitionLanguageCode, 0);
}

- (AFUISiriSetupViewControllerDelegate)delegate
{
  return (AFUISiriSetupViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isVisible
{
  return self->_visible;
}

- (void)setVisible:(BOOL)a3
{
  self->_visible = a3;
}

- (BOOL)lastTimeShown
{
  return self->_lastTimeShown;
}

- (UIView)siriSetupView
{
  return self->_siriSetupView;
}

- (void)setSiriSetupView:(id)a3
{
  objc_storeStrong((id *)&self->_siriSetupView, a3);
}

- (UIStatusBar)_statusBar
{
  return self->_statusBar;
}

- (void)_setStatusBar:(id)a3
{
  objc_storeStrong((id *)&self->_statusBar, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusBar, 0);
  objc_storeStrong((id *)&self->_siriSetupView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_enablementConfigurationProvider, 0);
  objc_storeStrong((id *)&self->_enablementConfiguration, 0);
  objc_storeStrong((id *)&self->_dataSharingOptInViewController, 0);
  objc_storeStrong((id *)&self->_dataSharingOptInPresenter, 0);
  objc_storeStrong((id *)&self->_setupView, 0);
  objc_storeStrong((id *)&self->_selectedRecognitionLanguageCode, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
}

- (void)_continueWithLanguageCode:commitLanguageCodeToPreferences:.cold.1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getBYFlowSkipIdentifierSiri(void)");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("AFUISiriSetupViewController.m"), 41, CFSTR("%s"), dlerror());

  __break(1u);
}

@end
