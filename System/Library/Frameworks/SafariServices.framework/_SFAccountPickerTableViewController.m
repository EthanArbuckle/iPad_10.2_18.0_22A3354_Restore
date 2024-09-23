@implementation _SFAccountPickerTableViewController

- (_SFAccountPickerTableViewController)initWithConfiguration:(id)a3
{
  id v5;
  _SFAccountTableConfiguration *v6;
  void *v7;
  _SFAccountPickerTableViewController *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  UIBarButtonItem *addNavigationBarItem;
  WBSAuthenticationServicesAgentProxy *v14;
  WBSAuthenticationServicesAgentProxy *authenticationServicesAgentProxy;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  SFAppAutoFillOneTimeCodeProvider *v24;
  SFAppAutoFillOneTimeCodeProvider *verificationCodeProvider;
  _SFAccountPickerTableViewController *v26;
  objc_super v28;

  v5 = a3;
  v6 = objc_alloc_init(_SFAccountTableConfiguration);
  -[_SFAccountTableConfiguration setShouldShowSearchBar:](v6, "setShouldShowSearchBar:", 1);
  -[_SFAccountTableConfiguration setSupportsDelete:](v6, "setSupportsDelete:", 1);
  -[_SFAccountTableConfiguration setShouldConfigureMultipleSelectionDuringEditing:](v6, "setShouldConfigureMultipleSelectionDuringEditing:", 0);
  -[_SFAccountTableConfiguration setSupportsShare:](v6, "setSupportsShare:", 0);
  -[_SFAccountTableConfiguration setIsForFillingIndividualAccountFields:](v6, "setIsForFillingIndividualAccountFields:", objc_msgSend(v5, "isForFillingIndividualAccountFields"));
  objc_msgSend(MEMORY[0x1E0D4EF88], "sharedSiteMetadataManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v28.receiver = self;
  v28.super_class = (Class)_SFAccountPickerTableViewController;
  v8 = -[_SFAccountTableViewController initWithSiteMetadataManager:configuration:](&v28, sel_initWithSiteMetadataManager_configuration_, v7, v6);

  if (v8)
  {
    objc_storeStrong((id *)&v8->_configuration, a3);
    -[_SFAccountPickerTableViewController navigationItem](v8, "navigationItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    _WBSLocalizedString();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setBackButtonTitle:", v10);

    -[SFAccountPickerConfiguration prompt](v8->_configuration, "prompt");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setPrompt:", v11);

    if (-[SFAccountPickerConfiguration shouldAllowAddingNewPasswords](v8->_configuration, "shouldAllowAddingNewPasswords"))
    {
      v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 4, v8, sel__addNavigationBarItemTapped_);
      addNavigationBarItem = v8->_addNavigationBarItem;
      v8->_addNavigationBarItem = (UIBarButtonItem *)v12;

      -[UIBarButtonItem setAccessibilityIdentifier:](v8->_addNavigationBarItem, "setAccessibilityIdentifier:", CFSTR("Passwords List Navigation Bar Add Button"));
      objc_msgSend(v9, "setRightBarButtonItem:", v8->_addNavigationBarItem);
    }
    v14 = (WBSAuthenticationServicesAgentProxy *)objc_alloc_init(MEMORY[0x1E0D8A778]);
    authenticationServicesAgentProxy = v8->_authenticationServicesAgentProxy;
    v8->_authenticationServicesAgentProxy = v14;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObserver:selector:name:object:", v8, sel_newAutoFillablePasskeysAvailable_, *MEMORY[0x1E0D8B498], 0);

    -[_SFAccountPickerTableViewController tableView](v8, "tableView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setAccessibilityIdentifier:", CFSTR("AutoFillPasswordTable"));

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = *MEMORY[0x1E0D8B490];
    objc_msgSend(MEMORY[0x1E0D8AC08], "sharedStore");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObserver:selector:name:object:", v8, sel__accountStoreDidChange, v19, v20);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = *MEMORY[0x1E0D8B0B0];
    objc_msgSend(MEMORY[0x1E0D8A970], "sharedStore");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addObserver:selector:name:object:", v8, sel__generatedPasswordsStoreDidChange, v22, v23);

    if (-[SFAccountPickerConfiguration shouldShowReceivedVerificationCodes](v8->_configuration, "shouldShowReceivedVerificationCodes"))
    {
      v24 = (SFAppAutoFillOneTimeCodeProvider *)objc_alloc_init(MEMORY[0x1E0D8A018]);
      verificationCodeProvider = v8->_verificationCodeProvider;
      v8->_verificationCodeProvider = v24;

      -[SFAppAutoFillOneTimeCodeProvider addObserver:](v8->_verificationCodeProvider, "addObserver:", v8);
      -[_SFAccountPickerTableViewController _reloadVerificationCodesIfNeeded](v8, "_reloadVerificationCodesIfNeeded");
    }
    v26 = v8;

  }
  return v8;
}

- (void)dealloc
{
  void *v3;
  uint64_t v4;
  void *v5;
  objc_super v6;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0D8B490];
  objc_msgSend(MEMORY[0x1E0D8AC08], "sharedStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, v4, v5);

  v6.receiver = self;
  v6.super_class = (Class)_SFAccountPickerTableViewController;
  -[_SFAccountTableViewController dealloc](&v6, sel_dealloc);
}

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_SFAccountPickerTableViewController;
  -[_SFAccountTableViewController viewDidLoad](&v4, sel_viewDidLoad);
  -[_SFAccountPickerTableViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setKeyboardDismissMode:", 1);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  NSIndexPath *indexPathOfRowShowingDetailView;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_SFAccountPickerTableViewController;
  -[_SFAccountTableViewController viewWillAppear:](&v8, sel_viewWillAppear_, a3);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 1, self, sel__cancel);
  -[_SFAccountPickerTableViewController navigationItem](self, "navigationItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLeftBarButtonItem:", v4);

  -[_SFAccountPickerTableViewController _updateNavigationItemTitleAndPrompt](self, "_updateNavigationItemTitleAndPrompt");
  if (self->_indexPathOfRowShowingDetailView)
  {
    -[_SFAccountPickerTableViewController tableView](self, "tableView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "deselectRowAtIndexPath:animated:", self->_indexPathOfRowShowingDetailView, 1);

    indexPathOfRowShowingDetailView = self->_indexPathOfRowShowingDetailView;
    self->_indexPathOfRowShowingDetailView = 0;

  }
  else
  {
    -[_SFAccountPickerTableViewController reloadTable](self, "reloadTable");
  }
}

- (void)reloadTable
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __50___SFAccountPickerTableViewController_reloadTable__block_invoke;
  v2[3] = &unk_1E4ABFE00;
  v2[4] = self;
  -[_SFAccountPickerTableViewController _reloadSavedAccountsWithCompletionHandler:](self, "_reloadSavedAccountsWithCompletionHandler:", v2);
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)_SFAccountPickerTableViewController;
  -[_SFAccountTableViewController viewWillDisappear:](&v6, sel_viewWillDisappear_);
  -[_SFAccountPickerTableViewController navigationController](self, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNavigationBarHidden:animated:", 0, v3);

}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  NSMutableArray *savedAccounts;
  NSMutableArray *matchingSavedAccounts;
  NSArray *autoFillPasskeys;
  NSMutableArray *savedAccountWithUsablePasskeys;
  WBSPasskeyAutoFillFromNearbyDeviceOptions *passkeyNearbyDeviceOptions;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_SFAccountPickerTableViewController;
  -[_SFAccountTableViewController viewDidDisappear:](&v10, sel_viewDidDisappear_, a3);
  if (!self->_indexPathOfRowShowingDetailView)
  {
    objc_msgSend(MEMORY[0x1E0D8AC08], "sharedStore");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "reset");

    savedAccounts = self->_savedAccounts;
    self->_savedAccounts = 0;

    matchingSavedAccounts = self->_matchingSavedAccounts;
    self->_matchingSavedAccounts = 0;

    autoFillPasskeys = self->_autoFillPasskeys;
    self->_autoFillPasskeys = 0;

    savedAccountWithUsablePasskeys = self->_savedAccountWithUsablePasskeys;
    self->_savedAccountWithUsablePasskeys = 0;

    passkeyNearbyDeviceOptions = self->_passkeyNearbyDeviceOptions;
    self->_passkeyNearbyDeviceOptions = 0;

  }
}

- (void)newAutoFillablePasskeysAvailable:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72___SFAccountPickerTableViewController_newAutoFillablePasskeysAvailable___block_invoke;
  block[3] = &unk_1E4ABFE00;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

