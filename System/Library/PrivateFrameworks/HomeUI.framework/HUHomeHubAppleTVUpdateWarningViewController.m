@implementation HUHomeHubAppleTVUpdateWarningViewController

- (HUHomeHubAppleTVUpdateWarningViewController)initWithAppleTVsToUpdate:(id)a3 shouldBlockMigration:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  void *v8;
  id v9;
  void *v10;
  __CFString *v11;
  uint64_t v12;
  HUHomeHubAccessoryListItemManager *v13;
  void *v14;
  HUHomeHubAccessoryListItemManager *v15;
  HUHomeHubSimpleTableViewController *v16;
  void *v17;
  HUHomeHubAppleTVUpdateWarningViewController *v18;
  objc_super v20;
  _QWORD v21[4];
  id v22;

  v4 = a4;
  v7 = a3;
  v8 = (void *)objc_opt_new();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __93__HUHomeHubAppleTVUpdateWarningViewController_initWithAppleTVsToUpdate_shouldBlockMigration___block_invoke;
  v21[3] = &unk_1E6F4D7D8;
  v9 = v8;
  v22 = v9;
  objc_msgSend(v7, "na_each:", v21);
  if (v4)
  {
    _HULocalizedStringWithDefaultValue(CFSTR("HUAppleTVSoftwareUpdateBlockingDescription"), CFSTR("HUAppleTVSoftwareUpdateBlockingDescription"), 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v9, "count") <= 1)
      goto LABEL_7;
    v11 = CFSTR("HUAppleTVSoftwareUpdateBlockingDescriptionPluralHomes");
  }
  else
  {
    _HULocalizedStringWithDefaultValue(CFSTR("HUAppleTVSoftwareUpdateRequiredDescription"), CFSTR("HUAppleTVSoftwareUpdateRequiredDescription"), 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v9, "count") < 2)
      goto LABEL_7;
    v11 = CFSTR("HUAppleTVSoftwareUpdateRequiredDescriptionPluralHomes");
  }
  _HULocalizedStringWithDefaultValue(v11, v11, 1);
  v12 = objc_claimAutoreleasedReturnValue();

  v10 = (void *)v12;
LABEL_7:
  v13 = [HUHomeHubAccessoryListItemManager alloc];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[HUHomeHubAccessoryListItemManager initWithAccessories:delegate:](v13, "initWithAccessories:delegate:", v14, self);

  v16 = -[HUItemTableViewController initWithItemManager:tableViewStyle:]([HUHomeHubSimpleTableViewController alloc], "initWithItemManager:tableViewStyle:", v15, 1);
  _HULocalizedStringWithDefaultValue(CFSTR("HUAppleTVSoftwareUpdateRequiredTitle"), CFSTR("HUAppleTVSoftwareUpdateRequiredTitle"), 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v20.receiver = self;
  v20.super_class = (Class)HUHomeHubAppleTVUpdateWarningViewController;
  v18 = -[HUItemTableOBWelcomeController initWithTitle:detailText:icon:contentLayout:itemTableViewController:](&v20, sel_initWithTitle_detailText_icon_contentLayout_itemTableViewController_, v17, v10, 0, 2, v16);

  if (v18)
  {
    v18->_blockMigration = v4;
    objc_storeStrong((id *)&v18->_appleTVs, a3);
  }

  return v18;
}

