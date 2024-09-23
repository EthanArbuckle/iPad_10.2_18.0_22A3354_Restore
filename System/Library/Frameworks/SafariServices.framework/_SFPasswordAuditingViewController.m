@implementation _SFPasswordAuditingViewController

+ (id)securityRecommendationsViewControllerWithSiteMetadataManager:(id)a3 autoFillQuirksManager:(id)a4 passwordWarningManager:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithPersona:siteMetadataManager:autoFillQuirksManager:passwordWarningManager:", 0, v10, v9, v8);

  return v11;
}

+ (id)hiddenSecurityRecommendationsViewControllerWithWarningData:(id)a3 siteMetadataManager:(id)a4 passwordWarningManager:(id)a5
{
  id v8;
  id v9;
  id v10;
  _QWORD *v11;
  void *v12;

  v8 = a3;
  v9 = a5;
  v10 = a4;
  v11 = (_QWORD *)objc_msgSend(objc_alloc((Class)a1), "initWithPersona:siteMetadataManager:autoFillQuirksManager:passwordWarningManager:", 1, v10, 0, v9);

  v12 = (void *)v11[152];
  v11[152] = v8;

  return v11;
}

- (_SFPasswordAuditingViewController)initWithPersona:(unint64_t)a3 siteMetadataManager:(id)a4 autoFillQuirksManager:(id)a5 passwordWarningManager:(id)a6
{
  id v11;
  id v12;
  id v13;
  _SFAccountTableConfiguration *v14;
  _SFPasswordAuditingViewController *v15;
  _SFPasswordAuditingViewController *v16;
  uint64_t v17;
  WBSSavedAccountStore *savedAccountStore;
  ASAccountAuthenticationModificationController *v19;
  ASAccountAuthenticationModificationController *accountAuthenticationModificationController;
  void *v21;
  dispatch_queue_t v22;
  OS_dispatch_queue *diffableDataSourceQueue;
  void *v24;
  id v25;
  _SFPasswordAuditingViewController *v26;
  objc_super v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = objc_alloc_init(_SFAccountTableConfiguration);
  -[_SFAccountTableConfiguration setShouldShowSearchBar:](v14, "setShouldShowSearchBar:", 0);
  v28.receiver = self;
  v28.super_class = (Class)_SFPasswordAuditingViewController;
  v15 = -[_SFAccountTableViewController initWithSiteMetadataManager:configuration:](&v28, sel_initWithSiteMetadataManager_configuration_, v11, v14);
  v16 = v15;
  if (v15)
  {
    v15->_persona = a3;
    objc_storeStrong((id *)&v15->_autoFillQuirksManager, a5);
    objc_msgSend(MEMORY[0x1E0D8AC08], "sharedStore");
    v17 = objc_claimAutoreleasedReturnValue();
    savedAccountStore = v16->_savedAccountStore;
    v16->_savedAccountStore = (WBSSavedAccountStore *)v17;

    objc_storeStrong((id *)&v16->_passwordWarningManager, a6);
    v16->_numberOfWarnings = -1;
    v19 = (ASAccountAuthenticationModificationController *)objc_alloc_init(MEMORY[0x1E0C925A0]);
    accountAuthenticationModificationController = v16->_accountAuthenticationModificationController;
    v16->_accountAuthenticationModificationController = v19;

    -[ASAccountAuthenticationModificationController setDelegate:](v16->_accountAuthenticationModificationController, "setDelegate:", v16);
    -[ASAccountAuthenticationModificationController setPresentationContextProvider:](v16->_accountAuthenticationModificationController, "setPresentationContextProvider:", v16);
    objc_storeStrong((id *)&v16->_siteMetadataManager, a4);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addObserver:selector:name:object:", v16, sel__accountStoreDidUpdate, *MEMORY[0x1E0D8B490], 0);

    v22 = dispatch_queue_create("com.apple.Safari.SecurityRecommendations", 0);
    diffableDataSourceQueue = v16->_diffableDataSourceQueue;
    v16->_diffableDataSourceQueue = (OS_dispatch_queue *)v22;

    v29[0] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (id)-[_SFPasswordAuditingViewController registerForTraitChanges:withTarget:action:](v16, "registerForTraitChanges:withTarget:action:", v24, v16, sel__reloadTableViewDiffableDataSource);

    v26 = v16;
  }

  return v16;
}

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(obj, "passwordAuditingViewController:didUpdateNumberOfFlaggedPasswords:", self, self->_numberOfWarnings);
  }

}

- (BOOL)canBeShownFromSuspendedState
{
  return 1;
}

