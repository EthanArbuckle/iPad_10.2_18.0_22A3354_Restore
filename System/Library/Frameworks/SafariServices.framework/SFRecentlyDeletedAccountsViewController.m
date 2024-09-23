@implementation SFRecentlyDeletedAccountsViewController

- (SFRecentlyDeletedAccountsViewController)initWithAutoFillQuirksManager:(id)a3
{
  SFRecentlyDeletedAccountsViewController *v3;
  SFRecentlyDeletedAccountsViewController *v4;
  SFRecentlyDeletedAccountsViewController *v5;

  v3 = -[SFRecentlyDeletedAccountsViewController _initWithAutoFillQuirksManager:](self, "_initWithAutoFillQuirksManager:", a3);
  v4 = v3;
  if (v3)
  {
    v3->_persona = 0;
    v5 = v3;
  }

  return v4;
}

- (SFRecentlyDeletedAccountsViewController)initWithAutoFillQuirksManager:(id)a3 group:(id)a4
{
  id v7;
  SFRecentlyDeletedAccountsViewController *v8;
  SFRecentlyDeletedAccountsViewController *v9;
  SFRecentlyDeletedAccountsViewController *v10;

  v7 = a4;
  v8 = -[SFRecentlyDeletedAccountsViewController _initWithAutoFillQuirksManager:](self, "_initWithAutoFillQuirksManager:", a3);
  v9 = v8;
  if (v8)
  {
    v8->_persona = 1;
    objc_storeStrong((id *)&v8->_group, a4);
    v10 = v9;
  }

  return v9;
}

- (id)_initWithAutoFillQuirksManager:(id)a3
{
  id v5;
  _SFAccountTableConfiguration *v6;
  void *v7;
  SFRecentlyDeletedAccountsViewController *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  SFRecentlyDeletedAccountsViewController *v12;
  objc_super v14;

  v5 = a3;
  v6 = objc_alloc_init(_SFAccountTableConfiguration);
  -[_SFAccountTableConfiguration setShouldShowSearchBar:](v6, "setShouldShowSearchBar:", 1);
  -[_SFAccountTableConfiguration setSupportsDelete:](v6, "setSupportsDelete:", 1);
  -[_SFAccountTableConfiguration setSupportsShare:](v6, "setSupportsShare:", 0);
  objc_msgSend(MEMORY[0x1E0D4EF88], "sharedSiteMetadataManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14.receiver = self;
  v14.super_class = (Class)SFRecentlyDeletedAccountsViewController;
  v8 = -[_SFAccountTableViewController initWithSiteMetadataManager:configuration:](&v14, sel_initWithSiteMetadataManager_configuration_, v7, v6);

  if (v8)
  {
    objc_storeStrong((id *)&v8->_autoFillQuirksManager, a3);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *MEMORY[0x1E0D8B490];
    objc_msgSend(MEMORY[0x1E0D8AC08], "sharedStore");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:selector:name:object:", v8, sel__reloadDiffableDataSource, v10, v11);

    -[SFRecentlyDeletedAccountsViewController _setUpNavigationBarAndToolbarItems](v8, "_setUpNavigationBarAndToolbarItems");
    v12 = v8;
  }

  return v8;
}

- (void)viewDidLoad
{
  id v3;
  void *v4;
  SFTableViewDiffableDataSource *v5;
  SFTableViewDiffableDataSource *diffableDataSource;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id (*v12)(uint64_t, void *, uint64_t, void *);
  void *v13;
  id v14;
  id location;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)SFRecentlyDeletedAccountsViewController;
  -[_SFAccountTableViewController viewDidLoad](&v16, sel_viewDidLoad);
  objc_initWeak(&location, self);
  v3 = objc_alloc(MEMORY[0x1E0D4EE40]);
  -[SFRecentlyDeletedAccountsViewController tableView](self, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __54__SFRecentlyDeletedAccountsViewController_viewDidLoad__block_invoke;
  v13 = &unk_1E4ABFD40;
  objc_copyWeak(&v14, &location);
  v5 = (SFTableViewDiffableDataSource *)objc_msgSend(v3, "initWithTableView:cellProvider:", v4, &v10);
  diffableDataSource = self->_diffableDataSource;
  self->_diffableDataSource = v5;

  -[SFTableViewDiffableDataSource setDelegate:](self->_diffableDataSource, "setDelegate:", self, v10, v11, v12, v13);
  -[SFRecentlyDeletedAccountsViewController tableView](self, "tableView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAllowsMultipleSelectionDuringEditing:", 1);
  objc_msgSend(v7, "setCellLayoutMarginsFollowReadableWidth:", 1);
  _WBSLocalizedString();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFRecentlyDeletedAccountsViewController navigationItem](self, "navigationItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTitle:", v8);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

id __54__SFRecentlyDeletedAccountsViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  id WeakRetained;
  void *v9;
  void *v10;

  v6 = a2;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v9 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_cellForIdentifier:tableView:", v7, v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SFRecentlyDeletedAccountsViewController;
  -[_SFAccountTableViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[SFRecentlyDeletedAccountsViewController _updateNavigationBar](self, "_updateNavigationBar");
  -[SFRecentlyDeletedAccountsViewController _updateToolbar](self, "_updateToolbar");
  -[SFRecentlyDeletedAccountsViewController _reloadDiffableDataSource](self, "_reloadDiffableDataSource");
}

- (void)_setUpNavigationBarAndToolbarItems
{
  id v3;
  void *v4;
  UIBarButtonItem *v5;
  UIBarButtonItem *selectBarButtonItem;
  UIBarButtonItem *v7;
  UIBarButtonItem *cancelBarButtonItem;
  id v9;
  void *v10;
  UIBarButtonItem *v11;
  UIBarButtonItem *deleteToolbarItem;
  UIBarButtonItem *v13;
  UIBarButtonItem *toolbarSpacerItem;
  id v15;
  void *v16;
  UIBarButtonItem *v17;
  UIBarButtonItem *recoverToolbarItem;
  id v19;
  void *v20;
  void *v21;
  UIBarButtonItem *v22;
  UIBarButtonItem *recoverMenuToolbarItem;
  UIBarButtonItem *v24;
  void *v25;
  _QWORD v26[4];

  v26[3] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0DC34F0]);
  _WBSLocalizedString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (UIBarButtonItem *)objc_msgSend(v3, "initWithTitle:style:target:action:", v4, 0, self, sel__selectBarButtonItemTapped_);
  selectBarButtonItem = self->_selectBarButtonItem;
  self->_selectBarButtonItem = v5;

  v7 = (UIBarButtonItem *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 1, self, sel__cancelBarButtonItemTapped_);
  cancelBarButtonItem = self->_cancelBarButtonItem;
  self->_cancelBarButtonItem = v7;

  v9 = objc_alloc(MEMORY[0x1E0DC34F0]);
  _WBSLocalizedString();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (UIBarButtonItem *)objc_msgSend(v9, "initWithTitle:style:target:action:", v10, 0, self, sel__deleteButtonTapped_);
  deleteToolbarItem = self->_deleteToolbarItem;
  self->_deleteToolbarItem = v11;

  v13 = (UIBarButtonItem *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 5, 0, 0);
  toolbarSpacerItem = self->_toolbarSpacerItem;
  self->_toolbarSpacerItem = v13;

  v15 = objc_alloc(MEMORY[0x1E0DC34F0]);
  _WBSLocalizedString();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (UIBarButtonItem *)objc_msgSend(v15, "initWithTitle:style:target:action:", v16, 0, self, sel__recoverButtonTapped_);
  recoverToolbarItem = self->_recoverToolbarItem;
  self->_recoverToolbarItem = v17;

  v19 = objc_alloc(MEMORY[0x1E0DC34F0]);
  _WBSLocalizedString();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFRecentlyDeletedAccountsViewController _recoverSelectedSharedAccountsMenu](self, "_recoverSelectedSharedAccountsMenu");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (UIBarButtonItem *)objc_msgSend(v19, "initWithTitle:menu:", v20, v21);
  recoverMenuToolbarItem = self->_recoverMenuToolbarItem;
  self->_recoverMenuToolbarItem = v22;

  v24 = self->_toolbarSpacerItem;
  v26[0] = self->_recoverToolbarItem;
  v26[1] = v24;
  v26[2] = self->_deleteToolbarItem;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 3);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFRecentlyDeletedAccountsViewController setToolbarItems:animated:](self, "setToolbarItems:animated:", v25, 1);

}

