@implementation CNUIFamilyMemberDowntimeContactPickerController

- (CNUIFamilyMemberDowntimeContactPickerController)initWithChildFamilyMember:(id)a3 allFamilyMembers:(id)a4 contactStore:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  CNUIFamilyMemberDowntimeContactPickerController *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  +[CNUIFamilyMemberContactsEditingStrategy whitelistedContactsStrategy](CNUIFamilyMemberContactsEditingStrategy, "whitelistedContactsStrategy");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[CNUIFamilyMemberDowntimeContactPickerController initWithChildFamilyMember:allFamilyMembers:contactStore:editingStrategy:showingFamilyMemberContacts:](self, "initWithChildFamilyMember:allFamilyMembers:contactStore:editingStrategy:showingFamilyMemberContacts:", v10, v9, v8, v11, 0);

  return v12;
}

- (CNUIFamilyMemberDowntimeContactPickerController)initWithChildFamilyMember:(id)a3 allFamilyMembers:(id)a4 contactStore:(id)a5 editingStrategy:(id)a6 showingFamilyMemberContacts:(BOOL)a7
{
  uint64_t v7;
  id v13;
  id v14;
  id v15;
  id v16;
  CNUIFamilyMemberDowntimeContactPickerController *v17;
  CNUIFamilyMemberDowntimeContactPickerController *v18;
  void *v19;
  CNContactFormatter *v20;
  CNContactFormatter *contactCellLabelFormatter;
  CNContactFormatter *v22;
  CNContactFormatter *contactCardWarningFormatter;
  id v24;
  void *v25;
  CNUIFamilyMemberDowntimeContactDataSource *v26;
  NSArray *allFamilyMembers;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  CNUIFamilyMemberDowntimeContactDataSource *dataSource;
  CNUIFamilyMemberDowntimeContactPickerController *v33;
  id *v35;
  unsigned int v36;
  _QWORD v37[4];
  id v38;
  objc_super v39;
  _QWORD v40[3];

  v7 = a7;
  v40[2] = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v39.receiver = self;
  v39.super_class = (Class)CNUIFamilyMemberDowntimeContactPickerController;
  v17 = -[CNUIFamilyMemberDowntimeContactPickerController init](&v39, sel_init);
  v18 = v17;
  if (v17)
  {
    v36 = v7;
    objc_storeStrong((id *)&v17->_childFamilyMember, a3);
    v19 = v14;
    if (!v14)
    {
      objc_msgSend((id)objc_opt_class(), "familyCircle");
      self = (CNUIFamilyMemberDowntimeContactPickerController *)objc_claimAutoreleasedReturnValue();
      -[CNUIFamilyMemberDowntimeContactPickerController members](self, "members");
      v7 = objc_claimAutoreleasedReturnValue();
      v37[0] = MEMORY[0x1E0C809B0];
      v37[1] = 3221225472;
      v37[2] = __151__CNUIFamilyMemberDowntimeContactPickerController_initWithChildFamilyMember_allFamilyMembers_contactStore_editingStrategy_showingFamilyMemberContacts___block_invoke;
      v37[3] = &unk_1E2047AE8;
      v35 = &v38;
      v38 = v13;
      objc_msgSend((id)v7, "_cn_filter:", v37);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_storeStrong((id *)&v18->_allFamilyMembers, v19);
    if (!v14)
    {

    }
    objc_storeStrong((id *)&v18->_editingStrategy, a6);
    v20 = (CNContactFormatter *)objc_alloc_init(MEMORY[0x1E0C97218]);
    contactCellLabelFormatter = v18->_contactCellLabelFormatter;
    v18->_contactCellLabelFormatter = v20;

    -[CNContactFormatter setStyle:](v18->_contactCellLabelFormatter, "setStyle:", 0);
    -[CNContactFormatter setEmphasizesPrimaryNameComponent:](v18->_contactCellLabelFormatter, "setEmphasizesPrimaryNameComponent:", 1);
    -[CNContactFormatter setFallbackStyle:](v18->_contactCellLabelFormatter, "setFallbackStyle:", -1);
    v22 = (CNContactFormatter *)objc_alloc_init(MEMORY[0x1E0C97218]);
    contactCardWarningFormatter = v18->_contactCardWarningFormatter;
    v18->_contactCardWarningFormatter = v22;

    -[CNContactFormatter setIgnoresNickname:](v18->_contactCardWarningFormatter, "setIgnoresNickname:", 1);
    -[CNContactFormatter setIgnoresOrganization:](v18->_contactCardWarningFormatter, "setIgnoresOrganization:", 1);
    -[CNContactFormatter setStyle:](v18->_contactCardWarningFormatter, "setStyle:", 1000);
    if (v15)
    {
      v24 = v15;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C97298], "storeWithOptions:", 1);
      v24 = (id)objc_claimAutoreleasedReturnValue();
    }
    v25 = v24;
    v26 = [CNUIFamilyMemberDowntimeContactDataSource alloc];
    allFamilyMembers = v18->_allFamilyMembers;
    +[CNContactContentViewController descriptorForRequiredKeys](CNContactContentViewController, "descriptorForRequiredKeys");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = *MEMORY[0x1E0C966B8];
    v40[0] = v28;
    v40[1] = v29;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 2);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = -[CNUIFamilyMemberDowntimeContactDataSource initWithStore:familyMembers:requiredKeys:](v26, "initWithStore:familyMembers:requiredKeys:", v25, allFamilyMembers, v30);
    dataSource = v18->_dataSource;
    v18->_dataSource = (CNUIFamilyMemberDowntimeContactDataSource *)v31;

    -[CNUIFamilyMemberDowntimeContactDataSource setIsShowingFamilyMemberContacts:](v18->_dataSource, "setIsShowingFamilyMemberContacts:", v36);
    v33 = v18;

    if (!v14)
  }

  return v18;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)CNUIFamilyMemberDowntimeContactPickerController;
  -[CNUIFamilyMemberDowntimeContactPickerController dealloc](&v4, sel_dealloc);
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CNUIFamilyMemberDowntimeContactPickerController;
  -[CNUIFamilyMemberDowntimeContactPickerController viewDidLoad](&v5, sel_viewDidLoad);
  -[CNUIFamilyMemberDowntimeContactPickerController setupUI](self, "setupUI");
  -[CNUIFamilyMemberDowntimeContactPickerController navigationController](self, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "presentationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDelegate:", self);

}

