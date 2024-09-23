@implementation EKLocationEditItemViewController

- (EKLocationEditItemViewController)initWithFrame:(CGRect)a3 calendarItem:(id)a4 eventStore:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  id v12;
  id v13;
  EKLocationEditItemViewController *v14;
  EKUILocationSearchModel *v15;
  EKUILocationSearchModel *searchModel;
  void *v17;
  void *v18;
  void *v19;
  objc_super v21;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v12 = a4;
  v13 = a5;
  v21.receiver = self;
  v21.super_class = (Class)EKLocationEditItemViewController;
  v14 = -[EKEditItemViewController initWithFrame:](&v21, sel_initWithFrame_, x, y, width, height);
  if (v14)
  {
    v15 = -[EKUILocationSearchModel initWithEventStore:]([EKUILocationSearchModel alloc], "initWithEventStore:", v13);
    searchModel = v14->_searchModel;
    v14->_searchModel = v15;

    -[EKUILocationSearchModel setDelegate:](v14->_searchModel, "setDelegate:", v14);
    objc_storeStrong((id *)&v14->_calendarItem, a4);
    v14->_autoFillSelectedTextField = 1;
    v14->_supportedSearchTypes = 2047;
    v14->_shouldShowCheckedVirtualConference = 1;
    -[EKCalendarItem calendar](v14->_calendarItem, "calendar");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "source");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constraints");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v14->_supportsStructuredLocations = objc_msgSend(v19, "supportsStructuredLocations");

    -[EKLocationEditItemViewController setDefinesPresentationContext:](v14, "setDefinesPresentationContext:", 1);
  }

  return v14;
}

- (id)title
{
  void *v2;
  void *v3;

  EventKitUIBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Location"), &stru_1E601DFA8, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)viewDidLoad
{
  unint64_t supportedSearchTypes;
  _BOOL4 v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _BOOL4 v14;
  int v15;
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
  _QWORD v31[5];
  objc_super v32;

  v32.receiver = self;
  v32.super_class = (Class)EKLocationEditItemViewController;
  -[EKEditItemViewController viewDidLoad](&v32, sel_viewDidLoad);
  -[EKLocationEditItemViewController _setupViewsAndConstraints](self, "_setupViewsAndConstraints");
  if (self->_supportsStructuredLocations)
  {
    supportedSearchTypes = self->_supportedSearchTypes;
    if ((supportedSearchTypes & 1) != 0)
    {
      -[EKUILocationSearchModel getCurrentLocation](self->_searchModel, "getCurrentLocation");
      supportedSearchTypes = self->_supportedSearchTypes;
    }
    if ((supportedSearchTypes & 0x10) != 0)
      -[EKUILocationSearchModel updateRecents:](self->_searchModel, "updateRecents:", 0);
  }
  if ((self->_supportedSearchTypes & 0x200) != 0)
    -[EKUILocationSearchModel updateVirtualConferenceRoomOptions:](self->_searchModel, "updateVirtualConferenceRoomOptions:", 0);
  v4 = -[EKLocationEditItemViewController _singleSearchBar](self, "_singleSearchBar");
  -[EKLocationEditItemViewController locationViewModel](self, "locationViewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "location");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[EKLocationEditItemViewController conferenceViewModel](self, "conferenceViewModel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "conference");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = -[EKLocationEditItemViewController autoFillSelectedTextField](self, "autoFillSelectedTextField")
       || -[EKLocationEditItemViewController conferenceTextFieldSelected](self, "conferenceTextFieldSelected");
    if (-[EKLocationEditItemViewController autoFillSelectedTextField](self, "autoFillSelectedTextField"))
    {
      v15 = 1;
      if (!v14)
        goto LABEL_26;
    }
    else
    {
      v15 = !-[EKLocationEditItemViewController conferenceTextFieldSelected](self, "conferenceTextFieldSelected");
      if (!v14)
        goto LABEL_26;
    }
    objc_msgSend(v6, "address");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      v17 = (void *)MEMORY[0x1E0D0C328];
      objc_msgSend(v6, "title");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "address");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "fullDisplayStringWithTitle:address:", v18, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v20, "_stringByReplacingCharactersInSet:withCharacter:", CFCharacterSetGetPredefined(kCFCharacterSetNewline), 32);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKLocationVirtualConferenceSearchFieldsView locationTextField](self->_searchFieldsView, "locationTextField");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setText:", v21);

    }
    else
    {
      objc_msgSend(v6, "title");
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v24)
        goto LABEL_26;
      objc_msgSend(v6, "title");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKLocationVirtualConferenceSearchFieldsView locationTextField](self->_searchFieldsView, "locationTextField");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setText:", v20);
    }

LABEL_26:
    if (!v15)
      goto LABEL_32;
    if (v11)
    {
      v25 = (void *)MEMORY[0x1E0D0CD38];
      objc_msgSend(v11, "joinMethods");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "firstObject");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v31[0] = MEMORY[0x1E0C809B0];
      v31[1] = 3221225472;
      v31[2] = __47__EKLocationEditItemViewController_viewDidLoad__block_invoke;
      v31[3] = &unk_1E6018940;
      v31[4] = self;
      objc_msgSend(v25, "displayDetailsForJoinMethod:completionHandler:", v27, v31);

      return;
    }
    -[EKLocationEditItemViewController conferenceViewModel](self, "conferenceViewModel");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v28)
      goto LABEL_32;
    EventKitUIBundle();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("Pending Video Call"), &stru_1E601DFA8, 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKLocationVirtualConferenceSearchFieldsView virtualConferenceTextField](self->_searchFieldsView, "virtualConferenceTextField");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setText:", v29);

    goto LABEL_31;
  }
  if (self->_autoFillSelectedTextField)
  {
    objc_msgSend(v6, "address");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v8 = (void *)MEMORY[0x1E0D0C328];
      objc_msgSend(v6, "title");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "address");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "fullDisplayStringWithTitle:address:", v9, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "_stringByReplacingCharactersInSet:withCharacter:", CFCharacterSetGetPredefined(kCFCharacterSetNewline), 32);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKLocationEditItemViewController setSearchText:](self, "setSearchText:", v12);
LABEL_31:

      goto LABEL_32;
    }
    objc_msgSend(v6, "title");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
    {
      objc_msgSend(v6, "title");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKLocationEditItemViewController setSearchText:](self, "setSearchText:", v11);
LABEL_32:

    }
  }

  -[EKLocationEditItemViewController kickoffSearchTextChangedIfNonEmpty](self, "kickoffSearchTextChangedIfNonEmpty");
}

void __47__EKLocationEditItemViewController_viewDidLoad__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __47__EKLocationEditItemViewController_viewDidLoad__block_invoke_2;
  v6[3] = &unk_1E6018EC0;
  v6[4] = *(_QWORD *)(a1 + 32);
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

uint64_t __47__EKLocationEditItemViewController_viewDidLoad__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1072), "virtualConferenceTextField");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setText:", v2);

  return objc_msgSend(*(id *)(a1 + 32), "kickoffSearchTextChangedIfNonEmpty");
}

- (void)setPreferredContentSize:(CGSize)a3
{
  self->_preferredContentSize = a3;
}

- (CGSize)preferredContentSize
{
  double width;
  double height;
  CGSize result;

  width = self->_preferredContentSize.width;
  height = self->_preferredContentSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;
  _QWORD block[5];

  v3 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__EKLocationEditItemViewController_viewDidAppear___block_invoke;
  block[3] = &unk_1E6018688;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
  v5.receiver = self;
  v5.super_class = (Class)EKLocationEditItemViewController;
  -[EKLocationEditItemViewController viewDidAppear:](&v5, sel_viewDidAppear_, v3);
}

