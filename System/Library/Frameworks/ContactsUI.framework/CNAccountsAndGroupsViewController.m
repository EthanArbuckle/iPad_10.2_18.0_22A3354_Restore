@implementation CNAccountsAndGroupsViewController

- (void)setManagedConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_managedConfiguration, a3);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setDataSource:(id)a3
{
  CNAccountsAndGroupsDataSource *v5;
  CNAccountsAndGroupsDataSource **p_dataSource;
  CNUIGroupsAndContainersSaveManager *v7;
  void *v8;
  CNUIGroupsAndContainersSaveManager *v9;
  CNUIGroupsAndContainersSaveManager *groupsAndContainersSaveManager;
  CNContainerDataSource *v11;
  void *v12;
  CNContainerDataSource *v13;
  CNContainerDataSource *containerDataSource;
  CNAccountsAndGroupsActionsProvider *v15;
  CNAccountsAndGroupsActionsProvider *actionsProvider;
  CNUIGroupsAndContainersSaveManager *v17;
  CNContainerDataSource *v18;
  CNAccountsAndGroupsActionsProvider *v19;
  CNAccountsAndGroupsDataSource *v20;

  v5 = (CNAccountsAndGroupsDataSource *)a3;
  p_dataSource = &self->_dataSource;
  if (self->_dataSource != v5)
  {
    v20 = v5;
    objc_storeStrong((id *)&self->_dataSource, a3);
    if (v20)
    {
      v7 = [CNUIGroupsAndContainersSaveManager alloc];
      -[CNAccountsAndGroupsDataSource store](*p_dataSource, "store");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[CNUIGroupsAndContainersSaveManager initWithContactStore:](v7, "initWithContactStore:", v8);
      groupsAndContainersSaveManager = self->_groupsAndContainersSaveManager;
      self->_groupsAndContainersSaveManager = v9;

      v11 = [CNContainerDataSource alloc];
      -[CNAccountsAndGroupsDataSource store](*p_dataSource, "store");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[CNContainerDataSource initWithContactStore:](v11, "initWithContactStore:", v12);
      containerDataSource = self->_containerDataSource;
      self->_containerDataSource = v13;

      -[CNContainerDataSource setIgnoresExchangeContainers:](self->_containerDataSource, "setIgnoresExchangeContainers:", 1);
      v15 = -[CNAccountsAndGroupsActionsProvider initWithDataSource:saveManager:]([CNAccountsAndGroupsActionsProvider alloc], "initWithDataSource:saveManager:", *p_dataSource, self->_groupsAndContainersSaveManager);
      actionsProvider = self->_actionsProvider;
      self->_actionsProvider = v15;

      -[CNAccountsAndGroupsActionsProvider setDelegate:](self->_actionsProvider, "setDelegate:", self);
    }
    else
    {
      v17 = self->_groupsAndContainersSaveManager;
      self->_groupsAndContainersSaveManager = 0;

      v18 = self->_containerDataSource;
      self->_containerDataSource = 0;

      v19 = self->_actionsProvider;
      self->_actionsProvider = 0;

    }
    v5 = v20;
  }

}

- (CNAccountsAndGroupsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  CNAccountsAndGroupsViewController *v4;
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
  uint64_t v15;
  CNManagedConfiguration *managedConfiguration;
  CNAccountsAndGroupsViewController *v17;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)CNAccountsAndGroupsViewController;
  v4 = -[CNAccountsAndGroupsViewController initWithNibName:bundle:](&v19, sel_initWithNibName_bundle_, a3, a4);
  if (v4)
  {
    CNContactsUIBundle();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("LISTS"), &stru_1E20507A8, CFSTR("Localized"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNAccountsAndGroupsViewController setTitle:](v4, "setTitle:", v6);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:selector:name:object:", v4, sel_contactStoreDidChange_, *MEMORY[0x1E0C96870], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", v4, sel_contentSizeCategoryDidChange_, *MEMORY[0x1E0DC48E8], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:selector:name:object:", v4, sel_keyboardWillShow_, *MEMORY[0x1E0DC4FE8], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObserver:selector:name:object:", v4, sel_keyboardWillHide_, *MEMORY[0x1E0DC4FE0], 0);

    v4->_needsReload = 1;
    v4->_allowsEditing = 1;
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bundleIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = objc_alloc(MEMORY[0x1E0D13AA8]);
    objc_msgSend(MEMORY[0x1E0D13AB0], "sharedConnection");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v13, "initWithBundleIdentifier:managedProfileConnection:", v12, v14);
    managedConfiguration = v4->_managedConfiguration;
    v4->_managedConfiguration = (CNManagedConfiguration *)v15;

    v17 = v4;
  }

  return v4;
}

- (void)viewDidLoad
{
  void *v3;
  CNUIUserActivityManager *v4;
  CNUIUserActivityManager *activityManager;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CNAccountsAndGroupsViewController;
  -[CNAccountsAndGroupsViewController viewDidLoad](&v6, sel_viewDidLoad);
  +[CNUIContactsEnvironment currentEnvironment](CNUIContactsEnvironment, "currentEnvironment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "inProcessActivityManager");
  v4 = (CNUIUserActivityManager *)objc_claimAutoreleasedReturnValue();
  activityManager = self->_activityManager;
  self->_activityManager = v4;

  -[CNAccountsAndGroupsViewController _updateUserActivity](self, "_updateUserActivity");
  -[CNAccountsAndGroupsViewController setUpCollectionView](self, "setUpCollectionView");
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CNAccountsAndGroupsViewController;
  -[CNAccountsAndGroupsViewController viewWillAppear:](&v10, sel_viewWillAppear_, a3);
  -[CNAccountsAndGroupsViewController dataSource](self, "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCurrentlyEditingGroupIdentifier:", 0);

  if (self->_needsReload)
  {
    -[CNAccountsAndGroupsViewController dataSource](self, "dataSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "reload");

    -[CNAccountsAndGroupsViewController reloadData](self, "reloadData");
    -[CNAccountsAndGroupsViewController loadViewIfNeeded](self, "loadViewIfNeeded");
    self->_needsReload = 0;
  }
  else
  {
    -[CNAccountsAndGroupsViewController reloadData](self, "reloadData");
  }
  -[CNAccountsAndGroupsViewController transitionCoordinator](self, "transitionCoordinator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __52__CNAccountsAndGroupsViewController_viewWillAppear___block_invoke;
    v9[3] = &unk_1E204B480;
    v9[4] = self;
    objc_msgSend(v6, "animateAlongsideTransition:completion:", v9, 0);
  }
  else
  {
    -[CNAccountsAndGroupsViewController clearNavigationButtonsIfNeeded](self, "clearNavigationButtonsIfNeeded");
  }
  if (self->_isLimitedAccessOnboarding)
  {
    -[CNAccountsAndGroupsViewController navigationItem](self, "navigationItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setPrompt:", &stru_1E20507A8);

  }
}

- (void)viewIsAppearing:(BOOL)a3
{
  void *v4;
  char v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CNAccountsAndGroupsViewController;
  -[CNAccountsAndGroupsViewController viewIsAppearing:](&v6, sel_viewIsAppearing_, a3);
  -[CNAccountsAndGroupsViewController groupsStyle](self, "groupsStyle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "shouldShowCellSelection");

  if ((v5 & 1) == 0)
    -[CNAccountsAndGroupsViewController deselectAllItems](self, "deselectAllItems");
  -[CNAccountsAndGroupsViewController updateNavigationButtons](self, "updateNavigationButtons");
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  _QWORD v6[5];
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CNAccountsAndGroupsViewController;
  -[CNAccountsAndGroupsViewController viewDidAppear:](&v7, sel_viewDidAppear_, a3);
  if (-[CNAccountsAndGroupsViewController shouldSetFirstResponder](self, "shouldSetFirstResponder"))
    -[CNAccountsAndGroupsViewController becomeFirstResponder](self, "becomeFirstResponder");
  -[CNAccountsAndGroupsViewController setIsVisible:](self, "setIsVisible:", 1);
  -[CNAccountsAndGroupsViewController transitionCoordinator](self, "transitionCoordinator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __51__CNAccountsAndGroupsViewController_viewDidAppear___block_invoke;
    v6[3] = &unk_1E204B480;
    v6[4] = self;
    objc_msgSend(v4, "animateAlongsideTransition:completion:", 0, v6);
  }
  else
  {
    -[CNAccountsAndGroupsViewController updateToolbarVisibility](self, "updateToolbarVisibility");
  }

}

- (BOOL)shouldSetFirstResponder
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;

  -[CNAccountsAndGroupsViewController presentedViewController](self, "presentedViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNAccountsAndGroupsViewController splitViewController](self, "splitViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstResponder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    LOBYTE(v6) = 0;
  }
  else
  {
    -[CNAccountsAndGroupsViewController splitViewController](self, "splitViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstResponder");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v6 = objc_opt_isKindOfClass() ^ 1;

  }
  return (v3 == 0) & v6;
}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CNAccountsAndGroupsViewController;
  -[CNAccountsAndGroupsViewController viewWillDisappear:](&v8, sel_viewWillDisappear_, a3);
  -[CNAccountsAndGroupsViewController collectionView](self, "collectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEditing");

  if (v5)
    -[CNAccountsAndGroupsViewController setEditing:](self, "setEditing:", 0);
  -[CNAccountsAndGroupsViewController potentiallyPresentedViewController](self, "potentiallyPresentedViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[CNAccountsAndGroupsViewController potentiallyPresentedViewController](self, "potentiallyPresentedViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dismissViewControllerAnimated:completion:", 0, 0);

    -[CNAccountsAndGroupsViewController setPotentiallyPresentedViewController:](self, "setPotentiallyPresentedViewController:", 0);
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CNAccountsAndGroupsViewController;
  -[CNAccountsAndGroupsViewController viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  -[CNAccountsAndGroupsViewController setIsVisible:](self, "setIsVisible:", 0);
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)CNAccountsAndGroupsViewController;
  -[CNAccountsAndGroupsViewController dealloc](&v4, sel_dealloc);
}

- (void)setUpCollectionView
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
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  _QWORD v36[5];

  v36[4] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0DC35B8]);
  -[CNAccountsAndGroupsViewController layout](self, "layout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithFrame:collectionViewLayout:", v4, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[CNAccountsAndGroupsViewController setCollectionView:](self, "setCollectionView:", v5);

  -[CNAccountsAndGroupsViewController collectionView](self, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDelegate:", self);

  -[CNAccountsAndGroupsViewController collectionView](self, "collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDropDelegate:", self);

  -[CNAccountsAndGroupsViewController collectionView](self, "collectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setKeyboardDismissMode:", 2);

  -[CNAccountsAndGroupsViewController collectionView](self, "collectionView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setSelectionFollowsFocus:", 1);

  -[CNAccountsAndGroupsViewController configureDataSource](self, "configureDataSource");
  -[CNAccountsAndGroupsViewController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAccountsAndGroupsViewController collectionView](self, "collectionView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addSubview:", v11);

  -[CNAccountsAndGroupsViewController collectionView](self, "collectionView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[CNAccountsAndGroupsViewController collectionView](self, "collectionView");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "leadingAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAccountsAndGroupsViewController view](self, "view");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "leadingAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "constraintEqualToAnchor:", v32);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = v31;
  -[CNAccountsAndGroupsViewController collectionView](self, "collectionView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "trailingAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAccountsAndGroupsViewController view](self, "view");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "trailingAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "constraintEqualToAnchor:", v27);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v36[1] = v26;
  -[CNAccountsAndGroupsViewController collectionView](self, "collectionView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "topAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAccountsAndGroupsViewController view](self, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "topAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintEqualToAnchor:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v36[2] = v16;
  -[CNAccountsAndGroupsViewController collectionView](self, "collectionView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "bottomAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAccountsAndGroupsViewController view](self, "view");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "bottomAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintEqualToAnchor:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v36[3] = v21;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 4);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v24);
  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, sel_didTapCollectionView_);
  objc_msgSend(v22, "setCancelsTouchesInView:", 0);
  -[CNAccountsAndGroupsViewController collectionView](self, "collectionView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "addGestureRecognizer:", v22);

}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  CNAccountsAndGroupsAuthorizationContext *v7;

  v4 = a4;
  v5 = a3;
  if (a3
    && -[CNAccountsAndGroupsViewController editingCollectionViewRequiresAuthorization](self, "editingCollectionViewRequiresAuthorization"))
  {
    v7 = objc_alloc_init(CNAccountsAndGroupsAuthorizationContext);
    -[CNAccountsAndGroupsAuthorizationContext setType:](v7, "setType:", 4);
    -[CNAccountsAndGroupsViewController showEditAuthorizationPaneWithAuthorizationContext:animated:](self, "showEditAuthorizationPaneWithAuthorizationContext:animated:", v7, 1);

  }
  else
  {
    -[CNAccountsAndGroupsViewController authorizedSetViewEditing:animated:](self, "authorizedSetViewEditing:animated:", v5, v4);
  }
}

- (BOOL)editingCollectionViewRequiresAuthorization
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  BOOL v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[CNAccountsAndGroupsViewController containerDataSource](self, "containerDataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "discoverContainers");

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[CNAccountsAndGroupsViewController containerDataSource](self, "containerDataSource", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "containers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        -[CNAccountsAndGroupsViewController groupsAndContainersSaveManager](self, "groupsAndContainersSaveManager");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v10) = objc_msgSend(v11, "isAuthorizedToEditContainer:", v10);

        if (!(_DWORD)v10)
        {
          v12 = 1;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
        continue;
      break;
    }
  }
  v12 = 0;
LABEL_11:

  return v12;
}

- (void)authorizedSetViewEditing:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)CNAccountsAndGroupsViewController;
  -[CNAccountsAndGroupsViewController setEditing:animated:](&v6, sel_setEditing_animated_, a3, a4);
  -[CNAccountsAndGroupsViewController authorizedSetCollectionViewEditing:](self, "authorizedSetCollectionViewEditing:", v4);
}

