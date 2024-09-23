@implementation AAUIAccountRecoveryViewController

- (AAUIAccountRecoveryViewController)initWithAccountManager:(id)a3
{
  id v5;
  AAUIAccountRecoveryViewController *v6;
  AAUIAccountRecoveryViewController *v7;
  uint64_t v8;
  AAUIContactsProvider *contactsProvider;
  NSObject *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *contactWorkQueue;
  AAUICustodianRepairHelper *v13;
  AAUICustodianRepairHelper *repairHelper;
  NSArray *myCustodianshipOwners;
  uint64_t v16;
  AAAccountRecoveryManagementViewModel *viewModel;
  AACustodianController *v18;
  AACustodianController *custodianController;
  AKAppleIDAuthenticationController *v20;
  AKAppleIDAuthenticationController *authenticationController;
  id v22;
  AAUIDTOHelper *v23;
  AAUIDTOHelper *dtoHelper;
  objc_super v26;

  v5 = a3;
  v26.receiver = self;
  v26.super_class = (Class)AAUIAccountRecoveryViewController;
  v6 = -[AAUIAccountRecoveryViewController init](&v26, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_accountManager, a3);
    v8 = objc_opt_new();
    contactsProvider = v7->_contactsProvider;
    v7->_contactsProvider = (AAUIContactsProvider *)v8;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = dispatch_queue_create("com.apple.appleaccountsettings.fetchcustodians", v10);
    contactWorkQueue = v7->_contactWorkQueue;
    v7->_contactWorkQueue = (OS_dispatch_queue *)v11;

    v13 = objc_alloc_init(AAUICustodianRepairHelper);
    repairHelper = v7->_repairHelper;
    v7->_repairHelper = v13;

    -[AAUICustodianRepairHelper setRepairDelegate:](v7->_repairHelper, "setRepairDelegate:", v7);
    myCustodianshipOwners = v7->_myCustodianshipOwners;
    v7->_myCustodianshipOwners = (NSArray *)MEMORY[0x1E0C9AA60];

    v16 = objc_opt_new();
    viewModel = v7->_viewModel;
    v7->_viewModel = (AAAccountRecoveryManagementViewModel *)v16;

    v18 = (AACustodianController *)objc_alloc_init(MEMORY[0x1E0CFAC10]);
    custodianController = v7->_custodianController;
    v7->_custodianController = v18;

    v20 = (AKAppleIDAuthenticationController *)objc_alloc_init(MEMORY[0x1E0D00130]);
    authenticationController = v7->_authenticationController;
    v7->_authenticationController = v20;

    v7->_didShowCustodianReviewSheet = 0;
    v22 = objc_alloc_init(MEMORY[0x1E0D001A0]);
    v23 = -[AAUIDTOHelper initWithDTOController:]([AAUIDTOHelper alloc], "initWithDTOController:", v22);
    dtoHelper = v7->_dtoHelper;
    v7->_dtoHelper = v23;

  }
  return v7;
}

- (AAUIAccountRecoveryViewController)initWithAccountManager:(id)a3 highlightRowIdentifier:(id)a4
{
  id v6;
  id v7;
  AAUIAccountRecoveryViewController *v8;
  NSObject *v9;
  AAUIAccountRecoveryViewController *v10;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AAUIAccountRecoveryViewController;
  v8 = -[AAUIAccountRecoveryViewController init](&v12, sel_init);
  if (v8)
  {
    _AAUILogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[AAUIAccountRecoveryViewController initWithAccountManager:highlightRowIdentifier:].cold.1();

    objc_storeStrong((id *)((char *)&v8->super.super.super.super.super.isa + (int)*MEMORY[0x1E0D80580]), a4);
  }
  v10 = -[AAUIAccountRecoveryViewController initWithAccountManager:](v8, "initWithAccountManager:", v6);

  return v10;
}

- (void)dealloc
{
  NSObject *v3;
  objc_class *v4;
  void *v5;
  objc_super v6;
  uint8_t buf[4];
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  _AAUILogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    objc_opt_self();
    v4 = (objc_class *)objc_claimAutoreleasedReturnValue();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v8 = v5;
    _os_log_impl(&dword_1DB4ED000, v3, OS_LOG_TYPE_DEFAULT, "dealloc %@", buf, 0xCu);

  }
  -[AAUIAccountRecoveryViewController _stopObservingNotifications](self, "_stopObservingNotifications");
  v6.receiver = self;
  v6.super_class = (Class)AAUIAccountRecoveryViewController;
  -[AAUIAccountRecoveryViewController dealloc](&v6, sel_dealloc);
}

- (void)viewDidLoad
{
  void *v3;
  AIDAAccountManager *v4;
  AIDAAccountManager *accountManager;
  void *v6;
  void *v7;
  AAUISpinnerManager *v8;
  void *v9;
  AAUISpinnerManager *v10;
  AAUISpinnerManager *spinnerManager;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)AAUIAccountRecoveryViewController;
  -[AAUIAccountRecoveryViewController viewDidLoad](&v12, sel_viewDidLoad);
  if (!self->_accountManager)
  {
    -[AAUIAccountRecoveryViewController specifier](self, "specifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("icloudAccountManager"));
    v4 = (AIDAAccountManager *)objc_claimAutoreleasedReturnValue();
    accountManager = self->_accountManager;
    self->_accountManager = v4;

  }
  -[AAAccountRecoveryManagementViewModel title](self->_viewModel, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAUIAccountRecoveryViewController navigationItem](self, "navigationItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTitle:", v6);

  v8 = [AAUISpinnerManager alloc];
  -[AAUIAccountRecoveryViewController navigationItem](self, "navigationItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[AAUISpinnerManager initWithNavigationItem:hideBackButton:](v8, "initWithNavigationItem:hideBackButton:", v9, 0);
  spinnerManager = self->_spinnerManager;
  self->_spinnerManager = v10;

  -[AAUIAccountRecoveryViewController _fetchAllCustodianContacts](self, "_fetchAllCustodianContacts");
  -[AAUIAccountRecoveryViewController _beginObservingNotifications](self, "_beginObservingNotifications");
  -[AAUIAccountRecoveryViewController _syncTrustedContactsFromCloudKit](self, "_syncTrustedContactsFromCloudKit");
}

- (void)showReviewCustodiansModalIfNeeded
{
  id v3;
  _QWORD v4[5];
  id v5;
  id location;

  v3 = objc_alloc_init(MEMORY[0x1E0CFAC68]);
  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __70__AAUIAccountRecoveryViewController_showReviewCustodiansModalIfNeeded__block_invoke;
  v4[3] = &unk_1EA2DD018;
  objc_copyWeak(&v5, &location);
  v4[4] = self;
  objc_msgSend(v3, "pendingFollowUpWithIdentifier:completion:", CFSTR("com.apple.AAFollowUpIdentifier.custodianReview"), v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);

}

void __70__AAUIAccountRecoveryViewController_showReviewCustodiansModalIfNeeded__block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  NSObject *v5;
  _QWORD v6[5];
  id v7;
  uint8_t buf[16];

  _AAUILogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (a2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DB4ED000, v5, OS_LOG_TYPE_DEFAULT, "Found Custodian Review followup. Presenting Custodian Review sheet", buf, 2u);
    }

    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __70__AAUIAccountRecoveryViewController_showReviewCustodiansModalIfNeeded__block_invoke_43;
    v6[3] = &unk_1EA2DB728;
    objc_copyWeak(&v7, (id *)(a1 + 40));
    v6[4] = *(_QWORD *)(a1 + 32);
    dispatch_async(MEMORY[0x1E0C80D38], v6);
    objc_destroyWeak(&v7);
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      __70__AAUIAccountRecoveryViewController_showReviewCustodiansModalIfNeeded__block_invoke_cold_1();

  }
}

