@implementation _SFAccountManagerViewController

- (_SFAccountManagerViewController)initWithSiteMetadataManager:(id)a3 autoFillQuirksManager:(id)a4 persona:(unint64_t)a5 group:(id)a6
{
  id v11;
  id v12;
  id v13;
  _SFAccountTableConfiguration *v14;
  void *v15;
  _SFAccountManagerViewController *v16;
  _SFAccountManagerViewController *v17;
  uint64_t v18;
  WBSSavedAccountStore *savedAccountStore;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  uint64_t v24;
  WBSPasswordWarningManager *passwordWarningManager;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  NSMutableSet *selectedSavedAccounts;
  _SFAccountManagerViewController *v36;
  id v38;
  void *v39;
  objc_super v40;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  v14 = objc_alloc_init(_SFAccountTableConfiguration);
  -[_SFAccountTableConfiguration setShouldShowSearchBar:](v14, "setShouldShowSearchBar:", 1);
  -[_SFAccountTableConfiguration setSupportsDelete:](v14, "setSupportsDelete:", 1);
  objc_msgSend(MEMORY[0x1E0D4EC80], "sharedFeatureManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SFAccountTableConfiguration setSupportsShare:](v14, "setSupportsShare:", objc_msgSend(v15, "isAirDropPasswordsAvailable"));

  -[_SFAccountTableConfiguration setSupportsOngoingCredentialSharing:](v14, "setSupportsOngoingCredentialSharing:", 1);
  v40.receiver = self;
  v40.super_class = (Class)_SFAccountManagerViewController;
  v16 = -[_SFAccountTableViewController initWithSiteMetadataManager:configuration:](&v40, sel_initWithSiteMetadataManager_configuration_, v11, v14);
  v17 = v16;
  if (v16)
  {
    v38 = v13;
    objc_storeStrong((id *)&v16->_siteMetadataManager, a3);
    objc_storeStrong((id *)&v17->_autoFillQuirksManager, a4);
    objc_msgSend(MEMORY[0x1E0D8AC08], "sharedStore");
    v18 = objc_claimAutoreleasedReturnValue();
    savedAccountStore = v17->_savedAccountStore;
    v17->_savedAccountStore = (WBSSavedAccountStore *)v18;

    objc_msgSend(MEMORY[0x1E0D8A990], "existingSharedHistory");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v20)
    {
      v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DD9918]), "initWithDatabaseID:", 0);
      objc_msgSend(v20, "setShouldScheduleMaintenance:", 0);
    }
    v21 = objc_alloc(MEMORY[0x1E0D8AAB8]);
    objc_msgSend(MEMORY[0x1E0D8AC08], "sharedStore");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99EA0], "_sf_safariDefaults");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v21, "initWithSavedAccountStore:autoFillQuirksManager:userDefaults:highLevelDomainsProvider:", v22, v12, v23, v20);
    passwordWarningManager = v17->_passwordWarningManager;
    v17->_passwordWarningManager = (WBSPasswordWarningManager *)v24;

    v17->_hasBeenAuthenticated = 1;
    v17->_isFirstWillAppear = 1;
    v17->_persona = a5;
    objc_msgSend(MEMORY[0x1E0D8AA48], "sharedProvider");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "addSubscriber:", v17);

    objc_storeStrong((id *)&v17->_sharedAccountsGroup, a6);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = *MEMORY[0x1E0D46EC8];
    objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addObserver:selector:name:object:", v17, sel__managedConfigurationSettingsDidChange_, v28, v29);

    v30 = *MEMORY[0x1E0D8B490];
    objc_msgSend(MEMORY[0x1E0D8AC08], "sharedStore");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addObserver:selector:name:object:", v17, sel__savedAccountStoreDidChange, v30, v31);

    v32 = *MEMORY[0x1E0D8B0B0];
    objc_msgSend(MEMORY[0x1E0D8A970], "sharedStore");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addObserver:selector:name:object:", v17, sel__generatedPasswordStoreDidChange, v32, v33);

    if (v17->_persona == 1)
      v17->_hasBeenAuthenticated = 0;
    objc_msgSend(MEMORY[0x1E0C99E20], "set", v38);
    v34 = objc_claimAutoreleasedReturnValue();
    selectedSavedAccounts = v17->_selectedSavedAccounts;
    v17->_selectedSavedAccounts = (NSMutableSet *)v34;

    v36 = v17;
    v13 = v39;
  }

  return v17;
}

- (id)navigationItem
{
  void *v2;
  unint64_t persona;
  BOOL v4;
  void *v6;
  objc_super v7;

  persona = self->_persona;
  if (persona)
    v4 = persona == 2;
  else
    v4 = 1;
  if (v4)
  {
    v7.receiver = self;
    v7.super_class = (Class)_SFAccountManagerViewController;
    -[_SFAccountManagerViewController navigationItem](&v7, sel_navigationItem);
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (persona == 1)
    {
      -[_SFAccountManagerViewController parentViewController](self, "parentViewController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "navigationItem");
      v2 = (void *)objc_claimAutoreleasedReturnValue();

    }
    return v2;
  }
}

- (BOOL)canBeShownFromSuspendedState
{
  return 1;
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  WBSPasswordWarningManager *passwordWarningManager;
  _QWORD v6[4];
  id v7;
  id location;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_SFAccountManagerViewController;
  -[_SFAccountTableViewController viewWillAppear:](&v9, sel_viewWillAppear_, a3);
  -[_SFAccountManagerViewController _setUserInterfaceElementsEnabled:](self, "_setUserInterfaceElementsEnabled:", self->_hasBeenAuthenticated);
  -[_SFAccountManagerViewController _checkForTipsToShow](self, "_checkForTipsToShow");
  if (!self->_isObservingExtensionManagers)
  {
    objc_msgSend(MEMORY[0x1E0C925F8], "sharedManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addChangeObserver:", self);

    self->_isObservingExtensionManagers = 1;
  }
  if (-[_SFAccountManagerViewController _shouldShowSecurityRecommendationsItem](self, "_shouldShowSecurityRecommendationsItem"))
  {
    if (self->_isFirstWillAppear)
    {
      objc_initWeak(&location, self);
      passwordWarningManager = self->_passwordWarningManager;
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __50___SFAccountManagerViewController_viewWillAppear___block_invoke;
      v6[3] = &unk_1E4ABFF98;
      objc_copyWeak(&v7, &location);
      -[WBSPasswordWarningManager getAllWarningsForcingUpdate:completionHandler:](passwordWarningManager, "getAllWarningsForcingUpdate:completionHandler:", 1, v6);
      self->_isFirstWillAppear = 0;
      objc_destroyWeak(&v7);
      objc_destroyWeak(&location);
      return;
    }
    -[_SFAccountManagerViewController _reloadSecurityRecommendationsSection](self, "_reloadSecurityRecommendationsSection");
  }
  if (self->_savedAccountToRemoveAfterCompletedUpgradeInDetailView)
    -[_SFAccountManagerViewController _findAndRemoveEntryForCompletedDetailViewUpgrade](self, "_findAndRemoveEntryForCompletedDetailViewUpgrade");
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)_SFAccountManagerViewController;
  -[_SFAccountTableViewController viewWillDisappear:](&v7, sel_viewWillDisappear_);
  -[_SFAccountManagerViewController navigationController](self, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNavigationBarHidden:animated:", 0, v3);

  if (!self->_shouldShowGroupExitAlert)
    -[_SFAccountManagerViewController safari_dismissPresentedAlert](self, "safari_dismissPresentedAlert");
  self->_shouldShowGroupExitAlert = 0;
  objc_msgSend(MEMORY[0x1E0C925F8], "sharedManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeChangeObserver:", self);

  self->_isObservingExtensionManagers = 0;
}

- (void)viewDidLoad
{
  unint64_t persona;
  id v4;
  void *v5;
  SFTableViewDiffableDataSource *v6;
  SFTableViewDiffableDataSource *diffableDataSource;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id (*v12)(uint64_t, void *, void *, void *);
  void *v13;
  id v14;
  id location;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)_SFAccountManagerViewController;
  -[_SFAccountTableViewController viewDidLoad](&v16, sel_viewDidLoad);
  persona = self->_persona;
  if (persona >= 2)
  {
    if (persona == 2 && self->_shouldShowSharingGroupWelcomeView)
      -[_SFAccountManagerViewController _showSharingGroupWelcomeView](self, "_showSharingGroupWelcomeView");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D4EF88], "setSharedSiteMetadataManagerProvider:", self);
  }
  -[_SFAccountManagerViewController _configureNavigationBar](self, "_configureNavigationBar");
  -[_SFAccountManagerViewController _configureTableView](self, "_configureTableView");
  objc_initWeak(&location, self);
  v4 = objc_alloc(MEMORY[0x1E0D4EE40]);
  -[_SFAccountManagerViewController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __46___SFAccountManagerViewController_viewDidLoad__block_invoke;
  v13 = &unk_1E4ABFD40;
  objc_copyWeak(&v14, &location);
  v6 = (SFTableViewDiffableDataSource *)objc_msgSend(v4, "initWithTableView:cellProvider:", v5, &v10);
  diffableDataSource = self->_diffableDataSource;
  self->_diffableDataSource = v6;

  -[SFTableViewDiffableDataSource setDelegate:](self->_diffableDataSource, "setDelegate:", self, v10, v11, v12, v13);
  -[_SFAccountManagerViewController tableView](self, "tableView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("sharedCredentialTipPlatter"));

  -[_SFAccountManagerViewController tableView](self, "tableView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("sharedCredentialTipButton"));

  -[_SFAccountManagerViewController _fetchSharedAccountsGroups](self, "_fetchSharedAccountsGroups");
  -[_SFAccountManagerViewController _reloadSavedAccounts](self, "_reloadSavedAccounts");
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (void)_configureNavigationBar
{
  int v3;
  id v4;
  void *v5;
  void *v6;
  UIBarButtonItem *v7;
  UIBarButtonItem *addNavigationBarItem;
  UIBarButtonItem *v9;
  UIBarButtonItem *v10;
  id v11;
  void *v12;
  void *v13;
  UIBarButtonItem *v14;
  UIBarButtonItem *ellipsisNavigationBarItem;
  UIBarButtonItem *v16;
  UIBarButtonItem *editNavigationBarItem;
  id v18;
  void *v19;
  UIBarButtonItem *v20;
  UIBarButtonItem *cancelNavigationBarItem;
  id v22;
  void *v23;
  UIBarButtonItem *v24;
  UIBarButtonItem *deleteNavigationBarItem;
  UIBarButtonItem *v26;
  UIBarButtonItem *editToolbarItem;
  void *v28;
  UIBarButtonItem *v29;
  UIBarButtonItem *cancelToolbarItem;
  void *v31;
  UIBarButtonItem *v32;
  UIBarButtonItem *deleteToolbarItem;
  void *v34;
  unint64_t persona;
  uint64_t v36;
  KCSharingGroup *sharedAccountsGroup;
  void *v38;
  void *v39;
  UIBarButtonItem **v40;
  void *v41;
  void *v42;
  void *v43;
  int v44;
  UIBarButtonItem *v45;
  _BOOL4 v46;
  _BOOL4 v47;
  UIBarButtonItem *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  UIBarButtonItem *v52;
  UIBarButtonItem *v53;
  UIBarButtonItem *v54;
  _QWORD v55[2];
  UIBarButtonItem *v56;
  UIBarButtonItem *v57;
  _QWORD v58[2];
  _QWORD v59[2];
  _QWORD v60[2];

  v60[1] = *MEMORY[0x1E0C80C00];
  if (-[_SFAccountManagerViewController _shouldReconfigureAddNavigationBarButton](self, "_shouldReconfigureAddNavigationBarButton"))
  {
    v3 = objc_msgSend(MEMORY[0x1E0D8A8F8], "isOngoingCredentialSharingEnabled");
    v4 = objc_alloc(MEMORY[0x1E0DC34F0]);
    v5 = v4;
    if (v3)
    {
      -[_SFAccountManagerViewController _addButtonMenu](self, "_addButtonMenu");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (UIBarButtonItem *)objc_msgSend(v5, "initWithBarButtonSystemItem:menu:", 4, v6);
      addNavigationBarItem = self->_addNavigationBarItem;
      self->_addNavigationBarItem = v7;

    }
    else
    {
      v9 = (UIBarButtonItem *)objc_msgSend(v4, "initWithBarButtonSystemItem:target:action:", 4, self, sel__addNewPassword_);
      v10 = self->_addNavigationBarItem;
      self->_addNavigationBarItem = v9;

    }
  }
  -[UIBarButtonItem setAccessibilityIdentifier:](self->_addNavigationBarItem, "setAccessibilityIdentifier:", CFSTR("Passwords List Navigation Bar Add Button"));
  v11 = objc_alloc(MEMORY[0x1E0DC34F0]);
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("ellipsis.circle"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SFAccountManagerViewController _ellipsisButtonMenu](self, "_ellipsisButtonMenu");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (UIBarButtonItem *)objc_msgSend(v11, "initWithImage:menu:", v12, v13);
  ellipsisNavigationBarItem = self->_ellipsisNavigationBarItem;
  self->_ellipsisNavigationBarItem = v14;

  -[UIBarButtonItem setAccessibilityIdentifier:](self->_ellipsisNavigationBarItem, "setAccessibilityIdentifier:", CFSTR("Passwords List Navigation Bar Ellipsis Button"));
  v16 = (UIBarButtonItem *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 2, self, sel__editNavigationBarItemTapped_);
  editNavigationBarItem = self->_editNavigationBarItem;
  self->_editNavigationBarItem = v16;

  -[UIBarButtonItem setAccessibilityIdentifier:](self->_editNavigationBarItem, "setAccessibilityIdentifier:", CFSTR("Passwords List Navigation Bar Edit Button"));
  v18 = objc_alloc(MEMORY[0x1E0DC34F0]);
  _WBSLocalizedString();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (UIBarButtonItem *)objc_msgSend(v18, "initWithTitle:style:target:action:", v19, 2, self, sel__cancelNavigationBarItemTapped_);
  cancelNavigationBarItem = self->_cancelNavigationBarItem;
  self->_cancelNavigationBarItem = v20;

  -[UIBarButtonItem setAccessibilityIdentifier:](self->_cancelNavigationBarItem, "setAccessibilityIdentifier:", CFSTR("Passwords List Navigation Bar Cancel Button"));
  v22 = objc_alloc(MEMORY[0x1E0DC34F0]);
  _WBSLocalizedString();
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (UIBarButtonItem *)objc_msgSend(v22, "initWithTitle:style:target:action:", v23, 7, self, sel__deleteButtonTapped_);
  deleteNavigationBarItem = self->_deleteNavigationBarItem;
  self->_deleteNavigationBarItem = v24;

  -[UIBarButtonItem setAccessibilityIdentifier:](self->_deleteNavigationBarItem, "setAccessibilityIdentifier:", CFSTR("Passwords List Navigation Bar Delete Button"));
  _WBSLocalizedString();
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (UIBarButtonItem *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithTitle:style:target:action:", v51, 0, self, sel__beginEditing);
  editToolbarItem = self->_editToolbarItem;
  self->_editToolbarItem = v26;

  -[UIBarButtonItem setAccessibilityIdentifier:](self->_editToolbarItem, "setAccessibilityIdentifier:", CFSTR("Passwords List Toolbar Edit Button"));
  _WBSLocalizedString();
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (UIBarButtonItem *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithTitle:style:target:action:", v28, 2, self, sel__cancelEditing);
  cancelToolbarItem = self->_cancelToolbarItem;
  self->_cancelToolbarItem = v29;

  -[UIBarButtonItem setAccessibilityIdentifier:](self->_cancelToolbarItem, "setAccessibilityIdentifier:", CFSTR("Passwords List Toolbar Cancel Button"));
  _WBSLocalizedString();
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (UIBarButtonItem *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithTitle:style:target:action:", v31, 7, self, sel__deleteButtonTapped_);
  deleteToolbarItem = self->_deleteToolbarItem;
  self->_deleteToolbarItem = v32;

  -[UIBarButtonItem setAccessibilityIdentifier:](self->_deleteToolbarItem, "setAccessibilityIdentifier:", CFSTR("Passwords List Toolbar Delete Button"));
  -[_SFAccountManagerViewController _updateToolbarItemsAnimated:](self, "_updateToolbarItemsAnimated:", 0);
  -[_SFAccountManagerViewController navigationItem](self, "navigationItem");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  persona = self->_persona;
  if (persona < 2)
    goto LABEL_7;
  if (persona != 2)
    goto LABEL_12;
  sharedAccountsGroup = self->_sharedAccountsGroup;
  if (sharedAccountsGroup)
  {
    -[KCSharingGroup displayName](sharedAccountsGroup, "displayName");
    v36 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_7:
    _WBSLocalizedString();
    v36 = objc_claimAutoreleasedReturnValue();
  }
  v38 = (void *)v36;
  objc_msgSend(v34, "setTitle:", v36);

  persona = self->_persona;
LABEL_12:
  switch(persona)
  {
    case 0uLL:
      v53 = self->_editNavigationBarItem;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v53, 1);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setLeftBarButtonItems:animated:", v41, 1);

      v52 = self->_addNavigationBarItem;
      v39 = (void *)MEMORY[0x1E0C99D20];
      v40 = &v52;
      goto LABEL_31;
    case 2uLL:
      objc_msgSend(MEMORY[0x1E0D8AA48], "sharedProvider");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      -[KCSharingGroup groupID](self->_sharedAccountsGroup, "groupID");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = objc_msgSend(v42, "canCurrentUserEditSavedAccountsInGroupWithID:", v43);

      if (v44)
      {
        if (!-[_SFAccountManagerViewController _canAddPasswords](self, "_canAddPasswords"))
        {
          v54 = self->_editNavigationBarItem;
          v39 = (void *)MEMORY[0x1E0C99D20];
          v40 = &v54;
          goto LABEL_31;
        }
        v45 = self->_addNavigationBarItem;
        v55[0] = self->_editNavigationBarItem;
        v55[1] = v45;
        v39 = (void *)MEMORY[0x1E0C99D20];
        v40 = (UIBarButtonItem **)v55;
        goto LABEL_29;
      }
      break;
    case 1uLL:
      if (-[_SFAccountManagerViewController isEditing](self, "isEditing"))
      {
        v60[0] = self->_cancelToolbarItem;
        v39 = (void *)MEMORY[0x1E0C99D20];
        v40 = (UIBarButtonItem **)v60;
LABEL_31:
        v49 = 1;
        goto LABEL_32;
      }
      v46 = -[_SFAccountManagerViewController _canAddPasswords](self, "_canAddPasswords");
      v47 = -[_SFAccountManagerViewController _shouldShowEllipsisNavigationItem](self, "_shouldShowEllipsisNavigationItem");
      if (!v46)
      {
        if (v47)
        {
          v57 = self->_ellipsisNavigationBarItem;
          v39 = (void *)MEMORY[0x1E0C99D20];
          v40 = &v57;
        }
        else
        {
          v56 = self->_editNavigationBarItem;
          v39 = (void *)MEMORY[0x1E0C99D20];
          v40 = &v56;
        }
        goto LABEL_31;
      }
      v48 = self->_addNavigationBarItem;
      if (v47)
      {
        v59[0] = self->_ellipsisNavigationBarItem;
        v59[1] = v48;
        v39 = (void *)MEMORY[0x1E0C99D20];
        v40 = (UIBarButtonItem **)v59;
      }
      else
      {
        v58[0] = self->_editNavigationBarItem;
        v58[1] = v48;
        v39 = (void *)MEMORY[0x1E0C99D20];
        v40 = (UIBarButtonItem **)v58;
      }
LABEL_29:
      v49 = 2;
LABEL_32:
      objc_msgSend(v39, "arrayWithObjects:count:", v40, v49);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setRightBarButtonItems:animated:", v50, 1);

      break;
  }

}

- (BOOL)_shouldReconfigureAddNavigationBarButton
{
  UIBarButtonItem *addNavigationBarItem;
  void *v4;
  BOOL v5;

  if (!objc_msgSend(MEMORY[0x1E0D8A8F8], "isOngoingCredentialSharingEnabled"))
    return 1;
  addNavigationBarItem = self->_addNavigationBarItem;
  if (!addNavigationBarItem)
    return 1;
  -[UIBarButtonItem menu](addNavigationBarItem, "menu");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 == 0;

  return v5;
}

- (void)_configureTableView
{
  void *v3;
  id v4;
  id v5;

  -[_SFAccountManagerViewController tableView](self, "tableView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAllowsMultipleSelectionDuringEditing:", 1);
  objc_msgSend(v5, "setKeyboardDismissMode:", 1);
  objc_msgSend(v5, "setSectionIndexMinimumDisplayRowCount:", 10);
  -[_SFAccountManagerViewController _tableViewHeaderView](self, "_tableViewHeaderView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTableHeaderView:", v3);

  v4 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
  objc_msgSend(v5, "setTableFooterView:", v4);

  objc_msgSend(v5, "setSectionHeaderHeight:", 0.0);
  objc_msgSend(v5, "setSectionFooterHeight:", *MEMORY[0x1E0DC53D8]);
  objc_msgSend(v5, "setEstimatedSectionFooterHeight:", 17.0);
  objc_msgSend(v5, "setAccessibilityIdentifier:", CFSTR("Passwords List View"));
  -[_SFAccountManagerViewController _updateHeaderAndFooterViewsFloat](self, "_updateHeaderAndFooterViewsFloat");
  if (objc_msgSend(v5, "style") == 2)
  {
    objc_msgSend(v5, "setCellLayoutMarginsFollowReadableWidth:", 1);
    objc_msgSend(v5, "_setSectionContentInsetFollowsLayoutMargins:", 1);
  }

}

- (id)_tableViewHeaderView
{
  id v3;
  void *v4;
  void *v5;
  CGRect v7;

  if (self->_persona == 2 && !self->_sharedAccountsGroup)
  {
    v5 = 0;
  }
  else
  {
    v3 = objc_alloc(MEMORY[0x1E0DC3F10]);
    -[_SFAccountManagerViewController tableView](self, "tableView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bounds");
    v5 = (void *)objc_msgSend(v3, "initWithFrame:", 0.0, 0.0, CGRectGetWidth(v7), 17.0);

  }
  return v5;
}

- (id)_createPasswordOptionsViewController
{
  return (id)objc_msgSend(MEMORY[0x1E0D6C070], "makePasswordOptionsViewController");
}

- (id)_ellipsisButtonMenu
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  id location;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v4 = (void *)MEMORY[0x1E0DC3428];
  _WBSLocalizedString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("checkmark.circle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __54___SFAccountManagerViewController__ellipsisButtonMenu__block_invoke;
  v17[3] = &unk_1E4ABFFC0;
  objc_copyWeak(&v18, &location);
  objc_msgSend(v4, "actionWithTitle:image:identifier:handler:", v5, v6, 0, v17);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v8);

  if (-[_SFAccountManagerViewController _shouldShowGeneratedPasswordsEllipsisMenuItem](self, "_shouldShowGeneratedPasswordsEllipsisMenuItem"))
  {
    v9 = (void *)MEMORY[0x1E0DC3428];
    _WBSLocalizedString();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("ellipsis.rectangle"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v7;
    v15[1] = 3221225472;
    v15[2] = __54___SFAccountManagerViewController__ellipsisButtonMenu__block_invoke_2;
    v15[3] = &unk_1E4ABFFC0;
    objc_copyWeak(&v16, &location);
    objc_msgSend(v9, "actionWithTitle:image:identifier:handler:", v10, v11, 0, v15);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v12);

    objc_destroyWeak(&v16);
  }
  objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithTitle:children:", &stru_1E4AC8470, v3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

  return v13;
}

- (id)_addButtonMenu
{
  unint64_t persona;
  const char *v3;

  persona = self->_persona;
  if (persona < 2)
  {
    -[_SFAccountManagerViewController _addButtonMenuForTopLevelView](self, "_addButtonMenuForTopLevelView");
    v3 = (const char *)objc_claimAutoreleasedReturnValue();
LABEL_5:
    a2 = v3;
    return (id)(id)a2;
  }
  if (persona == 2)
  {
    -[_SFAccountManagerViewController _addButtonMenuForGroupDetailView](self, "_addButtonMenuForGroupDetailView");
    v3 = (const char *)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  return (id)(id)a2;
}

- (id)_addButtonMenuForTopLevelView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  id location;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v4 = (void *)MEMORY[0x1E0DC3428];
  _WBSLocalizedString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("key"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __64___SFAccountManagerViewController__addButtonMenuForTopLevelView__block_invoke;
  v17[3] = &unk_1E4ABFFC0;
  objc_copyWeak(&v18, &location);
  objc_msgSend(v4, "actionWithTitle:image:identifier:handler:", v5, v6, 0, v17);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v8);

  v9 = (void *)MEMORY[0x1E0DC3428];
  v10 = (void *)objc_msgSend(MEMORY[0x1E0D6C060], "newGroupButtonTitle");
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("person.2"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v7;
  v15[1] = 3221225472;
  v15[2] = __64___SFAccountManagerViewController__addButtonMenuForTopLevelView__block_invoke_2;
  v15[3] = &unk_1E4ABFFC0;
  objc_copyWeak(&v16, &location);
  objc_msgSend(v9, "actionWithTitle:image:identifier:handler:", v10, v11, 0, v15);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v12);

  objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithChildren:", v3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v16);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

  return v13;
}

- (id)_addButtonMenuForGroupDetailView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  KCSharingGroup *sharedAccountsGroup;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id *v25;
  id *v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(uint64_t);
  void *v30;
  id v31;
  _QWORD v32[4];
  id v33;
  _QWORD v34[4];
  id v35;
  id location;
  _QWORD v37[3];

  v37[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v4 = (void *)MEMORY[0x1E0DC3428];
  _WBSLocalizedString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("key"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __67___SFAccountManagerViewController__addButtonMenuForGroupDetailView__block_invoke;
  v34[3] = &unk_1E4ABFFC0;
  v25 = &v35;
  objc_copyWeak(&v35, &location);
  objc_msgSend(v4, "actionWithTitle:image:identifier:handler:", v5, v6, 0, v34);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v8);

  _WBSLocalizedString();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0DC3428];
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("arrow.forward.square"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v7;
  v32[1] = 3221225472;
  v32[2] = __67___SFAccountManagerViewController__addButtonMenuForGroupDetailView__block_invoke_2;
  v32[3] = &unk_1E4ABFFC0;
  objc_copyWeak(&v33, &location);
  objc_msgSend(v10, "actionWithTitle:image:identifier:handler:", v9, v11, 0, v32);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v12);

  sharedAccountsGroup = self->_sharedAccountsGroup;
  if (sharedAccountsGroup)
  {
    -[KCSharingGroup ownerParticipant](sharedAccountsGroup, "ownerParticipant", &v35);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "isCurrentUser");

    if (v15)
    {
      v16 = (void *)MEMORY[0x1E0DC3428];
      _WBSLocalizedString();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("person.badge.plus"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v7;
      v28 = 3221225472;
      v29 = __67___SFAccountManagerViewController__addButtonMenuForGroupDetailView__block_invoke_3;
      v30 = &unk_1E4ABFFC0;
      objc_copyWeak(&v31, &location);
      objc_msgSend(v16, "actionWithTitle:image:identifier:handler:", v17, v18, 0, &v27);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v20 = (void *)MEMORY[0x1E0DC39D0];
      v37[0] = v19;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "menuWithTitle:image:identifier:options:children:", &stru_1E4AC8470, 0, 0, 1, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v22);

      objc_destroyWeak(&v31);
    }
  }
  objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithChildren:", v3, v25, v27, v28, v29, v30);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v33);

  objc_destroyWeak(v26);
  objc_destroyWeak(&location);

  return v23;
}

- (void)presentSharedAccountGroupCreationFlowWithSavedAccountToAddToNewlyCreatedGroup:(id)a3
{
  uint64_t v4;
  id v5;
  SFSharedAccountsGroupCreationFlowNavigationController *v6;

  v4 = 2 * (a3 != 0);
  v5 = a3;
  v6 = -[SFSharedAccountsGroupCreationFlowNavigationController initWithOriginType:initialParticipants:passwordWarningManager:]([SFSharedAccountsGroupCreationFlowNavigationController alloc], "initWithOriginType:initialParticipants:passwordWarningManager:", v4, 0, self->_passwordWarningManager);
  -[SFSharedAccountsGroupCreationFlowNavigationController setModalPresentationStyle:](v6, "setModalPresentationStyle:", 2);
  -[SFSharedAccountsGroupCreationFlowNavigationController setModalInPresentation:](v6, "setModalInPresentation:", 1);
  -[SFSharedAccountsGroupCreationFlowNavigationController setSharingDelegate:](v6, "setSharingDelegate:", self);
  -[SFSharedAccountsGroupCreationFlowNavigationController setSavedAccountToMoveToNewlyCreatedGroup:](v6, "setSavedAccountToMoveToNewlyCreatedGroup:", v5);

  +[_SFAccountManagerAppearanceValues preferredFormSheetContentSize](_SFAccountManagerAppearanceValues, "preferredFormSheetContentSize");
  -[SFSharedAccountsGroupCreationFlowNavigationController setPreferredContentSize:](v6, "setPreferredContentSize:");
  -[_SFAccountManagerViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v6, 1, 0);

}

- (void)presentConfirmationAlertToShareSavedAccount:(id)a3 toGroup:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  id location;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "isSavedInSharedGroup"))
  {
    objc_msgSend(MEMORY[0x1E0D8AA48], "sharedProvider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sharedGroupID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "cachedGroupWithID:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }
  objc_msgSend(v9, "displayName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "displayName");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  v25 = v9;
  if (v11 && v10)
  {
    objc_msgSend(MEMORY[0x1E0D6C058], "confirmationAlertSubtitleForMovingSavedAccount:fromGroupWithName:", v5, v10);
    v13 = objc_claimAutoreleasedReturnValue();
  }
  else if (v10)
  {
    objc_msgSend(MEMORY[0x1E0D6C058], "confirmationAlertSubtitleForMovingSavedAccount:toMyPasswordsFromGroup:", v5, v9);
    v13 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!v11)
    {
      v14 = 0;
      goto LABEL_12;
    }
    objc_msgSend(MEMORY[0x1E0D6C058], "confirmationAlertSubtitleForMovingSavedAccount:fromMyPasswordsToGroupWithName:", v5, v11);
    v13 = objc_claimAutoreleasedReturnValue();
  }
  v14 = (void *)v13;
LABEL_12:
  objc_msgSend(MEMORY[0x1E0D6C058], "alertTitleForMovingSavedAccount:toGroupWithName:", v5, v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v15, v14, _SFDeviceAlertStyle());
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  _WBSLocalizedString();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v18 = (void *)MEMORY[0x1E0DC3448];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __87___SFAccountManagerViewController_presentConfirmationAlertToShareSavedAccount_toGroup___block_invoke;
  v27[3] = &unk_1E4ABFFE8;
  objc_copyWeak(&v30, &location);
  v19 = v5;
  v28 = v19;
  v20 = v6;
  v29 = v20;
  objc_msgSend(v18, "actionWithTitle:style:handler:", v17, 0, v27);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addAction:", v21);

  v22 = (void *)MEMORY[0x1E0DC3448];
  _WBSLocalizedString();
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "actionWithTitle:style:handler:", v23, 1, 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addAction:", v24);

  -[_SFAccountManagerViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v16, 1, 0);
  objc_destroyWeak(&v30);
  objc_destroyWeak(&location);

}

