@implementation AAUIAccountBeneficiaryViewController

- (AAUIAccountBeneficiaryViewController)init
{
  AAUIAccountBeneficiaryViewController *v2;
  uint64_t v3;
  AAUIContactsProvider *contactsProvider;
  NSObject *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *contactWorkQueue;
  NSArray *myBeneficiaries;
  NSArray *v9;
  NSArray *myBenefactors;
  uint64_t v11;
  AAAccountBeneficiaryManagementViewModel *viewModel;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)AAUIAccountBeneficiaryViewController;
  v2 = -[AAUIAccountBeneficiaryViewController init](&v14, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    contactsProvider = v2->_contactsProvider;
    v2->_contactsProvider = (AAUIContactsProvider *)v3;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = dispatch_queue_create("com.apple.appleaccountsettings.fetchbeneficiaries", v5);
    contactWorkQueue = v2->_contactWorkQueue;
    v2->_contactWorkQueue = (OS_dispatch_queue *)v6;

    myBeneficiaries = v2->_myBeneficiaries;
    v9 = (NSArray *)MEMORY[0x1E0C9AA60];
    v2->_myBeneficiaries = (NSArray *)MEMORY[0x1E0C9AA60];

    myBenefactors = v2->_myBenefactors;
    v2->_myBenefactors = v9;

    v11 = objc_opt_new();
    viewModel = v2->_viewModel;
    v2->_viewModel = (AAAccountBeneficiaryManagementViewModel *)v11;

  }
  return v2;
}

- (AAUIAccountBeneficiaryViewController)initWithAccountManager:(id)a3
{
  id v5;
  AAUIAccountBeneficiaryViewController *v6;
  AAUIAccountBeneficiaryViewController *v7;

  v5 = a3;
  v6 = -[AAUIAccountBeneficiaryViewController init](self, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_accountManager, a3);

  return v7;
}

- (AAUIAccountBeneficiaryViewController)initWithAccountManager:(id)a3 highlightRowIdentifier:(id)a4
{
  id v7;
  id v8;
  AAUIAccountBeneficiaryViewController *v9;
  NSObject *v10;

  v7 = a3;
  v8 = a4;
  v9 = -[AAUIAccountBeneficiaryViewController init](self, "init");
  if (v9)
  {
    _AAUILogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[AAUIAccountBeneficiaryViewController initWithAccountManager:highlightRowIdentifier:].cold.1((uint64_t)v8, v10);

    objc_storeStrong((id *)((char *)&v9->super.super.super.super.super.isa + (int)*MEMORY[0x1E0D80580]), a4);
    objc_storeStrong((id *)&v9->_accountManager, a3);
  }

  return v9;
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
  -[AAUIAccountBeneficiaryViewController _stopObservingTrustedContactChangeNotification](self, "_stopObservingTrustedContactChangeNotification");
  v6.receiver = self;
  v6.super_class = (Class)AAUIAccountBeneficiaryViewController;
  -[AAUIAccountBeneficiaryViewController dealloc](&v6, sel_dealloc);
}

- (void)viewDidLoad
{
  void *v3;
  AIDAAccountManager *v4;
  AIDAAccountManager *accountManager;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AAUIAccountBeneficiaryViewController;
  -[AAUIAccountBeneficiaryViewController viewDidLoad](&v8, sel_viewDidLoad);
  if (!self->_accountManager)
  {
    -[AAUIAccountBeneficiaryViewController specifier](self, "specifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("icloudAccountManager"));
    v4 = (AIDAAccountManager *)objc_claimAutoreleasedReturnValue();
    accountManager = self->_accountManager;
    self->_accountManager = v4;

  }
  -[AAAccountBeneficiaryManagementViewModel title](self->_viewModel, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAUIAccountBeneficiaryViewController navigationItem](self, "navigationItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTitle:", v6);

  -[AAUIAccountBeneficiaryViewController _fetchAllBeneficiaryContacts](self, "_fetchAllBeneficiaryContacts");
  -[AAUIAccountBeneficiaryViewController _beginObservingTrustedContactChangeNotification](self, "_beginObservingTrustedContactChangeNotification");
  -[AAUIAccountBeneficiaryViewController _syncTrustedContactsFromCloudKit](self, "_syncTrustedContactsFromCloudKit");
}

- (void)_beginObservingTrustedContactChangeNotification
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:suspensionBehavior:", self, sel__fetchAllBeneficiaryContacts, *MEMORY[0x1E0CFAB58], 0, 4);

}

- (void)_stopObservingTrustedContactChangeNotification
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0CFAB58], 0);

}