void __70__AAUIAccountRecoveryViewController_showReviewCustodiansModalIfNeeded__block_invoke_43(uint64_t a1)
{
  id *v2;
  _QWORD *WeakRetained;
  void *v4;
  _QWORD v5[4];
  id v6;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    +[AAUIReviewCustodianListViewFactory createWithAccountManager:repairHelper:](AAUIReviewCustodianListViewFactory, "createWithAccountManager:repairHelper:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1376), WeakRetained[176]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __70__AAUIAccountRecoveryViewController_showReviewCustodiansModalIfNeeded__block_invoke_2;
    v5[3] = &unk_1EA2DBC18;
    objc_copyWeak(&v6, v2);
    objc_msgSend(WeakRetained, "presentViewController:animated:completion:", v4, 1, v5);
    objc_destroyWeak(&v6);

  }
}

void __70__AAUIAccountRecoveryViewController_showReviewCustodiansModalIfNeeded__block_invoke_2(uint64_t a1)
{
  _BYTE *WeakRetained;
  NSObject *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  WeakRetained[1496] = 1;
  _AAUILogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __70__AAUIAccountRecoveryViewController_showReviewCustodiansModalIfNeeded__block_invoke_2_cold_1();

}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AAUIAccountRecoveryViewController;
  -[AAUIAccountRecoveryViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[AAUIAccountRecoveryViewController _fetchRecoveryKeyUpdate](self, "_fetchRecoveryKeyUpdate");
  -[AAUIAccountRecoveryViewController reloadSpecifiers](self, "reloadSpecifiers");
  if (!self->_didShowCustodianReviewSheet)
    -[AAUIAccountRecoveryViewController showReviewCustodiansModalIfNeeded](self, "showReviewCustodiansModalIfNeeded");
}

- (void)_beginObservingNotifications
{
  -[AAUIAccountRecoveryViewController _beginObservingReviewCustodianDismissedNotification](self, "_beginObservingReviewCustodianDismissedNotification");
  -[AAUIAccountRecoveryViewController _beginObservingTrustedContactChangeNotification](self, "_beginObservingTrustedContactChangeNotification");
}

- (void)reviewCustodianSheetDismissed:(id)a3 withUUIDs:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  void *v12;
  void *v13;

  v5 = a3;
  if (-[AAUIAccountRecoveryViewController isViewLoaded](self, "isViewLoaded")
    && (-[AAUIAccountRecoveryViewController view](self, "view"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v6, "window"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v7,
        v6,
        v7))
  {
    v8 = CFPreferencesCopyAppValue(CFSTR("DismissCustodianReviewCFU"), (CFStringRef)*MEMORY[0x1E0CFAB68]);
    _AAUILogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[AAUIAccountRecoveryViewController reviewCustodianSheetDismissed:withUUIDs:].cold.3();

    if (v8 && objc_msgSend(MEMORY[0x1E0CFAD68], "canRepairCustodian"))
    {
      _AAUILogSystem();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        -[AAUIAccountRecoveryViewController reviewCustodianSheetDismissed:withUUIDs:].cold.2();

      v11 = objc_alloc_init(MEMORY[0x1E0CFAC10]);
      objc_msgSend(v5, "userInfo");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "valueForKey:", CFSTR("custodianUUIDs"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "repairCustodians:remove:completion:", v13, MEMORY[0x1E0C9AA60], &__block_literal_global_18);

    }
  }
  else
  {
    _AAUILogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[AAUIAccountRecoveryViewController reviewCustodianSheetDismissed:withUUIDs:].cold.1();
  }

}

void __77__AAUIAccountRecoveryViewController_reviewCustodianSheetDismissed_withUUIDs___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  NSObject *v4;
  uint8_t v5[16];

  v2 = a2;
  _AAUILogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __77__AAUIAccountRecoveryViewController_reviewCustodianSheetDismissed_withUUIDs___block_invoke_cold_1();
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1DB4ED000, v4, OS_LOG_TYPE_DEFAULT, "Successfully repaired custodians.", v5, 2u);
  }

}

- (void)_stopObservingNotifications
{
  -[AAUIAccountRecoveryViewController _stopObservingReviewCustodianDismissedNotification](self, "_stopObservingReviewCustodianDismissedNotification");
  -[AAUIAccountRecoveryViewController _stopObservingTrustedContactChangeNotification](self, "_stopObservingTrustedContactChangeNotification");
}

- (void)_beginObservingReviewCustodianDismissedNotification
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_reviewCustodianSheetDismissed_withUUIDs_, CFSTR("AAUICustodianReviewSheetDismissed"), 0);

}

- (void)_beginObservingTrustedContactChangeNotification
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:suspensionBehavior:", self, sel__fetchAllCustodianContacts, *MEMORY[0x1E0CFAB70], 0, 4);

}

- (void)_stopObservingTrustedContactChangeNotification
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0CFAB70], 0);

}

- (void)_stopObservingReviewCustodianDismissedNotification
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("AAUICustodianReviewSheetDismissed"), 0);

}

- (id)specifiers
{
  uint64_t v3;
  objc_class *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = (int)*MEMORY[0x1E0D80590];
  if (!*(Class *)((char *)&self->super.super.super.super.super.isa + v3))
  {
    -[AAUIAccountRecoveryViewController _generateSpecifiers](self, "_generateSpecifiers");
    v4 = (objc_class *)objc_claimAutoreleasedReturnValue();
    v5 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = v4;

  }
  _AAUILogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa + v3);
    v9 = 138412290;
    v10 = v7;
    _os_log_impl(&dword_1DB4ED000, v6, OS_LOG_TYPE_DEFAULT, "AAUIAccountRecoveryViewController specifiers: returning %@", (uint8_t *)&v9, 0xCu);
  }

  return *(id *)((char *)&self->super.super.super.super.super.isa + v3);
}

- (id)_generateSpecifiers
{
  NSObject *v3;
  void *v4;
  _BOOL4 v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  _BOOL4 v18;
  NSObject *v19;
  _BOOL4 v20;
  uint8_t v22[16];
  uint8_t v23[16];
  uint8_t v24[16];
  uint8_t buf[16];

  _AAUILogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DB4ED000, v3, OS_LOG_TYPE_DEFAULT, "Loading Account Recovery specifiers.", buf, 2u);
  }

  v4 = (void *)objc_opt_new();
  v5 = -[AAUIAccountRecoveryViewController _canHaveCustodian](self, "_canHaveCustodian");
  _AAUILogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      *(_WORD *)v24 = 0;
      _os_log_impl(&dword_1DB4ED000, v6, OS_LOG_TYPE_DEFAULT, "Account can have custodians, adding custodian specifiers to UI...", v24, 2u);
    }

    -[AAUIAccountRecoveryViewController _accountRecoveryDetailsSpecifier](self, "_accountRecoveryDetailsSpecifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v8);

    -[AAUIAccountRecoveryViewController _recoveryOptionsGroupSpecifier](self, "_recoveryOptionsGroupSpecifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v9);

    -[AAUIAccountRecoveryViewController _myRecoveryOptionsSpecifiers](self, "_myRecoveryOptionsSpecifiers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObjectsFromArray:", v10);

    -[AAUIAccountRecoveryViewController _addRecoveryContactSpecifier](self, "_addRecoveryContactSpecifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v11);
  }
  else
  {
    if (v7)
    {
      *(_WORD *)v23 = 0;
      _os_log_impl(&dword_1DB4ED000, v6, OS_LOG_TYPE_DEFAULT, "Account not eligible to have custodians, adding ineligible specifiers to UI...", v23, 2u);
    }

    -[AAUIAccountRecoveryViewController _accountRecoveryDetailsSpecifierForIneligibleAccount](self, "_accountRecoveryDetailsSpecifierForIneligibleAccount");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v12);

    -[AAUIAccountRecoveryViewController _recoveryOptionsGroupSpecifierForIneligibleAccount](self, "_recoveryOptionsGroupSpecifierForIneligibleAccount");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v13);

    -[AAUIAccountRecoveryViewController _myRecoveryOptionsSpecifiers](self, "_myRecoveryOptionsSpecifiers");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObjectsFromArray:", v11);
  }

  if (-[AAUIAccountRecoveryViewController _isEligibleForRecoveryKey](self, "_isEligibleForRecoveryKey"))
  {
    -[AAUIAccountRecoveryViewController _recoveryKeySpecifiers](self, "_recoveryKeySpecifiers");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObjectsFromArray:", v14);

  }
  if (-[AAUIAccountRecoveryViewController _canBeCustodian](self, "_canBeCustodian"))
  {
    _AAUILogSystem();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v22 = 0;
      _os_log_impl(&dword_1DB4ED000, v15, OS_LOG_TYPE_DEFAULT, "Account can be a custodian, adding custodianship owner specifiers, if any, to UI...", v22, 2u);
    }

    if (-[NSArray count](self->_myCustodianshipOwners, "count"))
    {
      -[AAUIAccountRecoveryViewController _recoveryContactForGroupSpecifier](self, "_recoveryContactForGroupSpecifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v16);

      -[AAUIAccountRecoveryViewController _recoveryContactForSpecifiers](self, "_recoveryContactForSpecifiers");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObjectsFromArray:", v17);

    }
  }
  v18 = -[AAUIAccountRecoveryViewController _isPrintableSummaryEnabled](self, "_isPrintableSummaryEnabled");
  _AAUILogSystem();
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG);
  if (v18)
  {
    if (v20)
      -[AAUIAccountRecoveryViewController _generateSpecifiers].cold.1();

    -[AAUIAccountRecoveryViewController _printableSummarySpecifiers](self, "_printableSummarySpecifiers");
    v19 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObjectsFromArray:", v19);
  }
  else if (v20)
  {
    -[AAUIAccountRecoveryViewController _generateSpecifiers].cold.2();
  }

  return v4;
}