- (void)setupUI
{
  -[CNUIFamilyMemberDowntimeContactPickerController setupTableView](self, "setupTableView");
  -[CNUIFamilyMemberDowntimeContactPickerController setupSearchController](self, "setupSearchController");
  -[CNUIFamilyMemberDowntimeContactPickerController setupSearchBar](self, "setupSearchBar");
  -[CNUIFamilyMemberDowntimeContactPickerController configureNavigationItem](self, "configureNavigationItem");
  -[CNUIFamilyMemberDowntimeContactPickerController startObservingKeyboardChanges](self, "startObservingKeyboardChanges");
}

- (void)setupTableView
{
  id v3;
  void *v4;
  UITableView *v5;
  UITableView *tableView;
  UITableView *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v3 = objc_alloc(MEMORY[0x1E0DC3D48]);
  -[CNUIFamilyMemberDowntimeContactPickerController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v5 = (UITableView *)objc_msgSend(v3, "initWithFrame:style:", 0);
  tableView = self->_tableView;
  self->_tableView = v5;

  v7 = self->_tableView;
  v8 = objc_opt_class();
  +[CNUIFamilyDowntimeContactPickerCell reuseIdentifier](CNUIFamilyDowntimeContactPickerCell, "reuseIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITableView registerClass:forCellReuseIdentifier:](v7, "registerClass:forCellReuseIdentifier:", v8, v9);

  -[UITableView setDelegate:](self->_tableView, "setDelegate:", self);
  -[UITableView setDataSource:](self->_tableView, "setDataSource:", self);
  -[UITableView setAllowsMultipleSelectionDuringEditing:](self->_tableView, "setAllowsMultipleSelectionDuringEditing:", 1);
  -[UITableView setKeyboardDismissMode:](self->_tableView, "setKeyboardDismissMode:", 2);
  -[UITableView setAutoresizingMask:](self->_tableView, "setAutoresizingMask:", 18);
  -[UITableView setEditing:](self->_tableView, "setEditing:", 1);
  -[CNUIFamilyMemberDowntimeContactPickerController view](self, "view");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addSubview:", self->_tableView);

}

- (void)setupSearchController
{
  UISearchController *v3;
  UISearchController *searchController;

  v3 = (UISearchController *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3C40]), "initWithSearchResultsController:", 0);
  searchController = self->_searchController;
  self->_searchController = v3;

  -[UISearchController setObscuresBackgroundDuringPresentation:](self->_searchController, "setObscuresBackgroundDuringPresentation:", 0);
  -[UISearchController setSearchResultsUpdater:](self->_searchController, "setSearchResultsUpdater:", self);
  -[UISearchController setDelegate:](self->_searchController, "setDelegate:", self);
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
  -[UISearchBar setDelegate:](v3, "setDelegate:", self);
  -[UISearchBar sizeToFit](v3, "sizeToFit");
  -[UISearchBar setAutoresizingMask:](v3, "setAutoresizingMask:", 2);
  searchBar = self->_searchBar;
  self->_searchBar = v3;

}

