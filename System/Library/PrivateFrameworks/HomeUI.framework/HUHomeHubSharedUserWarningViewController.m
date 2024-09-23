@implementation HUHomeHubSharedUserWarningViewController

- (HUHomeHubSharedUserWarningViewController)initWithHomesToUsersMap:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  HUHomeHubSharedUserWarningItemManager *v7;
  HUHomeHubSharedUserWarningTableViewController *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  HUHomeHubSharedUserWarningViewController *v17;
  void *v18;
  void *v19;
  objc_super v21;
  _QWORD v22[5];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  __CFString *v28;

  v4 = a3;
  v5 = objc_msgSend(v4, "count");
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__27;
  v27 = __Block_byref_object_dispose__27;
  v28 = &stru_1E6F60E80;
  if (v5 <= 1)
  {
    objc_msgSend(v4, "keyEnumerator");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __68__HUHomeHubSharedUserWarningViewController_initWithHomesToUsersMap___block_invoke;
    v22[3] = &unk_1E6F5C260;
    v22[4] = &v23;
    objc_msgSend(v6, "na_each:", v22);

  }
  v7 = -[HUHomeHubSharedUserWarningItemManager initWithDelegate:homesToUsersMap:]([HUHomeHubSharedUserWarningItemManager alloc], "initWithDelegate:homesToUsersMap:", self, v4);
  v8 = -[HUItemTableViewController initWithItemManager:tableViewStyle:]([HUHomeHubSharedUserWarningTableViewController alloc], "initWithItemManager:tableViewStyle:", v7, 1);
  _HULocalizedStringWithDefaultValue(CFSTR("HUSoftwareUpdateSharedUsersWarningTitle"), CFSTR("HUSoftwareUpdateSharedUsersWarningTitle"), 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 >= 2)
    _HULocalizedStringWithDefaultValue(CFSTR("HUSoftwareUpdateSharedUsersWarningDescriptionMultipleHomes"), CFSTR("HUSoftwareUpdateSharedUsersWarningDescriptionMultipleHomes"), 1);
  else
    HULocalizedStringWithFormat(CFSTR("HUSoftwareUpdateSharedUsersWarningDescriptionOneHome"), CFSTR("%@"), v9, v10, v11, v12, v13, v14, v24[5]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v21.receiver = self;
  v21.super_class = (Class)HUHomeHubSharedUserWarningViewController;
  v17 = -[HUItemTableOBWelcomeController initWithTitle:detailText:icon:contentLayout:itemTableViewController:](&v21, sel_initWithTitle_detailText_icon_contentLayout_itemTableViewController_, v15, v16, 0, 2, v8);
  if (v17)
  {
    if (v5 >= 2)
      _HULocalizedStringWithDefaultValue(CFSTR("HUSoftwareUpdatePersonalDeviceWarningCaptionPluralHomes"), CFSTR("HUSoftwareUpdatePersonalDeviceWarningCaptionPluralHomes"), 1);
    else
      _HULocalizedStringWithDefaultValue(CFSTR("HUSoftwareUpdatePersonalDeviceWarningCaption"), CFSTR("HUSoftwareUpdatePersonalDeviceWarningCaption"), 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&v17->_captionString, v18);

    if (v5 > 1)
      _HULocalizedStringWithDefaultValue(CFSTR("HUSoftwareUpdateMigrationSharedUserConfirmationDescriptionPluralHomes"), CFSTR("HUSoftwareUpdateMigrationSharedUserConfirmationDescriptionPluralHomes"), 1);
    else
      _HULocalizedStringWithDefaultValue(CFSTR("HUSoftwareUpdateMigrationSharedUserConfirmationDescription"), CFSTR("HUSoftwareUpdateMigrationSharedUserConfirmationDescription"), 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&v17->_confirmationString, v19);

  }
  _Block_object_dispose(&v23, 8);

  return v17;
}

