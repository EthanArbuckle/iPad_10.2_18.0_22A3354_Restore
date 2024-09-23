@implementation CNLimitedAccessSelectedContactsViewController

- (id)initForAppName:(id)a3 bundleID:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  v8 = -[CNLimitedAccessContactPickerViewController initSettingsPickerForAppName:bundleId:]([CNLimitedAccessContactPickerViewController alloc], "initSettingsPickerForAppName:bundleId:", v7, v6);

  return v8;
}

- (id)initForAppName:(id)a3 selectedContacts:(id)a4
{
  return -[CNLimitedAccessSelectedContactsViewController initForAppName:bundleID:selectedContacts:mode:matchingText:caption:](self, "initForAppName:bundleID:selectedContacts:mode:matchingText:caption:", a3, &stru_1E20507A8, a4, 0, 0, 3);
}

- (CNLimitedAccessSelectedContactsViewController)initWithBundleId:(id)a3 matchingText:(id)a4 caption:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  CNLimitedAccessSelectedContactsViewController *v11;

  v8 = a4;
  v9 = a3;
  -[CNLimitedAccessSelectedContactsViewController limitedAccessContactIdentifiersInDatabase](self, "limitedAccessContactIdentifiersInDatabase");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[CNLimitedAccessSelectedContactsViewController initForAppName:bundleID:selectedContacts:mode:matchingText:caption:](self, "initForAppName:bundleID:selectedContacts:mode:matchingText:caption:", v9, v9, v10, 1, v8, a5);

  return v11;
}

- (id)initForAppName:(id)a3 bundleID:(id)a4 selectedContacts:(id)a5 mode:(unint64_t)a6 matchingText:(id)a7 caption:(unint64_t)a8
{
  id v15;
  id v16;
  id v17;
  CNLimitedAccessSelectedContactsViewController *v18;
  uint64_t v19;
  CNContactStore *contactStore;
  uint64_t v21;
  NSSet *selectedContactIdentifiers;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  CNContactStore *v36;
  CNLimitedAccessSelectedContactsViewController *v37;
  id v38;
  CNCustomIndexedContactsStore *v39;
  CNCustomIndexedContactsStore *v40;
  CNCustomIndexedContactsStore *customIndexedContactsStore;
  CNLimitedAccessSelectedContactsViewController *v42;
  CNLimitedAccessSelectedContactsViewController *v43;
  CNCustomIndexedContactsStore *v44;
  CNLimitedAccessSelectedContactsViewController *v45;
  id v47;
  id v48;
  void *v49;
  id v50;
  _QWORD v51[4];
  CNLimitedAccessSelectedContactsViewController *v52;
  id v53;
  id v54;
  id v55;
  objc_super v56;
  _QWORD v57[4];
  _QWORD v58[3];

  v58[1] = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v50 = a7;
  v56.receiver = self;
  v56.super_class = (Class)CNLimitedAccessSelectedContactsViewController;
  v18 = -[CNLimitedAccessSelectedContactsViewController initWithNibName:bundle:](&v56, sel_initWithNibName_bundle_, 0, 0);
  if (v18)
  {
    +[CNUIContactsEnvironment currentEnvironment](CNUIContactsEnvironment, "currentEnvironment");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "contactStore");
    v19 = objc_claimAutoreleasedReturnValue();
    contactStore = v18->_contactStore;
    v18->_contactStore = (CNContactStore *)v19;

    objc_storeStrong((id *)&v18->_appName, a3);
    objc_storeStrong((id *)&v18->_appBundleID, a4);
    v18->_mode = a6;
    objc_storeStrong((id *)&v18->_initialSearchText, a7);
    v18->_caption = a8;
    if (v17)
    {
      v18->_isReadOnly = 1;
    }
    else
    {
      v18->_isReadOnly = 0;
      -[CNLimitedAccessSelectedContactsViewController limitedAccessContactIdentifiersInDatabase](v18, "limitedAccessContactIdentifiersInDatabase");
      v17 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v17);
    v21 = objc_claimAutoreleasedReturnValue();
    selectedContactIdentifiers = v18->_selectedContactIdentifiers;
    v18->_selectedContactIdentifiers = (NSSet *)v21;

    if (a6)
    {
      v18->_isReadOnly = 1;
      v47 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      -[CNContactStore mainContactStore](v18->_contactStore, "mainContactStore");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (void *)MEMORY[0x1E0C972C0];
      -[CNContactStore mainContactStore](v18->_contactStore, "mainContactStore");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "defaultContainerIdentifier");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v58[0] = v26;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v58, 1);
      v48 = v15;
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "predicateForContainersWithIdentifiers:", v27);
      v28 = v16;
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = 0;
      v30 = (id)objc_msgSend(v23, "containersMatchingPredicate:error:", v29, &v55);
      v31 = v55;

      v16 = v28;
      v32 = *MEMORY[0x1E0C967C0];
      v57[0] = *MEMORY[0x1E0C966A8];
      v57[1] = v32;
      v33 = *MEMORY[0x1E0C966D0];
      v57[2] = *MEMORY[0x1E0C966C0];
      v57[3] = v33;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v57, 4);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97210]), "initWithKeysToFetch:", v34);
      v36 = v18->_contactStore;
      v54 = v31;
      v51[0] = MEMORY[0x1E0C809B0];
      v51[1] = 3221225472;
      v51[2] = __116__CNLimitedAccessSelectedContactsViewController_initForAppName_bundleID_selectedContacts_mode_matchingText_caption___block_invoke;
      v51[3] = &unk_1E2048BD8;
      v37 = v18;
      v52 = v37;
      v53 = v47;
      v38 = v47;
      -[CNContactStore enumerateContactsWithFetchRequest:error:usingBlock:](v36, "enumerateContactsWithFetchRequest:error:usingBlock:", v35, &v54, v51);
      v39 = (CNCustomIndexedContactsStore *)v54;

      v40 = -[CNCustomIndexedContactsStore initWithContactIdentifiers:]([CNCustomIndexedContactsStore alloc], "initWithContactIdentifiers:", v38);
      customIndexedContactsStore = v37->_customIndexedContactsStore;
      v37->_customIndexedContactsStore = v40;

      v42 = v37;
      v43 = v37;
      v15 = v48;
      -[CNLimitedAccessSelectedContactsViewController didMoveToParentViewController:](v42, "didMoveToParentViewController:", v43);

    }
    else
    {
      v44 = -[CNCustomIndexedContactsStore initWithContactIdentifiers:]([CNCustomIndexedContactsStore alloc], "initWithContactIdentifiers:", v17);
      v39 = v18->_customIndexedContactsStore;
      v18->_customIndexedContactsStore = v44;
    }

    v45 = v18;
  }

  return v18;
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CNLimitedAccessSelectedContactsViewController;
  -[CNLimitedAccessSelectedContactsViewController viewWillAppear:](&v4, sel_viewWillAppear_, 1);
  -[CNLimitedAccessSelectedContactsViewController updateLimitedAccessContacts](self, "updateLimitedAccessContacts");
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CNLimitedAccessSelectedContactsViewController;
  -[CNLimitedAccessSelectedContactsViewController viewDidLoad](&v3, sel_viewDidLoad);
  -[CNLimitedAccessSelectedContactsViewController setupUI](self, "setupUI");
}