- (void)viewDidLoad
{
  void *v3;
  id v4;
  void *v5;
  SFTableViewDiffableDataSource *v6;
  SFTableViewDiffableDataSource *tableViewDiffableDataSource;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  UIActivityIndicatorView *v14;
  UIActivityIndicatorView *spinner;
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
  _QWORD v27[4];
  id v28;
  objc_super v29;
  id location;
  _QWORD v31[3];

  v31[2] = *MEMORY[0x1E0C80C00];
  objc_initWeak(&location, self);
  v29.receiver = self;
  v29.super_class = (Class)_SFPasswordAuditingViewController;
  -[_SFAccountTableViewController viewDidLoad](&v29, sel_viewDidLoad);
  -[_SFPasswordAuditingViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityIdentifier:", CFSTR("Security Recommendations View"));

  v4 = objc_alloc(MEMORY[0x1E0D4EE40]);
  -[_SFPasswordAuditingViewController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = 3221225472;
  v27[2] = __48___SFPasswordAuditingViewController_viewDidLoad__block_invoke;
  v27[3] = &unk_1E4ABFD40;
  v27[0] = MEMORY[0x1E0C809B0];
  objc_copyWeak(&v28, &location);
  v6 = (SFTableViewDiffableDataSource *)objc_msgSend(v4, "initWithTableView:cellProvider:", v5, v27);
  tableViewDiffableDataSource = self->_tableViewDiffableDataSource;
  self->_tableViewDiffableDataSource = v6;

  -[_SFPasswordAuditingViewController tableView](self, "tableView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setCellLayoutMarginsFollowReadableWidth:", 1);

  -[SFTableViewDiffableDataSource setDelegate:](self->_tableViewDiffableDataSource, "setDelegate:", self);
  -[SFTableViewDiffableDataSource setDefaultRowAnimation:](self->_tableViewDiffableDataSource, "setDefaultRowAnimation:", 0);
  -[_SFPasswordAuditingViewController navigationItem](self, "navigationItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_persona == 1)
  {
    _WBSLocalizedString();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTitle:", v10);

    objc_msgSend(v9, "backBarButtonItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setAccessibilityIdentifier:", CFSTR("Hidden Security Recommendations Back Button"));

    -[_SFPasswordAuditingViewController _reloadTableViewDiffableDataSource](self, "_reloadTableViewDiffableDataSource");
  }
  else
  {
    _WBSLocalizedString();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTitle:", v12);

    objc_msgSend(v9, "backBarButtonItem");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setAccessibilityIdentifier:", CFSTR("Security Recommendations Back Button"));

    v14 = (UIActivityIndicatorView *)objc_alloc_init(MEMORY[0x1E0DC3438]);
    spinner = self->_spinner;
    self->_spinner = v14;

    -[UIActivityIndicatorView setTranslatesAutoresizingMaskIntoConstraints:](self->_spinner, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIActivityIndicatorView setActivityIndicatorViewStyle:](self->_spinner, "setActivityIndicatorViewStyle:", 101);
    -[UIActivityIndicatorView setHidesWhenStopped:](self->_spinner, "setHidesWhenStopped:", 1);
    -[_SFPasswordAuditingViewController view](self, "view");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addSubview:", self->_spinner);

    v26 = (void *)MEMORY[0x1E0CB3718];
    -[UIActivityIndicatorView centerXAnchor](self->_spinner, "centerXAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SFPasswordAuditingViewController view](self, "view");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "centerXAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintEqualToAnchor:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = v20;
    -[UIActivityIndicatorView centerYAnchor](self->_spinner, "centerYAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SFPasswordAuditingViewController view](self, "view");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "centerYAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "constraintEqualToAnchor:constant:", v23, -80.0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v31[1] = v24;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 2);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "activateConstraints:", v25);

  }
  objc_destroyWeak(&v28);
  objc_destroyWeak(&location);
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  WBSPasswordWarning *warningDeletedInDetailView;
  WBSPasswordWarning *warningHiddenInDetailView;
  void *v8;
  WBSPasswordWarning *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_SFPasswordAuditingViewController;
  -[_SFAccountTableViewController viewWillAppear:](&v10, sel_viewWillAppear_, a3);
  objc_msgSend(MEMORY[0x1E0C925F8], "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addChangeObserver:", self);

  v5 = 1232;
  if (self->_savedAccountToRemoveAfterCompletedUpgradeInDetailView)
  {
    -[_SFPasswordAuditingViewController _findAndRemoveEntryForSavedAccount:](self, "_findAndRemoveEntryForSavedAccount:");
    goto LABEL_3;
  }
  if (self->_persona == 1)
  {
    v5 = 1200;
    warningDeletedInDetailView = self->_warningDeletedInDetailView;
    if (!warningDeletedInDetailView)
      goto LABEL_4;
    -[_SFPasswordAuditingViewController _reloadSavedAccountsForceUpdate:](self, "_reloadSavedAccountsForceUpdate:", 0);
LABEL_3:
    warningDeletedInDetailView = *(Class *)((char *)&self->super.super.super.super.super.isa + v5);
LABEL_4:
    *(Class *)((char *)&self->super.super.super.super.super.isa + v5) = 0;

    return;
  }
  warningHiddenInDetailView = self->_warningHiddenInDetailView;
  if (warningHiddenInDetailView)
  {
    -[WBSPasswordWarning savedAccount](warningHiddenInDetailView, "savedAccount");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SFPasswordAuditingViewController _findAndRemoveEntryForSavedAccount:](self, "_findAndRemoveEntryForSavedAccount:", v8);
    -[_SFPasswordAuditingViewController _addWarningToHiddenRecommendationData:](self, "_addWarningToHiddenRecommendationData:", self->_warningHiddenInDetailView);
    v9 = self->_warningHiddenInDetailView;
    self->_warningHiddenInDetailView = 0;

    -[_SFPasswordAuditingViewController _addHiddenSecurityRecommendationsSectionIfNecessary](self, "_addHiddenSecurityRecommendationsSectionIfNecessary");
  }
  else
  {
    -[_SFPasswordAuditingViewController _reloadSavedAccountsForceUpdate:](self, "_reloadSavedAccountsForceUpdate:", 0);
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_SFPasswordAuditingViewController;
  -[_SFAccountTableViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  if (!self->_persona)
    -[WBSPasswordWarningManager acknowledgeHighPriorityWarnings](self->_passwordWarningManager, "acknowledgeHighPriorityWarnings");
}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_SFPasswordAuditingViewController;
  -[_SFAccountTableViewController viewDidDisappear:](&v5, sel_viewDidDisappear_, a3);
  objc_msgSend(MEMORY[0x1E0C925F8], "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeChangeObserver:", self);

}

- (void)_findAndRemoveEntryForSavedAccount:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  NSObject *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  dispatch_time_t v37;
  NSObject *diffableDataSourceQueue;
  _QWORD *v39;
  id v40;
  _SFPasswordAuditingViewController *v41;
  NSArray *obj;
  void *v43;
  _QWORD block[6];
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _QWORD v49[6];
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _QWORD v54[6];
  _BYTE v55[128];
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_persona == 1)
  {
    -[_SFPasswordAuditingViewController _removeHideWarningMarkerForSavedAccount:](self, "_removeHideWarningMarkerForSavedAccount:", v4);
  }
  else
  {
    -[_SFPasswordAuditingViewController tableView](self, "tableView");
    v43 = v4;
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setUserInteractionEnabled:", 0);

    v4 = v43;
    v6 = objc_alloc_init(MEMORY[0x1E0D8AC10]);
    v54[0] = MEMORY[0x1E0C809B0];
    v54[1] = 3221225472;
    v54[2] = __72___SFPasswordAuditingViewController__findAndRemoveEntryForSavedAccount___block_invoke;
    v54[3] = &unk_1E4ABFBC0;
    v54[4] = self;
    v54[5] = 1000000000;
    v40 = v6;
    objc_msgSend(v6, "setHandler:", v54);
    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    v41 = self;
    obj = self->_highPriorityRecommendationData;
    v7 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v50, v56, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v51;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v51 != v9)
            objc_enumerationMutation(obj);
          v11 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * i);
          objc_msgSend(v11, "accountCellData");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "savedAccount");
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v13, "user");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "user");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v14, "isEqualToString:", v15) & 1) != 0)
          {
            objc_msgSend(v13, "highLevelDomain");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "highLevelDomain");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = objc_msgSend(v16, "isEqualToString:", v17);

            v4 = v43;
            if (v18)
            {
              v37 = dispatch_time(0, 1000000000);
              diffableDataSourceQueue = v41->_diffableDataSourceQueue;
              v49[0] = MEMORY[0x1E0C809B0];
              v49[1] = 3221225472;
              v49[2] = __72___SFPasswordAuditingViewController__findAndRemoveEntryForSavedAccount___block_invoke_3;
              v49[3] = &unk_1E4ABFB20;
              v49[4] = v41;
              v49[5] = v11;
              v39 = v49;
LABEL_27:
              dispatch_after(v37, diffableDataSourceQueue, v39);

              goto LABEL_28;
            }
          }
          else
          {

          }
        }
        v8 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v50, v56, 16);
        if (v8)
          continue;
        break;
      }
    }

    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    obj = v41->_flaggedPasswordData;
    v19 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v45, v55, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v46;
      do
      {
        for (j = 0; j != v20; ++j)
        {
          if (*(_QWORD *)v46 != v21)
            objc_enumerationMutation(obj);
          v23 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * j);
          objc_msgSend(v23, "savedAccount");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "user");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "user");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v24, "isEqualToString:", v25) & 1) != 0)
          {
            objc_msgSend(v13, "highLevelDomain");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "highLevelDomain");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = objc_msgSend(v26, "isEqualToString:", v27);

            v4 = v43;
            if (v28)
            {
              v37 = dispatch_time(0, 1000000000);
              diffableDataSourceQueue = v41->_diffableDataSourceQueue;
              block[0] = MEMORY[0x1E0C809B0];
              block[1] = 3221225472;
              block[2] = __72___SFPasswordAuditingViewController__findAndRemoveEntryForSavedAccount___block_invoke_6;
              block[3] = &unk_1E4ABFB20;
              block[4] = v41;
              block[5] = v23;
              v39 = block;
              goto LABEL_27;
            }
          }
          else
          {

          }
        }
        v20 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v45, v55, 16);
      }
      while (v20);
    }

    v29 = WBS_LOG_CHANNEL_PREFIXPasswords();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      -[_SFPasswordAuditingViewController _findAndRemoveEntryForSavedAccount:].cold.1(v29, v30, v31, v32, v33, v34, v35, v36);
LABEL_28:

  }
}

- (void)_addWarningToHiddenRecommendationData:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  _BOOL8 v9;
  void *v10;
  NSArray *v11;
  SFActionableSecurityRecommendationData *v12;
  NSArray *hiddenRecommendationData;
  id v14;

  v4 = (void *)MEMORY[0x1E0D8AC08];
  v5 = a3;
  objc_msgSend(v4, "sharedStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "savedAccount");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "highLevelDomain");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "numberOfSavedAccountsInPersonalKeychainForHighLevelDomain:", v8) == 1;

  objc_msgSend(v5, "savedAccount");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[SFAccountCellData accountCellDataWithSavedAccount:warning:searchPattern:savedAccountIsOnlySavedAccountForHighLevelDomain:](SFAccountCellData, "accountCellDataWithSavedAccount:warning:searchPattern:savedAccountIsOnlySavedAccountForHighLevelDomain:", v10, v5, 0, v9);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  v11 = (NSArray *)-[NSArray mutableCopy](self->_hiddenRecommendationData, "mutableCopy");
  v12 = -[SFActionableSecurityRecommendationData initWithAccountCellData:warning:delegate:]([SFActionableSecurityRecommendationData alloc], "initWithAccountCellData:warning:delegate:", v14, v5, self);

  -[NSArray addObject:](v11, "addObject:", v12);
  hiddenRecommendationData = self->_hiddenRecommendationData;
  self->_hiddenRecommendationData = v11;

}

- (void)_reloadSavedAccountsForceUpdate:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  uint64_t v7;
  CFAbsoluteTime Current;
  WBSPasswordWarningManager *passwordWarningManager;
  _QWORD v10[4];
  id v11[2];
  id location;

  v3 = a3;
  objc_initWeak(&location, self);
  -[_SFPasswordAuditingViewController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "visibleCells");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (!v7)
    -[UIActivityIndicatorView startAnimating](self->_spinner, "startAnimating");
  Current = CFAbsoluteTimeGetCurrent();
  passwordWarningManager = self->_passwordWarningManager;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __69___SFPasswordAuditingViewController__reloadSavedAccountsForceUpdate___block_invoke;
  v10[3] = &unk_1E4AC54E0;
  objc_copyWeak(v11, &location);
  v11[1] = *(id *)&Current;
  -[WBSPasswordWarningManager getAllWarningsForcingUpdate:completionHandler:](passwordWarningManager, "getAllWarningsForcingUpdate:completionHandler:", v3, v10);
  objc_destroyWeak(v11);
  objc_destroyWeak(&location);
}