- (id)specifiers
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  int v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = (int)*MEMORY[0x1E0D80590];
  if (!*(Class *)((char *)&self->super.super.super.super.super.isa + v3))
  {
    _AAUILogSystem();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v19) = 0;
      _os_log_impl(&dword_1DB4ED000, v4, OS_LOG_TYPE_DEFAULT, "Loading Account Beneficiary specifiers.", (uint8_t *)&v19, 2u);
    }

    v5 = (void *)objc_opt_new();
    if (-[AAUIAccountBeneficiaryViewController _canHaveBeneficiary](self, "_canHaveBeneficiary"))
    {
      _AAUILogSystem();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v19) = 0;
        _os_log_impl(&dword_1DB4ED000, v6, OS_LOG_TYPE_DEFAULT, "Account can have beneficiary, adding beneficiary specifiers to UI...", (uint8_t *)&v19, 2u);
      }

      -[AAUIAccountBeneficiaryViewController _myBeneficiariesGroupSpecifier](self, "_myBeneficiariesGroupSpecifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v7);

      -[AAUIAccountBeneficiaryViewController _myBeneficiariesSpecifiers](self, "_myBeneficiariesSpecifiers");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObjectsFromArray:", v8);

      -[AAUIAccountBeneficiaryViewController _addBeneficiarySpecifier](self, "_addBeneficiarySpecifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v9);

    }
    if (-[AAUIAccountBeneficiaryViewController _canBeBeneficiary](self, "_canBeBeneficiary"))
    {
      _AAUILogSystem();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v19) = 0;
        _os_log_impl(&dword_1DB4ED000, v10, OS_LOG_TYPE_DEFAULT, "Account can have benefactors, adding benefactor specifiers to UI...", (uint8_t *)&v19, 2u);
      }

      if (-[NSArray count](self->_myBenefactors, "count"))
      {
        -[AAUIAccountBeneficiaryViewController _myBenefactorsGroupSpecifier](self, "_myBenefactorsGroupSpecifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v11);

        -[AAUIAccountBeneficiaryViewController _myBenefactorsSpecifiers](self, "_myBenefactorsSpecifiers");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObjectsFromArray:", v12);

      }
    }
    if (!-[NSArray count](self->_myBenefactors, "count")
      && !-[AAUIAccountBeneficiaryViewController _canHaveBeneficiary](self, "_canHaveBeneficiary"))
    {
      _AAUILogSystem();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v19) = 0;
        _os_log_impl(&dword_1DB4ED000, v13, OS_LOG_TYPE_DEFAULT, "Account can't have beneficiary and does not have any benefactors, adding no benefactor specifier to UI...", (uint8_t *)&v19, 2u);
      }

      -[AAUIAccountBeneficiaryViewController _noBenefactorSpecifier](self, "_noBenefactorSpecifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v14);

    }
    v15 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = (Class)v5;

  }
  _AAUILogSystem();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa + v3);
    v19 = 138412290;
    v20 = v17;
    _os_log_impl(&dword_1DB4ED000, v16, OS_LOG_TYPE_DEFAULT, "AAUIAccountBeneficiaryViewController specifiers: returning %@", (uint8_t *)&v19, 0xCu);
  }

  return *(id *)((char *)&self->super.super.super.super.super.isa + v3);
}

- (void)_syncTrustedContactsFromCloudKit
{
  id v2;

  v2 = objc_alloc_init(MEMORY[0x1E0CFAC10]);
  objc_msgSend(v2, "pullTrustedContactsFromCloudKitWithCompletion:", &__block_literal_global_9);

}

void __72__AAUIAccountBeneficiaryViewController__syncTrustedContactsFromCloudKit__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  _AAUILogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_impl(&dword_1DB4ED000, v3, OS_LOG_TYPE_DEFAULT, "Completed sync of trusted contacts from CloudKit with error: %@", (uint8_t *)&v4, 0xCu);
  }

}

