@implementation DMCProfileDetailsViewController

- (DMCProfileDetailsViewController)initWithProfileViewModel:(id)a3
{
  return -[DMCProfileDetailsViewController initWithProfileViewModel:mode:](self, "initWithProfileViewModel:mode:", a3, 0);
}

- (DMCProfileDetailsViewController)initWithProfileViewModel:(id)a3 mode:(int)a4
{
  uint64_t v4;
  id v6;
  DMCProfileDetailsViewController *v7;
  DMCProfileDetailsViewController *v8;
  objc_super v10;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)DMCProfileDetailsViewController;
  v7 = -[DMCProfileTableViewController initWithStyle:](&v10, sel_initWithStyle_, 2);
  v8 = v7;
  if (v7)
  {
    -[DMCProfileDetailsViewController _setup](v7, "_setup");
    -[DMCProfileDetailsViewController setProfileViewModel:mode:](v8, "setProfileViewModel:mode:", v6, v4);
  }

  return v8;
}

- (void)_setup
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v14;
  objc_super v15;

  self->_showTitleIfOnlyOneSection = 1;
  -[DMCProfileDetailsViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_class();
  +[DMCProfileDetailsCell cellIdentifier](DMCProfileDetailsCell, "cellIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerClass:forCellReuseIdentifier:", v4, v5);

  -[DMCProfileDetailsViewController tableView](self, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_class();
  +[DMCProfileInfoTextCell cellIdentifier](DMCProfileInfoTextCell, "cellIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "registerClass:forCellReuseIdentifier:", v7, v8);

  -[DMCProfileDetailsViewController tableView](self, "tableView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_class();
  +[DMCProfileTitleTextCell cellIdentifier](DMCProfileTitleTextCell, "cellIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "registerClass:forCellReuseIdentifier:", v10, v11);

  v15.receiver = self;
  v15.super_class = (Class)DMCProfileDetailsViewController;
  -[DMCProfileTableViewController updateExtendedLayoutIncludesOpaqueBars](&v15, sel_updateExtendedLayoutIncludesOpaqueBars);
  v14.receiver = self;
  v14.super_class = (Class)DMCProfileDetailsViewController;
  -[DMCProfileTableViewController reloadTableOnContentSizeCategoryChange](&v14, sel_reloadTableOnContentSizeCategoryChange);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObserver:selector:name:object:", self, sel__profileChanged_, CFSTR("kMCUIProfileDidChangeNotification"), 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObserver:selector:name:object:", self, sel__reloadTable_, CFSTR("kMCUIBridgeIconLoadedNotification"), 0);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)DMCProfileDetailsViewController;
  -[DMCProfileDetailsViewController viewWillAppear:](&v6, sel_viewWillAppear_, a3);
  -[DMCProfileDetailsViewController tableView](self, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layoutIfNeeded");

  -[DMCProfileDetailsViewController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reloadData");

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  id location;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)DMCProfileDetailsViewController;
  -[DMCProfileDetailsViewController viewDidAppear:](&v9, sel_viewDidAppear_, a3);
  -[DMCProfileDetailsViewController setViewControllerCanPop:](self, "setViewControllerCanPop:", 1);
  -[DMCProfileDetailsViewController sections](self, "sections");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (!v5)
  {
    objc_initWeak(&location, self);
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __49__DMCProfileDetailsViewController_viewDidAppear___block_invoke;
    v6[3] = &unk_24D52E7F8;
    objc_copyWeak(&v7, &location);
    dispatch_async(MEMORY[0x24BDAC9B8], v6);
    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

void __49__DMCProfileDetailsViewController_viewDidAppear___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  id v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "navigationController");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = (id)objc_msgSend(v2, "popViewControllerAnimated:", 1);

    WeakRetained = v4;
  }

}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)DMCProfileDetailsViewController;
  -[DMCProfileDetailsViewController viewWillDisappear:](&v4, sel_viewWillDisappear_, a3);
  -[DMCProfileDetailsViewController setViewControllerCanPop:](self, "setViewControllerCanPop:", 0);
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)DMCProfileDetailsViewController;
  -[DMCProfileTableViewController dealloc](&v4, sel_dealloc);
}

