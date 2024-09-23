@implementation SLSheetRootViewController

- (void)dealloc
{
  uint64_t v2;
  objc_super v4;

  _SLLog(v2, 7, CFSTR("SLSheetRootViewController dealloc"));
  -[SLSheetRootViewController resetConfigurationItems](self, "resetConfigurationItems");
  v4.receiver = self;
  v4.super_class = (Class)SLSheetRootViewController;
  -[SLSheetRootViewController dealloc](&v4, sel_dealloc);
}

- (void)loadView
{
  uint64_t v2;
  void *v4;
  void *v5;
  UITableViewController *v6;
  UITableViewController *tableViewController;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
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
  double v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  void *v36;
  objc_super v37;

  _SLLog(v2, 7, CFSTR("SLSheetRootViewController loadView"));
  v37.receiver = self;
  v37.super_class = (Class)SLSheetRootViewController;
  -[SLSheetRootViewController loadView](&v37, sel_loadView);
  -[SLSheetRootViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setOpaque:", 0);

  -[SLSheetRootViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAutoresizingMask:", 18);

  -[SLSheetRootViewController setEdgesForExtendedLayout:](self, "setEdgesForExtendedLayout:", 0);
  v6 = (UITableViewController *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA68]), "initWithStyle:", 0);
  tableViewController = self->_tableViewController;
  self->_tableViewController = v6;

  -[UITableViewController willMoveToParentViewController:](self->_tableViewController, "willMoveToParentViewController:", self);
  -[SLSheetRootViewController addChildViewController:](self, "addChildViewController:", self->_tableViewController);
  -[SLSheetRootViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITableViewController view](self->_tableViewController, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addSubview:", v9);

  -[SLSheetRootViewController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bounds");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  -[UITableViewController view](self->_tableViewController, "view");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setFrame:", v12, v14, v16, v18);

  -[UITableViewController view](self->_tableViewController, "view");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setAutoresizingMask:", 34);

  -[UITableViewController didMoveToParentViewController:](self->_tableViewController, "didMoveToParentViewController:", self);
  -[UITableViewController tableView](self->_tableViewController, "tableView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setDelegate:", self);

  -[UITableViewController tableView](self->_tableViewController, "tableView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setDataSource:", self);

  -[UITableViewController tableView](self->_tableViewController, "tableView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setOpaque:", 0);

  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITableViewController tableView](self->_tableViewController, "tableView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setBackgroundColor:", v24);

  -[UITableViewController tableView](self->_tableViewController, "tableView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "backgroundView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setOpaque:", 0);

  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITableViewController tableView](self->_tableViewController, "tableView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "backgroundView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setBackgroundColor:", v28);

  v31 = *MEMORY[0x1E0CEBC10];
  -[UITableViewController tableView](self->_tableViewController, "tableView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setRowHeight:", v31);

  objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB538]);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "lineHeight");
  v35 = v34 + v34;
  -[UITableViewController tableView](self->_tableViewController, "tableView");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setEstimatedRowHeight:", v35);

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SLSheetRootViewController;
  -[SLSheetRootViewController viewDidLoad](&v5, sel_viewDidLoad);
  -[SLSheetRootViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSeparatorStyle:", 1);

  -[SLSheetRootViewController tableView](self, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setMarginWidth:", 0.0);

}

- (void)viewDidLayoutSubviews
{
  uint64_t v2;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)SLSheetRootViewController;
  -[SLSheetRootViewController viewDidLayoutSubviews](&v18, sel_viewDidLayoutSubviews);
  -[UITableViewController view](self->_tableViewController, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frame");
  v6 = v5;
  v8 = v7;
  v10 = v9;

  -[SLSheetRootViewController _preferredTableViewHeight](self, "_preferredTableViewHeight");
  v12 = v11;
  -[SLSheetRootViewController view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "frame");
  v15 = v14;

  if (v12 >= v15)
    v12 = v15;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", v6, v8, v10, v12);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  _SLLog(v2, 7, CFSTR("SLSheetRootViewController viewDidLayoutSubviews setting _tableViewController.view.frame to %@"));

  -[UITableViewController view](self->_tableViewController, "view", v17);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setFrame:", v6, v8, v10, v12);

}

- (UITableView)tableView
{
  id v3;

  v3 = (id)-[SLSheetRootViewController view](self, "view");
  return -[UITableViewController tableView](self->_tableViewController, "tableView");
}

- (void)setContentView:(id)a3
{
  UIView **p_contentView;
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  UIView *v11;
  id v12;

  p_contentView = &self->_contentView;
  objc_storeStrong((id *)&self->_contentView, a3);
  v6 = a3;
  -[SLSheetRootViewController tableView](self, "tableView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  v9 = v8;
  -[UIView intrinsicContentSize](*p_contentView, "intrinsicContentSize");
  -[UIView setBounds:](*p_contentView, "setBounds:", 0.0, 0.0, v9, v10);

  v11 = *p_contentView;
  -[SLSheetRootViewController tableView](self, "tableView");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setTableHeaderView:", v11);

}

- (void)setTitle:(id)a3
{
  id v4;
  double v5;
  double v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SLSheetRootViewController;
  v4 = a3;
  -[SLSheetRootViewController setTitle:](&v7, sel_setTitle_, v4);
  -[SLSheetTitleView setTitle:](self->_titleView, "setTitle:", v4, v7.receiver, v7.super_class);
  -[SLSheetTitleView intrinsicContentSize](self->_titleView, "intrinsicContentSize");
  -[SLSheetTitleView setBounds:](self->_titleView, "setBounds:", 0.0, 0.0, v5, v6);
  -[UINavigationItem setTitle:](self->_navItem, "setTitle:", v4);

}

- (void)setServiceIconImage:(id)a3
{
  double v5;
  double v6;
  id v7;

  objc_storeStrong((id *)&self->_serviceIconImage, a3);
  v7 = a3;
  -[SLSheetTitleView setServiceIconImage:](self->_titleView, "setServiceIconImage:", v7);
  -[SLSheetTitleView intrinsicContentSize](self->_titleView, "intrinsicContentSize");
  -[SLSheetTitleView setBounds:](self->_titleView, "setBounds:", 0.0, 0.0, v5, v6);

}

- (void)setPostButtonTitle:(id)a3
{
  uint64_t v3;
  id v5;
  id v6;

  v5 = a3;
  _SLLog(v3, 7, CFSTR("setPostButtonTitle %@"));
  -[UINavigationItem rightBarButtonItem](self->_navItem, "rightBarButtonItem", v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTitle:", v5);

}

- (void)setPostButtonEnabled:(BOOL)a3
{
  uint64_t v3;
  _BOOL8 v4;
  _BOOL8 v6;
  id v7;

  v4 = a3;
  v6 = a3;
  _SLLog(v3, 7, CFSTR("setPostButtonEnabled %d"));
  -[UINavigationItem rightBarButtonItem](self->_navItem, "rightBarButtonItem", v6);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setEnabled:", v4);

}

- (double)_preferredTableViewHeight
{
  void *v2;
  double v3;
  double v4;

  -[UITableViewController tableView](self->_tableViewController, "tableView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sizeThatFits:", 0.0, 1100.0);
  v4 = v3;

  return v4;
}

- (id)navigationItem
{
  UINavigationItem *navItem;
  id v4;
  void *v5;
  UINavigationItem *v6;
  UINavigationItem *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  SLSheetTitleView *v18;
  SLSheetTitleView *titleView;
  SLSheetTitleView *v20;
  void *v21;
  SLSheetTitleView *v22;
  void *v23;
  double v24;
  double v25;

  navItem = self->_navItem;
  if (!navItem)
  {
    v4 = objc_alloc(MEMORY[0x1E0CEA7C0]);
    -[SLSheetRootViewController title](self, "title");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (UINavigationItem *)objc_msgSend(v4, "initWithTitle:", v5);
    v7 = self->_navItem;
    self->_navItem = v6;

    v8 = objc_alloc(MEMORY[0x1E0CEA380]);
    SLSocialFrameworkBundle();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_1E7592238, CFSTR("Localizable"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SLSheetRootViewController delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v8, "initWithTitle:style:target:action:", v10, 0, v11, sel_cancelButtonTapped_);
    -[UINavigationItem setLeftBarButtonItem:](self->_navItem, "setLeftBarButtonItem:", v12);

    v13 = objc_alloc(MEMORY[0x1E0CEA380]);
    SLSocialFrameworkBundle();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("POST"), &stru_1E7592238, CFSTR("Localizable"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SLSheetRootViewController delegate](self, "delegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v13, "initWithTitle:style:target:action:", v15, 2, v16, sel_postButtonTapped_);
    -[UINavigationItem setRightBarButtonItem:](self->_navItem, "setRightBarButtonItem:", v17);

    v18 = objc_alloc_init(SLSheetTitleView);
    titleView = self->_titleView;
    self->_titleView = v18;

    v20 = self->_titleView;
    -[SLSheetRootViewController serviceIconImage](self, "serviceIconImage");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[SLSheetTitleView setServiceIconImage:](v20, "setServiceIconImage:", v21);

    v22 = self->_titleView;
    -[SLSheetRootViewController title](self, "title");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[SLSheetTitleView setTitle:](v22, "setTitle:", v23);

    -[SLSheetTitleView intrinsicContentSize](self->_titleView, "intrinsicContentSize");
    -[SLSheetTitleView setBounds:](self->_titleView, "setBounds:", 0.0, 0.0, v24, v25);
    -[UINavigationItem setTitleView:](self->_navItem, "setTitleView:", self->_titleView);
    navItem = self->_navItem;
  }
  return navItem;
}

- (void)updateContentViewSize:(CGSize)a3
{
  uint64_t v3;
  double height;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  height = a3.height;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGSize:", a3.width);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  _SLLog(v3, 7, CFSTR("SLSheetRootViewController updateContentViewSize: %@"));

  -[SLSheetRootViewController tableView](self, "tableView", v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  v8 = v7;
  -[SLSheetRootViewController contentView](self, "contentView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFrame:", 0.0, 0.0, v8, height);

  if (!self->_autoCompletionViewController)
  {
    -[SLSheetRootViewController contentView](self, "contentView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SLSheetRootViewController tableView](self, "tableView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setTableHeaderView:", v10);

  }
  -[SLSheetRootViewController view](self, "view");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setNeedsLayout");

}

- (void)presentAutoCompletionViewController:(id)a3 apparentContentHeight:(double)a4 contentViewChangeBlock:(id)a5
{
  uint64_t v5;
  UIViewController *v9;
  id v10;
  UIViewController *autoCompletionViewController;
  UIViewController *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  void *v44;
  double v45;
  double v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  _QWORD v53[5];
  id v54;

  v9 = (UIViewController *)a3;
  v10 = a5;
  _SLLog(v5, 7, CFSTR("SLSheetRootViewController presentAutoCompletionViewController:"));
  autoCompletionViewController = self->_autoCompletionViewController;
  self->_autoCompletionViewController = v9;
  v12 = v9;

  -[SLSheetRootViewController tableView](self, "tableView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setTableHeaderView:", 0);

  -[SLSheetRootViewController view](self, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[SLSheetRootViewController contentView](self, "contentView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addSubview:", v15);

  -[SLSheetRootViewController tableView](self, "tableView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "frame");
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v24 = v23;

  -[SLSheetRootViewController contentView](self, "contentView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "frame");
  v27 = v20 + v26;

  -[SLSheetRootViewController contentView](self, "contentView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "frame");
  v30 = v24 - v29;

  -[SLSheetRootViewController tableView](self, "tableView");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setFrame:", v18, v27, v22, v30);

  -[UIViewController view](self->_autoCompletionViewController, "view");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setAlpha:", 0.0);

  -[UIViewController willMoveToParentViewController:](self->_autoCompletionViewController, "willMoveToParentViewController:", self);
  -[SLSheetRootViewController addChildViewController:](self, "addChildViewController:", self->_autoCompletionViewController);
  -[SLSheetRootViewController view](self, "view");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIViewController view](self->_autoCompletionViewController, "view");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "addSubview:", v34);

  -[UIViewController didMoveToParentViewController:](self->_autoCompletionViewController, "didMoveToParentViewController:", self);
  -[SLSheetRootViewController view](self, "view");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "bounds");
  v37 = v36;
  v39 = v38;
  v41 = v40;
  v43 = v42;

  -[SLSheetRootViewController contentView](self, "contentView");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "frame");
  v46 = v39 + v45 + a4;

  -[UIViewController view](self->_autoCompletionViewController, "view");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setFrame:", v37, v46, v41, v43 - v46);

  -[UIViewController view](self->_autoCompletionViewController, "view");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "setAutoresizingMask:", 18);

  -[SLSheetRootViewController view](self, "view");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIViewController view](self->_autoCompletionViewController, "view");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "bringSubviewToFront:", v50);

  v51 = (void *)MEMORY[0x1E0CEABB0];
  v53[0] = MEMORY[0x1E0C809B0];
  v53[1] = 3221225472;
  v53[2] = __110__SLSheetRootViewController_presentAutoCompletionViewController_apparentContentHeight_contentViewChangeBlock___block_invoke;
  v53[3] = &unk_1E7590480;
  v53[4] = self;
  v54 = v10;
  v52 = v10;
  objc_msgSend(v51, "animateWithDuration:animations:", v53, 0.200000003);

}

uint64_t __110__SLSheetRootViewController_presentAutoCompletionViewController_apparentContentHeight_contentViewChangeBlock___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 0.0);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1000), "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", 1.0);

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)dismissAutoCompletionViewControllerWithContentViewChangeBlock:(id)a3
{
  uint64_t v3;
  id v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v19[5];
  _QWORD v20[5];
  id v21;

  v5 = a3;
  _SLLog(v3, 7, CFSTR("SLSheetRootViewController dismissAutoCompletionViewController"));
  -[SLSheetRootViewController tableView](self, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "frame");
  v8 = v7;
  v10 = v9;
  v12 = v11;

  -[SLSheetRootViewController contentView](self, "contentView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "frame");
  v15 = v14;

  -[SLSheetRootViewController tableView](self, "tableView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setFrame:", v8, v15, v10, v12);

  v17 = (void *)MEMORY[0x1E0CEABB0];
  v19[4] = self;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __91__SLSheetRootViewController_dismissAutoCompletionViewControllerWithContentViewChangeBlock___block_invoke;
  v20[3] = &unk_1E7590480;
  v20[4] = self;
  v21 = v5;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __91__SLSheetRootViewController_dismissAutoCompletionViewControllerWithContentViewChangeBlock___block_invoke_2;
  v19[3] = &unk_1E7590968;
  v18 = v5;
  objc_msgSend(v17, "animateWithDuration:animations:completion:", v20, v19, 0.200000003);

}

uint64_t __91__SLSheetRootViewController_dismissAutoCompletionViewControllerWithContentViewChangeBlock___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 1.0);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1000), "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", 0.0);

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __91__SLSheetRootViewController_dismissAutoCompletionViewControllerWithContentViewChangeBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;

  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  v5 = v4;
  v7 = v6;
  v9 = v8;

  objc_msgSend(*(id *)(a1 + 32), "contentView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "frame");
  v12 = v9 + v11;

  _SLLog(v1, 7, CFSTR("presentAutoCompletionViewController restored tableView.frame %g %g %g %g"));
  objc_msgSend(*(id *)(a1 + 32), "tableView", *(_QWORD *)&v5, 0, *(_QWORD *)&v7, *(_QWORD *)&v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setFrame:", v5, 0.0, v7, v12);

  objc_msgSend(*(id *)(a1 + 32), "contentView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setTableHeaderView:", v14);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1000), "willMoveToParentViewController:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1000), "removeFromParentViewController");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1000), "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "removeFromSuperview");

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1000), "didMoveToParentViewController:", 0);
  v17 = *(_QWORD *)(a1 + 32);
  v18 = *(void **)(v17 + 1000);
  *(_QWORD *)(v17 + 1000) = 0;

}

