@implementation CNContactContainerPickerViewController

- (CNContactContainerPickerViewController)initWithContactViewCache:(id)a3 selectedContainerIdentifiers:(id)a4
{
  void *v4;
  void *v5;
  id v9;
  id v10;
  CNContactContainerPickerViewController *v11;
  CNContactContainerPickerViewController *v12;
  uint64_t v13;
  void *v14;
  CNContactContainerPickerViewController *v15;
  objc_super v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v17.receiver = self;
  v17.super_class = (Class)CNContactContainerPickerViewController;
  v11 = -[CNContactContainerPickerViewController initWithNibName:bundle:](&v17, sel_initWithNibName_bundle_, 0, 0);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_contactViewCache, a3);
    v13 = objc_msgSend(v10, "count");
    v14 = v10;
    if (!v13)
    {
      objc_msgSend(v9, "contactStore");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "defaultContainerIdentifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = v5;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_storeStrong((id *)&v12->_selectedContainerIdentifiers, v14);
    if (!v13)
    {

    }
    objc_storeStrong((id *)&v12->_contactViewCache, a3);
    -[CNContactContainerPickerViewController discoverContainers](v12, "discoverContainers");
    v15 = v12;
  }

  return v12;
}

- (void)discoverContainers
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  unint64_t v16;
  NSObject *v17;
  _BOOL4 v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t i;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  NSObject *v28;
  CNContactContainerPickerViewController *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  CNContactContainerPickerItem *v36;
  void *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  id obj;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  uint8_t buf[4];
  uint64_t v63;
  __int16 v64;
  void *v65;
  _BYTE v66[128];
  _BYTE v67[128];
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "os_log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_18AC56000, v3, OS_LOG_TYPE_DEBUG, "Fetching containers", buf, 2u);
  }

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContainerPickerViewController allAccounts](self, "allAccounts");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x1E0D137F8];
  if ((*(unsigned int (**)(_QWORD, void *))(*MEMORY[0x1E0D137F8] + 16))(*MEMORY[0x1E0D137F8], v6))
  {
    objc_msgSend((id)objc_opt_class(), "os_log");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_18AC56000, v8, OS_LOG_TYPE_ERROR, "Accounts fetch returned 0 items", buf, 2u);
    }
  }
  else
  {
    v60 = 0u;
    v61 = 0u;
    v58 = 0u;
    v59 = 0u;
    v46 = v6;
    v9 = v6;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v58, v67, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v59;
      v48 = v7;
      v49 = v9;
      v47 = *(_QWORD *)v59;
      do
      {
        v13 = 0;
        v50 = v11;
        do
        {
          if (*(_QWORD *)v59 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * v13);
          -[CNContactContainerPickerViewController writableContainersForAccount:](self, "writableContainersForAccount:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (((*(uint64_t (**)(uint64_t, void *))(v7 + 16))(v7, v15) & 1) == 0)
          {
            v51 = v13;
            v52 = v15;
            v16 = objc_msgSend(v15, "count");
            objc_msgSend((id)objc_opt_class(), "os_log");
            v17 = objc_claimAutoreleasedReturnValue();
            v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG);
            if (v16 < 2)
            {
              if (v18)
              {
                objc_msgSend(v14, "identifier");
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412290;
                v63 = (uint64_t)v40;
                _os_log_debug_impl(&dword_18AC56000, v17, OS_LOG_TYPE_DEBUG, "Account %@ has only 1 container", buf, 0xCu);

              }
              v15 = v52;
              objc_msgSend(v52, "firstObject");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "_cnui_displayName");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              v36 = objc_alloc_init(CNContactContainerPickerItem);
              -[CNContactContainerPickerItem setName:](v36, "setName:", v35);
              objc_msgSend(v34, "identifier");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              -[CNContactContainerPickerItem setIdentifier:](v36, "setIdentifier:", v37);

              objc_msgSend(v5, "addObject:", v36);
              obj = v34;
              objc_msgSend(v4, "addObject:", v34);
              objc_msgSend((id)objc_opt_class(), "os_log");
              v38 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
              {
                objc_msgSend(v34, "identifier");
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412546;
                v63 = (uint64_t)v41;
                v64 = 2112;
                v65 = v35;
                _os_log_debug_impl(&dword_18AC56000, v38, OS_LOG_TYPE_DEBUG, "Added container %@ wih display name %@", buf, 0x16u);

                v15 = v52;
              }

              v9 = v49;
              v11 = v50;
            }
            else
            {
              if (v18)
              {
                objc_msgSend(v14, "identifier");
                v39 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412290;
                v63 = (uint64_t)v39;
                _os_log_debug_impl(&dword_18AC56000, v17, OS_LOG_TYPE_DEBUG, "Account %@ has more than 1 container", buf, 0xCu);

              }
              v56 = 0u;
              v57 = 0u;
              v54 = 0u;
              v55 = 0u;
              v15 = v52;
              obj = v52;
              v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v66, 16);
              if (v19)
              {
                v20 = v19;
                v21 = *(_QWORD *)v55;
                v22 = (char *)&unk_1EDF88000;
                do
                {
                  for (i = 0; i != v20; ++i)
                  {
                    if (*(_QWORD *)v55 != v21)
                      objc_enumerationMutation(obj);
                    v24 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * i);
                    v25 = objc_alloc_init((Class)(v22 + 2416));
                    objc_msgSend(v24, "name");
                    v26 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v25, "setName:", v26);

                    objc_msgSend(v24, "identifier");
                    v27 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v25, "setIdentifier:", v27);

                    objc_msgSend(v5, "addObject:", v25);
                    objc_msgSend(v4, "addObject:", v24);
                    objc_msgSend((id)objc_opt_class(), "os_log");
                    v28 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
                    {
                      objc_msgSend(v24, "identifier");
                      v29 = self;
                      v30 = v5;
                      v31 = v4;
                      v32 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v24, "name");
                      v33 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 138412546;
                      v63 = (uint64_t)v32;
                      v64 = 2112;
                      v65 = v33;
                      _os_log_debug_impl(&dword_18AC56000, v28, OS_LOG_TYPE_DEBUG, "Added container %@ wih display name %@", buf, 0x16u);

                      v4 = v31;
                      v5 = v30;
                      self = v29;
                      v22 = (_BYTE *)&unk_1EDF88000;
                    }

                  }
                  v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v66, 16);
                }
                while (v20);
                v7 = v48;
                v9 = v49;
                v12 = v47;
                v11 = v50;
                v15 = v52;
              }
            }

            v13 = v51;
          }

          ++v13;
        }
        while (v13 != v11);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v58, v67, 16);
      }
      while (v11);
    }

    v42 = (void *)objc_msgSend(v4, "copy");
    -[CNContactContainerPickerViewController setContainers:](self, "setContainers:", v42);

    v43 = (void *)objc_msgSend(v5, "copy");
    -[CNContactContainerPickerViewController setItems:](self, "setItems:", v43);

    objc_msgSend((id)objc_opt_class(), "os_log");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      -[CNContactContainerPickerViewController containers](self, "containers");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = objc_msgSend(v44, "count");
      *(_DWORD *)buf = 134217984;
      v63 = v45;
      _os_log_debug_impl(&dword_18AC56000, v8, OS_LOG_TYPE_DEBUG, "Finished fetching %lu containers", buf, 0xCu);

    }
    v6 = v46;
  }

}