- (void)_profileChanged:(id)a3
{
  _QWORD v3[4];
  id v4;
  id location;

  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __51__DMCProfileDetailsViewController__profileChanged___block_invoke;
  v3[3] = &unk_24D52E7F8;
  objc_copyWeak(&v4, &location);
  dispatch_async(MEMORY[0x24BDAC9B8], v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __51__DMCProfileDetailsViewController__profileChanged___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  int v6;
  id v7;
  void *v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v8 = WeakRetained;
    objc_msgSend(WeakRetained, "reloadSectionArray");
    objc_msgSend(v8, "sections");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "count");

    if (v4)
    {
      objc_msgSend(v8, "tableView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "reloadData");
LABEL_6:

      v2 = v8;
      goto LABEL_7;
    }
    v6 = objc_msgSend(v8, "viewControllerCanPop");
    v2 = v8;
    if (v6)
    {
      objc_msgSend(v8, "navigationController");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (id)objc_msgSend(v5, "popViewControllerAnimated:", 1);
      goto LABEL_6;
    }
  }
LABEL_7:

}

- (void)_reloadTable:(id)a3
{
  _QWORD v3[4];
  id v4;
  id location;

  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __48__DMCProfileDetailsViewController__reloadTable___block_invoke;
  v3[3] = &unk_24D52E7F8;
  objc_copyWeak(&v4, &location);
  dispatch_async(MEMORY[0x24BDAC9B8], v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __48__DMCProfileDetailsViewController__reloadTable___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "tableView");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "reloadData");

    WeakRetained = v3;
  }

}

- (void)setProfileDetailsMode:(int)a3
{
  if (self->_mode != a3)
  {
    self->_mode = a3;
    -[DMCProfileDetailsViewController _updateStateForCurrentMode](self, "_updateStateForCurrentMode");
  }
}

- (void)setProfileViewModel:(id)a3
{
  DMCProfileViewModel *v5;
  DMCProfileViewModel *v6;

  v5 = (DMCProfileViewModel *)a3;
  if (self->_profileViewModel != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_profileViewModel, a3);
    -[DMCProfileDetailsViewController _updateStateForCurrentMode](self, "_updateStateForCurrentMode");
    v5 = v6;
  }

}

- (void)setProfileViewModel:(id)a3 mode:(int)a4
{
  uint64_t v4;

  v4 = *(_QWORD *)&a4;
  -[DMCProfileDetailsViewController setProfileViewModel:](self, "setProfileViewModel:", a3);
  -[DMCProfileDetailsViewController setProfileDetailsMode:](self, "setProfileDetailsMode:", v4);
}

- (void)setTableViewBottomInset:(double)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double tableViewBottomInset;
  id v12;

  if (self->_tableViewBottomInset != a3)
  {
    self->_tableViewBottomInset = a3;
    -[DMCProfileDetailsViewController tableView](self, "tableView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "contentInset");
    v6 = v5;
    v8 = v7;
    v10 = v9;

    tableViewBottomInset = self->_tableViewBottomInset;
    -[DMCProfileDetailsViewController tableView](self, "tableView");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setContentInset:", v6, v8, tableViewBottomInset, v10);

  }
}

