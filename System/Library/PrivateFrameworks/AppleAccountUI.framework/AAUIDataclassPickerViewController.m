@implementation AAUIDataclassPickerViewController

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AAUIDataclassPickerViewController)initWithDataclassOptions:(id)a3 account:(id)a4
{
  id v6;
  id v7;
  AAUIDataclassPickerViewController *v8;
  _AAUIDataclassOptionCache *v9;
  _AAUIDataclassOptionCache *dataclassOptionCache;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AAUIDataclassPickerViewController;
  v8 = -[AAUIDataclassPickerViewController initWithNibName:bundle:](&v12, sel_initWithNibName_bundle_, 0, 0);
  if (v8)
  {
    v9 = -[_AAUIDataclassOptionCache initWithDataclassOptions:]([_AAUIDataclassOptionCache alloc], "initWithDataclassOptions:", v6);
    dataclassOptionCache = v8->_dataclassOptionCache;
    v8->_dataclassOptionCache = v9;

    objc_storeStrong((id *)&v8->_account, a4);
  }

  return v8;
}

- (AAUIDataclassPickerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  return -[AAUIDataclassPickerViewController initWithDataclassOptions:account:](self, "initWithDataclassOptions:account:", 0, 0);
}

- (AAUIDataclassPickerViewController)initWithCoder:(id)a3
{
  id v4;
  AAUIDataclassPickerViewController *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _AAUIDataclassOptionCache *v11;
  _AAUIDataclassOptionCache *dataclassOptionCache;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)AAUIDataclassPickerViewController;
  v5 = -[AAUIDataclassPickerViewController initWithCoder:](&v14, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("_dataclassOptions"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = -[_AAUIDataclassOptionCache initWithDataclassOptions:]([_AAUIDataclassOptionCache alloc], "initWithDataclassOptions:", v10);
    dataclassOptionCache = v5->_dataclassOptionCache;
    v5->_dataclassOptionCache = v11;

  }
  return v5;
}

- (void)loadView
{
  AAUIBuddyView *v3;
  AAUIBuddyView *v4;

  v3 = [AAUIBuddyView alloc];
  v4 = -[AAUIBuddyView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[AAUIDataclassPickerViewController setView:](self, "setView:", v4);

}

- (void)viewDidLoad
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
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
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
  objc_super v40;
  _QWORD v41[2];
  _QWORD v42[6];

  v42[4] = *MEMORY[0x1E0C80C00];
  v40.receiver = self;
  v40.super_class = (Class)AAUIDataclassPickerViewController;
  -[AAUIDataclassPickerViewController viewDidLoad](&v40, sel_viewDidLoad);
  -[AAUIDataclassPickerViewController navigationItem](self, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAUIDataclassPickerViewController _cancelBarButtonItem](self, "_cancelBarButtonItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setLeftBarButtonItem:", v4);

  -[AAUIDataclassPickerViewController navigationItem](self, "navigationItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAUIDataclassPickerViewController _nextBarButtonItem](self, "_nextBarButtonItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRightBarButtonItem:", v6);

  -[AAUIDataclassPickerViewController _tableView](self, "_tableView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAUIDataclassPickerViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addSubview:", v7);

  v29 = (void *)MEMORY[0x1E0CB3718];
  objc_msgSend(v7, "topAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAUIDataclassPickerViewController view](self, "view");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "contentLayoutGuide");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "topAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "constraintEqualToAnchor:", v35);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v42[0] = v34;
  objc_msgSend(v7, "leftAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAUIDataclassPickerViewController view](self, "view");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "contentLayoutGuide");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "leftAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "constraintEqualToAnchor:", v30);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v42[1] = v28;
  v39 = v7;
  objc_msgSend(v7, "rightAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAUIDataclassPickerViewController view](self, "view");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "contentLayoutGuide");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "rightAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "constraintEqualToAnchor:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v42[2] = v11;
  objc_msgSend(v7, "bottomAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAUIDataclassPickerViewController view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "contentLayoutGuide");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "bottomAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintEqualToAnchor:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v42[3] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "activateConstraints:", v17);

  v18 = (void *)MEMORY[0x1E0CF0E68];
  v19 = *MEMORY[0x1E0CFADC0];
  -[ACAccount aa_altDSID](self->_account, "aa_altDSID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "analyticsEventWithName:altDSID:flowID:", v19, v20, self->_telemetryFlowID);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = *MEMORY[0x1E0CFAEC0];
  v41[0] = *MEMORY[0x1E0CFAEB8];
  v41[1] = v22;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 2);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "aaf_arrayAsCommaSeperatedString");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setObject:forKeyedSubscript:", v24, *MEMORY[0x1E0D15798]);

  objc_msgSend(MEMORY[0x1E0CFABB8], "reporter");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "sendEvent:", v21);

}

