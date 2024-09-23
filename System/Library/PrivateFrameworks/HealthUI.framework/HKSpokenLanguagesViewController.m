@implementation HKSpokenLanguagesViewController

- (HKSpokenLanguagesViewController)initWithCurrentLanguage:(id)a3 preferredLanguages:(id)a4 andAllSpokenLanguages:(id)a5
{
  id v9;
  id v10;
  id v11;
  HKSpokenLanguagesViewController *v12;
  HKSpokenLanguagesViewController *v13;
  uint64_t v14;
  UISearchController *searchController;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)HKSpokenLanguagesViewController;
  v12 = -[HKSpokenLanguagesViewController initWithStyle:](&v17, sel_initWithStyle_, 1);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_mostLikelyLanguages, a4);
    objc_storeStrong((id *)&v13->_allSpokenLanguages, a5);
    objc_storeStrong((id *)&v13->_currentLanguage, a3);
    v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3C40]), "initWithSearchResultsController:", 0);
    searchController = v13->_searchController;
    v13->_searchController = (UISearchController *)v14;

  }
  return v13;
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HKSpokenLanguagesViewController;
  -[HKSpokenLanguagesViewController viewDidLoad](&v3, sel_viewDidLoad);
  -[HKSpokenLanguagesViewController configureCancelButton](self, "configureCancelButton");
  -[HKSpokenLanguagesViewController configureSearchController](self, "configureSearchController");
  -[HKSpokenLanguagesViewController configureDataSource](self, "configureDataSource");
}

- (void)configureCancelButton
{
  void *v3;
  id v4;

  v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 1, self, sel_cancelAction);
  -[HKSpokenLanguagesViewController navigationItem](self, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setLeftBarButtonItem:", v4);

}

- (void)setConfirmButtonEnabledIfNeeded
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[HKSpokenLanguagesViewController navigationItem](self, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rightBarButtonItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v5 = objc_alloc(MEMORY[0x1E0DC34F0]);
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("confirm"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (id)objc_msgSend(v5, "initWithTitle:style:target:action:", v7, 2, self, sel_doneAction);

    -[HKSpokenLanguagesViewController navigationItem](self, "navigationItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setRightBarButtonItem:animated:", v9, 1);

  }
}

- (void)configureSearchController
{
  void *v3;
  UISearchController *searchController;
  void *v5;
  id v6;

  -[UISearchController setSearchResultsUpdater:](self->_searchController, "setSearchResultsUpdater:", self);
  -[UISearchController setObscuresBackgroundDuringPresentation:](self->_searchController, "setObscuresBackgroundDuringPresentation:", 0);
  -[UISearchController setAutomaticallyShowsCancelButton:](self->_searchController, "setAutomaticallyShowsCancelButton:", 1);
  -[UISearchController searchBar](self->_searchController, "searchBar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sizeToFit");

  -[HKSpokenLanguagesViewController setDefinesPresentationContext:](self, "setDefinesPresentationContext:", 1);
  searchController = self->_searchController;
  -[HKSpokenLanguagesViewController navigationItem](self, "navigationItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSearchController:", searchController);

  -[HKSpokenLanguagesViewController navigationItem](self, "navigationItem");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHidesSearchBarWhenScrolling:", 0);

}

