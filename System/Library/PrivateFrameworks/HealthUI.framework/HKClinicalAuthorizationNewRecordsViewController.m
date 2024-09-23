@implementation HKClinicalAuthorizationNewRecordsViewController

- (HKClinicalAuthorizationNewRecordsViewController)init
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

- (HKClinicalAuthorizationNewRecordsViewController)initWithNibName:(id)a3 bundle:(id)a4
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

- (HKClinicalAuthorizationNewRecordsViewController)initWithContext:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  HKClinicalAuthorizationNewRecordsViewController *v11;
  HKClinicalAuthorizationNewRecordsViewController *v12;
  HKClinicalAuthorizationDisplayController *v13;
  void *v14;
  uint64_t v15;
  HKClinicalAuthorizationDisplayController *displayController;
  objc_super v18;

  v5 = a3;
  HKHealthRecordsAPILocalizedString(CFSTR("NEW_RECORDS_MAIN_TITLE"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKClinicalAuthorizationNewRecordsViewController context](self, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "source");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  HKHealthRecordsAPILocalizedStringWithSource(CFSTR("APP_ACCESS_REQUEST_NEW_RECORDS"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[HKClinicalAuthorizationFlowManager tableViewHeaderIcon](HKClinicalAuthorizationFlowManager, "tableViewHeaderIcon");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18.receiver = self;
  v18.super_class = (Class)HKClinicalAuthorizationNewRecordsViewController;
  v11 = -[OBTableWelcomeController initWithTitle:detailText:icon:adoptTableViewScrollView:](&v18, sel_initWithTitle_detailText_icon_adoptTableViewScrollView_, v6, v9, v10, 1);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_context, a3);
    v13 = [HKClinicalAuthorizationDisplayController alloc];
    objc_msgSend(v5, "authorizationController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[HKClinicalAuthorizationDisplayController initWithAuthorizationController:](v13, "initWithAuthorizationController:", v14);
    displayController = v12->_displayController;
    v12->_displayController = (HKClinicalAuthorizationDisplayController *)v15;

    -[HKClinicalAuthorizationNewRecordsViewController setAuthorizationMode:](v12, "setAuthorizationMode:", 1);
    -[HKClinicalAuthorizationNewRecordsViewController setShouldMoveHeaderViewTitleToNavigationTitleWhenScrolledOffScreen:](v12, "setShouldMoveHeaderViewTitleToNavigationTitleWhenScrolledOffScreen:", 0);
  }

  return v12;
}

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HKClinicalAuthorizationNewRecordsViewController;
  -[OBTableWelcomeController viewDidLoad](&v4, sel_viewDidLoad);
  -[HKClinicalAuthorizationNewRecordsViewController _configureTableView](self, "_configureTableView");
  -[HKClinicalAuthorizationNewRecordsViewController _configureNavigationItem](self, "_configureNavigationItem");
  -[HKClinicalAuthorizationNewRecordsViewController _setUpFooterView](self, "_setUpFooterView");
  -[HKClinicalAuthorizationNewRecordsViewController setModalInPresentation:](self, "setModalInPresentation:", 1);
  -[HKClinicalAuthorizationSequenceContext authFlowManager](self->_context, "authFlowManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerIngestionStatusObserver:", self);

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HKClinicalAuthorizationNewRecordsViewController;
  -[OBBaseWelcomeController viewDidAppear:](&v5, sel_viewDidAppear_, a3);
  -[OBTableWelcomeController tableView](self, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "flashScrollIndicators");

}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HKClinicalAuthorizationNewRecordsViewController;
  -[HKClinicalAuthorizationNewRecordsViewController viewWillDisappear:](&v4, sel_viewWillDisappear_, a3);
  self->_isWaitingForDoneAction = 0;
  -[HKClinicalAuthorizationNewRecordsViewController _updateDownloadingStatusIndicator](self, "_updateDownloadingStatusIndicator");
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
  id v14;

  v3 = objc_alloc(MEMORY[0x1E0DC3D48]);
  v4 = (void *)objc_msgSend(v3, "initWithFrame:style:", 2, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[OBTableWelcomeController setTableView:](self, "setTableView:", v4);

  -[OBTableWelcomeController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDataSource:", self);

  -[OBTableWelcomeController tableView](self, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDelegate:", self);

  -[HKClinicalAuthorizationNewRecordsViewController traitCollection](self, "traitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "userInterfaceIdiom");

  if (v8 != 6)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKClinicalAuthorizationNewRecordsViewController view](self, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setBackgroundColor:", v9);

    -[HKClinicalAuthorizationNewRecordsViewController view](self, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "backgroundColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBTableWelcomeController tableView](self, "tableView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setBackgroundColor:", v12);

  }
  -[OBTableWelcomeController tableView](self, "tableView");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("AuthorizationModeCellReuseIdentifier"));

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

  HKHealthRecordsAPILocalizedString(CFSTR("IN_APP_SEQUENCE_TITLE_NEW_RECORDS"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTitle:", v6);

  HKHealthRecordsAPILocalizedString(CFSTR("IN_APP_SEQUENCE_TITLE_ACCESSIBILITY_%@"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAccessibilityLabel:", v7);

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 1, self, sel__cancelButtonPressed_);
  objc_msgSend(v9, "setRightBarButtonItem:", v8);

}

- (void)_setUpFooterView
{
  OBBoldTrayButton *v3;
  OBBoldTrayButton *doneButton;
  OBBoldTrayButton *v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0D65140], "boldButton");
  v3 = (OBBoldTrayButton *)objc_claimAutoreleasedReturnValue();
  doneButton = self->_doneButton;
  self->_doneButton = v3;

  v5 = self->_doneButton;
  HKHealthRecordsAPILocalizedString(CFSTR("NEW_RECORDS_DONE_BUTTON_TITLE"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBBoldTrayButton setTitle:forState:](v5, "setTitle:forState:", v6, 0);

  -[OBBoldTrayButton addTarget:action:forControlEvents:](self->_doneButton, "addTarget:action:forControlEvents:", self, sel__doneButtonPressed_, 64);
  -[HKClinicalAuthorizationNewRecordsViewController buttonTray](self, "buttonTray");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addButton:", self->_doneButton);

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
  if (!-[HKClinicalAuthorizationNewRecordsViewController _indexPathIsValidRow:](self, "_indexPathIsValidRow:", v5))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKClinicalAuthorizationNewRecordsViewController.m"), 144, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[self _indexPathIsValidRow:indexPath]"));

  }
  v6 = objc_msgSend(v5, "row");
  v7 = v6;
  if (v6 >= 2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKClinicalAuthorizationNewRecordsViewController.m"), 146, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("row < _AuthorizationModeCount"));

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
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKClinicalAuthorizationNewRecordsViewController.m"), 154, CFSTR("Invalid row: %ld"), v7);

  }
  v9 = 0;
LABEL_10:

  return v9;
}

- (id)_indexPathForShareAuthorizationMode:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;

  v3 = 0x7FFFFFFFFFFFFFFFLL;
  if (a3 == 1)
    v3 = 0;
  if (a3)
    v4 = v3;
  else
    v4 = 1;
  return (id)objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v4, 0);
}