- (void)_presentErrorAlertForFailingToMoveAccount:(id)a3 toGroup:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v6 = (void *)MEMORY[0x1E0D6C058];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "alertTitleForFailingToMoveToGroup");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0D6C058];
  v21[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "displayName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "alertSubtitleForFailingToMoveSavedAccounts:toGroupWithName:", v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v9, v13, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)MEMORY[0x1E0DC3448];
  _WBSLocalizedString();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __85___SFAccountManagerViewController__presentErrorAlertForFailingToMoveAccount_toGroup___block_invoke;
  v19[3] = &unk_1E4AC0010;
  v20 = v14;
  v17 = v14;
  objc_msgSend(v15, "actionWithTitle:style:handler:", v16, 0, v19);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addAction:", v18);

  -[_SFAccountManagerViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v17, 1, 0);
}

- (void)_presentMovePasswordsToExistingGroupViewController
{
  void *v3;
  SFMoveAccountsToGroupPickerViewController *v4;

  v4 = -[SFMoveAccountsToGroupPickerViewController initWithGroup:pickerType:autoFillQuirksManager:passwordWarningManager:]([SFMoveAccountsToGroupPickerViewController alloc], "initWithGroup:pickerType:autoFillQuirksManager:passwordWarningManager:", self->_sharedAccountsGroup, 1, self->_autoFillQuirksManager, self->_passwordWarningManager);
  -[SFMoveAccountsToGroupPickerViewController setDelegate:](v4, "setDelegate:", self);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", v4);
  objc_msgSend(v3, "setModalPresentationStyle:", 2);
  objc_msgSend(v3, "setModalInPresentation:", 1);
  +[_SFAccountManagerAppearanceValues preferredFormSheetContentSize](_SFAccountManagerAppearanceValues, "preferredFormSheetContentSize");
  objc_msgSend(v3, "setPreferredContentSize:");
  -[_SFAccountManagerViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v3, 1, 0);

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

  v10.receiver = self;
  v10.super_class = (Class)_SFAccountManagerViewController;
  v4 = a3;
  -[_SFAccountManagerViewController traitCollectionDidChange:](&v10, sel_traitCollectionDidChange_, v4);
  -[_SFAccountManagerViewController _updateHeaderAndFooterViewsFloat](self, "_updateHeaderAndFooterViewsFloat");
  objc_msgSend(v4, "preferredContentSizeCategory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[_SFAccountManagerViewController traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "preferredContentSizeCategory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "isEqual:", v7);

  if ((v8 & 1) == 0)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __60___SFAccountManagerViewController_traitCollectionDidChange___block_invoke;
    block[3] = &unk_1E4ABFE00;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
}

- (void)_updateHeaderAndFooterViewsFloat
{
  NSString *v3;
  int IsAccessibilityCategory;
  void *v5;
  id v6;

  -[_SFAccountManagerViewController traitCollection](self, "traitCollection");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "preferredContentSizeCategory");
  v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v3);

  LODWORD(v3) = objc_msgSend(v6, "verticalSizeClass") != 1;
  -[_SFAccountManagerViewController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_setHeaderAndFooterViewsFloat:", v3 & ~IsAccessibilityCategory);

}

- (id)additionalViewControllersToPushHandlingURLResourceDictionary:(id)a3 didAuthenticate:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  unsigned int v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  SFAccountDetailViewController *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  SFAccountDetailViewController *v24;
  uint64_t v25;
  SFRecentlyDeletedAccountsViewController *v26;
  void *v27;
  _QWORD *v28;
  NSObject *v29;
  void *v31;
  _QWORD v32[4];
  SFRecentlyDeletedAccountsViewController *v33;
  SFAccountDetailViewController *v34;
  _QWORD v35[5];
  id v36;
  SFRecentlyDeletedAccountsViewController *v37;
  SFRecentlyDeletedAccountsViewController *v38;
  uint64_t v39;
  SFAccountDetailViewController *v40;
  SFAccountDetailViewController *v41;
  _QWORD v42[3];

  v4 = a4;
  v42[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0D8AAA0], "valueForPasswordManagerResourceDictionary:key:", v6, *MEMORY[0x1E0D8B220]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0D8B218]);

  objc_msgSend(MEMORY[0x1E0D8AAA0], "valueForPasswordManagerResourceDictionary:key:", v6, *MEMORY[0x1E0D8B258]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    -[_SFAccountManagerViewController _sharableAccountFromResourceDictionary:](self, "_sharableAccountFromResourceDictionary:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      -[_SFAccountManagerViewController _saveSharableAccount:](self, "_saveSharableAccount:", v11);
      v13 = (id)objc_claimAutoreleasedReturnValue();
      if (!v13)
        goto LABEL_9;
      v15 = -[SFAccountDetailViewController initWithSavedAccount:passwordWarning:options:]([SFAccountDetailViewController alloc], "initWithSavedAccount:passwordWarning:options:", v13, 0, -[_SFAccountManagerViewController _detailViewOptionsForSavedAccount:](self, "_detailViewOptionsForSavedAccount:", v13));
      -[SFAccountDetailViewController setDelegate:](v15, "setDelegate:", self);
      objc_storeWeak((id *)&self->_detailViewController, v15);
      v41 = v15;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v41, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_29:

      goto LABEL_30;
    }
    objc_msgSend(MEMORY[0x1E0D8AAA0], "valueForPasswordManagerResourceDictionary:key:", v6, *MEMORY[0x1E0D8B260]);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_msgSend(MEMORY[0x1E0D8AA48], "sharedProvider");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v35[0] = MEMORY[0x1E0C809B0];
      v35[1] = 3221225472;
      v35[2] = __112___SFAccountManagerViewController_additionalViewControllersToPushHandlingURLResourceDictionary_didAuthenticate___block_invoke;
      v35[3] = &unk_1E4AC0038;
      v35[4] = self;
      v13 = v13;
      v36 = v13;
      objc_msgSend(v16, "performTaskEnsuringGroupsAreLoadedOnQueue:task:", MEMORY[0x1E0C80D38], v35);

      goto LABEL_9;
    }
    objc_msgSend(MEMORY[0x1E0D8AAA0], "valueForPasswordManagerResourceDictionary:key:", v6, *MEMORY[0x1E0D8B228]);
    v15 = (SFAccountDetailViewController *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D8AAA0], "valueForPasswordManagerResourceDictionary:key:", v6, *MEMORY[0x1E0D8B230]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(MEMORY[0x1E0D8AAA0], "BOOLForPasswordManagerResourceDictionary:key:defaultValue:", v6, *MEMORY[0x1E0D8B268], 1);
    if (-[SFAccountDetailViewController length](v15, "length") && objc_msgSend(v17, "length"))
    {
      -[SFTableViewDiffableDataSource snapshot](self->_diffableDataSource, "snapshot");
      v19 = v17;
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "itemIdentifiers");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v32[1] = 3221225472;
      v32[2] = __112___SFAccountManagerViewController_additionalViewControllersToPushHandlingURLResourceDictionary_didAuthenticate___block_invoke_2;
      v32[3] = &unk_1E4AC0088;
      v31 = v19;
      v32[0] = MEMORY[0x1E0C809B0];
      v33 = v19;
      v34 = v15;
      objc_msgSend(v21, "safari_firstObjectPassingTest:", v32);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (v22)
      {
        objc_msgSend(v22, "savedAccount");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = -[SFAccountDetailViewController initWithSavedAccount:passwordWarning:options:]([SFAccountDetailViewController alloc], "initWithSavedAccount:passwordWarning:options:", v23, 0, -[_SFAccountManagerViewController _detailViewOptionsForSavedAccount:](self, "_detailViewOptionsForSavedAccount:", v23));
        -[SFAccountDetailViewController setDelegate:](v24, "setDelegate:", self);
        -[SFAccountDetailViewController setShowsChangePasswordControllerOnAppearance:](v24, "setShowsChangePasswordControllerOnAppearance:", v18);
        objc_storeWeak((id *)&self->_detailViewController, v24);
        v40 = v24;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v40, 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v29 = WBS_LOG_CHANNEL_PREFIXPasswords();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          -[_SFAccountManagerViewController additionalViewControllersToPushHandlingURLResourceDictionary:didAuthenticate:].cold.1();
        v14 = 0;
      }
      v17 = v31;

      v26 = v33;
      goto LABEL_27;
    }
    if (objc_msgSend(MEMORY[0x1E0D8AAA0], "isPasswordManagerPasswordOptionsResourceDictionary:", v6))
    {
      -[_SFAccountManagerViewController _createPasswordOptionsViewController](self, "_createPasswordOptionsViewController");
      v25 = objc_claimAutoreleasedReturnValue();
      v26 = (SFRecentlyDeletedAccountsViewController *)v25;
      if (!v25)
      {
        v14 = (void *)MEMORY[0x1E0C9AA60];
        goto LABEL_27;
      }
      v39 = v25;
      v27 = (void *)MEMORY[0x1E0C99D20];
      v28 = &v39;
    }
    else if (objc_msgSend(MEMORY[0x1E0D8AAA0], "isPasswordManagerSecurityRecommendationsResourceDictionary:", v6))
    {
      +[_SFPasswordAuditingViewController securityRecommendationsViewControllerWithSiteMetadataManager:autoFillQuirksManager:passwordWarningManager:](_SFPasswordAuditingViewController, "securityRecommendationsViewControllerWithSiteMetadataManager:autoFillQuirksManager:passwordWarningManager:", self->_siteMetadataManager, self->_autoFillQuirksManager, self->_passwordWarningManager);
      v26 = (SFRecentlyDeletedAccountsViewController *)objc_claimAutoreleasedReturnValue();
      v38 = v26;
      v27 = (void *)MEMORY[0x1E0C99D20];
      v28 = &v38;
    }
    else
    {
      if (!objc_msgSend(MEMORY[0x1E0D8AAA0], "isPasswordManagerRecentlyDeletedResourceDictionary:", v6))
      {
        v14 = 0;
        goto LABEL_28;
      }
      v26 = -[SFRecentlyDeletedAccountsViewController initWithAutoFillQuirksManager:]([SFRecentlyDeletedAccountsViewController alloc], "initWithAutoFillQuirksManager:", self->_autoFillQuirksManager);
      v37 = v26;
      v27 = (void *)MEMORY[0x1E0C99D20];
      v28 = &v37;
    }
    objc_msgSend(v27, "arrayWithObjects:count:", v28, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_27:

LABEL_28:
    goto LABEL_29;
  }
  v10 = v4 | v8;
  objc_msgSend(MEMORY[0x1E0D8AAA0], "valueForPasswordManagerResourceDictionary:key:", v6, *MEMORY[0x1E0D8B250]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SFAccountManagerViewController savedAccountControllerForQuery:queryBundleID:authenticationRequirementsMet:](self, "savedAccountControllerForQuery:queryBundleID:authenticationRequirementsMet:", v9, v11, v10);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (id)v12;
  if (!v12)
  {
LABEL_9:
    v14 = 0;
    goto LABEL_30;
  }
  v42[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_30:

  return v14;
}

- (id)viewControllerToPresentWithURLResourceDictionary:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;

  v4 = a3;
  if (objc_msgSend(MEMORY[0x1E0D8AAA0], "isOtpauthResourceDictionary:", v4))
  {
    -[_SFAccountManagerViewController viewControllerForOtpauthWithURLResourceDictionary:](self, "viewControllerForOtpauthWithURLResourceDictionary:", v4);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!objc_msgSend(MEMORY[0x1E0D8AAA0], "isOtpauthMigrationResourceDictionary:", v4))
    {
      v6 = 0;
      goto LABEL_7;
    }
    -[_SFAccountManagerViewController viewControllerForOtpauthMigrationWithURLResourceDictionary:](self, "viewControllerForOtpauthMigrationWithURLResourceDictionary:", v4);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;
LABEL_7:

  return v6;
}

- (id)viewControllerForOtpauthWithURLResourceDictionary:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("url"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLWithString:relativeToURL:", v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D8ACE8]), "initWithOTPAuthURL:", v6);
    if (v7)
    {
      -[_SFAccountManagerViewController viewControllerForTOTPGenerator:](self, "viewControllerForTOTPGenerator:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[_SFAccountManagerViewController _presentInvalidOtpauthURLAlert](self, "_presentInvalidOtpauthURLAlert");
      v8 = 0;
    }

  }
  else
  {
    -[_SFAccountManagerViewController _presentInvalidOtpauthURLAlert](self, "_presentInvalidOtpauthURLAlert");
    v8 = 0;
  }

  return v8;
}

