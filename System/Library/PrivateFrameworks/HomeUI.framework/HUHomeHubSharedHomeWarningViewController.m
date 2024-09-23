@implementation HUHomeHubSharedHomeWarningViewController

- (HUHomeHubSharedHomeWarningViewController)initWithSharedHomes:(id)a3
{
  id v5;
  HUHomeHubSharedHomeWarningItemManager *v6;
  HUHomeHubSimpleTableViewController *v7;
  __CFString *v8;
  void *v9;
  __CFString *v10;
  void *v11;
  HUHomeHubSharedHomeWarningViewController *v12;
  HUHomeHubSharedHomeWarningViewController *v13;
  objc_super v15;

  v5 = a3;
  v6 = -[HUHomeHubSharedHomeWarningItemManager initWithDelegate:homes:]([HUHomeHubSharedHomeWarningItemManager alloc], "initWithDelegate:homes:", self, v5);
  v7 = -[HUHomeHubSimpleTableViewController initWithItemManager:tableViewStyle:descriptionStringWithFormatKey:]([HUHomeHubSimpleTableViewController alloc], "initWithItemManager:tableViewStyle:descriptionStringWithFormatKey:", v6, 1, CFSTR("HUSoftwareUpdateSharedHomesWarningSharedBySecondaryText"));
  if ((unint64_t)objc_msgSend(v5, "count") >= 2)
    v8 = CFSTR("HUSoftwareUpdateSharedHomesWarningTitlePlural");
  else
    v8 = CFSTR("HUSoftwareUpdateSharedHomesWarningTitle");
  _HULocalizedStringWithDefaultValue(v8, v8, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v5, "count") >= 2)
    v10 = CFSTR("HUSoftwareUpdateSharedHomesWarningDescriptionPlural");
  else
    v10 = CFSTR("HUSoftwareUpdateSharedHomesWarningDescription");
  _HULocalizedStringWithDefaultValue(v10, v10, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15.receiver = self;
  v15.super_class = (Class)HUHomeHubSharedHomeWarningViewController;
  v12 = -[HUItemTableOBWelcomeController initWithTitle:detailText:icon:contentLayout:itemTableViewController:](&v15, sel_initWithTitle_detailText_icon_contentLayout_itemTableViewController_, v9, v11, 0, 2, v7);
  v13 = v12;
  if (v12)
    objc_storeStrong((id *)&v12->_homes, a3);

  return v13;
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
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  objc_super v18;
  uint8_t buf[4];
  HUHomeHubSharedHomeWarningViewController *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v18.receiver = self;
  v18.super_class = (Class)HUHomeHubSharedHomeWarningViewController;
  -[HUItemTableOBWelcomeController viewDidLoad](&v18, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x1E0D65140], "boldButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUHomeHubSharedHomeWarningViewController setCommitButton:](self, "setCommitButton:", v4);

  -[HUHomeHubSharedHomeWarningViewController commitButton](self, "commitButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HUHomeHubSharedHomeWarningViewController commitButton](self, "commitButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUHomeHubSharedHomeWarningViewController _commitOrContinueButtonTitle](self, "_commitOrContinueButtonTitle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTitle:forState:", v7, 0);

  -[HUHomeHubSharedHomeWarningViewController commitButton](self, "commitButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addTarget:action:forControlEvents:", self, sel__continueTapped_, 64);

  -[HUHomeHubSharedHomeWarningViewController buttonTray](self, "buttonTray");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUHomeHubSharedHomeWarningViewController commitButton](self, "commitButton");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addButton:", v10);

  v11 = objc_alloc(MEMORY[0x1E0CEA380]);
  _HULocalizedStringWithDefaultValue(CFSTR("HUCancelTitle"), CFSTR("HUCancelTitle"), 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v11, "initWithTitle:style:target:action:", v12, 0, self, sel__cancelFlow_);
  -[HUHomeHubSharedHomeWarningViewController setCancelButton:](self, "setCancelButton:", v13);

  -[OBBaseWelcomeController navigationItem](self, "navigationItem");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUHomeHubSharedHomeWarningViewController cancelButton](self, "cancelButton");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setRightBarButtonItem:", v15);

  -[HUHomeHubSharedHomeWarningViewController setModalInPresentation:](self, "setModalInPresentation:", 1);
  HFLogForCategory();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v20 = self;
    v21 = 2112;
    v22 = v17;
    _os_log_impl(&dword_1B8E1E000, v16, OS_LOG_TYPE_DEFAULT, "%@:%@: presented: HUHomeHubSharedHomesWarningViewController", buf, 0x16u);

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
  if (-[HUHomeHubSharedHomeWarningViewController isFinalStep](self, "isFinalStep"))
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
  HUHomeHubSharedHomeWarningViewController *v8;
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
  -[HUHomeHubSharedHomeWarningViewController _presentConfirmationAlert](self, "_presentConfirmationAlert");
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
  HUHomeHubSharedHomeWarningViewController *v12;
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
  -[HUHomeHubSharedHomeWarningViewController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = CFSTR("HUHomeHub2OnboardingKey_UserInput");
  v10 = &unk_1E70409F0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "viewController:didFinishWithConfigurationResults:", self, v8);

}

- (void)_commitOrContinue
{
  void *v3;
  void *v4;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  if (-[HUHomeHubSharedHomeWarningViewController isFinalStep](self, "isFinalStep"))
  {
    -[HUHomeHubSharedHomeWarningViewController delegate](self, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = CFSTR("HUHomeHub2OnboardingKey_UserInput");
    v6[0] = &unk_1E7040A08;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "viewController:didFinishWithConfigurationResults:", self, v4);

  }
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

  -[HUHomeHubSharedHomeWarningViewController homes](self, "homes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v3, "count") <= 1)
    v4 = CFSTR("HUSoftwareUpdateMigrationSharedHomeConfirmationDescriptionSingular");
  else
    v4 = CFSTR("HUSoftwareUpdateMigrationSharedHomeConfirmationDescriptionPlural");
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
  v15[2] = __69__HUHomeHubSharedHomeWarningViewController__presentConfirmationAlert__block_invoke;
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
  -[HUHomeHubSharedHomeWarningViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v8, 1, 0);

}

uint64_t __69__HUHomeHubSharedHomeWarningViewController__presentConfirmationAlert__block_invoke(uint64_t a1)
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

- (NSSet)homes
{
  return self->_homes;
}

- (void)setHomes:(id)a3
{
  objc_storeStrong((id *)&self->_homes, a3);
}

- (UIBarButtonItem)cancelButton
{
  return self->_cancelButton;
}

- (void)setCancelButton:(id)a3
{
  objc_storeStrong((id *)&self->_cancelButton, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_homes, 0);
  objc_storeStrong((id *)&self->_commitButton, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