void __68__HUHomeHubSharedUserWarningViewController_initWithHomesToUsersMap___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "hf_displayName");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

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
  HUHomeHubSharedUserWarningViewController *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v24.receiver = self;
  v24.super_class = (Class)HUHomeHubSharedUserWarningViewController;
  -[HUItemTableOBWelcomeController viewDidLoad](&v24, sel_viewDidLoad);
  -[HUHomeHubSharedUserWarningViewController headerView](self, "headerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subviews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[HUAccessibilityIdentifierUtilities setAccessibilityIDForViews:withIDDictionary:](HUAccessibilityIdentifierUtilities, "setAccessibilityIDForViews:withIDDictionary:", v5, &unk_1E7043298);

  -[HUHomeHubSharedUserWarningViewController buttonTray](self, "buttonTray");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUHomeHubSharedUserWarningViewController captionString](self, "captionString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addCaptionText:", v7);

  objc_msgSend(MEMORY[0x1E0D65140], "boldButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUHomeHubSharedUserWarningViewController setCommitButton:](self, "setCommitButton:", v8);

  -[HUHomeHubSharedUserWarningViewController commitButton](self, "commitButton");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HUHomeHubSharedUserWarningViewController commitButton](self, "commitButton");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUHomeHubSharedUserWarningViewController _commitOrContinueButtonTitle](self, "_commitOrContinueButtonTitle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTitle:forState:", v11, 0);

  -[HUHomeHubSharedUserWarningViewController commitButton](self, "commitButton");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setAccessibilityIdentifier:", CFSTR("Home.OnboardingView.HomeHubMigration.HUHomeHubSharedUserWarningViewController.CommitOrContinueButton"));

  -[HUHomeHubSharedUserWarningViewController commitButton](self, "commitButton");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addTarget:action:forControlEvents:", self, sel__continueTapped_, 64);

  -[HUHomeHubSharedUserWarningViewController buttonTray](self, "buttonTray");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUHomeHubSharedUserWarningViewController commitButton](self, "commitButton");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addButton:", v15);

  v16 = objc_alloc(MEMORY[0x1E0CEA380]);
  _HULocalizedStringWithDefaultValue(CFSTR("HUCancelTitle"), CFSTR("HUCancelTitle"), 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v16, "initWithTitle:style:target:action:", v17, 0, self, sel__cancelFlow_);
  -[HUHomeHubSharedUserWarningViewController setCancelButton:](self, "setCancelButton:", v18);

  -[HUHomeHubSharedUserWarningViewController cancelButton](self, "cancelButton");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setAccessibilityIdentifier:", CFSTR("Home.OnboardingView.HomeHubMigration.HUHomeHubSharedUserWarningViewController.CancelButton"));

  -[OBBaseWelcomeController navigationItem](self, "navigationItem");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUHomeHubSharedUserWarningViewController cancelButton](self, "cancelButton");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setRightBarButtonItem:", v21);

  -[HUHomeHubSharedUserWarningViewController setModalInPresentation:](self, "setModalInPresentation:", 1);
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
    _os_log_impl(&dword_1B8E1E000, v22, OS_LOG_TYPE_DEFAULT, "%@:%@: presented: HUHomeHubSharedUserWarningViewController", buf, 0x16u);

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
  if (-[HUHomeHubSharedUserWarningViewController isFinalStep](self, "isFinalStep"))
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
  HUHomeHubSharedUserWarningViewController *v8;
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
  -[HUHomeHubSharedUserWarningViewController _presentConfirmationAlert](self, "_presentConfirmationAlert");
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
  HUHomeHubSharedUserWarningViewController *v12;
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
  -[HUHomeHubSharedUserWarningViewController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = CFSTR("HUHomeHub2OnboardingKey_UserInput");
  v10 = &unk_1E7041728;
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
  if (-[HUHomeHubSharedUserWarningViewController isFinalStep](self, "isFinalStep"))
    v3 = 6;
  else
    v3 = 2;
  -[HUHomeHubSharedUserWarningViewController delegate](self, "delegate");
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
  -[HUHomeHubSharedUserWarningViewController confirmationString](self, "confirmationString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "alertControllerWithTitle:message:preferredStyle:", v4, v5, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0CEA2E0];
  _HULocalizedStringWithDefaultValue(CFSTR("HUSoftwareUpdateMigrationConfirmationContinueButton"), CFSTR("HUSoftwareUpdateMigrationConfirmationContinueButton"), 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __69__HUHomeHubSharedUserWarningViewController__presentConfirmationAlert__block_invoke;
  v13[3] = &unk_1E6F4C6E0;
  v13[4] = self;
  objc_msgSend(v7, "actionWithTitle:style:handler:", v8, 0, v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0CEA2E0];
  _HULocalizedStringWithDefaultValue(CFSTR("HUCancelTitle"), CFSTR("HUCancelTitle"), 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "actionWithTitle:style:handler:", v11, 1, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "addAction:", v9);
  objc_msgSend(v6, "addAction:", v12);
  -[HUHomeHubSharedUserWarningViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v6, 1, 0);

}

uint64_t __69__HUHomeHubSharedUserWarningViewController__presentConfirmationAlert__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_commitOrContinue");
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