- (void)configureNavigationItem
{
  void *v3;
  void *v4;
  int v5;
  UISearchController *searchController;
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
  const __CFString *v20;
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
  id v31;

  -[CNUIFamilyMemberDowntimeContactPickerController childFamilyMember](self, "childFamilyMember");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstName");
  v31 = (id)objc_claimAutoreleasedReturnValue();

  -[CNUIFamilyMemberDowntimeContactPickerController dataSource](self, "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isShowingFamilyMemberContacts");

  searchController = self->_searchController;
  -[CNUIFamilyMemberDowntimeContactPickerController navigationItem](self, "navigationItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSearchController:", searchController);

  -[CNUIFamilyMemberDowntimeContactPickerController navigationItem](self, "navigationItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setHidesSearchBarWhenScrolling:", 0);

  if (!(*(unsigned int (**)(void))(*MEMORY[0x1E0D13850] + 16))())
  {
    CNContactsUIBundle();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v5)
      v20 = CFSTR("DOWNTIME_PICKER_TITLE");
    else
      v20 = CFSTR("DOWNTIME_PICKER_TITLE_THIS_DEVICE");
    objc_msgSend(v18, "localizedStringForKey:value:table:", v20, &stru_1E20507A8, CFSTR("Localized"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNUIFamilyMemberDowntimeContactPickerController navigationItem](self, "navigationItem");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setTitle:", v21);

    CNContactsUIBundle();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("DOWNTIME_PICKER_PROMPT_DEFAULT_NAME"), &stru_1E20507A8, CFSTR("Localized"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNUIFamilyMemberDowntimeContactPickerController navigationItem](self, "navigationItem");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setPrompt:", v16);
    goto LABEL_10;
  }
  v9 = (void *)MEMORY[0x1E0CB3940];
  CNContactsUIBundle();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("DOWNTIME_PICKER_PROMPT"), &stru_1E20507A8, CFSTR("Localized"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", v11, v31);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNUIFamilyMemberDowntimeContactPickerController navigationItem](self, "navigationItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setPrompt:", v12);

  if (v5)
  {
    v14 = (void *)MEMORY[0x1E0CB3940];
    CNContactsUIBundle();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("DOWNTIME_PICKER_TITLE_MEMBER"), &stru_1E20507A8, CFSTR("Localized"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithFormat:", v16, v31);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    CNContactsUIBundle();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("DOWNTIME_PICKER_TITLE_THIS_DEVICE"), &stru_1E20507A8, CFSTR("Localized"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v17;
  }
  -[CNUIFamilyMemberDowntimeContactPickerController navigationItem](self, "navigationItem");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setTitle:", v17);

  if ((v5 & 1) != 0)
LABEL_10:

  -[CNUIFamilyMemberDowntimeContactPickerController navigationItem](self, "navigationItem");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setLargeTitleDisplayMode:", 2);

  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 1, self, sel_cancel_);
  -[CNUIFamilyMemberDowntimeContactPickerController navigationItem](self, "navigationItem");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setLeftBarButtonItem:", v25);

  v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 0, self, sel_done_);
  -[CNUIFamilyMemberDowntimeContactPickerController navigationItem](self, "navigationItem");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setRightBarButtonItem:", v27);

  -[CNUIFamilyMemberDowntimeContactPickerController navigationItem](self, "navigationItem");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "rightBarButtonItem");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setEnabled:", 0);

}

- (void)startObservingKeyboardChanges
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_keyboardWillChange_, *MEMORY[0x1E0DC4FE8], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel_keyboardWillChange_, *MEMORY[0x1E0DC4FE0], 0);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CNUIFamilyMemberDowntimeContactPickerController;
  -[CNUIFamilyMemberDowntimeContactPickerController viewWillAppear:](&v7, sel_viewWillAppear_, a3);
  -[CNUIFamilyMemberDowntimeContactPickerController tableView](self, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNUIFamilyMemberDowntimeContactPickerController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "indexPathsForVisibleRows");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reloadRowsAtIndexPaths:withRowAnimation:", v6, 5);

}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CNUIFamilyMemberDowntimeContactPickerController;
  -[CNUIFamilyMemberDowntimeContactPickerController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[CNUIFamilyMemberDowntimeContactPickerController setInitialSelectionPerformed:](self, "setInitialSelectionPerformed:", 1);
}

