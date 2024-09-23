@implementation HKClinicalAuthorizationSettingsViewController

- (HKClinicalAuthorizationSettingsViewController)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (HKClinicalAuthorizationSettingsViewController)initWithStyle:(int64_t)a3
{
  void *v4;
  uint64_t v5;
  void *v6;

  v4 = (void *)MEMORY[0x1E0C99DA0];
  v5 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "raise:format:", v5, CFSTR("The -%@ method is not available on %@"), v6, objc_opt_class());

  return 0;
}

- (HKClinicalAuthorizationSettingsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  void *v5;
  uint64_t v6;
  void *v7;

  v5 = (void *)MEMORY[0x1E0C99DA0];
  v6 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "raise:format:", v6, CFSTR("The -%@ method is not available on %@"), v7, objc_opt_class());

  return 0;
}

- (HKClinicalAuthorizationSettingsViewController)initWithContext:(id)a3 style:(int64_t)a4
{
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  HKClinicalAuthorizationSettingsViewController *v17;
  void *v18;
  HKClinicalAuthorizationDisplayController *v19;
  void *v20;
  uint64_t v21;
  HKClinicalAuthorizationDisplayController *displayController;
  objc_super v24;
  objc_super v25;

  v8 = a3;
  if ((unint64_t)a4 >= 2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKClinicalAuthorizationSettingsViewController.m"), 156, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("style == HKAuthorizationSettingsStyleDefault || style == HKAuthorizationSettingsStyleViewServicePrompt"));

  }
  else if (a4 == 1)
  {
    HKHealthRecordsAPILocalizedString(CFSTR("CATEGORY_SELECTION_MAIN_TITLE"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(v8, "source");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    HKHealthRecordsAPILocalizedStringWithSource(CFSTR("APP_%@_ACCESS_REQUEST_AUTH"), v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "source");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "name");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v10, "initWithFormat:", v12, v14);

    +[HKClinicalAuthorizationFlowManager tableViewHeaderIcon](HKClinicalAuthorizationFlowManager, "tableViewHeaderIcon");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v25.receiver = self;
    v25.super_class = (Class)HKClinicalAuthorizationSettingsViewController;
    v17 = -[OBTableWelcomeController initWithTitle:detailText:icon:adoptTableViewScrollView:](&v25, sel_initWithTitle_detailText_icon_adoptTableViewScrollView_, v9, v15, v16, 1);

    if (!v17)
      goto LABEL_8;
    goto LABEL_7;
  }
  v24.receiver = self;
  v24.super_class = (Class)HKClinicalAuthorizationSettingsViewController;
  v17 = -[OBTableWelcomeController initWithTitle:detailText:icon:adoptTableViewScrollView:](&v24, sel_initWithTitle_detailText_icon_adoptTableViewScrollView_, &stru_1E9C4C428, 0, 0, 1);
  if (v17)
  {
LABEL_7:
    objc_storeStrong((id *)&v17->_context, a3);
    v17->_style = a4;
    -[HKClinicalAuthorizationSettingsViewController setShouldMoveHeaderViewTitleToNavigationTitleWhenScrolledOffScreen:](v17, "setShouldMoveHeaderViewTitleToNavigationTitleWhenScrolledOffScreen:", 0);
    v19 = [HKClinicalAuthorizationDisplayController alloc];
    objc_msgSend(v8, "authorizationController");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[HKClinicalAuthorizationDisplayController initWithAuthorizationController:](v19, "initWithAuthorizationController:", v20);
    displayController = v17->_displayController;
    v17->_displayController = (HKClinicalAuthorizationDisplayController *)v21;

  }
LABEL_8:

  return v17;
}

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HKClinicalAuthorizationSettingsViewController;
  -[OBTableWelcomeController viewDidLoad](&v4, sel_viewDidLoad);
  -[HKClinicalAuthorizationSettingsViewController source](self, "source");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKClinicalAuthorizationSettingsViewController _configureTableView](self, "_configureTableView");
  -[HKClinicalAuthorizationSettingsViewController _configureNavigationItemWithSource:](self, "_configureNavigationItemWithSource:", v3);
  -[HKClinicalAuthorizationSettingsViewController _setUpFooterView](self, "_setUpFooterView");
  if (-[HKClinicalAuthorizationSettingsViewController isPrompting](self, "isPrompting"))
    -[HKClinicalAuthorizationSettingsViewController _configureInitialAuthorizationSettingsForPrompting](self, "_configureInitialAuthorizationSettingsForPrompting");
  -[HKClinicalAuthorizationSettingsViewController _fetchPrivacyPolicyURLForSource:](self, "_fetchPrivacyPolicyURLForSource:", v3);
  -[HKClinicalAuthorizationSettingsViewController setModalInPresentation:](self, "setModalInPresentation:", 1);

}

- (void)viewWillAppear:(BOOL)a3
{
  _QWORD block[5];
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HKClinicalAuthorizationSettingsViewController;
  -[OBTableWelcomeController viewWillAppear:](&v5, sel_viewWillAppear_, a3);
  -[HKClinicalAuthorizationSettingsViewController reloadAuthorizationSettings](self, "reloadAuthorizationSettings");
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__HKClinicalAuthorizationSettingsViewController_viewWillAppear___block_invoke;
  block[3] = &unk_1E9C3F0D0;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __64__HKClinicalAuthorizationSettingsViewController_viewWillAppear___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateForCurrentContentSizeCategory");
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HKClinicalAuthorizationSettingsViewController;
  -[OBBaseWelcomeController viewDidAppear:](&v5, sel_viewDidAppear_, a3);
  -[OBTableWelcomeController tableView](self, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "flashScrollIndicators");

}

- (void)viewDidLayoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HKClinicalAuthorizationSettingsViewController;
  -[OBTableWelcomeController viewDidLayoutSubviews](&v4, sel_viewDidLayoutSubviews);
  if (-[HKClinicalAuthorizationSettingsViewController isPrompting](self, "isPrompting"))
  {
    -[HKClinicalAuthorizationSettingsViewController _workAroundTableHeaderPaddingIssue](self, "_workAroundTableHeaderPaddingIssue");
  }
  else
  {
    -[OBTableWelcomeController tableView](self, "tableView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setTableHeaderView:", 0);

  }
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[HKClinicalAuthorizationSettingsViewController lookUpAppPrivacyPolicyURLOperation](self, "lookUpAppPrivacyPolicyURLOperation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancel");

  v4.receiver = self;
  v4.super_class = (Class)HKClinicalAuthorizationSettingsViewController;
  -[HKClinicalAuthorizationSettingsViewController dealloc](&v4, sel_dealloc);
}

- (void)_reloadSections
{
  void *v3;
  id v4;

  -[HKClinicalAuthorizationSettingsViewController _createAppInformationSectionCells](self, "_createAppInformationSectionCells");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKClinicalAuthorizationSettingsViewController setAppInformationSectionCells:](self, "setAppInformationSectionCells:", v3);

  -[HKClinicalAuthorizationSettingsViewController _calculateSections](self, "_calculateSections");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[HKClinicalAuthorizationSettingsViewController setSections:](self, "setSections:", v4);

}