- (void)authorizedSetCollectionViewEditing:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v3 = a3;
  v23 = *MEMORY[0x1E0C80C00];
  -[CNAccountsAndGroupsViewController collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEditing:", v3);

  if (!v3)
  {
    -[CNAccountsAndGroupsViewController resignAllFirstRespondersSavingCurrentlyEditing:](self, "resignAllFirstRespondersSavingCurrentlyEditing:", 0);
    if (-[CNAccountsAndGroupsViewController needsReload](self, "needsReload"))
    {
      -[CNAccountsAndGroupsViewController setNeedsReload:](self, "setNeedsReload:", 0);
      -[CNAccountsAndGroupsViewController dataSource](self, "dataSource");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "reload");

      -[CNAccountsAndGroupsViewController reloadData](self, "reloadData");
    }
    else
    {
      -[CNAccountsAndGroupsViewController updateSelectionIfNeeded](self, "updateSelectionIfNeeded");
    }
  }
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[CNAccountsAndGroupsViewController collectionView](self, "collectionView", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "preparedCells");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v19;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v12);
        objc_opt_class();
        v14 = v13;
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v15 = v14;
        else
          v15 = 0;
        v16 = v15;

        objc_msgSend(v16, "setTextViewEnabled:", v3);
        objc_msgSend(v16, "item");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setUserInteractionEnabled:", -[CNAccountsAndGroupsViewController shouldEnableItem:](self, "shouldEnableItem:", v17));

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v10);
  }

}

- (UIKeyCommand)addGroupKeyCommand
{
  UIKeyCommand *addGroupKeyCommand;
  UIKeyCommand *v4;
  UIKeyCommand *v5;
  void *v6;
  void *v7;

  addGroupKeyCommand = self->_addGroupKeyCommand;
  if (!addGroupKeyCommand)
  {
    objc_msgSend(MEMORY[0x1E0DC3930], "keyCommandWithInput:modifierFlags:action:", CFSTR("n"), 1179648, sel_addDefaultGroup_);
    v4 = (UIKeyCommand *)objc_claimAutoreleasedReturnValue();
    v5 = self->_addGroupKeyCommand;
    self->_addGroupKeyCommand = v4;

    CNContactsUIBundle();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("ADD_LIST_KEYBOARD_DISCOVERY"), &stru_1E20507A8, CFSTR("Localized"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyCommand setDiscoverabilityTitle:](self->_addGroupKeyCommand, "setDiscoverabilityTitle:", v7);

    addGroupKeyCommand = self->_addGroupKeyCommand;
  }
  return addGroupKeyCommand;
}

- (void)addDefaultGroup:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[CNAccountsAndGroupsViewController containerDataSource](self, "containerDataSource", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "containerPickerItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[CNAccountsAndGroupsViewController actionsProvider](self, "actionsProvider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNAccountsAndGroupsViewController collectionView](self, "collectionView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "createGroupActionForContainerItem:isCollectionViewEditing:", v8, objc_msgSend(v7, "isEditing"));

  }
}

- (UIBarButtonItem)addGroupBarButtonItem
{
  UIBarButtonItem *addGroupBarButtonItem;
  id v4;
  void *v5;
  void *v6;
  UIBarButtonItem *v7;
  UIBarButtonItem *v8;

  addGroupBarButtonItem = self->_addGroupBarButtonItem;
  if (!addGroupBarButtonItem)
  {
    v4 = objc_alloc(MEMORY[0x1E0DC34F0]);
    CNContactsUIBundle();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("ADD_LIST"), &stru_1E20507A8, CFSTR("Localized"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (UIBarButtonItem *)objc_msgSend(v4, "initWithTitle:menu:", v6, 0);
    v8 = self->_addGroupBarButtonItem;
    self->_addGroupBarButtonItem = v7;

    addGroupBarButtonItem = self->_addGroupBarButtonItem;
  }
  return addGroupBarButtonItem;
}

- (void)reloadAddGroupButton
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  unint64_t v9;
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
  int v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t);
  void *v27;
  id v28;
  id location;

  if (-[CNAccountsAndGroupsViewController allowsEditing](self, "allowsEditing"))
  {
    -[CNAccountsAndGroupsViewController containerDataSource](self, "containerDataSource");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "discoverContainers");

    -[CNAccountsAndGroupsViewController containerDataSource](self, "containerDataSource");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "containerPickerItems");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");

    -[CNAccountsAndGroupsViewController containerDataSource](self, "containerDataSource");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "containerPickerItems");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    if (self->_addGroupBarButtonItem)
    {
      -[CNAccountsAndGroupsViewController addGroupBarButtonItem](self, "addGroupBarButtonItem");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setHidden:", v6 == 0);

      if (v9 < 2)
      {
        v11 = 0;
      }
      else
      {
        -[CNAccountsAndGroupsViewController menuForContainers](self, "menuForContainers");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
      }
      -[CNAccountsAndGroupsViewController addGroupBarButtonItem](self, "addGroupBarButtonItem");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setMenu:", v11);

      if (v9 < 2)
      {
        objc_initWeak(&location, self);
        v14 = (void *)MEMORY[0x1E0DC3428];
        v24 = MEMORY[0x1E0C809B0];
        v25 = 3221225472;
        v26 = __57__CNAccountsAndGroupsViewController_reloadAddGroupButton__block_invoke;
        v27 = &unk_1E204CD40;
        objc_copyWeak(&v28, &location);
        objc_msgSend(v14, "actionWithHandler:", &v24);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNAccountsAndGroupsViewController addGroupBarButtonItem](self, "addGroupBarButtonItem", v24, v25, v26, v27);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setPrimaryAction:", v15);

        objc_destroyWeak(&v28);
        objc_destroyWeak(&location);
      }
      else
      {

        -[CNAccountsAndGroupsViewController addGroupBarButtonItem](self, "addGroupBarButtonItem");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setPrimaryAction:", 0);

      }
      -[CNAccountsAndGroupsViewController addGroupBarButtonItem](self, "addGroupBarButtonItem");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      CNContactsUIBundle();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("ADD_LIST"), &stru_1E20507A8, CFSTR("Localized"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setTitle:", v19);

    }
    -[CNAccountsAndGroupsViewController keyCommands](self, "keyCommands");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNAccountsAndGroupsViewController addGroupKeyCommand](self, "addGroupKeyCommand");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "containsObject:", v21);

    if (v6)
    {
      if ((v22 & 1) != 0)
        return;
      -[CNAccountsAndGroupsViewController addGroupKeyCommand](self, "addGroupKeyCommand");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNAccountsAndGroupsViewController addKeyCommand:](self, "addKeyCommand:", v23);
    }
    else
    {
      if (!v22)
        return;
      -[CNAccountsAndGroupsViewController addGroupKeyCommand](self, "addGroupKeyCommand");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNAccountsAndGroupsViewController removeKeyCommand:](self, "removeKeyCommand:", v23);
    }

  }
}

