@implementation DeleteAppFontsViewController

- (void)viewDidLoad
{
  objc_super v2;
  SEL v3;
  DeleteAppFontsViewController *v4;

  v4 = self;
  v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)DeleteAppFontsViewController;
  -[DeleteAppFontsViewController viewDidLoad](&v2, "viewDidLoad");
}

- (void)viewWillAppear:(BOOL)a3
{
  NSString *v3;
  NSString *v4;
  NSString *v5;
  NSString *v6;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  NSString *v10;
  NSString *v11;
  NSString *v12;
  NSString *v13;
  NSString *v14;
  id v15;
  UIColor *v16;
  CALayer *v17;
  UIView *v18;
  NSBundle *v19;
  NSString *v20;
  id v21;
  id WeakRetained;
  NSString *v23;
  id v24;
  NSBundle *v25;
  NSString *v26;
  id v27;
  id v28;
  NSString *v29;
  id v30;
  NSBundle *v31;
  NSString *v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  NSBundle *v38;
  NSString *v39;
  id v40;
  id v41;
  id v42;
  NSString *v43;
  NSString *v44;
  objc_super v45;
  BOOL v46;
  SEL v47;
  DeleteAppFontsViewController *v48;

  v48 = self;
  v47 = a2;
  v46 = a3;
  NSLog(CFSTR("DeleteAppFonts viewWillAppear"));
  v45.receiver = v48;
  v45.super_class = (Class)DeleteAppFontsViewController;
  -[DeleteAppFontsViewController viewWillAppear:](&v45, "viewWillAppear:", v46);
  v16 = +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, 0.600000024);
  v15 = -[DeleteAppFontsViewController view](v48, "view");
  objc_msgSend(v15, "setBackgroundColor:", v16);

  v18 = -[DeleteAppFontsViewController containerView](v48, "containerView");
  v17 = -[UIView layer](v18, "layer");
  -[CALayer setCornerRadius:](v17, "setCornerRadius:", 8.0);

  v19 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v44 = -[NSBundle localizedStringForKey:value:table:](v19, "localizedStringForKey:value:table:", CFSTR("DELETE_APP_MSG"));

  v20 = v44;
  WeakRetained = objc_loadWeakRetained((id *)&v48->_mainController);
  v21 = objc_msgSend(WeakRetained, "applicationName");
  v43 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v20, v21);

  v23 = v43;
  v24 = objc_loadWeakRetained((id *)&v48->_deleteDescriptionLabel);
  objc_msgSend(v24, "setText:", v23);

  v25 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v3 = -[NSBundle localizedStringForKey:value:table:](v25, "localizedStringForKey:value:table:", CFSTR("DELETE_APP_TITLE"), &stru_100014650, 0);
  v4 = v44;
  v44 = v3;

  v26 = v44;
  v28 = objc_loadWeakRetained((id *)&v48->_mainController);
  v27 = objc_msgSend(v28, "applicationName");
  v5 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v26, v27);
  v6 = v43;
  v43 = v5;

  v29 = v43;
  v30 = objc_loadWeakRetained((id *)&v48->_deleteLabel);
  objc_msgSend(v30, "setText:", v29);

  v31 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v7 = -[NSBundle localizedStringForKey:value:table:](v31, "localizedStringForKey:value:table:", CFSTR("DO_DELETE_TITLE"), &stru_100014650, 0);
  v8 = v44;
  v44 = v7;

  v32 = v44;
  v34 = objc_loadWeakRetained((id *)&v48->_mainController);
  v33 = objc_msgSend(v34, "applicationName");
  v9 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v32, v33);
  v10 = v43;
  v43 = v9;

  v35 = objc_loadWeakRetained((id *)&v48->_deleteButton);
  objc_msgSend(v35, "setTitle:forState:", v43);

  v37 = +[UIColor _systemDestructiveTintColor](UIColor, "_systemDestructiveTintColor");
  v36 = objc_loadWeakRetained((id *)&v48->_deleteButton);
  objc_msgSend(v36, "setTintColor:", v37);

  v38 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v11 = -[NSBundle localizedStringForKey:value:table:](v38, "localizedStringForKey:value:table:", CFSTR("DONT_DELETE_TITLE"), &stru_100014650, 0);
  v12 = v44;
  v44 = v11;

  v39 = v44;
  v41 = objc_loadWeakRetained((id *)&v48->_mainController);
  v40 = objc_msgSend(v41, "applicationName");
  v13 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v39, v40);
  v14 = v43;
  v43 = v13;

  v42 = objc_loadWeakRetained((id *)&v48->_dontDeleteButton);
  objc_msgSend(v42, "setTitle:forState:", v43, 0);

  objc_storeStrong((id *)&v43, 0);
  objc_storeStrong((id *)&v44, 0);
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v3;
  BOOL v4;
  SEL v5;
  DeleteAppFontsViewController *v6;

  v6 = self;
  v5 = a2;
  v4 = a3;
  v3.receiver = self;
  v3.super_class = (Class)DeleteAppFontsViewController;
  -[DeleteAppFontsViewController viewDidAppear:](&v3, "viewDidAppear:", a3);
}

