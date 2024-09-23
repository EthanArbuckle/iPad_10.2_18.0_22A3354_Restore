@implementation CNContactGroupPickerViewController

- (CNContactGroupPickerViewController)initWithContactStore:(id)a3
{
  return -[CNContactGroupPickerViewController initWithContactStore:sourceAccountExternalIdentifiers:](self, "initWithContactStore:sourceAccountExternalIdentifiers:", a3, 0);
}

- (CNContactGroupPickerViewController)initWithContactStore:(id)a3 sourceAccountExternalIdentifiers:(id)a4
{
  id v6;
  id v7;
  CNContactGroupPickerViewController *v8;
  CNAccountsAndGroupsDataSource *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  CNContactGroupPickerViewController *v14;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)CNContactGroupPickerViewController;
  v8 = -[CNContactGroupPickerViewController initWithNibName:bundle:](&v16, sel_initWithNibName_bundle_, 0, 0);
  if (v8)
  {
    v9 = -[CNAccountsAndGroupsDataSource initWithStore:]([CNAccountsAndGroupsDataSource alloc], "initWithStore:", v6);
    -[CNContactGroupPickerViewController setAccountsAndGroupsDataSource:](v8, "setAccountsAndGroupsDataSource:", v9);

    -[CNContactGroupPickerViewController accountsAndGroupsDataSource](v8, "accountsAndGroupsDataSource");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setOnlyShowsGroupsInSections:", 1);

    -[CNContactGroupPickerViewController accountsAndGroupsDataSource](v8, "accountsAndGroupsDataSource");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setSourceAccountExternalIdentifiers:", v7);

    CNContactsUIBundle();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("LISTS"), &stru_1E20507A8, CFSTR("Localized"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactGroupPickerViewController setTitle:](v8, "setTitle:", v13);

    v14 = v8;
  }

  return v8;
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CNContactGroupPickerViewController;
  -[CNContactGroupPickerViewController viewDidLoad](&v3, sel_viewDidLoad);
  -[CNContactGroupPickerViewController setupNavigationButtons](self, "setupNavigationButtons");
  -[CNContactGroupPickerViewController setupCollectionView](self, "setupCollectionView");
  -[CNContactGroupPickerViewController setupDiffableDataSource](self, "setupDiffableDataSource");
  -[CNContactGroupPickerViewController reloadData](self, "reloadData");
}

- (void)setupNavigationButtons
{
  void *v3;
  id v4;

  v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 1, self, sel_cancel_);
  -[CNContactGroupPickerViewController navigationItem](self, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setLeftBarButtonItem:", v4);

}

- (void)cancel:(id)a3
{
  void *v4;
  id v5;

  -[CNContactGroupPickerViewController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[CNContactGroupPickerViewController delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "groupPickerDidCancel:", self);
  }
  else
  {
    -[CNContactGroupPickerViewController navigationController](self, "navigationController");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dismissViewControllerAnimated:completion:", 1, 0);
  }

}

- (void)setupCollectionView
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
  uint64_t v13;
  uint64_t v14;
  id (*v15)(uint64_t, void *, void *);
  void *v16;
  id v17;
  id location;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC35A8]), "initWithAppearance:", 1);
  objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemGroupedBackgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

  objc_initWeak(&location, self);
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __57__CNContactGroupPickerViewController_setupCollectionView__block_invoke;
  v16 = &unk_1E2048DE0;
  objc_copyWeak(&v17, &location);
  objc_msgSend(v3, "setItemSeparatorHandler:", &v13);
  objc_msgSend(MEMORY[0x1E0DC35D0], "layoutWithListConfiguration:", v3, v13, v14, v15, v16);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc(MEMORY[0x1E0DC35B8]);
  -[CNContactGroupPickerViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  v8 = (void *)objc_msgSend(v6, "initWithFrame:collectionViewLayout:", v5);
  -[CNContactGroupPickerViewController setCollectionView:](self, "setCollectionView:", v8);

  -[CNContactGroupPickerViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactGroupPickerViewController collectionView](self, "collectionView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addSubview:", v10);

  -[CNContactGroupPickerViewController collectionView](self, "collectionView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAutoresizingMask:", 18);

  -[CNContactGroupPickerViewController collectionView](self, "collectionView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setDelegate:", self);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

}

