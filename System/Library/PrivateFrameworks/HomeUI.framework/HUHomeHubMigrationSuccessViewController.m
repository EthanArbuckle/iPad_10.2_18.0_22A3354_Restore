@implementation HUHomeHubMigrationSuccessViewController

- (void)viewDidLoad
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
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)HUHomeHubMigrationSuccessViewController;
  -[OBBaseWelcomeController viewDidLoad](&v12, sel_viewDidLoad);
  -[OBBaseWelcomeController navigationItem](self, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidesBackButton:animated:", 1, 0);

  objc_msgSend(MEMORY[0x1E0D65140], "boldButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUHomeHubMigrationSuccessViewController setCommitButton:](self, "setCommitButton:", v4);

  -[HUHomeHubMigrationSuccessViewController commitButton](self, "commitButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HUHomeHubMigrationSuccessViewController commitButton](self, "commitButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _HULocalizedStringWithDefaultValue(CFSTR("HUDoneTitle"), CFSTR("HUDoneTitle"), 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTitle:forState:", v7, 0);

  -[HUHomeHubMigrationSuccessViewController commitButton](self, "commitButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAccessibilityIdentifier:", CFSTR("Home.OnboardingView.HomeHubMigration.Success.DoneButton"));

  -[HUHomeHubMigrationSuccessViewController commitButton](self, "commitButton");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addTarget:action:forControlEvents:", self, sel__doneAction_, 64);

  -[HUHomeHubMigrationSuccessViewController buttonTray](self, "buttonTray");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUHomeHubMigrationSuccessViewController commitButton](self, "commitButton");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addButton:", v11);

}

- (Class)onboardingFlowClass
{
  return (Class)objc_opt_class();
}

- (void)_doneAction:(id)a3
{
  void *v4;
  void *v5;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  -[HUHomeHubMigrationSuccessViewController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = CFSTR("HUHomeHub2OnboardingKey_UserInput");
  v7[0] = &unk_1E70412F0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewController:didFinishWithConfigurationResults:", self, v5);

}

- (HUConfigurationViewControllerDelegate)delegate
{
  return (HUConfigurationViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
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
  objc_destroyWeak((id *)&self->_delegate);
}

@end