- (void)reloadSectionArray
{
  void *v3;
  NSArray *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSArray *v10;
  NSArray *sections;
  NSArray *v12;
  uint64_t v13;
  id v14;

  switch(self->_mode)
  {
    case 0:
      -[DMCProfileDetailsViewController profileViewModel](self, "profileViewModel");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "moreDetailsSections");
      v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 1:
      -[DMCProfileDetailsViewController profileViewModel](self, "profileViewModel");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "byodInfoSections");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)objc_msgSend(v6, "mutableCopy");

      -[DMCProfileDetailsViewController profileViewModel](self, "profileViewModel");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "moreDetailsSections");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObjectsFromArray:", v9);

      v10 = (NSArray *)objc_msgSend(v7, "copy");
      sections = self->_sections;
      self->_sections = v10;

      break;
    case 2:
      -[DMCProfileDetailsViewController profileViewModel](self, "profileViewModel");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "accountSections");
      v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 3:
      -[DMCProfileDetailsViewController profileViewModel](self, "profileViewModel");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "managedAppSections");
      v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 4:
      -[DMCProfileDetailsViewController profileViewModel](self, "profileViewModel");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "managedBookSections");
      v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 5:
      -[DMCProfileDetailsViewController profileViewModel](self, "profileViewModel");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "restrictionSections");
      v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
LABEL_8:
      v12 = self->_sections;
      self->_sections = v4;

      break;
    case 6:
      v13 = 6;
      goto LABEL_11;
    case 7:
      v13 = 7;
LABEL_11:
      NSLog(CFSTR("DMCProfileDetailsViewController reloadSectionArray does not support mode: %u"), a2, v13);
      break;
    default:
      break;
  }
  -[DMCProfileDetailsViewController tableView](self, "tableView");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "reloadData");

}

