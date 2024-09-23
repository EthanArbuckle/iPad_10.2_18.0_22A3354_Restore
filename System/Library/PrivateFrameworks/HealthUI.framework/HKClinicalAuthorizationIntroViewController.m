@implementation HKClinicalAuthorizationIntroViewController

- (HKClinicalAuthorizationIntroViewController)init
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

- (HKClinicalAuthorizationIntroViewController)initWithNibName:(id)a3 bundle:(id)a4
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

- (HKClinicalAuthorizationIntroViewController)initWithContext:(id)a3 viewController:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  HKClinicalAuthorizationIntroViewController *v16;
  HKClinicalAuthorizationIntroViewController *v17;
  id v20;
  objc_super v21;

  v6 = a3;
  v20 = a4;
  HKHealthRecordsAPILocalizedString(CFSTR("INTRO_VIEW_MAIN_TITLE"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc(MEMORY[0x1E0CB3940]);
  HKHealthRecordsAPILocalizedString(CFSTR("INTRO_PRIVACY_DETAILS_%@_%@_TITLE"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "source");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "name");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "source");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "name");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v8, "initWithFormat:", v9, v11, v13);

  +[HKClinicalAuthorizationFlowManager tableViewHeaderIcon](HKClinicalAuthorizationFlowManager, "tableViewHeaderIcon");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v21.receiver = self;
  v21.super_class = (Class)HKClinicalAuthorizationIntroViewController;
  v16 = -[OBTableWelcomeController initWithTitle:detailText:icon:adoptTableViewScrollView:](&v21, sel_initWithTitle_detailText_icon_adoptTableViewScrollView_, v7, v14, v15, 1);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_context, a3);
    objc_storeStrong((id *)&v17->_nextViewController, a4);
    -[HKClinicalAuthorizationIntroViewController setShouldMoveHeaderViewTitleToNavigationTitleWhenScrolledOffScreen:](v17, "setShouldMoveHeaderViewTitleToNavigationTitleWhenScrolledOffScreen:", 0);
  }

  return v17;
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HKClinicalAuthorizationIntroViewController;
  -[OBTableWelcomeController viewDidLoad](&v3, sel_viewDidLoad);
  -[HKClinicalAuthorizationIntroViewController _configureTableView](self, "_configureTableView");
  -[HKClinicalAuthorizationIntroViewController _configureNavigationItem](self, "_configureNavigationItem");
  -[HKClinicalAuthorizationIntroViewController _setUpFooterView](self, "_setUpFooterView");
  -[HKClinicalAuthorizationIntroViewController setModalInPresentation:](self, "setModalInPresentation:", 1);
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HKClinicalAuthorizationIntroViewController;
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
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v3 = objc_alloc(MEMORY[0x1E0DC3D48]);
  v4 = (void *)objc_msgSend(v3, "initWithFrame:style:", 2, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[OBTableWelcomeController setTableView:](self, "setTableView:", v4);

  -[OBTableWelcomeController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDataSource:", self);

  -[OBTableWelcomeController tableView](self, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDelegate:", self);

  -[HKClinicalAuthorizationIntroViewController traitCollection](self, "traitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "userInterfaceIdiom");

  if (v8 != 6)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKClinicalAuthorizationIntroViewController view](self, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setBackgroundColor:", v9);

    -[HKClinicalAuthorizationIntroViewController view](self, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "backgroundColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBTableWelcomeController tableView](self, "tableView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setBackgroundColor:", v12);

  }
  -[OBTableWelcomeController tableView](self, "tableView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("_DetailsCellReuseIdentifier"));

  -[OBTableWelcomeController tableView](self, "tableView");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("_ViewHealthRecordsCellReuseIdentifier"));

}

- (void)_configureNavigationItem
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[OBBaseWelcomeController navigationItem](self, "navigationItem");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setLargeTitleDisplayMode:", 2);
  v3 = (void *)MEMORY[0x1E0DC34F0];
  HKHealthRecordsAPILocalizedString(CFSTR("BACK_BAR_BUTTON_TITLE"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hk_backButtonWithTitle:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setBackBarButtonItem:", v5);

  HKHealthRecordsAPILocalizedString(CFSTR("IN_APP_SEQUENCE_TITLE_INTRO"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTitle:", v6);

  HKHealthRecordsAPILocalizedString(CFSTR("IN_APP_SEQUENCE_TITLE_ACCESSIBILITY_%@"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAccessibilityLabel:", v7);

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 1, self, sel__cancelButtonPressed_);
  objc_msgSend(v9, "setRightBarButtonItem:", v8);

}

- (void)_configureHeaderViewWithSource:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(a3, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKClinicalAuthorizationIntroViewController.m"), 129, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("source.name != nil"));

  }
  -[HKClinicalAuthorizationIntroViewController headerTitle](self, "headerTitle");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[HKClinicalAuthorizationIntroViewController headerView](self, "headerView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTitle:", v8);

}

- (void)_setUpFooterView
{
  OBBoldTrayButton *v3;
  OBBoldTrayButton *nextButton;
  OBBoldTrayButton *v5;
  void *v6;
  OBBoldTrayButton *v7;
  void *v8;
  id v9;

  objc_msgSend(MEMORY[0x1E0D65140], "boldButton");
  v3 = (OBBoldTrayButton *)objc_claimAutoreleasedReturnValue();
  nextButton = self->_nextButton;
  self->_nextButton = v3;

  v5 = self->_nextButton;
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBBoldTrayButton setTintColor:](v5, "setTintColor:", v6);

  v7 = self->_nextButton;
  HKHealthRecordsAPILocalizedString(CFSTR("INTRO_CONTINUE_BUTTON_TITLE"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBBoldTrayButton setTitle:forState:](v7, "setTitle:forState:", v8, 0);

  -[OBBoldTrayButton addTarget:action:forControlEvents:](self->_nextButton, "addTarget:action:forControlEvents:", self, sel__nextButtonPressed_, 64);
  -[HKClinicalAuthorizationIntroViewController buttonTray](self, "buttonTray");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addButton:", self->_nextButton);

}

- (BOOL)_indexPathIsValidRow:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  if (objc_msgSend(v3, "section"))
    v4 = 0;
  else
    v4 = objc_msgSend(v3, "row") < 2;

  return v4;
}

- (int64_t)_rowFromIndexPath:(id)a3
{
  id v5;
  int64_t v6;
  void *v8;

  v5 = a3;
  if (!-[HKClinicalAuthorizationIntroViewController _indexPathIsValidRow:](self, "_indexPathIsValidRow:", v5))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKClinicalAuthorizationIntroViewController.m"), 148, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[self _indexPathIsValidRow:indexPath]"));

  }
  v6 = objc_msgSend(v5, "row");

  return v6;
}

- (id)_cellForDetailsAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[OBTableWelcomeController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("_DetailsCellReuseIdentifier"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKClinicalAuthorizationIntroViewController context](self, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "source");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSource:", v8);

  return v6;
}

- (id)_cellForViewHealthRecordsAtIndexPath:(id)a3
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
  objc_msgSend(v5, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("_ViewHealthRecordsCellReuseIdentifier"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  HKUIJoinStringsForAutomationIdentifier(&unk_1E9CE9B78);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAccessibilityIdentifier:", v7);

  objc_msgSend(v6, "textLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  HKHealthRecordsAPILocalizedString(CFSTR("INTRO_VIEW_HEALTH_RECORDS_BUTTON_TITLE"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setText:", v9);

  objc_msgSend(MEMORY[0x1E0DC3658], "hk_appKeyColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTextColor:", v10);

  return v6;
}

- (void)_cancelButtonPressed:(id)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 7, CFSTR("The user canceled authorization."));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[HKClinicalAuthorizationIntroViewController _finishWithError:](self, "_finishWithError:", v4);

}

- (void)_finishWithError:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  _HKInitializeLogging();
  v5 = (void *)*MEMORY[0x1E0CB5280];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5280], OS_LOG_TYPE_DEBUG))
    -[HKClinicalAuthorizationIntroViewController _finishWithError:].cold.1(v5);
  -[HKClinicalAuthorizationIntroViewController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "promptControllerDidFinish:error:", self, v4);

}