- (void)_updateNavigationItemTitleAndPrompt
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[_SFAccountPickerTableViewController navigationItem](self, "navigationItem");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (-[NSMutableArray count](self->_savedAccountWithUsablePasskeys, "count") || self->_passkeyNearbyDeviceOptions)
  {
    _WBSLocalizedString();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTitle:", v3);

    -[SFAccountPickerConfiguration promptWhenPasskeysAreAvailable](self->_configuration, "promptWhenPasskeysAreAvailable");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[SFAccountPickerConfiguration title](self->_configuration, "title");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(v8, "setTitle:", v6);
    }
    else
    {
      _WBSLocalizedString();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setTitle:", v7);

    }
    -[SFAccountPickerConfiguration prompt](self->_configuration, "prompt");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v5 = (void *)v4;
  objc_msgSend(v8, "setPrompt:", v4);

}

- (void)_cancel
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "accountPickerTableViewControllerDidCancel:", self);

}

- (void)handleIconDidUpdateForDomain:(id)a3
{
  SFAddSavedAccountViewController *addPasswordViewController;
  id WeakRetained;
  void *v6;
  id v7;

  v7 = a3;
  addPasswordViewController = self->_addPasswordViewController;
  if (addPasswordViewController)
    -[SFAddSavedAccountViewController updatedIconIsAvailableForDomain:](addPasswordViewController, "updatedIconIsAvailableForDomain:", v7);
  WeakRetained = objc_loadWeakRetained((id *)&self->_detailViewController);
  v6 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "updatedIconIsAvailableForDomain:", v7);

}

- (void)_reloadSavedAccountsWithCompletionHandler:(id)a3
{
  void (**v4)(_QWORD);
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSMutableArray *v9;
  NSMutableArray *savedAccounts;
  void *v11;
  _BOOL4 v12;
  WBSAuthenticationServicesAgentProxy *authenticationServicesAgentProxy;
  SFAccountPickerConfiguration *configuration;
  void *v15;
  void *v16;
  _QWORD v17[5];
  void (**v18)(_QWORD);
  _QWORD v19[5];

  v4 = (void (**)(_QWORD))a3;
  objc_msgSend(MEMORY[0x1E0D8AC08], "sharedStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "savedAccounts");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __81___SFAccountPickerTableViewController__reloadSavedAccountsWithCompletionHandler___block_invoke;
  v19[3] = &unk_1E4AC02D8;
  v19[4] = self;
  objc_msgSend(v6, "safari_filterObjectsUsingBlock:", v19);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (NSMutableArray *)objc_msgSend(v8, "mutableCopy");
  savedAccounts = self->_savedAccounts;
  self->_savedAccounts = v9;

  if (-[SFAccountPickerConfiguration shouldShowAutoFillPasskeys](self->_configuration, "shouldShowAutoFillPasskeys"))
  {
    v17[0] = v7;
    v17[1] = 3221225472;
    v17[2] = __81___SFAccountPickerTableViewController__reloadSavedAccountsWithCompletionHandler___block_invoke_2;
    v17[3] = &unk_1E4AC6F10;
    v17[4] = self;
    v18 = v4;
    v11 = (void *)MEMORY[0x1A8598C40](v17);
    v12 = -[SFAccountPickerConfiguration hasAuditToken](self->_configuration, "hasAuditToken");
    authenticationServicesAgentProxy = self->_authenticationServicesAgentProxy;
    if (v12)
    {
      configuration = self->_configuration;
      if (configuration)
        -[SFAccountPickerConfiguration connectedAppAuditToken](configuration, "connectedAppAuditToken");
      WBSApplicationIdentifierFromAuditToken();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[WBSAuthenticationServicesAgentProxy getPasskeysForRunningAssertionWithApplicationIdentifier:withCompletionHandler:](authenticationServicesAgentProxy, "getPasskeysForRunningAssertionWithApplicationIdentifier:withCompletionHandler:", v15, v11);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "bundleIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[WBSAuthenticationServicesAgentProxy getPasskeysForRunningAssertionWithApplicationIdentifier:withCompletionHandler:](authenticationServicesAgentProxy, "getPasskeysForRunningAssertionWithApplicationIdentifier:withCompletionHandler:", v16, v11);

    }
  }
  else
  {
    v4[2](v4);
  }

}

- (void)_accountStoreDidChange
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __61___SFAccountPickerTableViewController__accountStoreDidChange__block_invoke;
  v2[3] = &unk_1E4ABFE00;
  v2[4] = self;
  -[_SFAccountPickerTableViewController _reloadSavedAccountsWithCompletionHandler:](self, "_reloadSavedAccountsWithCompletionHandler:", v2);
}

- (void)_didPickSavedAccountForPassword:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id WeakRetained;
  void *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!-[SFAccountPickerConfiguration isForFillingIndividualAccountFields](self->_configuration, "isForFillingIndividualAccountFields"))
  {
    -[SFAccountPickerConfiguration addPasswordSuggestedDomain](self->_configuration, "addPasswordSuggestedDomain");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "safari_highLevelDomainForPasswordManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "highLevelDomain");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqualToString:", v7);

    if (v8)
    {
      v9 = (void *)MEMORY[0x1E0C92C70];
      objc_msgSend(CFSTR("https://"), "stringByAppendingString:", v5);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "safari_bestURLForUserTypedString");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "safari_HTMLFormProtectionSpaceForURL:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0D8AC08], "sharedStore");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFAccountPickerConfiguration savedAccountContext](self->_configuration, "savedAccountContext");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setSavedAccountAsDefault:forProtectionSpace:context:", v4, v12, v14);

    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v17[0] = v4;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "accountPickerTableViewController:didPickSavedAccounts:", self, v16);

    }
  }

}

- (void)_didPickSavedAccountForPasswordButPresentAlertToAddAdditionalSiteIfApplicable:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  _QWORD v47[5];
  _QWORD v48[4];
  id v49;
  id v50;
  _SFAccountPickerTableViewController *v51;
  _QWORD v52[5];
  id v53;
  _QWORD v54[3];

  v54[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SFAccountPickerConfiguration addPasswordSuggestedDomain](self->_configuration, "addPasswordSuggestedDomain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "highLevelDomain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v54[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v54, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "additionalSites");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "safari_mapObjectsUsingBlock:", &__block_literal_global_78);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "arrayByAddingObjectsFromArray:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "length"))
  {
    objc_msgSend(v5, "safari_highLevelDomainForPasswordManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("apple.com"));

  }
  else
  {
    v12 = 0;
  }
  if (objc_msgSend(v5, "length")
    && (objc_msgSend(v5, "safari_highLevelDomainForPasswordManager"),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        v14 = objc_msgSend(v10, "containsObject:", v13) | v12,
        v13,
        v14 != 1))
  {
    -[SFAccountPickerConfiguration appID](self->_configuration, "appID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = v15;
    if (v15)
    {
      v16 = v15;
      if (-[SFAccountPickerConfiguration isConnectedAppAWebBrowser](self->_configuration, "isConnectedAppAWebBrowser"))
      {
        v15 = 0;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CA5870], "bundleRecordWithApplicationIdentifier:error:", v16, 0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }
    v46 = v10;
    v44 = v15;
    objc_msgSend(v15, "localizedName");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "length");
    v19 = (void *)MEMORY[0x1E0CB3940];
    if (v18)
    {
      _WBSLocalizedString();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "effectiveTitle");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "stringWithFormat:", v20, v21, v17);
      v22 = objc_claimAutoreleasedReturnValue();

      v23 = (void *)MEMORY[0x1E0CB3940];
      _WBSLocalizedString();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "stringWithFormat:", v24, v17);
    }
    else
    {
      _WBSLocalizedString();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "effectiveTitle");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "stringWithFormat:", v25, v26, v5);
      v22 = objc_claimAutoreleasedReturnValue();

      v27 = (void *)MEMORY[0x1E0CB3940];
      _WBSLocalizedString();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "stringWithFormat:", v24, v5);
    }
    v28 = objc_claimAutoreleasedReturnValue();

    v41 = (void *)v28;
    objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v22, v28, 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = (void *)MEMORY[0x1E0DC3448];
    _WBSLocalizedString();
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v52[0] = MEMORY[0x1E0C809B0];
    v52[1] = 3221225472;
    v52[2] = __117___SFAccountPickerTableViewController__didPickSavedAccountForPasswordButPresentAlertToAddAdditionalSiteIfApplicable___block_invoke_2;
    v52[3] = &unk_1E4AC0128;
    v52[4] = self;
    v32 = v4;
    v53 = v32;
    objc_msgSend(v30, "actionWithTitle:style:handler:", v31, 0, v52);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v29, "addAction:", v33);
    objc_msgSend(v29, "setPreferredAction:", v33);
    objc_msgSend(v17, "length");
    v42 = (void *)v22;
    v43 = v17;
    _WBSLocalizedString();
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = (void *)MEMORY[0x1E0DC3448];
    v36 = MEMORY[0x1E0C809B0];
    v48[0] = MEMORY[0x1E0C809B0];
    v48[1] = 3221225472;
    v48[2] = __117___SFAccountPickerTableViewController__didPickSavedAccountForPasswordButPresentAlertToAddAdditionalSiteIfApplicable___block_invoke_3;
    v48[3] = &unk_1E4AC09C8;
    v49 = v5;
    v50 = v32;
    v51 = self;
    objc_msgSend(v35, "actionWithTitle:style:handler:", v34, 0, v48);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "addAction:", v37);
    v38 = (void *)MEMORY[0x1E0DC3448];
    _WBSLocalizedString();
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v47[0] = v36;
    v47[1] = 3221225472;
    v47[2] = __117___SFAccountPickerTableViewController__didPickSavedAccountForPasswordButPresentAlertToAddAdditionalSiteIfApplicable___block_invoke_4;
    v47[3] = &unk_1E4AC0010;
    v47[4] = self;
    objc_msgSend(v38, "actionWithTitle:style:handler:", v39, 1, v47);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "addAction:", v40);

    -[_SFAccountPickerTableViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v29, 1, 0);
    v10 = v46;
  }
  else
  {
    -[_SFAccountPickerTableViewController _didPickSavedAccountForPassword:](self, "_didPickSavedAccountForPassword:", v4);
  }

}