- (void)reloadAuthorizationSettings
{
  void *v3;
  void *v4;
  void *v5;

  -[HKClinicalAuthorizationSettingsViewController _reloadSections](self, "_reloadSections");
  if (-[HKClinicalAuthorizationSettingsViewController shouldCommitUpdatesImmediately](self, "shouldCommitUpdatesImmediately"))
  {
    -[HKClinicalAuthorizationSettingsViewController authorizationController](self, "authorizationController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "reload");

    -[HKClinicalAuthorizationSettingsViewController authorizationController](self, "authorizationController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKClinicalAuthorizationSettingsViewController setAuthorizationMode:](self, "setAuthorizationMode:", objc_msgSend(v4, "authorizationModeForSource"));

  }
  -[OBTableWelcomeController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reloadData");

  -[HKClinicalAuthorizationSettingsViewController _updateFooterButtonsTitles](self, "_updateFooterButtonsTitles");
  -[HKClinicalAuthorizationSettingsViewController _updateAllowButtonEnabledStateAnimated:](self, "_updateAllowButtonEnabledStateAnimated:", 0);
}

- (void)_configureNavigationItemWithSource:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  -[OBBaseWelcomeController navigationItem](self, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLargeTitleDisplayMode:", 2);
  if (-[HKClinicalAuthorizationSettingsViewController isPrompting](self, "isPrompting"))
  {
    v5 = (void *)MEMORY[0x1E0DC34F0];
    HKHealthRecordsAPILocalizedString(CFSTR("BACK_BAR_BUTTON_TITLE"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "hk_backButtonWithTitle:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setBackBarButtonItem:", v7);

    HKHealthRecordsAPILocalizedString(CFSTR("IN_APP_SEQUENCE_TITLE_CATEGORIES"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTitle:", v8);

    HKHealthRecordsAPILocalizedString(CFSTR("IN_APP_SEQUENCE_TITLE_ACCESSIBILITY_%@"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAccessibilityLabel:", v9);

    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 1, self, sel__cancelButtonPressed_);
    objc_msgSend(v4, "setRightBarButtonItem:", v10);
  }
  else
  {
    objc_msgSend(v4, "setBackBarButtonItem:", 0);
    objc_msgSend(v4, "setRightBarButtonItem:", 0);
    objc_msgSend(v11, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTitle:", v10);
  }

}

- (void)_configureInitialAuthorizationSettingsForPrompting
{
  void *v4;
  void *v5;
  void *v6;

  -[HKClinicalAuthorizationSettingsViewController authorizationController](self, "authorizationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKClinicalAuthorizationSettingsViewController.m"), 283, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.authorizationController != nil"));

  }
  if (!-[HKClinicalAuthorizationSettingsViewController isPrompting](self, "isPrompting"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKClinicalAuthorizationSettingsViewController.m"), 284, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.isPrompting"));

  }
  -[HKClinicalAuthorizationSettingsViewController setAuthorizationMode:](self, "setAuthorizationMode:", -[HKClinicalAuthorizationSettingsViewController _defaultShareAuthorizationMode](self, "_defaultShareAuthorizationMode"));
}

- (void)_updateFooterButtonsTitles
{
  id v3;

  -[HKClinicalAuthorizationSettingsViewController _doNotAllowButtonTitle](self, "_doNotAllowButtonTitle");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[OBLinkTrayButton setTitle:forState:](self->_doNotAllowButton, "setTitle:forState:", v3, 0);

}

- (void)_updateAllowButtonEnabledStateAnimated:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v10;
  _QWORD v11[5];
  char v12;

  v3 = a3;
  -[HKClinicalAuthorizationSettingsViewController authorizationController](self, "authorizationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "anyTypeEnabled");

  LODWORD(v5) = -[OBBoldTrayButton isEnabled](self->_allowButton, "isEnabled");
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __88__HKClinicalAuthorizationSettingsViewController__updateAllowButtonEnabledStateAnimated___block_invoke;
  v11[3] = &unk_1E9C429F0;
  v11[4] = self;
  v12 = v6;
  v7 = _Block_copy(v11);
  v8 = v7;
  if (v6 == (_DWORD)v5 || !v3)
  {
    (*((void (**)(void *))v7 + 2))(v7);
  }
  else
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F38]), "initWithDuration:curve:animations:", 0, v7, 0.15);
    objc_msgSend(v10, "startAnimation");

  }
}

uint64_t __88__HKClinicalAuthorizationSettingsViewController__updateAllowButtonEnabledStateAnimated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1224), "setEnabled:", *(unsigned __int8 *)(a1 + 40));
}