- (void)presentationControllerDidDismiss:(id)a3
{
  -[CNUIFamilyMemberDowntimeContactPickerController cancel:](self, "cancel:", 0);
}

- (CNUICoreContactEditingSession)editingSessionFromContactViewController
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  objc_opt_class();
  -[CNUIFamilyMemberDowntimeContactPickerController contactViewController](self, "contactViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "saveContactExecutor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;
  objc_msgSend(v7, "editingSession");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (CNUICoreContactEditingSession *)v8;
}

- (void)keyboardWillChange:(id)a3
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
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  void *v33;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v38;
  void *v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  void *v46;
  double v47;
  double v48;
  void *v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  void *v55;
  id v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0DC4E90]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "CGRectValue");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  -[CNUIFamilyMemberDowntimeContactPickerController view](self, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "window");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "convertRect:fromWindow:", 0, v7, v9, v11, v13);
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;

  -[CNUIFamilyMemberDowntimeContactPickerController view](self, "view");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "convertRect:fromView:", 0, v17, v19, v21, v23);
  v26 = v25;
  v28 = v27;
  v30 = v29;
  v32 = v31;

  -[CNUIFamilyMemberDowntimeContactPickerController view](self, "view");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "bounds");
  v60.origin.x = v26;
  v60.origin.y = v28;
  v60.size.width = v30;
  v60.size.height = v32;
  v58 = CGRectIntersection(v57, v60);
  x = v58.origin.x;
  y = v58.origin.y;
  width = v58.size.width;
  height = v58.size.height;

  v59.origin.x = x;
  v59.origin.y = y;
  v59.size.width = width;
  v59.size.height = height;
  v38 = CGRectGetHeight(v59);
  -[CNUIFamilyMemberDowntimeContactPickerController tableView](self, "tableView");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "contentInset");
  v41 = v40;
  v43 = v42;
  v45 = v44;

  -[CNUIFamilyMemberDowntimeContactPickerController tableView](self, "tableView");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "_systemContentInset");
  v48 = v38 - v47;

  if (v48 < 0.0)
    v48 = 0.0;
  -[CNUIFamilyMemberDowntimeContactPickerController tableView](self, "tableView");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "contentInset");
  if (v43 != v53 || v41 != v50 || v45 != v52)
  {

    goto LABEL_9;
  }
  v54 = v51;

  if (v48 != v54)
  {
LABEL_9:
    -[CNUIFamilyMemberDowntimeContactPickerController tableView](self, "tableView");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "setContentInset:", v41, v43, v48, v45);

    -[CNUIFamilyMemberDowntimeContactPickerController tableView](self, "tableView");
    v56 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "setScrollIndicatorInsets:", v41, v43, v48, v45);

  }
}

- (void)cancel:(id)a3
{
  id v4;

  -[CNUIFamilyMemberDowntimeContactPickerController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "downtimePickerController:didFinishWithContacts:", self, 0);

}

- (void)done:(id)a3
{
  void *v4;
  id v5;

  -[CNUIFamilyMemberDowntimeContactPickerController dataSource](self, "dataSource", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "selectedContacts");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  -[CNUIFamilyMemberDowntimeContactPickerController saveSanitizedSelectedContacts:](self, "saveSanitizedSelectedContacts:", v5);
}