- (void)_presentAddPasswordViewController
{
  SFAddSavedAccountViewController *v3;
  void *v4;
  void *v5;
  SFAddSavedAccountViewController *v6;
  SFAddSavedAccountViewController *addPasswordViewController;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  _BOOL8 v12;
  void *v13;
  uint64_t v14;
  void *v15;
  _SFAccountPickerTableViewController *v16;
  _SFAccountPickerTableViewController *v17;
  id v18;

  -[WBSGeneratedPassword password](self->_generatedPasswordBeingTransformedIntoSavedAccount, "password");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  v3 = [SFAddSavedAccountViewController alloc];
  -[SFAccountPickerConfiguration addPasswordSuggestedDomain](self->_configuration, "addPasswordSuggestedDomain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
  {
    -[SFAccountPickerConfiguration addPasswordSuggestedLabel](self->_configuration, "addPasswordSuggestedLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v6 = -[SFAddSavedAccountViewController initWithSuggestedDomain:password:](v3, "initWithSuggestedDomain:password:", v5, v18);
  addPasswordViewController = self->_addPasswordViewController;
  self->_addPasswordViewController = v6;

  if (!v4)
  -[SFAccountPickerConfiguration bundleIDForFallbackIcon](self->_configuration, "bundleIDForFallbackIcon");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[SFAccountPickerConfiguration bundleIDForFallbackIcon](self->_configuration, "bundleIDForFallbackIcon");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFAddSavedAccountViewController setBundleIDForFallbackIcon:](self->_addPasswordViewController, "setBundleIDForFallbackIcon:", v9);

  }
  -[SFAddSavedAccountViewController setDelegate:](self->_addPasswordViewController, "setDelegate:", self);
  objc_msgSend(MEMORY[0x1E0D8A9E0], "sharedMonitor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "keychainSyncSettingValue");

  if (v11 >= 2)
  {
    if (v11 != 2)
      goto LABEL_12;
    v12 = objc_msgSend(v18, "length") == 0;
  }
  else
  {
    v12 = 0;
  }
  -[SFAddSavedAccountViewController setShouldPopulatePasswordFieldWithNewGeneratedStrongPassword:](self->_addPasswordViewController, "setShouldPopulatePasswordFieldWithNewGeneratedStrongPassword:", v12);
LABEL_12:
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", self->_addPasswordViewController);
  objc_msgSend(v13, "setModalPresentationStyle:", 2);
  +[_SFAccountManagerAppearanceValues preferredFormSheetContentSize](_SFAccountManagerAppearanceValues, "preferredFormSheetContentSize");
  objc_msgSend(v13, "setPreferredContentSize:");
  -[_SFAccountPickerTableViewController presentedViewController](self, "presentedViewController");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  if (v14)
    v16 = (_SFAccountPickerTableViewController *)v14;
  else
    v16 = self;
  v17 = v16;

  -[_SFAccountPickerTableViewController presentViewController:animated:completion:](v17, "presentViewController:animated:completion:", v13, 1, 0);
}

- (void)_fillUsernameForSavedAccount:(id)a3
{
  id WeakRetained;
  id v5;

  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "accountPickerTableViewController:fillUsernameForSavedAccount:", self, v5);

}

- (void)_fillPasswordForSavedAccount:(id)a3
{
  id WeakRetained;
  id v5;

  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "accountPickerTableViewController:fillPasswordForSavedAccount:", self, v5);

}

- (void)_fillVerificationCodeForSavedAccount:(id)a3
{
  id WeakRetained;
  id v5;

  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "accountPickerTableViewController:fillVerificationCodeForSavedAccount:", self, v5);

}

- (void)_reloadVerificationCodesIfNeeded
{
  void *v3;
  uint64_t v4;
  SFAppAutoFillOneTimeCodeProvider *verificationCodeProvider;
  void *v6;
  void *v7;
  void *v8;
  NSArray *v9;
  NSArray *verificationCodes;
  id v11;

  -[SFAccountPickerConfiguration appID](self->_configuration, "appID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (v4)
  {
    verificationCodeProvider = self->_verificationCodeProvider;
    -[SFAccountPickerConfiguration appID](self->_configuration, "appID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFAccountPickerConfiguration websiteURLForReceivedVerificationCodes](self->_configuration, "websiteURLForReceivedVerificationCodes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFAppAutoFillOneTimeCodeProvider currentOneTimeCodesWithAppIdentifier:website:usernameHint:fieldClassification:](verificationCodeProvider, "currentOneTimeCodesWithAppIdentifier:website:usernameHint:fieldClassification:", v6, v7, 0, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "safari_filterObjectsUsingBlock:", &__block_literal_global_119);
    v9 = (NSArray *)objc_claimAutoreleasedReturnValue();
    verificationCodes = self->_verificationCodes;
    self->_verificationCodes = v9;

    if (-[_SFAccountPickerTableViewController isViewLoaded](self, "isViewLoaded"))
    {
      -[_SFAccountPickerTableViewController tableView](self, "tableView");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "reloadData");

    }
  }
}

- (id)_cellConfigurationForVerificationCodeAtIndexPath:(id)a3
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

  -[NSArray objectAtIndexedSubscript:](self->_verificationCodes, "objectAtIndexedSubscript:", objc_msgSend(a3, "row"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC39A8], "cellConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC37E8], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B10]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "secondaryTextProperties");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFont:", v6);

  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "secondaryTextProperties");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setColor:", v8);

  objc_msgSend(v4, "localizedTitleForContext:", 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v10);

  objc_msgSend(v4, "localizedSubtitleForContext:", 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSecondaryText:", v11);

  -[_SFAccountPickerTableViewController _appIconForVerificationCode:](self, "_appIconForVerificationCode:", v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setImage:", v12);

  return v5;
}

- (id)_bundleIdentifierForVerificationCodeSource:(int64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("com.apple.mobilemail");
  if (a3 != 1)
    v3 = 0;
  if (a3)
    return (id)v3;
  else
    return CFSTR("com.apple.MobileSMS");
}

- (id)_appIconForVerificationCode:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;

  -[_SFAccountPickerTableViewController _bundleIdentifierForVerificationCodeSource:](self, "_bundleIdentifierForVerificationCodeSource:", objc_msgSend(a3, "source"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3A820]), "initWithBundleIdentifier:", v3);
    v5 = objc_alloc(MEMORY[0x1E0D3A830]);
    objc_msgSend(MEMORY[0x1E0C92670], "tableViewIconSize");
    v7 = v6;
    v9 = v8;
    _SFScreenScale();
    v11 = (void *)objc_msgSend(v5, "initWithSize:scale:", v7, v9, v10);
    objc_msgSend(v4, "prepareImageForDescriptor:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v12, "placeholder") & 1) != 0)
    {
      v13 = 0;
    }
    else
    {
      v14 = objc_alloc(MEMORY[0x1E0DC3870]);
      v15 = objc_msgSend(v12, "CGImage");
      objc_msgSend(v12, "scale");
      v16 = (void *)objc_msgSend(v14, "initWithCGImage:scale:orientation:", v15, 0);
      v17 = (void *)MEMORY[0x1E0D8A9C8];
      objc_msgSend(MEMORY[0x1E0C92670], "tableViewIconSize");
      objc_msgSend(v17, "resizedImage:withSize:", v16);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)_consumeAndFillVerificationCode:(id)a3
{
  id WeakRetained;
  id v5;

  v5 = a3;
  -[SFAppAutoFillOneTimeCodeProvider consumeOneTimeCode:](self->_verificationCodeProvider, "consumeOneTimeCode:");
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "accountPickerTableViewController:fillVerificationCode:", self, v5);

}

