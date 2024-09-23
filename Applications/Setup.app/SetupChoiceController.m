@implementation SetupChoiceController

+ (id)cloudConfigSkipKey
{
  id location;
  os_log_type_t v4;
  os_log_t oslog;
  SEL aSelector;
  id v7;
  uint8_t buf[24];

  v7 = a1;
  aSelector = a2;
  oslog = (os_log_t)(id)_BYLoggingFacility(a1);
  v4 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    location = NSStringFromSelector(aSelector);
    sub_100038C28((uint64_t)buf, (uint64_t)location);
    _os_log_impl((void *)&_mh_execute_header, oslog, v4, "Subclasses must implement %@", buf, 0xCu);

    objc_storeStrong(&location, 0);
  }
  objc_storeStrong((id *)&oslog, 0);
  return 0;
}

+ (unint64_t)applicableDispositions
{
  objc_exception_throw(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("Sub-classes should override"), 0, 0, a2, a1));
}

- (SetupChoiceController)init
{
  NSAssertionHandler *v2;
  id v3;
  NSBundle *v4;
  NSString *v5;
  id v6;
  SetupChoiceController *v7;
  id v9;
  objc_super v10;
  SEL v11;
  id location;

  v11 = a2;
  location = 0;
  v10.receiver = self;
  v10.super_class = (Class)SetupChoiceController;
  location = -[SetupChoiceController init](&v10, "init");
  objc_storeStrong(&location, location);
  if (location)
  {
    if ((objc_msgSend(location, "isMemberOfClass:", objc_opt_class(SetupChoiceController)) & 1) != 0)
    {
      v2 = +[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler");
      -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](v2, "handleFailureInMethod:object:file:lineNumber:description:", v11, location, CFSTR("SetupChoiceController.m"), 128, CFSTR("Do not instantiate SetupChoiceController directly, subclass instead"), 0);

    }
    if ((objc_msgSend(location, "wantsNextButton") & 1) != 0)
    {
      v3 = objc_alloc((Class)UIBarButtonItem);
      v4 = +[NSBundle mainBundle](NSBundle, "mainBundle");
      v5 = -[NSBundle localizedStringForKey:value:table:](v4, "localizedStringForKey:value:table:", CFSTR("NEXT"), &stru_100284738, CFSTR("Localizable"));
      v9 = objc_msgSend(v3, "initWithTitle:style:target:action:", v5, 2, location, "checkChoiceValid");

      objc_msgSend(v9, "setEnabled:", 0);
      v6 = objc_msgSend(location, "navigationItem");
      objc_msgSend(v6, "setRightBarButtonItem:", v9);

      objc_storeStrong(&v9, 0);
    }
  }
  v7 = (SetupChoiceController *)location;
  objc_storeStrong(&location, 0);
  return v7;
}

- (id)_footerIcon
{
  UIImage *v2;
  id v3;
  id v4;
  id v6;
  id location[2];
  SetupChoiceController *v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = -[SetupChoiceController footerIcon](self, "footerIcon");
  if (!location[0])
  {
    v6 = -[SetupChoiceController footerIconName](v8, "footerIconName");
    if (v6)
    {
      v2 = +[UIImage imageNamed:](UIImage, "imageNamed:", v6);
      v3 = location[0];
      location[0] = v2;

    }
    objc_storeStrong(&v6, 0);
  }
  v4 = location[0];
  objc_storeStrong(location, 0);
  return v4;
}