- (BOOL)isSearchActive
{
  void *v2;
  char v3;

  -[CNLimitedAccessSelectedContactsViewController searchController](self, "searchController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isActive");

  return v3;
}

- (void)setupUI
{
  -[CNLimitedAccessSelectedContactsViewController setupSearchController](self, "setupSearchController");
  -[CNLimitedAccessSelectedContactsViewController setupSearchBar](self, "setupSearchBar");
  -[CNLimitedAccessSelectedContactsViewController setupNavigationBar](self, "setupNavigationBar");
  -[CNLimitedAccessSelectedContactsViewController setupTableView](self, "setupTableView");
  -[CNLimitedAccessSelectedContactsViewController setupLayoutGuides](self, "setupLayoutGuides");
  if (self->_mode == 1)
    -[CNLimitedAccessSelectedContactsViewController setupInitialSearchResults](self, "setupInitialSearchResults");
}

- (void)setupSearchController
{
  UISearchController *v3;
  UISearchController *searchController;

  v3 = (UISearchController *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3C40]), "initWithSearchResultsController:", 0);
  searchController = self->_searchController;
  self->_searchController = v3;

  -[UISearchController setObscuresBackgroundDuringPresentation:](self->_searchController, "setObscuresBackgroundDuringPresentation:", 0);
  -[UISearchController setHidesNavigationBarDuringPresentation:](self->_searchController, "setHidesNavigationBarDuringPresentation:", 1);
  -[UISearchController setDelegate:](self->_searchController, "setDelegate:", self);
  -[UISearchController setDefinesPresentationContext:](self->_searchController, "setDefinesPresentationContext:", 1);
  -[UISearchController setSearchResultsUpdater:](self->_searchController, "setSearchResultsUpdater:", self);
}

