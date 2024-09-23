@implementation PHSOSNumbersViewController

- (PHSOSNumbersViewController)initWithSOSHandles:(id)a3
{
  id v5;
  PHSOSNumbersViewController *v6;
  PHSOSNumbersViewController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PHSOSNumbersViewController;
  v6 = -[PHSOSNumbersViewController init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_sosHandles, a3);

  return v7;
}

- (void)viewDidLoad
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  UIView *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  objc_class *v17;
  NSString *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
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
  objc_super v34;

  v34.receiver = self;
  v34.super_class = (Class)PHSOSNumbersViewController;
  -[PHSOSNumbersViewController viewDidLoad](&v34, "viewDidLoad");
  v3 = objc_msgSend(objc_alloc((Class)UITableView), "initWithFrame:style:", 0, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  -[PHSOSNumbersViewController setTableView:](self, "setTableView:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSNumbersViewController tableView](self, "tableView"));
  objc_msgSend(v5, "setBackgroundColor:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSNumbersViewController tableView](self, "tableView"));
  objc_msgSend(v6, "setDelegate:", self);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSNumbersViewController tableView](self, "tableView"));
  objc_msgSend(v7, "setDataSource:", self);

  v8 = objc_opt_new(UIView);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSNumbersViewController tableView](self, "tableView"));
  objc_msgSend(v9, "setTableFooterView:", v8);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSNumbersViewController tableView](self, "tableView"));
  objc_msgSend(v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor darkGrayColor](UIColor, "darkGrayColor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSNumbersViewController tableView](self, "tableView"));
  objc_msgSend(v12, "setSeparatorColor:", v11);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSNumbersViewController tableView](self, "tableView"));
  v15 = objc_opt_class(PHSOSNumberTableViewCell, v14);
  v17 = (objc_class *)objc_opt_class(PHSOSNumberTableViewCell, v16);
  v18 = NSStringFromClass(v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  objc_msgSend(v13, "registerClass:forCellReuseIdentifier:", v15, v19);

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSNumbersViewController view](self, "view"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSNumbersViewController tableView](self, "tableView"));
  objc_msgSend(v20, "addSubview:", v21);

  v22 = objc_alloc_init((Class)UILabel);
  -[PHSOSNumbersViewController setTitleLabel:](self, "setTitleLabel:", v22);

  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("EMERGENCY_SOS"), &stru_10028DC20, CFSTR("InCallService")));
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSNumbersViewController titleLabel](self, "titleLabel"));
  objc_msgSend(v25, "setText:", v24);

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSNumbersViewController titleLabel](self, "titleLabel"));
  objc_msgSend(v26, "setTextAlignment:", 1);

  v27 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSNumbersViewController titleLabel](self, "titleLabel"));
  objc_msgSend(v27, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v28 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _lightSystemFontOfSize:](UIFont, "_lightSystemFontOfSize:", 36.0));
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSNumbersViewController titleLabel](self, "titleLabel"));
  objc_msgSend(v29, "setFont:", v28);

  v30 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSNumbersViewController titleLabel](self, "titleLabel"));
  objc_msgSend(v31, "setTextColor:", v30);

  v32 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSNumbersViewController titleLabel](self, "titleLabel"));
  objc_msgSend(v32, "setNumberOfLines:", 0);

  v33 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSNumbersViewController view](self, "view"));
  objc_msgSend(v33, "addSubview:", self->_titleLabel);

  -[PHSOSNumbersViewController setUpConstraints](self, "setUpConstraints");
}

- (void)didReceiveMemoryWarning
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)PHSOSNumbersViewController;
  -[PHSOSNumbersViewController didReceiveMemoryWarning](&v2, "didReceiveMemoryWarning");
}

- (void)setUpConstraints
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
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  _QWORD v44[8];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSNumbersViewController titleLabel](self, "titleLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "leadingAnchor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSNumbersViewController view](self, "view"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "leadingAnchor"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "constraintEqualToAnchor:", v6));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSNumbersViewController titleLabel](self, "titleLabel"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "trailingAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSNumbersViewController view](self, "view"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "trailingAnchor"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToAnchor:", v10));

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSNumbersViewController titleLabel](self, "titleLabel"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "topAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSNumbersViewController view](self, "view"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "topAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "constraintEqualToAnchor:", v14));

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSNumbersViewController titleLabel](self, "titleLabel"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "centerXAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSNumbersViewController view](self, "view"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "centerXAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintEqualToAnchor:", v19));

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSNumbersViewController tableView](self, "tableView"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "leadingAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSNumbersViewController view](self, "view"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "leadingAnchor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToAnchor:", v24));

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSNumbersViewController tableView](self, "tableView"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "trailingAnchor"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSNumbersViewController view](self, "view"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "trailingAnchor"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraintEqualToAnchor:", v29));

  v31 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSNumbersViewController tableView](self, "tableView"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "topAnchor"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSNumbersViewController titleLabel](self, "titleLabel"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "lastBaselineAnchor"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "constraintEqualToAnchor:constant:", v34, 57.0));

  v36 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSNumbersViewController tableView](self, "tableView"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "bottomAnchor"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSNumbersViewController view](self, "view"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "bottomAnchor"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "constraintEqualToAnchor:", v39));

  v44[0] = v43;
  v44[1] = v42;
  v44[2] = v15;
  v44[3] = v20;
  v44[4] = v25;
  v44[5] = v30;
  v44[6] = v35;
  v44[7] = v40;
  v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v44, 8));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v41);

}

- (void)updateSOSHandles:(id)a3
{
  id v4;

  objc_storeStrong((id *)&self->_sosHandles, a3);
  v4 = (id)objc_claimAutoreleasedReturnValue(-[PHSOSNumbersViewController tableView](self, "tableView"));
  objc_msgSend(v4, "reloadData");

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v4;
  id v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSNumbersViewController sosHandles](self, "sosHandles", a3, a4));
  v5 = objc_msgSend(v4, "count");

  return (int64_t)v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  objc_class *v9;
  NSString *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  PHSOSNumberViewModel *v16;

  v6 = a4;
  v7 = a3;
  v9 = (objc_class *)objc_opt_class(PHSOSNumberTableViewCell, v8);
  v10 = NSStringFromClass(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dequeueReusableCellWithIdentifier:forIndexPath:", v11, v6));

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSNumbersViewController sosHandles](self, "sosHandles"));
  v14 = objc_msgSend(v6, "row");

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectAtIndexedSubscript:", v14));
  v16 = -[PHSOSNumberViewModel initWithSOSHandle:]([PHSOSNumberViewModel alloc], "initWithSOSHandle:", v15);
  objc_msgSend(v12, "populate:", v16);

  return v12;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[PHSOSNumbersViewController delegate](self, "delegate"));
  objc_msgSend(v6, "sosNumbersViewController:didSelectRowAtIndexPath:", self, v5);

}

- (PHSOSNumbersViewControllerDelegate)delegate
{
  return (PHSOSNumbersViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
  objc_storeStrong((id *)&self->_tableView, a3);
}

- (NSArray)sosHandles
{
  return self->_sosHandles;
}

- (void)setSosHandles:(id)a3
{
  objc_storeStrong((id *)&self->_sosHandles, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sosHandles, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