- (id)allAccounts
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v8;
  id v9;
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  -[CNContactContainerPickerViewController contactViewCache](self, "contactViewCache");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contactStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  objc_msgSend(v3, "accountsMatchingPredicate:error:", 0, &v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v9;

  if (v5)
  {
    objc_msgSend((id)objc_opt_class(), "os_log");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v5, "localizedDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v11 = v8;
      _os_log_error_impl(&dword_18AC56000, v6, OS_LOG_TYPE_ERROR, "Error fetching accounts: %@", buf, 0xCu);

    }
  }

  return v4;
}

- (id)writableContainersForAccount:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v15;
  void *v16;
  _QWORD v17[5];
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C972C0];
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "predicateForContainersInAccountWithIdentifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNContactContainerPickerViewController contactViewCache](self, "contactViewCache");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "contactStore");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  objc_msgSend(v9, "containersMatchingPredicate:error:", v7, &v18);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v18;

  if (v11)
  {
    objc_msgSend((id)objc_opt_class(), "os_log");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v4, "identifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "localizedDescription");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v20 = v15;
      v21 = 2112;
      v22 = v16;
      _os_log_error_impl(&dword_18AC56000, v12, OS_LOG_TYPE_ERROR, "Error fetching containers in account %@: %@", buf, 0x16u);

    }
    v13 = 0;
  }
  else
  {
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __71__CNContactContainerPickerViewController_writableContainersForAccount___block_invoke;
    v17[3] = &unk_1E2050200;
    v17[4] = self;
    objc_msgSend(v10, "_cn_filter:", v17);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CNContactContainerPickerViewController;
  -[CNContactContainerPickerViewController viewDidLoad](&v8, sel_viewDidLoad);
  -[CNContactContainerPickerViewController setupDoneButton](self, "setupDoneButton");
  -[CNContactContainerPickerViewController setupCollectionView](self, "setupCollectionView");
  -[CNContactContainerPickerViewController setupDiffableDataSource](self, "setupDiffableDataSource");
  -[CNContactContainerPickerViewController dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContainerPickerViewController collectionView](self, "collectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDataSource:", v3);

  -[CNContactContainerPickerViewController collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDelegate:", self);

  -[CNContactContainerPickerViewController dataSource](self, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContainerPickerViewController currentSnapshot](self, "currentSnapshot");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySnapshot:animatingDifferences:", v7, 0);

  -[CNContactContainerPickerViewController reloadData](self, "reloadData");
}

- (void)setupDoneButton
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[5];

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:menu:", 0, 0);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __57__CNContactContainerPickerViewController_setupDoneButton__block_invoke;
  v6[3] = &unk_1E2050228;
  v6[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3428], "actionWithHandler:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPrimaryAction:", v4);

  -[CNContactContainerPickerViewController navigationItem](self, "navigationItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRightBarButtonItem:", v3);

}