- (id)_cellForIdentifier:(id)a3 indexPath:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "isEqual:", CFSTR("Hidden Security Recommendations Item")))
  {
    -[_SFPasswordAuditingViewController _hiddenSecurityRecommendationsCell](self, "_hiddenSecurityRecommendationsCell");
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if (objc_msgSend(v6, "isEqual:", CFSTR("Password Breach Toggle")))
        {
          -[_SFPasswordAuditingViewController _passwordBreachToggleCell](self, "_passwordBreachToggleCell");
          v8 = objc_claimAutoreleasedReturnValue();
          goto LABEL_3;
        }
        if (objc_msgSend(v6, "isEqual:", CFSTR("Reset Hidden Security Recommendations Item")))
        {
          -[_SFPasswordAuditingViewController _resetHiddenSecurityRecommendationsCell](self, "_resetHiddenSecurityRecommendationsCell");
          v8 = objc_claimAutoreleasedReturnValue();
          goto LABEL_3;
        }
      }
      v9 = 0;
      goto LABEL_16;
    }
    -[_SFPasswordAuditingViewController _standardRecommendationCellWithPasswordCellData:](self, "_standardRecommendationCellWithPasswordCellData:", v6);
    v8 = objc_claimAutoreleasedReturnValue();
LABEL_3:
    v9 = (void *)v8;
    goto LABEL_16;
  }
  -[SFTableViewDiffableDataSource snapshot](self->_tableViewDiffableDataSource, "snapshot");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sectionIdentifiers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectAtIndexedSubscript:", objc_msgSend(v7, "section"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[_SFPasswordAuditingViewController tableView](self, "tableView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cellType");
  v14 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "cellForTableView:forCellType:", v13, v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "cellType");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  LOBYTE(v14) = objc_opt_isKindOfClass();

  if ((v14 & 1) != 0)
    -[_SFPasswordAuditingViewController _configureSecurityRecommendationInformationCell:withActionableRecommendationData:](self, "_configureSecurityRecommendationInformationCell:withActionableRecommendationData:", v9, v12);

LABEL_16:
  return v9;
}

- (void)_reloadTableViewDiffableDataSource
{
  NSObject *diffableDataSourceQueue;
  _QWORD block[5];

  diffableDataSourceQueue = self->_diffableDataSourceQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71___SFPasswordAuditingViewController__reloadTableViewDiffableDataSource__block_invoke;
  block[3] = &unk_1E4ABFE00;
  block[4] = self;
  dispatch_async(diffableDataSourceQueue, block);
}

- (void)_reloadTableViewDiffableDataSourceAnimated:(BOOL)a3
{
  NSObject *diffableDataSourceQueue;
  _QWORD v4[5];
  BOOL v5;

  diffableDataSourceQueue = self->_diffableDataSourceQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __80___SFPasswordAuditingViewController__reloadTableViewDiffableDataSourceAnimated___block_invoke;
  v4[3] = &unk_1E4AC08D8;
  v4[4] = self;
  v5 = a3;
  dispatch_async(diffableDataSourceQueue, v4);
}

- (void)_reloadTableViewDiffableDataSourceOnInternalQueueAnimated:(BOOL)a3
{
  unint64_t persona;

  persona = self->_persona;
  if (persona == 1)
  {
    -[_SFPasswordAuditingViewController _reloadTableViewDiffableDataSourceOnInternalQueueForHiddenSecurityRecommendationsPersona](self, "_reloadTableViewDiffableDataSourceOnInternalQueueForHiddenSecurityRecommendationsPersona", a3);
  }
  else if (!persona)
  {
    -[_SFPasswordAuditingViewController _reloadTableViewDiffableDataSourceOnInternalQueueForSecurityRecommendationsPersonaAnimated:](self, "_reloadTableViewDiffableDataSourceOnInternalQueueForSecurityRecommendationsPersonaAnimated:", a3);
  }
}

- (void)_reloadTableViewDiffableDataSourceOnInternalQueueForSecurityRecommendationsPersonaAnimated:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  void *v6;
  void *v7;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  const __CFString *v23;
  const __CFString *v24;
  const __CFString *v25;
  void *v26;
  _BYTE v27[128];
  const __CFString *v28;
  _QWORD v29[3];

  v3 = a3;
  v29[1] = *MEMORY[0x1E0C80C00];
  v5 = objc_alloc_init(MEMORY[0x1E0DC3398]);
  v29[0] = CFSTR("Password Breaches");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendSectionsWithIdentifiers:", v6);

  v28 = CFSTR("Password Breach Toggle");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v28, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v7, CFSTR("Password Breaches"));

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v8 = self->_highPriorityRecommendationData;
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v20;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v20 != v11)
          objc_enumerationMutation(v8);
        v26 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v12);
        v13 = v26;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v26, 1, (_QWORD)v19);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "appendSectionsWithIdentifiers:", v14);

        objc_msgSend(v13, "items");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v15, v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    }
    while (v10);
  }

  if (-[NSArray count](self->_flaggedPasswordData, "count"))
  {
    v25 = CFSTR("Other Recommendations");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v25, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendSectionsWithIdentifiers:", v16);

    objc_msgSend(v5, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", self->_flaggedPasswordData, CFSTR("Other Recommendations"));
  }
  if (-[NSArray count](self->_hiddenRecommendationData, "count", (_QWORD)v19))
  {
    v24 = CFSTR("Hidden Security Recommendations Section");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v24, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendSectionsWithIdentifiers:", v17);

    v23 = CFSTR("Hidden Security Recommendations Item");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v23, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v18, CFSTR("Hidden Security Recommendations Section"));

  }
  -[SFTableViewDiffableDataSource applySnapshot:animatingDifferences:](self->_tableViewDiffableDataSource, "applySnapshot:animatingDifferences:", v5, v3);

}

- (void)_reloadTableViewDiffableDataSourceOnInternalQueueForHiddenSecurityRecommendationsPersona
{
  id v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  const __CFString *v18;
  const __CFString *v19;
  void *v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0DC3398]);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = self->_hiddenRecommendationData;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v21, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v20 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v8);
        v9 = v20;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v20, 1, (_QWORD)v14);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendSectionsWithIdentifiers:", v10);

        objc_msgSend(v9, "items");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v11, v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v21, 16);
    }
    while (v6);
  }

  v19 = CFSTR("Reset Hidden Security Recommendations Section");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v19, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendSectionsWithIdentifiers:", v12);

  v18 = CFSTR("Reset Hidden Security Recommendations Item");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v18, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendItemsWithIdentifiers:", v13);

  -[SFTableViewDiffableDataSource applySnapshot:animatingDifferences:](self->_tableViewDiffableDataSource, "applySnapshot:animatingDifferences:", v3, 0);
}

- (void)_accountStoreDidUpdate
{
  SFActionableSecurityRecommendationData *recommendationForMostRecentSafariViewController;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id WeakRetained;
  SFActionableSecurityRecommendationData *v24;
  id obj;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  recommendationForMostRecentSafariViewController = self->_recommendationForMostRecentSafariViewController;
  if (recommendationForMostRecentSafariViewController)
  {
    -[SFActionableSecurityRecommendationData accountCellData](recommendationForMostRecentSafariViewController, "accountCellData");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "savedAccount");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    objc_msgSend(MEMORY[0x1E0D8AC08], "sharedStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "savedAccountsWithPasswords");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    obj = v6;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v28 != v9)
            objc_enumerationMutation(obj);
          v11 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
          objc_msgSend(v11, "highLevelDomain");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "highLevelDomain");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v12, "isEqualToString:", v13) & 1) != 0)
          {
            objc_msgSend(v11, "user");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "user");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend(v14, "isEqualToString:", v15);

            if (v16)
            {
              objc_msgSend(v11, "password");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "password");
              v18 = (void *)objc_claimAutoreleasedReturnValue();

              if (v17 == v18)
                goto LABEL_15;
              -[WBSPasswordWarningManager passwordEvaluator](self->_passwordWarningManager, "passwordEvaluator");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v11, "password");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "evaluatePassword:", v20);
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              v22 = objc_msgSend(v21, "strength");

              if (v22 == 2)
              {
                WeakRetained = objc_loadWeakRetained((id *)&self->_changePasswordOnWebsiteSafariViewController);
                objc_msgSend(WeakRetained, "setDismissButtonStyle:", 0);

                -[SFActionableSecurityRecommendationData setDidUpgradeToStrongPassword:](self->_recommendationForMostRecentSafariViewController, "setDidUpgradeToStrongPassword:", 1);
                -[_SFPasswordAuditingViewController _reloadTableViewDiffableDataSource](self, "_reloadTableViewDiffableDataSource");
              }
            }
          }
          else
          {

          }
        }
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      }
      while (v8);
    }
