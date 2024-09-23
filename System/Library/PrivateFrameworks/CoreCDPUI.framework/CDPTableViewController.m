@implementation CDPTableViewController

- (CDPTableViewController)initWithTitle:(id)a3 subTitle:(id)a4
{
  id v7;
  id v8;
  CDPTableViewController *v9;
  CDPTableViewController *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CDPTableViewController;
  v9 = -[CDPTableViewController initWithNibName:bundle:](&v12, sel_initWithNibName_bundle_, 0, 0);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_headerTitle, a3);
    objc_storeStrong((id *)&v10->_headerSubTitle, a4);
    v10->_tableViewStyle = 1;
  }

  return v10;
}

- (NSString)deviceClass
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BE1A448], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deviceClass");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)loadView
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  UIView *v8;
  UIView *containerView;
  UIView *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  UIView *v19;
  void *v20;

  v3 = objc_alloc(MEMORY[0x24BEBDB00]);
  v4 = *MEMORY[0x24BDBF090];
  v5 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v6 = *(double *)(MEMORY[0x24BDBF090] + 16);
  v7 = *(double *)(MEMORY[0x24BDBF090] + 24);
  v8 = (UIView *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x24BDBF090], v5, v6, v7);
  containerView = self->_containerView;
  self->_containerView = v8;

  v10 = self->_containerView;
  objc_msgSend(getBFFStyleClass(), "sharedStyle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](v10, "setBackgroundColor:", objc_msgSend(v11, "backgroundColor"));

  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD9F0]), "initWithFrame:style:", self->_tableViewStyle, v4, v5, v6, v7);
  -[CDPTableViewController setTableView:](self, "setTableView:", v12);

  -[CDPTableViewController tableView](self, "tableView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setDelegate:", self);

  -[CDPTableViewController tableView](self, "tableView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setDataSource:", self);

  -[CDPTableViewController tableView](self, "tableView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setBackgroundColor:", v16);

  -[CDPTableViewController tableView](self, "tableView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setBackgroundView:", 0);

  -[CDPTableViewController tableView](self, "tableView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setAlwaysBounceVertical:", 0);

  v19 = self->_containerView;
  -[UITableView panGestureRecognizer](self->_tableView, "panGestureRecognizer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView addGestureRecognizer:](v19, "addGestureRecognizer:", v20);

  -[UIView addSubview:](self->_containerView, "addSubview:", self->_tableView);
  -[CDPTableViewController setView:](self, "setView:", self->_containerView);
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v3 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CDPTableViewController;
  -[CDPTableViewController viewWillAppear:](&v10, sel_viewWillAppear_);
  -[CDPTableViewController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "indexPathForSelectedRow");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[CDPTableViewController tableView](self, "tableView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CDPTableViewController tableView](self, "tableView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "indexPathForSelectedRow");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "deselectRowAtIndexPath:animated:", v9, v3);

  }
}

- (BFFPaneHeaderView)headerView
{
  BFFPaneHeaderView *headerView;
  void *v4;
  objc_class *v5;
  BFFPaneHeaderView *v6;
  BFFPaneHeaderView *v7;
  NSString *headerSubTitle;
  void *v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  headerView = self->_headerView;
  if (!headerView)
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x2050000000;
    v4 = (void *)getBFFPaneHeaderViewClass_softClass_0;
    v15 = getBFFPaneHeaderViewClass_softClass_0;
    if (!getBFFPaneHeaderViewClass_softClass_0)
    {
      v11[0] = MEMORY[0x24BDAC760];
      v11[1] = 3221225472;
      v11[2] = __getBFFPaneHeaderViewClass_block_invoke_0;
      v11[3] = &unk_24C854C48;
      v11[4] = &v12;
      __getBFFPaneHeaderViewClass_block_invoke_0((uint64_t)v11);
      v4 = (void *)v13[3];
    }
    v5 = objc_retainAutorelease(v4);
    _Block_object_dispose(&v12, 8);
    v6 = (BFFPaneHeaderView *)objc_alloc_init(v5);
    v7 = self->_headerView;
    self->_headerView = v6;

    -[BFFPaneHeaderView setTitleText:](self->_headerView, "setTitleText:", self->_headerTitle);
    headerSubTitle = self->_headerSubTitle;
    -[BFFPaneHeaderView detailTextLabel](self->_headerView, "detailTextLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setText:", headerSubTitle);

    -[BFFPaneHeaderView setIcon:](self->_headerView, "setIcon:", self->_icon);
    headerView = self->_headerView;
  }
  return headerView;
}