- (id)_visibleShareAuthorizationModeCellForMode:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[HKClinicalAuthorizationNewRecordsViewController _indexPathForShareAuthorizationMode:](self, "_indexPathForShareAuthorizationMode:", a3);
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

- (id)_shareAuthorizationModeCellForIndexPath:(id)a3
{
  id v4;
  int64_t v5;
  void *v6;
  void *v7;
  void *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v4 = a3;
  v5 = -[HKClinicalAuthorizationNewRecordsViewController _shareAuthorizationModeForIndexPath:](self, "_shareAuthorizationModeForIndexPath:", v4);
  -[OBTableWelcomeController tableView](self, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("AuthorizationModeCellReuseIdentifier"), v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v8 = &unk_1E9CE9DA0;
    v9 = CFSTR("CONTINUOUS_AUTHORIZATION");
    goto LABEL_5;
  }
  if (v5 == 1)
  {
    v8 = &unk_1E9CE9DB8;
    v9 = CFSTR("ONE_TIME_AUTHORIZATION");
LABEL_5:
    HKHealthRecordsAPILocalizedString(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    HKUIJoinStringsForAutomationIdentifier(v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAccessibilityIdentifier:", v11);

    goto LABEL_7;
  }
  v10 = 0;
LABEL_7:
  if (-[HKClinicalAuthorizationNewRecordsViewController authorizationMode](self, "authorizationMode") == v5)
    v12 = 3;
  else
    v12 = 0;
  objc_msgSend(v7, "setAccessoryType:", v12);
  objc_msgSend(v7, "textLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setText:", v10);

  return v7;
}

- (id)_titleForShareAuthorizationModeFooter
{
  int64_t v3;
  void *v4;
  void *v5;
  _QWORD v7[5];

  v3 = -[HKClinicalAuthorizationNewRecordsViewController authorizationMode](self, "authorizationMode");
  -[HKClinicalAuthorizationNewRecordsViewController displayController](self, "displayController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __88__HKClinicalAuthorizationNewRecordsViewController__titleForShareAuthorizationModeFooter__block_invoke;
  v7[3] = &unk_1E9C41748;
  v7[4] = self;
  objc_msgSend(v4, "currentTimeTitleForReadAuthorizationModeFooterWithSelectedMode:formatBlock:", v3, v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __88__HKClinicalAuthorizationNewRecordsViewController__titleForShareAuthorizationModeFooter__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  void *v4;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  __CFString *v13;
  void *v14;
  void *v15;

  v8 = a2;
  v9 = a4;
  if (a3 == 1)
  {
    v10 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(*(id *)(a1 + 32), "context");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "source");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = CFSTR("NEW_RECORDS_ONE_TIME_AUTHORIZATION_APP_%1$@_DATE_%2$@_CONFIRMATION");
    goto LABEL_5;
  }
  if (!a3)
  {
    v10 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(*(id *)(a1 + 32), "context");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "source");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = CFSTR("NEW_RECORDS_CONTINUOUS_AUTHORIZATION_APP_%1$@_DATE_%2$@_CONFIRMATION");
LABEL_5:
    HKHealthRecordsAPILocalizedStringWithSource(v13, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "name");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(v10, "initWithFormat:", v14, v15, v8);

  }
  return v4;
}

- (void)_updateShareAuthorizationModeSectionFooter
{
  id v2;

  -[OBTableWelcomeController tableView](self, "tableView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reloadData");

}

- (void)_doneButtonPressed:(id)a3
{
  void *v4;
  void *v5;

  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  if (self->_isCurrentlyIngesting)
  {
    self->_isWaitingForDoneAction = 1;
    -[HKClinicalAuthorizationNewRecordsViewController _updateDownloadingStatusIndicator](self, "_updateDownloadingStatusIndicator");
  }
  else
  {
    -[HKClinicalAuthorizationNewRecordsViewController context](self, "context");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "authorizationController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "commitAllTypesAndUpdateAuthorizationAnchorWithMode:", -[HKClinicalAuthorizationNewRecordsViewController authorizationMode](self, "authorizationMode"));

    -[HKClinicalAuthorizationNewRecordsViewController _finishWithError:](self, "_finishWithError:", 0);
  }
}

- (void)_cancelButtonPressed:(id)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 7, CFSTR("The user canceled authorization."));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[HKClinicalAuthorizationNewRecordsViewController _finishWithError:](self, "_finishWithError:", v4);

}