LABEL_15:

    v24 = self->_recommendationForMostRecentSafariViewController;
    self->_recommendationForMostRecentSafariViewController = 0;

  }
}

- (void)actionableSecurityRecommendationDataDidUpdate:(id)a3
{
  id v4;
  NSObject *diffableDataSourceQueue;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  diffableDataSourceQueue = self->_diffableDataSourceQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __83___SFPasswordAuditingViewController_actionableSecurityRecommendationDataDidUpdate___block_invoke;
  block[3] = &unk_1E4ABFF70;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(diffableDataSourceQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  SFAccountDetailViewController *v10;
  void *v11;
  void *v12;
  SFAccountDetailViewController *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  SFAccountDetailViewController *v20;
  void *v21;
  void *v22;
  SFAccountDetailViewController *v23;
  void *v24;
  id v25;

  v25 = a4;
  -[_SFPasswordAuditingViewController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deselectRowAtIndexPath:animated:", v25, 0);

  -[SFTableViewDiffableDataSource snapshot](self->_tableViewDiffableDataSource, "snapshot");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sectionIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndexedSubscript:", objc_msgSend(v25, "section"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(CFSTR("Password Breaches"), "isEqual:", v8) & 1) == 0)
  {
    if (objc_msgSend(CFSTR("Other Recommendations"), "isEqual:", v8))
    {
      -[NSArray objectAtIndexedSubscript:](self->_flaggedPasswordData, "objectAtIndexedSubscript:", objc_msgSend(v25, "row"));
      v9 = (id)objc_claimAutoreleasedReturnValue();
      v10 = [SFAccountDetailViewController alloc];
      objc_msgSend(v9, "savedAccount");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "warning");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[SFAccountDetailViewController initWithSavedAccount:passwordWarning:options:](v10, "initWithSavedAccount:passwordWarning:options:", v11, v12, 2);

      -[SFAccountDetailViewController setDelegate:](v13, "setDelegate:", self);
      -[_SFPasswordAuditingViewController navigationController](self, "navigationController");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "pushViewController:animated:", v13, 1);

LABEL_21:
      goto LABEL_22;
    }
    if (objc_msgSend(v8, "isEqual:", CFSTR("Hidden Security Recommendations Section")))
    {
      +[_SFPasswordAuditingViewController hiddenSecurityRecommendationsViewControllerWithWarningData:siteMetadataManager:passwordWarningManager:](_SFPasswordAuditingViewController, "hiddenSecurityRecommendationsViewControllerWithWarningData:siteMetadataManager:passwordWarningManager:", self->_hiddenRecommendationData, self->_siteMetadataManager, self->_passwordWarningManager);
      v9 = (id)objc_claimAutoreleasedReturnValue();
      -[_SFPasswordAuditingViewController navigationController](self, "navigationController");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "pushViewController:animated:", v9, 1);

LABEL_22:
      goto LABEL_23;
    }
    if (!objc_msgSend(v8, "isEqual:", CFSTR("Reset Hidden Security Recommendations Section")))
    {
      v9 = v8;
      -[SFTableViewDiffableDataSource itemIdentifierForIndexPath:](self->_tableViewDiffableDataSource, "itemIdentifierForIndexPath:", v25);
      v13 = (SFAccountDetailViewController *)objc_claimAutoreleasedReturnValue();
      -[SFAccountDetailViewController cellType](v13, "cellType");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if ((objc_msgSend(v9, "didUpgradeToSignInWithApple") & 1) == 0
          && (objc_msgSend(v9, "didUpgradeToStrongPassword") & 1) == 0)
        {
          objc_msgSend(v9, "accountCellData");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "savedAccount");
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          if (self->_persona == 1)
            v19 = 6;
          else
            v19 = 2;
          v20 = [SFAccountDetailViewController alloc];
          objc_msgSend(v9, "accountCellData");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "warning");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = -[SFAccountDetailViewController initWithSavedAccount:passwordWarning:options:](v20, "initWithSavedAccount:passwordWarning:options:", v18, v22, v19);

          -[SFAccountDetailViewController setDelegate:](v23, "setDelegate:", self);
          -[_SFPasswordAuditingViewController navigationController](self, "navigationController");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "pushViewController:animated:", v23, 1);

        }
      }
      else
      {
        switch(objc_msgSend(v16, "unsignedIntValue"))
        {
          case 1u:
            -[_SFPasswordAuditingViewController _changePasswordOnWebsiteForActionableSecurityRecommendation:](self, "_changePasswordOnWebsiteForActionableSecurityRecommendation:", v9);
            break;
          case 2u:
            -[_SFPasswordAuditingViewController _initiateChangeToStrongPasswordForActionableSecurityRecommendation:](self, "_initiateChangeToStrongPasswordForActionableSecurityRecommendation:", v9);
            break;
          case 4u:
            -[_SFPasswordAuditingViewController _upgradeToSignInWithAppleForActionableSecurityRecommendation:](self, "_upgradeToSignInWithAppleForActionableSecurityRecommendation:", v9);
            break;
          case 8u:
            -[_SFPasswordAuditingViewController _removeAddressedActionableRecommendation:](self, "_removeAddressedActionableRecommendation:", v9);
            break;
          default:
            break;
        }
      }

      goto LABEL_21;
    }
    -[_SFPasswordAuditingViewController _resetHiddenSecurityRecommendations](self, "_resetHiddenSecurityRecommendations");
  }
LABEL_23:

}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  return 0;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a3;
  if (self->_persona == 1 || a4)
  {
    v7 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
  }
  else
  {
    -[_SFPasswordAuditingViewController _passwordBreachFooterView](self, "_passwordBreachFooterView");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  return v8;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  void *v5;
  int64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;

  if (self->_persona | a4)
  {
    -[SFTableViewDiffableDataSource snapshot](self->_tableViewDiffableDataSource, "snapshot", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = a4 + 1;
    if (a4 + 1 < objc_msgSend(v5, "numberOfSections"))
    {
      objc_msgSend(v5, "sectionIdentifiers");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectAtIndexedSubscript:", a4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "sectionIdentifiers");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectAtIndexedSubscript:", v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_isKindOfClass() & 1) != 0)
      {

        v11 = 0.0;
LABEL_9:

        return v11;
      }

    }
    v11 = *MEMORY[0x1E0DC53D8];
    goto LABEL_9;
  }
  return *MEMORY[0x1E0DC53D8];
}

- (BOOL)dataSource:(id)a3 canEditRowAtIndexPath:(id)a4
{
  SFTableViewDiffableDataSource *tableViewDiffableDataSource;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  char isKindOfClass;

  tableViewDiffableDataSource = self->_tableViewDiffableDataSource;
  v5 = a4;
  -[SFTableViewDiffableDataSource snapshot](tableViewDiffableDataSource, "snapshot");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sectionIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "section");

  objc_msgSend(v7, "objectAtIndexedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(CFSTR("Other Recommendations"), "isEqual:", v9) & 1) != 0)
  {
    isKindOfClass = 1;
  }
  else
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
  }

  return isKindOfClass & 1;
}