- (void)_reloadSpecifiersAnimated
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x1E0D80590]);
  if (v3 && *((_BYTE *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x1E0D80588]))
  {
    v4 = v3;
    -[AAUIAccountRecoveryViewController _generateSpecifiers](self, "_generateSpecifiers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "differenceFromArray:withOptions:usingEquivalenceTest:", v4, 0, &__block_literal_global_63);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAUIAccountRecoveryViewController beginUpdates](self, "beginUpdates");
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    objc_msgSend(v6, "removals");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "reverseObjectEnumerator");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v25 != v11)
            objc_enumerationMutation(v8);
          -[AAUIAccountRecoveryViewController removeSpecifierAtIndex:animated:](self, "removeSpecifierAtIndex:animated:", objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * i), "index"), 1);
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      }
      while (v10);
    }

    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    objc_msgSend(v6, "insertions", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v21;
      do
      {
        for (j = 0; j != v15; ++j)
        {
          if (*(_QWORD *)v21 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * j);
          objc_msgSend(v18, "object");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[AAUIAccountRecoveryViewController insertSpecifier:atIndex:animated:](self, "insertSpecifier:atIndex:animated:", v19, objc_msgSend(v18, "index"), 1);

        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
      }
      while (v15);
    }

    -[AAUIAccountRecoveryViewController endUpdates](self, "endUpdates");
  }
  else
  {
    -[AAUIAccountRecoveryViewController reloadSpecifiers](self, "reloadSpecifiers");
  }
}

uint64_t __62__AAUIAccountRecoveryViewController__reloadSpecifiersAnimated__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  char isKindOfClass;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  int v27;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqualToString:", v7);

  if ((_DWORD)v8)
  {
    objc_msgSend(v4, "userInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v5, "userInfo");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v12 = objc_opt_isKindOfClass();

      if ((v12 & 1) != 0)
      {
        objc_msgSend(v4, "userInfo");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "userInfo");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "displayName");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "displayName");
        v16 = objc_claimAutoreleasedReturnValue();
        if (v15 == (void *)v16)
        {

        }
        else
        {
          v17 = (void *)v16;
          objc_msgSend(v13, "displayName");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "displayName");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v18, "isEqualToString:", v19);

          if (!v20)
            goto LABEL_11;
        }
        objc_msgSend(v13, "detailsText");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "detailsText");
        v22 = objc_claimAutoreleasedReturnValue();
        if (v21 == (void *)v22)
        {

        }
        else
        {
          v23 = (void *)v22;
          objc_msgSend(v13, "detailsText");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "detailsText");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v24, "isEqualToString:", v25);

          if (!v26)
          {
LABEL_11:
            v8 = 0;
LABEL_14:

            goto LABEL_15;
          }
        }
        v27 = objc_msgSend(v13, "shouldGrayOutContactRow");
        v8 = v27 ^ objc_msgSend(v14, "shouldGrayOutContactRow") ^ 1;
        goto LABEL_14;
      }
    }
    v8 = 1;
  }
LABEL_15:

  return v8;
}

- (BOOL)_isPrintableSummaryEnabled
{
  BOOL v3;
  NSObject *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  NSObject *v15;
  void *v16;
  void *v17;
  char v18;
  NSObject *v19;
  void *v20;
  char v21;
  NSObject *v22;

  v3 = +[AAUIFeatureFlags isPrintableSummaryEnabled](AAUIFeatureFlags, "isPrintableSummaryEnabled");
  _AAUILogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
  if (v3)
  {
    if (v5)
      -[AAUIAccountRecoveryViewController _isPrintableSummaryEnabled].cold.5();

    v6 = (void *)MEMORY[0x1E0D15760];
    -[AAUIAccountRecoveryViewController _idmsAccount](self, "_idmsAccount");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "aa_altDSID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v6, "isHSA2Enabled:", v8);

    _AAUILogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[AAUIAccountRecoveryViewController _isPrintableSummaryEnabled].cold.4();

    v11 = (void *)MEMORY[0x1E0D15760];
    -[AAUIAccountRecoveryViewController _appleAccount](self, "_appleAccount");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "aa_personID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v11, "isICDPEnabledForDSID:", v13);

    _AAUILogSystem();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      -[AAUIAccountRecoveryViewController _isPrintableSummaryEnabled].cold.3();

    objc_msgSend(MEMORY[0x1E0D00100], "sharedInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAUIAccountRecoveryViewController _idmsAccount](self, "_idmsAccount");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v16, "userUnderAgeForAccount:", v17);

    _AAUILogSystem();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      -[AAUIAccountRecoveryViewController _isPrintableSummaryEnabled].cold.2();

    -[AAUIAccountRecoveryViewController _appleAccount](self, "_appleAccount");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "aa_isManagedAppleID");

    _AAUILogSystem();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      -[AAUIAccountRecoveryViewController _isPrintableSummaryEnabled].cold.1();

    if ((v9 & v14) == 1)
      return (v18 | v21) ^ 1;
  }
  else
  {
    if (v5)
      -[AAUIAccountRecoveryViewController _isPrintableSummaryEnabled].cold.6();

  }
  return 0;
}

- (void)_printAccountAccessSummary:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  _QWORD v8[6];
  uint8_t buf[8];
  uint8_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v4 = a3;
  _AAUILogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DB4ED000, v5, OS_LOG_TYPE_DEFAULT, "Print Account Access Summary button was tapped.", buf, 2u);
  }

  *(_QWORD *)buf = 0;
  v10 = buf;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__10;
  v13 = __Block_byref_object_dispose__10;
  +[AAUIPasscodeValidateController stingrayControllerWithPresenter:forceInline:](AAUIPasscodeValidateController, "stingrayControllerWithPresenter:forceInline:", self, 1);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  _AAUILogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[AAUIAccountRecoveryViewController _printAccountAccessSummary:].cold.1();

  v7 = (void *)*((_QWORD *)v10 + 5);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __64__AAUIAccountRecoveryViewController__printAccountAccessSummary___block_invoke;
  v8[3] = &unk_1EA2DD0A0;
  v8[4] = self;
  v8[5] = buf;
  objc_msgSend(v7, "validatePasscodeStateWithCompletion:", v8);
  _Block_object_dispose(buf, 8);

}