- (id)_recoverSelectedSharedAccountsMenu
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
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("arrow.up.bin"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __77__SFRecentlyDeletedAccountsViewController__recoverSelectedSharedAccountsMenu__block_invoke;
  v17[3] = &unk_1E4ABFFC0;
  objc_copyWeak(&v18, &location);
  objc_msgSend(v4, "actionWithTitle:image:identifier:handler:", v5, v6, 0, v17);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v8);

  v9 = (void *)MEMORY[0x1E0DC3428];
  _WBSLocalizedString();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("arrow.up.bin"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v7;
  v15[1] = 3221225472;
  v15[2] = __77__SFRecentlyDeletedAccountsViewController__recoverSelectedSharedAccountsMenu__block_invoke_2;
  v15[3] = &unk_1E4ABFFC0;
  objc_copyWeak(&v16, &location);
  objc_msgSend(v9, "actionWithTitle:image:identifier:handler:", v10, v11, 0, v15);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v12);

  objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithTitle:image:identifier:options:children:", &stru_1E4AC8470, 0, 0, 1, v3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v16);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

  return v13;
}

void __77__SFRecentlyDeletedAccountsViewController__recoverSelectedSharedAccountsMenu__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_recoverSelectedSavedAccountsToMyPasswords");

}

void __77__SFRecentlyDeletedAccountsViewController__recoverSelectedSharedAccountsMenu__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_recoverSelectedSavedAccounts");

}

- (void)_updateNavigationBar
{
  int v3;
  int *v4;
  uint64_t v5;
  id v6;

  v3 = -[SFRecentlyDeletedAccountsViewController isEditing](self, "isEditing");
  v4 = &OBJC_IVAR___SFRecentlyDeletedAccountsViewController__selectBarButtonItem;
  if (v3)
    v4 = &OBJC_IVAR___SFRecentlyDeletedAccountsViewController__cancelBarButtonItem;
  v5 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa + *v4);
  -[SFRecentlyDeletedAccountsViewController navigationItem](self, "navigationItem");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setRightBarButtonItem:", v5);

}

- (void)_updateToolbar
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  UIBarButtonItem *toolbarSpacerItem;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  int v11;
  id v12[4];

  v12[3] = *(id *)MEMORY[0x1E0C80C00];
  -[SFRecentlyDeletedAccountsViewController _selectedSavedAccounts](self, "_selectedSavedAccounts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
    v4 = objc_msgSend(v3, "safari_allObjectsPassTest:", &__block_literal_global_72);
  else
    v4 = 0;
  -[UIBarButtonItem setEnabled:](self->_deleteToolbarItem, "setEnabled:", v4);
  -[UIBarButtonItem setEnabled:](self->_recoverToolbarItem, "setEnabled:", objc_msgSend(v3, "count") != 0);
  -[UIBarButtonItem setEnabled:](self->_recoverMenuToolbarItem, "setEnabled:", objc_msgSend(v3, "count") != 0);
  if ((v4 & objc_msgSend(v3, "safari_containsObjectPassingTest:", &__block_literal_global_64)) != 0)v5 = 1128;
  else
    v5 = 1120;
  toolbarSpacerItem = self->_toolbarSpacerItem;
  v12[0] = *(id *)((char *)&self->super.super.super.super.super.isa + v5);
  v12[1] = toolbarSpacerItem;
  v12[2] = self->_deleteToolbarItem;
  v7 = (void *)MEMORY[0x1E0C99D20];
  v8 = v12[0];
  objc_msgSend(v7, "arrayWithObjects:count:", v12, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFRecentlyDeletedAccountsViewController setToolbarItems:animated:](self, "setToolbarItems:animated:", v9, 1);

  -[SFRecentlyDeletedAccountsViewController navigationController](self, "navigationController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[SFRecentlyDeletedAccountsViewController isEditing](self, "isEditing");

  objc_msgSend(v10, "setToolbarHidden:", v11 ^ 1u);
}

uint64_t __57__SFRecentlyDeletedAccountsViewController__updateToolbar__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isCurrentUserOriginalContributor");
}

uint64_t __57__SFRecentlyDeletedAccountsViewController__updateToolbar__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isSavedInSharedGroup");
}