- (void)_configureTableView
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v3 = objc_alloc(MEMORY[0x1E0DC3D48]);
  v4 = (void *)objc_msgSend(v3, "initWithFrame:style:", 2, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[OBTableWelcomeController setTableView:](self, "setTableView:", v4);

  -[OBTableWelcomeController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDataSource:", self);

  -[OBTableWelcomeController tableView](self, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDelegate:", self);

  -[HKClinicalAuthorizationSettingsViewController traitCollection](self, "traitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "userInterfaceIdiom");

  if (v8 != 6)
  {
    if (-[HKClinicalAuthorizationSettingsViewController isPrompting](self, "isPrompting"))
      objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
    else
      objc_msgSend(MEMORY[0x1E0DC3658], "systemGroupedBackgroundColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKClinicalAuthorizationSettingsViewController view](self, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setBackgroundColor:", v9);

    -[HKClinicalAuthorizationSettingsViewController view](self, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "backgroundColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBTableWelcomeController tableView](self, "tableView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setBackgroundColor:", v12);

  }
  -[OBTableWelcomeController tableView](self, "tableView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("AuthorizationModeCellReuseIdentifier"));

  -[OBTableWelcomeController tableView](self, "tableView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("AuthorizationSettingsCellReuseIdentifier"));

  -[OBTableWelcomeController tableView](self, "tableView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("ShareUsageDescriptionCellReuseIdentifier"));

  -[OBTableWelcomeController tableView](self, "tableView");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("ViewAppPrivacyPolicyCellReuseIdentifier"));

}

- (void)_workAroundTableHeaderPaddingIssue
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  id v14;

  -[OBTableWelcomeController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tableHeaderView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frame");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  -[OBTableWelcomeController tableView](self, "tableView");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "tableHeaderView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setFrame:", v6, v8, v10, v12 + -30.0);

}

- (void)_setUpFooterView
{
  OBBoldTrayButton *v3;
  OBBoldTrayButton *allowButton;
  OBBoldTrayButton *v5;
  void *v6;
  OBBoldTrayButton *v7;
  void *v8;
  void *v9;
  OBLinkTrayButton *v10;
  OBLinkTrayButton *doNotAllowButton;
  OBLinkTrayButton *v12;
  void *v13;
  id v14;

  if (self->_style)
  {
    objc_msgSend(MEMORY[0x1E0D65140], "boldButton");
    v3 = (OBBoldTrayButton *)objc_claimAutoreleasedReturnValue();
    allowButton = self->_allowButton;
    self->_allowButton = v3;

    v5 = self->_allowButton;
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBBoldTrayButton setTintColor:](v5, "setTintColor:", v6);

    v7 = self->_allowButton;
    HKHealthRecordsAPILocalizedString(CFSTR("SHARE_BUTTON_TITLE"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBBoldTrayButton setTitle:forState:](v7, "setTitle:forState:", v8, 0);

    -[OBBoldTrayButton addTarget:action:forControlEvents:](self->_allowButton, "addTarget:action:forControlEvents:", self, sel__allowButtonPressed_, 64);
    -[HKClinicalAuthorizationSettingsViewController buttonTray](self, "buttonTray");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addButton:", self->_allowButton);

    objc_msgSend(MEMORY[0x1E0D65170], "linkButton");
    v10 = (OBLinkTrayButton *)objc_claimAutoreleasedReturnValue();
    doNotAllowButton = self->_doNotAllowButton;
    self->_doNotAllowButton = v10;

    v12 = self->_doNotAllowButton;
    HKHealthRecordsAPILocalizedString(CFSTR("DO_NOT_ALLOW_BUTTON_TITLE_UNDETERMINED"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBLinkTrayButton setTitle:forState:](v12, "setTitle:forState:", v13, 0);

    -[OBLinkTrayButton addTarget:action:forControlEvents:](self->_doNotAllowButton, "addTarget:action:forControlEvents:", self, sel__doNotAllowButtonPressed_, 64);
    -[HKClinicalAuthorizationSettingsViewController buttonTray](self, "buttonTray");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addButton:", self->_doNotAllowButton);

  }
}

- (id)_typeForIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  if (-[HKClinicalAuthorizationSettingsViewController _sectionForTableViewSection:](self, "_sectionForTableViewSection:", objc_msgSend(v4, "section")) == 1)
  {
    -[HKClinicalAuthorizationSettingsViewController authorizationController](self, "authorizationController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "orderedTypesForReading");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndexedSubscript:", objc_msgSend(v4, "row"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)_tableViewSection:(int64_t)a3 isEqualToSection:(int64_t)a4
{
  return -[HKClinicalAuthorizationSettingsViewController _sectionForTableViewSection:](self, "_sectionForTableViewSection:", a3) == a4;
}

- (int64_t)_sectionForTableViewSection:(int64_t)a3
{
  void *v4;
  void *v5;
  int64_t v6;

  -[HKClinicalAuthorizationSettingsViewController sections](self, "sections");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndexedSubscript:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue");

  return v6;
}

- (int64_t)_tableViewSectionForSection:(int64_t)a3
{
  void *v4;
  int64_t v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0x7FFFFFFFFFFFFFFFLL;
  -[HKClinicalAuthorizationSettingsViewController sections](self, "sections");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __77__HKClinicalAuthorizationSettingsViewController__tableViewSectionForSection___block_invoke;
  v7[3] = &unk_1E9C435F8;
  v7[4] = &v8;
  v7[5] = a3;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v7);

  v5 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v5;
}

uint64_t __77__HKClinicalAuthorizationSettingsViewController__tableViewSectionForSection___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a2, "integerValue");
  if (result == *(_QWORD *)(a1 + 40))
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a3;
    *a4 = 1;
  }
  return result;
}

- (id)_createAppInformationSectionCells
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[HKClinicalAuthorizationSettingsViewController readUsageDescription](self, "readUsageDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  if (v5)
    objc_msgSend(v3, "addObject:", &unk_1E9CEC878);
  -[HKClinicalAuthorizationSettingsViewController lookUpAppPrivacyPolicyURLOperation](self, "lookUpAppPrivacyPolicyURLOperation");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    -[HKClinicalAuthorizationSettingsViewController source](self, "source");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
      objc_msgSend(v3, "addObject:", &unk_1E9CEC890);
  }
  return v3;
}

- (id)_calculateSections
{
  id v3;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (-[HKClinicalAuthorizationSettingsViewController _shouldDisplayAppInformationSection](self, "_shouldDisplayAppInformationSection"))
  {
    objc_msgSend(v3, "addObject:", &unk_1E9CEC878);
  }
  if (-[HKClinicalAuthorizationSettingsViewController _shouldDisplayShareDataTypes](self, "_shouldDisplayShareDataTypes"))
  {
    objc_msgSend(v3, "addObject:", &unk_1E9CEC890);
  }
  if (-[HKClinicalAuthorizationSettingsViewController _shouldDisplayShareAuthorizationModeSection](self, "_shouldDisplayShareAuthorizationModeSection"))
  {
    objc_msgSend(v3, "addObject:", &unk_1E9CEC8A8);
  }
  return v3;
}

- (BOOL)_shouldDisplayAppInformationSection
{
  void *v2;
  BOOL v3;

  -[HKClinicalAuthorizationSettingsViewController appInformationSectionCells](self, "appInformationSectionCells");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (BOOL)_shouldDisplayShareDataTypes
{
  void *v2;
  void *v3;
  BOOL v4;

  -[HKClinicalAuthorizationSettingsViewController authorizationController](self, "authorizationController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "orderedTypesForReading");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count") != 0;

  return v4;
}

- (BOOL)_shouldDisplayShareAuthorizationModeSection
{
  void *v3;
  char v4;

  if (-[HKClinicalAuthorizationSettingsViewController isPrompting](self, "isPrompting")
    || !-[HKClinicalAuthorizationSettingsViewController _shouldDisplayShareDataTypes](self, "_shouldDisplayShareDataTypes"))
  {
    return 0;
  }
  -[HKClinicalAuthorizationSettingsViewController authorizationController](self, "authorizationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "anyTypeEnabled");

  return v4;
}

- (void)_allowButtonPressed:(id)a3
{
  HKClinicalAuthorizationNewRecordsViewController *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  HKClinicalAuthorizationNewRecordsViewController *v10;

  if (!-[HKClinicalAuthorizationSettingsViewController isPrompting](self, "isPrompting", a3))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKClinicalAuthorizationSettingsViewController.m"), 460, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.isPrompting"));

  }
  v5 = [HKClinicalAuthorizationNewRecordsViewController alloc];
  -[HKClinicalAuthorizationSettingsViewController context](self, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[HKClinicalAuthorizationNewRecordsViewController initWithContext:](v5, "initWithContext:", v6);

  -[HKClinicalAuthorizationSettingsViewController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKClinicalAuthorizationNewRecordsViewController setDelegate:](v10, "setDelegate:", v7);

  -[HKClinicalAuthorizationSettingsViewController navigationController](self, "navigationController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "pushViewController:animated:", v10, 1);

}

- (void)_shareAuthorizationModeCellPressed:(id)a3
{
  void *v4;
  void *v5;
  int64_t v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[OBTableWelcomeController tableView](self, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "indexPathForCell:", v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[HKClinicalAuthorizationSettingsViewController _shareAuthorizationModeForIndexPath:](self, "_shareAuthorizationModeForIndexPath:", v5);
  if (v6 != -[HKClinicalAuthorizationSettingsViewController authorizationMode](self, "authorizationMode"))
  {
    -[HKClinicalAuthorizationSettingsViewController _visibleShareAuthorizationModeCellForMode:](self, "_visibleShareAuthorizationModeCellForMode:", -[HKClinicalAuthorizationSettingsViewController authorizationMode](self, "authorizationMode"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKClinicalAuthorizationSettingsViewController setAuthorizationMode:](self, "setAuthorizationMode:", v6);
    objc_msgSend(v7, "setAccessoryType:", 0);
    objc_msgSend(v9, "setAccessoryType:", 3);
    if (-[HKClinicalAuthorizationSettingsViewController shouldCommitUpdatesImmediately](self, "shouldCommitUpdatesImmediately"))
    {
      -[HKClinicalAuthorizationSettingsViewController authorizationController](self, "authorizationController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "commitAllTypesAndUpdateAuthorizationAnchorWithMode:", -[HKClinicalAuthorizationSettingsViewController authorizationMode](self, "authorizationMode"));

    }
    -[HKClinicalAuthorizationSettingsViewController _updateShareAuthorizationModeSectionFooter](self, "_updateShareAuthorizationModeSectionFooter");

  }
}

- (void)_doNotAllowButtonPressed:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __74__HKClinicalAuthorizationSettingsViewController__doNotAllowButtonPressed___block_invoke;
  v3[3] = &unk_1E9C3F0D0;
  v3[4] = self;
  -[HKClinicalAuthorizationSettingsViewController _presentConfirmationForStopSharingIfNeededWithAcceptHandler:](self, "_presentConfirmationForStopSharingIfNeededWithAcceptHandler:", v3);
}

void __74__HKClinicalAuthorizationSettingsViewController__doNotAllowButtonPressed___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "authorizationController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setEnabledForAllTypes:", 0);
  objc_msgSend(v2, "commitAllTypesAndUpdateAuthorizationAnchorWithMode:", 1);
  objc_msgSend(*(id *)(a1 + 32), "_finishWithError:", 0);

}

- (void)_viewAppPrivacyPolicyCellPressed:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  HKClinicalAuthorizationSettingsViewController *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HKClinicalAuthorizationSettingsViewController lookUpAppPrivacyPolicyURLOperation](self, "lookUpAppPrivacyPolicyURLOperation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "privacyPolicyURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 && (objc_msgSend(v6, "hk_isValidSafariViewControllerURL") & 1) != 0)
  {
    _HKInitializeLogging();
    v7 = (void *)*MEMORY[0x1E0CB52D8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52D8], OS_LOG_TYPE_DEFAULT))
    {
      v8 = v7;
      HKSensitiveLogItem();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543618;
      v13 = self;
      v14 = 2114;
      v15 = v9;
      _os_log_impl(&dword_1D7813000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ opening privacy policy URL %{public}@ in Safari view", (uint8_t *)&v12, 0x16u);

    }
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD5600]), "initWithURL:", v6);
    objc_msgSend(v10, "popoverPresentationController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setSourceView:", v4);

    objc_msgSend(v10, "setDismissButtonStyle:", 0);
    -[UIViewController hk_presentModalCardViewController:fullScreen:animated:completion:](self, "hk_presentModalCardViewController:fullScreen:animated:completion:", v10, 1, 1, 0);

  }
  else
  {
    -[HKClinicalAuthorizationSettingsViewController _presentViewAppPrivacyPolicyURLErrorAlert](self, "_presentViewAppPrivacyPolicyURLErrorAlert");
  }

}