void __50__EKLocationEditItemViewController_viewDidAppear___block_invoke(uint64_t a1)
{
  _BYTE *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void (**v7)(id, void *);

  v2 = *(_BYTE **)(a1 + 32);
  if (!v2[1138] || v2[1139])
  {
    objc_msgSend(v2, "searchBecomeFirstResponder");
    v2 = *(_BYTE **)(a1 + 32);
  }
  v2[1138] = 0;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1139) = 0;
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 1048);
  objc_msgSend(v3, "indexPathsForVisibleRows");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reloadRowsAtIndexPaths:withRowAnimation:", v4, 5);

  objc_msgSend(*(id *)(a1 + 32), "viewDidAppearBlock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "viewDidAppearBlock");
    v7 = (void (**)(id, void *))objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_focusedTextField");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v6);

  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  BOOL IsIdentity;
  CGAffineTransform v9;
  objc_super v10;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  v10.receiver = self;
  v10.super_class = (Class)EKLocationEditItemViewController;
  -[EKLocationEditItemViewController viewWillTransitionToSize:withTransitionCoordinator:](&v10, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  if (v7)
    objc_msgSend(v7, "targetTransform");
  else
    memset(&v9, 0, sizeof(v9));
  IsIdentity = CGAffineTransformIsIdentity(&v9);
  self->_rotating = !IsIdentity;
  if (!IsIdentity)
    self->_wasFirstResponder = -[EKLocationEditItemViewController searchIsFirstResponder](self, "searchIsFirstResponder");

}

- (void)_setupViewsAndConstraints
{
  id v3;
  UITableView *v4;
  UITableView *tableView;
  void *v6;
  void *v7;
  void (**v8)(void *, uint64_t);
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  UISearchBar *v17;
  UISearchBar *searchBar;
  unint64_t supportedSearchTypes;
  void *v20;
  void *v21;
  const __CFString *v22;
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
  EKLocationVirtualConferenceSearchFieldsView *v34;
  EKLocationVirtualConferenceSearchFieldsView *searchFieldsView;
  double v36;
  _UINavigationBarPalette *v37;
  _UINavigationBarPalette *palette;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  _UINavigationBarPalette *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  uint64_t v87;
  void (**v88)(void *, uint64_t);
  _QWORD aBlock[5];
  _QWORD v90[8];
  _QWORD v91[6];

  v91[4] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0DC3D48]);
  v4 = (UITableView *)objc_msgSend(v3, "initWithFrame:style:", 0, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  tableView = self->_tableView;
  self->_tableView = v4;

  -[UITableView setDataSource:](self->_tableView, "setDataSource:", self);
  -[UITableView setDelegate:](self->_tableView, "setDelegate:", self);
  -[UITableView setKeyboardDismissMode:](self->_tableView, "setKeyboardDismissMode:", 1);
  -[UITableView setTranslatesAutoresizingMaskIntoConstraints:](self->_tableView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lineHeight");
  -[UITableView setEstimatedRowHeight:](self->_tableView, "setEstimatedRowHeight:");

  -[UITableView setRowHeight:](self->_tableView, "setRowHeight:", *MEMORY[0x1E0DC53D8]);
  -[EKLocationEditItemViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addSubview:", self->_tableView);

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __61__EKLocationEditItemViewController__setupViewsAndConstraints__block_invoke;
  aBlock[3] = &unk_1E601ADB0;
  aBlock[4] = self;
  v8 = (void (**)(void *, uint64_t))_Block_copy(aBlock);
  v9 = objc_opt_class();
  v8[2](v8, v9);
  v10 = objc_opt_class();
  v8[2](v8, v10);
  v11 = objc_opt_class();
  v8[2](v8, v11);
  v12 = objc_opt_class();
  v88 = v8;
  v8[2](v8, v12);
  if (-[EKLocationEditItemViewController _singleSearchBar](self, "_singleSearchBar"))
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3C40]), "initWithSearchResultsController:", 0);
    objc_msgSend(v13, "setObscuresBackgroundDuringPresentation:", 0);
    objc_msgSend(v13, "setHidesNavigationBarDuringPresentation:", 0);
    objc_msgSend(v13, "setAutomaticallyShowsCancelButton:", 0);
    -[EKLocationEditItemViewController navigationItem](self, "navigationItem");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setPreferredSearchBarPlacement:", 2);

    -[EKLocationEditItemViewController navigationItem](self, "navigationItem");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v86 = v13;
    objc_msgSend(v15, "setSearchController:", v13);

    -[EKLocationEditItemViewController navigationItem](self, "navigationItem");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setHidesSearchBarWhenScrolling:", 0);

    objc_msgSend(v13, "searchBar");
    v17 = (UISearchBar *)objc_claimAutoreleasedReturnValue();
    searchBar = self->_searchBar;
    self->_searchBar = v17;

    -[UISearchBar setAutocorrectionType:](self->_searchBar, "setAutocorrectionType:", 0);
    -[UISearchBar setDelegate:](self->_searchBar, "setDelegate:", self);
    supportedSearchTypes = self->_supportedSearchTypes;
    EventKitUIBundle();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if ((supportedSearchTypes & 0x600) != 0)
      v22 = CFSTR("Enter Location or Video Call");
    else
      v22 = CFSTR("Enter Location");
    objc_msgSend(v20, "localizedStringForKey:value:table:", v22, &stru_1E601DFA8, 0);
    v84 = (void *)objc_claimAutoreleasedReturnValue();

    -[UISearchBar setPlaceholder:](self->_searchBar, "setPlaceholder:", v84);
    -[UISearchBar setReturnKeyType:](self->_searchBar, "setReturnKeyType:", 9);
    -[UISearchBar setEnablesReturnKeyAutomatically:](self->_searchBar, "setEnablesReturnKeyAutomatically:", 1);
    -[UISearchBar setTextContentType:](self->_searchBar, "setTextContentType:", *MEMORY[0x1E0DC5430]);
    -[UISearchBar setSearchBarStyle:](self->_searchBar, "setSearchBarStyle:", 2);
    v69 = (void *)MEMORY[0x1E0CB3718];
    -[UITableView topAnchor](self->_tableView, "topAnchor");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKLocationEditItemViewController view](self, "view");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "topAnchor");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "constraintEqualToAnchor:", v78);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v91[0] = v76;
    -[UITableView bottomAnchor](self->_tableView, "bottomAnchor");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKLocationEditItemViewController view](self, "view");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "bottomAnchor");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "constraintEqualToAnchor:", v71);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v91[1] = v23;
    -[UITableView leadingAnchor](self->_tableView, "leadingAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKLocationEditItemViewController view](self, "view");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "leadingAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "constraintEqualToAnchor:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v91[2] = v27;
    -[UITableView trailingAnchor](self->_tableView, "trailingAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKLocationEditItemViewController view](self, "view");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "trailingAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "constraintEqualToAnchor:", v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v91[3] = v31;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v91, 4);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "activateConstraints:", v32);

    v33 = v86;
  }
  else
  {
    v34 = objc_alloc_init(EKLocationVirtualConferenceSearchFieldsView);
    searchFieldsView = self->_searchFieldsView;
    self->_searchFieldsView = v34;

    -[EKLocationVirtualConferenceSearchFieldsView setDelegate:](self->_searchFieldsView, "setDelegate:", self);
    -[EKLocationVirtualConferenceSearchFieldsView setTranslatesAutoresizingMaskIntoConstraints:](self->_searchFieldsView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[EKLocationVirtualConferenceSearchFieldsView preferredHeight](self->_searchFieldsView, "preferredHeight");
    v87 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", 0.0, 0.0, 0.0, v36 + 15.0);
    v37 = (_UINavigationBarPalette *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC4290]), "initWithContentView:", v87);
    palette = self->_palette;
    self->_palette = v37;

    -[_UINavigationBarPalette addSubview:](self->_palette, "addSubview:", self->_searchFieldsView);
    v63 = (void *)MEMORY[0x1E0CB3718];
    -[EKLocationVirtualConferenceSearchFieldsView topAnchor](self->_searchFieldsView, "topAnchor");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UINavigationBarPalette safeAreaLayoutGuide](self->_palette, "safeAreaLayoutGuide");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "topAnchor");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "constraintEqualToAnchor:", v81);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    v90[0] = v79;
    -[EKLocationVirtualConferenceSearchFieldsView leadingAnchor](self->_searchFieldsView, "leadingAnchor");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UINavigationBarPalette safeAreaLayoutGuide](self->_palette, "safeAreaLayoutGuide");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "leadingAnchor");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "constraintEqualToAnchor:constant:", v73, 20.0);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v90[1] = v70;
    -[_UINavigationBarPalette safeAreaLayoutGuide](self->_palette, "safeAreaLayoutGuide");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "trailingAnchor");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKLocationVirtualConferenceSearchFieldsView trailingAnchor](self->_searchFieldsView, "trailingAnchor");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "constraintEqualToAnchor:constant:", v66, 20.0);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v90[2] = v65;
    -[_UINavigationBarPalette safeAreaLayoutGuide](self->_palette, "safeAreaLayoutGuide");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "bottomAnchor");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKLocationVirtualConferenceSearchFieldsView bottomAnchor](self->_searchFieldsView, "bottomAnchor");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "constraintEqualToAnchor:constant:", v61, 15.0);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v90[3] = v60;
    -[UITableView topAnchor](self->_tableView, "topAnchor");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKLocationEditItemViewController view](self, "view");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "topAnchor");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "constraintEqualToAnchor:", v57);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v90[4] = v56;
    -[UITableView bottomAnchor](self->_tableView, "bottomAnchor");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKLocationEditItemViewController view](self, "view");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "bottomAnchor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "constraintEqualToAnchor:", v53);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v90[5] = v52;
    -[UITableView leadingAnchor](self->_tableView, "leadingAnchor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKLocationEditItemViewController view](self, "view");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "leadingAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "constraintEqualToAnchor:", v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v90[6] = v41;
    -[UITableView trailingAnchor](self->_tableView, "trailingAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKLocationEditItemViewController view](self, "view");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "trailingAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "constraintEqualToAnchor:", v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v90[7] = v45;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v90, 8);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "activateConstraints:", v46);

    v47 = self->_palette;
    -[EKLocationEditItemViewController navigationItem](self, "navigationItem");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "_setBottomPalette:", v47);

    if (-[EKLocationEditItemViewController conferenceTextFieldSelected](self, "conferenceTextFieldSelected")
      && !-[EKLocationEditItemViewController disableConferenceTextField](self, "disableConferenceTextField"))
    {
      -[EKLocationVirtualConferenceSearchFieldsView virtualConferenceTextField](self->_searchFieldsView, "virtualConferenceTextField");
      v49 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[EKLocationVirtualConferenceSearchFieldsView locationTextField](self->_searchFieldsView, "locationTextField");
      v49 = objc_claimAutoreleasedReturnValue();
    }
    v50 = (void *)v49;
    -[EKLocationVirtualConferenceSearchFieldsView setSelectedTextField:](self->_searchFieldsView, "setSelectedTextField:", v49);

    -[EKLocationVirtualConferenceSearchFieldsView setDisableConferenceTextField:](self->_searchFieldsView, "setDisableConferenceTextField:", -[EKLocationEditItemViewController disableConferenceTextField](self, "disableConferenceTextField"));
    v33 = (void *)v87;
  }

}

void __61__EKLocationEditItemViewController__setupViewsAndConstraints__block_invoke(uint64_t a1, Class aClass)
{
  id v4;

  NSStringFromClass(aClass);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1048), "registerClass:forCellReuseIdentifier:", aClass, v4);

}

- (BOOL)presentModally
{
  return 1;
}

- (void)setSupportedSearchTypes:(unint64_t)a3
{
  self->_supportedSearchTypes = a3;
  -[EKUILocationSearchModel setSupportedSearchTypes:](self->_searchModel, "setSupportedSearchTypes:");
}

- (BOOL)showingTextRow
{
  void *v3;
  void *v4;
  BOOL v5;
  int v6;

  -[EKLocationEditItemViewController searchText](self, "searchText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (LOBYTE(self->_supportedSearchTypes))
    v5 = v3 == 0;
  else
    v5 = 1;
  if (v5)
    LOBYTE(v6) = 0;
  else
    v6 = objc_msgSend(v3, "isEqualToString:", &stru_1E601DFA8) ^ 1;

  return v6;
}

- (BOOL)showingCurrentLocationRow
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;
  BOOL v8;

  EventKitUIBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("Current Location"), &stru_1E601DFA8, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[EKLocationEditItemViewController searchText](self, "searchText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  v7 = v5
    && (objc_msgSend(v5, "isEqualToString:", &stru_1E601DFA8) & 1) == 0
    && objc_msgSend(v4, "compare:options:", v6, 9) == 0;
  v8 = 0;
  if (self->_searchModelCurrentLocation && !v7)
    v8 = self->_supportedSearchTypes & 1;

  return v8;
}

- (BOOL)showAvailableConferenceTypesAsRows
{
  BOOL v2;
  void *v4;
  void *v5;

  if (self->_supportedSearchTypes == 1536)
    return 1;
  -[EKLocationEditItemViewController searchText](self, "searchText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
  {
    v2 = 1;
  }
  else
  {
    -[EKLocationEditItemViewController traitCollection](self, "traitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = EKUIUsesLargeTextLayout(v5);

  }
  return v2;
}

- (void)useAsString:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  if (LOBYTE(self->_supportedSearchTypes))
  {
    -[EKLocationEditItemViewController searchText](self, "searchText", a3);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "length"))
    {
      v4 = (void *)MEMORY[0x1E0CAA158];
      -[EKLocationEditItemViewController searchText](self, "searchText");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "locationWithTitle:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKLocationEditItemViewController setSelectedLocation:](self, "setSelectedLocation:", v6);

    }
    -[EKLocationEditItemViewController searchResignFirstResponder](self, "searchResignFirstResponder");

  }
}

- (void)setSelectedConferenceRoom:(id)a3
{
  id v5;
  EKUILocationSearchModel *searchModel;
  void *v7;
  id v8;

  objc_storeStrong((id *)&self->_selectedConferenceRoom, a3);
  v5 = a3;
  searchModel = self->_searchModel;
  -[EKCalendarItem calendar](self->_calendarItem, "calendar");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "source");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKUILocationSearchModel addConferenceRoomToRecents:fromSource:](searchModel, "addConferenceRoomToRecents:fromSource:", v5, v7);

}