- (void)viewWillAppear:(BOOL)a3
{
  _QWORD block[5];
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AAUIDataclassPickerViewController;
  -[AAUIDataclassPickerViewController viewWillAppear:](&v5, sel_viewWillAppear_, a3);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__AAUIDataclassPickerViewController_viewWillAppear___block_invoke;
  block[3] = &unk_1EA2DB208;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __52__AAUIDataclassPickerViewController_viewWillAppear___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 984), "reloadData");
}

- (void)viewWillLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  double MaxX;
  void *v10;
  objc_super v11;
  CGRect v12;
  CGRect v13;

  v11.receiver = self;
  v11.super_class = (Class)AAUIDataclassPickerViewController;
  -[AAUIDataclassPickerViewController viewWillLayoutSubviews](&v11, sel_viewWillLayoutSubviews);
  -[AAUIDataclassPickerViewController topLayoutGuide](self, "topLayoutGuide");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "length");
  v5 = v4;
  -[AAUIDataclassPickerViewController bottomLayoutGuide](self, "bottomLayoutGuide");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "length");
  v8 = v7;
  -[UITableView frame](self->_tableView, "frame");
  MaxX = CGRectGetMaxX(v12);
  -[AAUIDataclassPickerViewController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bounds");
  -[UITableView setScrollIndicatorInsets:](self->_tableView, "setScrollIndicatorInsets:", v5, 0.0, v8, MaxX - CGRectGetWidth(v13));

}

- (NSDictionary)dataclassOptions
{
  return -[_AAUIDataclassOptionCache dataclassOptions](self->_dataclassOptionCache, "dataclassOptions");
}

- (void)setDataclassOptions:(id)a3
{
  id v4;

  v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  -[_AAUIDataclassOptionCache setDataclassOptions:](self->_dataclassOptionCache, "setDataclassOptions:", v4);

  -[UITableView reloadData](self->_tableView, "reloadData");
}

- (id)_cancelBarButtonItem
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 1, self, sel__cancelButtonSelected_);
}

- (id)_nextBarButtonItem
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0DC34F0]);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("SIGN_OUT_NAVBAR_NEXT"), &stru_1EA2E2A18, CFSTR("Localizable"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithTitle:style:target:action:", v5, 2, self, sel__nextButtonSelected_);

  return v6;
}

- (id)_tableHeaderView
{
  AAUIBuddyView *tableHeaderView;
  AAUIBuddyView *v4;
  AAUIBuddyView *v5;
  AAUIBuddyView *v6;
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
  AAUIBuddyView *v18;
  void *v19;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  _QWORD v31[5];

  v31[4] = *MEMORY[0x1E0C80C00];
  tableHeaderView = self->_tableHeaderView;
  if (!tableHeaderView)
  {
    v4 = [AAUIBuddyView alloc];
    v5 = -[AAUIBuddyView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v6 = self->_tableHeaderView;
    self->_tableHeaderView = v5;

    v7 = objc_alloc(MEMORY[0x1E0D65160]);
    -[AAUIDataclassPickerViewController _titleText](self, "_titleText");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAUIDataclassPickerViewController _messageText](self, "_messageText");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v7, "initWithTitle:detailText:icon:", v8, v9, 0);

    objc_msgSend(v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[AAUIBuddyView addSubview:](self->_tableHeaderView, "addSubview:", v10);
    v23 = objc_alloc(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v10, "topAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAUIBuddyView contentLayoutGuide](self->_tableHeaderView, "contentLayoutGuide");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "topAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "constraintEqualToAnchor:", v28);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = v27;
    objc_msgSend(v10, "leadingAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAUIBuddyView leadingAnchor](self->_tableHeaderView, "leadingAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "constraintEqualToAnchor:", v25);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v31[1] = v22;
    objc_msgSend(v10, "trailingAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAUIBuddyView trailingAnchor](self->_tableHeaderView, "trailingAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "constraintEqualToAnchor:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v31[2] = v12;
    objc_msgSend(v10, "bottomAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAUIBuddyView contentLayoutGuide](self->_tableHeaderView, "contentLayoutGuide");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "bottomAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintEqualToAnchor:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v31[3] = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_msgSend(v23, "initWithArray:", v17);

    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v24);
    v18 = self->_tableHeaderView;
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAUIBuddyView setBackgroundColor:](v18, "setBackgroundColor:", v19);

    -[AAUIBuddyView setAccessibilityIdentifier:](self->_tableHeaderView, "setAccessibilityIdentifier:", CFSTR("header-view"));
    tableHeaderView = self->_tableHeaderView;
  }
  return tableHeaderView;
}