- (void)_presentViewAppPrivacyPolicyURLErrorAlert
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
  id v12;

  v3 = (void *)MEMORY[0x1E0DC3450];
  -[HKClinicalAuthorizationSettingsViewController context](self, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "source");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  HKHealthRecordsAPILocalizedStringWithSource(CFSTR("VIEW_APP_PRIVACY_POLICY_URL_ERROR_TRY_LATER"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "alertControllerWithTitle:message:preferredStyle:", 0, v6, 1);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0DC3448];
  -[HKClinicalAuthorizationSettingsViewController context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "source");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  HKHealthRecordsAPILocalizedStringWithSource(CFSTR("VIEW_APP_PRIVACY_POLICY_URL_ERROR_OK_BUTTON"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "actionWithTitle:style:handler:", v10, 0, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "addAction:", v11);
  -[HKClinicalAuthorizationSettingsViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v12, 1, 0);

}

- (void)_cancelButtonPressed:(id)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 7, CFSTR("The user canceled authorization."));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[HKClinicalAuthorizationSettingsViewController _finishWithError:](self, "_finishWithError:", v4);

}

- (void)_finishWithError:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  if (-[HKClinicalAuthorizationSettingsViewController isPrompting](self, "isPrompting"))
  {
    _HKInitializeLogging();
    v5 = (void *)*MEMORY[0x1E0CB5280];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5280], OS_LOG_TYPE_DEBUG))
      -[HKClinicalAuthorizationIntroViewController _finishWithError:].cold.1(v5);
    -[HKClinicalAuthorizationSettingsViewController delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "promptControllerDidFinish:error:", self, v4);

  }
}

- (void)switchCellValueChanged:(id)a3 value:(BOOL)a4
{
  _BOOL8 v4;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  int64_t v14;
  void *v15;
  id v16;

  v4 = a4;
  v7 = a3;
  -[OBTableWelcomeController tableView](self, "tableView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "indexPathForCell:", v7);
  v16 = (id)objc_claimAutoreleasedReturnValue();

  -[HKClinicalAuthorizationSettingsViewController _typeForIndexPath:](self, "_typeForIndexPath:", v16);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKClinicalAuthorizationSettingsViewController.m"), 551, CFSTR("Unable to determine object type for switch cell"));

  }
  -[HKClinicalAuthorizationSettingsViewController authorizationController](self, "authorizationController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v4)
    v12 = objc_msgSend(v10, "anyTypeEnabled");
  else
    v12 = 1;
  -[HKClinicalAuthorizationSettingsViewController authorizationController](self, "authorizationController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setEnabled:forType:commit:", v4, v9, -[HKClinicalAuthorizationSettingsViewController shouldCommitUpdatesImmediately](self, "shouldCommitUpdatesImmediately"));

  if (-[HKClinicalAuthorizationSettingsViewController shouldCommitUpdatesImmediately](self, "shouldCommitUpdatesImmediately")&& (v12 & 1) == 0)
  {
    v14 = -[HKClinicalAuthorizationSettingsViewController _defaultShareAuthorizationMode](self, "_defaultShareAuthorizationMode");
    -[HKClinicalAuthorizationSettingsViewController setAuthorizationMode:](self, "setAuthorizationMode:", v14);
    objc_msgSend(v11, "commitAllTypesAndUpdateAuthorizationAnchorWithMode:", v14);
  }
  -[HKClinicalAuthorizationSettingsViewController _updateAllowButtonEnabledStateAnimated:](self, "_updateAllowButtonEnabledStateAnimated:", 1);
  -[HKClinicalAuthorizationSettingsViewController _updateShareAuthorizationModeSectionVisibilityIfNeeded](self, "_updateShareAuthorizationModeSectionVisibilityIfNeeded");

}

- (int64_t)_defaultShareAuthorizationMode
{
  return 1;
}

- (BOOL)_isShowingShareAuthorizationModeSection
{
  void *v2;
  char v3;

  -[HKClinicalAuthorizationSettingsViewController sections](self, "sections");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "containsObject:", &unk_1E9CEC8A8);

  return v3;
}

- (void)_showShareAuthorizationModeSectionIfNeeded
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  if (!-[HKClinicalAuthorizationSettingsViewController _isShowingShareAuthorizationModeSection](self, "_isShowingShareAuthorizationModeSection"))
  {
    if (-[HKClinicalAuthorizationSettingsViewController _shouldDisplayShareAuthorizationModeSection](self, "_shouldDisplayShareAuthorizationModeSection"))
    {
      -[HKClinicalAuthorizationSettingsViewController sections](self, "sections");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      -[HKClinicalAuthorizationSettingsViewController _reloadSections](self, "_reloadSections");
      -[HKClinicalAuthorizationSettingsViewController sections](self, "sections");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKClinicalAuthorizationSettingsViewController _verifySections:isEqualToSections:afterInsertingSection:](self, "_verifySections:isEqualToSections:afterInsertingSection:", v7, v3, &unk_1E9CEC8A8);
      v4 = objc_msgSend(v3, "indexOfObject:", &unk_1E9CEC8A8);
      -[OBTableWelcomeController tableView](self, "tableView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36B8]), "initWithIndex:", v4);
      objc_msgSend(v5, "insertSections:withRowAnimation:", v6, 0);

    }
  }
}

- (void)_hideShareAuthorizationModeSectionIfNeeded
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  if (-[HKClinicalAuthorizationSettingsViewController _isShowingShareAuthorizationModeSection](self, "_isShowingShareAuthorizationModeSection"))
  {
    if (!-[HKClinicalAuthorizationSettingsViewController _shouldDisplayShareAuthorizationModeSection](self, "_shouldDisplayShareAuthorizationModeSection"))
    {
      -[HKClinicalAuthorizationSettingsViewController sections](self, "sections");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      -[HKClinicalAuthorizationSettingsViewController _reloadSections](self, "_reloadSections");
      -[HKClinicalAuthorizationSettingsViewController sections](self, "sections");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKClinicalAuthorizationSettingsViewController _verifySections:isEqualToSections:afterInsertingSection:](self, "_verifySections:isEqualToSections:afterInsertingSection:", v3, v7, &unk_1E9CEC8A8);
      v4 = objc_msgSend(v7, "indexOfObject:", &unk_1E9CEC8A8);
      -[OBTableWelcomeController tableView](self, "tableView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36B8]), "initWithIndex:", v4);
      objc_msgSend(v5, "deleteSections:withRowAnimation:", v6, 0);

    }
  }
}

- (void)_updateShareAuthorizationModeSectionVisibilityIfNeeded
{
  -[HKClinicalAuthorizationSettingsViewController _showShareAuthorizationModeSectionIfNeeded](self, "_showShareAuthorizationModeSectionIfNeeded");
  -[HKClinicalAuthorizationSettingsViewController _hideShareAuthorizationModeSectionIfNeeded](self, "_hideShareAuthorizationModeSectionIfNeeded");
}

- (void)_updateShareAuthorizationModeSectionFooter
{
  id v3;

  if (-[HKClinicalAuthorizationSettingsViewController _tableViewSectionForSection:](self, "_tableViewSectionForSection:", 2) != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[OBTableWelcomeController tableView](self, "tableView");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "reloadData");

  }
}