- (id)menuForContainers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[5];

  -[CNAccountsAndGroupsViewController containerDataSource](self, "containerDataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "containerPickerItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __54__CNAccountsAndGroupsViewController_menuForContainers__block_invoke;
  v8[3] = &unk_1E2049878;
  v8[4] = self;
  objc_msgSend(v4, "_cn_map:", v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithTitle:children:", &stru_1E20507A8, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)shouldShowCancelButton
{
  return -[CNAccountsAndGroupsViewController allowsCanceling](self, "allowsCanceling")
      || -[CNAccountsAndGroupsViewController allowsDone](self, "allowsDone");
}

- (id)fakeBackButton
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  objc_msgSend(MEMORY[0x1E0DC3520], "plainButtonConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3940];
  CNContactsUIBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("LIMITED_BACK"), &stru_1E20507A8, CFSTR("Localized"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR(" %@"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitle:", v7);

  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithWeight:", 7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", CFSTR("chevron.backward"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setImage:", v9);

  v10 = objc_alloc_init(MEMORY[0x1E0DC3518]);
  objc_msgSend(v10, "setConfiguration:", v3);
  objc_msgSend(v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v10, "addTarget:action:forControlEvents:", self, sel_goBack_, 64);

  return v10;
}

- (UIBarButtonItem)cancelBarButtonItem
{
  UIBarButtonItem *cancelBarButtonItem;
  _BOOL4 isLimitedAccessOnboarding;
  id v5;
  void *v6;
  void *v7;
  UIBarButtonItem *v8;
  UIBarButtonItem *v9;
  UIBarButtonItem *v10;

  cancelBarButtonItem = self->_cancelBarButtonItem;
  if (!cancelBarButtonItem)
  {
    isLimitedAccessOnboarding = self->_isLimitedAccessOnboarding;
    v5 = objc_alloc(MEMORY[0x1E0DC34F0]);
    v6 = v5;
    if (isLimitedAccessOnboarding)
    {
      -[CNAccountsAndGroupsViewController fakeBackButton](self, "fakeBackButton");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (UIBarButtonItem *)objc_msgSend(v6, "initWithCustomView:", v7);
      v9 = self->_cancelBarButtonItem;
      self->_cancelBarButtonItem = v8;

    }
    else
    {
      v10 = (UIBarButtonItem *)objc_msgSend(v5, "initWithBarButtonSystemItem:target:action:", 1, self, sel_cancel_);
      v7 = self->_cancelBarButtonItem;
      self->_cancelBarButtonItem = v10;
    }

    cancelBarButtonItem = self->_cancelBarButtonItem;
  }
  return cancelBarButtonItem;
}

- (void)clearNavigationButtonsIfNeeded
{
  int64_t buttonBehavior;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  buttonBehavior = self->_buttonBehavior;
  -[CNAccountsAndGroupsViewController groupsStyle](self, "groupsStyle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "buttonBehavior");

  if (buttonBehavior != v5)
  {
    -[CNAccountsAndGroupsViewController navigationItem](self, "navigationItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setRightBarButtonItem:", 0);

    -[CNAccountsAndGroupsViewController navigationItem](self, "navigationItem");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setLeftBarButtonItem:", 0);

  }
}

- (void)updateNavigationButtons
{
  int64_t buttonBehavior;
  void *v4;
  uint64_t v5;
  void *v6;
  UIBarButtonItem *addGroupBarButtonItem;
  int64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  _BOOL4 v17;
  void *v18;
  void *v19;
  void *v20;
  _BOOL4 v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  -[CNAccountsAndGroupsViewController updateToolbarVisibility](self, "updateToolbarVisibility");
  buttonBehavior = self->_buttonBehavior;
  -[CNAccountsAndGroupsViewController groupsStyle](self, "groupsStyle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "buttonBehavior");

  if (buttonBehavior != v5)
  {
    -[CNAccountsAndGroupsViewController groupsStyle](self, "groupsStyle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    self->_buttonBehavior = objc_msgSend(v6, "buttonBehavior");

    if (-[CNAccountsAndGroupsViewController allowsEditing](self, "allowsEditing"))
    {
      addGroupBarButtonItem = self->_addGroupBarButtonItem;
      self->_addGroupBarButtonItem = 0;

      v8 = self->_buttonBehavior;
      if (v8 == 1)
      {
        -[CNAccountsAndGroupsViewController editButtonItem](self, "editButtonItem");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNAccountsAndGroupsViewController navigationItem](self, "navigationItem");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setRightBarButtonItem:", v19);

        v21 = -[CNAccountsAndGroupsViewController shouldShowCancelButton](self, "shouldShowCancelButton");
        if (v21)
        {
          -[CNAccountsAndGroupsViewController cancelBarButtonItem](self, "cancelBarButtonItem");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v22 = 0;
        }
        -[CNAccountsAndGroupsViewController navigationItem](self, "navigationItem");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setLeftBarButtonItem:", v22);

        if (v21)
        -[CNAccountsAndGroupsViewController addGroupBarButtonItem](self, "addGroupBarButtonItem");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = v12;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v29, 1);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNAccountsAndGroupsViewController setToolbarItems:](self, "setToolbarItems:", v24);

      }
      else
      {
        if (v8 != 2)
        {
LABEL_20:
          objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          -[CNAccountsAndGroupsViewController navigationController](self, "navigationController");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "navigationBar");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "setTintColor:", v25);

          -[CNAccountsAndGroupsViewController reloadAddGroupButton](self, "reloadAddGroupButton");
          return;
        }
        -[CNAccountsAndGroupsViewController addGroupBarButtonItem](self, "addGroupBarButtonItem");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNAccountsAndGroupsViewController navigationItem](self, "navigationItem");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setRightBarButtonItem:", v9);

        -[CNAccountsAndGroupsViewController editButtonItem](self, "editButtonItem");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v30[0] = v11;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (-[CNAccountsAndGroupsViewController shouldShowCancelButton](self, "shouldShowCancelButton"))
        {
          -[CNAccountsAndGroupsViewController cancelBarButtonItem](self, "cancelBarButtonItem");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "arrayByAddingObject:", v13);
          v14 = objc_claimAutoreleasedReturnValue();

          v12 = (void *)v14;
        }
        -[CNAccountsAndGroupsViewController navigationItem](self, "navigationItem");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setLeftBarButtonItems:", v12);

        -[CNAccountsAndGroupsViewController setToolbarItems:](self, "setToolbarItems:", 0);
      }

      goto LABEL_20;
    }
    -[CNAccountsAndGroupsViewController navigationItem](self, "navigationItem");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setRightBarButtonItem:", 0);

    v17 = -[CNAccountsAndGroupsViewController shouldShowCancelButton](self, "shouldShowCancelButton");
    if (v17)
    {
      -[CNAccountsAndGroupsViewController cancelBarButtonItem](self, "cancelBarButtonItem");
      -[CNAccountsAndGroupsViewController navigationItem](self, "navigationItem", objc_claimAutoreleasedReturnValue());
    }
    else
    {
      -[CNAccountsAndGroupsViewController navigationItem](self, "navigationItem", 0);
    }
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setLeftBarButtonItem:", v28);

    if (v17)
  }
}

- (void)updateToolbarVisibility
{
  void *v3;
  _BOOL8 v4;
  id v5;

  if (-[CNAccountsAndGroupsViewController allowsEditing](self, "allowsEditing"))
  {
    -[CNAccountsAndGroupsViewController groupsStyle](self, "groupsStyle");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "buttonBehavior") != 1;

  }
  else
  {
    v4 = 1;
  }
  -[CNAccountsAndGroupsViewController navigationController](self, "navigationController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setToolbarHidden:", v4);

}

- (void)cancel:(id)a3
{
  void *v4;
  char v5;
  id v6;

  -[CNAccountsAndGroupsViewController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[CNAccountsAndGroupsViewController delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "accountsAndGroupsViewControllerDidCancel:", self);

  }
}

- (void)goBack:(id)a3
{
  void *v4;
  char v5;
  id v6;

  -[CNAccountsAndGroupsViewController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[CNAccountsAndGroupsViewController delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "accountsAndGroupsViewControllerDidGoBack:", self);

  }
}

- (void)reloadCollectionViewDeletingItem:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  char v17;

  v4 = a3;
  -[CNAccountsAndGroupsViewController resignAllFirstRespondersSavingCurrentlyEditing:](self, "resignAllFirstRespondersSavingCurrentlyEditing:", 0);
  if (v4)
  {
    -[CNAccountsAndGroupsViewController dataSource](self, "dataSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isFilterShowingItem:", v4);

    -[CNAccountsAndGroupsViewController diffableDataSource](self, "diffableDataSource");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "snapshot");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "itemIdentifiers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "containsObject:", v4);

    if ((v10 & 1) != 0)
    {
      -[CNAccountsAndGroupsViewController cleanUpItemIfNeeded:](self, "cleanUpItemIfNeeded:", v4);
      +[CNUIContactsEnvironment currentEnvironment](CNUIContactsEnvironment, "currentEnvironment");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "defaultSchedulerProvider");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "mainThreadScheduler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __70__CNAccountsAndGroupsViewController_reloadCollectionViewDeletingItem___block_invoke;
      v15[3] = &unk_1E204A708;
      v15[4] = self;
      v16 = v4;
      v17 = v6;
      objc_msgSend(v13, "performBlock:", v15);

    }
    else
    {
      -[CNAccountsAndGroupsViewController dataSource](self, "dataSource");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "reload");

      -[CNAccountsAndGroupsViewController reloadData](self, "reloadData");
      if (v6)
        -[CNAccountsAndGroupsViewController selectAllContacts](self, "selectAllContacts");
    }
  }

}

- (void)cleanUpItemIfNeeded:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  id v12;

  if (a3)
  {
    v4 = a3;
    -[CNAccountsAndGroupsViewController diffableDataSource](self, "diffableDataSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "indexPathForItemIdentifier:", v4);
    v12 = (id)objc_claimAutoreleasedReturnValue();

    v6 = v12;
    if (v12)
    {
      -[CNAccountsAndGroupsViewController collectionView](self, "collectionView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "cellForItemAtIndexPath:", v12);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        objc_opt_class();
        v9 = v8;
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v10 = v9;
        else
          v10 = 0;
        v11 = v10;

        if (v11)
          objc_msgSend(v11, "endEditingName");

      }
      v6 = v12;
    }

  }
}

- (void)removePlaceholderCellsIfNeededInSection:(id)a3 animated:(BOOL)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  BOOL v13;

  v6 = a3;
  +[CNUIContactsEnvironment currentEnvironment](CNUIContactsEnvironment, "currentEnvironment");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "defaultSchedulerProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "mainThreadScheduler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __86__CNAccountsAndGroupsViewController_removePlaceholderCellsIfNeededInSection_animated___block_invoke;
  v11[3] = &unk_1E204A708;
  v11[4] = self;
  v12 = v6;
  v13 = a4;
  v10 = v6;
  objc_msgSend(v9, "performBlock:", v11);

}

- (void)reloadCollectionViewAddingPlaceholderItem:(id)a3 inSectionWithIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  -[CNAccountsAndGroupsViewController resignAllFirstRespondersSavingCurrentlyEditing:](self, "resignAllFirstRespondersSavingCurrentlyEditing:", 0);
  if (v6 && v7)
  {
    -[CNAccountsAndGroupsViewController dataSource](self, "dataSource");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sectionForIdentifier:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      +[CNUIContactsEnvironment currentEnvironment](CNUIContactsEnvironment, "currentEnvironment");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "defaultSchedulerProvider");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "mainThreadScheduler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __103__CNAccountsAndGroupsViewController_reloadCollectionViewAddingPlaceholderItem_inSectionWithIdentifier___block_invoke;
      v13[3] = &unk_1E204FAA0;
      v13[4] = self;
      v14 = v9;
      v15 = v6;
      objc_msgSend(v12, "performBlock:", v13);

    }
  }

}

- (void)reloadCollectionViewForSectionWithIdentifier:(id)a3 settingFilterForEditingItem:(BOOL)a4 allowsReloadWhenEditing:(BOOL)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  BOOL v14;

  v8 = a3;
  if (v8)
  {
    if (!-[CNAccountsAndGroupsViewController isEditing](self, "isEditing") || a5)
    {
      -[CNAccountsAndGroupsViewController resignAllFirstRespondersSavingCurrentlyEditing:](self, "resignAllFirstRespondersSavingCurrentlyEditing:", 1);
      +[CNUIContactsEnvironment currentEnvironment](CNUIContactsEnvironment, "currentEnvironment");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "defaultSchedulerProvider");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "mainThreadScheduler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __134__CNAccountsAndGroupsViewController_reloadCollectionViewForSectionWithIdentifier_settingFilterForEditingItem_allowsReloadWhenEditing___block_invoke;
      v12[3] = &unk_1E204A708;
      v12[4] = self;
      v13 = v8;
      v14 = a4;
      objc_msgSend(v11, "performBlock:", v12);

    }
    else
    {
      -[CNAccountsAndGroupsViewController setNeedsReload:](self, "setNeedsReload:", 1);
    }
  }

}

