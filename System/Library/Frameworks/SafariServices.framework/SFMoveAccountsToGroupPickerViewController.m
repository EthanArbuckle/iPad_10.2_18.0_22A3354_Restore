@implementation SFMoveAccountsToGroupPickerViewController

- (SFMoveAccountsToGroupPickerViewController)initWithGroup:(id)a3 pickerType:(int64_t)a4 autoFillQuirksManager:(id)a5 passwordWarningManager:(id)a6
{
  id v11;
  id v12;
  id v13;
  _SFAccountTableConfiguration *v14;
  void *v15;
  SFMoveAccountsToGroupPickerViewController *v16;
  uint64_t v17;
  NSMutableSet *selectedSavedAccounts;
  SFMoveAccountsToGroupPickerViewController *v19;
  objc_super v21;

  v11 = a3;
  v12 = a5;
  v13 = a6;
  v14 = objc_alloc_init(_SFAccountTableConfiguration);
  -[_SFAccountTableConfiguration setShouldShowSearchBar:](v14, "setShouldShowSearchBar:", 1);
  -[_SFAccountTableConfiguration setSupportsDelete:](v14, "setSupportsDelete:", 0);
  -[_SFAccountTableConfiguration setSupportsShare:](v14, "setSupportsShare:", 0);
  -[_SFAccountTableConfiguration setShouldConfigureMultipleSelectionDuringEditing:](v14, "setShouldConfigureMultipleSelectionDuringEditing:", 1);
  objc_msgSend(MEMORY[0x1E0D4EF88], "sharedSiteMetadataManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v21.receiver = self;
  v21.super_class = (Class)SFMoveAccountsToGroupPickerViewController;
  v16 = -[_SFAccountTableViewController initWithSiteMetadataManager:configuration:](&v21, sel_initWithSiteMetadataManager_configuration_, v15, v14);

  if (v16)
  {
    v16->_pickerType = a4;
    objc_storeStrong((id *)&v16->_autoFillQuirksManager, a5);
    objc_storeStrong((id *)&v16->_passwordWarningManager, a6);
    objc_storeStrong((id *)&v16->_group, a3);
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v17 = objc_claimAutoreleasedReturnValue();
    selectedSavedAccounts = v16->_selectedSavedAccounts;
    v16->_selectedSavedAccounts = (NSMutableSet *)v17;

    -[SFMoveAccountsToGroupPickerViewController _updateNavigationBarItems](v16, "_updateNavigationBarItems");
    v19 = v16;
  }

  return v16;
}

- (void)viewDidLoad
{
  id v3;
  void *v4;
  SFTableViewDiffableDataSource *v5;
  SFTableViewDiffableDataSource *diffableDataSource;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  id (*v19)(uint64_t, void *, uint64_t, void *);
  void *v20;
  id v21;
  id location;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)SFMoveAccountsToGroupPickerViewController;
  -[_SFAccountTableViewController viewDidLoad](&v23, sel_viewDidLoad);
  -[SFMoveAccountsToGroupPickerViewController _loadReusedPasswords](self, "_loadReusedPasswords");
  objc_initWeak(&location, self);
  v3 = objc_alloc(MEMORY[0x1E0D4EE40]);
  -[SFMoveAccountsToGroupPickerViewController tableView](self, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = MEMORY[0x1E0C809B0];
  v18 = 3221225472;
  v19 = __56__SFMoveAccountsToGroupPickerViewController_viewDidLoad__block_invoke;
  v20 = &unk_1E4ABFD40;
  objc_copyWeak(&v21, &location);
  v5 = (SFTableViewDiffableDataSource *)objc_msgSend(v3, "initWithTableView:cellProvider:", v4, &v17);
  diffableDataSource = self->_diffableDataSource;
  self->_diffableDataSource = v5;

  -[SFTableViewDiffableDataSource setDelegate:](self->_diffableDataSource, "setDelegate:", self, v17, v18, v19, v20);
  -[SFMoveAccountsToGroupPickerViewController setEditing:](self, "setEditing:", 1);
  -[SFMoveAccountsToGroupPickerViewController navigationItem](self, "navigationItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc(MEMORY[0x1E0DC34F0]);
  _WBSLocalizedString();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithTitle:style:target:action:", v9, 2, self, sel__addExistingPasswordsBarItemTapped_);

  objc_msgSend(v10, "setEnabled:", 0);
  objc_msgSend(v7, "setRightBarButtonItem:", v10);
  if (self->_pickerType > 1uLL)
  {
    v11 = 0;
  }
  else
  {
    _WBSLocalizedString();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithTitle:style:target:action:", v11, 2, self, sel__cancel);
  -[SFMoveAccountsToGroupPickerViewController navigationItem](self, "navigationItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setLeftBarButtonItem:", v12);

  -[_SFAccountTableViewController searchController](self, "searchController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setHidesNavigationBarDuringPresentation:", 0);
  objc_msgSend(v14, "setAutomaticallyShowsCancelButton:", 0);
  if (self->_group)
    -[KCSharingGroup displayName](self->_group, "displayName");
  else
    _WBSLocalizedString();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFMoveAccountsToGroupPickerViewController navigationItem](self, "navigationItem");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setTitle:", v15);

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);
}

id __56__SFMoveAccountsToGroupPickerViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
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
  v4.super_class = (Class)SFMoveAccountsToGroupPickerViewController;
  -[_SFAccountTableViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[SFMoveAccountsToGroupPickerViewController _reloadDiffableDataSource](self, "_reloadDiffableDataSource");
}

- (void)_reloadDiffableDataSource
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  id obj;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _QWORD v31[5];
  void *v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0DC3398]);
  -[_SFAccountTableViewController searchPattern](self, "searchPattern");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  if (!v5)
    objc_msgSend(v3, "appendSectionsWithIdentifiers:", &unk_1E4B270B8);
  objc_msgSend(MEMORY[0x1E0D8AC08], "sharedStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "savedAccounts");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
  {
    v24 = v7;
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __70__SFMoveAccountsToGroupPickerViewController__reloadDiffableDataSource__block_invoke;
    v31[3] = &unk_1E4AC0300;
    v31[4] = self;
    v8 = (void *)MEMORY[0x1A8598C40](v31);
    objc_msgSend(v6, "savedAccountsInPersonalKeychainExcludingNeverSaveMarkerPasswords");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "safari_mapAndFilterObjectsUsingBlock:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (self->_group && objc_msgSend(v10, "count"))
    {
      objc_msgSend(v3, "appendSectionsWithIdentifiers:", &unk_1E4B270D0);
      objc_msgSend(v3, "appendItemsWithIdentifiers:", v10);
    }
    v23 = v10;
    v25 = v3;
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    objc_msgSend(v6, "sharingGroupsWithSavedAccounts");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v28 != v13)
            objc_enumerationMutation(obj);
          v15 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
          if ((objc_msgSend(v15, "isEqual:", self->_group) & 1) == 0)
          {
            objc_msgSend(v15, "groupID");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = v6;
            objc_msgSend(v6, "savedAccountsForGroupID:", v16);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "safari_mapObjectsUsingBlock:", v8);
            v19 = (void *)objc_claimAutoreleasedReturnValue();

            if (objc_msgSend(v19, "count"))
            {
              v32 = v15;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v32, 1);
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "appendSectionsWithIdentifiers:", v20);

              objc_msgSend(v25, "appendItemsWithIdentifiers:", v19);
            }

            v6 = v17;
          }
        }
        v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
      }
      while (v12);
    }

    v3 = v25;
    -[SFTableViewDiffableDataSource applySnapshot:animatingDifferences:](self->_diffableDataSource, "applySnapshot:animatingDifferences:", v25, 0);

    v7 = v24;
  }
  else
  {
    -[SFTableViewDiffableDataSource applySnapshot:animatingDifferences:](self->_diffableDataSource, "applySnapshot:animatingDifferences:", v3, 0);
    -[SFMoveAccountsToGroupPickerViewController navigationController](self, "navigationController");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (id)objc_msgSend(v21, "popViewControllerAnimated:", 1);

  }
}