- (void)resetConfigurationItems
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSArray *configurationItems;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = self->_configurationItems;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7++), "setChangeObserver:", 0, (_QWORD)v9);
      }
      while (v5 != v7);
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  configurationItems = self->_configurationItems;
  self->_configurationItems = 0;

}

- (void)observeConfigurationItems:(id)a3
{
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = self->_configurationItems;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "setChangeObserver:", self, (_QWORD)v9);
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)setConfigurationItems:(id)a3
{
  id v4;
  NSArray *v5;
  NSArray *configurationItems;
  void *v7;
  id v8;

  v4 = a3;
  -[SLSheetRootViewController resetConfigurationItems](self, "resetConfigurationItems");
  v5 = (NSArray *)objc_msgSend(v4, "copy");

  configurationItems = self->_configurationItems;
  self->_configurationItems = v5;

  -[SLSheetRootViewController observeConfigurationItems:](self, "observeConfigurationItems:", self->_configurationItems);
  -[SLSheetRootViewController tableView](self, "tableView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "reloadData");

  -[SLSheetRootViewController view](self, "view");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setNeedsLayout");

}

- (NSArray)configurationItems
{
  return self->_configurationItems;
}

- (void)_updateCellForConfigurationItem:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", -[NSArray indexOfObject:](self->_configurationItems, "indexOfObject:"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SLSheetRootViewController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cellForRowAtIndexPath:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[SLSheetRootViewController _updateCell:withConfigurationItem:](self, "_updateCell:withConfigurationItem:", v6, v7);
    objc_msgSend(v6, "setNeedsLayout");
  }

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return -[NSArray count](self->_configurationItems, "count", a3, a4);
}

