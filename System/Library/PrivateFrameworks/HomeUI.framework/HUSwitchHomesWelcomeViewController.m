@implementation HUSwitchHomesWelcomeViewController

- (HUSwitchHomesWelcomeViewController)initWithHome:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  HUSwitchHomesWelcomeViewController *v16;
  objc_super v18;

  v5 = a3;
  objc_msgSend(v5, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  HULocalizedStringWithFormat(CFSTR("HUSwitchHomesWelcome_Title"), CFSTR("%@"), v7, v8, v9, v10, v11, v12, (uint64_t)v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  _HULocalizedStringWithDefaultValue(CFSTR("HUSwitchHomesWelcome_Detail"), CFSTR("HUSwitchHomesWelcome_Detail"), 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  HUImageNamed(CFSTR("Onboarding-Home-Invite"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18.receiver = self;
  v18.super_class = (Class)HUSwitchHomesWelcomeViewController;
  v16 = -[HUImageOBWelcomeController initWithTitle:detailText:icon:contentImage:](&v18, sel_initWithTitle_detailText_icon_contentImage_, v13, v14, 0, v15);

  if (v16)
  {
    objc_storeStrong((id *)&v16->_home, a3);
    -[HUCenterFillOBWelcomeController setContentInsets:](v16, "setContentInsets:", 0.0, 41.0, 0.0, 41.0);
  }

  return v16;
}

- (void)_changeButtonTapped:(id)a3
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
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
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  id v38;
  id obj;
  uint64_t v40;
  void *v42;
  _QWORD aBlock[5];
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint8_t v49[128];
  uint8_t buf[4];
  HUSwitchHomesWelcomeViewController *v51;
  __int16 v52;
  const char *v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v38 = a3;
  HFLogForCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v51 = self;
    v52 = 2080;
    v53 = "-[HUSwitchHomesWelcomeViewController _changeButtonTapped:]";
    _os_log_impl(&dword_1B8E1E000, v3, OS_LOG_TYPE_DEFAULT, "%@:%s User tapped change button", buf, 0x16u);
  }

  objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "homeManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hf_orderedHomes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v6, "count") && (objc_msgSend(MEMORY[0x1E0D319D0], "isInternalTest") & 1) == 0)
    NSLog(CFSTR("Attempting to display locations without any homes"));
  objc_msgSend(MEMORY[0x1E0CEA2E8], "hu_actionSheetWithTitle:message:anchorView:", 0, 0, v38);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  obj = v6;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
  if (v7)
  {
    v40 = *(_QWORD *)v46;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v46 != v40)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * v8);
        objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "homeManager");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_initWeak((id *)buf, self);
        aBlock[0] = MEMORY[0x1E0C809B0];
        aBlock[1] = 3221225472;
        aBlock[2] = __58__HUSwitchHomesWelcomeViewController__changeButtonTapped___block_invoke;
        aBlock[3] = &unk_1E6F4F440;
        objc_copyWeak(&v44, (id *)buf);
        aBlock[4] = v9;
        v12 = _Block_copy(aBlock);
        objc_msgSend(v9, "uniqueIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "currentHome");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "uniqueIdentifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v13, "isEqual:", v15);

        v17 = (void *)MEMORY[0x1E0CEA2E0];
        objc_msgSend(v9, "name");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16)
        {
          objc_msgSend(MEMORY[0x1E0CEA638], "hu_locationArrowTemplate");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "_actionWithTitle:image:style:handler:shouldDismissHandler:", v18, v19, 0, v12, 0);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          objc_msgSend(v17, "actionWithTitle:style:handler:", v18, 0, v12);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
        }

        objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "home");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "uniqueIdentifier");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "uniqueIdentifier");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "_setChecked:", objc_msgSend(v23, "isEqual:", v24));

        objc_msgSend(v42, "addAction:", v20);
        objc_destroyWeak(&v44);
        objc_destroyWeak((id *)buf);

        ++v8;
      }
      while (v7 != v8);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
    }
    while (v7);
  }

  v25 = (void *)MEMORY[0x1E0CEA2E0];
  _HULocalizedStringWithDefaultValue(CFSTR("HUSwitchHomesWelcome_MenuCancelTitle"), CFSTR("HUSwitchHomesWelcome_MenuCancelTitle"), 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "actionWithTitle:style:handler:", v26, 1, &__block_literal_global_286);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "addAction:", v27);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v42, "popoverPresentationController");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setSourceView:", v38);

    objc_msgSend(v38, "bounds");
    v30 = v29;
    v32 = v31;
    v34 = v33;
    v36 = v35;
    objc_msgSend(v42, "popoverPresentationController");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setSourceRect:", v30, v32, v34, v36);

  }
  else
  {
    NSLog(CFSTR("Unknown sender for _changeButtonTapped:%@"), v38);
  }
  -[HUSwitchHomesWelcomeViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v42, 1, 0);

}