id __70__SFMoveAccountsToGroupPickerViewController__reloadDiffableDataSource__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _BOOL8 v15;
  void *v16;
  void *v17;

  v3 = a2;
  objc_msgSend(MEMORY[0x1E0D8AC08], "sharedStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1088), "groupID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "_canMoveSavedAccount:toGroupWithID:", v3, v5);

  if (!v6)
    goto LABEL_5;
  objc_msgSend(*(id *)(a1 + 32), "searchPattern");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "length");

  if (!v8)
    goto LABEL_4;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1072), "associatedDomainsManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "highLevelDomain");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "domainsWithAssociatedCredentialsForDomain:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "searchPattern");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v10) = objc_msgSend(v3, "matchesUserTypedSearchPattern:associatedDomains:", v12, v11);

  if ((_DWORD)v10)
  {
LABEL_4:
    objc_msgSend(MEMORY[0x1E0D8AC08], "sharedStore");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "highLevelDomain");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v13, "numberOfSavedAccountsInPersonalKeychainForHighLevelDomain:", v14) == 1;

    objc_msgSend(*(id *)(a1 + 32), "searchPattern");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[SFAccountCellData accountCellDataWithSavedAccount:warning:searchPattern:savedAccountIsOnlySavedAccountForHighLevelDomain:shouldShowReusedPasswordWarning:](SFAccountCellData, "accountCellDataWithSavedAccount:warning:searchPattern:savedAccountIsOnlySavedAccountForHighLevelDomain:shouldShowReusedPasswordWarning:", v3, 0, v16, v15, objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1112), "containsObject:", v3));
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
LABEL_5:
    v17 = 0;
  }

  return v17;
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
  void *v13;
  void *v14;

  v5 = a3;
  -[SFMoveAccountsToGroupPickerViewController tableView](self, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", CFSTR("accountCellReuseIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
    v9 = v7;
  else
    v9 = -[SFAccountTableViewCell initWithStyle:reuseIdentifier:]([SFAccountTableViewCell alloc], "initWithStyle:reuseIdentifier:", 3, CFSTR("accountCellReuseIdentifier"));
  v10 = v9;

  -[SFAccountTableViewCell setDelegate:](v10, "setDelegate:", self);
  v11 = v5;
  objc_msgSend(v11, "savedAccount");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFAccountTableViewCell setSavedAccount:searchPattern:emphasizeUserName:isReusedPassword:](v10, "setSavedAccount:searchPattern:emphasizeUserName:isReusedPassword:", v12, &stru_1E4AC8470, 0, -[NSMutableSet containsObject:](self->_reusedPasswords, "containsObject:", v12));
  if (-[NSMutableSet containsObject:](self->_selectedSavedAccounts, "containsObject:", v12))
  {
    -[SFMoveAccountsToGroupPickerViewController tableView](self, "tableView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFTableViewDiffableDataSource indexPathForItemIdentifier:](self->_diffableDataSource, "indexPathForItemIdentifier:", v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "selectRowAtIndexPath:animated:scrollPosition:", v14, 0, 0);

  }
  return v10;
}

