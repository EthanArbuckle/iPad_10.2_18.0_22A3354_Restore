@implementation HUHomeAssistantDevicesUnsupportedLanguageViewController

- (HUHomeAssistantDevicesUnsupportedLanguageViewController)initWithHomeAssistantDevicesHavingLanguageMismatch:(id)a3 home:(id)a4
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  HUHomeAssistantDevicesUnsupportedLanguageViewController *v35;
  HUHomeAssistantDevicesUnsupportedLanguageViewController *v36;
  objc_super v38;

  v7 = a3;
  v8 = (void *)MEMORY[0x1E0CFE978];
  v9 = a4;
  objc_msgSend(v8, "sharedPreferences");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "languageCode");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CFE900], "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedNameForSiriLanguage:inDisplayLanguage:", v11, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_msgSend(v9, "hf_numberOfHomePods");
  if (v14 == objc_msgSend(v7, "count"))
  {
    if (v14 == 1)
    {
      _HULocalizedStringWithDefaultValue(CFSTR("HUSingleDeviceLanguageNotChanged_Title"), CFSTR("HUSingleDeviceLanguageNotChanged_Title"), 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      HULocalizedStringWithFormat(CFSTR("HUSingleDeviceLanguageNotChanged_Detail"), CFSTR("%@"), v22, v23, v24, v25, v26, v27, (uint64_t)v13);
    }
    else
    {
      _HULocalizedStringWithDefaultValue(CFSTR("HUMultipleDevicesLanguageNotChanged_Title"), CFSTR("HUMultipleDevicesLanguageNotChanged_Title"), 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      HULocalizedStringWithFormat(CFSTR("HUMultipleDevicesLanguageNotChanged_Detail"), CFSTR("%@"), v29, v30, v31, v32, v33, v34, (uint64_t)v13);
    }
    v28 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    HULocalizedStringWithFormat(CFSTR("HULanguageUnsupported_Detail"), CFSTR("%@"), v15, v16, v17, v18, v19, v20, (uint64_t)v13);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    _HULocalizedStringWithDefaultValue(CFSTR("HULanguageUnsupported_Title"), CFSTR("HULanguageUnsupported_Title"), 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v38.receiver = self;
  v38.super_class = (Class)HUHomeAssistantDevicesUnsupportedLanguageViewController;
  v35 = -[OBTableWelcomeController initWithTitle:detailText:icon:](&v38, sel_initWithTitle_detailText_icon_, v21, v28, 0);
  v36 = v35;
  if (v35)
    objc_storeStrong((id *)&v35->_homeAssistantDevicesHavingLanguageMismatch, a3);

  return v36;
}

- (void)_continue
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  uint8_t buf[4];
  HUHomeAssistantDevicesUnsupportedLanguageViewController *v13;
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
  v6 = (void *)MEMORY[0x1E0C99E08];
  v10 = CFSTR("HULanguageOnboardingKey_UnsupportedLanguage_UserInput");
  v11 = &unk_1E70407E0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dictionaryWithDictionary:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUHomeAssistantDevicesUnsupportedLanguageViewController delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "viewController:didFinishWithConfigurationResults:", self, v8);

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
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)HUHomeAssistantDevicesUnsupportedLanguageViewController;
  -[OBTableWelcomeController loadView](&v19, sel_loadView);
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
  -[HUHomeAssistantDevicesUnsupportedLanguageViewController setHeightAnchor:](self, "setHeightAnchor:", v17);

  -[HUHomeAssistantDevicesUnsupportedLanguageViewController heightAnchor](self, "heightAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setActive:", 1);

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

  -[HUHomeAssistantDevicesUnsupportedLanguageViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layoutIfNeeded");

  -[OBTableWelcomeController tableView](self, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentSize");
  v6 = v5;
  -[HUHomeAssistantDevicesUnsupportedLanguageViewController heightAnchor](self, "heightAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setConstant:", v6);

  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBTableWelcomeController tableView](self, "tableView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setBackgroundColor:", v8);

  v10.receiver = self;
  v10.super_class = (Class)HUHomeAssistantDevicesUnsupportedLanguageViewController;
  -[OBTableWelcomeController viewDidLayoutSubviews](&v10, sel_viewDidLayoutSubviews);
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  return *MEMORY[0x1E0CEBC10];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v4;
  int64_t v5;

  -[HUHomeAssistantDevicesUnsupportedLanguageViewController homeAssistantDevicesHavingLanguageMismatch](self, "homeAssistantDevicesHavingLanguageMismatch", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count") + 1;

  return v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  HUTitleDescriptionCell *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("language_code_cell_identifier"));
  v7 = (HUTitleDescriptionCell *)objc_claimAutoreleasedReturnValue();
  if (!v7)
    v7 = -[HUTitleDescriptionCell initWithStyle:reuseIdentifier:]([HUTitleDescriptionCell alloc], "initWithStyle:reuseIdentifier:", 0, CFSTR("language_code_cell_identifier"));
  if (objc_msgSend(v6, "row") >= 1)
  {
    -[HUHomeAssistantDevicesUnsupportedLanguageViewController homeAssistantDevicesHavingLanguageMismatch](self, "homeAssistantDevicesHavingLanguageMismatch");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v6, "row") - 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "homeManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "hasOptedToHH2"))
    {

    }
    else
    {
      objc_msgSend(v9, "accessory");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "hf_isSiriEndpoint");

      if (!v13)
      {
        objc_msgSend(v9, "hf_settingsAdapterManager");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "adapterForIdentifier:", *MEMORY[0x1E0D30140]);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v17 = v16;
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v18 = v17;
        else
          v18 = 0;
        v19 = v18;

        objc_msgSend(v19, "selectedLanguageOption");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_12:
        objc_msgSend(v15, "recognitionLanguage");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "hf_displayName");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[HUTitleDescriptionCell setTitleText:](v7, "setTitleText:", v21);

        if (v20)
        {
          objc_msgSend(MEMORY[0x1E0CFE900], "sharedInstance");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "localizedNameForSiriLanguage:inDisplayLanguage:", v20, 0);
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          -[HUTitleDescriptionCell setDescriptionText:](v7, "setDescriptionText:", v23);
        }

        goto LABEL_15;
      }
    }
    objc_msgSend(v9, "hf_siriLanguageOptionsManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "selectedLanguageOption");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
LABEL_15:
  -[HUTitleDescriptionCell setSelectionStyle:](v7, "setSelectionStyle:", 0);
  -[HUIconCell setHideIcon:](v7, "setHideIcon:", 1);

  return v7;
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
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  objc_super v16;
  uint8_t buf[4];
  HUHomeAssistantDevicesUnsupportedLanguageViewController *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v16.receiver = self;
  v16.super_class = (Class)HUHomeAssistantDevicesUnsupportedLanguageViewController;
  -[OBTableWelcomeController viewDidLoad](&v16, sel_viewDidLoad);
  -[HUHomeAssistantDevicesUnsupportedLanguageViewController headerView](self, "headerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subviews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[HUAccessibilityIdentifierUtilities setAccessibilityIDForViews:withIDDictionary:](HUAccessibilityIdentifierUtilities, "setAccessibilityIDForViews:withIDDictionary:", v5, &unk_1E7042EB0);

  -[HUHomeAssistantDevicesUnsupportedLanguageViewController setModalInPresentation:](self, "setModalInPresentation:", 1);
  objc_msgSend(MEMORY[0x1E0D65140], "boldButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUHomeAssistantDevicesUnsupportedLanguageViewController setContinueButton:](self, "setContinueButton:", v6);

  -[HUHomeAssistantDevicesUnsupportedLanguageViewController continueButton](self, "continueButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HUHomeAssistantDevicesUnsupportedLanguageViewController continueButton](self, "continueButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  _HULocalizedStringWithDefaultValue(CFSTR("HUContinueTitle"), CFSTR("HUContinueTitle"), 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTitle:forState:", v9, 0);

  -[HUHomeAssistantDevicesUnsupportedLanguageViewController continueButton](self, "continueButton");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAccessibilityIdentifier:", CFSTR("Home.OnboardingView.LanguageSetup.Unsupported.ContinueButton"));

  -[HUHomeAssistantDevicesUnsupportedLanguageViewController continueButton](self, "continueButton");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addTarget:action:forControlEvents:", self, sel__continue, 64);

  -[HUHomeAssistantDevicesUnsupportedLanguageViewController buttonTray](self, "buttonTray");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUHomeAssistantDevicesUnsupportedLanguageViewController continueButton](self, "continueButton");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addButton:", v13);

  HFLogForCategory();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v18 = self;
    v19 = 2112;
    v20 = v15;
    _os_log_impl(&dword_1B8E1E000, v14, OS_LOG_TYPE_DEFAULT, "%@:%@: presented: HADULVC", buf, 0x16u);

  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  objc_super v8;
  uint8_t buf[4];
  HUHomeAssistantDevicesUnsupportedLanguageViewController *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)HUHomeAssistantDevicesUnsupportedLanguageViewController;
  -[HUHomeAssistantDevicesUnsupportedLanguageViewController viewWillDisappear:](&v8, sel_viewWillDisappear_, a3);
  if (-[HUHomeAssistantDevicesUnsupportedLanguageViewController isMovingFromParentViewController](self, "isMovingFromParentViewController"))
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
    -[HUHomeAssistantDevicesUnsupportedLanguageViewController delegate](self, "delegate");
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

- (NSArray)homeAssistantDevicesHavingLanguageMismatch
{
  return self->_homeAssistantDevicesHavingLanguageMismatch;
}

- (void)setHomeAssistantDevicesHavingLanguageMismatch:(id)a3
{
  objc_storeStrong((id *)&self->_homeAssistantDevicesHavingLanguageMismatch, a3);
}

- (NSLayoutConstraint)heightAnchor
{
  return self->_heightAnchor;
}

- (void)setHeightAnchor:(id)a3
{
  objc_storeStrong((id *)&self->_heightAnchor, a3);
}

- (OBTrayButton)continueButton
{
  return self->_continueButton;
}

- (void)setContinueButton:(id)a3
{
  objc_storeStrong((id *)&self->_continueButton, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_continueButton, 0);
  objc_storeStrong((id *)&self->_heightAnchor, 0);
  objc_storeStrong((id *)&self->_homeAssistantDevicesHavingLanguageMismatch, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