- (id)_tableView
{
  UITableView *tableView;
  id v4;
  UITableView *v5;
  UITableView *v6;
  UITableView *v7;
  void *v8;

  tableView = self->_tableView;
  if (!tableView)
  {
    v4 = objc_alloc(MEMORY[0x1E0DC3D48]);
    v5 = (UITableView *)objc_msgSend(v4, "initWithFrame:style:", 2, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v6 = self->_tableView;
    self->_tableView = v5;

    -[UITableView setAllowsSelection:](self->_tableView, "setAllowsSelection:", 0);
    v7 = self->_tableView;
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITableView setBackgroundColor:](v7, "setBackgroundColor:", v8);

    -[UITableView setClipsToBounds:](self->_tableView, "setClipsToBounds:", 0);
    -[UITableView setDataSource:](self->_tableView, "setDataSource:", self);
    -[UITableView setDelegate:](self->_tableView, "setDelegate:", self);
    -[UITableView _setDrawsSeparatorAtTopOfSections:](self->_tableView, "_setDrawsSeparatorAtTopOfSections:", 1);
    -[UITableView setRowHeight:](self->_tableView, "setRowHeight:", *MEMORY[0x1E0DC53D8]);
    -[UITableView setSeparatorStyle:](self->_tableView, "setSeparatorStyle:", 0);
    -[UITableView setTranslatesAutoresizingMaskIntoConstraints:](self->_tableView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UITableView registerClass:forCellReuseIdentifier:](self->_tableView, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("DataclassCellIdentifier"));
    -[UITableView setAccessibilityIdentifier:](self->_tableView, "setAccessibilityIdentifier:", CFSTR("tableView"));
    tableView = self->_tableView;
  }
  return tableView;
}

- (id)_tableFooterView
{
  UITableViewHeaderFooterView *tableFooterView;
  id v4;
  UITableViewHeaderFooterView *v5;
  UITableViewHeaderFooterView *v6;
  void *v7;
  void *v8;
  UITableViewHeaderFooterView *v9;
  void *v10;

  tableFooterView = self->_tableFooterView;
  if (!tableFooterView)
  {
    v4 = objc_alloc(MEMORY[0x1E0DC3D78]);
    v5 = (UITableViewHeaderFooterView *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v6 = self->_tableFooterView;
    self->_tableFooterView = v5;

    -[AAUIDataclassPickerViewController _signOutFooterText](self, "_signOutFooterText");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0DC39A8], "groupedFooterConfiguration");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setText:", v7);
      -[UITableViewHeaderFooterView setContentConfiguration:](self->_tableFooterView, "setContentConfiguration:", v8);
      -[UITableViewHeaderFooterView setAccessibilityIdentifier:](self->_tableFooterView, "setAccessibilityIdentifier:", CFSTR("footer-view"));

    }
    v9 = self->_tableFooterView;
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITableViewHeaderFooterView setBackgroundColor:](v9, "setBackgroundColor:", v10);

    tableFooterView = self->_tableFooterView;
  }
  return tableFooterView;
}