- (void)reloadData
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  void *v12;
  int v13;
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
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  CNAccountsAndGroupsViewController *v38;
  _QWORD v39[5];
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  void *v44;
  void *v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  -[CNAccountsAndGroupsViewController resignAllFirstRespondersSavingCurrentlyEditing:](self, "resignAllFirstRespondersSavingCurrentlyEditing:", 1);
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v38 = self;
  -[CNAccountsAndGroupsViewController dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sections");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v41;
    v8 = *MEMORY[0x1E0D13848];
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v41 != v7)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
        v11 = objc_alloc_init(MEMORY[0x1E0DC3390]);
        objc_msgSend(v10, "title");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (*(uint64_t (**)(uint64_t, void *))(v8 + 16))(v8, v12);

        if (v13)
        {
          objc_msgSend(v10, "items");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "appendItems:", v14);
        }
        else
        {
          v45 = v10;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v45, 1);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "appendItems:", v15);

          objc_msgSend(v10, "items");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "appendItems:intoParent:", v16, v10);

          v44 = v10;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v44, 1);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "expandItems:", v14);
        }

        -[CNAccountsAndGroupsViewController sectionController](v38, "sectionController");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "applySnapshot:toSection:animatingDifferences:completion:", v11, v10, 0, 0);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
    }
    while (v6);
  }

  -[CNAccountsAndGroupsViewController diffableDataSource](v38, "diffableDataSource");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "snapshot");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNAccountsAndGroupsViewController sectionController](v38, "sectionController");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "associatedSectionIdentifiers");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __47__CNAccountsAndGroupsViewController_reloadData__block_invoke;
  v39[3] = &unk_1E204E200;
  v39[4] = v38;
  objc_msgSend(v21, "_cn_filter:", v39);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "allObjects");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (((*(uint64_t (**)(void))(*MEMORY[0x1E0D137F8] + 16))() & 1) == 0)
    objc_msgSend(v19, "deleteSectionsWithIdentifiers:", v23);
  -[CNAccountsAndGroupsViewController dataSource](v38, "dataSource");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "sections");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "firstObject");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v26, "isAllContactsGlobalSection"))
  {
    objc_msgSend(v19, "sectionIdentifiers");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v27, "count") < 2)
    {
LABEL_20:

      goto LABEL_21;
    }
    objc_msgSend(v19, "sectionIdentifiers");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "firstObject");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v29, "isEqual:", v26))
    {

LABEL_19:
      goto LABEL_20;
    }
    objc_msgSend(v19, "sectionIdentifiers");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "containsObject:", v26);

    if (v31)
    {
      objc_msgSend(v19, "sectionIdentifiers");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "firstObject");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "moveSectionWithIdentifier:beforeSectionWithIdentifier:", v26, v28);
      goto LABEL_19;
    }
  }
LABEL_21:
  objc_msgSend(v19, "itemIdentifiers");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "reloadItemsWithIdentifiers:", v32);

  -[CNAccountsAndGroupsViewController diffableDataSource](v38, "diffableDataSource");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "applySnapshot:animatingDifferences:", v19, 0);

  -[CNAccountsAndGroupsViewController groupsStyle](v38, "groupsStyle");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "backgroundColor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNAccountsAndGroupsViewController view](v38, "view");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setBackgroundColor:", v35);

  -[CNAccountsAndGroupsViewController collectionView](v38, "collectionView");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setBackgroundColor:", v35);

  -[CNAccountsAndGroupsViewController reloadAddGroupButton](v38, "reloadAddGroupButton");
  -[CNAccountsAndGroupsViewController updateSelectionIfNeeded](v38, "updateSelectionIfNeeded");
  -[CNAccountsAndGroupsViewController restoreCurrentlyEditingGroupIfNeeded](v38, "restoreCurrentlyEditingGroupIfNeeded");

}

- (void)expandSectionForAccountWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CNAccountsAndGroupsViewController dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sectionForIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[CNAccountsAndGroupsViewController sectionController](self, "sectionController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "snapshotForSection:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8 && (objc_msgSend(v8, "isExpanded:", v6) & 1) == 0)
    {
      v11[0] = v6;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "expandItems:", v9);

      -[CNAccountsAndGroupsViewController sectionController](self, "sectionController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "applySnapshot:toSection:animatingDifferences:completion:", v8, v6, 1, 0);

    }
  }

}

- (void)resignAllFirstRespondersSavingCurrentlyEditing:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;

  v3 = a3;
  -[CNAccountsAndGroupsViewController dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentlyEditingGroupIdentifier");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  -[CNAccountsAndGroupsViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "endEditing:", 1);

  if (v3)
    v7 = v9;
  else
    v7 = 0;
  -[CNAccountsAndGroupsViewController dataSource](self, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setCurrentlyEditingGroupIdentifier:", v7);

}

- (void)updateSelectionIfNeeded
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[CNAccountsAndGroupsViewController groupsStyle](self, "groupsStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "shouldShowCellSelection");

  if ((v4 & 1) != 0)
  {
    -[CNAccountsAndGroupsViewController currentlySelectedItem](self, "currentlySelectedItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v9 = v5;
      -[CNAccountsAndGroupsViewController diffableDataSource](self, "diffableDataSource");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "indexPathForItemIdentifier:", v9);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        -[CNAccountsAndGroupsViewController collectionView](self, "collectionView");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "selectItemAtIndexPath:animated:scrollPosition:", v7, 0, 0);

      }
      v5 = v9;
    }

  }
  else
  {
    -[CNAccountsAndGroupsViewController deselectAllItems](self, "deselectAllItems");
  }
}

- (id)currentlySelectedItem
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[5];

  -[CNAccountsAndGroupsViewController diffableDataSource](self, "diffableDataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "snapshot");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "itemIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __58__CNAccountsAndGroupsViewController_currentlySelectedItem__block_invoke;
  v8[3] = &unk_1E204FDC0;
  v8[4] = self;
  objc_msgSend(v5, "_cn_firstObjectPassingTest:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)restoreCurrentlyEditingGroupIfNeeded
{
  void *v3;
  id v4;

  -[CNAccountsAndGroupsViewController dataSource](self, "dataSource");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentlyEditingGroupItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAccountsAndGroupsViewController setEditingForGroupItem:](self, "setEditingForGroupItem:", v3);

}

- (void)setEditingForGroupItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  dispatch_time_t v9;
  _QWORD v10[5];
  id v11;

  if (a3)
  {
    v4 = a3;
    -[CNAccountsAndGroupsViewController diffableDataSource](self, "diffableDataSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "indexPathForItemIdentifier:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[CNAccountsAndGroupsViewController dataSource](self, "dataSource");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setCurrentlyEditingGroupIdentifier:", 0);

    if (v6)
    {
      -[CNAccountsAndGroupsViewController collectionView](self, "collectionView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "scrollToItemAtIndexPath:atScrollPosition:animated:", v6, 2, 0);

      v9 = dispatch_time(0, 500000000);
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __60__CNAccountsAndGroupsViewController_setEditingForGroupItem___block_invoke;
      v10[3] = &unk_1E2050400;
      v10[4] = self;
      v11 = v6;
      dispatch_after(v9, MEMORY[0x1E0C80D38], v10);

    }
  }
}

- (BOOL)isAnyListCellCurrentlyEditing
{
  CNAccountsAndGroupsViewController *v2;
  void *v3;
  void *v4;
  _QWORD v6[5];

  v2 = self;
  -[CNAccountsAndGroupsViewController collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "indexPathsForVisibleItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __66__CNAccountsAndGroupsViewController_isAnyListCellCurrentlyEditing__block_invoke;
  v6[3] = &unk_1E204AF60;
  v6[4] = v2;
  LOBYTE(v2) = objc_msgSend(v4, "_cn_any:", v6);

  return (char)v2;
}

- (void)deselectAllItems
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[CNAccountsAndGroupsViewController collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "indexPathsForSelectedItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9);
        -[CNAccountsAndGroupsViewController collectionView](self, "collectionView", (_QWORD)v12);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "deselectItemAtIndexPath:animated:", v10, 0);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

}

- (void)contactStoreDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  +[CNUIContactsEnvironment currentEnvironment](CNUIContactsEnvironment, "currentEnvironment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "defaultSchedulerProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mainThreadScheduler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __59__CNAccountsAndGroupsViewController_contactStoreDidChange___block_invoke;
  v9[3] = &unk_1E2050400;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  objc_msgSend(v7, "performBlock:", v9);

}

- (BOOL)isNotificationInternalSave:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;

  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0C97088]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 && (objc_msgSend(v6, "BOOLValue") & 1) != 0)
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(v4, "userInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", *MEMORY[0x1E0C97090]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)MEMORY[0x1E0C99E60];
    -[CNAccountsAndGroupsViewController actionsProvider](self, "actionsProvider");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "issuedSaveRequestIdentifiers");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setWithArray:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = *MEMORY[0x1E0D13840];
    if (((*(uint64_t (**)(_QWORD, void *))(*MEMORY[0x1E0D13840] + 16))(*MEMORY[0x1E0D13840], v14) & 1) != 0
      || ((*(uint64_t (**)(uint64_t, void *))(v15 + 16))(v15, v10) & 1) != 0)
    {
      v7 = 0;
    }
    else
    {
      v7 = objc_msgSend(v10, "isSubsetOfSet:", v14);
    }

  }
  return v7;
}

- (BOOL)viewCanReload
{
  BOOL v3;
  int v4;
  uint64_t v5;
  void *v6;
  void *v7;

  if (-[CNAccountsAndGroupsViewController isViewLoaded](self, "isViewLoaded"))
    v3 = -[CNAccountsAndGroupsViewController isVisible](self, "isVisible");
  else
    v3 = 0;
  if ((-[CNAccountsAndGroupsViewController isEditing](self, "isEditing") & 1) != 0)
  {
    LOBYTE(v4) = 0;
  }
  else
  {
    v5 = *MEMORY[0x1E0D13850];
    -[CNAccountsAndGroupsViewController dataSource](self, "dataSource");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "currentlyEditingGroupIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (((*(uint64_t (**)(uint64_t, void *))(v5 + 16))(v5, v7) & 1) != 0)
      LOBYTE(v4) = 0;
    else
      v4 = !-[CNAccountsAndGroupsViewController isAnyListCellCurrentlyEditing](self, "isAnyListCellCurrentlyEditing");

  }
  return v3 & v4;
}