- (void)addSavedAccountViewControllerDidFinish:(id)a3 withSavedAccount:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *addPasswordViewController;
  NSObject *v14;
  WBSGeneratedPassword *generatedPasswordBeingTransformedIntoSavedAccount;
  SFAddSavedAccountViewController *v16;
  _QWORD v17[5];
  id v18;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v7)
  {
    addPasswordViewController = self;
LABEL_11:
    objc_msgSend(addPasswordViewController, "dismissViewControllerAnimated:completion:", 1, 0);
    goto LABEL_12;
  }
  if (self->_didPresentAddAccountViewControllerFromGeneratedPasswords)
  {
    objc_msgSend(v7, "password");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBSGeneratedPassword password](self->_generatedPasswordBeingTransformedIntoSavedAccount, "password");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqualToString:", v10);

    if (v11)
    {
      objc_msgSend(MEMORY[0x1E0D8A970], "sharedStore");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "removeGeneratedPassword:completionHandler:", self->_generatedPasswordBeingTransformedIntoSavedAccount, 0);

    }
    else
    {
      v14 = WBS_LOG_CHANNEL_PREFIXAutoFill();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A3B2D000, v14, OS_LOG_TYPE_DEFAULT, "Newly created saved account has a password that doesn't match the generated password record it was created from. The generated password record was not deleted.", buf, 2u);
      }
    }
    generatedPasswordBeingTransformedIntoSavedAccount = self->_generatedPasswordBeingTransformedIntoSavedAccount;
    self->_generatedPasswordBeingTransformedIntoSavedAccount = 0;

    addPasswordViewController = self->_addPasswordViewController;
    goto LABEL_11;
  }
  if (-[SFAccountPickerConfiguration isForFillingIndividualAccountFields](self->_configuration, "isForFillingIndividualAccountFields"))
  {
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __95___SFAccountPickerTableViewController_addSavedAccountViewControllerDidFinish_withSavedAccount___block_invoke;
    v17[3] = &unk_1E4ABFB20;
    v17[4] = self;
    v18 = v8;
    -[_SFAccountPickerTableViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v17);

  }
  else
  {
    -[_SFAccountPickerTableViewController _didPickSavedAccountForPassword:](self, "_didPickSavedAccountForPassword:", v8);
  }
LABEL_12:
  v16 = self->_addPasswordViewController;
  self->_addPasswordViewController = 0;

}

- (int64_t)_rowTypeForIndexPath:(id)a3
{
  id v4;
  uint64_t v5;
  _BOOL4 v6;
  int64_t v8;
  uint64_t v9;

  v4 = a3;
  v5 = objc_msgSend(v4, "row");
  if (objc_msgSend(v4, "section") == self->_sectionForPasswordsMatchingHintStrings)
  {
    v6 = -[SFAccountPickerConfiguration shouldAllowAddingNewPasswords](self->_configuration, "shouldAllowAddingNewPasswords");
    if (-[SFAccountPickerConfiguration shouldShowGeneratedPasswordsForDomain](self->_configuration, "shouldShowGeneratedPasswordsForDomain"))
    {
      if (self->_hasMatchingGeneratedPasswords && v6)
      {
        if (v5 != -[NSMutableArray count](self->_savedAccountsMatchingHintStrings, "count"))
        {
          if (v5 != -[NSMutableArray count](self->_savedAccountsMatchingHintStrings, "count") + 1)
            goto LABEL_16;
LABEL_15:
          v8 = 1;
          goto LABEL_23;
        }
LABEL_12:
        v8 = 4;
        goto LABEL_23;
      }
      if (self->_hasMatchingGeneratedPasswords
        && v5 == -[NSMutableArray count](self->_savedAccountsMatchingHintStrings, "count"))
      {
        goto LABEL_12;
      }
    }
    if (v6 && v5 == -[NSMutableArray count](self->_savedAccountsMatchingHintStrings, "count"))
      goto LABEL_15;
  }
LABEL_16:
  if (-[SFAccountPickerConfiguration shouldShowAutoFillPasskeys](self->_configuration, "shouldShowAutoFillPasskeys")
    && objc_msgSend(v4, "section") == self->_sectionForPasskeys
    && (v9 = objc_msgSend(v4, "row"), v9 == -[NSMutableArray count](self->_savedAccountWithUsablePasskeys, "count")))
  {
    v8 = 2;
  }
  else if (objc_msgSend(v4, "section") == self->_sectionForVerificationCodes)
  {
    v8 = 3;
  }
  else
  {
    v8 = 0;
  }
LABEL_23:

  return v8;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  uint64_t v4;
  int64_t v5;

  -[_SFAccountPickerTableViewController _updateSections](self, "_updateSections", a3);
  v4 = 1;
  if (self->_sectionForPasskeys != 0x7FFFFFFFFFFFFFFFLL)
    v4 = 2;
  if (self->_sectionForPasswordsMatchingHintStrings == 0x7FFFFFFFFFFFFFFFLL)
    v5 = self->_sectionForPasskeys != 0x7FFFFFFFFFFFFFFFLL;
  else
    v5 = v4;
  if (self->_sectionForAllPasswords != 0x7FFFFFFFFFFFFFFFLL)
    ++v5;
  if (self->_sectionForVerificationCodes == 0x7FFFFFFFFFFFFFFFLL)
    return v5;
  else
    return v5 + 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6;
  uint64_t v7;
  int64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = a3;
  if (self->_sectionForPasskeys == a4)
  {
    v7 = -[NSMutableArray count](self->_savedAccountWithUsablePasskeys, "count");
    if (self->_passkeyNearbyDeviceOptions)
      v8 = v7 + 1;
    else
      v8 = v7;
  }
  else if (self->_sectionForPasswordsMatchingHintStrings == a4)
  {
    v9 = -[NSMutableArray count](self->_savedAccountsMatchingHintStrings, "count");
    v8 = v9
       + -[SFAccountPickerConfiguration shouldAllowAddingNewPasswords](self->_configuration, "shouldAllowAddingNewPasswords");
    if (-[SFAccountPickerConfiguration shouldShowGeneratedPasswordsForDomain](self->_configuration, "shouldShowGeneratedPasswordsForDomain"))
    {
      v8 += self->_hasMatchingGeneratedPasswords;
    }
  }
  else
  {
    if (self->_sectionForAllPasswords == a4)
    {
      v10 = 1080;
    }
    else
    {
      if (self->_sectionForVerificationCodes != a4)
      {
        v8 = 0;
        goto LABEL_14;
      }
      v10 = 1192;
    }
    v8 = objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v10), "count");
  }
LABEL_14:

  return v8;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  if (self->_sectionForPasskeys == a4)
  {
    if (-[NSMutableArray count](self->_savedAccountWithUsablePasskeys, "count"))
    {
LABEL_10:
      _WBSLocalizedString();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    }
LABEL_11:
    v8 = 0;
    goto LABEL_12;
  }
  if (self->_sectionForAllPasswords != a4)
  {
    if (self->_sectionForVerificationCodes == a4
      || -[_SFAccountPickerTableViewController _shouldShowAutoFillPasskeys](self, "_shouldShowAutoFillPasskeys")
      || -[NSMutableArray count](self->_savedAccountsMatchingHintStrings, "count"))
    {
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  if (!-[NSMutableArray count](self->_savedAccountsMatchingHintStrings, "count"))
    goto LABEL_11;
  -[_SFAccountTableViewController searchPattern](self, "searchPattern");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "length");
  _WBSLocalizedString();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_12:
  return v8;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  SFAccountTableViewCell *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _BOOL8 v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  SFAccountTableViewCell *v19;
  void *v20;
  void *v21;
  void *v22;
  BOOL v23;
  int v24;
  int v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  int v34;

  v6 = a3;
  v7 = a4;
  switch(-[_SFAccountPickerTableViewController _rowTypeForIndexPath:](self, "_rowTypeForIndexPath:", v7))
  {
    case 1:
      objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", CFSTR("addPassword"));
      v8 = (SFAccountTableViewCell *)objc_claimAutoreleasedReturnValue();
      if (!v8)
      {
        v8 = (SFAccountTableViewCell *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 0, CFSTR("addPassword"));
        +[_SFAccountManagerAppearanceValues buttonCellTextColor](_SFAccountManagerAppearanceValues, "buttonCellTextColor");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFAccountTableViewCell textLabel](v8, "textLabel");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setTextColor:", v9);

        goto LABEL_13;
      }
      goto LABEL_34;
    case 2:
      objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", CFSTR("useNearbyDevice"));
      v8 = (SFAccountTableViewCell *)objc_claimAutoreleasedReturnValue();
      if (!v8)
      {
        v8 = (SFAccountTableViewCell *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 0, CFSTR("useNearbyDevice"));
        +[_SFAccountManagerAppearanceValues buttonCellTextColor](_SFAccountManagerAppearanceValues, "buttonCellTextColor");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFAccountTableViewCell textLabel](v8, "textLabel");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setTextColor:", v13);

LABEL_13:
        _WBSLocalizedString();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFAccountTableViewCell textLabel](v8, "textLabel");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setText:", v15);
        goto LABEL_18;
      }
      goto LABEL_34;
    case 3:
      objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", CFSTR("verificationCode"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v17;
      if (v17)
        v19 = v17;
      else
        v19 = (SFAccountTableViewCell *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 0, CFSTR("verificationCode"));
      v8 = v19;

      -[_SFAccountPickerTableViewController _cellConfigurationForVerificationCodeAtIndexPath:](self, "_cellConfigurationForVerificationCodeAtIndexPath:", v7);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFAccountTableViewCell setContentConfiguration:](v8, "setContentConfiguration:", v15);
      goto LABEL_33;
    case 4:
      objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", CFSTR("generatedPasswords"));
      v8 = (SFAccountTableViewCell *)objc_claimAutoreleasedReturnValue();
      if (v8)
        goto LABEL_34;
      v8 = (SFAccountTableViewCell *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 0, CFSTR("generatedPasswords"));
      _WBSLocalizedString();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFAccountTableViewCell textLabel](v8, "textLabel");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setText:", v20);

      +[_SFAccountManagerAppearanceValues buttonCellTextColor](_SFAccountManagerAppearanceValues, "buttonCellTextColor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFAccountTableViewCell textLabel](v8, "textLabel");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setTextColor:", v15);