- (id)itemAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  EKStructuredLocationWithImage *searchModelLocationFromMapsURL;
  NSUInteger v11;
  BOOL v12;
  uint64_t v13;
  int64_t v14;
  NSUInteger v15;
  NSUInteger v16;
  uint64_t v17;
  uint64_t v18;
  NSArray *v19;
  uint64_t v20;
  NSArray *searchModelFrequentsSearchResults;
  void *v22;
  void *v23;
  id v24;
  NSUInteger v26;
  uint64_t v27;
  void *v28;
  void *v29;
  int64_t v30;

  v4 = a3;
  if (objc_msgSend(v4, "section") == 2)
  {
    -[NSArray objectAtIndex:](self->_searchModelRecentsSearchResults, "objectAtIndex:", objc_msgSend(v4, "row"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "recent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D0CDF0], "locationForRecent:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
LABEL_3:
    v8 = (void *)v7;
LABEL_4:

LABEL_20:
    v22 = 0;
    goto LABEL_21;
  }
  if (objc_msgSend(v4, "section") != 5)
  {
    if (objc_msgSend(v4, "section") == 4)
    {
      v18 = 1168;
    }
    else
    {
      if (objc_msgSend(v4, "section") != 6)
      {
        if (objc_msgSend(v4, "section") == 1)
        {
          -[NSArray objectAtIndex:](self->_searchModelVirtualConferenceRoomSearchResults, "objectAtIndex:", objc_msgSend(v4, "row"));
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = (void *)MEMORY[0x1E0CAA158];
          objc_msgSend(v6, "title");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "locationWithTitle:", v29);
          v8 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_4;
        }
LABEL_32:
        v22 = 0;
        goto LABEL_33;
      }
      v18 = 1200;
    }
    v19 = *(NSArray **)((char *)&self->super.super.super.super.isa + v18);
    v20 = objc_msgSend(v4, "row");
    searchModelFrequentsSearchResults = v19;
LABEL_18:
    -[NSArray objectAtIndex:](searchModelFrequentsSearchResults, "objectAtIndex:", v20);
    v17 = objc_claimAutoreleasedReturnValue();
    goto LABEL_19;
  }
  v9 = objc_msgSend(v4, "row");
  searchModelLocationFromMapsURL = self->_searchModelLocationFromMapsURL;
  v11 = -[NSArray count](self->_searchModelEventsSearchResults, "count");
  v12 = searchModelLocationFromMapsURL == 0;
  v13 = searchModelLocationFromMapsURL != 0;
  if (v12)
    v14 = v11;
  else
    v14 = v11 + 1;
  v15 = -[NSArray count](self->_searchModelFrequentsSearchResults, "count");
  v16 = -[NSArray count](self->_searchModelMapCompletionSearchResults, "count");
  if (v9 < v13)
  {
    -[EKStructuredLocationWithImage location](self->_searchModelLocationFromMapsURL, "location");
    v17 = objc_claimAutoreleasedReturnValue();
LABEL_19:
    v8 = (void *)v17;
    goto LABEL_20;
  }
  if (v9 < v14)
  {
    -[NSArray objectAtIndex:](self->_searchModelEventsSearchResults, "objectAtIndex:", v9);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "location");
    v7 = objc_claimAutoreleasedReturnValue();
    goto LABEL_3;
  }
  v26 = v16;
  v27 = v15 + v14;
  if (objc_msgSend(v4, "row") < v27)
  {
    searchModelFrequentsSearchResults = self->_searchModelFrequentsSearchResults;
    v20 = v9 - v14;
    goto LABEL_18;
  }
  if (objc_msgSend(v4, "row") >= (uint64_t)(v26 + v27))
    goto LABEL_32;
  v30 = -[NSArray count](self->_searchModelMapCompletionSearchResults, "count");
  if (objc_msgSend(v4, "row") - v27 >= v30)
    goto LABEL_32;
  -[NSArray objectAtIndex:](self->_searchModelMapCompletionSearchResults, "objectAtIndex:", v9 - v27);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_33:
  v8 = 0;
LABEL_21:
  if (v8)
    v23 = v8;
  else
    v23 = v22;
  v24 = v23;

  return v24;
}

- (id)conferenceRoomForRecent:(id)a3
{
  id v4;
  NSMutableDictionary *v5;
  NSMutableDictionary *cachedConferenceRooms;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  EKUIConferenceRoom *v14;
  void *v15;

  v4 = a3;
  if (!self->_cachedConferenceRooms)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v5 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    cachedConferenceRooms = self->_cachedConferenceRooms;
    self->_cachedConferenceRooms = v5;

  }
  -[EKCalendarItem calendar](self->_calendarItem, "calendar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "source");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D0CDF0], "directoryLocationForRecent:onSource:", v4, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v9, "preferredAddress");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "externalID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("%@.%@"), v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableDictionary objectForKey:](self->_cachedConferenceRooms, "objectForKey:", v13);
  v14 = (EKUIConferenceRoom *)objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    v14 = objc_alloc_init(EKUIConferenceRoom);
    -[EKUIConferenceRoom setLocation:](v14, "setLocation:", v9);
    -[EKUIConferenceRoom setAvailability:](v14, "setAvailability:", 0);
    objc_msgSend(v8, "constraints");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIConferenceRoom setSupportsAvailability:](v14, "setSupportsAvailability:", objc_msgSend(v15, "supportsAvailabilityRequests"));

    -[NSMutableDictionary setObject:forKey:](self->_cachedConferenceRooms, "setObject:forKey:", v14, v13);
  }

  return v14;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 7;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6;
  int64_t v7;
  _BOOL4 v8;
  uint64_t v9;
  uint64_t v10;
  _BOOL4 v11;
  NSUInteger v12;
  NSUInteger v13;
  NSUInteger v14;
  NSUInteger v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  int v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  switch(a4)
  {
    case 0:
      LODWORD(v7) = -[EKLocationEditItemViewController showingTextRow](self, "showingTextRow");
      v8 = -[EKLocationEditItemViewController showingCurrentLocationRow](self, "showingCurrentLocationRow");
      v9 = 1;
      if ((_DWORD)v7)
        v9 = 2;
      if (v8)
        v7 = v9;
      else
        v7 = v7;
      break;
    case 1:
      v11 = -[EKLocationEditItemViewController showAvailableConferenceTypesAsRows](self, "showAvailableConferenceTypesAsRows");
      v12 = -[NSArray count](self->_searchModelVirtualConferenceRoomSearchResults, "count");
      if (v11)
        v7 = -[NSArray count](self->_searchModelVirtualConferenceCustomSearchResults, "count") + v12;
      else
        v7 = v12 != 0;
      break;
    case 2:
      v10 = 1176;
      goto LABEL_17;
    case 3:
      v10 = 1208;
      goto LABEL_17;
    case 4:
      v10 = 1168;
      goto LABEL_17;
    case 5:
      v13 = -[NSArray count](self->_searchModelFrequentsSearchResults, "count");
      v14 = -[NSArray count](self->_searchModelEventsSearchResults, "count") + v13;
      v15 = -[NSArray count](self->_searchModelMapCompletionSearchResults, "count");
      if (self->_searchModelLocationFromMapsURL)
        v7 = v14 + v15 + 1;
      else
        v7 = v14 + v15;
      break;
    case 6:
      v10 = 1200;
LABEL_17:
      v7 = objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + v10), "count");
      break;
    default:
      v7 = 0;
      break;
  }
  v16 = (void *)kEKUILogEventEditorHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogEventEditorHandle, OS_LOG_TYPE_DEBUG))
  {
    v17 = v16;
    objc_msgSend((id)objc_opt_class(), "_sectionNameForSection:", a4);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v7);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 138412546;
    v22 = v18;
    v23 = 2112;
    v24 = v19;
    _os_log_impl(&dword_1AF84D000, v17, OS_LOG_TYPE_DEBUG, "Number of rows for section [%@]: [%@]", (uint8_t *)&v21, 0x16u);

  }
  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  int64_t v15;
  NSUInteger v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  id v23;

  v23 = a4;
  if (!-[EKLocationEditItemViewController needsSave](self, "needsSave"))
  {
    -[EKLocationEditItemViewController setNeedsSave:](self, "setNeedsSave:", 1);
    if (objc_msgSend(v23, "section"))
    {
      if (objc_msgSend(v23, "section") == 3)
      {
        -[NSArray objectAtIndex:](self->_searchModelConferenceRoomSearchResults, "objectAtIndex:", objc_msgSend(v23, "row"));
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        -[EKLocationEditItemViewController setSelectedConferenceRoom:](self, "setSelectedConferenceRoom:", v5);
        objc_msgSend(v5, "location");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "displayName");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[EKLocationEditItemViewController setSearchText:](self, "setSearchText:", v7);

LABEL_5:
        -[EKLocationEditItemViewController searchResignFirstResponder](self, "searchResignFirstResponder");
        -[EKEditItemViewController saveAndDismiss](self, "saveAndDismiss");
LABEL_6:

        goto LABEL_20;
      }
      if (objc_msgSend(v23, "section") == 2)
      {
        -[NSArray objectAtIndex:](self->_searchModelRecentsSearchResults, "objectAtIndex:", objc_msgSend(v23, "row"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "recent");
        v5 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(MEMORY[0x1E0D0CDF0], "recentIsDirectoryLocation:", v5))
        {
          -[EKLocationEditItemViewController conferenceRoomForRecent:](self, "conferenceRoomForRecent:", v5);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          -[EKLocationEditItemViewController setSelectedConferenceRoom:](self, "setSelectedConferenceRoom:", v9);
          objc_msgSend(v9, "location");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "displayName");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[EKLocationEditItemViewController setSearchText:](self, "setSearchText:", v11);

          -[EKLocationEditItemViewController searchResignFirstResponder](self, "searchResignFirstResponder");
          -[EKEditItemViewController saveAndDismiss](self, "saveAndDismiss");

          goto LABEL_6;
        }

        v13 = v23;
      }
      else
      {
        v12 = objc_msgSend(v23, "section");
        v13 = v23;
        if (v12 == 1)
        {
          if (-[EKLocationEditItemViewController showAvailableConferenceTypesAsRows](self, "showAvailableConferenceTypesAsRows", v23))
          {
            v14 = objc_msgSend(v23, "row");
            v15 = -[NSArray count](self->_searchModelVirtualConferenceRoomSearchResults, "count");
            v16 = -[NSArray count](self->_searchModelVirtualConferenceCustomSearchResults, "count");
            if (v14 >= v15)
            {
              if (v14 >= (uint64_t)(v16 + v15))
                goto LABEL_20;
              -[NSArray objectAtIndex:](self->_searchModelVirtualConferenceCustomSearchResults, "objectAtIndex:", v14 - v15);
              v5 = (void *)objc_claimAutoreleasedReturnValue();
              -[EKLocationEditItemViewController setSelectedVirtualConference:](self, "setSelectedVirtualConference:", v5);
              goto LABEL_5;
            }
            -[NSArray objectAtIndex:](self->_searchModelVirtualConferenceRoomSearchResults, "objectAtIndex:", v14);
            v17 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            if (-[NSArray count](self->_searchModelVirtualConferenceRoomSearchResults, "count") != 1)
              goto LABEL_20;
            -[NSArray firstObject](self->_searchModelVirtualConferenceRoomSearchResults, "firstObject");
            v17 = objc_claimAutoreleasedReturnValue();
          }
          v5 = (void *)v17;
          -[EKLocationEditItemViewController selectedRoomType:](self, "selectedRoomType:", v17);
          goto LABEL_6;
        }
      }
      -[EKLocationEditItemViewController itemAtIndexPath:](self, "itemAtIndexPath:", v13);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      EKWeakLinkClass();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v18 = v5;
        if (!v18)
          goto LABEL_6;
        v19 = v18;
        objc_msgSend(v18, "address");
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (v20)
        {
          -[EKUILocationSearchModel selectLocation:](self->_searchModel, "selectLocation:", v19);
        }
        else
        {
          objc_msgSend(v19, "title");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[EKLocationEditItemViewController setSearchText:](self, "setSearchText:", v22);

          -[EKLocationEditItemViewController useAsString:](self, "useAsString:", 0);
          -[EKEditItemViewController saveAndDismiss](self, "saveAndDismiss");
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_6;
        v21 = v5;
        if (!v21)
          goto LABEL_6;
        -[EKUILocationSearchModel selectMapSearchCompletion:](self->_searchModel, "selectMapSearchCompletion:", v21);
      }

      goto LABEL_6;
    }
    if (objc_msgSend(v23, "row") || !-[EKLocationEditItemViewController showingTextRow](self, "showingTextRow"))
    {
      if (-[EKLocationEditItemViewController showingCurrentLocationRow](self, "showingCurrentLocationRow"))
        -[EKUILocationSearchModel selectCurrentLocation](self->_searchModel, "selectCurrentLocation");
      else
        NSLog(CFSTR("Unknown row tapped"));
    }
    else
    {
      -[EKLocationEditItemViewController useAsString:](self, "useAsString:", 0);
      -[EKEditItemViewController saveAndDismiss](self, "saveAndDismiss");
    }
  }