- (id)viewControllerForTOTPGenerator:(id)a3
{
  id v4;
  SFAccountPickerConfiguration *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  SFAccountPickerViewController *v10;
  id v11;
  SFAccountPickerViewController *v12;
  _QWORD v14[5];
  id v15;

  v4 = a3;
  v5 = objc_alloc_init(SFAccountPickerConfiguration);
  _WBSLocalizedString();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFAccountPickerConfiguration setPrompt:](v5, "setPrompt:", v6);

  -[SFAccountPickerConfiguration setMinimumNumberOfCredentialsToShowLikelyMatchesSection:](v5, "setMinimumNumberOfCredentialsToShowLikelyMatchesSection:", 1);
  objc_msgSend(v4, "heuristicallyDeterminedServiceNameHints");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8)
  {
    objc_msgSend(v4, "heuristicallyDeterminedServiceNameHints");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFAccountPickerConfiguration setServiceNameHintStrings:](v5, "setServiceNameHintStrings:", v9);

  }
  v10 = [SFAccountPickerViewController alloc];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __66___SFAccountManagerViewController_viewControllerForTOTPGenerator___block_invoke;
  v14[3] = &unk_1E4AC00B0;
  v14[4] = self;
  v15 = v4;
  v11 = v4;
  v12 = -[SFAccountPickerViewController initWithConfiguration:completionHandler:](v10, "initWithConfiguration:completionHandler:", v5, v14);

  return v12;
}

- (id)viewControllerForOtpauthMigrationWithURLResourceDictionary:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  PMTOTPMigrationController *v7;
  PMTOTPMigrationController *totpMigrationController;
  PMTOTPMigrationController *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  UINavigationController *v14;
  id v16;
  void *v17;
  UINavigationController *v18;
  UINavigationController *totpMigrationNavigationController;

  v4 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("url"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLWithString:relativeToURL:", v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    goto LABEL_7;
  if (self->_totpMigrationNavigationController)
  {
LABEL_8:
    v14 = 0;
    goto LABEL_9;
  }
  v7 = (PMTOTPMigrationController *)objc_msgSend(objc_alloc(MEMORY[0x1E0D6C0A8]), "initWithMigrationURL:", v6);
  totpMigrationController = self->_totpMigrationController;
  self->_totpMigrationController = v7;

  v9 = self->_totpMigrationController;
  if (!v9)
  {
LABEL_7:
    -[_SFAccountManagerViewController _presentInvalidOtpauthMigrationURLAlert](self, "_presentInvalidOtpauthMigrationURLAlert");
    goto LABEL_8;
  }
  if (-[PMTOTPMigrationController numberOfCodes](v9, "numberOfCodes") == 1
    && (-[PMTOTPMigrationController totpGenerators](self->_totpMigrationController, "totpGenerators"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v10, "firstObject"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v11,
        v10,
        v11))
  {
    -[PMTOTPMigrationController totpGenerators](self->_totpMigrationController, "totpGenerators");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "firstObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SFAccountManagerViewController viewControllerForTOTPGenerator:](self, "viewControllerForTOTPGenerator:", v13);
    v14 = (UINavigationController *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[PMTOTPMigrationController setDelegate:](self->_totpMigrationController, "setDelegate:", self);
    v16 = objc_alloc(MEMORY[0x1E0DC3A40]);
    -[PMTOTPMigrationController viewController](self->_totpMigrationController, "viewController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (UINavigationController *)objc_msgSend(v16, "initWithRootViewController:", v17);
    totpMigrationNavigationController = self->_totpMigrationNavigationController;
    self->_totpMigrationNavigationController = v18;

    -[UINavigationController setModalPresentationStyle:](self->_totpMigrationNavigationController, "setModalPresentationStyle:", 2);
    v14 = self->_totpMigrationNavigationController;
  }
LABEL_9:

  return v14;
}

- (void)_presentInvalidOtpauthMigrationURLAlert
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];

  v3 = (void *)MEMORY[0x1E0DC3450];
  _WBSLocalizedString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "alertControllerWithTitle:message:preferredStyle:", v4, 0, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0DC3448];
  _WBSLocalizedString();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __74___SFAccountManagerViewController__presentInvalidOtpauthMigrationURLAlert__block_invoke;
  v9[3] = &unk_1E4AC0010;
  v9[4] = self;
  objc_msgSend(v6, "actionWithTitle:style:handler:", v7, 0, v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addAction:", v8);

  -[_SFAccountManagerViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v5, 1, 0);
}

- (void)_presentViewControllerForGroupIDIfPossible:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  SFSharedAccountsGroupInvitationViewController *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _SFAccountManagerViewController *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  _QWORD v23[4];
  SFSharedAccountsGroupInvitationViewController *v24;
  _QWORD v25[4];
  id v26;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D8AA48], "sharedProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cachedInvitations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __78___SFAccountManagerViewController__presentViewControllerForGroupIDIfPossible___block_invoke;
  v25[3] = &unk_1E4AC00D8;
  v22 = v4;
  v26 = v22;
  objc_msgSend(v6, "safari_firstObjectPassingTest:", v25);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = -[SFSharedAccountsGroupInvitationViewController initWithGroup:]([SFSharedAccountsGroupInvitationViewController alloc], "initWithGroup:", v8);
    -[SFSharedAccountsGroupInvitationViewController setDelegate:](v9, "setDelegate:", self);
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", v9);
    objc_msgSend(v10, "setModalPresentationStyle:", 2);
    -[_SFAccountManagerViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v10, 1, 0);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D8AA48], "sharedProvider");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "cachedGroups");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v7;
    v23[1] = 3221225472;
    v23[2] = __78___SFAccountManagerViewController__presentViewControllerForGroupIDIfPossible___block_invoke_2;
    v23[3] = &unk_1E4AC00D8;
    v24 = (SFSharedAccountsGroupInvitationViewController *)v22;
    objc_msgSend(v12, "safari_firstObjectPassingTest:", v23);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      v14 = -[_SFAccountManagerViewController initWithSiteMetadataManager:autoFillQuirksManager:persona:group:]([_SFAccountManagerViewController alloc], "initWithSiteMetadataManager:autoFillQuirksManager:persona:group:", self->_siteMetadataManager, self->_autoFillQuirksManager, 2, v13);
      -[_SFAccountManagerViewController navigationController](self, "navigationController");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "pushViewController:animated:", v14, 1);

    }
    else
    {
      v16 = (void *)MEMORY[0x1E0DC3450];
      objc_msgSend(MEMORY[0x1E0D6C058], "alertTitleForUnavailableGroup");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D6C058], "alertSubtitleForUnavailableGroup");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "alertControllerWithTitle:message:preferredStyle:", v17, v18, 1);
      v14 = (_SFAccountManagerViewController *)objc_claimAutoreleasedReturnValue();

      v19 = (void *)MEMORY[0x1E0DC3448];
      _WBSLocalizedString();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "actionWithTitle:style:handler:", v20, 0, 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFAccountManagerViewController addAction:](v14, "addAction:", v21);

      -[_SFAccountManagerViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v14, 1, 0);
    }

    v9 = v24;
  }

}

- (void)_presentDetailViewController:(id)a3
{
  void *v4;
  id obj;

  obj = a3;
  -[_SFAccountManagerViewController navigationController](self, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pushViewController:animated:", obj, 1);

  objc_storeWeak((id *)&self->_detailViewController, obj);
}

- (id)savedAccountControllerForQuery:(id)a3 queryBundleID:(id)a4 authenticationRequirementsMet:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  SFAccountDetailViewController *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v5 = a5;
  v25 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  -[_SFAccountTableViewController setSearchQuery:](self, "setSearchQuery:", v7);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[SFTableViewDiffableDataSource snapshot](self->_diffableDataSource, "snapshot", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "itemIdentifiers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v21;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v21 != v13)
          objc_enumerationMutation(v10);
        v15 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v14);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v8, "addObject:", v15);
        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v12);
  }

  if (v5 && objc_msgSend(v7, "length") && objc_msgSend(v8, "count") == 1)
  {
    objc_msgSend(v8, "firstObject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "savedAccount");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = -[SFAccountDetailViewController initWithSavedAccount:passwordWarning:options:]([SFAccountDetailViewController alloc], "initWithSavedAccount:passwordWarning:options:", v17, 0, -[_SFAccountManagerViewController _detailViewOptionsForSavedAccount:](self, "_detailViewOptionsForSavedAccount:", v17));
    -[SFAccountDetailViewController setDelegate:](v18, "setDelegate:", self);
    objc_storeWeak((id *)&self->_detailViewController, v18);

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (void)_presentDuplicateCodeGeneratorAlert
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];

  v3 = (void *)MEMORY[0x1E0DC3450];
  _WBSLocalizedString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _WBSLocalizedString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "alertControllerWithTitle:message:preferredStyle:", v4, v5, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0DC3448];
  _WBSLocalizedString();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __70___SFAccountManagerViewController__presentDuplicateCodeGeneratorAlert__block_invoke;
  v10[3] = &unk_1E4AC0010;
  v10[4] = self;
  objc_msgSend(v7, "actionWithTitle:style:handler:", v8, 0, v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addAction:", v9);

  -[_SFAccountManagerViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v6, 1, 0);
}

- (void)_presentInvalidOtpauthURLAlert
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];

  v3 = (void *)MEMORY[0x1E0DC3450];
  _WBSLocalizedString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _WBSLocalizedString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "alertControllerWithTitle:message:preferredStyle:", v4, v5, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0DC3448];
  _WBSLocalizedString();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __65___SFAccountManagerViewController__presentInvalidOtpauthURLAlert__block_invoke;
  v10[3] = &unk_1E4AC0010;
  v10[4] = self;
  objc_msgSend(v7, "actionWithTitle:style:handler:", v8, 0, v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addAction:", v9);

  -[_SFAccountManagerViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v6, 1, 0);
}

- (id)_sharableAccountFromResourceDictionary:(id)a3
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  BOOL v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = (void *)MEMORY[0x1E0D8AAA0];
  v4 = *MEMORY[0x1E0D8B240];
  v5 = a3;
  objc_msgSend(v3, "valueForPasswordManagerResourceDictionary:key:", v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D8AAA0], "valueForPasswordManagerResourceDictionary:key:", v5, *MEMORY[0x1E0D8B248]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v8 = v7 == 0;
  else
    v8 = 1;
  if (v8)
  {
    v12 = 0;
  }
  else
  {
    v9 = (void *)MEMORY[0x1E0D8A068];
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v6, 0);
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v7, 0);
    objc_msgSend(v9, "sharablePasswordFromEncryptedData:encryptionKeyReference:", v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v12;
}

- (id)_saveSharableAccount:(id)a3
{
  id v5;
  SFSharablePassword **p_receivedInvalidSharablePassword;
  SFSharablePassword *receivedInvalidSharablePassword;
  SFSharablePassword **p_receivedSharablePasswordRequiringPromptBeforeSaving;
  SFSharablePassword *receivedSharablePasswordRequiringPromptBeforeSaving;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  SFSharablePassword *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  SFSharablePassword *v21;
  SFSharablePassword *v22;
  _QWORD v24[4];
  SFSharablePassword *v25;
  id v26;
  id v27;

  v5 = a3;
  p_receivedInvalidSharablePassword = &self->_receivedInvalidSharablePassword;
  receivedInvalidSharablePassword = self->_receivedInvalidSharablePassword;
  self->_receivedInvalidSharablePassword = 0;

  p_receivedSharablePasswordRequiringPromptBeforeSaving = &self->_receivedSharablePasswordRequiringPromptBeforeSaving;
  receivedSharablePasswordRequiringPromptBeforeSaving = self->_receivedSharablePasswordRequiringPromptBeforeSaving;
  self->_receivedSharablePasswordRequiringPromptBeforeSaving = 0;

  if ((objc_msgSend(v5, "hasAnyCredentialData") & 1) != 0)
  {
    if (objc_msgSend(v5, "hasPasswordWithConflicts"))
    {
      objc_msgSend(v5, "username");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "password");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "highLevelDomain");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFTableViewDiffableDataSource snapshot](self->_diffableDataSource, "snapshot");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "itemIdentifiers");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __56___SFAccountManagerViewController__saveSharableAccount___block_invoke;
      v24[3] = &unk_1E4AC0100;
      v15 = v10;
      v25 = v15;
      v16 = v11;
      v26 = v16;
      v17 = v12;
      v27 = v17;
      objc_msgSend(v14, "safari_filterObjectsUsingBlock:", v24);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v18, "count"))
      {
        objc_msgSend(v18, "firstObject");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "savedAccount");
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v5, "savePasskeyAccountAndMergeIntoSavedPasswordAccountIfNeeded:", v20);
      }
      else
      {
        objc_storeStrong((id *)p_receivedSharablePasswordRequiringPromptBeforeSaving, a3);
        v20 = 0;
      }

    }
    else
    {
      objc_msgSend(v5, "saveToKeychain");
      v22 = (SFSharablePassword *)objc_claimAutoreleasedReturnValue();
      v15 = v22;
      if (v22)
      {
        v15 = v22;
        v20 = v15;
      }
      else
      {
        objc_storeStrong((id *)p_receivedInvalidSharablePassword, a3);
        v20 = 0;
      }
    }
  }
  else
  {
    v21 = (SFSharablePassword *)v5;
    v20 = 0;
    v15 = *p_receivedInvalidSharablePassword;
    *p_receivedInvalidSharablePassword = v21;
  }

  return v20;
}

- (void)showConflictAlertForSharablePasswordIfNecessary
{
  SFSharablePassword *receivedInvalidSharablePassword;
  SFSharablePassword *receivedSharablePasswordRequiringPromptBeforeSaving;
  SFSharablePassword *v5;

  receivedInvalidSharablePassword = self->_receivedInvalidSharablePassword;
  if (receivedInvalidSharablePassword)
  {
    self->_receivedInvalidSharablePassword = 0;
    v5 = receivedInvalidSharablePassword;

    -[_SFAccountManagerViewController _presentAlertForInvalidSharableAccount:](self, "_presentAlertForInvalidSharableAccount:", v5);
  }
  else
  {
    receivedSharablePasswordRequiringPromptBeforeSaving = self->_receivedSharablePasswordRequiringPromptBeforeSaving;
    if (!receivedSharablePasswordRequiringPromptBeforeSaving)
      return;
    self->_receivedSharablePasswordRequiringPromptBeforeSaving = 0;
    v5 = receivedSharablePasswordRequiringPromptBeforeSaving;

    -[_SFAccountManagerViewController _presentAlertForSharableAccountWithPasswordConflicts:](self, "_presentAlertForSharableAccountWithPasswordConflicts:", v5);
  }

}

- (void)_presentAlertForSharableAccountWithPasswordConflicts:(id)a3
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
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[5];
  id v20;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0DC3450];
  v6 = (void *)MEMORY[0x1E0CB3940];
  _WBSLocalizedString();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "username");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "highLevelDomain");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "alertControllerWithTitle:message:preferredStyle:", v10, 0, _SFDeviceAlertStyle());
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x1E0DC3448];
  _WBSLocalizedString();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __88___SFAccountManagerViewController__presentAlertForSharableAccountWithPasswordConflicts___block_invoke;
  v19[3] = &unk_1E4AC0128;
  v19[4] = self;
  v20 = v4;
  v14 = v4;
  objc_msgSend(v12, "actionWithTitle:style:handler:", v13, 0, v19);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)MEMORY[0x1E0DC3448];
  _WBSLocalizedString();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "actionWithTitle:style:handler:", v17, 1, &__block_literal_global_2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "addAction:", v18);
  objc_msgSend(v11, "addAction:", v15);
  -[_SFAccountManagerViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v11, 1, 0);

}

- (id)_saveSharableAccountWithPasswordConflicts:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  objc_msgSend(v4, "username");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "password");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "highLevelDomain");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SFAccountManagerViewController _accountCellDataForUser:highLevelDomain:](self, "_accountCellDataForUser:highLevelDomain:", v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "savedAccount");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D8AC08], "sharedStore");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "changeSavedAccount:toUser:password:", v9, v5, v6);

  objc_msgSend(v4, "savePasskeyAccountAndMergeIntoSavedPasswordAccountIfNeeded:", v9);
  return v9;
}

- (void)_presentAlertForInvalidSharableAccount:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = (void *)MEMORY[0x1E0DC3450];
  -[_SFAccountManagerViewController _alertTitleForInvalidSharableAccount:](self, "_alertTitleForInvalidSharableAccount:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "alertControllerWithTitle:message:preferredStyle:", v5, 0, 1);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0DC3448];
  _WBSLocalizedString();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "actionWithTitle:style:handler:", v7, 0, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addAction:", v8);

  -[_SFAccountManagerViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v9, 1, 0);
}

- (id)_alertTitleForInvalidSharableAccount:(id)a3
{
  objc_msgSend(a3, "passkeyCredential");

  _WBSLocalizedString();
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_accountCellDataForUser:(id)a3 highLevelDomain:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  -[SFTableViewDiffableDataSource snapshot](self->_diffableDataSource, "snapshot");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "itemIdentifiers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __75___SFAccountManagerViewController__accountCellDataForUser_highLevelDomain___block_invoke;
  v14[3] = &unk_1E4AC0088;
  v15 = v6;
  v16 = v7;
  v10 = v7;
  v11 = v6;
  objc_msgSend(v9, "safari_firstObjectPassingTest:", v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)updateUserAuthenticationState:(BOOL)a3
{
  if (self->_persona)
  {
    if (self->_hasBeenAuthenticated != a3)
    {
      self->_hasBeenAuthenticated = a3;
      -[_SFAccountManagerViewController _setUserInterfaceElementsEnabled:](self, "_setUserInterfaceElementsEnabled:");
      -[_SFAccountManagerViewController _reloadSavedAccountsAndTableViewData](self, "_reloadSavedAccountsAndTableViewData");
    }
  }
}

- (void)_setUserInterfaceElementsEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  id v7;

  v3 = a3;
  -[_SFAccountTableViewController searchController](self, "searchController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "searchBar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setUserInteractionEnabled:", v3);

  -[UIBarButtonItem setEnabled:](self->_ellipsisNavigationBarItem, "setEnabled:", v3);
  -[UIBarButtonItem setEnabled:](self->_editNavigationBarItem, "setEnabled:", v3);
  -[UIBarButtonItem setEnabled:](self->_addNavigationBarItem, "setEnabled:", v3);
  -[_SFAccountManagerViewController tableView](self, "tableView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setScrollEnabled:", v3);

}

- (void)dealloc
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  objc_super v10;

  if (self->_persona <= 1)
  {
    -[WBSAutoFillQuirksManager prepareForTermination](self->_autoFillQuirksManager, "prepareForTermination");
    -[_SFSiteMetadataManager savePendingProviderChangesBeforeTermination](self->_siteMetadataManager, "savePendingProviderChangesBeforeTermination");
  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0D8B490];
  objc_msgSend(MEMORY[0x1E0D8AC08], "sharedStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, v4, v5);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObserver:name:object:", self, *MEMORY[0x1E0DC48E8], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x1E0D46EC8];
  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObserver:name:object:", self, v8, v9);

  v10.receiver = self;
  v10.super_class = (Class)_SFAccountManagerViewController;
  -[_SFAccountTableViewController dealloc](&v10, sel_dealloc);
}

- (id)_autoFillFeatureManager
{
  SFAutoFillFeatureManager *autoFillFeatureManager;
  SFAutoFillFeatureManager *v4;
  SFAutoFillFeatureManager *v5;

  autoFillFeatureManager = self->_autoFillFeatureManager;
  if (!autoFillFeatureManager)
  {
    v4 = (SFAutoFillFeatureManager *)objc_alloc_init(MEMORY[0x1E0D8A020]);
    v5 = self->_autoFillFeatureManager;
    self->_autoFillFeatureManager = v4;

    autoFillFeatureManager = self->_autoFillFeatureManager;
  }
  return autoFillFeatureManager;
}

- (void)_showSharingGroupWelcomeView
{
  SFSharedAccountsGroupInvitationAcceptanceFlowNavigationController *v3;

  v3 = -[SFSharedAccountsGroupInvitationAcceptanceFlowNavigationController initWithGroup:autoFillQuirksManager:passwordWarningManager:]([SFSharedAccountsGroupInvitationAcceptanceFlowNavigationController alloc], "initWithGroup:autoFillQuirksManager:passwordWarningManager:", self->_sharedAccountsGroup, self->_autoFillQuirksManager, self->_passwordWarningManager);
  -[SFSharedAccountsGroupInvitationAcceptanceFlowNavigationController setModalPresentationStyle:](v3, "setModalPresentationStyle:", 2);
  -[_SFAccountManagerViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v3, 1, 0);

}

- (unint64_t)_detailViewOptionsForSavedAccount:(id)a3
{
  if (objc_msgSend(a3, "canUserEditSavedAccount"))
    return 3;
  else
    return 0;
}

- (void)_presentAddSavedAccountViewController:(id)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  _SFAccountManagerViewController *v8;
  _SFAccountManagerViewController *v9;
  UINavigationController *generatedPasswordsLogNavigationController;
  UINavigationController *v11;
  id v12;

  v12 = a3;
  objc_storeStrong((id *)&self->_addPasswordViewController, a3);
  -[SFAddSavedAccountViewController setDelegate:](self->_addPasswordViewController, "setDelegate:", self);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", self->_addPasswordViewController);
  objc_msgSend(v5, "setModalPresentationStyle:", 2);
  objc_msgSend(v5, "setModalInPresentation:", 1);
  +[_SFAccountManagerAppearanceValues preferredFormSheetContentSize](_SFAccountManagerAppearanceValues, "preferredFormSheetContentSize");
  objc_msgSend(v5, "setPreferredContentSize:");
  -[_SFAccountManagerViewController presentedViewController](self, "presentedViewController");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v6)
    v8 = (_SFAccountManagerViewController *)v6;
  else
    v8 = self;
  v9 = v8;

  generatedPasswordsLogNavigationController = self->_generatedPasswordsLogNavigationController;
  if (generatedPasswordsLogNavigationController)
  {
    v11 = generatedPasswordsLogNavigationController;

    v9 = (_SFAccountManagerViewController *)v11;
  }
  -[_SFAccountManagerViewController presentViewController:animated:completion:](v9, "presentViewController:animated:completion:", v5, 1, 0);

}