- (id)groupsStyle
{
  void *v2;
  void *v3;

  -[CNAccountsAndGroupsViewController traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNAccountsAndGroupsStyle styleForTraitCollection:](CNAccountsAndGroupsStyle, "styleForTraitCollection:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)layout
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v11[5];
  id v12;
  id v13;
  _QWORD v14[5];
  _QWORD aBlock[5];

  v3 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __43__CNAccountsAndGroupsViewController_layout__block_invoke;
  aBlock[3] = &unk_1E20498C0;
  aBlock[4] = self;
  v4 = _Block_copy(aBlock);
  v14[0] = v3;
  v14[1] = 3221225472;
  v14[2] = __43__CNAccountsAndGroupsViewController_layout__block_invoke_2;
  v14[3] = &unk_1E20498C0;
  v14[4] = self;
  v5 = _Block_copy(v14);
  v6 = objc_alloc(MEMORY[0x1E0DC35D0]);
  v11[0] = v3;
  v11[1] = 3221225472;
  v11[2] = __43__CNAccountsAndGroupsViewController_layout__block_invoke_3;
  v11[3] = &unk_1E20498E8;
  v11[4] = self;
  v12 = v4;
  v13 = v5;
  v7 = v5;
  v8 = v4;
  v9 = (void *)objc_msgSend(v6, "initWithSectionProvider:", v11);

  return v9;
}

- (void)configureDataSource
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  _QWORD v18[5];
  _QWORD v19[5];
  void *v20;
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0DC40D8]);
  v4 = objc_opt_class();
  v5 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __56__CNAccountsAndGroupsViewController_configureDataSource__block_invoke;
  v19[3] = &unk_1E2049910;
  v19[4] = self;
  v6 = (void *)objc_msgSend(v3, "initWithIdentifier:cellClass:handler:", CFSTR("Header"), v4, v19);
  v18[0] = v5;
  v18[1] = 3221225472;
  v18[2] = __56__CNAccountsAndGroupsViewController_configureDataSource__block_invoke_2;
  v18[3] = &unk_1E2049938;
  v18[4] = self;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC40D8]), "initWithIdentifier:cellClass:handler:", CFSTR("List"), objc_opt_class(), v18);
  v8 = objc_alloc(MEMORY[0x1E0DC40E0]);
  v21[0] = v6;
  v21[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithItemRenderers:", v9);

  v11 = objc_alloc_init(MEMORY[0x1E0DC40E8]);
  v17[0] = v5;
  v17[1] = 3221225472;
  v17[2] = __56__CNAccountsAndGroupsViewController_configureDataSource__block_invoke_3;
  v17[3] = &unk_1E2049960;
  v17[4] = self;
  objc_msgSend(v11, "setWillCollapseItemHandler:", v17);
  objc_msgSend(v10, "setHandlers:", v11);
  -[CNAccountsAndGroupsViewController setSectionController:](self, "setSectionController:", v10);
  v12 = objc_alloc(MEMORY[0x1E0DC35E8]);
  -[CNAccountsAndGroupsViewController collectionView](self, "collectionView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v20, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v12, "initWithCollectionView:sectionControllers:rendererIdentifierProvider:", v13, v14, &__block_literal_global_156);

  -[CNAccountsAndGroupsViewController setDiffableDataSource:](self, "setDiffableDataSource:", v15);
  -[CNAccountsAndGroupsViewController collectionView](self, "collectionView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setDelegate:", self);

}

- (BOOL)shouldEnableItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  char v8;
  char v9;

  v4 = a3;
  -[CNAccountsAndGroupsViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "accountsAndGroupsViewController:shouldEnableItemWithIdentifier:", self, v6);

  if (-[CNAccountsAndGroupsViewController isEditing](self, "isEditing"))
    v8 = objc_msgSend(v4, "isEditable");
  else
    v8 = 1;
  v9 = v7 & v8;

  return v9;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CNAccountsAndGroupsViewController;
  v4 = a3;
  -[CNAccountsAndGroupsViewController traitCollectionDidChange:](&v8, sel_traitCollectionDidChange_, v4);
  v5 = objc_msgSend(v4, "_splitViewControllerContext", v8.receiver, v8.super_class);

  -[CNAccountsAndGroupsViewController traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "_splitViewControllerContext");

  if (v5 != v7)
  {
    -[CNAccountsAndGroupsViewController reloadData](self, "reloadData");
    -[CNAccountsAndGroupsViewController updateNavigationButtons](self, "updateNavigationButtons");
  }
}

- (void)selectAllContacts
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;

  -[CNAccountsAndGroupsViewController dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "showAllSectionItem");
  v16 = (id)objc_claimAutoreleasedReturnValue();

  -[CNAccountsAndGroupsViewController dataSource](self, "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count") != 1)
    goto LABEL_4;
  -[CNAccountsAndGroupsViewController dataSource](self, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sections");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "items");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (v10)
  {
    -[CNAccountsAndGroupsViewController dataSource](self, "dataSource");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "sections");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "items");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v13 = objc_claimAutoreleasedReturnValue();

    v16 = (id)v13;
LABEL_4:

  }
  -[CNAccountsAndGroupsViewController dataSource](self, "dataSource");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setFilterForItem:", v16);

  -[CNAccountsAndGroupsViewController delegate](self, "delegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "accountsAndGroupsViewControllerDidUpdateSelection:", self);

  -[CNAccountsAndGroupsViewController updateSelectionIfNeeded](self, "updateSelectionIfNeeded");
}

- (BOOL)isCollectionViewEditing
{
  void *v2;
  char v3;

  -[CNAccountsAndGroupsViewController collectionView](self, "collectionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEditing");

  return v3;
}

- (void)cellTextViewDidChangeHeight
{
  void *v3;
  void *v4;
  id v5;

  -[CNAccountsAndGroupsViewController diffableDataSource](self, "diffableDataSource");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[CNAccountsAndGroupsViewController diffableDataSource](self, "diffableDataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "snapshot");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "applySnapshot:animatingDifferences:", v4, 1);

}

- (void)item:(id)a3 didEndEditingWithName:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v6 = a4;
  -[CNAccountsAndGroupsViewController dataSource](self, "dataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "currentlyEditingGroupIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqualToString:", v9);

  if (v10)
  {
    -[CNAccountsAndGroupsViewController dataSource](self, "dataSource");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setCurrentlyEditingGroupIdentifier:", 0);

  }
  -[CNAccountsAndGroupsViewController actionsProvider](self, "actionsProvider");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "updateItem:withNewName:", v13, v6);

}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;

  v5 = a4;
  -[CNAccountsAndGroupsViewController diffableDataSource](self, "diffableDataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "itemIdentifierForIndexPath:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v7, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("groupPlaceholderIdentifier")) ^ 1;

  }
  else
  {
    LOBYTE(v9) = 0;
  }

  return v9;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
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
  char v16;
  void *v17;
  void *v18;
  id v19;

  v5 = a4;
  -[CNAccountsAndGroupsViewController diffableDataSource](self, "diffableDataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "itemIdentifierForIndexPath:", v5);
  v19 = (id)objc_claimAutoreleasedReturnValue();

  -[CNAccountsAndGroupsViewController dataSource](self, "dataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "filter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNAccountsAndGroupsViewController dataSource](self, "dataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFilterForItem:", v19);

  -[CNAccountsAndGroupsViewController dataSource](self, "dataSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "filter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "isEqual:", v11) & 1) != 0)
  {
    -[CNAccountsAndGroupsViewController dataSource](self, "dataSource");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "serverFilter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
      goto LABEL_7;
  }
  else
  {

  }
  -[CNAccountsAndGroupsViewController delegate](self, "delegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "accountsAndGroupsViewControllerDidUpdateSelection:", self);

  -[CNAccountsAndGroupsViewController delegate](self, "delegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_opt_respondsToSelector();

  if ((v16 & 1) != 0)
  {
    -[CNAccountsAndGroupsViewController delegate](self, "delegate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "accountsAndGroupsViewControllerDidChangeList:", self);

  }
LABEL_7:
  -[CNAccountsAndGroupsViewController delegate](self, "delegate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "accountsAndGroupsViewControllerDidFinish:", self);

  -[CNAccountsAndGroupsViewController resignAllFirstRespondersSavingCurrentlyEditing:](self, "resignAllFirstRespondersSavingCurrentlyEditing:", 0);
  if ((-[CNAccountsAndGroupsViewController isFirstResponder](self, "isFirstResponder") & 1) == 0)
    -[CNAccountsAndGroupsViewController becomeFirstResponder](self, "becomeFirstResponder");

}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v5;
  void *v6;
  id v7;
  id v8;

  v5 = a4;
  objc_opt_class();
  v8 = v5;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v8;
  else
    v6 = 0;
  v7 = v6;

  if (v7)
    objc_msgSend(v7, "prepareForDisplay");

}

- (BOOL)collectionView:(id)a3 canFocusItemAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  char v14;

  v5 = a4;
  objc_opt_class();
  -[CNAccountsAndGroupsViewController diffableDataSource](self, "diffableDataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "itemIdentifierForIndexPath:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  if (v9)
  {
    -[CNAccountsAndGroupsViewController dataSource](self, "dataSource");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "currentlyEditingGroupIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "isEqualToString:", v12);

    v14 = v13 ^ 1;
  }
  else
  {
    v14 = 1;
  }

  return v14;
}

- (id)collectionView:(id)a3 contextMenuConfigurationForItemsAtIndexPaths:(id)a4 point:(CGPoint)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  void *v24;

  v7 = a3;
  v8 = a4;
  if (objc_msgSend(v8, "count") == 1)
  {
    objc_msgSend(v8, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[CNAccountsAndGroupsViewController allowsEditing](self, "allowsEditing")
      && (-[CNAccountsAndGroupsViewController collectionView](self, "collectionView"),
          v10 = (void *)objc_claimAutoreleasedReturnValue(),
          v11 = objc_msgSend(v10, "isEditing"),
          v10,
          (v11 & 1) == 0))
    {
      objc_opt_class();
      -[CNAccountsAndGroupsViewController diffableDataSource](self, "diffableDataSource");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "itemIdentifierForIndexPath:", v9);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v15 = v14;
      else
        v15 = 0;
      v16 = v15;

      objc_opt_class();
      objc_msgSend(v7, "cellForItemAtIndexPath:", v9);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v18 = v17;
      else
        v18 = 0;
      v19 = v18;

      v12 = 0;
      if (v16 && v19)
      {
        objc_msgSend(v16, "identifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNAccountsAndGroupsViewController dataSource](self, "dataSource");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "currentlyEditingGroupIdentifier");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v20, "isEqualToString:", v22);

        if ((v23 & 1) != 0 || !objc_msgSend(v16, "canShowContextMenu"))
        {
          v12 = 0;
        }
        else
        {
          -[CNAccountsAndGroupsViewController actionsProvider](self, "actionsProvider");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "contextMenuConfigurationForItem:cell:atIndexPath:", v16, v19, v9);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

        }
      }

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)collectionView:(id)a3 contextMenuConfiguration:(id)a4 highlightPreviewForItemAtIndexPath:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v6 = a5;
  -[CNAccountsAndGroupsViewController collectionView](self, "collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cellForItemAtIndexPath:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  v9 = v8;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = v9;
  else
    v10 = 0;
  v11 = v10;

  if (v11 && (objc_msgSend(v11, "window"), v12 = (void *)objc_claimAutoreleasedReturnValue(), v12, v12))
  {
    -[CNAccountsAndGroupsViewController groupsStyle](self, "groupsStyle");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "item");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "cellAccessoriesForContextMenuPreviewForItem:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setAccessories:", v15);

    v16 = objc_alloc_init(MEMORY[0x1E0DC3B78]);
    -[CNAccountsAndGroupsViewController groupsStyle](self, "groupsStyle");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "backgroundColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setBackgroundColor:", v18);

    v19 = (void *)MEMORY[0x1E0DC3508];
    objc_msgSend(v11, "bounds");
    objc_msgSend(v19, "bezierPathWithRoundedRect:cornerRadius:");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setVisiblePath:", v20);

    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D90]), "initWithView:parameters:", v11, v16);
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (id)collectionView:(id)a3 contextMenuConfiguration:(id)a4 dismissalPreviewForItemAtIndexPath:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  v6 = a5;
  -[CNAccountsAndGroupsViewController collectionView](self, "collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cellForItemAtIndexPath:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  v9 = v8;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = v9;
  else
    v10 = 0;
  v11 = v10;

  if (v11 && (objc_msgSend(v11, "window"), v12 = (void *)objc_claimAutoreleasedReturnValue(), v12, v12))
  {
    -[CNAccountsAndGroupsViewController groupsStyle](self, "groupsStyle");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "item");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "cellAccessoriesForItem:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setAccessories:", v15);

    v16 = objc_alloc_init(MEMORY[0x1E0DC3B78]);
    -[CNAccountsAndGroupsViewController groupsStyle](self, "groupsStyle");
    v17 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v17, "backgroundColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setBackgroundColor:", v18);

    -[CNAccountsAndGroupsViewController groupsStyle](self, "groupsStyle");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v17) = objc_msgSend(v19, "isInset");

    if ((v17 & 1) == 0)
    {
      v20 = (void *)MEMORY[0x1E0DC3508];
      objc_msgSend(v11, "bounds");
      objc_msgSend(v20, "bezierPathWithRoundedRect:cornerRadius:");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setVisiblePath:", v21);

    }
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D90]), "initWithView:parameters:", v11, v16);

  }
  else
  {
    v22 = 0;
  }

  return v22;
}