- (id)tableView:(id)a3 trailingSwipeActionsConfigurationForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, uint64_t, uint64_t, void *);
  void *v19;
  _SFPasswordAuditingViewController *v20;
  id v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(a3, "cellForRowAtIndexPath:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = (void *)MEMORY[0x1E0DC36C8];
    -[_SFPasswordAuditingViewController _swipeActionTitleForSecurityRecommendation](self, "_swipeActionTitleForSecurityRecommendation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = MEMORY[0x1E0C809B0];
    v17 = 3221225472;
    v18 = __98___SFPasswordAuditingViewController_tableView_trailingSwipeActionsConfigurationForRowAtIndexPath___block_invoke;
    v19 = &unk_1E4AC0208;
    v20 = self;
    v21 = v6;
    objc_msgSend(v8, "contextualActionWithStyle:title:handler:", 0, v9, &v16);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor", v16, v17, v18, v19, v20);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setBackgroundColor:", v11);

    v12 = (void *)MEMORY[0x1E0DC3D08];
    v22[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "configurationWithActions:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "setPerformsFirstActionWithFullSwipe:", 0);
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)_swipeActionTitleForSecurityRecommendation
{
  _WBSLocalizedString();
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)tableView:(id)a3 contextMenuConfigurationForRowAtIndexPath:(id)a4 point:(CGPoint)a5
{
  id v7;
  void *v8;
  __CFString *v9;
  __CFString *v10;
  void *v11;
  __CFString *v12;
  void *v13;
  _QWORD v15[5];
  __CFString *v16;
  id v17;

  v7 = a4;
  objc_msgSend(a3, "cellForRowAtIndexPath:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    if (self->_persona == 1)
      v9 = CFSTR("eye");
    else
      v9 = CFSTR("eye.slash");
    v10 = v9;
    v11 = (void *)MEMORY[0x1E0DC36B8];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __95___SFPasswordAuditingViewController_tableView_contextMenuConfigurationForRowAtIndexPath_point___block_invoke;
    v15[3] = &unk_1E4AC5508;
    v15[4] = self;
    v16 = v10;
    v17 = v7;
    v12 = v10;
    objc_msgSend(v11, "configurationWithIdentifier:previewProvider:actionProvider:", v17, 0, v15);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)_contextMenuActionTitleForSecurityRecommendation
{
  _WBSLocalizedString();
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_removeAddressedActionableRecommendation:(id)a3
{
  id v4;
  NSObject *diffableDataSourceQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  diffableDataSourceQueue = self->_diffableDataSourceQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __78___SFPasswordAuditingViewController__removeAddressedActionableRecommendation___block_invoke;
  v7[3] = &unk_1E4ABFB20;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(diffableDataSourceQueue, v7);

}

- (void)_addHiddenSecurityRecommendationsSectionIfNecessary
{
  NSObject *diffableDataSourceQueue;
  _QWORD block[5];

  diffableDataSourceQueue = self->_diffableDataSourceQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __88___SFPasswordAuditingViewController__addHiddenSecurityRecommendationsSectionIfNecessary__block_invoke;
  block[3] = &unk_1E4ABFE00;
  block[4] = self;
  dispatch_sync(diffableDataSourceQueue, block);
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a4;
  -[SFTableViewDiffableDataSource itemIdentifierForIndexPath:](self->_tableViewDiffableDataSource, "itemIdentifierForIndexPath:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isEqual:", CFSTR("Password Breach Toggle")) & 1) != 0)
  {
    LOBYTE(v7) = 0;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[SFTableViewDiffableDataSource snapshot](self->_tableViewDiffableDataSource, "snapshot");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "sectionIdentifiers");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v5, "section"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_msgSend(v10, "didUpgradeToSignInWithApple") & 1) != 0)
        LOBYTE(v7) = 0;
      else
        v7 = objc_msgSend(v10, "didUpgradeToStrongPassword") ^ 1;

    }
    else
    {
      LOBYTE(v7) = 1;
    }
  }

  return v7;
}

- (id)dataSource:(id)a3 headerTextForSection:(int64_t)a4
{
  id v4;
  void *v7;
  void *v8;
  void *v9;
  char isKindOfClass;
  void *v11;
  void *v13;
  void *v14;

  if (self->_persona == 1)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(a3, "snapshot");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "sectionIdentifiers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndexedSubscript:", a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    if (a4 == 1 && (isKindOfClass & 1) != 0)
    {
      _WBSLocalizedString();
      v4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0
        && objc_msgSend(v9, "isEqualToString:", CFSTR("Other Recommendations"))
        && -[NSArray count](self->_highPriorityRecommendationData, "count"))
      {
        _WBSLocalizedString();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[NSArray count](self->_flaggedPasswordData, "count") > 4)
        {
          v13 = (void *)MEMORY[0x1E0CB3940];
          _WBSLocalizedString();
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "stringWithFormat:", v14, -[NSArray count](self->_flaggedPasswordData, "count"));
          v4 = (id)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v4 = v11;
        }

      }
      else
      {
        v4 = 0;
      }
    }

  }
  return v4;
}

- (id)passwordWarningManagerForAccountDetailViewController:(id)a3
{
  return self->_passwordWarningManager;
}

- (id)_passwordGenerationManager
{
  WBSPasswordGenerationManager *passwordGenerator;
  WBSPasswordGenerationManager *v4;
  WBSPasswordGenerationManager *v5;

  passwordGenerator = self->_passwordGenerator;
  if (!passwordGenerator)
  {
    v4 = (WBSPasswordGenerationManager *)objc_msgSend(objc_alloc(MEMORY[0x1E0D8AA98]), "initWithPasswordRequirementsByDomain:", 0);
    v5 = self->_passwordGenerator;
    self->_passwordGenerator = v4;

    passwordGenerator = self->_passwordGenerator;
  }
  return passwordGenerator;
}

- (void)accountDetailViewController:(id)a3 didHideWarning:(id)a4
{
  objc_storeStrong((id *)&self->_warningHiddenInDetailView, a4);
}

- (void)accountDetailViewController:(id)a3 didDeleteAccountWithWarning:(id)a4
{
  objc_storeStrong((id *)&self->_warningDeletedInDetailView, a4);
}

- (void)_removeHideWarningMarkerForSavedAccount:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  int v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = self->_hiddenRecommendationData;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "warning", (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "savedAccount");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqual:", v4);

        if (v12)
        {
          -[_SFPasswordAuditingViewController _removeHideMarkerForWarning:](self, "_removeHideMarkerForWarning:", v10);

          goto LABEL_11;
        }

      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

}

- (void)_removeHideMarkerForWarning:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSArray **p_hiddenRecommendationData;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  char v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _SFPasswordAuditingViewController *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  id v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D8AC08], "sharedStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "savedAccount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeHideWarningMarkerForSavedAccount:", v6);

  v30 = self;
  p_hiddenRecommendationData = &self->_hiddenRecommendationData;
  v8 = (void *)-[NSArray mutableCopy](self->_hiddenRecommendationData, "mutableCopy");
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v32;
LABEL_3:
    v13 = 0;
    while (1)
    {
      if (*(_QWORD *)v32 != v12)
        objc_enumerationMutation(v9);
      v14 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v13);
      objc_msgSend(v14, "warning");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "isEqual:", v4);

      if ((v16 & 1) != 0)
        break;
      if (v11 == ++v13)
      {
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
        if (v11)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v17 = v14;
    objc_msgSend(v9, "removeObject:", v17);

    if (!v17)
      goto LABEL_14;
    objc_storeStrong((id *)p_hiddenRecommendationData, v8);
    if (!-[NSArray count](*p_hiddenRecommendationData, "count"))
    {
      -[_SFPasswordAuditingViewController navigationController](v30, "navigationController");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (id)objc_msgSend(v18, "popViewControllerAnimated:", 1);

    }
    -[SFTableViewDiffableDataSource snapshot](v30->_tableViewDiffableDataSource, "snapshot");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v17;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v35, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "deleteSectionsWithIdentifiers:", v21);

    -[SFTableViewDiffableDataSource applySnapshot:animatingDifferences:](v30->_tableViewDiffableDataSource, "applySnapshot:animatingDifferences:", v20, 1);
  }
  else
  {
LABEL_9:

LABEL_14:
    v22 = WBS_LOG_CHANNEL_PREFIXPasswords();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      -[_SFPasswordAuditingViewController _removeHideMarkerForWarning:].cold.1(v22, v23, v24, v25, v26, v27, v28, v29);
    v17 = 0;
  }

}

- (id)_resetHiddenSecurityRecommendationsCell
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  -[_SFPasswordAuditingViewController tableView](self, "tableView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dequeueReusableCellWithIdentifier:", CFSTR("resetHiddenSecurityRecommendations"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = v3;
  else
    v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 0, CFSTR("resetHiddenSecurityRecommendations"));
  v6 = v5;

  _WBSLocalizedString();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "textLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setText:", v7);

  objc_msgSend(v6, "textLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAdjustsFontSizeToFitWidth:", 1);

  objc_msgSend(v6, "textLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_setTextColorFollowsTintColor:", 1);

  +[_SFAccountManagerAppearanceValues buttonCellTextColor](_SFAccountManagerAppearanceValues, "buttonCellTextColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "textLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setTintColor:", v11);

  return v6;
}