- (void)_updateStateForCurrentMode
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSArray *v8;
  NSArray *sections;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSArray *v16;
  NSArray *v17;
  void *v18;
  void *v19;
  void *v20;
  NSArray *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSArray *v28;
  uint64_t v29;
  id v30;

  switch(self->_mode)
  {
    case 0:
      -[DMCProfileDetailsViewController profileViewModel](self, "profileViewModel");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "profile");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "friendlyName");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[DMCProfileDetailsViewController navigationItem](self, "navigationItem");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setTitle:", v5);

      -[DMCProfileDetailsViewController profileViewModel](self, "profileViewModel");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "moreDetailsSections");
      v8 = (NSArray *)objc_claimAutoreleasedReturnValue();
      sections = self->_sections;
      self->_sections = v8;

      self->_showTitleIfOnlyOneSection = 1;
      break;
    case 1:
      -[DMCProfileDetailsViewController navigationItem](self, "navigationItem");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setTitle:", 0);

      v11 = objc_alloc(MEMORY[0x24BDF6860]);
      DMCEnrollmentLocalizedString(CFSTR("DMC_GENERAL_DONE"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)objc_msgSend(v11, "initWithTitle:style:target:action:", v12, 2, self, sel__doneButtonTapped_);

      -[DMCProfileDetailsViewController navigationItem](self, "navigationItem");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setRightBarButtonItem:", v13);

      -[DMCProfileDetailsViewController profileViewModel](self, "profileViewModel");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "moreDetailsSections");
      v16 = (NSArray *)objc_claimAutoreleasedReturnValue();
      v17 = self->_sections;
      self->_sections = v16;

      self->_showTitleIfOnlyOneSection = 1;
      self->_shouldShowWarningText = 1;

      break;
    case 2:
      DMCEnrollmentLocalizedString(CFSTR("DMC_PROFILE_DETAILS_ACCOUNTS"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[DMCProfileDetailsViewController navigationItem](self, "navigationItem");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setTitle:", v18);

      -[DMCProfileDetailsViewController profileViewModel](self, "profileViewModel");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "accountSections");
      v21 = (NSArray *)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 3:
      DMCEnrollmentLocalizedString(CFSTR("DMC_PROFILE_DETAILS_APPS"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[DMCProfileDetailsViewController navigationItem](self, "navigationItem");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setTitle:", v22);

      -[DMCProfileDetailsViewController profileViewModel](self, "profileViewModel");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "managedAppSections");
      v21 = (NSArray *)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 4:
      DMCEnrollmentLocalizedString(CFSTR("DMC_PROFILE_DETAILS_BOOKS"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[DMCProfileDetailsViewController navigationItem](self, "navigationItem");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setTitle:", v24);

      -[DMCProfileDetailsViewController profileViewModel](self, "profileViewModel");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "managedBookSections");
      v21 = (NSArray *)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 5:
      DMCEnrollmentLocalizedString(CFSTR("DMC_PROFILE_DETAILS_RESTRICTIONS"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[DMCProfileDetailsViewController navigationItem](self, "navigationItem");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setTitle:", v26);

      -[DMCProfileDetailsViewController profileViewModel](self, "profileViewModel");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "restrictionSections");
      v21 = (NSArray *)objc_claimAutoreleasedReturnValue();
LABEL_8:
      v28 = self->_sections;
      self->_sections = v21;

      self->_showTitleIfOnlyOneSection = 0;
      break;
    case 6:
      v29 = 6;
      goto LABEL_11;
    case 7:
      v29 = 7;
LABEL_11:
      NSLog(CFSTR("DMCProfileDetailsViewController _updateStateForCurrentMode does not support mode: %u"), a2, v29);
      break;
    default:
      break;
  }
  -[DMCProfileDetailsViewController tableView](self, "tableView");
  v30 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "reloadData");

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  void *v4;
  int64_t v5;
  void *v6;

  -[DMCProfileDetailsViewController sections](self, "sections", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");
  -[DMCProfileDetailsViewController tableTitle](self, "tableTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "length"))
    ++v5;

  return v5;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;

  -[DMCProfileDetailsViewController tableTitle](self, "tableTitle", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");

  if (v7)
  {
    if (!a4)
      return (id)a4;
    --a4;
  }
  -[DMCProfileDetailsViewController sections](self, "sections");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4 >= (unint64_t)objc_msgSend(v8, "count"))
    goto LABEL_11;
  if (-[DMCProfileDetailsViewController showTitleIfOnlyOneSection](self, "showTitleIfOnlyOneSection"))
  {

  }
  else
  {
    -[DMCProfileDetailsViewController sections](self, "sections");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count");

    if (v10 < 2)
    {
      a4 = 0;
      return (id)a4;
    }
  }
  -[DMCProfileDetailsViewController sections](self, "sections");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectAtIndex:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v8, "sectionTitle");
    a4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_11:
    a4 = 0;
  }

  return (id)a4;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  void *v6;
  uint64_t v7;
  void *v8;
  _BOOL4 v9;
  void *v10;

  -[DMCProfileDetailsViewController tableTitle](self, "tableTitle", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");

  if (v7)
  {
    if (!a4)
      return (id)a4;
    --a4;
  }
  -[DMCProfileDetailsViewController sections](self, "sections");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4 >= (unint64_t)objc_msgSend(v8, "count"))
    goto LABEL_9;
  v9 = -[DMCProfileDetailsViewController shouldShowWarningText](self, "shouldShowWarningText");

  if (!v9)
  {
    a4 = 0;
    return (id)a4;
  }
  -[DMCProfileDetailsViewController sections](self, "sections");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectAtIndex:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v8, "sectionFooter");
    a4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_9:
    a4 = 0;
  }

  return (id)a4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v6;
  uint64_t v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int64_t v13;

  -[DMCProfileDetailsViewController tableTitle](self, "tableTitle", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");

  if (v7)
  {
    if (!a4)
      return 1;
    --a4;
  }
  -[DMCProfileDetailsViewController sections](self, "sections");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (a4 >= v9)
    return 0;
  -[DMCProfileDetailsViewController sections](self, "sections");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectAtIndex:", a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v11, "payloadViewModels");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "count");

  }
  else
  {
    objc_opt_class();
    v13 = objc_opt_isKindOfClass() & 1;
  }

  return v13;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  void *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  objc_super v26;

  v6 = a3;
  v7 = a4;
  -[DMCProfileDetailsViewController tableTitle](self, "tableTitle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "length");

  if (v9)
  {
    if (!objc_msgSend(v7, "section"))
    {
      +[DMCProfileTitleTextCell cellIdentifier](DMCProfileTitleTextCell, "cellIdentifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", v20, v7);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      -[DMCProfileDetailsViewController tableTitle](self, "tableTitle");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setText:", v15);
LABEL_16:

      goto LABEL_17;
    }
    objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", objc_msgSend(v7, "row"), objc_msgSend(v7, "section") - 1);
    v10 = objc_claimAutoreleasedReturnValue();

    v7 = (id)v10;
  }
  v11 = objc_msgSend(v7, "section");
  -[DMCProfileDetailsViewController sections](self, "sections");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");

  if (v11 < v13)
  {
    -[DMCProfileDetailsViewController sections](self, "sections");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectAtIndex:", v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      +[DMCProfileDetailsCell cellIdentifier](DMCProfileDetailsCell, "cellIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", v16, v7);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v15, "payloadViewModels");
      v18 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "objectAtIndex:", objc_msgSend(v7, "row"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setDetails:", v19);
LABEL_15:

      goto LABEL_16;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      +[DMCProfileInfoTextCell cellIdentifier](DMCProfileInfoTextCell, "cellIdentifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", v21, v7);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      v18 = v15;
      objc_msgSend(v18, "sectionAttributedText");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "length");

      if (v23)
      {
        objc_msgSend(v18, "sectionAttributedText");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setAttributedText:", v24);
      }
      else
      {
        objc_msgSend(v18, "sectionText");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setText:", v24);
      }

      objc_msgSend(v17, "setUserInteractionEnabled:", 0);
      objc_msgSend(v6, "backgroundColor");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setBackgroundColor:", v19);
      goto LABEL_15;
    }

  }
  v26.receiver = self;
  v26.super_class = (Class)DMCProfileDetailsViewController;
  -[DMCProfileDetailsViewController tableView:cellForRowAtIndexPath:](&v26, sel_tableView_cellForRowAtIndexPath_, v6, v7);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_17:

  return v17;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  unint64_t v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __CFString *v16;
  __CFString *v17;
  void *v18;
  DMCCertificateDetailsViewController *v19;
  void *v20;
  DMCPayloadDetailsViewController *v21;
  void *v22;
  void *v23;
  void *v24;
  DMCManagedMediaViewController *v25;
  uint64_t v26;
  DMCManagedMediaViewController *v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  void *v38;
  id v39;

  v39 = a4;
  -[DMCProfileDetailsViewController tableTitle](self, "tableTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  if (v6)
  {
    if (!objc_msgSend(v39, "section"))
      goto LABEL_27;
    objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", objc_msgSend(v39, "row"), objc_msgSend(v39, "section") - 1);
    v7 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v7;
  }
  else
  {
    v8 = v39;
  }
  v39 = v8;
  v9 = objc_msgSend(v8, "section");
  -[DMCProfileDetailsViewController sections](self, "sections");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (v9 < v11)
  {
    -[DMCProfileDetailsViewController sections](self, "sections");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectAtIndex:", objc_msgSend(v39, "section"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_26:

      goto LABEL_27;
    }
    objc_msgSend(v13, "payloadViewModels");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectAtIndex:", objc_msgSend(v39, "row"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v16 = v15;
      v17 = v16;
      if (!v16)
        goto LABEL_25;
      if (-[__CFString isCertificate](v16, "isCertificate")
        && (-[__CFString certificateProperties](v17, "certificateProperties"),
            v18 = (void *)objc_claimAutoreleasedReturnValue(),
            v18,
            v18))
      {
        v19 = [DMCCertificateDetailsViewController alloc];
        -[__CFString certificateProperties](v17, "certificateProperties");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = -[DMCCertificateDetailsViewController initWithCertificateProperties:](v19, "initWithCertificateProperties:", v20);

        -[__CFString friendlyName](v17, "friendlyName");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[DMCPayloadDetailsViewController navigationItem](v21, "navigationItem");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setTitle:", v22);
      }
      else
      {
        if (-[__CFString isManagedAppPayload](v17, "isManagedAppPayload"))
        {
          v25 = [DMCManagedMediaViewController alloc];
          -[DMCProfileDetailsViewController profileViewModel](self, "profileViewModel");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[__CFString managedApp](v17, "managedApp");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = -[DMCManagedMediaViewController initWithProfileViewModel:managedApp:](v25, "initWithProfileViewModel:managedApp:", v22, v23);
        }
        else
        {
          if (!-[__CFString isManagedBookPayload](v17, "isManagedBookPayload"))
          {
            if (!-[__CFString hasDetails](v17, "hasDetails"))
              goto LABEL_25;
            v21 = -[DMCPayloadDetailsViewController initWithPayloadViewModel:]([DMCPayloadDetailsViewController alloc], "initWithPayloadViewModel:", v17);
            if (!v21)
              goto LABEL_25;
            goto LABEL_24;
          }
          v27 = [DMCManagedMediaViewController alloc];
          -[DMCProfileDetailsViewController profileViewModel](self, "profileViewModel");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[__CFString managedBook](v17, "managedBook");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = -[DMCManagedMediaViewController initWithProfileViewModel:managedBook:](v27, "initWithProfileViewModel:managedBook:", v22, v23);
        }
        v21 = (DMCPayloadDetailsViewController *)v26;
      }

    }
    else
    {
      if (!v15)
      {
        v17 = 0;
        goto LABEL_25;
      }
      v21 = -[DMCCertificateDetailsViewController initWithCertificate:]([DMCCertificateDetailsViewController alloc], "initWithCertificate:", v15);
      v17 = (__CFString *)SecCertificateCopySubjectSummary((SecCertificateRef)v15);
      if (v17)
      {
        -[DMCPayloadDetailsViewController navigationItem](v21, "navigationItem");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setTitle:", v17);

        CFRelease(v17);
        v17 = 0;
        if (!v21)
          goto LABEL_25;
        goto LABEL_24;
      }
    }
    if (v21)
    {
LABEL_24:
      -[DMCPayloadDetailsViewController tableView](v21, "tableView");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "contentInset");
      v30 = v29;
      v32 = v31;
      v34 = v33;

      -[DMCProfileDetailsViewController tableViewBottomInset](self, "tableViewBottomInset");
      v36 = v35;
      -[DMCPayloadDetailsViewController tableView](v21, "tableView");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "setContentInset:", v30, v32, v36, v34);

      -[DMCProfileDetailsViewController navigationController](self, "navigationController");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "pushViewController:animated:", v21, 1);

    }
