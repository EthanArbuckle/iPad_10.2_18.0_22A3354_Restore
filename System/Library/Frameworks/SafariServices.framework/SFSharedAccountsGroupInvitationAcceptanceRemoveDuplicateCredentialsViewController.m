@implementation SFSharedAccountsGroupInvitationAcceptanceRemoveDuplicateCredentialsViewController

- (SFSharedAccountsGroupInvitationAcceptanceRemoveDuplicateCredentialsViewController)initWithGroup:(id)a3 autoFillQuirksManager:(id)a4
{
  id v7;
  id v8;
  _SFAccountTableConfiguration *v9;
  void *v10;
  SFSharedAccountsGroupInvitationAcceptanceRemoveDuplicateCredentialsViewController *v11;
  uint64_t v12;
  NSMutableSet *selectedSavedAccounts;
  SFSharedAccountsGroupInvitationAcceptanceRemoveDuplicateCredentialsViewController *v14;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v9 = objc_alloc_init(_SFAccountTableConfiguration);
  -[_SFAccountTableConfiguration setShouldShowSearchBar:](v9, "setShouldShowSearchBar:", 1);
  -[_SFAccountTableConfiguration setSupportsDelete:](v9, "setSupportsDelete:", 0);
  -[_SFAccountTableConfiguration setSupportsShare:](v9, "setSupportsShare:", 0);
  -[_SFAccountTableConfiguration setShouldConfigureMultipleSelectionDuringEditing:](v9, "setShouldConfigureMultipleSelectionDuringEditing:", 1);
  objc_msgSend(MEMORY[0x1E0D4EF88], "sharedSiteMetadataManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16.receiver = self;
  v16.super_class = (Class)SFSharedAccountsGroupInvitationAcceptanceRemoveDuplicateCredentialsViewController;
  v11 = -[_SFAccountTableViewController initWithSiteMetadataManager:configuration:](&v16, sel_initWithSiteMetadataManager_configuration_, v10, v9);

  if (v11)
  {
    objc_storeStrong((id *)&v11->_autoFillQuirksManager, a4);
    objc_storeStrong((id *)&v11->_group, a3);
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v12 = objc_claimAutoreleasedReturnValue();
    selectedSavedAccounts = v11->_selectedSavedAccounts;
    v11->_selectedSavedAccounts = (NSMutableSet *)v12;

    v14 = v11;
  }

  return v11;
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
  v16.super_class = (Class)SFSharedAccountsGroupInvitationAcceptanceRemoveDuplicateCredentialsViewController;
  -[_SFAccountTableViewController viewDidLoad](&v16, sel_viewDidLoad);
  objc_initWeak(&location, self);
  v3 = objc_alloc(MEMORY[0x1E0D4EE40]);
  -[SFSharedAccountsGroupInvitationAcceptanceRemoveDuplicateCredentialsViewController tableView](self, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __96__SFSharedAccountsGroupInvitationAcceptanceRemoveDuplicateCredentialsViewController_viewDidLoad__block_invoke;
  v13 = &unk_1E4ABFD40;
  objc_copyWeak(&v14, &location);
  v5 = (SFTableViewDiffableDataSource *)objc_msgSend(v3, "initWithTableView:cellProvider:", v4, &v10);
  diffableDataSource = self->_diffableDataSource;
  self->_diffableDataSource = v5;

  -[SFTableViewDiffableDataSource setDelegate:](self->_diffableDataSource, "setDelegate:", self, v10, v11, v12, v13);
  -[SFSharedAccountsGroupInvitationAcceptanceRemoveDuplicateCredentialsViewController setEditing:](self, "setEditing:", 1);
  -[_SFAccountTableViewController searchController](self, "searchController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setHidesNavigationBarDuringPresentation:", 0);
  objc_msgSend(v7, "setAutomaticallyShowsCancelButton:", 0);
  _WBSLocalizedString();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFSharedAccountsGroupInvitationAcceptanceRemoveDuplicateCredentialsViewController navigationItem](self, "navigationItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTitle:", v8);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

id __96__SFSharedAccountsGroupInvitationAcceptanceRemoveDuplicateCredentialsViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
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
  v4.super_class = (Class)SFSharedAccountsGroupInvitationAcceptanceRemoveDuplicateCredentialsViewController;
  -[_SFAccountTableViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[SFSharedAccountsGroupInvitationAcceptanceRemoveDuplicateCredentialsViewController _reloadDiffableDataSource](self, "_reloadDiffableDataSource");
  -[SFSharedAccountsGroupInvitationAcceptanceRemoveDuplicateCredentialsViewController _updateNavigationBarItems](self, "_updateNavigationBarItems");
}

- (void)_reloadDiffableDataSource
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;

  v11 = objc_alloc_init(MEMORY[0x1E0DC3398]);
  -[_SFAccountTableViewController searchPattern](self, "searchPattern");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (!v4)
    objc_msgSend(v11, "appendSectionsWithIdentifiers:", &unk_1E4B26968);
  objc_msgSend(MEMORY[0x1E0D8AC08], "sharedStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[KCSharingGroup groupID](self->_group, "groupID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "duplicateAccountsWithGroupID:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "count"))
  {
    -[NSMutableSet addObjectsFromArray:](self->_selectedSavedAccounts, "addObjectsFromArray:", v7);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __110__SFSharedAccountsGroupInvitationAcceptanceRemoveDuplicateCredentialsViewController__reloadDiffableDataSource__block_invoke;
    v12[3] = &unk_1E4ABFD68;
    v12[4] = self;
    v13 = v5;
    objc_msgSend(v7, "safari_mapAndFilterObjectsUsingBlock:", v12);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "appendItemsWithIdentifiers:", v8);
    -[SFTableViewDiffableDataSource applySnapshot:animatingDifferences:](self->_diffableDataSource, "applySnapshot:animatingDifferences:", v11, 0);

  }
  else
  {
    -[SFTableViewDiffableDataSource applySnapshot:animatingDifferences:](self->_diffableDataSource, "applySnapshot:animatingDifferences:", v11, 0);
    -[SFSharedAccountsGroupInvitationAcceptanceRemoveDuplicateCredentialsViewController navigationController](self, "navigationController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (id)objc_msgSend(v9, "popViewControllerAnimated:", 1);

  }
}

id __110__SFSharedAccountsGroupInvitationAcceptanceRemoveDuplicateCredentialsViewController__reloadDiffableDataSource__block_invoke(uint64_t a1, void *a2)
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
  void *v13;
  void *v14;

  v5 = a3;
  -[SFSharedAccountsGroupInvitationAcceptanceRemoveDuplicateCredentialsViewController tableView](self, "tableView");
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
  -[SFAccountTableViewCell setSavedAccount:searchPattern:emphasizeUserName:](v10, "setSavedAccount:searchPattern:emphasizeUserName:", v12, &stru_1E4AC8470, 0);
  if (-[NSMutableSet containsObject:](self->_selectedSavedAccounts, "containsObject:", v12))
  {
    -[SFSharedAccountsGroupInvitationAcceptanceRemoveDuplicateCredentialsViewController tableView](self, "tableView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFTableViewDiffableDataSource indexPathForItemIdentifier:](self->_diffableDataSource, "indexPathForItemIdentifier:", v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "selectRowAtIndexPath:animated:scrollPosition:", v14, 0, 0);

  }
  return v10;
}

- (void)_deleteButtonTapped:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id WeakRetained;

  -[SFSharedAccountsGroupInvitationAcceptanceRemoveDuplicateCredentialsViewController navigationItem](self, "navigationItem", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "leftBarButtonItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEnabled:", 0);

  -[SFSharedAccountsGroupInvitationAcceptanceRemoveDuplicateCredentialsViewController tableView](self, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setUserInteractionEnabled:", 0);

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[NSMutableSet allObjects](self->_selectedSavedAccounts, "allObjects");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "removeDuplicateCredentialsViewController:didPickSavedAccounts:", self, v7);

  }
}