- (void)_resetHiddenSecurityRecommendations
{
  void *v3;
  _QWORD v4[5];

  objc_msgSend(MEMORY[0x1E0D8AC08], "sharedStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __72___SFPasswordAuditingViewController__resetHiddenSecurityRecommendations__block_invoke;
  v4[3] = &unk_1E4ABFE00;
  v4[4] = self;
  objc_msgSend(v3, "resetHiddenSecurityRecommendationsWithCompletionHandler:", v4);

}

- (id)_warningStringForPasswordCellData:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "warning");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedShortDescriptivePhrase");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_standardRecommendationCellWithPasswordCellData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  SFAccountTableViewCell *v8;
  SFAccountTableViewCell *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  const __CFString *v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v29[2];
  _QWORD v30[2];
  _QWORD v31[2];
  _QWORD v32[2];
  _QWORD v33[6];
  _QWORD v34[7];

  v34[6] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_SFPasswordAuditingViewController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dequeueReusableCellWithIdentifier:", CFSTR("standardSecurityRecommendation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
    v8 = v6;
  else
    v8 = -[SFAccountTableViewCell initWithStyle:reuseIdentifier:]([SFAccountTableViewCell alloc], "initWithStyle:reuseIdentifier:", 3, CFSTR("standardSecurityRecommendation"));
  v9 = v8;

  -[SFAccountTableViewCell setAccessoryType:](v9, "setAccessoryType:", 1);
  -[SFAccountTableViewCell setDelegate:](v9, "setDelegate:", self);
  objc_msgSend(v4, "savedAccount");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SFPasswordAuditingViewController _warningStringForPasswordCellData:](self, "_warningStringForPasswordCellData:", v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFAccountTableViewCell setSavedAccount:withWarnings:savedAccountIsOnlySavedAccountForHighLevelDomain:](v9, "setSavedAccount:withWarnings:savedAccountIsOnlySavedAccountForHighLevelDomain:", v10, v11, objc_msgSend(v4, "savedAccountIsOnlySavedAccountForHighLevelDomain"));

  objc_msgSend(v4, "warning");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "issueTypes");

  objc_msgSend(v4, "highLevelDomain");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "savedAccount");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "user");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v33[0] = CFSTR("priority");
  v33[1] = CFSTR("domain");
  v34[0] = CFSTR("standard");
  v34[1] = v14;
  v33[2] = CFSTR("user");
  v33[3] = CFSTR("reused");
  v17 = CFSTR("true");
  if ((v13 & 1) != 0)
    v18 = CFSTR("true");
  else
    v18 = CFSTR("false");
  v34[2] = v16;
  v34[3] = v18;
  v33[4] = CFSTR("weak");
  v33[5] = CFSTR("compromised");
  if ((v13 & 2) != 0)
    v19 = CFSTR("true");
  else
    v19 = CFSTR("false");
  if ((v13 & 0xC) == 0)
    v17 = CFSTR("false");
  v34[4] = v19;
  v34[5] = v17;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, v33, 6);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  WBSMakeAccessibilityIdentifier();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFAccountTableViewCell setAccessibilityIdentifier:](v9, "setAccessibilityIdentifier:", v21);

  v31[0] = CFSTR("domain");
  v31[1] = CFSTR("user");
  v32[0] = v14;
  v32[1] = v16;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 2);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  WBSMakeAccessibilityIdentifier();
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFAccountTableViewCell textLabel](v9, "textLabel");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setAccessibilityIdentifier:", v23);

  v29[0] = CFSTR("domain");
  v29[1] = CFSTR("user");
  v30[0] = v14;
  v30[1] = v16;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 2);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  WBSMakeAccessibilityIdentifier();
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFAccountTableViewCell detailTextLabel](v9, "detailTextLabel");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setAccessibilityIdentifier:", v26);

  return v9;
}

- (id)_hiddenSecurityRecommendationsCell
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[_SFPasswordAuditingViewController tableView](self, "tableView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dequeueReusableCellWithIdentifier:", CFSTR("hiddenSecurityRecommendations"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = v3;
  else
    v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 0, CFSTR("hiddenSecurityRecommendations"));
  v6 = v5;

  _WBSLocalizedString();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "textLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setText:", v7);

  objc_msgSend(v6, "textLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setNumberOfLines:", 0);

  objc_msgSend(v6, "setAccessoryType:", 1);
  return v6;
}

- (id)_passwordBreachToggleCell
{
  void *v3;
  SFPasswordBreachToggleCell *v4;
  void *v5;
  void *v6;

  -[_SFPasswordAuditingViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dequeueReusableCellWithIdentifier:", CFSTR("Password Breach Toggle"));
  v4 = (SFPasswordBreachToggleCell *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v4 = -[SFPasswordBreachToggleCell initWithReuseIdentifier:delegate:]([SFPasswordBreachToggleCell alloc], "initWithReuseIdentifier:delegate:", CFSTR("Password Breach Toggle"), self);
    _WBSLocalizedString();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFPasswordBreachToggleCell textLabel](v4, "textLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setText:", v5);

    -[SFPasswordBreachToggleCell setAccessibilityIdentifier:](v4, "setAccessibilityIdentifier:", CFSTR("Security Recommendations Detect Compromised Passwords Cell"));
  }
  -[SFPasswordBreachToggleCell setCurrentPasswordBreachState:](v4, "setCurrentPasswordBreachState:", objc_msgSend(MEMORY[0x1E0D8AA90], "isPasswordBreachDetectionOn"));

  return v4;
}

- (id)_passwordBreachFooterView
{
  _SFTableLinkableFooterView *passwordBreachFooterView;
  _SFTableLinkableFooterView *v4;
  _SFTableLinkableFooterView *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  passwordBreachFooterView = self->_passwordBreachFooterView;
  if (!passwordBreachFooterView)
  {
    v4 = objc_alloc_init(_SFTableLinkableFooterView);
    v5 = self->_passwordBreachFooterView;
    self->_passwordBreachFooterView = v4;

    -[_SFTableLinkableFooterView setDelegate:](self->_passwordBreachFooterView, "setDelegate:", self);
    objc_msgSend(MEMORY[0x1E0D8A8B8], "currentDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "deviceClass");

    -[_SFPasswordAuditingViewController _passwordBreachFooterTextForDeviceClass:](self, "_passwordBreachFooterTextForDeviceClass:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D65148], "bundleWithIdentifier:", CFSTR("com.apple.onboarding.passwords"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "privacyFlow");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedButtonTitle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[_SFTableLinkableFooterView setText:linkPlaceholderString:linkReplacementString:](self->_passwordBreachFooterView, "setText:linkPlaceholderString:linkReplacementString:", v8, CFSTR("%passwords-privacy-link%"), v11);
    passwordBreachFooterView = self->_passwordBreachFooterView;
  }
  return passwordBreachFooterView;
}

- (id)_passwordBreachFooterTextForDeviceClass:(int)a3
{
  _WBSLocalizedString();
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)linkableFooterViewDidInteractWithLink:(id)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0D65198], "presenterForPrivacySplashWithIdentifier:", CFSTR("com.apple.onboarding.passwords"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPresentingViewController:", self);
  objc_msgSend(v4, "present");

}

- (void)_configureSecurityRecommendationInformationCell:(id)a3 withActionableRecommendationData:(id)a4
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
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;

  v23 = a3;
  v5 = a4;
  objc_msgSend(v5, "accountCellData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "savedAccount");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setSavedAccount:", v7);

  if (objc_msgSend(v6, "savedAccountIsOnlySavedAccountForHighLevelDomain"))
  {
    objc_msgSend(v6, "savedAccount");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "effectiveTitle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setTitle:", v9);
  }
  else
  {
    v10 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v6, "savedAccount");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "effectiveTitle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "savedAccount");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "user");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("%@ — %@"), v9, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setTitle:", v13);

  }
  if ((objc_msgSend(v5, "didUpgradeToSignInWithApple") & 1) != 0)
  {
    v14 = 0;
    v15 = 1;
  }
  else
  {
    v15 = objc_msgSend(v5, "didUpgradeToStrongPassword");
    v14 = v15 ^ 1;
  }
  objc_msgSend(v23, "setAccessoryType:", v14);
  objc_msgSend(v23, "setShowsUpgradeCompletionCheckmark:", v15);
  if (objc_msgSend(v5, "didUpgradeToSignInWithApple"))
  {
    objc_msgSend(MEMORY[0x1E0D8A8F8], "isAppleAccountBrandingEnabled");
LABEL_10:
    _WBSLocalizedString();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setSubtitle:", v16);
    goto LABEL_15;
  }
  if (objc_msgSend(v5, "didUpgradeToStrongPassword"))
    goto LABEL_10;
  objc_msgSend(v6, "warning");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "issueTypes");

  if ((v18 & 8) != 0)
  {
    objc_msgSend(v5, "isUpgradeToSignInWithAppleAvailable");
    _WBSLocalizedString();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "warning");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "localizedLongDescriptionForClient:", 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" %@"), v16);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "stringByAppendingString:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setSubtitle:", v22);

  }
  else
  {
    objc_msgSend(v6, "warning");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "localizedLongDescriptionForClient:", 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setSubtitle:", v19);
  }