- (void)_reloadDiffableDataSource
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  unint64_t persona;
  uint64_t v9;
  KCSharingGroup *group;
  void *v11;
  void *v12;
  id v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t j;
  void *v39;
  void *v40;
  SFRecentlyDeletedAccountsViewController *v41;
  void *v42;
  void *v43;
  void *v44;
  SFRecentlyDeletedAccountsViewController *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _QWORD v59[5];
  id v60;
  _BYTE v61[128];
  KCSharingGroup *v62;
  void *v63;
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0DC3398]);
  -[_SFAccountTableViewController searchPattern](self, "searchPattern");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  if (!v5)
    objc_msgSend(v3, "appendSectionsWithIdentifiers:", &unk_1E4B273A0);
  objc_msgSend(MEMORY[0x1E0D8AC08], "sharedStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  persona = self->_persona;
  if (persona == 1)
  {
    group = self->_group;
    if (group)
    {
      -[KCSharingGroup groupID](group, "groupID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "recentlyDeletedSavedAccountsForGroupWithID:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_11;
    }
    objc_msgSend(v7, "recentlyDeletedSavedAccountsInPersonalKeychain");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (persona)
    {
      v12 = 0;
      goto LABEL_11;
    }
    objc_msgSend(v6, "allRecentlyDeletedSavedAccounts");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v12 = (void *)v9;
LABEL_11:
  if (objc_msgSend(v12, "count"))
  {
    v59[0] = MEMORY[0x1E0C809B0];
    v59[1] = 3221225472;
    v59[2] = __68__SFRecentlyDeletedAccountsViewController__reloadDiffableDataSource__block_invoke;
    v59[3] = &unk_1E4ABFD68;
    v59[4] = self;
    v13 = v7;
    v60 = v13;
    v50 = (void *)MEMORY[0x1A8598C40](v59);
    v14 = self->_persona;
    if (v14 == 1)
    {
      objc_msgSend(v12, "safari_mapObjectsUsingBlock:", v50);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v28, "count"))
      {
        if (self->_group)
        {
          v62 = self->_group;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v62, 1);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "appendSectionsWithIdentifiers:", v31);

        }
        else
        {
          objc_msgSend(v3, "appendSectionsWithIdentifiers:", &unk_1E4B273D0);
        }
        objc_msgSend(v3, "appendItemsWithIdentifiers:", v28);
      }
    }
    else
    {
      if (v14)
        goto LABEL_33;
      v45 = self;
      v46 = v12;
      v48 = v7;
      objc_msgSend(v13, "recentlyDeletedSavedAccountsInPersonalKeychain");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "safari_mapObjectsUsingBlock:", v50);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v16, "count"))
      {
        objc_msgSend(v3, "appendSectionsWithIdentifiers:", &unk_1E4B273B8);
        objc_msgSend(v3, "appendItemsWithIdentifiers:", v16);
      }
      v43 = v16;
      v17 = v3;
      v57 = 0u;
      v58 = 0u;
      v55 = 0u;
      v56 = 0u;
      objc_msgSend(v13, "sharingGroupsWithRecentlyDeletedSavedAccounts");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v55, v64, 16);
      if (v19)
      {
        v20 = v19;
        v21 = *(_QWORD *)v56;
        do
        {
          for (i = 0; i != v20; ++i)
          {
            if (*(_QWORD *)v56 != v21)
              objc_enumerationMutation(v18);
            v23 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * i);
            objc_msgSend(v23, "groupID");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "recentlyDeletedSavedAccountsForGroupWithID:", v24);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "safari_mapObjectsUsingBlock:", v50);
            v26 = (void *)objc_claimAutoreleasedReturnValue();

            if (objc_msgSend(v26, "count"))
            {
              v63 = v23;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v63, 1);
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "appendSectionsWithIdentifiers:", v27);

              objc_msgSend(v17, "appendItemsWithIdentifiers:", v26);
            }

          }
          v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v55, v64, 16);
        }
        while (v20);
      }

      v3 = v17;
      v12 = v46;
      v7 = v48;
      v28 = v43;
      self = v45;
    }

LABEL_33:
    -[SFRecentlyDeletedAccountsViewController _selectedSavedAccounts](self, "_selectedSavedAccounts");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFTableViewDiffableDataSource applySnapshot:animatingDifferences:](self->_diffableDataSource, "applySnapshot:animatingDifferences:", v3, 0);
    -[SFRecentlyDeletedAccountsViewController tableView](self, "tableView");
    v33 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v33, "isEditing"))
    {
      v34 = objc_msgSend(v32, "count");

      if (!v34)
      {
LABEL_44:

        goto LABEL_45;
      }
      v53 = 0u;
      v54 = 0u;
      v51 = 0u;
      v52 = 0u;
      v33 = v32;
      v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v51, v61, 16);
      if (v35)
      {
        v36 = v35;
        v44 = v32;
        v47 = v12;
        v49 = v7;
        v37 = *(_QWORD *)v52;
        do
        {
          for (j = 0; j != v36; ++j)
          {
            if (*(_QWORD *)v52 != v37)
              objc_enumerationMutation(v33);
            +[SFAccountCellData accountCellDataWithSavedAccount:warning:searchPattern:savedAccountIsOnlySavedAccountForHighLevelDomain:](SFAccountCellData, "accountCellDataWithSavedAccount:warning:searchPattern:savedAccountIsOnlySavedAccountForHighLevelDomain:", *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * j), 0, 0, 0);
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            -[SFRecentlyDeletedAccountsViewController tableView](self, "tableView");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            -[SFTableViewDiffableDataSource indexPathForItemIdentifier:](self->_diffableDataSource, "indexPathForItemIdentifier:", v39);
            v41 = self;
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "selectRowAtIndexPath:animated:scrollPosition:", v42, 0, 0);

            self = v41;
          }
          v36 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v51, v61, 16);
        }
        while (v36);
        v12 = v47;
        v7 = v49;
        v32 = v44;
      }
    }

    goto LABEL_44;
  }
  -[SFTableViewDiffableDataSource applySnapshot:animatingDifferences:](self->_diffableDataSource, "applySnapshot:animatingDifferences:", v3, 0);
  -[SFRecentlyDeletedAccountsViewController navigationController](self, "navigationController");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (id)objc_msgSend(v29, "popViewControllerAnimated:", 1);

LABEL_45:
}