- (void)_addNewPassword:(id)a3
{
  SFAddSavedAccountViewController *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  SFAddSavedAccountViewController *v8;

  v4 = [SFAddSavedAccountViewController alloc];
  -[KCSharingGroup groupID](self->_sharedAccountsGroup, "groupID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[SFAddSavedAccountViewController initWithGroupID:](v4, "initWithGroupID:", v5);

  objc_msgSend(MEMORY[0x1E0D8A9E0], "sharedMonitor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "keychainSyncSettingValue");

  if (v7 <= 2)
    -[SFAddSavedAccountViewController setShouldPopulatePasswordFieldWithNewGeneratedStrongPassword:](v8, "setShouldPopulatePasswordFieldWithNewGeneratedStrongPassword:", (v7 & 7) == 2);
  -[_SFAccountManagerViewController _presentAddSavedAccountViewController:](self, "_presentAddSavedAccountViewController:", v8);

}

- (void)_cancelNavigationBarItemTapped:(id)a3
{
  -[_SFAccountManagerViewController setEditing:animated:](self, "setEditing:animated:", 0, 1);
}

- (void)_deleteButtonTapped:(id)a3
{
  void *v4;
  id v5;

  -[_SFAccountManagerViewController tableView](self, "tableView", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "indexPathsForSelectedRows");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SFAccountManagerViewController _presentAlertToConfirmDeletingAccountsAtIndexPaths:](self, "_presentAlertToConfirmDeletingAccountsAtIndexPaths:", v4);

}

- (void)_presentAlertToConfirmDeletingAccountsAtIndexPaths:(id)a3
{
  -[_SFAccountManagerViewController _presentAlertToConfirmDeletingAccountsAtIndexPaths:completionHandler:](self, "_presentAlertToConfirmDeletingAccountsAtIndexPaths:completionHandler:", a3, 0);
}

- (void)_presentAlertToConfirmDeletingAccountsAtIndexPaths:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t);
  void *v28;
  id v29;
  _QWORD v30[5];
  id v31;
  id v32;
  _QWORD v33[6];

  v6 = a3;
  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __104___SFAccountManagerViewController__presentAlertToConfirmDeletingAccountsAtIndexPaths_completionHandler___block_invoke;
  v33[3] = &unk_1E4AC0190;
  v33[4] = self;
  objc_msgSend(v6, "safari_mapObjectsUsingBlock:", v33);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C92668], "configurationForDeletingSavedAccounts:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x1E0DC3450];
  objc_msgSend(v10, "title");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "subtitle");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "alertControllerWithTitle:message:preferredStyle:", v12, v13, _SFDeviceAlertStyle());
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setAccessibilityIdentifier:", CFSTR("DeleteCredentialConfirmation"));

  v16 = (void *)MEMORY[0x1E0DC3448];
  objc_msgSend(v10, "buttonTitle");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v8;
  v30[1] = 3221225472;
  v30[2] = __104___SFAccountManagerViewController__presentAlertToConfirmDeletingAccountsAtIndexPaths_completionHandler___block_invoke_2;
  v30[3] = &unk_1E4AC01B8;
  v30[4] = self;
  v31 = v6;
  v18 = v7;
  v32 = v18;
  v19 = v6;
  objc_msgSend(v16, "actionWithTitle:style:handler:", v17, 2, v30);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addAction:", v20);

  v21 = (void *)MEMORY[0x1E0DC3448];
  _WBSLocalizedString();
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v8;
  v26 = 3221225472;
  v27 = __104___SFAccountManagerViewController__presentAlertToConfirmDeletingAccountsAtIndexPaths_completionHandler___block_invoke_3;
  v28 = &unk_1E4AC01E0;
  v29 = v18;
  v23 = v18;
  objc_msgSend(v21, "actionWithTitle:style:handler:", v22, 1, &v25);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addAction:", v24, v25, v26, v27, v28);

  -[_SFAccountManagerViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v14, 1, 0);
}

- (void)_updateDeleteButton
{
  void *v3;
  void *v4;
  _BOOL8 v5;

  -[_SFAccountManagerViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "indexPathsForSelectedRows");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count") != 0;

  -[UIBarButtonItem setEnabled:](self->_deleteNavigationBarItem, "setEnabled:", v5);
  -[UIBarButtonItem setEnabled:](self->_deleteToolbarItem, "setEnabled:", v5);
}

- (void)_editNavigationBarItemTapped:(id)a3
{
  if (self->_userIsEditingCellInTableView)
    -[_SFAccountManagerViewController _cancelEditing](self, "_cancelEditing", a3);
  -[_SFAccountManagerViewController setEditing:animated:](self, "setEditing:animated:", 1, 1);
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL4 v5;
  void *v7;
  void *v8;
  unint64_t persona;
  void *v10;
  UIBarButtonItem **p_cancelNavigationBarItem;
  void *v12;
  void *v13;
  void *v14;
  UIBarButtonItem *addNavigationBarItem;
  void *v16;
  UIBarButtonItem **p_ellipsisNavigationBarItem;
  _BOOL4 v18;
  UIBarButtonItem *v19;
  _BOOL4 v20;
  UIBarButtonItem *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  UIBarButtonItem *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _BOOL8 v33;
  uint64_t i;
  void *v35;
  void *v36;
  char v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  objc_super v49;
  const __CFString *v50;
  _BYTE v51[128];
  _QWORD v52[2];
  UIBarButtonItem *cancelNavigationBarItem;
  UIBarButtonItem *deleteNavigationBarItem;
  UIBarButtonItem *v55;
  _QWORD v56[2];
  UIBarButtonItem *v57;
  UIBarButtonItem *v58;
  UIBarButtonItem *editNavigationBarItem;
  UIBarButtonItem *ellipsisNavigationBarItem;
  _QWORD v61[2];
  _QWORD v62[2];
  UIBarButtonItem *v63;
  _QWORD v64[3];

  v4 = a4;
  v5 = a3;
  v64[1] = *MEMORY[0x1E0C80C00];
  v49.receiver = self;
  v49.super_class = (Class)_SFAccountManagerViewController;
  -[_SFAccountTableViewController setEditing:animated:](&v49, sel_setEditing_animated_);
  -[NSMutableSet removeAllObjects](self->_selectedSavedAccounts, "removeAllObjects");
  -[_SFAccountManagerViewController navigationItem](self, "navigationItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  persona = self->_persona;
  v44 = v7;
  if (!persona)
  {
    if (v5)
    {
      deleteNavigationBarItem = self->_deleteNavigationBarItem;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &deleteNavigationBarItem, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setLeftBarButtonItems:animated:", v12, v4);

      cancelNavigationBarItem = self->_cancelNavigationBarItem;
      p_cancelNavigationBarItem = &cancelNavigationBarItem;
      goto LABEL_10;
    }
    objc_msgSend(v7, "setLeftBarButtonItems:animated:", 0, v4);
    addNavigationBarItem = self->_addNavigationBarItem;
    v52[0] = self->_editNavigationBarItem;
    v52[1] = addNavigationBarItem;
    v16 = (void *)MEMORY[0x1E0C99D20];
    p_ellipsisNavigationBarItem = (UIBarButtonItem **)v52;
    goto LABEL_23;
  }
  if (persona != 2)
  {
    if (persona != 1)
    {
      -[_SFAccountManagerViewController _updateToolbarItemsAnimated:](self, "_updateToolbarItemsAnimated:", v4);
      if (!v5)
        goto LABEL_27;
      goto LABEL_12;
    }
    if (v5)
    {
      v64[0] = self->_deleteNavigationBarItem;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v64, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setLeftBarButtonItems:animated:", v10, v4);

      v63 = self->_cancelNavigationBarItem;
      p_cancelNavigationBarItem = &v63;
LABEL_10:
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", p_cancelNavigationBarItem, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setRightBarButtonItems:animated:", v14, v4);

      -[_SFAccountManagerViewController _updateToolbarItemsAnimated:](self, "_updateToolbarItemsAnimated:", v4);
LABEL_12:
      -[_SFAccountManagerViewController _updateDeleteButton](self, "_updateDeleteButton");
      goto LABEL_27;
    }
    v20 = -[_SFAccountManagerViewController _canAddPasswords](self, "_canAddPasswords");
    objc_msgSend(v8, "setLeftBarButtonItems:animated:", 0, v4);
    if (v20)
    {
      if (-[_SFAccountManagerViewController _shouldShowEllipsisNavigationItem](self, "_shouldShowEllipsisNavigationItem"))
      {
        v21 = self->_addNavigationBarItem;
        v62[0] = self->_ellipsisNavigationBarItem;
        v62[1] = v21;
        v16 = (void *)MEMORY[0x1E0C99D20];
        p_ellipsisNavigationBarItem = (UIBarButtonItem **)v62;
      }
      else
      {
        v25 = self->_addNavigationBarItem;
        v61[0] = self->_editNavigationBarItem;
        v61[1] = v25;
        v16 = (void *)MEMORY[0x1E0C99D20];
        p_ellipsisNavigationBarItem = (UIBarButtonItem **)v61;
      }
      goto LABEL_23;
    }
    objc_msgSend(MEMORY[0x1E0D8A970], "sharedStore");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "allUnexpiredGeneratedPasswords");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "count");

    if (v24)
    {
      ellipsisNavigationBarItem = self->_ellipsisNavigationBarItem;
      v16 = (void *)MEMORY[0x1E0C99D20];
      p_ellipsisNavigationBarItem = &ellipsisNavigationBarItem;
    }
    else
    {
      editNavigationBarItem = self->_editNavigationBarItem;
      v16 = (void *)MEMORY[0x1E0C99D20];
      p_ellipsisNavigationBarItem = &editNavigationBarItem;
    }
LABEL_25:
    v26 = 1;
    goto LABEL_26;
  }
  if (v5)
  {
    v58 = self->_deleteNavigationBarItem;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v58, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setLeftBarButtonItems:animated:", v13, v4);

    v57 = self->_cancelNavigationBarItem;
    p_cancelNavigationBarItem = &v57;
    goto LABEL_10;
  }
  v18 = -[_SFAccountManagerViewController _canAddPasswords](self, "_canAddPasswords");
  objc_msgSend(v8, "setLeftBarButtonItems:animated:", 0, v4);
  if (!v18)
  {
    v55 = self->_editNavigationBarItem;
    v16 = (void *)MEMORY[0x1E0C99D20];
    p_ellipsisNavigationBarItem = &v55;
    goto LABEL_25;
  }
  v19 = self->_addNavigationBarItem;
  v56[0] = self->_editNavigationBarItem;
  v56[1] = v19;
  v16 = (void *)MEMORY[0x1E0C99D20];
  p_ellipsisNavigationBarItem = (UIBarButtonItem **)v56;
LABEL_23:
  v26 = 2;
LABEL_26:
  objc_msgSend(v16, "arrayWithObjects:count:", p_ellipsisNavigationBarItem, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setRightBarButtonItems:animated:", v27, v4);

  -[_SFAccountManagerViewController _updateToolbarItemsAnimated:](self, "_updateToolbarItemsAnimated:", v4);
LABEL_27:
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  -[_SFAccountManagerViewController tableView](self, "tableView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "visibleCells");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
  if (v30)
  {
    v31 = v30;
    v32 = *(_QWORD *)v46;
    v33 = !v5;
    do
    {
      for (i = 0; i != v31; ++i)
      {
        if (*(_QWORD *)v46 != v32)
          objc_enumerationMutation(v29);
        v35 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v35, "savedAccount");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = objc_msgSend(v36, "canUserEditSavedAccount");

          if ((v37 & 1) == 0)
          {
            objc_msgSend(v35, "textLabel");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "setEnabled:", v33);

            objc_msgSend(v35, "detailTextLabel");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "setEnabled:", v33);

          }
        }
      }
      v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
    }
    while (v31);
  }

  -[SFTableViewDiffableDataSource snapshot](self->_diffableDataSource, "snapshot");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v40, "indexOfItemIdentifier:", CFSTR("sharedCredentialGroupEditGroup")) != 0x7FFFFFFFFFFFFFFFLL)
  {
    v50 = CFSTR("sharedCredentialGroupEditGroup");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v50, 1);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "reconfigureItemsWithIdentifiers:", v41);

  }
  objc_msgSend(v40, "reconfiguredItemIdentifiers");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = objc_msgSend(v42, "count");

  if (v43)
    -[SFTableViewDiffableDataSource applySnapshot:animatingDifferences:](self->_diffableDataSource, "applySnapshot:animatingDifferences:", v40, 1);

}

- (BOOL)_shouldShowSectionHeaders
{
  void *v3;
  uint64_t v4;
  BOOL result;
  KCSharingGroup *sharedAccountsGroup;
  WBSSavedAccountStore *savedAccountStore;
  void *v8;
  void *v9;
  unint64_t v10;

  if (!self->_hasBeenAuthenticated)
    return 0;
  -[_SFAccountTableViewController searchPattern](self, "searchPattern");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (v4)
    return 0;
  if (self->_hasEverShownSectionHeaders)
    return 1;
  sharedAccountsGroup = self->_sharedAccountsGroup;
  savedAccountStore = self->_savedAccountStore;
  if (sharedAccountsGroup)
  {
    -[KCSharingGroup groupID](sharedAccountsGroup, "groupID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBSSavedAccountStore highLevelDomainsOfSavedAccountsExcludingNeverSaveMarkerPasswordsForGroupID:](savedAccountStore, "highLevelDomainsOfSavedAccountsExcludingNeverSaveMarkerPasswordsForGroupID:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count");

  }
  else
  {
    -[WBSSavedAccountStore highLevelDomainsOfAllSavedAccountsExcludingNeverSaveMarkerPasswords](self->_savedAccountStore, "highLevelDomainsOfAllSavedAccountsExcludingNeverSaveMarkerPasswords");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "count");
  }

  if (v10 < 0xA)
    return self->_hasEverShownSectionHeaders;
  result = 1;
  self->_hasEverShownSectionHeaders = 1;
  return result;
}

- (void)setToolbarItems:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  unint64_t persona;
  BOOL v8;
  void *v9;
  objc_super v10;

  v4 = a4;
  v6 = a3;
  persona = self->_persona;
  if (persona)
    v8 = persona == 2;
  else
    v8 = 1;
  if (v8)
  {
    v10.receiver = self;
    v10.super_class = (Class)_SFAccountManagerViewController;
    -[_SFAccountManagerViewController setToolbarItems:animated:](&v10, sel_setToolbarItems_animated_, v6, v4);
  }
  else if (persona == 1)
  {
    -[_SFAccountManagerViewController parentViewController](self, "parentViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setToolbarItems:animated:", v6, v4);

  }
}

- (void)_updateToolbarItemsAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a3;
  v5 = (void *)MEMORY[0x1E0C99DE8];
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 5, 0, 0);
  -[_SFAccountManagerViewController _rightToolbarItem](self, "_rightToolbarItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "arrayWithObjects:", v6, v7, 0);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (-[_SFAccountManagerViewController isEditing](self, "isEditing"))
    objc_msgSend(v8, "insertObject:atIndex:", self->_deleteToolbarItem, 0);
  -[_SFAccountManagerViewController setToolbarItems:animated:](self, "setToolbarItems:animated:", v8, v3);

}

- (id)_rightToolbarItem
{
  char v3;
  int *v4;

  v3 = -[_SFAccountManagerViewController isEditing](self, "isEditing");
  v4 = &OBJC_IVAR____SFAccountManagerViewController__cancelToolbarItem;
  if ((v3 & 1) == 0 && !self->_userIsEditingCellInTableView)
    v4 = &OBJC_IVAR____SFAccountManagerViewController__editToolbarItem;
  return *(id *)((char *)&self->super.super.super.super.super.isa + *v4);
}

- (void)_cancelEditing
{
  -[_SFAccountManagerViewController setEditing:animated:](self, "setEditing:animated:", 0, 1);
}

- (void)_beginEditing
{
  -[_SFAccountManagerViewController setEditing:animated:](self, "setEditing:animated:", 1, 1);
}

- (BOOL)_canAddPasswords
{
  return objc_msgSend(MEMORY[0x1E0D4EC80], "shouldAllowAddingNewPasswords");
}

- (void)_managedConfigurationSettingsDidChange:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74___SFAccountManagerViewController__managedConfigurationSettingsDidChange___block_invoke;
  block[3] = &unk_1E4ABFE00;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

- (BOOL)dataSource:(id)a3 canEditRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  BOOL v9;

  v5 = a4;
  -[SFTableViewDiffableDataSource itemIdentifierForIndexPath:](self->_diffableDataSource, "itemIdentifierForIndexPath:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v9 = (objc_opt_isKindOfClass() & 1) != 0
    && (objc_msgSend(v6, "savedAccount"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "canUserEditSavedAccount"),
        v7,
        v8)
    && -[_SFAccountManagerViewController _isAccountCellAtIndexPath:](self, "_isAccountCellAtIndexPath:", v5);

  return v9;
}