LABEL_20:

}

- (BOOL)tableView:(id)a3 wantsHeaderForSection:(int64_t)a4
{
  return a4
      && -[EKLocationEditItemViewController tableView:numberOfRowsInSection:](self, "tableView:numberOfRowsInSection:", a3) > 0;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  NSObject *v9;
  const char *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  int v16;
  int64_t v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  switch(a4)
  {
    case 1:
      EventKitUIBundle();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      v8 = CFSTR("Video Call");
      goto LABEL_10;
    case 2:
      EventKitUIBundle();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      v8 = CFSTR("Recents");
      goto LABEL_10;
    case 3:
      EventKitUIBundle();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      v8 = CFSTR("Conference Rooms");
      goto LABEL_10;
    case 4:
      EventKitUIBundle();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      v8 = CFSTR("Contacts");
      goto LABEL_10;
    case 5:
      EventKitUIBundle();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      v8 = CFSTR("Map Locations");
      goto LABEL_10;
    case 6:
      EventKitUIBundle();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      v8 = CFSTR("Custom Locations");
LABEL_10:
      objc_msgSend(v6, "localizedStringForKey:value:table:", v8, &stru_1E601DFA8, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_15;
    case 7:
      v9 = kEKUILogEventEditorHandle;
      if (!os_log_type_enabled((os_log_t)kEKUILogEventEditorHandle, OS_LOG_TYPE_ERROR))
        goto LABEL_14;
      v16 = 134217984;
      v17 = 7;
      v10 = "Invalid section supplied: [%tu]";
      break;
    default:
      v9 = kEKUILogEventEditorHandle;
      if (!os_log_type_enabled((os_log_t)kEKUILogEventEditorHandle, OS_LOG_TYPE_ERROR))
        goto LABEL_14;
      v16 = 134217984;
      v17 = a4;
      v10 = "Invalid section supplied: [%ld]";
      break;
  }
  _os_log_impl(&dword_1AF84D000, v9, OS_LOG_TYPE_ERROR, v10, (uint8_t *)&v16, 0xCu);
LABEL_14:
  v11 = 0;
LABEL_15:
  v12 = (void *)kEKUILogEventEditorHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogEventEditorHandle, OS_LOG_TYPE_DEBUG))
  {
    v13 = v12;
    objc_msgSend((id)objc_opt_class(), "_sectionNameForSection:", a4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138412546;
    v17 = (int64_t)v11;
    v18 = 2112;
    v19 = v14;
    _os_log_impl(&dword_1AF84D000, v13, OS_LOG_TYPE_DEBUG, "Returning header name [%@] for section [%@]", (uint8_t *)&v16, 0x16u);

  }
  return v11;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  return *MEMORY[0x1E0DC53D8];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_class *v17;
  void *v18;
  uint64_t v19;
  int64_t v20;
  NSUInteger v21;
  void *v22;
  EKLocationEditItemViewController *v23;
  void *v24;
  void *v25;
  void *v26;
  objc_class *v27;
  void *v28;
  EKUILocationSearchModel *searchModel;
  objc_class *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  objc_class *v38;
  uint64_t v39;
  uint64_t v40;
  EKStructuredLocationWithImage *searchModelLocationFromMapsURL;
  NSUInteger v42;
  int64_t v43;
  NSUInteger v44;
  NSUInteger v45;
  EKStructuredLocationWithImage *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  objc_class *v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  NSArray *v60;
  objc_class *v61;
  void *v62;
  void *v63;
  void *v64;
  objc_class *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  uint64_t v70;
  void *v71;
  void *v72;
  void *v73;
  uint64_t v74;
  void *v75;
  void *v76;
  uint64_t v77;
  void *v78;
  void *v79;
  objc_class *v80;
  NSUInteger v81;
  BOOL v82;
  uint64_t v83;
  void *v84;
  NSObject *v85;
  void *v87;
  id v88;
  uint64_t v89;
  EKCalendarItem *calendarItem;
  void *v91;
  void *v92;
  uint64_t v93;
  _QWORD v94[4];
  id v95;
  _BYTE location[12];
  __int16 v97;
  void *v98;
  uint64_t v99;

  v99 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v93 = objc_msgSend(v7, "section");
  switch(v93)
  {
    case 0:
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", v9, v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v7, "row") && -[EKLocationEditItemViewController showingTextRow](self, "showingTextRow"))
      {
        objc_msgSend(v10, "defaultContentConfiguration");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("“%@”"), &stru_1E601DFA8, 0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        v14 = (void *)MEMORY[0x1E0CB3940];
        -[EKLocationEditItemViewController searchText](self, "searchText");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "localizedStringWithFormat:", v13, v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setText:", v16);
        goto LABEL_28;
      }
      if (!-[EKLocationEditItemViewController showingCurrentLocationRow](self, "showingCurrentLocationRow"))
        goto LABEL_32;
      objc_msgSend(v10, "defaultContentConfiguration");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      EventKitUIBundle();
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "localizedStringForKey:value:table:", CFSTR("Current Location"), &stru_1E601DFA8, 0);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setText:", v58);

      -[EKLocationEditItemViewController locationArrowImage](self, "locationArrowImage");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setImage:", v59);

      objc_msgSend(v10, "setContentConfiguration:", v11);
      goto LABEL_31;
    case 1:
      if (-[EKLocationEditItemViewController showAvailableConferenceTypesAsRows](self, "showAvailableConferenceTypesAsRows"))
      {
        v17 = (objc_class *)objc_opt_class();
        NSStringFromClass(v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", v18, v7);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setAccessoryType:", 0);
        v19 = objc_msgSend(v7, "row");
        v20 = -[NSArray count](self->_searchModelVirtualConferenceRoomSearchResults, "count");
        v21 = -[NSArray count](self->_searchModelVirtualConferenceCustomSearchResults, "count");
        if (v19 >= v20)
        {
          v23 = self;
          if (v19 >= (uint64_t)(v21 + v20))
          {
LABEL_54:

            self = v23;
            goto LABEL_61;
          }
          -[NSArray objectAtIndex:](self->_searchModelVirtualConferenceCustomSearchResults, "objectAtIndex:", v19 - v20);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "updateWithCustomVirtualConference:", v22);
        }
        else
        {
          -[NSArray objectAtIndex:](self->_searchModelVirtualConferenceRoomSearchResults, "objectAtIndex:", v19);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = self;
          objc_msgSend(v10, "updateWithRoomType:", v22);
          if (self->_shouldShowCheckedVirtualConference
            && objc_msgSend(v22, "isEqual:", self->_checkedRoomType))
          {
            objc_msgSend(v10, "setAccessoryType:", 3);
          }
        }

        goto LABEL_54;
      }
      v60 = self->_searchModelVirtualConferenceRoomSearchResults;
      if (-[NSArray count](v60, "count") == 1)
      {
        v61 = (objc_class *)objc_opt_class();
        NSStringFromClass(v61);
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", v62, v7);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setAccessoryType:", 0);
        -[NSArray firstObject](v60, "firstObject");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "updateWithRoomType:", v63);

      }
      else
      {
        v80 = (objc_class *)objc_opt_class();
        NSStringFromClass(v80);
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", v62, v7);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setDelegate:", self);
        objc_msgSend(v10, "setRoomTypes:", v60);
      }

      goto LABEL_61;
    case 2:
      -[NSArray objectAtIndex:](self->_searchModelRecentsSearchResults, "objectAtIndex:", objc_msgSend(v7, "row"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "recent");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(MEMORY[0x1E0D0CDF0], "recentIsDirectoryLocation:", v25))
      {
        -[EKLocationEditItemViewController conferenceRoomForRecent:](self, "conferenceRoomForRecent:", v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = (objc_class *)objc_opt_class();
        NSStringFromClass(v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[UITableView dequeueReusableCellWithIdentifier:forIndexPath:](self->_tableView, "dequeueReusableCellWithIdentifier:forIndexPath:", v28, v7);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v26, "supportsAvailability")
          && (objc_msgSend(v26, "availabilityRequestInProgress") & 1) == 0
          && !objc_msgSend(v26, "availability"))
        {
          objc_initWeak((id *)location, self);
          searchModel = self->_searchModel;
          calendarItem = self->_calendarItem;
          v94[0] = MEMORY[0x1E0C809B0];
          v94[1] = 3221225472;
          v94[2] = __68__EKLocationEditItemViewController_tableView_cellForRowAtIndexPath___block_invoke;
          v94[3] = &unk_1E6018A70;
          objc_copyWeak(&v95, (id *)location);
          -[EKUILocationSearchModel updateConferenceRoomAvailability:duringEvent:completionBlock:](searchModel, "updateConferenceRoomAvailability:duringEvent:completionBlock:", v26, calendarItem, v94);
          objc_destroyWeak(&v95);
          objc_destroyWeak((id *)location);
        }
        objc_msgSend(v10, "reloadWithConferenceRoom:", v26);

      }
      else
      {
        objc_msgSend(MEMORY[0x1E0D0CDF0], "locationForRecent:", v25);
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        v65 = (objc_class *)objc_opt_class();
        NSStringFromClass(v65);
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", v92, v7);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "defaultContentConfiguration");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v64, "title");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v66, "setText:", v67);

        objc_msgSend(v64, "address");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v66, "setSecondaryText:", v68);

        objc_msgSend(v66, "secondaryText");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        v70 = objc_msgSend(v69, "length");

        if (v70)
        {
          objc_msgSend((id)objc_opt_class(), "_boldTitleFont");
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v66, "textProperties");
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v72, "setFont:", v71);

        }
        objc_msgSend(v64, "contactLabel");
        v73 = (void *)objc_claimAutoreleasedReturnValue();

        if (v73)
          -[EKLocationEditItemViewController contactsImage](self, "contactsImage");
        else
          objc_msgSend(v24, "image");
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v66, "setImage:", v84);

        objc_msgSend(v10, "setContentConfiguration:", v66);
      }

      goto LABEL_61;
    case 3:
      -[NSArray objectAtIndex:](self->_searchModelConferenceRoomSearchResults, "objectAtIndex:", objc_msgSend(v7, "row"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKLocationEditItemViewController _cellForConferenceRoom:atIndexPath:](self, "_cellForConferenceRoom:atIndexPath:", v9, v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_32;
    case 4:
      v30 = (objc_class *)objc_opt_class();
      NSStringFromClass(v30);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", v9, v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "defaultContentConfiguration");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray objectAtIndex:](self->_searchModelContactsSearchResults, "objectAtIndex:", objc_msgSend(v7, "row"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "contactLabel");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setText:", v31);

      objc_msgSend(v13, "title");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "_stringByReplacingCharactersInSet:withCharacter:", CFCharacterSetGetPredefined(kCFCharacterSetNewline), 32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setSecondaryText:", v33);

      objc_msgSend(v11, "secondaryText");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v34, "length");

      if (v35)
      {
        objc_msgSend((id)objc_opt_class(), "_boldTitleFont");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "textProperties");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "setFont:", v36);

      }
      -[EKLocationEditItemViewController contactsImage](self, "contactsImage");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setImage:", v15);
      goto LABEL_29;
    case 5:
      v38 = (objc_class *)objc_opt_class();
      NSStringFromClass(v38);
      v39 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", v39, v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "defaultContentConfiguration");
      v89 = objc_claimAutoreleasedReturnValue();
      v87 = (void *)v39;
      v88 = v7;
      v40 = objc_msgSend(v7, "row");
      searchModelLocationFromMapsURL = self->_searchModelLocationFromMapsURL;
      v42 = -[NSArray count](self->_searchModelEventsSearchResults, "count");
      if (searchModelLocationFromMapsURL)
        v43 = v42 + 1;
      else
        v43 = v42;
      v44 = -[NSArray count](self->_searchModelFrequentsSearchResults, "count");
      v45 = -[NSArray count](self->_searchModelMapCompletionSearchResults, "count");
      if (v40 < (searchModelLocationFromMapsURL != 0))
      {
        v46 = self->_searchModelLocationFromMapsURL;
        -[EKStructuredLocationWithImage location](v46, "location");
        v7 = v88;
        v47 = v87;
        v48 = (void *)v89;
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "title");
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "address");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        -[EKStructuredLocationWithImage image](v46, "image");
        v51 = objc_claimAutoreleasedReturnValue();