id __68__SFRecentlyDeletedAccountsViewController__reloadDiffableDataSource__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _BOOL8 v12;
  void *v13;
  void *v14;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "searchPattern");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  if (!v5)
    goto LABEL_3;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1072), "associatedDomainsManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "highLevelDomain");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "domainsWithAssociatedCredentialsForDomain:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "searchPattern");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = objc_msgSend(v3, "matchesUserTypedSearchPattern:associatedDomains:", v9, v8);

  if (!(_DWORD)v7)
  {
    v14 = 0;
  }
  else
  {
LABEL_3:
    v10 = *(void **)(a1 + 40);
    objc_msgSend(v3, "highLevelDomain");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "numberOfSavedAccountsInPersonalKeychainForHighLevelDomain:", v11) == 1;

    objc_msgSend(*(id *)(a1 + 32), "searchPattern");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[SFAccountCellData accountCellDataWithSavedAccount:warning:searchPattern:savedAccountIsOnlySavedAccountForHighLevelDomain:](SFAccountCellData, "accountCellDataWithSavedAccount:warning:searchPattern:savedAccountIsOnlySavedAccountForHighLevelDomain:", v3, 0, v13, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v14;
}

- (id)_cellForIdentifier:(id)a3 tableView:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  SFAccountTableViewCell *v9;
  SFAccountTableViewCell *v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;

  v5 = a3;
  -[SFRecentlyDeletedAccountsViewController tableView](self, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", CFSTR("recentlyDeletedAccountCell"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
    v9 = v7;
  else
    v9 = -[SFAccountTableViewCell initWithStyle:reuseIdentifier:]([SFAccountTableViewCell alloc], "initWithStyle:reuseIdentifier:", 3, CFSTR("recentlyDeletedAccountCell"));
  v10 = v9;

  v11 = v5;
  -[SFAccountTableViewCell setDelegate:](v10, "setDelegate:", self);
  objc_msgSend(v11, "savedAccount");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "searchPattern");
  v13 = objc_claimAutoreleasedReturnValue();
  -[SFAccountTableViewCell setSavedAccount:searchPattern:emphasizeUserName:](v10, "setSavedAccount:searchPattern:emphasizeUserName:", v12, v13, 0);

  -[SFAccountTableViewCell setAccessoryType:](v10, "setAccessoryType:", 1);
  objc_msgSend(v11, "savedAccount");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v13) = objc_msgSend(v14, "canUserEditSavedAccount");

  if ((v13 & 1) != 0)
  {
    -[SFAccountTableViewCell textLabel](v10, "textLabel");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 1;
    objc_msgSend(v15, "setEnabled:", 1);

  }
  else
  {
    v17 = -[SFRecentlyDeletedAccountsViewController isEditing](self, "isEditing") ^ 1;
    -[SFAccountTableViewCell textLabel](v10, "textLabel");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setEnabled:", v17);

    v16 = -[SFRecentlyDeletedAccountsViewController isEditing](self, "isEditing") ^ 1;
  }
  -[SFAccountTableViewCell detailTextLabel](v10, "detailTextLabel");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setEnabled:", v16);

  return v10;
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
  v33[2] = __112__SFRecentlyDeletedAccountsViewController__presentAlertToConfirmDeletingAccountsAtIndexPaths_completionHandler___block_invoke;
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
  v30[2] = __112__SFRecentlyDeletedAccountsViewController__presentAlertToConfirmDeletingAccountsAtIndexPaths_completionHandler___block_invoke_2;
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
  v27 = __112__SFRecentlyDeletedAccountsViewController__presentAlertToConfirmDeletingAccountsAtIndexPaths_completionHandler___block_invoke_3;
  v28 = &unk_1E4AC01E0;
  v29 = v18;
  v23 = v18;
  objc_msgSend(v21, "actionWithTitle:style:handler:", v22, 1, &v25);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addAction:", v24, v25, v26, v27, v28);

  -[SFRecentlyDeletedAccountsViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v14, 1, 0);
}

id __112__SFRecentlyDeletedAccountsViewController__presentAlertToConfirmDeletingAccountsAtIndexPaths_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1064), "itemIdentifierForIndexPath:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "savedAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __112__SFRecentlyDeletedAccountsViewController__presentAlertToConfirmDeletingAccountsAtIndexPaths_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_deleteAccountsAtIndexPaths:", *(_QWORD *)(a1 + 40));
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  return result;
}

uint64_t __112__SFRecentlyDeletedAccountsViewController__presentAlertToConfirmDeletingAccountsAtIndexPaths_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
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
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _QWORD v19[5];
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = WBS_LOG_CHANNEL_PREFIXPasswords();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[SFRecentlyDeletedAccountsViewController _deleteAccountsAtIndexPaths:].cold.1((uint64_t)v4, v5);
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __71__SFRecentlyDeletedAccountsViewController__deleteAccountsAtIndexPaths___block_invoke;
  v19[3] = &unk_1E4AC0350;
  v19[4] = self;
  objc_msgSend(v4, "safari_mapAndFilterObjectsUsingBlock:", v19);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v10);
        objc_msgSend(MEMORY[0x1E0D8AC08], "sharedStore");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "savedAccount");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "removeCredentialTypes:forSavedAccount:", 3, v13);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
    }
    while (v8);
  }
  -[SFTableViewDiffableDataSource snapshot](self->_diffableDataSource, "snapshot");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "deleteItemsWithIdentifiers:", v6);
  -[SFTableViewDiffableDataSource applySnapshot:animatingDifferences:](self->_diffableDataSource, "applySnapshot:animatingDifferences:", v14, 1);
  -[SFRecentlyDeletedAccountsViewController _setEditing:](self, "_setEditing:", 0);

}

id __71__SFRecentlyDeletedAccountsViewController__deleteAccountsAtIndexPaths___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  char v4;
  id v5;
  NSObject *v6;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1064), "itemIdentifierForIndexPath:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_6:
    v5 = 0;
    goto LABEL_7;
  }
  objc_msgSend(v2, "savedAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isCurrentUserOriginalContributor");

  if ((v4 & 1) == 0)
  {
    v6 = WBS_LOG_CHANNEL_PREFIXPasswords();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __71__SFRecentlyDeletedAccountsViewController__deleteAccountsAtIndexPaths___block_invoke_cold_1();
    goto LABEL_6;
  }
  v5 = v2;
LABEL_7:

  return v5;
}

- (void)_selectBarButtonItemTapped:(id)a3
{
  if (self->_userIsEditingCellInTableView)
    -[SFRecentlyDeletedAccountsViewController _cancelBarButtonItemTapped:](self, "_cancelBarButtonItemTapped:", a3);
  -[SFRecentlyDeletedAccountsViewController _setEditing:](self, "_setEditing:", 1);
}

- (void)_cancelBarButtonItemTapped:(id)a3
{
  -[SFRecentlyDeletedAccountsViewController _setEditing:](self, "_setEditing:", 0);
}

