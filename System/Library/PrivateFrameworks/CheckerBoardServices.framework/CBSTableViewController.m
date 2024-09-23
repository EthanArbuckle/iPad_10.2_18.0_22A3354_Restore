@implementation CBSTableViewController

- (void)viewDidLoad
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[16];

  CheckerBoardLogHandleForCategory(4);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22F698000, v3, OS_LOG_TYPE_DEFAULT, "Created a square", buf, 2u);
  }

  v4.receiver = self;
  v4.super_class = (Class)CBSTableViewController;
  -[CBSTableViewController viewDidLoad](&v4, sel_viewDidLoad);
  -[CBSTableViewController _setupView](self, "_setupView");
  -[CBSTableViewController _updateHeaderView](self, "_updateHeaderView");
}

- (void)_setupView
{
  -[CBSTableViewController _setupTableView](self, "_setupTableView");
  -[CBSTableViewController _setupFooterView](self, "_setupFooterView");
}

- (void)_setupTableView
{
  id v3;
  void *v4;
  UITableView *v5;
  UITableView *tableView;
  void *v7;
  id v8;

  v3 = objc_alloc(MEMORY[0x24BDF6E58]);
  -[CBSTableViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frame");
  v5 = (UITableView *)objc_msgSend(v3, "initWithFrame:style:", 1);
  tableView = self->_tableView;
  self->_tableView = v5;

  objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITableView setBackgroundColor:](self->_tableView, "setBackgroundColor:", v7);

  -[UITableView setDelegate:](self->_tableView, "setDelegate:", self);
  -[UITableView setDataSource:](self->_tableView, "setDataSource:", self);
  -[UITableView setAutoresizingMask:](self->_tableView, "setAutoresizingMask:", 18);
  -[CBSTableViewController view](self, "view");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addSubview:", self->_tableView);

}

- (void)_updateHeaderView
{
  void *v3;
  char isKindOfClass;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;

  -[CBSTableViewController headerView](self, "headerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[CBSTableViewController titleText](self, "titleText");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    -[CBSTableViewController detailDescriptionText](self, "detailDescriptionText");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CBSTableViewController attributedDetailDescriptionText](self, "attributedDetailDescriptionText");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CBSTableViewController iconName](self, "iconName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CBSTableViewController iconTintColor](self, "iconTintColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CBSTableViewController headerView](self, "headerView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v16, "length") || objc_msgSend(v5, "length") || objc_msgSend(v6, "length"))
    {
      objc_msgSend(v9, "setTitleText:", v16);
      v10 = objc_msgSend(v6, "length");
      objc_msgSend(v9, "detailTextLabel");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (v10)
        objc_msgSend(v11, "setAttributedText:", v6);
      else
        objc_msgSend(v11, "setText:", v5);

    }
    if (v7 && objc_msgSend(v7, "length"))
    {
      objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:", v7);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if (v8)
      {
        objc_msgSend(v13, "_flatImageWithColor:", v8);
        v15 = objc_claimAutoreleasedReturnValue();

        v14 = (void *)v15;
      }
      objc_msgSend(v9, "setIcon:", v14);

    }
  }
}