- (void)_verifySections:(id)a3 isEqualToSections:(id)a4 afterInsertingSection:(id)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v20 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v20, "containsObject:", v10))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKClinicalAuthorizationSettingsViewController.m"), 632, CFSTR("Attempting to insert section %@, but section already exists"), v10);

  }
  if ((objc_msgSend(v9, "containsObject:", v10) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKClinicalAuthorizationSettingsViewController.m"), 633, CFSTR("Attempting to insert section %@, but no such section found after update"), v10);

  }
  if ((objc_msgSend(v20, "hk_allElementsUnique") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKClinicalAuthorizationSettingsViewController.m"), 634, CFSTR("Duplicate sections in %@"), v20);

  }
  if ((objc_msgSend(v9, "hk_allElementsUnique") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKClinicalAuthorizationSettingsViewController.m"), 635, CFSTR("Duplicate sections in %@"), v9);

  }
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v20);
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v9);
  objc_msgSend(v11, "setByAddingObject:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isEqualToSet:", v12);

  if ((v14 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKClinicalAuthorizationSettingsViewController.m"), 640, CFSTR("Mismatch between pre-insert sections %@ and post-insert sections %@ when inserting %@"), v20, v9, v10);

  }
}

- (BOOL)_shouldHighlightAppInformationCellAtIndexPath:(id)a3
{
  id v5;
  BOOL v6;
  void *v8;

  v5 = a3;
  if (!-[HKClinicalAuthorizationSettingsViewController _tableViewSection:isEqualToSection:](self, "_tableViewSection:isEqualToSection:", objc_msgSend(v5, "section"), 0))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKClinicalAuthorizationSettingsViewController.m"), 646, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[self _tableViewSection:indexPath.section isEqualToSection:_SectionAppInformation]"));

  }
  if (-[HKClinicalAuthorizationSettingsViewController _cellAtIndexPathIsViewAppPrivacyPolicyCell:](self, "_cellAtIndexPathIsViewAppPrivacyPolicyCell:", v5))
  {
    v6 = -[HKClinicalAuthorizationSettingsViewController _shouldHighlightViewAppPrivacyPolicyCellAtIndexPath:](self, "_shouldHighlightViewAppPrivacyPolicyCellAtIndexPath:", v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_appInformationCellForIndexPath:(id)a3
{
  id v5;
  unint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v12;
  void *v13;

  v5 = a3;
  if (!-[HKClinicalAuthorizationSettingsViewController _tableViewSection:isEqualToSection:](self, "_tableViewSection:isEqualToSection:", objc_msgSend(v5, "section"), 0))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKClinicalAuthorizationSettingsViewController.m"), 653, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[self _tableViewSection:indexPath.section isEqualToSection:_SectionAppInformation]"));

  }
  v6 = objc_msgSend(v5, "row");
  -[HKClinicalAuthorizationSettingsViewController appInformationSectionCells](self, "appInformationSectionCells");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 >= objc_msgSend(v7, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKClinicalAuthorizationSettingsViewController.m"), 656, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("row < appInformationSectionCells.count"));

  }
  objc_msgSend(v7, "objectAtIndexedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "integerValue");

  if (v9 == 1)
  {
    -[HKClinicalAuthorizationSettingsViewController _viewAppPrivacyPolicyCellForIndexPath:](self, "_viewAppPrivacyPolicyCellForIndexPath:", v5);
    v10 = objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  if (!v9)
  {
    -[HKClinicalAuthorizationSettingsViewController _shareUsageDescriptionCellForIndexPath:](self, "_shareUsageDescriptionCellForIndexPath:", v5);
    v10 = objc_claimAutoreleasedReturnValue();
LABEL_9:
    v8 = (void *)v10;
  }

  return v8;
}

- (id)_shareUsageDescriptionCellForIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  -[OBTableWelcomeController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("ShareUsageDescriptionCellReuseIdentifier"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  HKUIJoinStringsForAutomationIdentifier(&unk_1E9CE9FB0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAccessibilityIdentifier:", v7);

  objc_msgSend(v6, "textLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFont:", v9);

  objc_msgSend(v8, "setNumberOfLines:", 0);
  -[HKClinicalAuthorizationSettingsViewController readUsageDescription](self, "readUsageDescription");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setText:", v10);

  return v6;
}

- (id)_indexPathForViewAppPrivacyPolicyCell
{
  int64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v3 = -[HKClinicalAuthorizationSettingsViewController _tableViewSectionForSection:](self, "_tableViewSectionForSection:", 0);
  v4 = 0;
  if (v3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[HKClinicalAuthorizationSettingsViewController appInformationSectionCells](self, "appInformationSectionCells");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "indexOfObject:", &unk_1E9CEC890);

    if (v6 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v4 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v6, v3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  return v4;
}

- (BOOL)_cellAtIndexPathIsViewAppPrivacyPolicyCell:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[HKClinicalAuthorizationSettingsViewController _indexPathForViewAppPrivacyPolicyCell](self, "_indexPathForViewAppPrivacyPolicyCell");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqual:", v5);

  return v6;
}

- (BOOL)_shouldHighlightViewAppPrivacyPolicyCellAtIndexPath:(id)a3
{
  void *v6;

  if (!-[HKClinicalAuthorizationSettingsViewController _cellAtIndexPathIsViewAppPrivacyPolicyCell:](self, "_cellAtIndexPathIsViewAppPrivacyPolicyCell:", a3))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKClinicalAuthorizationSettingsViewController.m"), 698, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[self _cellAtIndexPathIsViewAppPrivacyPolicyCell:indexPath]"));

  }
  return 1;
}

- (id)_viewAppPrivacyPolicyCellForIndexPath:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  void *v20;

  v5 = a3;
  -[HKClinicalAuthorizationSettingsViewController source](self, "source");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKClinicalAuthorizationSettingsViewController lookUpAppPrivacyPolicyURLOperation](self, "lookUpAppPrivacyPolicyURLOperation");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKClinicalAuthorizationSettingsViewController.m"), 706, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("source != nil"));

    if (v8)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKClinicalAuthorizationSettingsViewController.m"), 707, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("operation != nil"));

    goto LABEL_3;
  }
  if (!v7)
    goto LABEL_5;
LABEL_3:
  -[OBTableWelcomeController tableView](self, "tableView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("ViewAppPrivacyPolicyCellReuseIdentifier"), v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  HKUIJoinStringsForAutomationIdentifier(&unk_1E9CE9FC8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAccessibilityIdentifier:", v11);

  objc_msgSend(v10, "textLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setNumberOfLines:", 0);
  v13 = objc_alloc(MEMORY[0x1E0CB3940]);
  HKHealthRecordsAPILocalizedStringWithSource(CFSTR("VIEW_APP_%@_PRIVACY_POLICY_BUTTON_TITLE"), v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "name");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v13, "initWithFormat:", v14, v15);
  objc_msgSend(v12, "setText:", v16);

  objc_msgSend(MEMORY[0x1E0DC3658], "hk_appKeyColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setTextColor:", v17);

  return v10;
}

- (id)_shareDataTypeCellForIndexPath:(id)a3
{
  id v5;
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
  void *v22;
  void *v23;

  v5 = a3;
  if (!-[HKClinicalAuthorizationSettingsViewController _tableViewSection:isEqualToSection:](self, "_tableViewSection:isEqualToSection:", objc_msgSend(v5, "section"), 1))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKClinicalAuthorizationSettingsViewController.m"), 724, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[self _tableViewSection:indexPath.section isEqualToSection:_SectionShareDataTypes]"));

  }
  -[OBTableWelcomeController tableView](self, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("AuthorizationSettingsCellReuseIdentifier"), v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setAdjustsFontSizeToFitWidth:", 1);
  objc_msgSend(v7, "setCentersIcon:", 1);
  objc_msgSend(v7, "setDelegate:", self);
  -[HKClinicalAuthorizationSettingsViewController _typeForIndexPath:](self, "_typeForIndexPath:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKClinicalAuthorizationSettingsViewController.m"), 733, CFSTR("Missing object type"));

  }
  -[HKClinicalAuthorizationSequenceContext authorizationController](self->_context, "authorizationController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "healthStore");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKDisplayTypeController sharedInstanceForHealthStore:](HKDisplayTypeController, "sharedInstanceForHealthStore:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "displayTypeForObjectTypeUnifyingBloodPressureTypes:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "localization");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "displayName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDisplayText:", v14);

  objc_msgSend(v12, "listIcon");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "imageByPreparingThumbnailOfSize:", 29.0, 29.0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setIconImage:", v16);

  objc_msgSend(v12, "displayCategory");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "color");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "imageView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setTintColor:", v18);

  -[HKClinicalAuthorizationSettingsViewController authorizationController](self, "authorizationController");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setOn:", objc_msgSend(v20, "isTypeEnabled:", v8));

  objc_msgSend(v7, "setSeparatorInset:", 0.0, 59.0, 0.0, 0.0);
  return v7;
}