LABEL_44:
        v75 = (void *)v51;

LABEL_45:
        goto LABEL_46;
      }
      v74 = v40 - v43;
      v48 = (void *)v89;
      if (v40 < v43)
      {
        -[NSArray objectAtIndex:](self->_searchModelEventsSearchResults, "objectAtIndex:", v40);
        v7 = v88;
        v47 = v87;
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "location");
        v46 = (EKStructuredLocationWithImage *)objc_claimAutoreleasedReturnValue();
        -[EKStructuredLocationWithImage title](v46, "title");
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        -[EKStructuredLocationWithImage address](v46, "address");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "image");
        v51 = objc_claimAutoreleasedReturnValue();
        goto LABEL_44;
      }
      v81 = v44 + v43;
      v82 = __OFSUB__(v40, v44 + v43);
      v83 = v40 - (v44 + v43);
      if (v83 < 0 != v82)
      {
        -[NSArray objectAtIndex:](self->_searchModelFrequentsSearchResults, "objectAtIndex:", v74);
        v7 = v88;
        v47 = v87;
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "title");
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "address");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        MapPinImage();
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_45;
      }
      if (v40 >= (uint64_t)(v45 + v81))
      {
        v75 = 0;
        v50 = 0;
        v91 = 0;
        v7 = v88;
      }
      else
      {
        v7 = v88;
        if (v83 < (int64_t)-[NSArray count](self->_searchModelMapCompletionSearchResults, "count", v74))
        {
          -[NSArray objectAtIndex:](self->_searchModelMapCompletionSearchResults, "objectAtIndex:", v83);
          v47 = v87;
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "title");
          v91 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "subtitle");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "mapItem");
          v46 = (EKStructuredLocationWithImage *)objc_claimAutoreleasedReturnValue();
          ImageForMapItem(v46);
          v51 = objc_claimAutoreleasedReturnValue();
          goto LABEL_44;
        }
        v75 = 0;
        v50 = 0;
        v91 = 0;
      }
      v47 = v87;
LABEL_46:
      objc_msgSend(v48, "setText:", v91);
      objc_msgSend(v48, "setSecondaryText:", v50);
      objc_msgSend(v48, "setImage:", v75);
      objc_msgSend(v48, "secondaryText");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      v77 = objc_msgSend(v76, "length");

      if (v77)
      {
        objc_msgSend((id)objc_opt_class(), "_boldTitleFont");
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "textProperties");
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v79, "setFont:", v78);

      }
      objc_msgSend(v10, "setContentConfiguration:", v48);

LABEL_61:
      if (!objc_msgSend(v10, "accessoryType"))
        objc_msgSend(v10, "setAccessoryType:", -[EKLocationEditItemViewController _accessoryTypeForSection:](self, "_accessoryTypeForSection:", v93));
      v85 = kEKUILogEventEditorHandle;
      if (os_log_type_enabled((os_log_t)kEKUILogEventEditorHandle, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)location = 138412546;
        *(_QWORD *)&location[4] = v7;
        v97 = 2112;
        v98 = v10;
        _os_log_impl(&dword_1AF84D000, v85, OS_LOG_TYPE_DEBUG, "Returning cell for index path [%@]: [%@]", location, 0x16u);
      }

      return v10;
    case 6:
      v52 = (objc_class *)objc_opt_class();
      NSStringFromClass(v52);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", v9, v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "defaultContentConfiguration");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray objectAtIndex:](self->_searchModelTextualSearchResults, "objectAtIndex:", objc_msgSend(v7, "row"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "title");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setText:", v53);

      objc_msgSend(v13, "address");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setSecondaryText:", v54);

      objc_msgSend(v11, "secondaryText");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = objc_msgSend(v55, "length");

      if (!v56)
        goto LABEL_30;
      objc_msgSend((id)objc_opt_class(), "_boldTitleFont");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "textProperties");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setFont:", v15);
LABEL_28:

LABEL_29:
LABEL_30:
      objc_msgSend(v10, "setContentConfiguration:", v11);

LABEL_31:
LABEL_32:

      goto LABEL_61;
    case 7:
      v10 = (void *)objc_opt_new();
      goto LABEL_61;
    default:
      v10 = 0;
      goto LABEL_61;
  }
}

void __68__EKLocationEditItemViewController_tableView_cellForRowAtIndexPath___block_invoke(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__EKLocationEditItemViewController_tableView_cellForRowAtIndexPath___block_invoke_2;
  block[3] = &unk_1E6018A70;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(&v2);
}

void __68__EKLocationEditItemViewController_tableView_cellForRowAtIndexPath___block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  id *v2;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained[131], "reloadData");
    WeakRetained = v2;
  }

}

- (void)tableView:(id)a3 accessoryButtonTappedForRowWithIndexPath:(id)a4
{
  id v5;
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
  void *v35;
  void *v36;
  _QWORD v37[6];

  v37[4] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  -[EKLocationEditItemViewController itemAtIndexPath:](self, "itemAtIndexPath:", v5);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKLocationEditItemViewController _rowNameForIndexPath:](self, "_rowNameForIndexPath:", v5);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Row name: %@\n\nData description:\n%@"), v35, v36);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MEMORY[0x1E0DC3990]);
  objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v6, "setNumberOfLines:", 0);
  objc_msgSend(v6, "setText:", v33);
  v7 = objc_alloc_init(MEMORY[0x1E0DC3F20]);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setBackgroundColor:", v8);

  objc_msgSend(v7, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addSubview:", v6);

  v23 = (void *)MEMORY[0x1E0CB3718];
  objc_msgSend(v7, "view");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "layoutMarginsGuide");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "leadingAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "leadingAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "constraintEqualToAnchor:", v29);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = v28;
  objc_msgSend(v7, "view");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "layoutMarginsGuide");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "trailingAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "trailingAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "constraintEqualToAnchor:", v24);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v37[1] = v22;
  objc_msgSend(v7, "view");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "layoutMarginsGuide");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "topAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "topAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintEqualToAnchor:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v37[2] = v12;
  objc_msgSend(v7, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "layoutMarginsGuide");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "bottomAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bottomAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "constraintEqualToAnchor:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v37[3] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "activateConstraints:", v18);

  -[EKLocationEditItemViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v7, 1, 0);
}

- (int64_t)_accessoryTypeForSection:(unint64_t)a3
{
  BOOL v4;
  int64_t v5;

  if (_accessoryTypeForSection__onceToken != -1)
    dispatch_once(&_accessoryTypeForSection__onceToken, &__block_literal_global_36);
  v4 = a3 == 2 || a3 == 5;
  v5 = 4;
  if (!v4)
    v5 = 0;
  if (_accessoryTypeForSection__showsAccessoryButtons)
    return v5;
  else
    return 0;
}

void __61__EKLocationEditItemViewController__accessoryTypeForSection___block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0D0CDE0], "sharedPreferences");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  _accessoryTypeForSection__showsAccessoryButtons = objc_msgSend(v0, "debugLocationSearchResults");

}

+ (id)_boldTitleFont
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *MEMORY[0x1E0DC4A88], 2, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v2, 0.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  return objc_msgSend(a4, "section", a3) == 2;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  void *v6;
  void *v7;
  id v8;

  v8 = a5;
  if (objc_msgSend(v8, "section") == 2)
  {
    -[NSArray objectAtIndex:](self->_searchModelRecentsSearchResults, "objectAtIndex:", objc_msgSend(v8, "row"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "recent");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[EKUILocationSearchModel removeRecentLocation:](self->_searchModel, "removeRecentLocation:", v7);
  }

}

