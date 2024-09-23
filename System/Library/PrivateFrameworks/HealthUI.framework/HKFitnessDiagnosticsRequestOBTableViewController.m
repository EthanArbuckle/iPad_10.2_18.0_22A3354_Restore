@implementation HKFitnessDiagnosticsRequestOBTableViewController

- (id)improveHealthPrivacyIdentifier
{
  return CFSTR("com.apple.onboarding.improvehealth");
}

- (HKFitnessDiagnosticsRequestOBTableViewController)initWithTitle:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  HKFitnessDiagnosticsRequestOBTableViewController *v8;
  objc_super v10;

  v4 = (void *)MEMORY[0x1E0CB34D0];
  v5 = a3;
  objc_msgSend(v4, "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("DATA_COLLECTION_MESSAGE_VISION_OS"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10.receiver = self;
  v10.super_class = (Class)HKFitnessDiagnosticsRequestOBTableViewController;
  v8 = -[OBTableWelcomeController initWithTitle:detailText:icon:adoptTableViewScrollView:](&v10, sel_initWithTitle_detailText_icon_adoptTableViewScrollView_, v5, v7, 0, 1);

  return v8;
}

- (void)viewDidLoad
{
  NSString *baseAutomationIdentifier;
  NSString *v4;
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

  v14.receiver = self;
  v14.super_class = (Class)HKFitnessDiagnosticsRequestOBTableViewController;
  -[OBTableWelcomeController viewDidLoad](&v14, sel_viewDidLoad);
  baseAutomationIdentifier = self->_baseAutomationIdentifier;
  self->_baseAutomationIdentifier = (NSString *)CFSTR("UIA.Health.Onboarding.ImproveHealthAndActivity");

  v4 = self->_baseAutomationIdentifier;
  -[HKFitnessDiagnosticsRequestOBTableViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccessibilityIdentifier:", v4);

  -[HKFitnessDiagnosticsRequestOBTableViewController _configureTableView](self, "_configureTableView");
  v6 = (void *)MEMORY[0x1E0D65148];
  -[HKFitnessDiagnosticsRequestOBTableViewController improveHealthPrivacyIdentifier](self, "improveHealthPrivacyIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bundleWithIdentifier:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D65158], "accessoryButton");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "linkColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTitleColor:forState:", v10, 0);

  objc_msgSend(v8, "privacyFlow");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedButtonTitle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTitle:forState:", v12, 0);

  objc_msgSend(v9, "addTarget:action:forControlEvents:", self, sel__showDataCollectionAdditionalInfo, 64);
  -[HKFitnessDiagnosticsRequestOBTableViewController headerView](self, "headerView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addAccessoryButton:", v9);

  -[HKFitnessDiagnosticsRequestOBTableViewController _setUpFooterView](self, "_setUpFooterView");
  -[HKFitnessDiagnosticsRequestOBTableViewController setModalInPresentation:](self, "setModalInPresentation:", 1);

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HKFitnessDiagnosticsRequestOBTableViewController;
  -[OBBaseWelcomeController viewDidAppear:](&v5, sel_viewDidAppear_, a3);
  -[OBTableWelcomeController tableView](self, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "flashScrollIndicators");

}

- (void)_configureTableView
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = objc_alloc(MEMORY[0x1E0DC3D48]);
  v4 = (void *)objc_msgSend(v3, "initWithFrame:style:", 2, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[OBTableWelcomeController setTableView:](self, "setTableView:", v4);

  -[OBTableWelcomeController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDataSource:", self);

  -[OBTableWelcomeController tableView](self, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDelegate:", self);

  -[OBTableWelcomeController tableView](self, "tableView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDirectionalLayoutMargins:", 0.0, 30.0, 0.0, 50.0);

  -[OBTableWelcomeController tableView](self, "tableView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("_FitnessDiagnosticsDetailsCellReuseIdentifier"));

  -[OBTableWelcomeController tableView](self, "tableView");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("_ViewFitnessDiagnosticsCellReuseIdentifier"));

}

- (void)_setUpFooterView
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
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[2];
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D65140], "boldButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addTarget:action:forControlEvents:", self, sel__enableDataCollection, 64);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("DATA_COLLECTION_ENABLE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitle:forState:", v5, 0);

  v20[0] = self->_baseAutomationIdentifier;
  v20[1] = CFSTR("EnableButton");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  HKUIJoinStringsForAutomationIdentifier(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityIdentifier:", v7);

  -[HKFitnessDiagnosticsRequestOBTableViewController buttonTray](self, "buttonTray");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addButton:", v3);

  objc_msgSend(MEMORY[0x1E0D65170], "linkButton");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addTarget:action:forControlEvents:", self, sel__disableDataCollection, 64);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("DATA_COLLECTION_DISABLE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTitle:forState:", v11, 0);

  v19[0] = self->_baseAutomationIdentifier;
  v19[1] = CFSTR("DisableButton");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  HKUIJoinStringsForAutomationIdentifier(v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAccessibilityIdentifier:", v13);

  objc_msgSend(v9, "titleLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setAdjustsFontSizeToFitWidth:", 1);

  objc_msgSend(v3, "configuration");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "baseBackgroundColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "configuration");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setBaseBackgroundColor:", v16);

  -[HKFitnessDiagnosticsRequestOBTableViewController buttonTray](self, "buttonTray");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addButton:", v9);

}

- (BOOL)_indexPathIsValidRow:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  if (objc_msgSend(v3, "section"))
    v4 = 0;
  else
    v4 = objc_msgSend(v3, "row") < 1;

  return v4;
}

- (int64_t)_rowFromIndexPath:(id)a3
{
  id v5;
  int64_t v6;
  void *v8;

  v5 = a3;
  if (!-[HKFitnessDiagnosticsRequestOBTableViewController _indexPathIsValidRow:](self, "_indexPathIsValidRow:", v5))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKFitnessDiagnosticsRequestOBTableViewController.m"), 109, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[self _indexPathIsValidRow:indexPath]"));

  }
  v6 = objc_msgSend(v5, "row");

  return v6;
}