- (void)setupSearchBar
{
  UISearchBar *v3;
  void *v4;
  void *v5;
  UISearchBar *searchBar;

  -[UISearchController searchBar](self->_searchController, "searchBar");
  v3 = (UISearchBar *)objc_claimAutoreleasedReturnValue();
  CNContactsUIBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("SEARCH_LOCAL_PLACEHOLDER"), &stru_1E20507A8, CFSTR("Localized"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UISearchBar setPlaceholder:](v3, "setPlaceholder:", v5);

  -[UISearchBar setAutoresizingMask:](v3, "setAutoresizingMask:", 2);
  -[UISearchBar setAutocorrectionType:](v3, "setAutocorrectionType:", 1);
  -[UISearchBar sizeToFit](v3, "sizeToFit");
  searchBar = self->_searchBar;
  self->_searchBar = v3;

}

- (void)setupNavigationBar
{
  id v3;
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
  _BOOL4 isReadOnly;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0DC3A28]);
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v4 = objc_alloc_init(MEMORY[0x1E0DC3A48]);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v5);

  objc_msgSend(v4, "setSearchController:", self->_searchController);
  objc_msgSend(v4, "setHidesSearchBarWhenScrolling:", 0);
  if (self->_mode)
  {
    CNContactsUIBundle();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("LIMITED_CONTACTS_APPAFFORDANCE_PICKER_PROMPT"), &stru_1E20507A8, CFSTR("Localized"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setPrompt:", v7);
  }
  else
  {
    v8 = (void *)MEMORY[0x1E0CB3940];
    CNContactsUIBundle();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("LIMITED_CONTACTS_SELECTED_TITLE-%@"), &stru_1E20507A8, CFSTR("Localized"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNLimitedAccessSelectedContactsViewController appName](self, "appName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTitle:", v12);

    v13 = (void *)MEMORY[0x1E0CB3940];
    CNContactsUIBundle();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("LIMITED_CONTACTS_SELECTED_PROMPT"), &stru_1E20507A8, CFSTR("Localized"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNLimitedAccessSelectedContactsViewController selectedContactIdentifiers](self, "selectedContactIdentifiers");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localizedStringWithFormat:", v7, objc_msgSend(v14, "count"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setPrompt:", v15);

  }
  objc_msgSend(v4, "setPreferredSearchBarPlacement:", 2);
  isReadOnly = self->_isReadOnly;
  v17 = objc_alloc(MEMORY[0x1E0DC34F0]);
  CNContactsUIBundle();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("DONE"), &stru_1E20507A8, CFSTR("Localized"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v17, "initWithTitle:style:target:action:", v19, 2, self, sel_onTapDoneButton_);
  if (!isReadOnly)
  {
    objc_msgSend(v4, "setLeftBarButtonItem:", v20);

    v21 = objc_alloc(MEMORY[0x1E0DC34F0]);
    CNContactsUIBundle();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("EDIT"), &stru_1E20507A8, CFSTR("Localized"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v21, "initWithTitle:style:target:action:", v19, 2, self, sel_onTapEditButton_);
  }
  objc_msgSend(v4, "setRightBarButtonItem:", v20);

  v24[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setItems:", v22);

  -[CNLimitedAccessSelectedContactsViewController view](self, "view");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "addSubview:", v3);

  -[CNLimitedAccessSelectedContactsViewController setNavigationItem:](self, "setNavigationItem:", v4);
  -[CNLimitedAccessSelectedContactsViewController setNavigationBar:](self, "setNavigationBar:", v3);

}