void __93__HUHomeHubAppleTVUpdateWarningViewController_initWithAppleTVsToUpdate_shouldBlockMigration___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "home");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

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
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  objc_super v29;
  uint8_t buf[4];
  HUHomeHubAppleTVUpdateWarningViewController *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v29.receiver = self;
  v29.super_class = (Class)HUHomeHubAppleTVUpdateWarningViewController;
  -[HUItemTableOBWelcomeController viewDidLoad](&v29, sel_viewDidLoad);
  -[HUHomeHubAppleTVUpdateWarningViewController headerView](self, "headerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subviews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[HUAccessibilityIdentifierUtilities setAccessibilityIDForViews:withIDDictionary:](HUAccessibilityIdentifierUtilities, "setAccessibilityIDForViews:withIDDictionary:", v5, &unk_1E7042F50);

  if (!-[HUHomeHubAppleTVUpdateWarningViewController blockMigration](self, "blockMigration"))
  {
    _HULocalizedStringWithDefaultValue(CFSTR("HUAppleTVSoftwareUpdateRequiredCaption"), CFSTR("HUAppleTVSoftwareUpdateRequiredCaption"), 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUHomeHubAppleTVUpdateWarningViewController buttonTray](self, "buttonTray");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addCaptionText:", v6);

  }
  if (-[HUHomeHubAppleTVUpdateWarningViewController blockMigration](self, "blockMigration"))
  {
    objc_msgSend(MEMORY[0x1E0D65158], "accessoryButton");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUHomeHubAppleTVUpdateWarningViewController setLinkButton:](self, "setLinkButton:", v8);

    -[HUHomeHubAppleTVUpdateWarningViewController linkButton](self, "linkButton");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    _HULocalizedStringWithDefaultValue(CFSTR("HUAppleTVSoftwareUpdateLearnMoreMessage"), CFSTR("HUAppleTVSoftwareUpdateLearnMoreMessage"), 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTitle:forState:", v10, 0);

    -[HUHomeHubAppleTVUpdateWarningViewController linkButton](self, "linkButton");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setAccessibilityIdentifier:", CFSTR("Home.OnboardingView.HomeHubMigration.HUAppleTVUpdateWarning.LearnMoreLink"));

    -[HUHomeHubAppleTVUpdateWarningViewController linkButton](self, "linkButton");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addTarget:action:forControlEvents:", self, sel__openLink_, 64);

    -[HUHomeHubAppleTVUpdateWarningViewController headerView](self, "headerView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUHomeHubAppleTVUpdateWarningViewController linkButton](self, "linkButton");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addAccessoryButton:", v14);

  }
  objc_msgSend(MEMORY[0x1E0D65140], "boldButton");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUHomeHubAppleTVUpdateWarningViewController setCommitButton:](self, "setCommitButton:", v15);

  -[HUHomeHubAppleTVUpdateWarningViewController commitButton](self, "commitButton");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HUHomeHubAppleTVUpdateWarningViewController commitButton](self, "commitButton");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUHomeHubAppleTVUpdateWarningViewController _commitOrContinueButtonTitle](self, "_commitOrContinueButtonTitle");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setTitle:forState:", v18, 0);

  -[HUHomeHubAppleTVUpdateWarningViewController commitButton](self, "commitButton");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setAccessibilityIdentifier:", CFSTR("Home.OnboardingView.HomeHubMigration.HUAppleTVUpdateWarning.CommitOrContinueButton"));

  -[HUHomeHubAppleTVUpdateWarningViewController commitButton](self, "commitButton");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addTarget:action:forControlEvents:", self, sel__continueTapped_, 64);

  -[HUHomeHubAppleTVUpdateWarningViewController buttonTray](self, "buttonTray");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUHomeHubAppleTVUpdateWarningViewController commitButton](self, "commitButton");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "addButton:", v22);

  v23 = objc_alloc(MEMORY[0x1E0CEA380]);
  _HULocalizedStringWithDefaultValue(CFSTR("HUCancelTitle"), CFSTR("HUCancelTitle"), 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)objc_msgSend(v23, "initWithTitle:style:target:action:", v24, 0, self, sel__cancelFlow_);

  objc_msgSend(v25, "setAccessibilityIdentifier:", CFSTR("Home.OnboardingView.HomeHubMigration.HUAppleTVUpdateWarning.CancelButton"));
  -[OBBaseWelcomeController navigationItem](self, "navigationItem");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setRightBarButtonItem:", v25);

  -[HUHomeHubAppleTVUpdateWarningViewController setModalInPresentation:](self, "setModalInPresentation:", 1);
  HFLogForCategory();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v31 = self;
    v32 = 2112;
    v33 = v28;
    _os_log_impl(&dword_1B8E1E000, v27, OS_LOG_TYPE_DEFAULT, "%@:%@: presented: HUHomeHubSharedHomesWarningViewController", buf, 0x16u);

  }
}

- (Class)onboardingFlowClass
{
  return (Class)objc_opt_class();
}