- (int64_t)dataSource:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  SFTableViewDiffableDataSource *diffableDataSource;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int64_t v10;

  diffableDataSource = self->_diffableDataSource;
  v5 = a4;
  -[SFTableViewDiffableDataSource snapshot](diffableDataSource, "snapshot");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sectionIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "section");

  objc_msgSend(v7, "objectAtIndexedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "type") == 2;
  return v10;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  void *v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v9 = a5;
  v6 = (void *)MEMORY[0x1E0C99D20];
  v7 = a5;
  objc_msgSend(v6, "arrayWithObjects:count:", &v9, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[_SFAccountManagerViewController _presentAlertToConfirmDeletingAccountsAtIndexPaths:](self, "_presentAlertToConfirmDeletingAccountsAtIndexPaths:", v8, v9, v10);
}

- (void)tableView:(id)a3 didDeselectRowAtIndexPath:(id)a4
{
  void *v6;
  void *v7;
  NSMutableSet *selectedSavedAccounts;
  void *v9;
  id v10;

  v10 = a4;
  if (objc_msgSend(a3, "isEditing"))
  {
    -[_SFAccountManagerViewController tableView](self, "tableView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cellForRowAtIndexPath:", v10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      selectedSavedAccounts = self->_selectedSavedAccounts;
      objc_msgSend(v7, "savedAccount");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableSet removeObject:](selectedSavedAccounts, "removeObject:", v9);

      -[_SFAccountManagerViewController _updateDeleteButton](self, "_updateDeleteButton");
    }

  }
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v13;
  void *v14;
  char v15;
  void *v16;

  v6 = a3;
  v7 = a4;
  -[SFTableViewDiffableDataSource snapshot](self->_diffableDataSource, "snapshot");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sectionIdentifiers");
  v9 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v9, "objectAtIndexedSubscript:", objc_msgSend(v7, "section"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "type");

  switch(v11)
  {
    case 1:
    case 4:
    case 5:
    case 6:
      LOBYTE(v9) = objc_msgSend(v6, "isEditing") ^ 1;
      break;
    case 2:
      -[SFTableViewDiffableDataSource itemIdentifierForIndexPath:](self->_diffableDataSource, "itemIdentifierForIndexPath:", v7);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "savedAccount");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "canUserEditSavedAccount");

      if ((v15 & 1) != 0)
        LOBYTE(v9) = 1;
      else
        LOBYTE(v9) = objc_msgSend(v6, "isEditing") ^ 1;

      break;
    case 3:
      if ((objc_msgSend(v6, "isEditing") & 1) != 0)
      {
        LOBYTE(v9) = 0;
      }
      else
      {
        -[SFTableViewDiffableDataSource itemIdentifierForIndexPath:](self->_diffableDataSource, "itemIdentifierForIndexPath:", v7);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        LOBYTE(v9) = (objc_opt_isKindOfClass() & 1) == 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
                  || objc_msgSend(v16, "tipType") != 2
                  || !self->_isLoadingFamilyMembersFromFamilyTip;

      }
      break;
    default:
      break;
  }

  return v9 & 1;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  NSMutableSet *selectedSavedAccounts;
  void *v10;
  SFRecentlyDeletedAccountsViewController *v11;
  SFSharedAccountsGroupInvitationsListViewController *v12;
  void *v13;
  _SFAccountManagerViewController *v14;
  void *v15;
  unint64_t persona;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  SFAccountDetailViewController *v21;
  void *v22;
  uint64_t v23;
  id v24;

  v24 = a3;
  v6 = a4;
  if (objc_msgSend(v24, "isEditing"))
  {
    -[_SFAccountManagerViewController tableView](self, "tableView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "cellForRowAtIndexPath:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      selectedSavedAccounts = self->_selectedSavedAccounts;
      objc_msgSend(v8, "savedAccount");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableSet addObject:](selectedSavedAccounts, "addObject:", v10);

      -[_SFAccountManagerViewController _updateDeleteButton](self, "_updateDeleteButton");
    }
    goto LABEL_11;
  }
  -[SFTableViewDiffableDataSource itemIdentifierForIndexPath:](self->_diffableDataSource, "itemIdentifierForIndexPath:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v24, "deselectRowAtIndexPath:animated:", v6, 0);
    +[_SFPasswordAuditingViewController securityRecommendationsViewControllerWithSiteMetadataManager:autoFillQuirksManager:passwordWarningManager:](_SFPasswordAuditingViewController, "securityRecommendationsViewControllerWithSiteMetadataManager:autoFillQuirksManager:passwordWarningManager:", self->_siteMetadataManager, self->_autoFillQuirksManager, self->_passwordWarningManager);
    v11 = (SFRecentlyDeletedAccountsViewController *)objc_claimAutoreleasedReturnValue();
LABEL_6:
    v12 = (SFSharedAccountsGroupInvitationsListViewController *)v11;
LABEL_7:
    -[_SFAccountManagerViewController navigationController](self, "navigationController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "pushViewController:animated:", v12, 1);

LABEL_8:
    goto LABEL_11;
  }
  if (objc_msgSend(v8, "isEqual:", CFSTR("passwordOptionsDrillIn")))
  {
    objc_msgSend(v24, "deselectRowAtIndexPath:animated:", v6, 0);
    -[_SFAccountManagerViewController _didSelectAutoFillCellAtIndexPath:inTableView:](self, "_didSelectAutoFillCellAtIndexPath:inTableView:", v6, v24);
    goto LABEL_11;
  }
  if (objc_msgSend(v8, "isEqual:", CFSTR("sharedCredentialGroupInvitationsDrillInCell")))
  {
    objc_msgSend(v24, "deselectRowAtIndexPath:animated:", v6, 0);
    v12 = objc_alloc_init(SFSharedAccountsGroupInvitationsListViewController);
    -[SFSharedAccountsGroupInvitationsListViewController setDelegate:](v12, "setDelegate:", self);
    goto LABEL_7;
  }
  if ((objc_msgSend(v8, "isEqual:", CFSTR("myPasswords")) & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v24, "deselectRowAtIndexPath:animated:", v6, 0);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v12 = v8;
    else
      v12 = 0;
    v14 = -[_SFAccountManagerViewController initWithSiteMetadataManager:autoFillQuirksManager:persona:group:]([_SFAccountManagerViewController alloc], "initWithSiteMetadataManager:autoFillQuirksManager:persona:group:", self->_siteMetadataManager, self->_autoFillQuirksManager, 2, v12);
    -[_SFAccountManagerViewController navigationController](self, "navigationController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "pushViewController:animated:", v14, 1);

    goto LABEL_20;
  }
  if (objc_msgSend(v8, "isEqual:", CFSTR("recentlyDeleted")))
  {
    objc_msgSend(v24, "deselectRowAtIndexPath:animated:", v6, 0);
    persona = self->_persona;
    if (persona >= 2)
    {
      if (persona != 2)
      {
        v12 = 0;
        goto LABEL_7;
      }
      v11 = -[SFRecentlyDeletedAccountsViewController initWithAutoFillQuirksManager:group:]([SFRecentlyDeletedAccountsViewController alloc], "initWithAutoFillQuirksManager:group:", self->_autoFillQuirksManager, self->_sharedAccountsGroup);
    }
    else
    {
      v11 = -[SFRecentlyDeletedAccountsViewController initWithAutoFillQuirksManager:]([SFRecentlyDeletedAccountsViewController alloc], "initWithAutoFillQuirksManager:", self->_autoFillQuirksManager);
    }
    goto LABEL_6;
  }
  if (objc_msgSend(v8, "isEqual:", CFSTR("generatedPasswordsSearchResult")))
  {
    objc_msgSend(v24, "deselectRowAtIndexPath:animated:", v6, 0);
    -[_SFAccountManagerViewController _presentGeneratedPasswordsViewFilteredUsingSearchPattern:](self, "_presentGeneratedPasswordsViewFilteredUsingSearchPattern:", 1);
    goto LABEL_11;
  }
  -[SFTableViewDiffableDataSource snapshot](self->_diffableDataSource, "snapshot");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "sectionIdentifiers");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "objectAtIndexedSubscript:", objc_msgSend(v6, "section"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "type");

  switch(v20)
  {
    case 4:
      objc_msgSend(v24, "deselectRowAtIndexPath:animated:", v6, 0);
      -[_SFAccountManagerViewController _presentGroupManagementViewController](self, "_presentGroupManagementViewController");
      break;
    case 3:
      objc_msgSend(v24, "deselectRowAtIndexPath:animated:", v6, 0);
      -[SFTableViewDiffableDataSource itemIdentifierForIndexPath:](self->_diffableDataSource, "itemIdentifierForIndexPath:", v6);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "tipType");

      -[_SFAccountManagerViewController _userChoseToUseTip:](self, "_userChoseToUseTip:", v23);
      break;
    case 2:
      -[SFTableViewDiffableDataSource itemIdentifierForIndexPath:](self->_diffableDataSource, "itemIdentifierForIndexPath:", v6);
      v12 = (SFSharedAccountsGroupInvitationsListViewController *)objc_claimAutoreleasedReturnValue();
      -[SFSharedAccountsGroupInvitationsListViewController savedAccount](v12, "savedAccount");
      v14 = (_SFAccountManagerViewController *)objc_claimAutoreleasedReturnValue();
      v21 = -[SFAccountDetailViewController initWithSavedAccount:passwordWarning:options:]([SFAccountDetailViewController alloc], "initWithSavedAccount:passwordWarning:options:", v14, 0, -[_SFAccountManagerViewController _detailViewOptionsForSavedAccount:](self, "_detailViewOptionsForSavedAccount:", v14));
      -[SFAccountDetailViewController setDelegate:](v21, "setDelegate:", self);
      -[_SFAccountManagerViewController _presentDetailViewController:](self, "_presentDetailViewController:", v21);

LABEL_20:
      goto LABEL_8;
  }
LABEL_11:

}

- (BOOL)tableView:(id)a3 shouldBeginMultipleSelectionInteractionAtIndexPath:(id)a4
{
  return -[_SFAccountManagerViewController _isAccountCellAtIndexPath:](self, "_isAccountCellAtIndexPath:", a4);
}

- (void)tableView:(id)a3 didBeginMultipleSelectionInteractionAtIndexPath:(id)a4
{
  -[_SFAccountManagerViewController setEditing:animated:](self, "setEditing:animated:", 1, 1);
}

- (void)tableView:(id)a3 accessoryButtonTappedForRowWithIndexPath:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a4;
  -[SFTableViewDiffableDataSource snapshot](self->_diffableDataSource, "snapshot");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sectionIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndexedSubscript:", objc_msgSend(v10, "section"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[_SFAccountManagerViewController _sharedAccountsGroupManagementSectionIdentifier](self, "_sharedAccountsGroupManagementSectionIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = objc_msgSend(v7, "isEqual:", v8);

  if ((_DWORD)v6)
  {
    -[SFTableViewDiffableDataSource itemIdentifierForIndexPath:](self->_diffableDataSource, "itemIdentifierForIndexPath:", v10);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFAccountManagerViewController _presentGroupManagementViewController](self, "_presentGroupManagementViewController");

  }
}

- (void)_presentGroupManagementViewController
{
  -[_SFAccountManagerViewController _presentGroupManagementViewControllerForStartingAcceleratedAddMembersFlow:](self, "_presentGroupManagementViewControllerForStartingAcceleratedAddMembersFlow:", 0);
}

- (void)_presentGroupManagementViewControllerForStartingAcceleratedAddMembersFlow:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  id v7;

  v3 = a3;
  -[_SFAccountTableViewController searchController](self, "searchController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setActive:", 0);

  +[SFSharedAccountsGroupViewController groupManagementViewControllerForGroup:shouldStartAcceleratedAddMembersFlow:](SFSharedAccountsGroupViewController, "groupManagementViewControllerForGroup:shouldStartAcceleratedAddMembersFlow:", self->_sharedAccountsGroup, v3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDelegate:", self);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", v7);
  objc_msgSend(v6, "setModalPresentationStyle:", 2);
  +[_SFAccountManagerAppearanceValues preferredFormSheetContentSize](_SFAccountManagerAppearanceValues, "preferredFormSheetContentSize");
  objc_msgSend(v6, "setPreferredContentSize:");
  -[_SFAccountManagerViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v6, 1, 0);

}

- (id)_cellForIdentifier:(id)a3 tableView:(id)a4 indexPath:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  SFAccountManagerDrillInTableViewCellWithTrailingNumber *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  SFAccountTableViewCell *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  SFAccountManagerDrillInTableViewCellWithTrailingNumber *v23;
  id v24;
  void *v25;
  void *v26;
  SFAccountManagerDrillInTableViewCellWithTrailingNumber *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  NSMutableSet *selectedSavedAccounts;
  void *v39;
  void *v40;
  void *v41;
  void *v43;
  void *v44;
  void *v45;
  SFSharedAccountsGroupHeaderTableViewCell *v46;
  WBSSavedAccountStore *savedAccountStore;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  SFAccountManagerDrillInTableViewCellWithTrailingNumber *v53;
  void *v54;
  void *v55;
  void *v56;
  SFAccountManagerDrillInTableViewCellWithTrailingNumber *v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  _BOOL8 v62;
  unint64_t persona;
  void *v64;
  void *v65;
  void *v66;
  uint64_t v67;
  KCSharingGroup *sharedAccountsGroup;
  void *v69;
  void *v70;

  v7 = a3;
  v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = v7;
    objc_msgSend(v8, "dequeueReusableCellWithIdentifier:", CFSTR("securityRecommendations"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
      v12 = v10;
    else
      v12 = -[SFAccountManagerDrillInTableViewCellWithTrailingNumber initWithStyle:reuseIdentifier:]([SFAccountManagerDrillInTableViewCellWithTrailingNumber alloc], "initWithStyle:reuseIdentifier:", 0, CFSTR("securityRecommendations"));
    v14 = v12;

    v18 = objc_msgSend(v9, "numberOfWarnings");
    objc_msgSend(v9, "subtitleText");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v9, "warningStyle");

    objc_msgSend(v14, "configureForSecurityRecommendationsWithNumberOfRecommendations:subtitleText:warningStyle:", v18, v19, v20);
    goto LABEL_30;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && objc_msgSend(v7, "isEqualToString:", CFSTR("passwordOptionsDrillIn")))
  {
    -[_SFAccountManagerViewController _passwordOptionsCellForTableView:](self, "_passwordOptionsCellForTableView:", v8);
    v13 = objc_claimAutoreleasedReturnValue();
LABEL_7:
    v14 = (id)v13;
    goto LABEL_30;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v8, "dequeueReusableCellWithIdentifier:", CFSTR("savedAccount"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15)
      v17 = v15;
    else
      v17 = -[SFAccountTableViewCell initWithStyle:reuseIdentifier:]([SFAccountTableViewCell alloc], "initWithStyle:reuseIdentifier:", 3, CFSTR("savedAccount"));
    v14 = v17;

    v24 = v7;
    objc_msgSend(v14, "setDelegate:", self);
    if (self->_persona == 2)
    {
      v28 = 0;
    }
    else
    {
      objc_msgSend(v24, "savedAccount");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v29, "hasSameUsernameAndHighLevelDomainAsOtherSharedSavedAccounts");

    }
    objc_msgSend(v24, "savedAccount");
    v30 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "searchPattern");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setSavedAccount:searchPattern:emphasizeUserName:shouldDifferentiateWithGroupName:", v30, v31, 0, v28);

    objc_msgSend(v14, "setAccessoryType:", 1);
    objc_msgSend(v24, "savedAccount");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v30) = objc_msgSend(v32, "canUserEditSavedAccount");

    if ((v30 & 1) != 0)
    {
      objc_msgSend(v14, "textLabel");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = 1;
      objc_msgSend(v33, "setEnabled:", 1);

    }
    else
    {
      v35 = -[_SFAccountManagerViewController isEditing](self, "isEditing") ^ 1;
      objc_msgSend(v14, "textLabel");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "setEnabled:", v35);

      v34 = -[_SFAccountManagerViewController isEditing](self, "isEditing") ^ 1;
    }
    objc_msgSend(v14, "detailTextLabel");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setEnabled:", v34);

    selectedSavedAccounts = self->_selectedSavedAccounts;
    objc_msgSend(v24, "savedAccount");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(selectedSavedAccounts) = -[NSMutableSet containsObject:](selectedSavedAccounts, "containsObject:", v39);

    if (!(_DWORD)selectedSavedAccounts)
      goto LABEL_29;
    -[_SFAccountManagerViewController tableView](self, "tableView");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFTableViewDiffableDataSource indexPathForItemIdentifier:](self->_diffableDataSource, "indexPathForItemIdentifier:", v24);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "selectRowAtIndexPath:animated:scrollPosition:", v41, 0, 0);

LABEL_28:
LABEL_29:

    goto LABEL_30;
  }
  if (objc_msgSend(v7, "isEqual:", CFSTR("sharedCredentialGroupInvitationsDrillInCell")))
  {
    objc_msgSend(v8, "dequeueReusableCellWithIdentifier:", CFSTR("sharedCredentialGroupInvitationsDrillInCell"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (v21)
      v23 = v21;
    else
      v23 = -[SFAccountManagerDrillInTableViewCellWithTrailingNumber initWithStyle:reuseIdentifier:]([SFAccountManagerDrillInTableViewCellWithTrailingNumber alloc], "initWithStyle:reuseIdentifier:", 0, CFSTR("sharedCredentialGroupInvitationsDrillInCell"));
    v14 = v23;

    if (self->_persona <= 1)
      objc_msgSend(v14, "configureGroupInvitationsDrillInWithNumberOfInvitations:", -[NSArray count](self->_allSharedAccountsGroupsInvitations, "count"));
    goto LABEL_30;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v24 = v7;
    objc_msgSend(v8, "dequeueReusableCellWithIdentifier:", CFSTR("drillInCellWithTrailingNumber"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v25;
    if (v25)
      v27 = v25;
    else
      v27 = -[SFAccountManagerDrillInTableViewCellWithTrailingNumber initWithStyle:reuseIdentifier:]([SFAccountManagerDrillInTableViewCellWithTrailingNumber alloc], "initWithStyle:reuseIdentifier:", 0, CFSTR("drillInCellWithTrailingNumber"));
    v14 = v27;

    savedAccountStore = self->_savedAccountStore;
    objc_msgSend(v24, "groupID");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBSSavedAccountStore savedAccountsForGroupID:](savedAccountStore, "savedAccountsForGroupID:", v48);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = objc_msgSend(v49, "count");

    if (self->_persona <= 1)
      objc_msgSend(v14, "configureCellWithGroup:numberOfSavedAccounts:", v24, v50);
    goto LABEL_29;
  }
  if (objc_msgSend(v7, "isEqual:", CFSTR("sharedCredentialGroupHeader")))
  {
    -[_SFAccountManagerViewController tableView](self, "tableView");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "dequeueReusableCellWithIdentifier:", CFSTR("sharedCredentialGroupHeader"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = v44;
    if (v44)
      v46 = v44;
    else
      v46 = -[SFSharedAccountsGroupHeaderTableViewCell initWithStyle:reuseIdentifier:]([SFSharedAccountsGroupHeaderTableViewCell alloc], "initWithStyle:reuseIdentifier:", 0, CFSTR("sharedCredentialGroupHeader"));
    v14 = v46;

    objc_msgSend(v14, "configureWithGroup:", self->_sharedAccountsGroup);
    goto LABEL_30;
  }
  if (objc_msgSend(v7, "isEqual:", CFSTR("sharedCredentialGroupEditGroup")))
  {
    -[_SFAccountManagerViewController _sharedCredentialsGroupEditCellForGroup:](self, "_sharedCredentialsGroupEditCellForGroup:", self->_sharedAccountsGroup);
    v13 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  if (objc_msgSend(v7, "isEqual:", CFSTR("myPasswords")))
  {
    objc_msgSend(v8, "dequeueReusableCellWithIdentifier:", CFSTR("drillInCellWithTrailingNumber"));
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = v51;
    if (v51)
      v53 = v51;
    else
      v53 = -[SFAccountManagerDrillInTableViewCellWithTrailingNumber initWithStyle:reuseIdentifier:]([SFAccountManagerDrillInTableViewCellWithTrailingNumber alloc], "initWithStyle:reuseIdentifier:", 0, CFSTR("drillInCellWithTrailingNumber"));
    v14 = v53;

    -[WBSSavedAccountStore savedAccountsInPersonalKeychainExcludingNeverSaveMarkerPasswords](self->_savedAccountStore, "savedAccountsInPersonalKeychainExcludingNeverSaveMarkerPasswords");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = objc_msgSend(v59, "count");

    objc_msgSend(v14, "configureCellWithGroup:numberOfSavedAccounts:", 0, v60);
    goto LABEL_30;
  }
  if (objc_msgSend(v7, "isEqual:", CFSTR("recentlyDeleted")))
  {
    -[_SFAccountManagerViewController tableView](self, "tableView");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "dequeueReusableCellWithIdentifier:", CFSTR("drillInCellWithTrailingNumber"));
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = v55;
    if (v55)
      v57 = v55;
    else
      v57 = -[SFAccountManagerDrillInTableViewCellWithTrailingNumber initWithStyle:reuseIdentifier:]([SFAccountManagerDrillInTableViewCellWithTrailingNumber alloc], "initWithStyle:reuseIdentifier:", 0, CFSTR("drillInCellWithTrailingNumber"));
    v14 = v57;

    persona = self->_persona;
    if (persona >= 2)
    {
      if (persona != 2)
      {
        v67 = 0;
LABEL_71:
        objc_msgSend(v14, "configureForRecentlyDeletedWithNumberOfRecentlyDeletedAccounts:", v67);
        goto LABEL_30;
      }
      sharedAccountsGroup = self->_sharedAccountsGroup;
      objc_msgSend(MEMORY[0x1E0D8AC08], "sharedStore");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      v64 = v69;
      if (sharedAccountsGroup)
      {
        -[KCSharingGroup groupID](self->_sharedAccountsGroup, "groupID");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v64, "recentlyDeletedSavedAccountsForGroupWithID:", v66);
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        v67 = objc_msgSend(v70, "count");

        goto LABEL_68;
      }
      objc_msgSend(v69, "recentlyDeletedSavedAccountsInPersonalKeychain");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D8AC08], "sharedStore");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "allRecentlyDeletedSavedAccounts");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v66 = v65;
    v67 = objc_msgSend(v65, "count");
LABEL_68:

    goto LABEL_71;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (!objc_msgSend(v7, "isEqual:", CFSTR("generatedPasswordsSearchResult")))
      {
        v14 = 0;
        goto LABEL_30;
      }
      -[_SFAccountManagerViewController _generatedPasswordSearchResultsCellForTableView:](self, "_generatedPasswordSearchResultsCellForTableView:", v8);
      v13 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
    objc_msgSend(v8, "dequeueReusableCellWithIdentifier:", CFSTR("sharedCredentialTipButton"));
    v14 = (id)objc_claimAutoreleasedReturnValue();
    v61 = objc_msgSend(v7, "tipType");
    v62 = v61 != 2 || !self->_isLoadingFamilyMembersFromFamilyTip;
    objc_msgSend(MEMORY[0x1E0C92600], "contentForTipType:", v61);
    v24 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "buttonTitle");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "configureWithButtonTitle:leadingContentInset:isEnabled:", v40, +[SFAccountManagerTipContentCell contentInset](SFAccountManagerTipContentCell, "contentInset"), v62);
    goto LABEL_28;
  }
  objc_msgSend(v8, "dequeueReusableCellWithIdentifier:", CFSTR("sharedCredentialTipPlatter"));
  v14 = (id)objc_claimAutoreleasedReturnValue();
  v58 = objc_msgSend(v7, "tipType");
  objc_msgSend(v14, "configureForTip:", v58);
  objc_msgSend(v14, "setDelegate:", self);
  if (v58 == 2 && self->_isLoadingFamilyMembersFromFamilyTip)
    objc_msgSend(v14, "setShowingActivityIndicator:", 1);

LABEL_30:
  return v14;
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

  -[_SFAccountManagerViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v7, 1, 0);
}

- (id)_sharedCredentialsGroupEditCellForGroup:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;

  objc_msgSend(MEMORY[0x1E0DC39A8], "cellConfiguration", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _WBSLocalizedString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setText:", v5);

  if (-[_SFAccountManagerViewController isEditing](self, "isEditing"))
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  else
    +[_SFAccountManagerAppearanceValues buttonCellTextColor](_SFAccountManagerAppearanceValues, "buttonCellTextColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "textProperties");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setColor:", v6);

  -[_SFAccountManagerViewController tableView](self, "tableView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dequeueReusableCellWithIdentifier:", CFSTR("sharedCredentialGroupEditGroup"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
    v11 = v9;
  else
    v11 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 0, CFSTR("sharedCredentialGroupEditGroup"));
  v12 = v11;

  objc_msgSend(v12, "setContentConfiguration:", v4);
  return v12;
}

- (void)_setAccessibilityIdentifiersOnAccountCell:(id)a3
{
  id v3;
  int v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[3];
  _QWORD v16[4];

  v16[3] = *MEMORY[0x1E0C80C00];
  v15[0] = CFSTR("monogram");
  v3 = a3;
  v4 = objc_msgSend(v3, "isIconMonogram");
  v5 = CFSTR("false");
  if (v4)
    v5 = CFSTR("true");
  v16[0] = v5;
  v15[1] = CFSTR("domain");
  objc_msgSend(v3, "textLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "text");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v7;
  v15[2] = CFSTR("username");
  objc_msgSend(v3, "detailTextLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "text");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  WBSMakeAccessibilityIdentifier();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityIdentifier:", v11);

  objc_msgSend(v3, "textLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setAccessibilityIdentifier:", CFSTR("Passwords List Cell Domain"));

  objc_msgSend(v3, "detailTextLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setAccessibilityIdentifier:", CFSTR("Passwords List Cell Username"));

  objc_msgSend(v3, "imageView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "setAccessibilityIdentifier:", CFSTR("Passwords List Cell Icon"));
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  id v15;
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
  void *v27;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  _QWORD v43[6];

  v43[4] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[SFTableViewDiffableDataSource snapshot](self->_diffableDataSource, "snapshot");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sectionIdentifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndexedSubscript:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "footerText");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v6, "dequeueReusableHeaderFooterViewWithIdentifier:", CFSTR("sectionFooter"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v10 = v11;
      objc_msgSend(v11, "contentView");
      v12 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "subviews");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "firstObject");
      v14 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D78]), "initWithReuseIdentifier:", CFSTR("sectionFooter"));
      v15 = objc_alloc_init(MEMORY[0x1E0DC3990]);
      objc_msgSend(v15, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      objc_msgSend(v15, "setNumberOfLines:", 0);
      objc_msgSend(MEMORY[0x1E0DC37E8], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AB8]);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setFont:", v16);

      objc_msgSend(v15, "setAdjustsFontForContentSizeCategory:", 1);
      objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setTextColor:", v17);

      v14 = v15;
      objc_msgSend(v10, "contentView");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "addSubview:", v14);

      v33 = (void *)MEMORY[0x1E0CB3718];
      objc_msgSend(v14, "topAnchor");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "contentView");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "topAnchor");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v39, 1.0);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v43[0] = v38;
      objc_msgSend(v14, "leadingAnchor");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "contentView");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "layoutMarginsGuide");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "leadingAnchor");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "constraintEqualToAnchor:", v34);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v43[1] = v32;
      objc_msgSend(v14, "trailingAnchor");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "contentView");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "layoutMarginsGuide");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "trailingAnchor");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "constraintEqualToAnchor:", v19);
      v42 = v6;
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v43[2] = v20;
      objc_msgSend(v14, "bottomAnchor");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "contentView");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "bottomAnchor");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "constraintEqualToAnchor:constant:", v23, -17.0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v43[3] = v24;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 4);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "activateConstraints:", v25);

      v6 = v42;
      v12 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
      objc_msgSend(v42, "backgroundColor");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setBackgroundColor:", v26);

      objc_msgSend(v10, "setBackgroundView:", v12);
    }

    objc_msgSend(v9, "footerText");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setText:", v27);

  }
  return v10;
}