- (void)_updateCell:(id)a3 withConfigurationItem:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;

  v14 = a3;
  v5 = a4;
  objc_msgSend(v5, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "textLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setText:", v6);

  objc_msgSend(v5, "value");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "detailTextLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setText:", v8);

  if (objc_msgSend(v5, "valuePending"))
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA2C8]), "initWithActivityIndicatorStyle:", 100);
    objc_msgSend(v14, "setAccessoryView:", v10);
    objc_msgSend(v10, "startAnimating");
    objc_msgSend(v14, "setSelectionStyle:", 2);

  }
  else
  {
    objc_msgSend(v5, "tapHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "setAccessoryView:", 0);
    if (v11)
    {
      objc_msgSend(v14, "setAccessoryType:", 1);
      v12 = v14;
      v13 = 2;
    }
    else
    {
      objc_msgSend(v14, "setAccessoryType:", 0);
      v12 = v14;
      v13 = 0;
    }
    objc_msgSend(v12, "setSelectionStyle:", v13);
  }

}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("SLComposeSheetConfigurationItemCell"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA60]), "initWithStyle:reuseIdentifier:", 1, CFSTR("SLComposeSheetConfigurationItemCell"));
    objc_msgSend(v7, "setAccessoryType:", 1);
    objc_msgSend(v7, "separatorInset");
    objc_msgSend(v7, "setSeparatorInset:");
  }
  -[NSArray objectAtIndexedSubscript:](self->_configurationItems, "objectAtIndexedSubscript:", objc_msgSend(v6, "row"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SLSheetRootViewController _updateCell:withConfigurationItem:](self, "_updateCell:withConfigurationItem:", v7, v8);

  return v7;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v5;
  id v6;

  v5 = a4;
  objc_msgSend(v5, "setOpaque:", 0);
  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v6);

}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  NSArray *configurationItems;
  id v6;
  void *v7;
  void (**v8)(void);
  void *v9;
  id v10;

  configurationItems = self->_configurationItems;
  v6 = a4;
  -[NSArray objectAtIndexedSubscript:](configurationItems, "objectAtIndexedSubscript:", objc_msgSend(v6, "row"));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "tapHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v10, "tapHandler");
    v8 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v8[2]();

  }
  -[SLSheetRootViewController tableView](self, "tableView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "deselectRowAtIndexPath:animated:", v6, 1);

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (SLComposeServiceViewController)delegate
{
  return (SLComposeServiceViewController *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIView)contentView
{
  return self->_contentView;
}

- (UIImage)serviceIconImage
{
  return self->_serviceIconImage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceIconImage, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_autoCompletionViewController, 0);
  objc_storeStrong((id *)&self->_navItem, 0);
  objc_storeStrong((id *)&self->_titleView, 0);
  objc_storeStrong((id *)&self->_tableViewController, 0);
  objc_storeStrong((id *)&self->_configurationItems, 0);
}

@end