void __58__HUSwitchHomesWelcomeViewController__changeButtonTapped___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  HFLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v16 = "-[HUSwitchHomesWelcomeViewController _changeButtonTapped:]_block_invoke";
    v17 = 2112;
    v18 = v3;
    _os_log_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_DEFAULT, "(%s) User tapped '%@' from the alert popup", buf, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "home");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "uniqueIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "isEqual:", v8);

  if ((v9 & 1) == 0)
  {
    objc_msgSend(WeakRetained, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = CFSTR("HUSwitchHomesWelcomeOnboardingKey_UserInput");
    v14 = &unk_1E7041CC8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "viewController:didFinishWithConfigurationResults:", WeakRetained, v11);

  }
  objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setSelectedHome:userInitiated:", *(_QWORD *)(a1 + 32), 1);

}

void __58__HUSwitchHomesWelcomeViewController__changeButtonTapped___block_invoke_18(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  void *v4;
  int v5;
  const char *v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  HFLogForCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v2, "title");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 136315394;
    v6 = "-[HUSwitchHomesWelcomeViewController _changeButtonTapped:]_block_invoke";
    v7 = 2112;
    v8 = v4;
    _os_log_impl(&dword_1B8E1E000, v3, OS_LOG_TYPE_DEFAULT, "(%s) User tapped cancel button '%@' from the alert popup", (uint8_t *)&v5, 0x16u);

  }
}

- (void)_continueButtonTapped:(id)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  uint8_t buf[4];
  HUSwitchHomesWelcomeViewController *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v12 = self;
    v13 = 2112;
    v14 = v6;
    _os_log_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_DEFAULT, "%@:%@ User tapped button", buf, 0x16u);

  }
  -[HUSwitchHomesWelcomeViewController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = CFSTR("HUSwitchHomesWelcomeOnboardingKey_UserInput");
  v10 = &unk_1E7041CE0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "viewController:didFinishWithConfigurationResults:", self, v8);

}