- (void)tableView:(id)a3 willBeginEditingRowAtIndexPath:(id)a4
{
  id v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_SFAccountManagerViewController;
  v6 = a3;
  -[_SFAccountTableViewController tableView:willBeginEditingRowAtIndexPath:](&v7, sel_tableView_willBeginEditingRowAtIndexPath_, v6, a4);
  self->_userIsEditingCellInTableView = 1;
  objc_msgSend(v6, "setAllowsMultipleSelectionDuringEditing:", 0, v7.receiver, v7.super_class);

}

- (void)tableView:(id)a3 didEndEditingRowAtIndexPath:(id)a4
{
  id v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_SFAccountManagerViewController;
  v6 = a3;
  -[_SFAccountTableViewController tableView:didEndEditingRowAtIndexPath:](&v7, sel_tableView_didEndEditingRowAtIndexPath_, v6, a4);
  objc_msgSend(v6, "setAllowsMultipleSelectionDuringEditing:", 1, v7.receiver, v7.super_class);

  self->_userIsEditingCellInTableView = 0;
  -[_SFAccountManagerViewController _updateToolbarItemsAnimated:](self, "_updateToolbarItemsAnimated:", 1);
  -[_SFAccountManagerViewController setEditing:animated:](self, "setEditing:animated:", 0, 1);
}

- (void)handleContextMenuDeleteForIndexPath:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", &v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[_SFAccountManagerViewController _presentAlertToConfirmDeletingAccountsAtIndexPaths:](self, "_presentAlertToConfirmDeletingAccountsAtIndexPaths:", v6, v7, v8);
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

- (void)tableView:(id)a3 willDisplayHeaderView:(id)a4 forSection:(int64_t)a5
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
    objc_msgSend(v9, "backgroundColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setBackgroundColor:", v8);

    objc_msgSend(v6, "setBackgroundView:", v7);
  }

}

- (void)tableView:(id)a3 willDisplayFooterView:(id)a4 forSection:(int64_t)a5
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
    objc_msgSend(v9, "backgroundColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setBackgroundColor:", v8);

    objc_msgSend(v6, "setBackgroundView:", v7);
  }

}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  void *v5;
  void *v6;
  void *v7;

  -[SFTableViewDiffableDataSource snapshot](self->_diffableDataSource, "snapshot", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sectionIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndexedSubscript:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "type");

  return *MEMORY[0x1E0DC53D8];
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  double *v10;
  double result;
  _BOOL4 v12;

  -[SFTableViewDiffableDataSource snapshot](self->_diffableDataSource, "snapshot", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sectionIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndexedSubscript:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "type");

  if ((unint64_t)(v9 - 3) < 3)
  {
    v10 = (double *)MEMORY[0x1E0DC53D8];
    return *v10;
  }
  if (v9 != 2)
  {
    result = 0.0;
    if (v9 != 1)
      return result;
    v10 = (double *)&SFAccountListEmptyHeaderFooterHeight;
    return *v10;
  }
  v12 = -[_SFAccountManagerViewController _shouldShowGeneratedPasswordSearchResultItem](self, "_shouldShowGeneratedPasswordSearchResultItem");
  result = 17.0;
  if (!v12)
    return 0.0;
  return result;
}

- (id)tableView:(id)a3 trailingSwipeActionsConfigurationForRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, uint64_t, uint64_t, void *);
  void *v20;
  _SFAccountManagerViewController *v21;
  id v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  -[SFTableViewDiffableDataSource snapshot](self->_diffableDataSource, "snapshot");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sectionIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndexedSubscript:", objc_msgSend(v5, "section"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "type");

  if (v9 == 2)
  {
    _WBSLocalizedString();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)MEMORY[0x1E0DC36C8];
    v17 = MEMORY[0x1E0C809B0];
    v18 = 3221225472;
    v19 = __96___SFAccountManagerViewController_tableView_trailingSwipeActionsConfigurationForRowAtIndexPath___block_invoke;
    v20 = &unk_1E4AC0208;
    v21 = self;
    v22 = v5;
    objc_msgSend(v11, "contextualActionWithStyle:title:handler:", 1, v10, &v17);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)MEMORY[0x1E0DC3D08];
    v23[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1, v17, v18, v19, v20, v21);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "configurationWithActions:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "setPerformsFirstActionWithFullSwipe:", 0);
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (BOOL)tableView:(id)a3 shouldDrawTopSeparatorForSection:(int64_t)a4
{
  return -[_SFAccountManagerViewController _sectionWithIndexIsConfigurationSection:](self, "_sectionWithIndexIsConfigurationSection:", a4);
}

- (BOOL)tableView:(id)a3 shouldDrawBottomSeparatorForSection:(int64_t)a4
{
  return -[_SFAccountManagerViewController _sectionWithIndexIsConfigurationSection:](self, "_sectionWithIndexIsConfigurationSection:", a4);
}

- (BOOL)tableView:(id)a3 shouldHaveFullLengthTopSeparatorForSection:(int64_t)a4
{
  return -[_SFAccountManagerViewController _sectionWithIndexIsConfigurationSection:](self, "_sectionWithIndexIsConfigurationSection:", a4);
}

- (BOOL)tableView:(id)a3 shouldHaveFullLengthBottomSeparatorForSection:(int64_t)a4
{
  return -[_SFAccountManagerViewController _sectionWithIndexIsConfigurationSection:](self, "_sectionWithIndexIsConfigurationSection:", a4);
}

- (BOOL)_sectionWithIndexIsConfigurationSection:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;

  -[SFTableViewDiffableDataSource snapshot](self->_diffableDataSource, "snapshot");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sectionIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "type") != 2;

  return v7;
}

- (BOOL)_isAccountCellAtIndexPath:(id)a3
{
  SFTableViewDiffableDataSource *diffableDataSource;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  diffableDataSource = self->_diffableDataSource;
  v4 = a3;
  -[SFTableViewDiffableDataSource snapshot](diffableDataSource, "snapshot");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sectionIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "section");

  objc_msgSend(v6, "objectAtIndexedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v5) = objc_msgSend(v8, "type") == 2;
  return (char)v5;
}

- (void)addSavedAccountViewControllerDidFinish:(id)a3 withSavedAccount:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __91___SFAccountManagerViewController_addSavedAccountViewControllerDidFinish_withSavedAccount___block_invoke;
  v8[3] = &unk_1E4ABFB20;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  objc_msgSend(a3, "dismissViewControllerAnimated:completion:", 1, v8);

}

- (id)dataSource:(id)a3 headerTextForSection:(int64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _BOOL4 v12;
  void *v13;

  -[SFTableViewDiffableDataSource snapshot](self->_diffableDataSource, "snapshot", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sectionIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndexedSubscript:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[SFTableViewDiffableDataSource snapshot](self->_diffableDataSource, "snapshot");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "itemIdentifiersInSectionWithIdentifier:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  v12 = -[_SFAccountManagerViewController _shouldShowSectionHeaders](self, "_shouldShowSectionHeaders");
  v13 = 0;
  if (v12 && v11)
  {
    objc_msgSend(v8, "headerText");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

- (id)sectionIndexTitlesForDataSource:(id)a3
{
  void *v3;
  void *v4;

  if (-[_SFAccountManagerViewController _shouldShowSectionHeaders](self, "_shouldShowSectionHeaders", a3))
  {
    objc_msgSend(MEMORY[0x1E0DC39C0], "currentCollation");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "sectionIndexTitles");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (int64_t)dataSource:(id)a3 sectionForSectionIndexTitle:(id)a4 atIndex:(int64_t)a5
{
  void *v7;
  uint64_t v8;
  int64_t v9;

  objc_msgSend(MEMORY[0x1E0DC39C0], "currentCollation", a3, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "sectionForSectionIndexTitleAtIndex:", a5);
  v9 = -[_SFAccountManagerViewController _indexOfFirstPasswordSection](self, "_indexOfFirstPasswordSection") + v8;

  return v9;
}

- (void)searchPatternDidUpdate
{
  -[_SFAccountManagerViewController _updateGeneratedPasswordsMatchingSearchPattern](self, "_updateGeneratedPasswordsMatchingSearchPattern");
  -[_SFAccountManagerViewController _reloadSavedAccounts](self, "_reloadSavedAccounts");
  -[_SFAccountManagerViewController _updateContentUnavailableView](self, "_updateContentUnavailableView");
}

- (void)_updateNavigationBarItems
{
  unint64_t persona;
  void *v4;
  void *v5;
  KCSharingGroup *sharedAccountsGroup;
  WBSSavedAccountStore *savedAccountStore;
  void *v8;
  void *v9;
  id v10;

  persona = self->_persona;
  if (persona < 2)
  {
    -[WBSSavedAccountStore savedAccounts](self->_savedAccountStore, "savedAccounts");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_3;
  }
  if (persona == 2)
  {
    sharedAccountsGroup = self->_sharedAccountsGroup;
    savedAccountStore = self->_savedAccountStore;
    if (sharedAccountsGroup)
    {
      -[KCSharingGroup groupID](sharedAccountsGroup, "groupID");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[WBSSavedAccountStore savedAccountsForGroupID:](savedAccountStore, "savedAccountsForGroupID:", v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIBarButtonItem setEnabled:](self->_editNavigationBarItem, "setEnabled:", objc_msgSend(v8, "count") != 0);

      goto LABEL_7;
    }
    -[WBSSavedAccountStore savedAccountsInPersonalKeychainExcludingNeverSaveMarkerPasswords](self->_savedAccountStore, "savedAccountsInPersonalKeychainExcludingNeverSaveMarkerPasswords");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_3:
    v5 = v4;
    -[UIBarButtonItem setEnabled:](self->_editNavigationBarItem, "setEnabled:", objc_msgSend(v4, "count") != 0);
LABEL_7:

  }
  -[SFTableViewDiffableDataSource snapshot](self->_diffableDataSource, "snapshot");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "itemIdentifiers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIBarButtonItem setEnabled:](self->_editToolbarItem, "setEnabled:", objc_msgSend(v9, "safari_containsObjectPassingTest:", &__block_literal_global_307));

}

- (void)_reloadSavedAccountsAndTableViewData
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_1A3B2D000, v0, v1, "Reloading passwords and table view data.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_reloadSavedAccounts
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_1A3B2D000, v0, v1, "Reloading password data.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_addItemsAboveAccountListForTopLevelAccountManagerToSnapshot:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  SFTipPlatterItem *v9;
  SFTipButtonItem *v10;
  void *v11;
  _QWORD v12[2];
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_SFAccountTableViewController searchPattern](self, "searchPattern");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  if (!v6)
  {
    -[_SFAccountManagerViewController _addSecurityRecommendationsSectionItemsToSnapshot:](self, "_addSecurityRecommendationsSectionItemsToSnapshot:", v4);
    if (self->_tipToShow)
    {
      -[_SFAccountManagerViewController _tipSectionIdentifier](self, "_tipSectionIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v13[0] = v7;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "appendSectionsWithIdentifiers:", v8);

      v9 = -[SFTipPlatterItem initWithTipType:]([SFTipPlatterItem alloc], "initWithTipType:", self->_tipToShow);
      v12[0] = v9;
      v10 = -[SFTipButtonItem initWithTipType:]([SFTipButtonItem alloc], "initWithTipType:", self->_tipToShow, v9);
      v12[1] = v10;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "appendItemsWithIdentifiers:", v11);

    }
    -[_SFAccountManagerViewController _addAccountSourcesSectionToItemsToSnapshot:](self, "_addAccountSourcesSectionToItemsToSnapshot:", v4);
  }

}

- (id)_cellDataFromSavedAccounts:(id)a3
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __62___SFAccountManagerViewController__cellDataFromSavedAccounts___block_invoke;
  v4[3] = &unk_1E4AC0300;
  v4[4] = self;
  objc_msgSend(a3, "safari_mapObjectsUsingBlock:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_addItemsAboveAccountListForGroupDetailViewToSnapshot:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  const __CFString *v16;
  void *v17;
  _QWORD v18[2];
  _QWORD v19[2];
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_SFAccountTableViewController searchPattern](self, "searchPattern");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  if (!v6)
  {
    if (self->_sharedAccountsGroup)
    {
      -[_SFAccountManagerViewController _sharedAccountsGroupManagementSectionIdentifier](self, "_sharedAccountsGroupManagementSectionIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = v7;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "appendSectionsWithIdentifiers:", v8);

      v19[0] = CFSTR("sharedCredentialGroupHeader");
      v19[1] = CFSTR("sharedCredentialGroupEditGroup");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "appendItemsWithIdentifiers:", v9);

      v18[0] = CFSTR("sharedCredentialGroupHeader");
      v18[1] = CFSTR("sharedCredentialGroupEditGroup");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "reconfigureItemsWithIdentifiers:", v10);

    }
    if (-[_SFAccountManagerViewController _shouldShowRecentlyDeletedSectionInGroup](self, "_shouldShowRecentlyDeletedSectionInGroup"))
    {
      -[_SFAccountManagerViewController _accountSourcesSectionIdentifier](self, "_accountSourcesSectionIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v11;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v17, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "appendSectionsWithIdentifiers:", v12);

      v16 = CFSTR("recentlyDeleted");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v16, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "appendItemsWithIdentifiers:", v13);

      v15 = CFSTR("recentlyDeleted");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v15, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "reconfigureItemsWithIdentifiers:", v14);

    }
  }

}

- (BOOL)_shouldShowRecentlyDeletedSectionInGroup
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;
  void *v7;
  void *v8;
  uint64_t v9;

  if (self->_persona != 2)
    return 0;
  if (!self->_sharedAccountsGroup)
  {
    objc_msgSend(MEMORY[0x1E0D8AC08], "sharedStore");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "recentlyDeletedSavedAccountsInPersonalKeychain");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    if (v9)
      return 1;
  }
  objc_msgSend(MEMORY[0x1E0D8AC08], "sharedStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[KCSharingGroup groupID](self->_sharedAccountsGroup, "groupID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "recentlyDeletedSavedAccountsForGroupWithID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "count") != 0;
  return v6;
}

- (void)_addSecurityRecommendationsSectionItemsToSnapshot:(id)a3
{
  id v4;
  _BOOL4 v5;
  _BOOL4 v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  _BOOL4 hasLoadedSecurityRecommendations;
  SFSecurityRecommendationsCellData *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[_SFAccountManagerViewController _shouldShowSecurityRecommendationsItem](self, "_shouldShowSecurityRecommendationsItem");
  v6 = -[_SFAccountManagerViewController _shouldShowAutoFillItem](self, "_shouldShowAutoFillItem");
  v7 = v6;
  if (v5 || v6)
  {
    -[_SFAccountManagerViewController _securityRecommendationsSectionIdentifier](self, "_securityRecommendationsSectionIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendSectionsWithIdentifiers:", v9);

    if (v5)
    {
      hasLoadedSecurityRecommendations = self->_hasLoadedSecurityRecommendations;
      v11 = [SFSecurityRecommendationsCellData alloc];
      if (hasLoadedSecurityRecommendations)
        v12 = -[SFSecurityRecommendationsCellData initWithSubtitleText:numberOfWarnings:warningStyle:](v11, "initWithSubtitleText:numberOfWarnings:warningStyle:", self->_securityRecommendationsSubtitleText, -[WBSPasswordWarningManager numberOfNonHiddenWarningsWithSpecifiedPriority](self->_passwordWarningManager, "numberOfNonHiddenWarningsWithSpecifiedPriority"), -[_SFAccountManagerViewController _warningStyleForSecurityRecommendationsDrillInCell](self, "_warningStyleForSecurityRecommendationsDrillInCell"));
      else
        v12 = -[SFSecurityRecommendationsCellData initWithLoadingSubtitle](v11, "initWithLoadingSubtitle");
      v13 = (void *)v12;
      v17 = v12;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v17, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "appendItemsWithIdentifiers:", v14);

    }
    if (v7)
    {
      v16 = CFSTR("passwordOptionsDrillIn");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v16, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "appendItemsWithIdentifiers:", v15);

    }
  }

}

- (void)_addAccountSourcesSectionToItemsToSnapshot:(id)a3
{
  id v4;
  NSUInteger v5;
  NSUInteger v6;
  unint64_t persona;
  void *v8;
  void *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  const __CFString *v18;
  const __CFString *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[NSArray count](self->_allSharedAccountsGroupsInvitations, "count");
  v6 = -[NSArray count](self->_allSharedAccountsGroups, "count");
  persona = self->_persona;
  if (persona >= 2)
  {
    if (persona != 2)
    {
      v10 = 0;
      goto LABEL_7;
    }
    objc_msgSend(MEMORY[0x1E0D8AC08], "sharedStore");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[KCSharingGroup groupID](self->_sharedAccountsGroup, "groupID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "recentlyDeletedSavedAccountsForGroupWithID:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v11 != 0;

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D8AC08], "sharedStore");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "allRecentlyDeletedSavedAccounts");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count") != 0;
  }

LABEL_7:
  if ((v5 | v6) != 0 || v10)
  {
    -[_SFAccountManagerViewController _accountSourcesSectionIdentifier](self, "_accountSourcesSectionIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendSectionsWithIdentifiers:", v13);

    if (v5)
    {
      v19 = CFSTR("sharedCredentialGroupInvitationsDrillInCell");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v19, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "appendItemsWithIdentifiers:", v14);

    }
    if (v6)
    {
      v18 = CFSTR("myPasswords");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v18, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "appendItemsWithIdentifiers:", v15);

      objc_msgSend(v4, "appendItemsWithIdentifiers:", self->_allSharedAccountsGroups);
    }
    if (v10)
    {
      v17 = CFSTR("recentlyDeleted");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v17, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "appendItemsWithIdentifiers:", v16);

    }
  }

}

- (void)_savedAccountStoreDidChange
{
  _QWORD block[5];
  id v4;
  id location;

  objc_initWeak(&location, self);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62___SFAccountManagerViewController__savedAccountStoreDidChange__block_invoke;
  block[3] = &unk_1E4AC0328;
  block[4] = self;
  objc_copyWeak(&v4, &location);
  dispatch_async(MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (void)_softDeleteAccountsAtIndexPaths:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id obj;
  _QWORD v22[5];
  uint8_t v23;
  _BYTE v24[15];
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _QWORD v29[5];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = WBS_LOG_CHANNEL_PREFIXPasswords();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[_SFAccountManagerViewController _softDeleteAccountsAtIndexPaths:].cold.2();
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __67___SFAccountManagerViewController__softDeleteAccountsAtIndexPaths___block_invoke;
  v29[3] = &unk_1E4AC0350;
  v29[4] = self;
  objc_msgSend(v4, "safari_mapObjectsUsingBlock:", v29, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = v6;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v26 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v12, "savedAccount");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[WBSPasswordWarningManager removeWarningForSavedAccount:](self->_passwordWarningManager, "removeWarningForSavedAccount:", v13);
        -[WBSSavedAccountStore _moveCredentialTypesToRecentlyDeleted:fromSavedAccount:](self->_savedAccountStore, "_moveCredentialTypesToRecentlyDeleted:fromSavedAccount:", 3, v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
        {
          objc_msgSend(v7, "addObject:", v12);
        }
        else
        {
          v15 = WBS_LOG_CHANNEL_PREFIXPasswords();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
            -[_SFAccountManagerViewController _softDeleteAccountsAtIndexPaths:].cold.1(&v23, v24, v15);
        }

      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v9);
  }

  -[SFTableViewDiffableDataSource snapshot](self->_diffableDataSource, "snapshot");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "deleteItemsWithIdentifiers:", v7);
  -[SFTableViewDiffableDataSource applySnapshot:animatingDifferences:](self->_diffableDataSource, "applySnapshot:animatingDifferences:", v16, 1);
  v17 = objc_alloc_init(MEMORY[0x1E0D8AC10]);
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __67___SFAccountManagerViewController__softDeleteAccountsAtIndexPaths___block_invoke_319;
  v22[3] = &unk_1E4ABFE00;
  v22[4] = self;
  objc_msgSend(v17, "setHandler:", v22);
  v18 = objc_msgSend(obj, "count");
  if (v18 != objc_msgSend(v7, "count"))
  {
    _WBSLocalizedString();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SFAccountManagerViewController _presentErrorAlertWithString:](self, "_presentErrorAlertWithString:", v19);

  }
}