- (id)_signOutFooterText
{
  void *v3;
  void *v4;

  -[AAUIDataclassPickerViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "footerTextForDataclassPickerViewController:", self);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)_titleText
{
  void *v3;
  void *v4;

  -[AAUIDataclassPickerViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "titleTextForDataclassPickerViewController:", self);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)_messageText
{
  void *v3;
  void *v4;

  -[AAUIDataclassPickerViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "messageTextForDataclassPickerViewController:", self);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_cancelButtonSelected:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  v4 = (void *)MEMORY[0x1E0CF0E68];
  v5 = *MEMORY[0x1E0CFAE00];
  -[ACAccount aa_altDSID](self->_account, "aa_altDSID", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "analyticsEventWithName:altDSID:flowID:", v5, v6, self->_telemetryFlowID);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setObject:forKeyedSubscript:", *MEMORY[0x1E0CFAEB8], *MEMORY[0x1E0D157A0]);
  objc_msgSend(MEMORY[0x1E0CFABB8], "reporter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sendEvent:", v8);

  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  -[AAUIDataclassPickerViewController _delegate_signOutViewControllerDidCancel](self, "_delegate_signOutViewControllerDidCancel");

}

- (void)_nextButtonSelected:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = (void *)MEMORY[0x1E0CF0E68];
  v5 = *MEMORY[0x1E0CFAE00];
  -[ACAccount aa_altDSID](self->_account, "aa_altDSID", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "analyticsEventWithName:altDSID:flowID:", v5, v6, self->_telemetryFlowID);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setObject:forKeyedSubscript:", *MEMORY[0x1E0CFAEC0], *MEMORY[0x1E0D157A0]);
  objc_msgSend(MEMORY[0x1E0CFABB8], "reporter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sendEvent:", v10);

  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  -[_AAUIDataclassOptionCache dataclassOptions](self->_dataclassOptionCache, "dataclassOptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "aaf_map:", &__block_literal_global_107);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[AAUIDataclassPickerViewController _delegate_signOutViewControllerDidCompleteWithDataclassActions:](self, "_delegate_signOutViewControllerDidCompleteWithDataclassActions:", v9);
}

id __57__AAUIDataclassPickerViewController__nextButtonSelected___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3;

  if (objc_msgSend(a3, "isEnabled"))
    v3 = 2;
  else
    v3 = 3;
  objc_msgSend(MEMORY[0x1E0C8F2D0], "actionWithType:", v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_additionalInformationSelected:(id)a3
{
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
  id v14;

  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  v14 = objc_alloc_init(MEMORY[0x1E0D80460]);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("SIGN_OUT_ADDITIONAL_INFO"), &stru_1EA2E2A18, CFSTR("Localizable"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setHTMLContent:isFragment:", v5, 1);

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 0, self, sel__dismissAdditionalInformation_);
  objc_msgSend(v14, "navigationItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setRightBarButtonItem:", v6);

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", v14);
  objc_msgSend(v8, "setModalPresentationStyle:", 2);
  objc_msgSend(v8, "navigationBar");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_opt_new();
  objc_msgSend(v9, "setBackgroundImage:forBarMetrics:", v10, 0);

  objc_msgSend(v8, "navigationBar");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_opt_new();
  objc_msgSend(v11, "setShadowImage:", v12);

  objc_msgSend(v8, "navigationBar");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setTranslucent:", 1);

  -[AAUIDataclassPickerViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v8, 1, 0);
}

- (void)_dismissAdditionalInformation:(id)a3
{
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  -[AAUIDataclassPickerViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)_delegate_signOutViewControllerDidCancel
{
  id v3;

  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  -[AAUIDataclassPickerViewController delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "dataclassPickerViewControllerDidCancel:", self);

}

- (void)_delegate_signOutViewControllerDidCompleteWithDataclassActions:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  -[AAUIDataclassPickerViewController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "dataclassPickerViewController:didCompleteWithDataclassActions:", self, v5);

}

- (void)switchTableViewCellDidUpdateValue:(id)a3
{
  _AAUIDataclassOptionCache *dataclassOptionCache;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  dataclassOptionCache = self->_dataclassOptionCache;
  v4 = a3;
  -[_AAUIDataclassOptionCache dataclassOptions](dataclassOptionCache, "dataclassOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dataclass");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "control");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setEnabled:", objc_msgSend(v7, "isOn"));
}