- (int64_t)_shareAuthorizationModeForIndexPath:(id)a3
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  int64_t v9;
  void *v10;
  void *v11;

  v5 = a3;
  if (!-[HKClinicalAuthorizationSettingsViewController _tableViewSection:isEqualToSection:](self, "_tableViewSection:isEqualToSection:", objc_msgSend(v5, "section"), 2))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKClinicalAuthorizationSettingsViewController.m"), 779, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[self _tableViewSection:indexPath.section isEqualToSection:_SectionShareAuthorizationMode]"));

  }
  v6 = objc_msgSend(v5, "row");
  v7 = v6;
  if (v6 >= 2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKClinicalAuthorizationSettingsViewController.m"), 781, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("row < _AuthorizationModeCount"));

    if (v7)
      goto LABEL_5;
LABEL_9:
    v9 = 1;
    goto LABEL_10;
  }
  if (!v6)
    goto LABEL_9;
LABEL_5:
  if (v7 != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKClinicalAuthorizationSettingsViewController.m"), 789, CFSTR("Invalid row: %ld"), v7);

  }
  v9 = 0;
LABEL_10:

  return v9;
}

- (id)_indexPathForShareAuthorizationMode:(int64_t)a3
{
  int64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;

  v4 = -[HKClinicalAuthorizationSettingsViewController _tableViewSectionForSection:](self, "_tableViewSectionForSection:", 2);
  v5 = 0x7FFFFFFFFFFFFFFFLL;
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = 0;
  }
  else
  {
    if (a3 == 1)
      v5 = 0;
    if (a3)
      v7 = v5;
    else
      v7 = 1;
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v7, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (id)_shareAuthorizationModeCellForIndexPath:(id)a3
{
  id v4;
  int64_t v5;
  void *v6;
  void *v7;
  __CFString *v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v4 = a3;
  v5 = -[HKClinicalAuthorizationSettingsViewController _shareAuthorizationModeForIndexPath:](self, "_shareAuthorizationModeForIndexPath:", v4);
  -[OBTableWelcomeController tableView](self, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("AuthorizationModeCellReuseIdentifier"), v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v8 = CFSTR("CONTINUOUS_AUTHORIZATION");
    goto LABEL_5;
  }
  if (v5 == 1)
  {
    v8 = CFSTR("ONE_TIME_AUTHORIZATION");
LABEL_5:
    HKHealthRecordsAPILocalizedString(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  v9 = 0;
LABEL_7:
  if (-[HKClinicalAuthorizationSettingsViewController authorizationMode](self, "authorizationMode") == v5)
    v10 = 3;
  else
    v10 = 0;
  objc_msgSend(v7, "setAccessoryType:", v10);
  objc_msgSend(v7, "textLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setText:", v9);

  return v7;
}

- (id)_visibleShareAuthorizationModeCellForMode:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[HKClinicalAuthorizationSettingsViewController _indexPathForShareAuthorizationMode:](self, "_indexPathForShareAuthorizationMode:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[OBTableWelcomeController tableView](self, "tableView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "cellForRowAtIndexPath:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_titleForAppInformationFooter
{
  void *v2;
  void *v3;
  void *v4;

  -[HKClinicalAuthorizationSettingsViewController context](self, "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "source");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  HKHealthRecordsAPILocalizedStringWithSource(CFSTR("VIEW_APP_PRIVACY_POLICY_FOOTER"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_titleForShareDataTypesFooter
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  if (-[HKClinicalAuthorizationSettingsViewController isPrompting](self, "isPrompting"))
  {
    -[HKClinicalAuthorizationSettingsViewController displayController](self, "displayController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "currentTimeDisplayStringForReadAuthorizationFooter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = objc_alloc(MEMORY[0x1E0CB3940]);
    -[HKClinicalAuthorizationSettingsViewController context](self, "context");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "source");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    HKHealthRecordsAPILocalizedStringWithSource(CFSTR("SHARE_DATA_WITH_APP_%@_DATE_%@_PROMPT_EXPLANATION"), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKClinicalAuthorizationSettingsViewController source](self, "source");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v5, "initWithFormat:", v8, v10, v4);

  }
  else
  {
    v12 = objc_alloc(MEMORY[0x1E0CB3940]);
    -[HKClinicalAuthorizationSettingsViewController context](self, "context");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "source");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    HKHealthRecordsAPILocalizedStringWithSource(CFSTR("SHARE_DATA_WITH_APP_%@_INFORMER"), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKClinicalAuthorizationSettingsViewController source](self, "source");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v12, "initWithFormat:", v7, v9);
  }

  return v11;
}

- (id)_formatStringForShareAuthorizationModeFooterWithMode:(int64_t)a3
{
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;

  if (a3 == 1)
  {
    -[HKClinicalAuthorizationSettingsViewController context](self, "context");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "source");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = CFSTR("DETERMINED_RECORDS_ONE_TIME_AUTHORIZATION_APP_%1$@_DATE_%2$@_CONFIRMATION");
    goto LABEL_5;
  }
  if (!a3)
  {
    -[HKClinicalAuthorizationSettingsViewController context](self, "context");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "source");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = CFSTR("DETERMINED_RECORDS_CONTINUOUS_AUTHORIZATION_APP_%1$@_DATE_%2$@_CONFIRMATION");
LABEL_5:
    HKHealthRecordsAPILocalizedStringWithSource(v6, v5);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (id)footerStringforDate:(id)a3 mode:(int64_t)a4 source:(id)a5
{
  void *v5;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  __CFString *v14;
  void *v15;
  void *v16;

  v9 = a3;
  v10 = a5;
  if (a4 == 1)
  {
    v11 = objc_alloc(MEMORY[0x1E0CB3940]);
    -[HKClinicalAuthorizationSettingsViewController context](self, "context");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "source");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = CFSTR("DETERMINED_RECORDS_ONE_TIME_AUTHORIZATION_APP_%1$@_DATE_%2$@_CONFIRMATION");
    goto LABEL_5;
  }
  if (!a4)
  {
    v11 = objc_alloc(MEMORY[0x1E0CB3940]);
    -[HKClinicalAuthorizationSettingsViewController context](self, "context");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "source");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = CFSTR("DETERMINED_RECORDS_CONTINUOUS_AUTHORIZATION_APP_%1$@_DATE_%2$@_CONFIRMATION");
LABEL_5:
    HKHealthRecordsAPILocalizedStringWithSource(v14, v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "name");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v11, "initWithFormat:", v15, v16, v9);

  }
  return v5;
}