- (void)saveSanitizedSelectedContacts:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];

  v4 = a3;
  v5 = *MEMORY[0x1E0D137F8];
  v13 = v4;
  if (((*(uint64_t (**)(_QWORD))(*MEMORY[0x1E0D137F8] + 16))(*MEMORY[0x1E0D137F8]) & 1) == 0)
  {
    -[CNUIFamilyMemberDowntimeContactPickerController editingSessionFromContactViewController](self, "editingSessionFromContactViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "updatedContacts");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (*(uint64_t (**)(uint64_t, void *))(v5 + 16))(v5, v7);

    if (v8)
    {
      -[CNUIFamilyMemberDowntimeContactPickerController editingStrategy](self, "editingStrategy");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "sensitiveDataContactFilter");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "_cn_map:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __81__CNUIFamilyMemberDowntimeContactPickerController_saveSanitizedSelectedContacts___block_invoke;
      v14[3] = &unk_1E2047B10;
      v14[4] = self;
      objc_msgSend(v13, "_cn_map:", v14);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[CNUIFamilyMemberDowntimeContactPickerController delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "downtimePickerController:didFinishWithContacts:", self, v11);

  }
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  void *v3;
  int64_t v4;

  -[CNUIFamilyMemberDowntimeContactPickerController dataSource](self, "dataSource", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "numberOfSections");

  return v4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v5;
  int64_t v6;

  -[CNUIFamilyMemberDowntimeContactPickerController dataSource](self, "dataSource", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "numberOfRowsInSection:", a4);

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
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;

  v6 = a4;
  v7 = a3;
  +[CNUIFamilyDowntimeContactPickerCell reuseIdentifier](CNUIFamilyDowntimeContactPickerCell, "reuseIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dequeueReusableCellWithIdentifier:forIndexPath:", v8, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNUIFamilyMemberDowntimeContactPickerController dataSource](self, "dataSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "contactItemForIndexPath:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNUIFamilyMemberDowntimeContactPickerController contactCellLabelFormatter](self, "contactCellLabelFormatter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "contact");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringFromContact:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "textLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setText:", v14);

  objc_msgSend(v11, "label");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "detailTextLabel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setText:", v16);

  -[CNUIFamilyMemberDowntimeContactPickerController dataSource](self, "dataSource");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v18, "isShowingFamilyMemberContacts"))
    v19 = 0;
  else
    v19 = 4;
  objc_msgSend(v9, "setEditingAccessoryType:", v19);

  v20 = objc_alloc(MEMORY[0x1E0DC3F10]);
  v21 = (void *)objc_msgSend(v20, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  objc_msgSend(v9, "setSelectedBackgroundView:", v21);

  if (!-[CNUIFamilyMemberDowntimeContactPickerController initialSelectionPerformed](self, "initialSelectionPerformed")
    && -[CNUIFamilyMemberDowntimeContactPickerController shouldPreselectFamilyMemberContacts](self, "shouldPreselectFamilyMemberContacts"))
  {
    -[CNUIFamilyMemberDowntimeContactPickerController dataSource](self, "dataSource");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v22, "numberOfSections") != 2)
    {
LABEL_9:

      goto LABEL_10;
    }
    v23 = objc_msgSend(v6, "section");

    if (!v23)
    {
      -[CNUIFamilyMemberDowntimeContactPickerController dataSource](self, "dataSource");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setContactItemSelected:forIndexPath:", 1, v6);

      -[CNUIFamilyMemberDowntimeContactPickerController navigationItem](self, "navigationItem");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "rightBarButtonItem");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setEnabled:", 1);

      goto LABEL_9;
    }
  }