- (void)encodeWithCoder:(id)a3
{
  _AAUIDataclassOptionCache *dataclassOptionCache;
  id v4;
  id v5;

  dataclassOptionCache = self->_dataclassOptionCache;
  v4 = a3;
  -[_AAUIDataclassOptionCache dataclassOptions](dataclassOptionCache, "dataclassOptions");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_dataclassOptions"));

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return self->_tableView == a3;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v5;
  int64_t v6;

  if (self->_tableView != a3)
    return 0;
  -[_AAUIDataclassOptionCache filteredDataclasses](self->_dataclassOptionCache, "filteredDataclasses");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  return v6;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  _AAUIDataclassOptionCache *dataclassOptionCache;
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
  void *v17;
  void *v18;
  void *v19;

  dataclassOptionCache = self->_dataclassOptionCache;
  v7 = a4;
  v8 = a3;
  -[_AAUIDataclassOptionCache filteredDataclasses](dataclassOptionCache, "filteredDataclasses");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v7, "row"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("DataclassCellIdentifier"), v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemBackgroundColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setBackgroundColor:", v12);

  objc_msgSend(v11, "setDelegate:", self);
  objc_msgSend(v11, "setDataclass:", v10);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localizedStringForKey:value:table:", v10, &stru_1EA2E2A18, CFSTR("Localizable"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "textLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setText:", v14);

  -[_AAUIDataclassOptionCache dataclassOptions](self->_dataclassOptionCache, "dataclassOptions");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKeyedSubscript:", v10);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "control");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setEnabled:", objc_msgSend(v17, "isEditable"));

  objc_msgSend(v11, "control");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setOn:", objc_msgSend(v17, "isEnabled"));

  return v11;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  if (a4
    || (-[_AAUIDataclassOptionCache filteredDataclasses](self->_dataclassOptionCache, "filteredDataclasses", a3),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "count"),
        v5,
        !v6))
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("SIGN_OUT_TABLE_HEADER"), &stru_1EA2E2A18, CFSTR("Localizable"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedUppercaseString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  return *MEMORY[0x1E0DC53D8];
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v5;

  v5 = a4;
  objc_msgSend(v5, "setSeparatorStyle:", 1);
  objc_msgSend(v5, "_setShouldHaveFullLengthBottomSeparator:", 0);
  objc_msgSend(v5, "_setShouldHaveFullLengthTopSeparator:", 0);

}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  if (a4)
  {
    v6 = 0;
  }
  else
  {
    -[AAUIDataclassPickerViewController _tableFooterView](self, "_tableFooterView", a3, v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (double)heightForHeaderInTableView:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;

  v4 = a3;
  -[AAUIDataclassPickerViewController _tableHeaderView](self, "_tableHeaderView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAUIDataclassPickerViewController _compressedHeightForView:containedInView:](self, "_compressedHeightForView:containedInView:", v5, v4);
  v7 = v6;

  return v7;
}

- (double)_compressedHeightForView:(id)a3 containedInView:(id)a4
{
  id v5;
  id v6;
  void *v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  void *v16;
  double v17;
  double v18;
  CGRect v20;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "widthAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  v20.origin.x = v9;
  v20.origin.y = v11;
  v20.size.width = v13;
  v20.size.height = v15;
  objc_msgSend(v7, "constraintEqualToConstant:", CGRectGetWidth(v20));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "setActive:", 1);
  objc_msgSend(v6, "systemLayoutSizeFittingSize:", *MEMORY[0x1E0DC4FF8], *(double *)(MEMORY[0x1E0DC4FF8] + 8));
  v18 = v17;

  objc_msgSend(v16, "setActive:", 0);
  return v18;
}

- (BOOL)tableView:(id)a3 shouldDrawTopSeparatorForSection:(int64_t)a4
{
  return 1;
}

- (AAUIDataclassPickerViewControllerDelegate)delegate
{
  return (AAUIDataclassPickerViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)telemetryFlowID
{
  return self->_telemetryFlowID;
}

- (void)setTelemetryFlowID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1016);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_telemetryFlowID, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_dataclassOptionCache, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_tableFooterView, 0);
  objc_storeStrong((id *)&self->_tableHeaderView, 0);
}

@end