- (void)_deleteButtonTapped:(id)a3
{
  void *v4;
  id v5;

  -[SFRecentlyDeletedAccountsViewController tableView](self, "tableView", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "indexPathsForSelectedRows");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFRecentlyDeletedAccountsViewController _presentAlertToConfirmDeletingAccountsAtIndexPaths:completionHandler:](self, "_presentAlertToConfirmDeletingAccountsAtIndexPaths:completionHandler:", v4, 0);

}

- (void)_setEditing:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BOOL8 v10;
  uint64_t v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  objc_super v21;
  _BYTE v22[128];
  uint64_t v23;

  v3 = a3;
  v23 = *MEMORY[0x1E0C80C00];
  v21.receiver = self;
  v21.super_class = (Class)SFRecentlyDeletedAccountsViewController;
  -[_SFAccountTableViewController setEditing:animated:](&v21, sel_setEditing_animated_, a3, 1);
  -[SFRecentlyDeletedAccountsViewController _updateNavigationBar](self, "_updateNavigationBar");
  -[SFRecentlyDeletedAccountsViewController _updateToolbar](self, "_updateToolbar");
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[SFRecentlyDeletedAccountsViewController tableView](self, "tableView", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "visibleCells");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    v10 = !v3;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v11);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v12, "savedAccount");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "canUserEditSavedAccount");

          if ((v14 & 1) == 0)
          {
            objc_msgSend(v12, "textLabel");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "setEnabled:", v10);

            objc_msgSend(v12, "detailTextLabel");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "setEnabled:", v10);

          }
        }
        ++v11;
      }
      while (v8 != v11);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    }
    while (v8);
  }

}

- (void)_recoverSelectedSavedAccountsToMyPasswords
{
  id v3;

  -[SFRecentlyDeletedAccountsViewController _selectedSavedAccounts](self, "_selectedSavedAccounts");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[SFRecentlyDeletedAccountsViewController _recoverSavedAccountsToMyPasswords:](self, "_recoverSavedAccountsToMyPasswords:", v3);

}

- (void)_recoverSavedAccountsToMyPasswords:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t);
  void *v20;
  SFRecentlyDeletedAccountsViewController *v21;
  id v22;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D6C078], "alertTitleAndMessageForRecoveringSavedAccountsToMyPasswords:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0DC3450];
  objc_msgSend(v5, "first");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "second");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "alertControllerWithTitle:message:preferredStyle:", v7, v8, _SFDeviceAlertStyle());
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0DC3448];
  _WBSLocalizedString();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = MEMORY[0x1E0C809B0];
  v18 = 3221225472;
  v19 = __78__SFRecentlyDeletedAccountsViewController__recoverSavedAccountsToMyPasswords___block_invoke;
  v20 = &unk_1E4AC0128;
  v21 = self;
  v22 = v4;
  v12 = v4;
  objc_msgSend(v10, "actionWithTitle:style:handler:", v11, 0, &v17);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addAction:", v13, v17, v18, v19, v20, v21);

  v14 = (void *)MEMORY[0x1E0DC3448];
  _WBSLocalizedString();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "actionWithTitle:style:handler:", v15, 1, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addAction:", v16);

  -[SFRecentlyDeletedAccountsViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v9, 1, 0);
}

uint64_t __78__SFRecentlyDeletedAccountsViewController__recoverSavedAccountsToMyPasswords___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_recoverSavedAccounts:shouldRecoverToMyPasswords:", *(_QWORD *)(a1 + 40), 1);
}

- (void)_recoverSelectedSavedAccounts
{
  id v3;

  -[SFRecentlyDeletedAccountsViewController _selectedSavedAccounts](self, "_selectedSavedAccounts");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[SFRecentlyDeletedAccountsViewController _recoverSavedAccounts:shouldRecoverToMyPasswords:](self, "_recoverSavedAccounts:shouldRecoverToMyPasswords:", v3, 0);

}

- (void)_recoverSavedAccounts:(id)a3 shouldRecoverToMyPasswords:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  SFRecentlyDeletedAccountsViewController *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v4 = a4;
  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  v10 = self;
  if (v9)
  {
    v11 = v9;
    v12 = *(_QWORD *)v23;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v23 != v12)
          objc_enumerationMutation(v8);
        v14 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v13);
        if (!v4)
        {
          objc_msgSend(MEMORY[0x1E0D8AC08], "sharedStore", (_QWORD)v22);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "_recoverRecentlyDeletedSavedAccount:", v14);

          self = v10;
          if ((v16 & 1) != 0)
            goto LABEL_11;
LABEL_10:
          objc_msgSend(v7, "addObject:", v14, (_QWORD)v22);
          goto LABEL_11;
        }
        if (!-[SFRecentlyDeletedAccountsViewController _recoverSavedAccountToMyPasswords:](self, "_recoverSavedAccountToMyPasswords:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v13)))goto LABEL_10;
LABEL_11:
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v11);
  }

  if (objc_msgSend(v7, "count"))
  {
    objc_msgSend(MEMORY[0x1E0D8ABA0], "alertTitleForFailingToRecoverAccounts:", v7);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v17, 0, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)MEMORY[0x1E0DC3448];
    _WBSLocalizedString();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "actionWithTitle:style:handler:", v20, 0, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addAction:", v21);

    self = v10;
    -[SFRecentlyDeletedAccountsViewController presentViewController:animated:completion:](v10, "presentViewController:animated:completion:", v18, 1, 0);

  }
  -[SFRecentlyDeletedAccountsViewController _setEditing:](self, "_setEditing:", 0, (_QWORD)v22);

}

- (BOOL)_recoverSavedAccountToMyPasswords:(id)a3
{
  id v3;
  void *v4;
  char v5;
  void *v6;
  char v7;
  BOOL v8;
  NSObject *v9;
  NSObject *v10;

  v3 = a3;
  if ((objc_msgSend(v3, "isSavedInPersonalKeychain") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0D8AC08], "sharedStore");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "_moveSavedAccount:toGroupWithID:", v3, 0);

    if ((v5 & 1) == 0)
    {
      v10 = WBS_LOG_CHANNEL_PREFIXPasswords();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[SFRecentlyDeletedAccountsViewController _recoverSavedAccountToMyPasswords:].cold.2();
      goto LABEL_9;
    }
  }
  objc_msgSend(MEMORY[0x1E0D8AC08], "sharedStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "_recoverRecentlyDeletedSavedAccount:", v3);

  if ((v7 & 1) == 0)
  {
    v9 = WBS_LOG_CHANNEL_PREFIXPasswords();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[SFRecentlyDeletedAccountsViewController _recoverSavedAccountToMyPasswords:].cold.1();
LABEL_9:
    v8 = 0;
    goto LABEL_10;
  }
  v8 = 1;
LABEL_10:

  return v8;
}