- (void)collectionView:(id)a3 willEndContextMenuInteractionWithConfiguration:(id)a4 animator:(id)a5
{
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  objc_msgSend(a4, "identifier", a3);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  -[CNAccountsAndGroupsViewController collectionView](self, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cellForItemAtIndexPath:", v14);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  v8 = v7;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;
  v10 = v9;

  if (v10)
  {
    -[CNAccountsAndGroupsViewController groupsStyle](self, "groupsStyle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "item");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "cellAccessoriesForItem:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setAccessories:", v13);

  }
}

- (id)multitaskingDragExclusionRects
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB3B18];
  -[CNAccountsAndGroupsViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v11[0] = v4;
  v11[1] = v5;
  v11[2] = v6;
  v11[3] = v7;
  objc_msgSend(v2, "valueWithBytes:objCType:", v11, "{CGRect={CGPoint=dd}{CGSize=dd}}");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)collectionView:(id)a3 canHandleDropSession:(id)a4
{
  id v4;
  void *v5;
  char v6;

  v4 = a4;
  objc_msgSend((id)objc_opt_class(), "allowedDropTypes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "hasItemsConformingToTypeIdentifiers:", v5);

  return v6;
}

- (id)collectionView:(id)a3 dropSessionDidUpdate:(id)a4 withDestinationIndexPath:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;

  v6 = a5;
  objc_opt_class();
  -[CNAccountsAndGroupsViewController diffableDataSource](self, "diffableDataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "itemIdentifierForIndexPath:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;
  v10 = v9;

  if (v10 && objc_msgSend(v10, "acceptsVCardDrop"))
  {
    -[CNAccountsAndGroupsViewController dataSource](self, "dataSource");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "containerIdentifierForItem:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if ((*(unsigned int (**)(void))(*MEMORY[0x1E0D13850] + 16))())
    {
      if (objc_msgSend(v10, "type") == 2)
      {
        if (objc_msgSend(v10, "containerType") == 2)
          v13 = 3;
        else
          v13 = 2;
      }
      else
      {
        v13 = 2;
      }
    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3608]), "initWithDropOperation:intent:", v13, 2);

  return v14;
}

- (void)collectionView:(id)a3 performDropWithCoordinator:(id)a4
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
  id v15;
  id v16;
  id v17;
  void *v18;
  uint64_t v19;
  id v20;
  id v21;
  NSObject *v22;
  uint64_t v23;
  id v24;
  void *v25;
  _QWORD v26[5];
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  uint8_t buf[4];
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  -[CNAccountsAndGroupsViewController diffableDataSource](self, "diffableDataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "destinationIndexPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "itemIdentifierForIndexPath:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNAccountsAndGroupsViewController dataSource](self, "dataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "containerIdentifierForItem:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNAccountsAndGroupsViewController groupsAndContainersSaveManager](self, "groupsAndContainersSaveManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "containerForContainerIdentifier:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNAccountsAndGroupsViewController groupsAndContainersSaveManager](self, "groupsAndContainersSaveManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "acAccountForContainer:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v25 = v10;
    v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v16 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v17 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v5, "session");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_opt_class();
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __79__CNAccountsAndGroupsViewController_collectionView_performDropWithCoordinator___block_invoke;
    v26[3] = &unk_1E20499C8;
    v26[4] = self;
    v27 = v14;
    v28 = v17;
    v29 = v12;
    v30 = v16;
    v31 = v15;
    v32 = v8;
    v20 = v15;
    v21 = v16;
    v22 = v17;
    v23 = v19;
    v10 = v25;
    v24 = (id)objc_msgSend(v18, "loadObjectsOfClass:completion:", v23, v26);

  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "log");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v34 = v8;
      _os_log_error_impl(&dword_18AC56000, v22, OS_LOG_TYPE_ERROR, "Could not complete drop, failed to fetch container for destination item:%@", buf, 0xCu);
    }
  }

}

- (void)authorizedAddContacts:(id)a3 toDestinationItem:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  NSObject *v16;
  int v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[CNAccountsAndGroupsViewController dataSource](self, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "containerIdentifierForItem:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (((*(uint64_t (**)(void))(*MEMORY[0x1E0D13850] + 16))() & 1) != 0)
  {
    -[CNAccountsAndGroupsViewController dataSource](self, "dataSource");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "groupIdentifierForGroupItem:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[CNAccountsAndGroupsViewController groupsAndContainersSaveManager](self, "groupsAndContainersSaveManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (id)objc_msgSend(v12, "addContacts:toGroupWithIdentifier:inContainerWithIdentifier:moveWasAuthorized:", v6, v11, v9, 1);

    -[CNAccountsAndGroupsViewController dataSource](self, "dataSource");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "sectionIdentifierForItem:", v7);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
      -[CNAccountsAndGroupsViewController reloadCollectionViewForSectionWithIdentifier:settingFilterForEditingItem:allowsReloadWhenEditing:](self, "reloadCollectionViewForSectionWithIdentifier:settingFilterForEditingItem:allowsReloadWhenEditing:", v15, 0, 1);

  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "log");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = 138412290;
      v18 = v7;
      _os_log_error_impl(&dword_18AC56000, v16, OS_LOG_TYPE_ERROR, "Could not add contacts to item: %@, container identifier is nil", (uint8_t *)&v17, 0xCu);
    }

  }
}

- (void)editAuthorizationController:(id)a3 authorizationDidFinishWithResult:(int64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  void (**v9)(_QWORD, _QWORD);
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  -[CNAccountsAndGroupsViewController setEditAuthorizationController:](self, "setEditAuthorizationController:", 0);
  -[CNAccountsAndGroupsViewController currentAuthorizationContext](self, "currentAuthorizationContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    if ((unint64_t)a4 >= 2)
    {
      if (a4 == 2)
      {
        -[CNAccountsAndGroupsViewController currentAuthorizationContext](self, "currentAuthorizationContext");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "type");

        switch(v11)
        {
          case 0:
            -[CNAccountsAndGroupsViewController currentAuthorizationContext](self, "currentAuthorizationContext");
            v18 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "contactsToAddToDropDestination");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            -[CNAccountsAndGroupsViewController currentAuthorizationContext](self, "currentAuthorizationContext");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "item");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            -[CNAccountsAndGroupsViewController authorizedAddContacts:toDestinationItem:](self, "authorizedAddContacts:toDestinationItem:", v12, v14);

            goto LABEL_11;
          case 1:
            -[CNAccountsAndGroupsViewController actionsProvider](self, "actionsProvider");
            v18 = (id)objc_claimAutoreleasedReturnValue();
            -[CNAccountsAndGroupsViewController currentAuthorizationContext](self, "currentAuthorizationContext");
            v9 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "cell");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "authorizedEditGroupNameForCell:", v15);
            goto LABEL_13;
          case 2:
            -[CNAccountsAndGroupsViewController actionsProvider](self, "actionsProvider");
            v18 = (id)objc_claimAutoreleasedReturnValue();
            -[CNAccountsAndGroupsViewController currentAuthorizationContext](self, "currentAuthorizationContext");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "item");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            -[CNAccountsAndGroupsViewController currentAuthorizationContext](self, "currentAuthorizationContext");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "actionCompletionHandler");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "authorizedDeleteGroupForItem:completionHandler:", v13, v17);

LABEL_11:
            goto LABEL_15;
          case 3:
            -[CNAccountsAndGroupsViewController actionsProvider](self, "actionsProvider");
            v18 = (id)objc_claimAutoreleasedReturnValue();
            -[CNAccountsAndGroupsViewController currentAuthorizationContext](self, "currentAuthorizationContext");
            v9 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "containerItem");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "authorizedCreateGroupActionForContainerItem:", v15);
LABEL_13:

            goto LABEL_14;
          case 4:
            -[CNAccountsAndGroupsViewController authorizedSetViewEditing:animated:](self, "authorizedSetViewEditing:animated:", 1, 1);
            return;
          default:
            return;
        }
      }
    }
    else
    {
      -[CNAccountsAndGroupsViewController currentAuthorizationContext](self, "currentAuthorizationContext");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "actionCompletionHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        -[CNAccountsAndGroupsViewController currentAuthorizationContext](self, "currentAuthorizationContext");
        v18 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "actionCompletionHandler");
        v9 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        v9[2](v9, 0);
LABEL_14:

LABEL_15:
      }
    }
  }
}

- (void)presentController:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;

  v4 = a4;
  v6 = a3;
  -[CNAccountsAndGroupsViewController setPotentiallyPresentedViewController:](self, "setPotentiallyPresentedViewController:", v6);
  -[CNAccountsAndGroupsViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v6, v4, 0);

}

- (void)presentErrorAlertWithMessage:(id)a3 animated:(BOOL)a4
{
  -[CNAccountsAndGroupsViewController presentErrorAlertWithTitle:message:animated:](self, "presentErrorAlertWithTitle:message:animated:", 0, a3, a4);
}

- (void)presentErrorAlertWithTitle:(id)a3 message:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v5 = a5;
  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", a3, a4, 1);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0DC3448];
  CNContactsUIBundle();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("OKAY"), &stru_1E20507A8, CFSTR("Localized"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "actionWithTitle:style:handler:", v9, 0, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "addAction:", v10);
  -[CNAccountsAndGroupsViewController presentController:animated:](self, "presentController:animated:", v11, v5);

}

- (void)showEditAuthorizationPaneWithAuthorizationContext:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  CNUIEditAuthorizationController *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a4;
  -[CNAccountsAndGroupsViewController setCurrentAuthorizationContext:](self, "setCurrentAuthorizationContext:", a3);
  v6 = objc_alloc_init(CNUIEditAuthorizationController);
  -[CNAccountsAndGroupsViewController setEditAuthorizationController:](self, "setEditAuthorizationController:", v6);

  -[CNAccountsAndGroupsViewController editAuthorizationController](self, "editAuthorizationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDelegate:", self);

  -[CNAccountsAndGroupsViewController editAuthorizationController](self, "editAuthorizationController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSender:", self);

  -[CNAccountsAndGroupsViewController editAuthorizationController](self, "editAuthorizationController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAnimated:", v4);

  -[CNAccountsAndGroupsViewController editAuthorizationController](self, "editAuthorizationController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setGuardedViewController:", self);

  -[CNAccountsAndGroupsViewController editAuthorizationController](self, "editAuthorizationController");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "presentAuthorizationUI");

}

- (void)didTapCollectionView:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  id v13;

  v4 = a3;
  -[CNAccountsAndGroupsViewController collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locationInView:", v5);
  v7 = v6;

  -[CNAccountsAndGroupsViewController collectionView](self, "collectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  v10 = v9;

  -[CNAccountsAndGroupsViewController collectionView](self, "collectionView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "collectionViewLayout");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "layoutAttributesForElementsInRect:", 0.0, v7, v10, 1.0);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  if ((*(unsigned int (**)(void))(*MEMORY[0x1E0D137F8] + 16))())
    -[CNAccountsAndGroupsViewController dismissKeyboard](self, "dismissKeyboard");

}

- (void)dismissKeyboard
{
  id v2;

  -[CNAccountsAndGroupsViewController view](self, "view");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "endEditing:", 1);

}

- (void)keyboardWillShow:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  id v33;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0DC4E90]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "CGRectValue");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  -[CNAccountsAndGroupsViewController collectionView](self, "collectionView");
  v33 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "window");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "convertRect:fromWindow:", 0, v7, v9, v11, v13);
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;

  objc_msgSend(v33, "convertRect:fromView:", 0, v16, v18, v20, v22);
  v24 = v23;
  -[CNAccountsAndGroupsViewController collectionView](self, "collectionView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "contentInset");
  v27 = v26;
  v29 = v28;
  v31 = v30;

  -[CNAccountsAndGroupsViewController collectionView](self, "collectionView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setContentInset:", v27, v29, v24, v31);

}