- (id)_cellForFitnessDiagnosticsDetailsAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[OBTableWelcomeController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("_FitnessDiagnosticsDetailsCellReuseIdentifier"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_cellForViewImproveHealthExamplesAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[OBTableWelcomeController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("_ViewFitnessDiagnosticsCellReuseIdentifier"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v13[0] = self->_baseAutomationIdentifier;
  v13[1] = CFSTR("Cell");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  HKUIJoinStringsForAutomationIdentifier(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAccessibilityIdentifier:", v8);

  objc_msgSend(v6, "textLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKFitnessDiagnosticsRequestOBTableViewController buttonTitle](self, "buttonTitle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setText:", v10);

  objc_msgSend(MEMORY[0x1E0DC3658], "hk_appKeyColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTextColor:", v11);

  return v6;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 1;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  void *v4;
  id v6;
  int64_t v7;
  uint64_t v8;

  v6 = a4;
  v7 = -[HKFitnessDiagnosticsRequestOBTableViewController _rowFromIndexPath:](self, "_rowFromIndexPath:", v6);
  if (v7 == 1)
  {
    -[HKFitnessDiagnosticsRequestOBTableViewController _cellForViewImproveHealthExamplesAtIndexPath:](self, "_cellForViewImproveHealthExamplesAtIndexPath:", v6);
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  if (!v7)
  {
    -[HKFitnessDiagnosticsRequestOBTableViewController _cellForFitnessDiagnosticsDetailsAtIndexPath:](self, "_cellForFitnessDiagnosticsDetailsAtIndexPath:", v6);
    v8 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v4 = (void *)v8;
  }

  return v4;
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
  v10.super_class = (Class)HKFitnessDiagnosticsRequestOBTableViewController;
  -[HKFitnessDiagnosticsRequestOBTableViewController traitCollectionDidChange:](&v10, sel_traitCollectionDidChange_, v4);
  if (v4)
  {
    -[HKFitnessDiagnosticsRequestOBTableViewController traitCollection](self, "traitCollection");
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
      block[2] = __77__HKFitnessDiagnosticsRequestOBTableViewController_traitCollectionDidChange___block_invoke;
      block[3] = &unk_1E9C3F0D0;
      block[4] = self;
      dispatch_async(MEMORY[0x1E0C80D38], block);
    }
  }

}

uint64_t __77__HKFitnessDiagnosticsRequestOBTableViewController_traitCollectionDidChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateForCurrentContentSizeCategory");
}

- (id)buttonText
{
  return (id)-[NSString copy](self->_buttonTitle, "copy");
}

- (void)setButtonText:(id)a3
{
  NSString *v4;
  NSString *buttonTitle;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  buttonTitle = self->_buttonTitle;
  self->_buttonTitle = v4;

}

- (BOOL)shouldInlineButtonTray
{
  return 0;
}

+ (BOOL)needsRequestedPermission
{
  void *v2;
  int v3;
  void *v4;
  int v5;

  if ((objc_msgSend(MEMORY[0x1E0CB6F18], "isRunningStoreDemoMode") & 1) != 0
    || (objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection"),
        v2 = (void *)objc_claimAutoreleasedReturnValue(),
        v3 = objc_msgSend(v2, "isDiagnosticSubmissionAllowed"),
        v2,
        !v3))
  {
    LOBYTE(v5) = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "hasHealthDataSubmissionAllowedBeenSet") ^ 1;

  }
  return v5;
}

- (void)_enableDataCollection
{
  NSObject *v3;
  uint64_t v4;
  _QWORD v5[5];
  uint8_t buf[4];
  HKFitnessDiagnosticsRequestOBTableViewController *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  v3 = *MEMORY[0x1E0CB52C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52C0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v7 = self;
    _os_log_impl(&dword_1D7813000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Enabled Data Collection", buf, 0xCu);
  }
  v4 = *MEMORY[0x1E0D28E38];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __73__HKFitnessDiagnosticsRequestOBTableViewController__enableDataCollection__block_invoke;
  v5[3] = &unk_1E9C3FB40;
  v5[4] = self;
  objc_msgSend(MEMORY[0x1E0D28E50], "setUserDidAccept:currentAgreement:completion:", 1, v4, v5);
}

void __73__HKFitnessDiagnosticsRequestOBTableViewController__enableDataCollection__block_invoke(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__HKFitnessDiagnosticsRequestOBTableViewController__enableDataCollection__block_invoke_2;
  block[3] = &unk_1E9C3F0D0;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __73__HKFitnessDiagnosticsRequestOBTableViewController__enableDataCollection__block_invoke_2(uint64_t a1)
{
  void *v2;
  _QWORD v3[5];

  objc_msgSend(*(id *)(a1 + 32), "presentingViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __73__HKFitnessDiagnosticsRequestOBTableViewController__enableDataCollection__block_invoke_3;
  v3[3] = &unk_1E9C3F0D0;
  v3[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v2, "dismissViewControllerAnimated:completion:", 1, v3);

}

void __73__HKFitnessDiagnosticsRequestOBTableViewController__enableDataCollection__block_invoke_3(uint64_t a1)
{
  void *v2;
  void (**v3)(id, uint64_t);

  objc_msgSend(*(id *)(a1 + 32), "completion");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "completion");
    v3 = (void (**)(id, uint64_t))objc_claimAutoreleasedReturnValue();
    v3[2](v3, 1);

  }
}

- (void)_disableDataCollection
{
  NSObject *v3;
  uint64_t v4;
  _QWORD v5[5];
  uint8_t buf[4];
  HKFitnessDiagnosticsRequestOBTableViewController *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  v3 = *MEMORY[0x1E0CB52C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52C0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v7 = self;
    _os_log_impl(&dword_1D7813000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Disabled Data Collection", buf, 0xCu);
  }
  v4 = *MEMORY[0x1E0D28E38];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __74__HKFitnessDiagnosticsRequestOBTableViewController__disableDataCollection__block_invoke;
  v5[3] = &unk_1E9C3FB40;
  v5[4] = self;
  objc_msgSend(MEMORY[0x1E0D28E50], "setUserDidAccept:currentAgreement:completion:", 0, v4, v5);
}

void __74__HKFitnessDiagnosticsRequestOBTableViewController__disableDataCollection__block_invoke(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__HKFitnessDiagnosticsRequestOBTableViewController__disableDataCollection__block_invoke_2;
  block[3] = &unk_1E9C3F0D0;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __74__HKFitnessDiagnosticsRequestOBTableViewController__disableDataCollection__block_invoke_2(uint64_t a1)
{
  void *v2;
  _QWORD v3[5];

  objc_msgSend(*(id *)(a1 + 32), "presentingViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __74__HKFitnessDiagnosticsRequestOBTableViewController__disableDataCollection__block_invoke_3;
  v3[3] = &unk_1E9C3F0D0;
  v3[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v2, "dismissViewControllerAnimated:completion:", 1, v3);

}

void __74__HKFitnessDiagnosticsRequestOBTableViewController__disableDataCollection__block_invoke_3(uint64_t a1)
{
  void *v2;
  void (**v3)(id, _QWORD);

  objc_msgSend(*(id *)(a1 + 32), "completion");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "completion");
    v3 = (void (**)(id, _QWORD))objc_claimAutoreleasedReturnValue();
    v3[2](v3, 0);

  }
}

- (void)_showDataCollectionAdditionalInfo
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  HKFitnessDiagnosticsRequestOBTableViewController *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  v3 = *MEMORY[0x1E0CB52C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52C0], OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138543362;
    v8 = self;
    _os_log_impl(&dword_1D7813000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Presenting Privacy view controller", (uint8_t *)&v7, 0xCu);
  }
  v4 = (void *)MEMORY[0x1E0D65198];
  -[HKFitnessDiagnosticsRequestOBTableViewController improveHealthPrivacyIdentifier](self, "improveHealthPrivacyIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "presenterForPrivacySplashWithIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setPresentingViewController:", self);
  objc_msgSend(v6, "present");

}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1232);
}

- (NSString)buttonTitle
{
  return self->_buttonTitle;
}

- (void)setButtonTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1240);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonTitle, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_baseAutomationIdentifier, 0);
}

@end