void __64__AAUIAccountRecoveryViewController__printAccountAccessSummary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;

  v5 = a2;
  v6 = a3;
  if (!v6)
  {
    +[AAUIPrintableAccountRecoverySummaryViewFactory createWithContext:](AAUIPrintableAccountRecoverySummaryViewFactory, "createWithContext:", CFSTR("settings"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", v7, 1, 0);

  }
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = 0;

  _AAUILogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    __64__AAUIAccountRecoveryViewController__printAccountAccessSummary___block_invoke_cold_1();

}

- (void)remoteUIRequestComplete:(id)a3 error:(id)a4
{
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __67__AAUIAccountRecoveryViewController_remoteUIRequestComplete_error___block_invoke;
  v4[3] = &unk_1EA2DBC18;
  objc_copyWeak(&v5, &location);
  dispatch_async(MEMORY[0x1E0C80D38], v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __67__AAUIAccountRecoveryViewController_remoteUIRequestComplete_error___block_invoke(uint64_t a1)
{
  void *v1;
  id *WeakRetained;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained[181], "stopAllSpinners");
  objc_msgSend(WeakRetained, "view");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setUserInteractionEnabled:", 1);

}

- (void)_syncTrustedContactsFromCloudKit
{
  AACustodianController *custodianController;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  custodianController = self->_custodianController;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __69__AAUIAccountRecoveryViewController__syncTrustedContactsFromCloudKit__block_invoke;
  v4[3] = &unk_1EA2DD0C8;
  objc_copyWeak(&v5, &location);
  -[AACustodianController pullTrustedContactsFromCloudKitWithCompletion:](custodianController, "pullTrustedContactsFromCloudKitWithCompletion:", v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __69__AAUIAccountRecoveryViewController__syncTrustedContactsFromCloudKit__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _QWORD block[4];
  id v6;
  uint8_t buf[4];
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _AAUILogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v8 = v3;
    _os_log_impl(&dword_1DB4ED000, v4, OS_LOG_TYPE_DEFAULT, "Completed sync of trusted contacts from CloudKit with error: %@", buf, 0xCu);
  }

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__AAUIAccountRecoveryViewController__syncTrustedContactsFromCloudKit__block_invoke_71;
  block[3] = &unk_1EA2DBC18;
  objc_copyWeak(&v6, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(&v6);

}

void __69__AAUIAccountRecoveryViewController__syncTrustedContactsFromCloudKit__block_invoke_71(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_fetchAllCustodianContacts");
    WeakRetained = v2;
  }

}

- (void)_fetchAllCustodianContacts
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  AAUIContactsProvider *contactsProvider;
  AAUIContactsProvider *v11;
  NSObject *v12;
  AAUIContactsProvider *v13;
  NSObject *v14;
  void *v15;
  _QWORD block[4];
  id v17;
  _QWORD v18[4];
  NSObject *v19;
  id v20;
  _QWORD v21[4];
  NSObject *v22;
  void *v23;
  id v24;
  _QWORD v25[4];
  NSObject *v26;
  void *v27;
  id v28;
  _QWORD v29[4];
  NSObject *v30;
  id v31;
  id location[2];

  -[AAUISpinnerManager startNavigationSpinner](self->_spinnerManager, "startNavigationSpinner");
  objc_initWeak(location, self);
  v3 = dispatch_group_create();
  v4 = (void *)objc_opt_new();
  dispatch_group_enter(v3);
  v5 = MEMORY[0x1E0C809B0];
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __63__AAUIAccountRecoveryViewController__fetchAllCustodianContacts__block_invoke;
  v29[3] = &unk_1EA2DD0F0;
  v6 = v3;
  v30 = v6;
  objc_copyWeak(&v31, location);
  v15 = v4;
  objc_msgSend(v4, "isWalrusRecoveryKeyAvailableWithCompletion:", v29);
  v7 = (void *)objc_opt_new();
  if (!self->_myCustodiansRequestId)
  {
    -[AAUICustodianRepairHelper localContacts](self->_repairHelper, "localContacts");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    if (!v9)
    {
      dispatch_group_enter(v6);
      contactsProvider = self->_contactsProvider;
      v25[0] = v5;
      v25[1] = 3221225472;
      v25[2] = __63__AAUIAccountRecoveryViewController__fetchAllCustodianContacts__block_invoke_79;
      v25[3] = &unk_1EA2DD140;
      objc_copyWeak(&v28, location);
      v26 = v6;
      v27 = v7;
      -[AAContactsProvider fetchMyCachedCustodians:](contactsProvider, "fetchMyCachedCustodians:", v25);

      objc_destroyWeak(&v28);
    }
  }
  dispatch_group_enter(v6);
  v11 = self->_contactsProvider;
  v21[0] = v5;
  v21[1] = 3221225472;
  v21[2] = __63__AAUIAccountRecoveryViewController__fetchAllCustodianContacts__block_invoke_3;
  v21[3] = &unk_1EA2DD140;
  objc_copyWeak(&v24, location);
  v12 = v6;
  v22 = v12;
  v23 = v7;
  -[AAContactsProvider fetchMyCustodians:](v11, "fetchMyCustodians:", v21);
  objc_storeStrong((id *)&self->_myCustodiansRequestId, v7);
  dispatch_group_enter(v12);
  v13 = self->_contactsProvider;
  v18[0] = v5;
  v18[1] = 3221225472;
  v18[2] = __63__AAUIAccountRecoveryViewController__fetchAllCustodianContacts__block_invoke_5;
  v18[3] = &unk_1EA2DD190;
  objc_copyWeak(&v20, location);
  v14 = v12;
  v19 = v14;
  -[AAContactsProvider fetchMyCustodianshipOwners:](v13, "fetchMyCustodianshipOwners:", v18);
  block[0] = v5;
  block[1] = 3221225472;
  block[2] = __63__AAUIAccountRecoveryViewController__fetchAllCustodianContacts__block_invoke_7;
  block[3] = &unk_1EA2DBC18;
  objc_copyWeak(&v17, location);
  dispatch_group_notify(v14, MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(&v17);

  objc_destroyWeak(&v20);
  objc_destroyWeak(&v24);

  objc_destroyWeak(&v31);
  objc_destroyWeak(location);
}

void __63__AAUIAccountRecoveryViewController__fetchAllCustodianContacts__block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  const __CFString *v8;
  id *WeakRetained;
  id *v10;
  void *v11;
  int v12;
  const __CFString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _AAUILogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __63__AAUIAccountRecoveryViewController__fetchAllCustodianContacts__block_invoke_cold_1();

    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = CFSTR("NO");
      if (a2)
        v8 = CFSTR("YES");
      v12 = 138412290;
      v13 = v8;
      _os_log_impl(&dword_1DB4ED000, v7, OS_LOG_TYPE_DEFAULT, "Recovery key state: %@ (fetch all)", (uint8_t *)&v12, 0xCu);
    }

    WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
    v10 = WeakRetained;
    if (WeakRetained && *((unsigned __int8 *)WeakRetained + 1480) != a2)
    {
      *((_BYTE *)WeakRetained + 1480) = a2;
      objc_msgSend(WeakRetained[179], "recoveryKeyLabel");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "reloadSpecifierID:", v11);

    }
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

  }
}

