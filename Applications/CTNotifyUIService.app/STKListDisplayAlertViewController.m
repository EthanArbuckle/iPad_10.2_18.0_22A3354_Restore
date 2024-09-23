@implementation STKListDisplayAlertViewController

- (BOOL)validateAction:(id)a3
{
  id v3;
  uint64_t v4;
  char isKindOfClass;

  v3 = a3;
  v4 = objc_opt_class(STKListItemsSessionAction);
  isKindOfClass = objc_opt_isKindOfClass(v3, v4);

  return isKindOfClass & 1;
}

- (id)_simToolkitListItems
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[STKBaseAlertViewController sessionAction](self, "sessionAction"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "sessionData"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "listItems"));

  return v4;
}

- (void)_selectListItem:(unint64_t)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[STKBaseAlertViewController sessionAction](self, "sessionAction"));
  objc_msgSend(v4, "sendSuccessWithSelectedItemIndex:", a3);

}

- (void)viewDidLoad
{
  void *v3;
  UITableView *v4;
  UITableView *table;
  UITableView *v6;
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
  objc_super v24;
  _QWORD v25[4];

  v24.receiver = self;
  v24.super_class = (Class)STKListDisplayAlertViewController;
  -[STKBaseAlertViewController viewDidLoad](&v24, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[STKListDisplayAlertViewController view](self, "view"));
  v4 = (UITableView *)objc_msgSend(objc_alloc((Class)UITableView), "initWithFrame:style:", 1, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  table = self->_table;
  self->_table = v4;

  -[UITableView setTranslatesAutoresizingMaskIntoConstraints:](self->_table, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UITableView setDelegate:](self->_table, "setDelegate:", self);
  -[UITableView setDataSource:](self->_table, "setDataSource:", self);
  v6 = self->_table;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  -[UITableView setBackgroundColor:](v6, "setBackgroundColor:", v7);

  -[UITableView setAlpha:](self->_table, "setAlpha:", 1.0);
  -[UITableView setOpaque:](self->_table, "setOpaque:", 0);
  -[UITableView setEstimatedRowHeight:](self->_table, "setEstimatedRowHeight:", 100.0);
  -[UITableView setRowHeight:](self->_table, "setRowHeight:", UITableViewAutomaticDimension);
  objc_msgSend(v3, "addSubview:", self->_table);
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView widthAnchor](self->_table, "widthAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "widthAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "constraintEqualToAnchor:", v22));
  v25[0] = v21;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView centerXAnchor](self->_table, "centerXAnchor"));
  v18 = v3;
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "centerXAnchor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "constraintEqualToAnchor:", v19));
  v25[1] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView topAnchor](self->_table, "topAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[STKBaseAlertViewController topBar](self, "topBar"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "bottomAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintEqualToAnchor:", v11));
  v25[2] = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView bottomAnchor](self->_table, "bottomAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "safeAreaLayoutGuide"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "bottomAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintEqualToAnchor:", v15));
  v25[3] = v16;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v25, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v17);

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  const __CFString *v17;
  id v18;
  double v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  objc_super v24;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[STKBaseAlertViewController sessionAction](self, "sessionAction"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "sessionData"));
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "text"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[STKBaseAlertViewController sessionAction](self, "sessionAction"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "sessionData"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "simLabel"));

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[STKBaseAlertViewController sessionAction](self, "sessionAction"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "sessionData"));
    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "simLabel"));
    v14 = (void *)v13;
    v15 = &stru_100014540;
    if (v7)
      v15 = v7;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(%@) %@"), v13, v15));

  }
  else
  {
    v17 = &stru_100014540;
    if (v7)
      v17 = v7;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@"), v17));
  }
  if (objc_msgSend(v16, "length"))
  {
    v18 = objc_alloc((Class)UILabel);
    -[UITableView bounds](self->_table, "bounds");
    v20 = objc_msgSend(v18, "initWithSize:", v19, 20.0);
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
    objc_msgSend(v20, "setBackgroundColor:", v21);

    v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    objc_msgSend(v20, "setTextColor:", v22);

    objc_msgSend(v20, "setTextAlignment:", 1);
    objc_msgSend(v20, "setText:", v16);
    objc_msgSend(v20, "setNumberOfLines:", 0);
    objc_msgSend(v20, "sizeToFit");
    objc_msgSend(v20, "bounds");
    objc_msgSend(v20, "setBounds:");
    -[UITableView setTableHeaderView:](self->_table, "setTableHeaderView:", v20);

  }
  -[UITableView reloadData](self->_table, "reloadData");
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[STKListDisplayAlertViewController view](self, "view"));
  objc_msgSend(v23, "bringSubviewToFront:", self->_table);

  v24.receiver = self;
  v24.super_class = (Class)STKListDisplayAlertViewController;
  -[STKListDisplayAlertViewController viewWillAppear:](&v24, "viewWillAppear:", v3);

}