- (NSDirectionalEdgeInsets)bottomSeparatorInsetsForIndexPath:(id)a3 configuration:(id)a4
{
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  NSDirectionalEdgeInsets result;

  v6 = a3;
  objc_msgSend(a4, "bottomSeparatorInsets");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  -[CNContactGroupPickerViewController collectionView](self, "collectionView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "numberOfItemsInSection:", objc_msgSend(v6, "section"));

  v17 = objc_msgSend(v6, "row");
  if (v17 == v16 - 1)
  {
    -[CNContactGroupPickerViewController view](self, "view");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "layoutMargins");
    v10 = v19;

  }
  v20 = v8;
  v21 = v10;
  v22 = v12;
  v23 = v14;
  result.trailing = v23;
  result.bottom = v22;
  result.leading = v21;
  result.top = v20;
  return result;
}

- (void)setupDiffableDataSource
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
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  _QWORD v17[5];
  void *v18;
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0DC42A8]);
  v4 = objc_opt_class();
  v5 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __61__CNContactGroupPickerViewController_setupDiffableDataSource__block_invoke;
  v17[3] = &unk_1E2049910;
  v17[4] = self;
  v6 = (void *)objc_msgSend(v3, "initWithIdentifier:cellClass:handler:", CFSTR("Header"), v4, v17);
  v16[0] = v5;
  v16[1] = 3221225472;
  v16[2] = __61__CNContactGroupPickerViewController_setupDiffableDataSource__block_invoke_2;
  v16[3] = &unk_1E2048E08;
  v16[4] = self;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC42A8]), "initWithIdentifier:cellClass:handler:", CFSTR("List"), objc_opt_class(), v16);
  v8 = objc_alloc(MEMORY[0x1E0DC40E0]);
  v19[0] = v6;
  v19[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithItemRenderers:", v9);

  -[CNContactGroupPickerViewController setSectionController:](self, "setSectionController:", v10);
  v11 = objc_alloc(MEMORY[0x1E0DC35E8]);
  -[CNContactGroupPickerViewController collectionView](self, "collectionView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v18, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v11, "initWithCollectionView:sectionControllers:rendererIdentifierProvider:", v12, v13, &__block_literal_global_34);

  -[CNContactGroupPickerViewController setDiffableDataSource:](self, "setDiffableDataSource:", v14);
  -[CNContactGroupPickerViewController collectionView](self, "collectionView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setDelegate:", self);

}

- (id)cellAccessoriesForItem:(id)a3 enabled:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a4;
  v6 = a3;
  -[CNContactGroupPickerViewController accessoryTintColorForStateEnabled:](self, "accessoryTintColorForStateEnabled:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v6, "contactCountString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3578]), "initWithText:", v9);
    objc_msgSend(v10, "setTintColor:", v7);
    objc_msgSend(v8, "addObject:", v10);

  }
  objc_msgSend(v6, "groupSymbol");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v11);
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3550]), "initWithCustomView:placement:", v12, 0);
    objc_msgSend(v13, "setTintColor:", v7);
    objc_msgSend(v8, "addObject:", v13);

  }
  return v8;
}