- (void)loadView
{
  BuddyAppleIDTableHeaderView *v2;
  BuddyAppleIDTableHeaderView *serviceFooterView;
  id v4;
  id v5;
  id v6;
  UILabel *v7;
  id v8;
  id v9;
  id v10;
  UILabel *v11;
  BuddyAppleIDLinkView *v12;
  BuddyAppleIDLinkView *learnMoreView;
  UIButton *v14;
  UIButton *v15;
  NSString *v16;
  NSUInteger v17;
  BFFPaneHeaderView *v18;
  id v19;
  BFFPaneHeaderView *v20;
  id v21;
  BFFPaneHeaderView *v22;
  NSArray *v23;
  NSUInteger v24;
  id v25;
  NSArray *v26;
  id v27;
  id v28;
  UITableView *v29;
  UIButton *v30;
  UIButton *primaryChoiceButton;
  NSArray *v32;
  NSUInteger v33;
  UIButton *v34;
  UIButton *secondaryChoiceButton;
  UIFont *v36;
  UILabel *v37;
  UILabel *v38;
  UIButton *v39;
  NSArray *v40;
  id v41;
  id v42;
  UITableView *v43;
  void **v44;
  uint64_t v45;
  void (*v46)(uint64_t);
  void *v47;
  id v48;
  id location;
  id v50;
  id v51;
  id v52;
  id v53;
  objc_super v54;
  SEL v55;
  SetupChoiceController *v56;

  v56 = self;
  v55 = a2;
  v54.receiver = self;
  v54.super_class = (Class)SetupChoiceController;
  -[BuddyTableViewController loadView](&v54, "loadView");
  objc_storeStrong((id *)&v56->_serviceFooterView, 0);
  objc_storeStrong((id *)&v56->_learnMoreView, 0);
  v53 = -[SetupChoiceController footerTitleText](v56, "footerTitleText");
  v52 = -[SetupChoiceController footerDetailText](v56, "footerDetailText");
  v51 = -[SetupChoiceController learnMoreButtonText](v56, "learnMoreButtonText");
  v50 = -[SetupChoiceController _footerIcon](v56, "_footerIcon");
  if (objc_msgSend(v53, "length") || objc_msgSend(v52, "length") || objc_msgSend(v51, "length") || v50)
  {
    if (-[SetupChoiceController _useTableLayout](v56, "_useTableLayout"))
    {
      if (objc_msgSend(v53, "length") || objc_msgSend(v52, "length"))
      {
        v2 = -[BuddyAppleIDTableHeaderView initWithFrame:]([BuddyAppleIDTableHeaderView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
        serviceFooterView = v56->_serviceFooterView;
        v56->_serviceFooterView = v2;

        if (objc_msgSend(v53, "length"))
        {
          v4 = objc_alloc((Class)NSAttributedString);
          v5 = +[BuddyAppleIDTableHeaderView defaultTitleTextAttributes](BuddyAppleIDTableHeaderView, "defaultTitleTextAttributes");
          v6 = objc_msgSend(v4, "initWithString:attributes:", v53, v5);
          v7 = -[BuddyAppleIDTableHeaderView textLabel](v56->_serviceFooterView, "textLabel");
          -[UILabel setAttributedText:](v7, "setAttributedText:", v6);

        }
        if (objc_msgSend(v52, "length"))
        {
          v8 = objc_alloc((Class)NSAttributedString);
          v9 = +[BuddyAppleIDTableHeaderView defaultDetailTextAttributes](BuddyAppleIDTableHeaderView, "defaultDetailTextAttributes");
          v10 = objc_msgSend(v8, "initWithString:attributes:", v52, v9);
          v11 = -[BuddyAppleIDTableHeaderView detailTextLabel](v56->_serviceFooterView, "detailTextLabel");
          -[UILabel setAttributedText:](v11, "setAttributedText:", v10);

        }
      }
      if (objc_msgSend(v51, "length"))
      {
        v12 = -[BuddyAppleIDLinkView initWithFrame:]([BuddyAppleIDLinkView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
        learnMoreView = v56->_learnMoreView;
        v56->_learnMoreView = v12;

        -[BuddyAppleIDLinkView setButtonTopPadding:](v56->_learnMoreView, "setButtonTopPadding:", 15.0);
        v14 = -[BuddyAppleIDLinkView linkButton](v56->_learnMoreView, "linkButton");
        -[UIButton setTitle:forState:](v14, "setTitle:forState:", v51, 0);

        v15 = -[BuddyAppleIDLinkView linkButton](v56->_learnMoreView, "linkButton");
        -[UIButton addTarget:action:forControlEvents:](v15, "addTarget:action:forControlEvents:", v56, "learnMoreButtonTapped:", 64);

      }
      -[BuddyAppleIDTableHeaderView setLinkButtonTopPadding:](v56->_serviceFooterView, "setLinkButtonTopPadding:", 10.0);
      v16 = -[BuddyAppleIDTableHeaderView topIconName](v56->_serviceFooterView, "topIconName");
      v17 = -[NSString length](v16, "length");

      if (v17)
        -[BuddyAppleIDTableHeaderView setBottomPadding:](v56->_serviceFooterView, "setBottomPadding:", 2.0);
      else
        -[BuddyAppleIDTableHeaderView setBottomPadding:](v56->_serviceFooterView, "setBottomPadding:", 20.0);
    }
    else
    {
      objc_initWeak(&location, v56);
      if (objc_msgSend(v52, "length"))
      {
        v18 = -[BuddyTableViewController headerView](v56, "headerView");
        v19 = -[BFFPaneHeaderView detailTextLabel](v18, "detailTextLabel");
        objc_msgSend(v19, "setText:", v52);

      }
      if (objc_msgSend(v51, "length"))
      {
        v20 = -[BuddyTableViewController headerView](v56, "headerView");
        v21 = v51;
        v44 = _NSConcreteStackBlock;
        v45 = 3221225472;
        v46 = sub_1000B2544;
        v47 = &unk_1002806B8;
        objc_copyWeak(&v48, &location);
        -[BFFPaneHeaderView setLinkText:handler:](v20, "setLinkText:handler:", v21, &v44);

        objc_destroyWeak(&v48);
      }
      objc_destroyWeak(&location);
    }
    if (v50)
    {
      v22 = -[BuddyTableViewController headerView](v56, "headerView");
      -[BFFPaneHeaderView setIcon:](v22, "setIcon:", v50);

    }
  }
  if (!-[SetupChoiceController _useTableLayout](v56, "_useTableLayout", v44, v45, v46, v47))
  {
    v23 = -[SetupChoiceController choices](v56, "choices");
    v24 = -[NSArray count](v23, "count");

    if (v24)
    {
      v25 = +[BFFStyle sharedStyle](BFFStyle, "sharedStyle");
      v26 = -[SetupChoiceController choices](v56, "choices");
      v27 = -[NSArray firstObject](v26, "firstObject");
      v28 = objc_msgSend(v27, "localizedTitle");
      v29 = -[BuddyTableViewController tableView](v56, "tableView");
      v30 = (UIButton *)objc_msgSend(v25, "continueButtonWithTitle:inView:", v28, v29);
      primaryChoiceButton = v56->_primaryChoiceButton;
      v56->_primaryChoiceButton = v30;

      -[UIButton addTarget:action:forControlEvents:](v56->_primaryChoiceButton, "addTarget:action:forControlEvents:", v56, "_primaryButtonPressed", 0x2000);
    }
    v32 = -[SetupChoiceController choices](v56, "choices");
    v33 = -[NSArray count](v32, "count");

    if (v33 > 1)
    {
      v34 = +[UIButton buttonWithType:](UIButton, "buttonWithType:", 1);
      secondaryChoiceButton = v56->_secondaryChoiceButton;
      v56->_secondaryChoiceButton = v34;

      v36 = +[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleBody);
      v37 = -[UIButton titleLabel](v56->_secondaryChoiceButton, "titleLabel");
      -[UILabel setFont:](v37, "setFont:", v36);

      v38 = -[UIButton titleLabel](v56->_secondaryChoiceButton, "titleLabel");
      -[UILabel setAdjustsFontSizeToFitWidth:](v38, "setAdjustsFontSizeToFitWidth:", 1);

      v39 = v56->_secondaryChoiceButton;
      v40 = -[SetupChoiceController choices](v56, "choices");
      v41 = -[NSArray lastObject](v40, "lastObject");
      v42 = objc_msgSend(v41, "localizedTitle");
      -[UIButton setTitle:forState:](v39, "setTitle:forState:", v42, 0);

      -[UIButton addTarget:action:forControlEvents:](v56->_secondaryChoiceButton, "addTarget:action:forControlEvents:", v56, "_secondaryButtonPressed", 0x2000);
      v43 = -[BuddyTableViewController tableView](v56, "tableView");
      -[UITableView addSubview:](v43, "addSubview:", v56->_secondaryChoiceButton);

    }
  }
  objc_storeStrong(&v50, 0);
  objc_storeStrong(&v51, 0);
  objc_storeStrong(&v52, 0);
  objc_storeStrong(&v53, 0);
}

- (void)_primaryButtonPressed
{
  NSArray *v2;
  NSUInteger v3;
  NSArray *v4;
  id v5;

  v2 = -[SetupChoiceController choices](self, "choices", a2);
  v3 = -[NSArray count](v2, "count");

  if (v3)
  {
    v4 = -[SetupChoiceController choices](self, "choices");
    v5 = -[NSArray objectAtIndexedSubscript:](v4, "objectAtIndexedSubscript:", 0);
    objc_storeWeak((id *)&self->_selectedChoice, v5);

    -[SetupChoiceController checkChoiceValid](self, "checkChoiceValid");
  }
}

- (void)_secondaryButtonPressed
{
  NSArray *v2;
  NSUInteger v3;
  NSArray *v4;
  id v5;

  v2 = -[SetupChoiceController choices](self, "choices", a2);
  v3 = -[NSArray count](v2, "count");

  if (v3 > 1)
  {
    v4 = -[SetupChoiceController choices](self, "choices");
    v5 = -[NSArray objectAtIndexedSubscript:](v4, "objectAtIndexedSubscript:", 1);
    objc_storeWeak((id *)&self->_selectedChoice, v5);

    -[SetupChoiceController checkChoiceValid](self, "checkChoiceValid");
  }
}

- (void)setChoices:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  unint64_t i;
  NSArray *v7;
  id v8;
  uint64_t v9;
  unint64_t j;
  _QWORD v11[8];
  id v12;
  _QWORD __b[8];
  id v14;
  id location[2];
  SetupChoiceController *v16;
  _BYTE v17[128];
  _BYTE v18[128];

  v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (v16->_choices != location[0])
  {
    memset(__b, 0, sizeof(__b));
    v3 = location[0];
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", __b, v18, 16);
    if (v4)
    {
      v5 = *(_QWORD *)__b[2];
      do
      {
        for (i = 0; i < (unint64_t)v4; ++i)
        {
          if (*(_QWORD *)__b[2] != v5)
            objc_enumerationMutation(v3);
          v14 = *(id *)(__b[1] + 8 * i);
          objc_msgSend(v14, "setChoiceController:", 0);
        }
        v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", __b, v18, 16);
      }
      while (v4);
    }

    objc_storeStrong((id *)&v16->_choices, location[0]);
    memset(v11, 0, sizeof(v11));
    v7 = v16->_choices;
    v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", v11, v17, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v11[2];
      do
      {
        for (j = 0; j < (unint64_t)v8; ++j)
        {
          if (*(_QWORD *)v11[2] != v9)
            objc_enumerationMutation(v7);
          v12 = *(id *)(v11[1] + 8 * j);
          objc_msgSend(v12, "setChoiceController:", v16);
        }
        v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", v11, v17, 16);
      }
      while (v8);
    }

  }
  objc_storeStrong(location, 0);
}

- (void)setButtonsEnabled:(BOOL)a3
{
  -[UIButton setEnabled:](self->_primaryChoiceButton, "setEnabled:", a3);
  -[UIButton setEnabled:](self->_secondaryChoiceButton, "setEnabled:", a3);
}

- (BOOL)_useTableLayout
{
  NSArray *v2;
  unsigned int v3;
  BOOL v4;

  v2 = -[SetupChoiceController choices](self, "choices", a2);
  if (-[NSArray count](v2, "count") < 3)
    v3 = -[SetupChoiceController useTableLayout](self, "useTableLayout");
  else
    v3 = 1;
  v4 = v3 != 0;

  return v4;
}

- (BOOL)useTableLayout
{
  return 1;
}

- (id)footerTitleText
{
  return 0;
}

- (id)footerDetailText
{
  return 0;
}

- (id)footerIcon
{
  return 0;
}

- (id)footerIconName
{
  return 0;
}

- (id)learnMoreButtonText
{
  return 0;
}

- (void)learnMoreButtonTapped:(id)a3
{
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
}

- (BOOL)wantsNextButton
{
  return 1;
}

- (void)finishWithChoiceForIdentifier:(id)a3
{
  unint64_t v3;
  NSArray *v4;
  NSUInteger v5;
  uint64_t v6;
  NSArray *v7;
  id v8;
  unsigned __int8 v9;
  os_log_t oslog;
  int v11;
  id v12;
  int i;
  id location[2];
  SetupChoiceController *v15;
  uint8_t buf[24];

  v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  for (i = 0; ; ++i)
  {
    v3 = i;
    v4 = -[SetupChoiceController choices](v15, "choices");
    v5 = -[NSArray count](v4, "count");

    if (v3 >= v5)
      break;
    v7 = -[SetupChoiceController choices](v15, "choices");
    v12 = -[NSArray objectAtIndex:](v7, "objectAtIndex:", i);

    v8 = objc_msgSend(v12, "identifier");
    v9 = objc_msgSend(v8, "isEqual:", location[0]);

    if ((v9 & 1) != 0)
    {
      -[SetupChoiceController setSelectedChoiceIndex:](v15, "setSelectedChoiceIndex:", i);
      -[SetupChoiceController controllerDone](v15, "controllerDone");
      v11 = 1;
    }
    else
    {
      v11 = 0;
    }
    objc_storeStrong(&v12, 0);
    if (v11)
      goto LABEL_11;
  }
  oslog = (os_log_t)(id)_BYLoggingFacility(v6);
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    sub_10003EB04((uint64_t)buf, (uint64_t)v15, (uint64_t)location[0]);
    _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "%@ cannot finish with controller identifier choice %@", buf, 0x16u);
  }
  objc_storeStrong((id *)&oslog, 0);
  v11 = 0;
LABEL_11:
  objc_storeStrong(location, 0);
}