LABEL_18:

LABEL_33:
LABEL_34:

      return v8;
    default:
      objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", CFSTR("savedAccount"));
      v8 = (SFAccountTableViewCell *)objc_claimAutoreleasedReturnValue();
      if (!v8)
        v8 = -[SFAccountTableViewCell initWithStyle:reuseIdentifier:]([SFAccountTableViewCell alloc], "initWithStyle:reuseIdentifier:", 3, CFSTR("savedAccount"));
      if (-[SFAccountPickerConfiguration isForFillingIndividualAccountFields](self->_configuration, "isForFillingIndividualAccountFields"))
      {
        v11 = 1;
      }
      else
      {
        v11 = 4;
      }
      -[SFAccountTableViewCell setAccessoryType:](v8, "setAccessoryType:", v11);
      -[SFAccountTableViewCell setDelegate:](v8, "setDelegate:", self);
      v12 = objc_msgSend(v7, "section") == self->_sectionForPasswordsMatchingHintStrings
         || objc_msgSend(v7, "section") == self->_sectionForPasskeys;
      -[_SFAccountPickerTableViewController _savedAccountForIndexPath:](self, "_savedAccountForIndexPath:", v7);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFAccountTableViewController searchPattern](self, "searchPattern");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFAccountTableViewCell setSavedAccount:searchPattern:emphasizeUserName:shouldDifferentiateWithGroupName:](v8, "setSavedAccount:searchPattern:emphasizeUserName:shouldDifferentiateWithGroupName:", v15, v22, v12, objc_msgSend(v15, "hasSameUsernameAndHighLevelDomainAsOtherSharedSavedAccounts"));

      v23 = objc_msgSend(v7, "section") == self->_sectionForPasskeys || objc_msgSend(v15, "credentialTypes") != 2;
      v24 = -[NSMutableArray containsObject:](self->_savedAccountWithUsablePasskeys, "containsObject:", v15);
      v25 = v24;
      if (v23
        || (v24 & 1) != 0
        || -[SFAccountPickerConfiguration forUserNamesOnly](self->_configuration, "forUserNamesOnly"))
      {
        -[SFAccountTableViewCell setUserInteractionEnabled:](v8, "setUserInteractionEnabled:", 1);
        objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
        v26 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        _WBSLocalizedString();
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFAccountTableViewCell detailTextLabel](v8, "detailTextLabel");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "setText:", v27);

        -[SFAccountTableViewCell setUserInteractionEnabled:](v8, "setUserInteractionEnabled:", 0);
        objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
        v26 = objc_claimAutoreleasedReturnValue();
      }
      v29 = (void *)v26;
      -[SFAccountTableViewCell textLabel](v8, "textLabel");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setTextColor:", v29);

      objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFAccountTableViewCell detailTextLabel](v8, "detailTextLabel");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setTextColor:", v31);

      if (v25)
      {
        objc_msgSend(v15, "passkeyRelyingPartyID");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = objc_msgSend(v33, "isEqualToString:", CFSTR("apple.com"));

        if (v34)
          -[SFAccountTableViewCell setAccessoryType:](v8, "setAccessoryType:", 0);
      }
      goto LABEL_33;
  }
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  _SFTableLinkableFooterView *v5;
  void *v7;
  uint64_t v8;
  void *v9;

  if (self->_sectionForPasswordsMatchingHintStrings == a4
    && -[SFAccountPickerConfiguration shouldAllowAddingNewPasswords](self->_configuration, "shouldAllowAddingNewPasswords", a3)&& !-[SFAccountPickerConfiguration shouldHideCreatePasswordsInSettingsHint](self->_configuration, "shouldHideCreatePasswordsInSettingsHint"))
  {
    v5 = objc_alloc_init(_SFTableLinkableFooterView);
    -[_SFTableLinkableFooterView setDelegate:](v5, "setDelegate:", self);
    _WBSLocalizedString();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(MEMORY[0x1E0D8A8F8], "isPasswordManagerAppEnabledAndInstalled"))
    {
      _WBSLocalizedString();
      v8 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v8;
    }
    _WBSLocalizedString();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SFTableLinkableFooterView setText:linkPlaceholderString:linkReplacementString:](v5, "setText:linkPlaceholderString:linkReplacementString:", v7, CFSTR("%settings-link%"), v9);

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  return *MEMORY[0x1E0DC53D8];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  WBSAuthenticationServicesAgentProxy *authenticationServicesAgentProxy;
  WBSPasskeyAutoFillFromNearbyDeviceOptions *passkeyNearbyDeviceOptions;
  void *v10;
  void *v11;
  void *v12;
  NSArray *autoFillPasskeys;
  void *v14;
  WBSAuthenticationServicesAgentProxy *v15;
  LAContext *authenticatedContext;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, void *);
  void *v25;
  id v26;
  _QWORD v27[5];

  v6 = a3;
  v7 = a4;
  switch(-[_SFAccountPickerTableViewController _rowTypeForIndexPath:](self, "_rowTypeForIndexPath:", v7))
  {
    case 1:
      objc_msgSend(v6, "deselectRowAtIndexPath:animated:", v7, 1);
      self->_didPresentAddAccountViewControllerFromGeneratedPasswords = 0;
      -[_SFAccountPickerTableViewController _presentAddPasswordViewController](self, "_presentAddPasswordViewController");
      goto LABEL_18;
    case 2:
      authenticationServicesAgentProxy = self->_authenticationServicesAgentProxy;
      passkeyNearbyDeviceOptions = self->_passkeyNearbyDeviceOptions;
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __73___SFAccountPickerTableViewController_tableView_didSelectRowAtIndexPath___block_invoke;
      v27[3] = &unk_1E4AC05E0;
      v27[4] = self;
      -[WBSAuthenticationServicesAgentProxy userSelectedAutoFillNearbyDevice:completionHandler:](authenticationServicesAgentProxy, "userSelectedAutoFillNearbyDevice:completionHandler:", passkeyNearbyDeviceOptions, v27);
      goto LABEL_18;
    case 3:
      -[NSArray objectAtIndexedSubscript:](self->_verificationCodes, "objectAtIndexedSubscript:", objc_msgSend(v7, "row"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFAccountPickerTableViewController _consumeAndFillVerificationCode:](self, "_consumeAndFillVerificationCode:", v10);

      goto LABEL_5;
    case 4:
      -[_SFAccountPickerTableViewController _presentGeneratedPasswordsViewController](self, "_presentGeneratedPasswordsViewController");
      -[_SFAccountPickerTableViewController tableView](self, "tableView");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "deselectRowAtIndexPath:animated:", v7, 1);

      goto LABEL_18;
    default:
LABEL_5:
      if (objc_msgSend(v7, "section") == self->_sectionForPasskeys)
      {
        -[_SFAccountPickerTableViewController _savedAccountForIndexPath:](self, "_savedAccountForIndexPath:", v7);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v11;
        if (v11)
        {
          autoFillPasskeys = self->_autoFillPasskeys;
          v22 = MEMORY[0x1E0C809B0];
          v23 = 3221225472;
          v24 = __73___SFAccountPickerTableViewController_tableView_didSelectRowAtIndexPath___block_invoke_182;
          v25 = &unk_1E4AC6F98;
          v26 = v11;
          -[NSArray safari_firstObjectPassingTest:](autoFillPasskeys, "safari_firstObjectPassingTest:", &v22);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = self->_authenticationServicesAgentProxy;
          authenticatedContext = self->_authenticatedContext;
          -[SFAccountPickerConfiguration savedAccountContext](self->_configuration, "savedAccountContext", v22, v23, v24, v25);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[WBSAuthenticationServicesAgentProxy userSelectedAutoFillPasskey:authenticatedLAContext:savedAccountContext:completionHandler:](v15, "userSelectedAutoFillPasskey:authenticatedLAContext:savedAccountContext:completionHandler:", v14, authenticatedContext, v17, &__block_literal_global_184);

          -[_SFAccountPickerTableViewController delegate](self, "delegate");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "accountPickerTableViewControllerDidCancel:", self);

        }
        else
        {
          v20 = WBS_LOG_CHANNEL_PREFIXAutoFill();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            -[_SFAccountPickerTableViewController tableView:didSelectRowAtIndexPath:].cold.1();
        }
      }
      else
      {
        if (-[SFAccountPickerConfiguration isForFillingIndividualAccountFields](self->_configuration, "isForFillingIndividualAccountFields"))
        {
          -[_SFAccountPickerTableViewController _showAccountDetailsForSavedAccountAtIndexPath:](self, "_showAccountDetailsForSavedAccountAtIndexPath:", v7);
          goto LABEL_18;
        }
        -[_SFAccountPickerTableViewController _savedAccountForIndexPath:](self, "_savedAccountForIndexPath:", v7);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          -[_SFAccountPickerTableViewController _didPickSavedAccountForPasswordButPresentAlertToAddAdditionalSiteIfApplicable:](self, "_didPickSavedAccountForPasswordButPresentAlertToAddAdditionalSiteIfApplicable:", v12);
        }
        else
        {
          v21 = WBS_LOG_CHANNEL_PREFIXAutoFill();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
            -[_SFAccountPickerTableViewController tableView:didSelectRowAtIndexPath:].cold.2();
        }
      }

