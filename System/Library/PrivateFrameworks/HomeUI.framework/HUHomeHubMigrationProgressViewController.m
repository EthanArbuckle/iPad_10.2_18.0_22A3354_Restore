@implementation HUHomeHubMigrationProgressViewController

- (HUHomeHubMigrationProgressViewController)initWithOwnedHomes:(id)a3
{
  id v4;
  __CFString *v5;
  void *v6;
  unint64_t v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  HUHomeHubMigrationProgressViewController *v17;
  void *v18;
  objc_super v20;

  v4 = a3;
  if ((unint64_t)objc_msgSend(v4, "count") <= 1)
    v5 = CFSTR("HUSoftwareUpdateMigrationInProgressTitleSingluar");
  else
    v5 = CFSTR("HUSoftwareUpdateMigrationInProgressTitlePlural");
  _HULocalizedStringWithDefaultValue(v5, v5, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "count");

  if (v7 >= 2)
    v8 = CFSTR("HUSoftwareUpdateMigrationInProgressDescriptionPlural");
  else
    v8 = CFSTR("HUSoftwareUpdateMigrationInProgressDescriptionSingluar");
  _HULocalizedStringWithDefaultValue(v8, v8, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0CEA650];
  objc_msgSend(MEMORY[0x1E0CEA478], "hf_keyColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "configurationWithHierarchicalColor:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithPointSize:", 100.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "configurationByApplyingConfiguration:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("homekit"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "imageWithConfiguration:", v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v20.receiver = self;
  v20.super_class = (Class)HUHomeHubMigrationProgressViewController;
  v17 = -[HUImageOBWelcomeController initWithTitle:detailText:icon:contentImage:](&v20, sel_initWithTitle_detailText_icon_contentImage_, v6, v9, 0, v16);
  if (v17)
  {
    objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addHomeManagerObserver:", v17);

  }
  return v17;
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
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  objc_super v29;
  uint8_t buf[4];
  HUHomeHubMigrationProgressViewController *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v29.receiver = self;
  v29.super_class = (Class)HUHomeHubMigrationProgressViewController;
  -[HUImageOBWelcomeController viewDidLoad](&v29, sel_viewDidLoad);
  -[HUHomeHubMigrationProgressViewController headerView](self, "headerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subviews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[HUAccessibilityIdentifierUtilities setAccessibilityIDForViews:withIDDictionary:](HUAccessibilityIdentifierUtilities, "setAccessibilityIDForViews:withIDDictionary:", v5, &unk_1E7043068);

  -[OBBaseWelcomeController navigationItem](self, "navigationItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHidesBackButton:", 1);

  -[HUHomeHubMigrationProgressViewController setModalInPresentation:](self, "setModalInPresentation:", 1);
  -[HUHomeHubMigrationProgressViewController _startHH2Upgrade](self, "_startHH2Upgrade");
  -[HUHomeHubMigrationProgressViewController buttonTray](self, "buttonTray");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addCaptionText:", CFSTR(" "));

  objc_msgSend(MEMORY[0x1E0D65140], "boldButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v8, "setHidden:", 1);
  -[HUHomeHubMigrationProgressViewController buttonTray](self, "buttonTray");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addButton:", v8);

  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA2C8]), "initWithActivityIndicatorStyle:", 101);
  -[HUHomeHubMigrationProgressViewController setSpinner:](self, "setSpinner:", v10);

  -[HUHomeHubMigrationProgressViewController spinner](self, "spinner");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HUHomeHubMigrationProgressViewController spinner](self, "spinner");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "sizeToFit");

  -[HUHomeHubMigrationProgressViewController spinner](self, "spinner");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "startAnimating");

  -[HUHomeHubMigrationProgressViewController spinner](self, "spinner");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setAccessibilityIdentifier:", CFSTR("Home.OnboardingView.HomeHubMigration.Progress.Spinner"));

  -[HUHomeHubMigrationProgressViewController buttonTray](self, "buttonTray");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUHomeHubMigrationProgressViewController spinner](self, "spinner");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addSubview:", v16);

  -[HUHomeHubMigrationProgressViewController spinner](self, "spinner");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "centerXAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUHomeHubMigrationProgressViewController buttonTray](self, "buttonTray");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "centerXAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintEqualToAnchor:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setActive:", 1);

  -[HUHomeHubMigrationProgressViewController spinner](self, "spinner");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "topAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUHomeHubMigrationProgressViewController buttonTray](self, "buttonTray");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "topAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "constraintEqualToAnchor:constant:", v25, 20.0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setActive:", 1);

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
    _os_log_impl(&dword_1B8E1E000, v27, OS_LOG_TYPE_DEFAULT, "%@:%@: presented: HUHomeHubMigrationProgressViewController", buf, 0x16u);

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