- (id)locationArrowImage
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0DC3888];
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v3;
  objc_msgSend(MEMORY[0x1E0DC3658], "systemGray4Color");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_configurationWithHierarchicalColors:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0DC3888];
  objc_msgSend(MEMORY[0x1E0CAA038], "conferenceImageSize");
  objc_msgSend(v7, "configurationWithPointSize:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "configurationByApplyingConfiguration:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", CFSTR("location.circle.fill"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)contactsImage
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x1E0DC3888];
  objc_msgSend(MEMORY[0x1E0CAA038], "conferenceImageSize");
  objc_msgSend(v2, "configurationWithPointSize:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", CFSTR("person.crop.circle.fill"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "imageWithTintColor:renderingMode:", v5, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)locationSearchModel:(id)a3 selectedLocation:(id)a4 withError:(id)a5
{
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
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[5];
  _QWORD v28[5];

  v7 = a4;
  v8 = v7;
  if (!v7 || a5)
  {
    v12 = (void *)MEMORY[0x1E0DC3450];
    EventKitUIBundle();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("Address Not Recognized"), &stru_1E601DFA8, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    EventKitUIBundle();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("The address could not be located. If you use this address you won’t be able to get maps, travel time, or time to leave alerts."), &stru_1E601DFA8, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "alertControllerWithTitle:message:preferredStyle:", v14, v16, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = (void *)MEMORY[0x1E0DC3448];
    EventKitUIBundle();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("Use Anyway"), &stru_1E601DFA8, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = MEMORY[0x1E0C809B0];
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __83__EKLocationEditItemViewController_locationSearchModel_selectedLocation_withError___block_invoke;
    v28[3] = &unk_1E60185C0;
    v28[4] = self;
    objc_msgSend(v18, "actionWithTitle:style:handler:", v20, 0, v28);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addAction:", v22);

    v23 = (void *)MEMORY[0x1E0DC3448];
    EventKitUIBundle();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("Cancel - location search model - selected location"), CFSTR("Cancel"), 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v21;
    v27[1] = 3221225472;
    v27[2] = __83__EKLocationEditItemViewController_locationSearchModel_selectedLocation_withError___block_invoke_2;
    v27[3] = &unk_1E60185C0;
    v27[4] = self;
    objc_msgSend(v23, "actionWithTitle:style:handler:", v25, 0, v27);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addAction:", v26);

    -[EKLocationEditItemViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v17, 1, 0);
  }
  else
  {
    objc_msgSend(v7, "title");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      objc_msgSend(v8, "address");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setTitle:", v10);

    }
    -[EKLocationEditItemViewController setSelectedLocation:](self, "setSelectedLocation:", v8);
    objc_msgSend(v8, "title");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKLocationEditItemViewController setSearchText:](self, "setSearchText:", v11);

    -[EKLocationEditItemViewController searchResignFirstResponder](self, "searchResignFirstResponder");
    -[EKEditItemViewController saveAndDismiss](self, "saveAndDismiss");
  }

}

void __83__EKLocationEditItemViewController_locationSearchModel_selectedLocation_withError___block_invoke(uint64_t a1)
{
  id *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  id v14;

  v2 = *(id **)(a1 + 32);
  objc_msgSend(v2[131], "indexPathForSelectedRow");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "itemAtIndexPath:", v3);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  v4 = v14;
  if (v14)
  {
    EKWeakLinkClass();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v14;
      v6 = 0;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v5 = 0;
        v6 = 0;
        goto LABEL_10;
      }
      v6 = v14;
      v7 = (void *)MEMORY[0x1E0CAA158];
      objc_msgSend(v6, "displayLines");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectAtIndex:", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "locationWithTitle:", v9);
      v5 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "displayLines");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "count");

      if (v11 >= 2)
      {
        objc_msgSend(v6, "displayLines");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectAtIndex:", 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setAddress:", v13);

      }
      if (!v5)
        goto LABEL_10;
    }
    objc_msgSend(*(id *)(a1 + 32), "setSelectedLocation:", v5);
    objc_msgSend(*(id *)(a1 + 32), "searchResignFirstResponder");
    objc_msgSend(*(id *)(a1 + 32), "saveAndDismiss");
LABEL_10:

    v4 = v14;
  }

}

void __83__EKLocationEditItemViewController_locationSearchModel_selectedLocation_withError___block_invoke_2(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 1048);
  objc_msgSend(v1, "indexPathForSelectedRow");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "deselectRowAtIndexPath:animated:", v2, 1);

}

- (id)calendarItemForSearchModel:(id)a3
{
  return self->_calendarItem;
}

- (BOOL)shouldIncludeConferenceRoom:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  BOOL v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  EKLocationEditItemViewController *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;

  v4 = a3;
  objc_msgSend(v4, "location");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "displayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKUILocationRowModel location](self->_locationViewModel, "location");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "title");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "isEqualToString:", v8);

  v10 = 1;
  if ((v9 & 1) == 0)
  {
    v17 = 0;
    v18 = &v17;
    v19 = 0x2020000000;
    v20 = 1;
    -[EKCalendarItem attendees](self->_calendarItem, "attendees");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __64__EKLocationEditItemViewController_shouldIncludeConferenceRoom___block_invoke;
    v13[3] = &unk_1E601ADD8;
    v14 = v4;
    v15 = self;
    v16 = &v17;
    objc_msgSend(v11, "enumerateObjectsUsingBlock:", v13);

    v10 = *((_BYTE *)v18 + 24) != 0;
    _Block_object_dispose(&v17, 8);
  }

  return v10;
}

void __64__EKLocationEditItemViewController_shouldIncludeConferenceRoom___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  BOOL v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  id v15;

  v15 = a2;
  v6 = objc_msgSend(v15, "participantType") == 2;
  v7 = v15;
  if (v6)
  {
    objc_msgSend(v15, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "location");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "displayName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v8, "isEqualToString:", v10) & 1) != 0)
    {
      objc_msgSend(v15, "name");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1248), "location");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "title");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v11, "isEqualToString:", v13);

      v7 = v15;
      if ((v14 & 1) == 0)
      {
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
        *a4 = 1;
      }
    }
    else
    {

      v7 = v15;
    }
  }

}

- (void)locationSearchModel:(id)a3 updatedSearchTypes:(unint64_t)a4
{
  __int16 v4;
  id v6;
  void *v7;
  void *v8;
  EKStructuredLocation *v9;
  EKStructuredLocation *searchModelCurrentLocation;
  void *v11;
  NSArray *v12;
  NSArray *searchModelMapCompletionSearchResults;
  EKStructuredLocationWithImage *v14;
  EKStructuredLocationWithImage *searchModelLocationFromMapsURL;
  void *v16;
  NSArray *v17;
  NSArray *searchModelContactsSearchResults;
  void *v19;
  NSArray *v20;
  NSArray *searchModelRecentsSearchResults;
  void *v22;
  NSArray *v23;
  NSArray *searchModelFrequentsSearchResults;
  void *v25;
  NSArray *v26;
  NSArray *searchModelEventsSearchResults;
  void *v28;
  NSArray *v29;
  NSArray *searchModelTextualSearchResults;
  void *v31;
  NSArray *v32;
  NSArray *searchModelConferenceRoomSearchResults;
  void *v34;
  NSArray *v35;
  NSArray *searchModelVirtualConferenceRoomSearchResults;
  void *v37;
  _BOOL4 shouldShowCheckedVirtualConference;
  void *v39;
  void *v40;
  NSArray *v41;
  void *v42;
  NSArray *v43;
  NSArray *searchModelVirtualConferenceCustomSearchResults;
  _QWORD v45[5];

  v4 = a4;
  v6 = a3;
  v7 = v6;
  if ((v4 & 1) != 0)
  {
    objc_msgSend(v6, "currentLocation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (EKStructuredLocation *)objc_msgSend(v8, "copy");
    searchModelCurrentLocation = self->_searchModelCurrentLocation;
    self->_searchModelCurrentLocation = v9;

    if ((v4 & 4) == 0)
    {
LABEL_3:
      if ((v4 & 2) == 0)
        goto LABEL_4;
      goto LABEL_14;
    }
  }
  else if ((v4 & 4) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v7, "mapCompletionSearchResults");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (NSArray *)objc_msgSend(v11, "copy");
  searchModelMapCompletionSearchResults = self->_searchModelMapCompletionSearchResults;
  self->_searchModelMapCompletionSearchResults = v12;

  if ((v4 & 2) == 0)
  {
LABEL_4:
    if ((v4 & 8) == 0)
      goto LABEL_5;
    goto LABEL_15;
  }
LABEL_14:
  objc_msgSend(v7, "locationFromMapsURL");
  v14 = (EKStructuredLocationWithImage *)objc_claimAutoreleasedReturnValue();
  searchModelLocationFromMapsURL = self->_searchModelLocationFromMapsURL;
  self->_searchModelLocationFromMapsURL = v14;

  if ((v4 & 8) == 0)
  {
LABEL_5:
    if ((v4 & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_16;
  }
LABEL_15:
  objc_msgSend(v7, "contactsSearchResults");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (NSArray *)objc_msgSend(v16, "copy");
  searchModelContactsSearchResults = self->_searchModelContactsSearchResults;
  self->_searchModelContactsSearchResults = v17;

  if ((v4 & 0x10) == 0)
  {
LABEL_6:
    if ((v4 & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_17;
  }
LABEL_16:
  objc_msgSend(v7, "recentsSearchResults");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (NSArray *)objc_msgSend(v19, "copy");
  searchModelRecentsSearchResults = self->_searchModelRecentsSearchResults;
  self->_searchModelRecentsSearchResults = v20;

  if ((v4 & 0x20) == 0)
  {
LABEL_7:
    if ((v4 & 0x40) == 0)
      goto LABEL_8;
    goto LABEL_18;
  }
LABEL_17:
  objc_msgSend(v7, "frequentsSearchResults");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (NSArray *)objc_msgSend(v22, "copy");
  searchModelFrequentsSearchResults = self->_searchModelFrequentsSearchResults;
  self->_searchModelFrequentsSearchResults = v23;

  if ((v4 & 0x40) == 0)
  {
LABEL_8:
    if ((v4 & 0x80) == 0)
      goto LABEL_9;
    goto LABEL_19;
  }
LABEL_18:
  objc_msgSend(v7, "eventsSearchResults");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (NSArray *)objc_msgSend(v25, "copy");
  searchModelEventsSearchResults = self->_searchModelEventsSearchResults;
  self->_searchModelEventsSearchResults = v26;

  if ((v4 & 0x80) == 0)
  {
LABEL_9:
    if ((v4 & 0x100) == 0)
      goto LABEL_10;
    goto LABEL_20;
  }
LABEL_19:
  objc_msgSend(v7, "textualSearchResults");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (NSArray *)objc_msgSend(v28, "copy");
  searchModelTextualSearchResults = self->_searchModelTextualSearchResults;
  self->_searchModelTextualSearchResults = v29;

  if ((v4 & 0x100) == 0)
  {
LABEL_10:
    if ((v4 & 0x200) == 0)
      goto LABEL_24;
    goto LABEL_21;
  }
LABEL_20:
  objc_msgSend(v7, "conferenceRoomSearchResults");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (NSArray *)objc_msgSend(v31, "copy");
  searchModelConferenceRoomSearchResults = self->_searchModelConferenceRoomSearchResults;
  self->_searchModelConferenceRoomSearchResults = v32;

  if ((v4 & 0x200) == 0)
    goto LABEL_24;
LABEL_21:
  objc_msgSend(v7, "virtualConferenceRoomSearchResults");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = (NSArray *)objc_msgSend(v34, "copy");
  searchModelVirtualConferenceRoomSearchResults = self->_searchModelVirtualConferenceRoomSearchResults;
  self->_searchModelVirtualConferenceRoomSearchResults = v35;

  -[EKUILocationRowModel conference](self->_conferenceViewModel, "conference");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  if (v37)
  {
    shouldShowCheckedVirtualConference = self->_shouldShowCheckedVirtualConference;

    if (shouldShowCheckedVirtualConference)
    {
      v39 = (void *)MEMORY[0x1E0CAA038];
      -[EKUILocationRowModel conference](self->_conferenceViewModel, "conference");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = self->_searchModelVirtualConferenceRoomSearchResults;
      v45[0] = MEMORY[0x1E0C809B0];
      v45[1] = 3221225472;
      v45[2] = __75__EKLocationEditItemViewController_locationSearchModel_updatedSearchTypes___block_invoke;
      v45[3] = &unk_1E601AE00;
      v45[4] = self;
      objc_msgSend(v39, "virtualConference:likelyCameFromRoomTypes:completionHandler:", v40, v41, v45);

    }
  }
LABEL_24:
  if ((v4 & 0x400) != 0)
  {
    objc_msgSend(v7, "virtualConferenceCustomSearchResults");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = (NSArray *)objc_msgSend(v42, "copy");
    searchModelVirtualConferenceCustomSearchResults = self->_searchModelVirtualConferenceCustomSearchResults;
    self->_searchModelVirtualConferenceCustomSearchResults = v43;

  }
  -[UITableView reloadData](self->_tableView, "reloadData");

}

void __75__EKLocationEditItemViewController_locationSearchModel_updatedSearchTypes___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[5];
  id v6;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __75__EKLocationEditItemViewController_locationSearchModel_updatedSearchTypes___block_invoke_2;
  v5[3] = &unk_1E6018EC0;
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

}

uint64_t __75__EKLocationEditItemViewController_locationSearchModel_updatedSearchTypes___block_invoke_2(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 1096), *(id *)(a1 + 40));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1048), "reloadData");
}

