@implementation HUHomeHubResidentWarningViewController

- (HUHomeHubResidentWarningViewController)initWithiPadOnlyHub:(BOOL)a3
{
  __CFString *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  HUHomeHubResidentWarningViewController *v15;
  objc_super v17;

  if (a3)
    v4 = CFSTR("HUSoftwareUpdateMigrationiPadOnlyResidentTitle");
  else
    v4 = CFSTR("HUSoftwareUpdateMigrationNoResidentTitle");
  if (a3)
    v5 = CFSTR("HUSoftwareUpdateMigrationiPadOnlyResidentDescription");
  else
    v5 = CFSTR("HUSoftwareUpdateMigrationNoResidentDescription");
  _HULocalizedStringWithDefaultValue(v4, v4, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _HULocalizedStringWithDefaultValue(v5, v5, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CEA650];
  objc_msgSend(MEMORY[0x1E0CEA478], "hf_keyColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "configurationWithHierarchicalColor:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithPointSize:", 100.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "configurationByApplyingConfiguration:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("homekit"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "imageWithConfiguration:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v17.receiver = self;
  v17.super_class = (Class)HUHomeHubResidentWarningViewController;
  v15 = -[HUImageOBWelcomeController initWithTitle:detailText:icon:contentImage:](&v17, sel_initWithTitle_detailText_icon_contentImage_, v6, v7, 0, v14);

  return v15;
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
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  objc_super v27;
  uint8_t buf[4];
  HUHomeHubResidentWarningViewController *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v27.receiver = self;
  v27.super_class = (Class)HUHomeHubResidentWarningViewController;
  -[HUImageOBWelcomeController viewDidLoad](&v27, sel_viewDidLoad);
  -[HUHomeHubResidentWarningViewController headerView](self, "headerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subviews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[HUAccessibilityIdentifierUtilities setAccessibilityIDForViews:withIDDictionary:](HUAccessibilityIdentifierUtilities, "setAccessibilityIDForViews:withIDDictionary:", v5, &unk_1E70431F8);

  objc_msgSend(MEMORY[0x1E0D65158], "accessoryButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUHomeHubResidentWarningViewController setLinkButton:](self, "setLinkButton:", v6);

  -[HUHomeHubResidentWarningViewController linkButton](self, "linkButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  _HULocalizedStringWithDefaultValue(CFSTR("HUSoftwareUpdateMigrationResidentLearnMoreMessage"), CFSTR("HUSoftwareUpdateMigrationResidentLearnMoreMessage"), 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTitle:forState:", v8, 0);

  -[HUHomeHubResidentWarningViewController linkButton](self, "linkButton");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAccessibilityIdentifier:", CFSTR("Home.OnboardingView.HomeHubMigration.HUHomeHubResidentWarning.LearnMoreLink"));

  -[HUHomeHubResidentWarningViewController linkButton](self, "linkButton");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addTarget:action:forControlEvents:", self, sel__openLink_, 64);

  -[HUHomeHubResidentWarningViewController headerView](self, "headerView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUHomeHubResidentWarningViewController linkButton](self, "linkButton");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addAccessoryButton:", v12);

  objc_msgSend(MEMORY[0x1E0D65140], "boldButton");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUHomeHubResidentWarningViewController setCommitButton:](self, "setCommitButton:", v13);

  -[HUHomeHubResidentWarningViewController commitButton](self, "commitButton");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HUHomeHubResidentWarningViewController commitButton](self, "commitButton");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUHomeHubResidentWarningViewController _commitOrContinueButtonTitle](self, "_commitOrContinueButtonTitle");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setTitle:forState:", v16, 0);

  -[HUHomeHubResidentWarningViewController commitButton](self, "commitButton");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setAccessibilityIdentifier:", CFSTR("Home.OnboardingView.HomeHubMigration.HUHomeHubResidentWarning.CommitOrContinueButton"));

  -[HUHomeHubResidentWarningViewController commitButton](self, "commitButton");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addTarget:action:forControlEvents:", self, sel__commitOrContinue_, 64);

  -[HUHomeHubResidentWarningViewController buttonTray](self, "buttonTray");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUHomeHubResidentWarningViewController commitButton](self, "commitButton");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addButton:", v20);

  v21 = objc_alloc(MEMORY[0x1E0CEA380]);
  _HULocalizedStringWithDefaultValue(CFSTR("HUCancelTitle"), CFSTR("HUCancelTitle"), 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(v21, "initWithTitle:style:target:action:", v22, 0, self, sel__cancelFlow_);

  objc_msgSend(v23, "setAccessibilityIdentifier:", CFSTR("Home.OnboardingView.HomeHubMigration.HUHomeHubResidentWarning.CancelButton"));
  -[OBBaseWelcomeController navigationItem](self, "navigationItem");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setRightBarButtonItem:", v23);

  -[HUHomeHubResidentWarningViewController setModalInPresentation:](self, "setModalInPresentation:", 1);
  HFLogForCategory();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v29 = self;
    v30 = 2112;
    v31 = v26;
    _os_log_impl(&dword_1B8E1E000, v25, OS_LOG_TYPE_DEFAULT, "%@:%@: presented: HUHomeHubSharedHomesWarningViewController", buf, 0x16u);

  }
}

- (BOOL)_limitToNonScrollingContentHeight
{
  return 1;
}

- (Class)onboardingFlowClass
{
  return (Class)objc_opt_class();
}

- (id)_commitOrContinueButtonTitle
{
  void *v3;
  id v4;
  void *v5;

  _HULocalizedStringWithDefaultValue(CFSTR("HUSoftwareUpdateMigrationUpgradeAnyway"), CFSTR("HUSoftwareUpdateMigrationUpgradeAnyway"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[HUHomeHubResidentWarningViewController isFinalStep](self, "isFinalStep"))
  {
    v4 = v3;
  }
  else
  {
    _HULocalizedStringWithDefaultValue(CFSTR("HUContinueTitle"), CFSTR("HUContinueTitle"), 1);
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return v5;
}

- (void)_commitOrContinue:(id)a3
{
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint8_t buf[4];
  HUHomeHubResidentWarningViewController *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v14 = self;
    v15 = 2112;
    v16 = v6;
    _os_log_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_DEFAULT, "%@:%@ User tapped button", buf, 0x16u);

  }
  if (-[HUHomeHubResidentWarningViewController isFinalStep](self, "isFinalStep"))
    v7 = 6;
  else
    v7 = 5;
  -[HUHomeHubResidentWarningViewController delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v7, CFSTR("HUHomeHub2OnboardingKey_UserInput"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "viewController:didFinishWithConfigurationResults:", self, v10);

}

- (void)_cancelFlow:(id)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  uint8_t buf[4];
  HUHomeHubResidentWarningViewController *v12;
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
  -[HUHomeHubResidentWarningViewController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = CFSTR("HUHomeHub2OnboardingKey_UserInput");
  v10 = &unk_1E70415A8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "viewController:didFinishWithConfigurationResults:", self, v8);

}

- (void)_openLink:(id)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  HUHomeHubResidentWarningViewController *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412546;
    v9 = self;
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_DEFAULT, "%@:%@ User tapped button", (uint8_t *)&v8, 0x16u);

  }
  objc_msgSend(MEMORY[0x1E0C99E98], "hf_homeHubRequiredLearnMoreURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUHomeHubResidentWarningViewController _openURL:](self, "_openURL:", v7);

}

- (void)_openURL:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  id v7;

  v4 = (objc_class *)MEMORY[0x1E0CD5600];
  v5 = a3;
  v7 = (id)objc_msgSend([v4 alloc], "initWithURL:", v5);

  objc_msgSend(v7, "setModalPresentationStyle:", 1);
  objc_msgSend(MEMORY[0x1E0CEA478], "hf_keyColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPreferredControlTintColor:", v6);

  -[HUHomeHubResidentWarningViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v7, 1, 0);
}

- (HUConfigurationViewControllerDelegate)delegate
{
  return (HUConfigurationViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isFinalStep
{
  return self->_isFinalStep;
}

- (void)setIsFinalStep:(BOOL)a3
{
  self->_isFinalStep = a3;
}

- (OBHeaderAccessoryButton)linkButton
{
  return self->_linkButton;
}

- (void)setLinkButton:(id)a3
{
  objc_storeStrong((id *)&self->_linkButton, a3);
}

- (OBBoldTrayButton)commitButton
{
  return self->_commitButton;
}

- (void)setCommitButton:(id)a3
{
  objc_storeStrong((id *)&self->_commitButton, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commitButton, 0);
  objc_storeStrong((id *)&self->_linkButton, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