LABEL_10:

  return v9;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  id v12;

  v12 = a5;
  v7 = a4;
  -[CNUIFamilyMemberDowntimeContactPickerController dataSource](self, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "contactItemForIndexPath:", v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "selected");

  if (v10)
  {
    objc_msgSend(v7, "setSelected:animated:", 1, 0);

    -[CNUIFamilyMemberDowntimeContactPickerController tableView](self, "tableView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "selectRowAtIndexPath:animated:scrollPosition:", v12, 0, 0);
  }
  else
  {
    objc_msgSend(v7, "setSelected:animated:", 0, 0);

    -[CNUIFamilyMemberDowntimeContactPickerController tableView](self, "tableView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "deselectRowAtIndexPath:animated:", v12, 0);
  }

}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  return -[CNUIFamilyMemberDowntimeContactDataSource titleForSection:](self->_dataSource, "titleForSection:", a4);
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  return 0;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;

  v5 = *MEMORY[0x1E0D137F8];
  v6 = a4;
  -[CNUIFamilyMemberDowntimeContactPickerController tableView](self, "tableView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "indexPathsForSelectedRows");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (*(unsigned int (**)(uint64_t, void *))(v5 + 16))(v5, v8) ^ 1;
  -[CNUIFamilyMemberDowntimeContactPickerController navigationItem](self, "navigationItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "rightBarButtonItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setEnabled:", v9);

  -[CNUIFamilyMemberDowntimeContactPickerController dataSource](self, "dataSource");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setContactItemSelected:forIndexPath:", 1, v6);

}

- (void)tableView:(id)a3 didDeselectRowAtIndexPath:(id)a4
{
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;

  v5 = *MEMORY[0x1E0D137F8];
  v6 = a4;
  -[CNUIFamilyMemberDowntimeContactPickerController tableView](self, "tableView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "indexPathsForSelectedRows");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (*(unsigned int (**)(uint64_t, void *))(v5 + 16))(v5, v8) ^ 1;
  -[CNUIFamilyMemberDowntimeContactPickerController navigationItem](self, "navigationItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "rightBarButtonItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setEnabled:", v9);

  -[CNUIFamilyMemberDowntimeContactPickerController dataSource](self, "dataSource");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setContactItemSelected:forIndexPath:", 0, v6);

}

- (void)tableView:(id)a3 accessoryButtonTappedForRowWithIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void (**v17)(_QWORD, _QWORD);
  void *v18;
  void *v19;
  CNContactViewController *contactViewController;
  CNUINullSaveExecutor *v21;
  CNContactViewController *v22;
  CNContactViewController *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  CNUIEditingSessionSaveExecutor *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  _QWORD v36[3];

  v36[2] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  -[CNUIFamilyMemberDowntimeContactPickerController setPresentedContactIndexPath:](self, "setPresentedContactIndexPath:", v5);
  -[CNUIFamilyMemberDowntimeContactPickerController dataSource](self, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contactItemForIndexPath:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNUIFamilyMemberDowntimeContactPickerController dataSource](self, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "contact");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNContactContentViewController descriptorForRequiredKeys](CNContactContentViewController, "descriptorForRequiredKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *MEMORY[0x1E0C966B8];
  v36[0] = v10;
  v36[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "completeContactFromContact:fromMainStoreOnly:keysToFetch:", v9, 1, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = v13;
  -[CNUIFamilyMemberDowntimeContactPickerController editingSessionFromContactViewController](self, "editingSessionFromContactViewController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v10) = objc_msgSend(v15, "containsUpdatedContactMatchingContact:", v14);

  if ((_DWORD)v10)
  {
    -[CNUIFamilyMemberDowntimeContactPickerController editingSessionFromContactViewController](self, "editingSessionFromContactViewController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v35, 1);
    v17 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "updatedContactsMatchingContacts:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "firstObject");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[CNUIFamilyMemberDowntimeContactPickerController editingStrategy](self, "editingStrategy");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "sensitiveDataContactFilter");
    v17 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v17)[2](v17, v14);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v14;
  }

  contactViewController = self->_contactViewController;
  if (contactViewController)
  {
    -[CNContactViewController setContact:additionalContact:mode:](contactViewController, "setContact:additionalContact:mode:", v19, 0, 1);
    -[CNUIFamilyMemberDowntimeContactPickerController warningMessageForContact:](self, "warningMessageForContact:", v14);
    v21 = (CNUINullSaveExecutor *)objc_claimAutoreleasedReturnValue();
    -[CNContactViewController setWarningMessage:](self->_contactViewController, "setWarningMessage:", v21);
  }
  else
  {
    +[CNContactViewController viewControllerForContact:](CNContactViewController, "viewControllerForContact:", v19);
    v22 = (CNContactViewController *)objc_claimAutoreleasedReturnValue();
    v23 = self->_contactViewController;
    self->_contactViewController = v22;

    -[CNUIFamilyMemberDowntimeContactPickerController editingStrategy](self, "editingStrategy");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "prohibitedPropertyKeys");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactViewController setProhibitedPropertyKeys:](self->_contactViewController, "setProhibitedPropertyKeys:", v25);

    -[CNContactViewController setIgnoresParentalRestrictions:](self->_contactViewController, "setIgnoresParentalRestrictions:", 1);
    -[CNContactViewController setDisplayMode:](self->_contactViewController, "setDisplayMode:", 2);
    -[CNUIFamilyMemberDowntimeContactPickerController warningMessageForContact:](self, "warningMessageForContact:", v14);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactViewController setWarningMessage:](self->_contactViewController, "setWarningMessage:", v26);

    -[CNContactViewController setEditingProposedInformation:](self->_contactViewController, "setEditingProposedInformation:", 1);
    -[CNContactViewController setDelegate:](self->_contactViewController, "setDelegate:", self);
    -[CNContactViewController setShouldDrawNavigationBar:](self->_contactViewController, "setShouldDrawNavigationBar:", 1);
    CNContactsUIBundle();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "localizedStringForKey:value:table:", CFSTR("DOWNTIME_PICKER_CONTACT_CARD_PROMPT"), &stru_1E20507A8, CFSTR("Localized"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactViewController setInitialPrompt:](self->_contactViewController, "setInitialPrompt:", v28);

    -[CNContactViewController setEditMode:](self->_contactViewController, "setEditMode:", 2);
    -[CNContactViewController setActions:](self->_contactViewController, "setActions:", -[CNContactViewController actions](self->_contactViewController, "actions") & 0xFFFFFFFFFFFFFEFFLL);
    -[CNContactViewController setActions:](self->_contactViewController, "setActions:", -[CNContactViewController actions](self->_contactViewController, "actions") & 0xFFFFFFFFFFFFFFEFLL);
    -[CNContactViewController setAllowsActions:](self->_contactViewController, "setAllowsActions:", 0);
    -[CNContactViewController contentViewController](self->_contactViewController, "contentViewController");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setShouldIgnoreContactStoreDidChangeNotification:", 1);

    v30 = objc_alloc_init(CNUIEditingSessionSaveExecutor);
    -[CNContactViewController contentViewController](self->_contactViewController, "contentViewController");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setSaveContactExecutor:", v30);

    v21 = objc_alloc_init(CNUINullSaveExecutor);
    -[CNContactViewController contentViewController](self->_contactViewController, "contentViewController");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setSaveLinkedContactsExecutor:", v21);

  }
  -[CNContactViewController setEditing:](self->_contactViewController, "setEditing:", 1);
  -[CNUIFamilyMemberDowntimeContactPickerController navigationController](self, "navigationController");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNUIFamilyMemberDowntimeContactPickerController contactViewController](self, "contactViewController");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "pushViewController:animated:", v34, 1);

}