- (id)accessoryTintColorForStateEnabled:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  if (a3)
  {
    v5 = 0;
  }
  else
  {
    +[CNUIColorRepository groupsDisabledTextColor](CNUIColorRepository, "groupsDisabledTextColor", v3, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (void)reloadData
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  id v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  void *v43;
  void *v44;
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  -[CNContactGroupPickerViewController sectionController](self, "sectionController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "associatedSectionIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v39, v46, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v40;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v40 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * i);
        -[CNContactGroupPickerViewController accountsAndGroupsDataSource](self, "accountsAndGroupsDataSource");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "sections");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "containsObject:", v9);

        if ((v12 & 1) == 0)
        {
          -[CNContactGroupPickerViewController sectionController](self, "sectionController");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "snapshotForSection:", v9);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v14, "deleteAllItems");
          -[CNContactGroupPickerViewController sectionController](self, "sectionController");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "applySnapshot:toSection:animatingDifferences:", v14, v9, 0);

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v39, v46, 16);
    }
    while (v6);
  }

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  -[CNContactGroupPickerViewController accountsAndGroupsDataSource](self, "accountsAndGroupsDataSource");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "sections");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v36;
    v21 = *MEMORY[0x1E0D13848];
    do
    {
      for (j = 0; j != v19; ++j)
      {
        if (*(_QWORD *)v36 != v20)
          objc_enumerationMutation(v17);
        v23 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * j);
        v24 = objc_alloc_init(MEMORY[0x1E0DC3390]);
        objc_msgSend(v23, "title");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = (*(uint64_t (**)(uint64_t, void *))(v21 + 16))(v21, v25);

        if (v26)
        {
          objc_msgSend(v23, "items");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "appendItems:", v27);
        }
        else
        {
          v44 = v23;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v44, 1);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "appendItems:", v28);

          objc_msgSend(v23, "items");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "appendItems:intoParent:", v29, v23);

          v43 = v23;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v43, 1);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "expandItems:", v27);
        }

        -[CNContactGroupPickerViewController sectionController](self, "sectionController");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "applySnapshot:toSection:animatingDifferences:completion:", v24, v23, 0, 0);

      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
    }
    while (v19);
  }

  -[CNContactGroupPickerViewController diffableDataSource](self, "diffableDataSource");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "snapshot");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v32, "itemIdentifiers");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "reloadItemsWithIdentifiers:", v33);

  -[CNContactGroupPickerViewController diffableDataSource](self, "diffableDataSource");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "applySnapshot:animatingDifferences:", v32, 0);

}

- (void)_updateContentUnavailableConfigurationUsingState:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  -[CNContactGroupPickerViewController accountsAndGroupsDataSource](self, "accountsAndGroupsDataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3698], "emptyConfiguration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "updatedConfigurationForState:", v11);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    CNContactsUIBundle();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("NO_GROUPS"), &stru_1E20507A8, CFSTR("Localized"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setText:", v10);

  }
  -[CNContactGroupPickerViewController _setContentUnavailableConfiguration:](self, "_setContentUnavailableConfiguration:", v7);

}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  return -[CNContactGroupPickerViewController isValidGroupAtIndexPath:](self, "isValidGroupAtIndexPath:", a4);
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  return -[CNContactGroupPickerViewController isValidGroupAtIndexPath:](self, "isValidGroupAtIndexPath:", a4);
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a4;
  if (-[CNContactGroupPickerViewController isValidGroupAtIndexPath:](self, "isValidGroupAtIndexPath:"))
  {
    objc_opt_class();
    -[CNContactGroupPickerViewController diffableDataSource](self, "diffableDataSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "itemIdentifierForIndexPath:", v11);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
    v8 = v7;

    -[CNContactGroupPickerViewController delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "group");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "groupPicker:didSelectGroup:", self, v10);
  }

}

- (BOOL)isValidGroupAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  BOOL v10;

  v4 = a3;
  objc_opt_class();
  -[CNContactGroupPickerViewController diffableDataSource](self, "diffableDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "itemIdentifierForIndexPath:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  if (v8)
  {
    objc_msgSend(v8, "group");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9 != 0;

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (CNContactGroupPickerViewControllerDelegate)delegate
{
  return (CNContactGroupPickerViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CNAccountsAndGroupsDataSource)accountsAndGroupsDataSource
{
  return self->_accountsAndGroupsDataSource;
}

- (void)setAccountsAndGroupsDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_accountsAndGroupsDataSource, a3);
}

- (NSArray)sourceAccountExternalIdentifiers
{
  return self->_sourceAccountExternalIdentifiers;
}

- (void)setSourceAccountExternalIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_sourceAccountExternalIdentifiers, a3);
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
  objc_storeStrong((id *)&self->_collectionView, a3);
}