- (id)hu_preloadContent
{
  return (id)objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
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
  void *v14;
  void *v15;
  void *v16;
  unint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  objc_super v28;
  uint8_t buf[4];
  HUSwitchHomesWelcomeViewController *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v28.receiver = self;
  v28.super_class = (Class)HUSwitchHomesWelcomeViewController;
  -[HUImageOBWelcomeController viewDidLoad](&v28, sel_viewDidLoad);
  -[HUSwitchHomesWelcomeViewController headerView](self, "headerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subviews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[HUAccessibilityIdentifierUtilities setAccessibilityIDForViews:withIDDictionary:](HUAccessibilityIdentifierUtilities, "setAccessibilityIDForViews:withIDDictionary:", v5, &unk_1E70432E8);

  objc_msgSend(MEMORY[0x1E0D65140], "boldButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUSwitchHomesWelcomeViewController setContinueButton:](self, "setContinueButton:", v6);

  -[HUSwitchHomesWelcomeViewController continueButton](self, "continueButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HUSwitchHomesWelcomeViewController continueButton](self, "continueButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  _HULocalizedStringWithDefaultValue(CFSTR("HUSwitchHomesWelcome_ContinueButton"), CFSTR("HUSwitchHomesWelcome_ContinueButton"), 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTitle:forState:", v9, 0);

  -[HUSwitchHomesWelcomeViewController continueButton](self, "continueButton");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAccessibilityIdentifier:", CFSTR("Home.OnboardingView.SwitchHomesWelcome.ContinueButton"));

  -[HUSwitchHomesWelcomeViewController continueButton](self, "continueButton");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addTarget:action:forControlEvents:", self, sel__continueButtonTapped_, 64);

  -[HUSwitchHomesWelcomeViewController buttonTray](self, "buttonTray");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUSwitchHomesWelcomeViewController continueButton](self, "continueButton");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addButton:", v13);

  objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "homeManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "homes");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "count");

  if (v17 >= 2)
  {
    objc_msgSend(MEMORY[0x1E0D65170], "linkButton");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUSwitchHomesWelcomeViewController setChangeButton:](self, "setChangeButton:", v18);

    -[HUSwitchHomesWelcomeViewController changeButton](self, "changeButton");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[HUSwitchHomesWelcomeViewController changeButton](self, "changeButton");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    _HULocalizedStringWithDefaultValue(CFSTR("HUSwitchHomesWelcome_ChangeButton"), CFSTR("HUSwitchHomesWelcome_ChangeButton"), 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setTitle:forState:", v21, 0);

    -[HUSwitchHomesWelcomeViewController changeButton](self, "changeButton");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setAccessibilityIdentifier:", CFSTR("Home.OnboardingView.SwitchHomesWelcome.ChangeButton"));

    -[HUSwitchHomesWelcomeViewController changeButton](self, "changeButton");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addTarget:action:forControlEvents:", self, sel__changeButtonTapped_, 64);

    -[HUSwitchHomesWelcomeViewController buttonTray](self, "buttonTray");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUSwitchHomesWelcomeViewController changeButton](self, "changeButton");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addButton:", v25);

  }
  -[HUSwitchHomesWelcomeViewController setModalInPresentation:](self, "setModalInPresentation:", 1);
  HFLogForCategory();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v30 = self;
    v31 = 2112;
    v32 = v27;
    _os_log_impl(&dword_1B8E1E000, v26, OS_LOG_TYPE_DEFAULT, "%@:%@: presented: SHWVC", buf, 0x16u);

  }
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HUSwitchHomesWelcomeViewController;
  -[HUImageOBWelcomeController viewDidLayoutSubviews](&v8, sel_viewDidLayoutSubviews);
  if (objc_msgSend(MEMORY[0x1E0D319D0], "isAMac"))
  {
    -[HUSwitchHomesWelcomeViewController view](self, "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "frame");
    v5 = v4 * 0.65;
  }
  else
  {
    -[HUSwitchHomesWelcomeViewController continueButton](self, "continueButton");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bounds");
    v5 = v6;
  }

  -[HUCenterFillOBWelcomeController maxSize](self, "maxSize");
  if (v7 != v5)
  {
    -[HUCenterFillOBWelcomeController maxSize](self, "maxSize");
    -[HUCenterFillOBWelcomeController setMaxSize:](self, "setMaxSize:", v5);
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

- (HMHome)home
{
  return self->_home;
}

- (void)setHome:(id)a3
{
  objc_storeStrong((id *)&self->_home, a3);
}

- (OBTrayButton)continueButton
{
  return self->_continueButton;
}

- (void)setContinueButton:(id)a3
{
  objc_storeStrong((id *)&self->_continueButton, a3);
}

- (OBLinkTrayButton)changeButton
{
  return self->_changeButton;
}

- (void)setChangeButton:(id)a3
{
  objc_storeStrong((id *)&self->_changeButton, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changeButton, 0);
  objc_storeStrong((id *)&self->_continueButton, 0);
  objc_storeStrong((id *)&self->_home, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