- (BOOL)_shouldShowToolbarWhenSearching
{
  return 0;
}

- (id)_selectedSavedAccounts
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[5];

  -[SFRecentlyDeletedAccountsViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "indexPathsForSelectedRows");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __65__SFRecentlyDeletedAccountsViewController__selectedSavedAccounts__block_invoke;
  v7[3] = &unk_1E4AC0190;
  v7[4] = self;
  objc_msgSend(v4, "safari_mapObjectsUsingBlock:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __65__SFRecentlyDeletedAccountsViewController__selectedSavedAccounts__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  NSObject *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1064), "itemIdentifierForIndexPath:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v2, "savedAccount");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = WBS_LOG_CHANNEL_PREFIXPasswords();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __65__SFRecentlyDeletedAccountsViewController__selectedSavedAccounts__block_invoke_cold_1();
    v3 = 0;
  }

  return v3;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  SFAccountDetailViewController *v8;
  void *v9;
  SFAccountDetailViewController *v10;
  void *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  if (objc_msgSend(v12, "isEditing"))
  {
    -[SFRecentlyDeletedAccountsViewController _updateToolbar](self, "_updateToolbar");
  }
  else
  {
    -[SFTableViewDiffableDataSource itemIdentifierForIndexPath:](self->_diffableDataSource, "itemIdentifierForIndexPath:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = [SFAccountDetailViewController alloc];
    objc_msgSend(v7, "savedAccount");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[SFAccountDetailViewController initWithSavedAccount:passwordWarning:options:](v8, "initWithSavedAccount:passwordWarning:options:", v9, 0, 0);

    -[SFAccountDetailViewController setDelegate:](v10, "setDelegate:", self);
    objc_msgSend(v12, "deselectRowAtIndexPath:animated:", v6, 0);
    -[SFRecentlyDeletedAccountsViewController navigationController](self, "navigationController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "pushViewController:animated:", v10, 1);

  }
}

- (void)tableView:(id)a3 didDeselectRowAtIndexPath:(id)a4
{
  if (objc_msgSend(a3, "isEditing"))
    -[SFRecentlyDeletedAccountsViewController _updateToolbar](self, "_updateToolbar");
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;

  -[SFTableViewDiffableDataSource snapshot](self->_diffableDataSource, "snapshot", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sectionIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndexedSubscript:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v8, "isEqual:", &unk_1E4B26080))
  {
    if (!self->_persona)
    {
      if (objc_msgSend(v8, "isEqual:", &unk_1E4B26098))
      {
        -[SFRecentlyDeletedAccountsViewController _headerForMyPasswordsSection](self, "_headerForMyPasswordsSection");
        v9 = objc_claimAutoreleasedReturnValue();
        goto LABEL_3;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[SFRecentlyDeletedAccountsViewController _headerForSharingGroupSection:](self, "_headerForSharingGroupSection:", v8);
        v9 = objc_claimAutoreleasedReturnValue();
        goto LABEL_3;
      }
    }
    v10 = 0;
    goto LABEL_6;
  }
  -[SFRecentlyDeletedAccountsViewController _headerForHeaderSection](self, "_headerForHeaderSection");
  v9 = objc_claimAutoreleasedReturnValue();
LABEL_3:
  v10 = (void *)v9;
LABEL_6:

  return v10;
}

- (BOOL)tableView:(id)a3 shouldBeginMultipleSelectionInteractionAtIndexPath:(id)a4
{
  return 1;
}

- (void)tableView:(id)a3 didBeginMultipleSelectionInteractionAtIndexPath:(id)a4
{
  -[SFRecentlyDeletedAccountsViewController _setEditing:](self, "_setEditing:", 1, a4);
}

- (id)_headerForHeaderSection
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  unint64_t persona;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  -[SFRecentlyDeletedAccountsViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dequeueReusableHeaderFooterViewWithIdentifier:", CFSTR("informationalHeaderView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    v6 = v4;
  else
    v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D78]), "initWithReuseIdentifier:", CFSTR("informationalHeaderView"));
  v7 = v6;

  objc_msgSend(MEMORY[0x1E0DC39A8], "groupedFooterConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  persona = self->_persona;
  if (persona == 1)
  {
    if (self->_group)
    {
      v10 = (void *)MEMORY[0x1E0CB3940];
      _WBSLocalizedString();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[KCSharingGroup displayName](self->_group, "displayName");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "localizedStringWithFormat:", v11, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setText:", v13);

LABEL_10:
      goto LABEL_11;
    }
LABEL_9:
    _WBSLocalizedString();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setText:", v11);
    goto LABEL_10;
  }
  if (!persona)
    goto LABEL_9;
LABEL_11:
  objc_msgSend(v7, "setContentConfiguration:", v8);

  return v7;
}

- (BOOL)_shouldShowMyPasswordsSectionHeader
{
  BOOL v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  if (self->_persona == 1)
    return 0;
  objc_msgSend(MEMORY[0x1E0D8AC08], "sharedStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "recentlyDeletedSavedAccountsInPersonalKeychain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(MEMORY[0x1E0D8AA48], "sharedProvider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "cachedGroups");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = objc_msgSend(v6, "count") != 0;

  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (id)_headerForMyPasswordsSection
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  if (-[SFRecentlyDeletedAccountsViewController _shouldShowMyPasswordsSectionHeader](self, "_shouldShowMyPasswordsSectionHeader"))
  {
    -[SFRecentlyDeletedAccountsViewController tableView](self, "tableView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "dequeueReusableHeaderFooterViewWithIdentifier:", CFSTR("recentlyDeletedAccountSectionHeaderViewReuseIdentifier"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
      v6 = v4;
    else
      v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D78]), "initWithReuseIdentifier:", CFSTR("recentlyDeletedAccountSectionHeaderViewReuseIdentifier"));
    v7 = v6;

    objc_msgSend(MEMORY[0x1E0DC39A8], "groupedHeaderConfiguration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    _WBSLocalizedString();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setText:", v9);

    objc_msgSend(v7, "setContentConfiguration:", v8);
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)_headerForSharingGroupSection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  -[SFRecentlyDeletedAccountsViewController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dequeueReusableHeaderFooterViewWithIdentifier:", CFSTR("recentlyDeletedAccountSectionHeaderViewReuseIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
    v8 = v6;
  else
    v8 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D78]), "initWithReuseIdentifier:", CFSTR("recentlyDeletedAccountSectionHeaderViewReuseIdentifier"));
  v9 = v8;

  objc_msgSend(MEMORY[0x1E0DC39A8], "groupedHeaderConfiguration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setText:", v11);
  objc_msgSend(v9, "setContentConfiguration:", v10);

  return v9;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[SFTableViewDiffableDataSource snapshot](self->_diffableDataSource, "snapshot", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sectionIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndexedSubscript:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "isEqual:", &unk_1E4B26080))
    v8 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
  else
    v8 = 0;

  return v8;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  void *v5;
  void *v6;
  void *v7;
  double v8;

  -[SFTableViewDiffableDataSource snapshot](self->_diffableDataSource, "snapshot", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sectionIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndexedSubscript:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "isEqual:", &unk_1E4B26080))
    v8 = 0.0;
  else
    v8 = *MEMORY[0x1E0DC53D8];

  return v8;
}

