@implementation HUHomeHubMigrationFailedViewController

- (HUHomeHubMigrationFailedViewController)init
{
  void *v3;
  HUHomeHubMigrationFailedViewController *v4;

  _HULocalizedStringWithDefaultValue(CFSTR("HUSoftwareUpdateMigrationFailedDescription"), CFSTR("HUSoftwareUpdateMigrationFailedDescription"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[HUHomeHubMigrationFailedViewController initWithDetailText:](self, "initWithDetailText:", v3);

  return v4;
}

- (HUHomeHubMigrationFailedViewController)initWithDetailText:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  HUHomeHubMigrationFailedViewController *v14;
  objc_super v16;

  v4 = (void *)MEMORY[0x1E0CEA650];
  v5 = (void *)MEMORY[0x1E0CEA478];
  v6 = a3;
  objc_msgSend(v5, "hf_keyColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "configurationWithHierarchicalColor:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithPointSize:", 100.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "configurationByApplyingConfiguration:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("exclamationmark.triangle.fill"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "imageWithConfiguration:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  _HULocalizedStringWithDefaultValue(CFSTR("HUSoftwareUpdateMigrationFailedTitle"), CFSTR("HUSoftwareUpdateMigrationFailedTitle"), 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16.receiver = self;
  v16.super_class = (Class)HUHomeHubMigrationFailedViewController;
  v14 = -[HUImageOBWelcomeController initWithTitle:detailText:icon:contentImage:](&v16, sel_initWithTitle_detailText_icon_contentImage_, v13, v6, 0, v12);

  return v14;
}

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
  void *v12;
  void *v13;
  objc_super v14;

  -[HUHomeHubMigrationFailedViewController headerView](self, "headerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "subviews");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[HUAccessibilityIdentifierUtilities setAccessibilityIDForViews:withIDDictionary:](HUAccessibilityIdentifierUtilities, "setAccessibilityIDForViews:withIDDictionary:", v4, &unk_1E70431D0);

  v14.receiver = self;
  v14.super_class = (Class)HUHomeHubMigrationFailedViewController;
  -[HUImageOBWelcomeController viewDidLoad](&v14, sel_viewDidLoad);
  -[OBBaseWelcomeController navigationItem](self, "navigationItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHidesBackButton:animated:", 1, 0);

  objc_msgSend(MEMORY[0x1E0D65140], "boldButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUHomeHubMigrationFailedViewController setCommitButton:](self, "setCommitButton:", v6);

  -[HUHomeHubMigrationFailedViewController commitButton](self, "commitButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HUHomeHubMigrationFailedViewController commitButton](self, "commitButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  _HULocalizedStringWithDefaultValue(CFSTR("HUDoneTitle"), CFSTR("HUDoneTitle"), 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTitle:forState:", v9, 0);

  -[HUHomeHubMigrationFailedViewController commitButton](self, "commitButton");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAccessibilityIdentifier:", CFSTR("Home.OnboardingView.HomeHubMigration.Failed.DoneButton"));

  -[HUHomeHubMigrationFailedViewController commitButton](self, "commitButton");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addTarget:action:forControlEvents:", self, sel__doneAction_, 64);

  -[HUHomeHubMigrationFailedViewController buttonTray](self, "buttonTray");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUHomeHubMigrationFailedViewController commitButton](self, "commitButton");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addButton:", v13);

}

- (BOOL)_limitToNonScrollingContentHeight
{
  return 1;
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
  -[HUHomeHubMigrationFailedViewController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = CFSTR("HUHomeHub2OnboardingKey_UserInput");
  v7[0] = &unk_1E7041548;
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
