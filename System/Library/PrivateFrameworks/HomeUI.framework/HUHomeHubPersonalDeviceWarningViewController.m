@implementation HUHomeHubPersonalDeviceWarningViewController

- (HUHomeHubPersonalDeviceWarningViewController)initWithDevices:(id)a3 homes:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  void *v9;
  __CFString *v10;
  HUHomeHubPersonalDeviceWarningItemManager *v11;
  HUHomeHubSimpleTableViewController *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  HUHomeHubPersonalDeviceWarningViewController *v21;
  __CFString *v22;
  void *v23;
  __CFString *v24;
  void *v25;
  objc_super v27;

  v6 = a4;
  v7 = a3;
  v8 = objc_msgSend(v6, "count");
  if (v8 > 1)
  {
    v10 = &stru_1E6F60E80;
  }
  else
  {
    objc_msgSend(v6, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "hf_displayName");
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  v11 = -[HUHomeHubPersonalDeviceWarningItemManager initWithDelegate:devices:]([HUHomeHubPersonalDeviceWarningItemManager alloc], "initWithDelegate:devices:", self, v7);

  v12 = -[HUItemTableViewController initWithItemManager:tableViewStyle:]([HUHomeHubSimpleTableViewController alloc], "initWithItemManager:tableViewStyle:", v11, 1);
  _HULocalizedStringWithDefaultValue(CFSTR("HUSoftwareUpdatePersonalDeviceWarningTitle"), CFSTR("HUSoftwareUpdatePersonalDeviceWarningTitle"), 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 > 1)
    _HULocalizedStringWithDefaultValue(CFSTR("HUSoftwareUpdatePersonalDeviceWarningDescriptionPlural"), CFSTR("HUSoftwareUpdatePersonalDeviceWarningDescriptionPlural"), 1);
  else
    HULocalizedStringWithFormat(CFSTR("HUSoftwareUpdatePersonalDeviceWarningDescription"), CFSTR("%@"), v13, v14, v15, v16, v17, v18, (uint64_t)v10);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v27.receiver = self;
  v27.super_class = (Class)HUHomeHubPersonalDeviceWarningViewController;
  v21 = -[HUItemTableOBWelcomeController initWithTitle:detailText:icon:contentLayout:itemTableViewController:](&v27, sel_initWithTitle_detailText_icon_contentLayout_itemTableViewController_, v19, v20, 0, 2, v12);
  if (v21)
  {
    if (v8 >= 2)
      v22 = CFSTR("HUSoftwareUpdatePersonalDeviceWarningCaptionPluralHomes");
    else
      v22 = CFSTR("HUSoftwareUpdatePersonalDeviceWarningCaption");
    _HULocalizedStringWithDefaultValue(v22, v22, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&v21->_captionString, v23);

    if (v8 > 1)
      v24 = CFSTR("HUSoftwareUpdateMigrationPersonalDeviceConfirmationDescriptionPluralHomes");
    else
      v24 = CFSTR("HUSoftwareUpdateMigrationPersonalDeviceConfirmationDescription");
    _HULocalizedStringWithDefaultValue(v24, v24, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&v21->_confirmationString, v25);

  }
  return v21;
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
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  objc_super v24;
  uint8_t buf[4];
  HUHomeHubPersonalDeviceWarningViewController *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v24.receiver = self;
  v24.super_class = (Class)HUHomeHubPersonalDeviceWarningViewController;
  -[HUItemTableOBWelcomeController viewDidLoad](&v24, sel_viewDidLoad);
  -[HUHomeHubPersonalDeviceWarningViewController headerView](self, "headerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subviews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[HUAccessibilityIdentifierUtilities setAccessibilityIDForViews:withIDDictionary:](HUAccessibilityIdentifierUtilities, "setAccessibilityIDForViews:withIDDictionary:", v5, &unk_1E7042F28);

  -[HUHomeHubPersonalDeviceWarningViewController buttonTray](self, "buttonTray");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUHomeHubPersonalDeviceWarningViewController captionString](self, "captionString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addCaptionText:", v7);

  objc_msgSend(MEMORY[0x1E0D65140], "boldButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUHomeHubPersonalDeviceWarningViewController setCommitButton:](self, "setCommitButton:", v8);

  -[HUHomeHubPersonalDeviceWarningViewController commitButton](self, "commitButton");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HUHomeHubPersonalDeviceWarningViewController commitButton](self, "commitButton");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUHomeHubPersonalDeviceWarningViewController _commitOrContinueButtonTitle](self, "_commitOrContinueButtonTitle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTitle:forState:", v11, 0);

  -[HUHomeHubPersonalDeviceWarningViewController commitButton](self, "commitButton");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setAccessibilityIdentifier:", CFSTR("Home.OnboardingView.HomeHubMigration.HUHomeHubPersonalDeviceWarning.CommitOrContinueButton"));

  -[HUHomeHubPersonalDeviceWarningViewController commitButton](self, "commitButton");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addTarget:action:forControlEvents:", self, sel__continueTapped_, 64);

  -[HUHomeHubPersonalDeviceWarningViewController buttonTray](self, "buttonTray");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUHomeHubPersonalDeviceWarningViewController commitButton](self, "commitButton");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addButton:", v15);

  v16 = objc_alloc(MEMORY[0x1E0CEA380]);
  _HULocalizedStringWithDefaultValue(CFSTR("HUCancelTitle"), CFSTR("HUCancelTitle"), 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v16, "initWithTitle:style:target:action:", v17, 0, self, sel__cancelFlow_);
  -[HUHomeHubPersonalDeviceWarningViewController setCancelButton:](self, "setCancelButton:", v18);

  -[HUHomeHubPersonalDeviceWarningViewController cancelButton](self, "cancelButton");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setAccessibilityIdentifier:", CFSTR("Home.OnboardingView.HomeHubMigration.HUHomeHubPersonalDeviceWarning.CancelButton"));

  -[OBBaseWelcomeController navigationItem](self, "navigationItem");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUHomeHubPersonalDeviceWarningViewController cancelButton](self, "cancelButton");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setRightBarButtonItem:", v21);

  -[HUHomeHubPersonalDeviceWarningViewController setModalInPresentation:](self, "setModalInPresentation:", 1);
  HFLogForCategory();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v26 = self;
    v27 = 2112;
    v28 = v23;
    _os_log_impl(&dword_1B8E1E000, v22, OS_LOG_TYPE_DEFAULT, "%@:%@: presented: HUHomeHubPersonalDeviceWarningViewController", buf, 0x16u);

  }
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
  if (-[HUHomeHubPersonalDeviceWarningViewController isFinalStep](self, "isFinalStep"))
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