void __63__AAUIAccountRecoveryViewController__fetchAllCustodianContacts__block_invoke_79(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;
  id v10;
  id v11;

  v3 = a2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __63__AAUIAccountRecoveryViewController__fetchAllCustodianContacts__block_invoke_2;
  v7[3] = &unk_1EA2DD118;
  objc_copyWeak(&v11, (id *)(a1 + 48));
  v4 = *(id *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v8 = v4;
  v9 = v5;
  v10 = v3;
  v6 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

  objc_destroyWeak(&v11);
}

void __63__AAUIAccountRecoveryViewController__fetchAllCustodianContacts__block_invoke_2(uint64_t a1)
{
  id *WeakRetained;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained && objc_msgSend(*(id *)(a1 + 40), "isEqual:", WeakRetained[175]))
  {
    objc_msgSend(WeakRetained[176], "setLocalContacts:", *(_QWORD *)(a1 + 48));
    objc_msgSend(WeakRetained, "_reloadSpecifiersAnimated");
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __63__AAUIAccountRecoveryViewController__fetchAllCustodianContacts__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;
  id v10;
  id v11;

  v3 = a2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __63__AAUIAccountRecoveryViewController__fetchAllCustodianContacts__block_invoke_4;
  v7[3] = &unk_1EA2DD118;
  objc_copyWeak(&v11, (id *)(a1 + 48));
  v4 = *(id *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v8 = v4;
  v9 = v5;
  v10 = v3;
  v6 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

  objc_destroyWeak(&v11);
}

void __63__AAUIAccountRecoveryViewController__fetchAllCustodianContacts__block_invoke_4(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained && objc_msgSend(*(id *)(a1 + 40), "isEqual:", *((_QWORD *)WeakRetained + 175)))
  {
    v2 = (void *)*((_QWORD *)WeakRetained + 175);
    *((_QWORD *)WeakRetained + 175) = 0;

    objc_msgSend(*((id *)WeakRetained + 176), "setLocalContacts:", *(_QWORD *)(a1 + 48));
    objc_msgSend(WeakRetained, "_reloadSpecifiersAnimated");
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __63__AAUIAccountRecoveryViewController__fetchAllCustodianContacts__block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD block[4];
  id v6;
  id v7;
  id v8;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__AAUIAccountRecoveryViewController__fetchAllCustodianContacts__block_invoke_6;
  block[3] = &unk_1EA2DD168;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  v6 = *(id *)(a1 + 32);
  v7 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v8);
}

void __63__AAUIAccountRecoveryViewController__fetchAllCustodianContacts__block_invoke_6(uint64_t a1)
{
  id *WeakRetained;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    objc_storeStrong(WeakRetained + 177, *(id *)(a1 + 40));
    objc_msgSend(WeakRetained, "_reloadSpecifiersAnimated");
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __63__AAUIAccountRecoveryViewController__fetchAllCustodianContacts__block_invoke_7(uint64_t a1)
{
  id *WeakRetained;
  id *v2;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained[181], "stopNavigationSpinner");
    WeakRetained = v2;
  }

}

- (void)_fetchRecoveryKeyUpdate
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id location;

  objc_initWeak(&location, self);
  v2 = (void *)objc_opt_new();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __60__AAUIAccountRecoveryViewController__fetchRecoveryKeyUpdate__block_invoke;
  v3[3] = &unk_1EA2DCEC0;
  objc_copyWeak(&v4, &location);
  objc_msgSend(v2, "isWalrusRecoveryKeyAvailableWithCompletion:", v3);
  objc_destroyWeak(&v4);

  objc_destroyWeak(&location);
}

void __60__AAUIAccountRecoveryViewController__fetchRecoveryKeyUpdate__block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  _BYTE *WeakRetained;
  NSObject *v7;
  NSObject *v8;
  const __CFString *v9;
  _QWORD block[5];
  uint8_t buf[4];
  const __CFString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  _AAUILogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __60__AAUIAccountRecoveryViewController__fetchRecoveryKeyUpdate__block_invoke_cold_1();

  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9 = CFSTR("NO");
      if (a2)
        v9 = CFSTR("YES");
      *(_DWORD *)buf = 138412290;
      v12 = v9;
      _os_log_impl(&dword_1DB4ED000, v8, OS_LOG_TYPE_DEFAULT, "Recovery key state: %@ (fetch recovery key)", buf, 0xCu);
    }

    if (WeakRetained && WeakRetained[1480] != a2)
    {
      WeakRetained[1480] = a2;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __60__AAUIAccountRecoveryViewController__fetchRecoveryKeyUpdate__block_invoke_81;
      block[3] = &unk_1EA2DB208;
      block[4] = WeakRetained;
      dispatch_async(MEMORY[0x1E0C80D38], block);
    }
  }

}

void __60__AAUIAccountRecoveryViewController__fetchRecoveryKeyUpdate__block_invoke_81(uint64_t a1)
{
  id *v1;
  id v2;

  v1 = *(id **)(a1 + 32);
  objc_msgSend(v1[179], "recoveryKeyLabel");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "reloadSpecifierID:", v2);

}

- (void)_syncAccountRecoveryFactorsWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  AACustodianController *custodianController;
  uint64_t v8;
  NSObject *v9;
  AKAppleIDAuthenticationController *authenticationController;
  void *v11;
  void *v12;
  NSObject *v13;
  _QWORD v14[4];
  NSObject *v15;
  _QWORD v16[4];
  NSObject *v17;
  uint8_t buf[16];

  v4 = a3;
  v5 = dispatch_group_create();
  _AAUILogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DB4ED000, v6, OS_LOG_TYPE_DEFAULT, "Attempting to sync recovery factors and walrus status", buf, 2u);
  }

  dispatch_group_enter(v5);
  custodianController = self->_custodianController;
  v8 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __79__AAUIAccountRecoveryViewController__syncAccountRecoveryFactorsWithCompletion___block_invoke;
  v16[3] = &unk_1EA2DB7F0;
  v9 = v5;
  v17 = v9;
  -[AACustodianController performTrustedContactsDataSyncWithCompletion:](custodianController, "performTrustedContactsDataSyncWithCompletion:", v16);
  dispatch_group_enter(v9);
  authenticationController = self->_authenticationController;
  -[AAUIAccountRecoveryViewController _appleAccount](self, "_appleAccount");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "aa_altDSID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __79__AAUIAccountRecoveryViewController__syncAccountRecoveryFactorsWithCompletion___block_invoke_82;
  v14[3] = &unk_1EA2DB7F0;
  v15 = v9;
  v13 = v9;
  -[AKAppleIDAuthenticationController performCheckInForAccountWithAltDSID:completion:](authenticationController, "performCheckInForAccountWithAltDSID:completion:", v12, v14);

  dispatch_group_notify(v13, MEMORY[0x1E0C80D38], v4);
}

void __79__AAUIAccountRecoveryViewController__syncAccountRecoveryFactorsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint8_t v6[16];

  v3 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  _AAUILogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __79__AAUIAccountRecoveryViewController__syncAccountRecoveryFactorsWithCompletion___block_invoke_cold_1();
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1DB4ED000, v5, OS_LOG_TYPE_DEFAULT, "Successfully performed trusted contacts data sync", v6, 2u);
  }

}

void __79__AAUIAccountRecoveryViewController__syncAccountRecoveryFactorsWithCompletion___block_invoke_82(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint8_t v6[16];

  v3 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  _AAUILogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __79__AAUIAccountRecoveryViewController__syncAccountRecoveryFactorsWithCompletion___block_invoke_82_cold_1();
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1DB4ED000, v5, OS_LOG_TYPE_DEFAULT, "Successfully performed liveness check-in", v6, 2u);
  }

}

- (id)_accountRecoveryDetailsSpecifier
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0D804E8], "groupSpecifierWithID:name:", CFSTR("ACCOUNT RECOVERY DETAILS"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAAccountRecoveryManagementViewModel details](self->_viewModel, "details");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setProperty:forKey:", v4, *MEMORY[0x1E0D80848]);

  return v3;
}

- (id)_accountRecoveryDetailsSpecifierForIneligibleAccount
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0D804E8], "groupSpecifierWithID:name:", CFSTR("ACCOUNT RECOVERY DETAILS INELIGIBLE"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAAccountRecoveryManagementViewModel detailsForIneligibleAccount](self->_viewModel, "detailsForIneligibleAccount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setProperty:forKey:", v4, *MEMORY[0x1E0D80848]);

  return v3;
}

- (id)_recoveryOptionsGroupSpecifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_opt_new();
  -[AAAccountRecoveryManagementViewModel myRecoveryContactsGroupTitle](self->_viewModel, "myRecoveryContactsGroupTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAAccountRecoveryManagementViewModel myRecoveryContactsFooter](self->_viewModel, "myRecoveryContactsFooter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAAccountRecoveryManagementViewModel learnMore](self->_viewModel, "learnMore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "createGroupSpecifierWithIdentifier:title:footerText:linkText:actionMethodName:target:", CFSTR("RECOVERY CONTACT"), v4, v5, v6, CFSTR("_footerLearnMoreWasTapped"), self);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_recoveryOptionsGroupSpecifierForIneligibleAccount
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_opt_new();
  -[AAAccountRecoveryManagementViewModel myRecoveryContactsGroupTitle](self->_viewModel, "myRecoveryContactsGroupTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAAccountRecoveryManagementViewModel myRecoveryContactsFooterForIneligibleAccount](self->_viewModel, "myRecoveryContactsFooterForIneligibleAccount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAAccountRecoveryManagementViewModel learnMore](self->_viewModel, "learnMore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "createGroupSpecifierWithIdentifier:title:footerText:linkText:actionMethodName:target:", CFSTR("RECOVERY CONTACT INELIGIBLE"), v4, v5, v6, CFSTR("_footerLearnMoreWasTapped"), self);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_myRecoveryOptionsSpecifiers
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id obj;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  if (-[AAUIAccountRecoveryViewController _canHaveCustodian](self, "_canHaveCustodian"))
  {
    -[AAUICustodianRepairHelper localContacts](self->_repairHelper, "localContacts");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sortedArrayUsingComparator:", &__block_literal_global_96);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    obj = v5;
    v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v17 != v8)
            objc_enumerationMutation(obj);
          v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          +[AAUITrustedContactListCell specifierForContact:loadAction:target:](AAUITrustedContactListCell, "specifierForContact:loadAction:target:", v10, sel__myRecoveryContactWasTapped_, self);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "handle");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(CFSTR("RecoveryOption-"), "stringByAppendingString:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setIdentifier:", v13);

          objc_msgSend(v3, "addObject:", v11);
        }
        v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v7);
    }

  }
  return v3;
}

uint64_t __65__AAUIAccountRecoveryViewController__myRecoveryOptionsSpecifiers__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "displayName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

- (id)_addRecoveryContactSpecifier
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_opt_new();
  -[AAAccountRecoveryManagementViewModel myRecoveryContactsAdd](self->_viewModel, "myRecoveryContactsAdd");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "createAddTableCellWithTitle:loadAction:target:", v4, sel__showAddCustodian, self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_printableSummarySpecifiers
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
  void *v17;

  v3 = (void *)objc_opt_new();
  v17 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAAccountRecoveryManagementViewModel printableSummaryFooter](self->_viewModel, "printableSummaryFooter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", v5, &stru_1EA2E2A18, CFSTR("Localizable"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAAccountRecoveryManagementViewModel learnMore](self->_viewModel, "learnMore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "createGroupSpecifierWithIdentifier:title:footerText:linkText:actionMethodName:target:", CFSTR("PRINTABLE SUMMARY"), &stru_1EA2E2A18, v6, v7, CFSTR("_printableSummaryLearnMoreTapped"), self);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "addObject:", v8);
  v9 = (void *)MEMORY[0x1E0D804E8];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAAccountRecoveryManagementViewModel printableSummaryLabel](self->_viewModel, "printableSummaryLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", v11, &stru_1EA2E2A18, CFSTR("Localizable"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v12, self, 0, 0, 0, 13, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[AAAccountRecoveryManagementViewModel printableSummaryLabel](self->_viewModel, "printableSummaryLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setProperty:forKey:", v14, *MEMORY[0x1E0D80978]);

  -[AAAccountRecoveryManagementViewModel printableSummaryLabel](self->_viewModel, "printableSummaryLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setIdentifier:", v15);

  objc_msgSend(v13, "setButtonAction:", sel__printAccountAccessSummary_);
  objc_msgSend(v3, "addObject:", v13);

  return v3;
}

- (id)_recoveryKeySpecifiers
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

  v3 = (void *)objc_opt_new();
  v4 = (void *)objc_opt_new();
  -[AAAccountRecoveryManagementViewModel recoveryKeyLabel](self->_viewModel, "recoveryKeyLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAAccountRecoveryManagementViewModel recoveryKeyDetails](self->_viewModel, "recoveryKeyDetails");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAAccountRecoveryManagementViewModel learnMore](self->_viewModel, "learnMore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "createGroupSpecifierWithIdentifier:title:footerText:linkText:actionMethodName:target:", CFSTR("RECOVERY KEY"), v5, v6, v7, CFSTR("_rkFooterLearnMoreTapped"), self);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "addObject:", v8);
  v9 = (void *)MEMORY[0x1E0D804E8];
  -[AAAccountRecoveryManagementViewModel recoveryKeyLabel](self->_viewModel, "recoveryKeyLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v10, self, 0, sel__recoveryKeyState, 0, 2, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[AAAccountRecoveryManagementViewModel recoveryKeyLabel](self->_viewModel, "recoveryKeyLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setIdentifier:", v12);

  -[AAAccountRecoveryManagementViewModel recoveryKeyLabel](self->_viewModel, "recoveryKeyLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setProperty:forKey:", v13, *MEMORY[0x1E0D80978]);

  objc_msgSend(v11, "setControllerLoadAction:", sel__showRecoveryKey_);
  objc_msgSend(v3, "addObject:", v11);

  return v3;
}

- (id)_recoveryContactForGroupSpecifier
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0D804E8];
  -[AAAccountRecoveryManagementViewModel recoveryContactForGroupTitle](self->_viewModel, "recoveryContactForGroupTitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "groupSpecifierWithID:name:", CFSTR("ACCOUNT RECOVERY FOR"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_recoveryContactForSpecifiers
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSArray *obj;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  obj = self->_myCustodianshipOwners;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        +[AAUITrustedContactListCell specifierForContact:loadAction:target:](AAUITrustedContactListCell, "specifierForContact:loadAction:target:", v8, sel__custodianshipOwnerWasTapped_, self);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "handle");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(CFSTR("RecoveryContact-"), "stringByAppendingString:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setIdentifier:", v11);

        objc_msgSend(v3, "addObject:", v9);
      }
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v5);
  }

  return v3;
}

- (void)_myRecoveryContactWasTapped:(id)a3
{
  uint64_t v4;
  __objc2_class **v5;
  void *v6;
  void *v7;
  void *v8;
  AAUITrustedContactDetailsViewController *v9;
  id v10;

  objc_msgSend(a3, "userInfo");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v10, "trustedContactStatus");
  v5 = off_1EA2D9D18;
  if (v4 != 1)
    v5 = off_1EA2D9D08;
  v6 = (void *)objc_msgSend(objc_alloc(*v5), "initWithAccountManager:localContact:", self->_accountManager, v10);
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "viewModelForFlow:withContact:", 0, v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[AAUITrustedContactDetailsViewController initWithContact:viewModel:actionHandler:]([AAUITrustedContactDetailsViewController alloc], "initWithContact:viewModel:actionHandler:", v10, v8, v6);
  -[AAUIAccountRecoveryViewController _showViewController:](self, "_showViewController:", v9);

}

- (void)_learnMoreWasTapped
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint8_t v6[16];

  _AAUILogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1DB4ED000, v3, OS_LOG_TYPE_DEFAULT, "iCDRS Learn More was tapped", v6, 2u);
  }

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAAccountRecoveryManagementViewModel learnMoreURL](self->_viewModel, "learnMoreURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "openURL:withCompletionHandler:", v5, 0);

}

- (void)_footerLearnMoreWasTapped
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint8_t v6[16];

  _AAUILogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1DB4ED000, v3, OS_LOG_TYPE_DEFAULT, "iCDRS Footer Learn More was tapped", v6, 2u);
  }

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAAccountRecoveryManagementViewModel footerLearnMoreURL](self->_viewModel, "footerLearnMoreURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "openURL:withCompletionHandler:", v5, 0);

}