- (void)_addExistingPasswordsBarItemTapped:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id location;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
  objc_msgSend(v5, "startAnimating");
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithCustomView:", v5);
  -[SFMoveAccountsToGroupPickerViewController navigationItem](self, "navigationItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setRightBarButtonItem:", v6);

  -[SFMoveAccountsToGroupPickerViewController navigationItem](self, "navigationItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "leftBarButtonItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setEnabled:", 0);

  -[SFMoveAccountsToGroupPickerViewController tableView](self, "tableView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setUserInteractionEnabled:", 0);

  objc_initWeak(&location, self);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __80__SFMoveAccountsToGroupPickerViewController__addExistingPasswordsBarItemTapped___block_invoke;
  v11[3] = &unk_1E4AC1AA8;
  objc_copyWeak(&v12, &location);
  -[SFMoveAccountsToGroupPickerViewController _checkReusedPasswordsAndPresentAlertIfNecessary:](self, "_checkReusedPasswordsAndPresentAlertIfNecessary:", v11);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

void __80__SFMoveAccountsToGroupPickerViewController__addExistingPasswordsBarItemTapped___block_invoke(uint64_t a1, char a2)
{
  id *WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id *v10;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && (a2 & 1) == 0)
  {
    v4 = (void *)MEMORY[0x1E0D6C058];
    v10 = WeakRetained;
    objc_msgSend(WeakRetained[138], "allObjects");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10[136], "displayName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "confirmationAlertTitleAndSubtitleForMovingSavedAccounts:toGroupWithName:", v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v10, "_presentConfirmationAlertForMovingSharedSavedAccountsWithConfiguration:", v7);
    }
    else
    {
      v8 = objc_loadWeakRetained(v10 + 140);
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v10[138], "allObjects");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "moveAccountsToGroupPickerTableViewController:didPickSavedAccounts:", v10, v9);

      }
    }

    WeakRetained = v10;
  }

}