- (void)_deleteAccountsAtIndexPaths:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _QWORD v18[5];
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = WBS_LOG_CHANNEL_PREFIXPasswords();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[_SFAccountManagerViewController _deleteAccountsAtIndexPaths:].cold.1();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __63___SFAccountManagerViewController__deleteAccountsAtIndexPaths___block_invoke;
  v18[3] = &unk_1E4AC0350;
  v18[4] = self;
  objc_msgSend(v4, "safari_mapObjectsUsingBlock:", v18);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v10), "savedAccount");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[WBSPasswordWarningManager removeWarningForSavedAccount:](self->_passwordWarningManager, "removeWarningForSavedAccount:", v11);
        -[WBSSavedAccountStore removeCredentialTypes:forSavedAccount:](self->_savedAccountStore, "removeCredentialTypes:forSavedAccount:", 3, v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
    }
    while (v8);
  }
  -[SFTableViewDiffableDataSource snapshot](self->_diffableDataSource, "snapshot");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "deleteItemsWithIdentifiers:", v6);
  -[SFTableViewDiffableDataSource applySnapshot:animatingDifferences:](self->_diffableDataSource, "applySnapshot:animatingDifferences:", v12, 1);
  v13 = objc_alloc_init(MEMORY[0x1E0DCCBB0]);
  objc_msgSend(v13, "schedulePasswordIconsCleanup");
  -[_SFAccountManagerViewController _updateNavigationBarItems](self, "_updateNavigationBarItems");
  -[_SFAccountManagerViewController setEditing:animated:](self, "setEditing:animated:", 0, 1);

}

- (void)_updateContentUnavailableView
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  char v10;
  void *v11;
  BOOL v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[SFTableViewDiffableDataSource snapshot](self->_diffableDataSource, "snapshot", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "itemIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0
          || (objc_msgSend(v9, "isEqual:", CFSTR("generatedPasswordsSearchResult")) & 1) != 0)
        {
          v10 = 0;
          goto LABEL_13;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      v10 = 1;
      if (v6)
        continue;
      break;
    }
  }
  else
  {
    v10 = 1;
  }
LABEL_13:

  -[_SFAccountTableViewController searchPattern](self, "searchPattern");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "length"))
    v12 = v10;
  else
    v12 = 0;
  self->_isContentUnavailable = v12;

  -[_SFAccountManagerViewController _setNeedsUpdateContentUnavailableConfiguration](self, "_setNeedsUpdateContentUnavailableConfiguration");
}

- (void)_updateContentUnavailableConfigurationUsingState:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (self->_isContentUnavailable)
  {
    objc_msgSend(MEMORY[0x1E0DC3698], "searchConfiguration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "updatedConfigurationForState:", v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SFAccountManagerViewController _setContentUnavailableConfiguration:](self, "_setContentUnavailableConfiguration:", v5);

  }
  else
  {
    -[_SFAccountManagerViewController _setContentUnavailableConfiguration:](self, "_setContentUnavailableConfiguration:", 0);
  }

}

- (BOOL)_shouldShowAutoFillItem
{
  void *v3;
  uint64_t v4;
  BOOL v5;
  id WeakRetained;

  -[_SFAccountTableViewController searchPattern](self, "searchPattern");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (v4)
    return 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = (objc_opt_respondsToSelector() & 1) == 0
    || objc_msgSend(WeakRetained, "editableSavedAccountTableViewControllerShouldShowAutoFillItem:", self);

  return v5;
}

- (BOOL)_shouldShowSecurityRecommendationsItem
{
  void *v3;
  uint64_t v4;
  BOOL v5;
  id WeakRetained;

  -[_SFAccountTableViewController searchPattern](self, "searchPattern");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (v4)
    return 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = (objc_opt_respondsToSelector() & 1) == 0
    || objc_msgSend(WeakRetained, "editableSavedAccountTableViewControllerShouldShowSecurityRecommendationsItem:", self);

  return v5;
}

- (BOOL)_shouldShowGeneratedPasswordsEllipsisMenuItem
{
  void *v2;
  void *v3;
  BOOL v4;

  objc_msgSend(MEMORY[0x1E0D8A970], "sharedStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allUnexpiredGeneratedPasswords");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count") != 0;

  return v4;
}

- (BOOL)_shouldShowGeneratedPasswordSearchResultItem
{
  void *v3;
  BOOL v4;

  -[_SFAccountTableViewController searchPattern](self, "searchPattern");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
    v4 = -[NSArray count](self->_generatedPasswordsMatchingSearchPattern, "count") != 0;
  else
    v4 = 0;

  return v4;
}

- (void)_generatedPasswordStoreDidChange
{
  void *v3;
  uint64_t v4;

  -[_SFAccountTableViewController searchPattern](self, "searchPattern");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (v4)
    -[_SFAccountManagerViewController _updateGeneratedPasswordsMatchingSearchPattern](self, "_updateGeneratedPasswordsMatchingSearchPattern");
}

- (void)_updateGeneratedPasswordsMatchingSearchPattern
{
  void *v3;
  uint64_t v4;
  NSArray *v5;
  NSArray *v6;
  NSArray *v7;
  NSArray *generatedPasswordsMatchingSearchPattern;
  NSArray *v9;
  id v10;
  _QWORD v11[4];
  NSArray *v12;

  objc_msgSend(MEMORY[0x1E0D8A970], "sharedStore");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[_SFAccountTableViewController searchPattern](self, "searchPattern");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");
  objc_msgSend(v10, "allUnexpiredGeneratedPasswords");
  v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __81___SFAccountManagerViewController__updateGeneratedPasswordsMatchingSearchPattern__block_invoke;
    v11[3] = &unk_1E4AC0378;
    v12 = v3;
    -[NSArray safari_filterObjectsUsingBlock:](v6, "safari_filterObjectsUsingBlock:", v11);
    v7 = (NSArray *)objc_claimAutoreleasedReturnValue();
    generatedPasswordsMatchingSearchPattern = self->_generatedPasswordsMatchingSearchPattern;
    self->_generatedPasswordsMatchingSearchPattern = v7;

    v9 = v12;
  }
  else
  {
    v9 = self->_generatedPasswordsMatchingSearchPattern;
    self->_generatedPasswordsMatchingSearchPattern = v5;
  }

}

- (void)_presentGeneratedPasswordsViewFilteredUsingSearchPattern:(BOOL)a3
{
  void *v4;
  void *v5;
  UINavigationController *v6;
  UINavigationController *generatedPasswordsLogNavigationController;
  UINavigationController *v8;
  id v9;

  v4 = (void *)MEMORY[0x1E0D6C050];
  if (a3)
  {
    -[_SFAccountTableViewController searchPattern](self, "searchPattern");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "makeUIViewControllerWithDelegate:searchTerm:alwaysShowSearchBar:", self, v5, 1);
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D6C050], "makeUIViewControllerWithDelegate:searchTerm:alwaysShowSearchBar:", self, &stru_1E4AC8470, 1);
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = (UINavigationController *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", v9);
  -[UINavigationController setModalPresentationStyle:](v6, "setModalPresentationStyle:", 2);
  generatedPasswordsLogNavigationController = self->_generatedPasswordsLogNavigationController;
  self->_generatedPasswordsLogNavigationController = v6;
  v8 = v6;

  -[_SFAccountManagerViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v8, 1, 0);
}

- (int64_t)_indexOfFirstPasswordSection
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  int64_t v6;
  uint64_t v7;
  uint64_t v8;
  int64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[SFTableViewDiffableDataSource snapshot](self->_diffableDataSource, "snapshot", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sectionIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v12;
    while (2)
    {
      v8 = 0;
      v9 = v6 + v5;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v3);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "type") == 2)
        {
          v9 = v6 + v8;
          goto LABEL_12;
        }
        ++v8;
      }
      while (v5 != v8);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      v6 = v9;
      if (v5)
        continue;
      break;
    }
  }
  else
  {
    v9 = 0;
  }
LABEL_12:

  return v9;
}

- (id)_securityRecommendationsSectionIdentifier
{
  SFAccountListSectionIdentifier *securityRecommendationsSectionIdentifier;
  SFAccountListSectionIdentifier *v4;
  SFAccountListSectionIdentifier *v5;

  securityRecommendationsSectionIdentifier = self->_securityRecommendationsSectionIdentifier;
  if (!securityRecommendationsSectionIdentifier)
  {
    v4 = -[SFAccountListSectionIdentifier initWithType:]([SFAccountListSectionIdentifier alloc], "initWithType:", 1);
    v5 = self->_securityRecommendationsSectionIdentifier;
    self->_securityRecommendationsSectionIdentifier = v4;

    securityRecommendationsSectionIdentifier = self->_securityRecommendationsSectionIdentifier;
  }
  return securityRecommendationsSectionIdentifier;
}

- (id)_tipSectionIdentifier
{
  SFAccountListSectionIdentifier *tipSectionIdentifier;
  SFAccountListSectionIdentifier *v4;
  SFAccountListSectionIdentifier *v5;

  tipSectionIdentifier = self->_tipSectionIdentifier;
  if (!tipSectionIdentifier)
  {
    v4 = -[SFAccountListSectionIdentifier initWithType:headerText:footerText:]([SFAccountListSectionIdentifier alloc], "initWithType:headerText:footerText:", 3, 0, 0);
    v5 = self->_tipSectionIdentifier;
    self->_tipSectionIdentifier = v4;

    tipSectionIdentifier = self->_tipSectionIdentifier;
  }
  return tipSectionIdentifier;
}

- (id)_sharedAccountsGroupManagementSectionIdentifier
{
  SFAccountListSectionIdentifier *sharedAccountsGroupManagementSectionIdentifier;
  SFAccountListSectionIdentifier *v4;
  SFAccountListSectionIdentifier *v5;

  sharedAccountsGroupManagementSectionIdentifier = self->_sharedAccountsGroupManagementSectionIdentifier;
  if (!sharedAccountsGroupManagementSectionIdentifier)
  {
    v4 = -[SFAccountListSectionIdentifier initWithType:]([SFAccountListSectionIdentifier alloc], "initWithType:", 4);
    v5 = self->_sharedAccountsGroupManagementSectionIdentifier;
    self->_sharedAccountsGroupManagementSectionIdentifier = v4;

    sharedAccountsGroupManagementSectionIdentifier = self->_sharedAccountsGroupManagementSectionIdentifier;
  }
  return sharedAccountsGroupManagementSectionIdentifier;
}

- (id)_accountSourcesSectionIdentifier
{
  SFAccountListSectionIdentifier *accountSourcesSectionIdentifier;
  SFAccountListSectionIdentifier *v4;
  SFAccountListSectionIdentifier *v5;

  accountSourcesSectionIdentifier = self->_accountSourcesSectionIdentifier;
  if (!accountSourcesSectionIdentifier)
  {
    v4 = -[SFAccountListSectionIdentifier initWithType:headerText:footerText:]([SFAccountListSectionIdentifier alloc], "initWithType:headerText:footerText:", 5, 0, 0);
    v5 = self->_accountSourcesSectionIdentifier;
    self->_accountSourcesSectionIdentifier = v4;

    accountSourcesSectionIdentifier = self->_accountSourcesSectionIdentifier;
  }
  return accountSourcesSectionIdentifier;
}

- (void)_createNewFamilySharedCredentialsGroup
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;

  if (!self->_isLoadingFamilyMembersFromFamilyTip)
  {
    self->_isLoadingFamilyMembersFromFamilyTip = 1;
    -[_SFAccountManagerViewController _reconfigureFamilyTipCells](self, "_reconfigureFamilyTipCells");
    objc_initWeak(&location, self);
    objc_msgSend(MEMORY[0x1E0CD5C50], "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __73___SFAccountManagerViewController__createNewFamilySharedCredentialsGroup__block_invoke;
    v4[3] = &unk_1E4AC03A0;
    objc_copyWeak(&v5, &location);
    objc_msgSend(v3, "as_getKCSharingParticipantsForFamilyMembersWithCompletionHandler:", v4);

    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

- (void)_reconfigureFamilyTipCells
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[SFTableViewDiffableDataSource snapshot](self->_diffableDataSource, "snapshot");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[_SFAccountManagerViewController _tipSectionIdentifier](self, "_tipSectionIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "itemIdentifiersInSectionWithIdentifier:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(v4, "safari_filterObjectsUsingBlock:", &__block_literal_global_333);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "count"))
    {
      objc_msgSend(v6, "reconfigureItemsWithIdentifiers:", v5);
      -[SFTableViewDiffableDataSource applySnapshot:animatingDifferences:](self->_diffableDataSource, "applySnapshot:animatingDifferences:", v6, 1);
    }

  }
}

- (id)_passwordOptionsCellForTableView:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("passwordOptionsDrillIn"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = v3;
  else
    v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 0, CFSTR("passwordOptionsDrillIn"));
  v6 = v5;

  objc_msgSend(MEMORY[0x1E0DC39A8], "cellConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  _WBSLocalizedString();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setText:", v8);

  +[_SFAccountManagerAppearanceValues edgeInsetsForTopLevelCells](_SFAccountManagerAppearanceValues, "edgeInsetsForTopLevelCells");
  objc_msgSend(v7, "setDirectionalLayoutMargins:");
  objc_msgSend(v6, "setAccessibilityIdentifier:", CFSTR("PasswordOptionsCell"));
  objc_msgSend(v6, "setContentConfiguration:", v7);
  objc_msgSend(v6, "setAccessoryType:", 1);
  objc_msgSend(v6, "_setIgnoresMultipleSelectionDuringEditing:", 1);
  objc_msgSend(v6, "sf_registerDynamicImageProviderForSystemTraitsAffectingColorAppearance:", &__block_literal_global_341);

  return v6;
}

- (id)_generatedPasswordSearchResultsCellForTableView:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSUInteger v11;
  void *v12;
  void *v13;

  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("generatedPasswordsSearchResult"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    v6 = v4;
  else
    v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 0, CFSTR("generatedPasswordsSearchResult"));
  v7 = v6;

  objc_msgSend(MEMORY[0x1E0DC39A8], "cellConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[_SFAccountManagerAppearanceValues edgeInsetsForTopLevelCells](_SFAccountManagerAppearanceValues, "edgeInsetsForTopLevelCells");
  objc_msgSend(v8, "setDirectionalLayoutMargins:");
  v9 = (void *)MEMORY[0x1E0CB3940];
  _WBSLocalizedString();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[NSArray count](self->_generatedPasswordsMatchingSearchPattern, "count");
  -[_SFAccountTableViewController searchPattern](self, "searchPattern");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringWithFormat:", v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setText:", v13);

  objc_msgSend(v7, "setContentConfiguration:", v8);
  objc_msgSend(v7, "setAccessoryType:", 1);
  objc_msgSend(v7, "_setIgnoresMultipleSelectionDuringEditing:", 1);
  objc_msgSend(v7, "sf_registerDynamicImageProviderForSystemTraitsAffectingColorAppearance:", &__block_literal_global_346);

  return v7;
}

- (void)_didSelectAutoFillCellAtIndexPath:(id)a3 inTableView:(id)a4
{
  void *v5;
  id v6;

  objc_msgSend(a4, "deselectRowAtIndexPath:animated:", a3, 0);
  -[_SFAccountManagerViewController _createPasswordOptionsViewController](self, "_createPasswordOptionsViewController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[_SFAccountManagerViewController navigationController](self, "navigationController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "pushViewController:animated:", v6, 1);

  }
}

- (void)_findAndRemoveEntryForCompletedDetailViewUpgrade
{
  dispatch_time_t v3;
  _QWORD block[5];

  v3 = dispatch_time(0, 1000000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __83___SFAccountManagerViewController__findAndRemoveEntryForCompletedDetailViewUpgrade__block_invoke;
  block[3] = &unk_1E4ABFE00;
  block[4] = self;
  dispatch_after(v3, MEMORY[0x1E0C80D38], block);
}

- (void)_reloadSecurityRecommendationsSection
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _BOOL4 hasLoadedSecurityRecommendations;
  SFSecurityRecommendationsCellData *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  -[SFTableViewDiffableDataSource snapshot](self->_diffableDataSource, "snapshot");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SFAccountManagerViewController _securityRecommendationsSectionIdentifier](self, "_securityRecommendationsSectionIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "indexOfSectionIdentifier:", v4) != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v3, "itemIdentifiersInSectionWithIdentifier:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "safari_firstObjectPassingTest:", &__block_literal_global_347);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      hasLoadedSecurityRecommendations = self->_hasLoadedSecurityRecommendations;
      v8 = [SFSecurityRecommendationsCellData alloc];
      if (hasLoadedSecurityRecommendations)
        v9 = -[SFSecurityRecommendationsCellData initWithSubtitleText:numberOfWarnings:warningStyle:](v8, "initWithSubtitleText:numberOfWarnings:warningStyle:", self->_securityRecommendationsSubtitleText, -[WBSPasswordWarningManager numberOfNonHiddenWarningsWithSpecifiedPriority](self->_passwordWarningManager, "numberOfNonHiddenWarningsWithSpecifiedPriority"), -[_SFAccountManagerViewController _warningStyleForSecurityRecommendationsDrillInCell](self, "_warningStyleForSecurityRecommendationsDrillInCell"));
      else
        v9 = -[SFSecurityRecommendationsCellData initWithLoadingSubtitle](v8, "initWithLoadingSubtitle");
      v10 = (void *)v9;
      if ((WBSIsEqual() & 1) == 0)
      {
        v14[0] = v10;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "insertItemsWithIdentifiers:beforeItemWithIdentifier:", v11, v6);

        v13 = v6;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v13, 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "deleteItemsWithIdentifiers:", v12);

        -[SFTableViewDiffableDataSource applySnapshot:animatingDifferences:](self->_diffableDataSource, "applySnapshot:animatingDifferences:", v3, 0);
      }

    }
  }

}

- (void)_reloadAccountSourcesSection
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  -[SFTableViewDiffableDataSource snapshot](self->_diffableDataSource, "snapshot");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SFAccountManagerViewController _accountSourcesSectionIdentifier](self, "_accountSourcesSectionIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "indexOfSectionIdentifier:", v4) != 0x7FFFFFFFFFFFFFFFLL)
  {
    v6[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "reloadSectionsWithIdentifiers:", v5);

    -[SFTableViewDiffableDataSource applySnapshot:animatingDifferences:](self->_diffableDataSource, "applySnapshot:animatingDifferences:", v3, 0);
  }

}

- (void)_updateSecurityRecommendationsSubtitleTextWithWarnings:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSString *v21;
  int v22;
  void *v23;
  NSString *securityRecommendationsSubtitleText;
  uint64_t v25;
  id v26;

  objc_msgSend(a3, "safari_filterObjectsUsingBlock:", &__block_literal_global_349);
  v26 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "safari_filterObjectsUsingBlock:", &__block_literal_global_350);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sortedArrayUsingComparator:", &__block_literal_global_352);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0C99E40];
  objc_msgSend(v5, "safari_mapObjectsUsingBlock:", &__block_literal_global_355);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "orderedSetWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[WBSPasswordWarningManager hasUnacknowledgedHighPriorityWarnings](self->_passwordWarningManager, "hasUnacknowledgedHighPriorityWarnings");
  v10 = objc_msgSend(v8, "count");
  v11 = v10;
  if (v9)
    v12 = v10 < 4;
  else
    v12 = 1;
  if (v12)
  {
    if (v10 == 3)
      v13 = v9;
    else
      v13 = 0;
    if (v13 == 1)
    {
      v14 = (void *)MEMORY[0x1E0CB3940];
      _WBSLocalizedString();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "stringWithFormat:", v15, v16, 2);
    }
    else
    {
      if (v10 == 2)
        v22 = v9;
      else
        v22 = 0;
      if (v22 == 1)
      {
        v23 = (void *)MEMORY[0x1E0CB3940];
      }
      else
      {
        if (v10 != 1)
        {
          objc_msgSend(v26, "count");
          _WBSLocalizedString();
          v21 = (NSString *)objc_claimAutoreleasedReturnValue();
          goto LABEL_20;
        }
        v23 = (void *)MEMORY[0x1E0CB3940];
      }
      _WBSLocalizedString();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "stringWithFormat:", v15, v16, v25);
    }
    v21 = (NSString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v17 = (void *)MEMORY[0x1E0CB3940];
    _WBSLocalizedString();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndexedSubscript:", 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringWithFormat:", v18, v19, v20, v11 - 2);
    v21 = (NSString *)objc_claimAutoreleasedReturnValue();

  }
LABEL_20:
  securityRecommendationsSubtitleText = self->_securityRecommendationsSubtitleText;
  self->_securityRecommendationsSubtitleText = v21;

}

- (int64_t)_warningStyleForSecurityRecommendationsDrillInCell
{
  if (!self->_hasLoadedSecurityRecommendations)
    return 0;
  if (!-[WBSPasswordWarningManager numberOfNonHiddenWarningsWithSpecifiedPriority](self->_passwordWarningManager, "numberOfNonHiddenWarningsWithSpecifiedPriority"))return 3;
  if (-[WBSPasswordWarningManager hasUnacknowledgedHighPriorityWarnings](self->_passwordWarningManager, "hasUnacknowledgedHighPriorityWarnings"))return 1;
  return 2;
}

- (void)_checkForTipsToShow
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __54___SFAccountManagerViewController__checkForTipsToShow__block_invoke;
  v2[3] = &unk_1E4AC0548;
  v2[4] = self;
  objc_msgSend(MEMORY[0x1E0C92608], "fetchTipToShow:", v2);
}