+ (id)defaultCheckmarkImage
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0DC1358], "defaultFontDescriptorWithTextStyle:", *MEMORY[0x1E0DC4A88]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fontDescriptorWithSymbolicTraits:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v3, 0.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithFont:scale:", v4, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", CFSTR("checkmark"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)configureDataSource
{
  HKSpokenLanguageDiffableDataSource *v3;
  void *v4;
  HKSpokenLanguageDiffableDataSource *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];

  v3 = [HKSpokenLanguageDiffableDataSource alloc];
  -[HKSpokenLanguagesViewController tableView](self, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __54__HKSpokenLanguagesViewController_configureDataSource__block_invoke;
  v9[3] = &unk_1E9C43A98;
  v9[4] = self;
  v5 = -[UITableViewDiffableDataSource initWithTableView:cellProvider:](v3, "initWithTableView:cellProvider:", v4, v9);
  -[HKSpokenLanguagesViewController setDataSource:](self, "setDataSource:", v5);

  -[HKSpokenLanguagesViewController dataSource](self, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDefaultRowAnimation:", 0);

  -[HKSpokenLanguagesViewController snapshotForCurrentState](self, "snapshotForCurrentState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKSpokenLanguagesViewController dataSource](self, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "applySnapshot:animatingDifferences:", v7, 0);

}

id __54__HKSpokenLanguagesViewController_configureDataSource__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  objc_class *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;

  v7 = a2;
  v8 = a3;
  v9 = (objc_class *)MEMORY[0x1E0DC3D50];
  v10 = a4;
  v11 = (void *)objc_msgSend([v9 alloc], "initWithStyle:reuseIdentifier:", 3, CFSTR("languageCell"));
  objc_msgSend(v10, "languageInLanguageLocale");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "textLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setText:", v12);

  v14 = objc_alloc(MEMORY[0x1E0DC3890]);
  objc_msgSend((id)objc_opt_class(), "defaultCheckmarkImage");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v14, "initWithImage:", v15);

  objc_msgSend(v16, "sizeToFit");
  objc_msgSend(v16, "image");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "size");
  v19 = v18;
  objc_msgSend(v16, "image");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "size");
  objc_msgSend(v16, "setFrame:", 0.0, 0.0, v19, v21);

  objc_msgSend(v16, "setHidden:", 1);
  objc_msgSend(v11, "setAccessoryView:", v16);
  objc_msgSend(v10, "languageInCurrentLocale");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "detailTextLabel");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setText:", v22);

  objc_msgSend(v11, "setSelectionStyle:", 0);
  objc_msgSend(v10, "identifier");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1040), "identifier");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24 == v25)
  {
    objc_msgSend(v11, "setSelected:", 1);
    objc_msgSend(v11, "accessoryView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setHidden:", 0);

    objc_msgSend(v7, "selectRowAtIndexPath:animated:scrollPosition:", v8, 0, 0);
  }

  return v11;
}

- (id)snapshotForCurrentState
{
  id v3;

  v3 = objc_alloc_init(MEMORY[0x1E0DC3398]);
  objc_msgSend(v3, "appendSectionsWithIdentifiers:", &unk_1E9CE9FF8);
  objc_msgSend(v3, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", self->_mostLikelyLanguages, &unk_1E9CEC9E0);
  objc_msgSend(v3, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", self->_allSpokenLanguages, &unk_1E9CEC9F8);
  return v3;
}

- (id)snapshotForSearchResults:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;

  v3 = (objc_class *)MEMORY[0x1E0DC3398];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v5, "appendSectionsWithIdentifiers:", &unk_1E9CEA010);
  objc_msgSend(v5, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v4, &unk_1E9CECA10);

  return v5;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  HKSpokenLanguage *v9;
  HKSpokenLanguage *currentLanguage;
  void *v11;
  void *v12;
  int v13;
  id WeakRetained;
  id v15;

  v6 = a4;
  objc_msgSend(a3, "cellForRowAtIndexPath:", v6);
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "accessoryView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setHidden:", 0);

  -[HKSpokenLanguagesViewController dataSource](self, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "itemIdentifierForIndexPath:", v6);
  v9 = (HKSpokenLanguage *)objc_claimAutoreleasedReturnValue();

  currentLanguage = self->_currentLanguage;
  self->_currentLanguage = v9;

  if (-[UISearchController isActive](self->_searchController, "isActive"))
    -[HKSpokenLanguagesViewController handleSearchSelection](self, "handleSearchSelection");
  -[HKSpokenLanguagesViewController setConfirmButtonEnabledIfNeeded](self, "setConfirmButtonEnabledIfNeeded");
  objc_msgSend(MEMORY[0x1E0CB6F18], "sharedBehavior");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "features");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "medicalIDV2");

  if (v13)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_pickerDelegate);
    objc_msgSend(WeakRetained, "didSelectCellWithLanguage:", self->_currentLanguage);

  }
}

- (void)handleSearchSelection
{
  void *v3;
  void *v4;
  HKSpokenLanguage *v5;
  void *v6;
  HKSpokenLanguage *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  -[UISearchController searchBar](self->_searchController, "searchBar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setText:", 0);

  -[UISearchController dismissViewControllerAnimated:completion:](self->_searchController, "dismissViewControllerAnimated:completion:", 1, 0);
  -[HKSpokenLanguagesViewController snapshotForCurrentState](self, "snapshotForCurrentState");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  -[HKSpokenLanguagesViewController dataSource](self, "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "applySnapshot:animatingDifferences:", v12, 1);

  v5 = [HKSpokenLanguage alloc];
  -[HKSpokenLanguage identifier](self->_currentLanguage, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HKSpokenLanguage initWithLanguageIdentifier:forCategory:](v5, "initWithLanguageIdentifier:forCategory:", v6, 1);

  -[HKSpokenLanguagesViewController dataSource](self, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "indexPathForItemIdentifier:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    -[HKSpokenLanguage setLanguageCategoryType:](v7, "setLanguageCategoryType:", 2);
    -[HKSpokenLanguagesViewController dataSource](self, "dataSource");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "indexPathForItemIdentifier:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[HKSpokenLanguagesViewController tableView](self, "tableView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "selectRowAtIndexPath:animated:scrollPosition:", v9, 1, 2);

}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a4;
  v7 = a3;
  -[HKSpokenLanguagesViewController tableView](self, "tableView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "indexPathForSelectedRow");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "cellForRowAtIndexPath:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "accessoryView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setHidden:", 1);

  return v6;
}