- (void)_loadReusedPasswords
{
  WBSPasswordWarningManager *passwordWarningManager;
  _QWORD v4[5];
  id v5;
  id location;

  objc_initWeak(&location, self);
  passwordWarningManager = self->_passwordWarningManager;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __65__SFMoveAccountsToGroupPickerViewController__loadReusedPasswords__block_invoke;
  v4[3] = &unk_1E4AC1DC0;
  v4[4] = self;
  objc_copyWeak(&v5, &location);
  -[WBSPasswordWarningManager getAllWarningsForcingUpdate:completionHandler:](passwordWarningManager, "getAllWarningsForcingUpdate:completionHandler:", 0, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __65__SFMoveAccountsToGroupPickerViewController__loadReusedPasswords__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD v9[5];
  id v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __65__SFMoveAccountsToGroupPickerViewController__loadReusedPasswords__block_invoke_2;
  v9[3] = &unk_1E4AC1D98;
  v9[4] = *(_QWORD *)(a1 + 32);
  v10 = v6;
  v7 = v6;
  objc_copyWeak(&v12, (id *)(a1 + 40));
  v11 = v5;
  v8 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v9);

  objc_destroyWeak(&v12);
}

void __65__SFMoveAccountsToGroupPickerViewController__loadReusedPasswords__block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void **v4;
  NSObject *v5;
  void *v6;
  void *v7;
  _QWORD *WeakRetained;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  _QWORD *v16;
  _QWORD v17[5];

  v2 = objc_alloc_init(MEMORY[0x1E0D8AC10]);
  v3 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __65__SFMoveAccountsToGroupPickerViewController__loadReusedPasswords__block_invoke_3;
  v17[3] = &unk_1E4ABFE00;
  v17[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v2, "setHandler:", v17);
  v4 = (void **)(a1 + 40);
  if (*(_QWORD *)(a1 + 40))
  {
    v5 = WBS_LOG_CHANNEL_PREFIXPasswords();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __65__SFMoveAccountsToGroupPickerViewController__loadReusedPasswords__block_invoke_2_cold_1(v4, v5);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D8AC08], "sharedStore");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "savedAccounts");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    if (WeakRetained)
    {
      v9 = (void *)MEMORY[0x1E0C99E20];
      v10 = *(void **)(a1 + 48);
      v14[0] = v3;
      v14[1] = 3221225472;
      v14[2] = __65__SFMoveAccountsToGroupPickerViewController__loadReusedPasswords__block_invoke_57;
      v14[3] = &unk_1E4AC1D70;
      v15 = v7;
      v16 = WeakRetained;
      objc_msgSend(v10, "safari_mapAndFilterObjectsUsingBlock:", v14);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setWithArray:", v11);
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = (void *)WeakRetained[139];
      WeakRetained[139] = v12;

    }
  }

}

uint64_t __65__SFMoveAccountsToGroupPickerViewController__loadReusedPasswords__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reloadDiffableDataSource");
}