+ (id)_sectionNameForSection:(unint64_t)a3
{
  if (a3 > 7)
    return CFSTR("Unknown");
  else
    return off_1E601AE48[a3];
}

- (id)_rowNameForIndexPath:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  EKStructuredLocationWithImage *searchModelLocationFromMapsURL;
  NSUInteger v8;
  uint64_t v9;
  int64_t v10;
  NSUInteger v11;
  NSUInteger v12;
  const __CFString *v13;
  NSUInteger v14;
  id v15;
  void *v16;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "_sectionNameForSection:", objc_msgSend(v4, "section"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "section") != 5)
    goto LABEL_14;
  v6 = objc_msgSend(v4, "row");
  searchModelLocationFromMapsURL = self->_searchModelLocationFromMapsURL;
  v8 = -[NSArray count](self->_searchModelEventsSearchResults, "count");
  v9 = searchModelLocationFromMapsURL != 0;
  if (searchModelLocationFromMapsURL)
    v10 = v8 + 1;
  else
    v10 = v8;
  v11 = -[NSArray count](self->_searchModelFrequentsSearchResults, "count");
  v12 = -[NSArray count](self->_searchModelMapCompletionSearchResults, "count");
  if (v6 >= v9)
  {
    if (v6 < v10)
    {
      v13 = CFSTR("Events Search Results");
      goto LABEL_13;
    }
    v14 = v12;
    if (objc_msgSend(v4, "row") < (uint64_t)(v11 + v10))
    {
      v13 = CFSTR("Frequents Search Results");
      goto LABEL_13;
    }
    if (objc_msgSend(v4, "row") < (uint64_t)(v14 + v11 + v10))
    {
      v13 = CFSTR("Map Search Results");
      goto LABEL_13;
    }
LABEL_14:
    v15 = v5;
    goto LABEL_15;
  }
  v13 = CFSTR("Maps URL");
LABEL_13:
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ - %@"), v5, v13);
  v15 = (id)objc_claimAutoreleasedReturnValue();
LABEL_15:
  v16 = v15;

  return v16;
}

- (id)_cellForConferenceRoom:(id)a3 atIndexPath:(id)a4
{
  id v6;
  id v7;
  objc_class *v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITableView dequeueReusableCellWithIdentifier:forIndexPath:](self->_tableView, "dequeueReusableCellWithIdentifier:forIndexPath:", v9, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "reloadWithConferenceRoom:", v7);
  return v10;
}

- (BOOL)wantsManagement
{
  return 1;
}

- (BOOL)canManagePresentationStyle
{
  return 1;
}

- (BOOL)locationViewModelRemoved
{
  EKLocationVirtualConferenceSearchFieldsView *searchFieldsView;
  void *v4;
  void *v5;
  BOOL v6;

  searchFieldsView = self->_searchFieldsView;
  if (!searchFieldsView)
    return 0;
  -[EKLocationVirtualConferenceSearchFieldsView locationTextField](searchFieldsView, "locationTextField");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = !objc_msgSend(v5, "length") && !self->_selectedConferenceRoom && self->_selectedLocation == 0;

  return v6;
}

- (BOOL)conferenceViewModelRemoved
{
  EKLocationVirtualConferenceSearchFieldsView *searchFieldsView;
  void *v4;
  void *v5;
  BOOL v6;

  searchFieldsView = self->_searchFieldsView;
  if (!searchFieldsView)
    return 0;
  -[EKLocationVirtualConferenceSearchFieldsView virtualConferenceTextField](searchFieldsView, "virtualConferenceTextField");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "length"))
    v6 = 0;
  else
    v6 = self->_selectedVirtualConference == 0;

  return v6;
}

- (BOOL)_singleSearchBar
{
  return self->_supportedSearchTypes == 2047 || self->_forceSingleTextField;
}

- (id)_focusedTextField
{
  if (self->_searchFieldsView)
    -[EKLocationVirtualConferenceSearchFieldsView selectedTextField](self->_searchFieldsView, "selectedTextField");
  else
    -[UISearchBar searchTextField](self->_searchBar, "searchTextField");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setSearchText:(id)a3
{
  EKLocationVirtualConferenceSearchFieldsView *searchFieldsView;
  id v4;
  UISearchBar *searchBar;
  id v6;

  searchFieldsView = self->_searchFieldsView;
  if (searchFieldsView)
  {
    v4 = a3;
    -[EKLocationVirtualConferenceSearchFieldsView selectedTextField](searchFieldsView, "selectedTextField");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setText:", v4);

  }
  else
  {
    searchBar = self->_searchBar;
    v6 = a3;
    -[UISearchBar setText:](searchBar, "setText:");
  }

}

- (id)searchText
{
  void *v2;
  void *v3;

  if (self->_searchFieldsView)
  {
    -[EKLocationVirtualConferenceSearchFieldsView selectedTextField](self->_searchFieldsView, "selectedTextField");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "text");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[UISearchBar text](self->_searchBar, "text");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (BOOL)searchIsFirstResponder
{
  void *v2;
  char v3;

  if (!self->_searchFieldsView)
    return -[UISearchBar isFirstResponder](self->_searchBar, "isFirstResponder");
  -[EKLocationVirtualConferenceSearchFieldsView selectedTextField](self->_searchFieldsView, "selectedTextField");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isFirstResponder");

  return v3;
}

- (void)searchResignFirstResponder
{
  id v2;

  if (self->_searchFieldsView)
  {
    -[EKLocationVirtualConferenceSearchFieldsView selectedTextField](self->_searchFieldsView, "selectedTextField");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "resignFirstResponder");

  }
  else
  {
    -[UISearchBar resignFirstResponder](self->_searchBar, "resignFirstResponder");
  }
}

- (void)searchBecomeFirstResponder
{
  id v2;

  if (self->_searchFieldsView)
  {
    -[EKLocationVirtualConferenceSearchFieldsView selectedTextField](self->_searchFieldsView, "selectedTextField");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "becomeFirstResponder");

  }
  else
  {
    -[UISearchBar becomeFirstResponder](self->_searchBar, "becomeFirstResponder");
  }
}

- (void)kickoffSearchTextChangedIfNonEmpty
{
  void *v3;
  uint64_t v4;
  id v5;

  -[EKLocationEditItemViewController searchText](self, "searchText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (v4)
  {
    -[EKLocationEditItemViewController searchText](self, "searchText");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[EKLocationEditItemViewController searchTextChanged:allowClearingCheckedVirtualConference:](self, "searchTextChanged:allowClearingCheckedVirtualConference:", v5, 0);

  }
}

- (void)searchTextChanged:(id)a3
{
  -[EKLocationEditItemViewController searchTextChanged:allowClearingCheckedVirtualConference:](self, "searchTextChanged:allowClearingCheckedVirtualConference:", a3, 1);
}

- (void)searchTextChanged:(id)a3 allowClearingCheckedVirtualConference:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  EKUILocationSearchModel *searchModel;
  id v10;
  EKUILocationSearchModel *v11;
  void *v12;
  NSObject *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v4 = a4;
  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (v4)
  {
    -[EKLocationEditItemViewController _focusedTextField](self, "_focusedTextField");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKLocationVirtualConferenceSearchFieldsView virtualConferenceTextField](self->_searchFieldsView, "virtualConferenceTextField");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7 == v8)
      self->_shouldShowCheckedVirtualConference = 0;
  }
  if (!-[EKLocationEditItemViewController needsSave](self, "needsSave"))
  {
    if (self->_supportsStructuredLocations)
    {
      if (!v6 || objc_msgSend(v6, "isEqualToString:", &stru_1E601DFA8))
      {
        -[EKUILocationSearchModel cancelSearch](self->_searchModel, "cancelSearch");
        -[EKLocationEditItemViewController setSelectedLocation:](self, "setSelectedLocation:", 0);
        -[EKUILocationSearchModel updateRecents:](self->_searchModel, "updateRecents:", 0);
        searchModel = self->_searchModel;
        v10 = 0;
LABEL_14:
        -[EKUILocationSearchModel updateVirtualConferenceRoomOptions:](searchModel, "updateVirtualConferenceRoomOptions:", v10);
        goto LABEL_18;
      }
      -[EKLocationEditItemViewController searchText](self, "searchText");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = kEKUILogEventEditorHandle;
      if (os_log_type_enabled((os_log_t)kEKUILogEventEditorHandle, OS_LOG_TYPE_DEBUG))
      {
        v14 = 138412290;
        v15 = v12;
        _os_log_impl(&dword_1AF84D000, v13, OS_LOG_TYPE_DEBUG, "Beginning search for term: [%@]", (uint8_t *)&v14, 0xCu);
      }
      -[EKUILocationSearchModel beginSearchForTerm:](self->_searchModel, "beginSearchForTerm:", v12);

    }
    else
    {
      -[UITableView reloadData](self->_tableView, "reloadData");
      if ((self->_supportedSearchTypes & 0x200) != 0)
      {
        v11 = self->_searchModel;
        if (objc_msgSend(v6, "length"))
          v10 = v6;
        else
          v10 = 0;
        searchModel = v11;
        goto LABEL_14;
      }
    }
  }
LABEL_18:

}