- (void)tableView:(id)a3 willDisplayHeaderView:(id)a4 forSection:(int64_t)a5
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  id v21;

  v5 = (void *)MEMORY[0x1E0DC3658];
  v6 = a4;
  objc_msgSend(v5, "labelColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "textLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTextColor:", v7);

  v9 = (void *)MEMORY[0x1E0DC1350];
  objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *MEMORY[0x1E0DC4A88], 32770, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "fontWithDescriptor:size:", v10, 0.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "textLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFont:", v11);

  objc_msgSend(v6, "frame");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  objc_msgSend(v6, "textLabel");
  v21 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "setFrame:", v14, v16, v18, v20);
}

- (void)doneAction
{
  void *v3;

  -[HKSpokenLanguagesViewController pickerDelegate](self, "pickerDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "didSelectCellWithLanguage:", self->_currentLanguage);

  -[HKSpokenLanguagesViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)cancelAction
{
  void *v3;

  -[HKSpokenLanguagesViewController pickerDelegate](self, "pickerDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "didCancelLanguageSelection");

  -[HKSpokenLanguagesViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)updateSearchResultsForSearchController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id obj;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _QWORD v33[2];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "searchBar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");

  if (v7)
  {
    v27 = (void *)-[NSArray mutableCopy](self->_allSpokenLanguages, "mutableCopy");
    objc_msgSend(v4, "searchBar");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "text");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringByTrimmingCharactersInSet:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "componentsSeparatedByString:", CFSTR(" "));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    obj = v12;
    v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v30 != v16)
            objc_enumerationMutation(obj);
          v18 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i);
          objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K contains[cd] %@"), CFSTR("languageInCurrentLocale"), v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K contains[cd] %@"), CFSTR("languageInLanguageLocale"), v18);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v33[0] = v19;
          v33[1] = v20;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 2);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "addObjectsFromArray:", v21);

        }
        v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
      }
      while (v15);
    }

    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3528]), "initWithType:subpredicates:", 2, v13);
    objc_msgSend(v27, "filterUsingPredicate:", v22);
    -[HKSpokenLanguagesViewController snapshotForSearchResults:](self, "snapshotForSearchResults:", v27);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKSpokenLanguagesViewController dataSource](self, "dataSource");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "applySnapshot:animatingDifferences:", v23, 1);

  }
  else
  {
    -[HKSpokenLanguagesViewController snapshotForCurrentState](self, "snapshotForCurrentState");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKSpokenLanguagesViewController dataSource](self, "dataSource");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "applySnapshot:animatingDifferences:", v25, 1);

  }
}

- (HKSpokenLanguagesViewControllerDelegate)pickerDelegate
{
  return (HKSpokenLanguagesViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_pickerDelegate);
}

- (void)setPickerDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_pickerDelegate, a3);
}

- (NSArray)mostLikelyLanguages
{
  return self->_mostLikelyLanguages;
}

- (void)setMostLikelyLanguages:(id)a3
{
  objc_storeStrong((id *)&self->_mostLikelyLanguages, a3);
}

- (NSArray)allSpokenLanguages
{
  return self->_allSpokenLanguages;
}

- (void)setAllSpokenLanguages:(id)a3
{
  objc_storeStrong((id *)&self->_allSpokenLanguages, a3);
}

- (HKSpokenLanguage)currentLanguage
{
  return self->_currentLanguage;
}

- (void)setCurrentLanguage:(id)a3
{
  objc_storeStrong((id *)&self->_currentLanguage, a3);
}

- (HKSpokenLanguageDiffableDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_dataSource, a3);
}

- (UISearchController)searchController
{
  return self->_searchController;
}

- (void)setSearchController:(id)a3
{
  objc_storeStrong((id *)&self->_searchController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchController, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_currentLanguage, 0);
  objc_storeStrong((id *)&self->_allSpokenLanguages, 0);
  objc_storeStrong((id *)&self->_mostLikelyLanguages, 0);
  objc_destroyWeak((id *)&self->_pickerDelegate);
}

@end