id __65__SFMoveAccountsToGroupPickerViewController__loadReusedPasswords__block_invoke_57(uint64_t a1, void *a2)
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

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "savedAccount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v4, "containsObject:", v5);

  if ((_DWORD)v4 && (objc_msgSend(v3, "issueTypes") & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0D8AC08], "sharedStore");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1088), "groupID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "savedAccountsForGroupID:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = *(void **)(*(_QWORD *)(a1 + 40) + 1080);
    objc_msgSend(v3, "savedAccount");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v10) = objc_msgSend(v10, "savedAccountsFromGroup:containsPasswordFromSavedAccount:", v9, v11);

    if ((v10 & 1) != 0)
    {
      v6 = 0;
    }
    else
    {
      objc_msgSend(v3, "savedAccount");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)_checkReusedPasswordsAndPresentAlertIfNecessary:(id)a3
{
  void (**v4)(id, uint64_t);
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  SFMoveAccountsToGroupPickerViewController *v21;
  id v22;
  _QWORD v23[5];

  v4 = (void (**)(id, uint64_t))a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithSet:", self->_selectedSavedAccounts);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "intersectSet:", self->_reusedPasswords);
    if (objc_msgSend(v6, "count"))
    {
      -[NSMutableSet allObjects](self->_selectedSavedAccounts, "allObjects");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D6C058], "warningAlertTitleForMovingNumberOfReusedPasswords:withTotalNumberOfAccountsSelected:", objc_msgSend(v6, "count"), objc_msgSend(v7, "count"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D6C058], "warningAlertMessageForMovingNumberOfReusedPasswords:withTotalNumberOfAccountsSelected:", objc_msgSend(v6, "count"), objc_msgSend(v7, "count"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v18, v17, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)MEMORY[0x1E0DC3448];
      _WBSLocalizedString();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = MEMORY[0x1E0C809B0];
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __93__SFMoveAccountsToGroupPickerViewController__checkReusedPasswordsAndPresentAlertIfNecessary___block_invoke;
      v23[3] = &unk_1E4AC0010;
      v23[4] = self;
      objc_msgSend(v9, "actionWithTitle:style:handler:", v10, 1, v23);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addAction:", v12);

      v13 = (void *)MEMORY[0x1E0DC3448];
      _WBSLocalizedString();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = v11;
      v19[1] = 3221225472;
      v19[2] = __93__SFMoveAccountsToGroupPickerViewController__checkReusedPasswordsAndPresentAlertIfNecessary___block_invoke_2;
      v19[3] = &unk_1E4AC09C8;
      v20 = WeakRetained;
      v21 = self;
      v22 = v7;
      v15 = v7;
      objc_msgSend(v13, "actionWithTitle:style:handler:", v14, 0, v19);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addAction:", v16);

      v4[2](v4, 1);
      -[SFMoveAccountsToGroupPickerViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v8, 1, 0);

    }
    else
    {
      v4[2](v4, 0);
    }

  }
  else
  {
    v4[2](v4, 0);
  }

}

uint64_t __93__SFMoveAccountsToGroupPickerViewController__checkReusedPasswordsAndPresentAlertIfNecessary___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setUserInteractionEnabled:", 1);

  return objc_msgSend(*(id *)(a1 + 32), "_updateNavigationBarItems");
}

uint64_t __93__SFMoveAccountsToGroupPickerViewController__checkReusedPasswordsAndPresentAlertIfNecessary___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "moveAccountsToGroupPickerTableViewController:didPickSavedAccounts:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_presentConfirmationAlertForMovingSharedSavedAccountsWithConfiguration:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  _QWORD v17[5];

  v4 = (void *)MEMORY[0x1E0DC3450];
  v5 = a3;
  objc_msgSend(v5, "first");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "second");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "alertControllerWithTitle:message:preferredStyle:", v6, v7, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0DC3448];
  _WBSLocalizedString();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __116__SFMoveAccountsToGroupPickerViewController__presentConfirmationAlertForMovingSharedSavedAccountsWithConfiguration___block_invoke;
  v17[3] = &unk_1E4AC0010;
  v17[4] = self;
  objc_msgSend(v9, "actionWithTitle:style:handler:", v10, 1, v17);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addAction:", v12);

  v13 = (void *)MEMORY[0x1E0DC3448];
  _WBSLocalizedString();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v11;
  v16[1] = 3221225472;
  v16[2] = __116__SFMoveAccountsToGroupPickerViewController__presentConfirmationAlertForMovingSharedSavedAccountsWithConfiguration___block_invoke_2;
  v16[3] = &unk_1E4AC0010;
  v16[4] = self;
  objc_msgSend(v13, "actionWithTitle:style:handler:", v14, 0, v16);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addAction:", v15);

  -[SFMoveAccountsToGroupPickerViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v8, 1, 0);
}