- (void)searchDoneTapped
{
  EKLocationEditItemViewController *v2;
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  EKLocationEditItemViewController *v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  NSArray *obj;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v2 = self;
  v29 = *MEMORY[0x1E0C80C00];
  -[EKLocationEditItemViewController setNeedsSave:](self, "setNeedsSave:", 1);
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v3 = v2->_searchModelVirtualConferenceCustomSearchResults;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (!v4)
  {

    v6 = 0;
LABEL_14:
    -[EKLocationEditItemViewController useAsString:](v2, "useAsString:", 0);
    goto LABEL_15;
  }
  v5 = v4;
  v6 = 0;
  v22 = 0;
  v7 = *(_QWORD *)v25;
  obj = v3;
  do
  {
    for (i = 0; i != v5; ++i)
    {
      if (*(_QWORD *)v25 != v7)
        objc_enumerationMutation(obj);
      v9 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
      objc_msgSend(v9, "joinMethods");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "firstObject");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "URL");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "absoluteString");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v2;
      -[EKLocationEditItemViewController searchText](v2, "searchText");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v13, "rangeOfString:", v15);

      if (v16 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v17 = v9;

        v22 = 1;
        v6 = v17;
      }

      v2 = v14;
    }
    v5 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  }
  while (v5);

  if ((v22 & 1) == 0)
    goto LABEL_14;
  v18 = (void *)MEMORY[0x1E0D0C288];
  objc_msgSend(v6, "joinMethods");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "firstObject");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "URL");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v18) = objc_msgSend(v18, "isPreferredURL:", v21);

  if (!(_DWORD)v18)
    goto LABEL_14;
  -[EKLocationEditItemViewController setSelectedVirtualConference:](v14, "setSelectedVirtualConference:", v6);
  -[EKLocationEditItemViewController searchResignFirstResponder](v14, "searchResignFirstResponder");
LABEL_15:
  -[EKEditItemViewController saveAndDismiss](v2, "saveAndDismiss");

}

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
  -[EKLocationEditItemViewController searchTextChanged:](self, "searchTextChanged:", a4);
}

- (void)textField:(id)a3 didChange:(id)a4
{
  -[EKLocationEditItemViewController searchTextChanged:](self, "searchTextChanged:", a4);
}

- (void)selectedTextFieldChanged:(id)a3
{
  EKUILocationSearchModel *searchModel;
  id v5;
  id v6;
  uint64_t v7;
  unint64_t supportedSearchTypes;

  searchModel = self->_searchModel;
  v5 = a3;
  -[EKUILocationSearchModel cancelSearch](searchModel, "cancelSearch");
  -[EKLocationVirtualConferenceSearchFieldsView locationTextField](self->_searchFieldsView, "locationTextField");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v5)
    v7 = 511;
  else
    v7 = 1536;
  -[EKLocationEditItemViewController setSupportedSearchTypes:](self, "setSupportedSearchTypes:", v7);
  if (self->_supportsStructuredLocations)
  {
    supportedSearchTypes = self->_supportedSearchTypes;
    if ((supportedSearchTypes & 1) != 0)
    {
      -[EKUILocationSearchModel getCurrentLocation](self->_searchModel, "getCurrentLocation");
      supportedSearchTypes = self->_supportedSearchTypes;
    }
    if ((supportedSearchTypes & 0x10) != 0)
      -[EKUILocationSearchModel updateRecents:](self->_searchModel, "updateRecents:", 0);
  }
  if ((self->_supportedSearchTypes & 0x200) != 0)
    -[EKUILocationSearchModel updateVirtualConferenceRoomOptions:](self->_searchModel, "updateVirtualConferenceRoomOptions:", 0);
  -[EKLocationEditItemViewController locationSearchModel:updatedSearchTypes:](self, "locationSearchModel:updatedSearchTypes:", self->_searchModel, 2047);
  -[EKLocationEditItemViewController kickoffSearchTextChangedIfNonEmpty](self, "kickoffSearchTextChangedIfNonEmpty");
}

- (void)selectedRoomType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[5];

  v4 = a3;
  -[EKLocationEditItemViewController setNeedsSave:](self, "setNeedsSave:", 1);
  -[EKUILocationSearchModel selectVirtualConferenceRoomType:](self->_searchModel, "selectVirtualConferenceRoomType:", v4);
  v5 = (void *)MEMORY[0x1E0CAA190];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __53__EKLocationEditItemViewController_selectedRoomType___block_invoke;
  v7[3] = &unk_1E601AE28;
  v7[4] = self;
  dispatch_get_global_queue(2, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "virtualConferenceForRoomType:completion:queue:", v4, v7, v6);

  -[EKLocationEditItemViewController setPendingVirtualConference:](self, "setPendingVirtualConference:", 1);
  -[EKEditItemViewController saveAndDismiss](self, "saveAndDismiss");
  -[EKLocationEditItemViewController searchResignFirstResponder](self, "searchResignFirstResponder");
}

void __53__EKLocationEditItemViewController_selectedRoomType___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD block[5];
  id v10;
  id v11;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__EKLocationEditItemViewController_selectedRoomType___block_invoke_2;
  block[3] = &unk_1E6018660;
  block[4] = *(_QWORD *)(a1 + 32);
  v10 = v5;
  v11 = v6;
  v7 = v6;
  v8 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __53__EKLocationEditItemViewController_selectedRoomType___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "setPendingVirtualConference:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setSelectedVirtualConference:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "setPendingVirtualConferenceError:", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "editDelegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "editItemPendingVideoConferenceCompleted:", *(_QWORD *)(a1 + 32));

}

- (void)pendingVideoConferenceUpdated:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];

  v4 = a3;
  if (v4)
  {
    -[EKLocationEditItemViewController setSelectedVirtualConference:](self, "setSelectedVirtualConference:", v4);
    v5 = (void *)MEMORY[0x1E0D0CD38];
    objc_msgSend(v4, "joinMethods");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __66__EKLocationEditItemViewController_pendingVideoConferenceUpdated___block_invoke;
    v9[3] = &unk_1E6018940;
    v9[4] = self;
    objc_msgSend(v5, "displayDetailsForJoinMethod:completionHandler:", v7, v9);

  }
  else
  {
    -[EKLocationVirtualConferenceSearchFieldsView virtualConferenceTextField](self->_searchFieldsView, "virtualConferenceTextField");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setText:", &stru_1E601DFA8);

    -[EKLocationEditItemViewController setDisableConferenceTextField:](self, "setDisableConferenceTextField:", 0);
    -[EKLocationVirtualConferenceSearchFieldsView setDisableConferenceTextField:](self->_searchFieldsView, "setDisableConferenceTextField:", 0);
  }

}

void __66__EKLocationEditItemViewController_pendingVideoConferenceUpdated___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __66__EKLocationEditItemViewController_pendingVideoConferenceUpdated___block_invoke_2;
  v6[3] = &unk_1E6018EC0;
  v6[4] = *(_QWORD *)(a1 + 32);
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

uint64_t __66__EKLocationEditItemViewController_pendingVideoConferenceUpdated___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1072), "virtualConferenceTextField");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setText:", v2);

  objc_msgSend(*(id *)(a1 + 32), "setDisableConferenceTextField:", 0);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1072), "setDisableConferenceTextField:", 0);
}

- (BOOL)needsSave
{
  return self->_needsSave;
}

- (void)setNeedsSave:(BOOL)a3
{
  self->_needsSave = a3;
}

- (unint64_t)supportedSearchTypes
{
  return self->_supportedSearchTypes;
}

- (BOOL)autoFillSelectedTextField
{
  return self->_autoFillSelectedTextField;
}

- (void)setAutoFillSelectedTextField:(BOOL)a3
{
  self->_autoFillSelectedTextField = a3;
}

- (BOOL)forceSingleTextField
{
  return self->_forceSingleTextField;
}

- (void)setForceSingleTextField:(BOOL)a3
{
  self->_forceSingleTextField = a3;
}

- (BOOL)conferenceTextFieldSelected
{
  return self->_conferenceTextFieldSelected;
}

- (void)setConferenceTextFieldSelected:(BOOL)a3
{
  self->_conferenceTextFieldSelected = a3;
}

- (BOOL)disableConferenceTextField
{
  return self->_disableConferenceTextField;
}

- (void)setDisableConferenceTextField:(BOOL)a3
{
  self->_disableConferenceTextField = a3;
}

- (EKUILocationRowModel)locationViewModel
{
  return self->_locationViewModel;
}

- (void)setLocationViewModel:(id)a3
{
  objc_storeStrong((id *)&self->_locationViewModel, a3);
}

- (EKUILocationRowModel)conferenceViewModel
{
  return self->_conferenceViewModel;
}

- (void)setConferenceViewModel:(id)a3
{
  objc_storeStrong((id *)&self->_conferenceViewModel, a3);
}

- (EKStructuredLocation)selectedLocation
{
  return self->_selectedLocation;
}

- (void)setSelectedLocation:(id)a3
{
  objc_storeStrong((id *)&self->_selectedLocation, a3);
}

- (EKUIConferenceRoom)selectedConferenceRoom
{
  return self->_selectedConferenceRoom;
}

- (EKVirtualConference)selectedVirtualConference
{
  return self->_selectedVirtualConference;
}

- (void)setSelectedVirtualConference:(id)a3
{
  objc_storeStrong((id *)&self->_selectedVirtualConference, a3);
}

- (BOOL)pendingVirtualConference
{
  return self->_pendingVirtualConference;
}

- (void)setPendingVirtualConference:(BOOL)a3
{
  self->_pendingVirtualConference = a3;
}

- (NSError)pendingVirtualConferenceError
{
  return self->_pendingVirtualConferenceError;
}

- (void)setPendingVirtualConferenceError:(id)a3
{
  objc_storeStrong((id *)&self->_pendingVirtualConferenceError, a3);
}

- (id)viewDidAppearBlock
{
  return self->_viewDidAppearBlock;
}

- (void)setViewDidAppearBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1296);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_viewDidAppearBlock, 0);
  objc_storeStrong((id *)&self->_pendingVirtualConferenceError, 0);
  objc_storeStrong((id *)&self->_selectedVirtualConference, 0);
  objc_storeStrong((id *)&self->_selectedConferenceRoom, 0);
  objc_storeStrong((id *)&self->_selectedLocation, 0);
  objc_storeStrong((id *)&self->_conferenceViewModel, 0);
  objc_storeStrong((id *)&self->_locationViewModel, 0);
  objc_storeStrong((id *)&self->_searchModelVirtualConferenceCustomSearchResults, 0);
  objc_storeStrong((id *)&self->_searchModelVirtualConferenceRoomSearchResults, 0);
  objc_storeStrong((id *)&self->_searchModelConferenceRoomSearchResults, 0);
  objc_storeStrong((id *)&self->_searchModelTextualSearchResults, 0);
  objc_storeStrong((id *)&self->_searchModelEventsSearchResults, 0);
  objc_storeStrong((id *)&self->_searchModelFrequentsSearchResults, 0);
  objc_storeStrong((id *)&self->_searchModelRecentsSearchResults, 0);
  objc_storeStrong((id *)&self->_searchModelContactsSearchResults, 0);
  objc_storeStrong((id *)&self->_searchModelMapCompletionSearchResults, 0);
  objc_storeStrong((id *)&self->_searchModelLocationFromMapsURL, 0);
  objc_storeStrong((id *)&self->_searchModelCurrentLocation, 0);
  objc_storeStrong((id *)&self->_cachedConferenceRooms, 0);
  objc_storeStrong((id *)&self->_checkedRoomType, 0);
  objc_storeStrong((id *)&self->_calendarItem, 0);
  objc_storeStrong((id *)&self->_searchModel, 0);
  objc_storeStrong((id *)&self->_searchFieldsView, 0);
  objc_storeStrong((id *)&self->_searchBar, 0);
  objc_storeStrong((id *)&self->_palette, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
}

@end