- (id)_commitOrContinueButtonTitle
{
  void *v3;
  void *v4;
  id v5;

  if (-[HUHomeHubAppleTVUpdateWarningViewController blockMigration](self, "blockMigration"))
  {
    _HULocalizedStringWithDefaultValue(CFSTR("HUSoftwareUpdateMigrationUpgradeLaterTitle"), CFSTR("HUSoftwareUpdateMigrationUpgradeLaterTitle"), 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    _HULocalizedStringWithDefaultValue(CFSTR("HUSoftwareUpdateMigrationUpgradeAnyway"), CFSTR("HUSoftwareUpdateMigrationUpgradeAnyway"), 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[HUHomeHubAppleTVUpdateWarningViewController isFinalStep](self, "isFinalStep"))
    {
      v5 = v4;
    }
    else
    {
      _HULocalizedStringWithDefaultValue(CFSTR("HUContinueTitle"), CFSTR("HUContinueTitle"), 1);
      v5 = (id)objc_claimAutoreleasedReturnValue();
    }
    v3 = v5;

  }
  return v3;
}

- (void)_continueTapped:(id)a3
{
  NSObject *v5;
  void *v6;
  _BOOL4 v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  uint8_t buf[4];
  HUHomeHubAppleTVUpdateWarningViewController *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  const __CFString *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[HUHomeHubAppleTVUpdateWarningViewController blockMigration](self, "blockMigration");
    v8 = CFSTR("NO");
    *(_DWORD *)buf = 138412802;
    v14 = self;
    v15 = 2112;
    if (v7)
      v8 = CFSTR("YES");
    v16 = v6;
    v17 = 2112;
    v18 = v8;
    _os_log_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_DEFAULT, "%@:%@ User tapped button, blocking migration: %@", buf, 0x20u);

  }
  if (-[HUHomeHubAppleTVUpdateWarningViewController blockMigration](self, "blockMigration"))
  {
    -[HUHomeHubAppleTVUpdateWarningViewController delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = CFSTR("HUHomeHub2OnboardingKey_UserInput");
    v12 = &unk_1E7040AB0;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "viewController:didFinishWithConfigurationResults:", self, v10);

  }
  else
  {
    -[HUHomeHubAppleTVUpdateWarningViewController _presentConfirmationAlert](self, "_presentConfirmationAlert");
  }
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
  HUHomeHubAppleTVUpdateWarningViewController *v12;
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
  -[HUHomeHubAppleTVUpdateWarningViewController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = CFSTR("HUHomeHub2OnboardingKey_UserInput");
  v10 = &unk_1E7040AB0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "viewController:didFinishWithConfigurationResults:", self, v8);

}

- (void)_commitOrContinue
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  if (-[HUHomeHubAppleTVUpdateWarningViewController isFinalStep](self, "isFinalStep"))
    v3 = 6;
  else
    v3 = 4;
  -[HUHomeHubAppleTVUpdateWarningViewController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = CFSTR("HUHomeHub2OnboardingKey_UserInput");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewController:didFinishWithConfigurationResults:", self, v6);

}

- (void)_presentConfirmationAlert
{
  void *v3;
  __CFString *v4;
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
  _QWORD v15[5];

  -[HUHomeHubAppleTVUpdateWarningViewController appleTVs](self, "appleTVs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v3, "count") <= 1)
    v4 = CFSTR("HUSoftwareUpdateMigrationAppleTVConfirmationDescriptionSingular");
  else
    v4 = CFSTR("HUSoftwareUpdateMigrationAppleTVConfirmationDescriptionPlural");
  _HULocalizedStringWithDefaultValue(v4, v4, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0CEA2E8];
  _HULocalizedStringWithDefaultValue(CFSTR("HUSoftwareUpdateMigrationConfirmationAlertTitle"), CFSTR("HUSoftwareUpdateMigrationConfirmationAlertTitle"), 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "alertControllerWithTitle:message:preferredStyle:", v7, v5, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0CEA2E0];
  _HULocalizedStringWithDefaultValue(CFSTR("HUSoftwareUpdateMigrationConfirmationContinueButton"), CFSTR("HUSoftwareUpdateMigrationConfirmationContinueButton"), 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __72__HUHomeHubAppleTVUpdateWarningViewController__presentConfirmationAlert__block_invoke;
  v15[3] = &unk_1E6F4C6E0;
  v15[4] = self;
  objc_msgSend(v9, "actionWithTitle:style:handler:", v10, 0, v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x1E0CEA2E0];
  _HULocalizedStringWithDefaultValue(CFSTR("HUCancelTitle"), CFSTR("HUCancelTitle"), 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "actionWithTitle:style:handler:", v13, 1, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "addAction:", v11);
  objc_msgSend(v8, "addAction:", v14);
  -[HUHomeHubAppleTVUpdateWarningViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v8, 1, 0);

}

uint64_t __72__HUHomeHubAppleTVUpdateWarningViewController__presentConfirmationAlert__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_commitOrContinue");
}

- (void)_openLink:(id)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  HUHomeHubAppleTVUpdateWarningViewController *v9;
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
  objc_msgSend(MEMORY[0x1E0C99E98], "hf_learnToUpdateAppleTVURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUHomeHubAppleTVUpdateWarningViewController _openURL:](self, "_openURL:", v7);

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

  -[HUHomeHubAppleTVUpdateWarningViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v7, 1, 0);
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

- (BOOL)blockMigration
{
  return self->_blockMigration;
}

- (void)setBlockMigration:(BOOL)a3
{
  self->_blockMigration = a3;
}

- (NSArray)appleTVs
{
  return self->_appleTVs;
}

- (void)setAppleTVs:(id)a3
{
  objc_storeStrong((id *)&self->_appleTVs, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appleTVs, 0);
  objc_storeStrong((id *)&self->_commitButton, 0);
  objc_storeStrong((id *)&self->_linkButton, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