LABEL_18:
      return;
  }
}

- (void)linkableFooterViewDidInteractWithLink:(id)a3
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0D8AAA0], "passwordManagerURLWithDictionary:", 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "openSensitiveURL:withOptions:", v4, 0);

}

- (void)_presentGeneratedPasswordsViewController
{
  void *v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  id v8;

  v3 = (void *)MEMORY[0x1E0D6C050];
  -[_SFAccountPickerTableViewController _generatedPasswordsDomainHintString](self, "_generatedPasswordsDomainHintString");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
    v6 = (const __CFString *)v4;
  else
    v6 = &stru_1E4AC8470;
  objc_msgSend(v3, "makeUIViewControllerWithDelegate:searchTerm:alwaysShowSearchBar:", self, v6, 0);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", v8);
  objc_msgSend(v7, "setModalPresentationStyle:", 2);
  -[_SFAccountPickerTableViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v7, 1, 0);

}

- (void)tableView:(id)a3 accessoryButtonTappedForRowWithIndexPath:(id)a4
{
  id v5;

  v5 = a4;
  if (!-[SFAccountPickerConfiguration isForFillingIndividualAccountFields](self->_configuration, "isForFillingIndividualAccountFields"))-[_SFAccountPickerTableViewController _showAccountDetailsForSavedAccountAtIndexPath:](self, "_showAccountDetailsForSavedAccountAtIndexPath:", v5);

}

- (void)_showAccountDetailsForSavedAccountAtIndexPath:(id)a3
{
  NSIndexPath *v4;
  void *v5;
  void *v6;
  void *v7;
  NSIndexPath *indexPathOfRowShowingDetailView;
  id v9;

  v4 = (NSIndexPath *)a3;
  -[_SFAccountPickerTableViewController _savedAccountForIndexPath:](self, "_savedAccountForIndexPath:", v4);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[_SFAccountPickerTableViewController _detailViewControllerForSavedAccount:](self, "_detailViewControllerForSavedAccount:", v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SFAccountPickerTableViewController tableView](self, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "selectRowAtIndexPath:animated:scrollPosition:", v4, 1, 0);

  -[_SFAccountPickerTableViewController navigationController](self, "navigationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pushViewController:animated:", v5, 1);

  indexPathOfRowShowingDetailView = self->_indexPathOfRowShowingDetailView;
  self->_indexPathOfRowShowingDetailView = v4;

  objc_storeWeak((id *)&self->_detailViewController, v5);
  -[_SFAccountPickerTableViewController reloadTable](self, "reloadTable");

}

- (void)_showAccountDetailsForSavedAccount:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[_SFAccountPickerTableViewController _indexPathForSavedAccount:](self, "_indexPathForSavedAccount:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[_SFAccountPickerTableViewController _showAccountDetailsForSavedAccountAtIndexPath:](self, "_showAccountDetailsForSavedAccountAtIndexPath:", v4);
  }
  else
  {
    -[_SFAccountPickerTableViewController _detailViewControllerForSavedAccount:](self, "_detailViewControllerForSavedAccount:", v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SFAccountPickerTableViewController navigationController](self, "navigationController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "pushViewController:animated:", v5, 1);

    objc_storeWeak((id *)&self->_detailViewController, v5);
  }

}

- (id)_detailViewControllerForSavedAccount:(id)a3
{
  id v4;
  SFAccountDetailViewController *v5;

  v4 = a3;
  v5 = -[SFAccountDetailViewController initWithSavedAccount:passwordWarning:options:]([SFAccountDetailViewController alloc], "initWithSavedAccount:passwordWarning:options:", v4, 0, 0);

  -[SFAccountDetailViewController setDelegate:](v5, "setDelegate:", self);
  -[SFAccountDetailViewController setIsForFillingIndividualAccountFields:](v5, "setIsForFillingIndividualAccountFields:", -[SFAccountPickerConfiguration isForFillingIndividualAccountFields](self->_configuration, "isForFillingIndividualAccountFields"));
  return v5;
}

- (BOOL)tableView:(id)a3 shouldShowMenuForRowAtIndexPath:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_SFAccountPickerTableViewController;
  return -[_SFAccountPickerTableViewController tableView:shouldShowMenuForRowAtIndexPath:](&v5, sel_tableView_shouldShowMenuForRowAtIndexPath_, a3, a4);
}

- (BOOL)tableView:(id)a3 canPerformAction:(SEL)a4 forRowAtIndexPath:(id)a5 withSender:(id)a6
{
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_SFAccountPickerTableViewController;
  return -[_SFAccountPickerTableViewController tableView:canPerformAction:forRowAtIndexPath:withSender:](&v7, sel_tableView_canPerformAction_forRowAtIndexPath_withSender_, a3, a4, a5, a6);
}

- (id)tableView:(id)a3 trailingSwipeActionsConfigurationForRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, uint64_t, uint64_t, void *);
  void *v19;
  _SFAccountPickerTableViewController *v20;
  id v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  if ((unint64_t)(-[_SFAccountPickerTableViewController _rowTypeForIndexPath:](self, "_rowTypeForIndexPath:", v5)- 1) >= 4)
  {
    -[_SFAccountPickerTableViewController _savedAccountForIndexPath:](self, "_savedAccountForIndexPath:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "passkeyRelyingPartyID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("apple.com"));

    if ((v9 & 1) != 0)
    {
      v6 = 0;
    }
    else
    {
      _WBSLocalizedString();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)MEMORY[0x1E0DC36C8];
      v16 = MEMORY[0x1E0C809B0];
      v17 = 3221225472;
      v18 = __100___SFAccountPickerTableViewController_tableView_trailingSwipeActionsConfigurationForRowAtIndexPath___block_invoke;
      v19 = &unk_1E4AC0208;
      v20 = self;
      v21 = v5;
      objc_msgSend(v11, "contextualActionWithStyle:title:handler:", 1, v10, &v16);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)MEMORY[0x1E0DC3D08];
      v22[0] = v12;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1, v16, v17, v18, v19, v20);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "configurationWithActions:", v14);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "setPerformsFirstActionWithFullSwipe:", 0);
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)_presentAlertToConfirmDeletingAccountsAtIndexPath:(id)a3
{
  id v4;
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
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id location;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_SFAccountPickerTableViewController _savedAccountForIndexPath:](self, "_savedAccountForIndexPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0C92668];
  v25[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "configurationForDeletingSavedAccounts:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0DC3450];
  objc_msgSend(v8, "title");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "subtitle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "alertControllerWithTitle:message:preferredStyle:", v10, v11, _SFDeviceAlertStyle());
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setAccessibilityIdentifier:", CFSTR("DeleteCredentialConfirmation"));

  objc_initWeak(&location, self);
  v14 = (void *)MEMORY[0x1E0DC3448];
  objc_msgSend(v8, "buttonTitle");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __89___SFAccountPickerTableViewController__presentAlertToConfirmDeletingAccountsAtIndexPath___block_invoke;
  v21[3] = &unk_1E4AC0888;
  objc_copyWeak(&v23, &location);
  v16 = v4;
  v22 = v16;
  objc_msgSend(v14, "actionWithTitle:style:handler:", v15, 2, v21);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addAction:", v17);

  v18 = (void *)MEMORY[0x1E0DC3448];
  _WBSLocalizedString();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "actionWithTitle:style:handler:", v19, 1, 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addAction:", v20);

  -[_SFAccountPickerTableViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v12, 1, 0);
  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);

}