- (void)homeManager:(id)a3 didUpdateHH2State:(BOOL)a4
{
  _BOOL4 v4;
  NSObject *v7;
  void *v8;
  int v9;
  HUHomeHubMigrationProgressViewController *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  _BOOL4 v14;
  uint64_t v15;

  v4 = a4;
  v15 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412802;
    v10 = self;
    v11 = 2112;
    v12 = v8;
    v13 = 1024;
    v14 = v4;
    _os_log_impl(&dword_1B8E1E000, v7, OS_LOG_TYPE_DEFAULT, "%@:%@: Migration Completed - didUpdateHH2State = %{BOOL}d", (uint8_t *)&v9, 0x1Cu);

  }
  if (v4)
    -[HUHomeHubMigrationProgressViewController _handleSuccessfulMigration](self, "_handleSuccessfulMigration");
}

- (void)homeManager:(id)a3 didUpdateHH2MigrationInProgressState:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  HUHomeHubMigrationProgressViewController *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  _BOOL4 v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v4 = a4;
  v21 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  HFLogForCategory();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "hh2MigrationFailedError");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138413058;
    v14 = self;
    v15 = 2112;
    v16 = v9;
    v17 = 1024;
    v18 = v4;
    v19 = 2112;
    v20 = v10;
    _os_log_impl(&dword_1B8E1E000, v8, OS_LOG_TYPE_DEFAULT, "%@:%@: Migration is in progress? %{BOOL}d, hh2MigrationFailedError = %@", (uint8_t *)&v13, 0x26u);

  }
  if (!v4)
  {
    objc_msgSend(v7, "hh2MigrationFailedError");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v7, "hh2MigrationFailedError");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUHomeHubMigrationProgressViewController _handleFailedMigration:](self, "_handleFailedMigration:", v12);

    }
  }

}

- (void)_startHH2Upgrade
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "homeManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __60__HUHomeHubMigrationProgressViewController__startHH2Upgrade__block_invoke;
  v5[3] = &unk_1E6F4E2D8;
  v5[4] = self;
  objc_msgSend(v4, "upgradeToROARWithCompletionHandler:", v5);

}

uint64_t __60__HUHomeHubMigrationProgressViewController__startHH2Upgrade__block_invoke(uint64_t result, uint64_t a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "_handleFailedMigration:", a2);
  return result;
}

- (void)_handleSuccessfulMigration
{
  void *v3;
  void *v4;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  -[HUHomeHubMigrationProgressViewController _cleanUp](self, "_cleanUp");
  -[HUHomeHubMigrationProgressViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = CFSTR("HUHomeHub2OnboardingKey_UserInput");
  v6[0] = &unk_1E70411A0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewController:didFinishWithConfigurationResults:", self, v4);

}

- (void)_handleFailedMigration:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[HUHomeHubMigrationProgressViewController _cleanUp](self, "_cleanUp");
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithObject:forKey:", &unk_1E70411B8, CFSTR("HUHomeHub2OnboardingKey_UserInput"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D313A0], "localizedDescriptionForError:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    objc_msgSend(v7, "setObject:forKey:", v5, CFSTR("HUHomeHub2OnboardingKey_ErrorDescription"));
  -[HUHomeHubMigrationProgressViewController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "viewController:didFinishWithConfigurationResults:", self, v7);

}

- (void)_cleanUp
{
  id v3;

  objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeHomeManagerObserver:", self);

}

- (HUConfigurationViewControllerDelegate)delegate
{
  return (HUConfigurationViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIActivityIndicatorView)spinner
{
  return self->_spinner;
}

- (void)setSpinner:(id)a3
{
  objc_storeStrong((id *)&self->_spinner, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