- (void)leftNavigationButtonPressed
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[STKBaseAlertViewController sessionAction](self, "sessionAction"));
  objc_msgSend(v3, "sendResponse:", 4);

  -[STKBaseAlertViewController dismiss](self, "dismiss");
}

- (void)rightNavigationButtonPressed
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[STKBaseAlertViewController sessionAction](self, "sessionAction"));
  objc_msgSend(v3, "sendResponse:", 1);

  -[STKBaseAlertViewController dismiss](self, "dismiss");
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v4;
  id v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[STKListDisplayAlertViewController _simToolkitListItems](self, "_simToolkitListItems", a3, a4));
  v5 = objc_msgSend(v4, "count");

  return (int64_t)v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
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

  v5 = a4;
  v6 = objc_msgSend(objc_alloc((Class)UITableViewCell), "initWithStyle:reuseIdentifier:", 0, CFSTR("name"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[STKListDisplayAlertViewController _simToolkitListItems](self, "_simToolkitListItems"));
  v8 = objc_msgSend(v5, "row");

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndex:", v8));
  if (objc_msgSend(v9, "isSelected"))
    v10 = 3;
  else
    v10 = 0;
  objc_msgSend(v6, "setAccessoryType:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "textLabel"));
  objc_msgSend(v11, "setLineBreakMode:", 0);

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "textLabel"));
  objc_msgSend(v12, "setNumberOfLines:", 0);

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "textLabel"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "text"));
  objc_msgSend(v13, "setText:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "textLabel"));
  objc_msgSend(v15, "setTextAlignment:", 1);

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "textLabel"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  objc_msgSend(v16, "setTextColor:", v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "textLabel"));
  objc_msgSend(v18, "setOpaque:", 0);

  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "textLabel"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  objc_msgSend(v19, "setBackgroundColor:", v20);

  objc_msgSend(v6, "setOpaque:", 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  objc_msgSend(v6, "setBackgroundColor:", v21);

  return v6;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  void *v5;
  id v6;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView indexPathForSelectedRow](self->_table, "indexPathForSelectedRow", a3, a4));
  if (v5)
  {
    v6 = v5;
    -[STKListDisplayAlertViewController _selectListItem:](self, "_selectListItem:", objc_msgSend(v5, "row"));
    -[UITableView deselectRowAtIndexPath:animated:](self->_table, "deselectRowAtIndexPath:animated:", v6, 1);
    -[STKBaseAlertViewController dismiss](self, "dismiss");
    v5 = v6;
  }

}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  return UITableViewAutomaticDimension;
}

- (id)newTopBar
{
  id v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;

  v3 = objc_alloc_init((Class)UINavigationBar);
  objc_msgSend(v3, "setDelegate:", self);
  objc_msgSend(v3, "_setHidesShadow:", 1);
  objc_msgSend(v3, "setBarStyle:", 1);
  v4 = objc_alloc_init((Class)UIImage);
  objc_msgSend(v3, "setBackgroundImage:forBarMetrics:", v4, 0);

  v5 = objc_alloc((Class)UINavigationItem);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithIdentifier:](NSBundle, "bundleWithIdentifier:", CFSTR("com.apple.CTNotifyUIService")));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("BACK"), &stru_100014540, CFSTR("SIMToolkitUI")));
  v8 = objc_msgSend(v5, "initWithTitle:", v7);

  objc_msgSend(v3, "pushNavigationItem:animated:", v8, 0);
  v9 = objc_msgSend(objc_alloc((Class)UINavigationItem), "initWithTitle:", &stru_100014540);
  v10 = objc_alloc((Class)UIBarButtonItem);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithIdentifier:](NSBundle, "bundleWithIdentifier:", CFSTR("com.apple.CTNotifyUIService")));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_100014540, CFSTR("SIMToolkitUI")));
  v13 = objc_msgSend(v10, "initWithTitle:style:target:action:", v12, 0, self, "rightNavigationButtonPressed");

  objc_msgSend(v9, "setRightBarButtonItem:", v13);
  objc_msgSend(v3, "pushNavigationItem:animated:", v9, 0);

  return v3;
}

- (BOOL)navigationBar:(id)a3 shouldPopItem:(id)a4
{
  if ((objc_opt_respondsToSelector(self, "leftNavigationButtonPressed", a3, a4) & 1) != 0)
    -[STKListDisplayAlertViewController performSelector:withObject:](self, "performSelector:withObject:", "leftNavigationButtonPressed", 0);
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_table, 0);
}

@end