- (void)tableView:(id)a3 willBeginEditingRowAtIndexPath:(id)a4
{
  id v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SFRecentlyDeletedAccountsViewController;
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
  v7.super_class = (Class)SFRecentlyDeletedAccountsViewController;
  v6 = a3;
  -[_SFAccountTableViewController tableView:didEndEditingRowAtIndexPath:](&v7, sel_tableView_didEndEditingRowAtIndexPath_, v6, a4);
  objc_msgSend(v6, "setAllowsMultipleSelectionDuringEditing:", 1, v7.receiver, v7.super_class);

  self->_userIsEditingCellInTableView = 0;
  -[_SFAccountTableViewController setEditing:animated:](self, "setEditing:animated:", 0, 1);
}

- (id)tableView:(id)a3 trailingSwipeActionsConfigurationForRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, uint64_t, uint64_t, void *);
  void *v24;
  SFRecentlyDeletedAccountsViewController *v25;
  id v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  -[SFTableViewDiffableDataSource snapshot](self->_diffableDataSource, "snapshot");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sectionIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndexedSubscript:", objc_msgSend(v5, "section"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqual:", &unk_1E4B26080);

  if (!v9)
  {
    -[SFTableViewDiffableDataSource itemIdentifierForIndexPath:](self->_diffableDataSource, "itemIdentifierForIndexPath:", v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v11, "savedAccount");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v12, "canUserEditSavedAccount") & 1) != 0)
      {
        objc_msgSend(v11, "savedAccount");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "isCurrentUserOriginalContributor");

        if ((v14 & 1) != 0)
        {
          _WBSLocalizedString();
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = (void *)MEMORY[0x1E0DC36C8];
          v21 = MEMORY[0x1E0C809B0];
          v22 = 3221225472;
          v23 = __104__SFRecentlyDeletedAccountsViewController_tableView_trailingSwipeActionsConfigurationForRowAtIndexPath___block_invoke;
          v24 = &unk_1E4AC0208;
          v25 = self;
          v26 = v5;
          objc_msgSend(v16, "contextualActionWithStyle:title:handler:", 1, v15, &v21);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = (void *)MEMORY[0x1E0DC3D08];
          v27[0] = v17;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 1, v21, v22, v23, v24, v25);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "configurationWithActions:", v19);
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v10, "setPerformsFirstActionWithFullSwipe:", 0);
LABEL_9:

          goto LABEL_10;
        }
      }
      else
      {

      }
    }
    objc_msgSend(MEMORY[0x1E0DC3D08], "configurationWithActions:", MEMORY[0x1E0C9AA60]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0DC3D08], "configurationWithActions:", MEMORY[0x1E0C9AA60]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:

  return v10;
}

void __104__SFRecentlyDeletedAccountsViewController_tableView_trailingSwipeActionsConfigurationForRowAtIndexPath___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = *(void **)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  v5 = (void *)MEMORY[0x1E0C99D20];
  v6 = a4;
  objc_msgSend(v5, "arrayWithObjects:count:", &v8, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_presentAlertToConfirmDeletingAccountsAtIndexPaths:completionHandler:", v7, v6, v8, v9);

}

- (id)tableView:(id)a3 contextMenuConfigurationForRowAtIndexPath:(id)a4 point:(CGPoint)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id location;

  v7 = a3;
  v8 = a4;
  if ((-[SFRecentlyDeletedAccountsViewController isEditing](self, "isEditing") & 1) != 0)
  {
    v9 = 0;
  }
  else
  {
    -[SFTableViewDiffableDataSource itemIdentifierForIndexPath:](self->_diffableDataSource, "itemIdentifierForIndexPath:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v10, "savedAccount");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v11, "canUserEditSavedAccount"))
      {
        objc_initWeak(&location, self);
        v12 = (void *)MEMORY[0x1E0DC36B8];
        v14[0] = MEMORY[0x1E0C809B0];
        v14[1] = 3221225472;
        v14[2] = __101__SFRecentlyDeletedAccountsViewController_tableView_contextMenuConfigurationForRowAtIndexPath_point___block_invoke;
        v14[3] = &unk_1E4AC7A40;
        v15 = v11;
        objc_copyWeak(&v17, &location);
        v16 = v8;
        objc_msgSend(v12, "configurationWithIdentifier:previewProvider:actionProvider:", v16, 0, v14);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        objc_destroyWeak(&v17);
        objc_destroyWeak(&location);
      }
      else
      {
        v9 = 0;
      }

    }
    else
    {
      v9 = 0;
    }

  }
  return v9;
}