- (void)_nextButtonPressed:(id)a3
{
  id v4;

  -[HKClinicalAuthorizationIntroViewController navigationController](self, "navigationController", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pushViewController:animated:", self->_nextViewController, 1);

}

- (void)_viewHealthRecordsCellTapped:(id)a3
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "_hk_urlForViewHealthRecords");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "openURL:withOptions:", v3, 0);

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 2;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  void *v4;
  id v6;
  int64_t v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = -[HKClinicalAuthorizationIntroViewController _rowFromIndexPath:](self, "_rowFromIndexPath:", v6);
  if (v7 == 1)
  {
    -[HKClinicalAuthorizationIntroViewController _cellForViewHealthRecordsAtIndexPath:](self, "_cellForViewHealthRecordsAtIndexPath:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  if (!v7)
  {
    -[HKClinicalAuthorizationIntroViewController _cellForDetailsAtIndexPath:](self, "_cellForDetailsAtIndexPath:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_5:
    v9 = v8;
    objc_msgSend(v8, "hkui_configuredForCHR3rdPartyAPIFlowWhilePrompting:", 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  int64_t v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  v7 = -[HKClinicalAuthorizationIntroViewController _rowFromIndexPath:](self, "_rowFromIndexPath:", v6);
  objc_msgSend(v9, "cellForRowAtIndexPath:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 == 1)
    -[HKClinicalAuthorizationIntroViewController _viewHealthRecordsCellTapped:](self, "_viewHealthRecordsCellTapped:", v8);
  objc_msgSend(v9, "deselectRowAtIndexPath:animated:", v6, v7 == 1);

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
  v10.super_class = (Class)HKClinicalAuthorizationIntroViewController;
  -[HKClinicalAuthorizationIntroViewController traitCollectionDidChange:](&v10, sel_traitCollectionDidChange_, v4);
  if (v4)
  {
    -[HKClinicalAuthorizationIntroViewController traitCollection](self, "traitCollection");
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
      block[2] = __71__HKClinicalAuthorizationIntroViewController_traitCollectionDidChange___block_invoke;
      block[3] = &unk_1E9C3F0D0;
      block[4] = self;
      dispatch_async(MEMORY[0x1E0C80D38], block);
    }
  }

}

uint64_t __71__HKClinicalAuthorizationIntroViewController_traitCollectionDidChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateForCurrentContentSizeCategory");
}

- (HKHealthPrivacyServicePromptControllerDelegate)delegate
{
  return (HKHealthPrivacyServicePromptControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (HKClinicalAuthorizationSequenceContext)context
{
  return self->_context;
}

- (UIViewController)nextViewController
{
  return self->_nextViewController;
}

- (void)setNextViewController:(id)a3
{
  objc_storeStrong((id *)&self->_nextViewController, a3);
}

- (NSString)headerTitle
{
  return self->_headerTitle;
}

- (void)setHeaderTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1256);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headerTitle, 0);
  objc_storeStrong((id *)&self->_nextViewController, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_nextButton, 0);
}

- (void)_finishWithError:(void *)a1 .cold.1(void *a1)
{
  NSObject *v1;
  id v2;
  int v3;
  id v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v3 = 138412290;
  v4 = (id)objc_opt_class();
  v2 = v4;
  _os_log_debug_impl(&dword_1D7813000, v1, OS_LOG_TYPE_DEBUG, "%@: dismissing", (uint8_t *)&v3, 0xCu);

}

@end