- (void)_continueTapped:(id)a3
{
  NSObject *v5;
  void *v6;
  int v7;
  HUHomeHubPersonalDeviceWarningViewController *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412546;
    v8 = self;
    v9 = 2112;
    v10 = v6;
    _os_log_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_DEFAULT, "%@:%@ User tapped button", (uint8_t *)&v7, 0x16u);

  }
  -[HUHomeHubPersonalDeviceWarningViewController _presentConfirmationAlert](self, "_presentConfirmationAlert");
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
  HUHomeHubPersonalDeviceWarningViewController *v12;
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
  -[HUHomeHubPersonalDeviceWarningViewController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = CFSTR("HUHomeHub2OnboardingKey_UserInput");
  v10 = &unk_1E70409D8;
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
  if (-[HUHomeHubPersonalDeviceWarningViewController isFinalStep](self, "isFinalStep"))
    v3 = 6;
  else
    v3 = 1;
  -[HUHomeHubPersonalDeviceWarningViewController delegate](self, "delegate");
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
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];

  v3 = (void *)MEMORY[0x1E0CEA2E8];
  _HULocalizedStringWithDefaultValue(CFSTR("HUSoftwareUpdateMigrationConfirmationAlertTitle"), CFSTR("HUSoftwareUpdateMigrationConfirmationAlertTitle"), 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUHomeHubPersonalDeviceWarningViewController confirmationString](self, "confirmationString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "alertControllerWithTitle:message:preferredStyle:", v4, v5, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0CEA2E0];
  _HULocalizedStringWithDefaultValue(CFSTR("HUSoftwareUpdateMigrationConfirmationContinueButton"), CFSTR("HUSoftwareUpdateMigrationConfirmationContinueButton"), 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __73__HUHomeHubPersonalDeviceWarningViewController__presentConfirmationAlert__block_invoke;
  v13[3] = &unk_1E6F4C6E0;
  v13[4] = self;
  objc_msgSend(v7, "actionWithTitle:style:handler:", v8, 0, v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0CEA2E0];
  _HULocalizedStringWithDefaultValue(CFSTR("HUCancelTitle"), CFSTR("HUCancelTitle"), 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "actionWithTitle:style:handler:", v11, 1, &__block_literal_global_69);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "addAction:", v9);
  objc_msgSend(v6, "addAction:", v12);
  -[HUHomeHubPersonalDeviceWarningViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v6, 1, 0);

}

void __73__HUHomeHubPersonalDeviceWarningViewController__presentConfirmationAlert__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  const char *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v3, "title");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 136315394;
    v7 = "-[HUHomeHubPersonalDeviceWarningViewController _presentConfirmationAlert]_block_invoke";
    v8 = 2112;
    v9 = v5;
    _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "(%s) User tapped software update migration confirmation continue button '%@' from the alert popup", (uint8_t *)&v6, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 32), "_commitOrContinue");

}

void __73__HUHomeHubPersonalDeviceWarningViewController__presentConfirmationAlert__block_invoke_57()
{
  NSObject *v0;
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    v1 = 136315138;
    v2 = "-[HUHomeHubPersonalDeviceWarningViewController _presentConfirmationAlert]_block_invoke";
    _os_log_impl(&dword_1B8E1E000, v0, OS_LOG_TYPE_DEFAULT, "(%s) User tapped cancel button from the alert popup", (uint8_t *)&v1, 0xCu);
  }

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

- (OBBoldTrayButton)commitButton
{
  return self->_commitButton;
}

- (void)setCommitButton:(id)a3
{
  objc_storeStrong((id *)&self->_commitButton, a3);
}

- (UIBarButtonItem)cancelButton
{
  return self->_cancelButton;
}

- (void)setCancelButton:(id)a3
{
  objc_storeStrong((id *)&self->_cancelButton, a3);
}

- (NSString)captionString
{
  return self->_captionString;
}

- (void)setCaptionString:(id)a3
{
  objc_storeStrong((id *)&self->_captionString, a3);
}

- (NSString)confirmationString
{
  return self->_confirmationString;
}

- (void)setConfirmationString:(id)a3
{
  objc_storeStrong((id *)&self->_confirmationString, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_confirmationString, 0);
  objc_storeStrong((id *)&self->_captionString, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_commitButton, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