- (void)_updateSelectedChoiceCheckmark
{
  id WeakRetained;
  NSArray *choices;
  id v4;
  id v5;
  UITableView *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id location;
  id v13;
  id v14;
  SEL v15;
  SetupChoiceController *v16;

  v16 = self;
  v15 = a2;
  WeakRetained = objc_loadWeakRetained((id *)&self->_selectedChoice);

  if (WeakRetained)
  {
    v14 = 0;
    choices = v16->_choices;
    v4 = objc_loadWeakRetained((id *)&v16->_selectedChoice);
    v5 = -[NSArray indexOfObject:](choices, "indexOfObject:", v4);

    v14 = v5;
    if (v5 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      v13 = +[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", v14, 0);
      v6 = -[BuddyTableViewController tableView](v16, "tableView");
      location = -[UITableView cellForRowAtIndexPath:](v6, "cellForRowAtIndexPath:", v13);

      objc_msgSend(location, "setAccessoryType:", 3);
      v7 = objc_msgSend(location, "textLabel");
      v8 = +[UIColor tableCellBlueTextColor](UIColor, "tableCellBlueTextColor");
      objc_msgSend(v7, "setTextColor:", v8);

      objc_msgSend(location, "setNeedsLayout");
      objc_storeStrong(&location, 0);
      objc_storeStrong(&v13, 0);
    }
  }
  if (-[SetupChoiceController wantsNextButton](v16, "wantsNextButton"))
  {
    v9 = -[SetupChoiceController navigationItem](v16, "navigationItem");
    v10 = objc_msgSend(v9, "rightBarButtonItem");
    v11 = objc_loadWeakRetained((id *)&v16->_selectedChoice);
    objc_msgSend(v10, "setEnabled:", v11 != 0);

  }
}

- (void)viewDidLoad
{
  objc_super v2;
  SEL v3;
  SetupChoiceController *v4;

  v4 = self;
  v3 = a2;
  -[SetupChoiceController _updateSelectedChoiceCheckmark](self, "_updateSelectedChoiceCheckmark");
  v2.receiver = v4;
  v2.super_class = (Class)SetupChoiceController;
  -[SetupChoiceController viewDidLoad](&v2, "viewDidLoad");
}

- (void)viewDidAppear:(BOOL)a3
{
  UITableView *v3;
  UITableView *v4;
  NSIndexPath *v5;
  objc_super v6;
  BOOL v7;
  SEL v8;
  SetupChoiceController *v9;

  v9 = self;
  v8 = a2;
  v7 = a3;
  v6.receiver = self;
  v6.super_class = (Class)SetupChoiceController;
  -[SetupChoiceController viewDidAppear:](&v6, "viewDidAppear:", a3);
  if (!-[SetupChoiceController wantsNextButton](v9, "wantsNextButton"))
  {
    v3 = -[BuddyTableViewController tableView](v9, "tableView");
    v5 = -[UITableView indexPathForSelectedRow](v3, "indexPathForSelectedRow");

    if (v5)
    {
      v4 = -[BuddyTableViewController tableView](v9, "tableView");
      -[UITableView deselectRowAtIndexPath:animated:](v4, "deselectRowAtIndexPath:animated:", v5, 1);

    }
    objc_storeStrong((id *)&v5, 0);
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v3;
  BOOL v4;
  SEL v5;
  SetupChoiceController *v6;

  v6 = self;
  v5 = a2;
  v4 = a3;
  if ((-[SetupChoiceController isMovingFromParentViewController](self, "isMovingFromParentViewController") & 1) != 0)-[SetupChoiceController controllerBack](v6, "controllerBack");
  v3.receiver = v6;
  v3.super_class = (Class)SetupChoiceController;
  -[SetupChoiceController viewDidDisappear:](&v3, "viewDidDisappear:", v4);
}

- (void)viewDidLayoutSubviews
{
  id v2;
  BOOL v3;
  double v4;
  double v5;
  UITableView *v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  BFFPaneHeaderView *v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  id v16;
  UITableView *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  id v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  id v33;
  id v34;
  CGFloat v35;
  CGFloat v36;
  id v37;
  id v38;
  double v39;
  CGFloat v40;
  double v41;
  double v42;
  UILabel *v43;
  double v44;
  double v45;
  CGFloat v46;
  CGFloat v47;
  double width;
  id v49;
  id v50;
  double v51;
  double v52;
  UILabel *v53;
  double v54;
  CGFloat v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double MaxY;
  BFFPaneHeaderView *v61;
  id v62;
  BFFPaneHeaderView *v63;
  id v64;
  BFFPaneHeaderView *v65;
  id v66;
  id v67;
  BFFPaneHeaderView *v68;
  id v69;
  id v70;
  double v71;
  id v72;
  BFFPaneHeaderView *v73;
  UITableView *v74;
  UITableView *v75;
  UITableView *v76;
  uint64_t v77;
  uint64_t v78;
  double v79;
  double v80;
  double v81;
  uint64_t v82;
  uint64_t v83;
  double v84;
  double v85;
  double v86;
  char v87;
  UILabel *v88;
  char v89;
  id v90;
  char v91;
  id v92;
  CGRect v93;
  char v94;
  id v95;
  char v96;
  id v97;
  CGSize v98;
  CGRect rect;
  double v100;
  char v101;
  UITableView *v102;
  double v103;
  char v104;
  id v105;
  char v106;
  id v107;
  double v108;
  _QWORD __b[4];
  CGRect v110;
  CGRect v111;
  objc_super v112;
  double v113;
  double v114;
  BOOL v115;
  SEL v116;
  SetupChoiceController *v117;

  v117 = self;
  v116 = a2;
  v2 = -[SetupChoiceController traitCollection](self, "traitCollection");
  v3 = objc_msgSend(v2, "horizontalSizeClass") == (id)1;

  v115 = v3;
  -[SetupChoiceController choiceButtonsBottomInset](v117, "choiceButtonsBottomInset");
  v114 = v4 + 24.0;
  v113 = 0.0;
  v5 = 120.0;
  if (v3)
    v5 = 40.0;
  v113 = v114 + v5;
  v112.receiver = v117;
  v112.super_class = (Class)SetupChoiceController;
  -[BuddyTableViewController viewDidLayoutSubviews](&v112, "viewDidLayoutSubviews");
  v6 = -[BuddyTableViewController tableView](v117, "tableView");
  -[UITableView bounds](v6, "bounds");
  v111.origin.y = v7;
  v111.origin.x = v8;
  v111.size.height = v9;
  v111.size.width = v10;

  v11 = -[BuddyTableViewController headerView](v117, "headerView");
  -[BFFPaneHeaderView frame](v11, "frame");
  v110.origin.y = v12;
  v110.origin.x = v13;
  v110.size.height = v14;
  v110.size.width = v15;

  memset(__b, 0, sizeof(__b));
  v16 = +[BFFStyle sharedStyle](BFFStyle, "sharedStyle");
  v17 = -[BuddyTableViewController tableView](v117, "tableView");
  objc_msgSend(v16, "edgeInsetsForTable:", v17);
  __b[0] = v18;
  __b[1] = v19;
  __b[2] = v20;
  __b[3] = v21;

  v22 = +[BFFStyle sharedStyle](BFFStyle, "sharedStyle");
  v23 = -[SetupChoiceController view](v117, "view");
  objc_msgSend(v22, "horizontalMarginForView:", v23);
  v106 = 0;
  v104 = 0;
  if (v24 * 2.0 - *(double *)&__b[1] - *(double *)&__b[3] >= 0.0)
  {
    v107 = +[BFFStyle sharedStyle](BFFStyle, "sharedStyle");
    v106 = 1;
    v105 = -[SetupChoiceController view](v117, "view");
    v104 = 1;
    objc_msgSend(v107, "horizontalMarginForView:");
    v25 = v26 * 2.0 - *(double *)&__b[1] - *(double *)&__b[3];
  }
  else
  {
    v25 = 0.0;
  }
  if ((v104 & 1) != 0)

  if ((v106 & 1) != 0)
  v108 = v25;
  v101 = 0;
  if (v115)
  {
    v28 = v25 / 2.0;
  }
  else
  {
    v102 = -[BuddyTableViewController tableView](v117, "tableView");
    v101 = 1;
    -[UITableView separatorInset](v102, "separatorInset");
    v28 = v27;
  }
  if ((v101 & 1) != 0)

  v103 = v28;
  v100 = v111.size.width - v108;
  -[UIButton frame](v117->_primaryChoiceButton, "frame");
  rect.origin.y = v29;
  rect.origin.x = v30;
  rect.size.height = v31;
  rect.size.width = v32;
  if (v117->_primaryChoiceButton)
  {
    v33 = +[BFFStyle sharedStyle](BFFStyle, "sharedStyle");
    v34 = -[SetupChoiceController view](v117, "view");
    objc_msgSend(v33, "sizeForContinueButtonInAncestor:", v34);
    v98.width = v35;
    v98.height = v36;
    rect.size = v98;

    rect.origin.x = UIRoundToViewScale(0, v28 + (v100 - v98.width) / 2.0);
    v37 = -[SetupChoiceController view](v117, "view");
    v38 = objc_msgSend(v37, "safeAreaLayoutGuide");
    objc_msgSend(v38, "layoutFrame");
    v40 = v39 - v98.height - v113;
    v96 = 0;
    v94 = 0;
    if (v40 <= CGRectGetMaxY(v110) + 14.0)
    {
      v42 = CGRectGetMaxY(v110) + 14.0;
    }
    else
    {
      v97 = -[SetupChoiceController view](v117, "view");
      v96 = 1;
      v95 = objc_msgSend(v97, "safeAreaLayoutGuide");
      v94 = 1;
      objc_msgSend(v95, "layoutFrame");
      v42 = v41 - v98.height - v113;
    }
    rect.origin.y = v42;
    if ((v94 & 1) != 0)

    if ((v96 & 1) != 0)
    -[UIButton setFrame:](v117->_primaryChoiceButton, "setFrame:", rect.origin.x, rect.origin.y, v98);
  }
  if (v117->_secondaryChoiceButton)
  {
    v43 = -[UIButton titleLabel](v117->_secondaryChoiceButton, "titleLabel");
    sub_1000B3B90();
    -[UILabel sizeThatFits:](v43, "sizeThatFits:", v44, v45);
    v93.size.width = v46;
    v93.size.height = v47;

    if (v93.size.width >= v100)
      width = v100;
    else
      width = v93.size.width;
    v93.size.width = width;
    v93.origin.x = UIRoundToViewScale(0, v103 + (v100 - width) / 2.0);
    v49 = -[SetupChoiceController view](v117, "view");
    v50 = objc_msgSend(v49, "safeAreaLayoutGuide");
    objc_msgSend(v50, "layoutFrame");
    v52 = v51;
    v53 = -[UIButton titleLabel](v117->_secondaryChoiceButton, "titleLabel");
    -[UILabel _firstLineBaselineOffsetFromBoundsTop](v53, "_firstLineBaselineOffsetFromBoundsTop");
    v55 = v52 - v54 - v114;
    v91 = 0;
    v89 = 0;
    v87 = 0;
    if (v55 <= CGRectGetMaxY(rect) + 4.0)
    {
      v59 = CGRectGetMaxY(rect) + 4.0;
    }
    else
    {
      v92 = -[SetupChoiceController view](v117, "view");
      v91 = 1;
      v90 = objc_msgSend(v92, "safeAreaLayoutGuide");
      v89 = 1;
      objc_msgSend(v90, "layoutFrame");
      v57 = v56;
      v88 = -[UIButton titleLabel](v117->_secondaryChoiceButton, "titleLabel");
      v87 = 1;
      -[UILabel _firstLineBaselineOffsetFromBoundsTop](v88, "_firstLineBaselineOffsetFromBoundsTop");
      v59 = v57 - v58 - v114;
    }
    v93.origin.y = v59;
    if ((v87 & 1) != 0)

    if ((v89 & 1) != 0)
    if ((v91 & 1) != 0)

    -[UIButton setFrame:](v117->_secondaryChoiceButton, "setFrame:", v93.origin.x, v93.origin.y, v93.size.width, v93.size.height);
    MaxY = CGRectGetMaxY(v93);
    if (MaxY > CGRectGetMaxY(v111))
    {
      v61 = -[BuddyTableViewController headerView](v117, "headerView");
      v62 = -[BFFPaneHeaderView icon](v61, "icon");

      if (v62)
      {
        v63 = -[BuddyTableViewController headerView](v117, "headerView");
        v64 = -[BFFPaneHeaderView detailTextLabel](v63, "detailTextLabel");
        v65 = -[BuddyTableViewController headerView](v117, "headerView");
        v66 = -[BFFPaneHeaderView detailTextLabel](v65, "detailTextLabel");
        v67 = objc_msgSend(v66, "font");
        v68 = -[BuddyTableViewController headerView](v117, "headerView");
        v69 = -[BFFPaneHeaderView detailTextLabel](v68, "detailTextLabel");
        v70 = objc_msgSend(v69, "font");
        objc_msgSend(v70, "pointSize");
        v72 = objc_msgSend(v67, "fontWithSize:", v71 - 1.0);
        objc_msgSend(v64, "setFont:", v72);

        v73 = -[BuddyTableViewController headerView](v117, "headerView");
        -[BFFPaneHeaderView setIcon:](v73, "setIcon:", 0);

        v74 = -[BuddyTableViewController tableView](v117, "tableView");
        -[UITableView reloadData](v74, "reloadData");

        v75 = (UITableView *)-[SetupChoiceController view](v117, "view");
        -[UITableView setNeedsLayout](v75, "setNeedsLayout");
      }
      else
      {
        v76 = -[BuddyTableViewController tableView](v117, "tableView", 0, 0, 0, 0);
        -[UITableView frame](v76, "frame");
        v83 = v77;
        v82 = v78;
        v85 = v79;
        v84 = v80;

        v81 = CGRectGetMaxY(v93);
        v86 = v85 + v81 - CGRectGetMaxY(v111);
        v75 = -[BuddyTableViewController tableView](v117, "tableView", v82, v83);
        -[UITableView setContentSize:](v75, "setContentSize:", v84, v86);
      }

    }
  }
}

- (void)setSelectedChoiceIndex:(unint64_t)a3
{
  id v4;

  v4 = -[NSArray objectAtIndexedSubscript:](self->_choices, "objectAtIndexedSubscript:", a3);
  -[SetupChoiceController setSelectedChoice:](self, "setSelectedChoice:", v4);

}

- (void)setSelectedChoice:(id)a3
{
  id WeakRetained;
  id v4;
  id v5;
  UITableView *v6;
  NSArray *choices;
  id v8;
  NSIndexPath *v9;
  id v10;
  id v11;
  id v12;
  char v13;
  id location[2];
  SetupChoiceController *v15;

  v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  WeakRetained = objc_loadWeakRetained((id *)&v15->_selectedChoice);
  v4 = location[0];

  if (WeakRetained != v4)
  {
    v13 = -[SetupChoiceController wantsNextButton](v15, "wantsNextButton");
    v5 = objc_loadWeakRetained((id *)&v15->_selectedChoice);

    if (v5 && (v13 & 1) != 0)
    {
      v6 = -[BuddyTableViewController tableView](v15, "tableView");
      choices = v15->_choices;
      v8 = objc_loadWeakRetained((id *)&v15->_selectedChoice);
      v9 = +[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", -[NSArray indexOfObject:](choices, "indexOfObject:", v8), 0);
      v12 = -[UITableView cellForRowAtIndexPath:](v6, "cellForRowAtIndexPath:", v9);

      objc_msgSend(v12, "setAccessoryType:", 0);
      v10 = objc_msgSend(v12, "textLabel");
      v11 = +[UIColor _labelColor](UIColor, "_labelColor");
      objc_msgSend(v10, "setTextColor:", v11);

      objc_storeStrong(&v12, 0);
    }
    objc_storeWeak((id *)&v15->_selectedChoice, location[0]);
    if ((v13 & 1) != 0)
      -[SetupChoiceController _updateSelectedChoiceCheckmark](v15, "_updateSelectedChoiceCheckmark");
  }
  objc_storeStrong(location, 0);
}

- (void)checkChoiceValid
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_selectedChoice);

  if (WeakRetained)
  {
    v3 = objc_loadWeakRetained((id *)&self->_selectedChoice);
    objc_msgSend(v3, "runConfirmationIfNeeded", a2);

  }
  else
  {
    -[SetupChoiceController controllerDone](self, "controllerDone", a2);
  }
}

- (void)choiceConfirmed:(id)a3
{
  id location[2];
  SetupChoiceController *v4;

  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  -[SetupChoiceController controllerDone](v4, "controllerDone");
  objc_storeStrong(location, 0);
}

- (void)choiceCancelled:(id)a3
{
  UITableView *v3;
  NSArray *choices;
  id WeakRetained;
  NSIndexPath *v6;
  id location[2];
  SetupChoiceController *v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[BuddyTableViewController tableView](v8, "tableView");
  choices = v8->_choices;
  WeakRetained = objc_loadWeakRetained((id *)&v8->_selectedChoice);
  v6 = +[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", -[NSArray indexOfObject:](choices, "indexOfObject:", WeakRetained), 0);
  -[UITableView deselectRowAtIndexPath:animated:](v3, "deselectRowAtIndexPath:animated:", v6, 1);

  -[SetupChoiceController setSelectedChoice:](v8, "setSelectedChoice:", 0);
  objc_storeStrong(location, 0);
}

- (void)controllerDone
{
  BFFFlowItemDelegate *v2;
  id WeakRetained;

  v2 = -[SetupChoiceController delegate](self, "delegate", a2);
  WeakRetained = objc_loadWeakRetained((id *)&self->_selectedChoice);
  -[BFFFlowItemDelegate flowItemDone:nextItemClass:](v2, "flowItemDone:nextItemClass:", self, objc_msgSend(WeakRetained, "nextControllerClass"));

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
  id location[2];
  SetupChoiceController *v6;
  NSUInteger v7;

  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (-[SetupChoiceController _useTableLayout](v6, "_useTableLayout"))
    v7 = -[NSArray count](v6->_choices, "count");
  else
    v7 = 0;
  objc_storeStrong(location, 0);
  return v7;
}

- (void)configureCell:(id)a3 atIndexPath:(id)a4
{
  id v5;
  id v6;
  id v7;
  BOOL v8;
  id v9;
  NSArray *choices;
  id v11;
  id v12;
  char v13;
  id WeakRetained;
  id v15;
  id location[2];
  SetupChoiceController *v17;

  v17 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v15 = 0;
  objc_storeStrong(&v15, a4);
  v5 = objc_msgSend(location[0], "textLabel");
  v6 = -[NSArray objectAtIndexedSubscript:](v17->_choices, "objectAtIndexedSubscript:", objc_msgSend(v15, "row"));
  v7 = objc_msgSend(v6, "localizedTitle");
  objc_msgSend(v5, "setText:", v7);

  v13 = 0;
  v8 = 0;
  if (-[SetupChoiceController wantsNextButton](v17, "wantsNextButton"))
  {
    v9 = objc_msgSend(v15, "row");
    choices = v17->_choices;
    WeakRetained = objc_loadWeakRetained((id *)&v17->_selectedChoice);
    v13 = 1;
    v8 = v9 == (id)-[NSArray indexOfObject:](choices, "indexOfObject:");
  }
  if ((v13 & 1) != 0)

  if (v8)
  {
    objc_msgSend(location[0], "setAccessoryType:", 3);
    v11 = objc_msgSend(location[0], "textLabel");
    v12 = +[UIColor tableCellBlueTextColor](UIColor, "tableCellBlueTextColor");
    objc_msgSend(v11, "setTextColor:", v12);

  }
  objc_storeStrong(&v15, 0);
  objc_storeStrong(location, 0);
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v7;
  id v8;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v8 = 0;
  objc_storeStrong(&v8, a4);
  v7 = 0;
  objc_storeStrong(&v7, a5);
  objc_msgSend(v8, "setSeparatorStyle:", 1);
  objc_msgSend(v8, "_setShouldHaveFullLengthTopSeparator:", 0);
  objc_msgSend(v8, "_setShouldHaveFullLengthBottomSeparator:", 0);
  objc_storeStrong(&v7, 0);
  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5;
  id v7;
  id v8;
  id location[2];
  SetupChoiceController *v10;

  v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v8 = 0;
  objc_storeStrong(&v8, a4);
  v7 = objc_msgSend(location[0], "dequeueReusableCellWithIdentifier:", CFSTR("CELL"));
  if (!v7)
  {
    v7 = -[BuddySetupTableViewCell initWithStyle:reuseIdentifier:]([BuddySetupTableViewCell alloc], "initWithStyle:reuseIdentifier:", 0, CFSTR("CELL"));

  }
  -[SetupChoiceController configureCell:atIndexPath:](v10, "configureCell:atIndexPath:", v7, v8);
  v5 = v7;
  objc_storeStrong(&v7, 0);
  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
  return v5;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v5;
  double v6;
  double v7;
  id v8;
  double v9;
  double v10;
  id v11;
  double v12;
  id v14;
  id location[2];
  SetupChoiceController *v16;
  double v17;

  v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v14 = 0;
  objc_storeStrong(&v14, a4);
  v5 = -[SetupChoiceController tableView:cellForRowAtIndexPath:](v16, "tableView:cellForRowAtIndexPath:", location[0], v14);
  objc_msgSend(v5, "systemLayoutSizeFittingSize:", UILayoutFittingCompressedSize.width, UILayoutFittingCompressedSize.height);
  v7 = v6;
  v8 = +[BFFStyle sharedStyle](BFFStyle, "sharedStyle");
  objc_msgSend(v8, "tallRowHeight");
  v10 = v9;

  if (v7 <= v10)
  {
    v11 = +[BFFStyle sharedStyle](BFFStyle, "sharedStyle");
    objc_msgSend(v11, "tallRowHeight");
    v17 = v12;

  }
  else
  {
    v17 = UITableViewAutomaticDimension;
  }
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);
  return v17;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v5;
  id location[2];
  SetupChoiceController *v7;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5 = 0;
  objc_storeStrong(&v5, a4);
  -[SetupChoiceController setSelectedChoiceIndex:](v7, "setSelectedChoiceIndex:", objc_msgSend(v5, "row"));
  if (-[SetupChoiceController wantsNextButton](v7, "wantsNextButton"))
    objc_msgSend(location[0], "deselectRowAtIndexPath:animated:", v5, 1);
  else
    -[SetupChoiceController checkChoiceValid](v7, "checkChoiceValid");
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  BuddyAppleIDTableHeaderView *v4;
  id location[2];
  SetupChoiceController *v7;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = v7->_serviceFooterView;
  objc_storeStrong(location, 0);
  return v4;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  UITableView *v4;
  double v5;
  uint64_t v6;
  uint64_t v7;
  UITableView *v8;
  double v9;
  BuddyAppleIDTableHeaderView *serviceFooterView;
  double v11;
  double v12;
  double v13;
  id location[2];
  SetupChoiceController *v16;
  double v17;

  v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (v16->_serviceFooterView)
  {
    v4 = -[BuddyTableViewController tableView](v16, "tableView");
    -[UITableView separatorInset](v4, "separatorInset");
    -[BuddyAppleIDTableHeaderView setLeftPadding:](v16->_serviceFooterView, "setLeftPadding:", v5);

    if ((BFFIsiPad(v6, v7) & 1) == 0)
    {
      v8 = -[BuddyTableViewController tableView](v16, "tableView");
      -[UITableView separatorInset](v8, "separatorInset");
      -[BuddyAppleIDTableHeaderView setRightPadding:](v16->_serviceFooterView, "setRightPadding:", v9);

    }
    serviceFooterView = v16->_serviceFooterView;
    objc_msgSend(location[0], "bounds");
    sub_1000B3B90();
    -[BuddyAppleIDTableHeaderView sizeThatFits:](serviceFooterView, "sizeThatFits:", v11, v12);
    v17 = v13;
  }
  else
  {
    v17 = UITableViewAutomaticDimension;
  }
  objc_storeStrong(location, 0);
  return v17;
}

- (id)viewForFooterInTableView:(id)a3
{
  BuddyAppleIDLinkView *v3;
  id location[2];
  SetupChoiceController *v6;

  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v6->_learnMoreView;
  objc_storeStrong(location, 0);
  return v3;
}

- (double)heightForFooterInTableView:(id)a3
{
  UITableView *v3;
  double v4;
  BuddyAppleIDLinkView *learnMoreView;
  double v6;
  double v7;
  double v8;
  double v9;
  id location[2];
  SetupChoiceController *v12;

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[BuddyTableViewController tableView](v12, "tableView");
  -[UITableView separatorInset](v3, "separatorInset");
  -[BuddyAppleIDLinkView setSidePadding:](v12->_learnMoreView, "setSidePadding:", v4);

  if (v12->_learnMoreView)
  {
    learnMoreView = v12->_learnMoreView;
    objc_msgSend(location[0], "bounds");
    sub_1000B3B90();
    -[BuddyAppleIDLinkView sizeThatFits:](learnMoreView, "sizeThatFits:", v6, v7);
    v9 = v8 + 40.0;
  }
  else
  {
    v9 = 0.0;
  }
  objc_storeStrong(location, 0);
  return v9;
}

- (NSArray)choices
{
  return self->_choices;
}

- (SetupChoice)selectedChoice
{
  return (SetupChoice *)objc_loadWeakRetained((id *)&self->_selectedChoice);
}

- (BFFFlowItemDelegate)delegate
{
  return (BFFFlowItemDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (double)choiceButtonsBottomInset
{
  return self->_choiceButtonsBottomInset;
}

- (void)setChoiceButtonsBottomInset:(double)a3
{
  self->_choiceButtonsBottomInset = a3;
}

- (UIButton)primaryChoiceButton
{
  return self->_primaryChoiceButton;
}

- (UIButton)secondaryChoiceButton
{
  return self->_secondaryChoiceButton;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_selectedChoice);
  objc_storeStrong((id *)&self->_choices, 0);
  objc_storeStrong((id *)&self->_secondaryChoiceButton, 0);
  objc_storeStrong((id *)&self->_primaryChoiceButton, 0);
  objc_storeStrong((id *)&self->_learnMoreView, 0);
  objc_storeStrong((id *)&self->_serviceFooterView, 0);
}

@end