- (UICollectionViewDiffableDataSource)diffableDataSource
{
  return self->_diffableDataSource;
}

- (void)setDiffableDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_diffableDataSource, a3);
}

- (_UIDiffableDataSourceOutlineSectionController)sectionController
{
  return self->_sectionController;
}

- (void)setSectionController:(id)a3
{
  objc_storeStrong((id *)&self->_sectionController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionController, 0);
  objc_storeStrong((id *)&self->_diffableDataSource, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_sourceAccountExternalIdentifiers, 0);
  objc_storeStrong((id *)&self->_accountsAndGroupsDataSource, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __61__CNContactGroupPickerViewController_setupDiffableDataSource__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  id v19;

  v5 = (void *)MEMORY[0x1E0DC39A8];
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "prominentInsetGroupedHeaderConfiguration");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "title");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "setText:", v8);
  objc_msgSend(v19, "directionalLayoutMargins");
  v10 = v9;
  v12 = v11;
  objc_msgSend(*(id *)(a1 + 32), "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "layoutMargins");
  v15 = v14;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "layoutMargins");
  v18 = v17;

  objc_msgSend(v19, "setDirectionalLayoutMargins:", v10, v15, v12, v18);
  objc_msgSend(v6, "setContentConfiguration:", v19);

}

void __61__CNContactGroupPickerViewController_setupDiffableDataSource__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];

  v5 = a2;
  v6 = *(void **)(a1 + 32);
  v7 = a3;
  objc_msgSend(v6, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v5, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v9, "groupPicker:shouldEnableGroupWithIdentifier:", v10, v11);

  }
  else
  {
    v12 = 1;
  }

  objc_msgSend(MEMORY[0x1E0DC39A8], "cellConfiguration");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "name");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setText:", v14);

  objc_msgSend(v7, "setContentConfiguration:", v13);
  objc_msgSend(v7, "setIndentationWidth:", 0.0);
  objc_msgSend(*(id *)(a1 + 32), "cellAccessoriesForItem:enabled:", v5, v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAccessories:", v15);

  objc_msgSend(v7, "setUserInteractionEnabled:", v12);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __61__CNContactGroupPickerViewController_setupDiffableDataSource__block_invoke_3;
  v16[3] = &unk_1E2049B80;
  v16[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v7, "setConfigurationUpdateHandler:", v16);

}

__CFString *__61__CNContactGroupPickerViewController_setupDiffableDataSource__block_invoke_4(uint64_t a1, void *a2)
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

void __61__CNContactGroupPickerViewController_setupDiffableDataSource__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "accessoryTintColorForStateEnabled:", objc_msgSend(a3, "isDisabled") ^ 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(v5, "accessories", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11++), "setTintColor:", v6);
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

id __57__CNContactGroupPickerViewController_setupCollectionView__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;

  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "bottomSeparatorInsetsForIndexPath:configuration:", v6, v5);
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  objc_msgSend(v5, "setBottomSeparatorInsets:", v9, v11, v13, v15);
  objc_msgSend(v5, "setTopSeparatorVisibility:", 2);

  return v5;
}

+ (id)os_log
{
  if (os_log_cn_once_token_1_9444 != -1)
    dispatch_once(&os_log_cn_once_token_1_9444, &__block_literal_global_9445);
  return (id)os_log_cn_once_object_1_9446;
}

void __44__CNContactGroupPickerViewController_os_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contactsui", "CNContactGroupPickerViewController");
  v1 = (void *)os_log_cn_once_object_1_9446;
  os_log_cn_once_object_1_9446 = (uint64_t)v0;

}

@end