- (id)warningMessageForContact:(id)a3
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
  uint64_t v17;

  v4 = a3;
  -[CNUIFamilyMemberDowntimeContactPickerController contactCardWarningFormatter](self, "contactCardWarningFormatter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringFromContact:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v5) = (*(uint64_t (**)(void))(*MEMORY[0x1E0D13848] + 16))();
  v7 = (void *)MEMORY[0x1E0CB3940];
  CNContactsUIBundle();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if ((_DWORD)v5)
  {
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("DOWNTIME_PICKER_CONTACT_CARD_WARNING_NO_NAME"), &stru_1E20507A8, CFSTR("Localized"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNUIFamilyMemberDowntimeContactPickerController childFamilyMember](self, "childFamilyMember");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "firstName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNUIFamilyMemberDowntimeContactPickerController childFamilyMember](self, "childFamilyMember");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "firstName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", v10, v12, v14, v17);
  }
  else
  {
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("DOWNTIME_PICKER_CONTACT_CARD_WARNING"), &stru_1E20507A8, CFSTR("Localized"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNUIFamilyMemberDowntimeContactPickerController childFamilyMember](self, "childFamilyMember");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "firstName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNUIFamilyMemberDowntimeContactPickerController childFamilyMember](self, "childFamilyMember");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "firstName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", v10, v12, v6, v14);
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (void)updateSearchResultsForSearchController:(id)a3
{
  id v4;

  -[UISearchBar text](self->_searchBar, "text", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CNUIFamilyMemberDowntimeContactDataSource setFilterString:](self->_dataSource, "setFilterString:", v4);
  -[UITableView reloadData](self->_tableView, "reloadData");

}

- (void)searchBarCancelButtonClicked:(id)a3
{
  -[UISearchBar setText:](self->_searchBar, "setText:", &stru_1E20507A8);
  -[CNUIFamilyMemberDowntimeContactPickerController updateSearchResultsForSearchController:](self, "updateSearchResultsForSearchController:", self->_searchController);
}

- (BOOL)contactViewController:(id)a3 shouldPerformDefaultActionForContact:(id)a4 propertyKey:(id)a5 propertyIdentifier:(id)a6
{
  return 0;
}

- (void)contactViewController:(id)a3 didCompleteWithContact:(id)a4
{
  void *v5;
  void *v6;
  id v7;
  id v8;

  if (!a4)
  {
    -[CNUIFamilyMemberDowntimeContactPickerController tableView](self, "tableView", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNUIFamilyMemberDowntimeContactPickerController presentedContactIndexPath](self, "presentedContactIndexPath");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "deselectRowAtIndexPath:animated:", v6, 1);

  }
  -[CNUIFamilyMemberDowntimeContactPickerController setPresentedContactIndexPath:](self, "setPresentedContactIndexPath:", 0);
  -[CNUIFamilyMemberDowntimeContactPickerController navigationController](self, "navigationController");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v8, "popViewControllerAnimated:", 1);

}