- (void)setupCollectionView
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC35A8]), "initWithAppearance:", 2);
  objc_msgSend(v11, "setShowsSeparators:", 1);
  objc_msgSend(MEMORY[0x1E0DC35D0], "layoutWithListConfiguration:", v11);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x1E0DC35B8]);
  -[CNContactContainerPickerViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v6 = (void *)objc_msgSend(v4, "initWithFrame:collectionViewLayout:", v3);
  -[CNContactContainerPickerViewController setCollectionView:](self, "setCollectionView:", v6);

  -[CNContactContainerPickerViewController collectionView](self, "collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAllowsMultipleSelection:", 1);

  -[CNContactContainerPickerViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContainerPickerViewController collectionView](self, "collectionView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addSubview:", v9);

  -[CNContactContainerPickerViewController collectionView](self, "collectionView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAutoresizingMask:", 18);

}

- (void)setupDiffableDataSource
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v7[5];

  v3 = (void *)MEMORY[0x1E0DC35C8];
  v4 = objc_opt_class();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __65__CNContactContainerPickerViewController_setupDiffableDataSource__block_invoke;
  v7[3] = &unk_1E2050250;
  v7[4] = self;
  objc_msgSend(v3, "registrationWithCellClass:configurationHandler:", v4, v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContainerPickerViewController dataSourceWithCellRegistration:](self, "dataSourceWithCellRegistration:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContainerPickerViewController setDataSource:](self, "setDataSource:", v6);

}