- (void)_updateDownloadingStatusIndicator
{
  OBBoldTrayButton *doneButton;

  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  doneButton = self->_doneButton;
  if (self->_isCurrentlyIngesting)
    -[OBBoldTrayButton showsBusyIndicator](doneButton, "showsBusyIndicator");
  else
    -[OBBoldTrayButton hidesBusyIndicator](doneButton, "hidesBusyIndicator");
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
  -[HKClinicalAuthorizationNewRecordsViewController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "promptControllerDidFinish:error:", self, v4);

}

- (void)_shareAuthorizationModeCellPressed:(id)a3
{
  void *v4;
  void *v5;
  int64_t v6;
  void *v7;
  id v8;

  v8 = a3;
  -[OBTableWelcomeController tableView](self, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "indexPathForCell:", v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[HKClinicalAuthorizationNewRecordsViewController _shareAuthorizationModeForIndexPath:](self, "_shareAuthorizationModeForIndexPath:", v5);
  if (v6 != -[HKClinicalAuthorizationNewRecordsViewController authorizationMode](self, "authorizationMode"))
  {
    -[HKClinicalAuthorizationNewRecordsViewController _visibleShareAuthorizationModeCellForMode:](self, "_visibleShareAuthorizationModeCellForMode:", -[HKClinicalAuthorizationNewRecordsViewController authorizationMode](self, "authorizationMode"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKClinicalAuthorizationNewRecordsViewController setAuthorizationMode:](self, "setAuthorizationMode:", v6);
    objc_msgSend(v7, "setAccessoryType:", 0);
    objc_msgSend(v8, "setAccessoryType:", 3);
    -[HKClinicalAuthorizationNewRecordsViewController _updateShareAuthorizationModeSectionFooter](self, "_updateShareAuthorizationModeSectionFooter");

  }
}

- (void)ingestionStatusDidChangeTo:(unint64_t)a3
{
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  self->_isCurrentlyIngesting = a3 == 2;
  if (a3 != 2 && self->_isWaitingForDoneAction)
  {
    self->_isWaitingForDoneAction = 0;
    -[HKClinicalAuthorizationNewRecordsViewController _updateDownloadingStatusIndicator](self, "_updateDownloadingStatusIndicator");
    -[HKClinicalAuthorizationNewRecordsViewController _doneButtonPressed:](self, "_doneButtonPressed:", 0);
  }
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v7;

  if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKClinicalAuthorizationNewRecordsViewController.m"), 293, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("section == 0"));

  }
  return 2;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v10;
  void *v11;

  v6 = a4;
  if (!-[HKClinicalAuthorizationNewRecordsViewController _indexPathIsValidRow:](self, "_indexPathIsValidRow:", v6))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKClinicalAuthorizationNewRecordsViewController.m"), 298, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[self _indexPathIsValidRow:indexPath]"));

  }
  if (objc_msgSend(v6, "section"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKClinicalAuthorizationNewRecordsViewController.m"), 299, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("indexPath.section == 0"));

  }
  -[HKClinicalAuthorizationNewRecordsViewController _shareAuthorizationModeCellForIndexPath:](self, "_shareAuthorizationModeCellForIndexPath:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hkui_configuredForCHR3rdPartyAPIFlowWhilePrompting:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  void *v7;

  if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKClinicalAuthorizationNewRecordsViewController.m"), 305, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("section == 0"));

  }
  return -[HKClinicalAuthorizationNewRecordsViewController _titleForShareAuthorizationModeFooter](self, "_titleForShareAuthorizationModeFooter", a3);
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v7;
  id v8;
  void *v9;
  id v10;

  v7 = a4;
  v8 = a3;
  if (objc_msgSend(v7, "section"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKClinicalAuthorizationNewRecordsViewController.m"), 310, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("indexPath.section == 0"));

  }
  objc_msgSend(v8, "cellForRowAtIndexPath:", v7);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[HKClinicalAuthorizationNewRecordsViewController _shareAuthorizationModeCellPressed:](self, "_shareAuthorizationModeCellPressed:", v10);
  objc_msgSend(v8, "deselectRowAtIndexPath:animated:", v7, 1);

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
  v10.super_class = (Class)HKClinicalAuthorizationNewRecordsViewController;
  -[HKClinicalAuthorizationNewRecordsViewController traitCollectionDidChange:](&v10, sel_traitCollectionDidChange_, v4);
  if (v4)
  {
    -[HKClinicalAuthorizationNewRecordsViewController traitCollection](self, "traitCollection");
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
      block[2] = __76__HKClinicalAuthorizationNewRecordsViewController_traitCollectionDidChange___block_invoke;
      block[3] = &unk_1E9C3F0D0;
      block[4] = self;
      dispatch_async(MEMORY[0x1E0C80D38], block);
    }
  }

}

uint64_t __76__HKClinicalAuthorizationNewRecordsViewController_traitCollectionDidChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateForCurrentContentSizeCategory");
}

- (HKClinicalAuthorizationSequenceContext)context
{
  return self->_context;
}

- (HKHealthPrivacyServicePromptControllerDelegate)delegate
{
  return (HKHealthPrivacyServicePromptControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_doneButton, 0);
}

@end