LABEL_25:

    goto LABEL_26;
  }
LABEL_27:

}

- (void)_doneButtonTapped:(id)a3
{
  -[DMCProfileDetailsViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (int)mode
{
  return self->_mode;
}

- (void)setMode:(int)a3
{
  self->_mode = a3;
}

- (double)tableViewBottomInset
{
  return self->_tableViewBottomInset;
}

- (NSString)tableTitle
{
  return self->_tableTitle;
}

- (void)setTableTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1032);
}

- (DMCProfileViewModel)profileViewModel
{
  return self->_profileViewModel;
}

- (BOOL)showTitleIfOnlyOneSection
{
  return self->_showTitleIfOnlyOneSection;
}

- (void)setShowTitleIfOnlyOneSection:(BOOL)a3
{
  self->_showTitleIfOnlyOneSection = a3;
}

- (BOOL)viewControllerCanPop
{
  return self->_viewControllerCanPop;
}

- (void)setViewControllerCanPop:(BOOL)a3
{
  self->_viewControllerCanPop = a3;
}

- (BOOL)shouldShowWarningText
{
  return self->_shouldShowWarningText;
}

- (void)setShouldShowWarningText:(BOOL)a3
{
  self->_shouldShowWarningText = a3;
}

- (NSArray)sections
{
  return self->_sections;
}

- (void)setSections:(id)a3
{
  objc_storeStrong((id *)&self->_sections, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_profileViewModel, 0);
  objc_storeStrong((id *)&self->_tableTitle, 0);
}

@end