- (void)keyboardWillHide:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  id v7;

  v3 = *MEMORY[0x1E0DC49E8];
  v4 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
  v5 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
  v6 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
  -[CNAccountsAndGroupsViewController collectionView](self, "collectionView", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setContentInset:", v3, v4, v5, v6);

}

- (void)action:(id)a3 presentViewController:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  id v19;

  v19 = a4;
  objc_msgSend(v19, "popoverPresentationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sourceView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    -[CNAccountsAndGroupsViewController collectionView](self, "collectionView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "popoverPresentationController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setSourceView:", v7);

    -[CNAccountsAndGroupsViewController collectionView](self, "collectionView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bounds");
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v17 = v16;
    objc_msgSend(v19, "popoverPresentationController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setSourceRect:", v11, v13, v15, v17);

  }
  -[CNAccountsAndGroupsViewController presentController:animated:](self, "presentController:animated:", v19, 1);

}

- (void)_updateUserActivity
{
  NSObject *v3;
  void *v4;
  CNAccountsAndGroupsViewController *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  int v16;
  CNAccountsAndGroupsViewController *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (CNUIIsContacts() || CNUIIsMobilePhone())
  {
    objc_msgSend((id)objc_opt_class(), "log");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "bundleIdentifier");
      v5 = (CNAccountsAndGroupsViewController *)objc_claimAutoreleasedReturnValue();
      v16 = 138412290;
      v17 = v5;
      _os_log_impl(&dword_18AC56000, v3, OS_LOG_TYPE_INFO, "Activity continuity - running in %@", (uint8_t *)&v16, 0xCu);

    }
    -[CNAccountsAndGroupsViewController activityManager](self, "activityManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "makeActivityAdvertisingViewingGroups");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[CNAccountsAndGroupsViewController userActivity](self, "userActivity");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v7)
    {

      if (!v9)
      {
        -[CNAccountsAndGroupsViewController setUserActivity:](self, "setUserActivity:", v7);
        -[CNAccountsAndGroupsViewController userActivity](self, "userActivity");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "becomeCurrent");

        objc_msgSend((id)objc_opt_class(), "log");
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          -[CNAccountsAndGroupsViewController userActivity](self, "userActivity");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = 138412546;
          v17 = self;
          v18 = 2112;
          v19 = v12;
          _os_log_impl(&dword_18AC56000, v11, OS_LOG_TYPE_INFO, "Activity continuity -  %@ created %@", (uint8_t *)&v16, 0x16u);

        }
      }
      -[CNAccountsAndGroupsViewController userActivity](self, "userActivity");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setNeedsSave:", 1);

    }
    else
    {
      objc_msgSend(v8, "resignCurrent");

      objc_msgSend((id)objc_opt_class(), "log");
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        -[CNAccountsAndGroupsViewController userActivity](self, "userActivity");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 138412546;
        v17 = self;
        v18 = 2112;
        v19 = v15;
        _os_log_impl(&dword_18AC56000, v14, OS_LOG_TYPE_INFO, "Activity continuity -  %@ removed %@", (uint8_t *)&v16, 0x16u);

      }
      -[CNAccountsAndGroupsViewController setUserActivity:](self, "setUserActivity:", 0);
    }

  }
}

- (CNAccountsAndGroupsDataSource)dataSource
{
  return self->_dataSource;
}

- (CNManagedConfiguration)managedConfiguration
{
  return self->_managedConfiguration;
}

- (CNAccountsAndGroupsViewControllerDelegate)delegate
{
  return (CNAccountsAndGroupsViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (BOOL)allowsEditing
{
  return self->_allowsEditing;
}

- (void)setAllowsEditing:(BOOL)a3
{
  self->_allowsEditing = a3;
}

- (BOOL)allowsCanceling
{
  return self->_allowsCanceling;
}

- (void)setAllowsCanceling:(BOOL)a3
{
  self->_allowsCanceling = a3;
}

- (BOOL)allowsDone
{
  return self->_allowsDone;
}

- (void)setAllowsDone:(BOOL)a3
{
  self->_allowsDone = a3;
}

- (BOOL)isLimitedAccessOnboarding
{
  return self->_isLimitedAccessOnboarding;
}

- (void)setIsLimitedAccessOnboarding:(BOOL)a3
{
  self->_isLimitedAccessOnboarding = a3;
}

- (BOOL)needsReload
{
  return self->_needsReload;
}

- (void)setNeedsReload:(BOOL)a3
{
  self->_needsReload = a3;
}

- (BOOL)isVisible
{
  return self->_isVisible;
}

- (void)setIsVisible:(BOOL)a3
{
  self->_isVisible = a3;
}

- (CNUIGroupsAndContainersSaveManager)groupsAndContainersSaveManager
{
  return self->_groupsAndContainersSaveManager;
}

- (void)setGroupsAndContainersSaveManager:(id)a3
{
  objc_storeStrong((id *)&self->_groupsAndContainersSaveManager, a3);
}

- (CNUIEditAuthorizationController)editAuthorizationController
{
  return self->_editAuthorizationController;
}

- (void)setEditAuthorizationController:(id)a3
{
  objc_storeStrong((id *)&self->_editAuthorizationController, a3);
}

- (CNContainerDataSource)containerDataSource
{
  return self->_containerDataSource;
}

- (void)setContainerDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_containerDataSource, a3);
}

- (CNAccountsAndGroupsAuthorizationContext)currentAuthorizationContext
{
  return self->_currentAuthorizationContext;
}

- (void)setCurrentAuthorizationContext:(id)a3
{
  objc_storeStrong((id *)&self->_currentAuthorizationContext, a3);
}

- (CNAccountsAndGroupsActionsProvider)actionsProvider
{
  return self->_actionsProvider;
}

- (void)setActionsProvider:(id)a3
{
  objc_storeStrong((id *)&self->_actionsProvider, a3);
}

- (CNUIUserActivityManager)activityManager
{
  return self->_activityManager;
}

- (int64_t)buttonBehavior
{
  return self->_buttonBehavior;
}

- (void)setButtonBehavior:(int64_t)a3
{
  self->_buttonBehavior = a3;
}

- (void)setAddGroupKeyCommand:(id)a3
{
  objc_storeStrong((id *)&self->_addGroupKeyCommand, a3);
}

- (UIViewController)potentiallyPresentedViewController
{
  return self->_potentiallyPresentedViewController;
}

- (void)setPotentiallyPresentedViewController:(id)a3
{
  objc_storeStrong((id *)&self->_potentiallyPresentedViewController, a3);
}

- (UICollectionView)collectionView
{
  return (UICollectionView *)objc_getProperty(self, a2, 1072, 1);
}

- (void)setCollectionView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1072);
}

- (_UIDiffableDataSourceOutlineSectionController)sectionController
{
  return (_UIDiffableDataSourceOutlineSectionController *)objc_getProperty(self, a2, 1080, 1);
}

- (void)setSectionController:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1080);
}

- (UICollectionViewDiffableDataSource)diffableDataSource
{
  return (UICollectionViewDiffableDataSource *)objc_getProperty(self, a2, 1088, 1);
}

- (void)setDiffableDataSource:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1088);
}

- (void)setAddGroupBarButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_addGroupBarButtonItem, a3);
}

- (void)setCancelBarButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_cancelBarButtonItem, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cancelBarButtonItem, 0);
  objc_storeStrong((id *)&self->_addGroupBarButtonItem, 0);
  objc_storeStrong((id *)&self->_diffableDataSource, 0);
  objc_storeStrong((id *)&self->_sectionController, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_potentiallyPresentedViewController, 0);
  objc_storeStrong((id *)&self->_addGroupKeyCommand, 0);
  objc_storeStrong((id *)&self->_activityManager, 0);
  objc_storeStrong((id *)&self->_actionsProvider, 0);
  objc_storeStrong((id *)&self->_currentAuthorizationContext, 0);
  objc_storeStrong((id *)&self->_containerDataSource, 0);
  objc_storeStrong((id *)&self->_editAuthorizationController, 0);
  objc_storeStrong((id *)&self->_groupsAndContainersSaveManager, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_managedConfiguration, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
}

void __79__CNAccountsAndGroupsViewController_collectionView_performDropWithCoordinator___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id *v11;
  void *v12;
  int v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  CNAccountsAndGroupsAuthorizationContext *v18;
  id *v19;
  id obj;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = a2;
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v22;
    v19 = (id *)(a1 + 64);
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v22 != v5)
          objc_enumerationMutation(obj);
        v7 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v6);
        objc_msgSend(*(id *)(a1 + 32), "groupsAndContainersSaveManager", v19);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = *(_QWORD *)(a1 + 40);
        objc_msgSend(*(id *)(a1 + 32), "managedConfiguration");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v9) = objc_msgSend(v8, "isMDMAuthorizedToAddContact:toAccount:withManagedConfiguration:", v7, v9, v10);

        v11 = (id *)(a1 + 48);
        if ((_DWORD)v9)
        {
          objc_msgSend(*(id *)(a1 + 32), "groupsAndContainersSaveManager");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "isAuthorizedToAddContact:toContainer:ignoresParentalRestrictions:", v7, *(_QWORD *)(a1 + 56), 0);

          v11 = v19;
          if (v13)
            v11 = (id *)(a1 + 72);
        }
        objc_msgSend(*v11, "addObject:", v7);
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v4);
  }
  v14 = *MEMORY[0x1E0D137F8];
  if (((*(uint64_t (**)(_QWORD, _QWORD))(*MEMORY[0x1E0D137F8] + 16))(*MEMORY[0x1E0D137F8], *(_QWORD *)(a1 + 48)) & 1) == 0)
  {
    v15 = *(void **)(a1 + 32);
    CNContactsUIBundle();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("DROP_FAILURE_MANAGED_ACCOUNT"), &stru_1E20507A8, CFSTR("Localized"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "presentErrorAlertWithMessage:animated:", v17, 1);

  }
  if (((*(uint64_t (**)(uint64_t, _QWORD))(v14 + 16))(v14, *(_QWORD *)(a1 + 72)) & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "authorizedAddContacts:toDestinationItem:", *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80));
  if (((*(uint64_t (**)(uint64_t, _QWORD))(v14 + 16))(v14, *(_QWORD *)(a1 + 64)) & 1) == 0)
  {
    v18 = objc_alloc_init(CNAccountsAndGroupsAuthorizationContext);
    -[CNAccountsAndGroupsAuthorizationContext setType:](v18, "setType:", 0);
    -[CNAccountsAndGroupsAuthorizationContext setItem:](v18, "setItem:", *(_QWORD *)(a1 + 80));
    -[CNAccountsAndGroupsAuthorizationContext setContactsToAddToDropDestination:](v18, "setContactsToAddToDropDestination:", *(_QWORD *)(a1 + 64));
    objc_msgSend(*(id *)(a1 + 32), "showEditAuthorizationPaneWithAuthorizationContext:animated:", v18, 1);

  }
}