- (void)_deleteSavedAccountAtIndexPath:(id)a3
{
  id v4;

  -[_SFAccountPickerTableViewController _savedAccountForIndexPath:](self, "_savedAccountForIndexPath:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[_SFAccountPickerTableViewController _removeSavedAccount:modifyingAccountStore:](self, "_removeSavedAccount:modifyingAccountStore:", v4, 1);

}

- (void)_removeSavedAccount:(id)a3 modifyingAccountStore:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  _BOOL4 v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  void *v23;

  v4 = a4;
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[NSMutableArray indexOfObject:](self->_savedAccountsMatchingHintStrings, "indexOfObject:", v6);
  if (v8 == 0x7FFFFFFFFFFFFFFFLL
    || (v9 = v8,
        -[NSMutableArray removeObject:](self->_savedAccountsMatchingHintStrings, "removeObject:", v6),
        self->_sectionForPasswordsMatchingHintStrings == 0x7FFFFFFFFFFFFFFFLL))
  {
    v10 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v11);
    v10 = -[NSMutableArray count](self->_savedAccountsMatchingHintStrings, "count") == 0;

  }
  v12 = -[NSMutableArray indexOfObject:](self->_savedAccountWithUsablePasskeys, "indexOfObject:", v6);
  if (v12 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v13 = v12;
    -[NSMutableArray removeObject:](self->_savedAccountWithUsablePasskeys, "removeObject:", v6);
    if (self->_sectionForPasskeys != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v14);
      if (!-[NSMutableArray count](self->_savedAccountWithUsablePasskeys, "count"))
        v10 = 1;

    }
  }
  v15 = -[NSMutableArray indexOfObject:](self->_matchingSavedAccounts, "indexOfObject:", v6);
  if (v15 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v16 = v15;
    -[NSMutableArray removeObject:](self->_matchingSavedAccounts, "removeObject:", v6);
    if (self->_sectionForAllPasswords != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v17);
      if (!-[NSMutableArray count](self->_matchingSavedAccounts, "count"))
        v10 = 1;

    }
  }
  if (!v4
    || (objc_msgSend(MEMORY[0x1E0D8AC08], "sharedStore"),
        v18 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v18, "_moveCredentialTypesToRecentlyDeleted:fromSavedAccount:", 3, v6),
        v19 = (void *)objc_claimAutoreleasedReturnValue(),
        v19,
        v18,
        v19))
  {
    if (v10)
    {
      -[_SFAccountPickerTableViewController tableView](self, "tableView");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "reloadData");
    }
    else
    {
      if (!objc_msgSend(v7, "count"))
      {
LABEL_22:
        -[NSMutableArray removeObject:](self->_savedAccounts, "removeObject:", v6);
        v21 = objc_alloc_init(MEMORY[0x1E0DCCBB0]);
        objc_msgSend(v21, "schedulePasswordIconsCleanup");

        goto LABEL_23;
      }
      -[_SFAccountPickerTableViewController tableView](self, "tableView");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "deleteRowsAtIndexPaths:withRowAnimation:", v7, 100);
    }

    goto LABEL_22;
  }
  v22 = WBS_LOG_CHANNEL_PREFIXPasswords();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    -[_SFAccountPickerTableViewController _removeSavedAccount:modifyingAccountStore:].cold.1();
  _WBSLocalizedString();
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SFAccountPickerTableViewController _presentErrorAlertWithString:](self, "_presentErrorAlertWithString:", v23);

LABEL_23:
}

- (void)_presentErrorAlertWithString:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", a3, 0, 1);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0DC3448];
  _WBSLocalizedString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "actionWithTitle:style:handler:", v5, 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addAction:", v6);

  -[_SFAccountPickerTableViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v7, 1, 0);
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  if (-[_SFAccountPickerTableViewController _shouldUseEmptyHeaderFooterHeightInSection:](self, "_shouldUseEmptyHeaderFooterHeightInSection:", a4))
  {
    return objc_alloc_init(MEMORY[0x1E0DC3F10]);
  }
  else
  {
    return 0;
  }
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  _BOOL4 v4;
  double *v5;

  v4 = -[_SFAccountPickerTableViewController _shouldUseEmptyHeaderFooterHeightInSection:](self, "_shouldUseEmptyHeaderFooterHeightInSection:", a4);
  v5 = (double *)&SFAccountListEmptyHeaderFooterHeight;
  if (!v4)
    v5 = (double *)MEMORY[0x1E0DC53D8];
  return *v5;
}

- (BOOL)_shouldUseEmptyHeaderFooterHeightInSection:(int64_t)a3
{
  BOOL v3;
  void *v5;
  void *v6;

  if (a3)
    return 0;
  -[_SFAccountPickerTableViewController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SFAccountPickerTableViewController tableView:titleForHeaderInSection:](self, "tableView:titleForHeaderInSection:", v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v6 == 0;

  return v3;
}

- (void)searchPatternDidUpdate
{
  id v3;

  -[_SFAccountPickerTableViewController _updateMatchingPasswords](self, "_updateMatchingPasswords");
  -[_SFAccountPickerTableViewController tableView](self, "tableView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reloadData");

}

- (void)_updateMatchingPasswords
{
  void *v3;
  uint64_t v4;
  NSMutableArray *savedAccounts;
  void *v6;
  NSMutableArray *v7;
  NSMutableArray *matchingSavedAccounts;
  NSMutableArray *v9;
  void *v10;
  NSMutableArray *v11;
  NSMutableArray *v12;
  _QWORD v13[5];
  _QWORD v14[5];

  -[_SFAccountTableViewController searchPattern](self, "searchPattern");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (v4)
  {
    savedAccounts = self->_savedAccounts;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __63___SFAccountPickerTableViewController__updateMatchingPasswords__block_invoke_3;
    v13[3] = &unk_1E4AC02D8;
    v13[4] = self;
    -[NSMutableArray safari_filterObjectsUsingBlock:](savedAccounts, "safari_filterObjectsUsingBlock:", v13);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (NSMutableArray *)objc_msgSend(v6, "mutableCopy");
    matchingSavedAccounts = self->_matchingSavedAccounts;
    self->_matchingSavedAccounts = v7;

  }
  else
  {
    v9 = self->_savedAccounts;
    if (self->_savedAccountsMatchingHintStrings)
    {
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __63___SFAccountPickerTableViewController__updateMatchingPasswords__block_invoke;
      v14[3] = &unk_1E4AC02D8;
      v14[4] = self;
      -[NSMutableArray safari_filterObjectsUsingBlock:](v9, "safari_filterObjectsUsingBlock:", v14);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (NSMutableArray *)objc_msgSend(v10, "mutableCopy");
      v12 = self->_matchingSavedAccounts;
      self->_matchingSavedAccounts = v11;

    }
    else
    {
      objc_storeStrong((id *)&self->_matchingSavedAccounts, v9);
    }
  }
  if (!-[SFAccountPickerConfiguration shouldShowPasskeysInAccountPicker](self->_configuration, "shouldShowPasskeysInAccountPicker"))-[NSMutableArray safari_removeObjectsPassingTest:](self->_matchingSavedAccounts, "safari_removeObjectsPassingTest:", &__block_literal_global_214);
}

- (id)_generatedPasswordsDomainHintString
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[SFAccountPickerConfiguration addPasswordSuggestedDomain](self->_configuration, "addPasswordSuggestedDomain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "safari_highLevelDomainForPasswordManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[SFAccountPickerConfiguration domainHintStrings](self->_configuration, "domainHintStrings");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "safari_highLevelDomainForPasswordManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (void)_updateMatchingGeneratedPasswordsState
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[_SFAccountPickerTableViewController _generatedPasswordsDomainHintString](self, "_generatedPasswordsDomainHintString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0C92C70];
    -[_SFAccountPickerTableViewController _generatedPasswordsDomainHintString](self, "_generatedPasswordsDomainHintString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("https://"), "stringByAppendingString:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "safari_bestURLForUserTypedString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "safari_HTMLFormProtectionSpaceForURL:", v7);
    v10 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D8A970], "sharedStore");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "generatedPasswordsForProtectionSpace:options:", v10, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    self->_hasMatchingGeneratedPasswords = objc_msgSend(v9, "count") != 0;

  }
  else
  {
    self->_hasMatchingGeneratedPasswords = 0;
  }
}

- (BOOL)_shouldShowAutoFillPasskeys
{
  _BOOL4 v3;

  v3 = -[SFAccountPickerConfiguration shouldShowAutoFillPasskeys](self->_configuration, "shouldShowAutoFillPasskeys");
  if (v3)
  {
    if (-[NSMutableArray count](self->_savedAccountWithUsablePasskeys, "count"))
      LOBYTE(v3) = 1;
    else
      LOBYTE(v3) = self->_passkeyNearbyDeviceOptions != 0;
  }
  return v3;
}