LABEL_15:
}

- (void)_upgradeToSignInWithAppleForActionableSecurityRecommendation:(id)a3
{
  SFActionableSecurityRecommendationData *v4;
  void *v5;
  SFActionableSecurityRecommendationData *passwordDataForCurrentUpgrade;
  SFActionableSecurityRecommendationData *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v4 = (SFActionableSecurityRecommendationData *)a3;
  -[SFActionableSecurityRecommendationData accountCellData](v4, "accountCellData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "savedAccount");
  v16 = (id)objc_claimAutoreleasedReturnValue();

  passwordDataForCurrentUpgrade = self->_passwordDataForCurrentUpgrade;
  self->_passwordDataForCurrentUpgrade = v4;
  v7 = v4;

  v8 = objc_alloc(MEMORY[0x1E0C925A8]);
  objc_msgSend(v16, "user");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "password");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFActionableSecurityRecommendationData extension](v7, "extension");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_alloc(MEMORY[0x1E0C925B8]);
  objc_msgSend(v16, "highLevelDomain");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithIdentifier:type:", v13, 0);
  v15 = (void *)objc_msgSend(v8, "initWithUser:password:extension:serviceIdentifier:userInfo:", v9, v10, v11, v14, 0);

  -[ASAccountAuthenticationModificationController performRequest:](self->_accountAuthenticationModificationController, "performRequest:", v15);
}

- (void)_initiateChangeToStrongPasswordForActionableSecurityRecommendation:(id)a3
{
  SFActionableSecurityRecommendationData *v4;
  void *v5;
  SFActionableSecurityRecommendationData *passwordDataForCurrentUpgrade;
  SFActionableSecurityRecommendationData *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v4 = (SFActionableSecurityRecommendationData *)a3;
  -[SFActionableSecurityRecommendationData accountCellData](v4, "accountCellData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "savedAccount");
  v16 = (id)objc_claimAutoreleasedReturnValue();

  passwordDataForCurrentUpgrade = self->_passwordDataForCurrentUpgrade;
  self->_passwordDataForCurrentUpgrade = v4;
  v7 = v4;

  v8 = objc_alloc(MEMORY[0x1E0C925B0]);
  objc_msgSend(v16, "user");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "password");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFActionableSecurityRecommendationData extension](v7, "extension");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_alloc(MEMORY[0x1E0C925B8]);
  objc_msgSend(v16, "highLevelDomain");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithIdentifier:type:", v13, 0);
  v15 = (void *)objc_msgSend(v8, "initWithUser:password:extension:serviceIdentifier:userInfo:", v9, v10, v11, v14, 0);

  -[ASAccountAuthenticationModificationController performRequest:](self->_accountAuthenticationModificationController, "performRequest:", v15);
}

- (void)_changePasswordOnWebsiteForActionableSecurityRecommendation:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  SFSafariViewControllerConfiguration *v8;
  SFSafariViewController *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  objc_msgSend(v12, "accountCellData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "savedAccount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "wellKnownChangePasswordURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[UIViewController safari_checkForAbilityToOpenWebContentAndNotifyIfNecessary:](self, "safari_checkForAbilityToOpenWebContentAndNotifyIfNecessary:", v7))
  {
    v8 = objc_alloc_init(SFSafariViewControllerConfiguration);
    -[SFSafariViewControllerConfiguration _setPerformingAccountSecurityUpgrade:](v8, "_setPerformingAccountSecurityUpgrade:", 1);
    v9 = -[SFSafariViewController initWithURL:configuration:]([SFSafariViewController alloc], "initWithURL:configuration:", v7, v8);
    -[_SFPasswordAuditingViewController view](self, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "tintColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSafariViewController setPreferredControlTintColor:](v9, "setPreferredControlTintColor:", v11);

    -[SFSafariViewController setDismissButtonStyle:](v9, "setDismissButtonStyle:", 1);
    -[SFSafariViewController setModalPresentationStyle:](v9, "setModalPresentationStyle:", 1);
    -[SFSafariViewController setModalInPresentation:](v9, "setModalInPresentation:", 1);
    -[_SFPasswordAuditingViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v9, 1, 0);
    objc_storeStrong((id *)&self->_recommendationForMostRecentSafariViewController, a3);
    objc_storeWeak((id *)&self->_changePasswordOnWebsiteSafariViewController, v9);

  }
}

- (void)_presentHideSecurityRecommendationConfirmationAlertForRecommendationAtIndexPath:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t);
  void *v25;
  id v26;
  _QWORD v27[5];
  id v28;
  id v29;

  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1E0DC3450];
  _WBSLocalizedString();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  _WBSLocalizedString();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "alertControllerWithTitle:message:preferredStyle:", v9, v10, _SFDeviceAlertStyle());
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x1E0DC3448];
  _WBSLocalizedString();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __135___SFPasswordAuditingViewController__presentHideSecurityRecommendationConfirmationAlertForRecommendationAtIndexPath_completionHandler___block_invoke;
  v27[3] = &unk_1E4AC01B8;
  v27[4] = self;
  v28 = v6;
  v15 = v7;
  v29 = v15;
  v16 = v6;
  objc_msgSend(v12, "actionWithTitle:style:handler:", v13, 0, v27);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addAction:", v17);

  v18 = (void *)MEMORY[0x1E0DC3448];
  _WBSLocalizedString();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v14;
  v23 = 3221225472;
  v24 = __135___SFPasswordAuditingViewController__presentHideSecurityRecommendationConfirmationAlertForRecommendationAtIndexPath_completionHandler___block_invoke_2;
  v25 = &unk_1E4AC01E0;
  v26 = v15;
  v20 = v15;
  objc_msgSend(v18, "actionWithTitle:style:handler:", v19, 1, &v22);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addAction:", v21, v22, v23, v24, v25);

  -[_SFPasswordAuditingViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v11, 1, 0);
}

- (void)_hideSecurityRecommendationAtIndexPath:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  NSArray *v10;
  void *highPriorityRecommendationData;
  void *v12;
  NSArray *flaggedPasswordData;
  NSArray *v14;
  NSArray *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a3;
  -[SFTableViewDiffableDataSource snapshot](self->_tableViewDiffableDataSource, "snapshot");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sectionIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", objc_msgSend(v19, "section"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(CFSTR("Other Recommendations"), "isEqual:", v6) & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = v6;
      objc_msgSend(v7, "accountCellData");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "warning");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      -[NSArray safari_arrayByRemovingObject:](self->_highPriorityRecommendationData, "safari_arrayByRemovingObject:", v7);
      v10 = (NSArray *)objc_claimAutoreleasedReturnValue();

      highPriorityRecommendationData = self->_highPriorityRecommendationData;
      self->_highPriorityRecommendationData = v10;
    }
    else
    {
      -[NSArray objectAtIndexedSubscript:](self->_flaggedPasswordData, "objectAtIndexedSubscript:", objc_msgSend(v19, "row"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "warning");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      flaggedPasswordData = self->_flaggedPasswordData;
      -[NSArray objectAtIndexedSubscript:](flaggedPasswordData, "objectAtIndexedSubscript:", objc_msgSend(v19, "row"));
      highPriorityRecommendationData = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray safari_arrayByRemovingObject:](flaggedPasswordData, "safari_arrayByRemovingObject:", highPriorityRecommendationData);
      v14 = (NSArray *)objc_claimAutoreleasedReturnValue();
      v15 = self->_flaggedPasswordData;
      self->_flaggedPasswordData = v14;

    }
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D8AAB0]), "initWithIssueTypes:", objc_msgSend(v9, "issueTypes"));
    objc_msgSend(MEMORY[0x1E0D8AC08], "sharedStore");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "savedAccount");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "saveHideMarker:forSavedAccount:", v16, v18);

    -[_SFPasswordAuditingViewController _addWarningToHiddenRecommendationData:](self, "_addWarningToHiddenRecommendationData:", v9);
    -[_SFPasswordAuditingViewController _reloadTableViewDiffableDataSourceAnimated:](self, "_reloadTableViewDiffableDataSourceAnimated:", 1);

  }
}