- (id)dataSourceWithCellRegistration:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  v5 = objc_alloc(MEMORY[0x1E0DC35E8]);
  -[CNContactContainerPickerViewController collectionView](self, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __73__CNContactContainerPickerViewController_dataSourceWithCellRegistration___block_invoke;
  v10[3] = &unk_1E2050278;
  v11 = v4;
  v7 = v4;
  v8 = (void *)objc_msgSend(v5, "initWithCollectionView:cellProvider:", v6, v10);

  return v8;
}

- (id)currentSnapshot
{
  id v3;
  void *v4;

  v3 = objc_alloc_init(MEMORY[0x1E0DC3398]);
  objc_msgSend(v3, "appendSectionsWithIdentifiers:", &unk_1E20D39B8);
  -[CNContactContainerPickerViewController items](self, "items");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v4, CFSTR("SECTION"));

  return v3;
}

- (void)reloadData
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  -[CNContactContainerPickerViewController collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reloadData");

  -[CNContactContainerPickerViewController items](self, "items");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __52__CNContactContainerPickerViewController_reloadData__block_invoke;
  v5[3] = &unk_1E20502A0;
  v5[4] = self;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v5);

}

- (void)setSelectedContainerIdentifiers:(id)a3
{
  NSArray *v5;
  NSArray *v6;

  v5 = (NSArray *)a3;
  if (self->_selectedContainerIdentifiers != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_selectedContainerIdentifiers, a3);
    -[CNContactContainerPickerViewController reloadData](self, "reloadData");
    v5 = v6;
  }

}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a4;
  -[CNContactContainerPickerViewController items](self, "items");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "item");

  objc_msgSend(v6, "objectAtIndexedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNContactContainerPickerViewController selectedContainerIdentifiers](self, "selectedContainerIdentifiers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v7) = objc_msgSend(v9, "containsObject:", v10) ^ 1;

  return v7;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  -[CNContactContainerPickerViewController items](self, "items");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "item");

  objc_msgSend(v6, "objectAtIndexedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNContactContainerPickerViewController selectedContainerIdentifiers](self, "selectedContainerIdentifiers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "arrayByAddingObject:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactContainerPickerViewController setSelectedContainerIdentifiers:](self, "setSelectedContainerIdentifiers:", v11);

  objc_msgSend((id)objc_opt_class(), "os_log");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v8, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138412290;
    v15 = v13;
    _os_log_debug_impl(&dword_18AC56000, v12, OS_LOG_TYPE_DEBUG, "User selected container %@", (uint8_t *)&v14, 0xCu);

  }
}

- (BOOL)collectionView:(id)a3 shouldDeselectItemAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  BOOL v13;

  v5 = a4;
  -[CNContactContainerPickerViewController items](self, "items");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "item");

  objc_msgSend(v6, "objectAtIndexedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNContactContainerPickerViewController delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "containerPicker:shouldAllowDeselectionOfContainerWithIdentifier:", self, v10);

  if (v11)
  {
    -[CNContactContainerPickerViewController selectedContainerIdentifiers](self, "selectedContainerIdentifiers");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (unint64_t)objc_msgSend(v12, "count") > 1;

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  -[CNContactContainerPickerViewController items](self, "items");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "item");

  objc_msgSend(v6, "objectAtIndexedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNContactContainerPickerViewController selectedContainerIdentifiers](self, "selectedContainerIdentifiers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "mutableCopy");

  objc_msgSend(v8, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeObject:", v11);

  v12 = (void *)objc_msgSend(v10, "copy");
  -[CNContactContainerPickerViewController setSelectedContainerIdentifiers:](self, "setSelectedContainerIdentifiers:", v12);

  objc_msgSend((id)objc_opt_class(), "os_log");
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v8, "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138412290;
    v16 = v14;
    _os_log_debug_impl(&dword_18AC56000, v13, OS_LOG_TYPE_DEBUG, "User de-selected container %@", (uint8_t *)&v15, 0xCu);

  }
}