- (CNUIFamilyMemberDowntimeContactPickerControllerDelegate)delegate
{
  return (CNUIFamilyMemberDowntimeContactPickerControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)shouldPreselectFamilyMemberContacts
{
  return self->_shouldPreselectFamilyMemberContacts;
}

- (void)setShouldPreselectFamilyMemberContacts:(BOOL)a3
{
  self->_shouldPreselectFamilyMemberContacts = a3;
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

- (NSIndexPath)presentedContactIndexPath
{
  return self->_presentedContactIndexPath;
}

- (void)setPresentedContactIndexPath:(id)a3
{
  objc_storeStrong((id *)&self->_presentedContactIndexPath, a3);
}

- (CNContactViewController)contactViewController
{
  return self->_contactViewController;
}

- (void)setContactViewController:(id)a3
{
  objc_storeStrong((id *)&self->_contactViewController, a3);
}

- (CNContactFormatter)contactCellLabelFormatter
{
  return self->_contactCellLabelFormatter;
}

- (CNContactFormatter)contactCardWarningFormatter
{
  return self->_contactCardWarningFormatter;
}

- (CNUIFamilyMemberDowntimeContactDataSource)dataSource
{
  return self->_dataSource;
}

- (CNUIFamilyMemberContactsEditingStrategy)editingStrategy
{
  return self->_editingStrategy;
}

- (FAFamilyMember)childFamilyMember
{
  return self->_childFamilyMember;
}

- (NSArray)allFamilyMembers
{
  return self->_allFamilyMembers;
}

- (CNContact)preferredForNameMeContact
{
  return self->_preferredForNameMeContact;
}

- (BOOL)initialSelectionPerformed
{
  return self->_initialSelectionPerformed;
}

- (void)setInitialSelectionPerformed:(BOOL)a3
{
  self->_initialSelectionPerformed = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferredForNameMeContact, 0);
  objc_storeStrong((id *)&self->_allFamilyMembers, 0);
  objc_storeStrong((id *)&self->_childFamilyMember, 0);
  objc_storeStrong((id *)&self->_editingStrategy, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_contactCardWarningFormatter, 0);
  objc_storeStrong((id *)&self->_contactCellLabelFormatter, 0);
  objc_storeStrong((id *)&self->_contactViewController, 0);
  objc_storeStrong((id *)&self->_presentedContactIndexPath, 0);
  objc_storeStrong((id *)&self->_searchBar, 0);
  objc_storeStrong((id *)&self->_searchController, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

id __81__CNUIFamilyMemberDowntimeContactPickerController_saveSanitizedSelectedContacts___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void (**v10)(_QWORD, _QWORD);
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "editingSessionFromContactViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updatedContactsMatchingContacts:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = v7;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "editingStrategy");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sensitiveDataContactFilter");
    v10 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v10)[2](v10, v3);
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

uint64_t __151__CNUIFamilyMemberDowntimeContactPickerController_initWithChildFamilyMember_allFamilyMembers_contactStore_editingStrategy_showingFamilyMemberContacts___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "firstName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", v5))
  {
    objc_msgSend(*(id *)(a1 + 32), "lastName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "lastName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqualToString:", v7) ^ 1;

  }
  else
  {
    v8 = 1;
  }

  return v8;
}

+ (id)descriptorForContactPropertiesSupportingPredicateEvaluation
{
  return +[CNContactContentViewController descriptorForRequiredKeys](CNContactContentViewController, "descriptorForRequiredKeys");
}

+ (id)familyCircle
{
  id v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = objc_alloc_init(MEMORY[0x1E0D20EB0]);
  objc_msgSend(v2, "setPromptUserToResolveAuthenticatonFailure:", 0);
  v3 = objc_alloc_init(MEMORY[0x1E0D13B20]);
  objc_msgSend(v3, "completionHandlerAdapter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "startRequestWithCompletionHandler:", v4);

  objc_msgSend(v3, "future");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "recover:", &__block_literal_global_46);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "result:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __63__CNUIFamilyMemberDowntimeContactPickerController_familyCircle__block_invoke()
{
  void *v0;
  id v1;
  void *v2;

  v0 = (void *)MEMORY[0x1E0D13A68];
  v1 = objc_alloc_init(MEMORY[0x1E0D20E88]);
  objc_msgSend(v0, "futureWithResult:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

@end