void __56__CNAccountsAndGroupsViewController_configureDataSource__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "groupsStyle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "parentCellAccessories");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAccessories:", v9);

  objc_msgSend(*(id *)(a1 + 32), "groupsStyle");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "title");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "parentCellConfigurationUpdateHandlerWithText:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setConfigurationUpdateHandler:", v11);

}

void __56__CNAccountsAndGroupsViewController_configureDataSource__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;

  v11 = a3;
  v5 = a2;
  objc_msgSend(v11, "setItem:", v5);
  objc_msgSend(v11, "setDelegate:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v11, "setIndentationWidth:", 0.0);
  objc_msgSend(*(id *)(a1 + 32), "groupsStyle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cellAccessoriesForItem:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAccessories:", v7);

  objc_msgSend(*(id *)(a1 + 32), "groupsStyle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "cellConfigurationUpdateHandler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setConfigurationUpdateHandler:", v9);

  v10 = objc_msgSend(*(id *)(a1 + 32), "shouldEnableItem:", v5);
  objc_msgSend(v11, "setUserInteractionEnabled:", v10);

}

void __56__CNAccountsAndGroupsViewController_configureDataSource__block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "resignAllFirstRespondersSavingCurrentlyEditing:", 0);
  objc_msgSend(*(id *)(a1 + 32), "removePlaceholderCellsIfNeededInSection:animated:", v4, 0);

}

__CFString *__56__CNAccountsAndGroupsViewController_configureDataSource__block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;
  __CFString *v4;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
    v4 = CFSTR("Header");
  else
    v4 = CFSTR("List");
  return v4;
}

id __43__CNAccountsAndGroupsViewController_layout__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "allowsEditing"))
  {
    objc_opt_class();
    objc_msgSend(*(id *)(a1 + 32), "diffableDataSource");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "itemIdentifierForIndexPath:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
    v7 = v6;

    objc_opt_class();
    objc_msgSend(*(id *)(a1 + 32), "collectionView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "cellForItemAtIndexPath:", v3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = v9;
    else
      v10 = 0;
    v11 = v10;

    v12 = 0;
    if (v7 && v11)
    {
      v13 = (void *)MEMORY[0x1E0DC3D08];
      objc_msgSend(*(id *)(a1 + 32), "actionsProvider");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "leadingActionsForItem:cell:", v7, v11);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "configurationWithActions:", v15);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "setPerformsFirstActionWithFullSwipe:", 0);
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

id __43__CNAccountsAndGroupsViewController_layout__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "allowsEditing"))
  {
    objc_opt_class();
    objc_msgSend(*(id *)(a1 + 32), "diffableDataSource");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "itemIdentifierForIndexPath:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
    v7 = v6;

    objc_opt_class();
    objc_msgSend(*(id *)(a1 + 32), "collectionView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "cellForItemAtIndexPath:", v3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = v9;
    else
      v10 = 0;
    v11 = v10;

    v12 = 0;
    if (v7 && v11)
    {
      v13 = (void *)MEMORY[0x1E0DC3D08];
      objc_msgSend(*(id *)(a1 + 32), "actionsProvider");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "collectionView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "trailingActionsForItem:cell:isCollectionViewEditing:", v7, v11, objc_msgSend(v15, "isEditing"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "configurationWithActions:", v16);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "setPerformsFirstActionWithFullSwipe:", 0);
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

id __43__CNAccountsAndGroupsViewController_layout__block_invoke_3(uint64_t a1, unint64_t a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "dataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sections");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9 <= a2)
  {
    v15 = 1;
  }
  else
  {
    v10 = *MEMORY[0x1E0D13848];
    objc_msgSend(*(id *)(a1 + 32), "dataSource");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "sections");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectAtIndexedSubscript:", a2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "title");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (*(unsigned int (**)(uint64_t, void *))(v10 + 16))(v10, v14) ^ 1;

  }
  objc_msgSend(*(id *)(a1 + 32), "groupsStyle");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "sectionConfigurationForLayoutEnvironment:withLeadingActionsProvider:withTrailingActionsProvider:hasHeader:", v6, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

void __59__CNAccountsAndGroupsViewController_contactStoreDidChange___block_invoke(uint64_t a1)
{
  char v2;
  void *v3;
  void *v4;
  int v5;

  v2 = objc_msgSend(*(id *)(a1 + 32), "viewCanReload");
  v3 = *(void **)(a1 + 32);
  if ((v2 & 1) != 0)
  {
    objc_msgSend(v3, "dataSource");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "hasChanges");

    if (v5)
    {
      if ((objc_msgSend(*(id *)(a1 + 32), "isNotificationInternalSave:", *(_QWORD *)(a1 + 40)) & 1) == 0)
        objc_msgSend(*(id *)(a1 + 32), "reloadData");
    }
  }
  else
  {
    objc_msgSend(v3, "setNeedsReload:", 1);
  }
}

uint64_t __66__CNAccountsAndGroupsViewController_isAnyListCellCurrentlyEditing__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "collectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cellForItemAtIndexPath:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  v6 = v5;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  if (v8)
    v9 = objc_msgSend(v8, "isCellEditing");
  else
    v9 = 0;

  return v9;
}

void __60__CNAccountsAndGroupsViewController_setEditingForGroupItem___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "collectionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cellForItemAtIndexPath:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  v7 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v7;
  else
    v4 = 0;
  v5 = v4;

  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "actionsProvider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "authorizedEditGroupNameForCell:", v5);

  }
}

uint64_t __58__CNAccountsAndGroupsViewController_currentlySelectedItem__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;

  v3 = a2;
  objc_opt_class();
  v4 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "dataSource");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isFilterShowingItem:", v6);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

uint64_t __47__CNAccountsAndGroupsViewController_reloadData__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  int v6;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v3);

  return v6 ^ 1u;
}

void __134__CNAccountsAndGroupsViewController_reloadCollectionViewForSectionWithIdentifier_settingFilterForEditingItem_allowsReloadWhenEditing___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
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

  v19[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "dataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reload");

  objc_msgSend(*(id *)(a1 + 32), "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sectionForIdentifier:", *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0DC3390]);
    v6 = *MEMORY[0x1E0D13848];
    objc_msgSend(v4, "title");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v6) = (*(uint64_t (**)(uint64_t, void *))(v6 + 16))(v6, v7);

    if ((_DWORD)v6)
    {
      objc_msgSend(v4, "items");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "appendItems:", v8);
    }
    else
    {
      v19[0] = v4;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "appendItems:", v9);

      objc_msgSend(v4, "items");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "appendItems:intoParent:", v10, v4);

      v18 = v4;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v18, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "expandItems:", v8);
    }

    objc_msgSend(*(id *)(a1 + 32), "sectionController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "applySnapshot:toSection:animatingDifferences:", v5, v4, 0);

    if (*(_BYTE *)(a1 + 48))
    {
      objc_msgSend(*(id *)(a1 + 32), "dataSource");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "currentlyEditingGroupItem");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        objc_msgSend(*(id *)(a1 + 32), "dataSource");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "dataSource");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "currentlyEditingGroupItem");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setFilterForItem:", v16);

        objc_msgSend(*(id *)(a1 + 32), "delegate");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "accountsAndGroupsViewControllerDidUpdateSelection:", *(_QWORD *)(a1 + 32));

      }
    }
    objc_msgSend(*(id *)(a1 + 32), "updateSelectionIfNeeded");
    objc_msgSend(*(id *)(a1 + 32), "restoreCurrentlyEditingGroupIfNeeded");

  }
}

void __103__CNAccountsAndGroupsViewController_reloadCollectionViewAddingPlaceholderItem_inSectionWithIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[5];
  id v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "sectionController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "snapshotForSection:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "items");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_cn_filter:", &__block_literal_global_131);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "deleteItems:", v5);
  v11[0] = *(_QWORD *)(a1 + 48);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendItems:intoParent:", v6, *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 32), "sectionController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __103__CNAccountsAndGroupsViewController_reloadCollectionViewAddingPlaceholderItem_inSectionWithIdentifier___block_invoke_3;
  v9[3] = &unk_1E2050400;
  v8 = *(_QWORD *)(a1 + 40);
  v9[4] = *(_QWORD *)(a1 + 32);
  v10 = *(id *)(a1 + 48);
  objc_msgSend(v7, "applySnapshot:toSection:animatingDifferences:completion:", v3, v8, 1, v9);

}

uint64_t __103__CNAccountsAndGroupsViewController_reloadCollectionViewAddingPlaceholderItem_inSectionWithIdentifier___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setEditingForGroupItem:", *(_QWORD *)(a1 + 40));
}

uint64_t __103__CNAccountsAndGroupsViewController_reloadCollectionViewAddingPlaceholderItem_inSectionWithIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("groupPlaceholderIdentifier"));

  return v3;
}

void __86__CNAccountsAndGroupsViewController_removePlaceholderCellsIfNeededInSection_animated___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "sectionController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "snapshotForSection:", *(_QWORD *)(a1 + 40));
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "items");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_cn_filter:", &__block_literal_global_130);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (((*(uint64_t (**)(void))(*MEMORY[0x1E0D137F8] + 16))() & 1) == 0)
  {
    objc_msgSend(v6, "deleteItems:", v4);
    objc_msgSend(*(id *)(a1 + 32), "sectionController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "applySnapshot:toSection:animatingDifferences:completion:", v6, *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), 0);

  }
}

uint64_t __86__CNAccountsAndGroupsViewController_removePlaceholderCellsIfNeededInSection_animated___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("groupPlaceholderIdentifier"));

  return v3;
}

void __70__CNAccountsAndGroupsViewController_reloadCollectionViewDeletingItem___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "diffableDataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "snapshot");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v6[0] = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deleteItemsWithIdentifiers:", v4);

  objc_msgSend(*(id *)(a1 + 32), "diffableDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "applySnapshot:animatingDifferences:", v3, 1);

  if (*(_BYTE *)(a1 + 48))
    objc_msgSend(*(id *)(a1 + 32), "selectAllContacts");

}

id __54__CNAccountsAndGroupsViewController_menuForContainers__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[5];
  id v10;

  v3 = a2;
  v4 = (void *)MEMORY[0x1E0DC3428];
  objc_msgSend(v3, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __54__CNAccountsAndGroupsViewController_menuForContainers__block_invoke_2;
  v9[3] = &unk_1E20504A8;
  v9[4] = *(_QWORD *)(a1 + 32);
  v10 = v3;
  v6 = v3;
  objc_msgSend(v4, "actionWithTitle:image:identifier:handler:", v5, 0, 0, v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __54__CNAccountsAndGroupsViewController_menuForContainers__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "actionsProvider");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "createGroupActionForContainerItem:isCollectionViewEditing:", v2, objc_msgSend(v3, "isEditing"));

}

void __57__CNAccountsAndGroupsViewController_reloadAddGroupButton__block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "addGroupBarButtonItem");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "addDefaultGroup:", v1);

}

uint64_t __51__CNAccountsAndGroupsViewController_viewDidAppear___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateToolbarVisibility");
}

uint64_t __52__CNAccountsAndGroupsViewController_viewWillAppear___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "clearNavigationButtonsIfNeeded");
}

+ (id)log
{
  if (log_cn_once_token_1_15167 != -1)
    dispatch_once(&log_cn_once_token_1_15167, &__block_literal_global_15168);
  return (id)log_cn_once_object_1_15169;
}

+ (id)allowedDropTypes
{
  return &unk_1E20D3790;
}

void __40__CNAccountsAndGroupsViewController_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contactsui", "CNAccountsAndGroupsViewController");
  v1 = (void *)log_cn_once_object_1_15169;
  log_cn_once_object_1_15169 = (uint64_t)v0;

}

@end