- (void)_custodianshipOwnerWasTapped:(id)a3
{
  AAUICustodianForActionHandler *v4;
  void *v5;
  void *v6;
  AAUITrustedContactDetailsViewController *v7;
  id v8;

  objc_msgSend(a3, "userInfo");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v4 = -[AAUICustodianForActionHandler initWithLocalContact:]([AAUICustodianForActionHandler alloc], "initWithLocalContact:", v8);
  v5 = (void *)objc_opt_new();
  objc_msgSend(v5, "viewModelForFlow:withContact:", 1, v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[AAUITrustedContactDetailsViewController initWithContact:viewModel:actionHandler:]([AAUITrustedContactDetailsViewController alloc], "initWithContact:viewModel:actionHandler:", v8, v6, v4);
  -[AAUIAccountRecoveryViewController _showViewController:](self, "_showViewController:", v7);

}

- (void)_showAddCustodian
{
  void *v3;
  void *v4;
  AAUIDTOHelper *dtoHelper;
  void *v6;
  NSObject *v7;
  _QWORD v8[5];

  -[AIDAAccountManager accounts](self->_accountManager, "accounts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0CFCF18]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    dtoHelper = self->_dtoHelper;
    objc_msgSend(v4, "aa_altDSID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __54__AAUIAccountRecoveryViewController__showAddCustodian__block_invoke;
    v8[3] = &unk_1EA2DBAA8;
    v8[4] = self;
    -[AAUIDTOHelper shouldGateUsingRatchetForAltDSID:completion:](dtoHelper, "shouldGateUsingRatchetForAltDSID:completion:", v6, v8);

  }
  else
  {
    _AAUILogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[AAUIRecoveryFactorController startAddingRecoveryContact].cold.1();

  }
}

void __54__AAUIAccountRecoveryViewController__showAddCustodian__block_invoke(uint64_t a1, int a2)
{
  NSObject *v3;
  NSObject *v4;
  _QWORD *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  _QWORD *v12;
  _QWORD v13[5];
  _QWORD block[5];
  _QWORD v15[5];

  if (!a2)
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __54__AAUIAccountRecoveryViewController__showAddCustodian__block_invoke_135;
    v13[3] = &unk_1EA2DB208;
    v13[4] = *(_QWORD *)(a1 + 32);
    v11 = MEMORY[0x1E0C80D38];
    v12 = v13;
LABEL_10:
    dispatch_async(v11, v12);
    return;
  }
  _AAUILogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __58__AAUIRecoveryFactorController_startAddingRecoveryContact__block_invoke_cold_2();

  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1472), "isDTOGatingEnabled"))
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __54__AAUIAccountRecoveryViewController__showAddCustodian__block_invoke_2;
    block[3] = &unk_1EA2DB208;
    block[4] = *(_QWORD *)(a1 + 32);
    v11 = MEMORY[0x1E0C80D38];
    v12 = block;
    goto LABEL_10;
  }
  _AAUILogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __58__AAUIRecoveryFactorController_startAddingRecoveryContact__block_invoke_cold_1();

  v5 = *(_QWORD **)(a1 + 32);
  v6 = (void *)v5[184];
  objc_msgSend(v5, "presentingViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "makeRatchetContextWithPresentationContext:DTOContextType:", v7, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(void **)(v9 + 1472);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __54__AAUIAccountRecoveryViewController__showAddCustodian__block_invoke_133;
  v15[3] = &unk_1EA2DBB10;
  v15[4] = v9;
  objc_msgSend(v10, "shouldAllowOpForContext:completion:", v8, v15);

}

void __54__AAUIAccountRecoveryViewController__showAddCustodian__block_invoke_133(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  _QWORD block[5];

  v5 = a3;
  _AAUILogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    __54__AAUIAccountRecoveryViewController__showAddCustodian__block_invoke_133_cold_1();

  if (a2)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __54__AAUIAccountRecoveryViewController__showAddCustodian__block_invoke_134;
    block[3] = &unk_1EA2DB208;
    block[4] = *(_QWORD *)(a1 + 32);
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }

}

uint64_t __54__AAUIAccountRecoveryViewController__showAddCustodian__block_invoke_134(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_continueShowingAddCustodian");
}

uint64_t __54__AAUIAccountRecoveryViewController__showAddCustodian__block_invoke_2(uint64_t a1)
{
  NSObject *v2;

  _AAUILogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __58__AAUIRecoveryFactorController_startAddingRecoveryContact__block_invoke_2_cold_1();

  return objc_msgSend(*(id *)(a1 + 32), "_continueShowingAddCustodian");
}

uint64_t __54__AAUIAccountRecoveryViewController__showAddCustodian__block_invoke_135(uint64_t a1)
{
  NSObject *v2;

  _AAUILogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __58__AAUIRecoveryFactorController_startAddingRecoveryContact__block_invoke_28_cold_1();

  return objc_msgSend(*(id *)(a1 + 32), "_displayCustodianAddNotAllowedAlert");
}

- (void)_continueShowingAddCustodian
{
  AAUICustodianSetupFlowController *v3;
  AAUICustodianSetupFlowController *custodianSetupFlowController;
  id v5;

  v3 = -[AAUICustodianSetupFlowController initWithAccountManager:]([AAUICustodianSetupFlowController alloc], "initWithAccountManager:", self->_accountManager);
  custodianSetupFlowController = self->_custodianSetupFlowController;
  self->_custodianSetupFlowController = v3;

  -[AAUICustodianSetupFlowController setIsWalrusEnabled:](self->_custodianSetupFlowController, "setIsWalrusEnabled:", +[AAUICDPHelper isWalrusEnabled](AAUICDPHelper, "isWalrusEnabled"));
  -[AAUICustodianSetupFlowController start](self->_custodianSetupFlowController, "start");
  -[AAUICustodianSetupFlowController navigationController](self->_custodianSetupFlowController, "navigationController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[AAUIAccountRecoveryViewController _showViewController:](self, "_showViewController:", v5);

}

- (void)_displayCustodianAddNotAllowedAlert
{
  id v3;

  -[AAUIDTOHelper makeCustodianAddOpNotAllowedAlert](self->_dtoHelper, "makeCustodianAddOpNotAllowedAlert");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[AAUIAccountRecoveryViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v3, 1, 0);

}

- (void)_displayRatchetGenericErrorAlert
{
  id v3;

  -[AAUIDTOHelper makeGenericRatchetFailedAlert](self->_dtoHelper, "makeGenericRatchetFailedAlert");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[AAUIAccountRecoveryViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v3, 1, 0);

}

- (id)_recoveryKeyState
{
  return (id)-[AAAccountRecoveryManagementViewModel recoveryKeyStatusText:](self->_viewModel, "recoveryKeyStatusText:", self->_recoveryKeyStateIsEnabled);
}

- (void)_showRecoveryKey:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  AAUIGrandSlamRemoteUIPresenter *v9;
  AAUIGrandSlamRemoteUIPresenter *remoteUIPresenter;
  uint8_t v11[16];
  uint8_t buf[16];

  v4 = a3;
  _AAUILogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DB4ED000, v5, OS_LOG_TYPE_DEFAULT, "Show recovery key management...", buf, 2u);
  }

  objc_msgSend(MEMORY[0x1E0D002A0], "sharedBag");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "urlAtKey:", *MEMORY[0x1E0D000F0]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[AAUIAccountRecoveryViewController _startSpinnerInSpecifier:](self, "_startSpinnerInSpecifier:", v4);
    objc_msgSend(MEMORY[0x1E0CB39E0], "requestWithURL:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = -[AAUIGrandSlamRemoteUIPresenter initWithAccountManager:presenter:]([AAUIGrandSlamRemoteUIPresenter alloc], "initWithAccountManager:presenter:", self->_accountManager, self);
    remoteUIPresenter = self->_remoteUIPresenter;
    self->_remoteUIPresenter = v9;

    -[AAUIGrandSlamRemoteUIPresenter setDelegate:](self->_remoteUIPresenter, "setDelegate:", self);
    -[AAUIGrandSlamRemoteUIPresenter loadRequest:](self->_remoteUIPresenter, "loadRequest:", v8);
  }
  else
  {
    _AAUILogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_1DB4ED000, v8, OS_LOG_TYPE_DEFAULT, "Unable to load Recovery Key UI. We're missing the URL from the URL bag.", v11, 2u);
    }
  }

}