- (void)setupTableView
{
  id v3;
  uint64_t v4;
  __objc2_class *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = objc_alloc(MEMORY[0x1E0DC3D48]);
  v10 = (id)objc_msgSend(v3, "initWithFrame:style:", 1, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  objc_msgSend(v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  if (self->_mode == 1)
  {
    v4 = objc_opt_class();
    v5 = CNLimitedAccessAppAffordanceContactsCell;
  }
  else
  {
    v4 = objc_opt_class();
    v5 = CNLimitedAccessSelectedContactsCell;
  }
  -[__objc2_class reuseIdentifier](v5, "reuseIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "registerClass:forCellReuseIdentifier:", v4, v6);

  objc_msgSend(v10, "setDataSource:", self);
  objc_msgSend(v10, "setDelegate:", self);
  objc_msgSend(v10, "setScrollEnabled:", 1);
  objc_msgSend(v10, "setAllowsSelection:", self->_mode == 1);
  objc_msgSend(v10, "setAllowsMultipleSelection:", 0);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setBackgroundColor:", v7);

  objc_msgSend(v10, "setKeyboardDismissMode:", 2);
  objc_msgSend(v10, "setSeparatorStyle:", 1);
  -[CNLimitedAccessSelectedContactsViewController setTableView:](self, "setTableView:", v10);
  -[CNLimitedAccessSelectedContactsViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNLimitedAccessSelectedContactsViewController tableView](self, "tableView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addSubview:", v9);

}

- (void)setupLayoutGuides
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
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  _QWORD v40[9];

  v40[7] = *MEMORY[0x1E0C80C00];
  v24 = (void *)MEMORY[0x1E0CB3718];
  -[CNLimitedAccessSelectedContactsViewController navigationBar](self, "navigationBar");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "topAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNLimitedAccessSelectedContactsViewController view](self, "view");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "topAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "constraintEqualToAnchor:", v36);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v40[0] = v35;
  -[CNLimitedAccessSelectedContactsViewController navigationBar](self, "navigationBar");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "leadingAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNLimitedAccessSelectedContactsViewController view](self, "view");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "leadingAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "constraintEqualToAnchor:", v31);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v40[1] = v30;
  -[CNLimitedAccessSelectedContactsViewController navigationBar](self, "navigationBar");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "trailingAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNLimitedAccessSelectedContactsViewController view](self, "view");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "trailingAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "constraintEqualToAnchor:", v26);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v40[2] = v25;
  -[CNLimitedAccessSelectedContactsViewController tableView](self, "tableView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "topAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNLimitedAccessSelectedContactsViewController navigationBar](self, "navigationBar");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "bottomAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "constraintEqualToAnchor:", v20);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v40[3] = v19;
  -[CNLimitedAccessSelectedContactsViewController tableView](self, "tableView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "leadingAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNLimitedAccessSelectedContactsViewController view](self, "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "leadingAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "constraintEqualToAnchor:", v15);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v40[4] = v14;
  -[CNLimitedAccessSelectedContactsViewController tableView](self, "tableView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "trailingAnchor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNLimitedAccessSelectedContactsViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "trailingAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "constraintEqualToAnchor:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v40[5] = v6;
  -[CNLimitedAccessSelectedContactsViewController tableView](self, "tableView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bottomAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNLimitedAccessSelectedContactsViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bottomAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "constraintEqualToAnchor:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v40[6] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "activateConstraints:", v12);

}

- (void)setupInitialSearchResults
{
  -[UISearchBar setText:](self->_searchBar, "setText:", self->_initialSearchText);
  -[CNLimitedAccessSelectedContactsViewController updateSearchResultsForSearchController:](self, "updateSearchResultsForSearchController:", self->_searchController);
}

- (void)updateLimitedAccessContacts
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
  id v12;

  if (!self->_mode)
  {
    -[CNLimitedAccessSelectedContactsViewController customIndexedContactsStore](self, "customIndexedContactsStore");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNLimitedAccessSelectedContactsViewController selectedContactIdentifiers](self, "selectedContactIdentifiers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "allObjects");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "updateStoreWithContactIdentifiers:", v5);

    v6 = (void *)MEMORY[0x1E0CB3940];
    CNContactsUIBundle();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("LIMITED_CONTACTS_SELECTED_PROMPT"), &stru_1E20507A8, CFSTR("Localized"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNLimitedAccessSelectedContactsViewController selectedContactIdentifiers](self, "selectedContactIdentifiers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringWithFormat:", v8, objc_msgSend(v9, "count"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNLimitedAccessSelectedContactsViewController navigationItem](self, "navigationItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setPrompt:", v10);

    -[CNLimitedAccessSelectedContactsViewController tableView](self, "tableView");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "reloadData");

  }
}

- (void)onTapDoneButton:(id)a3
{
  NSObject *v4;
  void *v5;
  id WeakRetained;
  void *v7;
  id v8;
  char v9;
  id v10;
  uint8_t v11[16];

  objc_msgSend((id)objc_opt_class(), "log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_18AC56000, v4, OS_LOG_TYPE_DEFAULT, "Done button tapped", v11, 2u);
  }

  -[CNLimitedAccessSelectedContactsViewController searchBar](self, "searchBar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNLimitedAccessSelectedContactsViewController searchBarCancelButtonClicked:](self, "searchBarCancelButtonClicked:", v5);

  -[CNLimitedAccessSelectedContactsViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", self != 0, 0);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    v7 = WeakRetained;
    v8 = objc_loadWeakRetained((id *)&self->_delegate);
    v9 = objc_opt_respondsToSelector();

    if ((v9 & 1) != 0)
    {
      v10 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v10, "contactPickerDidDismiss:", self);

    }
  }
}