- (void)_fetchAllBeneficiaryContacts
{
  AAUIContactsProvider *contactsProvider;
  uint64_t v4;
  AAUIContactsProvider *v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;
  id location;

  objc_initWeak(&location, self);
  contactsProvider = self->_contactsProvider;
  v4 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __68__AAUIAccountBeneficiaryViewController__fetchAllBeneficiaryContacts__block_invoke;
  v8[3] = &unk_1EA2DC158;
  objc_copyWeak(&v9, &location);
  -[AAContactsProvider fetchMyBeneficiaries:](contactsProvider, "fetchMyBeneficiaries:", v8);
  v5 = self->_contactsProvider;
  v6[0] = v4;
  v6[1] = 3221225472;
  v6[2] = __68__AAUIAccountBeneficiaryViewController__fetchAllBeneficiaryContacts__block_invoke_3;
  v6[3] = &unk_1EA2DC158;
  objc_copyWeak(&v7, &location);
  -[AAContactsProvider fetchMyBenefactors:](v5, "fetchMyBenefactors:", v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __68__AAUIAccountBeneficiaryViewController__fetchAllBeneficiaryContacts__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *WeakRetained;
  void *v5;
  id v6;
  _QWORD block[5];

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = (void *)WeakRetained[175];
  WeakRetained[175] = v3;
  v6 = v3;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__AAUIAccountBeneficiaryViewController__fetchAllBeneficiaryContacts__block_invoke_2;
  block[3] = &unk_1EA2DB208;
  block[4] = WeakRetained;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __68__AAUIAccountBeneficiaryViewController__fetchAllBeneficiaryContacts__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reloadSpecifiers");
}

void __68__AAUIAccountBeneficiaryViewController__fetchAllBeneficiaryContacts__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *WeakRetained;
  void *v5;
  id v6;
  _QWORD block[5];

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = (void *)WeakRetained[176];
  WeakRetained[176] = v3;
  v6 = v3;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__AAUIAccountBeneficiaryViewController__fetchAllBeneficiaryContacts__block_invoke_4;
  block[3] = &unk_1EA2DB208;
  block[4] = WeakRetained;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __68__AAUIAccountBeneficiaryViewController__fetchAllBeneficiaryContacts__block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reloadSpecifiers");
}

- (id)_myBeneficiariesGroupSpecifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)objc_opt_new();
  -[AAAccountBeneficiaryManagementViewModel myBeneficiariesGroupTitle](self->_viewModel, "myBeneficiariesGroupTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uppercaseString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAAccountBeneficiaryManagementViewModel myBeneficiariesGroupTitle](self->_viewModel, "myBeneficiariesGroupTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAAccountBeneficiaryManagementViewModel myBeneficiariesGroupFooter](self->_viewModel, "myBeneficiariesGroupFooter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAAccountBeneficiaryManagementViewModel learnMore](self->_viewModel, "learnMore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "createGroupSpecifierWithIdentifier:title:footerText:linkText:actionMethodName:target:", v5, v6, v7, v8, CFSTR("_learnMoreWasTapped"), self);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_noBenefactorSpecifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_opt_new();
  -[AAAccountBeneficiaryManagementViewModel noBenefactorFooter](self->_viewModel, "noBenefactorFooter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAAccountBeneficiaryManagementViewModel learnMore](self->_viewModel, "learnMore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "createGroupSpecifierWithIdentifier:title:footerText:linkText:actionMethodName:target:", CFSTR("noBenefactor"), 0, v4, v5, CFSTR("_learnMoreWasTapped"), self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_myBeneficiariesSpecifiers
{
  void *v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = self->_myBeneficiaries;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        +[AAUITrustedContactListCell specifierForContact:loadAction:target:](AAUITrustedContactListCell, "specifierForContact:loadAction:target:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i), sel__myBeneficiaryWasTapped_, self, (_QWORD)v11);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9);

      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)_addBeneficiarySpecifier
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_opt_new();
  -[AAAccountBeneficiaryManagementViewModel myBeneficiariesAdd](self->_viewModel, "myBeneficiariesAdd");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "createAddTableCellWithTitle:loadAction:target:", v4, sel__showAddBeneficiary, self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_myBenefactorsGroupSpecifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0D804E8];
  -[AAAccountBeneficiaryManagementViewModel beneficiaryForGroupTitle](self->_viewModel, "beneficiaryForGroupTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uppercaseString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAAccountBeneficiaryManagementViewModel beneficiaryForGroupTitle](self->_viewModel, "beneficiaryForGroupTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "groupSpecifierWithID:name:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_myBenefactorsSpecifiers
{
  void *v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = self->_myBenefactors;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v9, "trustedContactStatus", (_QWORD)v12) == 2)
        {
          +[AAUITrustedContactListCell specifierForContact:loadAction:target:](AAUITrustedContactListCell, "specifierForContact:loadAction:target:", v9, sel__myBenefactorWasTapped_, self);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v10);

        }
      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  return v3;
}

- (void)_myBeneficiaryWasTapped:(id)a3
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
  v5 = off_1EA2D9D10;
  if (v4 != 1)
    v5 = off_1EA2D9D00;
  v6 = (void *)objc_msgSend(objc_alloc(*v5), "initWithAccountManager:localContact:", self->_accountManager, v10);
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "viewModelForFlow:withContact:", 2, v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[AAUITrustedContactDetailsViewController initWithContact:viewModel:actionHandler:]([AAUITrustedContactDetailsViewController alloc], "initWithContact:viewModel:actionHandler:", v10, v8, v6);
  -[AAUIAccountBeneficiaryViewController _showViewController:](self, "_showViewController:", v9);

}