uint64_t __116__SFMoveAccountsToGroupPickerViewController__presentConfirmationAlertForMovingSharedSavedAccountsWithConfiguration___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setUserInteractionEnabled:", 1);

  return objc_msgSend(*(id *)(a1 + 32), "_updateNavigationBarItems");
}

void __116__SFMoveAccountsToGroupPickerViewController__presentConfirmationAlertForMovingSharedSavedAccountsWithConfiguration___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 1120));
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v2 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(v2 + 1104), "allObjects");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "moveAccountsToGroupPickerTableViewController:didPickSavedAccounts:", v2, v3);

  }
}

- (void)_cancel
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "moveAccountsToGroupPickerTableViewControllerDidCancel:", self);

}

- (void)_updateNavigationBarItems
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  KCSharingGroup *group;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v3 = -[NSMutableSet count](self->_selectedSavedAccounts, "count");
  v4 = objc_alloc(MEMORY[0x1E0DC34F0]);
  _WBSLocalizedString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithTitle:style:target:action:", v5, 2, self, sel__addExistingPasswordsBarItemTapped_);
  -[SFMoveAccountsToGroupPickerViewController navigationItem](self, "navigationItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setRightBarButtonItem:", v6);

  -[SFMoveAccountsToGroupPickerViewController navigationItem](self, "navigationItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "rightBarButtonItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v3)
  {
    objc_msgSend(v9, "setEnabled:", 1);

    if (self->_pickerType > 1uLL)
    {
      v16 = 0;
    }
    else
    {
      _WBSLocalizedString();
      v16 = (id)objc_claimAutoreleasedReturnValue();
    }
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithTitle:style:target:action:", v16, 2, self, sel__cancel);
    -[SFMoveAccountsToGroupPickerViewController navigationItem](self, "navigationItem");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setLeftBarButtonItem:", v12);

    objc_msgSend(MEMORY[0x1E0D6C060], "pickerTitleForNumberOfSelectedAccounts:", v3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFMoveAccountsToGroupPickerViewController navigationItem](self, "navigationItem");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setTitle:", v14);

  }
  else
  {
    objc_msgSend(v9, "setEnabled:", 0);

    group = self->_group;
    if (group)
      -[KCSharingGroup displayName](group, "displayName");
    else
      _WBSLocalizedString();
    v16 = (id)objc_claimAutoreleasedReturnValue();
    -[SFMoveAccountsToGroupPickerViewController navigationItem](self, "navigationItem");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setTitle:", v16);
  }

}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  NSMutableSet *selectedSavedAccounts;
  void *v8;
  id v9;

  v5 = a4;
  -[SFMoveAccountsToGroupPickerViewController tableView](self, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cellForRowAtIndexPath:", v5);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    selectedSavedAccounts = self->_selectedSavedAccounts;
    objc_msgSend(v9, "savedAccount");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableSet addObject:](selectedSavedAccounts, "addObject:", v8);

    -[SFMoveAccountsToGroupPickerViewController _updateNavigationBarItems](self, "_updateNavigationBarItems");
  }

}

- (void)tableView:(id)a3 didDeselectRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  NSMutableSet *selectedSavedAccounts;
  void *v8;
  id v9;

  v5 = a4;
  -[SFMoveAccountsToGroupPickerViewController tableView](self, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cellForRowAtIndexPath:", v5);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    selectedSavedAccounts = self->_selectedSavedAccounts;
    objc_msgSend(v9, "savedAccount");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableSet removeObject:](selectedSavedAccounts, "removeObject:", v8);

    -[SFMoveAccountsToGroupPickerViewController _updateNavigationBarItems](self, "_updateNavigationBarItems");
  }

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

  if (objc_msgSend(v8, "isEqual:", &unk_1E4B259C0))
  {
    -[SFMoveAccountsToGroupPickerViewController _headerForHeaderSection](self, "_headerForHeaderSection");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (objc_msgSend(v8, "isEqual:", &unk_1E4B259D8))
      -[SFMoveAccountsToGroupPickerViewController _headerForMyPasswordsSection](self, "_headerForMyPasswordsSection");
    else
      -[SFMoveAccountsToGroupPickerViewController _headerForSharingGroupSection:](self, "_headerForSharingGroupSection:", v8);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v10 = (void *)v9;

  return v10;
}