- (void)onTapEditButton:(id)a3
{
  NSObject *v4;
  CNLimitedAccessContactPickerViewController *v5;
  CNLimitedAccessContactPickerViewController *limitedAccessContactPickerViewController;
  void *v7;
  void *v8;
  uint8_t v9[16];

  objc_msgSend((id)objc_opt_class(), "log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_18AC56000, v4, OS_LOG_TYPE_DEFAULT, "Edit button tapped", v9, 2u);
  }

  v5 = -[CNLimitedAccessContactPickerViewController initDeltaPickerForAppName:bundleId:]([CNLimitedAccessContactPickerViewController alloc], "initDeltaPickerForAppName:bundleId:", self->_appName, self->_appBundleID);
  limitedAccessContactPickerViewController = self->_limitedAccessContactPickerViewController;
  self->_limitedAccessContactPickerViewController = v5;

  -[CNLimitedAccessContactPickerViewController setDelegate:](self->_limitedAccessContactPickerViewController, "setDelegate:", self);
  -[CNLimitedAccessSelectedContactsViewController limitedAccessContactPickerViewController](self, "limitedAccessContactPickerViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNLimitedAccessSelectedContactsViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v7, 1, 0);

  if (-[UISearchController isActive](self->_searchController, "isActive"))
  {
    -[CNLimitedAccessSelectedContactsViewController searchBar](self, "searchBar");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNLimitedAccessSelectedContactsViewController searchBarCancelButtonClicked:](self, "searchBarCancelButtonClicked:", v8);

  }
}

- (id)limitedAccessContactIdentifiersInDatabase
{
  void *v3;
  void *v4;
  void *v5;

  -[CNLimitedAccessSelectedContactsViewController contactStore](self, "contactStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNLimitedAccessSelectedContactsViewController appBundleID](self, "appBundleID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fetchLimitedAccessContactIdentifiersForBundle:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)contactPicker:(id)a3 didSelectContacts:(id)a4
{
  id v5;
  NSObject *v6;
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
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, void *);
  void *v24;
  id v25;
  uint8_t buf[4];
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  if (v5)
  {
    objc_msgSend((id)objc_opt_class(), "log");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v27 = objc_msgSend(v5, "count");
      _os_log_impl(&dword_18AC56000, v6, OS_LOG_TYPE_INFO, "Saving limited access selection for %lu contacts", buf, 0xCu);
    }

    -[CNLimitedAccessSelectedContactsViewController removeAllLimitedAccessContacts](self, "removeAllLimitedAccessContacts");
    -[CNLimitedAccessSelectedContactsViewController addContactsToLimitedAccess:](self, "addContactsToLimitedAccess:", v5);
    v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v21 = MEMORY[0x1E0C809B0];
    v22 = 3221225472;
    v23 = __81__CNLimitedAccessSelectedContactsViewController_contactPicker_didSelectContacts___block_invoke;
    v24 = &unk_1E2049CD0;
    v25 = v7;
    v8 = v7;
    objc_msgSend(v5, "enumerateObjectsUsingBlock:", &v21);
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNLimitedAccessSelectedContactsViewController setSelectedContactIdentifiers:](self, "setSelectedContactIdentifiers:", v9);

    -[CNLimitedAccessSelectedContactsViewController customIndexedContactsStore](self, "customIndexedContactsStore");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNLimitedAccessSelectedContactsViewController selectedContactIdentifiers](self, "selectedContactIdentifiers");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "allObjects");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "updateStoreWithContactIdentifiers:", v12);

    v13 = (void *)MEMORY[0x1E0CB3940];
    CNContactsUIBundle();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("LIMITED_CONTACTS_SELECTED_PROMPT"), &stru_1E20507A8, CFSTR("Localized"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNLimitedAccessSelectedContactsViewController selectedContactIdentifiers](self, "selectedContactIdentifiers");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "count");
    objc_msgSend(v13, "localizedStringWithFormat:", v15, v17, v21, v22, v23, v24);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNLimitedAccessSelectedContactsViewController navigationItem](self, "navigationItem");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setPrompt:", v18);

    -[CNLimitedAccessSelectedContactsViewController tableView](self, "tableView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "reloadData");

  }
}

- (void)removeAllLimitedAccessContacts
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[5];

  -[CNLimitedAccessSelectedContactsViewController contactStore](self, "contactStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNLimitedAccessSelectedContactsViewController appBundleID](self, "appBundleID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fetchLimitedAccessContactIdentifiersForBundle:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __79__CNLimitedAccessSelectedContactsViewController_removeAllLimitedAccessContacts__block_invoke;
  v6[3] = &unk_1E204F620;
  v6[4] = self;
  objc_msgSend(v5, "_cn_each:", v6);

}