- (void)_userChoseToUseTip:(int64_t)a3
{
  switch(a3)
  {
    case 3:
      -[_SFAccountManagerViewController presentSharedAccountGroupCreationFlowWithSavedAccountToAddToNewlyCreatedGroup:](self, "presentSharedAccountGroupCreationFlowWithSavedAccountToAddToNewlyCreatedGroup:", 0);
      break;
    case 2:
      -[_SFAccountManagerViewController _createNewFamilySharedCredentialsGroup](self, "_createNewFamilySharedCredentialsGroup");
      break;
    case 1:
      -[_SFAccountManagerViewController _openiCloudKeychainSettings](self, "_openiCloudKeychainSettings");
      break;
  }
}

- (void)_openiCloudKeychainSettings
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("prefs:root=APPLE_ACCOUNT&path=ICLOUD_SERVICE/com.apple.Dataclass.KeychainSync"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "openSensitiveURL:withOptions:", v3, 0);

}

- (id)passwordWarningManagerForAccountDetailViewController:(id)a3
{
  return self->_passwordWarningManager;
}

- (id)passwordGeneratorForAccountDetailViewController:(id)a3
{
  WBSPasswordGenerationManager *passwordGenerator;
  WBSPasswordGenerationManager *v5;
  WBSPasswordGenerationManager *v6;

  passwordGenerator = self->_passwordGenerator;
  if (!passwordGenerator)
  {
    v5 = (WBSPasswordGenerationManager *)objc_msgSend(objc_alloc(MEMORY[0x1E0D8AA98]), "initWithPasswordRequirementsByDomain:", 0);
    v6 = self->_passwordGenerator;
    self->_passwordGenerator = v5;

    passwordGenerator = self->_passwordGenerator;
  }
  return passwordGenerator;
}

- (id)newSharedSiteMetadataManager
{
  return self->_siteMetadataManager;
}

- (void)userDidPressDeclineButtonForPlatterTableViewCell:(id)a3
{
  objc_msgSend(MEMORY[0x1E0C92608], "userDidAcknowledgeTip:", objc_msgSend(a3, "tipType"));
  -[_SFAccountManagerViewController _checkForTipsToShow](self, "_checkForTipsToShow");
}

- (void)groupProviderReceivedUpdates:(id)a3
{
  id v4;
  unint64_t persona;
  id v6;

  v4 = a3;
  persona = self->_persona;
  if (persona < 2)
  {
    v6 = v4;
    -[_SFAccountManagerViewController _fetchSharedAccountsGroups](self, "_fetchSharedAccountsGroups");
LABEL_5:
    v4 = v6;
    goto LABEL_6;
  }
  if (persona == 2)
  {
    v6 = v4;
    -[_SFAccountManagerViewController _fetchUpdatedGroup](self, "_fetchUpdatedGroup");
    goto LABEL_5;
  }
LABEL_6:

}

- (void)_fetchSharedAccountsGroups
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD block[5];
  id v10;
  id v11;

  objc_msgSend(MEMORY[0x1E0D8AA48], "sharedProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cachedGroups");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D8AA48], "sharedProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cachedInvitations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61___SFAccountManagerViewController__fetchSharedAccountsGroups__block_invoke;
  block[3] = &unk_1E4ABFC38;
  block[4] = self;
  v10 = v4;
  v11 = v6;
  v7 = v6;
  v8 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

- (void)_fetchUpdatedGroup
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53___SFAccountManagerViewController__fetchUpdatedGroup__block_invoke;
  block[3] = &unk_1E4ABFE00;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

- (void)groupCreationFlowNavigationController:(id)a3 finishedWithGroup:(id)a4 error:(id)a5
{
  id v7;
  id v8;
  _SFAccountManagerViewController *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  _QWORD v18[4];
  id v19;

  v7 = a4;
  v8 = a5;
  -[_SFAccountManagerViewController _checkForTipsToShow](self, "_checkForTipsToShow");
  -[_SFAccountManagerViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
  if (v7)
  {
    v9 = -[_SFAccountManagerViewController initWithSiteMetadataManager:autoFillQuirksManager:persona:group:]([_SFAccountManagerViewController alloc], "initWithSiteMetadataManager:autoFillQuirksManager:persona:group:", self->_siteMetadataManager, self->_autoFillQuirksManager, 2, v7);
    if (self->_persona == 2)
    {
      -[_SFAccountManagerViewController navigationController](self, "navigationController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (id)objc_msgSend(v10, "popViewControllerAnimated:", 1);

    }
    -[_SFAccountManagerViewController navigationController](self, "navigationController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "pushViewController:animated:", v9, 1);

    goto LABEL_7;
  }
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0D6C058], "alertTitleForFailingToCreateGroupWithError:", v8);
    v9 = (_SFAccountManagerViewController *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v9, 0, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)MEMORY[0x1E0DC3448];
    _WBSLocalizedString();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __97___SFAccountManagerViewController_groupCreationFlowNavigationController_finishedWithGroup_error___block_invoke;
    v18[3] = &unk_1E4AC0010;
    v19 = v13;
    v16 = v13;
    objc_msgSend(v14, "actionWithTitle:style:handler:", v15, 0, v18);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addAction:", v17);

    -[_SFAccountManagerViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v16, 1, 0);
LABEL_7:

  }
}

- (void)groupViewController:(id)a3 didLeaveGroupWithMemberNames:(id)a4
{
  void *v5;
  id v6;
  id v7;

  v7 = a4;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  -[_SFAccountManagerViewController navigationController](self, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "popViewControllerAnimated:", 1);

  if (objc_msgSend(v7, "count"))
  {
    self->_shouldShowGroupExitAlert = 1;
    -[_SFAccountManagerViewController _presentAlertTellingUserThatMembersOfGroupTheyLeftMightHaveAccessToAccounts:](self, "_presentAlertTellingUserThatMembersOfGroupTheyLeftMightHaveAccessToAccounts:", v7);
  }

}

- (void)_presentAlertTellingUserThatMembersOfGroupTheyLeftMightHaveAccessToAccounts:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(MEMORY[0x1E0D6C058], "groupExitWarningAlertTitleWithGroupMemberNames:", a3);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D6C058], "leaveGroupWarningAlertSubtitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v9, v4, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0DC3448];
  _WBSLocalizedString();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "actionWithTitle:style:handler:", v7, 1, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addAction:", v8);

  -[_SFAccountManagerViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v5, 1, 0);
}

- (void)groupViewController:(id)a3 didDeleteGroupWithMemberNames:(id)a4
{
  void *v5;
  id v6;
  id v7;

  v7 = a4;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  -[_SFAccountManagerViewController navigationController](self, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "popViewControllerAnimated:", 1);

  if (objc_msgSend(v7, "count"))
  {
    self->_shouldShowGroupExitAlert = 1;
    -[_SFAccountManagerViewController _presentAlertTellingUserThatMembersOfDeletedGroupMightHaveAccessToAccounts:](self, "_presentAlertTellingUserThatMembersOfDeletedGroupMightHaveAccessToAccounts:", v7);
  }

}

- (void)_presentAlertTellingUserThatMembersOfDeletedGroupMightHaveAccessToAccounts:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(MEMORY[0x1E0D6C058], "groupExitWarningAlertTitleWithGroupMemberNames:", a3);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D6C058], "groupDeletionWarningAlertSubtitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v9, v4, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0DC3448];
  _WBSLocalizedString();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "actionWithTitle:style:handler:", v7, 1, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addAction:", v8);

  -[_SFAccountManagerViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v5, 1, 0);
}

- (void)passwordManagerWillLock
{
  void *v3;
  void *v4;
  id v5;

  -[_SFAccountManagerViewController _reloadSavedAccountsAndTableViewData](self, "_reloadSavedAccountsAndTableViewData");
  -[_SFAccountManagerViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reloadSectionIndexTitles");

  -[_SFAccountManagerViewController tableView](self, "tableView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contextMenuInteraction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dismissMenu");

}

- (void)moveAccountsToGroupPickerTableViewControllerDidCancel:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __89___SFAccountManagerViewController_moveAccountsToGroupPickerTableViewControllerDidCancel___block_invoke;
  block[3] = &unk_1E4ABFE00;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

- (void)moveAccountsToGroupPickerTableViewController:(id)a3 didPickSavedAccounts:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _QWORD block[5];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v9);
        objc_msgSend(MEMORY[0x1E0D8AC08], "sharedStore");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[KCSharingGroup groupID](self->_sharedAccountsGroup, "groupID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "_moveSavedAccount:toGroupWithID:", v10, v12);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __101___SFAccountManagerViewController_moveAccountsToGroupPickerTableViewController_didPickSavedAccounts___block_invoke;
  block[3] = &unk_1E4ABFE00;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

- (void)invitationsListViewController:(id)a3 acceptedInviteToGroup:(id)a4
{
  id v5;
  void *v6;
  _SFAccountManagerViewController *v7;

  v5 = a4;
  v7 = -[_SFAccountManagerViewController initWithSiteMetadataManager:autoFillQuirksManager:persona:group:]([_SFAccountManagerViewController alloc], "initWithSiteMetadataManager:autoFillQuirksManager:persona:group:", self->_siteMetadataManager, self->_autoFillQuirksManager, 2, v5);

  -[_SFAccountManagerViewController setShouldShowSharingGroupWelcomeView:](v7, "setShouldShowSharingGroupWelcomeView:", 1);
  -[_SFAccountManagerViewController navigationController](self, "navigationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pushViewController:animated:", v7, 1);

}

- (void)totpMigrationControllerFinishedImport:(id)a3
{
  UINavigationController *v4;
  PMTOTPMigrationController *v5;
  PMTOTPMigrationController *totpMigrationController;
  UINavigationController *totpMigrationNavigationController;
  PMTOTPMigrationController *v8;

  v8 = (PMTOTPMigrationController *)a3;
  -[_SFAccountManagerViewController presentedViewController](self, "presentedViewController");
  v4 = (UINavigationController *)objc_claimAutoreleasedReturnValue();
  if (v4 == self->_totpMigrationNavigationController)
  {
    totpMigrationController = self->_totpMigrationController;

    v5 = v8;
    if (totpMigrationController != v8)
      goto LABEL_4;
    -[_SFAccountManagerViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
    totpMigrationNavigationController = self->_totpMigrationNavigationController;
    self->_totpMigrationNavigationController = 0;

    v4 = (UINavigationController *)self->_totpMigrationController;
    self->_totpMigrationController = 0;
  }

  v5 = v8;
LABEL_4:

}

- (void)totpMigrationController:(id)a3 presentDetailsForSavedAccount:(id)a4
{
  id v6;
  UINavigationController *v7;
  SFAccountDetailViewController *v8;
  PMTOTPMigrationController *totpMigrationController;
  PMTOTPMigrationController *v10;

  v10 = (PMTOTPMigrationController *)a3;
  v6 = a4;
  -[_SFAccountManagerViewController presentedViewController](self, "presentedViewController");
  v7 = (UINavigationController *)objc_claimAutoreleasedReturnValue();
  v8 = (SFAccountDetailViewController *)v7;
  if (v7 == self->_totpMigrationNavigationController)
  {
    totpMigrationController = self->_totpMigrationController;

    if (totpMigrationController != v10)
      goto LABEL_4;
    v8 = -[SFAccountDetailViewController initWithSavedAccount:passwordWarning:options:]([SFAccountDetailViewController alloc], "initWithSavedAccount:passwordWarning:options:", v6, 0, 0);
    -[UINavigationController pushViewController:animated:](self->_totpMigrationNavigationController, "pushViewController:animated:", v8, 1);
  }

LABEL_4:
}

- (void)totpMigrationController:(id)a3 presentPickerForGenerator:(id)a4
{
  PMTOTPMigrationController *v6;
  id v7;
  UINavigationController *v8;
  PMTOTPMigrationController *totpMigrationController;
  SFAccountPickerConfiguration *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  SFAccountPickerViewController *v16;
  PMTOTPMigrationController *v17;
  SFAccountPickerViewController *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, void *);
  void *v23;
  PMTOTPMigrationController *v24;
  id v25;

  v6 = (PMTOTPMigrationController *)a3;
  v7 = a4;
  -[_SFAccountManagerViewController presentedViewController](self, "presentedViewController");
  v8 = (UINavigationController *)objc_claimAutoreleasedReturnValue();
  if (v8 == self->_totpMigrationNavigationController)
  {
    totpMigrationController = self->_totpMigrationController;

    if (totpMigrationController == v6)
    {
      v10 = objc_alloc_init(SFAccountPickerConfiguration);
      _WBSLocalizedString();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFAccountPickerConfiguration setPrompt:](v10, "setPrompt:", v11);

      _WBSLocalizedString();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFAccountPickerConfiguration setTitle:](v10, "setTitle:", v12);

      -[SFAccountPickerConfiguration setMinimumNumberOfCredentialsToShowLikelyMatchesSection:](v10, "setMinimumNumberOfCredentialsToShowLikelyMatchesSection:", 1);
      -[SFAccountPickerConfiguration setShouldEnableAddingNewPasswordsIfPossible:](v10, "setShouldEnableAddingNewPasswordsIfPossible:", 1);
      -[SFAccountPickerConfiguration setShouldHideCreatePasswordsInSettingsHint:](v10, "setShouldHideCreatePasswordsInSettingsHint:", 1);
      objc_msgSend(v7, "heuristicallyDeterminedServiceNameHints");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "count");

      if (v14)
      {
        objc_msgSend(v7, "heuristicallyDeterminedServiceNameHints");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFAccountPickerConfiguration setServiceNameHintStrings:](v10, "setServiceNameHintStrings:", v15);

      }
      v16 = [SFAccountPickerViewController alloc];
      v20 = MEMORY[0x1E0C809B0];
      v21 = 3221225472;
      v22 = __85___SFAccountManagerViewController_totpMigrationController_presentPickerForGenerator___block_invoke;
      v23 = &unk_1E4AC00B0;
      v17 = v6;
      v24 = v17;
      v25 = v7;
      v18 = -[SFAccountPickerViewController initWithConfiguration:completionHandler:](v16, "initWithConfiguration:completionHandler:", v10, &v20);
      -[PMTOTPMigrationController viewController](v17, "viewController", v20, v21, v22, v23);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "presentViewController:animated:completion:", v18, 1, 0);

    }
  }
  else
  {

  }
}

- (void)passwordManagerLogViewControllerWantsToSaveGeneratedPassword:(id)a3
{
  id v5;
  SFAddSavedAccountViewController *v6;
  void *v7;
  void *v8;
  void *v9;
  SFAddSavedAccountViewController *v10;

  objc_storeStrong((id *)&self->_generatedPasswordBeingTransformedIntoSavedAccount, a3);
  v5 = a3;
  v6 = [SFAddSavedAccountViewController alloc];
  objc_msgSend(v5, "protectionSpace");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "host");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "password");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[SFAddSavedAccountViewController initWithSuggestedDomain:password:](v6, "initWithSuggestedDomain:password:", v8, v9);
  -[_SFAccountManagerViewController _presentAddSavedAccountViewController:](self, "_presentAddSavedAccountViewController:", v10);

}

- (void)passwordManagerLogViewControllerWantsToDismiss
{
  UINavigationController *generatedPasswordsLogNavigationController;

  generatedPasswordsLogNavigationController = self->_generatedPasswordsLogNavigationController;
  self->_generatedPasswordsLogNavigationController = 0;

  -[_SFAccountManagerViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)invitationViewController:(id)a3 acceptedInvitationForGroup:(id)a4
{
  id v5;
  _SFAccountManagerViewController *v6;
  void *v7;
  NSObject *v8;

  v5 = a4;
  -[_SFAccountManagerViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
  if (v5)
  {
    v6 = -[_SFAccountManagerViewController initWithSiteMetadataManager:autoFillQuirksManager:persona:group:]([_SFAccountManagerViewController alloc], "initWithSiteMetadataManager:autoFillQuirksManager:persona:group:", self->_siteMetadataManager, self->_autoFillQuirksManager, 2, v5);
    -[_SFAccountManagerViewController setShouldShowSharingGroupWelcomeView:](v6, "setShouldShowSharingGroupWelcomeView:", 1);
    -[_SFAccountManagerViewController navigationController](self, "navigationController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "pushViewController:animated:", v6, 1);

  }
  else
  {
    v8 = WBS_LOG_CHANNEL_PREFIXPasswords();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[_SFAccountManagerViewController invitationViewController:acceptedInvitationForGroup:].cold.1();
  }

}

- (void)invitationViewController:(id)a3 failedToAcceptInvitationWithError:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[_SFAccountManagerViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
  objc_msgSend(MEMORY[0x1E0D6C058], "alertTitleForFailingToAcceptInvitationWithError:", v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[_SFAccountManagerViewController _presentErrorAlertWithString:](self, "_presentErrorAlertWithString:", v6);
}

- (void)invitationViewController:(id)a3 declinedInvitationForGroup:(id)a4
{
  -[_SFAccountManagerViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)invitationViewController:(id)a3 failedToDeclineInvitationWithError:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[_SFAccountManagerViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
  objc_msgSend(MEMORY[0x1E0D6C058], "alertTitleForFailingToDeclineInvitationWithError:", v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[_SFAccountManagerViewController _presentErrorAlertWithString:](self, "_presentErrorAlertWithString:", v6);
}

- (void)invitationViewControllerChoseNotToRespondToInvitation:(id)a3
{
  -[_SFAccountManagerViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (BOOL)shouldSuppressAccountManagerLockedView
{
  void *v2;
  char v3;

  -[_SFAccountTableViewController searchController](self, "searchController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isBeingPresented");

  return v3;
}

- (_SFAccountManagerViewControllerDelegate)delegate
{
  return (_SFAccountManagerViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (WBSSavedAccount)savedAccountToRemoveAfterCompletedUpgradeInDetailView
{
  return self->_savedAccountToRemoveAfterCompletedUpgradeInDetailView;
}

- (void)setSavedAccountToRemoveAfterCompletedUpgradeInDetailView:(id)a3
{
  objc_storeStrong((id *)&self->_savedAccountToRemoveAfterCompletedUpgradeInDetailView, a3);
}

- (BOOL)shouldShowSharingGroupWelcomeView
{
  return self->_shouldShowSharingGroupWelcomeView;
}

- (void)setShouldShowSharingGroupWelcomeView:(BOOL)a3
{
  self->_shouldShowSharingGroupWelcomeView = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_savedAccountToRemoveAfterCompletedUpgradeInDetailView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_generatedPasswordBeingTransformedIntoSavedAccount, 0);
  objc_storeStrong((id *)&self->_generatedPasswordsMatchingSearchPattern, 0);
  objc_storeStrong((id *)&self->_generatedPasswordsLogNavigationController, 0);
  objc_storeStrong((id *)&self->_selectedSavedAccounts, 0);
  objc_storeStrong((id *)&self->_totpMigrationController, 0);
  objc_storeStrong((id *)&self->_totpMigrationNavigationController, 0);
  objc_storeStrong((id *)&self->_sharedAccountsGroup, 0);
  objc_storeStrong((id *)&self->_allSharedAccountsGroupsInvitations, 0);
  objc_storeStrong((id *)&self->_allSharedAccountsGroups, 0);
  objc_destroyWeak((id *)&self->_detailViewController);
  objc_storeStrong((id *)&self->_addPasswordViewController, 0);
  objc_storeStrong((id *)&self->_securityRecommendationsSubtitleText, 0);
  objc_storeStrong((id *)&self->_autoFillFeatureManager, 0);
  objc_storeStrong((id *)&self->_passwordGenerator, 0);
  objc_storeStrong((id *)&self->_passwordWarningManager, 0);
  objc_storeStrong((id *)&self->_receivedInvalidSharablePassword, 0);
  objc_storeStrong((id *)&self->_receivedSharablePasswordRequiringPromptBeforeSaving, 0);
  objc_storeStrong((id *)&self->_siteMetadataManager, 0);
  objc_storeStrong((id *)&self->_savedAccountStore, 0);
  objc_storeStrong((id *)&self->_autoFillQuirksManager, 0);
  objc_storeStrong((id *)&self->_editToolbarItem, 0);
  objc_storeStrong((id *)&self->_deleteToolbarItem, 0);
  objc_storeStrong((id *)&self->_cancelToolbarItem, 0);
  objc_storeStrong((id *)&self->_editNavigationBarItem, 0);
  objc_storeStrong((id *)&self->_ellipsisNavigationBarItem, 0);
  objc_storeStrong((id *)&self->_deleteNavigationBarItem, 0);
  objc_storeStrong((id *)&self->_cancelNavigationBarItem, 0);
  objc_storeStrong((id *)&self->_addNavigationBarItem, 0);
  objc_storeStrong((id *)&self->_sharedAccountsGroupManagementSectionIdentifier, 0);
  objc_storeStrong((id *)&self->_accountSourcesSectionIdentifier, 0);
  objc_storeStrong((id *)&self->_tipSectionIdentifier, 0);
  objc_storeStrong((id *)&self->_securityRecommendationsSectionIdentifier, 0);
  objc_storeStrong((id *)&self->_diffableDataSource, 0);
}

- (void)additionalViewControllersToPushHandlingURLResourceDictionary:didAuthenticate:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[16];

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_1A3B2D000, v0, v1, "Failed to find specifier to change password.", v2);
  OUTLINED_FUNCTION_1();
}

- (void)_softDeleteAccountsAtIndexPaths:(NSObject *)a3 .cold.1(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_0_0(&dword_1A3B2D000, a3, (uint64_t)a3, "Failed to move password to recently deleted.", a1);
}

- (void)_softDeleteAccountsAtIndexPaths:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4(&dword_1A3B2D000, v0, v1, "Soft deleting passwords at index paths %@", v2, v3, v4, v5, v6);
}

- (void)_deleteAccountsAtIndexPaths:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4(&dword_1A3B2D000, v0, v1, "Deleting passwords at index paths %@", v2, v3, v4, v5, v6);
}

- (void)invitationViewController:acceptedInvitationForGroup:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[16];

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_1A3B2D000, v0, v1, "Accepted group invitation completion handler received nil group.", v2);
  OUTLINED_FUNCTION_1();
}

@end