- (BOOL)_shouldShowPasswordsMatchingHintStringsSection
{
  void *v3;
  uint64_t v4;

  -[_SFAccountTableViewController searchPattern](self, "searchPattern");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (v4)
    return 0;
  if (-[SFAccountPickerConfiguration shouldAllowAddingNewPasswords](self->_configuration, "shouldAllowAddingNewPasswords"))
  {
    return 1;
  }
  return -[NSMutableArray count](self->_savedAccountsMatchingHintStrings, "count") != 0;
}

- (void)_updateSections
{
  uint64_t v3;

  self->_sectionForPasskeys = 0x7FFFFFFFFFFFFFFFLL;
  self->_sectionForPasswordsMatchingHintStrings = 0x7FFFFFFFFFFFFFFFLL;
  self->_sectionForAllPasswords = 0x7FFFFFFFFFFFFFFFLL;
  self->_sectionForVerificationCodes = 0x7FFFFFFFFFFFFFFFLL;
  if (-[NSArray count](self->_verificationCodes, "count"))
  {
    self->_sectionForVerificationCodes = 0;
    v3 = 1;
  }
  else
  {
    v3 = 0;
  }
  if (-[_SFAccountPickerTableViewController _shouldShowAutoFillPasskeys](self, "_shouldShowAutoFillPasskeys"))
    self->_sectionForPasskeys = v3++;
  if (-[_SFAccountPickerTableViewController _shouldShowPasswordsMatchingHintStringsSection](self, "_shouldShowPasswordsMatchingHintStringsSection"))
  {
    self->_sectionForPasswordsMatchingHintStrings = v3++;
  }
  self->_sectionForAllPasswords = v3;
}

- (id)_savedAccountForIndexPath:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;

  v4 = a3;
  v5 = objc_msgSend(v4, "section");
  v6 = objc_msgSend(v4, "row");

  if (v5 == self->_sectionForPasskeys)
  {
    if (v6 < 0 || (v7 = 1096, v6 >= -[NSMutableArray count](self->_savedAccountWithUsablePasskeys, "count")))
    {
      v8 = WBS_LOG_CHANNEL_PREFIXAutoFill();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[_SFAccountPickerTableViewController _savedAccountForIndexPath:].cold.1();
      goto LABEL_17;
    }
  }
  else if (v5 == self->_sectionForPasswordsMatchingHintStrings)
  {
    if (v6 < 0 || (v7 = 1064, v6 >= -[NSMutableArray count](self->_savedAccountsMatchingHintStrings, "count")))
    {
      v9 = WBS_LOG_CHANNEL_PREFIXAutoFill();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[_SFAccountPickerTableViewController _savedAccountForIndexPath:].cold.2();
      goto LABEL_17;
    }
  }
  else
  {
    if (v5 != self->_sectionForAllPasswords)
    {
LABEL_17:
      v10 = 0;
      return v10;
    }
    if (v6 < 0 || (v7 = 1080, v6 >= -[NSMutableArray count](self->_matchingSavedAccounts, "count")))
    {
      v11 = WBS_LOG_CHANNEL_PREFIXAutoFill();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[_SFAccountPickerTableViewController _savedAccountForIndexPath:].cold.3();
      goto LABEL_17;
    }
  }
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v7), "objectAtIndexedSubscript:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  return v10;
}

- (id)_indexPathForSavedAccount:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int *v8;
  void *v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  char v18;
  void *v19;

  v4 = a3;
  v5 = -[NSMutableArray count](self->_savedAccountWithUsablePasskeys, "count");
  if (v5 >= 1)
  {
    v6 = v5;
    v7 = 0;
    v8 = &OBJC_IVAR____SFAccountPickerTableViewController__sectionForPasskeys;
    do
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_savedAccountWithUsablePasskeys, "objectAtIndexedSubscript:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v4, "isEqual:", v9);

      if ((v10 & 1) != 0)
        goto LABEL_14;
    }
    while (v6 != ++v7);
  }
  v11 = -[NSMutableArray count](self->_savedAccountsMatchingHintStrings, "count");
  if (v11 >= 1)
  {
    v12 = v11;
    v7 = 0;
    v8 = &OBJC_IVAR____SFAccountPickerTableViewController__sectionForPasswordsMatchingHintStrings;
    do
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_savedAccountsMatchingHintStrings, "objectAtIndexedSubscript:", v7);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v4, "isEqual:", v13);

      if ((v14 & 1) != 0)
        goto LABEL_14;
    }
    while (v12 != ++v7);
  }
  v15 = -[NSMutableArray count](self->_matchingSavedAccounts, "count");
  if (v15 >= 1)
  {
    v16 = v15;
    v7 = 0;
    v8 = &OBJC_IVAR____SFAccountPickerTableViewController__sectionForAllPasswords;
    while (1)
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_matchingSavedAccounts, "objectAtIndexedSubscript:", v7);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v4, "isEqual:", v17);

      if ((v18 & 1) != 0)
        break;
      if (v16 == ++v7)
        goto LABEL_13;
    }
LABEL_14:
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v7, *(Class *)((char *)&self->super.super.super.super.super.isa + *v8));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
LABEL_13:
  v19 = 0;
LABEL_15:

  return v19;
}

- (void)accountDetailViewController:(id)a3 didMoveSavedAccountToRecentlyDeleted:(id)a4
{
  -[_SFAccountPickerTableViewController _removeSavedAccount:modifyingAccountStore:](self, "_removeSavedAccount:modifyingAccountStore:", a4, 0);
}

- (void)accountDetailViewController:(id)a3 fillUsernameForSavedAccount:(id)a4
{
  -[_SFAccountPickerTableViewController _fillUsernameForSavedAccount:](self, "_fillUsernameForSavedAccount:", a4);
}

- (void)accountDetailViewController:(id)a3 fillPasswordForSavedAccount:(id)a4
{
  -[_SFAccountPickerTableViewController _fillPasswordForSavedAccount:](self, "_fillPasswordForSavedAccount:", a4);
}

- (void)accountDetailViewController:(id)a3 fillVerificationCodeForSavedAccount:(id)a4
{
  -[_SFAccountPickerTableViewController _fillVerificationCodeForSavedAccount:](self, "_fillVerificationCodeForSavedAccount:", a4);
}

- (void)passwordManagerLogViewControllerWantsToSaveGeneratedPassword:(id)a3
{
  self->_didPresentAddAccountViewControllerFromGeneratedPasswords = 1;
  objc_storeStrong((id *)&self->_generatedPasswordBeingTransformedIntoSavedAccount, a3);
  -[_SFAccountPickerTableViewController _presentAddPasswordViewController](self, "_presentAddPasswordViewController");
}

- (void)passwordManagerLogViewControllerWantsToDismiss
{
  id v2;

  -[_SFAccountPickerTableViewController presentedViewController](self, "presentedViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (_SFAccountPickerTableViewControllerDelegate)delegate
{
  return (_SFAccountPickerTableViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SFAccountPickerConfiguration)configuration
{
  return self->_configuration;
}

- (LAContext)authenticatedContext
{
  return self->_authenticatedContext;
}

- (void)setAuthenticatedContext:(id)a3
{
  objc_storeStrong((id *)&self->_authenticatedContext, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authenticatedContext, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_generatedPasswordBeingTransformedIntoSavedAccount, 0);
  objc_storeStrong((id *)&self->_verificationCodes, 0);
  objc_storeStrong((id *)&self->_verificationCodeProvider, 0);
  objc_destroyWeak((id *)&self->_detailViewController);
  objc_storeStrong((id *)&self->_addPasswordViewController, 0);
  objc_storeStrong((id *)&self->_addNavigationBarItem, 0);
  objc_storeStrong((id *)&self->_indexPathOfRowShowingDetailView, 0);
  objc_storeStrong((id *)&self->_authenticationServicesAgentProxy, 0);
  objc_storeStrong((id *)&self->_passkeyNearbyDeviceOptions, 0);
  objc_storeStrong((id *)&self->_savedAccountWithUsablePasskeys, 0);
  objc_storeStrong((id *)&self->_autoFillPasskeys, 0);
  objc_storeStrong((id *)&self->_matchingSavedAccounts, 0);
  objc_storeStrong((id *)&self->_savedAccounts, 0);
  objc_storeStrong((id *)&self->_savedAccountsMatchingHintStrings, 0);
}

- (void)tableView:didSelectRowAtIndexPath:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1A3B2D000, v0, v1, "Failed to get saved account for selection in passkey section of picker.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)tableView:didSelectRowAtIndexPath:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1A3B2D000, v0, v1, "Failed to get saved account for selection in picker.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_removeSavedAccount:modifyingAccountStore:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1A3B2D000, v0, v1, "Failed to move password to recently deleted.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_savedAccountForIndexPath:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1A3B2D000, v0, v1, "Received row index that is outside of bounds of usable passkeys array.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_savedAccountForIndexPath:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1A3B2D000, v0, v1, "Received row index that is outside of bounds of passwords matching hint strings array.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_savedAccountForIndexPath:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1A3B2D000, v0, v1, "Received row index that is outside of bounds of all passwords array.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