- (void)addContactsToLimitedAccess:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __76__CNLimitedAccessSelectedContactsViewController_addContactsToLimitedAccess___block_invoke;
  v3[3] = &unk_1E204F670;
  v3[4] = self;
  objc_msgSend(a3, "_cn_each:", v3);
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  void *v3;
  int64_t v4;

  -[CNLimitedAccessSelectedContactsViewController customIndexedContactsStore](self, "customIndexedContactsStore", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "numberOfSections");

  return v4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v5;
  int64_t v6;

  -[CNLimitedAccessSelectedContactsViewController customIndexedContactsStore](self, "customIndexedContactsStore", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "numberOFItemsInSection:", a4);

  return v6;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  uint64_t v17;
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
  uint64_t v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  -[CNLimitedAccessSelectedContactsViewController customIndexedContactsStore](self, "customIndexedContactsStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "contactAt:section:", objc_msgSend(v6, "row"), objc_msgSend(v6, "section"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_mode == 1)
  {
    +[CNLimitedAccessAppAffordanceContactsCell reuseIdentifier](CNLimitedAccessAppAffordanceContactsCell, "reuseIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dequeueReusableCellWithIdentifier:forIndexPath:", v10, v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    v12 = v11;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v13 = v12;
    else
      v13 = 0;
    v14 = v13;

    objc_msgSend(v14, "setContact:caption:", v9, self->_caption);
  }
  else
  {
    +[CNLimitedAccessSelectedContactsCell reuseIdentifier](CNLimitedAccessSelectedContactsCell, "reuseIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dequeueReusableCellWithIdentifier:forIndexPath:", v15, v6);
    v12 = (id)objc_claimAutoreleasedReturnValue();

    v16 = objc_alloc_init(MEMORY[0x1E0C97218]);
    objc_msgSend(v16, "setEmphasizesPrimaryNameComponent:", 1);
    objc_msgSend(v16, "setIgnoresNickname:", 1);
    objc_msgSend(v16, "setIgnoresOrganization:", 1);
    v17 = *MEMORY[0x1E0DC4A88];
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "textLabel");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setFont:", v18);

    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", v17);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = *MEMORY[0x1E0DC1138];
    v32[0] = v20;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, &v31, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "attributedStringFromContact:defaultAttributes:", v9, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "textLabel");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setAttributedText:", v22);

    objc_msgSend(v12, "textLabel");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setAdjustsFontSizeToFitWidth:", 1);

    v25 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v9, "givenName");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "familyName");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "stringWithFormat:", CFSTR("%@ %@"), v26, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "textLabel");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setText:", v28);

    objc_msgSend(v12, "setHidden:", v9 == 0);
  }

  return v12;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  void *v6;
  uint64_t v7;
  CNLimitedAccessSelectedContactsCell *v8;
  void *v9;
  CNLimitedAccessSelectedContactsCell *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v29[2];
  _QWORD v30[3];

  v30[2] = *MEMORY[0x1E0C80C00];
  -[CNLimitedAccessSelectedContactsViewController customIndexedContactsStore](self, "customIndexedContactsStore", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "numberOFItemsInSection:", a4);

  if (v7 < 1)
  {
    v10 = 0;
  }
  else
  {
    v8 = [CNLimitedAccessSelectedContactsCell alloc];
    +[CNLimitedAccessSelectedContactsCell reuseIdentifier](CNLimitedAccessSelectedContactsCell, "reuseIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[CNLimitedAccessSelectedContactsCell initWithStyle:reuseIdentifier:](v8, "initWithStyle:reuseIdentifier:", 1, v9);

    +[CNUIFontRepository contactStyleDefaultBoldTextFont](CNUIFontRepository, "contactStyleDefaultBoldTextFont");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *MEMORY[0x1E0D13850];
    -[CNLimitedAccessSelectedContactsViewController searchBar](self, "searchBar");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "text");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v12) = (*(uint64_t (**)(uint64_t, void *))(v12 + 16))(v12, v14);

    if ((_DWORD)v12)
    {
      +[CNUIFontRepository contactListBannerTitleFontPrimary](CNUIFontRepository, "contactListBannerTitleFontPrimary");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      +[CNUIFontRepository contactStyleDefaultTextFont](CNUIFontRepository, "contactStyleDefaultTextFont");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
    +[CNUIColorRepository contactStyleDefaultContactHeaderBackgroundColor](CNUIColorRepository, "contactStyleDefaultContactHeaderBackgroundColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNLimitedAccessSelectedContactsCell setBackgroundColor:](v10, "setBackgroundColor:", v16);

    -[CNLimitedAccessSelectedContactsViewController customIndexedContactsStore](self, "customIndexedContactsStore");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "titleForSection:", a4);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = objc_alloc(MEMORY[0x1E0CB3498]);
    CNContactsUIBundle();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "localizedStringForKey:value:table:", v18, &stru_1E20507A8, CFSTR("Localized"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = *MEMORY[0x1E0DC1138];
    v30[0] = v11;
    v23 = *MEMORY[0x1E0DC1140];
    v29[0] = v22;
    v29[1] = v23;
    +[CNUIColorRepository contactListBannerFootnoteTextColorPrimary](CNUIColorRepository, "contactListBannerFootnoteTextColorPrimary");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v30[1] = v24;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 2);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)objc_msgSend(v19, "initWithString:attributes:", v21, v25);

    -[CNLimitedAccessSelectedContactsCell textLabel](v10, "textLabel");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setAttributedText:", v26);

  }
  return v10;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  return 0;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  void *v6;
  uint64_t v7;

  -[CNLimitedAccessSelectedContactsViewController customIndexedContactsStore](self, "customIndexedContactsStore", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "numberOFItemsInSection:", a4);

  if (v7 < 1)
    return 0.01;
  if (self->_mode)
    return *MEMORY[0x1E0DC53D8];
  return *MEMORY[0x1E0DC53E0];
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  return 0.01;
}