- (void)_startSpinnerInSpecifier:(id)a3
{
  id v4;
  id v5;
  _QWORD block[4];
  id v7;
  id v8;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__AAUIAccountRecoveryViewController__startSpinnerInSpecifier___block_invoke;
  block[3] = &unk_1EA2DB728;
  objc_copyWeak(&v8, &location);
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __62__AAUIAccountRecoveryViewController__startSpinnerInSpecifier___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  id *WeakRetained;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained[181], "startNavigationSpinner");
  v2 = WeakRetained[181];
  v3 = *(void **)(a1 + 32);
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "startSpinnerInSpecifier:forKey:", v3, v4);

  objc_msgSend(WeakRetained, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setUserInteractionEnabled:", 0);

}

- (void)_showViewController:(id)a3
{
  id v4;

  v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[AAUIAccountRecoveryViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v4, 1, 0);
  else
    -[AAUIAccountRecoveryViewController showViewController:sender:](self, "showViewController:sender:", v4, self);

}

- (id)_appleAccount
{
  void *v2;
  void *v3;

  -[AIDAAccountManager accounts](self->_accountManager, "accounts");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *MEMORY[0x1E0CFCF18]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_idmsAccount
{
  ACAccount *idmsAccount;
  void *v4;
  void *v5;
  void *v6;
  ACAccount *v7;
  ACAccount *v8;

  idmsAccount = self->_idmsAccount;
  if (!idmsAccount)
  {
    objc_msgSend(MEMORY[0x1E0D00100], "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAUIAccountRecoveryViewController _appleAccount](self, "_appleAccount");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "aa_altDSID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "authKitAccountWithAltDSID:", v6);
    v7 = (ACAccount *)objc_claimAutoreleasedReturnValue();
    v8 = self->_idmsAccount;
    self->_idmsAccount = v7;

    idmsAccount = self->_idmsAccount;
  }
  return idmsAccount;
}

- (BOOL)_canHaveCustodian
{
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(MEMORY[0x1E0D00100], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAUIAccountRecoveryViewController _idmsAccount](self, "_idmsAccount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "canHaveCustodianForAccount:", v4);

  return v5;
}

- (BOOL)_canBeCustodian
{
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(MEMORY[0x1E0D00100], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAUIAccountRecoveryViewController _idmsAccount](self, "_idmsAccount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "canBeCustodianForAccount:", v4);

  return v5;
}

- (BOOL)_isEligibleForRecoveryKey
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0D15760];
  -[AAUIAccountRecoveryViewController _appleAccount](self, "_appleAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "aa_personID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = objc_msgSend(v2, "isICDPEnabledForDSID:", v4);

  return (char)v2;
}

- (void)_rkFooterLearnMoreTapped
{
  objc_class *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0(&dword_1DB4ED000, a2, v5, "%@: RK footer Learn More was tapped", v6);

  OUTLINED_FUNCTION_9_0();
}

- (void)_printableSummaryLearnMoreTapped
{
  objc_class *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0(&dword_1DB4ED000, a2, v5, "%@: Printable Summary footer Learn More was tapped", v6);

  OUTLINED_FUNCTION_9_0();
}

- (void)finishingRepair
{
  _QWORD v3[4];
  id v4;
  id location;

  -[AAUIAccountRecoveryViewController _beginObservingNotifications](self, "_beginObservingNotifications");
  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __52__AAUIAccountRecoveryViewController_finishingRepair__block_invoke;
  v3[3] = &unk_1EA2DBC18;
  objc_copyWeak(&v4, &location);
  dispatch_async(MEMORY[0x1E0C80D38], v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __52__AAUIAccountRecoveryViewController_finishingRepair__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_fetchAllCustodianContacts");
    WeakRetained = v2;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idmsAccount, 0);
  objc_storeStrong((id *)&self->_dtoHelper, 0);
  objc_storeStrong((id *)&self->_authenticationController, 0);
  objc_storeStrong((id *)&self->_custodianController, 0);
  objc_storeStrong((id *)&self->_spinnerManager, 0);
  objc_storeStrong((id *)&self->_remoteUIPresenter, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_custodianSetupFlowController, 0);
  objc_storeStrong((id *)&self->_myCustodianshipOwners, 0);
  objc_storeStrong((id *)&self->_repairHelper, 0);
  objc_storeStrong((id *)&self->_myCustodiansRequestId, 0);
  objc_storeStrong((id *)&self->_contactWorkQueue, 0);
  objc_storeStrong((id *)&self->_contactsProvider, 0);
  objc_storeStrong((id *)&self->_accountManager, 0);
}

- (void)initWithAccountManager:highlightRowIdentifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0(&dword_1DB4ED000, v0, v1, "Highlighting row %@", v2);
  OUTLINED_FUNCTION_4();
}

void __70__AAUIAccountRecoveryViewController_showReviewCustodiansModalIfNeeded__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_1DB4ED000, v0, v1, "Custodian Review followup not present.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __70__AAUIAccountRecoveryViewController_showReviewCustodiansModalIfNeeded__block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_1DB4ED000, v0, v1, "Presented Custodian Review sheet", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)reviewCustodianSheetDismissed:withUUIDs:.cold.1()
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_1DB4ED000, v0, OS_LOG_TYPE_ERROR, "View not visible. Not repairing custodians.", v1, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)reviewCustodianSheetDismissed:withUUIDs:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_1DB4ED000, v0, v1, "Starting custodian repair after review sheet is dismissed.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)reviewCustodianSheetDismissed:withUUIDs:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0(&dword_1DB4ED000, v0, v1, "Review sheet dismissed. Should dismiss CFU: %@", v2);
  OUTLINED_FUNCTION_4();
}

void __77__AAUIAccountRecoveryViewController_reviewCustodianSheetDismissed_withUUIDs___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2(&dword_1DB4ED000, v0, v1, "Error occurred while repairing custodians. Error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_generateSpecifiers
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_1DB4ED000, v0, v1, "AAUIAccountRecoveryViewController: Account is not HSA2. NOT adding Printable to specifiers.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_isPrintableSummaryEnabled
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_1DB4ED000, v0, v1, "_isPrintableSummaryEnabled: Printable Summary is disabled.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_printAccountAccessSummary:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_1DB4ED000, v0, v1, "Validating local passcode before showing launching printable summary flow.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __64__AAUIAccountRecoveryViewController__printAccountAccessSummary___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0(&dword_1DB4ED000, v0, v1, "Validated local passcode. Error: %@", v2);
  OUTLINED_FUNCTION_4();
}

void __63__AAUIAccountRecoveryViewController__fetchAllCustodianContacts__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2(&dword_1DB4ED000, v0, v1, "Error determining recovery key state: %@ (fetch all)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __60__AAUIAccountRecoveryViewController__fetchRecoveryKeyUpdate__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2(&dword_1DB4ED000, v0, v1, "Error determining recovery key state: %@ (fetch recovery key)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __79__AAUIAccountRecoveryViewController__syncAccountRecoveryFactorsWithCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2(&dword_1DB4ED000, v0, v1, "Failed to perform trusted contacts data sync: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __79__AAUIAccountRecoveryViewController__syncAccountRecoveryFactorsWithCompletion___block_invoke_82_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2(&dword_1DB4ED000, v0, v1, "Failed to perform liveness check-in: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __54__AAUIAccountRecoveryViewController__showAddCustodian__block_invoke_133_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[8];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1_1();
  v3 = 2112;
  v4 = v0;
  _os_log_debug_impl(&dword_1DB4ED000, v1, OS_LOG_TYPE_DEBUG, "Ratchet auth returned with success: %d, error: %@,", v2, 0x12u);
  OUTLINED_FUNCTION_4();
}

@end