- (void)doDelete:(id)a3
{
  id WeakRetained;
  id location[2];
  DeleteAppFontsViewController *v5;

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  WeakRetained = objc_loadWeakRetained((id *)&v5->_mainController);
  objc_msgSend(WeakRetained, "doneWithDeleteAppFonts:", 1);

  objc_storeStrong(location, 0);
}

- (void)dontDelete:(id)a3
{
  id WeakRetained;
  id location[2];
  DeleteAppFontsViewController *v5;

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  WeakRetained = objc_loadWeakRetained((id *)&v5->_mainController);
  objc_msgSend(WeakRetained, "doneWithDeleteAppFonts:", 0);

  objc_storeStrong(location, 0);
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v5;
  id WeakRetained;
  id v7;
  id location[2];
  DeleteAppFontsViewController *v9;

  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  WeakRetained = objc_loadWeakRetained((id *)&v9->_mainController);
  v5 = objc_msgSend(WeakRetained, "registeredFonts");
  v7 = objc_msgSend(v5, "count");

  objc_storeStrong(location, 0);
  return (int64_t)v7;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  id v8;
  id WeakRetained;
  id v10;
  id v11;
  id v12;
  id location[2];
  DeleteAppFontsViewController *v14;

  v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v12 = 0;
  objc_storeStrong(&v12, a4);
  v11 = objc_msgSend(location[0], "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("Cell"), v12);
  WeakRetained = objc_loadWeakRetained((id *)&v14->_mainController);
  v8 = objc_msgSend(WeakRetained, "registeredFonts");
  v7 = objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v12, "row"));
  v6 = objc_msgSend(v11, "textLabel");
  objc_msgSend(v6, "setText:", v7);

  v10 = v11;
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);
  return v10;
}

- (DeleteAppFontsMainController)mainController
{
  return (DeleteAppFontsMainController *)objc_loadWeakRetained((id *)&self->_mainController);
}

- (void)setMainController:(id)a3
{
  objc_storeWeak((id *)&self->_mainController, a3);
}

- (UIView)containerView
{
  return self->_containerView;
}

- (void)setContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_containerView, a3);
}

- (UILabel)deleteLabel
{
  return (UILabel *)objc_loadWeakRetained((id *)&self->_deleteLabel);
}

- (void)setDeleteLabel:(id)a3
{
  objc_storeWeak((id *)&self->_deleteLabel, a3);
}

- (UILabel)deleteDescriptionLabel
{
  return (UILabel *)objc_loadWeakRetained((id *)&self->_deleteDescriptionLabel);
}

- (void)setDeleteDescriptionLabel:(id)a3
{
  objc_storeWeak((id *)&self->_deleteDescriptionLabel, a3);
}

- (UITableView)fontsTableView
{
  return (UITableView *)objc_loadWeakRetained((id *)&self->_fontsTableView);
}

- (void)setFontsTableView:(id)a3
{
  objc_storeWeak((id *)&self->_fontsTableView, a3);
}

- (UIButton)deleteButton
{
  return (UIButton *)objc_loadWeakRetained((id *)&self->_deleteButton);
}

- (void)setDeleteButton:(id)a3
{
  objc_storeWeak((id *)&self->_deleteButton, a3);
}

- (UIButton)dontDeleteButton
{
  return (UIButton *)objc_loadWeakRetained((id *)&self->_dontDeleteButton);
}

- (void)setDontDeleteButton:(id)a3
{
  objc_storeWeak((id *)&self->_dontDeleteButton, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dontDeleteButton);
  objc_destroyWeak((id *)&self->_deleteButton);
  objc_destroyWeak((id *)&self->_fontsTableView);
  objc_destroyWeak((id *)&self->_deleteDescriptionLabel);
  objc_destroyWeak((id *)&self->_deleteLabel);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_destroyWeak((id *)&self->_mainController);
}

@end