- (id)_headerForHeaderSection
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  -[SFMoveAccountsToGroupPickerViewController tableView](self, "tableView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dequeueReusableHeaderFooterViewWithIdentifier:", CFSTR("informationalHeaderView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = v3;
  else
    v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D78]), "initWithReuseIdentifier:", CFSTR("informationalHeaderView"));
  v6 = v5;

  objc_msgSend(MEMORY[0x1E0DC39A8], "groupedFooterConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  _WBSLocalizedString();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setText:", v8);

  objc_msgSend(v6, "setContentConfiguration:", v7);
  return v6;
}

- (BOOL)_shouldShowMyPasswordsSectionHeader
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;

  objc_msgSend(MEMORY[0x1E0D8AC08], "sharedStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_group)
  {
    objc_msgSend(v3, "savedAccountsInPersonalKeychainExcludingNeverSaveMarkerPasswords");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "count"))
    {
      objc_msgSend(MEMORY[0x1E0D8AA48], "sharedProvider");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "cachedGroups");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "count") != 0;

    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
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

  if (-[SFMoveAccountsToGroupPickerViewController _shouldShowMyPasswordsSectionHeader](self, "_shouldShowMyPasswordsSectionHeader"))
  {
    -[SFMoveAccountsToGroupPickerViewController tableView](self, "tableView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "dequeueReusableHeaderFooterViewWithIdentifier:", CFSTR("accountSectionHeaderViewReuseIdentifier"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
      v6 = v4;
    else
      v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D78]), "initWithReuseIdentifier:", CFSTR("accountSectionHeaderViewReuseIdentifier"));
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

  if (a3)
  {
    v4 = a3;
    -[SFMoveAccountsToGroupPickerViewController tableView](self, "tableView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dequeueReusableHeaderFooterViewWithIdentifier:", CFSTR("accountSectionHeaderViewReuseIdentifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
      v8 = v6;
    else
      v8 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D78]), "initWithReuseIdentifier:", CFSTR("accountSectionHeaderViewReuseIdentifier"));
    v9 = v8;

    objc_msgSend(MEMORY[0x1E0DC39A8], "groupedHeaderConfiguration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "displayName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "setText:", v11);
    objc_msgSend(v9, "setContentConfiguration:", v10);

  }
  else
  {
    v9 = 0;
  }
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

  if (objc_msgSend(v7, "isEqual:", &unk_1E4B259C0))
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

  if (objc_msgSend(v7, "isEqual:", &unk_1E4B259C0))
    v8 = 0.0;
  else
    v8 = *MEMORY[0x1E0DC53D8];

  return v8;
}

- (id)tableView:(id)a3 contextMenuConfigurationForRowAtIndexPath:(id)a4 point:(CGPoint)a5
{
  return 0;
}

- (BOOL)dataSource:(id)a3 canEditRowAtIndexPath:(id)a4
{
  return 1;
}

- (BOOL)canBeShownFromSuspendedState
{
  return 1;
}

- (SFMoveAccountsToGroupPickerViewControllerDelegate)delegate
{
  return (SFMoveAccountsToGroupPickerViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_reusedPasswords, 0);
  objc_storeStrong((id *)&self->_selectedSavedAccounts, 0);
  objc_storeStrong((id *)&self->_group, 0);
  objc_storeStrong((id *)&self->_passwordWarningManager, 0);
  objc_storeStrong((id *)&self->_autoFillQuirksManager, 0);
  objc_storeStrong((id *)&self->_diffableDataSource, 0);
}

void __65__SFMoveAccountsToGroupPickerViewController__loadReusedPasswords__block_invoke_2_cold_1(void **a1, void *a2)
{
  void *v2;
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = *a1;
  v3 = a2;
  objc_msgSend(v2, "safari_privacyPreservingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138543362;
  v6 = v4;
  _os_log_error_impl(&dword_1A3B2D000, v3, OS_LOG_TYPE_ERROR, "Error loading password warnings. %{public}@", (uint8_t *)&v5, 0xCu);

}

@end