- (void)_learnMoreWasTapped
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  _AAUILogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[AAAccountBeneficiaryManagementViewModel learnMoreURL](self->_viewModel, "learnMoreURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v4;
    _os_log_impl(&dword_1DB4ED000, v3, OS_LOG_TYPE_DEFAULT, "Learn more was tapped, URL is: %@", (uint8_t *)&v7, 0xCu);

  }
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAAccountBeneficiaryManagementViewModel learnMoreURL](self->_viewModel, "learnMoreURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "openURL:withCompletionHandler:", v6, 0);

}

- (void)_myBenefactorWasTapped:(id)a3
{
  AAUIMyBenefactorActionHandler *v4;
  void *v5;
  void *v6;
  AAUITrustedContactDetailsViewController *v7;
  id v8;

  objc_msgSend(a3, "userInfo");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v4 = -[AAUIMyBenefactorActionHandler initWithAccountManager:localContact:]([AAUIMyBenefactorActionHandler alloc], "initWithAccountManager:localContact:", self->_accountManager, v8);
  v5 = (void *)objc_opt_new();
  objc_msgSend(v5, "viewModelForFlow:withContact:", 3, v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[AAUITrustedContactDetailsViewController initWithContact:viewModel:actionHandler:]([AAUITrustedContactDetailsViewController alloc], "initWithContact:viewModel:actionHandler:", v8, v6, v4);
  -[AAUIAccountBeneficiaryViewController _showViewController:](self, "_showViewController:", v7);

}

- (void)_showAddBeneficiary
{
  NSObject *v3;
  void *v4;
  void *v5;
  AAUIInheritanceSetupFlowController *v6;
  AAUIInheritanceSetupFlowController *inheritanceSetupFlowController;
  void *v8;
  uint8_t v9[16];

  _AAUILogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_1DB4ED000, v3, OS_LOG_TYPE_DEFAULT, "Initiating Inheritance Beneficiary setup flow...", v9, 2u);
  }

  -[AIDAAccountManager accounts](self->_accountManager, "accounts");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CFCF18]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = -[AAUIInheritanceSetupFlowController initWithAccount:]([AAUIInheritanceSetupFlowController alloc], "initWithAccount:", v5);
    inheritanceSetupFlowController = self->_inheritanceSetupFlowController;
    self->_inheritanceSetupFlowController = v6;

    -[AAUIInheritanceSetupFlowController start](self->_inheritanceSetupFlowController, "start");
    -[AAUIInheritanceSetupFlowController navigationController](self->_inheritanceSetupFlowController, "navigationController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAUIAccountBeneficiaryViewController _showViewController:](self, "_showViewController:", v8);

  }
}

- (void)_showViewController:(id)a3
{
  id v4;

  v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[AAUIAccountBeneficiaryViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v4, 1, 0);
  else
    -[AAUIAccountBeneficiaryViewController showViewController:sender:](self, "showViewController:sender:", v4, self);

}

- (id)_idmsAccount
{
  ACAccount *idmsAccount;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  ACAccount *v8;
  ACAccount *v9;

  idmsAccount = self->_idmsAccount;
  if (!idmsAccount)
  {
    -[AIDAAccountManager accounts](self->_accountManager, "accounts");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CFCF18]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D00100], "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "aa_altDSID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "authKitAccountWithAltDSID:", v7);
    v8 = (ACAccount *)objc_claimAutoreleasedReturnValue();
    v9 = self->_idmsAccount;
    self->_idmsAccount = v8;

    idmsAccount = self->_idmsAccount;
  }
  return idmsAccount;
}

- (BOOL)_canHaveBeneficiary
{
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(MEMORY[0x1E0D00100], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAUIAccountBeneficiaryViewController _idmsAccount](self, "_idmsAccount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "canHaveBeneficiaryForAccount:", v4);

  return v5;
}

- (BOOL)_canBeBeneficiary
{
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(MEMORY[0x1E0D00100], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAUIAccountBeneficiaryViewController _idmsAccount](self, "_idmsAccount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "canBeBeneficiaryForAccount:", v4);

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idmsAccount, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_inheritanceSetupFlowController, 0);
  objc_storeStrong((id *)&self->_myBenefactors, 0);
  objc_storeStrong((id *)&self->_myBeneficiaries, 0);
  objc_storeStrong((id *)&self->_contactWorkQueue, 0);
  objc_storeStrong((id *)&self->_contactsProvider, 0);
  objc_storeStrong((id *)&self->_accountManager, 0);
}

- (void)initWithAccountManager:(uint64_t)a1 highlightRowIdentifier:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_1DB4ED000, a2, OS_LOG_TYPE_DEBUG, "Highlighting row %@", (uint8_t *)&v2, 0xCu);
}

@end