- (CNContactContainerPickerViewControllerDelegate)delegate
{
  return (CNContactContainerPickerViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSArray)selectedContainerIdentifiers
{
  return self->_selectedContainerIdentifiers;
}

- (CNContactViewCache)contactViewCache
{
  return self->_contactViewCache;
}

- (void)setContactViewCache:(id)a3
{
  objc_storeStrong((id *)&self->_contactViewCache, a3);
}

- (CNAccountsAndGroupsDataSource)accountsDataSource
{
  return self->_accountsDataSource;
}

- (void)setAccountsDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_accountsDataSource, a3);
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
  objc_storeStrong((id *)&self->_collectionView, a3);
}

- (UICollectionViewDiffableDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_dataSource, a3);
}

- (NSArray)items
{
  return self->_items;
}

- (void)setItems:(id)a3
{
  objc_storeStrong((id *)&self->_items, a3);
}

- (NSArray)containers
{
  return self->_containers;
}

- (void)setContainers:(id)a3
{
  objc_storeStrong((id *)&self->_containers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containers, 0);
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_accountsDataSource, 0);
  objc_storeStrong((id *)&self->_contactViewCache, 0);
  objc_storeStrong((id *)&self->_selectedContainerIdentifiers, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __52__CNContactContainerPickerViewController_reloadData__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "selectedContainerIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v6) = objc_msgSend(v7, "containsObject:", v8);
  if ((_DWORD)v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "collectionView");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", a3, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "selectItemAtIndexPath:animated:scrollPosition:", v9, 0, 0);

  }
}

uint64_t __73__CNContactContainerPickerViewController_dataSourceWithCellRegistration___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(a2, "dequeueConfiguredReusableCellWithRegistration:forIndexPath:item:", *(_QWORD *)(a1 + 32), a3, a4);
}

void __65__CNContactContainerPickerViewController_setupDiffableDataSource__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v6 = a2;
  v7 = a4;
  objc_opt_class();
  v20 = v6;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v20;
  else
    v8 = 0;
  v9 = v8;

  v10 = (void *)MEMORY[0x1E0DC39A8];
  v11 = v7;
  objc_msgSend(v10, "cellConfiguration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = *(_QWORD *)(a1 + 32);
  objc_msgSend(v11, "identifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v13, "containerPicker:shouldAllowDeselectionOfContainerWithIdentifier:", v14, v15);

  objc_msgSend(v11, "name");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setText:", v17);
  objc_msgSend(v9, "setAllowsDeselection:", v16);
  objc_msgSend(v9, "setContentConfiguration:", v12);
  objc_msgSend(MEMORY[0x1E0DC34D8], "listGroupedCellConfiguration");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setBackgroundColor:", v19);

  objc_msgSend(v9, "setBackgroundConfiguration:", v18);
}

uint64_t __57__CNContactContainerPickerViewController_setupDoneButton__block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[5];

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "containers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __57__CNContactContainerPickerViewController_setupDoneButton__block_invoke_2;
    v8[3] = &unk_1E2050200;
    v8[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v4, "_cn_filter:", v8);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "containerPicker:didFinishWithPickedContainers:", *(_QWORD *)(a1 + 32), v5);

  }
  return objc_msgSend(*(id *)(a1 + 32), "dismissViewControllerAnimated:completion:", 1, 0);
}

uint64_t __57__CNContactContainerPickerViewController_setupDoneButton__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "selectedContainerIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v4, "containsObject:", v5);
  return v6;
}

uint64_t __71__CNContactContainerPickerViewController_writableContainersForAccount___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v3 = a2;
  if (objc_msgSend(v3, "isEnabled"))
  {
    objc_msgSend(*(id *)(a1 + 32), "contactViewCache");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "policyForContainer:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = objc_msgSend(v5, "shouldAddContact:", 0);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)os_log
{
  if (os_log_cn_once_token_1_61901 != -1)
    dispatch_once(&os_log_cn_once_token_1_61901, &__block_literal_global_61902);
  return (id)os_log_cn_once_object_1_61903;
}

void __48__CNContactContainerPickerViewController_os_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contactsui", "container-picker");
  v1 = (void *)os_log_cn_once_object_1_61903;
  os_log_cn_once_object_1_61903 = (uint64_t)v0;

}

@end