- (double)tableView:(id)a3 estimatedHeightForFooterInSection:(int64_t)a4
{
  return 0.01;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  double result;

  v5 = a4;
  -[CNLimitedAccessSelectedContactsViewController customIndexedContactsStore](self, "customIndexedContactsStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "row");
  v8 = objc_msgSend(v5, "section");

  objc_msgSend(v6, "contactAt:section:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  result = *MEMORY[0x1E0DC53D8];
  if (!v9)
    return 0.01;
  return result;
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  return 200.0;
}

- (id)sectionIndexTitlesForTableView:(id)a3
{
  void *v3;
  void *v4;

  -[CNLimitedAccessSelectedContactsViewController customIndexedContactsStore](self, "customIndexedContactsStore", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sectionIndexTitles");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  CNCustomIndexedContactsStore *customIndexedContactsStore;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id WeakRetained;
  void *v11;
  id v12;
  char v13;
  NSObject *v14;
  void *v15;
  CNContactStore *contactStore;
  NSString *appBundleID;
  void *v18;
  id v19;
  int v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  customIndexedContactsStore = self->_customIndexedContactsStore;
  v6 = a4;
  v7 = objc_msgSend(v6, "row");
  v8 = objc_msgSend(v6, "section");

  -[CNCustomIndexedContactsStore contactAt:section:](customIndexedContactsStore, "contactAt:section:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    v11 = WeakRetained;
    v12 = objc_loadWeakRetained((id *)&self->_delegate);
    v13 = objc_opt_respondsToSelector();

    if ((v13 & 1) != 0)
    {
      if (v9)
      {
        objc_msgSend((id)objc_opt_class(), "log");
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v9, "identifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = 138412290;
          v21 = v15;
          _os_log_impl(&dword_18AC56000, v14, OS_LOG_TYPE_INFO, "Adding limited access identifier to store: %@", (uint8_t *)&v20, 0xCu);

        }
        contactStore = self->_contactStore;
        appBundleID = self->_appBundleID;
        objc_msgSend(v9, "identifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNContactStore addLimitedAccessForBundle:contactIdentifier:](contactStore, "addLimitedAccessForBundle:contactIdentifier:", appBundleID, v18);

        v19 = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(v19, "contactPicker:didSelectContact:", self, v9);

      }
    }
  }

}

- (void)updateSearchResultsForSearchController:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  -[UISearchBar text](self->_searchBar, "text", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[CNLimitedAccessSelectedContactsViewController customIndexedContactsStore](self, "customIndexedContactsStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFilterString:", v6);

  -[CNLimitedAccessSelectedContactsViewController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reloadData");

}

- (void)searchBarCancelButtonClicked:(id)a3
{
  id v4;

  -[UISearchBar setText:](self->_searchBar, "setText:", 0);
  -[CNLimitedAccessSelectedContactsViewController updateSearchResultsForSearchController:](self, "updateSearchResultsForSearchController:", self->_searchController);
  -[CNLimitedAccessSelectedContactsViewController searchController](self, "searchController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setActive:", 0);

}

- (CNLimitedAccessAppAffordanceContactPickerDelegate)delegate
{
  return (CNLimitedAccessAppAffordanceContactPickerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)appName
{
  return self->_appName;
}

- (void)setAppName:(id)a3
{
  objc_storeStrong((id *)&self->_appName, a3);
}

- (NSString)appBundleID
{
  return self->_appBundleID;
}

- (void)setAppBundleID:(id)a3
{
  objc_storeStrong((id *)&self->_appBundleID, a3);
}

- (BOOL)isReadOnly
{
  return self->_isReadOnly;
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (NSSet)selectedContactIdentifiers
{
  return self->_selectedContactIdentifiers;
}

- (void)setSelectedContactIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_selectedContactIdentifiers, a3);
}

- (NSString)initialSearchText
{
  return self->_initialSearchText;
}

- (void)setInitialSearchText:(id)a3
{
  objc_storeStrong((id *)&self->_initialSearchText, a3);
}

- (unint64_t)caption
{
  return self->_caption;
}

- (UINavigationBar)navigationBar
{
  return self->_navigationBar;
}

- (void)setNavigationBar:(id)a3
{
  objc_storeStrong((id *)&self->_navigationBar, a3);
}

- (UINavigationItem)navigationItem
{
  return self->_navigationItem;
}

- (void)setNavigationItem:(id)a3
{
  objc_storeStrong((id *)&self->_navigationItem, a3);
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
  objc_storeStrong((id *)&self->_tableView, a3);
}

- (UISearchController)searchController
{
  return self->_searchController;
}

- (void)setSearchController:(id)a3
{
  objc_storeStrong((id *)&self->_searchController, a3);
}

- (UISearchBar)searchBar
{
  return self->_searchBar;
}

- (void)setSearchBar:(id)a3
{
  objc_storeStrong((id *)&self->_searchBar, a3);
}

- (unint64_t)mode
{
  return self->_mode;
}

- (CNContactPickerViewController)contactPickerViewController
{
  return self->_contactPickerViewController;
}

- (void)setContactPickerViewController:(id)a3
{
  objc_storeStrong((id *)&self->_contactPickerViewController, a3);
}

- (CNLimitedAccessContactPickerViewController)limitedAccessContactPickerViewController
{
  return self->_limitedAccessContactPickerViewController;
}

- (void)setLimitedAccessContactPickerViewController:(id)a3
{
  objc_storeStrong((id *)&self->_limitedAccessContactPickerViewController, a3);
}

- (CNCustomIndexedContactsStore)customIndexedContactsStore
{
  return self->_customIndexedContactsStore;
}

- (void)setCustomIndexedContactsStore:(id)a3
{
  objc_storeStrong((id *)&self->_customIndexedContactsStore, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customIndexedContactsStore, 0);
  objc_storeStrong((id *)&self->_limitedAccessContactPickerViewController, 0);
  objc_storeStrong((id *)&self->_contactPickerViewController, 0);
  objc_storeStrong((id *)&self->_searchBar, 0);
  objc_storeStrong((id *)&self->_searchController, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_navigationItem, 0);
  objc_storeStrong((id *)&self->_navigationBar, 0);
  objc_storeStrong((id *)&self->_initialSearchText, 0);
  objc_storeStrong((id *)&self->_selectedContactIdentifiers, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_appBundleID, 0);
  objc_storeStrong((id *)&self->_appName, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __76__CNLimitedAccessSelectedContactsViewController_addContactsToLimitedAccess___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend((id)objc_opt_class(), "log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v3, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412290;
    v10 = v5;
    _os_log_impl(&dword_18AC56000, v4, OS_LOG_TYPE_INFO, "Adding limited access identifier to store: %@", (uint8_t *)&v9, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 32), "contactStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "appBundleID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addLimitedAccessForBundle:contactIdentifier:", v7, v8);

}

void __79__CNLimitedAccessSelectedContactsViewController_removeAllLimitedAccessContacts__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend((id)objc_opt_class(), "log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v7 = 138412290;
    v8 = v3;
    _os_log_impl(&dword_18AC56000, v4, OS_LOG_TYPE_INFO, "Removing limited access identifier to store: %@", (uint8_t *)&v7, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "contactStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "appBundleID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeLimitedAccessForBundle:contactIdentifier:", v6, v3);

}

void __81__CNLimitedAccessSelectedContactsViewController_contactPicker_didSelectContacts___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "identifier");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

void __116__CNLimitedAccessSelectedContactsViewController_initForAppName_bundleID_selectedContacts_mode_matchingText_caption___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a2;
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 1008);
  v8 = v3;
  objc_msgSend(v3, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v4, "containsObject:", v5);

  if ((v4 & 1) == 0)
  {
    v6 = *(void **)(a1 + 40);
    objc_msgSend(v8, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v7);

  }
}

+ (id)log
{
  if (log_cn_once_token_1_7320 != -1)
    dispatch_once(&log_cn_once_token_1_7320, &__block_literal_global_7321);
  return (id)log_cn_once_object_1_7322;
}

void __52__CNLimitedAccessSelectedContactsViewController_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contacts.ui", "CNLimitedAccessSelectedContactsViewController");
  v1 = (void *)log_cn_once_object_1_7322;
  log_cn_once_object_1_7322 = (uint64_t)v0;

}

@end