- (void)_unhideHiddenSecurityRecommendationAtIndexPath:(id)a3
{
  SFTableViewDiffableDataSource *tableViewDiffableDataSource;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  char isKindOfClass;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  tableViewDiffableDataSource = self->_tableViewDiffableDataSource;
  v5 = a3;
  -[SFTableViewDiffableDataSource snapshot](tableViewDiffableDataSource, "snapshot");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sectionIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "section");

  objc_msgSend(v7, "objectAtIndexedSubscript:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v10 = v13;
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v13, "accountCellData");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "warning");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[NSArray count](self->_hiddenRecommendationData, "count") == 1)
      -[_SFPasswordAuditingViewController _resetHiddenSecurityRecommendations](self, "_resetHiddenSecurityRecommendations");
    else
      -[_SFPasswordAuditingViewController _removeHideMarkerForWarning:](self, "_removeHideMarkerForWarning:", v12);

    v10 = v13;
  }

}

- (void)accountAuthenticationModificationController:(id)a3 didSuccessfullyCompleteRequest:(id)a4 withUserInfo:(id)a5
{
  id v6;

  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[_SFPasswordAuditingViewController _completedSignInWithAppleUpgrade](self, "_completedSignInWithAppleUpgrade");
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPasswordAuditingViewController _completedStrongPasswordUpgrade](self, "_completedStrongPasswordUpgrade");
  }

}

- (void)_completedSignInWithAppleUpgrade
{
  void *v3;
  void *v4;
  void *v5;
  SFActionableSecurityRecommendationData *passwordDataForCurrentUpgrade;

  objc_msgSend(MEMORY[0x1E0D8AC08], "sharedStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFActionableSecurityRecommendationData accountCellData](self->_passwordDataForCurrentUpgrade, "accountCellData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "savedAccount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeCredentialTypes:forSavedAccount:", 1, v5);

  -[SFActionableSecurityRecommendationData setDidUpgradeToSignInWithApple:](self->_passwordDataForCurrentUpgrade, "setDidUpgradeToSignInWithApple:", 1);
  -[_SFPasswordAuditingViewController _reloadTableViewDiffableDataSource](self, "_reloadTableViewDiffableDataSource");
  passwordDataForCurrentUpgrade = self->_passwordDataForCurrentUpgrade;
  self->_passwordDataForCurrentUpgrade = 0;

}

- (void)_completedStrongPasswordUpgrade
{
  SFActionableSecurityRecommendationData *passwordDataForCurrentUpgrade;

  -[SFActionableSecurityRecommendationData setDidUpgradeToStrongPassword:](self->_passwordDataForCurrentUpgrade, "setDidUpgradeToStrongPassword:", 1);
  -[_SFPasswordAuditingViewController _reloadTableViewDiffableDataSource](self, "_reloadTableViewDiffableDataSource");
  passwordDataForCurrentUpgrade = self->_passwordDataForCurrentUpgrade;
  self->_passwordDataForCurrentUpgrade = 0;

}

- (void)accountAuthenticationModificationController:(id)a3 didFailRequest:(id)a4 withError:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  SFActionableSecurityRecommendationData *passwordDataForCurrentUpgrade;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v10)
  {
    v11 = WBS_LOG_CHANNEL_PREFIXAccountAuthenticationModificationExtension();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[_SFPasswordAuditingViewController accountAuthenticationModificationController:didFailRequest:withError:].cold.1(v11, v10);
  }
  -[SFActionableSecurityRecommendationData extension](self->_passwordDataForCurrentUpgrade, "extension");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  passwordDataForCurrentUpgrade = self->_passwordDataForCurrentUpgrade;
  self->_passwordDataForCurrentUpgrade = 0;

  if (objc_msgSend(v10, "code") != 1)
  {
    objc_msgSend(v10, "userInfo");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKey:", *MEMORY[0x1E0C92590]);
    v15 = objc_claimAutoreleasedReturnValue();

    v38 = (void *)v15;
    if (objc_msgSend(v10, "code") || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      v27 = (void *)MEMORY[0x1E0DC3450];
      v28 = (void *)MEMORY[0x1E0CB3940];
      _WBSLocalizedString();
      v29 = v8;
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "_plugIn");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "localizedContainingName");
      v32 = v9;
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "stringWithFormat:", v30, v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "alertControllerWithTitle:message:preferredStyle:", 0, v34, _SFDeviceAlertStyle());
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      v9 = v32;
      v8 = v29;
      v35 = (void *)MEMORY[0x1E0DC3448];
      _WBSLocalizedString();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v35;
    }
    else
    {
      v37 = (void *)MEMORY[0x1E0DC3450];
      v16 = (void *)MEMORY[0x1E0CB3940];
      _WBSLocalizedString();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "_plugIn");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "localizedContainingName");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "stringWithFormat:", v17, v19);
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = v15;
      v22 = (void *)v20;
      objc_msgSend(v37, "alertControllerWithTitle:message:preferredStyle:", v20, v21, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      v24 = (void *)MEMORY[0x1E0DC3448];
      _WBSLocalizedString();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v24;
    }
    objc_msgSend(v26, "actionWithTitle:style:handler:", v25, 0, 0);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addAction:", v36);

    -[_SFPasswordAuditingViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v23, 1, 0);
  }

}

- (id)presentationAnchorForAccountAuthenticationModificationController:(id)a3
{
  void *v3;
  void *v4;

  -[_SFPasswordAuditingViewController view](self, "view", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)didSetPasswordBreachDetectionState:(BOOL)a3
{
  objc_msgSend(MEMORY[0x1E0D8AA90], "setPasswordBreachDetectionOn:", a3);
}

- (BOOL)shouldSuppressAccountManagerLockedView
{
  id WeakRetained;
  BOOL v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_changePasswordOnWebsiteSafariViewController);
  v3 = WeakRetained != 0;

  return v3;
}

- (void)passwordManagerWillLock
{
  void *v2;
  id v3;

  -[_SFPasswordAuditingViewController tableView](self, "tableView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contextMenuInteraction");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dismissMenu");

}

- (_SFPasswordAuditingViewControllerDelegate)delegate
{
  return (_SFPasswordAuditingViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (WBSSavedAccount)savedAccountToRemoveAfterCompletedUpgradeInDetailView
{
  return self->_savedAccountToRemoveAfterCompletedUpgradeInDetailView;
}

- (void)setSavedAccountToRemoveAfterCompletedUpgradeInDetailView:(id)a3
{
  objc_storeStrong((id *)&self->_savedAccountToRemoveAfterCompletedUpgradeInDetailView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_savedAccountToRemoveAfterCompletedUpgradeInDetailView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_hiddenRecommendationData, 0);
  objc_storeStrong((id *)&self->_siteMetadataManager, 0);
  objc_storeStrong((id *)&self->_warningDeletedInDetailView, 0);
  objc_storeStrong((id *)&self->_warningHiddenInDetailView, 0);
  objc_storeStrong((id *)&self->_passwordBreachFooterView, 0);
  objc_storeStrong((id *)&self->_accountAuthenticationModificationController, 0);
  objc_storeStrong((id *)&self->_passwordDataForCurrentUpgrade, 0);
  objc_storeStrong((id *)&self->_passwordGenerator, 0);
  objc_storeStrong((id *)&self->_recommendationForMostRecentSafariViewController, 0);
  objc_destroyWeak((id *)&self->_changePasswordOnWebsiteSafariViewController);
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_diffableDataSourceQueue, 0);
  objc_storeStrong((id *)&self->_flaggedPasswordData, 0);
  objc_storeStrong((id *)&self->_highPriorityRecommendationData, 0);
  objc_storeStrong((id *)&self->_passwordWarningManager, 0);
  objc_storeStrong((id *)&self->_tableViewDiffableDataSource, 0);
  objc_storeStrong((id *)&self->_savedAccountStore, 0);
  objc_storeStrong((id *)&self->_autoFillQuirksManager, 0);
}

- (void)_findAndRemoveEntryForSavedAccount:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A3B2D000, a1, a3, "Didn't find an entry to delete for password that completed upgrade in detail view.", a5, a6, a7, a8, 0);
}

- (void)_removeHideMarkerForWarning:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A3B2D000, a1, a3, "Asked to remove hide warning marker but couldn't find an item for it", a5, a6, a7, a8, 0);
}

- (void)accountAuthenticationModificationController:(void *)a1 didFailRequest:(void *)a2 withError:.cold.1(void *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a1;
  objc_msgSend(a2, "safari_privacyPreservingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2(&dword_1A3B2D000, v5, v6, "Account Modification Extension request canceled with error: %{public}@", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_6();
}

@end