id __101__SFRecentlyDeletedAccountsViewController_tableView_contextMenuConfigurationForRowAtIndexPath_point___block_invoke(id *a1, void *a2)
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
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  _QWORD v31[4];
  id v32;
  id v33;
  _QWORD v34[4];
  id v35;
  id v36;
  _QWORD v37[4];
  id v38;
  id v39;
  _QWORD v40[3];

  v40[1] = *MEMORY[0x1E0C80C00];
  v27 = a2;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(a1[4], "isSavedInSharedGroup")
    && objc_msgSend(a1[4], "isCurrentUserOriginalContributor"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)MEMORY[0x1E0DC3428];
    _WBSLocalizedString();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("arrow.up.bin"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __101__SFRecentlyDeletedAccountsViewController_tableView_contextMenuConfigurationForRowAtIndexPath_point___block_invoke_2;
    v37[3] = &unk_1E4ABFAA8;
    objc_copyWeak(&v39, a1 + 6);
    v38 = a1[4];
    objc_msgSend(v5, "actionWithTitle:image:identifier:handler:", v6, v7, 0, v37);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v8);

    v9 = (void *)MEMORY[0x1E0DC3428];
    _WBSLocalizedString();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("arrow.up.bin"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __101__SFRecentlyDeletedAccountsViewController_tableView_contextMenuConfigurationForRowAtIndexPath_point___block_invoke_3;
    v34[3] = &unk_1E4ABFAA8;
    objc_copyWeak(&v36, a1 + 6);
    v35 = a1[4];
    objc_msgSend(v9, "actionWithTitle:image:identifier:handler:", v10, v11, 0, v34);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v12);

    objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithTitle:image:identifier:options:children:", &stru_1E4AC8470, 0, 0, 1, v4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v13);

    objc_destroyWeak(&v36);
    objc_destroyWeak(&v39);

  }
  else
  {
    v14 = (void *)MEMORY[0x1E0DC3428];
    _WBSLocalizedString();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("arrow.up.bin"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __101__SFRecentlyDeletedAccountsViewController_tableView_contextMenuConfigurationForRowAtIndexPath_point___block_invoke_4;
    v31[3] = &unk_1E4ABFAA8;
    objc_copyWeak(&v33, a1 + 6);
    v32 = a1[4];
    objc_msgSend(v14, "actionWithTitle:image:identifier:handler:", v15, v16, 0, v31);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = (void *)MEMORY[0x1E0DC39D0];
    v40[0] = v17;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "menuWithTitle:image:identifier:options:children:", &stru_1E4AC8470, 0, 0, 1, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v20);

    objc_destroyWeak(&v33);
  }
  if (objc_msgSend(a1[4], "isCurrentUserOriginalContributor"))
  {
    v21 = (void *)MEMORY[0x1E0DC3428];
    _WBSLocalizedString();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("trash"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __101__SFRecentlyDeletedAccountsViewController_tableView_contextMenuConfigurationForRowAtIndexPath_point___block_invoke_5;
    v28[3] = &unk_1E4ABFAA8;
    objc_copyWeak(&v30, a1 + 6);
    v29 = a1[5];
    objc_msgSend(v21, "actionWithTitle:image:identifier:handler:", v22, v23, 0, v28);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v24, "setAttributes:", 2);
    objc_msgSend(v3, "addObject:", v24);

    objc_destroyWeak(&v30);
  }
  objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithChildren:", v3);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

void __101__SFRecentlyDeletedAccountsViewController_tableView_contextMenuConfigurationForRowAtIndexPath_point___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4[0] = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_recoverSavedAccountsToMyPasswords:", v3);

}

void __101__SFRecentlyDeletedAccountsViewController_tableView_contextMenuConfigurationForRowAtIndexPath_point___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4[0] = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_recoverSavedAccounts:shouldRecoverToMyPasswords:", v3, 0);

}

void __101__SFRecentlyDeletedAccountsViewController_tableView_contextMenuConfigurationForRowAtIndexPath_point___block_invoke_4(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4[0] = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_recoverSavedAccounts:shouldRecoverToMyPasswords:", v3, 0);

}

void __101__SFRecentlyDeletedAccountsViewController_tableView_contextMenuConfigurationForRowAtIndexPath_point___block_invoke_5(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4[0] = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_presentAlertToConfirmDeletingAccountsAtIndexPaths:completionHandler:", v3, 0);

}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  void *v5;
  void *v6;
  char v7;

  -[SFTableViewDiffableDataSource itemIdentifierForIndexPath:](self->_diffableDataSource, "itemIdentifierForIndexPath:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (-[SFRecentlyDeletedAccountsViewController isEditing](self, "isEditing"))
    {
      objc_msgSend(v5, "savedAccount");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "canUserEditSavedAccount");

    }
    else
    {
      v7 = 1;
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)dataSource:(id)a3 canEditRowAtIndexPath:(id)a4
{
  void *v5;
  void *v6;
  int v7;
  void *v8;
  char v9;
  char v10;

  -[SFTableViewDiffableDataSource itemIdentifierForIndexPath:](self->_diffableDataSource, "itemIdentifierForIndexPath:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (objc_msgSend(v5, "savedAccount"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "canUserEditSavedAccount"),
        v6,
        v7))
  {
    objc_msgSend(v5, "savedAccount");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isCurrentUserOriginalContributor");

    if ((v9 & 1) != 0)
      v10 = 1;
    else
      v10 = -[SFRecentlyDeletedAccountsViewController isEditing](self, "isEditing");
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)canBeShownFromSuspendedState
{
  return 1;
}

- (void)passwordManagerWillLock
{
  void *v2;
  id v3;

  -[SFRecentlyDeletedAccountsViewController tableView](self, "tableView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contextMenuInteraction");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dismissMenu");

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toolbarSpacerItem, 0);
  objc_storeStrong((id *)&self->_recoverMenuToolbarItem, 0);
  objc_storeStrong((id *)&self->_recoverToolbarItem, 0);
  objc_storeStrong((id *)&self->_deleteToolbarItem, 0);
  objc_storeStrong((id *)&self->_cancelBarButtonItem, 0);
  objc_storeStrong((id *)&self->_selectBarButtonItem, 0);
  objc_storeStrong((id *)&self->_group, 0);
  objc_storeStrong((id *)&self->_autoFillQuirksManager, 0);
  objc_storeStrong((id *)&self->_diffableDataSource, 0);
}

- (void)_deleteAccountsAtIndexPaths:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_1A3B2D000, a2, OS_LOG_TYPE_DEBUG, "Deleting passwords at index paths %@", (uint8_t *)&v2, 0xCu);
}

void __71__SFRecentlyDeletedAccountsViewController__deleteAccountsAtIndexPaths___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1A3B2D000, v0, v1, "Tried to delete saved account that the current user is not the original contributor for.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_recoverSavedAccountToMyPasswords:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1A3B2D000, v0, v1, "Failed to recover recently deleted saved account to My Passwords", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_recoverSavedAccountToMyPasswords:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1A3B2D000, v0, v1, "Failed to move saved account to My Passwords as part of recovering Recently Deleted password to My Passwords", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __65__SFRecentlyDeletedAccountsViewController__selectedSavedAccounts__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1A3B2D000, v0, v1, "Received unexpected type in Recently Deleted selected items", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