- (id)_titleForShareAuthorizationModeFooter
{
  int64_t v3;
  void *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD aBlock[5];

  v3 = -[HKClinicalAuthorizationSettingsViewController authorizationMode](self, "authorizationMode");
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __86__HKClinicalAuthorizationSettingsViewController__titleForShareAuthorizationModeFooter__block_invoke;
  aBlock[3] = &unk_1E9C41748;
  aBlock[4] = self;
  v4 = _Block_copy(aBlock);
  v5 = -[HKClinicalAuthorizationSettingsViewController isPrompting](self, "isPrompting");
  -[HKClinicalAuthorizationSettingsViewController displayController](self, "displayController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
    objc_msgSend(v6, "currentTimeTitleForReadAuthorizationModeFooterWithSelectedMode:formatBlock:", v3, v4);
  else
    objc_msgSend(v6, "committedTitleForReadAuthorizationModeFooterWithSelectedMode:formatBlock:", v3, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t __86__HKClinicalAuthorizationSettingsViewController__titleForShareAuthorizationModeFooter__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(a1 + 32), "footerStringforDate:mode:source:", a2, a3, a4);
}

- (void)_displayGuestModeAlertWithCompletion:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  _QWORD v16[4];
  id v17;

  v3 = a3;
  v4 = (void *)MEMORY[0x1E0DC3450];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("GUEST_MODE_CHANGE_AUTHORIZATION_TITLE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("GUEST_MODE_CHANGE_AUTHORIZATION_DESCRIPTION"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "alertControllerWithTitle:message:preferredStyle:", v6, v8, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0DC3448];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("SHARE_ALERT_OK"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __86__HKClinicalAuthorizationSettingsViewController__displayGuestModeAlertWithCompletion___block_invoke;
  v16[3] = &unk_1E9C42860;
  v17 = v3;
  v13 = v3;
  objc_msgSend(v10, "actionWithTitle:style:handler:", v12, 0, v16);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "addAction:", v14);
  -[HKClinicalAuthorizationSettingsViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v9, 1, 0);

}