- (void)setHeaderTitle:(id)a3
{
  NSString *v4;
  NSString *headerTitle;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  headerTitle = self->_headerTitle;
  self->_headerTitle = v4;

  -[BFFPaneHeaderView setTitleText:](self->_headerView, "setTitleText:", self->_headerTitle);
}

- (void)setHeaderSubTitle:(id)a3
{
  NSString *v4;
  NSString *headerSubTitle;
  NSString *v6;
  id v7;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  headerSubTitle = self->_headerSubTitle;
  self->_headerSubTitle = v4;

  v6 = self->_headerSubTitle;
  -[BFFPaneHeaderView detailTextLabel](self->_headerView, "detailTextLabel");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setText:", v6);

}

- (BOOL)isIPad
{
  void *v2;
  BOOL v3;

  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom") == 1;

  return v3;
}

- (BOOL)isiPhone5OrSmaller
{
  BOOL v2;
  void *v3;
  double v4;

  if (-[CDPTableViewController isIPad](self, "isIPad"))
    return 0;
  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_referenceBounds");
  v2 = v4 <= 568.0;

  return v2;
}

- (BOOL)uiTestMode
{
  return CFPreferencesGetAppBooleanValue(CFSTR("UITest"), CFSTR("com.apple.corecdp"), 0) != 0;
}

- (void)viewDidLayoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v16;
  double v17;
  double v18;
  double v19;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)CDPTableViewController;
  -[CDPTableViewController viewDidLayoutSubviews](&v20, sel_viewDidLayoutSubviews);
  -[UIView bounds](self->_containerView, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[CDPTableViewController navigationController](self, "navigationController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "modalPresentationStyle");

  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "userInterfaceIdiom");

  if (v14 == 1 && v12 == 0)
  {
    objc_msgSend(getBFFStyleClass(), "sharedStyle");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "edgeInsetsForTable:", self->_tableView);
    v4 = v17;
    v19 = v18;

    v8 = v8 - (v4 + v19);
  }
  -[UITableView setFrame:](self->_tableView, "setFrame:", v4, v6, v8, v10);
}

- (double)heightForHeaderInTableView:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;

  v4 = a3;
  -[CDPTableViewController headerView](self, "headerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  objc_msgSend(v5, "heightForWidth:inView:", v4, v6);
  v8 = v7;

  return v8;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 0;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 0;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  return objc_alloc_init(MEMORY[0x24BEBD9F8]);
}

- (NSString)headerTitle
{
  return self->_headerTitle;
}

- (NSString)headerSubTitle
{
  return self->_headerSubTitle;
}

- (int64_t)tableViewStyle
{
  return self->_tableViewStyle;
}

- (void)setTableViewStyle:(int64_t)a3
{
  self->_tableViewStyle = a3;
}

- (UIImage)icon
{
  return self->_icon;
}

- (void)setIcon:(id)a3
{
  objc_storeStrong((id *)&self->_icon, a3);
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1000);
}

- (UIView)containerView
{
  return self->_containerView;
}

- (void)setContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_containerView, a3);
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
  objc_storeStrong((id *)&self->_tableView, a3);
}

- (void)setHeaderView:(id)a3
{
  objc_storeStrong((id *)&self->_headerView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_headerSubTitle, 0);
  objc_storeStrong((id *)&self->_headerTitle, 0);
}

@end