- (void)_setupFooterView
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[CBSTableViewController footerView](self, "footerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x24BDF6F90]);
    objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "userInterfaceIdiom");

    v7 = (void *)objc_msgSend(v4, "initWithFrame:", 0.0, 0.0, 0.0, dbl_22F69F610[(v6 & 0xFFFFFFFFFFFFFFFBLL) == 1]);
    -[CBSTableViewController setContainerFooterView:](self, "setContainerFooterView:", v7);

    -[CBSTableViewController containerFooterView](self, "containerFooterView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "frame");
    -[CBSTableViewController setContainerFooterViewFrame:](self, "setContainerFooterViewFrame:");

    -[CBSTableViewController containerFooterView](self, "containerFooterView");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    -[CBSTableViewController footerView](self, "footerView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addSubview:", v9);

  }
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  double v4;
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;

  if (a4)
    return *MEMORY[0x24BDF7DE0];
  v6 = a3;
  -[CBSTableViewController headerView](self, "headerView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "frame");
  v9 = v8;

  objc_msgSend(v7, "systemLayoutSizeFittingSize:", v9, *(double *)(MEMORY[0x24BDF7B88] + 8));
  v11 = v10;
  -[CBSTableViewController headerToFooterViewSpacing](self, "headerToFooterViewSpacing");
  v4 = v11 + v12;

  return v4;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  double v4;
  void *v5;
  double v6;

  if (a4)
    return *MEMORY[0x24BDF7DE0];
  -[CBSTableViewController containerFooterView](self, "containerFooterView", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "frame");
  v4 = v6;

  return v4;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
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
    -[CBSTableViewController headerView](self, "headerView", a3, v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
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
    -[CBSTableViewController containerFooterView](self, "containerFooterView", a3, v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (void)setTitleText:(id)a3
{
  NSString *v5;
  int v6;
  NSString *v7;

  v5 = (NSString *)a3;
  if (self->_titleText != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_titleText, a3);
    v6 = -[CBSTableViewController isViewLoaded](self, "isViewLoaded");
    v5 = v7;
    if (v6)
    {
      -[CBSTableViewController _updateHeaderView](self, "_updateHeaderView");
      v5 = v7;
    }
  }

}

- (void)setDetailDescriptionText:(id)a3
{
  NSString *v5;
  int v6;
  NSString *v7;

  v5 = (NSString *)a3;
  if (self->_detailDescriptionText != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_detailDescriptionText, a3);
    v6 = -[CBSTableViewController isViewLoaded](self, "isViewLoaded");
    v5 = v7;
    if (v6)
    {
      -[CBSTableViewController _updateHeaderView](self, "_updateHeaderView");
      v5 = v7;
    }
  }

}

- (void)setAttributedDetailDescriptionText:(id)a3
{
  NSAttributedString *v5;
  int v6;
  NSAttributedString *v7;

  v5 = (NSAttributedString *)a3;
  if (self->_attributedDetailDescriptionText != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_attributedDetailDescriptionText, a3);
    v6 = -[CBSTableViewController isViewLoaded](self, "isViewLoaded");
    v5 = v7;
    if (v6)
    {
      -[CBSTableViewController _updateHeaderView](self, "_updateHeaderView");
      v5 = v7;
    }
  }

}

- (id)headerView
{
  BFFPaneHeaderView *headerView;
  id v4;
  BFFPaneHeaderView *v5;
  BFFPaneHeaderView *v6;

  headerView = self->_headerView;
  if (!headerView)
  {
    v4 = objc_alloc(MEMORY[0x24BE858E0]);
    v5 = (BFFPaneHeaderView *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    v6 = self->_headerView;
    self->_headerView = v5;

    headerView = self->_headerView;
  }
  return headerView;
}

- (id)iconName
{
  return 0;
}

- (id)iconTintColor
{
  return 0;
}

- (double)headerToFooterViewSpacing
{
  return 0.0;
}

- (id)footerView
{
  return 0;
}

- (BOOL)isTitleAlignedByLastBaseline
{
  return 0;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  id v3;

  v3 = a3;
  __assert_rtn("-[CBSTableViewController numberOfSectionsInTableView:]", "CBSTableViewController.m", 232, "0");
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v4;

  v4 = a3;
  __assert_rtn("-[CBSTableViewController tableView:numberOfRowsInSection:]", "CBSTableViewController.m", 239, "0");
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  v6 = a4;
  __assert_rtn("-[CBSTableViewController tableView:cellForRowAtIndexPath:]", "CBSTableViewController.m", 246, "0");
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (CGRect)containerFooterViewFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_containerFooterViewFrame.origin.x;
  y = self->_containerFooterViewFrame.origin.y;
  width = self->_containerFooterViewFrame.size.width;
  height = self->_containerFooterViewFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setContainerFooterViewFrame:(CGRect)a3
{
  self->_containerFooterViewFrame = a3;
}

- (NSString)titleText
{
  return self->_titleText;
}

- (NSString)detailDescriptionText
{
  return self->_detailDescriptionText;
}

- (NSAttributedString)attributedDetailDescriptionText
{
  return self->_attributedDetailDescriptionText;
}

- (UIView)containerFooterView
{
  return self->_containerFooterView;
}

- (void)setContainerFooterView:(id)a3
{
  objc_storeStrong((id *)&self->_containerFooterView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerFooterView, 0);
  objc_storeStrong((id *)&self->_attributedDetailDescriptionText, 0);
  objc_storeStrong((id *)&self->_detailDescriptionText, 0);
  objc_storeStrong((id *)&self->_titleText, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
}

@end