uint64_t __86__HKClinicalAuthorizationSettingsViewController__displayGuestModeAlertWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (id)_doNotAllowButtonTitle
{
  __CFString *v2;

  if (-[HKClinicalAuthorizationSettingsViewController _shouldPresentStopSharingDialogueBeforeDisallowing](self, "_shouldPresentStopSharingDialogueBeforeDisallowing"))
  {
    v2 = CFSTR("DO_NOT_ALLOW_BUTTON_TITLE_DETERMINED");
  }
  else
  {
    v2 = CFSTR("DO_NOT_ALLOW_BUTTON_TITLE_UNDETERMINED");
  }
  HKHealthRecordsAPILocalizedString(v2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)_shouldPresentStopSharingDialogueBeforeDisallowing
{
  void *v2;
  char v3;

  -[HKClinicalAuthorizationSettingsViewController authorizationController](self, "authorizationController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "anyDeterminedTypeAllowsReading");

  return v3;
}

- (void)_presentConfirmationForStopSharingIfNeededWithAcceptHandler:(id)a3
{
  void (**v4)(_QWORD);
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
  _QWORD v16[4];
  void (**v17)(_QWORD);

  v4 = (void (**)(_QWORD))a3;
  if (-[HKClinicalAuthorizationSettingsViewController _shouldPresentStopSharingDialogueBeforeDisallowing](self, "_shouldPresentStopSharingDialogueBeforeDisallowing"))
  {
    v5 = (void *)MEMORY[0x1E0DC3450];
    -[HKClinicalAuthorizationSettingsViewController _messageForStopSharingConfirmation](self, "_messageForStopSharingConfirmation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "alertControllerWithTitle:message:preferredStyle:", 0, v6, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC3658], "hk_appKeyColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTintColor:", v8);

    v10 = (void *)MEMORY[0x1E0DC3448];
    HKHealthRecordsAPILocalizedString(CFSTR("DO_NOT_ALLOW_BUTTON_TITLE_DETERMINED"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __109__HKClinicalAuthorizationSettingsViewController__presentConfirmationForStopSharingIfNeededWithAcceptHandler___block_invoke;
    v16[3] = &unk_1E9C42860;
    v17 = v4;
    objc_msgSend(v10, "actionWithTitle:style:handler:", v11, 2, v16);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = (void *)MEMORY[0x1E0DC3448];
    HKHealthRecordsAPILocalizedString(CFSTR("DO_NOT_ALLOW_BUTTON_TITLE_CANCEL"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "actionWithTitle:style:handler:", v14, 1, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "addAction:", v12);
    objc_msgSend(v7, "addAction:", v15);
    -[HKClinicalAuthorizationSettingsViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v7, 1, 0);

  }
  else
  {
    v4[2](v4);
  }

}

uint64_t __109__HKClinicalAuthorizationSettingsViewController__presentConfirmationForStopSharingIfNeededWithAcceptHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)_messageForStopSharingConfirmation
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v12;

  -[HKClinicalAuthorizationSettingsViewController source](self, "source");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKClinicalAuthorizationSettingsViewController.m"), 1010, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("source != nil"));

  }
  v5 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[HKClinicalAuthorizationSettingsViewController context](self, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "source");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  HKHealthRecordsAPILocalizedStringWithSource(CFSTR("DO_NOT_ALLOW_DETERMINED_APP_%@_CONFIRMATION"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v5, "initWithFormat:", v8, v9);

  return v10;
}

- (void)_fetchPrivacyPolicyURLForSource:(id)a3
{
  HKLookUpAppPrivacyPolicyURLOperation *v4;
  void *v5;
  HKLookUpAppPrivacyPolicyURLOperation *v6;
  void *v7;
  HKLookUpAppPrivacyPolicyURLOperation *v8;
  NSObject *v9;
  NSObject *v10;
  int v11;
  HKClinicalAuthorizationSettingsViewController *v12;
  __int16 v13;
  HKLookUpAppPrivacyPolicyURLOperation *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = (HKLookUpAppPrivacyPolicyURLOperation *)a3;
  if (-[HKLookUpAppPrivacyPolicyURLOperation _isApplication](v4, "_isApplication"))
  {
    -[HKClinicalAuthorizationSettingsViewController lookUpAppPrivacyPolicyURLOperation](self, "lookUpAppPrivacyPolicyURLOperation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "cancel");

    v6 = [HKLookUpAppPrivacyPolicyURLOperation alloc];
    -[HKLookUpAppPrivacyPolicyURLOperation bundleIdentifier](v4, "bundleIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[HKLookUpAppPrivacyPolicyURLOperation initWithBundleIdentifier:](v6, "initWithBundleIdentifier:", v7);

    -[HKClinicalAuthorizationSettingsViewController setLookUpAppPrivacyPolicyURLOperation:](self, "setLookUpAppPrivacyPolicyURLOperation:", v8);
    -[HKClinicalAuthorizationSettingsViewController _reloadViewAppPrivacyPolicyCell](self, "_reloadViewAppPrivacyPolicyCell");
    _HKInitializeLogging();
    v9 = *MEMORY[0x1E0CB52D8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52D8], OS_LOG_TYPE_DEFAULT))
    {
      v11 = 138543618;
      v12 = self;
      v13 = 2114;
      v14 = v8;
      _os_log_impl(&dword_1D7813000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ starting operation %{public}@", (uint8_t *)&v11, 0x16u);
    }
    -[HKLookUpAppPrivacyPolicyURLOperation start](v8, "start");

  }
  else
  {
    _HKInitializeLogging();
    v10 = *MEMORY[0x1E0CB52D8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52D8], OS_LOG_TYPE_DEFAULT))
    {
      v11 = 138543618;
      v12 = self;
      v13 = 2114;
      v14 = v4;
      _os_log_impl(&dword_1D7813000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ source %{public}@ is not an app, not fetching privacy policy", (uint8_t *)&v11, 0x16u);
    }
  }

}

- (void)_reloadViewAppPrivacyPolicyCell
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  -[HKClinicalAuthorizationSettingsViewController _indexPathForViewAppPrivacyPolicyCell](self, "_indexPathForViewAppPrivacyPolicyCell");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[OBTableWelcomeController tableView](self, "tableView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "reloadRowsAtIndexPaths:withRowAnimation:", v5, 5);

  }
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5;
  int64_t v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a4;
  v6 = -[HKClinicalAuthorizationSettingsViewController _sectionForTableViewSection:](self, "_sectionForTableViewSection:", objc_msgSend(v5, "section"));
  if (v6 == 2)
  {
    -[HKClinicalAuthorizationSettingsViewController _shareAuthorizationModeCellForIndexPath:](self, "_shareAuthorizationModeCellForIndexPath:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (v6 == 1)
  {
    -[HKClinicalAuthorizationSettingsViewController _shareDataTypeCellForIndexPath:](self, "_shareDataTypeCellForIndexPath:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v6)
      HKErrorTableViewCell(CFSTR("HKClinicalAuthorizationSettingsViewController"));
    else
      -[HKClinicalAuthorizationSettingsViewController _appInformationCellForIndexPath:](self, "_appInformationCellForIndexPath:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;
  objc_msgSend(v7, "hkui_configuredForCHR3rdPartyAPIFlowWhilePrompting:", -[HKClinicalAuthorizationSettingsViewController isPrompting](self, "isPrompting"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  int64_t v5;
  void *v6;
  int64_t v7;
  void *v8;

  v5 = -[HKClinicalAuthorizationSettingsViewController _sectionForTableViewSection:](self, "_sectionForTableViewSection:", a4);
  if (v5 == 1)
  {
    -[HKClinicalAuthorizationSettingsViewController authorizationController](self, "authorizationController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "orderedTypesForReading");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v8, "count");

  }
  else
  {
    if (v5)
      return 2;
    -[HKClinicalAuthorizationSettingsViewController appInformationSectionCells](self, "appInformationSectionCells");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");
  }

  return v7;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  void *v3;
  int64_t v4;

  -[HKClinicalAuthorizationSettingsViewController sections](self, "sections", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  int64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;

  v5 = -[HKClinicalAuthorizationSettingsViewController _sectionForTableViewSection:](self, "_sectionForTableViewSection:", a4);
  -[HKClinicalAuthorizationSettingsViewController source](self, "source");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  switch(v5)
  {
    case 2:
      HKHealthRecordsAPILocalizedString(CFSTR("AUTHORIZATION_MODE_TITLE"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 1:
      v10 = objc_alloc(MEMORY[0x1E0CB3940]);
      -[HKClinicalAuthorizationSettingsViewController context](self, "context");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "source");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      HKHealthRecordsAPILocalizedStringWithSource(CFSTR("SHARE_DATA_WITH_APP_%@_TITLE"), v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)objc_msgSend(v10, "initWithFormat:", v11, v7);

      goto LABEL_7;
    case 0:
      -[HKClinicalAuthorizationSettingsViewController context](self, "context");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "source");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      HKHealthRecordsAPILocalizedStringWithSource(CFSTR("APP_INFORMATION_TITLE"), v9);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:

      break;
  }

  return v6;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  void *v5;

  v5 = -[HKClinicalAuthorizationSettingsViewController _sectionForTableViewSection:](self, "_sectionForTableViewSection:", a4);
  if (v5 == (void *)2)
  {
    -[HKClinicalAuthorizationSettingsViewController _titleForShareAuthorizationModeFooter](self, "_titleForShareAuthorizationModeFooter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (v5 == (void *)1)
  {
    -[HKClinicalAuthorizationSettingsViewController _titleForShareDataTypesFooter](self, "_titleForShareDataTypesFooter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (!v5)
  {
    -[HKClinicalAuthorizationSettingsViewController _titleForAppInformationFooter](self, "_titleForAppInformationFooter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  id v5;
  int64_t v6;
  BOOL v7;

  v5 = a4;
  v6 = -[HKClinicalAuthorizationSettingsViewController _sectionForTableViewSection:](self, "_sectionForTableViewSection:", objc_msgSend(v5, "section"));
  if (v6 == 1)
  {
    v7 = 0;
  }
  else if (v6)
  {
    v7 = 1;
  }
  else
  {
    v7 = -[HKClinicalAuthorizationSettingsViewController _shouldHighlightAppInformationCellAtIndexPath:](self, "_shouldHighlightAppInformationCellAtIndexPath:", v5);
  }

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  int64_t v7;
  void *v8;
  uint64_t v9;
  id v10;

  v10 = a3;
  v6 = a4;
  v7 = -[HKClinicalAuthorizationSettingsViewController _sectionForTableViewSection:](self, "_sectionForTableViewSection:", objc_msgSend(v6, "section"));
  objc_msgSend(v10, "cellForRowAtIndexPath:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 == 2)
  {
    -[HKClinicalAuthorizationSettingsViewController _shareAuthorizationModeCellPressed:](self, "_shareAuthorizationModeCellPressed:", v8);
    goto LABEL_7;
  }
  if (!v7
    && -[HKClinicalAuthorizationSettingsViewController _cellAtIndexPathIsViewAppPrivacyPolicyCell:](self, "_cellAtIndexPathIsViewAppPrivacyPolicyCell:", v6))
  {
    -[HKClinicalAuthorizationSettingsViewController _viewAppPrivacyPolicyCellPressed:](self, "_viewAppPrivacyPolicyCellPressed:", v8);
LABEL_7:
    v9 = 1;
    goto LABEL_8;
  }
  v9 = 0;
LABEL_8:
  objc_msgSend(v10, "deselectRowAtIndexPath:animated:", v6, v9);

}

- (void)_updateForCurrentContentSizeCategory
{
  id v2;

  -[OBTableWelcomeController tableView](self, "tableView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reloadData");

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  _QWORD block[5];
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HKClinicalAuthorizationSettingsViewController;
  -[HKClinicalAuthorizationSettingsViewController traitCollectionDidChange:](&v10, sel_traitCollectionDidChange_, v4);
  if (v4)
  {
    -[HKClinicalAuthorizationSettingsViewController traitCollection](self, "traitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "preferredContentSizeCategory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "preferredContentSizeCategory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqualToString:", v7);

    if ((v8 & 1) == 0)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __74__HKClinicalAuthorizationSettingsViewController_traitCollectionDidChange___block_invoke;
      block[3] = &unk_1E9C3F0D0;
      block[4] = self;
      dispatch_async(MEMORY[0x1E0C80D38], block);
    }
  }

}

uint64_t __74__HKClinicalAuthorizationSettingsViewController_traitCollectionDidChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateForCurrentContentSizeCategory");
}

- (id)source
{
  void *v2;
  void *v3;

  -[HKClinicalAuthorizationSettingsViewController context](self, "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "source");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)authorizationController
{
  void *v2;
  void *v3;

  -[HKClinicalAuthorizationSettingsViewController context](self, "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "authorizationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSString)readUsageDescription
{
  void *v2;
  void *v3;

  -[HKClinicalAuthorizationSettingsViewController context](self, "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "readUsageDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (BOOL)isPrompting
{
  return self->_style == 1;
}

- (BOOL)shouldCommitUpdatesImmediately
{
  return !-[HKClinicalAuthorizationSettingsViewController isPrompting](self, "isPrompting");
}

- (HKHealthPrivacyServicePromptControllerDelegate)delegate
{
  return (HKHealthPrivacyServicePromptControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (int64_t)style
{
  return self->_style;
}

- (HKClinicalAuthorizationSequenceContext)context
{
  return self->_context;
}

- (HKClinicalAuthorizationDisplayController)displayController
{
  return self->_displayController;
}

- (int64_t)authorizationMode
{
  return self->_authorizationMode;
}

- (void)setAuthorizationMode:(int64_t)a3
{
  self->_authorizationMode = a3;
}

- (NSArray)sections
{
  return self->_sections;
}

- (void)setSections:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1280);
}

- (NSArray)appInformationSectionCells
{
  return self->_appInformationSectionCells;
}

- (void)setAppInformationSectionCells:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1288);
}

- (HKLookUpAppPrivacyPolicyURLOperation)lookUpAppPrivacyPolicyURLOperation
{
  return self->_lookUpAppPrivacyPolicyURLOperation;
}

- (void)setLookUpAppPrivacyPolicyURLOperation:(id)a3
{
  objc_storeStrong((id *)&self->_lookUpAppPrivacyPolicyURLOperation, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lookUpAppPrivacyPolicyURLOperation, 0);
  objc_storeStrong((id *)&self->_appInformationSectionCells, 0);
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_displayController, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_doNotAllowButton, 0);
  objc_storeStrong((id *)&self->_allowButton, 0);
}

@end