- (void)_notNowButtonTapped
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "removeDuplicateCredentialsViewControllerDidSelectNotNow:", self);

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
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v3 = -[NSMutableSet count](self->_selectedSavedAccounts, "count");
  v4 = objc_alloc(MEMORY[0x1E0DC34F0]);
  _WBSLocalizedString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithTitle:style:target:action:", v5, 2, self, sel__deleteButtonTapped_);
  -[SFSharedAccountsGroupInvitationAcceptanceRemoveDuplicateCredentialsViewController navigationItem](self, "navigationItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setRightBarButtonItem:", v6);

  -[SFSharedAccountsGroupInvitationAcceptanceRemoveDuplicateCredentialsViewController navigationItem](self, "navigationItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "rightBarButtonItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v3)
  {
    objc_msgSend(v9, "setEnabled:", 1);

    v11 = objc_alloc(MEMORY[0x1E0DC34F0]);
    _WBSLocalizedString();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v11, "initWithTitle:style:target:action:", v12, 2, self, sel__notNowButtonTapped);
    -[SFSharedAccountsGroupInvitationAcceptanceRemoveDuplicateCredentialsViewController navigationItem](self, "navigationItem");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setLeftBarButtonItem:", v13);

    objc_msgSend(MEMORY[0x1E0D6C060], "pickerTitleForNumberOfSelectedAccounts:", v3);
  }
  else
  {
    objc_msgSend(v9, "setEnabled:", 0);

    _WBSLocalizedString();
  }
  v16 = (id)objc_claimAutoreleasedReturnValue();
  -[SFSharedAccountsGroupInvitationAcceptanceRemoveDuplicateCredentialsViewController navigationItem](self, "navigationItem");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setTitle:", v16);

}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  NSMutableSet *selectedSavedAccounts;
  void *v8;
  id v9;

  v5 = a4;
  -[SFSharedAccountsGroupInvitationAcceptanceRemoveDuplicateCredentialsViewController tableView](self, "tableView");
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

    -[SFSharedAccountsGroupInvitationAcceptanceRemoveDuplicateCredentialsViewController _updateNavigationBarItems](self, "_updateNavigationBarItems");
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
  -[SFSharedAccountsGroupInvitationAcceptanceRemoveDuplicateCredentialsViewController tableView](self, "tableView");
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

    -[SFSharedAccountsGroupInvitationAcceptanceRemoveDuplicateCredentialsViewController _updateNavigationBarItems](self, "_updateNavigationBarItems");
  }

}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[SFTableViewDiffableDataSource snapshot](self->_diffableDataSource, "snapshot", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sectionIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndexedSubscript:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "isEqual:", &unk_1E4B255B8))
  {
    -[SFSharedAccountsGroupInvitationAcceptanceRemoveDuplicateCredentialsViewController _headerForHeaderSection](self, "_headerForHeaderSection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)_headerForHeaderSection
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  -[SFSharedAccountsGroupInvitationAcceptanceRemoveDuplicateCredentialsViewController tableView](self, "tableView");
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
  objc_msgSend(v8, "textProperties");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAlignment:", 1);

  v10 = (void *)MEMORY[0x1E0C92630];
  -[KCSharingGroup displayName](self->_group, "displayName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "descriptionForRemovingDuplicateCredentialsInGroup:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setText:", v12);

  objc_msgSend(v7, "setContentConfiguration:", v8);
  return v7;
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

- (SFSharedAccountsGroupInvitationAcceptanceRemoveDuplicateCredentialsViewControllerDelegate)delegate
{
  return (SFSharedAccountsGroupInvitationAcceptanceRemoveDuplicateCredentialsViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_selectedSavedAccounts, 0);
  objc_storeStrong((id *)&self->_group, 0);
  objc_storeStrong((id *)&self->_autoFillQuirksManager, 0);
  objc_storeStrong((id *)&self->_diffableDataSource, 0);
}

@end
